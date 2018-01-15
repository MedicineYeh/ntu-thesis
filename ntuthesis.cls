% author: Medicine Yeh
% origin: Tz-Huan Huang [http://www.csie.ntu.edu.tw/~tzhuan]
% version: 0.8

% ----------------------------------------------------------------------------
% "THE CHOCOLATE-WARE LICENSE":
% Tz-Huan Huang wrote this file. As long as you retain this notice you
% can do whatever you want with this stuff. If we meet some day, and you think
% this stuff is worth it, you can buy me a chocolate in return Tz-Huan Huang
% ----------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ntuthesis}[2018/01/15 Thesis template for National Taiwan University]
\def\fileversion{v0.8}
\def\filedate{Jan 15, 2018}

% Derived from book class
\DeclareRobustCommand{\@typeen}{Master}
\DeclareRobustCommand{\@typezh}{碩士}
\DeclareRobustCommand{\@classen}{Thesis}
\DeclareRobustCommand{\@classzh}{論文}
\DeclareOption{master}{\gdef\@typeen{Master}\gdef\@typezh{碩士}\gdef\@classen{Thesis}}
\DeclareOption{phd}{\gdef\@typeen{Doctoral}\gdef\@typezh{博士}\gdef\@classen{Dissertation}}
\DeclareOption{proposal}{\gdef\@typeen{Proposal for Doctoral}\gdef\@typezh{博士論文計畫提案書}\gdef\@classen{Dissertation}\gdef\@classzh{}}
\DeclareRobustCommand{\@setspacing}{\doublespacing}
\DeclareOption{singlespacing}{\gdef\@setspacing{\singlespacing}}
\DeclareOption{onehalfspacing}{\gdef\@setspacing{\onehalfspacing}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass[a4paper,openany,12pt]{book}

% Required packages
\usepackage[top=2cm,left=3cm,bottom=3cm,right=3cm]{geometry}
\usepackage{ifpdf,ifxetex,ifluatex}
\usepackage{setspace}
\usepackage[contents={}]{background}
\usepackage{indentfirst}
\usepackage{amssymb}
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{eso-pic}     % for adding wallpaper watermark - \AddToShipoutPicture
\usepackage{graphicx}    % includegraphics
\usepackage{pgf}         % transparant wallpaper watermark, transparency package does not work on XeLaTex
\usepackage{verbatim}
\usepackage{lipsum}      % http://ctan.org/pkg/lipsum
\usepackage{titletoc}    % http://ctan.org/pkg/titletoc
\usepackage[normalem]{ulem} % Package for underlining
\usepackage{tabularx}    % Provides a column type which expands to fill the specified width of the table

\ifpdf
    \typeout{^^J *** PDF mode *** }
    \GenericWarning{(cont.)\space\space}{Please use XeLaTeX on your machine}
    \usepackage{newtxtext} % Use the font similar to Times New Romann
\else
    \typeout{^^J *** DVI mode ***}
\fi
\ifluatex
    % LuaLaTeX specific code
    \typeout{ *** LuaLaTeX *** ^^J}
\else\ifxetex
    % XeLaTeX specific code
    \typeout{ *** XeLaTeX *** ^^J}
    \usepackage{xeCJK}
    \usepackage{etoolbox}
    \usepackage{fontspec}

    % Set English font
    \setmainfont{LiberationSerif}[
    Path = ./fonts/liberation-serif/,
    UprightFont = *-Regular,
    BoldFont = *-Bold,
    ItalicFont =  *-Italic,
    BoldItalicFont =  *-BoldItalic,
    ]
    % Set CJK font
    \setCJKmainfont[
    Path=./fonts/fonts-arphic-ukai-0.2.20080216.2/,
    AutoFakeBold=3,
    AutoFakeSlant=.3,
    ]
    {ukai.ttc}
    % Use the tex-text mapping for ligatures etc.
    \defaultfontfeatures{Mapping=tex-text}
\else
    \typeout{ *** LaTeX *** ^^J}
\fi\fi

% Set the prefix name in table of contents
\titlecontents{chapter}                           % <section-type>
  [0pt]                                           % <left>
  {}                                              % <above-code>
  {\bfseries\chaptername\ \thecontentslabel\quad} % <numbered-entry-format>
  {\bfseries}                                     % <numberless-entry-format>
  {\bfseries\hfill\contentspage}                  % <filler-page-format>

% Define the name of auto reference
\def\chapterautorefname{Chapter}
\def\sectionautorefname{Chapter}
\def\subsectionautorefname{Chapter}
\def\algorithmautorefname{Algorithm}
\def\figureautorefname{Figure}
\def\tableautorefname{Table}


% Declarations
\DeclareRobustCommand{\university}[2]{\gdef\@universityen{#1}\gdef\@universityzh{#2}}
\DeclareRobustCommand{\college}[2]{\gdef\@collegeen{#1}\gdef\@collegezh{#2}}
\DeclareRobustCommand{\institute}[2]{\gdef\@instituteen{#1}\gdef\@institutezh{#2}}
\DeclareRobustCommand{\title}[2]{\gdef\@titleen{#1}\gdef\@titlezh{#2}}
\DeclareRobustCommand{\author}[2]{\gdef\@authoren{#1}\gdef\@authorzh{#2}}
\DeclareRobustCommand{\studentid}[1]{\gdef\@studentid{#1}}
\DeclareRobustCommand{\advisor}[2]{\gdef\@advisoren{#1}\gdef\@advisorzh{#2}}
\DeclareRobustCommand{\defenseyear}[2]{\gdef\@yearen{#1}\gdef\@yearzh{#2}}
\DeclareRobustCommand{\defensemonth}[2]{\gdef\@monthen{#1}\gdef\@monthzh{#2}}
\DeclareRobustCommand{\defenseday}[1]{\gdef\@day{#1}}
\DeclareRobustCommand{\abstractname}[2]{\gdef\@abstractnameen{#1}\gdef\@abstractnamezh{#2}}
\DeclareRobustCommand{\acknowledgements}[2]{\gdef\@acknowledgementsen{#1}\gdef\@acknowledgementszh{#2}}
\DeclareRobustCommand{\doi}[1]{\gdef\@doi{#1}}
\DeclareRobustCommand{\keywords}[2]{\gdef\@keywordsen{#1}\gdef\@keywordszh{#2}}

\abstractname{Abstract}{摘要}
\acknowledgements{Acknowledgements}{誌謝}

\DeclareRobustCommand{\makecover}{
  \ifpdf
    \textbf{Please use XeLaTeX on your machine (e.g. overleaf).}\\
    \textbf{pdflatex is used only for speed.}\\
    \textbf{You can use pdflatex as a draft to check your English and format your documents.}
  \fi
  \vspace*{0cm}
  \begin{onehalfspace}
  \begin{center}
    \fontsize{18}{27}\selectfont
    \@universityzh\@collegezh\@institutezh\par
      \@typezh{}\@classzh\par
    {\fontsize{14}{21}\selectfont
      \@instituteen\par
      \@collegeen\par}
    {\fontsize{16}{24}\selectfont
      \@universityen\par
      \@typeen{} \@classen\par}
    \vspace{\fill}
    \@titlezh\par
    \@titleen\par
    \vspace{\fill}
    \@authorzh\\
    \@authoren\par
    \vspace{2cm}
    指導教授：\@advisorzh\\
    Advisor: \@advisoren\par
    \vspace{1.5cm}
    中華民國 \@yearzh 年 \@monthzh 月\\
    \@monthen, \@yearen
  \end{center}
  \end{onehalfspace}
  \vspace*{0cm}
}

\DeclareRobustCommand{\maketitlepage}{
  \begin{titlepage}
    \vspace*{0cm}
    \begin{onehalfspace}
    \begin{center}
      \fontsize{18}{27}\selectfont
      \@universityzh\@collegezh\@institutezh\par
        \@typezh{}\@classzh\par
      {\fontsize{14}{21}\selectfont
        \@instituteen\par
        \@collegeen\par}
      {\fontsize{16}{24}\selectfont
        \@universityen\par
        \@typeen{} \@classen\par}
      \vspace{\fill}
      \@titlezh\par
      \@titleen\par
      \vspace{\fill}
      \@authorzh\\
      \@authoren\par
      \vspace{2cm}
      指導教授：\@advisorzh\\
      Advisor: \@advisoren\par
      \vspace{1.5cm}
      中華民國 \@yearzh 年 \@monthzh 月\\
      \@monthen, \@yearen
    \end{center}
    \end{onehalfspace}
    \vspace*{0cm}
  \end{titlepage}
}

\DeclareRobustCommand{\insertdoi}{
  \backgroundsetup{
    contents={\@doi},
    color=black,
    angle=0,
    position={current page.south east},
    scale=0.8,
    opacity=1,
    hshift={-3.5cm},
    vshift={1.5cm}
  }
}

\DeclareRobustCommand\removedoi{\backgroundsetup{contents={}}}

\IfFileExists{watermark.pdf}{
  \DeclareRobustCommand{\insertwatermark}{
    \AddToShipoutPictureBG{%
      \AtTextCenter{%
        \put(\LenToUnit{4.36cm},\LenToUnit{8.17cm}){%
          % NOTE: You can adjust the size and transparency/opacity of the watermark here.
          \scalebox{0.5}{\pgfsetfillopacity{0.75}\includegraphics{watermark.pdf}}
        }
      }
    }
  }
}{
    \DeclareRobustCommand{\insertwatermark}{}
}

\DeclareRobustCommand\removewatermark{\ClearShipoutPicture}

%  stolen from CJKfntef
%
%  myCJKfilltwosides environment:
%    Align CJK characters to fill two sides.
%
%  Usage:
%    \begin{myCJKfilltwosides}{width}
%      first line \\
%      second line \\
%      ... \\
%      last line
%    \end{myCJKfilltwosides}
%
\newif\ifmyCJK@fillbegin@
\global\myCJK@fillbegin@false
\newif\ifmyCJK@filltwosides@
\global\myCJK@filltwosides@false

\newenvironment{myCJKfilltwosides}[1]{
  \leavevmode
  \vbox\bgroup
    \global\myCJK@filltwosides@true
    \global\let\myCJK@filltwosidesSymbol \CJKsymbol

    \def\myCJK@ftscr{
      \egroup
      \global\myCJK@fillbegin@false
      \hbox to #1\bgroup
        \ignorespaces}

    \let\\ \myCJK@ftscr

    \def\CJKsymbol##1{
      \ifmyCJK@fillbegin@
        \hfill
        \myCJK@filltwosidesSymbol{##1}
      \else
        \myCJK@filltwosidesSymbol{##1}
        \global\myCJK@fillbegin@true
      \fi}

    \hbox to #1\bgroup
      \ignorespaces
 }{
  \egroup
  \egroup

  \global\let\CJKsymbol \myCJK@filltwosidesSymbol
  \global\myCJK@fillbegin@false
  \global\myCJK@filltwosides@false
}
\def\CJKmovesymbol#1{\raise.35em\hbox{#1}}
\def\CJKmove{\let\CJKsymbol\CJKmovesymbol
\let\CJKpunctsymbol\CJKsymbol}

\DeclareRobustCommand{\drawspine}[3]{
  \noindent\rotatebox{-90}{
    %\CJKfamily{spinepagefontzh}
    \addCJKfontfeatures{RawFeature={vertical}}
    \centering
    \begin{tabular}{m{3.5cm}m{0.5cm}m{2cm}m{0.1cm}m{12cm}m{1cm}m{2.5cm}m{0.1cm}m{1.5cm}}
      \vspace{-0.45em}
      \fontsize{#1}{#2}\selectfont
      \begin{CJKfilltwosides}{3.5cm}\CJKmove{\@universityzh} \\
      \CJKmove{\@institutezh}\end{CJKfilltwosides} & &
      \CJKmove{\fontsize{#3}{#3}\selectfont\@typezh\@classzh} & &
      {\fontsize{#3}{#3}\selectfont\CJKmove{\@titlezh}} & &
      {\fontsize{#3}{#3}\selectfont\CJKmove{\@authorzh{}~~撰}} & &
      {\fontsize{#3}{#3}\selectfont
       \rotatebox[origin=m]{90}{\centering\@yearzh{}}
       \rotatebox[origin=m]{90}{\centering\@monthzh{}}}
    \end{tabular}
  }
}

\DeclareRobustCommand{\makespine}{
  \thispagestyle{empty}
  \ifxetex
    \vspace{-2cm}
    \drawspine{12}{8}{14}
    \hspace{5cm}
    \drawspine{10}{4}{10}
    \hspace{5cm}
    \drawspine{8}{4}{8}
  \else
    \noindent\rotatebox{-90}{
      \hyphenpenalty=10000
      \begin{tabular}{m{4cm}m{0.1cm}m{2cm}m{0.1cm}m{10cm}m{1cm}m{2.5cm}m{0.1cm}m{1.5cm}}
        \fontsize{6}{4}\selectfont
        \CJKmove{\@universityen}
        \CJKmove{\@instituteen} & &
        \CJKmove{\@typeen\@classen} & &
        {\fontsize{12}{12}\selectfont\CJKmove{\@titleen}} & &
        {\fontsize{12}{12}\selectfont\CJKmove{\@authoren{}}} & &
        {\fontsize{10}{10}\selectfont
         \rotatebox[origin=c]{90}{\hspace{-0.3em}\@yearen{}}
         \rotatebox[origin=c]{90}{\hspace{-0.3em}\@monthen{}}}
      \end{tabular}
    }
  \fi
  \if@openright\cleardoublepage\else\clearpage\fi
}

\DeclareRobustCommand{\makecertification}[2][angle=0]{
  \if@openright\cleardoublepage\else\clearpage\fi
  %\thispagestyle{empty}
  \phantomsection
  \addcontentsline{toc}{chapter}{口試委員會審定書}
  \IfFileExists{#2} {
    \includepdf[#1]{#2}
  } {
    \begin{singlespace}
    \begin{center}
      \fontsize{24}{36}\selectfont\@universityzh\@typezh{}學位\@classzh\\
      口試委員會審定書\par
      \vspace{0.5cm}
      {\fontsize{20}{30}\selectfont\@titlezh\par\@titleen\par}
    \end{center}
    \vspace{1cm}
    \fontsize{15}{24}\selectfont
    \hspace{30pt}本論文係\@authorzh{}君 (學號\@studentid)
    在\@universityzh\@institutezh{}完成之\@typezh{}學位\@classzh，%
    於民國 \@yearzh 年 \@monthzh 月 \@day 日%
    承下列考試委員審查通過及口試及格，特此證明\par
    \end{singlespace}
    \vspace{\fill}
    \begin{center}
    \begin{doublespace}
    \fontsize{15}{30}\selectfont
    \begin{tabular}{p{2.75cm}p{12.5cm}}
      \raisebox{30pt}{口試委員：} & \rule{11.5cm}{1pt} \\
      & \rule{5cm}{1pt}\hspace{1.5cm}\rule{5cm}{1pt} \\
      & \rule{5cm}{1pt}\hspace{1.5cm}\rule{5cm}{1pt} \\
      & \rule{5cm}{1pt}\hspace{1.5cm}\rule{5cm}{1pt} \\
      & \rule{5cm}{1pt}\hspace{1.5cm}\rule{5cm}{1pt} \\
      \raisebox{5pt}{所\hspace{15pt}長：} & \rule{8.5cm}{1pt}
    \end{tabular}
    \end{doublespace}
    \end{center}
    \vspace*{-1cm}
  }
}

\DeclareRobustCommand{\makebibliography}{
    % Correct the bookmark of Bibliography and set up the style
    \if@openright\cleardoublepage\else\clearpage\fi
    \phantomsection
    \addcontentsline{toc}{chapter}{\bibname}
}

\newenvironment{quotationpage}[1]
  {\if@openright\cleardoublepage\else\clearpage\fi
   \chapter*{\centerline{#1}}
   \addcontentsline{toc}{chapter}{#1}
   \quotation}
  {\endquotation}

\newenvironment{abstracten}
  {\begin{quotationpage}{\@abstractnameen}}
  {\hfill\break\textbf{Keywords: }\@keywordsen\end{quotationpage}}
\newenvironment{abstractzh}
  {\begin{quotationpage}{\@abstractnamezh}}
  {\hfill\break\textbf{關鍵字：}\@keywordszh\end{quotationpage}}
\newenvironment{acknowledgementsen}{\begin{quotationpage}{\@acknowledgementsen}}{\end{quotationpage}}
\newenvironment{acknowledgementszh}{\begin{quotationpage}{\@acknowledgementszh}}{\end{quotationpage}}

\setcounter{tocdepth}{2}
\pagestyle{plain}
\@setspacing

