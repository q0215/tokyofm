# TokyoFM
とりあえず貯めておく。そのうちプレイリストを作成したい。
## 簡易データ整形
データの表記揺れ（大文字/小文字、全角/半角、誤記等）が激しいので正確ではない。  
`find -type f | grep xml | xargs grep -hoP 'artist=\".*?\"|\stitle=\".*?\"' | tr -d '\n' | sed 's/artist/\nartist/g' | grep -v ^$`
