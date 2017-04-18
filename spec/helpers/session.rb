def sign_up
  visit '/'
  expect(page.status_code).to eq(200)
  fill_in :name, with: 'Nigel Foliage'
  fill_in :email, with: 'nigel@foliage.com'
  fill_in :password, with: 'butterkins'
  click_button('Sign up')
end
