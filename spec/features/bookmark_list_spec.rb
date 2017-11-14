feature 'seeing a list of links on the homepage' do
  scenario 'listing links' do
    Link.create(title: 'Google', url: 'https://google.com')
    visit '/links'
    within 'ul#links' do
      expect(page).to have_content 'Google'
    end
  end
end
