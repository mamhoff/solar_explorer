class Booking < ActiveRecord::Base
	belongs_to :captain, class_name: "User"
	belongs_to :guide, class_name: "User"
	belongs_to :boat
	belongs_to :tour
	belongs_to :booking_status
end
