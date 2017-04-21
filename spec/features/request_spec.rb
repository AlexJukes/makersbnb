require_relative '../helpers/manor'
require_relative '../helpers/session'
require_relative '../helpers/request'

feature 'Request manor' do

  scenario 'I want to select a night to request a manor' do
    set_up_owner
    sign_out
    set_up_letter
    expect { make_request }.to change(Request, :count).by(1)
  end

  scenario 'I want to see the requests that I have made' do
    set_up_owner
    sign_out
    set_up_letter
    make_request
    
    expect(current_path).to eq '/requests'
    expect(page).to have_content ('Buckingham Palace')
    expect(page).to have_content ('2017-06-08')
  end


end
