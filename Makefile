build: push compile
	pdflatex --output-directory output dizertace.tex

compile:
	rm -f source/tex/output.tex && touch source/tex/output.tex
	for src in `find source/markdown/ -type f`; do \
		pandoc -f markdown -t latex $$src >> source/tex/output.tex ; \
	done

push:
	git add .
	git commit -m "Revision at `date`"
	git push
