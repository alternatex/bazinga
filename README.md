Bazinga
=============

A commandline configuration utility 

Prerequisites
-------------
**OS:** Unix

Installation 
-------------

**Fetch sources**
[Download](https://github.com/alternatex/bazinga/archive/master.zip) and extract to:
/usr/bin/bazinga

**Update environment variables**

```bash
BAZINGAPATH=$(cat <<'BAZINGAPATH'    

# Bazinga
export PATH=/usr/bin/bazinga/bin:$PATH

BAZINGAPATH
)
echo "$BAZINGAPATH" >> ~/.zshrc
```

Usage
-------------

**One for all**

```bash
bazinga
```

Defaults
-------------

-

License
-------------
Released under two licenses: new BSD, and MIT. You may pick the
license that best suits your development needs.

https://github.com/alternatex/bazinga/blob/master/LICENSE