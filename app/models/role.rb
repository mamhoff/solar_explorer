class Role < ActiveRecord::Base
	has_and_belongs_to_many :users
	validates :name, uniqueness: { case_sensitive: false }, presence: true
	before_save { self.name = name.downcase }
end
