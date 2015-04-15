class UsersController < ApplicationController
  respond_with :html, :js

  def rsvp
    # check if user exists
    unless User.find_by_email(params[:email])
      @rsvp_email = User.invite!(rsvp_form_params, skip_invitation: true)
      if @rsvp_email.valid?
        @rsvp_email.invite!
        # after invite it sends the email to us
        # render thank you message
      else

      end
    else

    end
  end

  private

  def rsvp_form_params
    params.require(:user).permit(:email, :first_name, :last_name, :phone, :will_attend, :street_address, :city, :state_region, :postal_code, :country, :birthday, :message)
  end
end
