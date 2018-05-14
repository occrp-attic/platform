VERSION=2.1.2

build: platform

dev:
	pip install -q --upgrade bumpversion

platform:
	docker build --pull --compress -t alephdata/platform .