#金融交易
class CreateFinanceTransactions < ActiveRecord::Migration
  def self.up
    create_table :finance_transactions do |t|
      t.string     :title, :comment => "标题"
      t.string     :description, :comment => "描述"
      t.decimal    :amount, :precision => 8, :scale => 2, :comment => "数量"
      t.boolean    :fine_included, :default => false, :comment => "是否包含"
      t.references :category, :comment => "关联类别"
      t.references :student, :comment => "关联学生"
      t.references :finance_fees, :comment => "财经费用"
      t.timestamps
    end
  end

  def self.down
    drop_table :finance_transactions
  end
end
