class CardsController < ApplicationController
  def entercard
  	@card = Card.new
  end

  def cardentered
  	@card = Card.find_by(id: session[:card_id])

  end

  def create
  	@card = Card.new(card_params)
    if @card.save
      session[:card_id] = @card.id
      redirect_to cards_cardentered_path 
    else
      flash[:alert] = @card.errors.full_messages
      redirect_to cards_entercard_path
    end
  end

  private
  def card_params
  	params.require(:card).permit(:cardnum, :seccode, :expmonth, :expyear)
  end
end
