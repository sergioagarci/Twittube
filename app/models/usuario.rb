class Usuario < ActiveRecord::Base
  authenticates_with_sorcery!
  validates_confirmation_of :password, message: " Ambos campos deben coincidir ", if: :password

  validates :username, :presence => true,
  					   :length   => { :maximum => 50 }
  #validates :email, :presence => true
end
