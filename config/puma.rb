workers 4
threads 4, 16

application_path = '/home/davemi/projects/freeak'
railsenv = 'production'
directory application_path
environment railsenv
daemonize true
pidfile "#{application_path}//tmp/pids/puma-#{railsenv}.pid"
state_path "#{application_path}//tmp/pids/puma-#{railsenv}.state"
stdout_redirect "#{application_path}/log/puma-#{railsenv}.stdout.log", "#{application_path}/log/puma-#{railsenv}.stderr.log"
bind "unix:///#{application_path}/tmp/sockets/#{railsenv}.socket"
#bind "tcp://localhost:3000"
