# js_of_ocaml exercices: Ex05 - Project 1

Create the [Materialize Starter
Template](http://materializecss.com/templates/starter-template/preview.html) in
OCaml.

## A concrete OCaml page using js_of_ocaml

In this exercice, which is a first concrete project, we will *exactly* reimplement the DOM
of the Start Template from Materialize.

We begin with an 'empty' index.html page which is:

```
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<script type="text/javascript" src="js/ex05.js"></script>
</body>
</html>
```

You will learn how to:
* Create HTML element.
* Change and create HTML element attributes.
* Append an HTML element as a child to another.
* Change the page title.
* Change meta informations.
* Create new HTML element with Dom_html.document##createElement

## Try it

* We provide an index.html in the src directory and ml file containing the code.
* Use
```
make
```
to compile the ml file into a javascript file.
* Run index.html in your web browser.

You can also try your own code in a toplevel developed by the Ocsigen team.
Available [here](http://ocsigen.org/js_of_ocaml/2.7/files/toplevel/).
