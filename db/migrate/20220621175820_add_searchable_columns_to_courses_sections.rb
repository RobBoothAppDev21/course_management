class AddSearchableColumnsToCoursesSections < ActiveRecord::Migration[7.0]
  def up
    add_column :courses, :searchable_avg_hours_committed, :decimal, default: 0
    add_column :courses, :searchable_avg_overall_score, :decimal, default: 0
    add_column :courses, :searchable_ratio_overall_hours, :decimal, default: 0
    add_column :courses, :searchable_course_areas_list, :string
    add_column :courses, :searchable_concentrations_list, :string

    add_column :sections, :searchable_meet_days_list, :string
    add_column :sections, :searchable_time_of_day_list, :string
  end

  def down
    remove_column :courses, :searchable_avg_hours_committed
    remove_column :courses, :searchable_avg_overall_score
    remove_column :courses, :searchable_ratio_overall_hours
    remove_column :courses, :searchable_course_areas_list
    remove_column :courses, :searchable_concentrations_list

    remove_column :sections, :searchable_meet_days_list
    remove_column :sections, :searchable_time_of_day_list
  end
end
