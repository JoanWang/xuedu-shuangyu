#新增学生详情
class CreateStudentAdditionalDetails < ActiveRecord::Migration
  def self.up
    create_table :student_additional_details do |t|
      t.references :student, :comment => "关联学生"
      t.references :additional_field, :comment => "关联信息领域"
      t.string     :additional_info, :comment => "新增信息"
    end
  end

  def self.down
    drop_table :student_additional_details
  end
end
