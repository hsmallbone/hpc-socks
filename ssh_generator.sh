#!/bin/bash --login
PROJECT_NAME=''
APP_PORT=7860
PROXY_JUMP='setonix.pawsey.org.au'
NODE=$(squeue --user $USER --states RUNNING --name $PROJECT_NAME --Format NodeList --noheader)
if ! test -f "$HOME/.ssh/config" || grep -qF "remote-socks-node" "$HOME/.ssh/config"; then
  echo "Generating SSH config"
  cat <<EOF >>$HOME/.ssh/config
    Host remote-socks-node
      User $USER
      Hostname xxx
      ProxyJump $PROXY_JUMP
  EOF
fi
sed -i -E s"/Hostname.*/Hostname $NODE/" ~/.ssh/config
echo "Rewritten socks host to $HOST"
ssh -f -N -L $APP_PORT:localhost:$APP_PORT remote-socks-node
