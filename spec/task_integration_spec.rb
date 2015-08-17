require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the task path", {:type => :feature}) do
  it("print out the to do task") do
    visit("/")
    fill_in("description", :with => "do dishes")
    click_button("Add task")
    expect(page).to have_content("The task has been successfully submitted!")
  end
end

describe("the return path", {:type => :feature}) do
  it("can return to the index page") do
    visit("/")
    fill_in("description", :with => "do dishes")
    click_button("Add task")
    click_link('Back')
    expect(page).to have_content("Here are all your tasks")
    expect(page).to have_content("do dishes")
  end
end
