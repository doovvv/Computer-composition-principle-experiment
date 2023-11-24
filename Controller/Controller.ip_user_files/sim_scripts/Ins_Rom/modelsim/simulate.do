onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.Ins_Rom xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {Ins_Rom.udo}

run -all

quit -force
