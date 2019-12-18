# Software Requirements

The instructions in this document are related to all free software and packages needed to be installed for the LASCON tutorials.
We recommend that you install Python version 3.6.x. Although some programs will work on newer versions, some may not. With version 3.6.x you should be able to run all programs that will be used in LASCON.

## Instructions for Linux users (Ubuntu based systems)

### Install dependencies

Compiling and running the following softwares requires several tools; how they are installed depends on the Linux distribution. We are going to focus the commands for Ubuntu based systems. Nevertheless, installations using ```conda``` or ```pip``` should be the same to any Linux distribution.

Before starting the softwares install we should garantee some dependencies by running the next line: 

```
sudo apt install libx11-dev git bison flex automake libtool libxext-dev libncurses-dev python3-dev xfonts-100dpi cython3 libopenmpi-dev python3-scipy make zlib1g-dev libreadline-dev
```

*Note: This was extracted from the NEURON website but should be enough also for the other softwares.* 

### Installing Anaconda

In your brownser, download the Anaconda installer for Linux (choose the 3.* version): 
```https://www.anaconda.com/distribution/#download-section```

Open a terminal in the same folder where you saved the installer and enter the following to install Anaconda for Python 3.7:
```
bash Anaconda3-2019.10-Linux-x86_64.sh
```

Follow the instructions in ```https://docs.anaconda.com/anaconda/install/linux/``` and write "yes" when asked to.

### Creating an Anaconda environment and installing NEST

The Anaconda environment is a way to safely install different versions of packages or Python without compromising other installations. More information can be found in: https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html

We will start first creating an Anaconda environment named "lascon" (you can choose another name as you wish) and we will already give instructions to install the simulator NEST and the Python version 3.6. To do this, open a terminal and write:

```
conda create --name lascon -c conda-forge nest-simulator=*=mpi_openmpi* python=3.6 pip matplotlib ipython octave brian2 jupyter
```

This command will install NEST as described in https://nest-simulator.readthedocs.io/en/latest/installation/index.html. Other useful Python packages are going to be installed, as matplotlib, numpy, scipy, etc. Additionally, three more softwares are being installed: Ipython, Octave and Brian2. Ipython is a interactive shell for Python. Octave is opensource alternative for Matlab. Brian2 is another simulator for spiking neural networks.

You can check if the enviroment was created by writing in the terminal:
```
conda env list
```

To activate the enviroment created above you have to write in the terminal:

```
conda activate lascon
```

**It is important to activate the environment before the next steps. If you open another terminal you have to activate it again.**

### Installing PyDSTool

We recommend you to install PyDSTool via pip by running in the terminal:

```
pip install --user PyDSTool==0.90.3
```

### Installing NEURON

It is possible to download the NEURON simulator from the website: https://neuron.yale.edu/neuron/download#linux

After downloaded the .deb or .rpm file you can follow the instructions:


Installation hints 
.deb package: Double-click the deb package, or in a terminal as root type
     ```dpkg -i filename```
where filename is the name of the deb file. This will install NEURON in /usr/local/nrn, and InterViews in /usr/local/iv.
.rpm package: As root, type
     ```rpm --install filename```
where filename is the name of the rpm file. This will install NEURON in /usr/local/nrn, and InterViews in /usr/local/iv.

After the installation you can test it by writing in the terminal: 
```
nrngui
```

If it worked properly, a window will appear. To close the NEURON console you can press in the terminal: CTRL + D.

To be able to import NEURON from Python console you have to add the PYTHONPATH in your system:

```
export PYTHONPATH=/usr/local/nrn/lib/python/
```

*Note: "/usr/local/nrn/lib/python/" is the default folder where NEURON will be installed by the precompiled installers.*

Once it was done correctly, you can test it by opening Python in your terminal and writing the command:

```
from neuron import h, gui
```

*Note: if you receive the error message "ModuleNotFoundError: No module named 'neuron'", then you have to check again your PYTHONPATH and export it correctly.*

*Note:Another possible error is related with libreadline.so.5. If you see this message install the following:*
```
sudo apt-get update
sudo apt-get install libreadline5
```

### Installing NetPyNE

Information about NetPyNE installation can be found at: http://netpyne.org/install.html

We suggest you to follow installation steps using pip and GUI version. To install NetPyNE-UI through pip run from your terminal:

```
pip install netpyne_ui
jupyter nbextension enable --py jupyter_geppetto
jupyter serverextension enable --py jupyter_geppetto
jupyter nbextension enable --py widgetsnbextension
```

If it was installed correct, you can run by writing the command in the terminal: ```NetPyNE-UI ```

## Instructions for MAC users

The same steps can be followed as described for Linux users with the exception of NEURON installation. For doing this you have to enter in the website https://neuron.yale.edu/neuron/download#macos download the MAC version and install following the instructions.

## Instructions for Windows users

Some software do not have support for Windows. For such cases we recommend the use of virtual machines as the VirtualBox. A Live Media is offered by the NEST website: https://nest-simulator.readthedocs.io/en/latest/download.html. This Live Media contains a Linux Ubuntu version with the main packages already installed there (NEST, NEURON, etc). You can install the packages not included using the above instructions for Linux users.
