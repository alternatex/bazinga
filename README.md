Bazinga
=============

A commandline configuration utility 

Prerequisites
-------------
**OS:** Unix

Installation 
-------------

You can install this via the command line with either `curl` or `wget`.

via `curl`

`curl -L https://github.com/alternatex/bazinga/raw/master/install.sh | sh`

via `wget`

`wget --no-check-certificate https://github.com/alternatex/bazinga/raw/master/install.sh -O - | sh`

Methodology
-------------
Checks for existance o directory `.bazinga` within the current working directory. 

### Bootstrap 

**- { 1 : 4 : ∞ } -**

Create directory .bazinga with defaults:

**configure.sh**
```bash
#!/usr/bin/env bash

bazinga_directory=".bazinga"
bazinga_protect=".htaccess"
bazinga_configure="configure.sh"
bazinga_namespace="bazinga_"
bazinga_custom=".bazinga/settings.sh"
bazinga_custom_json="settings.json"

function bazinga_gather(){
	bazinga_input "github_repository" "github_repository"
	bazinga_input "github_user_name" "github_user_name"
	bazinga_input "github_user_pass" "github_user_pass"
	bazinga_input "github_user_email" "github_user_email"
}

function bazinga_postprocess(){
	echo "machine github.com" >> ~/.netrc
	echo "login ${github_user_name}" >> ~/.netrc
	echo "password ${github_user_pass}" >> ~/.netrc
}
```
**settings.sh**
```bash
#!/usr/bin/env bash

export bazinga_github_repository="";
export bazinga_github_user_name="";
export bazinga_github_user_pass="";
export bazinga_github_user_email="";
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

Roadmap
-------------
- auto-update
- custom directory 

License
-------------
Released under two licenses: new BSD, and MIT. You may pick the
license that best suits your development needs.

https://github.com/alternatex/bazinga/blob/master/LICENSE