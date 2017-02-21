lectures-list-proposal-gib_jc.pdf: lectures-list-proposal-gib_jc.do.txt
	doconce format pdflatex  $^
	doconce ptex2tex lectures-list-proposal-gib_jc.p.tex 
	pdflatex lectures-list-proposal-gib_jc.tex 
	bibtex lectures-list-proposal-gib_jc.aux
	pdflatex lectures-list-proposal-gib_jc.tex
	pdflatex lectures-list-proposal-gib_jc.tex 
