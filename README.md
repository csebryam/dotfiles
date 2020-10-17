# dotfiles

### Resources
* https://www.atlassian.com/git/tutorials/dotfiles
* https://www.youtube.com/watch?v=tBoLDpTWVOM&t=990s

## Basic Instructions


### Set the alias in .zshrc
* `alias config='/usr/bin/git --git-dir=$HOME/.config/ --work-tree=$HOME'`

### Check status
`config status`

### To add a file
`config add file_name`

### To commit file
`config commit -m "Add new file"`

### Pushing a file to repo
`config push`

## Load files in separate computer

### Set the alias in .zshrc (new computer)
* `alias config='/usr/bin/git --git-dir=$HOME/.config/ --work-tree=$HOME'`

### Add the .config directory to git ignore (prevent recursive errors)
* `echo ".config" >> .gitignore`

### Clone repo
* `git clone --bare <git-repo-url> $HOME/.config`

### Copy repo files locally
* `config checkout`

### Set untracked files to no on local machine
`config config --local status.showUntrackedFiles no`
