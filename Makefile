deploy:
	docker build -t webuilder240/webhook_debugger:latest .
	docker push webuilder240/webhook_debugger

build:
	docker build -t webuilder240/webhook_debugger:latest .

push:
	docker push webuilder240/webhook_debugger
