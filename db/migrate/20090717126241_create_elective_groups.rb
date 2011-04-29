#选修组
class CreateElectiveGroups < ActiveRecord::Migration
  def self.up
    create_table :elective_groups do |t|
      t.string     :name, :comment => "名称"
      t.references :batch, :comment => "关联学期"
      t.boolean    :is_deleted, :default => false, :comment => "是否删除"
      t.timestamps
    end
  end

  def self.down
    drop_table :elective_groups
  end
end
