class AddStatusColumnToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :status, :integer
  end
end
