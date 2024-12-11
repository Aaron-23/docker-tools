# 使用 Ubuntu 24.04 作为基础镜像
FROM ubuntu:24.04

# 设置工作目录
WORKDIR /workdir

#ADD ubuntu.sources  /etc/apt/sources.list.d/ubuntu.sources
# 添加脚本文件
ADD docker-entrypoint.sh /run/docker-entrypoint.sh

# 设置非交互模式，避免安装软件包时的交互问题
ENV DEBIAN_FRONTEND=noninteractive

# 更新 APT 索引并安装必要的软件包
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        tzdata \
        locales \
        curl \
        fio \
        telnet \
        dnsutils \
        vim \
        procps \
        sysbench \
        apache2-utils \
        iperf3 \
        wrk \
        rsync && \
    ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 设置时区和语言环境
ENV TZ="Asia/Shanghai"
ENV LANG="en_US.UTF-8"

# 定义休眠时长（避免默认行为可以通过 ENTRYPOINT 参数覆盖）
ENV SLEEP=9999999999999

# 定义持久化目录
VOLUME /workdir

# 暴露端口
EXPOSE 6688

# 设置脚本执行权限并定义容器入口
RUN chmod +x /run/docker-entrypoint.sh
ENTRYPOINT ["/run/docker-entrypoint.sh"]
