namespace :seed do
  desc 'Generate an empty seed file, Usage => rake seed:create seed_name'
  task create: :environment do
    argument = ARGV[1]
    argument = "#{ARGV[1]}" if argument.present?
    FileUtils.mkdir_p 'db/seeds'
    # seed_path = "db/seeds/#{Time.now.to_i}#{argument}_seed.rb"
    seed_path = "db/seeds/#{argument}_seed.rb"
    FileUtils.touch(seed_path)
    exit
  end
end

namespace :db do
  namespace :seed do
    Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].each do |filename|
      task_name = File.basename(filename, '.rb').intern

      task task_name => :environment do
        load(filename)
      end
    end

    task all: :environment do
      Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each do |filename|
        load(filename)
      end
    end
  end
end
