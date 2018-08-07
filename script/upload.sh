#!/bin/sh

if [ ! -d build -o ! -d script -o ! -d src ]; then
    echo "ERROR: This script must be invoked from ml-console-web root dir."
    exit 1;
fi

scp -rp build/* servlex@mlconsole.org:/var/www/mlconsole/htdocs
