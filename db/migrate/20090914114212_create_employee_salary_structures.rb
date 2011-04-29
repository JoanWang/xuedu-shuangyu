#职员工资结构
class CreateEmployeeSalaryStructures < ActiveRecord::Migration
  def self.up
    create_table :employee_salary_structures do |t|
      t.references :employee, :comment => "关联职员"
      t.references :payroll_category, :comment => "关联工资类别"
      t.string     :amount, :comment => "数量"
    end
  end

  def self.down
    drop_table :employee_salary_structures
  end
end
