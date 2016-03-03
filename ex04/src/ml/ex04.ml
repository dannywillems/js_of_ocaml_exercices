let doc = Dom_html.document in
let h2 = Dom_html.createH2 doc in
let p1 = Dom_html.createP doc in
let p2 = Dom_html.createP doc in

doc##.title := (Js.string "Hello world");

h2##.textContent := Js.some (Js.string "Hello world from ml file");
Dom.appendChild doc##.body h2;

p1##.innerHTML := (Js.string "I'm a paragraph and I'm containing another paragraph");
p1##.id := (Js.string "p_container");
p2##.innerHTML := (Js.string "I'm a paragraph and I'm in a paragraph");
p2##.id := (Js.string "p_in");
Dom.appendChild p1 p2;
Dom.appendChild doc##.body p1
