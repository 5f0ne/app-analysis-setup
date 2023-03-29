#
# Setup of Ubuntu VM for automated android app analysis
#

# 0.) Update and Upgrade

sudo apt update && sudo apt full-upgrade -y


# 1.) Install dependencies

sudo apt install git -y
sudo apt install sleuthkit -y
sudo apt install python3-pip -y


# 2.) Create directory for git dependencies

rm -rf ~/scripts
mkdir ~/scripts
cd ~/scripts


# 3.) Install avdecyrpt to decrypt snapshots

git clone https://faui1-gitlab.cs.fau.de/gaston.pugliese/avdecrypt.git

cd ~/scripts/avdecrypt

sudo bash install-ubuntu.sh


# 3.1) m2crypto version needs to be changed to 0.38.0

echo -e "hexdump==3.3\nm2crypto==0.38.0\nscrypt==0.8.13" > requirements.txt

pip install -r requirements.txt


# 4.) Install idifference2.py

cd ~/scripts

git clone https://github.com/dfxml-working-group/dfxml_python.git

cd ~/scripts/dfxml_python

pip install .


# 5.) Install custom python modules
pip install evidence
pip install sqlitediff
pip install lineident
pip install fileextract