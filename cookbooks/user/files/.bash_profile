# 基本設定
export LANG='ja_JP.UTF-8'
export EDITOR='vim'

# PATHの設定
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/opt/php@7.1/bin:$PATH
export PATH=/usr/local/opt/php@7.1/sbin:$PATH

if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi
