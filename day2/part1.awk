{
    if ($1 == "forward") { h+=$2 }
    else if ($1 == "down") { d+=$2 }
    else if ($1 == "up") { d-=$2 }
}
END { print h*d }
