#!/usr/bin/env python3

import os
import argparse 
parser = argparse.ArgumentParser(description='GIT modify')
parser.add_argument('dir', type=str, help='Input dir ')
args = parser.parse_args()
print(args.dir)
bash_command = ["cd " +args.dir , "git status"]
result_os = os.popen(' && '.join(bash_command)).read()

for result in result_os.split('\n'):
    if result.find('изменено') != -1:
        prepare_result = result.replace('\изменино:   ', '')
        print(prepare_result)

