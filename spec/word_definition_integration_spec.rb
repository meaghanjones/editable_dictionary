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
end

#   it ("processes the user entry and confirms it was sucessfully added") do
#     visit('/dealerships/new')
#     fill_in('name', :with => 'Bobs used cars')
#     click_button('Add')
#     expect(page).to have_content('Success!')
#   end
# end
#
# describe('the add vehicle path', {:type => :feature}) do
#   it('processes the user vehicle entry and confirms it was successfully added') do
#     visit('/dealerships/:id/vehicles/new')
#     fill_in('make', :with => 'Mazda')
#     fill_in('model', :with => 'Protege')
#     fill_in('year', :with => '2001')
#     click_button('Add')
#     expect(page).to have_content('Success')
#   end
# end
