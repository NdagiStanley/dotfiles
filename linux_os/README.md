# Linux OS

## Git

### SSH keys

```sh
ssh-keygen -t rsa -b 4096 -C ".."
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
sudo apt-get install xclip -y
xclip -sel clip < ~/.ssh/id_rsa.pub
```

The SSH Public Key is now in your clipboard. Navigate to [this page](https://github.com/settings/keys), click on **New SSH key**, enter a _title_, paste the _Public Key_ and click on **Add SSH key**.
