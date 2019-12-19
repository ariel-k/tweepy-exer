#!/bin/sh
python3 -m pip install --upgrade --force-reinstall pip
pip3 install pyvmomi
pip3 install pywinrm
pip3 install pywinrm>=0.3.0
pip3 install --ignore-installed pywinrm>=0.3.0
python3 -m pip install --upgrade pip
pip3 install ansible
ansible --version

