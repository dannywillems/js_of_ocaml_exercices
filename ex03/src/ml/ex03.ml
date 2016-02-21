let question =
  Js.string "Do you find this tutorial useful ?"
and answer_yes =
  Js.string "Oh great. We try to do our best. Don't hesitate to propose your own
  exercice!"
and answer_no =
  Js.string "Oh =(, why ? You can improve it if you want. Write a
  comment with why you don't find it useful."
in

let result = (Dom_html.window)##confirm (question) in
  (Dom_html.window)##alert (if Js.to_bool result then answer_yes else
  answer_no)
