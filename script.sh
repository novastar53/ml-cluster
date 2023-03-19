#!/bin/bash
sleep 1m
# Log stdout to file
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>/home/ubuntu/terraform.log 2>&1
# Update AL2
sudo apt update -y
# Mount /anaconda3
sudo mkfs.xfs /dev/sdf -f
sudo mkdir /anaconda3
sudo mount /dev/sdf /anaconda3
sudo chown -R ubuntu:ubuntu /anaconda3
sudo echo "UUID=$(lsblk -nr -o UUID,MOUNTPOINT | grep "/anaconda3" | cut -d ' ' -f 1) /anaconda3 xfs defaults,nofail 1 2" >> /etc/fstab
# Install Anaconda
wget https://repo.anaconda.com/archive/Anaconda3-2018.12-Linux-x86_64.sh -O /home/ubuntu/anaconda.sh &&
    bash /home/ubuntu/anaconda.sh -u -b -p /anaconda3 &&
    echo 'export PATH="/anaconda3/bin:$PATH"' >> /home/ubuntu/.bashrc &&
    rm -rf /home/ubuntu/anaconda.sh &&
# Configure Jupyter for AWS HTTP
jupyter notebook --generate-config &&
    sed -i -e "s/#c.NotebookApp.ip = 'localhost'/c.NotebookApp.ip = '"$(curl http://169.254.169.254/latest/meta-data/public-hostname)"'/g" /home/ubuntu/.jupyter/jupyter_notebook_config.py &&
    sed -i -e "s/#c.NotebookApp.allow_origin = ''/c.NotebookApp.allow_origin = '*'/g" /home/ubuntu/.jupyter/jupyter_notebook_config.py &&
    sed -i -e "s/#c.NotebookApp.open_browser = True/c.NotebookApp.open_browser = False/g" /home/ubuntu/.jupyter/jupyter_notebook_config.py
