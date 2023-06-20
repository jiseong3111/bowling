.PHONY:up
up:
	docker compose -p bowling-db up -d

.PHONY:down
down:
	docker compose -p bowling-db down

.PHONY:log
log:
	docker compose -p bowling-db logs -f

.PHONY:clean
clean:
	docker compose -p bowling-db down -v
