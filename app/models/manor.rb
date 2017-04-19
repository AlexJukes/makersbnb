class Manor

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text
  property :price, Float
  property :date_from, Date
  property :date_to, Date


end
