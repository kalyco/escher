class Piece < ActiveRecord::Base
	has_and_belongs_to_many :tags
	validates_presence_of :title
	validates_presence_of :url

	def category_enum
		[['Lithograph'],['Mezzotint'],['Woodcut'],['Woodengraving'],['Watercolor'],['Drawing'],['DVD']]
	end

	def self.search(search)
	  where("title LIKE ?", "%#{search}%") 
	  where("description LIKE ?", "%#{search}%")
	end
end
