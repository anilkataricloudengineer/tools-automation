infra:
	git pull
	terraform init
	terraform apply -auto-approve -var ssh_username=anil -var ssh_password=Devops123456
	## Username and password should not be hardcoded, Here we are just hardcoding because to avoid the passing of input.
	## This need to be parsed as input in real time


ansible:
	git pull
	ansible-playbook -i $(tool_name)-internal.anilcloudengineer.online, tool-setup.yml -e ansible_user=anil -e ansible_password=Devops123456 -e tool_name=$(tool_name)
	## Username and password should not be hardcoded, Here we are just hardcoding because to avoid the passing of input.
    ## This need to be parsed as input in real time