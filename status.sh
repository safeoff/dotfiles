color () {
    if [ $1 -gt 99 ]; then
        printf "#[bg=red,fg=white]%s:99%s#[default]" $2 $3
    elif [ $1 -gt 69 ]; then
        printf "#[bg=red,fg=white]%s:%2d%s#[default]" $2 $1 $3
    elif [ $1 -gt 39 ]; then
        printf "#[bg=yellow]%s:%2d%s#[default]" $2 $1 $3
    else
        printf "%s%2d%s" $2 $1 $3
    fi    
}

if $(uname -r | grep -q Microsoft); then
    tail -2 ~/typeperf.log | while IFS=, read _ c m d g
    do
        c=${c#\"}
        c=${c%.*}
        m=${m#\"}
        m=${m%.*}
        m=$(((12000-m)/120))
        d=${d#\"}
        d=${d%.*}
        g=${g#\"}
        g=${g%.*}
        g=$((g/1))
        echo "$(color $c CPU: %) :$(ghz $g GHz) | $(color $m MEM: %) | $(color $d I/O: %)"
    done
else
    vmstat 1 2 | tail -1 | while read _ _ _ m1 _ m2 _ _ _ _ _ _ c1 c2 _ d _
    do
        m=$((m1 + m2))
        m=$(((16000000-m)/160000))
        c=$((c1 + c2))
        echo "$(color $c CPU: %) | $(color $m MEM: %) | $(color $d I/O: %)"
    done
fi
