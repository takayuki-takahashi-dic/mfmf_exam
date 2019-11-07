class ChangeColumnToAllowNull < ActiveRecord::Migration[5.0]
  def change
    change_column :stations, :route,:string, null: true
    change_column :stations, :name,:string, null: true
    change_column :stations, :time_needed,:integer, null: true
  end
end
