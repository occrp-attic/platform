VERSION=2.1.5

build: platform

dev:
	pip install -q --upgrade bumpversion

platform:
	docker build --pull --compress -t alephdata/platform .