臺灣大學碩博士論文 XeLaTeX 模版 2017 最新版

# 前言 (Brief)
這個模版的前身是 [tzhuan/ntu-thesis](https://github.com/tzhuan/ntu-thesis/wiki)，經過修正和整理成新的板型。
程式碼也大量修正排版和整潔度，
內建開放字型(License included)，
增加各種功能和範例程式碼讓使用快速上手。

但是別忘了最後繳交時，台大要求使用__Times New Roman__和__標楷體__為標準字型，請想辦法安裝這兩個字體並且拿掉__ntuvar.tex__裡面的註解來使用這兩個字型。

# 說明 (Wiki)
請參考 [wiki](https://github.com/tzhuan/ntu-thesis/wiki) 的說明。

# 編譯選項 (Make Options)
* `make fast`
    使用__pdflatex__編譯一次，快速的編譯出結果查看排版，但是不支援中文（只是會變亂碼，不影響）
    Use __pdflatex__ to compile (once) for reviewing the layout and results. Languages other than Chinese will be random characters which does not affect the content.
* `make update`
    正常編譯一次，快速的編譯出結果（支援中文）
    Use normal procedure to compile (once). (Chinese supported)
* `make html`
    將論文輸出成HTML，用來提供複製貼上的方便性（上傳論文時需要做的步驟）
    Generate HTML output for copy-paste part of contents onto the submiting page.
* `PASSWORD="ABCD" make`
    產生出另外一個加密過的pdf檔案（上傳論文時需要做的步驟）
    Generate a separate file with encryption. (A required step when uploading thesis)
* `make bookcover.pdf`
    Generate only __bookcover.pdf__.
* `make`
    Generate all output, including __thesis.pdf__, __bookcover.pdf__, and __cover.pdf__.

# 側邊寬度 (Width of spine in cover page)
## 膠裝 (Adhesive Binding)
The thickness of a page is about 0.12 mm. Please use the following code to calculate the width of spine (mm).
```
python3 -c "pages = 80; print(round(0.12 * pages))"
```

## 精裝 (Hardcover)
The rule of this type is ambiguous, please reference the following samples to find the best for you.
By the way, you can always use wider spine in this kind of packaging, i.e. using 15 mm for 50 pages is also fine.
```
11 mm 50 pages up
13 mm 70 pages below
```

# 建議 (Suggestions)
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


