include ../../build/modules.mk

all: premake body min

premake:
	mkdir -p ${DEVELOPMENT_DIR}/ui/stars/
	mkdir -p ${DEVELOPMENT_DIR}/ui/stars/images/
	mkdir -p ${DEVELOPMENT_DIR}/ui/stars/style/
	mkdir -p ${PRODUCTION_DIR}/ui/stars
	mkdir -p ${PRODUCTION_DIR}/ui/stars/images/
	mkdir -p ${PRODUCTION_DIR}/ui/stars/style/
body:
	${MODULARIZE} -jq -n "ui/stars" -d "ui/core,ui/widget" -css "ui/stars/style/ui.stars" ui.stars.js > ${DEVELOPMENT_DIR}/ui/stars.js
	cp style/ui.stars.css ${DEVELOPMENT_DIR}/ui/stars/style/ui.stars.css
	cp -r images ${DEVELOPMENT_DIR}/ui/stars/

min:
	${UGLIFYJS} ${DEVELOPMENT_DIR}/ui/stars.js > ${PRODUCTION_DIR}/ui/stars.js
	${UGLIFYCSS} style/ui.stars.css > ${PRODUCTION_DIR}/ui/stars/style/ui.stars.css
	cp -r images ${PRODUCTION_DIR}/ui/stars/

clean:
	rm -fr ${DEVELOPMENT_DIR}/ui/stars
	rm -fr ${PRODUCTION_DIR}/ui/stars
	rm -fr ${DEVELOPMENT_DIR}/ui/stars.js
	rm -fr ${PRODUCTION_DIR}/ui/stars.js
