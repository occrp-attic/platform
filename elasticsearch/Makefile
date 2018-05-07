VERSION=6.2.4-vendor0

elasticsearch:
	docker build --pull --compress -t alephdata/platform-elasticsearch:$(VERSION) .

push: elasticsearch
	docker push alephdata/platform-elasticsearch:$(VERSION)