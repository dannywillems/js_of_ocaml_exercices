let doc = Dom_html.document

let onload _ =
  let h1 = Dom_html.createH1 doc in
  h1##.innerHTML := (Js.string "Created after the page loading");
  Dom.appendChild doc##.body h1;
  Js._false

let _ = Dom_html.window##.onload := Dom_html.handler onload
