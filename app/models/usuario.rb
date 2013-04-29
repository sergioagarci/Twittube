class Usuario < ActiveRecord::Base
  attr_accessor :password
  attr_accesible :username, :email, :password, :password_confirmation
  authenticates_with_sorcery!
  validates_confirmation_of :password, message: " Ambos campos deben coincidir ", if: :password

   email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username, :presence => true,
  					   :length   => { :maximum => 50 }
  validates :email,    :presence => true,
     				   :format  => { :with => email_regex },
     				   :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true,
  					   :confirmation => true,
  					   :length => { within => 6..40 }

  before_save :crypted_password

  def has_password?(submitted_password)
    # Compare encrypted_password with the encrypted version of
    # submitted_password.
  end

  private

    def crypt_password
      self.crypted_password = encrypt(password)
    end

    def crypt(string)
      string # Only a temporary implementation!
    end


end
