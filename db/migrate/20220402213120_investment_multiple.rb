class InvestmentMultiple < ActiveRecord::Migration[6.1]
  def change
    change_column :campaigns, :investment_multiple, :decimal, precision: 10, scale: 2
  end
end
