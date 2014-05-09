class User < ActiveRecord::Base
  has_many :microposts
  before_create :create_remember_token

  #callback to convert all :email attributes to lower case before saving
  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, length: { minimum: 6 }

  def self.new_remember_token #can also do def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      #self is an instance of User class
      self.remember_token = User.digest(User.new_remember_token)
    end
end
