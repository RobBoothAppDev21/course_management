namespace :add_credits do
  desc "TODO"
  task courses: :environment do

    sections_with_credits = Section.where.not(credits: 0)

    course_credits = Hash.new

    sections_with_credits.each do |section|
      course_credits[section.number] ||= []
      course_credits[section.number] << section.credits
    end

    missing_course = []
    course_credits.each do |k, v|
      course = Course.find_by(number: k)
      if course.nil?
        missing_courses << k
        next
      end
      course.update(credits: v.first)
    end
  end
end
