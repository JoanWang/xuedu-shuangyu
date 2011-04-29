#财经费用类别
class CreateFinanceFeeCategories < ActiveRecord::Migration
  def self.up
    create_table :finance_fee_categories do |t|
      t.string      :name, :comment => "名称"
      t.text        :description, :comment => "描述"
      t.references  :batch, :comment => "关联学期"
    # t.references  :fee_collection
      t.boolean     :is_deleted , :null => false ,:default => false, :comment => "是否删除"
      t.boolean     :is_master, :null => false ,:default => false, :comment => "是否是师傅"
      t.timestamps
    end
  end

  def self.down
    drop_table :finance_fee_categories
  end
end
