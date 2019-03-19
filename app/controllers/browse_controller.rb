class BrowseController < ApplicationController
	def index
	end

	$ctr = 0
	def show
		if $ctr >= $users.count
			$ctr = 0
		end

		$users = User.where.not(id: current_user.id).all
		@user = $users[$ctr].getInfo

	end
end
