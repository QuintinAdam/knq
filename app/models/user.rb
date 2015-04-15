class User < ActiveRecord::Base
  include MailForm::Delivery

  enum role: [:guest, :admin]
  has_many :pictures

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attributes :first_name,  validate: true
  attributes :last_name,  validate: true
  attributes :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attributes :phone
  attributes :will_attend
  attributes :street_address
  attributes :city
  attributes :state_region
  attributes :postal_code
  attributes :country
  attributes :birthday
  attributes :message


    def headers
      {
        to: "your.email@your.domain.com",
        subject: "User created an account"
      }
    end
end
