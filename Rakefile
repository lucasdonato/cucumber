require "time"

task :specs, [:tags, :browser, :ambiente] do |task, args|

  time = Time.now.utc.iso8601.tr(":", "")
  #para rodar o relatorio no jenkins
  #o formato tem que ser json
  report = "--format html --out=log/report_#{time}.html"
  sh "cucumber #{args[:tags]} #{report} #{args[:browser]} #{args[:ambiente]}"

end
