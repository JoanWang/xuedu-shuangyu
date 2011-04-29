#职员考勤
class CreateEmployeeAttendances < ActiveRecord::Migration
  def self.up
    create_table :employee_attendances do |t|
      t.date       :attendance_date, :comment => "请假天数"
      t.references :employee, :comment => "关联职员"
      t.references :employee_leave_type, :comment => "请假类型"
      t.string     :reason, :comment => "理由"
      t.boolean    :is_half_day, :comment => "是否是半天"
    end
  end

  def self.down
    drop_table :employee_attendances
  end
end
