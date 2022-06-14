namespace :clean_program do
  desc "TODO"
  task sections: :environment do

    full_time_codes = %w[01 02 03 04 05 06 07 08 09 10] # "Full-Time MBA"
    evening_codes = %w[81 82 83] # "Evening MBA"
    weekend_codes = %w[85 86] # "Weekend MBA"
    executive_codes = %w[87 88] # "Executive MBA"
    phd_codes =  %w[50 51] # PhD Program" 
    workshop_codes =  %w[60] # workshop

    nil_program_sections = Section.where(program: nil)

    nil_program_sections.each do |section|
      case
      when (full_time_codes.include? section.section)
        section.update(program: "Full-Time MBA")
      when (evening_codes.include? section.section)
        section.update(program: "Evening MBA")
      when (weekend_codes.include? section.section)
        section.update(program: "Weekend MBA")
      when (executive_codes.include? section.section)
        section.update(program: "Executive MBA")
      when (phd_codes.include? section.section)
        section.update(program: "PhD Program")
      when (workshop_codes.include? section.section)
        section.update(program: "Workshop")
      end
    end

  end

end
