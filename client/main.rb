#!/usr/bin/env shoes

require 'yaml'

Shoes.app :title => "Gractivity",  :width => 300 , :height => 170 ,  :resizable => false  do

	CONFIGURATION_FILE = "~/.config_gractivity.yml"

	KDE = ".kde"
	GNOME = ".gnome"
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
					begin

						if @list.text == 'Gnome'
							activity =  GNOME
						else
							activity = KDE
						end
						@prepare = Hash.new
						@prepare['configuration']  =  { 'token' =>  @token.text, 'activity' => activity }

						file = File.open(File.expand_path(CONFIGURATION_FILE), "w")
						file.write @prepare.to_yaml
					rescue IOError => e
						alert "Error on save you profile configuration"
					ensure
						file.close unless file == nil
					end
				else
					alert "you must specify the configuration"
				end
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
