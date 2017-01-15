require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe 'current_user' do
    let(:user) { User.create email: 'kataslon@yandex.ru', password: '123456' }

    it 'it should define carrent_user' do
      session[:user_id] = user.id
      expect(current_user).to eq user
    end
  end

end
