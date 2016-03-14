from os.path import join

winDict = {
	'preamble' : '''
@ECHO OFF
IF NOT EXIST git_demo_folder goto next
rmdir git_demo_folder
:next
@ECHO ON
	'''.strip(),
	'rem' : '::',
	'sep' : '\\',
	'cat' : 'type'
}

nixDict = {
	'preamble' : '''
#!/usr/bin/env bash
function pause(){ read -n1 -r -p "Press any key to continue . . . " key; }
if [ -d git_demo_folder ]; then rmdir git_demo_folder; fi
set -v
	'''.strip(),
	'rem' : ' #',
	'sep' : '/',
	'cat' : 'cat'
}

with open('git-go.template') as f:
	template = f.read()

with open(join('..', 'git-go.bat'), 'w') as f:
	f.write(template.format(**winDict))

with open(join('..', 'git-go.sh'), 'w') as f:
	f.write(template.format(**nixDict))
