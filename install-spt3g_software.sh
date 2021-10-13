mkdir -p /opt/spt

# Enable devtoolset
scl enable devtoolset-9 bash

# Build the spt3g software
cp -pr /home/felipe/spt3g_software /opt/spt/spt3g_software
cd /opt/spt/spt3g_software
mkdir build
cd build
cmake ..
make
./env-shell.sh make docs
