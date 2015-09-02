module TodoManager
  module Commands
    class Reset < TodoManager::Commands::Base

      def run!
        todos.clear
        database.clear

        puts "Reset database."
      end

    end
  end
end
