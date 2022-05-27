namespace :create_courses do
  task section_relation: :environment do
    sections = Section.where(course_id: nil)
    sections.each do |section|
      result = Course.find_by(number: section.number, title: section.title)
      if result
        section.update(course_id: result.id)
        # section.course_id = result.id
        # p "Valid section course relationship" if section.valid?
      else
        # new_course = Course.new(number: section.number, title: section.title)
        new_course = Course.create(number: section.number, title: section.title)
        # p "New course created" if new_course.valid?

        section.update(course_id: new_course.id)
        # section.course_id = new_course.id
        # binding.pry
      end
    end
  end
end