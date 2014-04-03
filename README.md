Braingrant-up
============

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

By default you can access your new dev machine @ [http://192.168.33.25/](http://192.168.33.25/).

***Note: You should change the ip address in the `VagrantFile` if you plan on running multiple lamp stacks.***

Finally the most basic set of vagrant commands you will need to use are:

`vagrant up` - starts the virtual box
`vagrant halt` - completely stops the virtual box

and

`vagrant ssh` - Allows you to ssh into the box
