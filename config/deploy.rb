require 'rvm/capistrano' # Для работы rvm
#require 'bundler/capistrano' # Для работы bundler. При изменении гемов bundler автоматически обновит все гемы на сервере, чтобы они в точности соответствовали гемам разработчика. 


set :rails_env, "production"
rails_env = "production"
set :rvm1_map_bins, -> { fetch(:rvm_map_bins).to_a.concat(%w{rake gem bundle ruby}).uniq }
set :rvm_type, :user
set :rvm_ruby_version, 'ruby-2.6.3p62'
set :rvm_binary, '~/.rvm/bin/rvm'

set :deploy_to, "/var/www/apps/pl_consult"
set :unicorn_conf, "#{deploy_to}/current/config/unicorn.rb"
unicorn_conf = "#{deploy_to}/current/config/unicorn.rb"
set :unicorn_pid, "#{deploy_to}/shared/pids/unicorn.pid"

set :use_sudo, false
set :rvm_ruby_string, 'ree' # Это указание на то, какой Ruby интерпретатор мы будем использовать.

set :repo_url,  "git@github.com:Macj/psicho_andrew.git" # Путь до вашего репозитария. Кстати, забор кода с него происходит уже не от вас, а от сервера, поэтому стоит создать пару rsa ключей на сервере и добавить их в deployment keys в настройках репозитария.
set :branch, "master" # Ветка из которой будем тянуть код для деплоя.
set :deploy_via, :remote_cache # Указание на то, что стоит хранить кеш репозитария локально и с каждым деплоем лишь подтягивать произведенные изменения. Очень актуально для больших и тяжелых репозитариев.


after 'deploy:updating', :roles => :app do
  # Здесь для примера вставлен только один конфиг с приватными данными - database.yml. Обычно для таких вещей создают папку /srv/myapp/shared/config и кладут файлы туда. При каждом деплое создаются ссылки на них в нужные места приложения.
  run "rm -f #{current_release}/config/database.yml"
  run "ln -s /var/www/apps/pl_consult/shared/config/database.yml /var/www/apps/pl_consult/current/config/database.yml"
end

# Далее идут правила для перезапуска unicorn. Их стоит просто принять на веру - они работают.
# В случае с Rails 3 приложениями стоит заменять bundle exec unicorn_rails на bundle exec unicorn
namespace :deploy do
  task :restart do
  	on roles(:app) do
      execute "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; then kill -USR2 `cat #{unicorn_pid}`; else cd #{deploy_to}/current && bundle exec unicorn_rails -c #{unicorn_conf} -E #{rails_env} -D; fi"
  	end
  end
  task :start  do
  	on roles(:app) do
      execute "bundle exec unicorn_rails -c #{unicorn_conf} -E #{rails_env} -D"
    end
  end
  task :stop do
  	on roles(:app) do
      execute "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; then kill -QUIT `cat #{unicorn_pid}`; fi"
  	end
  end
end

after "deploy", "deploy:restart"