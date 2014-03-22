workers 3
threads 4, 16

#application_path = '/Users/dave.mitchell/projects/freeak'
application_path = '/mnt/freeak'
railsenv = ENV['RAILS_ENV'] || 'development'
directory application_path
environment railsenv
daemonize true
pidfile "#{application_path}//tmp/pids/puma-#{railsenv}.pid"
state_path "#{application_path}//tmp/pids/puma-#{railsenv}.state"
stdout_redirect "#{application_path}/log/puma-#{railsenv}.stdout.log", "#{application_path}/log/puma-#{railsenv}.stderr.log"
#bind "unix://#{application_path}/tmp/sockets/#{railsenv}.socket"
bind "unix:///var/tmp/sockets/#{railsenv}.socket"


#/usr/local/etc/nginx/nginx.conf

preload_app!


