SRC_DIR=source

FOUNDRY_DIR = ../..
PRODUCTION_DIR = ${FOUNDRY_DIR}/scripts
DEVELOPMENT_DIR = ${FOUNDRY_DIR}/scripts_
MODULARIZE = ${FOUNDRY_DIR}/build/modularize
UGLIFY = uglifyjs --unsafe -nc
UGLIFYCSS = uglifycss

all: premake body min

premake:
	mkdir -p ${DEVELOPMENT_DIR}/ui/stars
	mkdir -p ${PRODUCTION_DIR}/ui/stars

body:
	${MODULARIZE} -jq -n "ui/stars" -d "ui/core,ui/widget" -css "ui/stars/default" ui.stars.js > ${DEVELOPMENT_DIR}/ui/stars.js
	cp ui.stars.css ${DEVELOPMENT_DIR}/ui/stars/default.css
	cp ui.stars.gif ${DEVELOPMENT_DIR}/ui/stars/ui.stars.gif

min:
	${UGLIFY} ${DEVELOPMENT_DIR}/ui/stars.js > ${PRODUCTION_DIR}/ui/stars.js
	${UGLIFYCSS} ui.stars.css > ${PRODUCTION_DIR}/ui/stars/default.css
	cp ui.stars.gif ${PRODUCTION_DIR}/ui/stars/ui.stars.gif

