#新增领域
class CreateAdditionalFields < ActiveRecord::Migration
  def self.up
    create_table :additional_fields do |t|
      t.string :name, :comment => "名称"
      t.boolean :status, :comment => "状态"
    end
  end

  def self.down
    drop_table :additional_fields
  end
end
