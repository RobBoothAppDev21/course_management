class ResetAllCourseCacheCounters < ActiveRecord::Migration[7.0]
  def up
    Course.all.each do |course|
      Course.reset_counters(course.id, :sections)
    end
  end
end
