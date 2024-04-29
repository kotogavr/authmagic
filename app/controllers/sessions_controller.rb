# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    User.find_or_create_by(email: params[:email])
    # TODO: add mailer to user
    redirect_to login_path, notice: 'Check your email for a link to sign in'
  end

  def verify; end

  def destroy; end
end
