namespace :clean_time do
  desc "TODO"
  task sections: :environment do

    full_time_meeting_times = { start_times: { morning:   [8, 9, 10], 
                                               afternoon: [12, 1, 2, 3, 4, 5, 6] },
                                end_times:   { morning:   [10, 11], 
                                               afternoon: [12, 1, 2, 3, 4, 5] } }

    evening_meeting_times = { start_times: { morning:   [nil], 
                                             afternoon: [12, 1, 2, 3, 4, 5, 6, 7, 8] },
                                end_times: { morning:   [nil], 
                                             afternoon: [12, 1, 2, 3, 4, 5, 6, 7, 8, 9] } }

    weekend_meeting_times = { start_times: { morning:   [9], 
                                             afternoon: [1] },
                                end_times: { morning:   [nil], 
                                             afternoon: [12, 3, 4] } }

    phd_meeting_times = { start_times: { morning:   [8, 9, 10, 11], 
                                         afternoon: [12, 1, 2, 3, 4, 5, 6] },
                          end_times:   { morning:   [10, 11], 
                                         afternoon: [12, 1, 2, 3, 4, 5, 6, 7, 8, 9] } }

    programs = %w[Full-Time\ MBA Evening\ MBA Weekend\ MBA PhD\ Program]
    nil_time_sections = Section.where(start_time: nil)
                               .where(program: programs)
                               .where.not(academic_year: '2021-2022')

    nil_time_sections.each do |section|
      next if section.bid_history.nil?
      next if section.bid_history.day_time.nil?
      bh = section.bid_history
      time_match = bh.day_time.match(/\d+:.+/)[0].split('-')
      start_time = time_match[0].strip
      start_hour = start_time.split(':')[0].strip.to_i
      end_time = time_match[1].strip
      end_hour = end_time.split(':')[0].strip.to_i

      if section.program == 'Full-Time MBA'
        start_time = "#{start_time}AM" if full_time_meeting_times[:start_times][:morning].include? start_hour
        start_time = "#{start_time}PM" if full_time_meeting_times[:start_times][:afternoon].include? start_hour
        end_time = "#{end_time}AM" if full_time_meeting_times[:end_times][:morning].include? end_hour
        end_time = "#{end_time}PM" if full_time_meeting_times[:end_times][:afternoon].include? end_hour

      end

      if section.program == 'Evening MBA'
        start_time = "#{start_time}AM" if evening_meeting_times[:start_times][:morning].include? start_hour
        start_time = "#{start_time}PM" if evening_meeting_times[:start_times][:afternoon].include? start_hour
        end_time = "#{end_time}AM" if evening_meeting_times[:end_times][:morning].include? end_hour
        end_time = "#{end_time}PM" if evening_meeting_times[:end_times][:afternoon].include? end_hour
      end

      if section.program == 'Weekend MBA'
        start_time = "#{start_time}AM" if weekend_meeting_times[:start_times][:morning].include? start_hour
        start_time = "#{start_time}PM" if weekend_meeting_times[:start_times][:afternoon].include? start_hour
        end_time = "#{end_time}AM" if weekend_meeting_times[:end_times][:morning].include? end_hour
        end_time = "#{end_time}PM" if weekend_meeting_times[:end_times][:afternoon].include? end_hour
      end

      if section.program == 'PhD Program'
        start_time = "#{start_time}AM" if phd_meeting_times[:start_times][:morning].include? start_hour
        start_time = "#{start_time}PM" if phd_meeting_times[:start_times][:afternoon].include? start_hour
        end_time = "#{end_time}AM" if phd_meeting_times[:end_times][:morning].include? end_hour
        end_time = "#{end_time}PM" if phd_meeting_times[:end_times][:afternoon].include? end_hour
      end

      section.start_time = start_time
      section.end_time = end_time
      section.save
      # binding.pry
    end
  end

end

# full-time
# Start times:
# AM: 8, 9, 10, 11
# PM: 12, 1, 2, 3, 4, 5, 6

# End Times:
# AM: 10, 11
# PM: 12, 1, 2, 3, 4, 5

# evening
# Start times:
# PM: 3, 4, 5, 6, 7, 8

# End Times:
# PM: 12, 1, 2, 3, 4, 5, 7, 8, 9, 10, 11

# weekend
# Start times:
# PM: 3, 4, 5, 6, 7, 8

# End Times:
# PM: 12, 1, 2, 3, 4, 5, 7, 8, 9, 10, 11