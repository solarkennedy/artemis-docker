TAG=artemis

build:
	docker build -t $(TAG) .

run: build
	docker run -t -i -p 2010:2010 -p 5900:5900 $(TAG)

vnc: build
	docker run -t -i -p 5900:5900 $(TAG) bash
