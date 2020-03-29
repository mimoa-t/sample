require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  # describe 'GET #index' do
  #   it 'populates an array of products ordered by created_at DESC' do
  #     products = create_list(:product, 3)
  #     get :index
  #     expect(assigns(:products)).to match(products.sort{ |a, b| b.created_at <=> a.created_at })
  #   end

  #   it "responds successfully" do
  #     get :index
  #     expect(response).to be_success
  #   end
  describe 'DELETE #destroy' do
    before do
      login user
    end
    it 'responds successfully' do
      get :destroy
      expect(response).to be_success
    end
  end 
  end
end
