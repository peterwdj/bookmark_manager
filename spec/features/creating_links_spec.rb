feature 'Allowing the user to add new links' do
  scenario 'Checking the page contains a form to add a new link' do
    visit '/links/new'
    expect(page).to have_field("title")
    expect(page).to have_field("url")
    expect(page).to have_button("Create new bookmark!")
  end
end
