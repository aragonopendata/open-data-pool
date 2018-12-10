mkdir -p ./VistasXml/VistasCompletas/
echo '<?xml version="1.0" encoding="UTF-8" ?><root>'$(cat ./VistasXml/Vista20/Vista_20_*.xml | sed -e 's/<?xml version="1.0" encoding="UTF-8" ?><root>//g' | sed -e 's/<\/root>//g')'</root>' >  ./VistasXml/VistasCompletas/Vista20_completa.xml
echo '<?xml version="1.0" encoding="UTF-8" ?><root>'$(cat ./VistasXml/Vista26/Vista_26_*.xml | sed -e 's/<?xml version="1.0" encoding="UTF-8" ?><root>//g' | sed -e 's/<\/root>//g')'</root>' >  ./VistasXml/VistasCompletas/Vista26_completa.xml
echo '<?xml version="1.0" encoding="UTF-8" ?><root>'$(cat ./VistasXml/Vista150/Vista_150_*.xml | sed -e 's/<?xml version="1.0" encoding="UTF-8" ?><root>//g' | sed -e 's/<\/root>//g')'</root>' >  ./VistasXml/VistasCompletas/Vista150_completa.xml

