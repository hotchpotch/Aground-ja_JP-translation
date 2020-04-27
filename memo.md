# フォント関連

`.fnt` という拡張子の、bitmap ファイル(PNG)とフォントの文字コードのマッピングしているファイルと、そのマッピング先の bitmap フォントを作る必要がある。

## fnt ファイルの作成

フォント元のファイルとして、無償で使える綺麗な bitmap フォントの TTF の [PixelMplus](http://itouhiro.hatenablog.com/entry/20130602/font) を使う。fnt と png の生成には [fontbm](https://github.com/vladimirgamalyan/fontbm) を使う。

また、ttf ファイルから利用できる文字一覧を取得するために、[ttf-chars.rb](https://gist.github.com/hotchpotch/c150199681482b2e5b7a7d1b5c4660fd) というスクリプトを作った。

で、こんな感じで作る。残念ながらフォントスムージングはきかせられなさそうなので等倍を。

```
$ ruby ttf-chars.rb ./PixelMplus-20130602/PixelMplus10-Regular.ttf > pixel_mplus_chars.txt
$ ./fontbm --font-file ./PixelMplus-20130602/PixelMplus10-Regular.ttf --font-size 10 --output ja_JP --data-format xml --chars-file pixel_mplus_chars.txt --texture-width=1024 --texture-height=1024
```

## Mac で生成する

Mac で、かつ文字数が多いとうまく動く無料の物が見つからなかった。ブラウザで利用できる [http://kvazars.com/littera/](http://kvazars.com/littera/) は文字数が多いためか固まるし、[FontBuilder](https://github.com/andryblack/fontbuilder) はうまく動く、かと思いきや、出力した fnt ファイルが Aground ではうまく動かない…。

ので結局 Linux 上で fontbm を使うことになった。


## その他

- [How to generate and use Bitmap Font in melonJS](https://github.com/melonjs/melonJS/wiki/How-to-generate-and-use-Bitmap-Font-in-melonJS)
  - 詳しい
- http://www.angelcode.com/products/bmfont/
  - Windows があるならこれ使うのが良さそう。(手元に Windows が無い…)

