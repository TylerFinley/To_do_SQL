class Task

  @@task_array = []

  define_method(:initialize) do |description|
    @description = description
  end

  define_method(:description) do
    @description
  end

  define_method(:save) do
    @@task_array.push(self)
  end

  define_singleton_method(:all) do
    @@task_array
  end

  define_singleton_method(:clear) do
    @@task_array = []
  end
end
