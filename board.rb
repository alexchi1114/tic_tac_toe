class Board
	attr_accessor :entries
	def initialize	
		@entries = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
	end

	def display_board
		puts " #{@entries[0]} | #{@entries[1]} | #{@entries[2]} "
		puts "-----------"
		puts " #{@entries[3]} | #{@entries[4]} | #{@entries[5]} "
		puts "-----------"
		puts " #{@entries[6]} | #{@entries[7]} | #{@entries[8]} "
	end

	def modify_board(player, location)
		@entries[location]=player.token
	end
end

