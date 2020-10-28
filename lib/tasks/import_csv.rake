require "import.rb"

namespace :import_csv do
      desc "shop_data.csvをインポートするタスク"

      task shop_data: :environment do
        list = Import.csv_data(path: "db/csv_data/shop_data2.csv")

        puts "インポート処理を開始"
        begin
          Shop.first_or_create!(list)
          puts "インポート完了!!"
        rescue ActiveModel::UnknownAttributeError => invalid
          puts "インポートに失敗：UnknownAttributeError"
        end
      end

      desc "admin_data.csvをインポートするタスク"

      task admin_data: :environment do
        list = Import.csv_data(path: "db/csv_data/admin_data.csv")

        puts "インポート処理を開始"
        begin
          Admin.first_or_create!(list)
          puts "インポート完了!!"
        rescue ActiveModel::UnknownAttributeError => invalid
          puts "インポートに失敗：UnknownAttributeError"
        end
      end

    end
