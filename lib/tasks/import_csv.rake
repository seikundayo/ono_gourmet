require "import.rb"

namespace :import_csv do
      desc "shop_data.csvをインポートするタスク"

      task shop_data: :environment do
        list = Import.csv_data(path: "db/csv_data/shop_data.csv")

        puts "インポート処理を開始"
        begin
          Shop.create!(list)
          puts "インポート完了!!"
        rescue ActiveModel::UnknownAttributeError => invalid
          puts "インポートに失敗：UnknownAttributeError"
        end
      end

      desc "topic_data.csvをインポートするタスク"

      task topic_data: :environment do
        list = Import.csv_data(path: "db/csv_data/topic_data.csv")

        puts "インポート処理を開始"
        begin
          Topic.create!(list)
          puts "インポート完了!!"
        rescue ActiveModel::UnknownAttributeError => invalid
          puts "インポートに失敗：UnknownAttributeError"
        end
      end

    end
