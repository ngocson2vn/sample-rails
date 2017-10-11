worker_processes 2

application_path = "/Users/son/git/sample-rails"
current_path = "#{application_path}/current"
shared_path  = "#{application_path}/shared"

#listen File.expand_path('unicorn.sock', "#{application_path}/shared/tmp/sockets")
listen 3000
pid File.expand_path('unicorn.pid', "#{shared_path}/tmp/pids")

stderr_path File.expand_path('unicorn.stderr.log', "#{shared_path}/log")
stdout_path File.expand_path('unicorn.stdout.log', "#{shared_path}/log")

preload_app true

before_fork do |server, worker|
  ENV['BUNDLE_GEMFILE'] = "#{current_path}/Gemfile"
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exist?(old_pid) && server.pid != old_pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      $stderr.puts 'Process already dead'
    end
  end

  sleep 1
end

after_fork do |_server, _worker|
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord::Base)
end
