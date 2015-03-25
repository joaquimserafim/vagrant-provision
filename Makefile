
cmd ?= "halt"

.PHONY: name version test clean run

name:
	@echo "vagrant-scripts"

version:
	@echo "v1.1.0"

test:
	@echo "running test..."
	@rm -rf test
	@git clone git@github.com:joaquimserafim/vagrantfile-template.git test
	@cd test ; SKIP_UPDATE=true SCRIPTS=../../vagrant-scripts/scripts PROVISION_SCRIPT=../provision.sh PROVISION=" silversearcher_ag" vagrant up

clean:
	@echo "running clean..."
	@cd test ; vagrant destroy ; cd .. ; rm -rf test

run:
	@echo "running vagrant $(cmd)..."
	@cd test ; vagrant $(cmd)