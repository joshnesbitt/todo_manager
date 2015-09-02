module TodoManager
  module Commands
    class Remove < TodoManager::Commands::Base

      def run!
        todo = find(index)

        if todo
          todos.delete(todo)
          database.dump(todos)

          puts "Removed #{index + 1}."
        else
          raise TodoManager::Errors::ModelNotFound, "No model found at index #{index}."
        end
      end

    end
  end
end
