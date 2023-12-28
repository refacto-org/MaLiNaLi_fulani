marianmt

cd /path/to/marian-dev
mkdir -p build
cd build
cmake .. -DCOMPILE_CPU=on -DCOMPILE_CUDA=off
make -j4

sudo apt-get install doxygen

TCMALLOC_LIB-NOTFOUND
sudo apt-get install google-perftools