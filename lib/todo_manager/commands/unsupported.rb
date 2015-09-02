module TodoManager
  module Commands
    class Unsupported < TodoManager::Commands::Base

      def run!
        puts "Unsupported command: #{options[:command]}"
        puts ""

        Help.run!
      end

    end
  end
end
