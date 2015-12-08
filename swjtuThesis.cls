
%% start of file 'SWJTU_Thesis.cls'.
%% Copyright 2015 
%% Original Author  Limin HUANG (E-mail: limin.huang@hotmail.com).
%% 2015/01/30		v0.0, Begin of the projet, 		@Chengdu China
%% 2015/12/08		v1.0, Release of the projet, 	@Grenoble, France

% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License version 1.3c,
% available at http://www.latex-project.org/lppl/.

%-------------------------------------------------------------------------------
%                标识
%-------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{swjtuThesis}[2015/12/07 v1.0 Southwest Jiaotong University Thesis document class]


%-------------------------------------------------------------------------------
%                宏包
%-------------------------------------------------------------------------------
% SWJTU_Thesis类基于ctexbook文档类制作


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
\LoadClass[UTF8,fntef,fancyhdr,a4paper,cs4size]{ctexbook}% 论文使用A4大小纸张，默认小四号字体

% 装载样式文件中使用的宏包
\RequirePackage[bookmarksnumbered,pdfstartview=XYZ]{hyperref}
\RequirePackage{graphicx}
\RequirePackage{setspace}
\RequirePackage{ifthen}
\RequirePackage{geometry}


%-------------------------------------------------------------------------------
%                标题及版面格式（依照《西南交通大学研究生学位论文撰写规范》 附录）
%-------------------------------------------------------------------------------
% 版面上空25.4 mm，下空25.4 mm，左空 26.0 mm，右空 26.0 mm
\geometry{top = 25.4mm, bottom = 25.4mm, left = 26.0mm, right = 26.0mm}

% 设置行距
\linespread{1.5}

% 各章题序及标题：小2号黑体，题序和标题之间空一格，不加标点
\CTEXsetup[format = {\centering\zihao{-2}\heiti}, nameformat = {}, number = {~\arabic{chapter}~}, titleformat = {}, aftername = {\quad}]{chapter}

\CTEXsetup[beforeskip = {-20pt}, afterskip = {20pt plus 2pt minus 2pt}]{chapter}

% 各节的一级题序及标题：小3号黑体，题序和标题之间空一格，不加标点
\CTEXsetup[format = {\raggedright\zihao{-3}\heiti}, aftername = {\quad}]{section}

% 各节的二级题序及标题：4号黑体，题序和标题之间空一格，不加标点
\CTEXsetup[format = {\raggedright\zihao{4}\heiti}, aftername = {\quad}]{subsection}

% 各节的三级（及以下）题序、款、项：小4号黑体，缩进两字符与正文相同，题序需要自己加入
\CTEXsetup[format = {\raggedright\zihao{-4}\heiti}, indent = {2em}]{subsubsection}


% 目录格式：字体和缩进定义
\def\@dotsep{0.7}
\renewcommand*\l@chapter{\heiti\@dottedtocline{0}{0em}{3em}}
\renewcommand*\l@section{\songti\@dottedtocline{1}{1.75em}{2.05em}}
\renewcommand*\l@subsection{\songti\@dottedtocline{2}{2.5em}{2.5em}}

% 修改图和表的题注格式为 章-图表号
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\thechapter-\arabic{table}}

% 修改公式的编号格式为 章-公式号
\renewcommand{\theequation}{\thechapter--\arabic{equation}}  
%-------------------------------------------------------------------------------
%                论文信息（题目、作者、导师、专业、图书信息等）
%-------------------------------------------------------------------------------

% 申请学位级别
\newcommand{\cDiscipline}[1]{\def\@cDiscipline{#1}}
\newcommand{\eDiscipline}[1]{\def\@eDiscipline{#1}}

% 论文中英题目
\newcommand{\cTitle}[1]{\def\@cTitle{#1}}
\newcommand{\eTitle}[1]{\def\@eTitle{#1}}

% 论文作者信息
\newcommand{\grade}[1]{\def\@grade{#1}}
\newcommand{\eAuthor}[1]{\def\@eAuthor{#1}}
\newcommand{\cMajor}[1]{\def\@cMajor{#1}}
\newcommand{\eMajor}[1]{\def\@eMajor{#1}}

% 论文导师信息
\newcommand{\cTutor}[1]{\def\@cTutor{#1}}
\newcommand{\eTutor}[1]{\def\@eTutor{#1}}

% 论文分类及时间
\newcommand{\CI}[1]{\def\@CI{#1}}
\newcommand{\UDC}[1]{\def\@UDC{#1}}
\newcommand{\secLevel}[1]{\def\@secLevel{#1}}
\newcommand{\cDate}[3]{\def\@cDate{\dateprint{#1}{#2}{#3}}}
\newcommand{\eDate}[3]{\def\@eDate{\dateprintE{#1}{#2}{#3}}}

%-------------------------------------------------------------------------------
%                页眉及页脚
%-------------------------------------------------------------------------------
% 文武线设计
\renewcommand{\headrule}{
	\hrule width \hsize height 2pt \vspace{0.6pt} \hrule width \hsize height 0.4pt
}

\renewcommand{\footrule}{
	\hrule width \hsize height 0.4pt \vspace{0.6pt} \hrule width \hsize height 2pt
	}

% 自定义页眉
\newcommand{\thesispagestyle}[3]{
	\pagestyle{fancy}
	\fancyhf{}
	\fancyhead[C]{\zihao{-4}\heiti #2}
	\fancyhead[OR,EL]{\zihao{-4}\heiti #3}
	\fancyfoot[C]{}
	\fancypagestyle{plain}{\pagestyle{fancy}}
}


%-------------------------------------------------------------------------------
%                封面设计
%-------------------------------------------------------------------------------			
\newcommand{\clearpagebyprint}{\if@twoside\cleardoublepage\else\clearpage\fi}
\newcommand{\fillinblank}[2]{\CJKunderline{\makebox[#1]{#2}}}
\newcommand{\makecover}{
	\pagestyle{empty}
	\begin{titlepage}
		
		% 中文封面
		\linespread{1}
		\begin{flushleft}
		{
			\zihao{-4}
			{\songti\cover@CI}\@CI\hspace{20em}{\songti\cover@secLevel}\@secLevel
			\\
			{\songti\cover@UDC}\@UDC
			\\
			}	
		\end{flushleft}
		\linespread{1.5}
		\vspace{10mm}
		\begin{center}
			{
				\zihao{2}
				{\textbf{\songti\cover@cSchool}}\\
				\vspace{1mm}
				{\textbf{\songti\cover@cThesis}}
			}
			
			\vfill
			{
				\zihao{2}
				\linespread{1.3}\selectfont
				\makebox[0pt]{
					\begin{minipage}{18em}
						\centering\heiti\@cTitle
					\end{minipage}
				}
			}
			
			\vfill
			{
				\zihao{3}
                \linespread{1.75}\selectfont
				\begin{tabular}{l@{\extracolsep{0.2em}}c}
					{\songti\cover@grade}    	& \fillinblank{10em}{\@grade}
						\\
					{\songti\cover@author}   	& \fillinblank{10em}{\@author}
						\\
					{\songti\cover@cDiscipline}	& \fillinblank{10em}{\@cDiscipline\cDegree}
						\\
					{\songti\cover@cMajor}    	& \fillinblank{10em}{\@cMajor}
						\\
					{\songti\cover@cTutor}   	& \fillinblank{10em}{\@cTutor}
				\end{tabular}
			}
			\vfill
			{
				\zihao{3}
				{\songti\@cDate}
			}
		\end{center}
		
		% 英文封面
		\newpage
		\linespread{1}
		\begin{flushleft}
			\zihao{-4}
			{\songti\cover@eCI}\@CI
			\\
			{\songti\cover@eUDC}\@UDC
			\\	
		\end{flushleft}
		\linespread{1.5}
		\vspace{10mm}
		\begin{center}
			{
				\zihao{-2}
				{\songti\cover@eSchool}\\
				\vspace{3mm}
				{
					\ifdegreedoctor
					{\songti\cover@eThesisD}
					\else
					{\songti\cover@eThesisM}
					\fi
				}
			}
			\vfill
			{
				\zihao{2}
				\linespread{1.3}\selectfont
				\makebox[0pt][c]{
					\begin{minipage}[c]{23em}
						\centering\@eTitle
					\end{minipage}
				}
			}
			\vfill
			{
				\zihao{3}
				\linespread{1.75}\selectfont
				\begin{tabular}{r@{\extracolsep{0.2em}}l}
					{\songti\cover@eGrade}    	& {\@grade}
					\\
					{\songti\cover@eAuthor}   	& {\@eAuthor}
					\\
					{\songti\cover@eDiscipline}	& {\eDegree\@eDiscipline}
					\\
					{\songti\cover@eMajor}    	& {\@eMajor}
					\\
					{\songti\cover@eTutor}   	& {\@eTutor}
				\end{tabular}
			}
			\vfill
			{
				\zihao{3}
				{\@eDate}
			}
			\end{center}
			
			% 加载学位论文版权使用授权书
			\include{preface/copyright}
			
			% 加载学位论文主要工作（贡献）声明
			\ifdegreedoctor
				\include{preface/statementDoctor}
			\else
				\include{preface/statementMaster}
			\fi
			
			
	\end{titlepage}
}


%-------------------------------------------------------------------------------
%                中、英文摘要格式定义
%-------------------------------------------------------------------------------
\newcommand{\baseabstract}[4]{
    \chapter*{#1}
    %\addcontentsline{toc}{chapter}{#1}
    #3
    \vfill
    \leftline{\zihao{-4}{#2}#4}
}

% 中文摘要
\newcommand{\cabstract}[2]{
    \baseabstract{\other@cabstract}{\heiti\other@keywords}{#1}{#2}
}

% 英文摘要
\newcommand{\eabstract}[2]{
    \baseabstract{\bf Abstract}{\bf Key words: }{#1}{#2}
}

%-------------------------------------------------------------------------------
%                文章、专利、项目列设计（参考哈工大模板）
%-------------------------------------------------------------------------------
% 定义新计数器
\newcounter{pubctr} 						
% 定义新环境
\newenvironment{publist}{
	\begin{list}{[\arabic{pubctr}]} 		%%标签格式
		{
			\usecounter{pubctr}
			\setlength{\leftmargin}{1.7em}	% 左边界 \leftmargin =\itemindent + \labelwidth + \labelsep
			\setlength{\itemindent}{0em}    % 标号缩进量
			\setlength{\labelsep}{0.5em}    % 标号和列表项之间的距离,默认0.5em
			\setlength{\rightmargin}{0em}   % 右边界
			\setlength{\topsep}{0ex}        % 列表到上下文的垂直距离
			\setlength{\parsep}{0ex}        % 段落间距
			\setlength{\itemsep}{0ex}       % 标签间距
			\setlength{\listparindent}{0pt} % 段落缩进量
		}}
		{\end{list}}
%-------------------------------------------------------------------------------
%                加载字符串配置文件
%-------------------------------------------------------------------------------
\AtEndOfClass{\input{swjtuThesis.cfg}}

\endinput

%% end of file `SWJTU_Thesis.cls'.