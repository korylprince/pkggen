pkggen
<https://github.com/korylprince/pkggen>

There are lots of ways to build pkgs on OS X, but none of them are simple. Or if they are they can't do what I want. My idea of the best pkg make is one that can take a list of files (not just a root), an identifier, a version, and optionally post/preinstall scripts and generate one flat pkg. That's what pkggen does.

#Setup#
You must be running OS X with python (2 or 3), cpio, pkgutil, mkbom. (If someone wishes to port mkbom to another platform, it would be easy to make it work there.) I know it works for Lion.

Create a file with a list of files separated by a newline you want in your pkg. They can be anywhere on the filesystem. Lines preceded with `#` are ignored. Whitespace is stripped. If you specify a directory then all files below the tree will be included. I don't know what happens if you specify a symlink or a device as that hasn't become one of my needs yet. Just put the path to actual file.

If you use scripts, make sure they exit 0 on success (this is needed for all pkgs, not just ones made with pkggen.)

You should probably run this with root if you're having weird problems (check the code first - I don't do anything crazy or malicious.)

#Usage#

    $ ./pkggen -h                                                                                                                *[master] 
    usage: pkggen [-h] -i IDENTIFIER [-v VERSION] [--preinstall script_path]
                  [--postinstall script_path] [--warn-only]
                  files_list output

    An OS X pkg generator

    positional arguments:
      files_list            path to file containing a list of files to be included
                            separated by newlines
      output                filename of output pkg

    optional arguments:
      -h, --help            show this help message and exit
      -i IDENTIFIER, --identifier IDENTIFIER
                            identifier set for the pkg
      -v VERSION, --version VERSION
                            version for for the pkg. (will be 0 if not given)
      --preinstall script_path
                            path to preinstall script
      --postinstall script_path
                            path to postinstall script
      --warn-only           only warn when encountering an error if possible


If you have any issues or questions (or want to make it better), email the email address below, or open an issue at: <https://github.com/korylprince/pkggen/issues>

#pkg layout#

A simple pkg will have the following elements (run `pkgutil --expand /path/to/pkg /path/to/extract/to`):

* Bom - A Bill of Materials - this is an Apple propretary file. We generate this with appropriate input and `mkbom`
* Payload - A gzipped cpio archive of all the files listed in the Bom
* Scripts folder - optional folder containing preinstall and postinstall scripts
* PackageInfo - an xml file describing the package (version, indentifier, etc) as well as the scripts that should run

These components can be put into a package with `pkgutil --flatten /path/to/pkg/root /path/to/new/pkg`.

This is my simple understanding of it all. There's much more to it, but for simple packages like those made with pkggen, it's all you need to know.

#Caveats#

This code isn't heavily tested yet. I don't know what things like including symlinks will necessarily do. Make sure to test it first. I provide no warranty. The code also isn't commented. At all. I think most of it is pretty straightforward.

I would love if someone wanted to build on the project. Send a pull request.

#Copyright Information#
Copyright 2013 Kory Prince (korylprince AT gmail DAWT com).

License is BSD.
