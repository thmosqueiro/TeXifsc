%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% IFSC.CLS
%
% version 1.1
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%      PREAMBLES               %%%%%%%%%%%%

\ProvidesClass{ifsc}[2015/06/01 version 2.0 IFSC LaTeX Class]
\NeedsTeXFormat{LaTeX2e}




%%%%%%%%%%%%%   PACKAGES REQUIREMENTS      %%%%%%%%%%%%


\RequirePackage{ifthen}    % conditions in LaTeX
\RequirePackage{calc}      % standard package for length and number easy calculations
\RequirePackage[paper=a4paper]{geometry}  % to fix margins, paper size, etc

\RequirePackage{setspace}
\RequirePackage{fancyhdr}  % managing the header
\RequirePackage[latin1]{inputenc}  % Acentos em portugues
\RequirePackage[T1]{fontenc}
\RequirePackage[portuges]{babel}

\RequirePackage{amsmath}   % AMS math environments for LaTeX
\RequirePackage{amssymb}
\RequirePackage{amsbsy}

\RequirePackage[usenames,dvipsnames]{pstricks}
\RequirePackage{epsfig}


% Citation
%\RequirePackage[numbers, comma, round, sort&compress]{natbib}


% Less important packages
%\IfFileExists{dsfont.sty}{\RequirePackage{dsfont}}{} % double stroke fonts (as IR, IN, etc)




%%%%%%%%%%%%%      DEFINITIONS       %%%%%%%%%%%%


%% Fonts
\renewcommand{\familydefault}{\sfdefault}
\newcommand{\MainFont}{\bfseries}


\newcommand{\ABNTsectionfont}{\MainFont}
\newcommand{\ABNTchapterfont}{\MainFont\slshape}


%% Page Styles
\newcommand{\chaptertitlepagestyle}{plain}



% Using links in the TOC if hyperref is loaded
\newboolean{ABNThypertoc}
\AtBeginDocument{
\espaco{\ABNTespacodefault}
\@ifpackageloaded{hyperref}
                 {\setboolean{ABNThypertoc}{true}}
                 {\setboolean{ABNThypertoc}{false}}
}



%%%%%%%%%%     COMMAND DEFINITIONS    %%%%%%%%%%%%


%% Espacos

% Definindo alguns espacamentos
\newcommand*{\taxaespacosimples}{1.}
\newcommand*{\taxaespacoumemeio}{1.35}
\newcommand*{\taxaespacoduplo}{1.7}



% Ambientes para alterar o espacamento local
\newenvironment{espacosimples}
  {\begin{spacing}{\taxaespacosimples}}{\end{spacing}}
\newenvironment{espacoumemeio}
  {\begin{spacing}{\taxaespacoumemeio}}{\end{spacing}}
\newenvironment{espacoduplo}
  {\begin{spacing}{\taxaespacoduplo}}{\end{spacing}}


% Opcao pra mudar o espacamento geral 
\newcommand*{\ABNTespacodefault}{} %




\newboolean{ABNTinpretext}
\setboolean{ABNTinpretext}{true}

\newboolean{ABNTaftertoc}
\setboolean{ABNTaftertoc}{false}



%%%%%%%%%%%%%      NAME DEFINITIONS       %%%%%%%%%%%%

\providecommand{\ABNTtoctitulo}{Sum\'ario}
\providecommand{\ABNTtottitulo}{Lista de Tabelas}
\providecommand{\ABNTtoftitulo}{Lista de Figuras}
\providecommand{\ABNTagradecimentostitulo}{Agradecimentos}


%--- NAMES ---
\renewcommand{\thefootnote}{\fnsymbol{footnote}}
\newcommand{\ABNTbibliographyname}{REFER\^ENCIAS}
\renewcommand{\ABNTtoctitulo}{SUM\'ARIO}
\renewcommand{\ABNTtottitulo}{LISTA DE TABELAS}
\renewcommand{\ABNTtoftitulo}{LISTA DE FIGURAS}
\renewcommand{\ABNTagradecimentostitulo}{AGRADECIMENTOS}




%%%%%%%%          LOADING THE BASE CLASS           %%%%%%%%%

\LoadClass[12pt]{report}

\geometry{paper=a4paper, twoside, top=3cm, left=3cm, right=2cm, bottom=2cm}
\RequirePackage{ifsc}

\RequirePackage[labelfont=bf, format=hang]{caption}



%%%%%%%%%%%%%       HEADER           %%%%%%%%%%%%






%%%%%%%%%    SETTING TOCLOFT VARIABLES      %%%%%%%%%


\RequirePackage{tocloft}    % managing table of contents

%% Setting what is displayed in the TOC
\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{2}

%% Setting indents
\cftsetindents{section}{0.cm}{0.9cm}
\cftsetindents{subsection}{0.cm}{0.9cm}
\cftsetindents{subsubsection}{0.cm}{0.9cm}

%% Item separation
\renewcommand\cftchapafterpnum{\vskip7pt}
\renewcommand\cftsecafterpnum{\vskip7pt}

%% All fonts
\renewcommand{\cftchapfont}{\large\normalfont}
\renewcommand{\cftchappagefont}{\normalfont}
\renewcommand{\cftsecfont}{\large\normalfont}
\renewcommand{\cftsecpagefont}{\normalfont}
\renewcommand{\cftsubsecfont}{\large\normalfont}
\renewcommand{\cftsubsecpagefont}{\normalfont}
\renewcommand{\cftsubsubsecfont}{\large\normalfont}
\renewcommand{\cftsubsubsecpagefont}{\normalfont}


%% Adding the word Capitulo before chapter.
\newcommand{\IFSCchapname}{Cap\'itulo}
\renewcommand{\cftchappresnum}{\IFSCchapname ~}
\newcommand{\IFSCchapsep}{}
\renewcommand{\cftchapaftersnum}{\IFSCchapsep}
\renewcommand{\cftchapnumwidth}{2.3cm}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}



%%%%%%%%%          ENVIRONMENTS           %%%%%%%%%%


\newcommand{\chaptertype}{}%
\renewcommand\chapter%
    {%
      \cleardoublepage
      \thispagestyle{\chaptertitlepagestyle}
      \ifthenelse{\boolean{ABNTinpretext}}%
       {%
        \ifthenelse{\boolean{ABNTaftertoc}}%
          {% change to textual part
           \setboolean{ABNTinpretext}{false}%
           \ABNTBeginOfTextualPart%
          }%
          {}%
       }% 
       {}%
     \global\@topnum\z@%
     \@afterindentfalse%
%     \ABNTsecdef\@chapter\@schapter%
    \secdef\@chapter\@schapter%
    }




\input ifsc_pretextual.tex


% References level
\numberwithin{equation}{section}
\numberwithin{figure}{chapter}
\numberwithin{table}{chapter}