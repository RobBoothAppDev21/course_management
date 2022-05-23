class AddCourseToBidHistories < ActiveRecord::Migration[7.0]
  def change
    add_reference :bid_histories, :course, foreign_key: true
  end
end
