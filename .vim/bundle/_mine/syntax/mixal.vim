" Vim syntax file
" Language:     MIXAL
" Maintainer:   Randy Thiemann <randy.thiemann@student.uhasselt.be>
" Last Change:  2013 Jan 11

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syntax case match

syn match     mixalId           /^\([A-Z0-9] \{6\}\|[A-Z0-9]\{2\} \{5\}\|[A-Z0-9]\{3\} \{4\}\|[A-Z0-9]\{4\} \{3\}\|[A-Z0-9]\{5\} \{2\}\|[A-Z0-9]\{6\} \|[A-Z0-9]\{7\}\) \ze\(ALF\|EQU\|CON\)/ nextgroup=mixalSetDirective skipwhite
syn match     mixalLabel        /^\([A-Z0-9] \{6\}\|[A-Z0-9]\{2\} \{5\}\|[A-Z0-9]\{3\} \{4\}\|[A-Z0-9]\{4\} \{3\}\|[A-Z0-9]\{5\} \{2\}\|[A-Z0-9]\{6\} \|[A-Z0-9]\{7\}\) \ze\(ALF\|EQU\|CON\)\@!/ nextgroup=mixalInstruction,mixalDirective skipwhite


syn match     mixalComment      /^\*.*$/


syn match     mixalInstruction  /LD[AX1-6]N\?/ nextgroup=mixalAdress,mixalNumber skipwhite
syn match     mixalInstruction  /ST[AXJZ1-6]\>/ nextgroup=mixalAdress,mixalNumber skipwhite
syn keyword   mixalInstruction  ADD MUL SUB DIV nextgroup=mixalAdress,mixalNumber skipwhite
syn match     mixalInstruction  /EN[TN][AX1-6]/ nextgroup=mixalAdress,mixalNumber skipwhite
syn match     mixalInstruction  /INC[AX1-6]/ nextgroup=mixalAdress,mixalNumber skipwhite
syn match     mixalInstruction  /DEC[AX1-6]/ nextgroup=mixalAdress,mixalNumber skipwhite
syn match     mixalInstruction  /CMP[AX1-6]/ nextgroup=mixalAdress,mixalNumber skipwhite
syn keyword   mixalInstruction  JMP JSJ JOV JNOV nextgroup=mixalAdress,mixalNumber skipwhite
syn keyword   mixalInstruction  JL JE JG JGE JNE JLE nextgroup=mixalAdress,mixalNumber skipwhite
syn match     mixalInstruction  /J[AX1-6]N\?[NZP]/ nextgroup=mixalAdress,mixalNumber skipwhite
syn keyword   mixalInstruction  IN OUT IOC JRED JBUS nextgroup=mixalAdress,mixalNumber skipwhite
syn keyword   mixalInstruction  NUM CHAR nextgroup=mixalAdress,mixalNumber skipwhite
syn match     mixalInstruction  /S[LR]\(AX\?\|C\)/ nextgroup=mixalAdress,mixalNumber skipwhite
syn keyword   mixalInstruction  MOVE NOP HLT nextgroup=mixalAdress,mixalNumber skipwhite


syn keyword   mixalDirective    ORIG END nextgroup=mixalAdress,mixalNumber skipwhite


syn keyword   mixalSetDirective ALF nextgroup=mixalString skipwhite
syn keyword   mixalSetDirective EQU CON nextgroup=mixalAdress,mixalNumber skipwhite


syn match     mixalAdress       /[0-9A-Z]\+\ze[ +]*$/ skipwhite


syn match     mixalNumber       / \{1,2}\d\+\ze[ +]*$/ skipwhite
syn match     mixalNumber       /=\zs\d\+\ze=/ skipwhite
syn match     mixalNumber       /(\zs\d\+\ze)/ skipwhite
syn match     mixalNumber       /,\zs\d\+\ze/ skipwhite
syn match     mixalNumber       /+\zs\d\+\ze/ skipwhite


syn match     mixalString       /  .\{5\}\ze.*/ skipwhite


hi def link   mixalDirective    Type
hi def link   mixalSetDirective Type
hi def link   mixalInstruction  Statement
hi def link   mixalLabel        Label
hi def link   mixalId           Identifier
hi def link   mixalComment      Comment
hi def link   mixalAdress       Comment 
hi def link   mixalString       String
hi def link   mixalNumber       Number

let b:current_syntax = "mixal"
