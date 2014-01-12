#!/usr/bin/env shoes

require 'yaml'
require_relative './lib/configuration.rb'

Shoes.app :title => "Gractivity",  :width => 300 , :height => 170 ,  :resizable => false  do

	CONFIGURATION_FILE = "~/.config_gractivity.yml"

	KDE = ".kde"
	GNOME = ".gnome"
	configuration  = Configuration.new

	stack :margin => 12 do

		flow  do

			para "Choice you activity"
			@list = list_box :items => ['Gnome', 'KDE']
		end

		flow :top  => 75  do

			para "Enter you token"
			@token  = edit_line
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
			end
			button "Restore", :left => 70  do
			end

		end
	end
end
