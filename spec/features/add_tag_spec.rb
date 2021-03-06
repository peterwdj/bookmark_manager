feature 'Allowing the user to add a tag to a post' do
  scenario 'Adding a tag to a bookmark at the point of creation' do
    visit '/links/new'
    fill_in 'title', with: 'Google'
    fill_in 'url', with: 'https://www.google.co.uk'
    fill_in 'tag', with: 'tools'
    click_button 'Create new bookmark!'
    link = Link.first
    expect(link.tags.map(&:name)).to include('tools')
  end
end
