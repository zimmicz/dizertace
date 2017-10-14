.PHONY: build
build: compile tex push

.PHONY: compile
compile:
	rm -f source/tex/output.tex && touch source/tex/output.tex
	for src in `find source/markdown/ -type f`; do \
		pandoc -f markdown -t latex $$src >> source/tex/output.tex ; \
	done

.PHONY: push
push:
	git add .
	git commit -m "Revision at `date`"
	git push

.PHONY: tex
tex:
	pdflatex --output-directory output dizertace.tex
