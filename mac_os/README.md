## MAC OS

### macOS settings

Run `sh mac_os/setup.sh` for specific my custom _System Preferences_ setup. Edit it as you may please.

### Brew

I have 3 Brewfiles in the `./mac_os` folder, in order of elaboration: (The command to install use the specific Brewfile is in **brackets**)

- Brewfile (`brew bundle --file mac_os/work.Brewfile`)
- work.Brewfile (`brew bundle --file mac_os/work.Brewfile`)
- pro.Brewfile (`brew bundle --file mac_os/pro.Brewfile`)

> A note on mas CLI

Apps installed using [mas CLI](https://github.com/mas-cli/mas) would be saved in the Brewfile, in previous macOS versions. Use the lDs in the [`/mac_os/mas_list.txt`](/mac_os/mas_list.txt) to install.

### Rectangle

Once, rectangle is installed, import settings in [`/mac_os/RectangleConfig.json`](/mac_os/RectangleConfig.json).

For context, I've only added these:

![RectangleConfig](/rectangle.png)

### iTerm

To sync iTerm settings, open iTerm's **Preferences/General/Preferences**:

1. select the checkbox,
2. navigate to the local repo,
3. then, after _Save Changes_, select **Manually** and exit.
4. Open iTerm once again to see the preferences loaded.

![iTerm preferences](iterm.png)

To save any updates to your preferences, open iTerm's **Preferences/General/Preferences** and after _Save Changes_, select **When Quitting**.


![Saving iTerm preferences](iterm2.png)

Now your changes are tracked in the `com.googlecode.iterm2.plist` file at the root folder.
