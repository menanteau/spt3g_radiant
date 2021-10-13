yum install -y centos-release-scl yum-utils
yum install -y devtoolset-9

yum install -y epel-release
yum install -y wget git fftw fftw-devel gsl gsl-devel gcc-c++  libicu-devel libicu icu
yum install -y which make python3-devel openssl-devel openssl cfitsio bzip2 bzip2-devel
yum install -y flac netcdf flac-devel netcdf-devel

# Enable devtoolset
#/usr/bin/scl enable devtoolset-9
scl enable devtoolset-9 bash

# get pip3
cd /usr/local/src/
curl -o get-pip.py https://bootstrap.pypa.io/get-pip.py
chmod 755 ./get-pip.py
python3 ./get-pip.py

# Get scipy, astropy, etc.
pip3 install scipy astropy numexpr healpy pyyaml sphinx pandas

# Install boost in /usr/local/src
cd /usr/local/src/
mkdir boost
cd boost
curl -L -o boost_1_72_0.tar.gz https://sourceforge.net/projects/boost/files/boost/1.72.0/boost_1_72_0.tar.gz
gunzip boost_1_72_0.tar.gz
tar -xf boost_1_72_0.tar
cd boost_1_72_0
CPLUS_INCLUDE_PATH=/usr/include/python3.6m/ ./bootstrap.sh  --with-python=python3
CPLUS_INCLUDE_PATH=/usr/include/python3.6m/ ./b2 install

# Install cmake
cd /usr/local/src/
mkdir cmake
cd cmake
curl -L -o ./cmake-3.19.5.tar.gz https://github.com/Kitware/CMake/releases/download/v3.19.5/cmake-3.19.5.tar.gz
gunzip cmake-3.19.5.tar.gz
tar -xf cmake-3.19.5.tar
cd cmake-3.19.5
./configure --prefix=/usr/local
make
make install
