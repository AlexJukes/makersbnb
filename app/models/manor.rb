class Manor

  include DataMapper::Resource
    belongs_to :user

  property :id, Serial
  property :name, String
  property :description, Text
  property :price, Float
  property :date_from, Date
  property :date_to, Date

end
