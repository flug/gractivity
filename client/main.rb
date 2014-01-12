#!/usr/bin/env shoes

require 'yaml'

Shoes.app :title => "Gractivity",  :width => 300 , :height => 170 ,  :resizable => false  do

	CONFIGURATION_FILE = "~/.config_gractivity.yml"

	KDE = ".kde"
	GNOME = ".gnome"
	stack :margin => 12 do

		flow  do

			@list = list_box :items => ['Gnome', 'KDE']
		end

	end
	stack :margin => 12 , :height => 50  do
		flow  do
			button "Backup" do
			end
			button "Restore", :left => 70  do
			end

		end
	end


end
