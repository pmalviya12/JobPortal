class AddStatusAttrToJobs < ActiveRecord::Migration[7.0]
  def change
    remove_column :jobs, :status, :string
  end
end
