.PHONY: all create read update delete

all: create update read

create:
	./scripts/create.sh

read:
	./scripts/read.sh

update:
	./scripts/update.sh

delete:
	./scripts/delete.sh

