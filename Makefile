
CONF:=rafi
PROJECT:=crpsu_coursework$(CONF).pdf 
PROJECT_FILE:=$(PROJECT)

EXPORT_DIR:=export
SOURCE_DIR:=src


LATEXMK:=latexmk
LATEXMK_PDF_ARGS:= -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make -quiet 
LATEXMK_CLEAN_ARGS:= -CA


MATLAB_SCRIPTS_LIST:= $(wildcard $(SOURCE_DIR)/*.m)
MATLAB_RUN_SCRIPT:=/usr/local/Polyspace/R2020b/bin/matlab
MATLAB_RUN_SCRIPT_ARGS:= -sd src -r
MATLAB_REDIRECT= -logfile
MATLAB_EXPORT_FIGURE:=/usr/local/Polyspace/R2020b/bin/matlab
MATLAB_EXPORT_FIGURE_ARGS:= -sd src -r 


M_FILES:= $(wildcard *.m)
RES_FILES:= $(wildcard *.res)
IMG_FILES:= $(wildcard *.png)
ALL_FILES:= $(M_FILES) $(RES_FILES) $(IMG_FILES)

DIA:=dia
DIA_ARGS:=

PDF_READER:=mupdf

#################################################################

all:  gen_fig.stat $(PROJECT_FILE) exp 
	
$(PROJECT_FILE): main.pdf
	cp $^ $@

main.pdf: main.tex $(ALL_FILES)
	$(LATEXMK) $(LATEXMK_PDF_ARGS) $^ 

##########################################################

%.png: src/%.dia
	$(DIA) $(DIA_ARGS) --export=$@ $^

%.res: src/%.m
	$(MATLAB_RUN_SCRIPT) $(MATLAB_RUN_SCRIPT_ARGS) $(basename $^) $(MATLAB_REDIRECT) $@

%_fig.png: gen_fig.stat
	cp $(SOURCE_DIR)/$@ $@

%.res: src/%.res
	sed "s,\x1B\[[0-9;]*[a-zA-Z],,g" $^ > $@

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


#####################################################

test:

clean:
	$(LATEXMK) $(LATEXMK_CLEAN_ARGS); rm -rf *.pdf *.png *.res *.m *.run.xml *.bbl *.stat *.aux *.log *.fdb_latexmk *.fls

show: $(PROJECT_FILE)
	$(PDF_READER) $(PROJECT_FILE)

exp: $(PROJECT_FILE)
	cp $(PROJECT_FILE) $(EXPORT_DIR)

gen_fig.stat: src/lab1.m src/lab2.m
	echo lab1 lab2 | xargs -d ' ' -I {} $(MATLAB_EXPORT_FIGURE) $(MATLAB_EXPORT_FIGURE_ARGS) 'run {}.m;quit' $(MATLAB_REDIRECT) src/{}.res ; touch $@

.PHONY:clean show exp test
