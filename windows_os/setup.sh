# Chocofile is created from $(choco list -la > Chocofile) (with some obvious chunks and non-user installed packages removed)
while read APP; do choco install "$APP" | { read first rest ; echo $first ; };

# Hub - Git
Add-Content $PROFILE "nSet-Alias git hub"

# Enable Subsystem Linux 
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

# Same as running $(sh link.sh windows) at the root level
sh link.sh
