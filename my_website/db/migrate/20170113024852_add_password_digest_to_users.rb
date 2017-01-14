class AddPasswordDigestToUsers < ActiveRecord::Migration[5.0]
  
  def up  

  	remove_column "users", "encrypted_password", "salt"
  	add_column "users", "password_digest", :string
  end
  def down 

  	remove_column "users", "password_digest"
  	add_column "users", "encrypted_password", :string , "salt", :string
  	
  end
end
