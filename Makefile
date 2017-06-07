cfp: ifl2017-cfp.txt
	pandoc -f markdown -t html -s --template=template.html -o cfp.html ifl2017-cfp.txt
	cp ifl2017-cfp.txt cfp.txt
