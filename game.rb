require_relative 'board'
require_relative 'player'
require_relative 'computer'
include Computer

win_array=[[0,1,2], [0,4,8], [0,3,6], [1,4,7], [2,5,8], [2,4,6], [3,4,5], [6,7,8]]

puts "Welcome to Alex Chi's Tic-Tac-Toe game!"
puts "Would you like to play against a computer or another human?"
puts "(submit 'computer' for computer or 'human' for human)"
mode=gets.chomp
while (mode!="human"&&mode!="computer")
	puts "Invalid response: Please enter either 'computer' or 'human'."
	mode=gets.chomp
end
if mode=="human"
	puts "Please enter a name for player 1:"
	p1=Player.new(gets.chomp, "X", [])
	puts "Please enter a name for player 2:"
	p2=Player.new(gets.chomp, "O",[])

	board=Board.new
	move_number=1
	win=false
	while win==false
		if move_number%2==1
			current_player=p1
		else 
			current_player=p2
		end
		board.display_board
		puts "#{current_player.name}'s turn: Where would you like to place your token (number must be between 0 and 8)?"
		location=gets.chomp.to_i
		while (0..8).to_a.include?(location)==false
			puts "Invalid response: Please submit a number between 0 and 8."
			location=gets.chomp.to_i
		end
		while board.entries[location]!=" "
			puts "That spot is already taken!"
			puts "#{current_player.name}'s turn: Where would you like to place your token (number must be between 0 and 8)?"
			location=gets.chomp.to_i
		end
		current_player.history << location
		board.modify_board(current_player, location)
		win_array.each do |element|
			if (current_player.history&element).sort==element
				win=true
			end
		end
		if win==true
			puts "#{current_player.name} wins the game!"
			board.display_board
		elsif move_number==9
			puts "It's a draw folks!"
			win=true
			board.display_board
		else
			move_number+=1
		end
	end

elsif mode=="computer"
	puts "Please enter your name:"
	p1=Player.new(gets.chomp, "X", [])
	p2=Player.new("HAL 9000", "O",[])
	board=Board.new
	move_number=1
	win=false
	while win==false
		if move_number%2==1
			current_player=p1
			if move_number==1
				board.display_board
			end
			puts "#{current_player.name}'s turn: Where would you like to place your token (number must be between 0 and 8)?"
			location=gets.chomp.to_i
			while (0..8).to_a.include?(location)==false
				puts "Invalid response: Please submit a number between 0 and 8."
				location=gets.chomp.to_i
			end
			while board.entries[location]!=" "
				puts "That spot is already taken!"
				puts "#{current_player.name}'s turn: Where would you like to place your token (number must be between 0 and 8)?"
				location=gets.chomp.to_i
			end
			current_player.history << location
			board.modify_board(current_player, location)
			win_array.each do |element|
				if (current_player.history&element).sort==element
					win=true
				end
			end
			if win==true
				puts "#{current_player.name} wins the game!"
				board.display_board
			elsif move_number==9
				puts "It's a draw folks!"
				win=true
				board.display_board
			else
				move_number+=1
				board.display_board
			end
		else
			current_player=p2
			location=Computer.optimal(p1.history,p2.history)
			current_player.history << location
			board.modify_board(current_player, location)
			win_array.each do |element|
				if (current_player.history&element).sort==element
					win=true
				end
			end
			if win==true
				puts "#{current_player.name} wins the game!"
				board.display_board
			elsif move_number==9
				puts "It's a draw folks!"
				win=true
				board.display_board
			else
				move_number+=1
				puts "HAL 9000's move:"
				board.display_board
			end
		end
	end
else 
	
end
















