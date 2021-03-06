# js_of_ocaml exercices: Ex03

Show a confirm box and get response.

## More about the *window* object

As said in the previous section, the *window* object is represented in the
**Dom_html** module and is implemented as a *window* class type. See the full
documentation and methods associated to
[here](https://ocsigen.org/js_of_ocaml/2.7/api/Dom_html.window-c).

We will use another *window* method which is *confirm*. The confirm is the
popup generated by *window.confirm* in Javascript.

Here the signature of Dom_html.window##confirm:
```OCaml
method confirm : Js.js_string Js.t -> bool Js.t Js.meth
```

The method takes a Js.js_string and return a *bool. Js.t Js.meth* value depending if the user
clicked on **OK** or **Cancel**. To have *bool* value from a *bool Js.t* value,
we use the *Js.to_bool* function.

## Show a confirm box

We begin by defining some variables:
```OCaml
let question =
  Js.string "Do you find this tutorial useful ?"
and answer_yes =
  Js.string "Oh great. We try to do our best. Don't hesitate to propose your own
  exercice!"
and answer_no =
  Js.string "Oh =(, why ? You can improve it if you want. Write a
  comment with why you don't find it useful."
in
```

We will show a different message according to the user choice.

```OCaml
let result = Dom_html.window##(confirm question) in
  Dom_html.window##(alert (if Js.to_bool result then answer_yes else
  answer_no))
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
