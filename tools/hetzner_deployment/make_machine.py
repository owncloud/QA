import hcloud
import sys
import json
import threading
import time
import random

class makeMachine:

    max_threads = 2
    current_working_threads = []
    lock = threading.Lock()

    def __init__(self, configFile = None):
        random.seed(int(str(time.time()).split('.')[0]))
        if configFile:
            self.load_config(configFile, mode='normal')
        else:
            print('No config File set')
            sys.exit(1)

        for server in self.config['machines']:
            while True:
                if len(self.current_working_threads) < self.max_threads:
                    threading.Thread(target=self.worker, args=(self.config['api-key'], self.config['owner-tag'], server, self.create_thread_id())).start()
                    #self.worker(self.config['api-key'], self.config['owner-tag'], server)
                    break
                else:
                    time.sleep(1)
        while True:
            if len(self.current_working_threads) > 0:
                time.sleep(1)
            else:
                break
        print('finished')

    def load_config(self, configFile, mode):
        if mode == 'normal':
            with open(configFile, 'rb') as reader:
                config = json.loads(reader.read().decode('utf_8'))
            print(config)
            self.check_config(config)
            self.config = config
        if mode == 'experimental':
            with open(configFile, 'rb') as reader:
                read = ''
                for line in reader.readlines():
                    line = line.replace(b'\n', b'').replace(b'\t', b'').decode('utf-8')
                    if not line.startswith('#'):
                        read = read + line
                    else:
                        print('found line')
            config = json.loads(read)
            sys.exit()

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
        with open('../../../../hetzner/dummy2.cfg', 'wb') as writer:
            writer.write(json.dumps(self.config).encode('utf_8'))

    def worker(self, api_key, owner_tag, server_dict, thread_id):
        with self.lock:
            self.current_working_threads.append(thread_id)
            print('starting server creation')
        client = hcloud.Client(token=api_key, application_name='make_machine.py', application_version='v0.1.alpha')

        client.servers.create(
            name=server_dict['server-name'],
            server_type=self.get_server_type(client, server_dict['server-type']),
            image=self.get_image(client, server_dict['image']),
            ssh_keys=self.get_ssh_keys(client, server_dict['ssh-keys']),
            volumes=None,
            networks=None,
            user_data=None,
            labels=self.make_labels(self.config['owner-tag'], server_dict['labels']),
            location=self.get_location(client, server_dict['location']),
            datacenter=self.get_datacenter(client, server_dict['datacenter']),
            start_after_create=server_dict['start_after_create'],
            automount=server_dict['automount']
        )
        with self.lock:
            del(self.current_working_threads[self.current_working_threads.index(thread_id)])
            print('server creation finished')

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
            if hetznerClient.ssh_keys.get_by_name(name):
                return_list.append(hetznerClient.ssh_keys.get_by_name(name))
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

    def get_datacenter(self, hetznerClient, location=None):
        if location:
            return hetznerClient.datacenters.get_by_name(location)
        else:
            return None


makeMachine('./dummy.cfg')