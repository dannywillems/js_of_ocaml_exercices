# js_of_ocaml exercices: Ex04

Add dynamically html nodes such as paragraph or div.

## More about the Dom_html module

A powerful aspect of using ocaml to develop website is to use the ocaml type system.

## Let's take a look to javascript capabilities

Javascript provides some functions to create node elements such as *document.createElement(element_name)* and you can add children nodes with the
*appendChild* method on the returned object by *document.createElement* method.
You can also access to the node attributes, change the inner html, insert an
element before, etc. The full Javascript documentation can be found
[here](http://www.w3schools.com/jsref/dom_obj_all.asp).
With these methods on *element* objects, you can manipulate the DOM directly in
Javascript and can generate the entire html code with Javascript.

## The OCaml bindings

It's very easy to use js_of_ocaml to do the same in OCaml.

You can create a paragraph and it to the body as a child by using
```OCaml
let doc = Dom_html.document in
let p1 = Dom_html.createP doc in
Dom.appendChild doc##body p1
```

Each HTML element can be created with a function from the Dom_html module. For
example, an input element is created with *Dom_html.createInput* and has class type
*Dom_html.inputElement*, a paragraph with *Dom_html.createP* and class type *Dom_html.paragraphElement*,
etc.

Types such as *Dom_html.paragraphElement* inherits from *Dom_html.element* which inherits
*Dom.node* class type.
This inheritance allows to add a default value to an *Dom_html.inputElement* but not to a
*Dom_hmtl.paragraphElement*.

The class type *Dom_html.element* contains an *id* method to set an id to the
element and it's a *Js.js_string Js.t Js.prop* type.
You also have *className* method to modify the class attribute.
You can also change the inner html with the *innerHTML* method.

For example:
```OCaml
let doc = Dom_html.document in
let p1 = Dom_html.createP doc in
p1##id <- (Js.string "hello");
p1##innerHTML <- (Js.string "Hello world");
Dom.appendChild doc##body p1
```

See [the full
documentation](http://ocsigen.org/js_of_ocaml/2.7/api/Dom_html.element-c) to
know the entire list of methods you can use. In general, the name is the same
than in Javascript.

## The DOM is not typed !

js_of_ocaml is only a compiler from OCaml to Javascript. It doesn't check if you
respect the W3C standards. You must use
[Eliom](http://ocsigen.org/eliom/5.0/manual/clientserver-html) to do that.

For example, the following code compile

```OCaml
let doc = Dom_html.document in
let p = Dom_html.createP doc in
let link = Dom_html.createAnchor doc in (* 'a' tag *)
Dom.appendChild a p
```

But it isn't allowed by the W3C standards because a block tag can be the child of an inline tag. Same with

```OCaml
let doc = Dom_html.document in
let p1 = Dom_html.createP doc in
let p2 = Dom_html.createP doc in
Dom.appendChild p1 p2
```
which isn't allowed by the W3C standards because a paragraph can't be inside
another paragraph.

It compiles because the Dom.appendChild signature is
```OCaml
method appendChild : node Js.t -> node Js.t Js.meth
```
and you can pass it any *Dom.node.element* type.

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
