class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only:[:landing]

  def landing
  end

  def dashboard
  end
end
