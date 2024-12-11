#!/bin/bash 
set -e

alias ll='ls -l' 
# 执行其他的启动命令或逻辑
echo "Container started..."

# 让容器保持运行
tail -f /dev/null
