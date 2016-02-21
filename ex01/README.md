# js_of_ocaml exercices: Ex01

Modify the title of an HTML page.

## How data are represented ?

The ocsigen page explains how they implemented it, read first [this
page](https://ocsigen.org/js_of_ocaml/2.7/manual/library).

To more information about *phantom_types*, see [this article from
Jane_Street](https://blogs.janestreet.com/howto-static-access-control-using-phantom-types/).

## The DOM representation for js_of_ocaml

The HTML DOM is represented in a module named **Dom_html**.
This module contains class type to describe an event, an HTML element,...
The js_of_ocaml library uses subtyping to represent HTML element.

The *document* element of an HTML page is represented by a class type named
**document** contained in the **Dom_html** module.

You can get it by using the function *document* in the *Dom_html* module:

```
let doc = Dom_html.document
```

The return type is a *document Js.t* object. This class type contained methods to
modify the title page, the body element, the head element and others methods.
See the full documentation
[here](https://ocsigen.org/js_of_ocaml/2.7/api/Dom_html.document-c).

The *title* method takes a *Js.string Js.t* value and allows us to modify the page title by using

```
doc##title <- Js.string "Hello world from the ml file"
```

# Try it

An *index.html* is given with a ml files into the ml directory. Run
```
make
```
and run the index.html file into a web browser: the page title has changed !
