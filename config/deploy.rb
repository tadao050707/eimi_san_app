# config valid for current version and patch releases of Capistrano
lock "~> 3.16.0"

set :application, "Wonder"
set :repo_url, "git@github.com:kudoueimii/Wonder.git"

set :branch, ENV['BRANCH'] || 'master'

set :deploy_to, "/var/www/Wonder"

set :linked_files, %w{.env config/database.yml config/master.key}

set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets public/uploads}

set :keep_releases, 5

set :rbenv_ruby, '3.0.1'
set :rbenv_type, :system

set :log_level, :info

namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  desc 'Create database'
  task :db_create do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:create'
        end
      end
    end
  end

  desc 'Run seed'
  task :seed do
    on roles(:app) do
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end
end