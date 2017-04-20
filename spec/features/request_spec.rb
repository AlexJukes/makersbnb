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

  scenario '' do

  end

end
