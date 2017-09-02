臺灣大學碩博士論文 XeLaTeX 模版 2017 最新版

# 前言
這個模版的前身是 [tzhuan/ntu-thesis](https://github.com/tzhuan/ntu-thesis/wiki)，經過修正和整理成新的板型。

# 說明
請參考 [wiki](https://github.com/tzhuan/ntu-thesis/wiki) 的說明。

# Make Options
* `make fast`
    使用__pdflatex__編譯一次，快速的編譯出結果查看排版，但是不支援中文
* `make update`
    正常編譯一次，快速的編譯出結果（支援中文）
* `make html`
    將論文輸出成HTML，用來提供複製貼上的方便性（上傳論文時需要做的步驟）
* `PASSWORD="ABCD" make`
    產生出另外一個加密過的pdf檔案（上傳論文時需要做的步驟）

# Suggestions
* If `minted` is not used in your thesis, comment out that package for improving the speed.

# Changelog
  * v0.8
    * Add font support and fix Table Of Contents
    * Add many package supports
    * Separate cover page and title page
    * Add spine page (comes with various size)
    * Add HTML output
    * Add various make option
    * Improve compile speed
    * Many fixes
    * Add LaTex sample codes and structures of files/folders/texts


