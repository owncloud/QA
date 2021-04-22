import hcloud
import sys
import json
import threading
import time
import random
import argparse
import paramiko
import requests

class makeMachine:

    max_threads = 2
    current_working_threads = []
    lock = threading.Lock()

    def __init__(self, configFile=None, ssh_key=None):
        random.seed(int(str(time.time()).split('.')[0]))
        if configFile:
            self.load_config(configFile)
        else:
            print('No config File set. exit')
            sys.exit(1)

        for server in self.config['machines']:
            while True:
                if len(self.current_working_threads) < self.max_threads:
                    threading.Thread(target=self.worker, args=(self.config['api-key'], self.config['owner-tag'], server, self.create_thread_id(), ssh_key)).start()
                    break
                else:
                    time.sleep(1)
        while True:
            if len(self.current_working_threads) > 0:
                time.sleep(1)
            else:
                break
        print('finished')

    def load_config(self, configFile):
        with open(configFile, 'rb') as reader:
            config = json.loads(reader.read().decode('utf_8'))
        self.check_config(config)
        self.config = config

    def create_thread_id(self):
        while True:
            id = ''
            for i in range(0, 10):
                id = f'{id}{random.randint(0, 9)}'
            if id not in self.current_working_threads:
                return id

    def check_config(self, config):
        #check api key
        if 'api-key' in config.keys():
            if not config['api-key']:
                print(f'No machine building without a api-key')
                sys.exit(1)
        else:
            print('key "api-key" not found in config. exit')
            sys.exit(1)

        #check ownwer tag
        if 'owner-tag' in config.keys():
            if not config['owner-tag']:
                print(f'No machine building without a owner-tag')
                sys.exit(1)
        else:
            print('key "owner-tag" not found in config. exit')
            sys.exit(1)

        # check machines config
        if 'machines' in config.keys():

            for machine in config['machines']:

                #check server name
                if 'server-name' in machine.keys():
                    if not machine['server-name']:
                        print(f'No machine building without a server name')
                        sys.exit(1)
                else:
                    print(f'key "server-name" in machine config not found. exit')

                #check server type
                if 'server-type' in machine.keys():
                    if not machine['server-type']:
                        print(f'No machine building without a server type')
                        sys.exit(1)
                else:
                    print(f'key "server-type" in machine config not found. exit')

                #check image
                if 'image' in machine.keys():
                    if not machine['image']:
                        print(f'No machine building without a image')
                        sys.exit(1)
                else:
                    print(f'key "image" in machine config not found. exit')

                #check ssh keys
                if 'ssh-keys' in machine.keys():
                    if not machine['ssh-keys']:
                        print(f'No machine building without ssh-keys (min. 1)')
                        sys.exit(1)
                    if type(machine['ssh-keys']) != type([]):
                        print(f'ssh-keys data format wrong. must be a list')
                        sys.exit(1)
                else:
                    print(f'key "ssh-keys" in machine config not found. exit')
                    sys.exit(1)

                #check location
                if 'location' not in machine.keys():
                    print(f'key "location" in machine config not found. exit')
                    sys.exit(1)

                #check datacenter
                if 'datacenter' not in machine.keys():
                    print(f'key "datacenter" in machine config not found. exit')
                    sys.exit(1)

    def safe(self):
        with open('./hetzner/dummy2.cfg', 'wb') as writer:
            writer.write(json.dumps(self.config).encode('utf_8'))

    def worker(self, api_key, owner_tag, server_dict, thread_id, ssh_key):
        with self.lock:
            self.current_working_threads.append(thread_id)
            print('starting server creation')
        client = hcloud.Client(token=api_key, application_name='make_machine.py', application_version='v0.1.alpha')

        client.servers.create(
            name=server_dict['server-name'],
            server_type=self.get_server_type(hetznerClient=client, name=server_dict['server-type']),
            image=self.get_image(hetnerClient=client, name=server_dict['image']),
            ssh_keys=self.get_ssh_keys(hetznerClient=client, names=server_dict['ssh-keys']),
            volumes=None,
            networks=None,
            user_data=None,
            labels=self.make_labels(ownerTag=owner_tag, labels=server_dict['labels']),
            location=self.get_location(hetznerClient=client, location=server_dict['location']),
            datacenter=self.get_datacenter(hetznerClient=client, datacenter=server_dict['datacenter']),
            start_after_create=server_dict['start_after_create'],
            automount=server_dict['automount']
        )
        x = 0
        while client.servers.get_by_name(name=server_dict['server-name']).data_model.status != 'running':
            time.sleep(0.5)

        print('server created')
        print('running scripts')
        print(client.servers.get_by_name(name=server_dict['server-name']).data_model.public_net.ipv4.ip)
        scripts = ['./scripts/test_script.py']
        self.run_script_on_machine(
            machine=client.servers.get_by_name(name=server_dict['server-name']).data_model.public_net.ipv4.ip,
            ssh_key=ssh_key,
            scripts=scripts
        )
        print('deleting machine')
        #self.delete_machine(hetznerClient=client, machine_name=server_dict['server-name'])
        with self.lock:
            del(self.current_working_threads[self.current_working_threads.index(thread_id)])
            print('server creation finished')

    def delete_machine(self, hetznerClient, machine_name):
        hetznerClient.servers.get_by_name(machine_name).delete()
        print('server deleted')

    def script_loader(self, script_url):
        if script_url.startswith('.') or script_url.startswith('/'):
            return script_url
        if 'https://github.com/' in script_url:
            script_url.replace('https://github.com', 'https://raw.githubusercontent.com')
        print(script_url)
        filename = str(script_url).split("/")[len(str(script_url).split("/")) - 1]
        print(filename)
        result = requests.get(script_url, allow_redirects=True)
        with open(f'../../../../scripts/{filename}', 'wb') as writer:
            writer.write(result.content)
            return f'./scripts/{filename}'

    def run_script_on_machine(self, machine, ssh_key, scripts):
        ssh_client = paramiko.SSHClient()
        ssh_client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        key = paramiko.RSAKey.from_private_key_file(ssh_key)
        print(f'connecting to server {machine} ...')
        max_trys = 10
        connected = False
        while True:
            try:
                time.sleep(1)
                ssh_client.connect(hostname=machine, username='root', pkey=key)
                connected = True
                break
            except Exception as e:
                if 'Authentication failed' in e.__str__():
                    print('Authentication failed. exit')
                    break
                if 'Unable to connect to port' in e.__str__():
                    max_trys -= 1
                if max_trys == 0:
                    print('Unable to connect to Server. exit')
                    break
        if connected:
            print('connection established')
            for script in scripts:
                script_local = self.script_loader(script)
                print('open sftp connection')
                sftp = ssh_client.open_sftp()
                sftp.put(script_local, f'/root/{str(script_local).split("/")[len(str(script_local).split("/")) - 1]}')
                sftp.close()
                stdin, stdout, stderr = ssh_client.exec_command('python3 /root/test_script.py')
                for line in stdout.readlines():
                    print(line.strip('\n'))
        else:
            print('connection to server failed')

    def get_server_type(self, hetznerClient, name):
        if not hetznerClient.server_types.get_by_name(name):
            print(f'server Type << {name} >> not found. exit')
            sys.exit(1)
        else:
            return hetznerClient.server_types.get_by_name(name)

    def get_image(self, hetnerClient, name):
        for image in hetnerClient.images.get_all():
            if str(image.data_model.description) == str(name):
                return image
        print(f'image << {name} >> not found. exit')
        sys.exit(1)

    def get_ssh_keys(self, hetznerClient, names):
        return_list = []
        for name in names:
            for key in hetznerClient.ssh_keys.get_all():
                if key.data_model.name == name:
                    return_list.append(key)
                    print(key.data_model.name)
        return return_list

    def make_labels(self, ownerTag, labels):
        if type(labels) == type({}):
            labels['owner'] = ownerTag
            return labels
        else:
            print('wrong format for labels. need a dict. exit')
            sys.exit(1)

    def get_location(self, hetznerClient, location=None):
        if location:
            return hetznerClient.locations.get_by_name(location)
        else:
            return None

    def get_datacenter(self, hetznerClient, datacenter=None):
        if datacenter:
            return hetznerClient.datacenters.get_by_name(datacenter)
        else:
            return None

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-c', default=None, action='store', help='Set the config file for running')
    parser.add_argument('-k', default=None, action='store', help='Set the ssh-key file')
    args = parser.parse_args()
    makeMachine(args.c, args.k)