#职员请假
class CreateApplyLeaves < ActiveRecord::Migration
  def self.up
    create_table :apply_leaves do |t|
      t.references  :employee, :comment => "关联职员"
      t.references  :employee_leave_types, :comment => "关联请假类型"
      t.boolean     :is_half_day, :comment => "是否全天"
      t.date        :start_date, :comment => "开始时间"
      t.date        :end_date, :comment => "结束时间"
      t.string      :reason, :comment => "原因"
      t.boolean     :approved, :default => false, :comment => "是否批准"
      t.boolean     :viewed_by_manager, :default => false, :comment => "上级是否批准"
      t.string      :manager_remark, :comment => "领导批示"
    end
  end

  def self.down
    drop_table :apply_leaves
  end
end
