# Mirror's Various Administration Tools
A repo of utilities that have saved me time building server infrastructure.

## Weasel Tail
`./weasel_tail "apt update"`

A utility to tail a given command, then hide the output after the command succeeds.
Useful when you have multiple build steps and each step produces a ton of predictable output.
You only need to know the output if it fails. :)

## Weasel
`./weasel build deploy`

A miniature build system compatible with `make`.
It folds output after every command is completed to prevent littering the console.
Useful when you have many many build steps and don't want to see anything but a simple `ok!` at the end of each one.

## Daemonize.sh
`./daemonize.sh server_user ./run-server.sh /app/log/server.log /app/server-input.pipe`

A utility that daemonizes a command to run separately from whatever launched it.
Has arguments for the daemon user (creates the user if he doesn't exist), daemon output, and daemon input.
It uses `keepalive.sh` to respawn the command if it dies.
If you want to use the default user and launch without logging or input, simply run it as such:
`./daemonize.sh ubuntu ./run-server.sh /dev/null /dev/null`

