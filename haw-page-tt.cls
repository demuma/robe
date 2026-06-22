%
% $Id: unibi-brief.cls,v 1.11 2009/03/11 12:05:04 joern Exp joern $
%

%
% Bitte keine Änderungen an dieser Datei vornehmen. Für alle vom
% Benutzer änderbaren Werte gibt es Befehle. Lokale Anpassungen erfolgen
% durch eine abgeleitete Dokument-Klasse, die diese Basis-Klasse
% einbindet. Die vollständige Distribution dieser Klasse enthält ein
% Beispiel für dieses Vorgehen. Siehe
%
%    http://www.uni-bielefeld.de/corporatedesign/
%
% für weitere Informationen.
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{haw-page-tt}[2017/04/02]

% unibi-brief angepasst zu page, TK 6.10.2009

\LoadClass{scrartcl}

\RequirePackage{ifthen}
\RequirePackage{graphicx}
\RequirePackage[absolute]{textpos}
\setlength{\TPHorizModule}{1mm}
\setlength{\TPVertModule}{1mm}
\setlength{\unitlength}{1mm}
\RequirePackage[T1]{fontenc}

% Schriften
\newcommand{\ubb@fontfamily}{phv}
\renewcommand{\sfdefault}\ubb@fontfamily{}
\renewcommand{\familydefault}{\sfdefault}

% der Briefstil verwendet einen relativ großen Durchschuß
\newcommand{\ubb@ten}{\fontfamily{\ubb@fontfamily}\fontsize{10}{15}\selectfont}
% Rückadresse
\newcommand{\ubb@seven}{\fontfamily{\ubb@fontfamily}\fontsize{7}{8}\selectfont}
% Absender
\newcommand{\ubb@nine}{\fontfamily{\ubb@fontfamily}\fontsize{9}{10.8}\selectfont}
% Freitext im Logo
\newcommand{\ubb@eleven}{\fontfamily{\ubb@fontfamily}%
  \bfseries\fontsize{11}{13.2}\selectfont}

% das Seitenlayout des Briefs
\RequirePackage[lmargin=30mm,textwidth=145mm,%
                tmargin=25mm,bmargin=30mm]{geometry}
\setlength{\parindent}{0mm}

% Globale Vorgaben. Diese werden eventuell weiter unten überschrieben.
\def\ubb@phonetext{Telefon}
\def\ubb@sphonetext{Sekretariat}
\def\ubb@telefaxtext{Telefax}
\def\ubb@defphoneprefix{0521 106-}
\def\ubb@rueckadresse{Universit\"at Bielefeld $|$ Postfach 10\,01\,31 $|$ 33501 Bielefeld}
\def\ubb@postscriptum{PS}
\def\ubb@anlagen{Anlage(n)}
\def\ubb@verteiler{Verteiler}

% der frei definierbare Text neben dem Logo
\newcommand{\ubb@setlogotext}[1]{\def\ubb@logotext{#1}}
\ubb@setlogotext{\empty}
\newcommand{\ubb@setmaildomain}[1]{\def\ubb@maildomain{#1}}
\ubb@setmaildomain{@uni-bielefeld.de}

% Von den eigentlichen Brief-Befehlen nur fuer article hilfreich:
\renewcommand{\date}[1]{\def\ubb@date{#1}}

% Optionen, im Augenblick nur Wahl der Sprache
\def\ubb@logocolor{gruen}
\def\ubb@footercolor{gruen}
\DeclareOption{grey}{
  \def\ubb@logocolor{grau}
  \def\ubb@footercolor{schwarz}
}

\def\ubb@fusszeile{unibi-brief-fusszeile-\ubb@footercolor}

\def\ubb@lang{german}
\DeclareOption{english}{
  \def\ubb@lang{english}
  \def\ubb@fusszeile{unibi-brief-footer-\ubb@footercolor}
}
\def\ubb@fusszeilenblock{%
  \begin{textblock}{50}(30,270)% Fußzeile
    \begin{picture}(36.6,16.3)
      \put(0,0){\includegraphics{\ubb@fusszeile}}
    \end{picture}
  \end{textblock}
}
\DeclareOption{nofooter}{
  \def\ubb@fusszeilenblock{}
}

\ProcessOptions
\RequirePackage[\ubb@lang]{babel}
\date{\today}

% Die letter-Umgebung beginnt einen neuen Brief. Alle festen Elemente
% werden durch diese Umgebung gesetzt (nicht durch \opening, wie in den
% bisherigen Brief-Klassen).
\newenvironment{page}{%
  \clearpage%
  \setcounter{page}{1}%
  \thispagestyle{empty}%
  \begin{textblock}{40}(30,12)% Logo
    \begin{picture}(40,18.67)%
    %\put(-8,0){\includegraphics{unibi-brief-logo-\ubb@logocolor}}
    %\put(42.33,2.67){\parbox[b]{114mm}{\ubb@eleven\ubb@logotext}}
    \put(-8,0){\includegraphics[width=50mm]{HAW_Marke_RGB-72dpi}}
    \put(42.33,2.67){\parbox[b]{114mm}{\ubb@eleven\ubb@logotext}}
  \end{picture}
  \end{textblock}
%Urspruenglich immer mit Fusszeile:
%  \begin{textblock}{50}(30,270)% Fußzeile
%    \begin{picture}(36.6,16.3)
%      \put(0,0){\includegraphics{\ubb@fusszeile}}
%    \end{picture}
%  \end{textblock}
%Jetzt optional:
\ubb@fusszeilenblock
%  \begin{textblock}{5}(10,105)% Falzmarke
%    \rule{5mm}{.5pt}
%  \end{textblock}
%  \begin{textblock}{100}(30,48.5)% Rücksendeadresse
%    \ubb@seven\ubb@rueckadresse
%  \end{textblock}
%  \begin{textblock}{100}(30,55)% Anschrift
%    \parbox[t]{100mm}{\ubb@ten#1}
%  \end{textblock}
%  \begin{textblock}{60}(140,48.5)% Absender
%    \parbox[t]{60mm}{\ubb@nine\textbf{\ubb@from}%
%      \vspace{\baselineskip}%
%      \ifthenelse{\equal{\ubb@phone}{\empty}}{}{%
%        \newline\makebox[20mm][l]{\ubb@phonetext:} \ubb@phone}
%      \ifthenelse{\equal{\ubb@sphone}{\empty}}{}{%
%        \newline\makebox[20mm][l]{\ubb@sphonetext:} \ubb@sphone}
%      \ifthenelse{\equal{\ubb@telefax}{\empty}}{}{%
%        \newline\makebox[20mm][l]{\ubb@telefaxtext:} \ubb@telefax}
%      \ifthenelse{\equal{\ubb@email}{\empty}}{}{%
%        \newline\ubb@email}
%      \ifthenelse{\equal{\ubb@homepage}{\empty}}{}{%
%        \newline\ubb@homepage}
%      \vspace{\baselineskip}%
%      \newline%
%      {\ubb@ten\ubb@place, \ubb@date}
%    }
%  \end{textblock}
  \vspace*{10mm}%
}{}

