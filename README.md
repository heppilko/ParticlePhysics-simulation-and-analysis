# CPV-FCC

******************************************************************************

Basic workflow should be:
- Generate process of interest with Madgraph5_aMC@NLO. Pythia8 turned on. Produces hepmc file
- Use Delphes to add detector simulation. Produces root file in EDM4HEP format
- Analysis using angular variables and NN variables. Best in python for standard data science libraries.

******************************************************************************

Download and install/build Madgraph:
- needs python, gcc, gfortran
- source installMadgraph.sh
- follow the on screen instructions to run MG interactively and install the pythia module
- you can find a tutorial for generating events with Madgraph here: 

Download and install/build Delphes:
- needs git and ROOT libraries
- source installDelphes.sh
- excessive number of depracated warnings......
- using Delphes is straightforward, see: 

******************************************************************************
