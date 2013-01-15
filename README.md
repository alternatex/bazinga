Bazinga
=============

A commandline configuration utility 

Prerequisites
-------------
Unix-OS

Installation 
-------------

You can install this through [shinst](https://github.com/alternatex/shinst):

`shinst install alternatex/bazinga`

Bootstrap
-------------

### .bazingac/configure.sh

```bash
#!/bin/bash

bazinga_directory=".bazingac"
bazinga_protect=".htaccess"
bazinga_configure="configure.sh"
bazinga_namespace="bazinga_"
bazinga_custom=".bazingac/settings.sh"
bazinga_custom_json="settings.json"

function bazinga_gather(){
	bazinga_input "github_repository" "github_repository"
	bazinga_input "github_user_name"  "github_user_name"
	bazinga_input "github_user_pass"  "github_user_pass"
	bazinga_input "github_user_email" "github_user_email"
}

function bazinga_postprocess(){
	echo "machine github.com" 			>> 	~/.netrc
	echo "login ${github_user_name}" 	>> 	~/.netrc
	echo "password ${github_user_pass}" >> 	~/.netrc
}
```

### Execution
1. load settings
2. edit settings
3. store settings
4. post-process settings w/externals (~/.netrc creation, ...)

Usage
-------------

```bash
bazinga
```

Changelog
-------------
**1.1.0:**<br/>
* installation through `shinst` 

Roadmap
-------------
- auto-update
- custom directory 

License
-------------
Released under two licenses: new BSD, and MIT. You may pick the
license that best suits your development needs.

https://github.com/alternatex/bazinga/blob/master/LICENSE