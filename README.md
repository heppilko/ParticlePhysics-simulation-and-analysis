# CPV-FCC

******************************************************************************

Basic workflow should be:
- Generate process of interest with Madgraph5_aMC@NLO. Pythia8 turned on. Produces hepmc file
- Use Delphes to add detector simulation. Produces root file in EDM4HEP format
- Analysis using angular variables and NN variables. Best in python for standard data science libraries.

******************************************************************************

## Initial Setup

Download and install/build Madgraph:
- needs python, gcc, gfortran
- source installMadgraph.sh
- follow the on screen instructions to run MG interactively and install the pythia module

Download and install/build Delphes:
- needs git and ROOT libraries
- source installDelphes.sh
- excessive number of depracated warnings......
- using Delphes is straightforward, see: 

******************************************************************************

## Running Madgraph

A basic tutorial on Madgraph can be found here: 
- Try running interactively in the shell to play around with the parameters. From the MG directory, type ./bin/mg5_aMC 

An example is provided to produce Z -> mu+ mu- events from a script:
- From the MG directory, type ./bin/mg5_aMC ../Examples/mg_zmumu_sm.txt
- An output directory is created called zmumu_sm 
- The output .hepmc file (for use with Delphes) can be found in zmumu_sm/Events/run_01/tag_1_pythia8_events.hepmc.gz
- Compare the cross section you get to the fiducial cross section measured by ATLAS here: https://arxiv.org/abs/1603.09222

******************************************************************************
