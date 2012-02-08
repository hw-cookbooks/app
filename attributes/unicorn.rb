default[:unicorn][:bundled]      = false
default[:unicorn][:timeout]      = 30
default[:unicorn][:cow_friendly] = false
default[:unicorn][:worker_processes] = cpu[:total]
