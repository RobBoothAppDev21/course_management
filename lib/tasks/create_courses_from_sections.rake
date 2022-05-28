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

  task remove_duplicates: :environment do
    duplicate_courses = [
      [590, [494, 588]],
      [591, [422]],
      [423, [592]],
      [497, [700]],
      [713, [712]],
      [715, [714]],
      [716, [718]],
      [598, [720, 721]],
      [725, [581]],
      [658, [726]],
      [604, [552]],
      [605, [503]],
      [606, [440]],
      [555, [731]],
      [609, [733]],
      [611, [445]],
      [613, [556]],
      [737, [740]],
      [741, [738]],
      [739, [701]],
      [616, [800]],
      [617, [744]],
      [451, [756]],
      [453, [621]],
      [768, [769]],
      [768, [769]],
      [632, [566]],
      [633, [771]],
      [633, [771, 802]],
      [469, [635]],
      [636, [530]],
      [638, [408]],
      [570, [705]],
      [683, [536]],
      [645, [576]],
      [646, [488]],
      [648, [491]],
      [650, [578]],
      [653, [797, 799]],
      [536, [683]],
      [441, [730]],
      [551, [752]],
      [622, [702]],
      [507, [773]],
      [554, [779]],
      [628, [685, 782]],
      [528, [789]],
    ]
    # duplicate_course = Course.select(:number).group(:number).order(:number).having("count(*) > 1").size
    duplicate_courses.each do |arr|
      arr[1].each do |old_id|
        sections = Section.where(course_id: old_id)
        # binding.pry
        sections.update_all(course_id: arr[0])
      end
    end
  end
end



"33923 + 441 + Advanced Industrial Organization III"
"33923 + 730 + Advanced Industrial Organization II" # --> should be 441?

"35101 + 515 + Futures, Forwards, Options & Swaps: Theory and Practice"
"35101 + 752 + International Macroeconomics and Trade" # --> should be 551

"35901 + 455 + Portfolio Choice and Asset Pricing "
"35901 + 622 + Portfolio Choice and Asset Pricing"
"35901 + 675 + Portfolio Choice and Asset Pricing: Theory and Applications"
"35901 + 702 + Theory of Financial Decisions I" # --> should be 622

"38102 + 474 + Persuasion II: Influence Through Narrative ⑤"
"38102 + 637 + Persuasion II: Influence Through Narrative"
"38102 + 773 + Applied Macroeconomics: Heterogeneity and Macro" # -- should be 507


"40101 + 538 + Supply Chain Strategy and Practice"
"40101 + 779 + Advanced Industrial Organization I" # --> should be 554

"40902 + 685 + Special Topics in Operations Mgt./Mgt. Sci.: Online Optimization & Decision Making under Uncertainty" # --> 628
"40902 + 782 + Special Topics in Operations Mgt./Mgt. Sci." # --> 628
"40902 + 789 + Advanced Quantitative Marketing" # --> 528
#685/782 --> 36920 or 36921
