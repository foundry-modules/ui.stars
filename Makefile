all: modularize-script minify-script convert-style lessify-style copy-assets

include ../../build/modules.mk

MODULE = ui/stars
MODULARIZE_OPTIONS = -d "ui/core,ui/widget"

SOURCE_SCRIPT_FOLDER = .
SOURCE_SCRIPT_FILE_PREFIX = 
SOURCE_SCRIPT_FILE_NAME = ui.stars

SOURCE_STYLE_FOLDER = style
SOURCE_STYLE_FILE_PREFIX = 
SOURCE_STYLE_FILE_NAME = ui.stars

TARGET_STYLE_FOLDER = ${FOUNDRY_STYLES_FOLDER}/ui
TARGET_STYLE_FILE_NAME = stars
TARGET_STYLE_CONVERTER = sed 's/url(..\/images/url(images/g'
TARGET_STYLE_LESS_CONVERTER = sed 's/url(..\/images/url(@{foundry_uri}\/ui\/images/g'

SOURCE_ASSET_FILES = images/*.*
TARGET_ASSET_FOLDER_NAME = images