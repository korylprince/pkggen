#!/bin/bash
ver="1.0"

sudo cp ../pkggen /usr/bin/

sudo chown root:wheel /usr/bin/pkggen

sudo ../pkggen -i tk.unstac.pkggen -v "$ver" files out.pkg
sudo chown administrator:staff out.pkg
mv out.pkg "pkggen-$ver.pkg"
