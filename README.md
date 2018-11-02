# itama_amazon_linux_base
## 概要
Itamaeを使ったAmazonLinux初期設定用のレシピです

## 構築内容
- UTCからJSTへ変更
- 日本語化
- 初期ユーザーの作成
- HostNameの設定
- CentOS6用のリポジトリ追加
- vimやgitなどデフォルトで使いそうなパッケージの追加
- bash,vim,git,sshの設定ファイルを追加

## 使い方
- [Itamaeの使い方はこちらで確認](https://itamae.kitchen/)
- base.jsonに使いたい値を入力して流し込めばその値で構築をしてくれます
## 注意事項
設定完了後一度再起動が必要です