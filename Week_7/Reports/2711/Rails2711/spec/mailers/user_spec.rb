# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe '#welcome_email' do
    let(:user) { create(:user) }

    it 'sends a welcome email to the user' do
      email = UserMailer.welcome_email(user).deliver_now
      p email
      expect(email.subject).to eq('Welcome to My Awesome Site')
    end
  end
end
