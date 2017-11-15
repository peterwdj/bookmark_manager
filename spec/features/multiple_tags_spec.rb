feature 'Multiple tags' do
  scenario 'After creating a new bookmark, the user is invited to add more tags' do
    visit '/links/new'
    fill_in 'title', with: 'Google'
    fill_in 'url', with: 'https://www.google.co.uk'
    click_button 'Create new bookmark!'
    expect(page).to have_field 'tag'
    expect(page).to have_button 'Add tag'
    expect(page).to have_button 'Back to links'
  end
  scenario 'Allowing a user to add multiple tags to a bookmark' do
    Link.create(url: 'https://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    visit '/links/add_tags'
    fill_in 'tag', with: 'coding'
    click_button 'Add tag'
    link = Link.last
    p link.tags
    expect(link.tags.map(&:name)).to include('coding')
  end
  scenario 'Returning the user to the list of bookmarks' do
    Link.create(url: 'https://www.facebook.com', title: 'Facebook', tags: [Tag.first_or_create(name: 'social')])
    visit '/links/add_tags'
    click_button 'Back to links'
    expect(page).to have_content 'Facebook'
  end
end
