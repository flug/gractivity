#!/usr/bin/env shoes

require 'yaml'

Shoes.app :title => "Gractivity",  :width => 300 , :height => 100,  :resizable => false  do

	CONFIGURATION_FILE = ".config_gractivity.yml"

	stack :margin => 12 do 
		para "Enter you token"
		flow do
			edit_line 
			button "Save"
		end
	end

end

