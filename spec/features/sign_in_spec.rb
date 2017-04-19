require_relative '../helpers/session'

feature 'Sign in' do
  scenario 'I can sign in' do
    sign_up
    sign_in
    expect(current_path).to eq '/manors'
    expect(page).to have_content "Nigel"
  end
end
