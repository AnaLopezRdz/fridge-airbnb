class RemoveAvailableDatesFromOffices < ActiveRecord::Migration[7.0]
  def change
    remove_column :offices, :available_dates, :date
  end
end
