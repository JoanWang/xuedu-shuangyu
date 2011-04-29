#活动
class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string   :title, :comment => "标题"
      t.string   :description, :comment => "描述"
      t.datetime :start_date, :comment => "开始时间"
      t.datetime :end_date, :comment => "结束时间"
      t.boolean  :is_common,  :default => false, :comment => "是否是普通的"
      t.boolean  :is_holiday, :default => false, :comment => "是否节假日"
      t.boolean  :is_exam,    :default => false, :comment => "是否有考试"
      t.boolean  :is_due, :default => false, :comment => "是否过期"
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
