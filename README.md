# CPV-FCC
CPV studies for FCC

Basic workflow should be:
- Generate process of interest with Madgraph5_aMC@NLO. Pythia8 turned on. Produces hepmc file
- Use Delphes to add detector simulation. Produces root file in EDM4HEP format
- Analysis using angular variables and NN variables. Best in python for standard data science libraries.


Needs a bunch of packages: recommend mamba package manager (like conda but faster).
- follow the instructions to install mamba here: https://scikit-hep.org/user/installing-conda
- create an environment for your project with various packages in it that you need for the simulation (needed for Madgraph and Delphes): mamba create -n cernroot root wget
- on each shell instance, will need to activate: conda activate cernroot

Download and install/build Madgraph and standalone Delphes:
- source installSimulation.sh
