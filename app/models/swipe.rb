class Swipe < ApplicationRecord
  belongs_to :user


	def swipeDirection(id, drt)
		self.swipee = id
		self.direction = drt
	end

end
