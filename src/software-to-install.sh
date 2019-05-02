#!/bin/bash

conda install gdal -c conda-forge
conda install -c conda-forge gmaps
conda install matplotlib
conda install seaborn
pip install tensorflow==2.0.0-alpha0 


# do this inside of the tf env
# Mods for gmaps modules
jupyter nbextension enable --py --sys-prefix widgetsnbextension
jupyter nbextension enable --py --sys-prefix gmaps

# Notes on how to get a google maps api kiey
# https://jupyter-gmaps.readthedocs.io/en/latest/authentication.html



