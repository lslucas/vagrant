Vagrant for PHP Development
==================

This is just my fork, to see more [follow this guy](https://github.com/Furizaa/soup/) :)

Usage
-----

* [Install Vagrant](http://vagrantup.com)
* Import the lucid32 base box if you havn't allready done so `vagrant init lucid32`
* Clone `git clone git@github.com:lslucas/vagrant.git`.
* cd into the cloned repository
* `vagrant up`
* After the enviroment has been booted and provisioned, `192.168.33.1` should display all your project websites from your ~/Sites directory. In others words thats your new localhost

Reciepes and Tools installed
----------------------------

* Apache2
* MySQL5 Client/Server
* PHP5.3.2 with APC, xDebug, Memcache, Intl, php-gd
* Memcached
* PHPQaTools using Pear: PHPUnit /w extensions, phploc, pDepend, phpCpd, phpMd, phpcs
* GIT
* Vim
* And more...

Extra
-----
I created a shared folder on Vagrantfile to make my local "www" (in my mac my websites are in ~/Sites) visible on ubuntu /var/www

Hint
----

I changed my local /etc/hosts to see localhost as a 192.168.33.10 (vagrant virtual machine)

Example of my /etc/hosts:

	$ cat /etc/hosts
	##
	# Host Database
	#
	# localhost is used to configure the loopback interface
	# when the system is booting.  Do not change this entry.
	##
	192.168.33.10	localhost #here is the thing! Just change your 127.0.0.1 to the same IP in your Vagrantfile (see: config.vm.network :hostonly, "192.168.33.10")

	27.0.0.1 activate.adobe.com
	127.0.0.1 practivate.adobe.com
	#[...] a lot other hosts

	255.255.255.255	broadcasthost
	::1             localhost
	fe80::1%lo0	localhost

Then just type localhost/ on your browser to see all your work :)