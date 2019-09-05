curl -Lf http://softleader-config-server:8888/health
retval=$?

if test "$retval" != "0"; then
	END=$(awk -v min=3 -v max=10 'BEGIN{srand(); print int(min+rand()*(max-min+1))}')
    echo "shutting down in $END secs..."
    for i in $(seq $END);
    do
      sleep 1
      # 由於 alpine 的 seq 只能從小到大,  所以這邊用減的
      echo $(($END - $i))
    done
   exit $retval
fi

exit 0