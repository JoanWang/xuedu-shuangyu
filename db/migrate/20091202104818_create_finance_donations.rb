#财政捐赠
class CreateFinanceDonations < ActiveRecord::Migration
  def self.up
    create_table :finance_donations do |t|
      t.string     :donor, :comment => "捐助"
      t.string     :description, :comment => "描述"
      t.decimal    :amount, :precision => 12, :scale => 2, :comment => "数量"
      t.references :transaction, :comment => "关联交易"
      t.timestamps
    end
  end

  def self.down
    drop_table :finance_donations
  end
end
