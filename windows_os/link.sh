dir=~/dotfiles
files="aliases functions"
for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -sf "$dir/.$file" ~/.$file
done

git_dir=~/dotfiles/git
files="gitconfig gitignore_global"
for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -sf "$git_dir/.$file" ~/.$file
done

windows_dir=~/dotfiles/windows_os
files="bash_profile bashrc"
for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -sf "$windows_dir/.$file" ~/.$file
done
