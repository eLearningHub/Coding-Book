conda-env:
	conda env create --file environment.yml -n coding-book

requirements:
	pip install -r requirements.txt

book:
	jupyter-book build .
