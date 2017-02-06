class Player
	attr_accessor :name, :token, :history
	def initialize(name, token, history)
		@name=name
		@token=token
		@history=history
	end
end
