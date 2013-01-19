class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :description
      t.timestamps
    end
    add_index :ideas, :description
  end
end
