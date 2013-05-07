class AddPasswordDigestToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :password_digest, :string
  end
end

# Para crear una columna como esta.
# rails generate migration add_password_digest_to_users password_digest:string