require 'commands/base'

module Commands
  class List < Base

    def type
      "story" # move to subclass
    end

    def plural_type
      "stories" # move to subclass
    end
  
    def run!
      super
      
      puts "Retrieving latest #{plural_type} from Pivotal Tracker..."
      api = Pivotal::Api.new(:api_token => options[:api_token])
      project = api.projects.find(:id => options[:project_id])
      
      #puts project.inspect
      #stories = project.stories.find(:conditions => { :story_type => type, :current_state => :unstarted })

      #puts stories.inspect

    end

  end
end

