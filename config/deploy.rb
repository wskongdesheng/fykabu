# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'pictures_sharing'
set :repo_url, 'git@git.tap4fun.com:admin-tools/pictures-sharing.git'
set :branch, 'master'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
#set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/pictures}

# Default value for default_env is {}
#set :default_env, { path: "/home/developer/.rbenv/versions/2.0.0-p451/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5
