#工资类别
class CreatePayrollCategories < ActiveRecord::Migration
  def self.up
    create_table :payroll_categories do |t|
      t.string :name, :comment => "名称"
      t.float  :percentage, :comment => "比例"
      t.references :payroll_category, :comment => "关联工资类别"
      t.boolean :is_deduction, :comment => "是否扣除"
      t.boolean :status, :comment => "状态"
    end
  end

  def self.down
    drop_table :payroll_categories
  end
end
