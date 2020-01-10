#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# vim: expandtab shiftwidth=4 softtabstop=4
#
import sys

try:
    import owncloud
except ImportError:
    sys.stderr.writelines([
        'This script requires pyocclient: https://github.com/owncloud/pyocclient\n',
        'You can set PYTHONPATH to point to a local checkout of pyocclient using:\n',
        '  export PYTHONPATH=/path/to/pyocclient\n'
    ])
    sys.exit(2)

#
# See https://github.com/owncloud/enterprise/issues/3701 for an explanation about the letters and tuples
#
# The following letters are used as symbols for the different share kind axes:
#
# - direction:
#     - I: incoming
#     - O: outgoing
# - recipient type:
#     - U: user, group, link, guest, federated share (for now).
#     - L: link share. (there is no IL incoming link share)
# - inheritance:
#     - P: parent / direct share
#     - C: child: share entry exists on one of the parents
#
# - possible combinations:
#     - IUP: incoming user share on current resource
#     - IUC: incoming user share exists on a parent resource
#     - ILP: no incoming link shares possible
#     - ILC: no incoming link shares possible
#     - OUP: outgoing user share on current resource
#     - OUC: outgoing user share exists on a parent resource
#     - OLP: outgoing link share on current resource
#     - OLC: outgoing link share exists on a parent resource
#
# - every resource can have multiple combinations of the above, without repetition:
#     - for example: IUC, OUP, OLP means "incoming user share exists on a parent resource, the current resource has been shared by the current user to the outside with user share and link share"
#     - we don't repeat a tuple of letters here because "U" or "L" mean that at least one share of the given type exists
#     - maximum set that a resource can have: IUP, IUC, OUP, OUC, OLP, OLC
#

# TODO: get vars from command line arguments and/or files

Config  = {
    'owncloud_url': 'http://localhost/owncloud',
    'owncloud_login': "admin",
    'owncloud_password': "admin",
    'users': [
        ["alice", "Alice"],
        ["bob", "Bob"],
        ["charlie", "Charlie"],
        ["dave", "Dave"],
    ],
    'users_password': 'test'
}

KIND_DESCRIPTIONS = {
    'IUP': 'incoming user share on current resource',
    'IUC': 'incoming user share exists on a parent resource',
    'OUP': 'outgoing user share on current resource',
    'OUC': 'outgoing user share exists on a parent resource',
    'OLP': 'outgoing link share on current resource',
    'OLC': 'outgoing link share exists on a parent resource',
}

def setup_users(users):
    # Setup users
    print("\n### Setting up users ###")
    for (user_id, user_display_name) in users:
        try:
            print("Deleting user \"%s\"" % user_id)
            client.delete_user(user_id)
        except:
            pass
        print("Creating user \"%s\"" % user_id)
        client.create_user(user_id, Config['users_password'])
        # TODO: how to set display name ?

client = owncloud.Client(Config['owncloud_url'])

def login_as_user(user_id):
    client.logout()
    print("Logging in as user \"%s\"" % user_id)
    client.login(user_id, Config['users_password'])

def make_folder(final_path):
    path = []
    for section in final_path.split('/'):
        path.append(section)
        try:
            client.mkdir('/'.join(path))
        except:
            # might already exist
            pass


def generate_sub_shares(share_entry):
    print('Generating sub-shares for: ', share_entry)
    shares = []
    base_tuple = []
    if ('IUP' in share_entry['kinds']):
        base_tuple.append('IUC')
    if ('OLP' in share_entry['kinds']):
        # outgoing link share through parent
        base_tuple.append('OLC')

    if ('OUP' in share_entry['kinds']):
        # outgoing user share through parent
        base_tuple.append('OUC')

    # add all combinations of outgoing 'OUP', 'OLP'
    sub_kinds = [
        tuple(base_tuple), # no reshares
        tuple(base_tuple + ['OUP']),
        tuple(base_tuple + ['OLP']),
        tuple(base_tuple + ['OUP', 'OLP'])
    ]

    for kinds in sub_kinds:
        base_path = share_entry['path'] + '/' + share_entry['base_path'] + '-sub'
        target_user = 'charlie'
        if 'charlie' in share_entry['path']:
            # already shared to charlie, need to share to dave then
            target_user = 'dave'

        has_shares = False
        has_link = False
        if 'OUP' in kinds:
            has_shares = True
            base_path += '-bob2' + target_user 
        if 'OLP' in kinds:
            has_shares = True
            base_path += '+link'

        path = base_path + ' (%s)' % ', '.join(kinds)

        if 'OUP' in kinds:
            shares.append({
                'path': path,
                'with': target_user,
                'type': 'user',
                'kinds': kinds
            })

        if 'OLP' in kinds:
            shares.append({
                'path': path,
                'type': 'link',
                'kinds': kinds
            })

        if not has_shares:
            # add dummy share just to create folder
            shares.append({
                'path': path,
                'type': 'dummy',
                'kinds': kinds
            })

    return shares

def generate_shares():
    print("\n### Preparing share entries ###")
    shares = {}
    shares['alice'] = []
    shares['bob'] = []

    # see file header for explanation about letters
    alice_kinds = [
        # all combinations of 'IUP', 'OUP', 'OLP' all starting with 'IUP'
        ('IUP',),
        ('IUP', 'OUP'),
        ('IUP', 'OLP'),
        ('IUP', 'OUP', 'OLP')
    ]

    for kinds in alice_kinds:
        user_chain = ['alice']
        has_link = False
        if 'IUP' in kinds or 'OUP' in kinds:
            user_chain.append('bob')
        if 'OUP' in kinds:
            user_chain.append('charlie')
        if 'OLP' in kinds:
            has_link = True

        for i in range(0, len(user_chain) - 1):
            user_from = user_chain[i]
            user_to = user_chain[i + 1]

            base_path = '2'.join(user_chain)
            if (has_link):
                base_path += '+link'
            path = base_path + ' (%s)' % ', '.join(kinds)

            share_entry = {
                'base_path': base_path,
                'path': path,
                'type': 'user',
                'with': user_to,
                'kinds': kinds
            }

            print("Generating share entry from \"%s\": " % user_from, share_entry)
            shares[user_from].append(share_entry)

            if has_link:
                link_share_entry = {
                    'path': path,
                    'type': 'link',
                    'kinds': kinds
                }
                print("Generating share entry from \"%s\": " % 'bob', link_share_entry)
                shares['bob'].append(link_share_entry)

            if user_to == 'bob':
                sub_share_entries = generate_sub_shares(share_entry)
                for sub_share_entry in sub_share_entries:
                    print("Generating share entry from \"%s\": " % 'bob', sub_share_entry)
                    shares['bob'].append(sub_share_entry)

    bob_extra_entries = [{
        'base_path': 'bob2charlie',
        'path': 'bob2charlie (OUP)',
        'type': 'user',
        'with': 'charlie',
        'kinds': ('OUP',)
    }, {
        'base_path': 'bob2charlie+link',
        'path': 'bob2charlie+link (OUP, OLP)',
        'type': 'user',
        'with': 'charlie',
        'kinds': ('OUP', 'OLP')
    }, {
        'base_path': 'link',
        'path': 'link (OLP)',
        'type': 'link',
        'kinds': ('OLP',)
    }]

    shares['bob'] += bob_extra_entries
    for share_entry in bob_extra_entries:
        sub_share_entries = generate_sub_shares(share_entry)
        for sub_share_entry in sub_share_entries:
            print("Generating share entry from \"%s\": " % 'bob', sub_share_entry)
            shares['bob'].append(sub_share_entry)

    shares['bob'].append({
        'base_path': 'bob2charlie+link',
        'path': 'bob2charlie+link (OUP,OLP)',
        'type': 'link',
        'kinds': ('OUP', 'OLP')
    })

    return shares

def create_all_shares(share_entries):
    print("\n### Creating all shares ###")
    for user_id, share_entries in share_entries.items():
        login_as_user(user_id)
        for share_entry in share_entries:
            make_folder(share_entry['path'])
            if share_entry['type'] == 'link':
                print("Sharing \"%s\" by \"%s\" with link" % (share_entry['path'], user_id))
                client.share_file_with_link(share_entry['path'], perms=31) 
            elif share_entry['type'] == 'user':
                print("Sharing \"%s\" from \"%s\" with user \"%s\"" % (share_entry['path'], user_id, share_entry['with']))
                client.share_file_with_user(share_entry['path'], share_entry['with'], perms=31) 
            else:
                print("Created \"%s\"" % (share_entry['path']))

def print_folder_tree():
    print("\n### Results ###")
    login_as_user('bob')
    print('Bob\'s tree: ')

    sub_listings = []
    listing = client.list('/')
    for entry in listing:
        if entry.is_dir():
            # only going deep one level as there is only one level generated
            sub_listing = client.list(entry.get_path())
            sub_listing = list(map(lambda sub_entry: sub_entry.get_path(), sub_listing))
            sub_listings += sub_listing

    listing = list(map(lambda entry: entry.get_path(), listing))
    listing += sub_listings
    listing.sort()

    for entry in listing:
        print('- %s' % entry)

def describe_kind(kind_string):
    description = [] 
    for kind in kind_string.split(','):
        description.append(KIND_DESCRIPTIONS[kind.strip()])

    return ', '.join(description)

def print_kinds_summary(share_entries):
    print("\n### Kinds summary ###")
    kinds = []
    for user_id, share_entries in share_entries.items():
        kinds += list(map(lambda entry: ', '.join(entry['kinds']), share_entries))
    kinds.sort()
    # remove duplicates
    kinds = list(dict.fromkeys(kinds))

    for kind in kinds:
        #print('- ', kind, ' - ', describe_kind(kind))
        print('-', kind)

def print_legend():
    print("\n### Kinds legend ###")
    for kind, description in KIND_DESCRIPTIONS.items():
        print('- %s: %s' % (kind, description))

def main():

    if len(sys.argv) <= 3:
        sys.stderr.writelines([
            'This script connects to an ownCloud instance\n',
            'and creates four users alice, bob, charlie and dave\n',
            'and also creates shares from alice to bob, and bob to charlie and dave, including public links\n',
            '\n'
            'Its aim is to create all possible combinations of shares, reshares and link shares\n'
            '\n'
            'Syntax: %s http://hostname/path/to/owncloud owncloud_admin_login owncloud_admin_password\n' % sys.argv[0]
        ])
        sys.exit(1)

    Config['owncloud_url'] = sys.argv[1]
    Config['owncloud_login'] = sys.argv[2]
    Config['owncloud_password'] = sys.argv[3]

    client.login(Config['owncloud_login'], Config['owncloud_password'])

    setup_users(Config['users'])
    shares = generate_shares()
    create_all_shares(shares)
    print_folder_tree()
    print_kinds_summary(shares)
    print_legend()

if __name__ == '__main__':
    main()

