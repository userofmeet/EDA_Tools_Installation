sudo apt update
sudo apt -y install yosys


#	Installing openPDK and sky130nm
cd ~/eda_tools/
git clone git://opencircuitdesign.com/open_pdks
cd open_pdks
./configure --enable-sky130-pdk 
sudo make
sudo make install 
cd ..


#integrate sky130 to magic 
sudo ln -s /usr/local/share/pdk/sky130A/libs.tech/magic/* /usr/local/lib/magic/sys


## First test of trying example circuits in sky130. 
cd 
mkdir projects
cd projects
mkdir test_xschem_sky130
cd test_xschem_sky130
echo 'source /usr/local/share/pdk/sky130B/libs.tech/xschem/xschemrc' > ./xschemrc
xschem


## install xterm to free linux terminal for other operations
sudo apt-get install xterm
## set terminal xterm
set terminal gnome-terminal
