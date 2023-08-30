class AddStartDateToOffices < ActiveRecord::Migration[7.0]
  def change
    t.date :start_date
  end
end
