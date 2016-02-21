################################################################################
########################### Variables to change ################################
##### Directory where ml files are
ML_DIR				=	ml
##### ml files to compile into js. All files will be compiled at the same time.
##### Don't forget to add $(ML_DIR) before the filename.
ML_FILES 			=	$(ML_DIR)/ex01.ml

##### Directory where the output js file must be put in
JS_OUTPUT_DIR		=	js
##### The output js filename
JS_OUTPUT_FILE		=	ex01.js

##### If you want to compile with some packages, add in this variable with
##### -package prefix.
CUSTOM_PACKAGE		=

##### If you want to compile with some syntax, add in this variable with
##### -syntax prefix.
CUSTOM_SYNTAX		=
################################################################################

################################################################################
############################### Variables ######################################
##### You don't need to change it.
TMP_OUT_BYTECODE	=	out.byte
BASIC_PACKAGE		=	-package js_of_ocaml -package js_of_ocaml.syntax
BASIC_SYNTAX		=	-syntax camlp4o
CC_BYTECODE			=	ocamlfind ocamlc $(BASIC_PACKAGE) $(CUSTOM_PACKAGE) \
						$(BASIC_SYNTAX) $(CUSTOM_SYNTAX) -linkpkg \
					 	-o $(TMP_OUT_BYTECODE)
CC_JS				=	js_of_ocaml -o $(JS_OUTPUT_DIR)/$(JS_OUTPUT_FILE)
CMO_FILES			=	$(patsubst $(ML_DIR)/%.ml, $(ML_DIR)/%.cmo, $(ML_FILES))
CMI_FILES			=	$(patsubst $(ML_DIR)/%.ml, $(ML_DIR)/%.cmi, $(ML_FILES))
################################################################################

################################################################################
################################## Rules #######################################
all: check_dir js_of_ocaml

check_dir:
	if [ ! -d $(JS_OUTPUT_DIR) ]; then mkdir $(JS_OUTPUT_DIR); fi;

js_of_ocaml:
	$(CC_BYTECODE) $(ML_FILES)
	$(CC_JS) $(TMP_OUT_BYTECODE)

clean:
	$(RM) $(TMP_OUT_BYTECODE) $(CMO_FILES) $(CMI_FILES)

fclean: clean
	# Don't remove the entire JS_OUTPUT_DIR.
	$(RM) $(JS_OUTPUT_DIR)/$(JS_OUTPUT_FILE)

re: fclean all
################################################################################