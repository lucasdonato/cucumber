require "time"

task :specs, [:tags, :browser, :ambiente] do |task, args|

  time = Time.now.utc.iso8601.tr(":", "")
  #report = "--format html --out=log/report_#{time}.html"
  report = "" #descomentar linha de cima para gerar relatório
  sh "cucumber #{args[:tags]} #{report} #{args[:browser]} #{args[:ambiente]}"

end
