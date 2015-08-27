# Todo Manager

[![Build Status](https://travis-ci.org/joshnesbitt/todo_manager.svg)](https://travis-ci.org/joshnesbitt/todo_manager)


## Introduction

The simplest of Todo Managers. Create, complete and track your todo list all from within your terminal.

```
1) [-] Get milk
2) [ ] Install todo_manager
```


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'todo_manager'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install todo_manager


## Usage

```
todo [command] [args]

  list         List all todos.

               E.g: todo list

  add          Add a todo to the list.

               E.g: todo add "Get milk"

  remove       Remove a todo from the list by index.

               E.g: todo remove 2

  complete     Complete a todo by index.

               E.g: todo complete 2

  uncomplete   Uncomplete a todo by index.

               E.g: todo complete 2

  reset        Reset the todo database.

               E.g: todo reset

  help         Show this screen.

               E.g: todo help

```


## Notes

This gem was written as an example application for the [Ruby bootcamp for Sky](https://github.com/joshnesbitt/ruby-bootcamp).


## Contributing

1. Fork it (https://github.com/joshnesbitt/todo-manager/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
