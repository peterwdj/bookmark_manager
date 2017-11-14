feature 'Allowing the user to add new links' do
  scenario 'Checking the page contains a form to add a new link' do
    visit '/links/new'
    expect(page).to have_field("title")
    expect(page).to have_field("url")
    expect(page).to have_button("Create new bookmark!")
  end

  scenario 'When a new link is added see new link in list' do
    visit '/links/new'
    fill_in('title', with: 'Facebook')
    fill_in('url', with: 'https://www.facebook.com')
    click_button('Create new bookmark!')
    expect(page).to have_content 'Title: Facebook'
    expect(page).to have_content 'url: https://www.facebook.com'
  end
end
