#!/usr/bin/env bash

#############################################################################
# Creating conda environment and installing NEST + IPython + BRIAN2 + OCTAVE
#############################################################################
conda create --name lascon -c conda-forge nest-simulator=*=mpi_openmpi* python=3.6 ipython brian2 octave jupyter
conda activate lascon

#############################################################################
# Install pip
#############################################################################
sudo apt-get install python-pip
pip install --upgrade pip

#############################################################################
# Install PyDSTool
#############################################################################
pip install --user PyDSTool==0.90.3

##############################################################################
# Download & Install NEURON
##############################################################################
wget https://neuron.yale.edu/ftp/neuron/versions/v7.7/nrn-7.7.x86_64-linux.deb
sudo dpkg -i nrn-7.7.x86_64-linux.deb

##############################################################################
# Install netpyne
##############################################################################
pip install --user netpyne_ui
jupyter nbextension enable --py jupyter_geppetto
jupyter serverextension enable --py jupyter_geppetto
jupyter nbextension enable --py widgetsnbextension
