#个人工资类别
class CreateIndividualPayslipCategories < ActiveRecord::Migration
  def self.up
    create_table :individual_payslip_categories do |t|
      t.references :employee, :comment => "关联职员"
      t.date       :salary_date, :comment => "发工资日期"
      t.string     :name, :comment => "名称"
      t.string     :amount, :comment => "数目"
      t.boolean    :is_deduction, :comment => "是否扣除"
      t.boolean    :include_every_month, :comment => "是否包含每个月"
    end
  end

  def self.down
    drop_table :individual_payslip_categories
  end
end
