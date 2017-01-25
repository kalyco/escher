class Piece < ActiveRecord::Base
	has_many :tags
	validates_presence_of :title
	validates_presence_of :url
	validates_presence_of :title
	validates_presence_of :title
	validates_presence_of :title

end
