
name:
	@echo "vagrant-provision"
version:
	@echo "v1.0.0"

test:
	@echo "running test..."
	@rm -rf test
	@git clone git@github.com:joaquimserafim/vagrantfile-template.git test
	@cd test ; vagrant up

ssh:
	@echo "running vm ssh..."
	@cd test ; vagrant ssh

up:
	@echo "running vm up..."
	@cd test ; vagrant up

halt:
	@echo "running vm halt..."
	@cd test ; vagrant halt

clean:
	@echo "clean test..."
	@cd test ; vagrant destroy ; cd .. ; rm -rf test

.PHONY: name version test clean ssh up halt
