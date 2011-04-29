#学生新增领域
class CreateStudentAdditionalFields < ActiveRecord::Migration
  def self.up
    create_table :student_additional_fields do |t|
      t.string :name, :comment => "名称"
      t.boolean :status, :comment => "状态"
    end
  end

  def self.down
    drop_table :student_additional_fields
  end
end
