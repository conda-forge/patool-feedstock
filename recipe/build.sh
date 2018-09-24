#!/bin/sh

set -e -o pipefail -x

$PYTHON -m pip install . --no-deps --ignore-installed --no-cache-dir -vvv

mv $PREFIX/bin/patool $PREFIX/bin/patool_orig.py
echo '#!/bin/sh' > $PREFIX/bin/patool
echo >> $PREFIX/bin/patool
echo 'set -e -o pipefail' >> $PREFIX/bin/patool
echo -n "python $PREFIX/bin/patool_orig.py " >> $PREFIX/bin/patool
echo '"$@"' >> $PREFIX/bin/patool
chmod u+x $PREFIX/bin/patool
