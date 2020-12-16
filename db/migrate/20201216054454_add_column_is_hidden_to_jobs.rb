class AddColumnIsHiddenToJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :is_hidden, :boolean, default: true
  end
end
