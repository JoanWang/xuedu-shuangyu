#阶段条目
class CreatePeriodEntries < ActiveRecord::Migration
  def self.up
    create_table :period_entries do |t|
      t.date       :month_date, :comment => "月份"
      t.references :batch, :comment => "关联学期"
      t.references :subject, :comment => "关联课程"
      t.references :class_timing, :comment => "关联上课时间表"
      t.references :employee, :comment => "关联职员"
    end
  end

  def self.down
    drop_table :period_entries
  end
end
