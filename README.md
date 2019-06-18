# Vendoring Conda dependencies for PCF

This repo is an simple example of what to do if vendoring is needed to support an enviroment that doesn't have access to Conda Forge. *Note that whatever environment you are vendoring in will need access to Conda Forge.*

## Running

To use this example, log into PCF and run `build-and-deploy.sh`. This will boot up a Docker container to vendor the dependencies and then `cf push`.

## Known issues

* The shell script has some hardcoded paths for the Miniconda enviroment present on the Docker image.
* `sed` commands will only work under GNU Sed. BSD Sed (aka macOS) will require an arg, ie `''`, after `-i`.
* This solution has only been tested with `linux-64` dependencies.

## See also

* [Vendoring your own packages](`https://github.com/ihuston/conda-channels-on-cf`)
