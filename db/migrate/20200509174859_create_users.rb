class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :spending_total_all_credit_cards_monthly

      t.timestamps
    end
  end
end
