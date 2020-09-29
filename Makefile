IMAGE_NAME ?= ajv

.PHONY: test

build:
	docker build --tag $(IMAGE_NAME) $(PWD)

test:
	@docker run -v $(PWD)/test:/data $(IMAGE_NAME) \
	validate \
	-s schema.json \
	-d doc.json
