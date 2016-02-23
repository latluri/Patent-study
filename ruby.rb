#!/usr/bin/env ruby
filenum = 0
outfile = "out_ " + filenum.to_s + ".xml"
out = File.open(outfile,'w')
split = '<?xml version="1.0" encoding="UTF-8"?>'
filelist = []
filelist << 'z1.txt'

for file in filelist

File.open(file,'r') do |infile|
	while line = infile.gets 
	if line.to_s =~ /<\?xml.*/
		out.close
		filenum +=1
		outfile = file + "_out_" +filenum.to_s + ".xml"	
		out = File.open(outfile,'w')
	end
		out.puts line
	end
end
end


out.close
