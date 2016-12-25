PD=pandoc
OUT=html
PDFLAGS=-s -f markdown
OUTDIR=build
MD_FILES = $(shell ls -1 chapter*/item*.md | xargs realpath)
OUT_FILES = $(patsubst ./%.md, $(OUTDIR)/$(OUT)/%.$(OUT), $(MD_FILES))

.PHONY: all

all: $(OUT_FILES)

$(OUTDIR)/$(OUT)/%.$(OUT): %.md
	@mkdir -p "$(@D)"
	@echo "PD  $< $@"
	@$(PD) $(PDFLAGS) -t $(OUT) -o $@ $<

clean:
	@rm -rf "$(OUTDIR)/$(OUT)/"
