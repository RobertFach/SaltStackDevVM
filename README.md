SaltStackDevVM
==============
This is a Virtual Machine that can be used for Salt development which gets configured via Vagrant and Salt. 

Dependencies
============
- https://www.vagrantup.com/
- https://www.virtualbox.org/ (In principle Vagrant is not limited to VirtualBox!)

Installation
============
- Install Vagrant by downloading the installer or your package management system.
- Install VirtualBox...

Basic Usage
-----------
For each development environment/machine which you want to use, you have to clone a fresh copy of that repository.
Go into the cloned Repository root folder which contains the Vagrantfile. Start a new developer vm by calling:

.. code-block:: bash

    vagrant up

Destroy a vm by calling:

.. code-block:: bash

    vagrant destroy

Vagrant will install and bootstrap a Ubuntu 14.04 LTS VM for you which will be ready for testing/developing with Salt. That means, the bootstrap clones the repository from https://github.com/saltstack/salt and prepares the machine environment according to the documentation given on http://docs.saltstack.com/en/latest/topics/development/hacking.html. 

You can connect to a bootstrapped VM by calling:

.. code-block:: bash

    vagrant ssh

Right now, the VM is prepared with the develop branch under ``/home/vagrant/salt``. It also sets up a virtual environment where the latest salt develop version has been installed into it.

You can use that virtual environment by calling:

.. code-block:: bash

    ./virtualenv/bin/activate

After that, your salt commands will execute the develop version...

Disclaimer
==========
Note that documentation is not yet complete, nor is everything yet finished.

Therefore, feel free to make suggestions, comments, critiques, etc.

Thanks for developing salt and all the other great tools!!

References
----------
See also https://github.com/RobertFach/vagrant-dev-vm-reactor to get a feeling how Vagrant can be used with Salt.
