#财经费用
class CreateFinanceFees < ActiveRecord::Migration
  def self.up
    create_table :finance_fees do |t|
      t.references :fee_collection, :comment => "费用集"
      t.references :transaction, :comment => "关联交易"
      t.references :student, :comment => "关联学生"
    end
  end

  def self.down
    drop_table :finance_fees
  end
end
