namespace :add_searchable do
  desc "TODO"
  task courses_sections: :environment do

    current_courses = Course.current_sections

    current_courses.each do |course|
      course.update(searchable_avg_hours_committed: course.calculate_average_hours_committed) if (course.calculate_average_hours_committed.is_a? Numeric)
      course.update(searchable_avg_overall_score: course.calculate_average_overall_score) if (course.calculate_average_overall_score.is_a? Numeric)
      course.update(searchable_ratio_overall_hours:course.calculate_ratio_overall_hours) if (course.calculate_ratio_overall_hours.is_a? Numeric)
    end

    current_sections = Section.all

    current_sections.each do |section|
      section.update(searchable_meet_days_list: section.meeting_days.join(' '))
      section.update(searchable_time_of_day_list: section.time_of_day_start)
    end
  end

end
