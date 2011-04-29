#出勤
class CreateAttendances < ActiveRecord::Migration
  def self.up
    create_table :attendances do |t|
      t.references :student, :comment => "关联学生"
      t.references :period_table_entry, :comment => "关联表时段"
      t.boolean :forenoon, :default => false, :comment => "是否为上午"
      t.boolean :afternoon, :default => false, :comment => "是否为下午"
      t.string :reason, :comment => "原因"
    end
  end

  def self.down
    drop_table :attendances
  end
end
