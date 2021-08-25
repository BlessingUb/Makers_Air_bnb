require './database_connection_setup'
require './lib/db_connection'

class User
  attr_reader :name, :email, :password, :id
  def initialize(id,name,email,password)
    @id = id
    @name = name
    @email = email
    @password = password
  end
  def self.instance
    @user
  end
  def self.create(name, email, password)
    new_user = DBConnection.query(
      "INSERT INTO users(name, email, password)
        VALUES('#{name}', '#{email}', '#{password}')
        RETURNING *;"
      )  
    data = ["user_id", "name", "email", "password"].map{|item| new_user[0][item]}
    @user = User.new(*data)
  end

  def self.authenticate(email, password)
    authenticated_user = DBConnection.query(
      "SELECT * FROM users
       WHERE email='#{email}';"
    )
    data = ["user_id", "name", "email", "password"].map{|item| authenticated_user[0][item]}
    @user = User.new(*data)
  end

end