# TEST CUDA AND CUDNN INSTALL

- The folder contains scripts / files that can be used to verify if cuda and cuDNN has been installed properly.

## VERIFY NVIDIA DRIVER INSTALL
- If the driver for your PC GPU has been installed properly, you can verify by typing `nvidia-smi` in your terminal.

- It should give an output similar to the one below.

```
Wed Jun 26 01:15:53 2024       
+---------------------------------------------------------------------------------------+
| NVIDIA-SMI 535.183.01             Driver Version: 535.183.01   CUDA Version: 12.2     |
|-----------------------------------------+----------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |         Memory-Usage | GPU-Util  Compute M. |
|                                         |                      |               MIG M. |
|=========================================+======================+======================|
|   0  NVIDIA GeForce RTX 3050 ...    Off | 00000000:01:00.0 Off |                  N/A |
| N/A   40C    P0              N/A /  60W |      4MiB /  4096MiB |      0%      Default |
|                                         |                      |                  N/A |
+-----------------------------------------+----------------------+----------------------+
                                                                                         
+---------------------------------------------------------------------------------------+
| Processes:                                                                            |
|  GPU   GI   CI        PID   Type   Process name                            GPU Memory |
|        ID   ID                                                             Usage      |
|=======================================================================================|
|    0   N/A  N/A      2586      G   /usr/bin/gnome-shell                          1MiB |
+---------------------------------------------------------------------------------------+
```

- This info helps you in choosing the driver version to install for cuda. From the output, my cuda version is 12.2.

## TESTING CUDA
- To verify cuda installation, simple execute the **simple_cuda** file. 

- You should get an output of
```
Hello, CUDA!
```

- Another way of verifying is to type `nvcc --version` in your terminal

- Your output should be similar to this
```
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2023 NVIDIA Corporation
Built on Tue_Aug_15_22:02:13_PDT_2023
Cuda compilation tools, release 12.2, V12.2.140
Build cuda_12.2.r12.2/compiler.33191640_0
```

## TESTING CUDNN
- If cuDNN has been installed well, the **test_cudnn** file should help you test if it works.

- This should be your output
```
cuDNN successfully initialized!
```

### Thank You For Your Time