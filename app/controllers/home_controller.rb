# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate

  def index; end
end
