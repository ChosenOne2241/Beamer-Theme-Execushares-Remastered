% Author: Yongzhen Ren
% Version: v20200709
% Description: It is a LaTeX thesis template complying with Harvard GSAS requirements.
% See [the link](https://guides.library.harvard.edu/overleaf/phd) for more information.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Misc/Template}[v20200709 The University of Manitoba Thesis Class]
\LoadClassWithOptions{report}
% The class file is a superclass of `report`.

\RequirePackage{cite} % Handle the space after `\cite{}` automatically.
\RequirePackage[nodisplayskipstretch, doublespacing]{setspace} % Double-spaced for text but not for mathematical formulae.
\RequirePackage[pdftex, breaklinks = true]{hyperref} % Allow links to break over lines.
\RequirePackage{fancyhdr} % Headers and footers.
\RequirePackage[toc]{appendix}
\RequirePackage{bookmark}
\RequirePackage{tocbibind} % Enable the table of contents, list of tables, list of figures and bibliography to show in the bookmark.

% Defining internal commands starting with "@" is to prevent users accidently from changing the macro names from outside.
\newcommand{\documenttype}[1]{\newcommand\@documenttype{#1}}
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
	pdfborder = 0 0 0, % Make all links invisible, so the document looks good when printed.
}

\newcommand{\generatetitlepage}
{
	\begin{titlepage}
		\begin{center}
			{\LARGE \bfseries \@title}\\[2em]
			presented by\\[2em]
			\@author\\[2em]
			A \@documenttype\ submitted to\\
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
			Thesis Advisor\\
			{\bfseries \@advisor}
		\end{flushleft}
	\end{minipage}
	\hfill
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