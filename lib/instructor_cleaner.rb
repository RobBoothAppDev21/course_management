module InstructorCleaner
  
  def clean_last_name(eval_object)
    last_name = eval_object.instr_last_name.strip
    last_name.split('')[0]
  end
end