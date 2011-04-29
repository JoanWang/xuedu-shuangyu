#职员部门事件
class CreateEmployeeDepartmentEvents < ActiveRecord::Migration
  def self.up
    create_table :employee_department_events do |t|
      t.references :event, :comment => "事件"
      t.references :employee_department, :comment => "关联职员部门"
      t.timestamps
    end
  end

  def self.down
    drop_table :employee_department_events
  end
end
