#学期活动
class CreateBatchEvents < ActiveRecord::Migration
  def self.up
    create_table :batch_events do |t|
      t.references :event, :comment => "关联活动"
      t.references :batch, :comment => "关联学期"
      t.timestamps
    end
  end

  def self.down
    drop_table :batch_events
  end
end
