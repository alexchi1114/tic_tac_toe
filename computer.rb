module Computer
require_relative "board"


def optimal(player_history, computer_history)
	#1: Win if possible
	#2: Block if necessary
	#3: Take the center square if free
	#4: Take a corner square if free
	#5: Take whatever is available
	win_array=[[0,1,2], [0,4,8], [0,3,6], [1,4,7], [2,5,8], [2,4,6], [3,4,5], [6,7,8]]
	win_possible=false
	to_win=0
	need=[]
	win_array.each do |element|
		intersection=element&computer_history
		if intersection.size==2
			need = element-intersection
			if player_history.include?(need[0])==false
				win_possible=true
				to_win=need[0]
			end
		end
	end

	loss_possible=false
	to_block=0
	win_array.each do |element|
		intersection=element&player_history
		if intersection.length==2&&((player_history|computer_history)&element).size<3
			need = element-intersection
			to_block=need[0]
			if computer_history.include?(to_block)==false
				loss_possible=true
			end
		end
	end

	if win_possible==true
		return to_win

	elsif loss_possible==true
		return to_block

	elsif (player_history.sort==[0,8])
		return [1,5].sample
	elsif (player_history.sort==[2,6])
		return [1,3,5,7].sample
	elsif (player_history|computer_history).include?(4)==false
		return 4
	
	elsif ((player_history|computer_history)&[0,2,6,8]).size!=4
		return ([0,2,6,8]-(player_history|computer_history)).sample
		
	else
		remaining=[0,1,2,3,4,5,6,7,8]-(player_history|computer_history)
		return remaining.sample
	end
end
end
