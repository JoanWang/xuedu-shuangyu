#职员课程关联表
class CreateEmployeesSubjects < ActiveRecord::Migration
  def self.up
    create_table :employees_subjects do |t|
      t.references :employee, :comment => "关联职员"
      t.references :subject, :comment => "关联课程"
    end
  end

  def self.down
    drop_table :employees_subjects
  end
end
