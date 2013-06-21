require_relative '../config/application'

class TaskController < ActiveRecord::Base
  def list
    Task.all 
  end

  def delete(id)

  end

  def create(description)
    
  end

  def complete(id)

  end
end
