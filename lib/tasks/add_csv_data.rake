namespace :add_csv_data do
  desc 'csvデータをデータベースに追加する'
  task add_csv_data: :environment do
    require 'import_csv'

    ImportCsv.execute(model: Genre)
    ImportCsv.execute(model: Food)
  end
end
