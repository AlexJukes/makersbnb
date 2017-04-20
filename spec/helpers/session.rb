def sign_up
  visit '/'
  expect(page.status_code).to eq(200)
  fill_in :name, with: 'Nigel Foliage'
  fill_in :email, with: 'nigel@foliage.com'
  fill_in :password, with: 'butterkins'
  click_button('Sign up')
end

def sign_in
  visit '/sessions/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: "nigel@foliage.com"
  fill_in :password, with: "butterkins"
  click_button("Log in")
end

def sign_in
  visit '/sessions/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: "nigel@foliage.com"
  fill_in :password, with: "butterkins"
  click_button("Log in")
end

def sign_out
  click_button 'Log out'
end

def sign_up_letter
  visit '/'
  expect(page.status_code).to eq(200)
  fill_in :name, with: 'Suzie Summers'
  fill_in :email, with: 'suzie@summers.com'
  fill_in :password, with: 'buttercup'
  click_button('Sign up')
end

def sign_in_letter
  visit '/sessions/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: "suzie@summers.com"
  fill_in :password, with: "buttercup"
  click_button("Log in")
end

def set_up_owner
  sign_up
  sign_in
  create_manor
end

def set_up_letter
  sign_up_letter
  sign_in_letter
end
