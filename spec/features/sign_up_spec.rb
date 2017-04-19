require_relative '../helpers/session'

feature 'Sign up' do
  scenario 'I can sign up' do
    expect {sign_up}.to change(User, :count).by(1)
  end

  scenario 'I am automatically signed in after signing up' do
    sign_up
    expect(current_path).to eq '/manors'
  end

  scenario 'fails when entering a duplicate email' do
    sign_up
    click_button('Log out')
    sign_up
    # expect(current_path).to eq '/'
    expect(page).to have_content 'Email is already taken'
  end
end
