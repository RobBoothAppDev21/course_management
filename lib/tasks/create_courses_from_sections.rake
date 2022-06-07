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
        sections.update_all(course_id: arr[0])
      end
    end
  end
end