require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('When using the site to update the database of a hair salon', {:type => :feature}) do
  it('will open the site') do
    visit('/')
    expect(page).to have_content('admin')
  end

  it('will add a stylist') do
    visit('/')
    click_link('admin')
    fill_in('new_stylist_name', :with => 'Genevive')
    click_button('add stylist')
    expect(page).to have_content('Genevive')
  end

  it('will add a new client') do
    visit('/')
    click_link('admin')
    fill_in('new_stylist_name', :with => 'Genevive')
    click_button('add stylist')
    fill_in('new_client_name', :with => 'Mandy')
    click_button('submit')
    expect(page).to have_content('Mandy')
  end

  it('will update a stylist') do
    visit('/')
    click_link('admin')
    fill_in('new_stylist_name', :with => 'Genevive')
    click_button('add stylist')
    fill_in('new_client_name', :with => 'Mandy')
    click_button('submit')
    fill_in('updated_stylist_name', :with => 'Gene')
    click_button('update stylist')
    expect(page).to have_content('Gene')
  end

  it('will update a client') do
    visit('/')
    click_link('admin')
    fill_in('new_stylist_name', :with => 'Genevive')
    click_button('add stylist')
    fill_in('new_client_name', :with => 'Mandy')
    click_button('submit')
    fill_in('updated_client_name', :with => 'Amar')
    click_button('update Mandy')
    expect(page).to have_content('Amar')
  end

  it('will delete a client') do
    visit('/')
    click_link('admin')
    fill_in('new_stylist_name', :with => 'Genevive')
    click_button('add stylist')
    fill_in('new_client_name', :with => 'Mandy')
    click_button('submit')
    click_button('delete client')
    expect(page).to have_no_content('Mandy')
  end

  it('will delete a stylist') do
    visit('/')
    click_link('admin')
    fill_in('new_stylist_name', :with => 'Genevive')
    click_button('add stylist')
    click_button('delete stylist')
    expect(page).to have_no_content('Genevive')
  end

  it("will change a client's stylist") do
    visit('/')
    click_link('admin')
    fill_in('new_stylist_name', :with => 'Genevive')
    click_button('add stylist')
    fill_in('new_stylist_name', :with => 'Randy')
    click_button('add stylist')
    fill_in('new_client_name', :with => 'Bertha')
    click_button('submit')
    fill_in('new_client_name', :with => 'Tyrone')
    select('Randy', :from => 'stylist_id')
    click_button('submit')
    select('Randy', :from => 'stylist_id')
    click_button('update Tyrone')
    expect(page).to have_content('fire')
  end


end
