namespace :clean_day do
  desc "TODO"
  task sections: :environment do

    days_of_week = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
    sections_missing_meeting_info = Section.where.not(academic_year: '2021-2022')

    sections_missing_meeting_info.each do |section|
      next if section.bid_history.nil?
      bh = section.bid_history
      next if bh.day_time.nil?
      days_of_week.each do |day|
        next unless bh.day_time.include?(day)

        section_day = "#{day.downcase}="
        section.send(section_day, true)
        section.save
      end
    end
  end
end