class AddEzCashTranidToTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :transactions, :ez_cash_tran_id, :integer
  end
end
