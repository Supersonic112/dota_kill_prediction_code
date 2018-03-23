Bachelor Thesis: Kill Prediction in DOTA 2
====
This is the code that was used for the bachelor thesis on kill prediction in the MOBA "Defense of the Ancients 2", not including the training data for size reasons.

Prerequisites
---
* Python>=3.6 with virtualenv (Python>=3.4 might also still work)
* Java>=1.7

Setup Instructions
---
The following instructions can be used to get the code to work on a linux computer:
1. setup and activate virtualenv: (warning: due to https://github.com/pypa/virtualenv/issues/596 the path from / to the repository should not be too long, otherwise some obscure problems are to be expected below)
    virtualenv3 pythonAnalyzer
    source pythonAnalyzer/bin/activate
2. install requirements:
    pip3 install -r pythonAnalyzer/full-requirements.txt
3. start jupyterlab:
    jupyter lab
4. go to the pythonAnalyzer folder in Jupyterlab and open 'json_work.ipynb' to see the json-to-csv wrapper or open 'sklearn_work.ipynb' to see the machine learning classifier

DEM-to-JSON setup
---
In order to get the DEM-to-JSON repository for the dem-to-json-converter script, execute the following line:
    git submodule update --init
After that, the script will automatically convert all dem-files in the subdirectory dota/dem to JSON files and save them in dota/json
