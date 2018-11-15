ifndef IMG_NAME
		IMG_NAME=ipmi_mock_server
endif

ifndef CONT_NAME
		CONT_NAME="${IMG_NAME}_cont"
endif

ifndef PORT
		PORT=623
endif

build:
	docker build --network=host -t ${IMG_NAME} .

up: build
	@echo "Starting server..."
	docker run --name ${CONT_NAME} -d --network=bridge -p ${PORT}:6230/udp ${IMG_NAME}

down:
	-docker kill ${CONT_NAME}
	-docker rm --force ${CONT_NAME}

clean: down
	-docker rmi --force ${IMG_NAME}
