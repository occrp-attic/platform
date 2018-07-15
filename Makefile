VERSION=2.2.0

build: platform

dev:
	pip install -q --upgrade bumpversion

platform:
	docker build --pull --compress -t alephdata/platform .