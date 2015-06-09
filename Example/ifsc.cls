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
\RequirePackage[
  paper=a4paper, twoside,
  top=3cm, left=3cm, right=2cm, bottom=2cm
]{geometry}  % to fix margins, paper size, etc


\RequirePackage{tocloft}    % managing table of contents
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



\LoadClass[12pt]{report}


\RequirePackage{ifsc}



%%%%%%%%%%%%%       HEADER           %%%%%%%%%%%%


















%%%%%%%%%%%%%       Environments           %%%%%%%%%%%%


\input ifsc_pretextual.tex


% References level
\numberwithin{equation}{section}
\numberwithin{figure}{chapter}
\numberwithin{table}{chapter}
