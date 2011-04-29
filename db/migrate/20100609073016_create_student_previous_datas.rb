#毕业生数据
class CreateStudentPreviousDatas < ActiveRecord::Migration
  def self.up
    create_table :student_previous_datas do |t|
      t.references :student, :comment => "关联学生"
      t.string     :institution, :comment => "学院"
      t.string     :year, :comment => "年份"
      t.string     :course, :comment => "年级"
      t.string     :total_mark, :comment => "总分"
    end
  end

  def self.down
    drop_table :student_previous_datas
  end
end
