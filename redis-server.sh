root@48a8606a9160:/# redis-server
26:C 04 Nov 2023 04:02:22.376 # WARNING Memory overcommit must be enabled! Without it, a background save or replication may fail under low memory condition. Being disabled, it can also cause failures without low memory condition
, see https://github.com/jemalloc/jemalloc/issues/1328. To fix this issue add 'vm.overcommit_memory = 1' to /etc/sysctl.conf and then reboot or run the command 'sysctl vm.overcommit_memory=1' for this to take effect.
26:C 04 Nov 2023 04:02:22.376 * oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
26:C 04 Nov 2023 04:02:22.376 * Redis version=7.2.3, bits=64, commit=00000000, modified=0, pid=26, just started
26:C 04 Nov 2023 04:02:22.377 # Warning: no config file specified, using the default config. In order to specify a config file use redis-server /path/to/redis.conf
26:M 04 Nov 2023 04:02:22.377 * monotonic clock: POSIX clock_gettime
                _._
           _.-``__ ''-._
      _.-``    `.  `_.  ''-._           Redis 7.2.3 (00000000/0) 64 bit
  .-`` .-```.  ```\/    _.,_ ''-._
 (    '      ,       .-`  | `,    )     Running in standalone mode
 |`-._`-...-` __...-.``-._|'` _.-'|     Port: 6379
 |    `-._   `._    /     _.-'    |     PID: 26
  `-._    `-._  `-./  _.-'    _.-'
 |`-._`-._    `-.__.-'    _.-'_.-'|
 |    `-._`-._        _.-'_.-'    |           https://redis.io
  `-._    `-._`-.__.-'_.-'    _.-'
 |`-._`-._    `-.__.-'    _.-'_.-'|
 |    `-._`-._        _.-'_.-'    |
  `-._    `-._`-.__.-'_.-'    _.-'
      `-._    `-.__.-'    _.-'
          `-._        _.-'
              `-.__.-'

26:M 04 Nov 2023 04:02:22.378 # Warning: Could not create server TCP listening socket *:6379: bind: Address already in use
26:M 04 Nov 2023 04:02:22.378 # Failed listening on port 6379 (tcp), aborting.
