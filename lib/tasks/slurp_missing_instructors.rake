namespace :slurp do
  desc "TODO"
  task missing_instructors: :environment do

    missing_instructors_text = File.read(Rails.root.join('lib','csvs', '20220417_missing_instructors.csv'))
    missing_instructors_csv = CSV.parse(missing_instructors_text, headers: true, encoding: 'UTF-8')

    count = 0
    missing_instructors_csv.each do |row|
      instructor = Instructor.new
      instructor.first_name = row[0]
      instructor.last_name = row[1]
      instructor.title = row[2]
      instructor.department = row[3]
      instructor.phone_number = row[4]
      instructor.email = row[5]
      instructor.academic_area = row[5]
      instructor.save
      count += 1
    end
    p "#{count} instructors have been added to the Instructor table"
  end

end
