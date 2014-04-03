Braingrant-up lamp Alias
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