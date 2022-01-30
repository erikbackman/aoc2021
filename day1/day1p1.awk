{ if (NR!=1 && $0 > p) s++; p = $0 } END { print s }
