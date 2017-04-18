class Tag < ActiveRecord::Base
	has_and_belongs_to_many :pieces
	validates_presence_of :label

end
