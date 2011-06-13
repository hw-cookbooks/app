Description
===========

A collection of [Heavy Water Software Inc's](http://hw-ops.com)
evolving opinions on best practises for configuring and integrating a
Rails application.

Requirements
============

A Rails application code repository that is configured to manage gem
dependencies via Bundler.

Attributes
==========

* `node["app"]["repository"] ` - Code to deploy (defaults to an
  example Rails 3.1 app)
* `node["db"]["adapter"]` - Database such as postgresql, mysql, or
  sqlite3 (default)


Usage
=====

Include "recipe[app::deploy]" in a run list to install an example
Rails 3.1 application backed by a SQLite3 database.

If you're cloning a private repository add a deploy key at
app/files/default/deploy_key_id_rsa

A more practical case might be to create an "app" role:

```ruby
name "app"
description "My Rails app"

run_list [ "role[base]",
           "recipe[postgresql::server]",
           "recipe[app::deploy]" ]

default_attributes( "app" => {
                      "repository" => "git@github.com:me/myapp.git",
                      "use_deploy_key" => true },
                    "db" => {
                      "adapter" => "postgresql" } )
```
