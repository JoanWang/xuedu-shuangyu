#财经交易触发器
class CreateFinanceTransactionTriggers < ActiveRecord::Migration
  def self.up
    create_table :finance_transaction_triggers do |t|
      t.references :finance_category, :comment => "财经类别"
      t.decimal    :percentage, :precision => 8, :scale => 2, :comment => "百分比"
      t.string     :title, :comment => "标题"
      t.string     :description, :comment => "描述"
    end
  end

  def self.down
    drop_table :finance_transaction_triggers
  end
end
