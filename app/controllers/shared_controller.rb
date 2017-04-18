class SharedController < ApplicationController
	def menu
	  respond_to do |format|
	    format.html
	    format.js
	  end
	end

	def gallery
		@pieces = Piece.all
	end

	def test
	end
end
