(number) @constant.numeric
(string) @string
(escape_sequence) @constant.character.escape
(comment) @comment

"," @operator

(
  (symbol) @keyword.control.import
  (#eq? @keyword.control.import "include")
)

(
  (symbol) @namespace
  (#eq? @namespace "sprite")
)

(
  (symbol) @keyword.control
  (#match? @keyword.control "^(do|if|cond|then|else|when|unless|for|forever|repeat|while|until)$")
)

(
  (symbol) @variable.builtin
  (#match? @variable.builtin "^(x-pos|y-pos|timer|answer)$")
)

(
  (symbol) @operator
  (#match? @operator "^([+\\-*/=<>]|!=|\\+\\+|!!)$")
)

(
  (symbol) @function.builtin
  (#match? @function.builtin "^(:=|\\+=|and|or|not|length|str-length|char-at|mod|abs|floor|ceil|sqrt|ln|log|e\\^|ten\\^|sin|cos|tan|asin|acos|atan|erase\\-all|stamp|pen\\-down|pen\\-up|set\\-xy|set\\-size|set\\-costume|show|hide|say|change\\-x|change\\-y|set\\-x|set\\-y|wait|ask|send\\-broadcast\\-sync|replace|append|delete|delete\\-all|stop\\-all|stop\\-this\\-script|stop\\-other\\-scripts|clone\\-myself)$")
)

(
  (symbol) @keyword
  (#match? @keyword "^(macro|proc|variables|lists|costumes)$")
)

(
  (node (symbol) @kwproc
      . (node . (symbol) @function (symbol)* @variable.parameter))
  (#eq? @kwproc "proc")
)
