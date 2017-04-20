class Request

  include DataMapper::Resource
    belongs_to :user


  property :id, Serial
  property :date_from, Date


end
