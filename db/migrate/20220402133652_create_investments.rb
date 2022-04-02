class CreateInvestments < ActiveRecord::Migration[6.1]
  def change
    create_table :investments do |t|
      t.decimal :amount, precision: 10, scale: 2, default: 0
      t.string :cheque_no
      t.string :guest_user_uid
      t.references :campaign, null: false, foreign_key: true
      t.timestamps
    end
  end
end
