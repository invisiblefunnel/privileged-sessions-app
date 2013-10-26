# PrivilegedSessions

This is an experiment in implementing privileged (sudo mode) sessions on top of Devise, inspired by [GitHub's approach to modeling user sessions](https://github.com/blog/1661-modeling-your-app-s-user-session).

## Development

```console
$ git clone https://github.com/invisiblefunnel/privileged-sessions-app.git
$ cd privileged-sessions-app
$ bundle install
$ rake setup test
$ rails server
```
