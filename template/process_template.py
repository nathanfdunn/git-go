from os.path import join

winDict = {
	'preamble' : '''
@ECHO OFF
git rev-parse --is-inside-work-tree 2> NUL 1> NUL
IF ERRORLEVEL 128 goto notinrepo
echo Script should not be executed from within git repository. Exiting . . .
exit /b 1
:notinrepo
IF NOT EXIST git_demo_folder goto next
echo y | rmdir /s git_demo_folder 1> NUL
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
git rev-parse --is-inside-work-tree 2> /dev/null 1> /dev/null
if [ $? -ne 128 ]; then 
echo Script should not be executed from within git repository. Exiting . . .
exit 1; fi
function pause(){ read -n1 -r -p "Press any key to continue . . . " key; }
if [ -d git_demo_folder ]; then rm -rf git_demo_folder; fi
set -v
	'''.strip(),
	'rem' : '##',
	'sep' : '/',
	'cat' : 'cat'
}

with open('git-go.template') as f:
	template = f.read()

with open(join('..', 'git-go.bat'), 'w') as f:
	f.write(template.format(**winDict))

with open(join('..', 'git-go.sh'), 'w') as f:
	f.write(template.format(**nixDict))
