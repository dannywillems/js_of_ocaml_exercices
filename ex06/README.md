# js_of_ocaml exercices: Ex06

Event handler: execute code when page is loaded.

##

Since the first exercice, we put our javascript into the *head* tag or in the
body, depending on the behavior of our script.

For example, when we would like to show an alert box in the
[Ex02](https://github.com/dannywillems/js_of_ocaml_exercices/tree/master/ex02),
we insert the script in the body.
In the
[Ex01](https://github.com/dannywillems/js_of_ocaml_exercices/tree/master/ex01),
we insert the script in the head.

The place you insert your javascript code is important. In fact, the script is
executed in the order encountered in the page.

In the
[Ex02](https://github.com/dannywillems/js_of_ocaml_exercices/tree/master/ex02),
the script is executed at the end of the body but in the [Ex01](https://github.com/dannywillems/js_of_ocaml_exercices/tree/master/ex01), the script is executed before the body loading.

Another example is in the
[Ex04](https://github.com/dannywillems/js_of_ocaml_exercices/tree/master/ex04)
when we want to add some HTML tag into the body.
We inserted the ex04.js script at the end of the body, and not in the head.
Here, it's very important because if we insert in the head, the body is not yet
defined and nothing is appended in the body. **TRY IT !**

For more informations about this subject, see [this answer on
StackOverflow](http://stackoverflow.com/questions/8996852/load-and-execute-order-of-scripts).

## The onload event

We would like to execute our script when the page is loaded, eg when the
entiere html page has been parsed.

We can handle the event 'the page is loaded' with the event handle *window.onload* in
Javascript.

The method *onload* of the *window* global object can be accessed in OCaml with
```OCaml
Dom_html.window##.onload
```

This method has the signature
```OCaml
method onload : (window Js.t, event Js.t) event_listener Js.prop
```
which can be found
[here](https://ocsigen.org/js_of_ocaml/2.7/api/Dom_html.window-c)

The *('a, 'b) event_listener* type is an alias for a *('a, 'b) Dom.event_listener* and the official documentation (found [here](https://ocsigen.org/js_of_ocaml/2.7/api/Dom_html#TYPEevent_listener)) says
```
The type of event listener functions. The first type parameter 'a is the type of
the target object; the second parameter 'b is the type of the event object.
```

We will create an handler for the onload event. A handler can be created with
the *Dom_html.handler* function. This function has the signature:
```OCaml
val handler : ((#event as 'b) Js.t -> bool Js.t) -> ('a, 'b Js.t) event_listener
```
It takes a function taking an *#event Js.t* and returning a boolean value, and
returns an event_listener.
The documentation can be found
[here](https://ocsigen.org/js_of_ocaml/2.7/api/Dom_html) in the *Event handlers*
section.

We will describe later in more details how events work.

For now, we will use this
```OCaml
let onload _ =
	(* Some code we want to be executed when the page is loaded *)
	Js._false

let _ =
	Dom_html.window##.onload := Dom.handler onload
```

## An example

Now, we can insert the script *ex04.js* from the [Ex04](https://github.com/dannywillems/js_of_ocaml_exercices/tree/master/ex04) in the head.

Here the index.html file
```HTML
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<script type="text/javascript" src="ex06.js"></script>
	<title>Ex06: modify the dom</title>
</head>
<body>
</body>
</html>
```

and the ex06.ml

```OCaml
let doc = Dom_html.document

let onload _ =
	let h1 = Dom_html.createH1 doc in
	h1##.innerHTML := (Js.string "The page has been loaded and I was added after")
	Dom.appendChild doc##.body h1

let _ = Dom_html.window##.onload := Dom_html.handler onload
```

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
