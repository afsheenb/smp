DIST := "dist"
BOOK_SRC := "src/smp.md"

default: html epub pdf

mkdir-dist:
	mkdir -p {{DIST}}

html: mkdir-dist
	pandoc {{BOOK_SRC}} -o {{DIST}}/index.html \
	  -s \
	  --toc \
	  --lua-filter=src/filters/date-format.lua \
	  --include-in-header=src/includes/style.html \
	  --include-before-body=src/includes/header.html \
	  --template=src/templates/default.html
	cp -r src/images {{DIST}}

epub: mkdir-dist
	pandoc {{BOOK_SRC}} -o {{DIST}}/smp.epub \
	  --toc \
	  --lua-filter=src/filters/date-format.lua

pdf: mkdir-dist
	pandoc {{BOOK_SRC}} -o {{DIST}}/smp.pdf \
	  --toc \
	  --lua-filter=src/filters/date-format.lua \
	  --include-in-header=src/includes/preamble.tex

clean:
	rm -rf {{DIST}}
