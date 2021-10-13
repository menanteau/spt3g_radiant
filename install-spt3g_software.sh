mkdir -p /opt/spt

# Build the spt3g software
mkdir ~/tmp
cp -pr /home/felipe/spt3g_software ~/tmp/spt3g_software
cd ~/tmp
mkdir build
cd build
cmake ..
make
./env-shell.sh make docs
