
cmd ?= "halt"

name:
	@echo "vagrant-scripts"

version:
	@echo "v1.0.0"

test:
	@echo "running test..."
	@rm -rf test
	@git clone git@github.com:joaquimserafim/vagrantfile-template.git test
	@sed -i 's/https:\/\/raw.githubusercontent.com\/joaquimserafim\/vagrant-provision\/master\/provision.sh/..\/provision.sh/' test/Vagrantfile
	@cd test ; vagrant up

clean:
	@echo "running clean..."
	@cd test ; vagrant destroy ; cd .. ; rm -rf test

run:
	@echo "running vagrant $(cmd)..."
	@cd test ; vagrant $(cmd)

.PHONY: name version test clean run