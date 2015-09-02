require "todo_manager/version"
require 'colorize'

module TodoManager
  autoload :Model, 'todo_manager/model'
  autoload :Database, 'todo_manager/database'
  autoload :Client, 'todo_manager/client'

  module Commands
    autoload :Base, 'todo_manager/commands/base'
    autoload :Add, 'todo_manager/commands/add'
    autoload :Remove, 'todo_manager/commands/remove'
    autoload :List, 'todo_manager/commands/list'
    autoload :Complete, 'todo_manager/commands/complete'
    autoload :Uncomplete, 'todo_manager/commands/uncomplete'
    autoload :Reset, 'todo_manager/commands/reset'
    autoload :Help, 'todo_manager/commands/help'
    autoload :Unsupported, 'todo_manager/commands/unsupported'
  end

  module Errors
    autoload :Error, 'todo_manager/errors/error'
    autoload :ModelNotFound, 'todo_manager/errors/model_not_found'
  end

  autoload :VERSION, 'todo_manager/version'
end
