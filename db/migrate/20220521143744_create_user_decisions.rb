class CreateUserDecisions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_decisions do |t|
      t.string :gender
      t.integer :age
      t.string :educational_level
      t.string :martial_status
      t.string :professional_area
      t.integer :family_size

      t.timestamps
    end
  end
end
