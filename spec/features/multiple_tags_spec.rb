feature 'Multiple tags' do
  scenario 'Allowing a user to add multiple tags to a bookmark' do
    visit '/links/new'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'url', with: 'https://www.makersacademy.com'
    fill_in 'tag', with: 'education coding'
    click_button 'Create new bookmark!'
    link = Link.last
    expect(link.tags.map(&:name)).to include('coding')
    expect(link.tags.map(&:name)).to include('education')
  end
  scenario 'Returning the user to the list of bookmarks' do
    Link.create(url: 'https://www.facebook.com', title: 'Facebook', tags: [Tag.first_or_create(name: 'social')])
    visit '/links/new'
    click_button 'Create new bookmark!'
    expect(page).to have_content 'Facebook'
  end
end
