set :application, "ProjetoEstudoRails"

set :scm, :git
set :scm_username, "handersonbf@gmail.com"
set :repository,  "git@github.com:handersonbf/ProjetoEstudoRails.git"
set :branch, "master"
set :git_enable_submodules, 1


set :deploy_to, "/home/deployer/apps/"
#set :deploy_via, :remote_cache
set :user, "root"
set :runner,"root"
set :password,"senha"
set :use_sudo, false

ssh_options[:paranoid]    = false
default_run_options[:pty] = true


# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "###.###.##.##"                          # Your HTTP server, Apache/etc
role :app, "###.###.##.##"                          # This may be the same as your `Web` server
role :db,  "###.###.##.##", :primary => true # This is where Rails migrations will run
#role :db,  "127.0.0.1"


namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no­op with mod_rails"
    task t, :roles => :app do ; end
  end
end

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end