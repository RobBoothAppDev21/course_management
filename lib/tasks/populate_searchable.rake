namespace :populate_searchable do
  desc "TODO"
  task courses_sections: :environment do

    # courses = Course.all

    # courses.each do |course|
    #   course.set_searchable
    #   course.save
    # end

    sections = Section.all

    sections.each do |section|
      section.set_searchable
      section.save
    end
  end

end
