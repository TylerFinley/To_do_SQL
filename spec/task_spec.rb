require('rspec')
require('task')

describe(Task) do

  before() do
    Task.clear()
  end

  # instance methods
  describe('#description') do
    it("lets you give it a description") do
      test_task = Task.new("walk the dog")
      expect(test_task.description()).to(eq("walk the dog"))
    end
  end

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Task.new("walk the dog")
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  # class methods
  describe(".all") do
    it("is empty at first") do
      expect(Task.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved tasks") do
      Task.new("wash the lion").save()
      Task.clear()
      expect(Task.all()).to(eq([]))
    end
  end

end
