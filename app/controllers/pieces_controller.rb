class PiecesController < ApplicationController
	before_action :set_pieces, only: [:index]
  before_action :for_sale, only: [:original]

	def index
  	if params[:search]
    	@pieces = Piece.search(params[:search]).order("featured DESC")
  	else
    	@pieces = Piece.all.order('featured DESC')
    end
  end

  def show

  end

  def original_works

  end

  private
  	def set_pieces
		 @pieces = Piece.all
  	end

    def for_sale
      @pieces = Pieces.where(for_sale: true)
    end
end
