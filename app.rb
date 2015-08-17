require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/task")
require("./lib/list")
require("pg")
require("date")

DB = PG.connect({:dbname => "to_do"})

get("/") do
  erb(:index)
end

get('/lists/new') do
  erb(:list_form)
end

post("/lists") do
  name = params.fetch("list_name")
  @list = List.new({:name => name, :id => nil})
  @list.save()
  erb(:success)
end

get("/lists") do
  @lists = List.all()
  erb(:lists)
end

get('/lists/:id') do
  id = params.fetch("id")
  @list = List.find(id)
  @tasks = Task.find(id)
  erb(:list)
end

post('/lists/:id') do
    description = params.fetch('task_description')
    id = params.fetch('id')
    due_date = Date.parse(params.fetch('due_date'))
    task = Task.new({:description => description, :list_id => id, :due_date => due_date})
    task.save()
    @list = List.find(id)
    @tasks = Task.find(id)
    erb(:list)
end

get('/lists/:id/tasks/new') do
  id = params.fetch("id")
  @list = List.find(id)
  erb(:task_form)
end

# post("/tasks") do
#   description = params.fetch("description")
#   task = Task.new(description)
#   task.save()
#   erb(:success)
# end
