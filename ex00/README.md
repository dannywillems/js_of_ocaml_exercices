# js_of_ocaml exercices: Ex00

## Prerequisites
First, install js_of_ocaml with [OPAM](https://opam.ocaml.org/):
```Shell
opam install js_of_ocaml
```
## Compile your ml files in Javascript scripts.

As said on the official website, the javascript compiler takes as input code an
ocaml bytecode, allowing to use existing ocaml libraries.

The first step is to compile your ml files in bytecode (*ocamlc* compiler). For that, we will use
the js_of_ocaml package and ocamlfind to simplify. Js_of_ocaml (version <= 2.6)
uses also camlp4 (ppx since version >= 2.7), so we need to add the -syntax
option. The ppx syntax is provided as a package by -package js_of_ocaml.ppx

For ppx (js_of_ocaml >= 2.7), it's
```Shell
ocamlfind ocamlc -package js_of_ocaml -package js_of_ocaml.ppx -linkpkg [files.ml]
```
where [files.ml] are your ocaml files

If you want to use camlp4 (js_of_ocaml <= 2.6, **DEPRECATED, USE PPX**), you have to use

```Shell
ocamlfind ocamlc -package js_of_ocaml -package js_of_ocaml.syntax -syntax camlp4o -linkpkg [files.ml]
```
where [files.ml] are your ocaml files

It outputs an *out.byte* file which is the ocaml bytecode resulting from the
compilation. Now, we can use the *js_of_ocaml* compiler to get our Javascript
file.

The compiler takes the ocaml bytecode file as input and we can specify the
output filename we want with the *-o* option.

```Shell
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

This Makefile allows you to write your ml files in a ml directory (or anything
else) and outputs the javascript file in a js directory (or anything else). It
also allows you to clean the files generated during ocaml compilation.

To use it, add your ml files in the *ML_FILES* variable and type
```Shell
make
```

To remove cmo and cmi generated files during bytecode generation and the
bytecode (*out.byte* by default, you can change it) file, use
```Shell
make clean
```

And to remove the js files (with cmo and cmi), use
```Shell
make fclean
```

A *re* target does
```Shell
make fclean && make
```

If you use additional package, you can add them in the *CUSTOM_PACKAGE*
variable with the prefix *-package*. Same if you use additional syntax in
*CUSTOM_SYNTAX* variable with the prefix *-syntax*.
