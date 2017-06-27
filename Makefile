.PHONY: default dev\:build dev\:up dev\:up\:daemon dev\:down test test\:build test\:up test\:up\:daemon test\:down

default:
	exit 1

# dev

dev\:build:
	source `pwd`/.env.sh && docker-compose -f docker-compose.dev.yml build

dev\:up:
	source `pwd`/.env.sh && docker-compose -f docker-compose.dev.yml up --force-recreate

dev\:up\:daemon:
	source `pwd`/.env.sh && docker-compose -f docker-compose.dev.yml up -d --force-recreate

dev\:down:
	source `pwd`/.env.sh && docker-compose -f docker-compose.dev.yml down

# test

test:
	@echo "Testing with message \"$(MESSAGE)\" !!!!!"

test\:build:
	docker-compose -f docker-compose.test.yml build

test\:up:
	docker-compose -f docker-compose.test.yml up --force-recreate

test\:up\:daemon:
	docker-compose -f docker-compose.test.yml up -d --force-recreate

test\:down:
	docker-compose -f docker-compose.test.yml down
