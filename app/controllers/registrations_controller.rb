class RegistrationsController < Devise::RegistrationsController
  def create
    super
    flash[:notice] = "Thanks for signing up! Your odds of winning are #{current_user.win_raffle_percentage}%"
  end
end