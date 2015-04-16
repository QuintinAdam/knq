class User < ActiveRecord::Base
  include MailForm::Delivery

  enum role: [:guest, :admin]
  has_many :pictures

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :email, presence: true
  validates_format_of :email, with: Devise.email_regexp

  attributes :first_name, :last_name, :phone, :will_attend,:street_address, :city, :state_region, :postal_code, :country, :birthday, :message 
  # append :remote_ip, :user_agent
  def headers
    {
      to: "your.email@your.domain.com",
      subject: "#{first_name} #{last_name} RSVP",
      from: %("#{first_name} #{last_name}" <#{email}>)
    }
  end
end


