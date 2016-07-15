require('capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
# set(:show_exceptions, false)

describe('the root path', {type: :feature}) do
  it('view the home page') do
    visit('/')
    expect(page).to have_content("Add a Hair Stylist")
    expect(page).to have_content("Add a Client")
  end

  it('render the new Hair Stylist form') do
    visit('/')
    click_link("Add a Hair Stylist")
    expect(page).to have_content("Name")
  end

  it('render the new Client form') do
    visit('/')
    click_link("Add a Client")
    expect(page).to have_content("Name")
  end
end

describe('addition path', {type: :feature}) do
  it "add stylist and shows the list of stylists" do
    visit('/stylists/new')
    fill_in('name', :with => 'Test Stylist')
    click_button('Add Stylist')
    expect(page).to have_content('Test Stylist')
  end

  it "add client and shows the list of clients" do
    visit('/clients/new')
    fill_in('name', :with => 'Test Client')
    click_button('Add Client')
    expect(page).to have_content('Test Client')
  end
end

describe('delete path', {type: :feature}) do
  it "delete a client" do
    visit('/clients/new')
    fill_in('name', :with => 'Test Client')
    click_button('Add Client')
    click_button('client_delete')
    expect(page).to have_no_content('Test Client')
  end

  it "delete a client" do
    visit('/stylists/new')
    fill_in('name', :with => 'Test Stylist')
    click_button('Add Stylist')
    click_button('stylist_delete')
    expect(page).to have_no_content('Test stylist')
  end
end

describe('edit path', {type: :feature}) do
  it "edit a client" do
    visit('/clients/new')
    fill_in('name', :with => 'Test Client')
    click_button('Add Client')
    click_link('client_edit')
    fill_in('name', :with => 'Edit Client')
    click_button('Edit')
    expect(page).to have_content('Edit Client')
  end

  it "edit a stylist" do
    visit('/stylists/new')
    fill_in('name', :with => 'Test Stylist')
    click_button('Add Stylist')
    click_link('stylist_edit')
    fill_in('name', :with => 'Edit Stylist')
    click_button('Edit')
    expect(page).to have_content('Edit Stylist')
  end
end

describe('assign path', {type: :feature}) do
  it "assign a stylist to a client" do
    visit('/stylists/new')
    fill_in('name', :with => 'Test Stylist')
    click_button('Add Stylist')
    visit('/clients/new')
    fill_in('name', :with => 'Test Client')
    click_button('Add Client')
    click_link('client_edit')
    select('Test Stylist', :from => 'stylist')
    click_button('Assign')
    expect(page).to have_no_content('Assign')
  end
end
