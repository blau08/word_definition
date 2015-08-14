require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the add word path', {:type => :feature}) do
  it('adds a word to the list') do
    visit('/')
    fill_in('word', :with => 'dog')
    click_button('Add Word')
    expect(page).to have_content('dog')
  end

  it('adds a definition to word') do
    visit('/new_word')
    fill_in('definition', :with => 'animal')
    click_button('Add Definition')
    expect(page).to have_content('animal')
  end
end
