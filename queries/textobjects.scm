(
  (node (symbol) @kwsprite
      . (_)
        _* @class.inside
      . ")") @class.around
  (#eq? @kwsprite "sprite")
)

(
  (node (symbol) @kwproc
      . (_)
        _* @function.inside
      . ")") @function.around
  (#eq? @kwproc "proc")
)

(node . (_) (_) @parameter.inside ")" .)

(comment) @comment.inside
(comment)+ @comment.around
