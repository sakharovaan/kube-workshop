# Set bash timeout
if [ -n "$BASH_VERSION" ] && [ -n "$PS1" ]; then
  readonly TMOUT={{ common_environment_bash_tmout | default('1800') }}
  export TMOUT
fi

# Set prompt
if [[ "$(id -u)" -eq 0 ]]; then
  PS1='[\[\033[01;31m\]$(hostname -f)\[\033[00m\]\[\033[01;94m\]:\w\[\033[00m\]]\n\[\033[01;31m\]\$ \[\033[00m\]'
else
  PS1='[\[\033[01;32m\]\u@\[\033[01;31m\]$(hostname -f)\[\033[00m\]\[\033[01;94m\]:\w\[\033[00m\]]\n\$ '
fi

{{ common_environment_configuration | default('') }}
