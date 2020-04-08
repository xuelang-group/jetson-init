set -x
#cuda
apt-get install -y cuda-command-line-tools-10-0 
apt-get install -y cuda-compiler-10-0 
apt-get install -y cuda-cublas-10-0 
apt-get install -y cuda-cublas-dev-10-0
apt-get install -y cuda-apt-get install -y cudart-10-0
apt-get install -y cuda-apt-get install -y cudart-dev-10-0
apt-get install -y cuda-cufft-10-0
apt-get install -y cuda-cufft-dev-10-0
apt-get install -y cuda-cuobjdump-10-0
apt-get install -y cuda-cupti-10-0
apt-get install -y cuda-curand-10-0
apt-get install -y cuda-curand-dev-10-0
apt-get install -y cuda-cusolver-10-0
apt-get install -y cuda-cusolver-dev-10-0
apt-get install -y cuda-cusparse-10-0
apt-get install -y cuda-cusparse-dev-10-0
apt-get install -y cuda-documentation-10-0
apt-get install -y cuda-driver-dev-10-0
apt-get install -y cuda-gdb-10-0
apt-get install -y cuda-gpu-library-advisor-10-0
apt-get install -y cuda-libraries-dev-10-0
apt-get install -y cuda-license-10-0
apt-get install -y cuda-memcheck-10-0
apt-get install -y cuda-misc-headers-10-0
apt-get install -y cuda-npp-10-0
apt-get install -y cuda-npp-dev-10-0
apt-get install -y cuda-nsight-compute-addon-l4t-10-0
apt-get install -y cuda-nvcc-10-0
apt-get install -y cuda-nvdisasm-10-0
apt-get install -y cuda-nvgraph-10-0
apt-get install -y cuda-nvgraph-dev-10-0
apt-get install -y cuda-nvml-dev-10-0
apt-get install -y cuda-nvprof-10-0
apt-get install -y cuda-nvprune-10-0
apt-get install -y cuda-nvrtc-10-0
apt-get install -y cuda-nvrtc-dev-10-0
apt-get install -y cuda-nvtx-10-0
apt-get install -y cuda-repo-l4t-10-0-local-10.0.326 
apt-get install -y cuda-samples-10-0
apt-get install -y cuda-toolkit-10-0 
apt-get install -y cuda-tools-10-0


#libnvinfer6
apt-get install -y libnvinfer-bin
apt-get install -y libnvinfer-dev
apt-get install -y libnvinfer-doc
apt-get install -y libnvinfer-plugin-dev
apt-get install -y libnvinfer-plugin6
apt-get install -y libnvinfer-samples
apt-get install -y libnvinfer6

#python tools
apt-get install -y python-libnvinfer
apt-get install -y python-libnvinfer-dev
apt-get install -y python3-libnvinfer
apt-get install -y python3-libnvinfer-dev

#nvidia-container-csv
apt-get install -y nvidia-container-csv-cuda 
apt-get install -y nvidia-container-csv-cudnn 
apt-get install -y nvidia-container-csv-tensorrt 



#libcudnn7
apt-get install -y libcudnn7
apt-get install -y libcudnn7-dev
apt-get install -y libcudnn7-doc

#etc
apt-get install -y libnvonnxparsers-dev
apt-get install -y libnvonnxparsers6
apt-get install -y libnvparsers-dev
apt-get install -y libnvparsers6
apt-get install -y nvidia-l4t-cuda
apt-get install -y tensorrt
apt-get install -y uff-converter-tf
apt-get install -y graphsurgeon-tf