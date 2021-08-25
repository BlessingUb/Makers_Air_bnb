require './database_connection_setup'
require './lib/db_connection'

class User
  def self.create(name, email, password)
    new_user = DBConnection.query(
      "INSERT INTO users(name, email, password)
        VALUES('#{name}', '#{email}', '#{password}')
        RETURNING *;"
      )

    [:id, :name, :email, :password].zip(new_user.values.flatten).to_h
  end

  def self.authenticate(email, password)
    authenticated_user = DBConnection.query(
      "SELECT * FROM users
       WHERE email='#{email}';"
    )

    [:id, :name, :email, :password].zip(authenticated_user.values.flatten).to_h
  end


end