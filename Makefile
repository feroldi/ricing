PD=pandoc
OUT=html
PDFLAGS=-s -f markdown
OUTDIR=build
MD_FILES = $(shell find -type f -name '*.md' | grep chapter)
OUT_FILES = $(patsubst ./%.md, $(OUTDIR)/$(OUT)/%.$(OUT), $(MD_FILES))

.PHONY: all

all: $(OUT_FILES)

$(OUTDIR)/$(OUT)/%.$(OUT): %.md
	@mkdir -p "$(@D)"
	@echo "PD  $< $@"
	@$(PD) $(PDFLAGS) -t $(OUT) -o $@ $<

clean:
	@rm -rf "$(OUTDIR)/$(OUT)/"
