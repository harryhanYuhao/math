\NeedsTeXFormat{LaTeX2e}[2020/08/18]
\ProvidesClass{UoESoMworkshop}[2020/12/22 UoE SoM Workshops Class]

\LoadClass[
    12pt,
    a4paper
]{article}

\RequirePackage[UKenglish]{babel}
\RequirePackage{amsmath,amssymb,amsthm}
\RequirePackage{graphicx,xcolor}
\RequirePackage{hyperref}
\RequirePackage{etoolbox,pifont,adjustbox,framed,capt-of}
\RequirePackage{csquotes,biblatex}

\newenvironment{exformat}[4]{\color{#3}\begin{list}{{#2}}{} \item%
{\bf #1~\arabic{wop}.\theexercise}\ifblank{#4}{}{ (#4)}\enspace}%
{\end{list}}

\newenvironment{exercise}[1][]{\refstepcounter{exercise}\begin{exformat}{Exercise}{\ding{46}}{exerc}{#1}}%
{\end{exformat}}

\newenvironment{solution}{\begin{exformat}{Suggested answer}{\ding{52}}{exerc}{}}%
{\end{exformat}}

\definecolor{exerc}{HTML}{00397E}

\newtheorem{prop}{Proposition}

\newcounter{wop}
\newcounter{exercise}
\setcounter{wop}{1}
