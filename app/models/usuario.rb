class Usuario < ActiveRecord::Base
  authenticates_with_sorcery!
  validates_confirmation_of :password, message: " Ambos campos deben coincidir ", if: :password

   email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username, :presence => true,
  					   :length   => { :maximum => 50 }
  validates :email,   :presence => true,
     				  :format  => { :with => email_regex },
     				  :uniqueness => true
end
