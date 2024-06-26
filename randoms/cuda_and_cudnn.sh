# SCRIPT TO SETUP nvidia-smi AND INSTALL cuda & cuDNN
#! usr/bin/bash

echo -e "Process starting\n"
sudo apt update


# Install gpu graphics 535
echo -e "\n\nGPU Driver 535 Install\n"
ubuntu-drivers devices
sudo apt install nvidia-driver-535
nvidia-smi # If driver installed well, this command should display info such as cuda version
sudo apt install gcc
gcc -v
sudo apt update

# Switch to Downloads directory, download and install cuda v12.2
echo -e "\n\nCUDA Driver Install\n"
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/12.2.2/local_installers/cuda-repo-ubuntu2204-12-2-local_12.2.2-535.104.05-1_amd64.deb
sudo cp /var/cuda-repo-ubuntu2204-12-2-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo dpkg -i cuda-repo-ubuntu2204-12-2-local_12.2.2-535.104.05-1_amd64.deb
sudo apt-get update
sudo apt-get -y install cuda

# Place paths in environment file
echo -e "\n#cuda and cudnn" >> ~/.bashrc
echo -e "export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}" >> ~/.bashrc
echo -e "export LD_LIBRARY_PATH=/usr/local/cuda-12.2/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}" >> ~/.bashrc

nvcc --version # If installed properly, this command should display some info


# Still in Downloads directory, download and install cuDNN v8 which works with cuda v12.2
echo -e "\n\ncuDNN Driver Install\n"
wget https://developer.nvidia.com/downloads/compute/cudnn/secure/8.9.7/local_installers/12.x/cudnn-linux-x86_64-8.9.7.29_cuda12-archive.tar.xz
tar -xf cudnn-linux-x86_64-8.9.7.29_cuda12-archive.tar.xz
cd cudnn-linux-x86_64-8.9.7.29_cuda12-archive/
sudo cp -P include/cudnn*.h /usr/local/cuda/include
sudo cp -P lib/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn*.h /usr/local/cuda/lib64/libcudnn*
sudo ldconfig
ls /usr/local/cuda/lib64/libcudnn.so.8

