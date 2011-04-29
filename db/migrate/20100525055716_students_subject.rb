#学生课程
class StudentsSubject < ActiveRecord::Migration
  def self.up
    create_table :students_subjects do |t|
      t.references :student, :comment => "关联学生"
      t.references :subject, :comment => "关联课程"
      t.references :batch, :comment => "关联学期"
    end
  end

  def self.down
    drop_table :students_subjects
  end
end
