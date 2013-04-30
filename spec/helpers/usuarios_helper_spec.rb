require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the UsuariosHelper. For example:
#
# describe UsuariosHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe UsuariosHelper do
   def gravatar_for(user, options = { :size => 50 })
    gravatar_image_tag(user.email.downcase, :alt => h(user.username),
                                            :class => 'gravatar',
                                            :gravatar => options)
  end
end
