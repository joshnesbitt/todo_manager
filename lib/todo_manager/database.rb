require 'yaml'

module TodoManager
  class Database
    attr_reader :path

    def initialize(path = "#{ENV['HOME']}/.todo_manager")
      @path = path
    end

    def load
      YAML.load(File.read(path)) || []
    rescue Errno::ENOENT
      []
    end

    def dump(collection = [])
      write(collection.to_yaml)
    end

    def clear
      write('')
    end

  private

    def write(content)
      File.open(path, 'w') do |file|
        file.write(content)
      end
    end
  end
end
