class RenameCourseForeignKeyForBidHistories < ActiveRecord::Migration[7.0]
  def change
    rename_column :bid_histories, :course_id, :section_id
  end
end
