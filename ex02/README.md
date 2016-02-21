# js_of_ocaml exercices: Ex02

An alert box with *Hello world*

## The *window* object

In the previous exercice, we see how to manipulate basically the HTML document by
modifying the page title.
Now, we will see the *window* object.

In OCaml, it's represented in the **Dom_html** module and it's implemented as a
*window* class type. See the full documentation and methods associated to
[here](https://ocsigen.org/js_of_ocaml/2.7/api/Dom_html.window-c).

## Show an alert

We can access to the basic *alert* javascript method by using
```
Dom_html.window##alert
```

This method takes a *Js.string Js.t* value. We can call it by using
```
Dom_html.window##alert (Js.string "Hello world")
```

It results an alert box with *Hello world*.

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
