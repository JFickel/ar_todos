require_relative '../../config/application'

class Task < ActiveRecord::Base
  def self.delete_by_index(index)
    task = stage_task(index)
    task.delete
  end

  def self.complete_by_index(index)
    task = stage_task(index)
    p task
    task.update_attributes(complete: true)
  end

  def self.stage_task(index)
    Task.all.each.with_index do |task, i|
      i += 1
      if i == index
        break task
      end
    end
  end
end
