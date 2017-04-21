class Request

  include DataMapper::Resource
    belongs_to :user
    belongs_to :manor


  property :id, Serial
  property :date_from, Date
  property :confirmed, Boolean, :default => false

  def confirmation
    if self.confirmed
      "Confirmed"
    else
      "Not confirmed"
    end
  end

end
