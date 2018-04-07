

dev:
	pip install -q --upgrade bumpversion

build:
	docker build -t alephdata/platform .