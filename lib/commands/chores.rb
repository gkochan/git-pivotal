require 'commands/list'

module Commands
  class Chores < List

    def type
      "chore"
    end
    
    def plural_type
      "chores"
    end
    
  end
end

