set :domain, "readingwhat.com"
set :application, "whos.readingwhat.com"
set :repository,  "/Users/jgailor/.repositories/.git/whos.readingwhat.com"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git

role :app, domain
role :web, domain
role :db,  domain, :primary => true

# Remote username
set :user, "jgailor"

# Restart Phusion Passenger
namespace :deploy do
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
end
