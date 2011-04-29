#职员请假类型
class CreateEmployeeLeaveTypes < ActiveRecord::Migration
  def self.up
    create_table :employee_leave_types do |t|
      t.string   :name, :comment => "名称"
      t.string   :code, :comment => "代码"
      t.boolean  :status, :comment => "状态"
      t.string   :max_leave_count, :comment => "最多请假天数"
    end
  end

  def self.down
    drop_table :employee_leave_types
  end
end
