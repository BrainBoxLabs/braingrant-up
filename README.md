Braingrant-up
============

Install `VirtualBox` and `Vagrant`

Create a `.aliases` file in ~/ and add this to the file:

```
#Vagrant Lamp
alias lamp="curl -L -o 'install.sh' http://bit.ly/1j1F30E && curl -L -o 'Vagrantfile' http://bit.ly/1hC60se"
```

Now open `Terminal` and type:

```
source ~/.aliases
```



***Note: After you have completed the steps above, you don't need to do them again each time you run a dev install.***



Create a project folder anywhere on your dev machine.

`cd` into the project folder in `Terminal` type: `lamp` and hit `enter`

You've now downloaded the base config install files.

In `Terminal` type `vagrant up` and hit `enter`

Go grab a beer.

***Note the initial install has to download a full .box (.iso) image from the internet. This process is much faster the second time around.***

Once the process has completed type `vagrant ssh-config` and hit `enter`

You can use the ssh output to connect via sftp using:

host: (usually 127.0.0.1)
port: (output in terminal)
u: vagrant
p: vagrant

By default you can access your new dev machine @ [http://192.168.33.21/](http://192.168.33.21/)

Now when you commit your project everyone on the team will have access to your dev environment.
