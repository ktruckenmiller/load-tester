

run: build
	docker run -it --rm \
		-v ${PWD}:${PWD} \
		-w ${PWD} \
		blazemeter/taurus \
		test.yml

build:
	docker build -t ktruckenmiller/blazemeter .
