#!/bin/bash
ver="1.1"

sudo cp ../pkggen /usr/local/bin/

sudo chown root:wheel /usr/local/bin/pkggen

sudo ../pkggen -i tk.unstac.pkggen -v "$ver" files out.pkg
sudo chown administrator:staff out.pkg
mv out.pkg "pkggen-$ver.pkg"
