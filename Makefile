deploy:
	docker run -it --rm \
		-e IAM_ROLE=arn:aws:iam::601394826940:role/cloudformation \
		-v ${PWD}:${PWD} \
		-w ${PWD} \
		ktruckenmiller/ansible \
		ansible-playbook -i ansible_connection=localhost test_it.yml -e region=us-east-2 -e environ=dev -e version=$(shell git rev-parse HEAD)
