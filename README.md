
# Aground 日本語化

![](https://user-images.githubusercontent.com/3500/80439899-8aef3200-8942-11ea-983f-4e94a693dc0b.png)

## これは何？

[Aground](https://store.steampowered.com/app/876650/Aground/) に日本語翻訳を当てるツールです。主に MacOS (たぶん Linux でも動きます) で Aground を楽しみたい方用です。オフィシャルの翻訳ではありません。

翻訳ファイルは、[@CastleOrange1](https://twitter.com/CastleOrange1) さんのファイルを元に(というか殆どが元ファイルのまま)しています。@Castleorange1 さん、翻訳ファイルの公開ありがとうございます。

- https://twitter.com/castleorange1/status/1073614689509072897

Windows ユーザは、@CastleOrange1 さんの上記ツールを利用することで、 Aground 日本語翻訳の大半が動くと思います。

## 日本語化

日本語化は自己責任で行ってください。 Terminal.app などから

```
git clone https://github.com/hotchpotch/Aground-ja_JP-translation
cd Aground-ja_jp-translation
ruby aground_ja.rb
# もしくは steam の Aground のディレクトリを直接指定する
# ruby aground_ja.rb ~/Library/Application Support/Steam/steamapps/common/Aground/

# Windows なら以下のようにAgroundアプリを指すことでうまく動くかも(未確認)
# ruby aground_ja.rb 'C:\Program Files (x86)\Steam\steamapps\common\Aground'
```

を実行すると、以下のように出力され、翻訳ファイルが Aground のディレクトリに追加されるでしょう。

```
ソース文言: 1540, 翻訳済み: 1472 (95.58%)
日本語 xml ファイルを書き込みます
-> /Users/yu1/Library/Application Support/Steam/steamapps/common/Aground/data/core/lang/ja_JP.xml
フォントファイルをコピーします
/Users/yu1/src/github.com/hotchpotch/Aground-ja_JP-translation/fonts/ja_JP.fnt -> /Users/yu1/Library/Application Support/Steam/steamapps/common/Aground/data/core/lang/fonts
/Users/yu1/src/github.com/hotchpotch/Aground-ja_JP-translation/fonts/ja_JP_0.png -> /Users/yu1/Library/Application Support/Steam/steamapps/common/Aground/data/core/lang/fonts
languages.xml ファイルのバックアップを作成します
-> /Users/yu1/Library/Application Support/Steam/steamapps/common/Aground/data/core/lang/languages.xml.backup
languages.xml ファイルを更新します
-> /Users/yu1/Library/Application Support/Steam/steamapps/common/Aground/data/core/lang/languages.xml
```


# その他

フォントは[美咲フォント](https://littlelimit.net/misaki.htm)を利用しています。


