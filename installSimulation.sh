# install MG and Delphes
mkdir Simulation
cd Simulation
wget https://launchpad.net/mg5amcnlo/3.0/3.4.x/+download/MG5_aMC_v3.4.2.tar.gz
tar -xf MG5_aMC_v3.4.2.tar.gz
rm MG5_aMC_v3.4.2.tar.gz
git clone https://github.com/delphes/delphes.git Delphes
cd Delphes
make
cd ..


