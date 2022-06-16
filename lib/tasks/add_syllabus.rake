namespace :add_syllabus do
  desc "TODO"
  task sections: :environment do

    syllabus_headers = %w[Quarter Section Syllabus]

    syllabus_text = File.read(Rails.root.join('lib', 'csvs', '20220615_course_syllabus.csv'))
    syllabus_csv = CSV.parse(syllabus_text, headers: syllabus_headers, encoding: 'UTF-8')
    syllabus_csv.delete(0)

    syllabus_csv.each do |row|
      x = SectionParser.new(row)
      section = Section.find_by(number:   x.extract_number,
                                section:  x.extract_section,
                                quarter:  x.extract_quarter,
                                year:     x.extract_year)
                              
      if section.nil?
        p x
        next
      else
        next unless section.syllabus.nil?
        section.syllabus = x.extract_syllabus
        section.save
      end
      # section.save
    end
  end

end
