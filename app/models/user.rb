require 'bcrypt'

class User
  include DataMapper::Resource
    has n, :manors

  property :id, Serial
  property :name, String
  property :email, String, :required => true, :format => :email_address, unique: true
  property :password_digest, Text

  # attr_reader :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
