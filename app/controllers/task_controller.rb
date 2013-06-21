require_relative '../config/application'

class TaskController < ActiveRecord::Base
  def list
    tasks = Task.all 
    tasks.each.with_index do |task,i|
      puts "#{i}. Description: #{task.description} Completed: #{task.completed}"
    end
  end

  def delete(index)
    tasks.each_with_index do |task, i|
      if i == index
        deleted_id = task.id
      end
    end
    end
    Task.delete(deleted_id)
  end

  def create(description)
    Task.new(description: description)
    
  end

  def complete(index)
    tasks.each_with_index do |task, i|
      if i == index
        completed_index = task.id
      end
    end
    Task.update_attributes(complete: true)
  end
end


