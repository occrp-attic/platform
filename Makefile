.PHONY: elasticsearch

build: elasticsearch platform

dev:
	pip install -q --upgrade bumpversion

elasticsearch:
	cd elasticsearch && make

platform:
	docker build --pull --compress -t alephdata/platform .