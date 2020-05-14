" ==================================================
"  file name        : systemverilog.vim
"  creat time       : 2016年 08月 23日 星期二 08:41:01 CST
"  author           : gtic_wrj
"  lastest version  : v1.0
"  last modify time :
"  last modifier    :
"  descript         : Vim syntax file based on:
"                   : Systemverilog(IEEE 1800-2012)
"                   : VMM(1.2)
"                   : UVM(1.2)
"                   : Usage : put under direction $VIM/syntax/
"                   : autobuf *.sv format file
" ==================================================


if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

" Set the local value of the 'iskeyword' option
if version >= 600
    setlocal iskeyword=@,48-57,_,192-255
else
    set iskeyword=@,48-57,_,192-255
endif

" new defines
"
" Variable Types
syn keyword systemverilogTypes int integer byte unsigned bit longint const void
syn keyword systemverilogTypes real realtime ref reg shortint shortreal string
syn keyword systemverilogTypes logic reg wire tri0 tri1 triand
syn keyword systemverilogTypes super this struct typedef

" for class, module, etc.
syn keyword systemverilogTypes class endclass function endfunction task endtask module endmodule program endprogram
syn keyword systemverilogTypes interface endinterface covergroup endgroup
syn keyword systemverilogTypes automatic static virtual extern
syn keyword systemverilogTypes parameter localparam defparam
syn keyword systemverilogTypes clocking endclocking specify endspecify

" block and expression statement
syn keyword systemverilogStatement begin end fork join join_any join_none generate endgenerate
syn keyword systemverilogStatement always always_comb always_ff always_latch
syn keyword systemverilogStatement if else for foreach while do forever
syn keyword systemverilogStatement initial final force assign
syn keyword systemverilogStatement with inside case endcase casex casez
syn keyword systemverilogStatement solve before
syn keyword systemverilogStatement strong0 strong1 supply0 supply1

syn keyword systemverilogBIMethod new randomize self kill status pre_randomize post_randomize

" directive commands, such as define
" normal define should be declared first, then there will be special macros override this normal
" define
syn match systemverilogNormalMacros "`\w\+\>"

syn match systemverilogDirectives   "`ifdef\>"
syn match systemverilogDirectives   "`ifndef\>"
syn match systemverilogDirectives   "`else\>"
syn match systemverilogDirectives   "`elsif\>"
syn match systemverilogDirectives   "`endif\>"
syn match systemverilogDirectives   "`timescale\>"
syn match systemverilogDirectives   "`celldefine\>"
syn match systemverilogDirectives   "`endcelldefine\>"
syn match systemverilogDirectives   "`include\>"
syn match systemverilogDirectives   "`define\>"
syn match systemverilogDirectives   "`line\>"
syn match systemverilogDirectives   "`default_nettype\>"

" New time specification:
" #1step or #1ps
syn match   systemverilogNumber "\<[0-9_]\+\([munpf]\|\)s\>"
syn match   systemverilogNumber "\<[0-9_]\+step\>"
syn match   systemverilogNumber "\(\<\d\+\|\)'[bB]\s*[0-1_xXzZ?]\+\>"
syn match   systemverilogNumber "\(\<\d\+\|\)'[oO]\s*[0-7_xXzZ?]\+\>"
syn match   systemverilogNumber "\(\<\d\+\|\)'[dD]\s*[0-9_xXzZ?]\+\>"
syn match   systemverilogNumber "\(\<\d\+\|\)'[hH]\s*[0-9a-fA-F_xXzZ?]\+\>"
syn match   systemverilogNumber "\<[+-]\=[0-9_]\+\(\.[0-9_]*\|\)\(e[0-9_]*\|\)\>"

syn match   systemverilogOperator "[&|~><!)(*#%@+/=?:;}{,.\^\-\[\]]"

syn keyword systemverilogTodo contained TODO HIGHLIGHT
syn region  systemverilogComment start="/\*" end="\*/" contains=systemverilogTodo
syn match   systemverilogComment "//.*" contains=systemverilogTodo

" syn region  systemverilogString start="\"" end="\""
syn region  systemverilogString start=+"+ skip=+\\"+ end=+"+ contains=systemverilogEscape







" Taken from the SystemVerilog 3.1a Annex B:
syn keyword systemverilogStatement   alias
syn keyword systemverilogStatement   and assert assume before 
syn keyword systemverilogStatement   bind bins binsof break buf bufif0 bufif1
syn keyword systemverilogStatement   cell chandle
syn keyword systemverilogStatement   cmos config constraint context continue cover
syn keyword systemverilogStatement   coverpoint cross deassign default
syn keyword systemverilogStatement   design disable dist edge 
syn keyword systemverilogStatement   endconfig 
syn keyword systemverilogStatement   endpackage endprimitive endproperty
syn keyword systemverilogStatement   endsequence endtable enum event
syn keyword systemverilogStatement   expect export extends first_match 
syn keyword systemverilogStatement   genvar highz0 highz1 iff ifnone ignore_bins
syn keyword systemverilogStatement   illegal_bins import incdir inout
syn keyword systemverilogStatement   input instance intersect
syn keyword systemverilogStatement   large liblist library local
syn keyword systemverilogStatement   macromodule matches medium
syn keyword systemverilogStatement   modport nand negedge nmos nor
syn keyword systemverilogStatement   noshowcancelled not notif0 notif1 null or output
syn keyword systemverilogStatement   package packed pmos posedge primitive
syn keyword systemverilogStatement   priority property protected pull0 pull1
syn keyword systemverilogStatement   pulldown pullup pulsestyle_onevent pulsestyle_ondetect
syn keyword systemverilogStatement   pure rand randc randcase randsequence rcmos
syn keyword systemverilogStatement   release repeat return
syn keyword systemverilogStatement   rnmos rpmos rtran rtranif0 rtranif1 scalared sequence
syn keyword systemverilogStatement   showcancelled signed small solve
syn keyword systemverilogStatement   specparam
syn keyword systemverilogStatement   table tagged
syn keyword systemverilogStatement   throughout time timeprecision timeunit tran
syn keyword systemverilogStatement   tranif0 tranif1 tri trior trireg type
syn keyword systemverilogStatement   union unique use var vectored
syn keyword systemverilogStatement   wait wait_order wand weak0 weak1
syn keyword systemverilogStatement   wildcard within wor xnor xor

" LRM 3.7 String methods:
syn keyword systemverilogStatement   len getc putc toupper tolower compare
syn keyword systemverilogStatement   icompare substr
syn keyword systemverilogStatement   itoa hextoa octtoa bintoa realtoa
syn keyword systemverilogStatement   atoi atohex atooct atobin atoreal
" LRM 3.8 events:
syn keyword systemverilogStatement   triggered
" LRM 3.10 methods for enumerated types:
syn keyword systemverilogStatement   first last next prev num name
" LRM 4.6 Dynamic Arrays:
syn keyword systemverilogStatement   delete
" LRM 4.10 Associative Array methods:
syn keyword systemverilogStatement   num exists
" LRM 4.15.1 Array locator methods:
syn keyword systemverilogStatement   find find_index find_first find_first_index
syn keyword systemverilogStatement   find_last find_last_index min max unique unique_index
" LRM 4.15.2 Array ordering methods:
syn keyword systemverilogStatement   reverse sort rsort shuffle
" LRM 4.15.3 Array reduction methods:
syn keyword systemverilogStatement   sum product
" LRM 4.15.4 Array iterator query:
syn keyword systemverilogStatement   index
" LRM 7.10.1 Builtin package:
syn keyword systemverilogStatement   std
" LRM Annex C standard library
syn keyword systemverilogStatement   get put try_get try_put peek try_peek
syn keyword systemverilogStatement   await suspend resume
" LRM Annex D List methods
syn keyword systemverilogStatement   next prev eq neq data
syn keyword systemverilogStatement   size empty push_front push_back
syn keyword systemverilogStatement   front back pop_front pop_back
syn keyword systemverilogStatement   start finish insert insert_range
syn keyword systemverilogStatement   erase erase_range set swap clear purge


" Original systemverilog syntax below here

syn match   systemverilogGlobal "`nounconnected_drive\>"
syn match   systemverilogGlobal "`resetall\>"
syn match   systemverilogGlobal "`unconnected_drive\>"
syn match   systemverilogGlobal "`undef\>"
syn match   systemverilogGlobal "$[a-zA-Z0-9_]\+\>"

syn match   systemverilogConstant "\<[A-Z][A-Z0-9_]\+\>"


syn match   systemverilogEscape +\\[nt"\\]+ contained
syn match   systemverilogEscape "\\\o\o\=\o\=" contained

" Directives
syn match   systemverilogDirective   "//\s*synopsys\>.*$"
syn region  systemverilogDirective   start="/\*\s*synopsys\>" end="\*/"
syn region  systemverilogDirective   start="//\s*synopsys dc_script_begin\>" end="//\s*synopsys dc_script_end\>"

syn match   systemverilogDirective   "//\s*\$s\>.*$"
syn region  systemverilogDirective   start="/\*\s*\$s\>" end="\*/"
syn region  systemverilogDirective   start="//\s*\$s dc_script_begin\>" end="//\s*\$s dc_script_end\>"

" IEEE 1800-2012 annexes keywords,removed reduplicative keywords
syn keyword systemverilog1800Keyword accept_on
" syn keyword systemverilog1800Keyword alias
" syn keyword systemverilog1800Keyword always
" syn keyword systemverilog1800Keyword always_comb
" syn keyword systemverilog1800Keyword always_ff
" syn keyword systemverilog1800Keyword always_latch
" syn keyword systemverilog1800Keyword and
" syn keyword systemverilog1800Keyword assert
" syn keyword systemverilog1800Keyword assign
" syn keyword systemverilog1800Keyword assume
" syn keyword systemverilog1800Keyword automatic
" syn keyword systemverilog1800Keyword before
" syn keyword systemverilog1800Keyword begin
" syn keyword systemverilog1800Keyword bind
" syn keyword systemverilog1800Keyword bins
" syn keyword systemverilog1800Keyword binsof
" syn keyword systemverilog1800Keyword bit
" syn keyword systemverilog1800Keyword break
" syn keyword systemverilog1800Keyword buf
" syn keyword systemverilog1800Keyword bufif0
" syn keyword systemverilog1800Keyword bufif1
" syn keyword systemverilog1800Keyword byte
" syn keyword systemverilog1800Keyword case
" syn keyword systemverilog1800Keyword casex
" syn keyword systemverilog1800Keyword casez
" syn keyword systemverilog1800Keyword cell
" syn keyword systemverilog1800Keyword chandle
syn keyword systemverilog1800Keyword checker
" syn keyword systemverilog1800Keyword class
" syn keyword systemverilog1800Keyword clocking
" syn keyword systemverilog1800Keyword cmos
" syn keyword systemverilog1800Keyword config
" syn keyword systemverilog1800Keyword const
" syn keyword systemverilog1800Keyword constraint
" syn keyword systemverilog1800Keyword context
" syn keyword systemverilog1800Keyword continue
" syn keyword systemverilog1800Keyword cover
" syn keyword systemverilog1800Keyword covergroup
" syn keyword systemverilog1800Keyword coverpoint
" syn keyword systemverilog1800Keyword cross
" syn keyword systemverilog1800Keyword deassign
" syn keyword systemverilog1800Keyword default
" syn keyword systemverilog1800Keyword design
" syn keyword systemverilog1800Keyword disable
" syn keyword systemverilog1800Keyword dist
" syn keyword systemverilog1800Keyword do
" syn keyword systemverilog1800Keyword edge
" syn keyword systemverilog1800Keyword else
" syn keyword systemverilog1800Keyword end
" syn keyword systemverilog1800Keyword endcase
syn keyword systemverilog1800Keyword endchecker
" syn keyword systemverilog1800Keyword endclass
" syn keyword systemverilog1800Keyword endclocking
" syn keyword systemverilog1800Keyword endconfig
" syn keyword systemverilog1800Keyword endfunction
" syn keyword systemverilog1800Keyword endgenerate
" syn keyword systemverilog1800Keyword endgroup
" syn keyword systemverilog1800Keyword endinterface
" syn keyword systemverilog1800Keyword endmodule
" syn keyword systemverilog1800Keyword endpackage
" syn keyword systemverilog1800Keyword endprimitive
" syn keyword systemverilog1800Keyword endprogram
" syn keyword systemverilog1800Keyword endproperty
" syn keyword systemverilog1800Keyword endspecify
" syn keyword systemverilog1800Keyword endsequence
" syn keyword systemverilog1800Keyword endtable
" syn keyword systemverilog1800Keyword endtask
" syn keyword systemverilog1800Keyword enum
" syn keyword systemverilog1800Keyword event
syn keyword systemverilog1800Keyword eventually
" syn keyword systemverilog1800Keyword expect
" syn keyword systemverilog1800Keyword export
" syn keyword systemverilog1800Keyword extends
" syn keyword systemverilog1800Keyword final
" syn keyword systemverilog1800Keyword first_match
" syn keyword systemverilog1800Keyword for
" syn keyword systemverilog1800Keyword force
" syn keyword systemverilog1800Keyword foreach
" syn keyword systemverilog1800Keyword forever
" syn keyword systemverilog1800Keyword fork
" syn keyword systemverilog1800Keyword forkjoin
" syn keyword systemverilog1800Keyword function
" syn keyword systemverilog1800Keyword generate
" syn keyword systemverilog1800Keyword genvar
syn keyword systemverilog1800Keyword global
" syn keyword systemverilog1800Keyword highz0
" syn keyword systemverilog1800Keyword highz1
" syn keyword systemverilog1800Keyword if
" syn keyword systemverilog1800Keyword iff
" syn keyword systemverilog1800Keyword ifnone
" syn keyword systemverilog1800Keyword ignore_bins
" syn keyword systemverilog1800Keyword illegal_bins
syn keyword systemverilog1800Keyword implements
syn keyword systemverilog1800Keyword implies
" syn keyword systemverilog1800Keyword import
" syn keyword systemverilog1800Keyword incdir
" syn keyword systemverilog1800Keyword include
" syn keyword systemverilog1800Keyword initial
" syn keyword systemverilog1800Keyword inout
" syn keyword systemverilog1800Keyword input
" syn keyword systemverilog1800Keyword inside
" syn keyword systemverilog1800Keyword instance
" syn keyword systemverilog1800Keyword int
" syn keyword systemverilog1800Keyword integer
syn keyword systemverilog1800Keyword interconnect
" syn keyword systemverilog1800Keyword interface
" syn keyword systemverilog1800Keyword intersect
" syn keyword systemverilog1800Keyword join
" syn keyword systemverilog1800Keyword join_any
" syn keyword systemverilog1800Keyword join_none
" syn keyword systemverilog1800Keyword large
syn keyword systemverilog1800Keyword let
" syn keyword systemverilog1800Keyword liblist
" syn keyword systemverilog1800Keyword library
" syn keyword systemverilog1800Keyword local
" syn keyword systemverilog1800Keyword logic
" syn keyword systemverilog1800Keyword longint
" syn keyword systemverilog1800Keyword macromodule
" syn keyword systemverilog1800Keyword matches
" syn keyword systemverilog1800Keyword medium
" syn keyword systemverilog1800Keyword modport
" syn keyword systemverilog1800Keyword module
" syn keyword systemverilog1800Keyword nand
" syn keyword systemverilog1800Keyword negedge
syn keyword systemverilog1800Keyword nettype
" syn keyword systemverilog1800Keyword new
syn keyword systemverilog1800Keyword nexttime
" syn keyword systemverilog1800Keyword nmos
" syn keyword systemverilog1800Keyword nor
" syn keyword systemverilog1800Keyword noshowcancelled
" syn keyword systemverilog1800Keyword not
" syn keyword systemverilog1800Keyword notif0
" syn keyword systemverilog1800Keyword notif1
" syn keyword systemverilog1800Keyword null
" syn keyword systemverilog1800Keyword or
" syn keyword systemverilog1800Keyword output
" syn keyword systemverilog1800Keyword package
" syn keyword systemverilog1800Keyword packed
" syn keyword systemverilog1800Keyword pmos
" syn keyword systemverilog1800Keyword posedge
" syn keyword systemverilog1800Keyword primitive
" syn keyword systemverilog1800Keyword priority
" syn keyword systemverilog1800Keyword program
" syn keyword systemverilog1800Keyword property
" syn keyword systemverilog1800Keyword protected
" syn keyword systemverilog1800Keyword pull0
" syn keyword systemverilog1800Keyword pull1
" syn keyword systemverilog1800Keyword pulldown
" syn keyword systemverilog1800Keyword pullup
" syn keyword systemverilog1800Keyword pulsestyle_ondetect
" syn keyword systemverilog1800Keyword pulsestyle_onevent
" syn keyword systemverilog1800Keyword pure
" syn keyword systemverilog1800Keyword rand
" syn keyword systemverilog1800Keyword randc
" syn keyword systemverilog1800Keyword randcase
" syn keyword systemverilog1800Keyword randsequence
" syn keyword systemverilog1800Keyword rcmos
" syn keyword systemverilog1800Keyword real
" syn keyword systemverilog1800Keyword realtime
" syn keyword systemverilog1800Keyword ref
syn keyword systemverilog1800Keyword reject_on
" syn keyword systemverilog1800Keyword release
" syn keyword systemverilog1800Keyword repeat
syn keyword systemverilog1800Keyword restrict
" syn keyword systemverilog1800Keyword return
" syn keyword systemverilog1800Keyword rnmos
" syn keyword systemverilog1800Keyword rpmos
" syn keyword systemverilog1800Keyword rtran
" syn keyword systemverilog1800Keyword rtranif0
" syn keyword systemverilog1800Keyword rtranif1
syn keyword systemverilog1800Keyword s_always
syn keyword systemverilog1800Keyword s_eventually
syn keyword systemverilog1800Keyword s_nexttime
syn keyword systemverilog1800Keyword s_until
syn keyword systemverilog1800Keyword s_until_with
" syn keyword systemverilog1800Keyword scalared
" syn keyword systemverilog1800Keyword sequence
" syn keyword systemverilog1800Keyword shortint
" syn keyword systemverilog1800Keyword shortreal
" syn keyword systemverilog1800Keyword showcancelled
" syn keyword systemverilog1800Keyword signed
" syn keyword systemverilog1800Keyword small
syn keyword systemverilog1800Keyword soft
" syn keyword systemverilog1800Keyword solve
" syn keyword systemverilog1800Keyword specify
" syn keyword systemverilog1800Keyword specparam
" syn keyword systemverilog1800Keyword static
" syn keyword systemverilog1800Keyword string
syn keyword systemverilog1800Keyword strong
" syn keyword systemverilog1800Keyword struct
" syn keyword systemverilog1800Keyword super
" syn keyword systemverilog1800Keyword supply0
" syn keyword systemverilog1800Keyword supply1
syn keyword systemverilog1800Keyword sync_accept_on
syn keyword systemverilog1800Keyword sync_reject_on
" syn keyword systemverilog1800Keyword table
" syn keyword systemverilog1800Keyword tagged
" syn keyword systemverilog1800Keyword task
" syn keyword systemverilog1800Keyword this
" syn keyword systemverilog1800Keyword throughout
" syn keyword systemverilog1800Keyword time
" syn keyword systemverilog1800Keyword timeprecision
" syn keyword systemverilog1800Keyword timeunit
" syn keyword systemverilog1800Keyword tran
" syn keyword systemverilog1800Keyword tranif0
" syn keyword systemverilog1800Keyword tranif1
" syn keyword systemverilog1800Keyword tri
" syn keyword systemverilog1800Keyword tri0
" syn keyword systemverilog1800Keyword tri1
" syn keyword systemverilog1800Keyword triand
" syn keyword systemverilog1800Keyword trior
" syn keyword systemverilog1800Keyword trireg
" syn keyword systemverilog1800Keyword type
" syn keyword systemverilog1800Keyword typedef
" syn keyword systemverilog1800Keyword union
" syn keyword systemverilog1800Keyword unique
syn keyword systemverilog1800Keyword unique0
" syn keyword systemverilog1800Keyword unsigned
syn keyword systemverilog1800Keyword until
syn keyword systemverilog1800Keyword until_with
syn keyword systemverilog1800Keyword untyped
" syn keyword systemverilog1800Keyword use
syn keyword systemverilog1800Keyword uwire
" syn keyword systemverilog1800Keyword var
" syn keyword systemverilog1800Keyword vectored
" syn keyword systemverilog1800Keyword virtual
" syn keyword systemverilog1800Keyword void
" syn keyword systemverilog1800Keyword wait
" syn keyword systemverilog1800Keyword wait_order
" syn keyword systemverilog1800Keyword wand
" syn keyword systemverilog1800Keyword weak
" syn keyword systemverilog1800Keyword weak0
" syn keyword systemverilog1800Keyword weak1
" syn keyword systemverilog1800Keyword while
" syn keyword systemverilog1800Keyword wildcard
" syn keyword systemverilog1800Keyword wire
" syn keyword systemverilog1800Keyword with
" syn keyword systemverilog1800Keyword within
" syn keyword systemverilog1800Keyword wor
" syn keyword systemverilog1800Keyword xnor
" syn keyword systemverilog1800Keyword xor

" IEEE 1800-2012 annexes systemtask
syn match   systemverilog1800Systemtask "\$countdrivers\>"
syn match   systemverilog1800Systemtask "\$getpattern\>"
syn match   systemverilog1800Systemtask "\$incsave\>"
syn match   systemverilog1800Systemtask "\$input\>"
syn match   systemverilog1800Systemtask "\$key\>"
syn match   systemverilog1800Systemtask "\$list\>"
syn match   systemverilog1800Systemtask "\$log\>"
syn match   systemverilog1800Systemtask "\$nokey\>"
syn match   systemverilog1800Systemtask "\$nolog\>"
syn match   systemverilog1800Systemtask "\$reset\>"
syn match   systemverilog1800Systemtask "\$reset_count\>"
syn match   systemverilog1800Systemtask "\$reset_value\>"
syn match   systemverilog1800Systemtask "\$restart\>"
syn match   systemverilog1800Systemtask "\$save\>"
syn match   systemverilog1800Systemtask "\$scale\>"
syn match   systemverilog1800Systemtask "\$scope\>"
syn match   systemverilog1800Systemtask "\$showscopes\>"
syn match   systemverilog1800Systemtask "\$showvars\>"
syn match   systemverilog1800Systemtask "\$sreadmemb\>"
syn match   systemverilog1800Systemtask "\$sreadmemh\>"




" Base on UVM1.2
" UVM classes with wildcard
syn match   UVMClassSeries "\<uvm_\w\+_export\>"
syn match   UVMClassSeries "\<uvm_\w\+_imp\>"
syn match   UVMClassSeries "\<uvm_\w\+_port\>"

" UVM classes
syn keyword UVMClass uvm_agent
syn keyword UVMClass uvm_algorithmic_comparator
syn keyword UVMClass uvm_analysis_export
syn keyword UVMClass uvm_analysis_imp
syn keyword UVMClass uvm_analysis_port
syn keyword UVMClass uvm_barrier
syn keyword UVMClass uvm_bottom_up_visitor_adapter
syn keyword UVMClass uvm_bottomup_phase
syn keyword UVMClass uvm_build_phase
syn keyword UVMClass uvm_built_in_clone
syn keyword UVMClass uvm_built_in_comp
syn keyword UVMClass uvm_built_in_converter
syn keyword UVMClass uvm_built_in_pair
syn keyword UVMClass uvm_by_level_visitor_adapter
syn keyword UVMClass uvm_callback
syn keyword UVMClass uvm_callback_iter
syn keyword UVMClass uvm_callbacks
syn keyword UVMClass uvm_cause_effect_link
syn keyword UVMClass uvm_check_phase
syn keyword UVMClass UVMClass_clone
syn keyword UVMClass UVMClass_comp
syn keyword UVMClass UVMClass_converter
syn keyword UVMClass UVMClass_pair
syn keyword UVMClass uvm_cmdline_processor
syn keyword UVMClass uvm_comparer
syn keyword UVMClass uvm_component
syn keyword UVMClass uvm_component_name_check_visitor
syn keyword UVMClass uvm_component_proxy
syn keyword UVMClass uvm_component_registry
syn keyword UVMClass uvm_config_db
syn keyword UVMClass uvm_config_db_options
syn keyword UVMClass uvm_configure_phase
syn keyword UVMClass uvm_connect_phase
syn keyword UVMClass uvm_coreservice_t
syn keyword UVMClass uvm_default_coreservice_t
syn keyword UVMClass uvm_default_factory
syn keyword UVMClass uvm_default_report_server
syn keyword UVMClass uvm_domain
syn keyword UVMClass uvm_driver
syn keyword UVMClass uvm_end_of_elaboration_phase
syn keyword UVMClass uvm_enum_wrapper
syn keyword UVMClass uvm_env
syn keyword UVMClass uvm_event
syn keyword UVMClass uvm_event_base
syn keyword UVMClass uvm_event_callback
syn keyword UVMClass uvm_extract_phase
syn keyword UVMClass uvm_factory
syn keyword UVMClass uvm_final_phase
syn keyword UVMClass uvm_get_to_lock_dap
syn keyword UVMClass uvm_hdl_path_concat
syn keyword UVMClass uvm_heartbeat
syn keyword UVMClass uvm_in_order_built_in_comparator
syn keyword UVMClass uvm_in_order_class_comparator
syn keyword UVMClass uvm_in_order_comparator
syn keyword UVMClass uvm_line_printer
syn keyword UVMClass uvm_link_base
syn keyword UVMClass uvm_main_phase
syn keyword UVMClass uvm_mem
syn keyword UVMClass uvm_mem_access_seq
syn keyword UVMClass uvm_mem_mam
syn keyword UVMClass uvm_mem_mam_cfg
syn keyword UVMClass uvm_mem_mam_policy
syn keyword UVMClass uvm_mem_region
syn keyword UVMClass uvm_mem_shared_access_seq
syn keyword UVMClass uvm_mem_single_access_seq
syn keyword UVMClass uvm_mem_single_walk_seq
syn keyword UVMClass uvm_mem_walk_seq
syn keyword UVMClass uvm_monitor
syn keyword UVMClass uvm_object
syn keyword UVMClass uvm_object_registry
syn keyword UVMClass uvm_object_string_pool
syn keyword UVMClass uvm_object_wrapper
syn keyword UVMClass uvm_objection
syn keyword UVMClass uvm_objection_callback
syn keyword UVMClass uvm_packer
syn keyword UVMClass uvm_parent_child_link
syn keyword UVMClass uvm_phase
syn keyword UVMClass uvm_phase_cb
syn keyword UVMClass uvm_phase_cb_pool
syn keyword UVMClass uvm_phase_state_change
syn keyword UVMClass uvm_pool
syn keyword UVMClass uvm_port_base
syn keyword UVMClass uvm_port_component
syn keyword UVMClass uvm_port_component_base
syn keyword UVMClass uvm_post_configure_phase
syn keyword UVMClass uvm_post_main_phase
syn keyword UVMClass uvm_post_reset_phase
syn keyword UVMClass uvm_post_shutdown_phase
syn keyword UVMClass uvm_pre_configure_phase
syn keyword UVMClass uvm_pre_main_phase
syn keyword UVMClass uvm_pre_reset_phase
syn keyword UVMClass uvm_pre_shutdown_phase
syn keyword UVMClass uvm_printer
syn keyword UVMClass uvm_printer_knobs
syn keyword UVMClass uvm_push_driver
syn keyword UVMClass uvm_push_sequencer
syn keyword UVMClass uvm_queue
syn keyword UVMClass uvm_random_stimulus
syn keyword UVMClass uvm_recorder
syn keyword UVMClass uvm_reg
syn keyword UVMClass uvm_reg_access_seq
syn keyword UVMClass uvm_reg_adapter
syn keyword UVMClass uvm_reg_backdoor
syn keyword UVMClass uvm_reg_bit_bash_seq
syn keyword UVMClass uvm_reg_block
syn keyword UVMClass uvm_reg_bus_op
syn keyword UVMClass uvm_reg_cbs
syn keyword UVMClass uvm_reg_field
syn keyword UVMClass uvm_reg_fifo
syn keyword UVMClass uvm_reg_file
syn keyword UVMClass uvm_reg_frontdoor
syn keyword UVMClass uvm_reg_hw_reset_seq
syn keyword UVMClass uvm_reg_indirect_data
syn keyword UVMClass uvm_reg_item
syn keyword UVMClass uvm_reg_map
syn keyword UVMClass uvm_reg_mem_access_seq
syn keyword UVMClass uvm_reg_mem_built_in_seq
syn keyword UVMClass uvm_reg_mem_hdl_paths_seq
syn keyword UVMClass uvm_reg_mem_shared_access_seq
syn keyword UVMClass uvm_reg_predictor
syn keyword UVMClass uvm_reg_read_only_cbs
syn keyword UVMClass uvm_reg_sequence
syn keyword UVMClass uvm_reg_shared_access_seq
syn keyword UVMClass uvm_reg_single_access_seq
syn keyword UVMClass uvm_reg_single_bit_bash_seq
syn keyword UVMClass uvm_reg_tlm_adapter
syn keyword UVMClass uvm_reg_transaction_order_policy
syn keyword UVMClass uvm_reg_write_only_cbs
syn keyword UVMClass uvm_related_link
syn keyword UVMClass uvm_report_catcher
syn keyword UVMClass uvm_report_handler
syn keyword UVMClass uvm_report_message
syn keyword UVMClass uvm_report_message_element_base
syn keyword UVMClass uvm_report_message_element_container
syn keyword UVMClass uvm_report_message_int_element
syn keyword UVMClass uvm_report_message_object_element
syn keyword UVMClass uvm_report_message_string_element
syn keyword UVMClass uvm_report_object
syn keyword UVMClass uvm_report_phase
syn keyword UVMClass uvm_report_server
syn keyword UVMClass uvm_reset_phase
syn keyword UVMClass uvm_resource
syn keyword UVMClass uvm_resource_base
syn keyword UVMClass uvm_resource_db
syn keyword UVMClass uvm_resource_db_options
syn keyword UVMClass uvm_resource_options
syn keyword UVMClass uvm_resource_pool
syn keyword UVMClass uvm_resource_types
syn keyword UVMClass uvm_root
syn keyword UVMClass uvm_run_phase
syn keyword UVMClass uvm_scoreboard
syn keyword UVMClass uvm_seq_item_pull_export
syn keyword UVMClass uvm_seq_item_pull_imp
syn keyword UVMClass uvm_seq_item_pull_port
syn keyword UVMClass uvm_sequence
syn keyword UVMClass uvm_sequence_base
syn keyword UVMClass uvm_sequence_item
syn keyword UVMClass uvm_sequence_library
syn keyword UVMClass uvm_sequence_library_cfg
syn keyword UVMClass uvm_sequencer
syn keyword UVMClass uvm_sequencer_base
syn keyword UVMClass uvm_sequencer_param_base
syn keyword UVMClass uvm_set_before_get_dap
syn keyword UVMClass uvm_set_get_dap_base
syn keyword UVMClass uvm_shutdown_phase
syn keyword UVMClass uvm_simple_lock_dap
syn keyword UVMClass uvm_sqr_if_base
syn keyword UVMClass uvm_start_of_simulation_phase
syn keyword UVMClass uvm_structure_proxy
syn keyword UVMClass uvm_subscriber
syn keyword UVMClass uvm_table_printer
syn keyword UVMClass uvm_task_phase
syn keyword UVMClass uvm_test
syn keyword UVMClass uvm_text_recorder
syn keyword UVMClass uvm_text_tr_database
syn keyword UVMClass uvm_text_tr_stream
syn keyword UVMClass uvm_tlm_analysis_fifo
syn keyword UVMClass uvm_tlm_b_initiator_socket
syn keyword UVMClass uvm_tlm_b_initiator_socket_base
syn keyword UVMClass uvm_tlm_b_passthrough_initiator_socket
syn keyword UVMClass uvm_tlm_b_passthrough_initiator_socket_base
syn keyword UVMClass uvm_tlm_b_passthrough_target_socket
syn keyword UVMClass uvm_tlm_b_passthrough_target_socket_base
syn keyword UVMClass uvm_tlm_b_target_socket
syn keyword UVMClass uvm_tlm_b_target_socket_base
syn keyword UVMClass uvm_tlm_b_transport_export
syn keyword UVMClass uvm_tlm_b_transport_imp
syn keyword UVMClass uvm_tlm_b_transport_port
syn keyword UVMClass uvm_tlm_extension
syn keyword UVMClass uvm_tlm_extension_base
syn keyword UVMClass uvm_tlm_fifo
syn keyword UVMClass uvm_tlm_fifo_base
syn keyword UVMClass uvm_tlm_generic_payload
syn keyword UVMClass uvm_tlm_gp
syn keyword UVMClass uvm_tlm_if
syn keyword UVMClass uvm_tlm_if_base
syn keyword UVMClass uvm_tlm_nb_initiator_socket
syn keyword UVMClass uvm_tlm_nb_initiator_socket_base
syn keyword UVMClass uvm_tlm_nb_passthrough_initiator_socket
syn keyword UVMClass uvm_tlm_nb_passthrough_initiator_socket_base
syn keyword UVMClass uvm_tlm_nb_passthrough_target_socket
syn keyword UVMClass uvm_tlm_nb_passthrough_target_socket_base
syn keyword UVMClass uvm_tlm_nb_target_socket
syn keyword UVMClass uvm_tlm_nb_target_socket_base
syn keyword UVMClass uvm_tlm_nb_transport_bw_export
syn keyword UVMClass uvm_tlm_nb_transport_bw_imp
syn keyword UVMClass uvm_tlm_nb_transport_bw_port
syn keyword UVMClass uvm_tlm_nb_transport_fw_export
syn keyword UVMClass uvm_tlm_nb_transport_fw_imp
syn keyword UVMClass uvm_tlm_nb_transport_fw_port
syn keyword UVMClass uvm_tlm_req_rsp_channel
syn keyword UVMClass uvm_tlm_time
syn keyword UVMClass uvm_tlm_transport_channel
syn keyword UVMClass uvm_top_down_visitor_adapter
syn keyword UVMClass uvm_topdown_phase
syn keyword UVMClass uvm_tr_database
syn keyword UVMClass uvm_tr_stream
syn keyword UVMClass uvm_transaction
syn keyword UVMClass uvm_tree_printer
syn keyword UVMClass uvm_utils
syn keyword UVMClass uvm_visitor
syn keyword UVMClass uvm_visitor_adapter
syn keyword UVMClass uvm_void
syn keyword UVMClass uvm_vreg
syn keyword UVMClass uvm_vreg_cbs
syn keyword UVMClass uvm_vreg_field
syn keyword UVMClass uvm_vreg_field_cbs

" UVM macros
" need enhance syn match   UVMMacro "`uvm_add_to_sequence_library\>"
" need enhance syn match   UVMMacro "`uvm_analysis_imp_decl\>"
" need enhance syn match   UVMMacro "`uvm_blocking_get_imp_decl\>"
" need enhance syn match   UVMMacro "`uvm_blocking_get_peek_imp_decl\>"
" need enhance syn match   UVMMacro "`uvm_blocking_master_imp_decl\>"
" need enhance syn match   UVMMacro "`uvm_blocking_peek_imp_decl\>"
" need enhance syn match   UVMMacro "`uvm_blocking_put_imp_decl\>"
" need enhance syn match   UVMMacro "`uvm_blocking_slave_imp_decl\>"
" need enhance syn match   UVMMacro "`uvm_blocking_transport_imp_decl\>"
" need enhance syn match   UVMMacro "`uvm_component_utils_end\>"
" need enhance syn match   UVMMacro "`uvm_component_param_utils\>"
" need enhance syn match   UVMMacro "`uvm_component_param_utils_begin\>"
" need enhance syn match   UVMMacro "`uvm_component_registry\>"
" need enhance syn match   UVMMacro "`uvm_component_utils\>"
" need enhance syn match   UVMMacro "`uvm_component_utils_begin\>"
" need enhance syn match   UVMMacro "`uvm_create\>"
" need enhance syn match   UVMMacro "`uvm_create_on\>"
" need enhance syn match   UVMMacro "`uvm_declare_p_sequencer\>"
" need enhance syn match   UVMMacro "`UVM_DEFAULT_TIMEOUT\>"
" need enhance syn match   UVMMacro "`uvm_do\>"
" need enhance syn match   UVMMacro "`uvm_do_callbacks\>"
" need enhance syn match   UVMMacro "`uvm_do_callbacks_exit_on\>"
" need enhance syn match   UVMMacro "`uvm_do_obj_callbacks\>"
" need enhance syn match   UVMMacro "`uvm_do_obj_callbacks_exit_on\>"
" need enhance syn match   UVMMacro "`uvm_do_on\>"
" need enhance syn match   UVMMacro "`uvm_do_on_pri\>"
" need enhance syn match   UVMMacro "`uvm_do_on_pri_with\>"
" need enhance syn match   UVMMacro "`uvm_do_on_with\>"
" need enhance syn match   UVMMacro "`uvm_do_pri\>"
" need enhance syn match   UVMMacro "`uvm_do_pri_with\>"
" need enhance syn match   UVMMacro "`uvm_do_with\>"
" need enhance syn match   UVMMacro "`uvm_error\>"
" need enhance syn match   UVMMacro "`uvm_error_begin\>"
" need enhance syn match   UVMMacro "`uvm_error_context\>"
" need enhance syn match   UVMMacro "`uvm_error_context_begin\>"
" need enhance syn match   UVMMacro "`uvm_error_context_end\>"
" need enhance syn match   UVMMacro "`uvm_error_end\>"
" need enhance syn match   UVMMacro "`uvm_fatal\>"
" need enhance syn match   UVMMacro "`uvm_fatal_begin\>"
" need enhance syn match   UVMMacro "`uvm_fatal_context\>"
" need enhance syn match   UVMMacro "`uvm_fatal_context_begin\>"
" need enhance syn match   UVMMacro "`uvm_fatal_context_end\>"
" need enhance syn match   UVMMacro "`uvm_fatal_end\>"
" need enhance syn match   UVMMacro "`uvm_field_aa_int_byte\>"
" need enhance syn match   UVMMacro "`uvm_field_aa_int_byte_unsigned\>"
" need enhance syn match   UVMMacro "`uvm_field_aa_int_enumkey\>"
" need enhance syn match   UVMMacro "`uvm_field_aa_int_int\>"
" need enhance syn match   UVMMacro "`uvm_field_aa_int_int_unsigned\>"
" need enhance syn match   UVMMacro "`uvm_field_aa_int_integer\>"
" need enhance syn match   UVMMacro "`uvm_field_aa_int_integer_unsigned\>"
" need enhance syn match   UVMMacro "`uvm_field_aa_int_key\>"
" need enhance syn match   UVMMacro "`uvm_field_aa_int_longint\>"
" need enhance syn match   UVMMacro "`uvm_field_aa_int_longint_unsigned\>"
" need enhance syn match   UVMMacro "`uvm_field_aa_int_shortint\>"
" need enhance syn match   UVMMacro "`uvm_field_aa_int_shortint_unsigned\>"
" need enhance syn match   UVMMacro "`uvm_field_aa_int_string\>"
" need enhance syn match   UVMMacro "`uvm_field_aa_object_int\>"
" need enhance syn match   UVMMacro "`uvm_field_aa_object_string\>"
" need enhance syn match   UVMMacro "`uvm_field_aa_string_string\>"
" need enhance syn match   UVMMacro "`uvm_field_array_enum\>"
" need enhance syn match   UVMMacro "`uvm_field_array_int\>"
" need enhance syn match   UVMMacro "`uvm_field_array_object\>"
" need enhance syn match   UVMMacro "`uvm_field_array_string\>"
" need enhance syn match   UVMMacro "`uvm_field_enum\>"
" need enhance syn match   UVMMacro "`uvm_field_event\>"
" need enhance syn match   UVMMacro "`uvm_field_int\>"
" need enhance syn match   UVMMacro "`uvm_field_object\>"
" need enhance syn match   UVMMacro "`uvm_field_queue_enum\>"
" need enhance syn match   UVMMacro "`uvm_field_queue_int\>"
" need enhance syn match   UVMMacro "`uvm_field_queue_object\>"
" need enhance syn match   UVMMacro "`uvm_field_queue_string\>"
" need enhance syn match   UVMMacro "`uvm_field_real\>"
" need enhance syn match   UVMMacro "`uvm_field_sarray_enum\>"
" need enhance syn match   UVMMacro "`uvm_field_sarray_int\>"
" need enhance syn match   UVMMacro "`uvm_field_sarray_object\>"
" need enhance syn match   UVMMacro "`uvm_field_sarray_string\>"
" need enhance syn match   UVMMacro "`uvm_field_string\>"
" need enhance syn match   UVMMacro "`uvm_field_utils_begin\>"
" need enhance syn match   UVMMacro "`uvm_field_utils_end\>"
" need enhance syn match   UVMMacro "`uvm_get_imp_decl\>"
" need enhance syn match   UVMMacro "`uvm_get_peek_imp_decl\>"
" need enhance syn match   UVMMacro "`uvm_info\>"
" need enhance syn match   UVMMacro "`uvm_info_begin\>"
" need enhance syn match   UVMMacro "`uvm_info_context\>"
" need enhance syn match   UVMMacro "`uvm_info_context_begin\>"
" need enhance syn match   UVMMacro "`uvm_info_context_end\>"
" need enhance syn match   UVMMacro "`uvm_info_end\>"
" need enhance syn match   UVMMacro "`uvm_master_imp_decl\>"
" need enhance syn match   UVMMacro "`UVM_MAX_STREAMBITS\>"
" need enhance syn match   UVMMacro "`uvm_message_add_int\>"
" need enhance syn match   UVMMacro "`uvm_message_add_object\>"
" need enhance syn match   UVMMacro "`uvm_message_add_string\>"
" need enhance syn match   UVMMacro "`uvm_message_add_tag\>"
" need enhance syn match   UVMMacro "`uvm_nonblocking_get_imp_decl\>"
" need enhance syn match   UVMMacro "`uvm_nonblocking_get_peek_imp_decl\>"
" need enhance syn match   UVMMacro "`uvm_nonblocking_master_imp_decl\>"
" need enhance syn match   UVMMacro "`uvm_nonblocking_peek_imp_decl\>"
" need enhance syn match   UVMMacro "`uvm_nonblocking_put_imp_decl\>"
" need enhance syn match   UVMMacro "`uvm_nonblocking_slave_imp_decl\>"
" need enhance syn match   UVMMacro "`uvm_nonblocking_transport_imp_decl\>"
" need enhance syn match   UVMMacro "`uvm_object_param_utils\>"
" need enhance syn match   UVMMacro "`uvm_object_param_utils_begin\>"
" need enhance syn match   UVMMacro "`uvm_object_registry\>"
" need enhance syn match   UVMMacro "`uvm_object_utils\>"
" need enhance syn match   UVMMacro "`uvm_object_utils_begin\>"
" need enhance syn match   UVMMacro "`uvm_object_utils_end\>"
" need enhance syn match   UVMMacro "`uvm_pack_array\>"
" need enhance syn match   UVMMacro "`uvm_pack_arrayN\>"
" need enhance syn match   UVMMacro "`uvm_pack_enum\>"
" need enhance syn match   UVMMacro "`uvm_pack_enumN\>"
" need enhance syn match   UVMMacro "`uvm_pack_int\>"
" need enhance syn match   UVMMacro "`uvm_pack_intN\>"
" need enhance syn match   UVMMacro "`uvm_pack_queue\>"
" need enhance syn match   UVMMacro "`uvm_pack_queueN\>"
" need enhance syn match   UVMMacro "`uvm_pack_real\>"
" need enhance syn match   UVMMacro "`uvm_pack_sarray\>"
" need enhance syn match   UVMMacro "`uvm_pack_sarrayN\>"
" need enhance syn match   UVMMacro "`uvm_pack_string\>"
" need enhance syn match   UVMMacro "`UVM_PACKER_MAX_BYTES\>"
" need enhance syn match   UVMMacro "`uvm_peek_imp_decl\>"
" need enhance syn match   UVMMacro "`uvm_put_imp_decl\>"
" need enhance syn match   UVMMacro "`uvm_rand_send\>"
" need enhance syn match   UVMMacro "`uvm_rand_send_pri\>"
" need enhance syn match   UVMMacro "`uvm_rand_send_pri_with\>"
" need enhance syn match   UVMMacro "`uvm_rand_send_with\>"
" need enhance syn match   UVMMacro "`uvm_record_attribute\>"
" need enhance syn match   UVMMacro "`uvm_record_field\>"
" need enhance syn match   UVMMacro "`uvm_record_int\>"
" need enhance syn match   UVMMacro "`uvm_record_real\>"
" need enhance syn match   UVMMacro "`uvm_record_string\>"
" need enhance syn match   UVMMacro "`uvm_record_time\>"
" need enhance syn match   UVMMacro "`UVM_REG_ADDR_WIDTH\>"
" need enhance syn match   UVMMacro "`UVM_REG_BYTENABLE_WIDTH\>"
" need enhance syn match   UVMMacro "`UVM_REG_CVR_WIDTH\>"
" need enhance syn match   UVMMacro "`UVM_REG_DATA_WIDTH\>"
" need enhance syn match   UVMMacro "`uvm_register_cb\>"
" need enhance syn match   UVMMacro "`uvm_send\>"
" need enhance syn match   UVMMacro "`uvm_send_pri\>"
" need enhance syn match   UVMMacro "`uvm_sequence_library_utils\>"
" need enhance syn match   UVMMacro "`uvm_set_super_type\>"
" need enhance syn match   UVMMacro "`uvm_slave_imp_decl\>"
" need enhance syn match   UVMMacro "`UVM_TLM_B_MASK\>"
" need enhance syn match   UVMMacro "`UVM_TLM_B_TRANSPORT_IMP\>"
" need enhance syn match   UVMMacro "`UVM_TLM_FUNCTION_ERROR\>"
" need enhance syn match   UVMMacro "`UVM_TLM_NB_BW_MASK\>"
" need enhance syn match   UVMMacro "`UVM_TLM_NB_FW_MASK\>"
" need enhance syn match   UVMMacro "`UVM_TLM_NB_TRANSPORT_BW_IMP\>"
" need enhance syn match   UVMMacro "`UVM_TLM_NB_TRANSPORT_FW_IMP\>"
" need enhance syn match   UVMMacro "`UVM_TLM_TASK_ERROR\>"
" need enhance syn match   UVMMacro "`uvm_transport_imp_decl\>"
" need enhance syn match   UVMMacro "`uvm_unpack_array\>"
" need enhance syn match   UVMMacro "`uvm_unpack_arrayN\>"
" need enhance syn match   UVMMacro "`uvm_unpack_enum\>"
" need enhance syn match   UVMMacro "`uvm_unpack_enumN\>"
" need enhance syn match   UVMMacro "`uvm_unpack_int\>"
" need enhance syn match   UVMMacro "`uvm_unpack_intN\>"
" need enhance syn match   UVMMacro "`uvm_unpack_queue\>"
" need enhance syn match   UVMMacro "`uvm_unpack_queueN\>"
" need enhance syn match   UVMMacro "`uvm_unpack_real\>"
" need enhance syn match   UVMMacro "`uvm_unpack_sarray\>"
" need enhance syn match   UVMMacro "`uvm_unpack_sarrayN\>"
" need enhance syn match   UVMMacro "`uvm_unpack_string\>"
" need enhance syn match   UVMMacro "`uvm_warning\>"
" need enhance syn match   UVMMacro "`uvm_warning_begin\>"
" need enhance syn match   UVMMacro "`uvm_warning_context\>"
" need enhance syn match   UVMMacro "`uvm_warning_context_begin\>"
" need enhance syn match   UVMMacro "`uvm_warning_context_end\>"
" need enhance syn match   UVMMacro "`uvm_warning_end\>"
" need enhance syn match   UVMMacro "\<UVM_FIX_REV\>"
" need enhance syn match   UVMMacro "\<UVM_MAJOR_REV\>"
" need enhance syn match   UVMMacro "\<UVM_MAJOR_REV_1\>"
" need enhance syn match   UVMMacro "\<UVM_MINOR_REV\>"
" need enhance syn match   UVMMacro "\<UVM_MINOR_REV_2\>"
" need enhance syn match   UVMMacro "\<UVM_NAME\>"
" need enhance syn match   UVMMacro "\<UVM_POST_VERSION_1_1\>"
" need enhance syn match   UVMMacro "\<uvm_sequence_library_utils\>"
" need enhance syn match   UVMMacro "\<UVM_VERSION_1_2\>"
" need enhance syn match   UVMMacro "\<UVM_VERSION_STRING\>"

" UVM method
syn match   UVMMethod "\<Connect\>"
syn match   UVMMethod "\<accept\>"
syn match   UVMMethod "\<accept_tr\>"
syn match   UVMMethod "\<add\>"
syn match   UVMMethod "\<add_by_name\>"
syn match   UVMMethod "\<add_callback\>"
syn match   UVMMethod "\<add_coverage\>"
syn match   UVMMethod "\<add_hdl_path\>"
syn match   UVMMethod "\<add_hdl_path_slice\>"
syn match   UVMMethod "\<add_int\>"
syn match   UVMMethod "\<add_mem\>"
syn match   UVMMethod "\<add_object\>"
syn match   UVMMethod "\<add_path\>"
syn match   UVMMethod "\<add_reg\>"
syn match   UVMMethod "\<add_sequence\>"
syn match   UVMMethod "\<add_sequences\>"
syn match   UVMMethod "\<add_slice\>"
syn match   UVMMethod "\<add_string\>"
syn match   UVMMethod "\<add_submap\>"
syn match   UVMMethod "\<add_typewide_sequence\>"
syn match   UVMMethod "\<add_typewide_sequences\>"
syn match   UVMMethod "\<add_uvm_phases\>"
syn match   UVMMethod "\<adjust_name\>"
syn match   UVMMethod "\<all_dropped\>"
syn match   UVMMethod "\<allocate\>"
syn match   UVMMethod "\<apply_config_settings\>"
syn match   UVMMethod "\<b_transport\>"
syn match   UVMMethod "\<backdoor\>"
syn match   UVMMethod "\<backdoor_read\>"
syn match   UVMMethod "\<backdoor_read_func\>"
syn match   UVMMethod "\<backdoor_watch\>"
syn match   UVMMethod "\<backdoor_write\>"
syn match   UVMMethod "\<begin_child_tr\>"
syn match   UVMMethod "\<begin_tr\>"
syn match   UVMMethod "\<begin_v\>"
syn match   UVMMethod "\<body\>"
syn match   UVMMethod "\<build_coverage\>"
syn match   UVMMethod "\<build_phase\>"
syn match   UVMMethod "\<reset_phase\>"
syn match   UVMMethod "\<main_phase\>"
syn match   UVMMethod "\<burst_read\>"
syn match   UVMMethod "\<burst_write\>"
syn match   UVMMethod "\<bus2reg\>"
syn match   UVMMethod "\<callback_mode\>"
syn match   UVMMethod "\<can_get\>"
syn match   UVMMethod "\<can_peek\>"
syn match   UVMMethod "\<can_put\>"
syn match   UVMMethod "\<cancel\>"
syn match   UVMMethod "\<capacity\>"
syn match   UVMMethod "\<catch\>"
syn match   UVMMethod "\<check_config_usage\>"
syn match   UVMMethod "\<check_data_width\>"
syn match   UVMMethod "\<check_phase\>"
syn match   UVMMethod "\<clear\>"
syn match   UVMMethod "\<clear_extension\>"
syn match   UVMMethod "\<clear_extensions\>"
syn match   UVMMethod "\<clear_hdl_path\>"
syn match   UVMMethod "\<clear_response_queue\>"
syn match   UVMMethod "\<clone\>"
syn match   UVMMethod "\<close\>"
syn match   UVMMethod "\<close_db\>"
syn match   UVMMethod "\<compare\>"
syn match   UVMMethod "\<compare_field\>"
syn match   UVMMethod "\<compare_field_int\>"
syn match   UVMMethod "\<compare_field_real\>"
syn match   UVMMethod "\<compare_object\>"
syn match   UVMMethod "\<compare_string\>"
syn match   UVMMethod "\<compose_report_message\>"
syn match   UVMMethod "\<configure\>"
syn match   UVMMethod "\<configure_phase\>"
syn match   UVMMethod "\<connect\>"
syn match   UVMMethod "\<connect_phase\>"
syn match   UVMMethod "\<convert2string\>"
syn match   UVMMethod "\<copy\>"
syn match   UVMMethod "\<create\>"
syn match   UVMMethod "\<create_component\>"
syn match   UVMMethod "\<create_component_by_name\>"
syn match   UVMMethod "\<create_component_by_type\>"
syn match   UVMMethod "\<create_item\>"
syn match   UVMMethod "\<create_map\>"
syn match   UVMMethod "\<create_object\>"
syn match   UVMMethod "\<create_object_by_name\>"
syn match   UVMMethod "\<create_object_by_type\>"
syn match   UVMMethod "\<current_grabber\>"

" UVM types
syn match   UVMType "\<alloc_mode_e\>"
syn match   UVMType "\<locality_e\>"
syn match   UVMType "\<uvm_access_e\>"
syn match   UVMType "\<uvm_action\>"
syn match   UVMType "\<uvm_active_passive_enum\>"
syn match   UVMType "\<uvm_bitstream_t\>"
syn match   UVMType "\<uvm_check_e\>"
syn match   UVMType "\<uvm_coverage_model_e\>"
syn match   UVMType "\<uvm_elem_kind_e\>"
syn match   UVMType "\<uvm_endianness_e\>"
syn match   UVMType "\<uvm_hdl_path_slice\>"
syn match   UVMType "\<uvm_hier_e\>"
syn match   UVMType "\<uvm_integral_t\>"
syn match   UVMType "\<uvm_mem_cb\>"
syn match   UVMType "\<uvm_mem_cb_iter\>"
syn match   UVMType "\<uvm_objection_event\>"
syn match   UVMType "\<uvm_path_e\>"
syn match   UVMType "\<uvm_phase_state\>"
syn match   UVMType "\<uvm_phase_type\>"
syn match   UVMType "\<uvm_port_type_e\>"
syn match   UVMType "\<uvm_predict_e\>"
syn match   UVMType "\<uvm_radix_enum\>"
syn match   UVMType "\<uvm_recursion_policy_enum\>"
syn match   UVMType "\<uvm_reg_addr_logic_t\>"
syn match   UVMType "\<uvm_reg_addr_t\>"
syn match   UVMType "\<uvm_reg_bd_cb\>"
syn match   UVMType "\<uvm_reg_bd_cb_iter\>"
syn match   UVMType "\<uvm_reg_byte_en_t\>"
syn match   UVMType "\<uvm_reg_cb\>"
syn match   UVMType "\<uvm_reg_cb_iter\>"
syn match   UVMType "\<uvm_reg_cvr_t\>"
syn match   UVMType "\<uvm_reg_data_logic_t\>"
syn match   UVMType "\<uvm_reg_data_t\>"
syn match   UVMType "\<uvm_reg_field_cb\>"
syn match   UVMType "\<uvm_reg_field_cb_iter\>"
syn match   UVMType "\<uvm_reg_mem_tests_e\>"
syn match   UVMType "\<uvm_sequence_lib_mode\>"
syn match   UVMType "\<uvm_sequence_state_enum\>"
syn match   UVMType "\<uvm_sequencer_arb_mode\>"
syn match   UVMType "\<uvm_severity\>"
syn match   UVMType "\<uvm_status_e\>"
syn match   UVMType "\<uvm_tlm_command_e\>"
syn match   UVMType "\<uvm_tlm_phase_e\>"
syn match   UVMType "\<uvm_tlm_response_status_e\>"
syn match   UVMType "\<uvm_tlm_sync_e\>"
syn match   UVMType "\<uvm_verbosity\>"
syn match   UVMType "\<uvm_vreg_cb\>"
syn match   UVMType "\<uvm_vreg_cb_iter\>"
syn match   UVMType "\<uvm_vreg_field_cb\>"
syn match   UVMType "\<uvm_vreg_field_cb_iter\>"
syn match   UVMType "\<uvm_wait_op\>"

" UVM Variables
syn match   UVMVariable "\<raise_objection\>"
syn match   UVMVariable "\<drop_objection\>"
syn match   UVMVariable "\<abstract\>"
syn match   UVMVariable "\<abstractions\>"
syn match   UVMVariable "\<adapter\>"
syn match   UVMVariable "\<addr\>"
syn match   UVMVariable "\<bd_kind\>"
syn match   UVMVariable "\<begin_elements\>"
syn match   UVMVariable "\<begin_event\>"
syn match   UVMVariable "\<big_endian\>"
syn match   UVMVariable "\<bin_radix\>"
syn match   UVMVariable "\<body\>"
syn match   UVMVariable "\<bus_in\>"
syn match   UVMVariable "\<byte_en\>"
syn match   UVMVariable "\<check_type\>"
syn match   UVMVariable "\<data\>"
syn match   UVMVariable "\<dec_radix\>"
syn match   UVMVariable "\<default_alloc\>"
syn match   UVMVariable "\<default_map\>"
syn match   UVMVariable "\<default_path\>"
syn match   UVMVariable "\<default_precedence\>"
syn match   UVMVariable "\<default_radix\>"
syn match   UVMVariable "\<depth\>"
syn match   UVMVariable "\<do_not_randomize\>"
syn match   UVMVariable "\<element\>"
syn match   UVMVariable "\<element_kind\>"
syn match   UVMVariable "\<enable_print_topology\>"
syn match   UVMVariable "\<enable_report_id_count_summary\>"
syn match   UVMVariable "\<end_elements\>"
syn match   UVMVariable "\<end_event\>"
syn match   UVMVariable "\<end_offset\>"
syn match   UVMVariable "\<events\>"
syn match   UVMVariable "\<extension\>"
syn match   UVMVariable "\<fifo\>"
syn match   UVMVariable "\<finish_on_completion\>"
syn match   UVMVariable "\<fname\>"
syn match   UVMVariable "\<footer\>"
syn match   UVMVariable "\<full_name\>"
syn match   UVMVariable "\<header\>"
syn match   UVMVariable "\<hex_radix\>"
syn match   UVMVariable "\<identifier\>"
syn match   UVMVariable "\<in_use\>"
syn match   UVMVariable "\<indent\>"
syn match   UVMVariable "\<kind\>"
syn match   UVMVariable "\<knobs\>"
syn match   UVMVariable "\<len\>"
syn match   UVMVariable "\<lineno\>"
syn match   UVMVariable "\<local_map\>"
syn match   UVMVariable "\<locality\>"
syn match   UVMVariable "\<m_address\>"
syn match   UVMVariable "\<m_byte_enable\>"
syn match   UVMVariable "\<m_byte_enable_length\>"
syn match   UVMVariable "\<m_command\>"
syn match   UVMVariable "\<m_data\>"
syn match   UVMVariable "\<m_dmi\>"
syn match   UVMVariable "\<m_length\>"
syn match   UVMVariable "\<m_response_status\>"
syn match   UVMVariable "\<m_streaming_width\>"
syn match   UVMVariable "\<mam\>"
syn match   UVMVariable "\<map\>"
syn match   UVMVariable "\<max_offset\>"
syn match   UVMVariable "\<max_random_count\>"
syn match   UVMVariable "\<mcd\>"
syn match   UVMVariable "\<mem\>"
syn match   UVMVariable "\<mem_seq\>"
syn match   UVMVariable "\<min_offset\>"
syn match   UVMVariable "\<min_random_count\>"
syn match   UVMVariable "\<miscompares\>"
syn match   UVMVariable "\<mode\>"
syn match   UVMVariable "\<model\>"
syn match   UVMVariable "\<n_bits\>"
syn match   UVMVariable "\<n_bytes\>"
syn match   UVMVariable "\<new\>"
syn match   UVMVariable "\<oct_radix\>"
syn match   UVMVariable "\<offset\>"
syn match   UVMVariable "\<parent\>"
syn match   UVMVariable "\<parent_sequence\>"
syn match   UVMVariable "\<path\>"
syn match   UVMVariable "\<physical\>"
syn match   UVMVariable "\<policy\>"
syn match   UVMVariable "\<precedence\>"
syn match   UVMVariable "\<prefix\>"
syn match   UVMVariable "\<print_config_matches\>"
syn match   UVMVariable "\<print_enabled\>"
syn match   UVMVariable "\<prior\>"
syn match   UVMVariable "\<provides_responses\>"
syn match   UVMVariable "\<record_all_messages\>"
syn match   UVMVariable "\<recursion_policy\>"
syn match   UVMVariable "\<reference\>"
syn match   UVMVariable "\<reg_ap\>"
syn match   UVMVariable "\<reg_seq\>"
syn match   UVMVariable "\<reg_seqr\>"
syn match   UVMVariable "\<result\>"
syn match   UVMVariable "\<rg\>"
syn match   UVMVariable "\<rw_info\>"
syn match   UVMVariable "\<select_rand\>"
syn match   UVMVariable "\<select_randc\>"
syn match   UVMVariable "\<selection_mode\>"
syn match   UVMVariable "\<separator\>"
syn match   UVMVariable "\<sequence_count\>"
syn match   UVMVariable "\<sequencer\>"
syn match   UVMVariable "\<sequences_executed\>"
syn match   UVMVariable "\<sev\>"
syn match   UVMVariable "\<show_max\>"
syn match   UVMVariable "\<show_radix\>"
syn match   UVMVariable "\<show_root\>"
syn match   UVMVariable "\<show_terminator\>"
syn match   UVMVariable "\<show_verbosity\>"
syn match   UVMVariable "\<size\>"
syn match   UVMVariable "\<slices\>"
syn match   UVMVariable "\<start_offset\>"
syn match   UVMVariable "\<status\>"
syn match   UVMVariable "\<supports_byte_enable\>"
syn match   UVMVariable "\<T1 first\>"
syn match   UVMVariable "\<T2 second\>"
syn match   UVMVariable "\<tests\>"
syn match   UVMVariable "\<top_levels\>"
syn match   UVMVariable "\<tr_database\>"
syn match   UVMVariable "\<type_name\>"
syn match   UVMVariable "\<unsigned_radix\>"
syn match   UVMVariable "\<use_metadata\>"
syn match   UVMVariable "\<use_uvm_seeding\>"
syn match   UVMVariable "\<uvm_default_comparer\>"
syn match   UVMVariable "\<uvm_default_line_printer\>"
syn match   UVMVariable "\<uvm_default_packer\>"
syn match   UVMVariable "\<uvm_default_printer\>"
syn match   UVMVariable "\<uvm_default_table_printer\>"
syn match   UVMVariable "\<uvm_default_tree_printer\>"
syn match   UVMVariable "\<UVM_HDL_MAX_WIDTH\>"
syn match   UVMVariable "\<uvm_top\>"
syn match   UVMVariable "\<value\>"
syn match   UVMVariable "\<verbosity\>"

" UVM constant
syn match   UVMConstant "\<BEGIN_REQ\>"
syn match   UVMConstant "\<BEGIN_RESP\>"
syn match   UVMConstant "\<END_REQ\>"
syn match   UVMConstant "\<END_RESP\>"
syn match   UVMConstant "\<UNINITIALIZED_PHASE\>"
syn match   UVMConstant "\<UVM_ACTIVE\>"
syn match   UVMConstant "\<UVM_ALL_DROPPED\>"
syn match   UVMConstant "\<UVM_BACKDOOR\>"
syn match   UVMConstant "\<UVM_BIG_ENDIAN\>"
syn match   UVMConstant "\<UVM_BIG_FIFO\>"
syn match   UVMConstant "\<UVM_BIN\>"
syn match   UVMConstant "\<UVM_BODY\>"
syn match   UVMConstant "\<UVM_CALL_HOOK\>"
syn match   UVMConstant "\<UVM_CHECK\>"
syn match   UVMConstant "\<UVM_COUNT\>"
syn match   UVMConstant "\<UVM_CREATED\>"
syn match   UVMConstant "\<UVM_CVR_ADDR_MAP\>"
syn match   UVMConstant "\<UVM_CVR_ALL\>"
syn match   UVMConstant "\<UVM_CVR_FIELD_VALS\>"
syn match   UVMConstant "\<UVM_CVR_REG_BITS\>"
syn match   UVMConstant "\<UVM_DEC\>"
syn match   UVMConstant "\<UVM_DEEP\>"
syn match   UVMConstant "\<UVM_DEFAULT_PATH\>"
syn match   UVMConstant "\<UVM_DISPLAY\>"
syn match   UVMConstant "\<UVM_DO_ALL_REG_MEM_TESTS\>"
syn match   UVMConstant "\<UVM_DO_MEM_ACCESS\>"
syn match   UVMConstant "\<UVM_DO_MEM_WALK\>"
syn match   UVMConstant "\<UVM_DO_REG_ACCESS\>"
syn match   UVMConstant "\<UVM_DO_REG_BIT_BASH\>"
syn match   UVMConstant "\<UVM_DO_REG_HW_RESET\>"
syn match   UVMConstant "\<UVM_DO_SHARED_ACCESS\>"
syn match   UVMConstant "\<UVM_DROPPED\>"
syn match   UVMConstant "\<UVM_ENDED\>"
syn match   UVMConstant "\<UVM_ENUM\>"
syn match   UVMConstant "\<UVM_EQ\>"
syn match   UVMConstant "\<UVM_ERROR\>"
syn match   UVMConstant "\<UVM_EXIT\>"
syn match   UVMConstant "\<UVM_EXPORT\>"
syn match   UVMConstant "\<UVM_FATAL\>"
syn match   UVMConstant "\<UVM_FIELD\>"
syn match   UVMConstant "\<UVM_FINISHED\>"
syn match   UVMConstant "\<UVM_FRONTDOOR\>"
syn match   UVMConstant "\<UVM_FULL\>"
syn match   UVMConstant "\<UVM_GT\>"
syn match   UVMConstant "\<UVM_GTE\>"
syn match   UVMConstant "\<UVM_HAS_X\>"
syn match   UVMConstant "\<UVM_HEX\>"
syn match   UVMConstant "\<UVM_HIER\>"
syn match   UVMConstant "\<UVM_HIGH\>"
syn match   UVMConstant "\<UVM_IMPLEMENTATION\>"
syn match   UVMConstant "\<UVM_INFO\>"
syn match   UVMConstant "\<UVM_IS_OK\>"
syn match   UVMConstant "\<UVM_LITTLE_ENDIAN\>"
syn match   UVMConstant "\<UVM_LITTLE_FIFO\>"
syn match   UVMConstant "\<UVM_LOG\>"
syn match   UVMConstant "\<UVM_LOW\>"
syn match   UVMConstant "\<UVM_LT\>"
syn match   UVMConstant "\<UVM_LTE\>"
syn match   UVMConstant "\<UVM_MEDIUM\>"
syn match   UVMConstant "\<UVM_MEM\>"
syn match   UVMConstant "\<UVM_NE\>"
syn match   UVMConstant "\<UVM_NO_ACTION\>"
syn match   UVMConstant "\<UVM_NO_CHECK\>"
syn match   UVMConstant "\<UVM_NO_COVERAGE\>"
syn match   UVMConstant "\<UVM_NO_ENDIAN\>"
syn match   UVMConstant "\<UVM_NO_HIER\>"
syn match   UVMConstant "\<UVM_NONE\>"
syn match   UVMConstant "\<UVM_NOT_OK\>"
syn match   UVMConstant "\<UVM_OCT\>"
syn match   UVMConstant "\<UVM_PASSIVE\>"
syn match   UVMConstant "\<UVM_PHASE_CLEANUP\>"
syn match   UVMConstant "\<UVM_PHASE_DOMAIN\>"
syn match   UVMConstant "\<UVM_PHASE_DONE\>"
syn match   UVMConstant "\<UVM_PHASE_DORMANT\>"
syn match   UVMConstant "\<UVM_PHASE_ENDED\>"
syn match   UVMConstant "\<UVM_PHASE_EXECUTING\>"
syn match   UVMConstant "\<UVM_PHASE_IMP\>"
syn match   UVMConstant "\<UVM_PHASE_JUMPING\>"
syn match   UVMConstant "\<UVM_PHASE_NODE\>"
syn match   UVMConstant "\<UVM_PHASE_READY_TO_END\>"
syn match   UVMConstant "\<UVM_PHASE_SCHEDULE\>"
syn match   UVMConstant "\<UVM_PHASE_SCHEDULED\>"
syn match   UVMConstant "\<UVM_PHASE_STARTED\>"
syn match   UVMConstant "\<UVM_PHASE_SYNCING\>"
syn match   UVMConstant "\<UVM_PHASE_TERMINAL\>"
syn match   UVMConstant "\<UVM_PHASE_UNINITIALIZED\>"
syn match   UVMConstant "\<UVM_PORT\>"
syn match   UVMConstant "\<UVM_POST_BODY\>"
syn match   UVMConstant "\<UVM_POST_START\>"
syn match   UVMConstant "\<UVM_PRE_BODY\>"
syn match   UVMConstant "\<UVM_PRE_START\>"
syn match   UVMConstant "\<UVM_PREDICT\>"
syn match   UVMConstant "\<UVM_PREDICT_DIRECT\>"
syn match   UVMConstant "\<UVM_PREDICT_READ\>"
syn match   UVMConstant "\<UVM_PREDICT_WRITE\>"
syn match   UVMConstant "\<UVM_RAISED\>"
syn match   UVMConstant "\<UVM_READ\>"
syn match   UVMConstant "\<UVM_REAL\>"
syn match   UVMConstant "\<UVM_REAL_DEC\>"
syn match   UVMConstant "\<UVM_REAL_EXP\>"
syn match   UVMConstant "\<UVM_REFERENCE\>"
syn match   UVMConstant "\<UVM_REG\>"
syn match   UVMConstant "\<UVM_RM_RECORD\>"
syn match   UVMConstant "\<UVM_SEQ_ARB_FIFO\>"
syn match   UVMConstant "\<UVM_SEQ_ARB_RANDOM\>"
syn match   UVMConstant "\<UVM_SEQ_ARB_STRICT_FIFO\>"
syn match   UVMConstant "\<UVM_SEQ_ARB_STRICT_RANDOM\>"
syn match   UVMConstant "\<UVM_SEQ_ARB_USER\>"
syn match   UVMConstant "\<UVM_SEQ_ARB_WEIGHTED\>"
syn match   UVMConstant "\<UVM_SEQ_LIB_ITEM\>"
syn match   UVMConstant "\<UVM_SEQ_LIB_RAND\>"
syn match   UVMConstant "\<UVM_SEQ_LIB_RANDC\>"
syn match   UVMConstant "\<UVM_SEQ_LIB_USER\>"
syn match   UVMConstant "\<UVM_SHALLOW\>"
syn match   UVMConstant "\<UVM_STOP\>"
syn match   UVMConstant "\<UVM_STOPPED\>"
syn match   UVMConstant "\<UVM_STRING\>"
syn match   UVMConstant "\<UVM_TIME\>"
syn match   UVMConstant "\<UVM_TLM_ACCEPTED\>"
syn match   UVMConstant "\<UVM_TLM_ADDRESS_ERROR_RESPONSE\>"
syn match   UVMConstant "\<UVM_TLM_BURST_ERROR_RESPONSE\>"
syn match   UVMConstant "\<UVM_TLM_BYTE_ENABLE_ERROR_RESPONSE\>"
syn match   UVMConstant "\<UVM_TLM_COMMAND_ERROR_RESPONSE\>"
syn match   UVMConstant "\<UVM_TLM_COMPLETED\>"
syn match   UVMConstant "\<UVM_TLM_GENERIC_ERROR_RESPONSE\>"
syn match   UVMConstant "\<UVM_TLM_IGNORE_COMMAND\>"
syn match   UVMConstant "\<UVM_TLM_INCOMPLETE_RESPONSE\>"
syn match   UVMConstant "\<UVM_TLM_OK_RESPONSE\>"
syn match   UVMConstant "\<UVM_TLM_READ_COMMAND\>"
syn match   UVMConstant "\<UVM_TLM_UPDATED\>"
syn match   UVMConstant "\<UVM_TLM_WRITE_COMMAND\>"
syn match   UVMConstant "\<UVM_UNFORMAT2\>"
syn match   UVMConstant "\<UVM_UNFORMAT4\>"
syn match   UVMConstant "\<UVM_UNSIGNED\>"
syn match   UVMConstant "\<UVM_WARNING\>"
syn match   UVMConstant "\<UVM_WRITE\>"

" UVM port
syn match   UVMPort "\<after_export\>"
syn match   UVMPort "\<analysis_export\>"
syn match   UVMPort "\<analysis_export\>"
syn match   UVMPort "\<before_export\>"
syn match   UVMPort "\<blocking_put_port\>"
syn match   UVMPort "\<get_ap\>"
syn match   UVMPort "\<get_peek_export\>"
syn match   UVMPort "\<get_peek_request_export\>"
syn match   UVMPort "\<get_peek_response_export\>"
syn match   UVMPort "\<master_export\>"
syn match   UVMPort "\<pair_ap\>"
syn match   UVMPort "\<put_ap\>"
syn match   UVMPort "\<put_export\>"
syn match   UVMPort "\<put_request_export\>"
syn match   UVMPort "\<put_response_export\>"
syn match   UVMPort "\<req_export\>"
syn match   UVMPort "\<req_port\>"
syn match   UVMPort "\<request_ap\>"
syn match   UVMPort "\<response_ap\>"
syn match   UVMPort "\<rsp_export\>"
syn match   UVMPort "\<rsp_port\>"
syn match   UVMPort "\<seq_item_port\>"
syn match   UVMPort "\<seq_item_export\>"
syn match   UVMPort "\<slave_export\>"
syn match   UVMPort "\<transport_export\>"

" UVM Root Method
syn match   UVMRootMethod "\<die\>"
syn match   UVMRootMethod "\<enable_print_topology\>"
syn match   UVMRootMethod "\<find\>"
syn match   UVMRootMethod "\<find_all\>"
syn match   UVMRootMethod "\<finish_on_completion\>"
syn match   UVMRootMethod "\<get\>"
syn match   UVMRootMethod "\<print_topology\>"
syn match   UVMRootMethod "\<run_test\>"
syn match   UVMRootMethod "\<set_timeout\>"
syn match   UVMRootMethod "\<top_levels\>"
syn match   UVMRootMethod "\<uvm_top\>"

" Modify the following as needed.  The trade-off is performance versus functionality.
syn sync lines=80

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_systemverilog_syn_inits")
    if version < 508
        let did_systemverilog_syn_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif

    " The default highlighting.
    " hi link systemverilogCharacter       Character
    " hi link systemverilogConditional     Conditional
    " hi link systemverilogRepeat          Repeat
    " hi link systemverilogTodo            Todo
    " hi link systemverilogConstant        Constant
    " hi link systemverilogLabel           Label
    " hi link systemverilogNumber          Number
    " hi link systemverilogGlobal          Define
    " hi link systemverilogDirective       SpecialComment
    " hi link systemverilogEscape          Special
    " hi link systemverilog1800Keyword     Keyword
    " hi link systemverilog1800Systemtask  Function
    " hi link VMMClassSeries               Structure
    " hi link VMMClass                     Structure
    " hi link VMMMacro                     Define
    " hi link VMMMethod                    Function
    " hi link VMMType                      Type
    " hi link UVMClassSeries               Structure
    " hi link UVMClass                     Structure
    " hi link UVMMacro                     Define
    " hi link UVMMethod                    Function
    " hi link UVMType                      Type
    " hi link UVMVariable                  Identifier
    " hi link UVMConstant                  Constant
    " hi link UVMPort                      Underlined
    " hi link UVMRootMethod                Delimiter

	" new defined by Ryan
	hi link systemverilogTypes           FieldType
    hi link systemverilogStatement       Statement
    hi link systemverilogComment         Comment
	hi link systemverilogNormalMacros    NMacro
	hi link systemverilogDirectives      PreCompiler
	hi link systemverilogNumber          Number
	hi link systemverilogVars            Variable
    hi link systemverilogOperator        Special
    hi link systemverilogString          String
    hi link systemverilogBIMethod        Methods

    delcommand HiLink
endif

let b:current_syntax = "uvm"

" vim: ts=4
