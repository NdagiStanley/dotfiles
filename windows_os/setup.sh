# Have Windows10 installed


# Run on CMD (Administrator)
# Replace the <> with the outputs of the enclosed commands

# Change username and hostname
WMIC computersystem where caption='<$(hostname)>' rename silicon_savannah
WMIC useraccount where name='<$(whoami)>' rename stanmd


# Run on PowerShell
# Install Chocolatey
cd .. && sh install.sh choco

# Chocofile is created from $(choco list -la > Chocofile) (with some obvious chunks and non-user installed packages removed)
while read APP; do choco install "$APP" | { read first rest ; echo $first ; };

# Hub - Git
Add-Content $PROFILE "nSet-Alias git hub"

# Enable Subsystem Linux 
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux


# Run on GitBash

# SSH keys
ssh-keygen -t rsa -b 4096 -C ".."
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
clip < ~/.ssh/id_rsa.pub
> https://github.com/settings/keys

# Same as running $(sh link.sh windows) at the root level
sh link.sh
