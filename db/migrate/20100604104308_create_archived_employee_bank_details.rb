#职员银行信息
class CreateArchivedEmployeeBankDetails < ActiveRecord::Migration
  def self.up
    create_table :archived_employee_bank_details do |t|
      t.references :employee, :comment => "关联职员"
      t.references :bank_field, :comment => "关联银行领域"
      t.string      :bank_info, :comment => "银行信息"
    end
  end

  def self.down
    drop_table :archived_employee_bank_details
  end
end
