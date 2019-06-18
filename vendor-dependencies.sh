#!/usr/bin/env bash
set -e

echo '###########################################'
echo 'Installing Dependencies From conda-forge...'
echo '###########################################'

sed -i 's:/tmp/app/vendor:conda-forge:' environment.yml
conda env update -n example-app-env -q -f environment.yml
sed -i 's:conda-forge:/tmp/app/vendor:' environment.yml

echo '###########################################'
echo 'Activating example-app-env conda environment...'
echo '###########################################'

# for some reason, running conda activate in a shell script requires some
# conda setup before we activate
source /opt/conda/etc/profile.d/conda.sh
conda activate example-app-env

echo '##################################################'
echo 'Downloading archives for local conda repository...'
echo '##################################################'

conda list --explicit | grep linux-64/ > linux-64-deps.txt
wget -P vendor/linux-64 --no-verbose -i linux-64-deps.txt
rm linux-64-deps.txt

conda list --explicit | grep noarch/ > noarch-deps.txt
wget -P vendor/noarch --no-verbose -i noarch-deps.txt
rm noarch-deps.txt

echo '#########################'
echo 'Installing conda-build...'
echo '#########################'

conda activate base
conda install conda-build --yes -q

echo '############################################'
echo 'Building conda index for local repository...'
echo '############################################'

conda index vendor
