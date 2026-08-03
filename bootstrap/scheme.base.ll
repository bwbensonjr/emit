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
declare {i64, i1} @llvm.sadd.with.overflow.i64(i64, i64)
declare {i64, i1} @llvm.ssub.with.overflow.i64(i64, i64)
declare {i64, i1} @llvm.smul.with.overflow.i64(i64, i64)

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
@"scheme.base:%minmax-fold" = global i64 0
@"scheme.base:%minmax" = global i64 0
@"scheme.base:max" = global i64 0
@"scheme.base:min" = global i64 0
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
@"scheme.base:rd-digits-neg" = global i64 0
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
  %t147 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t148 = extractvalue {i64, i1} %t147, 0
  %t149 = extractvalue {i64, i1} %t147, 1
  br i1 %t149, label %fixslow32, label %fixmerge33
fixslow32:
  %t150 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge33
fixmerge33:
  %t151 = phi i64 [ %t148, %fixfast31 ], [ %t150, %fixslow32 ]
  %t152 = musttail call fastcc i64 @"scheme.base:code_31"(i64 %self, i64 2, i64 %t143, i64 %t151, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t152
}

define fastcc i64 @"scheme.base:code:length"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t153 = icmp eq i64 %argc, 1
  br i1 %t153, label %argok35, label %arityerr34
arityerr34:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok35:
  %t154 = call ptr @rt_alloc_words(i64 2)
  %t155 = ptrtoint ptr %t154 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_31" to i64), ptr %t154
  %t156 = or i64 %t155, 4
  %t157 = getelementptr i64, ptr %t154, i64 1
  store i64 %t156, ptr %t157
  %t158 = musttail call fastcc i64 @"scheme.base:code_31"(i64 %t156, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t158
}

define fastcc i64 @"scheme.base:code_38"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t163 = icmp eq i64 %argc, 2
  br i1 %t163, label %argok37, label %arityerr36
arityerr36:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok37:
  %t164 = call i64 @rt_null_p(i64 %a0)
  %t165 = icmp ne i64 %t164, 1
  br i1 %t165, label %then38, label %else39
then38:
  ret i64 %a1
else39:
  %t166 = call i64 @rt_cdr(i64 %a0)
  %t167 = call i64 @rt_car(i64 %a0)
  %t168 = call i64 @rt_cons(i64 %t167, i64 %a1)
  %t169 = musttail call fastcc i64 @"scheme.base:code_38"(i64 %self, i64 2, i64 %t166, i64 %t168, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t169
}

define fastcc i64 @"scheme.base:code:reverse"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t170 = icmp eq i64 %argc, 1
  br i1 %t170, label %argok41, label %arityerr40
arityerr40:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok41:
  %t171 = call ptr @rt_alloc_words(i64 2)
  %t172 = ptrtoint ptr %t171 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_38" to i64), ptr %t171
  %t173 = or i64 %t172, 4
  %t174 = getelementptr i64, ptr %t171, i64 1
  store i64 %t173, ptr %t174
  %t175 = musttail call fastcc i64 @"scheme.base:code_38"(i64 %t173, i64 2, i64 %a0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t175
}

define fastcc i64 @"scheme.base:code:%append2"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t180 = icmp eq i64 %argc, 2
  br i1 %t180, label %argok43, label %arityerr42
arityerr42:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok43:
  %t181 = call i64 @rt_null_p(i64 %a0)
  %t182 = icmp ne i64 %t181, 1
  br i1 %t182, label %then44, label %else45
then44:
  ret i64 %a1
else45:
  %t183 = call i64 @rt_car(i64 %a0)
  %t184 = call i64 @rt_cdr(i64 %a0)
  %t185 = load i64, ptr @"scheme.base:%append2"
  %t186 = and i64 %t185, -8
  %t187 = inttoptr i64 %t186 to ptr
  %t188 = load i64, ptr %t187
  %t189 = inttoptr i64 %t188 to ptr
  %t190 = call fastcc i64%t189(i64 %t185, i64 2, i64 %t184, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t191 = call i64 @rt_cons(i64 %t183, i64 %t190)
  ret i64 %t191
}

define fastcc i64 @"scheme.base:code:append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t196 = icmp sge i64 %argc, 0
  br i1 %t196, label %argok47, label %arityerr46
arityerr46:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok47:
  %t197 = call ptr @rt_alloc_words(i64 8)
  %t198 = getelementptr i64, ptr %t197, i64 0
  store i64 %a0, ptr %t198
  %t199 = getelementptr i64, ptr %t197, i64 1
  store i64 %a1, ptr %t199
  %t200 = getelementptr i64, ptr %t197, i64 2
  store i64 %a2, ptr %t200
  %t201 = getelementptr i64, ptr %t197, i64 3
  store i64 %a3, ptr %t201
  %t202 = getelementptr i64, ptr %t197, i64 4
  store i64 %a4, ptr %t202
  %t203 = getelementptr i64, ptr %t197, i64 5
  store i64 %a5, ptr %t203
  %t204 = getelementptr i64, ptr %t197, i64 6
  store i64 %a6, ptr %t204
  %t205 = getelementptr i64, ptr %t197, i64 7
  store i64 %a7, ptr %t205
  %t206 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t197, ptr %overflow)
  %t207 = call i64 @rt_null_p(i64 %t206)
  %t208 = icmp ne i64 %t207, 1
  br i1 %t208, label %then48, label %else49
then48:
  ret i64 2
else49:
  %t209 = call i64 @rt_cdr(i64 %t206)
  %t210 = call i64 @rt_null_p(i64 %t209)
  %t211 = icmp ne i64 %t210, 1
  br i1 %t211, label %then50, label %else51
then50:
  %t212 = call i64 @rt_car(i64 %t206)
  ret i64 %t212
else51:
  %t213 = call i64 @rt_car(i64 %t206)
  %t214 = call i64 @rt_cdr(i64 %t206)
  %t215 = load i64, ptr @"scheme.base:append"
  %t216 = and i64 %t215, -8
  %t217 = inttoptr i64 %t216 to ptr
  %t218 = load i64, ptr %t217
  %t219 = inttoptr i64 %t218 to ptr
  %t220 = call i64 @rt_list_length(i64 %t214)
  %t221 = add i64 0, %t220
  %t222 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t214, i64 8)
  %t234 = getelementptr i64, ptr %t222, i64 0
  %t226 = load i64, ptr %t234
  %t235 = getelementptr i64, ptr %t222, i64 1
  %t227 = load i64, ptr %t235
  %t236 = getelementptr i64, ptr %t222, i64 2
  %t228 = load i64, ptr %t236
  %t237 = getelementptr i64, ptr %t222, i64 3
  %t229 = load i64, ptr %t237
  %t238 = getelementptr i64, ptr %t222, i64 4
  %t230 = load i64, ptr %t238
  %t239 = getelementptr i64, ptr %t222, i64 5
  %t231 = load i64, ptr %t239
  %t240 = getelementptr i64, ptr %t222, i64 6
  %t232 = load i64, ptr %t240
  %t241 = getelementptr i64, ptr %t222, i64 7
  %t233 = load i64, ptr %t241
  %t223 = icmp sgt i64 %t221, 8
  %t224 = getelementptr i64, ptr %t222, i64 8
  %t225 = select i1 %t223, ptr %t224, ptr null
  %t242 = call fastcc i64%t219(i64 %t215, i64 %t221, i64 %t226, i64 %t227, i64 %t228, i64 %t229, i64 %t230, i64 %t231, i64 %t232, i64 %t233, ptr %t225)
  %t243 = load i64, ptr @"scheme.base:%append2"
  %t244 = and i64 %t243, -8
  %t245 = inttoptr i64 %t244 to ptr
  %t246 = load i64, ptr %t245
  %t247 = inttoptr i64 %t246 to ptr
  %t248 = musttail call fastcc i64 %t247(i64 %t243, i64 2, i64 %t213, i64 %t242, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t248
}

define fastcc i64 @"scheme.base:code:%map1"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t253 = icmp eq i64 %argc, 2
  br i1 %t253, label %argok53, label %arityerr52
arityerr52:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok53:
  %t254 = call i64 @rt_null_p(i64 %a1)
  %t255 = icmp ne i64 %t254, 1
  br i1 %t255, label %then54, label %else55
then54:
  ret i64 2
else55:
  %t256 = call i64 @rt_car(i64 %a1)
  %t257 = and i64 %a0, -8
  %t258 = inttoptr i64 %t257 to ptr
  %t259 = load i64, ptr %t258
  %t260 = inttoptr i64 %t259 to ptr
  %t261 = call fastcc i64%t260(i64 %a0, i64 1, i64 %t256, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t262 = call i64 @rt_cdr(i64 %a1)
  %t263 = load i64, ptr @"scheme.base:%map1"
  %t264 = and i64 %t263, -8
  %t265 = inttoptr i64 %t264 to ptr
  %t266 = load i64, ptr %t265
  %t267 = inttoptr i64 %t266 to ptr
  %t268 = call fastcc i64%t267(i64 %t263, i64 2, i64 %a0, i64 %t262, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t269 = call i64 @rt_cons(i64 %t261, i64 %t268)
  ret i64 %t269
}

define fastcc i64 @"scheme.base:code:%any-null?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t274 = icmp eq i64 %argc, 1
  br i1 %t274, label %argok57, label %arityerr56
arityerr56:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok57:
  %t275 = call i64 @rt_null_p(i64 %a0)
  %t276 = icmp ne i64 %t275, 1
  br i1 %t276, label %then58, label %else59
then58:
  ret i64 1
else59:
  %t277 = call i64 @rt_car(i64 %a0)
  %t278 = call i64 @rt_null_p(i64 %t277)
  %t279 = icmp ne i64 %t278, 1
  br i1 %t279, label %then60, label %else61
then60:
  ret i64 257
else61:
  %t280 = call i64 @rt_cdr(i64 %a0)
  %t281 = load i64, ptr @"scheme.base:%any-null?"
  %t282 = and i64 %t281, -8
  %t283 = inttoptr i64 %t282 to ptr
  %t284 = load i64, ptr %t283
  %t285 = inttoptr i64 %t284 to ptr
  %t286 = musttail call fastcc i64 %t285(i64 %t281, i64 1, i64 %t280, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t286
}

define fastcc i64 @"scheme.base:code_55"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t291 = icmp eq i64 %argc, 1
  br i1 %t291, label %argok63, label %arityerr62
arityerr62:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok63:
  %t292 = call i64 @rt_car(i64 %a0)
  ret i64 %t292
}

define fastcc i64 @"scheme.base:code_57"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t293 = icmp eq i64 %argc, 1
  br i1 %t293, label %argok65, label %arityerr64
arityerr64:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok65:
  %t294 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t294
}

define fastcc i64 @"scheme.base:code:%mapn"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t295 = icmp eq i64 %argc, 2
  br i1 %t295, label %argok67, label %arityerr66
arityerr66:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok67:
  %t296 = load i64, ptr @"scheme.base:%any-null?"
  %t297 = and i64 %t296, -8
  %t298 = inttoptr i64 %t297 to ptr
  %t299 = load i64, ptr %t298
  %t300 = inttoptr i64 %t299 to ptr
  %t301 = call fastcc i64%t300(i64 %t296, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t302 = icmp ne i64 %t301, 1
  br i1 %t302, label %then68, label %else69
then68:
  ret i64 2
else69:
  %t303 = call ptr @rt_alloc_words(i64 1)
  %t304 = ptrtoint ptr %t303 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_55" to i64), ptr %t303
  %t305 = or i64 %t304, 4
  %t306 = load i64, ptr @"scheme.base:%map1"
  %t307 = and i64 %t306, -8
  %t308 = inttoptr i64 %t307 to ptr
  %t309 = load i64, ptr %t308
  %t310 = inttoptr i64 %t309 to ptr
  %t311 = call fastcc i64%t310(i64 %t306, i64 2, i64 %t305, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t312 = and i64 %a0, -8
  %t313 = inttoptr i64 %t312 to ptr
  %t314 = load i64, ptr %t313
  %t315 = inttoptr i64 %t314 to ptr
  %t316 = call i64 @rt_list_length(i64 %t311)
  %t317 = add i64 0, %t316
  %t318 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t311, i64 8)
  %t330 = getelementptr i64, ptr %t318, i64 0
  %t322 = load i64, ptr %t330
  %t331 = getelementptr i64, ptr %t318, i64 1
  %t323 = load i64, ptr %t331
  %t332 = getelementptr i64, ptr %t318, i64 2
  %t324 = load i64, ptr %t332
  %t333 = getelementptr i64, ptr %t318, i64 3
  %t325 = load i64, ptr %t333
  %t334 = getelementptr i64, ptr %t318, i64 4
  %t326 = load i64, ptr %t334
  %t335 = getelementptr i64, ptr %t318, i64 5
  %t327 = load i64, ptr %t335
  %t336 = getelementptr i64, ptr %t318, i64 6
  %t328 = load i64, ptr %t336
  %t337 = getelementptr i64, ptr %t318, i64 7
  %t329 = load i64, ptr %t337
  %t319 = icmp sgt i64 %t317, 8
  %t320 = getelementptr i64, ptr %t318, i64 8
  %t321 = select i1 %t319, ptr %t320, ptr null
  %t338 = call fastcc i64%t315(i64 %a0, i64 %t317, i64 %t322, i64 %t323, i64 %t324, i64 %t325, i64 %t326, i64 %t327, i64 %t328, i64 %t329, ptr %t321)
  %t339 = call ptr @rt_alloc_words(i64 1)
  %t340 = ptrtoint ptr %t339 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_57" to i64), ptr %t339
  %t341 = or i64 %t340, 4
  %t342 = load i64, ptr @"scheme.base:%map1"
  %t343 = and i64 %t342, -8
  %t344 = inttoptr i64 %t343 to ptr
  %t345 = load i64, ptr %t344
  %t346 = inttoptr i64 %t345 to ptr
  %t347 = call fastcc i64%t346(i64 %t342, i64 2, i64 %t341, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t348 = load i64, ptr @"scheme.base:%mapn"
  %t349 = and i64 %t348, -8
  %t350 = inttoptr i64 %t349 to ptr
  %t351 = load i64, ptr %t350
  %t352 = inttoptr i64 %t351 to ptr
  %t353 = call fastcc i64%t352(i64 %t348, i64 2, i64 %a0, i64 %t347, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t354 = call i64 @rt_cons(i64 %t338, i64 %t353)
  ret i64 %t354
}

define fastcc i64 @"scheme.base:code:map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t359 = icmp sge i64 %argc, 2
  br i1 %t359, label %argok71, label %arityerr70
arityerr70:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok71:
  %t360 = call ptr @rt_alloc_words(i64 8)
  %t361 = getelementptr i64, ptr %t360, i64 0
  store i64 %a0, ptr %t361
  %t362 = getelementptr i64, ptr %t360, i64 1
  store i64 %a1, ptr %t362
  %t363 = getelementptr i64, ptr %t360, i64 2
  store i64 %a2, ptr %t363
  %t364 = getelementptr i64, ptr %t360, i64 3
  store i64 %a3, ptr %t364
  %t365 = getelementptr i64, ptr %t360, i64 4
  store i64 %a4, ptr %t365
  %t366 = getelementptr i64, ptr %t360, i64 5
  store i64 %a5, ptr %t366
  %t367 = getelementptr i64, ptr %t360, i64 6
  store i64 %a6, ptr %t367
  %t368 = getelementptr i64, ptr %t360, i64 7
  store i64 %a7, ptr %t368
  %t369 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t360, ptr %overflow)
  %t370 = call i64 @rt_null_p(i64 %t369)
  %t371 = icmp ne i64 %t370, 1
  br i1 %t371, label %then72, label %else73
then72:
  %t372 = load i64, ptr @"scheme.base:%map1"
  %t373 = and i64 %t372, -8
  %t374 = inttoptr i64 %t373 to ptr
  %t375 = load i64, ptr %t374
  %t376 = inttoptr i64 %t375 to ptr
  %t377 = musttail call fastcc i64 %t376(i64 %t372, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t377
else73:
  %t378 = call i64 @rt_cons(i64 %a1, i64 %t369)
  %t379 = load i64, ptr @"scheme.base:%mapn"
  %t380 = and i64 %t379, -8
  %t381 = inttoptr i64 %t380 to ptr
  %t382 = load i64, ptr %t381
  %t383 = inttoptr i64 %t382 to ptr
  %t384 = musttail call fastcc i64 %t383(i64 %t379, i64 2, i64 %a0, i64 %t378, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t384
}

define fastcc i64 @"scheme.base:code:memq"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t389 = icmp eq i64 %argc, 2
  br i1 %t389, label %argok75, label %arityerr74
arityerr74:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok75:
  %t390 = call i64 @rt_null_p(i64 %a1)
  %t391 = icmp ne i64 %t390, 1
  br i1 %t391, label %then76, label %else77
then76:
  ret i64 1
else77:
  %t392 = call i64 @rt_car(i64 %a1)
  %t393 = call i64 @rt_eq_p(i64 %a0, i64 %t392)
  %t394 = icmp ne i64 %t393, 1
  br i1 %t394, label %then78, label %else79
then78:
  ret i64 %a1
else79:
  %t395 = call i64 @rt_cdr(i64 %a1)
  %t396 = load i64, ptr @"scheme.base:memq"
  %t397 = and i64 %t396, -8
  %t398 = inttoptr i64 %t397 to ptr
  %t399 = load i64, ptr %t398
  %t400 = inttoptr i64 %t399 to ptr
  %t401 = musttail call fastcc i64 %t400(i64 %t396, i64 2, i64 %a0, i64 %t395, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t401
}

define fastcc i64 @"scheme.base:code:memv"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t406 = icmp eq i64 %argc, 2
  br i1 %t406, label %argok81, label %arityerr80
arityerr80:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok81:
  %t407 = call i64 @rt_null_p(i64 %a1)
  %t408 = icmp ne i64 %t407, 1
  br i1 %t408, label %then82, label %else83
then82:
  ret i64 1
else83:
  %t409 = call i64 @rt_car(i64 %a1)
  %t410 = call i64 @rt_eqv_p(i64 %a0, i64 %t409)
  %t411 = icmp ne i64 %t410, 1
  br i1 %t411, label %then84, label %else85
then84:
  ret i64 %a1
else85:
  %t412 = call i64 @rt_cdr(i64 %a1)
  %t413 = load i64, ptr @"scheme.base:memv"
  %t414 = and i64 %t413, -8
  %t415 = inttoptr i64 %t414 to ptr
  %t416 = load i64, ptr %t415
  %t417 = inttoptr i64 %t416 to ptr
  %t418 = musttail call fastcc i64 %t417(i64 %t413, i64 2, i64 %a0, i64 %t412, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t418
}

define fastcc i64 @"scheme.base:code:assq"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t423 = icmp eq i64 %argc, 2
  br i1 %t423, label %argok87, label %arityerr86
arityerr86:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok87:
  %t424 = call i64 @rt_null_p(i64 %a1)
  %t425 = icmp ne i64 %t424, 1
  br i1 %t425, label %then88, label %else89
then88:
  ret i64 1
else89:
  %t426 = call i64 @rt_car(i64 %a1)
  %t427 = call i64 @rt_car(i64 %t426)
  %t428 = call i64 @rt_eq_p(i64 %a0, i64 %t427)
  %t429 = icmp ne i64 %t428, 1
  br i1 %t429, label %then90, label %else91
then90:
  %t430 = call i64 @rt_car(i64 %a1)
  ret i64 %t430
else91:
  %t431 = call i64 @rt_cdr(i64 %a1)
  %t432 = load i64, ptr @"scheme.base:assq"
  %t433 = and i64 %t432, -8
  %t434 = inttoptr i64 %t433 to ptr
  %t435 = load i64, ptr %t434
  %t436 = inttoptr i64 %t435 to ptr
  %t437 = musttail call fastcc i64 %t436(i64 %t432, i64 2, i64 %a0, i64 %t431, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t437
}

define fastcc i64 @"scheme.base:code:member"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t442 = icmp eq i64 %argc, 2
  br i1 %t442, label %argok93, label %arityerr92
arityerr92:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok93:
  %t443 = call i64 @rt_null_p(i64 %a1)
  %t444 = icmp ne i64 %t443, 1
  br i1 %t444, label %then94, label %else95
then94:
  ret i64 1
else95:
  %t445 = call i64 @rt_car(i64 %a1)
  %t446 = call i64 @rt_equal(i64 %a0, i64 %t445)
  %t447 = icmp ne i64 %t446, 1
  br i1 %t447, label %then96, label %else97
then96:
  ret i64 %a1
else97:
  %t448 = call i64 @rt_cdr(i64 %a1)
  %t449 = load i64, ptr @"scheme.base:member"
  %t450 = and i64 %t449, -8
  %t451 = inttoptr i64 %t450 to ptr
  %t452 = load i64, ptr %t451
  %t453 = inttoptr i64 %t452 to ptr
  %t454 = musttail call fastcc i64 %t453(i64 %t449, i64 2, i64 %a0, i64 %t448, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t454
}

define fastcc i64 @"scheme.base:code:assoc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t459 = icmp eq i64 %argc, 2
  br i1 %t459, label %argok99, label %arityerr98
arityerr98:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok99:
  %t460 = call i64 @rt_null_p(i64 %a1)
  %t461 = icmp ne i64 %t460, 1
  br i1 %t461, label %then100, label %else101
then100:
  ret i64 1
else101:
  %t462 = call i64 @rt_car(i64 %a1)
  %t463 = call i64 @rt_car(i64 %t462)
  %t464 = call i64 @rt_equal(i64 %a0, i64 %t463)
  %t465 = icmp ne i64 %t464, 1
  br i1 %t465, label %then102, label %else103
then102:
  %t466 = call i64 @rt_car(i64 %a1)
  ret i64 %t466
else103:
  %t467 = call i64 @rt_cdr(i64 %a1)
  %t468 = load i64, ptr @"scheme.base:assoc"
  %t469 = and i64 %t468, -8
  %t470 = inttoptr i64 %t469 to ptr
  %t471 = load i64, ptr %t470
  %t472 = inttoptr i64 %t471 to ptr
  %t473 = musttail call fastcc i64 %t472(i64 %t468, i64 2, i64 %a0, i64 %t467, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t473
}

define fastcc i64 @"scheme.base:code:filter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t478 = icmp eq i64 %argc, 2
  br i1 %t478, label %argok105, label %arityerr104
arityerr104:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok105:
  %t479 = call i64 @rt_null_p(i64 %a1)
  %t480 = icmp ne i64 %t479, 1
  br i1 %t480, label %then106, label %else107
then106:
  ret i64 2
else107:
  %t481 = call i64 @rt_car(i64 %a1)
  %t482 = and i64 %a0, -8
  %t483 = inttoptr i64 %t482 to ptr
  %t484 = load i64, ptr %t483
  %t485 = inttoptr i64 %t484 to ptr
  %t486 = call fastcc i64%t485(i64 %a0, i64 1, i64 %t481, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t487 = icmp ne i64 %t486, 1
  br i1 %t487, label %then108, label %else109
then108:
  %t488 = call i64 @rt_car(i64 %a1)
  %t489 = call i64 @rt_cdr(i64 %a1)
  %t490 = load i64, ptr @"scheme.base:filter"
  %t491 = and i64 %t490, -8
  %t492 = inttoptr i64 %t491 to ptr
  %t493 = load i64, ptr %t492
  %t494 = inttoptr i64 %t493 to ptr
  %t495 = call fastcc i64%t494(i64 %t490, i64 2, i64 %a0, i64 %t489, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t496 = call i64 @rt_cons(i64 %t488, i64 %t495)
  ret i64 %t496
else109:
  %t497 = call i64 @rt_cdr(i64 %a1)
  %t498 = load i64, ptr @"scheme.base:filter"
  %t499 = and i64 %t498, -8
  %t500 = inttoptr i64 %t499 to ptr
  %t501 = load i64, ptr %t500
  %t502 = inttoptr i64 %t501 to ptr
  %t503 = musttail call fastcc i64 %t502(i64 %t498, i64 2, i64 %a0, i64 %t497, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t503
}

define fastcc i64 @"scheme.base:code:fold-left"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t508 = icmp eq i64 %argc, 3
  br i1 %t508, label %argok111, label %arityerr110
arityerr110:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok111:
  %t509 = call i64 @rt_null_p(i64 %a2)
  %t510 = icmp ne i64 %t509, 1
  br i1 %t510, label %then112, label %else113
then112:
  ret i64 %a1
else113:
  %t511 = call i64 @rt_car(i64 %a2)
  %t512 = and i64 %a0, -8
  %t513 = inttoptr i64 %t512 to ptr
  %t514 = load i64, ptr %t513
  %t515 = inttoptr i64 %t514 to ptr
  %t516 = call fastcc i64%t515(i64 %a0, i64 2, i64 %a1, i64 %t511, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t517 = call i64 @rt_cdr(i64 %a2)
  %t518 = load i64, ptr @"scheme.base:fold-left"
  %t519 = and i64 %t518, -8
  %t520 = inttoptr i64 %t519 to ptr
  %t521 = load i64, ptr %t520
  %t522 = inttoptr i64 %t521 to ptr
  %t523 = musttail call fastcc i64 %t522(i64 %t518, i64 3, i64 %a0, i64 %t516, i64 %t517, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t523
}

define fastcc i64 @"scheme.base:code:fold-right"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t528 = icmp eq i64 %argc, 3
  br i1 %t528, label %argok115, label %arityerr114
arityerr114:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok115:
  %t529 = call i64 @rt_null_p(i64 %a2)
  %t530 = icmp ne i64 %t529, 1
  br i1 %t530, label %then116, label %else117
then116:
  ret i64 %a1
else117:
  %t531 = call i64 @rt_car(i64 %a2)
  %t532 = call i64 @rt_cdr(i64 %a2)
  %t533 = load i64, ptr @"scheme.base:fold-right"
  %t534 = and i64 %t533, -8
  %t535 = inttoptr i64 %t534 to ptr
  %t536 = load i64, ptr %t535
  %t537 = inttoptr i64 %t536 to ptr
  %t538 = call fastcc i64%t537(i64 %t533, i64 3, i64 %a0, i64 %a1, i64 %t532, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t539 = and i64 %a0, -8
  %t540 = inttoptr i64 %t539 to ptr
  %t541 = load i64, ptr %t540
  %t542 = inttoptr i64 %t541 to ptr
  %t543 = musttail call fastcc i64 %t542(i64 %a0, i64 2, i64 %t531, i64 %t538, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t543
}

define fastcc i64 @"scheme.base:code:%for-each1"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t548 = icmp eq i64 %argc, 2
  br i1 %t548, label %argok119, label %arityerr118
arityerr118:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok119:
  %t549 = call i64 @rt_null_p(i64 %a1)
  %t550 = icmp ne i64 %t549, 1
  br i1 %t550, label %then120, label %else121
then120:
  %t551 = icmp ne i64 1, 1
  br i1 %t551, label %then122, label %else123
then122:
  ret i64 1
else123:
  ret i64 17
else121:
  %t552 = call i64 @rt_car(i64 %a1)
  %t553 = and i64 %a0, -8
  %t554 = inttoptr i64 %t553 to ptr
  %t555 = load i64, ptr %t554
  %t556 = inttoptr i64 %t555 to ptr
  %t557 = call fastcc i64%t556(i64 %a0, i64 1, i64 %t552, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t558 = call i64 @rt_cdr(i64 %a1)
  %t559 = load i64, ptr @"scheme.base:%for-each1"
  %t560 = and i64 %t559, -8
  %t561 = inttoptr i64 %t560 to ptr
  %t562 = load i64, ptr %t561
  %t563 = inttoptr i64 %t562 to ptr
  %t564 = musttail call fastcc i64 %t563(i64 %t559, i64 2, i64 %a0, i64 %t558, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t564
}

define fastcc i64 @"scheme.base:code_109"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t569 = icmp eq i64 %argc, 1
  br i1 %t569, label %argok125, label %arityerr124
arityerr124:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok125:
  %t570 = call i64 @rt_car(i64 %a0)
  ret i64 %t570
}

define fastcc i64 @"scheme.base:code_111"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t571 = icmp eq i64 %argc, 1
  br i1 %t571, label %argok127, label %arityerr126
arityerr126:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok127:
  %t572 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t572
}

define fastcc i64 @"scheme.base:code:%for-eachn"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t573 = icmp eq i64 %argc, 2
  br i1 %t573, label %argok129, label %arityerr128
arityerr128:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok129:
  %t574 = load i64, ptr @"scheme.base:%any-null?"
  %t575 = and i64 %t574, -8
  %t576 = inttoptr i64 %t575 to ptr
  %t577 = load i64, ptr %t576
  %t578 = inttoptr i64 %t577 to ptr
  %t579 = call fastcc i64%t578(i64 %t574, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t580 = icmp ne i64 %t579, 1
  br i1 %t580, label %then130, label %else131
then130:
  %t581 = icmp ne i64 1, 1
  br i1 %t581, label %then132, label %else133
then132:
  ret i64 1
else133:
  ret i64 17
else131:
  %t582 = call ptr @rt_alloc_words(i64 1)
  %t583 = ptrtoint ptr %t582 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_109" to i64), ptr %t582
  %t584 = or i64 %t583, 4
  %t585 = load i64, ptr @"scheme.base:%map1"
  %t586 = and i64 %t585, -8
  %t587 = inttoptr i64 %t586 to ptr
  %t588 = load i64, ptr %t587
  %t589 = inttoptr i64 %t588 to ptr
  %t590 = call fastcc i64%t589(i64 %t585, i64 2, i64 %t584, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t591 = and i64 %a0, -8
  %t592 = inttoptr i64 %t591 to ptr
  %t593 = load i64, ptr %t592
  %t594 = inttoptr i64 %t593 to ptr
  %t595 = call i64 @rt_list_length(i64 %t590)
  %t596 = add i64 0, %t595
  %t597 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t590, i64 8)
  %t609 = getelementptr i64, ptr %t597, i64 0
  %t601 = load i64, ptr %t609
  %t610 = getelementptr i64, ptr %t597, i64 1
  %t602 = load i64, ptr %t610
  %t611 = getelementptr i64, ptr %t597, i64 2
  %t603 = load i64, ptr %t611
  %t612 = getelementptr i64, ptr %t597, i64 3
  %t604 = load i64, ptr %t612
  %t613 = getelementptr i64, ptr %t597, i64 4
  %t605 = load i64, ptr %t613
  %t614 = getelementptr i64, ptr %t597, i64 5
  %t606 = load i64, ptr %t614
  %t615 = getelementptr i64, ptr %t597, i64 6
  %t607 = load i64, ptr %t615
  %t616 = getelementptr i64, ptr %t597, i64 7
  %t608 = load i64, ptr %t616
  %t598 = icmp sgt i64 %t596, 8
  %t599 = getelementptr i64, ptr %t597, i64 8
  %t600 = select i1 %t598, ptr %t599, ptr null
  %t617 = call fastcc i64%t594(i64 %a0, i64 %t596, i64 %t601, i64 %t602, i64 %t603, i64 %t604, i64 %t605, i64 %t606, i64 %t607, i64 %t608, ptr %t600)
  %t618 = call ptr @rt_alloc_words(i64 1)
  %t619 = ptrtoint ptr %t618 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_111" to i64), ptr %t618
  %t620 = or i64 %t619, 4
  %t621 = load i64, ptr @"scheme.base:%map1"
  %t622 = and i64 %t621, -8
  %t623 = inttoptr i64 %t622 to ptr
  %t624 = load i64, ptr %t623
  %t625 = inttoptr i64 %t624 to ptr
  %t626 = call fastcc i64%t625(i64 %t621, i64 2, i64 %t620, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t627 = load i64, ptr @"scheme.base:%for-eachn"
  %t628 = and i64 %t627, -8
  %t629 = inttoptr i64 %t628 to ptr
  %t630 = load i64, ptr %t629
  %t631 = inttoptr i64 %t630 to ptr
  %t632 = musttail call fastcc i64 %t631(i64 %t627, i64 2, i64 %a0, i64 %t626, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t632
}

define fastcc i64 @"scheme.base:code:for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t637 = icmp sge i64 %argc, 2
  br i1 %t637, label %argok135, label %arityerr134
arityerr134:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok135:
  %t638 = call ptr @rt_alloc_words(i64 8)
  %t639 = getelementptr i64, ptr %t638, i64 0
  store i64 %a0, ptr %t639
  %t640 = getelementptr i64, ptr %t638, i64 1
  store i64 %a1, ptr %t640
  %t641 = getelementptr i64, ptr %t638, i64 2
  store i64 %a2, ptr %t641
  %t642 = getelementptr i64, ptr %t638, i64 3
  store i64 %a3, ptr %t642
  %t643 = getelementptr i64, ptr %t638, i64 4
  store i64 %a4, ptr %t643
  %t644 = getelementptr i64, ptr %t638, i64 5
  store i64 %a5, ptr %t644
  %t645 = getelementptr i64, ptr %t638, i64 6
  store i64 %a6, ptr %t645
  %t646 = getelementptr i64, ptr %t638, i64 7
  store i64 %a7, ptr %t646
  %t647 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t638, ptr %overflow)
  %t648 = call i64 @rt_null_p(i64 %t647)
  %t649 = icmp ne i64 %t648, 1
  br i1 %t649, label %then136, label %else137
then136:
  %t650 = load i64, ptr @"scheme.base:%for-each1"
  %t651 = and i64 %t650, -8
  %t652 = inttoptr i64 %t651 to ptr
  %t653 = load i64, ptr %t652
  %t654 = inttoptr i64 %t653 to ptr
  %t655 = musttail call fastcc i64 %t654(i64 %t650, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t655
else137:
  %t656 = call i64 @rt_cons(i64 %a1, i64 %t647)
  %t657 = load i64, ptr @"scheme.base:%for-eachn"
  %t658 = and i64 %t657, -8
  %t659 = inttoptr i64 %t658 to ptr
  %t660 = load i64, ptr %t659
  %t661 = inttoptr i64 %t660 to ptr
  %t662 = musttail call fastcc i64 %t661(i64 %t657, i64 2, i64 %a0, i64 %t656, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t662
}

define fastcc i64 @"scheme.base:code:andmap"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t667 = icmp eq i64 %argc, 2
  br i1 %t667, label %argok139, label %arityerr138
arityerr138:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok139:
  %t668 = call i64 @rt_null_p(i64 %a1)
  %t669 = icmp ne i64 %t668, 1
  br i1 %t669, label %then140, label %else141
then140:
  ret i64 257
else141:
  %t670 = call i64 @rt_car(i64 %a1)
  %t671 = and i64 %a0, -8
  %t672 = inttoptr i64 %t671 to ptr
  %t673 = load i64, ptr %t672
  %t674 = inttoptr i64 %t673 to ptr
  %t675 = call fastcc i64%t674(i64 %a0, i64 1, i64 %t670, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t676 = icmp ne i64 %t675, 1
  br i1 %t676, label %then142, label %else143
then142:
  %t677 = call i64 @rt_cdr(i64 %a1)
  %t678 = load i64, ptr @"scheme.base:andmap"
  %t679 = and i64 %t678, -8
  %t680 = inttoptr i64 %t679 to ptr
  %t681 = load i64, ptr %t680
  %t682 = inttoptr i64 %t681 to ptr
  %t683 = musttail call fastcc i64 %t682(i64 %t678, i64 2, i64 %a0, i64 %t677, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t683
else143:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:memp"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t688 = icmp eq i64 %argc, 2
  br i1 %t688, label %argok145, label %arityerr144
arityerr144:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok145:
  %t689 = call i64 @rt_null_p(i64 %a1)
  %t690 = icmp ne i64 %t689, 1
  br i1 %t690, label %then146, label %else147
then146:
  ret i64 1
else147:
  %t691 = call i64 @rt_car(i64 %a1)
  %t692 = and i64 %a0, -8
  %t693 = inttoptr i64 %t692 to ptr
  %t694 = load i64, ptr %t693
  %t695 = inttoptr i64 %t694 to ptr
  %t696 = call fastcc i64%t695(i64 %a0, i64 1, i64 %t691, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t697 = icmp ne i64 %t696, 1
  br i1 %t697, label %then148, label %else149
then148:
  ret i64 %a1
else149:
  %t698 = call i64 @rt_cdr(i64 %a1)
  %t699 = load i64, ptr @"scheme.base:memp"
  %t700 = and i64 %t699, -8
  %t701 = inttoptr i64 %t700 to ptr
  %t702 = load i64, ptr %t701
  %t703 = inttoptr i64 %t702 to ptr
  %t704 = musttail call fastcc i64 %t703(i64 %t699, i64 2, i64 %a0, i64 %t698, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t704
}

define fastcc i64 @"scheme.base:code:cadddr"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t709 = icmp eq i64 %argc, 1
  br i1 %t709, label %argok151, label %arityerr150
arityerr150:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok151:
  %t710 = load i64, ptr @"scheme.base:cdddr"
  %t711 = and i64 %t710, -8
  %t712 = inttoptr i64 %t711 to ptr
  %t713 = load i64, ptr %t712
  %t714 = inttoptr i64 %t713 to ptr
  %t715 = call fastcc i64%t714(i64 %t710, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t716 = call i64 @rt_car(i64 %t715)
  ret i64 %t716
}

define fastcc i64 @"scheme.base:code:list?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t721 = icmp eq i64 %argc, 1
  br i1 %t721, label %argok153, label %arityerr152
arityerr152:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok153:
  %t722 = call i64 @rt_null_p(i64 %a0)
  %t723 = icmp ne i64 %t722, 1
  br i1 %t723, label %then154, label %else155
then154:
  ret i64 257
else155:
  %t724 = call i64 @rt_pair_p(i64 %a0)
  %t725 = icmp ne i64 %t724, 1
  br i1 %t725, label %then156, label %else157
then156:
  %t726 = call i64 @rt_cdr(i64 %a0)
  %t727 = load i64, ptr @"scheme.base:list?"
  %t728 = and i64 %t727, -8
  %t729 = inttoptr i64 %t728 to ptr
  %t730 = load i64, ptr %t729
  %t731 = inttoptr i64 %t730 to ptr
  %t732 = musttail call fastcc i64 %t731(i64 %t727, i64 1, i64 %t726, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t732
else157:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:zero?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t737 = icmp eq i64 %argc, 1
  br i1 %t737, label %argok159, label %arityerr158
arityerr158:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok159:
  %t738 = or i64 %a0, 0
  %t739 = and i64 %t738, 7
  %t740 = icmp eq i64 %t739, 0
  br i1 %t740, label %fixfast160, label %fixslow161
fixfast160:
  %t741 = icmp eq i64 %a0, 0
  %t742 = select i1 %t741, i64 257, i64 1
  br label %fixmerge162
fixslow161:
  %t743 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge162
fixmerge162:
  %t744 = phi i64 [ %t742, %fixfast160 ], [ %t743, %fixslow161 ]
  ret i64 %t744
}

define fastcc i64 @"scheme.base:code:list-tail"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t749 = icmp eq i64 %argc, 2
  br i1 %t749, label %argok164, label %arityerr163
arityerr163:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok164:
  %t750 = load i64, ptr @"scheme.base:zero?"
  %t751 = and i64 %t750, -8
  %t752 = inttoptr i64 %t751 to ptr
  %t753 = load i64, ptr %t752
  %t754 = inttoptr i64 %t753 to ptr
  %t755 = call fastcc i64%t754(i64 %t750, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t756 = icmp ne i64 %t755, 1
  br i1 %t756, label %then165, label %else166
then165:
  ret i64 %a0
else166:
  %t757 = call i64 @rt_cdr(i64 %a0)
  %t758 = or i64 %a1, 8
  %t759 = and i64 %t758, 7
  %t760 = icmp eq i64 %t759, 0
  br i1 %t760, label %fixfast167, label %fixslow168
fixfast167:
  %t761 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a1, i64 8)
  %t762 = extractvalue {i64, i1} %t761, 0
  %t763 = extractvalue {i64, i1} %t761, 1
  br i1 %t763, label %fixslow168, label %fixmerge169
fixslow168:
  %t764 = call i64 @rt_sub(i64 %a1, i64 8)
  br label %fixmerge169
fixmerge169:
  %t765 = phi i64 [ %t762, %fixfast167 ], [ %t764, %fixslow168 ]
  %t766 = load i64, ptr @"scheme.base:list-tail"
  %t767 = and i64 %t766, -8
  %t768 = inttoptr i64 %t767 to ptr
  %t769 = load i64, ptr %t768
  %t770 = inttoptr i64 %t769 to ptr
  %t771 = musttail call fastcc i64 %t770(i64 %t766, i64 2, i64 %t757, i64 %t765, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t771
}

define fastcc i64 @"scheme.base:code:list-ref"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t776 = icmp eq i64 %argc, 2
  br i1 %t776, label %argok171, label %arityerr170
arityerr170:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok171:
  %t777 = load i64, ptr @"scheme.base:list-tail"
  %t778 = and i64 %t777, -8
  %t779 = inttoptr i64 %t778 to ptr
  %t780 = load i64, ptr %t779
  %t781 = inttoptr i64 %t780 to ptr
  %t782 = call fastcc i64%t781(i64 %t777, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t783 = call i64 @rt_car(i64 %t782)
  ret i64 %t783
}

define fastcc i64 @"scheme.base:code:list-head"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t788 = icmp eq i64 %argc, 2
  br i1 %t788, label %argok173, label %arityerr172
arityerr172:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok173:
  %t789 = load i64, ptr @"scheme.base:zero?"
  %t790 = and i64 %t789, -8
  %t791 = inttoptr i64 %t790 to ptr
  %t792 = load i64, ptr %t791
  %t793 = inttoptr i64 %t792 to ptr
  %t794 = call fastcc i64%t793(i64 %t789, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t795 = icmp ne i64 %t794, 1
  br i1 %t795, label %then174, label %else175
then174:
  ret i64 2
else175:
  %t796 = call i64 @rt_car(i64 %a0)
  %t797 = call i64 @rt_cdr(i64 %a0)
  %t798 = or i64 %a1, 8
  %t799 = and i64 %t798, 7
  %t800 = icmp eq i64 %t799, 0
  br i1 %t800, label %fixfast176, label %fixslow177
fixfast176:
  %t801 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a1, i64 8)
  %t802 = extractvalue {i64, i1} %t801, 0
  %t803 = extractvalue {i64, i1} %t801, 1
  br i1 %t803, label %fixslow177, label %fixmerge178
fixslow177:
  %t804 = call i64 @rt_sub(i64 %a1, i64 8)
  br label %fixmerge178
fixmerge178:
  %t805 = phi i64 [ %t802, %fixfast176 ], [ %t804, %fixslow177 ]
  %t806 = load i64, ptr @"scheme.base:list-head"
  %t807 = and i64 %t806, -8
  %t808 = inttoptr i64 %t807 to ptr
  %t809 = load i64, ptr %t808
  %t810 = inttoptr i64 %t809 to ptr
  %t811 = call fastcc i64%t810(i64 %t806, i64 2, i64 %t797, i64 %t805, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t812 = call i64 @rt_cons(i64 %t796, i64 %t811)
  ret i64 %t812
}

define fastcc i64 @"scheme.base:code:make-list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t817 = icmp eq i64 %argc, 2
  br i1 %t817, label %argok180, label %arityerr179
arityerr179:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok180:
  %t818 = load i64, ptr @"scheme.base:zero?"
  %t819 = and i64 %t818, -8
  %t820 = inttoptr i64 %t819 to ptr
  %t821 = load i64, ptr %t820
  %t822 = inttoptr i64 %t821 to ptr
  %t823 = call fastcc i64%t822(i64 %t818, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t824 = icmp ne i64 %t823, 1
  br i1 %t824, label %then181, label %else182
then181:
  ret i64 2
else182:
  %t825 = or i64 %a0, 8
  %t826 = and i64 %t825, 7
  %t827 = icmp eq i64 %t826, 0
  br i1 %t827, label %fixfast183, label %fixslow184
fixfast183:
  %t828 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t829 = extractvalue {i64, i1} %t828, 0
  %t830 = extractvalue {i64, i1} %t828, 1
  br i1 %t830, label %fixslow184, label %fixmerge185
fixslow184:
  %t831 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge185
fixmerge185:
  %t832 = phi i64 [ %t829, %fixfast183 ], [ %t831, %fixslow184 ]
  %t833 = load i64, ptr @"scheme.base:make-list"
  %t834 = and i64 %t833, -8
  %t835 = inttoptr i64 %t834 to ptr
  %t836 = load i64, ptr %t835
  %t837 = inttoptr i64 %t836 to ptr
  %t838 = call fastcc i64%t837(i64 %t833, i64 2, i64 %t832, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t839 = call i64 @rt_cons(i64 %a1, i64 %t838)
  ret i64 %t839
}

define fastcc i64 @"scheme.base:code_154"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t844 = icmp eq i64 %argc, 2
  br i1 %t844, label %argok187, label %arityerr186
arityerr186:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok187:
  %t845 = and i64 %self, -8
  %t846 = inttoptr i64 %t845 to ptr
  %t847 = getelementptr i64, ptr %t846, i64 1
  %t848 = load i64, ptr %t847
  %t849 = or i64 %a0, %t848
  %t850 = and i64 %t849, 7
  %t851 = icmp eq i64 %t850, 0
  br i1 %t851, label %fixfast188, label %fixslow189
fixfast188:
  %t852 = icmp eq i64 %a0, %t848
  %t853 = select i1 %t852, i64 257, i64 1
  br label %fixmerge190
fixslow189:
  %t854 = call i64 @rt_num_eq(i64 %a0, i64 %t848)
  br label %fixmerge190
fixmerge190:
  %t855 = phi i64 [ %t853, %fixfast188 ], [ %t854, %fixslow189 ]
  %t856 = icmp ne i64 %t855, 1
  br i1 %t856, label %then191, label %else192
then191:
  %t857 = load i64, ptr @"scheme.base:reverse"
  %t858 = and i64 %t857, -8
  %t859 = inttoptr i64 %t858 to ptr
  %t860 = load i64, ptr %t859
  %t861 = inttoptr i64 %t860 to ptr
  %t862 = musttail call fastcc i64 %t861(i64 %t857, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t862
else192:
  %t863 = or i64 %a0, 8
  %t864 = and i64 %t863, 7
  %t865 = icmp eq i64 %t864, 0
  br i1 %t865, label %fixfast193, label %fixslow194
fixfast193:
  %t866 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t867 = extractvalue {i64, i1} %t866, 0
  %t868 = extractvalue {i64, i1} %t866, 1
  br i1 %t868, label %fixslow194, label %fixmerge195
fixslow194:
  %t869 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge195
fixmerge195:
  %t870 = phi i64 [ %t867, %fixfast193 ], [ %t869, %fixslow194 ]
  %t871 = call i64 @rt_cons(i64 %a0, i64 %a1)
  %t872 = musttail call fastcc i64 @"scheme.base:code_154"(i64 %self, i64 2, i64 %t870, i64 %t871, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t872
}

define fastcc i64 @"scheme.base:code:iota"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t873 = icmp eq i64 %argc, 1
  br i1 %t873, label %argok197, label %arityerr196
arityerr196:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok197:
  %t874 = call ptr @rt_alloc_words(i64 3)
  %t875 = ptrtoint ptr %t874 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_154" to i64), ptr %t874
  %t876 = or i64 %t875, 4
  %t877 = getelementptr i64, ptr %t874, i64 1
  store i64 %a0, ptr %t877
  %t878 = getelementptr i64, ptr %t874, i64 2
  store i64 %t876, ptr %t878
  %t879 = musttail call fastcc i64 @"scheme.base:code_154"(i64 %t876, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t879
}

define fastcc i64 @"scheme.base:code:%minmax-fold"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t884 = icmp eq i64 %argc, 4
  br i1 %t884, label %argok199, label %arityerr198
arityerr198:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok199:
  %t885 = call i64 @rt_null_p(i64 %a1)
  %t886 = icmp ne i64 %t885, 1
  br i1 %t886, label %then200, label %else201
then200:
  %t887 = icmp ne i64 %a3, 1
  br i1 %t887, label %then202, label %else203
then202:
  %t888 = call i64 @rt_exact_to_inexact(i64 %a2)
  ret i64 %t888
else203:
  ret i64 %a2
else201:
  %t889 = call i64 @rt_cdr(i64 %a1)
  %t890 = call i64 @rt_car(i64 %a1)
  %t891 = and i64 %a0, -8
  %t892 = inttoptr i64 %t891 to ptr
  %t893 = load i64, ptr %t892
  %t894 = inttoptr i64 %t893 to ptr
  %t895 = call fastcc i64%t894(i64 %a0, i64 2, i64 %a2, i64 %t890, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t896 = icmp ne i64 %a3, 1
  br i1 %t896, label %then204, label %else205
then204:
  br label %merge206
else205:
  %t897 = call i64 @rt_car(i64 %a1)
  %t898 = call i64 @rt_inexact_p(i64 %t897)
  br label %merge206
merge206:
  %t899 = phi i64 [ 257, %then204 ], [ %t898, %else205 ]
  %t900 = load i64, ptr @"scheme.base:%minmax-fold"
  %t901 = and i64 %t900, -8
  %t902 = inttoptr i64 %t901 to ptr
  %t903 = load i64, ptr %t902
  %t904 = inttoptr i64 %t903 to ptr
  %t905 = musttail call fastcc i64 %t904(i64 %t900, i64 4, i64 %a0, i64 %t889, i64 %t895, i64 %t899, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t905
}

define fastcc i64 @"scheme.base:code:%minmax"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t910 = icmp eq i64 %argc, 3
  br i1 %t910, label %argok208, label %arityerr207
arityerr207:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok208:
  %t911 = call i64 @rt_inexact_p(i64 %a1)
  %t912 = load i64, ptr @"scheme.base:%minmax-fold"
  %t913 = and i64 %t912, -8
  %t914 = inttoptr i64 %t913 to ptr
  %t915 = load i64, ptr %t914
  %t916 = inttoptr i64 %t915 to ptr
  %t917 = musttail call fastcc i64 %t916(i64 %t912, i64 4, i64 %a0, i64 %a2, i64 %a1, i64 %t911, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t917
}

define fastcc i64 @"scheme.base:code_174"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t922 = icmp eq i64 %argc, 2
  br i1 %t922, label %argok210, label %arityerr209
arityerr209:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok210:
  %t923 = or i64 %a0, %a1
  %t924 = and i64 %t923, 7
  %t925 = icmp eq i64 %t924, 0
  br i1 %t925, label %fixfast211, label %fixslow212
fixfast211:
  %t926 = icmp slt i64 %a0, %a1
  %t927 = select i1 %t926, i64 257, i64 1
  br label %fixmerge213
fixslow212:
  %t928 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge213
fixmerge213:
  %t929 = phi i64 [ %t927, %fixfast211 ], [ %t928, %fixslow212 ]
  %t930 = icmp ne i64 %t929, 1
  br i1 %t930, label %then214, label %else215
then214:
  ret i64 %a1
else215:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:max"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t931 = icmp sge i64 %argc, 1
  br i1 %t931, label %argok217, label %arityerr216
arityerr216:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok217:
  %t932 = call ptr @rt_alloc_words(i64 8)
  %t933 = getelementptr i64, ptr %t932, i64 0
  store i64 %a0, ptr %t933
  %t934 = getelementptr i64, ptr %t932, i64 1
  store i64 %a1, ptr %t934
  %t935 = getelementptr i64, ptr %t932, i64 2
  store i64 %a2, ptr %t935
  %t936 = getelementptr i64, ptr %t932, i64 3
  store i64 %a3, ptr %t936
  %t937 = getelementptr i64, ptr %t932, i64 4
  store i64 %a4, ptr %t937
  %t938 = getelementptr i64, ptr %t932, i64 5
  store i64 %a5, ptr %t938
  %t939 = getelementptr i64, ptr %t932, i64 6
  store i64 %a6, ptr %t939
  %t940 = getelementptr i64, ptr %t932, i64 7
  store i64 %a7, ptr %t940
  %t941 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t932, ptr %overflow)
  %t942 = call ptr @rt_alloc_words(i64 1)
  %t943 = ptrtoint ptr %t942 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_174" to i64), ptr %t942
  %t944 = or i64 %t943, 4
  %t945 = load i64, ptr @"scheme.base:%minmax"
  %t946 = and i64 %t945, -8
  %t947 = inttoptr i64 %t946 to ptr
  %t948 = load i64, ptr %t947
  %t949 = inttoptr i64 %t948 to ptr
  %t950 = musttail call fastcc i64 %t949(i64 %t945, i64 3, i64 %t944, i64 %a0, i64 %t941, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t950
}

define fastcc i64 @"scheme.base:code_185"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t955 = icmp eq i64 %argc, 2
  br i1 %t955, label %argok219, label %arityerr218
arityerr218:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok219:
  %t956 = or i64 %a1, %a0
  %t957 = and i64 %t956, 7
  %t958 = icmp eq i64 %t957, 0
  br i1 %t958, label %fixfast220, label %fixslow221
fixfast220:
  %t959 = icmp slt i64 %a1, %a0
  %t960 = select i1 %t959, i64 257, i64 1
  br label %fixmerge222
fixslow221:
  %t961 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge222
fixmerge222:
  %t962 = phi i64 [ %t960, %fixfast220 ], [ %t961, %fixslow221 ]
  %t963 = icmp ne i64 %t962, 1
  br i1 %t963, label %then223, label %else224
then223:
  ret i64 %a1
else224:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:min"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t964 = icmp sge i64 %argc, 1
  br i1 %t964, label %argok226, label %arityerr225
arityerr225:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok226:
  %t965 = call ptr @rt_alloc_words(i64 8)
  %t966 = getelementptr i64, ptr %t965, i64 0
  store i64 %a0, ptr %t966
  %t967 = getelementptr i64, ptr %t965, i64 1
  store i64 %a1, ptr %t967
  %t968 = getelementptr i64, ptr %t965, i64 2
  store i64 %a2, ptr %t968
  %t969 = getelementptr i64, ptr %t965, i64 3
  store i64 %a3, ptr %t969
  %t970 = getelementptr i64, ptr %t965, i64 4
  store i64 %a4, ptr %t970
  %t971 = getelementptr i64, ptr %t965, i64 5
  store i64 %a5, ptr %t971
  %t972 = getelementptr i64, ptr %t965, i64 6
  store i64 %a6, ptr %t972
  %t973 = getelementptr i64, ptr %t965, i64 7
  store i64 %a7, ptr %t973
  %t974 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t965, ptr %overflow)
  %t975 = call ptr @rt_alloc_words(i64 1)
  %t976 = ptrtoint ptr %t975 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_185" to i64), ptr %t975
  %t977 = or i64 %t976, 4
  %t978 = load i64, ptr @"scheme.base:%minmax"
  %t979 = and i64 %t978, -8
  %t980 = inttoptr i64 %t979 to ptr
  %t981 = load i64, ptr %t980
  %t982 = inttoptr i64 %t981 to ptr
  %t983 = musttail call fastcc i64 %t982(i64 %t978, i64 3, i64 %t977, i64 %a0, i64 %t974, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t983
}

define fastcc i64 @"scheme.base:code:void"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t988 = icmp eq i64 %argc, 0
  br i1 %t988, label %argok228, label %arityerr227
arityerr227:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok228:
  %t989 = icmp ne i64 1, 1
  br i1 %t989, label %then229, label %else230
then229:
  ret i64 1
else230:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t994 = icmp sge i64 %argc, 0
  br i1 %t994, label %argok232, label %arityerr231
arityerr231:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok232:
  %t995 = call ptr @rt_alloc_words(i64 8)
  %t996 = getelementptr i64, ptr %t995, i64 0
  store i64 %a0, ptr %t996
  %t997 = getelementptr i64, ptr %t995, i64 1
  store i64 %a1, ptr %t997
  %t998 = getelementptr i64, ptr %t995, i64 2
  store i64 %a2, ptr %t998
  %t999 = getelementptr i64, ptr %t995, i64 3
  store i64 %a3, ptr %t999
  %t1000 = getelementptr i64, ptr %t995, i64 4
  store i64 %a4, ptr %t1000
  %t1001 = getelementptr i64, ptr %t995, i64 5
  store i64 %a5, ptr %t1001
  %t1002 = getelementptr i64, ptr %t995, i64 6
  store i64 %a6, ptr %t1002
  %t1003 = getelementptr i64, ptr %t995, i64 7
  store i64 %a7, ptr %t1003
  %t1004 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t995, ptr %overflow)
  %t1005 = call i64 @rt_list_to_string(i64 %t1004)
  ret i64 %t1005
}

define fastcc i64 @"scheme.base:code:%str-concat"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1010 = icmp eq i64 %argc, 1
  br i1 %t1010, label %argok234, label %arityerr233
arityerr233:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok234:
  %t1011 = call i64 @rt_null_p(i64 %a0)
  %t1012 = icmp ne i64 %t1011, 1
  br i1 %t1012, label %then235, label %else236
then235:
  %t1013 = call i64 @rt_make_string(ptr @.str.lit.0, i64 0)
  ret i64 %t1013
else236:
  %t1014 = call i64 @rt_car(i64 %a0)
  %t1015 = call i64 @rt_cdr(i64 %a0)
  %t1016 = load i64, ptr @"scheme.base:%str-concat"
  %t1017 = and i64 %t1016, -8
  %t1018 = inttoptr i64 %t1017 to ptr
  %t1019 = load i64, ptr %t1018
  %t1020 = inttoptr i64 %t1019 to ptr
  %t1021 = call fastcc i64%t1020(i64 %t1016, i64 1, i64 %t1015, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1022 = call i64 @rt_string_append(i64 %t1014, i64 %t1021)
  ret i64 %t1022
}

define fastcc i64 @"scheme.base:code:chr-cmp"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1027 = icmp eq i64 %argc, 4
  br i1 %t1027, label %argok238, label %arityerr237
arityerr237:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok238:
  %t1028 = call i64 @rt_char_to_integer(i64 %a1)
  %t1029 = call i64 @rt_char_to_integer(i64 %a2)
  %t1030 = and i64 %a0, -8
  %t1031 = inttoptr i64 %t1030 to ptr
  %t1032 = load i64, ptr %t1031
  %t1033 = inttoptr i64 %t1032 to ptr
  %t1034 = call fastcc i64%t1033(i64 %a0, i64 2, i64 %t1028, i64 %t1029, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1035 = icmp ne i64 %t1034, 1
  br i1 %t1035, label %then239, label %else240
then239:
  %t1036 = call i64 @rt_null_p(i64 %a3)
  %t1037 = icmp ne i64 %t1036, 1
  br i1 %t1037, label %then241, label %else242
then241:
  ret i64 257
else242:
  %t1038 = call i64 @rt_car(i64 %a3)
  %t1039 = call i64 @rt_cdr(i64 %a3)
  %t1040 = load i64, ptr @"scheme.base:chr-cmp"
  %t1041 = and i64 %t1040, -8
  %t1042 = inttoptr i64 %t1041 to ptr
  %t1043 = load i64, ptr %t1042
  %t1044 = inttoptr i64 %t1043 to ptr
  %t1045 = musttail call fastcc i64 %t1044(i64 %t1040, i64 4, i64 %a0, i64 %a2, i64 %t1038, i64 %t1039, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1045
else240:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_207"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1050 = icmp eq i64 %argc, 2
  br i1 %t1050, label %argok244, label %arityerr243
arityerr243:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok244:
  %t1051 = or i64 %a0, %a1
  %t1052 = and i64 %t1051, 7
  %t1053 = icmp eq i64 %t1052, 0
  br i1 %t1053, label %fixfast245, label %fixslow246
fixfast245:
  %t1054 = icmp eq i64 %a0, %a1
  %t1055 = select i1 %t1054, i64 257, i64 1
  br label %fixmerge247
fixslow246:
  %t1056 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge247
fixmerge247:
  %t1057 = phi i64 [ %t1055, %fixfast245 ], [ %t1056, %fixslow246 ]
  ret i64 %t1057
}

define fastcc i64 @"scheme.base:code:char=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1058 = icmp sge i64 %argc, 2
  br i1 %t1058, label %argok249, label %arityerr248
arityerr248:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok249:
  %t1059 = call ptr @rt_alloc_words(i64 8)
  %t1060 = getelementptr i64, ptr %t1059, i64 0
  store i64 %a0, ptr %t1060
  %t1061 = getelementptr i64, ptr %t1059, i64 1
  store i64 %a1, ptr %t1061
  %t1062 = getelementptr i64, ptr %t1059, i64 2
  store i64 %a2, ptr %t1062
  %t1063 = getelementptr i64, ptr %t1059, i64 3
  store i64 %a3, ptr %t1063
  %t1064 = getelementptr i64, ptr %t1059, i64 4
  store i64 %a4, ptr %t1064
  %t1065 = getelementptr i64, ptr %t1059, i64 5
  store i64 %a5, ptr %t1065
  %t1066 = getelementptr i64, ptr %t1059, i64 6
  store i64 %a6, ptr %t1066
  %t1067 = getelementptr i64, ptr %t1059, i64 7
  store i64 %a7, ptr %t1067
  %t1068 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1059, ptr %overflow)
  %t1069 = call ptr @rt_alloc_words(i64 1)
  %t1070 = ptrtoint ptr %t1069 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_207" to i64), ptr %t1069
  %t1071 = or i64 %t1070, 4
  %t1072 = load i64, ptr @"scheme.base:chr-cmp"
  %t1073 = and i64 %t1072, -8
  %t1074 = inttoptr i64 %t1073 to ptr
  %t1075 = load i64, ptr %t1074
  %t1076 = inttoptr i64 %t1075 to ptr
  %t1077 = musttail call fastcc i64 %t1076(i64 %t1072, i64 4, i64 %t1071, i64 %a0, i64 %a1, i64 %t1068, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1077
}

define fastcc i64 @"scheme.base:code_219"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1082 = icmp eq i64 %argc, 2
  br i1 %t1082, label %argok251, label %arityerr250
arityerr250:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok251:
  %t1083 = or i64 %a0, %a1
  %t1084 = and i64 %t1083, 7
  %t1085 = icmp eq i64 %t1084, 0
  br i1 %t1085, label %fixfast252, label %fixslow253
fixfast252:
  %t1086 = icmp slt i64 %a0, %a1
  %t1087 = select i1 %t1086, i64 257, i64 1
  br label %fixmerge254
fixslow253:
  %t1088 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge254
fixmerge254:
  %t1089 = phi i64 [ %t1087, %fixfast252 ], [ %t1088, %fixslow253 ]
  ret i64 %t1089
}

define fastcc i64 @"scheme.base:code:char<?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1090 = icmp sge i64 %argc, 2
  br i1 %t1090, label %argok256, label %arityerr255
arityerr255:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok256:
  %t1091 = call ptr @rt_alloc_words(i64 8)
  %t1092 = getelementptr i64, ptr %t1091, i64 0
  store i64 %a0, ptr %t1092
  %t1093 = getelementptr i64, ptr %t1091, i64 1
  store i64 %a1, ptr %t1093
  %t1094 = getelementptr i64, ptr %t1091, i64 2
  store i64 %a2, ptr %t1094
  %t1095 = getelementptr i64, ptr %t1091, i64 3
  store i64 %a3, ptr %t1095
  %t1096 = getelementptr i64, ptr %t1091, i64 4
  store i64 %a4, ptr %t1096
  %t1097 = getelementptr i64, ptr %t1091, i64 5
  store i64 %a5, ptr %t1097
  %t1098 = getelementptr i64, ptr %t1091, i64 6
  store i64 %a6, ptr %t1098
  %t1099 = getelementptr i64, ptr %t1091, i64 7
  store i64 %a7, ptr %t1099
  %t1100 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1091, ptr %overflow)
  %t1101 = call ptr @rt_alloc_words(i64 1)
  %t1102 = ptrtoint ptr %t1101 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_219" to i64), ptr %t1101
  %t1103 = or i64 %t1102, 4
  %t1104 = load i64, ptr @"scheme.base:chr-cmp"
  %t1105 = and i64 %t1104, -8
  %t1106 = inttoptr i64 %t1105 to ptr
  %t1107 = load i64, ptr %t1106
  %t1108 = inttoptr i64 %t1107 to ptr
  %t1109 = musttail call fastcc i64 %t1108(i64 %t1104, i64 4, i64 %t1103, i64 %a0, i64 %a1, i64 %t1100, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1109
}

define fastcc i64 @"scheme.base:code_231"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1114 = icmp eq i64 %argc, 2
  br i1 %t1114, label %argok258, label %arityerr257
arityerr257:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok258:
  %t1115 = or i64 %a1, %a0
  %t1116 = and i64 %t1115, 7
  %t1117 = icmp eq i64 %t1116, 0
  br i1 %t1117, label %fixfast259, label %fixslow260
fixfast259:
  %t1118 = icmp slt i64 %a1, %a0
  %t1119 = select i1 %t1118, i64 257, i64 1
  br label %fixmerge261
fixslow260:
  %t1120 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge261
fixmerge261:
  %t1121 = phi i64 [ %t1119, %fixfast259 ], [ %t1120, %fixslow260 ]
  ret i64 %t1121
}

define fastcc i64 @"scheme.base:code:char>?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1122 = icmp sge i64 %argc, 2
  br i1 %t1122, label %argok263, label %arityerr262
arityerr262:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok263:
  %t1123 = call ptr @rt_alloc_words(i64 8)
  %t1124 = getelementptr i64, ptr %t1123, i64 0
  store i64 %a0, ptr %t1124
  %t1125 = getelementptr i64, ptr %t1123, i64 1
  store i64 %a1, ptr %t1125
  %t1126 = getelementptr i64, ptr %t1123, i64 2
  store i64 %a2, ptr %t1126
  %t1127 = getelementptr i64, ptr %t1123, i64 3
  store i64 %a3, ptr %t1127
  %t1128 = getelementptr i64, ptr %t1123, i64 4
  store i64 %a4, ptr %t1128
  %t1129 = getelementptr i64, ptr %t1123, i64 5
  store i64 %a5, ptr %t1129
  %t1130 = getelementptr i64, ptr %t1123, i64 6
  store i64 %a6, ptr %t1130
  %t1131 = getelementptr i64, ptr %t1123, i64 7
  store i64 %a7, ptr %t1131
  %t1132 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1123, ptr %overflow)
  %t1133 = call ptr @rt_alloc_words(i64 1)
  %t1134 = ptrtoint ptr %t1133 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_231" to i64), ptr %t1133
  %t1135 = or i64 %t1134, 4
  %t1136 = load i64, ptr @"scheme.base:chr-cmp"
  %t1137 = and i64 %t1136, -8
  %t1138 = inttoptr i64 %t1137 to ptr
  %t1139 = load i64, ptr %t1138
  %t1140 = inttoptr i64 %t1139 to ptr
  %t1141 = musttail call fastcc i64 %t1140(i64 %t1136, i64 4, i64 %t1135, i64 %a0, i64 %a1, i64 %t1132, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1141
}

define fastcc i64 @"scheme.base:code_243"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1146 = icmp eq i64 %argc, 2
  br i1 %t1146, label %argok265, label %arityerr264
arityerr264:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok265:
  %t1147 = or i64 %a0, %a1
  %t1148 = and i64 %t1147, 7
  %t1149 = icmp eq i64 %t1148, 0
  br i1 %t1149, label %fixfast266, label %fixslow267
fixfast266:
  %t1150 = icmp slt i64 %a0, %a1
  %t1151 = select i1 %t1150, i64 257, i64 1
  br label %fixmerge268
fixslow267:
  %t1152 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge268
fixmerge268:
  %t1153 = phi i64 [ %t1151, %fixfast266 ], [ %t1152, %fixslow267 ]
  %t1154 = icmp ne i64 %t1153, 1
  br i1 %t1154, label %then269, label %else270
then269:
  ret i64 257
else270:
  %t1155 = or i64 %a0, %a1
  %t1156 = and i64 %t1155, 7
  %t1157 = icmp eq i64 %t1156, 0
  br i1 %t1157, label %fixfast271, label %fixslow272
fixfast271:
  %t1158 = icmp eq i64 %a0, %a1
  %t1159 = select i1 %t1158, i64 257, i64 1
  br label %fixmerge273
fixslow272:
  %t1160 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge273
fixmerge273:
  %t1161 = phi i64 [ %t1159, %fixfast271 ], [ %t1160, %fixslow272 ]
  ret i64 %t1161
}

define fastcc i64 @"scheme.base:code:char<=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1162 = icmp sge i64 %argc, 2
  br i1 %t1162, label %argok275, label %arityerr274
arityerr274:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok275:
  %t1163 = call ptr @rt_alloc_words(i64 8)
  %t1164 = getelementptr i64, ptr %t1163, i64 0
  store i64 %a0, ptr %t1164
  %t1165 = getelementptr i64, ptr %t1163, i64 1
  store i64 %a1, ptr %t1165
  %t1166 = getelementptr i64, ptr %t1163, i64 2
  store i64 %a2, ptr %t1166
  %t1167 = getelementptr i64, ptr %t1163, i64 3
  store i64 %a3, ptr %t1167
  %t1168 = getelementptr i64, ptr %t1163, i64 4
  store i64 %a4, ptr %t1168
  %t1169 = getelementptr i64, ptr %t1163, i64 5
  store i64 %a5, ptr %t1169
  %t1170 = getelementptr i64, ptr %t1163, i64 6
  store i64 %a6, ptr %t1170
  %t1171 = getelementptr i64, ptr %t1163, i64 7
  store i64 %a7, ptr %t1171
  %t1172 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1163, ptr %overflow)
  %t1173 = call ptr @rt_alloc_words(i64 1)
  %t1174 = ptrtoint ptr %t1173 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_243" to i64), ptr %t1173
  %t1175 = or i64 %t1174, 4
  %t1176 = load i64, ptr @"scheme.base:chr-cmp"
  %t1177 = and i64 %t1176, -8
  %t1178 = inttoptr i64 %t1177 to ptr
  %t1179 = load i64, ptr %t1178
  %t1180 = inttoptr i64 %t1179 to ptr
  %t1181 = musttail call fastcc i64 %t1180(i64 %t1176, i64 4, i64 %t1175, i64 %a0, i64 %a1, i64 %t1172, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1181
}

define fastcc i64 @"scheme.base:code_255"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1186 = icmp eq i64 %argc, 2
  br i1 %t1186, label %argok277, label %arityerr276
arityerr276:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok277:
  %t1187 = or i64 %a1, %a0
  %t1188 = and i64 %t1187, 7
  %t1189 = icmp eq i64 %t1188, 0
  br i1 %t1189, label %fixfast278, label %fixslow279
fixfast278:
  %t1190 = icmp slt i64 %a1, %a0
  %t1191 = select i1 %t1190, i64 257, i64 1
  br label %fixmerge280
fixslow279:
  %t1192 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge280
fixmerge280:
  %t1193 = phi i64 [ %t1191, %fixfast278 ], [ %t1192, %fixslow279 ]
  %t1194 = icmp ne i64 %t1193, 1
  br i1 %t1194, label %then281, label %else282
then281:
  ret i64 257
else282:
  %t1195 = or i64 %a0, %a1
  %t1196 = and i64 %t1195, 7
  %t1197 = icmp eq i64 %t1196, 0
  br i1 %t1197, label %fixfast283, label %fixslow284
fixfast283:
  %t1198 = icmp eq i64 %a0, %a1
  %t1199 = select i1 %t1198, i64 257, i64 1
  br label %fixmerge285
fixslow284:
  %t1200 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge285
fixmerge285:
  %t1201 = phi i64 [ %t1199, %fixfast283 ], [ %t1200, %fixslow284 ]
  ret i64 %t1201
}

define fastcc i64 @"scheme.base:code:char>=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1202 = icmp sge i64 %argc, 2
  br i1 %t1202, label %argok287, label %arityerr286
arityerr286:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok287:
  %t1203 = call ptr @rt_alloc_words(i64 8)
  %t1204 = getelementptr i64, ptr %t1203, i64 0
  store i64 %a0, ptr %t1204
  %t1205 = getelementptr i64, ptr %t1203, i64 1
  store i64 %a1, ptr %t1205
  %t1206 = getelementptr i64, ptr %t1203, i64 2
  store i64 %a2, ptr %t1206
  %t1207 = getelementptr i64, ptr %t1203, i64 3
  store i64 %a3, ptr %t1207
  %t1208 = getelementptr i64, ptr %t1203, i64 4
  store i64 %a4, ptr %t1208
  %t1209 = getelementptr i64, ptr %t1203, i64 5
  store i64 %a5, ptr %t1209
  %t1210 = getelementptr i64, ptr %t1203, i64 6
  store i64 %a6, ptr %t1210
  %t1211 = getelementptr i64, ptr %t1203, i64 7
  store i64 %a7, ptr %t1211
  %t1212 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1203, ptr %overflow)
  %t1213 = call ptr @rt_alloc_words(i64 1)
  %t1214 = ptrtoint ptr %t1213 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_255" to i64), ptr %t1213
  %t1215 = or i64 %t1214, 4
  %t1216 = load i64, ptr @"scheme.base:chr-cmp"
  %t1217 = and i64 %t1216, -8
  %t1218 = inttoptr i64 %t1217 to ptr
  %t1219 = load i64, ptr %t1218
  %t1220 = inttoptr i64 %t1219 to ptr
  %t1221 = musttail call fastcc i64 %t1220(i64 %t1216, i64 4, i64 %t1215, i64 %a0, i64 %a1, i64 %t1212, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1221
}

define fastcc i64 @"scheme.base:code_266"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1226 = icmp eq i64 %argc, 2
  br i1 %t1226, label %argok289, label %arityerr288
arityerr288:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok289:
  %t1227 = or i64 %a0, 0
  %t1228 = and i64 %t1227, 7
  %t1229 = icmp eq i64 %t1228, 0
  br i1 %t1229, label %fixfast290, label %fixslow291
fixfast290:
  %t1230 = icmp slt i64 %a0, 0
  %t1231 = select i1 %t1230, i64 257, i64 1
  br label %fixmerge292
fixslow291:
  %t1232 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge292
fixmerge292:
  %t1233 = phi i64 [ %t1231, %fixfast290 ], [ %t1232, %fixslow291 ]
  %t1234 = icmp ne i64 %t1233, 1
  br i1 %t1234, label %then293, label %else294
then293:
  ret i64 %a1
else294:
  %t1235 = or i64 %a0, 8
  %t1236 = and i64 %t1235, 7
  %t1237 = icmp eq i64 %t1236, 0
  br i1 %t1237, label %fixfast295, label %fixslow296
fixfast295:
  %t1238 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t1239 = extractvalue {i64, i1} %t1238, 0
  %t1240 = extractvalue {i64, i1} %t1238, 1
  br i1 %t1240, label %fixslow296, label %fixmerge297
fixslow296:
  %t1241 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge297
fixmerge297:
  %t1242 = phi i64 [ %t1239, %fixfast295 ], [ %t1241, %fixslow296 ]
  %t1243 = and i64 %self, -8
  %t1244 = inttoptr i64 %t1243 to ptr
  %t1245 = getelementptr i64, ptr %t1244, i64 2
  %t1246 = load i64, ptr %t1245
  %t1247 = call i64 @rt_string_ref(i64 %t1246, i64 %a0)
  %t1248 = call i64 @rt_cons(i64 %t1247, i64 %a1)
  %t1249 = musttail call fastcc i64 @"scheme.base:code_266"(i64 %self, i64 2, i64 %t1242, i64 %t1248, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1249
}

define fastcc i64 @"scheme.base:code:string->list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1250 = icmp eq i64 %argc, 1
  br i1 %t1250, label %argok299, label %arityerr298
arityerr298:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok299:
  %t1251 = call ptr @rt_alloc_words(i64 3)
  %t1252 = ptrtoint ptr %t1251 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_266" to i64), ptr %t1251
  %t1253 = or i64 %t1252, 4
  %t1254 = getelementptr i64, ptr %t1251, i64 1
  store i64 %t1253, ptr %t1254
  %t1255 = getelementptr i64, ptr %t1251, i64 2
  store i64 %a0, ptr %t1255
  %t1256 = call i64 @rt_string_length(i64 %a0)
  %t1257 = or i64 %t1256, 8
  %t1258 = and i64 %t1257, 7
  %t1259 = icmp eq i64 %t1258, 0
  br i1 %t1259, label %fixfast300, label %fixslow301
fixfast300:
  %t1260 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t1256, i64 8)
  %t1261 = extractvalue {i64, i1} %t1260, 0
  %t1262 = extractvalue {i64, i1} %t1260, 1
  br i1 %t1262, label %fixslow301, label %fixmerge302
fixslow301:
  %t1263 = call i64 @rt_sub(i64 %t1256, i64 8)
  br label %fixmerge302
fixmerge302:
  %t1264 = phi i64 [ %t1261, %fixfast300 ], [ %t1263, %fixslow301 ]
  %t1265 = musttail call fastcc i64 @"scheme.base:code_266"(i64 %t1253, i64 2, i64 %t1264, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1265
}

define fastcc i64 @"scheme.base:code:ns-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1270 = icmp eq i64 %argc, 2
  br i1 %t1270, label %argok304, label %arityerr303
arityerr303:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok304:
  %t1271 = call i64 @rt_remainder(i64 %a0, i64 80)
  %t1272 = or i64 0, %t1271
  %t1273 = and i64 %t1272, 7
  %t1274 = icmp eq i64 %t1273, 0
  br i1 %t1274, label %fixfast305, label %fixslow306
fixfast305:
  %t1275 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %t1271)
  %t1276 = extractvalue {i64, i1} %t1275, 0
  %t1277 = extractvalue {i64, i1} %t1275, 1
  br i1 %t1277, label %fixslow306, label %fixmerge307
fixslow306:
  %t1278 = call i64 @rt_sub(i64 0, i64 %t1271)
  br label %fixmerge307
fixmerge307:
  %t1279 = phi i64 [ %t1276, %fixfast305 ], [ %t1278, %fixslow306 ]
  %t1280 = or i64 384, %t1279
  %t1281 = and i64 %t1280, 7
  %t1282 = icmp eq i64 %t1281, 0
  br i1 %t1282, label %fixfast308, label %fixslow309
fixfast308:
  %t1283 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 384, i64 %t1279)
  %t1284 = extractvalue {i64, i1} %t1283, 0
  %t1285 = extractvalue {i64, i1} %t1283, 1
  br i1 %t1285, label %fixslow309, label %fixmerge310
fixslow309:
  %t1286 = call i64 @rt_add(i64 384, i64 %t1279)
  br label %fixmerge310
fixmerge310:
  %t1287 = phi i64 [ %t1284, %fixfast308 ], [ %t1286, %fixslow309 ]
  %t1288 = call i64 @rt_integer_to_char(i64 %t1287)
  %t1289 = call i64 @rt_quotient(i64 %a0, i64 80)
  %t1290 = or i64 %t1289, 0
  %t1291 = and i64 %t1290, 7
  %t1292 = icmp eq i64 %t1291, 0
  br i1 %t1292, label %fixfast311, label %fixslow312
fixfast311:
  %t1293 = icmp eq i64 %t1289, 0
  %t1294 = select i1 %t1293, i64 257, i64 1
  br label %fixmerge313
fixslow312:
  %t1295 = call i64 @rt_num_eq(i64 %t1289, i64 0)
  br label %fixmerge313
fixmerge313:
  %t1296 = phi i64 [ %t1294, %fixfast311 ], [ %t1295, %fixslow312 ]
  %t1297 = icmp ne i64 %t1296, 1
  br i1 %t1297, label %then314, label %else315
then314:
  %t1298 = call i64 @rt_cons(i64 %t1288, i64 %a1)
  ret i64 %t1298
else315:
  %t1299 = call i64 @rt_cons(i64 %t1288, i64 %a1)
  %t1300 = load i64, ptr @"scheme.base:ns-digits"
  %t1301 = and i64 %t1300, -8
  %t1302 = inttoptr i64 %t1301 to ptr
  %t1303 = load i64, ptr %t1302
  %t1304 = inttoptr i64 %t1303 to ptr
  %t1305 = musttail call fastcc i64 %t1304(i64 %t1300, i64 2, i64 %t1289, i64 %t1299, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1305
}

define fastcc i64 @"scheme.base:code:number->string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1310 = icmp eq i64 %argc, 1
  br i1 %t1310, label %argok317, label %arityerr316
arityerr316:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok317:
  %t1311 = call i64 @rt_exact_p(i64 %a0)
  %t1312 = icmp ne i64 %t1311, 1
  br i1 %t1312, label %then318, label %else319
then318:
  %t1313 = or i64 %a0, 0
  %t1314 = and i64 %t1313, 7
  %t1315 = icmp eq i64 %t1314, 0
  br i1 %t1315, label %fixfast320, label %fixslow321
fixfast320:
  %t1316 = icmp eq i64 %a0, 0
  %t1317 = select i1 %t1316, i64 257, i64 1
  br label %fixmerge322
fixslow321:
  %t1318 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge322
fixmerge322:
  %t1319 = phi i64 [ %t1317, %fixfast320 ], [ %t1318, %fixslow321 ]
  %t1320 = icmp ne i64 %t1319, 1
  br i1 %t1320, label %then323, label %else324
then323:
  %t1321 = call i64 @rt_make_string(ptr @.str.lit.1, i64 1)
  ret i64 %t1321
else324:
  %t1322 = or i64 %a0, 0
  %t1323 = and i64 %t1322, 7
  %t1324 = icmp eq i64 %t1323, 0
  br i1 %t1324, label %fixfast325, label %fixslow326
fixfast325:
  %t1325 = icmp slt i64 %a0, 0
  %t1326 = select i1 %t1325, i64 257, i64 1
  br label %fixmerge327
fixslow326:
  %t1327 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge327
fixmerge327:
  %t1328 = phi i64 [ %t1326, %fixfast325 ], [ %t1327, %fixslow326 ]
  %t1329 = icmp ne i64 %t1328, 1
  br i1 %t1329, label %then328, label %else329
then328:
  %t1330 = load i64, ptr @"scheme.base:ns-digits"
  %t1331 = and i64 %t1330, -8
  %t1332 = inttoptr i64 %t1331 to ptr
  %t1333 = load i64, ptr %t1332
  %t1334 = inttoptr i64 %t1333 to ptr
  %t1335 = call fastcc i64%t1334(i64 %t1330, i64 2, i64 %a0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1336 = call i64 @rt_cons(i64 11529, i64 %t1335)
  %t1337 = call i64 @rt_list_to_string(i64 %t1336)
  ret i64 %t1337
else329:
  %t1338 = or i64 0, %a0
  %t1339 = and i64 %t1338, 7
  %t1340 = icmp eq i64 %t1339, 0
  br i1 %t1340, label %fixfast330, label %fixslow331
fixfast330:
  %t1341 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %a0)
  %t1342 = extractvalue {i64, i1} %t1341, 0
  %t1343 = extractvalue {i64, i1} %t1341, 1
  br i1 %t1343, label %fixslow331, label %fixmerge332
fixslow331:
  %t1344 = call i64 @rt_sub(i64 0, i64 %a0)
  br label %fixmerge332
fixmerge332:
  %t1345 = phi i64 [ %t1342, %fixfast330 ], [ %t1344, %fixslow331 ]
  %t1346 = load i64, ptr @"scheme.base:ns-digits"
  %t1347 = and i64 %t1346, -8
  %t1348 = inttoptr i64 %t1347 to ptr
  %t1349 = load i64, ptr %t1348
  %t1350 = inttoptr i64 %t1349 to ptr
  %t1351 = call fastcc i64%t1350(i64 %t1346, i64 2, i64 %t1345, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1352 = call i64 @rt_list_to_string(i64 %t1351)
  ret i64 %t1352
else319:
  %t1353 = call i64 @rt_flonum_to_string(i64 %a0)
  ret i64 %t1353
}

define fastcc i64 @"scheme.base:code:error"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1358 = icmp sge i64 %argc, 1
  br i1 %t1358, label %argok334, label %arityerr333
arityerr333:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok334:
  %t1359 = call ptr @rt_alloc_words(i64 8)
  %t1360 = getelementptr i64, ptr %t1359, i64 0
  store i64 %a0, ptr %t1360
  %t1361 = getelementptr i64, ptr %t1359, i64 1
  store i64 %a1, ptr %t1361
  %t1362 = getelementptr i64, ptr %t1359, i64 2
  store i64 %a2, ptr %t1362
  %t1363 = getelementptr i64, ptr %t1359, i64 3
  store i64 %a3, ptr %t1363
  %t1364 = getelementptr i64, ptr %t1359, i64 4
  store i64 %a4, ptr %t1364
  %t1365 = getelementptr i64, ptr %t1359, i64 5
  store i64 %a5, ptr %t1365
  %t1366 = getelementptr i64, ptr %t1359, i64 6
  store i64 %a6, ptr %t1366
  %t1367 = getelementptr i64, ptr %t1359, i64 7
  store i64 %a7, ptr %t1367
  %t1368 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t1359, ptr %overflow)
  %t1369 = call i64 @rt_string_p(i64 %a0)
  %t1370 = icmp ne i64 %t1369, 1
  br i1 %t1370, label %then335, label %else336
then335:
  %t1371 = call i64 @rt_make_error_object(i64 %a0, i64 %t1368)
  %t1372 = load i64, ptr @"scheme.base:raise"
  %t1373 = and i64 %t1372, -8
  %t1374 = inttoptr i64 %t1373 to ptr
  %t1375 = load i64, ptr %t1374
  %t1376 = inttoptr i64 %t1375 to ptr
  %t1377 = musttail call fastcc i64 %t1376(i64 %t1372, i64 1, i64 %t1371, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1377
else336:
  %t1378 = call i64 @rt_symbol_to_string(i64 %a0)
  %t1379 = call i64 @rt_make_string(ptr @.str.lit.2, i64 2)
  %t1380 = call i64 @rt_car(i64 %t1368)
  %t1381 = call i64 @rt_string_append(i64 %t1379, i64 %t1380)
  %t1382 = call i64 @rt_string_append(i64 %t1378, i64 %t1381)
  %t1383 = call i64 @rt_cdr(i64 %t1368)
  %t1384 = call i64 @rt_make_error_object(i64 %t1382, i64 %t1383)
  %t1385 = load i64, ptr @"scheme.base:raise"
  %t1386 = and i64 %t1385, -8
  %t1387 = inttoptr i64 %t1386 to ptr
  %t1388 = load i64, ptr %t1387
  %t1389 = inttoptr i64 %t1388 to ptr
  %t1390 = musttail call fastcc i64 %t1389(i64 %t1385, i64 1, i64 %t1384, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1390
}

define fastcc i64 @"scheme.base:code:%unwind-to"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1397 = icmp eq i64 %argc, 1
  br i1 %t1397, label %argok338, label %arityerr337
arityerr337:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok338:
  %t1398 = load i64, ptr @"scheme.base:*winds*"
  %t1399 = call i64 @rt_eq_p(i64 %t1398, i64 %a0)
  %t1400 = icmp ne i64 %t1399, 1
  br i1 %t1400, label %then339, label %else340
then339:
  ret i64 257
else340:
  %t1401 = load i64, ptr @"scheme.base:*winds*"
  %t1402 = call i64 @rt_null_p(i64 %t1401)
  %t1403 = icmp ne i64 %t1402, 1
  br i1 %t1403, label %then341, label %else342
then341:
  ret i64 257
else342:
  %t1404 = load i64, ptr @"scheme.base:*winds*"
  %t1405 = call i64 @rt_car(i64 %t1404)
  %t1406 = load i64, ptr @"scheme.base:*winds*"
  %t1407 = call i64 @rt_cdr(i64 %t1406)
  %t1408 = call i64 @rt_root(i64 %t1407)
  store i64 %t1408, ptr @"scheme.base:*winds*"
  %t1409 = call i64 @rt_cdr(i64 %t1405)
  %t1410 = and i64 %t1409, -8
  %t1411 = inttoptr i64 %t1410 to ptr
  %t1412 = load i64, ptr %t1411
  %t1413 = inttoptr i64 %t1412 to ptr
  %t1414 = call fastcc i64%t1413(i64 %t1409, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1415 = load i64, ptr @"scheme.base:%unwind-to"
  %t1416 = and i64 %t1415, -8
  %t1417 = inttoptr i64 %t1416 to ptr
  %t1418 = load i64, ptr %t1417
  %t1419 = inttoptr i64 %t1418 to ptr
  %t1420 = musttail call fastcc i64 %t1419(i64 %t1415, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1420
}

define fastcc i64 @"scheme.base:code:dynamic-wind"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1425 = icmp eq i64 %argc, 3
  br i1 %t1425, label %argok344, label %arityerr343
arityerr343:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok344:
  %t1426 = and i64 %a0, -8
  %t1427 = inttoptr i64 %t1426 to ptr
  %t1428 = load i64, ptr %t1427
  %t1429 = inttoptr i64 %t1428 to ptr
  %t1430 = call fastcc i64%t1429(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1431 = call i64 @rt_cons(i64 %a0, i64 %a2)
  %t1432 = load i64, ptr @"scheme.base:*winds*"
  %t1433 = call i64 @rt_cons(i64 %t1431, i64 %t1432)
  %t1434 = call i64 @rt_root(i64 %t1433)
  store i64 %t1434, ptr @"scheme.base:*winds*"
  %t1435 = and i64 %a1, -8
  %t1436 = inttoptr i64 %t1435 to ptr
  %t1437 = load i64, ptr %t1436
  %t1438 = inttoptr i64 %t1437 to ptr
  %t1439 = call fastcc i64%t1438(i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1440 = load i64, ptr @"scheme.base:*winds*"
  %t1441 = call i64 @rt_cdr(i64 %t1440)
  %t1442 = call i64 @rt_root(i64 %t1441)
  store i64 %t1442, ptr @"scheme.base:*winds*"
  %t1443 = and i64 %a2, -8
  %t1444 = inttoptr i64 %t1443 to ptr
  %t1445 = load i64, ptr %t1444
  %t1446 = inttoptr i64 %t1445 to ptr
  %t1447 = call fastcc i64%t1446(i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1439
}

define fastcc i64 @"scheme.base:code_309"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1452 = icmp eq i64 %argc, 1
  br i1 %t1452, label %argok346, label %arityerr345
arityerr345:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok346:
  %t1453 = and i64 %self, -8
  %t1454 = inttoptr i64 %t1453 to ptr
  %t1455 = getelementptr i64, ptr %t1454, i64 1
  %t1456 = load i64, ptr %t1455
  %t1457 = call i64 @rt_escape_live_p(i64 %t1456)
  %t1458 = icmp ne i64 %t1457, 1
  br i1 %t1458, label %then347, label %else348
then347:
  %t1459 = and i64 %self, -8
  %t1460 = inttoptr i64 %t1459 to ptr
  %t1461 = getelementptr i64, ptr %t1460, i64 2
  %t1462 = load i64, ptr %t1461
  %t1463 = load i64, ptr @"scheme.base:%unwind-to"
  %t1464 = and i64 %t1463, -8
  %t1465 = inttoptr i64 %t1464 to ptr
  %t1466 = load i64, ptr %t1465
  %t1467 = inttoptr i64 %t1466 to ptr
  %t1468 = call fastcc i64%t1467(i64 %t1463, i64 1, i64 %t1462, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1469 = and i64 %self, -8
  %t1470 = inttoptr i64 %t1469 to ptr
  %t1471 = getelementptr i64, ptr %t1470, i64 1
  %t1472 = load i64, ptr %t1471
  %t1473 = call i64 @rt_escape_to(i64 %t1472, i64 %a0)
  br label %merge349
else348:
  br label %merge349
merge349:
  %t1474 = phi i64 [ %t1473, %then347 ], [ 1, %else348 ]
  %t1475 = call i64 @rt_intern(ptr @.str.sym.3)
  %t1476 = call i64 @rt_make_string(ptr @.str.lit.4, i64 39)
  %t1477 = load i64, ptr @"scheme.base:error"
  %t1478 = and i64 %t1477, -8
  %t1479 = inttoptr i64 %t1478 to ptr
  %t1480 = load i64, ptr %t1479
  %t1481 = inttoptr i64 %t1480 to ptr
  %t1482 = musttail call fastcc i64 %t1481(i64 %t1477, i64 2, i64 %t1475, i64 %t1476, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1482
}

define fastcc i64 @"scheme.base:code_307"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1483 = icmp eq i64 %argc, 0
  br i1 %t1483, label %argok351, label %arityerr350
arityerr350:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok351:
  %t1484 = call i64 @rt_escape_frame()
  %t1485 = and i64 %self, -8
  %t1486 = inttoptr i64 %t1485 to ptr
  %t1487 = getelementptr i64, ptr %t1486, i64 2
  %t1488 = load i64, ptr %t1487
  %t1489 = call ptr @rt_alloc_words(i64 3)
  %t1490 = ptrtoint ptr %t1489 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_309" to i64), ptr %t1489
  %t1491 = getelementptr i64, ptr %t1489, i64 1
  store i64 %t1484, ptr %t1491
  %t1492 = getelementptr i64, ptr %t1489, i64 2
  store i64 %t1488, ptr %t1492
  %t1493 = or i64 %t1490, 4
  %t1494 = and i64 %self, -8
  %t1495 = inttoptr i64 %t1494 to ptr
  %t1496 = getelementptr i64, ptr %t1495, i64 1
  %t1497 = load i64, ptr %t1496
  %t1498 = and i64 %t1497, -8
  %t1499 = inttoptr i64 %t1498 to ptr
  %t1500 = load i64, ptr %t1499
  %t1501 = inttoptr i64 %t1500 to ptr
  %t1502 = musttail call fastcc i64 %t1501(i64 %t1497, i64 1, i64 %t1493, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1502
}

define fastcc i64 @"scheme.base:code:call-with-current-continuation"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1503 = icmp eq i64 %argc, 1
  br i1 %t1503, label %argok353, label %arityerr352
arityerr352:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok353:
  %t1504 = load i64, ptr @"scheme.base:*winds*"
  %t1505 = call ptr @rt_alloc_words(i64 3)
  %t1506 = ptrtoint ptr %t1505 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_307" to i64), ptr %t1505
  %t1507 = getelementptr i64, ptr %t1505, i64 1
  store i64 %a0, ptr %t1507
  %t1508 = getelementptr i64, ptr %t1505, i64 2
  store i64 %t1504, ptr %t1508
  %t1509 = or i64 %t1506, 4
  %t1510 = call i64 @rt_run_guarded(ptr @__apply0, i64 %t1509)
  %t1511 = call i64 @rt_cdr(i64 %t1510)
  ret i64 %t1511
}

define fastcc i64 @"scheme.base:code:call/cc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1516 = icmp eq i64 %argc, 1
  br i1 %t1516, label %argok355, label %arityerr354
arityerr354:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok355:
  %t1517 = load i64, ptr @"scheme.base:call-with-current-continuation"
  %t1518 = and i64 %t1517, -8
  %t1519 = inttoptr i64 %t1518 to ptr
  %t1520 = load i64, ptr %t1519
  %t1521 = inttoptr i64 %t1520 to ptr
  %t1522 = musttail call fastcc i64 %t1521(i64 %t1517, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1522
}

define fastcc i64 @"scheme.base:code_317"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1527 = icmp eq i64 %argc, 0
  br i1 %t1527, label %argok357, label %arityerr356
arityerr356:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok357:
  %t1528 = and i64 %self, -8
  %t1529 = inttoptr i64 %t1528 to ptr
  %t1530 = getelementptr i64, ptr %t1529, i64 1
  %t1531 = load i64, ptr %t1530
  %t1532 = and i64 %self, -8
  %t1533 = inttoptr i64 %t1532 to ptr
  %t1534 = getelementptr i64, ptr %t1533, i64 2
  %t1535 = load i64, ptr %t1534
  %t1536 = call i64 @rt_cons(i64 %t1531, i64 %t1535)
  %t1537 = call i64 @rt_root(i64 %t1536)
  store i64 %t1537, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code_319"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1538 = icmp eq i64 %argc, 0
  br i1 %t1538, label %argok359, label %arityerr358
arityerr358:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok359:
  %t1539 = and i64 %self, -8
  %t1540 = inttoptr i64 %t1539 to ptr
  %t1541 = getelementptr i64, ptr %t1540, i64 1
  %t1542 = load i64, ptr %t1541
  %t1543 = call i64 @rt_root(i64 %t1542)
  store i64 %t1543, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code:%with-handler"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1544 = icmp eq i64 %argc, 2
  br i1 %t1544, label %argok361, label %arityerr360
arityerr360:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok361:
  %t1545 = load i64, ptr @"scheme.base:*handlers*"
  %t1546 = call ptr @rt_alloc_words(i64 3)
  %t1547 = ptrtoint ptr %t1546 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_317" to i64), ptr %t1546
  %t1548 = getelementptr i64, ptr %t1546, i64 1
  store i64 %a0, ptr %t1548
  %t1549 = getelementptr i64, ptr %t1546, i64 2
  store i64 %t1545, ptr %t1549
  %t1550 = or i64 %t1547, 4
  %t1551 = call ptr @rt_alloc_words(i64 2)
  %t1552 = ptrtoint ptr %t1551 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_319" to i64), ptr %t1551
  %t1553 = getelementptr i64, ptr %t1551, i64 1
  store i64 %t1545, ptr %t1553
  %t1554 = or i64 %t1552, 4
  %t1555 = load i64, ptr @"scheme.base:dynamic-wind"
  %t1556 = and i64 %t1555, -8
  %t1557 = inttoptr i64 %t1556 to ptr
  %t1558 = load i64, ptr %t1557
  %t1559 = inttoptr i64 %t1558 to ptr
  %t1560 = musttail call fastcc i64 %t1559(i64 %t1555, i64 3, i64 %t1550, i64 %a1, i64 %t1554, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1560
}

define fastcc i64 @"scheme.base:code:raise"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1565 = icmp eq i64 %argc, 1
  br i1 %t1565, label %argok363, label %arityerr362
arityerr362:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok363:
  %t1566 = load i64, ptr @"scheme.base:*handlers*"
  %t1567 = call i64 @rt_null_p(i64 %t1566)
  %t1568 = icmp ne i64 %t1567, 1
  br i1 %t1568, label %then364, label %else365
then364:
  %t1569 = call i64 @rt_raise(i64 %a0)
  ret i64 %t1569
else365:
  %t1570 = load i64, ptr @"scheme.base:*handlers*"
  %t1571 = call i64 @rt_car(i64 %t1570)
  %t1572 = load i64, ptr @"scheme.base:*handlers*"
  %t1573 = load i64, ptr @"scheme.base:*handlers*"
  %t1574 = call i64 @rt_cdr(i64 %t1573)
  %t1575 = call i64 @rt_root(i64 %t1574)
  store i64 %t1575, ptr @"scheme.base:*handlers*"
  %t1576 = and i64 %t1571, -8
  %t1577 = inttoptr i64 %t1576 to ptr
  %t1578 = load i64, ptr %t1577
  %t1579 = inttoptr i64 %t1578 to ptr
  %t1580 = call fastcc i64%t1579(i64 %t1571, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1581 = call i64 @rt_root(i64 %t1572)
  store i64 %t1581, ptr @"scheme.base:*handlers*"
  %t1582 = call i64 @rt_raise(i64 %a0)
  ret i64 %t1582
}

define fastcc i64 @"scheme.base:code:error-object?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1587 = icmp eq i64 %argc, 1
  br i1 %t1587, label %argok367, label %arityerr366
arityerr366:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok367:
  %t1588 = call i64 @rt_error_object_p(i64 %a0)
  ret i64 %t1588
}

define fastcc i64 @"scheme.base:code:error-object-message"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1593 = icmp eq i64 %argc, 1
  br i1 %t1593, label %argok369, label %arityerr368
arityerr368:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok369:
  %t1594 = call i64 @rt_error_object_message(i64 %a0)
  ret i64 %t1594
}

define fastcc i64 @"scheme.base:code:error-object-irritants"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1599 = icmp eq i64 %argc, 1
  br i1 %t1599, label %argok371, label %arityerr370
arityerr370:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok371:
  %t1600 = call i64 @rt_error_object_irritants(i64 %a0)
  ret i64 %t1600
}

define fastcc i64 @"scheme.base:code_339"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1605 = icmp eq i64 %argc, 1
  br i1 %t1605, label %argok373, label %arityerr372
arityerr372:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok373:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_341"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1606 = icmp eq i64 %argc, 1
  br i1 %t1606, label %argok375, label %arityerr374
arityerr374:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok375:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_343"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1607 = icmp sge i64 %argc, 0
  br i1 %t1607, label %argok377, label %arityerr376
arityerr376:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok377:
  %t1608 = call ptr @rt_alloc_words(i64 8)
  %t1609 = getelementptr i64, ptr %t1608, i64 0
  store i64 %a0, ptr %t1609
  %t1610 = getelementptr i64, ptr %t1608, i64 1
  store i64 %a1, ptr %t1610
  %t1611 = getelementptr i64, ptr %t1608, i64 2
  store i64 %a2, ptr %t1611
  %t1612 = getelementptr i64, ptr %t1608, i64 3
  store i64 %a3, ptr %t1612
  %t1613 = getelementptr i64, ptr %t1608, i64 4
  store i64 %a4, ptr %t1613
  %t1614 = getelementptr i64, ptr %t1608, i64 5
  store i64 %a5, ptr %t1614
  %t1615 = getelementptr i64, ptr %t1608, i64 6
  store i64 %a6, ptr %t1615
  %t1616 = getelementptr i64, ptr %t1608, i64 7
  store i64 %a7, ptr %t1616
  %t1617 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1608, ptr %overflow)
  %t1618 = call i64 @rt_null_p(i64 %t1617)
  %t1619 = icmp ne i64 %t1618, 1
  br i1 %t1619, label %then378, label %else379
then378:
  %t1620 = and i64 %self, -8
  %t1621 = inttoptr i64 %t1620 to ptr
  %t1622 = getelementptr i64, ptr %t1621, i64 1
  %t1623 = load i64, ptr %t1622
  %t1624 = call i64 @rt_vector_ref(i64 %t1623, i64 0)
  ret i64 %t1624
else379:
  %t1625 = call i64 @rt_cdr(i64 %t1617)
  %t1626 = call i64 @rt_null_p(i64 %t1625)
  %t1627 = icmp ne i64 %t1626, 1
  br i1 %t1627, label %then380, label %else381
then380:
  %t1628 = and i64 %self, -8
  %t1629 = inttoptr i64 %t1628 to ptr
  %t1630 = getelementptr i64, ptr %t1629, i64 1
  %t1631 = load i64, ptr %t1630
  %t1632 = call i64 @rt_car(i64 %t1617)
  %t1633 = and i64 %self, -8
  %t1634 = inttoptr i64 %t1633 to ptr
  %t1635 = getelementptr i64, ptr %t1634, i64 2
  %t1636 = load i64, ptr %t1635
  %t1637 = and i64 %t1636, -8
  %t1638 = inttoptr i64 %t1637 to ptr
  %t1639 = load i64, ptr %t1638
  %t1640 = inttoptr i64 %t1639 to ptr
  %t1641 = call fastcc i64%t1640(i64 %t1636, i64 1, i64 %t1632, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1642 = call i64 @rt_vector_set(i64 %t1631, i64 0, i64 %t1641)
  ret i64 %t1642
else381:
  %t1643 = and i64 %self, -8
  %t1644 = inttoptr i64 %t1643 to ptr
  %t1645 = getelementptr i64, ptr %t1644, i64 1
  %t1646 = load i64, ptr %t1645
  %t1647 = call i64 @rt_car(i64 %t1617)
  %t1648 = call i64 @rt_vector_set(i64 %t1646, i64 0, i64 %t1647)
  ret i64 %t1648
}

define fastcc i64 @"scheme.base:code:make-parameter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1649 = icmp sge i64 %argc, 1
  br i1 %t1649, label %argok383, label %arityerr382
arityerr382:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok383:
  %t1650 = call ptr @rt_alloc_words(i64 8)
  %t1651 = getelementptr i64, ptr %t1650, i64 0
  store i64 %a0, ptr %t1651
  %t1652 = getelementptr i64, ptr %t1650, i64 1
  store i64 %a1, ptr %t1652
  %t1653 = getelementptr i64, ptr %t1650, i64 2
  store i64 %a2, ptr %t1653
  %t1654 = getelementptr i64, ptr %t1650, i64 3
  store i64 %a3, ptr %t1654
  %t1655 = getelementptr i64, ptr %t1650, i64 4
  store i64 %a4, ptr %t1655
  %t1656 = getelementptr i64, ptr %t1650, i64 5
  store i64 %a5, ptr %t1656
  %t1657 = getelementptr i64, ptr %t1650, i64 6
  store i64 %a6, ptr %t1657
  %t1658 = getelementptr i64, ptr %t1650, i64 7
  store i64 %a7, ptr %t1658
  %t1659 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t1650, ptr %overflow)
  %t1660 = call i64 @rt_null_p(i64 %t1659)
  %t1661 = icmp ne i64 %t1660, 1
  br i1 %t1661, label %then384, label %else385
then384:
  %t1662 = call ptr @rt_alloc_words(i64 1)
  %t1663 = ptrtoint ptr %t1662 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_339" to i64), ptr %t1662
  %t1664 = or i64 %t1663, 4
  br label %merge386
else385:
  %t1665 = call i64 @rt_car(i64 %t1659)
  br label %merge386
merge386:
  %t1666 = phi i64 [ %t1664, %then384 ], [ %t1665, %else385 ]
  %t1667 = call i64 @rt_make_vector(i64 8, i64 0)
  %t1668 = call i64 @rt_null_p(i64 %t1659)
  %t1669 = icmp ne i64 %t1668, 1
  br i1 %t1669, label %then387, label %else388
then387:
  %t1670 = call ptr @rt_alloc_words(i64 1)
  %t1671 = ptrtoint ptr %t1670 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_341" to i64), ptr %t1670
  %t1672 = or i64 %t1671, 4
  br label %merge389
else388:
  %t1673 = call i64 @rt_car(i64 %t1659)
  br label %merge389
merge389:
  %t1674 = phi i64 [ %t1672, %then387 ], [ %t1673, %else388 ]
  %t1675 = and i64 %t1674, -8
  %t1676 = inttoptr i64 %t1675 to ptr
  %t1677 = load i64, ptr %t1676
  %t1678 = inttoptr i64 %t1677 to ptr
  %t1679 = call fastcc i64%t1678(i64 %t1674, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1680 = call i64 @rt_vector_set(i64 %t1667, i64 0, i64 %t1679)
  %t1681 = call ptr @rt_alloc_words(i64 3)
  %t1682 = ptrtoint ptr %t1681 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_343" to i64), ptr %t1681
  %t1683 = getelementptr i64, ptr %t1681, i64 1
  store i64 %t1667, ptr %t1683
  %t1684 = getelementptr i64, ptr %t1681, i64 2
  store i64 %t1666, ptr %t1684
  %t1685 = or i64 %t1682, 4
  ret i64 %t1685
}

define fastcc i64 @"scheme.base:code_355"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1690 = icmp eq i64 %argc, 1
  br i1 %t1690, label %argok391, label %arityerr390
arityerr390:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok391:
  %t1691 = and i64 %a0, -8
  %t1692 = inttoptr i64 %t1691 to ptr
  %t1693 = load i64, ptr %t1692
  %t1694 = inttoptr i64 %t1693 to ptr
  %t1695 = musttail call fastcc i64 %t1694(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1695
}

define fastcc i64 @"scheme.base:code_359"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1696 = icmp eq i64 %argc, 2
  br i1 %t1696, label %argok393, label %arityerr392
arityerr392:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok393:
  %t1697 = and i64 %a0, -8
  %t1698 = inttoptr i64 %t1697 to ptr
  %t1699 = load i64, ptr %t1698
  %t1700 = inttoptr i64 %t1699 to ptr
  %t1701 = musttail call fastcc i64 %t1700(i64 %a0, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1701
}

define fastcc i64 @"scheme.base:code_357"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1702 = icmp eq i64 %argc, 0
  br i1 %t1702, label %argok395, label %arityerr394
arityerr394:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok395:
  %t1703 = call ptr @rt_alloc_words(i64 1)
  %t1704 = ptrtoint ptr %t1703 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_359" to i64), ptr %t1703
  %t1705 = or i64 %t1704, 4
  %t1706 = and i64 %self, -8
  %t1707 = inttoptr i64 %t1706 to ptr
  %t1708 = getelementptr i64, ptr %t1707, i64 1
  %t1709 = load i64, ptr %t1708
  %t1710 = and i64 %self, -8
  %t1711 = inttoptr i64 %t1710 to ptr
  %t1712 = getelementptr i64, ptr %t1711, i64 2
  %t1713 = load i64, ptr %t1712
  %t1714 = load i64, ptr @"scheme.base:for-each"
  %t1715 = and i64 %t1714, -8
  %t1716 = inttoptr i64 %t1715 to ptr
  %t1717 = load i64, ptr %t1716
  %t1718 = inttoptr i64 %t1717 to ptr
  %t1719 = musttail call fastcc i64 %t1718(i64 %t1714, i64 3, i64 %t1705, i64 %t1709, i64 %t1713, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1719
}

define fastcc i64 @"scheme.base:code_363"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1720 = icmp eq i64 %argc, 2
  br i1 %t1720, label %argok397, label %arityerr396
arityerr396:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok397:
  %t1721 = and i64 %a0, -8
  %t1722 = inttoptr i64 %t1721 to ptr
  %t1723 = load i64, ptr %t1722
  %t1724 = inttoptr i64 %t1723 to ptr
  %t1725 = musttail call fastcc i64 %t1724(i64 %a0, i64 2, i64 %a1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1725
}

define fastcc i64 @"scheme.base:code_361"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1726 = icmp eq i64 %argc, 0
  br i1 %t1726, label %argok399, label %arityerr398
arityerr398:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok399:
  %t1727 = call ptr @rt_alloc_words(i64 1)
  %t1728 = ptrtoint ptr %t1727 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_363" to i64), ptr %t1727
  %t1729 = or i64 %t1728, 4
  %t1730 = and i64 %self, -8
  %t1731 = inttoptr i64 %t1730 to ptr
  %t1732 = getelementptr i64, ptr %t1731, i64 1
  %t1733 = load i64, ptr %t1732
  %t1734 = and i64 %self, -8
  %t1735 = inttoptr i64 %t1734 to ptr
  %t1736 = getelementptr i64, ptr %t1735, i64 2
  %t1737 = load i64, ptr %t1736
  %t1738 = load i64, ptr @"scheme.base:for-each"
  %t1739 = and i64 %t1738, -8
  %t1740 = inttoptr i64 %t1739 to ptr
  %t1741 = load i64, ptr %t1740
  %t1742 = inttoptr i64 %t1741 to ptr
  %t1743 = musttail call fastcc i64 %t1742(i64 %t1738, i64 3, i64 %t1729, i64 %t1733, i64 %t1737, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1743
}

define fastcc i64 @"scheme.base:code:%with-parameters"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1744 = icmp eq i64 %argc, 3
  br i1 %t1744, label %argok401, label %arityerr400
arityerr400:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok401:
  %t1745 = call ptr @rt_alloc_words(i64 1)
  %t1746 = ptrtoint ptr %t1745 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_355" to i64), ptr %t1745
  %t1747 = or i64 %t1746, 4
  %t1748 = load i64, ptr @"scheme.base:map"
  %t1749 = and i64 %t1748, -8
  %t1750 = inttoptr i64 %t1749 to ptr
  %t1751 = load i64, ptr %t1750
  %t1752 = inttoptr i64 %t1751 to ptr
  %t1753 = call fastcc i64%t1752(i64 %t1748, i64 2, i64 %t1747, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1754 = call ptr @rt_alloc_words(i64 3)
  %t1755 = ptrtoint ptr %t1754 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_357" to i64), ptr %t1754
  %t1756 = getelementptr i64, ptr %t1754, i64 1
  store i64 %a0, ptr %t1756
  %t1757 = getelementptr i64, ptr %t1754, i64 2
  store i64 %a1, ptr %t1757
  %t1758 = or i64 %t1755, 4
  %t1759 = call ptr @rt_alloc_words(i64 3)
  %t1760 = ptrtoint ptr %t1759 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_361" to i64), ptr %t1759
  %t1761 = getelementptr i64, ptr %t1759, i64 1
  store i64 %a0, ptr %t1761
  %t1762 = getelementptr i64, ptr %t1759, i64 2
  store i64 %t1753, ptr %t1762
  %t1763 = or i64 %t1760, 4
  %t1764 = load i64, ptr @"scheme.base:dynamic-wind"
  %t1765 = and i64 %t1764, -8
  %t1766 = inttoptr i64 %t1765 to ptr
  %t1767 = load i64, ptr %t1766
  %t1768 = inttoptr i64 %t1767 to ptr
  %t1769 = musttail call fastcc i64 %t1768(i64 %t1764, i64 3, i64 %t1758, i64 %a2, i64 %t1763, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1769
}

define fastcc i64 @"scheme.base:code_371"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1774 = icmp eq i64 %argc, 2
  br i1 %t1774, label %argok403, label %arityerr402
arityerr402:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok403:
  %t1775 = call i64 @rt_null_p(i64 %a0)
  %t1776 = icmp ne i64 %t1775, 1
  br i1 %t1776, label %then404, label %else405
then404:
  %t1777 = and i64 %self, -8
  %t1778 = inttoptr i64 %t1777 to ptr
  %t1779 = getelementptr i64, ptr %t1778, i64 1
  %t1780 = load i64, ptr %t1779
  ret i64 %t1780
else405:
  %t1781 = and i64 %self, -8
  %t1782 = inttoptr i64 %t1781 to ptr
  %t1783 = getelementptr i64, ptr %t1782, i64 1
  %t1784 = load i64, ptr %t1783
  %t1785 = call i64 @rt_car(i64 %a0)
  %t1786 = call i64 @rt_vector_set(i64 %t1784, i64 %a1, i64 %t1785)
  %t1787 = call i64 @rt_cdr(i64 %a0)
  %t1788 = or i64 %a1, 8
  %t1789 = and i64 %t1788, 7
  %t1790 = icmp eq i64 %t1789, 0
  br i1 %t1790, label %fixfast406, label %fixslow407
fixfast406:
  %t1791 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t1792 = extractvalue {i64, i1} %t1791, 0
  %t1793 = extractvalue {i64, i1} %t1791, 1
  br i1 %t1793, label %fixslow407, label %fixmerge408
fixslow407:
  %t1794 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge408
fixmerge408:
  %t1795 = phi i64 [ %t1792, %fixfast406 ], [ %t1794, %fixslow407 ]
  %t1796 = musttail call fastcc i64 @"scheme.base:code_371"(i64 %self, i64 2, i64 %t1787, i64 %t1795, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1796
}

define fastcc i64 @"scheme.base:code:list->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1797 = icmp eq i64 %argc, 1
  br i1 %t1797, label %argok410, label %arityerr409
arityerr409:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok410:
  %t1798 = load i64, ptr @"scheme.base:length"
  %t1799 = and i64 %t1798, -8
  %t1800 = inttoptr i64 %t1799 to ptr
  %t1801 = load i64, ptr %t1800
  %t1802 = inttoptr i64 %t1801 to ptr
  %t1803 = call fastcc i64%t1802(i64 %t1798, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1804 = call i64 @rt_make_vector(i64 %t1803, i64 0)
  %t1805 = call ptr @rt_alloc_words(i64 3)
  %t1806 = ptrtoint ptr %t1805 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_371" to i64), ptr %t1805
  %t1807 = or i64 %t1806, 4
  %t1808 = getelementptr i64, ptr %t1805, i64 1
  store i64 %t1804, ptr %t1808
  %t1809 = getelementptr i64, ptr %t1805, i64 2
  store i64 %t1807, ptr %t1809
  %t1810 = musttail call fastcc i64 @"scheme.base:code_371"(i64 %t1807, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1810
}

define fastcc i64 @"scheme.base:code:vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1815 = icmp sge i64 %argc, 0
  br i1 %t1815, label %argok412, label %arityerr411
arityerr411:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok412:
  %t1816 = call ptr @rt_alloc_words(i64 8)
  %t1817 = getelementptr i64, ptr %t1816, i64 0
  store i64 %a0, ptr %t1817
  %t1818 = getelementptr i64, ptr %t1816, i64 1
  store i64 %a1, ptr %t1818
  %t1819 = getelementptr i64, ptr %t1816, i64 2
  store i64 %a2, ptr %t1819
  %t1820 = getelementptr i64, ptr %t1816, i64 3
  store i64 %a3, ptr %t1820
  %t1821 = getelementptr i64, ptr %t1816, i64 4
  store i64 %a4, ptr %t1821
  %t1822 = getelementptr i64, ptr %t1816, i64 5
  store i64 %a5, ptr %t1822
  %t1823 = getelementptr i64, ptr %t1816, i64 6
  store i64 %a6, ptr %t1823
  %t1824 = getelementptr i64, ptr %t1816, i64 7
  store i64 %a7, ptr %t1824
  %t1825 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1816, ptr %overflow)
  %t1826 = load i64, ptr @"scheme.base:list->vector"
  %t1827 = and i64 %t1826, -8
  %t1828 = inttoptr i64 %t1827 to ptr
  %t1829 = load i64, ptr %t1828
  %t1830 = inttoptr i64 %t1829 to ptr
  %t1831 = musttail call fastcc i64 %t1830(i64 %t1826, i64 1, i64 %t1825, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1831
}

define fastcc i64 @"scheme.base:code_381"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1836 = icmp eq i64 %argc, 2
  br i1 %t1836, label %argok414, label %arityerr413
arityerr413:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok414:
  %t1837 = call i64 @rt_null_p(i64 %a0)
  %t1838 = icmp ne i64 %t1837, 1
  br i1 %t1838, label %then415, label %else416
then415:
  %t1839 = and i64 %self, -8
  %t1840 = inttoptr i64 %t1839 to ptr
  %t1841 = getelementptr i64, ptr %t1840, i64 1
  %t1842 = load i64, ptr %t1841
  ret i64 %t1842
else416:
  %t1843 = and i64 %self, -8
  %t1844 = inttoptr i64 %t1843 to ptr
  %t1845 = getelementptr i64, ptr %t1844, i64 1
  %t1846 = load i64, ptr %t1845
  %t1847 = call i64 @rt_car(i64 %a0)
  %t1848 = call i64 @rt_bytevector_u8_set(i64 %t1846, i64 %a1, i64 %t1847)
  %t1849 = call i64 @rt_cdr(i64 %a0)
  %t1850 = or i64 %a1, 8
  %t1851 = and i64 %t1850, 7
  %t1852 = icmp eq i64 %t1851, 0
  br i1 %t1852, label %fixfast417, label %fixslow418
fixfast417:
  %t1853 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t1854 = extractvalue {i64, i1} %t1853, 0
  %t1855 = extractvalue {i64, i1} %t1853, 1
  br i1 %t1855, label %fixslow418, label %fixmerge419
fixslow418:
  %t1856 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge419
fixmerge419:
  %t1857 = phi i64 [ %t1854, %fixfast417 ], [ %t1856, %fixslow418 ]
  %t1858 = musttail call fastcc i64 @"scheme.base:code_381"(i64 %self, i64 2, i64 %t1849, i64 %t1857, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1858
}

define fastcc i64 @"scheme.base:code:list->bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1859 = icmp eq i64 %argc, 1
  br i1 %t1859, label %argok421, label %arityerr420
arityerr420:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok421:
  %t1860 = load i64, ptr @"scheme.base:length"
  %t1861 = and i64 %t1860, -8
  %t1862 = inttoptr i64 %t1861 to ptr
  %t1863 = load i64, ptr %t1862
  %t1864 = inttoptr i64 %t1863 to ptr
  %t1865 = call fastcc i64%t1864(i64 %t1860, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1866 = call i64 @rt_make_bytevector(i64 %t1865, i64 0)
  %t1867 = call ptr @rt_alloc_words(i64 3)
  %t1868 = ptrtoint ptr %t1867 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_381" to i64), ptr %t1867
  %t1869 = or i64 %t1868, 4
  %t1870 = getelementptr i64, ptr %t1867, i64 1
  store i64 %t1866, ptr %t1870
  %t1871 = getelementptr i64, ptr %t1867, i64 2
  store i64 %t1869, ptr %t1871
  %t1872 = musttail call fastcc i64 @"scheme.base:code_381"(i64 %t1869, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1872
}

define fastcc i64 @"scheme.base:code:bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1877 = icmp sge i64 %argc, 0
  br i1 %t1877, label %argok423, label %arityerr422
arityerr422:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok423:
  %t1878 = call ptr @rt_alloc_words(i64 8)
  %t1879 = getelementptr i64, ptr %t1878, i64 0
  store i64 %a0, ptr %t1879
  %t1880 = getelementptr i64, ptr %t1878, i64 1
  store i64 %a1, ptr %t1880
  %t1881 = getelementptr i64, ptr %t1878, i64 2
  store i64 %a2, ptr %t1881
  %t1882 = getelementptr i64, ptr %t1878, i64 3
  store i64 %a3, ptr %t1882
  %t1883 = getelementptr i64, ptr %t1878, i64 4
  store i64 %a4, ptr %t1883
  %t1884 = getelementptr i64, ptr %t1878, i64 5
  store i64 %a5, ptr %t1884
  %t1885 = getelementptr i64, ptr %t1878, i64 6
  store i64 %a6, ptr %t1885
  %t1886 = getelementptr i64, ptr %t1878, i64 7
  store i64 %a7, ptr %t1886
  %t1887 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1878, ptr %overflow)
  %t1888 = load i64, ptr @"scheme.base:list->bytevector"
  %t1889 = and i64 %t1888, -8
  %t1890 = inttoptr i64 %t1889 to ptr
  %t1891 = load i64, ptr %t1890
  %t1892 = inttoptr i64 %t1891 to ptr
  %t1893 = musttail call fastcc i64 %t1892(i64 %t1888, i64 1, i64 %t1887, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1893
}

define fastcc i64 @"scheme.base:code:values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1898 = icmp sge i64 %argc, 0
  br i1 %t1898, label %argok425, label %arityerr424
arityerr424:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok425:
  %t1899 = call ptr @rt_alloc_words(i64 8)
  %t1900 = getelementptr i64, ptr %t1899, i64 0
  store i64 %a0, ptr %t1900
  %t1901 = getelementptr i64, ptr %t1899, i64 1
  store i64 %a1, ptr %t1901
  %t1902 = getelementptr i64, ptr %t1899, i64 2
  store i64 %a2, ptr %t1902
  %t1903 = getelementptr i64, ptr %t1899, i64 3
  store i64 %a3, ptr %t1903
  %t1904 = getelementptr i64, ptr %t1899, i64 4
  store i64 %a4, ptr %t1904
  %t1905 = getelementptr i64, ptr %t1899, i64 5
  store i64 %a5, ptr %t1905
  %t1906 = getelementptr i64, ptr %t1899, i64 6
  store i64 %a6, ptr %t1906
  %t1907 = getelementptr i64, ptr %t1899, i64 7
  store i64 %a7, ptr %t1907
  %t1908 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1899, ptr %overflow)
  %t1909 = call i64 @rt_pair_p(i64 %t1908)
  %t1910 = icmp ne i64 %t1909, 1
  br i1 %t1910, label %then426, label %else427
then426:
  %t1911 = call i64 @rt_cdr(i64 %t1908)
  %t1912 = call i64 @rt_null_p(i64 %t1911)
  br label %merge428
else427:
  br label %merge428
merge428:
  %t1913 = phi i64 [ %t1912, %then426 ], [ 1, %else427 ]
  %t1914 = icmp ne i64 %t1913, 1
  br i1 %t1914, label %then429, label %else430
then429:
  %t1915 = call i64 @rt_car(i64 %t1908)
  ret i64 %t1915
else430:
  %t1916 = call i64 @rt_list_to_mv(i64 %t1908)
  ret i64 %t1916
}

define fastcc i64 @"scheme.base:code:call-with-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1921 = icmp eq i64 %argc, 2
  br i1 %t1921, label %argok432, label %arityerr431
arityerr431:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok432:
  %t1922 = and i64 %a0, -8
  %t1923 = inttoptr i64 %t1922 to ptr
  %t1924 = load i64, ptr %t1923
  %t1925 = inttoptr i64 %t1924 to ptr
  %t1926 = call fastcc i64%t1925(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1927 = call i64 @rt_mv_p(i64 %t1926)
  %t1928 = icmp ne i64 %t1927, 1
  br i1 %t1928, label %then433, label %else434
then433:
  %t1929 = call i64 @rt_mv_to_list(i64 %t1926)
  %t1930 = and i64 %a1, -8
  %t1931 = inttoptr i64 %t1930 to ptr
  %t1932 = load i64, ptr %t1931
  %t1933 = inttoptr i64 %t1932 to ptr
  %t1934 = call i64 @rt_list_length(i64 %t1929)
  %t1935 = add i64 0, %t1934
  %t1936 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t1929, i64 8)
  %t1948 = getelementptr i64, ptr %t1936, i64 0
  %t1940 = load i64, ptr %t1948
  %t1949 = getelementptr i64, ptr %t1936, i64 1
  %t1941 = load i64, ptr %t1949
  %t1950 = getelementptr i64, ptr %t1936, i64 2
  %t1942 = load i64, ptr %t1950
  %t1951 = getelementptr i64, ptr %t1936, i64 3
  %t1943 = load i64, ptr %t1951
  %t1952 = getelementptr i64, ptr %t1936, i64 4
  %t1944 = load i64, ptr %t1952
  %t1953 = getelementptr i64, ptr %t1936, i64 5
  %t1945 = load i64, ptr %t1953
  %t1954 = getelementptr i64, ptr %t1936, i64 6
  %t1946 = load i64, ptr %t1954
  %t1955 = getelementptr i64, ptr %t1936, i64 7
  %t1947 = load i64, ptr %t1955
  %t1937 = icmp sgt i64 %t1935, 8
  %t1938 = getelementptr i64, ptr %t1936, i64 8
  %t1939 = select i1 %t1937, ptr %t1938, ptr null
  %t1956 = musttail call fastcc i64 %t1933(i64 %a1, i64 %t1935, i64 %t1940, i64 %t1941, i64 %t1942, i64 %t1943, i64 %t1944, i64 %t1945, i64 %t1946, i64 %t1947, ptr %t1939)
  ret i64 %t1956
else434:
  %t1957 = and i64 %a1, -8
  %t1958 = inttoptr i64 %t1957 to ptr
  %t1959 = load i64, ptr %t1958
  %t1960 = inttoptr i64 %t1959 to ptr
  %t1961 = musttail call fastcc i64 %t1960(i64 %a1, i64 1, i64 %t1926, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1961
}

define fastcc i64 @"scheme.base:code:make-hash-table"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1968 = icmp eq i64 %argc, 0
  br i1 %t1968, label %argok436, label %arityerr435
arityerr435:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok436:
  %t1969 = load i64, ptr @"scheme.base:%ht-initial-buckets"
  %t1970 = call i64 @rt_make_vector(i64 %t1969, i64 2)
  %t1971 = load i64, ptr @"scheme.base:vector"
  %t1972 = and i64 %t1971, -8
  %t1973 = inttoptr i64 %t1972 to ptr
  %t1974 = load i64, ptr %t1973
  %t1975 = inttoptr i64 %t1974 to ptr
  %t1976 = call fastcc i64%t1975(i64 %t1971, i64 3, i64 0, i64 %t1970, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1977 = call i64 @rt_make_hash_table(i64 %t1976)
  ret i64 %t1977
}

define fastcc i64 @"scheme.base:code:hash-table?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1982 = icmp eq i64 %argc, 1
  br i1 %t1982, label %argok438, label %arityerr437
arityerr437:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok438:
  %t1983 = call i64 @rt_hash_table_p(i64 %a0)
  ret i64 %t1983
}

define fastcc i64 @"scheme.base:code:%ht-count"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1988 = icmp eq i64 %argc, 1
  br i1 %t1988, label %argok440, label %arityerr439
arityerr439:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok440:
  %t1989 = call i64 @rt_hash_table_spine(i64 %a0)
  %t1990 = call i64 @rt_vector_ref(i64 %t1989, i64 0)
  ret i64 %t1990
}

define fastcc i64 @"scheme.base:code:%ht-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1995 = icmp eq i64 %argc, 1
  br i1 %t1995, label %argok442, label %arityerr441
arityerr441:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok442:
  %t1996 = call i64 @rt_hash_table_spine(i64 %a0)
  %t1997 = call i64 @rt_vector_ref(i64 %t1996, i64 8)
  ret i64 %t1997
}

define fastcc i64 @"scheme.base:code:%ht-set-count!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2002 = icmp eq i64 %argc, 2
  br i1 %t2002, label %argok444, label %arityerr443
arityerr443:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok444:
  %t2003 = call i64 @rt_hash_table_spine(i64 %a0)
  %t2004 = call i64 @rt_vector_set(i64 %t2003, i64 0, i64 %a1)
  ret i64 %t2004
}

define fastcc i64 @"scheme.base:code:%ht-set-buckets!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2009 = icmp eq i64 %argc, 2
  br i1 %t2009, label %argok446, label %arityerr445
arityerr445:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok446:
  %t2010 = call i64 @rt_hash_table_spine(i64 %a0)
  %t2011 = call i64 @rt_vector_set(i64 %t2010, i64 8, i64 %a1)
  ret i64 %t2011
}

define fastcc i64 @"scheme.base:code:%ht-index"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2016 = icmp eq i64 %argc, 2
  br i1 %t2016, label %argok448, label %arityerr447
arityerr447:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok448:
  %t2017 = call i64 @rt_hash(i64 %a0)
  %t2018 = call i64 @rt_remainder(i64 %t2017, i64 %a1)
  ret i64 %t2018
}

define fastcc i64 @"scheme.base:code:%ht-assoc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2023 = icmp eq i64 %argc, 2
  br i1 %t2023, label %argok450, label %arityerr449
arityerr449:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok450:
  %t2024 = call i64 @rt_null_p(i64 %a1)
  %t2025 = icmp ne i64 %t2024, 1
  br i1 %t2025, label %then451, label %else452
then451:
  ret i64 1
else452:
  %t2026 = call i64 @rt_car(i64 %a1)
  %t2027 = call i64 @rt_car(i64 %t2026)
  %t2028 = call i64 @rt_equal(i64 %a0, i64 %t2027)
  %t2029 = icmp ne i64 %t2028, 1
  br i1 %t2029, label %then453, label %else454
then453:
  %t2030 = call i64 @rt_car(i64 %a1)
  ret i64 %t2030
else454:
  %t2031 = call i64 @rt_cdr(i64 %a1)
  %t2032 = load i64, ptr @"scheme.base:%ht-assoc"
  %t2033 = and i64 %t2032, -8
  %t2034 = inttoptr i64 %t2033 to ptr
  %t2035 = load i64, ptr %t2034
  %t2036 = inttoptr i64 %t2035 to ptr
  %t2037 = musttail call fastcc i64 %t2036(i64 %t2032, i64 2, i64 %a0, i64 %t2031, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2037
}

define fastcc i64 @"scheme.base:code:%ht-remove"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2042 = icmp eq i64 %argc, 2
  br i1 %t2042, label %argok456, label %arityerr455
arityerr455:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok456:
  %t2043 = call i64 @rt_null_p(i64 %a1)
  %t2044 = icmp ne i64 %t2043, 1
  br i1 %t2044, label %then457, label %else458
then457:
  ret i64 2
else458:
  %t2045 = call i64 @rt_car(i64 %a1)
  %t2046 = call i64 @rt_car(i64 %t2045)
  %t2047 = call i64 @rt_equal(i64 %a0, i64 %t2046)
  %t2048 = icmp ne i64 %t2047, 1
  br i1 %t2048, label %then459, label %else460
then459:
  %t2049 = call i64 @rt_cdr(i64 %a1)
  ret i64 %t2049
else460:
  %t2050 = call i64 @rt_car(i64 %a1)
  %t2051 = call i64 @rt_cdr(i64 %a1)
  %t2052 = load i64, ptr @"scheme.base:%ht-remove"
  %t2053 = and i64 %t2052, -8
  %t2054 = inttoptr i64 %t2053 to ptr
  %t2055 = load i64, ptr %t2054
  %t2056 = inttoptr i64 %t2055 to ptr
  %t2057 = call fastcc i64%t2056(i64 %t2052, i64 2, i64 %a0, i64 %t2051, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2058 = call i64 @rt_cons(i64 %t2050, i64 %t2057)
  ret i64 %t2058
}

define fastcc i64 @"scheme.base:code:hash-table-ref/default"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2063 = icmp eq i64 %argc, 3
  br i1 %t2063, label %argok462, label %arityerr461
arityerr461:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok462:
  %t2064 = load i64, ptr @"scheme.base:%ht-buckets"
  %t2065 = and i64 %t2064, -8
  %t2066 = inttoptr i64 %t2065 to ptr
  %t2067 = load i64, ptr %t2066
  %t2068 = inttoptr i64 %t2067 to ptr
  %t2069 = call fastcc i64%t2068(i64 %t2064, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2070 = call i64 @rt_vector_length(i64 %t2069)
  %t2071 = load i64, ptr @"scheme.base:%ht-index"
  %t2072 = and i64 %t2071, -8
  %t2073 = inttoptr i64 %t2072 to ptr
  %t2074 = load i64, ptr %t2073
  %t2075 = inttoptr i64 %t2074 to ptr
  %t2076 = call fastcc i64%t2075(i64 %t2071, i64 2, i64 %a1, i64 %t2070, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2077 = call i64 @rt_vector_ref(i64 %t2069, i64 %t2076)
  %t2078 = load i64, ptr @"scheme.base:%ht-assoc"
  %t2079 = and i64 %t2078, -8
  %t2080 = inttoptr i64 %t2079 to ptr
  %t2081 = load i64, ptr %t2080
  %t2082 = inttoptr i64 %t2081 to ptr
  %t2083 = call fastcc i64%t2082(i64 %t2078, i64 2, i64 %a1, i64 %t2077, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2084 = icmp ne i64 %t2083, 1
  br i1 %t2084, label %then463, label %else464
then463:
  %t2085 = call i64 @rt_cdr(i64 %t2083)
  ret i64 %t2085
else464:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:hash-table-contains?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2090 = icmp eq i64 %argc, 2
  br i1 %t2090, label %argok466, label %arityerr465
arityerr465:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok466:
  %t2091 = load i64, ptr @"scheme.base:%ht-buckets"
  %t2092 = and i64 %t2091, -8
  %t2093 = inttoptr i64 %t2092 to ptr
  %t2094 = load i64, ptr %t2093
  %t2095 = inttoptr i64 %t2094 to ptr
  %t2096 = call fastcc i64%t2095(i64 %t2091, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2097 = call i64 @rt_vector_length(i64 %t2096)
  %t2098 = load i64, ptr @"scheme.base:%ht-index"
  %t2099 = and i64 %t2098, -8
  %t2100 = inttoptr i64 %t2099 to ptr
  %t2101 = load i64, ptr %t2100
  %t2102 = inttoptr i64 %t2101 to ptr
  %t2103 = call fastcc i64%t2102(i64 %t2098, i64 2, i64 %a1, i64 %t2097, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2104 = call i64 @rt_vector_ref(i64 %t2096, i64 %t2103)
  %t2105 = load i64, ptr @"scheme.base:%ht-assoc"
  %t2106 = and i64 %t2105, -8
  %t2107 = inttoptr i64 %t2106 to ptr
  %t2108 = load i64, ptr %t2107
  %t2109 = inttoptr i64 %t2108 to ptr
  %t2110 = call fastcc i64%t2109(i64 %t2105, i64 2, i64 %a1, i64 %t2104, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2111 = icmp ne i64 %t2110, 1
  br i1 %t2111, label %then467, label %else468
then467:
  ret i64 257
else468:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-ref"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2116 = icmp eq i64 %argc, 2
  br i1 %t2116, label %argok470, label %arityerr469
arityerr469:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok470:
  %t2117 = load i64, ptr @"scheme.base:%ht-buckets"
  %t2118 = and i64 %t2117, -8
  %t2119 = inttoptr i64 %t2118 to ptr
  %t2120 = load i64, ptr %t2119
  %t2121 = inttoptr i64 %t2120 to ptr
  %t2122 = call fastcc i64%t2121(i64 %t2117, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2123 = call i64 @rt_vector_length(i64 %t2122)
  %t2124 = load i64, ptr @"scheme.base:%ht-index"
  %t2125 = and i64 %t2124, -8
  %t2126 = inttoptr i64 %t2125 to ptr
  %t2127 = load i64, ptr %t2126
  %t2128 = inttoptr i64 %t2127 to ptr
  %t2129 = call fastcc i64%t2128(i64 %t2124, i64 2, i64 %a1, i64 %t2123, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2130 = call i64 @rt_vector_ref(i64 %t2122, i64 %t2129)
  %t2131 = load i64, ptr @"scheme.base:%ht-assoc"
  %t2132 = and i64 %t2131, -8
  %t2133 = inttoptr i64 %t2132 to ptr
  %t2134 = load i64, ptr %t2133
  %t2135 = inttoptr i64 %t2134 to ptr
  %t2136 = call fastcc i64%t2135(i64 %t2131, i64 2, i64 %a1, i64 %t2130, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2137 = icmp ne i64 %t2136, 1
  br i1 %t2137, label %then471, label %else472
then471:
  %t2138 = call i64 @rt_cdr(i64 %t2136)
  ret i64 %t2138
else472:
  %t2139 = call i64 @rt_make_string(ptr @.str.lit.5, i64 29)
  %t2140 = load i64, ptr @"scheme.base:error"
  %t2141 = and i64 %t2140, -8
  %t2142 = inttoptr i64 %t2141 to ptr
  %t2143 = load i64, ptr %t2142
  %t2144 = inttoptr i64 %t2143 to ptr
  %t2145 = musttail call fastcc i64 %t2144(i64 %t2140, i64 2, i64 %t2139, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2145
}

define fastcc i64 @"scheme.base:code:hash-table-set!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2150 = icmp eq i64 %argc, 3
  br i1 %t2150, label %argok474, label %arityerr473
arityerr473:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok474:
  %t2151 = load i64, ptr @"scheme.base:%ht-buckets"
  %t2152 = and i64 %t2151, -8
  %t2153 = inttoptr i64 %t2152 to ptr
  %t2154 = load i64, ptr %t2153
  %t2155 = inttoptr i64 %t2154 to ptr
  %t2156 = call fastcc i64%t2155(i64 %t2151, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2157 = call i64 @rt_vector_length(i64 %t2156)
  %t2158 = load i64, ptr @"scheme.base:%ht-index"
  %t2159 = and i64 %t2158, -8
  %t2160 = inttoptr i64 %t2159 to ptr
  %t2161 = load i64, ptr %t2160
  %t2162 = inttoptr i64 %t2161 to ptr
  %t2163 = call fastcc i64%t2162(i64 %t2158, i64 2, i64 %a1, i64 %t2157, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2164 = call i64 @rt_vector_ref(i64 %t2156, i64 %t2163)
  %t2165 = load i64, ptr @"scheme.base:%ht-assoc"
  %t2166 = and i64 %t2165, -8
  %t2167 = inttoptr i64 %t2166 to ptr
  %t2168 = load i64, ptr %t2167
  %t2169 = inttoptr i64 %t2168 to ptr
  %t2170 = call fastcc i64%t2169(i64 %t2165, i64 2, i64 %a1, i64 %t2164, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2171 = call i64 @rt_cons(i64 %a1, i64 %a2)
  %t2172 = icmp ne i64 %t2170, 1
  br i1 %t2172, label %then475, label %else476
then475:
  %t2173 = load i64, ptr @"scheme.base:%ht-remove"
  %t2174 = and i64 %t2173, -8
  %t2175 = inttoptr i64 %t2174 to ptr
  %t2176 = load i64, ptr %t2175
  %t2177 = inttoptr i64 %t2176 to ptr
  %t2178 = call fastcc i64%t2177(i64 %t2173, i64 2, i64 %a1, i64 %t2164, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge477
else476:
  br label %merge477
merge477:
  %t2179 = phi i64 [ %t2178, %then475 ], [ %t2164, %else476 ]
  %t2180 = call i64 @rt_cons(i64 %t2171, i64 %t2179)
  %t2181 = call i64 @rt_vector_set(i64 %t2156, i64 %t2163, i64 %t2180)
  %t2182 = icmp ne i64 %t2170, 1
  br i1 %t2182, label %then478, label %else479
then478:
  ret i64 1
else479:
  %t2183 = load i64, ptr @"scheme.base:%ht-count"
  %t2184 = and i64 %t2183, -8
  %t2185 = inttoptr i64 %t2184 to ptr
  %t2186 = load i64, ptr %t2185
  %t2187 = inttoptr i64 %t2186 to ptr
  %t2188 = call fastcc i64%t2187(i64 %t2183, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2189 = or i64 %t2188, 8
  %t2190 = and i64 %t2189, 7
  %t2191 = icmp eq i64 %t2190, 0
  br i1 %t2191, label %fixfast480, label %fixslow481
fixfast480:
  %t2192 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t2188, i64 8)
  %t2193 = extractvalue {i64, i1} %t2192, 0
  %t2194 = extractvalue {i64, i1} %t2192, 1
  br i1 %t2194, label %fixslow481, label %fixmerge482
fixslow481:
  %t2195 = call i64 @rt_add(i64 %t2188, i64 8)
  br label %fixmerge482
fixmerge482:
  %t2196 = phi i64 [ %t2193, %fixfast480 ], [ %t2195, %fixslow481 ]
  %t2197 = load i64, ptr @"scheme.base:%ht-set-count!"
  %t2198 = and i64 %t2197, -8
  %t2199 = inttoptr i64 %t2198 to ptr
  %t2200 = load i64, ptr %t2199
  %t2201 = inttoptr i64 %t2200 to ptr
  %t2202 = call fastcc i64%t2201(i64 %t2197, i64 2, i64 %a0, i64 %t2196, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2203 = load i64, ptr @"scheme.base:%ht-count"
  %t2204 = and i64 %t2203, -8
  %t2205 = inttoptr i64 %t2204 to ptr
  %t2206 = load i64, ptr %t2205
  %t2207 = inttoptr i64 %t2206 to ptr
  %t2208 = call fastcc i64%t2207(i64 %t2203, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2209 = load i64, ptr @"scheme.base:%ht-load-factor"
  %t2210 = or i64 %t2209, %t2157
  %t2211 = and i64 %t2210, 7
  %t2212 = icmp eq i64 %t2211, 0
  br i1 %t2212, label %fixfast483, label %fixslow484
fixfast483:
  %t2213 = ashr i64 %t2209, 3
  %t2214 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t2213, i64 %t2157)
  %t2215 = extractvalue {i64, i1} %t2214, 0
  %t2216 = extractvalue {i64, i1} %t2214, 1
  br i1 %t2216, label %fixslow484, label %fixmerge485
fixslow484:
  %t2217 = call i64 @rt_mul(i64 %t2209, i64 %t2157)
  br label %fixmerge485
fixmerge485:
  %t2218 = phi i64 [ %t2215, %fixfast483 ], [ %t2217, %fixslow484 ]
  %t2219 = or i64 %t2218, %t2208
  %t2220 = and i64 %t2219, 7
  %t2221 = icmp eq i64 %t2220, 0
  br i1 %t2221, label %fixfast486, label %fixslow487
fixfast486:
  %t2222 = icmp slt i64 %t2218, %t2208
  %t2223 = select i1 %t2222, i64 257, i64 1
  br label %fixmerge488
fixslow487:
  %t2224 = call i64 @rt_lt(i64 %t2218, i64 %t2208)
  br label %fixmerge488
fixmerge488:
  %t2225 = phi i64 [ %t2223, %fixfast486 ], [ %t2224, %fixslow487 ]
  %t2226 = icmp ne i64 %t2225, 1
  br i1 %t2226, label %then489, label %else490
then489:
  %t2227 = load i64, ptr @"scheme.base:%ht-grow!"
  %t2228 = and i64 %t2227, -8
  %t2229 = inttoptr i64 %t2228 to ptr
  %t2230 = load i64, ptr %t2229
  %t2231 = inttoptr i64 %t2230 to ptr
  %t2232 = musttail call fastcc i64 %t2231(i64 %t2227, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2232
else490:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-delete!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2237 = icmp eq i64 %argc, 2
  br i1 %t2237, label %argok492, label %arityerr491
arityerr491:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok492:
  %t2238 = load i64, ptr @"scheme.base:%ht-buckets"
  %t2239 = and i64 %t2238, -8
  %t2240 = inttoptr i64 %t2239 to ptr
  %t2241 = load i64, ptr %t2240
  %t2242 = inttoptr i64 %t2241 to ptr
  %t2243 = call fastcc i64%t2242(i64 %t2238, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2244 = call i64 @rt_vector_length(i64 %t2243)
  %t2245 = load i64, ptr @"scheme.base:%ht-index"
  %t2246 = and i64 %t2245, -8
  %t2247 = inttoptr i64 %t2246 to ptr
  %t2248 = load i64, ptr %t2247
  %t2249 = inttoptr i64 %t2248 to ptr
  %t2250 = call fastcc i64%t2249(i64 %t2245, i64 2, i64 %a1, i64 %t2244, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2251 = call i64 @rt_vector_ref(i64 %t2243, i64 %t2250)
  %t2252 = load i64, ptr @"scheme.base:%ht-assoc"
  %t2253 = and i64 %t2252, -8
  %t2254 = inttoptr i64 %t2253 to ptr
  %t2255 = load i64, ptr %t2254
  %t2256 = inttoptr i64 %t2255 to ptr
  %t2257 = call fastcc i64%t2256(i64 %t2252, i64 2, i64 %a1, i64 %t2251, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2258 = icmp ne i64 %t2257, 1
  br i1 %t2258, label %then493, label %else494
then493:
  %t2259 = load i64, ptr @"scheme.base:%ht-remove"
  %t2260 = and i64 %t2259, -8
  %t2261 = inttoptr i64 %t2260 to ptr
  %t2262 = load i64, ptr %t2261
  %t2263 = inttoptr i64 %t2262 to ptr
  %t2264 = call fastcc i64%t2263(i64 %t2259, i64 2, i64 %a1, i64 %t2251, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2265 = call i64 @rt_vector_set(i64 %t2243, i64 %t2250, i64 %t2264)
  %t2266 = load i64, ptr @"scheme.base:%ht-count"
  %t2267 = and i64 %t2266, -8
  %t2268 = inttoptr i64 %t2267 to ptr
  %t2269 = load i64, ptr %t2268
  %t2270 = inttoptr i64 %t2269 to ptr
  %t2271 = call fastcc i64%t2270(i64 %t2266, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2272 = or i64 %t2271, 8
  %t2273 = and i64 %t2272, 7
  %t2274 = icmp eq i64 %t2273, 0
  br i1 %t2274, label %fixfast495, label %fixslow496
fixfast495:
  %t2275 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t2271, i64 8)
  %t2276 = extractvalue {i64, i1} %t2275, 0
  %t2277 = extractvalue {i64, i1} %t2275, 1
  br i1 %t2277, label %fixslow496, label %fixmerge497
fixslow496:
  %t2278 = call i64 @rt_sub(i64 %t2271, i64 8)
  br label %fixmerge497
fixmerge497:
  %t2279 = phi i64 [ %t2276, %fixfast495 ], [ %t2278, %fixslow496 ]
  %t2280 = load i64, ptr @"scheme.base:%ht-set-count!"
  %t2281 = and i64 %t2280, -8
  %t2282 = inttoptr i64 %t2281 to ptr
  %t2283 = load i64, ptr %t2282
  %t2284 = inttoptr i64 %t2283 to ptr
  %t2285 = musttail call fastcc i64 %t2284(i64 %t2280, i64 2, i64 %a0, i64 %t2279, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2285
else494:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_464"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2290 = icmp eq i64 %argc, 1
  br i1 %t2290, label %argok499, label %arityerr498
arityerr498:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok499:
  %t2291 = call i64 @rt_null_p(i64 %a0)
  %t2292 = icmp ne i64 %t2291, 1
  br i1 %t2292, label %then500, label %else501
then500:
  ret i64 1
else501:
  %t2293 = call i64 @rt_car(i64 %a0)
  %t2294 = call i64 @rt_car(i64 %t2293)
  %t2295 = and i64 %self, -8
  %t2296 = inttoptr i64 %t2295 to ptr
  %t2297 = getelementptr i64, ptr %t2296, i64 1
  %t2298 = load i64, ptr %t2297
  %t2299 = load i64, ptr @"scheme.base:%ht-index"
  %t2300 = and i64 %t2299, -8
  %t2301 = inttoptr i64 %t2300 to ptr
  %t2302 = load i64, ptr %t2301
  %t2303 = inttoptr i64 %t2302 to ptr
  %t2304 = call fastcc i64%t2303(i64 %t2299, i64 2, i64 %t2294, i64 %t2298, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2305 = and i64 %self, -8
  %t2306 = inttoptr i64 %t2305 to ptr
  %t2307 = getelementptr i64, ptr %t2306, i64 2
  %t2308 = load i64, ptr %t2307
  %t2309 = and i64 %self, -8
  %t2310 = inttoptr i64 %t2309 to ptr
  %t2311 = getelementptr i64, ptr %t2310, i64 2
  %t2312 = load i64, ptr %t2311
  %t2313 = call i64 @rt_vector_ref(i64 %t2312, i64 %t2304)
  %t2314 = call i64 @rt_cons(i64 %t2293, i64 %t2313)
  %t2315 = call i64 @rt_vector_set(i64 %t2308, i64 %t2304, i64 %t2314)
  %t2316 = call i64 @rt_cdr(i64 %a0)
  %t2317 = musttail call fastcc i64 @"scheme.base:code_464"(i64 %self, i64 1, i64 %t2316, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2317
}

define fastcc i64 @"scheme.base:code_462"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2318 = icmp eq i64 %argc, 1
  br i1 %t2318, label %argok503, label %arityerr502
arityerr502:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok503:
  %t2319 = and i64 %self, -8
  %t2320 = inttoptr i64 %t2319 to ptr
  %t2321 = getelementptr i64, ptr %t2320, i64 1
  %t2322 = load i64, ptr %t2321
  %t2323 = call i64 @rt_vector_length(i64 %t2322)
  %t2324 = or i64 %a0, %t2323
  %t2325 = and i64 %t2324, 7
  %t2326 = icmp eq i64 %t2325, 0
  br i1 %t2326, label %fixfast504, label %fixslow505
fixfast504:
  %t2327 = icmp slt i64 %a0, %t2323
  %t2328 = select i1 %t2327, i64 257, i64 1
  br label %fixmerge506
fixslow505:
  %t2329 = call i64 @rt_lt(i64 %a0, i64 %t2323)
  br label %fixmerge506
fixmerge506:
  %t2330 = phi i64 [ %t2328, %fixfast504 ], [ %t2329, %fixslow505 ]
  %t2331 = icmp ne i64 %t2330, 1
  br i1 %t2331, label %then507, label %else508
then507:
  %t2332 = call ptr @rt_alloc_words(i64 4)
  %t2333 = ptrtoint ptr %t2332 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_464" to i64), ptr %t2332
  %t2334 = or i64 %t2333, 4
  %t2335 = and i64 %self, -8
  %t2336 = inttoptr i64 %t2335 to ptr
  %t2337 = getelementptr i64, ptr %t2336, i64 2
  %t2338 = load i64, ptr %t2337
  %t2339 = getelementptr i64, ptr %t2332, i64 1
  store i64 %t2338, ptr %t2339
  %t2340 = and i64 %self, -8
  %t2341 = inttoptr i64 %t2340 to ptr
  %t2342 = getelementptr i64, ptr %t2341, i64 3
  %t2343 = load i64, ptr %t2342
  %t2344 = getelementptr i64, ptr %t2332, i64 2
  store i64 %t2343, ptr %t2344
  %t2345 = getelementptr i64, ptr %t2332, i64 3
  store i64 %t2334, ptr %t2345
  %t2346 = and i64 %self, -8
  %t2347 = inttoptr i64 %t2346 to ptr
  %t2348 = getelementptr i64, ptr %t2347, i64 1
  %t2349 = load i64, ptr %t2348
  %t2350 = call i64 @rt_vector_ref(i64 %t2349, i64 %a0)
  %t2351 = call fastcc i64 @"scheme.base:code_464"(i64 %t2334, i64 1, i64 %t2350, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2352 = or i64 %a0, 8
  %t2353 = and i64 %t2352, 7
  %t2354 = icmp eq i64 %t2353, 0
  br i1 %t2354, label %fixfast509, label %fixslow510
fixfast509:
  %t2355 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t2356 = extractvalue {i64, i1} %t2355, 0
  %t2357 = extractvalue {i64, i1} %t2355, 1
  br i1 %t2357, label %fixslow510, label %fixmerge511
fixslow510:
  %t2358 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge511
fixmerge511:
  %t2359 = phi i64 [ %t2356, %fixfast509 ], [ %t2358, %fixslow510 ]
  %t2360 = musttail call fastcc i64 @"scheme.base:code_462"(i64 %self, i64 1, i64 %t2359, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2360
else508:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%ht-grow!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2361 = icmp eq i64 %argc, 1
  br i1 %t2361, label %argok513, label %arityerr512
arityerr512:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok513:
  %t2362 = load i64, ptr @"scheme.base:%ht-buckets"
  %t2363 = and i64 %t2362, -8
  %t2364 = inttoptr i64 %t2363 to ptr
  %t2365 = load i64, ptr %t2364
  %t2366 = inttoptr i64 %t2365 to ptr
  %t2367 = call fastcc i64%t2366(i64 %t2362, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2368 = call i64 @rt_vector_length(i64 %t2367)
  %t2369 = or i64 16, %t2368
  %t2370 = and i64 %t2369, 7
  %t2371 = icmp eq i64 %t2370, 0
  br i1 %t2371, label %fixfast514, label %fixslow515
fixfast514:
  %t2372 = ashr i64 16, 3
  %t2373 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t2372, i64 %t2368)
  %t2374 = extractvalue {i64, i1} %t2373, 0
  %t2375 = extractvalue {i64, i1} %t2373, 1
  br i1 %t2375, label %fixslow515, label %fixmerge516
fixslow515:
  %t2376 = call i64 @rt_mul(i64 16, i64 %t2368)
  br label %fixmerge516
fixmerge516:
  %t2377 = phi i64 [ %t2374, %fixfast514 ], [ %t2376, %fixslow515 ]
  %t2378 = call i64 @rt_make_vector(i64 %t2377, i64 2)
  %t2379 = call ptr @rt_alloc_words(i64 5)
  %t2380 = ptrtoint ptr %t2379 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_462" to i64), ptr %t2379
  %t2381 = or i64 %t2380, 4
  %t2382 = getelementptr i64, ptr %t2379, i64 1
  store i64 %t2367, ptr %t2382
  %t2383 = getelementptr i64, ptr %t2379, i64 2
  store i64 %t2377, ptr %t2383
  %t2384 = getelementptr i64, ptr %t2379, i64 3
  store i64 %t2378, ptr %t2384
  %t2385 = getelementptr i64, ptr %t2379, i64 4
  store i64 %t2381, ptr %t2385
  %t2386 = call fastcc i64 @"scheme.base:code_462"(i64 %t2381, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2387 = load i64, ptr @"scheme.base:%ht-set-buckets!"
  %t2388 = and i64 %t2387, -8
  %t2389 = inttoptr i64 %t2388 to ptr
  %t2390 = load i64, ptr %t2389
  %t2391 = inttoptr i64 %t2390 to ptr
  %t2392 = musttail call fastcc i64 %t2391(i64 %t2387, i64 2, i64 %a0, i64 %t2378, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2392
}

define fastcc i64 @"scheme.base:code:hash-table-size"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2397 = icmp eq i64 %argc, 1
  br i1 %t2397, label %argok518, label %arityerr517
arityerr517:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok518:
  %t2398 = load i64, ptr @"scheme.base:%ht-count"
  %t2399 = and i64 %t2398, -8
  %t2400 = inttoptr i64 %t2399 to ptr
  %t2401 = load i64, ptr %t2400
  %t2402 = inttoptr i64 %t2401 to ptr
  %t2403 = musttail call fastcc i64 %t2402(i64 %t2398, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2403
}

define fastcc i64 @"scheme.base:code:%ht-fold-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2408 = icmp eq i64 %argc, 2
  br i1 %t2408, label %argok520, label %arityerr519
arityerr519:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok520:
  %t2409 = call i64 @rt_null_p(i64 %a0)
  %t2410 = icmp ne i64 %t2409, 1
  br i1 %t2410, label %then521, label %else522
then521:
  ret i64 %a1
else522:
  %t2411 = call i64 @rt_car(i64 %a0)
  %t2412 = call i64 @rt_car(i64 %t2411)
  %t2413 = call i64 @rt_car(i64 %a0)
  %t2414 = call i64 @rt_cdr(i64 %t2413)
  %t2415 = call i64 @rt_cons(i64 %t2412, i64 %t2414)
  %t2416 = call i64 @rt_cdr(i64 %a0)
  %t2417 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  %t2418 = and i64 %t2417, -8
  %t2419 = inttoptr i64 %t2418 to ptr
  %t2420 = load i64, ptr %t2419
  %t2421 = inttoptr i64 %t2420 to ptr
  %t2422 = call fastcc i64%t2421(i64 %t2417, i64 2, i64 %t2416, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2423 = call i64 @rt_cons(i64 %t2415, i64 %t2422)
  ret i64 %t2423
}

define fastcc i64 @"scheme.base:code_481"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2428 = icmp eq i64 %argc, 2
  br i1 %t2428, label %argok524, label %arityerr523
arityerr523:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok524:
  %t2429 = and i64 %self, -8
  %t2430 = inttoptr i64 %t2429 to ptr
  %t2431 = getelementptr i64, ptr %t2430, i64 1
  %t2432 = load i64, ptr %t2431
  %t2433 = call i64 @rt_vector_length(i64 %t2432)
  %t2434 = or i64 %a0, %t2433
  %t2435 = and i64 %t2434, 7
  %t2436 = icmp eq i64 %t2435, 0
  br i1 %t2436, label %fixfast525, label %fixslow526
fixfast525:
  %t2437 = icmp slt i64 %a0, %t2433
  %t2438 = select i1 %t2437, i64 257, i64 1
  br label %fixmerge527
fixslow526:
  %t2439 = call i64 @rt_lt(i64 %a0, i64 %t2433)
  br label %fixmerge527
fixmerge527:
  %t2440 = phi i64 [ %t2438, %fixfast525 ], [ %t2439, %fixslow526 ]
  %t2441 = icmp ne i64 %t2440, 1
  br i1 %t2441, label %then528, label %else529
then528:
  %t2442 = or i64 %a0, 8
  %t2443 = and i64 %t2442, 7
  %t2444 = icmp eq i64 %t2443, 0
  br i1 %t2444, label %fixfast530, label %fixslow531
fixfast530:
  %t2445 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t2446 = extractvalue {i64, i1} %t2445, 0
  %t2447 = extractvalue {i64, i1} %t2445, 1
  br i1 %t2447, label %fixslow531, label %fixmerge532
fixslow531:
  %t2448 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge532
fixmerge532:
  %t2449 = phi i64 [ %t2446, %fixfast530 ], [ %t2448, %fixslow531 ]
  %t2450 = and i64 %self, -8
  %t2451 = inttoptr i64 %t2450 to ptr
  %t2452 = getelementptr i64, ptr %t2451, i64 1
  %t2453 = load i64, ptr %t2452
  %t2454 = call i64 @rt_vector_ref(i64 %t2453, i64 %a0)
  %t2455 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  %t2456 = and i64 %t2455, -8
  %t2457 = inttoptr i64 %t2456 to ptr
  %t2458 = load i64, ptr %t2457
  %t2459 = inttoptr i64 %t2458 to ptr
  %t2460 = call fastcc i64%t2459(i64 %t2455, i64 2, i64 %t2454, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2461 = musttail call fastcc i64 @"scheme.base:code_481"(i64 %self, i64 2, i64 %t2449, i64 %t2460, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2461
else529:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:hash-table->alist"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2462 = icmp eq i64 %argc, 1
  br i1 %t2462, label %argok534, label %arityerr533
arityerr533:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok534:
  %t2463 = load i64, ptr @"scheme.base:%ht-buckets"
  %t2464 = and i64 %t2463, -8
  %t2465 = inttoptr i64 %t2464 to ptr
  %t2466 = load i64, ptr %t2465
  %t2467 = inttoptr i64 %t2466 to ptr
  %t2468 = call fastcc i64%t2467(i64 %t2463, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2469 = call ptr @rt_alloc_words(i64 3)
  %t2470 = ptrtoint ptr %t2469 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_481" to i64), ptr %t2469
  %t2471 = or i64 %t2470, 4
  %t2472 = getelementptr i64, ptr %t2469, i64 1
  store i64 %t2468, ptr %t2472
  %t2473 = getelementptr i64, ptr %t2469, i64 2
  store i64 %t2471, ptr %t2473
  %t2474 = musttail call fastcc i64 @"scheme.base:code_481"(i64 %t2471, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2474
}

define fastcc i64 @"scheme.base:code_486"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2479 = icmp eq i64 %argc, 1
  br i1 %t2479, label %argok536, label %arityerr535
arityerr535:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok536:
  %t2480 = call i64 @rt_car(i64 %a0)
  ret i64 %t2480
}

define fastcc i64 @"scheme.base:code:hash-table-keys"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2481 = icmp eq i64 %argc, 1
  br i1 %t2481, label %argok538, label %arityerr537
arityerr537:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok538:
  %t2482 = call ptr @rt_alloc_words(i64 1)
  %t2483 = ptrtoint ptr %t2482 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_486" to i64), ptr %t2482
  %t2484 = or i64 %t2483, 4
  %t2485 = load i64, ptr @"scheme.base:hash-table->alist"
  %t2486 = and i64 %t2485, -8
  %t2487 = inttoptr i64 %t2486 to ptr
  %t2488 = load i64, ptr %t2487
  %t2489 = inttoptr i64 %t2488 to ptr
  %t2490 = call fastcc i64%t2489(i64 %t2485, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2491 = load i64, ptr @"scheme.base:map"
  %t2492 = and i64 %t2491, -8
  %t2493 = inttoptr i64 %t2492 to ptr
  %t2494 = load i64, ptr %t2493
  %t2495 = inttoptr i64 %t2494 to ptr
  %t2496 = musttail call fastcc i64 %t2495(i64 %t2491, i64 2, i64 %t2484, i64 %t2490, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2496
}

define fastcc i64 @"scheme.base:code_491"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2501 = icmp eq i64 %argc, 1
  br i1 %t2501, label %argok540, label %arityerr539
arityerr539:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok540:
  %t2502 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t2502
}

define fastcc i64 @"scheme.base:code:hash-table-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2503 = icmp eq i64 %argc, 1
  br i1 %t2503, label %argok542, label %arityerr541
arityerr541:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok542:
  %t2504 = call ptr @rt_alloc_words(i64 1)
  %t2505 = ptrtoint ptr %t2504 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_491" to i64), ptr %t2504
  %t2506 = or i64 %t2505, 4
  %t2507 = load i64, ptr @"scheme.base:hash-table->alist"
  %t2508 = and i64 %t2507, -8
  %t2509 = inttoptr i64 %t2508 to ptr
  %t2510 = load i64, ptr %t2509
  %t2511 = inttoptr i64 %t2510 to ptr
  %t2512 = call fastcc i64%t2511(i64 %t2507, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2513 = load i64, ptr @"scheme.base:map"
  %t2514 = and i64 %t2513, -8
  %t2515 = inttoptr i64 %t2514 to ptr
  %t2516 = load i64, ptr %t2515
  %t2517 = inttoptr i64 %t2516 to ptr
  %t2518 = musttail call fastcc i64 %t2517(i64 %t2513, i64 2, i64 %t2506, i64 %t2512, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2518
}

define fastcc i64 @"scheme.base:code:rd-ws?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2523 = icmp eq i64 %argc, 1
  br i1 %t2523, label %argok544, label %arityerr543
arityerr543:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok544:
  %t2524 = call i64 @rt_char_to_integer(i64 %a0)
  %t2525 = or i64 %t2524, 256
  %t2526 = and i64 %t2525, 7
  %t2527 = icmp eq i64 %t2526, 0
  br i1 %t2527, label %fixfast545, label %fixslow546
fixfast545:
  %t2528 = icmp eq i64 %t2524, 256
  %t2529 = select i1 %t2528, i64 257, i64 1
  br label %fixmerge547
fixslow546:
  %t2530 = call i64 @rt_num_eq(i64 %t2524, i64 256)
  br label %fixmerge547
fixmerge547:
  %t2531 = phi i64 [ %t2529, %fixfast545 ], [ %t2530, %fixslow546 ]
  %t2532 = icmp ne i64 %t2531, 1
  br i1 %t2532, label %then548, label %else549
then548:
  ret i64 %t2531
else549:
  %t2533 = or i64 %t2524, 72
  %t2534 = and i64 %t2533, 7
  %t2535 = icmp eq i64 %t2534, 0
  br i1 %t2535, label %fixfast550, label %fixslow551
fixfast550:
  %t2536 = icmp eq i64 %t2524, 72
  %t2537 = select i1 %t2536, i64 257, i64 1
  br label %fixmerge552
fixslow551:
  %t2538 = call i64 @rt_num_eq(i64 %t2524, i64 72)
  br label %fixmerge552
fixmerge552:
  %t2539 = phi i64 [ %t2537, %fixfast550 ], [ %t2538, %fixslow551 ]
  %t2540 = icmp ne i64 %t2539, 1
  br i1 %t2540, label %then553, label %else554
then553:
  ret i64 %t2539
else554:
  %t2541 = or i64 %t2524, 80
  %t2542 = and i64 %t2541, 7
  %t2543 = icmp eq i64 %t2542, 0
  br i1 %t2543, label %fixfast555, label %fixslow556
fixfast555:
  %t2544 = icmp eq i64 %t2524, 80
  %t2545 = select i1 %t2544, i64 257, i64 1
  br label %fixmerge557
fixslow556:
  %t2546 = call i64 @rt_num_eq(i64 %t2524, i64 80)
  br label %fixmerge557
fixmerge557:
  %t2547 = phi i64 [ %t2545, %fixfast555 ], [ %t2546, %fixslow556 ]
  %t2548 = icmp ne i64 %t2547, 1
  br i1 %t2548, label %then558, label %else559
then558:
  ret i64 %t2547
else559:
  %t2549 = or i64 %t2524, 104
  %t2550 = and i64 %t2549, 7
  %t2551 = icmp eq i64 %t2550, 0
  br i1 %t2551, label %fixfast560, label %fixslow561
fixfast560:
  %t2552 = icmp eq i64 %t2524, 104
  %t2553 = select i1 %t2552, i64 257, i64 1
  br label %fixmerge562
fixslow561:
  %t2554 = call i64 @rt_num_eq(i64 %t2524, i64 104)
  br label %fixmerge562
fixmerge562:
  %t2555 = phi i64 [ %t2553, %fixfast560 ], [ %t2554, %fixslow561 ]
  ret i64 %t2555
}

define fastcc i64 @"scheme.base:code:rd-digit?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2560 = icmp eq i64 %argc, 1
  br i1 %t2560, label %argok564, label %arityerr563
arityerr563:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok564:
  %t2561 = call i64 @rt_char_to_integer(i64 %a0)
  %t2562 = or i64 376, %t2561
  %t2563 = and i64 %t2562, 7
  %t2564 = icmp eq i64 %t2563, 0
  br i1 %t2564, label %fixfast565, label %fixslow566
fixfast565:
  %t2565 = icmp slt i64 376, %t2561
  %t2566 = select i1 %t2565, i64 257, i64 1
  br label %fixmerge567
fixslow566:
  %t2567 = call i64 @rt_lt(i64 376, i64 %t2561)
  br label %fixmerge567
fixmerge567:
  %t2568 = phi i64 [ %t2566, %fixfast565 ], [ %t2567, %fixslow566 ]
  %t2569 = icmp ne i64 %t2568, 1
  br i1 %t2569, label %then568, label %else569
then568:
  %t2570 = or i64 %t2561, 464
  %t2571 = and i64 %t2570, 7
  %t2572 = icmp eq i64 %t2571, 0
  br i1 %t2572, label %fixfast570, label %fixslow571
fixfast570:
  %t2573 = icmp slt i64 %t2561, 464
  %t2574 = select i1 %t2573, i64 257, i64 1
  br label %fixmerge572
fixslow571:
  %t2575 = call i64 @rt_lt(i64 %t2561, i64 464)
  br label %fixmerge572
fixmerge572:
  %t2576 = phi i64 [ %t2574, %fixfast570 ], [ %t2575, %fixslow571 ]
  ret i64 %t2576
else569:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rd-delim?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2581 = icmp eq i64 %argc, 1
  br i1 %t2581, label %argok574, label %arityerr573
arityerr573:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok574:
  %t2582 = call i64 @rt_char_to_integer(i64 %a0)
  %t2583 = load i64, ptr @"scheme.base:rd-ws?"
  %t2584 = and i64 %t2583, -8
  %t2585 = inttoptr i64 %t2584 to ptr
  %t2586 = load i64, ptr %t2585
  %t2587 = inttoptr i64 %t2586 to ptr
  %t2588 = call fastcc i64%t2587(i64 %t2583, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2589 = icmp ne i64 %t2588, 1
  br i1 %t2589, label %then575, label %else576
then575:
  ret i64 %t2588
else576:
  %t2590 = or i64 %t2582, 320
  %t2591 = and i64 %t2590, 7
  %t2592 = icmp eq i64 %t2591, 0
  br i1 %t2592, label %fixfast577, label %fixslow578
fixfast577:
  %t2593 = icmp eq i64 %t2582, 320
  %t2594 = select i1 %t2593, i64 257, i64 1
  br label %fixmerge579
fixslow578:
  %t2595 = call i64 @rt_num_eq(i64 %t2582, i64 320)
  br label %fixmerge579
fixmerge579:
  %t2596 = phi i64 [ %t2594, %fixfast577 ], [ %t2595, %fixslow578 ]
  %t2597 = icmp ne i64 %t2596, 1
  br i1 %t2597, label %then580, label %else581
then580:
  ret i64 %t2596
else581:
  %t2598 = or i64 %t2582, 328
  %t2599 = and i64 %t2598, 7
  %t2600 = icmp eq i64 %t2599, 0
  br i1 %t2600, label %fixfast582, label %fixslow583
fixfast582:
  %t2601 = icmp eq i64 %t2582, 328
  %t2602 = select i1 %t2601, i64 257, i64 1
  br label %fixmerge584
fixslow583:
  %t2603 = call i64 @rt_num_eq(i64 %t2582, i64 328)
  br label %fixmerge584
fixmerge584:
  %t2604 = phi i64 [ %t2602, %fixfast582 ], [ %t2603, %fixslow583 ]
  %t2605 = icmp ne i64 %t2604, 1
  br i1 %t2605, label %then585, label %else586
then585:
  ret i64 %t2604
else586:
  %t2606 = or i64 %t2582, 728
  %t2607 = and i64 %t2606, 7
  %t2608 = icmp eq i64 %t2607, 0
  br i1 %t2608, label %fixfast587, label %fixslow588
fixfast587:
  %t2609 = icmp eq i64 %t2582, 728
  %t2610 = select i1 %t2609, i64 257, i64 1
  br label %fixmerge589
fixslow588:
  %t2611 = call i64 @rt_num_eq(i64 %t2582, i64 728)
  br label %fixmerge589
fixmerge589:
  %t2612 = phi i64 [ %t2610, %fixfast587 ], [ %t2611, %fixslow588 ]
  %t2613 = icmp ne i64 %t2612, 1
  br i1 %t2613, label %then590, label %else591
then590:
  ret i64 %t2612
else591:
  %t2614 = or i64 %t2582, 744
  %t2615 = and i64 %t2614, 7
  %t2616 = icmp eq i64 %t2615, 0
  br i1 %t2616, label %fixfast592, label %fixslow593
fixfast592:
  %t2617 = icmp eq i64 %t2582, 744
  %t2618 = select i1 %t2617, i64 257, i64 1
  br label %fixmerge594
fixslow593:
  %t2619 = call i64 @rt_num_eq(i64 %t2582, i64 744)
  br label %fixmerge594
fixmerge594:
  %t2620 = phi i64 [ %t2618, %fixfast592 ], [ %t2619, %fixslow593 ]
  %t2621 = icmp ne i64 %t2620, 1
  br i1 %t2621, label %then595, label %else596
then595:
  ret i64 %t2620
else596:
  %t2622 = or i64 %t2582, 272
  %t2623 = and i64 %t2622, 7
  %t2624 = icmp eq i64 %t2623, 0
  br i1 %t2624, label %fixfast597, label %fixslow598
fixfast597:
  %t2625 = icmp eq i64 %t2582, 272
  %t2626 = select i1 %t2625, i64 257, i64 1
  br label %fixmerge599
fixslow598:
  %t2627 = call i64 @rt_num_eq(i64 %t2582, i64 272)
  br label %fixmerge599
fixmerge599:
  %t2628 = phi i64 [ %t2626, %fixfast597 ], [ %t2627, %fixslow598 ]
  %t2629 = icmp ne i64 %t2628, 1
  br i1 %t2629, label %then600, label %else601
then600:
  ret i64 %t2628
else601:
  %t2630 = or i64 %t2582, 472
  %t2631 = and i64 %t2630, 7
  %t2632 = icmp eq i64 %t2631, 0
  br i1 %t2632, label %fixfast602, label %fixslow603
fixfast602:
  %t2633 = icmp eq i64 %t2582, 472
  %t2634 = select i1 %t2633, i64 257, i64 1
  br label %fixmerge604
fixslow603:
  %t2635 = call i64 @rt_num_eq(i64 %t2582, i64 472)
  br label %fixmerge604
fixmerge604:
  %t2636 = phi i64 [ %t2634, %fixfast602 ], [ %t2635, %fixslow603 ]
  ret i64 %t2636
}

define fastcc i64 @"scheme.base:code:rd-skip-line"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2641 = icmp eq i64 %argc, 3
  br i1 %t2641, label %argok606, label %arityerr605
arityerr605:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok606:
  %t2642 = or i64 %a2, %a1
  %t2643 = and i64 %t2642, 7
  %t2644 = icmp eq i64 %t2643, 0
  br i1 %t2644, label %fixfast607, label %fixslow608
fixfast607:
  %t2645 = icmp slt i64 %a2, %a1
  %t2646 = select i1 %t2645, i64 257, i64 1
  br label %fixmerge609
fixslow608:
  %t2647 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge609
fixmerge609:
  %t2648 = phi i64 [ %t2646, %fixfast607 ], [ %t2647, %fixslow608 ]
  %t2649 = icmp ne i64 %t2648, 1
  br i1 %t2649, label %then610, label %else611
then610:
  %t2650 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2651 = call i64 @rt_char_to_integer(i64 %t2650)
  %t2652 = or i64 %t2651, 80
  %t2653 = and i64 %t2652, 7
  %t2654 = icmp eq i64 %t2653, 0
  br i1 %t2654, label %fixfast612, label %fixslow613
fixfast612:
  %t2655 = icmp eq i64 %t2651, 80
  %t2656 = select i1 %t2655, i64 257, i64 1
  br label %fixmerge614
fixslow613:
  %t2657 = call i64 @rt_num_eq(i64 %t2651, i64 80)
  br label %fixmerge614
fixmerge614:
  %t2658 = phi i64 [ %t2656, %fixfast612 ], [ %t2657, %fixslow613 ]
  %t2659 = icmp ne i64 %t2658, 1
  br i1 %t2659, label %then615, label %else616
then615:
  %t2660 = or i64 %a2, 8
  %t2661 = and i64 %t2660, 7
  %t2662 = icmp eq i64 %t2661, 0
  br i1 %t2662, label %fixfast617, label %fixslow618
fixfast617:
  %t2663 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2664 = extractvalue {i64, i1} %t2663, 0
  %t2665 = extractvalue {i64, i1} %t2663, 1
  br i1 %t2665, label %fixslow618, label %fixmerge619
fixslow618:
  %t2666 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge619
fixmerge619:
  %t2667 = phi i64 [ %t2664, %fixfast617 ], [ %t2666, %fixslow618 ]
  ret i64 %t2667
else616:
  %t2668 = or i64 %a2, 8
  %t2669 = and i64 %t2668, 7
  %t2670 = icmp eq i64 %t2669, 0
  br i1 %t2670, label %fixfast620, label %fixslow621
fixfast620:
  %t2671 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2672 = extractvalue {i64, i1} %t2671, 0
  %t2673 = extractvalue {i64, i1} %t2671, 1
  br i1 %t2673, label %fixslow621, label %fixmerge622
fixslow621:
  %t2674 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge622
fixmerge622:
  %t2675 = phi i64 [ %t2672, %fixfast620 ], [ %t2674, %fixslow621 ]
  %t2676 = load i64, ptr @"scheme.base:rd-skip-line"
  %t2677 = and i64 %t2676, -8
  %t2678 = inttoptr i64 %t2677 to ptr
  %t2679 = load i64, ptr %t2678
  %t2680 = inttoptr i64 %t2679 to ptr
  %t2681 = musttail call fastcc i64 %t2680(i64 %t2676, i64 3, i64 %a0, i64 %a1, i64 %t2675, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2681
else611:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:rd-skip-ws"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2686 = icmp eq i64 %argc, 3
  br i1 %t2686, label %argok624, label %arityerr623
arityerr623:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok624:
  %t2687 = or i64 %a2, %a1
  %t2688 = and i64 %t2687, 7
  %t2689 = icmp eq i64 %t2688, 0
  br i1 %t2689, label %fixfast625, label %fixslow626
fixfast625:
  %t2690 = icmp slt i64 %a2, %a1
  %t2691 = select i1 %t2690, i64 257, i64 1
  br label %fixmerge627
fixslow626:
  %t2692 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge627
fixmerge627:
  %t2693 = phi i64 [ %t2691, %fixfast625 ], [ %t2692, %fixslow626 ]
  %t2694 = icmp ne i64 %t2693, 1
  br i1 %t2694, label %then628, label %else629
then628:
  %t2695 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2696 = load i64, ptr @"scheme.base:rd-ws?"
  %t2697 = and i64 %t2696, -8
  %t2698 = inttoptr i64 %t2697 to ptr
  %t2699 = load i64, ptr %t2698
  %t2700 = inttoptr i64 %t2699 to ptr
  %t2701 = call fastcc i64%t2700(i64 %t2696, i64 1, i64 %t2695, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2702 = icmp ne i64 %t2701, 1
  br i1 %t2702, label %then630, label %else631
then630:
  %t2703 = or i64 %a2, 8
  %t2704 = and i64 %t2703, 7
  %t2705 = icmp eq i64 %t2704, 0
  br i1 %t2705, label %fixfast632, label %fixslow633
fixfast632:
  %t2706 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2707 = extractvalue {i64, i1} %t2706, 0
  %t2708 = extractvalue {i64, i1} %t2706, 1
  br i1 %t2708, label %fixslow633, label %fixmerge634
fixslow633:
  %t2709 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge634
fixmerge634:
  %t2710 = phi i64 [ %t2707, %fixfast632 ], [ %t2709, %fixslow633 ]
  %t2711 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t2712 = and i64 %t2711, -8
  %t2713 = inttoptr i64 %t2712 to ptr
  %t2714 = load i64, ptr %t2713
  %t2715 = inttoptr i64 %t2714 to ptr
  %t2716 = musttail call fastcc i64 %t2715(i64 %t2711, i64 3, i64 %a0, i64 %a1, i64 %t2710, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2716
else631:
  %t2717 = call i64 @rt_char_to_integer(i64 %t2695)
  %t2718 = or i64 %t2717, 472
  %t2719 = and i64 %t2718, 7
  %t2720 = icmp eq i64 %t2719, 0
  br i1 %t2720, label %fixfast635, label %fixslow636
fixfast635:
  %t2721 = icmp eq i64 %t2717, 472
  %t2722 = select i1 %t2721, i64 257, i64 1
  br label %fixmerge637
fixslow636:
  %t2723 = call i64 @rt_num_eq(i64 %t2717, i64 472)
  br label %fixmerge637
fixmerge637:
  %t2724 = phi i64 [ %t2722, %fixfast635 ], [ %t2723, %fixslow636 ]
  %t2725 = icmp ne i64 %t2724, 1
  br i1 %t2725, label %then638, label %else639
then638:
  %t2726 = or i64 %a2, 8
  %t2727 = and i64 %t2726, 7
  %t2728 = icmp eq i64 %t2727, 0
  br i1 %t2728, label %fixfast640, label %fixslow641
fixfast640:
  %t2729 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2730 = extractvalue {i64, i1} %t2729, 0
  %t2731 = extractvalue {i64, i1} %t2729, 1
  br i1 %t2731, label %fixslow641, label %fixmerge642
fixslow641:
  %t2732 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge642
fixmerge642:
  %t2733 = phi i64 [ %t2730, %fixfast640 ], [ %t2732, %fixslow641 ]
  %t2734 = load i64, ptr @"scheme.base:rd-skip-line"
  %t2735 = and i64 %t2734, -8
  %t2736 = inttoptr i64 %t2735 to ptr
  %t2737 = load i64, ptr %t2736
  %t2738 = inttoptr i64 %t2737 to ptr
  %t2739 = call fastcc i64%t2738(i64 %t2734, i64 3, i64 %a0, i64 %a1, i64 %t2733, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2740 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t2741 = and i64 %t2740, -8
  %t2742 = inttoptr i64 %t2741 to ptr
  %t2743 = load i64, ptr %t2742
  %t2744 = inttoptr i64 %t2743 to ptr
  %t2745 = musttail call fastcc i64 %t2744(i64 %t2740, i64 3, i64 %a0, i64 %a1, i64 %t2739, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2745
else639:
  ret i64 %a2
else629:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:rd-token-end"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2750 = icmp eq i64 %argc, 3
  br i1 %t2750, label %argok644, label %arityerr643
arityerr643:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok644:
  %t2751 = or i64 %a2, %a1
  %t2752 = and i64 %t2751, 7
  %t2753 = icmp eq i64 %t2752, 0
  br i1 %t2753, label %fixfast645, label %fixslow646
fixfast645:
  %t2754 = icmp slt i64 %a2, %a1
  %t2755 = select i1 %t2754, i64 257, i64 1
  br label %fixmerge647
fixslow646:
  %t2756 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge647
fixmerge647:
  %t2757 = phi i64 [ %t2755, %fixfast645 ], [ %t2756, %fixslow646 ]
  %t2758 = icmp ne i64 %t2757, 1
  br i1 %t2758, label %then648, label %else649
then648:
  %t2759 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2760 = load i64, ptr @"scheme.base:rd-delim?"
  %t2761 = and i64 %t2760, -8
  %t2762 = inttoptr i64 %t2761 to ptr
  %t2763 = load i64, ptr %t2762
  %t2764 = inttoptr i64 %t2763 to ptr
  %t2765 = call fastcc i64%t2764(i64 %t2760, i64 1, i64 %t2759, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2766 = icmp ne i64 %t2765, 1
  br i1 %t2766, label %then650, label %else651
then650:
  ret i64 %a2
else651:
  %t2767 = or i64 %a2, 8
  %t2768 = and i64 %t2767, 7
  %t2769 = icmp eq i64 %t2768, 0
  br i1 %t2769, label %fixfast652, label %fixslow653
fixfast652:
  %t2770 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2771 = extractvalue {i64, i1} %t2770, 0
  %t2772 = extractvalue {i64, i1} %t2770, 1
  br i1 %t2772, label %fixslow653, label %fixmerge654
fixslow653:
  %t2773 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge654
fixmerge654:
  %t2774 = phi i64 [ %t2771, %fixfast652 ], [ %t2773, %fixslow653 ]
  %t2775 = load i64, ptr @"scheme.base:rd-token-end"
  %t2776 = and i64 %t2775, -8
  %t2777 = inttoptr i64 %t2776 to ptr
  %t2778 = load i64, ptr %t2777
  %t2779 = inttoptr i64 %t2778 to ptr
  %t2780 = musttail call fastcc i64 %t2779(i64 %t2775, i64 3, i64 %a0, i64 %a1, i64 %t2774, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2780
else649:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:rd-all-digits?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2785 = icmp eq i64 %argc, 3
  br i1 %t2785, label %argok656, label %arityerr655
arityerr655:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok656:
  %t2786 = or i64 %a1, %a2
  %t2787 = and i64 %t2786, 7
  %t2788 = icmp eq i64 %t2787, 0
  br i1 %t2788, label %fixfast657, label %fixslow658
fixfast657:
  %t2789 = icmp slt i64 %a1, %a2
  %t2790 = select i1 %t2789, i64 257, i64 1
  br label %fixmerge659
fixslow658:
  %t2791 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge659
fixmerge659:
  %t2792 = phi i64 [ %t2790, %fixfast657 ], [ %t2791, %fixslow658 ]
  %t2793 = icmp ne i64 %t2792, 1
  br i1 %t2793, label %then660, label %else661
then660:
  %t2794 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t2795 = load i64, ptr @"scheme.base:rd-digit?"
  %t2796 = and i64 %t2795, -8
  %t2797 = inttoptr i64 %t2796 to ptr
  %t2798 = load i64, ptr %t2797
  %t2799 = inttoptr i64 %t2798 to ptr
  %t2800 = call fastcc i64%t2799(i64 %t2795, i64 1, i64 %t2794, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2801 = icmp ne i64 %t2800, 1
  br i1 %t2801, label %then662, label %else663
then662:
  %t2802 = or i64 %a1, 8
  %t2803 = and i64 %t2802, 7
  %t2804 = icmp eq i64 %t2803, 0
  br i1 %t2804, label %fixfast664, label %fixslow665
fixfast664:
  %t2805 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t2806 = extractvalue {i64, i1} %t2805, 0
  %t2807 = extractvalue {i64, i1} %t2805, 1
  br i1 %t2807, label %fixslow665, label %fixmerge666
fixslow665:
  %t2808 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge666
fixmerge666:
  %t2809 = phi i64 [ %t2806, %fixfast664 ], [ %t2808, %fixslow665 ]
  %t2810 = load i64, ptr @"scheme.base:rd-all-digits?"
  %t2811 = and i64 %t2810, -8
  %t2812 = inttoptr i64 %t2811 to ptr
  %t2813 = load i64, ptr %t2812
  %t2814 = inttoptr i64 %t2813 to ptr
  %t2815 = musttail call fastcc i64 %t2814(i64 %t2810, i64 3, i64 %a0, i64 %t2809, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2815
else663:
  ret i64 1
else661:
  ret i64 257
}

define fastcc i64 @"scheme.base:code:rd-numeric?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2820 = icmp eq i64 %argc, 1
  br i1 %t2820, label %argok668, label %arityerr667
arityerr667:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok668:
  %t2821 = call i64 @rt_string_length(i64 %a0)
  %t2822 = or i64 0, %t2821
  %t2823 = and i64 %t2822, 7
  %t2824 = icmp eq i64 %t2823, 0
  br i1 %t2824, label %fixfast669, label %fixslow670
fixfast669:
  %t2825 = icmp slt i64 0, %t2821
  %t2826 = select i1 %t2825, i64 257, i64 1
  br label %fixmerge671
fixslow670:
  %t2827 = call i64 @rt_lt(i64 0, i64 %t2821)
  br label %fixmerge671
fixmerge671:
  %t2828 = phi i64 [ %t2826, %fixfast669 ], [ %t2827, %fixslow670 ]
  %t2829 = icmp ne i64 %t2828, 1
  br i1 %t2829, label %then672, label %else673
then672:
  %t2830 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t2831 = call i64 @rt_char_to_integer(i64 %t2830)
  %t2832 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t2833 = load i64, ptr @"scheme.base:rd-digit?"
  %t2834 = and i64 %t2833, -8
  %t2835 = inttoptr i64 %t2834 to ptr
  %t2836 = load i64, ptr %t2835
  %t2837 = inttoptr i64 %t2836 to ptr
  %t2838 = call fastcc i64%t2837(i64 %t2833, i64 1, i64 %t2832, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2839 = icmp ne i64 %t2838, 1
  br i1 %t2839, label %then674, label %else675
then674:
  %t2840 = load i64, ptr @"scheme.base:rd-all-digits?"
  %t2841 = and i64 %t2840, -8
  %t2842 = inttoptr i64 %t2841 to ptr
  %t2843 = load i64, ptr %t2842
  %t2844 = inttoptr i64 %t2843 to ptr
  %t2845 = musttail call fastcc i64 %t2844(i64 %t2840, i64 3, i64 %a0, i64 0, i64 %t2821, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2845
else675:
  %t2846 = or i64 %t2831, 360
  %t2847 = and i64 %t2846, 7
  %t2848 = icmp eq i64 %t2847, 0
  br i1 %t2848, label %fixfast676, label %fixslow677
fixfast676:
  %t2849 = icmp eq i64 %t2831, 360
  %t2850 = select i1 %t2849, i64 257, i64 1
  br label %fixmerge678
fixslow677:
  %t2851 = call i64 @rt_num_eq(i64 %t2831, i64 360)
  br label %fixmerge678
fixmerge678:
  %t2852 = phi i64 [ %t2850, %fixfast676 ], [ %t2851, %fixslow677 ]
  %t2853 = icmp ne i64 %t2852, 1
  br i1 %t2853, label %then679, label %else680
then679:
  br label %merge681
else680:
  %t2854 = or i64 %t2831, 344
  %t2855 = and i64 %t2854, 7
  %t2856 = icmp eq i64 %t2855, 0
  br i1 %t2856, label %fixfast682, label %fixslow683
fixfast682:
  %t2857 = icmp eq i64 %t2831, 344
  %t2858 = select i1 %t2857, i64 257, i64 1
  br label %fixmerge684
fixslow683:
  %t2859 = call i64 @rt_num_eq(i64 %t2831, i64 344)
  br label %fixmerge684
fixmerge684:
  %t2860 = phi i64 [ %t2858, %fixfast682 ], [ %t2859, %fixslow683 ]
  br label %merge681
merge681:
  %t2861 = phi i64 [ %t2852, %then679 ], [ %t2860, %fixmerge684 ]
  %t2862 = icmp ne i64 %t2861, 1
  br i1 %t2862, label %then685, label %else686
then685:
  %t2863 = or i64 8, %t2821
  %t2864 = and i64 %t2863, 7
  %t2865 = icmp eq i64 %t2864, 0
  br i1 %t2865, label %fixfast687, label %fixslow688
fixfast687:
  %t2866 = icmp slt i64 8, %t2821
  %t2867 = select i1 %t2866, i64 257, i64 1
  br label %fixmerge689
fixslow688:
  %t2868 = call i64 @rt_lt(i64 8, i64 %t2821)
  br label %fixmerge689
fixmerge689:
  %t2869 = phi i64 [ %t2867, %fixfast687 ], [ %t2868, %fixslow688 ]
  %t2870 = icmp ne i64 %t2869, 1
  br i1 %t2870, label %then690, label %else691
then690:
  %t2871 = load i64, ptr @"scheme.base:rd-all-digits?"
  %t2872 = and i64 %t2871, -8
  %t2873 = inttoptr i64 %t2872 to ptr
  %t2874 = load i64, ptr %t2873
  %t2875 = inttoptr i64 %t2874 to ptr
  %t2876 = musttail call fastcc i64 %t2875(i64 %t2871, i64 3, i64 %a0, i64 8, i64 %t2821, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2876
else691:
  ret i64 1
else686:
  ret i64 1
else673:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rd-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2881 = icmp eq i64 %argc, 4
  br i1 %t2881, label %argok693, label %arityerr692
arityerr692:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok693:
  %t2882 = or i64 %a1, %a2
  %t2883 = and i64 %t2882, 7
  %t2884 = icmp eq i64 %t2883, 0
  br i1 %t2884, label %fixfast694, label %fixslow695
fixfast694:
  %t2885 = icmp slt i64 %a1, %a2
  %t2886 = select i1 %t2885, i64 257, i64 1
  br label %fixmerge696
fixslow695:
  %t2887 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge696
fixmerge696:
  %t2888 = phi i64 [ %t2886, %fixfast694 ], [ %t2887, %fixslow695 ]
  %t2889 = icmp ne i64 %t2888, 1
  br i1 %t2889, label %then697, label %else698
then697:
  %t2890 = or i64 %a1, 8
  %t2891 = and i64 %t2890, 7
  %t2892 = icmp eq i64 %t2891, 0
  br i1 %t2892, label %fixfast699, label %fixslow700
fixfast699:
  %t2893 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t2894 = extractvalue {i64, i1} %t2893, 0
  %t2895 = extractvalue {i64, i1} %t2893, 1
  br i1 %t2895, label %fixslow700, label %fixmerge701
fixslow700:
  %t2896 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge701
fixmerge701:
  %t2897 = phi i64 [ %t2894, %fixfast699 ], [ %t2896, %fixslow700 ]
  %t2898 = or i64 %a3, 80
  %t2899 = and i64 %t2898, 7
  %t2900 = icmp eq i64 %t2899, 0
  br i1 %t2900, label %fixfast702, label %fixslow703
fixfast702:
  %t2901 = ashr i64 %a3, 3
  %t2902 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t2901, i64 80)
  %t2903 = extractvalue {i64, i1} %t2902, 0
  %t2904 = extractvalue {i64, i1} %t2902, 1
  br i1 %t2904, label %fixslow703, label %fixmerge704
fixslow703:
  %t2905 = call i64 @rt_mul(i64 %a3, i64 80)
  br label %fixmerge704
fixmerge704:
  %t2906 = phi i64 [ %t2903, %fixfast702 ], [ %t2905, %fixslow703 ]
  %t2907 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t2908 = call i64 @rt_char_to_integer(i64 %t2907)
  %t2909 = or i64 %t2908, 384
  %t2910 = and i64 %t2909, 7
  %t2911 = icmp eq i64 %t2910, 0
  br i1 %t2911, label %fixfast705, label %fixslow706
fixfast705:
  %t2912 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t2908, i64 384)
  %t2913 = extractvalue {i64, i1} %t2912, 0
  %t2914 = extractvalue {i64, i1} %t2912, 1
  br i1 %t2914, label %fixslow706, label %fixmerge707
fixslow706:
  %t2915 = call i64 @rt_sub(i64 %t2908, i64 384)
  br label %fixmerge707
fixmerge707:
  %t2916 = phi i64 [ %t2913, %fixfast705 ], [ %t2915, %fixslow706 ]
  %t2917 = or i64 %t2906, %t2916
  %t2918 = and i64 %t2917, 7
  %t2919 = icmp eq i64 %t2918, 0
  br i1 %t2919, label %fixfast708, label %fixslow709
fixfast708:
  %t2920 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t2906, i64 %t2916)
  %t2921 = extractvalue {i64, i1} %t2920, 0
  %t2922 = extractvalue {i64, i1} %t2920, 1
  br i1 %t2922, label %fixslow709, label %fixmerge710
fixslow709:
  %t2923 = call i64 @rt_add(i64 %t2906, i64 %t2916)
  br label %fixmerge710
fixmerge710:
  %t2924 = phi i64 [ %t2921, %fixfast708 ], [ %t2923, %fixslow709 ]
  %t2925 = load i64, ptr @"scheme.base:rd-digits"
  %t2926 = and i64 %t2925, -8
  %t2927 = inttoptr i64 %t2926 to ptr
  %t2928 = load i64, ptr %t2927
  %t2929 = inttoptr i64 %t2928 to ptr
  %t2930 = musttail call fastcc i64 %t2929(i64 %t2925, i64 4, i64 %a0, i64 %t2897, i64 %a2, i64 %t2924, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2930
else698:
  ret i64 %a3
}

define fastcc i64 @"scheme.base:code:rd-digits-neg"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2935 = icmp eq i64 %argc, 4
  br i1 %t2935, label %argok712, label %arityerr711
arityerr711:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok712:
  %t2936 = or i64 %a1, %a2
  %t2937 = and i64 %t2936, 7
  %t2938 = icmp eq i64 %t2937, 0
  br i1 %t2938, label %fixfast713, label %fixslow714
fixfast713:
  %t2939 = icmp slt i64 %a1, %a2
  %t2940 = select i1 %t2939, i64 257, i64 1
  br label %fixmerge715
fixslow714:
  %t2941 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge715
fixmerge715:
  %t2942 = phi i64 [ %t2940, %fixfast713 ], [ %t2941, %fixslow714 ]
  %t2943 = icmp ne i64 %t2942, 1
  br i1 %t2943, label %then716, label %else717
then716:
  %t2944 = or i64 %a1, 8
  %t2945 = and i64 %t2944, 7
  %t2946 = icmp eq i64 %t2945, 0
  br i1 %t2946, label %fixfast718, label %fixslow719
fixfast718:
  %t2947 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t2948 = extractvalue {i64, i1} %t2947, 0
  %t2949 = extractvalue {i64, i1} %t2947, 1
  br i1 %t2949, label %fixslow719, label %fixmerge720
fixslow719:
  %t2950 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge720
fixmerge720:
  %t2951 = phi i64 [ %t2948, %fixfast718 ], [ %t2950, %fixslow719 ]
  %t2952 = or i64 %a3, 80
  %t2953 = and i64 %t2952, 7
  %t2954 = icmp eq i64 %t2953, 0
  br i1 %t2954, label %fixfast721, label %fixslow722
fixfast721:
  %t2955 = ashr i64 %a3, 3
  %t2956 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t2955, i64 80)
  %t2957 = extractvalue {i64, i1} %t2956, 0
  %t2958 = extractvalue {i64, i1} %t2956, 1
  br i1 %t2958, label %fixslow722, label %fixmerge723
fixslow722:
  %t2959 = call i64 @rt_mul(i64 %a3, i64 80)
  br label %fixmerge723
fixmerge723:
  %t2960 = phi i64 [ %t2957, %fixfast721 ], [ %t2959, %fixslow722 ]
  %t2961 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t2962 = call i64 @rt_char_to_integer(i64 %t2961)
  %t2963 = or i64 %t2962, 384
  %t2964 = and i64 %t2963, 7
  %t2965 = icmp eq i64 %t2964, 0
  br i1 %t2965, label %fixfast724, label %fixslow725
fixfast724:
  %t2966 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t2962, i64 384)
  %t2967 = extractvalue {i64, i1} %t2966, 0
  %t2968 = extractvalue {i64, i1} %t2966, 1
  br i1 %t2968, label %fixslow725, label %fixmerge726
fixslow725:
  %t2969 = call i64 @rt_sub(i64 %t2962, i64 384)
  br label %fixmerge726
fixmerge726:
  %t2970 = phi i64 [ %t2967, %fixfast724 ], [ %t2969, %fixslow725 ]
  %t2971 = or i64 %t2960, %t2970
  %t2972 = and i64 %t2971, 7
  %t2973 = icmp eq i64 %t2972, 0
  br i1 %t2973, label %fixfast727, label %fixslow728
fixfast727:
  %t2974 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t2960, i64 %t2970)
  %t2975 = extractvalue {i64, i1} %t2974, 0
  %t2976 = extractvalue {i64, i1} %t2974, 1
  br i1 %t2976, label %fixslow728, label %fixmerge729
fixslow728:
  %t2977 = call i64 @rt_sub(i64 %t2960, i64 %t2970)
  br label %fixmerge729
fixmerge729:
  %t2978 = phi i64 [ %t2975, %fixfast727 ], [ %t2977, %fixslow728 ]
  %t2979 = load i64, ptr @"scheme.base:rd-digits-neg"
  %t2980 = and i64 %t2979, -8
  %t2981 = inttoptr i64 %t2980 to ptr
  %t2982 = load i64, ptr %t2981
  %t2983 = inttoptr i64 %t2982 to ptr
  %t2984 = musttail call fastcc i64 %t2983(i64 %t2979, i64 4, i64 %a0, i64 %t2951, i64 %a2, i64 %t2978, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2984
else717:
  ret i64 %a3
}

define fastcc i64 @"scheme.base:code:rd-parse-int"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2989 = icmp eq i64 %argc, 1
  br i1 %t2989, label %argok731, label %arityerr730
arityerr730:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok731:
  %t2990 = call i64 @rt_string_length(i64 %a0)
  %t2991 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t2992 = call i64 @rt_char_to_integer(i64 %t2991)
  %t2993 = or i64 %t2992, 360
  %t2994 = and i64 %t2993, 7
  %t2995 = icmp eq i64 %t2994, 0
  br i1 %t2995, label %fixfast732, label %fixslow733
fixfast732:
  %t2996 = icmp eq i64 %t2992, 360
  %t2997 = select i1 %t2996, i64 257, i64 1
  br label %fixmerge734
fixslow733:
  %t2998 = call i64 @rt_num_eq(i64 %t2992, i64 360)
  br label %fixmerge734
fixmerge734:
  %t2999 = phi i64 [ %t2997, %fixfast732 ], [ %t2998, %fixslow733 ]
  %t3000 = icmp ne i64 %t2999, 1
  br i1 %t3000, label %then735, label %else736
then735:
  %t3001 = load i64, ptr @"scheme.base:rd-digits-neg"
  %t3002 = and i64 %t3001, -8
  %t3003 = inttoptr i64 %t3002 to ptr
  %t3004 = load i64, ptr %t3003
  %t3005 = inttoptr i64 %t3004 to ptr
  %t3006 = musttail call fastcc i64 %t3005(i64 %t3001, i64 4, i64 %a0, i64 8, i64 %t2990, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3006
else736:
  %t3007 = or i64 %t2992, 344
  %t3008 = and i64 %t3007, 7
  %t3009 = icmp eq i64 %t3008, 0
  br i1 %t3009, label %fixfast737, label %fixslow738
fixfast737:
  %t3010 = icmp eq i64 %t2992, 344
  %t3011 = select i1 %t3010, i64 257, i64 1
  br label %fixmerge739
fixslow738:
  %t3012 = call i64 @rt_num_eq(i64 %t2992, i64 344)
  br label %fixmerge739
fixmerge739:
  %t3013 = phi i64 [ %t3011, %fixfast737 ], [ %t3012, %fixslow738 ]
  %t3014 = icmp ne i64 %t3013, 1
  br i1 %t3014, label %then740, label %else741
then740:
  %t3015 = load i64, ptr @"scheme.base:rd-digits"
  %t3016 = and i64 %t3015, -8
  %t3017 = inttoptr i64 %t3016 to ptr
  %t3018 = load i64, ptr %t3017
  %t3019 = inttoptr i64 %t3018 to ptr
  %t3020 = musttail call fastcc i64 %t3019(i64 %t3015, i64 4, i64 %a0, i64 8, i64 %t2990, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3020
else741:
  %t3021 = load i64, ptr @"scheme.base:rd-digits"
  %t3022 = and i64 %t3021, -8
  %t3023 = inttoptr i64 %t3022 to ptr
  %t3024 = load i64, ptr %t3023
  %t3025 = inttoptr i64 %t3024 to ptr
  %t3026 = musttail call fastcc i64 %t3025(i64 %t3021, i64 4, i64 %a0, i64 0, i64 %t2990, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3026
}

define fastcc i64 @"scheme.base:code:rd-dotchar?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3031 = icmp eq i64 %argc, 1
  br i1 %t3031, label %argok743, label %arityerr742
arityerr742:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok743:
  %t3032 = call i64 @rt_char_to_integer(i64 %a0)
  %t3033 = or i64 %t3032, 368
  %t3034 = and i64 %t3033, 7
  %t3035 = icmp eq i64 %t3034, 0
  br i1 %t3035, label %fixfast744, label %fixslow745
fixfast744:
  %t3036 = icmp eq i64 %t3032, 368
  %t3037 = select i1 %t3036, i64 257, i64 1
  br label %fixmerge746
fixslow745:
  %t3038 = call i64 @rt_num_eq(i64 %t3032, i64 368)
  br label %fixmerge746
fixmerge746:
  %t3039 = phi i64 [ %t3037, %fixfast744 ], [ %t3038, %fixslow745 ]
  ret i64 %t3039
}

define fastcc i64 @"scheme.base:code:rd-exp-char?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3044 = icmp eq i64 %argc, 1
  br i1 %t3044, label %argok748, label %arityerr747
arityerr747:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok748:
  %t3045 = call i64 @rt_char_to_integer(i64 %a0)
  %t3046 = or i64 %t3045, 808
  %t3047 = and i64 %t3046, 7
  %t3048 = icmp eq i64 %t3047, 0
  br i1 %t3048, label %fixfast749, label %fixslow750
fixfast749:
  %t3049 = icmp eq i64 %t3045, 808
  %t3050 = select i1 %t3049, i64 257, i64 1
  br label %fixmerge751
fixslow750:
  %t3051 = call i64 @rt_num_eq(i64 %t3045, i64 808)
  br label %fixmerge751
fixmerge751:
  %t3052 = phi i64 [ %t3050, %fixfast749 ], [ %t3051, %fixslow750 ]
  %t3053 = icmp ne i64 %t3052, 1
  br i1 %t3053, label %then752, label %else753
then752:
  ret i64 %t3052
else753:
  %t3054 = or i64 %t3045, 552
  %t3055 = and i64 %t3054, 7
  %t3056 = icmp eq i64 %t3055, 0
  br i1 %t3056, label %fixfast754, label %fixslow755
fixfast754:
  %t3057 = icmp eq i64 %t3045, 552
  %t3058 = select i1 %t3057, i64 257, i64 1
  br label %fixmerge756
fixslow755:
  %t3059 = call i64 @rt_num_eq(i64 %t3045, i64 552)
  br label %fixmerge756
fixmerge756:
  %t3060 = phi i64 [ %t3058, %fixfast754 ], [ %t3059, %fixslow755 ]
  ret i64 %t3060
}

define fastcc i64 @"scheme.base:code:rd-sign-char?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3065 = icmp eq i64 %argc, 1
  br i1 %t3065, label %argok758, label %arityerr757
arityerr757:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok758:
  %t3066 = call i64 @rt_char_to_integer(i64 %a0)
  %t3067 = or i64 %t3066, 344
  %t3068 = and i64 %t3067, 7
  %t3069 = icmp eq i64 %t3068, 0
  br i1 %t3069, label %fixfast759, label %fixslow760
fixfast759:
  %t3070 = icmp eq i64 %t3066, 344
  %t3071 = select i1 %t3070, i64 257, i64 1
  br label %fixmerge761
fixslow760:
  %t3072 = call i64 @rt_num_eq(i64 %t3066, i64 344)
  br label %fixmerge761
fixmerge761:
  %t3073 = phi i64 [ %t3071, %fixfast759 ], [ %t3072, %fixslow760 ]
  %t3074 = icmp ne i64 %t3073, 1
  br i1 %t3074, label %then762, label %else763
then762:
  ret i64 %t3073
else763:
  %t3075 = or i64 %t3066, 360
  %t3076 = and i64 %t3075, 7
  %t3077 = icmp eq i64 %t3076, 0
  br i1 %t3077, label %fixfast764, label %fixslow765
fixfast764:
  %t3078 = icmp eq i64 %t3066, 360
  %t3079 = select i1 %t3078, i64 257, i64 1
  br label %fixmerge766
fixslow765:
  %t3080 = call i64 @rt_num_eq(i64 %t3066, i64 360)
  br label %fixmerge766
fixmerge766:
  %t3081 = phi i64 [ %t3079, %fixfast764 ], [ %t3080, %fixslow765 ]
  ret i64 %t3081
}

define fastcc i64 @"scheme.base:code:rd-scan-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3086 = icmp eq i64 %argc, 3
  br i1 %t3086, label %argok768, label %arityerr767
arityerr767:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok768:
  %t3087 = or i64 %a1, %a2
  %t3088 = and i64 %t3087, 7
  %t3089 = icmp eq i64 %t3088, 0
  br i1 %t3089, label %fixfast769, label %fixslow770
fixfast769:
  %t3090 = icmp slt i64 %a1, %a2
  %t3091 = select i1 %t3090, i64 257, i64 1
  br label %fixmerge771
fixslow770:
  %t3092 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge771
fixmerge771:
  %t3093 = phi i64 [ %t3091, %fixfast769 ], [ %t3092, %fixslow770 ]
  %t3094 = icmp ne i64 %t3093, 1
  br i1 %t3094, label %then772, label %else773
then772:
  %t3095 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t3096 = load i64, ptr @"scheme.base:rd-digit?"
  %t3097 = and i64 %t3096, -8
  %t3098 = inttoptr i64 %t3097 to ptr
  %t3099 = load i64, ptr %t3098
  %t3100 = inttoptr i64 %t3099 to ptr
  %t3101 = call fastcc i64%t3100(i64 %t3096, i64 1, i64 %t3095, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge774
else773:
  br label %merge774
merge774:
  %t3102 = phi i64 [ %t3101, %then772 ], [ 1, %else773 ]
  %t3103 = icmp ne i64 %t3102, 1
  br i1 %t3103, label %then775, label %else776
then775:
  %t3104 = or i64 %a1, 8
  %t3105 = and i64 %t3104, 7
  %t3106 = icmp eq i64 %t3105, 0
  br i1 %t3106, label %fixfast777, label %fixslow778
fixfast777:
  %t3107 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t3108 = extractvalue {i64, i1} %t3107, 0
  %t3109 = extractvalue {i64, i1} %t3107, 1
  br i1 %t3109, label %fixslow778, label %fixmerge779
fixslow778:
  %t3110 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge779
fixmerge779:
  %t3111 = phi i64 [ %t3108, %fixfast777 ], [ %t3110, %fixslow778 ]
  %t3112 = load i64, ptr @"scheme.base:rd-scan-digits"
  %t3113 = and i64 %t3112, -8
  %t3114 = inttoptr i64 %t3113 to ptr
  %t3115 = load i64, ptr %t3114
  %t3116 = inttoptr i64 %t3115 to ptr
  %t3117 = musttail call fastcc i64 %t3116(i64 %t3112, i64 3, i64 %a0, i64 %t3111, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3117
else776:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:rd-flonum?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3122 = icmp eq i64 %argc, 1
  br i1 %t3122, label %argok781, label %arityerr780
arityerr780:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok781:
  %t3123 = call i64 @rt_string_length(i64 %a0)
  %t3124 = or i64 0, %t3123
  %t3125 = and i64 %t3124, 7
  %t3126 = icmp eq i64 %t3125, 0
  br i1 %t3126, label %fixfast782, label %fixslow783
fixfast782:
  %t3127 = icmp slt i64 0, %t3123
  %t3128 = select i1 %t3127, i64 257, i64 1
  br label %fixmerge784
fixslow783:
  %t3129 = call i64 @rt_lt(i64 0, i64 %t3123)
  br label %fixmerge784
fixmerge784:
  %t3130 = phi i64 [ %t3128, %fixfast782 ], [ %t3129, %fixslow783 ]
  %t3131 = icmp ne i64 %t3130, 1
  br i1 %t3131, label %then785, label %else786
then785:
  %t3132 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t3133 = load i64, ptr @"scheme.base:rd-sign-char?"
  %t3134 = and i64 %t3133, -8
  %t3135 = inttoptr i64 %t3134 to ptr
  %t3136 = load i64, ptr %t3135
  %t3137 = inttoptr i64 %t3136 to ptr
  %t3138 = call fastcc i64%t3137(i64 %t3133, i64 1, i64 %t3132, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3139 = icmp ne i64 %t3138, 1
  br i1 %t3139, label %then787, label %else788
then787:
  br label %merge789
else788:
  br label %merge789
merge789:
  %t3140 = phi i64 [ 8, %then787 ], [ 0, %else788 ]
  %t3141 = load i64, ptr @"scheme.base:rd-scan-digits"
  %t3142 = and i64 %t3141, -8
  %t3143 = inttoptr i64 %t3142 to ptr
  %t3144 = load i64, ptr %t3143
  %t3145 = inttoptr i64 %t3144 to ptr
  %t3146 = call fastcc i64%t3145(i64 %t3141, i64 3, i64 %a0, i64 %t3140, i64 %t3123, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3147 = or i64 %t3146, %t3123
  %t3148 = and i64 %t3147, 7
  %t3149 = icmp eq i64 %t3148, 0
  br i1 %t3149, label %fixfast790, label %fixslow791
fixfast790:
  %t3150 = icmp slt i64 %t3146, %t3123
  %t3151 = select i1 %t3150, i64 257, i64 1
  br label %fixmerge792
fixslow791:
  %t3152 = call i64 @rt_lt(i64 %t3146, i64 %t3123)
  br label %fixmerge792
fixmerge792:
  %t3153 = phi i64 [ %t3151, %fixfast790 ], [ %t3152, %fixslow791 ]
  %t3154 = icmp ne i64 %t3153, 1
  br i1 %t3154, label %then793, label %else794
then793:
  %t3155 = call i64 @rt_string_ref(i64 %a0, i64 %t3146)
  %t3156 = load i64, ptr @"scheme.base:rd-dotchar?"
  %t3157 = and i64 %t3156, -8
  %t3158 = inttoptr i64 %t3157 to ptr
  %t3159 = load i64, ptr %t3158
  %t3160 = inttoptr i64 %t3159 to ptr
  %t3161 = call fastcc i64%t3160(i64 %t3156, i64 1, i64 %t3155, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge795
else794:
  br label %merge795
merge795:
  %t3162 = phi i64 [ %t3161, %then793 ], [ 1, %else794 ]
  %t3163 = icmp ne i64 %t3162, 1
  br i1 %t3163, label %then796, label %else797
then796:
  %t3164 = or i64 %t3146, 8
  %t3165 = and i64 %t3164, 7
  %t3166 = icmp eq i64 %t3165, 0
  br i1 %t3166, label %fixfast799, label %fixslow800
fixfast799:
  %t3167 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3146, i64 8)
  %t3168 = extractvalue {i64, i1} %t3167, 0
  %t3169 = extractvalue {i64, i1} %t3167, 1
  br i1 %t3169, label %fixslow800, label %fixmerge801
fixslow800:
  %t3170 = call i64 @rt_add(i64 %t3146, i64 8)
  br label %fixmerge801
fixmerge801:
  %t3171 = phi i64 [ %t3168, %fixfast799 ], [ %t3170, %fixslow800 ]
  br label %merge798
else797:
  br label %merge798
merge798:
  %t3172 = phi i64 [ %t3171, %fixmerge801 ], [ %t3146, %else797 ]
  %t3173 = or i64 %t3146, %t3172
  %t3174 = and i64 %t3173, 7
  %t3175 = icmp eq i64 %t3174, 0
  br i1 %t3175, label %fixfast802, label %fixslow803
fixfast802:
  %t3176 = icmp slt i64 %t3146, %t3172
  %t3177 = select i1 %t3176, i64 257, i64 1
  br label %fixmerge804
fixslow803:
  %t3178 = call i64 @rt_lt(i64 %t3146, i64 %t3172)
  br label %fixmerge804
fixmerge804:
  %t3179 = phi i64 [ %t3177, %fixfast802 ], [ %t3178, %fixslow803 ]
  %t3180 = load i64, ptr @"scheme.base:rd-scan-digits"
  %t3181 = and i64 %t3180, -8
  %t3182 = inttoptr i64 %t3181 to ptr
  %t3183 = load i64, ptr %t3182
  %t3184 = inttoptr i64 %t3183 to ptr
  %t3185 = call fastcc i64%t3184(i64 %t3180, i64 3, i64 %a0, i64 %t3172, i64 %t3123, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3186 = or i64 %t3140, %t3146
  %t3187 = and i64 %t3186, 7
  %t3188 = icmp eq i64 %t3187, 0
  br i1 %t3188, label %fixfast805, label %fixslow806
fixfast805:
  %t3189 = icmp slt i64 %t3140, %t3146
  %t3190 = select i1 %t3189, i64 257, i64 1
  br label %fixmerge807
fixslow806:
  %t3191 = call i64 @rt_lt(i64 %t3140, i64 %t3146)
  br label %fixmerge807
fixmerge807:
  %t3192 = phi i64 [ %t3190, %fixfast805 ], [ %t3191, %fixslow806 ]
  %t3193 = icmp ne i64 %t3192, 1
  br i1 %t3193, label %then808, label %else809
then808:
  br label %merge810
else809:
  %t3194 = or i64 %t3172, %t3185
  %t3195 = and i64 %t3194, 7
  %t3196 = icmp eq i64 %t3195, 0
  br i1 %t3196, label %fixfast811, label %fixslow812
fixfast811:
  %t3197 = icmp slt i64 %t3172, %t3185
  %t3198 = select i1 %t3197, i64 257, i64 1
  br label %fixmerge813
fixslow812:
  %t3199 = call i64 @rt_lt(i64 %t3172, i64 %t3185)
  br label %fixmerge813
fixmerge813:
  %t3200 = phi i64 [ %t3198, %fixfast811 ], [ %t3199, %fixslow812 ]
  br label %merge810
merge810:
  %t3201 = phi i64 [ %t3192, %then808 ], [ %t3200, %fixmerge813 ]
  %t3202 = icmp ne i64 %t3201, 1
  br i1 %t3202, label %then814, label %else815
then814:
  %t3203 = or i64 %t3185, %t3123
  %t3204 = and i64 %t3203, 7
  %t3205 = icmp eq i64 %t3204, 0
  br i1 %t3205, label %fixfast816, label %fixslow817
fixfast816:
  %t3206 = icmp slt i64 %t3185, %t3123
  %t3207 = select i1 %t3206, i64 257, i64 1
  br label %fixmerge818
fixslow817:
  %t3208 = call i64 @rt_lt(i64 %t3185, i64 %t3123)
  br label %fixmerge818
fixmerge818:
  %t3209 = phi i64 [ %t3207, %fixfast816 ], [ %t3208, %fixslow817 ]
  %t3210 = icmp ne i64 %t3209, 1
  br i1 %t3210, label %then819, label %else820
then819:
  %t3211 = call i64 @rt_string_ref(i64 %a0, i64 %t3185)
  %t3212 = load i64, ptr @"scheme.base:rd-exp-char?"
  %t3213 = and i64 %t3212, -8
  %t3214 = inttoptr i64 %t3213 to ptr
  %t3215 = load i64, ptr %t3214
  %t3216 = inttoptr i64 %t3215 to ptr
  %t3217 = call fastcc i64%t3216(i64 %t3212, i64 1, i64 %t3211, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge821
else820:
  br label %merge821
merge821:
  %t3218 = phi i64 [ %t3217, %then819 ], [ 1, %else820 ]
  %t3219 = icmp ne i64 %t3218, 1
  br i1 %t3219, label %then822, label %else823
then822:
  %t3220 = or i64 %t3185, 8
  %t3221 = and i64 %t3220, 7
  %t3222 = icmp eq i64 %t3221, 0
  br i1 %t3222, label %fixfast825, label %fixslow826
fixfast825:
  %t3223 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3185, i64 8)
  %t3224 = extractvalue {i64, i1} %t3223, 0
  %t3225 = extractvalue {i64, i1} %t3223, 1
  br i1 %t3225, label %fixslow826, label %fixmerge827
fixslow826:
  %t3226 = call i64 @rt_add(i64 %t3185, i64 8)
  br label %fixmerge827
fixmerge827:
  %t3227 = phi i64 [ %t3224, %fixfast825 ], [ %t3226, %fixslow826 ]
  %t3228 = or i64 %t3227, %t3123
  %t3229 = and i64 %t3228, 7
  %t3230 = icmp eq i64 %t3229, 0
  br i1 %t3230, label %fixfast828, label %fixslow829
fixfast828:
  %t3231 = icmp slt i64 %t3227, %t3123
  %t3232 = select i1 %t3231, i64 257, i64 1
  br label %fixmerge830
fixslow829:
  %t3233 = call i64 @rt_lt(i64 %t3227, i64 %t3123)
  br label %fixmerge830
fixmerge830:
  %t3234 = phi i64 [ %t3232, %fixfast828 ], [ %t3233, %fixslow829 ]
  %t3235 = icmp ne i64 %t3234, 1
  br i1 %t3235, label %then831, label %else832
then831:
  %t3236 = or i64 %t3185, 8
  %t3237 = and i64 %t3236, 7
  %t3238 = icmp eq i64 %t3237, 0
  br i1 %t3238, label %fixfast834, label %fixslow835
fixfast834:
  %t3239 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3185, i64 8)
  %t3240 = extractvalue {i64, i1} %t3239, 0
  %t3241 = extractvalue {i64, i1} %t3239, 1
  br i1 %t3241, label %fixslow835, label %fixmerge836
fixslow835:
  %t3242 = call i64 @rt_add(i64 %t3185, i64 8)
  br label %fixmerge836
fixmerge836:
  %t3243 = phi i64 [ %t3240, %fixfast834 ], [ %t3242, %fixslow835 ]
  %t3244 = call i64 @rt_string_ref(i64 %a0, i64 %t3243)
  %t3245 = load i64, ptr @"scheme.base:rd-sign-char?"
  %t3246 = and i64 %t3245, -8
  %t3247 = inttoptr i64 %t3246 to ptr
  %t3248 = load i64, ptr %t3247
  %t3249 = inttoptr i64 %t3248 to ptr
  %t3250 = call fastcc i64%t3249(i64 %t3245, i64 1, i64 %t3244, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge833
else832:
  br label %merge833
merge833:
  %t3251 = phi i64 [ %t3250, %fixmerge836 ], [ 1, %else832 ]
  %t3252 = icmp ne i64 %t3251, 1
  br i1 %t3252, label %then837, label %else838
then837:
  %t3253 = or i64 %t3185, 16
  %t3254 = and i64 %t3253, 7
  %t3255 = icmp eq i64 %t3254, 0
  br i1 %t3255, label %fixfast840, label %fixslow841
fixfast840:
  %t3256 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3185, i64 16)
  %t3257 = extractvalue {i64, i1} %t3256, 0
  %t3258 = extractvalue {i64, i1} %t3256, 1
  br i1 %t3258, label %fixslow841, label %fixmerge842
fixslow841:
  %t3259 = call i64 @rt_add(i64 %t3185, i64 16)
  br label %fixmerge842
fixmerge842:
  %t3260 = phi i64 [ %t3257, %fixfast840 ], [ %t3259, %fixslow841 ]
  br label %merge839
else838:
  %t3261 = or i64 %t3185, 8
  %t3262 = and i64 %t3261, 7
  %t3263 = icmp eq i64 %t3262, 0
  br i1 %t3263, label %fixfast843, label %fixslow844
fixfast843:
  %t3264 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3185, i64 8)
  %t3265 = extractvalue {i64, i1} %t3264, 0
  %t3266 = extractvalue {i64, i1} %t3264, 1
  br i1 %t3266, label %fixslow844, label %fixmerge845
fixslow844:
  %t3267 = call i64 @rt_add(i64 %t3185, i64 8)
  br label %fixmerge845
fixmerge845:
  %t3268 = phi i64 [ %t3265, %fixfast843 ], [ %t3267, %fixslow844 ]
  br label %merge839
merge839:
  %t3269 = phi i64 [ %t3260, %fixmerge842 ], [ %t3268, %fixmerge845 ]
  %t3270 = load i64, ptr @"scheme.base:rd-scan-digits"
  %t3271 = and i64 %t3270, -8
  %t3272 = inttoptr i64 %t3271 to ptr
  %t3273 = load i64, ptr %t3272
  %t3274 = inttoptr i64 %t3273 to ptr
  %t3275 = call fastcc i64%t3274(i64 %t3270, i64 3, i64 %a0, i64 %t3269, i64 %t3123, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3276 = or i64 %t3269, %t3275
  %t3277 = and i64 %t3276, 7
  %t3278 = icmp eq i64 %t3277, 0
  br i1 %t3278, label %fixfast846, label %fixslow847
fixfast846:
  %t3279 = icmp slt i64 %t3269, %t3275
  %t3280 = select i1 %t3279, i64 257, i64 1
  br label %fixmerge848
fixslow847:
  %t3281 = call i64 @rt_lt(i64 %t3269, i64 %t3275)
  br label %fixmerge848
fixmerge848:
  %t3282 = phi i64 [ %t3280, %fixfast846 ], [ %t3281, %fixslow847 ]
  %t3283 = icmp ne i64 %t3282, 1
  br i1 %t3283, label %then849, label %else850
then849:
  br label %merge851
else850:
  br label %merge851
merge851:
  %t3284 = phi i64 [ %t3275, %then849 ], [ -8, %else850 ]
  br label %merge824
else823:
  br label %merge824
merge824:
  %t3285 = phi i64 [ %t3284, %merge851 ], [ %t3185, %else823 ]
  %t3286 = or i64 -8, %t3285
  %t3287 = and i64 %t3286, 7
  %t3288 = icmp eq i64 %t3287, 0
  br i1 %t3288, label %fixfast852, label %fixslow853
fixfast852:
  %t3289 = icmp slt i64 -8, %t3285
  %t3290 = select i1 %t3289, i64 257, i64 1
  br label %fixmerge854
fixslow853:
  %t3291 = call i64 @rt_lt(i64 -8, i64 %t3285)
  br label %fixmerge854
fixmerge854:
  %t3292 = phi i64 [ %t3290, %fixfast852 ], [ %t3291, %fixslow853 ]
  %t3293 = icmp ne i64 %t3292, 1
  br i1 %t3293, label %then855, label %else856
then855:
  %t3294 = or i64 %t3285, %t3123
  %t3295 = and i64 %t3294, 7
  %t3296 = icmp eq i64 %t3295, 0
  br i1 %t3296, label %fixfast857, label %fixslow858
fixfast857:
  %t3297 = icmp eq i64 %t3285, %t3123
  %t3298 = select i1 %t3297, i64 257, i64 1
  br label %fixmerge859
fixslow858:
  %t3299 = call i64 @rt_num_eq(i64 %t3285, i64 %t3123)
  br label %fixmerge859
fixmerge859:
  %t3300 = phi i64 [ %t3298, %fixfast857 ], [ %t3299, %fixslow858 ]
  %t3301 = icmp ne i64 %t3300, 1
  br i1 %t3301, label %then860, label %else861
then860:
  %t3302 = icmp ne i64 %t3179, 1
  br i1 %t3302, label %then862, label %else863
then862:
  ret i64 %t3179
else863:
  %t3303 = or i64 %t3185, %t3285
  %t3304 = and i64 %t3303, 7
  %t3305 = icmp eq i64 %t3304, 0
  br i1 %t3305, label %fixfast864, label %fixslow865
fixfast864:
  %t3306 = icmp slt i64 %t3185, %t3285
  %t3307 = select i1 %t3306, i64 257, i64 1
  br label %fixmerge866
fixslow865:
  %t3308 = call i64 @rt_lt(i64 %t3185, i64 %t3285)
  br label %fixmerge866
fixmerge866:
  %t3309 = phi i64 [ %t3307, %fixfast864 ], [ %t3308, %fixslow865 ]
  ret i64 %t3309
else861:
  ret i64 1
else856:
  ret i64 1
else815:
  ret i64 1
else786:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rd-atom"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3314 = icmp eq i64 %argc, 3
  br i1 %t3314, label %argok868, label %arityerr867
arityerr867:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok868:
  %t3315 = load i64, ptr @"scheme.base:rd-token-end"
  %t3316 = and i64 %t3315, -8
  %t3317 = inttoptr i64 %t3316 to ptr
  %t3318 = load i64, ptr %t3317
  %t3319 = inttoptr i64 %t3318 to ptr
  %t3320 = call fastcc i64%t3319(i64 %t3315, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3321 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t3320)
  %t3322 = load i64, ptr @"scheme.base:rd-numeric?"
  %t3323 = and i64 %t3322, -8
  %t3324 = inttoptr i64 %t3323 to ptr
  %t3325 = load i64, ptr %t3324
  %t3326 = inttoptr i64 %t3325 to ptr
  %t3327 = call fastcc i64%t3326(i64 %t3322, i64 1, i64 %t3321, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3328 = icmp ne i64 %t3327, 1
  br i1 %t3328, label %then869, label %else870
then869:
  %t3329 = load i64, ptr @"scheme.base:rd-parse-int"
  %t3330 = and i64 %t3329, -8
  %t3331 = inttoptr i64 %t3330 to ptr
  %t3332 = load i64, ptr %t3331
  %t3333 = inttoptr i64 %t3332 to ptr
  %t3334 = call fastcc i64%t3333(i64 %t3329, i64 1, i64 %t3321, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge871
else870:
  %t3335 = load i64, ptr @"scheme.base:rd-flonum?"
  %t3336 = and i64 %t3335, -8
  %t3337 = inttoptr i64 %t3336 to ptr
  %t3338 = load i64, ptr %t3337
  %t3339 = inttoptr i64 %t3338 to ptr
  %t3340 = call fastcc i64%t3339(i64 %t3335, i64 1, i64 %t3321, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3341 = icmp ne i64 %t3340, 1
  br i1 %t3341, label %then872, label %else873
then872:
  %t3342 = call i64 @rt_string_to_flonum(i64 %t3321)
  br label %merge874
else873:
  %t3343 = call i64 @rt_string_to_symbol(i64 %t3321)
  br label %merge874
merge874:
  %t3344 = phi i64 [ %t3342, %then872 ], [ %t3343, %else873 ]
  br label %merge871
merge871:
  %t3345 = phi i64 [ %t3334, %then869 ], [ %t3344, %merge874 ]
  %t3346 = call i64 @rt_cons(i64 %t3345, i64 %t3320)
  ret i64 %t3346
}

define fastcc i64 @"scheme.base:code:rd-hex-digit"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3351 = icmp eq i64 %argc, 1
  br i1 %t3351, label %argok876, label %arityerr875
arityerr875:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok876:
  %t3352 = call i64 @rt_char_to_integer(i64 %a0)
  %t3353 = or i64 376, %t3352
  %t3354 = and i64 %t3353, 7
  %t3355 = icmp eq i64 %t3354, 0
  br i1 %t3355, label %fixfast877, label %fixslow878
fixfast877:
  %t3356 = icmp slt i64 376, %t3352
  %t3357 = select i1 %t3356, i64 257, i64 1
  br label %fixmerge879
fixslow878:
  %t3358 = call i64 @rt_lt(i64 376, i64 %t3352)
  br label %fixmerge879
fixmerge879:
  %t3359 = phi i64 [ %t3357, %fixfast877 ], [ %t3358, %fixslow878 ]
  %t3360 = icmp ne i64 %t3359, 1
  br i1 %t3360, label %then880, label %else881
then880:
  %t3361 = or i64 %t3352, 464
  %t3362 = and i64 %t3361, 7
  %t3363 = icmp eq i64 %t3362, 0
  br i1 %t3363, label %fixfast883, label %fixslow884
fixfast883:
  %t3364 = icmp slt i64 %t3352, 464
  %t3365 = select i1 %t3364, i64 257, i64 1
  br label %fixmerge885
fixslow884:
  %t3366 = call i64 @rt_lt(i64 %t3352, i64 464)
  br label %fixmerge885
fixmerge885:
  %t3367 = phi i64 [ %t3365, %fixfast883 ], [ %t3366, %fixslow884 ]
  br label %merge882
else881:
  br label %merge882
merge882:
  %t3368 = phi i64 [ %t3367, %fixmerge885 ], [ 1, %else881 ]
  %t3369 = icmp ne i64 %t3368, 1
  br i1 %t3369, label %then886, label %else887
then886:
  %t3370 = or i64 %t3352, 384
  %t3371 = and i64 %t3370, 7
  %t3372 = icmp eq i64 %t3371, 0
  br i1 %t3372, label %fixfast888, label %fixslow889
fixfast888:
  %t3373 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3352, i64 384)
  %t3374 = extractvalue {i64, i1} %t3373, 0
  %t3375 = extractvalue {i64, i1} %t3373, 1
  br i1 %t3375, label %fixslow889, label %fixmerge890
fixslow889:
  %t3376 = call i64 @rt_sub(i64 %t3352, i64 384)
  br label %fixmerge890
fixmerge890:
  %t3377 = phi i64 [ %t3374, %fixfast888 ], [ %t3376, %fixslow889 ]
  ret i64 %t3377
else887:
  %t3378 = or i64 768, %t3352
  %t3379 = and i64 %t3378, 7
  %t3380 = icmp eq i64 %t3379, 0
  br i1 %t3380, label %fixfast891, label %fixslow892
fixfast891:
  %t3381 = icmp slt i64 768, %t3352
  %t3382 = select i1 %t3381, i64 257, i64 1
  br label %fixmerge893
fixslow892:
  %t3383 = call i64 @rt_lt(i64 768, i64 %t3352)
  br label %fixmerge893
fixmerge893:
  %t3384 = phi i64 [ %t3382, %fixfast891 ], [ %t3383, %fixslow892 ]
  %t3385 = icmp ne i64 %t3384, 1
  br i1 %t3385, label %then894, label %else895
then894:
  %t3386 = or i64 %t3352, 824
  %t3387 = and i64 %t3386, 7
  %t3388 = icmp eq i64 %t3387, 0
  br i1 %t3388, label %fixfast897, label %fixslow898
fixfast897:
  %t3389 = icmp slt i64 %t3352, 824
  %t3390 = select i1 %t3389, i64 257, i64 1
  br label %fixmerge899
fixslow898:
  %t3391 = call i64 @rt_lt(i64 %t3352, i64 824)
  br label %fixmerge899
fixmerge899:
  %t3392 = phi i64 [ %t3390, %fixfast897 ], [ %t3391, %fixslow898 ]
  br label %merge896
else895:
  br label %merge896
merge896:
  %t3393 = phi i64 [ %t3392, %fixmerge899 ], [ 1, %else895 ]
  %t3394 = icmp ne i64 %t3393, 1
  br i1 %t3394, label %then900, label %else901
then900:
  %t3395 = or i64 %t3352, 696
  %t3396 = and i64 %t3395, 7
  %t3397 = icmp eq i64 %t3396, 0
  br i1 %t3397, label %fixfast902, label %fixslow903
fixfast902:
  %t3398 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3352, i64 696)
  %t3399 = extractvalue {i64, i1} %t3398, 0
  %t3400 = extractvalue {i64, i1} %t3398, 1
  br i1 %t3400, label %fixslow903, label %fixmerge904
fixslow903:
  %t3401 = call i64 @rt_sub(i64 %t3352, i64 696)
  br label %fixmerge904
fixmerge904:
  %t3402 = phi i64 [ %t3399, %fixfast902 ], [ %t3401, %fixslow903 ]
  ret i64 %t3402
else901:
  %t3403 = or i64 512, %t3352
  %t3404 = and i64 %t3403, 7
  %t3405 = icmp eq i64 %t3404, 0
  br i1 %t3405, label %fixfast905, label %fixslow906
fixfast905:
  %t3406 = icmp slt i64 512, %t3352
  %t3407 = select i1 %t3406, i64 257, i64 1
  br label %fixmerge907
fixslow906:
  %t3408 = call i64 @rt_lt(i64 512, i64 %t3352)
  br label %fixmerge907
fixmerge907:
  %t3409 = phi i64 [ %t3407, %fixfast905 ], [ %t3408, %fixslow906 ]
  %t3410 = icmp ne i64 %t3409, 1
  br i1 %t3410, label %then908, label %else909
then908:
  %t3411 = or i64 %t3352, 568
  %t3412 = and i64 %t3411, 7
  %t3413 = icmp eq i64 %t3412, 0
  br i1 %t3413, label %fixfast911, label %fixslow912
fixfast911:
  %t3414 = icmp slt i64 %t3352, 568
  %t3415 = select i1 %t3414, i64 257, i64 1
  br label %fixmerge913
fixslow912:
  %t3416 = call i64 @rt_lt(i64 %t3352, i64 568)
  br label %fixmerge913
fixmerge913:
  %t3417 = phi i64 [ %t3415, %fixfast911 ], [ %t3416, %fixslow912 ]
  br label %merge910
else909:
  br label %merge910
merge910:
  %t3418 = phi i64 [ %t3417, %fixmerge913 ], [ 1, %else909 ]
  %t3419 = icmp ne i64 %t3418, 1
  br i1 %t3419, label %then914, label %else915
then914:
  %t3420 = or i64 %t3352, 440
  %t3421 = and i64 %t3420, 7
  %t3422 = icmp eq i64 %t3421, 0
  br i1 %t3422, label %fixfast916, label %fixslow917
fixfast916:
  %t3423 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3352, i64 440)
  %t3424 = extractvalue {i64, i1} %t3423, 0
  %t3425 = extractvalue {i64, i1} %t3423, 1
  br i1 %t3425, label %fixslow917, label %fixmerge918
fixslow917:
  %t3426 = call i64 @rt_sub(i64 %t3352, i64 440)
  br label %fixmerge918
fixmerge918:
  %t3427 = phi i64 [ %t3424, %fixfast916 ], [ %t3426, %fixslow917 ]
  ret i64 %t3427
else915:
  ret i64 0
}

define fastcc i64 @"scheme.base:code:rd-hex"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3432 = icmp eq i64 %argc, 4
  br i1 %t3432, label %argok920, label %arityerr919
arityerr919:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok920:
  %t3433 = or i64 %a2, %a1
  %t3434 = and i64 %t3433, 7
  %t3435 = icmp eq i64 %t3434, 0
  br i1 %t3435, label %fixfast921, label %fixslow922
fixfast921:
  %t3436 = icmp slt i64 %a2, %a1
  %t3437 = select i1 %t3436, i64 257, i64 1
  br label %fixmerge923
fixslow922:
  %t3438 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge923
fixmerge923:
  %t3439 = phi i64 [ %t3437, %fixfast921 ], [ %t3438, %fixslow922 ]
  %t3440 = icmp ne i64 %t3439, 1
  br i1 %t3440, label %then924, label %else925
then924:
  %t3441 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3442 = call i64 @rt_char_to_integer(i64 %t3441)
  %t3443 = or i64 %t3442, 472
  %t3444 = and i64 %t3443, 7
  %t3445 = icmp eq i64 %t3444, 0
  br i1 %t3445, label %fixfast926, label %fixslow927
fixfast926:
  %t3446 = icmp eq i64 %t3442, 472
  %t3447 = select i1 %t3446, i64 257, i64 1
  br label %fixmerge928
fixslow927:
  %t3448 = call i64 @rt_num_eq(i64 %t3442, i64 472)
  br label %fixmerge928
fixmerge928:
  %t3449 = phi i64 [ %t3447, %fixfast926 ], [ %t3448, %fixslow927 ]
  %t3450 = icmp ne i64 %t3449, 1
  br i1 %t3450, label %then929, label %else930
then929:
  %t3451 = or i64 %a2, 8
  %t3452 = and i64 %t3451, 7
  %t3453 = icmp eq i64 %t3452, 0
  br i1 %t3453, label %fixfast931, label %fixslow932
fixfast931:
  %t3454 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3455 = extractvalue {i64, i1} %t3454, 0
  %t3456 = extractvalue {i64, i1} %t3454, 1
  br i1 %t3456, label %fixslow932, label %fixmerge933
fixslow932:
  %t3457 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge933
fixmerge933:
  %t3458 = phi i64 [ %t3455, %fixfast931 ], [ %t3457, %fixslow932 ]
  %t3459 = call i64 @rt_cons(i64 %a3, i64 %t3458)
  ret i64 %t3459
else930:
  %t3460 = or i64 %a2, 8
  %t3461 = and i64 %t3460, 7
  %t3462 = icmp eq i64 %t3461, 0
  br i1 %t3462, label %fixfast934, label %fixslow935
fixfast934:
  %t3463 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3464 = extractvalue {i64, i1} %t3463, 0
  %t3465 = extractvalue {i64, i1} %t3463, 1
  br i1 %t3465, label %fixslow935, label %fixmerge936
fixslow935:
  %t3466 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge936
fixmerge936:
  %t3467 = phi i64 [ %t3464, %fixfast934 ], [ %t3466, %fixslow935 ]
  %t3468 = or i64 %a3, 128
  %t3469 = and i64 %t3468, 7
  %t3470 = icmp eq i64 %t3469, 0
  br i1 %t3470, label %fixfast937, label %fixslow938
fixfast937:
  %t3471 = ashr i64 %a3, 3
  %t3472 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t3471, i64 128)
  %t3473 = extractvalue {i64, i1} %t3472, 0
  %t3474 = extractvalue {i64, i1} %t3472, 1
  br i1 %t3474, label %fixslow938, label %fixmerge939
fixslow938:
  %t3475 = call i64 @rt_mul(i64 %a3, i64 128)
  br label %fixmerge939
fixmerge939:
  %t3476 = phi i64 [ %t3473, %fixfast937 ], [ %t3475, %fixslow938 ]
  %t3477 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3478 = load i64, ptr @"scheme.base:rd-hex-digit"
  %t3479 = and i64 %t3478, -8
  %t3480 = inttoptr i64 %t3479 to ptr
  %t3481 = load i64, ptr %t3480
  %t3482 = inttoptr i64 %t3481 to ptr
  %t3483 = call fastcc i64%t3482(i64 %t3478, i64 1, i64 %t3477, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3484 = or i64 %t3476, %t3483
  %t3485 = and i64 %t3484, 7
  %t3486 = icmp eq i64 %t3485, 0
  br i1 %t3486, label %fixfast940, label %fixslow941
fixfast940:
  %t3487 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3476, i64 %t3483)
  %t3488 = extractvalue {i64, i1} %t3487, 0
  %t3489 = extractvalue {i64, i1} %t3487, 1
  br i1 %t3489, label %fixslow941, label %fixmerge942
fixslow941:
  %t3490 = call i64 @rt_add(i64 %t3476, i64 %t3483)
  br label %fixmerge942
fixmerge942:
  %t3491 = phi i64 [ %t3488, %fixfast940 ], [ %t3490, %fixslow941 ]
  %t3492 = load i64, ptr @"scheme.base:rd-hex"
  %t3493 = and i64 %t3492, -8
  %t3494 = inttoptr i64 %t3493 to ptr
  %t3495 = load i64, ptr %t3494
  %t3496 = inttoptr i64 %t3495 to ptr
  %t3497 = musttail call fastcc i64 %t3496(i64 %t3492, i64 4, i64 %a0, i64 %a1, i64 %t3467, i64 %t3491, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3497
else925:
  %t3498 = call i64 @rt_cons(i64 %a3, i64 %a2)
  ret i64 %t3498
}

define fastcc i64 @"scheme.base:code:rd-str-esc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3503 = icmp eq i64 %argc, 1
  br i1 %t3503, label %argok944, label %arityerr943
arityerr943:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok944:
  %t3504 = call i64 @rt_char_to_integer(i64 %a0)
  %t3505 = or i64 %t3504, 880
  %t3506 = and i64 %t3505, 7
  %t3507 = icmp eq i64 %t3506, 0
  br i1 %t3507, label %fixfast945, label %fixslow946
fixfast945:
  %t3508 = icmp eq i64 %t3504, 880
  %t3509 = select i1 %t3508, i64 257, i64 1
  br label %fixmerge947
fixslow946:
  %t3510 = call i64 @rt_num_eq(i64 %t3504, i64 880)
  br label %fixmerge947
fixmerge947:
  %t3511 = phi i64 [ %t3509, %fixfast945 ], [ %t3510, %fixslow946 ]
  %t3512 = icmp ne i64 %t3511, 1
  br i1 %t3512, label %then948, label %else949
then948:
  %t3513 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t3513
else949:
  %t3514 = or i64 %t3504, 928
  %t3515 = and i64 %t3514, 7
  %t3516 = icmp eq i64 %t3515, 0
  br i1 %t3516, label %fixfast950, label %fixslow951
fixfast950:
  %t3517 = icmp eq i64 %t3504, 928
  %t3518 = select i1 %t3517, i64 257, i64 1
  br label %fixmerge952
fixslow951:
  %t3519 = call i64 @rt_num_eq(i64 %t3504, i64 928)
  br label %fixmerge952
fixmerge952:
  %t3520 = phi i64 [ %t3518, %fixfast950 ], [ %t3519, %fixslow951 ]
  %t3521 = icmp ne i64 %t3520, 1
  br i1 %t3521, label %then953, label %else954
then953:
  %t3522 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t3522
else954:
  %t3523 = or i64 %t3504, 912
  %t3524 = and i64 %t3523, 7
  %t3525 = icmp eq i64 %t3524, 0
  br i1 %t3525, label %fixfast955, label %fixslow956
fixfast955:
  %t3526 = icmp eq i64 %t3504, 912
  %t3527 = select i1 %t3526, i64 257, i64 1
  br label %fixmerge957
fixslow956:
  %t3528 = call i64 @rt_num_eq(i64 %t3504, i64 912)
  br label %fixmerge957
fixmerge957:
  %t3529 = phi i64 [ %t3527, %fixfast955 ], [ %t3528, %fixslow956 ]
  %t3530 = icmp ne i64 %t3529, 1
  br i1 %t3530, label %then958, label %else959
then958:
  %t3531 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t3531
else959:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_848"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3536 = icmp eq i64 %argc, 2
  br i1 %t3536, label %argok961, label %arityerr960
arityerr960:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok961:
  %t3537 = and i64 %self, -8
  %t3538 = inttoptr i64 %t3537 to ptr
  %t3539 = getelementptr i64, ptr %t3538, i64 1
  %t3540 = load i64, ptr %t3539
  %t3541 = or i64 %a0, %t3540
  %t3542 = and i64 %t3541, 7
  %t3543 = icmp eq i64 %t3542, 0
  br i1 %t3543, label %fixfast962, label %fixslow963
fixfast962:
  %t3544 = icmp slt i64 %a0, %t3540
  %t3545 = select i1 %t3544, i64 257, i64 1
  br label %fixmerge964
fixslow963:
  %t3546 = call i64 @rt_lt(i64 %a0, i64 %t3540)
  br label %fixmerge964
fixmerge964:
  %t3547 = phi i64 [ %t3545, %fixfast962 ], [ %t3546, %fixslow963 ]
  %t3548 = icmp ne i64 %t3547, 1
  br i1 %t3548, label %then965, label %else966
then965:
  %t3549 = and i64 %self, -8
  %t3550 = inttoptr i64 %t3549 to ptr
  %t3551 = getelementptr i64, ptr %t3550, i64 2
  %t3552 = load i64, ptr %t3551
  %t3553 = call i64 @rt_string_ref(i64 %t3552, i64 %a0)
  %t3554 = call i64 @rt_char_to_integer(i64 %t3553)
  %t3555 = or i64 %t3554, 272
  %t3556 = and i64 %t3555, 7
  %t3557 = icmp eq i64 %t3556, 0
  br i1 %t3557, label %fixfast967, label %fixslow968
fixfast967:
  %t3558 = icmp eq i64 %t3554, 272
  %t3559 = select i1 %t3558, i64 257, i64 1
  br label %fixmerge969
fixslow968:
  %t3560 = call i64 @rt_num_eq(i64 %t3554, i64 272)
  br label %fixmerge969
fixmerge969:
  %t3561 = phi i64 [ %t3559, %fixfast967 ], [ %t3560, %fixslow968 ]
  %t3562 = icmp ne i64 %t3561, 1
  br i1 %t3562, label %then970, label %else971
then970:
  %t3563 = load i64, ptr @"scheme.base:reverse"
  %t3564 = and i64 %t3563, -8
  %t3565 = inttoptr i64 %t3564 to ptr
  %t3566 = load i64, ptr %t3565
  %t3567 = inttoptr i64 %t3566 to ptr
  %t3568 = call fastcc i64%t3567(i64 %t3563, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3569 = call i64 @rt_list_to_string(i64 %t3568)
  %t3570 = or i64 %a0, 8
  %t3571 = and i64 %t3570, 7
  %t3572 = icmp eq i64 %t3571, 0
  br i1 %t3572, label %fixfast972, label %fixslow973
fixfast972:
  %t3573 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3574 = extractvalue {i64, i1} %t3573, 0
  %t3575 = extractvalue {i64, i1} %t3573, 1
  br i1 %t3575, label %fixslow973, label %fixmerge974
fixslow973:
  %t3576 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge974
fixmerge974:
  %t3577 = phi i64 [ %t3574, %fixfast972 ], [ %t3576, %fixslow973 ]
  %t3578 = call i64 @rt_cons(i64 %t3569, i64 %t3577)
  ret i64 %t3578
else971:
  %t3579 = or i64 %t3554, 736
  %t3580 = and i64 %t3579, 7
  %t3581 = icmp eq i64 %t3580, 0
  br i1 %t3581, label %fixfast975, label %fixslow976
fixfast975:
  %t3582 = icmp eq i64 %t3554, 736
  %t3583 = select i1 %t3582, i64 257, i64 1
  br label %fixmerge977
fixslow976:
  %t3584 = call i64 @rt_num_eq(i64 %t3554, i64 736)
  br label %fixmerge977
fixmerge977:
  %t3585 = phi i64 [ %t3583, %fixfast975 ], [ %t3584, %fixslow976 ]
  %t3586 = icmp ne i64 %t3585, 1
  br i1 %t3586, label %then978, label %else979
then978:
  %t3587 = and i64 %self, -8
  %t3588 = inttoptr i64 %t3587 to ptr
  %t3589 = getelementptr i64, ptr %t3588, i64 2
  %t3590 = load i64, ptr %t3589
  %t3591 = or i64 %a0, 8
  %t3592 = and i64 %t3591, 7
  %t3593 = icmp eq i64 %t3592, 0
  br i1 %t3593, label %fixfast980, label %fixslow981
fixfast980:
  %t3594 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3595 = extractvalue {i64, i1} %t3594, 0
  %t3596 = extractvalue {i64, i1} %t3594, 1
  br i1 %t3596, label %fixslow981, label %fixmerge982
fixslow981:
  %t3597 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge982
fixmerge982:
  %t3598 = phi i64 [ %t3595, %fixfast980 ], [ %t3597, %fixslow981 ]
  %t3599 = call i64 @rt_string_ref(i64 %t3590, i64 %t3598)
  %t3600 = call i64 @rt_char_to_integer(i64 %t3599)
  %t3601 = or i64 %t3600, 960
  %t3602 = and i64 %t3601, 7
  %t3603 = icmp eq i64 %t3602, 0
  br i1 %t3603, label %fixfast983, label %fixslow984
fixfast983:
  %t3604 = icmp eq i64 %t3600, 960
  %t3605 = select i1 %t3604, i64 257, i64 1
  br label %fixmerge985
fixslow984:
  %t3606 = call i64 @rt_num_eq(i64 %t3600, i64 960)
  br label %fixmerge985
fixmerge985:
  %t3607 = phi i64 [ %t3605, %fixfast983 ], [ %t3606, %fixslow984 ]
  %t3608 = icmp ne i64 %t3607, 1
  br i1 %t3608, label %then986, label %else987
then986:
  %t3609 = and i64 %self, -8
  %t3610 = inttoptr i64 %t3609 to ptr
  %t3611 = getelementptr i64, ptr %t3610, i64 2
  %t3612 = load i64, ptr %t3611
  %t3613 = and i64 %self, -8
  %t3614 = inttoptr i64 %t3613 to ptr
  %t3615 = getelementptr i64, ptr %t3614, i64 1
  %t3616 = load i64, ptr %t3615
  %t3617 = or i64 %a0, 16
  %t3618 = and i64 %t3617, 7
  %t3619 = icmp eq i64 %t3618, 0
  br i1 %t3619, label %fixfast988, label %fixslow989
fixfast988:
  %t3620 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 16)
  %t3621 = extractvalue {i64, i1} %t3620, 0
  %t3622 = extractvalue {i64, i1} %t3620, 1
  br i1 %t3622, label %fixslow989, label %fixmerge990
fixslow989:
  %t3623 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge990
fixmerge990:
  %t3624 = phi i64 [ %t3621, %fixfast988 ], [ %t3623, %fixslow989 ]
  %t3625 = load i64, ptr @"scheme.base:rd-hex"
  %t3626 = and i64 %t3625, -8
  %t3627 = inttoptr i64 %t3626 to ptr
  %t3628 = load i64, ptr %t3627
  %t3629 = inttoptr i64 %t3628 to ptr
  %t3630 = call fastcc i64%t3629(i64 %t3625, i64 4, i64 %t3612, i64 %t3616, i64 %t3624, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3631 = call i64 @rt_cdr(i64 %t3630)
  %t3632 = call i64 @rt_car(i64 %t3630)
  %t3633 = call i64 @rt_integer_to_char(i64 %t3632)
  %t3634 = call i64 @rt_cons(i64 %t3633, i64 %a1)
  %t3635 = musttail call fastcc i64 @"scheme.base:code_848"(i64 %self, i64 2, i64 %t3631, i64 %t3634, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3635
else987:
  %t3636 = or i64 %a0, 16
  %t3637 = and i64 %t3636, 7
  %t3638 = icmp eq i64 %t3637, 0
  br i1 %t3638, label %fixfast991, label %fixslow992
fixfast991:
  %t3639 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 16)
  %t3640 = extractvalue {i64, i1} %t3639, 0
  %t3641 = extractvalue {i64, i1} %t3639, 1
  br i1 %t3641, label %fixslow992, label %fixmerge993
fixslow992:
  %t3642 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge993
fixmerge993:
  %t3643 = phi i64 [ %t3640, %fixfast991 ], [ %t3642, %fixslow992 ]
  %t3644 = load i64, ptr @"scheme.base:rd-str-esc"
  %t3645 = and i64 %t3644, -8
  %t3646 = inttoptr i64 %t3645 to ptr
  %t3647 = load i64, ptr %t3646
  %t3648 = inttoptr i64 %t3647 to ptr
  %t3649 = call fastcc i64%t3648(i64 %t3644, i64 1, i64 %t3599, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3650 = call i64 @rt_cons(i64 %t3649, i64 %a1)
  %t3651 = musttail call fastcc i64 @"scheme.base:code_848"(i64 %self, i64 2, i64 %t3643, i64 %t3650, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3651
else979:
  %t3652 = or i64 %a0, 8
  %t3653 = and i64 %t3652, 7
  %t3654 = icmp eq i64 %t3653, 0
  br i1 %t3654, label %fixfast994, label %fixslow995
fixfast994:
  %t3655 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3656 = extractvalue {i64, i1} %t3655, 0
  %t3657 = extractvalue {i64, i1} %t3655, 1
  br i1 %t3657, label %fixslow995, label %fixmerge996
fixslow995:
  %t3658 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge996
fixmerge996:
  %t3659 = phi i64 [ %t3656, %fixfast994 ], [ %t3658, %fixslow995 ]
  %t3660 = call i64 @rt_cons(i64 %t3553, i64 %a1)
  %t3661 = musttail call fastcc i64 @"scheme.base:code_848"(i64 %self, i64 2, i64 %t3659, i64 %t3660, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3661
else966:
  %t3662 = load i64, ptr @"scheme.base:reverse"
  %t3663 = and i64 %t3662, -8
  %t3664 = inttoptr i64 %t3663 to ptr
  %t3665 = load i64, ptr %t3664
  %t3666 = inttoptr i64 %t3665 to ptr
  %t3667 = call fastcc i64%t3666(i64 %t3662, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3668 = call i64 @rt_list_to_string(i64 %t3667)
  %t3669 = call i64 @rt_cons(i64 %t3668, i64 %a0)
  ret i64 %t3669
}

define fastcc i64 @"scheme.base:code:rd-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3670 = icmp eq i64 %argc, 3
  br i1 %t3670, label %argok998, label %arityerr997
arityerr997:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok998:
  %t3671 = call ptr @rt_alloc_words(i64 4)
  %t3672 = ptrtoint ptr %t3671 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_848" to i64), ptr %t3671
  %t3673 = or i64 %t3672, 4
  %t3674 = getelementptr i64, ptr %t3671, i64 1
  store i64 %a1, ptr %t3674
  %t3675 = getelementptr i64, ptr %t3671, i64 2
  store i64 %a0, ptr %t3675
  %t3676 = getelementptr i64, ptr %t3671, i64 3
  store i64 %t3673, ptr %t3676
  %t3677 = musttail call fastcc i64 @"scheme.base:code_848"(i64 %t3673, i64 2, i64 %a2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3677
}

define fastcc i64 @"scheme.base:code:rd-hash"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3682 = icmp eq i64 %argc, 3
  br i1 %t3682, label %argok1000, label %arityerr999
arityerr999:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1000:
  %t3683 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3684 = call i64 @rt_char_to_integer(i64 %t3683)
  %t3685 = or i64 %t3684, 928
  %t3686 = and i64 %t3685, 7
  %t3687 = icmp eq i64 %t3686, 0
  br i1 %t3687, label %fixfast1001, label %fixslow1002
fixfast1001:
  %t3688 = icmp eq i64 %t3684, 928
  %t3689 = select i1 %t3688, i64 257, i64 1
  br label %fixmerge1003
fixslow1002:
  %t3690 = call i64 @rt_num_eq(i64 %t3684, i64 928)
  br label %fixmerge1003
fixmerge1003:
  %t3691 = phi i64 [ %t3689, %fixfast1001 ], [ %t3690, %fixslow1002 ]
  %t3692 = icmp ne i64 %t3691, 1
  br i1 %t3692, label %then1004, label %else1005
then1004:
  %t3693 = or i64 %a2, 8
  %t3694 = and i64 %t3693, 7
  %t3695 = icmp eq i64 %t3694, 0
  br i1 %t3695, label %fixfast1006, label %fixslow1007
fixfast1006:
  %t3696 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3697 = extractvalue {i64, i1} %t3696, 0
  %t3698 = extractvalue {i64, i1} %t3696, 1
  br i1 %t3698, label %fixslow1007, label %fixmerge1008
fixslow1007:
  %t3699 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1008
fixmerge1008:
  %t3700 = phi i64 [ %t3697, %fixfast1006 ], [ %t3699, %fixslow1007 ]
  %t3701 = call i64 @rt_cons(i64 257, i64 %t3700)
  ret i64 %t3701
else1005:
  %t3702 = or i64 %t3684, 816
  %t3703 = and i64 %t3702, 7
  %t3704 = icmp eq i64 %t3703, 0
  br i1 %t3704, label %fixfast1009, label %fixslow1010
fixfast1009:
  %t3705 = icmp eq i64 %t3684, 816
  %t3706 = select i1 %t3705, i64 257, i64 1
  br label %fixmerge1011
fixslow1010:
  %t3707 = call i64 @rt_num_eq(i64 %t3684, i64 816)
  br label %fixmerge1011
fixmerge1011:
  %t3708 = phi i64 [ %t3706, %fixfast1009 ], [ %t3707, %fixslow1010 ]
  %t3709 = icmp ne i64 %t3708, 1
  br i1 %t3709, label %then1012, label %else1013
then1012:
  %t3710 = or i64 %a2, 8
  %t3711 = and i64 %t3710, 7
  %t3712 = icmp eq i64 %t3711, 0
  br i1 %t3712, label %fixfast1014, label %fixslow1015
fixfast1014:
  %t3713 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3714 = extractvalue {i64, i1} %t3713, 0
  %t3715 = extractvalue {i64, i1} %t3713, 1
  br i1 %t3715, label %fixslow1015, label %fixmerge1016
fixslow1015:
  %t3716 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1016
fixmerge1016:
  %t3717 = phi i64 [ %t3714, %fixfast1014 ], [ %t3716, %fixslow1015 ]
  %t3718 = call i64 @rt_cons(i64 1, i64 %t3717)
  ret i64 %t3718
else1013:
  %t3719 = or i64 %t3684, 736
  %t3720 = and i64 %t3719, 7
  %t3721 = icmp eq i64 %t3720, 0
  br i1 %t3721, label %fixfast1017, label %fixslow1018
fixfast1017:
  %t3722 = icmp eq i64 %t3684, 736
  %t3723 = select i1 %t3722, i64 257, i64 1
  br label %fixmerge1019
fixslow1018:
  %t3724 = call i64 @rt_num_eq(i64 %t3684, i64 736)
  br label %fixmerge1019
fixmerge1019:
  %t3725 = phi i64 [ %t3723, %fixfast1017 ], [ %t3724, %fixslow1018 ]
  %t3726 = icmp ne i64 %t3725, 1
  br i1 %t3726, label %then1020, label %else1021
then1020:
  %t3727 = load i64, ptr @"scheme.base:rd-char"
  %t3728 = and i64 %t3727, -8
  %t3729 = inttoptr i64 %t3728 to ptr
  %t3730 = load i64, ptr %t3729
  %t3731 = inttoptr i64 %t3730 to ptr
  %t3732 = musttail call fastcc i64 %t3731(i64 %t3727, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3732
else1021:
  %t3733 = or i64 %t3684, 320
  %t3734 = and i64 %t3733, 7
  %t3735 = icmp eq i64 %t3734, 0
  br i1 %t3735, label %fixfast1022, label %fixslow1023
fixfast1022:
  %t3736 = icmp eq i64 %t3684, 320
  %t3737 = select i1 %t3736, i64 257, i64 1
  br label %fixmerge1024
fixslow1023:
  %t3738 = call i64 @rt_num_eq(i64 %t3684, i64 320)
  br label %fixmerge1024
fixmerge1024:
  %t3739 = phi i64 [ %t3737, %fixfast1022 ], [ %t3738, %fixslow1023 ]
  %t3740 = icmp ne i64 %t3739, 1
  br i1 %t3740, label %then1025, label %else1026
then1025:
  %t3741 = or i64 %a2, 8
  %t3742 = and i64 %t3741, 7
  %t3743 = icmp eq i64 %t3742, 0
  br i1 %t3743, label %fixfast1027, label %fixslow1028
fixfast1027:
  %t3744 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3745 = extractvalue {i64, i1} %t3744, 0
  %t3746 = extractvalue {i64, i1} %t3744, 1
  br i1 %t3746, label %fixslow1028, label %fixmerge1029
fixslow1028:
  %t3747 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1029
fixmerge1029:
  %t3748 = phi i64 [ %t3745, %fixfast1027 ], [ %t3747, %fixslow1028 ]
  %t3749 = load i64, ptr @"scheme.base:rd-list"
  %t3750 = and i64 %t3749, -8
  %t3751 = inttoptr i64 %t3750 to ptr
  %t3752 = load i64, ptr %t3751
  %t3753 = inttoptr i64 %t3752 to ptr
  %t3754 = call fastcc i64%t3753(i64 %t3749, i64 4, i64 %a0, i64 %a1, i64 %t3748, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3755 = call i64 @rt_car(i64 %t3754)
  %t3756 = load i64, ptr @"scheme.base:list->vector"
  %t3757 = and i64 %t3756, -8
  %t3758 = inttoptr i64 %t3757 to ptr
  %t3759 = load i64, ptr %t3758
  %t3760 = inttoptr i64 %t3759 to ptr
  %t3761 = call fastcc i64%t3760(i64 %t3756, i64 1, i64 %t3755, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3762 = call i64 @rt_cdr(i64 %t3754)
  %t3763 = call i64 @rt_cons(i64 %t3761, i64 %t3762)
  ret i64 %t3763
else1026:
  %t3764 = or i64 %t3684, 936
  %t3765 = and i64 %t3764, 7
  %t3766 = icmp eq i64 %t3765, 0
  br i1 %t3766, label %fixfast1030, label %fixslow1031
fixfast1030:
  %t3767 = icmp eq i64 %t3684, 936
  %t3768 = select i1 %t3767, i64 257, i64 1
  br label %fixmerge1032
fixslow1031:
  %t3769 = call i64 @rt_num_eq(i64 %t3684, i64 936)
  br label %fixmerge1032
fixmerge1032:
  %t3770 = phi i64 [ %t3768, %fixfast1030 ], [ %t3769, %fixslow1031 ]
  %t3771 = icmp ne i64 %t3770, 1
  br i1 %t3771, label %then1033, label %else1034
then1033:
  %t3772 = or i64 %a2, 16
  %t3773 = and i64 %t3772, 7
  %t3774 = icmp eq i64 %t3773, 0
  br i1 %t3774, label %fixfast1036, label %fixslow1037
fixfast1036:
  %t3775 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t3776 = extractvalue {i64, i1} %t3775, 0
  %t3777 = extractvalue {i64, i1} %t3775, 1
  br i1 %t3777, label %fixslow1037, label %fixmerge1038
fixslow1037:
  %t3778 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge1038
fixmerge1038:
  %t3779 = phi i64 [ %t3776, %fixfast1036 ], [ %t3778, %fixslow1037 ]
  %t3780 = or i64 %t3779, %a1
  %t3781 = and i64 %t3780, 7
  %t3782 = icmp eq i64 %t3781, 0
  br i1 %t3782, label %fixfast1039, label %fixslow1040
fixfast1039:
  %t3783 = icmp slt i64 %t3779, %a1
  %t3784 = select i1 %t3783, i64 257, i64 1
  br label %fixmerge1041
fixslow1040:
  %t3785 = call i64 @rt_lt(i64 %t3779, i64 %a1)
  br label %fixmerge1041
fixmerge1041:
  %t3786 = phi i64 [ %t3784, %fixfast1039 ], [ %t3785, %fixslow1040 ]
  %t3787 = icmp ne i64 %t3786, 1
  br i1 %t3787, label %then1042, label %else1043
then1042:
  %t3788 = or i64 %a2, 8
  %t3789 = and i64 %t3788, 7
  %t3790 = icmp eq i64 %t3789, 0
  br i1 %t3790, label %fixfast1045, label %fixslow1046
fixfast1045:
  %t3791 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3792 = extractvalue {i64, i1} %t3791, 0
  %t3793 = extractvalue {i64, i1} %t3791, 1
  br i1 %t3793, label %fixslow1046, label %fixmerge1047
fixslow1046:
  %t3794 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1047
fixmerge1047:
  %t3795 = phi i64 [ %t3792, %fixfast1045 ], [ %t3794, %fixslow1046 ]
  %t3796 = call i64 @rt_string_ref(i64 %a0, i64 %t3795)
  %t3797 = call i64 @rt_char_to_integer(i64 %t3796)
  %t3798 = or i64 %t3797, 448
  %t3799 = and i64 %t3798, 7
  %t3800 = icmp eq i64 %t3799, 0
  br i1 %t3800, label %fixfast1048, label %fixslow1049
fixfast1048:
  %t3801 = icmp eq i64 %t3797, 448
  %t3802 = select i1 %t3801, i64 257, i64 1
  br label %fixmerge1050
fixslow1049:
  %t3803 = call i64 @rt_num_eq(i64 %t3797, i64 448)
  br label %fixmerge1050
fixmerge1050:
  %t3804 = phi i64 [ %t3802, %fixfast1048 ], [ %t3803, %fixslow1049 ]
  %t3805 = icmp ne i64 %t3804, 1
  br i1 %t3805, label %then1051, label %else1052
then1051:
  %t3806 = or i64 %a2, 16
  %t3807 = and i64 %t3806, 7
  %t3808 = icmp eq i64 %t3807, 0
  br i1 %t3808, label %fixfast1054, label %fixslow1055
fixfast1054:
  %t3809 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t3810 = extractvalue {i64, i1} %t3809, 0
  %t3811 = extractvalue {i64, i1} %t3809, 1
  br i1 %t3811, label %fixslow1055, label %fixmerge1056
fixslow1055:
  %t3812 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge1056
fixmerge1056:
  %t3813 = phi i64 [ %t3810, %fixfast1054 ], [ %t3812, %fixslow1055 ]
  %t3814 = call i64 @rt_string_ref(i64 %a0, i64 %t3813)
  %t3815 = call i64 @rt_char_to_integer(i64 %t3814)
  %t3816 = or i64 %t3815, 320
  %t3817 = and i64 %t3816, 7
  %t3818 = icmp eq i64 %t3817, 0
  br i1 %t3818, label %fixfast1057, label %fixslow1058
fixfast1057:
  %t3819 = icmp eq i64 %t3815, 320
  %t3820 = select i1 %t3819, i64 257, i64 1
  br label %fixmerge1059
fixslow1058:
  %t3821 = call i64 @rt_num_eq(i64 %t3815, i64 320)
  br label %fixmerge1059
fixmerge1059:
  %t3822 = phi i64 [ %t3820, %fixfast1057 ], [ %t3821, %fixslow1058 ]
  br label %merge1053
else1052:
  br label %merge1053
merge1053:
  %t3823 = phi i64 [ %t3822, %fixmerge1059 ], [ 1, %else1052 ]
  br label %merge1044
else1043:
  br label %merge1044
merge1044:
  %t3824 = phi i64 [ %t3823, %merge1053 ], [ 1, %else1043 ]
  br label %merge1035
else1034:
  br label %merge1035
merge1035:
  %t3825 = phi i64 [ %t3824, %merge1044 ], [ 1, %else1034 ]
  %t3826 = icmp ne i64 %t3825, 1
  br i1 %t3826, label %then1060, label %else1061
then1060:
  %t3827 = or i64 %a2, 24
  %t3828 = and i64 %t3827, 7
  %t3829 = icmp eq i64 %t3828, 0
  br i1 %t3829, label %fixfast1062, label %fixslow1063
fixfast1062:
  %t3830 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 24)
  %t3831 = extractvalue {i64, i1} %t3830, 0
  %t3832 = extractvalue {i64, i1} %t3830, 1
  br i1 %t3832, label %fixslow1063, label %fixmerge1064
fixslow1063:
  %t3833 = call i64 @rt_add(i64 %a2, i64 24)
  br label %fixmerge1064
fixmerge1064:
  %t3834 = phi i64 [ %t3831, %fixfast1062 ], [ %t3833, %fixslow1063 ]
  %t3835 = load i64, ptr @"scheme.base:rd-list"
  %t3836 = and i64 %t3835, -8
  %t3837 = inttoptr i64 %t3836 to ptr
  %t3838 = load i64, ptr %t3837
  %t3839 = inttoptr i64 %t3838 to ptr
  %t3840 = call fastcc i64%t3839(i64 %t3835, i64 4, i64 %a0, i64 %a1, i64 %t3834, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3841 = call i64 @rt_car(i64 %t3840)
  %t3842 = load i64, ptr @"scheme.base:list->bytevector"
  %t3843 = and i64 %t3842, -8
  %t3844 = inttoptr i64 %t3843 to ptr
  %t3845 = load i64, ptr %t3844
  %t3846 = inttoptr i64 %t3845 to ptr
  %t3847 = call fastcc i64%t3846(i64 %t3842, i64 1, i64 %t3841, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3848 = call i64 @rt_cdr(i64 %t3840)
  %t3849 = call i64 @rt_cons(i64 %t3847, i64 %t3848)
  ret i64 %t3849
else1061:
  %t3850 = load i64, ptr @"scheme.base:rd-token-end"
  %t3851 = and i64 %t3850, -8
  %t3852 = inttoptr i64 %t3851 to ptr
  %t3853 = load i64, ptr %t3852
  %t3854 = inttoptr i64 %t3853 to ptr
  %t3855 = call fastcc i64%t3854(i64 %t3850, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3856 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t3855)
  %t3857 = call i64 @rt_string_to_symbol(i64 %t3856)
  %t3858 = call i64 @rt_cons(i64 %t3857, i64 %t3855)
  ret i64 %t3858
}

define fastcc i64 @"scheme.base:code:rd-char-name"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3863 = icmp eq i64 %argc, 1
  br i1 %t3863, label %argok1066, label %arityerr1065
arityerr1065:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1066:
  %t3864 = call i64 @rt_make_string(ptr @.str.lit.6, i64 5)
  %t3865 = call i64 @rt_string_eq(i64 %a0, i64 %t3864)
  %t3866 = icmp ne i64 %t3865, 1
  br i1 %t3866, label %then1067, label %else1068
then1067:
  %t3867 = call i64 @rt_integer_to_char(i64 256)
  ret i64 %t3867
else1068:
  %t3868 = call i64 @rt_make_string(ptr @.str.lit.7, i64 7)
  %t3869 = call i64 @rt_string_eq(i64 %a0, i64 %t3868)
  %t3870 = icmp ne i64 %t3869, 1
  br i1 %t3870, label %then1069, label %else1070
then1069:
  %t3871 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t3871
else1070:
  %t3872 = call i64 @rt_make_string(ptr @.str.lit.8, i64 3)
  %t3873 = call i64 @rt_string_eq(i64 %a0, i64 %t3872)
  %t3874 = icmp ne i64 %t3873, 1
  br i1 %t3874, label %then1071, label %else1072
then1071:
  %t3875 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t3875
else1072:
  %t3876 = call i64 @rt_make_string(ptr @.str.lit.9, i64 6)
  %t3877 = call i64 @rt_string_eq(i64 %a0, i64 %t3876)
  %t3878 = icmp ne i64 %t3877, 1
  br i1 %t3878, label %then1073, label %else1074
then1073:
  %t3879 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t3879
else1074:
  %t3880 = call i64 @rt_make_string(ptr @.str.lit.10, i64 3)
  %t3881 = call i64 @rt_string_eq(i64 %a0, i64 %t3880)
  %t3882 = icmp ne i64 %t3881, 1
  br i1 %t3882, label %then1075, label %else1076
then1075:
  %t3883 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t3883
else1076:
  %t3884 = call i64 @rt_make_string(ptr @.str.lit.11, i64 4)
  %t3885 = call i64 @rt_string_eq(i64 %a0, i64 %t3884)
  %t3886 = icmp ne i64 %t3885, 1
  br i1 %t3886, label %then1077, label %else1078
then1077:
  %t3887 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t3887
else1078:
  %t3888 = call i64 @rt_make_string(ptr @.str.lit.12, i64 6)
  %t3889 = call i64 @rt_string_eq(i64 %a0, i64 %t3888)
  %t3890 = icmp ne i64 %t3889, 1
  br i1 %t3890, label %then1079, label %else1080
then1079:
  %t3891 = call i64 @rt_integer_to_char(i64 1016)
  ret i64 %t3891
else1080:
  %t3892 = call i64 @rt_make_string(ptr @.str.lit.13, i64 7)
  %t3893 = call i64 @rt_string_eq(i64 %a0, i64 %t3892)
  %t3894 = icmp ne i64 %t3893, 1
  br i1 %t3894, label %then1081, label %else1082
then1081:
  %t3895 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t3895
else1082:
  %t3896 = call i64 @rt_make_string(ptr @.str.lit.14, i64 3)
  %t3897 = call i64 @rt_string_eq(i64 %a0, i64 %t3896)
  %t3898 = icmp ne i64 %t3897, 1
  br i1 %t3898, label %then1083, label %else1084
then1083:
  %t3899 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t3899
else1084:
  %t3900 = call i64 @rt_string_ref(i64 %a0, i64 0)
  ret i64 %t3900
}

define fastcc i64 @"scheme.base:code:rd-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3905 = icmp eq i64 %argc, 3
  br i1 %t3905, label %argok1086, label %arityerr1085
arityerr1085:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1086:
  %t3906 = or i64 %a2, 8
  %t3907 = and i64 %t3906, 7
  %t3908 = icmp eq i64 %t3907, 0
  br i1 %t3908, label %fixfast1087, label %fixslow1088
fixfast1087:
  %t3909 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3910 = extractvalue {i64, i1} %t3909, 0
  %t3911 = extractvalue {i64, i1} %t3909, 1
  br i1 %t3911, label %fixslow1088, label %fixmerge1089
fixslow1088:
  %t3912 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1089
fixmerge1089:
  %t3913 = phi i64 [ %t3910, %fixfast1087 ], [ %t3912, %fixslow1088 ]
  %t3914 = or i64 %t3913, 8
  %t3915 = and i64 %t3914, 7
  %t3916 = icmp eq i64 %t3915, 0
  br i1 %t3916, label %fixfast1090, label %fixslow1091
fixfast1090:
  %t3917 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3913, i64 8)
  %t3918 = extractvalue {i64, i1} %t3917, 0
  %t3919 = extractvalue {i64, i1} %t3917, 1
  br i1 %t3919, label %fixslow1091, label %fixmerge1092
fixslow1091:
  %t3920 = call i64 @rt_add(i64 %t3913, i64 8)
  br label %fixmerge1092
fixmerge1092:
  %t3921 = phi i64 [ %t3918, %fixfast1090 ], [ %t3920, %fixslow1091 ]
  %t3922 = load i64, ptr @"scheme.base:rd-token-end"
  %t3923 = and i64 %t3922, -8
  %t3924 = inttoptr i64 %t3923 to ptr
  %t3925 = load i64, ptr %t3924
  %t3926 = inttoptr i64 %t3925 to ptr
  %t3927 = call fastcc i64%t3926(i64 %t3922, i64 3, i64 %a0, i64 %a1, i64 %t3921, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3928 = call i64 @rt_substring(i64 %a0, i64 %t3913, i64 %t3927)
  %t3929 = call i64 @rt_string_length(i64 %t3928)
  %t3930 = or i64 %t3929, 8
  %t3931 = and i64 %t3930, 7
  %t3932 = icmp eq i64 %t3931, 0
  br i1 %t3932, label %fixfast1093, label %fixslow1094
fixfast1093:
  %t3933 = icmp eq i64 %t3929, 8
  %t3934 = select i1 %t3933, i64 257, i64 1
  br label %fixmerge1095
fixslow1094:
  %t3935 = call i64 @rt_num_eq(i64 %t3929, i64 8)
  br label %fixmerge1095
fixmerge1095:
  %t3936 = phi i64 [ %t3934, %fixfast1093 ], [ %t3935, %fixslow1094 ]
  %t3937 = icmp ne i64 %t3936, 1
  br i1 %t3937, label %then1096, label %else1097
then1096:
  %t3938 = call i64 @rt_string_ref(i64 %a0, i64 %t3913)
  %t3939 = call i64 @rt_cons(i64 %t3938, i64 %t3927)
  ret i64 %t3939
else1097:
  %t3940 = load i64, ptr @"scheme.base:rd-char-name"
  %t3941 = and i64 %t3940, -8
  %t3942 = inttoptr i64 %t3941 to ptr
  %t3943 = load i64, ptr %t3942
  %t3944 = inttoptr i64 %t3943 to ptr
  %t3945 = call fastcc i64%t3944(i64 %t3940, i64 1, i64 %t3928, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3946 = call i64 @rt_cons(i64 %t3945, i64 %t3927)
  ret i64 %t3946
}

define fastcc i64 @"scheme.base:code:rd-quote"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3951 = icmp eq i64 %argc, 3
  br i1 %t3951, label %argok1099, label %arityerr1098
arityerr1098:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1099:
  %t3952 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3953 = and i64 %t3952, -8
  %t3954 = inttoptr i64 %t3953 to ptr
  %t3955 = load i64, ptr %t3954
  %t3956 = inttoptr i64 %t3955 to ptr
  %t3957 = call fastcc i64%t3956(i64 %t3952, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3958 = load i64, ptr @"scheme.base:rd-datum"
  %t3959 = and i64 %t3958, -8
  %t3960 = inttoptr i64 %t3959 to ptr
  %t3961 = load i64, ptr %t3960
  %t3962 = inttoptr i64 %t3961 to ptr
  %t3963 = call fastcc i64%t3962(i64 %t3958, i64 3, i64 %a0, i64 %a1, i64 %t3957, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3964 = call i64 @rt_intern(ptr @.str.sym.15)
  %t3965 = call i64 @rt_car(i64 %t3963)
  %t3966 = load i64, ptr @"scheme.base:list"
  %t3967 = and i64 %t3966, -8
  %t3968 = inttoptr i64 %t3967 to ptr
  %t3969 = load i64, ptr %t3968
  %t3970 = inttoptr i64 %t3969 to ptr
  %t3971 = call fastcc i64%t3970(i64 %t3966, i64 2, i64 %t3964, i64 %t3965, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3972 = call i64 @rt_cdr(i64 %t3963)
  %t3973 = call i64 @rt_cons(i64 %t3971, i64 %t3972)
  ret i64 %t3973
}

define fastcc i64 @"scheme.base:code:rd-quasi"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3978 = icmp eq i64 %argc, 3
  br i1 %t3978, label %argok1101, label %arityerr1100
arityerr1100:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1101:
  %t3979 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3980 = and i64 %t3979, -8
  %t3981 = inttoptr i64 %t3980 to ptr
  %t3982 = load i64, ptr %t3981
  %t3983 = inttoptr i64 %t3982 to ptr
  %t3984 = call fastcc i64%t3983(i64 %t3979, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3985 = load i64, ptr @"scheme.base:rd-datum"
  %t3986 = and i64 %t3985, -8
  %t3987 = inttoptr i64 %t3986 to ptr
  %t3988 = load i64, ptr %t3987
  %t3989 = inttoptr i64 %t3988 to ptr
  %t3990 = call fastcc i64%t3989(i64 %t3985, i64 3, i64 %a0, i64 %a1, i64 %t3984, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3991 = call i64 @rt_intern(ptr @.str.sym.16)
  %t3992 = call i64 @rt_car(i64 %t3990)
  %t3993 = load i64, ptr @"scheme.base:list"
  %t3994 = and i64 %t3993, -8
  %t3995 = inttoptr i64 %t3994 to ptr
  %t3996 = load i64, ptr %t3995
  %t3997 = inttoptr i64 %t3996 to ptr
  %t3998 = call fastcc i64%t3997(i64 %t3993, i64 2, i64 %t3991, i64 %t3992, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3999 = call i64 @rt_cdr(i64 %t3990)
  %t4000 = call i64 @rt_cons(i64 %t3998, i64 %t3999)
  ret i64 %t4000
}

define fastcc i64 @"scheme.base:code:rd-unquote"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4005 = icmp eq i64 %argc, 3
  br i1 %t4005, label %argok1103, label %arityerr1102
arityerr1102:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1103:
  %t4006 = or i64 %a2, %a1
  %t4007 = and i64 %t4006, 7
  %t4008 = icmp eq i64 %t4007, 0
  br i1 %t4008, label %fixfast1104, label %fixslow1105
fixfast1104:
  %t4009 = icmp slt i64 %a2, %a1
  %t4010 = select i1 %t4009, i64 257, i64 1
  br label %fixmerge1106
fixslow1105:
  %t4011 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge1106
fixmerge1106:
  %t4012 = phi i64 [ %t4010, %fixfast1104 ], [ %t4011, %fixslow1105 ]
  %t4013 = icmp ne i64 %t4012, 1
  br i1 %t4013, label %then1107, label %else1108
then1107:
  %t4014 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t4015 = call i64 @rt_char_to_integer(i64 %t4014)
  %t4016 = or i64 %t4015, 512
  %t4017 = and i64 %t4016, 7
  %t4018 = icmp eq i64 %t4017, 0
  br i1 %t4018, label %fixfast1110, label %fixslow1111
fixfast1110:
  %t4019 = icmp eq i64 %t4015, 512
  %t4020 = select i1 %t4019, i64 257, i64 1
  br label %fixmerge1112
fixslow1111:
  %t4021 = call i64 @rt_num_eq(i64 %t4015, i64 512)
  br label %fixmerge1112
fixmerge1112:
  %t4022 = phi i64 [ %t4020, %fixfast1110 ], [ %t4021, %fixslow1111 ]
  br label %merge1109
else1108:
  br label %merge1109
merge1109:
  %t4023 = phi i64 [ %t4022, %fixmerge1112 ], [ 1, %else1108 ]
  %t4024 = icmp ne i64 %t4023, 1
  br i1 %t4024, label %then1113, label %else1114
then1113:
  %t4025 = or i64 %a2, 8
  %t4026 = and i64 %t4025, 7
  %t4027 = icmp eq i64 %t4026, 0
  br i1 %t4027, label %fixfast1115, label %fixslow1116
fixfast1115:
  %t4028 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4029 = extractvalue {i64, i1} %t4028, 0
  %t4030 = extractvalue {i64, i1} %t4028, 1
  br i1 %t4030, label %fixslow1116, label %fixmerge1117
fixslow1116:
  %t4031 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1117
fixmerge1117:
  %t4032 = phi i64 [ %t4029, %fixfast1115 ], [ %t4031, %fixslow1116 ]
  %t4033 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t4034 = and i64 %t4033, -8
  %t4035 = inttoptr i64 %t4034 to ptr
  %t4036 = load i64, ptr %t4035
  %t4037 = inttoptr i64 %t4036 to ptr
  %t4038 = call fastcc i64%t4037(i64 %t4033, i64 3, i64 %a0, i64 %a1, i64 %t4032, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4039 = load i64, ptr @"scheme.base:rd-datum"
  %t4040 = and i64 %t4039, -8
  %t4041 = inttoptr i64 %t4040 to ptr
  %t4042 = load i64, ptr %t4041
  %t4043 = inttoptr i64 %t4042 to ptr
  %t4044 = call fastcc i64%t4043(i64 %t4039, i64 3, i64 %a0, i64 %a1, i64 %t4038, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4045 = call i64 @rt_intern(ptr @.str.sym.17)
  %t4046 = call i64 @rt_car(i64 %t4044)
  %t4047 = load i64, ptr @"scheme.base:list"
  %t4048 = and i64 %t4047, -8
  %t4049 = inttoptr i64 %t4048 to ptr
  %t4050 = load i64, ptr %t4049
  %t4051 = inttoptr i64 %t4050 to ptr
  %t4052 = call fastcc i64%t4051(i64 %t4047, i64 2, i64 %t4045, i64 %t4046, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4053 = call i64 @rt_cdr(i64 %t4044)
  %t4054 = call i64 @rt_cons(i64 %t4052, i64 %t4053)
  ret i64 %t4054
else1114:
  %t4055 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t4056 = and i64 %t4055, -8
  %t4057 = inttoptr i64 %t4056 to ptr
  %t4058 = load i64, ptr %t4057
  %t4059 = inttoptr i64 %t4058 to ptr
  %t4060 = call fastcc i64%t4059(i64 %t4055, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4061 = load i64, ptr @"scheme.base:rd-datum"
  %t4062 = and i64 %t4061, -8
  %t4063 = inttoptr i64 %t4062 to ptr
  %t4064 = load i64, ptr %t4063
  %t4065 = inttoptr i64 %t4064 to ptr
  %t4066 = call fastcc i64%t4065(i64 %t4061, i64 3, i64 %a0, i64 %a1, i64 %t4060, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4067 = call i64 @rt_intern(ptr @.str.sym.18)
  %t4068 = call i64 @rt_car(i64 %t4066)
  %t4069 = load i64, ptr @"scheme.base:list"
  %t4070 = and i64 %t4069, -8
  %t4071 = inttoptr i64 %t4070 to ptr
  %t4072 = load i64, ptr %t4071
  %t4073 = inttoptr i64 %t4072 to ptr
  %t4074 = call fastcc i64%t4073(i64 %t4069, i64 2, i64 %t4067, i64 %t4068, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4075 = call i64 @rt_cdr(i64 %t4066)
  %t4076 = call i64 @rt_cons(i64 %t4074, i64 %t4075)
  ret i64 %t4076
}

define fastcc i64 @"scheme.base:code:rd-dot?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4081 = icmp eq i64 %argc, 3
  br i1 %t4081, label %argok1119, label %arityerr1118
arityerr1118:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1119:
  %t4082 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t4083 = call i64 @rt_char_to_integer(i64 %t4082)
  %t4084 = or i64 %t4083, 368
  %t4085 = and i64 %t4084, 7
  %t4086 = icmp eq i64 %t4085, 0
  br i1 %t4086, label %fixfast1120, label %fixslow1121
fixfast1120:
  %t4087 = icmp eq i64 %t4083, 368
  %t4088 = select i1 %t4087, i64 257, i64 1
  br label %fixmerge1122
fixslow1121:
  %t4089 = call i64 @rt_num_eq(i64 %t4083, i64 368)
  br label %fixmerge1122
fixmerge1122:
  %t4090 = phi i64 [ %t4088, %fixfast1120 ], [ %t4089, %fixslow1121 ]
  %t4091 = icmp ne i64 %t4090, 1
  br i1 %t4091, label %then1123, label %else1124
then1123:
  %t4092 = or i64 %a2, 8
  %t4093 = and i64 %t4092, 7
  %t4094 = icmp eq i64 %t4093, 0
  br i1 %t4094, label %fixfast1125, label %fixslow1126
fixfast1125:
  %t4095 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4096 = extractvalue {i64, i1} %t4095, 0
  %t4097 = extractvalue {i64, i1} %t4095, 1
  br i1 %t4097, label %fixslow1126, label %fixmerge1127
fixslow1126:
  %t4098 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1127
fixmerge1127:
  %t4099 = phi i64 [ %t4096, %fixfast1125 ], [ %t4098, %fixslow1126 ]
  %t4100 = load i64, ptr @"scheme.base:rd-token-end"
  %t4101 = and i64 %t4100, -8
  %t4102 = inttoptr i64 %t4101 to ptr
  %t4103 = load i64, ptr %t4102
  %t4104 = inttoptr i64 %t4103 to ptr
  %t4105 = call fastcc i64%t4104(i64 %t4100, i64 3, i64 %a0, i64 %a1, i64 %t4099, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4106 = or i64 %a2, 8
  %t4107 = and i64 %t4106, 7
  %t4108 = icmp eq i64 %t4107, 0
  br i1 %t4108, label %fixfast1128, label %fixslow1129
fixfast1128:
  %t4109 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4110 = extractvalue {i64, i1} %t4109, 0
  %t4111 = extractvalue {i64, i1} %t4109, 1
  br i1 %t4111, label %fixslow1129, label %fixmerge1130
fixslow1129:
  %t4112 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1130
fixmerge1130:
  %t4113 = phi i64 [ %t4110, %fixfast1128 ], [ %t4112, %fixslow1129 ]
  %t4114 = or i64 %t4105, %t4113
  %t4115 = and i64 %t4114, 7
  %t4116 = icmp eq i64 %t4115, 0
  br i1 %t4116, label %fixfast1131, label %fixslow1132
fixfast1131:
  %t4117 = icmp eq i64 %t4105, %t4113
  %t4118 = select i1 %t4117, i64 257, i64 1
  br label %fixmerge1133
fixslow1132:
  %t4119 = call i64 @rt_num_eq(i64 %t4105, i64 %t4113)
  br label %fixmerge1133
fixmerge1133:
  %t4120 = phi i64 [ %t4118, %fixfast1131 ], [ %t4119, %fixslow1132 ]
  ret i64 %t4120
else1124:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rd-append-reverse"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4125 = icmp eq i64 %argc, 2
  br i1 %t4125, label %argok1135, label %arityerr1134
arityerr1134:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1135:
  %t4126 = call i64 @rt_null_p(i64 %a0)
  %t4127 = icmp ne i64 %t4126, 1
  br i1 %t4127, label %then1136, label %else1137
then1136:
  ret i64 %a1
else1137:
  %t4128 = call i64 @rt_cdr(i64 %a0)
  %t4129 = call i64 @rt_car(i64 %a0)
  %t4130 = call i64 @rt_cons(i64 %t4129, i64 %a1)
  %t4131 = load i64, ptr @"scheme.base:rd-append-reverse"
  %t4132 = and i64 %t4131, -8
  %t4133 = inttoptr i64 %t4132 to ptr
  %t4134 = load i64, ptr %t4133
  %t4135 = inttoptr i64 %t4134 to ptr
  %t4136 = musttail call fastcc i64 %t4135(i64 %t4131, i64 2, i64 %t4128, i64 %t4130, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4136
}

define fastcc i64 @"scheme.base:code:rd-list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4141 = icmp eq i64 %argc, 4
  br i1 %t4141, label %argok1139, label %arityerr1138
arityerr1138:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1139:
  %t4142 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t4143 = and i64 %t4142, -8
  %t4144 = inttoptr i64 %t4143 to ptr
  %t4145 = load i64, ptr %t4144
  %t4146 = inttoptr i64 %t4145 to ptr
  %t4147 = call fastcc i64%t4146(i64 %t4142, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4148 = or i64 %t4147, %a1
  %t4149 = and i64 %t4148, 7
  %t4150 = icmp eq i64 %t4149, 0
  br i1 %t4150, label %fixfast1140, label %fixslow1141
fixfast1140:
  %t4151 = icmp slt i64 %t4147, %a1
  %t4152 = select i1 %t4151, i64 257, i64 1
  br label %fixmerge1142
fixslow1141:
  %t4153 = call i64 @rt_lt(i64 %t4147, i64 %a1)
  br label %fixmerge1142
fixmerge1142:
  %t4154 = phi i64 [ %t4152, %fixfast1140 ], [ %t4153, %fixslow1141 ]
  %t4155 = icmp ne i64 %t4154, 1
  br i1 %t4155, label %then1143, label %else1144
then1143:
  %t4156 = call i64 @rt_string_ref(i64 %a0, i64 %t4147)
  %t4157 = call i64 @rt_char_to_integer(i64 %t4156)
  %t4158 = or i64 %t4157, 328
  %t4159 = and i64 %t4158, 7
  %t4160 = icmp eq i64 %t4159, 0
  br i1 %t4160, label %fixfast1145, label %fixslow1146
fixfast1145:
  %t4161 = icmp eq i64 %t4157, 328
  %t4162 = select i1 %t4161, i64 257, i64 1
  br label %fixmerge1147
fixslow1146:
  %t4163 = call i64 @rt_num_eq(i64 %t4157, i64 328)
  br label %fixmerge1147
fixmerge1147:
  %t4164 = phi i64 [ %t4162, %fixfast1145 ], [ %t4163, %fixslow1146 ]
  %t4165 = icmp ne i64 %t4164, 1
  br i1 %t4165, label %then1148, label %else1149
then1148:
  br label %merge1150
else1149:
  %t4166 = or i64 %t4157, 744
  %t4167 = and i64 %t4166, 7
  %t4168 = icmp eq i64 %t4167, 0
  br i1 %t4168, label %fixfast1151, label %fixslow1152
fixfast1151:
  %t4169 = icmp eq i64 %t4157, 744
  %t4170 = select i1 %t4169, i64 257, i64 1
  br label %fixmerge1153
fixslow1152:
  %t4171 = call i64 @rt_num_eq(i64 %t4157, i64 744)
  br label %fixmerge1153
fixmerge1153:
  %t4172 = phi i64 [ %t4170, %fixfast1151 ], [ %t4171, %fixslow1152 ]
  br label %merge1150
merge1150:
  %t4173 = phi i64 [ %t4164, %then1148 ], [ %t4172, %fixmerge1153 ]
  %t4174 = icmp ne i64 %t4173, 1
  br i1 %t4174, label %then1154, label %else1155
then1154:
  %t4175 = load i64, ptr @"scheme.base:reverse"
  %t4176 = and i64 %t4175, -8
  %t4177 = inttoptr i64 %t4176 to ptr
  %t4178 = load i64, ptr %t4177
  %t4179 = inttoptr i64 %t4178 to ptr
  %t4180 = call fastcc i64%t4179(i64 %t4175, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4181 = or i64 %t4147, 8
  %t4182 = and i64 %t4181, 7
  %t4183 = icmp eq i64 %t4182, 0
  br i1 %t4183, label %fixfast1156, label %fixslow1157
fixfast1156:
  %t4184 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4147, i64 8)
  %t4185 = extractvalue {i64, i1} %t4184, 0
  %t4186 = extractvalue {i64, i1} %t4184, 1
  br i1 %t4186, label %fixslow1157, label %fixmerge1158
fixslow1157:
  %t4187 = call i64 @rt_add(i64 %t4147, i64 8)
  br label %fixmerge1158
fixmerge1158:
  %t4188 = phi i64 [ %t4185, %fixfast1156 ], [ %t4187, %fixslow1157 ]
  %t4189 = call i64 @rt_cons(i64 %t4180, i64 %t4188)
  ret i64 %t4189
else1155:
  %t4190 = load i64, ptr @"scheme.base:rd-dot?"
  %t4191 = and i64 %t4190, -8
  %t4192 = inttoptr i64 %t4191 to ptr
  %t4193 = load i64, ptr %t4192
  %t4194 = inttoptr i64 %t4193 to ptr
  %t4195 = call fastcc i64%t4194(i64 %t4190, i64 3, i64 %a0, i64 %a1, i64 %t4147, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4196 = icmp ne i64 %t4195, 1
  br i1 %t4196, label %then1159, label %else1160
then1159:
  %t4197 = or i64 %t4147, 8
  %t4198 = and i64 %t4197, 7
  %t4199 = icmp eq i64 %t4198, 0
  br i1 %t4199, label %fixfast1161, label %fixslow1162
fixfast1161:
  %t4200 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4147, i64 8)
  %t4201 = extractvalue {i64, i1} %t4200, 0
  %t4202 = extractvalue {i64, i1} %t4200, 1
  br i1 %t4202, label %fixslow1162, label %fixmerge1163
fixslow1162:
  %t4203 = call i64 @rt_add(i64 %t4147, i64 8)
  br label %fixmerge1163
fixmerge1163:
  %t4204 = phi i64 [ %t4201, %fixfast1161 ], [ %t4203, %fixslow1162 ]
  %t4205 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t4206 = and i64 %t4205, -8
  %t4207 = inttoptr i64 %t4206 to ptr
  %t4208 = load i64, ptr %t4207
  %t4209 = inttoptr i64 %t4208 to ptr
  %t4210 = call fastcc i64%t4209(i64 %t4205, i64 3, i64 %a0, i64 %a1, i64 %t4204, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4211 = load i64, ptr @"scheme.base:rd-datum"
  %t4212 = and i64 %t4211, -8
  %t4213 = inttoptr i64 %t4212 to ptr
  %t4214 = load i64, ptr %t4213
  %t4215 = inttoptr i64 %t4214 to ptr
  %t4216 = call fastcc i64%t4215(i64 %t4211, i64 3, i64 %a0, i64 %a1, i64 %t4210, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4217 = call i64 @rt_cdr(i64 %t4216)
  %t4218 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t4219 = and i64 %t4218, -8
  %t4220 = inttoptr i64 %t4219 to ptr
  %t4221 = load i64, ptr %t4220
  %t4222 = inttoptr i64 %t4221 to ptr
  %t4223 = call fastcc i64%t4222(i64 %t4218, i64 3, i64 %a0, i64 %a1, i64 %t4217, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4224 = call i64 @rt_car(i64 %t4216)
  %t4225 = load i64, ptr @"scheme.base:rd-append-reverse"
  %t4226 = and i64 %t4225, -8
  %t4227 = inttoptr i64 %t4226 to ptr
  %t4228 = load i64, ptr %t4227
  %t4229 = inttoptr i64 %t4228 to ptr
  %t4230 = call fastcc i64%t4229(i64 %t4225, i64 2, i64 %a3, i64 %t4224, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4231 = or i64 %t4223, 8
  %t4232 = and i64 %t4231, 7
  %t4233 = icmp eq i64 %t4232, 0
  br i1 %t4233, label %fixfast1164, label %fixslow1165
fixfast1164:
  %t4234 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4223, i64 8)
  %t4235 = extractvalue {i64, i1} %t4234, 0
  %t4236 = extractvalue {i64, i1} %t4234, 1
  br i1 %t4236, label %fixslow1165, label %fixmerge1166
fixslow1165:
  %t4237 = call i64 @rt_add(i64 %t4223, i64 8)
  br label %fixmerge1166
fixmerge1166:
  %t4238 = phi i64 [ %t4235, %fixfast1164 ], [ %t4237, %fixslow1165 ]
  %t4239 = call i64 @rt_cons(i64 %t4230, i64 %t4238)
  ret i64 %t4239
else1160:
  %t4240 = load i64, ptr @"scheme.base:rd-datum"
  %t4241 = and i64 %t4240, -8
  %t4242 = inttoptr i64 %t4241 to ptr
  %t4243 = load i64, ptr %t4242
  %t4244 = inttoptr i64 %t4243 to ptr
  %t4245 = call fastcc i64%t4244(i64 %t4240, i64 3, i64 %a0, i64 %a1, i64 %t4147, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4246 = call i64 @rt_cdr(i64 %t4245)
  %t4247 = call i64 @rt_car(i64 %t4245)
  %t4248 = call i64 @rt_cons(i64 %t4247, i64 %a3)
  %t4249 = load i64, ptr @"scheme.base:rd-list"
  %t4250 = and i64 %t4249, -8
  %t4251 = inttoptr i64 %t4250 to ptr
  %t4252 = load i64, ptr %t4251
  %t4253 = inttoptr i64 %t4252 to ptr
  %t4254 = musttail call fastcc i64 %t4253(i64 %t4249, i64 4, i64 %a0, i64 %a1, i64 %t4246, i64 %t4248, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4254
else1144:
  %t4255 = load i64, ptr @"scheme.base:reverse"
  %t4256 = and i64 %t4255, -8
  %t4257 = inttoptr i64 %t4256 to ptr
  %t4258 = load i64, ptr %t4257
  %t4259 = inttoptr i64 %t4258 to ptr
  %t4260 = call fastcc i64%t4259(i64 %t4255, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4261 = call i64 @rt_cons(i64 %t4260, i64 %t4147)
  ret i64 %t4261
}

define fastcc i64 @"scheme.base:code:rd-datum"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4266 = icmp eq i64 %argc, 3
  br i1 %t4266, label %argok1168, label %arityerr1167
arityerr1167:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1168:
  %t4267 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t4268 = call i64 @rt_char_to_integer(i64 %t4267)
  %t4269 = or i64 %t4268, 320
  %t4270 = and i64 %t4269, 7
  %t4271 = icmp eq i64 %t4270, 0
  br i1 %t4271, label %fixfast1169, label %fixslow1170
fixfast1169:
  %t4272 = icmp eq i64 %t4268, 320
  %t4273 = select i1 %t4272, i64 257, i64 1
  br label %fixmerge1171
fixslow1170:
  %t4274 = call i64 @rt_num_eq(i64 %t4268, i64 320)
  br label %fixmerge1171
fixmerge1171:
  %t4275 = phi i64 [ %t4273, %fixfast1169 ], [ %t4274, %fixslow1170 ]
  %t4276 = icmp ne i64 %t4275, 1
  br i1 %t4276, label %then1172, label %else1173
then1172:
  %t4277 = or i64 %a2, 8
  %t4278 = and i64 %t4277, 7
  %t4279 = icmp eq i64 %t4278, 0
  br i1 %t4279, label %fixfast1174, label %fixslow1175
fixfast1174:
  %t4280 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4281 = extractvalue {i64, i1} %t4280, 0
  %t4282 = extractvalue {i64, i1} %t4280, 1
  br i1 %t4282, label %fixslow1175, label %fixmerge1176
fixslow1175:
  %t4283 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1176
fixmerge1176:
  %t4284 = phi i64 [ %t4281, %fixfast1174 ], [ %t4283, %fixslow1175 ]
  %t4285 = load i64, ptr @"scheme.base:rd-list"
  %t4286 = and i64 %t4285, -8
  %t4287 = inttoptr i64 %t4286 to ptr
  %t4288 = load i64, ptr %t4287
  %t4289 = inttoptr i64 %t4288 to ptr
  %t4290 = musttail call fastcc i64 %t4289(i64 %t4285, i64 4, i64 %a0, i64 %a1, i64 %t4284, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4290
else1173:
  %t4291 = or i64 %t4268, 728
  %t4292 = and i64 %t4291, 7
  %t4293 = icmp eq i64 %t4292, 0
  br i1 %t4293, label %fixfast1177, label %fixslow1178
fixfast1177:
  %t4294 = icmp eq i64 %t4268, 728
  %t4295 = select i1 %t4294, i64 257, i64 1
  br label %fixmerge1179
fixslow1178:
  %t4296 = call i64 @rt_num_eq(i64 %t4268, i64 728)
  br label %fixmerge1179
fixmerge1179:
  %t4297 = phi i64 [ %t4295, %fixfast1177 ], [ %t4296, %fixslow1178 ]
  %t4298 = icmp ne i64 %t4297, 1
  br i1 %t4298, label %then1180, label %else1181
then1180:
  %t4299 = or i64 %a2, 8
  %t4300 = and i64 %t4299, 7
  %t4301 = icmp eq i64 %t4300, 0
  br i1 %t4301, label %fixfast1182, label %fixslow1183
fixfast1182:
  %t4302 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4303 = extractvalue {i64, i1} %t4302, 0
  %t4304 = extractvalue {i64, i1} %t4302, 1
  br i1 %t4304, label %fixslow1183, label %fixmerge1184
fixslow1183:
  %t4305 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1184
fixmerge1184:
  %t4306 = phi i64 [ %t4303, %fixfast1182 ], [ %t4305, %fixslow1183 ]
  %t4307 = load i64, ptr @"scheme.base:rd-list"
  %t4308 = and i64 %t4307, -8
  %t4309 = inttoptr i64 %t4308 to ptr
  %t4310 = load i64, ptr %t4309
  %t4311 = inttoptr i64 %t4310 to ptr
  %t4312 = musttail call fastcc i64 %t4311(i64 %t4307, i64 4, i64 %a0, i64 %a1, i64 %t4306, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4312
else1181:
  %t4313 = or i64 %t4268, 312
  %t4314 = and i64 %t4313, 7
  %t4315 = icmp eq i64 %t4314, 0
  br i1 %t4315, label %fixfast1185, label %fixslow1186
fixfast1185:
  %t4316 = icmp eq i64 %t4268, 312
  %t4317 = select i1 %t4316, i64 257, i64 1
  br label %fixmerge1187
fixslow1186:
  %t4318 = call i64 @rt_num_eq(i64 %t4268, i64 312)
  br label %fixmerge1187
fixmerge1187:
  %t4319 = phi i64 [ %t4317, %fixfast1185 ], [ %t4318, %fixslow1186 ]
  %t4320 = icmp ne i64 %t4319, 1
  br i1 %t4320, label %then1188, label %else1189
then1188:
  %t4321 = or i64 %a2, 8
  %t4322 = and i64 %t4321, 7
  %t4323 = icmp eq i64 %t4322, 0
  br i1 %t4323, label %fixfast1190, label %fixslow1191
fixfast1190:
  %t4324 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4325 = extractvalue {i64, i1} %t4324, 0
  %t4326 = extractvalue {i64, i1} %t4324, 1
  br i1 %t4326, label %fixslow1191, label %fixmerge1192
fixslow1191:
  %t4327 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1192
fixmerge1192:
  %t4328 = phi i64 [ %t4325, %fixfast1190 ], [ %t4327, %fixslow1191 ]
  %t4329 = load i64, ptr @"scheme.base:rd-quote"
  %t4330 = and i64 %t4329, -8
  %t4331 = inttoptr i64 %t4330 to ptr
  %t4332 = load i64, ptr %t4331
  %t4333 = inttoptr i64 %t4332 to ptr
  %t4334 = musttail call fastcc i64 %t4333(i64 %t4329, i64 3, i64 %a0, i64 %a1, i64 %t4328, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4334
else1189:
  %t4335 = or i64 %t4268, 768
  %t4336 = and i64 %t4335, 7
  %t4337 = icmp eq i64 %t4336, 0
  br i1 %t4337, label %fixfast1193, label %fixslow1194
fixfast1193:
  %t4338 = icmp eq i64 %t4268, 768
  %t4339 = select i1 %t4338, i64 257, i64 1
  br label %fixmerge1195
fixslow1194:
  %t4340 = call i64 @rt_num_eq(i64 %t4268, i64 768)
  br label %fixmerge1195
fixmerge1195:
  %t4341 = phi i64 [ %t4339, %fixfast1193 ], [ %t4340, %fixslow1194 ]
  %t4342 = icmp ne i64 %t4341, 1
  br i1 %t4342, label %then1196, label %else1197
then1196:
  %t4343 = or i64 %a2, 8
  %t4344 = and i64 %t4343, 7
  %t4345 = icmp eq i64 %t4344, 0
  br i1 %t4345, label %fixfast1198, label %fixslow1199
fixfast1198:
  %t4346 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4347 = extractvalue {i64, i1} %t4346, 0
  %t4348 = extractvalue {i64, i1} %t4346, 1
  br i1 %t4348, label %fixslow1199, label %fixmerge1200
fixslow1199:
  %t4349 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1200
fixmerge1200:
  %t4350 = phi i64 [ %t4347, %fixfast1198 ], [ %t4349, %fixslow1199 ]
  %t4351 = load i64, ptr @"scheme.base:rd-quasi"
  %t4352 = and i64 %t4351, -8
  %t4353 = inttoptr i64 %t4352 to ptr
  %t4354 = load i64, ptr %t4353
  %t4355 = inttoptr i64 %t4354 to ptr
  %t4356 = musttail call fastcc i64 %t4355(i64 %t4351, i64 3, i64 %a0, i64 %a1, i64 %t4350, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4356
else1197:
  %t4357 = or i64 %t4268, 352
  %t4358 = and i64 %t4357, 7
  %t4359 = icmp eq i64 %t4358, 0
  br i1 %t4359, label %fixfast1201, label %fixslow1202
fixfast1201:
  %t4360 = icmp eq i64 %t4268, 352
  %t4361 = select i1 %t4360, i64 257, i64 1
  br label %fixmerge1203
fixslow1202:
  %t4362 = call i64 @rt_num_eq(i64 %t4268, i64 352)
  br label %fixmerge1203
fixmerge1203:
  %t4363 = phi i64 [ %t4361, %fixfast1201 ], [ %t4362, %fixslow1202 ]
  %t4364 = icmp ne i64 %t4363, 1
  br i1 %t4364, label %then1204, label %else1205
then1204:
  %t4365 = or i64 %a2, 8
  %t4366 = and i64 %t4365, 7
  %t4367 = icmp eq i64 %t4366, 0
  br i1 %t4367, label %fixfast1206, label %fixslow1207
fixfast1206:
  %t4368 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4369 = extractvalue {i64, i1} %t4368, 0
  %t4370 = extractvalue {i64, i1} %t4368, 1
  br i1 %t4370, label %fixslow1207, label %fixmerge1208
fixslow1207:
  %t4371 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1208
fixmerge1208:
  %t4372 = phi i64 [ %t4369, %fixfast1206 ], [ %t4371, %fixslow1207 ]
  %t4373 = load i64, ptr @"scheme.base:rd-unquote"
  %t4374 = and i64 %t4373, -8
  %t4375 = inttoptr i64 %t4374 to ptr
  %t4376 = load i64, ptr %t4375
  %t4377 = inttoptr i64 %t4376 to ptr
  %t4378 = musttail call fastcc i64 %t4377(i64 %t4373, i64 3, i64 %a0, i64 %a1, i64 %t4372, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4378
else1205:
  %t4379 = or i64 %t4268, 272
  %t4380 = and i64 %t4379, 7
  %t4381 = icmp eq i64 %t4380, 0
  br i1 %t4381, label %fixfast1209, label %fixslow1210
fixfast1209:
  %t4382 = icmp eq i64 %t4268, 272
  %t4383 = select i1 %t4382, i64 257, i64 1
  br label %fixmerge1211
fixslow1210:
  %t4384 = call i64 @rt_num_eq(i64 %t4268, i64 272)
  br label %fixmerge1211
fixmerge1211:
  %t4385 = phi i64 [ %t4383, %fixfast1209 ], [ %t4384, %fixslow1210 ]
  %t4386 = icmp ne i64 %t4385, 1
  br i1 %t4386, label %then1212, label %else1213
then1212:
  %t4387 = or i64 %a2, 8
  %t4388 = and i64 %t4387, 7
  %t4389 = icmp eq i64 %t4388, 0
  br i1 %t4389, label %fixfast1214, label %fixslow1215
fixfast1214:
  %t4390 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4391 = extractvalue {i64, i1} %t4390, 0
  %t4392 = extractvalue {i64, i1} %t4390, 1
  br i1 %t4392, label %fixslow1215, label %fixmerge1216
fixslow1215:
  %t4393 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1216
fixmerge1216:
  %t4394 = phi i64 [ %t4391, %fixfast1214 ], [ %t4393, %fixslow1215 ]
  %t4395 = load i64, ptr @"scheme.base:rd-string"
  %t4396 = and i64 %t4395, -8
  %t4397 = inttoptr i64 %t4396 to ptr
  %t4398 = load i64, ptr %t4397
  %t4399 = inttoptr i64 %t4398 to ptr
  %t4400 = musttail call fastcc i64 %t4399(i64 %t4395, i64 3, i64 %a0, i64 %a1, i64 %t4394, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4400
else1213:
  %t4401 = or i64 %t4268, 280
  %t4402 = and i64 %t4401, 7
  %t4403 = icmp eq i64 %t4402, 0
  br i1 %t4403, label %fixfast1217, label %fixslow1218
fixfast1217:
  %t4404 = icmp eq i64 %t4268, 280
  %t4405 = select i1 %t4404, i64 257, i64 1
  br label %fixmerge1219
fixslow1218:
  %t4406 = call i64 @rt_num_eq(i64 %t4268, i64 280)
  br label %fixmerge1219
fixmerge1219:
  %t4407 = phi i64 [ %t4405, %fixfast1217 ], [ %t4406, %fixslow1218 ]
  %t4408 = icmp ne i64 %t4407, 1
  br i1 %t4408, label %then1220, label %else1221
then1220:
  %t4409 = or i64 %a2, 8
  %t4410 = and i64 %t4409, 7
  %t4411 = icmp eq i64 %t4410, 0
  br i1 %t4411, label %fixfast1222, label %fixslow1223
fixfast1222:
  %t4412 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4413 = extractvalue {i64, i1} %t4412, 0
  %t4414 = extractvalue {i64, i1} %t4412, 1
  br i1 %t4414, label %fixslow1223, label %fixmerge1224
fixslow1223:
  %t4415 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1224
fixmerge1224:
  %t4416 = phi i64 [ %t4413, %fixfast1222 ], [ %t4415, %fixslow1223 ]
  %t4417 = load i64, ptr @"scheme.base:rd-hash"
  %t4418 = and i64 %t4417, -8
  %t4419 = inttoptr i64 %t4418 to ptr
  %t4420 = load i64, ptr %t4419
  %t4421 = inttoptr i64 %t4420 to ptr
  %t4422 = musttail call fastcc i64 %t4421(i64 %t4417, i64 3, i64 %a0, i64 %a1, i64 %t4416, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4422
else1221:
  %t4423 = load i64, ptr @"scheme.base:rd-atom"
  %t4424 = and i64 %t4423, -8
  %t4425 = inttoptr i64 %t4424 to ptr
  %t4426 = load i64, ptr %t4425
  %t4427 = inttoptr i64 %t4426 to ptr
  %t4428 = musttail call fastcc i64 %t4427(i64 %t4423, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4428
}

define fastcc i64 @"scheme.base:code:read-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4433 = icmp eq i64 %argc, 1
  br i1 %t4433, label %argok1226, label %arityerr1225
arityerr1225:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1226:
  %t4434 = call i64 @rt_string_length(i64 %a0)
  %t4435 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t4436 = and i64 %t4435, -8
  %t4437 = inttoptr i64 %t4436 to ptr
  %t4438 = load i64, ptr %t4437
  %t4439 = inttoptr i64 %t4438 to ptr
  %t4440 = call fastcc i64%t4439(i64 %t4435, i64 3, i64 %a0, i64 %t4434, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4441 = load i64, ptr @"scheme.base:rd-datum"
  %t4442 = and i64 %t4441, -8
  %t4443 = inttoptr i64 %t4442 to ptr
  %t4444 = load i64, ptr %t4443
  %t4445 = inttoptr i64 %t4444 to ptr
  %t4446 = call fastcc i64%t4445(i64 %t4441, i64 3, i64 %a0, i64 %t4434, i64 %t4440, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4447 = call i64 @rt_car(i64 %t4446)
  ret i64 %t4447
}

define fastcc i64 @"scheme.base:code_1017"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4452 = icmp eq i64 %argc, 2
  br i1 %t4452, label %argok1228, label %arityerr1227
arityerr1227:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1228:
  %t4453 = and i64 %self, -8
  %t4454 = inttoptr i64 %t4453 to ptr
  %t4455 = getelementptr i64, ptr %t4454, i64 1
  %t4456 = load i64, ptr %t4455
  %t4457 = or i64 %a0, %t4456
  %t4458 = and i64 %t4457, 7
  %t4459 = icmp eq i64 %t4458, 0
  br i1 %t4459, label %fixfast1229, label %fixslow1230
fixfast1229:
  %t4460 = icmp slt i64 %a0, %t4456
  %t4461 = select i1 %t4460, i64 257, i64 1
  br label %fixmerge1231
fixslow1230:
  %t4462 = call i64 @rt_lt(i64 %a0, i64 %t4456)
  br label %fixmerge1231
fixmerge1231:
  %t4463 = phi i64 [ %t4461, %fixfast1229 ], [ %t4462, %fixslow1230 ]
  %t4464 = icmp ne i64 %t4463, 1
  br i1 %t4464, label %then1232, label %else1233
then1232:
  %t4465 = and i64 %self, -8
  %t4466 = inttoptr i64 %t4465 to ptr
  %t4467 = getelementptr i64, ptr %t4466, i64 2
  %t4468 = load i64, ptr %t4467
  %t4469 = and i64 %self, -8
  %t4470 = inttoptr i64 %t4469 to ptr
  %t4471 = getelementptr i64, ptr %t4470, i64 1
  %t4472 = load i64, ptr %t4471
  %t4473 = load i64, ptr @"scheme.base:rd-datum"
  %t4474 = and i64 %t4473, -8
  %t4475 = inttoptr i64 %t4474 to ptr
  %t4476 = load i64, ptr %t4475
  %t4477 = inttoptr i64 %t4476 to ptr
  %t4478 = call fastcc i64%t4477(i64 %t4473, i64 3, i64 %t4468, i64 %t4472, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4479 = and i64 %self, -8
  %t4480 = inttoptr i64 %t4479 to ptr
  %t4481 = getelementptr i64, ptr %t4480, i64 2
  %t4482 = load i64, ptr %t4481
  %t4483 = and i64 %self, -8
  %t4484 = inttoptr i64 %t4483 to ptr
  %t4485 = getelementptr i64, ptr %t4484, i64 1
  %t4486 = load i64, ptr %t4485
  %t4487 = call i64 @rt_cdr(i64 %t4478)
  %t4488 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t4489 = and i64 %t4488, -8
  %t4490 = inttoptr i64 %t4489 to ptr
  %t4491 = load i64, ptr %t4490
  %t4492 = inttoptr i64 %t4491 to ptr
  %t4493 = call fastcc i64%t4492(i64 %t4488, i64 3, i64 %t4482, i64 %t4486, i64 %t4487, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4494 = call i64 @rt_car(i64 %t4478)
  %t4495 = call i64 @rt_cons(i64 %t4494, i64 %a1)
  %t4496 = musttail call fastcc i64 @"scheme.base:code_1017"(i64 %self, i64 2, i64 %t4493, i64 %t4495, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4496
else1233:
  %t4497 = load i64, ptr @"scheme.base:reverse"
  %t4498 = and i64 %t4497, -8
  %t4499 = inttoptr i64 %t4498 to ptr
  %t4500 = load i64, ptr %t4499
  %t4501 = inttoptr i64 %t4500 to ptr
  %t4502 = musttail call fastcc i64 %t4501(i64 %t4497, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4502
}

define fastcc i64 @"scheme.base:code:read-all-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4503 = icmp eq i64 %argc, 1
  br i1 %t4503, label %argok1235, label %arityerr1234
arityerr1234:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1235:
  %t4504 = call i64 @rt_string_length(i64 %a0)
  %t4505 = call ptr @rt_alloc_words(i64 4)
  %t4506 = ptrtoint ptr %t4505 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1017" to i64), ptr %t4505
  %t4507 = or i64 %t4506, 4
  %t4508 = getelementptr i64, ptr %t4505, i64 1
  store i64 %t4504, ptr %t4508
  %t4509 = getelementptr i64, ptr %t4505, i64 2
  store i64 %a0, ptr %t4509
  %t4510 = getelementptr i64, ptr %t4505, i64 3
  store i64 %t4507, ptr %t4510
  %t4511 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t4512 = and i64 %t4511, -8
  %t4513 = inttoptr i64 %t4512 to ptr
  %t4514 = load i64, ptr %t4513
  %t4515 = inttoptr i64 %t4514 to ptr
  %t4516 = call fastcc i64%t4515(i64 %t4511, i64 3, i64 %a0, i64 %t4504, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4517 = musttail call fastcc i64 @"scheme.base:code_1017"(i64 %t4507, i64 2, i64 %t4516, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4517
}

define fastcc i64 @"scheme.base:code:%port-rtd"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4523 = icmp eq i64 %argc, 0
  br i1 %t4523, label %argok1237, label %arityerr1236
arityerr1236:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1237:
  %t4524 = load i64, ptr @"scheme.base:%port-rtd-cell"
  %t4525 = icmp ne i64 %t4524, 1
  br i1 %t4525, label %then1238, label %else1239
then1238:
  %t4526 = load i64, ptr @"scheme.base:%port-rtd-cell"
  ret i64 %t4526
else1239:
  %t4527 = call i64 @rt_make_string(ptr @.str.lit.19, i64 4)
  %t4528 = call i64 @rt_make_record_type(i64 %t4527)
  %t4529 = call i64 @rt_root(i64 %t4528)
  store i64 %t4529, ptr @"scheme.base:%port-rtd-cell"
  %t4530 = load i64, ptr @"scheme.base:%port-rtd-cell"
  ret i64 %t4530
}

define fastcc i64 @"scheme.base:code:%make-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4535 = icmp eq i64 %argc, 6
  br i1 %t4535, label %argok1241, label %arityerr1240
arityerr1240:
  call void @rt_arity_error(i64 6, i64 %argc)
  unreachable
argok1241:
  %t4536 = load i64, ptr @"scheme.base:%port-rtd"
  %t4537 = and i64 %t4536, -8
  %t4538 = inttoptr i64 %t4537 to ptr
  %t4539 = load i64, ptr %t4538
  %t4540 = inttoptr i64 %t4539 to ptr
  %t4541 = call fastcc i64%t4540(i64 %t4536, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4542 = load i64, ptr @"scheme.base:list"
  %t4543 = and i64 %t4542, -8
  %t4544 = inttoptr i64 %t4543 to ptr
  %t4545 = load i64, ptr %t4544
  %t4546 = inttoptr i64 %t4545 to ptr
  %t4547 = call fastcc i64%t4546(i64 %t4542, i64 6, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 0, i64 0, ptr null)
  %t4548 = call i64 @rt_make_record(i64 %t4541, i64 %t4547)
  ret i64 %t4548
}

define fastcc i64 @"scheme.base:code:port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4553 = icmp eq i64 %argc, 1
  br i1 %t4553, label %argok1243, label %arityerr1242
arityerr1242:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1243:
  %t4554 = load i64, ptr @"scheme.base:%port-rtd"
  %t4555 = and i64 %t4554, -8
  %t4556 = inttoptr i64 %t4555 to ptr
  %t4557 = load i64, ptr %t4556
  %t4558 = inttoptr i64 %t4557 to ptr
  %t4559 = call fastcc i64%t4558(i64 %t4554, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4560 = call i64 @rt_record_of_type_p(i64 %a0, i64 %t4559)
  ret i64 %t4560
}

define fastcc i64 @"scheme.base:code:input-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4565 = icmp eq i64 %argc, 1
  br i1 %t4565, label %argok1245, label %arityerr1244
arityerr1244:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1245:
  %t4566 = load i64, ptr @"scheme.base:port?"
  %t4567 = and i64 %t4566, -8
  %t4568 = inttoptr i64 %t4567 to ptr
  %t4569 = load i64, ptr %t4568
  %t4570 = inttoptr i64 %t4569 to ptr
  %t4571 = call fastcc i64%t4570(i64 %t4566, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4572 = icmp ne i64 %t4571, 1
  br i1 %t4572, label %then1246, label %else1247
then1246:
  %t4573 = call i64 @rt_record_ref(i64 %a0, i64 8)
  ret i64 %t4573
else1247:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4578 = icmp eq i64 %argc, 1
  br i1 %t4578, label %argok1249, label %arityerr1248
arityerr1248:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1249:
  %t4579 = load i64, ptr @"scheme.base:port?"
  %t4580 = and i64 %t4579, -8
  %t4581 = inttoptr i64 %t4580 to ptr
  %t4582 = load i64, ptr %t4581
  %t4583 = inttoptr i64 %t4582 to ptr
  %t4584 = call fastcc i64%t4583(i64 %t4579, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4585 = icmp ne i64 %t4584, 1
  br i1 %t4585, label %then1250, label %else1251
then1250:
  %t4586 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t4587 = call i64 @rt_not(i64 %t4586)
  ret i64 %t4587
else1251:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:textual-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4592 = icmp eq i64 %argc, 1
  br i1 %t4592, label %argok1253, label %arityerr1252
arityerr1252:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1253:
  %t4593 = load i64, ptr @"scheme.base:port?"
  %t4594 = and i64 %t4593, -8
  %t4595 = inttoptr i64 %t4594 to ptr
  %t4596 = load i64, ptr %t4595
  %t4597 = inttoptr i64 %t4596 to ptr
  %t4598 = musttail call fastcc i64 %t4597(i64 %t4593, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4598
}

define fastcc i64 @"scheme.base:code:port-closed?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4603 = icmp eq i64 %argc, 1
  br i1 %t4603, label %argok1255, label %arityerr1254
arityerr1254:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1255:
  %t4604 = call i64 @rt_record_ref(i64 %a0, i64 40)
  ret i64 %t4604
}

define fastcc i64 @"scheme.base:code:input-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4609 = icmp eq i64 %argc, 1
  br i1 %t4609, label %argok1257, label %arityerr1256
arityerr1256:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1257:
  %t4610 = load i64, ptr @"scheme.base:input-port?"
  %t4611 = and i64 %t4610, -8
  %t4612 = inttoptr i64 %t4611 to ptr
  %t4613 = load i64, ptr %t4612
  %t4614 = inttoptr i64 %t4613 to ptr
  %t4615 = call fastcc i64%t4614(i64 %t4610, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4616 = icmp ne i64 %t4615, 1
  br i1 %t4616, label %then1258, label %else1259
then1258:
  %t4617 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t4618 = call i64 @rt_not(i64 %t4617)
  ret i64 %t4618
else1259:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4623 = icmp eq i64 %argc, 1
  br i1 %t4623, label %argok1261, label %arityerr1260
arityerr1260:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1261:
  %t4624 = load i64, ptr @"scheme.base:output-port?"
  %t4625 = and i64 %t4624, -8
  %t4626 = inttoptr i64 %t4625 to ptr
  %t4627 = load i64, ptr %t4626
  %t4628 = inttoptr i64 %t4627 to ptr
  %t4629 = call fastcc i64%t4628(i64 %t4624, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4630 = icmp ne i64 %t4629, 1
  br i1 %t4630, label %then1262, label %else1263
then1262:
  %t4631 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t4632 = call i64 @rt_not(i64 %t4631)
  ret i64 %t4632
else1263:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%check-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4637 = icmp eq i64 %argc, 2
  br i1 %t4637, label %argok1265, label %arityerr1264
arityerr1264:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1265:
  %t4638 = load i64, ptr @"scheme.base:input-port?"
  %t4639 = and i64 %t4638, -8
  %t4640 = inttoptr i64 %t4639 to ptr
  %t4641 = load i64, ptr %t4640
  %t4642 = inttoptr i64 %t4641 to ptr
  %t4643 = call fastcc i64%t4642(i64 %t4638, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4644 = call i64 @rt_not(i64 %t4643)
  %t4645 = icmp ne i64 %t4644, 1
  br i1 %t4645, label %then1266, label %else1267
then1266:
  %t4646 = call i64 @rt_make_string(ptr @.str.lit.20, i64 17)
  %t4647 = load i64, ptr @"scheme.base:error"
  %t4648 = and i64 %t4647, -8
  %t4649 = inttoptr i64 %t4648 to ptr
  %t4650 = load i64, ptr %t4649
  %t4651 = inttoptr i64 %t4650 to ptr
  %t4652 = musttail call fastcc i64 %t4651(i64 %t4647, i64 3, i64 %a1, i64 %t4646, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4652
else1267:
  %t4653 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t4654 = icmp ne i64 %t4653, 1
  br i1 %t4654, label %then1268, label %else1269
then1268:
  %t4655 = call i64 @rt_make_string(ptr @.str.lit.21, i64 14)
  %t4656 = load i64, ptr @"scheme.base:error"
  %t4657 = and i64 %t4656, -8
  %t4658 = inttoptr i64 %t4657 to ptr
  %t4659 = load i64, ptr %t4658
  %t4660 = inttoptr i64 %t4659 to ptr
  %t4661 = musttail call fastcc i64 %t4660(i64 %t4656, i64 3, i64 %a1, i64 %t4655, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4661
else1269:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:%check-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4666 = icmp eq i64 %argc, 2
  br i1 %t4666, label %argok1271, label %arityerr1270
arityerr1270:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1271:
  %t4667 = load i64, ptr @"scheme.base:output-port?"
  %t4668 = and i64 %t4667, -8
  %t4669 = inttoptr i64 %t4668 to ptr
  %t4670 = load i64, ptr %t4669
  %t4671 = inttoptr i64 %t4670 to ptr
  %t4672 = call fastcc i64%t4671(i64 %t4667, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4673 = call i64 @rt_not(i64 %t4672)
  %t4674 = icmp ne i64 %t4673, 1
  br i1 %t4674, label %then1272, label %else1273
then1272:
  %t4675 = call i64 @rt_make_string(ptr @.str.lit.22, i64 18)
  %t4676 = load i64, ptr @"scheme.base:error"
  %t4677 = and i64 %t4676, -8
  %t4678 = inttoptr i64 %t4677 to ptr
  %t4679 = load i64, ptr %t4678
  %t4680 = inttoptr i64 %t4679 to ptr
  %t4681 = musttail call fastcc i64 %t4680(i64 %t4676, i64 3, i64 %a1, i64 %t4675, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4681
else1273:
  %t4682 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t4683 = icmp ne i64 %t4682, 1
  br i1 %t4683, label %then1274, label %else1275
then1274:
  %t4684 = call i64 @rt_make_string(ptr @.str.lit.23, i64 14)
  %t4685 = load i64, ptr @"scheme.base:error"
  %t4686 = and i64 %t4685, -8
  %t4687 = inttoptr i64 %t4686 to ptr
  %t4688 = load i64, ptr %t4687
  %t4689 = inttoptr i64 %t4688 to ptr
  %t4690 = musttail call fastcc i64 %t4689(i64 %t4685, i64 3, i64 %a1, i64 %t4684, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4690
else1275:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:%port-buf"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4695 = icmp eq i64 %argc, 1
  br i1 %t4695, label %argok1277, label %arityerr1276
arityerr1276:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1277:
  %t4696 = call i64 @rt_record_ref(i64 %a0, i64 16)
  %t4697 = icmp ne i64 %t4696, 1
  br i1 %t4697, label %then1278, label %else1279
then1278:
  ret i64 %t4696
else1279:
  %t4698 = call i64 @rt_read_all_stdin()
  %t4699 = call i64 @rt_record_set(i64 %a0, i64 16, i64 %t4698)
  ret i64 %t4698
}

define fastcc i64 @"scheme.base:code:open-input-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4704 = icmp eq i64 %argc, 1
  br i1 %t4704, label %argok1281, label %arityerr1280
arityerr1280:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1281:
  %t4705 = load i64, ptr @"scheme.base:%make-port"
  %t4706 = and i64 %t4705, -8
  %t4707 = inttoptr i64 %t4706 to ptr
  %t4708 = load i64, ptr %t4707
  %t4709 = inttoptr i64 %t4708 to ptr
  %t4710 = musttail call fastcc i64 %t4709(i64 %t4705, i64 6, i64 1, i64 257, i64 %a0, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t4710
}

define fastcc i64 @"scheme.base:code:open-input-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4715 = icmp eq i64 %argc, 1
  br i1 %t4715, label %argok1283, label %arityerr1282
arityerr1282:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1283:
  %t4716 = call i64 @rt_read_file(i64 %a0)
  %t4717 = icmp ne i64 %t4716, 1
  br i1 %t4717, label %then1284, label %else1285
then1284:
  %t4718 = load i64, ptr @"scheme.base:%make-port"
  %t4719 = and i64 %t4718, -8
  %t4720 = inttoptr i64 %t4719 to ptr
  %t4721 = load i64, ptr %t4720
  %t4722 = inttoptr i64 %t4721 to ptr
  %t4723 = musttail call fastcc i64 %t4722(i64 %t4718, i64 6, i64 1, i64 257, i64 %t4716, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t4723
else1285:
  %t4724 = call i64 @rt_intern(ptr @.str.sym.24)
  %t4725 = call i64 @rt_make_string(ptr @.str.lit.25, i64 26)
  %t4726 = load i64, ptr @"scheme.base:error"
  %t4727 = and i64 %t4726, -8
  %t4728 = inttoptr i64 %t4727 to ptr
  %t4729 = load i64, ptr %t4728
  %t4730 = inttoptr i64 %t4729 to ptr
  %t4731 = musttail call fastcc i64 %t4730(i64 %t4726, i64 3, i64 %t4724, i64 %t4725, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4731
}

define fastcc i64 @"scheme.base:code:%port-at-eof?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4736 = icmp eq i64 %argc, 1
  br i1 %t4736, label %argok1287, label %arityerr1286
arityerr1286:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1287:
  %t4737 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t4738 = load i64, ptr @"scheme.base:%port-buf"
  %t4739 = and i64 %t4738, -8
  %t4740 = inttoptr i64 %t4739 to ptr
  %t4741 = load i64, ptr %t4740
  %t4742 = inttoptr i64 %t4741 to ptr
  %t4743 = call fastcc i64%t4742(i64 %t4738, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4744 = call i64 @rt_string_length(i64 %t4743)
  %t4745 = or i64 %t4744, %t4737
  %t4746 = and i64 %t4745, 7
  %t4747 = icmp eq i64 %t4746, 0
  br i1 %t4747, label %fixfast1288, label %fixslow1289
fixfast1288:
  %t4748 = icmp slt i64 %t4744, %t4737
  %t4749 = select i1 %t4748, i64 257, i64 1
  br label %fixmerge1290
fixslow1289:
  %t4750 = call i64 @rt_lt(i64 %t4744, i64 %t4737)
  br label %fixmerge1290
fixmerge1290:
  %t4751 = phi i64 [ %t4749, %fixfast1288 ], [ %t4750, %fixslow1289 ]
  %t4752 = icmp ne i64 %t4751, 1
  br i1 %t4752, label %then1291, label %else1292
then1291:
  ret i64 257
else1292:
  %t4753 = or i64 %t4737, %t4744
  %t4754 = and i64 %t4753, 7
  %t4755 = icmp eq i64 %t4754, 0
  br i1 %t4755, label %fixfast1293, label %fixslow1294
fixfast1293:
  %t4756 = icmp eq i64 %t4737, %t4744
  %t4757 = select i1 %t4756, i64 257, i64 1
  br label %fixmerge1295
fixslow1294:
  %t4758 = call i64 @rt_num_eq(i64 %t4737, i64 %t4744)
  br label %fixmerge1295
fixmerge1295:
  %t4759 = phi i64 [ %t4757, %fixfast1293 ], [ %t4758, %fixslow1294 ]
  ret i64 %t4759
}

define fastcc i64 @"scheme.base:code:read-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4764 = icmp eq i64 %argc, 1
  br i1 %t4764, label %argok1297, label %arityerr1296
arityerr1296:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1297:
  %t4765 = call i64 @rt_intern(ptr @.str.sym.26)
  %t4766 = load i64, ptr @"scheme.base:%check-input-port"
  %t4767 = and i64 %t4766, -8
  %t4768 = inttoptr i64 %t4767 to ptr
  %t4769 = load i64, ptr %t4768
  %t4770 = inttoptr i64 %t4769 to ptr
  %t4771 = call fastcc i64%t4770(i64 %t4766, i64 2, i64 %a0, i64 %t4765, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4772 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t4773 = and i64 %t4772, -8
  %t4774 = inttoptr i64 %t4773 to ptr
  %t4775 = load i64, ptr %t4774
  %t4776 = inttoptr i64 %t4775 to ptr
  %t4777 = call fastcc i64%t4776(i64 %t4772, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4778 = icmp ne i64 %t4777, 1
  br i1 %t4778, label %then1298, label %else1299
then1298:
  %t4779 = call i64 @rt_eof_object()
  ret i64 %t4779
else1299:
  %t4780 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t4781 = or i64 %t4780, 8
  %t4782 = and i64 %t4781, 7
  %t4783 = icmp eq i64 %t4782, 0
  br i1 %t4783, label %fixfast1300, label %fixslow1301
fixfast1300:
  %t4784 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4780, i64 8)
  %t4785 = extractvalue {i64, i1} %t4784, 0
  %t4786 = extractvalue {i64, i1} %t4784, 1
  br i1 %t4786, label %fixslow1301, label %fixmerge1302
fixslow1301:
  %t4787 = call i64 @rt_add(i64 %t4780, i64 8)
  br label %fixmerge1302
fixmerge1302:
  %t4788 = phi i64 [ %t4785, %fixfast1300 ], [ %t4787, %fixslow1301 ]
  %t4789 = call i64 @rt_record_set(i64 %a0, i64 24, i64 %t4788)
  %t4790 = load i64, ptr @"scheme.base:%port-buf"
  %t4791 = and i64 %t4790, -8
  %t4792 = inttoptr i64 %t4791 to ptr
  %t4793 = load i64, ptr %t4792
  %t4794 = inttoptr i64 %t4793 to ptr
  %t4795 = call fastcc i64%t4794(i64 %t4790, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4796 = call i64 @rt_string_ref(i64 %t4795, i64 %t4780)
  ret i64 %t4796
}

define fastcc i64 @"scheme.base:code:peek-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4801 = icmp eq i64 %argc, 1
  br i1 %t4801, label %argok1304, label %arityerr1303
arityerr1303:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1304:
  %t4802 = call i64 @rt_intern(ptr @.str.sym.27)
  %t4803 = load i64, ptr @"scheme.base:%check-input-port"
  %t4804 = and i64 %t4803, -8
  %t4805 = inttoptr i64 %t4804 to ptr
  %t4806 = load i64, ptr %t4805
  %t4807 = inttoptr i64 %t4806 to ptr
  %t4808 = call fastcc i64%t4807(i64 %t4803, i64 2, i64 %a0, i64 %t4802, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4809 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t4810 = and i64 %t4809, -8
  %t4811 = inttoptr i64 %t4810 to ptr
  %t4812 = load i64, ptr %t4811
  %t4813 = inttoptr i64 %t4812 to ptr
  %t4814 = call fastcc i64%t4813(i64 %t4809, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4815 = icmp ne i64 %t4814, 1
  br i1 %t4815, label %then1305, label %else1306
then1305:
  %t4816 = call i64 @rt_eof_object()
  ret i64 %t4816
else1306:
  %t4817 = load i64, ptr @"scheme.base:%port-buf"
  %t4818 = and i64 %t4817, -8
  %t4819 = inttoptr i64 %t4818 to ptr
  %t4820 = load i64, ptr %t4819
  %t4821 = inttoptr i64 %t4820 to ptr
  %t4822 = call fastcc i64%t4821(i64 %t4817, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4823 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t4824 = call i64 @rt_string_ref(i64 %t4822, i64 %t4823)
  ret i64 %t4824
}

define fastcc i64 @"scheme.base:code_1079"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4829 = icmp eq i64 %argc, 1
  br i1 %t4829, label %argok1308, label %arityerr1307
arityerr1307:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1308:
  %t4830 = and i64 %self, -8
  %t4831 = inttoptr i64 %t4830 to ptr
  %t4832 = getelementptr i64, ptr %t4831, i64 1
  %t4833 = load i64, ptr %t4832
  %t4834 = or i64 %t4833, %a0
  %t4835 = and i64 %t4834, 7
  %t4836 = icmp eq i64 %t4835, 0
  br i1 %t4836, label %fixfast1309, label %fixslow1310
fixfast1309:
  %t4837 = icmp slt i64 %t4833, %a0
  %t4838 = select i1 %t4837, i64 257, i64 1
  br label %fixmerge1311
fixslow1310:
  %t4839 = call i64 @rt_lt(i64 %t4833, i64 %a0)
  br label %fixmerge1311
fixmerge1311:
  %t4840 = phi i64 [ %t4838, %fixfast1309 ], [ %t4839, %fixslow1310 ]
  %t4841 = icmp ne i64 %t4840, 1
  br i1 %t4841, label %then1312, label %else1313
then1312:
  br label %merge1314
else1313:
  %t4842 = or i64 %a0, %t4833
  %t4843 = and i64 %t4842, 7
  %t4844 = icmp eq i64 %t4843, 0
  br i1 %t4844, label %fixfast1315, label %fixslow1316
fixfast1315:
  %t4845 = icmp eq i64 %a0, %t4833
  %t4846 = select i1 %t4845, i64 257, i64 1
  br label %fixmerge1317
fixslow1316:
  %t4847 = call i64 @rt_num_eq(i64 %a0, i64 %t4833)
  br label %fixmerge1317
fixmerge1317:
  %t4848 = phi i64 [ %t4846, %fixfast1315 ], [ %t4847, %fixslow1316 ]
  br label %merge1314
merge1314:
  %t4849 = phi i64 [ 257, %then1312 ], [ %t4848, %fixmerge1317 ]
  %t4850 = icmp ne i64 %t4849, 1
  br i1 %t4850, label %then1318, label %else1319
then1318:
  %t4851 = and i64 %self, -8
  %t4852 = inttoptr i64 %t4851 to ptr
  %t4853 = getelementptr i64, ptr %t4852, i64 2
  %t4854 = load i64, ptr %t4853
  %t4855 = call i64 @rt_record_ref(i64 %t4854, i64 24)
  %t4856 = and i64 %self, -8
  %t4857 = inttoptr i64 %t4856 to ptr
  %t4858 = getelementptr i64, ptr %t4857, i64 2
  %t4859 = load i64, ptr %t4858
  %t4860 = and i64 %self, -8
  %t4861 = inttoptr i64 %t4860 to ptr
  %t4862 = getelementptr i64, ptr %t4861, i64 1
  %t4863 = load i64, ptr %t4862
  %t4864 = call i64 @rt_record_set(i64 %t4859, i64 24, i64 %t4863)
  %t4865 = and i64 %self, -8
  %t4866 = inttoptr i64 %t4865 to ptr
  %t4867 = getelementptr i64, ptr %t4866, i64 3
  %t4868 = load i64, ptr %t4867
  %t4869 = and i64 %self, -8
  %t4870 = inttoptr i64 %t4869 to ptr
  %t4871 = getelementptr i64, ptr %t4870, i64 1
  %t4872 = load i64, ptr %t4871
  %t4873 = call i64 @rt_substring(i64 %t4868, i64 %t4855, i64 %t4872)
  ret i64 %t4873
else1319:
  %t4874 = and i64 %self, -8
  %t4875 = inttoptr i64 %t4874 to ptr
  %t4876 = getelementptr i64, ptr %t4875, i64 3
  %t4877 = load i64, ptr %t4876
  %t4878 = call i64 @rt_string_ref(i64 %t4877, i64 %a0)
  %t4879 = load i64, ptr @"scheme.base:char=?"
  %t4880 = and i64 %t4879, -8
  %t4881 = inttoptr i64 %t4880 to ptr
  %t4882 = load i64, ptr %t4881
  %t4883 = inttoptr i64 %t4882 to ptr
  %t4884 = call fastcc i64%t4883(i64 %t4879, i64 2, i64 %t4878, i64 2569, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4885 = icmp ne i64 %t4884, 1
  br i1 %t4885, label %then1320, label %else1321
then1320:
  %t4886 = and i64 %self, -8
  %t4887 = inttoptr i64 %t4886 to ptr
  %t4888 = getelementptr i64, ptr %t4887, i64 2
  %t4889 = load i64, ptr %t4888
  %t4890 = call i64 @rt_record_ref(i64 %t4889, i64 24)
  %t4891 = and i64 %self, -8
  %t4892 = inttoptr i64 %t4891 to ptr
  %t4893 = getelementptr i64, ptr %t4892, i64 2
  %t4894 = load i64, ptr %t4893
  %t4895 = or i64 %a0, 8
  %t4896 = and i64 %t4895, 7
  %t4897 = icmp eq i64 %t4896, 0
  br i1 %t4897, label %fixfast1322, label %fixslow1323
fixfast1322:
  %t4898 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4899 = extractvalue {i64, i1} %t4898, 0
  %t4900 = extractvalue {i64, i1} %t4898, 1
  br i1 %t4900, label %fixslow1323, label %fixmerge1324
fixslow1323:
  %t4901 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1324
fixmerge1324:
  %t4902 = phi i64 [ %t4899, %fixfast1322 ], [ %t4901, %fixslow1323 ]
  %t4903 = call i64 @rt_record_set(i64 %t4894, i64 24, i64 %t4902)
  %t4904 = and i64 %self, -8
  %t4905 = inttoptr i64 %t4904 to ptr
  %t4906 = getelementptr i64, ptr %t4905, i64 3
  %t4907 = load i64, ptr %t4906
  %t4908 = call i64 @rt_substring(i64 %t4907, i64 %t4890, i64 %a0)
  ret i64 %t4908
else1321:
  %t4909 = or i64 %a0, 8
  %t4910 = and i64 %t4909, 7
  %t4911 = icmp eq i64 %t4910, 0
  br i1 %t4911, label %fixfast1325, label %fixslow1326
fixfast1325:
  %t4912 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4913 = extractvalue {i64, i1} %t4912, 0
  %t4914 = extractvalue {i64, i1} %t4912, 1
  br i1 %t4914, label %fixslow1326, label %fixmerge1327
fixslow1326:
  %t4915 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1327
fixmerge1327:
  %t4916 = phi i64 [ %t4913, %fixfast1325 ], [ %t4915, %fixslow1326 ]
  %t4917 = musttail call fastcc i64 @"scheme.base:code_1079"(i64 %self, i64 1, i64 %t4916, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4917
}

define fastcc i64 @"scheme.base:code:read-line"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4918 = icmp eq i64 %argc, 1
  br i1 %t4918, label %argok1329, label %arityerr1328
arityerr1328:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1329:
  %t4919 = call i64 @rt_intern(ptr @.str.sym.28)
  %t4920 = load i64, ptr @"scheme.base:%check-input-port"
  %t4921 = and i64 %t4920, -8
  %t4922 = inttoptr i64 %t4921 to ptr
  %t4923 = load i64, ptr %t4922
  %t4924 = inttoptr i64 %t4923 to ptr
  %t4925 = call fastcc i64%t4924(i64 %t4920, i64 2, i64 %a0, i64 %t4919, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4926 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t4927 = and i64 %t4926, -8
  %t4928 = inttoptr i64 %t4927 to ptr
  %t4929 = load i64, ptr %t4928
  %t4930 = inttoptr i64 %t4929 to ptr
  %t4931 = call fastcc i64%t4930(i64 %t4926, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4932 = icmp ne i64 %t4931, 1
  br i1 %t4932, label %then1330, label %else1331
then1330:
  %t4933 = call i64 @rt_eof_object()
  ret i64 %t4933
else1331:
  %t4934 = load i64, ptr @"scheme.base:%port-buf"
  %t4935 = and i64 %t4934, -8
  %t4936 = inttoptr i64 %t4935 to ptr
  %t4937 = load i64, ptr %t4936
  %t4938 = inttoptr i64 %t4937 to ptr
  %t4939 = call fastcc i64%t4938(i64 %t4934, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4940 = call i64 @rt_string_length(i64 %t4939)
  %t4941 = call ptr @rt_alloc_words(i64 5)
  %t4942 = ptrtoint ptr %t4941 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1079" to i64), ptr %t4941
  %t4943 = or i64 %t4942, 4
  %t4944 = getelementptr i64, ptr %t4941, i64 1
  store i64 %t4940, ptr %t4944
  %t4945 = getelementptr i64, ptr %t4941, i64 2
  store i64 %a0, ptr %t4945
  %t4946 = getelementptr i64, ptr %t4941, i64 3
  store i64 %t4939, ptr %t4946
  %t4947 = getelementptr i64, ptr %t4941, i64 4
  store i64 %t4943, ptr %t4947
  %t4948 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t4949 = musttail call fastcc i64 @"scheme.base:code_1079"(i64 %t4943, i64 1, i64 %t4948, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4949
}

define fastcc i64 @"scheme.base:code:read-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4954 = icmp eq i64 %argc, 2
  br i1 %t4954, label %argok1333, label %arityerr1332
arityerr1332:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1333:
  %t4955 = call i64 @rt_intern(ptr @.str.sym.29)
  %t4956 = load i64, ptr @"scheme.base:%check-input-port"
  %t4957 = and i64 %t4956, -8
  %t4958 = inttoptr i64 %t4957 to ptr
  %t4959 = load i64, ptr %t4958
  %t4960 = inttoptr i64 %t4959 to ptr
  %t4961 = call fastcc i64%t4960(i64 %t4956, i64 2, i64 %a1, i64 %t4955, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4962 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t4963 = and i64 %t4962, -8
  %t4964 = inttoptr i64 %t4963 to ptr
  %t4965 = load i64, ptr %t4964
  %t4966 = inttoptr i64 %t4965 to ptr
  %t4967 = call fastcc i64%t4966(i64 %t4962, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4968 = icmp ne i64 %t4967, 1
  br i1 %t4968, label %then1334, label %else1335
then1334:
  %t4969 = call i64 @rt_eof_object()
  ret i64 %t4969
else1335:
  %t4970 = load i64, ptr @"scheme.base:%port-buf"
  %t4971 = and i64 %t4970, -8
  %t4972 = inttoptr i64 %t4971 to ptr
  %t4973 = load i64, ptr %t4972
  %t4974 = inttoptr i64 %t4973 to ptr
  %t4975 = call fastcc i64%t4974(i64 %t4970, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4976 = call i64 @rt_string_length(i64 %t4975)
  %t4977 = call i64 @rt_record_ref(i64 %a1, i64 24)
  %t4978 = or i64 %t4977, %a0
  %t4979 = and i64 %t4978, 7
  %t4980 = icmp eq i64 %t4979, 0
  br i1 %t4980, label %fixfast1336, label %fixslow1337
fixfast1336:
  %t4981 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4977, i64 %a0)
  %t4982 = extractvalue {i64, i1} %t4981, 0
  %t4983 = extractvalue {i64, i1} %t4981, 1
  br i1 %t4983, label %fixslow1337, label %fixmerge1338
fixslow1337:
  %t4984 = call i64 @rt_add(i64 %t4977, i64 %a0)
  br label %fixmerge1338
fixmerge1338:
  %t4985 = phi i64 [ %t4982, %fixfast1336 ], [ %t4984, %fixslow1337 ]
  %t4986 = or i64 %t4976, %t4985
  %t4987 = and i64 %t4986, 7
  %t4988 = icmp eq i64 %t4987, 0
  br i1 %t4988, label %fixfast1339, label %fixslow1340
fixfast1339:
  %t4989 = icmp slt i64 %t4976, %t4985
  %t4990 = select i1 %t4989, i64 257, i64 1
  br label %fixmerge1341
fixslow1340:
  %t4991 = call i64 @rt_lt(i64 %t4976, i64 %t4985)
  br label %fixmerge1341
fixmerge1341:
  %t4992 = phi i64 [ %t4990, %fixfast1339 ], [ %t4991, %fixslow1340 ]
  %t4993 = icmp ne i64 %t4992, 1
  br i1 %t4993, label %then1342, label %else1343
then1342:
  br label %merge1344
else1343:
  %t4994 = or i64 %t4977, %a0
  %t4995 = and i64 %t4994, 7
  %t4996 = icmp eq i64 %t4995, 0
  br i1 %t4996, label %fixfast1345, label %fixslow1346
fixfast1345:
  %t4997 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4977, i64 %a0)
  %t4998 = extractvalue {i64, i1} %t4997, 0
  %t4999 = extractvalue {i64, i1} %t4997, 1
  br i1 %t4999, label %fixslow1346, label %fixmerge1347
fixslow1346:
  %t5000 = call i64 @rt_add(i64 %t4977, i64 %a0)
  br label %fixmerge1347
fixmerge1347:
  %t5001 = phi i64 [ %t4998, %fixfast1345 ], [ %t5000, %fixslow1346 ]
  br label %merge1344
merge1344:
  %t5002 = phi i64 [ %t4976, %then1342 ], [ %t5001, %fixmerge1347 ]
  %t5003 = call i64 @rt_record_set(i64 %a1, i64 24, i64 %t5002)
  %t5004 = call i64 @rt_substring(i64 %t4975, i64 %t4977, i64 %t5002)
  ret i64 %t5004
}

define fastcc i64 @"scheme.base:code:read"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5009 = icmp eq i64 %argc, 1
  br i1 %t5009, label %argok1349, label %arityerr1348
arityerr1348:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1349:
  %t5010 = call i64 @rt_intern(ptr @.str.sym.30)
  %t5011 = load i64, ptr @"scheme.base:%check-input-port"
  %t5012 = and i64 %t5011, -8
  %t5013 = inttoptr i64 %t5012 to ptr
  %t5014 = load i64, ptr %t5013
  %t5015 = inttoptr i64 %t5014 to ptr
  %t5016 = call fastcc i64%t5015(i64 %t5011, i64 2, i64 %a0, i64 %t5010, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5017 = load i64, ptr @"scheme.base:%port-buf"
  %t5018 = and i64 %t5017, -8
  %t5019 = inttoptr i64 %t5018 to ptr
  %t5020 = load i64, ptr %t5019
  %t5021 = inttoptr i64 %t5020 to ptr
  %t5022 = call fastcc i64%t5021(i64 %t5017, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5023 = call i64 @rt_string_length(i64 %t5022)
  %t5024 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t5025 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t5026 = and i64 %t5025, -8
  %t5027 = inttoptr i64 %t5026 to ptr
  %t5028 = load i64, ptr %t5027
  %t5029 = inttoptr i64 %t5028 to ptr
  %t5030 = call fastcc i64%t5029(i64 %t5025, i64 3, i64 %t5022, i64 %t5023, i64 %t5024, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5031 = or i64 %t5023, %t5030
  %t5032 = and i64 %t5031, 7
  %t5033 = icmp eq i64 %t5032, 0
  br i1 %t5033, label %fixfast1350, label %fixslow1351
fixfast1350:
  %t5034 = icmp slt i64 %t5023, %t5030
  %t5035 = select i1 %t5034, i64 257, i64 1
  br label %fixmerge1352
fixslow1351:
  %t5036 = call i64 @rt_lt(i64 %t5023, i64 %t5030)
  br label %fixmerge1352
fixmerge1352:
  %t5037 = phi i64 [ %t5035, %fixfast1350 ], [ %t5036, %fixslow1351 ]
  %t5038 = icmp ne i64 %t5037, 1
  br i1 %t5038, label %then1353, label %else1354
then1353:
  br label %merge1355
else1354:
  %t5039 = or i64 %t5030, %t5023
  %t5040 = and i64 %t5039, 7
  %t5041 = icmp eq i64 %t5040, 0
  br i1 %t5041, label %fixfast1356, label %fixslow1357
fixfast1356:
  %t5042 = icmp eq i64 %t5030, %t5023
  %t5043 = select i1 %t5042, i64 257, i64 1
  br label %fixmerge1358
fixslow1357:
  %t5044 = call i64 @rt_num_eq(i64 %t5030, i64 %t5023)
  br label %fixmerge1358
fixmerge1358:
  %t5045 = phi i64 [ %t5043, %fixfast1356 ], [ %t5044, %fixslow1357 ]
  br label %merge1355
merge1355:
  %t5046 = phi i64 [ 257, %then1353 ], [ %t5045, %fixmerge1358 ]
  %t5047 = icmp ne i64 %t5046, 1
  br i1 %t5047, label %then1359, label %else1360
then1359:
  %t5048 = call i64 @rt_record_set(i64 %a0, i64 24, i64 %t5023)
  %t5049 = call i64 @rt_eof_object()
  ret i64 %t5049
else1360:
  %t5050 = load i64, ptr @"scheme.base:rd-datum"
  %t5051 = and i64 %t5050, -8
  %t5052 = inttoptr i64 %t5051 to ptr
  %t5053 = load i64, ptr %t5052
  %t5054 = inttoptr i64 %t5053 to ptr
  %t5055 = call fastcc i64%t5054(i64 %t5050, i64 3, i64 %t5022, i64 %t5023, i64 %t5030, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5056 = call i64 @rt_cdr(i64 %t5055)
  %t5057 = call i64 @rt_record_set(i64 %a0, i64 24, i64 %t5056)
  %t5058 = call i64 @rt_car(i64 %t5055)
  ret i64 %t5058
}

define fastcc i64 @"scheme.base:code:open-output-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5063 = icmp eq i64 %argc, 1
  br i1 %t5063, label %argok1362, label %arityerr1361
arityerr1361:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1362:
  %t5064 = call i64 @rt_port_open_output_file(i64 %a0)
  %t5065 = icmp ne i64 %t5064, 1
  br i1 %t5065, label %then1363, label %else1364
then1363:
  %t5066 = load i64, ptr @"scheme.base:%make-port"
  %t5067 = and i64 %t5066, -8
  %t5068 = inttoptr i64 %t5067 to ptr
  %t5069 = load i64, ptr %t5068
  %t5070 = inttoptr i64 %t5069 to ptr
  %t5071 = musttail call fastcc i64 %t5070(i64 %t5066, i64 6, i64 %t5064, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t5071
else1364:
  %t5072 = call i64 @rt_intern(ptr @.str.sym.31)
  %t5073 = call i64 @rt_make_string(ptr @.str.lit.32, i64 27)
  %t5074 = load i64, ptr @"scheme.base:error"
  %t5075 = and i64 %t5074, -8
  %t5076 = inttoptr i64 %t5075 to ptr
  %t5077 = load i64, ptr %t5076
  %t5078 = inttoptr i64 %t5077 to ptr
  %t5079 = musttail call fastcc i64 %t5078(i64 %t5074, i64 3, i64 %t5072, i64 %t5073, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5079
}

define fastcc i64 @"scheme.base:code:open-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5084 = icmp eq i64 %argc, 0
  br i1 %t5084, label %argok1366, label %arityerr1365
arityerr1365:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1366:
  %t5085 = call i64 @rt_port_open_output_string()
  %t5086 = icmp ne i64 %t5085, 1
  br i1 %t5086, label %then1367, label %else1368
then1367:
  %t5087 = load i64, ptr @"scheme.base:%make-port"
  %t5088 = and i64 %t5087, -8
  %t5089 = inttoptr i64 %t5088 to ptr
  %t5090 = load i64, ptr %t5089
  %t5091 = inttoptr i64 %t5090 to ptr
  %t5092 = musttail call fastcc i64 %t5091(i64 %t5087, i64 6, i64 %t5085, i64 1, i64 1, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t5092
else1368:
  %t5093 = call i64 @rt_intern(ptr @.str.sym.33)
  %t5094 = call i64 @rt_make_string(ptr @.str.lit.34, i64 33)
  %t5095 = load i64, ptr @"scheme.base:error"
  %t5096 = and i64 %t5095, -8
  %t5097 = inttoptr i64 %t5096 to ptr
  %t5098 = load i64, ptr %t5097
  %t5099 = inttoptr i64 %t5098 to ptr
  %t5100 = musttail call fastcc i64 %t5099(i64 %t5095, i64 2, i64 %t5093, i64 %t5094, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5100
}

define fastcc i64 @"scheme.base:code:get-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5105 = icmp eq i64 %argc, 1
  br i1 %t5105, label %argok1370, label %arityerr1369
arityerr1369:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1370:
  %t5106 = load i64, ptr @"scheme.base:output-port?"
  %t5107 = and i64 %t5106, -8
  %t5108 = inttoptr i64 %t5107 to ptr
  %t5109 = load i64, ptr %t5108
  %t5110 = inttoptr i64 %t5109 to ptr
  %t5111 = call fastcc i64%t5110(i64 %t5106, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5112 = call i64 @rt_not(i64 %t5111)
  %t5113 = icmp ne i64 %t5112, 1
  br i1 %t5113, label %then1371, label %else1372
then1371:
  %t5114 = call i64 @rt_intern(ptr @.str.sym.35)
  %t5115 = call i64 @rt_make_string(ptr @.str.lit.36, i64 18)
  %t5116 = load i64, ptr @"scheme.base:error"
  %t5117 = and i64 %t5116, -8
  %t5118 = inttoptr i64 %t5117 to ptr
  %t5119 = load i64, ptr %t5118
  %t5120 = inttoptr i64 %t5119 to ptr
  %t5121 = musttail call fastcc i64 %t5120(i64 %t5116, i64 3, i64 %t5114, i64 %t5115, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5121
else1372:
  %t5122 = call i64 @rt_record_ref(i64 %a0, i64 32)
  %t5123 = call i64 @rt_not(i64 %t5122)
  %t5124 = icmp ne i64 %t5123, 1
  br i1 %t5124, label %then1373, label %else1374
then1373:
  %t5125 = call i64 @rt_intern(ptr @.str.sym.35)
  %t5126 = call i64 @rt_make_string(ptr @.str.lit.37, i64 17)
  %t5127 = load i64, ptr @"scheme.base:error"
  %t5128 = and i64 %t5127, -8
  %t5129 = inttoptr i64 %t5128 to ptr
  %t5130 = load i64, ptr %t5129
  %t5131 = inttoptr i64 %t5130 to ptr
  %t5132 = musttail call fastcc i64 %t5131(i64 %t5127, i64 3, i64 %t5125, i64 %t5126, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5132
else1374:
  %t5133 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t5134 = call i64 @rt_port_get_output_string(i64 %t5133)
  ret i64 %t5134
}

define fastcc i64 @"scheme.base:code:flush-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5139 = icmp eq i64 %argc, 1
  br i1 %t5139, label %argok1376, label %arityerr1375
arityerr1375:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1376:
  %t5140 = call i64 @rt_intern(ptr @.str.sym.38)
  %t5141 = load i64, ptr @"scheme.base:%check-output-port"
  %t5142 = and i64 %t5141, -8
  %t5143 = inttoptr i64 %t5142 to ptr
  %t5144 = load i64, ptr %t5143
  %t5145 = inttoptr i64 %t5144 to ptr
  %t5146 = call fastcc i64%t5145(i64 %t5141, i64 2, i64 %a0, i64 %t5140, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5147 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t5148 = call i64 @rt_port_flush(i64 %t5147)
  ret i64 %t5148
}

define fastcc i64 @"scheme.base:code:close-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5153 = icmp eq i64 %argc, 1
  br i1 %t5153, label %argok1378, label %arityerr1377
arityerr1377:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1378:
  %t5154 = load i64, ptr @"scheme.base:port?"
  %t5155 = and i64 %t5154, -8
  %t5156 = inttoptr i64 %t5155 to ptr
  %t5157 = load i64, ptr %t5156
  %t5158 = inttoptr i64 %t5157 to ptr
  %t5159 = call fastcc i64%t5158(i64 %t5154, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5160 = call i64 @rt_not(i64 %t5159)
  %t5161 = icmp ne i64 %t5160, 1
  br i1 %t5161, label %then1379, label %else1380
then1379:
  %t5162 = call i64 @rt_intern(ptr @.str.sym.39)
  %t5163 = call i64 @rt_make_string(ptr @.str.lit.40, i64 10)
  %t5164 = load i64, ptr @"scheme.base:error"
  %t5165 = and i64 %t5164, -8
  %t5166 = inttoptr i64 %t5165 to ptr
  %t5167 = load i64, ptr %t5166
  %t5168 = inttoptr i64 %t5167 to ptr
  %t5169 = musttail call fastcc i64 %t5168(i64 %t5164, i64 3, i64 %t5162, i64 %t5163, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5169
else1380:
  %t5170 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t5171 = icmp ne i64 %t5170, 1
  br i1 %t5171, label %then1381, label %else1382
then1381:
  %t5172 = icmp ne i64 1, 1
  br i1 %t5172, label %then1383, label %else1384
then1383:
  ret i64 1
else1384:
  ret i64 17
else1382:
  %t5173 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t5174 = call i64 @rt_not(i64 %t5173)
  %t5175 = icmp ne i64 %t5174, 1
  br i1 %t5175, label %then1385, label %else1386
then1385:
  %t5176 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t5177 = call i64 @rt_port_close(i64 %t5176)
  br label %merge1387
else1386:
  br label %merge1387
merge1387:
  %t5178 = phi i64 [ %t5177, %then1385 ], [ 17, %else1386 ]
  %t5179 = call i64 @rt_record_set(i64 %a0, i64 40, i64 257)
  %t5180 = icmp ne i64 1, 1
  br i1 %t5180, label %then1388, label %else1389
then1388:
  ret i64 1
else1389:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:close-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5185 = icmp eq i64 %argc, 1
  br i1 %t5185, label %argok1391, label %arityerr1390
arityerr1390:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1391:
  %t5186 = load i64, ptr @"scheme.base:input-port?"
  %t5187 = and i64 %t5186, -8
  %t5188 = inttoptr i64 %t5187 to ptr
  %t5189 = load i64, ptr %t5188
  %t5190 = inttoptr i64 %t5189 to ptr
  %t5191 = call fastcc i64%t5190(i64 %t5186, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5192 = icmp ne i64 %t5191, 1
  br i1 %t5192, label %then1392, label %else1393
then1392:
  %t5193 = load i64, ptr @"scheme.base:close-port"
  %t5194 = and i64 %t5193, -8
  %t5195 = inttoptr i64 %t5194 to ptr
  %t5196 = load i64, ptr %t5195
  %t5197 = inttoptr i64 %t5196 to ptr
  %t5198 = musttail call fastcc i64 %t5197(i64 %t5193, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5198
else1393:
  %t5199 = call i64 @rt_intern(ptr @.str.sym.41)
  %t5200 = call i64 @rt_make_string(ptr @.str.lit.42, i64 17)
  %t5201 = load i64, ptr @"scheme.base:error"
  %t5202 = and i64 %t5201, -8
  %t5203 = inttoptr i64 %t5202 to ptr
  %t5204 = load i64, ptr %t5203
  %t5205 = inttoptr i64 %t5204 to ptr
  %t5206 = musttail call fastcc i64 %t5205(i64 %t5201, i64 3, i64 %t5199, i64 %t5200, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5206
}

define fastcc i64 @"scheme.base:code:close-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5211 = icmp eq i64 %argc, 1
  br i1 %t5211, label %argok1395, label %arityerr1394
arityerr1394:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1395:
  %t5212 = load i64, ptr @"scheme.base:output-port?"
  %t5213 = and i64 %t5212, -8
  %t5214 = inttoptr i64 %t5213 to ptr
  %t5215 = load i64, ptr %t5214
  %t5216 = inttoptr i64 %t5215 to ptr
  %t5217 = call fastcc i64%t5216(i64 %t5212, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5218 = icmp ne i64 %t5217, 1
  br i1 %t5218, label %then1396, label %else1397
then1396:
  %t5219 = load i64, ptr @"scheme.base:close-port"
  %t5220 = and i64 %t5219, -8
  %t5221 = inttoptr i64 %t5220 to ptr
  %t5222 = load i64, ptr %t5221
  %t5223 = inttoptr i64 %t5222 to ptr
  %t5224 = musttail call fastcc i64 %t5223(i64 %t5219, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5224
else1397:
  %t5225 = call i64 @rt_intern(ptr @.str.sym.43)
  %t5226 = call i64 @rt_make_string(ptr @.str.lit.44, i64 18)
  %t5227 = load i64, ptr @"scheme.base:error"
  %t5228 = and i64 %t5227, -8
  %t5229 = inttoptr i64 %t5228 to ptr
  %t5230 = load i64, ptr %t5229
  %t5231 = inttoptr i64 %t5230 to ptr
  %t5232 = musttail call fastcc i64 %t5231(i64 %t5227, i64 3, i64 %t5225, i64 %t5226, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5232
}

define fastcc i64 @"scheme.base:code:current-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5240 = icmp sge i64 %argc, 0
  br i1 %t5240, label %argok1399, label %arityerr1398
arityerr1398:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1399:
  %t5241 = call ptr @rt_alloc_words(i64 8)
  %t5242 = getelementptr i64, ptr %t5241, i64 0
  store i64 %a0, ptr %t5242
  %t5243 = getelementptr i64, ptr %t5241, i64 1
  store i64 %a1, ptr %t5243
  %t5244 = getelementptr i64, ptr %t5241, i64 2
  store i64 %a2, ptr %t5244
  %t5245 = getelementptr i64, ptr %t5241, i64 3
  store i64 %a3, ptr %t5245
  %t5246 = getelementptr i64, ptr %t5241, i64 4
  store i64 %a4, ptr %t5246
  %t5247 = getelementptr i64, ptr %t5241, i64 5
  store i64 %a5, ptr %t5247
  %t5248 = getelementptr i64, ptr %t5241, i64 6
  store i64 %a6, ptr %t5248
  %t5249 = getelementptr i64, ptr %t5241, i64 7
  store i64 %a7, ptr %t5249
  %t5250 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t5241, ptr %overflow)
  %t5251 = call i64 @rt_null_p(i64 %t5250)
  %t5252 = icmp ne i64 %t5251, 1
  br i1 %t5252, label %then1400, label %else1401
then1400:
  %t5253 = load i64, ptr @"scheme.base:%stdout-port"
  %t5254 = call i64 @rt_not(i64 %t5253)
  %t5255 = icmp ne i64 %t5254, 1
  br i1 %t5255, label %then1402, label %else1403
then1402:
  %t5256 = load i64, ptr @"scheme.base:%make-port"
  %t5257 = and i64 %t5256, -8
  %t5258 = inttoptr i64 %t5257 to ptr
  %t5259 = load i64, ptr %t5258
  %t5260 = inttoptr i64 %t5259 to ptr
  %t5261 = call fastcc i64%t5260(i64 %t5256, i64 6, i64 0, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t5262 = call i64 @rt_root(i64 %t5261)
  store i64 %t5262, ptr @"scheme.base:%stdout-port"
  %t5263 = call i64 @rt_set_current_output(i64 0)
  br label %merge1404
else1403:
  br label %merge1404
merge1404:
  %t5264 = phi i64 [ %t5263, %then1402 ], [ 17, %else1403 ]
  %t5265 = load i64, ptr @"scheme.base:%stdout-port"
  ret i64 %t5265
else1401:
  %t5266 = call i64 @rt_car(i64 %t5250)
  %t5267 = call i64 @rt_root(i64 %t5266)
  store i64 %t5267, ptr @"scheme.base:%stdout-port"
  %t5268 = call i64 @rt_record_ref(i64 %t5266, i64 0)
  %t5269 = call i64 @rt_set_current_output(i64 %t5268)
  %t5270 = icmp ne i64 1, 1
  br i1 %t5270, label %then1405, label %else1406
then1405:
  ret i64 1
else1406:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-error-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5275 = icmp sge i64 %argc, 0
  br i1 %t5275, label %argok1408, label %arityerr1407
arityerr1407:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1408:
  %t5276 = call ptr @rt_alloc_words(i64 8)
  %t5277 = getelementptr i64, ptr %t5276, i64 0
  store i64 %a0, ptr %t5277
  %t5278 = getelementptr i64, ptr %t5276, i64 1
  store i64 %a1, ptr %t5278
  %t5279 = getelementptr i64, ptr %t5276, i64 2
  store i64 %a2, ptr %t5279
  %t5280 = getelementptr i64, ptr %t5276, i64 3
  store i64 %a3, ptr %t5280
  %t5281 = getelementptr i64, ptr %t5276, i64 4
  store i64 %a4, ptr %t5281
  %t5282 = getelementptr i64, ptr %t5276, i64 5
  store i64 %a5, ptr %t5282
  %t5283 = getelementptr i64, ptr %t5276, i64 6
  store i64 %a6, ptr %t5283
  %t5284 = getelementptr i64, ptr %t5276, i64 7
  store i64 %a7, ptr %t5284
  %t5285 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t5276, ptr %overflow)
  %t5286 = call i64 @rt_null_p(i64 %t5285)
  %t5287 = icmp ne i64 %t5286, 1
  br i1 %t5287, label %then1409, label %else1410
then1409:
  %t5288 = load i64, ptr @"scheme.base:%stderr-port"
  %t5289 = call i64 @rt_not(i64 %t5288)
  %t5290 = icmp ne i64 %t5289, 1
  br i1 %t5290, label %then1411, label %else1412
then1411:
  %t5291 = load i64, ptr @"scheme.base:%make-port"
  %t5292 = and i64 %t5291, -8
  %t5293 = inttoptr i64 %t5292 to ptr
  %t5294 = load i64, ptr %t5293
  %t5295 = inttoptr i64 %t5294 to ptr
  %t5296 = call fastcc i64%t5295(i64 %t5291, i64 6, i64 8, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t5297 = call i64 @rt_root(i64 %t5296)
  store i64 %t5297, ptr @"scheme.base:%stderr-port"
  br label %merge1413
else1412:
  br label %merge1413
merge1413:
  %t5298 = phi i64 [ 17, %then1411 ], [ 17, %else1412 ]
  %t5299 = load i64, ptr @"scheme.base:%stderr-port"
  ret i64 %t5299
else1410:
  %t5300 = call i64 @rt_car(i64 %t5285)
  %t5301 = call i64 @rt_root(i64 %t5300)
  store i64 %t5301, ptr @"scheme.base:%stderr-port"
  %t5302 = icmp ne i64 1, 1
  br i1 %t5302, label %then1414, label %else1415
then1414:
  ret i64 1
else1415:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5307 = icmp sge i64 %argc, 0
  br i1 %t5307, label %argok1417, label %arityerr1416
arityerr1416:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1417:
  %t5308 = call ptr @rt_alloc_words(i64 8)
  %t5309 = getelementptr i64, ptr %t5308, i64 0
  store i64 %a0, ptr %t5309
  %t5310 = getelementptr i64, ptr %t5308, i64 1
  store i64 %a1, ptr %t5310
  %t5311 = getelementptr i64, ptr %t5308, i64 2
  store i64 %a2, ptr %t5311
  %t5312 = getelementptr i64, ptr %t5308, i64 3
  store i64 %a3, ptr %t5312
  %t5313 = getelementptr i64, ptr %t5308, i64 4
  store i64 %a4, ptr %t5313
  %t5314 = getelementptr i64, ptr %t5308, i64 5
  store i64 %a5, ptr %t5314
  %t5315 = getelementptr i64, ptr %t5308, i64 6
  store i64 %a6, ptr %t5315
  %t5316 = getelementptr i64, ptr %t5308, i64 7
  store i64 %a7, ptr %t5316
  %t5317 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t5308, ptr %overflow)
  %t5318 = call i64 @rt_null_p(i64 %t5317)
  %t5319 = icmp ne i64 %t5318, 1
  br i1 %t5319, label %then1418, label %else1419
then1418:
  %t5320 = load i64, ptr @"scheme.base:%stdin-port"
  %t5321 = call i64 @rt_not(i64 %t5320)
  %t5322 = icmp ne i64 %t5321, 1
  br i1 %t5322, label %then1420, label %else1421
then1420:
  %t5323 = load i64, ptr @"scheme.base:%make-port"
  %t5324 = and i64 %t5323, -8
  %t5325 = inttoptr i64 %t5324 to ptr
  %t5326 = load i64, ptr %t5325
  %t5327 = inttoptr i64 %t5326 to ptr
  %t5328 = call fastcc i64%t5327(i64 %t5323, i64 6, i64 1, i64 257, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t5329 = call i64 @rt_root(i64 %t5328)
  store i64 %t5329, ptr @"scheme.base:%stdin-port"
  br label %merge1422
else1421:
  br label %merge1422
merge1422:
  %t5330 = phi i64 [ 17, %then1420 ], [ 17, %else1421 ]
  %t5331 = load i64, ptr @"scheme.base:%stdin-port"
  ret i64 %t5331
else1419:
  %t5332 = call i64 @rt_car(i64 %t5317)
  %t5333 = call i64 @rt_root(i64 %t5332)
  store i64 %t5333, ptr @"scheme.base:%stdin-port"
  %t5334 = icmp ne i64 1, 1
  br i1 %t5334, label %then1423, label %else1424
then1423:
  ret i64 1
else1424:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_1127"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5339 = icmp eq i64 %argc, 0
  br i1 %t5339, label %argok1426, label %arityerr1425
arityerr1425:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1426:
  %t5340 = icmp ne i64 1, 1
  br i1 %t5340, label %then1427, label %else1428
then1427:
  ret i64 1
else1428:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_1129"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5341 = icmp eq i64 %argc, 0
  br i1 %t5341, label %argok1430, label %arityerr1429
arityerr1429:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1430:
  %t5342 = and i64 %self, -8
  %t5343 = inttoptr i64 %t5342 to ptr
  %t5344 = getelementptr i64, ptr %t5343, i64 2
  %t5345 = load i64, ptr %t5344
  %t5346 = and i64 %self, -8
  %t5347 = inttoptr i64 %t5346 to ptr
  %t5348 = getelementptr i64, ptr %t5347, i64 1
  %t5349 = load i64, ptr %t5348
  %t5350 = and i64 %t5349, -8
  %t5351 = inttoptr i64 %t5350 to ptr
  %t5352 = load i64, ptr %t5351
  %t5353 = inttoptr i64 %t5352 to ptr
  %t5354 = musttail call fastcc i64 %t5353(i64 %t5349, i64 1, i64 %t5345, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5354
}

define fastcc i64 @"scheme.base:code_1131"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5355 = icmp eq i64 %argc, 0
  br i1 %t5355, label %argok1432, label %arityerr1431
arityerr1431:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1432:
  %t5356 = and i64 %self, -8
  %t5357 = inttoptr i64 %t5356 to ptr
  %t5358 = getelementptr i64, ptr %t5357, i64 1
  %t5359 = load i64, ptr %t5358
  %t5360 = load i64, ptr @"scheme.base:close-port"
  %t5361 = and i64 %t5360, -8
  %t5362 = inttoptr i64 %t5361 to ptr
  %t5363 = load i64, ptr %t5362
  %t5364 = inttoptr i64 %t5363 to ptr
  %t5365 = musttail call fastcc i64 %t5364(i64 %t5360, i64 1, i64 %t5359, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5365
}

define fastcc i64 @"scheme.base:code:call-with-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5366 = icmp eq i64 %argc, 2
  br i1 %t5366, label %argok1434, label %arityerr1433
arityerr1433:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1434:
  %t5367 = call ptr @rt_alloc_words(i64 1)
  %t5368 = ptrtoint ptr %t5367 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1127" to i64), ptr %t5367
  %t5369 = or i64 %t5368, 4
  %t5370 = call ptr @rt_alloc_words(i64 3)
  %t5371 = ptrtoint ptr %t5370 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1129" to i64), ptr %t5370
  %t5372 = getelementptr i64, ptr %t5370, i64 1
  store i64 %a1, ptr %t5372
  %t5373 = getelementptr i64, ptr %t5370, i64 2
  store i64 %a0, ptr %t5373
  %t5374 = or i64 %t5371, 4
  %t5375 = call ptr @rt_alloc_words(i64 2)
  %t5376 = ptrtoint ptr %t5375 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1131" to i64), ptr %t5375
  %t5377 = getelementptr i64, ptr %t5375, i64 1
  store i64 %a0, ptr %t5377
  %t5378 = or i64 %t5376, 4
  %t5379 = load i64, ptr @"scheme.base:dynamic-wind"
  %t5380 = and i64 %t5379, -8
  %t5381 = inttoptr i64 %t5380 to ptr
  %t5382 = load i64, ptr %t5381
  %t5383 = inttoptr i64 %t5382 to ptr
  %t5384 = musttail call fastcc i64 %t5383(i64 %t5379, i64 3, i64 %t5369, i64 %t5374, i64 %t5378, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5384
}

define fastcc i64 @"scheme.base:code_1138"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5389 = icmp eq i64 %argc, 0
  br i1 %t5389, label %argok1436, label %arityerr1435
arityerr1435:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1436:
  %t5390 = and i64 %self, -8
  %t5391 = inttoptr i64 %t5390 to ptr
  %t5392 = getelementptr i64, ptr %t5391, i64 1
  %t5393 = load i64, ptr %t5392
  %t5394 = load i64, ptr @"scheme.base:current-output-port"
  %t5395 = and i64 %t5394, -8
  %t5396 = inttoptr i64 %t5395 to ptr
  %t5397 = load i64, ptr %t5396
  %t5398 = inttoptr i64 %t5397 to ptr
  %t5399 = musttail call fastcc i64 %t5398(i64 %t5394, i64 1, i64 %t5393, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5399
}

define fastcc i64 @"scheme.base:code_1140"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5400 = icmp eq i64 %argc, 0
  br i1 %t5400, label %argok1438, label %arityerr1437
arityerr1437:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1438:
  %t5401 = and i64 %self, -8
  %t5402 = inttoptr i64 %t5401 to ptr
  %t5403 = getelementptr i64, ptr %t5402, i64 1
  %t5404 = load i64, ptr %t5403
  %t5405 = load i64, ptr @"scheme.base:current-output-port"
  %t5406 = and i64 %t5405, -8
  %t5407 = inttoptr i64 %t5406 to ptr
  %t5408 = load i64, ptr %t5407
  %t5409 = inttoptr i64 %t5408 to ptr
  %t5410 = call fastcc i64%t5409(i64 %t5405, i64 2, i64 %t5404, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5411 = and i64 %self, -8
  %t5412 = inttoptr i64 %t5411 to ptr
  %t5413 = getelementptr i64, ptr %t5412, i64 2
  %t5414 = load i64, ptr %t5413
  %t5415 = load i64, ptr @"scheme.base:close-port"
  %t5416 = and i64 %t5415, -8
  %t5417 = inttoptr i64 %t5416 to ptr
  %t5418 = load i64, ptr %t5417
  %t5419 = inttoptr i64 %t5418 to ptr
  %t5420 = musttail call fastcc i64 %t5419(i64 %t5415, i64 1, i64 %t5414, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5420
}

define fastcc i64 @"scheme.base:code:with-output-to-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5421 = icmp eq i64 %argc, 2
  br i1 %t5421, label %argok1440, label %arityerr1439
arityerr1439:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1440:
  %t5422 = load i64, ptr @"scheme.base:open-output-file"
  %t5423 = and i64 %t5422, -8
  %t5424 = inttoptr i64 %t5423 to ptr
  %t5425 = load i64, ptr %t5424
  %t5426 = inttoptr i64 %t5425 to ptr
  %t5427 = call fastcc i64%t5426(i64 %t5422, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5428 = load i64, ptr @"scheme.base:current-output-port"
  %t5429 = and i64 %t5428, -8
  %t5430 = inttoptr i64 %t5429 to ptr
  %t5431 = load i64, ptr %t5430
  %t5432 = inttoptr i64 %t5431 to ptr
  %t5433 = call fastcc i64%t5432(i64 %t5428, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5434 = call ptr @rt_alloc_words(i64 2)
  %t5435 = ptrtoint ptr %t5434 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1138" to i64), ptr %t5434
  %t5436 = getelementptr i64, ptr %t5434, i64 1
  store i64 %t5427, ptr %t5436
  %t5437 = or i64 %t5435, 4
  %t5438 = call ptr @rt_alloc_words(i64 3)
  %t5439 = ptrtoint ptr %t5438 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1140" to i64), ptr %t5438
  %t5440 = getelementptr i64, ptr %t5438, i64 1
  store i64 %t5433, ptr %t5440
  %t5441 = getelementptr i64, ptr %t5438, i64 2
  store i64 %t5427, ptr %t5441
  %t5442 = or i64 %t5439, 4
  %t5443 = load i64, ptr @"scheme.base:dynamic-wind"
  %t5444 = and i64 %t5443, -8
  %t5445 = inttoptr i64 %t5444 to ptr
  %t5446 = load i64, ptr %t5445
  %t5447 = inttoptr i64 %t5446 to ptr
  %t5448 = musttail call fastcc i64 %t5447(i64 %t5443, i64 3, i64 %t5437, i64 %a1, i64 %t5442, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5448
}

define fastcc i64 @"scheme.base:code_1147"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5453 = icmp eq i64 %argc, 0
  br i1 %t5453, label %argok1442, label %arityerr1441
arityerr1441:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1442:
  %t5454 = and i64 %self, -8
  %t5455 = inttoptr i64 %t5454 to ptr
  %t5456 = getelementptr i64, ptr %t5455, i64 1
  %t5457 = load i64, ptr %t5456
  %t5458 = load i64, ptr @"scheme.base:current-input-port"
  %t5459 = and i64 %t5458, -8
  %t5460 = inttoptr i64 %t5459 to ptr
  %t5461 = load i64, ptr %t5460
  %t5462 = inttoptr i64 %t5461 to ptr
  %t5463 = musttail call fastcc i64 %t5462(i64 %t5458, i64 1, i64 %t5457, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5463
}

define fastcc i64 @"scheme.base:code_1149"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5464 = icmp eq i64 %argc, 0
  br i1 %t5464, label %argok1444, label %arityerr1443
arityerr1443:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1444:
  %t5465 = and i64 %self, -8
  %t5466 = inttoptr i64 %t5465 to ptr
  %t5467 = getelementptr i64, ptr %t5466, i64 1
  %t5468 = load i64, ptr %t5467
  %t5469 = load i64, ptr @"scheme.base:current-input-port"
  %t5470 = and i64 %t5469, -8
  %t5471 = inttoptr i64 %t5470 to ptr
  %t5472 = load i64, ptr %t5471
  %t5473 = inttoptr i64 %t5472 to ptr
  %t5474 = call fastcc i64%t5473(i64 %t5469, i64 2, i64 %t5468, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5475 = and i64 %self, -8
  %t5476 = inttoptr i64 %t5475 to ptr
  %t5477 = getelementptr i64, ptr %t5476, i64 2
  %t5478 = load i64, ptr %t5477
  %t5479 = load i64, ptr @"scheme.base:close-port"
  %t5480 = and i64 %t5479, -8
  %t5481 = inttoptr i64 %t5480 to ptr
  %t5482 = load i64, ptr %t5481
  %t5483 = inttoptr i64 %t5482 to ptr
  %t5484 = musttail call fastcc i64 %t5483(i64 %t5479, i64 1, i64 %t5478, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5484
}

define fastcc i64 @"scheme.base:code:with-input-from-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5485 = icmp eq i64 %argc, 2
  br i1 %t5485, label %argok1446, label %arityerr1445
arityerr1445:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1446:
  %t5486 = load i64, ptr @"scheme.base:open-input-file"
  %t5487 = and i64 %t5486, -8
  %t5488 = inttoptr i64 %t5487 to ptr
  %t5489 = load i64, ptr %t5488
  %t5490 = inttoptr i64 %t5489 to ptr
  %t5491 = call fastcc i64%t5490(i64 %t5486, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5492 = load i64, ptr @"scheme.base:current-input-port"
  %t5493 = and i64 %t5492, -8
  %t5494 = inttoptr i64 %t5493 to ptr
  %t5495 = load i64, ptr %t5494
  %t5496 = inttoptr i64 %t5495 to ptr
  %t5497 = call fastcc i64%t5496(i64 %t5492, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5498 = call ptr @rt_alloc_words(i64 2)
  %t5499 = ptrtoint ptr %t5498 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1147" to i64), ptr %t5498
  %t5500 = getelementptr i64, ptr %t5498, i64 1
  store i64 %t5491, ptr %t5500
  %t5501 = or i64 %t5499, 4
  %t5502 = call ptr @rt_alloc_words(i64 3)
  %t5503 = ptrtoint ptr %t5502 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1149" to i64), ptr %t5502
  %t5504 = getelementptr i64, ptr %t5502, i64 1
  store i64 %t5497, ptr %t5504
  %t5505 = getelementptr i64, ptr %t5502, i64 2
  store i64 %t5491, ptr %t5505
  %t5506 = or i64 %t5503, 4
  %t5507 = load i64, ptr @"scheme.base:dynamic-wind"
  %t5508 = and i64 %t5507, -8
  %t5509 = inttoptr i64 %t5508 to ptr
  %t5510 = load i64, ptr %t5509
  %t5511 = inttoptr i64 %t5510 to ptr
  %t5512 = musttail call fastcc i64 %t5511(i64 %t5507, i64 3, i64 %t5501, i64 %a1, i64 %t5506, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5512
}

define fastcc i64 @"scheme.base:code:call-with-output-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5517 = icmp eq i64 %argc, 2
  br i1 %t5517, label %argok1448, label %arityerr1447
arityerr1447:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1448:
  %t5518 = load i64, ptr @"scheme.base:open-output-file"
  %t5519 = and i64 %t5518, -8
  %t5520 = inttoptr i64 %t5519 to ptr
  %t5521 = load i64, ptr %t5520
  %t5522 = inttoptr i64 %t5521 to ptr
  %t5523 = call fastcc i64%t5522(i64 %t5518, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5524 = load i64, ptr @"scheme.base:call-with-port"
  %t5525 = and i64 %t5524, -8
  %t5526 = inttoptr i64 %t5525 to ptr
  %t5527 = load i64, ptr %t5526
  %t5528 = inttoptr i64 %t5527 to ptr
  %t5529 = musttail call fastcc i64 %t5528(i64 %t5524, i64 2, i64 %t5523, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5529
}

define fastcc i64 @"scheme.base:code:call-with-input-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5534 = icmp eq i64 %argc, 2
  br i1 %t5534, label %argok1450, label %arityerr1449
arityerr1449:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1450:
  %t5535 = load i64, ptr @"scheme.base:open-input-file"
  %t5536 = and i64 %t5535, -8
  %t5537 = inttoptr i64 %t5536 to ptr
  %t5538 = load i64, ptr %t5537
  %t5539 = inttoptr i64 %t5538 to ptr
  %t5540 = call fastcc i64%t5539(i64 %t5535, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5541 = load i64, ptr @"scheme.base:call-with-port"
  %t5542 = and i64 %t5541, -8
  %t5543 = inttoptr i64 %t5542 to ptr
  %t5544 = load i64, ptr %t5543
  %t5545 = inttoptr i64 %t5544 to ptr
  %t5546 = musttail call fastcc i64 %t5545(i64 %t5541, i64 2, i64 %t5540, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5546
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
  %t159 = call ptr @rt_alloc_words(i64 1)
  %t160 = ptrtoint ptr %t159 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:length" to i64), ptr %t159
  %t161 = or i64 %t160, 4
  %t162 = call i64 @rt_root(i64 %t161)
  store i64 %t162, ptr @"scheme.base:length"
  ret i64 17
}

define i64 @"scheme.base:__init_15"() {
entry:
  %t176 = call ptr @rt_alloc_words(i64 1)
  %t177 = ptrtoint ptr %t176 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:reverse" to i64), ptr %t176
  %t178 = or i64 %t177, 4
  %t179 = call i64 @rt_root(i64 %t178)
  store i64 %t179, ptr @"scheme.base:reverse"
  ret i64 17
}

define i64 @"scheme.base:__init_16"() {
entry:
  %t192 = call ptr @rt_alloc_words(i64 1)
  %t193 = ptrtoint ptr %t192 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%append2" to i64), ptr %t192
  %t194 = or i64 %t193, 4
  %t195 = call i64 @rt_root(i64 %t194)
  store i64 %t195, ptr @"scheme.base:%append2"
  ret i64 17
}

define i64 @"scheme.base:__init_17"() {
entry:
  %t249 = call ptr @rt_alloc_words(i64 1)
  %t250 = ptrtoint ptr %t249 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:append" to i64), ptr %t249
  %t251 = or i64 %t250, 4
  %t252 = call i64 @rt_root(i64 %t251)
  store i64 %t252, ptr @"scheme.base:append"
  ret i64 17
}

define i64 @"scheme.base:__init_18"() {
entry:
  %t270 = call ptr @rt_alloc_words(i64 1)
  %t271 = ptrtoint ptr %t270 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%map1" to i64), ptr %t270
  %t272 = or i64 %t271, 4
  %t273 = call i64 @rt_root(i64 %t272)
  store i64 %t273, ptr @"scheme.base:%map1"
  ret i64 17
}

define i64 @"scheme.base:__init_19"() {
entry:
  %t287 = call ptr @rt_alloc_words(i64 1)
  %t288 = ptrtoint ptr %t287 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%any-null?" to i64), ptr %t287
  %t289 = or i64 %t288, 4
  %t290 = call i64 @rt_root(i64 %t289)
  store i64 %t290, ptr @"scheme.base:%any-null?"
  ret i64 17
}

define i64 @"scheme.base:__init_20"() {
entry:
  %t355 = call ptr @rt_alloc_words(i64 1)
  %t356 = ptrtoint ptr %t355 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%mapn" to i64), ptr %t355
  %t357 = or i64 %t356, 4
  %t358 = call i64 @rt_root(i64 %t357)
  store i64 %t358, ptr @"scheme.base:%mapn"
  ret i64 17
}

define i64 @"scheme.base:__init_21"() {
entry:
  %t385 = call ptr @rt_alloc_words(i64 1)
  %t386 = ptrtoint ptr %t385 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:map" to i64), ptr %t385
  %t387 = or i64 %t386, 4
  %t388 = call i64 @rt_root(i64 %t387)
  store i64 %t388, ptr @"scheme.base:map"
  ret i64 17
}

define i64 @"scheme.base:__init_22"() {
entry:
  %t402 = call ptr @rt_alloc_words(i64 1)
  %t403 = ptrtoint ptr %t402 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:memq" to i64), ptr %t402
  %t404 = or i64 %t403, 4
  %t405 = call i64 @rt_root(i64 %t404)
  store i64 %t405, ptr @"scheme.base:memq"
  ret i64 17
}

define i64 @"scheme.base:__init_23"() {
entry:
  %t419 = call ptr @rt_alloc_words(i64 1)
  %t420 = ptrtoint ptr %t419 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:memv" to i64), ptr %t419
  %t421 = or i64 %t420, 4
  %t422 = call i64 @rt_root(i64 %t421)
  store i64 %t422, ptr @"scheme.base:memv"
  ret i64 17
}

define i64 @"scheme.base:__init_24"() {
entry:
  %t438 = call ptr @rt_alloc_words(i64 1)
  %t439 = ptrtoint ptr %t438 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:assq" to i64), ptr %t438
  %t440 = or i64 %t439, 4
  %t441 = call i64 @rt_root(i64 %t440)
  store i64 %t441, ptr @"scheme.base:assq"
  ret i64 17
}

define i64 @"scheme.base:__init_25"() {
entry:
  %t455 = call ptr @rt_alloc_words(i64 1)
  %t456 = ptrtoint ptr %t455 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:member" to i64), ptr %t455
  %t457 = or i64 %t456, 4
  %t458 = call i64 @rt_root(i64 %t457)
  store i64 %t458, ptr @"scheme.base:member"
  ret i64 17
}

define i64 @"scheme.base:__init_26"() {
entry:
  %t474 = call ptr @rt_alloc_words(i64 1)
  %t475 = ptrtoint ptr %t474 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:assoc" to i64), ptr %t474
  %t476 = or i64 %t475, 4
  %t477 = call i64 @rt_root(i64 %t476)
  store i64 %t477, ptr @"scheme.base:assoc"
  ret i64 17
}

define i64 @"scheme.base:__init_27"() {
entry:
  %t504 = call ptr @rt_alloc_words(i64 1)
  %t505 = ptrtoint ptr %t504 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:filter" to i64), ptr %t504
  %t506 = or i64 %t505, 4
  %t507 = call i64 @rt_root(i64 %t506)
  store i64 %t507, ptr @"scheme.base:filter"
  ret i64 17
}

define i64 @"scheme.base:__init_28"() {
entry:
  %t524 = call ptr @rt_alloc_words(i64 1)
  %t525 = ptrtoint ptr %t524 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:fold-left" to i64), ptr %t524
  %t526 = or i64 %t525, 4
  %t527 = call i64 @rt_root(i64 %t526)
  store i64 %t527, ptr @"scheme.base:fold-left"
  ret i64 17
}

define i64 @"scheme.base:__init_29"() {
entry:
  %t544 = call ptr @rt_alloc_words(i64 1)
  %t545 = ptrtoint ptr %t544 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:fold-right" to i64), ptr %t544
  %t546 = or i64 %t545, 4
  %t547 = call i64 @rt_root(i64 %t546)
  store i64 %t547, ptr @"scheme.base:fold-right"
  ret i64 17
}

define i64 @"scheme.base:__init_30"() {
entry:
  %t565 = call ptr @rt_alloc_words(i64 1)
  %t566 = ptrtoint ptr %t565 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%for-each1" to i64), ptr %t565
  %t567 = or i64 %t566, 4
  %t568 = call i64 @rt_root(i64 %t567)
  store i64 %t568, ptr @"scheme.base:%for-each1"
  ret i64 17
}

define i64 @"scheme.base:__init_31"() {
entry:
  %t633 = call ptr @rt_alloc_words(i64 1)
  %t634 = ptrtoint ptr %t633 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%for-eachn" to i64), ptr %t633
  %t635 = or i64 %t634, 4
  %t636 = call i64 @rt_root(i64 %t635)
  store i64 %t636, ptr @"scheme.base:%for-eachn"
  ret i64 17
}

define i64 @"scheme.base:__init_32"() {
entry:
  %t663 = call ptr @rt_alloc_words(i64 1)
  %t664 = ptrtoint ptr %t663 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:for-each" to i64), ptr %t663
  %t665 = or i64 %t664, 4
  %t666 = call i64 @rt_root(i64 %t665)
  store i64 %t666, ptr @"scheme.base:for-each"
  ret i64 17
}

define i64 @"scheme.base:__init_33"() {
entry:
  %t684 = call ptr @rt_alloc_words(i64 1)
  %t685 = ptrtoint ptr %t684 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:andmap" to i64), ptr %t684
  %t686 = or i64 %t685, 4
  %t687 = call i64 @rt_root(i64 %t686)
  store i64 %t687, ptr @"scheme.base:andmap"
  ret i64 17
}

define i64 @"scheme.base:__init_34"() {
entry:
  %t705 = call ptr @rt_alloc_words(i64 1)
  %t706 = ptrtoint ptr %t705 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:memp" to i64), ptr %t705
  %t707 = or i64 %t706, 4
  %t708 = call i64 @rt_root(i64 %t707)
  store i64 %t708, ptr @"scheme.base:memp"
  ret i64 17
}

define i64 @"scheme.base:__init_35"() {
entry:
  %t717 = call ptr @rt_alloc_words(i64 1)
  %t718 = ptrtoint ptr %t717 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:cadddr" to i64), ptr %t717
  %t719 = or i64 %t718, 4
  %t720 = call i64 @rt_root(i64 %t719)
  store i64 %t720, ptr @"scheme.base:cadddr"
  ret i64 17
}

define i64 @"scheme.base:__init_36"() {
entry:
  %t733 = call ptr @rt_alloc_words(i64 1)
  %t734 = ptrtoint ptr %t733 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list?" to i64), ptr %t733
  %t735 = or i64 %t734, 4
  %t736 = call i64 @rt_root(i64 %t735)
  store i64 %t736, ptr @"scheme.base:list?"
  ret i64 17
}

define i64 @"scheme.base:__init_37"() {
entry:
  %t745 = call ptr @rt_alloc_words(i64 1)
  %t746 = ptrtoint ptr %t745 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:zero?" to i64), ptr %t745
  %t747 = or i64 %t746, 4
  %t748 = call i64 @rt_root(i64 %t747)
  store i64 %t748, ptr @"scheme.base:zero?"
  ret i64 17
}

define i64 @"scheme.base:__init_38"() {
entry:
  %t772 = call ptr @rt_alloc_words(i64 1)
  %t773 = ptrtoint ptr %t772 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-tail" to i64), ptr %t772
  %t774 = or i64 %t773, 4
  %t775 = call i64 @rt_root(i64 %t774)
  store i64 %t775, ptr @"scheme.base:list-tail"
  ret i64 17
}

define i64 @"scheme.base:__init_39"() {
entry:
  %t784 = call ptr @rt_alloc_words(i64 1)
  %t785 = ptrtoint ptr %t784 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-ref" to i64), ptr %t784
  %t786 = or i64 %t785, 4
  %t787 = call i64 @rt_root(i64 %t786)
  store i64 %t787, ptr @"scheme.base:list-ref"
  ret i64 17
}

define i64 @"scheme.base:__init_40"() {
entry:
  %t813 = call ptr @rt_alloc_words(i64 1)
  %t814 = ptrtoint ptr %t813 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-head" to i64), ptr %t813
  %t815 = or i64 %t814, 4
  %t816 = call i64 @rt_root(i64 %t815)
  store i64 %t816, ptr @"scheme.base:list-head"
  ret i64 17
}

define i64 @"scheme.base:__init_41"() {
entry:
  %t840 = call ptr @rt_alloc_words(i64 1)
  %t841 = ptrtoint ptr %t840 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-list" to i64), ptr %t840
  %t842 = or i64 %t841, 4
  %t843 = call i64 @rt_root(i64 %t842)
  store i64 %t843, ptr @"scheme.base:make-list"
  ret i64 17
}

define i64 @"scheme.base:__init_42"() {
entry:
  %t880 = call ptr @rt_alloc_words(i64 1)
  %t881 = ptrtoint ptr %t880 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:iota" to i64), ptr %t880
  %t882 = or i64 %t881, 4
  %t883 = call i64 @rt_root(i64 %t882)
  store i64 %t883, ptr @"scheme.base:iota"
  ret i64 17
}

define i64 @"scheme.base:__init_43"() {
entry:
  %t906 = call ptr @rt_alloc_words(i64 1)
  %t907 = ptrtoint ptr %t906 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%minmax-fold" to i64), ptr %t906
  %t908 = or i64 %t907, 4
  %t909 = call i64 @rt_root(i64 %t908)
  store i64 %t909, ptr @"scheme.base:%minmax-fold"
  ret i64 17
}

define i64 @"scheme.base:__init_44"() {
entry:
  %t918 = call ptr @rt_alloc_words(i64 1)
  %t919 = ptrtoint ptr %t918 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%minmax" to i64), ptr %t918
  %t920 = or i64 %t919, 4
  %t921 = call i64 @rt_root(i64 %t920)
  store i64 %t921, ptr @"scheme.base:%minmax"
  ret i64 17
}

define i64 @"scheme.base:__init_45"() {
entry:
  %t951 = call ptr @rt_alloc_words(i64 1)
  %t952 = ptrtoint ptr %t951 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:max" to i64), ptr %t951
  %t953 = or i64 %t952, 4
  %t954 = call i64 @rt_root(i64 %t953)
  store i64 %t954, ptr @"scheme.base:max"
  ret i64 17
}

define i64 @"scheme.base:__init_46"() {
entry:
  %t984 = call ptr @rt_alloc_words(i64 1)
  %t985 = ptrtoint ptr %t984 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:min" to i64), ptr %t984
  %t986 = or i64 %t985, 4
  %t987 = call i64 @rt_root(i64 %t986)
  store i64 %t987, ptr @"scheme.base:min"
  ret i64 17
}

define i64 @"scheme.base:__init_47"() {
entry:
  %t990 = call ptr @rt_alloc_words(i64 1)
  %t991 = ptrtoint ptr %t990 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:void" to i64), ptr %t990
  %t992 = or i64 %t991, 4
  %t993 = call i64 @rt_root(i64 %t992)
  store i64 %t993, ptr @"scheme.base:void"
  ret i64 17
}

define i64 @"scheme.base:__init_48"() {
entry:
  %t1006 = call ptr @rt_alloc_words(i64 1)
  %t1007 = ptrtoint ptr %t1006 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string" to i64), ptr %t1006
  %t1008 = or i64 %t1007, 4
  %t1009 = call i64 @rt_root(i64 %t1008)
  store i64 %t1009, ptr @"scheme.base:string"
  ret i64 17
}

define i64 @"scheme.base:__init_49"() {
entry:
  %t1023 = call ptr @rt_alloc_words(i64 1)
  %t1024 = ptrtoint ptr %t1023 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%str-concat" to i64), ptr %t1023
  %t1025 = or i64 %t1024, 4
  %t1026 = call i64 @rt_root(i64 %t1025)
  store i64 %t1026, ptr @"scheme.base:%str-concat"
  ret i64 17
}

define i64 @"scheme.base:__init_50"() {
entry:
  %t1046 = call ptr @rt_alloc_words(i64 1)
  %t1047 = ptrtoint ptr %t1046 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:chr-cmp" to i64), ptr %t1046
  %t1048 = or i64 %t1047, 4
  %t1049 = call i64 @rt_root(i64 %t1048)
  store i64 %t1049, ptr @"scheme.base:chr-cmp"
  ret i64 17
}

define i64 @"scheme.base:__init_51"() {
entry:
  %t1078 = call ptr @rt_alloc_words(i64 1)
  %t1079 = ptrtoint ptr %t1078 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char=?" to i64), ptr %t1078
  %t1080 = or i64 %t1079, 4
  %t1081 = call i64 @rt_root(i64 %t1080)
  store i64 %t1081, ptr @"scheme.base:char=?"
  ret i64 17
}

define i64 @"scheme.base:__init_52"() {
entry:
  %t1110 = call ptr @rt_alloc_words(i64 1)
  %t1111 = ptrtoint ptr %t1110 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char<?" to i64), ptr %t1110
  %t1112 = or i64 %t1111, 4
  %t1113 = call i64 @rt_root(i64 %t1112)
  store i64 %t1113, ptr @"scheme.base:char<?"
  ret i64 17
}

define i64 @"scheme.base:__init_53"() {
entry:
  %t1142 = call ptr @rt_alloc_words(i64 1)
  %t1143 = ptrtoint ptr %t1142 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char>?" to i64), ptr %t1142
  %t1144 = or i64 %t1143, 4
  %t1145 = call i64 @rt_root(i64 %t1144)
  store i64 %t1145, ptr @"scheme.base:char>?"
  ret i64 17
}

define i64 @"scheme.base:__init_54"() {
entry:
  %t1182 = call ptr @rt_alloc_words(i64 1)
  %t1183 = ptrtoint ptr %t1182 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char<=?" to i64), ptr %t1182
  %t1184 = or i64 %t1183, 4
  %t1185 = call i64 @rt_root(i64 %t1184)
  store i64 %t1185, ptr @"scheme.base:char<=?"
  ret i64 17
}

define i64 @"scheme.base:__init_55"() {
entry:
  %t1222 = call ptr @rt_alloc_words(i64 1)
  %t1223 = ptrtoint ptr %t1222 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char>=?" to i64), ptr %t1222
  %t1224 = or i64 %t1223, 4
  %t1225 = call i64 @rt_root(i64 %t1224)
  store i64 %t1225, ptr @"scheme.base:char>=?"
  ret i64 17
}

define i64 @"scheme.base:__init_56"() {
entry:
  %t1266 = call ptr @rt_alloc_words(i64 1)
  %t1267 = ptrtoint ptr %t1266 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string->list" to i64), ptr %t1266
  %t1268 = or i64 %t1267, 4
  %t1269 = call i64 @rt_root(i64 %t1268)
  store i64 %t1269, ptr @"scheme.base:string->list"
  ret i64 17
}

define i64 @"scheme.base:__init_57"() {
entry:
  %t1306 = call ptr @rt_alloc_words(i64 1)
  %t1307 = ptrtoint ptr %t1306 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:ns-digits" to i64), ptr %t1306
  %t1308 = or i64 %t1307, 4
  %t1309 = call i64 @rt_root(i64 %t1308)
  store i64 %t1309, ptr @"scheme.base:ns-digits"
  ret i64 17
}

define i64 @"scheme.base:__init_58"() {
entry:
  %t1354 = call ptr @rt_alloc_words(i64 1)
  %t1355 = ptrtoint ptr %t1354 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:number->string" to i64), ptr %t1354
  %t1356 = or i64 %t1355, 4
  %t1357 = call i64 @rt_root(i64 %t1356)
  store i64 %t1357, ptr @"scheme.base:number->string"
  ret i64 17
}

define i64 @"scheme.base:__init_59"() {
entry:
  %t1391 = call ptr @rt_alloc_words(i64 1)
  %t1392 = ptrtoint ptr %t1391 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error" to i64), ptr %t1391
  %t1393 = or i64 %t1392, 4
  %t1394 = call i64 @rt_root(i64 %t1393)
  store i64 %t1394, ptr @"scheme.base:error"
  ret i64 17
}

define i64 @"scheme.base:__init_60"() {
entry:
  %t1395 = call i64 @rt_root(i64 2)
  store i64 %t1395, ptr @"scheme.base:*winds*"
  ret i64 17
}

define i64 @"scheme.base:__init_61"() {
entry:
  %t1396 = call i64 @rt_root(i64 2)
  store i64 %t1396, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define i64 @"scheme.base:__init_62"() {
entry:
  %t1421 = call ptr @rt_alloc_words(i64 1)
  %t1422 = ptrtoint ptr %t1421 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%unwind-to" to i64), ptr %t1421
  %t1423 = or i64 %t1422, 4
  %t1424 = call i64 @rt_root(i64 %t1423)
  store i64 %t1424, ptr @"scheme.base:%unwind-to"
  ret i64 17
}

define i64 @"scheme.base:__init_63"() {
entry:
  %t1448 = call ptr @rt_alloc_words(i64 1)
  %t1449 = ptrtoint ptr %t1448 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:dynamic-wind" to i64), ptr %t1448
  %t1450 = or i64 %t1449, 4
  %t1451 = call i64 @rt_root(i64 %t1450)
  store i64 %t1451, ptr @"scheme.base:dynamic-wind"
  ret i64 17
}

define i64 @"scheme.base:__init_64"() {
entry:
  %t1512 = call ptr @rt_alloc_words(i64 1)
  %t1513 = ptrtoint ptr %t1512 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-current-continuation" to i64), ptr %t1512
  %t1514 = or i64 %t1513, 4
  %t1515 = call i64 @rt_root(i64 %t1514)
  store i64 %t1515, ptr @"scheme.base:call-with-current-continuation"
  ret i64 17
}

define i64 @"scheme.base:__init_65"() {
entry:
  %t1523 = call ptr @rt_alloc_words(i64 1)
  %t1524 = ptrtoint ptr %t1523 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call/cc" to i64), ptr %t1523
  %t1525 = or i64 %t1524, 4
  %t1526 = call i64 @rt_root(i64 %t1525)
  store i64 %t1526, ptr @"scheme.base:call/cc"
  ret i64 17
}

define i64 @"scheme.base:__init_66"() {
entry:
  %t1561 = call ptr @rt_alloc_words(i64 1)
  %t1562 = ptrtoint ptr %t1561 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%with-handler" to i64), ptr %t1561
  %t1563 = or i64 %t1562, 4
  %t1564 = call i64 @rt_root(i64 %t1563)
  store i64 %t1564, ptr @"scheme.base:%with-handler"
  ret i64 17
}

define i64 @"scheme.base:__init_67"() {
entry:
  %t1583 = call ptr @rt_alloc_words(i64 1)
  %t1584 = ptrtoint ptr %t1583 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:raise" to i64), ptr %t1583
  %t1585 = or i64 %t1584, 4
  %t1586 = call i64 @rt_root(i64 %t1585)
  store i64 %t1586, ptr @"scheme.base:raise"
  ret i64 17
}

define i64 @"scheme.base:__init_68"() {
entry:
  %t1589 = call ptr @rt_alloc_words(i64 1)
  %t1590 = ptrtoint ptr %t1589 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object?" to i64), ptr %t1589
  %t1591 = or i64 %t1590, 4
  %t1592 = call i64 @rt_root(i64 %t1591)
  store i64 %t1592, ptr @"scheme.base:error-object?"
  ret i64 17
}

define i64 @"scheme.base:__init_69"() {
entry:
  %t1595 = call ptr @rt_alloc_words(i64 1)
  %t1596 = ptrtoint ptr %t1595 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-message" to i64), ptr %t1595
  %t1597 = or i64 %t1596, 4
  %t1598 = call i64 @rt_root(i64 %t1597)
  store i64 %t1598, ptr @"scheme.base:error-object-message"
  ret i64 17
}

define i64 @"scheme.base:__init_70"() {
entry:
  %t1601 = call ptr @rt_alloc_words(i64 1)
  %t1602 = ptrtoint ptr %t1601 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-irritants" to i64), ptr %t1601
  %t1603 = or i64 %t1602, 4
  %t1604 = call i64 @rt_root(i64 %t1603)
  store i64 %t1604, ptr @"scheme.base:error-object-irritants"
  ret i64 17
}

define i64 @"scheme.base:__init_71"() {
entry:
  %t1686 = call ptr @rt_alloc_words(i64 1)
  %t1687 = ptrtoint ptr %t1686 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-parameter" to i64), ptr %t1686
  %t1688 = or i64 %t1687, 4
  %t1689 = call i64 @rt_root(i64 %t1688)
  store i64 %t1689, ptr @"scheme.base:make-parameter"
  ret i64 17
}

define i64 @"scheme.base:__init_72"() {
entry:
  %t1770 = call ptr @rt_alloc_words(i64 1)
  %t1771 = ptrtoint ptr %t1770 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%with-parameters" to i64), ptr %t1770
  %t1772 = or i64 %t1771, 4
  %t1773 = call i64 @rt_root(i64 %t1772)
  store i64 %t1773, ptr @"scheme.base:%with-parameters"
  ret i64 17
}

define i64 @"scheme.base:__init_73"() {
entry:
  %t1811 = call ptr @rt_alloc_words(i64 1)
  %t1812 = ptrtoint ptr %t1811 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->vector" to i64), ptr %t1811
  %t1813 = or i64 %t1812, 4
  %t1814 = call i64 @rt_root(i64 %t1813)
  store i64 %t1814, ptr @"scheme.base:list->vector"
  ret i64 17
}

define i64 @"scheme.base:__init_74"() {
entry:
  %t1832 = call ptr @rt_alloc_words(i64 1)
  %t1833 = ptrtoint ptr %t1832 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector" to i64), ptr %t1832
  %t1834 = or i64 %t1833, 4
  %t1835 = call i64 @rt_root(i64 %t1834)
  store i64 %t1835, ptr @"scheme.base:vector"
  ret i64 17
}

define i64 @"scheme.base:__init_75"() {
entry:
  %t1873 = call ptr @rt_alloc_words(i64 1)
  %t1874 = ptrtoint ptr %t1873 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->bytevector" to i64), ptr %t1873
  %t1875 = or i64 %t1874, 4
  %t1876 = call i64 @rt_root(i64 %t1875)
  store i64 %t1876, ptr @"scheme.base:list->bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_76"() {
entry:
  %t1894 = call ptr @rt_alloc_words(i64 1)
  %t1895 = ptrtoint ptr %t1894 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector" to i64), ptr %t1894
  %t1896 = or i64 %t1895, 4
  %t1897 = call i64 @rt_root(i64 %t1896)
  store i64 %t1897, ptr @"scheme.base:bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_77"() {
entry:
  %t1917 = call ptr @rt_alloc_words(i64 1)
  %t1918 = ptrtoint ptr %t1917 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:values" to i64), ptr %t1917
  %t1919 = or i64 %t1918, 4
  %t1920 = call i64 @rt_root(i64 %t1919)
  store i64 %t1920, ptr @"scheme.base:values"
  ret i64 17
}

define i64 @"scheme.base:__init_78"() {
entry:
  %t1962 = call ptr @rt_alloc_words(i64 1)
  %t1963 = ptrtoint ptr %t1962 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-values" to i64), ptr %t1962
  %t1964 = or i64 %t1963, 4
  %t1965 = call i64 @rt_root(i64 %t1964)
  store i64 %t1965, ptr @"scheme.base:call-with-values"
  ret i64 17
}

define i64 @"scheme.base:__init_79"() {
entry:
  %t1966 = call i64 @rt_root(i64 64)
  store i64 %t1966, ptr @"scheme.base:%ht-initial-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_80"() {
entry:
  %t1967 = call i64 @rt_root(i64 24)
  store i64 %t1967, ptr @"scheme.base:%ht-load-factor"
  ret i64 17
}

define i64 @"scheme.base:__init_81"() {
entry:
  %t1978 = call ptr @rt_alloc_words(i64 1)
  %t1979 = ptrtoint ptr %t1978 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-hash-table" to i64), ptr %t1978
  %t1980 = or i64 %t1979, 4
  %t1981 = call i64 @rt_root(i64 %t1980)
  store i64 %t1981, ptr @"scheme.base:make-hash-table"
  ret i64 17
}

define i64 @"scheme.base:__init_82"() {
entry:
  %t1984 = call ptr @rt_alloc_words(i64 1)
  %t1985 = ptrtoint ptr %t1984 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table?" to i64), ptr %t1984
  %t1986 = or i64 %t1985, 4
  %t1987 = call i64 @rt_root(i64 %t1986)
  store i64 %t1987, ptr @"scheme.base:hash-table?"
  ret i64 17
}

define i64 @"scheme.base:__init_83"() {
entry:
  %t1991 = call ptr @rt_alloc_words(i64 1)
  %t1992 = ptrtoint ptr %t1991 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-count" to i64), ptr %t1991
  %t1993 = or i64 %t1992, 4
  %t1994 = call i64 @rt_root(i64 %t1993)
  store i64 %t1994, ptr @"scheme.base:%ht-count"
  ret i64 17
}

define i64 @"scheme.base:__init_84"() {
entry:
  %t1998 = call ptr @rt_alloc_words(i64 1)
  %t1999 = ptrtoint ptr %t1998 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-buckets" to i64), ptr %t1998
  %t2000 = or i64 %t1999, 4
  %t2001 = call i64 @rt_root(i64 %t2000)
  store i64 %t2001, ptr @"scheme.base:%ht-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_85"() {
entry:
  %t2005 = call ptr @rt_alloc_words(i64 1)
  %t2006 = ptrtoint ptr %t2005 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-count!" to i64), ptr %t2005
  %t2007 = or i64 %t2006, 4
  %t2008 = call i64 @rt_root(i64 %t2007)
  store i64 %t2008, ptr @"scheme.base:%ht-set-count!"
  ret i64 17
}

define i64 @"scheme.base:__init_86"() {
entry:
  %t2012 = call ptr @rt_alloc_words(i64 1)
  %t2013 = ptrtoint ptr %t2012 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-buckets!" to i64), ptr %t2012
  %t2014 = or i64 %t2013, 4
  %t2015 = call i64 @rt_root(i64 %t2014)
  store i64 %t2015, ptr @"scheme.base:%ht-set-buckets!"
  ret i64 17
}

define i64 @"scheme.base:__init_87"() {
entry:
  %t2019 = call ptr @rt_alloc_words(i64 1)
  %t2020 = ptrtoint ptr %t2019 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-index" to i64), ptr %t2019
  %t2021 = or i64 %t2020, 4
  %t2022 = call i64 @rt_root(i64 %t2021)
  store i64 %t2022, ptr @"scheme.base:%ht-index"
  ret i64 17
}

define i64 @"scheme.base:__init_88"() {
entry:
  %t2038 = call ptr @rt_alloc_words(i64 1)
  %t2039 = ptrtoint ptr %t2038 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-assoc" to i64), ptr %t2038
  %t2040 = or i64 %t2039, 4
  %t2041 = call i64 @rt_root(i64 %t2040)
  store i64 %t2041, ptr @"scheme.base:%ht-assoc"
  ret i64 17
}

define i64 @"scheme.base:__init_89"() {
entry:
  %t2059 = call ptr @rt_alloc_words(i64 1)
  %t2060 = ptrtoint ptr %t2059 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-remove" to i64), ptr %t2059
  %t2061 = or i64 %t2060, 4
  %t2062 = call i64 @rt_root(i64 %t2061)
  store i64 %t2062, ptr @"scheme.base:%ht-remove"
  ret i64 17
}

define i64 @"scheme.base:__init_90"() {
entry:
  %t2086 = call ptr @rt_alloc_words(i64 1)
  %t2087 = ptrtoint ptr %t2086 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref/default" to i64), ptr %t2086
  %t2088 = or i64 %t2087, 4
  %t2089 = call i64 @rt_root(i64 %t2088)
  store i64 %t2089, ptr @"scheme.base:hash-table-ref/default"
  ret i64 17
}

define i64 @"scheme.base:__init_91"() {
entry:
  %t2112 = call ptr @rt_alloc_words(i64 1)
  %t2113 = ptrtoint ptr %t2112 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-contains?" to i64), ptr %t2112
  %t2114 = or i64 %t2113, 4
  %t2115 = call i64 @rt_root(i64 %t2114)
  store i64 %t2115, ptr @"scheme.base:hash-table-contains?"
  ret i64 17
}

define i64 @"scheme.base:__init_92"() {
entry:
  %t2146 = call ptr @rt_alloc_words(i64 1)
  %t2147 = ptrtoint ptr %t2146 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref" to i64), ptr %t2146
  %t2148 = or i64 %t2147, 4
  %t2149 = call i64 @rt_root(i64 %t2148)
  store i64 %t2149, ptr @"scheme.base:hash-table-ref"
  ret i64 17
}

define i64 @"scheme.base:__init_93"() {
entry:
  %t2233 = call ptr @rt_alloc_words(i64 1)
  %t2234 = ptrtoint ptr %t2233 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-set!" to i64), ptr %t2233
  %t2235 = or i64 %t2234, 4
  %t2236 = call i64 @rt_root(i64 %t2235)
  store i64 %t2236, ptr @"scheme.base:hash-table-set!"
  ret i64 17
}

define i64 @"scheme.base:__init_94"() {
entry:
  %t2286 = call ptr @rt_alloc_words(i64 1)
  %t2287 = ptrtoint ptr %t2286 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-delete!" to i64), ptr %t2286
  %t2288 = or i64 %t2287, 4
  %t2289 = call i64 @rt_root(i64 %t2288)
  store i64 %t2289, ptr @"scheme.base:hash-table-delete!"
  ret i64 17
}

define i64 @"scheme.base:__init_95"() {
entry:
  %t2393 = call ptr @rt_alloc_words(i64 1)
  %t2394 = ptrtoint ptr %t2393 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-grow!" to i64), ptr %t2393
  %t2395 = or i64 %t2394, 4
  %t2396 = call i64 @rt_root(i64 %t2395)
  store i64 %t2396, ptr @"scheme.base:%ht-grow!"
  ret i64 17
}

define i64 @"scheme.base:__init_96"() {
entry:
  %t2404 = call ptr @rt_alloc_words(i64 1)
  %t2405 = ptrtoint ptr %t2404 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-size" to i64), ptr %t2404
  %t2406 = or i64 %t2405, 4
  %t2407 = call i64 @rt_root(i64 %t2406)
  store i64 %t2407, ptr @"scheme.base:hash-table-size"
  ret i64 17
}

define i64 @"scheme.base:__init_97"() {
entry:
  %t2424 = call ptr @rt_alloc_words(i64 1)
  %t2425 = ptrtoint ptr %t2424 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-fold-buckets" to i64), ptr %t2424
  %t2426 = or i64 %t2425, 4
  %t2427 = call i64 @rt_root(i64 %t2426)
  store i64 %t2427, ptr @"scheme.base:%ht-fold-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_98"() {
entry:
  %t2475 = call ptr @rt_alloc_words(i64 1)
  %t2476 = ptrtoint ptr %t2475 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table->alist" to i64), ptr %t2475
  %t2477 = or i64 %t2476, 4
  %t2478 = call i64 @rt_root(i64 %t2477)
  store i64 %t2478, ptr @"scheme.base:hash-table->alist"
  ret i64 17
}

define i64 @"scheme.base:__init_99"() {
entry:
  %t2497 = call ptr @rt_alloc_words(i64 1)
  %t2498 = ptrtoint ptr %t2497 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-keys" to i64), ptr %t2497
  %t2499 = or i64 %t2498, 4
  %t2500 = call i64 @rt_root(i64 %t2499)
  store i64 %t2500, ptr @"scheme.base:hash-table-keys"
  ret i64 17
}

define i64 @"scheme.base:__init_100"() {
entry:
  %t2519 = call ptr @rt_alloc_words(i64 1)
  %t2520 = ptrtoint ptr %t2519 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-values" to i64), ptr %t2519
  %t2521 = or i64 %t2520, 4
  %t2522 = call i64 @rt_root(i64 %t2521)
  store i64 %t2522, ptr @"scheme.base:hash-table-values"
  ret i64 17
}

define i64 @"scheme.base:__init_101"() {
entry:
  %t2556 = call ptr @rt_alloc_words(i64 1)
  %t2557 = ptrtoint ptr %t2556 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-ws?" to i64), ptr %t2556
  %t2558 = or i64 %t2557, 4
  %t2559 = call i64 @rt_root(i64 %t2558)
  store i64 %t2559, ptr @"scheme.base:rd-ws?"
  ret i64 17
}

define i64 @"scheme.base:__init_102"() {
entry:
  %t2577 = call ptr @rt_alloc_words(i64 1)
  %t2578 = ptrtoint ptr %t2577 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-digit?" to i64), ptr %t2577
  %t2579 = or i64 %t2578, 4
  %t2580 = call i64 @rt_root(i64 %t2579)
  store i64 %t2580, ptr @"scheme.base:rd-digit?"
  ret i64 17
}

define i64 @"scheme.base:__init_103"() {
entry:
  %t2637 = call ptr @rt_alloc_words(i64 1)
  %t2638 = ptrtoint ptr %t2637 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-delim?" to i64), ptr %t2637
  %t2639 = or i64 %t2638, 4
  %t2640 = call i64 @rt_root(i64 %t2639)
  store i64 %t2640, ptr @"scheme.base:rd-delim?"
  ret i64 17
}

define i64 @"scheme.base:__init_104"() {
entry:
  %t2682 = call ptr @rt_alloc_words(i64 1)
  %t2683 = ptrtoint ptr %t2682 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-skip-line" to i64), ptr %t2682
  %t2684 = or i64 %t2683, 4
  %t2685 = call i64 @rt_root(i64 %t2684)
  store i64 %t2685, ptr @"scheme.base:rd-skip-line"
  ret i64 17
}

define i64 @"scheme.base:__init_105"() {
entry:
  %t2746 = call ptr @rt_alloc_words(i64 1)
  %t2747 = ptrtoint ptr %t2746 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-skip-ws" to i64), ptr %t2746
  %t2748 = or i64 %t2747, 4
  %t2749 = call i64 @rt_root(i64 %t2748)
  store i64 %t2749, ptr @"scheme.base:rd-skip-ws"
  ret i64 17
}

define i64 @"scheme.base:__init_106"() {
entry:
  %t2781 = call ptr @rt_alloc_words(i64 1)
  %t2782 = ptrtoint ptr %t2781 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-token-end" to i64), ptr %t2781
  %t2783 = or i64 %t2782, 4
  %t2784 = call i64 @rt_root(i64 %t2783)
  store i64 %t2784, ptr @"scheme.base:rd-token-end"
  ret i64 17
}

define i64 @"scheme.base:__init_107"() {
entry:
  %t2816 = call ptr @rt_alloc_words(i64 1)
  %t2817 = ptrtoint ptr %t2816 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-all-digits?" to i64), ptr %t2816
  %t2818 = or i64 %t2817, 4
  %t2819 = call i64 @rt_root(i64 %t2818)
  store i64 %t2819, ptr @"scheme.base:rd-all-digits?"
  ret i64 17
}

define i64 @"scheme.base:__init_108"() {
entry:
  %t2877 = call ptr @rt_alloc_words(i64 1)
  %t2878 = ptrtoint ptr %t2877 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-numeric?" to i64), ptr %t2877
  %t2879 = or i64 %t2878, 4
  %t2880 = call i64 @rt_root(i64 %t2879)
  store i64 %t2880, ptr @"scheme.base:rd-numeric?"
  ret i64 17
}

define i64 @"scheme.base:__init_109"() {
entry:
  %t2931 = call ptr @rt_alloc_words(i64 1)
  %t2932 = ptrtoint ptr %t2931 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-digits" to i64), ptr %t2931
  %t2933 = or i64 %t2932, 4
  %t2934 = call i64 @rt_root(i64 %t2933)
  store i64 %t2934, ptr @"scheme.base:rd-digits"
  ret i64 17
}

define i64 @"scheme.base:__init_110"() {
entry:
  %t2985 = call ptr @rt_alloc_words(i64 1)
  %t2986 = ptrtoint ptr %t2985 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-digits-neg" to i64), ptr %t2985
  %t2987 = or i64 %t2986, 4
  %t2988 = call i64 @rt_root(i64 %t2987)
  store i64 %t2988, ptr @"scheme.base:rd-digits-neg"
  ret i64 17
}

define i64 @"scheme.base:__init_111"() {
entry:
  %t3027 = call ptr @rt_alloc_words(i64 1)
  %t3028 = ptrtoint ptr %t3027 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-parse-int" to i64), ptr %t3027
  %t3029 = or i64 %t3028, 4
  %t3030 = call i64 @rt_root(i64 %t3029)
  store i64 %t3030, ptr @"scheme.base:rd-parse-int"
  ret i64 17
}

define i64 @"scheme.base:__init_112"() {
entry:
  %t3040 = call ptr @rt_alloc_words(i64 1)
  %t3041 = ptrtoint ptr %t3040 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-dotchar?" to i64), ptr %t3040
  %t3042 = or i64 %t3041, 4
  %t3043 = call i64 @rt_root(i64 %t3042)
  store i64 %t3043, ptr @"scheme.base:rd-dotchar?"
  ret i64 17
}

define i64 @"scheme.base:__init_113"() {
entry:
  %t3061 = call ptr @rt_alloc_words(i64 1)
  %t3062 = ptrtoint ptr %t3061 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-exp-char?" to i64), ptr %t3061
  %t3063 = or i64 %t3062, 4
  %t3064 = call i64 @rt_root(i64 %t3063)
  store i64 %t3064, ptr @"scheme.base:rd-exp-char?"
  ret i64 17
}

define i64 @"scheme.base:__init_114"() {
entry:
  %t3082 = call ptr @rt_alloc_words(i64 1)
  %t3083 = ptrtoint ptr %t3082 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-sign-char?" to i64), ptr %t3082
  %t3084 = or i64 %t3083, 4
  %t3085 = call i64 @rt_root(i64 %t3084)
  store i64 %t3085, ptr @"scheme.base:rd-sign-char?"
  ret i64 17
}

define i64 @"scheme.base:__init_115"() {
entry:
  %t3118 = call ptr @rt_alloc_words(i64 1)
  %t3119 = ptrtoint ptr %t3118 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-scan-digits" to i64), ptr %t3118
  %t3120 = or i64 %t3119, 4
  %t3121 = call i64 @rt_root(i64 %t3120)
  store i64 %t3121, ptr @"scheme.base:rd-scan-digits"
  ret i64 17
}

define i64 @"scheme.base:__init_116"() {
entry:
  %t3310 = call ptr @rt_alloc_words(i64 1)
  %t3311 = ptrtoint ptr %t3310 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-flonum?" to i64), ptr %t3310
  %t3312 = or i64 %t3311, 4
  %t3313 = call i64 @rt_root(i64 %t3312)
  store i64 %t3313, ptr @"scheme.base:rd-flonum?"
  ret i64 17
}

define i64 @"scheme.base:__init_117"() {
entry:
  %t3347 = call ptr @rt_alloc_words(i64 1)
  %t3348 = ptrtoint ptr %t3347 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-atom" to i64), ptr %t3347
  %t3349 = or i64 %t3348, 4
  %t3350 = call i64 @rt_root(i64 %t3349)
  store i64 %t3350, ptr @"scheme.base:rd-atom"
  ret i64 17
}

define i64 @"scheme.base:__init_118"() {
entry:
  %t3428 = call ptr @rt_alloc_words(i64 1)
  %t3429 = ptrtoint ptr %t3428 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-hex-digit" to i64), ptr %t3428
  %t3430 = or i64 %t3429, 4
  %t3431 = call i64 @rt_root(i64 %t3430)
  store i64 %t3431, ptr @"scheme.base:rd-hex-digit"
  ret i64 17
}

define i64 @"scheme.base:__init_119"() {
entry:
  %t3499 = call ptr @rt_alloc_words(i64 1)
  %t3500 = ptrtoint ptr %t3499 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-hex" to i64), ptr %t3499
  %t3501 = or i64 %t3500, 4
  %t3502 = call i64 @rt_root(i64 %t3501)
  store i64 %t3502, ptr @"scheme.base:rd-hex"
  ret i64 17
}

define i64 @"scheme.base:__init_120"() {
entry:
  %t3532 = call ptr @rt_alloc_words(i64 1)
  %t3533 = ptrtoint ptr %t3532 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-str-esc" to i64), ptr %t3532
  %t3534 = or i64 %t3533, 4
  %t3535 = call i64 @rt_root(i64 %t3534)
  store i64 %t3535, ptr @"scheme.base:rd-str-esc"
  ret i64 17
}

define i64 @"scheme.base:__init_121"() {
entry:
  %t3678 = call ptr @rt_alloc_words(i64 1)
  %t3679 = ptrtoint ptr %t3678 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-string" to i64), ptr %t3678
  %t3680 = or i64 %t3679, 4
  %t3681 = call i64 @rt_root(i64 %t3680)
  store i64 %t3681, ptr @"scheme.base:rd-string"
  ret i64 17
}

define i64 @"scheme.base:__init_122"() {
entry:
  %t3859 = call ptr @rt_alloc_words(i64 1)
  %t3860 = ptrtoint ptr %t3859 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-hash" to i64), ptr %t3859
  %t3861 = or i64 %t3860, 4
  %t3862 = call i64 @rt_root(i64 %t3861)
  store i64 %t3862, ptr @"scheme.base:rd-hash"
  ret i64 17
}

define i64 @"scheme.base:__init_123"() {
entry:
  %t3901 = call ptr @rt_alloc_words(i64 1)
  %t3902 = ptrtoint ptr %t3901 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-char-name" to i64), ptr %t3901
  %t3903 = or i64 %t3902, 4
  %t3904 = call i64 @rt_root(i64 %t3903)
  store i64 %t3904, ptr @"scheme.base:rd-char-name"
  ret i64 17
}

define i64 @"scheme.base:__init_124"() {
entry:
  %t3947 = call ptr @rt_alloc_words(i64 1)
  %t3948 = ptrtoint ptr %t3947 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-char" to i64), ptr %t3947
  %t3949 = or i64 %t3948, 4
  %t3950 = call i64 @rt_root(i64 %t3949)
  store i64 %t3950, ptr @"scheme.base:rd-char"
  ret i64 17
}

define i64 @"scheme.base:__init_125"() {
entry:
  %t3974 = call ptr @rt_alloc_words(i64 1)
  %t3975 = ptrtoint ptr %t3974 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-quote" to i64), ptr %t3974
  %t3976 = or i64 %t3975, 4
  %t3977 = call i64 @rt_root(i64 %t3976)
  store i64 %t3977, ptr @"scheme.base:rd-quote"
  ret i64 17
}

define i64 @"scheme.base:__init_126"() {
entry:
  %t4001 = call ptr @rt_alloc_words(i64 1)
  %t4002 = ptrtoint ptr %t4001 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-quasi" to i64), ptr %t4001
  %t4003 = or i64 %t4002, 4
  %t4004 = call i64 @rt_root(i64 %t4003)
  store i64 %t4004, ptr @"scheme.base:rd-quasi"
  ret i64 17
}

define i64 @"scheme.base:__init_127"() {
entry:
  %t4077 = call ptr @rt_alloc_words(i64 1)
  %t4078 = ptrtoint ptr %t4077 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-unquote" to i64), ptr %t4077
  %t4079 = or i64 %t4078, 4
  %t4080 = call i64 @rt_root(i64 %t4079)
  store i64 %t4080, ptr @"scheme.base:rd-unquote"
  ret i64 17
}

define i64 @"scheme.base:__init_128"() {
entry:
  %t4121 = call ptr @rt_alloc_words(i64 1)
  %t4122 = ptrtoint ptr %t4121 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-dot?" to i64), ptr %t4121
  %t4123 = or i64 %t4122, 4
  %t4124 = call i64 @rt_root(i64 %t4123)
  store i64 %t4124, ptr @"scheme.base:rd-dot?"
  ret i64 17
}

define i64 @"scheme.base:__init_129"() {
entry:
  %t4137 = call ptr @rt_alloc_words(i64 1)
  %t4138 = ptrtoint ptr %t4137 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-append-reverse" to i64), ptr %t4137
  %t4139 = or i64 %t4138, 4
  %t4140 = call i64 @rt_root(i64 %t4139)
  store i64 %t4140, ptr @"scheme.base:rd-append-reverse"
  ret i64 17
}

define i64 @"scheme.base:__init_130"() {
entry:
  %t4262 = call ptr @rt_alloc_words(i64 1)
  %t4263 = ptrtoint ptr %t4262 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-list" to i64), ptr %t4262
  %t4264 = or i64 %t4263, 4
  %t4265 = call i64 @rt_root(i64 %t4264)
  store i64 %t4265, ptr @"scheme.base:rd-list"
  ret i64 17
}

define i64 @"scheme.base:__init_131"() {
entry:
  %t4429 = call ptr @rt_alloc_words(i64 1)
  %t4430 = ptrtoint ptr %t4429 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-datum" to i64), ptr %t4429
  %t4431 = or i64 %t4430, 4
  %t4432 = call i64 @rt_root(i64 %t4431)
  store i64 %t4432, ptr @"scheme.base:rd-datum"
  ret i64 17
}

define i64 @"scheme.base:__init_132"() {
entry:
  %t4448 = call ptr @rt_alloc_words(i64 1)
  %t4449 = ptrtoint ptr %t4448 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-from-string" to i64), ptr %t4448
  %t4450 = or i64 %t4449, 4
  %t4451 = call i64 @rt_root(i64 %t4450)
  store i64 %t4451, ptr @"scheme.base:read-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_133"() {
entry:
  %t4518 = call ptr @rt_alloc_words(i64 1)
  %t4519 = ptrtoint ptr %t4518 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-all-from-string" to i64), ptr %t4518
  %t4520 = or i64 %t4519, 4
  %t4521 = call i64 @rt_root(i64 %t4520)
  store i64 %t4521, ptr @"scheme.base:read-all-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_134"() {
entry:
  %t4522 = call i64 @rt_root(i64 1)
  store i64 %t4522, ptr @"scheme.base:%port-rtd-cell"
  ret i64 17
}

define i64 @"scheme.base:__init_135"() {
entry:
  %t4531 = call ptr @rt_alloc_words(i64 1)
  %t4532 = ptrtoint ptr %t4531 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%port-rtd" to i64), ptr %t4531
  %t4533 = or i64 %t4532, 4
  %t4534 = call i64 @rt_root(i64 %t4533)
  store i64 %t4534, ptr @"scheme.base:%port-rtd"
  ret i64 17
}

define i64 @"scheme.base:__init_136"() {
entry:
  %t4549 = call ptr @rt_alloc_words(i64 1)
  %t4550 = ptrtoint ptr %t4549 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%make-port" to i64), ptr %t4549
  %t4551 = or i64 %t4550, 4
  %t4552 = call i64 @rt_root(i64 %t4551)
  store i64 %t4552, ptr @"scheme.base:%make-port"
  ret i64 17
}

define i64 @"scheme.base:__init_137"() {
entry:
  %t4561 = call ptr @rt_alloc_words(i64 1)
  %t4562 = ptrtoint ptr %t4561 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port?" to i64), ptr %t4561
  %t4563 = or i64 %t4562, 4
  %t4564 = call i64 @rt_root(i64 %t4563)
  store i64 %t4564, ptr @"scheme.base:port?"
  ret i64 17
}

define i64 @"scheme.base:__init_138"() {
entry:
  %t4574 = call ptr @rt_alloc_words(i64 1)
  %t4575 = ptrtoint ptr %t4574 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port?" to i64), ptr %t4574
  %t4576 = or i64 %t4575, 4
  %t4577 = call i64 @rt_root(i64 %t4576)
  store i64 %t4577, ptr @"scheme.base:input-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_139"() {
entry:
  %t4588 = call ptr @rt_alloc_words(i64 1)
  %t4589 = ptrtoint ptr %t4588 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port?" to i64), ptr %t4588
  %t4590 = or i64 %t4589, 4
  %t4591 = call i64 @rt_root(i64 %t4590)
  store i64 %t4591, ptr @"scheme.base:output-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_140"() {
entry:
  %t4599 = call ptr @rt_alloc_words(i64 1)
  %t4600 = ptrtoint ptr %t4599 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:textual-port?" to i64), ptr %t4599
  %t4601 = or i64 %t4600, 4
  %t4602 = call i64 @rt_root(i64 %t4601)
  store i64 %t4602, ptr @"scheme.base:textual-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_141"() {
entry:
  %t4605 = call ptr @rt_alloc_words(i64 1)
  %t4606 = ptrtoint ptr %t4605 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port-closed?" to i64), ptr %t4605
  %t4607 = or i64 %t4606, 4
  %t4608 = call i64 @rt_root(i64 %t4607)
  store i64 %t4608, ptr @"scheme.base:port-closed?"
  ret i64 17
}

define i64 @"scheme.base:__init_142"() {
entry:
  %t4619 = call ptr @rt_alloc_words(i64 1)
  %t4620 = ptrtoint ptr %t4619 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port-open?" to i64), ptr %t4619
  %t4621 = or i64 %t4620, 4
  %t4622 = call i64 @rt_root(i64 %t4621)
  store i64 %t4622, ptr @"scheme.base:input-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_143"() {
entry:
  %t4633 = call ptr @rt_alloc_words(i64 1)
  %t4634 = ptrtoint ptr %t4633 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port-open?" to i64), ptr %t4633
  %t4635 = or i64 %t4634, 4
  %t4636 = call i64 @rt_root(i64 %t4635)
  store i64 %t4636, ptr @"scheme.base:output-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_144"() {
entry:
  %t4662 = call ptr @rt_alloc_words(i64 1)
  %t4663 = ptrtoint ptr %t4662 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-input-port" to i64), ptr %t4662
  %t4664 = or i64 %t4663, 4
  %t4665 = call i64 @rt_root(i64 %t4664)
  store i64 %t4665, ptr @"scheme.base:%check-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_145"() {
entry:
  %t4691 = call ptr @rt_alloc_words(i64 1)
  %t4692 = ptrtoint ptr %t4691 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-output-port" to i64), ptr %t4691
  %t4693 = or i64 %t4692, 4
  %t4694 = call i64 @rt_root(i64 %t4693)
  store i64 %t4694, ptr @"scheme.base:%check-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_146"() {
entry:
  %t4700 = call ptr @rt_alloc_words(i64 1)
  %t4701 = ptrtoint ptr %t4700 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%port-buf" to i64), ptr %t4700
  %t4702 = or i64 %t4701, 4
  %t4703 = call i64 @rt_root(i64 %t4702)
  store i64 %t4703, ptr @"scheme.base:%port-buf"
  ret i64 17
}

define i64 @"scheme.base:__init_147"() {
entry:
  %t4711 = call ptr @rt_alloc_words(i64 1)
  %t4712 = ptrtoint ptr %t4711 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-input-string" to i64), ptr %t4711
  %t4713 = or i64 %t4712, 4
  %t4714 = call i64 @rt_root(i64 %t4713)
  store i64 %t4714, ptr @"scheme.base:open-input-string"
  ret i64 17
}

define i64 @"scheme.base:__init_148"() {
entry:
  %t4732 = call ptr @rt_alloc_words(i64 1)
  %t4733 = ptrtoint ptr %t4732 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-input-file" to i64), ptr %t4732
  %t4734 = or i64 %t4733, 4
  %t4735 = call i64 @rt_root(i64 %t4734)
  store i64 %t4735, ptr @"scheme.base:open-input-file"
  ret i64 17
}

define i64 @"scheme.base:__init_149"() {
entry:
  %t4760 = call ptr @rt_alloc_words(i64 1)
  %t4761 = ptrtoint ptr %t4760 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%port-at-eof?" to i64), ptr %t4760
  %t4762 = or i64 %t4761, 4
  %t4763 = call i64 @rt_root(i64 %t4762)
  store i64 %t4763, ptr @"scheme.base:%port-at-eof?"
  ret i64 17
}

define i64 @"scheme.base:__init_150"() {
entry:
  %t4797 = call ptr @rt_alloc_words(i64 1)
  %t4798 = ptrtoint ptr %t4797 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-char" to i64), ptr %t4797
  %t4799 = or i64 %t4798, 4
  %t4800 = call i64 @rt_root(i64 %t4799)
  store i64 %t4800, ptr @"scheme.base:read-char"
  ret i64 17
}

define i64 @"scheme.base:__init_151"() {
entry:
  %t4825 = call ptr @rt_alloc_words(i64 1)
  %t4826 = ptrtoint ptr %t4825 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:peek-char" to i64), ptr %t4825
  %t4827 = or i64 %t4826, 4
  %t4828 = call i64 @rt_root(i64 %t4827)
  store i64 %t4828, ptr @"scheme.base:peek-char"
  ret i64 17
}

define i64 @"scheme.base:__init_152"() {
entry:
  %t4950 = call ptr @rt_alloc_words(i64 1)
  %t4951 = ptrtoint ptr %t4950 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-line" to i64), ptr %t4950
  %t4952 = or i64 %t4951, 4
  %t4953 = call i64 @rt_root(i64 %t4952)
  store i64 %t4953, ptr @"scheme.base:read-line"
  ret i64 17
}

define i64 @"scheme.base:__init_153"() {
entry:
  %t5005 = call ptr @rt_alloc_words(i64 1)
  %t5006 = ptrtoint ptr %t5005 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-string" to i64), ptr %t5005
  %t5007 = or i64 %t5006, 4
  %t5008 = call i64 @rt_root(i64 %t5007)
  store i64 %t5008, ptr @"scheme.base:read-string"
  ret i64 17
}

define i64 @"scheme.base:__init_154"() {
entry:
  %t5059 = call ptr @rt_alloc_words(i64 1)
  %t5060 = ptrtoint ptr %t5059 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read" to i64), ptr %t5059
  %t5061 = or i64 %t5060, 4
  %t5062 = call i64 @rt_root(i64 %t5061)
  store i64 %t5062, ptr @"scheme.base:read"
  ret i64 17
}

define i64 @"scheme.base:__init_155"() {
entry:
  %t5080 = call ptr @rt_alloc_words(i64 1)
  %t5081 = ptrtoint ptr %t5080 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-output-file" to i64), ptr %t5080
  %t5082 = or i64 %t5081, 4
  %t5083 = call i64 @rt_root(i64 %t5082)
  store i64 %t5083, ptr @"scheme.base:open-output-file"
  ret i64 17
}

define i64 @"scheme.base:__init_156"() {
entry:
  %t5101 = call ptr @rt_alloc_words(i64 1)
  %t5102 = ptrtoint ptr %t5101 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-output-string" to i64), ptr %t5101
  %t5103 = or i64 %t5102, 4
  %t5104 = call i64 @rt_root(i64 %t5103)
  store i64 %t5104, ptr @"scheme.base:open-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_157"() {
entry:
  %t5135 = call ptr @rt_alloc_words(i64 1)
  %t5136 = ptrtoint ptr %t5135 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:get-output-string" to i64), ptr %t5135
  %t5137 = or i64 %t5136, 4
  %t5138 = call i64 @rt_root(i64 %t5137)
  store i64 %t5138, ptr @"scheme.base:get-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_158"() {
entry:
  %t5149 = call ptr @rt_alloc_words(i64 1)
  %t5150 = ptrtoint ptr %t5149 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:flush-output-port" to i64), ptr %t5149
  %t5151 = or i64 %t5150, 4
  %t5152 = call i64 @rt_root(i64 %t5151)
  store i64 %t5152, ptr @"scheme.base:flush-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_159"() {
entry:
  %t5181 = call ptr @rt_alloc_words(i64 1)
  %t5182 = ptrtoint ptr %t5181 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-port" to i64), ptr %t5181
  %t5183 = or i64 %t5182, 4
  %t5184 = call i64 @rt_root(i64 %t5183)
  store i64 %t5184, ptr @"scheme.base:close-port"
  ret i64 17
}

define i64 @"scheme.base:__init_160"() {
entry:
  %t5207 = call ptr @rt_alloc_words(i64 1)
  %t5208 = ptrtoint ptr %t5207 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-input-port" to i64), ptr %t5207
  %t5209 = or i64 %t5208, 4
  %t5210 = call i64 @rt_root(i64 %t5209)
  store i64 %t5210, ptr @"scheme.base:close-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_161"() {
entry:
  %t5233 = call ptr @rt_alloc_words(i64 1)
  %t5234 = ptrtoint ptr %t5233 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-output-port" to i64), ptr %t5233
  %t5235 = or i64 %t5234, 4
  %t5236 = call i64 @rt_root(i64 %t5235)
  store i64 %t5236, ptr @"scheme.base:close-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_162"() {
entry:
  %t5237 = call i64 @rt_root(i64 1)
  store i64 %t5237, ptr @"scheme.base:%stdout-port"
  ret i64 17
}

define i64 @"scheme.base:__init_163"() {
entry:
  %t5238 = call i64 @rt_root(i64 1)
  store i64 %t5238, ptr @"scheme.base:%stderr-port"
  ret i64 17
}

define i64 @"scheme.base:__init_164"() {
entry:
  %t5239 = call i64 @rt_root(i64 1)
  store i64 %t5239, ptr @"scheme.base:%stdin-port"
  ret i64 17
}

define i64 @"scheme.base:__init_165"() {
entry:
  %t5271 = call ptr @rt_alloc_words(i64 1)
  %t5272 = ptrtoint ptr %t5271 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-output-port" to i64), ptr %t5271
  %t5273 = or i64 %t5272, 4
  %t5274 = call i64 @rt_root(i64 %t5273)
  store i64 %t5274, ptr @"scheme.base:current-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_166"() {
entry:
  %t5303 = call ptr @rt_alloc_words(i64 1)
  %t5304 = ptrtoint ptr %t5303 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-error-port" to i64), ptr %t5303
  %t5305 = or i64 %t5304, 4
  %t5306 = call i64 @rt_root(i64 %t5305)
  store i64 %t5306, ptr @"scheme.base:current-error-port"
  ret i64 17
}

define i64 @"scheme.base:__init_167"() {
entry:
  %t5335 = call ptr @rt_alloc_words(i64 1)
  %t5336 = ptrtoint ptr %t5335 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-input-port" to i64), ptr %t5335
  %t5337 = or i64 %t5336, 4
  %t5338 = call i64 @rt_root(i64 %t5337)
  store i64 %t5338, ptr @"scheme.base:current-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_168"() {
entry:
  %t5385 = call ptr @rt_alloc_words(i64 1)
  %t5386 = ptrtoint ptr %t5385 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-port" to i64), ptr %t5385
  %t5387 = or i64 %t5386, 4
  %t5388 = call i64 @rt_root(i64 %t5387)
  store i64 %t5388, ptr @"scheme.base:call-with-port"
  ret i64 17
}

define i64 @"scheme.base:__init_169"() {
entry:
  %t5449 = call ptr @rt_alloc_words(i64 1)
  %t5450 = ptrtoint ptr %t5449 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-output-to-file" to i64), ptr %t5449
  %t5451 = or i64 %t5450, 4
  %t5452 = call i64 @rt_root(i64 %t5451)
  store i64 %t5452, ptr @"scheme.base:with-output-to-file"
  ret i64 17
}

define i64 @"scheme.base:__init_170"() {
entry:
  %t5513 = call ptr @rt_alloc_words(i64 1)
  %t5514 = ptrtoint ptr %t5513 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-input-from-file" to i64), ptr %t5513
  %t5515 = or i64 %t5514, 4
  %t5516 = call i64 @rt_root(i64 %t5515)
  store i64 %t5516, ptr @"scheme.base:with-input-from-file"
  ret i64 17
}

define i64 @"scheme.base:__init_171"() {
entry:
  %t5530 = call ptr @rt_alloc_words(i64 1)
  %t5531 = ptrtoint ptr %t5530 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-output-file" to i64), ptr %t5530
  %t5532 = or i64 %t5531, 4
  %t5533 = call i64 @rt_root(i64 %t5532)
  store i64 %t5533, ptr @"scheme.base:call-with-output-file"
  ret i64 17
}

define i64 @"scheme.base:__init_172"() {
entry:
  %t5547 = call ptr @rt_alloc_words(i64 1)
  %t5548 = ptrtoint ptr %t5547 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-input-file" to i64), ptr %t5547
  %t5549 = or i64 %t5548, 4
  %t5550 = call i64 @rt_root(i64 %t5549)
  store i64 %t5550, ptr @"scheme.base:call-with-input-file"
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
  call i64 @"scheme.base:__init_169"()
  call i64 @"scheme.base:__init_170"()
  call i64 @"scheme.base:__init_171"()
  call i64 @"scheme.base:__init_172"()
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

