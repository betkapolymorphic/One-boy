
require 'image'
a = Image.where("id <100")
file = File.open('text', 'w')
a.each do |x|
	file.puts ["Category.create(","colortype=>",x.colortype,",colortype1=>",x.colortype1,",colortype2=>",
	x.colortype2,",colortype3=>",x.colortype3,",colortype4=>",x.colortype4,")"].split('')

end
