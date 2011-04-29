#职员详细信息存档
class CreateArchivedEmployeeAdditionalDetails < ActiveRecord::Migration
  def self.up
    create_table :archived_employee_additional_details do |t|
      t.references :employee, :comment => "关联职员"
      t.references :additional_field, :comment => "关联新增领域"
      t.string     :additional_info, :comment => "详细信息"
    end
  end

  def self.down
    drop_table :archived_employee_additional_details
  end
end
