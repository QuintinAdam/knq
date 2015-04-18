class UsersController < ApplicationController
  respond_to :html, :js

  def rsvp
    # check if user exists
    # unless user = User.find_by_email(params[:user][:email])
    #   @rsvp_email = User.invite!(rsvp_form_params) {|u| u.skip_invitation = true }
    #   if @rsvp_email.valid?
    #     @rsvp_email.deliver_invitation
    #   raise "the roof"
    #     # after invite it sends the email to us
    #     # render thank you message
    #   else
    #     @rsvp = @rsvp_email
    #   end
    # else
    #   @response = "We already have a RSVP for #{user.email}. If you need to update your details please sign into your account or email us!"
    # end

    #temp
    unless user = User.find_by_email(params[:user][:email])
      @user = User.invite!(rsvp_form_params) {|u| u.skip_invitation = true }
      @response = "Thank you for your information! You will receive an invitation soon! Get your dancing shoes ready!"
    else
      user.update_attributes(rsvp_form_params)
      user.deliver!
      @response = "We already have a email for #{user.email}. We updated your information. If you have any questions please email us!"
    end
  end

  def new_rsvp
  end

  private

  def rsvp_form_params
    params.require(:user).permit(:email, :first_name, :last_name, :phone, :will_attend, :street_address, :city, :state_region, :postal_code, :country, :birthday, :message)
  end
end
