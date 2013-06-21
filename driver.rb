require 'pathname'

app_root = Pathname.new(File.expand_path(File.join(File.dirname(__FILE__))))
# p app_root.to_s
$LOAD_PATH << "#{app_root.to_s}"
# p $LOAD_PATH
require 'app/controllers/task_controller'
require 'app/models/task'


p Task.create(description: "buy bananas")
p Task.create(description: "buy apples")
p Task.list

p Task.delete_by_index(2)
p Task.list

p Task.complete_by_index(3)
p Task.list



