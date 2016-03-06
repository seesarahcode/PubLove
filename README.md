# PubLove
[![Build Status](https://travis-ci.org/seesarahcode/PubLove.png)](https://travis-ci.org/seesarahcode/PubLove)
[![codecov.io](https://codecov.io/github/seesarahcode/PubLove/coverage.svg?branch=master)](https://codecov.io/github/seesarahcode/PubLove?branch=master)
[![Code Climate](https://codeclimate.com/github/seesarahcode/PubLove.svg)](https://codeclimate.com/github/seesarahcode/Publove)

PubLove is an integrated client and project management application designed to make it easy for publishers

### Installation

My specific configuration, which assumes you have already installed Homebrew and RVM, and want to use PostgreSQL:

```
git clone git@github.com:seesarahcode/PubLove.git
cd PubLove
rvm install 2.3.0 # or your flavor
rvm use ruby-2.3.0@PubLove --ruby-version --create
brew install postgres
postgres -D /usr/local/var/postgres # starts Postgres
# open new tab
createdb `whoami`  # shut down postgres in other tab
mkdir -p ~/Library/LaunchAgents
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
gem install bundle
bundle install
rake db:create; rake db:migrate; rake db:seed
```
