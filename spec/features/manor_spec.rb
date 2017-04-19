require_relative '../helpers/manor'

feature 'List Manor' do
  scenario 'I want to list a manor with name, description and price' do
    sign_up
    expect {create_manor}.to change(Manor, :count).by(1)
  end
end
