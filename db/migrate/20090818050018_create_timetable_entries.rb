#时间表
class CreateTimetableEntries < ActiveRecord::Migration
  def self.up
    create_table :timetable_entries do |t|
      t.references :batch, :comment => "关联学期"
      t.references :week_day, :comment => "关联星期"
      t.references :class_timing, :comment => "关联上课时间"
      t.references :subject, :comment => "关联课程"
      t.references :employee, :comment => "关联职员"
    end
  end

  def self.down
    drop_table :timetable_entries
  end
end
