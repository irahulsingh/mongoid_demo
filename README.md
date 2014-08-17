A demo Rails4 + Ruby2 + Mongoid application.

create a new rails app 

```
rails new mongoid_demo -O
```

-O is important. it will skip default active record support.

you can also create using 

```
rails new mongoid_demo --skip-active-record
```

for more options of rails new command type ***rails new --help***

add gem 

```
'mongoid', git: 'https://github.com/mongoid/mongoid.git'
```

in your gemfile

do bundle 

now generate mongoid config file with 

```
rails g mongoid:config
```

this file acts same as database.yml.

Open this file and add production config

```
production:
  sessions:
    default:
      uri: <%= ENV['MONGOHQ_URL'] %>
      options:
        consistency: :strong
        max_retries: 1
        retry_interval: 0
```

Scaffold out the project and task values:

```
rails g scaffold Project name:String status:String
rails g scaffold Task name:String status:String
```


Add proper association to app/models/task.rb:

```
class Task
  include Mongoid::Document
  field :name, type: String
  field :status, type: String
 
  belongs_to :project
end
```

Add proper association to app/models/project.rb

```
class Project
  include Mongoid::Document
  field :name, type: String
  field :status, type: String
 
  has_many :tasks
end
```