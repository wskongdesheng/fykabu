set :user, "developer"
set :use_sudo, false
set :deploy_to, "/var/www/apps/#{fetch :application}"
set :rails_env, :production

role :app, %w{developer@112.124.54.225}
role :web, %w{developer@112.124.54.225}
role :db,  %w{developer@112.124.54.225}

set :ssh_options, {
  forward_agent: true,
  auth_methods: %w(publickey)
}

set :rbenv_type, :auto
set :rbenv_ruby, "2.0.0-p451"
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}

namespace :deploy do
  task :upload => "config/secrets.production.yml" do |t|
    on roles(:app) do
      upload!(t.prerequisites.first, release_path.join("config/secrets.yml"))
    end
  end

  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute "sudo /usr/sbin/nginx -s reload"
      execute :touch, release_path.join("tmp/restart.txt")
    end
  end

  task :setup_config do
    on roles(:app) do
      execute "ln -nfs #{release_path}/config/deploy/nginx_staging.conf /etc/nginx/sites-enabled/#{fetch :application}"
    end
  end

  after "deploy:updating", "deploy:upload"

  after :publishing, "deploy:setup_config"

  after "deploy:setup_config", "deploy:restart"

  after :finishing, "deploy:cleanup"
end