# PrivilegedSessions

This project implements the hybrid cookie store/db approach to user sessions along with privileged (sudo mode) sessions [described by GiHub](https://github.com/blog/1661-modeling-your-app-s-user-session).

## Development

```console
$ git clone https://github.com/invisiblefunnel/privileged-sessions.git
$ cd privileged-sessions
$ bundle install
$ rake setup
$ rake test
$ foreman start # navigate to localhost:3000
# Watch the developments logs
$ tail -f log/development.log
```
