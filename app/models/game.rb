class Game
	
	def initialize(players)
		array_players = []
		array_scores = []
		players.each do |player|
			array_players << player
			array_scores << []
		end
		cookie[:scores] = array_scores
		cookie[:players] = array_players
		cookie[:game] = 0
	end
	
	def add_scores(new_scores)
		return if new_scores.count == player_list.count
		new_scores.each do |new_score|
			add_score(new_score[:player], new_score[:value]
		end
		increment_game
	end
	
	def remove_previous_scores
		player_list.each do |player|
			id = id_player(player)
			cookie[:scores][id].pop
		end
		decrement_game
	end

	def current_leading
		array = total_score_of_all
		array.index(array.max) 		
	end
	
	def total_score_of_all
		array_current = []
		player_list.each do |player|
			id = id_player(player)
			array_current = total_score_of_player(player) 
		end
		array_current
	end

	def total_score_of_player(player)
		get_all_scores_of_player(player).inject(:+)
	end

	def all_scores_of_player(player)
		id = id_player(player)
		cookie[:scores][id]
	end

	def player_list
		cookie[:players]
	end
	
	def no_of_game
		cookie[:game]
	end

	private

	def add_score(user, new_value)
		id = id_player(user)
		cookie[:scores][id] << new_value
	end	

	def player_id(user)
		cookie[:players].index(user)
	end

	def decrement_game
		cookie[:game] = cookie[:game] - 1
	end

	def increment_game
		cookie[:game] = cookie[:game] + 1
	end
end
