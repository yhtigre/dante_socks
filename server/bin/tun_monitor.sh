#!/bin/sh
#------------------------------------------------------------------------------------------
# Copyright (c) 2016 TATEIWA-SHACHU, Inc. All rights reserved.
#
#   digs up the tunnel to bases.
#
#------------------------------------------------------------------------------------------

LANG=C
PROG_TAG=`basename $0`
FACILITY=user
PRIORITY=warn
TUN_PROG_PATH=""    # トンネル接続スクリプトの配置パス。
SHELL=/bin/sh

logging() {
  logger -i -t $PROG_TAG -p "${FACILITY}.${PRIORITY}" "$1"
}

recover_tunnel() {
  ${SHELL} ${TUN_PROG_PATH}/$1 stop
  ${SHELL} ${TUN_PROG_PATH}/$1 start
  logging "It recoverd the tunneling of $1"
}

for p in 11081_tun.sh 11082_tun.sh
do
  stat=`${SHELL} "${TUN_PROG_PATH}/${p}" status 2> /dev/null`

  if [ -z $stat ]; then
    recover_tunnel $p
  fi

done

exit 0
