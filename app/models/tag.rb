class Tag < ActiveRecord::Base
	has_many :pieces
	validates_presence_of :piece_id
	validates_presence_of :label

end
