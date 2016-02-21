class User < ActiveRecord::Base

  has_many :events, :foreign_key => "creator_id"

  before_save { self.email = email.downcase }
  before_create :remember
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.digest(User.new_token)
  end
end
