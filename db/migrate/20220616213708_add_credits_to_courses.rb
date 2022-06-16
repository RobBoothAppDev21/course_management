class AddCreditsToCourses < ActiveRecord::Migration[7.0]
  def up
    add_column :courses, :credits, :integer, default: 0
  end

  def down
    remove_column :courses, :credits
  end
end
