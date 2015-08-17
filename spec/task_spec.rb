require("spec_helper")


describe(Task) do

  # instance methods
  describe('#description') do
    it("lets you give it a description") do
      test_task = Task.new({:description =>"walk the dog", :list_id => 1, :due_date => Date.new(2015,9,18)})
      expect(test_task.description()).to(eq("walk the dog"))
    end
  end

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Task.new({:description => 'learn SQL', :list_id => 1, :due_date => Date.new(2015,9,18)})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe('#==') do
    it('returns true if theyre both tasks and have the same description')do
      test_task1 = Task.new({:description => 'kitten', :list_id => 1, :due_date => Date.new(2015,9,18)})
      test_task2 = Task.new({:description => 'kitten', :list_id => 1, :due_date => Date.new(2015,9,18)})
      expect(test_task1).to(eq(test_task2))
    end
    it('returns false if descriptions are different') do
      test_task1 = Task.new({:description => 'kitten', :list_id => 1, :due_date => Date.new(2015,9,18)})
      test_task2 = Task.new({:description =>'kittens', :list_id => 1, :due_date => Date.new(2015,9,18)})
      expect(test_task1).to_not(eq(test_task2))
    end
  end

  describe('#list_id') do
    it('lets you read the list ID') do
      test_task = Task.new({:description => 'play frisbee', :list_id => 1, :due_date => Date.new(2015,9,18)})
      expect(test_task.list_id()).to(eq(1))
    end
  end
  
  describe("#due_date") do
    it("lets you grab a due date from a new task") do
      test_task1 = Task.new({:description => 'play frisbee', :list_id => 1, :due_date => Date.new(2015,9,18)})
      expect(test_task1.due_date()).to(eq(Date.new(2015,9,18)))
    end
  end

  # class methods
  describe(".all") do
    it("is empty at first") do
      expect(Task.all()).to(eq([]))
    end
  end

  describe(".sort") do
    it("sorts tasks by their due date") do
      test_task1 = Task.new({:description => 'play frisbee', :list_id => 1, :due_date => Date.new(2015,9,18)})
      test_task2 = Task.new({:description => 'play aerobie', :list_id => 1, :due_date => Date.new(2015,8,18)})
      test_task1.save()
      test_task2.save()
      expect(Task.sort()).to(eq([test_task2, test_task1]))
    end
  end

end
