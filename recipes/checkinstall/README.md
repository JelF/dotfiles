This folder contains files, which could be understood as packages.
They should obey following API:  
* `recipe deps` should echo list of deps, which are exposed by other recipes
* `recipe marker` should return space separated list of files, which
would be updated by installation. This files would be used as make targets
* `recipe install` should completly install application if it is not installed.
It also could update it, if necessary
* `recipe post_install` would be sourced by makefile after install
