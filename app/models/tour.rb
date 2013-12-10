class Tour < ActiveRecord::Base
	validates :name, uniqueness: { case_sensitive: false }, presence: true

end
