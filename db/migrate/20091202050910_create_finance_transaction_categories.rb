#金融转换类别
class CreateFinanceTransactionCategories < ActiveRecord::Migration
  def self.up
    create_table :finance_transaction_categories do |t|
      t.string  :name, :comment => "姓名"
      t.string  :description, :comment => "描述"
      t.boolean :is_income, :comment => "是否是收入"
      t.boolean :deleted, :null => false, :default => false, :comment => "是否删除"
    end
    create_defaults
  end

  def self.down
    drop_table :finance_transaction_categories
  end

  def self.create_defaults
    FinanceTransactionCategory.create(:name => 'Salary', :description => ' ', :is_income => false)
    FinanceTransactionCategory.create(:name => 'Donation', :description => ' ', :is_income => true)
    FinanceTransactionCategory.create(:name => 'Fee', :description => ' ', :is_income => true)
  end
end
