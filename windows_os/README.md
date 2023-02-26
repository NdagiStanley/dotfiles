# Windows OS

Have Windows10 installed

## Update hostname and username (optional)

> Run on CMD (Administrator)

Run:
`$(hostname)` and `$(whoami)`

_Replace the <> with the outputs of the enclosed commands_

_Change username and hostname_

```cmd
WMIC computersystem where caption='<$(hostname)>' rename silicon_savannah
WMIC useraccount where name='<$(whoami)>' rename stanmd
```

## Setup
> Run on PowerShell

_Install Chocolatey, install apps and link files_ (While still on the root of the repo)
```
./setup.sh windows
```

### Git
In GitBash run:

_SSH keys_
```
ssh-keygen -t rsa -b 4096 -C ".."
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
clip < ~/.ssh/id_rsa.pub
```
The SSH Public Key is now in your clipboard. Navigate to [this page](https://github.com/settings/keys), click on **New SSH key**, enter a _title_, paste the _Public Key_ and click on **Add SSH key**.
