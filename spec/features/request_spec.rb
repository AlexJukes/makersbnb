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


  scenario 'request fails if user not signed in' do
    set_up_owner
    sign_out
    visit "/manors/#{Manor.first(name: "Buckingham Palace").id}"
    make_request
    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content 'You must be logged in to request a manor'

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

  scenario 'I want to see requests for my manors' do
    set_up_owner
    sign_out #Owner signs out

    set_up_letter
    make_request
    sign_out  #Letter signs out

    sign_in #Owner signs back in
    visit '/requests'
    expect(page).to have_content('Buckingham Palace')
    expect(page).to have_content('2017-06-08')
  end

  scenario 'I want to see details about an individual request for my manor' do
    set_up_owner
    sign_out # Owner signs out

    set_up_letter
    make_request
    sign_out

    sign_in # Owner signs back in
    visit '/requests'
    click_link "#{Request.first.id}"
    expect(current_path).to eq "/requests/#{Request.first.id}"
    expect(page).to have_content "Suzie Summers"
    expect(page).to have_content "suzie@summers.com"
    expect(page).to have_content "2017-06-08"
  end


end
