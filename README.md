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

******************************************************************************

## Running Madgraph

An example is provided to produce Z -> mu+ mu- events from a script:
- From the MG directory, type ./bin/mg5_aMC ../Examples/mg_zmumu_sm.txt
- An output directory is created called zmumu_sm 
- The output .hepmc file (for use with Delphes) can be found in zmumu_sm/Events/run_01/tag_1_pythia8_events.hepmc.gz
- Compare the cross section you get to the fiducial cross section measured by ATLAS here: https://arxiv.org/abs/1603.09222

Try running interactively in the shell to play around with the parameters.
- From the MG directory, type ./bin/mg5_aMC 
- A basic tutorial on Madgraph can be found here: https://indico.cern.ch/event/555228/sessions/203428/attachments/1315471/1970459/tutorial-CMSandATLAS-2016.pdf

******************************************************************************

******************************************************************************

## Running Delphes

Instructions on Delphes can be found here:https://github.com/delphes/delphes

To run on the file created in the previous step (Madgraph):
- gunzip the tag_1_pythia8_events.hepmc.gz file in the zmumu_sm/Events/run_01/ directory
- In the Delphes directory try: ./DelphesHepMC2 cards/delphes_card_ATLAS.tcl delphes_output.root ../MG5_aMC_v2_9_15/zmumu_sm/Events/run_01/tag_1_pythia8_events.hepmc
- This produces an output file called delphes_output.root
- You can open a TBrowser in ROOT to inspect the branches in this file. Look at the muon spectra as you know the simulation contained Z -> mu+ mu- events.

******************************************************************************

## Analysing events in Python

An simple analysis of the Z -> mu+ mu- events is included as a jupyter notebook:
- see Examples/analysis_python.ipynb
- you will need to install scikit-hep (https://scikit-hep.org) preferably in a conda environment.
- you should make sure you have a good editor capable of running jupyter. Visual Studio Code is good.
- to understand more about columnar analysis in uproot, see this tutorial: https://masonproffitt.github.io/uproot-tutorial/aio/index.html

******************************************************************************

