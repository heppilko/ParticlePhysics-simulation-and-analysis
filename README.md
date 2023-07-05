# CPV-FCC
CPV studies for FCC

Basic workflow should be:
- Generate process of interest with Madgraph5_aMC@NLO. Pythia8 turned on. Produces hepmc file
- Use Delphes to add detector simulation. Produces root file in EDM4HEP format
- Analysis using angular variables and NN variables. Best in python for standard data science libraries.

You can merge steps 1&2 if you want by enabling the Delphes module in MG5. This requires root to be installed on the system


Download and install Madgraph and standalone Delphes:
- source installMadgraph.sh
- source installDelphes.sh

Needs a bunch of packages: recommend mamba package manager (like conda but faster).
- follow the instructions to install mamba here: https://scikit-hep.org/user/installing-conda
- create an environment for your project with various packages in it: mamba create -n cernroot root wget
- on each shell instance, will need to activate: conda activate cernroot

Download and install/build Madgraph and standalone Delphes:
- source installSimulation.sh
