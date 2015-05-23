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
\RequirePackage{amsmath}   % AMS math environments for LaTeX
\RequirePackage{amssymb}
\RequirePackage{amsbsy}

% Less important packages
\IfFileExists{dsfont.sty}{\RequirePackage{dsfont}}{} % double stroke fonts (as IR, IN, etc)


  

%%%%%%%%%%%%%      NAME DEFINITIONS       %%%%%%%%%%%%

\providecommand{\ABNTtoctitulo}{Sum\'ario}
\providecommand{\ABNTtottitulo}{Lista de Tabelas}
\providecommand{\ABNTtoftitulo}{Lista de Figuras}
\providecommand{\ABNTagradecimentostitulo}{Agradecimentos}




%%%%%%%%%%%%%      OPTION DECLARATION      %%%%%%%%%%%%


% Estilo do titulo
\newcommand{\estilotitulo}{0}
\DeclareOption{tituloesquerda}{ \renewcommand{\estilotitulo}{0} }
\DeclareOption{titulodireita}{  \renewcommand{\estilotitulo}{1} }
\DeclareOption{tituloclassico}{ \renewcommand{\estilotitulo}{2} }

%% Page numbering squeme
\providecommand{\ABNTpnum}{}
\DeclareOption{pnumabnt}{\renewcommand{\ABNTpnum}{ABNT}}
\DeclareOption{pnumplain}{\renewcommand{\ABNTpnum}{plain}}
\DeclareOption{pnumromarab}{\renewcommand{\ABNTpnum}{RomSumArab}}
\ExecuteOptions{pnumabnt}

%% Automatically include in TOC bibliography, index and stared chapters
\newboolean{ABNTincludeintoc}
\DeclareOption{sumariocompleto}   {\setboolean{ABNTincludeintoc}{true}}
\DeclareOption{sumarioincompleto} {\setboolean{ABNTincludeintoc}{false}}
\ExecuteOptions{sumariocompleto}

%% Style of page numbers in TOC
\newboolean{ABNTpagenumstyle}
\DeclareOption{abnttoc}   {\setboolean{ABNTpagenumstyle}{true}}
\DeclareOption{normaltoc} {\setboolean{ABNTpagenumstyle}{false}}
\ExecuteOptions{abnttoc}


%% Figures and tables independent of sections?
\newboolean{ABNTfigtabnumbers}
\DeclareOption{abntfigtabnum}{\setboolean{ABNTfigtabnumbers}{true}}
\DeclareOption{normalfigtabnum}{\setboolean{ABNTfigtabnumbers}{false}}
\ExecuteOptions{abntfigtabnum}

%% Option: page headers
\newboolean{ABNTheader}
\providecommand{\ABNTheadertype}{\relax}
\DeclareOption{noheader}{\setboolean{ABNTheader}{false}}
\DeclareOption{header}
{
  \setboolean{ABNTheader}{true}
  \renewcommand{\ABNTheadertype}{normal}
}
\DeclareOption{plainheader}
{
  \setboolean{ABNTheader}{true}
  \renewcommand{\ABNTheadertype}{plain}
}
\DeclareOption{ruledheader}
{
  \setboolean{ABNTheader}{true}
  \renewcommand{\ABNTheadertype}{ruled}
}
\ExecuteOptions{plainheader}

%% Option `capchap', `capsec': 
%%   titles of chapters or sections in capital letters 
\newboolean{ABNTcapchap}
\setboolean{ABNTcapchap}{false}
\newboolean{ABNTcapsec}
\setboolean{ABNTcapsec}{false}

\DeclareOption{capchap}{\setboolean{ABNTcapchap}{true}
                        \setboolean{ABNTCapAnnexAppendix}{true}}
\DeclareOption{capsec}{\setboolean{ABNTcapsec}{true}}

%% Option `anapmaiusc' and `anapnormal'
%%   should \annexname and \appendixname be on capital letters?

\newboolean{ABNTCapAnnexAppendix}
\setboolean{ABNTCapAnnexAppendix}{true}  % manual execution of option for
                                         % cooperation between `capchap'
                                         % and `anexapendnormal'

\DeclareOption{anapmaiusc}{\setboolean{ABNTCapAnnexAppendix}{true}}
\DeclareOption{anapnormal}{\setboolean{ABNTCapAnnexAppendix}{false}}

%% Option `anapindentindic' in order to \anexo or \apendice make ABNT
%% strict indentation on its titles.

\newboolean{ABNTAnApIndicativoIndent}

\DeclareOption{anapindicindent}{\setboolean{ABNTAnApIndicativoIndent}{true}}
\DeclareOption{anapcustomindent}{\setboolean{ABNTAnApIndicativoIndent}{false}}

\ExecuteOptions{anapindicindent}

%% Option `anapindentindic' in order to \anexo or \apendice make ABNT
%% strict indentation on its titles.

\newboolean{ABNTAnApName}
\DeclareOption{anapname}{\setboolean{ABNTAnApName}{true}}
\DeclareOption{anapnoname}{\setboolean{ABNTAnApName}{false}}

\ExecuteOptions{anapname}

%% Line Spacing options: change current setting.
\newcommand*{\ABNTespacodefault}{} %
\DeclareOption{espacoumemeio}{\renewcommand*{\ABNTespacodefault}{\taxaespacoumemeio} }
\DeclareOption{espacosimples}{\renewcommand*{\ABNTespacodefault}{\taxaespacosimples} }
\DeclareOption{espacoduplo}{\renewcommand*{\ABNTespacodefault}{\taxaespacoduplo}}
\ExecuteOptions{espacoumemeio}

%% Margin care --> Removed since version 1 beta

%% Options `spacednotes': removed since version 0.3
%  Assuming notes single spaced always (no alternative if using setspace ;-D

%% Option: loading common packages NO LONGER SUPPORTED!!!
\newboolean{ABNTcommonpack}
\DeclareOption{paccomuns}{\setboolean{ABNTcommonpack}{true}}
\DeclareOption{sempaccomuns}{\setboolean{ABNTcommonpack}{false}}
\ExecuteOptions{sempaccomuns}

%% Auto bold math: bold math version ir text font is in bold face
\newboolean{ABNTautobm}
\DeclareOption{autobm}{\setboolean{ABNTautobm}{true}}
\DeclareOption{noautobm}{\setboolean{ABNTautobm}{false}}
\ExecuteOptions{autobm}

%% font option: times as default or not
\newboolean{ABNTtimesfont}
\DeclareOption{times}{\setboolean{ABNTtimesfont}{true}}
\DeclareOption{notimes}{\setboolean{ABNTtimesfont}{false}}
\ExecuteOptions{notimes}

%% Option to indent the first paragraph of each section or chapter
\newboolean{ABNTindentfirst}
\DeclareOption{indentfirst}{\setboolean{ABNTindentfirst}{true}}
\DeclareOption{noindentfirst}{\setboolean{ABNTindentfirst}{false}}
\ExecuteOptions{indentfirst}



%%%%%%%%%%%%% LOADING A BASE CLASS    %%%%%%%%%%%%

\LoadClass{report}

% Fixing geometry
\geometry{
  paper=a4paper, twoside,
  top=3cm, left=2cm, right=2cm, bottom=2cm}




%%%%%%%%%%%%%       HEADER           %%%%%%%%%%%%
