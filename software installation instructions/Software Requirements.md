# Software Requirements

The instructions in this document are related to all free software and packages needed to be installed for the LASCON tutorials. These include: NEST, NEURON, NetPyNE, Octave, PyDSTool and XPP. Please follow the installation steps in the order given below.

We recommend that you install Python version 3.6.x. Although some programs will work on newer versions, some may not. With version 3.6.x you should be able to run all programs that will be used in LASCON.

## Instructions for Linux users (Ubuntu based systems)

### Install dependencies

Compiling and running the following software requires several tools; how they are installed depends on the Linux distribution. We will focus on the commands for Ubuntu based systems. Installations using ```conda``` or ```pip``` should work for any Linux distribution.

Before starting the software installation you should install some dependencies by running the following line:  

```
sudo apt install libx11-dev git bison flex automake libtool libxext-dev libncurses-dev python3-dev xfonts-100dpi cython3 libopenmpi-dev make zlib1g-dev libreadline-dev libreadline5
```

*Note: This was extracted from the NEURON website but should be enough also for the other softwares.* 

### Installing Anaconda

In your browser, download the Anaconda installer for Linux (choose the 3.* version): 
https://www.anaconda.com/distribution/#download-section

Open a terminal in the same folder where you saved the installer and enter the following to install Anaconda for Python:
```
bash Anaconda3-2019.10-Linux-x86_64.sh
```

Follow the instructions in https://docs.anaconda.com/anaconda/install/linux/ and write "yes" when asked to.

*Note: Reopen terminal to enable anaconda!!!*

### Creating an Anaconda environment and installing NEST

The Anaconda environment is a way to safely install different versions of packages or Python without compromising other installations. More information can be found in: https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html

You will start by creating an Anaconda environment named "lascon" (you can choose another name as you wish), which will come with Python 3.6 and a bundle of other software already installed. To do this, open a terminal and write:

```
conda create --name lascon -c conda-forge nest-simulator=*=mpi_openmpi* python=3.6 pip matplotlib ipython octave brian2 jupyter pydstool
```

This command will install NEST as described in https://nest-simulator.readthedocs.io/en/latest/installation/index.html. In this website you can also find more information about how to install NEST in different systems.
The command also installs some useful scientific Python packages: matplotlib, numpy, scipy, etc. Additionally, three other software are also installed: Ipython, Octave and Brian2. Ipython is an interactive shell for Python. Octave is an open source alternative for Matlab. Brian2 is another simulator for spiking neural networks.

You can check if the environment was created by writing in the terminal:
```
conda env list
```

To activate the enviroment created above you have to write in the terminal:

```
conda activate lascon
```

**It is important to activate the environment before the next steps. If you open another terminal you have to activate it again.**


### Installing PyDSTool

We recommend that you install PyDSTool via pip by running in the terminal:

```
pip install --user PyDSTool==0.90.3
```

### Installing NEURON

You can download the NEURON simulator from the website: https://neuron.yale.edu/neuron/download#linux

After downloading the .deb or the .rpm files you should follow the instructions:

Installation hints 
.deb package: Double-click the deb package, or in a terminal type
     ```sudo dpkg -i filename```
where filename is the name of the deb file. This will install NEURON in /usr/local/nrn, and InterViews in /usr/local/iv.

.rpm package: Type
     ```sudo rpm --install filename```
where filename is the name of the rpm file. This will install NEURON in /usr/local/nrn, and InterViews in /usr/local/iv.

After the installation you can test it by writing in the terminal: 
```
nrngui
```

If it worked properly, a window will appear. To close the NEURON console you can press in the terminal: CTRL + D.

To be able to import NEURON from Python console you have to add the PYTHONPATH in your system:

```
export PYTHONPATH=/usr/local/nrn/lib/python:$PYTHONPATH
```

*Note: "/usr/local/nrn/lib/python/" is the default folder where NEURON will be installed by the precompiled installers.*
**Add the above line at the end of $HOME/.profile to set PYTHONPATH for new sessions**

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

Information about NetPyNE installation can be found at: http://netpyne.org/install.html.

We suggest that you follow the installation steps using pip without GUI version. To install NetPyNE through pip run from your terminal:

```
pip install netpyne
```

<!---
We suggest you to follow installation steps using pip and GUI version. To install NetPyNE-UI through pip run from your terminal:

```
pip install netpyne_ui
jupyter nbextension enable --py jupyter_geppetto
jupyter serverextension enable --py jupyter_geppetto
jupyter nbextension enable --py widgetsnbextension
```

If it was installed correct, you can run it by writing the command in the terminal: ```NetPyNE-UI ```
-->

## Instructions for Mac users

The same steps given above for Linux can be followed by Mac users with the exception of NEURON installation. To install NEURON you have to access the website https://neuron.yale.edu/neuron/download#macos, download the Mac version and follow the instructions given.

## Instructions for Windows users

Some software that will be used in LASCON do not have support for Windows. So, for Windows users we recommend the use of virtual machines as the VirtualBox. A Live Media is offered by the NEST website: https://nest-simulator.readthedocs.io/en/latest/download.html. This Live Media contains a Linux Ubuntu version with the main packages already installed there (NEST, NEURON, etc). After installing that, you can install the packages not included using the above instructions for Linux users.

### Installing XPP

Please follow the instructions on the appropriate website:

Linux: http://www.math.pitt.edu/~bard/xpp/xpp.html

Mac: http://www.math.pitt.edu/~bard/xpp/installonmac.html

Windows: http://www.math.pitt.edu/~bard/xpp/installonwindows.html 
