all:
	python -c "import inspect; import socialshares; print inspect.getdoc(socialshares.command)" \
		> README.md
	pandoc -o README.rst README.md

upload:
	python setup.py sdist upload

URL := http://www.theguardian.com/politics/2014/sep/08/pound-slumps-scottish-yes-campaign-poll-lead

test:
	python socialshares/command.py $(URL) --retry 0;
	for platform in facebook google pinterest reddit twitter; \
	do \
		python socialshares/command.py $(URL) $$platform --retry 0; \
	done 
	