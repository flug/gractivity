require 'yaml'

class Configuration 

	@@path_file_configuration = "~/.config_gractivity.yml"
	@@stream_file = nil
	attr_accessor :token, :activity
	def initialize
		configuration_file =  File.expand_path @@path_file_configuration
		if File.exist? configuration_file
			@@stream_file = YAML.load_file configuration_file 
			@token =  @@stream_file['configuration']['token']
			@activity = @@stream_file['configuration']['activity']
		else
			puts "don't exist"
		end
	end
	def save (token , activity)
		if not token.empty?  || activity.empty?
			begin

				@prepare = Hash.new
				@prepare['configuration']  =  { 'token' =>  token, 'activity' => activity }

				file = File.open(File.expand_path(@@path_file_configuration) , "w")
				file.write @prepare.to_yaml
				puts "Configuration save"
			rescue IOError => e
				puts  "Error on save you profile configuration" + YAML::dump(e)
			ensure
				file.close unless file == nil
			end
		else
			puts  "you must specify the configuration"
		end

	end
end
