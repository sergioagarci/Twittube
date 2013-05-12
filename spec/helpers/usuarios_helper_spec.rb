require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the UsuariosHelper. For example:
#
 describe UsuariosHelper do
 # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
 end
