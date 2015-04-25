class UsersController < ApplicationController
  respond_to :html, :js

  def rsvp
    unless user = User.find_by_email(params[:user][:email])
      @user = User.invite!(rsvp_form_params) {|u| u.skip_invitation = true }
      # once we get the invite email ready we can send it
      # @user.deliver_invitation
      @response = "Thank you for your RSVP! Get your dancing shoes ready! "
    else
      user.update_attributes(rsvp_form_params)
      user.deliver!
      @response = "We already have a RSVP for #{user.email}. We updated your information. If you have any questions please email us!"
    end
  end

  def new_rsvp
  end

  private

  def rsvp_form_params
    # this allows for the same of to be submitted without losing data if the user does not provide it again
    params[:user].delete_if {|key,value| value.blank?}
    params.require(:user).permit(:email, :first_name, :last_name, :phone, :will_attend, :street_address, :city, :state_region, :postal_code, :country, :birthday, :message)
  end
end
