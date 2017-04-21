def make_request

  visit "/manors/#{Manor.first(name: "Buckingham Palace").id}"
  fill_in 'reservation_arrival_date', with: '08/06/2017'
  click_button 'Request to Book'

end
# 
# def make_request
#
#   visit "/manors/#{Manor.first(name: "Buckingham Palace").id}"
#   fill_in 'reservation_arrival_date', with: '08/06/2017'
#   click_button 'Request to Book'
#
# end
