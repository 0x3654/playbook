.PHONY: add-sshkey deploy deploy-import-db deploy-check deploy-verbose restart deploy-amneziawg cleanup-all cleanup-3x-ui sub-cleanup fix-dns deploy-sub-nginx init-new-server diskspace-cleanup add-dns

ANSIBLE_ENV=ANSIBLE_DISPLAY_OK_HOSTS=False ANSIBLE_DISPLAY_SKIPPED_HOSTS=False

deploy:
	$(ANSIBLE_ENV) ansible-playbook -i inventory/inventory.yml playbooks/deploy.yml -e "target_hosts=$(or $(h),all)"

deploy-import-db:
	$(ANSIBLE_ENV) ansible-playbook -i inventory/inventory.yml playbooks/deploy.yml --tags 3x-ui -e "force_import=true"

deploy-check:
	ansible-playbook -i inventory/inventory.yml playbooks/deploy.yml --check -e "target_hosts=$(or $(h),all)"

deploy-verbose:
	ansible-playbook -i inventory/inventory.yml playbooks/deploy.yml -vvvv -e "target_hosts=$(or $(h),all)"

restart:
	$(ANSIBLE_ENV) ansible-playbook -i inventory/inventory.yml playbooks/restart.yml -e "target_hosts=$(or $(h),all)"

deploy-amneziawg:
	$(ANSIBLE_ENV) ansible-playbook -i inventory/inventory.yml playbooks/deploy.yml --tags amneziawg -e "target_hosts=$(or $(h),all)"

cleanup-all:
	$(ANSIBLE_ENV) ansible-playbook -i inventory/inventory.yml playbooks/cleanup-all.yml -e "target_hosts=$(or $(h),all)"

cleanup-3x-ui:
	$(ANSIBLE_ENV) ansible-playbook -i inventory/inventory.yml playbooks/cleanup-3x-ui.yml -e "target_hosts=$(or $(h),all)"

sub-cleanup:
	$(ANSIBLE_ENV) ansible-playbook -i inventory/inventory.yml playbooks/cleanup-sub-3x-ui.yml -e "target_hosts=$(or $(h),all)"

fix-dns:
	$(ANSIBLE_ENV) ansible-playbook -i inventory/inventory.yml playbooks/fix_dns.yml -e "target_hosts=$(or $(h),all)"

deploy-sub-nginx:
	$(ANSIBLE_ENV) ansible-playbook -i inventory/inventory.yml playbooks/deploy.yml --tags sub_nginx_3xui -e "target_hosts=$(or $(h),all)"

init-new-server:
	$(ANSIBLE_ENV) ansible-playbook -i inventory/inventory.yml playbooks/init-new-server.yml -k -e "target_hosts=$(or $(h),all)"
	
diskspace-cleanup:
	$(ANSIBLE_ENV) ansible-playbook -i inventory/inventory.yml playbooks/maint-diskspace.yml -e "target_hosts=$(or $(h),all)"

add-dns:
	ansible-playbook -i inventory/inventory.yml playbooks/add-dns.yml -e "target_hosts=$(or $(h),all)"
