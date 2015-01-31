# Liquidz

> A fleshed-out configuration for [liquidprompt](https://github.com/nojhan/liquidprompt) in ZSH. Supports Mac OS X, iTerm2, & Homebrew (currently).

Liquidz does the following:

* Activates liquidprompt.

* Turns on colors in your terminal.

* Activates ZSH completions (many more are available if you install the `zsh-completions` Homebrew formula).

* Turns on ZSH corrections

* Sets the iTerm2 window and tab titles to the current working directory.

* Sets common aliases

More to come! Feel free to open issues to request your favorite features. The next one I'm going to add will probably be ZSH inline command highlighting.

# Installation

Install [Homebrew](http://mxcl.github.io/homebrew/) if you haven't already.

Install zsh, zsh-completions and liquidprompt

    brew install zsh zsh-completions liquidprompt

Setup ZSH as your default shell if you haven't already.
  Add `/usr/local/bin/zsh` to your /etc/shells file.
  Run `chsh -s /usr/local/bin/zsh`.

Clone the Liquidz git repo to your home dir

    git clone https://github.com/guw/liquidz.git ~/.liquidz

Add this to your ~/.zshrc file:

    if [ -f ${HOME}/.liquidz/init.zsh ]; then
       . ${HOME}/.liquidz/init.zsh
    fi

Log out of your terminal and log back in.

# Usage

Currently it should *just work* if you're using Homebrew, OS X, and iTerm2. If
you want to use it in other configurations, let me know and I'll try to adapt
it. Or you can submit a pull request.

# Requirements

* Mac OS X (tested with 10.10 Yosemite)
* iTerm2
* Homebrew-installed ZSH and liquidprompt
