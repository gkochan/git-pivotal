require 'commands/stories'

module Commands
  class Features < Stories

    def type
      "feature"
    end
    
    def plural_type
      "features"
    end
    
  end
end

