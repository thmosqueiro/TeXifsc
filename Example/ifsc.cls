%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% IFSC.CLS
%
% version 1.1
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%      PREAMBLES               %%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}%
\input{cvs-id.def}
\CVSExtract$Id: abnt.cls,v 1.27.2.1 2004/11/02 15:04:29 gweber Exp $
\CVSClass{ifsc}



%%%%%%%%%%%%%   PACKAGES REQUIREMENTS      %%%%%%%%%%%%


\RequirePackage{ifthen}    % conditions in LaTeX
\RequirePackage{calc}      % standard package for length and number easy calculations
\RequirePackage{toclof}    % managing table of contents
\RequirePackage{setspace}
\RequirePackage{geometry}  % to fix margins, paper size, etc
\RequirePackage{fancyhdr}  % managing the header

\RequirePackage[latin1]{inputenc}  % Acentos em portugues
\RequirePackage[T1]{fontenc}
\RequirePackage[brazil]{babel}

\RequirePackage{amsmath}   % AMS math environments for LaTeX
\RequirePackage{amssymb}
\RequirePackage{amsbsy}


\RequirePackage[usenames,dvipsnames]{pstricks}
\RequirePackage[format=hang,labelfont=bf,labelsep=endash,small]{caption}
\RequirePackage{epsfig}

% Citation
\RequirePackage[numbers, comma, round, sort&compress]{natbib}

% Additional stuff
\RequirePackage{ifsc}

% Less important packages
\IfFileExists{dsfont.sty}{\RequirePackage{dsfont}}{} % double stroke fonts (as IR, IN, etc)


  

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




%%%%%%%%%%%%%      DEFINITIONS       %%%%%%%%%%%%

% References level
\numberwithin{equation}{section}
\numberwithin{figure}{chapter}
\numberwithin{table}{chapter}

% Footnotes --- depracated?
\addtolength{\footskip}{0.5cm}
\setlength{\footnotemargin}{0.3cm}
\setlength{\footnotesep}{0.4cm}



%%%%%%%%%%%%%      OPTION DECLARATION      %%%%%%%%%%%%

% Estilo do titulo
\newcommand{\estilotitulo}{0}
\DeclareOption{tituloesquerda}{ \renewcommand{\estilotitulo}{0} }
\DeclareOption{titulodireita}{  \renewcommand{\estilotitulo}{1} }
\DeclareOption{tituloclassico}{ \renewcommand{\estilotitulo}{2} }

%%%%%%%%%%%%% LOADING A BASE CLASS    %%%%%%%%%%%%

\LoadClass{report}

% Fixing geometry
\geometry{
  paper=a4paper, twoside,
  top=3cm, left=3cm, right=2cm, bottom=2cm}

% Setting Sans as default font face
\renewcommand{\familydefault}{\sfdefault}



%%%%%%%%%%%%%       HEADER           %%%%%%%%%%%%
