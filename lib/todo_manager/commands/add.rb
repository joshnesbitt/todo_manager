module TodoManager
  module Commands
    class Add < TodoManager::Commands::Base

      def run!
        todo = Model.new(options[:content])
        todos << todo
        database.dump(todos)

        puts "Added #{todos.index(todo)}."
      end

    end
  end
end
