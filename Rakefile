require "time"

task :hello do
  puts "Hello Rake"
end

task :hello_name, [:name] do |task, args|
  puts "Hello " + args[:name]
end

task :specs, [:tags, :browser, :ambiente] do |task, args|

  time = Time.now.utc.iso8601.tr(":", "")
  report = "--format html --out=log/report_#{time}.html"
  #adicionado tag de ambiente
  sh "cucumber #{args[:tags]} #{report} #{args[:browser]} #{args[:ambiente]}"

end
