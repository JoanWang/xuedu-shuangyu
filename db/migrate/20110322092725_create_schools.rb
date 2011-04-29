#学校
class CreateSchools < ActiveRecord::Migration
  def self.up
    create_table :schools do |t|
      t.string :school_name, :comment => "校区名称"
      t.string :school_code, :comment => "校区代码"
      t.boolean :is_deleted, :default => false, :comment => "是否删除"

      t.timestamps
    end
  end

  def self.down
    drop_table :schools
  end
end
