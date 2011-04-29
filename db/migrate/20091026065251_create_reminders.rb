#提醒、备忘
class CreateReminders < ActiveRecord::Migration
  def self.up
    create_table :reminders do |t|
      t.integer  :sender, :comment => "是否发送"
      t.integer  :recipient, :comment => "recipient"
      t.string   :subject, :comment => "主题"
      t.text   :body, :comment => "内容"
      t.boolean  :is_read, :default=>false, :comment => "是否读取"
      t.boolean  :is_deleted_by_sender, :default=>false, :comment => "是否被发送者删除"
      t.boolean  :is_deleted_by_recipient, :default=>false, :comment => "是否被接收者删除"
      t.timestamps
    end
  end

  def self.down
    drop_table :reminders
  end
end
