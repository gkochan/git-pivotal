require 'commands/list'

module Commands
  class Bugs < List

    def type
      "bug"
    end
    
    def plural_type
      "bugs"
    end
    
  end
end

