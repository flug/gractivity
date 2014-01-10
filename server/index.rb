#!/usr/bin/env ruby

require "sinatra"
require 'sinatra/assetpack'
require 'yaml'

require 'sass'
require 'coffee-script'

class SassHandler < Sinatra::Base

	set :views, File.dirname(__FILE__)+ '/assets/stylesheets/sass'
	get '/css/*.css' do
		filename = params[:splat].first
		sass filename.to_sym
	end

end
class CoffeeHandler < Sinatra::Base

	set :views, File.dirname(__FILE__)+ '/assets/javascripts/coffee'
	get '/js/*.js' do
		filename = params[:splat].first
		sass filename.to_sym
	end

end
