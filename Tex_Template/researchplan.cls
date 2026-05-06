\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{researchplan}[2026/05/06 Research Training Plan Class]

% ============================================================
% Base class
% ============================================================
\LoadClass[11pt]{article}

% ============================================================
% Packages
% ============================================================
\RequirePackage[a4paper,margin=1.8cm]{geometry}
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{longtable}
\RequirePackage{enumitem}
\RequirePackage{ragged2e}
\RequirePackage{makecell}
\RequirePackage[normalem]{ulem}

% ============================================================
% Global layout settings
% ============================================================
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}
\renewcommand{\arraystretch}{1.25}
\setlength{\extrarowheight}{2pt}
\raggedbottom

% Make longtable align with full text width
\setlength{\LTleft}{0pt}
\setlength{\LTright}{0pt}

% ============================================================
% Column types
% ============================================================
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}
\newcolumntype{Y}{>{\justifying\arraybackslash}X}

% ============================================================
% Internal variables
% ============================================================
\makeatletter

\newcommand{\RP@documenttitle}{RESEARCH TRAINING PLAN}
\newcommand{\RP@name}{}
\newcommand{\RP@homeuniversity}{}
\newcommand{\RP@researchtitle}{}
\newcommand{\RP@advisor}{}
\newcommand{\RP@hostdepartment}{}

\newlength{\RP@leftcol}
\setlength{\RP@leftcol}{3.6cm}

% ============================================================
% User-facing information commands
% ============================================================
\newcommand{\PlanDocumentTitle}[1]{\renewcommand{\RP@documenttitle}{#1}}
\newcommand{\ApplicantName}[1]{\renewcommand{\RP@name}{#1}}
\newcommand{\HomeUniversity}[1]{\renewcommand{\RP@homeuniversity}{#1}}
\newcommand{\ResearchTitle}[1]{\renewcommand{\RP@researchtitle}{#1}}
\newcommand{\ResearchAdvisor}[1]{\renewcommand{\RP@advisor}{#1}}
\newcommand{\HostDepartment}[1]{\renewcommand{\RP@hostdepartment}{#1}}

% Optional: allow user to change the left column width
\newcommand{\SetLeftColumnWidth}[1]{\setlength{\RP@leftcol}{#1}}

% ============================================================
% Auto-wrapping underline for basic information fields
% This fixes long Research Title overflow.
% ============================================================
\newcommand{\RP@AutoUnderline}[1]{%
\begingroup
\bfseries\raggedright
\protected@edef\RP@expandedfield{#1}%
\expandafter\uline\expandafter{\RP@expandedfield}%
\endgroup
}

% ============================================================
% Header printing
% ============================================================
\newcommand{\RP@PrintTitle}{%
\begin{center}
    {\LARGE \textbf{\RP@documenttitle}}
\end{center}
\vspace{1.2em}
}

\newcommand{\RP@BasicInfo}[2]{%
\noindent
\begin{tabularx}{\textwidth}{@{}L{3.6cm}L{0.35cm}>{\raggedright\arraybackslash}X@{}}
\textbf{#1} & : & \RP@AutoUnderline{#2}
\end{tabularx}
\vspace{0.45em}
}

\newcommand{\MakeResearchPlanHeader}{%
\RP@PrintTitle
\RP@BasicInfo{Name}{\RP@name}
\RP@BasicInfo{Home University}{\RP@homeuniversity}
\RP@BasicInfo{Research Title}{\RP@researchtitle}
\RP@BasicInfo{Research Advisor (at NUS)}{\RP@advisor}
\RP@BasicInfo{Host Department/Faculty/School}{\RP@hostdepartment}
\vspace{1.5em}
}

% Automatically print the header after \begin{document}
\AtBeginDocument{\MakeResearchPlanHeader}

% ============================================================
% Main table environment
% ============================================================
\newenvironment{ResearchPlanTable}{%
\small
\begin{longtable}{|L{\RP@leftcol}|p{\dimexpr\textwidth-\RP@leftcol-4\tabcolsep-3\arrayrulewidth\relax}|}
}{%
\hline
\end{longtable}
}

% ============================================================
% User-facing table commands
% ============================================================

% Start a new major section.
% Usage:
% \PlanSection{Section title}{First paragraph}
\newcommand{\PlanSection}[2]{%
\hline
\textbf{#1} & #2 \\
}

% Add another paragraph under the same section.
% Usage:
% \PlanText{Paragraph text}
\newcommand{\PlanText}[1]{%
& #1 \\
}

% Add a numbered item under the same section.
% Usage:
% \PlanItem{1}{Item text}
\newcommand{\PlanItem}[2]{%
& \hangindent=1.8em\hangafter=1\makebox[1.6em][l]{#1.}#2 \\
}

% Add a timetable entry.
% Usage:
% \PlanStep{Week 1--2}{Text}
\newcommand{\PlanStep}[2]{%
& \textbf{#1:} #2 \\
}

% Add a small vertical gap inside a table section if needed.
\newcommand{\PlanGap}{%
& \vspace{0.25em} \\
}

\makeatother
