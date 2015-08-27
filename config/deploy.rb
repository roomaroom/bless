# config valid only for Capistrano 3.1
lock '3.4.0'
set :application, 'bless'
set :repo_url, 'git@github.com:roomaroom/bless.git'
set :shared_path, "/root/bless/shared"
set :branch, 'master'
set :scm, :git
# set :format, :pretty
# set :pty, true
set :default_stage, 'production'
#set :use_sudo, false
#set :deploy_via, :copy
set :deploy_via, :remote_cache
# Default branch is :master
#set :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/root/bless'

#set :deploy_to, "/root/bless"
#set :log_level, :info
set :linked_files, %w(config/database.yml config/secrets.yml)
# Default value for :scm is :git
# set :scm, :git

set :linked_dirs, %w{ public/uploads}
# Default value for :format is :pretty
# set :format, :pretty
set :port, 2225
# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end
  #before :finishing, 'linked_files:upload'
  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
