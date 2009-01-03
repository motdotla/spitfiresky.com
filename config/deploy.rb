set :runner, "scottmotte"
set :use_sudo, false
 
# =============================================================================
# CUSTOM OPTIONS
# =============================================================================
set :user, "scottmotte"
set :application, "spitfiresky.com"
set :domain, "spitfiresky.com"
 
role :web, domain
role :app, domain
role :db,  domain, :primary => true
 
# =============================================================================
# DEPLOY TO
# =============================================================================
set :deploy_to, "/home/scottmotte/apps/spitfiresky.com"

# # =============================================================================
# # REPOSITORY
# # =============================================================================
set :scm, "git"
set :repository,  "git@github.com:scottmotte/spitfiresky.com.git"
set :branch, "master"
set :deploy_via, :remote_cache

# =============================================================================
# SSH OPTIONS
# =============================================================================
default_run_options[:pty] = true
ssh_options[:paranoid] = false
ssh_options[:keys] = %w(/Users/scottmotte/.ssh/id_rsa)
ssh_options[:port] = 1985
 
# =============================================================================
# RAKE TASKS & OTHER SERVER TASKS
# =============================================================================


namespace :deploy do
  # override Rails related callbacks
  task :finalize_update do
  end
 
  task :migrate do
  end
  
  desc 'restart app'
  task :restart do
  end
  
  desc 'Restart apache'
  task :restart_apache, :roles => :web do
    sudo '/etc/init.d/apache2 restart'
  end
  
  desc "Create symlink to public_html/#{domain}/public"
  task :symlinkify do
    run "rm -rf /home/scottmotte/public_html/spitfiresky.com/public; ln -s #{current_path}/output/ /home/scottmotte/public_html/spitfiresky.com/public"
  end
end
 
after "deploy", "deploy:cleanup"
after "deploy:cleanup", "deploy:symlinkify"
after "deploy:symlinkify", "deploy:restart_apache"