def dev_report
	devs = []
	DEV_HASH.each_pair{|key, dev|
		if dev[:timespent] && dev[:timespent].to_f > 0
			devs << [key, dev[:timespent], dev[:original], dev[:original] > 0 ? (dev[:timespent] * 100 / dev[:original]) : 0, dev[:stories], dev[:tasks], dev[:bugs]]
		end
	}
	puts "\nDeveloper Efficiency (Closed Tasks - defaults to 100% efficiency if timespent data isn't provided)"
	devs.sort_by{|dev| dev[3]}.each{|dev|
		puts "  #{dev[0]}: #{dev[3]}% (#{(dev[1].to_f / 3600).round(0)} actual hours / #{(dev[2].to_f / 3600).round(0)} estimated) [Closed Stories: #{dev[4]}  Closed Tasks: #{dev[5]}  Bugs: #{dev[6]}]"
	}

	puts "\n\n"
end