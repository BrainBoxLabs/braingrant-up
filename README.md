First time install requirements
===============================

Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](https://www.vagrantup.com/downloads.html)

Add the following alias to your `~/.bashrc` or `~/.profile` file

```
#BrainBox Lamp Stack
alias lamp="curl -L -o 'install.sh' http://bit.ly/1j1F30E && curl -L -o 'Vagrantfile' http://bit.ly/1hC60se && curl -L -o '_vagrant.zip' http://bit.ly/1hFlLP9 && unzip _vagrant.zip"
```

Braingrant-up
=============

Create a project folder anywhere on your dev machine.

`cd` into the project folder in `Terminal` and type: `lamp`

You've now downloaded the base config install files.

In `Terminal` type `vagrant up`

Now go grab a beer.

***Note the initial install has to download a full .box (.iso) image from the internet. This process is much faster the second time around.***

By default you can access your new dev machine @ [http://192.168.33.25/](http://192.168.33.25/).

***Note: You should change the ip address in the `VagrantFile` if you plan on running multiple stacks.***
