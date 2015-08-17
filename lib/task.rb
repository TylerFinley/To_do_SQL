class Task
  attr_reader(:description, :list_id, :due_date)


  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @list_id = attributes.fetch(:list_id)
    @due_date = attributes.fetch(:due_date)
  end

  define_method(:save) do
    DB.exec("INSERT INTO tasks (description, list_id, due_date) VALUES ('#{@description}', #{@list_id}, '#{@due_date}');")
  end

  define_singleton_method(:all) do
    returned_tasks = DB.exec("SELECT * FROM tasks;")
    tasks = []
    returned_tasks.each() do |task|
      description = task.fetch("description")
      list_id = task.fetch("list_id").to_i()
      due_date = Date.parse(task.fetch("due_date"))
      tasks.push(Task.new({:description => description, :list_id => list_id, :due_date => due_date}))
    end
    tasks
  end

  define_method(:==) do |other|
    same_class = self.class().eql?(other.class())
    same_description = self.description().eql?(other.description())
    same_id = self.list_id().==(other.list_id())
    same_class.&(same_description).&(same_id)
  end

  define_singleton_method(:sort) do
    returned_tasks = DB.exec("SELECT * FROM tasks ORDER BY due_date ASC;")
    sorted_tasks = []
    returned_tasks.each() do |task|
      description = task.fetch("description")
      list_id = task.fetch("list_id").to_i()
      due_date = Date.parse(task.fetch("due_date"))
      sorted_tasks.push(Task.new({:description => description, :list_id => list_id, :due_date => due_date}))
    end
    sorted_tasks
  end

end
