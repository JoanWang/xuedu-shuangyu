#监护人信息存档
class CreateArchivedGuardians < ActiveRecord::Migration
  def self.up
    create_table :archived_guardians do |t|
      t.references :ward, :comment => "关联ward"
      t.string     :first_name, :comment => "姓"
      t.string     :last_name, :comment => "名"
      t.string     :relation, :comment => "与本人关系"

      t.string     :email, :comment => "email"
      t.string     :office_phone1, :comment => "办公电话1"
      t.string     :office_phone2, :comment => "办公电话2"
      t.string     :mobile_phone, :comment => "手机"

      t.string     :office_address_line1, :comment => "公司地址1"
      t.string     :office_address_line2, :comment => "公司地址2"
      t.string     :city, :comment => "城市"
      t.string     :state, :comment => "州"
      t.references :country, :comment => "国家"

      t.date       :dob, :comment => "时间"
      t.string     :occupation, :comment => "占用"
      t.string     :income, :comment => "收入"
      t.string     :education, :comment => "学历"

      t.timestamps
    end
  end

  def self.down
    drop_table :archived_guardians
  end
end
