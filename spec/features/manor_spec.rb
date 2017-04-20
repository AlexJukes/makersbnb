require_relative '../helpers/manor'
require_relative '../helpers/session'

feature 'List Manor' do
  scenario 'I want to list a manor with name, description and price' do
    sign_up
    sign_in
    expect {create_manor}.to change(Manor, :count).by(1)
  end

  scenario 'I want a listed manor to be associated to my account' do
    sign_up
    sign_in
    create_manor
    expect(Manor.first(name: "Buckingham Palace").user.name).to eq 'Nigel Foliage'
  end
end

feature 'Listed Manors' do
  scenario 'I want to see all listed manors on ExitBeforeBrexit' do
    sign_up
    sign_in
    create_manor
    expect(page.status_code).to eq(200)
    expect(current_path).to eq '/manors'
    within 'ul#manors' do
    expect(page).to have_content('Buckingham Palace')
    end
  end
end

feature 'View Manor' do
  scenario 'I want to see more details about a manor on a dedicated page' do
    set_up_owner
    # sign_up
    # sign_in
    # create_manor
    click_link(Manor.first(name: "Buckingham Palace").id)
    expect(current_path).to eq "/manors/#{Manor.first(name: "Buckingham Palace").id}"
    expect(page).to have_content('Buckingham Palace')
    expect(page).to have_content('Lovely quaint 50 bedroom home, like new but with a historial touch. Please note: Guards are not included.')
  end
end
