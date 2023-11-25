#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias minecraft='java -jar /home/termai/Games/TLauncher-2.885.jar'
alias ccmus='sudo kill -9 $(pidof cmus)'
alias mpvv='mpv --no-keepaspect-window --sid=1'
PS1='[\u@\h \W]\$ '
#cat ~/.cache/wal/sequences
RANGER_LOAD_DEFAULT_RC=false
export PATH="/home/termai/.local/bin:$PATH"

PATH="/home/termai/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/termai/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/termai/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/termai/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/termai/perl5"; export PERL_MM_OPT;

