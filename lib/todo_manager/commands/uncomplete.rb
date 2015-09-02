module TodoManager
  module Commands
    class Uncomplete < TodoManager::Commands::Base

      def run!
        todo = find(index)

        if todo
          todo.uncomplete!
          database.dump(todos)

          puts "Uncompleted #{index + 1}."
        else
          raise TodoManager::Errors::ModelNotFound, "No model found at index #{index}."
        end
      end

    end
  end
end
