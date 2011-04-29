#责任
class CreateLiabilities < ActiveRecord::Migration
  def self.up
    create_table :liabilities do |t|
      t.string :title, :comment => "标题"
      t.text :description, :comment => "描述"
      t.integer :amount, :comment => "数目"
      t.boolean :is_solved,:default=>false, :comment => "是否解决"
      t.boolean :is_deleted, :default=>false, :comment => "是否删除"
      t.timestamps
    end
  end

  def self.down
    drop_table :liabilities
  end
end
