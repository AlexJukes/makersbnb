def make_request

  visit "/manors/#{Manor.first(name: "Buckingham Palace").id}"
  fill_in 'reservation_arrival_date', with: '2017/06/08'
  click_button 'Request to Book'

end
