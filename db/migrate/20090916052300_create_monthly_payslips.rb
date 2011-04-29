#月工资
class CreateMonthlyPayslips < ActiveRecord::Migration
  def self.up
    create_table :monthly_payslips do |t|
      t.date     :salary_date, :comment => "发工资日期"
      t.references :employee, :comment => "关联职员"
      t.references :payroll_category, :comment => "关联工作类别"
      t.string     :amount, :comment => "数目"
      t.boolean   :is_approved,:null => false, :default => false, :comment => "是否批准"
      t.references   :approver, :comment => "关联上级"
    end
  end

  def self.down
    drop_table :monthly_payslips
  end
end
