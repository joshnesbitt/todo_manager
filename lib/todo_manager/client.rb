module TodoManager
  class Client
    attr_reader :database
    attr_reader :todos

    # TODO: Move @todos and @database into a single object.

    def initialize(database_path = "#{ENV['HOME']}/.todo_manager")
      @database = Database.new(database_path)
      @todos = @database.load
    end

    def run!(argv)
      return self.help if argv.empty?

      command = argv.shift
      args = argv.dup

      case command
      when 'list'
        Commands::List.run!(command_options)
      when 'add'
        Commands::Add.run!(command_options.merge(content: args.first))
      when 'remove'
        Commands::Remove.run!(command_options.merge(index: args.first.to_i))
      when 'complete'
        Commands::Complete.run!(command_options.merge(index: args.first.to_i))
      when 'uncomplete'
        Commands::Uncomplete.run!(command_options.merge(index: args.first.to_i))
      when 'reset'
        Commands::Reset.run!(command_options)
      when 'help'
        Commands::Help.run!
      else
        Commands::Unsupported.run!(command_options.merge(command: command))
      end
    rescue TodoManager::Errors::ModelNotFound => e
      puts e.message.red
    end

  private

    def command_options
      {
        todos: @todos,
        database: @database
      }
    end
  end
end
