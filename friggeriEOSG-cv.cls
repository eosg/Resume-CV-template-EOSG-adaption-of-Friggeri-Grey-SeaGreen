\ProvidesClass{friggeriEOSG-cv}[2016/12/20 CV class]
%adapted from {friggeri-cv}[2012/04/30 CV class] to print in A4 size, with alternative fonts, vertical line divider and seagreen/grey colour scheme
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


% set A4 paper format
\setlength\paperheight {297mm}
\setlength\paperwidth  {210mm}

%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{seagreenblue}{HTML}{20B2AA}

\ifdefined\@cv@print
%  \colorlet{green}{gray}
%  \colorlet{orange}{gray}
%  \colorlet{purple}{gray}
 % \colorlet{brown}{gray}
 % \colorlet{red}{gray}
 % \colorlet{blue}{gray}
 % \colorlet{blue2}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray} %change to seagreenblue for whole word of headings in colour



%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}


\newfontfamily\bodyfont[]{TeX Gyre Heros}
\newfontfamily\thinfont[]{TeX Gyre Heros Cn}
\newfontfamily\headingfont[]{TeX Gyre Heros Bold}
\newfontfamily\firstnamefont[]{TeX Gyre Heros Bold}
\newfontfamily\surnamefont[]{TeX Gyre Heros Cn}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text, Color=textcolor]{TeX Gyre Heros}

\setmathfont[Color=textcolor]{XITS Math}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\firstnamefont #1}{\surnamefont  #2}
     %{\thinfont #1}{\bodyfont  #2}
     %{\headingfont #1}{\thinfont  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{2.5cm} %starting of professional summary from bottom of top graphic banner
  \vspace{-2\parskip}
}



%%%%%%%%%%%%%%%%
%Background Vertical Divider Line %
%%%%%%%%%%%%%%%%

\RequirePackage{background}
\SetBgScale{1}
\SetBgAngle{0}
\SetBgColor{seagreenblue}
\SetBgContents{\rule{1pt}{\paperheight}}
\SetBgHshift{-4.9cm}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        seagreenblue\or%
        seagreenblue\or%
        seagreenblue\or%
        seagreenblue\or%
        seagreenblue\or%
        seagreenblue\or%
        seagreenblue\or%
        seagreenblue\or%
        seagreenblue\or%
        seagreenblue\or%
        seagreenblue\or%
        seagreenblue\or%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}


\renewcommand{\subsection}[1]{
  %\par\vspace{.5\parskip}% commented off for left margin page two headings to match side bar
  {\Large\headingfont\color{headercolor} #1}
  %\par\vspace{.25\parskip}% commented off for left margin page two headings to match side bar
}

\renewcommand{\subsubsection}[2]{
  \par\vspace{.5\parskip}%
  {\Large\headingfont\color{headercolor} #2}
  \par\vspace{.15\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{textcolor}}
\newcommand{\entry}[4]{%
  #1&\parbox[t]{11.8cm}{%
    \textbf{#2}%
    \hfill%
    {\small\addfontfeature{Color=gray} #3}\\%
    #4\vspace{0.3\parsep}%
  }\\}



%%%%%%%%%%%%%%%%%%%%
% List environment b  added by eosg%
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylistb}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{textcolor}}
\newcommand{\entryb}[4]{%
  #1&\parbox[t]{11.8cm}{%
    \textbf{#2}%
    \hfill%
    {\small\addfontfeature{Color=gray} #3}\\%[5pt]%
    #4\vspace{0.3\parsep}% original 0.3par skip
  }\\}


%%%%%%%%%%%%%%%%%%%%
% List environment two column, pg 2%
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylistDoublecol}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{textcolor}}
\newcommand{\entryDoublecol}[2]{%
\parbox[t]{4cm}{\raggedleft \textbf{#1}} &\hspace*{0.7cm} \parbox[t]{13.2cm}{%
      %\hfill%
    #2\vspace{0.5\parsep}%
  }\\}


%%%%%%%%%%%%%%%%%%%%
% List environment two column, pg 1 %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylistDoublecolhalf}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{textcolor}}
\newcommand{\entryDoublecolhalf}[2]{%
\parbox[t]{3.4cm}{\textbf{#1} } &\hspace*{0.25cm} \parbox[t]{9.6cm}{%
      %\hfill%
    #2\vspace{0.3\parsep}%
  }\\}



%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1} %uncomment this line for plain grey headings in side bar
 %\par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} \@sectioncolor #1} %uncomment this line for3 letter colour then grey headings in side bar
  }
  \begin{textblock}{4.4}(1.0, 4.33)%{3.6}(1.5, 4.33) {h-width}(x-pos, y-pos)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}




%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.3cm,top=2.0cm,right=1.5cm,bottom=2.0cm,nohead,nofoot]{geometry} %6.3  is number cm from left border before professional summary starts
\RequirePackage{hyperref}
\hypersetup{
    colorlinks=false,       
    linkcolor=red,          
    citecolor=red,        
    filecolor=red,      
    urlcolor = red}
    
% A fix for \href{}{} colors not working with fontspec
\makeatletter
\def\HyColor@@@@UseColor#1\@nil{\addfontfeatures{Color=#1}}
\makeatother
