# LoveLive!

[![NPM](https://nodei.co/npm/node-lovelive.png)](https://nodei.co/npm/node-lovelive/)  
[![Build Status](https://travis-ci.org/ota42y/node-lovelive.svg)](https://travis-ci.org/ota42y/node-lovelive)
==========

ラブライブ！用
コール&レスポンスとか、公式サイトのヘッドラインとか。

# Usage
```
lovelive = new LoveLive()

lovelive.call("穂乃果") # ほのか|ﾎﾉｶﾁｬﾝ|高坂穂乃果
# => ファイトだよ！
lovelive.call("ファイトだよ！") # ファイトだよ
# => うんっ！ or ファイトだよ！じゃねーっつーの！！(1%)

lovelive.news() # 公式サイトのヘッドライン
```
