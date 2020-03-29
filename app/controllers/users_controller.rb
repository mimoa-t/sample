class UsersController < ApplicationController
  before_action :set_user
  require "payjp"

  # ユーザー情報変更に関するアクション

  def index
  end

  def identification
  end

  def change_password
  end

  def check_cellphone
  end

  def change_address
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to users_path
    else
      return
    end
  end

  #クレジットカードに関するアクション

  def card
    card = Card.where(user_id: current_user.id).first
    unless card.blank?
      customer = Payjp::Customer.retrieve(card.customer_id)
      @card_information = customer.cards.retrieve(card.card_id)
      @exp_month = @card_information.exp_month.to_s
      @exp_year = @card_information.exp_year.to_s.slice(2,3)
    end
  end

  def register_card
    card = Card.where(user_id: current_user.id)
  end

  def create_card
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    if params['payjpToken'].blank?
      return
    else
      customer = Payjp::Customer.create(
        description: 'test',
        email: current_user.email,
        card: params['payjpToken']
      )
    end
    @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
    if @card.save
      redirect_to card_users_path
      flash.now[:notice] = 'クレジットカードを登録しました'
    else
      return
    end
  end

  def delete_card
    card = Card.where(user_id: current_user.id).first
    if card.present?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
      redirect_to card_users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :nickname,
      :cellphone,
      :familyname,
      :firstname,
      :familyname_kana,
      :firstname_kana,
      :birthday,
      :phone,
      :profile,
      address_attributes: [:id, :postcode, :prefecture, :municipality, :address, :building],
      card_attributes: [:id, :card_number, :expiration_month, :expiration_year, :security_code]
    )
  end

  def set_user
    @address = Address.find_by(user_id: current_user.id)
    @card = Card.find_by(user_id: current_user.id)
  end
end
