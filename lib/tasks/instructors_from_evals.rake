namespace :instructors_from_evals do
  desc "TODO"
  task create_instructors: :environment do

    # instr_matches = [
    #                   "Hand, John Roderick | 127 John Hand",
    #                   "Kaplan, Steven Neil | 149 Steven Kaplan",
    #                   "Meadow, Scott F | 180 Scott Meadow",
    #                   "Sachs, Daniel | 765 Dan Sachs",
    #                   "Deutsch, H Waverly | 95 Waverly Deutsch",
    #                   "Gertner, Robert H | 114 Robert Gertner",
    #                   "Henderson, M. Todd | 27 Todd Henderson",
    #                   "Constantinides, G M | 88 George Constantinides",
    #                   "Hansen, Lars P | 128 Lars Hansen",
    #                   "Diamond, Douglas W | 98 Douglas Diamond",
    #                   "Gossin-Wilson, Thomas | 28 Will Gossin-Wilson",
    #                   "Belton, Terrence M | 66 Terrence Belton",
    #                   "Leftwich, Richard W | 161 Richard Leftwich",
    #                   "Rajan, Raghuram G | 210 Raghuram Rajan",
    #                   "Martin, Richard Kipp | 174 R. Martin",
    #                   "Eisenstein, Donald D | 104 Donald Eisenstein",
    #                   "Betina, Raghuveera | 69 Raghu Betina",
    #                   "Hafen, Thomas | 126 Tom Hafen",
    #                   "Hsee, Kaiyuan Chris | 139 Christopher Hsee",
    #                   "Nussbaum, A. David | 197 A. Nussbaum",
    #                   "Ginzel, Linda Elaine | 116 Linda Ginzel",
    #                   "Thaler, Richard H | 245 Richard Thaler",
    #                   "Knez, Marc James | 154 Marc Knez",
    #                   "Adelman, Daniel | 54 Dan Adelman",
    #                   "Polson, Nicholas G | 206 Nicholas Polson",
    #                   "Toulis, Panagiotis | 250 (Panos) Toulis",
    #                   "Goolsbee, Austan D | 117 Austan Goolsbee",
    #                   "Bursztyn, Leonardo | 38 Leo Bursztyn"
    # ]
    # instr_matches = [
    #   "Panagiotis, Toulis (Panos) | 250",
    #   "Dube, Jean-Pierre | 103" ,
    #   "Pippel Lyman, Lindsey | 168",
    #   'Mcgowan, Christopher | 178',
    #   "O'brien, Ed | 198",
    #   'Dehoratius, Nicole | 41',
    #   'Aragam, Nikhyl | 59',
    #   'Mcculloch, Robert E | 43',
    #   'Gould Jr, John P | 119'
    # ]

    # instr_matches.each do |prof|
    #   evals_updated = 0
    #   names_array = prof.split('|')
    #   evals_instr_name = names_array[0].split(',')
    #   instr_id_name = names_array[1].split(' ')
    #   instr_evals = Evaluation.where(instr_first_name: evals_instr_name[1].strip,
    #                                  instr_last_name: evals_instr_name[0].strip,
    #                                  instructor_id: nil)
    #   instr_evals.each do |ev|
    #     # ev.instructor_id = instr_id_name[0].strip
    #     ev.update(instructor_id: instr_id_name[0].strip)
    #     evals_updated += 1
    #   end
    #   binding.pry
    # end

    # names_flip = [
    #   'Andrew, Borowick',
    #   'Wendy, Heltzer',
    #   'Seth, Zimmerman'
    # ]

    # instr_holder = []
    evaluations = Evaluation.where(instructor_id: nil)
    evaluations.each do |ev|
      # instr_holder << "#{ev.instr_last_name}, #{ev.instr_first_name}"
      result = Instructor.find_by(first_name: ev.instr_first_name.strip,
                                  last_name: ev.instr_last_name.strip)
      # result = Instructor.find_by(first_name: ev.instr_last_name.strip,
      #                             last_name: ev.instr_first_name.strip)
      # result = Instructor.find_by(last_name: ev.instr_last_name.strip)
      # # end
      if result
        ev.update(instructor_id: result.id)
        # ev.instructor_id = result.id
        #   instr_holder << "#{ev.instr_last_name}, #{ev.instr_first_name} | #{result.id} #{result.first_name} #{result.last_name}"
      else
        new_instr = Instructor.new
        new_instr.update(first_name: ev.instr_first_name, last_name: ev.instr_last_name)
        # new_instr.first_name = ev.instr_first_name
        # new_instr.last_name = ev.instr_last_name
        ev.update(instructor_id: new_instr.id)
        # ev.instructor_id = new_instr.id
      end
    end
    # # p instr_holder.uniq.count
    # # instr_holder
  end

  task assign_instr: :environment do
    instr_id = 100

    x = 'Dingel'
    y = 'Jonathan'
    instr_evs = Evaluation.where(instr_first_name: x, instr_last_name: y)
    p instr_evs.count
    evaluations_updated = 0
    unless instr_evs.nil? || instr_evs.empty?
      instr_evs.each do |ev|
        ev.update(instructor_id: instr_id)
        evaluations_updated += 1
      end
      p "#{evaluations_updated} Evaluations updated with instructor reference"
    end
  end
end
