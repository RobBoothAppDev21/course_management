class AddSearchableToModels < ActiveRecord::Migration[7.0]
  def up
    add_column :courses, :searchable, :text
    add_column :sections, :searchable, :text
    add_column :evaluations, :searchable, :text
    add_column :instructors, :searchable, :text
    add_column :bid_histories, :searchable, :text
  end

  def down
    remove_column :courses, :searchable
    remove_column :sections, :searchable
    remove_column :evaluations, :searchable
    remove_column :instructors, :searchable
    remove_column :bid_histories, :searchable
  end
end
