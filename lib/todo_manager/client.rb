module TodoManager
  class Client
    attr_reader :database
    attr_reader :todos

    # TODO: Raise error on Model not found.

    def initialize(database_path = nil)
      @database = database_path ? Database.new(database_path) : Database.new
      @todos = @database.load
    end

    def run!(argv)
      return self.help if argv.empty?

      command = argv.shift
      args = argv.dup

      case command
      when 'list'
        self.list
      when 'add'
        self.add(args.first)
      when 'remove'
        self.remove(args.first.to_i)
      when 'complete'
        self.complete(args.first.to_i)
      when 'uncomplete'
        self.uncomplete(args.first.to_i)
      when 'reset'
        self.reset
      when 'help'
        self.help
      else
        output "Unsupported command: #{command}"
        output ""

        self.help
      end

      database.dump(todos) if persist_data?(command)
    end

    def list
      todos.each_with_index do |todo, index|
        done = todo.completed?
        count = index + 1
        indent = 3 - count.to_s.size

        output [
          "#{count})#{' ' * indent}[#{done ? '-' : ' '}]",
          todo.content.colorize(done ? :green : :red)
        ].join(' ')
      end
    end

    def add(content)
      todos << Model.new(content)
    end

    def remove(index)
      todos.slice!(index - 1)
    end

    def complete(index)
      todo = find(index - 1)
      todo.complete! if todo
    end

    def uncomplete(index)
      todo = find(index - 1)
      todo.uncomplete! if todo
    end

    def reset
      @todos = []
      database.clear
    end

    def help
      output File.read("#{__dir__}/../../help.txt")
    end

  private

    def persist_data?(command)
      %w(
        add
        remove
        complete
        uncomplete
      ).include?(command)
    end

    def find(index)
      todos[index]
    end

    def output(content)
      puts(content)
    end
  end
end
