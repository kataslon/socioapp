require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'current_user' do
    let(:user) { User.create email: 'kataslon@yandex.ru', password: '123456' }

    it 'it should define carrent_user' do
      session[:user_id] = user.id
      expect(current_user).to eq user
    end
  end

end
