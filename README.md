# dante_socks

## 概要
Dante SOCKSサーバの構成例について。

## 構成概略
![構成概略図](https://github.com/yhtigre/dante_socks/blob/imgs/imgs/fig01.png?raw=true)

- SOCKSプロトコルについては、[リモートアクセス環境におけるセキュリティ](https://www.ipa.go.jp/security/awareness/administrator/remote/index.html)などを参照。
- クライアント(アプリ)から各外部拠点B～DをVPN接続のようにアクセス可能とする。
- 集約拠点ではsockdが接続先に応じて各外部拠点へ転送を行う。
- 各外部拠点環境に応じて、sockdは「ssh -D ...」プロセスへ転送したり、または直接接続を行う。

## SOCKSクライアント

### Linux版
- EPELリポジトリからyumで導入する。
```Bash
$ sudo yum install tsocks
```

### Windows版
- [ProxyCap](http://www.proxycap.com/)
	ユーザインタフェースが洗練されていておすすめなのは ProxyCapは有償製品であり、$30/3年のライセンス費用が掛かる(30日試用可能)。
- [SocksCap64](https://www.sockscap64.com/en/homepage/) 
	aaaaaaaaa

## 使い方
