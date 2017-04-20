class Request

  include DataMapper::Resource

    belongs_to :user
    belongs_to :manor

  property :id, Serial
  property :date_from, Date
  property :manor_id, Integer

end
