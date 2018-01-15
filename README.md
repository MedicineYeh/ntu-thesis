臺灣大學碩博士論文 XeLaTeX 模版 2018 最新版

# 前言 (Brief)
這個模版的前身是 [tzhuan/ntu-thesis](https://github.com/tzhuan/ntu-thesis/wiki)，經過修正和整理成新的板型。
程式碼也大量修正排版和整潔度，內建開放字型(License included)，增加各種功能和範例程式碼讓使用快速上手，也提供了影印時所需要的封面。

但是別忘了最後繳交時，台大要求使用`Times New Roman`和`標楷體`為標準字型，請想辦法安裝這兩個字體並且拿掉`ntuvars.tex`裡面的註解來使用這兩個字型。
此外，最後繳交時也需要註解`bookcover/bookcover.tex`第16行，取消側邊頁的測試用顏色。

This XeLaTeX template was a huge modification and improvement of [tzhuan/ntu-thesis](https://github.com/tzhuan/ntu-thesis/wiki).
Including fixing the layout of codes, structure of files, etc., this template also uses Free Fonts for compatibility.
In addition, this template also includes LaTex code snippits to help beginners start writing their thesis quickly without much troubles on the syntax.

Do note forget to use `Times New Roman` and `BiaoKai` in the final compilation before printing.
Try to find and install these two fonts and remove the comments in `ntuvars.tex` to use the fonts.
Also, if you are using the generated __bookcover.pdf__, please comment out line 16 in `bookcover/bookcover.tex` for disabling the testing color of the spine page.

# 說明 (Wiki)
請參考 [wiki](https://github.com/tzhuan/ntu-thesis/wiki) 的說明。

# 編譯選項 (Make Options)
* `make fast`
    使用 __pdflatex__ 編譯一次，快速的編譯出結果查看排版，但是不支援中文（只是會變亂碼，不影響）
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

# For Windows Users or Online LaTex users

注意！！為了檔案簡潔度，__bookcover.tex__和__cover.tex__是放在`bookcover`這個資料夾底下，此兩個檔案都是main entry，
所以使用編輯工具（非本專案的Makefile）的使用者會需要自行去編譯這兩個檔案，編譯時需要將檔案複製出來到專案根目錄才會是正確的編譯路徑。

CAUTION!! For the simplicity of files in the repo. root directory, __bookcover.tex__ and __cover.tex__ are placed in `bookcover` folder.
These two files are both main entry files when producing pdf files (__bookcover.pdf__ and __cover.pdf__).
If you are using compiling tools that does not use the Makefile in this project, please copy these two files to the repo. root directory so that the path for compiling these two files will be correct.

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
    * Add transparency to the NTU watermark image


