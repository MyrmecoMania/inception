up:
	cd srcs && docker compose up

down:
	cd srcs && docker compose down
clean:
	docker system prune -a -f