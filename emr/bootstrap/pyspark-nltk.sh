#!/bin/bash
echo "bootstrapping"
sudo rm /etc/alternatives/python; sudo ln -s /usr/bin/python2.7 /etc/alternatives/python
sudo rm /etc/alternatives/pip; sudo ln -s /usr/bin/pip-2.7 /etc/alternatives/pip
sudo rm /usr/bin/pip-python; sudo ln -s /usr/bin/pip-2.7 /usr/bin/pip-python
sudo rm /etc/alternatives/python-config; sudo ln -s /usr/bin/python2.7-config /etc/alternatives/python-config

sudo pip install nltk

sudo yum -y install git gcc python-dev python-devel
sudo pip install -U numpy 
sudo pip install pyyaml nltk 
sudo pip install -e git://github.com/mdp-toolkit/mdp-toolkit#egg=MDP 

sudo python -m nltk.downloader -d /mnt/nltk_data all

sudo ln -s /mnt/nltk_data /usr/local/share/nltk_data

