#!/bin/sh

#http://d.hatena.ne.jp/mikeda/20120226/1330250904

# 設定ファイルの読み込み
#cd `dirname $0` || exit 1
#source ./sample.conf

# コマンド出力
#set -x 
# 未定義の変数でエラー
#set -u
# コマンド実行時に戻り値0で終了
#set -e

error()
{
  echo "error line:$1"
  exit 1
}

trap 'echo -e error line:$LINENO \\nerror code:$?' ERR  
#---------------------------------------------------------
# Usage
# (e.g) ip_to_httpcode.sh 000.000.000.000
#---------------------------------------------------------

#---------------------------------------------------------
# config
#---------------------------------------------------------
# 引数チェック 
if test "$#" -ne 1;then
  echo -e "引数は一つにしてください"
  error $LINENO
fi
# 引数の値チェック 
if test "$1" = "";then
  echo -e "引数1がありません"
  error $LINENO
fi

#---------------------------------------------------------
#execute
#---------------------------------------------------------
# コマンドの戻り値
#echo $?

IP=$1
curl -I -L --max-time 5 ${IP} 2>> /dev/null |grep "HTTP/1.1 [0-9].." |tail -1

#echo -e "complete."
#exit 1
