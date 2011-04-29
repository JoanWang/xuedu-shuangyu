#财经费用集
class CreateFinanceFeeCollections < ActiveRecord::Migration
  def self.up
    create_table :finance_fee_collections do |t|
      t.string     :name, :comment => "名称"
      t.date       :start_date, :comment => "开始时间"
      t.date       :end_date, :comment => "结束时间"
      t.date       :due_date, :comment => "到期时间"
      t.references :fee_category, :comment => "关联费用类别"
      t.references :batch, :comment => "关联学期"
      t.boolean    :is_deleted, :null => false, :default => false, :comment => "是否删除"
    end
  end

  def self.down
    drop_table :finance_fee_collections
  end
end
