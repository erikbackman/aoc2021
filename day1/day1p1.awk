NR==1{ next } { s+=($0>p);p=$0 } END { print s }
