var p1:
	set = __set
var p2:
	set = __set,
	get = __get
var p3:
	get = __get
var p4:
	get = __get,
	set = __set  # TODO: add newline after to trigger stability failure
var p5 = 1:
	set = __set
var p6 = 1:
	set = __set,
	get = __get
var p7 = 1:
	get = __get
var p8 = 1:
	get = __get,
	set = __set  # TODO:
var p9: int:
	set = __set
var p10: int:
	set = __set,
	get = __get
var p11: int:
	get = __get
var p12: int:
	get = __get,
	set = __set  # TODO:
var p13: int = 1:
	set = __set
var p14: int = 1:
	set = __set,
	get = __get
var p15: int = 1:
	get = __get
var p16: int = 1:
	get = __get,
	set = __set  # TODO:
var p17 := 1:
	set = __set
var p18 := 1:
	set = __set,
	get = __get
var p19 := 1:
	get = __get
var p20 := 1:
	get = __get,
	set = __set


func __get():
	return 1


func __set(v):
	pass
