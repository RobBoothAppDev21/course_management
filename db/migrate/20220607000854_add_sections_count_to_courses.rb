class AddSectionsCountToCourses < ActiveRecord::Migration[7.0]
  def up
    add_column :courses, :sections_count, :integer
  end

  def down
    remove_column :courses, :sections_count
  end
end
