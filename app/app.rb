ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'data_mapper_setup'

require_relative 'server'
require_relative 'controllers/users'
<<<<<<< HEAD
require_relative 'controllers/sessions'
=======
require_relative 'controllers/manors'
>>>>>>> master
# require_relative 'controllers/peeps'
# require_relative 'controllers/tags'
