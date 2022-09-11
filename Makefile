conda-env:
	conda env create --file environment.yml -n leetcode-book

book:
	jupyter-book build .
