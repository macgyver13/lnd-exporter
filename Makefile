PREFIX = bitdonkey/lnd-exporter
TAG = 0.1.2

BUILD_DIR = build_output

container:
	docker build -t $(PREFIX):$(TAG) .

push: container
	docker push $(PREFIX):$(TAG)

clean:
	-rmdir $(BUILD_DIR)

