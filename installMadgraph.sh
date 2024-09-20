# install MG
curl -OL https://launchpad.net/mg5amcnlo/3.0/3.5.x/+download/MG5_aMC_v3.5.5.tar.gz
tar -xf MG5_aMC_v3.5.5.tar.gz
rm MG5_aMC_v3.5.5.tar.gz
curl -OL http://feynrules.irmp.ucl.ac.be/attachment/wiki/SMEFT/SMEFTsim_A_U35_MwScheme_UFO_v2.1.tar.gz 
tar -zxvf SMEFTsim_A_U35_MwScheme_UFO_v2.1.tar.gz
mv SMEFTsim_A_U35_MwScheme_UFO_v2.1 MG5_aMC_v3_5_5/models/.
rm SMEFTsim_A_U35_MwScheme_UFO_v2.1.tar.gz

echo "***********************************"
echo "***********************************\n"
echo "To run Madgraph interactively:"
echo "cd MG5_aMC_v3_5_5"
echo "./bin/mg5_aMC \n"
echo "Inside the interactive environment, you will want to install lhapdf and pythia:"
echo "install lhapdf6"
echo "install pythia8 \n"
echo "***********************************"
echo "***********************************"


