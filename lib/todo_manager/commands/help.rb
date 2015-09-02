module TodoManager
  module Commands
    class Help < TodoManager::Commands::Base

      def run!
        puts File.read("#{__dir__}/../../../help.txt")
      end

    end
  end
end
