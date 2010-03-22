require 'commands/stories'

module Commands
  class Bugs < Stories

    def type
      "bug"
    end
    
    def plural_type
      "bugs"
    end
    
  end
end

