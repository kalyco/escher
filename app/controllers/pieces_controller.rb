class PiecesController < ApplicationController
	before_action :set_pieces, only: [:index ]

	def index
  	if params[:search]
    	@pieces = Piece.search(params[:search]).order("featured DESC")
  	else
    	@pieces = Piece.all.order('featured DESC')
    end
  end

  private
  	def set_pieces
		 @pieces = Piece.all
  	end
end
