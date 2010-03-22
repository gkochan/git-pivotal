require 'commands/base'

module Commands
  class Stories < Base

    def type
      "story"
    end

    def plural_type
      "stories" # move to subclass
    end
  
    def run!
      super

      puts "Retrieving latest #{plural_type} from Pivotal Tracker..."
      api = Pivotal::Api.new(:api_token => options[:api_token])
      project = api.projects.find(:id => options[:project_id])
      
      conditions = { :current_state => :unstarted }
      conditions.merge!({ :story_type => type }) unless type == "story"
      
      stories = project.stories.find(:conditions => conditions)

      if stories.empty?
        puts "No #{plural_type} available!"
        return 0
      end

      puts "There are #{stories.size} #{stories.size > 1 ? plural_type : type } available:"
      puts "-"*60

      stories.each do |story|
        puts "[#{story.id}] #{story.story_type.capitalize}: #{story.name}"
        if options[:full]
          puts "URL: #{story.url}"
          puts "Description: #{story.description}" unless story.description.empty?
          puts "Estimate: #{story.estimate}" if story.estimate.to_i > 1
          puts "Requested by: #{story.requested_by}" unless story.requested_by.empty?
          puts "Owned by: #{story.owned_by}" unless story.owned_by.empty?
          puts "Labels: #{story.labels}" unless story.labels.empty?
          puts "--"
        end
      end

      return 0
    end

  end
end

