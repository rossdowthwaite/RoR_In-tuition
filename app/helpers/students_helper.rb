module StudentsHelper

  def find_student(pupil, tutor)
  	@students = Student.where(:user_id => tutor.id)
    if @students.exists?(:pupil_id => pupil.id)
      return false
    else
      return true 
    end
  end

end
