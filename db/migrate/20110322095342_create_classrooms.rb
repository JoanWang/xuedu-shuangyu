#教室信息
class CreateClassrooms < ActiveRecord::Migration
  def self.up
    create_table :classrooms do |t|
      t.references :school, :comment => "关联校区"
      t.string :name, :comment => "教室名称"
      t.string :code, :comment => "教室代码"
      t.integer :seats, :comment => "教室座位数"
      t.boolean :status, :comment => "状态"
      t.boolean :is_deleted, :default => false, :comment => "是否删除"

      t.timestamps
    end
  end

  def self.down
    drop_table :classrooms
  end
end
