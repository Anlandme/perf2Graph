if [ $# -ne 2 ];then
	echo "Usage: Please specify the seconds and process PID!!!"
	exit 1
fi

perf record -p $2 -g -- sleep $1
perf script > out.perf

./stackcollapse-perf.pl out.perf > out.folded 
./flamegraph.pl out.folded > out.svg
