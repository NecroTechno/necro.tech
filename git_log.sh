[[ -d _data ]] || mkdir _data

git log \
    --pretty=format:'{%n  "commit": "%h",%n  "date": "%ad",%n  "message": "%f"%n},' \
    $@ | \
    perl -pe 'BEGIN{print "["}; END{print "]\n"}' | \
    perl -pe 's/},]/}]/' > _data/commits.json
