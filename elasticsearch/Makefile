VERSION=6.2.4

elasticsearch:
	docker build --pull -t alephdata/platform-elasticsearch:$(VERSION) .

push: elasticsearch
	docker push alephdata/platform-elasticsearch:$(VERSION)