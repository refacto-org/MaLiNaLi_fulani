> marianmt

# utopie
cd /path/to/marian-dev
mkdir -p build
cd build
cmake ..  -DCOMPILE_CPU=on -DCOMPILE_CUDA=off // si uniquement CPU sinon cmake ..
make -j4

# pré-requis linux
sudo apt-get install git cmake build-essential libboost-system-dev libprotobuf17 protobuf-compiler libprotobuf-dev openssl libssl-dev libgoogle-perftools-dev

// sentencepiece on ubuntu
sudo apt-get install cmake build-essential pkg-config libgoogle-perftools-dev
git clone https://github.com/google/sentencepiece.git 
cd sentencepiece
mkdir build
cd build
cmake ..
make -j $(nproc)
sudo make install
sudo ldconfig -v

sudo apt-get install doxygen

## AVEC CUDA
// si GPU
sudo apt install nvidia-cuda-toolkit
OU 
conda install -c nvidia cuda-toolkit
// find cuda version : 
nvcc --version  // => 10.1



## SANS CUDA MLK ou OPENBLAS
sudo apt-get -y install intel-mkl

// si intel MKL KO ou que seul l'open source vous agréé
git clone https://github.com/OpenMathLib/OpenBLAS/wiki
cd OpenBLAS
make


# commandes & erreurs

git clone https://github.com/marian-nmt/marian
cd /path/to/marian
mkdir -p build
cd build
cmake ..

// si y a du **git fatal** dans les messages, autoriser avec git add... (commande fourni dans le terminal)

// Cannot find suitable CUDA libraries. Specify the path explicitly with
  -DCUDA_TOOLKIT_ROOT_DIR=/path/to/appropriate/cuda/installation
   (hint: try /usr/local/$(readlink /usr/local/cuda))


export CUDA_HOME=/usr/lib/cuda
(attention si déjà créer faut supprimer CMakeCache.txt)
cmake .. // de nouveau

// marianmt fatal error: bits/libc-header-start.h: No such file or directory
// On a 64-bit platform, gcc only comes with 64-bit libs, The -m32 is telling gcc to compile for a 32-bit.

sudo apt-get install gcc-multilib

// cc1plus: fatal error: cuda_runtime.h: No such file or directory

conda install -c nvidia cuda-toolkit
conda install nvidia::cuda-cudart-dev

export CUDA_cublas_LIBRARY=/usr/lib/x86_64-linux-gnu/libcublas.so