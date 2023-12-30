marianmt

cd /path/to/marian-dev
mkdir -p build
cd build
cmake .. -DCOMPILE_CPU=on -DCOMPILE_CUDA=off
make -j4

sudo apt-get install doxygen

// TCMALLOC_LIB-NOTFOUND - not sure this is a problem
sudo apt-get install google-perftools

// 'cause intel MKL is finnicky
git clone https://github.com/OpenMathLib/OpenBLAS/wiki
cd OpenBLAS
make