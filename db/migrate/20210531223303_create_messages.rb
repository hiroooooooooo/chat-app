class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      # 画像のみの送信もあり得るので、null: falseは設定しない。だと思う
      t.string  :content
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
