# 基础别名
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# 代理配置
PROXY_IP=$(ip route show | grep -i default | awk '{ print $3}')
export ALL_PROXY="http://${PROXY_IP}:7890"
export http_proxy="http://${PROXY_IP}:7890"
export https_proxy="http://${PROXY_IP}:7890"

# ====================== 环境工具加载 ======================

# NVM (Node 版本管理器)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Bun 路径
export PATH="/home/catyugu/.bun/bin:$PATH"

# Conda (Miniconda3)
__conda_setup="$('/home/catyugu/miniconda3/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "/home/catyugu/miniconda3/etc/profile.d/conda.sh" ]; then
    . "/home/catyugu/miniconda3/etc/profile.d/conda.sh"
  else
    export PATH="/home/catyugu/miniconda3/bin:$PATH"
  fi
fi
unset __conda_setup

# GHCup (Haskell)
[ -f "/home/catyugu/.ghcup/env" ] && . "/home/catyugu/.ghcup/env"
alias config='/usr/bin/git --git-dir=/home/catyugu/.cfg/ --work-tree=/home/catyugu'

if [ $PWD = $USERPROFILE ]; then
  cd ~
fi
