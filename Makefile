PROJECT:=crpsu_coursework_rafael.pdf 
PROJECT_FILE:=$(PROJECT)

EXPORT_DIR:=export
SOURCE_DIR:=src

LATEXMK:=latexmk
LATEXMK_PDF_ARGS:= -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make -quiet 
LATEXMK_CLEAN_ARGS:= -CA


MATLAB_SCRIPTS_LIST:= $(wildcard $(SOURCE_DIR)/*.m)
MATLAB_RUN_SCRIPT:=octave-cli
MATLAB_RUN_SCRIPT_ARGS:= --path $(SOURCE_DIR)

MATLAB_EXPORT_FIGURE:=octave-cli
MATLAB_EXPORT_FIGURE_ARGS:= -path $(SOURCE_DIR)


M_FILES:= $(wildcard *.m)
RES_FILES:= $(wildcard *.res)
IMG_FILES:= $(wildcard *.png)
ALL_FILES:= $(M_FILES) $(RES_FILES) $(IMG_FILES)

DIA:=dia
DIA_ARGS:=

PDF_READER:=mupdf

#################################################################

all: $(PROJECT_FILE) exp
	
$(PROJECT_FILE): main.pdf
	cp $^ $@

main.pdf: main.tex $(ALL_FILES)
	$(LATEXMK) $(LATEXMK_PDF_ARGS) $^ 

##########################################################

%.png: src/%.dia
	$(DIA) $(DIA_ARGS) --export=$@ $^

%.res: src/%.m
	$(MATLAB_RUN_SCRIPT) $(MATLAB_RUN_SCRIPT_ARGS) $^ > $@

%.res: src/%.res
	cp $^ $@

%.png: src/%.svg
	inkscape -z $^ -e $@

%.png: img/%.png
	cp $^ $@

%.png: img/%.jpg
	convert $^ $@

%.png: img/%.jpeg
	convert $^ $@

%.pdf: $(SOURCE_DIR)/%.pdf
	cp $^ $@

%.m: $(SOURCE_DIR)/%.m
	cp $^ $@

%_fig.png: gen_fig.stat
	cp $(SOURCE_DIR)/$@ $@

#####################################################

test:

clean:
	$(LATEXMK) $(LATEXMK_CLEAN_ARGS); rm -rf *.pdf *.png *.res *.m *.run.xml *.bbl *.stat *.aux *.log *.fdb_latexmk *.fls

show: $(PROJECT_FILE)
	$(PDF_READER) $(PROJECT_FILE)

exp: $(PROJECT_FILE)
	cp $(PROJECT_FILE) $(EXPORT_DIR)

gen_fig.stat: $(MATLAB_SCRIPTS_LIST)
	grep -l figure $^ #| xargs -I {} $(MATLAB_EXPORT_FIGURE) $(MATLAB_EXPORT_FIGURE_ARGS) {}; touch $@

.PHONY:clean show expi test
