{% set user = "vagrant" %}

#install git
git:
  pkg.installed


https://github.com/saltstack/salt.git:
  git.latest:
    - rev: develop
    - always_fetch: True 
    - target: /home/{{user}}/salt

#git remote add upstream https://github.com/saltstack/salt


