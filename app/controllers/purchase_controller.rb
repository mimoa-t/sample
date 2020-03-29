class PurchaseController < ApplicationController
  require 'payjp'
  before_action :set_product, only: [:index, :purchase, :purchased]
  before_action :set_card, only: [:index, :purchased]
  before_action :set_address, only: [:index, :purchased]

  def index
  end

  def purchase
    if @product.status_id == 1
      card = Card.where(user_id: current_user.id).first
      Payjp.api_key= ENV['PAYJP_SECRET_KEY']
      charge = Payjp::Charge.create(
        amount: @product.price,
        customer: Payjp::Customer.retrieve(card.customer_id),
        currency: 'jpy'
      )
      @product.update( buyer_id: current_user.id )
      @product.update( status_id: 2)
      redirect_to purchased_product_purchase_index_path
    else
      render product_path
    end
  end

  def purchased
  end

  private

  def set_card
    card = Card.where(user_id: current_user.id).first
    if card
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      customer = Payjp::Customer.retrieve(card.customer_id)
      @card = customer.cards.retrieve(card.card_id)
      @exp_month = @card.exp_month.to_s
      @exp_year = @card.exp_year.to_s.slice(2,3)
    end
  end

  def set_address
    @address = current_user.address
    @postcode = @address.postcode.to_s
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
