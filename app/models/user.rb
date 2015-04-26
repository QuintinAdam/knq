class User < ActiveRecord::Base
  include MailForm::Delivery
  enum role: [:guest, :admin]
  has_many :pictures

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :email, presence: true
  validates_format_of :email, with: Devise.email_regexp

  attributes :email,
             :first_name,
             :last_name,
             :phone,
             :will_attend,
             :street_address,
             :city,
             :state_region,
             :postal_code,
             :country,
             :birthday,
             :message,
             :guests
  # append :remote_ip, :user_agent
  def headers
    {
      to: ENV["GMAIL_USERNAME"],
      subject: "#{first_name} #{last_name} RSVP",
      from: %("#{first_name} #{last_name}" <#{email}>)
    }
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default("")
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  role                   :integer          default(0), not null
#  created_at             :datetime
#  updated_at             :datetime
#  invitation_token       :string
#  invitation_created_at  :datetime
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_id          :integer
#  invited_by_type        :string
#  invitations_count      :integer          default(0)
#  first_name             :string
#  last_name              :string
#  phone                  :string
#  will_attend            :boolean
#  street_address         :string
#  city                   :string
#  state_region           :string
#  postal_code            :string
#  country                :string
#  birthday               :date
#  message                :text
#
