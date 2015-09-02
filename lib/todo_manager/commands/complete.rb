module TodoManager
  module Commands
    class Complete < TodoManager::Commands::Base

      def run!
        todo = find(index)

        if todo
          todo.complete!
          database.dump(todos)

          puts "Completed #{index + 1}."
        else
          raise TodoManager::Errors::ModelNotFound, "No model found at index #{index}."
        end
      end

    end
  end
end
