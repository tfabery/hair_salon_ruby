require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the root path', {type: :feature}) do
  it('views the home page') do
    visit('/')
    expect(page).to have_content("Add a Hair Stylist")
    expect(page).to have_content("Add a Client")
  end

  it('renders the new Hair Stylist form') do
    visit('/')
    click_link("Add a Hair Stylist")
    expect(page).to have_content("Name")
  end
end
