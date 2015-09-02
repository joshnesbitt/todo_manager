module TodoManager
  module Commands
    class Base
      class << self

        def run!(options = {})
          self.new(options).run!
        end

      end

      attr_reader :options

      def initialize(options = {})
        @options = options
      end

      def run!
        raise NotImplementedError
      end

    private

      def todos
        options.fetch(:todos)
      end

      def database
        options.fetch(:database)
      end

      def index
        options.fetch(:index, 0) - 1
      end

      def find(index)
        todos[index]
      end
    end
  end
end
