set background=light
highlight clear

if exists('syntax_on')
  syntax reset
endif

set t_Co=256
let colors_name = 'fruits'

py3 import yaml
py3 from pathlib import Path
let s:config = py3eval('yaml.load(open(f"{Path.home()}/.config/nvim/colors/colorconfig.yaml").read(), Loader=yaml.Loader)')
let s:colors = s:config['colors']
let s:colorgroups = s:config['colorgroups']


hi link Boolean               Number
hi link Character             Function
hi link ErrorMsg              Error
hi link Debug                 Special
hi link Define                PreProc
hi link Exception             PreProc
hi link Float                 Number
hi link Include               Function
hi link Label                 Statement
hi link Macro                 PreProc
hi link Operator              PreProc
hi link PreCondit             PreProc
hi link Repeat                Statement
hi link SpecialChar           Special
hi link SpecialComment        Special
hi link Typedef               Type
hi link Tag                   Special

" CSS
hi link cssAttr               String
hi link cssClass              Type
hi link cssProp               Identifier
hi link cssSelectorOp         Identifier

" HTML
hi link htmlArg               Symbol
hi link htmlTag               Constant
hi link htmlTagName           Constant
hi link htmlEndTag            Function

" JavaScript
hi link javascriptFuncArg     Function
hi link javascriptFuncComma   Function
hi link javascriptFuncDef     Statement
hi link javascriptFuncKeyword Statement
hi link javascriptOpSymbols   Type
hi link javascriptParens      Function
hi link javascriptEndcolons   Function

" Javascript (pangloss/vim-javascript)
hi link jsBraces              Delimiter
hi link jsClassDefinition     Constant
hi link jsClassKeyword        PreProc
hi link jsExtendsKeyword      Function
hi link jsFuncCall            Function
hi link jsModuleKeyword       Identifier
hi link jsNull                Identifier
hi link jsObjectKey           Identifier
hi link jsStorageClass        Structure
hi link jsTemplateBraces      PreProc

" JSON
hi link jsonKeyword           Function

" LaTeX
hi link texInputFile          PreProc
hi link texDocType            Constant
hi link texDocTypeArgs        Function
hi link texInputFile          Symbol
hi link texInputFileOpt       String
hi link texMathMatcher        Statement
hi link texMathSymbol         Symbol
hi link texMathZoneA          Symbol
hi link texMathZoneAS         Symbol
hi link texSection            Title
hi link texStatement          Function
hi link texTypeSize           Symbol
hi link texTypeStyle          Symbol

" Markdown
hi link mkdBlockquote         Symbol
hi link mkdCode               Identifier
hi link mkdIndentCode         Identifier

" MatchTagAlways
hi link MatchTag              Identifier

" PHP
hi link phpParent             Normal
hi link phpRegion             Comment
hi link phpVarSelector        Identifier

" Ruby
hi link rubyAccess            Access
hi link rubyCallback          Function
hi link rubyClass             Class
hi link rubyControl           Statement
hi link rubyConstant          Constant
hi link rubyEntity            Function
hi link rubyFunction          StorageClass
hi link rubyInclude           Include
hi link rubyInterpolation     Include
hi link rubyMacro             Function
hi link rubyModule            Module
hi link rubyStringDelimiter   rubyString
hi link rubySymbol            Symbol

" SASS
hi link sassClassChar         Type
hi link sassIdChar            Identifier

" VimL
hi link vimCmdSep             Function

" YAML
hi link yamlBlockMappingKey   Function
hi link yamlDocumentStart     Comment

" XML
hi link xmlEndTag             Function
hi! link TabLine StatusLineNC
hi! link TabLineAlt StatusLine

for group in s:colorgroups
  let gui = has_key(group, 'gui') ? group['gui'] : 'NONE'
  let guifg = has_key(group, 'guifg') ? s:colors[group['guifg']] : 'NONE'
  let guibg = has_key(group, 'guibg') ? s:colors[group['guibg']] : 'NONE'

  " let cterm = has_key(group, 'cterm') ? group['cterm'] : 'NONE'
  " let ctermfg = has_key(group, 'ctermfg') ? s:colors[group['ctermfg']] : 'NONE'
  " let ctermbg = has_key(group, 'ctermbg') ? s:colors[group['ctermbg']] : 'NONE'

  execute 'hi '.group['group'].' gui='.gui.' guifg='.guifg.' guibg='.guibg
endfor


