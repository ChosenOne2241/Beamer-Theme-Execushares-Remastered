\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Template/UMThesis_Class}[v20200720 The University of Manitoba Thesis Class]
\LoadClassWithOptions{report}
% The class file is a superclass of `report`.

\RequirePackage{cite} % Handle the space after `\cite{}` automatically.
\RequirePackage{microtype} % Micro-adjust font spacing.
\RequirePackage[nodisplayskipstretch, doublespacing]{setspace} % Double-spaced for text but not for mathematical formulae.
\RequirePackage{fancyhdr} % Headers and footers.
\RequirePackage[Lenny]{fncychap} % Fancy heading styles. Available options are `Sonny`, `Lenny`, `Glenn`, `Conny`, `Rejne`, `Bjarne` and `Bjornstrup`.
\RequirePackage{tocbibind} % Enable the table of contents, list of tables, list of figures and bibliography to show in the bookmark.
\RequirePackage[format = plain, labelfont = bf]{caption} % Make caption labels boldface.
\RequirePackage{etoolbox} % To use conditional statements below.
\RequirePackage{mathtools} % `mathtools` is an add-on of `amsmath` and loads `amsmath` automatically.
\RequirePackage{amsthm, amssymb} % If the `amsthm` package is used with a non-AMS document class and with the `amsmath` package, `amsthm` must be loaded after `amsmath`, not before.
\RequirePackage[pdftex, breaklinks = true, pagebackref = true]{hyperref}
% Allow links to break over lines; activate back references inside bibliography.
% With few exceptions, `hyperref` should **always** load last.
% For more information, see [here](https://tex.stackexchange.com/questions/1863/which-packages-should-be-loaded-after-hyperref-instead-of-before/).
\RequirePackage[toc, page]{appendix} % Change grouping for bookmarks of Appendix section.
\RequirePackage{bookmark} % A new bookmark organization for `hyperref`.

% Define the theorem style using `amsthm`.
% Read more (here)[https://en.wikibooks.org/wiki/LaTeX/Theorems#Theorem_styles].
\theoremstyle{plain}
\newtheorem{theorem}{Theorem}
\newtheorem{proposition}{Proposition}
\newtheorem{lemma}{Lemma}
\newtheorem{corollary}{Corollary}

\theoremstyle{definition}
\newtheorem{definition}{Definition}
\newtheorem{example}{Example}
\newtheorem{problem}{Problem}

\theoremstyle{remark}
\newtheorem{remark}{Remark}
\newtheorem{claim}{Claim}

% Defining internal commands starting with `@` is to prevent users accidently from changing the macro names from outside.
\newcommand{\documentID}[1]{\newcommand\@documentID{#1}}
\newcommand{\degreename}[1]{\newcommand\@degreename{#1}}
\newcommand{\department}[1]{\newcommand\@department{#1}}
\newcommand{\graduationmonth}[1]{\newcommand\@graduationmonth{#1}}
\newcommand{\graduationyear}[1]{\newcommand\@graduationyear{#1}}
\newcommand{\advisor}[1]{\newcommand\@advisor{#1}}
\newcommand{\subject}[1]{\newcommand\@subject{#1}}
\newcommand{\keywords}[1]{\newcommand\@keywords{#1}}

\input{Front_Matter/Fields}

% Start exception handling.
\ifdefempty{\@documentID}
{
	\ClassError{UMThesis_Class}{\noexpand\documentID cannot be blank}{Check \noexpand\documentID in ./Front_Matter/Fields.tex}
	\stop
}
{}

\ifdefempty{\@degreename}
{
	\ClassError{UMThesis_Class}{\noexpand\degreename cannot be blank}{Check \noexpand\degreename in ./Front_Matter/Fields.tex}
	\stop
}
{}

\ifdefempty{\@department}
{
	\ClassError{UMThesis_Class}{\noexpand\department cannot be blank}{Check \noexpand\department in ./Front_Matter/Fields.tex}
	\stop
}
{}

\ifdefempty{\@graduationmonth}
{
	\ClassError{UMThesis_Class}{\noexpand\graduationmonth cannot be blank}{Check \noexpand\graduationmonth in ./Front_Matter/Fields.tex}
	\stop
}
{}

\ifdefempty{\@graduationyear}
{
	\ClassError{UMThesis_Class}{\noexpand\graduationyear cannot be blank}{Check \noexpand\graduationyear in ./Front_Matter/Fields.tex}
	\stop
}
{}

\ifdefempty{\@advisor}
{
	\ClassError{UMThesis_Class}{\noexpand\advisor cannot be blank}{Check \noexpand\advisor in ./Front_Matter/Fields.tex}
	\stop
}
{}

\ifnumequal{\@documentID}{0}
{\newcommand{\@document}{thesis}} % Define `\@document` based on the value of `\@documentID`.
{
	\ifnumequal{\@documentID}{1}
	{\newcommand{\@document}{dissertation}}
	{
		\ClassError{UMThesis_Class}{\noexpand\documentID is supposed to be either `0` (thesis) or `1` (dissertation)}{Check \noexpand\documentID in ./Front_Matter/Fields.tex}
		\stop
	}
}
% End exception handling.

\hypersetup
{
	bookmarksnumbered = true, % Add index numbers for chapters/sections.
	colorlinks = true, % `false`: boxed links; `true`: colored links.
	pdfnewwindow = true, % Links are opened in a new window.
	pdfauthor = \@author,
	pdfcreator = \@author,
	pdftitle = \@title,
	pdfsubject = \@subject,
	pdfkeywords = \@keywords,
	pdfborder = 0 0 0 % Make all links invisible, so the document looks good when printed.
}

\newcommand{\generatetitlepage}
{
	\phantomsection
	% To display the bookmark correctly with `hyperref`, a phantom section has to be added.
	\addcontentsline{toc}{chapter}{Title Page}
	\begin{titlepage}
		\begin{center}
			{\LARGE \bfseries \@title}\\[2em]
			presented by\\[2em]
			\@author\\[2em]
			A \@document\ submitted to\\
			The Faculty of Graduate Studies of\\
			The University of Manitoba\\
			in partial fulfillment of the requirements\\
			for the degree of\\[2em]
			\@degreename\\[2em]
			\@department\\
			The University of Manitoba\\
			Winnipeg, Manitoba, Canada\\
			\@graduationmonth\ \@graduationyear\\[6em]
			\copyright\ Copyright \@graduationyear\ by \@author\\
		\end{center}
	\end{titlepage}
}

\renewenvironment{abstract}
{
	\phantomsection
	\addcontentsline{toc}{chapter}{Abstract}
	\noindent
	\begin{minipage}[t]{0.45\textwidth}
		\begin{flushleft}
			{\expandafter \MakeUppercase \@document} Advisor\\
			{\bfseries \@advisor}
		\end{flushleft}
	\end{minipage}
	\hspace{\fill}
	\begin{minipage}[t]{0.45\textwidth}
		\begin{flushright}
			Author\\
			{\bfseries \@author}
		\end{flushright}
	\end{minipage}
	\vspace{2em}
	\begin{center}
		{\large \bfseries \@title}
	\end{center}
	\vspace{2em}
	\begin{center}
		{\Large \bfseries \abstractname}
	\end{center}
}
{}

\newenvironment{acknowledgements}
{
	\phantomsection
	\addcontentsline{toc}{chapter}{Acknowledgements}
	\begin{center}
		{\Large \bfseries Acknowledgements}
	\end{center}
}
{}

\newenvironment{dedication}
{
	\phantomsection
	\addcontentsline{toc}{chapter}{Dedication}
	\begin{quote}
		\begin{flushright}
			\em
}
{
		\end{flushright}
	\end{quote}
}

\newcommand{\frontmatterpagestyle}
{
	\pagenumbering{roman} % Pages for the front matter are roman.
}

\newcommand{\mainmatterpagestyle}
{
	\pagestyle{fancy}
	\setlength{\headheight}{15pt} % Set `\headheight` to `15pt` to get rid of the headheight-related warning message caused by `fancyhdr` package, when the default font size is `12pt`.
	\cfoot{}
	\renewcommand{\chaptermark}[1]{\markboth{##1}{##1}} % [Warning] Nested commands.
	\fancyhead[LE, RO]{\thepage}
	\fancyhead[LO, RE]{\textit{\chaptername\ \thechapter: \leftmark}}
	% 4 lines above create the fancy style header for two-side documents.
	\pagenumbering{arabic} % Pages for the main/back matter are arabic.
}

\newcommand{\backmatterpagestyle}
{
	\pagestyle{plain}
	\bibliographystyle{abbrv}
}

\endinput % LaTeX will stop loading anything after this line.