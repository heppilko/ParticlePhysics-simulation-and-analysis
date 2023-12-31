# install MG
curl -OL https://launchpad.net/mg5amcnlo/3.0/3.4.x/+download/MG5_aMC_v2.9.15.tar.gz
tar -xf MG5_aMC_v2.9.15.tar.gz
rm MG5_aMC_v2.9.15.tar.gz
curl -OL http://feynrules.irmp.ucl.ac.be/raw-attachment/wiki/SMEFT/SMEFTsim_U35_MwScheme_UFO.tar.gz
tar -zxvf SMEFTsim_U35_MwScheme_UFO.tar.gz
mv SMEFTsim_U35_MwScheme_UFO MG5_aMC_v2_9_15/models/.
rm SMEFTsim_U35_MwScheme_UFO.tar.gz

echo "***********************************"
echo "***********************************\n"
echo "To run Madgraph interactively:"
echo "cd MG5_aMC_v2_9_15"
echo "./bin/mg5_aMC \n"
echo "Inside the interactive environment, you will want to install lhapdf and pythia:"
echo "install lhapdf6"
echo "install pythia8 \n"
echo "***********************************"
echo "***********************************"


