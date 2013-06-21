require_relative '../../config/application'

class CreateTasks < ActiveRecord::Migration
  def up
    create_table :tasks do |t|
      t.string :description
      t.boolean :complete
    end
  end

  def down
    drop_table :tasks
  end
end
