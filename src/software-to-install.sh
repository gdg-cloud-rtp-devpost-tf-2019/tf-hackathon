#!/bin/bash

conda install gdal -c conda-forge
conda install -c conda-forge gmaps

# do this inside of the tf env
jupyter nbextension enable --py --sys-prefix widgetsnbextension
jupyter nbextension enable --py --sys-prefix gmaps

# Notes on how to get a google maps api kiey
# https://jupyter-gmaps.readthedocs.io/en/latest/authentication.html



