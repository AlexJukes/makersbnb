require_relative '../helpers/manor'
require_relative '../helpers/session'

feature 'List Manor' do
  scenario 'I want to list a manor with name, description and price' do
    sign_up
    sign_in
    expect {create_manor}.to change(Manor, :count).by(1)
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
