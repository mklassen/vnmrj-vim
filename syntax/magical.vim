" Vim syntax file
" Language:	MAGICALL II
" Maintainer:	Martyn Klassen <mklassen@robarts.ca>
"		Original author: Martyn Klassen
" Last Change:	Tue Jun 18 16:27:44 EDT 2002

" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn keyword magicalReturn               return break
syn keyword magicalError                abort abortoff aborton
syn keyword magicalConditional          if then endif else elseif
syn keyword magicalLabel		          case switch
syn keyword magicalRepeat		          do repeat while endwhile until
syn keyword magicalLogical              and or not
syn keyword magicalFunction             sqrt trunc mod not size typeof

syn keyword magicalTodo                 contained  TODO
syn region magicalComment               start=/"/ end=/"/ end=/$/ contains=magicalTodo
syn region magicalCommentL		start=/\/\// skip=/\\$/ end=/$/ keepend contains=magicalTodo
syn region magicalCommentR    start="/\*" end="\*/" keepend contains=magicalTodo
syn region magicalString                start=/'/ skip=/\\'/ end=/'/

" If you do not want these operators lit, uncommment them and the "hi link" below
"syn match magicalArithmeticOperator	    "[-+/*]"
syn match magicalAssignment             ":"
syn match magicalRelationalOperator     "[<>]="
syn match magicalRelationalOperator     "[<>=]"
syn match magicalRelationalOperator     "<>"

syn match magicalLocalIdentifier        "\$\w*\>"
syn match magicalLocalIdentifier        "\$#"

" Standard numbers
syn match magicalNumber		"\<\d\+[ij]\=\>"
" floating point number, with dot, optional exponent
syn match magicalFloat		"\<\d\+\(\.\d*\)\=\([edED][-+]\=\d\+\)\=[ij]\=\>"
" floating point number, starting with a dot, optional exponent
syn match magicalFloat		"\.\d\+\([edED][-+]\=\d\+\)\=[ij]\=\>"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_magical_syntax_inits")
  if version < 508
    let did_magical_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink magicalReturn                  Repeat
  HiLink magicalError                   Error
  HiLink magicalConditional             Conditional
  HiLink magicalLabel                   Label
  HiLink magicalRepeat                  Repeat
  HiLink magicalLogical                 Operator
  HiLink magicalFunction                Function
  HiLink magicalTodo                    Todo
  HiLink magicalComment                 Comment
  HiLink magicalCommentR                Comment
  HiLink magicalCommentL                Comment
  HiLink magicalString                  String
  
  HiLink magicalLocalIdentifier         Identifier
  HiLink magicalOperator		          Operator
  HiLink magicalFloat                   Float
  HiLink magicalNumber			          Number

  HiLink magicalAssignment              magicalOperator
"  HiLink magicalArithmeticOperator      magicalOperator
  HiLink magicalRelationalOperator      magicalOperator
  HiLink magicalLogicalOperator		magicalOperator

  delcommand HiLink
endif

let b:current_syntax = "magical"
