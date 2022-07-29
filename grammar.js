const hex_number = /0x[0-9a-fA-F]+/;
const binary_number = /0b[01]+/;
const octal_number = /0o[0-7]+/;
const decimal = /[+-]?(\d*\.\d+)|(\d+)([eE][+-]?\d+)?/;

const escape_sequence =
  /\\([btnfrv"\\]|u\{[0-9a-fA-F]{1,6}\}|u[0-9a-fA-F]{4}|x[0-9a-fA-F]{2})/;

module.exports = grammar({
  name: "scratchlisp",

  extras: $ => [/\s/, $.comment],

  rules: {
    source_file: $ => repeat($._expr),

    comment: $ => token(seq(";", /.*/)),

    _expr: $ => choice($.symbol, $.number, $.string, $.unquote, $.node),

    symbol: $ =>
      /[\p{Alphabetic}!$%&*+\-./:<=>?@^_~\[\]][\p{Alphabetic}!$%&*+\-./:<=>?@^_~\[\]\d]*/,

    number: $ => choice(hex_number, binary_number, octal_number, decimal),

    string: $ =>
      seq(
        '"',
        repeat(choice($.escape_sequence, token.immediate(/[^"\\\n]/))),
        token.immediate('"')
      ),

    escape_sequence: $ => token.immediate(escape_sequence),
    
    unquote: $ => seq(",", $._expr),

    node: $ => seq("(", repeat1($._expr), ")"),
  },
});
