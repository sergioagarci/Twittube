# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :usuario do |user|
  user.username              "Noel Diaz"
  user.email                 "noeldiaz@example.com"
  user.password              "password"
  user.password_confirmation "password"
end