module TodoManager
  module Commands
    class List < TodoManager::Commands::Base

      def run!
        options[:todos].each_with_index do |todo, index|
          done = todo.completed?
          count = index + 1
          indent = 3 - count.to_s.size

          puts [
            "#{count})#{' ' * indent}[#{done ? '-' : ' '}]",
            todo.content.colorize(done ? :green : :red)
          ].join(' ')
        end
      end

    end
  end
end
