%
% $Id: ffsb-brief.cls,v 1.7 2009/03/11 12:04:31 joern Exp joern $
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{own-haw-page}[2017/04/02]

\RequirePackage{ifthen}

% globale Makros
\def\ffsbb@name{Fakult\"at TI, Department Informatik}

% default-Werte für die gesamte Fakultät
\def\ffsbb@logotext{\ffsbb@name}
\def\ffsbb@lang{german}

% Optionen, die eventuell defaults überschreiben
\DeclareOption{english}{
  \def\ffsbb@lang{english}
  \def\ffsbb@name{Faculty of Technology and CS, Dep. of Computer Science}
  %\PassOptionsToClass{english}{unibi-page}
  \PassOptionsToClass{english}{haw-page-tt}
}

\DeclareOption{ti}{
  \def\ffsbb@logotext{\ffsbb@name \\ Intelligente Sensorik\\ Prof. Dr. Tim Tiedemann, Max De Muirier}
}

\DeclareOption{ceg}{
  \ifthenelse{\equal{\ffsbb@lang}{english}}%
  {\def\ffsbb@logotext{\ffsbb@name \\ Intelligent Sensing}}%
% ???:  {\def\ffsbb@logotext{\ffsbb@name \\ Theoretischer Schriftsatz}}
}

%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{unibi-page}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{haw-page-tt}}
\ProcessOptions
%\LoadClass{unibi-page}
\LoadClass{haw-page-tt}

\ubb@setlogotext{\ffsbb@logotext}

