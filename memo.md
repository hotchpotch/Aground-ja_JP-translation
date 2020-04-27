# フォント関連

`.fnt` という拡張子の、bitmap ファイル(PNG)とフォントの文字コードのマッピングしているファイルと、そのマッピング先の bitmap フォントを作る必要がある。

## fnt ファイルの作成

フォント元のファイルとして、無償で使える bitmap TrueType フォントの [美咲フォント](https://littlelimit.net/misaki.htm) を使う。fnt と png の生成には [fontbm](https://github.com/vladimirgamalyan/fontbm) を使う。

また、ttf ファイルから利用できる文字一覧を取得するために、[ttf-chars.rb](https://gist.github.com/hotchpotch/c150199681482b2e5b7a7d1b5c4660fd) というスクリプトを作った。

で、こんな感じで作る。

```
$ ruby ttf-chars.rb ./misaki_ttf_2019-10-19/misaki_gothic_2nd.ttf > misaki_chars.txt
$ ./fontbm --font-file ./misaki_ttf_2019-10-19/misaki_gothic_2nd.ttf --font-size 8 --output ja_JP --data-format xml --chars-file misaki_chars.txt --texture-width=1024 --texture-height=1024
```

当初は [PixelMplus](http://itouhiro.hatenablog.com/entry/20130602/font) の 10px のフォントサイズで作ったが、10px だと場所によって文字がはみ出るので、8pxフォントである美咲フォントを利用した。


## Mac で生成してうまく行かなかった記録

Mac で、かつ文字数が多いとうまく動く無料の物が見つからなかった。ブラウザで利用できる [http://kvazars.com/littera/](http://kvazars.com/littera/) は文字数が多いためか固まるし、[FontBuilder](https://github.com/andryblack/fontbuilder) はうまく動く、かと思いきや、出力した fnt ファイルが Aground ではうまく動かない…。

ので結局 Linux 上で fontbm を使うことになった。


## その他

- [How to generate and use Bitmap Font in melonJS](https://github.com/melonjs/melonJS/wiki/How-to-generate-and-use-Bitmap-Font-in-melonJS)
  - 詳しい
- http://www.angelcode.com/products/bmfont/
  - Windows があるならこれ使うのが良さそう。(手元に Windows が無い…)

