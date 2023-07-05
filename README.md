# CPV-FCC
CPV studies for FCC

Basic workflow should be:

(1) Generate process of interest with Madgraph5_aMC@NLO. Pythia8 turned on. Produces hepmc file

(2) Use Delphes to add detector simulation. Produces root file in EDM4HEP format

(3) Analysis using angular variables and NN variables. Best in python for standard data science libraries.



Needs a bunch of packages: recommend mamba package manager (like conda but faster).
- follow the instructions to install mamba here:
- create an environment for your project with root in (needed for Delphes): mamba create -n cernroot root
- on each shell instance, will need to activate: conda activate cernroot
