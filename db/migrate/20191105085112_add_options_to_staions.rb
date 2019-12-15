class AddOptionsToStaions < ActiveRecord::Migration[5.0]
  def change
    change_column_null :stations, :route, false
    change_column_null :stations, :name, false
    change_column_null :stations, :time_needed, false
  end
end
