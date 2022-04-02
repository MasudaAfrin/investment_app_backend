class CreateCampaigns < ActiveRecord::Migration[6.1]
  def change
    create_table :campaigns do |t|
      t.string :name, null: false
      t.decimal :percentage_raised, precision: 10, scale: 2, default: 0
      t.decimal :target_amount, precision: 10, scale: 2, default: 0
      t.decimal :investment_multiple, precision: 4, scale: 2, default: 1
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.references :country, null: false, foreign_key: true
      t.references :sector, null: false, foreign_key: true
      t.timestamps
    end
  end
end
