# WordnetJapanDiagram

[日本語 WordNet](https://bond-lab.github.io/wnja/jpn/index.html)を利用して、検索キーワードの上位語・下位語を可視化します。

例えば、「プログラミング」を可視化した結果は以下になります。

![wordnet_japan_diagram_20240218193942](https://github.com/tommy-012/wordnet_japan_diagram/assets/46615665/d5c58962-f1e4-4174-9a9f-47407b72f3e1)

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add wordnet_japan_diagram

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install wordnet_japan_diagram

## Usage

### 1. 「日本語 WordNet（SQLite3）」を用意します
[Japanese WordNet SQLite3 file](https://github.com/bond-lab/wnja/releases/download/v1.1/wnjpn.db.gz) をダウンロードして解凍します。

解凍したファイルを適切なパスに移動します。

### 2. コマンドを実行します
「日本語 WordNet（SQLite3）」のデフォルトパスは、`./wnjpn.db` になります。

もしパスを指定したい場合は、`--wordnet_japan_db_file_path` オプションで指定します。

```
$ wordnet_japan_diagram --wordnet_japan_db_file_path ./tmp/wnjpn.db --search_word サウナ

# If you were using bundler
$ bundle exec wordnet_japan_diagram --wordnet_japan_db_file_path ./tmp/wnjpn.db --search_word サウナ
```

### 3. コマンド実行結果を確認します
可視化した画像は、コマンド実行したパス配下に作られます。

もしパスを指定したい場合は、`--output_diagram_path` オプションで指定します。

画像の名前フォーマットは、`wordnet_japan_diagram_[%Y%m%d%H%M%S].png` になります。

![wordnet_japan_diagram_20240218193545](https://github.com/tommy-012/wordnet_japan_diagram/assets/46615665/afbe25cd-2c3b-4662-a1d0-4bc16517b6a0)

### 4. (必要に応じて) 他オプションを確認できます
```
$ wordnet_japan_diagram --help
Usage: wordnet_japan_diagram [-v]

Specific options:
        --wordnet_japan_db_file_path=text
                                     Sets wordnet japan db file path
                                     default: ./wnjpn.db
        --search_word=text           [Required] Sets japanese word to search
        --graph_rankdir=[TB|BT|LR|RL]Sets direction of graph layout
                                     default: BT
                                     TB: Top to bottom
                                     BT: Bottom to top
                                     LR: Left to right
                                     RL: Right to left
        --node_contents=[synset|synset_and_words]
                                     Sets node contents
                                     default: synset_and_words
        --height_from_target=number  Sets height from target node
        --depth_from_target=number   Sets depth from target node
        --output_diagram_path=text   Sets output diagram path (The file extension is either .pdf, .png, .jpg, or .svg)
                                     default: wordnet_japan_diagram_[%Y%m%d%H%M%S].png

Common options:
        --help                       Show this options information
    -v, --version                    Show version and quit.
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/wordnet_japan_diagram. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/wordnet_japan_diagram/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WordnetJapanDiagram project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/wordnet_japan_diagram/blob/main/CODE_OF_CONDUCT.md).
