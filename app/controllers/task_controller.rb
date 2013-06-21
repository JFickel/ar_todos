require_relative '../../config/application'

if View.request_add
  Task.create(View.request_add)

elsif View.request_delete
  Task.delete_by_index(View.request_delete)

elsif View.request_complete
  Task.complete_by_index(View.request_complete)

elsif View.request_list
  View.request_list

end
