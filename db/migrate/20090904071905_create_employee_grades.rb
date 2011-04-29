#职员等级
class CreateEmployeeGrades < ActiveRecord::Migration
  def self.up
    create_table :employee_grades do |t|
      t.string :name, :comment => "名称"
      t.integer :priority, :comment => "优先级"
      t.boolean :status, :comment => "状态"
      t.integer :max_hours_day, :comment => "每天最大工时"
      t.integer :max_hours_week, :comment => "每周最大工时"
    end
       create_default
  end

  def self.down
    drop_table :employee_grades
  end

    def self.create_default
    EmployeeGrade.create :name => 'Fedena Admin',:priority => 0 ,:status => true,:max_hours_day=>nil,:max_hours_week=>nil
  end
end
