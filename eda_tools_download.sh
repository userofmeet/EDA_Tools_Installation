# PRE-REQUISTIC
sudo apt-get update
mkdir -p eda_tools
cd eda_tools

sudo apt-get install build-essential clang bison flex \
	libreadline-dev gawk tcl-dev libffi-dev git \
	graphviz xdot pkg-config python3 libboost-system-dev \
	libboost-python-dev libboost-filesystem-dev zlib1g-dev \
	make m4 tcsh csh libx11-dev gperf  tcl8.6-dev tk8.6 tk8.6-dev \
	libxmp4 libxpm-dev  libxcb1 libcairo2  \
      libxrender-dev libx11-xcb-dev libxaw7-dev freeglut3-dev automake yosys
sudo apt-get update
sudo apt-get -y install libtool


#STEP 2: Installing xschem
cd ~/eda_tools/
git clone https://github.com/StefanSchippers/xschem.git xschem-src
cd xschem-src
./configure 
make 
sudo make install 
cd ..


#STEP 3: Installing magic VLSI
cd ~/eda_tools/ 
git clone git://opencircuitdesign.com/magic
cd magic 
./configure
make 
sudo make install 
cd ..


#STEP 4: Installing ngspice
cd ~/eda_tools/
git clone https://git.code.sf.net/p/ngspice/ngspice ngspice_git
cd ngspice_git
mkdir release
sudo apt-get install adms
./autogen.sh
cd release
../configure --with-x --enable-xspice --disable-debug --enable-cider --with-readline=yes --enable-openmp --enable-adms
sudo make
sudo make install
cd ..


#STEP 6: Gaw waveform viewer integration
## Download link
https://www.rvq.fr/php/ndl.php?id=gaw.?-.*

# pre-requisite
sudo apt install libgtk-3-dev
tar zxvf gaw-yyyymmdd.tar.gz
cd gaw-yyyymmdd
./configure
sudo make
sudo make install
sudo apt update
sudo apt install vim-gtk3
