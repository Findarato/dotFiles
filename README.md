# dotFiles

This repository currently contains the following dotFiles

- .aliases
- .bashrc
- .dircolors
- .gitconfig
- .gitignore
- .gitmessage
- .gitmodules
- .zprofile
- .zshrc
- .ansible.cfg

To automatically create symlinks you can use the script linkup.sh. The file contents are displayed below

```bash
for FILE in .*; do
    if [ $FILE != .git ] && [ $FILE != . ] && [ $FILE != .. ]; then
        # echo "$FILE"
        echo "Linking Files"
        rm -f $HOME/$FILE
        ln -s $PWD/$FILE $HOME/$FILE
    fi
done
```
