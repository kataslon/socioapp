require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe 'welcome_email' do
    let(:user) {  User.create email: 'lucas@email.com', password: '123456' }
    let(:mail) { UserMailer.welcome_email(user).deliver_now }

    it 'renders the subject' do
      expect(mail.subject).to eq('Welcome to My Awesome Site! Your password is 123456')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([user.email])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['kataslon@yandex.ru'])
    end

    it 'assigns email' do
      expect(mail.body.encoded).to match(user.email)
    end
  end
end
