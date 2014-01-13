#!/usr/bin/env shoes
require 'yaml'
require_relative './lib/configuration.rb'
require_relative './lib/zipper.rb'
require 'rubygems'
require 'zip/zip'


Shoes.app :title => "Gractivity",  :width => 300 , :height => 180 ,  :resizable => false  do

	CONFIGURATION_FILE = "~/.config_gractivity.yml"

	KDE = ".kde"
	GNOME = ".gnome"
	configuration  = Configuration.new

	stack :margin => 12 do

		flow  do
			para "Choice you activity"
			@list = list_box :items => ['Gnome', 'KDE']
			activity = configuration.activity
			if not activity.empty?
			end

			flow :top  => 75  do

				para "Enter you token"
				@token  = edit_line
				if not configuration.token.empty?
					@token.text = configuration.token
				end

				button "Save" do
					if not @token.text.empty?  || @list.text.empty?

						if @list.text == 'Gnome'
							activity =  GNOME
						else
							activity = KDE
						end
						configuration.save @token.text, activity
					end
				end
			end

			stack :margin => 12 , :height => 50, :top  => 120   do
				flow  do
					button "Backup" do
						if configuration.exist?
							directory  = File.expand_path '~/'+ activity
							zipfile_name  = '/tmp/'+ activity[1, activity.length] +'.tgz'
							alert "Save end"  if  system('tar cvzf '+zipfile_name  +' '+directory)

						end
					end
					button "Restore", :left => 70  do
					end

				end
			end
		end
	end
end
