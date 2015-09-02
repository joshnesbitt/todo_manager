require "todo_manager/version"
require 'colorize'

module TodoManager
  autoload :Model, 'todo_manager/model'
  autoload :Database, 'todo_manager/database'
  autoload :Client, 'todo_manager/client'
  autoload :VERSION, 'todo_manager/version'
end
