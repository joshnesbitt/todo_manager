module TodoManager
  class Model
    attr_reader :name
    attr_reader :completed

    def initialize(name)
      @completed = false
      @name = name
    end

    def completed?
      @completed
    end

    def complete!
      @completed = true
    end

    def uncomplete!
      @completed = false
    end
  end
end
