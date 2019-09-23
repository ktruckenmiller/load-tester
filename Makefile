

run: build
	docker run -it --rm \
		-v ${PWD}:${PWD} \
		-w ${PWD} \
		blazemeter/taurus \
		test.yml

deploy:
	docker run -it --rm \
	-v ${PWD}:${PWD} \
	-w ${PWD} \
	-e IAM_ROLE \
	ktruckenmiller/ansible \
		ansible-playbook -i ansible_connection=localhost test_it.yml \
		-e region=us-west-2 \
		-e version=0.0.3 \
		-e environ=staging -vvv

build:
	docker build -t ktruckenmiller/blazemeter .

local: build
	docker run -it --rm \
		-e IAM_ROLE \
		-e S3_LOCATION=s3://kloudcover/tools/application-profiling/test.yml \
		ktruckenmiller/blazemeter
