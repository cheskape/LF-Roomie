class BrowseController < ApplicationController

	$ctr = 0


	def index
		$users = User.where.not(id: current_user.id).all

		if $ctr >= $users.count
			$ctr = 0
		end
		
		$swipes = Swipe.new
		$swipes.user_id = current_user.id
		$user = $users[$ctr].getInfo
	end

	def show
		@matches = current_user.getMatches
	end

	def swipeLeft
		redirect_to browse_index_path
		$swipes.swipeDirection($user.user_id, false)
		current_user.swipes << $swipes
	end

	def swipeRight
		redirect_to browse_index_path
		$swipes.swipeDirection($user.user_id, true)
		current_user.swipes << $swipes
	end



end