class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.timestamp :last_called

      t.timestamps
    end
  end
end
