feature 'seeing a list of links on the homepage' do
  scenario 'listing links' do
    Link.create(name: 'Google', url: 'https://google.com', description: 'Search stuff')
    visit '/'
    within 'ul#links' do
      expect(page).to have_content 'Google'
    end
  end
end
