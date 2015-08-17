require('rspec')
require('pg')
require('task')

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM tasks *;")
  end
end

describe(Task) do

  # instance methods
  describe('#description') do
    it("lets you give it a description") do
      test_task = Task.new({:description =>"walk the dog"})
      expect(test_task.description()).to(eq("walk the dog"))
    end
  end

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Task.new({:description => 'learn SQL'})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe('#==') do
    it('returns true if theyre both tasks and have the same description')do
      test_task1 = Task.new({:description => 'kitten'})
      test_task2 = Task.new({:description => 'kitten'})
      expect(test_task1).to(eq(test_task2))
    end
    it('returns false if descriptions are different') do
      test_task1 = Task.new({:description => 'kitten'})
      test_task2 = Task.new({:description =>'kittens'})
      expect(test_task1).to_not(eq(test_task2))
    end
  end

  # class methods
  describe(".all") do
    it("is empty at first") do
      expect(Task.all()).to(eq([]))
    end
  end
end
