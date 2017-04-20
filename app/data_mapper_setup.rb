require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/user'
require_relative 'models/manor'
require_relative 'models/request'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/exitbeforebrexit_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
