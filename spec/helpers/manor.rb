def create_manor
  visit '/manors/new'
  expect(page.status_code).to eq(200)
  fill_in :name, with: 'Buckingham Palace'
  fill_in :description, with: 'Lovely quaint 50 bedroom home, like new but with a historial touch. Please note: Guards are not included.'
  fill_in :price, with: '1.99'
  fill_in :dateFrom, with: '08/06/2017'
  fill_in :dateTo, with: '28/03/2019'
  click_button('Flog it')
end
