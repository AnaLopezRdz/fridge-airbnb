class AddDateToOffices < ActiveRecord::Migration[7.0]
  def change
    add_column :offices, :start_date, :date
    add_column :offices, :end_date, :date
  end
end
