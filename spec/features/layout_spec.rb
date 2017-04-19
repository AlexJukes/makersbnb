feature 'Layout' do
  scenario 'Make sure that the ExitBeforeBrexit banner is on every page' do
    sign_up
    sign_in
    visit '/'
    expect(page).to have_content('ExitBeforeBrexit')
    visit '/manors'
    expect(page).to have_content('ExitBeforeBrexit')
  end
end
