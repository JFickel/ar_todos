require_relative '../../config/application'

class Task < ActiveRecord::Base
  def self.list
    tasks = Task.all 
    tasks.each.with_index do |task,i|
      i += 1
      puts "#{i}. Description: #{task.description} Completed: #{task.complete}"
    end
  end

  def self.delete_by_index(index)
    tasks = Task.all
    tasks.each_with_index do |task, i|
      i += 1
      deleted_id = task.id if i == index
      staged_task = task
    end
    staged_task.delete(deleted_id)
  end

  def self.complete_by_index(index)
    tasks = Task.all
    tasks.each_with_index do |task, i|
      i += 1
      completed_index = task.id if i == index
      staged_task = task
    end
    staged_task.update_attributes(complete: true)
  end

  ## Refactor methods for staged task
end
