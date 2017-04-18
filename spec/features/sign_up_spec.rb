require_relative '../helpers/session'

feature 'Sign up' do
  scenario 'I can sign up' do
    expect {sign_up}.to change(User, :count).by(1)
  end
end
