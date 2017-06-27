.PHONY: default dev\:build dev\:up dev\:up\:daemon dev\:down

default:
	exit 1

dev\:build:
	source `pwd`/.env.sh && docker-compose -f docker-compose.dev.yml build

dev\:up:
	source `pwd`/.env.sh && docker-compose -f docker-compose.dev.yml up --force-recreate

dev\:up\:daemon:
	source `pwd`/.env.sh && docker-compose -f docker-compose.dev.yml up -d --force-recreate

dev\:down:
	source `pwd`/.env.sh && docker-compose -f docker-compose.dev.yml down
