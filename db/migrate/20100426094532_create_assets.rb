#资产
class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.string :title, :comment => "标题"
      t.text :description, :comment => "描述"
      t.integer :amount, :comment => "数量"
      t.boolean :is_inactive,:default=>false, :comment => "是否有效"
      t.boolean :is_deleted,:default=>false, :comment => "是否删除"
      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
