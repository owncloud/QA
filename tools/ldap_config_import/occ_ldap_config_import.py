#! /usr/bin/python3
#
# v0.1 -- 2021-07-21, jw        initial draught


import os, sys, re, json
import argparse, shutil

__version__ = '0.1'

parser = argparse.ArgumentParser(description='Parse output of occ ldap:show-config and generate occ commands to recreate the same config.')
parser.add_argument('infile', metavar='FILE', type=str, help='input file')
parser.add_argument('-i', '--input-id', metavar='INPUTID', type=str, help='Configuration ID to be read from the input file. Default: all ')
parser.add_argument('-o', '--output-id', metavar='OUTPUTID', type=str, help='Configuration ID to write. Requires -i. Default: same as input')
parser.add_argument('-p', '--password', metavar='PASSWORD', type=str, help='Value for "ldapAgentPassword". Default: ignore "ldapAgentPassword"')
parser.add_argument('-H', '--host', metavar='HOST', type=str, help='Override value of "ldapHost". Default: as is')
parser.add_argument('-e', '--empty', action='store_true', help='Include empty values. Default: ignore')
args = parser.parse_args()

def quoted(text):
  if re.match('[a-z0-9\.,=_-]+$', text, re.I):
    return text
  return "'" + text + "'"

output_id_used = None
id = None
fd = open(args.infile)
while True:
  line = fd.readline().strip()

  # '| Configuration              | s01                            |'
  m = re.match('\| Configuration\s+\|\s+(.*\S)\s+\|$', line)
  if m:
    id = m.group(1)
    if output_id_used:
      if args.input_id:
        break
      else:
        print("# ERROR: -o does not work with multiple configurations ('%s' and now '%s') -- Try using -i" % (output_id_used, id))
        sys.exit(1)
    continue

  # '| hasMemberOfFilterSupport   |                                |'
  # '| ldapUserFilter             | (|(objectclass=inetOrgPerson)) |'
  # '| ldapUserName               | samaccountname                 |'
  # '| ldapTLS                    | 0                              |'
  m = re.match('\|\s+(\S+)\s+\|\s+(.*?)\s*\|$', line)
  if m and id:
    key = m.group(1)
    val = m.group(2)
    if args.input_id is None or id == args.input_id:
      oid = id
      if args.output_id:
        oid = args.output_id
        output_id_used = id
      if key == 'ldapHost':
        if args.host: val = args.host
      if key == 'ldapAgentPassword':
        if args.password:
          print("occ ldap:set-config %s %s %s" % (oid, key, quoted(args.password)))
      else:
        if val != '' or args.empty:
          print("occ ldap:set-config %s %s %s" % (oid, key, quoted(val)))

  if line == '':
    break

fd.close()
