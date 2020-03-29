require 'rails_helper'

RSpec.describe SignupController, type: :controller do

  describe "get #register_user-info" do
    it "succeed in response" do
      get :register_user_info
      expect(response).to be_successful
    end

    it "return 200 response" do
      get :register_user_info
      expect(response).to have_http_status "200"
    end
  end

  describe "validates_register_user_info" do
    context "valid data" do
      subject {
        user_params = attributes_for(:user)
        post :register_cellphone, params: {user: user_params},
                              session: {
                                nickname: 'test_user',
                                email: 'aaa@gmail',
                                password: 'aaaa0000',
                                password_confirmation: 'aaaa0000',
                              }
      }

      it "return 200 response" do
        subject
        expect(response).to have_http_status "200"
      end

      it "redirect to register_cellphone" do
        subject
        expect(response).to render_template :register_cellphone
      end
    end

    context "invalid data" do
      subject {
        user_params = attributes_for(:user, nickname: '')
        post :register_cellphone, params: {user: user_params},
                              session: {
                              nickname: '',
                              email: 'aaa@gmail',
                              password: 'aaaa0000',
                              password_confirmation: 'aaaa0000'
                              }
      }

      it "return 200 response" do
        subject
        expect(response).to have_http_status "200"
      end

      it "render to register_user_info" do
        subject
        expect(response).to render_template :register_user_info
      end
    end
  end


  describe 'get #register_cellphone' do
    before do
      get :register_cellphone, user: { name: 'sample_user',
                          email: "aaa@gmail.com",
                          password: "aaaa0000",
                          password_confirmation: "aaaa0000" }
    end

    it 'success in response' do
      expect(response).to be_successful
    end

    it 'return 200 response' do
      expect(response).to have_http_status "200"
    end
  end

  describe "validates_register_cellphone" do
    context "valid data" do
      subject {
        user_params = attributes_for(:user)
        post :register_address, params: { user: user_params },
                    session: {
                      nickname: 'test_user',
                      email: 'aaa@gmail.com',
                      password: 'aaaa0000',
                      password_confirmation: 'aaaa0000',
                      cellphone: "08011112222"
                    }
      }

      it "return 200 response" do
        subject
        expect(response).to have_http_status "200"
      end

      it "redirect to register_address" do
        subject
        expect(response).to render_template :register_address
      end
    end

    context "invalid data" do
      subject {
        user_params = attributes_for(:user, cellphone: '')
        post :register_address, params: { user: user_params },
                    session: {
                      nickname: 'test_user',
                      email: 'aaa@gmail.com',
                      password: 'aaaa0000',
                      password_confirmation: 'aaaa0000',
                      cellphone: ''
                    }
      }

      it "return 200 response" do
        subject
        expect(response).to have_http_status "200"
      end

      it "render to register_cellphone" do
        subject
        expect(response).to render_template :register_cellphone
      end
    end
  end

  
  describe 'get #register_address' do
    before do
      get :register_address, user: { name: 'sample_user',
                          email: "aaa@gmail.com",
                          password: "aaaa0000",
                          password_confirmation: "aaaa0000",
                          cellphone: '08011112222'
                        }
    end

    it 'success in response' do
      expect(response).to be_successful
    end

    it 'return 200 response' do
      expect(response).to have_http_status "200"
    end
  end

  describe "validates_register_address" do
    context "valid data" do
      before do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @user = attributes_for(:user)
        session["devise.regist_data"] = {user: @user}
        @address = attributes_for(:address)
        @user = @user.merge(address_attributes: @address)
      end
      subject {
        post :register_card, params: { user: @user },
                     session: {
                          nickname: 'sample_user',
                          email: "aaa@gmail.com",
                          password: "aaaa0000",
                          password_confirmation: "aaaa0000",
                          cellphone: '08011112222',
                          familyname: 'sei',
                          firstname: 'mei',
                          familyname_kana: 'セイ',
                          firstname_kana: 'メイ',
                          birthday: '2000-01-01',
                          postcode: 1112222,
                          prefecture: '東京都',
                          municipality: '渋谷区',
                          address: '1-1'
                         }
      }

      it "return 200 response" do
        subject
        expect(response).to have_http_status "200"
      end

      it "redirect to register_card" do
        subject
        # session[:address_attributes] = FactoryBot.attributes_for( :address )
        expect(response).to render_template :register_card
      end
    end

    context "invalid data" do
      before do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @user = attributes_for(:user)
        session["devise.regist_data"] = {user: @user}
        @address = attributes_for(:address)
        @user = @user.merge(address_attributes: @address)
        @user[:familyname_kana] = nil
      end
      subject {
        post :register_card, params: { user: @user },
                              session: {
                              nickname: 'test_user',
                              email: 'aaa@gmail.com',
                              password: 'aaaa0000',
                              password_confirmation: 'aaaa0000',
                              cellphone: '08011112222',
                              familyname: '',
                              firstname: '',
                              familyname_kana: '',
                              firstname_kana: '',
                              birthday: ''
                              }
      }

      it "return 200 response" do
        subject
        expect(response).to have_http_status "200"
      end

      it "render to register_address" do
        subject
        expect(response).to render_template :register_address
      end
    end
  end


  describe 'get #register_card' do
    before do
      get :register_card, user: { name: 'sample_user',
                          email: "aaa@gmail.com",
                          password: "aaaa0000",
                          password_confirmation: "aaaa0000",
                          cellphone: '08011112222',
                          familyname: 'sei',
                          firstname: 'mei',
                          familyname_kana: 'セイ',
                          firstname_kana: 'メイ',
                          birthday: '2000-01-01',
                          postcode: '1112222',
                          prefecture: '東京都',
                          municipality: '渋谷区',
                          address: '1-1'
                          }
    end

    it 'success in response' do
      expect(response).to be_successful
    end

    it 'return 200 response' do
      expect(response).to have_http_status "200"
    end
  end

  describe "create" do
    context "valid data" do
      before do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @user = attributes_for(:user)
        session["devise.regist_data"] = {user: @user}
        @address = attributes_for(:address)
        @user = @user.merge(address_attributes: @address)
        @card = attributes_for(:card)
        @user = @user.merge(card_attributes: @card)
      end
      subject {
        post :create, params: { user: @user },
                      session: {
                        nickname: 'test_user',
                        email: 'aaa@gmail.com',
                        password: 'aaaa0000',
                        password_confirmation: 'aaaa0000',
                        cellphone: "08011112222",
                        familyname: 'sei',
                        firstname: 'mei',
                        familyname_kana: 'セイ',
                        firstname_kana: 'メイ',
                        birthday: '2000-01-01',
                        address_attributes: @address,
                        postcode: 1112222,
                        prefecture: '東京都',
                        municipality: '渋谷区',
                        address: '1-1',
                        card_number: '1111222233334444',
                        expiration_month: '09',
                        expiration_year: '21',
                        security_code: '111'
                      }
      }

      it "return 200 response" do
        subject
        expect(response).to have_http_status "302"
      end

      it "redirect to complete_registration " do
        subject
        expect(response).to redirect_to complete_registration_signup_index_path
      end
    end

    context "invalid data" do
      before do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        @user = attributes_for(:user)
        session["devise.regist_data"] = {user: @user}
        @address = attributes_for(:address)
        @card = attributes_for(:card)
        @user = @user.merge(address_attributes: @address)
        @user = @user.merge(card_attributes: @card)
      end
      subject {
        post :create, params: {user: @user},
                              session: {
                              nickname: 'test_user',
                              email: 'aaa@gmail.com',
                              password: 'aaaa0000',
                              password_confirmation: 'aaaa0000',
                              cellphone: '08011112222',
                              familyname: 'sei',
                              firstname: 'mei',
                              familyname_kana: 'セイ',
                              firstname_kana: 'メイ',
                              birthday: '2000-01-01',
                              card_number: '',
                              expiration_month: '',
                              expiration_year: '',
                              security_code: ''
                              }
      }

      it "return 200 response" do
        subject
        expect(response).to have_http_status "200"
      end

      it "render to register_card" do
        subject
        expect(response).to render_template :register_card
      end
    end
  end
end