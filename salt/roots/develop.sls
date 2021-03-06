{% set DEV_USER = salt['pillar.get']('user:lookup:name') %}
{% set GIT_REPO_ORIGIN = salt['pillar.get']('gitrepo:lookup:origin') %}
{% set GIT_REPO_BRANCH = salt['pillar.get']('gitrepo:lookup:branch') %}
{% set GIT_REPO_TARGET = salt['pillar.get']('gitrepo:lookup:target') %}
{% set VIRTUAL_ENV_NAME = salt['pillar.get']('virtualenv:lookup:name') %}

#install git
git:
  pkg.installed


ensure that git repo is cloned:
  git.latest:
    - name: {{GIT_REPO_ORIGIN}}
    - user: {{DEV_USER}}
    - rev: {{GIT_REPO_BRANCH}}
    - target: /home/{{DEV_USER}}/{{GIT_REPO_TARGET}}

#git remote add upstream https://github.com/saltstack/salt

python-virtualenv:
  pkg.installed

python-m2crypto:
  pkg.installed

python-dev:
  pkg.installed

ensure that salt virtualenv for developing is created:
  virtualenv.managed:
    - name: /home/{{DEV_USER}}/{{VIRTUAL_ENV_NAME}}
    - cwd: /home/{{DEV_USER}}
    - user: {{DEV_USER}}
    - system_site_packages: False
    - requirements: salt://virtualenv.txt

ensure that salt virtualenv for testing is created:
  virtualenv.managed:
    - name: /home/{{DEV_USER}}/{{VIRTUAL_ENV_NAME}}
    - cwd: /home/{{DEV_USER}}
    - user: {{DEV_USER}}
    - system_site_packages: False
    - requirements: salt://req_dev_python27.txt

# cp ./salt/conf/master ./salt/conf/minion /path/to/your/virtualenv/etc/salt/
ensure that salt master config for testing is copied:
  file.copy:
    - name: /home/{{DEV_USER}}/{{VIRTUAL_ENV_NAME}}/etc/salt/master
    - source: /home/{{DEV_USER}}/{{GIT_REPO_TARGET}}/conf/master
    - preserve: True
    - makedirs: True

ensure that salt minion config for testing is copied:
  file.copy:
    - name: /home/{{DEV_USER}}/{{VIRTUAL_ENV_NAME}}/etc/salt/minion
    - source: /home/{{DEV_USER}}/{{GIT_REPO_TARGET}}/conf/minion
    - preserve: True
    - makedirs: True

# TODO make adaptions to master and minion config
