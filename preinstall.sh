docker container prune
#!/bin/bash
set -e

# 设置 DEBIAN_FRONTEND 为 noninteractive，避免交互式提示
export DEBIAN_FRONTEND=noninteractive

# 配置时区为 UTC，避免 tzdata 的交互提示
ln -fs /usr/share/zoneinfo/UTC /etc/localtime


apt-get update && \
    apt-get install -y make build-essential clang-12 git wget

update-alternatives \
  --install /usr/lib/llvm              llvm             /usr/lib/llvm-12  20 \
  --slave   /usr/bin/llvm-config       llvm-config      /usr/bin/llvm-config-12  \
    --slave   /usr/bin/llvm-ar           llvm-ar          /usr/bin/llvm-ar-12 \
    --slave   /usr/bin/llvm-as           llvm-as          /usr/bin/llvm-as-12 \
    --slave   /usr/bin/llvm-bcanalyzer   llvm-bcanalyzer  /usr/bin/llvm-bcanalyzer-12 \
    --slave   /usr/bin/llvm-c-test       llvm-c-test      /usr/bin/llvm-c-test-12 \
    --slave   /usr/bin/llvm-cov          llvm-cov         /usr/bin/llvm-cov-12 \
    --slave   /usr/bin/llvm-diff         llvm-diff        /usr/bin/llvm-diff-12 \
    --slave   /usr/bin/llvm-dis          llvm-dis         /usr/bin/llvm-dis-12 \
    --slave   /usr/bin/llvm-dwarfdump    llvm-dwarfdump   /usr/bin/llvm-dwarfdump-12 \
    --slave   /usr/bin/llvm-extract      llvm-extract     /usr/bin/llvm-extract-12 \
    --slave   /usr/bin/llvm-link         llvm-link        /usr/bin/llvm-link-12 \
    --slave   /usr/bin/llvm-mc           llvm-mc          /usr/bin/llvm-mc-12 \
    --slave   /usr/bin/llvm-nm           llvm-nm          /usr/bin/llvm-nm-12 \
    --slave   /usr/bin/llvm-objdump      llvm-objdump     /usr/bin/llvm-objdump-12 \
    --slave   /usr/bin/llvm-ranlib       llvm-ranlib      /usr/bin/llvm-ranlib-12 \
    --slave   /usr/bin/llvm-readobj      llvm-readobj     /usr/bin/llvm-readobj-12 \
    --slave   /usr/bin/llvm-rtdyld       llvm-rtdyld      /usr/bin/llvm-rtdyld-12 \
    --slave   /usr/bin/llvm-size         llvm-size        /usr/bin/llvm-size-12 \
    --slave   /usr/bin/llvm-stress       llvm-stress      /usr/bin/llvm-stress-12 \
    --slave   /usr/bin/llvm-symbolizer   llvm-symbolizer  /usr/bin/llvm-symbolizer-12 \
    --slave   /usr/bin/llvm-tblgen       llvm-tblgen      /usr/bin/llvm-tblgen-12

update-alternatives \
  --install /usr/bin/clang                 clang                  /usr/bin/clang-12     20 \
  --slave   /usr/bin/clang++               clang++                /usr/bin/clang++-12 \
  --slave   /usr/bin/clang-cpp             clang-cpp              /usr/bin/clang-cpp-12
