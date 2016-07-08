require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the add word path', {:type => :feature})do
  it('navigate to the word form') do
    visit('/')
    click_link('add-word')
    expect(page).to have_content('Add Words')
  end

  it ("processes the user entry of a word and confirms it was sucessfully added") do
    visit('/words/new')
    fill_in('name', :with => 'ginourmous')
    click_button('Add')
    expect(page).to have_content('Success!')
  end
end

describe('the add definition path', {:type => :feature}) do
  it('processes the user definition entry and confirms it was successfully added') do
    visit('/words/:id/definitions/new')
    fill_in('description', :with => 'really big')
    fill_in('partofspeech', :with => 'adjective')
    click_button('Add definition')
    expect(page).to have_content('Success!')
  end
end
