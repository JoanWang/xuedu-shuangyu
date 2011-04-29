#毕业学生的课程成绩
class CreateStudentPreviousSubjectMarks < ActiveRecord::Migration
  def self.up
    create_table :student_previous_subject_marks do |t|
      t.references :student, :comment => "关联学生"
      t.string    :subject, :comment => "课程"
      t.string    :mark, :comment => "成绩"
    end
  end

  def self.down
    drop_table :student_previous_subject_marks
  end
end
