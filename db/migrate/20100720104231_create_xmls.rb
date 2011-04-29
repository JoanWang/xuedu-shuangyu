#xml
class CreateXmls < ActiveRecord::Migration
  def self.up
    create_table :xmls do |t|
      t.string   :finance_name, :comment => "财经名称"
      t.string   :ledger_name, :comment => "总帐名称"
      t.timestamps
    end
    create_default
  end

  def self.down
    drop_table :xmls
  end

  def self.create_default
    Xml.create :finance_name =>"Salary", :ledger_name => ""
    Xml.create :finance_name =>"Fee", :ledger_name => ""
    Xml.create :finance_name =>"Donation", :ledger_name => ""
  end
end
