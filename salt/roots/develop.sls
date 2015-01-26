{% set user = "vagrant" %}

#install git
git:
  pkg.installed


https://github.com/saltstack/salt.git:
  git.latest:
    - user: {{user}}
    - rev: develop
    - always_fetch: True 
    - target: /home/{{user}}/salt

#git remote add upstream https://github.com/saltstack/salt

python-virtualenv:
  pkg.installed

python-m2crypto:
  pkg.installed

python-dev:
  pkg.installed

/home/{{user}}/salt.virtenv:
  virtualenv.managed:
    - cwd: /home/{{user}}
    - user: {{user}}
    - system_site_packages: False
    - requirements: salt://virtualenv.txt

# cp ./salt/conf/master ./salt/conf/minion /path/to/your/virtualenv/etc/salt/
/home/{{user}}/salt.virtenv/etc/salt/master:
  file.copy:
    - source: /home/{{user}}/salt/conf/master
    - preserve: True
    - makedirs: True

/home/{{user}}/salt.virtenv/etc/salt/minion:
  file.copy:
    - source: /home/{{user}}/salt/conf/minion
    - preserve: True
    - makedirs: True

