require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the add word path', {:type => :feature}) do
  it('adds a word to the list') do
    visit('/')
    fill_in('word', :with => 'dog')
    click_button('Add Contact')
    expect(page).to have_content('dog')
  end

  it('brings user to word-specific page') do
    visit('/')
    fill_in('first_name', :with => 'dog')
    click_button('Add Word')
    click_link('dog')
    expect(page).to have_content('dog')
  end

  it('adds a definition to word') do
    visit('/')
    fill_in('first_name', :with => 'dog')
    click_button('Add definition')
    click_link('Nancy Pelosi')
    expect(page).to have_content('animal')
  end
end
