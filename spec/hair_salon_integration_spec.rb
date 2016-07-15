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

  it('renders the new Client form') do
    visit('/')
    click_link("Add a Client")
    expect(page).to have_content("Name")
  end
end

describe('stylist_form path', {type: :feature}) do
  it "add stylist and shows the list of stylists" do
    visit('/stylists/new')
    fill_in('name', :with => 'Test Stylist')
    click_button('Add Stylist')
    expect(page).to have_content('Test Stylist')
  end
end

describe('client_form path', {type: :feature}) do
  it "add client and shows the list of clients" do
    visit('/clients/new')
    fill_in('name', :with => 'Test Client')
    click_button('Add Client')
    expect(page).to have_content('Test Client')
  end
end
