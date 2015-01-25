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
