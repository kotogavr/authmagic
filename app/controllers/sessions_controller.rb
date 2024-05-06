# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate, only: %i[new create verify]

  def new; end

  def create
    user = User.find_or_create_by(email: params[:email])
    UserMailer.with(user:).passwordless.deliver_later
    redirect_to login_path, notice: 'Check your email for a link to sign in'
  end

  def verify
    begin
      user = SignInToken.find_signed!(params[:sid]).user
    rescue StandardError
      redirect_to(login_path, alert: 'Invalid or expired token')
      return
    end
    session_record = user.sessions.create!
    cookies.signed.permanent[:session_token] = { value: session_record.id, httponly: true }
    user.sign_in_tokens.delete_all
    redirect_to root_path, notice: 'Successfully signed in'
  end

  def destroy
    # selete curent user session
    # session.delete(:session_token)
  end
end
