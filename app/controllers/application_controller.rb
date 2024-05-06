# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate

  private

  def authenticate
    if (session_record = Session.find_by(id: cookies.signed[:session_token]))
      Current.session = session_record
    else
      redirect_to login_path
    end
  end
end
