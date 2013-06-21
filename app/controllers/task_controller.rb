require_relative '../../config/application'

if View.request_add
  Task.create(description: View.request_add)
  View.display_list

elsif View.request_delete
  Task.delete_by_index(View.request_delete)
  View.display_list

elsif View.request_complete
  Task.complete_by_index(View.request_complete)
  View.display_list

elsif View.request_list
  View.request_list
  View.display_list
  
end
