require('rspec')
require('pg')
require('date')
require('list')
require('task')

DB = PG.connect({:dbname => "to_do_test"})

RSpec.configure do |config|
  config.before(:each) do
    DB.exec("DELETE FROM lists *;")
    DB.exec("DELETE FROM tasks *;")
  end
end
