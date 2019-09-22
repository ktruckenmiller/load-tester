

run: build
	docker run -it --rm \
		-v ${PWD}:${PWD} \
		-w ${PWD} \
		blazemeter/taurus \
		test.yml

build:
	docker build -t ktruckenmiller/blazemeter .

local: build
	docker run -it --rm \
		-e IAM_ROLE \
		-e S3_LOCATION=s3://kloudcover/tools/application-profiling/test.yml \
		ktruckenmiller/blazemeter
