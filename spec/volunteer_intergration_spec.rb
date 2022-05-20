require 'capybara/rspec'
require './app'
require 'pry'
require 'spec_helper'

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'the volunteer detail page path', {:type => :feature} do
  it 'shows a volunteer detail page' do
    test_project = Project.new({:title => 'Teaching kids to code', :id => nil})
    test_project.save
    project_id = test_project.id.to_i
    test_volunteer = Volunteer.new({:name => 'Z', :project_id => project_id, :id => nil})
    test_volunteer.save
    visit "/projects/#{project_id}"
    expect(page).to have_content('Z')
  end
end

describe 'the volunteer update path', {:type => :feature} do
  it 'allows a user to change the name of the volunteer' do
    test_project = Project.new({:title => 'Teaching kids to code', :id => nil})
    test_project.save
    project_id = test_project.id.to_i
    test_volunteer = Volunteer.new({:name => 'Z', :project_id => project_id, :id => nil})
    test_volunteer.save
    visit "/projects/#{project_id}"
    click_link('Z')
    fill_in('name', :with => 'big mac')
    click_button('Update')
    expect(page).to have_content('big mac')
  end
end

describe 'the volunteer delete path', {:type => :feature} do
  it 'allows a user to delete a volunteer' do
    test_project = Project.new({:title => 'Teaching kids to code', :id => nil})
    test_project.save
    project_id = test_project.id.to_i
    test_volunteer = Volunteer.new({:name => 'Z', :project_id => project_id, :id => nil})
    test_volunteer.save
    volunteer_id = test_volunteer.id.to_i
    visit "/projects/#{project_id}/volunteers/#{volunteer_id}"
    click_button('Delete')
    visit "/projects/#{project_id}"
    expect(page).not_to have_content('Z')
  end
end