class CreateUsers < ActiveRecord::Migration[6.0] # ou sua versão do Rails
  def change
    create_table :users do |t|
      t.string :email, null: false, default: ""
      t.string :first_name, null: false, default: ""
      t.string :last_name, null: false, default: ""
      t.string :password_digest, null: false, default: ""

      t.timestamps
    end

    add_index :users, :email, unique: true # garante unicidade do email
  end
end
