ACCOUNT_ID:=044768335503
IMAGE:=cdk-auto-build
REGISTRY:=$(ACCOUNT_ID).dkr.ecr.ap-northeast-1.amazonaws.com/$(IMAGE)
TAG:=$(git rev-parse HEAD)

login:
	$(shell aws ecr get-login --no-include-email --region ap-northeast-1)

build:
	docker build ./ -t $(IMAGE)
	docker tag $(IMAGE):latest $(REGISTRY):latest
	docker tag $(IMAGE):latest $(REGISTRY):$(TAG)

push: build
	docker push 044768335503.dkr.ecr.ap-northeast-1.amazonaws.com/cdk-auto-build:latest
	docker push 044768335503.dkr.ecr.ap-northeast-1.amazonaws.com/cdk-auto-build:$(TAG)

pull: login
	docker pull 044768335503.dkr.ecr.ap-northeast-1.amazonaws.com/cdk-auto-build:latest
