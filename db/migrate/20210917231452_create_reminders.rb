class CreateReminders < ActiveRecord::Migration[6.1]
  def change
    create_table :reminders do |t|
      t.date :reminder_day
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
