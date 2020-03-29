require 'rails_helper'

RSpec.describe PurchaseController, type: :controller do
  let(:user) { create(:user) }
  let(:card) { create(:card, user_id: user.id) }

  describe "GET #index" do
    before do
      login user
    end
    it "returns http success" do
      allow(Payjp::Customer).to receive(:create).and_return(PayjpMock.prepare_customer_information)
      product = create(:product)
      get :index
      expect(response).to have_http_status(:success)
    end

    it "render to index template" do
      allow(Payjp::Customer).to receive(:create).and_return(PayjpMock.prepare_customer_information)
      product = create(:product)
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #purchased" do
    before do
      login user
    end
    it "returns http success" do
      get :purchased
      expect(response).to have_http_status(:success)
    end
  end

end
