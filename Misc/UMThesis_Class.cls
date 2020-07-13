\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Misc/UMThesis_Class}[v20200713 The University of Manitoba Thesis Class]
\LoadClassWithOptions{report}
% The class file is a superclass of `report`.

\RequirePackage{cite} % Handle the space after `\cite{}` automatically.
\RequirePackage[nodisplayskipstretch, doublespacing]{setspace} % Double-spaced for text but not for mathematical formulae.
\RequirePackage[pdftex, breaklinks = true, pagebackref = true]{hyperref} % Allow links to break over lines; activate back references inside bibliography.
\RequirePackage{fancyhdr} % Headers and footers.
\RequirePackage[toc]{appendix}
\RequirePackage{bookmark}
\RequirePackage{tocbibind} % Enable the table of contents, list of tables, list of figures and bibliography to show in the bookmark.
\RequirePackage{etoolbox} % Use conditional statements below.

% Defining internal commands starting with "@" is to prevent users accidently from changing the macro names from outside.
\newcommand{\documentID}[1]{\newcommand\@documentID{#1}}
\newcommand{\degreename}[1]{\newcommand\@degreename{#1}}
\newcommand{\department}[1]{\newcommand\@department{#1}}
\newcommand{\submissionsubject}[1]{\newcommand\@submissionsubject{#1}}
\newcommand{\university}[1]{\newcommand\@university{#1}}
\newcommand{\location}[1]{\newcommand\@location{#1}}
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

\ifdefempty{\@submissionsubject}
{
	\ClassError{UMThesis_Class}{\noexpand\submissionsubject cannot be blank}{Check \noexpand\submissionsubject in ./Front_Matter/Fields.tex}
	\stop
}
{}

\ifdefempty{\@university}
{
	\ClassError{UMThesis_Class}{\noexpand\university cannot be blank}{Check \noexpand\university in ./Front_Matter/Fields.tex}
	\stop
}
{}

\ifdefempty{\@location}
{
	\ClassError{UMThesis_Class}{\noexpand\location cannot be blank}{Check \noexpand\location in ./Front_Matter/Fields.tex}
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
	\begin{titlepage}
		\begin{center}
			{\LARGE \bfseries \@title}\\[2em]
			presented by\\[2em]
			\@author\\[2em]
			A \@document\ submitted to\\
			\@submissionsubject\ of\\
			\@university\\
			in partial fulfillment of the requirements\\
			for the degree of\\[2em]
			\@degreename\\[2em]
			\@department\\
			\@university\\
			\@location\\
			\@graduationmonth\ \@graduationyear\\[6em]
			\copyright\ Copyright \@graduationyear\ by \@author\\
		\end{center}
	\end{titlepage}
}

\renewenvironment{abstract}
{
	\phantomsection
	% In order to make the bookmark display correctly with `hyperref`, a phantom section has to be added.
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

\newenvironment{acknowledgements}
{
	\phantomsection
	\addcontentsline{toc}{chapter}{Acknowledgements}
	\begin{center}
		{\Large \bfseries Acknowledgements}
	\end{center}
}

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

\endinput % LaTeX will stop loading anything after this line.