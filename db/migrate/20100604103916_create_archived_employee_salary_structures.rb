#职员待遇机构
class CreateArchivedEmployeeSalaryStructures < ActiveRecord::Migration
  def self.up
    create_table :archived_employee_salary_structures do |t|
      t.references :employee, :comment => "关联职员"
      t.references :payroll_category, :comment => "关联工作类别"
      t.string     :amount, :comment => "薪水数目"
    end
  end

  def self.down
    drop_table :archived_employee_salary_structures
  end
end
