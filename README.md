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
	- 有償製品であり、$30/3年のライセンス費用が掛かる(30日試用可能)。
	- ユーザインタフェースが洗練されていておすすめ。
- [SocksCap64](https://www.sockscap64.com/en/homepage/) 
	- 無償で利用可能。

## SOCKSサーバ

- Dante SOCKSサーバのソースコードを入手する。
```Bash
$ wget https://www.inet.no/dante/files/dante-1.4.1.tar.gz
```
- ソースからRPMパッケージを生成する。
```Bash
$ sudo yum install rpm-build
$ sudo yum install gcc gcc-c++ glibc glibc-devel
$ sudo yum install pam-devel bison flex
$ rpmbuild -ta ./dante-1.4.1.tar.gz
```
- RPMパッケージを導入する。
```Bash
$ cd ~/rpmbuild/RPMS/x86_64
$ sudo rpm -ivh dante-1.4.1-1.el6.x86_64.rpm dante-devel-1.4.1-1.el6.x86_64.rpm dante-server-1.4.1-1.el6.x86_64.rpm
```
