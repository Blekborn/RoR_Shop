class User < ApplicationRecord
  attr_accessor :remember_token
  validates :name, :email, presence: true
  has_secure_password
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  VALID_PASSWORD_REGEX = /\A
  (?=.{8,})
  (?=.*\d)
  (?=.*[a-z])
  (?=.*[[:^alnum:]])
/x.freeze
  validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }, allow_nil: true

  def self.digest(string)
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
