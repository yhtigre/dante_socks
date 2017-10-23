#!/bin/sh
#------------------------------------------------------------------------------------------
# Copyright (c) 2016 TATEIWA-SHACHU, Inc. All rights reserved.
#
#   digs up the tunnel to bases.
#
#------------------------------------------------------------------------------------------

LANG=C
TUN_USER=""          # ssh接続時のユーザ名。
BASESERVER=""        # 外部拠点B 踏台サーバのIPアドレスを設定。
SECRETKEY_PATH=""    # 秘密鍵ファイルのパス名。
SOCKS_FWD_PORT=11081 # ssh -D ... 指定によるSOCKSプロキシサーバのポート番号。


__ssh_fwd_opts__="-q -p 10022 -N -4 -f -oServerAliveInterval=15 -i ${SECRETKEY_PATH} -D ${SOCKS_FWD_PORT} ${TUN_USER}@${BASESERVER}"
__tun_alive__=

check_procs() {
  __tun_alive__=`/bin/ps auxw | /bin/grep -v grep | /bin/grep -- "ssh $__ssh_fwd_opts__" | awk '{print $2}'`
}

start() {
  check_procs

  if [ "$__tun_alive__" = "" ]; then
    /usr/bin/ssh $__ssh_fwd_opts__
  fi
}

stop() {
  check_procs

  if [ "$__tun_alive__" != "" ]; then
    kill $__tun_alive__
  fi

}

status() {
  check_procs
  echo "$__tun_alive__"
}

info() {
  status
  echo "Outside Base B"
}

case "$1" in
start)
  start
  ;;
stop)
  stop
  ;;
status)
  status
  ;;
info)
  info
  ;;
*)
  echo "usage: `basename $0` {start|stop|status|info}"
  exit 1
  ;;
esac

exit 0
