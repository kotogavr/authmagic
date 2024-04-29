class User < ApplicationRecord
  has_many :sessions, dependent: :destroy
  has_many :sign_in_tokens, dependent: :destroy

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
end
