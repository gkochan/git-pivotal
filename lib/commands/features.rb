require 'commands/list'

module Commands
  class Features < List

    def type
      "feature"
    end
    
    def plural_type
      "features"
    end
    
  end
end

