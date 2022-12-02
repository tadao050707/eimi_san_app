# README


## カタログ設計, テーブル設計
https://docs.google.com/spreadsheets/d/e/2PACX-1vSRQN54k3MN_VwuyVJr9PlewLS2Y6AR-_ftvcuTe7b5L4XSqBJqo_KnHMyuRV9NBVDIXpDvc9ccRTJV/pubhtml

## ER図
![](image/ERD.png)
https://lucid.app/documents/view/5cc8bef7-9e67-48b2-9158-365f619bf22a

## 画面遷移図
![](image/STD.png)
https://lucid.app/documents/view/474f50e1-0de3-4287-9fdb-3240f62c8149

## フレームワーク
https://www.figma.com/file/X25dvbN8979AyZG8O2DIff/%E7%84%A1%E9%A1%8C?t=2ah7eAHOcE2V90Jh-1

## 開発言語  
Ruby 3.0.1  
Ruby on Rails 6.0.3

## 就業Termの技術
- Devise
- お気に入り機能

## カリキュラム外の技術
- The Dog API
- gem wicked 

## 実行手順
お使いのPCにredisがインストールされていない場合はredisをインストールして起動

```
$ brew install redis
$ brew services start redis
```
インストール済みの方はここから
```
$ git clone git@github.com:kudoueimii/Wonder.git
$ cd wonder
$ bundle
$ rails db:create
$ rails db:migrate
$ rails db:seed
$ rails s
```