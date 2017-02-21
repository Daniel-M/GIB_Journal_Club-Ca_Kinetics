all: lectures-list-proposal-gib_jc.pdf	docs/index.html	README.md

lectures-list-proposal-gib_jc.pdf: lectures-list-proposal-gib_jc.do.txt
	echo "Building PDF"
	doconce format pdflatex $^ --encoding=utf-8
	doconce ptex2tex lectures-list-proposal-gib_jc.p.tex 
	pdflatex lectures-list-proposal-gib_jc.tex 
	bibtex lectures-list-proposal-gib_jc.aux
	pdflatex lectures-list-proposal-gib_jc.tex
	pdflatex lectures-list-proposal-gib_jc.tex 

docs/index.html: lectures-list-proposal-gib_jc.do.txt
	echo "Building HTML docs"
	doconce format html $^ --encoding=utf-8 
	mv lectures-list-proposal-gib_jc.html docs/index.html
	
README.md: lectures-list-proposal-gib_jc.do.txt
	echo "Building README"
	doconce format markdown $^ --encoding=utf-8 
	mv lectures-list-proposal-gib_jc.md README.md

GIB_Journal_Club_on_Ca_Kinetics.zip: docs/index.html lectures-list-proposal-gib_jc.pdf
	cp -f lectures-list-proposal-gib_jc.pdf GIB_Journal_Club_on_Ca_Kinetics/
	zip -r GIB_Journal_Club_on_Ca_Kinetics.zip GIB_Journal_Club_on_Ca_Kinetics/
