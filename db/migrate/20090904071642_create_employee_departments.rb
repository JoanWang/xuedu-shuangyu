#职员部门
class CreateEmployeeDepartments < ActiveRecord::Migration
  def self.up
    create_table :employee_departments do |t|
      t.string  :code, :comment => "代码"
      t.string  :name, :comment => "姓名"
      t.boolean :status, :comment => "状态"
    end
   create_default
  end

  def self.down
    drop_table :employee_departments
  end

  def self.create_default
    EmployeeDepartment.create :code => 'Admin',:name => 'Fedena Admin',:status => true
  end
end
