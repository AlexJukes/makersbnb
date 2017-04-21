feature 'Layout' do
  scenario 'Make sure that the ExitBeforeBrexit banner is on every page' do
    sign_up
    sign_in
    visit '/'
    expect(page).to have_content('ExitBeforeBrexit')
    visit '/manors'
    expect(page).to have_content('ExitBeforeBrexit')
  end

  scenario 'Make sure sign in button is visible if not logged in' do
    visit '/'
    expect(page).to have_button('Log in')
    visit '/manors'
    expect(page).to have_button('Log in')
  end

  scenario 'Make sure manors button is visible if not logged in' do
    visit '/'
    expect(page).to have_button('Manors')
    visit '/manors'
    expect(page).to have_button('Manors')
  end

  scenario 'Make a new manor if signed in' do
    sign_up
    visit '/'
    expect(page).to have_button('List New Manor')
    visit '/manors'
    expect(page).to have_button('List New Manor')
  end

  scenario 'Go to my requests page' do
    sign_up
    visit '/'
    expect(page).to have_button('My Requests')
    visit '/manors'
    expect(page).to have_button('My Requests')
  end
end
