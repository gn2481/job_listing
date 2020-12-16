class AddColumnsToJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :wage_upper_bound, :interge
    add_column :jobs, :wage_lower_bound, :interge
    add_column :jobs, :contact_email, :string
  end
end
