#监护人
class CreateGuardians < ActiveRecord::Migration
  def self.up
    create_table :guardians do |t|
      t.references :ward, :comment => "关联ward(学生id)"
      t.string     :first_name, :comment => "姓氏"
      t.string     :last_name, :comment => "名字"
      t.string     :relation, :comment => "关系"

      t.string     :email, :comment => "email"
      t.string     :office_phone1, :comment => "办公电话1"
      t.string     :office_phone2, :comment => "办公电话2"
      t.string     :mobile_phone, :comment => "手机"

      t.string     :office_address_line1, :comment => "公司地址1"
      t.string     :office_address_line2, :comment => "公司地址2"
      t.string     :city, :comment => "城市"
      t.string     :state, :comment => "洲"
      t.references :country, :comment => "国家"

      t.date       :dob, :comment => "dob"
      t.string     :occupation, :comment => "职业"
      t.string     :income, :comment => "收入"
      t.string     :education, :comment => "教育程度"

      t.timestamps
    end
  end

  def self.down
    drop_table :guardians
  end
end
