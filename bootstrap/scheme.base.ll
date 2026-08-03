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

define fastcc i64 @"scheme.base:code:max"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t884 = icmp eq i64 %argc, 2
  br i1 %t884, label %argok199, label %arityerr198
arityerr198:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok199:
  %t885 = or i64 %a0, %a1
  %t886 = and i64 %t885, 7
  %t887 = icmp eq i64 %t886, 0
  br i1 %t887, label %fixfast200, label %fixslow201
fixfast200:
  %t888 = icmp slt i64 %a0, %a1
  %t889 = select i1 %t888, i64 257, i64 1
  br label %fixmerge202
fixslow201:
  %t890 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge202
fixmerge202:
  %t891 = phi i64 [ %t889, %fixfast200 ], [ %t890, %fixslow201 ]
  %t892 = icmp ne i64 %t891, 1
  br i1 %t892, label %then203, label %else204
then203:
  ret i64 %a1
else204:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:void"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t897 = icmp eq i64 %argc, 0
  br i1 %t897, label %argok206, label %arityerr205
arityerr205:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok206:
  %t898 = icmp ne i64 1, 1
  br i1 %t898, label %then207, label %else208
then207:
  ret i64 1
else208:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t903 = icmp sge i64 %argc, 0
  br i1 %t903, label %argok210, label %arityerr209
arityerr209:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok210:
  %t904 = call ptr @rt_alloc_words(i64 8)
  %t905 = getelementptr i64, ptr %t904, i64 0
  store i64 %a0, ptr %t905
  %t906 = getelementptr i64, ptr %t904, i64 1
  store i64 %a1, ptr %t906
  %t907 = getelementptr i64, ptr %t904, i64 2
  store i64 %a2, ptr %t907
  %t908 = getelementptr i64, ptr %t904, i64 3
  store i64 %a3, ptr %t908
  %t909 = getelementptr i64, ptr %t904, i64 4
  store i64 %a4, ptr %t909
  %t910 = getelementptr i64, ptr %t904, i64 5
  store i64 %a5, ptr %t910
  %t911 = getelementptr i64, ptr %t904, i64 6
  store i64 %a6, ptr %t911
  %t912 = getelementptr i64, ptr %t904, i64 7
  store i64 %a7, ptr %t912
  %t913 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t904, ptr %overflow)
  %t914 = call i64 @rt_list_to_string(i64 %t913)
  ret i64 %t914
}

define fastcc i64 @"scheme.base:code:%str-concat"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t919 = icmp eq i64 %argc, 1
  br i1 %t919, label %argok212, label %arityerr211
arityerr211:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok212:
  %t920 = call i64 @rt_null_p(i64 %a0)
  %t921 = icmp ne i64 %t920, 1
  br i1 %t921, label %then213, label %else214
then213:
  %t922 = call i64 @rt_make_string(ptr @.str.lit.0, i64 0)
  ret i64 %t922
else214:
  %t923 = call i64 @rt_car(i64 %a0)
  %t924 = call i64 @rt_cdr(i64 %a0)
  %t925 = load i64, ptr @"scheme.base:%str-concat"
  %t926 = and i64 %t925, -8
  %t927 = inttoptr i64 %t926 to ptr
  %t928 = load i64, ptr %t927
  %t929 = inttoptr i64 %t928 to ptr
  %t930 = call fastcc i64%t929(i64 %t925, i64 1, i64 %t924, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t931 = call i64 @rt_string_append(i64 %t923, i64 %t930)
  ret i64 %t931
}

define fastcc i64 @"scheme.base:code:chr-cmp"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t936 = icmp eq i64 %argc, 4
  br i1 %t936, label %argok216, label %arityerr215
arityerr215:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok216:
  %t937 = call i64 @rt_char_to_integer(i64 %a1)
  %t938 = call i64 @rt_char_to_integer(i64 %a2)
  %t939 = and i64 %a0, -8
  %t940 = inttoptr i64 %t939 to ptr
  %t941 = load i64, ptr %t940
  %t942 = inttoptr i64 %t941 to ptr
  %t943 = call fastcc i64%t942(i64 %a0, i64 2, i64 %t937, i64 %t938, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t944 = icmp ne i64 %t943, 1
  br i1 %t944, label %then217, label %else218
then217:
  %t945 = call i64 @rt_null_p(i64 %a3)
  %t946 = icmp ne i64 %t945, 1
  br i1 %t946, label %then219, label %else220
then219:
  ret i64 257
else220:
  %t947 = call i64 @rt_car(i64 %a3)
  %t948 = call i64 @rt_cdr(i64 %a3)
  %t949 = load i64, ptr @"scheme.base:chr-cmp"
  %t950 = and i64 %t949, -8
  %t951 = inttoptr i64 %t950 to ptr
  %t952 = load i64, ptr %t951
  %t953 = inttoptr i64 %t952 to ptr
  %t954 = musttail call fastcc i64 %t953(i64 %t949, i64 4, i64 %a0, i64 %a2, i64 %t947, i64 %t948, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t954
else218:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_183"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t959 = icmp eq i64 %argc, 2
  br i1 %t959, label %argok222, label %arityerr221
arityerr221:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok222:
  %t960 = or i64 %a0, %a1
  %t961 = and i64 %t960, 7
  %t962 = icmp eq i64 %t961, 0
  br i1 %t962, label %fixfast223, label %fixslow224
fixfast223:
  %t963 = icmp eq i64 %a0, %a1
  %t964 = select i1 %t963, i64 257, i64 1
  br label %fixmerge225
fixslow224:
  %t965 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge225
fixmerge225:
  %t966 = phi i64 [ %t964, %fixfast223 ], [ %t965, %fixslow224 ]
  ret i64 %t966
}

define fastcc i64 @"scheme.base:code:char=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t967 = icmp sge i64 %argc, 2
  br i1 %t967, label %argok227, label %arityerr226
arityerr226:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok227:
  %t968 = call ptr @rt_alloc_words(i64 8)
  %t969 = getelementptr i64, ptr %t968, i64 0
  store i64 %a0, ptr %t969
  %t970 = getelementptr i64, ptr %t968, i64 1
  store i64 %a1, ptr %t970
  %t971 = getelementptr i64, ptr %t968, i64 2
  store i64 %a2, ptr %t971
  %t972 = getelementptr i64, ptr %t968, i64 3
  store i64 %a3, ptr %t972
  %t973 = getelementptr i64, ptr %t968, i64 4
  store i64 %a4, ptr %t973
  %t974 = getelementptr i64, ptr %t968, i64 5
  store i64 %a5, ptr %t974
  %t975 = getelementptr i64, ptr %t968, i64 6
  store i64 %a6, ptr %t975
  %t976 = getelementptr i64, ptr %t968, i64 7
  store i64 %a7, ptr %t976
  %t977 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t968, ptr %overflow)
  %t978 = call ptr @rt_alloc_words(i64 1)
  %t979 = ptrtoint ptr %t978 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_183" to i64), ptr %t978
  %t980 = or i64 %t979, 4
  %t981 = load i64, ptr @"scheme.base:chr-cmp"
  %t982 = and i64 %t981, -8
  %t983 = inttoptr i64 %t982 to ptr
  %t984 = load i64, ptr %t983
  %t985 = inttoptr i64 %t984 to ptr
  %t986 = musttail call fastcc i64 %t985(i64 %t981, i64 4, i64 %t980, i64 %a0, i64 %a1, i64 %t977, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t986
}

define fastcc i64 @"scheme.base:code_195"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t991 = icmp eq i64 %argc, 2
  br i1 %t991, label %argok229, label %arityerr228
arityerr228:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok229:
  %t992 = or i64 %a0, %a1
  %t993 = and i64 %t992, 7
  %t994 = icmp eq i64 %t993, 0
  br i1 %t994, label %fixfast230, label %fixslow231
fixfast230:
  %t995 = icmp slt i64 %a0, %a1
  %t996 = select i1 %t995, i64 257, i64 1
  br label %fixmerge232
fixslow231:
  %t997 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge232
fixmerge232:
  %t998 = phi i64 [ %t996, %fixfast230 ], [ %t997, %fixslow231 ]
  ret i64 %t998
}

define fastcc i64 @"scheme.base:code:char<?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t999 = icmp sge i64 %argc, 2
  br i1 %t999, label %argok234, label %arityerr233
arityerr233:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok234:
  %t1000 = call ptr @rt_alloc_words(i64 8)
  %t1001 = getelementptr i64, ptr %t1000, i64 0
  store i64 %a0, ptr %t1001
  %t1002 = getelementptr i64, ptr %t1000, i64 1
  store i64 %a1, ptr %t1002
  %t1003 = getelementptr i64, ptr %t1000, i64 2
  store i64 %a2, ptr %t1003
  %t1004 = getelementptr i64, ptr %t1000, i64 3
  store i64 %a3, ptr %t1004
  %t1005 = getelementptr i64, ptr %t1000, i64 4
  store i64 %a4, ptr %t1005
  %t1006 = getelementptr i64, ptr %t1000, i64 5
  store i64 %a5, ptr %t1006
  %t1007 = getelementptr i64, ptr %t1000, i64 6
  store i64 %a6, ptr %t1007
  %t1008 = getelementptr i64, ptr %t1000, i64 7
  store i64 %a7, ptr %t1008
  %t1009 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1000, ptr %overflow)
  %t1010 = call ptr @rt_alloc_words(i64 1)
  %t1011 = ptrtoint ptr %t1010 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_195" to i64), ptr %t1010
  %t1012 = or i64 %t1011, 4
  %t1013 = load i64, ptr @"scheme.base:chr-cmp"
  %t1014 = and i64 %t1013, -8
  %t1015 = inttoptr i64 %t1014 to ptr
  %t1016 = load i64, ptr %t1015
  %t1017 = inttoptr i64 %t1016 to ptr
  %t1018 = musttail call fastcc i64 %t1017(i64 %t1013, i64 4, i64 %t1012, i64 %a0, i64 %a1, i64 %t1009, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1018
}

define fastcc i64 @"scheme.base:code_207"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1023 = icmp eq i64 %argc, 2
  br i1 %t1023, label %argok236, label %arityerr235
arityerr235:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok236:
  %t1024 = or i64 %a1, %a0
  %t1025 = and i64 %t1024, 7
  %t1026 = icmp eq i64 %t1025, 0
  br i1 %t1026, label %fixfast237, label %fixslow238
fixfast237:
  %t1027 = icmp slt i64 %a1, %a0
  %t1028 = select i1 %t1027, i64 257, i64 1
  br label %fixmerge239
fixslow238:
  %t1029 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge239
fixmerge239:
  %t1030 = phi i64 [ %t1028, %fixfast237 ], [ %t1029, %fixslow238 ]
  ret i64 %t1030
}

define fastcc i64 @"scheme.base:code:char>?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1031 = icmp sge i64 %argc, 2
  br i1 %t1031, label %argok241, label %arityerr240
arityerr240:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok241:
  %t1032 = call ptr @rt_alloc_words(i64 8)
  %t1033 = getelementptr i64, ptr %t1032, i64 0
  store i64 %a0, ptr %t1033
  %t1034 = getelementptr i64, ptr %t1032, i64 1
  store i64 %a1, ptr %t1034
  %t1035 = getelementptr i64, ptr %t1032, i64 2
  store i64 %a2, ptr %t1035
  %t1036 = getelementptr i64, ptr %t1032, i64 3
  store i64 %a3, ptr %t1036
  %t1037 = getelementptr i64, ptr %t1032, i64 4
  store i64 %a4, ptr %t1037
  %t1038 = getelementptr i64, ptr %t1032, i64 5
  store i64 %a5, ptr %t1038
  %t1039 = getelementptr i64, ptr %t1032, i64 6
  store i64 %a6, ptr %t1039
  %t1040 = getelementptr i64, ptr %t1032, i64 7
  store i64 %a7, ptr %t1040
  %t1041 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1032, ptr %overflow)
  %t1042 = call ptr @rt_alloc_words(i64 1)
  %t1043 = ptrtoint ptr %t1042 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_207" to i64), ptr %t1042
  %t1044 = or i64 %t1043, 4
  %t1045 = load i64, ptr @"scheme.base:chr-cmp"
  %t1046 = and i64 %t1045, -8
  %t1047 = inttoptr i64 %t1046 to ptr
  %t1048 = load i64, ptr %t1047
  %t1049 = inttoptr i64 %t1048 to ptr
  %t1050 = musttail call fastcc i64 %t1049(i64 %t1045, i64 4, i64 %t1044, i64 %a0, i64 %a1, i64 %t1041, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1050
}

define fastcc i64 @"scheme.base:code_219"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1055 = icmp eq i64 %argc, 2
  br i1 %t1055, label %argok243, label %arityerr242
arityerr242:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok243:
  %t1056 = or i64 %a0, %a1
  %t1057 = and i64 %t1056, 7
  %t1058 = icmp eq i64 %t1057, 0
  br i1 %t1058, label %fixfast244, label %fixslow245
fixfast244:
  %t1059 = icmp slt i64 %a0, %a1
  %t1060 = select i1 %t1059, i64 257, i64 1
  br label %fixmerge246
fixslow245:
  %t1061 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge246
fixmerge246:
  %t1062 = phi i64 [ %t1060, %fixfast244 ], [ %t1061, %fixslow245 ]
  %t1063 = icmp ne i64 %t1062, 1
  br i1 %t1063, label %then247, label %else248
then247:
  ret i64 257
else248:
  %t1064 = or i64 %a0, %a1
  %t1065 = and i64 %t1064, 7
  %t1066 = icmp eq i64 %t1065, 0
  br i1 %t1066, label %fixfast249, label %fixslow250
fixfast249:
  %t1067 = icmp eq i64 %a0, %a1
  %t1068 = select i1 %t1067, i64 257, i64 1
  br label %fixmerge251
fixslow250:
  %t1069 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge251
fixmerge251:
  %t1070 = phi i64 [ %t1068, %fixfast249 ], [ %t1069, %fixslow250 ]
  ret i64 %t1070
}

define fastcc i64 @"scheme.base:code:char<=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1071 = icmp sge i64 %argc, 2
  br i1 %t1071, label %argok253, label %arityerr252
arityerr252:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok253:
  %t1072 = call ptr @rt_alloc_words(i64 8)
  %t1073 = getelementptr i64, ptr %t1072, i64 0
  store i64 %a0, ptr %t1073
  %t1074 = getelementptr i64, ptr %t1072, i64 1
  store i64 %a1, ptr %t1074
  %t1075 = getelementptr i64, ptr %t1072, i64 2
  store i64 %a2, ptr %t1075
  %t1076 = getelementptr i64, ptr %t1072, i64 3
  store i64 %a3, ptr %t1076
  %t1077 = getelementptr i64, ptr %t1072, i64 4
  store i64 %a4, ptr %t1077
  %t1078 = getelementptr i64, ptr %t1072, i64 5
  store i64 %a5, ptr %t1078
  %t1079 = getelementptr i64, ptr %t1072, i64 6
  store i64 %a6, ptr %t1079
  %t1080 = getelementptr i64, ptr %t1072, i64 7
  store i64 %a7, ptr %t1080
  %t1081 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1072, ptr %overflow)
  %t1082 = call ptr @rt_alloc_words(i64 1)
  %t1083 = ptrtoint ptr %t1082 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_219" to i64), ptr %t1082
  %t1084 = or i64 %t1083, 4
  %t1085 = load i64, ptr @"scheme.base:chr-cmp"
  %t1086 = and i64 %t1085, -8
  %t1087 = inttoptr i64 %t1086 to ptr
  %t1088 = load i64, ptr %t1087
  %t1089 = inttoptr i64 %t1088 to ptr
  %t1090 = musttail call fastcc i64 %t1089(i64 %t1085, i64 4, i64 %t1084, i64 %a0, i64 %a1, i64 %t1081, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1090
}

define fastcc i64 @"scheme.base:code_231"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1095 = icmp eq i64 %argc, 2
  br i1 %t1095, label %argok255, label %arityerr254
arityerr254:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok255:
  %t1096 = or i64 %a1, %a0
  %t1097 = and i64 %t1096, 7
  %t1098 = icmp eq i64 %t1097, 0
  br i1 %t1098, label %fixfast256, label %fixslow257
fixfast256:
  %t1099 = icmp slt i64 %a1, %a0
  %t1100 = select i1 %t1099, i64 257, i64 1
  br label %fixmerge258
fixslow257:
  %t1101 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge258
fixmerge258:
  %t1102 = phi i64 [ %t1100, %fixfast256 ], [ %t1101, %fixslow257 ]
  %t1103 = icmp ne i64 %t1102, 1
  br i1 %t1103, label %then259, label %else260
then259:
  ret i64 257
else260:
  %t1104 = or i64 %a0, %a1
  %t1105 = and i64 %t1104, 7
  %t1106 = icmp eq i64 %t1105, 0
  br i1 %t1106, label %fixfast261, label %fixslow262
fixfast261:
  %t1107 = icmp eq i64 %a0, %a1
  %t1108 = select i1 %t1107, i64 257, i64 1
  br label %fixmerge263
fixslow262:
  %t1109 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge263
fixmerge263:
  %t1110 = phi i64 [ %t1108, %fixfast261 ], [ %t1109, %fixslow262 ]
  ret i64 %t1110
}

define fastcc i64 @"scheme.base:code:char>=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1111 = icmp sge i64 %argc, 2
  br i1 %t1111, label %argok265, label %arityerr264
arityerr264:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok265:
  %t1112 = call ptr @rt_alloc_words(i64 8)
  %t1113 = getelementptr i64, ptr %t1112, i64 0
  store i64 %a0, ptr %t1113
  %t1114 = getelementptr i64, ptr %t1112, i64 1
  store i64 %a1, ptr %t1114
  %t1115 = getelementptr i64, ptr %t1112, i64 2
  store i64 %a2, ptr %t1115
  %t1116 = getelementptr i64, ptr %t1112, i64 3
  store i64 %a3, ptr %t1116
  %t1117 = getelementptr i64, ptr %t1112, i64 4
  store i64 %a4, ptr %t1117
  %t1118 = getelementptr i64, ptr %t1112, i64 5
  store i64 %a5, ptr %t1118
  %t1119 = getelementptr i64, ptr %t1112, i64 6
  store i64 %a6, ptr %t1119
  %t1120 = getelementptr i64, ptr %t1112, i64 7
  store i64 %a7, ptr %t1120
  %t1121 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1112, ptr %overflow)
  %t1122 = call ptr @rt_alloc_words(i64 1)
  %t1123 = ptrtoint ptr %t1122 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_231" to i64), ptr %t1122
  %t1124 = or i64 %t1123, 4
  %t1125 = load i64, ptr @"scheme.base:chr-cmp"
  %t1126 = and i64 %t1125, -8
  %t1127 = inttoptr i64 %t1126 to ptr
  %t1128 = load i64, ptr %t1127
  %t1129 = inttoptr i64 %t1128 to ptr
  %t1130 = musttail call fastcc i64 %t1129(i64 %t1125, i64 4, i64 %t1124, i64 %a0, i64 %a1, i64 %t1121, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1130
}

define fastcc i64 @"scheme.base:code_242"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1135 = icmp eq i64 %argc, 2
  br i1 %t1135, label %argok267, label %arityerr266
arityerr266:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok267:
  %t1136 = or i64 %a0, 0
  %t1137 = and i64 %t1136, 7
  %t1138 = icmp eq i64 %t1137, 0
  br i1 %t1138, label %fixfast268, label %fixslow269
fixfast268:
  %t1139 = icmp slt i64 %a0, 0
  %t1140 = select i1 %t1139, i64 257, i64 1
  br label %fixmerge270
fixslow269:
  %t1141 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge270
fixmerge270:
  %t1142 = phi i64 [ %t1140, %fixfast268 ], [ %t1141, %fixslow269 ]
  %t1143 = icmp ne i64 %t1142, 1
  br i1 %t1143, label %then271, label %else272
then271:
  ret i64 %a1
else272:
  %t1144 = or i64 %a0, 8
  %t1145 = and i64 %t1144, 7
  %t1146 = icmp eq i64 %t1145, 0
  br i1 %t1146, label %fixfast273, label %fixslow274
fixfast273:
  %t1147 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t1148 = extractvalue {i64, i1} %t1147, 0
  %t1149 = extractvalue {i64, i1} %t1147, 1
  br i1 %t1149, label %fixslow274, label %fixmerge275
fixslow274:
  %t1150 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge275
fixmerge275:
  %t1151 = phi i64 [ %t1148, %fixfast273 ], [ %t1150, %fixslow274 ]
  %t1152 = and i64 %self, -8
  %t1153 = inttoptr i64 %t1152 to ptr
  %t1154 = getelementptr i64, ptr %t1153, i64 2
  %t1155 = load i64, ptr %t1154
  %t1156 = call i64 @rt_string_ref(i64 %t1155, i64 %a0)
  %t1157 = call i64 @rt_cons(i64 %t1156, i64 %a1)
  %t1158 = musttail call fastcc i64 @"scheme.base:code_242"(i64 %self, i64 2, i64 %t1151, i64 %t1157, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1158
}

define fastcc i64 @"scheme.base:code:string->list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1159 = icmp eq i64 %argc, 1
  br i1 %t1159, label %argok277, label %arityerr276
arityerr276:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok277:
  %t1160 = call ptr @rt_alloc_words(i64 3)
  %t1161 = ptrtoint ptr %t1160 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_242" to i64), ptr %t1160
  %t1162 = or i64 %t1161, 4
  %t1163 = getelementptr i64, ptr %t1160, i64 1
  store i64 %t1162, ptr %t1163
  %t1164 = getelementptr i64, ptr %t1160, i64 2
  store i64 %a0, ptr %t1164
  %t1165 = call i64 @rt_string_length(i64 %a0)
  %t1166 = or i64 %t1165, 8
  %t1167 = and i64 %t1166, 7
  %t1168 = icmp eq i64 %t1167, 0
  br i1 %t1168, label %fixfast278, label %fixslow279
fixfast278:
  %t1169 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t1165, i64 8)
  %t1170 = extractvalue {i64, i1} %t1169, 0
  %t1171 = extractvalue {i64, i1} %t1169, 1
  br i1 %t1171, label %fixslow279, label %fixmerge280
fixslow279:
  %t1172 = call i64 @rt_sub(i64 %t1165, i64 8)
  br label %fixmerge280
fixmerge280:
  %t1173 = phi i64 [ %t1170, %fixfast278 ], [ %t1172, %fixslow279 ]
  %t1174 = musttail call fastcc i64 @"scheme.base:code_242"(i64 %t1162, i64 2, i64 %t1173, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1174
}

define fastcc i64 @"scheme.base:code:ns-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1179 = icmp eq i64 %argc, 2
  br i1 %t1179, label %argok282, label %arityerr281
arityerr281:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok282:
  %t1180 = call i64 @rt_remainder(i64 %a0, i64 80)
  %t1181 = or i64 0, %t1180
  %t1182 = and i64 %t1181, 7
  %t1183 = icmp eq i64 %t1182, 0
  br i1 %t1183, label %fixfast283, label %fixslow284
fixfast283:
  %t1184 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %t1180)
  %t1185 = extractvalue {i64, i1} %t1184, 0
  %t1186 = extractvalue {i64, i1} %t1184, 1
  br i1 %t1186, label %fixslow284, label %fixmerge285
fixslow284:
  %t1187 = call i64 @rt_sub(i64 0, i64 %t1180)
  br label %fixmerge285
fixmerge285:
  %t1188 = phi i64 [ %t1185, %fixfast283 ], [ %t1187, %fixslow284 ]
  %t1189 = or i64 384, %t1188
  %t1190 = and i64 %t1189, 7
  %t1191 = icmp eq i64 %t1190, 0
  br i1 %t1191, label %fixfast286, label %fixslow287
fixfast286:
  %t1192 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 384, i64 %t1188)
  %t1193 = extractvalue {i64, i1} %t1192, 0
  %t1194 = extractvalue {i64, i1} %t1192, 1
  br i1 %t1194, label %fixslow287, label %fixmerge288
fixslow287:
  %t1195 = call i64 @rt_add(i64 384, i64 %t1188)
  br label %fixmerge288
fixmerge288:
  %t1196 = phi i64 [ %t1193, %fixfast286 ], [ %t1195, %fixslow287 ]
  %t1197 = call i64 @rt_integer_to_char(i64 %t1196)
  %t1198 = call i64 @rt_quotient(i64 %a0, i64 80)
  %t1199 = or i64 %t1198, 0
  %t1200 = and i64 %t1199, 7
  %t1201 = icmp eq i64 %t1200, 0
  br i1 %t1201, label %fixfast289, label %fixslow290
fixfast289:
  %t1202 = icmp eq i64 %t1198, 0
  %t1203 = select i1 %t1202, i64 257, i64 1
  br label %fixmerge291
fixslow290:
  %t1204 = call i64 @rt_num_eq(i64 %t1198, i64 0)
  br label %fixmerge291
fixmerge291:
  %t1205 = phi i64 [ %t1203, %fixfast289 ], [ %t1204, %fixslow290 ]
  %t1206 = icmp ne i64 %t1205, 1
  br i1 %t1206, label %then292, label %else293
then292:
  %t1207 = call i64 @rt_cons(i64 %t1197, i64 %a1)
  ret i64 %t1207
else293:
  %t1208 = call i64 @rt_cons(i64 %t1197, i64 %a1)
  %t1209 = load i64, ptr @"scheme.base:ns-digits"
  %t1210 = and i64 %t1209, -8
  %t1211 = inttoptr i64 %t1210 to ptr
  %t1212 = load i64, ptr %t1211
  %t1213 = inttoptr i64 %t1212 to ptr
  %t1214 = musttail call fastcc i64 %t1213(i64 %t1209, i64 2, i64 %t1198, i64 %t1208, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1214
}

define fastcc i64 @"scheme.base:code:number->string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1219 = icmp eq i64 %argc, 1
  br i1 %t1219, label %argok295, label %arityerr294
arityerr294:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok295:
  %t1220 = call i64 @rt_exact_p(i64 %a0)
  %t1221 = icmp ne i64 %t1220, 1
  br i1 %t1221, label %then296, label %else297
then296:
  %t1222 = or i64 %a0, 0
  %t1223 = and i64 %t1222, 7
  %t1224 = icmp eq i64 %t1223, 0
  br i1 %t1224, label %fixfast298, label %fixslow299
fixfast298:
  %t1225 = icmp eq i64 %a0, 0
  %t1226 = select i1 %t1225, i64 257, i64 1
  br label %fixmerge300
fixslow299:
  %t1227 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge300
fixmerge300:
  %t1228 = phi i64 [ %t1226, %fixfast298 ], [ %t1227, %fixslow299 ]
  %t1229 = icmp ne i64 %t1228, 1
  br i1 %t1229, label %then301, label %else302
then301:
  %t1230 = call i64 @rt_make_string(ptr @.str.lit.1, i64 1)
  ret i64 %t1230
else302:
  %t1231 = or i64 %a0, 0
  %t1232 = and i64 %t1231, 7
  %t1233 = icmp eq i64 %t1232, 0
  br i1 %t1233, label %fixfast303, label %fixslow304
fixfast303:
  %t1234 = icmp slt i64 %a0, 0
  %t1235 = select i1 %t1234, i64 257, i64 1
  br label %fixmerge305
fixslow304:
  %t1236 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge305
fixmerge305:
  %t1237 = phi i64 [ %t1235, %fixfast303 ], [ %t1236, %fixslow304 ]
  %t1238 = icmp ne i64 %t1237, 1
  br i1 %t1238, label %then306, label %else307
then306:
  %t1239 = load i64, ptr @"scheme.base:ns-digits"
  %t1240 = and i64 %t1239, -8
  %t1241 = inttoptr i64 %t1240 to ptr
  %t1242 = load i64, ptr %t1241
  %t1243 = inttoptr i64 %t1242 to ptr
  %t1244 = call fastcc i64%t1243(i64 %t1239, i64 2, i64 %a0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1245 = call i64 @rt_cons(i64 11529, i64 %t1244)
  %t1246 = call i64 @rt_list_to_string(i64 %t1245)
  ret i64 %t1246
else307:
  %t1247 = or i64 0, %a0
  %t1248 = and i64 %t1247, 7
  %t1249 = icmp eq i64 %t1248, 0
  br i1 %t1249, label %fixfast308, label %fixslow309
fixfast308:
  %t1250 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %a0)
  %t1251 = extractvalue {i64, i1} %t1250, 0
  %t1252 = extractvalue {i64, i1} %t1250, 1
  br i1 %t1252, label %fixslow309, label %fixmerge310
fixslow309:
  %t1253 = call i64 @rt_sub(i64 0, i64 %a0)
  br label %fixmerge310
fixmerge310:
  %t1254 = phi i64 [ %t1251, %fixfast308 ], [ %t1253, %fixslow309 ]
  %t1255 = load i64, ptr @"scheme.base:ns-digits"
  %t1256 = and i64 %t1255, -8
  %t1257 = inttoptr i64 %t1256 to ptr
  %t1258 = load i64, ptr %t1257
  %t1259 = inttoptr i64 %t1258 to ptr
  %t1260 = call fastcc i64%t1259(i64 %t1255, i64 2, i64 %t1254, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1261 = call i64 @rt_list_to_string(i64 %t1260)
  ret i64 %t1261
else297:
  %t1262 = call i64 @rt_flonum_to_string(i64 %a0)
  ret i64 %t1262
}

define fastcc i64 @"scheme.base:code:error"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1267 = icmp sge i64 %argc, 1
  br i1 %t1267, label %argok312, label %arityerr311
arityerr311:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok312:
  %t1268 = call ptr @rt_alloc_words(i64 8)
  %t1269 = getelementptr i64, ptr %t1268, i64 0
  store i64 %a0, ptr %t1269
  %t1270 = getelementptr i64, ptr %t1268, i64 1
  store i64 %a1, ptr %t1270
  %t1271 = getelementptr i64, ptr %t1268, i64 2
  store i64 %a2, ptr %t1271
  %t1272 = getelementptr i64, ptr %t1268, i64 3
  store i64 %a3, ptr %t1272
  %t1273 = getelementptr i64, ptr %t1268, i64 4
  store i64 %a4, ptr %t1273
  %t1274 = getelementptr i64, ptr %t1268, i64 5
  store i64 %a5, ptr %t1274
  %t1275 = getelementptr i64, ptr %t1268, i64 6
  store i64 %a6, ptr %t1275
  %t1276 = getelementptr i64, ptr %t1268, i64 7
  store i64 %a7, ptr %t1276
  %t1277 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t1268, ptr %overflow)
  %t1278 = call i64 @rt_string_p(i64 %a0)
  %t1279 = icmp ne i64 %t1278, 1
  br i1 %t1279, label %then313, label %else314
then313:
  %t1280 = call i64 @rt_make_error_object(i64 %a0, i64 %t1277)
  %t1281 = load i64, ptr @"scheme.base:raise"
  %t1282 = and i64 %t1281, -8
  %t1283 = inttoptr i64 %t1282 to ptr
  %t1284 = load i64, ptr %t1283
  %t1285 = inttoptr i64 %t1284 to ptr
  %t1286 = musttail call fastcc i64 %t1285(i64 %t1281, i64 1, i64 %t1280, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1286
else314:
  %t1287 = call i64 @rt_symbol_to_string(i64 %a0)
  %t1288 = call i64 @rt_make_string(ptr @.str.lit.2, i64 2)
  %t1289 = call i64 @rt_car(i64 %t1277)
  %t1290 = call i64 @rt_string_append(i64 %t1288, i64 %t1289)
  %t1291 = call i64 @rt_string_append(i64 %t1287, i64 %t1290)
  %t1292 = call i64 @rt_cdr(i64 %t1277)
  %t1293 = call i64 @rt_make_error_object(i64 %t1291, i64 %t1292)
  %t1294 = load i64, ptr @"scheme.base:raise"
  %t1295 = and i64 %t1294, -8
  %t1296 = inttoptr i64 %t1295 to ptr
  %t1297 = load i64, ptr %t1296
  %t1298 = inttoptr i64 %t1297 to ptr
  %t1299 = musttail call fastcc i64 %t1298(i64 %t1294, i64 1, i64 %t1293, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1299
}

define fastcc i64 @"scheme.base:code:%unwind-to"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1306 = icmp eq i64 %argc, 1
  br i1 %t1306, label %argok316, label %arityerr315
arityerr315:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok316:
  %t1307 = load i64, ptr @"scheme.base:*winds*"
  %t1308 = call i64 @rt_eq_p(i64 %t1307, i64 %a0)
  %t1309 = icmp ne i64 %t1308, 1
  br i1 %t1309, label %then317, label %else318
then317:
  ret i64 257
else318:
  %t1310 = load i64, ptr @"scheme.base:*winds*"
  %t1311 = call i64 @rt_null_p(i64 %t1310)
  %t1312 = icmp ne i64 %t1311, 1
  br i1 %t1312, label %then319, label %else320
then319:
  ret i64 257
else320:
  %t1313 = load i64, ptr @"scheme.base:*winds*"
  %t1314 = call i64 @rt_car(i64 %t1313)
  %t1315 = load i64, ptr @"scheme.base:*winds*"
  %t1316 = call i64 @rt_cdr(i64 %t1315)
  %t1317 = call i64 @rt_root(i64 %t1316)
  store i64 %t1317, ptr @"scheme.base:*winds*"
  %t1318 = call i64 @rt_cdr(i64 %t1314)
  %t1319 = and i64 %t1318, -8
  %t1320 = inttoptr i64 %t1319 to ptr
  %t1321 = load i64, ptr %t1320
  %t1322 = inttoptr i64 %t1321 to ptr
  %t1323 = call fastcc i64%t1322(i64 %t1318, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1324 = load i64, ptr @"scheme.base:%unwind-to"
  %t1325 = and i64 %t1324, -8
  %t1326 = inttoptr i64 %t1325 to ptr
  %t1327 = load i64, ptr %t1326
  %t1328 = inttoptr i64 %t1327 to ptr
  %t1329 = musttail call fastcc i64 %t1328(i64 %t1324, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1329
}

define fastcc i64 @"scheme.base:code:dynamic-wind"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1334 = icmp eq i64 %argc, 3
  br i1 %t1334, label %argok322, label %arityerr321
arityerr321:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok322:
  %t1335 = and i64 %a0, -8
  %t1336 = inttoptr i64 %t1335 to ptr
  %t1337 = load i64, ptr %t1336
  %t1338 = inttoptr i64 %t1337 to ptr
  %t1339 = call fastcc i64%t1338(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1340 = call i64 @rt_cons(i64 %a0, i64 %a2)
  %t1341 = load i64, ptr @"scheme.base:*winds*"
  %t1342 = call i64 @rt_cons(i64 %t1340, i64 %t1341)
  %t1343 = call i64 @rt_root(i64 %t1342)
  store i64 %t1343, ptr @"scheme.base:*winds*"
  %t1344 = and i64 %a1, -8
  %t1345 = inttoptr i64 %t1344 to ptr
  %t1346 = load i64, ptr %t1345
  %t1347 = inttoptr i64 %t1346 to ptr
  %t1348 = call fastcc i64%t1347(i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1349 = load i64, ptr @"scheme.base:*winds*"
  %t1350 = call i64 @rt_cdr(i64 %t1349)
  %t1351 = call i64 @rt_root(i64 %t1350)
  store i64 %t1351, ptr @"scheme.base:*winds*"
  %t1352 = and i64 %a2, -8
  %t1353 = inttoptr i64 %t1352 to ptr
  %t1354 = load i64, ptr %t1353
  %t1355 = inttoptr i64 %t1354 to ptr
  %t1356 = call fastcc i64%t1355(i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1348
}

define fastcc i64 @"scheme.base:code_285"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1361 = icmp eq i64 %argc, 1
  br i1 %t1361, label %argok324, label %arityerr323
arityerr323:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok324:
  %t1362 = and i64 %self, -8
  %t1363 = inttoptr i64 %t1362 to ptr
  %t1364 = getelementptr i64, ptr %t1363, i64 1
  %t1365 = load i64, ptr %t1364
  %t1366 = call i64 @rt_escape_live_p(i64 %t1365)
  %t1367 = icmp ne i64 %t1366, 1
  br i1 %t1367, label %then325, label %else326
then325:
  %t1368 = and i64 %self, -8
  %t1369 = inttoptr i64 %t1368 to ptr
  %t1370 = getelementptr i64, ptr %t1369, i64 2
  %t1371 = load i64, ptr %t1370
  %t1372 = load i64, ptr @"scheme.base:%unwind-to"
  %t1373 = and i64 %t1372, -8
  %t1374 = inttoptr i64 %t1373 to ptr
  %t1375 = load i64, ptr %t1374
  %t1376 = inttoptr i64 %t1375 to ptr
  %t1377 = call fastcc i64%t1376(i64 %t1372, i64 1, i64 %t1371, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1378 = and i64 %self, -8
  %t1379 = inttoptr i64 %t1378 to ptr
  %t1380 = getelementptr i64, ptr %t1379, i64 1
  %t1381 = load i64, ptr %t1380
  %t1382 = call i64 @rt_escape_to(i64 %t1381, i64 %a0)
  br label %merge327
else326:
  br label %merge327
merge327:
  %t1383 = phi i64 [ %t1382, %then325 ], [ 1, %else326 ]
  %t1384 = call i64 @rt_intern(ptr @.str.sym.3)
  %t1385 = call i64 @rt_make_string(ptr @.str.lit.4, i64 39)
  %t1386 = load i64, ptr @"scheme.base:error"
  %t1387 = and i64 %t1386, -8
  %t1388 = inttoptr i64 %t1387 to ptr
  %t1389 = load i64, ptr %t1388
  %t1390 = inttoptr i64 %t1389 to ptr
  %t1391 = musttail call fastcc i64 %t1390(i64 %t1386, i64 2, i64 %t1384, i64 %t1385, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1391
}

define fastcc i64 @"scheme.base:code_283"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1392 = icmp eq i64 %argc, 0
  br i1 %t1392, label %argok329, label %arityerr328
arityerr328:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok329:
  %t1393 = call i64 @rt_escape_frame()
  %t1394 = and i64 %self, -8
  %t1395 = inttoptr i64 %t1394 to ptr
  %t1396 = getelementptr i64, ptr %t1395, i64 2
  %t1397 = load i64, ptr %t1396
  %t1398 = call ptr @rt_alloc_words(i64 3)
  %t1399 = ptrtoint ptr %t1398 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_285" to i64), ptr %t1398
  %t1400 = getelementptr i64, ptr %t1398, i64 1
  store i64 %t1393, ptr %t1400
  %t1401 = getelementptr i64, ptr %t1398, i64 2
  store i64 %t1397, ptr %t1401
  %t1402 = or i64 %t1399, 4
  %t1403 = and i64 %self, -8
  %t1404 = inttoptr i64 %t1403 to ptr
  %t1405 = getelementptr i64, ptr %t1404, i64 1
  %t1406 = load i64, ptr %t1405
  %t1407 = and i64 %t1406, -8
  %t1408 = inttoptr i64 %t1407 to ptr
  %t1409 = load i64, ptr %t1408
  %t1410 = inttoptr i64 %t1409 to ptr
  %t1411 = musttail call fastcc i64 %t1410(i64 %t1406, i64 1, i64 %t1402, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1411
}

define fastcc i64 @"scheme.base:code:call-with-current-continuation"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1412 = icmp eq i64 %argc, 1
  br i1 %t1412, label %argok331, label %arityerr330
arityerr330:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok331:
  %t1413 = load i64, ptr @"scheme.base:*winds*"
  %t1414 = call ptr @rt_alloc_words(i64 3)
  %t1415 = ptrtoint ptr %t1414 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_283" to i64), ptr %t1414
  %t1416 = getelementptr i64, ptr %t1414, i64 1
  store i64 %a0, ptr %t1416
  %t1417 = getelementptr i64, ptr %t1414, i64 2
  store i64 %t1413, ptr %t1417
  %t1418 = or i64 %t1415, 4
  %t1419 = call i64 @rt_run_guarded(ptr @__apply0, i64 %t1418)
  %t1420 = call i64 @rt_cdr(i64 %t1419)
  ret i64 %t1420
}

define fastcc i64 @"scheme.base:code:call/cc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1425 = icmp eq i64 %argc, 1
  br i1 %t1425, label %argok333, label %arityerr332
arityerr332:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok333:
  %t1426 = load i64, ptr @"scheme.base:call-with-current-continuation"
  %t1427 = and i64 %t1426, -8
  %t1428 = inttoptr i64 %t1427 to ptr
  %t1429 = load i64, ptr %t1428
  %t1430 = inttoptr i64 %t1429 to ptr
  %t1431 = musttail call fastcc i64 %t1430(i64 %t1426, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1431
}

define fastcc i64 @"scheme.base:code_293"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1436 = icmp eq i64 %argc, 0
  br i1 %t1436, label %argok335, label %arityerr334
arityerr334:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok335:
  %t1437 = and i64 %self, -8
  %t1438 = inttoptr i64 %t1437 to ptr
  %t1439 = getelementptr i64, ptr %t1438, i64 1
  %t1440 = load i64, ptr %t1439
  %t1441 = and i64 %self, -8
  %t1442 = inttoptr i64 %t1441 to ptr
  %t1443 = getelementptr i64, ptr %t1442, i64 2
  %t1444 = load i64, ptr %t1443
  %t1445 = call i64 @rt_cons(i64 %t1440, i64 %t1444)
  %t1446 = call i64 @rt_root(i64 %t1445)
  store i64 %t1446, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code_295"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1447 = icmp eq i64 %argc, 0
  br i1 %t1447, label %argok337, label %arityerr336
arityerr336:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok337:
  %t1448 = and i64 %self, -8
  %t1449 = inttoptr i64 %t1448 to ptr
  %t1450 = getelementptr i64, ptr %t1449, i64 1
  %t1451 = load i64, ptr %t1450
  %t1452 = call i64 @rt_root(i64 %t1451)
  store i64 %t1452, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code:%with-handler"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1453 = icmp eq i64 %argc, 2
  br i1 %t1453, label %argok339, label %arityerr338
arityerr338:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok339:
  %t1454 = load i64, ptr @"scheme.base:*handlers*"
  %t1455 = call ptr @rt_alloc_words(i64 3)
  %t1456 = ptrtoint ptr %t1455 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_293" to i64), ptr %t1455
  %t1457 = getelementptr i64, ptr %t1455, i64 1
  store i64 %a0, ptr %t1457
  %t1458 = getelementptr i64, ptr %t1455, i64 2
  store i64 %t1454, ptr %t1458
  %t1459 = or i64 %t1456, 4
  %t1460 = call ptr @rt_alloc_words(i64 2)
  %t1461 = ptrtoint ptr %t1460 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_295" to i64), ptr %t1460
  %t1462 = getelementptr i64, ptr %t1460, i64 1
  store i64 %t1454, ptr %t1462
  %t1463 = or i64 %t1461, 4
  %t1464 = load i64, ptr @"scheme.base:dynamic-wind"
  %t1465 = and i64 %t1464, -8
  %t1466 = inttoptr i64 %t1465 to ptr
  %t1467 = load i64, ptr %t1466
  %t1468 = inttoptr i64 %t1467 to ptr
  %t1469 = musttail call fastcc i64 %t1468(i64 %t1464, i64 3, i64 %t1459, i64 %a1, i64 %t1463, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1469
}

define fastcc i64 @"scheme.base:code:raise"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1474 = icmp eq i64 %argc, 1
  br i1 %t1474, label %argok341, label %arityerr340
arityerr340:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok341:
  %t1475 = load i64, ptr @"scheme.base:*handlers*"
  %t1476 = call i64 @rt_null_p(i64 %t1475)
  %t1477 = icmp ne i64 %t1476, 1
  br i1 %t1477, label %then342, label %else343
then342:
  %t1478 = call i64 @rt_raise(i64 %a0)
  ret i64 %t1478
else343:
  %t1479 = load i64, ptr @"scheme.base:*handlers*"
  %t1480 = call i64 @rt_car(i64 %t1479)
  %t1481 = load i64, ptr @"scheme.base:*handlers*"
  %t1482 = load i64, ptr @"scheme.base:*handlers*"
  %t1483 = call i64 @rt_cdr(i64 %t1482)
  %t1484 = call i64 @rt_root(i64 %t1483)
  store i64 %t1484, ptr @"scheme.base:*handlers*"
  %t1485 = and i64 %t1480, -8
  %t1486 = inttoptr i64 %t1485 to ptr
  %t1487 = load i64, ptr %t1486
  %t1488 = inttoptr i64 %t1487 to ptr
  %t1489 = call fastcc i64%t1488(i64 %t1480, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1490 = call i64 @rt_root(i64 %t1481)
  store i64 %t1490, ptr @"scheme.base:*handlers*"
  %t1491 = call i64 @rt_raise(i64 %a0)
  ret i64 %t1491
}

define fastcc i64 @"scheme.base:code:error-object?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1496 = icmp eq i64 %argc, 1
  br i1 %t1496, label %argok345, label %arityerr344
arityerr344:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok345:
  %t1497 = call i64 @rt_error_object_p(i64 %a0)
  ret i64 %t1497
}

define fastcc i64 @"scheme.base:code:error-object-message"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1502 = icmp eq i64 %argc, 1
  br i1 %t1502, label %argok347, label %arityerr346
arityerr346:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok347:
  %t1503 = call i64 @rt_error_object_message(i64 %a0)
  ret i64 %t1503
}

define fastcc i64 @"scheme.base:code:error-object-irritants"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1508 = icmp eq i64 %argc, 1
  br i1 %t1508, label %argok349, label %arityerr348
arityerr348:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok349:
  %t1509 = call i64 @rt_error_object_irritants(i64 %a0)
  ret i64 %t1509
}

define fastcc i64 @"scheme.base:code_315"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1514 = icmp eq i64 %argc, 1
  br i1 %t1514, label %argok351, label %arityerr350
arityerr350:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok351:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_317"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1515 = icmp eq i64 %argc, 1
  br i1 %t1515, label %argok353, label %arityerr352
arityerr352:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok353:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_319"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1516 = icmp sge i64 %argc, 0
  br i1 %t1516, label %argok355, label %arityerr354
arityerr354:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok355:
  %t1517 = call ptr @rt_alloc_words(i64 8)
  %t1518 = getelementptr i64, ptr %t1517, i64 0
  store i64 %a0, ptr %t1518
  %t1519 = getelementptr i64, ptr %t1517, i64 1
  store i64 %a1, ptr %t1519
  %t1520 = getelementptr i64, ptr %t1517, i64 2
  store i64 %a2, ptr %t1520
  %t1521 = getelementptr i64, ptr %t1517, i64 3
  store i64 %a3, ptr %t1521
  %t1522 = getelementptr i64, ptr %t1517, i64 4
  store i64 %a4, ptr %t1522
  %t1523 = getelementptr i64, ptr %t1517, i64 5
  store i64 %a5, ptr %t1523
  %t1524 = getelementptr i64, ptr %t1517, i64 6
  store i64 %a6, ptr %t1524
  %t1525 = getelementptr i64, ptr %t1517, i64 7
  store i64 %a7, ptr %t1525
  %t1526 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1517, ptr %overflow)
  %t1527 = call i64 @rt_null_p(i64 %t1526)
  %t1528 = icmp ne i64 %t1527, 1
  br i1 %t1528, label %then356, label %else357
then356:
  %t1529 = and i64 %self, -8
  %t1530 = inttoptr i64 %t1529 to ptr
  %t1531 = getelementptr i64, ptr %t1530, i64 1
  %t1532 = load i64, ptr %t1531
  %t1533 = call i64 @rt_vector_ref(i64 %t1532, i64 0)
  ret i64 %t1533
else357:
  %t1534 = call i64 @rt_cdr(i64 %t1526)
  %t1535 = call i64 @rt_null_p(i64 %t1534)
  %t1536 = icmp ne i64 %t1535, 1
  br i1 %t1536, label %then358, label %else359
then358:
  %t1537 = and i64 %self, -8
  %t1538 = inttoptr i64 %t1537 to ptr
  %t1539 = getelementptr i64, ptr %t1538, i64 1
  %t1540 = load i64, ptr %t1539
  %t1541 = call i64 @rt_car(i64 %t1526)
  %t1542 = and i64 %self, -8
  %t1543 = inttoptr i64 %t1542 to ptr
  %t1544 = getelementptr i64, ptr %t1543, i64 2
  %t1545 = load i64, ptr %t1544
  %t1546 = and i64 %t1545, -8
  %t1547 = inttoptr i64 %t1546 to ptr
  %t1548 = load i64, ptr %t1547
  %t1549 = inttoptr i64 %t1548 to ptr
  %t1550 = call fastcc i64%t1549(i64 %t1545, i64 1, i64 %t1541, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1551 = call i64 @rt_vector_set(i64 %t1540, i64 0, i64 %t1550)
  ret i64 %t1551
else359:
  %t1552 = and i64 %self, -8
  %t1553 = inttoptr i64 %t1552 to ptr
  %t1554 = getelementptr i64, ptr %t1553, i64 1
  %t1555 = load i64, ptr %t1554
  %t1556 = call i64 @rt_car(i64 %t1526)
  %t1557 = call i64 @rt_vector_set(i64 %t1555, i64 0, i64 %t1556)
  ret i64 %t1557
}

define fastcc i64 @"scheme.base:code:make-parameter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1558 = icmp sge i64 %argc, 1
  br i1 %t1558, label %argok361, label %arityerr360
arityerr360:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok361:
  %t1559 = call ptr @rt_alloc_words(i64 8)
  %t1560 = getelementptr i64, ptr %t1559, i64 0
  store i64 %a0, ptr %t1560
  %t1561 = getelementptr i64, ptr %t1559, i64 1
  store i64 %a1, ptr %t1561
  %t1562 = getelementptr i64, ptr %t1559, i64 2
  store i64 %a2, ptr %t1562
  %t1563 = getelementptr i64, ptr %t1559, i64 3
  store i64 %a3, ptr %t1563
  %t1564 = getelementptr i64, ptr %t1559, i64 4
  store i64 %a4, ptr %t1564
  %t1565 = getelementptr i64, ptr %t1559, i64 5
  store i64 %a5, ptr %t1565
  %t1566 = getelementptr i64, ptr %t1559, i64 6
  store i64 %a6, ptr %t1566
  %t1567 = getelementptr i64, ptr %t1559, i64 7
  store i64 %a7, ptr %t1567
  %t1568 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t1559, ptr %overflow)
  %t1569 = call i64 @rt_null_p(i64 %t1568)
  %t1570 = icmp ne i64 %t1569, 1
  br i1 %t1570, label %then362, label %else363
then362:
  %t1571 = call ptr @rt_alloc_words(i64 1)
  %t1572 = ptrtoint ptr %t1571 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_315" to i64), ptr %t1571
  %t1573 = or i64 %t1572, 4
  br label %merge364
else363:
  %t1574 = call i64 @rt_car(i64 %t1568)
  br label %merge364
merge364:
  %t1575 = phi i64 [ %t1573, %then362 ], [ %t1574, %else363 ]
  %t1576 = call i64 @rt_make_vector(i64 8, i64 0)
  %t1577 = call i64 @rt_null_p(i64 %t1568)
  %t1578 = icmp ne i64 %t1577, 1
  br i1 %t1578, label %then365, label %else366
then365:
  %t1579 = call ptr @rt_alloc_words(i64 1)
  %t1580 = ptrtoint ptr %t1579 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_317" to i64), ptr %t1579
  %t1581 = or i64 %t1580, 4
  br label %merge367
else366:
  %t1582 = call i64 @rt_car(i64 %t1568)
  br label %merge367
merge367:
  %t1583 = phi i64 [ %t1581, %then365 ], [ %t1582, %else366 ]
  %t1584 = and i64 %t1583, -8
  %t1585 = inttoptr i64 %t1584 to ptr
  %t1586 = load i64, ptr %t1585
  %t1587 = inttoptr i64 %t1586 to ptr
  %t1588 = call fastcc i64%t1587(i64 %t1583, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1589 = call i64 @rt_vector_set(i64 %t1576, i64 0, i64 %t1588)
  %t1590 = call ptr @rt_alloc_words(i64 3)
  %t1591 = ptrtoint ptr %t1590 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_319" to i64), ptr %t1590
  %t1592 = getelementptr i64, ptr %t1590, i64 1
  store i64 %t1576, ptr %t1592
  %t1593 = getelementptr i64, ptr %t1590, i64 2
  store i64 %t1575, ptr %t1593
  %t1594 = or i64 %t1591, 4
  ret i64 %t1594
}

define fastcc i64 @"scheme.base:code_331"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1599 = icmp eq i64 %argc, 1
  br i1 %t1599, label %argok369, label %arityerr368
arityerr368:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok369:
  %t1600 = and i64 %a0, -8
  %t1601 = inttoptr i64 %t1600 to ptr
  %t1602 = load i64, ptr %t1601
  %t1603 = inttoptr i64 %t1602 to ptr
  %t1604 = musttail call fastcc i64 %t1603(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1604
}

define fastcc i64 @"scheme.base:code_335"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1605 = icmp eq i64 %argc, 2
  br i1 %t1605, label %argok371, label %arityerr370
arityerr370:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok371:
  %t1606 = and i64 %a0, -8
  %t1607 = inttoptr i64 %t1606 to ptr
  %t1608 = load i64, ptr %t1607
  %t1609 = inttoptr i64 %t1608 to ptr
  %t1610 = musttail call fastcc i64 %t1609(i64 %a0, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1610
}

define fastcc i64 @"scheme.base:code_333"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1611 = icmp eq i64 %argc, 0
  br i1 %t1611, label %argok373, label %arityerr372
arityerr372:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok373:
  %t1612 = call ptr @rt_alloc_words(i64 1)
  %t1613 = ptrtoint ptr %t1612 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_335" to i64), ptr %t1612
  %t1614 = or i64 %t1613, 4
  %t1615 = and i64 %self, -8
  %t1616 = inttoptr i64 %t1615 to ptr
  %t1617 = getelementptr i64, ptr %t1616, i64 1
  %t1618 = load i64, ptr %t1617
  %t1619 = and i64 %self, -8
  %t1620 = inttoptr i64 %t1619 to ptr
  %t1621 = getelementptr i64, ptr %t1620, i64 2
  %t1622 = load i64, ptr %t1621
  %t1623 = load i64, ptr @"scheme.base:for-each"
  %t1624 = and i64 %t1623, -8
  %t1625 = inttoptr i64 %t1624 to ptr
  %t1626 = load i64, ptr %t1625
  %t1627 = inttoptr i64 %t1626 to ptr
  %t1628 = musttail call fastcc i64 %t1627(i64 %t1623, i64 3, i64 %t1614, i64 %t1618, i64 %t1622, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1628
}

define fastcc i64 @"scheme.base:code_339"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1629 = icmp eq i64 %argc, 2
  br i1 %t1629, label %argok375, label %arityerr374
arityerr374:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok375:
  %t1630 = and i64 %a0, -8
  %t1631 = inttoptr i64 %t1630 to ptr
  %t1632 = load i64, ptr %t1631
  %t1633 = inttoptr i64 %t1632 to ptr
  %t1634 = musttail call fastcc i64 %t1633(i64 %a0, i64 2, i64 %a1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1634
}

define fastcc i64 @"scheme.base:code_337"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1635 = icmp eq i64 %argc, 0
  br i1 %t1635, label %argok377, label %arityerr376
arityerr376:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok377:
  %t1636 = call ptr @rt_alloc_words(i64 1)
  %t1637 = ptrtoint ptr %t1636 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_339" to i64), ptr %t1636
  %t1638 = or i64 %t1637, 4
  %t1639 = and i64 %self, -8
  %t1640 = inttoptr i64 %t1639 to ptr
  %t1641 = getelementptr i64, ptr %t1640, i64 1
  %t1642 = load i64, ptr %t1641
  %t1643 = and i64 %self, -8
  %t1644 = inttoptr i64 %t1643 to ptr
  %t1645 = getelementptr i64, ptr %t1644, i64 2
  %t1646 = load i64, ptr %t1645
  %t1647 = load i64, ptr @"scheme.base:for-each"
  %t1648 = and i64 %t1647, -8
  %t1649 = inttoptr i64 %t1648 to ptr
  %t1650 = load i64, ptr %t1649
  %t1651 = inttoptr i64 %t1650 to ptr
  %t1652 = musttail call fastcc i64 %t1651(i64 %t1647, i64 3, i64 %t1638, i64 %t1642, i64 %t1646, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1652
}

define fastcc i64 @"scheme.base:code:%with-parameters"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1653 = icmp eq i64 %argc, 3
  br i1 %t1653, label %argok379, label %arityerr378
arityerr378:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok379:
  %t1654 = call ptr @rt_alloc_words(i64 1)
  %t1655 = ptrtoint ptr %t1654 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_331" to i64), ptr %t1654
  %t1656 = or i64 %t1655, 4
  %t1657 = load i64, ptr @"scheme.base:map"
  %t1658 = and i64 %t1657, -8
  %t1659 = inttoptr i64 %t1658 to ptr
  %t1660 = load i64, ptr %t1659
  %t1661 = inttoptr i64 %t1660 to ptr
  %t1662 = call fastcc i64%t1661(i64 %t1657, i64 2, i64 %t1656, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1663 = call ptr @rt_alloc_words(i64 3)
  %t1664 = ptrtoint ptr %t1663 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_333" to i64), ptr %t1663
  %t1665 = getelementptr i64, ptr %t1663, i64 1
  store i64 %a0, ptr %t1665
  %t1666 = getelementptr i64, ptr %t1663, i64 2
  store i64 %a1, ptr %t1666
  %t1667 = or i64 %t1664, 4
  %t1668 = call ptr @rt_alloc_words(i64 3)
  %t1669 = ptrtoint ptr %t1668 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_337" to i64), ptr %t1668
  %t1670 = getelementptr i64, ptr %t1668, i64 1
  store i64 %a0, ptr %t1670
  %t1671 = getelementptr i64, ptr %t1668, i64 2
  store i64 %t1662, ptr %t1671
  %t1672 = or i64 %t1669, 4
  %t1673 = load i64, ptr @"scheme.base:dynamic-wind"
  %t1674 = and i64 %t1673, -8
  %t1675 = inttoptr i64 %t1674 to ptr
  %t1676 = load i64, ptr %t1675
  %t1677 = inttoptr i64 %t1676 to ptr
  %t1678 = musttail call fastcc i64 %t1677(i64 %t1673, i64 3, i64 %t1667, i64 %a2, i64 %t1672, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1678
}

define fastcc i64 @"scheme.base:code_347"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1683 = icmp eq i64 %argc, 2
  br i1 %t1683, label %argok381, label %arityerr380
arityerr380:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok381:
  %t1684 = call i64 @rt_null_p(i64 %a0)
  %t1685 = icmp ne i64 %t1684, 1
  br i1 %t1685, label %then382, label %else383
then382:
  %t1686 = and i64 %self, -8
  %t1687 = inttoptr i64 %t1686 to ptr
  %t1688 = getelementptr i64, ptr %t1687, i64 1
  %t1689 = load i64, ptr %t1688
  ret i64 %t1689
else383:
  %t1690 = and i64 %self, -8
  %t1691 = inttoptr i64 %t1690 to ptr
  %t1692 = getelementptr i64, ptr %t1691, i64 1
  %t1693 = load i64, ptr %t1692
  %t1694 = call i64 @rt_car(i64 %a0)
  %t1695 = call i64 @rt_vector_set(i64 %t1693, i64 %a1, i64 %t1694)
  %t1696 = call i64 @rt_cdr(i64 %a0)
  %t1697 = or i64 %a1, 8
  %t1698 = and i64 %t1697, 7
  %t1699 = icmp eq i64 %t1698, 0
  br i1 %t1699, label %fixfast384, label %fixslow385
fixfast384:
  %t1700 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t1701 = extractvalue {i64, i1} %t1700, 0
  %t1702 = extractvalue {i64, i1} %t1700, 1
  br i1 %t1702, label %fixslow385, label %fixmerge386
fixslow385:
  %t1703 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge386
fixmerge386:
  %t1704 = phi i64 [ %t1701, %fixfast384 ], [ %t1703, %fixslow385 ]
  %t1705 = musttail call fastcc i64 @"scheme.base:code_347"(i64 %self, i64 2, i64 %t1696, i64 %t1704, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1705
}

define fastcc i64 @"scheme.base:code:list->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1706 = icmp eq i64 %argc, 1
  br i1 %t1706, label %argok388, label %arityerr387
arityerr387:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok388:
  %t1707 = load i64, ptr @"scheme.base:length"
  %t1708 = and i64 %t1707, -8
  %t1709 = inttoptr i64 %t1708 to ptr
  %t1710 = load i64, ptr %t1709
  %t1711 = inttoptr i64 %t1710 to ptr
  %t1712 = call fastcc i64%t1711(i64 %t1707, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1713 = call i64 @rt_make_vector(i64 %t1712, i64 0)
  %t1714 = call ptr @rt_alloc_words(i64 3)
  %t1715 = ptrtoint ptr %t1714 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_347" to i64), ptr %t1714
  %t1716 = or i64 %t1715, 4
  %t1717 = getelementptr i64, ptr %t1714, i64 1
  store i64 %t1713, ptr %t1717
  %t1718 = getelementptr i64, ptr %t1714, i64 2
  store i64 %t1716, ptr %t1718
  %t1719 = musttail call fastcc i64 @"scheme.base:code_347"(i64 %t1716, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1719
}

define fastcc i64 @"scheme.base:code:vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1724 = icmp sge i64 %argc, 0
  br i1 %t1724, label %argok390, label %arityerr389
arityerr389:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok390:
  %t1725 = call ptr @rt_alloc_words(i64 8)
  %t1726 = getelementptr i64, ptr %t1725, i64 0
  store i64 %a0, ptr %t1726
  %t1727 = getelementptr i64, ptr %t1725, i64 1
  store i64 %a1, ptr %t1727
  %t1728 = getelementptr i64, ptr %t1725, i64 2
  store i64 %a2, ptr %t1728
  %t1729 = getelementptr i64, ptr %t1725, i64 3
  store i64 %a3, ptr %t1729
  %t1730 = getelementptr i64, ptr %t1725, i64 4
  store i64 %a4, ptr %t1730
  %t1731 = getelementptr i64, ptr %t1725, i64 5
  store i64 %a5, ptr %t1731
  %t1732 = getelementptr i64, ptr %t1725, i64 6
  store i64 %a6, ptr %t1732
  %t1733 = getelementptr i64, ptr %t1725, i64 7
  store i64 %a7, ptr %t1733
  %t1734 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1725, ptr %overflow)
  %t1735 = load i64, ptr @"scheme.base:list->vector"
  %t1736 = and i64 %t1735, -8
  %t1737 = inttoptr i64 %t1736 to ptr
  %t1738 = load i64, ptr %t1737
  %t1739 = inttoptr i64 %t1738 to ptr
  %t1740 = musttail call fastcc i64 %t1739(i64 %t1735, i64 1, i64 %t1734, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1740
}

define fastcc i64 @"scheme.base:code_357"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1745 = icmp eq i64 %argc, 2
  br i1 %t1745, label %argok392, label %arityerr391
arityerr391:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok392:
  %t1746 = call i64 @rt_null_p(i64 %a0)
  %t1747 = icmp ne i64 %t1746, 1
  br i1 %t1747, label %then393, label %else394
then393:
  %t1748 = and i64 %self, -8
  %t1749 = inttoptr i64 %t1748 to ptr
  %t1750 = getelementptr i64, ptr %t1749, i64 1
  %t1751 = load i64, ptr %t1750
  ret i64 %t1751
else394:
  %t1752 = and i64 %self, -8
  %t1753 = inttoptr i64 %t1752 to ptr
  %t1754 = getelementptr i64, ptr %t1753, i64 1
  %t1755 = load i64, ptr %t1754
  %t1756 = call i64 @rt_car(i64 %a0)
  %t1757 = call i64 @rt_bytevector_u8_set(i64 %t1755, i64 %a1, i64 %t1756)
  %t1758 = call i64 @rt_cdr(i64 %a0)
  %t1759 = or i64 %a1, 8
  %t1760 = and i64 %t1759, 7
  %t1761 = icmp eq i64 %t1760, 0
  br i1 %t1761, label %fixfast395, label %fixslow396
fixfast395:
  %t1762 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t1763 = extractvalue {i64, i1} %t1762, 0
  %t1764 = extractvalue {i64, i1} %t1762, 1
  br i1 %t1764, label %fixslow396, label %fixmerge397
fixslow396:
  %t1765 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge397
fixmerge397:
  %t1766 = phi i64 [ %t1763, %fixfast395 ], [ %t1765, %fixslow396 ]
  %t1767 = musttail call fastcc i64 @"scheme.base:code_357"(i64 %self, i64 2, i64 %t1758, i64 %t1766, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1767
}

define fastcc i64 @"scheme.base:code:list->bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1768 = icmp eq i64 %argc, 1
  br i1 %t1768, label %argok399, label %arityerr398
arityerr398:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok399:
  %t1769 = load i64, ptr @"scheme.base:length"
  %t1770 = and i64 %t1769, -8
  %t1771 = inttoptr i64 %t1770 to ptr
  %t1772 = load i64, ptr %t1771
  %t1773 = inttoptr i64 %t1772 to ptr
  %t1774 = call fastcc i64%t1773(i64 %t1769, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1775 = call i64 @rt_make_bytevector(i64 %t1774, i64 0)
  %t1776 = call ptr @rt_alloc_words(i64 3)
  %t1777 = ptrtoint ptr %t1776 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_357" to i64), ptr %t1776
  %t1778 = or i64 %t1777, 4
  %t1779 = getelementptr i64, ptr %t1776, i64 1
  store i64 %t1775, ptr %t1779
  %t1780 = getelementptr i64, ptr %t1776, i64 2
  store i64 %t1778, ptr %t1780
  %t1781 = musttail call fastcc i64 @"scheme.base:code_357"(i64 %t1778, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1781
}

define fastcc i64 @"scheme.base:code:bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1786 = icmp sge i64 %argc, 0
  br i1 %t1786, label %argok401, label %arityerr400
arityerr400:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok401:
  %t1787 = call ptr @rt_alloc_words(i64 8)
  %t1788 = getelementptr i64, ptr %t1787, i64 0
  store i64 %a0, ptr %t1788
  %t1789 = getelementptr i64, ptr %t1787, i64 1
  store i64 %a1, ptr %t1789
  %t1790 = getelementptr i64, ptr %t1787, i64 2
  store i64 %a2, ptr %t1790
  %t1791 = getelementptr i64, ptr %t1787, i64 3
  store i64 %a3, ptr %t1791
  %t1792 = getelementptr i64, ptr %t1787, i64 4
  store i64 %a4, ptr %t1792
  %t1793 = getelementptr i64, ptr %t1787, i64 5
  store i64 %a5, ptr %t1793
  %t1794 = getelementptr i64, ptr %t1787, i64 6
  store i64 %a6, ptr %t1794
  %t1795 = getelementptr i64, ptr %t1787, i64 7
  store i64 %a7, ptr %t1795
  %t1796 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1787, ptr %overflow)
  %t1797 = load i64, ptr @"scheme.base:list->bytevector"
  %t1798 = and i64 %t1797, -8
  %t1799 = inttoptr i64 %t1798 to ptr
  %t1800 = load i64, ptr %t1799
  %t1801 = inttoptr i64 %t1800 to ptr
  %t1802 = musttail call fastcc i64 %t1801(i64 %t1797, i64 1, i64 %t1796, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1802
}

define fastcc i64 @"scheme.base:code:values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1807 = icmp sge i64 %argc, 0
  br i1 %t1807, label %argok403, label %arityerr402
arityerr402:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok403:
  %t1808 = call ptr @rt_alloc_words(i64 8)
  %t1809 = getelementptr i64, ptr %t1808, i64 0
  store i64 %a0, ptr %t1809
  %t1810 = getelementptr i64, ptr %t1808, i64 1
  store i64 %a1, ptr %t1810
  %t1811 = getelementptr i64, ptr %t1808, i64 2
  store i64 %a2, ptr %t1811
  %t1812 = getelementptr i64, ptr %t1808, i64 3
  store i64 %a3, ptr %t1812
  %t1813 = getelementptr i64, ptr %t1808, i64 4
  store i64 %a4, ptr %t1813
  %t1814 = getelementptr i64, ptr %t1808, i64 5
  store i64 %a5, ptr %t1814
  %t1815 = getelementptr i64, ptr %t1808, i64 6
  store i64 %a6, ptr %t1815
  %t1816 = getelementptr i64, ptr %t1808, i64 7
  store i64 %a7, ptr %t1816
  %t1817 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1808, ptr %overflow)
  %t1818 = call i64 @rt_pair_p(i64 %t1817)
  %t1819 = icmp ne i64 %t1818, 1
  br i1 %t1819, label %then404, label %else405
then404:
  %t1820 = call i64 @rt_cdr(i64 %t1817)
  %t1821 = call i64 @rt_null_p(i64 %t1820)
  br label %merge406
else405:
  br label %merge406
merge406:
  %t1822 = phi i64 [ %t1821, %then404 ], [ 1, %else405 ]
  %t1823 = icmp ne i64 %t1822, 1
  br i1 %t1823, label %then407, label %else408
then407:
  %t1824 = call i64 @rt_car(i64 %t1817)
  ret i64 %t1824
else408:
  %t1825 = call i64 @rt_list_to_mv(i64 %t1817)
  ret i64 %t1825
}

define fastcc i64 @"scheme.base:code:call-with-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1830 = icmp eq i64 %argc, 2
  br i1 %t1830, label %argok410, label %arityerr409
arityerr409:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok410:
  %t1831 = and i64 %a0, -8
  %t1832 = inttoptr i64 %t1831 to ptr
  %t1833 = load i64, ptr %t1832
  %t1834 = inttoptr i64 %t1833 to ptr
  %t1835 = call fastcc i64%t1834(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1836 = call i64 @rt_mv_p(i64 %t1835)
  %t1837 = icmp ne i64 %t1836, 1
  br i1 %t1837, label %then411, label %else412
then411:
  %t1838 = call i64 @rt_mv_to_list(i64 %t1835)
  %t1839 = and i64 %a1, -8
  %t1840 = inttoptr i64 %t1839 to ptr
  %t1841 = load i64, ptr %t1840
  %t1842 = inttoptr i64 %t1841 to ptr
  %t1843 = call i64 @rt_list_length(i64 %t1838)
  %t1844 = add i64 0, %t1843
  %t1845 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t1838, i64 8)
  %t1857 = getelementptr i64, ptr %t1845, i64 0
  %t1849 = load i64, ptr %t1857
  %t1858 = getelementptr i64, ptr %t1845, i64 1
  %t1850 = load i64, ptr %t1858
  %t1859 = getelementptr i64, ptr %t1845, i64 2
  %t1851 = load i64, ptr %t1859
  %t1860 = getelementptr i64, ptr %t1845, i64 3
  %t1852 = load i64, ptr %t1860
  %t1861 = getelementptr i64, ptr %t1845, i64 4
  %t1853 = load i64, ptr %t1861
  %t1862 = getelementptr i64, ptr %t1845, i64 5
  %t1854 = load i64, ptr %t1862
  %t1863 = getelementptr i64, ptr %t1845, i64 6
  %t1855 = load i64, ptr %t1863
  %t1864 = getelementptr i64, ptr %t1845, i64 7
  %t1856 = load i64, ptr %t1864
  %t1846 = icmp sgt i64 %t1844, 8
  %t1847 = getelementptr i64, ptr %t1845, i64 8
  %t1848 = select i1 %t1846, ptr %t1847, ptr null
  %t1865 = musttail call fastcc i64 %t1842(i64 %a1, i64 %t1844, i64 %t1849, i64 %t1850, i64 %t1851, i64 %t1852, i64 %t1853, i64 %t1854, i64 %t1855, i64 %t1856, ptr %t1848)
  ret i64 %t1865
else412:
  %t1866 = and i64 %a1, -8
  %t1867 = inttoptr i64 %t1866 to ptr
  %t1868 = load i64, ptr %t1867
  %t1869 = inttoptr i64 %t1868 to ptr
  %t1870 = musttail call fastcc i64 %t1869(i64 %a1, i64 1, i64 %t1835, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1870
}

define fastcc i64 @"scheme.base:code:make-hash-table"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1877 = icmp eq i64 %argc, 0
  br i1 %t1877, label %argok414, label %arityerr413
arityerr413:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok414:
  %t1878 = load i64, ptr @"scheme.base:%ht-initial-buckets"
  %t1879 = call i64 @rt_make_vector(i64 %t1878, i64 2)
  %t1880 = load i64, ptr @"scheme.base:vector"
  %t1881 = and i64 %t1880, -8
  %t1882 = inttoptr i64 %t1881 to ptr
  %t1883 = load i64, ptr %t1882
  %t1884 = inttoptr i64 %t1883 to ptr
  %t1885 = call fastcc i64%t1884(i64 %t1880, i64 3, i64 0, i64 %t1879, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1886 = call i64 @rt_make_hash_table(i64 %t1885)
  ret i64 %t1886
}

define fastcc i64 @"scheme.base:code:hash-table?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1891 = icmp eq i64 %argc, 1
  br i1 %t1891, label %argok416, label %arityerr415
arityerr415:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok416:
  %t1892 = call i64 @rt_hash_table_p(i64 %a0)
  ret i64 %t1892
}

define fastcc i64 @"scheme.base:code:%ht-count"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1897 = icmp eq i64 %argc, 1
  br i1 %t1897, label %argok418, label %arityerr417
arityerr417:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok418:
  %t1898 = call i64 @rt_hash_table_spine(i64 %a0)
  %t1899 = call i64 @rt_vector_ref(i64 %t1898, i64 0)
  ret i64 %t1899
}

define fastcc i64 @"scheme.base:code:%ht-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1904 = icmp eq i64 %argc, 1
  br i1 %t1904, label %argok420, label %arityerr419
arityerr419:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok420:
  %t1905 = call i64 @rt_hash_table_spine(i64 %a0)
  %t1906 = call i64 @rt_vector_ref(i64 %t1905, i64 8)
  ret i64 %t1906
}

define fastcc i64 @"scheme.base:code:%ht-set-count!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1911 = icmp eq i64 %argc, 2
  br i1 %t1911, label %argok422, label %arityerr421
arityerr421:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok422:
  %t1912 = call i64 @rt_hash_table_spine(i64 %a0)
  %t1913 = call i64 @rt_vector_set(i64 %t1912, i64 0, i64 %a1)
  ret i64 %t1913
}

define fastcc i64 @"scheme.base:code:%ht-set-buckets!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1918 = icmp eq i64 %argc, 2
  br i1 %t1918, label %argok424, label %arityerr423
arityerr423:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok424:
  %t1919 = call i64 @rt_hash_table_spine(i64 %a0)
  %t1920 = call i64 @rt_vector_set(i64 %t1919, i64 8, i64 %a1)
  ret i64 %t1920
}

define fastcc i64 @"scheme.base:code:%ht-index"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1925 = icmp eq i64 %argc, 2
  br i1 %t1925, label %argok426, label %arityerr425
arityerr425:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok426:
  %t1926 = call i64 @rt_hash(i64 %a0)
  %t1927 = call i64 @rt_remainder(i64 %t1926, i64 %a1)
  ret i64 %t1927
}

define fastcc i64 @"scheme.base:code:%ht-assoc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1932 = icmp eq i64 %argc, 2
  br i1 %t1932, label %argok428, label %arityerr427
arityerr427:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok428:
  %t1933 = call i64 @rt_null_p(i64 %a1)
  %t1934 = icmp ne i64 %t1933, 1
  br i1 %t1934, label %then429, label %else430
then429:
  ret i64 1
else430:
  %t1935 = call i64 @rt_car(i64 %a1)
  %t1936 = call i64 @rt_car(i64 %t1935)
  %t1937 = call i64 @rt_equal(i64 %a0, i64 %t1936)
  %t1938 = icmp ne i64 %t1937, 1
  br i1 %t1938, label %then431, label %else432
then431:
  %t1939 = call i64 @rt_car(i64 %a1)
  ret i64 %t1939
else432:
  %t1940 = call i64 @rt_cdr(i64 %a1)
  %t1941 = load i64, ptr @"scheme.base:%ht-assoc"
  %t1942 = and i64 %t1941, -8
  %t1943 = inttoptr i64 %t1942 to ptr
  %t1944 = load i64, ptr %t1943
  %t1945 = inttoptr i64 %t1944 to ptr
  %t1946 = musttail call fastcc i64 %t1945(i64 %t1941, i64 2, i64 %a0, i64 %t1940, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1946
}

define fastcc i64 @"scheme.base:code:%ht-remove"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1951 = icmp eq i64 %argc, 2
  br i1 %t1951, label %argok434, label %arityerr433
arityerr433:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok434:
  %t1952 = call i64 @rt_null_p(i64 %a1)
  %t1953 = icmp ne i64 %t1952, 1
  br i1 %t1953, label %then435, label %else436
then435:
  ret i64 2
else436:
  %t1954 = call i64 @rt_car(i64 %a1)
  %t1955 = call i64 @rt_car(i64 %t1954)
  %t1956 = call i64 @rt_equal(i64 %a0, i64 %t1955)
  %t1957 = icmp ne i64 %t1956, 1
  br i1 %t1957, label %then437, label %else438
then437:
  %t1958 = call i64 @rt_cdr(i64 %a1)
  ret i64 %t1958
else438:
  %t1959 = call i64 @rt_car(i64 %a1)
  %t1960 = call i64 @rt_cdr(i64 %a1)
  %t1961 = load i64, ptr @"scheme.base:%ht-remove"
  %t1962 = and i64 %t1961, -8
  %t1963 = inttoptr i64 %t1962 to ptr
  %t1964 = load i64, ptr %t1963
  %t1965 = inttoptr i64 %t1964 to ptr
  %t1966 = call fastcc i64%t1965(i64 %t1961, i64 2, i64 %a0, i64 %t1960, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1967 = call i64 @rt_cons(i64 %t1959, i64 %t1966)
  ret i64 %t1967
}

define fastcc i64 @"scheme.base:code:hash-table-ref/default"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1972 = icmp eq i64 %argc, 3
  br i1 %t1972, label %argok440, label %arityerr439
arityerr439:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok440:
  %t1973 = load i64, ptr @"scheme.base:%ht-buckets"
  %t1974 = and i64 %t1973, -8
  %t1975 = inttoptr i64 %t1974 to ptr
  %t1976 = load i64, ptr %t1975
  %t1977 = inttoptr i64 %t1976 to ptr
  %t1978 = call fastcc i64%t1977(i64 %t1973, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1979 = call i64 @rt_vector_length(i64 %t1978)
  %t1980 = load i64, ptr @"scheme.base:%ht-index"
  %t1981 = and i64 %t1980, -8
  %t1982 = inttoptr i64 %t1981 to ptr
  %t1983 = load i64, ptr %t1982
  %t1984 = inttoptr i64 %t1983 to ptr
  %t1985 = call fastcc i64%t1984(i64 %t1980, i64 2, i64 %a1, i64 %t1979, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1986 = call i64 @rt_vector_ref(i64 %t1978, i64 %t1985)
  %t1987 = load i64, ptr @"scheme.base:%ht-assoc"
  %t1988 = and i64 %t1987, -8
  %t1989 = inttoptr i64 %t1988 to ptr
  %t1990 = load i64, ptr %t1989
  %t1991 = inttoptr i64 %t1990 to ptr
  %t1992 = call fastcc i64%t1991(i64 %t1987, i64 2, i64 %a1, i64 %t1986, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1993 = icmp ne i64 %t1992, 1
  br i1 %t1993, label %then441, label %else442
then441:
  %t1994 = call i64 @rt_cdr(i64 %t1992)
  ret i64 %t1994
else442:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:hash-table-contains?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1999 = icmp eq i64 %argc, 2
  br i1 %t1999, label %argok444, label %arityerr443
arityerr443:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok444:
  %t2000 = load i64, ptr @"scheme.base:%ht-buckets"
  %t2001 = and i64 %t2000, -8
  %t2002 = inttoptr i64 %t2001 to ptr
  %t2003 = load i64, ptr %t2002
  %t2004 = inttoptr i64 %t2003 to ptr
  %t2005 = call fastcc i64%t2004(i64 %t2000, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2006 = call i64 @rt_vector_length(i64 %t2005)
  %t2007 = load i64, ptr @"scheme.base:%ht-index"
  %t2008 = and i64 %t2007, -8
  %t2009 = inttoptr i64 %t2008 to ptr
  %t2010 = load i64, ptr %t2009
  %t2011 = inttoptr i64 %t2010 to ptr
  %t2012 = call fastcc i64%t2011(i64 %t2007, i64 2, i64 %a1, i64 %t2006, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2013 = call i64 @rt_vector_ref(i64 %t2005, i64 %t2012)
  %t2014 = load i64, ptr @"scheme.base:%ht-assoc"
  %t2015 = and i64 %t2014, -8
  %t2016 = inttoptr i64 %t2015 to ptr
  %t2017 = load i64, ptr %t2016
  %t2018 = inttoptr i64 %t2017 to ptr
  %t2019 = call fastcc i64%t2018(i64 %t2014, i64 2, i64 %a1, i64 %t2013, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2020 = icmp ne i64 %t2019, 1
  br i1 %t2020, label %then445, label %else446
then445:
  ret i64 257
else446:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-ref"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2025 = icmp eq i64 %argc, 2
  br i1 %t2025, label %argok448, label %arityerr447
arityerr447:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok448:
  %t2026 = load i64, ptr @"scheme.base:%ht-buckets"
  %t2027 = and i64 %t2026, -8
  %t2028 = inttoptr i64 %t2027 to ptr
  %t2029 = load i64, ptr %t2028
  %t2030 = inttoptr i64 %t2029 to ptr
  %t2031 = call fastcc i64%t2030(i64 %t2026, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2032 = call i64 @rt_vector_length(i64 %t2031)
  %t2033 = load i64, ptr @"scheme.base:%ht-index"
  %t2034 = and i64 %t2033, -8
  %t2035 = inttoptr i64 %t2034 to ptr
  %t2036 = load i64, ptr %t2035
  %t2037 = inttoptr i64 %t2036 to ptr
  %t2038 = call fastcc i64%t2037(i64 %t2033, i64 2, i64 %a1, i64 %t2032, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2039 = call i64 @rt_vector_ref(i64 %t2031, i64 %t2038)
  %t2040 = load i64, ptr @"scheme.base:%ht-assoc"
  %t2041 = and i64 %t2040, -8
  %t2042 = inttoptr i64 %t2041 to ptr
  %t2043 = load i64, ptr %t2042
  %t2044 = inttoptr i64 %t2043 to ptr
  %t2045 = call fastcc i64%t2044(i64 %t2040, i64 2, i64 %a1, i64 %t2039, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2046 = icmp ne i64 %t2045, 1
  br i1 %t2046, label %then449, label %else450
then449:
  %t2047 = call i64 @rt_cdr(i64 %t2045)
  ret i64 %t2047
else450:
  %t2048 = call i64 @rt_make_string(ptr @.str.lit.5, i64 29)
  %t2049 = load i64, ptr @"scheme.base:error"
  %t2050 = and i64 %t2049, -8
  %t2051 = inttoptr i64 %t2050 to ptr
  %t2052 = load i64, ptr %t2051
  %t2053 = inttoptr i64 %t2052 to ptr
  %t2054 = musttail call fastcc i64 %t2053(i64 %t2049, i64 2, i64 %t2048, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2054
}

define fastcc i64 @"scheme.base:code:hash-table-set!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2059 = icmp eq i64 %argc, 3
  br i1 %t2059, label %argok452, label %arityerr451
arityerr451:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok452:
  %t2060 = load i64, ptr @"scheme.base:%ht-buckets"
  %t2061 = and i64 %t2060, -8
  %t2062 = inttoptr i64 %t2061 to ptr
  %t2063 = load i64, ptr %t2062
  %t2064 = inttoptr i64 %t2063 to ptr
  %t2065 = call fastcc i64%t2064(i64 %t2060, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2066 = call i64 @rt_vector_length(i64 %t2065)
  %t2067 = load i64, ptr @"scheme.base:%ht-index"
  %t2068 = and i64 %t2067, -8
  %t2069 = inttoptr i64 %t2068 to ptr
  %t2070 = load i64, ptr %t2069
  %t2071 = inttoptr i64 %t2070 to ptr
  %t2072 = call fastcc i64%t2071(i64 %t2067, i64 2, i64 %a1, i64 %t2066, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2073 = call i64 @rt_vector_ref(i64 %t2065, i64 %t2072)
  %t2074 = load i64, ptr @"scheme.base:%ht-assoc"
  %t2075 = and i64 %t2074, -8
  %t2076 = inttoptr i64 %t2075 to ptr
  %t2077 = load i64, ptr %t2076
  %t2078 = inttoptr i64 %t2077 to ptr
  %t2079 = call fastcc i64%t2078(i64 %t2074, i64 2, i64 %a1, i64 %t2073, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2080 = call i64 @rt_cons(i64 %a1, i64 %a2)
  %t2081 = icmp ne i64 %t2079, 1
  br i1 %t2081, label %then453, label %else454
then453:
  %t2082 = load i64, ptr @"scheme.base:%ht-remove"
  %t2083 = and i64 %t2082, -8
  %t2084 = inttoptr i64 %t2083 to ptr
  %t2085 = load i64, ptr %t2084
  %t2086 = inttoptr i64 %t2085 to ptr
  %t2087 = call fastcc i64%t2086(i64 %t2082, i64 2, i64 %a1, i64 %t2073, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge455
else454:
  br label %merge455
merge455:
  %t2088 = phi i64 [ %t2087, %then453 ], [ %t2073, %else454 ]
  %t2089 = call i64 @rt_cons(i64 %t2080, i64 %t2088)
  %t2090 = call i64 @rt_vector_set(i64 %t2065, i64 %t2072, i64 %t2089)
  %t2091 = icmp ne i64 %t2079, 1
  br i1 %t2091, label %then456, label %else457
then456:
  ret i64 1
else457:
  %t2092 = load i64, ptr @"scheme.base:%ht-count"
  %t2093 = and i64 %t2092, -8
  %t2094 = inttoptr i64 %t2093 to ptr
  %t2095 = load i64, ptr %t2094
  %t2096 = inttoptr i64 %t2095 to ptr
  %t2097 = call fastcc i64%t2096(i64 %t2092, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2098 = or i64 %t2097, 8
  %t2099 = and i64 %t2098, 7
  %t2100 = icmp eq i64 %t2099, 0
  br i1 %t2100, label %fixfast458, label %fixslow459
fixfast458:
  %t2101 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t2097, i64 8)
  %t2102 = extractvalue {i64, i1} %t2101, 0
  %t2103 = extractvalue {i64, i1} %t2101, 1
  br i1 %t2103, label %fixslow459, label %fixmerge460
fixslow459:
  %t2104 = call i64 @rt_add(i64 %t2097, i64 8)
  br label %fixmerge460
fixmerge460:
  %t2105 = phi i64 [ %t2102, %fixfast458 ], [ %t2104, %fixslow459 ]
  %t2106 = load i64, ptr @"scheme.base:%ht-set-count!"
  %t2107 = and i64 %t2106, -8
  %t2108 = inttoptr i64 %t2107 to ptr
  %t2109 = load i64, ptr %t2108
  %t2110 = inttoptr i64 %t2109 to ptr
  %t2111 = call fastcc i64%t2110(i64 %t2106, i64 2, i64 %a0, i64 %t2105, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2112 = load i64, ptr @"scheme.base:%ht-count"
  %t2113 = and i64 %t2112, -8
  %t2114 = inttoptr i64 %t2113 to ptr
  %t2115 = load i64, ptr %t2114
  %t2116 = inttoptr i64 %t2115 to ptr
  %t2117 = call fastcc i64%t2116(i64 %t2112, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2118 = load i64, ptr @"scheme.base:%ht-load-factor"
  %t2119 = or i64 %t2118, %t2066
  %t2120 = and i64 %t2119, 7
  %t2121 = icmp eq i64 %t2120, 0
  br i1 %t2121, label %fixfast461, label %fixslow462
fixfast461:
  %t2122 = ashr i64 %t2118, 3
  %t2123 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t2122, i64 %t2066)
  %t2124 = extractvalue {i64, i1} %t2123, 0
  %t2125 = extractvalue {i64, i1} %t2123, 1
  br i1 %t2125, label %fixslow462, label %fixmerge463
fixslow462:
  %t2126 = call i64 @rt_mul(i64 %t2118, i64 %t2066)
  br label %fixmerge463
fixmerge463:
  %t2127 = phi i64 [ %t2124, %fixfast461 ], [ %t2126, %fixslow462 ]
  %t2128 = or i64 %t2127, %t2117
  %t2129 = and i64 %t2128, 7
  %t2130 = icmp eq i64 %t2129, 0
  br i1 %t2130, label %fixfast464, label %fixslow465
fixfast464:
  %t2131 = icmp slt i64 %t2127, %t2117
  %t2132 = select i1 %t2131, i64 257, i64 1
  br label %fixmerge466
fixslow465:
  %t2133 = call i64 @rt_lt(i64 %t2127, i64 %t2117)
  br label %fixmerge466
fixmerge466:
  %t2134 = phi i64 [ %t2132, %fixfast464 ], [ %t2133, %fixslow465 ]
  %t2135 = icmp ne i64 %t2134, 1
  br i1 %t2135, label %then467, label %else468
then467:
  %t2136 = load i64, ptr @"scheme.base:%ht-grow!"
  %t2137 = and i64 %t2136, -8
  %t2138 = inttoptr i64 %t2137 to ptr
  %t2139 = load i64, ptr %t2138
  %t2140 = inttoptr i64 %t2139 to ptr
  %t2141 = musttail call fastcc i64 %t2140(i64 %t2136, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2141
else468:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-delete!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2146 = icmp eq i64 %argc, 2
  br i1 %t2146, label %argok470, label %arityerr469
arityerr469:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok470:
  %t2147 = load i64, ptr @"scheme.base:%ht-buckets"
  %t2148 = and i64 %t2147, -8
  %t2149 = inttoptr i64 %t2148 to ptr
  %t2150 = load i64, ptr %t2149
  %t2151 = inttoptr i64 %t2150 to ptr
  %t2152 = call fastcc i64%t2151(i64 %t2147, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2153 = call i64 @rt_vector_length(i64 %t2152)
  %t2154 = load i64, ptr @"scheme.base:%ht-index"
  %t2155 = and i64 %t2154, -8
  %t2156 = inttoptr i64 %t2155 to ptr
  %t2157 = load i64, ptr %t2156
  %t2158 = inttoptr i64 %t2157 to ptr
  %t2159 = call fastcc i64%t2158(i64 %t2154, i64 2, i64 %a1, i64 %t2153, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2160 = call i64 @rt_vector_ref(i64 %t2152, i64 %t2159)
  %t2161 = load i64, ptr @"scheme.base:%ht-assoc"
  %t2162 = and i64 %t2161, -8
  %t2163 = inttoptr i64 %t2162 to ptr
  %t2164 = load i64, ptr %t2163
  %t2165 = inttoptr i64 %t2164 to ptr
  %t2166 = call fastcc i64%t2165(i64 %t2161, i64 2, i64 %a1, i64 %t2160, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2167 = icmp ne i64 %t2166, 1
  br i1 %t2167, label %then471, label %else472
then471:
  %t2168 = load i64, ptr @"scheme.base:%ht-remove"
  %t2169 = and i64 %t2168, -8
  %t2170 = inttoptr i64 %t2169 to ptr
  %t2171 = load i64, ptr %t2170
  %t2172 = inttoptr i64 %t2171 to ptr
  %t2173 = call fastcc i64%t2172(i64 %t2168, i64 2, i64 %a1, i64 %t2160, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2174 = call i64 @rt_vector_set(i64 %t2152, i64 %t2159, i64 %t2173)
  %t2175 = load i64, ptr @"scheme.base:%ht-count"
  %t2176 = and i64 %t2175, -8
  %t2177 = inttoptr i64 %t2176 to ptr
  %t2178 = load i64, ptr %t2177
  %t2179 = inttoptr i64 %t2178 to ptr
  %t2180 = call fastcc i64%t2179(i64 %t2175, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2181 = or i64 %t2180, 8
  %t2182 = and i64 %t2181, 7
  %t2183 = icmp eq i64 %t2182, 0
  br i1 %t2183, label %fixfast473, label %fixslow474
fixfast473:
  %t2184 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t2180, i64 8)
  %t2185 = extractvalue {i64, i1} %t2184, 0
  %t2186 = extractvalue {i64, i1} %t2184, 1
  br i1 %t2186, label %fixslow474, label %fixmerge475
fixslow474:
  %t2187 = call i64 @rt_sub(i64 %t2180, i64 8)
  br label %fixmerge475
fixmerge475:
  %t2188 = phi i64 [ %t2185, %fixfast473 ], [ %t2187, %fixslow474 ]
  %t2189 = load i64, ptr @"scheme.base:%ht-set-count!"
  %t2190 = and i64 %t2189, -8
  %t2191 = inttoptr i64 %t2190 to ptr
  %t2192 = load i64, ptr %t2191
  %t2193 = inttoptr i64 %t2192 to ptr
  %t2194 = musttail call fastcc i64 %t2193(i64 %t2189, i64 2, i64 %a0, i64 %t2188, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2194
else472:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_440"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2199 = icmp eq i64 %argc, 1
  br i1 %t2199, label %argok477, label %arityerr476
arityerr476:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok477:
  %t2200 = call i64 @rt_null_p(i64 %a0)
  %t2201 = icmp ne i64 %t2200, 1
  br i1 %t2201, label %then478, label %else479
then478:
  ret i64 1
else479:
  %t2202 = call i64 @rt_car(i64 %a0)
  %t2203 = call i64 @rt_car(i64 %t2202)
  %t2204 = and i64 %self, -8
  %t2205 = inttoptr i64 %t2204 to ptr
  %t2206 = getelementptr i64, ptr %t2205, i64 1
  %t2207 = load i64, ptr %t2206
  %t2208 = load i64, ptr @"scheme.base:%ht-index"
  %t2209 = and i64 %t2208, -8
  %t2210 = inttoptr i64 %t2209 to ptr
  %t2211 = load i64, ptr %t2210
  %t2212 = inttoptr i64 %t2211 to ptr
  %t2213 = call fastcc i64%t2212(i64 %t2208, i64 2, i64 %t2203, i64 %t2207, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2214 = and i64 %self, -8
  %t2215 = inttoptr i64 %t2214 to ptr
  %t2216 = getelementptr i64, ptr %t2215, i64 2
  %t2217 = load i64, ptr %t2216
  %t2218 = and i64 %self, -8
  %t2219 = inttoptr i64 %t2218 to ptr
  %t2220 = getelementptr i64, ptr %t2219, i64 2
  %t2221 = load i64, ptr %t2220
  %t2222 = call i64 @rt_vector_ref(i64 %t2221, i64 %t2213)
  %t2223 = call i64 @rt_cons(i64 %t2202, i64 %t2222)
  %t2224 = call i64 @rt_vector_set(i64 %t2217, i64 %t2213, i64 %t2223)
  %t2225 = call i64 @rt_cdr(i64 %a0)
  %t2226 = musttail call fastcc i64 @"scheme.base:code_440"(i64 %self, i64 1, i64 %t2225, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2226
}

define fastcc i64 @"scheme.base:code_438"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2227 = icmp eq i64 %argc, 1
  br i1 %t2227, label %argok481, label %arityerr480
arityerr480:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok481:
  %t2228 = and i64 %self, -8
  %t2229 = inttoptr i64 %t2228 to ptr
  %t2230 = getelementptr i64, ptr %t2229, i64 1
  %t2231 = load i64, ptr %t2230
  %t2232 = call i64 @rt_vector_length(i64 %t2231)
  %t2233 = or i64 %a0, %t2232
  %t2234 = and i64 %t2233, 7
  %t2235 = icmp eq i64 %t2234, 0
  br i1 %t2235, label %fixfast482, label %fixslow483
fixfast482:
  %t2236 = icmp slt i64 %a0, %t2232
  %t2237 = select i1 %t2236, i64 257, i64 1
  br label %fixmerge484
fixslow483:
  %t2238 = call i64 @rt_lt(i64 %a0, i64 %t2232)
  br label %fixmerge484
fixmerge484:
  %t2239 = phi i64 [ %t2237, %fixfast482 ], [ %t2238, %fixslow483 ]
  %t2240 = icmp ne i64 %t2239, 1
  br i1 %t2240, label %then485, label %else486
then485:
  %t2241 = call ptr @rt_alloc_words(i64 4)
  %t2242 = ptrtoint ptr %t2241 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_440" to i64), ptr %t2241
  %t2243 = or i64 %t2242, 4
  %t2244 = and i64 %self, -8
  %t2245 = inttoptr i64 %t2244 to ptr
  %t2246 = getelementptr i64, ptr %t2245, i64 2
  %t2247 = load i64, ptr %t2246
  %t2248 = getelementptr i64, ptr %t2241, i64 1
  store i64 %t2247, ptr %t2248
  %t2249 = and i64 %self, -8
  %t2250 = inttoptr i64 %t2249 to ptr
  %t2251 = getelementptr i64, ptr %t2250, i64 3
  %t2252 = load i64, ptr %t2251
  %t2253 = getelementptr i64, ptr %t2241, i64 2
  store i64 %t2252, ptr %t2253
  %t2254 = getelementptr i64, ptr %t2241, i64 3
  store i64 %t2243, ptr %t2254
  %t2255 = and i64 %self, -8
  %t2256 = inttoptr i64 %t2255 to ptr
  %t2257 = getelementptr i64, ptr %t2256, i64 1
  %t2258 = load i64, ptr %t2257
  %t2259 = call i64 @rt_vector_ref(i64 %t2258, i64 %a0)
  %t2260 = call fastcc i64 @"scheme.base:code_440"(i64 %t2243, i64 1, i64 %t2259, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2261 = or i64 %a0, 8
  %t2262 = and i64 %t2261, 7
  %t2263 = icmp eq i64 %t2262, 0
  br i1 %t2263, label %fixfast487, label %fixslow488
fixfast487:
  %t2264 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t2265 = extractvalue {i64, i1} %t2264, 0
  %t2266 = extractvalue {i64, i1} %t2264, 1
  br i1 %t2266, label %fixslow488, label %fixmerge489
fixslow488:
  %t2267 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge489
fixmerge489:
  %t2268 = phi i64 [ %t2265, %fixfast487 ], [ %t2267, %fixslow488 ]
  %t2269 = musttail call fastcc i64 @"scheme.base:code_438"(i64 %self, i64 1, i64 %t2268, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2269
else486:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%ht-grow!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2270 = icmp eq i64 %argc, 1
  br i1 %t2270, label %argok491, label %arityerr490
arityerr490:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok491:
  %t2271 = load i64, ptr @"scheme.base:%ht-buckets"
  %t2272 = and i64 %t2271, -8
  %t2273 = inttoptr i64 %t2272 to ptr
  %t2274 = load i64, ptr %t2273
  %t2275 = inttoptr i64 %t2274 to ptr
  %t2276 = call fastcc i64%t2275(i64 %t2271, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2277 = call i64 @rt_vector_length(i64 %t2276)
  %t2278 = or i64 16, %t2277
  %t2279 = and i64 %t2278, 7
  %t2280 = icmp eq i64 %t2279, 0
  br i1 %t2280, label %fixfast492, label %fixslow493
fixfast492:
  %t2281 = ashr i64 16, 3
  %t2282 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t2281, i64 %t2277)
  %t2283 = extractvalue {i64, i1} %t2282, 0
  %t2284 = extractvalue {i64, i1} %t2282, 1
  br i1 %t2284, label %fixslow493, label %fixmerge494
fixslow493:
  %t2285 = call i64 @rt_mul(i64 16, i64 %t2277)
  br label %fixmerge494
fixmerge494:
  %t2286 = phi i64 [ %t2283, %fixfast492 ], [ %t2285, %fixslow493 ]
  %t2287 = call i64 @rt_make_vector(i64 %t2286, i64 2)
  %t2288 = call ptr @rt_alloc_words(i64 5)
  %t2289 = ptrtoint ptr %t2288 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_438" to i64), ptr %t2288
  %t2290 = or i64 %t2289, 4
  %t2291 = getelementptr i64, ptr %t2288, i64 1
  store i64 %t2276, ptr %t2291
  %t2292 = getelementptr i64, ptr %t2288, i64 2
  store i64 %t2286, ptr %t2292
  %t2293 = getelementptr i64, ptr %t2288, i64 3
  store i64 %t2287, ptr %t2293
  %t2294 = getelementptr i64, ptr %t2288, i64 4
  store i64 %t2290, ptr %t2294
  %t2295 = call fastcc i64 @"scheme.base:code_438"(i64 %t2290, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2296 = load i64, ptr @"scheme.base:%ht-set-buckets!"
  %t2297 = and i64 %t2296, -8
  %t2298 = inttoptr i64 %t2297 to ptr
  %t2299 = load i64, ptr %t2298
  %t2300 = inttoptr i64 %t2299 to ptr
  %t2301 = musttail call fastcc i64 %t2300(i64 %t2296, i64 2, i64 %a0, i64 %t2287, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2301
}

define fastcc i64 @"scheme.base:code:hash-table-size"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2306 = icmp eq i64 %argc, 1
  br i1 %t2306, label %argok496, label %arityerr495
arityerr495:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok496:
  %t2307 = load i64, ptr @"scheme.base:%ht-count"
  %t2308 = and i64 %t2307, -8
  %t2309 = inttoptr i64 %t2308 to ptr
  %t2310 = load i64, ptr %t2309
  %t2311 = inttoptr i64 %t2310 to ptr
  %t2312 = musttail call fastcc i64 %t2311(i64 %t2307, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2312
}

define fastcc i64 @"scheme.base:code:%ht-fold-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2317 = icmp eq i64 %argc, 2
  br i1 %t2317, label %argok498, label %arityerr497
arityerr497:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok498:
  %t2318 = call i64 @rt_null_p(i64 %a0)
  %t2319 = icmp ne i64 %t2318, 1
  br i1 %t2319, label %then499, label %else500
then499:
  ret i64 %a1
else500:
  %t2320 = call i64 @rt_car(i64 %a0)
  %t2321 = call i64 @rt_car(i64 %t2320)
  %t2322 = call i64 @rt_car(i64 %a0)
  %t2323 = call i64 @rt_cdr(i64 %t2322)
  %t2324 = call i64 @rt_cons(i64 %t2321, i64 %t2323)
  %t2325 = call i64 @rt_cdr(i64 %a0)
  %t2326 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  %t2327 = and i64 %t2326, -8
  %t2328 = inttoptr i64 %t2327 to ptr
  %t2329 = load i64, ptr %t2328
  %t2330 = inttoptr i64 %t2329 to ptr
  %t2331 = call fastcc i64%t2330(i64 %t2326, i64 2, i64 %t2325, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2332 = call i64 @rt_cons(i64 %t2324, i64 %t2331)
  ret i64 %t2332
}

define fastcc i64 @"scheme.base:code_457"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2337 = icmp eq i64 %argc, 2
  br i1 %t2337, label %argok502, label %arityerr501
arityerr501:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok502:
  %t2338 = and i64 %self, -8
  %t2339 = inttoptr i64 %t2338 to ptr
  %t2340 = getelementptr i64, ptr %t2339, i64 1
  %t2341 = load i64, ptr %t2340
  %t2342 = call i64 @rt_vector_length(i64 %t2341)
  %t2343 = or i64 %a0, %t2342
  %t2344 = and i64 %t2343, 7
  %t2345 = icmp eq i64 %t2344, 0
  br i1 %t2345, label %fixfast503, label %fixslow504
fixfast503:
  %t2346 = icmp slt i64 %a0, %t2342
  %t2347 = select i1 %t2346, i64 257, i64 1
  br label %fixmerge505
fixslow504:
  %t2348 = call i64 @rt_lt(i64 %a0, i64 %t2342)
  br label %fixmerge505
fixmerge505:
  %t2349 = phi i64 [ %t2347, %fixfast503 ], [ %t2348, %fixslow504 ]
  %t2350 = icmp ne i64 %t2349, 1
  br i1 %t2350, label %then506, label %else507
then506:
  %t2351 = or i64 %a0, 8
  %t2352 = and i64 %t2351, 7
  %t2353 = icmp eq i64 %t2352, 0
  br i1 %t2353, label %fixfast508, label %fixslow509
fixfast508:
  %t2354 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t2355 = extractvalue {i64, i1} %t2354, 0
  %t2356 = extractvalue {i64, i1} %t2354, 1
  br i1 %t2356, label %fixslow509, label %fixmerge510
fixslow509:
  %t2357 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge510
fixmerge510:
  %t2358 = phi i64 [ %t2355, %fixfast508 ], [ %t2357, %fixslow509 ]
  %t2359 = and i64 %self, -8
  %t2360 = inttoptr i64 %t2359 to ptr
  %t2361 = getelementptr i64, ptr %t2360, i64 1
  %t2362 = load i64, ptr %t2361
  %t2363 = call i64 @rt_vector_ref(i64 %t2362, i64 %a0)
  %t2364 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  %t2365 = and i64 %t2364, -8
  %t2366 = inttoptr i64 %t2365 to ptr
  %t2367 = load i64, ptr %t2366
  %t2368 = inttoptr i64 %t2367 to ptr
  %t2369 = call fastcc i64%t2368(i64 %t2364, i64 2, i64 %t2363, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2370 = musttail call fastcc i64 @"scheme.base:code_457"(i64 %self, i64 2, i64 %t2358, i64 %t2369, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2370
else507:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:hash-table->alist"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2371 = icmp eq i64 %argc, 1
  br i1 %t2371, label %argok512, label %arityerr511
arityerr511:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok512:
  %t2372 = load i64, ptr @"scheme.base:%ht-buckets"
  %t2373 = and i64 %t2372, -8
  %t2374 = inttoptr i64 %t2373 to ptr
  %t2375 = load i64, ptr %t2374
  %t2376 = inttoptr i64 %t2375 to ptr
  %t2377 = call fastcc i64%t2376(i64 %t2372, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2378 = call ptr @rt_alloc_words(i64 3)
  %t2379 = ptrtoint ptr %t2378 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_457" to i64), ptr %t2378
  %t2380 = or i64 %t2379, 4
  %t2381 = getelementptr i64, ptr %t2378, i64 1
  store i64 %t2377, ptr %t2381
  %t2382 = getelementptr i64, ptr %t2378, i64 2
  store i64 %t2380, ptr %t2382
  %t2383 = musttail call fastcc i64 @"scheme.base:code_457"(i64 %t2380, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2383
}

define fastcc i64 @"scheme.base:code_462"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2388 = icmp eq i64 %argc, 1
  br i1 %t2388, label %argok514, label %arityerr513
arityerr513:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok514:
  %t2389 = call i64 @rt_car(i64 %a0)
  ret i64 %t2389
}

define fastcc i64 @"scheme.base:code:hash-table-keys"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2390 = icmp eq i64 %argc, 1
  br i1 %t2390, label %argok516, label %arityerr515
arityerr515:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok516:
  %t2391 = call ptr @rt_alloc_words(i64 1)
  %t2392 = ptrtoint ptr %t2391 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_462" to i64), ptr %t2391
  %t2393 = or i64 %t2392, 4
  %t2394 = load i64, ptr @"scheme.base:hash-table->alist"
  %t2395 = and i64 %t2394, -8
  %t2396 = inttoptr i64 %t2395 to ptr
  %t2397 = load i64, ptr %t2396
  %t2398 = inttoptr i64 %t2397 to ptr
  %t2399 = call fastcc i64%t2398(i64 %t2394, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2400 = load i64, ptr @"scheme.base:map"
  %t2401 = and i64 %t2400, -8
  %t2402 = inttoptr i64 %t2401 to ptr
  %t2403 = load i64, ptr %t2402
  %t2404 = inttoptr i64 %t2403 to ptr
  %t2405 = musttail call fastcc i64 %t2404(i64 %t2400, i64 2, i64 %t2393, i64 %t2399, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2405
}

define fastcc i64 @"scheme.base:code_467"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2410 = icmp eq i64 %argc, 1
  br i1 %t2410, label %argok518, label %arityerr517
arityerr517:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok518:
  %t2411 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t2411
}

define fastcc i64 @"scheme.base:code:hash-table-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2412 = icmp eq i64 %argc, 1
  br i1 %t2412, label %argok520, label %arityerr519
arityerr519:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok520:
  %t2413 = call ptr @rt_alloc_words(i64 1)
  %t2414 = ptrtoint ptr %t2413 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_467" to i64), ptr %t2413
  %t2415 = or i64 %t2414, 4
  %t2416 = load i64, ptr @"scheme.base:hash-table->alist"
  %t2417 = and i64 %t2416, -8
  %t2418 = inttoptr i64 %t2417 to ptr
  %t2419 = load i64, ptr %t2418
  %t2420 = inttoptr i64 %t2419 to ptr
  %t2421 = call fastcc i64%t2420(i64 %t2416, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2422 = load i64, ptr @"scheme.base:map"
  %t2423 = and i64 %t2422, -8
  %t2424 = inttoptr i64 %t2423 to ptr
  %t2425 = load i64, ptr %t2424
  %t2426 = inttoptr i64 %t2425 to ptr
  %t2427 = musttail call fastcc i64 %t2426(i64 %t2422, i64 2, i64 %t2415, i64 %t2421, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2427
}

define fastcc i64 @"scheme.base:code:rd-ws?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2432 = icmp eq i64 %argc, 1
  br i1 %t2432, label %argok522, label %arityerr521
arityerr521:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok522:
  %t2433 = call i64 @rt_char_to_integer(i64 %a0)
  %t2434 = or i64 %t2433, 256
  %t2435 = and i64 %t2434, 7
  %t2436 = icmp eq i64 %t2435, 0
  br i1 %t2436, label %fixfast523, label %fixslow524
fixfast523:
  %t2437 = icmp eq i64 %t2433, 256
  %t2438 = select i1 %t2437, i64 257, i64 1
  br label %fixmerge525
fixslow524:
  %t2439 = call i64 @rt_num_eq(i64 %t2433, i64 256)
  br label %fixmerge525
fixmerge525:
  %t2440 = phi i64 [ %t2438, %fixfast523 ], [ %t2439, %fixslow524 ]
  %t2441 = icmp ne i64 %t2440, 1
  br i1 %t2441, label %then526, label %else527
then526:
  ret i64 %t2440
else527:
  %t2442 = or i64 %t2433, 72
  %t2443 = and i64 %t2442, 7
  %t2444 = icmp eq i64 %t2443, 0
  br i1 %t2444, label %fixfast528, label %fixslow529
fixfast528:
  %t2445 = icmp eq i64 %t2433, 72
  %t2446 = select i1 %t2445, i64 257, i64 1
  br label %fixmerge530
fixslow529:
  %t2447 = call i64 @rt_num_eq(i64 %t2433, i64 72)
  br label %fixmerge530
fixmerge530:
  %t2448 = phi i64 [ %t2446, %fixfast528 ], [ %t2447, %fixslow529 ]
  %t2449 = icmp ne i64 %t2448, 1
  br i1 %t2449, label %then531, label %else532
then531:
  ret i64 %t2448
else532:
  %t2450 = or i64 %t2433, 80
  %t2451 = and i64 %t2450, 7
  %t2452 = icmp eq i64 %t2451, 0
  br i1 %t2452, label %fixfast533, label %fixslow534
fixfast533:
  %t2453 = icmp eq i64 %t2433, 80
  %t2454 = select i1 %t2453, i64 257, i64 1
  br label %fixmerge535
fixslow534:
  %t2455 = call i64 @rt_num_eq(i64 %t2433, i64 80)
  br label %fixmerge535
fixmerge535:
  %t2456 = phi i64 [ %t2454, %fixfast533 ], [ %t2455, %fixslow534 ]
  %t2457 = icmp ne i64 %t2456, 1
  br i1 %t2457, label %then536, label %else537
then536:
  ret i64 %t2456
else537:
  %t2458 = or i64 %t2433, 104
  %t2459 = and i64 %t2458, 7
  %t2460 = icmp eq i64 %t2459, 0
  br i1 %t2460, label %fixfast538, label %fixslow539
fixfast538:
  %t2461 = icmp eq i64 %t2433, 104
  %t2462 = select i1 %t2461, i64 257, i64 1
  br label %fixmerge540
fixslow539:
  %t2463 = call i64 @rt_num_eq(i64 %t2433, i64 104)
  br label %fixmerge540
fixmerge540:
  %t2464 = phi i64 [ %t2462, %fixfast538 ], [ %t2463, %fixslow539 ]
  ret i64 %t2464
}

define fastcc i64 @"scheme.base:code:rd-digit?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2469 = icmp eq i64 %argc, 1
  br i1 %t2469, label %argok542, label %arityerr541
arityerr541:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok542:
  %t2470 = call i64 @rt_char_to_integer(i64 %a0)
  %t2471 = or i64 376, %t2470
  %t2472 = and i64 %t2471, 7
  %t2473 = icmp eq i64 %t2472, 0
  br i1 %t2473, label %fixfast543, label %fixslow544
fixfast543:
  %t2474 = icmp slt i64 376, %t2470
  %t2475 = select i1 %t2474, i64 257, i64 1
  br label %fixmerge545
fixslow544:
  %t2476 = call i64 @rt_lt(i64 376, i64 %t2470)
  br label %fixmerge545
fixmerge545:
  %t2477 = phi i64 [ %t2475, %fixfast543 ], [ %t2476, %fixslow544 ]
  %t2478 = icmp ne i64 %t2477, 1
  br i1 %t2478, label %then546, label %else547
then546:
  %t2479 = or i64 %t2470, 464
  %t2480 = and i64 %t2479, 7
  %t2481 = icmp eq i64 %t2480, 0
  br i1 %t2481, label %fixfast548, label %fixslow549
fixfast548:
  %t2482 = icmp slt i64 %t2470, 464
  %t2483 = select i1 %t2482, i64 257, i64 1
  br label %fixmerge550
fixslow549:
  %t2484 = call i64 @rt_lt(i64 %t2470, i64 464)
  br label %fixmerge550
fixmerge550:
  %t2485 = phi i64 [ %t2483, %fixfast548 ], [ %t2484, %fixslow549 ]
  ret i64 %t2485
else547:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rd-delim?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2490 = icmp eq i64 %argc, 1
  br i1 %t2490, label %argok552, label %arityerr551
arityerr551:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok552:
  %t2491 = call i64 @rt_char_to_integer(i64 %a0)
  %t2492 = load i64, ptr @"scheme.base:rd-ws?"
  %t2493 = and i64 %t2492, -8
  %t2494 = inttoptr i64 %t2493 to ptr
  %t2495 = load i64, ptr %t2494
  %t2496 = inttoptr i64 %t2495 to ptr
  %t2497 = call fastcc i64%t2496(i64 %t2492, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2498 = icmp ne i64 %t2497, 1
  br i1 %t2498, label %then553, label %else554
then553:
  ret i64 %t2497
else554:
  %t2499 = or i64 %t2491, 320
  %t2500 = and i64 %t2499, 7
  %t2501 = icmp eq i64 %t2500, 0
  br i1 %t2501, label %fixfast555, label %fixslow556
fixfast555:
  %t2502 = icmp eq i64 %t2491, 320
  %t2503 = select i1 %t2502, i64 257, i64 1
  br label %fixmerge557
fixslow556:
  %t2504 = call i64 @rt_num_eq(i64 %t2491, i64 320)
  br label %fixmerge557
fixmerge557:
  %t2505 = phi i64 [ %t2503, %fixfast555 ], [ %t2504, %fixslow556 ]
  %t2506 = icmp ne i64 %t2505, 1
  br i1 %t2506, label %then558, label %else559
then558:
  ret i64 %t2505
else559:
  %t2507 = or i64 %t2491, 328
  %t2508 = and i64 %t2507, 7
  %t2509 = icmp eq i64 %t2508, 0
  br i1 %t2509, label %fixfast560, label %fixslow561
fixfast560:
  %t2510 = icmp eq i64 %t2491, 328
  %t2511 = select i1 %t2510, i64 257, i64 1
  br label %fixmerge562
fixslow561:
  %t2512 = call i64 @rt_num_eq(i64 %t2491, i64 328)
  br label %fixmerge562
fixmerge562:
  %t2513 = phi i64 [ %t2511, %fixfast560 ], [ %t2512, %fixslow561 ]
  %t2514 = icmp ne i64 %t2513, 1
  br i1 %t2514, label %then563, label %else564
then563:
  ret i64 %t2513
else564:
  %t2515 = or i64 %t2491, 728
  %t2516 = and i64 %t2515, 7
  %t2517 = icmp eq i64 %t2516, 0
  br i1 %t2517, label %fixfast565, label %fixslow566
fixfast565:
  %t2518 = icmp eq i64 %t2491, 728
  %t2519 = select i1 %t2518, i64 257, i64 1
  br label %fixmerge567
fixslow566:
  %t2520 = call i64 @rt_num_eq(i64 %t2491, i64 728)
  br label %fixmerge567
fixmerge567:
  %t2521 = phi i64 [ %t2519, %fixfast565 ], [ %t2520, %fixslow566 ]
  %t2522 = icmp ne i64 %t2521, 1
  br i1 %t2522, label %then568, label %else569
then568:
  ret i64 %t2521
else569:
  %t2523 = or i64 %t2491, 744
  %t2524 = and i64 %t2523, 7
  %t2525 = icmp eq i64 %t2524, 0
  br i1 %t2525, label %fixfast570, label %fixslow571
fixfast570:
  %t2526 = icmp eq i64 %t2491, 744
  %t2527 = select i1 %t2526, i64 257, i64 1
  br label %fixmerge572
fixslow571:
  %t2528 = call i64 @rt_num_eq(i64 %t2491, i64 744)
  br label %fixmerge572
fixmerge572:
  %t2529 = phi i64 [ %t2527, %fixfast570 ], [ %t2528, %fixslow571 ]
  %t2530 = icmp ne i64 %t2529, 1
  br i1 %t2530, label %then573, label %else574
then573:
  ret i64 %t2529
else574:
  %t2531 = or i64 %t2491, 272
  %t2532 = and i64 %t2531, 7
  %t2533 = icmp eq i64 %t2532, 0
  br i1 %t2533, label %fixfast575, label %fixslow576
fixfast575:
  %t2534 = icmp eq i64 %t2491, 272
  %t2535 = select i1 %t2534, i64 257, i64 1
  br label %fixmerge577
fixslow576:
  %t2536 = call i64 @rt_num_eq(i64 %t2491, i64 272)
  br label %fixmerge577
fixmerge577:
  %t2537 = phi i64 [ %t2535, %fixfast575 ], [ %t2536, %fixslow576 ]
  %t2538 = icmp ne i64 %t2537, 1
  br i1 %t2538, label %then578, label %else579
then578:
  ret i64 %t2537
else579:
  %t2539 = or i64 %t2491, 472
  %t2540 = and i64 %t2539, 7
  %t2541 = icmp eq i64 %t2540, 0
  br i1 %t2541, label %fixfast580, label %fixslow581
fixfast580:
  %t2542 = icmp eq i64 %t2491, 472
  %t2543 = select i1 %t2542, i64 257, i64 1
  br label %fixmerge582
fixslow581:
  %t2544 = call i64 @rt_num_eq(i64 %t2491, i64 472)
  br label %fixmerge582
fixmerge582:
  %t2545 = phi i64 [ %t2543, %fixfast580 ], [ %t2544, %fixslow581 ]
  ret i64 %t2545
}

define fastcc i64 @"scheme.base:code:rd-skip-line"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2550 = icmp eq i64 %argc, 3
  br i1 %t2550, label %argok584, label %arityerr583
arityerr583:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok584:
  %t2551 = or i64 %a2, %a1
  %t2552 = and i64 %t2551, 7
  %t2553 = icmp eq i64 %t2552, 0
  br i1 %t2553, label %fixfast585, label %fixslow586
fixfast585:
  %t2554 = icmp slt i64 %a2, %a1
  %t2555 = select i1 %t2554, i64 257, i64 1
  br label %fixmerge587
fixslow586:
  %t2556 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge587
fixmerge587:
  %t2557 = phi i64 [ %t2555, %fixfast585 ], [ %t2556, %fixslow586 ]
  %t2558 = icmp ne i64 %t2557, 1
  br i1 %t2558, label %then588, label %else589
then588:
  %t2559 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2560 = call i64 @rt_char_to_integer(i64 %t2559)
  %t2561 = or i64 %t2560, 80
  %t2562 = and i64 %t2561, 7
  %t2563 = icmp eq i64 %t2562, 0
  br i1 %t2563, label %fixfast590, label %fixslow591
fixfast590:
  %t2564 = icmp eq i64 %t2560, 80
  %t2565 = select i1 %t2564, i64 257, i64 1
  br label %fixmerge592
fixslow591:
  %t2566 = call i64 @rt_num_eq(i64 %t2560, i64 80)
  br label %fixmerge592
fixmerge592:
  %t2567 = phi i64 [ %t2565, %fixfast590 ], [ %t2566, %fixslow591 ]
  %t2568 = icmp ne i64 %t2567, 1
  br i1 %t2568, label %then593, label %else594
then593:
  %t2569 = or i64 %a2, 8
  %t2570 = and i64 %t2569, 7
  %t2571 = icmp eq i64 %t2570, 0
  br i1 %t2571, label %fixfast595, label %fixslow596
fixfast595:
  %t2572 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2573 = extractvalue {i64, i1} %t2572, 0
  %t2574 = extractvalue {i64, i1} %t2572, 1
  br i1 %t2574, label %fixslow596, label %fixmerge597
fixslow596:
  %t2575 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge597
fixmerge597:
  %t2576 = phi i64 [ %t2573, %fixfast595 ], [ %t2575, %fixslow596 ]
  ret i64 %t2576
else594:
  %t2577 = or i64 %a2, 8
  %t2578 = and i64 %t2577, 7
  %t2579 = icmp eq i64 %t2578, 0
  br i1 %t2579, label %fixfast598, label %fixslow599
fixfast598:
  %t2580 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2581 = extractvalue {i64, i1} %t2580, 0
  %t2582 = extractvalue {i64, i1} %t2580, 1
  br i1 %t2582, label %fixslow599, label %fixmerge600
fixslow599:
  %t2583 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge600
fixmerge600:
  %t2584 = phi i64 [ %t2581, %fixfast598 ], [ %t2583, %fixslow599 ]
  %t2585 = load i64, ptr @"scheme.base:rd-skip-line"
  %t2586 = and i64 %t2585, -8
  %t2587 = inttoptr i64 %t2586 to ptr
  %t2588 = load i64, ptr %t2587
  %t2589 = inttoptr i64 %t2588 to ptr
  %t2590 = musttail call fastcc i64 %t2589(i64 %t2585, i64 3, i64 %a0, i64 %a1, i64 %t2584, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2590
else589:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:rd-skip-ws"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2595 = icmp eq i64 %argc, 3
  br i1 %t2595, label %argok602, label %arityerr601
arityerr601:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok602:
  %t2596 = or i64 %a2, %a1
  %t2597 = and i64 %t2596, 7
  %t2598 = icmp eq i64 %t2597, 0
  br i1 %t2598, label %fixfast603, label %fixslow604
fixfast603:
  %t2599 = icmp slt i64 %a2, %a1
  %t2600 = select i1 %t2599, i64 257, i64 1
  br label %fixmerge605
fixslow604:
  %t2601 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge605
fixmerge605:
  %t2602 = phi i64 [ %t2600, %fixfast603 ], [ %t2601, %fixslow604 ]
  %t2603 = icmp ne i64 %t2602, 1
  br i1 %t2603, label %then606, label %else607
then606:
  %t2604 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2605 = load i64, ptr @"scheme.base:rd-ws?"
  %t2606 = and i64 %t2605, -8
  %t2607 = inttoptr i64 %t2606 to ptr
  %t2608 = load i64, ptr %t2607
  %t2609 = inttoptr i64 %t2608 to ptr
  %t2610 = call fastcc i64%t2609(i64 %t2605, i64 1, i64 %t2604, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2611 = icmp ne i64 %t2610, 1
  br i1 %t2611, label %then608, label %else609
then608:
  %t2612 = or i64 %a2, 8
  %t2613 = and i64 %t2612, 7
  %t2614 = icmp eq i64 %t2613, 0
  br i1 %t2614, label %fixfast610, label %fixslow611
fixfast610:
  %t2615 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2616 = extractvalue {i64, i1} %t2615, 0
  %t2617 = extractvalue {i64, i1} %t2615, 1
  br i1 %t2617, label %fixslow611, label %fixmerge612
fixslow611:
  %t2618 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge612
fixmerge612:
  %t2619 = phi i64 [ %t2616, %fixfast610 ], [ %t2618, %fixslow611 ]
  %t2620 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t2621 = and i64 %t2620, -8
  %t2622 = inttoptr i64 %t2621 to ptr
  %t2623 = load i64, ptr %t2622
  %t2624 = inttoptr i64 %t2623 to ptr
  %t2625 = musttail call fastcc i64 %t2624(i64 %t2620, i64 3, i64 %a0, i64 %a1, i64 %t2619, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2625
else609:
  %t2626 = call i64 @rt_char_to_integer(i64 %t2604)
  %t2627 = or i64 %t2626, 472
  %t2628 = and i64 %t2627, 7
  %t2629 = icmp eq i64 %t2628, 0
  br i1 %t2629, label %fixfast613, label %fixslow614
fixfast613:
  %t2630 = icmp eq i64 %t2626, 472
  %t2631 = select i1 %t2630, i64 257, i64 1
  br label %fixmerge615
fixslow614:
  %t2632 = call i64 @rt_num_eq(i64 %t2626, i64 472)
  br label %fixmerge615
fixmerge615:
  %t2633 = phi i64 [ %t2631, %fixfast613 ], [ %t2632, %fixslow614 ]
  %t2634 = icmp ne i64 %t2633, 1
  br i1 %t2634, label %then616, label %else617
then616:
  %t2635 = or i64 %a2, 8
  %t2636 = and i64 %t2635, 7
  %t2637 = icmp eq i64 %t2636, 0
  br i1 %t2637, label %fixfast618, label %fixslow619
fixfast618:
  %t2638 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2639 = extractvalue {i64, i1} %t2638, 0
  %t2640 = extractvalue {i64, i1} %t2638, 1
  br i1 %t2640, label %fixslow619, label %fixmerge620
fixslow619:
  %t2641 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge620
fixmerge620:
  %t2642 = phi i64 [ %t2639, %fixfast618 ], [ %t2641, %fixslow619 ]
  %t2643 = load i64, ptr @"scheme.base:rd-skip-line"
  %t2644 = and i64 %t2643, -8
  %t2645 = inttoptr i64 %t2644 to ptr
  %t2646 = load i64, ptr %t2645
  %t2647 = inttoptr i64 %t2646 to ptr
  %t2648 = call fastcc i64%t2647(i64 %t2643, i64 3, i64 %a0, i64 %a1, i64 %t2642, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2649 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t2650 = and i64 %t2649, -8
  %t2651 = inttoptr i64 %t2650 to ptr
  %t2652 = load i64, ptr %t2651
  %t2653 = inttoptr i64 %t2652 to ptr
  %t2654 = musttail call fastcc i64 %t2653(i64 %t2649, i64 3, i64 %a0, i64 %a1, i64 %t2648, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2654
else617:
  ret i64 %a2
else607:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:rd-token-end"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2659 = icmp eq i64 %argc, 3
  br i1 %t2659, label %argok622, label %arityerr621
arityerr621:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok622:
  %t2660 = or i64 %a2, %a1
  %t2661 = and i64 %t2660, 7
  %t2662 = icmp eq i64 %t2661, 0
  br i1 %t2662, label %fixfast623, label %fixslow624
fixfast623:
  %t2663 = icmp slt i64 %a2, %a1
  %t2664 = select i1 %t2663, i64 257, i64 1
  br label %fixmerge625
fixslow624:
  %t2665 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge625
fixmerge625:
  %t2666 = phi i64 [ %t2664, %fixfast623 ], [ %t2665, %fixslow624 ]
  %t2667 = icmp ne i64 %t2666, 1
  br i1 %t2667, label %then626, label %else627
then626:
  %t2668 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t2669 = load i64, ptr @"scheme.base:rd-delim?"
  %t2670 = and i64 %t2669, -8
  %t2671 = inttoptr i64 %t2670 to ptr
  %t2672 = load i64, ptr %t2671
  %t2673 = inttoptr i64 %t2672 to ptr
  %t2674 = call fastcc i64%t2673(i64 %t2669, i64 1, i64 %t2668, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2675 = icmp ne i64 %t2674, 1
  br i1 %t2675, label %then628, label %else629
then628:
  ret i64 %a2
else629:
  %t2676 = or i64 %a2, 8
  %t2677 = and i64 %t2676, 7
  %t2678 = icmp eq i64 %t2677, 0
  br i1 %t2678, label %fixfast630, label %fixslow631
fixfast630:
  %t2679 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t2680 = extractvalue {i64, i1} %t2679, 0
  %t2681 = extractvalue {i64, i1} %t2679, 1
  br i1 %t2681, label %fixslow631, label %fixmerge632
fixslow631:
  %t2682 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge632
fixmerge632:
  %t2683 = phi i64 [ %t2680, %fixfast630 ], [ %t2682, %fixslow631 ]
  %t2684 = load i64, ptr @"scheme.base:rd-token-end"
  %t2685 = and i64 %t2684, -8
  %t2686 = inttoptr i64 %t2685 to ptr
  %t2687 = load i64, ptr %t2686
  %t2688 = inttoptr i64 %t2687 to ptr
  %t2689 = musttail call fastcc i64 %t2688(i64 %t2684, i64 3, i64 %a0, i64 %a1, i64 %t2683, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2689
else627:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:rd-all-digits?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2694 = icmp eq i64 %argc, 3
  br i1 %t2694, label %argok634, label %arityerr633
arityerr633:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok634:
  %t2695 = or i64 %a1, %a2
  %t2696 = and i64 %t2695, 7
  %t2697 = icmp eq i64 %t2696, 0
  br i1 %t2697, label %fixfast635, label %fixslow636
fixfast635:
  %t2698 = icmp slt i64 %a1, %a2
  %t2699 = select i1 %t2698, i64 257, i64 1
  br label %fixmerge637
fixslow636:
  %t2700 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge637
fixmerge637:
  %t2701 = phi i64 [ %t2699, %fixfast635 ], [ %t2700, %fixslow636 ]
  %t2702 = icmp ne i64 %t2701, 1
  br i1 %t2702, label %then638, label %else639
then638:
  %t2703 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t2704 = load i64, ptr @"scheme.base:rd-digit?"
  %t2705 = and i64 %t2704, -8
  %t2706 = inttoptr i64 %t2705 to ptr
  %t2707 = load i64, ptr %t2706
  %t2708 = inttoptr i64 %t2707 to ptr
  %t2709 = call fastcc i64%t2708(i64 %t2704, i64 1, i64 %t2703, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2710 = icmp ne i64 %t2709, 1
  br i1 %t2710, label %then640, label %else641
then640:
  %t2711 = or i64 %a1, 8
  %t2712 = and i64 %t2711, 7
  %t2713 = icmp eq i64 %t2712, 0
  br i1 %t2713, label %fixfast642, label %fixslow643
fixfast642:
  %t2714 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t2715 = extractvalue {i64, i1} %t2714, 0
  %t2716 = extractvalue {i64, i1} %t2714, 1
  br i1 %t2716, label %fixslow643, label %fixmerge644
fixslow643:
  %t2717 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge644
fixmerge644:
  %t2718 = phi i64 [ %t2715, %fixfast642 ], [ %t2717, %fixslow643 ]
  %t2719 = load i64, ptr @"scheme.base:rd-all-digits?"
  %t2720 = and i64 %t2719, -8
  %t2721 = inttoptr i64 %t2720 to ptr
  %t2722 = load i64, ptr %t2721
  %t2723 = inttoptr i64 %t2722 to ptr
  %t2724 = musttail call fastcc i64 %t2723(i64 %t2719, i64 3, i64 %a0, i64 %t2718, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2724
else641:
  ret i64 1
else639:
  ret i64 257
}

define fastcc i64 @"scheme.base:code:rd-numeric?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2729 = icmp eq i64 %argc, 1
  br i1 %t2729, label %argok646, label %arityerr645
arityerr645:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok646:
  %t2730 = call i64 @rt_string_length(i64 %a0)
  %t2731 = or i64 0, %t2730
  %t2732 = and i64 %t2731, 7
  %t2733 = icmp eq i64 %t2732, 0
  br i1 %t2733, label %fixfast647, label %fixslow648
fixfast647:
  %t2734 = icmp slt i64 0, %t2730
  %t2735 = select i1 %t2734, i64 257, i64 1
  br label %fixmerge649
fixslow648:
  %t2736 = call i64 @rt_lt(i64 0, i64 %t2730)
  br label %fixmerge649
fixmerge649:
  %t2737 = phi i64 [ %t2735, %fixfast647 ], [ %t2736, %fixslow648 ]
  %t2738 = icmp ne i64 %t2737, 1
  br i1 %t2738, label %then650, label %else651
then650:
  %t2739 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t2740 = call i64 @rt_char_to_integer(i64 %t2739)
  %t2741 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t2742 = load i64, ptr @"scheme.base:rd-digit?"
  %t2743 = and i64 %t2742, -8
  %t2744 = inttoptr i64 %t2743 to ptr
  %t2745 = load i64, ptr %t2744
  %t2746 = inttoptr i64 %t2745 to ptr
  %t2747 = call fastcc i64%t2746(i64 %t2742, i64 1, i64 %t2741, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2748 = icmp ne i64 %t2747, 1
  br i1 %t2748, label %then652, label %else653
then652:
  %t2749 = load i64, ptr @"scheme.base:rd-all-digits?"
  %t2750 = and i64 %t2749, -8
  %t2751 = inttoptr i64 %t2750 to ptr
  %t2752 = load i64, ptr %t2751
  %t2753 = inttoptr i64 %t2752 to ptr
  %t2754 = musttail call fastcc i64 %t2753(i64 %t2749, i64 3, i64 %a0, i64 0, i64 %t2730, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2754
else653:
  %t2755 = or i64 %t2740, 360
  %t2756 = and i64 %t2755, 7
  %t2757 = icmp eq i64 %t2756, 0
  br i1 %t2757, label %fixfast654, label %fixslow655
fixfast654:
  %t2758 = icmp eq i64 %t2740, 360
  %t2759 = select i1 %t2758, i64 257, i64 1
  br label %fixmerge656
fixslow655:
  %t2760 = call i64 @rt_num_eq(i64 %t2740, i64 360)
  br label %fixmerge656
fixmerge656:
  %t2761 = phi i64 [ %t2759, %fixfast654 ], [ %t2760, %fixslow655 ]
  %t2762 = icmp ne i64 %t2761, 1
  br i1 %t2762, label %then657, label %else658
then657:
  br label %merge659
else658:
  %t2763 = or i64 %t2740, 344
  %t2764 = and i64 %t2763, 7
  %t2765 = icmp eq i64 %t2764, 0
  br i1 %t2765, label %fixfast660, label %fixslow661
fixfast660:
  %t2766 = icmp eq i64 %t2740, 344
  %t2767 = select i1 %t2766, i64 257, i64 1
  br label %fixmerge662
fixslow661:
  %t2768 = call i64 @rt_num_eq(i64 %t2740, i64 344)
  br label %fixmerge662
fixmerge662:
  %t2769 = phi i64 [ %t2767, %fixfast660 ], [ %t2768, %fixslow661 ]
  br label %merge659
merge659:
  %t2770 = phi i64 [ %t2761, %then657 ], [ %t2769, %fixmerge662 ]
  %t2771 = icmp ne i64 %t2770, 1
  br i1 %t2771, label %then663, label %else664
then663:
  %t2772 = or i64 8, %t2730
  %t2773 = and i64 %t2772, 7
  %t2774 = icmp eq i64 %t2773, 0
  br i1 %t2774, label %fixfast665, label %fixslow666
fixfast665:
  %t2775 = icmp slt i64 8, %t2730
  %t2776 = select i1 %t2775, i64 257, i64 1
  br label %fixmerge667
fixslow666:
  %t2777 = call i64 @rt_lt(i64 8, i64 %t2730)
  br label %fixmerge667
fixmerge667:
  %t2778 = phi i64 [ %t2776, %fixfast665 ], [ %t2777, %fixslow666 ]
  %t2779 = icmp ne i64 %t2778, 1
  br i1 %t2779, label %then668, label %else669
then668:
  %t2780 = load i64, ptr @"scheme.base:rd-all-digits?"
  %t2781 = and i64 %t2780, -8
  %t2782 = inttoptr i64 %t2781 to ptr
  %t2783 = load i64, ptr %t2782
  %t2784 = inttoptr i64 %t2783 to ptr
  %t2785 = musttail call fastcc i64 %t2784(i64 %t2780, i64 3, i64 %a0, i64 8, i64 %t2730, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2785
else669:
  ret i64 1
else664:
  ret i64 1
else651:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rd-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2790 = icmp eq i64 %argc, 4
  br i1 %t2790, label %argok671, label %arityerr670
arityerr670:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok671:
  %t2791 = or i64 %a1, %a2
  %t2792 = and i64 %t2791, 7
  %t2793 = icmp eq i64 %t2792, 0
  br i1 %t2793, label %fixfast672, label %fixslow673
fixfast672:
  %t2794 = icmp slt i64 %a1, %a2
  %t2795 = select i1 %t2794, i64 257, i64 1
  br label %fixmerge674
fixslow673:
  %t2796 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge674
fixmerge674:
  %t2797 = phi i64 [ %t2795, %fixfast672 ], [ %t2796, %fixslow673 ]
  %t2798 = icmp ne i64 %t2797, 1
  br i1 %t2798, label %then675, label %else676
then675:
  %t2799 = or i64 %a1, 8
  %t2800 = and i64 %t2799, 7
  %t2801 = icmp eq i64 %t2800, 0
  br i1 %t2801, label %fixfast677, label %fixslow678
fixfast677:
  %t2802 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t2803 = extractvalue {i64, i1} %t2802, 0
  %t2804 = extractvalue {i64, i1} %t2802, 1
  br i1 %t2804, label %fixslow678, label %fixmerge679
fixslow678:
  %t2805 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge679
fixmerge679:
  %t2806 = phi i64 [ %t2803, %fixfast677 ], [ %t2805, %fixslow678 ]
  %t2807 = or i64 %a3, 80
  %t2808 = and i64 %t2807, 7
  %t2809 = icmp eq i64 %t2808, 0
  br i1 %t2809, label %fixfast680, label %fixslow681
fixfast680:
  %t2810 = ashr i64 %a3, 3
  %t2811 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t2810, i64 80)
  %t2812 = extractvalue {i64, i1} %t2811, 0
  %t2813 = extractvalue {i64, i1} %t2811, 1
  br i1 %t2813, label %fixslow681, label %fixmerge682
fixslow681:
  %t2814 = call i64 @rt_mul(i64 %a3, i64 80)
  br label %fixmerge682
fixmerge682:
  %t2815 = phi i64 [ %t2812, %fixfast680 ], [ %t2814, %fixslow681 ]
  %t2816 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t2817 = call i64 @rt_char_to_integer(i64 %t2816)
  %t2818 = or i64 %t2817, 384
  %t2819 = and i64 %t2818, 7
  %t2820 = icmp eq i64 %t2819, 0
  br i1 %t2820, label %fixfast683, label %fixslow684
fixfast683:
  %t2821 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t2817, i64 384)
  %t2822 = extractvalue {i64, i1} %t2821, 0
  %t2823 = extractvalue {i64, i1} %t2821, 1
  br i1 %t2823, label %fixslow684, label %fixmerge685
fixslow684:
  %t2824 = call i64 @rt_sub(i64 %t2817, i64 384)
  br label %fixmerge685
fixmerge685:
  %t2825 = phi i64 [ %t2822, %fixfast683 ], [ %t2824, %fixslow684 ]
  %t2826 = or i64 %t2815, %t2825
  %t2827 = and i64 %t2826, 7
  %t2828 = icmp eq i64 %t2827, 0
  br i1 %t2828, label %fixfast686, label %fixslow687
fixfast686:
  %t2829 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t2815, i64 %t2825)
  %t2830 = extractvalue {i64, i1} %t2829, 0
  %t2831 = extractvalue {i64, i1} %t2829, 1
  br i1 %t2831, label %fixslow687, label %fixmerge688
fixslow687:
  %t2832 = call i64 @rt_add(i64 %t2815, i64 %t2825)
  br label %fixmerge688
fixmerge688:
  %t2833 = phi i64 [ %t2830, %fixfast686 ], [ %t2832, %fixslow687 ]
  %t2834 = load i64, ptr @"scheme.base:rd-digits"
  %t2835 = and i64 %t2834, -8
  %t2836 = inttoptr i64 %t2835 to ptr
  %t2837 = load i64, ptr %t2836
  %t2838 = inttoptr i64 %t2837 to ptr
  %t2839 = musttail call fastcc i64 %t2838(i64 %t2834, i64 4, i64 %a0, i64 %t2806, i64 %a2, i64 %t2833, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2839
else676:
  ret i64 %a3
}

define fastcc i64 @"scheme.base:code:rd-digits-neg"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2844 = icmp eq i64 %argc, 4
  br i1 %t2844, label %argok690, label %arityerr689
arityerr689:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok690:
  %t2845 = or i64 %a1, %a2
  %t2846 = and i64 %t2845, 7
  %t2847 = icmp eq i64 %t2846, 0
  br i1 %t2847, label %fixfast691, label %fixslow692
fixfast691:
  %t2848 = icmp slt i64 %a1, %a2
  %t2849 = select i1 %t2848, i64 257, i64 1
  br label %fixmerge693
fixslow692:
  %t2850 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge693
fixmerge693:
  %t2851 = phi i64 [ %t2849, %fixfast691 ], [ %t2850, %fixslow692 ]
  %t2852 = icmp ne i64 %t2851, 1
  br i1 %t2852, label %then694, label %else695
then694:
  %t2853 = or i64 %a1, 8
  %t2854 = and i64 %t2853, 7
  %t2855 = icmp eq i64 %t2854, 0
  br i1 %t2855, label %fixfast696, label %fixslow697
fixfast696:
  %t2856 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t2857 = extractvalue {i64, i1} %t2856, 0
  %t2858 = extractvalue {i64, i1} %t2856, 1
  br i1 %t2858, label %fixslow697, label %fixmerge698
fixslow697:
  %t2859 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge698
fixmerge698:
  %t2860 = phi i64 [ %t2857, %fixfast696 ], [ %t2859, %fixslow697 ]
  %t2861 = or i64 %a3, 80
  %t2862 = and i64 %t2861, 7
  %t2863 = icmp eq i64 %t2862, 0
  br i1 %t2863, label %fixfast699, label %fixslow700
fixfast699:
  %t2864 = ashr i64 %a3, 3
  %t2865 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t2864, i64 80)
  %t2866 = extractvalue {i64, i1} %t2865, 0
  %t2867 = extractvalue {i64, i1} %t2865, 1
  br i1 %t2867, label %fixslow700, label %fixmerge701
fixslow700:
  %t2868 = call i64 @rt_mul(i64 %a3, i64 80)
  br label %fixmerge701
fixmerge701:
  %t2869 = phi i64 [ %t2866, %fixfast699 ], [ %t2868, %fixslow700 ]
  %t2870 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t2871 = call i64 @rt_char_to_integer(i64 %t2870)
  %t2872 = or i64 %t2871, 384
  %t2873 = and i64 %t2872, 7
  %t2874 = icmp eq i64 %t2873, 0
  br i1 %t2874, label %fixfast702, label %fixslow703
fixfast702:
  %t2875 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t2871, i64 384)
  %t2876 = extractvalue {i64, i1} %t2875, 0
  %t2877 = extractvalue {i64, i1} %t2875, 1
  br i1 %t2877, label %fixslow703, label %fixmerge704
fixslow703:
  %t2878 = call i64 @rt_sub(i64 %t2871, i64 384)
  br label %fixmerge704
fixmerge704:
  %t2879 = phi i64 [ %t2876, %fixfast702 ], [ %t2878, %fixslow703 ]
  %t2880 = or i64 %t2869, %t2879
  %t2881 = and i64 %t2880, 7
  %t2882 = icmp eq i64 %t2881, 0
  br i1 %t2882, label %fixfast705, label %fixslow706
fixfast705:
  %t2883 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t2869, i64 %t2879)
  %t2884 = extractvalue {i64, i1} %t2883, 0
  %t2885 = extractvalue {i64, i1} %t2883, 1
  br i1 %t2885, label %fixslow706, label %fixmerge707
fixslow706:
  %t2886 = call i64 @rt_sub(i64 %t2869, i64 %t2879)
  br label %fixmerge707
fixmerge707:
  %t2887 = phi i64 [ %t2884, %fixfast705 ], [ %t2886, %fixslow706 ]
  %t2888 = load i64, ptr @"scheme.base:rd-digits-neg"
  %t2889 = and i64 %t2888, -8
  %t2890 = inttoptr i64 %t2889 to ptr
  %t2891 = load i64, ptr %t2890
  %t2892 = inttoptr i64 %t2891 to ptr
  %t2893 = musttail call fastcc i64 %t2892(i64 %t2888, i64 4, i64 %a0, i64 %t2860, i64 %a2, i64 %t2887, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2893
else695:
  ret i64 %a3
}

define fastcc i64 @"scheme.base:code:rd-parse-int"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2898 = icmp eq i64 %argc, 1
  br i1 %t2898, label %argok709, label %arityerr708
arityerr708:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok709:
  %t2899 = call i64 @rt_string_length(i64 %a0)
  %t2900 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t2901 = call i64 @rt_char_to_integer(i64 %t2900)
  %t2902 = or i64 %t2901, 360
  %t2903 = and i64 %t2902, 7
  %t2904 = icmp eq i64 %t2903, 0
  br i1 %t2904, label %fixfast710, label %fixslow711
fixfast710:
  %t2905 = icmp eq i64 %t2901, 360
  %t2906 = select i1 %t2905, i64 257, i64 1
  br label %fixmerge712
fixslow711:
  %t2907 = call i64 @rt_num_eq(i64 %t2901, i64 360)
  br label %fixmerge712
fixmerge712:
  %t2908 = phi i64 [ %t2906, %fixfast710 ], [ %t2907, %fixslow711 ]
  %t2909 = icmp ne i64 %t2908, 1
  br i1 %t2909, label %then713, label %else714
then713:
  %t2910 = load i64, ptr @"scheme.base:rd-digits-neg"
  %t2911 = and i64 %t2910, -8
  %t2912 = inttoptr i64 %t2911 to ptr
  %t2913 = load i64, ptr %t2912
  %t2914 = inttoptr i64 %t2913 to ptr
  %t2915 = musttail call fastcc i64 %t2914(i64 %t2910, i64 4, i64 %a0, i64 8, i64 %t2899, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2915
else714:
  %t2916 = or i64 %t2901, 344
  %t2917 = and i64 %t2916, 7
  %t2918 = icmp eq i64 %t2917, 0
  br i1 %t2918, label %fixfast715, label %fixslow716
fixfast715:
  %t2919 = icmp eq i64 %t2901, 344
  %t2920 = select i1 %t2919, i64 257, i64 1
  br label %fixmerge717
fixslow716:
  %t2921 = call i64 @rt_num_eq(i64 %t2901, i64 344)
  br label %fixmerge717
fixmerge717:
  %t2922 = phi i64 [ %t2920, %fixfast715 ], [ %t2921, %fixslow716 ]
  %t2923 = icmp ne i64 %t2922, 1
  br i1 %t2923, label %then718, label %else719
then718:
  %t2924 = load i64, ptr @"scheme.base:rd-digits"
  %t2925 = and i64 %t2924, -8
  %t2926 = inttoptr i64 %t2925 to ptr
  %t2927 = load i64, ptr %t2926
  %t2928 = inttoptr i64 %t2927 to ptr
  %t2929 = musttail call fastcc i64 %t2928(i64 %t2924, i64 4, i64 %a0, i64 8, i64 %t2899, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2929
else719:
  %t2930 = load i64, ptr @"scheme.base:rd-digits"
  %t2931 = and i64 %t2930, -8
  %t2932 = inttoptr i64 %t2931 to ptr
  %t2933 = load i64, ptr %t2932
  %t2934 = inttoptr i64 %t2933 to ptr
  %t2935 = musttail call fastcc i64 %t2934(i64 %t2930, i64 4, i64 %a0, i64 0, i64 %t2899, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2935
}

define fastcc i64 @"scheme.base:code:rd-dotchar?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2940 = icmp eq i64 %argc, 1
  br i1 %t2940, label %argok721, label %arityerr720
arityerr720:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok721:
  %t2941 = call i64 @rt_char_to_integer(i64 %a0)
  %t2942 = or i64 %t2941, 368
  %t2943 = and i64 %t2942, 7
  %t2944 = icmp eq i64 %t2943, 0
  br i1 %t2944, label %fixfast722, label %fixslow723
fixfast722:
  %t2945 = icmp eq i64 %t2941, 368
  %t2946 = select i1 %t2945, i64 257, i64 1
  br label %fixmerge724
fixslow723:
  %t2947 = call i64 @rt_num_eq(i64 %t2941, i64 368)
  br label %fixmerge724
fixmerge724:
  %t2948 = phi i64 [ %t2946, %fixfast722 ], [ %t2947, %fixslow723 ]
  ret i64 %t2948
}

define fastcc i64 @"scheme.base:code:rd-exp-char?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2953 = icmp eq i64 %argc, 1
  br i1 %t2953, label %argok726, label %arityerr725
arityerr725:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok726:
  %t2954 = call i64 @rt_char_to_integer(i64 %a0)
  %t2955 = or i64 %t2954, 808
  %t2956 = and i64 %t2955, 7
  %t2957 = icmp eq i64 %t2956, 0
  br i1 %t2957, label %fixfast727, label %fixslow728
fixfast727:
  %t2958 = icmp eq i64 %t2954, 808
  %t2959 = select i1 %t2958, i64 257, i64 1
  br label %fixmerge729
fixslow728:
  %t2960 = call i64 @rt_num_eq(i64 %t2954, i64 808)
  br label %fixmerge729
fixmerge729:
  %t2961 = phi i64 [ %t2959, %fixfast727 ], [ %t2960, %fixslow728 ]
  %t2962 = icmp ne i64 %t2961, 1
  br i1 %t2962, label %then730, label %else731
then730:
  ret i64 %t2961
else731:
  %t2963 = or i64 %t2954, 552
  %t2964 = and i64 %t2963, 7
  %t2965 = icmp eq i64 %t2964, 0
  br i1 %t2965, label %fixfast732, label %fixslow733
fixfast732:
  %t2966 = icmp eq i64 %t2954, 552
  %t2967 = select i1 %t2966, i64 257, i64 1
  br label %fixmerge734
fixslow733:
  %t2968 = call i64 @rt_num_eq(i64 %t2954, i64 552)
  br label %fixmerge734
fixmerge734:
  %t2969 = phi i64 [ %t2967, %fixfast732 ], [ %t2968, %fixslow733 ]
  ret i64 %t2969
}

define fastcc i64 @"scheme.base:code:rd-sign-char?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2974 = icmp eq i64 %argc, 1
  br i1 %t2974, label %argok736, label %arityerr735
arityerr735:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok736:
  %t2975 = call i64 @rt_char_to_integer(i64 %a0)
  %t2976 = or i64 %t2975, 344
  %t2977 = and i64 %t2976, 7
  %t2978 = icmp eq i64 %t2977, 0
  br i1 %t2978, label %fixfast737, label %fixslow738
fixfast737:
  %t2979 = icmp eq i64 %t2975, 344
  %t2980 = select i1 %t2979, i64 257, i64 1
  br label %fixmerge739
fixslow738:
  %t2981 = call i64 @rt_num_eq(i64 %t2975, i64 344)
  br label %fixmerge739
fixmerge739:
  %t2982 = phi i64 [ %t2980, %fixfast737 ], [ %t2981, %fixslow738 ]
  %t2983 = icmp ne i64 %t2982, 1
  br i1 %t2983, label %then740, label %else741
then740:
  ret i64 %t2982
else741:
  %t2984 = or i64 %t2975, 360
  %t2985 = and i64 %t2984, 7
  %t2986 = icmp eq i64 %t2985, 0
  br i1 %t2986, label %fixfast742, label %fixslow743
fixfast742:
  %t2987 = icmp eq i64 %t2975, 360
  %t2988 = select i1 %t2987, i64 257, i64 1
  br label %fixmerge744
fixslow743:
  %t2989 = call i64 @rt_num_eq(i64 %t2975, i64 360)
  br label %fixmerge744
fixmerge744:
  %t2990 = phi i64 [ %t2988, %fixfast742 ], [ %t2989, %fixslow743 ]
  ret i64 %t2990
}

define fastcc i64 @"scheme.base:code:rd-scan-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2995 = icmp eq i64 %argc, 3
  br i1 %t2995, label %argok746, label %arityerr745
arityerr745:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok746:
  %t2996 = or i64 %a1, %a2
  %t2997 = and i64 %t2996, 7
  %t2998 = icmp eq i64 %t2997, 0
  br i1 %t2998, label %fixfast747, label %fixslow748
fixfast747:
  %t2999 = icmp slt i64 %a1, %a2
  %t3000 = select i1 %t2999, i64 257, i64 1
  br label %fixmerge749
fixslow748:
  %t3001 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge749
fixmerge749:
  %t3002 = phi i64 [ %t3000, %fixfast747 ], [ %t3001, %fixslow748 ]
  %t3003 = icmp ne i64 %t3002, 1
  br i1 %t3003, label %then750, label %else751
then750:
  %t3004 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t3005 = load i64, ptr @"scheme.base:rd-digit?"
  %t3006 = and i64 %t3005, -8
  %t3007 = inttoptr i64 %t3006 to ptr
  %t3008 = load i64, ptr %t3007
  %t3009 = inttoptr i64 %t3008 to ptr
  %t3010 = call fastcc i64%t3009(i64 %t3005, i64 1, i64 %t3004, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge752
else751:
  br label %merge752
merge752:
  %t3011 = phi i64 [ %t3010, %then750 ], [ 1, %else751 ]
  %t3012 = icmp ne i64 %t3011, 1
  br i1 %t3012, label %then753, label %else754
then753:
  %t3013 = or i64 %a1, 8
  %t3014 = and i64 %t3013, 7
  %t3015 = icmp eq i64 %t3014, 0
  br i1 %t3015, label %fixfast755, label %fixslow756
fixfast755:
  %t3016 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t3017 = extractvalue {i64, i1} %t3016, 0
  %t3018 = extractvalue {i64, i1} %t3016, 1
  br i1 %t3018, label %fixslow756, label %fixmerge757
fixslow756:
  %t3019 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge757
fixmerge757:
  %t3020 = phi i64 [ %t3017, %fixfast755 ], [ %t3019, %fixslow756 ]
  %t3021 = load i64, ptr @"scheme.base:rd-scan-digits"
  %t3022 = and i64 %t3021, -8
  %t3023 = inttoptr i64 %t3022 to ptr
  %t3024 = load i64, ptr %t3023
  %t3025 = inttoptr i64 %t3024 to ptr
  %t3026 = musttail call fastcc i64 %t3025(i64 %t3021, i64 3, i64 %a0, i64 %t3020, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3026
else754:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:rd-flonum?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3031 = icmp eq i64 %argc, 1
  br i1 %t3031, label %argok759, label %arityerr758
arityerr758:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok759:
  %t3032 = call i64 @rt_string_length(i64 %a0)
  %t3033 = or i64 0, %t3032
  %t3034 = and i64 %t3033, 7
  %t3035 = icmp eq i64 %t3034, 0
  br i1 %t3035, label %fixfast760, label %fixslow761
fixfast760:
  %t3036 = icmp slt i64 0, %t3032
  %t3037 = select i1 %t3036, i64 257, i64 1
  br label %fixmerge762
fixslow761:
  %t3038 = call i64 @rt_lt(i64 0, i64 %t3032)
  br label %fixmerge762
fixmerge762:
  %t3039 = phi i64 [ %t3037, %fixfast760 ], [ %t3038, %fixslow761 ]
  %t3040 = icmp ne i64 %t3039, 1
  br i1 %t3040, label %then763, label %else764
then763:
  %t3041 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t3042 = load i64, ptr @"scheme.base:rd-sign-char?"
  %t3043 = and i64 %t3042, -8
  %t3044 = inttoptr i64 %t3043 to ptr
  %t3045 = load i64, ptr %t3044
  %t3046 = inttoptr i64 %t3045 to ptr
  %t3047 = call fastcc i64%t3046(i64 %t3042, i64 1, i64 %t3041, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3048 = icmp ne i64 %t3047, 1
  br i1 %t3048, label %then765, label %else766
then765:
  br label %merge767
else766:
  br label %merge767
merge767:
  %t3049 = phi i64 [ 8, %then765 ], [ 0, %else766 ]
  %t3050 = load i64, ptr @"scheme.base:rd-scan-digits"
  %t3051 = and i64 %t3050, -8
  %t3052 = inttoptr i64 %t3051 to ptr
  %t3053 = load i64, ptr %t3052
  %t3054 = inttoptr i64 %t3053 to ptr
  %t3055 = call fastcc i64%t3054(i64 %t3050, i64 3, i64 %a0, i64 %t3049, i64 %t3032, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3056 = or i64 %t3055, %t3032
  %t3057 = and i64 %t3056, 7
  %t3058 = icmp eq i64 %t3057, 0
  br i1 %t3058, label %fixfast768, label %fixslow769
fixfast768:
  %t3059 = icmp slt i64 %t3055, %t3032
  %t3060 = select i1 %t3059, i64 257, i64 1
  br label %fixmerge770
fixslow769:
  %t3061 = call i64 @rt_lt(i64 %t3055, i64 %t3032)
  br label %fixmerge770
fixmerge770:
  %t3062 = phi i64 [ %t3060, %fixfast768 ], [ %t3061, %fixslow769 ]
  %t3063 = icmp ne i64 %t3062, 1
  br i1 %t3063, label %then771, label %else772
then771:
  %t3064 = call i64 @rt_string_ref(i64 %a0, i64 %t3055)
  %t3065 = load i64, ptr @"scheme.base:rd-dotchar?"
  %t3066 = and i64 %t3065, -8
  %t3067 = inttoptr i64 %t3066 to ptr
  %t3068 = load i64, ptr %t3067
  %t3069 = inttoptr i64 %t3068 to ptr
  %t3070 = call fastcc i64%t3069(i64 %t3065, i64 1, i64 %t3064, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge773
else772:
  br label %merge773
merge773:
  %t3071 = phi i64 [ %t3070, %then771 ], [ 1, %else772 ]
  %t3072 = icmp ne i64 %t3071, 1
  br i1 %t3072, label %then774, label %else775
then774:
  %t3073 = or i64 %t3055, 8
  %t3074 = and i64 %t3073, 7
  %t3075 = icmp eq i64 %t3074, 0
  br i1 %t3075, label %fixfast777, label %fixslow778
fixfast777:
  %t3076 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3055, i64 8)
  %t3077 = extractvalue {i64, i1} %t3076, 0
  %t3078 = extractvalue {i64, i1} %t3076, 1
  br i1 %t3078, label %fixslow778, label %fixmerge779
fixslow778:
  %t3079 = call i64 @rt_add(i64 %t3055, i64 8)
  br label %fixmerge779
fixmerge779:
  %t3080 = phi i64 [ %t3077, %fixfast777 ], [ %t3079, %fixslow778 ]
  br label %merge776
else775:
  br label %merge776
merge776:
  %t3081 = phi i64 [ %t3080, %fixmerge779 ], [ %t3055, %else775 ]
  %t3082 = or i64 %t3055, %t3081
  %t3083 = and i64 %t3082, 7
  %t3084 = icmp eq i64 %t3083, 0
  br i1 %t3084, label %fixfast780, label %fixslow781
fixfast780:
  %t3085 = icmp slt i64 %t3055, %t3081
  %t3086 = select i1 %t3085, i64 257, i64 1
  br label %fixmerge782
fixslow781:
  %t3087 = call i64 @rt_lt(i64 %t3055, i64 %t3081)
  br label %fixmerge782
fixmerge782:
  %t3088 = phi i64 [ %t3086, %fixfast780 ], [ %t3087, %fixslow781 ]
  %t3089 = load i64, ptr @"scheme.base:rd-scan-digits"
  %t3090 = and i64 %t3089, -8
  %t3091 = inttoptr i64 %t3090 to ptr
  %t3092 = load i64, ptr %t3091
  %t3093 = inttoptr i64 %t3092 to ptr
  %t3094 = call fastcc i64%t3093(i64 %t3089, i64 3, i64 %a0, i64 %t3081, i64 %t3032, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3095 = or i64 %t3049, %t3055
  %t3096 = and i64 %t3095, 7
  %t3097 = icmp eq i64 %t3096, 0
  br i1 %t3097, label %fixfast783, label %fixslow784
fixfast783:
  %t3098 = icmp slt i64 %t3049, %t3055
  %t3099 = select i1 %t3098, i64 257, i64 1
  br label %fixmerge785
fixslow784:
  %t3100 = call i64 @rt_lt(i64 %t3049, i64 %t3055)
  br label %fixmerge785
fixmerge785:
  %t3101 = phi i64 [ %t3099, %fixfast783 ], [ %t3100, %fixslow784 ]
  %t3102 = icmp ne i64 %t3101, 1
  br i1 %t3102, label %then786, label %else787
then786:
  br label %merge788
else787:
  %t3103 = or i64 %t3081, %t3094
  %t3104 = and i64 %t3103, 7
  %t3105 = icmp eq i64 %t3104, 0
  br i1 %t3105, label %fixfast789, label %fixslow790
fixfast789:
  %t3106 = icmp slt i64 %t3081, %t3094
  %t3107 = select i1 %t3106, i64 257, i64 1
  br label %fixmerge791
fixslow790:
  %t3108 = call i64 @rt_lt(i64 %t3081, i64 %t3094)
  br label %fixmerge791
fixmerge791:
  %t3109 = phi i64 [ %t3107, %fixfast789 ], [ %t3108, %fixslow790 ]
  br label %merge788
merge788:
  %t3110 = phi i64 [ %t3101, %then786 ], [ %t3109, %fixmerge791 ]
  %t3111 = icmp ne i64 %t3110, 1
  br i1 %t3111, label %then792, label %else793
then792:
  %t3112 = or i64 %t3094, %t3032
  %t3113 = and i64 %t3112, 7
  %t3114 = icmp eq i64 %t3113, 0
  br i1 %t3114, label %fixfast794, label %fixslow795
fixfast794:
  %t3115 = icmp slt i64 %t3094, %t3032
  %t3116 = select i1 %t3115, i64 257, i64 1
  br label %fixmerge796
fixslow795:
  %t3117 = call i64 @rt_lt(i64 %t3094, i64 %t3032)
  br label %fixmerge796
fixmerge796:
  %t3118 = phi i64 [ %t3116, %fixfast794 ], [ %t3117, %fixslow795 ]
  %t3119 = icmp ne i64 %t3118, 1
  br i1 %t3119, label %then797, label %else798
then797:
  %t3120 = call i64 @rt_string_ref(i64 %a0, i64 %t3094)
  %t3121 = load i64, ptr @"scheme.base:rd-exp-char?"
  %t3122 = and i64 %t3121, -8
  %t3123 = inttoptr i64 %t3122 to ptr
  %t3124 = load i64, ptr %t3123
  %t3125 = inttoptr i64 %t3124 to ptr
  %t3126 = call fastcc i64%t3125(i64 %t3121, i64 1, i64 %t3120, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge799
else798:
  br label %merge799
merge799:
  %t3127 = phi i64 [ %t3126, %then797 ], [ 1, %else798 ]
  %t3128 = icmp ne i64 %t3127, 1
  br i1 %t3128, label %then800, label %else801
then800:
  %t3129 = or i64 %t3094, 8
  %t3130 = and i64 %t3129, 7
  %t3131 = icmp eq i64 %t3130, 0
  br i1 %t3131, label %fixfast803, label %fixslow804
fixfast803:
  %t3132 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3094, i64 8)
  %t3133 = extractvalue {i64, i1} %t3132, 0
  %t3134 = extractvalue {i64, i1} %t3132, 1
  br i1 %t3134, label %fixslow804, label %fixmerge805
fixslow804:
  %t3135 = call i64 @rt_add(i64 %t3094, i64 8)
  br label %fixmerge805
fixmerge805:
  %t3136 = phi i64 [ %t3133, %fixfast803 ], [ %t3135, %fixslow804 ]
  %t3137 = or i64 %t3136, %t3032
  %t3138 = and i64 %t3137, 7
  %t3139 = icmp eq i64 %t3138, 0
  br i1 %t3139, label %fixfast806, label %fixslow807
fixfast806:
  %t3140 = icmp slt i64 %t3136, %t3032
  %t3141 = select i1 %t3140, i64 257, i64 1
  br label %fixmerge808
fixslow807:
  %t3142 = call i64 @rt_lt(i64 %t3136, i64 %t3032)
  br label %fixmerge808
fixmerge808:
  %t3143 = phi i64 [ %t3141, %fixfast806 ], [ %t3142, %fixslow807 ]
  %t3144 = icmp ne i64 %t3143, 1
  br i1 %t3144, label %then809, label %else810
then809:
  %t3145 = or i64 %t3094, 8
  %t3146 = and i64 %t3145, 7
  %t3147 = icmp eq i64 %t3146, 0
  br i1 %t3147, label %fixfast812, label %fixslow813
fixfast812:
  %t3148 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3094, i64 8)
  %t3149 = extractvalue {i64, i1} %t3148, 0
  %t3150 = extractvalue {i64, i1} %t3148, 1
  br i1 %t3150, label %fixslow813, label %fixmerge814
fixslow813:
  %t3151 = call i64 @rt_add(i64 %t3094, i64 8)
  br label %fixmerge814
fixmerge814:
  %t3152 = phi i64 [ %t3149, %fixfast812 ], [ %t3151, %fixslow813 ]
  %t3153 = call i64 @rt_string_ref(i64 %a0, i64 %t3152)
  %t3154 = load i64, ptr @"scheme.base:rd-sign-char?"
  %t3155 = and i64 %t3154, -8
  %t3156 = inttoptr i64 %t3155 to ptr
  %t3157 = load i64, ptr %t3156
  %t3158 = inttoptr i64 %t3157 to ptr
  %t3159 = call fastcc i64%t3158(i64 %t3154, i64 1, i64 %t3153, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge811
else810:
  br label %merge811
merge811:
  %t3160 = phi i64 [ %t3159, %fixmerge814 ], [ 1, %else810 ]
  %t3161 = icmp ne i64 %t3160, 1
  br i1 %t3161, label %then815, label %else816
then815:
  %t3162 = or i64 %t3094, 16
  %t3163 = and i64 %t3162, 7
  %t3164 = icmp eq i64 %t3163, 0
  br i1 %t3164, label %fixfast818, label %fixslow819
fixfast818:
  %t3165 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3094, i64 16)
  %t3166 = extractvalue {i64, i1} %t3165, 0
  %t3167 = extractvalue {i64, i1} %t3165, 1
  br i1 %t3167, label %fixslow819, label %fixmerge820
fixslow819:
  %t3168 = call i64 @rt_add(i64 %t3094, i64 16)
  br label %fixmerge820
fixmerge820:
  %t3169 = phi i64 [ %t3166, %fixfast818 ], [ %t3168, %fixslow819 ]
  br label %merge817
else816:
  %t3170 = or i64 %t3094, 8
  %t3171 = and i64 %t3170, 7
  %t3172 = icmp eq i64 %t3171, 0
  br i1 %t3172, label %fixfast821, label %fixslow822
fixfast821:
  %t3173 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3094, i64 8)
  %t3174 = extractvalue {i64, i1} %t3173, 0
  %t3175 = extractvalue {i64, i1} %t3173, 1
  br i1 %t3175, label %fixslow822, label %fixmerge823
fixslow822:
  %t3176 = call i64 @rt_add(i64 %t3094, i64 8)
  br label %fixmerge823
fixmerge823:
  %t3177 = phi i64 [ %t3174, %fixfast821 ], [ %t3176, %fixslow822 ]
  br label %merge817
merge817:
  %t3178 = phi i64 [ %t3169, %fixmerge820 ], [ %t3177, %fixmerge823 ]
  %t3179 = load i64, ptr @"scheme.base:rd-scan-digits"
  %t3180 = and i64 %t3179, -8
  %t3181 = inttoptr i64 %t3180 to ptr
  %t3182 = load i64, ptr %t3181
  %t3183 = inttoptr i64 %t3182 to ptr
  %t3184 = call fastcc i64%t3183(i64 %t3179, i64 3, i64 %a0, i64 %t3178, i64 %t3032, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3185 = or i64 %t3178, %t3184
  %t3186 = and i64 %t3185, 7
  %t3187 = icmp eq i64 %t3186, 0
  br i1 %t3187, label %fixfast824, label %fixslow825
fixfast824:
  %t3188 = icmp slt i64 %t3178, %t3184
  %t3189 = select i1 %t3188, i64 257, i64 1
  br label %fixmerge826
fixslow825:
  %t3190 = call i64 @rt_lt(i64 %t3178, i64 %t3184)
  br label %fixmerge826
fixmerge826:
  %t3191 = phi i64 [ %t3189, %fixfast824 ], [ %t3190, %fixslow825 ]
  %t3192 = icmp ne i64 %t3191, 1
  br i1 %t3192, label %then827, label %else828
then827:
  br label %merge829
else828:
  br label %merge829
merge829:
  %t3193 = phi i64 [ %t3184, %then827 ], [ -8, %else828 ]
  br label %merge802
else801:
  br label %merge802
merge802:
  %t3194 = phi i64 [ %t3193, %merge829 ], [ %t3094, %else801 ]
  %t3195 = or i64 -8, %t3194
  %t3196 = and i64 %t3195, 7
  %t3197 = icmp eq i64 %t3196, 0
  br i1 %t3197, label %fixfast830, label %fixslow831
fixfast830:
  %t3198 = icmp slt i64 -8, %t3194
  %t3199 = select i1 %t3198, i64 257, i64 1
  br label %fixmerge832
fixslow831:
  %t3200 = call i64 @rt_lt(i64 -8, i64 %t3194)
  br label %fixmerge832
fixmerge832:
  %t3201 = phi i64 [ %t3199, %fixfast830 ], [ %t3200, %fixslow831 ]
  %t3202 = icmp ne i64 %t3201, 1
  br i1 %t3202, label %then833, label %else834
then833:
  %t3203 = or i64 %t3194, %t3032
  %t3204 = and i64 %t3203, 7
  %t3205 = icmp eq i64 %t3204, 0
  br i1 %t3205, label %fixfast835, label %fixslow836
fixfast835:
  %t3206 = icmp eq i64 %t3194, %t3032
  %t3207 = select i1 %t3206, i64 257, i64 1
  br label %fixmerge837
fixslow836:
  %t3208 = call i64 @rt_num_eq(i64 %t3194, i64 %t3032)
  br label %fixmerge837
fixmerge837:
  %t3209 = phi i64 [ %t3207, %fixfast835 ], [ %t3208, %fixslow836 ]
  %t3210 = icmp ne i64 %t3209, 1
  br i1 %t3210, label %then838, label %else839
then838:
  %t3211 = icmp ne i64 %t3088, 1
  br i1 %t3211, label %then840, label %else841
then840:
  ret i64 %t3088
else841:
  %t3212 = or i64 %t3094, %t3194
  %t3213 = and i64 %t3212, 7
  %t3214 = icmp eq i64 %t3213, 0
  br i1 %t3214, label %fixfast842, label %fixslow843
fixfast842:
  %t3215 = icmp slt i64 %t3094, %t3194
  %t3216 = select i1 %t3215, i64 257, i64 1
  br label %fixmerge844
fixslow843:
  %t3217 = call i64 @rt_lt(i64 %t3094, i64 %t3194)
  br label %fixmerge844
fixmerge844:
  %t3218 = phi i64 [ %t3216, %fixfast842 ], [ %t3217, %fixslow843 ]
  ret i64 %t3218
else839:
  ret i64 1
else834:
  ret i64 1
else793:
  ret i64 1
else764:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rd-atom"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3223 = icmp eq i64 %argc, 3
  br i1 %t3223, label %argok846, label %arityerr845
arityerr845:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok846:
  %t3224 = load i64, ptr @"scheme.base:rd-token-end"
  %t3225 = and i64 %t3224, -8
  %t3226 = inttoptr i64 %t3225 to ptr
  %t3227 = load i64, ptr %t3226
  %t3228 = inttoptr i64 %t3227 to ptr
  %t3229 = call fastcc i64%t3228(i64 %t3224, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3230 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t3229)
  %t3231 = load i64, ptr @"scheme.base:rd-numeric?"
  %t3232 = and i64 %t3231, -8
  %t3233 = inttoptr i64 %t3232 to ptr
  %t3234 = load i64, ptr %t3233
  %t3235 = inttoptr i64 %t3234 to ptr
  %t3236 = call fastcc i64%t3235(i64 %t3231, i64 1, i64 %t3230, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3237 = icmp ne i64 %t3236, 1
  br i1 %t3237, label %then847, label %else848
then847:
  %t3238 = load i64, ptr @"scheme.base:rd-parse-int"
  %t3239 = and i64 %t3238, -8
  %t3240 = inttoptr i64 %t3239 to ptr
  %t3241 = load i64, ptr %t3240
  %t3242 = inttoptr i64 %t3241 to ptr
  %t3243 = call fastcc i64%t3242(i64 %t3238, i64 1, i64 %t3230, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge849
else848:
  %t3244 = load i64, ptr @"scheme.base:rd-flonum?"
  %t3245 = and i64 %t3244, -8
  %t3246 = inttoptr i64 %t3245 to ptr
  %t3247 = load i64, ptr %t3246
  %t3248 = inttoptr i64 %t3247 to ptr
  %t3249 = call fastcc i64%t3248(i64 %t3244, i64 1, i64 %t3230, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3250 = icmp ne i64 %t3249, 1
  br i1 %t3250, label %then850, label %else851
then850:
  %t3251 = call i64 @rt_string_to_flonum(i64 %t3230)
  br label %merge852
else851:
  %t3252 = call i64 @rt_string_to_symbol(i64 %t3230)
  br label %merge852
merge852:
  %t3253 = phi i64 [ %t3251, %then850 ], [ %t3252, %else851 ]
  br label %merge849
merge849:
  %t3254 = phi i64 [ %t3243, %then847 ], [ %t3253, %merge852 ]
  %t3255 = call i64 @rt_cons(i64 %t3254, i64 %t3229)
  ret i64 %t3255
}

define fastcc i64 @"scheme.base:code:rd-hex-digit"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3260 = icmp eq i64 %argc, 1
  br i1 %t3260, label %argok854, label %arityerr853
arityerr853:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok854:
  %t3261 = call i64 @rt_char_to_integer(i64 %a0)
  %t3262 = or i64 376, %t3261
  %t3263 = and i64 %t3262, 7
  %t3264 = icmp eq i64 %t3263, 0
  br i1 %t3264, label %fixfast855, label %fixslow856
fixfast855:
  %t3265 = icmp slt i64 376, %t3261
  %t3266 = select i1 %t3265, i64 257, i64 1
  br label %fixmerge857
fixslow856:
  %t3267 = call i64 @rt_lt(i64 376, i64 %t3261)
  br label %fixmerge857
fixmerge857:
  %t3268 = phi i64 [ %t3266, %fixfast855 ], [ %t3267, %fixslow856 ]
  %t3269 = icmp ne i64 %t3268, 1
  br i1 %t3269, label %then858, label %else859
then858:
  %t3270 = or i64 %t3261, 464
  %t3271 = and i64 %t3270, 7
  %t3272 = icmp eq i64 %t3271, 0
  br i1 %t3272, label %fixfast861, label %fixslow862
fixfast861:
  %t3273 = icmp slt i64 %t3261, 464
  %t3274 = select i1 %t3273, i64 257, i64 1
  br label %fixmerge863
fixslow862:
  %t3275 = call i64 @rt_lt(i64 %t3261, i64 464)
  br label %fixmerge863
fixmerge863:
  %t3276 = phi i64 [ %t3274, %fixfast861 ], [ %t3275, %fixslow862 ]
  br label %merge860
else859:
  br label %merge860
merge860:
  %t3277 = phi i64 [ %t3276, %fixmerge863 ], [ 1, %else859 ]
  %t3278 = icmp ne i64 %t3277, 1
  br i1 %t3278, label %then864, label %else865
then864:
  %t3279 = or i64 %t3261, 384
  %t3280 = and i64 %t3279, 7
  %t3281 = icmp eq i64 %t3280, 0
  br i1 %t3281, label %fixfast866, label %fixslow867
fixfast866:
  %t3282 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3261, i64 384)
  %t3283 = extractvalue {i64, i1} %t3282, 0
  %t3284 = extractvalue {i64, i1} %t3282, 1
  br i1 %t3284, label %fixslow867, label %fixmerge868
fixslow867:
  %t3285 = call i64 @rt_sub(i64 %t3261, i64 384)
  br label %fixmerge868
fixmerge868:
  %t3286 = phi i64 [ %t3283, %fixfast866 ], [ %t3285, %fixslow867 ]
  ret i64 %t3286
else865:
  %t3287 = or i64 768, %t3261
  %t3288 = and i64 %t3287, 7
  %t3289 = icmp eq i64 %t3288, 0
  br i1 %t3289, label %fixfast869, label %fixslow870
fixfast869:
  %t3290 = icmp slt i64 768, %t3261
  %t3291 = select i1 %t3290, i64 257, i64 1
  br label %fixmerge871
fixslow870:
  %t3292 = call i64 @rt_lt(i64 768, i64 %t3261)
  br label %fixmerge871
fixmerge871:
  %t3293 = phi i64 [ %t3291, %fixfast869 ], [ %t3292, %fixslow870 ]
  %t3294 = icmp ne i64 %t3293, 1
  br i1 %t3294, label %then872, label %else873
then872:
  %t3295 = or i64 %t3261, 824
  %t3296 = and i64 %t3295, 7
  %t3297 = icmp eq i64 %t3296, 0
  br i1 %t3297, label %fixfast875, label %fixslow876
fixfast875:
  %t3298 = icmp slt i64 %t3261, 824
  %t3299 = select i1 %t3298, i64 257, i64 1
  br label %fixmerge877
fixslow876:
  %t3300 = call i64 @rt_lt(i64 %t3261, i64 824)
  br label %fixmerge877
fixmerge877:
  %t3301 = phi i64 [ %t3299, %fixfast875 ], [ %t3300, %fixslow876 ]
  br label %merge874
else873:
  br label %merge874
merge874:
  %t3302 = phi i64 [ %t3301, %fixmerge877 ], [ 1, %else873 ]
  %t3303 = icmp ne i64 %t3302, 1
  br i1 %t3303, label %then878, label %else879
then878:
  %t3304 = or i64 %t3261, 696
  %t3305 = and i64 %t3304, 7
  %t3306 = icmp eq i64 %t3305, 0
  br i1 %t3306, label %fixfast880, label %fixslow881
fixfast880:
  %t3307 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3261, i64 696)
  %t3308 = extractvalue {i64, i1} %t3307, 0
  %t3309 = extractvalue {i64, i1} %t3307, 1
  br i1 %t3309, label %fixslow881, label %fixmerge882
fixslow881:
  %t3310 = call i64 @rt_sub(i64 %t3261, i64 696)
  br label %fixmerge882
fixmerge882:
  %t3311 = phi i64 [ %t3308, %fixfast880 ], [ %t3310, %fixslow881 ]
  ret i64 %t3311
else879:
  %t3312 = or i64 512, %t3261
  %t3313 = and i64 %t3312, 7
  %t3314 = icmp eq i64 %t3313, 0
  br i1 %t3314, label %fixfast883, label %fixslow884
fixfast883:
  %t3315 = icmp slt i64 512, %t3261
  %t3316 = select i1 %t3315, i64 257, i64 1
  br label %fixmerge885
fixslow884:
  %t3317 = call i64 @rt_lt(i64 512, i64 %t3261)
  br label %fixmerge885
fixmerge885:
  %t3318 = phi i64 [ %t3316, %fixfast883 ], [ %t3317, %fixslow884 ]
  %t3319 = icmp ne i64 %t3318, 1
  br i1 %t3319, label %then886, label %else887
then886:
  %t3320 = or i64 %t3261, 568
  %t3321 = and i64 %t3320, 7
  %t3322 = icmp eq i64 %t3321, 0
  br i1 %t3322, label %fixfast889, label %fixslow890
fixfast889:
  %t3323 = icmp slt i64 %t3261, 568
  %t3324 = select i1 %t3323, i64 257, i64 1
  br label %fixmerge891
fixslow890:
  %t3325 = call i64 @rt_lt(i64 %t3261, i64 568)
  br label %fixmerge891
fixmerge891:
  %t3326 = phi i64 [ %t3324, %fixfast889 ], [ %t3325, %fixslow890 ]
  br label %merge888
else887:
  br label %merge888
merge888:
  %t3327 = phi i64 [ %t3326, %fixmerge891 ], [ 1, %else887 ]
  %t3328 = icmp ne i64 %t3327, 1
  br i1 %t3328, label %then892, label %else893
then892:
  %t3329 = or i64 %t3261, 440
  %t3330 = and i64 %t3329, 7
  %t3331 = icmp eq i64 %t3330, 0
  br i1 %t3331, label %fixfast894, label %fixslow895
fixfast894:
  %t3332 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3261, i64 440)
  %t3333 = extractvalue {i64, i1} %t3332, 0
  %t3334 = extractvalue {i64, i1} %t3332, 1
  br i1 %t3334, label %fixslow895, label %fixmerge896
fixslow895:
  %t3335 = call i64 @rt_sub(i64 %t3261, i64 440)
  br label %fixmerge896
fixmerge896:
  %t3336 = phi i64 [ %t3333, %fixfast894 ], [ %t3335, %fixslow895 ]
  ret i64 %t3336
else893:
  ret i64 0
}

define fastcc i64 @"scheme.base:code:rd-hex"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3341 = icmp eq i64 %argc, 4
  br i1 %t3341, label %argok898, label %arityerr897
arityerr897:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok898:
  %t3342 = or i64 %a2, %a1
  %t3343 = and i64 %t3342, 7
  %t3344 = icmp eq i64 %t3343, 0
  br i1 %t3344, label %fixfast899, label %fixslow900
fixfast899:
  %t3345 = icmp slt i64 %a2, %a1
  %t3346 = select i1 %t3345, i64 257, i64 1
  br label %fixmerge901
fixslow900:
  %t3347 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge901
fixmerge901:
  %t3348 = phi i64 [ %t3346, %fixfast899 ], [ %t3347, %fixslow900 ]
  %t3349 = icmp ne i64 %t3348, 1
  br i1 %t3349, label %then902, label %else903
then902:
  %t3350 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3351 = call i64 @rt_char_to_integer(i64 %t3350)
  %t3352 = or i64 %t3351, 472
  %t3353 = and i64 %t3352, 7
  %t3354 = icmp eq i64 %t3353, 0
  br i1 %t3354, label %fixfast904, label %fixslow905
fixfast904:
  %t3355 = icmp eq i64 %t3351, 472
  %t3356 = select i1 %t3355, i64 257, i64 1
  br label %fixmerge906
fixslow905:
  %t3357 = call i64 @rt_num_eq(i64 %t3351, i64 472)
  br label %fixmerge906
fixmerge906:
  %t3358 = phi i64 [ %t3356, %fixfast904 ], [ %t3357, %fixslow905 ]
  %t3359 = icmp ne i64 %t3358, 1
  br i1 %t3359, label %then907, label %else908
then907:
  %t3360 = or i64 %a2, 8
  %t3361 = and i64 %t3360, 7
  %t3362 = icmp eq i64 %t3361, 0
  br i1 %t3362, label %fixfast909, label %fixslow910
fixfast909:
  %t3363 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3364 = extractvalue {i64, i1} %t3363, 0
  %t3365 = extractvalue {i64, i1} %t3363, 1
  br i1 %t3365, label %fixslow910, label %fixmerge911
fixslow910:
  %t3366 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge911
fixmerge911:
  %t3367 = phi i64 [ %t3364, %fixfast909 ], [ %t3366, %fixslow910 ]
  %t3368 = call i64 @rt_cons(i64 %a3, i64 %t3367)
  ret i64 %t3368
else908:
  %t3369 = or i64 %a2, 8
  %t3370 = and i64 %t3369, 7
  %t3371 = icmp eq i64 %t3370, 0
  br i1 %t3371, label %fixfast912, label %fixslow913
fixfast912:
  %t3372 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3373 = extractvalue {i64, i1} %t3372, 0
  %t3374 = extractvalue {i64, i1} %t3372, 1
  br i1 %t3374, label %fixslow913, label %fixmerge914
fixslow913:
  %t3375 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge914
fixmerge914:
  %t3376 = phi i64 [ %t3373, %fixfast912 ], [ %t3375, %fixslow913 ]
  %t3377 = or i64 %a3, 128
  %t3378 = and i64 %t3377, 7
  %t3379 = icmp eq i64 %t3378, 0
  br i1 %t3379, label %fixfast915, label %fixslow916
fixfast915:
  %t3380 = ashr i64 %a3, 3
  %t3381 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t3380, i64 128)
  %t3382 = extractvalue {i64, i1} %t3381, 0
  %t3383 = extractvalue {i64, i1} %t3381, 1
  br i1 %t3383, label %fixslow916, label %fixmerge917
fixslow916:
  %t3384 = call i64 @rt_mul(i64 %a3, i64 128)
  br label %fixmerge917
fixmerge917:
  %t3385 = phi i64 [ %t3382, %fixfast915 ], [ %t3384, %fixslow916 ]
  %t3386 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3387 = load i64, ptr @"scheme.base:rd-hex-digit"
  %t3388 = and i64 %t3387, -8
  %t3389 = inttoptr i64 %t3388 to ptr
  %t3390 = load i64, ptr %t3389
  %t3391 = inttoptr i64 %t3390 to ptr
  %t3392 = call fastcc i64%t3391(i64 %t3387, i64 1, i64 %t3386, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3393 = or i64 %t3385, %t3392
  %t3394 = and i64 %t3393, 7
  %t3395 = icmp eq i64 %t3394, 0
  br i1 %t3395, label %fixfast918, label %fixslow919
fixfast918:
  %t3396 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3385, i64 %t3392)
  %t3397 = extractvalue {i64, i1} %t3396, 0
  %t3398 = extractvalue {i64, i1} %t3396, 1
  br i1 %t3398, label %fixslow919, label %fixmerge920
fixslow919:
  %t3399 = call i64 @rt_add(i64 %t3385, i64 %t3392)
  br label %fixmerge920
fixmerge920:
  %t3400 = phi i64 [ %t3397, %fixfast918 ], [ %t3399, %fixslow919 ]
  %t3401 = load i64, ptr @"scheme.base:rd-hex"
  %t3402 = and i64 %t3401, -8
  %t3403 = inttoptr i64 %t3402 to ptr
  %t3404 = load i64, ptr %t3403
  %t3405 = inttoptr i64 %t3404 to ptr
  %t3406 = musttail call fastcc i64 %t3405(i64 %t3401, i64 4, i64 %a0, i64 %a1, i64 %t3376, i64 %t3400, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3406
else903:
  %t3407 = call i64 @rt_cons(i64 %a3, i64 %a2)
  ret i64 %t3407
}

define fastcc i64 @"scheme.base:code:rd-str-esc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3412 = icmp eq i64 %argc, 1
  br i1 %t3412, label %argok922, label %arityerr921
arityerr921:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok922:
  %t3413 = call i64 @rt_char_to_integer(i64 %a0)
  %t3414 = or i64 %t3413, 880
  %t3415 = and i64 %t3414, 7
  %t3416 = icmp eq i64 %t3415, 0
  br i1 %t3416, label %fixfast923, label %fixslow924
fixfast923:
  %t3417 = icmp eq i64 %t3413, 880
  %t3418 = select i1 %t3417, i64 257, i64 1
  br label %fixmerge925
fixslow924:
  %t3419 = call i64 @rt_num_eq(i64 %t3413, i64 880)
  br label %fixmerge925
fixmerge925:
  %t3420 = phi i64 [ %t3418, %fixfast923 ], [ %t3419, %fixslow924 ]
  %t3421 = icmp ne i64 %t3420, 1
  br i1 %t3421, label %then926, label %else927
then926:
  %t3422 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t3422
else927:
  %t3423 = or i64 %t3413, 928
  %t3424 = and i64 %t3423, 7
  %t3425 = icmp eq i64 %t3424, 0
  br i1 %t3425, label %fixfast928, label %fixslow929
fixfast928:
  %t3426 = icmp eq i64 %t3413, 928
  %t3427 = select i1 %t3426, i64 257, i64 1
  br label %fixmerge930
fixslow929:
  %t3428 = call i64 @rt_num_eq(i64 %t3413, i64 928)
  br label %fixmerge930
fixmerge930:
  %t3429 = phi i64 [ %t3427, %fixfast928 ], [ %t3428, %fixslow929 ]
  %t3430 = icmp ne i64 %t3429, 1
  br i1 %t3430, label %then931, label %else932
then931:
  %t3431 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t3431
else932:
  %t3432 = or i64 %t3413, 912
  %t3433 = and i64 %t3432, 7
  %t3434 = icmp eq i64 %t3433, 0
  br i1 %t3434, label %fixfast933, label %fixslow934
fixfast933:
  %t3435 = icmp eq i64 %t3413, 912
  %t3436 = select i1 %t3435, i64 257, i64 1
  br label %fixmerge935
fixslow934:
  %t3437 = call i64 @rt_num_eq(i64 %t3413, i64 912)
  br label %fixmerge935
fixmerge935:
  %t3438 = phi i64 [ %t3436, %fixfast933 ], [ %t3437, %fixslow934 ]
  %t3439 = icmp ne i64 %t3438, 1
  br i1 %t3439, label %then936, label %else937
then936:
  %t3440 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t3440
else937:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_824"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3445 = icmp eq i64 %argc, 2
  br i1 %t3445, label %argok939, label %arityerr938
arityerr938:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok939:
  %t3446 = and i64 %self, -8
  %t3447 = inttoptr i64 %t3446 to ptr
  %t3448 = getelementptr i64, ptr %t3447, i64 1
  %t3449 = load i64, ptr %t3448
  %t3450 = or i64 %a0, %t3449
  %t3451 = and i64 %t3450, 7
  %t3452 = icmp eq i64 %t3451, 0
  br i1 %t3452, label %fixfast940, label %fixslow941
fixfast940:
  %t3453 = icmp slt i64 %a0, %t3449
  %t3454 = select i1 %t3453, i64 257, i64 1
  br label %fixmerge942
fixslow941:
  %t3455 = call i64 @rt_lt(i64 %a0, i64 %t3449)
  br label %fixmerge942
fixmerge942:
  %t3456 = phi i64 [ %t3454, %fixfast940 ], [ %t3455, %fixslow941 ]
  %t3457 = icmp ne i64 %t3456, 1
  br i1 %t3457, label %then943, label %else944
then943:
  %t3458 = and i64 %self, -8
  %t3459 = inttoptr i64 %t3458 to ptr
  %t3460 = getelementptr i64, ptr %t3459, i64 2
  %t3461 = load i64, ptr %t3460
  %t3462 = call i64 @rt_string_ref(i64 %t3461, i64 %a0)
  %t3463 = call i64 @rt_char_to_integer(i64 %t3462)
  %t3464 = or i64 %t3463, 272
  %t3465 = and i64 %t3464, 7
  %t3466 = icmp eq i64 %t3465, 0
  br i1 %t3466, label %fixfast945, label %fixslow946
fixfast945:
  %t3467 = icmp eq i64 %t3463, 272
  %t3468 = select i1 %t3467, i64 257, i64 1
  br label %fixmerge947
fixslow946:
  %t3469 = call i64 @rt_num_eq(i64 %t3463, i64 272)
  br label %fixmerge947
fixmerge947:
  %t3470 = phi i64 [ %t3468, %fixfast945 ], [ %t3469, %fixslow946 ]
  %t3471 = icmp ne i64 %t3470, 1
  br i1 %t3471, label %then948, label %else949
then948:
  %t3472 = load i64, ptr @"scheme.base:reverse"
  %t3473 = and i64 %t3472, -8
  %t3474 = inttoptr i64 %t3473 to ptr
  %t3475 = load i64, ptr %t3474
  %t3476 = inttoptr i64 %t3475 to ptr
  %t3477 = call fastcc i64%t3476(i64 %t3472, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3478 = call i64 @rt_list_to_string(i64 %t3477)
  %t3479 = or i64 %a0, 8
  %t3480 = and i64 %t3479, 7
  %t3481 = icmp eq i64 %t3480, 0
  br i1 %t3481, label %fixfast950, label %fixslow951
fixfast950:
  %t3482 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3483 = extractvalue {i64, i1} %t3482, 0
  %t3484 = extractvalue {i64, i1} %t3482, 1
  br i1 %t3484, label %fixslow951, label %fixmerge952
fixslow951:
  %t3485 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge952
fixmerge952:
  %t3486 = phi i64 [ %t3483, %fixfast950 ], [ %t3485, %fixslow951 ]
  %t3487 = call i64 @rt_cons(i64 %t3478, i64 %t3486)
  ret i64 %t3487
else949:
  %t3488 = or i64 %t3463, 736
  %t3489 = and i64 %t3488, 7
  %t3490 = icmp eq i64 %t3489, 0
  br i1 %t3490, label %fixfast953, label %fixslow954
fixfast953:
  %t3491 = icmp eq i64 %t3463, 736
  %t3492 = select i1 %t3491, i64 257, i64 1
  br label %fixmerge955
fixslow954:
  %t3493 = call i64 @rt_num_eq(i64 %t3463, i64 736)
  br label %fixmerge955
fixmerge955:
  %t3494 = phi i64 [ %t3492, %fixfast953 ], [ %t3493, %fixslow954 ]
  %t3495 = icmp ne i64 %t3494, 1
  br i1 %t3495, label %then956, label %else957
then956:
  %t3496 = and i64 %self, -8
  %t3497 = inttoptr i64 %t3496 to ptr
  %t3498 = getelementptr i64, ptr %t3497, i64 2
  %t3499 = load i64, ptr %t3498
  %t3500 = or i64 %a0, 8
  %t3501 = and i64 %t3500, 7
  %t3502 = icmp eq i64 %t3501, 0
  br i1 %t3502, label %fixfast958, label %fixslow959
fixfast958:
  %t3503 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3504 = extractvalue {i64, i1} %t3503, 0
  %t3505 = extractvalue {i64, i1} %t3503, 1
  br i1 %t3505, label %fixslow959, label %fixmerge960
fixslow959:
  %t3506 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge960
fixmerge960:
  %t3507 = phi i64 [ %t3504, %fixfast958 ], [ %t3506, %fixslow959 ]
  %t3508 = call i64 @rt_string_ref(i64 %t3499, i64 %t3507)
  %t3509 = call i64 @rt_char_to_integer(i64 %t3508)
  %t3510 = or i64 %t3509, 960
  %t3511 = and i64 %t3510, 7
  %t3512 = icmp eq i64 %t3511, 0
  br i1 %t3512, label %fixfast961, label %fixslow962
fixfast961:
  %t3513 = icmp eq i64 %t3509, 960
  %t3514 = select i1 %t3513, i64 257, i64 1
  br label %fixmerge963
fixslow962:
  %t3515 = call i64 @rt_num_eq(i64 %t3509, i64 960)
  br label %fixmerge963
fixmerge963:
  %t3516 = phi i64 [ %t3514, %fixfast961 ], [ %t3515, %fixslow962 ]
  %t3517 = icmp ne i64 %t3516, 1
  br i1 %t3517, label %then964, label %else965
then964:
  %t3518 = and i64 %self, -8
  %t3519 = inttoptr i64 %t3518 to ptr
  %t3520 = getelementptr i64, ptr %t3519, i64 2
  %t3521 = load i64, ptr %t3520
  %t3522 = and i64 %self, -8
  %t3523 = inttoptr i64 %t3522 to ptr
  %t3524 = getelementptr i64, ptr %t3523, i64 1
  %t3525 = load i64, ptr %t3524
  %t3526 = or i64 %a0, 16
  %t3527 = and i64 %t3526, 7
  %t3528 = icmp eq i64 %t3527, 0
  br i1 %t3528, label %fixfast966, label %fixslow967
fixfast966:
  %t3529 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 16)
  %t3530 = extractvalue {i64, i1} %t3529, 0
  %t3531 = extractvalue {i64, i1} %t3529, 1
  br i1 %t3531, label %fixslow967, label %fixmerge968
fixslow967:
  %t3532 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge968
fixmerge968:
  %t3533 = phi i64 [ %t3530, %fixfast966 ], [ %t3532, %fixslow967 ]
  %t3534 = load i64, ptr @"scheme.base:rd-hex"
  %t3535 = and i64 %t3534, -8
  %t3536 = inttoptr i64 %t3535 to ptr
  %t3537 = load i64, ptr %t3536
  %t3538 = inttoptr i64 %t3537 to ptr
  %t3539 = call fastcc i64%t3538(i64 %t3534, i64 4, i64 %t3521, i64 %t3525, i64 %t3533, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3540 = call i64 @rt_cdr(i64 %t3539)
  %t3541 = call i64 @rt_car(i64 %t3539)
  %t3542 = call i64 @rt_integer_to_char(i64 %t3541)
  %t3543 = call i64 @rt_cons(i64 %t3542, i64 %a1)
  %t3544 = musttail call fastcc i64 @"scheme.base:code_824"(i64 %self, i64 2, i64 %t3540, i64 %t3543, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3544
else965:
  %t3545 = or i64 %a0, 16
  %t3546 = and i64 %t3545, 7
  %t3547 = icmp eq i64 %t3546, 0
  br i1 %t3547, label %fixfast969, label %fixslow970
fixfast969:
  %t3548 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 16)
  %t3549 = extractvalue {i64, i1} %t3548, 0
  %t3550 = extractvalue {i64, i1} %t3548, 1
  br i1 %t3550, label %fixslow970, label %fixmerge971
fixslow970:
  %t3551 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge971
fixmerge971:
  %t3552 = phi i64 [ %t3549, %fixfast969 ], [ %t3551, %fixslow970 ]
  %t3553 = load i64, ptr @"scheme.base:rd-str-esc"
  %t3554 = and i64 %t3553, -8
  %t3555 = inttoptr i64 %t3554 to ptr
  %t3556 = load i64, ptr %t3555
  %t3557 = inttoptr i64 %t3556 to ptr
  %t3558 = call fastcc i64%t3557(i64 %t3553, i64 1, i64 %t3508, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3559 = call i64 @rt_cons(i64 %t3558, i64 %a1)
  %t3560 = musttail call fastcc i64 @"scheme.base:code_824"(i64 %self, i64 2, i64 %t3552, i64 %t3559, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3560
else957:
  %t3561 = or i64 %a0, 8
  %t3562 = and i64 %t3561, 7
  %t3563 = icmp eq i64 %t3562, 0
  br i1 %t3563, label %fixfast972, label %fixslow973
fixfast972:
  %t3564 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3565 = extractvalue {i64, i1} %t3564, 0
  %t3566 = extractvalue {i64, i1} %t3564, 1
  br i1 %t3566, label %fixslow973, label %fixmerge974
fixslow973:
  %t3567 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge974
fixmerge974:
  %t3568 = phi i64 [ %t3565, %fixfast972 ], [ %t3567, %fixslow973 ]
  %t3569 = call i64 @rt_cons(i64 %t3462, i64 %a1)
  %t3570 = musttail call fastcc i64 @"scheme.base:code_824"(i64 %self, i64 2, i64 %t3568, i64 %t3569, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3570
else944:
  %t3571 = load i64, ptr @"scheme.base:reverse"
  %t3572 = and i64 %t3571, -8
  %t3573 = inttoptr i64 %t3572 to ptr
  %t3574 = load i64, ptr %t3573
  %t3575 = inttoptr i64 %t3574 to ptr
  %t3576 = call fastcc i64%t3575(i64 %t3571, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3577 = call i64 @rt_list_to_string(i64 %t3576)
  %t3578 = call i64 @rt_cons(i64 %t3577, i64 %a0)
  ret i64 %t3578
}

define fastcc i64 @"scheme.base:code:rd-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3579 = icmp eq i64 %argc, 3
  br i1 %t3579, label %argok976, label %arityerr975
arityerr975:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok976:
  %t3580 = call ptr @rt_alloc_words(i64 4)
  %t3581 = ptrtoint ptr %t3580 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_824" to i64), ptr %t3580
  %t3582 = or i64 %t3581, 4
  %t3583 = getelementptr i64, ptr %t3580, i64 1
  store i64 %a1, ptr %t3583
  %t3584 = getelementptr i64, ptr %t3580, i64 2
  store i64 %a0, ptr %t3584
  %t3585 = getelementptr i64, ptr %t3580, i64 3
  store i64 %t3582, ptr %t3585
  %t3586 = musttail call fastcc i64 @"scheme.base:code_824"(i64 %t3582, i64 2, i64 %a2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3586
}

define fastcc i64 @"scheme.base:code:rd-hash"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3591 = icmp eq i64 %argc, 3
  br i1 %t3591, label %argok978, label %arityerr977
arityerr977:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok978:
  %t3592 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3593 = call i64 @rt_char_to_integer(i64 %t3592)
  %t3594 = or i64 %t3593, 928
  %t3595 = and i64 %t3594, 7
  %t3596 = icmp eq i64 %t3595, 0
  br i1 %t3596, label %fixfast979, label %fixslow980
fixfast979:
  %t3597 = icmp eq i64 %t3593, 928
  %t3598 = select i1 %t3597, i64 257, i64 1
  br label %fixmerge981
fixslow980:
  %t3599 = call i64 @rt_num_eq(i64 %t3593, i64 928)
  br label %fixmerge981
fixmerge981:
  %t3600 = phi i64 [ %t3598, %fixfast979 ], [ %t3599, %fixslow980 ]
  %t3601 = icmp ne i64 %t3600, 1
  br i1 %t3601, label %then982, label %else983
then982:
  %t3602 = or i64 %a2, 8
  %t3603 = and i64 %t3602, 7
  %t3604 = icmp eq i64 %t3603, 0
  br i1 %t3604, label %fixfast984, label %fixslow985
fixfast984:
  %t3605 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3606 = extractvalue {i64, i1} %t3605, 0
  %t3607 = extractvalue {i64, i1} %t3605, 1
  br i1 %t3607, label %fixslow985, label %fixmerge986
fixslow985:
  %t3608 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge986
fixmerge986:
  %t3609 = phi i64 [ %t3606, %fixfast984 ], [ %t3608, %fixslow985 ]
  %t3610 = call i64 @rt_cons(i64 257, i64 %t3609)
  ret i64 %t3610
else983:
  %t3611 = or i64 %t3593, 816
  %t3612 = and i64 %t3611, 7
  %t3613 = icmp eq i64 %t3612, 0
  br i1 %t3613, label %fixfast987, label %fixslow988
fixfast987:
  %t3614 = icmp eq i64 %t3593, 816
  %t3615 = select i1 %t3614, i64 257, i64 1
  br label %fixmerge989
fixslow988:
  %t3616 = call i64 @rt_num_eq(i64 %t3593, i64 816)
  br label %fixmerge989
fixmerge989:
  %t3617 = phi i64 [ %t3615, %fixfast987 ], [ %t3616, %fixslow988 ]
  %t3618 = icmp ne i64 %t3617, 1
  br i1 %t3618, label %then990, label %else991
then990:
  %t3619 = or i64 %a2, 8
  %t3620 = and i64 %t3619, 7
  %t3621 = icmp eq i64 %t3620, 0
  br i1 %t3621, label %fixfast992, label %fixslow993
fixfast992:
  %t3622 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3623 = extractvalue {i64, i1} %t3622, 0
  %t3624 = extractvalue {i64, i1} %t3622, 1
  br i1 %t3624, label %fixslow993, label %fixmerge994
fixslow993:
  %t3625 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge994
fixmerge994:
  %t3626 = phi i64 [ %t3623, %fixfast992 ], [ %t3625, %fixslow993 ]
  %t3627 = call i64 @rt_cons(i64 1, i64 %t3626)
  ret i64 %t3627
else991:
  %t3628 = or i64 %t3593, 736
  %t3629 = and i64 %t3628, 7
  %t3630 = icmp eq i64 %t3629, 0
  br i1 %t3630, label %fixfast995, label %fixslow996
fixfast995:
  %t3631 = icmp eq i64 %t3593, 736
  %t3632 = select i1 %t3631, i64 257, i64 1
  br label %fixmerge997
fixslow996:
  %t3633 = call i64 @rt_num_eq(i64 %t3593, i64 736)
  br label %fixmerge997
fixmerge997:
  %t3634 = phi i64 [ %t3632, %fixfast995 ], [ %t3633, %fixslow996 ]
  %t3635 = icmp ne i64 %t3634, 1
  br i1 %t3635, label %then998, label %else999
then998:
  %t3636 = load i64, ptr @"scheme.base:rd-char"
  %t3637 = and i64 %t3636, -8
  %t3638 = inttoptr i64 %t3637 to ptr
  %t3639 = load i64, ptr %t3638
  %t3640 = inttoptr i64 %t3639 to ptr
  %t3641 = musttail call fastcc i64 %t3640(i64 %t3636, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3641
else999:
  %t3642 = or i64 %t3593, 320
  %t3643 = and i64 %t3642, 7
  %t3644 = icmp eq i64 %t3643, 0
  br i1 %t3644, label %fixfast1000, label %fixslow1001
fixfast1000:
  %t3645 = icmp eq i64 %t3593, 320
  %t3646 = select i1 %t3645, i64 257, i64 1
  br label %fixmerge1002
fixslow1001:
  %t3647 = call i64 @rt_num_eq(i64 %t3593, i64 320)
  br label %fixmerge1002
fixmerge1002:
  %t3648 = phi i64 [ %t3646, %fixfast1000 ], [ %t3647, %fixslow1001 ]
  %t3649 = icmp ne i64 %t3648, 1
  br i1 %t3649, label %then1003, label %else1004
then1003:
  %t3650 = or i64 %a2, 8
  %t3651 = and i64 %t3650, 7
  %t3652 = icmp eq i64 %t3651, 0
  br i1 %t3652, label %fixfast1005, label %fixslow1006
fixfast1005:
  %t3653 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3654 = extractvalue {i64, i1} %t3653, 0
  %t3655 = extractvalue {i64, i1} %t3653, 1
  br i1 %t3655, label %fixslow1006, label %fixmerge1007
fixslow1006:
  %t3656 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1007
fixmerge1007:
  %t3657 = phi i64 [ %t3654, %fixfast1005 ], [ %t3656, %fixslow1006 ]
  %t3658 = load i64, ptr @"scheme.base:rd-list"
  %t3659 = and i64 %t3658, -8
  %t3660 = inttoptr i64 %t3659 to ptr
  %t3661 = load i64, ptr %t3660
  %t3662 = inttoptr i64 %t3661 to ptr
  %t3663 = call fastcc i64%t3662(i64 %t3658, i64 4, i64 %a0, i64 %a1, i64 %t3657, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3664 = call i64 @rt_car(i64 %t3663)
  %t3665 = load i64, ptr @"scheme.base:list->vector"
  %t3666 = and i64 %t3665, -8
  %t3667 = inttoptr i64 %t3666 to ptr
  %t3668 = load i64, ptr %t3667
  %t3669 = inttoptr i64 %t3668 to ptr
  %t3670 = call fastcc i64%t3669(i64 %t3665, i64 1, i64 %t3664, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3671 = call i64 @rt_cdr(i64 %t3663)
  %t3672 = call i64 @rt_cons(i64 %t3670, i64 %t3671)
  ret i64 %t3672
else1004:
  %t3673 = or i64 %t3593, 936
  %t3674 = and i64 %t3673, 7
  %t3675 = icmp eq i64 %t3674, 0
  br i1 %t3675, label %fixfast1008, label %fixslow1009
fixfast1008:
  %t3676 = icmp eq i64 %t3593, 936
  %t3677 = select i1 %t3676, i64 257, i64 1
  br label %fixmerge1010
fixslow1009:
  %t3678 = call i64 @rt_num_eq(i64 %t3593, i64 936)
  br label %fixmerge1010
fixmerge1010:
  %t3679 = phi i64 [ %t3677, %fixfast1008 ], [ %t3678, %fixslow1009 ]
  %t3680 = icmp ne i64 %t3679, 1
  br i1 %t3680, label %then1011, label %else1012
then1011:
  %t3681 = or i64 %a2, 16
  %t3682 = and i64 %t3681, 7
  %t3683 = icmp eq i64 %t3682, 0
  br i1 %t3683, label %fixfast1014, label %fixslow1015
fixfast1014:
  %t3684 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t3685 = extractvalue {i64, i1} %t3684, 0
  %t3686 = extractvalue {i64, i1} %t3684, 1
  br i1 %t3686, label %fixslow1015, label %fixmerge1016
fixslow1015:
  %t3687 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge1016
fixmerge1016:
  %t3688 = phi i64 [ %t3685, %fixfast1014 ], [ %t3687, %fixslow1015 ]
  %t3689 = or i64 %t3688, %a1
  %t3690 = and i64 %t3689, 7
  %t3691 = icmp eq i64 %t3690, 0
  br i1 %t3691, label %fixfast1017, label %fixslow1018
fixfast1017:
  %t3692 = icmp slt i64 %t3688, %a1
  %t3693 = select i1 %t3692, i64 257, i64 1
  br label %fixmerge1019
fixslow1018:
  %t3694 = call i64 @rt_lt(i64 %t3688, i64 %a1)
  br label %fixmerge1019
fixmerge1019:
  %t3695 = phi i64 [ %t3693, %fixfast1017 ], [ %t3694, %fixslow1018 ]
  %t3696 = icmp ne i64 %t3695, 1
  br i1 %t3696, label %then1020, label %else1021
then1020:
  %t3697 = or i64 %a2, 8
  %t3698 = and i64 %t3697, 7
  %t3699 = icmp eq i64 %t3698, 0
  br i1 %t3699, label %fixfast1023, label %fixslow1024
fixfast1023:
  %t3700 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3701 = extractvalue {i64, i1} %t3700, 0
  %t3702 = extractvalue {i64, i1} %t3700, 1
  br i1 %t3702, label %fixslow1024, label %fixmerge1025
fixslow1024:
  %t3703 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1025
fixmerge1025:
  %t3704 = phi i64 [ %t3701, %fixfast1023 ], [ %t3703, %fixslow1024 ]
  %t3705 = call i64 @rt_string_ref(i64 %a0, i64 %t3704)
  %t3706 = call i64 @rt_char_to_integer(i64 %t3705)
  %t3707 = or i64 %t3706, 448
  %t3708 = and i64 %t3707, 7
  %t3709 = icmp eq i64 %t3708, 0
  br i1 %t3709, label %fixfast1026, label %fixslow1027
fixfast1026:
  %t3710 = icmp eq i64 %t3706, 448
  %t3711 = select i1 %t3710, i64 257, i64 1
  br label %fixmerge1028
fixslow1027:
  %t3712 = call i64 @rt_num_eq(i64 %t3706, i64 448)
  br label %fixmerge1028
fixmerge1028:
  %t3713 = phi i64 [ %t3711, %fixfast1026 ], [ %t3712, %fixslow1027 ]
  %t3714 = icmp ne i64 %t3713, 1
  br i1 %t3714, label %then1029, label %else1030
then1029:
  %t3715 = or i64 %a2, 16
  %t3716 = and i64 %t3715, 7
  %t3717 = icmp eq i64 %t3716, 0
  br i1 %t3717, label %fixfast1032, label %fixslow1033
fixfast1032:
  %t3718 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t3719 = extractvalue {i64, i1} %t3718, 0
  %t3720 = extractvalue {i64, i1} %t3718, 1
  br i1 %t3720, label %fixslow1033, label %fixmerge1034
fixslow1033:
  %t3721 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge1034
fixmerge1034:
  %t3722 = phi i64 [ %t3719, %fixfast1032 ], [ %t3721, %fixslow1033 ]
  %t3723 = call i64 @rt_string_ref(i64 %a0, i64 %t3722)
  %t3724 = call i64 @rt_char_to_integer(i64 %t3723)
  %t3725 = or i64 %t3724, 320
  %t3726 = and i64 %t3725, 7
  %t3727 = icmp eq i64 %t3726, 0
  br i1 %t3727, label %fixfast1035, label %fixslow1036
fixfast1035:
  %t3728 = icmp eq i64 %t3724, 320
  %t3729 = select i1 %t3728, i64 257, i64 1
  br label %fixmerge1037
fixslow1036:
  %t3730 = call i64 @rt_num_eq(i64 %t3724, i64 320)
  br label %fixmerge1037
fixmerge1037:
  %t3731 = phi i64 [ %t3729, %fixfast1035 ], [ %t3730, %fixslow1036 ]
  br label %merge1031
else1030:
  br label %merge1031
merge1031:
  %t3732 = phi i64 [ %t3731, %fixmerge1037 ], [ 1, %else1030 ]
  br label %merge1022
else1021:
  br label %merge1022
merge1022:
  %t3733 = phi i64 [ %t3732, %merge1031 ], [ 1, %else1021 ]
  br label %merge1013
else1012:
  br label %merge1013
merge1013:
  %t3734 = phi i64 [ %t3733, %merge1022 ], [ 1, %else1012 ]
  %t3735 = icmp ne i64 %t3734, 1
  br i1 %t3735, label %then1038, label %else1039
then1038:
  %t3736 = or i64 %a2, 24
  %t3737 = and i64 %t3736, 7
  %t3738 = icmp eq i64 %t3737, 0
  br i1 %t3738, label %fixfast1040, label %fixslow1041
fixfast1040:
  %t3739 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 24)
  %t3740 = extractvalue {i64, i1} %t3739, 0
  %t3741 = extractvalue {i64, i1} %t3739, 1
  br i1 %t3741, label %fixslow1041, label %fixmerge1042
fixslow1041:
  %t3742 = call i64 @rt_add(i64 %a2, i64 24)
  br label %fixmerge1042
fixmerge1042:
  %t3743 = phi i64 [ %t3740, %fixfast1040 ], [ %t3742, %fixslow1041 ]
  %t3744 = load i64, ptr @"scheme.base:rd-list"
  %t3745 = and i64 %t3744, -8
  %t3746 = inttoptr i64 %t3745 to ptr
  %t3747 = load i64, ptr %t3746
  %t3748 = inttoptr i64 %t3747 to ptr
  %t3749 = call fastcc i64%t3748(i64 %t3744, i64 4, i64 %a0, i64 %a1, i64 %t3743, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3750 = call i64 @rt_car(i64 %t3749)
  %t3751 = load i64, ptr @"scheme.base:list->bytevector"
  %t3752 = and i64 %t3751, -8
  %t3753 = inttoptr i64 %t3752 to ptr
  %t3754 = load i64, ptr %t3753
  %t3755 = inttoptr i64 %t3754 to ptr
  %t3756 = call fastcc i64%t3755(i64 %t3751, i64 1, i64 %t3750, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3757 = call i64 @rt_cdr(i64 %t3749)
  %t3758 = call i64 @rt_cons(i64 %t3756, i64 %t3757)
  ret i64 %t3758
else1039:
  %t3759 = load i64, ptr @"scheme.base:rd-token-end"
  %t3760 = and i64 %t3759, -8
  %t3761 = inttoptr i64 %t3760 to ptr
  %t3762 = load i64, ptr %t3761
  %t3763 = inttoptr i64 %t3762 to ptr
  %t3764 = call fastcc i64%t3763(i64 %t3759, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3765 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t3764)
  %t3766 = call i64 @rt_string_to_symbol(i64 %t3765)
  %t3767 = call i64 @rt_cons(i64 %t3766, i64 %t3764)
  ret i64 %t3767
}

define fastcc i64 @"scheme.base:code:rd-char-name"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3772 = icmp eq i64 %argc, 1
  br i1 %t3772, label %argok1044, label %arityerr1043
arityerr1043:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1044:
  %t3773 = call i64 @rt_make_string(ptr @.str.lit.6, i64 5)
  %t3774 = call i64 @rt_string_eq(i64 %a0, i64 %t3773)
  %t3775 = icmp ne i64 %t3774, 1
  br i1 %t3775, label %then1045, label %else1046
then1045:
  %t3776 = call i64 @rt_integer_to_char(i64 256)
  ret i64 %t3776
else1046:
  %t3777 = call i64 @rt_make_string(ptr @.str.lit.7, i64 7)
  %t3778 = call i64 @rt_string_eq(i64 %a0, i64 %t3777)
  %t3779 = icmp ne i64 %t3778, 1
  br i1 %t3779, label %then1047, label %else1048
then1047:
  %t3780 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t3780
else1048:
  %t3781 = call i64 @rt_make_string(ptr @.str.lit.8, i64 3)
  %t3782 = call i64 @rt_string_eq(i64 %a0, i64 %t3781)
  %t3783 = icmp ne i64 %t3782, 1
  br i1 %t3783, label %then1049, label %else1050
then1049:
  %t3784 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t3784
else1050:
  %t3785 = call i64 @rt_make_string(ptr @.str.lit.9, i64 6)
  %t3786 = call i64 @rt_string_eq(i64 %a0, i64 %t3785)
  %t3787 = icmp ne i64 %t3786, 1
  br i1 %t3787, label %then1051, label %else1052
then1051:
  %t3788 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t3788
else1052:
  %t3789 = call i64 @rt_make_string(ptr @.str.lit.10, i64 3)
  %t3790 = call i64 @rt_string_eq(i64 %a0, i64 %t3789)
  %t3791 = icmp ne i64 %t3790, 1
  br i1 %t3791, label %then1053, label %else1054
then1053:
  %t3792 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t3792
else1054:
  %t3793 = call i64 @rt_make_string(ptr @.str.lit.11, i64 4)
  %t3794 = call i64 @rt_string_eq(i64 %a0, i64 %t3793)
  %t3795 = icmp ne i64 %t3794, 1
  br i1 %t3795, label %then1055, label %else1056
then1055:
  %t3796 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t3796
else1056:
  %t3797 = call i64 @rt_make_string(ptr @.str.lit.12, i64 6)
  %t3798 = call i64 @rt_string_eq(i64 %a0, i64 %t3797)
  %t3799 = icmp ne i64 %t3798, 1
  br i1 %t3799, label %then1057, label %else1058
then1057:
  %t3800 = call i64 @rt_integer_to_char(i64 1016)
  ret i64 %t3800
else1058:
  %t3801 = call i64 @rt_make_string(ptr @.str.lit.13, i64 7)
  %t3802 = call i64 @rt_string_eq(i64 %a0, i64 %t3801)
  %t3803 = icmp ne i64 %t3802, 1
  br i1 %t3803, label %then1059, label %else1060
then1059:
  %t3804 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t3804
else1060:
  %t3805 = call i64 @rt_make_string(ptr @.str.lit.14, i64 3)
  %t3806 = call i64 @rt_string_eq(i64 %a0, i64 %t3805)
  %t3807 = icmp ne i64 %t3806, 1
  br i1 %t3807, label %then1061, label %else1062
then1061:
  %t3808 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t3808
else1062:
  %t3809 = call i64 @rt_string_ref(i64 %a0, i64 0)
  ret i64 %t3809
}

define fastcc i64 @"scheme.base:code:rd-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3814 = icmp eq i64 %argc, 3
  br i1 %t3814, label %argok1064, label %arityerr1063
arityerr1063:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1064:
  %t3815 = or i64 %a2, 8
  %t3816 = and i64 %t3815, 7
  %t3817 = icmp eq i64 %t3816, 0
  br i1 %t3817, label %fixfast1065, label %fixslow1066
fixfast1065:
  %t3818 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3819 = extractvalue {i64, i1} %t3818, 0
  %t3820 = extractvalue {i64, i1} %t3818, 1
  br i1 %t3820, label %fixslow1066, label %fixmerge1067
fixslow1066:
  %t3821 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1067
fixmerge1067:
  %t3822 = phi i64 [ %t3819, %fixfast1065 ], [ %t3821, %fixslow1066 ]
  %t3823 = or i64 %t3822, 8
  %t3824 = and i64 %t3823, 7
  %t3825 = icmp eq i64 %t3824, 0
  br i1 %t3825, label %fixfast1068, label %fixslow1069
fixfast1068:
  %t3826 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3822, i64 8)
  %t3827 = extractvalue {i64, i1} %t3826, 0
  %t3828 = extractvalue {i64, i1} %t3826, 1
  br i1 %t3828, label %fixslow1069, label %fixmerge1070
fixslow1069:
  %t3829 = call i64 @rt_add(i64 %t3822, i64 8)
  br label %fixmerge1070
fixmerge1070:
  %t3830 = phi i64 [ %t3827, %fixfast1068 ], [ %t3829, %fixslow1069 ]
  %t3831 = load i64, ptr @"scheme.base:rd-token-end"
  %t3832 = and i64 %t3831, -8
  %t3833 = inttoptr i64 %t3832 to ptr
  %t3834 = load i64, ptr %t3833
  %t3835 = inttoptr i64 %t3834 to ptr
  %t3836 = call fastcc i64%t3835(i64 %t3831, i64 3, i64 %a0, i64 %a1, i64 %t3830, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3837 = call i64 @rt_substring(i64 %a0, i64 %t3822, i64 %t3836)
  %t3838 = call i64 @rt_string_length(i64 %t3837)
  %t3839 = or i64 %t3838, 8
  %t3840 = and i64 %t3839, 7
  %t3841 = icmp eq i64 %t3840, 0
  br i1 %t3841, label %fixfast1071, label %fixslow1072
fixfast1071:
  %t3842 = icmp eq i64 %t3838, 8
  %t3843 = select i1 %t3842, i64 257, i64 1
  br label %fixmerge1073
fixslow1072:
  %t3844 = call i64 @rt_num_eq(i64 %t3838, i64 8)
  br label %fixmerge1073
fixmerge1073:
  %t3845 = phi i64 [ %t3843, %fixfast1071 ], [ %t3844, %fixslow1072 ]
  %t3846 = icmp ne i64 %t3845, 1
  br i1 %t3846, label %then1074, label %else1075
then1074:
  %t3847 = call i64 @rt_string_ref(i64 %a0, i64 %t3822)
  %t3848 = call i64 @rt_cons(i64 %t3847, i64 %t3836)
  ret i64 %t3848
else1075:
  %t3849 = load i64, ptr @"scheme.base:rd-char-name"
  %t3850 = and i64 %t3849, -8
  %t3851 = inttoptr i64 %t3850 to ptr
  %t3852 = load i64, ptr %t3851
  %t3853 = inttoptr i64 %t3852 to ptr
  %t3854 = call fastcc i64%t3853(i64 %t3849, i64 1, i64 %t3837, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3855 = call i64 @rt_cons(i64 %t3854, i64 %t3836)
  ret i64 %t3855
}

define fastcc i64 @"scheme.base:code:rd-quote"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3860 = icmp eq i64 %argc, 3
  br i1 %t3860, label %argok1077, label %arityerr1076
arityerr1076:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1077:
  %t3861 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3862 = and i64 %t3861, -8
  %t3863 = inttoptr i64 %t3862 to ptr
  %t3864 = load i64, ptr %t3863
  %t3865 = inttoptr i64 %t3864 to ptr
  %t3866 = call fastcc i64%t3865(i64 %t3861, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3867 = load i64, ptr @"scheme.base:rd-datum"
  %t3868 = and i64 %t3867, -8
  %t3869 = inttoptr i64 %t3868 to ptr
  %t3870 = load i64, ptr %t3869
  %t3871 = inttoptr i64 %t3870 to ptr
  %t3872 = call fastcc i64%t3871(i64 %t3867, i64 3, i64 %a0, i64 %a1, i64 %t3866, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3873 = call i64 @rt_intern(ptr @.str.sym.15)
  %t3874 = call i64 @rt_car(i64 %t3872)
  %t3875 = load i64, ptr @"scheme.base:list"
  %t3876 = and i64 %t3875, -8
  %t3877 = inttoptr i64 %t3876 to ptr
  %t3878 = load i64, ptr %t3877
  %t3879 = inttoptr i64 %t3878 to ptr
  %t3880 = call fastcc i64%t3879(i64 %t3875, i64 2, i64 %t3873, i64 %t3874, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3881 = call i64 @rt_cdr(i64 %t3872)
  %t3882 = call i64 @rt_cons(i64 %t3880, i64 %t3881)
  ret i64 %t3882
}

define fastcc i64 @"scheme.base:code:rd-quasi"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3887 = icmp eq i64 %argc, 3
  br i1 %t3887, label %argok1079, label %arityerr1078
arityerr1078:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1079:
  %t3888 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3889 = and i64 %t3888, -8
  %t3890 = inttoptr i64 %t3889 to ptr
  %t3891 = load i64, ptr %t3890
  %t3892 = inttoptr i64 %t3891 to ptr
  %t3893 = call fastcc i64%t3892(i64 %t3888, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3894 = load i64, ptr @"scheme.base:rd-datum"
  %t3895 = and i64 %t3894, -8
  %t3896 = inttoptr i64 %t3895 to ptr
  %t3897 = load i64, ptr %t3896
  %t3898 = inttoptr i64 %t3897 to ptr
  %t3899 = call fastcc i64%t3898(i64 %t3894, i64 3, i64 %a0, i64 %a1, i64 %t3893, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3900 = call i64 @rt_intern(ptr @.str.sym.16)
  %t3901 = call i64 @rt_car(i64 %t3899)
  %t3902 = load i64, ptr @"scheme.base:list"
  %t3903 = and i64 %t3902, -8
  %t3904 = inttoptr i64 %t3903 to ptr
  %t3905 = load i64, ptr %t3904
  %t3906 = inttoptr i64 %t3905 to ptr
  %t3907 = call fastcc i64%t3906(i64 %t3902, i64 2, i64 %t3900, i64 %t3901, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3908 = call i64 @rt_cdr(i64 %t3899)
  %t3909 = call i64 @rt_cons(i64 %t3907, i64 %t3908)
  ret i64 %t3909
}

define fastcc i64 @"scheme.base:code:rd-unquote"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3914 = icmp eq i64 %argc, 3
  br i1 %t3914, label %argok1081, label %arityerr1080
arityerr1080:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1081:
  %t3915 = or i64 %a2, %a1
  %t3916 = and i64 %t3915, 7
  %t3917 = icmp eq i64 %t3916, 0
  br i1 %t3917, label %fixfast1082, label %fixslow1083
fixfast1082:
  %t3918 = icmp slt i64 %a2, %a1
  %t3919 = select i1 %t3918, i64 257, i64 1
  br label %fixmerge1084
fixslow1083:
  %t3920 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge1084
fixmerge1084:
  %t3921 = phi i64 [ %t3919, %fixfast1082 ], [ %t3920, %fixslow1083 ]
  %t3922 = icmp ne i64 %t3921, 1
  br i1 %t3922, label %then1085, label %else1086
then1085:
  %t3923 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3924 = call i64 @rt_char_to_integer(i64 %t3923)
  %t3925 = or i64 %t3924, 512
  %t3926 = and i64 %t3925, 7
  %t3927 = icmp eq i64 %t3926, 0
  br i1 %t3927, label %fixfast1088, label %fixslow1089
fixfast1088:
  %t3928 = icmp eq i64 %t3924, 512
  %t3929 = select i1 %t3928, i64 257, i64 1
  br label %fixmerge1090
fixslow1089:
  %t3930 = call i64 @rt_num_eq(i64 %t3924, i64 512)
  br label %fixmerge1090
fixmerge1090:
  %t3931 = phi i64 [ %t3929, %fixfast1088 ], [ %t3930, %fixslow1089 ]
  br label %merge1087
else1086:
  br label %merge1087
merge1087:
  %t3932 = phi i64 [ %t3931, %fixmerge1090 ], [ 1, %else1086 ]
  %t3933 = icmp ne i64 %t3932, 1
  br i1 %t3933, label %then1091, label %else1092
then1091:
  %t3934 = or i64 %a2, 8
  %t3935 = and i64 %t3934, 7
  %t3936 = icmp eq i64 %t3935, 0
  br i1 %t3936, label %fixfast1093, label %fixslow1094
fixfast1093:
  %t3937 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3938 = extractvalue {i64, i1} %t3937, 0
  %t3939 = extractvalue {i64, i1} %t3937, 1
  br i1 %t3939, label %fixslow1094, label %fixmerge1095
fixslow1094:
  %t3940 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1095
fixmerge1095:
  %t3941 = phi i64 [ %t3938, %fixfast1093 ], [ %t3940, %fixslow1094 ]
  %t3942 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3943 = and i64 %t3942, -8
  %t3944 = inttoptr i64 %t3943 to ptr
  %t3945 = load i64, ptr %t3944
  %t3946 = inttoptr i64 %t3945 to ptr
  %t3947 = call fastcc i64%t3946(i64 %t3942, i64 3, i64 %a0, i64 %a1, i64 %t3941, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3948 = load i64, ptr @"scheme.base:rd-datum"
  %t3949 = and i64 %t3948, -8
  %t3950 = inttoptr i64 %t3949 to ptr
  %t3951 = load i64, ptr %t3950
  %t3952 = inttoptr i64 %t3951 to ptr
  %t3953 = call fastcc i64%t3952(i64 %t3948, i64 3, i64 %a0, i64 %a1, i64 %t3947, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3954 = call i64 @rt_intern(ptr @.str.sym.17)
  %t3955 = call i64 @rt_car(i64 %t3953)
  %t3956 = load i64, ptr @"scheme.base:list"
  %t3957 = and i64 %t3956, -8
  %t3958 = inttoptr i64 %t3957 to ptr
  %t3959 = load i64, ptr %t3958
  %t3960 = inttoptr i64 %t3959 to ptr
  %t3961 = call fastcc i64%t3960(i64 %t3956, i64 2, i64 %t3954, i64 %t3955, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3962 = call i64 @rt_cdr(i64 %t3953)
  %t3963 = call i64 @rt_cons(i64 %t3961, i64 %t3962)
  ret i64 %t3963
else1092:
  %t3964 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3965 = and i64 %t3964, -8
  %t3966 = inttoptr i64 %t3965 to ptr
  %t3967 = load i64, ptr %t3966
  %t3968 = inttoptr i64 %t3967 to ptr
  %t3969 = call fastcc i64%t3968(i64 %t3964, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3970 = load i64, ptr @"scheme.base:rd-datum"
  %t3971 = and i64 %t3970, -8
  %t3972 = inttoptr i64 %t3971 to ptr
  %t3973 = load i64, ptr %t3972
  %t3974 = inttoptr i64 %t3973 to ptr
  %t3975 = call fastcc i64%t3974(i64 %t3970, i64 3, i64 %a0, i64 %a1, i64 %t3969, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3976 = call i64 @rt_intern(ptr @.str.sym.18)
  %t3977 = call i64 @rt_car(i64 %t3975)
  %t3978 = load i64, ptr @"scheme.base:list"
  %t3979 = and i64 %t3978, -8
  %t3980 = inttoptr i64 %t3979 to ptr
  %t3981 = load i64, ptr %t3980
  %t3982 = inttoptr i64 %t3981 to ptr
  %t3983 = call fastcc i64%t3982(i64 %t3978, i64 2, i64 %t3976, i64 %t3977, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3984 = call i64 @rt_cdr(i64 %t3975)
  %t3985 = call i64 @rt_cons(i64 %t3983, i64 %t3984)
  ret i64 %t3985
}

define fastcc i64 @"scheme.base:code:rd-dot?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3990 = icmp eq i64 %argc, 3
  br i1 %t3990, label %argok1097, label %arityerr1096
arityerr1096:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1097:
  %t3991 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3992 = call i64 @rt_char_to_integer(i64 %t3991)
  %t3993 = or i64 %t3992, 368
  %t3994 = and i64 %t3993, 7
  %t3995 = icmp eq i64 %t3994, 0
  br i1 %t3995, label %fixfast1098, label %fixslow1099
fixfast1098:
  %t3996 = icmp eq i64 %t3992, 368
  %t3997 = select i1 %t3996, i64 257, i64 1
  br label %fixmerge1100
fixslow1099:
  %t3998 = call i64 @rt_num_eq(i64 %t3992, i64 368)
  br label %fixmerge1100
fixmerge1100:
  %t3999 = phi i64 [ %t3997, %fixfast1098 ], [ %t3998, %fixslow1099 ]
  %t4000 = icmp ne i64 %t3999, 1
  br i1 %t4000, label %then1101, label %else1102
then1101:
  %t4001 = or i64 %a2, 8
  %t4002 = and i64 %t4001, 7
  %t4003 = icmp eq i64 %t4002, 0
  br i1 %t4003, label %fixfast1103, label %fixslow1104
fixfast1103:
  %t4004 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4005 = extractvalue {i64, i1} %t4004, 0
  %t4006 = extractvalue {i64, i1} %t4004, 1
  br i1 %t4006, label %fixslow1104, label %fixmerge1105
fixslow1104:
  %t4007 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1105
fixmerge1105:
  %t4008 = phi i64 [ %t4005, %fixfast1103 ], [ %t4007, %fixslow1104 ]
  %t4009 = load i64, ptr @"scheme.base:rd-token-end"
  %t4010 = and i64 %t4009, -8
  %t4011 = inttoptr i64 %t4010 to ptr
  %t4012 = load i64, ptr %t4011
  %t4013 = inttoptr i64 %t4012 to ptr
  %t4014 = call fastcc i64%t4013(i64 %t4009, i64 3, i64 %a0, i64 %a1, i64 %t4008, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4015 = or i64 %a2, 8
  %t4016 = and i64 %t4015, 7
  %t4017 = icmp eq i64 %t4016, 0
  br i1 %t4017, label %fixfast1106, label %fixslow1107
fixfast1106:
  %t4018 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4019 = extractvalue {i64, i1} %t4018, 0
  %t4020 = extractvalue {i64, i1} %t4018, 1
  br i1 %t4020, label %fixslow1107, label %fixmerge1108
fixslow1107:
  %t4021 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1108
fixmerge1108:
  %t4022 = phi i64 [ %t4019, %fixfast1106 ], [ %t4021, %fixslow1107 ]
  %t4023 = or i64 %t4014, %t4022
  %t4024 = and i64 %t4023, 7
  %t4025 = icmp eq i64 %t4024, 0
  br i1 %t4025, label %fixfast1109, label %fixslow1110
fixfast1109:
  %t4026 = icmp eq i64 %t4014, %t4022
  %t4027 = select i1 %t4026, i64 257, i64 1
  br label %fixmerge1111
fixslow1110:
  %t4028 = call i64 @rt_num_eq(i64 %t4014, i64 %t4022)
  br label %fixmerge1111
fixmerge1111:
  %t4029 = phi i64 [ %t4027, %fixfast1109 ], [ %t4028, %fixslow1110 ]
  ret i64 %t4029
else1102:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rd-append-reverse"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4034 = icmp eq i64 %argc, 2
  br i1 %t4034, label %argok1113, label %arityerr1112
arityerr1112:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1113:
  %t4035 = call i64 @rt_null_p(i64 %a0)
  %t4036 = icmp ne i64 %t4035, 1
  br i1 %t4036, label %then1114, label %else1115
then1114:
  ret i64 %a1
else1115:
  %t4037 = call i64 @rt_cdr(i64 %a0)
  %t4038 = call i64 @rt_car(i64 %a0)
  %t4039 = call i64 @rt_cons(i64 %t4038, i64 %a1)
  %t4040 = load i64, ptr @"scheme.base:rd-append-reverse"
  %t4041 = and i64 %t4040, -8
  %t4042 = inttoptr i64 %t4041 to ptr
  %t4043 = load i64, ptr %t4042
  %t4044 = inttoptr i64 %t4043 to ptr
  %t4045 = musttail call fastcc i64 %t4044(i64 %t4040, i64 2, i64 %t4037, i64 %t4039, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4045
}

define fastcc i64 @"scheme.base:code:rd-list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4050 = icmp eq i64 %argc, 4
  br i1 %t4050, label %argok1117, label %arityerr1116
arityerr1116:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1117:
  %t4051 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t4052 = and i64 %t4051, -8
  %t4053 = inttoptr i64 %t4052 to ptr
  %t4054 = load i64, ptr %t4053
  %t4055 = inttoptr i64 %t4054 to ptr
  %t4056 = call fastcc i64%t4055(i64 %t4051, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4057 = or i64 %t4056, %a1
  %t4058 = and i64 %t4057, 7
  %t4059 = icmp eq i64 %t4058, 0
  br i1 %t4059, label %fixfast1118, label %fixslow1119
fixfast1118:
  %t4060 = icmp slt i64 %t4056, %a1
  %t4061 = select i1 %t4060, i64 257, i64 1
  br label %fixmerge1120
fixslow1119:
  %t4062 = call i64 @rt_lt(i64 %t4056, i64 %a1)
  br label %fixmerge1120
fixmerge1120:
  %t4063 = phi i64 [ %t4061, %fixfast1118 ], [ %t4062, %fixslow1119 ]
  %t4064 = icmp ne i64 %t4063, 1
  br i1 %t4064, label %then1121, label %else1122
then1121:
  %t4065 = call i64 @rt_string_ref(i64 %a0, i64 %t4056)
  %t4066 = call i64 @rt_char_to_integer(i64 %t4065)
  %t4067 = or i64 %t4066, 328
  %t4068 = and i64 %t4067, 7
  %t4069 = icmp eq i64 %t4068, 0
  br i1 %t4069, label %fixfast1123, label %fixslow1124
fixfast1123:
  %t4070 = icmp eq i64 %t4066, 328
  %t4071 = select i1 %t4070, i64 257, i64 1
  br label %fixmerge1125
fixslow1124:
  %t4072 = call i64 @rt_num_eq(i64 %t4066, i64 328)
  br label %fixmerge1125
fixmerge1125:
  %t4073 = phi i64 [ %t4071, %fixfast1123 ], [ %t4072, %fixslow1124 ]
  %t4074 = icmp ne i64 %t4073, 1
  br i1 %t4074, label %then1126, label %else1127
then1126:
  br label %merge1128
else1127:
  %t4075 = or i64 %t4066, 744
  %t4076 = and i64 %t4075, 7
  %t4077 = icmp eq i64 %t4076, 0
  br i1 %t4077, label %fixfast1129, label %fixslow1130
fixfast1129:
  %t4078 = icmp eq i64 %t4066, 744
  %t4079 = select i1 %t4078, i64 257, i64 1
  br label %fixmerge1131
fixslow1130:
  %t4080 = call i64 @rt_num_eq(i64 %t4066, i64 744)
  br label %fixmerge1131
fixmerge1131:
  %t4081 = phi i64 [ %t4079, %fixfast1129 ], [ %t4080, %fixslow1130 ]
  br label %merge1128
merge1128:
  %t4082 = phi i64 [ %t4073, %then1126 ], [ %t4081, %fixmerge1131 ]
  %t4083 = icmp ne i64 %t4082, 1
  br i1 %t4083, label %then1132, label %else1133
then1132:
  %t4084 = load i64, ptr @"scheme.base:reverse"
  %t4085 = and i64 %t4084, -8
  %t4086 = inttoptr i64 %t4085 to ptr
  %t4087 = load i64, ptr %t4086
  %t4088 = inttoptr i64 %t4087 to ptr
  %t4089 = call fastcc i64%t4088(i64 %t4084, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4090 = or i64 %t4056, 8
  %t4091 = and i64 %t4090, 7
  %t4092 = icmp eq i64 %t4091, 0
  br i1 %t4092, label %fixfast1134, label %fixslow1135
fixfast1134:
  %t4093 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4056, i64 8)
  %t4094 = extractvalue {i64, i1} %t4093, 0
  %t4095 = extractvalue {i64, i1} %t4093, 1
  br i1 %t4095, label %fixslow1135, label %fixmerge1136
fixslow1135:
  %t4096 = call i64 @rt_add(i64 %t4056, i64 8)
  br label %fixmerge1136
fixmerge1136:
  %t4097 = phi i64 [ %t4094, %fixfast1134 ], [ %t4096, %fixslow1135 ]
  %t4098 = call i64 @rt_cons(i64 %t4089, i64 %t4097)
  ret i64 %t4098
else1133:
  %t4099 = load i64, ptr @"scheme.base:rd-dot?"
  %t4100 = and i64 %t4099, -8
  %t4101 = inttoptr i64 %t4100 to ptr
  %t4102 = load i64, ptr %t4101
  %t4103 = inttoptr i64 %t4102 to ptr
  %t4104 = call fastcc i64%t4103(i64 %t4099, i64 3, i64 %a0, i64 %a1, i64 %t4056, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4105 = icmp ne i64 %t4104, 1
  br i1 %t4105, label %then1137, label %else1138
then1137:
  %t4106 = or i64 %t4056, 8
  %t4107 = and i64 %t4106, 7
  %t4108 = icmp eq i64 %t4107, 0
  br i1 %t4108, label %fixfast1139, label %fixslow1140
fixfast1139:
  %t4109 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4056, i64 8)
  %t4110 = extractvalue {i64, i1} %t4109, 0
  %t4111 = extractvalue {i64, i1} %t4109, 1
  br i1 %t4111, label %fixslow1140, label %fixmerge1141
fixslow1140:
  %t4112 = call i64 @rt_add(i64 %t4056, i64 8)
  br label %fixmerge1141
fixmerge1141:
  %t4113 = phi i64 [ %t4110, %fixfast1139 ], [ %t4112, %fixslow1140 ]
  %t4114 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t4115 = and i64 %t4114, -8
  %t4116 = inttoptr i64 %t4115 to ptr
  %t4117 = load i64, ptr %t4116
  %t4118 = inttoptr i64 %t4117 to ptr
  %t4119 = call fastcc i64%t4118(i64 %t4114, i64 3, i64 %a0, i64 %a1, i64 %t4113, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4120 = load i64, ptr @"scheme.base:rd-datum"
  %t4121 = and i64 %t4120, -8
  %t4122 = inttoptr i64 %t4121 to ptr
  %t4123 = load i64, ptr %t4122
  %t4124 = inttoptr i64 %t4123 to ptr
  %t4125 = call fastcc i64%t4124(i64 %t4120, i64 3, i64 %a0, i64 %a1, i64 %t4119, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4126 = call i64 @rt_cdr(i64 %t4125)
  %t4127 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t4128 = and i64 %t4127, -8
  %t4129 = inttoptr i64 %t4128 to ptr
  %t4130 = load i64, ptr %t4129
  %t4131 = inttoptr i64 %t4130 to ptr
  %t4132 = call fastcc i64%t4131(i64 %t4127, i64 3, i64 %a0, i64 %a1, i64 %t4126, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4133 = call i64 @rt_car(i64 %t4125)
  %t4134 = load i64, ptr @"scheme.base:rd-append-reverse"
  %t4135 = and i64 %t4134, -8
  %t4136 = inttoptr i64 %t4135 to ptr
  %t4137 = load i64, ptr %t4136
  %t4138 = inttoptr i64 %t4137 to ptr
  %t4139 = call fastcc i64%t4138(i64 %t4134, i64 2, i64 %a3, i64 %t4133, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4140 = or i64 %t4132, 8
  %t4141 = and i64 %t4140, 7
  %t4142 = icmp eq i64 %t4141, 0
  br i1 %t4142, label %fixfast1142, label %fixslow1143
fixfast1142:
  %t4143 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4132, i64 8)
  %t4144 = extractvalue {i64, i1} %t4143, 0
  %t4145 = extractvalue {i64, i1} %t4143, 1
  br i1 %t4145, label %fixslow1143, label %fixmerge1144
fixslow1143:
  %t4146 = call i64 @rt_add(i64 %t4132, i64 8)
  br label %fixmerge1144
fixmerge1144:
  %t4147 = phi i64 [ %t4144, %fixfast1142 ], [ %t4146, %fixslow1143 ]
  %t4148 = call i64 @rt_cons(i64 %t4139, i64 %t4147)
  ret i64 %t4148
else1138:
  %t4149 = load i64, ptr @"scheme.base:rd-datum"
  %t4150 = and i64 %t4149, -8
  %t4151 = inttoptr i64 %t4150 to ptr
  %t4152 = load i64, ptr %t4151
  %t4153 = inttoptr i64 %t4152 to ptr
  %t4154 = call fastcc i64%t4153(i64 %t4149, i64 3, i64 %a0, i64 %a1, i64 %t4056, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4155 = call i64 @rt_cdr(i64 %t4154)
  %t4156 = call i64 @rt_car(i64 %t4154)
  %t4157 = call i64 @rt_cons(i64 %t4156, i64 %a3)
  %t4158 = load i64, ptr @"scheme.base:rd-list"
  %t4159 = and i64 %t4158, -8
  %t4160 = inttoptr i64 %t4159 to ptr
  %t4161 = load i64, ptr %t4160
  %t4162 = inttoptr i64 %t4161 to ptr
  %t4163 = musttail call fastcc i64 %t4162(i64 %t4158, i64 4, i64 %a0, i64 %a1, i64 %t4155, i64 %t4157, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4163
else1122:
  %t4164 = load i64, ptr @"scheme.base:reverse"
  %t4165 = and i64 %t4164, -8
  %t4166 = inttoptr i64 %t4165 to ptr
  %t4167 = load i64, ptr %t4166
  %t4168 = inttoptr i64 %t4167 to ptr
  %t4169 = call fastcc i64%t4168(i64 %t4164, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4170 = call i64 @rt_cons(i64 %t4169, i64 %t4056)
  ret i64 %t4170
}

define fastcc i64 @"scheme.base:code:rd-datum"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4175 = icmp eq i64 %argc, 3
  br i1 %t4175, label %argok1146, label %arityerr1145
arityerr1145:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1146:
  %t4176 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t4177 = call i64 @rt_char_to_integer(i64 %t4176)
  %t4178 = or i64 %t4177, 320
  %t4179 = and i64 %t4178, 7
  %t4180 = icmp eq i64 %t4179, 0
  br i1 %t4180, label %fixfast1147, label %fixslow1148
fixfast1147:
  %t4181 = icmp eq i64 %t4177, 320
  %t4182 = select i1 %t4181, i64 257, i64 1
  br label %fixmerge1149
fixslow1148:
  %t4183 = call i64 @rt_num_eq(i64 %t4177, i64 320)
  br label %fixmerge1149
fixmerge1149:
  %t4184 = phi i64 [ %t4182, %fixfast1147 ], [ %t4183, %fixslow1148 ]
  %t4185 = icmp ne i64 %t4184, 1
  br i1 %t4185, label %then1150, label %else1151
then1150:
  %t4186 = or i64 %a2, 8
  %t4187 = and i64 %t4186, 7
  %t4188 = icmp eq i64 %t4187, 0
  br i1 %t4188, label %fixfast1152, label %fixslow1153
fixfast1152:
  %t4189 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4190 = extractvalue {i64, i1} %t4189, 0
  %t4191 = extractvalue {i64, i1} %t4189, 1
  br i1 %t4191, label %fixslow1153, label %fixmerge1154
fixslow1153:
  %t4192 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1154
fixmerge1154:
  %t4193 = phi i64 [ %t4190, %fixfast1152 ], [ %t4192, %fixslow1153 ]
  %t4194 = load i64, ptr @"scheme.base:rd-list"
  %t4195 = and i64 %t4194, -8
  %t4196 = inttoptr i64 %t4195 to ptr
  %t4197 = load i64, ptr %t4196
  %t4198 = inttoptr i64 %t4197 to ptr
  %t4199 = musttail call fastcc i64 %t4198(i64 %t4194, i64 4, i64 %a0, i64 %a1, i64 %t4193, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4199
else1151:
  %t4200 = or i64 %t4177, 728
  %t4201 = and i64 %t4200, 7
  %t4202 = icmp eq i64 %t4201, 0
  br i1 %t4202, label %fixfast1155, label %fixslow1156
fixfast1155:
  %t4203 = icmp eq i64 %t4177, 728
  %t4204 = select i1 %t4203, i64 257, i64 1
  br label %fixmerge1157
fixslow1156:
  %t4205 = call i64 @rt_num_eq(i64 %t4177, i64 728)
  br label %fixmerge1157
fixmerge1157:
  %t4206 = phi i64 [ %t4204, %fixfast1155 ], [ %t4205, %fixslow1156 ]
  %t4207 = icmp ne i64 %t4206, 1
  br i1 %t4207, label %then1158, label %else1159
then1158:
  %t4208 = or i64 %a2, 8
  %t4209 = and i64 %t4208, 7
  %t4210 = icmp eq i64 %t4209, 0
  br i1 %t4210, label %fixfast1160, label %fixslow1161
fixfast1160:
  %t4211 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4212 = extractvalue {i64, i1} %t4211, 0
  %t4213 = extractvalue {i64, i1} %t4211, 1
  br i1 %t4213, label %fixslow1161, label %fixmerge1162
fixslow1161:
  %t4214 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1162
fixmerge1162:
  %t4215 = phi i64 [ %t4212, %fixfast1160 ], [ %t4214, %fixslow1161 ]
  %t4216 = load i64, ptr @"scheme.base:rd-list"
  %t4217 = and i64 %t4216, -8
  %t4218 = inttoptr i64 %t4217 to ptr
  %t4219 = load i64, ptr %t4218
  %t4220 = inttoptr i64 %t4219 to ptr
  %t4221 = musttail call fastcc i64 %t4220(i64 %t4216, i64 4, i64 %a0, i64 %a1, i64 %t4215, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4221
else1159:
  %t4222 = or i64 %t4177, 312
  %t4223 = and i64 %t4222, 7
  %t4224 = icmp eq i64 %t4223, 0
  br i1 %t4224, label %fixfast1163, label %fixslow1164
fixfast1163:
  %t4225 = icmp eq i64 %t4177, 312
  %t4226 = select i1 %t4225, i64 257, i64 1
  br label %fixmerge1165
fixslow1164:
  %t4227 = call i64 @rt_num_eq(i64 %t4177, i64 312)
  br label %fixmerge1165
fixmerge1165:
  %t4228 = phi i64 [ %t4226, %fixfast1163 ], [ %t4227, %fixslow1164 ]
  %t4229 = icmp ne i64 %t4228, 1
  br i1 %t4229, label %then1166, label %else1167
then1166:
  %t4230 = or i64 %a2, 8
  %t4231 = and i64 %t4230, 7
  %t4232 = icmp eq i64 %t4231, 0
  br i1 %t4232, label %fixfast1168, label %fixslow1169
fixfast1168:
  %t4233 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4234 = extractvalue {i64, i1} %t4233, 0
  %t4235 = extractvalue {i64, i1} %t4233, 1
  br i1 %t4235, label %fixslow1169, label %fixmerge1170
fixslow1169:
  %t4236 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1170
fixmerge1170:
  %t4237 = phi i64 [ %t4234, %fixfast1168 ], [ %t4236, %fixslow1169 ]
  %t4238 = load i64, ptr @"scheme.base:rd-quote"
  %t4239 = and i64 %t4238, -8
  %t4240 = inttoptr i64 %t4239 to ptr
  %t4241 = load i64, ptr %t4240
  %t4242 = inttoptr i64 %t4241 to ptr
  %t4243 = musttail call fastcc i64 %t4242(i64 %t4238, i64 3, i64 %a0, i64 %a1, i64 %t4237, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4243
else1167:
  %t4244 = or i64 %t4177, 768
  %t4245 = and i64 %t4244, 7
  %t4246 = icmp eq i64 %t4245, 0
  br i1 %t4246, label %fixfast1171, label %fixslow1172
fixfast1171:
  %t4247 = icmp eq i64 %t4177, 768
  %t4248 = select i1 %t4247, i64 257, i64 1
  br label %fixmerge1173
fixslow1172:
  %t4249 = call i64 @rt_num_eq(i64 %t4177, i64 768)
  br label %fixmerge1173
fixmerge1173:
  %t4250 = phi i64 [ %t4248, %fixfast1171 ], [ %t4249, %fixslow1172 ]
  %t4251 = icmp ne i64 %t4250, 1
  br i1 %t4251, label %then1174, label %else1175
then1174:
  %t4252 = or i64 %a2, 8
  %t4253 = and i64 %t4252, 7
  %t4254 = icmp eq i64 %t4253, 0
  br i1 %t4254, label %fixfast1176, label %fixslow1177
fixfast1176:
  %t4255 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4256 = extractvalue {i64, i1} %t4255, 0
  %t4257 = extractvalue {i64, i1} %t4255, 1
  br i1 %t4257, label %fixslow1177, label %fixmerge1178
fixslow1177:
  %t4258 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1178
fixmerge1178:
  %t4259 = phi i64 [ %t4256, %fixfast1176 ], [ %t4258, %fixslow1177 ]
  %t4260 = load i64, ptr @"scheme.base:rd-quasi"
  %t4261 = and i64 %t4260, -8
  %t4262 = inttoptr i64 %t4261 to ptr
  %t4263 = load i64, ptr %t4262
  %t4264 = inttoptr i64 %t4263 to ptr
  %t4265 = musttail call fastcc i64 %t4264(i64 %t4260, i64 3, i64 %a0, i64 %a1, i64 %t4259, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4265
else1175:
  %t4266 = or i64 %t4177, 352
  %t4267 = and i64 %t4266, 7
  %t4268 = icmp eq i64 %t4267, 0
  br i1 %t4268, label %fixfast1179, label %fixslow1180
fixfast1179:
  %t4269 = icmp eq i64 %t4177, 352
  %t4270 = select i1 %t4269, i64 257, i64 1
  br label %fixmerge1181
fixslow1180:
  %t4271 = call i64 @rt_num_eq(i64 %t4177, i64 352)
  br label %fixmerge1181
fixmerge1181:
  %t4272 = phi i64 [ %t4270, %fixfast1179 ], [ %t4271, %fixslow1180 ]
  %t4273 = icmp ne i64 %t4272, 1
  br i1 %t4273, label %then1182, label %else1183
then1182:
  %t4274 = or i64 %a2, 8
  %t4275 = and i64 %t4274, 7
  %t4276 = icmp eq i64 %t4275, 0
  br i1 %t4276, label %fixfast1184, label %fixslow1185
fixfast1184:
  %t4277 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4278 = extractvalue {i64, i1} %t4277, 0
  %t4279 = extractvalue {i64, i1} %t4277, 1
  br i1 %t4279, label %fixslow1185, label %fixmerge1186
fixslow1185:
  %t4280 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1186
fixmerge1186:
  %t4281 = phi i64 [ %t4278, %fixfast1184 ], [ %t4280, %fixslow1185 ]
  %t4282 = load i64, ptr @"scheme.base:rd-unquote"
  %t4283 = and i64 %t4282, -8
  %t4284 = inttoptr i64 %t4283 to ptr
  %t4285 = load i64, ptr %t4284
  %t4286 = inttoptr i64 %t4285 to ptr
  %t4287 = musttail call fastcc i64 %t4286(i64 %t4282, i64 3, i64 %a0, i64 %a1, i64 %t4281, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4287
else1183:
  %t4288 = or i64 %t4177, 272
  %t4289 = and i64 %t4288, 7
  %t4290 = icmp eq i64 %t4289, 0
  br i1 %t4290, label %fixfast1187, label %fixslow1188
fixfast1187:
  %t4291 = icmp eq i64 %t4177, 272
  %t4292 = select i1 %t4291, i64 257, i64 1
  br label %fixmerge1189
fixslow1188:
  %t4293 = call i64 @rt_num_eq(i64 %t4177, i64 272)
  br label %fixmerge1189
fixmerge1189:
  %t4294 = phi i64 [ %t4292, %fixfast1187 ], [ %t4293, %fixslow1188 ]
  %t4295 = icmp ne i64 %t4294, 1
  br i1 %t4295, label %then1190, label %else1191
then1190:
  %t4296 = or i64 %a2, 8
  %t4297 = and i64 %t4296, 7
  %t4298 = icmp eq i64 %t4297, 0
  br i1 %t4298, label %fixfast1192, label %fixslow1193
fixfast1192:
  %t4299 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4300 = extractvalue {i64, i1} %t4299, 0
  %t4301 = extractvalue {i64, i1} %t4299, 1
  br i1 %t4301, label %fixslow1193, label %fixmerge1194
fixslow1193:
  %t4302 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1194
fixmerge1194:
  %t4303 = phi i64 [ %t4300, %fixfast1192 ], [ %t4302, %fixslow1193 ]
  %t4304 = load i64, ptr @"scheme.base:rd-string"
  %t4305 = and i64 %t4304, -8
  %t4306 = inttoptr i64 %t4305 to ptr
  %t4307 = load i64, ptr %t4306
  %t4308 = inttoptr i64 %t4307 to ptr
  %t4309 = musttail call fastcc i64 %t4308(i64 %t4304, i64 3, i64 %a0, i64 %a1, i64 %t4303, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4309
else1191:
  %t4310 = or i64 %t4177, 280
  %t4311 = and i64 %t4310, 7
  %t4312 = icmp eq i64 %t4311, 0
  br i1 %t4312, label %fixfast1195, label %fixslow1196
fixfast1195:
  %t4313 = icmp eq i64 %t4177, 280
  %t4314 = select i1 %t4313, i64 257, i64 1
  br label %fixmerge1197
fixslow1196:
  %t4315 = call i64 @rt_num_eq(i64 %t4177, i64 280)
  br label %fixmerge1197
fixmerge1197:
  %t4316 = phi i64 [ %t4314, %fixfast1195 ], [ %t4315, %fixslow1196 ]
  %t4317 = icmp ne i64 %t4316, 1
  br i1 %t4317, label %then1198, label %else1199
then1198:
  %t4318 = or i64 %a2, 8
  %t4319 = and i64 %t4318, 7
  %t4320 = icmp eq i64 %t4319, 0
  br i1 %t4320, label %fixfast1200, label %fixslow1201
fixfast1200:
  %t4321 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4322 = extractvalue {i64, i1} %t4321, 0
  %t4323 = extractvalue {i64, i1} %t4321, 1
  br i1 %t4323, label %fixslow1201, label %fixmerge1202
fixslow1201:
  %t4324 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1202
fixmerge1202:
  %t4325 = phi i64 [ %t4322, %fixfast1200 ], [ %t4324, %fixslow1201 ]
  %t4326 = load i64, ptr @"scheme.base:rd-hash"
  %t4327 = and i64 %t4326, -8
  %t4328 = inttoptr i64 %t4327 to ptr
  %t4329 = load i64, ptr %t4328
  %t4330 = inttoptr i64 %t4329 to ptr
  %t4331 = musttail call fastcc i64 %t4330(i64 %t4326, i64 3, i64 %a0, i64 %a1, i64 %t4325, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4331
else1199:
  %t4332 = load i64, ptr @"scheme.base:rd-atom"
  %t4333 = and i64 %t4332, -8
  %t4334 = inttoptr i64 %t4333 to ptr
  %t4335 = load i64, ptr %t4334
  %t4336 = inttoptr i64 %t4335 to ptr
  %t4337 = musttail call fastcc i64 %t4336(i64 %t4332, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4337
}

define fastcc i64 @"scheme.base:code:read-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4342 = icmp eq i64 %argc, 1
  br i1 %t4342, label %argok1204, label %arityerr1203
arityerr1203:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1204:
  %t4343 = call i64 @rt_string_length(i64 %a0)
  %t4344 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t4345 = and i64 %t4344, -8
  %t4346 = inttoptr i64 %t4345 to ptr
  %t4347 = load i64, ptr %t4346
  %t4348 = inttoptr i64 %t4347 to ptr
  %t4349 = call fastcc i64%t4348(i64 %t4344, i64 3, i64 %a0, i64 %t4343, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4350 = load i64, ptr @"scheme.base:rd-datum"
  %t4351 = and i64 %t4350, -8
  %t4352 = inttoptr i64 %t4351 to ptr
  %t4353 = load i64, ptr %t4352
  %t4354 = inttoptr i64 %t4353 to ptr
  %t4355 = call fastcc i64%t4354(i64 %t4350, i64 3, i64 %a0, i64 %t4343, i64 %t4349, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4356 = call i64 @rt_car(i64 %t4355)
  ret i64 %t4356
}

define fastcc i64 @"scheme.base:code_993"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4361 = icmp eq i64 %argc, 2
  br i1 %t4361, label %argok1206, label %arityerr1205
arityerr1205:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1206:
  %t4362 = and i64 %self, -8
  %t4363 = inttoptr i64 %t4362 to ptr
  %t4364 = getelementptr i64, ptr %t4363, i64 1
  %t4365 = load i64, ptr %t4364
  %t4366 = or i64 %a0, %t4365
  %t4367 = and i64 %t4366, 7
  %t4368 = icmp eq i64 %t4367, 0
  br i1 %t4368, label %fixfast1207, label %fixslow1208
fixfast1207:
  %t4369 = icmp slt i64 %a0, %t4365
  %t4370 = select i1 %t4369, i64 257, i64 1
  br label %fixmerge1209
fixslow1208:
  %t4371 = call i64 @rt_lt(i64 %a0, i64 %t4365)
  br label %fixmerge1209
fixmerge1209:
  %t4372 = phi i64 [ %t4370, %fixfast1207 ], [ %t4371, %fixslow1208 ]
  %t4373 = icmp ne i64 %t4372, 1
  br i1 %t4373, label %then1210, label %else1211
then1210:
  %t4374 = and i64 %self, -8
  %t4375 = inttoptr i64 %t4374 to ptr
  %t4376 = getelementptr i64, ptr %t4375, i64 2
  %t4377 = load i64, ptr %t4376
  %t4378 = and i64 %self, -8
  %t4379 = inttoptr i64 %t4378 to ptr
  %t4380 = getelementptr i64, ptr %t4379, i64 1
  %t4381 = load i64, ptr %t4380
  %t4382 = load i64, ptr @"scheme.base:rd-datum"
  %t4383 = and i64 %t4382, -8
  %t4384 = inttoptr i64 %t4383 to ptr
  %t4385 = load i64, ptr %t4384
  %t4386 = inttoptr i64 %t4385 to ptr
  %t4387 = call fastcc i64%t4386(i64 %t4382, i64 3, i64 %t4377, i64 %t4381, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4388 = and i64 %self, -8
  %t4389 = inttoptr i64 %t4388 to ptr
  %t4390 = getelementptr i64, ptr %t4389, i64 2
  %t4391 = load i64, ptr %t4390
  %t4392 = and i64 %self, -8
  %t4393 = inttoptr i64 %t4392 to ptr
  %t4394 = getelementptr i64, ptr %t4393, i64 1
  %t4395 = load i64, ptr %t4394
  %t4396 = call i64 @rt_cdr(i64 %t4387)
  %t4397 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t4398 = and i64 %t4397, -8
  %t4399 = inttoptr i64 %t4398 to ptr
  %t4400 = load i64, ptr %t4399
  %t4401 = inttoptr i64 %t4400 to ptr
  %t4402 = call fastcc i64%t4401(i64 %t4397, i64 3, i64 %t4391, i64 %t4395, i64 %t4396, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4403 = call i64 @rt_car(i64 %t4387)
  %t4404 = call i64 @rt_cons(i64 %t4403, i64 %a1)
  %t4405 = musttail call fastcc i64 @"scheme.base:code_993"(i64 %self, i64 2, i64 %t4402, i64 %t4404, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4405
else1211:
  %t4406 = load i64, ptr @"scheme.base:reverse"
  %t4407 = and i64 %t4406, -8
  %t4408 = inttoptr i64 %t4407 to ptr
  %t4409 = load i64, ptr %t4408
  %t4410 = inttoptr i64 %t4409 to ptr
  %t4411 = musttail call fastcc i64 %t4410(i64 %t4406, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4411
}

define fastcc i64 @"scheme.base:code:read-all-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4412 = icmp eq i64 %argc, 1
  br i1 %t4412, label %argok1213, label %arityerr1212
arityerr1212:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1213:
  %t4413 = call i64 @rt_string_length(i64 %a0)
  %t4414 = call ptr @rt_alloc_words(i64 4)
  %t4415 = ptrtoint ptr %t4414 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_993" to i64), ptr %t4414
  %t4416 = or i64 %t4415, 4
  %t4417 = getelementptr i64, ptr %t4414, i64 1
  store i64 %t4413, ptr %t4417
  %t4418 = getelementptr i64, ptr %t4414, i64 2
  store i64 %a0, ptr %t4418
  %t4419 = getelementptr i64, ptr %t4414, i64 3
  store i64 %t4416, ptr %t4419
  %t4420 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t4421 = and i64 %t4420, -8
  %t4422 = inttoptr i64 %t4421 to ptr
  %t4423 = load i64, ptr %t4422
  %t4424 = inttoptr i64 %t4423 to ptr
  %t4425 = call fastcc i64%t4424(i64 %t4420, i64 3, i64 %a0, i64 %t4413, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4426 = musttail call fastcc i64 @"scheme.base:code_993"(i64 %t4416, i64 2, i64 %t4425, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4426
}

define fastcc i64 @"scheme.base:code:%port-rtd"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4432 = icmp eq i64 %argc, 0
  br i1 %t4432, label %argok1215, label %arityerr1214
arityerr1214:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1215:
  %t4433 = load i64, ptr @"scheme.base:%port-rtd-cell"
  %t4434 = icmp ne i64 %t4433, 1
  br i1 %t4434, label %then1216, label %else1217
then1216:
  %t4435 = load i64, ptr @"scheme.base:%port-rtd-cell"
  ret i64 %t4435
else1217:
  %t4436 = call i64 @rt_make_string(ptr @.str.lit.19, i64 4)
  %t4437 = call i64 @rt_make_record_type(i64 %t4436)
  %t4438 = call i64 @rt_root(i64 %t4437)
  store i64 %t4438, ptr @"scheme.base:%port-rtd-cell"
  %t4439 = load i64, ptr @"scheme.base:%port-rtd-cell"
  ret i64 %t4439
}

define fastcc i64 @"scheme.base:code:%make-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4444 = icmp eq i64 %argc, 6
  br i1 %t4444, label %argok1219, label %arityerr1218
arityerr1218:
  call void @rt_arity_error(i64 6, i64 %argc)
  unreachable
argok1219:
  %t4445 = load i64, ptr @"scheme.base:%port-rtd"
  %t4446 = and i64 %t4445, -8
  %t4447 = inttoptr i64 %t4446 to ptr
  %t4448 = load i64, ptr %t4447
  %t4449 = inttoptr i64 %t4448 to ptr
  %t4450 = call fastcc i64%t4449(i64 %t4445, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4451 = load i64, ptr @"scheme.base:list"
  %t4452 = and i64 %t4451, -8
  %t4453 = inttoptr i64 %t4452 to ptr
  %t4454 = load i64, ptr %t4453
  %t4455 = inttoptr i64 %t4454 to ptr
  %t4456 = call fastcc i64%t4455(i64 %t4451, i64 6, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 0, i64 0, ptr null)
  %t4457 = call i64 @rt_make_record(i64 %t4450, i64 %t4456)
  ret i64 %t4457
}

define fastcc i64 @"scheme.base:code:port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4462 = icmp eq i64 %argc, 1
  br i1 %t4462, label %argok1221, label %arityerr1220
arityerr1220:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1221:
  %t4463 = load i64, ptr @"scheme.base:%port-rtd"
  %t4464 = and i64 %t4463, -8
  %t4465 = inttoptr i64 %t4464 to ptr
  %t4466 = load i64, ptr %t4465
  %t4467 = inttoptr i64 %t4466 to ptr
  %t4468 = call fastcc i64%t4467(i64 %t4463, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4469 = call i64 @rt_record_of_type_p(i64 %a0, i64 %t4468)
  ret i64 %t4469
}

define fastcc i64 @"scheme.base:code:input-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4474 = icmp eq i64 %argc, 1
  br i1 %t4474, label %argok1223, label %arityerr1222
arityerr1222:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1223:
  %t4475 = load i64, ptr @"scheme.base:port?"
  %t4476 = and i64 %t4475, -8
  %t4477 = inttoptr i64 %t4476 to ptr
  %t4478 = load i64, ptr %t4477
  %t4479 = inttoptr i64 %t4478 to ptr
  %t4480 = call fastcc i64%t4479(i64 %t4475, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4481 = icmp ne i64 %t4480, 1
  br i1 %t4481, label %then1224, label %else1225
then1224:
  %t4482 = call i64 @rt_record_ref(i64 %a0, i64 8)
  ret i64 %t4482
else1225:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4487 = icmp eq i64 %argc, 1
  br i1 %t4487, label %argok1227, label %arityerr1226
arityerr1226:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1227:
  %t4488 = load i64, ptr @"scheme.base:port?"
  %t4489 = and i64 %t4488, -8
  %t4490 = inttoptr i64 %t4489 to ptr
  %t4491 = load i64, ptr %t4490
  %t4492 = inttoptr i64 %t4491 to ptr
  %t4493 = call fastcc i64%t4492(i64 %t4488, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4494 = icmp ne i64 %t4493, 1
  br i1 %t4494, label %then1228, label %else1229
then1228:
  %t4495 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t4496 = call i64 @rt_not(i64 %t4495)
  ret i64 %t4496
else1229:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:textual-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4501 = icmp eq i64 %argc, 1
  br i1 %t4501, label %argok1231, label %arityerr1230
arityerr1230:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1231:
  %t4502 = load i64, ptr @"scheme.base:port?"
  %t4503 = and i64 %t4502, -8
  %t4504 = inttoptr i64 %t4503 to ptr
  %t4505 = load i64, ptr %t4504
  %t4506 = inttoptr i64 %t4505 to ptr
  %t4507 = musttail call fastcc i64 %t4506(i64 %t4502, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4507
}

define fastcc i64 @"scheme.base:code:port-closed?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4512 = icmp eq i64 %argc, 1
  br i1 %t4512, label %argok1233, label %arityerr1232
arityerr1232:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1233:
  %t4513 = call i64 @rt_record_ref(i64 %a0, i64 40)
  ret i64 %t4513
}

define fastcc i64 @"scheme.base:code:input-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4518 = icmp eq i64 %argc, 1
  br i1 %t4518, label %argok1235, label %arityerr1234
arityerr1234:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1235:
  %t4519 = load i64, ptr @"scheme.base:input-port?"
  %t4520 = and i64 %t4519, -8
  %t4521 = inttoptr i64 %t4520 to ptr
  %t4522 = load i64, ptr %t4521
  %t4523 = inttoptr i64 %t4522 to ptr
  %t4524 = call fastcc i64%t4523(i64 %t4519, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4525 = icmp ne i64 %t4524, 1
  br i1 %t4525, label %then1236, label %else1237
then1236:
  %t4526 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t4527 = call i64 @rt_not(i64 %t4526)
  ret i64 %t4527
else1237:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4532 = icmp eq i64 %argc, 1
  br i1 %t4532, label %argok1239, label %arityerr1238
arityerr1238:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1239:
  %t4533 = load i64, ptr @"scheme.base:output-port?"
  %t4534 = and i64 %t4533, -8
  %t4535 = inttoptr i64 %t4534 to ptr
  %t4536 = load i64, ptr %t4535
  %t4537 = inttoptr i64 %t4536 to ptr
  %t4538 = call fastcc i64%t4537(i64 %t4533, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4539 = icmp ne i64 %t4538, 1
  br i1 %t4539, label %then1240, label %else1241
then1240:
  %t4540 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t4541 = call i64 @rt_not(i64 %t4540)
  ret i64 %t4541
else1241:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%check-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4546 = icmp eq i64 %argc, 2
  br i1 %t4546, label %argok1243, label %arityerr1242
arityerr1242:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1243:
  %t4547 = load i64, ptr @"scheme.base:input-port?"
  %t4548 = and i64 %t4547, -8
  %t4549 = inttoptr i64 %t4548 to ptr
  %t4550 = load i64, ptr %t4549
  %t4551 = inttoptr i64 %t4550 to ptr
  %t4552 = call fastcc i64%t4551(i64 %t4547, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4553 = call i64 @rt_not(i64 %t4552)
  %t4554 = icmp ne i64 %t4553, 1
  br i1 %t4554, label %then1244, label %else1245
then1244:
  %t4555 = call i64 @rt_make_string(ptr @.str.lit.20, i64 17)
  %t4556 = load i64, ptr @"scheme.base:error"
  %t4557 = and i64 %t4556, -8
  %t4558 = inttoptr i64 %t4557 to ptr
  %t4559 = load i64, ptr %t4558
  %t4560 = inttoptr i64 %t4559 to ptr
  %t4561 = musttail call fastcc i64 %t4560(i64 %t4556, i64 3, i64 %a1, i64 %t4555, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4561
else1245:
  %t4562 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t4563 = icmp ne i64 %t4562, 1
  br i1 %t4563, label %then1246, label %else1247
then1246:
  %t4564 = call i64 @rt_make_string(ptr @.str.lit.21, i64 14)
  %t4565 = load i64, ptr @"scheme.base:error"
  %t4566 = and i64 %t4565, -8
  %t4567 = inttoptr i64 %t4566 to ptr
  %t4568 = load i64, ptr %t4567
  %t4569 = inttoptr i64 %t4568 to ptr
  %t4570 = musttail call fastcc i64 %t4569(i64 %t4565, i64 3, i64 %a1, i64 %t4564, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4570
else1247:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:%check-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4575 = icmp eq i64 %argc, 2
  br i1 %t4575, label %argok1249, label %arityerr1248
arityerr1248:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1249:
  %t4576 = load i64, ptr @"scheme.base:output-port?"
  %t4577 = and i64 %t4576, -8
  %t4578 = inttoptr i64 %t4577 to ptr
  %t4579 = load i64, ptr %t4578
  %t4580 = inttoptr i64 %t4579 to ptr
  %t4581 = call fastcc i64%t4580(i64 %t4576, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4582 = call i64 @rt_not(i64 %t4581)
  %t4583 = icmp ne i64 %t4582, 1
  br i1 %t4583, label %then1250, label %else1251
then1250:
  %t4584 = call i64 @rt_make_string(ptr @.str.lit.22, i64 18)
  %t4585 = load i64, ptr @"scheme.base:error"
  %t4586 = and i64 %t4585, -8
  %t4587 = inttoptr i64 %t4586 to ptr
  %t4588 = load i64, ptr %t4587
  %t4589 = inttoptr i64 %t4588 to ptr
  %t4590 = musttail call fastcc i64 %t4589(i64 %t4585, i64 3, i64 %a1, i64 %t4584, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4590
else1251:
  %t4591 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t4592 = icmp ne i64 %t4591, 1
  br i1 %t4592, label %then1252, label %else1253
then1252:
  %t4593 = call i64 @rt_make_string(ptr @.str.lit.23, i64 14)
  %t4594 = load i64, ptr @"scheme.base:error"
  %t4595 = and i64 %t4594, -8
  %t4596 = inttoptr i64 %t4595 to ptr
  %t4597 = load i64, ptr %t4596
  %t4598 = inttoptr i64 %t4597 to ptr
  %t4599 = musttail call fastcc i64 %t4598(i64 %t4594, i64 3, i64 %a1, i64 %t4593, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4599
else1253:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:%port-buf"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4604 = icmp eq i64 %argc, 1
  br i1 %t4604, label %argok1255, label %arityerr1254
arityerr1254:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1255:
  %t4605 = call i64 @rt_record_ref(i64 %a0, i64 16)
  %t4606 = icmp ne i64 %t4605, 1
  br i1 %t4606, label %then1256, label %else1257
then1256:
  ret i64 %t4605
else1257:
  %t4607 = call i64 @rt_read_all_stdin()
  %t4608 = call i64 @rt_record_set(i64 %a0, i64 16, i64 %t4607)
  ret i64 %t4607
}

define fastcc i64 @"scheme.base:code:open-input-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4613 = icmp eq i64 %argc, 1
  br i1 %t4613, label %argok1259, label %arityerr1258
arityerr1258:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1259:
  %t4614 = load i64, ptr @"scheme.base:%make-port"
  %t4615 = and i64 %t4614, -8
  %t4616 = inttoptr i64 %t4615 to ptr
  %t4617 = load i64, ptr %t4616
  %t4618 = inttoptr i64 %t4617 to ptr
  %t4619 = musttail call fastcc i64 %t4618(i64 %t4614, i64 6, i64 1, i64 257, i64 %a0, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t4619
}

define fastcc i64 @"scheme.base:code:open-input-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4624 = icmp eq i64 %argc, 1
  br i1 %t4624, label %argok1261, label %arityerr1260
arityerr1260:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1261:
  %t4625 = call i64 @rt_read_file(i64 %a0)
  %t4626 = icmp ne i64 %t4625, 1
  br i1 %t4626, label %then1262, label %else1263
then1262:
  %t4627 = load i64, ptr @"scheme.base:%make-port"
  %t4628 = and i64 %t4627, -8
  %t4629 = inttoptr i64 %t4628 to ptr
  %t4630 = load i64, ptr %t4629
  %t4631 = inttoptr i64 %t4630 to ptr
  %t4632 = musttail call fastcc i64 %t4631(i64 %t4627, i64 6, i64 1, i64 257, i64 %t4625, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t4632
else1263:
  %t4633 = call i64 @rt_intern(ptr @.str.sym.24)
  %t4634 = call i64 @rt_make_string(ptr @.str.lit.25, i64 26)
  %t4635 = load i64, ptr @"scheme.base:error"
  %t4636 = and i64 %t4635, -8
  %t4637 = inttoptr i64 %t4636 to ptr
  %t4638 = load i64, ptr %t4637
  %t4639 = inttoptr i64 %t4638 to ptr
  %t4640 = musttail call fastcc i64 %t4639(i64 %t4635, i64 3, i64 %t4633, i64 %t4634, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4640
}

define fastcc i64 @"scheme.base:code:%port-at-eof?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4645 = icmp eq i64 %argc, 1
  br i1 %t4645, label %argok1265, label %arityerr1264
arityerr1264:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1265:
  %t4646 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t4647 = load i64, ptr @"scheme.base:%port-buf"
  %t4648 = and i64 %t4647, -8
  %t4649 = inttoptr i64 %t4648 to ptr
  %t4650 = load i64, ptr %t4649
  %t4651 = inttoptr i64 %t4650 to ptr
  %t4652 = call fastcc i64%t4651(i64 %t4647, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4653 = call i64 @rt_string_length(i64 %t4652)
  %t4654 = or i64 %t4653, %t4646
  %t4655 = and i64 %t4654, 7
  %t4656 = icmp eq i64 %t4655, 0
  br i1 %t4656, label %fixfast1266, label %fixslow1267
fixfast1266:
  %t4657 = icmp slt i64 %t4653, %t4646
  %t4658 = select i1 %t4657, i64 257, i64 1
  br label %fixmerge1268
fixslow1267:
  %t4659 = call i64 @rt_lt(i64 %t4653, i64 %t4646)
  br label %fixmerge1268
fixmerge1268:
  %t4660 = phi i64 [ %t4658, %fixfast1266 ], [ %t4659, %fixslow1267 ]
  %t4661 = icmp ne i64 %t4660, 1
  br i1 %t4661, label %then1269, label %else1270
then1269:
  ret i64 257
else1270:
  %t4662 = or i64 %t4646, %t4653
  %t4663 = and i64 %t4662, 7
  %t4664 = icmp eq i64 %t4663, 0
  br i1 %t4664, label %fixfast1271, label %fixslow1272
fixfast1271:
  %t4665 = icmp eq i64 %t4646, %t4653
  %t4666 = select i1 %t4665, i64 257, i64 1
  br label %fixmerge1273
fixslow1272:
  %t4667 = call i64 @rt_num_eq(i64 %t4646, i64 %t4653)
  br label %fixmerge1273
fixmerge1273:
  %t4668 = phi i64 [ %t4666, %fixfast1271 ], [ %t4667, %fixslow1272 ]
  ret i64 %t4668
}

define fastcc i64 @"scheme.base:code:read-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4673 = icmp eq i64 %argc, 1
  br i1 %t4673, label %argok1275, label %arityerr1274
arityerr1274:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1275:
  %t4674 = call i64 @rt_intern(ptr @.str.sym.26)
  %t4675 = load i64, ptr @"scheme.base:%check-input-port"
  %t4676 = and i64 %t4675, -8
  %t4677 = inttoptr i64 %t4676 to ptr
  %t4678 = load i64, ptr %t4677
  %t4679 = inttoptr i64 %t4678 to ptr
  %t4680 = call fastcc i64%t4679(i64 %t4675, i64 2, i64 %a0, i64 %t4674, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4681 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t4682 = and i64 %t4681, -8
  %t4683 = inttoptr i64 %t4682 to ptr
  %t4684 = load i64, ptr %t4683
  %t4685 = inttoptr i64 %t4684 to ptr
  %t4686 = call fastcc i64%t4685(i64 %t4681, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4687 = icmp ne i64 %t4686, 1
  br i1 %t4687, label %then1276, label %else1277
then1276:
  %t4688 = call i64 @rt_eof_object()
  ret i64 %t4688
else1277:
  %t4689 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t4690 = or i64 %t4689, 8
  %t4691 = and i64 %t4690, 7
  %t4692 = icmp eq i64 %t4691, 0
  br i1 %t4692, label %fixfast1278, label %fixslow1279
fixfast1278:
  %t4693 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4689, i64 8)
  %t4694 = extractvalue {i64, i1} %t4693, 0
  %t4695 = extractvalue {i64, i1} %t4693, 1
  br i1 %t4695, label %fixslow1279, label %fixmerge1280
fixslow1279:
  %t4696 = call i64 @rt_add(i64 %t4689, i64 8)
  br label %fixmerge1280
fixmerge1280:
  %t4697 = phi i64 [ %t4694, %fixfast1278 ], [ %t4696, %fixslow1279 ]
  %t4698 = call i64 @rt_record_set(i64 %a0, i64 24, i64 %t4697)
  %t4699 = load i64, ptr @"scheme.base:%port-buf"
  %t4700 = and i64 %t4699, -8
  %t4701 = inttoptr i64 %t4700 to ptr
  %t4702 = load i64, ptr %t4701
  %t4703 = inttoptr i64 %t4702 to ptr
  %t4704 = call fastcc i64%t4703(i64 %t4699, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4705 = call i64 @rt_string_ref(i64 %t4704, i64 %t4689)
  ret i64 %t4705
}

define fastcc i64 @"scheme.base:code:peek-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4710 = icmp eq i64 %argc, 1
  br i1 %t4710, label %argok1282, label %arityerr1281
arityerr1281:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1282:
  %t4711 = call i64 @rt_intern(ptr @.str.sym.27)
  %t4712 = load i64, ptr @"scheme.base:%check-input-port"
  %t4713 = and i64 %t4712, -8
  %t4714 = inttoptr i64 %t4713 to ptr
  %t4715 = load i64, ptr %t4714
  %t4716 = inttoptr i64 %t4715 to ptr
  %t4717 = call fastcc i64%t4716(i64 %t4712, i64 2, i64 %a0, i64 %t4711, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4718 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t4719 = and i64 %t4718, -8
  %t4720 = inttoptr i64 %t4719 to ptr
  %t4721 = load i64, ptr %t4720
  %t4722 = inttoptr i64 %t4721 to ptr
  %t4723 = call fastcc i64%t4722(i64 %t4718, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4724 = icmp ne i64 %t4723, 1
  br i1 %t4724, label %then1283, label %else1284
then1283:
  %t4725 = call i64 @rt_eof_object()
  ret i64 %t4725
else1284:
  %t4726 = load i64, ptr @"scheme.base:%port-buf"
  %t4727 = and i64 %t4726, -8
  %t4728 = inttoptr i64 %t4727 to ptr
  %t4729 = load i64, ptr %t4728
  %t4730 = inttoptr i64 %t4729 to ptr
  %t4731 = call fastcc i64%t4730(i64 %t4726, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4732 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t4733 = call i64 @rt_string_ref(i64 %t4731, i64 %t4732)
  ret i64 %t4733
}

define fastcc i64 @"scheme.base:code_1055"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4738 = icmp eq i64 %argc, 1
  br i1 %t4738, label %argok1286, label %arityerr1285
arityerr1285:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1286:
  %t4739 = and i64 %self, -8
  %t4740 = inttoptr i64 %t4739 to ptr
  %t4741 = getelementptr i64, ptr %t4740, i64 1
  %t4742 = load i64, ptr %t4741
  %t4743 = or i64 %t4742, %a0
  %t4744 = and i64 %t4743, 7
  %t4745 = icmp eq i64 %t4744, 0
  br i1 %t4745, label %fixfast1287, label %fixslow1288
fixfast1287:
  %t4746 = icmp slt i64 %t4742, %a0
  %t4747 = select i1 %t4746, i64 257, i64 1
  br label %fixmerge1289
fixslow1288:
  %t4748 = call i64 @rt_lt(i64 %t4742, i64 %a0)
  br label %fixmerge1289
fixmerge1289:
  %t4749 = phi i64 [ %t4747, %fixfast1287 ], [ %t4748, %fixslow1288 ]
  %t4750 = icmp ne i64 %t4749, 1
  br i1 %t4750, label %then1290, label %else1291
then1290:
  br label %merge1292
else1291:
  %t4751 = or i64 %a0, %t4742
  %t4752 = and i64 %t4751, 7
  %t4753 = icmp eq i64 %t4752, 0
  br i1 %t4753, label %fixfast1293, label %fixslow1294
fixfast1293:
  %t4754 = icmp eq i64 %a0, %t4742
  %t4755 = select i1 %t4754, i64 257, i64 1
  br label %fixmerge1295
fixslow1294:
  %t4756 = call i64 @rt_num_eq(i64 %a0, i64 %t4742)
  br label %fixmerge1295
fixmerge1295:
  %t4757 = phi i64 [ %t4755, %fixfast1293 ], [ %t4756, %fixslow1294 ]
  br label %merge1292
merge1292:
  %t4758 = phi i64 [ 257, %then1290 ], [ %t4757, %fixmerge1295 ]
  %t4759 = icmp ne i64 %t4758, 1
  br i1 %t4759, label %then1296, label %else1297
then1296:
  %t4760 = and i64 %self, -8
  %t4761 = inttoptr i64 %t4760 to ptr
  %t4762 = getelementptr i64, ptr %t4761, i64 2
  %t4763 = load i64, ptr %t4762
  %t4764 = call i64 @rt_record_ref(i64 %t4763, i64 24)
  %t4765 = and i64 %self, -8
  %t4766 = inttoptr i64 %t4765 to ptr
  %t4767 = getelementptr i64, ptr %t4766, i64 2
  %t4768 = load i64, ptr %t4767
  %t4769 = and i64 %self, -8
  %t4770 = inttoptr i64 %t4769 to ptr
  %t4771 = getelementptr i64, ptr %t4770, i64 1
  %t4772 = load i64, ptr %t4771
  %t4773 = call i64 @rt_record_set(i64 %t4768, i64 24, i64 %t4772)
  %t4774 = and i64 %self, -8
  %t4775 = inttoptr i64 %t4774 to ptr
  %t4776 = getelementptr i64, ptr %t4775, i64 3
  %t4777 = load i64, ptr %t4776
  %t4778 = and i64 %self, -8
  %t4779 = inttoptr i64 %t4778 to ptr
  %t4780 = getelementptr i64, ptr %t4779, i64 1
  %t4781 = load i64, ptr %t4780
  %t4782 = call i64 @rt_substring(i64 %t4777, i64 %t4764, i64 %t4781)
  ret i64 %t4782
else1297:
  %t4783 = and i64 %self, -8
  %t4784 = inttoptr i64 %t4783 to ptr
  %t4785 = getelementptr i64, ptr %t4784, i64 3
  %t4786 = load i64, ptr %t4785
  %t4787 = call i64 @rt_string_ref(i64 %t4786, i64 %a0)
  %t4788 = load i64, ptr @"scheme.base:char=?"
  %t4789 = and i64 %t4788, -8
  %t4790 = inttoptr i64 %t4789 to ptr
  %t4791 = load i64, ptr %t4790
  %t4792 = inttoptr i64 %t4791 to ptr
  %t4793 = call fastcc i64%t4792(i64 %t4788, i64 2, i64 %t4787, i64 2569, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4794 = icmp ne i64 %t4793, 1
  br i1 %t4794, label %then1298, label %else1299
then1298:
  %t4795 = and i64 %self, -8
  %t4796 = inttoptr i64 %t4795 to ptr
  %t4797 = getelementptr i64, ptr %t4796, i64 2
  %t4798 = load i64, ptr %t4797
  %t4799 = call i64 @rt_record_ref(i64 %t4798, i64 24)
  %t4800 = and i64 %self, -8
  %t4801 = inttoptr i64 %t4800 to ptr
  %t4802 = getelementptr i64, ptr %t4801, i64 2
  %t4803 = load i64, ptr %t4802
  %t4804 = or i64 %a0, 8
  %t4805 = and i64 %t4804, 7
  %t4806 = icmp eq i64 %t4805, 0
  br i1 %t4806, label %fixfast1300, label %fixslow1301
fixfast1300:
  %t4807 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4808 = extractvalue {i64, i1} %t4807, 0
  %t4809 = extractvalue {i64, i1} %t4807, 1
  br i1 %t4809, label %fixslow1301, label %fixmerge1302
fixslow1301:
  %t4810 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1302
fixmerge1302:
  %t4811 = phi i64 [ %t4808, %fixfast1300 ], [ %t4810, %fixslow1301 ]
  %t4812 = call i64 @rt_record_set(i64 %t4803, i64 24, i64 %t4811)
  %t4813 = and i64 %self, -8
  %t4814 = inttoptr i64 %t4813 to ptr
  %t4815 = getelementptr i64, ptr %t4814, i64 3
  %t4816 = load i64, ptr %t4815
  %t4817 = call i64 @rt_substring(i64 %t4816, i64 %t4799, i64 %a0)
  ret i64 %t4817
else1299:
  %t4818 = or i64 %a0, 8
  %t4819 = and i64 %t4818, 7
  %t4820 = icmp eq i64 %t4819, 0
  br i1 %t4820, label %fixfast1303, label %fixslow1304
fixfast1303:
  %t4821 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4822 = extractvalue {i64, i1} %t4821, 0
  %t4823 = extractvalue {i64, i1} %t4821, 1
  br i1 %t4823, label %fixslow1304, label %fixmerge1305
fixslow1304:
  %t4824 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1305
fixmerge1305:
  %t4825 = phi i64 [ %t4822, %fixfast1303 ], [ %t4824, %fixslow1304 ]
  %t4826 = musttail call fastcc i64 @"scheme.base:code_1055"(i64 %self, i64 1, i64 %t4825, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4826
}

define fastcc i64 @"scheme.base:code:read-line"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4827 = icmp eq i64 %argc, 1
  br i1 %t4827, label %argok1307, label %arityerr1306
arityerr1306:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1307:
  %t4828 = call i64 @rt_intern(ptr @.str.sym.28)
  %t4829 = load i64, ptr @"scheme.base:%check-input-port"
  %t4830 = and i64 %t4829, -8
  %t4831 = inttoptr i64 %t4830 to ptr
  %t4832 = load i64, ptr %t4831
  %t4833 = inttoptr i64 %t4832 to ptr
  %t4834 = call fastcc i64%t4833(i64 %t4829, i64 2, i64 %a0, i64 %t4828, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4835 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t4836 = and i64 %t4835, -8
  %t4837 = inttoptr i64 %t4836 to ptr
  %t4838 = load i64, ptr %t4837
  %t4839 = inttoptr i64 %t4838 to ptr
  %t4840 = call fastcc i64%t4839(i64 %t4835, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4841 = icmp ne i64 %t4840, 1
  br i1 %t4841, label %then1308, label %else1309
then1308:
  %t4842 = call i64 @rt_eof_object()
  ret i64 %t4842
else1309:
  %t4843 = load i64, ptr @"scheme.base:%port-buf"
  %t4844 = and i64 %t4843, -8
  %t4845 = inttoptr i64 %t4844 to ptr
  %t4846 = load i64, ptr %t4845
  %t4847 = inttoptr i64 %t4846 to ptr
  %t4848 = call fastcc i64%t4847(i64 %t4843, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4849 = call i64 @rt_string_length(i64 %t4848)
  %t4850 = call ptr @rt_alloc_words(i64 5)
  %t4851 = ptrtoint ptr %t4850 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1055" to i64), ptr %t4850
  %t4852 = or i64 %t4851, 4
  %t4853 = getelementptr i64, ptr %t4850, i64 1
  store i64 %t4849, ptr %t4853
  %t4854 = getelementptr i64, ptr %t4850, i64 2
  store i64 %a0, ptr %t4854
  %t4855 = getelementptr i64, ptr %t4850, i64 3
  store i64 %t4848, ptr %t4855
  %t4856 = getelementptr i64, ptr %t4850, i64 4
  store i64 %t4852, ptr %t4856
  %t4857 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t4858 = musttail call fastcc i64 @"scheme.base:code_1055"(i64 %t4852, i64 1, i64 %t4857, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4858
}

define fastcc i64 @"scheme.base:code:read-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4863 = icmp eq i64 %argc, 2
  br i1 %t4863, label %argok1311, label %arityerr1310
arityerr1310:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1311:
  %t4864 = call i64 @rt_intern(ptr @.str.sym.29)
  %t4865 = load i64, ptr @"scheme.base:%check-input-port"
  %t4866 = and i64 %t4865, -8
  %t4867 = inttoptr i64 %t4866 to ptr
  %t4868 = load i64, ptr %t4867
  %t4869 = inttoptr i64 %t4868 to ptr
  %t4870 = call fastcc i64%t4869(i64 %t4865, i64 2, i64 %a1, i64 %t4864, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4871 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t4872 = and i64 %t4871, -8
  %t4873 = inttoptr i64 %t4872 to ptr
  %t4874 = load i64, ptr %t4873
  %t4875 = inttoptr i64 %t4874 to ptr
  %t4876 = call fastcc i64%t4875(i64 %t4871, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4877 = icmp ne i64 %t4876, 1
  br i1 %t4877, label %then1312, label %else1313
then1312:
  %t4878 = call i64 @rt_eof_object()
  ret i64 %t4878
else1313:
  %t4879 = load i64, ptr @"scheme.base:%port-buf"
  %t4880 = and i64 %t4879, -8
  %t4881 = inttoptr i64 %t4880 to ptr
  %t4882 = load i64, ptr %t4881
  %t4883 = inttoptr i64 %t4882 to ptr
  %t4884 = call fastcc i64%t4883(i64 %t4879, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4885 = call i64 @rt_string_length(i64 %t4884)
  %t4886 = call i64 @rt_record_ref(i64 %a1, i64 24)
  %t4887 = or i64 %t4886, %a0
  %t4888 = and i64 %t4887, 7
  %t4889 = icmp eq i64 %t4888, 0
  br i1 %t4889, label %fixfast1314, label %fixslow1315
fixfast1314:
  %t4890 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4886, i64 %a0)
  %t4891 = extractvalue {i64, i1} %t4890, 0
  %t4892 = extractvalue {i64, i1} %t4890, 1
  br i1 %t4892, label %fixslow1315, label %fixmerge1316
fixslow1315:
  %t4893 = call i64 @rt_add(i64 %t4886, i64 %a0)
  br label %fixmerge1316
fixmerge1316:
  %t4894 = phi i64 [ %t4891, %fixfast1314 ], [ %t4893, %fixslow1315 ]
  %t4895 = or i64 %t4885, %t4894
  %t4896 = and i64 %t4895, 7
  %t4897 = icmp eq i64 %t4896, 0
  br i1 %t4897, label %fixfast1317, label %fixslow1318
fixfast1317:
  %t4898 = icmp slt i64 %t4885, %t4894
  %t4899 = select i1 %t4898, i64 257, i64 1
  br label %fixmerge1319
fixslow1318:
  %t4900 = call i64 @rt_lt(i64 %t4885, i64 %t4894)
  br label %fixmerge1319
fixmerge1319:
  %t4901 = phi i64 [ %t4899, %fixfast1317 ], [ %t4900, %fixslow1318 ]
  %t4902 = icmp ne i64 %t4901, 1
  br i1 %t4902, label %then1320, label %else1321
then1320:
  br label %merge1322
else1321:
  %t4903 = or i64 %t4886, %a0
  %t4904 = and i64 %t4903, 7
  %t4905 = icmp eq i64 %t4904, 0
  br i1 %t4905, label %fixfast1323, label %fixslow1324
fixfast1323:
  %t4906 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4886, i64 %a0)
  %t4907 = extractvalue {i64, i1} %t4906, 0
  %t4908 = extractvalue {i64, i1} %t4906, 1
  br i1 %t4908, label %fixslow1324, label %fixmerge1325
fixslow1324:
  %t4909 = call i64 @rt_add(i64 %t4886, i64 %a0)
  br label %fixmerge1325
fixmerge1325:
  %t4910 = phi i64 [ %t4907, %fixfast1323 ], [ %t4909, %fixslow1324 ]
  br label %merge1322
merge1322:
  %t4911 = phi i64 [ %t4885, %then1320 ], [ %t4910, %fixmerge1325 ]
  %t4912 = call i64 @rt_record_set(i64 %a1, i64 24, i64 %t4911)
  %t4913 = call i64 @rt_substring(i64 %t4884, i64 %t4886, i64 %t4911)
  ret i64 %t4913
}

define fastcc i64 @"scheme.base:code:read"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4918 = icmp eq i64 %argc, 1
  br i1 %t4918, label %argok1327, label %arityerr1326
arityerr1326:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1327:
  %t4919 = call i64 @rt_intern(ptr @.str.sym.30)
  %t4920 = load i64, ptr @"scheme.base:%check-input-port"
  %t4921 = and i64 %t4920, -8
  %t4922 = inttoptr i64 %t4921 to ptr
  %t4923 = load i64, ptr %t4922
  %t4924 = inttoptr i64 %t4923 to ptr
  %t4925 = call fastcc i64%t4924(i64 %t4920, i64 2, i64 %a0, i64 %t4919, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4926 = load i64, ptr @"scheme.base:%port-buf"
  %t4927 = and i64 %t4926, -8
  %t4928 = inttoptr i64 %t4927 to ptr
  %t4929 = load i64, ptr %t4928
  %t4930 = inttoptr i64 %t4929 to ptr
  %t4931 = call fastcc i64%t4930(i64 %t4926, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4932 = call i64 @rt_string_length(i64 %t4931)
  %t4933 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t4934 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t4935 = and i64 %t4934, -8
  %t4936 = inttoptr i64 %t4935 to ptr
  %t4937 = load i64, ptr %t4936
  %t4938 = inttoptr i64 %t4937 to ptr
  %t4939 = call fastcc i64%t4938(i64 %t4934, i64 3, i64 %t4931, i64 %t4932, i64 %t4933, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4940 = or i64 %t4932, %t4939
  %t4941 = and i64 %t4940, 7
  %t4942 = icmp eq i64 %t4941, 0
  br i1 %t4942, label %fixfast1328, label %fixslow1329
fixfast1328:
  %t4943 = icmp slt i64 %t4932, %t4939
  %t4944 = select i1 %t4943, i64 257, i64 1
  br label %fixmerge1330
fixslow1329:
  %t4945 = call i64 @rt_lt(i64 %t4932, i64 %t4939)
  br label %fixmerge1330
fixmerge1330:
  %t4946 = phi i64 [ %t4944, %fixfast1328 ], [ %t4945, %fixslow1329 ]
  %t4947 = icmp ne i64 %t4946, 1
  br i1 %t4947, label %then1331, label %else1332
then1331:
  br label %merge1333
else1332:
  %t4948 = or i64 %t4939, %t4932
  %t4949 = and i64 %t4948, 7
  %t4950 = icmp eq i64 %t4949, 0
  br i1 %t4950, label %fixfast1334, label %fixslow1335
fixfast1334:
  %t4951 = icmp eq i64 %t4939, %t4932
  %t4952 = select i1 %t4951, i64 257, i64 1
  br label %fixmerge1336
fixslow1335:
  %t4953 = call i64 @rt_num_eq(i64 %t4939, i64 %t4932)
  br label %fixmerge1336
fixmerge1336:
  %t4954 = phi i64 [ %t4952, %fixfast1334 ], [ %t4953, %fixslow1335 ]
  br label %merge1333
merge1333:
  %t4955 = phi i64 [ 257, %then1331 ], [ %t4954, %fixmerge1336 ]
  %t4956 = icmp ne i64 %t4955, 1
  br i1 %t4956, label %then1337, label %else1338
then1337:
  %t4957 = call i64 @rt_record_set(i64 %a0, i64 24, i64 %t4932)
  %t4958 = call i64 @rt_eof_object()
  ret i64 %t4958
else1338:
  %t4959 = load i64, ptr @"scheme.base:rd-datum"
  %t4960 = and i64 %t4959, -8
  %t4961 = inttoptr i64 %t4960 to ptr
  %t4962 = load i64, ptr %t4961
  %t4963 = inttoptr i64 %t4962 to ptr
  %t4964 = call fastcc i64%t4963(i64 %t4959, i64 3, i64 %t4931, i64 %t4932, i64 %t4939, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4965 = call i64 @rt_cdr(i64 %t4964)
  %t4966 = call i64 @rt_record_set(i64 %a0, i64 24, i64 %t4965)
  %t4967 = call i64 @rt_car(i64 %t4964)
  ret i64 %t4967
}

define fastcc i64 @"scheme.base:code:open-output-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4972 = icmp eq i64 %argc, 1
  br i1 %t4972, label %argok1340, label %arityerr1339
arityerr1339:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1340:
  %t4973 = call i64 @rt_port_open_output_file(i64 %a0)
  %t4974 = icmp ne i64 %t4973, 1
  br i1 %t4974, label %then1341, label %else1342
then1341:
  %t4975 = load i64, ptr @"scheme.base:%make-port"
  %t4976 = and i64 %t4975, -8
  %t4977 = inttoptr i64 %t4976 to ptr
  %t4978 = load i64, ptr %t4977
  %t4979 = inttoptr i64 %t4978 to ptr
  %t4980 = musttail call fastcc i64 %t4979(i64 %t4975, i64 6, i64 %t4973, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t4980
else1342:
  %t4981 = call i64 @rt_intern(ptr @.str.sym.31)
  %t4982 = call i64 @rt_make_string(ptr @.str.lit.32, i64 27)
  %t4983 = load i64, ptr @"scheme.base:error"
  %t4984 = and i64 %t4983, -8
  %t4985 = inttoptr i64 %t4984 to ptr
  %t4986 = load i64, ptr %t4985
  %t4987 = inttoptr i64 %t4986 to ptr
  %t4988 = musttail call fastcc i64 %t4987(i64 %t4983, i64 3, i64 %t4981, i64 %t4982, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4988
}

define fastcc i64 @"scheme.base:code:open-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4993 = icmp eq i64 %argc, 0
  br i1 %t4993, label %argok1344, label %arityerr1343
arityerr1343:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1344:
  %t4994 = call i64 @rt_port_open_output_string()
  %t4995 = icmp ne i64 %t4994, 1
  br i1 %t4995, label %then1345, label %else1346
then1345:
  %t4996 = load i64, ptr @"scheme.base:%make-port"
  %t4997 = and i64 %t4996, -8
  %t4998 = inttoptr i64 %t4997 to ptr
  %t4999 = load i64, ptr %t4998
  %t5000 = inttoptr i64 %t4999 to ptr
  %t5001 = musttail call fastcc i64 %t5000(i64 %t4996, i64 6, i64 %t4994, i64 1, i64 1, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t5001
else1346:
  %t5002 = call i64 @rt_intern(ptr @.str.sym.33)
  %t5003 = call i64 @rt_make_string(ptr @.str.lit.34, i64 33)
  %t5004 = load i64, ptr @"scheme.base:error"
  %t5005 = and i64 %t5004, -8
  %t5006 = inttoptr i64 %t5005 to ptr
  %t5007 = load i64, ptr %t5006
  %t5008 = inttoptr i64 %t5007 to ptr
  %t5009 = musttail call fastcc i64 %t5008(i64 %t5004, i64 2, i64 %t5002, i64 %t5003, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5009
}

define fastcc i64 @"scheme.base:code:get-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5014 = icmp eq i64 %argc, 1
  br i1 %t5014, label %argok1348, label %arityerr1347
arityerr1347:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1348:
  %t5015 = load i64, ptr @"scheme.base:output-port?"
  %t5016 = and i64 %t5015, -8
  %t5017 = inttoptr i64 %t5016 to ptr
  %t5018 = load i64, ptr %t5017
  %t5019 = inttoptr i64 %t5018 to ptr
  %t5020 = call fastcc i64%t5019(i64 %t5015, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5021 = call i64 @rt_not(i64 %t5020)
  %t5022 = icmp ne i64 %t5021, 1
  br i1 %t5022, label %then1349, label %else1350
then1349:
  %t5023 = call i64 @rt_intern(ptr @.str.sym.35)
  %t5024 = call i64 @rt_make_string(ptr @.str.lit.36, i64 18)
  %t5025 = load i64, ptr @"scheme.base:error"
  %t5026 = and i64 %t5025, -8
  %t5027 = inttoptr i64 %t5026 to ptr
  %t5028 = load i64, ptr %t5027
  %t5029 = inttoptr i64 %t5028 to ptr
  %t5030 = musttail call fastcc i64 %t5029(i64 %t5025, i64 3, i64 %t5023, i64 %t5024, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5030
else1350:
  %t5031 = call i64 @rt_record_ref(i64 %a0, i64 32)
  %t5032 = call i64 @rt_not(i64 %t5031)
  %t5033 = icmp ne i64 %t5032, 1
  br i1 %t5033, label %then1351, label %else1352
then1351:
  %t5034 = call i64 @rt_intern(ptr @.str.sym.35)
  %t5035 = call i64 @rt_make_string(ptr @.str.lit.37, i64 17)
  %t5036 = load i64, ptr @"scheme.base:error"
  %t5037 = and i64 %t5036, -8
  %t5038 = inttoptr i64 %t5037 to ptr
  %t5039 = load i64, ptr %t5038
  %t5040 = inttoptr i64 %t5039 to ptr
  %t5041 = musttail call fastcc i64 %t5040(i64 %t5036, i64 3, i64 %t5034, i64 %t5035, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5041
else1352:
  %t5042 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t5043 = call i64 @rt_port_get_output_string(i64 %t5042)
  ret i64 %t5043
}

define fastcc i64 @"scheme.base:code:flush-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5048 = icmp eq i64 %argc, 1
  br i1 %t5048, label %argok1354, label %arityerr1353
arityerr1353:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1354:
  %t5049 = call i64 @rt_intern(ptr @.str.sym.38)
  %t5050 = load i64, ptr @"scheme.base:%check-output-port"
  %t5051 = and i64 %t5050, -8
  %t5052 = inttoptr i64 %t5051 to ptr
  %t5053 = load i64, ptr %t5052
  %t5054 = inttoptr i64 %t5053 to ptr
  %t5055 = call fastcc i64%t5054(i64 %t5050, i64 2, i64 %a0, i64 %t5049, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5056 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t5057 = call i64 @rt_port_flush(i64 %t5056)
  ret i64 %t5057
}

define fastcc i64 @"scheme.base:code:close-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5062 = icmp eq i64 %argc, 1
  br i1 %t5062, label %argok1356, label %arityerr1355
arityerr1355:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1356:
  %t5063 = load i64, ptr @"scheme.base:port?"
  %t5064 = and i64 %t5063, -8
  %t5065 = inttoptr i64 %t5064 to ptr
  %t5066 = load i64, ptr %t5065
  %t5067 = inttoptr i64 %t5066 to ptr
  %t5068 = call fastcc i64%t5067(i64 %t5063, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5069 = call i64 @rt_not(i64 %t5068)
  %t5070 = icmp ne i64 %t5069, 1
  br i1 %t5070, label %then1357, label %else1358
then1357:
  %t5071 = call i64 @rt_intern(ptr @.str.sym.39)
  %t5072 = call i64 @rt_make_string(ptr @.str.lit.40, i64 10)
  %t5073 = load i64, ptr @"scheme.base:error"
  %t5074 = and i64 %t5073, -8
  %t5075 = inttoptr i64 %t5074 to ptr
  %t5076 = load i64, ptr %t5075
  %t5077 = inttoptr i64 %t5076 to ptr
  %t5078 = musttail call fastcc i64 %t5077(i64 %t5073, i64 3, i64 %t5071, i64 %t5072, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5078
else1358:
  %t5079 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t5080 = icmp ne i64 %t5079, 1
  br i1 %t5080, label %then1359, label %else1360
then1359:
  %t5081 = icmp ne i64 1, 1
  br i1 %t5081, label %then1361, label %else1362
then1361:
  ret i64 1
else1362:
  ret i64 17
else1360:
  %t5082 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t5083 = call i64 @rt_not(i64 %t5082)
  %t5084 = icmp ne i64 %t5083, 1
  br i1 %t5084, label %then1363, label %else1364
then1363:
  %t5085 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t5086 = call i64 @rt_port_close(i64 %t5085)
  br label %merge1365
else1364:
  br label %merge1365
merge1365:
  %t5087 = phi i64 [ %t5086, %then1363 ], [ 17, %else1364 ]
  %t5088 = call i64 @rt_record_set(i64 %a0, i64 40, i64 257)
  %t5089 = icmp ne i64 1, 1
  br i1 %t5089, label %then1366, label %else1367
then1366:
  ret i64 1
else1367:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:close-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5094 = icmp eq i64 %argc, 1
  br i1 %t5094, label %argok1369, label %arityerr1368
arityerr1368:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1369:
  %t5095 = load i64, ptr @"scheme.base:input-port?"
  %t5096 = and i64 %t5095, -8
  %t5097 = inttoptr i64 %t5096 to ptr
  %t5098 = load i64, ptr %t5097
  %t5099 = inttoptr i64 %t5098 to ptr
  %t5100 = call fastcc i64%t5099(i64 %t5095, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5101 = icmp ne i64 %t5100, 1
  br i1 %t5101, label %then1370, label %else1371
then1370:
  %t5102 = load i64, ptr @"scheme.base:close-port"
  %t5103 = and i64 %t5102, -8
  %t5104 = inttoptr i64 %t5103 to ptr
  %t5105 = load i64, ptr %t5104
  %t5106 = inttoptr i64 %t5105 to ptr
  %t5107 = musttail call fastcc i64 %t5106(i64 %t5102, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5107
else1371:
  %t5108 = call i64 @rt_intern(ptr @.str.sym.41)
  %t5109 = call i64 @rt_make_string(ptr @.str.lit.42, i64 17)
  %t5110 = load i64, ptr @"scheme.base:error"
  %t5111 = and i64 %t5110, -8
  %t5112 = inttoptr i64 %t5111 to ptr
  %t5113 = load i64, ptr %t5112
  %t5114 = inttoptr i64 %t5113 to ptr
  %t5115 = musttail call fastcc i64 %t5114(i64 %t5110, i64 3, i64 %t5108, i64 %t5109, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5115
}

define fastcc i64 @"scheme.base:code:close-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5120 = icmp eq i64 %argc, 1
  br i1 %t5120, label %argok1373, label %arityerr1372
arityerr1372:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1373:
  %t5121 = load i64, ptr @"scheme.base:output-port?"
  %t5122 = and i64 %t5121, -8
  %t5123 = inttoptr i64 %t5122 to ptr
  %t5124 = load i64, ptr %t5123
  %t5125 = inttoptr i64 %t5124 to ptr
  %t5126 = call fastcc i64%t5125(i64 %t5121, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5127 = icmp ne i64 %t5126, 1
  br i1 %t5127, label %then1374, label %else1375
then1374:
  %t5128 = load i64, ptr @"scheme.base:close-port"
  %t5129 = and i64 %t5128, -8
  %t5130 = inttoptr i64 %t5129 to ptr
  %t5131 = load i64, ptr %t5130
  %t5132 = inttoptr i64 %t5131 to ptr
  %t5133 = musttail call fastcc i64 %t5132(i64 %t5128, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5133
else1375:
  %t5134 = call i64 @rt_intern(ptr @.str.sym.43)
  %t5135 = call i64 @rt_make_string(ptr @.str.lit.44, i64 18)
  %t5136 = load i64, ptr @"scheme.base:error"
  %t5137 = and i64 %t5136, -8
  %t5138 = inttoptr i64 %t5137 to ptr
  %t5139 = load i64, ptr %t5138
  %t5140 = inttoptr i64 %t5139 to ptr
  %t5141 = musttail call fastcc i64 %t5140(i64 %t5136, i64 3, i64 %t5134, i64 %t5135, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5141
}

define fastcc i64 @"scheme.base:code:current-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5149 = icmp sge i64 %argc, 0
  br i1 %t5149, label %argok1377, label %arityerr1376
arityerr1376:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1377:
  %t5150 = call ptr @rt_alloc_words(i64 8)
  %t5151 = getelementptr i64, ptr %t5150, i64 0
  store i64 %a0, ptr %t5151
  %t5152 = getelementptr i64, ptr %t5150, i64 1
  store i64 %a1, ptr %t5152
  %t5153 = getelementptr i64, ptr %t5150, i64 2
  store i64 %a2, ptr %t5153
  %t5154 = getelementptr i64, ptr %t5150, i64 3
  store i64 %a3, ptr %t5154
  %t5155 = getelementptr i64, ptr %t5150, i64 4
  store i64 %a4, ptr %t5155
  %t5156 = getelementptr i64, ptr %t5150, i64 5
  store i64 %a5, ptr %t5156
  %t5157 = getelementptr i64, ptr %t5150, i64 6
  store i64 %a6, ptr %t5157
  %t5158 = getelementptr i64, ptr %t5150, i64 7
  store i64 %a7, ptr %t5158
  %t5159 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t5150, ptr %overflow)
  %t5160 = call i64 @rt_null_p(i64 %t5159)
  %t5161 = icmp ne i64 %t5160, 1
  br i1 %t5161, label %then1378, label %else1379
then1378:
  %t5162 = load i64, ptr @"scheme.base:%stdout-port"
  %t5163 = call i64 @rt_not(i64 %t5162)
  %t5164 = icmp ne i64 %t5163, 1
  br i1 %t5164, label %then1380, label %else1381
then1380:
  %t5165 = load i64, ptr @"scheme.base:%make-port"
  %t5166 = and i64 %t5165, -8
  %t5167 = inttoptr i64 %t5166 to ptr
  %t5168 = load i64, ptr %t5167
  %t5169 = inttoptr i64 %t5168 to ptr
  %t5170 = call fastcc i64%t5169(i64 %t5165, i64 6, i64 0, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t5171 = call i64 @rt_root(i64 %t5170)
  store i64 %t5171, ptr @"scheme.base:%stdout-port"
  %t5172 = call i64 @rt_set_current_output(i64 0)
  br label %merge1382
else1381:
  br label %merge1382
merge1382:
  %t5173 = phi i64 [ %t5172, %then1380 ], [ 17, %else1381 ]
  %t5174 = load i64, ptr @"scheme.base:%stdout-port"
  ret i64 %t5174
else1379:
  %t5175 = call i64 @rt_car(i64 %t5159)
  %t5176 = call i64 @rt_root(i64 %t5175)
  store i64 %t5176, ptr @"scheme.base:%stdout-port"
  %t5177 = call i64 @rt_record_ref(i64 %t5175, i64 0)
  %t5178 = call i64 @rt_set_current_output(i64 %t5177)
  %t5179 = icmp ne i64 1, 1
  br i1 %t5179, label %then1383, label %else1384
then1383:
  ret i64 1
else1384:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-error-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5184 = icmp sge i64 %argc, 0
  br i1 %t5184, label %argok1386, label %arityerr1385
arityerr1385:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1386:
  %t5185 = call ptr @rt_alloc_words(i64 8)
  %t5186 = getelementptr i64, ptr %t5185, i64 0
  store i64 %a0, ptr %t5186
  %t5187 = getelementptr i64, ptr %t5185, i64 1
  store i64 %a1, ptr %t5187
  %t5188 = getelementptr i64, ptr %t5185, i64 2
  store i64 %a2, ptr %t5188
  %t5189 = getelementptr i64, ptr %t5185, i64 3
  store i64 %a3, ptr %t5189
  %t5190 = getelementptr i64, ptr %t5185, i64 4
  store i64 %a4, ptr %t5190
  %t5191 = getelementptr i64, ptr %t5185, i64 5
  store i64 %a5, ptr %t5191
  %t5192 = getelementptr i64, ptr %t5185, i64 6
  store i64 %a6, ptr %t5192
  %t5193 = getelementptr i64, ptr %t5185, i64 7
  store i64 %a7, ptr %t5193
  %t5194 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t5185, ptr %overflow)
  %t5195 = call i64 @rt_null_p(i64 %t5194)
  %t5196 = icmp ne i64 %t5195, 1
  br i1 %t5196, label %then1387, label %else1388
then1387:
  %t5197 = load i64, ptr @"scheme.base:%stderr-port"
  %t5198 = call i64 @rt_not(i64 %t5197)
  %t5199 = icmp ne i64 %t5198, 1
  br i1 %t5199, label %then1389, label %else1390
then1389:
  %t5200 = load i64, ptr @"scheme.base:%make-port"
  %t5201 = and i64 %t5200, -8
  %t5202 = inttoptr i64 %t5201 to ptr
  %t5203 = load i64, ptr %t5202
  %t5204 = inttoptr i64 %t5203 to ptr
  %t5205 = call fastcc i64%t5204(i64 %t5200, i64 6, i64 8, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t5206 = call i64 @rt_root(i64 %t5205)
  store i64 %t5206, ptr @"scheme.base:%stderr-port"
  br label %merge1391
else1390:
  br label %merge1391
merge1391:
  %t5207 = phi i64 [ 17, %then1389 ], [ 17, %else1390 ]
  %t5208 = load i64, ptr @"scheme.base:%stderr-port"
  ret i64 %t5208
else1388:
  %t5209 = call i64 @rt_car(i64 %t5194)
  %t5210 = call i64 @rt_root(i64 %t5209)
  store i64 %t5210, ptr @"scheme.base:%stderr-port"
  %t5211 = icmp ne i64 1, 1
  br i1 %t5211, label %then1392, label %else1393
then1392:
  ret i64 1
else1393:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5216 = icmp sge i64 %argc, 0
  br i1 %t5216, label %argok1395, label %arityerr1394
arityerr1394:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1395:
  %t5217 = call ptr @rt_alloc_words(i64 8)
  %t5218 = getelementptr i64, ptr %t5217, i64 0
  store i64 %a0, ptr %t5218
  %t5219 = getelementptr i64, ptr %t5217, i64 1
  store i64 %a1, ptr %t5219
  %t5220 = getelementptr i64, ptr %t5217, i64 2
  store i64 %a2, ptr %t5220
  %t5221 = getelementptr i64, ptr %t5217, i64 3
  store i64 %a3, ptr %t5221
  %t5222 = getelementptr i64, ptr %t5217, i64 4
  store i64 %a4, ptr %t5222
  %t5223 = getelementptr i64, ptr %t5217, i64 5
  store i64 %a5, ptr %t5223
  %t5224 = getelementptr i64, ptr %t5217, i64 6
  store i64 %a6, ptr %t5224
  %t5225 = getelementptr i64, ptr %t5217, i64 7
  store i64 %a7, ptr %t5225
  %t5226 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t5217, ptr %overflow)
  %t5227 = call i64 @rt_null_p(i64 %t5226)
  %t5228 = icmp ne i64 %t5227, 1
  br i1 %t5228, label %then1396, label %else1397
then1396:
  %t5229 = load i64, ptr @"scheme.base:%stdin-port"
  %t5230 = call i64 @rt_not(i64 %t5229)
  %t5231 = icmp ne i64 %t5230, 1
  br i1 %t5231, label %then1398, label %else1399
then1398:
  %t5232 = load i64, ptr @"scheme.base:%make-port"
  %t5233 = and i64 %t5232, -8
  %t5234 = inttoptr i64 %t5233 to ptr
  %t5235 = load i64, ptr %t5234
  %t5236 = inttoptr i64 %t5235 to ptr
  %t5237 = call fastcc i64%t5236(i64 %t5232, i64 6, i64 1, i64 257, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t5238 = call i64 @rt_root(i64 %t5237)
  store i64 %t5238, ptr @"scheme.base:%stdin-port"
  br label %merge1400
else1399:
  br label %merge1400
merge1400:
  %t5239 = phi i64 [ 17, %then1398 ], [ 17, %else1399 ]
  %t5240 = load i64, ptr @"scheme.base:%stdin-port"
  ret i64 %t5240
else1397:
  %t5241 = call i64 @rt_car(i64 %t5226)
  %t5242 = call i64 @rt_root(i64 %t5241)
  store i64 %t5242, ptr @"scheme.base:%stdin-port"
  %t5243 = icmp ne i64 1, 1
  br i1 %t5243, label %then1401, label %else1402
then1401:
  ret i64 1
else1402:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_1103"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5248 = icmp eq i64 %argc, 0
  br i1 %t5248, label %argok1404, label %arityerr1403
arityerr1403:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1404:
  %t5249 = icmp ne i64 1, 1
  br i1 %t5249, label %then1405, label %else1406
then1405:
  ret i64 1
else1406:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_1105"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5250 = icmp eq i64 %argc, 0
  br i1 %t5250, label %argok1408, label %arityerr1407
arityerr1407:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1408:
  %t5251 = and i64 %self, -8
  %t5252 = inttoptr i64 %t5251 to ptr
  %t5253 = getelementptr i64, ptr %t5252, i64 2
  %t5254 = load i64, ptr %t5253
  %t5255 = and i64 %self, -8
  %t5256 = inttoptr i64 %t5255 to ptr
  %t5257 = getelementptr i64, ptr %t5256, i64 1
  %t5258 = load i64, ptr %t5257
  %t5259 = and i64 %t5258, -8
  %t5260 = inttoptr i64 %t5259 to ptr
  %t5261 = load i64, ptr %t5260
  %t5262 = inttoptr i64 %t5261 to ptr
  %t5263 = musttail call fastcc i64 %t5262(i64 %t5258, i64 1, i64 %t5254, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5263
}

define fastcc i64 @"scheme.base:code_1107"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5264 = icmp eq i64 %argc, 0
  br i1 %t5264, label %argok1410, label %arityerr1409
arityerr1409:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1410:
  %t5265 = and i64 %self, -8
  %t5266 = inttoptr i64 %t5265 to ptr
  %t5267 = getelementptr i64, ptr %t5266, i64 1
  %t5268 = load i64, ptr %t5267
  %t5269 = load i64, ptr @"scheme.base:close-port"
  %t5270 = and i64 %t5269, -8
  %t5271 = inttoptr i64 %t5270 to ptr
  %t5272 = load i64, ptr %t5271
  %t5273 = inttoptr i64 %t5272 to ptr
  %t5274 = musttail call fastcc i64 %t5273(i64 %t5269, i64 1, i64 %t5268, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5274
}

define fastcc i64 @"scheme.base:code:call-with-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5275 = icmp eq i64 %argc, 2
  br i1 %t5275, label %argok1412, label %arityerr1411
arityerr1411:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1412:
  %t5276 = call ptr @rt_alloc_words(i64 1)
  %t5277 = ptrtoint ptr %t5276 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1103" to i64), ptr %t5276
  %t5278 = or i64 %t5277, 4
  %t5279 = call ptr @rt_alloc_words(i64 3)
  %t5280 = ptrtoint ptr %t5279 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1105" to i64), ptr %t5279
  %t5281 = getelementptr i64, ptr %t5279, i64 1
  store i64 %a1, ptr %t5281
  %t5282 = getelementptr i64, ptr %t5279, i64 2
  store i64 %a0, ptr %t5282
  %t5283 = or i64 %t5280, 4
  %t5284 = call ptr @rt_alloc_words(i64 2)
  %t5285 = ptrtoint ptr %t5284 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1107" to i64), ptr %t5284
  %t5286 = getelementptr i64, ptr %t5284, i64 1
  store i64 %a0, ptr %t5286
  %t5287 = or i64 %t5285, 4
  %t5288 = load i64, ptr @"scheme.base:dynamic-wind"
  %t5289 = and i64 %t5288, -8
  %t5290 = inttoptr i64 %t5289 to ptr
  %t5291 = load i64, ptr %t5290
  %t5292 = inttoptr i64 %t5291 to ptr
  %t5293 = musttail call fastcc i64 %t5292(i64 %t5288, i64 3, i64 %t5278, i64 %t5283, i64 %t5287, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5293
}

define fastcc i64 @"scheme.base:code_1114"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5298 = icmp eq i64 %argc, 0
  br i1 %t5298, label %argok1414, label %arityerr1413
arityerr1413:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1414:
  %t5299 = and i64 %self, -8
  %t5300 = inttoptr i64 %t5299 to ptr
  %t5301 = getelementptr i64, ptr %t5300, i64 1
  %t5302 = load i64, ptr %t5301
  %t5303 = load i64, ptr @"scheme.base:current-output-port"
  %t5304 = and i64 %t5303, -8
  %t5305 = inttoptr i64 %t5304 to ptr
  %t5306 = load i64, ptr %t5305
  %t5307 = inttoptr i64 %t5306 to ptr
  %t5308 = musttail call fastcc i64 %t5307(i64 %t5303, i64 1, i64 %t5302, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5308
}

define fastcc i64 @"scheme.base:code_1116"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5309 = icmp eq i64 %argc, 0
  br i1 %t5309, label %argok1416, label %arityerr1415
arityerr1415:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1416:
  %t5310 = and i64 %self, -8
  %t5311 = inttoptr i64 %t5310 to ptr
  %t5312 = getelementptr i64, ptr %t5311, i64 1
  %t5313 = load i64, ptr %t5312
  %t5314 = load i64, ptr @"scheme.base:current-output-port"
  %t5315 = and i64 %t5314, -8
  %t5316 = inttoptr i64 %t5315 to ptr
  %t5317 = load i64, ptr %t5316
  %t5318 = inttoptr i64 %t5317 to ptr
  %t5319 = call fastcc i64%t5318(i64 %t5314, i64 2, i64 %t5313, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5320 = and i64 %self, -8
  %t5321 = inttoptr i64 %t5320 to ptr
  %t5322 = getelementptr i64, ptr %t5321, i64 2
  %t5323 = load i64, ptr %t5322
  %t5324 = load i64, ptr @"scheme.base:close-port"
  %t5325 = and i64 %t5324, -8
  %t5326 = inttoptr i64 %t5325 to ptr
  %t5327 = load i64, ptr %t5326
  %t5328 = inttoptr i64 %t5327 to ptr
  %t5329 = musttail call fastcc i64 %t5328(i64 %t5324, i64 1, i64 %t5323, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5329
}

define fastcc i64 @"scheme.base:code:with-output-to-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5330 = icmp eq i64 %argc, 2
  br i1 %t5330, label %argok1418, label %arityerr1417
arityerr1417:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1418:
  %t5331 = load i64, ptr @"scheme.base:open-output-file"
  %t5332 = and i64 %t5331, -8
  %t5333 = inttoptr i64 %t5332 to ptr
  %t5334 = load i64, ptr %t5333
  %t5335 = inttoptr i64 %t5334 to ptr
  %t5336 = call fastcc i64%t5335(i64 %t5331, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5337 = load i64, ptr @"scheme.base:current-output-port"
  %t5338 = and i64 %t5337, -8
  %t5339 = inttoptr i64 %t5338 to ptr
  %t5340 = load i64, ptr %t5339
  %t5341 = inttoptr i64 %t5340 to ptr
  %t5342 = call fastcc i64%t5341(i64 %t5337, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5343 = call ptr @rt_alloc_words(i64 2)
  %t5344 = ptrtoint ptr %t5343 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1114" to i64), ptr %t5343
  %t5345 = getelementptr i64, ptr %t5343, i64 1
  store i64 %t5336, ptr %t5345
  %t5346 = or i64 %t5344, 4
  %t5347 = call ptr @rt_alloc_words(i64 3)
  %t5348 = ptrtoint ptr %t5347 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1116" to i64), ptr %t5347
  %t5349 = getelementptr i64, ptr %t5347, i64 1
  store i64 %t5342, ptr %t5349
  %t5350 = getelementptr i64, ptr %t5347, i64 2
  store i64 %t5336, ptr %t5350
  %t5351 = or i64 %t5348, 4
  %t5352 = load i64, ptr @"scheme.base:dynamic-wind"
  %t5353 = and i64 %t5352, -8
  %t5354 = inttoptr i64 %t5353 to ptr
  %t5355 = load i64, ptr %t5354
  %t5356 = inttoptr i64 %t5355 to ptr
  %t5357 = musttail call fastcc i64 %t5356(i64 %t5352, i64 3, i64 %t5346, i64 %a1, i64 %t5351, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5357
}

define fastcc i64 @"scheme.base:code_1123"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5362 = icmp eq i64 %argc, 0
  br i1 %t5362, label %argok1420, label %arityerr1419
arityerr1419:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1420:
  %t5363 = and i64 %self, -8
  %t5364 = inttoptr i64 %t5363 to ptr
  %t5365 = getelementptr i64, ptr %t5364, i64 1
  %t5366 = load i64, ptr %t5365
  %t5367 = load i64, ptr @"scheme.base:current-input-port"
  %t5368 = and i64 %t5367, -8
  %t5369 = inttoptr i64 %t5368 to ptr
  %t5370 = load i64, ptr %t5369
  %t5371 = inttoptr i64 %t5370 to ptr
  %t5372 = musttail call fastcc i64 %t5371(i64 %t5367, i64 1, i64 %t5366, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5372
}

define fastcc i64 @"scheme.base:code_1125"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5373 = icmp eq i64 %argc, 0
  br i1 %t5373, label %argok1422, label %arityerr1421
arityerr1421:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1422:
  %t5374 = and i64 %self, -8
  %t5375 = inttoptr i64 %t5374 to ptr
  %t5376 = getelementptr i64, ptr %t5375, i64 1
  %t5377 = load i64, ptr %t5376
  %t5378 = load i64, ptr @"scheme.base:current-input-port"
  %t5379 = and i64 %t5378, -8
  %t5380 = inttoptr i64 %t5379 to ptr
  %t5381 = load i64, ptr %t5380
  %t5382 = inttoptr i64 %t5381 to ptr
  %t5383 = call fastcc i64%t5382(i64 %t5378, i64 2, i64 %t5377, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5384 = and i64 %self, -8
  %t5385 = inttoptr i64 %t5384 to ptr
  %t5386 = getelementptr i64, ptr %t5385, i64 2
  %t5387 = load i64, ptr %t5386
  %t5388 = load i64, ptr @"scheme.base:close-port"
  %t5389 = and i64 %t5388, -8
  %t5390 = inttoptr i64 %t5389 to ptr
  %t5391 = load i64, ptr %t5390
  %t5392 = inttoptr i64 %t5391 to ptr
  %t5393 = musttail call fastcc i64 %t5392(i64 %t5388, i64 1, i64 %t5387, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5393
}

define fastcc i64 @"scheme.base:code:with-input-from-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5394 = icmp eq i64 %argc, 2
  br i1 %t5394, label %argok1424, label %arityerr1423
arityerr1423:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1424:
  %t5395 = load i64, ptr @"scheme.base:open-input-file"
  %t5396 = and i64 %t5395, -8
  %t5397 = inttoptr i64 %t5396 to ptr
  %t5398 = load i64, ptr %t5397
  %t5399 = inttoptr i64 %t5398 to ptr
  %t5400 = call fastcc i64%t5399(i64 %t5395, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5401 = load i64, ptr @"scheme.base:current-input-port"
  %t5402 = and i64 %t5401, -8
  %t5403 = inttoptr i64 %t5402 to ptr
  %t5404 = load i64, ptr %t5403
  %t5405 = inttoptr i64 %t5404 to ptr
  %t5406 = call fastcc i64%t5405(i64 %t5401, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5407 = call ptr @rt_alloc_words(i64 2)
  %t5408 = ptrtoint ptr %t5407 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1123" to i64), ptr %t5407
  %t5409 = getelementptr i64, ptr %t5407, i64 1
  store i64 %t5400, ptr %t5409
  %t5410 = or i64 %t5408, 4
  %t5411 = call ptr @rt_alloc_words(i64 3)
  %t5412 = ptrtoint ptr %t5411 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1125" to i64), ptr %t5411
  %t5413 = getelementptr i64, ptr %t5411, i64 1
  store i64 %t5406, ptr %t5413
  %t5414 = getelementptr i64, ptr %t5411, i64 2
  store i64 %t5400, ptr %t5414
  %t5415 = or i64 %t5412, 4
  %t5416 = load i64, ptr @"scheme.base:dynamic-wind"
  %t5417 = and i64 %t5416, -8
  %t5418 = inttoptr i64 %t5417 to ptr
  %t5419 = load i64, ptr %t5418
  %t5420 = inttoptr i64 %t5419 to ptr
  %t5421 = musttail call fastcc i64 %t5420(i64 %t5416, i64 3, i64 %t5410, i64 %a1, i64 %t5415, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5421
}

define fastcc i64 @"scheme.base:code:call-with-output-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5426 = icmp eq i64 %argc, 2
  br i1 %t5426, label %argok1426, label %arityerr1425
arityerr1425:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1426:
  %t5427 = load i64, ptr @"scheme.base:open-output-file"
  %t5428 = and i64 %t5427, -8
  %t5429 = inttoptr i64 %t5428 to ptr
  %t5430 = load i64, ptr %t5429
  %t5431 = inttoptr i64 %t5430 to ptr
  %t5432 = call fastcc i64%t5431(i64 %t5427, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5433 = load i64, ptr @"scheme.base:call-with-port"
  %t5434 = and i64 %t5433, -8
  %t5435 = inttoptr i64 %t5434 to ptr
  %t5436 = load i64, ptr %t5435
  %t5437 = inttoptr i64 %t5436 to ptr
  %t5438 = musttail call fastcc i64 %t5437(i64 %t5433, i64 2, i64 %t5432, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5438
}

define fastcc i64 @"scheme.base:code:call-with-input-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5443 = icmp eq i64 %argc, 2
  br i1 %t5443, label %argok1428, label %arityerr1427
arityerr1427:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1428:
  %t5444 = load i64, ptr @"scheme.base:open-input-file"
  %t5445 = and i64 %t5444, -8
  %t5446 = inttoptr i64 %t5445 to ptr
  %t5447 = load i64, ptr %t5446
  %t5448 = inttoptr i64 %t5447 to ptr
  %t5449 = call fastcc i64%t5448(i64 %t5444, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5450 = load i64, ptr @"scheme.base:call-with-port"
  %t5451 = and i64 %t5450, -8
  %t5452 = inttoptr i64 %t5451 to ptr
  %t5453 = load i64, ptr %t5452
  %t5454 = inttoptr i64 %t5453 to ptr
  %t5455 = musttail call fastcc i64 %t5454(i64 %t5450, i64 2, i64 %t5449, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5455
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
  %t893 = call ptr @rt_alloc_words(i64 1)
  %t894 = ptrtoint ptr %t893 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:max" to i64), ptr %t893
  %t895 = or i64 %t894, 4
  %t896 = call i64 @rt_root(i64 %t895)
  store i64 %t896, ptr @"scheme.base:max"
  ret i64 17
}

define i64 @"scheme.base:__init_44"() {
entry:
  %t899 = call ptr @rt_alloc_words(i64 1)
  %t900 = ptrtoint ptr %t899 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:void" to i64), ptr %t899
  %t901 = or i64 %t900, 4
  %t902 = call i64 @rt_root(i64 %t901)
  store i64 %t902, ptr @"scheme.base:void"
  ret i64 17
}

define i64 @"scheme.base:__init_45"() {
entry:
  %t915 = call ptr @rt_alloc_words(i64 1)
  %t916 = ptrtoint ptr %t915 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string" to i64), ptr %t915
  %t917 = or i64 %t916, 4
  %t918 = call i64 @rt_root(i64 %t917)
  store i64 %t918, ptr @"scheme.base:string"
  ret i64 17
}

define i64 @"scheme.base:__init_46"() {
entry:
  %t932 = call ptr @rt_alloc_words(i64 1)
  %t933 = ptrtoint ptr %t932 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%str-concat" to i64), ptr %t932
  %t934 = or i64 %t933, 4
  %t935 = call i64 @rt_root(i64 %t934)
  store i64 %t935, ptr @"scheme.base:%str-concat"
  ret i64 17
}

define i64 @"scheme.base:__init_47"() {
entry:
  %t955 = call ptr @rt_alloc_words(i64 1)
  %t956 = ptrtoint ptr %t955 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:chr-cmp" to i64), ptr %t955
  %t957 = or i64 %t956, 4
  %t958 = call i64 @rt_root(i64 %t957)
  store i64 %t958, ptr @"scheme.base:chr-cmp"
  ret i64 17
}

define i64 @"scheme.base:__init_48"() {
entry:
  %t987 = call ptr @rt_alloc_words(i64 1)
  %t988 = ptrtoint ptr %t987 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char=?" to i64), ptr %t987
  %t989 = or i64 %t988, 4
  %t990 = call i64 @rt_root(i64 %t989)
  store i64 %t990, ptr @"scheme.base:char=?"
  ret i64 17
}

define i64 @"scheme.base:__init_49"() {
entry:
  %t1019 = call ptr @rt_alloc_words(i64 1)
  %t1020 = ptrtoint ptr %t1019 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char<?" to i64), ptr %t1019
  %t1021 = or i64 %t1020, 4
  %t1022 = call i64 @rt_root(i64 %t1021)
  store i64 %t1022, ptr @"scheme.base:char<?"
  ret i64 17
}

define i64 @"scheme.base:__init_50"() {
entry:
  %t1051 = call ptr @rt_alloc_words(i64 1)
  %t1052 = ptrtoint ptr %t1051 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char>?" to i64), ptr %t1051
  %t1053 = or i64 %t1052, 4
  %t1054 = call i64 @rt_root(i64 %t1053)
  store i64 %t1054, ptr @"scheme.base:char>?"
  ret i64 17
}

define i64 @"scheme.base:__init_51"() {
entry:
  %t1091 = call ptr @rt_alloc_words(i64 1)
  %t1092 = ptrtoint ptr %t1091 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char<=?" to i64), ptr %t1091
  %t1093 = or i64 %t1092, 4
  %t1094 = call i64 @rt_root(i64 %t1093)
  store i64 %t1094, ptr @"scheme.base:char<=?"
  ret i64 17
}

define i64 @"scheme.base:__init_52"() {
entry:
  %t1131 = call ptr @rt_alloc_words(i64 1)
  %t1132 = ptrtoint ptr %t1131 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char>=?" to i64), ptr %t1131
  %t1133 = or i64 %t1132, 4
  %t1134 = call i64 @rt_root(i64 %t1133)
  store i64 %t1134, ptr @"scheme.base:char>=?"
  ret i64 17
}

define i64 @"scheme.base:__init_53"() {
entry:
  %t1175 = call ptr @rt_alloc_words(i64 1)
  %t1176 = ptrtoint ptr %t1175 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string->list" to i64), ptr %t1175
  %t1177 = or i64 %t1176, 4
  %t1178 = call i64 @rt_root(i64 %t1177)
  store i64 %t1178, ptr @"scheme.base:string->list"
  ret i64 17
}

define i64 @"scheme.base:__init_54"() {
entry:
  %t1215 = call ptr @rt_alloc_words(i64 1)
  %t1216 = ptrtoint ptr %t1215 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:ns-digits" to i64), ptr %t1215
  %t1217 = or i64 %t1216, 4
  %t1218 = call i64 @rt_root(i64 %t1217)
  store i64 %t1218, ptr @"scheme.base:ns-digits"
  ret i64 17
}

define i64 @"scheme.base:__init_55"() {
entry:
  %t1263 = call ptr @rt_alloc_words(i64 1)
  %t1264 = ptrtoint ptr %t1263 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:number->string" to i64), ptr %t1263
  %t1265 = or i64 %t1264, 4
  %t1266 = call i64 @rt_root(i64 %t1265)
  store i64 %t1266, ptr @"scheme.base:number->string"
  ret i64 17
}

define i64 @"scheme.base:__init_56"() {
entry:
  %t1300 = call ptr @rt_alloc_words(i64 1)
  %t1301 = ptrtoint ptr %t1300 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error" to i64), ptr %t1300
  %t1302 = or i64 %t1301, 4
  %t1303 = call i64 @rt_root(i64 %t1302)
  store i64 %t1303, ptr @"scheme.base:error"
  ret i64 17
}

define i64 @"scheme.base:__init_57"() {
entry:
  %t1304 = call i64 @rt_root(i64 2)
  store i64 %t1304, ptr @"scheme.base:*winds*"
  ret i64 17
}

define i64 @"scheme.base:__init_58"() {
entry:
  %t1305 = call i64 @rt_root(i64 2)
  store i64 %t1305, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define i64 @"scheme.base:__init_59"() {
entry:
  %t1330 = call ptr @rt_alloc_words(i64 1)
  %t1331 = ptrtoint ptr %t1330 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%unwind-to" to i64), ptr %t1330
  %t1332 = or i64 %t1331, 4
  %t1333 = call i64 @rt_root(i64 %t1332)
  store i64 %t1333, ptr @"scheme.base:%unwind-to"
  ret i64 17
}

define i64 @"scheme.base:__init_60"() {
entry:
  %t1357 = call ptr @rt_alloc_words(i64 1)
  %t1358 = ptrtoint ptr %t1357 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:dynamic-wind" to i64), ptr %t1357
  %t1359 = or i64 %t1358, 4
  %t1360 = call i64 @rt_root(i64 %t1359)
  store i64 %t1360, ptr @"scheme.base:dynamic-wind"
  ret i64 17
}

define i64 @"scheme.base:__init_61"() {
entry:
  %t1421 = call ptr @rt_alloc_words(i64 1)
  %t1422 = ptrtoint ptr %t1421 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-current-continuation" to i64), ptr %t1421
  %t1423 = or i64 %t1422, 4
  %t1424 = call i64 @rt_root(i64 %t1423)
  store i64 %t1424, ptr @"scheme.base:call-with-current-continuation"
  ret i64 17
}

define i64 @"scheme.base:__init_62"() {
entry:
  %t1432 = call ptr @rt_alloc_words(i64 1)
  %t1433 = ptrtoint ptr %t1432 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call/cc" to i64), ptr %t1432
  %t1434 = or i64 %t1433, 4
  %t1435 = call i64 @rt_root(i64 %t1434)
  store i64 %t1435, ptr @"scheme.base:call/cc"
  ret i64 17
}

define i64 @"scheme.base:__init_63"() {
entry:
  %t1470 = call ptr @rt_alloc_words(i64 1)
  %t1471 = ptrtoint ptr %t1470 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%with-handler" to i64), ptr %t1470
  %t1472 = or i64 %t1471, 4
  %t1473 = call i64 @rt_root(i64 %t1472)
  store i64 %t1473, ptr @"scheme.base:%with-handler"
  ret i64 17
}

define i64 @"scheme.base:__init_64"() {
entry:
  %t1492 = call ptr @rt_alloc_words(i64 1)
  %t1493 = ptrtoint ptr %t1492 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:raise" to i64), ptr %t1492
  %t1494 = or i64 %t1493, 4
  %t1495 = call i64 @rt_root(i64 %t1494)
  store i64 %t1495, ptr @"scheme.base:raise"
  ret i64 17
}

define i64 @"scheme.base:__init_65"() {
entry:
  %t1498 = call ptr @rt_alloc_words(i64 1)
  %t1499 = ptrtoint ptr %t1498 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object?" to i64), ptr %t1498
  %t1500 = or i64 %t1499, 4
  %t1501 = call i64 @rt_root(i64 %t1500)
  store i64 %t1501, ptr @"scheme.base:error-object?"
  ret i64 17
}

define i64 @"scheme.base:__init_66"() {
entry:
  %t1504 = call ptr @rt_alloc_words(i64 1)
  %t1505 = ptrtoint ptr %t1504 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-message" to i64), ptr %t1504
  %t1506 = or i64 %t1505, 4
  %t1507 = call i64 @rt_root(i64 %t1506)
  store i64 %t1507, ptr @"scheme.base:error-object-message"
  ret i64 17
}

define i64 @"scheme.base:__init_67"() {
entry:
  %t1510 = call ptr @rt_alloc_words(i64 1)
  %t1511 = ptrtoint ptr %t1510 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-irritants" to i64), ptr %t1510
  %t1512 = or i64 %t1511, 4
  %t1513 = call i64 @rt_root(i64 %t1512)
  store i64 %t1513, ptr @"scheme.base:error-object-irritants"
  ret i64 17
}

define i64 @"scheme.base:__init_68"() {
entry:
  %t1595 = call ptr @rt_alloc_words(i64 1)
  %t1596 = ptrtoint ptr %t1595 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-parameter" to i64), ptr %t1595
  %t1597 = or i64 %t1596, 4
  %t1598 = call i64 @rt_root(i64 %t1597)
  store i64 %t1598, ptr @"scheme.base:make-parameter"
  ret i64 17
}

define i64 @"scheme.base:__init_69"() {
entry:
  %t1679 = call ptr @rt_alloc_words(i64 1)
  %t1680 = ptrtoint ptr %t1679 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%with-parameters" to i64), ptr %t1679
  %t1681 = or i64 %t1680, 4
  %t1682 = call i64 @rt_root(i64 %t1681)
  store i64 %t1682, ptr @"scheme.base:%with-parameters"
  ret i64 17
}

define i64 @"scheme.base:__init_70"() {
entry:
  %t1720 = call ptr @rt_alloc_words(i64 1)
  %t1721 = ptrtoint ptr %t1720 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->vector" to i64), ptr %t1720
  %t1722 = or i64 %t1721, 4
  %t1723 = call i64 @rt_root(i64 %t1722)
  store i64 %t1723, ptr @"scheme.base:list->vector"
  ret i64 17
}

define i64 @"scheme.base:__init_71"() {
entry:
  %t1741 = call ptr @rt_alloc_words(i64 1)
  %t1742 = ptrtoint ptr %t1741 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector" to i64), ptr %t1741
  %t1743 = or i64 %t1742, 4
  %t1744 = call i64 @rt_root(i64 %t1743)
  store i64 %t1744, ptr @"scheme.base:vector"
  ret i64 17
}

define i64 @"scheme.base:__init_72"() {
entry:
  %t1782 = call ptr @rt_alloc_words(i64 1)
  %t1783 = ptrtoint ptr %t1782 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->bytevector" to i64), ptr %t1782
  %t1784 = or i64 %t1783, 4
  %t1785 = call i64 @rt_root(i64 %t1784)
  store i64 %t1785, ptr @"scheme.base:list->bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_73"() {
entry:
  %t1803 = call ptr @rt_alloc_words(i64 1)
  %t1804 = ptrtoint ptr %t1803 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector" to i64), ptr %t1803
  %t1805 = or i64 %t1804, 4
  %t1806 = call i64 @rt_root(i64 %t1805)
  store i64 %t1806, ptr @"scheme.base:bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_74"() {
entry:
  %t1826 = call ptr @rt_alloc_words(i64 1)
  %t1827 = ptrtoint ptr %t1826 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:values" to i64), ptr %t1826
  %t1828 = or i64 %t1827, 4
  %t1829 = call i64 @rt_root(i64 %t1828)
  store i64 %t1829, ptr @"scheme.base:values"
  ret i64 17
}

define i64 @"scheme.base:__init_75"() {
entry:
  %t1871 = call ptr @rt_alloc_words(i64 1)
  %t1872 = ptrtoint ptr %t1871 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-values" to i64), ptr %t1871
  %t1873 = or i64 %t1872, 4
  %t1874 = call i64 @rt_root(i64 %t1873)
  store i64 %t1874, ptr @"scheme.base:call-with-values"
  ret i64 17
}

define i64 @"scheme.base:__init_76"() {
entry:
  %t1875 = call i64 @rt_root(i64 64)
  store i64 %t1875, ptr @"scheme.base:%ht-initial-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_77"() {
entry:
  %t1876 = call i64 @rt_root(i64 24)
  store i64 %t1876, ptr @"scheme.base:%ht-load-factor"
  ret i64 17
}

define i64 @"scheme.base:__init_78"() {
entry:
  %t1887 = call ptr @rt_alloc_words(i64 1)
  %t1888 = ptrtoint ptr %t1887 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-hash-table" to i64), ptr %t1887
  %t1889 = or i64 %t1888, 4
  %t1890 = call i64 @rt_root(i64 %t1889)
  store i64 %t1890, ptr @"scheme.base:make-hash-table"
  ret i64 17
}

define i64 @"scheme.base:__init_79"() {
entry:
  %t1893 = call ptr @rt_alloc_words(i64 1)
  %t1894 = ptrtoint ptr %t1893 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table?" to i64), ptr %t1893
  %t1895 = or i64 %t1894, 4
  %t1896 = call i64 @rt_root(i64 %t1895)
  store i64 %t1896, ptr @"scheme.base:hash-table?"
  ret i64 17
}

define i64 @"scheme.base:__init_80"() {
entry:
  %t1900 = call ptr @rt_alloc_words(i64 1)
  %t1901 = ptrtoint ptr %t1900 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-count" to i64), ptr %t1900
  %t1902 = or i64 %t1901, 4
  %t1903 = call i64 @rt_root(i64 %t1902)
  store i64 %t1903, ptr @"scheme.base:%ht-count"
  ret i64 17
}

define i64 @"scheme.base:__init_81"() {
entry:
  %t1907 = call ptr @rt_alloc_words(i64 1)
  %t1908 = ptrtoint ptr %t1907 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-buckets" to i64), ptr %t1907
  %t1909 = or i64 %t1908, 4
  %t1910 = call i64 @rt_root(i64 %t1909)
  store i64 %t1910, ptr @"scheme.base:%ht-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_82"() {
entry:
  %t1914 = call ptr @rt_alloc_words(i64 1)
  %t1915 = ptrtoint ptr %t1914 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-count!" to i64), ptr %t1914
  %t1916 = or i64 %t1915, 4
  %t1917 = call i64 @rt_root(i64 %t1916)
  store i64 %t1917, ptr @"scheme.base:%ht-set-count!"
  ret i64 17
}

define i64 @"scheme.base:__init_83"() {
entry:
  %t1921 = call ptr @rt_alloc_words(i64 1)
  %t1922 = ptrtoint ptr %t1921 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-buckets!" to i64), ptr %t1921
  %t1923 = or i64 %t1922, 4
  %t1924 = call i64 @rt_root(i64 %t1923)
  store i64 %t1924, ptr @"scheme.base:%ht-set-buckets!"
  ret i64 17
}

define i64 @"scheme.base:__init_84"() {
entry:
  %t1928 = call ptr @rt_alloc_words(i64 1)
  %t1929 = ptrtoint ptr %t1928 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-index" to i64), ptr %t1928
  %t1930 = or i64 %t1929, 4
  %t1931 = call i64 @rt_root(i64 %t1930)
  store i64 %t1931, ptr @"scheme.base:%ht-index"
  ret i64 17
}

define i64 @"scheme.base:__init_85"() {
entry:
  %t1947 = call ptr @rt_alloc_words(i64 1)
  %t1948 = ptrtoint ptr %t1947 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-assoc" to i64), ptr %t1947
  %t1949 = or i64 %t1948, 4
  %t1950 = call i64 @rt_root(i64 %t1949)
  store i64 %t1950, ptr @"scheme.base:%ht-assoc"
  ret i64 17
}

define i64 @"scheme.base:__init_86"() {
entry:
  %t1968 = call ptr @rt_alloc_words(i64 1)
  %t1969 = ptrtoint ptr %t1968 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-remove" to i64), ptr %t1968
  %t1970 = or i64 %t1969, 4
  %t1971 = call i64 @rt_root(i64 %t1970)
  store i64 %t1971, ptr @"scheme.base:%ht-remove"
  ret i64 17
}

define i64 @"scheme.base:__init_87"() {
entry:
  %t1995 = call ptr @rt_alloc_words(i64 1)
  %t1996 = ptrtoint ptr %t1995 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref/default" to i64), ptr %t1995
  %t1997 = or i64 %t1996, 4
  %t1998 = call i64 @rt_root(i64 %t1997)
  store i64 %t1998, ptr @"scheme.base:hash-table-ref/default"
  ret i64 17
}

define i64 @"scheme.base:__init_88"() {
entry:
  %t2021 = call ptr @rt_alloc_words(i64 1)
  %t2022 = ptrtoint ptr %t2021 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-contains?" to i64), ptr %t2021
  %t2023 = or i64 %t2022, 4
  %t2024 = call i64 @rt_root(i64 %t2023)
  store i64 %t2024, ptr @"scheme.base:hash-table-contains?"
  ret i64 17
}

define i64 @"scheme.base:__init_89"() {
entry:
  %t2055 = call ptr @rt_alloc_words(i64 1)
  %t2056 = ptrtoint ptr %t2055 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref" to i64), ptr %t2055
  %t2057 = or i64 %t2056, 4
  %t2058 = call i64 @rt_root(i64 %t2057)
  store i64 %t2058, ptr @"scheme.base:hash-table-ref"
  ret i64 17
}

define i64 @"scheme.base:__init_90"() {
entry:
  %t2142 = call ptr @rt_alloc_words(i64 1)
  %t2143 = ptrtoint ptr %t2142 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-set!" to i64), ptr %t2142
  %t2144 = or i64 %t2143, 4
  %t2145 = call i64 @rt_root(i64 %t2144)
  store i64 %t2145, ptr @"scheme.base:hash-table-set!"
  ret i64 17
}

define i64 @"scheme.base:__init_91"() {
entry:
  %t2195 = call ptr @rt_alloc_words(i64 1)
  %t2196 = ptrtoint ptr %t2195 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-delete!" to i64), ptr %t2195
  %t2197 = or i64 %t2196, 4
  %t2198 = call i64 @rt_root(i64 %t2197)
  store i64 %t2198, ptr @"scheme.base:hash-table-delete!"
  ret i64 17
}

define i64 @"scheme.base:__init_92"() {
entry:
  %t2302 = call ptr @rt_alloc_words(i64 1)
  %t2303 = ptrtoint ptr %t2302 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-grow!" to i64), ptr %t2302
  %t2304 = or i64 %t2303, 4
  %t2305 = call i64 @rt_root(i64 %t2304)
  store i64 %t2305, ptr @"scheme.base:%ht-grow!"
  ret i64 17
}

define i64 @"scheme.base:__init_93"() {
entry:
  %t2313 = call ptr @rt_alloc_words(i64 1)
  %t2314 = ptrtoint ptr %t2313 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-size" to i64), ptr %t2313
  %t2315 = or i64 %t2314, 4
  %t2316 = call i64 @rt_root(i64 %t2315)
  store i64 %t2316, ptr @"scheme.base:hash-table-size"
  ret i64 17
}

define i64 @"scheme.base:__init_94"() {
entry:
  %t2333 = call ptr @rt_alloc_words(i64 1)
  %t2334 = ptrtoint ptr %t2333 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-fold-buckets" to i64), ptr %t2333
  %t2335 = or i64 %t2334, 4
  %t2336 = call i64 @rt_root(i64 %t2335)
  store i64 %t2336, ptr @"scheme.base:%ht-fold-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_95"() {
entry:
  %t2384 = call ptr @rt_alloc_words(i64 1)
  %t2385 = ptrtoint ptr %t2384 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table->alist" to i64), ptr %t2384
  %t2386 = or i64 %t2385, 4
  %t2387 = call i64 @rt_root(i64 %t2386)
  store i64 %t2387, ptr @"scheme.base:hash-table->alist"
  ret i64 17
}

define i64 @"scheme.base:__init_96"() {
entry:
  %t2406 = call ptr @rt_alloc_words(i64 1)
  %t2407 = ptrtoint ptr %t2406 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-keys" to i64), ptr %t2406
  %t2408 = or i64 %t2407, 4
  %t2409 = call i64 @rt_root(i64 %t2408)
  store i64 %t2409, ptr @"scheme.base:hash-table-keys"
  ret i64 17
}

define i64 @"scheme.base:__init_97"() {
entry:
  %t2428 = call ptr @rt_alloc_words(i64 1)
  %t2429 = ptrtoint ptr %t2428 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-values" to i64), ptr %t2428
  %t2430 = or i64 %t2429, 4
  %t2431 = call i64 @rt_root(i64 %t2430)
  store i64 %t2431, ptr @"scheme.base:hash-table-values"
  ret i64 17
}

define i64 @"scheme.base:__init_98"() {
entry:
  %t2465 = call ptr @rt_alloc_words(i64 1)
  %t2466 = ptrtoint ptr %t2465 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-ws?" to i64), ptr %t2465
  %t2467 = or i64 %t2466, 4
  %t2468 = call i64 @rt_root(i64 %t2467)
  store i64 %t2468, ptr @"scheme.base:rd-ws?"
  ret i64 17
}

define i64 @"scheme.base:__init_99"() {
entry:
  %t2486 = call ptr @rt_alloc_words(i64 1)
  %t2487 = ptrtoint ptr %t2486 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-digit?" to i64), ptr %t2486
  %t2488 = or i64 %t2487, 4
  %t2489 = call i64 @rt_root(i64 %t2488)
  store i64 %t2489, ptr @"scheme.base:rd-digit?"
  ret i64 17
}

define i64 @"scheme.base:__init_100"() {
entry:
  %t2546 = call ptr @rt_alloc_words(i64 1)
  %t2547 = ptrtoint ptr %t2546 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-delim?" to i64), ptr %t2546
  %t2548 = or i64 %t2547, 4
  %t2549 = call i64 @rt_root(i64 %t2548)
  store i64 %t2549, ptr @"scheme.base:rd-delim?"
  ret i64 17
}

define i64 @"scheme.base:__init_101"() {
entry:
  %t2591 = call ptr @rt_alloc_words(i64 1)
  %t2592 = ptrtoint ptr %t2591 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-skip-line" to i64), ptr %t2591
  %t2593 = or i64 %t2592, 4
  %t2594 = call i64 @rt_root(i64 %t2593)
  store i64 %t2594, ptr @"scheme.base:rd-skip-line"
  ret i64 17
}

define i64 @"scheme.base:__init_102"() {
entry:
  %t2655 = call ptr @rt_alloc_words(i64 1)
  %t2656 = ptrtoint ptr %t2655 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-skip-ws" to i64), ptr %t2655
  %t2657 = or i64 %t2656, 4
  %t2658 = call i64 @rt_root(i64 %t2657)
  store i64 %t2658, ptr @"scheme.base:rd-skip-ws"
  ret i64 17
}

define i64 @"scheme.base:__init_103"() {
entry:
  %t2690 = call ptr @rt_alloc_words(i64 1)
  %t2691 = ptrtoint ptr %t2690 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-token-end" to i64), ptr %t2690
  %t2692 = or i64 %t2691, 4
  %t2693 = call i64 @rt_root(i64 %t2692)
  store i64 %t2693, ptr @"scheme.base:rd-token-end"
  ret i64 17
}

define i64 @"scheme.base:__init_104"() {
entry:
  %t2725 = call ptr @rt_alloc_words(i64 1)
  %t2726 = ptrtoint ptr %t2725 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-all-digits?" to i64), ptr %t2725
  %t2727 = or i64 %t2726, 4
  %t2728 = call i64 @rt_root(i64 %t2727)
  store i64 %t2728, ptr @"scheme.base:rd-all-digits?"
  ret i64 17
}

define i64 @"scheme.base:__init_105"() {
entry:
  %t2786 = call ptr @rt_alloc_words(i64 1)
  %t2787 = ptrtoint ptr %t2786 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-numeric?" to i64), ptr %t2786
  %t2788 = or i64 %t2787, 4
  %t2789 = call i64 @rt_root(i64 %t2788)
  store i64 %t2789, ptr @"scheme.base:rd-numeric?"
  ret i64 17
}

define i64 @"scheme.base:__init_106"() {
entry:
  %t2840 = call ptr @rt_alloc_words(i64 1)
  %t2841 = ptrtoint ptr %t2840 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-digits" to i64), ptr %t2840
  %t2842 = or i64 %t2841, 4
  %t2843 = call i64 @rt_root(i64 %t2842)
  store i64 %t2843, ptr @"scheme.base:rd-digits"
  ret i64 17
}

define i64 @"scheme.base:__init_107"() {
entry:
  %t2894 = call ptr @rt_alloc_words(i64 1)
  %t2895 = ptrtoint ptr %t2894 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-digits-neg" to i64), ptr %t2894
  %t2896 = or i64 %t2895, 4
  %t2897 = call i64 @rt_root(i64 %t2896)
  store i64 %t2897, ptr @"scheme.base:rd-digits-neg"
  ret i64 17
}

define i64 @"scheme.base:__init_108"() {
entry:
  %t2936 = call ptr @rt_alloc_words(i64 1)
  %t2937 = ptrtoint ptr %t2936 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-parse-int" to i64), ptr %t2936
  %t2938 = or i64 %t2937, 4
  %t2939 = call i64 @rt_root(i64 %t2938)
  store i64 %t2939, ptr @"scheme.base:rd-parse-int"
  ret i64 17
}

define i64 @"scheme.base:__init_109"() {
entry:
  %t2949 = call ptr @rt_alloc_words(i64 1)
  %t2950 = ptrtoint ptr %t2949 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-dotchar?" to i64), ptr %t2949
  %t2951 = or i64 %t2950, 4
  %t2952 = call i64 @rt_root(i64 %t2951)
  store i64 %t2952, ptr @"scheme.base:rd-dotchar?"
  ret i64 17
}

define i64 @"scheme.base:__init_110"() {
entry:
  %t2970 = call ptr @rt_alloc_words(i64 1)
  %t2971 = ptrtoint ptr %t2970 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-exp-char?" to i64), ptr %t2970
  %t2972 = or i64 %t2971, 4
  %t2973 = call i64 @rt_root(i64 %t2972)
  store i64 %t2973, ptr @"scheme.base:rd-exp-char?"
  ret i64 17
}

define i64 @"scheme.base:__init_111"() {
entry:
  %t2991 = call ptr @rt_alloc_words(i64 1)
  %t2992 = ptrtoint ptr %t2991 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-sign-char?" to i64), ptr %t2991
  %t2993 = or i64 %t2992, 4
  %t2994 = call i64 @rt_root(i64 %t2993)
  store i64 %t2994, ptr @"scheme.base:rd-sign-char?"
  ret i64 17
}

define i64 @"scheme.base:__init_112"() {
entry:
  %t3027 = call ptr @rt_alloc_words(i64 1)
  %t3028 = ptrtoint ptr %t3027 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-scan-digits" to i64), ptr %t3027
  %t3029 = or i64 %t3028, 4
  %t3030 = call i64 @rt_root(i64 %t3029)
  store i64 %t3030, ptr @"scheme.base:rd-scan-digits"
  ret i64 17
}

define i64 @"scheme.base:__init_113"() {
entry:
  %t3219 = call ptr @rt_alloc_words(i64 1)
  %t3220 = ptrtoint ptr %t3219 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-flonum?" to i64), ptr %t3219
  %t3221 = or i64 %t3220, 4
  %t3222 = call i64 @rt_root(i64 %t3221)
  store i64 %t3222, ptr @"scheme.base:rd-flonum?"
  ret i64 17
}

define i64 @"scheme.base:__init_114"() {
entry:
  %t3256 = call ptr @rt_alloc_words(i64 1)
  %t3257 = ptrtoint ptr %t3256 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-atom" to i64), ptr %t3256
  %t3258 = or i64 %t3257, 4
  %t3259 = call i64 @rt_root(i64 %t3258)
  store i64 %t3259, ptr @"scheme.base:rd-atom"
  ret i64 17
}

define i64 @"scheme.base:__init_115"() {
entry:
  %t3337 = call ptr @rt_alloc_words(i64 1)
  %t3338 = ptrtoint ptr %t3337 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-hex-digit" to i64), ptr %t3337
  %t3339 = or i64 %t3338, 4
  %t3340 = call i64 @rt_root(i64 %t3339)
  store i64 %t3340, ptr @"scheme.base:rd-hex-digit"
  ret i64 17
}

define i64 @"scheme.base:__init_116"() {
entry:
  %t3408 = call ptr @rt_alloc_words(i64 1)
  %t3409 = ptrtoint ptr %t3408 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-hex" to i64), ptr %t3408
  %t3410 = or i64 %t3409, 4
  %t3411 = call i64 @rt_root(i64 %t3410)
  store i64 %t3411, ptr @"scheme.base:rd-hex"
  ret i64 17
}

define i64 @"scheme.base:__init_117"() {
entry:
  %t3441 = call ptr @rt_alloc_words(i64 1)
  %t3442 = ptrtoint ptr %t3441 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-str-esc" to i64), ptr %t3441
  %t3443 = or i64 %t3442, 4
  %t3444 = call i64 @rt_root(i64 %t3443)
  store i64 %t3444, ptr @"scheme.base:rd-str-esc"
  ret i64 17
}

define i64 @"scheme.base:__init_118"() {
entry:
  %t3587 = call ptr @rt_alloc_words(i64 1)
  %t3588 = ptrtoint ptr %t3587 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-string" to i64), ptr %t3587
  %t3589 = or i64 %t3588, 4
  %t3590 = call i64 @rt_root(i64 %t3589)
  store i64 %t3590, ptr @"scheme.base:rd-string"
  ret i64 17
}

define i64 @"scheme.base:__init_119"() {
entry:
  %t3768 = call ptr @rt_alloc_words(i64 1)
  %t3769 = ptrtoint ptr %t3768 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-hash" to i64), ptr %t3768
  %t3770 = or i64 %t3769, 4
  %t3771 = call i64 @rt_root(i64 %t3770)
  store i64 %t3771, ptr @"scheme.base:rd-hash"
  ret i64 17
}

define i64 @"scheme.base:__init_120"() {
entry:
  %t3810 = call ptr @rt_alloc_words(i64 1)
  %t3811 = ptrtoint ptr %t3810 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-char-name" to i64), ptr %t3810
  %t3812 = or i64 %t3811, 4
  %t3813 = call i64 @rt_root(i64 %t3812)
  store i64 %t3813, ptr @"scheme.base:rd-char-name"
  ret i64 17
}

define i64 @"scheme.base:__init_121"() {
entry:
  %t3856 = call ptr @rt_alloc_words(i64 1)
  %t3857 = ptrtoint ptr %t3856 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-char" to i64), ptr %t3856
  %t3858 = or i64 %t3857, 4
  %t3859 = call i64 @rt_root(i64 %t3858)
  store i64 %t3859, ptr @"scheme.base:rd-char"
  ret i64 17
}

define i64 @"scheme.base:__init_122"() {
entry:
  %t3883 = call ptr @rt_alloc_words(i64 1)
  %t3884 = ptrtoint ptr %t3883 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-quote" to i64), ptr %t3883
  %t3885 = or i64 %t3884, 4
  %t3886 = call i64 @rt_root(i64 %t3885)
  store i64 %t3886, ptr @"scheme.base:rd-quote"
  ret i64 17
}

define i64 @"scheme.base:__init_123"() {
entry:
  %t3910 = call ptr @rt_alloc_words(i64 1)
  %t3911 = ptrtoint ptr %t3910 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-quasi" to i64), ptr %t3910
  %t3912 = or i64 %t3911, 4
  %t3913 = call i64 @rt_root(i64 %t3912)
  store i64 %t3913, ptr @"scheme.base:rd-quasi"
  ret i64 17
}

define i64 @"scheme.base:__init_124"() {
entry:
  %t3986 = call ptr @rt_alloc_words(i64 1)
  %t3987 = ptrtoint ptr %t3986 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-unquote" to i64), ptr %t3986
  %t3988 = or i64 %t3987, 4
  %t3989 = call i64 @rt_root(i64 %t3988)
  store i64 %t3989, ptr @"scheme.base:rd-unquote"
  ret i64 17
}

define i64 @"scheme.base:__init_125"() {
entry:
  %t4030 = call ptr @rt_alloc_words(i64 1)
  %t4031 = ptrtoint ptr %t4030 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-dot?" to i64), ptr %t4030
  %t4032 = or i64 %t4031, 4
  %t4033 = call i64 @rt_root(i64 %t4032)
  store i64 %t4033, ptr @"scheme.base:rd-dot?"
  ret i64 17
}

define i64 @"scheme.base:__init_126"() {
entry:
  %t4046 = call ptr @rt_alloc_words(i64 1)
  %t4047 = ptrtoint ptr %t4046 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-append-reverse" to i64), ptr %t4046
  %t4048 = or i64 %t4047, 4
  %t4049 = call i64 @rt_root(i64 %t4048)
  store i64 %t4049, ptr @"scheme.base:rd-append-reverse"
  ret i64 17
}

define i64 @"scheme.base:__init_127"() {
entry:
  %t4171 = call ptr @rt_alloc_words(i64 1)
  %t4172 = ptrtoint ptr %t4171 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-list" to i64), ptr %t4171
  %t4173 = or i64 %t4172, 4
  %t4174 = call i64 @rt_root(i64 %t4173)
  store i64 %t4174, ptr @"scheme.base:rd-list"
  ret i64 17
}

define i64 @"scheme.base:__init_128"() {
entry:
  %t4338 = call ptr @rt_alloc_words(i64 1)
  %t4339 = ptrtoint ptr %t4338 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-datum" to i64), ptr %t4338
  %t4340 = or i64 %t4339, 4
  %t4341 = call i64 @rt_root(i64 %t4340)
  store i64 %t4341, ptr @"scheme.base:rd-datum"
  ret i64 17
}

define i64 @"scheme.base:__init_129"() {
entry:
  %t4357 = call ptr @rt_alloc_words(i64 1)
  %t4358 = ptrtoint ptr %t4357 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-from-string" to i64), ptr %t4357
  %t4359 = or i64 %t4358, 4
  %t4360 = call i64 @rt_root(i64 %t4359)
  store i64 %t4360, ptr @"scheme.base:read-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_130"() {
entry:
  %t4427 = call ptr @rt_alloc_words(i64 1)
  %t4428 = ptrtoint ptr %t4427 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-all-from-string" to i64), ptr %t4427
  %t4429 = or i64 %t4428, 4
  %t4430 = call i64 @rt_root(i64 %t4429)
  store i64 %t4430, ptr @"scheme.base:read-all-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_131"() {
entry:
  %t4431 = call i64 @rt_root(i64 1)
  store i64 %t4431, ptr @"scheme.base:%port-rtd-cell"
  ret i64 17
}

define i64 @"scheme.base:__init_132"() {
entry:
  %t4440 = call ptr @rt_alloc_words(i64 1)
  %t4441 = ptrtoint ptr %t4440 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%port-rtd" to i64), ptr %t4440
  %t4442 = or i64 %t4441, 4
  %t4443 = call i64 @rt_root(i64 %t4442)
  store i64 %t4443, ptr @"scheme.base:%port-rtd"
  ret i64 17
}

define i64 @"scheme.base:__init_133"() {
entry:
  %t4458 = call ptr @rt_alloc_words(i64 1)
  %t4459 = ptrtoint ptr %t4458 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%make-port" to i64), ptr %t4458
  %t4460 = or i64 %t4459, 4
  %t4461 = call i64 @rt_root(i64 %t4460)
  store i64 %t4461, ptr @"scheme.base:%make-port"
  ret i64 17
}

define i64 @"scheme.base:__init_134"() {
entry:
  %t4470 = call ptr @rt_alloc_words(i64 1)
  %t4471 = ptrtoint ptr %t4470 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port?" to i64), ptr %t4470
  %t4472 = or i64 %t4471, 4
  %t4473 = call i64 @rt_root(i64 %t4472)
  store i64 %t4473, ptr @"scheme.base:port?"
  ret i64 17
}

define i64 @"scheme.base:__init_135"() {
entry:
  %t4483 = call ptr @rt_alloc_words(i64 1)
  %t4484 = ptrtoint ptr %t4483 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port?" to i64), ptr %t4483
  %t4485 = or i64 %t4484, 4
  %t4486 = call i64 @rt_root(i64 %t4485)
  store i64 %t4486, ptr @"scheme.base:input-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_136"() {
entry:
  %t4497 = call ptr @rt_alloc_words(i64 1)
  %t4498 = ptrtoint ptr %t4497 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port?" to i64), ptr %t4497
  %t4499 = or i64 %t4498, 4
  %t4500 = call i64 @rt_root(i64 %t4499)
  store i64 %t4500, ptr @"scheme.base:output-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_137"() {
entry:
  %t4508 = call ptr @rt_alloc_words(i64 1)
  %t4509 = ptrtoint ptr %t4508 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:textual-port?" to i64), ptr %t4508
  %t4510 = or i64 %t4509, 4
  %t4511 = call i64 @rt_root(i64 %t4510)
  store i64 %t4511, ptr @"scheme.base:textual-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_138"() {
entry:
  %t4514 = call ptr @rt_alloc_words(i64 1)
  %t4515 = ptrtoint ptr %t4514 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port-closed?" to i64), ptr %t4514
  %t4516 = or i64 %t4515, 4
  %t4517 = call i64 @rt_root(i64 %t4516)
  store i64 %t4517, ptr @"scheme.base:port-closed?"
  ret i64 17
}

define i64 @"scheme.base:__init_139"() {
entry:
  %t4528 = call ptr @rt_alloc_words(i64 1)
  %t4529 = ptrtoint ptr %t4528 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port-open?" to i64), ptr %t4528
  %t4530 = or i64 %t4529, 4
  %t4531 = call i64 @rt_root(i64 %t4530)
  store i64 %t4531, ptr @"scheme.base:input-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_140"() {
entry:
  %t4542 = call ptr @rt_alloc_words(i64 1)
  %t4543 = ptrtoint ptr %t4542 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port-open?" to i64), ptr %t4542
  %t4544 = or i64 %t4543, 4
  %t4545 = call i64 @rt_root(i64 %t4544)
  store i64 %t4545, ptr @"scheme.base:output-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_141"() {
entry:
  %t4571 = call ptr @rt_alloc_words(i64 1)
  %t4572 = ptrtoint ptr %t4571 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-input-port" to i64), ptr %t4571
  %t4573 = or i64 %t4572, 4
  %t4574 = call i64 @rt_root(i64 %t4573)
  store i64 %t4574, ptr @"scheme.base:%check-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_142"() {
entry:
  %t4600 = call ptr @rt_alloc_words(i64 1)
  %t4601 = ptrtoint ptr %t4600 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-output-port" to i64), ptr %t4600
  %t4602 = or i64 %t4601, 4
  %t4603 = call i64 @rt_root(i64 %t4602)
  store i64 %t4603, ptr @"scheme.base:%check-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_143"() {
entry:
  %t4609 = call ptr @rt_alloc_words(i64 1)
  %t4610 = ptrtoint ptr %t4609 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%port-buf" to i64), ptr %t4609
  %t4611 = or i64 %t4610, 4
  %t4612 = call i64 @rt_root(i64 %t4611)
  store i64 %t4612, ptr @"scheme.base:%port-buf"
  ret i64 17
}

define i64 @"scheme.base:__init_144"() {
entry:
  %t4620 = call ptr @rt_alloc_words(i64 1)
  %t4621 = ptrtoint ptr %t4620 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-input-string" to i64), ptr %t4620
  %t4622 = or i64 %t4621, 4
  %t4623 = call i64 @rt_root(i64 %t4622)
  store i64 %t4623, ptr @"scheme.base:open-input-string"
  ret i64 17
}

define i64 @"scheme.base:__init_145"() {
entry:
  %t4641 = call ptr @rt_alloc_words(i64 1)
  %t4642 = ptrtoint ptr %t4641 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-input-file" to i64), ptr %t4641
  %t4643 = or i64 %t4642, 4
  %t4644 = call i64 @rt_root(i64 %t4643)
  store i64 %t4644, ptr @"scheme.base:open-input-file"
  ret i64 17
}

define i64 @"scheme.base:__init_146"() {
entry:
  %t4669 = call ptr @rt_alloc_words(i64 1)
  %t4670 = ptrtoint ptr %t4669 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%port-at-eof?" to i64), ptr %t4669
  %t4671 = or i64 %t4670, 4
  %t4672 = call i64 @rt_root(i64 %t4671)
  store i64 %t4672, ptr @"scheme.base:%port-at-eof?"
  ret i64 17
}

define i64 @"scheme.base:__init_147"() {
entry:
  %t4706 = call ptr @rt_alloc_words(i64 1)
  %t4707 = ptrtoint ptr %t4706 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-char" to i64), ptr %t4706
  %t4708 = or i64 %t4707, 4
  %t4709 = call i64 @rt_root(i64 %t4708)
  store i64 %t4709, ptr @"scheme.base:read-char"
  ret i64 17
}

define i64 @"scheme.base:__init_148"() {
entry:
  %t4734 = call ptr @rt_alloc_words(i64 1)
  %t4735 = ptrtoint ptr %t4734 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:peek-char" to i64), ptr %t4734
  %t4736 = or i64 %t4735, 4
  %t4737 = call i64 @rt_root(i64 %t4736)
  store i64 %t4737, ptr @"scheme.base:peek-char"
  ret i64 17
}

define i64 @"scheme.base:__init_149"() {
entry:
  %t4859 = call ptr @rt_alloc_words(i64 1)
  %t4860 = ptrtoint ptr %t4859 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-line" to i64), ptr %t4859
  %t4861 = or i64 %t4860, 4
  %t4862 = call i64 @rt_root(i64 %t4861)
  store i64 %t4862, ptr @"scheme.base:read-line"
  ret i64 17
}

define i64 @"scheme.base:__init_150"() {
entry:
  %t4914 = call ptr @rt_alloc_words(i64 1)
  %t4915 = ptrtoint ptr %t4914 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-string" to i64), ptr %t4914
  %t4916 = or i64 %t4915, 4
  %t4917 = call i64 @rt_root(i64 %t4916)
  store i64 %t4917, ptr @"scheme.base:read-string"
  ret i64 17
}

define i64 @"scheme.base:__init_151"() {
entry:
  %t4968 = call ptr @rt_alloc_words(i64 1)
  %t4969 = ptrtoint ptr %t4968 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read" to i64), ptr %t4968
  %t4970 = or i64 %t4969, 4
  %t4971 = call i64 @rt_root(i64 %t4970)
  store i64 %t4971, ptr @"scheme.base:read"
  ret i64 17
}

define i64 @"scheme.base:__init_152"() {
entry:
  %t4989 = call ptr @rt_alloc_words(i64 1)
  %t4990 = ptrtoint ptr %t4989 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-output-file" to i64), ptr %t4989
  %t4991 = or i64 %t4990, 4
  %t4992 = call i64 @rt_root(i64 %t4991)
  store i64 %t4992, ptr @"scheme.base:open-output-file"
  ret i64 17
}

define i64 @"scheme.base:__init_153"() {
entry:
  %t5010 = call ptr @rt_alloc_words(i64 1)
  %t5011 = ptrtoint ptr %t5010 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-output-string" to i64), ptr %t5010
  %t5012 = or i64 %t5011, 4
  %t5013 = call i64 @rt_root(i64 %t5012)
  store i64 %t5013, ptr @"scheme.base:open-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_154"() {
entry:
  %t5044 = call ptr @rt_alloc_words(i64 1)
  %t5045 = ptrtoint ptr %t5044 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:get-output-string" to i64), ptr %t5044
  %t5046 = or i64 %t5045, 4
  %t5047 = call i64 @rt_root(i64 %t5046)
  store i64 %t5047, ptr @"scheme.base:get-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_155"() {
entry:
  %t5058 = call ptr @rt_alloc_words(i64 1)
  %t5059 = ptrtoint ptr %t5058 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:flush-output-port" to i64), ptr %t5058
  %t5060 = or i64 %t5059, 4
  %t5061 = call i64 @rt_root(i64 %t5060)
  store i64 %t5061, ptr @"scheme.base:flush-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_156"() {
entry:
  %t5090 = call ptr @rt_alloc_words(i64 1)
  %t5091 = ptrtoint ptr %t5090 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-port" to i64), ptr %t5090
  %t5092 = or i64 %t5091, 4
  %t5093 = call i64 @rt_root(i64 %t5092)
  store i64 %t5093, ptr @"scheme.base:close-port"
  ret i64 17
}

define i64 @"scheme.base:__init_157"() {
entry:
  %t5116 = call ptr @rt_alloc_words(i64 1)
  %t5117 = ptrtoint ptr %t5116 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-input-port" to i64), ptr %t5116
  %t5118 = or i64 %t5117, 4
  %t5119 = call i64 @rt_root(i64 %t5118)
  store i64 %t5119, ptr @"scheme.base:close-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_158"() {
entry:
  %t5142 = call ptr @rt_alloc_words(i64 1)
  %t5143 = ptrtoint ptr %t5142 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-output-port" to i64), ptr %t5142
  %t5144 = or i64 %t5143, 4
  %t5145 = call i64 @rt_root(i64 %t5144)
  store i64 %t5145, ptr @"scheme.base:close-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_159"() {
entry:
  %t5146 = call i64 @rt_root(i64 1)
  store i64 %t5146, ptr @"scheme.base:%stdout-port"
  ret i64 17
}

define i64 @"scheme.base:__init_160"() {
entry:
  %t5147 = call i64 @rt_root(i64 1)
  store i64 %t5147, ptr @"scheme.base:%stderr-port"
  ret i64 17
}

define i64 @"scheme.base:__init_161"() {
entry:
  %t5148 = call i64 @rt_root(i64 1)
  store i64 %t5148, ptr @"scheme.base:%stdin-port"
  ret i64 17
}

define i64 @"scheme.base:__init_162"() {
entry:
  %t5180 = call ptr @rt_alloc_words(i64 1)
  %t5181 = ptrtoint ptr %t5180 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-output-port" to i64), ptr %t5180
  %t5182 = or i64 %t5181, 4
  %t5183 = call i64 @rt_root(i64 %t5182)
  store i64 %t5183, ptr @"scheme.base:current-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_163"() {
entry:
  %t5212 = call ptr @rt_alloc_words(i64 1)
  %t5213 = ptrtoint ptr %t5212 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-error-port" to i64), ptr %t5212
  %t5214 = or i64 %t5213, 4
  %t5215 = call i64 @rt_root(i64 %t5214)
  store i64 %t5215, ptr @"scheme.base:current-error-port"
  ret i64 17
}

define i64 @"scheme.base:__init_164"() {
entry:
  %t5244 = call ptr @rt_alloc_words(i64 1)
  %t5245 = ptrtoint ptr %t5244 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-input-port" to i64), ptr %t5244
  %t5246 = or i64 %t5245, 4
  %t5247 = call i64 @rt_root(i64 %t5246)
  store i64 %t5247, ptr @"scheme.base:current-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_165"() {
entry:
  %t5294 = call ptr @rt_alloc_words(i64 1)
  %t5295 = ptrtoint ptr %t5294 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-port" to i64), ptr %t5294
  %t5296 = or i64 %t5295, 4
  %t5297 = call i64 @rt_root(i64 %t5296)
  store i64 %t5297, ptr @"scheme.base:call-with-port"
  ret i64 17
}

define i64 @"scheme.base:__init_166"() {
entry:
  %t5358 = call ptr @rt_alloc_words(i64 1)
  %t5359 = ptrtoint ptr %t5358 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-output-to-file" to i64), ptr %t5358
  %t5360 = or i64 %t5359, 4
  %t5361 = call i64 @rt_root(i64 %t5360)
  store i64 %t5361, ptr @"scheme.base:with-output-to-file"
  ret i64 17
}

define i64 @"scheme.base:__init_167"() {
entry:
  %t5422 = call ptr @rt_alloc_words(i64 1)
  %t5423 = ptrtoint ptr %t5422 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-input-from-file" to i64), ptr %t5422
  %t5424 = or i64 %t5423, 4
  %t5425 = call i64 @rt_root(i64 %t5424)
  store i64 %t5425, ptr @"scheme.base:with-input-from-file"
  ret i64 17
}

define i64 @"scheme.base:__init_168"() {
entry:
  %t5439 = call ptr @rt_alloc_words(i64 1)
  %t5440 = ptrtoint ptr %t5439 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-output-file" to i64), ptr %t5439
  %t5441 = or i64 %t5440, 4
  %t5442 = call i64 @rt_root(i64 %t5441)
  store i64 %t5442, ptr @"scheme.base:call-with-output-file"
  ret i64 17
}

define i64 @"scheme.base:__init_169"() {
entry:
  %t5456 = call ptr @rt_alloc_words(i64 1)
  %t5457 = ptrtoint ptr %t5456 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-input-file" to i64), ptr %t5456
  %t5458 = or i64 %t5457, 4
  %t5459 = call i64 @rt_root(i64 %t5458)
  store i64 %t5459, ptr @"scheme.base:call-with-input-file"
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

