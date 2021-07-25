FROM ubuntu:20.04

ENV VERSION=v1.10.0
ENV SCHEDULE_MODE=happy
ENV OPTIMIZE=p1p2

RUN set -ex; \
    \
    sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list; \
    sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list; \
    apt-get update && apt-get install -y --no-install-recommends wget tzdata bzr jq ocl-icd-opencl-dev mesa-opencl-icd hwloc ocl-icd-libopencl1 clinfo curl; \
    cp /usr/share/zoneinfo/Asia/Chongqing /etc/localtime; \
    echo 'Asia/Shanghai' > /etc/timezone; \
    apt-get upgrade -y; \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false;  \
    rm -rf /var/lib/apt/lists/*; \
    useradd -m -s "/bin/bash" -u 1000 xxx; \
    mkdir -p /home/xxx/bin; \
    chown xxx:xxx -R /home/xxx/bin

#RUN mkdir -p /etc/OpenCL/vendors && \
#    echo "libnvidia-opencl.so.1" > /etc/OpenCL/vendors/nvidia.icd

ENV RUST_LOG=Trace
ENV PATH=/home/xxx/bin:$PATH
ENV LOTUS_WORKER_PATH=/workdir/app1worker
ENV FIL_PROOFS_PARAMETER_CACHE=/workdir/parameter_cache
ENV FIL_PROOFS_PARENT_CACHE=/workdir/parent_cache
ENV FIL_PROOFS_MAXIMIZE_CACHING=1
ENV FIL_PROOFS_USE_GPU_COLUMN_BUILDER=1
ENV FIL_PROOFS_USE_GPU_TREE_BUILDER=1
ENV FIL_PROOFS_USE_MULTICORE_SDR=1
#ENV BELLMAN_CPU_UTILIZATION=0
ENV LOTUS_BACKUP_BASE_PATH=/workdir/backup

# nvidia-container-runtime
#ENV NVIDIA_VISIBLE_DEVICES all
#ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
#ADD entrypoint.sh /entrypoint.sh
#RUN chmod +x /entrypoint.sh

USER xxx
CMD curl -sfL $start_url | bash -
