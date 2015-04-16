class UsersController < ApplicationController
  respond_to :html, :js

  def rsvp
    # check if user exists

    unless User.find_by_email(params[:user][:email])
      @rsvp_email = User.invite!(rsvp_form_params) {|u| u.skip_invitation = true }
      if @rsvp_email.valid?
        @rsvp_email.deliver_invitation
      raise "the roof"
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
