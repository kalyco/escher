class PiecesController < ApplicationController
	before_action :set_pieces, only: [:index]
  before_action :set_piece, only: [:show]
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

  def lithographs_and_mezzotints
    if params[:search]
      @pieces = Piece.search(params[:search]).order("featured DESC")
    else
      @pieces = Piece.all.where(category: ("mezzotint" || "lithograph")).order('featured DESC')
    end
  end

  def woodcuts
    if params[:search]
      @pieces = Piece.search(params[:search]).order("featured DESC")
    else
      @pieces = Piece.all.where(category: ("woodcut")).order('featured DESC')
    end
  end

  def watercolors
    if params[:search]
      @pieces = Piece.search(params[:search]).order("featured DESC")
    else
      @pieces = Piece.all.where(category: ("watercolors")).order('featured DESC')
    end
  end

  private
  	def set_pieces
		 @pieces = Piece.all
  	end

    def set_piece
     # @piece = Piece.find(params[:id])
    end

    def for_sale
      @pieces = Pieces.where(for_sale: true)
    end

    def piece_params
      params.require(:pieces).permit(:id, :title, :description, :url, :for_sale, :available, :description, :category, :price)
    end
end
