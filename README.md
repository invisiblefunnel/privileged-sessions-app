# PrivilegedSessions

This is an experiment in implementing privileged (sudo mode) sessions on top of Devise, inspired by [GitHub's approach to modeling user sessions](https://github.com/blog/1661-modeling-your-app-s-user-session). Devise handles standard session management, and privileged session records only get created when an already authenticated user enables privileged mode. A privileged session can be manually revoked by its owner.

## Development

```console
$ git clone https://github.com/invisiblefunnel/privileged-sessions-app.git
$ cd privileged-sessions-app
$ bundle install
$ rake setup test
$ rails server
```
