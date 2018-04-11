

dev:
	pip install -q --upgrade bumpversion

build:
	docker pull debian:stretch
	docker build -t alephdata/platform .