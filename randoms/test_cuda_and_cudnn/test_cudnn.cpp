#include <iostream>
#include <cudnn.h>

int main() {
    cudnnHandle_t cudnn;
    cudnnCreate(&cudnn);
    std::cout << "cuDNN successfully initialized!" << std::endl;
    cudnnDestroy(cudnn);
    return 0;
}
