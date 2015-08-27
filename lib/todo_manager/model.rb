module TodoManager
  class Model
    attr_reader :content

    def initialize(content)
      @completed = false
      @content = content
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
