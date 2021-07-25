FROM ubuntu:20.04

ENV VERSION = v1.8.0
ENV CPU_MODE = amd
RUN set -ex; \
    \
    sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list; \
    sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list; \
    apt-get update && apt-get install -y --no-install-recommends wget tzdata bzr jq hwloc clinfo; \
    cp /usr/share/zoneinfo/Asia/Chongqing /etc/localtime; \
    echo 'Asia/Shanghai' > /etc/timezone; \
    apt-get upgrade -y; \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false;  \
    rm -rf /var/lib/apt/lists/
#    xxxadd -m -s "/bin/bash" -u 1000 xxx; \
#    mkdir -p /home/xxx/bin; \
#    chown xxx:xxx -R /home/xxx/bin

#ENV PATH=/home/xxx/bin:$PATH
ENV LOTUS_PATH=/workdir/daemon
ENV FIL_PROOFS_PARAMETER_CACHE=/workdir/parameter_cache
ENV FIL_PROOFS_PARENT_CACHE=/workdir/parent_cache
ENV LOTUS_BACKUP_BASE_PATH=/workdir/backup

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

#USER xxx
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/local/bin/lotus", "daemon"]
