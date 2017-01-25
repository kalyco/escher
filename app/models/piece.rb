class Piece < ActiveRecord::Base
	has_many :tags
	validates_presence_of :title
	validates_presence_of :url

	def self.search(search)
	  where("title LIKE ?", "%#{search}%") 
	  where("description LIKE ?", "%#{search}%")
	end
end
