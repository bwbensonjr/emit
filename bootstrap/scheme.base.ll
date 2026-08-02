declare align 8 ptr @rt_alloc_words(i64)
declare i64 @rt_cons(i64, i64)
declare i64 @rt_car(i64)
declare i64 @rt_cdr(i64)
declare i64 @rt_box(i64)
declare i64 @rt_unbox(i64)
declare i64 @rt_set_box(i64, i64)
declare i64 @rt_add(i64, i64)
declare i64 @rt_sub(i64, i64)
declare i64 @rt_mul(i64, i64)
declare i64 @rt_div(i64, i64)
declare i64 @rt_quotient(i64, i64)
declare i64 @rt_remainder(i64, i64)
declare i64 @rt_modulo(i64, i64)
declare i64 @rt_num_eq(i64, i64)
declare i64 @rt_lt(i64, i64)
declare i64 @rt_flonum_lit(ptr)
declare i64 @rt_make_flonum(double)
declare i64 @rt_string_to_flonum(i64)
declare i64 @rt_flonum_to_string(i64)
declare i64 @rt_flonum_p(i64)
declare i64 @rt_number_p(i64)
declare i64 @rt_real_p(i64)
declare i64 @rt_inexact_p(i64)
declare i64 @rt_exact_to_inexact(i64)
declare i64 @rt_inexact_to_exact(i64)
declare i64 @rt_write_char(i64)
declare i64 @rt_null_p(i64)
declare i64 @rt_pair_p(i64)
declare i64 @rt_eq_p(i64, i64)
declare i64 @rt_eqv_p(i64, i64)
declare i64 @rt_equal(i64, i64)
declare i64 @rt_not(i64)
declare i64 @rt_intern(ptr)
declare i64 @rt_make_string(ptr, i64)
declare i64 @rt_char_to_integer(i64)
declare i64 @rt_integer_to_char(i64)
declare i64 @rt_string_length(i64)
declare i64 @rt_string_ref(i64, i64)
declare i64 @rt_substring(i64, i64, i64)
declare i64 @rt_string_to_symbol(i64)
declare i64 @rt_string_eq(i64, i64)
declare i64 @rt_string_append(i64, i64)
declare i64 @rt_symbol_to_string(i64)
declare i64 @rt_list_to_string(i64)
declare i64 @rt_make_string_fill(i64, i64)
declare i64 @rt_string_set(i64, i64, i64)
declare i64 @rt_string_copy(i64)
declare i64 @rt_make_vector(i64, i64)
declare i64 @rt_vector_ref(i64, i64)
declare i64 @rt_vector_set(i64, i64, i64)
declare i64 @rt_vector_length(i64)
declare i64 @rt_vector_p(i64)
declare i64 @rt_make_bytevector(i64, i64)
declare i64 @rt_bytevector_u8_ref(i64, i64)
declare i64 @rt_bytevector_u8_set(i64, i64, i64)
declare i64 @rt_bytevector_length(i64)
declare i64 @rt_bytevector_p(i64)
declare i64 @rt_hash(i64)
declare i64 @rt_make_hash_table(i64)
declare i64 @rt_hash_table_p(i64)
declare i64 @rt_hash_table_spine(i64)
declare i64 @rt_make_record_type(i64)
declare i64 @rt_make_record(i64, i64)
declare i64 @rt_record_ref(i64, i64)
declare i64 @rt_record_set(i64, i64, i64)
declare i64 @rt_record_of_type_p(i64, i64)
declare i64 @rt_record_p(i64)
declare i64 @rt_list_to_mv(i64)
declare i64 @rt_mv_p(i64)
declare i64 @rt_mv_to_list(i64)
declare i64 @rt_symbol_p(i64)
declare i64 @rt_string_p(i64)
declare i64 @rt_char_p(i64)
declare i64 @rt_boolean_p(i64)
declare i64 @rt_integer_p(i64)
declare i64 @rt_exact_p(i64)
declare i64 @rt_read_all_stdin()
declare i64 @rt_no_prelude_p()
declare i64 @rt_dump_level()
declare i64 @rt_stderr_write(i64, i64)
declare i64 @rt_repl_mode()
declare i64 @rt_repl_input()
declare i64 @rt_repl_state_ref()
declare i64 @rt_repl_state_set(i64)
declare i64 @rt_root(i64)
declare i64 @rt_display(i64)
declare i64 @rt_write_val(i64)
declare i64 @rt_newline()
declare i64 @rt_eof_object()
declare i64 @rt_eof_object_p(i64)
declare i64 @rt_read_file(i64)
declare i64 @rt_port_open_output_file(i64)
declare i64 @rt_port_open_output_string()
declare i64 @rt_port_get_output_string(i64)
declare i64 @rt_port_flush(i64)
declare i64 @rt_port_close(i64)
declare i64 @rt_set_current_output(i64)
declare i64 @rt_write_string(i64)
declare i64 @rt_port_display(i64, i64)
declare i64 @rt_port_write(i64, i64)
declare i64 @rt_port_newline(i64)
declare i64 @rt_port_write_char(i64, i64)
declare i64 @rt_port_write_string(i64, i64)
declare i64 @rt_list_length(i64)
declare i64 @rt_build_rest(i64, i64, i64, ptr, ptr)
declare ptr @rt_apply_argv(i64, ptr, i64, i64)
declare void @rt_arity_error(i64, i64)
declare i64 @rt_error(i64, i64)
declare i64 @rt_raise(i64)
declare i64 @rt_make_error_object(i64, i64)
declare i64 @rt_escape_frame()
declare i64 @rt_escape_to(i64, i64)
declare i64 @rt_escape_live_p(i64)
declare i64 @rt_run_guarded(ptr, i64)
declare i64 @rt_error_object_p(i64)
declare i64 @rt_error_object_message(i64)
declare i64 @rt_error_object_irritants(i64)

@.str.lit.0 = private unnamed_addr constant [1 x i8] c"\00"
@.str.lit.1 = private unnamed_addr constant [2 x i8] c"0\00"
@.str.lit.2 = private unnamed_addr constant [3 x i8] c": \00"
@.str.sym.3 = private unnamed_addr constant [8 x i8] c"call/cc\00"
@.str.lit.4 = private unnamed_addr constant [40 x i8] c"continuation invoked outside its extent\00"
@.str.lit.5 = private unnamed_addr constant [30 x i8] c"hash-table-ref: key not found\00"
@.str.lit.6 = private unnamed_addr constant [6 x i8] c"space\00"
@.str.lit.7 = private unnamed_addr constant [8 x i8] c"newline\00"
@.str.lit.8 = private unnamed_addr constant [4 x i8] c"tab\00"
@.str.lit.9 = private unnamed_addr constant [7 x i8] c"return\00"
@.str.lit.10 = private unnamed_addr constant [4 x i8] c"nul\00"
@.str.lit.11 = private unnamed_addr constant [5 x i8] c"null\00"
@.str.lit.12 = private unnamed_addr constant [7 x i8] c"delete\00"
@.str.lit.13 = private unnamed_addr constant [8 x i8] c"altmode\00"
@.str.lit.14 = private unnamed_addr constant [4 x i8] c"esc\00"
@.str.sym.15 = private unnamed_addr constant [6 x i8] c"quote\00"
@.str.sym.16 = private unnamed_addr constant [11 x i8] c"quasiquote\00"
@.str.sym.17 = private unnamed_addr constant [17 x i8] c"unquote-splicing\00"
@.str.sym.18 = private unnamed_addr constant [8 x i8] c"unquote\00"
@.str.lit.19 = private unnamed_addr constant [5 x i8] c"port\00"
@.str.lit.20 = private unnamed_addr constant [18 x i8] c"not an input port\00"
@.str.lit.21 = private unnamed_addr constant [15 x i8] c"port is closed\00"
@.str.lit.22 = private unnamed_addr constant [19 x i8] c"not an output port\00"
@.str.lit.23 = private unnamed_addr constant [15 x i8] c"port is closed\00"
@.str.sym.24 = private unnamed_addr constant [16 x i8] c"open-input-file\00"
@.str.lit.25 = private unnamed_addr constant [27 x i8] c"cannot open file for input\00"
@.str.sym.26 = private unnamed_addr constant [10 x i8] c"read-char\00"
@.str.sym.27 = private unnamed_addr constant [10 x i8] c"peek-char\00"
@.str.sym.28 = private unnamed_addr constant [10 x i8] c"read-line\00"
@.str.sym.29 = private unnamed_addr constant [12 x i8] c"read-string\00"
@.str.sym.30 = private unnamed_addr constant [5 x i8] c"read\00"
@.str.sym.31 = private unnamed_addr constant [17 x i8] c"open-output-file\00"
@.str.lit.32 = private unnamed_addr constant [28 x i8] c"cannot open file for output\00"
@.str.sym.33 = private unnamed_addr constant [19 x i8] c"open-output-string\00"
@.str.lit.34 = private unnamed_addr constant [34 x i8] c"cannot open an output string port\00"
@.str.sym.35 = private unnamed_addr constant [18 x i8] c"get-output-string\00"
@.str.lit.36 = private unnamed_addr constant [19 x i8] c"not an output port\00"
@.str.lit.37 = private unnamed_addr constant [18 x i8] c"not a string port\00"
@.str.sym.38 = private unnamed_addr constant [18 x i8] c"flush-output-port\00"
@.str.sym.39 = private unnamed_addr constant [11 x i8] c"close-port\00"
@.str.lit.40 = private unnamed_addr constant [11 x i8] c"not a port\00"
@.str.sym.41 = private unnamed_addr constant [17 x i8] c"close-input-port\00"
@.str.lit.42 = private unnamed_addr constant [18 x i8] c"not an input port\00"
@.str.sym.43 = private unnamed_addr constant [18 x i8] c"close-output-port\00"
@.str.lit.44 = private unnamed_addr constant [19 x i8] c"not an output port\00"
@"scheme.base:__inited" = global i64 0
@"scheme.base:list" = global i64 0
@"scheme.base:caar" = global i64 0
@"scheme.base:cadr" = global i64 0
@"scheme.base:cdar" = global i64 0
@"scheme.base:cddr" = global i64 0
@"scheme.base:caaar" = global i64 0
@"scheme.base:caadr" = global i64 0
@"scheme.base:cadar" = global i64 0
@"scheme.base:caddr" = global i64 0
@"scheme.base:cdaar" = global i64 0
@"scheme.base:cdadr" = global i64 0
@"scheme.base:cddar" = global i64 0
@"scheme.base:cdddr" = global i64 0
@"scheme.base:length" = global i64 0
@"scheme.base:reverse" = global i64 0
@"scheme.base:%append2" = global i64 0
@"scheme.base:append" = global i64 0
@"scheme.base:%map1" = global i64 0
@"scheme.base:%any-null?" = global i64 0
@"scheme.base:%mapn" = global i64 0
@"scheme.base:map" = global i64 0
@"scheme.base:memq" = global i64 0
@"scheme.base:memv" = global i64 0
@"scheme.base:assq" = global i64 0
@"scheme.base:member" = global i64 0
@"scheme.base:assoc" = global i64 0
@"scheme.base:filter" = global i64 0
@"scheme.base:fold-left" = global i64 0
@"scheme.base:fold-right" = global i64 0
@"scheme.base:%for-each1" = global i64 0
@"scheme.base:%for-eachn" = global i64 0
@"scheme.base:for-each" = global i64 0
@"scheme.base:andmap" = global i64 0
@"scheme.base:memp" = global i64 0
@"scheme.base:cadddr" = global i64 0
@"scheme.base:list?" = global i64 0
@"scheme.base:zero?" = global i64 0
@"scheme.base:list-tail" = global i64 0
@"scheme.base:list-ref" = global i64 0
@"scheme.base:list-head" = global i64 0
@"scheme.base:make-list" = global i64 0
@"scheme.base:iota" = global i64 0
@"scheme.base:max" = global i64 0
@"scheme.base:void" = global i64 0
@"scheme.base:string" = global i64 0
@"scheme.base:%str-concat" = global i64 0
@"scheme.base:chr-cmp" = global i64 0
@"scheme.base:char=?" = global i64 0
@"scheme.base:char<?" = global i64 0
@"scheme.base:char>?" = global i64 0
@"scheme.base:char<=?" = global i64 0
@"scheme.base:char>=?" = global i64 0
@"scheme.base:string->list" = global i64 0
@"scheme.base:ns-digits" = global i64 0
@"scheme.base:number->string" = global i64 0
@"scheme.base:error" = global i64 0
@"scheme.base:*winds*" = global i64 0
@"scheme.base:*handlers*" = global i64 0
@"scheme.base:%unwind-to" = global i64 0
@"scheme.base:dynamic-wind" = global i64 0
@"scheme.base:call-with-current-continuation" = global i64 0
@"scheme.base:call/cc" = global i64 0
@"scheme.base:%with-handler" = global i64 0
@"scheme.base:raise" = global i64 0
@"scheme.base:error-object?" = global i64 0
@"scheme.base:error-object-message" = global i64 0
@"scheme.base:error-object-irritants" = global i64 0
@"scheme.base:make-parameter" = global i64 0
@"scheme.base:%with-parameters" = global i64 0
@"scheme.base:list->vector" = global i64 0
@"scheme.base:vector" = global i64 0
@"scheme.base:list->bytevector" = global i64 0
@"scheme.base:bytevector" = global i64 0
@"scheme.base:values" = global i64 0
@"scheme.base:call-with-values" = global i64 0
@"scheme.base:%ht-initial-buckets" = global i64 0
@"scheme.base:%ht-load-factor" = global i64 0
@"scheme.base:make-hash-table" = global i64 0
@"scheme.base:hash-table?" = global i64 0
@"scheme.base:%ht-count" = global i64 0
@"scheme.base:%ht-buckets" = global i64 0
@"scheme.base:%ht-set-count!" = global i64 0
@"scheme.base:%ht-set-buckets!" = global i64 0
@"scheme.base:%ht-index" = global i64 0
@"scheme.base:%ht-assoc" = global i64 0
@"scheme.base:%ht-remove" = global i64 0
@"scheme.base:hash-table-ref/default" = global i64 0
@"scheme.base:hash-table-contains?" = global i64 0
@"scheme.base:hash-table-ref" = global i64 0
@"scheme.base:hash-table-set!" = global i64 0
@"scheme.base:hash-table-delete!" = global i64 0
@"scheme.base:%ht-grow!" = global i64 0
@"scheme.base:hash-table-size" = global i64 0
@"scheme.base:%ht-fold-buckets" = global i64 0
@"scheme.base:hash-table->alist" = global i64 0
@"scheme.base:hash-table-keys" = global i64 0
@"scheme.base:hash-table-values" = global i64 0
@"scheme.base:rd-ws?" = global i64 0
@"scheme.base:rd-digit?" = global i64 0
@"scheme.base:rd-delim?" = global i64 0
@"scheme.base:rd-skip-line" = global i64 0
@"scheme.base:rd-skip-ws" = global i64 0
@"scheme.base:rd-token-end" = global i64 0
@"scheme.base:rd-all-digits?" = global i64 0
@"scheme.base:rd-numeric?" = global i64 0
@"scheme.base:rd-digits" = global i64 0
@"scheme.base:rd-parse-int" = global i64 0
@"scheme.base:rd-dotchar?" = global i64 0
@"scheme.base:rd-exp-char?" = global i64 0
@"scheme.base:rd-sign-char?" = global i64 0
@"scheme.base:rd-scan-digits" = global i64 0
@"scheme.base:rd-flonum?" = global i64 0
@"scheme.base:rd-atom" = global i64 0
@"scheme.base:rd-hex-digit" = global i64 0
@"scheme.base:rd-hex" = global i64 0
@"scheme.base:rd-str-esc" = global i64 0
@"scheme.base:rd-string" = global i64 0
@"scheme.base:rd-hash" = global i64 0
@"scheme.base:rd-char-name" = global i64 0
@"scheme.base:rd-char" = global i64 0
@"scheme.base:rd-quote" = global i64 0
@"scheme.base:rd-quasi" = global i64 0
@"scheme.base:rd-unquote" = global i64 0
@"scheme.base:rd-dot?" = global i64 0
@"scheme.base:rd-append-reverse" = global i64 0
@"scheme.base:rd-list" = global i64 0
@"scheme.base:rd-datum" = global i64 0
@"scheme.base:read-from-string" = global i64 0
@"scheme.base:read-all-from-string" = global i64 0
@"scheme.base:%port-rtd-cell" = global i64 0
@"scheme.base:%port-rtd" = global i64 0
@"scheme.base:%make-port" = global i64 0
@"scheme.base:port?" = global i64 0
@"scheme.base:input-port?" = global i64 0
@"scheme.base:output-port?" = global i64 0
@"scheme.base:textual-port?" = global i64 0
@"scheme.base:port-closed?" = global i64 0
@"scheme.base:input-port-open?" = global i64 0
@"scheme.base:output-port-open?" = global i64 0
@"scheme.base:%check-input-port" = global i64 0
@"scheme.base:%check-output-port" = global i64 0
@"scheme.base:%port-buf" = global i64 0
@"scheme.base:open-input-string" = global i64 0
@"scheme.base:open-input-file" = global i64 0
@"scheme.base:%port-at-eof?" = global i64 0
@"scheme.base:read-char" = global i64 0
@"scheme.base:peek-char" = global i64 0
@"scheme.base:read-line" = global i64 0
@"scheme.base:read-string" = global i64 0
@"scheme.base:read" = global i64 0
@"scheme.base:open-output-file" = global i64 0
@"scheme.base:open-output-string" = global i64 0
@"scheme.base:get-output-string" = global i64 0
@"scheme.base:flush-output-port" = global i64 0
@"scheme.base:close-port" = global i64 0
@"scheme.base:close-input-port" = global i64 0
@"scheme.base:close-output-port" = global i64 0
@"scheme.base:%stdout-port" = global i64 0
@"scheme.base:%stderr-port" = global i64 0
@"scheme.base:%stdin-port" = global i64 0
@"scheme.base:current-output-port" = global i64 0
@"scheme.base:current-error-port" = global i64 0
@"scheme.base:current-input-port" = global i64 0
@"scheme.base:call-with-port" = global i64 0
@"scheme.base:with-output-to-file" = global i64 0
@"scheme.base:with-input-from-file" = global i64 0
@"scheme.base:call-with-output-file" = global i64 0
@"scheme.base:call-with-input-file" = global i64 0
define fastcc i64 @"scheme.base:code:list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1 = icmp sge i64 %argc, 0
  br i1 %t1, label %argok2, label %arityerr1
arityerr1:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok2:
  %t2 = call ptr @rt_alloc_words(i64 8)
  %t3 = getelementptr i64, ptr %t2, i64 0
  store i64 %a0, ptr %t3
  %t4 = getelementptr i64, ptr %t2, i64 1
  store i64 %a1, ptr %t4
  %t5 = getelementptr i64, ptr %t2, i64 2
  store i64 %a2, ptr %t5
  %t6 = getelementptr i64, ptr %t2, i64 3
  store i64 %a3, ptr %t6
  %t7 = getelementptr i64, ptr %t2, i64 4
  store i64 %a4, ptr %t7
  %t8 = getelementptr i64, ptr %t2, i64 5
  store i64 %a5, ptr %t8
  %t9 = getelementptr i64, ptr %t2, i64 6
  store i64 %a6, ptr %t9
  %t10 = getelementptr i64, ptr %t2, i64 7
  store i64 %a7, ptr %t10
  %t11 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2, ptr %overflow)
  ret i64 %t11
}

define fastcc i64 @"scheme.base:code:caar"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t16 = icmp eq i64 %argc, 1
  br i1 %t16, label %argok4, label %arityerr3
arityerr3:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok4:
  %t17 = call i64 @rt_car(i64 %a0)
  %t18 = call i64 @rt_car(i64 %t17)
  ret i64 %t18
}

define fastcc i64 @"scheme.base:code:cadr"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t23 = icmp eq i64 %argc, 1
  br i1 %t23, label %argok6, label %arityerr5
arityerr5:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok6:
  %t24 = call i64 @rt_cdr(i64 %a0)
  %t25 = call i64 @rt_car(i64 %t24)
  ret i64 %t25
}

define fastcc i64 @"scheme.base:code:cdar"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t30 = icmp eq i64 %argc, 1
  br i1 %t30, label %argok8, label %arityerr7
arityerr7:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok8:
  %t31 = call i64 @rt_car(i64 %a0)
  %t32 = call i64 @rt_cdr(i64 %t31)
  ret i64 %t32
}

define fastcc i64 @"scheme.base:code:cddr"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t37 = icmp eq i64 %argc, 1
  br i1 %t37, label %argok10, label %arityerr9
arityerr9:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok10:
  %t38 = call i64 @rt_cdr(i64 %a0)
  %t39 = call i64 @rt_cdr(i64 %t38)
  ret i64 %t39
}

define fastcc i64 @"scheme.base:code:caaar"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t44 = icmp eq i64 %argc, 1
  br i1 %t44, label %argok12, label %arityerr11
arityerr11:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok12:
  %t45 = load i64, ptr @"scheme.base:caar"
  %t46 = and i64 %t45, -8
  %t47 = inttoptr i64 %t46 to ptr
  %t48 = load i64, ptr %t47
  %t49 = inttoptr i64 %t48 to ptr
  %t50 = call fastcc i64%t49(i64 %t45, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t51 = call i64 @rt_car(i64 %t50)
  ret i64 %t51
}

define fastcc i64 @"scheme.base:code:caadr"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t56 = icmp eq i64 %argc, 1
  br i1 %t56, label %argok14, label %arityerr13
arityerr13:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok14:
  %t57 = load i64, ptr @"scheme.base:cadr"
  %t58 = and i64 %t57, -8
  %t59 = inttoptr i64 %t58 to ptr
  %t60 = load i64, ptr %t59
  %t61 = inttoptr i64 %t60 to ptr
  %t62 = call fastcc i64%t61(i64 %t57, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t63 = call i64 @rt_car(i64 %t62)
  ret i64 %t63
}

define fastcc i64 @"scheme.base:code:cadar"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t68 = icmp eq i64 %argc, 1
  br i1 %t68, label %argok16, label %arityerr15
arityerr15:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok16:
  %t69 = load i64, ptr @"scheme.base:cdar"
  %t70 = and i64 %t69, -8
  %t71 = inttoptr i64 %t70 to ptr
  %t72 = load i64, ptr %t71
  %t73 = inttoptr i64 %t72 to ptr
  %t74 = call fastcc i64%t73(i64 %t69, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t75 = call i64 @rt_car(i64 %t74)
  ret i64 %t75
}

define fastcc i64 @"scheme.base:code:caddr"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t80 = icmp eq i64 %argc, 1
  br i1 %t80, label %argok18, label %arityerr17
arityerr17:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok18:
  %t81 = load i64, ptr @"scheme.base:cddr"
  %t82 = and i64 %t81, -8
  %t83 = inttoptr i64 %t82 to ptr
  %t84 = load i64, ptr %t83
  %t85 = inttoptr i64 %t84 to ptr
  %t86 = call fastcc i64%t85(i64 %t81, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t87 = call i64 @rt_car(i64 %t86)
  ret i64 %t87
}

define fastcc i64 @"scheme.base:code:cdaar"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t92 = icmp eq i64 %argc, 1
  br i1 %t92, label %argok20, label %arityerr19
arityerr19:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok20:
  %t93 = load i64, ptr @"scheme.base:caar"
  %t94 = and i64 %t93, -8
  %t95 = inttoptr i64 %t94 to ptr
  %t96 = load i64, ptr %t95
  %t97 = inttoptr i64 %t96 to ptr
  %t98 = call fastcc i64%t97(i64 %t93, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t99 = call i64 @rt_cdr(i64 %t98)
  ret i64 %t99
}

define fastcc i64 @"scheme.base:code:cdadr"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t104 = icmp eq i64 %argc, 1
  br i1 %t104, label %argok22, label %arityerr21
arityerr21:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok22:
  %t105 = load i64, ptr @"scheme.base:cadr"
  %t106 = and i64 %t105, -8
  %t107 = inttoptr i64 %t106 to ptr
  %t108 = load i64, ptr %t107
  %t109 = inttoptr i64 %t108 to ptr
  %t110 = call fastcc i64%t109(i64 %t105, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t111 = call i64 @rt_cdr(i64 %t110)
  ret i64 %t111
}

define fastcc i64 @"scheme.base:code:cddar"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t116 = icmp eq i64 %argc, 1
  br i1 %t116, label %argok24, label %arityerr23
arityerr23:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok24:
  %t117 = load i64, ptr @"scheme.base:cdar"
  %t118 = and i64 %t117, -8
  %t119 = inttoptr i64 %t118 to ptr
  %t120 = load i64, ptr %t119
  %t121 = inttoptr i64 %t120 to ptr
  %t122 = call fastcc i64%t121(i64 %t117, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t123 = call i64 @rt_cdr(i64 %t122)
  ret i64 %t123
}

define fastcc i64 @"scheme.base:code:cdddr"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t128 = icmp eq i64 %argc, 1
  br i1 %t128, label %argok26, label %arityerr25
arityerr25:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok26:
  %t129 = load i64, ptr @"scheme.base:cddr"
  %t130 = and i64 %t129, -8
  %t131 = inttoptr i64 %t130 to ptr
  %t132 = load i64, ptr %t131
  %t133 = inttoptr i64 %t132 to ptr
  %t134 = call fastcc i64%t133(i64 %t129, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t135 = call i64 @rt_cdr(i64 %t134)
  ret i64 %t135
}

define fastcc i64 @"scheme.base:code_31"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t140 = icmp eq i64 %argc, 2
  br i1 %t140, label %argok28, label %arityerr27
arityerr27:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok28:
  %t141 = call i64 @rt_null_p(i64 %a0)
  %t142 = icmp ne i64 %t141, 1
  br i1 %t142, label %then29, label %else30
then29:
  ret i64 %a1
else30:
  %t143 = call i64 @rt_cdr(i64 %a0)
  %t144 = or i64 %a1, 8
  %t145 = and i64 %t144, 7
  %t146 = icmp eq i64 %t145, 0
  br i1 %t146, label %fixfast31, label %fixslow32
fixfast31:
  %t147 = add i64 %a1, 8
  br label %fixmerge33
fixslow32:
  %t148 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge33
fixmerge33:
  %t149 = phi i64 [ %t147, %fixfast31 ], [ %t148, %fixslow32 ]
  %t150 = musttail call fastcc i64 @"scheme.base:code_31"(i64 %self, i64 2, i64 %t143, i64 %t149, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t150
}

define fastcc i64 @"scheme.base:code:length"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t151 = icmp eq i64 %argc, 1
  br i1 %t151, label %argok35, label %arityerr34
arityerr34:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok35:
  %t152 = call ptr @rt_alloc_words(i64 2)
  %t153 = ptrtoint ptr %t152 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_31" to i64), ptr %t152
  %t154 = or i64 %t153, 4
  %t155 = getelementptr i64, ptr %t152, i64 1
  store i64 %t154, ptr %t155
  %t156 = musttail call fastcc i64 @"scheme.base:code_31"(i64 %t154, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t156
}

define fastcc i64 @"scheme.base:code_38"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t161 = icmp eq i64 %argc, 2
  br i1 %t161, label %argok37, label %arityerr36
arityerr36:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok37:
  %t162 = call i64 @rt_null_p(i64 %a0)
  %t163 = icmp ne i64 %t162, 1
  br i1 %t163, label %then38, label %else39
then38:
  ret i64 %a1
else39:
  %t164 = call i64 @rt_cdr(i64 %a0)
  %t165 = call i64 @rt_car(i64 %a0)
  %t166 = call i64 @rt_cons(i64 %t165, i64 %a1)
  %t167 = musttail call fastcc i64 @"scheme.base:code_38"(i64 %self, i64 2, i64 %t164, i64 %t166, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t167
}

define fastcc i64 @"scheme.base:code:reverse"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t168 = icmp eq i64 %argc, 1
  br i1 %t168, label %argok41, label %arityerr40
arityerr40:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok41:
  %t169 = call ptr @rt_alloc_words(i64 2)
  %t170 = ptrtoint ptr %t169 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_38" to i64), ptr %t169
  %t171 = or i64 %t170, 4
  %t172 = getelementptr i64, ptr %t169, i64 1
  store i64 %t171, ptr %t172
  %t173 = musttail call fastcc i64 @"scheme.base:code_38"(i64 %t171, i64 2, i64 %a0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t173
}

define fastcc i64 @"scheme.base:code:%append2"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t178 = icmp eq i64 %argc, 2
  br i1 %t178, label %argok43, label %arityerr42
arityerr42:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok43:
  %t179 = call i64 @rt_null_p(i64 %a0)
  %t180 = icmp ne i64 %t179, 1
  br i1 %t180, label %then44, label %else45
then44:
  ret i64 %a1
else45:
  %t181 = call i64 @rt_car(i64 %a0)
  %t182 = call i64 @rt_cdr(i64 %a0)
  %t183 = load i64, ptr @"scheme.base:%append2"
  %t184 = and i64 %t183, -8
  %t185 = inttoptr i64 %t184 to ptr
  %t186 = load i64, ptr %t185
  %t187 = inttoptr i64 %t186 to ptr
  %t188 = call fastcc i64%t187(i64 %t183, i64 2, i64 %t182, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t189 = call i64 @rt_cons(i64 %t181, i64 %t188)
  ret i64 %t189
}

define fastcc i64 @"scheme.base:code:append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t194 = icmp sge i64 %argc, 0
  br i1 %t194, label %argok47, label %arityerr46
arityerr46:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok47:
  %t195 = call ptr @rt_alloc_words(i64 8)
  %t196 = getelementptr i64, ptr %t195, i64 0
  store i64 %a0, ptr %t196
  %t197 = getelementptr i64, ptr %t195, i64 1
  store i64 %a1, ptr %t197
  %t198 = getelementptr i64, ptr %t195, i64 2
  store i64 %a2, ptr %t198
  %t199 = getelementptr i64, ptr %t195, i64 3
  store i64 %a3, ptr %t199
  %t200 = getelementptr i64, ptr %t195, i64 4
  store i64 %a4, ptr %t200
  %t201 = getelementptr i64, ptr %t195, i64 5
  store i64 %a5, ptr %t201
  %t202 = getelementptr i64, ptr %t195, i64 6
  store i64 %a6, ptr %t202
  %t203 = getelementptr i64, ptr %t195, i64 7
  store i64 %a7, ptr %t203
  %t204 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t195, ptr %overflow)
  %t205 = call i64 @rt_null_p(i64 %t204)
  %t206 = icmp ne i64 %t205, 1
  br i1 %t206, label %then48, label %else49
then48:
  ret i64 2
else49:
  %t207 = call i64 @rt_cdr(i64 %t204)
  %t208 = call i64 @rt_null_p(i64 %t207)
  %t209 = icmp ne i64 %t208, 1
  br i1 %t209, label %then50, label %else51
then50:
  %t210 = call i64 @rt_car(i64 %t204)
  ret i64 %t210
else51:
  %t211 = call i64 @rt_car(i64 %t204)
  %t212 = call i64 @rt_cdr(i64 %t204)
  %t213 = load i64, ptr @"scheme.base:append"
  %t214 = and i64 %t213, -8
  %t215 = inttoptr i64 %t214 to ptr
  %t216 = load i64, ptr %t215
  %t217 = inttoptr i64 %t216 to ptr
  %t218 = call i64 @rt_list_length(i64 %t212)
  %t219 = add i64 0, %t218
  %t220 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t212, i64 8)
  %t232 = getelementptr i64, ptr %t220, i64 0
  %t224 = load i64, ptr %t232
  %t233 = getelementptr i64, ptr %t220, i64 1
  %t225 = load i64, ptr %t233
  %t234 = getelementptr i64, ptr %t220, i64 2
  %t226 = load i64, ptr %t234
  %t235 = getelementptr i64, ptr %t220, i64 3
  %t227 = load i64, ptr %t235
  %t236 = getelementptr i64, ptr %t220, i64 4
  %t228 = load i64, ptr %t236
  %t237 = getelementptr i64, ptr %t220, i64 5
  %t229 = load i64, ptr %t237
  %t238 = getelementptr i64, ptr %t220, i64 6
  %t230 = load i64, ptr %t238
  %t239 = getelementptr i64, ptr %t220, i64 7
  %t231 = load i64, ptr %t239
  %t221 = icmp sgt i64 %t219, 8
  %t222 = getelementptr i64, ptr %t220, i64 8
  %t223 = select i1 %t221, ptr %t222, ptr null
  %t240 = call fastcc i64%t217(i64 %t213, i64 %t219, i64 %t224, i64 %t225, i64 %t226, i64 %t227, i64 %t228, i64 %t229, i64 %t230, i64 %t231, ptr %t223)
  %t241 = load i64, ptr @"scheme.base:%append2"
  %t242 = and i64 %t241, -8
  %t243 = inttoptr i64 %t242 to ptr
  %t244 = load i64, ptr %t243
  %t245 = inttoptr i64 %t244 to ptr
  %t246 = musttail call fastcc i64 %t245(i64 %t241, i64 2, i64 %t211, i64 %t240, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t246
}

define fastcc i64 @"scheme.base:code:%map1"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t251 = icmp eq i64 %argc, 2
  br i1 %t251, label %argok53, label %arityerr52
arityerr52:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok53:
  %t252 = call i64 @rt_null_p(i64 %a1)
  %t253 = icmp ne i64 %t252, 1
  br i1 %t253, label %then54, label %else55
then54:
  ret i64 2
else55:
  %t254 = call i64 @rt_car(i64 %a1)
  %t255 = and i64 %a0, -8
  %t256 = inttoptr i64 %t255 to ptr
  %t257 = load i64, ptr %t256
  %t258 = inttoptr i64 %t257 to ptr
  %t259 = call fastcc i64%t258(i64 %a0, i64 1, i64 %t254, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t260 = call i64 @rt_cdr(i64 %a1)
  %t261 = load i64, ptr @"scheme.base:%map1"
  %t262 = and i64 %t261, -8
  %t263 = inttoptr i64 %t262 to ptr
  %t264 = load i64, ptr %t263
  %t265 = inttoptr i64 %t264 to ptr
  %t266 = call fastcc i64%t265(i64 %t261, i64 2, i64 %a0, i64 %t260, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t267 = call i64 @rt_cons(i64 %t259, i64 %t266)
  ret i64 %t267
}

define fastcc i64 @"scheme.base:code:%any-null?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t272 = icmp eq i64 %argc, 1
  br i1 %t272, label %argok57, label %arityerr56
arityerr56:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok57:
  %t273 = call i64 @rt_null_p(i64 %a0)
  %t274 = icmp ne i64 %t273, 1
  br i1 %t274, label %then58, label %else59
then58:
  ret i64 1
else59:
  %t275 = call i64 @rt_car(i64 %a0)
  %t276 = call i64 @rt_null_p(i64 %t275)
  %t277 = icmp ne i64 %t276, 1
  br i1 %t277, label %then60, label %else61
then60:
  ret i64 257
else61:
  %t278 = call i64 @rt_cdr(i64 %a0)
  %t279 = load i64, ptr @"scheme.base:%any-null?"
  %t280 = and i64 %t279, -8
  %t281 = inttoptr i64 %t280 to ptr
  %t282 = load i64, ptr %t281
  %t283 = inttoptr i64 %t282 to ptr
  %t284 = musttail call fastcc i64 %t283(i64 %t279, i64 1, i64 %t278, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t284
}

define fastcc i64 @"scheme.base:code_55"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t289 = icmp eq i64 %argc, 1
  br i1 %t289, label %argok63, label %arityerr62
arityerr62:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok63:
  %t290 = call i64 @rt_car(i64 %a0)
  ret i64 %t290
}

define fastcc i64 @"scheme.base:code_57"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t291 = icmp eq i64 %argc, 1
  br i1 %t291, label %argok65, label %arityerr64
arityerr64:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok65:
  %t292 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t292
}

define fastcc i64 @"scheme.base:code:%mapn"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t293 = icmp eq i64 %argc, 2
  br i1 %t293, label %argok67, label %arityerr66
arityerr66:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok67:
  %t294 = load i64, ptr @"scheme.base:%any-null?"
  %t295 = and i64 %t294, -8
  %t296 = inttoptr i64 %t295 to ptr
  %t297 = load i64, ptr %t296
  %t298 = inttoptr i64 %t297 to ptr
  %t299 = call fastcc i64%t298(i64 %t294, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t300 = icmp ne i64 %t299, 1
  br i1 %t300, label %then68, label %else69
then68:
  ret i64 2
else69:
  %t301 = call ptr @rt_alloc_words(i64 1)
  %t302 = ptrtoint ptr %t301 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_55" to i64), ptr %t301
  %t303 = or i64 %t302, 4
  %t304 = load i64, ptr @"scheme.base:%map1"
  %t305 = and i64 %t304, -8
  %t306 = inttoptr i64 %t305 to ptr
  %t307 = load i64, ptr %t306
  %t308 = inttoptr i64 %t307 to ptr
  %t309 = call fastcc i64%t308(i64 %t304, i64 2, i64 %t303, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t310 = and i64 %a0, -8
  %t311 = inttoptr i64 %t310 to ptr
  %t312 = load i64, ptr %t311
  %t313 = inttoptr i64 %t312 to ptr
  %t314 = call i64 @rt_list_length(i64 %t309)
  %t315 = add i64 0, %t314
  %t316 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t309, i64 8)
  %t328 = getelementptr i64, ptr %t316, i64 0
  %t320 = load i64, ptr %t328
  %t329 = getelementptr i64, ptr %t316, i64 1
  %t321 = load i64, ptr %t329
  %t330 = getelementptr i64, ptr %t316, i64 2
  %t322 = load i64, ptr %t330
  %t331 = getelementptr i64, ptr %t316, i64 3
  %t323 = load i64, ptr %t331
  %t332 = getelementptr i64, ptr %t316, i64 4
  %t324 = load i64, ptr %t332
  %t333 = getelementptr i64, ptr %t316, i64 5
  %t325 = load i64, ptr %t333
  %t334 = getelementptr i64, ptr %t316, i64 6
  %t326 = load i64, ptr %t334
  %t335 = getelementptr i64, ptr %t316, i64 7
  %t327 = load i64, ptr %t335
  %t317 = icmp sgt i64 %t315, 8
  %t318 = getelementptr i64, ptr %t316, i64 8
  %t319 = select i1 %t317, ptr %t318, ptr null
  %t336 = call fastcc i64%t313(i64 %a0, i64 %t315, i64 %t320, i64 %t321, i64 %t322, i64 %t323, i64 %t324, i64 %t325, i64 %t326, i64 %t327, ptr %t319)
  %t337 = call ptr @rt_alloc_words(i64 1)
  %t338 = ptrtoint ptr %t337 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_57" to i64), ptr %t337
  %t339 = or i64 %t338, 4
  %t340 = load i64, ptr @"scheme.base:%map1"
  %t341 = and i64 %t340, -8
  %t342 = inttoptr i64 %t341 to ptr
  %t343 = load i64, ptr %t342
  %t344 = inttoptr i64 %t343 to ptr
  %t345 = call fastcc i64%t344(i64 %t340, i64 2, i64 %t339, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t346 = load i64, ptr @"scheme.base:%mapn"
  %t347 = and i64 %t346, -8
  %t348 = inttoptr i64 %t347 to ptr
  %t349 = load i64, ptr %t348
  %t350 = inttoptr i64 %t349 to ptr
  %t351 = call fastcc i64%t350(i64 %t346, i64 2, i64 %a0, i64 %t345, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t352 = call i64 @rt_cons(i64 %t336, i64 %t351)
  ret i64 %t352
}

define fastcc i64 @"scheme.base:code:map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t357 = icmp sge i64 %argc, 2
  br i1 %t357, label %argok71, label %arityerr70
arityerr70:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok71:
  %t358 = call ptr @rt_alloc_words(i64 8)
  %t359 = getelementptr i64, ptr %t358, i64 0
  store i64 %a0, ptr %t359
  %t360 = getelementptr i64, ptr %t358, i64 1
  store i64 %a1, ptr %t360
  %t361 = getelementptr i64, ptr %t358, i64 2
  store i64 %a2, ptr %t361
  %t362 = getelementptr i64, ptr %t358, i64 3
  store i64 %a3, ptr %t362
  %t363 = getelementptr i64, ptr %t358, i64 4
  store i64 %a4, ptr %t363
  %t364 = getelementptr i64, ptr %t358, i64 5
  store i64 %a5, ptr %t364
  %t365 = getelementptr i64, ptr %t358, i64 6
  store i64 %a6, ptr %t365
  %t366 = getelementptr i64, ptr %t358, i64 7
  store i64 %a7, ptr %t366
  %t367 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t358, ptr %overflow)
  %t368 = call i64 @rt_null_p(i64 %t367)
  %t369 = icmp ne i64 %t368, 1
  br i1 %t369, label %then72, label %else73
then72:
  %t370 = load i64, ptr @"scheme.base:%map1"
  %t371 = and i64 %t370, -8
  %t372 = inttoptr i64 %t371 to ptr
  %t373 = load i64, ptr %t372
  %t374 = inttoptr i64 %t373 to ptr
  %t375 = musttail call fastcc i64 %t374(i64 %t370, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t375
else73:
  %t376 = call i64 @rt_cons(i64 %a1, i64 %t367)
  %t377 = load i64, ptr @"scheme.base:%mapn"
  %t378 = and i64 %t377, -8
  %t379 = inttoptr i64 %t378 to ptr
  %t380 = load i64, ptr %t379
  %t381 = inttoptr i64 %t380 to ptr
  %t382 = musttail call fastcc i64 %t381(i64 %t377, i64 2, i64 %a0, i64 %t376, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t382
}

define fastcc i64 @"scheme.base:code:memq"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t387 = icmp eq i64 %argc, 2
  br i1 %t387, label %argok75, label %arityerr74
arityerr74:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok75:
  %t388 = call i64 @rt_null_p(i64 %a1)
  %t389 = icmp ne i64 %t388, 1
  br i1 %t389, label %then76, label %else77
then76:
  ret i64 1
else77:
  %t390 = call i64 @rt_car(i64 %a1)
  %t391 = call i64 @rt_eq_p(i64 %a0, i64 %t390)
  %t392 = icmp ne i64 %t391, 1
  br i1 %t392, label %then78, label %else79
then78:
  ret i64 %a1
else79:
  %t393 = call i64 @rt_cdr(i64 %a1)
  %t394 = load i64, ptr @"scheme.base:memq"
  %t395 = and i64 %t394, -8
  %t396 = inttoptr i64 %t395 to ptr
  %t397 = load i64, ptr %t396
  %t398 = inttoptr i64 %t397 to ptr
  %t399 = musttail call fastcc i64 %t398(i64 %t394, i64 2, i64 %a0, i64 %t393, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t399
}

define fastcc i64 @"scheme.base:code:memv"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t404 = icmp eq i64 %argc, 2
  br i1 %t404, label %argok81, label %arityerr80
arityerr80:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok81:
  %t405 = call i64 @rt_null_p(i64 %a1)
  %t406 = icmp ne i64 %t405, 1
  br i1 %t406, label %then82, label %else83
then82:
  ret i64 1
else83:
  %t407 = call i64 @rt_car(i64 %a1)
  %t408 = call i64 @rt_eqv_p(i64 %a0, i64 %t407)
  %t409 = icmp ne i64 %t408, 1
  br i1 %t409, label %then84, label %else85
then84:
  ret i64 %a1
else85:
  %t410 = call i64 @rt_cdr(i64 %a1)
  %t411 = load i64, ptr @"scheme.base:memv"
  %t412 = and i64 %t411, -8
  %t413 = inttoptr i64 %t412 to ptr
  %t414 = load i64, ptr %t413
  %t415 = inttoptr i64 %t414 to ptr
  %t416 = musttail call fastcc i64 %t415(i64 %t411, i64 2, i64 %a0, i64 %t410, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t416
}

define fastcc i64 @"scheme.base:code:assq"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t421 = icmp eq i64 %argc, 2
  br i1 %t421, label %argok87, label %arityerr86
arityerr86:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok87:
  %t422 = call i64 @rt_null_p(i64 %a1)
  %t423 = icmp ne i64 %t422, 1
  br i1 %t423, label %then88, label %else89
then88:
  ret i64 1
else89:
  %t424 = call i64 @rt_car(i64 %a1)
  %t425 = call i64 @rt_car(i64 %t424)
  %t426 = call i64 @rt_eq_p(i64 %a0, i64 %t425)
  %t427 = icmp ne i64 %t426, 1
  br i1 %t427, label %then90, label %else91
then90:
  %t428 = call i64 @rt_car(i64 %a1)
  ret i64 %t428
else91:
  %t429 = call i64 @rt_cdr(i64 %a1)
  %t430 = load i64, ptr @"scheme.base:assq"
  %t431 = and i64 %t430, -8
  %t432 = inttoptr i64 %t431 to ptr
  %t433 = load i64, ptr %t432
  %t434 = inttoptr i64 %t433 to ptr
  %t435 = musttail call fastcc i64 %t434(i64 %t430, i64 2, i64 %a0, i64 %t429, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t435
}

define fastcc i64 @"scheme.base:code:member"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t440 = icmp eq i64 %argc, 2
  br i1 %t440, label %argok93, label %arityerr92
arityerr92:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok93:
  %t441 = call i64 @rt_null_p(i64 %a1)
  %t442 = icmp ne i64 %t441, 1
  br i1 %t442, label %then94, label %else95
then94:
  ret i64 1
else95:
  %t443 = call i64 @rt_car(i64 %a1)
  %t444 = call i64 @rt_equal(i64 %a0, i64 %t443)
  %t445 = icmp ne i64 %t444, 1
  br i1 %t445, label %then96, label %else97
then96:
  ret i64 %a1
else97:
  %t446 = call i64 @rt_cdr(i64 %a1)
  %t447 = load i64, ptr @"scheme.base:member"
  %t448 = and i64 %t447, -8
  %t449 = inttoptr i64 %t448 to ptr
  %t450 = load i64, ptr %t449
  %t451 = inttoptr i64 %t450 to ptr
  %t452 = musttail call fastcc i64 %t451(i64 %t447, i64 2, i64 %a0, i64 %t446, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t452
}

define fastcc i64 @"scheme.base:code:assoc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t457 = icmp eq i64 %argc, 2
  br i1 %t457, label %argok99, label %arityerr98
arityerr98:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok99:
  %t458 = call i64 @rt_null_p(i64 %a1)
  %t459 = icmp ne i64 %t458, 1
  br i1 %t459, label %then100, label %else101
then100:
  ret i64 1
else101:
  %t460 = call i64 @rt_car(i64 %a1)
  %t461 = call i64 @rt_car(i64 %t460)
  %t462 = call i64 @rt_equal(i64 %a0, i64 %t461)
  %t463 = icmp ne i64 %t462, 1
  br i1 %t463, label %then102, label %else103
then102:
  %t464 = call i64 @rt_car(i64 %a1)
  ret i64 %t464
else103:
  %t465 = call i64 @rt_cdr(i64 %a1)
  %t466 = load i64, ptr @"scheme.base:assoc"
  %t467 = and i64 %t466, -8
  %t468 = inttoptr i64 %t467 to ptr
  %t469 = load i64, ptr %t468
  %t470 = inttoptr i64 %t469 to ptr
  %t471 = musttail call fastcc i64 %t470(i64 %t466, i64 2, i64 %a0, i64 %t465, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t471
}

define fastcc i64 @"scheme.base:code:filter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t476 = icmp eq i64 %argc, 2
  br i1 %t476, label %argok105, label %arityerr104
arityerr104:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok105:
  %t477 = call i64 @rt_null_p(i64 %a1)
  %t478 = icmp ne i64 %t477, 1
  br i1 %t478, label %then106, label %else107
then106:
  ret i64 2
else107:
  %t479 = call i64 @rt_car(i64 %a1)
  %t480 = and i64 %a0, -8
  %t481 = inttoptr i64 %t480 to ptr
  %t482 = load i64, ptr %t481
  %t483 = inttoptr i64 %t482 to ptr
  %t484 = call fastcc i64%t483(i64 %a0, i64 1, i64 %t479, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t485 = icmp ne i64 %t484, 1
  br i1 %t485, label %then108, label %else109
then108:
  %t486 = call i64 @rt_car(i64 %a1)
  %t487 = call i64 @rt_cdr(i64 %a1)
  %t488 = load i64, ptr @"scheme.base:filter"
  %t489 = and i64 %t488, -8
  %t490 = inttoptr i64 %t489 to ptr
  %t491 = load i64, ptr %t490
  %t492 = inttoptr i64 %t491 to ptr
  %t493 = call fastcc i64%t492(i64 %t488, i64 2, i64 %a0, i64 %t487, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t494 = call i64 @rt_cons(i64 %t486, i64 %t493)
  ret i64 %t494
else109:
  %t495 = call i64 @rt_cdr(i64 %a1)
  %t496 = load i64, ptr @"scheme.base:filter"
  %t497 = and i64 %t496, -8
  %t498 = inttoptr i64 %t497 to ptr
  %t499 = load i64, ptr %t498
  %t500 = inttoptr i64 %t499 to ptr
  %t501 = musttail call fastcc i64 %t500(i64 %t496, i64 2, i64 %a0, i64 %t495, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t501
}

define fastcc i64 @"scheme.base:code:fold-left"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t506 = icmp eq i64 %argc, 3
  br i1 %t506, label %argok111, label %arityerr110
arityerr110:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok111:
  %t507 = call i64 @rt_null_p(i64 %a2)
  %t508 = icmp ne i64 %t507, 1
  br i1 %t508, label %then112, label %else113
then112:
  ret i64 %a1
else113:
  %t509 = call i64 @rt_car(i64 %a2)
  %t510 = and i64 %a0, -8
  %t511 = inttoptr i64 %t510 to ptr
  %t512 = load i64, ptr %t511
  %t513 = inttoptr i64 %t512 to ptr
  %t514 = call fastcc i64%t513(i64 %a0, i64 2, i64 %a1, i64 %t509, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t515 = call i64 @rt_cdr(i64 %a2)
  %t516 = load i64, ptr @"scheme.base:fold-left"
  %t517 = and i64 %t516, -8
  %t518 = inttoptr i64 %t517 to ptr
  %t519 = load i64, ptr %t518
  %t520 = inttoptr i64 %t519 to ptr
  %t521 = musttail call fastcc i64 %t520(i64 %t516, i64 3, i64 %a0, i64 %t514, i64 %t515, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t521
}

define fastcc i64 @"scheme.base:code:fold-right"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t526 = icmp eq i64 %argc, 3
  br i1 %t526, label %argok115, label %arityerr114
arityerr114:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok115:
  %t527 = call i64 @rt_null_p(i64 %a2)
  %t528 = icmp ne i64 %t527, 1
  br i1 %t528, label %then116, label %else117
then116:
  ret i64 %a1
else117:
  %t529 = call i64 @rt_car(i64 %a2)
  %t530 = call i64 @rt_cdr(i64 %a2)
  %t531 = load i64, ptr @"scheme.base:fold-right"
  %t532 = and i64 %t531, -8
  %t533 = inttoptr i64 %t532 to ptr
  %t534 = load i64, ptr %t533
  %t535 = inttoptr i64 %t534 to ptr
  %t536 = call fastcc i64%t535(i64 %t531, i64 3, i64 %a0, i64 %a1, i64 %t530, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t537 = and i64 %a0, -8
  %t538 = inttoptr i64 %t537 to ptr
  %t539 = load i64, ptr %t538
  %t540 = inttoptr i64 %t539 to ptr
  %t541 = musttail call fastcc i64 %t540(i64 %a0, i64 2, i64 %t529, i64 %t536, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t541
}

define fastcc i64 @"scheme.base:code:%for-each1"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t546 = icmp eq i64 %argc, 2
  br i1 %t546, label %argok119, label %arityerr118
arityerr118:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok119:
  %t547 = call i64 @rt_null_p(i64 %a1)
  %t548 = icmp ne i64 %t547, 1
  br i1 %t548, label %then120, label %else121
then120:
  %t549 = icmp ne i64 1, 1
  br i1 %t549, label %then122, label %else123
then122:
  ret i64 1
else123:
  ret i64 17
else121:
  %t550 = call i64 @rt_car(i64 %a1)
  %t551 = and i64 %a0, -8
  %t552 = inttoptr i64 %t551 to ptr
  %t553 = load i64, ptr %t552
  %t554 = inttoptr i64 %t553 to ptr
  %t555 = call fastcc i64%t554(i64 %a0, i64 1, i64 %t550, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t556 = call i64 @rt_cdr(i64 %a1)
  %t557 = load i64, ptr @"scheme.base:%for-each1"
  %t558 = and i64 %t557, -8
  %t559 = inttoptr i64 %t558 to ptr
  %t560 = load i64, ptr %t559
  %t561 = inttoptr i64 %t560 to ptr
  %t562 = musttail call fastcc i64 %t561(i64 %t557, i64 2, i64 %a0, i64 %t556, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t562
}

define fastcc i64 @"scheme.base:code_109"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t567 = icmp eq i64 %argc, 1
  br i1 %t567, label %argok125, label %arityerr124
arityerr124:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok125:
  %t568 = call i64 @rt_car(i64 %a0)
  ret i64 %t568
}

define fastcc i64 @"scheme.base:code_111"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t569 = icmp eq i64 %argc, 1
  br i1 %t569, label %argok127, label %arityerr126
arityerr126:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok127:
  %t570 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t570
}

define fastcc i64 @"scheme.base:code:%for-eachn"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t571 = icmp eq i64 %argc, 2
  br i1 %t571, label %argok129, label %arityerr128
arityerr128:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok129:
  %t572 = load i64, ptr @"scheme.base:%any-null?"
  %t573 = and i64 %t572, -8
  %t574 = inttoptr i64 %t573 to ptr
  %t575 = load i64, ptr %t574
  %t576 = inttoptr i64 %t575 to ptr
  %t577 = call fastcc i64%t576(i64 %t572, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t578 = icmp ne i64 %t577, 1
  br i1 %t578, label %then130, label %else131
then130:
  %t579 = icmp ne i64 1, 1
  br i1 %t579, label %then132, label %else133
then132:
  ret i64 1
else133:
  ret i64 17
else131:
  %t580 = call ptr @rt_alloc_words(i64 1)
  %t581 = ptrtoint ptr %t580 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_109" to i64), ptr %t580
  %t582 = or i64 %t581, 4
  %t583 = load i64, ptr @"scheme.base:%map1"
  %t584 = and i64 %t583, -8
  %t585 = inttoptr i64 %t584 to ptr
  %t586 = load i64, ptr %t585
  %t587 = inttoptr i64 %t586 to ptr
  %t588 = call fastcc i64%t587(i64 %t583, i64 2, i64 %t582, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t589 = and i64 %a0, -8
  %t590 = inttoptr i64 %t589 to ptr
  %t591 = load i64, ptr %t590
  %t592 = inttoptr i64 %t591 to ptr
  %t593 = call i64 @rt_list_length(i64 %t588)
  %t594 = add i64 0, %t593
  %t595 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t588, i64 8)
  %t607 = getelementptr i64, ptr %t595, i64 0
  %t599 = load i64, ptr %t607
  %t608 = getelementptr i64, ptr %t595, i64 1
  %t600 = load i64, ptr %t608
  %t609 = getelementptr i64, ptr %t595, i64 2
  %t601 = load i64, ptr %t609
  %t610 = getelementptr i64, ptr %t595, i64 3
  %t602 = load i64, ptr %t610
  %t611 = getelementptr i64, ptr %t595, i64 4
  %t603 = load i64, ptr %t611
  %t612 = getelementptr i64, ptr %t595, i64 5
  %t604 = load i64, ptr %t612
  %t613 = getelementptr i64, ptr %t595, i64 6
  %t605 = load i64, ptr %t613
  %t614 = getelementptr i64, ptr %t595, i64 7
  %t606 = load i64, ptr %t614
  %t596 = icmp sgt i64 %t594, 8
  %t597 = getelementptr i64, ptr %t595, i64 8
  %t598 = select i1 %t596, ptr %t597, ptr null
  %t615 = call fastcc i64%t592(i64 %a0, i64 %t594, i64 %t599, i64 %t600, i64 %t601, i64 %t602, i64 %t603, i64 %t604, i64 %t605, i64 %t606, ptr %t598)
  %t616 = call ptr @rt_alloc_words(i64 1)
  %t617 = ptrtoint ptr %t616 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_111" to i64), ptr %t616
  %t618 = or i64 %t617, 4
  %t619 = load i64, ptr @"scheme.base:%map1"
  %t620 = and i64 %t619, -8
  %t621 = inttoptr i64 %t620 to ptr
  %t622 = load i64, ptr %t621
  %t623 = inttoptr i64 %t622 to ptr
  %t624 = call fastcc i64%t623(i64 %t619, i64 2, i64 %t618, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t625 = load i64, ptr @"scheme.base:%for-eachn"
  %t626 = and i64 %t625, -8
  %t627 = inttoptr i64 %t626 to ptr
  %t628 = load i64, ptr %t627
  %t629 = inttoptr i64 %t628 to ptr
  %t630 = musttail call fastcc i64 %t629(i64 %t625, i64 2, i64 %a0, i64 %t624, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t630
}

define fastcc i64 @"scheme.base:code:for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t635 = icmp sge i64 %argc, 2
  br i1 %t635, label %argok135, label %arityerr134
arityerr134:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok135:
  %t636 = call ptr @rt_alloc_words(i64 8)
  %t637 = getelementptr i64, ptr %t636, i64 0
  store i64 %a0, ptr %t637
  %t638 = getelementptr i64, ptr %t636, i64 1
  store i64 %a1, ptr %t638
  %t639 = getelementptr i64, ptr %t636, i64 2
  store i64 %a2, ptr %t639
  %t640 = getelementptr i64, ptr %t636, i64 3
  store i64 %a3, ptr %t640
  %t641 = getelementptr i64, ptr %t636, i64 4
  store i64 %a4, ptr %t641
  %t642 = getelementptr i64, ptr %t636, i64 5
  store i64 %a5, ptr %t642
  %t643 = getelementptr i64, ptr %t636, i64 6
  store i64 %a6, ptr %t643
  %t644 = getelementptr i64, ptr %t636, i64 7
  store i64 %a7, ptr %t644
  %t645 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t636, ptr %overflow)
  %t646 = call i64 @rt_null_p(i64 %t645)
  %t647 = icmp ne i64 %t646, 1
  br i1 %t647, label %then136, label %else137
then136:
  %t648 = load i64, ptr @"scheme.base:%for-each1"
  %t649 = and i64 %t648, -8
  %t650 = inttoptr i64 %t649 to ptr
  %t651 = load i64, ptr %t650
  %t652 = inttoptr i64 %t651 to ptr
  %t653 = musttail call fastcc i64 %t652(i64 %t648, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t653
else137:
  %t654 = call i64 @rt_cons(i64 %a1, i64 %t645)
  %t655 = load i64, ptr @"scheme.base:%for-eachn"
  %t656 = and i64 %t655, -8
  %t657 = inttoptr i64 %t656 to ptr
  %t658 = load i64, ptr %t657
  %t659 = inttoptr i64 %t658 to ptr
  %t660 = musttail call fastcc i64 %t659(i64 %t655, i64 2, i64 %a0, i64 %t654, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t660
}

define fastcc i64 @"scheme.base:code:andmap"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t665 = icmp eq i64 %argc, 2
  br i1 %t665, label %argok139, label %arityerr138
arityerr138:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok139:
  %t666 = call i64 @rt_null_p(i64 %a1)
  %t667 = icmp ne i64 %t666, 1
  br i1 %t667, label %then140, label %else141
then140:
  ret i64 257
else141:
  %t668 = call i64 @rt_car(i64 %a1)
  %t669 = and i64 %a0, -8
  %t670 = inttoptr i64 %t669 to ptr
  %t671 = load i64, ptr %t670
  %t672 = inttoptr i64 %t671 to ptr
  %t673 = call fastcc i64%t672(i64 %a0, i64 1, i64 %t668, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t674 = icmp ne i64 %t673, 1
  br i1 %t674, label %then142, label %else143
then142:
  %t675 = call i64 @rt_cdr(i64 %a1)
  %t676 = load i64, ptr @"scheme.base:andmap"
  %t677 = and i64 %t676, -8
  %t678 = inttoptr i64 %t677 to ptr
  %t679 = load i64, ptr %t678
  %t680 = inttoptr i64 %t679 to ptr
  %t681 = musttail call fastcc i64 %t680(i64 %t676, i64 2, i64 %a0, i64 %t675, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t681
else143:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:memp"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t686 = icmp eq i64 %argc, 2
  br i1 %t686, label %argok145, label %arityerr144
arityerr144:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok145:
  %t687 = call i64 @rt_null_p(i64 %a1)
  %t688 = icmp ne i64 %t687, 1
  br i1 %t688, label %then146, label %else147
then146:
  ret i64 1
else147:
  %t689 = call i64 @rt_car(i64 %a1)
  %t690 = and i64 %a0, -8
  %t691 = inttoptr i64 %t690 to ptr
  %t692 = load i64, ptr %t691
  %t693 = inttoptr i64 %t692 to ptr
  %t694 = call fastcc i64%t693(i64 %a0, i64 1, i64 %t689, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t695 = icmp ne i64 %t694, 1
  br i1 %t695, label %then148, label %else149
then148:
  ret i64 %a1
else149:
  %t696 = call i64 @rt_cdr(i64 %a1)
  %t697 = load i64, ptr @"scheme.base:memp"
  %t698 = and i64 %t697, -8
  %t699 = inttoptr i64 %t698 to ptr
  %t700 = load i64, ptr %t699
  %t701 = inttoptr i64 %t700 to ptr
  %t702 = musttail call fastcc i64 %t701(i64 %t697, i64 2, i64 %a0, i64 %t696, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t702
}

define fastcc i64 @"scheme.base:code:cadddr"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t707 = icmp eq i64 %argc, 1
  br i1 %t707, label %argok151, label %arityerr150
arityerr150:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok151:
  %t708 = load i64, ptr @"scheme.base:cdddr"
  %t709 = and i64 %t708, -8
  %t710 = inttoptr i64 %t709 to ptr
  %t711 = load i64, ptr %t710
  %t712 = inttoptr i64 %t711 to ptr
  %t713 = call fastcc i64%t712(i64 %t708, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t714 = call i64 @rt_car(i64 %t713)
  ret i64 %t714
}

define fastcc i64 @"scheme.base:code:list?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t719 = icmp eq i64 %argc, 1
  br i1 %t719, label %argok153, label %arityerr152
arityerr152:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok153:
  %t720 = call i64 @rt_null_p(i64 %a0)
  %t721 = icmp ne i64 %t720, 1
  br i1 %t721, label %then154, label %else155
then154:
  ret i64 257
else155:
  %t722 = call i64 @rt_pair_p(i64 %a0)
  %t723 = icmp ne i64 %t722, 1
  br i1 %t723, label %then156, label %else157
then156:
  %t724 = call i64 @rt_cdr(i64 %a0)
  %t725 = load i64, ptr @"scheme.base:list?"
  %t726 = and i64 %t725, -8
  %t727 = inttoptr i64 %t726 to ptr
  %t728 = load i64, ptr %t727
  %t729 = inttoptr i64 %t728 to ptr
  %t730 = musttail call fastcc i64 %t729(i64 %t725, i64 1, i64 %t724, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t730
else157:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:zero?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t735 = icmp eq i64 %argc, 1
  br i1 %t735, label %argok159, label %arityerr158
arityerr158:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok159:
  %t736 = or i64 %a0, 0
  %t737 = and i64 %t736, 7
  %t738 = icmp eq i64 %t737, 0
  br i1 %t738, label %fixfast160, label %fixslow161
fixfast160:
  %t739 = icmp eq i64 %a0, 0
  %t740 = select i1 %t739, i64 257, i64 1
  br label %fixmerge162
fixslow161:
  %t741 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge162
fixmerge162:
  %t742 = phi i64 [ %t740, %fixfast160 ], [ %t741, %fixslow161 ]
  ret i64 %t742
}

define fastcc i64 @"scheme.base:code:list-tail"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t747 = icmp eq i64 %argc, 2
  br i1 %t747, label %argok164, label %arityerr163
arityerr163:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok164:
  %t748 = load i64, ptr @"scheme.base:zero?"
  %t749 = and i64 %t748, -8
  %t750 = inttoptr i64 %t749 to ptr
  %t751 = load i64, ptr %t750
  %t752 = inttoptr i64 %t751 to ptr
  %t753 = call fastcc i64%t752(i64 %t748, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t754 = icmp ne i64 %t753, 1
  br i1 %t754, label %then165, label %else166
then165:
  ret i64 %a0
else166:
  %t755 = call i64 @rt_cdr(i64 %a0)
  %t756 = or i64 %a1, 8
  %t757 = and i64 %t756, 7
  %t758 = icmp eq i64 %t757, 0
  br i1 %t758, label %fixfast167, label %fixslow168
fixfast167:
  %t759 = sub i64 %a1, 8
  br label %fixmerge169
fixslow168:
  %t760 = call i64 @rt_sub(i64 %a1, i64 8)
  br label %fixmerge169
fixmerge169:
  %t761 = phi i64 [ %t759, %fixfast167 ], [ %t760, %fixslow168 ]
  %t762 = load i64, ptr @"scheme.base:list-tail"
  %t763 = and i64 %t762, -8
  %t764 = inttoptr i64 %t763 to ptr
  %t765 = load i64, ptr %t764
  %t766 = inttoptr i64 %t765 to ptr
  %t767 = musttail call fastcc i64 %t766(i64 %t762, i64 2, i64 %t755, i64 %t761, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t767
}

define fastcc i64 @"scheme.base:code:list-ref"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t772 = icmp eq i64 %argc, 2
  br i1 %t772, label %argok171, label %arityerr170
arityerr170:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok171:
  %t773 = load i64, ptr @"scheme.base:list-tail"
  %t774 = and i64 %t773, -8
  %t775 = inttoptr i64 %t774 to ptr
  %t776 = load i64, ptr %t775
  %t777 = inttoptr i64 %t776 to ptr
  %t778 = call fastcc i64%t777(i64 %t773, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t779 = call i64 @rt_car(i64 %t778)
  ret i64 %t779
}

define fastcc i64 @"scheme.base:code:list-head"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t784 = icmp eq i64 %argc, 2
  br i1 %t784, label %argok173, label %arityerr172
arityerr172:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok173:
  %t785 = load i64, ptr @"scheme.base:zero?"
  %t786 = and i64 %t785, -8
  %t787 = inttoptr i64 %t786 to ptr
  %t788 = load i64, ptr %t787
  %t789 = inttoptr i64 %t788 to ptr
  %t790 = call fastcc i64%t789(i64 %t785, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t791 = icmp ne i64 %t790, 1
  br i1 %t791, label %then174, label %else175
then174:
  ret i64 2
else175:
  %t792 = call i64 @rt_car(i64 %a0)
  %t793 = call i64 @rt_cdr(i64 %a0)
  %t794 = or i64 %a1, 8
  %t795 = and i64 %t794, 7
  %t796 = icmp eq i64 %t795, 0
  br i1 %t796, label %fixfast176, label %fixslow177
fixfast176:
  %t797 = sub i64 %a1, 8
  br label %fixmerge178
fixslow177:
  %t798 = call i64 @rt_sub(i64 %a1, i64 8)
  br label %fixmerge178
fixmerge178:
  %t799 = phi i64 [ %t797, %fixfast176 ], [ %t798, %fixslow177 ]
  %t800 = load i64, ptr @"scheme.base:list-head"
  %t801 = and i64 %t800, -8
  %t802 = inttoptr i64 %t801 to ptr
  %t803 = load i64, ptr %t802
  %t804 = inttoptr i64 %t803 to ptr
  %t805 = call fastcc i64%t804(i64 %t800, i64 2, i64 %t793, i64 %t799, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t806 = call i64 @rt_cons(i64 %t792, i64 %t805)
  ret i64 %t806
}

define fastcc i64 @"scheme.base:code:make-list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t811 = icmp eq i64 %argc, 2
  br i1 %t811, label %argok180, label %arityerr179
arityerr179:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok180:
  %t812 = load i64, ptr @"scheme.base:zero?"
  %t813 = and i64 %t812, -8
  %t814 = inttoptr i64 %t813 to ptr
  %t815 = load i64, ptr %t814
  %t816 = inttoptr i64 %t815 to ptr
  %t817 = call fastcc i64%t816(i64 %t812, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t818 = icmp ne i64 %t817, 1
  br i1 %t818, label %then181, label %else182
then181:
  ret i64 2
else182:
  %t819 = or i64 %a0, 8
  %t820 = and i64 %t819, 7
  %t821 = icmp eq i64 %t820, 0
  br i1 %t821, label %fixfast183, label %fixslow184
fixfast183:
  %t822 = sub i64 %a0, 8
  br label %fixmerge185
fixslow184:
  %t823 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge185
fixmerge185:
  %t824 = phi i64 [ %t822, %fixfast183 ], [ %t823, %fixslow184 ]
  %t825 = load i64, ptr @"scheme.base:make-list"
  %t826 = and i64 %t825, -8
  %t827 = inttoptr i64 %t826 to ptr
  %t828 = load i64, ptr %t827
  %t829 = inttoptr i64 %t828 to ptr
  %t830 = call fastcc i64%t829(i64 %t825, i64 2, i64 %t824, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t831 = call i64 @rt_cons(i64 %a1, i64 %t830)
  ret i64 %t831
}

define fastcc i64 @"scheme.base:code_154"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t836 = icmp eq i64 %argc, 2
  br i1 %t836, label %argok187, label %arityerr186
arityerr186:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok187:
  %t837 = and i64 %self, -8
  %t838 = inttoptr i64 %t837 to ptr
  %t839 = getelementptr i64, ptr %t838, i64 1
  %t840 = load i64, ptr %t839
  %t841 = or i64 %a0, %t840
  %t842 = and i64 %t841, 7
  %t843 = icmp eq i64 %t842, 0
  br i1 %t843, label %fixfast188, label %fixslow189
fixfast188:
  %t844 = icmp eq i64 %a0, %t840
  %t845 = select i1 %t844, i64 257, i64 1
  br label %fixmerge190
fixslow189:
  %t846 = call i64 @rt_num_eq(i64 %a0, i64 %t840)
  br label %fixmerge190
fixmerge190:
  %t847 = phi i64 [ %t845, %fixfast188 ], [ %t846, %fixslow189 ]
  %t848 = icmp ne i64 %t847, 1
  br i1 %t848, label %then191, label %else192
then191:
  %t849 = load i64, ptr @"scheme.base:reverse"
  %t850 = and i64 %t849, -8
  %t851 = inttoptr i64 %t850 to ptr
  %t852 = load i64, ptr %t851
  %t853 = inttoptr i64 %t852 to ptr
  %t854 = musttail call fastcc i64 %t853(i64 %t849, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t854
else192:
  %t855 = or i64 %a0, 8
  %t856 = and i64 %t855, 7
  %t857 = icmp eq i64 %t856, 0
  br i1 %t857, label %fixfast193, label %fixslow194
fixfast193:
  %t858 = add i64 %a0, 8
  br label %fixmerge195
fixslow194:
  %t859 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge195
fixmerge195:
  %t860 = phi i64 [ %t858, %fixfast193 ], [ %t859, %fixslow194 ]
  %t861 = call i64 @rt_cons(i64 %a0, i64 %a1)
  %t862 = musttail call fastcc i64 @"scheme.base:code_154"(i64 %self, i64 2, i64 %t860, i64 %t861, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t862
}

define fastcc i64 @"scheme.base:code:iota"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t863 = icmp eq i64 %argc, 1
  br i1 %t863, label %argok197, label %arityerr196
arityerr196:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok197:
  %t864 = call ptr @rt_alloc_words(i64 3)
  %t865 = ptrtoint ptr %t864 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_154" to i64), ptr %t864
  %t866 = or i64 %t865, 4
  %t867 = getelementptr i64, ptr %t864, i64 1
  store i64 %a0, ptr %t867
  %t868 = getelementptr i64, ptr %t864, i64 2
  store i64 %t866, ptr %t868
  %t869 = musttail call fastcc i64 @"scheme.base:code_154"(i64 %t866, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t869
}

define fastcc i64 @"scheme.base:code:max"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t874 = icmp eq i64 %argc, 2
  br i1 %t874, label %argok199, label %arityerr198
arityerr198:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok199:
  %t875 = or i64 %a0, %a1
  %t876 = and i64 %t875, 7
  %t877 = icmp eq i64 %t876, 0
  br i1 %t877, label %fixfast200, label %fixslow201
fixfast200:
  %t878 = icmp slt i64 %a0, %a1
  %t879 = select i1 %t878, i64 257, i64 1
  br label %fixmerge202
fixslow201:
  %t880 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge202
fixmerge202:
  %t881 = phi i64 [ %t879, %fixfast200 ], [ %t880, %fixslow201 ]
  %t882 = icmp ne i64 %t881, 1
  br i1 %t882, label %then203, label %else204
then203:
  ret i64 %a1
else204:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:void"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t887 = icmp eq i64 %argc, 0
  br i1 %t887, label %argok206, label %arityerr205
arityerr205:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok206:
  %t888 = icmp ne i64 1, 1
  br i1 %t888, label %then207, label %else208
then207:
  ret i64 1
else208:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t893 = icmp sge i64 %argc, 0
  br i1 %t893, label %argok210, label %arityerr209
arityerr209:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok210:
  %t894 = call ptr @rt_alloc_words(i64 8)
  %t895 = getelementptr i64, ptr %t894, i64 0
  store i64 %a0, ptr %t895
  %t896 = getelementptr i64, ptr %t894, i64 1
  store i64 %a1, ptr %t896
  %t897 = getelementptr i64, ptr %t894, i64 2
  store i64 %a2, ptr %t897
  %t898 = getelementptr i64, ptr %t894, i64 3
  store i64 %a3, ptr %t898
  %t899 = getelementptr i64, ptr %t894, i64 4
  store i64 %a4, ptr %t899
  %t900 = getelementptr i64, ptr %t894, i64 5
  store i64 %a5, ptr %t900
  %t901 = getelementptr i64, ptr %t894, i64 6
  store i64 %a6, ptr %t901
  %t902 = getelementptr i64, ptr %t894, i64 7
  store i64 %a7, ptr %t902
  %t903 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t894, ptr %overflow)
  %t904 = call i64 @rt_list_to_string(i64 %t903)
  ret i64 %t904
}

define fastcc i64 @"scheme.base:code:%str-concat"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t909 = icmp eq i64 %argc, 1
  br i1 %t909, label %argok212, label %arityerr211
arityerr211:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok212:
  %t910 = call i64 @rt_null_p(i64 %a0)
  %t911 = icmp ne i64 %t910, 1
  br i1 %t911, label %then213, label %else214
then213:
  %t912 = call i64 @rt_make_string(ptr @.str.lit.0, i64 0)
  ret i64 %t912
else214:
  %t913 = call i64 @rt_car(i64 %a0)
  %t914 = call i64 @rt_cdr(i64 %a0)
  %t915 = load i64, ptr @"scheme.base:%str-concat"
  %t916 = and i64 %t915, -8
  %t917 = inttoptr i64 %t916 to ptr
  %t918 = load i64, ptr %t917
  %t919 = inttoptr i64 %t918 to ptr
  %t920 = call fastcc i64%t919(i64 %t915, i64 1, i64 %t914, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t921 = call i64 @rt_string_append(i64 %t913, i64 %t920)
  ret i64 %t921
}

define fastcc i64 @"scheme.base:code:chr-cmp"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t926 = icmp eq i64 %argc, 4
  br i1 %t926, label %argok216, label %arityerr215
arityerr215:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok216:
  %t927 = call i64 @rt_char_to_integer(i64 %a1)
  %t928 = call i64 @rt_char_to_integer(i64 %a2)
  %t929 = and i64 %a0, -8
  %t930 = inttoptr i64 %t929 to ptr
  %t931 = load i64, ptr %t930
  %t932 = inttoptr i64 %t931 to ptr
  %t933 = call fastcc i64%t932(i64 %a0, i64 2, i64 %t927, i64 %t928, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t934 = icmp ne i64 %t933, 1
  br i1 %t934, label %then217, label %else218
then217:
  %t935 = call i64 @rt_null_p(i64 %a3)
  %t936 = icmp ne i64 %t935, 1
  br i1 %t936, label %then219, label %else220
then219:
  ret i64 257
else220:
  %t937 = call i64 @rt_car(i64 %a3)
  %t938 = call i64 @rt_cdr(i64 %a3)
  %t939 = load i64, ptr @"scheme.base:chr-cmp"
  %t940 = and i64 %t939, -8
  %t941 = inttoptr i64 %t940 to ptr
  %t942 = load i64, ptr %t941
  %t943 = inttoptr i64 %t942 to ptr
  %t944 = musttail call fastcc i64 %t943(i64 %t939, i64 4, i64 %a0, i64 %a2, i64 %t937, i64 %t938, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t944
else218:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_183"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t949 = icmp eq i64 %argc, 2
  br i1 %t949, label %argok222, label %arityerr221
arityerr221:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok222:
  %t950 = or i64 %a0, %a1
  %t951 = and i64 %t950, 7
  %t952 = icmp eq i64 %t951, 0
  br i1 %t952, label %fixfast223, label %fixslow224
fixfast223:
  %t953 = icmp eq i64 %a0, %a1
  %t954 = select i1 %t953, i64 257, i64 1
  br label %fixmerge225
fixslow224:
  %t955 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge225
fixmerge225:
  %t956 = phi i64 [ %t954, %fixfast223 ], [ %t955, %fixslow224 ]
  ret i64 %t956
}

define fastcc i64 @"scheme.base:code:char=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t957 = icmp sge i64 %argc, 2
  br i1 %t957, label %argok227, label %arityerr226
arityerr226:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok227:
  %t958 = call ptr @rt_alloc_words(i64 8)
  %t959 = getelementptr i64, ptr %t958, i64 0
  store i64 %a0, ptr %t959
  %t960 = getelementptr i64, ptr %t958, i64 1
  store i64 %a1, ptr %t960
  %t961 = getelementptr i64, ptr %t958, i64 2
  store i64 %a2, ptr %t961
  %t962 = getelementptr i64, ptr %t958, i64 3
  store i64 %a3, ptr %t962
  %t963 = getelementptr i64, ptr %t958, i64 4
  store i64 %a4, ptr %t963
  %t964 = getelementptr i64, ptr %t958, i64 5
  store i64 %a5, ptr %t964
  %t965 = getelementptr i64, ptr %t958, i64 6
  store i64 %a6, ptr %t965
  %t966 = getelementptr i64, ptr %t958, i64 7
  store i64 %a7, ptr %t966
  %t967 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t958, ptr %overflow)
  %t968 = call ptr @rt_alloc_words(i64 1)
  %t969 = ptrtoint ptr %t968 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_183" to i64), ptr %t968
  %t970 = or i64 %t969, 4
  %t971 = load i64, ptr @"scheme.base:chr-cmp"
  %t972 = and i64 %t971, -8
  %t973 = inttoptr i64 %t972 to ptr
  %t974 = load i64, ptr %t973
  %t975 = inttoptr i64 %t974 to ptr
  %t976 = musttail call fastcc i64 %t975(i64 %t971, i64 4, i64 %t970, i64 %a0, i64 %a1, i64 %t967, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t976
}

define fastcc i64 @"scheme.base:code_195"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t981 = icmp eq i64 %argc, 2
  br i1 %t981, label %argok229, label %arityerr228
arityerr228:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok229:
  %t982 = or i64 %a0, %a1
  %t983 = and i64 %t982, 7
  %t984 = icmp eq i64 %t983, 0
  br i1 %t984, label %fixfast230, label %fixslow231
fixfast230:
  %t985 = icmp slt i64 %a0, %a1
  %t986 = select i1 %t985, i64 257, i64 1
  br label %fixmerge232
fixslow231:
  %t987 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge232
fixmerge232:
  %t988 = phi i64 [ %t986, %fixfast230 ], [ %t987, %fixslow231 ]
  ret i64 %t988
}

define fastcc i64 @"scheme.base:code:char<?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t989 = icmp sge i64 %argc, 2
  br i1 %t989, label %argok234, label %arityerr233
arityerr233:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok234:
  %t990 = call ptr @rt_alloc_words(i64 8)
  %t991 = getelementptr i64, ptr %t990, i64 0
  store i64 %a0, ptr %t991
  %t992 = getelementptr i64, ptr %t990, i64 1
  store i64 %a1, ptr %t992
  %t993 = getelementptr i64, ptr %t990, i64 2
  store i64 %a2, ptr %t993
  %t994 = getelementptr i64, ptr %t990, i64 3
  store i64 %a3, ptr %t994
  %t995 = getelementptr i64, ptr %t990, i64 4
  store i64 %a4, ptr %t995
  %t996 = getelementptr i64, ptr %t990, i64 5
  store i64 %a5, ptr %t996
  %t997 = getelementptr i64, ptr %t990, i64 6
  store i64 %a6, ptr %t997
  %t998 = getelementptr i64, ptr %t990, i64 7
  store i64 %a7, ptr %t998
  %t999 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t990, ptr %overflow)
  %t1000 = call ptr @rt_alloc_words(i64 1)
  %t1001 = ptrtoint ptr %t1000 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_195" to i64), ptr %t1000
  %t1002 = or i64 %t1001, 4
  %t1003 = load i64, ptr @"scheme.base:chr-cmp"
  %t1004 = and i64 %t1003, -8
  %t1005 = inttoptr i64 %t1004 to ptr
  %t1006 = load i64, ptr %t1005
  %t1007 = inttoptr i64 %t1006 to ptr
  %t1008 = musttail call fastcc i64 %t1007(i64 %t1003, i64 4, i64 %t1002, i64 %a0, i64 %a1, i64 %t999, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1008
}

define fastcc i64 @"scheme.base:code_207"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1013 = icmp eq i64 %argc, 2
  br i1 %t1013, label %argok236, label %arityerr235
arityerr235:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok236:
  %t1014 = or i64 %a1, %a0
  %t1015 = and i64 %t1014, 7
  %t1016 = icmp eq i64 %t1015, 0
  br i1 %t1016, label %fixfast237, label %fixslow238
fixfast237:
  %t1017 = icmp slt i64 %a1, %a0
  %t1018 = select i1 %t1017, i64 257, i64 1
  br label %fixmerge239
fixslow238:
  %t1019 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge239
fixmerge239:
  %t1020 = phi i64 [ %t1018, %fixfast237 ], [ %t1019, %fixslow238 ]
  ret i64 %t1020
}

define fastcc i64 @"scheme.base:code:char>?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1021 = icmp sge i64 %argc, 2
  br i1 %t1021, label %argok241, label %arityerr240
arityerr240:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok241:
  %t1022 = call ptr @rt_alloc_words(i64 8)
  %t1023 = getelementptr i64, ptr %t1022, i64 0
  store i64 %a0, ptr %t1023
  %t1024 = getelementptr i64, ptr %t1022, i64 1
  store i64 %a1, ptr %t1024
  %t1025 = getelementptr i64, ptr %t1022, i64 2
  store i64 %a2, ptr %t1025
  %t1026 = getelementptr i64, ptr %t1022, i64 3
  store i64 %a3, ptr %t1026
  %t1027 = getelementptr i64, ptr %t1022, i64 4
  store i64 %a4, ptr %t1027
  %t1028 = getelementptr i64, ptr %t1022, i64 5
  store i64 %a5, ptr %t1028
  %t1029 = getelementptr i64, ptr %t1022, i64 6
  store i64 %a6, ptr %t1029
  %t1030 = getelementptr i64, ptr %t1022, i64 7
  store i64 %a7, ptr %t1030
  %t1031 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1022, ptr %overflow)
  %t1032 = call ptr @rt_alloc_words(i64 1)
  %t1033 = ptrtoint ptr %t1032 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_207" to i64), ptr %t1032
  %t1034 = or i64 %t1033, 4
  %t1035 = load i64, ptr @"scheme.base:chr-cmp"
  %t1036 = and i64 %t1035, -8
  %t1037 = inttoptr i64 %t1036 to ptr
  %t1038 = load i64, ptr %t1037
  %t1039 = inttoptr i64 %t1038 to ptr
  %t1040 = musttail call fastcc i64 %t1039(i64 %t1035, i64 4, i64 %t1034, i64 %a0, i64 %a1, i64 %t1031, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1040
}

define fastcc i64 @"scheme.base:code_219"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1045 = icmp eq i64 %argc, 2
  br i1 %t1045, label %argok243, label %arityerr242
arityerr242:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok243:
  %t1046 = or i64 %a0, %a1
  %t1047 = and i64 %t1046, 7
  %t1048 = icmp eq i64 %t1047, 0
  br i1 %t1048, label %fixfast244, label %fixslow245
fixfast244:
  %t1049 = icmp slt i64 %a0, %a1
  %t1050 = select i1 %t1049, i64 257, i64 1
  br label %fixmerge246
fixslow245:
  %t1051 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge246
fixmerge246:
  %t1052 = phi i64 [ %t1050, %fixfast244 ], [ %t1051, %fixslow245 ]
  %t1053 = icmp ne i64 %t1052, 1
  br i1 %t1053, label %then247, label %else248
then247:
  ret i64 257
else248:
  %t1054 = or i64 %a0, %a1
  %t1055 = and i64 %t1054, 7
  %t1056 = icmp eq i64 %t1055, 0
  br i1 %t1056, label %fixfast249, label %fixslow250
fixfast249:
  %t1057 = icmp eq i64 %a0, %a1
  %t1058 = select i1 %t1057, i64 257, i64 1
  br label %fixmerge251
fixslow250:
  %t1059 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge251
fixmerge251:
  %t1060 = phi i64 [ %t1058, %fixfast249 ], [ %t1059, %fixslow250 ]
  ret i64 %t1060
}

define fastcc i64 @"scheme.base:code:char<=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1061 = icmp sge i64 %argc, 2
  br i1 %t1061, label %argok253, label %arityerr252
arityerr252:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok253:
  %t1062 = call ptr @rt_alloc_words(i64 8)
  %t1063 = getelementptr i64, ptr %t1062, i64 0
  store i64 %a0, ptr %t1063
  %t1064 = getelementptr i64, ptr %t1062, i64 1
  store i64 %a1, ptr %t1064
  %t1065 = getelementptr i64, ptr %t1062, i64 2
  store i64 %a2, ptr %t1065
  %t1066 = getelementptr i64, ptr %t1062, i64 3
  store i64 %a3, ptr %t1066
  %t1067 = getelementptr i64, ptr %t1062, i64 4
  store i64 %a4, ptr %t1067
  %t1068 = getelementptr i64, ptr %t1062, i64 5
  store i64 %a5, ptr %t1068
  %t1069 = getelementptr i64, ptr %t1062, i64 6
  store i64 %a6, ptr %t1069
  %t1070 = getelementptr i64, ptr %t1062, i64 7
  store i64 %a7, ptr %t1070
  %t1071 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1062, ptr %overflow)
  %t1072 = call ptr @rt_alloc_words(i64 1)
  %t1073 = ptrtoint ptr %t1072 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_219" to i64), ptr %t1072
  %t1074 = or i64 %t1073, 4
  %t1075 = load i64, ptr @"scheme.base:chr-cmp"
  %t1076 = and i64 %t1075, -8
  %t1077 = inttoptr i64 %t1076 to ptr
  %t1078 = load i64, ptr %t1077
  %t1079 = inttoptr i64 %t1078 to ptr
  %t1080 = musttail call fastcc i64 %t1079(i64 %t1075, i64 4, i64 %t1074, i64 %a0, i64 %a1, i64 %t1071, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1080
}

define fastcc i64 @"scheme.base:code_231"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1085 = icmp eq i64 %argc, 2
  br i1 %t1085, label %argok255, label %arityerr254
arityerr254:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok255:
  %t1086 = or i64 %a1, %a0
  %t1087 = and i64 %t1086, 7
  %t1088 = icmp eq i64 %t1087, 0
  br i1 %t1088, label %fixfast256, label %fixslow257
fixfast256:
  %t1089 = icmp slt i64 %a1, %a0
  %t1090 = select i1 %t1089, i64 257, i64 1
  br label %fixmerge258
fixslow257:
  %t1091 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge258
fixmerge258:
  %t1092 = phi i64 [ %t1090, %fixfast256 ], [ %t1091, %fixslow257 ]
  %t1093 = icmp ne i64 %t1092, 1
  br i1 %t1093, label %then259, label %else260
then259:
  ret i64 257
else260:
  %t1094 = or i64 %a0, %a1
  %t1095 = and i64 %t1094, 7
  %t1096 = icmp eq i64 %t1095, 0
  br i1 %t1096, label %fixfast261, label %fixslow262
fixfast261:
  %t1097 = icmp eq i64 %a0, %a1
  %t1098 = select i1 %t1097, i64 257, i64 1
  br label %fixmerge263
fixslow262:
  %t1099 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge263
fixmerge263:
  %t1100 = phi i64 [ %t1098, %fixfast261 ], [ %t1099, %fixslow262 ]
  ret i64 %t1100
}

define fastcc i64 @"scheme.base:code:char>=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1101 = icmp sge i64 %argc, 2
  br i1 %t1101, label %argok265, label %arityerr264
arityerr264:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok265:
  %t1102 = call ptr @rt_alloc_words(i64 8)
  %t1103 = getelementptr i64, ptr %t1102, i64 0
  store i64 %a0, ptr %t1103
  %t1104 = getelementptr i64, ptr %t1102, i64 1
  store i64 %a1, ptr %t1104
  %t1105 = getelementptr i64, ptr %t1102, i64 2
  store i64 %a2, ptr %t1105
  %t1106 = getelementptr i64, ptr %t1102, i64 3
  store i64 %a3, ptr %t1106
  %t1107 = getelementptr i64, ptr %t1102, i64 4
  store i64 %a4, ptr %t1107
  %t1108 = getelementptr i64, ptr %t1102, i64 5
  store i64 %a5, ptr %t1108
  %t1109 = getelementptr i64, ptr %t1102, i64 6
  store i64 %a6, ptr %t1109
  %t1110 = getelementptr i64, ptr %t1102, i64 7
  store i64 %a7, ptr %t1110
  %t1111 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1102, ptr %overflow)
  %t1112 = call ptr @rt_alloc_words(i64 1)
  %t1113 = ptrtoint ptr %t1112 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_231" to i64), ptr %t1112
  %t1114 = or i64 %t1113, 4
  %t1115 = load i64, ptr @"scheme.base:chr-cmp"
  %t1116 = and i64 %t1115, -8
  %t1117 = inttoptr i64 %t1116 to ptr
  %t1118 = load i64, ptr %t1117
  %t1119 = inttoptr i64 %t1118 to ptr
  %t1120 = musttail call fastcc i64 %t1119(i64 %t1115, i64 4, i64 %t1114, i64 %a0, i64 %a1, i64 %t1111, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1120
}

define fastcc i64 @"scheme.base:code_242"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1125 = icmp eq i64 %argc, 2
  br i1 %t1125, label %argok267, label %arityerr266
arityerr266:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok267:
  %t1126 = or i64 %a0, 0
  %t1127 = and i64 %t1126, 7
  %t1128 = icmp eq i64 %t1127, 0
  br i1 %t1128, label %fixfast268, label %fixslow269
fixfast268:
  %t1129 = icmp slt i64 %a0, 0
  %t1130 = select i1 %t1129, i64 257, i64 1
  br label %fixmerge270
fixslow269:
  %t1131 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge270
fixmerge270:
  %t1132 = phi i64 [ %t1130, %fixfast268 ], [ %t1131, %fixslow269 ]
  %t1133 = icmp ne i64 %t1132, 1
  br i1 %t1133, label %then271, label %else272
then271:
  ret i64 %a1
else272:
  %t1134 = or i64 %a0, 8
  %t1135 = and i64 %t1134, 7
  %t1136 = icmp eq i64 %t1135, 0
  br i1 %t1136, label %fixfast273, label %fixslow274
fixfast273:
  %t1137 = sub i64 %a0, 8
  br label %fixmerge275
fixslow274:
  %t1138 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge275
fixmerge275:
  %t1139 = phi i64 [ %t1137, %fixfast273 ], [ %t1138, %fixslow274 ]
  %t1140 = and i64 %self, -8
  %t1141 = inttoptr i64 %t1140 to ptr
  %t1142 = getelementptr i64, ptr %t1141, i64 2
  %t1143 = load i64, ptr %t1142
  %t1144 = call i64 @rt_string_ref(i64 %t1143, i64 %a0)
  %t1145 = call i64 @rt_cons(i64 %t1144, i64 %a1)
  %t1146 = musttail call fastcc i64 @"scheme.base:code_242"(i64 %self, i64 2, i64 %t1139, i64 %t1145, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1146
}

define fastcc i64 @"scheme.base:code:string->list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1147 = icmp eq i64 %argc, 1
  br i1 %t1147, label %argok277, label %arityerr276
arityerr276:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok277:
  %t1148 = call ptr @rt_alloc_words(i64 3)
  %t1149 = ptrtoint ptr %t1148 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_242" to i64), ptr %t1148
  %t1150 = or i64 %t1149, 4
  %t1151 = getelementptr i64, ptr %t1148, i64 1
  store i64 %t1150, ptr %t1151
  %t1152 = getelementptr i64, ptr %t1148, i64 2
  store i64 %a0, ptr %t1152
  %t1153 = call i64 @rt_string_length(i64 %a0)
  %t1154 = or i64 %t1153, 8
  %t1155 = and i64 %t1154, 7
  %t1156 = icmp eq i64 %t1155, 0
  br i1 %t1156, label %fixfast278, label %fixslow279
fixfast278:
  %t1157 = sub i64 %t1153, 8
  br label %fixmerge280
fixslow279:
  %t1158 = call i64 @rt_sub(i64 %t1153, i64 8)
  br label %fixmerge280
fixmerge280:
  %t1159 = phi i64 [ %t1157, %fixfast278 ], [ %t1158, %fixslow279 ]
  %t1160 = musttail call fastcc i64 @"scheme.base:code_242"(i64 %t1150, i64 2, i64 %t1159, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1160
}

define fastcc i64 @"scheme.base:code:ns-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1165 = icmp eq i64 %argc, 2
  br i1 %t1165, label %argok282, label %arityerr281
arityerr281:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok282:
  %t1166 = call i64 @rt_remainder(i64 %a0, i64 80)
  %t1167 = or i64 0, %t1166
  %t1168 = and i64 %t1167, 7
  %t1169 = icmp eq i64 %t1168, 0
  br i1 %t1169, label %fixfast283, label %fixslow284
fixfast283:
  %t1170 = sub i64 0, %t1166
  br label %fixmerge285
fixslow284:
  %t1171 = call i64 @rt_sub(i64 0, i64 %t1166)
  br label %fixmerge285
fixmerge285:
  %t1172 = phi i64 [ %t1170, %fixfast283 ], [ %t1171, %fixslow284 ]
  %t1173 = or i64 384, %t1172
  %t1174 = and i64 %t1173, 7
  %t1175 = icmp eq i64 %t1174, 0
  br i1 %t1175, label %fixfast286, label %fixslow287
fixfast286:
  %t1176 = add i64 384, %t1172
  br label %fixmerge288
fixslow287:
  %t1177 = call i64 @rt_add(i64 384, i64 %t1172)
  br label %fixmerge288
fixmerge288:
  %t1178 = phi i64 [ %t1176, %fixfast286 ], [ %t1177, %fixslow287 ]
  %t1179 = call i64 @rt_integer_to_char(i64 %t1178)
  %t1180 = call i64 @rt_quotient(i64 %a0, i64 80)
  %t1181 = or i64 %t1180, 0
  %t1182 = and i64 %t1181, 7
  %t1183 = icmp eq i64 %t1182, 0
  br i1 %t1183, label %fixfast289, label %fixslow290
fixfast289:
  %t1184 = icmp eq i64 %t1180, 0
  %t1185 = select i1 %t1184, i64 257, i64 1
  br label %fixmerge291
fixslow290:
  %t1186 = call i64 @rt_num_eq(i64 %t1180, i64 0)
  br label %fixmerge291
fixmerge291:
  %t1187 = phi i64 [ %t1185, %fixfast289 ], [ %t1186, %fixslow290 ]
  %t1188 = icmp ne i64 %t1187, 1
  br i1 %t1188, label %then292, label %else293
then292:
  %t1189 = call i64 @rt_cons(i64 %t1179, i64 %a1)
  ret i64 %t1189
else293:
  %t1190 = call i64 @rt_cons(i64 %t1179, i64 %a1)
  %t1191 = load i64, ptr @"scheme.base:ns-digits"
  %t1192 = and i64 %t1191, -8
  %t1193 = inttoptr i64 %t1192 to ptr
  %t1194 = load i64, ptr %t1193
  %t1195 = inttoptr i64 %t1194 to ptr
  %t1196 = musttail call fastcc i64 %t1195(i64 %t1191, i64 2, i64 %t1180, i64 %t1190, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1196
}

define fastcc i64 @"scheme.base:code:number->string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1201 = icmp eq i64 %argc, 1
  br i1 %t1201, label %argok295, label %arityerr294
arityerr294:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok295:
  %t1202 = call i64 @rt_exact_p(i64 %a0)
  %t1203 = icmp ne i64 %t1202, 1
  br i1 %t1203, label %then296, label %else297
then296:
  %t1204 = or i64 %a0, 0
  %t1205 = and i64 %t1204, 7
  %t1206 = icmp eq i64 %t1205, 0
  br i1 %t1206, label %fixfast298, label %fixslow299
fixfast298:
  %t1207 = icmp eq i64 %a0, 0
  %t1208 = select i1 %t1207, i64 257, i64 1
  br label %fixmerge300
fixslow299:
  %t1209 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge300
fixmerge300:
  %t1210 = phi i64 [ %t1208, %fixfast298 ], [ %t1209, %fixslow299 ]
  %t1211 = icmp ne i64 %t1210, 1
  br i1 %t1211, label %then301, label %else302
then301:
  %t1212 = call i64 @rt_make_string(ptr @.str.lit.1, i64 1)
  ret i64 %t1212
else302:
  %t1213 = or i64 %a0, 0
  %t1214 = and i64 %t1213, 7
  %t1215 = icmp eq i64 %t1214, 0
  br i1 %t1215, label %fixfast303, label %fixslow304
fixfast303:
  %t1216 = icmp slt i64 %a0, 0
  %t1217 = select i1 %t1216, i64 257, i64 1
  br label %fixmerge305
fixslow304:
  %t1218 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge305
fixmerge305:
  %t1219 = phi i64 [ %t1217, %fixfast303 ], [ %t1218, %fixslow304 ]
  %t1220 = icmp ne i64 %t1219, 1
  br i1 %t1220, label %then306, label %else307
then306:
  %t1221 = load i64, ptr @"scheme.base:ns-digits"
  %t1222 = and i64 %t1221, -8
  %t1223 = inttoptr i64 %t1222 to ptr
  %t1224 = load i64, ptr %t1223
  %t1225 = inttoptr i64 %t1224 to ptr
  %t1226 = call fastcc i64%t1225(i64 %t1221, i64 2, i64 %a0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1227 = call i64 @rt_cons(i64 11529, i64 %t1226)
  %t1228 = call i64 @rt_list_to_string(i64 %t1227)
  ret i64 %t1228
else307:
  %t1229 = or i64 0, %a0
  %t1230 = and i64 %t1229, 7
  %t1231 = icmp eq i64 %t1230, 0
  br i1 %t1231, label %fixfast308, label %fixslow309
fixfast308:
  %t1232 = sub i64 0, %a0
  br label %fixmerge310
fixslow309:
  %t1233 = call i64 @rt_sub(i64 0, i64 %a0)
  br label %fixmerge310
fixmerge310:
  %t1234 = phi i64 [ %t1232, %fixfast308 ], [ %t1233, %fixslow309 ]
  %t1235 = load i64, ptr @"scheme.base:ns-digits"
  %t1236 = and i64 %t1235, -8
  %t1237 = inttoptr i64 %t1236 to ptr
  %t1238 = load i64, ptr %t1237
  %t1239 = inttoptr i64 %t1238 to ptr
  %t1240 = call fastcc i64%t1239(i64 %t1235, i64 2, i64 %t1234, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1241 = call i64 @rt_list_to_string(i64 %t1240)
  ret i64 %t1241
else297:
  %t1242 = call i64 @rt_flonum_to_string(i64 %a0)
  ret i64 %t1242
}

define fastcc i64 @"scheme.base:code:error"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1247 = icmp sge i64 %argc, 1
  br i1 %t1247, label %argok312, label %arityerr311
arityerr311:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok312:
  %t1248 = call ptr @rt_alloc_words(i64 8)
  %t1249 = getelementptr i64, ptr %t1248, i64 0
  store i64 %a0, ptr %t1249
  %t1250 = getelementptr i64, ptr %t1248, i64 1
  store i64 %a1, ptr %t1250
  %t1251 = getelementptr i64, ptr %t1248, i64 2
  store i64 %a2, ptr %t1251
  %t1252 = getelementptr i64, ptr %t1248, i64 3
  store i64 %a3, ptr %t1252
  %t1253 = getelementptr i64, ptr %t1248, i64 4
  store i64 %a4, ptr %t1253
  %t1254 = getelementptr i64, ptr %t1248, i64 5
  store i64 %a5, ptr %t1254
  %t1255 = getelementptr i64, ptr %t1248, i64 6
  store i64 %a6, ptr %t1255
  %t1256 = getelementptr i64, ptr %t1248, i64 7
  store i64 %a7, ptr %t1256
  %t1257 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t1248, ptr %overflow)
  %t1258 = call i64 @rt_string_p(i64 %a0)
  %t1259 = icmp ne i64 %t1258, 1
  br i1 %t1259, label %then313, label %else314
then313:
  %t1260 = call i64 @rt_make_error_object(i64 %a0, i64 %t1257)
  %t1261 = load i64, ptr @"scheme.base:raise"
  %t1262 = and i64 %t1261, -8
  %t1263 = inttoptr i64 %t1262 to ptr
  %t1264 = load i64, ptr %t1263
  %t1265 = inttoptr i64 %t1264 to ptr
  %t1266 = musttail call fastcc i64 %t1265(i64 %t1261, i64 1, i64 %t1260, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1266
else314:
  %t1267 = call i64 @rt_symbol_to_string(i64 %a0)
  %t1268 = call i64 @rt_make_string(ptr @.str.lit.2, i64 2)
  %t1269 = call i64 @rt_car(i64 %t1257)
  %t1270 = call i64 @rt_string_append(i64 %t1268, i64 %t1269)
  %t1271 = call i64 @rt_string_append(i64 %t1267, i64 %t1270)
  %t1272 = call i64 @rt_cdr(i64 %t1257)
  %t1273 = call i64 @rt_make_error_object(i64 %t1271, i64 %t1272)
  %t1274 = load i64, ptr @"scheme.base:raise"
  %t1275 = and i64 %t1274, -8
  %t1276 = inttoptr i64 %t1275 to ptr
  %t1277 = load i64, ptr %t1276
  %t1278 = inttoptr i64 %t1277 to ptr
  %t1279 = musttail call fastcc i64 %t1278(i64 %t1274, i64 1, i64 %t1273, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1279
}

define fastcc i64 @"scheme.base:code:%unwind-to"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1286 = icmp eq i64 %argc, 1
  br i1 %t1286, label %argok316, label %arityerr315
arityerr315:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok316:
  %t1287 = load i64, ptr @"scheme.base:*winds*"
  %t1288 = call i64 @rt_eq_p(i64 %t1287, i64 %a0)
  %t1289 = icmp ne i64 %t1288, 1
  br i1 %t1289, label %then317, label %else318
then317:
  ret i64 257
else318:
  %t1290 = load i64, ptr @"scheme.base:*winds*"
  %t1291 = call i64 @rt_null_p(i64 %t1290)
  %t1292 = icmp ne i64 %t1291, 1
  br i1 %t1292, label %then319, label %else320
then319:
  ret i64 257
else320:
  %t1293 = load i64, ptr @"scheme.base:*winds*"
  %t1294 = call i64 @rt_car(i64 %t1293)
  %t1295 = load i64, ptr @"scheme.base:*winds*"
  %t1296 = call i64 @rt_cdr(i64 %t1295)
  %t1297 = call i64 @rt_root(i64 %t1296)
  store i64 %t1297, ptr @"scheme.base:*winds*"
  %t1298 = call i64 @rt_cdr(i64 %t1294)
  %t1299 = and i64 %t1298, -8
  %t1300 = inttoptr i64 %t1299 to ptr
  %t1301 = load i64, ptr %t1300
  %t1302 = inttoptr i64 %t1301 to ptr
  %t1303 = call fastcc i64%t1302(i64 %t1298, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1304 = load i64, ptr @"scheme.base:%unwind-to"
  %t1305 = and i64 %t1304, -8
  %t1306 = inttoptr i64 %t1305 to ptr
  %t1307 = load i64, ptr %t1306
  %t1308 = inttoptr i64 %t1307 to ptr
  %t1309 = musttail call fastcc i64 %t1308(i64 %t1304, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1309
}

define fastcc i64 @"scheme.base:code:dynamic-wind"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1314 = icmp eq i64 %argc, 3
  br i1 %t1314, label %argok322, label %arityerr321
arityerr321:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok322:
  %t1315 = and i64 %a0, -8
  %t1316 = inttoptr i64 %t1315 to ptr
  %t1317 = load i64, ptr %t1316
  %t1318 = inttoptr i64 %t1317 to ptr
  %t1319 = call fastcc i64%t1318(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1320 = call i64 @rt_cons(i64 %a0, i64 %a2)
  %t1321 = load i64, ptr @"scheme.base:*winds*"
  %t1322 = call i64 @rt_cons(i64 %t1320, i64 %t1321)
  %t1323 = call i64 @rt_root(i64 %t1322)
  store i64 %t1323, ptr @"scheme.base:*winds*"
  %t1324 = and i64 %a1, -8
  %t1325 = inttoptr i64 %t1324 to ptr
  %t1326 = load i64, ptr %t1325
  %t1327 = inttoptr i64 %t1326 to ptr
  %t1328 = call fastcc i64%t1327(i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1329 = load i64, ptr @"scheme.base:*winds*"
  %t1330 = call i64 @rt_cdr(i64 %t1329)
  %t1331 = call i64 @rt_root(i64 %t1330)
  store i64 %t1331, ptr @"scheme.base:*winds*"
  %t1332 = and i64 %a2, -8
  %t1333 = inttoptr i64 %t1332 to ptr
  %t1334 = load i64, ptr %t1333
  %t1335 = inttoptr i64 %t1334 to ptr
  %t1336 = call fastcc i64%t1335(i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1328
}

define fastcc i64 @"scheme.base:code_285"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1341 = icmp eq i64 %argc, 1
  br i1 %t1341, label %argok324, label %arityerr323
arityerr323:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok324:
  %t1342 = and i64 %self, -8
  %t1343 = inttoptr i64 %t1342 to ptr
  %t1344 = getelementptr i64, ptr %t1343, i64 1
  %t1345 = load i64, ptr %t1344
  %t1346 = call i64 @rt_escape_live_p(i64 %t1345)
  %t1347 = icmp ne i64 %t1346, 1
  br i1 %t1347, label %then325, label %else326
then325:
  %t1348 = and i64 %self, -8
  %t1349 = inttoptr i64 %t1348 to ptr
  %t1350 = getelementptr i64, ptr %t1349, i64 2
  %t1351 = load i64, ptr %t1350
  %t1352 = load i64, ptr @"scheme.base:%unwind-to"
  %t1353 = and i64 %t1352, -8
  %t1354 = inttoptr i64 %t1353 to ptr
  %t1355 = load i64, ptr %t1354
  %t1356 = inttoptr i64 %t1355 to ptr
  %t1357 = call fastcc i64%t1356(i64 %t1352, i64 1, i64 %t1351, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1358 = and i64 %self, -8
  %t1359 = inttoptr i64 %t1358 to ptr
  %t1360 = getelementptr i64, ptr %t1359, i64 1
  %t1361 = load i64, ptr %t1360
  %t1362 = call i64 @rt_escape_to(i64 %t1361, i64 %a0)
  br label %merge327
else326:
  br label %merge327
merge327:
  %t1363 = phi i64 [ %t1362, %then325 ], [ 1, %else326 ]
  %t1364 = call i64 @rt_intern(ptr @.str.sym.3)
  %t1365 = call i64 @rt_make_string(ptr @.str.lit.4, i64 39)
  %t1366 = load i64, ptr @"scheme.base:error"
  %t1367 = and i64 %t1366, -8
  %t1368 = inttoptr i64 %t1367 to ptr
  %t1369 = load i64, ptr %t1368
  %t1370 = inttoptr i64 %t1369 to ptr
  %t1371 = musttail call fastcc i64 %t1370(i64 %t1366, i64 2, i64 %t1364, i64 %t1365, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1371
}

define fastcc i64 @"scheme.base:code_283"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1372 = icmp eq i64 %argc, 0
  br i1 %t1372, label %argok329, label %arityerr328
arityerr328:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok329:
  %t1373 = call i64 @rt_escape_frame()
  %t1374 = and i64 %self, -8
  %t1375 = inttoptr i64 %t1374 to ptr
  %t1376 = getelementptr i64, ptr %t1375, i64 2
  %t1377 = load i64, ptr %t1376
  %t1378 = call ptr @rt_alloc_words(i64 3)
  %t1379 = ptrtoint ptr %t1378 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_285" to i64), ptr %t1378
  %t1380 = getelementptr i64, ptr %t1378, i64 1
  store i64 %t1373, ptr %t1380
  %t1381 = getelementptr i64, ptr %t1378, i64 2
  store i64 %t1377, ptr %t1381
  %t1382 = or i64 %t1379, 4
  %t1383 = and i64 %self, -8
  %t1384 = inttoptr i64 %t1383 to ptr
  %t1385 = getelementptr i64, ptr %t1384, i64 1
  %t1386 = load i64, ptr %t1385
  %t1387 = and i64 %t1386, -8
  %t1388 = inttoptr i64 %t1387 to ptr
  %t1389 = load i64, ptr %t1388
  %t1390 = inttoptr i64 %t1389 to ptr
  %t1391 = musttail call fastcc i64 %t1390(i64 %t1386, i64 1, i64 %t1382, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1391
}

define fastcc i64 @"scheme.base:code:call-with-current-continuation"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1392 = icmp eq i64 %argc, 1
  br i1 %t1392, label %argok331, label %arityerr330
arityerr330:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok331:
  %t1393 = load i64, ptr @"scheme.base:*winds*"
  %t1394 = call ptr @rt_alloc_words(i64 3)
  %t1395 = ptrtoint ptr %t1394 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_283" to i64), ptr %t1394
  %t1396 = getelementptr i64, ptr %t1394, i64 1
  store i64 %a0, ptr %t1396
  %t1397 = getelementptr i64, ptr %t1394, i64 2
  store i64 %t1393, ptr %t1397
  %t1398 = or i64 %t1395, 4
  %t1399 = call i64 @rt_run_guarded(ptr @__apply0, i64 %t1398)
  %t1400 = call i64 @rt_cdr(i64 %t1399)
  ret i64 %t1400
}

define fastcc i64 @"scheme.base:code:call/cc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1405 = icmp eq i64 %argc, 1
  br i1 %t1405, label %argok333, label %arityerr332
arityerr332:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok333:
  %t1406 = load i64, ptr @"scheme.base:call-with-current-continuation"
  %t1407 = and i64 %t1406, -8
  %t1408 = inttoptr i64 %t1407 to ptr
  %t1409 = load i64, ptr %t1408
  %t1410 = inttoptr i64 %t1409 to ptr
  %t1411 = musttail call fastcc i64 %t1410(i64 %t1406, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1411
}

define fastcc i64 @"scheme.base:code_293"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1416 = icmp eq i64 %argc, 0
  br i1 %t1416, label %argok335, label %arityerr334
arityerr334:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok335:
  %t1417 = and i64 %self, -8
  %t1418 = inttoptr i64 %t1417 to ptr
  %t1419 = getelementptr i64, ptr %t1418, i64 1
  %t1420 = load i64, ptr %t1419
  %t1421 = and i64 %self, -8
  %t1422 = inttoptr i64 %t1421 to ptr
  %t1423 = getelementptr i64, ptr %t1422, i64 2
  %t1424 = load i64, ptr %t1423
  %t1425 = call i64 @rt_cons(i64 %t1420, i64 %t1424)
  %t1426 = call i64 @rt_root(i64 %t1425)
  store i64 %t1426, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code_295"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1427 = icmp eq i64 %argc, 0
  br i1 %t1427, label %argok337, label %arityerr336
arityerr336:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok337:
  %t1428 = and i64 %self, -8
  %t1429 = inttoptr i64 %t1428 to ptr
  %t1430 = getelementptr i64, ptr %t1429, i64 1
  %t1431 = load i64, ptr %t1430
  %t1432 = call i64 @rt_root(i64 %t1431)
  store i64 %t1432, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code:%with-handler"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1433 = icmp eq i64 %argc, 2
  br i1 %t1433, label %argok339, label %arityerr338
arityerr338:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok339:
  %t1434 = load i64, ptr @"scheme.base:*handlers*"
  %t1435 = call ptr @rt_alloc_words(i64 3)
  %t1436 = ptrtoint ptr %t1435 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_293" to i64), ptr %t1435
  %t1437 = getelementptr i64, ptr %t1435, i64 1
  store i64 %a0, ptr %t1437
  %t1438 = getelementptr i64, ptr %t1435, i64 2
  store i64 %t1434, ptr %t1438
  %t1439 = or i64 %t1436, 4
  %t1440 = call ptr @rt_alloc_words(i64 2)
  %t1441 = ptrtoint ptr %t1440 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_295" to i64), ptr %t1440
  %t1442 = getelementptr i64, ptr %t1440, i64 1
  store i64 %t1434, ptr %t1442
  %t1443 = or i64 %t1441, 4
  %t1444 = load i64, ptr @"scheme.base:dynamic-wind"
  %t1445 = and i64 %t1444, -8
  %t1446 = inttoptr i64 %t1445 to ptr
  %t1447 = load i64, ptr %t1446
  %t1448 = inttoptr i64 %t1447 to ptr
  %t1449 = musttail call fastcc i64 %t1448(i64 %t1444, i64 3, i64 %t1439, i64 %a1, i64 %t1443, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1449
}

define fastcc i64 @"scheme.base:code:raise"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1454 = icmp eq i64 %argc, 1
  br i1 %t1454, label %argok341, label %arityerr340
arityerr340:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok341:
  %t1455 = load i64, ptr @"scheme.base:*handlers*"
  %t1456 = call i64 @rt_null_p(i64 %t1455)
  %t1457 = icmp ne i64 %t1456, 1
  br i1 %t1457, label %then342, label %else343
then342:
  %t1458 = call i64 @rt_raise(i64 %a0)
  ret i64 %t1458
else343:
  %t1459 = load i64, ptr @"scheme.base:*handlers*"
  %t1460 = call i64 @rt_car(i64 %t1459)
  %t1461 = load i64, ptr @"scheme.base:*handlers*"
  %t1462 = load i64, ptr @"scheme.base:*handlers*"
  %t1463 = call i64 @rt_cdr(i64 %t1462)
  %t1464 = call i64 @rt_root(i64 %t1463)
  store i64 %t1464, ptr @"scheme.base:*handlers*"
  %t1465 = and i64 %t1460, -8
  %t1466 = inttoptr i64 %t1465 to ptr
  %t1467 = load i64, ptr %t1466
  %t1468 = inttoptr i64 %t1467 to ptr
  %t1469 = call fastcc i64%t1468(i64 %t1460, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1470 = call i64 @rt_root(i64 %t1461)
  store i64 %t1470, ptr @"scheme.base:*handlers*"
  %t1471 = call i64 @rt_raise(i64 %a0)
  ret i64 %t1471
}

define fastcc i64 @"scheme.base:code:error-object?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1476 = icmp eq i64 %argc, 1
  br i1 %t1476, label %argok345, label %arityerr344
arityerr344:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok345:
  %t1477 = call i64 @rt_error_object_p(i64 %a0)
  ret i64 %t1477
}

define fastcc i64 @"scheme.base:code:error-object-message"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1482 = icmp eq i64 %argc, 1
  br i1 %t1482, label %argok347, label %arityerr346
arityerr346:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok347:
  %t1483 = call i64 @rt_error_object_message(i64 %a0)
  ret i64 %t1483
}

define fastcc i64 @"scheme.base:code:error-object-irritants"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1488 = icmp eq i64 %argc, 1
  br i1 %t1488, label %argok349, label %arityerr348
arityerr348:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok349:
  %t1489 = call i64 @rt_error_object_irritants(i64 %a0)
  ret i64 %t1489
}

define fastcc i64 @"scheme.base:code_315"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1494 = icmp eq i64 %argc, 1
  br i1 %t1494, label %argok351, label %arityerr350
arityerr350:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok351:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_317"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1495 = icmp eq i64 %argc, 1
  br i1 %t1495, label %argok353, label %arityerr352
arityerr352:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok353:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_319"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1496 = icmp sge i64 %argc, 0
  br i1 %t1496, label %argok355, label %arityerr354
arityerr354:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok355:
  %t1497 = call ptr @rt_alloc_words(i64 8)
  %t1498 = getelementptr i64, ptr %t1497, i64 0
  store i64 %a0, ptr %t1498
  %t1499 = getelementptr i64, ptr %t1497, i64 1
  store i64 %a1, ptr %t1499
  %t1500 = getelementptr i64, ptr %t1497, i64 2
  store i64 %a2, ptr %t1500
  %t1501 = getelementptr i64, ptr %t1497, i64 3
  store i64 %a3, ptr %t1501
  %t1502 = getelementptr i64, ptr %t1497, i64 4
  store i64 %a4, ptr %t1502
  %t1503 = getelementptr i64, ptr %t1497, i64 5
  store i64 %a5, ptr %t1503
  %t1504 = getelementptr i64, ptr %t1497, i64 6
  store i64 %a6, ptr %t1504
  %t1505 = getelementptr i64, ptr %t1497, i64 7
  store i64 %a7, ptr %t1505
  %t1506 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1497, ptr %overflow)
  %t1507 = call i64 @rt_null_p(i64 %t1506)
  %t1508 = icmp ne i64 %t1507, 1
  br i1 %t1508, label %then356, label %else357
then356:
  %t1509 = and i64 %self, -8
  %t1510 = inttoptr i64 %t1509 to ptr
  %t1511 = getelementptr i64, ptr %t1510, i64 1
  %t1512 = load i64, ptr %t1511
  %t1513 = call i64 @rt_vector_ref(i64 %t1512, i64 0)
  ret i64 %t1513
else357:
  %t1514 = call i64 @rt_cdr(i64 %t1506)
  %t1515 = call i64 @rt_null_p(i64 %t1514)
  %t1516 = icmp ne i64 %t1515, 1
  br i1 %t1516, label %then358, label %else359
then358:
  %t1517 = and i64 %self, -8
  %t1518 = inttoptr i64 %t1517 to ptr
  %t1519 = getelementptr i64, ptr %t1518, i64 1
  %t1520 = load i64, ptr %t1519
  %t1521 = call i64 @rt_car(i64 %t1506)
  %t1522 = and i64 %self, -8
  %t1523 = inttoptr i64 %t1522 to ptr
  %t1524 = getelementptr i64, ptr %t1523, i64 2
  %t1525 = load i64, ptr %t1524
  %t1526 = and i64 %t1525, -8
  %t1527 = inttoptr i64 %t1526 to ptr
  %t1528 = load i64, ptr %t1527
  %t1529 = inttoptr i64 %t1528 to ptr
  %t1530 = call fastcc i64%t1529(i64 %t1525, i64 1, i64 %t1521, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1531 = call i64 @rt_vector_set(i64 %t1520, i64 0, i64 %t1530)
  ret i64 %t1531
else359:
  %t1532 = and i64 %self, -8
  %t1533 = inttoptr i64 %t1532 to ptr
  %t1534 = getelementptr i64, ptr %t1533, i64 1
  %t1535 = load i64, ptr %t1534
  %t1536 = call i64 @rt_car(i64 %t1506)
  %t1537 = call i64 @rt_vector_set(i64 %t1535, i64 0, i64 %t1536)
  ret i64 %t1537
}

define fastcc i64 @"scheme.base:code:make-parameter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1538 = icmp sge i64 %argc, 1
  br i1 %t1538, label %argok361, label %arityerr360
arityerr360:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok361:
  %t1539 = call ptr @rt_alloc_words(i64 8)
  %t1540 = getelementptr i64, ptr %t1539, i64 0
  store i64 %a0, ptr %t1540
  %t1541 = getelementptr i64, ptr %t1539, i64 1
  store i64 %a1, ptr %t1541
  %t1542 = getelementptr i64, ptr %t1539, i64 2
  store i64 %a2, ptr %t1542
  %t1543 = getelementptr i64, ptr %t1539, i64 3
  store i64 %a3, ptr %t1543
  %t1544 = getelementptr i64, ptr %t1539, i64 4
  store i64 %a4, ptr %t1544
  %t1545 = getelementptr i64, ptr %t1539, i64 5
  store i64 %a5, ptr %t1545
  %t1546 = getelementptr i64, ptr %t1539, i64 6
  store i64 %a6, ptr %t1546
  %t1547 = getelementptr i64, ptr %t1539, i64 7
  store i64 %a7, ptr %t1547
  %t1548 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t1539, ptr %overflow)
  %t1549 = call i64 @rt_null_p(i64 %t1548)
  %t1550 = icmp ne i64 %t1549, 1
  br i1 %t1550, label %then362, label %else363
then362:
  %t1551 = call ptr @rt_alloc_words(i64 1)
  %t1552 = ptrtoint ptr %t1551 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_315" to i64), ptr %t1551
  %t1553 = or i64 %t1552, 4
  br label %merge364
else363:
  %t1554 = call i64 @rt_car(i64 %t1548)
  br label %merge364
merge364:
  %t1555 = phi i64 [ %t1553, %then362 ], [ %t1554, %else363 ]
  %t1556 = call i64 @rt_make_vector(i64 8, i64 0)
  %t1557 = call i64 @rt_null_p(i64 %t1548)
  %t1558 = icmp ne i64 %t1557, 1
  br i1 %t1558, label %then365, label %else366
then365:
  %t1559 = call ptr @rt_alloc_words(i64 1)
  %t1560 = ptrtoint ptr %t1559 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_317" to i64), ptr %t1559
  %t1561 = or i64 %t1560, 4
  br label %merge367
else366:
  %t1562 = call i64 @rt_car(i64 %t1548)
  br label %merge367
merge367:
  %t1563 = phi i64 [ %t1561, %then365 ], [ %t1562, %else366 ]
  %t1564 = and i64 %t1563, -8
  %t1565 = inttoptr i64 %t1564 to ptr
  %t1566 = load i64, ptr %t1565
  %t1567 = inttoptr i64 %t1566 to ptr
  %t1568 = call fastcc i64%t1567(i64 %t1563, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1569 = call i64 @rt_vector_set(i64 %t1556, i64 0, i64 %t1568)
  %t1570 = call ptr @rt_alloc_words(i64 3)
  %t1571 = ptrtoint ptr %t1570 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_319" to i64), ptr %t1570
  %t1572 = getelementptr i64, ptr %t1570, i64 1
  store i64 %t1556, ptr %t1572
  %t1573 = getelementptr i64, ptr %t1570, i64 2
  store i64 %t1555, ptr %t1573
  %t1574 = or i64 %t1571, 4
  ret i64 %t1574
}

define fastcc i64 @"scheme.base:code_331"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1579 = icmp eq i64 %argc, 1
  br i1 %t1579, label %argok369, label %arityerr368
arityerr368:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok369:
  %t1580 = and i64 %a0, -8
  %t1581 = inttoptr i64 %t1580 to ptr
  %t1582 = load i64, ptr %t1581
  %t1583 = inttoptr i64 %t1582 to ptr
  %t1584 = musttail call fastcc i64 %t1583(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1584
}

define fastcc i64 @"scheme.base:code_335"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1585 = icmp eq i64 %argc, 2
  br i1 %t1585, label %argok371, label %arityerr370
arityerr370:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok371:
  %t1586 = and i64 %a0, -8
  %t1587 = inttoptr i64 %t1586 to ptr
  %t1588 = load i64, ptr %t1587
  %t1589 = inttoptr i64 %t1588 to ptr
  %t1590 = musttail call fastcc i64 %t1589(i64 %a0, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1590
}

define fastcc i64 @"scheme.base:code_333"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1591 = icmp eq i64 %argc, 0
  br i1 %t1591, label %argok373, label %arityerr372
arityerr372:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok373:
  %t1592 = call ptr @rt_alloc_words(i64 1)
  %t1593 = ptrtoint ptr %t1592 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_335" to i64), ptr %t1592
  %t1594 = or i64 %t1593, 4
  %t1595 = and i64 %self, -8
  %t1596 = inttoptr i64 %t1595 to ptr
  %t1597 = getelementptr i64, ptr %t1596, i64 1
  %t1598 = load i64, ptr %t1597
  %t1599 = and i64 %self, -8
  %t1600 = inttoptr i64 %t1599 to ptr
  %t1601 = getelementptr i64, ptr %t1600, i64 2
  %t1602 = load i64, ptr %t1601
  %t1603 = load i64, ptr @"scheme.base:for-each"
  %t1604 = and i64 %t1603, -8
  %t1605 = inttoptr i64 %t1604 to ptr
  %t1606 = load i64, ptr %t1605
  %t1607 = inttoptr i64 %t1606 to ptr
  %t1608 = musttail call fastcc i64 %t1607(i64 %t1603, i64 3, i64 %t1594, i64 %t1598, i64 %t1602, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1608
}

define fastcc i64 @"scheme.base:code_339"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1609 = icmp eq i64 %argc, 2
  br i1 %t1609, label %argok375, label %arityerr374
arityerr374:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok375:
  %t1610 = and i64 %a0, -8
  %t1611 = inttoptr i64 %t1610 to ptr
  %t1612 = load i64, ptr %t1611
  %t1613 = inttoptr i64 %t1612 to ptr
  %t1614 = musttail call fastcc i64 %t1613(i64 %a0, i64 2, i64 %a1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1614
}

define fastcc i64 @"scheme.base:code_337"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1615 = icmp eq i64 %argc, 0
  br i1 %t1615, label %argok377, label %arityerr376
arityerr376:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok377:
  %t1616 = call ptr @rt_alloc_words(i64 1)
  %t1617 = ptrtoint ptr %t1616 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_339" to i64), ptr %t1616
  %t1618 = or i64 %t1617, 4
  %t1619 = and i64 %self, -8
  %t1620 = inttoptr i64 %t1619 to ptr
  %t1621 = getelementptr i64, ptr %t1620, i64 1
  %t1622 = load i64, ptr %t1621
  %t1623 = and i64 %self, -8
  %t1624 = inttoptr i64 %t1623 to ptr
  %t1625 = getelementptr i64, ptr %t1624, i64 2
  %t1626 = load i64, ptr %t1625
  %t1627 = load i64, ptr @"scheme.base:for-each"
  %t1628 = and i64 %t1627, -8
  %t1629 = inttoptr i64 %t1628 to ptr
  %t1630 = load i64, ptr %t1629
  %t1631 = inttoptr i64 %t1630 to ptr
  %t1632 = musttail call fastcc i64 %t1631(i64 %t1627, i64 3, i64 %t1618, i64 %t1622, i64 %t1626, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1632
}

define fastcc i64 @"scheme.base:code:%with-parameters"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1633 = icmp eq i64 %argc, 3
  br i1 %t1633, label %argok379, label %arityerr378
arityerr378:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok379:
  %t1634 = call ptr @rt_alloc_words(i64 1)
  %t1635 = ptrtoint ptr %t1634 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_331" to i64), ptr %t1634
  %t1636 = or i64 %t1635, 4
  %t1637 = load i64, ptr @"scheme.base:map"
  %t1638 = and i64 %t1637, -8
  %t1639 = inttoptr i64 %t1638 to ptr
  %t1640 = load i64, ptr %t1639
  %t1641 = inttoptr i64 %t1640 to ptr
  %t1642 = call fastcc i64%t1641(i64 %t1637, i64 2, i64 %t1636, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1643 = call ptr @rt_alloc_words(i64 3)
  %t1644 = ptrtoint ptr %t1643 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_333" to i64), ptr %t1643
  %t1645 = getelementptr i64, ptr %t1643, i64 1
  store i64 %a0, ptr %t1645
  %t1646 = getelementptr i64, ptr %t1643, i64 2
  store i64 %a1, ptr %t1646
  %t1647 = or i64 %t1644, 4
  %t1648 = call ptr @rt_alloc_words(i64 3)
  %t1649 = ptrtoint ptr %t1648 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_337" to i64), ptr %t1648
  %t1650 = getelementptr i64, ptr %t1648, i64 1
  store i64 %a0, ptr %t1650
  %t1651 = getelementptr i64, ptr %t1648, i64 2
  store i64 %t1642, ptr %t1651
  %t1652 = or i64 %t1649, 4
  %t1653 = load i64, ptr @"scheme.base:dynamic-wind"
  %t1654 = and i64 %t1653, -8
  %t1655 = inttoptr i64 %t1654 to ptr
  %t1656 = load i64, ptr %t1655
  %t1657 = inttoptr i64 %t1656 to ptr
  %t1658 = musttail call fastcc i64 %t1657(i64 %t1653, i64 3, i64 %t1647, i64 %a2, i64 %t1652, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1658
}

define fastcc i64 @"scheme.base:code_347"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1663 = icmp eq i64 %argc, 2
  br i1 %t1663, label %argok381, label %arityerr380
arityerr380:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok381:
  %t1664 = call i64 @rt_null_p(i64 %a0)
  %t1665 = icmp ne i64 %t1664, 1
  br i1 %t1665, label %then382, label %else383
then382:
  %t1666 = and i64 %self, -8
  %t1667 = inttoptr i64 %t1666 to ptr
  %t1668 = getelementptr i64, ptr %t1667, i64 1
  %t1669 = load i64, ptr %t1668
  ret i64 %t1669
else383:
  %t1670 = and i64 %self, -8
  %t1671 = inttoptr i64 %t1670 to ptr
  %t1672 = getelementptr i64, ptr %t1671, i64 1
  %t1673 = load i64, ptr %t1672
  %t1674 = call i64 @rt_car(i64 %a0)
  %t1675 = call i64 @rt_vector_set(i64 %t1673, i64 %a1, i64 %t1674)
  %t1676 = call i64 @rt_cdr(i64 %a0)
  %t1677 = or i64 %a1, 8
  %t1678 = and i64 %t1677, 7
  %t1679 = icmp eq i64 %t1678, 0
  br i1 %t1679, label %fixfast384, label %fixslow385
fixfast384:
  %t1680 = add i64 %a1, 8
  br label %fixmerge386
fixslow385:
  %t1681 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge386
fixmerge386:
  %t1682 = phi i64 [ %t1680, %fixfast384 ], [ %t1681, %fixslow385 ]
  %t1683 = musttail call fastcc i64 @"scheme.base:code_347"(i64 %self, i64 2, i64 %t1676, i64 %t1682, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1683
}

define fastcc i64 @"scheme.base:code:list->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1684 = icmp eq i64 %argc, 1
  br i1 %t1684, label %argok388, label %arityerr387
arityerr387:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok388:
  %t1685 = load i64, ptr @"scheme.base:length"
  %t1686 = and i64 %t1685, -8
  %t1687 = inttoptr i64 %t1686 to ptr
  %t1688 = load i64, ptr %t1687
  %t1689 = inttoptr i64 %t1688 to ptr
  %t1690 = call fastcc i64%t1689(i64 %t1685, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1691 = call i64 @rt_make_vector(i64 %t1690, i64 0)
  %t1692 = call ptr @rt_alloc_words(i64 3)
  %t1693 = ptrtoint ptr %t1692 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_347" to i64), ptr %t1692
  %t1694 = or i64 %t1693, 4
  %t1695 = getelementptr i64, ptr %t1692, i64 1
  store i64 %t1691, ptr %t1695
  %t1696 = getelementptr i64, ptr %t1692, i64 2
  store i64 %t1694, ptr %t1696
  %t1697 = musttail call fastcc i64 @"scheme.base:code_347"(i64 %t1694, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1697
}

define fastcc i64 @"scheme.base:code:vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1702 = icmp sge i64 %argc, 0
  br i1 %t1702, label %argok390, label %arityerr389
arityerr389:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok390:
  %t1703 = call ptr @rt_alloc_words(i64 8)
  %t1704 = getelementptr i64, ptr %t1703, i64 0
  store i64 %a0, ptr %t1704
  %t1705 = getelementptr i64, ptr %t1703, i64 1
  store i64 %a1, ptr %t1705
  %t1706 = getelementptr i64, ptr %t1703, i64 2
  store i64 %a2, ptr %t1706
  %t1707 = getelementptr i64, ptr %t1703, i64 3
  store i64 %a3, ptr %t1707
  %t1708 = getelementptr i64, ptr %t1703, i64 4
  store i64 %a4, ptr %t1708
  %t1709 = getelementptr i64, ptr %t1703, i64 5
  store i64 %a5, ptr %t1709
  %t1710 = getelementptr i64, ptr %t1703, i64 6
  store i64 %a6, ptr %t1710
  %t1711 = getelementptr i64, ptr %t1703, i64 7
  store i64 %a7, ptr %t1711
  %t1712 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1703, ptr %overflow)
  %t1713 = load i64, ptr @"scheme.base:list->vector"
  %t1714 = and i64 %t1713, -8
  %t1715 = inttoptr i64 %t1714 to ptr
  %t1716 = load i64, ptr %t1715
  %t1717 = inttoptr i64 %t1716 to ptr
  %t1718 = musttail call fastcc i64 %t1717(i64 %t1713, i64 1, i64 %t1712, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1718
}

define fastcc i64 @"scheme.base:code_357"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1723 = icmp eq i64 %argc, 2
  br i1 %t1723, label %argok392, label %arityerr391
arityerr391:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok392:
  %t1724 = call i64 @rt_null_p(i64 %a0)
  %t1725 = icmp ne i64 %t1724, 1
  br i1 %t1725, label %then393, label %else394
then393:
  %t1726 = and i64 %self, -8
  %t1727 = inttoptr i64 %t1726 to ptr
  %t1728 = getelementptr i64, ptr %t1727, i64 1
  %t1729 = load i64, ptr %t1728
  ret i64 %t1729
else394:
  %t1730 = and i64 %self, -8
  %t1731 = inttoptr i64 %t1730 to ptr
  %t1732 = getelementptr i64, ptr %t1731, i64 1
  %t1733 = load i64, ptr %t1732
  %t1734 = call i64 @rt_car(i64 %a0)
  %t1735 = call i64 @rt_bytevector_u8_set(i64 %t1733, i64 %a1, i64 %t1734)
  %t1736 = call i64 @rt_cdr(i64 %a0)
  %t1737 = or i64 %a1, 8
  %t1738 = and i64 %t1737, 7
  %t1739 = icmp eq i64 %t1738, 0
  br i1 %t1739, label %fixfast395, label %fixslow396
fixfast395:
  %t1740 = add i64 %a1, 8
  br label %fixmerge397
fixslow396:
  %t1741 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge397
fixmerge397:
  %t1742 = phi i64 [ %t1740, %fixfast395 ], [ %t1741, %fixslow396 ]
  %t1743 = musttail call fastcc i64 @"scheme.base:code_357"(i64 %self, i64 2, i64 %t1736, i64 %t1742, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1743
}

define fastcc i64 @"scheme.base:code:list->bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1744 = icmp eq i64 %argc, 1
  br i1 %t1744, label %argok399, label %arityerr398
arityerr398:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok399:
  %t1745 = load i64, ptr @"scheme.base:length"
  %t1746 = and i64 %t1745, -8
  %t1747 = inttoptr i64 %t1746 to ptr
  %t1748 = load i64, ptr %t1747
  %t1749 = inttoptr i64 %t1748 to ptr
  %t1750 = call fastcc i64%t1749(i64 %t1745, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1751 = call i64 @rt_make_bytevector(i64 %t1750, i64 0)
  %t1752 = call ptr @rt_alloc_words(i64 3)
  %t1753 = ptrtoint ptr %t1752 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_357" to i64), ptr %t1752
  %t1754 = or i64 %t1753, 4
  %t1755 = getelementptr i64, ptr %t1752, i64 1
  store i64 %t1751, ptr %t1755
  %t1756 = getelementptr i64, ptr %t1752, i64 2
  store i64 %t1754, ptr %t1756
  %t1757 = musttail call fastcc i64 @"scheme.base:code_357"(i64 %t1754, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1757
}

define fastcc i64 @"scheme.base:code:bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1762 = icmp sge i64 %argc, 0
  br i1 %t1762, label %argok401, label %arityerr400
arityerr400:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok401:
  %t1763 = call ptr @rt_alloc_words(i64 8)
  %t1764 = getelementptr i64, ptr %t1763, i64 0
  store i64 %a0, ptr %t1764
  %t1765 = getelementptr i64, ptr %t1763, i64 1
  store i64 %a1, ptr %t1765
  %t1766 = getelementptr i64, ptr %t1763, i64 2
  store i64 %a2, ptr %t1766
  %t1767 = getelementptr i64, ptr %t1763, i64 3
  store i64 %a3, ptr %t1767
  %t1768 = getelementptr i64, ptr %t1763, i64 4
  store i64 %a4, ptr %t1768
  %t1769 = getelementptr i64, ptr %t1763, i64 5
  store i64 %a5, ptr %t1769
  %t1770 = getelementptr i64, ptr %t1763, i64 6
  store i64 %a6, ptr %t1770
  %t1771 = getelementptr i64, ptr %t1763, i64 7
  store i64 %a7, ptr %t1771
  %t1772 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1763, ptr %overflow)
  %t1773 = load i64, ptr @"scheme.base:list->bytevector"
  %t1774 = and i64 %t1773, -8
  %t1775 = inttoptr i64 %t1774 to ptr
  %t1776 = load i64, ptr %t1775
  %t1777 = inttoptr i64 %t1776 to ptr
  %t1778 = musttail call fastcc i64 %t1777(i64 %t1773, i64 1, i64 %t1772, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1778
}

define fastcc i64 @"scheme.base:code:values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1783 = icmp sge i64 %argc, 0
  br i1 %t1783, label %argok403, label %arityerr402
arityerr402:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok403:
  %t1784 = call ptr @rt_alloc_words(i64 8)
  %t1785 = getelementptr i64, ptr %t1784, i64 0
  store i64 %a0, ptr %t1785
  %t1786 = getelementptr i64, ptr %t1784, i64 1
  store i64 %a1, ptr %t1786
  %t1787 = getelementptr i64, ptr %t1784, i64 2
  store i64 %a2, ptr %t1787
  %t1788 = getelementptr i64, ptr %t1784, i64 3
  store i64 %a3, ptr %t1788
  %t1789 = getelementptr i64, ptr %t1784, i64 4
  store i64 %a4, ptr %t1789
  %t1790 = getelementptr i64, ptr %t1784, i64 5
  store i64 %a5, ptr %t1790
  %t1791 = getelementptr i64, ptr %t1784, i64 6
  store i64 %a6, ptr %t1791
  %t1792 = getelementptr i64, ptr %t1784, i64 7
  store i64 %a7, ptr %t1792
  %t1793 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1784, ptr %overflow)
  %t1794 = call i64 @rt_pair_p(i64 %t1793)
  %t1795 = icmp ne i64 %t1794, 1
  br i1 %t1795, label %then404, label %else405
then404:
  %t1796 = call i64 @rt_cdr(i64 %t1793)
  %t1797 = call i64 @rt_null_p(i64 %t1796)
  br label %merge406
else405:
  br label %merge406
merge406:
  %t1798 = phi i64 [ %t1797, %then404 ], [ 1, %else405 ]
  %t1799 = icmp ne i64 %t1798, 1
  br i1 %t1799, label %then407, label %else408
then407:
  %t1800 = call i64 @rt_car(i64 %t1793)
  ret i64 %t1800
else408:
  %t1801 = call i64 @rt_list_to_mv(i64 %t1793)
  ret i64 %t1801
}

define fastcc i64 @"scheme.base:code:call-with-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1806 = icmp eq i64 %argc, 2
  br i1 %t1806, label %argok410, label %arityerr409
arityerr409:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok410:
  %t1807 = and i64 %a0, -8
  %t1808 = inttoptr i64 %t1807 to ptr
  %t1809 = load i64, ptr %t1808
  %t1810 = inttoptr i64 %t1809 to ptr
  %t1811 = call fastcc i64%t1810(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1812 = call i64 @rt_mv_p(i64 %t1811)
  %t1813 = icmp ne i64 %t1812, 1
  br i1 %t1813, label %then411, label %else412
then411:
  %t1814 = call i64 @rt_mv_to_list(i64 %t1811)
  %t1815 = and i64 %a1, -8
  %t1816 = inttoptr i64 %t1815 to ptr
  %t1817 = load i64, ptr %t1816
  %t1818 = inttoptr i64 %t1817 to ptr
  %t1819 = call i64 @rt_list_length(i64 %t1814)
  %t1820 = add i64 0, %t1819
  %t1821 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t1814, i64 8)
  %t1833 = getelementptr i64, ptr %t1821, i64 0
  %t1825 = load i64, ptr %t1833
  %t1834 = getelementptr i64, ptr %t1821, i64 1
  %t1826 = load i64, ptr %t1834
  %t1835 = getelementptr i64, ptr %t1821, i64 2
  %t1827 = load i64, ptr %t1835
  %t1836 = getelementptr i64, ptr %t1821, i64 3
  %t1828 = load i64, ptr %t1836
  %t1837 = getelementptr i64, ptr %t1821, i64 4
  %t1829 = load i64, ptr %t1837
  %t1838 = getelementptr i64, ptr %t1821, i64 5
  %t1830 = load i64, ptr %t1838
  %t1839 = getelementptr i64, ptr %t1821, i64 6
  %t1831 = load i64, ptr %t1839
  %t1840 = getelementptr i64, ptr %t1821, i64 7
  %t1832 = load i64, ptr %t1840
  %t1822 = icmp sgt i64 %t1820, 8
  %t1823 = getelementptr i64, ptr %t1821, i64 8
  %t1824 = select i1 %t1822, ptr %t1823, ptr null
  %t1841 = musttail call fastcc i64 %t1818(i64 %a1, i64 %t1820, i64 %t1825, i64 %t1826, i64 %t1827, i64 %t1828, i64 %t1829, i64 %t1830, i64 %t1831, i64 %t1832, ptr %t1824)
  ret i64 %t1841
else412:
  %t1842 = and i64 %a1, -8
  %t1843 = inttoptr i64 %t1842 to ptr
  %t1844 = load i64, ptr %t1843
  %t1845 = inttoptr i64 %t1844 to ptr
  %t1846 = musttail call fastcc i64 %t1845(i64 %a1, i64 1, i64 %t1811, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1846
}

define fastcc i64 @"scheme.base:code:make-hash-table"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1853 = icmp eq i64 %argc, 0
  br i1 %t1853, label %argok414, label %arityerr413
arityerr413:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok414:
  %t1854 = load i64, ptr @"scheme.base:%ht-initial-buckets"
  %t1855 = call i64 @rt_make_vector(i64 %t1854, i64 2)
  %t1856 = load i64, ptr @"scheme.base:vector"
  %t1857 = and i64 %t1856, -8
  %t1858 = inttoptr i64 %t1857 to ptr
  %t1859 = load i64, ptr %t1858
  %t1860 = inttoptr i64 %t1859 to ptr
  %t1861 = call fastcc i64%t1860(i64 %t1856, i64 3, i64 0, i64 %t1855, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1862 = call i64 @rt_make_hash_table(i64 %t1861)
  ret i64 %t1862
}

define fastcc i64 @"scheme.base:code:hash-table?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1867 = icmp eq i64 %argc, 1
  br i1 %t1867, label %argok416, label %arityerr415
arityerr415:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok416:
  %t1868 = call i64 @rt_hash_table_p(i64 %a0)
  ret i64 %t1868
}

define fastcc i64 @"scheme.base:code:%ht-count"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1873 = icmp eq i64 %argc, 1
  br i1 %t1873, label %argok418, label %arityerr417
arityerr417:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok418:
  %t1874 = call i64 @rt_hash_table_spine(i64 %a0)
  %t1875 = call i64 @rt_vector_ref(i64 %t1874, i64 0)
  ret i64 %t1875
}

define fastcc i64 @"scheme.base:code:%ht-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1880 = icmp eq i64 %argc, 1
  br i1 %t1880, label %argok420, label %arityerr419
arityerr419:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok420:
  %t1881 = call i64 @rt_hash_table_spine(i64 %a0)
  %t1882 = call i64 @rt_vector_ref(i64 %t1881, i64 8)
  ret i64 %t1882
}

define fastcc i64 @"scheme.base:code:%ht-set-count!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1887 = icmp eq i64 %argc, 2
  br i1 %t1887, label %argok422, label %arityerr421
arityerr421:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok422:
  %t1888 = call i64 @rt_hash_table_spine(i64 %a0)
  %t1889 = call i64 @rt_vector_set(i64 %t1888, i64 0, i64 %a1)
  ret i64 %t1889
}

define fastcc i64 @"scheme.base:code:%ht-set-buckets!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1894 = icmp eq i64 %argc, 2
  br i1 %t1894, label %argok424, label %arityerr423
arityerr423:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok424:
  %t1895 = call i64 @rt_hash_table_spine(i64 %a0)
  %t1896 = call i64 @rt_vector_set(i64 %t1895, i64 8, i64 %a1)
  ret i64 %t1896
}

define fastcc i64 @"scheme.base:code:%ht-index"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1901 = icmp eq i64 %argc, 2
  br i1 %t1901, label %argok426, label %arityerr425
arityerr425:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok426:
  %t1902 = call i64 @rt_hash(i64 %a0)
  %t1903 = call i64 @rt_remainder(i64 %t1902, i64 %a1)
  ret i64 %t1903
}

define fastcc i64 @"scheme.base:code:%ht-assoc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1908 = icmp eq i64 %argc, 2
  br i1 %t1908, label %argok428, label %arityerr427
arityerr427:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok428:
  %t1909 = call i64 @rt_null_p(i64 %a1)
  %t1910 = icmp ne i64 %t1909, 1
  br i1 %t1910, label %then429, label %else430
then429:
  ret i64 1
else430:
  %t1911 = call i64 @rt_car(i64 %a1)
  %t1912 = call i64 @rt_car(i64 %t1911)
  %t1913 = call i64 @rt_equal(i64 %a0, i64 %t1912)
  %t1914 = icmp ne i64 %t1913, 1
  br i1 %t1914, label %then431, label %else432
then431:
  %t1915 = call i64 @rt_car(i64 %a1)
  ret i64 %t1915
else432:
  %t1916 = call i64 @rt_cdr(i64 %a1)
  %t1917 = load i64, ptr @"scheme.base:%ht-assoc"
  %t1918 = and i64 %t1917, -8
  %t1919 = inttoptr i64 %t1918 to ptr
  %t1920 = load i64, ptr %t1919
  %t1921 = inttoptr i64 %t1920 to ptr
  %t1922 = musttail call fastcc i64 %t1921(i64 %t1917, i64 2, i64 %a0, i64 %t1916, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1922
}

define fastcc i64 @"scheme.base:code:%ht-remove"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1927 = icmp eq i64 %argc, 2
  br i1 %t1927, label %argok434, label %arityerr433
arityerr433:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok434:
  %t1928 = call i64 @rt_null_p(i64 %a1)
  %t1929 = icmp ne i64 %t1928, 1
  br i1 %t1929, label %then435, label %else436
then435:
  ret i64 2
else436:
  %t1930 = call i64 @rt_car(i64 %a1)
  %t1931 = call i64 @rt_car(i64 %t1930)
  %t1932 = call i64 @rt_equal(i64 %a0, i64 %t1931)
  %t1933 = icmp ne i64 %t1932, 1
  br i1 %t1933, label %then437, label %else438
then437:
  %t1934 = call i64 @rt_cdr(i64 %a1)
  ret i64 %t1934
else438:
  %t1935 = call i64 @rt_car(i64 %a1)
  %t1936 = call i64 @rt_cdr(i64 %a1)
  %t1937 = load i64, ptr @"scheme.base:%ht-remove"
  %t1938 = and i64 %t1937, -8
  %t1939 = inttoptr i64 %t1938 to ptr
  %t1940 = load i64, ptr %t1939
  %t1941 = inttoptr i64 %t1940 to ptr
  %t1942 = call fastcc i64%t1941(i64 %t1937, i64 2, i64 %a0, i64 %t1936, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1943 = call i64 @rt_cons(i64 %t1935, i64 %t1942)
  ret i64 %t1943
}

define fastcc i64 @"scheme.base:code:hash-table-ref/default"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1948 = icmp eq i64 %argc, 3
  br i1 %t1948, label %argok440, label %arityerr439
arityerr439:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok440:
  %t1949 = load i64, ptr @"scheme.base:%ht-buckets"
  %t1950 = and i64 %t1949, -8
  %t1951 = inttoptr i64 %t1950 to ptr
  %t1952 = load i64, ptr %t1951
  %t1953 = inttoptr i64 %t1952 to ptr
  %t1954 = call fastcc i64%t1953(i64 %t1949, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1955 = call i64 @rt_vector_length(i64 %t1954)
  %t1956 = load i64, ptr @"scheme.base:%ht-index"
  %t1957 = and i64 %t1956, -8
  %t1958 = inttoptr i64 %t1957 to ptr
  %t1959 = load i64, ptr %t1958
  %t1960 = inttoptr i64 %t1959 to ptr
  %t1961 = call fastcc i64%t1960(i64 %t1956, i64 2, i64 %a1, i64 %t1955, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1962 = call i64 @rt_vector_ref(i64 %t1954, i64 %t1961)
  %t1963 = load i64, ptr @"scheme.base:%ht-assoc"
  %t1964 = and i64 %t1963, -8
  %t1965 = inttoptr i64 %t1964 to ptr
  %t1966 = load i64, ptr %t1965
  %t1967 = inttoptr i64 %t1966 to ptr
  %t1968 = call fastcc i64%t1967(i64 %t1963, i64 2, i64 %a1, i64 %t1962, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1969 = icmp ne i64 %t1968, 1
  br i1 %t1969, label %then441, label %else442
then441:
  %t1970 = call i64 @rt_cdr(i64 %t1968)
  ret i64 %t1970
else442:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:hash-table-contains?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1975 = icmp eq i64 %argc, 2
  br i1 %t1975, label %argok444, label %arityerr443
arityerr443:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok444:
  %t1976 = load i64, ptr @"scheme.base:%ht-buckets"
  %t1977 = and i64 %t1976, -8
  %t1978 = inttoptr i64 %t1977 to ptr
  %t1979 = load i64, ptr %t1978
  %t1980 = inttoptr i64 %t1979 to ptr
  %t1981 = call fastcc i64%t1980(i64 %t1976, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1982 = call i64 @rt_vector_length(i64 %t1981)
  %t1983 = load i64, ptr @"scheme.base:%ht-index"
  %t1984 = and i64 %t1983, -8
  %t1985 = inttoptr i64 %t1984 to ptr
  %t1986 = load i64, ptr %t1985
  %t1987 = inttoptr i64 %t1986 to ptr
  %t1988 = call fastcc i64%t1987(i64 %t1983, i64 2, i64 %a1, i64 %t1982, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1989 = call i64 @rt_vector_ref(i64 %t1981, i64 %t1988)
  %t1990 = load i64, ptr @"scheme.base:%ht-assoc"
  %t1991 = and i64 %t1990, -8
  %t1992 = inttoptr i64 %t1991 to ptr
  %t1993 = load i64, ptr %t1992
  %t1994 = inttoptr i64 %t1993 to ptr
  %t1995 = call fastcc i64%t1994(i64 %t1990, i64 2, i64 %a1, i64 %t1989, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1996 = icmp ne i64 %t1995, 1
  br i1 %t1996, label %then445, label %else446
then445:
  ret i64 257
else446:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-ref"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2001 = icmp eq i64 %argc, 2
  br i1 %t2001, label %argok448, label %arityerr447
arityerr447:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok448:
  %t2002 = load i64, ptr @"scheme.base:%ht-buckets"
  %t2003 = and i64 %t2002, -8
  %t2004 = inttoptr i64 %t2003 to ptr
  %t2005 = load i64, ptr %t2004
  %t2006 = inttoptr i64 %t2005 to ptr
  %t2007 = call fastcc i64%t2006(i64 %t2002, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2008 = call i64 @rt_vector_length(i64 %t2007)
  %t2009 = load i64, ptr @"scheme.base:%ht-index"
  %t2010 = and i64 %t2009, -8
  %t2011 = inttoptr i64 %t2010 to ptr
  %t2012 = load i64, ptr %t2011
  %t2013 = inttoptr i64 %t2012 to ptr
  %t2014 = call fastcc i64%t2013(i64 %t2009, i64 2, i64 %a1, i64 %t2008, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2015 = call i64 @rt_vector_ref(i64 %t2007, i64 %t2014)
  %t2016 = load i64, ptr @"scheme.base:%ht-assoc"
  %t2017 = and i64 %t2016, -8
  %t2018 = inttoptr i64 %t2017 to ptr
  %t2019 = load i64, ptr %t2018
  %t2020 = inttoptr i64 %t2019 to ptr
  %t2021 = call fastcc i64%t2020(i64 %t2016, i64 2, i64 %a1, i64 %t2015, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2022 = icmp ne i64 %t2021, 1
  br i1 %t2022, label %then449, label %else450
then449:
  %t2023 = call i64 @rt_cdr(i64 %t2021)
  ret i64 %t2023
else450:
  %t2024 = call i64 @rt_make_string(ptr @.str.lit.5, i64 29)
  %t2025 = load i64, ptr @"scheme.base:error"
  %t2026 = and i64 %t2025, -8
  %t2027 = inttoptr i64 %t2026 to ptr
  %t2028 = load i64, ptr %t2027
  %t2029 = inttoptr i64 %t2028 to ptr
  %t2030 = musttail call fastcc i64 %t2029(i64 %t2025, i64 2, i64 %t2024, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2030
}

define fastcc i64 @"scheme.base:code:hash-table-set!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2035 = icmp eq i64 %argc, 3
  br i1 %t2035, label %argok452, label %arityerr451
arityerr451:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok452:
  %t2036 = load i64, ptr @"scheme.base:%ht-buckets"
  %t2037 = and i64 %t2036, -8
  %t2038 = inttoptr i64 %t2037 to ptr
  %t2039 = load i64, ptr %t2038
  %t2040 = inttoptr i64 %t2039 to ptr
  %t2041 = call fastcc i64%t2040(i64 %t2036, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2042 = call i64 @rt_vector_length(i64 %t2041)
  %t2043 = load i64, ptr @"scheme.base:%ht-index"
  %t2044 = and i64 %t2043, -8
  %t2045 = inttoptr i64 %t2044 to ptr
  %t2046 = load i64, ptr %t2045
  %t2047 = inttoptr i64 %t2046 to ptr
  %t2048 = call fastcc i64%t2047(i64 %t2043, i64 2, i64 %a1, i64 %t2042, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2049 = call i64 @rt_vector_ref(i64 %t2041, i64 %t2048)
  %t2050 = load i64, ptr @"scheme.base:%ht-assoc"
  %t2051 = and i64 %t2050, -8
  %t2052 = inttoptr i64 %t2051 to ptr
  %t2053 = load i64, ptr %t2052
  %t2054 = inttoptr i64 %t2053 to ptr
  %t2055 = call fastcc i64%t2054(i64 %t2050, i64 2, i64 %a1, i64 %t2049, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2056 = call i64 @rt_cons(i64 %a1, i64 %a2)
  %t2057 = icmp ne i64 %t2055, 1
  br i1 %t2057, label %then453, label %else454
then453:
  %t2058 = load i64, ptr @"scheme.base:%ht-remove"
  %t2059 = and i64 %t2058, -8
  %t2060 = inttoptr i64 %t2059 to ptr
  %t2061 = load i64, ptr %t2060
  %t2062 = inttoptr i64 %t2061 to ptr
  %t2063 = call fastcc i64%t2062(i64 %t2058, i64 2, i64 %a1, i64 %t2049, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge455
else454:
  br label %merge455
merge455:
  %t2064 = phi i64 [ %t2063, %then453 ], [ %t2049, %else454 ]
  %t2065 = call i64 @rt_cons(i64 %t2056, i64 %t2064)
  %t2066 = call i64 @rt_vector_set(i64 %t2041, i64 %t2048, i64 %t2065)
  %t2067 = icmp ne i64 %t2055, 1
  br i1 %t2067, label %then456, label %else457
then456:
  ret i64 1
else457:
  %t2068 = load i64, ptr @"scheme.base:%ht-count"
  %t2069 = and i64 %t2068, -8
  %t2070 = inttoptr i64 %t2069 to ptr
  %t2071 = load i64, ptr %t2070
  %t2072 = inttoptr i64 %t2071 to ptr
  %t2073 = call fastcc i64%t2072(i64 %t2068, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2074 = or i64 %t2073, 8
  %t2075 = and i64 %t2074, 7
  %t2076 = icmp eq i64 %t2075, 0
  br i1 %t2076, label %fixfast458, label %fixslow459
fixfast458:
  %t2077 = add i64 %t2073, 8
  br label %fixmerge460
fixslow459:
  %t2078 = call i64 @rt_add(i64 %t2073, i64 8)
  br label %fixmerge460
fixmerge460:
  %t2079 = phi i64 [ %t2077, %fixfast458 ], [ %t2078, %fixslow459 ]
  %t2080 = load i64, ptr @"scheme.base:%ht-set-count!"
  %t2081 = and i64 %t2080, -8
  %t2082 = inttoptr i64 %t2081 to ptr
  %t2083 = load i64, ptr %t2082
  %t2084 = inttoptr i64 %t2083 to ptr
  %t2085 = call fastcc i64%t2084(i64 %t2080, i64 2, i64 %a0, i64 %t2079, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2086 = load i64, ptr @"scheme.base:%ht-count"
  %t2087 = and i64 %t2086, -8
  %t2088 = inttoptr i64 %t2087 to ptr
  %t2089 = load i64, ptr %t2088
  %t2090 = inttoptr i64 %t2089 to ptr
  %t2091 = call fastcc i64%t2090(i64 %t2086, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2092 = load i64, ptr @"scheme.base:%ht-load-factor"
  %t2093 = or i64 %t2092, %t2042
  %t2094 = and i64 %t2093, 7
  %t2095 = icmp eq i64 %t2094, 0
  br i1 %t2095, label %fixfast461, label %fixslow462
fixfast461:
  %t2096 = ashr i64 %t2092, 3
  %t2097 = mul i64 %t2096, %t2042
  br label %fixmerge463
fixslow462:
  %t2098 = call i64 @rt_mul(i64 %t2092, i64 %t2042)
  br label %fixmerge463
fixmerge463:
  %t2099 = phi i64 [ %t2097, %fixfast461 ], [ %t2098, %fixslow462 ]
  %t2100 = or i64 %t2099, %t2091
  %t2101 = and i64 %t2100, 7
  %t2102 = icmp eq i64 %t2101, 0
  br i1 %t2102, label %fixfast464, label %fixslow465
fixfast464:
  %t2103 = icmp slt i64 %t2099, %t2091
  %t2104 = select i1 %t2103, i64 257, i64 1
  br label %fixmerge466
fixslow465:
  %t2105 = call i64 @rt_lt(i64 %t2099, i64 %t2091)
  br label %fixmerge466
fixmerge466:
  %t2106 = phi i64 [ %t2104, %fixfast464 ], [ %t2105, %fixslow465 ]
  %t2107 = icmp ne i64 %t2106, 1
  br i1 %t2107, label %then467, label %else468
then467:
  %t2108 = load i64, ptr @"scheme.base:%ht-grow!"
  %t2109 = and i64 %t2108, -8
  %t2110 = inttoptr i64 %t2109 to ptr
  %t2111 = load i64, ptr %t2110
  %t2112 = inttoptr i64 %t2111 to ptr
  %t2113 = musttail call fastcc i64 %t2112(i64 %t2108, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2113
else468:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-delete!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2118 = icmp eq i64 %argc, 2
  br i1 %t2118, label %argok470, label %arityerr469
arityerr469:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok470:
  %t2119 = load i64, ptr @"scheme.base:%ht-buckets"
  %t2120 = and i64 %t2119, -8
  %t2121 = inttoptr i64 %t2120 to ptr
  %t2122 = load i64, ptr %t2121
  %t2123 = inttoptr i64 %t2122 to ptr
  %t2124 = call fastcc i64%t2123(i64 %t2119, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2125 = call i64 @rt_vector_length(i64 %t2124)
  %t2126 = load i64, ptr @"scheme.base:%ht-index"
  %t2127 = and i64 %t2126, -8
  %t2128 = inttoptr i64 %t2127 to ptr
  %t2129 = load i64, ptr %t2128
  %t2130 = inttoptr i64 %t2129 to ptr
  %t2131 = call fastcc i64%t2130(i64 %t2126, i64 2, i64 %a1, i64 %t2125, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2132 = call i64 @rt_vector_ref(i64 %t2124, i64 %t2131)
  %t2133 = load i64, ptr @"scheme.base:%ht-assoc"
  %t2134 = and i64 %t2133, -8
  %t2135 = inttoptr i64 %t2134 to ptr
  %t2136 = load i64, ptr %t2135
  %t2137 = inttoptr i64 %t2136 to ptr
  %t2138 = call fastcc i64%t2137(i64 %t2133, i64 2, i64 %a1, i64 %t2132, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2139 = icmp ne i64 %t2138, 1
  br i1 %t2139, label %then471, label %else472
then471:
  %t2140 = load i64, ptr @"scheme.base:%ht-remove"
  %t2141 = and i64 %t2140, -8
  %t2142 = inttoptr i64 %t2141 to ptr
  %t2143 = load i64, ptr %t2142
  %t2144 = inttoptr i64 %t2143 to ptr
  %t2145 = call fastcc i64%t2144(i64 %t2140, i64 2, i64 %a1, i64 %t2132, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2146 = call i64 @rt_vector_set(i64 %t2124, i64 %t2131, i64 %t2145)
  %t2147 = load i64, ptr @"scheme.base:%ht-count"
  %t2148 = and i64 %t2147, -8
  %t2149 = inttoptr i64 %t2148 to ptr
  %t2150 = load i64, ptr %t2149
  %t2151 = inttoptr i64 %t2150 to ptr
  %t2152 = call fastcc i64%t2151(i64 %t2147, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2153 = or i64 %t2152, 8
  %t2154 = and i64 %t2153, 7
  %t2155 = icmp eq i64 %t2154, 0
  br i1 %t2155, label %fixfast473, label %fixslow474
fixfast473:
  %t2156 = sub i64 %t2152, 8
  br label %fixmerge475
fixslow474:
  %t2157 = call i64 @rt_sub(i64 %t2152, i64 8)
  br label %fixmerge475
fixmerge475:
  %t2158 = phi i64 [ %t2156, %fixfast473 ], [ %t2157, %fixslow474 ]
  %t2159 = load i64, ptr @"scheme.base:%ht-set-count!"
  %t2160 = and i64 %t2159, -8
  %t2161 = inttoptr i64 %t2160 to ptr
  %t2162 = load i64, ptr %t2161
  %t2163 = inttoptr i64 %t2162 to ptr
  %t2164 = musttail call fastcc i64 %t2163(i64 %t2159, i64 2, i64 %a0, i64 %t2158, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2164
else472:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_440"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2169 = icmp eq i64 %argc, 1
  br i1 %t2169, label %argok477, label %arityerr476
arityerr476:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok477:
  %t2170 = call i64 @rt_null_p(i64 %a0)
  %t2171 = icmp ne i64 %t2170, 1
  br i1 %t2171, label %then478, label %else479
then478:
  ret i64 1
else479:
  %t2172 = call i64 @rt_car(i64 %a0)
  %t2173 = call i64 @rt_car(i64 %t2172)
  %t2174 = and i64 %self, -8
  %t2175 = inttoptr i64 %t2174 to ptr
  %t2176 = getelementptr i64, ptr %t2175, i64 1
  %t2177 = load i64, ptr %t2176
  %t2178 = load i64, ptr @"scheme.base:%ht-index"
  %t2179 = and i64 %t2178, -8
  %t2180 = inttoptr i64 %t2179 to ptr
  %t2181 = load i64, ptr %t2180
  %t2182 = inttoptr i64 %t2181 to ptr
  %t2183 = call fastcc i64%t2182(i64 %t2178, i64 2, i64 %t2173, i64 %t2177, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2184 = and i64 %self, -8
  %t2185 = inttoptr i64 %t2184 to ptr
  %t2186 = getelementptr i64, ptr %t2185, i64 2
  %t2187 = load i64, ptr %t2186
  %t2188 = and i64 %self, -8
  %t2189 = inttoptr i64 %t2188 to ptr
  %t2190 = getelementptr i64, ptr %t2189, i64 2
  %t2191 = load i64, ptr %t2190
  %t2192 = call i64 @rt_vector_ref(i64 %t2191, i64 %t2183)
  %t2193 = call i64 @rt_cons(i64 %t2172, i64 %t2192)
  %t2194 = call i64 @rt_vector_set(i64 %t2187, i64 %t2183, i64 %t2193)
  %t2195 = call i64 @rt_cdr(i64 %a0)
  %t2196 = musttail call fastcc i64 @"scheme.base:code_440"(i64 %self, i64 1, i64 %t2195, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2196
}

define fastcc i64 @"scheme.base:code_438"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2197 = icmp eq i64 %argc, 1
  br i1 %t2197, label %argok481, label %arityerr480
arityerr480:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok481:
  %t2198 = and i64 %self, -8
  %t2199 = inttoptr i64 %t2198 to ptr
  %t2200 = getelementptr i64, ptr %t2199, i64 1
  %t2201 = load i64, ptr %t2200
  %t2202 = call i64 @rt_vector_length(i64 %t2201)
  %t2203 = or i64 %a0, %t2202
  %t2204 = and i64 %t2203, 7
  %t2205 = icmp eq i64 %t2204, 0
  br i1 %t2205, label %fixfast482, label %fixslow483
fixfast482:
  %t2206 = icmp slt i64 %a0, %t2202
  %t2207 = select i1 %t2206, i64 257, i64 1
  br label %fixmerge484
fixslow483:
  %t2208 = call i64 @rt_lt(i64 %a0, i64 %t2202)
  br label %fixmerge484
fixmerge484:
  %t2209 = phi i64 [ %t2207, %fixfast482 ], [ %t2208, %fixslow483 ]
  %t2210 = icmp ne i64 %t2209, 1
  br i1 %t2210, label %then485, label %else486
then485:
  %t2211 = call ptr @rt_alloc_words(i64 4)
  %t2212 = ptrtoint ptr %t2211 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_440" to i64), ptr %t2211
  %t2213 = or i64 %t2212, 4
  %t2214 = and i64 %self, -8
  %t2215 = inttoptr i64 %t2214 to ptr
  %t2216 = getelementptr i64, ptr %t2215, i64 2
  %t2217 = load i64, ptr %t2216
  %t2218 = getelementptr i64, ptr %t2211, i64 1
  store i64 %t2217, ptr %t2218
  %t2219 = and i64 %self, -8
  %t2220 = inttoptr i64 %t2219 to ptr
  %t2221 = getelementptr i64, ptr %t2220, i64 3
  %t2222 = load i64, ptr %t2221
  %t2223 = getelementptr i64, ptr %t2211, i64 2
  store i64 %t2222, ptr %t2223
  %t2224 = getelementptr i64, ptr %t2211, i64 3
  store i64 %t2213, ptr %t2224
  %t2225 = and i64 %self, -8
  %t2226 = inttoptr i64 %t2225 to ptr
  %t2227 = getelementptr i64, ptr %t2226, i64 1
  %t2228 = load i64, ptr %t2227
  %t2229 = call i64 @rt_vector_ref(i64 %t2228, i64 %a0)
  %t2230 = call fastcc i64 @"scheme.base:code_440"(i64 %t2213, i64 1, i64 %t2229, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2231 = or i64 %a0, 8
  %t2232 = and i64 %t2231, 7
  %t2233 = icmp eq i64 %t2232, 0
  br i1 %t2233, label %fixfast487, label %fixslow488
fixfast487:
  %t2234 = add i64 %a0, 8
  br label %fixmerge489
fixslow488:
  %t2235 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge489
fixmerge489:
  %t2236 = phi i64 [ %t2234, %fixfast487 ], [ %t2235, %fixslow488 ]
  %t2237 = musttail call fastcc i64 @"scheme.base:code_438"(i64 %self, i64 1, i64 %t2236, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2237
else486:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%ht-grow!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2238 = icmp eq i64 %argc, 1
  br i1 %t2238, label %argok491, label %arityerr490
arityerr490:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok491:
  %t2239 = load i64, ptr @"scheme.base:%ht-buckets"
  %t2240 = and i64 %t2239, -8
  %t2241 = inttoptr i64 %t2240 to ptr
  %t2242 = load i64, ptr %t2241
  %t2243 = inttoptr i64 %t2242 to ptr
  %t2244 = call fastcc i64%t2243(i64 %t2239, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2245 = call i64 @rt_vector_length(i64 %t2244)
  %t2246 = or i64 16, %t2245
  %t2247 = and i64 %t2246, 7
  %t2248 = icmp eq i64 %t2247, 0
  br i1 %t2248, label %fixfast492, label %fixslow493
fixfast492:
  %t2249 = ashr i64 16, 3
  %t2250 = mul i64 %t2249, %t2245
  br label %fixmerge494
fixslow493:
  %t2251 = call i64 @rt_mul(i64 16, i64 %t2245)
  br label %fixmerge494
fixmerge494:
  %t2252 = phi i64 [ %t2250, %fixfast492 ], [ %t2251, %fixslow493 ]
  %t2253 = call i64 @rt_make_vector(i64 %t2252, i64 2)
  %t2254 = call ptr @rt_alloc_words(i64 5)
  %t2255 = ptrtoint ptr %t2254 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_438" to i64), ptr %t2254
  %t2256 = or i64 %t2255, 4
  %t2257 = getelementptr i64, ptr %t2254, i64 1
  store i64 %t2244, ptr %t2257
  %t2258 = getelementptr i64, ptr %t2254, i64 2
  store i64 %t2252, ptr %t2258
  %t2259 = getelementptr i64, ptr %t2254, i64 3
  store i64 %t2253, ptr %t2259
  %t2260 = getelementptr i64, ptr %t2254, i64 4
  store i64 %t2256, ptr %t2260
  %t2261 = call fastcc i64 @"scheme.base:code_438"(i64 %t2256, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2262 = load i64, ptr @"scheme.base:%ht-set-buckets!"
  %t2263 = and i64 %t2262, -8
  %t2264 = inttoptr i64 %t2263 to ptr
  %t2265 = load i64, ptr %t2264
  %t2266 = inttoptr i64 %t2265 to ptr
  %t2267 = musttail call fastcc i64 %t2266(i64 %t2262, i64 2, i64 %a0, i64 %t2253, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2267
}

define fastcc i64 @"scheme.base:code:hash-table-size"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2272 = icmp eq i64 %argc, 1
  br i1 %t2272, label %argok496, label %arityerr495
arityerr495:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok496:
  %t2273 = load i64, ptr @"scheme.base:%ht-count"
  %t2274 = and i64 %t2273, -8
  %t2275 = inttoptr i64 %t2274 to ptr
  %t2276 = load i64, ptr %t2275
  %t2277 = inttoptr i64 %t2276 to ptr
  %t2278 = musttail call fastcc i64 %t2277(i64 %t2273, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2278
}

define fastcc i64 @"scheme.base:code:%ht-fold-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2283 = icmp eq i64 %argc, 2
  br i1 %t2283, label %argok498, label %arityerr497
arityerr497:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok498:
  %t2284 = call i64 @rt_null_p(i64 %a0)
  %t2285 = icmp ne i64 %t2284, 1
  br i1 %t2285, label %then499, label %else500
then499:
  ret i64 %a1
else500:
  %t2286 = call i64 @rt_car(i64 %a0)
  %t2287 = call i64 @rt_car(i64 %t2286)
  %t2288 = call i64 @rt_car(i64 %a0)
  %t2289 = call i64 @rt_cdr(i64 %t2288)
  %t2290 = call i64 @rt_cons(i64 %t2287, i64 %t2289)
  %t2291 = call i64 @rt_cdr(i64 %a0)
  %t2292 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  %t2293 = and i64 %t2292, -8
  %t2294 = inttoptr i64 %t2293 to ptr
  %t2295 = load i64, ptr %t2294
  %t2296 = inttoptr i64 %t2295 to ptr
  %t2297 = call fastcc i64%t2296(i64 %t2292, i64 2, i64 %t2291, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2298 = call i64 @rt_cons(i64 %t2290, i64 %t2297)
  ret i64 %t2298
}

define fastcc i64 @"scheme.base:code_457"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2303 = icmp eq i64 %argc, 2
  br i1 %t2303, label %argok502, label %arityerr501
arityerr501:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok502:
  %t2304 = and i64 %self, -8
  %t2305 = inttoptr i64 %t2304 to ptr
  %t2306 = getelementptr i64, ptr %t2305, i64 1
  %t2307 = load i64, ptr %t2306
  %t2308 = call i64 @rt_vector_length(i64 %t2307)
  %t2309 = or i64 %a0, %t2308
  %t2310 = and i64 %t2309, 7
  %t2311 = icmp eq i64 %t2310, 0
  br i1 %t2311, label %fixfast503, label %fixslow504
fixfast503:
  %t2312 = icmp slt i64 %a0, %t2308
  %t2313 = select i1 %t2312, i64 257, i64 1
  br label %fixmerge505
fixslow504:
  %t2314 = call i64 @rt_lt(i64 %a0, i64 %t2308)
  br label %fixmerge505
fixmerge505:
  %t2315 = phi i64 [ %t2313, %fixfast503 ], [ %t2314, %fixslow504 ]
  %t2316 = icmp ne i64 %t2315, 1
  br i1 %t2316, label %then506, label %else507
then506:
  %t2317 = or i64 %a0, 8
  %t2318 = and i64 %t2317, 7
  %t2319 = icmp eq i64 %t2318, 0
  br i1 %t2319, label %fixfast508, label %fixslow509
fixfast508:
  %t2320 = add i64 %a0, 8
  br label %fixmerge510
fixslow509:
  %t2321 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge510
fixmerge510:
  %t2322 = phi i64 [ %t2320, %fixfast508 ], [ %t2321, %fixslow509 ]
  %t2323 = and i64 %self, -8
  %t2324 = inttoptr i64 %t2323 to ptr
  %t2325 = getelementptr i64, ptr %t2324, i64 1
  %t2326 = load i64, ptr %t2325
  %t2327 = call i64 @rt_vector_ref(i64 %t2326, i64 %a0)
  %t2328 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  %t2329 = and i64 %t2328, -8
  %t2330 = inttoptr i64 %t2329 to ptr
  %t2331 = load i64, ptr %t2330
  %t2332 = inttoptr i64 %t2331 to ptr
  %t2333 = call fastcc i64%t2332(i64 %t2328, i64 2, i64 %t2327, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2334 = musttail call fastcc i64 @"scheme.base:code_457"(i64 %self, i64 2, i64 %t2322, i64 %t2333, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2334
else507:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:hash-table->alist"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2335 = icmp eq i64 %argc, 1
  br i1 %t2335, label %argok512, label %arityerr511
arityerr511:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok512:
  %t2336 = load i64, ptr @"scheme.base:%ht-buckets"
  %t2337 = and i64 %t2336, -8
  %t2338 = inttoptr i64 %t2337 to ptr
  %t2339 = load i64, ptr %t2338
  %t2340 = inttoptr i64 %t2339 to ptr
  %t2341 = call fastcc i64%t2340(i64 %t2336, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2342 = call ptr @rt_alloc_words(i64 3)
  %t2343 = ptrtoint ptr %t2342 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_457" to i64), ptr %t2342
  %t2344 = or i64 %t2343, 4
  %t2345 = getelementptr i64, ptr %t2342, i64 1
  store i64 %t2341, ptr %t2345
  %t2346 = getelementptr i64, ptr %t2342, i64 2
  store i64 %t2344, ptr %t2346
  %t2347 = musttail call fastcc i64 @"scheme.base:code_457"(i64 %t2344, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2347
}

define fastcc i64 @"scheme.base:code_462"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2352 = icmp eq i64 %argc, 1
  br i1 %t2352, label %argok514, label %arityerr513
arityerr513:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok514:
  %t2353 = call i64 @rt_car(i64 %a0)
  ret i64 %t2353
}

define fastcc i64 @"scheme.base:code:hash-table-keys"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2354 = icmp eq i64 %argc, 1
  br i1 %t2354, label %argok516, label %arityerr515
arityerr515:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok516:
  %t2355 = call ptr @rt_alloc_words(i64 1)
  %t2356 = ptrtoint ptr %t2355 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_462" to i64), ptr %t2355
  %t2357 = or i64 %t2356, 4
  %t2358 = load i64, ptr @"scheme.base:hash-table->alist"
  %t2359 = and i64 %t2358, -8
  %t2360 = inttoptr i64 %t2359 to ptr
  %t2361 = load i64, ptr %t2360
  %t2362 = inttoptr i64 %t2361 to ptr
  %t2363 = call fastcc i64%t2362(i64 %t2358, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2364 = load i64, ptr @"scheme.base:map"
  %t2365 = and i64 %t2364, -8
  %t2366 = inttoptr i64 %t2365 to ptr
  %t2367 = load i64, ptr %t2366
  %t2368 = inttoptr i64 %t2367 to ptr
  %t2369 = musttail call fastcc i64 %t2368(i64 %t2364, i64 2, i64 %t2357, i64 %t2363, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2369
}

define fastcc i64 @"scheme.base:code_467"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2374 = icmp eq i64 %argc, 1
  br i1 %t2374, label %argok518, label %arityerr517
arityerr517:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok518:
  %t2375 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t2375
}

define fastcc i64 @"scheme.base:code:hash-table-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2376 = icmp eq i64 %argc, 1
  br i1 %t2376, label %argok520, label %arityerr519
arityerr519:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok520:
  %t2377 = call ptr @rt_alloc_words(i64 1)
  %t2378 = ptrtoint ptr %t2377 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_467" to i64), ptr %t2377
  %t2379 = or i64 %t2378, 4
  %t2380 = load i64, ptr @"scheme.base:hash-table->alist"
  %t2381 = and i64 %t2380, -8
  %t2382 = inttoptr i64 %t2381 to ptr
  %t2383 = load i64, ptr %t2382
  %t2384 = inttoptr i64 %t2383 to ptr
  %t2385 = call fastcc i64%t2384(i64 %t2380, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2386 = load i64, ptr @"scheme.base:map"
  %t2387 = and i64 %t2386, -8
  %t2388 = inttoptr i64 %t2387 to ptr
  %t2389 = load i64, ptr %t2388
  %t2390 = inttoptr i64 %t2389 to ptr
  %t2391 = musttail call fastcc i64 %t2390(i64 %t2386, i64 2, i64 %t2379, i64 %t2385, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2391
}

define fastcc i64 @"scheme.base:code:rd-ws?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2396 = icmp eq i64 %argc, 1
  br i1 %t2396, label %argok522, label %arityerr521
arityerr521:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok522:
  %t2397 = call i64 @rt_char_to_integer(i64 %a0)
  %t2398 = or i64 %t2397, 256
  %t2399 = and i64 %t2398, 7
  %t2400 = icmp eq i64 %t2399, 0
  br i1 %t2400, label %fixfast523, label %fixslow524
fixfast523:
  %t2401 = icmp eq i64 %t2397, 256
  %t2402 = select i1 %t2401, i64 257, i64 1
  br label %fixmerge525
fixslow524:
  %t2403 = call i64 @rt_num_eq(i64 %t2397, i64 256)
  br label %fixmerge525
fixmerge525:
  %t2404 = phi i64 [ %t2402, %fixfast523 ], [ %t2403, %fixslow524 ]
  %t2405 = icmp ne i64 %t2404, 1
  br i1 %t2405, label %then526, label %else527
then526:
  ret i64 %t2404
else527:
  %t2406 = or i64 %t2397, 72
  %t2407 = and i64 %t2406, 7
  %t2408 = icmp eq i64 %t2407, 0
  br i1 %t2408, label %fixfast528, label %fixslow529
fixfast528:
  %t2409 = icmp eq i64 %t2397, 72
  %t2410 = select i1 %t2409, i64 257, i64 1
  br label %fixmerge530
fixslow529:
  %t2411 = call i64 @rt_num_eq(i64 %t2397, i64 72)
  br label %fixmerge530
fixmerge530:
  %t2412 = phi i64 [ %t2410, %fixfast528 ], [ %t2411, %fixslow529 ]
  %t2413 = icmp ne i64 %t2412, 1
  br i1 %t2413, label %then531, label %else532
then531:
  ret i64 %t2412
else532:
  %t2414 = or i64 %t2397, 80
  %t2415 = and i64 %t2414, 7
  %t2416 = icmp eq i64 %t2415, 0
  br i1 %t2416, label %fixfast533, label %fixslow534
fixfast533:
  %t2417 = icmp eq i64 %t2397, 80
  %t2418 = select i1 %t2417, i64 257, i64 1
  br label %fixmerge535
fixslow534:
  %t2419 = call i64 @rt_num_eq(i64 %t2397, i64 80)
  br label %fixmerge535
fixmerge535:
  %t2420 = phi i64 [ %t2418, %fixfast533 ], [ %t2419, %fixslow534 ]
  %t2421 = icmp ne i64 %t2420, 1
  br i1 %t2421, label %then536, label %else537
then536:
  ret i64 %t2420
else537:
  %t2422 = or i64 %t2397, 104
  %t2423 = and i64 %t2422, 7
  %t2424 = icmp eq i64 %t2423, 0
  br i1 %t2424, label %fixfast538, label %fixslow539
fixfast538:
  %t2425 = icmp eq i64 %t2397, 104
  %t2426 = select i1 %t2425, i64 257, i64 1
  br label %fixmerge540
fixslow539:
  %t2427 = call i64 @rt_num_eq(i64 %t2397, i64 104)
  br label %fixmerge540
fixmerge540:
  %t2428 = phi i64 [ %t2426, %fixfast538 ], [ %t2427, %fixslow539 ]
  ret i64 %t2428
}

define fastcc i64 @"scheme.base:code:rd-digit?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2433 = icmp eq i64 %argc, 1
  br i1 %t2433, label %argok542, label %arityerr541
arityerr541:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok542:
  %t2434 = call i64 @rt_char_to_integer(i64 %a0)
  %t2435 = or i64 376, %t2434
  %t2436 = and i64 %t2435, 7
  %t2437 = icmp eq i64 %t2436, 0
  br i1 %t2437, label %fixfast543, label %fixslow544
fixfast543:
  %t2438 = icmp slt i64 376, %t2434
  %t2439 = select i1 %t2438, i64 257, i64 1
  br label %fixmerge545
fixslow544:
  %t2440 = call i64 @rt_lt(i64 376, i64 %t2434)
  br label %fixmerge545
fixmerge545:
  %t2441 = phi i64 [ %t2439, %fixfast543 ], [ %t2440, %fixslow544 ]
  %t2442 = icmp ne i64 %t2441, 1
  br i1 %t2442, label %then546, label %else547
then546:
  %t2443 = or i64 %t2434, 464
  %t2444 = and i64 %t2443, 7
  %t2445 = icmp eq i64 %t2444, 0
  br i1 %t2445, label %fixfast548, label %fixslow549
fixfast548:
  %t2446 = icmp slt i64 %t2434, 464
  %t2447 = select i1 %t2446, i64 257, i64 1
  br label %fixmerge550
fixslow549:
  %t2448 = call i64 @rt_lt(i64 %t2434, i64 464)
  br label %fixmerge550
fixmerge550:
  %t2449 = phi i64 [ %t2447, %fixfast548 ], [ %t2448, %fixslow549 ]
  ret i64 %t2449
else547:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rd-delim?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2454 = icmp eq i64 %argc, 1
  br i1 %t2454, label %argok552, label %arityerr551
arityerr551:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok552:
  %t2455 = call i64 @rt_char_to_integer(i64 %a0)
  %t2456 = load i64, ptr @"scheme.base:rd-ws?"
  %t2457 = and i64 %t2456, -8
  %t2458 = inttoptr i64 %t2457 to ptr
  %t2459 = load i64, ptr %t2458
  %t2460 = inttoptr i64 %t2459 to ptr
  %t2461 = call fastcc i64%t2460(i64 %t2456, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2462 = icmp ne i64 %t2461, 1
  br i1 %t2462, label %then553, label %else554
then553:
  ret i64 %t2461
else554:
  %t2463 = or i64 %t2455, 320
  %t2464 = and i64 %t2463, 7
  %t2465 = icmp eq i64 %t2464, 0
  br i1 %t2465, label %fixfast555, label %fixslow556
fixfast555:
  %t2466 = icmp eq i64 %t2455, 320
  %t2467 = select i1 %t2466, i64 257, i64 1
  br label %fixmerge557
fixslow556:
  %t2468 = call i64 @rt_num_eq(i64 %t2455, i64 320)
  br label %fixmerge557
fixmerge557:
  %t2469 = phi i64 [ %t2467, %fixfast555 ], [ %t2468, %fixslow556 ]
  %t2470 = icmp ne i64 %t2469, 1
  br i1 %t2470, label %then558, label %else559
then558:
  ret i64 %t2469
else559:
  %t2471 = or i64 %t2455, 328
  %t2472 = and i64 %t2471, 7
  %t2473 = icmp eq i64 %t2472, 0
  br i1 %t2473, label %fixfast560, label %fixslow561
fixfast560:
  %t2474 = icmp eq i64 %t2455, 328
  %t2475 = select i1 %t2474, i64 257, i64 1
  br label %fixmerge562
fixslow561:
  %t2476 = call i64 @rt_num_eq(i64 %t2455, i64 328)
  br label %fixmerge562
fixmerge562:
  %t2477 = phi i64 [ %t2475, %fixfast560 ], [ %t2476, %fixslow561 ]
  %t2478 = icmp ne i64 %t2477, 1
  br i1 %t2478, label %then563, label %else564
then563:
  ret i64 %t2477
else564:
  %t2479 = or i64 %t2455, 728
  %t2480 = and i64 %t2479, 7
  %t2481 = icmp eq i64 %t2480, 0
  br i1 %t2481, label %fixfast565, label %fixslow566
fixfast565:
  %t2482 = icmp eq i64 %t2455, 728
  %t2483 = select i1 %t2482, i64 257, i64 1
  br label %fixmerge567
fixslow566:
  %t2484 = call i64 @rt_num_eq(i64 %t2455, i64 728)
  br label %fixmerge567
fixmerge567:
  %t2485 = phi i64 [ %t2483, %fixfast565 ], [ %t2484, %fixslow566 ]
  %t2486 = icmp ne i64 %t2485, 1
  br i1 %t2486, label %then568, label %else569
then568:
  ret i64 %t2485
else569:
  %t2487 = or i64 %t2455, 744
  %t2488 = and i64 %t2487, 7
  %t2489 = icmp eq i64 %t2488, 0
  br i1 %t2489, label %fixfast570, label %fixslow571
fixfast570:
  %t2490 = icmp eq i64 %t2455, 744
  %t2491 = select i1 %t2490, i64 257, i64 1
  br label %fixmerge572
fixslow571:
  %t2492 = call i64 @rt_num_eq(i64 %t2455, i64 744)
  br label %fixmerge572
fixmerge572:
  %t2493 = phi i64 [ %t2491, %fixfast570 ], [ %t2492, %fixslow571 ]
  %t2494 = icmp ne i64 %t2493, 1
  br i1 %t2494, label %then573, label %else574
then573:
  ret i64 %t2493
else574:
  %t2495 = or i64 %t2455, 272
  %t2496 = and i64 %t2495, 7
  %t2497 = icmp eq i64 %t2496, 0
  br i1 %t2497, label %fixfast575, label %fixslow576
fixfast575:
  %t2498 = icmp eq i64 %t2455, 272
  %t2499 = select i1 %t2498, i64 257, i64 1
  br label %fixmerge577
fixslow576:
  %t2500 = call i64 @rt_num_eq(i64 %t2455, i64 272)
  br label %fixmerge577
fixmerge577:
  %t2501 = phi i64 [ %t2499, %fixfast575 ], [ %t2500, %fixslow576 ]
  %t2502 = icmp ne i64 %t2501, 1
  br i1 %t2502, label %then578, label %else579
then578:
  ret i64 %t2501
else579:
  %t2503 = or i64 %t2455, 472
  %t2504 = and i64 %t2503, 7
  %t2505 = icmp eq i64 %t2504, 0
  br i1 %t2505, label %fixfast580, label %fixslow581
fixfast580:
  %t2506 = icmp eq i64 %t2455, 472
  %t2507 = select i1 %t2506, i64 257, i64 1
  br label %fixmerge582
fixslow581:
  %t2508 = call i64 @rt_num_eq(i64 %t2455, i64 472)
  br label %fixmerge582
fixmerge582:
  %t2509 = phi i64 [ %t2507, %fixfast580 ], [ %t2508, %fixslow581 ]
  ret i64 %t2509
}

define fastcc i64 @"scheme.base:code:rd-skip-line"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2514 = icmp eq i64 %argc, 3
  br i1 %t2514, label %argok584, label %arityerr583
arityerr583:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok584:
  %t2515 = or i64 %a2, %a1
  %t2516 = and i64 %t2515, 7
  %t2517 = icmp eq i64 %t2516, 0
  br i1 %t2517, label %fixfast585, label %fixslow586
fixfast585:
  %t2518 = icmp slt i64 %a2, %a1
  %t2519 = select i1 %t2518, i64 257, i64 1
  br label %fixmerge587
fixslow586:
  %t2520 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge587
fixmerge587:
  %t2521 = phi i64 [ %t2519, %fixfast585 ], [ %t2520, %fixslow586 ]
  %t2522 = icmp ne i64 %t2521, 1
  br i1 %t2522, label %then588, label %else589
then588:
  %t2523 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2524 = call i64 @rt_char_to_integer(i64 %t2523)
  %t2525 = or i64 %t2524, 80
  %t2526 = and i64 %t2525, 7
  %t2527 = icmp eq i64 %t2526, 0
  br i1 %t2527, label %fixfast590, label %fixslow591
fixfast590:
  %t2528 = icmp eq i64 %t2524, 80
  %t2529 = select i1 %t2528, i64 257, i64 1
  br label %fixmerge592
fixslow591:
  %t2530 = call i64 @rt_num_eq(i64 %t2524, i64 80)
  br label %fixmerge592
fixmerge592:
  %t2531 = phi i64 [ %t2529, %fixfast590 ], [ %t2530, %fixslow591 ]
  %t2532 = icmp ne i64 %t2531, 1
  br i1 %t2532, label %then593, label %else594
then593:
  %t2533 = or i64 %a2, 8
  %t2534 = and i64 %t2533, 7
  %t2535 = icmp eq i64 %t2534, 0
  br i1 %t2535, label %fixfast595, label %fixslow596
fixfast595:
  %t2536 = add i64 %a2, 8
  br label %fixmerge597
fixslow596:
  %t2537 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge597
fixmerge597:
  %t2538 = phi i64 [ %t2536, %fixfast595 ], [ %t2537, %fixslow596 ]
  ret i64 %t2538
else594:
  %t2539 = or i64 %a2, 8
  %t2540 = and i64 %t2539, 7
  %t2541 = icmp eq i64 %t2540, 0
  br i1 %t2541, label %fixfast598, label %fixslow599
fixfast598:
  %t2542 = add i64 %a2, 8
  br label %fixmerge600
fixslow599:
  %t2543 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge600
fixmerge600:
  %t2544 = phi i64 [ %t2542, %fixfast598 ], [ %t2543, %fixslow599 ]
  %t2545 = load i64, ptr @"scheme.base:rd-skip-line"
  %t2546 = and i64 %t2545, -8
  %t2547 = inttoptr i64 %t2546 to ptr
  %t2548 = load i64, ptr %t2547
  %t2549 = inttoptr i64 %t2548 to ptr
  %t2550 = musttail call fastcc i64 %t2549(i64 %t2545, i64 3, i64 %a0, i64 %a1, i64 %t2544, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2550
else589:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:rd-skip-ws"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2555 = icmp eq i64 %argc, 3
  br i1 %t2555, label %argok602, label %arityerr601
arityerr601:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok602:
  %t2556 = or i64 %a2, %a1
  %t2557 = and i64 %t2556, 7
  %t2558 = icmp eq i64 %t2557, 0
  br i1 %t2558, label %fixfast603, label %fixslow604
fixfast603:
  %t2559 = icmp slt i64 %a2, %a1
  %t2560 = select i1 %t2559, i64 257, i64 1
  br label %fixmerge605
fixslow604:
  %t2561 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge605
fixmerge605:
  %t2562 = phi i64 [ %t2560, %fixfast603 ], [ %t2561, %fixslow604 ]
  %t2563 = icmp ne i64 %t2562, 1
  br i1 %t2563, label %then606, label %else607
then606:
  %t2564 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2565 = load i64, ptr @"scheme.base:rd-ws?"
  %t2566 = and i64 %t2565, -8
  %t2567 = inttoptr i64 %t2566 to ptr
  %t2568 = load i64, ptr %t2567
  %t2569 = inttoptr i64 %t2568 to ptr
  %t2570 = call fastcc i64%t2569(i64 %t2565, i64 1, i64 %t2564, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2571 = icmp ne i64 %t2570, 1
  br i1 %t2571, label %then608, label %else609
then608:
  %t2572 = or i64 %a2, 8
  %t2573 = and i64 %t2572, 7
  %t2574 = icmp eq i64 %t2573, 0
  br i1 %t2574, label %fixfast610, label %fixslow611
fixfast610:
  %t2575 = add i64 %a2, 8
  br label %fixmerge612
fixslow611:
  %t2576 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge612
fixmerge612:
  %t2577 = phi i64 [ %t2575, %fixfast610 ], [ %t2576, %fixslow611 ]
  %t2578 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t2579 = and i64 %t2578, -8
  %t2580 = inttoptr i64 %t2579 to ptr
  %t2581 = load i64, ptr %t2580
  %t2582 = inttoptr i64 %t2581 to ptr
  %t2583 = musttail call fastcc i64 %t2582(i64 %t2578, i64 3, i64 %a0, i64 %a1, i64 %t2577, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2583
else609:
  %t2584 = call i64 @rt_char_to_integer(i64 %t2564)
  %t2585 = or i64 %t2584, 472
  %t2586 = and i64 %t2585, 7
  %t2587 = icmp eq i64 %t2586, 0
  br i1 %t2587, label %fixfast613, label %fixslow614
fixfast613:
  %t2588 = icmp eq i64 %t2584, 472
  %t2589 = select i1 %t2588, i64 257, i64 1
  br label %fixmerge615
fixslow614:
  %t2590 = call i64 @rt_num_eq(i64 %t2584, i64 472)
  br label %fixmerge615
fixmerge615:
  %t2591 = phi i64 [ %t2589, %fixfast613 ], [ %t2590, %fixslow614 ]
  %t2592 = icmp ne i64 %t2591, 1
  br i1 %t2592, label %then616, label %else617
then616:
  %t2593 = or i64 %a2, 8
  %t2594 = and i64 %t2593, 7
  %t2595 = icmp eq i64 %t2594, 0
  br i1 %t2595, label %fixfast618, label %fixslow619
fixfast618:
  %t2596 = add i64 %a2, 8
  br label %fixmerge620
fixslow619:
  %t2597 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge620
fixmerge620:
  %t2598 = phi i64 [ %t2596, %fixfast618 ], [ %t2597, %fixslow619 ]
  %t2599 = load i64, ptr @"scheme.base:rd-skip-line"
  %t2600 = and i64 %t2599, -8
  %t2601 = inttoptr i64 %t2600 to ptr
  %t2602 = load i64, ptr %t2601
  %t2603 = inttoptr i64 %t2602 to ptr
  %t2604 = call fastcc i64%t2603(i64 %t2599, i64 3, i64 %a0, i64 %a1, i64 %t2598, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2605 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t2606 = and i64 %t2605, -8
  %t2607 = inttoptr i64 %t2606 to ptr
  %t2608 = load i64, ptr %t2607
  %t2609 = inttoptr i64 %t2608 to ptr
  %t2610 = musttail call fastcc i64 %t2609(i64 %t2605, i64 3, i64 %a0, i64 %a1, i64 %t2604, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2610
else617:
  ret i64 %a2
else607:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:rd-token-end"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2615 = icmp eq i64 %argc, 3
  br i1 %t2615, label %argok622, label %arityerr621
arityerr621:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok622:
  %t2616 = or i64 %a2, %a1
  %t2617 = and i64 %t2616, 7
  %t2618 = icmp eq i64 %t2617, 0
  br i1 %t2618, label %fixfast623, label %fixslow624
fixfast623:
  %t2619 = icmp slt i64 %a2, %a1
  %t2620 = select i1 %t2619, i64 257, i64 1
  br label %fixmerge625
fixslow624:
  %t2621 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge625
fixmerge625:
  %t2622 = phi i64 [ %t2620, %fixfast623 ], [ %t2621, %fixslow624 ]
  %t2623 = icmp ne i64 %t2622, 1
  br i1 %t2623, label %then626, label %else627
then626:
  %t2624 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2625 = load i64, ptr @"scheme.base:rd-delim?"
  %t2626 = and i64 %t2625, -8
  %t2627 = inttoptr i64 %t2626 to ptr
  %t2628 = load i64, ptr %t2627
  %t2629 = inttoptr i64 %t2628 to ptr
  %t2630 = call fastcc i64%t2629(i64 %t2625, i64 1, i64 %t2624, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2631 = icmp ne i64 %t2630, 1
  br i1 %t2631, label %then628, label %else629
then628:
  ret i64 %a2
else629:
  %t2632 = or i64 %a2, 8
  %t2633 = and i64 %t2632, 7
  %t2634 = icmp eq i64 %t2633, 0
  br i1 %t2634, label %fixfast630, label %fixslow631
fixfast630:
  %t2635 = add i64 %a2, 8
  br label %fixmerge632
fixslow631:
  %t2636 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge632
fixmerge632:
  %t2637 = phi i64 [ %t2635, %fixfast630 ], [ %t2636, %fixslow631 ]
  %t2638 = load i64, ptr @"scheme.base:rd-token-end"
  %t2639 = and i64 %t2638, -8
  %t2640 = inttoptr i64 %t2639 to ptr
  %t2641 = load i64, ptr %t2640
  %t2642 = inttoptr i64 %t2641 to ptr
  %t2643 = musttail call fastcc i64 %t2642(i64 %t2638, i64 3, i64 %a0, i64 %a1, i64 %t2637, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2643
else627:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:rd-all-digits?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2648 = icmp eq i64 %argc, 3
  br i1 %t2648, label %argok634, label %arityerr633
arityerr633:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok634:
  %t2649 = or i64 %a1, %a2
  %t2650 = and i64 %t2649, 7
  %t2651 = icmp eq i64 %t2650, 0
  br i1 %t2651, label %fixfast635, label %fixslow636
fixfast635:
  %t2652 = icmp slt i64 %a1, %a2
  %t2653 = select i1 %t2652, i64 257, i64 1
  br label %fixmerge637
fixslow636:
  %t2654 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge637
fixmerge637:
  %t2655 = phi i64 [ %t2653, %fixfast635 ], [ %t2654, %fixslow636 ]
  %t2656 = icmp ne i64 %t2655, 1
  br i1 %t2656, label %then638, label %else639
then638:
  %t2657 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t2658 = load i64, ptr @"scheme.base:rd-digit?"
  %t2659 = and i64 %t2658, -8
  %t2660 = inttoptr i64 %t2659 to ptr
  %t2661 = load i64, ptr %t2660
  %t2662 = inttoptr i64 %t2661 to ptr
  %t2663 = call fastcc i64%t2662(i64 %t2658, i64 1, i64 %t2657, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2664 = icmp ne i64 %t2663, 1
  br i1 %t2664, label %then640, label %else641
then640:
  %t2665 = or i64 %a1, 8
  %t2666 = and i64 %t2665, 7
  %t2667 = icmp eq i64 %t2666, 0
  br i1 %t2667, label %fixfast642, label %fixslow643
fixfast642:
  %t2668 = add i64 %a1, 8
  br label %fixmerge644
fixslow643:
  %t2669 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge644
fixmerge644:
  %t2670 = phi i64 [ %t2668, %fixfast642 ], [ %t2669, %fixslow643 ]
  %t2671 = load i64, ptr @"scheme.base:rd-all-digits?"
  %t2672 = and i64 %t2671, -8
  %t2673 = inttoptr i64 %t2672 to ptr
  %t2674 = load i64, ptr %t2673
  %t2675 = inttoptr i64 %t2674 to ptr
  %t2676 = musttail call fastcc i64 %t2675(i64 %t2671, i64 3, i64 %a0, i64 %t2670, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2676
else641:
  ret i64 1
else639:
  ret i64 257
}

define fastcc i64 @"scheme.base:code:rd-numeric?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2681 = icmp eq i64 %argc, 1
  br i1 %t2681, label %argok646, label %arityerr645
arityerr645:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok646:
  %t2682 = call i64 @rt_string_length(i64 %a0)
  %t2683 = or i64 0, %t2682
  %t2684 = and i64 %t2683, 7
  %t2685 = icmp eq i64 %t2684, 0
  br i1 %t2685, label %fixfast647, label %fixslow648
fixfast647:
  %t2686 = icmp slt i64 0, %t2682
  %t2687 = select i1 %t2686, i64 257, i64 1
  br label %fixmerge649
fixslow648:
  %t2688 = call i64 @rt_lt(i64 0, i64 %t2682)
  br label %fixmerge649
fixmerge649:
  %t2689 = phi i64 [ %t2687, %fixfast647 ], [ %t2688, %fixslow648 ]
  %t2690 = icmp ne i64 %t2689, 1
  br i1 %t2690, label %then650, label %else651
then650:
  %t2691 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t2692 = call i64 @rt_char_to_integer(i64 %t2691)
  %t2693 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t2694 = load i64, ptr @"scheme.base:rd-digit?"
  %t2695 = and i64 %t2694, -8
  %t2696 = inttoptr i64 %t2695 to ptr
  %t2697 = load i64, ptr %t2696
  %t2698 = inttoptr i64 %t2697 to ptr
  %t2699 = call fastcc i64%t2698(i64 %t2694, i64 1, i64 %t2693, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2700 = icmp ne i64 %t2699, 1
  br i1 %t2700, label %then652, label %else653
then652:
  %t2701 = load i64, ptr @"scheme.base:rd-all-digits?"
  %t2702 = and i64 %t2701, -8
  %t2703 = inttoptr i64 %t2702 to ptr
  %t2704 = load i64, ptr %t2703
  %t2705 = inttoptr i64 %t2704 to ptr
  %t2706 = musttail call fastcc i64 %t2705(i64 %t2701, i64 3, i64 %a0, i64 0, i64 %t2682, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2706
else653:
  %t2707 = or i64 %t2692, 360
  %t2708 = and i64 %t2707, 7
  %t2709 = icmp eq i64 %t2708, 0
  br i1 %t2709, label %fixfast654, label %fixslow655
fixfast654:
  %t2710 = icmp eq i64 %t2692, 360
  %t2711 = select i1 %t2710, i64 257, i64 1
  br label %fixmerge656
fixslow655:
  %t2712 = call i64 @rt_num_eq(i64 %t2692, i64 360)
  br label %fixmerge656
fixmerge656:
  %t2713 = phi i64 [ %t2711, %fixfast654 ], [ %t2712, %fixslow655 ]
  %t2714 = icmp ne i64 %t2713, 1
  br i1 %t2714, label %then657, label %else658
then657:
  br label %merge659
else658:
  %t2715 = or i64 %t2692, 344
  %t2716 = and i64 %t2715, 7
  %t2717 = icmp eq i64 %t2716, 0
  br i1 %t2717, label %fixfast660, label %fixslow661
fixfast660:
  %t2718 = icmp eq i64 %t2692, 344
  %t2719 = select i1 %t2718, i64 257, i64 1
  br label %fixmerge662
fixslow661:
  %t2720 = call i64 @rt_num_eq(i64 %t2692, i64 344)
  br label %fixmerge662
fixmerge662:
  %t2721 = phi i64 [ %t2719, %fixfast660 ], [ %t2720, %fixslow661 ]
  br label %merge659
merge659:
  %t2722 = phi i64 [ %t2713, %then657 ], [ %t2721, %fixmerge662 ]
  %t2723 = icmp ne i64 %t2722, 1
  br i1 %t2723, label %then663, label %else664
then663:
  %t2724 = or i64 8, %t2682
  %t2725 = and i64 %t2724, 7
  %t2726 = icmp eq i64 %t2725, 0
  br i1 %t2726, label %fixfast665, label %fixslow666
fixfast665:
  %t2727 = icmp slt i64 8, %t2682
  %t2728 = select i1 %t2727, i64 257, i64 1
  br label %fixmerge667
fixslow666:
  %t2729 = call i64 @rt_lt(i64 8, i64 %t2682)
  br label %fixmerge667
fixmerge667:
  %t2730 = phi i64 [ %t2728, %fixfast665 ], [ %t2729, %fixslow666 ]
  %t2731 = icmp ne i64 %t2730, 1
  br i1 %t2731, label %then668, label %else669
then668:
  %t2732 = load i64, ptr @"scheme.base:rd-all-digits?"
  %t2733 = and i64 %t2732, -8
  %t2734 = inttoptr i64 %t2733 to ptr
  %t2735 = load i64, ptr %t2734
  %t2736 = inttoptr i64 %t2735 to ptr
  %t2737 = musttail call fastcc i64 %t2736(i64 %t2732, i64 3, i64 %a0, i64 8, i64 %t2682, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2737
else669:
  ret i64 1
else664:
  ret i64 1
else651:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rd-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2742 = icmp eq i64 %argc, 4
  br i1 %t2742, label %argok671, label %arityerr670
arityerr670:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok671:
  %t2743 = or i64 %a1, %a2
  %t2744 = and i64 %t2743, 7
  %t2745 = icmp eq i64 %t2744, 0
  br i1 %t2745, label %fixfast672, label %fixslow673
fixfast672:
  %t2746 = icmp slt i64 %a1, %a2
  %t2747 = select i1 %t2746, i64 257, i64 1
  br label %fixmerge674
fixslow673:
  %t2748 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge674
fixmerge674:
  %t2749 = phi i64 [ %t2747, %fixfast672 ], [ %t2748, %fixslow673 ]
  %t2750 = icmp ne i64 %t2749, 1
  br i1 %t2750, label %then675, label %else676
then675:
  %t2751 = or i64 %a1, 8
  %t2752 = and i64 %t2751, 7
  %t2753 = icmp eq i64 %t2752, 0
  br i1 %t2753, label %fixfast677, label %fixslow678
fixfast677:
  %t2754 = add i64 %a1, 8
  br label %fixmerge679
fixslow678:
  %t2755 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge679
fixmerge679:
  %t2756 = phi i64 [ %t2754, %fixfast677 ], [ %t2755, %fixslow678 ]
  %t2757 = or i64 %a3, 80
  %t2758 = and i64 %t2757, 7
  %t2759 = icmp eq i64 %t2758, 0
  br i1 %t2759, label %fixfast680, label %fixslow681
fixfast680:
  %t2760 = ashr i64 %a3, 3
  %t2761 = mul i64 %t2760, 80
  br label %fixmerge682
fixslow681:
  %t2762 = call i64 @rt_mul(i64 %a3, i64 80)
  br label %fixmerge682
fixmerge682:
  %t2763 = phi i64 [ %t2761, %fixfast680 ], [ %t2762, %fixslow681 ]
  %t2764 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t2765 = call i64 @rt_char_to_integer(i64 %t2764)
  %t2766 = or i64 %t2765, 384
  %t2767 = and i64 %t2766, 7
  %t2768 = icmp eq i64 %t2767, 0
  br i1 %t2768, label %fixfast683, label %fixslow684
fixfast683:
  %t2769 = sub i64 %t2765, 384
  br label %fixmerge685
fixslow684:
  %t2770 = call i64 @rt_sub(i64 %t2765, i64 384)
  br label %fixmerge685
fixmerge685:
  %t2771 = phi i64 [ %t2769, %fixfast683 ], [ %t2770, %fixslow684 ]
  %t2772 = or i64 %t2763, %t2771
  %t2773 = and i64 %t2772, 7
  %t2774 = icmp eq i64 %t2773, 0
  br i1 %t2774, label %fixfast686, label %fixslow687
fixfast686:
  %t2775 = add i64 %t2763, %t2771
  br label %fixmerge688
fixslow687:
  %t2776 = call i64 @rt_add(i64 %t2763, i64 %t2771)
  br label %fixmerge688
fixmerge688:
  %t2777 = phi i64 [ %t2775, %fixfast686 ], [ %t2776, %fixslow687 ]
  %t2778 = load i64, ptr @"scheme.base:rd-digits"
  %t2779 = and i64 %t2778, -8
  %t2780 = inttoptr i64 %t2779 to ptr
  %t2781 = load i64, ptr %t2780
  %t2782 = inttoptr i64 %t2781 to ptr
  %t2783 = musttail call fastcc i64 %t2782(i64 %t2778, i64 4, i64 %a0, i64 %t2756, i64 %a2, i64 %t2777, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2783
else676:
  ret i64 %a3
}

define fastcc i64 @"scheme.base:code:rd-parse-int"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2788 = icmp eq i64 %argc, 1
  br i1 %t2788, label %argok690, label %arityerr689
arityerr689:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok690:
  %t2789 = call i64 @rt_string_length(i64 %a0)
  %t2790 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t2791 = call i64 @rt_char_to_integer(i64 %t2790)
  %t2792 = or i64 %t2791, 360
  %t2793 = and i64 %t2792, 7
  %t2794 = icmp eq i64 %t2793, 0
  br i1 %t2794, label %fixfast691, label %fixslow692
fixfast691:
  %t2795 = icmp eq i64 %t2791, 360
  %t2796 = select i1 %t2795, i64 257, i64 1
  br label %fixmerge693
fixslow692:
  %t2797 = call i64 @rt_num_eq(i64 %t2791, i64 360)
  br label %fixmerge693
fixmerge693:
  %t2798 = phi i64 [ %t2796, %fixfast691 ], [ %t2797, %fixslow692 ]
  %t2799 = icmp ne i64 %t2798, 1
  br i1 %t2799, label %then694, label %else695
then694:
  %t2800 = load i64, ptr @"scheme.base:rd-digits"
  %t2801 = and i64 %t2800, -8
  %t2802 = inttoptr i64 %t2801 to ptr
  %t2803 = load i64, ptr %t2802
  %t2804 = inttoptr i64 %t2803 to ptr
  %t2805 = call fastcc i64%t2804(i64 %t2800, i64 4, i64 %a0, i64 8, i64 %t2789, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2806 = or i64 0, %t2805
  %t2807 = and i64 %t2806, 7
  %t2808 = icmp eq i64 %t2807, 0
  br i1 %t2808, label %fixfast696, label %fixslow697
fixfast696:
  %t2809 = sub i64 0, %t2805
  br label %fixmerge698
fixslow697:
  %t2810 = call i64 @rt_sub(i64 0, i64 %t2805)
  br label %fixmerge698
fixmerge698:
  %t2811 = phi i64 [ %t2809, %fixfast696 ], [ %t2810, %fixslow697 ]
  ret i64 %t2811
else695:
  %t2812 = or i64 %t2791, 344
  %t2813 = and i64 %t2812, 7
  %t2814 = icmp eq i64 %t2813, 0
  br i1 %t2814, label %fixfast699, label %fixslow700
fixfast699:
  %t2815 = icmp eq i64 %t2791, 344
  %t2816 = select i1 %t2815, i64 257, i64 1
  br label %fixmerge701
fixslow700:
  %t2817 = call i64 @rt_num_eq(i64 %t2791, i64 344)
  br label %fixmerge701
fixmerge701:
  %t2818 = phi i64 [ %t2816, %fixfast699 ], [ %t2817, %fixslow700 ]
  %t2819 = icmp ne i64 %t2818, 1
  br i1 %t2819, label %then702, label %else703
then702:
  %t2820 = load i64, ptr @"scheme.base:rd-digits"
  %t2821 = and i64 %t2820, -8
  %t2822 = inttoptr i64 %t2821 to ptr
  %t2823 = load i64, ptr %t2822
  %t2824 = inttoptr i64 %t2823 to ptr
  %t2825 = musttail call fastcc i64 %t2824(i64 %t2820, i64 4, i64 %a0, i64 8, i64 %t2789, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2825
else703:
  %t2826 = load i64, ptr @"scheme.base:rd-digits"
  %t2827 = and i64 %t2826, -8
  %t2828 = inttoptr i64 %t2827 to ptr
  %t2829 = load i64, ptr %t2828
  %t2830 = inttoptr i64 %t2829 to ptr
  %t2831 = musttail call fastcc i64 %t2830(i64 %t2826, i64 4, i64 %a0, i64 0, i64 %t2789, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2831
}

define fastcc i64 @"scheme.base:code:rd-dotchar?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2836 = icmp eq i64 %argc, 1
  br i1 %t2836, label %argok705, label %arityerr704
arityerr704:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok705:
  %t2837 = call i64 @rt_char_to_integer(i64 %a0)
  %t2838 = or i64 %t2837, 368
  %t2839 = and i64 %t2838, 7
  %t2840 = icmp eq i64 %t2839, 0
  br i1 %t2840, label %fixfast706, label %fixslow707
fixfast706:
  %t2841 = icmp eq i64 %t2837, 368
  %t2842 = select i1 %t2841, i64 257, i64 1
  br label %fixmerge708
fixslow707:
  %t2843 = call i64 @rt_num_eq(i64 %t2837, i64 368)
  br label %fixmerge708
fixmerge708:
  %t2844 = phi i64 [ %t2842, %fixfast706 ], [ %t2843, %fixslow707 ]
  ret i64 %t2844
}

define fastcc i64 @"scheme.base:code:rd-exp-char?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2849 = icmp eq i64 %argc, 1
  br i1 %t2849, label %argok710, label %arityerr709
arityerr709:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok710:
  %t2850 = call i64 @rt_char_to_integer(i64 %a0)
  %t2851 = or i64 %t2850, 808
  %t2852 = and i64 %t2851, 7
  %t2853 = icmp eq i64 %t2852, 0
  br i1 %t2853, label %fixfast711, label %fixslow712
fixfast711:
  %t2854 = icmp eq i64 %t2850, 808
  %t2855 = select i1 %t2854, i64 257, i64 1
  br label %fixmerge713
fixslow712:
  %t2856 = call i64 @rt_num_eq(i64 %t2850, i64 808)
  br label %fixmerge713
fixmerge713:
  %t2857 = phi i64 [ %t2855, %fixfast711 ], [ %t2856, %fixslow712 ]
  %t2858 = icmp ne i64 %t2857, 1
  br i1 %t2858, label %then714, label %else715
then714:
  ret i64 %t2857
else715:
  %t2859 = or i64 %t2850, 552
  %t2860 = and i64 %t2859, 7
  %t2861 = icmp eq i64 %t2860, 0
  br i1 %t2861, label %fixfast716, label %fixslow717
fixfast716:
  %t2862 = icmp eq i64 %t2850, 552
  %t2863 = select i1 %t2862, i64 257, i64 1
  br label %fixmerge718
fixslow717:
  %t2864 = call i64 @rt_num_eq(i64 %t2850, i64 552)
  br label %fixmerge718
fixmerge718:
  %t2865 = phi i64 [ %t2863, %fixfast716 ], [ %t2864, %fixslow717 ]
  ret i64 %t2865
}

define fastcc i64 @"scheme.base:code:rd-sign-char?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2870 = icmp eq i64 %argc, 1
  br i1 %t2870, label %argok720, label %arityerr719
arityerr719:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok720:
  %t2871 = call i64 @rt_char_to_integer(i64 %a0)
  %t2872 = or i64 %t2871, 344
  %t2873 = and i64 %t2872, 7
  %t2874 = icmp eq i64 %t2873, 0
  br i1 %t2874, label %fixfast721, label %fixslow722
fixfast721:
  %t2875 = icmp eq i64 %t2871, 344
  %t2876 = select i1 %t2875, i64 257, i64 1
  br label %fixmerge723
fixslow722:
  %t2877 = call i64 @rt_num_eq(i64 %t2871, i64 344)
  br label %fixmerge723
fixmerge723:
  %t2878 = phi i64 [ %t2876, %fixfast721 ], [ %t2877, %fixslow722 ]
  %t2879 = icmp ne i64 %t2878, 1
  br i1 %t2879, label %then724, label %else725
then724:
  ret i64 %t2878
else725:
  %t2880 = or i64 %t2871, 360
  %t2881 = and i64 %t2880, 7
  %t2882 = icmp eq i64 %t2881, 0
  br i1 %t2882, label %fixfast726, label %fixslow727
fixfast726:
  %t2883 = icmp eq i64 %t2871, 360
  %t2884 = select i1 %t2883, i64 257, i64 1
  br label %fixmerge728
fixslow727:
  %t2885 = call i64 @rt_num_eq(i64 %t2871, i64 360)
  br label %fixmerge728
fixmerge728:
  %t2886 = phi i64 [ %t2884, %fixfast726 ], [ %t2885, %fixslow727 ]
  ret i64 %t2886
}

define fastcc i64 @"scheme.base:code:rd-scan-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2891 = icmp eq i64 %argc, 3
  br i1 %t2891, label %argok730, label %arityerr729
arityerr729:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok730:
  %t2892 = or i64 %a1, %a2
  %t2893 = and i64 %t2892, 7
  %t2894 = icmp eq i64 %t2893, 0
  br i1 %t2894, label %fixfast731, label %fixslow732
fixfast731:
  %t2895 = icmp slt i64 %a1, %a2
  %t2896 = select i1 %t2895, i64 257, i64 1
  br label %fixmerge733
fixslow732:
  %t2897 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge733
fixmerge733:
  %t2898 = phi i64 [ %t2896, %fixfast731 ], [ %t2897, %fixslow732 ]
  %t2899 = icmp ne i64 %t2898, 1
  br i1 %t2899, label %then734, label %else735
then734:
  %t2900 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t2901 = load i64, ptr @"scheme.base:rd-digit?"
  %t2902 = and i64 %t2901, -8
  %t2903 = inttoptr i64 %t2902 to ptr
  %t2904 = load i64, ptr %t2903
  %t2905 = inttoptr i64 %t2904 to ptr
  %t2906 = call fastcc i64%t2905(i64 %t2901, i64 1, i64 %t2900, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge736
else735:
  br label %merge736
merge736:
  %t2907 = phi i64 [ %t2906, %then734 ], [ 1, %else735 ]
  %t2908 = icmp ne i64 %t2907, 1
  br i1 %t2908, label %then737, label %else738
then737:
  %t2909 = or i64 %a1, 8
  %t2910 = and i64 %t2909, 7
  %t2911 = icmp eq i64 %t2910, 0
  br i1 %t2911, label %fixfast739, label %fixslow740
fixfast739:
  %t2912 = add i64 %a1, 8
  br label %fixmerge741
fixslow740:
  %t2913 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge741
fixmerge741:
  %t2914 = phi i64 [ %t2912, %fixfast739 ], [ %t2913, %fixslow740 ]
  %t2915 = load i64, ptr @"scheme.base:rd-scan-digits"
  %t2916 = and i64 %t2915, -8
  %t2917 = inttoptr i64 %t2916 to ptr
  %t2918 = load i64, ptr %t2917
  %t2919 = inttoptr i64 %t2918 to ptr
  %t2920 = musttail call fastcc i64 %t2919(i64 %t2915, i64 3, i64 %a0, i64 %t2914, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2920
else738:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:rd-flonum?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2925 = icmp eq i64 %argc, 1
  br i1 %t2925, label %argok743, label %arityerr742
arityerr742:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok743:
  %t2926 = call i64 @rt_string_length(i64 %a0)
  %t2927 = or i64 0, %t2926
  %t2928 = and i64 %t2927, 7
  %t2929 = icmp eq i64 %t2928, 0
  br i1 %t2929, label %fixfast744, label %fixslow745
fixfast744:
  %t2930 = icmp slt i64 0, %t2926
  %t2931 = select i1 %t2930, i64 257, i64 1
  br label %fixmerge746
fixslow745:
  %t2932 = call i64 @rt_lt(i64 0, i64 %t2926)
  br label %fixmerge746
fixmerge746:
  %t2933 = phi i64 [ %t2931, %fixfast744 ], [ %t2932, %fixslow745 ]
  %t2934 = icmp ne i64 %t2933, 1
  br i1 %t2934, label %then747, label %else748
then747:
  %t2935 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t2936 = load i64, ptr @"scheme.base:rd-sign-char?"
  %t2937 = and i64 %t2936, -8
  %t2938 = inttoptr i64 %t2937 to ptr
  %t2939 = load i64, ptr %t2938
  %t2940 = inttoptr i64 %t2939 to ptr
  %t2941 = call fastcc i64%t2940(i64 %t2936, i64 1, i64 %t2935, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2942 = icmp ne i64 %t2941, 1
  br i1 %t2942, label %then749, label %else750
then749:
  br label %merge751
else750:
  br label %merge751
merge751:
  %t2943 = phi i64 [ 8, %then749 ], [ 0, %else750 ]
  %t2944 = load i64, ptr @"scheme.base:rd-scan-digits"
  %t2945 = and i64 %t2944, -8
  %t2946 = inttoptr i64 %t2945 to ptr
  %t2947 = load i64, ptr %t2946
  %t2948 = inttoptr i64 %t2947 to ptr
  %t2949 = call fastcc i64%t2948(i64 %t2944, i64 3, i64 %a0, i64 %t2943, i64 %t2926, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2950 = or i64 %t2949, %t2926
  %t2951 = and i64 %t2950, 7
  %t2952 = icmp eq i64 %t2951, 0
  br i1 %t2952, label %fixfast752, label %fixslow753
fixfast752:
  %t2953 = icmp slt i64 %t2949, %t2926
  %t2954 = select i1 %t2953, i64 257, i64 1
  br label %fixmerge754
fixslow753:
  %t2955 = call i64 @rt_lt(i64 %t2949, i64 %t2926)
  br label %fixmerge754
fixmerge754:
  %t2956 = phi i64 [ %t2954, %fixfast752 ], [ %t2955, %fixslow753 ]
  %t2957 = icmp ne i64 %t2956, 1
  br i1 %t2957, label %then755, label %else756
then755:
  %t2958 = call i64 @rt_string_ref(i64 %a0, i64 %t2949)
  %t2959 = load i64, ptr @"scheme.base:rd-dotchar?"
  %t2960 = and i64 %t2959, -8
  %t2961 = inttoptr i64 %t2960 to ptr
  %t2962 = load i64, ptr %t2961
  %t2963 = inttoptr i64 %t2962 to ptr
  %t2964 = call fastcc i64%t2963(i64 %t2959, i64 1, i64 %t2958, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge757
else756:
  br label %merge757
merge757:
  %t2965 = phi i64 [ %t2964, %then755 ], [ 1, %else756 ]
  %t2966 = icmp ne i64 %t2965, 1
  br i1 %t2966, label %then758, label %else759
then758:
  %t2967 = or i64 %t2949, 8
  %t2968 = and i64 %t2967, 7
  %t2969 = icmp eq i64 %t2968, 0
  br i1 %t2969, label %fixfast761, label %fixslow762
fixfast761:
  %t2970 = add i64 %t2949, 8
  br label %fixmerge763
fixslow762:
  %t2971 = call i64 @rt_add(i64 %t2949, i64 8)
  br label %fixmerge763
fixmerge763:
  %t2972 = phi i64 [ %t2970, %fixfast761 ], [ %t2971, %fixslow762 ]
  br label %merge760
else759:
  br label %merge760
merge760:
  %t2973 = phi i64 [ %t2972, %fixmerge763 ], [ %t2949, %else759 ]
  %t2974 = or i64 %t2949, %t2973
  %t2975 = and i64 %t2974, 7
  %t2976 = icmp eq i64 %t2975, 0
  br i1 %t2976, label %fixfast764, label %fixslow765
fixfast764:
  %t2977 = icmp slt i64 %t2949, %t2973
  %t2978 = select i1 %t2977, i64 257, i64 1
  br label %fixmerge766
fixslow765:
  %t2979 = call i64 @rt_lt(i64 %t2949, i64 %t2973)
  br label %fixmerge766
fixmerge766:
  %t2980 = phi i64 [ %t2978, %fixfast764 ], [ %t2979, %fixslow765 ]
  %t2981 = load i64, ptr @"scheme.base:rd-scan-digits"
  %t2982 = and i64 %t2981, -8
  %t2983 = inttoptr i64 %t2982 to ptr
  %t2984 = load i64, ptr %t2983
  %t2985 = inttoptr i64 %t2984 to ptr
  %t2986 = call fastcc i64%t2985(i64 %t2981, i64 3, i64 %a0, i64 %t2973, i64 %t2926, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2987 = or i64 %t2943, %t2949
  %t2988 = and i64 %t2987, 7
  %t2989 = icmp eq i64 %t2988, 0
  br i1 %t2989, label %fixfast767, label %fixslow768
fixfast767:
  %t2990 = icmp slt i64 %t2943, %t2949
  %t2991 = select i1 %t2990, i64 257, i64 1
  br label %fixmerge769
fixslow768:
  %t2992 = call i64 @rt_lt(i64 %t2943, i64 %t2949)
  br label %fixmerge769
fixmerge769:
  %t2993 = phi i64 [ %t2991, %fixfast767 ], [ %t2992, %fixslow768 ]
  %t2994 = icmp ne i64 %t2993, 1
  br i1 %t2994, label %then770, label %else771
then770:
  br label %merge772
else771:
  %t2995 = or i64 %t2973, %t2986
  %t2996 = and i64 %t2995, 7
  %t2997 = icmp eq i64 %t2996, 0
  br i1 %t2997, label %fixfast773, label %fixslow774
fixfast773:
  %t2998 = icmp slt i64 %t2973, %t2986
  %t2999 = select i1 %t2998, i64 257, i64 1
  br label %fixmerge775
fixslow774:
  %t3000 = call i64 @rt_lt(i64 %t2973, i64 %t2986)
  br label %fixmerge775
fixmerge775:
  %t3001 = phi i64 [ %t2999, %fixfast773 ], [ %t3000, %fixslow774 ]
  br label %merge772
merge772:
  %t3002 = phi i64 [ %t2993, %then770 ], [ %t3001, %fixmerge775 ]
  %t3003 = icmp ne i64 %t3002, 1
  br i1 %t3003, label %then776, label %else777
then776:
  %t3004 = or i64 %t2986, %t2926
  %t3005 = and i64 %t3004, 7
  %t3006 = icmp eq i64 %t3005, 0
  br i1 %t3006, label %fixfast778, label %fixslow779
fixfast778:
  %t3007 = icmp slt i64 %t2986, %t2926
  %t3008 = select i1 %t3007, i64 257, i64 1
  br label %fixmerge780
fixslow779:
  %t3009 = call i64 @rt_lt(i64 %t2986, i64 %t2926)
  br label %fixmerge780
fixmerge780:
  %t3010 = phi i64 [ %t3008, %fixfast778 ], [ %t3009, %fixslow779 ]
  %t3011 = icmp ne i64 %t3010, 1
  br i1 %t3011, label %then781, label %else782
then781:
  %t3012 = call i64 @rt_string_ref(i64 %a0, i64 %t2986)
  %t3013 = load i64, ptr @"scheme.base:rd-exp-char?"
  %t3014 = and i64 %t3013, -8
  %t3015 = inttoptr i64 %t3014 to ptr
  %t3016 = load i64, ptr %t3015
  %t3017 = inttoptr i64 %t3016 to ptr
  %t3018 = call fastcc i64%t3017(i64 %t3013, i64 1, i64 %t3012, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge783
else782:
  br label %merge783
merge783:
  %t3019 = phi i64 [ %t3018, %then781 ], [ 1, %else782 ]
  %t3020 = icmp ne i64 %t3019, 1
  br i1 %t3020, label %then784, label %else785
then784:
  %t3021 = or i64 %t2986, 8
  %t3022 = and i64 %t3021, 7
  %t3023 = icmp eq i64 %t3022, 0
  br i1 %t3023, label %fixfast787, label %fixslow788
fixfast787:
  %t3024 = add i64 %t2986, 8
  br label %fixmerge789
fixslow788:
  %t3025 = call i64 @rt_add(i64 %t2986, i64 8)
  br label %fixmerge789
fixmerge789:
  %t3026 = phi i64 [ %t3024, %fixfast787 ], [ %t3025, %fixslow788 ]
  %t3027 = or i64 %t3026, %t2926
  %t3028 = and i64 %t3027, 7
  %t3029 = icmp eq i64 %t3028, 0
  br i1 %t3029, label %fixfast790, label %fixslow791
fixfast790:
  %t3030 = icmp slt i64 %t3026, %t2926
  %t3031 = select i1 %t3030, i64 257, i64 1
  br label %fixmerge792
fixslow791:
  %t3032 = call i64 @rt_lt(i64 %t3026, i64 %t2926)
  br label %fixmerge792
fixmerge792:
  %t3033 = phi i64 [ %t3031, %fixfast790 ], [ %t3032, %fixslow791 ]
  %t3034 = icmp ne i64 %t3033, 1
  br i1 %t3034, label %then793, label %else794
then793:
  %t3035 = or i64 %t2986, 8
  %t3036 = and i64 %t3035, 7
  %t3037 = icmp eq i64 %t3036, 0
  br i1 %t3037, label %fixfast796, label %fixslow797
fixfast796:
  %t3038 = add i64 %t2986, 8
  br label %fixmerge798
fixslow797:
  %t3039 = call i64 @rt_add(i64 %t2986, i64 8)
  br label %fixmerge798
fixmerge798:
  %t3040 = phi i64 [ %t3038, %fixfast796 ], [ %t3039, %fixslow797 ]
  %t3041 = call i64 @rt_string_ref(i64 %a0, i64 %t3040)
  %t3042 = load i64, ptr @"scheme.base:rd-sign-char?"
  %t3043 = and i64 %t3042, -8
  %t3044 = inttoptr i64 %t3043 to ptr
  %t3045 = load i64, ptr %t3044
  %t3046 = inttoptr i64 %t3045 to ptr
  %t3047 = call fastcc i64%t3046(i64 %t3042, i64 1, i64 %t3041, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge795
else794:
  br label %merge795
merge795:
  %t3048 = phi i64 [ %t3047, %fixmerge798 ], [ 1, %else794 ]
  %t3049 = icmp ne i64 %t3048, 1
  br i1 %t3049, label %then799, label %else800
then799:
  %t3050 = or i64 %t2986, 16
  %t3051 = and i64 %t3050, 7
  %t3052 = icmp eq i64 %t3051, 0
  br i1 %t3052, label %fixfast802, label %fixslow803
fixfast802:
  %t3053 = add i64 %t2986, 16
  br label %fixmerge804
fixslow803:
  %t3054 = call i64 @rt_add(i64 %t2986, i64 16)
  br label %fixmerge804
fixmerge804:
  %t3055 = phi i64 [ %t3053, %fixfast802 ], [ %t3054, %fixslow803 ]
  br label %merge801
else800:
  %t3056 = or i64 %t2986, 8
  %t3057 = and i64 %t3056, 7
  %t3058 = icmp eq i64 %t3057, 0
  br i1 %t3058, label %fixfast805, label %fixslow806
fixfast805:
  %t3059 = add i64 %t2986, 8
  br label %fixmerge807
fixslow806:
  %t3060 = call i64 @rt_add(i64 %t2986, i64 8)
  br label %fixmerge807
fixmerge807:
  %t3061 = phi i64 [ %t3059, %fixfast805 ], [ %t3060, %fixslow806 ]
  br label %merge801
merge801:
  %t3062 = phi i64 [ %t3055, %fixmerge804 ], [ %t3061, %fixmerge807 ]
  %t3063 = load i64, ptr @"scheme.base:rd-scan-digits"
  %t3064 = and i64 %t3063, -8
  %t3065 = inttoptr i64 %t3064 to ptr
  %t3066 = load i64, ptr %t3065
  %t3067 = inttoptr i64 %t3066 to ptr
  %t3068 = call fastcc i64%t3067(i64 %t3063, i64 3, i64 %a0, i64 %t3062, i64 %t2926, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3069 = or i64 %t3062, %t3068
  %t3070 = and i64 %t3069, 7
  %t3071 = icmp eq i64 %t3070, 0
  br i1 %t3071, label %fixfast808, label %fixslow809
fixfast808:
  %t3072 = icmp slt i64 %t3062, %t3068
  %t3073 = select i1 %t3072, i64 257, i64 1
  br label %fixmerge810
fixslow809:
  %t3074 = call i64 @rt_lt(i64 %t3062, i64 %t3068)
  br label %fixmerge810
fixmerge810:
  %t3075 = phi i64 [ %t3073, %fixfast808 ], [ %t3074, %fixslow809 ]
  %t3076 = icmp ne i64 %t3075, 1
  br i1 %t3076, label %then811, label %else812
then811:
  br label %merge813
else812:
  br label %merge813
merge813:
  %t3077 = phi i64 [ %t3068, %then811 ], [ -8, %else812 ]
  br label %merge786
else785:
  br label %merge786
merge786:
  %t3078 = phi i64 [ %t3077, %merge813 ], [ %t2986, %else785 ]
  %t3079 = or i64 -8, %t3078
  %t3080 = and i64 %t3079, 7
  %t3081 = icmp eq i64 %t3080, 0
  br i1 %t3081, label %fixfast814, label %fixslow815
fixfast814:
  %t3082 = icmp slt i64 -8, %t3078
  %t3083 = select i1 %t3082, i64 257, i64 1
  br label %fixmerge816
fixslow815:
  %t3084 = call i64 @rt_lt(i64 -8, i64 %t3078)
  br label %fixmerge816
fixmerge816:
  %t3085 = phi i64 [ %t3083, %fixfast814 ], [ %t3084, %fixslow815 ]
  %t3086 = icmp ne i64 %t3085, 1
  br i1 %t3086, label %then817, label %else818
then817:
  %t3087 = or i64 %t3078, %t2926
  %t3088 = and i64 %t3087, 7
  %t3089 = icmp eq i64 %t3088, 0
  br i1 %t3089, label %fixfast819, label %fixslow820
fixfast819:
  %t3090 = icmp eq i64 %t3078, %t2926
  %t3091 = select i1 %t3090, i64 257, i64 1
  br label %fixmerge821
fixslow820:
  %t3092 = call i64 @rt_num_eq(i64 %t3078, i64 %t2926)
  br label %fixmerge821
fixmerge821:
  %t3093 = phi i64 [ %t3091, %fixfast819 ], [ %t3092, %fixslow820 ]
  %t3094 = icmp ne i64 %t3093, 1
  br i1 %t3094, label %then822, label %else823
then822:
  %t3095 = icmp ne i64 %t2980, 1
  br i1 %t3095, label %then824, label %else825
then824:
  ret i64 %t2980
else825:
  %t3096 = or i64 %t2986, %t3078
  %t3097 = and i64 %t3096, 7
  %t3098 = icmp eq i64 %t3097, 0
  br i1 %t3098, label %fixfast826, label %fixslow827
fixfast826:
  %t3099 = icmp slt i64 %t2986, %t3078
  %t3100 = select i1 %t3099, i64 257, i64 1
  br label %fixmerge828
fixslow827:
  %t3101 = call i64 @rt_lt(i64 %t2986, i64 %t3078)
  br label %fixmerge828
fixmerge828:
  %t3102 = phi i64 [ %t3100, %fixfast826 ], [ %t3101, %fixslow827 ]
  ret i64 %t3102
else823:
  ret i64 1
else818:
  ret i64 1
else777:
  ret i64 1
else748:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rd-atom"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3107 = icmp eq i64 %argc, 3
  br i1 %t3107, label %argok830, label %arityerr829
arityerr829:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok830:
  %t3108 = load i64, ptr @"scheme.base:rd-token-end"
  %t3109 = and i64 %t3108, -8
  %t3110 = inttoptr i64 %t3109 to ptr
  %t3111 = load i64, ptr %t3110
  %t3112 = inttoptr i64 %t3111 to ptr
  %t3113 = call fastcc i64%t3112(i64 %t3108, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3114 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t3113)
  %t3115 = load i64, ptr @"scheme.base:rd-numeric?"
  %t3116 = and i64 %t3115, -8
  %t3117 = inttoptr i64 %t3116 to ptr
  %t3118 = load i64, ptr %t3117
  %t3119 = inttoptr i64 %t3118 to ptr
  %t3120 = call fastcc i64%t3119(i64 %t3115, i64 1, i64 %t3114, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3121 = icmp ne i64 %t3120, 1
  br i1 %t3121, label %then831, label %else832
then831:
  %t3122 = load i64, ptr @"scheme.base:rd-parse-int"
  %t3123 = and i64 %t3122, -8
  %t3124 = inttoptr i64 %t3123 to ptr
  %t3125 = load i64, ptr %t3124
  %t3126 = inttoptr i64 %t3125 to ptr
  %t3127 = call fastcc i64%t3126(i64 %t3122, i64 1, i64 %t3114, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge833
else832:
  %t3128 = load i64, ptr @"scheme.base:rd-flonum?"
  %t3129 = and i64 %t3128, -8
  %t3130 = inttoptr i64 %t3129 to ptr
  %t3131 = load i64, ptr %t3130
  %t3132 = inttoptr i64 %t3131 to ptr
  %t3133 = call fastcc i64%t3132(i64 %t3128, i64 1, i64 %t3114, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3134 = icmp ne i64 %t3133, 1
  br i1 %t3134, label %then834, label %else835
then834:
  %t3135 = call i64 @rt_string_to_flonum(i64 %t3114)
  br label %merge836
else835:
  %t3136 = call i64 @rt_string_to_symbol(i64 %t3114)
  br label %merge836
merge836:
  %t3137 = phi i64 [ %t3135, %then834 ], [ %t3136, %else835 ]
  br label %merge833
merge833:
  %t3138 = phi i64 [ %t3127, %then831 ], [ %t3137, %merge836 ]
  %t3139 = call i64 @rt_cons(i64 %t3138, i64 %t3113)
  ret i64 %t3139
}

define fastcc i64 @"scheme.base:code:rd-hex-digit"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3144 = icmp eq i64 %argc, 1
  br i1 %t3144, label %argok838, label %arityerr837
arityerr837:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok838:
  %t3145 = call i64 @rt_char_to_integer(i64 %a0)
  %t3146 = or i64 376, %t3145
  %t3147 = and i64 %t3146, 7
  %t3148 = icmp eq i64 %t3147, 0
  br i1 %t3148, label %fixfast839, label %fixslow840
fixfast839:
  %t3149 = icmp slt i64 376, %t3145
  %t3150 = select i1 %t3149, i64 257, i64 1
  br label %fixmerge841
fixslow840:
  %t3151 = call i64 @rt_lt(i64 376, i64 %t3145)
  br label %fixmerge841
fixmerge841:
  %t3152 = phi i64 [ %t3150, %fixfast839 ], [ %t3151, %fixslow840 ]
  %t3153 = icmp ne i64 %t3152, 1
  br i1 %t3153, label %then842, label %else843
then842:
  %t3154 = or i64 %t3145, 464
  %t3155 = and i64 %t3154, 7
  %t3156 = icmp eq i64 %t3155, 0
  br i1 %t3156, label %fixfast845, label %fixslow846
fixfast845:
  %t3157 = icmp slt i64 %t3145, 464
  %t3158 = select i1 %t3157, i64 257, i64 1
  br label %fixmerge847
fixslow846:
  %t3159 = call i64 @rt_lt(i64 %t3145, i64 464)
  br label %fixmerge847
fixmerge847:
  %t3160 = phi i64 [ %t3158, %fixfast845 ], [ %t3159, %fixslow846 ]
  br label %merge844
else843:
  br label %merge844
merge844:
  %t3161 = phi i64 [ %t3160, %fixmerge847 ], [ 1, %else843 ]
  %t3162 = icmp ne i64 %t3161, 1
  br i1 %t3162, label %then848, label %else849
then848:
  %t3163 = or i64 %t3145, 384
  %t3164 = and i64 %t3163, 7
  %t3165 = icmp eq i64 %t3164, 0
  br i1 %t3165, label %fixfast850, label %fixslow851
fixfast850:
  %t3166 = sub i64 %t3145, 384
  br label %fixmerge852
fixslow851:
  %t3167 = call i64 @rt_sub(i64 %t3145, i64 384)
  br label %fixmerge852
fixmerge852:
  %t3168 = phi i64 [ %t3166, %fixfast850 ], [ %t3167, %fixslow851 ]
  ret i64 %t3168
else849:
  %t3169 = or i64 768, %t3145
  %t3170 = and i64 %t3169, 7
  %t3171 = icmp eq i64 %t3170, 0
  br i1 %t3171, label %fixfast853, label %fixslow854
fixfast853:
  %t3172 = icmp slt i64 768, %t3145
  %t3173 = select i1 %t3172, i64 257, i64 1
  br label %fixmerge855
fixslow854:
  %t3174 = call i64 @rt_lt(i64 768, i64 %t3145)
  br label %fixmerge855
fixmerge855:
  %t3175 = phi i64 [ %t3173, %fixfast853 ], [ %t3174, %fixslow854 ]
  %t3176 = icmp ne i64 %t3175, 1
  br i1 %t3176, label %then856, label %else857
then856:
  %t3177 = or i64 %t3145, 824
  %t3178 = and i64 %t3177, 7
  %t3179 = icmp eq i64 %t3178, 0
  br i1 %t3179, label %fixfast859, label %fixslow860
fixfast859:
  %t3180 = icmp slt i64 %t3145, 824
  %t3181 = select i1 %t3180, i64 257, i64 1
  br label %fixmerge861
fixslow860:
  %t3182 = call i64 @rt_lt(i64 %t3145, i64 824)
  br label %fixmerge861
fixmerge861:
  %t3183 = phi i64 [ %t3181, %fixfast859 ], [ %t3182, %fixslow860 ]
  br label %merge858
else857:
  br label %merge858
merge858:
  %t3184 = phi i64 [ %t3183, %fixmerge861 ], [ 1, %else857 ]
  %t3185 = icmp ne i64 %t3184, 1
  br i1 %t3185, label %then862, label %else863
then862:
  %t3186 = or i64 %t3145, 696
  %t3187 = and i64 %t3186, 7
  %t3188 = icmp eq i64 %t3187, 0
  br i1 %t3188, label %fixfast864, label %fixslow865
fixfast864:
  %t3189 = sub i64 %t3145, 696
  br label %fixmerge866
fixslow865:
  %t3190 = call i64 @rt_sub(i64 %t3145, i64 696)
  br label %fixmerge866
fixmerge866:
  %t3191 = phi i64 [ %t3189, %fixfast864 ], [ %t3190, %fixslow865 ]
  ret i64 %t3191
else863:
  %t3192 = or i64 512, %t3145
  %t3193 = and i64 %t3192, 7
  %t3194 = icmp eq i64 %t3193, 0
  br i1 %t3194, label %fixfast867, label %fixslow868
fixfast867:
  %t3195 = icmp slt i64 512, %t3145
  %t3196 = select i1 %t3195, i64 257, i64 1
  br label %fixmerge869
fixslow868:
  %t3197 = call i64 @rt_lt(i64 512, i64 %t3145)
  br label %fixmerge869
fixmerge869:
  %t3198 = phi i64 [ %t3196, %fixfast867 ], [ %t3197, %fixslow868 ]
  %t3199 = icmp ne i64 %t3198, 1
  br i1 %t3199, label %then870, label %else871
then870:
  %t3200 = or i64 %t3145, 568
  %t3201 = and i64 %t3200, 7
  %t3202 = icmp eq i64 %t3201, 0
  br i1 %t3202, label %fixfast873, label %fixslow874
fixfast873:
  %t3203 = icmp slt i64 %t3145, 568
  %t3204 = select i1 %t3203, i64 257, i64 1
  br label %fixmerge875
fixslow874:
  %t3205 = call i64 @rt_lt(i64 %t3145, i64 568)
  br label %fixmerge875
fixmerge875:
  %t3206 = phi i64 [ %t3204, %fixfast873 ], [ %t3205, %fixslow874 ]
  br label %merge872
else871:
  br label %merge872
merge872:
  %t3207 = phi i64 [ %t3206, %fixmerge875 ], [ 1, %else871 ]
  %t3208 = icmp ne i64 %t3207, 1
  br i1 %t3208, label %then876, label %else877
then876:
  %t3209 = or i64 %t3145, 440
  %t3210 = and i64 %t3209, 7
  %t3211 = icmp eq i64 %t3210, 0
  br i1 %t3211, label %fixfast878, label %fixslow879
fixfast878:
  %t3212 = sub i64 %t3145, 440
  br label %fixmerge880
fixslow879:
  %t3213 = call i64 @rt_sub(i64 %t3145, i64 440)
  br label %fixmerge880
fixmerge880:
  %t3214 = phi i64 [ %t3212, %fixfast878 ], [ %t3213, %fixslow879 ]
  ret i64 %t3214
else877:
  ret i64 0
}

define fastcc i64 @"scheme.base:code:rd-hex"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3219 = icmp eq i64 %argc, 4
  br i1 %t3219, label %argok882, label %arityerr881
arityerr881:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok882:
  %t3220 = or i64 %a2, %a1
  %t3221 = and i64 %t3220, 7
  %t3222 = icmp eq i64 %t3221, 0
  br i1 %t3222, label %fixfast883, label %fixslow884
fixfast883:
  %t3223 = icmp slt i64 %a2, %a1
  %t3224 = select i1 %t3223, i64 257, i64 1
  br label %fixmerge885
fixslow884:
  %t3225 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge885
fixmerge885:
  %t3226 = phi i64 [ %t3224, %fixfast883 ], [ %t3225, %fixslow884 ]
  %t3227 = icmp ne i64 %t3226, 1
  br i1 %t3227, label %then886, label %else887
then886:
  %t3228 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3229 = call i64 @rt_char_to_integer(i64 %t3228)
  %t3230 = or i64 %t3229, 472
  %t3231 = and i64 %t3230, 7
  %t3232 = icmp eq i64 %t3231, 0
  br i1 %t3232, label %fixfast888, label %fixslow889
fixfast888:
  %t3233 = icmp eq i64 %t3229, 472
  %t3234 = select i1 %t3233, i64 257, i64 1
  br label %fixmerge890
fixslow889:
  %t3235 = call i64 @rt_num_eq(i64 %t3229, i64 472)
  br label %fixmerge890
fixmerge890:
  %t3236 = phi i64 [ %t3234, %fixfast888 ], [ %t3235, %fixslow889 ]
  %t3237 = icmp ne i64 %t3236, 1
  br i1 %t3237, label %then891, label %else892
then891:
  %t3238 = or i64 %a2, 8
  %t3239 = and i64 %t3238, 7
  %t3240 = icmp eq i64 %t3239, 0
  br i1 %t3240, label %fixfast893, label %fixslow894
fixfast893:
  %t3241 = add i64 %a2, 8
  br label %fixmerge895
fixslow894:
  %t3242 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge895
fixmerge895:
  %t3243 = phi i64 [ %t3241, %fixfast893 ], [ %t3242, %fixslow894 ]
  %t3244 = call i64 @rt_cons(i64 %a3, i64 %t3243)
  ret i64 %t3244
else892:
  %t3245 = or i64 %a2, 8
  %t3246 = and i64 %t3245, 7
  %t3247 = icmp eq i64 %t3246, 0
  br i1 %t3247, label %fixfast896, label %fixslow897
fixfast896:
  %t3248 = add i64 %a2, 8
  br label %fixmerge898
fixslow897:
  %t3249 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge898
fixmerge898:
  %t3250 = phi i64 [ %t3248, %fixfast896 ], [ %t3249, %fixslow897 ]
  %t3251 = or i64 %a3, 128
  %t3252 = and i64 %t3251, 7
  %t3253 = icmp eq i64 %t3252, 0
  br i1 %t3253, label %fixfast899, label %fixslow900
fixfast899:
  %t3254 = ashr i64 %a3, 3
  %t3255 = mul i64 %t3254, 128
  br label %fixmerge901
fixslow900:
  %t3256 = call i64 @rt_mul(i64 %a3, i64 128)
  br label %fixmerge901
fixmerge901:
  %t3257 = phi i64 [ %t3255, %fixfast899 ], [ %t3256, %fixslow900 ]
  %t3258 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3259 = load i64, ptr @"scheme.base:rd-hex-digit"
  %t3260 = and i64 %t3259, -8
  %t3261 = inttoptr i64 %t3260 to ptr
  %t3262 = load i64, ptr %t3261
  %t3263 = inttoptr i64 %t3262 to ptr
  %t3264 = call fastcc i64%t3263(i64 %t3259, i64 1, i64 %t3258, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3265 = or i64 %t3257, %t3264
  %t3266 = and i64 %t3265, 7
  %t3267 = icmp eq i64 %t3266, 0
  br i1 %t3267, label %fixfast902, label %fixslow903
fixfast902:
  %t3268 = add i64 %t3257, %t3264
  br label %fixmerge904
fixslow903:
  %t3269 = call i64 @rt_add(i64 %t3257, i64 %t3264)
  br label %fixmerge904
fixmerge904:
  %t3270 = phi i64 [ %t3268, %fixfast902 ], [ %t3269, %fixslow903 ]
  %t3271 = load i64, ptr @"scheme.base:rd-hex"
  %t3272 = and i64 %t3271, -8
  %t3273 = inttoptr i64 %t3272 to ptr
  %t3274 = load i64, ptr %t3273
  %t3275 = inttoptr i64 %t3274 to ptr
  %t3276 = musttail call fastcc i64 %t3275(i64 %t3271, i64 4, i64 %a0, i64 %a1, i64 %t3250, i64 %t3270, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3276
else887:
  %t3277 = call i64 @rt_cons(i64 %a3, i64 %a2)
  ret i64 %t3277
}

define fastcc i64 @"scheme.base:code:rd-str-esc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3282 = icmp eq i64 %argc, 1
  br i1 %t3282, label %argok906, label %arityerr905
arityerr905:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok906:
  %t3283 = call i64 @rt_char_to_integer(i64 %a0)
  %t3284 = or i64 %t3283, 880
  %t3285 = and i64 %t3284, 7
  %t3286 = icmp eq i64 %t3285, 0
  br i1 %t3286, label %fixfast907, label %fixslow908
fixfast907:
  %t3287 = icmp eq i64 %t3283, 880
  %t3288 = select i1 %t3287, i64 257, i64 1
  br label %fixmerge909
fixslow908:
  %t3289 = call i64 @rt_num_eq(i64 %t3283, i64 880)
  br label %fixmerge909
fixmerge909:
  %t3290 = phi i64 [ %t3288, %fixfast907 ], [ %t3289, %fixslow908 ]
  %t3291 = icmp ne i64 %t3290, 1
  br i1 %t3291, label %then910, label %else911
then910:
  %t3292 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t3292
else911:
  %t3293 = or i64 %t3283, 928
  %t3294 = and i64 %t3293, 7
  %t3295 = icmp eq i64 %t3294, 0
  br i1 %t3295, label %fixfast912, label %fixslow913
fixfast912:
  %t3296 = icmp eq i64 %t3283, 928
  %t3297 = select i1 %t3296, i64 257, i64 1
  br label %fixmerge914
fixslow913:
  %t3298 = call i64 @rt_num_eq(i64 %t3283, i64 928)
  br label %fixmerge914
fixmerge914:
  %t3299 = phi i64 [ %t3297, %fixfast912 ], [ %t3298, %fixslow913 ]
  %t3300 = icmp ne i64 %t3299, 1
  br i1 %t3300, label %then915, label %else916
then915:
  %t3301 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t3301
else916:
  %t3302 = or i64 %t3283, 912
  %t3303 = and i64 %t3302, 7
  %t3304 = icmp eq i64 %t3303, 0
  br i1 %t3304, label %fixfast917, label %fixslow918
fixfast917:
  %t3305 = icmp eq i64 %t3283, 912
  %t3306 = select i1 %t3305, i64 257, i64 1
  br label %fixmerge919
fixslow918:
  %t3307 = call i64 @rt_num_eq(i64 %t3283, i64 912)
  br label %fixmerge919
fixmerge919:
  %t3308 = phi i64 [ %t3306, %fixfast917 ], [ %t3307, %fixslow918 ]
  %t3309 = icmp ne i64 %t3308, 1
  br i1 %t3309, label %then920, label %else921
then920:
  %t3310 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t3310
else921:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_815"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3315 = icmp eq i64 %argc, 2
  br i1 %t3315, label %argok923, label %arityerr922
arityerr922:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok923:
  %t3316 = and i64 %self, -8
  %t3317 = inttoptr i64 %t3316 to ptr
  %t3318 = getelementptr i64, ptr %t3317, i64 1
  %t3319 = load i64, ptr %t3318
  %t3320 = or i64 %a0, %t3319
  %t3321 = and i64 %t3320, 7
  %t3322 = icmp eq i64 %t3321, 0
  br i1 %t3322, label %fixfast924, label %fixslow925
fixfast924:
  %t3323 = icmp slt i64 %a0, %t3319
  %t3324 = select i1 %t3323, i64 257, i64 1
  br label %fixmerge926
fixslow925:
  %t3325 = call i64 @rt_lt(i64 %a0, i64 %t3319)
  br label %fixmerge926
fixmerge926:
  %t3326 = phi i64 [ %t3324, %fixfast924 ], [ %t3325, %fixslow925 ]
  %t3327 = icmp ne i64 %t3326, 1
  br i1 %t3327, label %then927, label %else928
then927:
  %t3328 = and i64 %self, -8
  %t3329 = inttoptr i64 %t3328 to ptr
  %t3330 = getelementptr i64, ptr %t3329, i64 2
  %t3331 = load i64, ptr %t3330
  %t3332 = call i64 @rt_string_ref(i64 %t3331, i64 %a0)
  %t3333 = call i64 @rt_char_to_integer(i64 %t3332)
  %t3334 = or i64 %t3333, 272
  %t3335 = and i64 %t3334, 7
  %t3336 = icmp eq i64 %t3335, 0
  br i1 %t3336, label %fixfast929, label %fixslow930
fixfast929:
  %t3337 = icmp eq i64 %t3333, 272
  %t3338 = select i1 %t3337, i64 257, i64 1
  br label %fixmerge931
fixslow930:
  %t3339 = call i64 @rt_num_eq(i64 %t3333, i64 272)
  br label %fixmerge931
fixmerge931:
  %t3340 = phi i64 [ %t3338, %fixfast929 ], [ %t3339, %fixslow930 ]
  %t3341 = icmp ne i64 %t3340, 1
  br i1 %t3341, label %then932, label %else933
then932:
  %t3342 = load i64, ptr @"scheme.base:reverse"
  %t3343 = and i64 %t3342, -8
  %t3344 = inttoptr i64 %t3343 to ptr
  %t3345 = load i64, ptr %t3344
  %t3346 = inttoptr i64 %t3345 to ptr
  %t3347 = call fastcc i64%t3346(i64 %t3342, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3348 = call i64 @rt_list_to_string(i64 %t3347)
  %t3349 = or i64 %a0, 8
  %t3350 = and i64 %t3349, 7
  %t3351 = icmp eq i64 %t3350, 0
  br i1 %t3351, label %fixfast934, label %fixslow935
fixfast934:
  %t3352 = add i64 %a0, 8
  br label %fixmerge936
fixslow935:
  %t3353 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge936
fixmerge936:
  %t3354 = phi i64 [ %t3352, %fixfast934 ], [ %t3353, %fixslow935 ]
  %t3355 = call i64 @rt_cons(i64 %t3348, i64 %t3354)
  ret i64 %t3355
else933:
  %t3356 = or i64 %t3333, 736
  %t3357 = and i64 %t3356, 7
  %t3358 = icmp eq i64 %t3357, 0
  br i1 %t3358, label %fixfast937, label %fixslow938
fixfast937:
  %t3359 = icmp eq i64 %t3333, 736
  %t3360 = select i1 %t3359, i64 257, i64 1
  br label %fixmerge939
fixslow938:
  %t3361 = call i64 @rt_num_eq(i64 %t3333, i64 736)
  br label %fixmerge939
fixmerge939:
  %t3362 = phi i64 [ %t3360, %fixfast937 ], [ %t3361, %fixslow938 ]
  %t3363 = icmp ne i64 %t3362, 1
  br i1 %t3363, label %then940, label %else941
then940:
  %t3364 = and i64 %self, -8
  %t3365 = inttoptr i64 %t3364 to ptr
  %t3366 = getelementptr i64, ptr %t3365, i64 2
  %t3367 = load i64, ptr %t3366
  %t3368 = or i64 %a0, 8
  %t3369 = and i64 %t3368, 7
  %t3370 = icmp eq i64 %t3369, 0
  br i1 %t3370, label %fixfast942, label %fixslow943
fixfast942:
  %t3371 = add i64 %a0, 8
  br label %fixmerge944
fixslow943:
  %t3372 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge944
fixmerge944:
  %t3373 = phi i64 [ %t3371, %fixfast942 ], [ %t3372, %fixslow943 ]
  %t3374 = call i64 @rt_string_ref(i64 %t3367, i64 %t3373)
  %t3375 = call i64 @rt_char_to_integer(i64 %t3374)
  %t3376 = or i64 %t3375, 960
  %t3377 = and i64 %t3376, 7
  %t3378 = icmp eq i64 %t3377, 0
  br i1 %t3378, label %fixfast945, label %fixslow946
fixfast945:
  %t3379 = icmp eq i64 %t3375, 960
  %t3380 = select i1 %t3379, i64 257, i64 1
  br label %fixmerge947
fixslow946:
  %t3381 = call i64 @rt_num_eq(i64 %t3375, i64 960)
  br label %fixmerge947
fixmerge947:
  %t3382 = phi i64 [ %t3380, %fixfast945 ], [ %t3381, %fixslow946 ]
  %t3383 = icmp ne i64 %t3382, 1
  br i1 %t3383, label %then948, label %else949
then948:
  %t3384 = and i64 %self, -8
  %t3385 = inttoptr i64 %t3384 to ptr
  %t3386 = getelementptr i64, ptr %t3385, i64 2
  %t3387 = load i64, ptr %t3386
  %t3388 = and i64 %self, -8
  %t3389 = inttoptr i64 %t3388 to ptr
  %t3390 = getelementptr i64, ptr %t3389, i64 1
  %t3391 = load i64, ptr %t3390
  %t3392 = or i64 %a0, 16
  %t3393 = and i64 %t3392, 7
  %t3394 = icmp eq i64 %t3393, 0
  br i1 %t3394, label %fixfast950, label %fixslow951
fixfast950:
  %t3395 = add i64 %a0, 16
  br label %fixmerge952
fixslow951:
  %t3396 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge952
fixmerge952:
  %t3397 = phi i64 [ %t3395, %fixfast950 ], [ %t3396, %fixslow951 ]
  %t3398 = load i64, ptr @"scheme.base:rd-hex"
  %t3399 = and i64 %t3398, -8
  %t3400 = inttoptr i64 %t3399 to ptr
  %t3401 = load i64, ptr %t3400
  %t3402 = inttoptr i64 %t3401 to ptr
  %t3403 = call fastcc i64%t3402(i64 %t3398, i64 4, i64 %t3387, i64 %t3391, i64 %t3397, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3404 = call i64 @rt_cdr(i64 %t3403)
  %t3405 = call i64 @rt_car(i64 %t3403)
  %t3406 = call i64 @rt_integer_to_char(i64 %t3405)
  %t3407 = call i64 @rt_cons(i64 %t3406, i64 %a1)
  %t3408 = musttail call fastcc i64 @"scheme.base:code_815"(i64 %self, i64 2, i64 %t3404, i64 %t3407, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3408
else949:
  %t3409 = or i64 %a0, 16
  %t3410 = and i64 %t3409, 7
  %t3411 = icmp eq i64 %t3410, 0
  br i1 %t3411, label %fixfast953, label %fixslow954
fixfast953:
  %t3412 = add i64 %a0, 16
  br label %fixmerge955
fixslow954:
  %t3413 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge955
fixmerge955:
  %t3414 = phi i64 [ %t3412, %fixfast953 ], [ %t3413, %fixslow954 ]
  %t3415 = load i64, ptr @"scheme.base:rd-str-esc"
  %t3416 = and i64 %t3415, -8
  %t3417 = inttoptr i64 %t3416 to ptr
  %t3418 = load i64, ptr %t3417
  %t3419 = inttoptr i64 %t3418 to ptr
  %t3420 = call fastcc i64%t3419(i64 %t3415, i64 1, i64 %t3374, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3421 = call i64 @rt_cons(i64 %t3420, i64 %a1)
  %t3422 = musttail call fastcc i64 @"scheme.base:code_815"(i64 %self, i64 2, i64 %t3414, i64 %t3421, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3422
else941:
  %t3423 = or i64 %a0, 8
  %t3424 = and i64 %t3423, 7
  %t3425 = icmp eq i64 %t3424, 0
  br i1 %t3425, label %fixfast956, label %fixslow957
fixfast956:
  %t3426 = add i64 %a0, 8
  br label %fixmerge958
fixslow957:
  %t3427 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge958
fixmerge958:
  %t3428 = phi i64 [ %t3426, %fixfast956 ], [ %t3427, %fixslow957 ]
  %t3429 = call i64 @rt_cons(i64 %t3332, i64 %a1)
  %t3430 = musttail call fastcc i64 @"scheme.base:code_815"(i64 %self, i64 2, i64 %t3428, i64 %t3429, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3430
else928:
  %t3431 = load i64, ptr @"scheme.base:reverse"
  %t3432 = and i64 %t3431, -8
  %t3433 = inttoptr i64 %t3432 to ptr
  %t3434 = load i64, ptr %t3433
  %t3435 = inttoptr i64 %t3434 to ptr
  %t3436 = call fastcc i64%t3435(i64 %t3431, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3437 = call i64 @rt_list_to_string(i64 %t3436)
  %t3438 = call i64 @rt_cons(i64 %t3437, i64 %a0)
  ret i64 %t3438
}

define fastcc i64 @"scheme.base:code:rd-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3439 = icmp eq i64 %argc, 3
  br i1 %t3439, label %argok960, label %arityerr959
arityerr959:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok960:
  %t3440 = call ptr @rt_alloc_words(i64 4)
  %t3441 = ptrtoint ptr %t3440 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_815" to i64), ptr %t3440
  %t3442 = or i64 %t3441, 4
  %t3443 = getelementptr i64, ptr %t3440, i64 1
  store i64 %a1, ptr %t3443
  %t3444 = getelementptr i64, ptr %t3440, i64 2
  store i64 %a0, ptr %t3444
  %t3445 = getelementptr i64, ptr %t3440, i64 3
  store i64 %t3442, ptr %t3445
  %t3446 = musttail call fastcc i64 @"scheme.base:code_815"(i64 %t3442, i64 2, i64 %a2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3446
}

define fastcc i64 @"scheme.base:code:rd-hash"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3451 = icmp eq i64 %argc, 3
  br i1 %t3451, label %argok962, label %arityerr961
arityerr961:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok962:
  %t3452 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3453 = call i64 @rt_char_to_integer(i64 %t3452)
  %t3454 = or i64 %t3453, 928
  %t3455 = and i64 %t3454, 7
  %t3456 = icmp eq i64 %t3455, 0
  br i1 %t3456, label %fixfast963, label %fixslow964
fixfast963:
  %t3457 = icmp eq i64 %t3453, 928
  %t3458 = select i1 %t3457, i64 257, i64 1
  br label %fixmerge965
fixslow964:
  %t3459 = call i64 @rt_num_eq(i64 %t3453, i64 928)
  br label %fixmerge965
fixmerge965:
  %t3460 = phi i64 [ %t3458, %fixfast963 ], [ %t3459, %fixslow964 ]
  %t3461 = icmp ne i64 %t3460, 1
  br i1 %t3461, label %then966, label %else967
then966:
  %t3462 = or i64 %a2, 8
  %t3463 = and i64 %t3462, 7
  %t3464 = icmp eq i64 %t3463, 0
  br i1 %t3464, label %fixfast968, label %fixslow969
fixfast968:
  %t3465 = add i64 %a2, 8
  br label %fixmerge970
fixslow969:
  %t3466 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge970
fixmerge970:
  %t3467 = phi i64 [ %t3465, %fixfast968 ], [ %t3466, %fixslow969 ]
  %t3468 = call i64 @rt_cons(i64 257, i64 %t3467)
  ret i64 %t3468
else967:
  %t3469 = or i64 %t3453, 816
  %t3470 = and i64 %t3469, 7
  %t3471 = icmp eq i64 %t3470, 0
  br i1 %t3471, label %fixfast971, label %fixslow972
fixfast971:
  %t3472 = icmp eq i64 %t3453, 816
  %t3473 = select i1 %t3472, i64 257, i64 1
  br label %fixmerge973
fixslow972:
  %t3474 = call i64 @rt_num_eq(i64 %t3453, i64 816)
  br label %fixmerge973
fixmerge973:
  %t3475 = phi i64 [ %t3473, %fixfast971 ], [ %t3474, %fixslow972 ]
  %t3476 = icmp ne i64 %t3475, 1
  br i1 %t3476, label %then974, label %else975
then974:
  %t3477 = or i64 %a2, 8
  %t3478 = and i64 %t3477, 7
  %t3479 = icmp eq i64 %t3478, 0
  br i1 %t3479, label %fixfast976, label %fixslow977
fixfast976:
  %t3480 = add i64 %a2, 8
  br label %fixmerge978
fixslow977:
  %t3481 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge978
fixmerge978:
  %t3482 = phi i64 [ %t3480, %fixfast976 ], [ %t3481, %fixslow977 ]
  %t3483 = call i64 @rt_cons(i64 1, i64 %t3482)
  ret i64 %t3483
else975:
  %t3484 = or i64 %t3453, 736
  %t3485 = and i64 %t3484, 7
  %t3486 = icmp eq i64 %t3485, 0
  br i1 %t3486, label %fixfast979, label %fixslow980
fixfast979:
  %t3487 = icmp eq i64 %t3453, 736
  %t3488 = select i1 %t3487, i64 257, i64 1
  br label %fixmerge981
fixslow980:
  %t3489 = call i64 @rt_num_eq(i64 %t3453, i64 736)
  br label %fixmerge981
fixmerge981:
  %t3490 = phi i64 [ %t3488, %fixfast979 ], [ %t3489, %fixslow980 ]
  %t3491 = icmp ne i64 %t3490, 1
  br i1 %t3491, label %then982, label %else983
then982:
  %t3492 = load i64, ptr @"scheme.base:rd-char"
  %t3493 = and i64 %t3492, -8
  %t3494 = inttoptr i64 %t3493 to ptr
  %t3495 = load i64, ptr %t3494
  %t3496 = inttoptr i64 %t3495 to ptr
  %t3497 = musttail call fastcc i64 %t3496(i64 %t3492, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3497
else983:
  %t3498 = or i64 %t3453, 320
  %t3499 = and i64 %t3498, 7
  %t3500 = icmp eq i64 %t3499, 0
  br i1 %t3500, label %fixfast984, label %fixslow985
fixfast984:
  %t3501 = icmp eq i64 %t3453, 320
  %t3502 = select i1 %t3501, i64 257, i64 1
  br label %fixmerge986
fixslow985:
  %t3503 = call i64 @rt_num_eq(i64 %t3453, i64 320)
  br label %fixmerge986
fixmerge986:
  %t3504 = phi i64 [ %t3502, %fixfast984 ], [ %t3503, %fixslow985 ]
  %t3505 = icmp ne i64 %t3504, 1
  br i1 %t3505, label %then987, label %else988
then987:
  %t3506 = or i64 %a2, 8
  %t3507 = and i64 %t3506, 7
  %t3508 = icmp eq i64 %t3507, 0
  br i1 %t3508, label %fixfast989, label %fixslow990
fixfast989:
  %t3509 = add i64 %a2, 8
  br label %fixmerge991
fixslow990:
  %t3510 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge991
fixmerge991:
  %t3511 = phi i64 [ %t3509, %fixfast989 ], [ %t3510, %fixslow990 ]
  %t3512 = load i64, ptr @"scheme.base:rd-list"
  %t3513 = and i64 %t3512, -8
  %t3514 = inttoptr i64 %t3513 to ptr
  %t3515 = load i64, ptr %t3514
  %t3516 = inttoptr i64 %t3515 to ptr
  %t3517 = call fastcc i64%t3516(i64 %t3512, i64 4, i64 %a0, i64 %a1, i64 %t3511, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3518 = call i64 @rt_car(i64 %t3517)
  %t3519 = load i64, ptr @"scheme.base:list->vector"
  %t3520 = and i64 %t3519, -8
  %t3521 = inttoptr i64 %t3520 to ptr
  %t3522 = load i64, ptr %t3521
  %t3523 = inttoptr i64 %t3522 to ptr
  %t3524 = call fastcc i64%t3523(i64 %t3519, i64 1, i64 %t3518, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3525 = call i64 @rt_cdr(i64 %t3517)
  %t3526 = call i64 @rt_cons(i64 %t3524, i64 %t3525)
  ret i64 %t3526
else988:
  %t3527 = or i64 %t3453, 936
  %t3528 = and i64 %t3527, 7
  %t3529 = icmp eq i64 %t3528, 0
  br i1 %t3529, label %fixfast992, label %fixslow993
fixfast992:
  %t3530 = icmp eq i64 %t3453, 936
  %t3531 = select i1 %t3530, i64 257, i64 1
  br label %fixmerge994
fixslow993:
  %t3532 = call i64 @rt_num_eq(i64 %t3453, i64 936)
  br label %fixmerge994
fixmerge994:
  %t3533 = phi i64 [ %t3531, %fixfast992 ], [ %t3532, %fixslow993 ]
  %t3534 = icmp ne i64 %t3533, 1
  br i1 %t3534, label %then995, label %else996
then995:
  %t3535 = or i64 %a2, 16
  %t3536 = and i64 %t3535, 7
  %t3537 = icmp eq i64 %t3536, 0
  br i1 %t3537, label %fixfast998, label %fixslow999
fixfast998:
  %t3538 = add i64 %a2, 16
  br label %fixmerge1000
fixslow999:
  %t3539 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge1000
fixmerge1000:
  %t3540 = phi i64 [ %t3538, %fixfast998 ], [ %t3539, %fixslow999 ]
  %t3541 = or i64 %t3540, %a1
  %t3542 = and i64 %t3541, 7
  %t3543 = icmp eq i64 %t3542, 0
  br i1 %t3543, label %fixfast1001, label %fixslow1002
fixfast1001:
  %t3544 = icmp slt i64 %t3540, %a1
  %t3545 = select i1 %t3544, i64 257, i64 1
  br label %fixmerge1003
fixslow1002:
  %t3546 = call i64 @rt_lt(i64 %t3540, i64 %a1)
  br label %fixmerge1003
fixmerge1003:
  %t3547 = phi i64 [ %t3545, %fixfast1001 ], [ %t3546, %fixslow1002 ]
  %t3548 = icmp ne i64 %t3547, 1
  br i1 %t3548, label %then1004, label %else1005
then1004:
  %t3549 = or i64 %a2, 8
  %t3550 = and i64 %t3549, 7
  %t3551 = icmp eq i64 %t3550, 0
  br i1 %t3551, label %fixfast1007, label %fixslow1008
fixfast1007:
  %t3552 = add i64 %a2, 8
  br label %fixmerge1009
fixslow1008:
  %t3553 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1009
fixmerge1009:
  %t3554 = phi i64 [ %t3552, %fixfast1007 ], [ %t3553, %fixslow1008 ]
  %t3555 = call i64 @rt_string_ref(i64 %a0, i64 %t3554)
  %t3556 = call i64 @rt_char_to_integer(i64 %t3555)
  %t3557 = or i64 %t3556, 448
  %t3558 = and i64 %t3557, 7
  %t3559 = icmp eq i64 %t3558, 0
  br i1 %t3559, label %fixfast1010, label %fixslow1011
fixfast1010:
  %t3560 = icmp eq i64 %t3556, 448
  %t3561 = select i1 %t3560, i64 257, i64 1
  br label %fixmerge1012
fixslow1011:
  %t3562 = call i64 @rt_num_eq(i64 %t3556, i64 448)
  br label %fixmerge1012
fixmerge1012:
  %t3563 = phi i64 [ %t3561, %fixfast1010 ], [ %t3562, %fixslow1011 ]
  %t3564 = icmp ne i64 %t3563, 1
  br i1 %t3564, label %then1013, label %else1014
then1013:
  %t3565 = or i64 %a2, 16
  %t3566 = and i64 %t3565, 7
  %t3567 = icmp eq i64 %t3566, 0
  br i1 %t3567, label %fixfast1016, label %fixslow1017
fixfast1016:
  %t3568 = add i64 %a2, 16
  br label %fixmerge1018
fixslow1017:
  %t3569 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge1018
fixmerge1018:
  %t3570 = phi i64 [ %t3568, %fixfast1016 ], [ %t3569, %fixslow1017 ]
  %t3571 = call i64 @rt_string_ref(i64 %a0, i64 %t3570)
  %t3572 = call i64 @rt_char_to_integer(i64 %t3571)
  %t3573 = or i64 %t3572, 320
  %t3574 = and i64 %t3573, 7
  %t3575 = icmp eq i64 %t3574, 0
  br i1 %t3575, label %fixfast1019, label %fixslow1020
fixfast1019:
  %t3576 = icmp eq i64 %t3572, 320
  %t3577 = select i1 %t3576, i64 257, i64 1
  br label %fixmerge1021
fixslow1020:
  %t3578 = call i64 @rt_num_eq(i64 %t3572, i64 320)
  br label %fixmerge1021
fixmerge1021:
  %t3579 = phi i64 [ %t3577, %fixfast1019 ], [ %t3578, %fixslow1020 ]
  br label %merge1015
else1014:
  br label %merge1015
merge1015:
  %t3580 = phi i64 [ %t3579, %fixmerge1021 ], [ 1, %else1014 ]
  br label %merge1006
else1005:
  br label %merge1006
merge1006:
  %t3581 = phi i64 [ %t3580, %merge1015 ], [ 1, %else1005 ]
  br label %merge997
else996:
  br label %merge997
merge997:
  %t3582 = phi i64 [ %t3581, %merge1006 ], [ 1, %else996 ]
  %t3583 = icmp ne i64 %t3582, 1
  br i1 %t3583, label %then1022, label %else1023
then1022:
  %t3584 = or i64 %a2, 24
  %t3585 = and i64 %t3584, 7
  %t3586 = icmp eq i64 %t3585, 0
  br i1 %t3586, label %fixfast1024, label %fixslow1025
fixfast1024:
  %t3587 = add i64 %a2, 24
  br label %fixmerge1026
fixslow1025:
  %t3588 = call i64 @rt_add(i64 %a2, i64 24)
  br label %fixmerge1026
fixmerge1026:
  %t3589 = phi i64 [ %t3587, %fixfast1024 ], [ %t3588, %fixslow1025 ]
  %t3590 = load i64, ptr @"scheme.base:rd-list"
  %t3591 = and i64 %t3590, -8
  %t3592 = inttoptr i64 %t3591 to ptr
  %t3593 = load i64, ptr %t3592
  %t3594 = inttoptr i64 %t3593 to ptr
  %t3595 = call fastcc i64%t3594(i64 %t3590, i64 4, i64 %a0, i64 %a1, i64 %t3589, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3596 = call i64 @rt_car(i64 %t3595)
  %t3597 = load i64, ptr @"scheme.base:list->bytevector"
  %t3598 = and i64 %t3597, -8
  %t3599 = inttoptr i64 %t3598 to ptr
  %t3600 = load i64, ptr %t3599
  %t3601 = inttoptr i64 %t3600 to ptr
  %t3602 = call fastcc i64%t3601(i64 %t3597, i64 1, i64 %t3596, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3603 = call i64 @rt_cdr(i64 %t3595)
  %t3604 = call i64 @rt_cons(i64 %t3602, i64 %t3603)
  ret i64 %t3604
else1023:
  %t3605 = load i64, ptr @"scheme.base:rd-token-end"
  %t3606 = and i64 %t3605, -8
  %t3607 = inttoptr i64 %t3606 to ptr
  %t3608 = load i64, ptr %t3607
  %t3609 = inttoptr i64 %t3608 to ptr
  %t3610 = call fastcc i64%t3609(i64 %t3605, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3611 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t3610)
  %t3612 = call i64 @rt_string_to_symbol(i64 %t3611)
  %t3613 = call i64 @rt_cons(i64 %t3612, i64 %t3610)
  ret i64 %t3613
}

define fastcc i64 @"scheme.base:code:rd-char-name"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3618 = icmp eq i64 %argc, 1
  br i1 %t3618, label %argok1028, label %arityerr1027
arityerr1027:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1028:
  %t3619 = call i64 @rt_make_string(ptr @.str.lit.6, i64 5)
  %t3620 = call i64 @rt_string_eq(i64 %a0, i64 %t3619)
  %t3621 = icmp ne i64 %t3620, 1
  br i1 %t3621, label %then1029, label %else1030
then1029:
  %t3622 = call i64 @rt_integer_to_char(i64 256)
  ret i64 %t3622
else1030:
  %t3623 = call i64 @rt_make_string(ptr @.str.lit.7, i64 7)
  %t3624 = call i64 @rt_string_eq(i64 %a0, i64 %t3623)
  %t3625 = icmp ne i64 %t3624, 1
  br i1 %t3625, label %then1031, label %else1032
then1031:
  %t3626 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t3626
else1032:
  %t3627 = call i64 @rt_make_string(ptr @.str.lit.8, i64 3)
  %t3628 = call i64 @rt_string_eq(i64 %a0, i64 %t3627)
  %t3629 = icmp ne i64 %t3628, 1
  br i1 %t3629, label %then1033, label %else1034
then1033:
  %t3630 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t3630
else1034:
  %t3631 = call i64 @rt_make_string(ptr @.str.lit.9, i64 6)
  %t3632 = call i64 @rt_string_eq(i64 %a0, i64 %t3631)
  %t3633 = icmp ne i64 %t3632, 1
  br i1 %t3633, label %then1035, label %else1036
then1035:
  %t3634 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t3634
else1036:
  %t3635 = call i64 @rt_make_string(ptr @.str.lit.10, i64 3)
  %t3636 = call i64 @rt_string_eq(i64 %a0, i64 %t3635)
  %t3637 = icmp ne i64 %t3636, 1
  br i1 %t3637, label %then1037, label %else1038
then1037:
  %t3638 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t3638
else1038:
  %t3639 = call i64 @rt_make_string(ptr @.str.lit.11, i64 4)
  %t3640 = call i64 @rt_string_eq(i64 %a0, i64 %t3639)
  %t3641 = icmp ne i64 %t3640, 1
  br i1 %t3641, label %then1039, label %else1040
then1039:
  %t3642 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t3642
else1040:
  %t3643 = call i64 @rt_make_string(ptr @.str.lit.12, i64 6)
  %t3644 = call i64 @rt_string_eq(i64 %a0, i64 %t3643)
  %t3645 = icmp ne i64 %t3644, 1
  br i1 %t3645, label %then1041, label %else1042
then1041:
  %t3646 = call i64 @rt_integer_to_char(i64 1016)
  ret i64 %t3646
else1042:
  %t3647 = call i64 @rt_make_string(ptr @.str.lit.13, i64 7)
  %t3648 = call i64 @rt_string_eq(i64 %a0, i64 %t3647)
  %t3649 = icmp ne i64 %t3648, 1
  br i1 %t3649, label %then1043, label %else1044
then1043:
  %t3650 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t3650
else1044:
  %t3651 = call i64 @rt_make_string(ptr @.str.lit.14, i64 3)
  %t3652 = call i64 @rt_string_eq(i64 %a0, i64 %t3651)
  %t3653 = icmp ne i64 %t3652, 1
  br i1 %t3653, label %then1045, label %else1046
then1045:
  %t3654 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t3654
else1046:
  %t3655 = call i64 @rt_string_ref(i64 %a0, i64 0)
  ret i64 %t3655
}

define fastcc i64 @"scheme.base:code:rd-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3660 = icmp eq i64 %argc, 3
  br i1 %t3660, label %argok1048, label %arityerr1047
arityerr1047:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1048:
  %t3661 = or i64 %a2, 8
  %t3662 = and i64 %t3661, 7
  %t3663 = icmp eq i64 %t3662, 0
  br i1 %t3663, label %fixfast1049, label %fixslow1050
fixfast1049:
  %t3664 = add i64 %a2, 8
  br label %fixmerge1051
fixslow1050:
  %t3665 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1051
fixmerge1051:
  %t3666 = phi i64 [ %t3664, %fixfast1049 ], [ %t3665, %fixslow1050 ]
  %t3667 = or i64 %t3666, 8
  %t3668 = and i64 %t3667, 7
  %t3669 = icmp eq i64 %t3668, 0
  br i1 %t3669, label %fixfast1052, label %fixslow1053
fixfast1052:
  %t3670 = add i64 %t3666, 8
  br label %fixmerge1054
fixslow1053:
  %t3671 = call i64 @rt_add(i64 %t3666, i64 8)
  br label %fixmerge1054
fixmerge1054:
  %t3672 = phi i64 [ %t3670, %fixfast1052 ], [ %t3671, %fixslow1053 ]
  %t3673 = load i64, ptr @"scheme.base:rd-token-end"
  %t3674 = and i64 %t3673, -8
  %t3675 = inttoptr i64 %t3674 to ptr
  %t3676 = load i64, ptr %t3675
  %t3677 = inttoptr i64 %t3676 to ptr
  %t3678 = call fastcc i64%t3677(i64 %t3673, i64 3, i64 %a0, i64 %a1, i64 %t3672, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3679 = call i64 @rt_substring(i64 %a0, i64 %t3666, i64 %t3678)
  %t3680 = call i64 @rt_string_length(i64 %t3679)
  %t3681 = or i64 %t3680, 8
  %t3682 = and i64 %t3681, 7
  %t3683 = icmp eq i64 %t3682, 0
  br i1 %t3683, label %fixfast1055, label %fixslow1056
fixfast1055:
  %t3684 = icmp eq i64 %t3680, 8
  %t3685 = select i1 %t3684, i64 257, i64 1
  br label %fixmerge1057
fixslow1056:
  %t3686 = call i64 @rt_num_eq(i64 %t3680, i64 8)
  br label %fixmerge1057
fixmerge1057:
  %t3687 = phi i64 [ %t3685, %fixfast1055 ], [ %t3686, %fixslow1056 ]
  %t3688 = icmp ne i64 %t3687, 1
  br i1 %t3688, label %then1058, label %else1059
then1058:
  %t3689 = call i64 @rt_string_ref(i64 %a0, i64 %t3666)
  %t3690 = call i64 @rt_cons(i64 %t3689, i64 %t3678)
  ret i64 %t3690
else1059:
  %t3691 = load i64, ptr @"scheme.base:rd-char-name"
  %t3692 = and i64 %t3691, -8
  %t3693 = inttoptr i64 %t3692 to ptr
  %t3694 = load i64, ptr %t3693
  %t3695 = inttoptr i64 %t3694 to ptr
  %t3696 = call fastcc i64%t3695(i64 %t3691, i64 1, i64 %t3679, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3697 = call i64 @rt_cons(i64 %t3696, i64 %t3678)
  ret i64 %t3697
}

define fastcc i64 @"scheme.base:code:rd-quote"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3702 = icmp eq i64 %argc, 3
  br i1 %t3702, label %argok1061, label %arityerr1060
arityerr1060:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1061:
  %t3703 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3704 = and i64 %t3703, -8
  %t3705 = inttoptr i64 %t3704 to ptr
  %t3706 = load i64, ptr %t3705
  %t3707 = inttoptr i64 %t3706 to ptr
  %t3708 = call fastcc i64%t3707(i64 %t3703, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3709 = load i64, ptr @"scheme.base:rd-datum"
  %t3710 = and i64 %t3709, -8
  %t3711 = inttoptr i64 %t3710 to ptr
  %t3712 = load i64, ptr %t3711
  %t3713 = inttoptr i64 %t3712 to ptr
  %t3714 = call fastcc i64%t3713(i64 %t3709, i64 3, i64 %a0, i64 %a1, i64 %t3708, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3715 = call i64 @rt_intern(ptr @.str.sym.15)
  %t3716 = call i64 @rt_car(i64 %t3714)
  %t3717 = load i64, ptr @"scheme.base:list"
  %t3718 = and i64 %t3717, -8
  %t3719 = inttoptr i64 %t3718 to ptr
  %t3720 = load i64, ptr %t3719
  %t3721 = inttoptr i64 %t3720 to ptr
  %t3722 = call fastcc i64%t3721(i64 %t3717, i64 2, i64 %t3715, i64 %t3716, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3723 = call i64 @rt_cdr(i64 %t3714)
  %t3724 = call i64 @rt_cons(i64 %t3722, i64 %t3723)
  ret i64 %t3724
}

define fastcc i64 @"scheme.base:code:rd-quasi"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3729 = icmp eq i64 %argc, 3
  br i1 %t3729, label %argok1063, label %arityerr1062
arityerr1062:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1063:
  %t3730 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3731 = and i64 %t3730, -8
  %t3732 = inttoptr i64 %t3731 to ptr
  %t3733 = load i64, ptr %t3732
  %t3734 = inttoptr i64 %t3733 to ptr
  %t3735 = call fastcc i64%t3734(i64 %t3730, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3736 = load i64, ptr @"scheme.base:rd-datum"
  %t3737 = and i64 %t3736, -8
  %t3738 = inttoptr i64 %t3737 to ptr
  %t3739 = load i64, ptr %t3738
  %t3740 = inttoptr i64 %t3739 to ptr
  %t3741 = call fastcc i64%t3740(i64 %t3736, i64 3, i64 %a0, i64 %a1, i64 %t3735, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3742 = call i64 @rt_intern(ptr @.str.sym.16)
  %t3743 = call i64 @rt_car(i64 %t3741)
  %t3744 = load i64, ptr @"scheme.base:list"
  %t3745 = and i64 %t3744, -8
  %t3746 = inttoptr i64 %t3745 to ptr
  %t3747 = load i64, ptr %t3746
  %t3748 = inttoptr i64 %t3747 to ptr
  %t3749 = call fastcc i64%t3748(i64 %t3744, i64 2, i64 %t3742, i64 %t3743, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3750 = call i64 @rt_cdr(i64 %t3741)
  %t3751 = call i64 @rt_cons(i64 %t3749, i64 %t3750)
  ret i64 %t3751
}

define fastcc i64 @"scheme.base:code:rd-unquote"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3756 = icmp eq i64 %argc, 3
  br i1 %t3756, label %argok1065, label %arityerr1064
arityerr1064:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1065:
  %t3757 = or i64 %a2, %a1
  %t3758 = and i64 %t3757, 7
  %t3759 = icmp eq i64 %t3758, 0
  br i1 %t3759, label %fixfast1066, label %fixslow1067
fixfast1066:
  %t3760 = icmp slt i64 %a2, %a1
  %t3761 = select i1 %t3760, i64 257, i64 1
  br label %fixmerge1068
fixslow1067:
  %t3762 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge1068
fixmerge1068:
  %t3763 = phi i64 [ %t3761, %fixfast1066 ], [ %t3762, %fixslow1067 ]
  %t3764 = icmp ne i64 %t3763, 1
  br i1 %t3764, label %then1069, label %else1070
then1069:
  %t3765 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3766 = call i64 @rt_char_to_integer(i64 %t3765)
  %t3767 = or i64 %t3766, 512
  %t3768 = and i64 %t3767, 7
  %t3769 = icmp eq i64 %t3768, 0
  br i1 %t3769, label %fixfast1072, label %fixslow1073
fixfast1072:
  %t3770 = icmp eq i64 %t3766, 512
  %t3771 = select i1 %t3770, i64 257, i64 1
  br label %fixmerge1074
fixslow1073:
  %t3772 = call i64 @rt_num_eq(i64 %t3766, i64 512)
  br label %fixmerge1074
fixmerge1074:
  %t3773 = phi i64 [ %t3771, %fixfast1072 ], [ %t3772, %fixslow1073 ]
  br label %merge1071
else1070:
  br label %merge1071
merge1071:
  %t3774 = phi i64 [ %t3773, %fixmerge1074 ], [ 1, %else1070 ]
  %t3775 = icmp ne i64 %t3774, 1
  br i1 %t3775, label %then1075, label %else1076
then1075:
  %t3776 = or i64 %a2, 8
  %t3777 = and i64 %t3776, 7
  %t3778 = icmp eq i64 %t3777, 0
  br i1 %t3778, label %fixfast1077, label %fixslow1078
fixfast1077:
  %t3779 = add i64 %a2, 8
  br label %fixmerge1079
fixslow1078:
  %t3780 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1079
fixmerge1079:
  %t3781 = phi i64 [ %t3779, %fixfast1077 ], [ %t3780, %fixslow1078 ]
  %t3782 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3783 = and i64 %t3782, -8
  %t3784 = inttoptr i64 %t3783 to ptr
  %t3785 = load i64, ptr %t3784
  %t3786 = inttoptr i64 %t3785 to ptr
  %t3787 = call fastcc i64%t3786(i64 %t3782, i64 3, i64 %a0, i64 %a1, i64 %t3781, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3788 = load i64, ptr @"scheme.base:rd-datum"
  %t3789 = and i64 %t3788, -8
  %t3790 = inttoptr i64 %t3789 to ptr
  %t3791 = load i64, ptr %t3790
  %t3792 = inttoptr i64 %t3791 to ptr
  %t3793 = call fastcc i64%t3792(i64 %t3788, i64 3, i64 %a0, i64 %a1, i64 %t3787, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3794 = call i64 @rt_intern(ptr @.str.sym.17)
  %t3795 = call i64 @rt_car(i64 %t3793)
  %t3796 = load i64, ptr @"scheme.base:list"
  %t3797 = and i64 %t3796, -8
  %t3798 = inttoptr i64 %t3797 to ptr
  %t3799 = load i64, ptr %t3798
  %t3800 = inttoptr i64 %t3799 to ptr
  %t3801 = call fastcc i64%t3800(i64 %t3796, i64 2, i64 %t3794, i64 %t3795, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3802 = call i64 @rt_cdr(i64 %t3793)
  %t3803 = call i64 @rt_cons(i64 %t3801, i64 %t3802)
  ret i64 %t3803
else1076:
  %t3804 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3805 = and i64 %t3804, -8
  %t3806 = inttoptr i64 %t3805 to ptr
  %t3807 = load i64, ptr %t3806
  %t3808 = inttoptr i64 %t3807 to ptr
  %t3809 = call fastcc i64%t3808(i64 %t3804, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3810 = load i64, ptr @"scheme.base:rd-datum"
  %t3811 = and i64 %t3810, -8
  %t3812 = inttoptr i64 %t3811 to ptr
  %t3813 = load i64, ptr %t3812
  %t3814 = inttoptr i64 %t3813 to ptr
  %t3815 = call fastcc i64%t3814(i64 %t3810, i64 3, i64 %a0, i64 %a1, i64 %t3809, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3816 = call i64 @rt_intern(ptr @.str.sym.18)
  %t3817 = call i64 @rt_car(i64 %t3815)
  %t3818 = load i64, ptr @"scheme.base:list"
  %t3819 = and i64 %t3818, -8
  %t3820 = inttoptr i64 %t3819 to ptr
  %t3821 = load i64, ptr %t3820
  %t3822 = inttoptr i64 %t3821 to ptr
  %t3823 = call fastcc i64%t3822(i64 %t3818, i64 2, i64 %t3816, i64 %t3817, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3824 = call i64 @rt_cdr(i64 %t3815)
  %t3825 = call i64 @rt_cons(i64 %t3823, i64 %t3824)
  ret i64 %t3825
}

define fastcc i64 @"scheme.base:code:rd-dot?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3830 = icmp eq i64 %argc, 3
  br i1 %t3830, label %argok1081, label %arityerr1080
arityerr1080:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1081:
  %t3831 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3832 = call i64 @rt_char_to_integer(i64 %t3831)
  %t3833 = or i64 %t3832, 368
  %t3834 = and i64 %t3833, 7
  %t3835 = icmp eq i64 %t3834, 0
  br i1 %t3835, label %fixfast1082, label %fixslow1083
fixfast1082:
  %t3836 = icmp eq i64 %t3832, 368
  %t3837 = select i1 %t3836, i64 257, i64 1
  br label %fixmerge1084
fixslow1083:
  %t3838 = call i64 @rt_num_eq(i64 %t3832, i64 368)
  br label %fixmerge1084
fixmerge1084:
  %t3839 = phi i64 [ %t3837, %fixfast1082 ], [ %t3838, %fixslow1083 ]
  %t3840 = icmp ne i64 %t3839, 1
  br i1 %t3840, label %then1085, label %else1086
then1085:
  %t3841 = or i64 %a2, 8
  %t3842 = and i64 %t3841, 7
  %t3843 = icmp eq i64 %t3842, 0
  br i1 %t3843, label %fixfast1087, label %fixslow1088
fixfast1087:
  %t3844 = add i64 %a2, 8
  br label %fixmerge1089
fixslow1088:
  %t3845 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1089
fixmerge1089:
  %t3846 = phi i64 [ %t3844, %fixfast1087 ], [ %t3845, %fixslow1088 ]
  %t3847 = load i64, ptr @"scheme.base:rd-token-end"
  %t3848 = and i64 %t3847, -8
  %t3849 = inttoptr i64 %t3848 to ptr
  %t3850 = load i64, ptr %t3849
  %t3851 = inttoptr i64 %t3850 to ptr
  %t3852 = call fastcc i64%t3851(i64 %t3847, i64 3, i64 %a0, i64 %a1, i64 %t3846, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3853 = or i64 %a2, 8
  %t3854 = and i64 %t3853, 7
  %t3855 = icmp eq i64 %t3854, 0
  br i1 %t3855, label %fixfast1090, label %fixslow1091
fixfast1090:
  %t3856 = add i64 %a2, 8
  br label %fixmerge1092
fixslow1091:
  %t3857 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1092
fixmerge1092:
  %t3858 = phi i64 [ %t3856, %fixfast1090 ], [ %t3857, %fixslow1091 ]
  %t3859 = or i64 %t3852, %t3858
  %t3860 = and i64 %t3859, 7
  %t3861 = icmp eq i64 %t3860, 0
  br i1 %t3861, label %fixfast1093, label %fixslow1094
fixfast1093:
  %t3862 = icmp eq i64 %t3852, %t3858
  %t3863 = select i1 %t3862, i64 257, i64 1
  br label %fixmerge1095
fixslow1094:
  %t3864 = call i64 @rt_num_eq(i64 %t3852, i64 %t3858)
  br label %fixmerge1095
fixmerge1095:
  %t3865 = phi i64 [ %t3863, %fixfast1093 ], [ %t3864, %fixslow1094 ]
  ret i64 %t3865
else1086:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rd-append-reverse"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3870 = icmp eq i64 %argc, 2
  br i1 %t3870, label %argok1097, label %arityerr1096
arityerr1096:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1097:
  %t3871 = call i64 @rt_null_p(i64 %a0)
  %t3872 = icmp ne i64 %t3871, 1
  br i1 %t3872, label %then1098, label %else1099
then1098:
  ret i64 %a1
else1099:
  %t3873 = call i64 @rt_cdr(i64 %a0)
  %t3874 = call i64 @rt_car(i64 %a0)
  %t3875 = call i64 @rt_cons(i64 %t3874, i64 %a1)
  %t3876 = load i64, ptr @"scheme.base:rd-append-reverse"
  %t3877 = and i64 %t3876, -8
  %t3878 = inttoptr i64 %t3877 to ptr
  %t3879 = load i64, ptr %t3878
  %t3880 = inttoptr i64 %t3879 to ptr
  %t3881 = musttail call fastcc i64 %t3880(i64 %t3876, i64 2, i64 %t3873, i64 %t3875, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3881
}

define fastcc i64 @"scheme.base:code:rd-list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3886 = icmp eq i64 %argc, 4
  br i1 %t3886, label %argok1101, label %arityerr1100
arityerr1100:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1101:
  %t3887 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3888 = and i64 %t3887, -8
  %t3889 = inttoptr i64 %t3888 to ptr
  %t3890 = load i64, ptr %t3889
  %t3891 = inttoptr i64 %t3890 to ptr
  %t3892 = call fastcc i64%t3891(i64 %t3887, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3893 = or i64 %t3892, %a1
  %t3894 = and i64 %t3893, 7
  %t3895 = icmp eq i64 %t3894, 0
  br i1 %t3895, label %fixfast1102, label %fixslow1103
fixfast1102:
  %t3896 = icmp slt i64 %t3892, %a1
  %t3897 = select i1 %t3896, i64 257, i64 1
  br label %fixmerge1104
fixslow1103:
  %t3898 = call i64 @rt_lt(i64 %t3892, i64 %a1)
  br label %fixmerge1104
fixmerge1104:
  %t3899 = phi i64 [ %t3897, %fixfast1102 ], [ %t3898, %fixslow1103 ]
  %t3900 = icmp ne i64 %t3899, 1
  br i1 %t3900, label %then1105, label %else1106
then1105:
  %t3901 = call i64 @rt_string_ref(i64 %a0, i64 %t3892)
  %t3902 = call i64 @rt_char_to_integer(i64 %t3901)
  %t3903 = or i64 %t3902, 328
  %t3904 = and i64 %t3903, 7
  %t3905 = icmp eq i64 %t3904, 0
  br i1 %t3905, label %fixfast1107, label %fixslow1108
fixfast1107:
  %t3906 = icmp eq i64 %t3902, 328
  %t3907 = select i1 %t3906, i64 257, i64 1
  br label %fixmerge1109
fixslow1108:
  %t3908 = call i64 @rt_num_eq(i64 %t3902, i64 328)
  br label %fixmerge1109
fixmerge1109:
  %t3909 = phi i64 [ %t3907, %fixfast1107 ], [ %t3908, %fixslow1108 ]
  %t3910 = icmp ne i64 %t3909, 1
  br i1 %t3910, label %then1110, label %else1111
then1110:
  br label %merge1112
else1111:
  %t3911 = or i64 %t3902, 744
  %t3912 = and i64 %t3911, 7
  %t3913 = icmp eq i64 %t3912, 0
  br i1 %t3913, label %fixfast1113, label %fixslow1114
fixfast1113:
  %t3914 = icmp eq i64 %t3902, 744
  %t3915 = select i1 %t3914, i64 257, i64 1
  br label %fixmerge1115
fixslow1114:
  %t3916 = call i64 @rt_num_eq(i64 %t3902, i64 744)
  br label %fixmerge1115
fixmerge1115:
  %t3917 = phi i64 [ %t3915, %fixfast1113 ], [ %t3916, %fixslow1114 ]
  br label %merge1112
merge1112:
  %t3918 = phi i64 [ %t3909, %then1110 ], [ %t3917, %fixmerge1115 ]
  %t3919 = icmp ne i64 %t3918, 1
  br i1 %t3919, label %then1116, label %else1117
then1116:
  %t3920 = load i64, ptr @"scheme.base:reverse"
  %t3921 = and i64 %t3920, -8
  %t3922 = inttoptr i64 %t3921 to ptr
  %t3923 = load i64, ptr %t3922
  %t3924 = inttoptr i64 %t3923 to ptr
  %t3925 = call fastcc i64%t3924(i64 %t3920, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3926 = or i64 %t3892, 8
  %t3927 = and i64 %t3926, 7
  %t3928 = icmp eq i64 %t3927, 0
  br i1 %t3928, label %fixfast1118, label %fixslow1119
fixfast1118:
  %t3929 = add i64 %t3892, 8
  br label %fixmerge1120
fixslow1119:
  %t3930 = call i64 @rt_add(i64 %t3892, i64 8)
  br label %fixmerge1120
fixmerge1120:
  %t3931 = phi i64 [ %t3929, %fixfast1118 ], [ %t3930, %fixslow1119 ]
  %t3932 = call i64 @rt_cons(i64 %t3925, i64 %t3931)
  ret i64 %t3932
else1117:
  %t3933 = load i64, ptr @"scheme.base:rd-dot?"
  %t3934 = and i64 %t3933, -8
  %t3935 = inttoptr i64 %t3934 to ptr
  %t3936 = load i64, ptr %t3935
  %t3937 = inttoptr i64 %t3936 to ptr
  %t3938 = call fastcc i64%t3937(i64 %t3933, i64 3, i64 %a0, i64 %a1, i64 %t3892, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3939 = icmp ne i64 %t3938, 1
  br i1 %t3939, label %then1121, label %else1122
then1121:
  %t3940 = or i64 %t3892, 8
  %t3941 = and i64 %t3940, 7
  %t3942 = icmp eq i64 %t3941, 0
  br i1 %t3942, label %fixfast1123, label %fixslow1124
fixfast1123:
  %t3943 = add i64 %t3892, 8
  br label %fixmerge1125
fixslow1124:
  %t3944 = call i64 @rt_add(i64 %t3892, i64 8)
  br label %fixmerge1125
fixmerge1125:
  %t3945 = phi i64 [ %t3943, %fixfast1123 ], [ %t3944, %fixslow1124 ]
  %t3946 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3947 = and i64 %t3946, -8
  %t3948 = inttoptr i64 %t3947 to ptr
  %t3949 = load i64, ptr %t3948
  %t3950 = inttoptr i64 %t3949 to ptr
  %t3951 = call fastcc i64%t3950(i64 %t3946, i64 3, i64 %a0, i64 %a1, i64 %t3945, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3952 = load i64, ptr @"scheme.base:rd-datum"
  %t3953 = and i64 %t3952, -8
  %t3954 = inttoptr i64 %t3953 to ptr
  %t3955 = load i64, ptr %t3954
  %t3956 = inttoptr i64 %t3955 to ptr
  %t3957 = call fastcc i64%t3956(i64 %t3952, i64 3, i64 %a0, i64 %a1, i64 %t3951, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3958 = call i64 @rt_cdr(i64 %t3957)
  %t3959 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3960 = and i64 %t3959, -8
  %t3961 = inttoptr i64 %t3960 to ptr
  %t3962 = load i64, ptr %t3961
  %t3963 = inttoptr i64 %t3962 to ptr
  %t3964 = call fastcc i64%t3963(i64 %t3959, i64 3, i64 %a0, i64 %a1, i64 %t3958, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3965 = call i64 @rt_car(i64 %t3957)
  %t3966 = load i64, ptr @"scheme.base:rd-append-reverse"
  %t3967 = and i64 %t3966, -8
  %t3968 = inttoptr i64 %t3967 to ptr
  %t3969 = load i64, ptr %t3968
  %t3970 = inttoptr i64 %t3969 to ptr
  %t3971 = call fastcc i64%t3970(i64 %t3966, i64 2, i64 %a3, i64 %t3965, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3972 = or i64 %t3964, 8
  %t3973 = and i64 %t3972, 7
  %t3974 = icmp eq i64 %t3973, 0
  br i1 %t3974, label %fixfast1126, label %fixslow1127
fixfast1126:
  %t3975 = add i64 %t3964, 8
  br label %fixmerge1128
fixslow1127:
  %t3976 = call i64 @rt_add(i64 %t3964, i64 8)
  br label %fixmerge1128
fixmerge1128:
  %t3977 = phi i64 [ %t3975, %fixfast1126 ], [ %t3976, %fixslow1127 ]
  %t3978 = call i64 @rt_cons(i64 %t3971, i64 %t3977)
  ret i64 %t3978
else1122:
  %t3979 = load i64, ptr @"scheme.base:rd-datum"
  %t3980 = and i64 %t3979, -8
  %t3981 = inttoptr i64 %t3980 to ptr
  %t3982 = load i64, ptr %t3981
  %t3983 = inttoptr i64 %t3982 to ptr
  %t3984 = call fastcc i64%t3983(i64 %t3979, i64 3, i64 %a0, i64 %a1, i64 %t3892, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3985 = call i64 @rt_cdr(i64 %t3984)
  %t3986 = call i64 @rt_car(i64 %t3984)
  %t3987 = call i64 @rt_cons(i64 %t3986, i64 %a3)
  %t3988 = load i64, ptr @"scheme.base:rd-list"
  %t3989 = and i64 %t3988, -8
  %t3990 = inttoptr i64 %t3989 to ptr
  %t3991 = load i64, ptr %t3990
  %t3992 = inttoptr i64 %t3991 to ptr
  %t3993 = musttail call fastcc i64 %t3992(i64 %t3988, i64 4, i64 %a0, i64 %a1, i64 %t3985, i64 %t3987, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3993
else1106:
  %t3994 = load i64, ptr @"scheme.base:reverse"
  %t3995 = and i64 %t3994, -8
  %t3996 = inttoptr i64 %t3995 to ptr
  %t3997 = load i64, ptr %t3996
  %t3998 = inttoptr i64 %t3997 to ptr
  %t3999 = call fastcc i64%t3998(i64 %t3994, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4000 = call i64 @rt_cons(i64 %t3999, i64 %t3892)
  ret i64 %t4000
}

define fastcc i64 @"scheme.base:code:rd-datum"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4005 = icmp eq i64 %argc, 3
  br i1 %t4005, label %argok1130, label %arityerr1129
arityerr1129:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1130:
  %t4006 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t4007 = call i64 @rt_char_to_integer(i64 %t4006)
  %t4008 = or i64 %t4007, 320
  %t4009 = and i64 %t4008, 7
  %t4010 = icmp eq i64 %t4009, 0
  br i1 %t4010, label %fixfast1131, label %fixslow1132
fixfast1131:
  %t4011 = icmp eq i64 %t4007, 320
  %t4012 = select i1 %t4011, i64 257, i64 1
  br label %fixmerge1133
fixslow1132:
  %t4013 = call i64 @rt_num_eq(i64 %t4007, i64 320)
  br label %fixmerge1133
fixmerge1133:
  %t4014 = phi i64 [ %t4012, %fixfast1131 ], [ %t4013, %fixslow1132 ]
  %t4015 = icmp ne i64 %t4014, 1
  br i1 %t4015, label %then1134, label %else1135
then1134:
  %t4016 = or i64 %a2, 8
  %t4017 = and i64 %t4016, 7
  %t4018 = icmp eq i64 %t4017, 0
  br i1 %t4018, label %fixfast1136, label %fixslow1137
fixfast1136:
  %t4019 = add i64 %a2, 8
  br label %fixmerge1138
fixslow1137:
  %t4020 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1138
fixmerge1138:
  %t4021 = phi i64 [ %t4019, %fixfast1136 ], [ %t4020, %fixslow1137 ]
  %t4022 = load i64, ptr @"scheme.base:rd-list"
  %t4023 = and i64 %t4022, -8
  %t4024 = inttoptr i64 %t4023 to ptr
  %t4025 = load i64, ptr %t4024
  %t4026 = inttoptr i64 %t4025 to ptr
  %t4027 = musttail call fastcc i64 %t4026(i64 %t4022, i64 4, i64 %a0, i64 %a1, i64 %t4021, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4027
else1135:
  %t4028 = or i64 %t4007, 728
  %t4029 = and i64 %t4028, 7
  %t4030 = icmp eq i64 %t4029, 0
  br i1 %t4030, label %fixfast1139, label %fixslow1140
fixfast1139:
  %t4031 = icmp eq i64 %t4007, 728
  %t4032 = select i1 %t4031, i64 257, i64 1
  br label %fixmerge1141
fixslow1140:
  %t4033 = call i64 @rt_num_eq(i64 %t4007, i64 728)
  br label %fixmerge1141
fixmerge1141:
  %t4034 = phi i64 [ %t4032, %fixfast1139 ], [ %t4033, %fixslow1140 ]
  %t4035 = icmp ne i64 %t4034, 1
  br i1 %t4035, label %then1142, label %else1143
then1142:
  %t4036 = or i64 %a2, 8
  %t4037 = and i64 %t4036, 7
  %t4038 = icmp eq i64 %t4037, 0
  br i1 %t4038, label %fixfast1144, label %fixslow1145
fixfast1144:
  %t4039 = add i64 %a2, 8
  br label %fixmerge1146
fixslow1145:
  %t4040 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1146
fixmerge1146:
  %t4041 = phi i64 [ %t4039, %fixfast1144 ], [ %t4040, %fixslow1145 ]
  %t4042 = load i64, ptr @"scheme.base:rd-list"
  %t4043 = and i64 %t4042, -8
  %t4044 = inttoptr i64 %t4043 to ptr
  %t4045 = load i64, ptr %t4044
  %t4046 = inttoptr i64 %t4045 to ptr
  %t4047 = musttail call fastcc i64 %t4046(i64 %t4042, i64 4, i64 %a0, i64 %a1, i64 %t4041, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4047
else1143:
  %t4048 = or i64 %t4007, 312
  %t4049 = and i64 %t4048, 7
  %t4050 = icmp eq i64 %t4049, 0
  br i1 %t4050, label %fixfast1147, label %fixslow1148
fixfast1147:
  %t4051 = icmp eq i64 %t4007, 312
  %t4052 = select i1 %t4051, i64 257, i64 1
  br label %fixmerge1149
fixslow1148:
  %t4053 = call i64 @rt_num_eq(i64 %t4007, i64 312)
  br label %fixmerge1149
fixmerge1149:
  %t4054 = phi i64 [ %t4052, %fixfast1147 ], [ %t4053, %fixslow1148 ]
  %t4055 = icmp ne i64 %t4054, 1
  br i1 %t4055, label %then1150, label %else1151
then1150:
  %t4056 = or i64 %a2, 8
  %t4057 = and i64 %t4056, 7
  %t4058 = icmp eq i64 %t4057, 0
  br i1 %t4058, label %fixfast1152, label %fixslow1153
fixfast1152:
  %t4059 = add i64 %a2, 8
  br label %fixmerge1154
fixslow1153:
  %t4060 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1154
fixmerge1154:
  %t4061 = phi i64 [ %t4059, %fixfast1152 ], [ %t4060, %fixslow1153 ]
  %t4062 = load i64, ptr @"scheme.base:rd-quote"
  %t4063 = and i64 %t4062, -8
  %t4064 = inttoptr i64 %t4063 to ptr
  %t4065 = load i64, ptr %t4064
  %t4066 = inttoptr i64 %t4065 to ptr
  %t4067 = musttail call fastcc i64 %t4066(i64 %t4062, i64 3, i64 %a0, i64 %a1, i64 %t4061, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4067
else1151:
  %t4068 = or i64 %t4007, 768
  %t4069 = and i64 %t4068, 7
  %t4070 = icmp eq i64 %t4069, 0
  br i1 %t4070, label %fixfast1155, label %fixslow1156
fixfast1155:
  %t4071 = icmp eq i64 %t4007, 768
  %t4072 = select i1 %t4071, i64 257, i64 1
  br label %fixmerge1157
fixslow1156:
  %t4073 = call i64 @rt_num_eq(i64 %t4007, i64 768)
  br label %fixmerge1157
fixmerge1157:
  %t4074 = phi i64 [ %t4072, %fixfast1155 ], [ %t4073, %fixslow1156 ]
  %t4075 = icmp ne i64 %t4074, 1
  br i1 %t4075, label %then1158, label %else1159
then1158:
  %t4076 = or i64 %a2, 8
  %t4077 = and i64 %t4076, 7
  %t4078 = icmp eq i64 %t4077, 0
  br i1 %t4078, label %fixfast1160, label %fixslow1161
fixfast1160:
  %t4079 = add i64 %a2, 8
  br label %fixmerge1162
fixslow1161:
  %t4080 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1162
fixmerge1162:
  %t4081 = phi i64 [ %t4079, %fixfast1160 ], [ %t4080, %fixslow1161 ]
  %t4082 = load i64, ptr @"scheme.base:rd-quasi"
  %t4083 = and i64 %t4082, -8
  %t4084 = inttoptr i64 %t4083 to ptr
  %t4085 = load i64, ptr %t4084
  %t4086 = inttoptr i64 %t4085 to ptr
  %t4087 = musttail call fastcc i64 %t4086(i64 %t4082, i64 3, i64 %a0, i64 %a1, i64 %t4081, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4087
else1159:
  %t4088 = or i64 %t4007, 352
  %t4089 = and i64 %t4088, 7
  %t4090 = icmp eq i64 %t4089, 0
  br i1 %t4090, label %fixfast1163, label %fixslow1164
fixfast1163:
  %t4091 = icmp eq i64 %t4007, 352
  %t4092 = select i1 %t4091, i64 257, i64 1
  br label %fixmerge1165
fixslow1164:
  %t4093 = call i64 @rt_num_eq(i64 %t4007, i64 352)
  br label %fixmerge1165
fixmerge1165:
  %t4094 = phi i64 [ %t4092, %fixfast1163 ], [ %t4093, %fixslow1164 ]
  %t4095 = icmp ne i64 %t4094, 1
  br i1 %t4095, label %then1166, label %else1167
then1166:
  %t4096 = or i64 %a2, 8
  %t4097 = and i64 %t4096, 7
  %t4098 = icmp eq i64 %t4097, 0
  br i1 %t4098, label %fixfast1168, label %fixslow1169
fixfast1168:
  %t4099 = add i64 %a2, 8
  br label %fixmerge1170
fixslow1169:
  %t4100 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1170
fixmerge1170:
  %t4101 = phi i64 [ %t4099, %fixfast1168 ], [ %t4100, %fixslow1169 ]
  %t4102 = load i64, ptr @"scheme.base:rd-unquote"
  %t4103 = and i64 %t4102, -8
  %t4104 = inttoptr i64 %t4103 to ptr
  %t4105 = load i64, ptr %t4104
  %t4106 = inttoptr i64 %t4105 to ptr
  %t4107 = musttail call fastcc i64 %t4106(i64 %t4102, i64 3, i64 %a0, i64 %a1, i64 %t4101, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4107
else1167:
  %t4108 = or i64 %t4007, 272
  %t4109 = and i64 %t4108, 7
  %t4110 = icmp eq i64 %t4109, 0
  br i1 %t4110, label %fixfast1171, label %fixslow1172
fixfast1171:
  %t4111 = icmp eq i64 %t4007, 272
  %t4112 = select i1 %t4111, i64 257, i64 1
  br label %fixmerge1173
fixslow1172:
  %t4113 = call i64 @rt_num_eq(i64 %t4007, i64 272)
  br label %fixmerge1173
fixmerge1173:
  %t4114 = phi i64 [ %t4112, %fixfast1171 ], [ %t4113, %fixslow1172 ]
  %t4115 = icmp ne i64 %t4114, 1
  br i1 %t4115, label %then1174, label %else1175
then1174:
  %t4116 = or i64 %a2, 8
  %t4117 = and i64 %t4116, 7
  %t4118 = icmp eq i64 %t4117, 0
  br i1 %t4118, label %fixfast1176, label %fixslow1177
fixfast1176:
  %t4119 = add i64 %a2, 8
  br label %fixmerge1178
fixslow1177:
  %t4120 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1178
fixmerge1178:
  %t4121 = phi i64 [ %t4119, %fixfast1176 ], [ %t4120, %fixslow1177 ]
  %t4122 = load i64, ptr @"scheme.base:rd-string"
  %t4123 = and i64 %t4122, -8
  %t4124 = inttoptr i64 %t4123 to ptr
  %t4125 = load i64, ptr %t4124
  %t4126 = inttoptr i64 %t4125 to ptr
  %t4127 = musttail call fastcc i64 %t4126(i64 %t4122, i64 3, i64 %a0, i64 %a1, i64 %t4121, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4127
else1175:
  %t4128 = or i64 %t4007, 280
  %t4129 = and i64 %t4128, 7
  %t4130 = icmp eq i64 %t4129, 0
  br i1 %t4130, label %fixfast1179, label %fixslow1180
fixfast1179:
  %t4131 = icmp eq i64 %t4007, 280
  %t4132 = select i1 %t4131, i64 257, i64 1
  br label %fixmerge1181
fixslow1180:
  %t4133 = call i64 @rt_num_eq(i64 %t4007, i64 280)
  br label %fixmerge1181
fixmerge1181:
  %t4134 = phi i64 [ %t4132, %fixfast1179 ], [ %t4133, %fixslow1180 ]
  %t4135 = icmp ne i64 %t4134, 1
  br i1 %t4135, label %then1182, label %else1183
then1182:
  %t4136 = or i64 %a2, 8
  %t4137 = and i64 %t4136, 7
  %t4138 = icmp eq i64 %t4137, 0
  br i1 %t4138, label %fixfast1184, label %fixslow1185
fixfast1184:
  %t4139 = add i64 %a2, 8
  br label %fixmerge1186
fixslow1185:
  %t4140 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1186
fixmerge1186:
  %t4141 = phi i64 [ %t4139, %fixfast1184 ], [ %t4140, %fixslow1185 ]
  %t4142 = load i64, ptr @"scheme.base:rd-hash"
  %t4143 = and i64 %t4142, -8
  %t4144 = inttoptr i64 %t4143 to ptr
  %t4145 = load i64, ptr %t4144
  %t4146 = inttoptr i64 %t4145 to ptr
  %t4147 = musttail call fastcc i64 %t4146(i64 %t4142, i64 3, i64 %a0, i64 %a1, i64 %t4141, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4147
else1183:
  %t4148 = load i64, ptr @"scheme.base:rd-atom"
  %t4149 = and i64 %t4148, -8
  %t4150 = inttoptr i64 %t4149 to ptr
  %t4151 = load i64, ptr %t4150
  %t4152 = inttoptr i64 %t4151 to ptr
  %t4153 = musttail call fastcc i64 %t4152(i64 %t4148, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4153
}

define fastcc i64 @"scheme.base:code:read-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4158 = icmp eq i64 %argc, 1
  br i1 %t4158, label %argok1188, label %arityerr1187
arityerr1187:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1188:
  %t4159 = call i64 @rt_string_length(i64 %a0)
  %t4160 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t4161 = and i64 %t4160, -8
  %t4162 = inttoptr i64 %t4161 to ptr
  %t4163 = load i64, ptr %t4162
  %t4164 = inttoptr i64 %t4163 to ptr
  %t4165 = call fastcc i64%t4164(i64 %t4160, i64 3, i64 %a0, i64 %t4159, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4166 = load i64, ptr @"scheme.base:rd-datum"
  %t4167 = and i64 %t4166, -8
  %t4168 = inttoptr i64 %t4167 to ptr
  %t4169 = load i64, ptr %t4168
  %t4170 = inttoptr i64 %t4169 to ptr
  %t4171 = call fastcc i64%t4170(i64 %t4166, i64 3, i64 %a0, i64 %t4159, i64 %t4165, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4172 = call i64 @rt_car(i64 %t4171)
  ret i64 %t4172
}

define fastcc i64 @"scheme.base:code_984"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4177 = icmp eq i64 %argc, 2
  br i1 %t4177, label %argok1190, label %arityerr1189
arityerr1189:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1190:
  %t4178 = and i64 %self, -8
  %t4179 = inttoptr i64 %t4178 to ptr
  %t4180 = getelementptr i64, ptr %t4179, i64 1
  %t4181 = load i64, ptr %t4180
  %t4182 = or i64 %a0, %t4181
  %t4183 = and i64 %t4182, 7
  %t4184 = icmp eq i64 %t4183, 0
  br i1 %t4184, label %fixfast1191, label %fixslow1192
fixfast1191:
  %t4185 = icmp slt i64 %a0, %t4181
  %t4186 = select i1 %t4185, i64 257, i64 1
  br label %fixmerge1193
fixslow1192:
  %t4187 = call i64 @rt_lt(i64 %a0, i64 %t4181)
  br label %fixmerge1193
fixmerge1193:
  %t4188 = phi i64 [ %t4186, %fixfast1191 ], [ %t4187, %fixslow1192 ]
  %t4189 = icmp ne i64 %t4188, 1
  br i1 %t4189, label %then1194, label %else1195
then1194:
  %t4190 = and i64 %self, -8
  %t4191 = inttoptr i64 %t4190 to ptr
  %t4192 = getelementptr i64, ptr %t4191, i64 2
  %t4193 = load i64, ptr %t4192
  %t4194 = and i64 %self, -8
  %t4195 = inttoptr i64 %t4194 to ptr
  %t4196 = getelementptr i64, ptr %t4195, i64 1
  %t4197 = load i64, ptr %t4196
  %t4198 = load i64, ptr @"scheme.base:rd-datum"
  %t4199 = and i64 %t4198, -8
  %t4200 = inttoptr i64 %t4199 to ptr
  %t4201 = load i64, ptr %t4200
  %t4202 = inttoptr i64 %t4201 to ptr
  %t4203 = call fastcc i64%t4202(i64 %t4198, i64 3, i64 %t4193, i64 %t4197, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4204 = and i64 %self, -8
  %t4205 = inttoptr i64 %t4204 to ptr
  %t4206 = getelementptr i64, ptr %t4205, i64 2
  %t4207 = load i64, ptr %t4206
  %t4208 = and i64 %self, -8
  %t4209 = inttoptr i64 %t4208 to ptr
  %t4210 = getelementptr i64, ptr %t4209, i64 1
  %t4211 = load i64, ptr %t4210
  %t4212 = call i64 @rt_cdr(i64 %t4203)
  %t4213 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t4214 = and i64 %t4213, -8
  %t4215 = inttoptr i64 %t4214 to ptr
  %t4216 = load i64, ptr %t4215
  %t4217 = inttoptr i64 %t4216 to ptr
  %t4218 = call fastcc i64%t4217(i64 %t4213, i64 3, i64 %t4207, i64 %t4211, i64 %t4212, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4219 = call i64 @rt_car(i64 %t4203)
  %t4220 = call i64 @rt_cons(i64 %t4219, i64 %a1)
  %t4221 = musttail call fastcc i64 @"scheme.base:code_984"(i64 %self, i64 2, i64 %t4218, i64 %t4220, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4221
else1195:
  %t4222 = load i64, ptr @"scheme.base:reverse"
  %t4223 = and i64 %t4222, -8
  %t4224 = inttoptr i64 %t4223 to ptr
  %t4225 = load i64, ptr %t4224
  %t4226 = inttoptr i64 %t4225 to ptr
  %t4227 = musttail call fastcc i64 %t4226(i64 %t4222, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4227
}

define fastcc i64 @"scheme.base:code:read-all-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4228 = icmp eq i64 %argc, 1
  br i1 %t4228, label %argok1197, label %arityerr1196
arityerr1196:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1197:
  %t4229 = call i64 @rt_string_length(i64 %a0)
  %t4230 = call ptr @rt_alloc_words(i64 4)
  %t4231 = ptrtoint ptr %t4230 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_984" to i64), ptr %t4230
  %t4232 = or i64 %t4231, 4
  %t4233 = getelementptr i64, ptr %t4230, i64 1
  store i64 %t4229, ptr %t4233
  %t4234 = getelementptr i64, ptr %t4230, i64 2
  store i64 %a0, ptr %t4234
  %t4235 = getelementptr i64, ptr %t4230, i64 3
  store i64 %t4232, ptr %t4235
  %t4236 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t4237 = and i64 %t4236, -8
  %t4238 = inttoptr i64 %t4237 to ptr
  %t4239 = load i64, ptr %t4238
  %t4240 = inttoptr i64 %t4239 to ptr
  %t4241 = call fastcc i64%t4240(i64 %t4236, i64 3, i64 %a0, i64 %t4229, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4242 = musttail call fastcc i64 @"scheme.base:code_984"(i64 %t4232, i64 2, i64 %t4241, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4242
}

define fastcc i64 @"scheme.base:code:%port-rtd"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4248 = icmp eq i64 %argc, 0
  br i1 %t4248, label %argok1199, label %arityerr1198
arityerr1198:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1199:
  %t4249 = load i64, ptr @"scheme.base:%port-rtd-cell"
  %t4250 = icmp ne i64 %t4249, 1
  br i1 %t4250, label %then1200, label %else1201
then1200:
  %t4251 = load i64, ptr @"scheme.base:%port-rtd-cell"
  ret i64 %t4251
else1201:
  %t4252 = call i64 @rt_make_string(ptr @.str.lit.19, i64 4)
  %t4253 = call i64 @rt_make_record_type(i64 %t4252)
  %t4254 = call i64 @rt_root(i64 %t4253)
  store i64 %t4254, ptr @"scheme.base:%port-rtd-cell"
  %t4255 = load i64, ptr @"scheme.base:%port-rtd-cell"
  ret i64 %t4255
}

define fastcc i64 @"scheme.base:code:%make-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4260 = icmp eq i64 %argc, 6
  br i1 %t4260, label %argok1203, label %arityerr1202
arityerr1202:
  call void @rt_arity_error(i64 6, i64 %argc)
  unreachable
argok1203:
  %t4261 = load i64, ptr @"scheme.base:%port-rtd"
  %t4262 = and i64 %t4261, -8
  %t4263 = inttoptr i64 %t4262 to ptr
  %t4264 = load i64, ptr %t4263
  %t4265 = inttoptr i64 %t4264 to ptr
  %t4266 = call fastcc i64%t4265(i64 %t4261, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4267 = load i64, ptr @"scheme.base:list"
  %t4268 = and i64 %t4267, -8
  %t4269 = inttoptr i64 %t4268 to ptr
  %t4270 = load i64, ptr %t4269
  %t4271 = inttoptr i64 %t4270 to ptr
  %t4272 = call fastcc i64%t4271(i64 %t4267, i64 6, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 0, i64 0, ptr null)
  %t4273 = call i64 @rt_make_record(i64 %t4266, i64 %t4272)
  ret i64 %t4273
}

define fastcc i64 @"scheme.base:code:port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4278 = icmp eq i64 %argc, 1
  br i1 %t4278, label %argok1205, label %arityerr1204
arityerr1204:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1205:
  %t4279 = load i64, ptr @"scheme.base:%port-rtd"
  %t4280 = and i64 %t4279, -8
  %t4281 = inttoptr i64 %t4280 to ptr
  %t4282 = load i64, ptr %t4281
  %t4283 = inttoptr i64 %t4282 to ptr
  %t4284 = call fastcc i64%t4283(i64 %t4279, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4285 = call i64 @rt_record_of_type_p(i64 %a0, i64 %t4284)
  ret i64 %t4285
}

define fastcc i64 @"scheme.base:code:input-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4290 = icmp eq i64 %argc, 1
  br i1 %t4290, label %argok1207, label %arityerr1206
arityerr1206:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1207:
  %t4291 = load i64, ptr @"scheme.base:port?"
  %t4292 = and i64 %t4291, -8
  %t4293 = inttoptr i64 %t4292 to ptr
  %t4294 = load i64, ptr %t4293
  %t4295 = inttoptr i64 %t4294 to ptr
  %t4296 = call fastcc i64%t4295(i64 %t4291, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4297 = icmp ne i64 %t4296, 1
  br i1 %t4297, label %then1208, label %else1209
then1208:
  %t4298 = call i64 @rt_record_ref(i64 %a0, i64 8)
  ret i64 %t4298
else1209:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4303 = icmp eq i64 %argc, 1
  br i1 %t4303, label %argok1211, label %arityerr1210
arityerr1210:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1211:
  %t4304 = load i64, ptr @"scheme.base:port?"
  %t4305 = and i64 %t4304, -8
  %t4306 = inttoptr i64 %t4305 to ptr
  %t4307 = load i64, ptr %t4306
  %t4308 = inttoptr i64 %t4307 to ptr
  %t4309 = call fastcc i64%t4308(i64 %t4304, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4310 = icmp ne i64 %t4309, 1
  br i1 %t4310, label %then1212, label %else1213
then1212:
  %t4311 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t4312 = call i64 @rt_not(i64 %t4311)
  ret i64 %t4312
else1213:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:textual-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4317 = icmp eq i64 %argc, 1
  br i1 %t4317, label %argok1215, label %arityerr1214
arityerr1214:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1215:
  %t4318 = load i64, ptr @"scheme.base:port?"
  %t4319 = and i64 %t4318, -8
  %t4320 = inttoptr i64 %t4319 to ptr
  %t4321 = load i64, ptr %t4320
  %t4322 = inttoptr i64 %t4321 to ptr
  %t4323 = musttail call fastcc i64 %t4322(i64 %t4318, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4323
}

define fastcc i64 @"scheme.base:code:port-closed?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4328 = icmp eq i64 %argc, 1
  br i1 %t4328, label %argok1217, label %arityerr1216
arityerr1216:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1217:
  %t4329 = call i64 @rt_record_ref(i64 %a0, i64 40)
  ret i64 %t4329
}

define fastcc i64 @"scheme.base:code:input-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4334 = icmp eq i64 %argc, 1
  br i1 %t4334, label %argok1219, label %arityerr1218
arityerr1218:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1219:
  %t4335 = load i64, ptr @"scheme.base:input-port?"
  %t4336 = and i64 %t4335, -8
  %t4337 = inttoptr i64 %t4336 to ptr
  %t4338 = load i64, ptr %t4337
  %t4339 = inttoptr i64 %t4338 to ptr
  %t4340 = call fastcc i64%t4339(i64 %t4335, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4341 = icmp ne i64 %t4340, 1
  br i1 %t4341, label %then1220, label %else1221
then1220:
  %t4342 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t4343 = call i64 @rt_not(i64 %t4342)
  ret i64 %t4343
else1221:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4348 = icmp eq i64 %argc, 1
  br i1 %t4348, label %argok1223, label %arityerr1222
arityerr1222:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1223:
  %t4349 = load i64, ptr @"scheme.base:output-port?"
  %t4350 = and i64 %t4349, -8
  %t4351 = inttoptr i64 %t4350 to ptr
  %t4352 = load i64, ptr %t4351
  %t4353 = inttoptr i64 %t4352 to ptr
  %t4354 = call fastcc i64%t4353(i64 %t4349, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4355 = icmp ne i64 %t4354, 1
  br i1 %t4355, label %then1224, label %else1225
then1224:
  %t4356 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t4357 = call i64 @rt_not(i64 %t4356)
  ret i64 %t4357
else1225:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%check-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4362 = icmp eq i64 %argc, 2
  br i1 %t4362, label %argok1227, label %arityerr1226
arityerr1226:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1227:
  %t4363 = load i64, ptr @"scheme.base:input-port?"
  %t4364 = and i64 %t4363, -8
  %t4365 = inttoptr i64 %t4364 to ptr
  %t4366 = load i64, ptr %t4365
  %t4367 = inttoptr i64 %t4366 to ptr
  %t4368 = call fastcc i64%t4367(i64 %t4363, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4369 = call i64 @rt_not(i64 %t4368)
  %t4370 = icmp ne i64 %t4369, 1
  br i1 %t4370, label %then1228, label %else1229
then1228:
  %t4371 = call i64 @rt_make_string(ptr @.str.lit.20, i64 17)
  %t4372 = load i64, ptr @"scheme.base:error"
  %t4373 = and i64 %t4372, -8
  %t4374 = inttoptr i64 %t4373 to ptr
  %t4375 = load i64, ptr %t4374
  %t4376 = inttoptr i64 %t4375 to ptr
  %t4377 = musttail call fastcc i64 %t4376(i64 %t4372, i64 3, i64 %a1, i64 %t4371, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4377
else1229:
  %t4378 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t4379 = icmp ne i64 %t4378, 1
  br i1 %t4379, label %then1230, label %else1231
then1230:
  %t4380 = call i64 @rt_make_string(ptr @.str.lit.21, i64 14)
  %t4381 = load i64, ptr @"scheme.base:error"
  %t4382 = and i64 %t4381, -8
  %t4383 = inttoptr i64 %t4382 to ptr
  %t4384 = load i64, ptr %t4383
  %t4385 = inttoptr i64 %t4384 to ptr
  %t4386 = musttail call fastcc i64 %t4385(i64 %t4381, i64 3, i64 %a1, i64 %t4380, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4386
else1231:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:%check-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4391 = icmp eq i64 %argc, 2
  br i1 %t4391, label %argok1233, label %arityerr1232
arityerr1232:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1233:
  %t4392 = load i64, ptr @"scheme.base:output-port?"
  %t4393 = and i64 %t4392, -8
  %t4394 = inttoptr i64 %t4393 to ptr
  %t4395 = load i64, ptr %t4394
  %t4396 = inttoptr i64 %t4395 to ptr
  %t4397 = call fastcc i64%t4396(i64 %t4392, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4398 = call i64 @rt_not(i64 %t4397)
  %t4399 = icmp ne i64 %t4398, 1
  br i1 %t4399, label %then1234, label %else1235
then1234:
  %t4400 = call i64 @rt_make_string(ptr @.str.lit.22, i64 18)
  %t4401 = load i64, ptr @"scheme.base:error"
  %t4402 = and i64 %t4401, -8
  %t4403 = inttoptr i64 %t4402 to ptr
  %t4404 = load i64, ptr %t4403
  %t4405 = inttoptr i64 %t4404 to ptr
  %t4406 = musttail call fastcc i64 %t4405(i64 %t4401, i64 3, i64 %a1, i64 %t4400, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4406
else1235:
  %t4407 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t4408 = icmp ne i64 %t4407, 1
  br i1 %t4408, label %then1236, label %else1237
then1236:
  %t4409 = call i64 @rt_make_string(ptr @.str.lit.23, i64 14)
  %t4410 = load i64, ptr @"scheme.base:error"
  %t4411 = and i64 %t4410, -8
  %t4412 = inttoptr i64 %t4411 to ptr
  %t4413 = load i64, ptr %t4412
  %t4414 = inttoptr i64 %t4413 to ptr
  %t4415 = musttail call fastcc i64 %t4414(i64 %t4410, i64 3, i64 %a1, i64 %t4409, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4415
else1237:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:%port-buf"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4420 = icmp eq i64 %argc, 1
  br i1 %t4420, label %argok1239, label %arityerr1238
arityerr1238:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1239:
  %t4421 = call i64 @rt_record_ref(i64 %a0, i64 16)
  %t4422 = icmp ne i64 %t4421, 1
  br i1 %t4422, label %then1240, label %else1241
then1240:
  ret i64 %t4421
else1241:
  %t4423 = call i64 @rt_read_all_stdin()
  %t4424 = call i64 @rt_record_set(i64 %a0, i64 16, i64 %t4423)
  ret i64 %t4423
}

define fastcc i64 @"scheme.base:code:open-input-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4429 = icmp eq i64 %argc, 1
  br i1 %t4429, label %argok1243, label %arityerr1242
arityerr1242:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1243:
  %t4430 = load i64, ptr @"scheme.base:%make-port"
  %t4431 = and i64 %t4430, -8
  %t4432 = inttoptr i64 %t4431 to ptr
  %t4433 = load i64, ptr %t4432
  %t4434 = inttoptr i64 %t4433 to ptr
  %t4435 = musttail call fastcc i64 %t4434(i64 %t4430, i64 6, i64 1, i64 257, i64 %a0, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t4435
}

define fastcc i64 @"scheme.base:code:open-input-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4440 = icmp eq i64 %argc, 1
  br i1 %t4440, label %argok1245, label %arityerr1244
arityerr1244:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1245:
  %t4441 = call i64 @rt_read_file(i64 %a0)
  %t4442 = icmp ne i64 %t4441, 1
  br i1 %t4442, label %then1246, label %else1247
then1246:
  %t4443 = load i64, ptr @"scheme.base:%make-port"
  %t4444 = and i64 %t4443, -8
  %t4445 = inttoptr i64 %t4444 to ptr
  %t4446 = load i64, ptr %t4445
  %t4447 = inttoptr i64 %t4446 to ptr
  %t4448 = musttail call fastcc i64 %t4447(i64 %t4443, i64 6, i64 1, i64 257, i64 %t4441, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t4448
else1247:
  %t4449 = call i64 @rt_intern(ptr @.str.sym.24)
  %t4450 = call i64 @rt_make_string(ptr @.str.lit.25, i64 26)
  %t4451 = load i64, ptr @"scheme.base:error"
  %t4452 = and i64 %t4451, -8
  %t4453 = inttoptr i64 %t4452 to ptr
  %t4454 = load i64, ptr %t4453
  %t4455 = inttoptr i64 %t4454 to ptr
  %t4456 = musttail call fastcc i64 %t4455(i64 %t4451, i64 3, i64 %t4449, i64 %t4450, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4456
}

define fastcc i64 @"scheme.base:code:%port-at-eof?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4461 = icmp eq i64 %argc, 1
  br i1 %t4461, label %argok1249, label %arityerr1248
arityerr1248:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1249:
  %t4462 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t4463 = load i64, ptr @"scheme.base:%port-buf"
  %t4464 = and i64 %t4463, -8
  %t4465 = inttoptr i64 %t4464 to ptr
  %t4466 = load i64, ptr %t4465
  %t4467 = inttoptr i64 %t4466 to ptr
  %t4468 = call fastcc i64%t4467(i64 %t4463, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4469 = call i64 @rt_string_length(i64 %t4468)
  %t4470 = or i64 %t4469, %t4462
  %t4471 = and i64 %t4470, 7
  %t4472 = icmp eq i64 %t4471, 0
  br i1 %t4472, label %fixfast1250, label %fixslow1251
fixfast1250:
  %t4473 = icmp slt i64 %t4469, %t4462
  %t4474 = select i1 %t4473, i64 257, i64 1
  br label %fixmerge1252
fixslow1251:
  %t4475 = call i64 @rt_lt(i64 %t4469, i64 %t4462)
  br label %fixmerge1252
fixmerge1252:
  %t4476 = phi i64 [ %t4474, %fixfast1250 ], [ %t4475, %fixslow1251 ]
  %t4477 = icmp ne i64 %t4476, 1
  br i1 %t4477, label %then1253, label %else1254
then1253:
  ret i64 257
else1254:
  %t4478 = or i64 %t4462, %t4469
  %t4479 = and i64 %t4478, 7
  %t4480 = icmp eq i64 %t4479, 0
  br i1 %t4480, label %fixfast1255, label %fixslow1256
fixfast1255:
  %t4481 = icmp eq i64 %t4462, %t4469
  %t4482 = select i1 %t4481, i64 257, i64 1
  br label %fixmerge1257
fixslow1256:
  %t4483 = call i64 @rt_num_eq(i64 %t4462, i64 %t4469)
  br label %fixmerge1257
fixmerge1257:
  %t4484 = phi i64 [ %t4482, %fixfast1255 ], [ %t4483, %fixslow1256 ]
  ret i64 %t4484
}

define fastcc i64 @"scheme.base:code:read-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4489 = icmp eq i64 %argc, 1
  br i1 %t4489, label %argok1259, label %arityerr1258
arityerr1258:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1259:
  %t4490 = call i64 @rt_intern(ptr @.str.sym.26)
  %t4491 = load i64, ptr @"scheme.base:%check-input-port"
  %t4492 = and i64 %t4491, -8
  %t4493 = inttoptr i64 %t4492 to ptr
  %t4494 = load i64, ptr %t4493
  %t4495 = inttoptr i64 %t4494 to ptr
  %t4496 = call fastcc i64%t4495(i64 %t4491, i64 2, i64 %a0, i64 %t4490, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4497 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t4498 = and i64 %t4497, -8
  %t4499 = inttoptr i64 %t4498 to ptr
  %t4500 = load i64, ptr %t4499
  %t4501 = inttoptr i64 %t4500 to ptr
  %t4502 = call fastcc i64%t4501(i64 %t4497, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4503 = icmp ne i64 %t4502, 1
  br i1 %t4503, label %then1260, label %else1261
then1260:
  %t4504 = call i64 @rt_eof_object()
  ret i64 %t4504
else1261:
  %t4505 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t4506 = or i64 %t4505, 8
  %t4507 = and i64 %t4506, 7
  %t4508 = icmp eq i64 %t4507, 0
  br i1 %t4508, label %fixfast1262, label %fixslow1263
fixfast1262:
  %t4509 = add i64 %t4505, 8
  br label %fixmerge1264
fixslow1263:
  %t4510 = call i64 @rt_add(i64 %t4505, i64 8)
  br label %fixmerge1264
fixmerge1264:
  %t4511 = phi i64 [ %t4509, %fixfast1262 ], [ %t4510, %fixslow1263 ]
  %t4512 = call i64 @rt_record_set(i64 %a0, i64 24, i64 %t4511)
  %t4513 = load i64, ptr @"scheme.base:%port-buf"
  %t4514 = and i64 %t4513, -8
  %t4515 = inttoptr i64 %t4514 to ptr
  %t4516 = load i64, ptr %t4515
  %t4517 = inttoptr i64 %t4516 to ptr
  %t4518 = call fastcc i64%t4517(i64 %t4513, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4519 = call i64 @rt_string_ref(i64 %t4518, i64 %t4505)
  ret i64 %t4519
}

define fastcc i64 @"scheme.base:code:peek-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4524 = icmp eq i64 %argc, 1
  br i1 %t4524, label %argok1266, label %arityerr1265
arityerr1265:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1266:
  %t4525 = call i64 @rt_intern(ptr @.str.sym.27)
  %t4526 = load i64, ptr @"scheme.base:%check-input-port"
  %t4527 = and i64 %t4526, -8
  %t4528 = inttoptr i64 %t4527 to ptr
  %t4529 = load i64, ptr %t4528
  %t4530 = inttoptr i64 %t4529 to ptr
  %t4531 = call fastcc i64%t4530(i64 %t4526, i64 2, i64 %a0, i64 %t4525, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4532 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t4533 = and i64 %t4532, -8
  %t4534 = inttoptr i64 %t4533 to ptr
  %t4535 = load i64, ptr %t4534
  %t4536 = inttoptr i64 %t4535 to ptr
  %t4537 = call fastcc i64%t4536(i64 %t4532, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4538 = icmp ne i64 %t4537, 1
  br i1 %t4538, label %then1267, label %else1268
then1267:
  %t4539 = call i64 @rt_eof_object()
  ret i64 %t4539
else1268:
  %t4540 = load i64, ptr @"scheme.base:%port-buf"
  %t4541 = and i64 %t4540, -8
  %t4542 = inttoptr i64 %t4541 to ptr
  %t4543 = load i64, ptr %t4542
  %t4544 = inttoptr i64 %t4543 to ptr
  %t4545 = call fastcc i64%t4544(i64 %t4540, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4546 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t4547 = call i64 @rt_string_ref(i64 %t4545, i64 %t4546)
  ret i64 %t4547
}

define fastcc i64 @"scheme.base:code_1046"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4552 = icmp eq i64 %argc, 1
  br i1 %t4552, label %argok1270, label %arityerr1269
arityerr1269:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1270:
  %t4553 = and i64 %self, -8
  %t4554 = inttoptr i64 %t4553 to ptr
  %t4555 = getelementptr i64, ptr %t4554, i64 1
  %t4556 = load i64, ptr %t4555
  %t4557 = or i64 %t4556, %a0
  %t4558 = and i64 %t4557, 7
  %t4559 = icmp eq i64 %t4558, 0
  br i1 %t4559, label %fixfast1271, label %fixslow1272
fixfast1271:
  %t4560 = icmp slt i64 %t4556, %a0
  %t4561 = select i1 %t4560, i64 257, i64 1
  br label %fixmerge1273
fixslow1272:
  %t4562 = call i64 @rt_lt(i64 %t4556, i64 %a0)
  br label %fixmerge1273
fixmerge1273:
  %t4563 = phi i64 [ %t4561, %fixfast1271 ], [ %t4562, %fixslow1272 ]
  %t4564 = icmp ne i64 %t4563, 1
  br i1 %t4564, label %then1274, label %else1275
then1274:
  br label %merge1276
else1275:
  %t4565 = or i64 %a0, %t4556
  %t4566 = and i64 %t4565, 7
  %t4567 = icmp eq i64 %t4566, 0
  br i1 %t4567, label %fixfast1277, label %fixslow1278
fixfast1277:
  %t4568 = icmp eq i64 %a0, %t4556
  %t4569 = select i1 %t4568, i64 257, i64 1
  br label %fixmerge1279
fixslow1278:
  %t4570 = call i64 @rt_num_eq(i64 %a0, i64 %t4556)
  br label %fixmerge1279
fixmerge1279:
  %t4571 = phi i64 [ %t4569, %fixfast1277 ], [ %t4570, %fixslow1278 ]
  br label %merge1276
merge1276:
  %t4572 = phi i64 [ 257, %then1274 ], [ %t4571, %fixmerge1279 ]
  %t4573 = icmp ne i64 %t4572, 1
  br i1 %t4573, label %then1280, label %else1281
then1280:
  %t4574 = and i64 %self, -8
  %t4575 = inttoptr i64 %t4574 to ptr
  %t4576 = getelementptr i64, ptr %t4575, i64 2
  %t4577 = load i64, ptr %t4576
  %t4578 = call i64 @rt_record_ref(i64 %t4577, i64 24)
  %t4579 = and i64 %self, -8
  %t4580 = inttoptr i64 %t4579 to ptr
  %t4581 = getelementptr i64, ptr %t4580, i64 2
  %t4582 = load i64, ptr %t4581
  %t4583 = and i64 %self, -8
  %t4584 = inttoptr i64 %t4583 to ptr
  %t4585 = getelementptr i64, ptr %t4584, i64 1
  %t4586 = load i64, ptr %t4585
  %t4587 = call i64 @rt_record_set(i64 %t4582, i64 24, i64 %t4586)
  %t4588 = and i64 %self, -8
  %t4589 = inttoptr i64 %t4588 to ptr
  %t4590 = getelementptr i64, ptr %t4589, i64 3
  %t4591 = load i64, ptr %t4590
  %t4592 = and i64 %self, -8
  %t4593 = inttoptr i64 %t4592 to ptr
  %t4594 = getelementptr i64, ptr %t4593, i64 1
  %t4595 = load i64, ptr %t4594
  %t4596 = call i64 @rt_substring(i64 %t4591, i64 %t4578, i64 %t4595)
  ret i64 %t4596
else1281:
  %t4597 = and i64 %self, -8
  %t4598 = inttoptr i64 %t4597 to ptr
  %t4599 = getelementptr i64, ptr %t4598, i64 3
  %t4600 = load i64, ptr %t4599
  %t4601 = call i64 @rt_string_ref(i64 %t4600, i64 %a0)
  %t4602 = load i64, ptr @"scheme.base:char=?"
  %t4603 = and i64 %t4602, -8
  %t4604 = inttoptr i64 %t4603 to ptr
  %t4605 = load i64, ptr %t4604
  %t4606 = inttoptr i64 %t4605 to ptr
  %t4607 = call fastcc i64%t4606(i64 %t4602, i64 2, i64 %t4601, i64 2569, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4608 = icmp ne i64 %t4607, 1
  br i1 %t4608, label %then1282, label %else1283
then1282:
  %t4609 = and i64 %self, -8
  %t4610 = inttoptr i64 %t4609 to ptr
  %t4611 = getelementptr i64, ptr %t4610, i64 2
  %t4612 = load i64, ptr %t4611
  %t4613 = call i64 @rt_record_ref(i64 %t4612, i64 24)
  %t4614 = and i64 %self, -8
  %t4615 = inttoptr i64 %t4614 to ptr
  %t4616 = getelementptr i64, ptr %t4615, i64 2
  %t4617 = load i64, ptr %t4616
  %t4618 = or i64 %a0, 8
  %t4619 = and i64 %t4618, 7
  %t4620 = icmp eq i64 %t4619, 0
  br i1 %t4620, label %fixfast1284, label %fixslow1285
fixfast1284:
  %t4621 = add i64 %a0, 8
  br label %fixmerge1286
fixslow1285:
  %t4622 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1286
fixmerge1286:
  %t4623 = phi i64 [ %t4621, %fixfast1284 ], [ %t4622, %fixslow1285 ]
  %t4624 = call i64 @rt_record_set(i64 %t4617, i64 24, i64 %t4623)
  %t4625 = and i64 %self, -8
  %t4626 = inttoptr i64 %t4625 to ptr
  %t4627 = getelementptr i64, ptr %t4626, i64 3
  %t4628 = load i64, ptr %t4627
  %t4629 = call i64 @rt_substring(i64 %t4628, i64 %t4613, i64 %a0)
  ret i64 %t4629
else1283:
  %t4630 = or i64 %a0, 8
  %t4631 = and i64 %t4630, 7
  %t4632 = icmp eq i64 %t4631, 0
  br i1 %t4632, label %fixfast1287, label %fixslow1288
fixfast1287:
  %t4633 = add i64 %a0, 8
  br label %fixmerge1289
fixslow1288:
  %t4634 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1289
fixmerge1289:
  %t4635 = phi i64 [ %t4633, %fixfast1287 ], [ %t4634, %fixslow1288 ]
  %t4636 = musttail call fastcc i64 @"scheme.base:code_1046"(i64 %self, i64 1, i64 %t4635, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4636
}

define fastcc i64 @"scheme.base:code:read-line"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4637 = icmp eq i64 %argc, 1
  br i1 %t4637, label %argok1291, label %arityerr1290
arityerr1290:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1291:
  %t4638 = call i64 @rt_intern(ptr @.str.sym.28)
  %t4639 = load i64, ptr @"scheme.base:%check-input-port"
  %t4640 = and i64 %t4639, -8
  %t4641 = inttoptr i64 %t4640 to ptr
  %t4642 = load i64, ptr %t4641
  %t4643 = inttoptr i64 %t4642 to ptr
  %t4644 = call fastcc i64%t4643(i64 %t4639, i64 2, i64 %a0, i64 %t4638, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4645 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t4646 = and i64 %t4645, -8
  %t4647 = inttoptr i64 %t4646 to ptr
  %t4648 = load i64, ptr %t4647
  %t4649 = inttoptr i64 %t4648 to ptr
  %t4650 = call fastcc i64%t4649(i64 %t4645, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4651 = icmp ne i64 %t4650, 1
  br i1 %t4651, label %then1292, label %else1293
then1292:
  %t4652 = call i64 @rt_eof_object()
  ret i64 %t4652
else1293:
  %t4653 = load i64, ptr @"scheme.base:%port-buf"
  %t4654 = and i64 %t4653, -8
  %t4655 = inttoptr i64 %t4654 to ptr
  %t4656 = load i64, ptr %t4655
  %t4657 = inttoptr i64 %t4656 to ptr
  %t4658 = call fastcc i64%t4657(i64 %t4653, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4659 = call i64 @rt_string_length(i64 %t4658)
  %t4660 = call ptr @rt_alloc_words(i64 5)
  %t4661 = ptrtoint ptr %t4660 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1046" to i64), ptr %t4660
  %t4662 = or i64 %t4661, 4
  %t4663 = getelementptr i64, ptr %t4660, i64 1
  store i64 %t4659, ptr %t4663
  %t4664 = getelementptr i64, ptr %t4660, i64 2
  store i64 %a0, ptr %t4664
  %t4665 = getelementptr i64, ptr %t4660, i64 3
  store i64 %t4658, ptr %t4665
  %t4666 = getelementptr i64, ptr %t4660, i64 4
  store i64 %t4662, ptr %t4666
  %t4667 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t4668 = musttail call fastcc i64 @"scheme.base:code_1046"(i64 %t4662, i64 1, i64 %t4667, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4668
}

define fastcc i64 @"scheme.base:code:read-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4673 = icmp eq i64 %argc, 2
  br i1 %t4673, label %argok1295, label %arityerr1294
arityerr1294:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1295:
  %t4674 = call i64 @rt_intern(ptr @.str.sym.29)
  %t4675 = load i64, ptr @"scheme.base:%check-input-port"
  %t4676 = and i64 %t4675, -8
  %t4677 = inttoptr i64 %t4676 to ptr
  %t4678 = load i64, ptr %t4677
  %t4679 = inttoptr i64 %t4678 to ptr
  %t4680 = call fastcc i64%t4679(i64 %t4675, i64 2, i64 %a1, i64 %t4674, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4681 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t4682 = and i64 %t4681, -8
  %t4683 = inttoptr i64 %t4682 to ptr
  %t4684 = load i64, ptr %t4683
  %t4685 = inttoptr i64 %t4684 to ptr
  %t4686 = call fastcc i64%t4685(i64 %t4681, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4687 = icmp ne i64 %t4686, 1
  br i1 %t4687, label %then1296, label %else1297
then1296:
  %t4688 = call i64 @rt_eof_object()
  ret i64 %t4688
else1297:
  %t4689 = load i64, ptr @"scheme.base:%port-buf"
  %t4690 = and i64 %t4689, -8
  %t4691 = inttoptr i64 %t4690 to ptr
  %t4692 = load i64, ptr %t4691
  %t4693 = inttoptr i64 %t4692 to ptr
  %t4694 = call fastcc i64%t4693(i64 %t4689, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4695 = call i64 @rt_string_length(i64 %t4694)
  %t4696 = call i64 @rt_record_ref(i64 %a1, i64 24)
  %t4697 = or i64 %t4696, %a0
  %t4698 = and i64 %t4697, 7
  %t4699 = icmp eq i64 %t4698, 0
  br i1 %t4699, label %fixfast1298, label %fixslow1299
fixfast1298:
  %t4700 = add i64 %t4696, %a0
  br label %fixmerge1300
fixslow1299:
  %t4701 = call i64 @rt_add(i64 %t4696, i64 %a0)
  br label %fixmerge1300
fixmerge1300:
  %t4702 = phi i64 [ %t4700, %fixfast1298 ], [ %t4701, %fixslow1299 ]
  %t4703 = or i64 %t4695, %t4702
  %t4704 = and i64 %t4703, 7
  %t4705 = icmp eq i64 %t4704, 0
  br i1 %t4705, label %fixfast1301, label %fixslow1302
fixfast1301:
  %t4706 = icmp slt i64 %t4695, %t4702
  %t4707 = select i1 %t4706, i64 257, i64 1
  br label %fixmerge1303
fixslow1302:
  %t4708 = call i64 @rt_lt(i64 %t4695, i64 %t4702)
  br label %fixmerge1303
fixmerge1303:
  %t4709 = phi i64 [ %t4707, %fixfast1301 ], [ %t4708, %fixslow1302 ]
  %t4710 = icmp ne i64 %t4709, 1
  br i1 %t4710, label %then1304, label %else1305
then1304:
  br label %merge1306
else1305:
  %t4711 = or i64 %t4696, %a0
  %t4712 = and i64 %t4711, 7
  %t4713 = icmp eq i64 %t4712, 0
  br i1 %t4713, label %fixfast1307, label %fixslow1308
fixfast1307:
  %t4714 = add i64 %t4696, %a0
  br label %fixmerge1309
fixslow1308:
  %t4715 = call i64 @rt_add(i64 %t4696, i64 %a0)
  br label %fixmerge1309
fixmerge1309:
  %t4716 = phi i64 [ %t4714, %fixfast1307 ], [ %t4715, %fixslow1308 ]
  br label %merge1306
merge1306:
  %t4717 = phi i64 [ %t4695, %then1304 ], [ %t4716, %fixmerge1309 ]
  %t4718 = call i64 @rt_record_set(i64 %a1, i64 24, i64 %t4717)
  %t4719 = call i64 @rt_substring(i64 %t4694, i64 %t4696, i64 %t4717)
  ret i64 %t4719
}

define fastcc i64 @"scheme.base:code:read"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4724 = icmp eq i64 %argc, 1
  br i1 %t4724, label %argok1311, label %arityerr1310
arityerr1310:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1311:
  %t4725 = call i64 @rt_intern(ptr @.str.sym.30)
  %t4726 = load i64, ptr @"scheme.base:%check-input-port"
  %t4727 = and i64 %t4726, -8
  %t4728 = inttoptr i64 %t4727 to ptr
  %t4729 = load i64, ptr %t4728
  %t4730 = inttoptr i64 %t4729 to ptr
  %t4731 = call fastcc i64%t4730(i64 %t4726, i64 2, i64 %a0, i64 %t4725, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4732 = load i64, ptr @"scheme.base:%port-buf"
  %t4733 = and i64 %t4732, -8
  %t4734 = inttoptr i64 %t4733 to ptr
  %t4735 = load i64, ptr %t4734
  %t4736 = inttoptr i64 %t4735 to ptr
  %t4737 = call fastcc i64%t4736(i64 %t4732, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4738 = call i64 @rt_string_length(i64 %t4737)
  %t4739 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t4740 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t4741 = and i64 %t4740, -8
  %t4742 = inttoptr i64 %t4741 to ptr
  %t4743 = load i64, ptr %t4742
  %t4744 = inttoptr i64 %t4743 to ptr
  %t4745 = call fastcc i64%t4744(i64 %t4740, i64 3, i64 %t4737, i64 %t4738, i64 %t4739, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4746 = or i64 %t4738, %t4745
  %t4747 = and i64 %t4746, 7
  %t4748 = icmp eq i64 %t4747, 0
  br i1 %t4748, label %fixfast1312, label %fixslow1313
fixfast1312:
  %t4749 = icmp slt i64 %t4738, %t4745
  %t4750 = select i1 %t4749, i64 257, i64 1
  br label %fixmerge1314
fixslow1313:
  %t4751 = call i64 @rt_lt(i64 %t4738, i64 %t4745)
  br label %fixmerge1314
fixmerge1314:
  %t4752 = phi i64 [ %t4750, %fixfast1312 ], [ %t4751, %fixslow1313 ]
  %t4753 = icmp ne i64 %t4752, 1
  br i1 %t4753, label %then1315, label %else1316
then1315:
  br label %merge1317
else1316:
  %t4754 = or i64 %t4745, %t4738
  %t4755 = and i64 %t4754, 7
  %t4756 = icmp eq i64 %t4755, 0
  br i1 %t4756, label %fixfast1318, label %fixslow1319
fixfast1318:
  %t4757 = icmp eq i64 %t4745, %t4738
  %t4758 = select i1 %t4757, i64 257, i64 1
  br label %fixmerge1320
fixslow1319:
  %t4759 = call i64 @rt_num_eq(i64 %t4745, i64 %t4738)
  br label %fixmerge1320
fixmerge1320:
  %t4760 = phi i64 [ %t4758, %fixfast1318 ], [ %t4759, %fixslow1319 ]
  br label %merge1317
merge1317:
  %t4761 = phi i64 [ 257, %then1315 ], [ %t4760, %fixmerge1320 ]
  %t4762 = icmp ne i64 %t4761, 1
  br i1 %t4762, label %then1321, label %else1322
then1321:
  %t4763 = call i64 @rt_record_set(i64 %a0, i64 24, i64 %t4738)
  %t4764 = call i64 @rt_eof_object()
  ret i64 %t4764
else1322:
  %t4765 = load i64, ptr @"scheme.base:rd-datum"
  %t4766 = and i64 %t4765, -8
  %t4767 = inttoptr i64 %t4766 to ptr
  %t4768 = load i64, ptr %t4767
  %t4769 = inttoptr i64 %t4768 to ptr
  %t4770 = call fastcc i64%t4769(i64 %t4765, i64 3, i64 %t4737, i64 %t4738, i64 %t4745, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4771 = call i64 @rt_cdr(i64 %t4770)
  %t4772 = call i64 @rt_record_set(i64 %a0, i64 24, i64 %t4771)
  %t4773 = call i64 @rt_car(i64 %t4770)
  ret i64 %t4773
}

define fastcc i64 @"scheme.base:code:open-output-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4778 = icmp eq i64 %argc, 1
  br i1 %t4778, label %argok1324, label %arityerr1323
arityerr1323:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1324:
  %t4779 = call i64 @rt_port_open_output_file(i64 %a0)
  %t4780 = icmp ne i64 %t4779, 1
  br i1 %t4780, label %then1325, label %else1326
then1325:
  %t4781 = load i64, ptr @"scheme.base:%make-port"
  %t4782 = and i64 %t4781, -8
  %t4783 = inttoptr i64 %t4782 to ptr
  %t4784 = load i64, ptr %t4783
  %t4785 = inttoptr i64 %t4784 to ptr
  %t4786 = musttail call fastcc i64 %t4785(i64 %t4781, i64 6, i64 %t4779, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t4786
else1326:
  %t4787 = call i64 @rt_intern(ptr @.str.sym.31)
  %t4788 = call i64 @rt_make_string(ptr @.str.lit.32, i64 27)
  %t4789 = load i64, ptr @"scheme.base:error"
  %t4790 = and i64 %t4789, -8
  %t4791 = inttoptr i64 %t4790 to ptr
  %t4792 = load i64, ptr %t4791
  %t4793 = inttoptr i64 %t4792 to ptr
  %t4794 = musttail call fastcc i64 %t4793(i64 %t4789, i64 3, i64 %t4787, i64 %t4788, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4794
}

define fastcc i64 @"scheme.base:code:open-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4799 = icmp eq i64 %argc, 0
  br i1 %t4799, label %argok1328, label %arityerr1327
arityerr1327:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1328:
  %t4800 = call i64 @rt_port_open_output_string()
  %t4801 = icmp ne i64 %t4800, 1
  br i1 %t4801, label %then1329, label %else1330
then1329:
  %t4802 = load i64, ptr @"scheme.base:%make-port"
  %t4803 = and i64 %t4802, -8
  %t4804 = inttoptr i64 %t4803 to ptr
  %t4805 = load i64, ptr %t4804
  %t4806 = inttoptr i64 %t4805 to ptr
  %t4807 = musttail call fastcc i64 %t4806(i64 %t4802, i64 6, i64 %t4800, i64 1, i64 1, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t4807
else1330:
  %t4808 = call i64 @rt_intern(ptr @.str.sym.33)
  %t4809 = call i64 @rt_make_string(ptr @.str.lit.34, i64 33)
  %t4810 = load i64, ptr @"scheme.base:error"
  %t4811 = and i64 %t4810, -8
  %t4812 = inttoptr i64 %t4811 to ptr
  %t4813 = load i64, ptr %t4812
  %t4814 = inttoptr i64 %t4813 to ptr
  %t4815 = musttail call fastcc i64 %t4814(i64 %t4810, i64 2, i64 %t4808, i64 %t4809, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4815
}

define fastcc i64 @"scheme.base:code:get-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4820 = icmp eq i64 %argc, 1
  br i1 %t4820, label %argok1332, label %arityerr1331
arityerr1331:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1332:
  %t4821 = load i64, ptr @"scheme.base:output-port?"
  %t4822 = and i64 %t4821, -8
  %t4823 = inttoptr i64 %t4822 to ptr
  %t4824 = load i64, ptr %t4823
  %t4825 = inttoptr i64 %t4824 to ptr
  %t4826 = call fastcc i64%t4825(i64 %t4821, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4827 = call i64 @rt_not(i64 %t4826)
  %t4828 = icmp ne i64 %t4827, 1
  br i1 %t4828, label %then1333, label %else1334
then1333:
  %t4829 = call i64 @rt_intern(ptr @.str.sym.35)
  %t4830 = call i64 @rt_make_string(ptr @.str.lit.36, i64 18)
  %t4831 = load i64, ptr @"scheme.base:error"
  %t4832 = and i64 %t4831, -8
  %t4833 = inttoptr i64 %t4832 to ptr
  %t4834 = load i64, ptr %t4833
  %t4835 = inttoptr i64 %t4834 to ptr
  %t4836 = musttail call fastcc i64 %t4835(i64 %t4831, i64 3, i64 %t4829, i64 %t4830, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4836
else1334:
  %t4837 = call i64 @rt_record_ref(i64 %a0, i64 32)
  %t4838 = call i64 @rt_not(i64 %t4837)
  %t4839 = icmp ne i64 %t4838, 1
  br i1 %t4839, label %then1335, label %else1336
then1335:
  %t4840 = call i64 @rt_intern(ptr @.str.sym.35)
  %t4841 = call i64 @rt_make_string(ptr @.str.lit.37, i64 17)
  %t4842 = load i64, ptr @"scheme.base:error"
  %t4843 = and i64 %t4842, -8
  %t4844 = inttoptr i64 %t4843 to ptr
  %t4845 = load i64, ptr %t4844
  %t4846 = inttoptr i64 %t4845 to ptr
  %t4847 = musttail call fastcc i64 %t4846(i64 %t4842, i64 3, i64 %t4840, i64 %t4841, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4847
else1336:
  %t4848 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t4849 = call i64 @rt_port_get_output_string(i64 %t4848)
  ret i64 %t4849
}

define fastcc i64 @"scheme.base:code:flush-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4854 = icmp eq i64 %argc, 1
  br i1 %t4854, label %argok1338, label %arityerr1337
arityerr1337:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1338:
  %t4855 = call i64 @rt_intern(ptr @.str.sym.38)
  %t4856 = load i64, ptr @"scheme.base:%check-output-port"
  %t4857 = and i64 %t4856, -8
  %t4858 = inttoptr i64 %t4857 to ptr
  %t4859 = load i64, ptr %t4858
  %t4860 = inttoptr i64 %t4859 to ptr
  %t4861 = call fastcc i64%t4860(i64 %t4856, i64 2, i64 %a0, i64 %t4855, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4862 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t4863 = call i64 @rt_port_flush(i64 %t4862)
  ret i64 %t4863
}

define fastcc i64 @"scheme.base:code:close-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4868 = icmp eq i64 %argc, 1
  br i1 %t4868, label %argok1340, label %arityerr1339
arityerr1339:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1340:
  %t4869 = load i64, ptr @"scheme.base:port?"
  %t4870 = and i64 %t4869, -8
  %t4871 = inttoptr i64 %t4870 to ptr
  %t4872 = load i64, ptr %t4871
  %t4873 = inttoptr i64 %t4872 to ptr
  %t4874 = call fastcc i64%t4873(i64 %t4869, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4875 = call i64 @rt_not(i64 %t4874)
  %t4876 = icmp ne i64 %t4875, 1
  br i1 %t4876, label %then1341, label %else1342
then1341:
  %t4877 = call i64 @rt_intern(ptr @.str.sym.39)
  %t4878 = call i64 @rt_make_string(ptr @.str.lit.40, i64 10)
  %t4879 = load i64, ptr @"scheme.base:error"
  %t4880 = and i64 %t4879, -8
  %t4881 = inttoptr i64 %t4880 to ptr
  %t4882 = load i64, ptr %t4881
  %t4883 = inttoptr i64 %t4882 to ptr
  %t4884 = musttail call fastcc i64 %t4883(i64 %t4879, i64 3, i64 %t4877, i64 %t4878, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4884
else1342:
  %t4885 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t4886 = icmp ne i64 %t4885, 1
  br i1 %t4886, label %then1343, label %else1344
then1343:
  %t4887 = icmp ne i64 1, 1
  br i1 %t4887, label %then1345, label %else1346
then1345:
  ret i64 1
else1346:
  ret i64 17
else1344:
  %t4888 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t4889 = call i64 @rt_not(i64 %t4888)
  %t4890 = icmp ne i64 %t4889, 1
  br i1 %t4890, label %then1347, label %else1348
then1347:
  %t4891 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t4892 = call i64 @rt_port_close(i64 %t4891)
  br label %merge1349
else1348:
  br label %merge1349
merge1349:
  %t4893 = phi i64 [ %t4892, %then1347 ], [ 17, %else1348 ]
  %t4894 = call i64 @rt_record_set(i64 %a0, i64 40, i64 257)
  %t4895 = icmp ne i64 1, 1
  br i1 %t4895, label %then1350, label %else1351
then1350:
  ret i64 1
else1351:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:close-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4900 = icmp eq i64 %argc, 1
  br i1 %t4900, label %argok1353, label %arityerr1352
arityerr1352:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1353:
  %t4901 = load i64, ptr @"scheme.base:input-port?"
  %t4902 = and i64 %t4901, -8
  %t4903 = inttoptr i64 %t4902 to ptr
  %t4904 = load i64, ptr %t4903
  %t4905 = inttoptr i64 %t4904 to ptr
  %t4906 = call fastcc i64%t4905(i64 %t4901, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4907 = icmp ne i64 %t4906, 1
  br i1 %t4907, label %then1354, label %else1355
then1354:
  %t4908 = load i64, ptr @"scheme.base:close-port"
  %t4909 = and i64 %t4908, -8
  %t4910 = inttoptr i64 %t4909 to ptr
  %t4911 = load i64, ptr %t4910
  %t4912 = inttoptr i64 %t4911 to ptr
  %t4913 = musttail call fastcc i64 %t4912(i64 %t4908, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4913
else1355:
  %t4914 = call i64 @rt_intern(ptr @.str.sym.41)
  %t4915 = call i64 @rt_make_string(ptr @.str.lit.42, i64 17)
  %t4916 = load i64, ptr @"scheme.base:error"
  %t4917 = and i64 %t4916, -8
  %t4918 = inttoptr i64 %t4917 to ptr
  %t4919 = load i64, ptr %t4918
  %t4920 = inttoptr i64 %t4919 to ptr
  %t4921 = musttail call fastcc i64 %t4920(i64 %t4916, i64 3, i64 %t4914, i64 %t4915, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4921
}

define fastcc i64 @"scheme.base:code:close-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4926 = icmp eq i64 %argc, 1
  br i1 %t4926, label %argok1357, label %arityerr1356
arityerr1356:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1357:
  %t4927 = load i64, ptr @"scheme.base:output-port?"
  %t4928 = and i64 %t4927, -8
  %t4929 = inttoptr i64 %t4928 to ptr
  %t4930 = load i64, ptr %t4929
  %t4931 = inttoptr i64 %t4930 to ptr
  %t4932 = call fastcc i64%t4931(i64 %t4927, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4933 = icmp ne i64 %t4932, 1
  br i1 %t4933, label %then1358, label %else1359
then1358:
  %t4934 = load i64, ptr @"scheme.base:close-port"
  %t4935 = and i64 %t4934, -8
  %t4936 = inttoptr i64 %t4935 to ptr
  %t4937 = load i64, ptr %t4936
  %t4938 = inttoptr i64 %t4937 to ptr
  %t4939 = musttail call fastcc i64 %t4938(i64 %t4934, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4939
else1359:
  %t4940 = call i64 @rt_intern(ptr @.str.sym.43)
  %t4941 = call i64 @rt_make_string(ptr @.str.lit.44, i64 18)
  %t4942 = load i64, ptr @"scheme.base:error"
  %t4943 = and i64 %t4942, -8
  %t4944 = inttoptr i64 %t4943 to ptr
  %t4945 = load i64, ptr %t4944
  %t4946 = inttoptr i64 %t4945 to ptr
  %t4947 = musttail call fastcc i64 %t4946(i64 %t4942, i64 3, i64 %t4940, i64 %t4941, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4947
}

define fastcc i64 @"scheme.base:code:current-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4955 = icmp sge i64 %argc, 0
  br i1 %t4955, label %argok1361, label %arityerr1360
arityerr1360:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1361:
  %t4956 = call ptr @rt_alloc_words(i64 8)
  %t4957 = getelementptr i64, ptr %t4956, i64 0
  store i64 %a0, ptr %t4957
  %t4958 = getelementptr i64, ptr %t4956, i64 1
  store i64 %a1, ptr %t4958
  %t4959 = getelementptr i64, ptr %t4956, i64 2
  store i64 %a2, ptr %t4959
  %t4960 = getelementptr i64, ptr %t4956, i64 3
  store i64 %a3, ptr %t4960
  %t4961 = getelementptr i64, ptr %t4956, i64 4
  store i64 %a4, ptr %t4961
  %t4962 = getelementptr i64, ptr %t4956, i64 5
  store i64 %a5, ptr %t4962
  %t4963 = getelementptr i64, ptr %t4956, i64 6
  store i64 %a6, ptr %t4963
  %t4964 = getelementptr i64, ptr %t4956, i64 7
  store i64 %a7, ptr %t4964
  %t4965 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t4956, ptr %overflow)
  %t4966 = call i64 @rt_null_p(i64 %t4965)
  %t4967 = icmp ne i64 %t4966, 1
  br i1 %t4967, label %then1362, label %else1363
then1362:
  %t4968 = load i64, ptr @"scheme.base:%stdout-port"
  %t4969 = call i64 @rt_not(i64 %t4968)
  %t4970 = icmp ne i64 %t4969, 1
  br i1 %t4970, label %then1364, label %else1365
then1364:
  %t4971 = load i64, ptr @"scheme.base:%make-port"
  %t4972 = and i64 %t4971, -8
  %t4973 = inttoptr i64 %t4972 to ptr
  %t4974 = load i64, ptr %t4973
  %t4975 = inttoptr i64 %t4974 to ptr
  %t4976 = call fastcc i64%t4975(i64 %t4971, i64 6, i64 0, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t4977 = call i64 @rt_root(i64 %t4976)
  store i64 %t4977, ptr @"scheme.base:%stdout-port"
  %t4978 = call i64 @rt_set_current_output(i64 0)
  br label %merge1366
else1365:
  br label %merge1366
merge1366:
  %t4979 = phi i64 [ %t4978, %then1364 ], [ 17, %else1365 ]
  %t4980 = load i64, ptr @"scheme.base:%stdout-port"
  ret i64 %t4980
else1363:
  %t4981 = call i64 @rt_car(i64 %t4965)
  %t4982 = call i64 @rt_root(i64 %t4981)
  store i64 %t4982, ptr @"scheme.base:%stdout-port"
  %t4983 = call i64 @rt_record_ref(i64 %t4981, i64 0)
  %t4984 = call i64 @rt_set_current_output(i64 %t4983)
  %t4985 = icmp ne i64 1, 1
  br i1 %t4985, label %then1367, label %else1368
then1367:
  ret i64 1
else1368:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-error-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4990 = icmp sge i64 %argc, 0
  br i1 %t4990, label %argok1370, label %arityerr1369
arityerr1369:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1370:
  %t4991 = call ptr @rt_alloc_words(i64 8)
  %t4992 = getelementptr i64, ptr %t4991, i64 0
  store i64 %a0, ptr %t4992
  %t4993 = getelementptr i64, ptr %t4991, i64 1
  store i64 %a1, ptr %t4993
  %t4994 = getelementptr i64, ptr %t4991, i64 2
  store i64 %a2, ptr %t4994
  %t4995 = getelementptr i64, ptr %t4991, i64 3
  store i64 %a3, ptr %t4995
  %t4996 = getelementptr i64, ptr %t4991, i64 4
  store i64 %a4, ptr %t4996
  %t4997 = getelementptr i64, ptr %t4991, i64 5
  store i64 %a5, ptr %t4997
  %t4998 = getelementptr i64, ptr %t4991, i64 6
  store i64 %a6, ptr %t4998
  %t4999 = getelementptr i64, ptr %t4991, i64 7
  store i64 %a7, ptr %t4999
  %t5000 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t4991, ptr %overflow)
  %t5001 = call i64 @rt_null_p(i64 %t5000)
  %t5002 = icmp ne i64 %t5001, 1
  br i1 %t5002, label %then1371, label %else1372
then1371:
  %t5003 = load i64, ptr @"scheme.base:%stderr-port"
  %t5004 = call i64 @rt_not(i64 %t5003)
  %t5005 = icmp ne i64 %t5004, 1
  br i1 %t5005, label %then1373, label %else1374
then1373:
  %t5006 = load i64, ptr @"scheme.base:%make-port"
  %t5007 = and i64 %t5006, -8
  %t5008 = inttoptr i64 %t5007 to ptr
  %t5009 = load i64, ptr %t5008
  %t5010 = inttoptr i64 %t5009 to ptr
  %t5011 = call fastcc i64%t5010(i64 %t5006, i64 6, i64 8, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t5012 = call i64 @rt_root(i64 %t5011)
  store i64 %t5012, ptr @"scheme.base:%stderr-port"
  br label %merge1375
else1374:
  br label %merge1375
merge1375:
  %t5013 = phi i64 [ 17, %then1373 ], [ 17, %else1374 ]
  %t5014 = load i64, ptr @"scheme.base:%stderr-port"
  ret i64 %t5014
else1372:
  %t5015 = call i64 @rt_car(i64 %t5000)
  %t5016 = call i64 @rt_root(i64 %t5015)
  store i64 %t5016, ptr @"scheme.base:%stderr-port"
  %t5017 = icmp ne i64 1, 1
  br i1 %t5017, label %then1376, label %else1377
then1376:
  ret i64 1
else1377:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5022 = icmp sge i64 %argc, 0
  br i1 %t5022, label %argok1379, label %arityerr1378
arityerr1378:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1379:
  %t5023 = call ptr @rt_alloc_words(i64 8)
  %t5024 = getelementptr i64, ptr %t5023, i64 0
  store i64 %a0, ptr %t5024
  %t5025 = getelementptr i64, ptr %t5023, i64 1
  store i64 %a1, ptr %t5025
  %t5026 = getelementptr i64, ptr %t5023, i64 2
  store i64 %a2, ptr %t5026
  %t5027 = getelementptr i64, ptr %t5023, i64 3
  store i64 %a3, ptr %t5027
  %t5028 = getelementptr i64, ptr %t5023, i64 4
  store i64 %a4, ptr %t5028
  %t5029 = getelementptr i64, ptr %t5023, i64 5
  store i64 %a5, ptr %t5029
  %t5030 = getelementptr i64, ptr %t5023, i64 6
  store i64 %a6, ptr %t5030
  %t5031 = getelementptr i64, ptr %t5023, i64 7
  store i64 %a7, ptr %t5031
  %t5032 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t5023, ptr %overflow)
  %t5033 = call i64 @rt_null_p(i64 %t5032)
  %t5034 = icmp ne i64 %t5033, 1
  br i1 %t5034, label %then1380, label %else1381
then1380:
  %t5035 = load i64, ptr @"scheme.base:%stdin-port"
  %t5036 = call i64 @rt_not(i64 %t5035)
  %t5037 = icmp ne i64 %t5036, 1
  br i1 %t5037, label %then1382, label %else1383
then1382:
  %t5038 = load i64, ptr @"scheme.base:%make-port"
  %t5039 = and i64 %t5038, -8
  %t5040 = inttoptr i64 %t5039 to ptr
  %t5041 = load i64, ptr %t5040
  %t5042 = inttoptr i64 %t5041 to ptr
  %t5043 = call fastcc i64%t5042(i64 %t5038, i64 6, i64 1, i64 257, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t5044 = call i64 @rt_root(i64 %t5043)
  store i64 %t5044, ptr @"scheme.base:%stdin-port"
  br label %merge1384
else1383:
  br label %merge1384
merge1384:
  %t5045 = phi i64 [ 17, %then1382 ], [ 17, %else1383 ]
  %t5046 = load i64, ptr @"scheme.base:%stdin-port"
  ret i64 %t5046
else1381:
  %t5047 = call i64 @rt_car(i64 %t5032)
  %t5048 = call i64 @rt_root(i64 %t5047)
  store i64 %t5048, ptr @"scheme.base:%stdin-port"
  %t5049 = icmp ne i64 1, 1
  br i1 %t5049, label %then1385, label %else1386
then1385:
  ret i64 1
else1386:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_1094"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5054 = icmp eq i64 %argc, 0
  br i1 %t5054, label %argok1388, label %arityerr1387
arityerr1387:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1388:
  %t5055 = icmp ne i64 1, 1
  br i1 %t5055, label %then1389, label %else1390
then1389:
  ret i64 1
else1390:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_1096"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5056 = icmp eq i64 %argc, 0
  br i1 %t5056, label %argok1392, label %arityerr1391
arityerr1391:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1392:
  %t5057 = and i64 %self, -8
  %t5058 = inttoptr i64 %t5057 to ptr
  %t5059 = getelementptr i64, ptr %t5058, i64 2
  %t5060 = load i64, ptr %t5059
  %t5061 = and i64 %self, -8
  %t5062 = inttoptr i64 %t5061 to ptr
  %t5063 = getelementptr i64, ptr %t5062, i64 1
  %t5064 = load i64, ptr %t5063
  %t5065 = and i64 %t5064, -8
  %t5066 = inttoptr i64 %t5065 to ptr
  %t5067 = load i64, ptr %t5066
  %t5068 = inttoptr i64 %t5067 to ptr
  %t5069 = musttail call fastcc i64 %t5068(i64 %t5064, i64 1, i64 %t5060, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5069
}

define fastcc i64 @"scheme.base:code_1098"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5070 = icmp eq i64 %argc, 0
  br i1 %t5070, label %argok1394, label %arityerr1393
arityerr1393:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1394:
  %t5071 = and i64 %self, -8
  %t5072 = inttoptr i64 %t5071 to ptr
  %t5073 = getelementptr i64, ptr %t5072, i64 1
  %t5074 = load i64, ptr %t5073
  %t5075 = load i64, ptr @"scheme.base:close-port"
  %t5076 = and i64 %t5075, -8
  %t5077 = inttoptr i64 %t5076 to ptr
  %t5078 = load i64, ptr %t5077
  %t5079 = inttoptr i64 %t5078 to ptr
  %t5080 = musttail call fastcc i64 %t5079(i64 %t5075, i64 1, i64 %t5074, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5080
}

define fastcc i64 @"scheme.base:code:call-with-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5081 = icmp eq i64 %argc, 2
  br i1 %t5081, label %argok1396, label %arityerr1395
arityerr1395:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1396:
  %t5082 = call ptr @rt_alloc_words(i64 1)
  %t5083 = ptrtoint ptr %t5082 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1094" to i64), ptr %t5082
  %t5084 = or i64 %t5083, 4
  %t5085 = call ptr @rt_alloc_words(i64 3)
  %t5086 = ptrtoint ptr %t5085 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1096" to i64), ptr %t5085
  %t5087 = getelementptr i64, ptr %t5085, i64 1
  store i64 %a1, ptr %t5087
  %t5088 = getelementptr i64, ptr %t5085, i64 2
  store i64 %a0, ptr %t5088
  %t5089 = or i64 %t5086, 4
  %t5090 = call ptr @rt_alloc_words(i64 2)
  %t5091 = ptrtoint ptr %t5090 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1098" to i64), ptr %t5090
  %t5092 = getelementptr i64, ptr %t5090, i64 1
  store i64 %a0, ptr %t5092
  %t5093 = or i64 %t5091, 4
  %t5094 = load i64, ptr @"scheme.base:dynamic-wind"
  %t5095 = and i64 %t5094, -8
  %t5096 = inttoptr i64 %t5095 to ptr
  %t5097 = load i64, ptr %t5096
  %t5098 = inttoptr i64 %t5097 to ptr
  %t5099 = musttail call fastcc i64 %t5098(i64 %t5094, i64 3, i64 %t5084, i64 %t5089, i64 %t5093, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5099
}

define fastcc i64 @"scheme.base:code_1105"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5104 = icmp eq i64 %argc, 0
  br i1 %t5104, label %argok1398, label %arityerr1397
arityerr1397:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1398:
  %t5105 = and i64 %self, -8
  %t5106 = inttoptr i64 %t5105 to ptr
  %t5107 = getelementptr i64, ptr %t5106, i64 1
  %t5108 = load i64, ptr %t5107
  %t5109 = load i64, ptr @"scheme.base:current-output-port"
  %t5110 = and i64 %t5109, -8
  %t5111 = inttoptr i64 %t5110 to ptr
  %t5112 = load i64, ptr %t5111
  %t5113 = inttoptr i64 %t5112 to ptr
  %t5114 = musttail call fastcc i64 %t5113(i64 %t5109, i64 1, i64 %t5108, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5114
}

define fastcc i64 @"scheme.base:code_1107"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5115 = icmp eq i64 %argc, 0
  br i1 %t5115, label %argok1400, label %arityerr1399
arityerr1399:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1400:
  %t5116 = and i64 %self, -8
  %t5117 = inttoptr i64 %t5116 to ptr
  %t5118 = getelementptr i64, ptr %t5117, i64 1
  %t5119 = load i64, ptr %t5118
  %t5120 = load i64, ptr @"scheme.base:current-output-port"
  %t5121 = and i64 %t5120, -8
  %t5122 = inttoptr i64 %t5121 to ptr
  %t5123 = load i64, ptr %t5122
  %t5124 = inttoptr i64 %t5123 to ptr
  %t5125 = call fastcc i64%t5124(i64 %t5120, i64 2, i64 %t5119, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5126 = and i64 %self, -8
  %t5127 = inttoptr i64 %t5126 to ptr
  %t5128 = getelementptr i64, ptr %t5127, i64 2
  %t5129 = load i64, ptr %t5128
  %t5130 = load i64, ptr @"scheme.base:close-port"
  %t5131 = and i64 %t5130, -8
  %t5132 = inttoptr i64 %t5131 to ptr
  %t5133 = load i64, ptr %t5132
  %t5134 = inttoptr i64 %t5133 to ptr
  %t5135 = musttail call fastcc i64 %t5134(i64 %t5130, i64 1, i64 %t5129, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5135
}

define fastcc i64 @"scheme.base:code:with-output-to-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5136 = icmp eq i64 %argc, 2
  br i1 %t5136, label %argok1402, label %arityerr1401
arityerr1401:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1402:
  %t5137 = load i64, ptr @"scheme.base:open-output-file"
  %t5138 = and i64 %t5137, -8
  %t5139 = inttoptr i64 %t5138 to ptr
  %t5140 = load i64, ptr %t5139
  %t5141 = inttoptr i64 %t5140 to ptr
  %t5142 = call fastcc i64%t5141(i64 %t5137, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5143 = load i64, ptr @"scheme.base:current-output-port"
  %t5144 = and i64 %t5143, -8
  %t5145 = inttoptr i64 %t5144 to ptr
  %t5146 = load i64, ptr %t5145
  %t5147 = inttoptr i64 %t5146 to ptr
  %t5148 = call fastcc i64%t5147(i64 %t5143, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5149 = call ptr @rt_alloc_words(i64 2)
  %t5150 = ptrtoint ptr %t5149 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1105" to i64), ptr %t5149
  %t5151 = getelementptr i64, ptr %t5149, i64 1
  store i64 %t5142, ptr %t5151
  %t5152 = or i64 %t5150, 4
  %t5153 = call ptr @rt_alloc_words(i64 3)
  %t5154 = ptrtoint ptr %t5153 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1107" to i64), ptr %t5153
  %t5155 = getelementptr i64, ptr %t5153, i64 1
  store i64 %t5148, ptr %t5155
  %t5156 = getelementptr i64, ptr %t5153, i64 2
  store i64 %t5142, ptr %t5156
  %t5157 = or i64 %t5154, 4
  %t5158 = load i64, ptr @"scheme.base:dynamic-wind"
  %t5159 = and i64 %t5158, -8
  %t5160 = inttoptr i64 %t5159 to ptr
  %t5161 = load i64, ptr %t5160
  %t5162 = inttoptr i64 %t5161 to ptr
  %t5163 = musttail call fastcc i64 %t5162(i64 %t5158, i64 3, i64 %t5152, i64 %a1, i64 %t5157, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5163
}

define fastcc i64 @"scheme.base:code_1114"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5168 = icmp eq i64 %argc, 0
  br i1 %t5168, label %argok1404, label %arityerr1403
arityerr1403:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1404:
  %t5169 = and i64 %self, -8
  %t5170 = inttoptr i64 %t5169 to ptr
  %t5171 = getelementptr i64, ptr %t5170, i64 1
  %t5172 = load i64, ptr %t5171
  %t5173 = load i64, ptr @"scheme.base:current-input-port"
  %t5174 = and i64 %t5173, -8
  %t5175 = inttoptr i64 %t5174 to ptr
  %t5176 = load i64, ptr %t5175
  %t5177 = inttoptr i64 %t5176 to ptr
  %t5178 = musttail call fastcc i64 %t5177(i64 %t5173, i64 1, i64 %t5172, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5178
}

define fastcc i64 @"scheme.base:code_1116"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5179 = icmp eq i64 %argc, 0
  br i1 %t5179, label %argok1406, label %arityerr1405
arityerr1405:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1406:
  %t5180 = and i64 %self, -8
  %t5181 = inttoptr i64 %t5180 to ptr
  %t5182 = getelementptr i64, ptr %t5181, i64 1
  %t5183 = load i64, ptr %t5182
  %t5184 = load i64, ptr @"scheme.base:current-input-port"
  %t5185 = and i64 %t5184, -8
  %t5186 = inttoptr i64 %t5185 to ptr
  %t5187 = load i64, ptr %t5186
  %t5188 = inttoptr i64 %t5187 to ptr
  %t5189 = call fastcc i64%t5188(i64 %t5184, i64 2, i64 %t5183, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5190 = and i64 %self, -8
  %t5191 = inttoptr i64 %t5190 to ptr
  %t5192 = getelementptr i64, ptr %t5191, i64 2
  %t5193 = load i64, ptr %t5192
  %t5194 = load i64, ptr @"scheme.base:close-port"
  %t5195 = and i64 %t5194, -8
  %t5196 = inttoptr i64 %t5195 to ptr
  %t5197 = load i64, ptr %t5196
  %t5198 = inttoptr i64 %t5197 to ptr
  %t5199 = musttail call fastcc i64 %t5198(i64 %t5194, i64 1, i64 %t5193, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5199
}

define fastcc i64 @"scheme.base:code:with-input-from-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5200 = icmp eq i64 %argc, 2
  br i1 %t5200, label %argok1408, label %arityerr1407
arityerr1407:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1408:
  %t5201 = load i64, ptr @"scheme.base:open-input-file"
  %t5202 = and i64 %t5201, -8
  %t5203 = inttoptr i64 %t5202 to ptr
  %t5204 = load i64, ptr %t5203
  %t5205 = inttoptr i64 %t5204 to ptr
  %t5206 = call fastcc i64%t5205(i64 %t5201, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5207 = load i64, ptr @"scheme.base:current-input-port"
  %t5208 = and i64 %t5207, -8
  %t5209 = inttoptr i64 %t5208 to ptr
  %t5210 = load i64, ptr %t5209
  %t5211 = inttoptr i64 %t5210 to ptr
  %t5212 = call fastcc i64%t5211(i64 %t5207, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5213 = call ptr @rt_alloc_words(i64 2)
  %t5214 = ptrtoint ptr %t5213 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1114" to i64), ptr %t5213
  %t5215 = getelementptr i64, ptr %t5213, i64 1
  store i64 %t5206, ptr %t5215
  %t5216 = or i64 %t5214, 4
  %t5217 = call ptr @rt_alloc_words(i64 3)
  %t5218 = ptrtoint ptr %t5217 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1116" to i64), ptr %t5217
  %t5219 = getelementptr i64, ptr %t5217, i64 1
  store i64 %t5212, ptr %t5219
  %t5220 = getelementptr i64, ptr %t5217, i64 2
  store i64 %t5206, ptr %t5220
  %t5221 = or i64 %t5218, 4
  %t5222 = load i64, ptr @"scheme.base:dynamic-wind"
  %t5223 = and i64 %t5222, -8
  %t5224 = inttoptr i64 %t5223 to ptr
  %t5225 = load i64, ptr %t5224
  %t5226 = inttoptr i64 %t5225 to ptr
  %t5227 = musttail call fastcc i64 %t5226(i64 %t5222, i64 3, i64 %t5216, i64 %a1, i64 %t5221, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5227
}

define fastcc i64 @"scheme.base:code:call-with-output-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5232 = icmp eq i64 %argc, 2
  br i1 %t5232, label %argok1410, label %arityerr1409
arityerr1409:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1410:
  %t5233 = load i64, ptr @"scheme.base:open-output-file"
  %t5234 = and i64 %t5233, -8
  %t5235 = inttoptr i64 %t5234 to ptr
  %t5236 = load i64, ptr %t5235
  %t5237 = inttoptr i64 %t5236 to ptr
  %t5238 = call fastcc i64%t5237(i64 %t5233, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5239 = load i64, ptr @"scheme.base:call-with-port"
  %t5240 = and i64 %t5239, -8
  %t5241 = inttoptr i64 %t5240 to ptr
  %t5242 = load i64, ptr %t5241
  %t5243 = inttoptr i64 %t5242 to ptr
  %t5244 = musttail call fastcc i64 %t5243(i64 %t5239, i64 2, i64 %t5238, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5244
}

define fastcc i64 @"scheme.base:code:call-with-input-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5249 = icmp eq i64 %argc, 2
  br i1 %t5249, label %argok1412, label %arityerr1411
arityerr1411:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1412:
  %t5250 = load i64, ptr @"scheme.base:open-input-file"
  %t5251 = and i64 %t5250, -8
  %t5252 = inttoptr i64 %t5251 to ptr
  %t5253 = load i64, ptr %t5252
  %t5254 = inttoptr i64 %t5253 to ptr
  %t5255 = call fastcc i64%t5254(i64 %t5250, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5256 = load i64, ptr @"scheme.base:call-with-port"
  %t5257 = and i64 %t5256, -8
  %t5258 = inttoptr i64 %t5257 to ptr
  %t5259 = load i64, ptr %t5258
  %t5260 = inttoptr i64 %t5259 to ptr
  %t5261 = musttail call fastcc i64 %t5260(i64 %t5256, i64 2, i64 %t5255, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5261
}

define i64 @"scheme.base:__init_1"() {
entry:
  %t12 = call ptr @rt_alloc_words(i64 1)
  %t13 = ptrtoint ptr %t12 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list" to i64), ptr %t12
  %t14 = or i64 %t13, 4
  %t15 = call i64 @rt_root(i64 %t14)
  store i64 %t15, ptr @"scheme.base:list"
  ret i64 17
}

define i64 @"scheme.base:__init_2"() {
entry:
  %t19 = call ptr @rt_alloc_words(i64 1)
  %t20 = ptrtoint ptr %t19 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:caar" to i64), ptr %t19
  %t21 = or i64 %t20, 4
  %t22 = call i64 @rt_root(i64 %t21)
  store i64 %t22, ptr @"scheme.base:caar"
  ret i64 17
}

define i64 @"scheme.base:__init_3"() {
entry:
  %t26 = call ptr @rt_alloc_words(i64 1)
  %t27 = ptrtoint ptr %t26 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:cadr" to i64), ptr %t26
  %t28 = or i64 %t27, 4
  %t29 = call i64 @rt_root(i64 %t28)
  store i64 %t29, ptr @"scheme.base:cadr"
  ret i64 17
}

define i64 @"scheme.base:__init_4"() {
entry:
  %t33 = call ptr @rt_alloc_words(i64 1)
  %t34 = ptrtoint ptr %t33 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:cdar" to i64), ptr %t33
  %t35 = or i64 %t34, 4
  %t36 = call i64 @rt_root(i64 %t35)
  store i64 %t36, ptr @"scheme.base:cdar"
  ret i64 17
}

define i64 @"scheme.base:__init_5"() {
entry:
  %t40 = call ptr @rt_alloc_words(i64 1)
  %t41 = ptrtoint ptr %t40 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:cddr" to i64), ptr %t40
  %t42 = or i64 %t41, 4
  %t43 = call i64 @rt_root(i64 %t42)
  store i64 %t43, ptr @"scheme.base:cddr"
  ret i64 17
}

define i64 @"scheme.base:__init_6"() {
entry:
  %t52 = call ptr @rt_alloc_words(i64 1)
  %t53 = ptrtoint ptr %t52 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:caaar" to i64), ptr %t52
  %t54 = or i64 %t53, 4
  %t55 = call i64 @rt_root(i64 %t54)
  store i64 %t55, ptr @"scheme.base:caaar"
  ret i64 17
}

define i64 @"scheme.base:__init_7"() {
entry:
  %t64 = call ptr @rt_alloc_words(i64 1)
  %t65 = ptrtoint ptr %t64 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:caadr" to i64), ptr %t64
  %t66 = or i64 %t65, 4
  %t67 = call i64 @rt_root(i64 %t66)
  store i64 %t67, ptr @"scheme.base:caadr"
  ret i64 17
}

define i64 @"scheme.base:__init_8"() {
entry:
  %t76 = call ptr @rt_alloc_words(i64 1)
  %t77 = ptrtoint ptr %t76 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:cadar" to i64), ptr %t76
  %t78 = or i64 %t77, 4
  %t79 = call i64 @rt_root(i64 %t78)
  store i64 %t79, ptr @"scheme.base:cadar"
  ret i64 17
}

define i64 @"scheme.base:__init_9"() {
entry:
  %t88 = call ptr @rt_alloc_words(i64 1)
  %t89 = ptrtoint ptr %t88 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:caddr" to i64), ptr %t88
  %t90 = or i64 %t89, 4
  %t91 = call i64 @rt_root(i64 %t90)
  store i64 %t91, ptr @"scheme.base:caddr"
  ret i64 17
}

define i64 @"scheme.base:__init_10"() {
entry:
  %t100 = call ptr @rt_alloc_words(i64 1)
  %t101 = ptrtoint ptr %t100 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:cdaar" to i64), ptr %t100
  %t102 = or i64 %t101, 4
  %t103 = call i64 @rt_root(i64 %t102)
  store i64 %t103, ptr @"scheme.base:cdaar"
  ret i64 17
}

define i64 @"scheme.base:__init_11"() {
entry:
  %t112 = call ptr @rt_alloc_words(i64 1)
  %t113 = ptrtoint ptr %t112 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:cdadr" to i64), ptr %t112
  %t114 = or i64 %t113, 4
  %t115 = call i64 @rt_root(i64 %t114)
  store i64 %t115, ptr @"scheme.base:cdadr"
  ret i64 17
}

define i64 @"scheme.base:__init_12"() {
entry:
  %t124 = call ptr @rt_alloc_words(i64 1)
  %t125 = ptrtoint ptr %t124 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:cddar" to i64), ptr %t124
  %t126 = or i64 %t125, 4
  %t127 = call i64 @rt_root(i64 %t126)
  store i64 %t127, ptr @"scheme.base:cddar"
  ret i64 17
}

define i64 @"scheme.base:__init_13"() {
entry:
  %t136 = call ptr @rt_alloc_words(i64 1)
  %t137 = ptrtoint ptr %t136 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:cdddr" to i64), ptr %t136
  %t138 = or i64 %t137, 4
  %t139 = call i64 @rt_root(i64 %t138)
  store i64 %t139, ptr @"scheme.base:cdddr"
  ret i64 17
}

define i64 @"scheme.base:__init_14"() {
entry:
  %t157 = call ptr @rt_alloc_words(i64 1)
  %t158 = ptrtoint ptr %t157 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:length" to i64), ptr %t157
  %t159 = or i64 %t158, 4
  %t160 = call i64 @rt_root(i64 %t159)
  store i64 %t160, ptr @"scheme.base:length"
  ret i64 17
}

define i64 @"scheme.base:__init_15"() {
entry:
  %t174 = call ptr @rt_alloc_words(i64 1)
  %t175 = ptrtoint ptr %t174 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:reverse" to i64), ptr %t174
  %t176 = or i64 %t175, 4
  %t177 = call i64 @rt_root(i64 %t176)
  store i64 %t177, ptr @"scheme.base:reverse"
  ret i64 17
}

define i64 @"scheme.base:__init_16"() {
entry:
  %t190 = call ptr @rt_alloc_words(i64 1)
  %t191 = ptrtoint ptr %t190 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%append2" to i64), ptr %t190
  %t192 = or i64 %t191, 4
  %t193 = call i64 @rt_root(i64 %t192)
  store i64 %t193, ptr @"scheme.base:%append2"
  ret i64 17
}

define i64 @"scheme.base:__init_17"() {
entry:
  %t247 = call ptr @rt_alloc_words(i64 1)
  %t248 = ptrtoint ptr %t247 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:append" to i64), ptr %t247
  %t249 = or i64 %t248, 4
  %t250 = call i64 @rt_root(i64 %t249)
  store i64 %t250, ptr @"scheme.base:append"
  ret i64 17
}

define i64 @"scheme.base:__init_18"() {
entry:
  %t268 = call ptr @rt_alloc_words(i64 1)
  %t269 = ptrtoint ptr %t268 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%map1" to i64), ptr %t268
  %t270 = or i64 %t269, 4
  %t271 = call i64 @rt_root(i64 %t270)
  store i64 %t271, ptr @"scheme.base:%map1"
  ret i64 17
}

define i64 @"scheme.base:__init_19"() {
entry:
  %t285 = call ptr @rt_alloc_words(i64 1)
  %t286 = ptrtoint ptr %t285 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%any-null?" to i64), ptr %t285
  %t287 = or i64 %t286, 4
  %t288 = call i64 @rt_root(i64 %t287)
  store i64 %t288, ptr @"scheme.base:%any-null?"
  ret i64 17
}

define i64 @"scheme.base:__init_20"() {
entry:
  %t353 = call ptr @rt_alloc_words(i64 1)
  %t354 = ptrtoint ptr %t353 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%mapn" to i64), ptr %t353
  %t355 = or i64 %t354, 4
  %t356 = call i64 @rt_root(i64 %t355)
  store i64 %t356, ptr @"scheme.base:%mapn"
  ret i64 17
}

define i64 @"scheme.base:__init_21"() {
entry:
  %t383 = call ptr @rt_alloc_words(i64 1)
  %t384 = ptrtoint ptr %t383 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:map" to i64), ptr %t383
  %t385 = or i64 %t384, 4
  %t386 = call i64 @rt_root(i64 %t385)
  store i64 %t386, ptr @"scheme.base:map"
  ret i64 17
}

define i64 @"scheme.base:__init_22"() {
entry:
  %t400 = call ptr @rt_alloc_words(i64 1)
  %t401 = ptrtoint ptr %t400 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:memq" to i64), ptr %t400
  %t402 = or i64 %t401, 4
  %t403 = call i64 @rt_root(i64 %t402)
  store i64 %t403, ptr @"scheme.base:memq"
  ret i64 17
}

define i64 @"scheme.base:__init_23"() {
entry:
  %t417 = call ptr @rt_alloc_words(i64 1)
  %t418 = ptrtoint ptr %t417 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:memv" to i64), ptr %t417
  %t419 = or i64 %t418, 4
  %t420 = call i64 @rt_root(i64 %t419)
  store i64 %t420, ptr @"scheme.base:memv"
  ret i64 17
}

define i64 @"scheme.base:__init_24"() {
entry:
  %t436 = call ptr @rt_alloc_words(i64 1)
  %t437 = ptrtoint ptr %t436 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:assq" to i64), ptr %t436
  %t438 = or i64 %t437, 4
  %t439 = call i64 @rt_root(i64 %t438)
  store i64 %t439, ptr @"scheme.base:assq"
  ret i64 17
}

define i64 @"scheme.base:__init_25"() {
entry:
  %t453 = call ptr @rt_alloc_words(i64 1)
  %t454 = ptrtoint ptr %t453 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:member" to i64), ptr %t453
  %t455 = or i64 %t454, 4
  %t456 = call i64 @rt_root(i64 %t455)
  store i64 %t456, ptr @"scheme.base:member"
  ret i64 17
}

define i64 @"scheme.base:__init_26"() {
entry:
  %t472 = call ptr @rt_alloc_words(i64 1)
  %t473 = ptrtoint ptr %t472 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:assoc" to i64), ptr %t472
  %t474 = or i64 %t473, 4
  %t475 = call i64 @rt_root(i64 %t474)
  store i64 %t475, ptr @"scheme.base:assoc"
  ret i64 17
}

define i64 @"scheme.base:__init_27"() {
entry:
  %t502 = call ptr @rt_alloc_words(i64 1)
  %t503 = ptrtoint ptr %t502 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:filter" to i64), ptr %t502
  %t504 = or i64 %t503, 4
  %t505 = call i64 @rt_root(i64 %t504)
  store i64 %t505, ptr @"scheme.base:filter"
  ret i64 17
}

define i64 @"scheme.base:__init_28"() {
entry:
  %t522 = call ptr @rt_alloc_words(i64 1)
  %t523 = ptrtoint ptr %t522 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:fold-left" to i64), ptr %t522
  %t524 = or i64 %t523, 4
  %t525 = call i64 @rt_root(i64 %t524)
  store i64 %t525, ptr @"scheme.base:fold-left"
  ret i64 17
}

define i64 @"scheme.base:__init_29"() {
entry:
  %t542 = call ptr @rt_alloc_words(i64 1)
  %t543 = ptrtoint ptr %t542 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:fold-right" to i64), ptr %t542
  %t544 = or i64 %t543, 4
  %t545 = call i64 @rt_root(i64 %t544)
  store i64 %t545, ptr @"scheme.base:fold-right"
  ret i64 17
}

define i64 @"scheme.base:__init_30"() {
entry:
  %t563 = call ptr @rt_alloc_words(i64 1)
  %t564 = ptrtoint ptr %t563 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%for-each1" to i64), ptr %t563
  %t565 = or i64 %t564, 4
  %t566 = call i64 @rt_root(i64 %t565)
  store i64 %t566, ptr @"scheme.base:%for-each1"
  ret i64 17
}

define i64 @"scheme.base:__init_31"() {
entry:
  %t631 = call ptr @rt_alloc_words(i64 1)
  %t632 = ptrtoint ptr %t631 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%for-eachn" to i64), ptr %t631
  %t633 = or i64 %t632, 4
  %t634 = call i64 @rt_root(i64 %t633)
  store i64 %t634, ptr @"scheme.base:%for-eachn"
  ret i64 17
}

define i64 @"scheme.base:__init_32"() {
entry:
  %t661 = call ptr @rt_alloc_words(i64 1)
  %t662 = ptrtoint ptr %t661 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:for-each" to i64), ptr %t661
  %t663 = or i64 %t662, 4
  %t664 = call i64 @rt_root(i64 %t663)
  store i64 %t664, ptr @"scheme.base:for-each"
  ret i64 17
}

define i64 @"scheme.base:__init_33"() {
entry:
  %t682 = call ptr @rt_alloc_words(i64 1)
  %t683 = ptrtoint ptr %t682 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:andmap" to i64), ptr %t682
  %t684 = or i64 %t683, 4
  %t685 = call i64 @rt_root(i64 %t684)
  store i64 %t685, ptr @"scheme.base:andmap"
  ret i64 17
}

define i64 @"scheme.base:__init_34"() {
entry:
  %t703 = call ptr @rt_alloc_words(i64 1)
  %t704 = ptrtoint ptr %t703 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:memp" to i64), ptr %t703
  %t705 = or i64 %t704, 4
  %t706 = call i64 @rt_root(i64 %t705)
  store i64 %t706, ptr @"scheme.base:memp"
  ret i64 17
}

define i64 @"scheme.base:__init_35"() {
entry:
  %t715 = call ptr @rt_alloc_words(i64 1)
  %t716 = ptrtoint ptr %t715 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:cadddr" to i64), ptr %t715
  %t717 = or i64 %t716, 4
  %t718 = call i64 @rt_root(i64 %t717)
  store i64 %t718, ptr @"scheme.base:cadddr"
  ret i64 17
}

define i64 @"scheme.base:__init_36"() {
entry:
  %t731 = call ptr @rt_alloc_words(i64 1)
  %t732 = ptrtoint ptr %t731 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list?" to i64), ptr %t731
  %t733 = or i64 %t732, 4
  %t734 = call i64 @rt_root(i64 %t733)
  store i64 %t734, ptr @"scheme.base:list?"
  ret i64 17
}

define i64 @"scheme.base:__init_37"() {
entry:
  %t743 = call ptr @rt_alloc_words(i64 1)
  %t744 = ptrtoint ptr %t743 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:zero?" to i64), ptr %t743
  %t745 = or i64 %t744, 4
  %t746 = call i64 @rt_root(i64 %t745)
  store i64 %t746, ptr @"scheme.base:zero?"
  ret i64 17
}

define i64 @"scheme.base:__init_38"() {
entry:
  %t768 = call ptr @rt_alloc_words(i64 1)
  %t769 = ptrtoint ptr %t768 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-tail" to i64), ptr %t768
  %t770 = or i64 %t769, 4
  %t771 = call i64 @rt_root(i64 %t770)
  store i64 %t771, ptr @"scheme.base:list-tail"
  ret i64 17
}

define i64 @"scheme.base:__init_39"() {
entry:
  %t780 = call ptr @rt_alloc_words(i64 1)
  %t781 = ptrtoint ptr %t780 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-ref" to i64), ptr %t780
  %t782 = or i64 %t781, 4
  %t783 = call i64 @rt_root(i64 %t782)
  store i64 %t783, ptr @"scheme.base:list-ref"
  ret i64 17
}

define i64 @"scheme.base:__init_40"() {
entry:
  %t807 = call ptr @rt_alloc_words(i64 1)
  %t808 = ptrtoint ptr %t807 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-head" to i64), ptr %t807
  %t809 = or i64 %t808, 4
  %t810 = call i64 @rt_root(i64 %t809)
  store i64 %t810, ptr @"scheme.base:list-head"
  ret i64 17
}

define i64 @"scheme.base:__init_41"() {
entry:
  %t832 = call ptr @rt_alloc_words(i64 1)
  %t833 = ptrtoint ptr %t832 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-list" to i64), ptr %t832
  %t834 = or i64 %t833, 4
  %t835 = call i64 @rt_root(i64 %t834)
  store i64 %t835, ptr @"scheme.base:make-list"
  ret i64 17
}

define i64 @"scheme.base:__init_42"() {
entry:
  %t870 = call ptr @rt_alloc_words(i64 1)
  %t871 = ptrtoint ptr %t870 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:iota" to i64), ptr %t870
  %t872 = or i64 %t871, 4
  %t873 = call i64 @rt_root(i64 %t872)
  store i64 %t873, ptr @"scheme.base:iota"
  ret i64 17
}

define i64 @"scheme.base:__init_43"() {
entry:
  %t883 = call ptr @rt_alloc_words(i64 1)
  %t884 = ptrtoint ptr %t883 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:max" to i64), ptr %t883
  %t885 = or i64 %t884, 4
  %t886 = call i64 @rt_root(i64 %t885)
  store i64 %t886, ptr @"scheme.base:max"
  ret i64 17
}

define i64 @"scheme.base:__init_44"() {
entry:
  %t889 = call ptr @rt_alloc_words(i64 1)
  %t890 = ptrtoint ptr %t889 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:void" to i64), ptr %t889
  %t891 = or i64 %t890, 4
  %t892 = call i64 @rt_root(i64 %t891)
  store i64 %t892, ptr @"scheme.base:void"
  ret i64 17
}

define i64 @"scheme.base:__init_45"() {
entry:
  %t905 = call ptr @rt_alloc_words(i64 1)
  %t906 = ptrtoint ptr %t905 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string" to i64), ptr %t905
  %t907 = or i64 %t906, 4
  %t908 = call i64 @rt_root(i64 %t907)
  store i64 %t908, ptr @"scheme.base:string"
  ret i64 17
}

define i64 @"scheme.base:__init_46"() {
entry:
  %t922 = call ptr @rt_alloc_words(i64 1)
  %t923 = ptrtoint ptr %t922 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%str-concat" to i64), ptr %t922
  %t924 = or i64 %t923, 4
  %t925 = call i64 @rt_root(i64 %t924)
  store i64 %t925, ptr @"scheme.base:%str-concat"
  ret i64 17
}

define i64 @"scheme.base:__init_47"() {
entry:
  %t945 = call ptr @rt_alloc_words(i64 1)
  %t946 = ptrtoint ptr %t945 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:chr-cmp" to i64), ptr %t945
  %t947 = or i64 %t946, 4
  %t948 = call i64 @rt_root(i64 %t947)
  store i64 %t948, ptr @"scheme.base:chr-cmp"
  ret i64 17
}

define i64 @"scheme.base:__init_48"() {
entry:
  %t977 = call ptr @rt_alloc_words(i64 1)
  %t978 = ptrtoint ptr %t977 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char=?" to i64), ptr %t977
  %t979 = or i64 %t978, 4
  %t980 = call i64 @rt_root(i64 %t979)
  store i64 %t980, ptr @"scheme.base:char=?"
  ret i64 17
}

define i64 @"scheme.base:__init_49"() {
entry:
  %t1009 = call ptr @rt_alloc_words(i64 1)
  %t1010 = ptrtoint ptr %t1009 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char<?" to i64), ptr %t1009
  %t1011 = or i64 %t1010, 4
  %t1012 = call i64 @rt_root(i64 %t1011)
  store i64 %t1012, ptr @"scheme.base:char<?"
  ret i64 17
}

define i64 @"scheme.base:__init_50"() {
entry:
  %t1041 = call ptr @rt_alloc_words(i64 1)
  %t1042 = ptrtoint ptr %t1041 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char>?" to i64), ptr %t1041
  %t1043 = or i64 %t1042, 4
  %t1044 = call i64 @rt_root(i64 %t1043)
  store i64 %t1044, ptr @"scheme.base:char>?"
  ret i64 17
}

define i64 @"scheme.base:__init_51"() {
entry:
  %t1081 = call ptr @rt_alloc_words(i64 1)
  %t1082 = ptrtoint ptr %t1081 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char<=?" to i64), ptr %t1081
  %t1083 = or i64 %t1082, 4
  %t1084 = call i64 @rt_root(i64 %t1083)
  store i64 %t1084, ptr @"scheme.base:char<=?"
  ret i64 17
}

define i64 @"scheme.base:__init_52"() {
entry:
  %t1121 = call ptr @rt_alloc_words(i64 1)
  %t1122 = ptrtoint ptr %t1121 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char>=?" to i64), ptr %t1121
  %t1123 = or i64 %t1122, 4
  %t1124 = call i64 @rt_root(i64 %t1123)
  store i64 %t1124, ptr @"scheme.base:char>=?"
  ret i64 17
}

define i64 @"scheme.base:__init_53"() {
entry:
  %t1161 = call ptr @rt_alloc_words(i64 1)
  %t1162 = ptrtoint ptr %t1161 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string->list" to i64), ptr %t1161
  %t1163 = or i64 %t1162, 4
  %t1164 = call i64 @rt_root(i64 %t1163)
  store i64 %t1164, ptr @"scheme.base:string->list"
  ret i64 17
}

define i64 @"scheme.base:__init_54"() {
entry:
  %t1197 = call ptr @rt_alloc_words(i64 1)
  %t1198 = ptrtoint ptr %t1197 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:ns-digits" to i64), ptr %t1197
  %t1199 = or i64 %t1198, 4
  %t1200 = call i64 @rt_root(i64 %t1199)
  store i64 %t1200, ptr @"scheme.base:ns-digits"
  ret i64 17
}

define i64 @"scheme.base:__init_55"() {
entry:
  %t1243 = call ptr @rt_alloc_words(i64 1)
  %t1244 = ptrtoint ptr %t1243 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:number->string" to i64), ptr %t1243
  %t1245 = or i64 %t1244, 4
  %t1246 = call i64 @rt_root(i64 %t1245)
  store i64 %t1246, ptr @"scheme.base:number->string"
  ret i64 17
}

define i64 @"scheme.base:__init_56"() {
entry:
  %t1280 = call ptr @rt_alloc_words(i64 1)
  %t1281 = ptrtoint ptr %t1280 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error" to i64), ptr %t1280
  %t1282 = or i64 %t1281, 4
  %t1283 = call i64 @rt_root(i64 %t1282)
  store i64 %t1283, ptr @"scheme.base:error"
  ret i64 17
}

define i64 @"scheme.base:__init_57"() {
entry:
  %t1284 = call i64 @rt_root(i64 2)
  store i64 %t1284, ptr @"scheme.base:*winds*"
  ret i64 17
}

define i64 @"scheme.base:__init_58"() {
entry:
  %t1285 = call i64 @rt_root(i64 2)
  store i64 %t1285, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define i64 @"scheme.base:__init_59"() {
entry:
  %t1310 = call ptr @rt_alloc_words(i64 1)
  %t1311 = ptrtoint ptr %t1310 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%unwind-to" to i64), ptr %t1310
  %t1312 = or i64 %t1311, 4
  %t1313 = call i64 @rt_root(i64 %t1312)
  store i64 %t1313, ptr @"scheme.base:%unwind-to"
  ret i64 17
}

define i64 @"scheme.base:__init_60"() {
entry:
  %t1337 = call ptr @rt_alloc_words(i64 1)
  %t1338 = ptrtoint ptr %t1337 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:dynamic-wind" to i64), ptr %t1337
  %t1339 = or i64 %t1338, 4
  %t1340 = call i64 @rt_root(i64 %t1339)
  store i64 %t1340, ptr @"scheme.base:dynamic-wind"
  ret i64 17
}

define i64 @"scheme.base:__init_61"() {
entry:
  %t1401 = call ptr @rt_alloc_words(i64 1)
  %t1402 = ptrtoint ptr %t1401 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-current-continuation" to i64), ptr %t1401
  %t1403 = or i64 %t1402, 4
  %t1404 = call i64 @rt_root(i64 %t1403)
  store i64 %t1404, ptr @"scheme.base:call-with-current-continuation"
  ret i64 17
}

define i64 @"scheme.base:__init_62"() {
entry:
  %t1412 = call ptr @rt_alloc_words(i64 1)
  %t1413 = ptrtoint ptr %t1412 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call/cc" to i64), ptr %t1412
  %t1414 = or i64 %t1413, 4
  %t1415 = call i64 @rt_root(i64 %t1414)
  store i64 %t1415, ptr @"scheme.base:call/cc"
  ret i64 17
}

define i64 @"scheme.base:__init_63"() {
entry:
  %t1450 = call ptr @rt_alloc_words(i64 1)
  %t1451 = ptrtoint ptr %t1450 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%with-handler" to i64), ptr %t1450
  %t1452 = or i64 %t1451, 4
  %t1453 = call i64 @rt_root(i64 %t1452)
  store i64 %t1453, ptr @"scheme.base:%with-handler"
  ret i64 17
}

define i64 @"scheme.base:__init_64"() {
entry:
  %t1472 = call ptr @rt_alloc_words(i64 1)
  %t1473 = ptrtoint ptr %t1472 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:raise" to i64), ptr %t1472
  %t1474 = or i64 %t1473, 4
  %t1475 = call i64 @rt_root(i64 %t1474)
  store i64 %t1475, ptr @"scheme.base:raise"
  ret i64 17
}

define i64 @"scheme.base:__init_65"() {
entry:
  %t1478 = call ptr @rt_alloc_words(i64 1)
  %t1479 = ptrtoint ptr %t1478 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object?" to i64), ptr %t1478
  %t1480 = or i64 %t1479, 4
  %t1481 = call i64 @rt_root(i64 %t1480)
  store i64 %t1481, ptr @"scheme.base:error-object?"
  ret i64 17
}

define i64 @"scheme.base:__init_66"() {
entry:
  %t1484 = call ptr @rt_alloc_words(i64 1)
  %t1485 = ptrtoint ptr %t1484 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-message" to i64), ptr %t1484
  %t1486 = or i64 %t1485, 4
  %t1487 = call i64 @rt_root(i64 %t1486)
  store i64 %t1487, ptr @"scheme.base:error-object-message"
  ret i64 17
}

define i64 @"scheme.base:__init_67"() {
entry:
  %t1490 = call ptr @rt_alloc_words(i64 1)
  %t1491 = ptrtoint ptr %t1490 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-irritants" to i64), ptr %t1490
  %t1492 = or i64 %t1491, 4
  %t1493 = call i64 @rt_root(i64 %t1492)
  store i64 %t1493, ptr @"scheme.base:error-object-irritants"
  ret i64 17
}

define i64 @"scheme.base:__init_68"() {
entry:
  %t1575 = call ptr @rt_alloc_words(i64 1)
  %t1576 = ptrtoint ptr %t1575 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-parameter" to i64), ptr %t1575
  %t1577 = or i64 %t1576, 4
  %t1578 = call i64 @rt_root(i64 %t1577)
  store i64 %t1578, ptr @"scheme.base:make-parameter"
  ret i64 17
}

define i64 @"scheme.base:__init_69"() {
entry:
  %t1659 = call ptr @rt_alloc_words(i64 1)
  %t1660 = ptrtoint ptr %t1659 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%with-parameters" to i64), ptr %t1659
  %t1661 = or i64 %t1660, 4
  %t1662 = call i64 @rt_root(i64 %t1661)
  store i64 %t1662, ptr @"scheme.base:%with-parameters"
  ret i64 17
}

define i64 @"scheme.base:__init_70"() {
entry:
  %t1698 = call ptr @rt_alloc_words(i64 1)
  %t1699 = ptrtoint ptr %t1698 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->vector" to i64), ptr %t1698
  %t1700 = or i64 %t1699, 4
  %t1701 = call i64 @rt_root(i64 %t1700)
  store i64 %t1701, ptr @"scheme.base:list->vector"
  ret i64 17
}

define i64 @"scheme.base:__init_71"() {
entry:
  %t1719 = call ptr @rt_alloc_words(i64 1)
  %t1720 = ptrtoint ptr %t1719 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector" to i64), ptr %t1719
  %t1721 = or i64 %t1720, 4
  %t1722 = call i64 @rt_root(i64 %t1721)
  store i64 %t1722, ptr @"scheme.base:vector"
  ret i64 17
}

define i64 @"scheme.base:__init_72"() {
entry:
  %t1758 = call ptr @rt_alloc_words(i64 1)
  %t1759 = ptrtoint ptr %t1758 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->bytevector" to i64), ptr %t1758
  %t1760 = or i64 %t1759, 4
  %t1761 = call i64 @rt_root(i64 %t1760)
  store i64 %t1761, ptr @"scheme.base:list->bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_73"() {
entry:
  %t1779 = call ptr @rt_alloc_words(i64 1)
  %t1780 = ptrtoint ptr %t1779 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector" to i64), ptr %t1779
  %t1781 = or i64 %t1780, 4
  %t1782 = call i64 @rt_root(i64 %t1781)
  store i64 %t1782, ptr @"scheme.base:bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_74"() {
entry:
  %t1802 = call ptr @rt_alloc_words(i64 1)
  %t1803 = ptrtoint ptr %t1802 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:values" to i64), ptr %t1802
  %t1804 = or i64 %t1803, 4
  %t1805 = call i64 @rt_root(i64 %t1804)
  store i64 %t1805, ptr @"scheme.base:values"
  ret i64 17
}

define i64 @"scheme.base:__init_75"() {
entry:
  %t1847 = call ptr @rt_alloc_words(i64 1)
  %t1848 = ptrtoint ptr %t1847 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-values" to i64), ptr %t1847
  %t1849 = or i64 %t1848, 4
  %t1850 = call i64 @rt_root(i64 %t1849)
  store i64 %t1850, ptr @"scheme.base:call-with-values"
  ret i64 17
}

define i64 @"scheme.base:__init_76"() {
entry:
  %t1851 = call i64 @rt_root(i64 64)
  store i64 %t1851, ptr @"scheme.base:%ht-initial-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_77"() {
entry:
  %t1852 = call i64 @rt_root(i64 24)
  store i64 %t1852, ptr @"scheme.base:%ht-load-factor"
  ret i64 17
}

define i64 @"scheme.base:__init_78"() {
entry:
  %t1863 = call ptr @rt_alloc_words(i64 1)
  %t1864 = ptrtoint ptr %t1863 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-hash-table" to i64), ptr %t1863
  %t1865 = or i64 %t1864, 4
  %t1866 = call i64 @rt_root(i64 %t1865)
  store i64 %t1866, ptr @"scheme.base:make-hash-table"
  ret i64 17
}

define i64 @"scheme.base:__init_79"() {
entry:
  %t1869 = call ptr @rt_alloc_words(i64 1)
  %t1870 = ptrtoint ptr %t1869 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table?" to i64), ptr %t1869
  %t1871 = or i64 %t1870, 4
  %t1872 = call i64 @rt_root(i64 %t1871)
  store i64 %t1872, ptr @"scheme.base:hash-table?"
  ret i64 17
}

define i64 @"scheme.base:__init_80"() {
entry:
  %t1876 = call ptr @rt_alloc_words(i64 1)
  %t1877 = ptrtoint ptr %t1876 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-count" to i64), ptr %t1876
  %t1878 = or i64 %t1877, 4
  %t1879 = call i64 @rt_root(i64 %t1878)
  store i64 %t1879, ptr @"scheme.base:%ht-count"
  ret i64 17
}

define i64 @"scheme.base:__init_81"() {
entry:
  %t1883 = call ptr @rt_alloc_words(i64 1)
  %t1884 = ptrtoint ptr %t1883 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-buckets" to i64), ptr %t1883
  %t1885 = or i64 %t1884, 4
  %t1886 = call i64 @rt_root(i64 %t1885)
  store i64 %t1886, ptr @"scheme.base:%ht-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_82"() {
entry:
  %t1890 = call ptr @rt_alloc_words(i64 1)
  %t1891 = ptrtoint ptr %t1890 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-count!" to i64), ptr %t1890
  %t1892 = or i64 %t1891, 4
  %t1893 = call i64 @rt_root(i64 %t1892)
  store i64 %t1893, ptr @"scheme.base:%ht-set-count!"
  ret i64 17
}

define i64 @"scheme.base:__init_83"() {
entry:
  %t1897 = call ptr @rt_alloc_words(i64 1)
  %t1898 = ptrtoint ptr %t1897 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-buckets!" to i64), ptr %t1897
  %t1899 = or i64 %t1898, 4
  %t1900 = call i64 @rt_root(i64 %t1899)
  store i64 %t1900, ptr @"scheme.base:%ht-set-buckets!"
  ret i64 17
}

define i64 @"scheme.base:__init_84"() {
entry:
  %t1904 = call ptr @rt_alloc_words(i64 1)
  %t1905 = ptrtoint ptr %t1904 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-index" to i64), ptr %t1904
  %t1906 = or i64 %t1905, 4
  %t1907 = call i64 @rt_root(i64 %t1906)
  store i64 %t1907, ptr @"scheme.base:%ht-index"
  ret i64 17
}

define i64 @"scheme.base:__init_85"() {
entry:
  %t1923 = call ptr @rt_alloc_words(i64 1)
  %t1924 = ptrtoint ptr %t1923 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-assoc" to i64), ptr %t1923
  %t1925 = or i64 %t1924, 4
  %t1926 = call i64 @rt_root(i64 %t1925)
  store i64 %t1926, ptr @"scheme.base:%ht-assoc"
  ret i64 17
}

define i64 @"scheme.base:__init_86"() {
entry:
  %t1944 = call ptr @rt_alloc_words(i64 1)
  %t1945 = ptrtoint ptr %t1944 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-remove" to i64), ptr %t1944
  %t1946 = or i64 %t1945, 4
  %t1947 = call i64 @rt_root(i64 %t1946)
  store i64 %t1947, ptr @"scheme.base:%ht-remove"
  ret i64 17
}

define i64 @"scheme.base:__init_87"() {
entry:
  %t1971 = call ptr @rt_alloc_words(i64 1)
  %t1972 = ptrtoint ptr %t1971 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref/default" to i64), ptr %t1971
  %t1973 = or i64 %t1972, 4
  %t1974 = call i64 @rt_root(i64 %t1973)
  store i64 %t1974, ptr @"scheme.base:hash-table-ref/default"
  ret i64 17
}

define i64 @"scheme.base:__init_88"() {
entry:
  %t1997 = call ptr @rt_alloc_words(i64 1)
  %t1998 = ptrtoint ptr %t1997 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-contains?" to i64), ptr %t1997
  %t1999 = or i64 %t1998, 4
  %t2000 = call i64 @rt_root(i64 %t1999)
  store i64 %t2000, ptr @"scheme.base:hash-table-contains?"
  ret i64 17
}

define i64 @"scheme.base:__init_89"() {
entry:
  %t2031 = call ptr @rt_alloc_words(i64 1)
  %t2032 = ptrtoint ptr %t2031 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref" to i64), ptr %t2031
  %t2033 = or i64 %t2032, 4
  %t2034 = call i64 @rt_root(i64 %t2033)
  store i64 %t2034, ptr @"scheme.base:hash-table-ref"
  ret i64 17
}

define i64 @"scheme.base:__init_90"() {
entry:
  %t2114 = call ptr @rt_alloc_words(i64 1)
  %t2115 = ptrtoint ptr %t2114 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-set!" to i64), ptr %t2114
  %t2116 = or i64 %t2115, 4
  %t2117 = call i64 @rt_root(i64 %t2116)
  store i64 %t2117, ptr @"scheme.base:hash-table-set!"
  ret i64 17
}

define i64 @"scheme.base:__init_91"() {
entry:
  %t2165 = call ptr @rt_alloc_words(i64 1)
  %t2166 = ptrtoint ptr %t2165 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-delete!" to i64), ptr %t2165
  %t2167 = or i64 %t2166, 4
  %t2168 = call i64 @rt_root(i64 %t2167)
  store i64 %t2168, ptr @"scheme.base:hash-table-delete!"
  ret i64 17
}

define i64 @"scheme.base:__init_92"() {
entry:
  %t2268 = call ptr @rt_alloc_words(i64 1)
  %t2269 = ptrtoint ptr %t2268 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-grow!" to i64), ptr %t2268
  %t2270 = or i64 %t2269, 4
  %t2271 = call i64 @rt_root(i64 %t2270)
  store i64 %t2271, ptr @"scheme.base:%ht-grow!"
  ret i64 17
}

define i64 @"scheme.base:__init_93"() {
entry:
  %t2279 = call ptr @rt_alloc_words(i64 1)
  %t2280 = ptrtoint ptr %t2279 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-size" to i64), ptr %t2279
  %t2281 = or i64 %t2280, 4
  %t2282 = call i64 @rt_root(i64 %t2281)
  store i64 %t2282, ptr @"scheme.base:hash-table-size"
  ret i64 17
}

define i64 @"scheme.base:__init_94"() {
entry:
  %t2299 = call ptr @rt_alloc_words(i64 1)
  %t2300 = ptrtoint ptr %t2299 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-fold-buckets" to i64), ptr %t2299
  %t2301 = or i64 %t2300, 4
  %t2302 = call i64 @rt_root(i64 %t2301)
  store i64 %t2302, ptr @"scheme.base:%ht-fold-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_95"() {
entry:
  %t2348 = call ptr @rt_alloc_words(i64 1)
  %t2349 = ptrtoint ptr %t2348 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table->alist" to i64), ptr %t2348
  %t2350 = or i64 %t2349, 4
  %t2351 = call i64 @rt_root(i64 %t2350)
  store i64 %t2351, ptr @"scheme.base:hash-table->alist"
  ret i64 17
}

define i64 @"scheme.base:__init_96"() {
entry:
  %t2370 = call ptr @rt_alloc_words(i64 1)
  %t2371 = ptrtoint ptr %t2370 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-keys" to i64), ptr %t2370
  %t2372 = or i64 %t2371, 4
  %t2373 = call i64 @rt_root(i64 %t2372)
  store i64 %t2373, ptr @"scheme.base:hash-table-keys"
  ret i64 17
}

define i64 @"scheme.base:__init_97"() {
entry:
  %t2392 = call ptr @rt_alloc_words(i64 1)
  %t2393 = ptrtoint ptr %t2392 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-values" to i64), ptr %t2392
  %t2394 = or i64 %t2393, 4
  %t2395 = call i64 @rt_root(i64 %t2394)
  store i64 %t2395, ptr @"scheme.base:hash-table-values"
  ret i64 17
}

define i64 @"scheme.base:__init_98"() {
entry:
  %t2429 = call ptr @rt_alloc_words(i64 1)
  %t2430 = ptrtoint ptr %t2429 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-ws?" to i64), ptr %t2429
  %t2431 = or i64 %t2430, 4
  %t2432 = call i64 @rt_root(i64 %t2431)
  store i64 %t2432, ptr @"scheme.base:rd-ws?"
  ret i64 17
}

define i64 @"scheme.base:__init_99"() {
entry:
  %t2450 = call ptr @rt_alloc_words(i64 1)
  %t2451 = ptrtoint ptr %t2450 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-digit?" to i64), ptr %t2450
  %t2452 = or i64 %t2451, 4
  %t2453 = call i64 @rt_root(i64 %t2452)
  store i64 %t2453, ptr @"scheme.base:rd-digit?"
  ret i64 17
}

define i64 @"scheme.base:__init_100"() {
entry:
  %t2510 = call ptr @rt_alloc_words(i64 1)
  %t2511 = ptrtoint ptr %t2510 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-delim?" to i64), ptr %t2510
  %t2512 = or i64 %t2511, 4
  %t2513 = call i64 @rt_root(i64 %t2512)
  store i64 %t2513, ptr @"scheme.base:rd-delim?"
  ret i64 17
}

define i64 @"scheme.base:__init_101"() {
entry:
  %t2551 = call ptr @rt_alloc_words(i64 1)
  %t2552 = ptrtoint ptr %t2551 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-skip-line" to i64), ptr %t2551
  %t2553 = or i64 %t2552, 4
  %t2554 = call i64 @rt_root(i64 %t2553)
  store i64 %t2554, ptr @"scheme.base:rd-skip-line"
  ret i64 17
}

define i64 @"scheme.base:__init_102"() {
entry:
  %t2611 = call ptr @rt_alloc_words(i64 1)
  %t2612 = ptrtoint ptr %t2611 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-skip-ws" to i64), ptr %t2611
  %t2613 = or i64 %t2612, 4
  %t2614 = call i64 @rt_root(i64 %t2613)
  store i64 %t2614, ptr @"scheme.base:rd-skip-ws"
  ret i64 17
}

define i64 @"scheme.base:__init_103"() {
entry:
  %t2644 = call ptr @rt_alloc_words(i64 1)
  %t2645 = ptrtoint ptr %t2644 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-token-end" to i64), ptr %t2644
  %t2646 = or i64 %t2645, 4
  %t2647 = call i64 @rt_root(i64 %t2646)
  store i64 %t2647, ptr @"scheme.base:rd-token-end"
  ret i64 17
}

define i64 @"scheme.base:__init_104"() {
entry:
  %t2677 = call ptr @rt_alloc_words(i64 1)
  %t2678 = ptrtoint ptr %t2677 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-all-digits?" to i64), ptr %t2677
  %t2679 = or i64 %t2678, 4
  %t2680 = call i64 @rt_root(i64 %t2679)
  store i64 %t2680, ptr @"scheme.base:rd-all-digits?"
  ret i64 17
}

define i64 @"scheme.base:__init_105"() {
entry:
  %t2738 = call ptr @rt_alloc_words(i64 1)
  %t2739 = ptrtoint ptr %t2738 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-numeric?" to i64), ptr %t2738
  %t2740 = or i64 %t2739, 4
  %t2741 = call i64 @rt_root(i64 %t2740)
  store i64 %t2741, ptr @"scheme.base:rd-numeric?"
  ret i64 17
}

define i64 @"scheme.base:__init_106"() {
entry:
  %t2784 = call ptr @rt_alloc_words(i64 1)
  %t2785 = ptrtoint ptr %t2784 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-digits" to i64), ptr %t2784
  %t2786 = or i64 %t2785, 4
  %t2787 = call i64 @rt_root(i64 %t2786)
  store i64 %t2787, ptr @"scheme.base:rd-digits"
  ret i64 17
}

define i64 @"scheme.base:__init_107"() {
entry:
  %t2832 = call ptr @rt_alloc_words(i64 1)
  %t2833 = ptrtoint ptr %t2832 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-parse-int" to i64), ptr %t2832
  %t2834 = or i64 %t2833, 4
  %t2835 = call i64 @rt_root(i64 %t2834)
  store i64 %t2835, ptr @"scheme.base:rd-parse-int"
  ret i64 17
}

define i64 @"scheme.base:__init_108"() {
entry:
  %t2845 = call ptr @rt_alloc_words(i64 1)
  %t2846 = ptrtoint ptr %t2845 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-dotchar?" to i64), ptr %t2845
  %t2847 = or i64 %t2846, 4
  %t2848 = call i64 @rt_root(i64 %t2847)
  store i64 %t2848, ptr @"scheme.base:rd-dotchar?"
  ret i64 17
}

define i64 @"scheme.base:__init_109"() {
entry:
  %t2866 = call ptr @rt_alloc_words(i64 1)
  %t2867 = ptrtoint ptr %t2866 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-exp-char?" to i64), ptr %t2866
  %t2868 = or i64 %t2867, 4
  %t2869 = call i64 @rt_root(i64 %t2868)
  store i64 %t2869, ptr @"scheme.base:rd-exp-char?"
  ret i64 17
}

define i64 @"scheme.base:__init_110"() {
entry:
  %t2887 = call ptr @rt_alloc_words(i64 1)
  %t2888 = ptrtoint ptr %t2887 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-sign-char?" to i64), ptr %t2887
  %t2889 = or i64 %t2888, 4
  %t2890 = call i64 @rt_root(i64 %t2889)
  store i64 %t2890, ptr @"scheme.base:rd-sign-char?"
  ret i64 17
}

define i64 @"scheme.base:__init_111"() {
entry:
  %t2921 = call ptr @rt_alloc_words(i64 1)
  %t2922 = ptrtoint ptr %t2921 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-scan-digits" to i64), ptr %t2921
  %t2923 = or i64 %t2922, 4
  %t2924 = call i64 @rt_root(i64 %t2923)
  store i64 %t2924, ptr @"scheme.base:rd-scan-digits"
  ret i64 17
}

define i64 @"scheme.base:__init_112"() {
entry:
  %t3103 = call ptr @rt_alloc_words(i64 1)
  %t3104 = ptrtoint ptr %t3103 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-flonum?" to i64), ptr %t3103
  %t3105 = or i64 %t3104, 4
  %t3106 = call i64 @rt_root(i64 %t3105)
  store i64 %t3106, ptr @"scheme.base:rd-flonum?"
  ret i64 17
}

define i64 @"scheme.base:__init_113"() {
entry:
  %t3140 = call ptr @rt_alloc_words(i64 1)
  %t3141 = ptrtoint ptr %t3140 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-atom" to i64), ptr %t3140
  %t3142 = or i64 %t3141, 4
  %t3143 = call i64 @rt_root(i64 %t3142)
  store i64 %t3143, ptr @"scheme.base:rd-atom"
  ret i64 17
}

define i64 @"scheme.base:__init_114"() {
entry:
  %t3215 = call ptr @rt_alloc_words(i64 1)
  %t3216 = ptrtoint ptr %t3215 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-hex-digit" to i64), ptr %t3215
  %t3217 = or i64 %t3216, 4
  %t3218 = call i64 @rt_root(i64 %t3217)
  store i64 %t3218, ptr @"scheme.base:rd-hex-digit"
  ret i64 17
}

define i64 @"scheme.base:__init_115"() {
entry:
  %t3278 = call ptr @rt_alloc_words(i64 1)
  %t3279 = ptrtoint ptr %t3278 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-hex" to i64), ptr %t3278
  %t3280 = or i64 %t3279, 4
  %t3281 = call i64 @rt_root(i64 %t3280)
  store i64 %t3281, ptr @"scheme.base:rd-hex"
  ret i64 17
}

define i64 @"scheme.base:__init_116"() {
entry:
  %t3311 = call ptr @rt_alloc_words(i64 1)
  %t3312 = ptrtoint ptr %t3311 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-str-esc" to i64), ptr %t3311
  %t3313 = or i64 %t3312, 4
  %t3314 = call i64 @rt_root(i64 %t3313)
  store i64 %t3314, ptr @"scheme.base:rd-str-esc"
  ret i64 17
}

define i64 @"scheme.base:__init_117"() {
entry:
  %t3447 = call ptr @rt_alloc_words(i64 1)
  %t3448 = ptrtoint ptr %t3447 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-string" to i64), ptr %t3447
  %t3449 = or i64 %t3448, 4
  %t3450 = call i64 @rt_root(i64 %t3449)
  store i64 %t3450, ptr @"scheme.base:rd-string"
  ret i64 17
}

define i64 @"scheme.base:__init_118"() {
entry:
  %t3614 = call ptr @rt_alloc_words(i64 1)
  %t3615 = ptrtoint ptr %t3614 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-hash" to i64), ptr %t3614
  %t3616 = or i64 %t3615, 4
  %t3617 = call i64 @rt_root(i64 %t3616)
  store i64 %t3617, ptr @"scheme.base:rd-hash"
  ret i64 17
}

define i64 @"scheme.base:__init_119"() {
entry:
  %t3656 = call ptr @rt_alloc_words(i64 1)
  %t3657 = ptrtoint ptr %t3656 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-char-name" to i64), ptr %t3656
  %t3658 = or i64 %t3657, 4
  %t3659 = call i64 @rt_root(i64 %t3658)
  store i64 %t3659, ptr @"scheme.base:rd-char-name"
  ret i64 17
}

define i64 @"scheme.base:__init_120"() {
entry:
  %t3698 = call ptr @rt_alloc_words(i64 1)
  %t3699 = ptrtoint ptr %t3698 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-char" to i64), ptr %t3698
  %t3700 = or i64 %t3699, 4
  %t3701 = call i64 @rt_root(i64 %t3700)
  store i64 %t3701, ptr @"scheme.base:rd-char"
  ret i64 17
}

define i64 @"scheme.base:__init_121"() {
entry:
  %t3725 = call ptr @rt_alloc_words(i64 1)
  %t3726 = ptrtoint ptr %t3725 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-quote" to i64), ptr %t3725
  %t3727 = or i64 %t3726, 4
  %t3728 = call i64 @rt_root(i64 %t3727)
  store i64 %t3728, ptr @"scheme.base:rd-quote"
  ret i64 17
}

define i64 @"scheme.base:__init_122"() {
entry:
  %t3752 = call ptr @rt_alloc_words(i64 1)
  %t3753 = ptrtoint ptr %t3752 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-quasi" to i64), ptr %t3752
  %t3754 = or i64 %t3753, 4
  %t3755 = call i64 @rt_root(i64 %t3754)
  store i64 %t3755, ptr @"scheme.base:rd-quasi"
  ret i64 17
}

define i64 @"scheme.base:__init_123"() {
entry:
  %t3826 = call ptr @rt_alloc_words(i64 1)
  %t3827 = ptrtoint ptr %t3826 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-unquote" to i64), ptr %t3826
  %t3828 = or i64 %t3827, 4
  %t3829 = call i64 @rt_root(i64 %t3828)
  store i64 %t3829, ptr @"scheme.base:rd-unquote"
  ret i64 17
}

define i64 @"scheme.base:__init_124"() {
entry:
  %t3866 = call ptr @rt_alloc_words(i64 1)
  %t3867 = ptrtoint ptr %t3866 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-dot?" to i64), ptr %t3866
  %t3868 = or i64 %t3867, 4
  %t3869 = call i64 @rt_root(i64 %t3868)
  store i64 %t3869, ptr @"scheme.base:rd-dot?"
  ret i64 17
}

define i64 @"scheme.base:__init_125"() {
entry:
  %t3882 = call ptr @rt_alloc_words(i64 1)
  %t3883 = ptrtoint ptr %t3882 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-append-reverse" to i64), ptr %t3882
  %t3884 = or i64 %t3883, 4
  %t3885 = call i64 @rt_root(i64 %t3884)
  store i64 %t3885, ptr @"scheme.base:rd-append-reverse"
  ret i64 17
}

define i64 @"scheme.base:__init_126"() {
entry:
  %t4001 = call ptr @rt_alloc_words(i64 1)
  %t4002 = ptrtoint ptr %t4001 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-list" to i64), ptr %t4001
  %t4003 = or i64 %t4002, 4
  %t4004 = call i64 @rt_root(i64 %t4003)
  store i64 %t4004, ptr @"scheme.base:rd-list"
  ret i64 17
}

define i64 @"scheme.base:__init_127"() {
entry:
  %t4154 = call ptr @rt_alloc_words(i64 1)
  %t4155 = ptrtoint ptr %t4154 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-datum" to i64), ptr %t4154
  %t4156 = or i64 %t4155, 4
  %t4157 = call i64 @rt_root(i64 %t4156)
  store i64 %t4157, ptr @"scheme.base:rd-datum"
  ret i64 17
}

define i64 @"scheme.base:__init_128"() {
entry:
  %t4173 = call ptr @rt_alloc_words(i64 1)
  %t4174 = ptrtoint ptr %t4173 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-from-string" to i64), ptr %t4173
  %t4175 = or i64 %t4174, 4
  %t4176 = call i64 @rt_root(i64 %t4175)
  store i64 %t4176, ptr @"scheme.base:read-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_129"() {
entry:
  %t4243 = call ptr @rt_alloc_words(i64 1)
  %t4244 = ptrtoint ptr %t4243 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-all-from-string" to i64), ptr %t4243
  %t4245 = or i64 %t4244, 4
  %t4246 = call i64 @rt_root(i64 %t4245)
  store i64 %t4246, ptr @"scheme.base:read-all-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_130"() {
entry:
  %t4247 = call i64 @rt_root(i64 1)
  store i64 %t4247, ptr @"scheme.base:%port-rtd-cell"
  ret i64 17
}

define i64 @"scheme.base:__init_131"() {
entry:
  %t4256 = call ptr @rt_alloc_words(i64 1)
  %t4257 = ptrtoint ptr %t4256 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%port-rtd" to i64), ptr %t4256
  %t4258 = or i64 %t4257, 4
  %t4259 = call i64 @rt_root(i64 %t4258)
  store i64 %t4259, ptr @"scheme.base:%port-rtd"
  ret i64 17
}

define i64 @"scheme.base:__init_132"() {
entry:
  %t4274 = call ptr @rt_alloc_words(i64 1)
  %t4275 = ptrtoint ptr %t4274 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%make-port" to i64), ptr %t4274
  %t4276 = or i64 %t4275, 4
  %t4277 = call i64 @rt_root(i64 %t4276)
  store i64 %t4277, ptr @"scheme.base:%make-port"
  ret i64 17
}

define i64 @"scheme.base:__init_133"() {
entry:
  %t4286 = call ptr @rt_alloc_words(i64 1)
  %t4287 = ptrtoint ptr %t4286 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port?" to i64), ptr %t4286
  %t4288 = or i64 %t4287, 4
  %t4289 = call i64 @rt_root(i64 %t4288)
  store i64 %t4289, ptr @"scheme.base:port?"
  ret i64 17
}

define i64 @"scheme.base:__init_134"() {
entry:
  %t4299 = call ptr @rt_alloc_words(i64 1)
  %t4300 = ptrtoint ptr %t4299 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port?" to i64), ptr %t4299
  %t4301 = or i64 %t4300, 4
  %t4302 = call i64 @rt_root(i64 %t4301)
  store i64 %t4302, ptr @"scheme.base:input-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_135"() {
entry:
  %t4313 = call ptr @rt_alloc_words(i64 1)
  %t4314 = ptrtoint ptr %t4313 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port?" to i64), ptr %t4313
  %t4315 = or i64 %t4314, 4
  %t4316 = call i64 @rt_root(i64 %t4315)
  store i64 %t4316, ptr @"scheme.base:output-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_136"() {
entry:
  %t4324 = call ptr @rt_alloc_words(i64 1)
  %t4325 = ptrtoint ptr %t4324 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:textual-port?" to i64), ptr %t4324
  %t4326 = or i64 %t4325, 4
  %t4327 = call i64 @rt_root(i64 %t4326)
  store i64 %t4327, ptr @"scheme.base:textual-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_137"() {
entry:
  %t4330 = call ptr @rt_alloc_words(i64 1)
  %t4331 = ptrtoint ptr %t4330 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port-closed?" to i64), ptr %t4330
  %t4332 = or i64 %t4331, 4
  %t4333 = call i64 @rt_root(i64 %t4332)
  store i64 %t4333, ptr @"scheme.base:port-closed?"
  ret i64 17
}

define i64 @"scheme.base:__init_138"() {
entry:
  %t4344 = call ptr @rt_alloc_words(i64 1)
  %t4345 = ptrtoint ptr %t4344 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port-open?" to i64), ptr %t4344
  %t4346 = or i64 %t4345, 4
  %t4347 = call i64 @rt_root(i64 %t4346)
  store i64 %t4347, ptr @"scheme.base:input-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_139"() {
entry:
  %t4358 = call ptr @rt_alloc_words(i64 1)
  %t4359 = ptrtoint ptr %t4358 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port-open?" to i64), ptr %t4358
  %t4360 = or i64 %t4359, 4
  %t4361 = call i64 @rt_root(i64 %t4360)
  store i64 %t4361, ptr @"scheme.base:output-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_140"() {
entry:
  %t4387 = call ptr @rt_alloc_words(i64 1)
  %t4388 = ptrtoint ptr %t4387 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-input-port" to i64), ptr %t4387
  %t4389 = or i64 %t4388, 4
  %t4390 = call i64 @rt_root(i64 %t4389)
  store i64 %t4390, ptr @"scheme.base:%check-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_141"() {
entry:
  %t4416 = call ptr @rt_alloc_words(i64 1)
  %t4417 = ptrtoint ptr %t4416 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-output-port" to i64), ptr %t4416
  %t4418 = or i64 %t4417, 4
  %t4419 = call i64 @rt_root(i64 %t4418)
  store i64 %t4419, ptr @"scheme.base:%check-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_142"() {
entry:
  %t4425 = call ptr @rt_alloc_words(i64 1)
  %t4426 = ptrtoint ptr %t4425 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%port-buf" to i64), ptr %t4425
  %t4427 = or i64 %t4426, 4
  %t4428 = call i64 @rt_root(i64 %t4427)
  store i64 %t4428, ptr @"scheme.base:%port-buf"
  ret i64 17
}

define i64 @"scheme.base:__init_143"() {
entry:
  %t4436 = call ptr @rt_alloc_words(i64 1)
  %t4437 = ptrtoint ptr %t4436 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-input-string" to i64), ptr %t4436
  %t4438 = or i64 %t4437, 4
  %t4439 = call i64 @rt_root(i64 %t4438)
  store i64 %t4439, ptr @"scheme.base:open-input-string"
  ret i64 17
}

define i64 @"scheme.base:__init_144"() {
entry:
  %t4457 = call ptr @rt_alloc_words(i64 1)
  %t4458 = ptrtoint ptr %t4457 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-input-file" to i64), ptr %t4457
  %t4459 = or i64 %t4458, 4
  %t4460 = call i64 @rt_root(i64 %t4459)
  store i64 %t4460, ptr @"scheme.base:open-input-file"
  ret i64 17
}

define i64 @"scheme.base:__init_145"() {
entry:
  %t4485 = call ptr @rt_alloc_words(i64 1)
  %t4486 = ptrtoint ptr %t4485 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%port-at-eof?" to i64), ptr %t4485
  %t4487 = or i64 %t4486, 4
  %t4488 = call i64 @rt_root(i64 %t4487)
  store i64 %t4488, ptr @"scheme.base:%port-at-eof?"
  ret i64 17
}

define i64 @"scheme.base:__init_146"() {
entry:
  %t4520 = call ptr @rt_alloc_words(i64 1)
  %t4521 = ptrtoint ptr %t4520 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-char" to i64), ptr %t4520
  %t4522 = or i64 %t4521, 4
  %t4523 = call i64 @rt_root(i64 %t4522)
  store i64 %t4523, ptr @"scheme.base:read-char"
  ret i64 17
}

define i64 @"scheme.base:__init_147"() {
entry:
  %t4548 = call ptr @rt_alloc_words(i64 1)
  %t4549 = ptrtoint ptr %t4548 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:peek-char" to i64), ptr %t4548
  %t4550 = or i64 %t4549, 4
  %t4551 = call i64 @rt_root(i64 %t4550)
  store i64 %t4551, ptr @"scheme.base:peek-char"
  ret i64 17
}

define i64 @"scheme.base:__init_148"() {
entry:
  %t4669 = call ptr @rt_alloc_words(i64 1)
  %t4670 = ptrtoint ptr %t4669 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-line" to i64), ptr %t4669
  %t4671 = or i64 %t4670, 4
  %t4672 = call i64 @rt_root(i64 %t4671)
  store i64 %t4672, ptr @"scheme.base:read-line"
  ret i64 17
}

define i64 @"scheme.base:__init_149"() {
entry:
  %t4720 = call ptr @rt_alloc_words(i64 1)
  %t4721 = ptrtoint ptr %t4720 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-string" to i64), ptr %t4720
  %t4722 = or i64 %t4721, 4
  %t4723 = call i64 @rt_root(i64 %t4722)
  store i64 %t4723, ptr @"scheme.base:read-string"
  ret i64 17
}

define i64 @"scheme.base:__init_150"() {
entry:
  %t4774 = call ptr @rt_alloc_words(i64 1)
  %t4775 = ptrtoint ptr %t4774 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read" to i64), ptr %t4774
  %t4776 = or i64 %t4775, 4
  %t4777 = call i64 @rt_root(i64 %t4776)
  store i64 %t4777, ptr @"scheme.base:read"
  ret i64 17
}

define i64 @"scheme.base:__init_151"() {
entry:
  %t4795 = call ptr @rt_alloc_words(i64 1)
  %t4796 = ptrtoint ptr %t4795 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-output-file" to i64), ptr %t4795
  %t4797 = or i64 %t4796, 4
  %t4798 = call i64 @rt_root(i64 %t4797)
  store i64 %t4798, ptr @"scheme.base:open-output-file"
  ret i64 17
}

define i64 @"scheme.base:__init_152"() {
entry:
  %t4816 = call ptr @rt_alloc_words(i64 1)
  %t4817 = ptrtoint ptr %t4816 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-output-string" to i64), ptr %t4816
  %t4818 = or i64 %t4817, 4
  %t4819 = call i64 @rt_root(i64 %t4818)
  store i64 %t4819, ptr @"scheme.base:open-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_153"() {
entry:
  %t4850 = call ptr @rt_alloc_words(i64 1)
  %t4851 = ptrtoint ptr %t4850 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:get-output-string" to i64), ptr %t4850
  %t4852 = or i64 %t4851, 4
  %t4853 = call i64 @rt_root(i64 %t4852)
  store i64 %t4853, ptr @"scheme.base:get-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_154"() {
entry:
  %t4864 = call ptr @rt_alloc_words(i64 1)
  %t4865 = ptrtoint ptr %t4864 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:flush-output-port" to i64), ptr %t4864
  %t4866 = or i64 %t4865, 4
  %t4867 = call i64 @rt_root(i64 %t4866)
  store i64 %t4867, ptr @"scheme.base:flush-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_155"() {
entry:
  %t4896 = call ptr @rt_alloc_words(i64 1)
  %t4897 = ptrtoint ptr %t4896 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-port" to i64), ptr %t4896
  %t4898 = or i64 %t4897, 4
  %t4899 = call i64 @rt_root(i64 %t4898)
  store i64 %t4899, ptr @"scheme.base:close-port"
  ret i64 17
}

define i64 @"scheme.base:__init_156"() {
entry:
  %t4922 = call ptr @rt_alloc_words(i64 1)
  %t4923 = ptrtoint ptr %t4922 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-input-port" to i64), ptr %t4922
  %t4924 = or i64 %t4923, 4
  %t4925 = call i64 @rt_root(i64 %t4924)
  store i64 %t4925, ptr @"scheme.base:close-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_157"() {
entry:
  %t4948 = call ptr @rt_alloc_words(i64 1)
  %t4949 = ptrtoint ptr %t4948 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-output-port" to i64), ptr %t4948
  %t4950 = or i64 %t4949, 4
  %t4951 = call i64 @rt_root(i64 %t4950)
  store i64 %t4951, ptr @"scheme.base:close-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_158"() {
entry:
  %t4952 = call i64 @rt_root(i64 1)
  store i64 %t4952, ptr @"scheme.base:%stdout-port"
  ret i64 17
}

define i64 @"scheme.base:__init_159"() {
entry:
  %t4953 = call i64 @rt_root(i64 1)
  store i64 %t4953, ptr @"scheme.base:%stderr-port"
  ret i64 17
}

define i64 @"scheme.base:__init_160"() {
entry:
  %t4954 = call i64 @rt_root(i64 1)
  store i64 %t4954, ptr @"scheme.base:%stdin-port"
  ret i64 17
}

define i64 @"scheme.base:__init_161"() {
entry:
  %t4986 = call ptr @rt_alloc_words(i64 1)
  %t4987 = ptrtoint ptr %t4986 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-output-port" to i64), ptr %t4986
  %t4988 = or i64 %t4987, 4
  %t4989 = call i64 @rt_root(i64 %t4988)
  store i64 %t4989, ptr @"scheme.base:current-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_162"() {
entry:
  %t5018 = call ptr @rt_alloc_words(i64 1)
  %t5019 = ptrtoint ptr %t5018 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-error-port" to i64), ptr %t5018
  %t5020 = or i64 %t5019, 4
  %t5021 = call i64 @rt_root(i64 %t5020)
  store i64 %t5021, ptr @"scheme.base:current-error-port"
  ret i64 17
}

define i64 @"scheme.base:__init_163"() {
entry:
  %t5050 = call ptr @rt_alloc_words(i64 1)
  %t5051 = ptrtoint ptr %t5050 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-input-port" to i64), ptr %t5050
  %t5052 = or i64 %t5051, 4
  %t5053 = call i64 @rt_root(i64 %t5052)
  store i64 %t5053, ptr @"scheme.base:current-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_164"() {
entry:
  %t5100 = call ptr @rt_alloc_words(i64 1)
  %t5101 = ptrtoint ptr %t5100 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-port" to i64), ptr %t5100
  %t5102 = or i64 %t5101, 4
  %t5103 = call i64 @rt_root(i64 %t5102)
  store i64 %t5103, ptr @"scheme.base:call-with-port"
  ret i64 17
}

define i64 @"scheme.base:__init_165"() {
entry:
  %t5164 = call ptr @rt_alloc_words(i64 1)
  %t5165 = ptrtoint ptr %t5164 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-output-to-file" to i64), ptr %t5164
  %t5166 = or i64 %t5165, 4
  %t5167 = call i64 @rt_root(i64 %t5166)
  store i64 %t5167, ptr @"scheme.base:with-output-to-file"
  ret i64 17
}

define i64 @"scheme.base:__init_166"() {
entry:
  %t5228 = call ptr @rt_alloc_words(i64 1)
  %t5229 = ptrtoint ptr %t5228 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-input-from-file" to i64), ptr %t5228
  %t5230 = or i64 %t5229, 4
  %t5231 = call i64 @rt_root(i64 %t5230)
  store i64 %t5231, ptr @"scheme.base:with-input-from-file"
  ret i64 17
}

define i64 @"scheme.base:__init_167"() {
entry:
  %t5245 = call ptr @rt_alloc_words(i64 1)
  %t5246 = ptrtoint ptr %t5245 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-output-file" to i64), ptr %t5245
  %t5247 = or i64 %t5246, 4
  %t5248 = call i64 @rt_root(i64 %t5247)
  store i64 %t5248, ptr @"scheme.base:call-with-output-file"
  ret i64 17
}

define i64 @"scheme.base:__init_168"() {
entry:
  %t5262 = call ptr @rt_alloc_words(i64 1)
  %t5263 = ptrtoint ptr %t5262 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-input-file" to i64), ptr %t5262
  %t5264 = or i64 %t5263, 4
  %t5265 = call i64 @rt_root(i64 %t5264)
  store i64 %t5265, ptr @"scheme.base:call-with-input-file"
  ret i64 17
}

define i64 @"scheme.base:__init"() {
entry:
  %f = load i64, ptr @"scheme.base:__inited"
  %c = icmp ne i64 %f, 0
  br i1 %c, label %already, label %run
already:
  ret i64 2
run:
  store i64 8, ptr @"scheme.base:__inited"
  call i64 @"scheme.base:__init_1"()
  call i64 @"scheme.base:__init_2"()
  call i64 @"scheme.base:__init_3"()
  call i64 @"scheme.base:__init_4"()
  call i64 @"scheme.base:__init_5"()
  call i64 @"scheme.base:__init_6"()
  call i64 @"scheme.base:__init_7"()
  call i64 @"scheme.base:__init_8"()
  call i64 @"scheme.base:__init_9"()
  call i64 @"scheme.base:__init_10"()
  call i64 @"scheme.base:__init_11"()
  call i64 @"scheme.base:__init_12"()
  call i64 @"scheme.base:__init_13"()
  call i64 @"scheme.base:__init_14"()
  call i64 @"scheme.base:__init_15"()
  call i64 @"scheme.base:__init_16"()
  call i64 @"scheme.base:__init_17"()
  call i64 @"scheme.base:__init_18"()
  call i64 @"scheme.base:__init_19"()
  call i64 @"scheme.base:__init_20"()
  call i64 @"scheme.base:__init_21"()
  call i64 @"scheme.base:__init_22"()
  call i64 @"scheme.base:__init_23"()
  call i64 @"scheme.base:__init_24"()
  call i64 @"scheme.base:__init_25"()
  call i64 @"scheme.base:__init_26"()
  call i64 @"scheme.base:__init_27"()
  call i64 @"scheme.base:__init_28"()
  call i64 @"scheme.base:__init_29"()
  call i64 @"scheme.base:__init_30"()
  call i64 @"scheme.base:__init_31"()
  call i64 @"scheme.base:__init_32"()
  call i64 @"scheme.base:__init_33"()
  call i64 @"scheme.base:__init_34"()
  call i64 @"scheme.base:__init_35"()
  call i64 @"scheme.base:__init_36"()
  call i64 @"scheme.base:__init_37"()
  call i64 @"scheme.base:__init_38"()
  call i64 @"scheme.base:__init_39"()
  call i64 @"scheme.base:__init_40"()
  call i64 @"scheme.base:__init_41"()
  call i64 @"scheme.base:__init_42"()
  call i64 @"scheme.base:__init_43"()
  call i64 @"scheme.base:__init_44"()
  call i64 @"scheme.base:__init_45"()
  call i64 @"scheme.base:__init_46"()
  call i64 @"scheme.base:__init_47"()
  call i64 @"scheme.base:__init_48"()
  call i64 @"scheme.base:__init_49"()
  call i64 @"scheme.base:__init_50"()
  call i64 @"scheme.base:__init_51"()
  call i64 @"scheme.base:__init_52"()
  call i64 @"scheme.base:__init_53"()
  call i64 @"scheme.base:__init_54"()
  call i64 @"scheme.base:__init_55"()
  call i64 @"scheme.base:__init_56"()
  call i64 @"scheme.base:__init_57"()
  call i64 @"scheme.base:__init_58"()
  call i64 @"scheme.base:__init_59"()
  call i64 @"scheme.base:__init_60"()
  call i64 @"scheme.base:__init_61"()
  call i64 @"scheme.base:__init_62"()
  call i64 @"scheme.base:__init_63"()
  call i64 @"scheme.base:__init_64"()
  call i64 @"scheme.base:__init_65"()
  call i64 @"scheme.base:__init_66"()
  call i64 @"scheme.base:__init_67"()
  call i64 @"scheme.base:__init_68"()
  call i64 @"scheme.base:__init_69"()
  call i64 @"scheme.base:__init_70"()
  call i64 @"scheme.base:__init_71"()
  call i64 @"scheme.base:__init_72"()
  call i64 @"scheme.base:__init_73"()
  call i64 @"scheme.base:__init_74"()
  call i64 @"scheme.base:__init_75"()
  call i64 @"scheme.base:__init_76"()
  call i64 @"scheme.base:__init_77"()
  call i64 @"scheme.base:__init_78"()
  call i64 @"scheme.base:__init_79"()
  call i64 @"scheme.base:__init_80"()
  call i64 @"scheme.base:__init_81"()
  call i64 @"scheme.base:__init_82"()
  call i64 @"scheme.base:__init_83"()
  call i64 @"scheme.base:__init_84"()
  call i64 @"scheme.base:__init_85"()
  call i64 @"scheme.base:__init_86"()
  call i64 @"scheme.base:__init_87"()
  call i64 @"scheme.base:__init_88"()
  call i64 @"scheme.base:__init_89"()
  call i64 @"scheme.base:__init_90"()
  call i64 @"scheme.base:__init_91"()
  call i64 @"scheme.base:__init_92"()
  call i64 @"scheme.base:__init_93"()
  call i64 @"scheme.base:__init_94"()
  call i64 @"scheme.base:__init_95"()
  call i64 @"scheme.base:__init_96"()
  call i64 @"scheme.base:__init_97"()
  call i64 @"scheme.base:__init_98"()
  call i64 @"scheme.base:__init_99"()
  call i64 @"scheme.base:__init_100"()
  call i64 @"scheme.base:__init_101"()
  call i64 @"scheme.base:__init_102"()
  call i64 @"scheme.base:__init_103"()
  call i64 @"scheme.base:__init_104"()
  call i64 @"scheme.base:__init_105"()
  call i64 @"scheme.base:__init_106"()
  call i64 @"scheme.base:__init_107"()
  call i64 @"scheme.base:__init_108"()
  call i64 @"scheme.base:__init_109"()
  call i64 @"scheme.base:__init_110"()
  call i64 @"scheme.base:__init_111"()
  call i64 @"scheme.base:__init_112"()
  call i64 @"scheme.base:__init_113"()
  call i64 @"scheme.base:__init_114"()
  call i64 @"scheme.base:__init_115"()
  call i64 @"scheme.base:__init_116"()
  call i64 @"scheme.base:__init_117"()
  call i64 @"scheme.base:__init_118"()
  call i64 @"scheme.base:__init_119"()
  call i64 @"scheme.base:__init_120"()
  call i64 @"scheme.base:__init_121"()
  call i64 @"scheme.base:__init_122"()
  call i64 @"scheme.base:__init_123"()
  call i64 @"scheme.base:__init_124"()
  call i64 @"scheme.base:__init_125"()
  call i64 @"scheme.base:__init_126"()
  call i64 @"scheme.base:__init_127"()
  call i64 @"scheme.base:__init_128"()
  call i64 @"scheme.base:__init_129"()
  call i64 @"scheme.base:__init_130"()
  call i64 @"scheme.base:__init_131"()
  call i64 @"scheme.base:__init_132"()
  call i64 @"scheme.base:__init_133"()
  call i64 @"scheme.base:__init_134"()
  call i64 @"scheme.base:__init_135"()
  call i64 @"scheme.base:__init_136"()
  call i64 @"scheme.base:__init_137"()
  call i64 @"scheme.base:__init_138"()
  call i64 @"scheme.base:__init_139"()
  call i64 @"scheme.base:__init_140"()
  call i64 @"scheme.base:__init_141"()
  call i64 @"scheme.base:__init_142"()
  call i64 @"scheme.base:__init_143"()
  call i64 @"scheme.base:__init_144"()
  call i64 @"scheme.base:__init_145"()
  call i64 @"scheme.base:__init_146"()
  call i64 @"scheme.base:__init_147"()
  call i64 @"scheme.base:__init_148"()
  call i64 @"scheme.base:__init_149"()
  call i64 @"scheme.base:__init_150"()
  call i64 @"scheme.base:__init_151"()
  call i64 @"scheme.base:__init_152"()
  call i64 @"scheme.base:__init_153"()
  call i64 @"scheme.base:__init_154"()
  call i64 @"scheme.base:__init_155"()
  call i64 @"scheme.base:__init_156"()
  call i64 @"scheme.base:__init_157"()
  call i64 @"scheme.base:__init_158"()
  call i64 @"scheme.base:__init_159"()
  call i64 @"scheme.base:__init_160"()
  call i64 @"scheme.base:__init_161"()
  call i64 @"scheme.base:__init_162"()
  call i64 @"scheme.base:__init_163"()
  call i64 @"scheme.base:__init_164"()
  call i64 @"scheme.base:__init_165"()
  call i64 @"scheme.base:__init_166"()
  call i64 @"scheme.base:__init_167"()
  call i64 @"scheme.base:__init_168"()
  ret i64 2
}
define internal i64 @__apply0(i64 %clos) {
entry:
  %b = and i64 %clos, -8
  %bp = inttoptr i64 %b to ptr
  %code = load i64, ptr %bp
  %fp = inttoptr i64 %code to ptr
  %r = call fastcc i64 %fp(i64 %clos, i64 0, i64 undef, i64 undef, i64 undef, i64 undef, i64 undef, i64 undef, i64 undef, i64 undef, ptr null)
  ret i64 %r
}

