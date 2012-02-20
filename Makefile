SRC_DIR=source

FOUNDRY_DIR = ../..
PRODUCTION_DIR = ${FOUNDRY_DIR}/scripts
DEVELOPMENT_DIR = ${FOUNDRY_DIR}/scripts_
MODULARIZE = ${FOUNDRY_DIR}/build/modularize
UGLIFY = uglifyjs --unsafe -nc
UGLIFYCSS = uglifycss

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
	cp -r images ${DEVELOPMENT_DIR}/ui/stars/images

min:
	${UGLIFY} ${DEVELOPMENT_DIR}/ui/stars.js > ${PRODUCTION_DIR}/ui/stars.js
	${UGLIFYCSS} style/ui.stars.css > ${PRODUCTION_DIR}/ui/stars/style/ui.stars.css
	cp -r images ${PRODUCTION_DIR}/ui/stars/images

clean:
	rm -fr ${DEVELOPMENT_DIR}/ui/stars
	rm -fr ${PRODUCTION_DIR}/ui/stars
