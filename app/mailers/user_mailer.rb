# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def passwordless
    @user = params[:user]
    @signed_id = @user.sign_in_tokens.create.signed_id(expires_in: 1.day)

    mail to: @user.email, subject: 'Your sign in link'
  end
end
