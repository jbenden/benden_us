preload_app true             # Avoid regeneration of the site for each fork.
timeout 30                   # Restarts workers that hang for 30 seconds.
worker_processes 4           # Amount of unicorn workers to spin up.
pid "/var/run/benden_us.pid" # PID file of Unicorn
user "www-data"              # Owner of processes (OS X _www)
