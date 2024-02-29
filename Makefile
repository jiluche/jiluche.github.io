DOCS = index index_en index_cn index_work index_w
COMPILER = jemdoc.py
CONF= mysite.conf

HDOCS=$(addsuffix .html, $(DOCS))

.PHONY: all
all : $(HDOCS)

%.html: %.jemdoc
	python3 $(COMPILER) -c $(CONF) -o $@ $<

.PHONY: upload
upload:
	git add .
	git commit -m "regular update"
	git push -u origin master

.PHONY: clean
clean:
	-rm -f $(HDOCS)
