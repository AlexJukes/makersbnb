require_relative '../helpers/session'

feature 'Sign out' do
  scenario 'User signs out' do
    sign_up
    sign_in
    click_button 'Log Out'
    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content "Goodbye"
  end
end
