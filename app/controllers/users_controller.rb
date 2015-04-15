class UsersController < ApplicationController

  def rsvp
    @rsvp_email = User.new(rsvp_form_params)
  end

  private

  def rsvp_form_params
    params.require(:contact_form).permit(:name, :email, :message)
  end
end
