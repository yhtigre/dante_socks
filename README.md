# dante_socks

## 概要
Dante SOCKSサーバの構成例について。

## 構成概略図
![構成概略図](https://github.com/yhtigre/dante_socks/blob/imgs/imgs/fig01.png?raw=true)

- クライアント(アプリ)から各外部拠点B～DをVPN接続のようにアクセス可能とする。
- 集約拠点ではsockdが接続先に応じて各外部拠点へ転送を行う。
- 各外部拠点環境に応じて、sockdは「ssh -D ...」プロセスへ転送したり、または直接接続を行う。

## 事前準備
SOCKSクライアント、サーバを構築し、転送用のsshプロセスを常駐しておく。

### SOCKSクライアント
- Linux版
```Bash
```

## 使い方
