# Particle physics simulation and analysis

This repository was written as a starting point for MPhys and MSc students at Manchester that are working on simulation + data analysis projects with the Manchester Particle Physics group.

******************************************************************************

Basic workflow should be:
- Generate process of interest with Madgraph5_aMC@NLO. Pythia8 turned on. Produces hepmc file
- Use Delphes to add detector simulation. Produces root file with leptons, photons, jets, etc.
- Analysis. Best in python for standard data science libraries.

******************************************************************************

## Initial Setup

You can clone this repository using git via https or ssh, i.e.
```
git clone https://github.com/heppilko/ParticlePhysics-simulation-and-analysis.git
```

Before you start doing anything else, you need to make sure the following are installed on your machine: python 3.7 (or later), gcc/gfortran 4.6 (or later), and the CERN ROOT libraries. For running the analysis steps later, you will also need scikit-hep installed. If these packages are not installed on your machine, an easy way to proceed is to install conda/mamba (https://github.com/conda-forge/miniforge#mambaforge) and create a conda environment using the environment.yml file provided in this package, i.e. 
```ruby
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
bash Mambaforge-$(uname)-$(uname -m).sh
mamba env create -f ParticlePhysics-simulation-and-analysis/Misc/environment.yml
mamba activate mphys
```

Alternatively, you can run the following on macos:
```
# If you don't have homebrew yet:
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Then, in your work directory:
brew install root
python -m venv mg5.venv
source mg5.venv/bin/activate
pip install scikit-hep
pip install setuptools
brew install davidchall/hep/lhapdf
```

Then, you can go into the directory and install/build Madgraph and Delphes:
```ruby
cd ParticlePhysics-simulation-and-analysis
source installDelphes.sh
source installMadgraph.sh
```
Follow the onscreen instructions to run Madgraph interactively and install Pythia8.

******************************************************************************

## Running Madgraph

(1) An example is provided to produce Z -> mu+ mu- events from a script:
- From the MG directory, type
```ruby
  ./bin/mg5_aMC ../Examples/mg_zmumu_sm.txt
```
- An output directory is created called zmumu_sm 
- The output .hepmc file (for use with Delphes) can be found in zmumu_sm/Events/run_01/tag_1_pythia8_events.hepmc.gz
- Compare the cross section you get to the fiducial cross section measured by ATLAS here: https://arxiv.org/abs/1603.09222

(2) Try running interactively in the shell to play around with the parameters.
- From the MG directory, type
```ruby
./bin/mg5_aMC
```
- A basic tutorial on Madgraph can be found here: https://indico.cern.ch/event/555228/sessions/203428/attachments/1315471/1970459/tutorial-CMSandATLAS-2016.pdf

******************************************************************************

******************************************************************************

## Running Delphes

Instructions on Delphes can be found here:https://github.com/delphes/delphes

(1) To run on the file created in the previous step (Madgraph), first need to unzip the hepmc file:
```ruby
cd zmumu_sm/Events/run_01/ directory
gunzip tag_1_pythia8_events.hepmc.gz
```

(2) In the Delphes directory try:
```ruby
./DelphesHepMC2 cards/delphes_card_ATLAS.tcl delphes_output.root ../MG5_aMC_v2_9_15/zmumu_sm/Events/run_01/tag_1_pythia8_events.hepmc
```
- This produces an output file called delphes_output.root
- You can open a TBrowser in ROOT to inspect the branches in this file. Look at the muon spectra as you know the simulation contained Z -> mu+ mu- events.

******************************************************************************

## Analysing events in Python

An simple analysis of the Z -> mu+ mu- events is included as a python script and as a jupyter notebook. To analyse the events produced in the previous steps, change directory to the Examples directory and try:
```ruby
python analysis_python.py
```
- alternatively, you can open the jupyter notebook (analysis_python.ipynb) if your machine is capable of running jupyter.
- to understand more about columnar analysis in uproot, see this tutorial: https://masonproffitt.github.io/uproot-tutorial/aio/index.html

******************************************************************************

## Analysing events in C++ with ROOT

An alternative, but conceptually identical, analysis of the Z -> mu+ mu- events is included as a ROOT macro. To analyse the events, change directory to the Examples directory and try:
```ruby
root -l analysis_root.C
```
- you can find out more about ROOT macros here: https://root.cern.ch/root/htmldoc/guides/primer/ROOTPrimer.html
