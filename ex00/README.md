# js_of_ocaml exerices: Ex00

## Prerequisites
First, install js_of_ocaml with [OPAM](https://opam.ocaml.org/):
```
opam install js_of_ocaml
```

## Compile your ml files into Javascript scripts.

As said on the official website, the javascript compiler takes as input code an 
ocaml bytecode, allowing to use existing ocaml libraries.


The first step is to compile your ml files into bytecode (*ocamlc* compiler). For that, we will use
the js_of_ocaml package and ocamlfind to simplify. Js_of_ocaml (version <= 2.6)
uses also camlp4 (ppx since version >= 2.7), so we need to add the -syntax
option.

We have

```
ocamlfind ocamlc -package js_of_ocaml -package js_of_ocaml.syntax -syntax
camlp4o -linkpkg [files.ml]
```
where [files.ml] are your ocaml files.

It outputs an *out.byte* file which is the ocaml bytecode resulting from the
compilation. Now, we can use the *js_of_ocaml* compiler to get our Javascript
file.

The compiler takes the ocaml bytecode file as input and we can specify the
output filename we want with the *-o* option.

```
js_of_ocaml [-o outputfile.js] out.byte
```

Now, we have our Javascript file we can include as a normal Javascript file!


## Automate everything with a Makefile.

It could be interesting to have an automated way to compile our ml files. I
propose to use a Makefile I did (see [this
repository](https://github.com/dannywillems/Makefiles) for other useful
Makefiles).

You can find the Makefile [at this
adress](https://github.com/dannywillems/Makefiles/blob/master/Makefile.js.of.ocaml).

This Makefile allows you to write your ml files into a ml directory (or anything
else) and outputs the javascript file into a js directory (or anything else). It
also allows you to clean the files generated during ocaml compilation.

To use it, add your ml files into the *ML_FILES* variable and type
```
make
```

To remove cmo and cmi generated file during bytecode generation and the bytecode
file, use
```
make clean
```

And to remove the js files (with cmo and cmi), use
```
make fclean
```

A *re* target does
```
make fclean && make
```

If you use additional package, you can add them into the *CUSTOM_PACKAGE*
variable with the prefix *-package*. Same if you use additional syntax into
*CUSTOM_SYNTAX* variable with the prefix *-syntax*.
