# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'hothanhdatsd@gmail.com'
  layout 'mailer'
end
