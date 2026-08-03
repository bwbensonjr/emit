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
declare i64 @rt_finite_p(i64)
declare i64 @rt_nan_p(i64)
declare i64 @rt_flo_floor(i64)
declare i64 @rt_flo_ceiling(i64)
declare i64 @rt_flo_truncate(i64)
declare i64 @rt_flo_round(i64)
declare i64 @rt_sqrt(i64)
declare i64 @rt_exp(i64)
declare i64 @rt_log(i64)
declare i64 @rt_sin(i64)
declare i64 @rt_cos(i64)
declare i64 @rt_tan(i64)
declare i64 @rt_asin(i64)
declare i64 @rt_acos(i64)
declare i64 @rt_atan(i64)
declare i64 @rt_atan2(i64, i64)
declare i64 @rt_pow(i64, i64)
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

@.flo.lit.0 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.lit.1 = private unnamed_addr constant [26 x i8] c"numerator: not an integer\00"
@.flo.lit.2 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.lit.3 = private unnamed_addr constant [28 x i8] c"denominator: not an integer\00"
@.str.lit.4 = private unnamed_addr constant [1 x i8] c"\00"
@.str.lit.5 = private unnamed_addr constant [2 x i8] c"0\00"
@.str.lit.6 = private unnamed_addr constant [55 x i8] c"number->string: radix must be 10 for an inexact number\00"
@.str.lit.7 = private unnamed_addr constant [34 x i8] c"number->string: unsupported radix\00"
@.str.lit.8 = private unnamed_addr constant [34 x i8] c"string->number: unsupported radix\00"
@.str.lit.9 = private unnamed_addr constant [3 x i8] c": \00"
@.str.sym.10 = private unnamed_addr constant [8 x i8] c"call/cc\00"
@.str.lit.11 = private unnamed_addr constant [40 x i8] c"continuation invoked outside its extent\00"
@.str.lit.12 = private unnamed_addr constant [30 x i8] c"hash-table-ref: key not found\00"
@.str.lit.13 = private unnamed_addr constant [6 x i8] c"space\00"
@.str.lit.14 = private unnamed_addr constant [8 x i8] c"newline\00"
@.str.lit.15 = private unnamed_addr constant [4 x i8] c"tab\00"
@.str.lit.16 = private unnamed_addr constant [7 x i8] c"return\00"
@.str.lit.17 = private unnamed_addr constant [4 x i8] c"nul\00"
@.str.lit.18 = private unnamed_addr constant [5 x i8] c"null\00"
@.str.lit.19 = private unnamed_addr constant [7 x i8] c"delete\00"
@.str.lit.20 = private unnamed_addr constant [8 x i8] c"altmode\00"
@.str.lit.21 = private unnamed_addr constant [4 x i8] c"esc\00"
@.str.sym.22 = private unnamed_addr constant [6 x i8] c"quote\00"
@.str.sym.23 = private unnamed_addr constant [11 x i8] c"quasiquote\00"
@.str.sym.24 = private unnamed_addr constant [17 x i8] c"unquote-splicing\00"
@.str.sym.25 = private unnamed_addr constant [8 x i8] c"unquote\00"
@.str.lit.26 = private unnamed_addr constant [5 x i8] c"port\00"
@.str.lit.27 = private unnamed_addr constant [18 x i8] c"not an input port\00"
@.str.lit.28 = private unnamed_addr constant [15 x i8] c"port is closed\00"
@.str.lit.29 = private unnamed_addr constant [19 x i8] c"not an output port\00"
@.str.lit.30 = private unnamed_addr constant [15 x i8] c"port is closed\00"
@.str.sym.31 = private unnamed_addr constant [16 x i8] c"open-input-file\00"
@.str.lit.32 = private unnamed_addr constant [27 x i8] c"cannot open file for input\00"
@.str.sym.33 = private unnamed_addr constant [10 x i8] c"read-char\00"
@.str.sym.34 = private unnamed_addr constant [10 x i8] c"peek-char\00"
@.str.sym.35 = private unnamed_addr constant [10 x i8] c"read-line\00"
@.str.sym.36 = private unnamed_addr constant [12 x i8] c"read-string\00"
@.str.sym.37 = private unnamed_addr constant [5 x i8] c"read\00"
@.str.sym.38 = private unnamed_addr constant [17 x i8] c"open-output-file\00"
@.str.lit.39 = private unnamed_addr constant [28 x i8] c"cannot open file for output\00"
@.str.sym.40 = private unnamed_addr constant [19 x i8] c"open-output-string\00"
@.str.lit.41 = private unnamed_addr constant [34 x i8] c"cannot open an output string port\00"
@.str.sym.42 = private unnamed_addr constant [18 x i8] c"get-output-string\00"
@.str.lit.43 = private unnamed_addr constant [19 x i8] c"not an output port\00"
@.str.lit.44 = private unnamed_addr constant [18 x i8] c"not a string port\00"
@.str.sym.45 = private unnamed_addr constant [18 x i8] c"flush-output-port\00"
@.str.sym.46 = private unnamed_addr constant [11 x i8] c"close-port\00"
@.str.lit.47 = private unnamed_addr constant [11 x i8] c"not a port\00"
@.str.sym.48 = private unnamed_addr constant [17 x i8] c"close-input-port\00"
@.str.lit.49 = private unnamed_addr constant [18 x i8] c"not an input port\00"
@.str.sym.50 = private unnamed_addr constant [18 x i8] c"close-output-port\00"
@.str.lit.51 = private unnamed_addr constant [19 x i8] c"not an output port\00"
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
@"scheme.base:complex?" = global i64 0
@"scheme.base:exact-integer?" = global i64 0
@"scheme.base:rational?" = global i64 0
@"scheme.base:positive?" = global i64 0
@"scheme.base:negative?" = global i64 0
@"scheme.base:even?" = global i64 0
@"scheme.base:odd?" = global i64 0
@"scheme.base:abs" = global i64 0
@"scheme.base:square" = global i64 0
@"scheme.base:%gcd2" = global i64 0
@"scheme.base:%gcd-fold" = global i64 0
@"scheme.base:%lcm-fold" = global i64 0
@"scheme.base:gcd" = global i64 0
@"scheme.base:lcm" = global i64 0
@"scheme.base:%expt-exact" = global i64 0
@"scheme.base:expt" = global i64 0
@"scheme.base:%isqrt-loop" = global i64 0
@"scheme.base:%isqrt" = global i64 0
@"scheme.base:exact-integer-sqrt" = global i64 0
@"scheme.base:floor" = global i64 0
@"scheme.base:ceiling" = global i64 0
@"scheme.base:truncate" = global i64 0
@"scheme.base:round" = global i64 0
@"scheme.base:truncate-quotient" = global i64 0
@"scheme.base:truncate-remainder" = global i64 0
@"scheme.base:floor-remainder" = global i64 0
@"scheme.base:floor-quotient" = global i64 0
@"scheme.base:truncate/" = global i64 0
@"scheme.base:floor/" = global i64 0
@"scheme.base:numerator" = global i64 0
@"scheme.base:denominator" = global i64 0
@"scheme.base:inexact" = global i64 0
@"scheme.base:exact" = global i64 0
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
@"scheme.base:%ns-digit-char" = global i64 0
@"scheme.base:ns-digits-radix" = global i64 0
@"scheme.base:%radix-ok?" = global i64 0
@"scheme.base:number->string" = global i64 0
@"scheme.base:%digit-in-radix" = global i64 0
@"scheme.base:%radix-digits" = global i64 0
@"scheme.base:%string->int" = global i64 0
@"scheme.base:string->number" = global i64 0
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

define fastcc i64 @"scheme.base:code:complex?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t988 = icmp eq i64 %argc, 1
  br i1 %t988, label %argok228, label %arityerr227
arityerr227:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok228:
  %t989 = call i64 @rt_number_p(i64 %a0)
  ret i64 %t989
}

define fastcc i64 @"scheme.base:code:exact-integer?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t994 = icmp eq i64 %argc, 1
  br i1 %t994, label %argok230, label %arityerr229
arityerr229:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok230:
  %t995 = call i64 @rt_exact_p(i64 %a0)
  %t996 = icmp ne i64 %t995, 1
  br i1 %t996, label %then231, label %else232
then231:
  %t997 = call i64 @rt_integer_p(i64 %a0)
  ret i64 %t997
else232:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rational?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1002 = icmp eq i64 %argc, 1
  br i1 %t1002, label %argok234, label %arityerr233
arityerr233:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok234:
  %t1003 = call i64 @rt_number_p(i64 %a0)
  %t1004 = icmp ne i64 %t1003, 1
  br i1 %t1004, label %then235, label %else236
then235:
  %t1005 = call i64 @rt_finite_p(i64 %a0)
  ret i64 %t1005
else236:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:positive?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1010 = icmp eq i64 %argc, 1
  br i1 %t1010, label %argok238, label %arityerr237
arityerr237:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok238:
  %t1011 = or i64 0, %a0
  %t1012 = and i64 %t1011, 7
  %t1013 = icmp eq i64 %t1012, 0
  br i1 %t1013, label %fixfast239, label %fixslow240
fixfast239:
  %t1014 = icmp slt i64 0, %a0
  %t1015 = select i1 %t1014, i64 257, i64 1
  br label %fixmerge241
fixslow240:
  %t1016 = call i64 @rt_lt(i64 0, i64 %a0)
  br label %fixmerge241
fixmerge241:
  %t1017 = phi i64 [ %t1015, %fixfast239 ], [ %t1016, %fixslow240 ]
  ret i64 %t1017
}

define fastcc i64 @"scheme.base:code:negative?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1022 = icmp eq i64 %argc, 1
  br i1 %t1022, label %argok243, label %arityerr242
arityerr242:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok243:
  %t1023 = or i64 %a0, 0
  %t1024 = and i64 %t1023, 7
  %t1025 = icmp eq i64 %t1024, 0
  br i1 %t1025, label %fixfast244, label %fixslow245
fixfast244:
  %t1026 = icmp slt i64 %a0, 0
  %t1027 = select i1 %t1026, i64 257, i64 1
  br label %fixmerge246
fixslow245:
  %t1028 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge246
fixmerge246:
  %t1029 = phi i64 [ %t1027, %fixfast244 ], [ %t1028, %fixslow245 ]
  ret i64 %t1029
}

define fastcc i64 @"scheme.base:code:even?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1034 = icmp eq i64 %argc, 1
  br i1 %t1034, label %argok248, label %arityerr247
arityerr247:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok248:
  %t1035 = call i64 @rt_remainder(i64 %a0, i64 16)
  %t1036 = or i64 0, %t1035
  %t1037 = and i64 %t1036, 7
  %t1038 = icmp eq i64 %t1037, 0
  br i1 %t1038, label %fixfast249, label %fixslow250
fixfast249:
  %t1039 = icmp eq i64 0, %t1035
  %t1040 = select i1 %t1039, i64 257, i64 1
  br label %fixmerge251
fixslow250:
  %t1041 = call i64 @rt_num_eq(i64 0, i64 %t1035)
  br label %fixmerge251
fixmerge251:
  %t1042 = phi i64 [ %t1040, %fixfast249 ], [ %t1041, %fixslow250 ]
  ret i64 %t1042
}

define fastcc i64 @"scheme.base:code:odd?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1047 = icmp eq i64 %argc, 1
  br i1 %t1047, label %argok253, label %arityerr252
arityerr252:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok253:
  %t1048 = call i64 @rt_remainder(i64 %a0, i64 16)
  %t1049 = or i64 0, %t1048
  %t1050 = and i64 %t1049, 7
  %t1051 = icmp eq i64 %t1050, 0
  br i1 %t1051, label %fixfast254, label %fixslow255
fixfast254:
  %t1052 = icmp eq i64 0, %t1048
  %t1053 = select i1 %t1052, i64 257, i64 1
  br label %fixmerge256
fixslow255:
  %t1054 = call i64 @rt_num_eq(i64 0, i64 %t1048)
  br label %fixmerge256
fixmerge256:
  %t1055 = phi i64 [ %t1053, %fixfast254 ], [ %t1054, %fixslow255 ]
  %t1056 = icmp ne i64 %t1055, 1
  br i1 %t1056, label %then257, label %else258
then257:
  ret i64 1
else258:
  ret i64 257
}

define fastcc i64 @"scheme.base:code:abs"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1061 = icmp eq i64 %argc, 1
  br i1 %t1061, label %argok260, label %arityerr259
arityerr259:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok260:
  %t1062 = or i64 %a0, 0
  %t1063 = and i64 %t1062, 7
  %t1064 = icmp eq i64 %t1063, 0
  br i1 %t1064, label %fixfast261, label %fixslow262
fixfast261:
  %t1065 = icmp slt i64 %a0, 0
  %t1066 = select i1 %t1065, i64 257, i64 1
  br label %fixmerge263
fixslow262:
  %t1067 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge263
fixmerge263:
  %t1068 = phi i64 [ %t1066, %fixfast261 ], [ %t1067, %fixslow262 ]
  %t1069 = icmp ne i64 %t1068, 1
  br i1 %t1069, label %then264, label %else265
then264:
  %t1070 = or i64 0, %a0
  %t1071 = and i64 %t1070, 7
  %t1072 = icmp eq i64 %t1071, 0
  br i1 %t1072, label %fixfast266, label %fixslow267
fixfast266:
  %t1073 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %a0)
  %t1074 = extractvalue {i64, i1} %t1073, 0
  %t1075 = extractvalue {i64, i1} %t1073, 1
  br i1 %t1075, label %fixslow267, label %fixmerge268
fixslow267:
  %t1076 = call i64 @rt_sub(i64 0, i64 %a0)
  br label %fixmerge268
fixmerge268:
  %t1077 = phi i64 [ %t1074, %fixfast266 ], [ %t1076, %fixslow267 ]
  ret i64 %t1077
else265:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:square"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1082 = icmp eq i64 %argc, 1
  br i1 %t1082, label %argok270, label %arityerr269
arityerr269:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok270:
  %t1083 = or i64 %a0, %a0
  %t1084 = and i64 %t1083, 7
  %t1085 = icmp eq i64 %t1084, 0
  br i1 %t1085, label %fixfast271, label %fixslow272
fixfast271:
  %t1086 = ashr i64 %a0, 3
  %t1087 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1086, i64 %a0)
  %t1088 = extractvalue {i64, i1} %t1087, 0
  %t1089 = extractvalue {i64, i1} %t1087, 1
  br i1 %t1089, label %fixslow272, label %fixmerge273
fixslow272:
  %t1090 = call i64 @rt_mul(i64 %a0, i64 %a0)
  br label %fixmerge273
fixmerge273:
  %t1091 = phi i64 [ %t1088, %fixfast271 ], [ %t1090, %fixslow272 ]
  ret i64 %t1091
}

define fastcc i64 @"scheme.base:code:%gcd2"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1096 = icmp eq i64 %argc, 2
  br i1 %t1096, label %argok275, label %arityerr274
arityerr274:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok275:
  %t1097 = or i64 %a1, 0
  %t1098 = and i64 %t1097, 7
  %t1099 = icmp eq i64 %t1098, 0
  br i1 %t1099, label %fixfast276, label %fixslow277
fixfast276:
  %t1100 = icmp eq i64 %a1, 0
  %t1101 = select i1 %t1100, i64 257, i64 1
  br label %fixmerge278
fixslow277:
  %t1102 = call i64 @rt_num_eq(i64 %a1, i64 0)
  br label %fixmerge278
fixmerge278:
  %t1103 = phi i64 [ %t1101, %fixfast276 ], [ %t1102, %fixslow277 ]
  %t1104 = icmp ne i64 %t1103, 1
  br i1 %t1104, label %then279, label %else280
then279:
  ret i64 %a0
else280:
  %t1105 = call i64 @rt_remainder(i64 %a0, i64 %a1)
  %t1106 = load i64, ptr @"scheme.base:%gcd2"
  %t1107 = and i64 %t1106, -8
  %t1108 = inttoptr i64 %t1107 to ptr
  %t1109 = load i64, ptr %t1108
  %t1110 = inttoptr i64 %t1109 to ptr
  %t1111 = musttail call fastcc i64 %t1110(i64 %t1106, i64 2, i64 %a1, i64 %t1105, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1111
}

define fastcc i64 @"scheme.base:code:%gcd-fold"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1116 = icmp eq i64 %argc, 2
  br i1 %t1116, label %argok282, label %arityerr281
arityerr281:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok282:
  %t1117 = call i64 @rt_null_p(i64 %a0)
  %t1118 = icmp ne i64 %t1117, 1
  br i1 %t1118, label %then283, label %else284
then283:
  ret i64 %a1
else284:
  %t1119 = call i64 @rt_cdr(i64 %a0)
  %t1120 = call i64 @rt_car(i64 %a0)
  %t1121 = load i64, ptr @"scheme.base:abs"
  %t1122 = and i64 %t1121, -8
  %t1123 = inttoptr i64 %t1122 to ptr
  %t1124 = load i64, ptr %t1123
  %t1125 = inttoptr i64 %t1124 to ptr
  %t1126 = call fastcc i64%t1125(i64 %t1121, i64 1, i64 %t1120, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1127 = load i64, ptr @"scheme.base:abs"
  %t1128 = and i64 %t1127, -8
  %t1129 = inttoptr i64 %t1128 to ptr
  %t1130 = load i64, ptr %t1129
  %t1131 = inttoptr i64 %t1130 to ptr
  %t1132 = call fastcc i64%t1131(i64 %t1127, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1133 = load i64, ptr @"scheme.base:%gcd2"
  %t1134 = and i64 %t1133, -8
  %t1135 = inttoptr i64 %t1134 to ptr
  %t1136 = load i64, ptr %t1135
  %t1137 = inttoptr i64 %t1136 to ptr
  %t1138 = call fastcc i64%t1137(i64 %t1133, i64 2, i64 %t1126, i64 %t1132, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1139 = load i64, ptr @"scheme.base:%gcd-fold"
  %t1140 = and i64 %t1139, -8
  %t1141 = inttoptr i64 %t1140 to ptr
  %t1142 = load i64, ptr %t1141
  %t1143 = inttoptr i64 %t1142 to ptr
  %t1144 = musttail call fastcc i64 %t1143(i64 %t1139, i64 2, i64 %t1119, i64 %t1138, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1144
}

define fastcc i64 @"scheme.base:code:%lcm-fold"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1149 = icmp eq i64 %argc, 2
  br i1 %t1149, label %argok286, label %arityerr285
arityerr285:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok286:
  %t1150 = call i64 @rt_null_p(i64 %a0)
  %t1151 = icmp ne i64 %t1150, 1
  br i1 %t1151, label %then287, label %else288
then287:
  ret i64 %a1
else288:
  %t1152 = call i64 @rt_car(i64 %a0)
  %t1153 = load i64, ptr @"scheme.base:abs"
  %t1154 = and i64 %t1153, -8
  %t1155 = inttoptr i64 %t1154 to ptr
  %t1156 = load i64, ptr %t1155
  %t1157 = inttoptr i64 %t1156 to ptr
  %t1158 = call fastcc i64%t1157(i64 %t1153, i64 1, i64 %t1152, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1159 = or i64 %t1158, 0
  %t1160 = and i64 %t1159, 7
  %t1161 = icmp eq i64 %t1160, 0
  br i1 %t1161, label %fixfast289, label %fixslow290
fixfast289:
  %t1162 = icmp eq i64 %t1158, 0
  %t1163 = select i1 %t1162, i64 257, i64 1
  br label %fixmerge291
fixslow290:
  %t1164 = call i64 @rt_num_eq(i64 %t1158, i64 0)
  br label %fixmerge291
fixmerge291:
  %t1165 = phi i64 [ %t1163, %fixfast289 ], [ %t1164, %fixslow290 ]
  %t1166 = icmp ne i64 %t1165, 1
  br i1 %t1166, label %then292, label %else293
then292:
  ret i64 0
else293:
  %t1167 = call i64 @rt_cdr(i64 %a0)
  %t1168 = or i64 %a1, %t1158
  %t1169 = and i64 %t1168, 7
  %t1170 = icmp eq i64 %t1169, 0
  br i1 %t1170, label %fixfast294, label %fixslow295
fixfast294:
  %t1171 = ashr i64 %a1, 3
  %t1172 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1171, i64 %t1158)
  %t1173 = extractvalue {i64, i1} %t1172, 0
  %t1174 = extractvalue {i64, i1} %t1172, 1
  br i1 %t1174, label %fixslow295, label %fixmerge296
fixslow295:
  %t1175 = call i64 @rt_mul(i64 %a1, i64 %t1158)
  br label %fixmerge296
fixmerge296:
  %t1176 = phi i64 [ %t1173, %fixfast294 ], [ %t1175, %fixslow295 ]
  %t1177 = load i64, ptr @"scheme.base:%gcd2"
  %t1178 = and i64 %t1177, -8
  %t1179 = inttoptr i64 %t1178 to ptr
  %t1180 = load i64, ptr %t1179
  %t1181 = inttoptr i64 %t1180 to ptr
  %t1182 = call fastcc i64%t1181(i64 %t1177, i64 2, i64 %a1, i64 %t1158, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1183 = call i64 @rt_quotient(i64 %t1176, i64 %t1182)
  %t1184 = load i64, ptr @"scheme.base:%lcm-fold"
  %t1185 = and i64 %t1184, -8
  %t1186 = inttoptr i64 %t1185 to ptr
  %t1187 = load i64, ptr %t1186
  %t1188 = inttoptr i64 %t1187 to ptr
  %t1189 = musttail call fastcc i64 %t1188(i64 %t1184, i64 2, i64 %t1167, i64 %t1183, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1189
}

define fastcc i64 @"scheme.base:code:gcd"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1194 = icmp sge i64 %argc, 0
  br i1 %t1194, label %argok298, label %arityerr297
arityerr297:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok298:
  %t1195 = call ptr @rt_alloc_words(i64 8)
  %t1196 = getelementptr i64, ptr %t1195, i64 0
  store i64 %a0, ptr %t1196
  %t1197 = getelementptr i64, ptr %t1195, i64 1
  store i64 %a1, ptr %t1197
  %t1198 = getelementptr i64, ptr %t1195, i64 2
  store i64 %a2, ptr %t1198
  %t1199 = getelementptr i64, ptr %t1195, i64 3
  store i64 %a3, ptr %t1199
  %t1200 = getelementptr i64, ptr %t1195, i64 4
  store i64 %a4, ptr %t1200
  %t1201 = getelementptr i64, ptr %t1195, i64 5
  store i64 %a5, ptr %t1201
  %t1202 = getelementptr i64, ptr %t1195, i64 6
  store i64 %a6, ptr %t1202
  %t1203 = getelementptr i64, ptr %t1195, i64 7
  store i64 %a7, ptr %t1203
  %t1204 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1195, ptr %overflow)
  %t1205 = load i64, ptr @"scheme.base:%gcd-fold"
  %t1206 = and i64 %t1205, -8
  %t1207 = inttoptr i64 %t1206 to ptr
  %t1208 = load i64, ptr %t1207
  %t1209 = inttoptr i64 %t1208 to ptr
  %t1210 = musttail call fastcc i64 %t1209(i64 %t1205, i64 2, i64 %t1204, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1210
}

define fastcc i64 @"scheme.base:code:lcm"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1215 = icmp sge i64 %argc, 0
  br i1 %t1215, label %argok300, label %arityerr299
arityerr299:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok300:
  %t1216 = call ptr @rt_alloc_words(i64 8)
  %t1217 = getelementptr i64, ptr %t1216, i64 0
  store i64 %a0, ptr %t1217
  %t1218 = getelementptr i64, ptr %t1216, i64 1
  store i64 %a1, ptr %t1218
  %t1219 = getelementptr i64, ptr %t1216, i64 2
  store i64 %a2, ptr %t1219
  %t1220 = getelementptr i64, ptr %t1216, i64 3
  store i64 %a3, ptr %t1220
  %t1221 = getelementptr i64, ptr %t1216, i64 4
  store i64 %a4, ptr %t1221
  %t1222 = getelementptr i64, ptr %t1216, i64 5
  store i64 %a5, ptr %t1222
  %t1223 = getelementptr i64, ptr %t1216, i64 6
  store i64 %a6, ptr %t1223
  %t1224 = getelementptr i64, ptr %t1216, i64 7
  store i64 %a7, ptr %t1224
  %t1225 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1216, ptr %overflow)
  %t1226 = load i64, ptr @"scheme.base:%lcm-fold"
  %t1227 = and i64 %t1226, -8
  %t1228 = inttoptr i64 %t1227 to ptr
  %t1229 = load i64, ptr %t1228
  %t1230 = inttoptr i64 %t1229 to ptr
  %t1231 = musttail call fastcc i64 %t1230(i64 %t1226, i64 2, i64 %t1225, i64 8, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1231
}

define fastcc i64 @"scheme.base:code:%expt-exact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1236 = icmp eq i64 %argc, 3
  br i1 %t1236, label %argok302, label %arityerr301
arityerr301:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok302:
  %t1237 = or i64 %a1, 0
  %t1238 = and i64 %t1237, 7
  %t1239 = icmp eq i64 %t1238, 0
  br i1 %t1239, label %fixfast303, label %fixslow304
fixfast303:
  %t1240 = icmp eq i64 %a1, 0
  %t1241 = select i1 %t1240, i64 257, i64 1
  br label %fixmerge305
fixslow304:
  %t1242 = call i64 @rt_num_eq(i64 %a1, i64 0)
  br label %fixmerge305
fixmerge305:
  %t1243 = phi i64 [ %t1241, %fixfast303 ], [ %t1242, %fixslow304 ]
  %t1244 = icmp ne i64 %t1243, 1
  br i1 %t1244, label %then306, label %else307
then306:
  ret i64 %a2
else307:
  %t1245 = or i64 %a0, %a0
  %t1246 = and i64 %t1245, 7
  %t1247 = icmp eq i64 %t1246, 0
  br i1 %t1247, label %fixfast308, label %fixslow309
fixfast308:
  %t1248 = ashr i64 %a0, 3
  %t1249 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1248, i64 %a0)
  %t1250 = extractvalue {i64, i1} %t1249, 0
  %t1251 = extractvalue {i64, i1} %t1249, 1
  br i1 %t1251, label %fixslow309, label %fixmerge310
fixslow309:
  %t1252 = call i64 @rt_mul(i64 %a0, i64 %a0)
  br label %fixmerge310
fixmerge310:
  %t1253 = phi i64 [ %t1250, %fixfast308 ], [ %t1252, %fixslow309 ]
  %t1254 = call i64 @rt_quotient(i64 %a1, i64 16)
  %t1255 = load i64, ptr @"scheme.base:odd?"
  %t1256 = and i64 %t1255, -8
  %t1257 = inttoptr i64 %t1256 to ptr
  %t1258 = load i64, ptr %t1257
  %t1259 = inttoptr i64 %t1258 to ptr
  %t1260 = call fastcc i64%t1259(i64 %t1255, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1261 = icmp ne i64 %t1260, 1
  br i1 %t1261, label %then311, label %else312
then311:
  %t1262 = or i64 %a2, %a0
  %t1263 = and i64 %t1262, 7
  %t1264 = icmp eq i64 %t1263, 0
  br i1 %t1264, label %fixfast314, label %fixslow315
fixfast314:
  %t1265 = ashr i64 %a2, 3
  %t1266 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1265, i64 %a0)
  %t1267 = extractvalue {i64, i1} %t1266, 0
  %t1268 = extractvalue {i64, i1} %t1266, 1
  br i1 %t1268, label %fixslow315, label %fixmerge316
fixslow315:
  %t1269 = call i64 @rt_mul(i64 %a2, i64 %a0)
  br label %fixmerge316
fixmerge316:
  %t1270 = phi i64 [ %t1267, %fixfast314 ], [ %t1269, %fixslow315 ]
  br label %merge313
else312:
  br label %merge313
merge313:
  %t1271 = phi i64 [ %t1270, %fixmerge316 ], [ %a2, %else312 ]
  %t1272 = load i64, ptr @"scheme.base:%expt-exact"
  %t1273 = and i64 %t1272, -8
  %t1274 = inttoptr i64 %t1273 to ptr
  %t1275 = load i64, ptr %t1274
  %t1276 = inttoptr i64 %t1275 to ptr
  %t1277 = musttail call fastcc i64 %t1276(i64 %t1272, i64 3, i64 %t1253, i64 %t1254, i64 %t1271, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1277
}

define fastcc i64 @"scheme.base:code:expt"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1282 = icmp eq i64 %argc, 2
  br i1 %t1282, label %argok318, label %arityerr317
arityerr317:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok318:
  %t1283 = call i64 @rt_exact_p(i64 %a1)
  %t1284 = icmp ne i64 %t1283, 1
  br i1 %t1284, label %then319, label %else320
then319:
  %t1285 = or i64 %a1, 0
  %t1286 = and i64 %t1285, 7
  %t1287 = icmp eq i64 %t1286, 0
  br i1 %t1287, label %fixfast321, label %fixslow322
fixfast321:
  %t1288 = icmp slt i64 %a1, 0
  %t1289 = select i1 %t1288, i64 257, i64 1
  br label %fixmerge323
fixslow322:
  %t1290 = call i64 @rt_lt(i64 %a1, i64 0)
  br label %fixmerge323
fixmerge323:
  %t1291 = phi i64 [ %t1289, %fixfast321 ], [ %t1290, %fixslow322 ]
  %t1292 = icmp ne i64 %t1291, 1
  br i1 %t1292, label %then324, label %else325
then324:
  %t1293 = call i64 @rt_pow(i64 %a0, i64 %a1)
  ret i64 %t1293
else325:
  %t1294 = call i64 @rt_exact_p(i64 %a0)
  %t1295 = icmp ne i64 %t1294, 1
  br i1 %t1295, label %then326, label %else327
then326:
  %t1296 = load i64, ptr @"scheme.base:%expt-exact"
  %t1297 = and i64 %t1296, -8
  %t1298 = inttoptr i64 %t1297 to ptr
  %t1299 = load i64, ptr %t1298
  %t1300 = inttoptr i64 %t1299 to ptr
  %t1301 = musttail call fastcc i64 %t1300(i64 %t1296, i64 3, i64 %a0, i64 %a1, i64 8, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1301
else327:
  %t1302 = call i64 @rt_flonum_lit(ptr @.flo.lit.0)
  %t1303 = load i64, ptr @"scheme.base:%expt-exact"
  %t1304 = and i64 %t1303, -8
  %t1305 = inttoptr i64 %t1304 to ptr
  %t1306 = load i64, ptr %t1305
  %t1307 = inttoptr i64 %t1306 to ptr
  %t1308 = musttail call fastcc i64 %t1307(i64 %t1303, i64 3, i64 %a0, i64 %a1, i64 %t1302, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1308
else320:
  %t1309 = call i64 @rt_pow(i64 %a0, i64 %a1)
  ret i64 %t1309
}

define fastcc i64 @"scheme.base:code:%isqrt-loop"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1314 = icmp eq i64 %argc, 2
  br i1 %t1314, label %argok329, label %arityerr328
arityerr328:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok329:
  %t1315 = call i64 @rt_quotient(i64 %a0, i64 %a1)
  %t1316 = or i64 %a1, %t1315
  %t1317 = and i64 %t1316, 7
  %t1318 = icmp eq i64 %t1317, 0
  br i1 %t1318, label %fixfast330, label %fixslow331
fixfast330:
  %t1319 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t1315)
  %t1320 = extractvalue {i64, i1} %t1319, 0
  %t1321 = extractvalue {i64, i1} %t1319, 1
  br i1 %t1321, label %fixslow331, label %fixmerge332
fixslow331:
  %t1322 = call i64 @rt_add(i64 %a1, i64 %t1315)
  br label %fixmerge332
fixmerge332:
  %t1323 = phi i64 [ %t1320, %fixfast330 ], [ %t1322, %fixslow331 ]
  %t1324 = call i64 @rt_quotient(i64 %t1323, i64 16)
  %t1325 = or i64 %t1324, %a1
  %t1326 = and i64 %t1325, 7
  %t1327 = icmp eq i64 %t1326, 0
  br i1 %t1327, label %fixfast333, label %fixslow334
fixfast333:
  %t1328 = icmp slt i64 %t1324, %a1
  %t1329 = select i1 %t1328, i64 257, i64 1
  br label %fixmerge335
fixslow334:
  %t1330 = call i64 @rt_lt(i64 %t1324, i64 %a1)
  br label %fixmerge335
fixmerge335:
  %t1331 = phi i64 [ %t1329, %fixfast333 ], [ %t1330, %fixslow334 ]
  %t1332 = icmp ne i64 %t1331, 1
  br i1 %t1332, label %then336, label %else337
then336:
  %t1333 = load i64, ptr @"scheme.base:%isqrt-loop"
  %t1334 = and i64 %t1333, -8
  %t1335 = inttoptr i64 %t1334 to ptr
  %t1336 = load i64, ptr %t1335
  %t1337 = inttoptr i64 %t1336 to ptr
  %t1338 = musttail call fastcc i64 %t1337(i64 %t1333, i64 2, i64 %a0, i64 %t1324, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1338
else337:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:%isqrt"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1343 = icmp eq i64 %argc, 1
  br i1 %t1343, label %argok339, label %arityerr338
arityerr338:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok339:
  %t1344 = or i64 %a0, 0
  %t1345 = and i64 %t1344, 7
  %t1346 = icmp eq i64 %t1345, 0
  br i1 %t1346, label %fixfast340, label %fixslow341
fixfast340:
  %t1347 = icmp eq i64 %a0, 0
  %t1348 = select i1 %t1347, i64 257, i64 1
  br label %fixmerge342
fixslow341:
  %t1349 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge342
fixmerge342:
  %t1350 = phi i64 [ %t1348, %fixfast340 ], [ %t1349, %fixslow341 ]
  %t1351 = icmp ne i64 %t1350, 1
  br i1 %t1351, label %then343, label %else344
then343:
  ret i64 0
else344:
  %t1352 = load i64, ptr @"scheme.base:%isqrt-loop"
  %t1353 = and i64 %t1352, -8
  %t1354 = inttoptr i64 %t1353 to ptr
  %t1355 = load i64, ptr %t1354
  %t1356 = inttoptr i64 %t1355 to ptr
  %t1357 = musttail call fastcc i64 %t1356(i64 %t1352, i64 2, i64 %a0, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1357
}

define fastcc i64 @"scheme.base:code:exact-integer-sqrt"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1362 = icmp eq i64 %argc, 1
  br i1 %t1362, label %argok346, label %arityerr345
arityerr345:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok346:
  %t1363 = load i64, ptr @"scheme.base:%isqrt"
  %t1364 = and i64 %t1363, -8
  %t1365 = inttoptr i64 %t1364 to ptr
  %t1366 = load i64, ptr %t1365
  %t1367 = inttoptr i64 %t1366 to ptr
  %t1368 = call fastcc i64%t1367(i64 %t1363, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1369 = or i64 %t1368, %t1368
  %t1370 = and i64 %t1369, 7
  %t1371 = icmp eq i64 %t1370, 0
  br i1 %t1371, label %fixfast347, label %fixslow348
fixfast347:
  %t1372 = ashr i64 %t1368, 3
  %t1373 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1372, i64 %t1368)
  %t1374 = extractvalue {i64, i1} %t1373, 0
  %t1375 = extractvalue {i64, i1} %t1373, 1
  br i1 %t1375, label %fixslow348, label %fixmerge349
fixslow348:
  %t1376 = call i64 @rt_mul(i64 %t1368, i64 %t1368)
  br label %fixmerge349
fixmerge349:
  %t1377 = phi i64 [ %t1374, %fixfast347 ], [ %t1376, %fixslow348 ]
  %t1378 = or i64 %a0, %t1377
  %t1379 = and i64 %t1378, 7
  %t1380 = icmp eq i64 %t1379, 0
  br i1 %t1380, label %fixfast350, label %fixslow351
fixfast350:
  %t1381 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t1377)
  %t1382 = extractvalue {i64, i1} %t1381, 0
  %t1383 = extractvalue {i64, i1} %t1381, 1
  br i1 %t1383, label %fixslow351, label %fixmerge352
fixslow351:
  %t1384 = call i64 @rt_sub(i64 %a0, i64 %t1377)
  br label %fixmerge352
fixmerge352:
  %t1385 = phi i64 [ %t1382, %fixfast350 ], [ %t1384, %fixslow351 ]
  %t1386 = load i64, ptr @"scheme.base:values"
  %t1387 = and i64 %t1386, -8
  %t1388 = inttoptr i64 %t1387 to ptr
  %t1389 = load i64, ptr %t1388
  %t1390 = inttoptr i64 %t1389 to ptr
  %t1391 = musttail call fastcc i64 %t1390(i64 %t1386, i64 2, i64 %t1368, i64 %t1385, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1391
}

define fastcc i64 @"scheme.base:code:floor"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1396 = icmp eq i64 %argc, 1
  br i1 %t1396, label %argok354, label %arityerr353
arityerr353:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok354:
  %t1397 = call i64 @rt_exact_p(i64 %a0)
  %t1398 = icmp ne i64 %t1397, 1
  br i1 %t1398, label %then355, label %else356
then355:
  ret i64 %a0
else356:
  %t1399 = call i64 @rt_flo_floor(i64 %a0)
  ret i64 %t1399
}

define fastcc i64 @"scheme.base:code:ceiling"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1404 = icmp eq i64 %argc, 1
  br i1 %t1404, label %argok358, label %arityerr357
arityerr357:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok358:
  %t1405 = call i64 @rt_exact_p(i64 %a0)
  %t1406 = icmp ne i64 %t1405, 1
  br i1 %t1406, label %then359, label %else360
then359:
  ret i64 %a0
else360:
  %t1407 = call i64 @rt_flo_ceiling(i64 %a0)
  ret i64 %t1407
}

define fastcc i64 @"scheme.base:code:truncate"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1412 = icmp eq i64 %argc, 1
  br i1 %t1412, label %argok362, label %arityerr361
arityerr361:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok362:
  %t1413 = call i64 @rt_exact_p(i64 %a0)
  %t1414 = icmp ne i64 %t1413, 1
  br i1 %t1414, label %then363, label %else364
then363:
  ret i64 %a0
else364:
  %t1415 = call i64 @rt_flo_truncate(i64 %a0)
  ret i64 %t1415
}

define fastcc i64 @"scheme.base:code:round"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1420 = icmp eq i64 %argc, 1
  br i1 %t1420, label %argok366, label %arityerr365
arityerr365:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok366:
  %t1421 = call i64 @rt_exact_p(i64 %a0)
  %t1422 = icmp ne i64 %t1421, 1
  br i1 %t1422, label %then367, label %else368
then367:
  ret i64 %a0
else368:
  %t1423 = call i64 @rt_flo_round(i64 %a0)
  ret i64 %t1423
}

define fastcc i64 @"scheme.base:code:truncate-quotient"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1428 = icmp eq i64 %argc, 2
  br i1 %t1428, label %argok370, label %arityerr369
arityerr369:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok370:
  %t1429 = call i64 @rt_quotient(i64 %a0, i64 %a1)
  ret i64 %t1429
}

define fastcc i64 @"scheme.base:code:truncate-remainder"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1434 = icmp eq i64 %argc, 2
  br i1 %t1434, label %argok372, label %arityerr371
arityerr371:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok372:
  %t1435 = call i64 @rt_remainder(i64 %a0, i64 %a1)
  ret i64 %t1435
}

define fastcc i64 @"scheme.base:code:floor-remainder"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1440 = icmp eq i64 %argc, 2
  br i1 %t1440, label %argok374, label %arityerr373
arityerr373:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok374:
  %t1441 = call i64 @rt_modulo(i64 %a0, i64 %a1)
  ret i64 %t1441
}

define fastcc i64 @"scheme.base:code:floor-quotient"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1446 = icmp eq i64 %argc, 2
  br i1 %t1446, label %argok376, label %arityerr375
arityerr375:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok376:
  %t1447 = call i64 @rt_modulo(i64 %a0, i64 %a1)
  %t1448 = or i64 %a0, %t1447
  %t1449 = and i64 %t1448, 7
  %t1450 = icmp eq i64 %t1449, 0
  br i1 %t1450, label %fixfast377, label %fixslow378
fixfast377:
  %t1451 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t1447)
  %t1452 = extractvalue {i64, i1} %t1451, 0
  %t1453 = extractvalue {i64, i1} %t1451, 1
  br i1 %t1453, label %fixslow378, label %fixmerge379
fixslow378:
  %t1454 = call i64 @rt_sub(i64 %a0, i64 %t1447)
  br label %fixmerge379
fixmerge379:
  %t1455 = phi i64 [ %t1452, %fixfast377 ], [ %t1454, %fixslow378 ]
  %t1456 = call i64 @rt_quotient(i64 %t1455, i64 %a1)
  ret i64 %t1456
}

define fastcc i64 @"scheme.base:code:truncate/"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1461 = icmp eq i64 %argc, 2
  br i1 %t1461, label %argok381, label %arityerr380
arityerr380:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok381:
  %t1462 = call i64 @rt_quotient(i64 %a0, i64 %a1)
  %t1463 = call i64 @rt_remainder(i64 %a0, i64 %a1)
  %t1464 = load i64, ptr @"scheme.base:values"
  %t1465 = and i64 %t1464, -8
  %t1466 = inttoptr i64 %t1465 to ptr
  %t1467 = load i64, ptr %t1466
  %t1468 = inttoptr i64 %t1467 to ptr
  %t1469 = musttail call fastcc i64 %t1468(i64 %t1464, i64 2, i64 %t1462, i64 %t1463, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1469
}

define fastcc i64 @"scheme.base:code:floor/"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1474 = icmp eq i64 %argc, 2
  br i1 %t1474, label %argok383, label %arityerr382
arityerr382:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok383:
  %t1475 = load i64, ptr @"scheme.base:floor-quotient"
  %t1476 = and i64 %t1475, -8
  %t1477 = inttoptr i64 %t1476 to ptr
  %t1478 = load i64, ptr %t1477
  %t1479 = inttoptr i64 %t1478 to ptr
  %t1480 = call fastcc i64%t1479(i64 %t1475, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1481 = call i64 @rt_modulo(i64 %a0, i64 %a1)
  %t1482 = load i64, ptr @"scheme.base:values"
  %t1483 = and i64 %t1482, -8
  %t1484 = inttoptr i64 %t1483 to ptr
  %t1485 = load i64, ptr %t1484
  %t1486 = inttoptr i64 %t1485 to ptr
  %t1487 = musttail call fastcc i64 %t1486(i64 %t1482, i64 2, i64 %t1480, i64 %t1481, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1487
}

define fastcc i64 @"scheme.base:code:numerator"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1492 = icmp eq i64 %argc, 1
  br i1 %t1492, label %argok385, label %arityerr384
arityerr384:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok385:
  %t1493 = call i64 @rt_integer_p(i64 %a0)
  %t1494 = icmp ne i64 %t1493, 1
  br i1 %t1494, label %then386, label %else387
then386:
  ret i64 %a0
else387:
  %t1495 = call i64 @rt_make_string(ptr @.str.lit.1, i64 25)
  %t1496 = load i64, ptr @"scheme.base:error"
  %t1497 = and i64 %t1496, -8
  %t1498 = inttoptr i64 %t1497 to ptr
  %t1499 = load i64, ptr %t1498
  %t1500 = inttoptr i64 %t1499 to ptr
  %t1501 = musttail call fastcc i64 %t1500(i64 %t1496, i64 2, i64 %t1495, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1501
}

define fastcc i64 @"scheme.base:code:denominator"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1506 = icmp eq i64 %argc, 1
  br i1 %t1506, label %argok389, label %arityerr388
arityerr388:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok389:
  %t1507 = call i64 @rt_integer_p(i64 %a0)
  %t1508 = icmp ne i64 %t1507, 1
  br i1 %t1508, label %then390, label %else391
then390:
  %t1509 = call i64 @rt_exact_p(i64 %a0)
  %t1510 = icmp ne i64 %t1509, 1
  br i1 %t1510, label %then392, label %else393
then392:
  ret i64 8
else393:
  %t1511 = call i64 @rt_flonum_lit(ptr @.flo.lit.2)
  ret i64 %t1511
else391:
  %t1512 = call i64 @rt_make_string(ptr @.str.lit.3, i64 27)
  %t1513 = load i64, ptr @"scheme.base:error"
  %t1514 = and i64 %t1513, -8
  %t1515 = inttoptr i64 %t1514 to ptr
  %t1516 = load i64, ptr %t1515
  %t1517 = inttoptr i64 %t1516 to ptr
  %t1518 = musttail call fastcc i64 %t1517(i64 %t1513, i64 2, i64 %t1512, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1518
}

define fastcc i64 @"scheme.base:code:inexact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1523 = icmp eq i64 %argc, 1
  br i1 %t1523, label %argok395, label %arityerr394
arityerr394:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok395:
  %t1524 = call i64 @rt_exact_to_inexact(i64 %a0)
  ret i64 %t1524
}

define fastcc i64 @"scheme.base:code:exact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1529 = icmp eq i64 %argc, 1
  br i1 %t1529, label %argok397, label %arityerr396
arityerr396:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok397:
  %t1530 = call i64 @rt_inexact_to_exact(i64 %a0)
  ret i64 %t1530
}

define fastcc i64 @"scheme.base:code:void"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1535 = icmp eq i64 %argc, 0
  br i1 %t1535, label %argok399, label %arityerr398
arityerr398:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok399:
  %t1536 = icmp ne i64 1, 1
  br i1 %t1536, label %then400, label %else401
then400:
  ret i64 1
else401:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1541 = icmp sge i64 %argc, 0
  br i1 %t1541, label %argok403, label %arityerr402
arityerr402:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok403:
  %t1542 = call ptr @rt_alloc_words(i64 8)
  %t1543 = getelementptr i64, ptr %t1542, i64 0
  store i64 %a0, ptr %t1543
  %t1544 = getelementptr i64, ptr %t1542, i64 1
  store i64 %a1, ptr %t1544
  %t1545 = getelementptr i64, ptr %t1542, i64 2
  store i64 %a2, ptr %t1545
  %t1546 = getelementptr i64, ptr %t1542, i64 3
  store i64 %a3, ptr %t1546
  %t1547 = getelementptr i64, ptr %t1542, i64 4
  store i64 %a4, ptr %t1547
  %t1548 = getelementptr i64, ptr %t1542, i64 5
  store i64 %a5, ptr %t1548
  %t1549 = getelementptr i64, ptr %t1542, i64 6
  store i64 %a6, ptr %t1549
  %t1550 = getelementptr i64, ptr %t1542, i64 7
  store i64 %a7, ptr %t1550
  %t1551 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1542, ptr %overflow)
  %t1552 = call i64 @rt_list_to_string(i64 %t1551)
  ret i64 %t1552
}

define fastcc i64 @"scheme.base:code:%str-concat"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1557 = icmp eq i64 %argc, 1
  br i1 %t1557, label %argok405, label %arityerr404
arityerr404:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok405:
  %t1558 = call i64 @rt_null_p(i64 %a0)
  %t1559 = icmp ne i64 %t1558, 1
  br i1 %t1559, label %then406, label %else407
then406:
  %t1560 = call i64 @rt_make_string(ptr @.str.lit.4, i64 0)
  ret i64 %t1560
else407:
  %t1561 = call i64 @rt_car(i64 %a0)
  %t1562 = call i64 @rt_cdr(i64 %a0)
  %t1563 = load i64, ptr @"scheme.base:%str-concat"
  %t1564 = and i64 %t1563, -8
  %t1565 = inttoptr i64 %t1564 to ptr
  %t1566 = load i64, ptr %t1565
  %t1567 = inttoptr i64 %t1566 to ptr
  %t1568 = call fastcc i64%t1567(i64 %t1563, i64 1, i64 %t1562, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1569 = call i64 @rt_string_append(i64 %t1561, i64 %t1568)
  ret i64 %t1569
}

define fastcc i64 @"scheme.base:code:chr-cmp"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1574 = icmp eq i64 %argc, 4
  br i1 %t1574, label %argok409, label %arityerr408
arityerr408:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok409:
  %t1575 = call i64 @rt_char_to_integer(i64 %a1)
  %t1576 = call i64 @rt_char_to_integer(i64 %a2)
  %t1577 = and i64 %a0, -8
  %t1578 = inttoptr i64 %t1577 to ptr
  %t1579 = load i64, ptr %t1578
  %t1580 = inttoptr i64 %t1579 to ptr
  %t1581 = call fastcc i64%t1580(i64 %a0, i64 2, i64 %t1575, i64 %t1576, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1582 = icmp ne i64 %t1581, 1
  br i1 %t1582, label %then410, label %else411
then410:
  %t1583 = call i64 @rt_null_p(i64 %a3)
  %t1584 = icmp ne i64 %t1583, 1
  br i1 %t1584, label %then412, label %else413
then412:
  ret i64 257
else413:
  %t1585 = call i64 @rt_car(i64 %a3)
  %t1586 = call i64 @rt_cdr(i64 %a3)
  %t1587 = load i64, ptr @"scheme.base:chr-cmp"
  %t1588 = and i64 %t1587, -8
  %t1589 = inttoptr i64 %t1588 to ptr
  %t1590 = load i64, ptr %t1589
  %t1591 = inttoptr i64 %t1590 to ptr
  %t1592 = musttail call fastcc i64 %t1591(i64 %t1587, i64 4, i64 %a0, i64 %a2, i64 %t1585, i64 %t1586, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1592
else411:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_333"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1597 = icmp eq i64 %argc, 2
  br i1 %t1597, label %argok415, label %arityerr414
arityerr414:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok415:
  %t1598 = or i64 %a0, %a1
  %t1599 = and i64 %t1598, 7
  %t1600 = icmp eq i64 %t1599, 0
  br i1 %t1600, label %fixfast416, label %fixslow417
fixfast416:
  %t1601 = icmp eq i64 %a0, %a1
  %t1602 = select i1 %t1601, i64 257, i64 1
  br label %fixmerge418
fixslow417:
  %t1603 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge418
fixmerge418:
  %t1604 = phi i64 [ %t1602, %fixfast416 ], [ %t1603, %fixslow417 ]
  ret i64 %t1604
}

define fastcc i64 @"scheme.base:code:char=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1605 = icmp sge i64 %argc, 2
  br i1 %t1605, label %argok420, label %arityerr419
arityerr419:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok420:
  %t1606 = call ptr @rt_alloc_words(i64 8)
  %t1607 = getelementptr i64, ptr %t1606, i64 0
  store i64 %a0, ptr %t1607
  %t1608 = getelementptr i64, ptr %t1606, i64 1
  store i64 %a1, ptr %t1608
  %t1609 = getelementptr i64, ptr %t1606, i64 2
  store i64 %a2, ptr %t1609
  %t1610 = getelementptr i64, ptr %t1606, i64 3
  store i64 %a3, ptr %t1610
  %t1611 = getelementptr i64, ptr %t1606, i64 4
  store i64 %a4, ptr %t1611
  %t1612 = getelementptr i64, ptr %t1606, i64 5
  store i64 %a5, ptr %t1612
  %t1613 = getelementptr i64, ptr %t1606, i64 6
  store i64 %a6, ptr %t1613
  %t1614 = getelementptr i64, ptr %t1606, i64 7
  store i64 %a7, ptr %t1614
  %t1615 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1606, ptr %overflow)
  %t1616 = call ptr @rt_alloc_words(i64 1)
  %t1617 = ptrtoint ptr %t1616 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_333" to i64), ptr %t1616
  %t1618 = or i64 %t1617, 4
  %t1619 = load i64, ptr @"scheme.base:chr-cmp"
  %t1620 = and i64 %t1619, -8
  %t1621 = inttoptr i64 %t1620 to ptr
  %t1622 = load i64, ptr %t1621
  %t1623 = inttoptr i64 %t1622 to ptr
  %t1624 = musttail call fastcc i64 %t1623(i64 %t1619, i64 4, i64 %t1618, i64 %a0, i64 %a1, i64 %t1615, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1624
}

define fastcc i64 @"scheme.base:code_345"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1629 = icmp eq i64 %argc, 2
  br i1 %t1629, label %argok422, label %arityerr421
arityerr421:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok422:
  %t1630 = or i64 %a0, %a1
  %t1631 = and i64 %t1630, 7
  %t1632 = icmp eq i64 %t1631, 0
  br i1 %t1632, label %fixfast423, label %fixslow424
fixfast423:
  %t1633 = icmp slt i64 %a0, %a1
  %t1634 = select i1 %t1633, i64 257, i64 1
  br label %fixmerge425
fixslow424:
  %t1635 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge425
fixmerge425:
  %t1636 = phi i64 [ %t1634, %fixfast423 ], [ %t1635, %fixslow424 ]
  ret i64 %t1636
}

define fastcc i64 @"scheme.base:code:char<?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1637 = icmp sge i64 %argc, 2
  br i1 %t1637, label %argok427, label %arityerr426
arityerr426:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok427:
  %t1638 = call ptr @rt_alloc_words(i64 8)
  %t1639 = getelementptr i64, ptr %t1638, i64 0
  store i64 %a0, ptr %t1639
  %t1640 = getelementptr i64, ptr %t1638, i64 1
  store i64 %a1, ptr %t1640
  %t1641 = getelementptr i64, ptr %t1638, i64 2
  store i64 %a2, ptr %t1641
  %t1642 = getelementptr i64, ptr %t1638, i64 3
  store i64 %a3, ptr %t1642
  %t1643 = getelementptr i64, ptr %t1638, i64 4
  store i64 %a4, ptr %t1643
  %t1644 = getelementptr i64, ptr %t1638, i64 5
  store i64 %a5, ptr %t1644
  %t1645 = getelementptr i64, ptr %t1638, i64 6
  store i64 %a6, ptr %t1645
  %t1646 = getelementptr i64, ptr %t1638, i64 7
  store i64 %a7, ptr %t1646
  %t1647 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1638, ptr %overflow)
  %t1648 = call ptr @rt_alloc_words(i64 1)
  %t1649 = ptrtoint ptr %t1648 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_345" to i64), ptr %t1648
  %t1650 = or i64 %t1649, 4
  %t1651 = load i64, ptr @"scheme.base:chr-cmp"
  %t1652 = and i64 %t1651, -8
  %t1653 = inttoptr i64 %t1652 to ptr
  %t1654 = load i64, ptr %t1653
  %t1655 = inttoptr i64 %t1654 to ptr
  %t1656 = musttail call fastcc i64 %t1655(i64 %t1651, i64 4, i64 %t1650, i64 %a0, i64 %a1, i64 %t1647, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1656
}

define fastcc i64 @"scheme.base:code_357"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1661 = icmp eq i64 %argc, 2
  br i1 %t1661, label %argok429, label %arityerr428
arityerr428:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok429:
  %t1662 = or i64 %a1, %a0
  %t1663 = and i64 %t1662, 7
  %t1664 = icmp eq i64 %t1663, 0
  br i1 %t1664, label %fixfast430, label %fixslow431
fixfast430:
  %t1665 = icmp slt i64 %a1, %a0
  %t1666 = select i1 %t1665, i64 257, i64 1
  br label %fixmerge432
fixslow431:
  %t1667 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge432
fixmerge432:
  %t1668 = phi i64 [ %t1666, %fixfast430 ], [ %t1667, %fixslow431 ]
  ret i64 %t1668
}

define fastcc i64 @"scheme.base:code:char>?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1669 = icmp sge i64 %argc, 2
  br i1 %t1669, label %argok434, label %arityerr433
arityerr433:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok434:
  %t1670 = call ptr @rt_alloc_words(i64 8)
  %t1671 = getelementptr i64, ptr %t1670, i64 0
  store i64 %a0, ptr %t1671
  %t1672 = getelementptr i64, ptr %t1670, i64 1
  store i64 %a1, ptr %t1672
  %t1673 = getelementptr i64, ptr %t1670, i64 2
  store i64 %a2, ptr %t1673
  %t1674 = getelementptr i64, ptr %t1670, i64 3
  store i64 %a3, ptr %t1674
  %t1675 = getelementptr i64, ptr %t1670, i64 4
  store i64 %a4, ptr %t1675
  %t1676 = getelementptr i64, ptr %t1670, i64 5
  store i64 %a5, ptr %t1676
  %t1677 = getelementptr i64, ptr %t1670, i64 6
  store i64 %a6, ptr %t1677
  %t1678 = getelementptr i64, ptr %t1670, i64 7
  store i64 %a7, ptr %t1678
  %t1679 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1670, ptr %overflow)
  %t1680 = call ptr @rt_alloc_words(i64 1)
  %t1681 = ptrtoint ptr %t1680 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_357" to i64), ptr %t1680
  %t1682 = or i64 %t1681, 4
  %t1683 = load i64, ptr @"scheme.base:chr-cmp"
  %t1684 = and i64 %t1683, -8
  %t1685 = inttoptr i64 %t1684 to ptr
  %t1686 = load i64, ptr %t1685
  %t1687 = inttoptr i64 %t1686 to ptr
  %t1688 = musttail call fastcc i64 %t1687(i64 %t1683, i64 4, i64 %t1682, i64 %a0, i64 %a1, i64 %t1679, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1688
}

define fastcc i64 @"scheme.base:code_369"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1693 = icmp eq i64 %argc, 2
  br i1 %t1693, label %argok436, label %arityerr435
arityerr435:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok436:
  %t1694 = or i64 %a0, %a1
  %t1695 = and i64 %t1694, 7
  %t1696 = icmp eq i64 %t1695, 0
  br i1 %t1696, label %fixfast437, label %fixslow438
fixfast437:
  %t1697 = icmp slt i64 %a0, %a1
  %t1698 = select i1 %t1697, i64 257, i64 1
  br label %fixmerge439
fixslow438:
  %t1699 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge439
fixmerge439:
  %t1700 = phi i64 [ %t1698, %fixfast437 ], [ %t1699, %fixslow438 ]
  %t1701 = icmp ne i64 %t1700, 1
  br i1 %t1701, label %then440, label %else441
then440:
  ret i64 257
else441:
  %t1702 = or i64 %a0, %a1
  %t1703 = and i64 %t1702, 7
  %t1704 = icmp eq i64 %t1703, 0
  br i1 %t1704, label %fixfast442, label %fixslow443
fixfast442:
  %t1705 = icmp eq i64 %a0, %a1
  %t1706 = select i1 %t1705, i64 257, i64 1
  br label %fixmerge444
fixslow443:
  %t1707 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge444
fixmerge444:
  %t1708 = phi i64 [ %t1706, %fixfast442 ], [ %t1707, %fixslow443 ]
  ret i64 %t1708
}

define fastcc i64 @"scheme.base:code:char<=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1709 = icmp sge i64 %argc, 2
  br i1 %t1709, label %argok446, label %arityerr445
arityerr445:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok446:
  %t1710 = call ptr @rt_alloc_words(i64 8)
  %t1711 = getelementptr i64, ptr %t1710, i64 0
  store i64 %a0, ptr %t1711
  %t1712 = getelementptr i64, ptr %t1710, i64 1
  store i64 %a1, ptr %t1712
  %t1713 = getelementptr i64, ptr %t1710, i64 2
  store i64 %a2, ptr %t1713
  %t1714 = getelementptr i64, ptr %t1710, i64 3
  store i64 %a3, ptr %t1714
  %t1715 = getelementptr i64, ptr %t1710, i64 4
  store i64 %a4, ptr %t1715
  %t1716 = getelementptr i64, ptr %t1710, i64 5
  store i64 %a5, ptr %t1716
  %t1717 = getelementptr i64, ptr %t1710, i64 6
  store i64 %a6, ptr %t1717
  %t1718 = getelementptr i64, ptr %t1710, i64 7
  store i64 %a7, ptr %t1718
  %t1719 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1710, ptr %overflow)
  %t1720 = call ptr @rt_alloc_words(i64 1)
  %t1721 = ptrtoint ptr %t1720 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_369" to i64), ptr %t1720
  %t1722 = or i64 %t1721, 4
  %t1723 = load i64, ptr @"scheme.base:chr-cmp"
  %t1724 = and i64 %t1723, -8
  %t1725 = inttoptr i64 %t1724 to ptr
  %t1726 = load i64, ptr %t1725
  %t1727 = inttoptr i64 %t1726 to ptr
  %t1728 = musttail call fastcc i64 %t1727(i64 %t1723, i64 4, i64 %t1722, i64 %a0, i64 %a1, i64 %t1719, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1728
}

define fastcc i64 @"scheme.base:code_381"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1733 = icmp eq i64 %argc, 2
  br i1 %t1733, label %argok448, label %arityerr447
arityerr447:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok448:
  %t1734 = or i64 %a1, %a0
  %t1735 = and i64 %t1734, 7
  %t1736 = icmp eq i64 %t1735, 0
  br i1 %t1736, label %fixfast449, label %fixslow450
fixfast449:
  %t1737 = icmp slt i64 %a1, %a0
  %t1738 = select i1 %t1737, i64 257, i64 1
  br label %fixmerge451
fixslow450:
  %t1739 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge451
fixmerge451:
  %t1740 = phi i64 [ %t1738, %fixfast449 ], [ %t1739, %fixslow450 ]
  %t1741 = icmp ne i64 %t1740, 1
  br i1 %t1741, label %then452, label %else453
then452:
  ret i64 257
else453:
  %t1742 = or i64 %a0, %a1
  %t1743 = and i64 %t1742, 7
  %t1744 = icmp eq i64 %t1743, 0
  br i1 %t1744, label %fixfast454, label %fixslow455
fixfast454:
  %t1745 = icmp eq i64 %a0, %a1
  %t1746 = select i1 %t1745, i64 257, i64 1
  br label %fixmerge456
fixslow455:
  %t1747 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge456
fixmerge456:
  %t1748 = phi i64 [ %t1746, %fixfast454 ], [ %t1747, %fixslow455 ]
  ret i64 %t1748
}

define fastcc i64 @"scheme.base:code:char>=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1749 = icmp sge i64 %argc, 2
  br i1 %t1749, label %argok458, label %arityerr457
arityerr457:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok458:
  %t1750 = call ptr @rt_alloc_words(i64 8)
  %t1751 = getelementptr i64, ptr %t1750, i64 0
  store i64 %a0, ptr %t1751
  %t1752 = getelementptr i64, ptr %t1750, i64 1
  store i64 %a1, ptr %t1752
  %t1753 = getelementptr i64, ptr %t1750, i64 2
  store i64 %a2, ptr %t1753
  %t1754 = getelementptr i64, ptr %t1750, i64 3
  store i64 %a3, ptr %t1754
  %t1755 = getelementptr i64, ptr %t1750, i64 4
  store i64 %a4, ptr %t1755
  %t1756 = getelementptr i64, ptr %t1750, i64 5
  store i64 %a5, ptr %t1756
  %t1757 = getelementptr i64, ptr %t1750, i64 6
  store i64 %a6, ptr %t1757
  %t1758 = getelementptr i64, ptr %t1750, i64 7
  store i64 %a7, ptr %t1758
  %t1759 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1750, ptr %overflow)
  %t1760 = call ptr @rt_alloc_words(i64 1)
  %t1761 = ptrtoint ptr %t1760 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_381" to i64), ptr %t1760
  %t1762 = or i64 %t1761, 4
  %t1763 = load i64, ptr @"scheme.base:chr-cmp"
  %t1764 = and i64 %t1763, -8
  %t1765 = inttoptr i64 %t1764 to ptr
  %t1766 = load i64, ptr %t1765
  %t1767 = inttoptr i64 %t1766 to ptr
  %t1768 = musttail call fastcc i64 %t1767(i64 %t1763, i64 4, i64 %t1762, i64 %a0, i64 %a1, i64 %t1759, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1768
}

define fastcc i64 @"scheme.base:code_392"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1773 = icmp eq i64 %argc, 2
  br i1 %t1773, label %argok460, label %arityerr459
arityerr459:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok460:
  %t1774 = or i64 %a0, 0
  %t1775 = and i64 %t1774, 7
  %t1776 = icmp eq i64 %t1775, 0
  br i1 %t1776, label %fixfast461, label %fixslow462
fixfast461:
  %t1777 = icmp slt i64 %a0, 0
  %t1778 = select i1 %t1777, i64 257, i64 1
  br label %fixmerge463
fixslow462:
  %t1779 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge463
fixmerge463:
  %t1780 = phi i64 [ %t1778, %fixfast461 ], [ %t1779, %fixslow462 ]
  %t1781 = icmp ne i64 %t1780, 1
  br i1 %t1781, label %then464, label %else465
then464:
  ret i64 %a1
else465:
  %t1782 = or i64 %a0, 8
  %t1783 = and i64 %t1782, 7
  %t1784 = icmp eq i64 %t1783, 0
  br i1 %t1784, label %fixfast466, label %fixslow467
fixfast466:
  %t1785 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t1786 = extractvalue {i64, i1} %t1785, 0
  %t1787 = extractvalue {i64, i1} %t1785, 1
  br i1 %t1787, label %fixslow467, label %fixmerge468
fixslow467:
  %t1788 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge468
fixmerge468:
  %t1789 = phi i64 [ %t1786, %fixfast466 ], [ %t1788, %fixslow467 ]
  %t1790 = and i64 %self, -8
  %t1791 = inttoptr i64 %t1790 to ptr
  %t1792 = getelementptr i64, ptr %t1791, i64 2
  %t1793 = load i64, ptr %t1792
  %t1794 = call i64 @rt_string_ref(i64 %t1793, i64 %a0)
  %t1795 = call i64 @rt_cons(i64 %t1794, i64 %a1)
  %t1796 = musttail call fastcc i64 @"scheme.base:code_392"(i64 %self, i64 2, i64 %t1789, i64 %t1795, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1796
}

define fastcc i64 @"scheme.base:code:string->list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1797 = icmp eq i64 %argc, 1
  br i1 %t1797, label %argok470, label %arityerr469
arityerr469:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok470:
  %t1798 = call ptr @rt_alloc_words(i64 3)
  %t1799 = ptrtoint ptr %t1798 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_392" to i64), ptr %t1798
  %t1800 = or i64 %t1799, 4
  %t1801 = getelementptr i64, ptr %t1798, i64 1
  store i64 %t1800, ptr %t1801
  %t1802 = getelementptr i64, ptr %t1798, i64 2
  store i64 %a0, ptr %t1802
  %t1803 = call i64 @rt_string_length(i64 %a0)
  %t1804 = or i64 %t1803, 8
  %t1805 = and i64 %t1804, 7
  %t1806 = icmp eq i64 %t1805, 0
  br i1 %t1806, label %fixfast471, label %fixslow472
fixfast471:
  %t1807 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t1803, i64 8)
  %t1808 = extractvalue {i64, i1} %t1807, 0
  %t1809 = extractvalue {i64, i1} %t1807, 1
  br i1 %t1809, label %fixslow472, label %fixmerge473
fixslow472:
  %t1810 = call i64 @rt_sub(i64 %t1803, i64 8)
  br label %fixmerge473
fixmerge473:
  %t1811 = phi i64 [ %t1808, %fixfast471 ], [ %t1810, %fixslow472 ]
  %t1812 = musttail call fastcc i64 @"scheme.base:code_392"(i64 %t1800, i64 2, i64 %t1811, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1812
}

define fastcc i64 @"scheme.base:code:ns-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1817 = icmp eq i64 %argc, 2
  br i1 %t1817, label %argok475, label %arityerr474
arityerr474:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok475:
  %t1818 = load i64, ptr @"scheme.base:ns-digits-radix"
  %t1819 = and i64 %t1818, -8
  %t1820 = inttoptr i64 %t1819 to ptr
  %t1821 = load i64, ptr %t1820
  %t1822 = inttoptr i64 %t1821 to ptr
  %t1823 = musttail call fastcc i64 %t1822(i64 %t1818, i64 3, i64 %a0, i64 80, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1823
}

define fastcc i64 @"scheme.base:code:%ns-digit-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1828 = icmp eq i64 %argc, 1
  br i1 %t1828, label %argok477, label %arityerr476
arityerr476:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok477:
  %t1829 = or i64 %a0, 80
  %t1830 = and i64 %t1829, 7
  %t1831 = icmp eq i64 %t1830, 0
  br i1 %t1831, label %fixfast478, label %fixslow479
fixfast478:
  %t1832 = icmp slt i64 %a0, 80
  %t1833 = select i1 %t1832, i64 257, i64 1
  br label %fixmerge480
fixslow479:
  %t1834 = call i64 @rt_lt(i64 %a0, i64 80)
  br label %fixmerge480
fixmerge480:
  %t1835 = phi i64 [ %t1833, %fixfast478 ], [ %t1834, %fixslow479 ]
  %t1836 = icmp ne i64 %t1835, 1
  br i1 %t1836, label %then481, label %else482
then481:
  %t1837 = or i64 384, %a0
  %t1838 = and i64 %t1837, 7
  %t1839 = icmp eq i64 %t1838, 0
  br i1 %t1839, label %fixfast483, label %fixslow484
fixfast483:
  %t1840 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 384, i64 %a0)
  %t1841 = extractvalue {i64, i1} %t1840, 0
  %t1842 = extractvalue {i64, i1} %t1840, 1
  br i1 %t1842, label %fixslow484, label %fixmerge485
fixslow484:
  %t1843 = call i64 @rt_add(i64 384, i64 %a0)
  br label %fixmerge485
fixmerge485:
  %t1844 = phi i64 [ %t1841, %fixfast483 ], [ %t1843, %fixslow484 ]
  %t1845 = call i64 @rt_integer_to_char(i64 %t1844)
  ret i64 %t1845
else482:
  %t1846 = or i64 696, %a0
  %t1847 = and i64 %t1846, 7
  %t1848 = icmp eq i64 %t1847, 0
  br i1 %t1848, label %fixfast486, label %fixslow487
fixfast486:
  %t1849 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 696, i64 %a0)
  %t1850 = extractvalue {i64, i1} %t1849, 0
  %t1851 = extractvalue {i64, i1} %t1849, 1
  br i1 %t1851, label %fixslow487, label %fixmerge488
fixslow487:
  %t1852 = call i64 @rt_add(i64 696, i64 %a0)
  br label %fixmerge488
fixmerge488:
  %t1853 = phi i64 [ %t1850, %fixfast486 ], [ %t1852, %fixslow487 ]
  %t1854 = call i64 @rt_integer_to_char(i64 %t1853)
  ret i64 %t1854
}

define fastcc i64 @"scheme.base:code:ns-digits-radix"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1859 = icmp eq i64 %argc, 3
  br i1 %t1859, label %argok490, label %arityerr489
arityerr489:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok490:
  %t1860 = call i64 @rt_remainder(i64 %a0, i64 %a1)
  %t1861 = or i64 0, %t1860
  %t1862 = and i64 %t1861, 7
  %t1863 = icmp eq i64 %t1862, 0
  br i1 %t1863, label %fixfast491, label %fixslow492
fixfast491:
  %t1864 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %t1860)
  %t1865 = extractvalue {i64, i1} %t1864, 0
  %t1866 = extractvalue {i64, i1} %t1864, 1
  br i1 %t1866, label %fixslow492, label %fixmerge493
fixslow492:
  %t1867 = call i64 @rt_sub(i64 0, i64 %t1860)
  br label %fixmerge493
fixmerge493:
  %t1868 = phi i64 [ %t1865, %fixfast491 ], [ %t1867, %fixslow492 ]
  %t1869 = load i64, ptr @"scheme.base:%ns-digit-char"
  %t1870 = and i64 %t1869, -8
  %t1871 = inttoptr i64 %t1870 to ptr
  %t1872 = load i64, ptr %t1871
  %t1873 = inttoptr i64 %t1872 to ptr
  %t1874 = call fastcc i64%t1873(i64 %t1869, i64 1, i64 %t1868, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1875 = call i64 @rt_quotient(i64 %a0, i64 %a1)
  %t1876 = or i64 %t1875, 0
  %t1877 = and i64 %t1876, 7
  %t1878 = icmp eq i64 %t1877, 0
  br i1 %t1878, label %fixfast494, label %fixslow495
fixfast494:
  %t1879 = icmp eq i64 %t1875, 0
  %t1880 = select i1 %t1879, i64 257, i64 1
  br label %fixmerge496
fixslow495:
  %t1881 = call i64 @rt_num_eq(i64 %t1875, i64 0)
  br label %fixmerge496
fixmerge496:
  %t1882 = phi i64 [ %t1880, %fixfast494 ], [ %t1881, %fixslow495 ]
  %t1883 = icmp ne i64 %t1882, 1
  br i1 %t1883, label %then497, label %else498
then497:
  %t1884 = call i64 @rt_cons(i64 %t1874, i64 %a2)
  ret i64 %t1884
else498:
  %t1885 = call i64 @rt_cons(i64 %t1874, i64 %a2)
  %t1886 = load i64, ptr @"scheme.base:ns-digits-radix"
  %t1887 = and i64 %t1886, -8
  %t1888 = inttoptr i64 %t1887 to ptr
  %t1889 = load i64, ptr %t1888
  %t1890 = inttoptr i64 %t1889 to ptr
  %t1891 = musttail call fastcc i64 %t1890(i64 %t1886, i64 3, i64 %t1875, i64 %a1, i64 %t1885, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1891
}

define fastcc i64 @"scheme.base:code:%radix-ok?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1896 = icmp eq i64 %argc, 1
  br i1 %t1896, label %argok500, label %arityerr499
arityerr499:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok500:
  %t1897 = or i64 %a0, 80
  %t1898 = and i64 %t1897, 7
  %t1899 = icmp eq i64 %t1898, 0
  br i1 %t1899, label %fixfast501, label %fixslow502
fixfast501:
  %t1900 = icmp eq i64 %a0, 80
  %t1901 = select i1 %t1900, i64 257, i64 1
  br label %fixmerge503
fixslow502:
  %t1902 = call i64 @rt_num_eq(i64 %a0, i64 80)
  br label %fixmerge503
fixmerge503:
  %t1903 = phi i64 [ %t1901, %fixfast501 ], [ %t1902, %fixslow502 ]
  %t1904 = icmp ne i64 %t1903, 1
  br i1 %t1904, label %then504, label %else505
then504:
  ret i64 257
else505:
  %t1905 = or i64 %a0, 128
  %t1906 = and i64 %t1905, 7
  %t1907 = icmp eq i64 %t1906, 0
  br i1 %t1907, label %fixfast506, label %fixslow507
fixfast506:
  %t1908 = icmp eq i64 %a0, 128
  %t1909 = select i1 %t1908, i64 257, i64 1
  br label %fixmerge508
fixslow507:
  %t1910 = call i64 @rt_num_eq(i64 %a0, i64 128)
  br label %fixmerge508
fixmerge508:
  %t1911 = phi i64 [ %t1909, %fixfast506 ], [ %t1910, %fixslow507 ]
  %t1912 = icmp ne i64 %t1911, 1
  br i1 %t1912, label %then509, label %else510
then509:
  ret i64 257
else510:
  %t1913 = or i64 %a0, 64
  %t1914 = and i64 %t1913, 7
  %t1915 = icmp eq i64 %t1914, 0
  br i1 %t1915, label %fixfast511, label %fixslow512
fixfast511:
  %t1916 = icmp eq i64 %a0, 64
  %t1917 = select i1 %t1916, i64 257, i64 1
  br label %fixmerge513
fixslow512:
  %t1918 = call i64 @rt_num_eq(i64 %a0, i64 64)
  br label %fixmerge513
fixmerge513:
  %t1919 = phi i64 [ %t1917, %fixfast511 ], [ %t1918, %fixslow512 ]
  %t1920 = icmp ne i64 %t1919, 1
  br i1 %t1920, label %then514, label %else515
then514:
  ret i64 257
else515:
  %t1921 = or i64 %a0, 16
  %t1922 = and i64 %t1921, 7
  %t1923 = icmp eq i64 %t1922, 0
  br i1 %t1923, label %fixfast516, label %fixslow517
fixfast516:
  %t1924 = icmp eq i64 %a0, 16
  %t1925 = select i1 %t1924, i64 257, i64 1
  br label %fixmerge518
fixslow517:
  %t1926 = call i64 @rt_num_eq(i64 %a0, i64 16)
  br label %fixmerge518
fixmerge518:
  %t1927 = phi i64 [ %t1925, %fixfast516 ], [ %t1926, %fixslow517 ]
  ret i64 %t1927
}

define fastcc i64 @"scheme.base:code:number->string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1932 = icmp sge i64 %argc, 1
  br i1 %t1932, label %argok520, label %arityerr519
arityerr519:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok520:
  %t1933 = call ptr @rt_alloc_words(i64 8)
  %t1934 = getelementptr i64, ptr %t1933, i64 0
  store i64 %a0, ptr %t1934
  %t1935 = getelementptr i64, ptr %t1933, i64 1
  store i64 %a1, ptr %t1935
  %t1936 = getelementptr i64, ptr %t1933, i64 2
  store i64 %a2, ptr %t1936
  %t1937 = getelementptr i64, ptr %t1933, i64 3
  store i64 %a3, ptr %t1937
  %t1938 = getelementptr i64, ptr %t1933, i64 4
  store i64 %a4, ptr %t1938
  %t1939 = getelementptr i64, ptr %t1933, i64 5
  store i64 %a5, ptr %t1939
  %t1940 = getelementptr i64, ptr %t1933, i64 6
  store i64 %a6, ptr %t1940
  %t1941 = getelementptr i64, ptr %t1933, i64 7
  store i64 %a7, ptr %t1941
  %t1942 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t1933, ptr %overflow)
  %t1943 = call i64 @rt_null_p(i64 %t1942)
  %t1944 = icmp ne i64 %t1943, 1
  br i1 %t1944, label %then521, label %else522
then521:
  br label %merge523
else522:
  %t1945 = call i64 @rt_car(i64 %t1942)
  br label %merge523
merge523:
  %t1946 = phi i64 [ 80, %then521 ], [ %t1945, %else522 ]
  %t1947 = load i64, ptr @"scheme.base:%radix-ok?"
  %t1948 = and i64 %t1947, -8
  %t1949 = inttoptr i64 %t1948 to ptr
  %t1950 = load i64, ptr %t1949
  %t1951 = inttoptr i64 %t1950 to ptr
  %t1952 = call fastcc i64%t1951(i64 %t1947, i64 1, i64 %t1946, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1953 = icmp ne i64 %t1952, 1
  br i1 %t1953, label %then524, label %else525
then524:
  %t1954 = call i64 @rt_exact_p(i64 %a0)
  %t1955 = icmp ne i64 %t1954, 1
  br i1 %t1955, label %then526, label %else527
then526:
  %t1956 = or i64 %a0, 0
  %t1957 = and i64 %t1956, 7
  %t1958 = icmp eq i64 %t1957, 0
  br i1 %t1958, label %fixfast528, label %fixslow529
fixfast528:
  %t1959 = icmp eq i64 %a0, 0
  %t1960 = select i1 %t1959, i64 257, i64 1
  br label %fixmerge530
fixslow529:
  %t1961 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge530
fixmerge530:
  %t1962 = phi i64 [ %t1960, %fixfast528 ], [ %t1961, %fixslow529 ]
  %t1963 = icmp ne i64 %t1962, 1
  br i1 %t1963, label %then531, label %else532
then531:
  %t1964 = call i64 @rt_make_string(ptr @.str.lit.5, i64 1)
  ret i64 %t1964
else532:
  %t1965 = or i64 %a0, 0
  %t1966 = and i64 %t1965, 7
  %t1967 = icmp eq i64 %t1966, 0
  br i1 %t1967, label %fixfast533, label %fixslow534
fixfast533:
  %t1968 = icmp slt i64 %a0, 0
  %t1969 = select i1 %t1968, i64 257, i64 1
  br label %fixmerge535
fixslow534:
  %t1970 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge535
fixmerge535:
  %t1971 = phi i64 [ %t1969, %fixfast533 ], [ %t1970, %fixslow534 ]
  %t1972 = icmp ne i64 %t1971, 1
  br i1 %t1972, label %then536, label %else537
then536:
  %t1973 = load i64, ptr @"scheme.base:ns-digits-radix"
  %t1974 = and i64 %t1973, -8
  %t1975 = inttoptr i64 %t1974 to ptr
  %t1976 = load i64, ptr %t1975
  %t1977 = inttoptr i64 %t1976 to ptr
  %t1978 = call fastcc i64%t1977(i64 %t1973, i64 3, i64 %a0, i64 %t1946, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1979 = call i64 @rt_cons(i64 11529, i64 %t1978)
  %t1980 = call i64 @rt_list_to_string(i64 %t1979)
  ret i64 %t1980
else537:
  %t1981 = or i64 0, %a0
  %t1982 = and i64 %t1981, 7
  %t1983 = icmp eq i64 %t1982, 0
  br i1 %t1983, label %fixfast538, label %fixslow539
fixfast538:
  %t1984 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %a0)
  %t1985 = extractvalue {i64, i1} %t1984, 0
  %t1986 = extractvalue {i64, i1} %t1984, 1
  br i1 %t1986, label %fixslow539, label %fixmerge540
fixslow539:
  %t1987 = call i64 @rt_sub(i64 0, i64 %a0)
  br label %fixmerge540
fixmerge540:
  %t1988 = phi i64 [ %t1985, %fixfast538 ], [ %t1987, %fixslow539 ]
  %t1989 = load i64, ptr @"scheme.base:ns-digits-radix"
  %t1990 = and i64 %t1989, -8
  %t1991 = inttoptr i64 %t1990 to ptr
  %t1992 = load i64, ptr %t1991
  %t1993 = inttoptr i64 %t1992 to ptr
  %t1994 = call fastcc i64%t1993(i64 %t1989, i64 3, i64 %t1988, i64 %t1946, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1995 = call i64 @rt_list_to_string(i64 %t1994)
  ret i64 %t1995
else527:
  %t1996 = or i64 %t1946, 80
  %t1997 = and i64 %t1996, 7
  %t1998 = icmp eq i64 %t1997, 0
  br i1 %t1998, label %fixfast541, label %fixslow542
fixfast541:
  %t1999 = icmp eq i64 %t1946, 80
  %t2000 = select i1 %t1999, i64 257, i64 1
  br label %fixmerge543
fixslow542:
  %t2001 = call i64 @rt_num_eq(i64 %t1946, i64 80)
  br label %fixmerge543
fixmerge543:
  %t2002 = phi i64 [ %t2000, %fixfast541 ], [ %t2001, %fixslow542 ]
  %t2003 = icmp ne i64 %t2002, 1
  br i1 %t2003, label %then544, label %else545
then544:
  %t2004 = call i64 @rt_flonum_to_string(i64 %a0)
  ret i64 %t2004
else545:
  %t2005 = call i64 @rt_make_string(ptr @.str.lit.6, i64 54)
  %t2006 = load i64, ptr @"scheme.base:error"
  %t2007 = and i64 %t2006, -8
  %t2008 = inttoptr i64 %t2007 to ptr
  %t2009 = load i64, ptr %t2008
  %t2010 = inttoptr i64 %t2009 to ptr
  %t2011 = musttail call fastcc i64 %t2010(i64 %t2006, i64 2, i64 %t2005, i64 %t1946, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2011
else525:
  %t2012 = call i64 @rt_make_string(ptr @.str.lit.7, i64 33)
  %t2013 = load i64, ptr @"scheme.base:error"
  %t2014 = and i64 %t2013, -8
  %t2015 = inttoptr i64 %t2014 to ptr
  %t2016 = load i64, ptr %t2015
  %t2017 = inttoptr i64 %t2016 to ptr
  %t2018 = musttail call fastcc i64 %t2017(i64 %t2013, i64 2, i64 %t2012, i64 %t1946, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2018
}

define fastcc i64 @"scheme.base:code:%digit-in-radix"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2023 = icmp eq i64 %argc, 2
  br i1 %t2023, label %argok547, label %arityerr546
arityerr546:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok547:
  %t2024 = call i64 @rt_char_to_integer(i64 %a0)
  %t2025 = or i64 376, %t2024
  %t2026 = and i64 %t2025, 7
  %t2027 = icmp eq i64 %t2026, 0
  br i1 %t2027, label %fixfast548, label %fixslow549
fixfast548:
  %t2028 = icmp slt i64 376, %t2024
  %t2029 = select i1 %t2028, i64 257, i64 1
  br label %fixmerge550
fixslow549:
  %t2030 = call i64 @rt_lt(i64 376, i64 %t2024)
  br label %fixmerge550
fixmerge550:
  %t2031 = phi i64 [ %t2029, %fixfast548 ], [ %t2030, %fixslow549 ]
  %t2032 = icmp ne i64 %t2031, 1
  br i1 %t2032, label %then551, label %else552
then551:
  %t2033 = or i64 %t2024, 464
  %t2034 = and i64 %t2033, 7
  %t2035 = icmp eq i64 %t2034, 0
  br i1 %t2035, label %fixfast554, label %fixslow555
fixfast554:
  %t2036 = icmp slt i64 %t2024, 464
  %t2037 = select i1 %t2036, i64 257, i64 1
  br label %fixmerge556
fixslow555:
  %t2038 = call i64 @rt_lt(i64 %t2024, i64 464)
  br label %fixmerge556
fixmerge556:
  %t2039 = phi i64 [ %t2037, %fixfast554 ], [ %t2038, %fixslow555 ]
  br label %merge553
else552:
  br label %merge553
merge553:
  %t2040 = phi i64 [ %t2039, %fixmerge556 ], [ 1, %else552 ]
  %t2041 = icmp ne i64 %t2040, 1
  br i1 %t2041, label %then557, label %else558
then557:
  %t2042 = or i64 %t2024, 384
  %t2043 = and i64 %t2042, 7
  %t2044 = icmp eq i64 %t2043, 0
  br i1 %t2044, label %fixfast560, label %fixslow561
fixfast560:
  %t2045 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t2024, i64 384)
  %t2046 = extractvalue {i64, i1} %t2045, 0
  %t2047 = extractvalue {i64, i1} %t2045, 1
  br i1 %t2047, label %fixslow561, label %fixmerge562
fixslow561:
  %t2048 = call i64 @rt_sub(i64 %t2024, i64 384)
  br label %fixmerge562
fixmerge562:
  %t2049 = phi i64 [ %t2046, %fixfast560 ], [ %t2048, %fixslow561 ]
  br label %merge559
else558:
  %t2050 = or i64 768, %t2024
  %t2051 = and i64 %t2050, 7
  %t2052 = icmp eq i64 %t2051, 0
  br i1 %t2052, label %fixfast563, label %fixslow564
fixfast563:
  %t2053 = icmp slt i64 768, %t2024
  %t2054 = select i1 %t2053, i64 257, i64 1
  br label %fixmerge565
fixslow564:
  %t2055 = call i64 @rt_lt(i64 768, i64 %t2024)
  br label %fixmerge565
fixmerge565:
  %t2056 = phi i64 [ %t2054, %fixfast563 ], [ %t2055, %fixslow564 ]
  %t2057 = icmp ne i64 %t2056, 1
  br i1 %t2057, label %then566, label %else567
then566:
  %t2058 = or i64 %t2024, 984
  %t2059 = and i64 %t2058, 7
  %t2060 = icmp eq i64 %t2059, 0
  br i1 %t2060, label %fixfast569, label %fixslow570
fixfast569:
  %t2061 = icmp slt i64 %t2024, 984
  %t2062 = select i1 %t2061, i64 257, i64 1
  br label %fixmerge571
fixslow570:
  %t2063 = call i64 @rt_lt(i64 %t2024, i64 984)
  br label %fixmerge571
fixmerge571:
  %t2064 = phi i64 [ %t2062, %fixfast569 ], [ %t2063, %fixslow570 ]
  br label %merge568
else567:
  br label %merge568
merge568:
  %t2065 = phi i64 [ %t2064, %fixmerge571 ], [ 1, %else567 ]
  %t2066 = icmp ne i64 %t2065, 1
  br i1 %t2066, label %then572, label %else573
then572:
  %t2067 = or i64 %t2024, 696
  %t2068 = and i64 %t2067, 7
  %t2069 = icmp eq i64 %t2068, 0
  br i1 %t2069, label %fixfast575, label %fixslow576
fixfast575:
  %t2070 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t2024, i64 696)
  %t2071 = extractvalue {i64, i1} %t2070, 0
  %t2072 = extractvalue {i64, i1} %t2070, 1
  br i1 %t2072, label %fixslow576, label %fixmerge577
fixslow576:
  %t2073 = call i64 @rt_sub(i64 %t2024, i64 696)
  br label %fixmerge577
fixmerge577:
  %t2074 = phi i64 [ %t2071, %fixfast575 ], [ %t2073, %fixslow576 ]
  br label %merge574
else573:
  %t2075 = or i64 512, %t2024
  %t2076 = and i64 %t2075, 7
  %t2077 = icmp eq i64 %t2076, 0
  br i1 %t2077, label %fixfast578, label %fixslow579
fixfast578:
  %t2078 = icmp slt i64 512, %t2024
  %t2079 = select i1 %t2078, i64 257, i64 1
  br label %fixmerge580
fixslow579:
  %t2080 = call i64 @rt_lt(i64 512, i64 %t2024)
  br label %fixmerge580
fixmerge580:
  %t2081 = phi i64 [ %t2079, %fixfast578 ], [ %t2080, %fixslow579 ]
  %t2082 = icmp ne i64 %t2081, 1
  br i1 %t2082, label %then581, label %else582
then581:
  %t2083 = or i64 %t2024, 728
  %t2084 = and i64 %t2083, 7
  %t2085 = icmp eq i64 %t2084, 0
  br i1 %t2085, label %fixfast584, label %fixslow585
fixfast584:
  %t2086 = icmp slt i64 %t2024, 728
  %t2087 = select i1 %t2086, i64 257, i64 1
  br label %fixmerge586
fixslow585:
  %t2088 = call i64 @rt_lt(i64 %t2024, i64 728)
  br label %fixmerge586
fixmerge586:
  %t2089 = phi i64 [ %t2087, %fixfast584 ], [ %t2088, %fixslow585 ]
  br label %merge583
else582:
  br label %merge583
merge583:
  %t2090 = phi i64 [ %t2089, %fixmerge586 ], [ 1, %else582 ]
  %t2091 = icmp ne i64 %t2090, 1
  br i1 %t2091, label %then587, label %else588
then587:
  %t2092 = or i64 %t2024, 440
  %t2093 = and i64 %t2092, 7
  %t2094 = icmp eq i64 %t2093, 0
  br i1 %t2094, label %fixfast590, label %fixslow591
fixfast590:
  %t2095 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t2024, i64 440)
  %t2096 = extractvalue {i64, i1} %t2095, 0
  %t2097 = extractvalue {i64, i1} %t2095, 1
  br i1 %t2097, label %fixslow591, label %fixmerge592
fixslow591:
  %t2098 = call i64 @rt_sub(i64 %t2024, i64 440)
  br label %fixmerge592
fixmerge592:
  %t2099 = phi i64 [ %t2096, %fixfast590 ], [ %t2098, %fixslow591 ]
  br label %merge589
else588:
  br label %merge589
merge589:
  %t2100 = phi i64 [ %t2099, %fixmerge592 ], [ 792, %else588 ]
  br label %merge574
merge574:
  %t2101 = phi i64 [ %t2074, %fixmerge577 ], [ %t2100, %merge589 ]
  br label %merge559
merge559:
  %t2102 = phi i64 [ %t2049, %fixmerge562 ], [ %t2101, %merge574 ]
  %t2103 = or i64 %t2102, %a1
  %t2104 = and i64 %t2103, 7
  %t2105 = icmp eq i64 %t2104, 0
  br i1 %t2105, label %fixfast593, label %fixslow594
fixfast593:
  %t2106 = icmp slt i64 %t2102, %a1
  %t2107 = select i1 %t2106, i64 257, i64 1
  br label %fixmerge595
fixslow594:
  %t2108 = call i64 @rt_lt(i64 %t2102, i64 %a1)
  br label %fixmerge595
fixmerge595:
  %t2109 = phi i64 [ %t2107, %fixfast593 ], [ %t2108, %fixslow594 ]
  %t2110 = icmp ne i64 %t2109, 1
  br i1 %t2110, label %then596, label %else597
then596:
  ret i64 %t2102
else597:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%radix-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2115 = icmp eq i64 %argc, 5
  br i1 %t2115, label %argok599, label %arityerr598
arityerr598:
  call void @rt_arity_error(i64 5, i64 %argc)
  unreachable
argok599:
  %t2116 = or i64 %a1, %a2
  %t2117 = and i64 %t2116, 7
  %t2118 = icmp eq i64 %t2117, 0
  br i1 %t2118, label %fixfast600, label %fixslow601
fixfast600:
  %t2119 = icmp slt i64 %a1, %a2
  %t2120 = select i1 %t2119, i64 257, i64 1
  br label %fixmerge602
fixslow601:
  %t2121 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge602
fixmerge602:
  %t2122 = phi i64 [ %t2120, %fixfast600 ], [ %t2121, %fixslow601 ]
  %t2123 = icmp ne i64 %t2122, 1
  br i1 %t2123, label %then603, label %else604
then603:
  %t2124 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t2125 = load i64, ptr @"scheme.base:%digit-in-radix"
  %t2126 = and i64 %t2125, -8
  %t2127 = inttoptr i64 %t2126 to ptr
  %t2128 = load i64, ptr %t2127
  %t2129 = inttoptr i64 %t2128 to ptr
  %t2130 = call fastcc i64%t2129(i64 %t2125, i64 2, i64 %t2124, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2131 = icmp ne i64 %t2130, 1
  br i1 %t2131, label %then605, label %else606
then605:
  %t2132 = or i64 %a1, 8
  %t2133 = and i64 %t2132, 7
  %t2134 = icmp eq i64 %t2133, 0
  br i1 %t2134, label %fixfast607, label %fixslow608
fixfast607:
  %t2135 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t2136 = extractvalue {i64, i1} %t2135, 0
  %t2137 = extractvalue {i64, i1} %t2135, 1
  br i1 %t2137, label %fixslow608, label %fixmerge609
fixslow608:
  %t2138 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge609
fixmerge609:
  %t2139 = phi i64 [ %t2136, %fixfast607 ], [ %t2138, %fixslow608 ]
  %t2140 = or i64 %a4, %a3
  %t2141 = and i64 %t2140, 7
  %t2142 = icmp eq i64 %t2141, 0
  br i1 %t2142, label %fixfast610, label %fixslow611
fixfast610:
  %t2143 = ashr i64 %a4, 3
  %t2144 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t2143, i64 %a3)
  %t2145 = extractvalue {i64, i1} %t2144, 0
  %t2146 = extractvalue {i64, i1} %t2144, 1
  br i1 %t2146, label %fixslow611, label %fixmerge612
fixslow611:
  %t2147 = call i64 @rt_mul(i64 %a4, i64 %a3)
  br label %fixmerge612
fixmerge612:
  %t2148 = phi i64 [ %t2145, %fixfast610 ], [ %t2147, %fixslow611 ]
  %t2149 = or i64 %t2148, %t2130
  %t2150 = and i64 %t2149, 7
  %t2151 = icmp eq i64 %t2150, 0
  br i1 %t2151, label %fixfast613, label %fixslow614
fixfast613:
  %t2152 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t2148, i64 %t2130)
  %t2153 = extractvalue {i64, i1} %t2152, 0
  %t2154 = extractvalue {i64, i1} %t2152, 1
  br i1 %t2154, label %fixslow614, label %fixmerge615
fixslow614:
  %t2155 = call i64 @rt_sub(i64 %t2148, i64 %t2130)
  br label %fixmerge615
fixmerge615:
  %t2156 = phi i64 [ %t2153, %fixfast613 ], [ %t2155, %fixslow614 ]
  %t2157 = load i64, ptr @"scheme.base:%radix-digits"
  %t2158 = and i64 %t2157, -8
  %t2159 = inttoptr i64 %t2158 to ptr
  %t2160 = load i64, ptr %t2159
  %t2161 = inttoptr i64 %t2160 to ptr
  %t2162 = musttail call fastcc i64 %t2161(i64 %t2157, i64 5, i64 %a0, i64 %t2139, i64 %a2, i64 %a3, i64 %t2156, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2162
else606:
  ret i64 1
else604:
  ret i64 %a4
}

define fastcc i64 @"scheme.base:code:%string->int"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2167 = icmp eq i64 %argc, 2
  br i1 %t2167, label %argok617, label %arityerr616
arityerr616:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok617:
  %t2168 = call i64 @rt_string_length(i64 %a0)
  %t2169 = or i64 %t2168, 0
  %t2170 = and i64 %t2169, 7
  %t2171 = icmp eq i64 %t2170, 0
  br i1 %t2171, label %fixfast618, label %fixslow619
fixfast618:
  %t2172 = icmp eq i64 %t2168, 0
  %t2173 = select i1 %t2172, i64 257, i64 1
  br label %fixmerge620
fixslow619:
  %t2174 = call i64 @rt_num_eq(i64 %t2168, i64 0)
  br label %fixmerge620
fixmerge620:
  %t2175 = phi i64 [ %t2173, %fixfast618 ], [ %t2174, %fixslow619 ]
  %t2176 = icmp ne i64 %t2175, 1
  br i1 %t2176, label %then621, label %else622
then621:
  ret i64 1
else622:
  %t2177 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t2178 = call i64 @rt_char_to_integer(i64 %t2177)
  %t2179 = or i64 %t2178, 360
  %t2180 = and i64 %t2179, 7
  %t2181 = icmp eq i64 %t2180, 0
  br i1 %t2181, label %fixfast623, label %fixslow624
fixfast623:
  %t2182 = icmp eq i64 %t2178, 360
  %t2183 = select i1 %t2182, i64 257, i64 1
  br label %fixmerge625
fixslow624:
  %t2184 = call i64 @rt_num_eq(i64 %t2178, i64 360)
  br label %fixmerge625
fixmerge625:
  %t2185 = phi i64 [ %t2183, %fixfast623 ], [ %t2184, %fixslow624 ]
  %t2186 = icmp ne i64 %t2185, 1
  br i1 %t2186, label %then626, label %else627
then626:
  %t2187 = or i64 8, %t2168
  %t2188 = and i64 %t2187, 7
  %t2189 = icmp eq i64 %t2188, 0
  br i1 %t2189, label %fixfast628, label %fixslow629
fixfast628:
  %t2190 = icmp slt i64 8, %t2168
  %t2191 = select i1 %t2190, i64 257, i64 1
  br label %fixmerge630
fixslow629:
  %t2192 = call i64 @rt_lt(i64 8, i64 %t2168)
  br label %fixmerge630
fixmerge630:
  %t2193 = phi i64 [ %t2191, %fixfast628 ], [ %t2192, %fixslow629 ]
  %t2194 = icmp ne i64 %t2193, 1
  br i1 %t2194, label %then631, label %else632
then631:
  %t2195 = load i64, ptr @"scheme.base:%radix-digits"
  %t2196 = and i64 %t2195, -8
  %t2197 = inttoptr i64 %t2196 to ptr
  %t2198 = load i64, ptr %t2197
  %t2199 = inttoptr i64 %t2198 to ptr
  %t2200 = musttail call fastcc i64 %t2199(i64 %t2195, i64 5, i64 %a0, i64 8, i64 %t2168, i64 %a1, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2200
else632:
  ret i64 1
else627:
  %t2201 = or i64 %t2178, 344
  %t2202 = and i64 %t2201, 7
  %t2203 = icmp eq i64 %t2202, 0
  br i1 %t2203, label %fixfast633, label %fixslow634
fixfast633:
  %t2204 = icmp eq i64 %t2178, 344
  %t2205 = select i1 %t2204, i64 257, i64 1
  br label %fixmerge635
fixslow634:
  %t2206 = call i64 @rt_num_eq(i64 %t2178, i64 344)
  br label %fixmerge635
fixmerge635:
  %t2207 = phi i64 [ %t2205, %fixfast633 ], [ %t2206, %fixslow634 ]
  %t2208 = icmp ne i64 %t2207, 1
  br i1 %t2208, label %then636, label %else637
then636:
  br label %merge638
else637:
  br label %merge638
merge638:
  %t2209 = phi i64 [ 8, %then636 ], [ 0, %else637 ]
  %t2210 = or i64 %t2209, %t2168
  %t2211 = and i64 %t2210, 7
  %t2212 = icmp eq i64 %t2211, 0
  br i1 %t2212, label %fixfast639, label %fixslow640
fixfast639:
  %t2213 = icmp slt i64 %t2209, %t2168
  %t2214 = select i1 %t2213, i64 257, i64 1
  br label %fixmerge641
fixslow640:
  %t2215 = call i64 @rt_lt(i64 %t2209, i64 %t2168)
  br label %fixmerge641
fixmerge641:
  %t2216 = phi i64 [ %t2214, %fixfast639 ], [ %t2215, %fixslow640 ]
  %t2217 = icmp ne i64 %t2216, 1
  br i1 %t2217, label %then642, label %else643
then642:
  %t2218 = load i64, ptr @"scheme.base:%radix-digits"
  %t2219 = and i64 %t2218, -8
  %t2220 = inttoptr i64 %t2219 to ptr
  %t2221 = load i64, ptr %t2220
  %t2222 = inttoptr i64 %t2221 to ptr
  %t2223 = call fastcc i64%t2222(i64 %t2218, i64 5, i64 %a0, i64 %t2209, i64 %t2168, i64 %a1, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2224 = icmp ne i64 %t2223, 1
  br i1 %t2224, label %then644, label %else645
then644:
  %t2225 = or i64 0, %t2223
  %t2226 = and i64 %t2225, 7
  %t2227 = icmp eq i64 %t2226, 0
  br i1 %t2227, label %fixfast646, label %fixslow647
fixfast646:
  %t2228 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %t2223)
  %t2229 = extractvalue {i64, i1} %t2228, 0
  %t2230 = extractvalue {i64, i1} %t2228, 1
  br i1 %t2230, label %fixslow647, label %fixmerge648
fixslow647:
  %t2231 = call i64 @rt_sub(i64 0, i64 %t2223)
  br label %fixmerge648
fixmerge648:
  %t2232 = phi i64 [ %t2229, %fixfast646 ], [ %t2231, %fixslow647 ]
  ret i64 %t2232
else645:
  ret i64 1
else643:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:string->number"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2237 = icmp sge i64 %argc, 1
  br i1 %t2237, label %argok650, label %arityerr649
arityerr649:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok650:
  %t2238 = call ptr @rt_alloc_words(i64 8)
  %t2239 = getelementptr i64, ptr %t2238, i64 0
  store i64 %a0, ptr %t2239
  %t2240 = getelementptr i64, ptr %t2238, i64 1
  store i64 %a1, ptr %t2240
  %t2241 = getelementptr i64, ptr %t2238, i64 2
  store i64 %a2, ptr %t2241
  %t2242 = getelementptr i64, ptr %t2238, i64 3
  store i64 %a3, ptr %t2242
  %t2243 = getelementptr i64, ptr %t2238, i64 4
  store i64 %a4, ptr %t2243
  %t2244 = getelementptr i64, ptr %t2238, i64 5
  store i64 %a5, ptr %t2244
  %t2245 = getelementptr i64, ptr %t2238, i64 6
  store i64 %a6, ptr %t2245
  %t2246 = getelementptr i64, ptr %t2238, i64 7
  store i64 %a7, ptr %t2246
  %t2247 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2238, ptr %overflow)
  %t2248 = call i64 @rt_null_p(i64 %t2247)
  %t2249 = icmp ne i64 %t2248, 1
  br i1 %t2249, label %then651, label %else652
then651:
  br label %merge653
else652:
  %t2250 = call i64 @rt_car(i64 %t2247)
  br label %merge653
merge653:
  %t2251 = phi i64 [ 80, %then651 ], [ %t2250, %else652 ]
  %t2252 = load i64, ptr @"scheme.base:%radix-ok?"
  %t2253 = and i64 %t2252, -8
  %t2254 = inttoptr i64 %t2253 to ptr
  %t2255 = load i64, ptr %t2254
  %t2256 = inttoptr i64 %t2255 to ptr
  %t2257 = call fastcc i64%t2256(i64 %t2252, i64 1, i64 %t2251, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2258 = icmp ne i64 %t2257, 1
  br i1 %t2258, label %then654, label %else655
then654:
  %t2259 = or i64 %t2251, 80
  %t2260 = and i64 %t2259, 7
  %t2261 = icmp eq i64 %t2260, 0
  br i1 %t2261, label %fixfast656, label %fixslow657
fixfast656:
  %t2262 = icmp eq i64 %t2251, 80
  %t2263 = select i1 %t2262, i64 257, i64 1
  br label %fixmerge658
fixslow657:
  %t2264 = call i64 @rt_num_eq(i64 %t2251, i64 80)
  br label %fixmerge658
fixmerge658:
  %t2265 = phi i64 [ %t2263, %fixfast656 ], [ %t2264, %fixslow657 ]
  %t2266 = icmp ne i64 %t2265, 1
  br i1 %t2266, label %then659, label %else660
then659:
  %t2267 = load i64, ptr @"scheme.base:rd-numeric?"
  %t2268 = and i64 %t2267, -8
  %t2269 = inttoptr i64 %t2268 to ptr
  %t2270 = load i64, ptr %t2269
  %t2271 = inttoptr i64 %t2270 to ptr
  %t2272 = call fastcc i64%t2271(i64 %t2267, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2273 = icmp ne i64 %t2272, 1
  br i1 %t2273, label %then661, label %else662
then661:
  %t2274 = load i64, ptr @"scheme.base:rd-parse-int"
  %t2275 = and i64 %t2274, -8
  %t2276 = inttoptr i64 %t2275 to ptr
  %t2277 = load i64, ptr %t2276
  %t2278 = inttoptr i64 %t2277 to ptr
  %t2279 = musttail call fastcc i64 %t2278(i64 %t2274, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2279
else662:
  %t2280 = load i64, ptr @"scheme.base:rd-flonum?"
  %t2281 = and i64 %t2280, -8
  %t2282 = inttoptr i64 %t2281 to ptr
  %t2283 = load i64, ptr %t2282
  %t2284 = inttoptr i64 %t2283 to ptr
  %t2285 = call fastcc i64%t2284(i64 %t2280, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2286 = icmp ne i64 %t2285, 1
  br i1 %t2286, label %then663, label %else664
then663:
  %t2287 = call i64 @rt_string_to_flonum(i64 %a0)
  ret i64 %t2287
else664:
  ret i64 1
else660:
  %t2288 = load i64, ptr @"scheme.base:%string->int"
  %t2289 = and i64 %t2288, -8
  %t2290 = inttoptr i64 %t2289 to ptr
  %t2291 = load i64, ptr %t2290
  %t2292 = inttoptr i64 %t2291 to ptr
  %t2293 = musttail call fastcc i64 %t2292(i64 %t2288, i64 2, i64 %a0, i64 %t2251, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2293
else655:
  %t2294 = call i64 @rt_make_string(ptr @.str.lit.8, i64 33)
  %t2295 = load i64, ptr @"scheme.base:error"
  %t2296 = and i64 %t2295, -8
  %t2297 = inttoptr i64 %t2296 to ptr
  %t2298 = load i64, ptr %t2297
  %t2299 = inttoptr i64 %t2298 to ptr
  %t2300 = musttail call fastcc i64 %t2299(i64 %t2295, i64 2, i64 %t2294, i64 %t2251, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2300
}

define fastcc i64 @"scheme.base:code:error"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2305 = icmp sge i64 %argc, 1
  br i1 %t2305, label %argok666, label %arityerr665
arityerr665:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok666:
  %t2306 = call ptr @rt_alloc_words(i64 8)
  %t2307 = getelementptr i64, ptr %t2306, i64 0
  store i64 %a0, ptr %t2307
  %t2308 = getelementptr i64, ptr %t2306, i64 1
  store i64 %a1, ptr %t2308
  %t2309 = getelementptr i64, ptr %t2306, i64 2
  store i64 %a2, ptr %t2309
  %t2310 = getelementptr i64, ptr %t2306, i64 3
  store i64 %a3, ptr %t2310
  %t2311 = getelementptr i64, ptr %t2306, i64 4
  store i64 %a4, ptr %t2311
  %t2312 = getelementptr i64, ptr %t2306, i64 5
  store i64 %a5, ptr %t2312
  %t2313 = getelementptr i64, ptr %t2306, i64 6
  store i64 %a6, ptr %t2313
  %t2314 = getelementptr i64, ptr %t2306, i64 7
  store i64 %a7, ptr %t2314
  %t2315 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2306, ptr %overflow)
  %t2316 = call i64 @rt_string_p(i64 %a0)
  %t2317 = icmp ne i64 %t2316, 1
  br i1 %t2317, label %then667, label %else668
then667:
  %t2318 = call i64 @rt_make_error_object(i64 %a0, i64 %t2315)
  %t2319 = load i64, ptr @"scheme.base:raise"
  %t2320 = and i64 %t2319, -8
  %t2321 = inttoptr i64 %t2320 to ptr
  %t2322 = load i64, ptr %t2321
  %t2323 = inttoptr i64 %t2322 to ptr
  %t2324 = musttail call fastcc i64 %t2323(i64 %t2319, i64 1, i64 %t2318, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2324
else668:
  %t2325 = call i64 @rt_symbol_to_string(i64 %a0)
  %t2326 = call i64 @rt_make_string(ptr @.str.lit.9, i64 2)
  %t2327 = call i64 @rt_car(i64 %t2315)
  %t2328 = call i64 @rt_string_append(i64 %t2326, i64 %t2327)
  %t2329 = call i64 @rt_string_append(i64 %t2325, i64 %t2328)
  %t2330 = call i64 @rt_cdr(i64 %t2315)
  %t2331 = call i64 @rt_make_error_object(i64 %t2329, i64 %t2330)
  %t2332 = load i64, ptr @"scheme.base:raise"
  %t2333 = and i64 %t2332, -8
  %t2334 = inttoptr i64 %t2333 to ptr
  %t2335 = load i64, ptr %t2334
  %t2336 = inttoptr i64 %t2335 to ptr
  %t2337 = musttail call fastcc i64 %t2336(i64 %t2332, i64 1, i64 %t2331, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2337
}

define fastcc i64 @"scheme.base:code:%unwind-to"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2344 = icmp eq i64 %argc, 1
  br i1 %t2344, label %argok670, label %arityerr669
arityerr669:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok670:
  %t2345 = load i64, ptr @"scheme.base:*winds*"
  %t2346 = call i64 @rt_eq_p(i64 %t2345, i64 %a0)
  %t2347 = icmp ne i64 %t2346, 1
  br i1 %t2347, label %then671, label %else672
then671:
  ret i64 257
else672:
  %t2348 = load i64, ptr @"scheme.base:*winds*"
  %t2349 = call i64 @rt_null_p(i64 %t2348)
  %t2350 = icmp ne i64 %t2349, 1
  br i1 %t2350, label %then673, label %else674
then673:
  ret i64 257
else674:
  %t2351 = load i64, ptr @"scheme.base:*winds*"
  %t2352 = call i64 @rt_car(i64 %t2351)
  %t2353 = load i64, ptr @"scheme.base:*winds*"
  %t2354 = call i64 @rt_cdr(i64 %t2353)
  %t2355 = call i64 @rt_root(i64 %t2354)
  store i64 %t2355, ptr @"scheme.base:*winds*"
  %t2356 = call i64 @rt_cdr(i64 %t2352)
  %t2357 = and i64 %t2356, -8
  %t2358 = inttoptr i64 %t2357 to ptr
  %t2359 = load i64, ptr %t2358
  %t2360 = inttoptr i64 %t2359 to ptr
  %t2361 = call fastcc i64%t2360(i64 %t2356, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2362 = load i64, ptr @"scheme.base:%unwind-to"
  %t2363 = and i64 %t2362, -8
  %t2364 = inttoptr i64 %t2363 to ptr
  %t2365 = load i64, ptr %t2364
  %t2366 = inttoptr i64 %t2365 to ptr
  %t2367 = musttail call fastcc i64 %t2366(i64 %t2362, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2367
}

define fastcc i64 @"scheme.base:code:dynamic-wind"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2372 = icmp eq i64 %argc, 3
  br i1 %t2372, label %argok676, label %arityerr675
arityerr675:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok676:
  %t2373 = and i64 %a0, -8
  %t2374 = inttoptr i64 %t2373 to ptr
  %t2375 = load i64, ptr %t2374
  %t2376 = inttoptr i64 %t2375 to ptr
  %t2377 = call fastcc i64%t2376(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2378 = call i64 @rt_cons(i64 %a0, i64 %a2)
  %t2379 = load i64, ptr @"scheme.base:*winds*"
  %t2380 = call i64 @rt_cons(i64 %t2378, i64 %t2379)
  %t2381 = call i64 @rt_root(i64 %t2380)
  store i64 %t2381, ptr @"scheme.base:*winds*"
  %t2382 = and i64 %a1, -8
  %t2383 = inttoptr i64 %t2382 to ptr
  %t2384 = load i64, ptr %t2383
  %t2385 = inttoptr i64 %t2384 to ptr
  %t2386 = call fastcc i64%t2385(i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2387 = load i64, ptr @"scheme.base:*winds*"
  %t2388 = call i64 @rt_cdr(i64 %t2387)
  %t2389 = call i64 @rt_root(i64 %t2388)
  store i64 %t2389, ptr @"scheme.base:*winds*"
  %t2390 = and i64 %a2, -8
  %t2391 = inttoptr i64 %t2390 to ptr
  %t2392 = load i64, ptr %t2391
  %t2393 = inttoptr i64 %t2392 to ptr
  %t2394 = call fastcc i64%t2393(i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2386
}

define fastcc i64 @"scheme.base:code_548"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2399 = icmp eq i64 %argc, 1
  br i1 %t2399, label %argok678, label %arityerr677
arityerr677:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok678:
  %t2400 = and i64 %self, -8
  %t2401 = inttoptr i64 %t2400 to ptr
  %t2402 = getelementptr i64, ptr %t2401, i64 1
  %t2403 = load i64, ptr %t2402
  %t2404 = call i64 @rt_escape_live_p(i64 %t2403)
  %t2405 = icmp ne i64 %t2404, 1
  br i1 %t2405, label %then679, label %else680
then679:
  %t2406 = and i64 %self, -8
  %t2407 = inttoptr i64 %t2406 to ptr
  %t2408 = getelementptr i64, ptr %t2407, i64 2
  %t2409 = load i64, ptr %t2408
  %t2410 = load i64, ptr @"scheme.base:%unwind-to"
  %t2411 = and i64 %t2410, -8
  %t2412 = inttoptr i64 %t2411 to ptr
  %t2413 = load i64, ptr %t2412
  %t2414 = inttoptr i64 %t2413 to ptr
  %t2415 = call fastcc i64%t2414(i64 %t2410, i64 1, i64 %t2409, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2416 = and i64 %self, -8
  %t2417 = inttoptr i64 %t2416 to ptr
  %t2418 = getelementptr i64, ptr %t2417, i64 1
  %t2419 = load i64, ptr %t2418
  %t2420 = call i64 @rt_escape_to(i64 %t2419, i64 %a0)
  br label %merge681
else680:
  br label %merge681
merge681:
  %t2421 = phi i64 [ %t2420, %then679 ], [ 1, %else680 ]
  %t2422 = call i64 @rt_intern(ptr @.str.sym.10)
  %t2423 = call i64 @rt_make_string(ptr @.str.lit.11, i64 39)
  %t2424 = load i64, ptr @"scheme.base:error"
  %t2425 = and i64 %t2424, -8
  %t2426 = inttoptr i64 %t2425 to ptr
  %t2427 = load i64, ptr %t2426
  %t2428 = inttoptr i64 %t2427 to ptr
  %t2429 = musttail call fastcc i64 %t2428(i64 %t2424, i64 2, i64 %t2422, i64 %t2423, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2429
}

define fastcc i64 @"scheme.base:code_546"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2430 = icmp eq i64 %argc, 0
  br i1 %t2430, label %argok683, label %arityerr682
arityerr682:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok683:
  %t2431 = call i64 @rt_escape_frame()
  %t2432 = and i64 %self, -8
  %t2433 = inttoptr i64 %t2432 to ptr
  %t2434 = getelementptr i64, ptr %t2433, i64 2
  %t2435 = load i64, ptr %t2434
  %t2436 = call ptr @rt_alloc_words(i64 3)
  %t2437 = ptrtoint ptr %t2436 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_548" to i64), ptr %t2436
  %t2438 = getelementptr i64, ptr %t2436, i64 1
  store i64 %t2431, ptr %t2438
  %t2439 = getelementptr i64, ptr %t2436, i64 2
  store i64 %t2435, ptr %t2439
  %t2440 = or i64 %t2437, 4
  %t2441 = and i64 %self, -8
  %t2442 = inttoptr i64 %t2441 to ptr
  %t2443 = getelementptr i64, ptr %t2442, i64 1
  %t2444 = load i64, ptr %t2443
  %t2445 = and i64 %t2444, -8
  %t2446 = inttoptr i64 %t2445 to ptr
  %t2447 = load i64, ptr %t2446
  %t2448 = inttoptr i64 %t2447 to ptr
  %t2449 = musttail call fastcc i64 %t2448(i64 %t2444, i64 1, i64 %t2440, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2449
}

define fastcc i64 @"scheme.base:code:call-with-current-continuation"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2450 = icmp eq i64 %argc, 1
  br i1 %t2450, label %argok685, label %arityerr684
arityerr684:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok685:
  %t2451 = load i64, ptr @"scheme.base:*winds*"
  %t2452 = call ptr @rt_alloc_words(i64 3)
  %t2453 = ptrtoint ptr %t2452 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_546" to i64), ptr %t2452
  %t2454 = getelementptr i64, ptr %t2452, i64 1
  store i64 %a0, ptr %t2454
  %t2455 = getelementptr i64, ptr %t2452, i64 2
  store i64 %t2451, ptr %t2455
  %t2456 = or i64 %t2453, 4
  %t2457 = call i64 @rt_run_guarded(ptr @__apply0, i64 %t2456)
  %t2458 = call i64 @rt_cdr(i64 %t2457)
  ret i64 %t2458
}

define fastcc i64 @"scheme.base:code:call/cc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2463 = icmp eq i64 %argc, 1
  br i1 %t2463, label %argok687, label %arityerr686
arityerr686:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok687:
  %t2464 = load i64, ptr @"scheme.base:call-with-current-continuation"
  %t2465 = and i64 %t2464, -8
  %t2466 = inttoptr i64 %t2465 to ptr
  %t2467 = load i64, ptr %t2466
  %t2468 = inttoptr i64 %t2467 to ptr
  %t2469 = musttail call fastcc i64 %t2468(i64 %t2464, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2469
}

define fastcc i64 @"scheme.base:code_556"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2474 = icmp eq i64 %argc, 0
  br i1 %t2474, label %argok689, label %arityerr688
arityerr688:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok689:
  %t2475 = and i64 %self, -8
  %t2476 = inttoptr i64 %t2475 to ptr
  %t2477 = getelementptr i64, ptr %t2476, i64 1
  %t2478 = load i64, ptr %t2477
  %t2479 = and i64 %self, -8
  %t2480 = inttoptr i64 %t2479 to ptr
  %t2481 = getelementptr i64, ptr %t2480, i64 2
  %t2482 = load i64, ptr %t2481
  %t2483 = call i64 @rt_cons(i64 %t2478, i64 %t2482)
  %t2484 = call i64 @rt_root(i64 %t2483)
  store i64 %t2484, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code_558"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2485 = icmp eq i64 %argc, 0
  br i1 %t2485, label %argok691, label %arityerr690
arityerr690:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok691:
  %t2486 = and i64 %self, -8
  %t2487 = inttoptr i64 %t2486 to ptr
  %t2488 = getelementptr i64, ptr %t2487, i64 1
  %t2489 = load i64, ptr %t2488
  %t2490 = call i64 @rt_root(i64 %t2489)
  store i64 %t2490, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code:%with-handler"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2491 = icmp eq i64 %argc, 2
  br i1 %t2491, label %argok693, label %arityerr692
arityerr692:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok693:
  %t2492 = load i64, ptr @"scheme.base:*handlers*"
  %t2493 = call ptr @rt_alloc_words(i64 3)
  %t2494 = ptrtoint ptr %t2493 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_556" to i64), ptr %t2493
  %t2495 = getelementptr i64, ptr %t2493, i64 1
  store i64 %a0, ptr %t2495
  %t2496 = getelementptr i64, ptr %t2493, i64 2
  store i64 %t2492, ptr %t2496
  %t2497 = or i64 %t2494, 4
  %t2498 = call ptr @rt_alloc_words(i64 2)
  %t2499 = ptrtoint ptr %t2498 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_558" to i64), ptr %t2498
  %t2500 = getelementptr i64, ptr %t2498, i64 1
  store i64 %t2492, ptr %t2500
  %t2501 = or i64 %t2499, 4
  %t2502 = load i64, ptr @"scheme.base:dynamic-wind"
  %t2503 = and i64 %t2502, -8
  %t2504 = inttoptr i64 %t2503 to ptr
  %t2505 = load i64, ptr %t2504
  %t2506 = inttoptr i64 %t2505 to ptr
  %t2507 = musttail call fastcc i64 %t2506(i64 %t2502, i64 3, i64 %t2497, i64 %a1, i64 %t2501, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2507
}

define fastcc i64 @"scheme.base:code:raise"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2512 = icmp eq i64 %argc, 1
  br i1 %t2512, label %argok695, label %arityerr694
arityerr694:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok695:
  %t2513 = load i64, ptr @"scheme.base:*handlers*"
  %t2514 = call i64 @rt_null_p(i64 %t2513)
  %t2515 = icmp ne i64 %t2514, 1
  br i1 %t2515, label %then696, label %else697
then696:
  %t2516 = call i64 @rt_raise(i64 %a0)
  ret i64 %t2516
else697:
  %t2517 = load i64, ptr @"scheme.base:*handlers*"
  %t2518 = call i64 @rt_car(i64 %t2517)
  %t2519 = load i64, ptr @"scheme.base:*handlers*"
  %t2520 = load i64, ptr @"scheme.base:*handlers*"
  %t2521 = call i64 @rt_cdr(i64 %t2520)
  %t2522 = call i64 @rt_root(i64 %t2521)
  store i64 %t2522, ptr @"scheme.base:*handlers*"
  %t2523 = and i64 %t2518, -8
  %t2524 = inttoptr i64 %t2523 to ptr
  %t2525 = load i64, ptr %t2524
  %t2526 = inttoptr i64 %t2525 to ptr
  %t2527 = call fastcc i64%t2526(i64 %t2518, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2528 = call i64 @rt_root(i64 %t2519)
  store i64 %t2528, ptr @"scheme.base:*handlers*"
  %t2529 = call i64 @rt_raise(i64 %a0)
  ret i64 %t2529
}

define fastcc i64 @"scheme.base:code:error-object?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2534 = icmp eq i64 %argc, 1
  br i1 %t2534, label %argok699, label %arityerr698
arityerr698:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok699:
  %t2535 = call i64 @rt_error_object_p(i64 %a0)
  ret i64 %t2535
}

define fastcc i64 @"scheme.base:code:error-object-message"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2540 = icmp eq i64 %argc, 1
  br i1 %t2540, label %argok701, label %arityerr700
arityerr700:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok701:
  %t2541 = call i64 @rt_error_object_message(i64 %a0)
  ret i64 %t2541
}

define fastcc i64 @"scheme.base:code:error-object-irritants"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2546 = icmp eq i64 %argc, 1
  br i1 %t2546, label %argok703, label %arityerr702
arityerr702:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok703:
  %t2547 = call i64 @rt_error_object_irritants(i64 %a0)
  ret i64 %t2547
}

define fastcc i64 @"scheme.base:code_578"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2552 = icmp eq i64 %argc, 1
  br i1 %t2552, label %argok705, label %arityerr704
arityerr704:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok705:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_580"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2553 = icmp eq i64 %argc, 1
  br i1 %t2553, label %argok707, label %arityerr706
arityerr706:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok707:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_582"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2554 = icmp sge i64 %argc, 0
  br i1 %t2554, label %argok709, label %arityerr708
arityerr708:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok709:
  %t2555 = call ptr @rt_alloc_words(i64 8)
  %t2556 = getelementptr i64, ptr %t2555, i64 0
  store i64 %a0, ptr %t2556
  %t2557 = getelementptr i64, ptr %t2555, i64 1
  store i64 %a1, ptr %t2557
  %t2558 = getelementptr i64, ptr %t2555, i64 2
  store i64 %a2, ptr %t2558
  %t2559 = getelementptr i64, ptr %t2555, i64 3
  store i64 %a3, ptr %t2559
  %t2560 = getelementptr i64, ptr %t2555, i64 4
  store i64 %a4, ptr %t2560
  %t2561 = getelementptr i64, ptr %t2555, i64 5
  store i64 %a5, ptr %t2561
  %t2562 = getelementptr i64, ptr %t2555, i64 6
  store i64 %a6, ptr %t2562
  %t2563 = getelementptr i64, ptr %t2555, i64 7
  store i64 %a7, ptr %t2563
  %t2564 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2555, ptr %overflow)
  %t2565 = call i64 @rt_null_p(i64 %t2564)
  %t2566 = icmp ne i64 %t2565, 1
  br i1 %t2566, label %then710, label %else711
then710:
  %t2567 = and i64 %self, -8
  %t2568 = inttoptr i64 %t2567 to ptr
  %t2569 = getelementptr i64, ptr %t2568, i64 1
  %t2570 = load i64, ptr %t2569
  %t2571 = call i64 @rt_vector_ref(i64 %t2570, i64 0)
  ret i64 %t2571
else711:
  %t2572 = call i64 @rt_cdr(i64 %t2564)
  %t2573 = call i64 @rt_null_p(i64 %t2572)
  %t2574 = icmp ne i64 %t2573, 1
  br i1 %t2574, label %then712, label %else713
then712:
  %t2575 = and i64 %self, -8
  %t2576 = inttoptr i64 %t2575 to ptr
  %t2577 = getelementptr i64, ptr %t2576, i64 1
  %t2578 = load i64, ptr %t2577
  %t2579 = call i64 @rt_car(i64 %t2564)
  %t2580 = and i64 %self, -8
  %t2581 = inttoptr i64 %t2580 to ptr
  %t2582 = getelementptr i64, ptr %t2581, i64 2
  %t2583 = load i64, ptr %t2582
  %t2584 = and i64 %t2583, -8
  %t2585 = inttoptr i64 %t2584 to ptr
  %t2586 = load i64, ptr %t2585
  %t2587 = inttoptr i64 %t2586 to ptr
  %t2588 = call fastcc i64%t2587(i64 %t2583, i64 1, i64 %t2579, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2589 = call i64 @rt_vector_set(i64 %t2578, i64 0, i64 %t2588)
  ret i64 %t2589
else713:
  %t2590 = and i64 %self, -8
  %t2591 = inttoptr i64 %t2590 to ptr
  %t2592 = getelementptr i64, ptr %t2591, i64 1
  %t2593 = load i64, ptr %t2592
  %t2594 = call i64 @rt_car(i64 %t2564)
  %t2595 = call i64 @rt_vector_set(i64 %t2593, i64 0, i64 %t2594)
  ret i64 %t2595
}

define fastcc i64 @"scheme.base:code:make-parameter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2596 = icmp sge i64 %argc, 1
  br i1 %t2596, label %argok715, label %arityerr714
arityerr714:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok715:
  %t2597 = call ptr @rt_alloc_words(i64 8)
  %t2598 = getelementptr i64, ptr %t2597, i64 0
  store i64 %a0, ptr %t2598
  %t2599 = getelementptr i64, ptr %t2597, i64 1
  store i64 %a1, ptr %t2599
  %t2600 = getelementptr i64, ptr %t2597, i64 2
  store i64 %a2, ptr %t2600
  %t2601 = getelementptr i64, ptr %t2597, i64 3
  store i64 %a3, ptr %t2601
  %t2602 = getelementptr i64, ptr %t2597, i64 4
  store i64 %a4, ptr %t2602
  %t2603 = getelementptr i64, ptr %t2597, i64 5
  store i64 %a5, ptr %t2603
  %t2604 = getelementptr i64, ptr %t2597, i64 6
  store i64 %a6, ptr %t2604
  %t2605 = getelementptr i64, ptr %t2597, i64 7
  store i64 %a7, ptr %t2605
  %t2606 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2597, ptr %overflow)
  %t2607 = call i64 @rt_null_p(i64 %t2606)
  %t2608 = icmp ne i64 %t2607, 1
  br i1 %t2608, label %then716, label %else717
then716:
  %t2609 = call ptr @rt_alloc_words(i64 1)
  %t2610 = ptrtoint ptr %t2609 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_578" to i64), ptr %t2609
  %t2611 = or i64 %t2610, 4
  br label %merge718
else717:
  %t2612 = call i64 @rt_car(i64 %t2606)
  br label %merge718
merge718:
  %t2613 = phi i64 [ %t2611, %then716 ], [ %t2612, %else717 ]
  %t2614 = call i64 @rt_make_vector(i64 8, i64 0)
  %t2615 = call i64 @rt_null_p(i64 %t2606)
  %t2616 = icmp ne i64 %t2615, 1
  br i1 %t2616, label %then719, label %else720
then719:
  %t2617 = call ptr @rt_alloc_words(i64 1)
  %t2618 = ptrtoint ptr %t2617 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_580" to i64), ptr %t2617
  %t2619 = or i64 %t2618, 4
  br label %merge721
else720:
  %t2620 = call i64 @rt_car(i64 %t2606)
  br label %merge721
merge721:
  %t2621 = phi i64 [ %t2619, %then719 ], [ %t2620, %else720 ]
  %t2622 = and i64 %t2621, -8
  %t2623 = inttoptr i64 %t2622 to ptr
  %t2624 = load i64, ptr %t2623
  %t2625 = inttoptr i64 %t2624 to ptr
  %t2626 = call fastcc i64%t2625(i64 %t2621, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2627 = call i64 @rt_vector_set(i64 %t2614, i64 0, i64 %t2626)
  %t2628 = call ptr @rt_alloc_words(i64 3)
  %t2629 = ptrtoint ptr %t2628 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_582" to i64), ptr %t2628
  %t2630 = getelementptr i64, ptr %t2628, i64 1
  store i64 %t2614, ptr %t2630
  %t2631 = getelementptr i64, ptr %t2628, i64 2
  store i64 %t2613, ptr %t2631
  %t2632 = or i64 %t2629, 4
  ret i64 %t2632
}

define fastcc i64 @"scheme.base:code_594"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2637 = icmp eq i64 %argc, 1
  br i1 %t2637, label %argok723, label %arityerr722
arityerr722:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok723:
  %t2638 = and i64 %a0, -8
  %t2639 = inttoptr i64 %t2638 to ptr
  %t2640 = load i64, ptr %t2639
  %t2641 = inttoptr i64 %t2640 to ptr
  %t2642 = musttail call fastcc i64 %t2641(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2642
}

define fastcc i64 @"scheme.base:code_598"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2643 = icmp eq i64 %argc, 2
  br i1 %t2643, label %argok725, label %arityerr724
arityerr724:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok725:
  %t2644 = and i64 %a0, -8
  %t2645 = inttoptr i64 %t2644 to ptr
  %t2646 = load i64, ptr %t2645
  %t2647 = inttoptr i64 %t2646 to ptr
  %t2648 = musttail call fastcc i64 %t2647(i64 %a0, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2648
}

define fastcc i64 @"scheme.base:code_596"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2649 = icmp eq i64 %argc, 0
  br i1 %t2649, label %argok727, label %arityerr726
arityerr726:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok727:
  %t2650 = call ptr @rt_alloc_words(i64 1)
  %t2651 = ptrtoint ptr %t2650 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_598" to i64), ptr %t2650
  %t2652 = or i64 %t2651, 4
  %t2653 = and i64 %self, -8
  %t2654 = inttoptr i64 %t2653 to ptr
  %t2655 = getelementptr i64, ptr %t2654, i64 1
  %t2656 = load i64, ptr %t2655
  %t2657 = and i64 %self, -8
  %t2658 = inttoptr i64 %t2657 to ptr
  %t2659 = getelementptr i64, ptr %t2658, i64 2
  %t2660 = load i64, ptr %t2659
  %t2661 = load i64, ptr @"scheme.base:for-each"
  %t2662 = and i64 %t2661, -8
  %t2663 = inttoptr i64 %t2662 to ptr
  %t2664 = load i64, ptr %t2663
  %t2665 = inttoptr i64 %t2664 to ptr
  %t2666 = musttail call fastcc i64 %t2665(i64 %t2661, i64 3, i64 %t2652, i64 %t2656, i64 %t2660, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2666
}

define fastcc i64 @"scheme.base:code_602"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2667 = icmp eq i64 %argc, 2
  br i1 %t2667, label %argok729, label %arityerr728
arityerr728:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok729:
  %t2668 = and i64 %a0, -8
  %t2669 = inttoptr i64 %t2668 to ptr
  %t2670 = load i64, ptr %t2669
  %t2671 = inttoptr i64 %t2670 to ptr
  %t2672 = musttail call fastcc i64 %t2671(i64 %a0, i64 2, i64 %a1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2672
}

define fastcc i64 @"scheme.base:code_600"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2673 = icmp eq i64 %argc, 0
  br i1 %t2673, label %argok731, label %arityerr730
arityerr730:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok731:
  %t2674 = call ptr @rt_alloc_words(i64 1)
  %t2675 = ptrtoint ptr %t2674 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_602" to i64), ptr %t2674
  %t2676 = or i64 %t2675, 4
  %t2677 = and i64 %self, -8
  %t2678 = inttoptr i64 %t2677 to ptr
  %t2679 = getelementptr i64, ptr %t2678, i64 1
  %t2680 = load i64, ptr %t2679
  %t2681 = and i64 %self, -8
  %t2682 = inttoptr i64 %t2681 to ptr
  %t2683 = getelementptr i64, ptr %t2682, i64 2
  %t2684 = load i64, ptr %t2683
  %t2685 = load i64, ptr @"scheme.base:for-each"
  %t2686 = and i64 %t2685, -8
  %t2687 = inttoptr i64 %t2686 to ptr
  %t2688 = load i64, ptr %t2687
  %t2689 = inttoptr i64 %t2688 to ptr
  %t2690 = musttail call fastcc i64 %t2689(i64 %t2685, i64 3, i64 %t2676, i64 %t2680, i64 %t2684, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2690
}

define fastcc i64 @"scheme.base:code:%with-parameters"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2691 = icmp eq i64 %argc, 3
  br i1 %t2691, label %argok733, label %arityerr732
arityerr732:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok733:
  %t2692 = call ptr @rt_alloc_words(i64 1)
  %t2693 = ptrtoint ptr %t2692 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_594" to i64), ptr %t2692
  %t2694 = or i64 %t2693, 4
  %t2695 = load i64, ptr @"scheme.base:map"
  %t2696 = and i64 %t2695, -8
  %t2697 = inttoptr i64 %t2696 to ptr
  %t2698 = load i64, ptr %t2697
  %t2699 = inttoptr i64 %t2698 to ptr
  %t2700 = call fastcc i64%t2699(i64 %t2695, i64 2, i64 %t2694, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2701 = call ptr @rt_alloc_words(i64 3)
  %t2702 = ptrtoint ptr %t2701 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_596" to i64), ptr %t2701
  %t2703 = getelementptr i64, ptr %t2701, i64 1
  store i64 %a0, ptr %t2703
  %t2704 = getelementptr i64, ptr %t2701, i64 2
  store i64 %a1, ptr %t2704
  %t2705 = or i64 %t2702, 4
  %t2706 = call ptr @rt_alloc_words(i64 3)
  %t2707 = ptrtoint ptr %t2706 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_600" to i64), ptr %t2706
  %t2708 = getelementptr i64, ptr %t2706, i64 1
  store i64 %a0, ptr %t2708
  %t2709 = getelementptr i64, ptr %t2706, i64 2
  store i64 %t2700, ptr %t2709
  %t2710 = or i64 %t2707, 4
  %t2711 = load i64, ptr @"scheme.base:dynamic-wind"
  %t2712 = and i64 %t2711, -8
  %t2713 = inttoptr i64 %t2712 to ptr
  %t2714 = load i64, ptr %t2713
  %t2715 = inttoptr i64 %t2714 to ptr
  %t2716 = musttail call fastcc i64 %t2715(i64 %t2711, i64 3, i64 %t2705, i64 %a2, i64 %t2710, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2716
}

define fastcc i64 @"scheme.base:code_610"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2721 = icmp eq i64 %argc, 2
  br i1 %t2721, label %argok735, label %arityerr734
arityerr734:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok735:
  %t2722 = call i64 @rt_null_p(i64 %a0)
  %t2723 = icmp ne i64 %t2722, 1
  br i1 %t2723, label %then736, label %else737
then736:
  %t2724 = and i64 %self, -8
  %t2725 = inttoptr i64 %t2724 to ptr
  %t2726 = getelementptr i64, ptr %t2725, i64 1
  %t2727 = load i64, ptr %t2726
  ret i64 %t2727
else737:
  %t2728 = and i64 %self, -8
  %t2729 = inttoptr i64 %t2728 to ptr
  %t2730 = getelementptr i64, ptr %t2729, i64 1
  %t2731 = load i64, ptr %t2730
  %t2732 = call i64 @rt_car(i64 %a0)
  %t2733 = call i64 @rt_vector_set(i64 %t2731, i64 %a1, i64 %t2732)
  %t2734 = call i64 @rt_cdr(i64 %a0)
  %t2735 = or i64 %a1, 8
  %t2736 = and i64 %t2735, 7
  %t2737 = icmp eq i64 %t2736, 0
  br i1 %t2737, label %fixfast738, label %fixslow739
fixfast738:
  %t2738 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t2739 = extractvalue {i64, i1} %t2738, 0
  %t2740 = extractvalue {i64, i1} %t2738, 1
  br i1 %t2740, label %fixslow739, label %fixmerge740
fixslow739:
  %t2741 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge740
fixmerge740:
  %t2742 = phi i64 [ %t2739, %fixfast738 ], [ %t2741, %fixslow739 ]
  %t2743 = musttail call fastcc i64 @"scheme.base:code_610"(i64 %self, i64 2, i64 %t2734, i64 %t2742, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2743
}

define fastcc i64 @"scheme.base:code:list->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2744 = icmp eq i64 %argc, 1
  br i1 %t2744, label %argok742, label %arityerr741
arityerr741:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok742:
  %t2745 = load i64, ptr @"scheme.base:length"
  %t2746 = and i64 %t2745, -8
  %t2747 = inttoptr i64 %t2746 to ptr
  %t2748 = load i64, ptr %t2747
  %t2749 = inttoptr i64 %t2748 to ptr
  %t2750 = call fastcc i64%t2749(i64 %t2745, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2751 = call i64 @rt_make_vector(i64 %t2750, i64 0)
  %t2752 = call ptr @rt_alloc_words(i64 3)
  %t2753 = ptrtoint ptr %t2752 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_610" to i64), ptr %t2752
  %t2754 = or i64 %t2753, 4
  %t2755 = getelementptr i64, ptr %t2752, i64 1
  store i64 %t2751, ptr %t2755
  %t2756 = getelementptr i64, ptr %t2752, i64 2
  store i64 %t2754, ptr %t2756
  %t2757 = musttail call fastcc i64 @"scheme.base:code_610"(i64 %t2754, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2757
}

define fastcc i64 @"scheme.base:code:vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2762 = icmp sge i64 %argc, 0
  br i1 %t2762, label %argok744, label %arityerr743
arityerr743:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok744:
  %t2763 = call ptr @rt_alloc_words(i64 8)
  %t2764 = getelementptr i64, ptr %t2763, i64 0
  store i64 %a0, ptr %t2764
  %t2765 = getelementptr i64, ptr %t2763, i64 1
  store i64 %a1, ptr %t2765
  %t2766 = getelementptr i64, ptr %t2763, i64 2
  store i64 %a2, ptr %t2766
  %t2767 = getelementptr i64, ptr %t2763, i64 3
  store i64 %a3, ptr %t2767
  %t2768 = getelementptr i64, ptr %t2763, i64 4
  store i64 %a4, ptr %t2768
  %t2769 = getelementptr i64, ptr %t2763, i64 5
  store i64 %a5, ptr %t2769
  %t2770 = getelementptr i64, ptr %t2763, i64 6
  store i64 %a6, ptr %t2770
  %t2771 = getelementptr i64, ptr %t2763, i64 7
  store i64 %a7, ptr %t2771
  %t2772 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2763, ptr %overflow)
  %t2773 = load i64, ptr @"scheme.base:list->vector"
  %t2774 = and i64 %t2773, -8
  %t2775 = inttoptr i64 %t2774 to ptr
  %t2776 = load i64, ptr %t2775
  %t2777 = inttoptr i64 %t2776 to ptr
  %t2778 = musttail call fastcc i64 %t2777(i64 %t2773, i64 1, i64 %t2772, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2778
}

define fastcc i64 @"scheme.base:code_620"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2783 = icmp eq i64 %argc, 2
  br i1 %t2783, label %argok746, label %arityerr745
arityerr745:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok746:
  %t2784 = call i64 @rt_null_p(i64 %a0)
  %t2785 = icmp ne i64 %t2784, 1
  br i1 %t2785, label %then747, label %else748
then747:
  %t2786 = and i64 %self, -8
  %t2787 = inttoptr i64 %t2786 to ptr
  %t2788 = getelementptr i64, ptr %t2787, i64 1
  %t2789 = load i64, ptr %t2788
  ret i64 %t2789
else748:
  %t2790 = and i64 %self, -8
  %t2791 = inttoptr i64 %t2790 to ptr
  %t2792 = getelementptr i64, ptr %t2791, i64 1
  %t2793 = load i64, ptr %t2792
  %t2794 = call i64 @rt_car(i64 %a0)
  %t2795 = call i64 @rt_bytevector_u8_set(i64 %t2793, i64 %a1, i64 %t2794)
  %t2796 = call i64 @rt_cdr(i64 %a0)
  %t2797 = or i64 %a1, 8
  %t2798 = and i64 %t2797, 7
  %t2799 = icmp eq i64 %t2798, 0
  br i1 %t2799, label %fixfast749, label %fixslow750
fixfast749:
  %t2800 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t2801 = extractvalue {i64, i1} %t2800, 0
  %t2802 = extractvalue {i64, i1} %t2800, 1
  br i1 %t2802, label %fixslow750, label %fixmerge751
fixslow750:
  %t2803 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge751
fixmerge751:
  %t2804 = phi i64 [ %t2801, %fixfast749 ], [ %t2803, %fixslow750 ]
  %t2805 = musttail call fastcc i64 @"scheme.base:code_620"(i64 %self, i64 2, i64 %t2796, i64 %t2804, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2805
}

define fastcc i64 @"scheme.base:code:list->bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2806 = icmp eq i64 %argc, 1
  br i1 %t2806, label %argok753, label %arityerr752
arityerr752:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok753:
  %t2807 = load i64, ptr @"scheme.base:length"
  %t2808 = and i64 %t2807, -8
  %t2809 = inttoptr i64 %t2808 to ptr
  %t2810 = load i64, ptr %t2809
  %t2811 = inttoptr i64 %t2810 to ptr
  %t2812 = call fastcc i64%t2811(i64 %t2807, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2813 = call i64 @rt_make_bytevector(i64 %t2812, i64 0)
  %t2814 = call ptr @rt_alloc_words(i64 3)
  %t2815 = ptrtoint ptr %t2814 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_620" to i64), ptr %t2814
  %t2816 = or i64 %t2815, 4
  %t2817 = getelementptr i64, ptr %t2814, i64 1
  store i64 %t2813, ptr %t2817
  %t2818 = getelementptr i64, ptr %t2814, i64 2
  store i64 %t2816, ptr %t2818
  %t2819 = musttail call fastcc i64 @"scheme.base:code_620"(i64 %t2816, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2819
}

define fastcc i64 @"scheme.base:code:bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2824 = icmp sge i64 %argc, 0
  br i1 %t2824, label %argok755, label %arityerr754
arityerr754:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok755:
  %t2825 = call ptr @rt_alloc_words(i64 8)
  %t2826 = getelementptr i64, ptr %t2825, i64 0
  store i64 %a0, ptr %t2826
  %t2827 = getelementptr i64, ptr %t2825, i64 1
  store i64 %a1, ptr %t2827
  %t2828 = getelementptr i64, ptr %t2825, i64 2
  store i64 %a2, ptr %t2828
  %t2829 = getelementptr i64, ptr %t2825, i64 3
  store i64 %a3, ptr %t2829
  %t2830 = getelementptr i64, ptr %t2825, i64 4
  store i64 %a4, ptr %t2830
  %t2831 = getelementptr i64, ptr %t2825, i64 5
  store i64 %a5, ptr %t2831
  %t2832 = getelementptr i64, ptr %t2825, i64 6
  store i64 %a6, ptr %t2832
  %t2833 = getelementptr i64, ptr %t2825, i64 7
  store i64 %a7, ptr %t2833
  %t2834 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2825, ptr %overflow)
  %t2835 = load i64, ptr @"scheme.base:list->bytevector"
  %t2836 = and i64 %t2835, -8
  %t2837 = inttoptr i64 %t2836 to ptr
  %t2838 = load i64, ptr %t2837
  %t2839 = inttoptr i64 %t2838 to ptr
  %t2840 = musttail call fastcc i64 %t2839(i64 %t2835, i64 1, i64 %t2834, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2840
}

define fastcc i64 @"scheme.base:code:values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2845 = icmp sge i64 %argc, 0
  br i1 %t2845, label %argok757, label %arityerr756
arityerr756:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok757:
  %t2846 = call ptr @rt_alloc_words(i64 8)
  %t2847 = getelementptr i64, ptr %t2846, i64 0
  store i64 %a0, ptr %t2847
  %t2848 = getelementptr i64, ptr %t2846, i64 1
  store i64 %a1, ptr %t2848
  %t2849 = getelementptr i64, ptr %t2846, i64 2
  store i64 %a2, ptr %t2849
  %t2850 = getelementptr i64, ptr %t2846, i64 3
  store i64 %a3, ptr %t2850
  %t2851 = getelementptr i64, ptr %t2846, i64 4
  store i64 %a4, ptr %t2851
  %t2852 = getelementptr i64, ptr %t2846, i64 5
  store i64 %a5, ptr %t2852
  %t2853 = getelementptr i64, ptr %t2846, i64 6
  store i64 %a6, ptr %t2853
  %t2854 = getelementptr i64, ptr %t2846, i64 7
  store i64 %a7, ptr %t2854
  %t2855 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2846, ptr %overflow)
  %t2856 = call i64 @rt_pair_p(i64 %t2855)
  %t2857 = icmp ne i64 %t2856, 1
  br i1 %t2857, label %then758, label %else759
then758:
  %t2858 = call i64 @rt_cdr(i64 %t2855)
  %t2859 = call i64 @rt_null_p(i64 %t2858)
  br label %merge760
else759:
  br label %merge760
merge760:
  %t2860 = phi i64 [ %t2859, %then758 ], [ 1, %else759 ]
  %t2861 = icmp ne i64 %t2860, 1
  br i1 %t2861, label %then761, label %else762
then761:
  %t2862 = call i64 @rt_car(i64 %t2855)
  ret i64 %t2862
else762:
  %t2863 = call i64 @rt_list_to_mv(i64 %t2855)
  ret i64 %t2863
}

define fastcc i64 @"scheme.base:code:call-with-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2868 = icmp eq i64 %argc, 2
  br i1 %t2868, label %argok764, label %arityerr763
arityerr763:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok764:
  %t2869 = and i64 %a0, -8
  %t2870 = inttoptr i64 %t2869 to ptr
  %t2871 = load i64, ptr %t2870
  %t2872 = inttoptr i64 %t2871 to ptr
  %t2873 = call fastcc i64%t2872(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2874 = call i64 @rt_mv_p(i64 %t2873)
  %t2875 = icmp ne i64 %t2874, 1
  br i1 %t2875, label %then765, label %else766
then765:
  %t2876 = call i64 @rt_mv_to_list(i64 %t2873)
  %t2877 = and i64 %a1, -8
  %t2878 = inttoptr i64 %t2877 to ptr
  %t2879 = load i64, ptr %t2878
  %t2880 = inttoptr i64 %t2879 to ptr
  %t2881 = call i64 @rt_list_length(i64 %t2876)
  %t2882 = add i64 0, %t2881
  %t2883 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t2876, i64 8)
  %t2895 = getelementptr i64, ptr %t2883, i64 0
  %t2887 = load i64, ptr %t2895
  %t2896 = getelementptr i64, ptr %t2883, i64 1
  %t2888 = load i64, ptr %t2896
  %t2897 = getelementptr i64, ptr %t2883, i64 2
  %t2889 = load i64, ptr %t2897
  %t2898 = getelementptr i64, ptr %t2883, i64 3
  %t2890 = load i64, ptr %t2898
  %t2899 = getelementptr i64, ptr %t2883, i64 4
  %t2891 = load i64, ptr %t2899
  %t2900 = getelementptr i64, ptr %t2883, i64 5
  %t2892 = load i64, ptr %t2900
  %t2901 = getelementptr i64, ptr %t2883, i64 6
  %t2893 = load i64, ptr %t2901
  %t2902 = getelementptr i64, ptr %t2883, i64 7
  %t2894 = load i64, ptr %t2902
  %t2884 = icmp sgt i64 %t2882, 8
  %t2885 = getelementptr i64, ptr %t2883, i64 8
  %t2886 = select i1 %t2884, ptr %t2885, ptr null
  %t2903 = musttail call fastcc i64 %t2880(i64 %a1, i64 %t2882, i64 %t2887, i64 %t2888, i64 %t2889, i64 %t2890, i64 %t2891, i64 %t2892, i64 %t2893, i64 %t2894, ptr %t2886)
  ret i64 %t2903
else766:
  %t2904 = and i64 %a1, -8
  %t2905 = inttoptr i64 %t2904 to ptr
  %t2906 = load i64, ptr %t2905
  %t2907 = inttoptr i64 %t2906 to ptr
  %t2908 = musttail call fastcc i64 %t2907(i64 %a1, i64 1, i64 %t2873, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2908
}

define fastcc i64 @"scheme.base:code:make-hash-table"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2915 = icmp eq i64 %argc, 0
  br i1 %t2915, label %argok768, label %arityerr767
arityerr767:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok768:
  %t2916 = load i64, ptr @"scheme.base:%ht-initial-buckets"
  %t2917 = call i64 @rt_make_vector(i64 %t2916, i64 2)
  %t2918 = load i64, ptr @"scheme.base:vector"
  %t2919 = and i64 %t2918, -8
  %t2920 = inttoptr i64 %t2919 to ptr
  %t2921 = load i64, ptr %t2920
  %t2922 = inttoptr i64 %t2921 to ptr
  %t2923 = call fastcc i64%t2922(i64 %t2918, i64 3, i64 0, i64 %t2917, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2924 = call i64 @rt_make_hash_table(i64 %t2923)
  ret i64 %t2924
}

define fastcc i64 @"scheme.base:code:hash-table?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2929 = icmp eq i64 %argc, 1
  br i1 %t2929, label %argok770, label %arityerr769
arityerr769:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok770:
  %t2930 = call i64 @rt_hash_table_p(i64 %a0)
  ret i64 %t2930
}

define fastcc i64 @"scheme.base:code:%ht-count"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2935 = icmp eq i64 %argc, 1
  br i1 %t2935, label %argok772, label %arityerr771
arityerr771:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok772:
  %t2936 = call i64 @rt_hash_table_spine(i64 %a0)
  %t2937 = call i64 @rt_vector_ref(i64 %t2936, i64 0)
  ret i64 %t2937
}

define fastcc i64 @"scheme.base:code:%ht-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2942 = icmp eq i64 %argc, 1
  br i1 %t2942, label %argok774, label %arityerr773
arityerr773:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok774:
  %t2943 = call i64 @rt_hash_table_spine(i64 %a0)
  %t2944 = call i64 @rt_vector_ref(i64 %t2943, i64 8)
  ret i64 %t2944
}

define fastcc i64 @"scheme.base:code:%ht-set-count!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2949 = icmp eq i64 %argc, 2
  br i1 %t2949, label %argok776, label %arityerr775
arityerr775:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok776:
  %t2950 = call i64 @rt_hash_table_spine(i64 %a0)
  %t2951 = call i64 @rt_vector_set(i64 %t2950, i64 0, i64 %a1)
  ret i64 %t2951
}

define fastcc i64 @"scheme.base:code:%ht-set-buckets!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2956 = icmp eq i64 %argc, 2
  br i1 %t2956, label %argok778, label %arityerr777
arityerr777:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok778:
  %t2957 = call i64 @rt_hash_table_spine(i64 %a0)
  %t2958 = call i64 @rt_vector_set(i64 %t2957, i64 8, i64 %a1)
  ret i64 %t2958
}

define fastcc i64 @"scheme.base:code:%ht-index"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2963 = icmp eq i64 %argc, 2
  br i1 %t2963, label %argok780, label %arityerr779
arityerr779:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok780:
  %t2964 = call i64 @rt_hash(i64 %a0)
  %t2965 = call i64 @rt_remainder(i64 %t2964, i64 %a1)
  ret i64 %t2965
}

define fastcc i64 @"scheme.base:code:%ht-assoc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2970 = icmp eq i64 %argc, 2
  br i1 %t2970, label %argok782, label %arityerr781
arityerr781:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok782:
  %t2971 = call i64 @rt_null_p(i64 %a1)
  %t2972 = icmp ne i64 %t2971, 1
  br i1 %t2972, label %then783, label %else784
then783:
  ret i64 1
else784:
  %t2973 = call i64 @rt_car(i64 %a1)
  %t2974 = call i64 @rt_car(i64 %t2973)
  %t2975 = call i64 @rt_equal(i64 %a0, i64 %t2974)
  %t2976 = icmp ne i64 %t2975, 1
  br i1 %t2976, label %then785, label %else786
then785:
  %t2977 = call i64 @rt_car(i64 %a1)
  ret i64 %t2977
else786:
  %t2978 = call i64 @rt_cdr(i64 %a1)
  %t2979 = load i64, ptr @"scheme.base:%ht-assoc"
  %t2980 = and i64 %t2979, -8
  %t2981 = inttoptr i64 %t2980 to ptr
  %t2982 = load i64, ptr %t2981
  %t2983 = inttoptr i64 %t2982 to ptr
  %t2984 = musttail call fastcc i64 %t2983(i64 %t2979, i64 2, i64 %a0, i64 %t2978, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2984
}

define fastcc i64 @"scheme.base:code:%ht-remove"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2989 = icmp eq i64 %argc, 2
  br i1 %t2989, label %argok788, label %arityerr787
arityerr787:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok788:
  %t2990 = call i64 @rt_null_p(i64 %a1)
  %t2991 = icmp ne i64 %t2990, 1
  br i1 %t2991, label %then789, label %else790
then789:
  ret i64 2
else790:
  %t2992 = call i64 @rt_car(i64 %a1)
  %t2993 = call i64 @rt_car(i64 %t2992)
  %t2994 = call i64 @rt_equal(i64 %a0, i64 %t2993)
  %t2995 = icmp ne i64 %t2994, 1
  br i1 %t2995, label %then791, label %else792
then791:
  %t2996 = call i64 @rt_cdr(i64 %a1)
  ret i64 %t2996
else792:
  %t2997 = call i64 @rt_car(i64 %a1)
  %t2998 = call i64 @rt_cdr(i64 %a1)
  %t2999 = load i64, ptr @"scheme.base:%ht-remove"
  %t3000 = and i64 %t2999, -8
  %t3001 = inttoptr i64 %t3000 to ptr
  %t3002 = load i64, ptr %t3001
  %t3003 = inttoptr i64 %t3002 to ptr
  %t3004 = call fastcc i64%t3003(i64 %t2999, i64 2, i64 %a0, i64 %t2998, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3005 = call i64 @rt_cons(i64 %t2997, i64 %t3004)
  ret i64 %t3005
}

define fastcc i64 @"scheme.base:code:hash-table-ref/default"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3010 = icmp eq i64 %argc, 3
  br i1 %t3010, label %argok794, label %arityerr793
arityerr793:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok794:
  %t3011 = load i64, ptr @"scheme.base:%ht-buckets"
  %t3012 = and i64 %t3011, -8
  %t3013 = inttoptr i64 %t3012 to ptr
  %t3014 = load i64, ptr %t3013
  %t3015 = inttoptr i64 %t3014 to ptr
  %t3016 = call fastcc i64%t3015(i64 %t3011, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3017 = call i64 @rt_vector_length(i64 %t3016)
  %t3018 = load i64, ptr @"scheme.base:%ht-index"
  %t3019 = and i64 %t3018, -8
  %t3020 = inttoptr i64 %t3019 to ptr
  %t3021 = load i64, ptr %t3020
  %t3022 = inttoptr i64 %t3021 to ptr
  %t3023 = call fastcc i64%t3022(i64 %t3018, i64 2, i64 %a1, i64 %t3017, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3024 = call i64 @rt_vector_ref(i64 %t3016, i64 %t3023)
  %t3025 = load i64, ptr @"scheme.base:%ht-assoc"
  %t3026 = and i64 %t3025, -8
  %t3027 = inttoptr i64 %t3026 to ptr
  %t3028 = load i64, ptr %t3027
  %t3029 = inttoptr i64 %t3028 to ptr
  %t3030 = call fastcc i64%t3029(i64 %t3025, i64 2, i64 %a1, i64 %t3024, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3031 = icmp ne i64 %t3030, 1
  br i1 %t3031, label %then795, label %else796
then795:
  %t3032 = call i64 @rt_cdr(i64 %t3030)
  ret i64 %t3032
else796:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:hash-table-contains?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3037 = icmp eq i64 %argc, 2
  br i1 %t3037, label %argok798, label %arityerr797
arityerr797:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok798:
  %t3038 = load i64, ptr @"scheme.base:%ht-buckets"
  %t3039 = and i64 %t3038, -8
  %t3040 = inttoptr i64 %t3039 to ptr
  %t3041 = load i64, ptr %t3040
  %t3042 = inttoptr i64 %t3041 to ptr
  %t3043 = call fastcc i64%t3042(i64 %t3038, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3044 = call i64 @rt_vector_length(i64 %t3043)
  %t3045 = load i64, ptr @"scheme.base:%ht-index"
  %t3046 = and i64 %t3045, -8
  %t3047 = inttoptr i64 %t3046 to ptr
  %t3048 = load i64, ptr %t3047
  %t3049 = inttoptr i64 %t3048 to ptr
  %t3050 = call fastcc i64%t3049(i64 %t3045, i64 2, i64 %a1, i64 %t3044, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3051 = call i64 @rt_vector_ref(i64 %t3043, i64 %t3050)
  %t3052 = load i64, ptr @"scheme.base:%ht-assoc"
  %t3053 = and i64 %t3052, -8
  %t3054 = inttoptr i64 %t3053 to ptr
  %t3055 = load i64, ptr %t3054
  %t3056 = inttoptr i64 %t3055 to ptr
  %t3057 = call fastcc i64%t3056(i64 %t3052, i64 2, i64 %a1, i64 %t3051, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3058 = icmp ne i64 %t3057, 1
  br i1 %t3058, label %then799, label %else800
then799:
  ret i64 257
else800:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-ref"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3063 = icmp eq i64 %argc, 2
  br i1 %t3063, label %argok802, label %arityerr801
arityerr801:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok802:
  %t3064 = load i64, ptr @"scheme.base:%ht-buckets"
  %t3065 = and i64 %t3064, -8
  %t3066 = inttoptr i64 %t3065 to ptr
  %t3067 = load i64, ptr %t3066
  %t3068 = inttoptr i64 %t3067 to ptr
  %t3069 = call fastcc i64%t3068(i64 %t3064, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3070 = call i64 @rt_vector_length(i64 %t3069)
  %t3071 = load i64, ptr @"scheme.base:%ht-index"
  %t3072 = and i64 %t3071, -8
  %t3073 = inttoptr i64 %t3072 to ptr
  %t3074 = load i64, ptr %t3073
  %t3075 = inttoptr i64 %t3074 to ptr
  %t3076 = call fastcc i64%t3075(i64 %t3071, i64 2, i64 %a1, i64 %t3070, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3077 = call i64 @rt_vector_ref(i64 %t3069, i64 %t3076)
  %t3078 = load i64, ptr @"scheme.base:%ht-assoc"
  %t3079 = and i64 %t3078, -8
  %t3080 = inttoptr i64 %t3079 to ptr
  %t3081 = load i64, ptr %t3080
  %t3082 = inttoptr i64 %t3081 to ptr
  %t3083 = call fastcc i64%t3082(i64 %t3078, i64 2, i64 %a1, i64 %t3077, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3084 = icmp ne i64 %t3083, 1
  br i1 %t3084, label %then803, label %else804
then803:
  %t3085 = call i64 @rt_cdr(i64 %t3083)
  ret i64 %t3085
else804:
  %t3086 = call i64 @rt_make_string(ptr @.str.lit.12, i64 29)
  %t3087 = load i64, ptr @"scheme.base:error"
  %t3088 = and i64 %t3087, -8
  %t3089 = inttoptr i64 %t3088 to ptr
  %t3090 = load i64, ptr %t3089
  %t3091 = inttoptr i64 %t3090 to ptr
  %t3092 = musttail call fastcc i64 %t3091(i64 %t3087, i64 2, i64 %t3086, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3092
}

define fastcc i64 @"scheme.base:code:hash-table-set!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3097 = icmp eq i64 %argc, 3
  br i1 %t3097, label %argok806, label %arityerr805
arityerr805:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok806:
  %t3098 = load i64, ptr @"scheme.base:%ht-buckets"
  %t3099 = and i64 %t3098, -8
  %t3100 = inttoptr i64 %t3099 to ptr
  %t3101 = load i64, ptr %t3100
  %t3102 = inttoptr i64 %t3101 to ptr
  %t3103 = call fastcc i64%t3102(i64 %t3098, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3104 = call i64 @rt_vector_length(i64 %t3103)
  %t3105 = load i64, ptr @"scheme.base:%ht-index"
  %t3106 = and i64 %t3105, -8
  %t3107 = inttoptr i64 %t3106 to ptr
  %t3108 = load i64, ptr %t3107
  %t3109 = inttoptr i64 %t3108 to ptr
  %t3110 = call fastcc i64%t3109(i64 %t3105, i64 2, i64 %a1, i64 %t3104, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3111 = call i64 @rt_vector_ref(i64 %t3103, i64 %t3110)
  %t3112 = load i64, ptr @"scheme.base:%ht-assoc"
  %t3113 = and i64 %t3112, -8
  %t3114 = inttoptr i64 %t3113 to ptr
  %t3115 = load i64, ptr %t3114
  %t3116 = inttoptr i64 %t3115 to ptr
  %t3117 = call fastcc i64%t3116(i64 %t3112, i64 2, i64 %a1, i64 %t3111, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3118 = call i64 @rt_cons(i64 %a1, i64 %a2)
  %t3119 = icmp ne i64 %t3117, 1
  br i1 %t3119, label %then807, label %else808
then807:
  %t3120 = load i64, ptr @"scheme.base:%ht-remove"
  %t3121 = and i64 %t3120, -8
  %t3122 = inttoptr i64 %t3121 to ptr
  %t3123 = load i64, ptr %t3122
  %t3124 = inttoptr i64 %t3123 to ptr
  %t3125 = call fastcc i64%t3124(i64 %t3120, i64 2, i64 %a1, i64 %t3111, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge809
else808:
  br label %merge809
merge809:
  %t3126 = phi i64 [ %t3125, %then807 ], [ %t3111, %else808 ]
  %t3127 = call i64 @rt_cons(i64 %t3118, i64 %t3126)
  %t3128 = call i64 @rt_vector_set(i64 %t3103, i64 %t3110, i64 %t3127)
  %t3129 = icmp ne i64 %t3117, 1
  br i1 %t3129, label %then810, label %else811
then810:
  ret i64 1
else811:
  %t3130 = load i64, ptr @"scheme.base:%ht-count"
  %t3131 = and i64 %t3130, -8
  %t3132 = inttoptr i64 %t3131 to ptr
  %t3133 = load i64, ptr %t3132
  %t3134 = inttoptr i64 %t3133 to ptr
  %t3135 = call fastcc i64%t3134(i64 %t3130, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3136 = or i64 %t3135, 8
  %t3137 = and i64 %t3136, 7
  %t3138 = icmp eq i64 %t3137, 0
  br i1 %t3138, label %fixfast812, label %fixslow813
fixfast812:
  %t3139 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3135, i64 8)
  %t3140 = extractvalue {i64, i1} %t3139, 0
  %t3141 = extractvalue {i64, i1} %t3139, 1
  br i1 %t3141, label %fixslow813, label %fixmerge814
fixslow813:
  %t3142 = call i64 @rt_add(i64 %t3135, i64 8)
  br label %fixmerge814
fixmerge814:
  %t3143 = phi i64 [ %t3140, %fixfast812 ], [ %t3142, %fixslow813 ]
  %t3144 = load i64, ptr @"scheme.base:%ht-set-count!"
  %t3145 = and i64 %t3144, -8
  %t3146 = inttoptr i64 %t3145 to ptr
  %t3147 = load i64, ptr %t3146
  %t3148 = inttoptr i64 %t3147 to ptr
  %t3149 = call fastcc i64%t3148(i64 %t3144, i64 2, i64 %a0, i64 %t3143, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3150 = load i64, ptr @"scheme.base:%ht-count"
  %t3151 = and i64 %t3150, -8
  %t3152 = inttoptr i64 %t3151 to ptr
  %t3153 = load i64, ptr %t3152
  %t3154 = inttoptr i64 %t3153 to ptr
  %t3155 = call fastcc i64%t3154(i64 %t3150, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3156 = load i64, ptr @"scheme.base:%ht-load-factor"
  %t3157 = or i64 %t3156, %t3104
  %t3158 = and i64 %t3157, 7
  %t3159 = icmp eq i64 %t3158, 0
  br i1 %t3159, label %fixfast815, label %fixslow816
fixfast815:
  %t3160 = ashr i64 %t3156, 3
  %t3161 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t3160, i64 %t3104)
  %t3162 = extractvalue {i64, i1} %t3161, 0
  %t3163 = extractvalue {i64, i1} %t3161, 1
  br i1 %t3163, label %fixslow816, label %fixmerge817
fixslow816:
  %t3164 = call i64 @rt_mul(i64 %t3156, i64 %t3104)
  br label %fixmerge817
fixmerge817:
  %t3165 = phi i64 [ %t3162, %fixfast815 ], [ %t3164, %fixslow816 ]
  %t3166 = or i64 %t3165, %t3155
  %t3167 = and i64 %t3166, 7
  %t3168 = icmp eq i64 %t3167, 0
  br i1 %t3168, label %fixfast818, label %fixslow819
fixfast818:
  %t3169 = icmp slt i64 %t3165, %t3155
  %t3170 = select i1 %t3169, i64 257, i64 1
  br label %fixmerge820
fixslow819:
  %t3171 = call i64 @rt_lt(i64 %t3165, i64 %t3155)
  br label %fixmerge820
fixmerge820:
  %t3172 = phi i64 [ %t3170, %fixfast818 ], [ %t3171, %fixslow819 ]
  %t3173 = icmp ne i64 %t3172, 1
  br i1 %t3173, label %then821, label %else822
then821:
  %t3174 = load i64, ptr @"scheme.base:%ht-grow!"
  %t3175 = and i64 %t3174, -8
  %t3176 = inttoptr i64 %t3175 to ptr
  %t3177 = load i64, ptr %t3176
  %t3178 = inttoptr i64 %t3177 to ptr
  %t3179 = musttail call fastcc i64 %t3178(i64 %t3174, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3179
else822:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-delete!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3184 = icmp eq i64 %argc, 2
  br i1 %t3184, label %argok824, label %arityerr823
arityerr823:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok824:
  %t3185 = load i64, ptr @"scheme.base:%ht-buckets"
  %t3186 = and i64 %t3185, -8
  %t3187 = inttoptr i64 %t3186 to ptr
  %t3188 = load i64, ptr %t3187
  %t3189 = inttoptr i64 %t3188 to ptr
  %t3190 = call fastcc i64%t3189(i64 %t3185, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3191 = call i64 @rt_vector_length(i64 %t3190)
  %t3192 = load i64, ptr @"scheme.base:%ht-index"
  %t3193 = and i64 %t3192, -8
  %t3194 = inttoptr i64 %t3193 to ptr
  %t3195 = load i64, ptr %t3194
  %t3196 = inttoptr i64 %t3195 to ptr
  %t3197 = call fastcc i64%t3196(i64 %t3192, i64 2, i64 %a1, i64 %t3191, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3198 = call i64 @rt_vector_ref(i64 %t3190, i64 %t3197)
  %t3199 = load i64, ptr @"scheme.base:%ht-assoc"
  %t3200 = and i64 %t3199, -8
  %t3201 = inttoptr i64 %t3200 to ptr
  %t3202 = load i64, ptr %t3201
  %t3203 = inttoptr i64 %t3202 to ptr
  %t3204 = call fastcc i64%t3203(i64 %t3199, i64 2, i64 %a1, i64 %t3198, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3205 = icmp ne i64 %t3204, 1
  br i1 %t3205, label %then825, label %else826
then825:
  %t3206 = load i64, ptr @"scheme.base:%ht-remove"
  %t3207 = and i64 %t3206, -8
  %t3208 = inttoptr i64 %t3207 to ptr
  %t3209 = load i64, ptr %t3208
  %t3210 = inttoptr i64 %t3209 to ptr
  %t3211 = call fastcc i64%t3210(i64 %t3206, i64 2, i64 %a1, i64 %t3198, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3212 = call i64 @rt_vector_set(i64 %t3190, i64 %t3197, i64 %t3211)
  %t3213 = load i64, ptr @"scheme.base:%ht-count"
  %t3214 = and i64 %t3213, -8
  %t3215 = inttoptr i64 %t3214 to ptr
  %t3216 = load i64, ptr %t3215
  %t3217 = inttoptr i64 %t3216 to ptr
  %t3218 = call fastcc i64%t3217(i64 %t3213, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3219 = or i64 %t3218, 8
  %t3220 = and i64 %t3219, 7
  %t3221 = icmp eq i64 %t3220, 0
  br i1 %t3221, label %fixfast827, label %fixslow828
fixfast827:
  %t3222 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3218, i64 8)
  %t3223 = extractvalue {i64, i1} %t3222, 0
  %t3224 = extractvalue {i64, i1} %t3222, 1
  br i1 %t3224, label %fixslow828, label %fixmerge829
fixslow828:
  %t3225 = call i64 @rt_sub(i64 %t3218, i64 8)
  br label %fixmerge829
fixmerge829:
  %t3226 = phi i64 [ %t3223, %fixfast827 ], [ %t3225, %fixslow828 ]
  %t3227 = load i64, ptr @"scheme.base:%ht-set-count!"
  %t3228 = and i64 %t3227, -8
  %t3229 = inttoptr i64 %t3228 to ptr
  %t3230 = load i64, ptr %t3229
  %t3231 = inttoptr i64 %t3230 to ptr
  %t3232 = musttail call fastcc i64 %t3231(i64 %t3227, i64 2, i64 %a0, i64 %t3226, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3232
else826:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_703"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3237 = icmp eq i64 %argc, 1
  br i1 %t3237, label %argok831, label %arityerr830
arityerr830:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok831:
  %t3238 = call i64 @rt_null_p(i64 %a0)
  %t3239 = icmp ne i64 %t3238, 1
  br i1 %t3239, label %then832, label %else833
then832:
  ret i64 1
else833:
  %t3240 = call i64 @rt_car(i64 %a0)
  %t3241 = call i64 @rt_car(i64 %t3240)
  %t3242 = and i64 %self, -8
  %t3243 = inttoptr i64 %t3242 to ptr
  %t3244 = getelementptr i64, ptr %t3243, i64 1
  %t3245 = load i64, ptr %t3244
  %t3246 = load i64, ptr @"scheme.base:%ht-index"
  %t3247 = and i64 %t3246, -8
  %t3248 = inttoptr i64 %t3247 to ptr
  %t3249 = load i64, ptr %t3248
  %t3250 = inttoptr i64 %t3249 to ptr
  %t3251 = call fastcc i64%t3250(i64 %t3246, i64 2, i64 %t3241, i64 %t3245, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3252 = and i64 %self, -8
  %t3253 = inttoptr i64 %t3252 to ptr
  %t3254 = getelementptr i64, ptr %t3253, i64 2
  %t3255 = load i64, ptr %t3254
  %t3256 = and i64 %self, -8
  %t3257 = inttoptr i64 %t3256 to ptr
  %t3258 = getelementptr i64, ptr %t3257, i64 2
  %t3259 = load i64, ptr %t3258
  %t3260 = call i64 @rt_vector_ref(i64 %t3259, i64 %t3251)
  %t3261 = call i64 @rt_cons(i64 %t3240, i64 %t3260)
  %t3262 = call i64 @rt_vector_set(i64 %t3255, i64 %t3251, i64 %t3261)
  %t3263 = call i64 @rt_cdr(i64 %a0)
  %t3264 = musttail call fastcc i64 @"scheme.base:code_703"(i64 %self, i64 1, i64 %t3263, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3264
}

define fastcc i64 @"scheme.base:code_701"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3265 = icmp eq i64 %argc, 1
  br i1 %t3265, label %argok835, label %arityerr834
arityerr834:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok835:
  %t3266 = and i64 %self, -8
  %t3267 = inttoptr i64 %t3266 to ptr
  %t3268 = getelementptr i64, ptr %t3267, i64 1
  %t3269 = load i64, ptr %t3268
  %t3270 = call i64 @rt_vector_length(i64 %t3269)
  %t3271 = or i64 %a0, %t3270
  %t3272 = and i64 %t3271, 7
  %t3273 = icmp eq i64 %t3272, 0
  br i1 %t3273, label %fixfast836, label %fixslow837
fixfast836:
  %t3274 = icmp slt i64 %a0, %t3270
  %t3275 = select i1 %t3274, i64 257, i64 1
  br label %fixmerge838
fixslow837:
  %t3276 = call i64 @rt_lt(i64 %a0, i64 %t3270)
  br label %fixmerge838
fixmerge838:
  %t3277 = phi i64 [ %t3275, %fixfast836 ], [ %t3276, %fixslow837 ]
  %t3278 = icmp ne i64 %t3277, 1
  br i1 %t3278, label %then839, label %else840
then839:
  %t3279 = call ptr @rt_alloc_words(i64 4)
  %t3280 = ptrtoint ptr %t3279 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_703" to i64), ptr %t3279
  %t3281 = or i64 %t3280, 4
  %t3282 = and i64 %self, -8
  %t3283 = inttoptr i64 %t3282 to ptr
  %t3284 = getelementptr i64, ptr %t3283, i64 2
  %t3285 = load i64, ptr %t3284
  %t3286 = getelementptr i64, ptr %t3279, i64 1
  store i64 %t3285, ptr %t3286
  %t3287 = and i64 %self, -8
  %t3288 = inttoptr i64 %t3287 to ptr
  %t3289 = getelementptr i64, ptr %t3288, i64 3
  %t3290 = load i64, ptr %t3289
  %t3291 = getelementptr i64, ptr %t3279, i64 2
  store i64 %t3290, ptr %t3291
  %t3292 = getelementptr i64, ptr %t3279, i64 3
  store i64 %t3281, ptr %t3292
  %t3293 = and i64 %self, -8
  %t3294 = inttoptr i64 %t3293 to ptr
  %t3295 = getelementptr i64, ptr %t3294, i64 1
  %t3296 = load i64, ptr %t3295
  %t3297 = call i64 @rt_vector_ref(i64 %t3296, i64 %a0)
  %t3298 = call fastcc i64 @"scheme.base:code_703"(i64 %t3281, i64 1, i64 %t3297, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3299 = or i64 %a0, 8
  %t3300 = and i64 %t3299, 7
  %t3301 = icmp eq i64 %t3300, 0
  br i1 %t3301, label %fixfast841, label %fixslow842
fixfast841:
  %t3302 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3303 = extractvalue {i64, i1} %t3302, 0
  %t3304 = extractvalue {i64, i1} %t3302, 1
  br i1 %t3304, label %fixslow842, label %fixmerge843
fixslow842:
  %t3305 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge843
fixmerge843:
  %t3306 = phi i64 [ %t3303, %fixfast841 ], [ %t3305, %fixslow842 ]
  %t3307 = musttail call fastcc i64 @"scheme.base:code_701"(i64 %self, i64 1, i64 %t3306, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3307
else840:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%ht-grow!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3308 = icmp eq i64 %argc, 1
  br i1 %t3308, label %argok845, label %arityerr844
arityerr844:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok845:
  %t3309 = load i64, ptr @"scheme.base:%ht-buckets"
  %t3310 = and i64 %t3309, -8
  %t3311 = inttoptr i64 %t3310 to ptr
  %t3312 = load i64, ptr %t3311
  %t3313 = inttoptr i64 %t3312 to ptr
  %t3314 = call fastcc i64%t3313(i64 %t3309, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3315 = call i64 @rt_vector_length(i64 %t3314)
  %t3316 = or i64 16, %t3315
  %t3317 = and i64 %t3316, 7
  %t3318 = icmp eq i64 %t3317, 0
  br i1 %t3318, label %fixfast846, label %fixslow847
fixfast846:
  %t3319 = ashr i64 16, 3
  %t3320 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t3319, i64 %t3315)
  %t3321 = extractvalue {i64, i1} %t3320, 0
  %t3322 = extractvalue {i64, i1} %t3320, 1
  br i1 %t3322, label %fixslow847, label %fixmerge848
fixslow847:
  %t3323 = call i64 @rt_mul(i64 16, i64 %t3315)
  br label %fixmerge848
fixmerge848:
  %t3324 = phi i64 [ %t3321, %fixfast846 ], [ %t3323, %fixslow847 ]
  %t3325 = call i64 @rt_make_vector(i64 %t3324, i64 2)
  %t3326 = call ptr @rt_alloc_words(i64 5)
  %t3327 = ptrtoint ptr %t3326 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_701" to i64), ptr %t3326
  %t3328 = or i64 %t3327, 4
  %t3329 = getelementptr i64, ptr %t3326, i64 1
  store i64 %t3314, ptr %t3329
  %t3330 = getelementptr i64, ptr %t3326, i64 2
  store i64 %t3324, ptr %t3330
  %t3331 = getelementptr i64, ptr %t3326, i64 3
  store i64 %t3325, ptr %t3331
  %t3332 = getelementptr i64, ptr %t3326, i64 4
  store i64 %t3328, ptr %t3332
  %t3333 = call fastcc i64 @"scheme.base:code_701"(i64 %t3328, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3334 = load i64, ptr @"scheme.base:%ht-set-buckets!"
  %t3335 = and i64 %t3334, -8
  %t3336 = inttoptr i64 %t3335 to ptr
  %t3337 = load i64, ptr %t3336
  %t3338 = inttoptr i64 %t3337 to ptr
  %t3339 = musttail call fastcc i64 %t3338(i64 %t3334, i64 2, i64 %a0, i64 %t3325, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3339
}

define fastcc i64 @"scheme.base:code:hash-table-size"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3344 = icmp eq i64 %argc, 1
  br i1 %t3344, label %argok850, label %arityerr849
arityerr849:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok850:
  %t3345 = load i64, ptr @"scheme.base:%ht-count"
  %t3346 = and i64 %t3345, -8
  %t3347 = inttoptr i64 %t3346 to ptr
  %t3348 = load i64, ptr %t3347
  %t3349 = inttoptr i64 %t3348 to ptr
  %t3350 = musttail call fastcc i64 %t3349(i64 %t3345, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3350
}

define fastcc i64 @"scheme.base:code:%ht-fold-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3355 = icmp eq i64 %argc, 2
  br i1 %t3355, label %argok852, label %arityerr851
arityerr851:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok852:
  %t3356 = call i64 @rt_null_p(i64 %a0)
  %t3357 = icmp ne i64 %t3356, 1
  br i1 %t3357, label %then853, label %else854
then853:
  ret i64 %a1
else854:
  %t3358 = call i64 @rt_car(i64 %a0)
  %t3359 = call i64 @rt_car(i64 %t3358)
  %t3360 = call i64 @rt_car(i64 %a0)
  %t3361 = call i64 @rt_cdr(i64 %t3360)
  %t3362 = call i64 @rt_cons(i64 %t3359, i64 %t3361)
  %t3363 = call i64 @rt_cdr(i64 %a0)
  %t3364 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  %t3365 = and i64 %t3364, -8
  %t3366 = inttoptr i64 %t3365 to ptr
  %t3367 = load i64, ptr %t3366
  %t3368 = inttoptr i64 %t3367 to ptr
  %t3369 = call fastcc i64%t3368(i64 %t3364, i64 2, i64 %t3363, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3370 = call i64 @rt_cons(i64 %t3362, i64 %t3369)
  ret i64 %t3370
}

define fastcc i64 @"scheme.base:code_720"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3375 = icmp eq i64 %argc, 2
  br i1 %t3375, label %argok856, label %arityerr855
arityerr855:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok856:
  %t3376 = and i64 %self, -8
  %t3377 = inttoptr i64 %t3376 to ptr
  %t3378 = getelementptr i64, ptr %t3377, i64 1
  %t3379 = load i64, ptr %t3378
  %t3380 = call i64 @rt_vector_length(i64 %t3379)
  %t3381 = or i64 %a0, %t3380
  %t3382 = and i64 %t3381, 7
  %t3383 = icmp eq i64 %t3382, 0
  br i1 %t3383, label %fixfast857, label %fixslow858
fixfast857:
  %t3384 = icmp slt i64 %a0, %t3380
  %t3385 = select i1 %t3384, i64 257, i64 1
  br label %fixmerge859
fixslow858:
  %t3386 = call i64 @rt_lt(i64 %a0, i64 %t3380)
  br label %fixmerge859
fixmerge859:
  %t3387 = phi i64 [ %t3385, %fixfast857 ], [ %t3386, %fixslow858 ]
  %t3388 = icmp ne i64 %t3387, 1
  br i1 %t3388, label %then860, label %else861
then860:
  %t3389 = or i64 %a0, 8
  %t3390 = and i64 %t3389, 7
  %t3391 = icmp eq i64 %t3390, 0
  br i1 %t3391, label %fixfast862, label %fixslow863
fixfast862:
  %t3392 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3393 = extractvalue {i64, i1} %t3392, 0
  %t3394 = extractvalue {i64, i1} %t3392, 1
  br i1 %t3394, label %fixslow863, label %fixmerge864
fixslow863:
  %t3395 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge864
fixmerge864:
  %t3396 = phi i64 [ %t3393, %fixfast862 ], [ %t3395, %fixslow863 ]
  %t3397 = and i64 %self, -8
  %t3398 = inttoptr i64 %t3397 to ptr
  %t3399 = getelementptr i64, ptr %t3398, i64 1
  %t3400 = load i64, ptr %t3399
  %t3401 = call i64 @rt_vector_ref(i64 %t3400, i64 %a0)
  %t3402 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  %t3403 = and i64 %t3402, -8
  %t3404 = inttoptr i64 %t3403 to ptr
  %t3405 = load i64, ptr %t3404
  %t3406 = inttoptr i64 %t3405 to ptr
  %t3407 = call fastcc i64%t3406(i64 %t3402, i64 2, i64 %t3401, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3408 = musttail call fastcc i64 @"scheme.base:code_720"(i64 %self, i64 2, i64 %t3396, i64 %t3407, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3408
else861:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:hash-table->alist"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3409 = icmp eq i64 %argc, 1
  br i1 %t3409, label %argok866, label %arityerr865
arityerr865:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok866:
  %t3410 = load i64, ptr @"scheme.base:%ht-buckets"
  %t3411 = and i64 %t3410, -8
  %t3412 = inttoptr i64 %t3411 to ptr
  %t3413 = load i64, ptr %t3412
  %t3414 = inttoptr i64 %t3413 to ptr
  %t3415 = call fastcc i64%t3414(i64 %t3410, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3416 = call ptr @rt_alloc_words(i64 3)
  %t3417 = ptrtoint ptr %t3416 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_720" to i64), ptr %t3416
  %t3418 = or i64 %t3417, 4
  %t3419 = getelementptr i64, ptr %t3416, i64 1
  store i64 %t3415, ptr %t3419
  %t3420 = getelementptr i64, ptr %t3416, i64 2
  store i64 %t3418, ptr %t3420
  %t3421 = musttail call fastcc i64 @"scheme.base:code_720"(i64 %t3418, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3421
}

define fastcc i64 @"scheme.base:code_725"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3426 = icmp eq i64 %argc, 1
  br i1 %t3426, label %argok868, label %arityerr867
arityerr867:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok868:
  %t3427 = call i64 @rt_car(i64 %a0)
  ret i64 %t3427
}

define fastcc i64 @"scheme.base:code:hash-table-keys"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3428 = icmp eq i64 %argc, 1
  br i1 %t3428, label %argok870, label %arityerr869
arityerr869:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok870:
  %t3429 = call ptr @rt_alloc_words(i64 1)
  %t3430 = ptrtoint ptr %t3429 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_725" to i64), ptr %t3429
  %t3431 = or i64 %t3430, 4
  %t3432 = load i64, ptr @"scheme.base:hash-table->alist"
  %t3433 = and i64 %t3432, -8
  %t3434 = inttoptr i64 %t3433 to ptr
  %t3435 = load i64, ptr %t3434
  %t3436 = inttoptr i64 %t3435 to ptr
  %t3437 = call fastcc i64%t3436(i64 %t3432, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3438 = load i64, ptr @"scheme.base:map"
  %t3439 = and i64 %t3438, -8
  %t3440 = inttoptr i64 %t3439 to ptr
  %t3441 = load i64, ptr %t3440
  %t3442 = inttoptr i64 %t3441 to ptr
  %t3443 = musttail call fastcc i64 %t3442(i64 %t3438, i64 2, i64 %t3431, i64 %t3437, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3443
}

define fastcc i64 @"scheme.base:code_730"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3448 = icmp eq i64 %argc, 1
  br i1 %t3448, label %argok872, label %arityerr871
arityerr871:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok872:
  %t3449 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t3449
}

define fastcc i64 @"scheme.base:code:hash-table-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3450 = icmp eq i64 %argc, 1
  br i1 %t3450, label %argok874, label %arityerr873
arityerr873:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok874:
  %t3451 = call ptr @rt_alloc_words(i64 1)
  %t3452 = ptrtoint ptr %t3451 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_730" to i64), ptr %t3451
  %t3453 = or i64 %t3452, 4
  %t3454 = load i64, ptr @"scheme.base:hash-table->alist"
  %t3455 = and i64 %t3454, -8
  %t3456 = inttoptr i64 %t3455 to ptr
  %t3457 = load i64, ptr %t3456
  %t3458 = inttoptr i64 %t3457 to ptr
  %t3459 = call fastcc i64%t3458(i64 %t3454, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3460 = load i64, ptr @"scheme.base:map"
  %t3461 = and i64 %t3460, -8
  %t3462 = inttoptr i64 %t3461 to ptr
  %t3463 = load i64, ptr %t3462
  %t3464 = inttoptr i64 %t3463 to ptr
  %t3465 = musttail call fastcc i64 %t3464(i64 %t3460, i64 2, i64 %t3453, i64 %t3459, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3465
}

define fastcc i64 @"scheme.base:code:rd-ws?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3470 = icmp eq i64 %argc, 1
  br i1 %t3470, label %argok876, label %arityerr875
arityerr875:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok876:
  %t3471 = call i64 @rt_char_to_integer(i64 %a0)
  %t3472 = or i64 %t3471, 256
  %t3473 = and i64 %t3472, 7
  %t3474 = icmp eq i64 %t3473, 0
  br i1 %t3474, label %fixfast877, label %fixslow878
fixfast877:
  %t3475 = icmp eq i64 %t3471, 256
  %t3476 = select i1 %t3475, i64 257, i64 1
  br label %fixmerge879
fixslow878:
  %t3477 = call i64 @rt_num_eq(i64 %t3471, i64 256)
  br label %fixmerge879
fixmerge879:
  %t3478 = phi i64 [ %t3476, %fixfast877 ], [ %t3477, %fixslow878 ]
  %t3479 = icmp ne i64 %t3478, 1
  br i1 %t3479, label %then880, label %else881
then880:
  ret i64 %t3478
else881:
  %t3480 = or i64 %t3471, 72
  %t3481 = and i64 %t3480, 7
  %t3482 = icmp eq i64 %t3481, 0
  br i1 %t3482, label %fixfast882, label %fixslow883
fixfast882:
  %t3483 = icmp eq i64 %t3471, 72
  %t3484 = select i1 %t3483, i64 257, i64 1
  br label %fixmerge884
fixslow883:
  %t3485 = call i64 @rt_num_eq(i64 %t3471, i64 72)
  br label %fixmerge884
fixmerge884:
  %t3486 = phi i64 [ %t3484, %fixfast882 ], [ %t3485, %fixslow883 ]
  %t3487 = icmp ne i64 %t3486, 1
  br i1 %t3487, label %then885, label %else886
then885:
  ret i64 %t3486
else886:
  %t3488 = or i64 %t3471, 80
  %t3489 = and i64 %t3488, 7
  %t3490 = icmp eq i64 %t3489, 0
  br i1 %t3490, label %fixfast887, label %fixslow888
fixfast887:
  %t3491 = icmp eq i64 %t3471, 80
  %t3492 = select i1 %t3491, i64 257, i64 1
  br label %fixmerge889
fixslow888:
  %t3493 = call i64 @rt_num_eq(i64 %t3471, i64 80)
  br label %fixmerge889
fixmerge889:
  %t3494 = phi i64 [ %t3492, %fixfast887 ], [ %t3493, %fixslow888 ]
  %t3495 = icmp ne i64 %t3494, 1
  br i1 %t3495, label %then890, label %else891
then890:
  ret i64 %t3494
else891:
  %t3496 = or i64 %t3471, 104
  %t3497 = and i64 %t3496, 7
  %t3498 = icmp eq i64 %t3497, 0
  br i1 %t3498, label %fixfast892, label %fixslow893
fixfast892:
  %t3499 = icmp eq i64 %t3471, 104
  %t3500 = select i1 %t3499, i64 257, i64 1
  br label %fixmerge894
fixslow893:
  %t3501 = call i64 @rt_num_eq(i64 %t3471, i64 104)
  br label %fixmerge894
fixmerge894:
  %t3502 = phi i64 [ %t3500, %fixfast892 ], [ %t3501, %fixslow893 ]
  ret i64 %t3502
}

define fastcc i64 @"scheme.base:code:rd-digit?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3507 = icmp eq i64 %argc, 1
  br i1 %t3507, label %argok896, label %arityerr895
arityerr895:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok896:
  %t3508 = call i64 @rt_char_to_integer(i64 %a0)
  %t3509 = or i64 376, %t3508
  %t3510 = and i64 %t3509, 7
  %t3511 = icmp eq i64 %t3510, 0
  br i1 %t3511, label %fixfast897, label %fixslow898
fixfast897:
  %t3512 = icmp slt i64 376, %t3508
  %t3513 = select i1 %t3512, i64 257, i64 1
  br label %fixmerge899
fixslow898:
  %t3514 = call i64 @rt_lt(i64 376, i64 %t3508)
  br label %fixmerge899
fixmerge899:
  %t3515 = phi i64 [ %t3513, %fixfast897 ], [ %t3514, %fixslow898 ]
  %t3516 = icmp ne i64 %t3515, 1
  br i1 %t3516, label %then900, label %else901
then900:
  %t3517 = or i64 %t3508, 464
  %t3518 = and i64 %t3517, 7
  %t3519 = icmp eq i64 %t3518, 0
  br i1 %t3519, label %fixfast902, label %fixslow903
fixfast902:
  %t3520 = icmp slt i64 %t3508, 464
  %t3521 = select i1 %t3520, i64 257, i64 1
  br label %fixmerge904
fixslow903:
  %t3522 = call i64 @rt_lt(i64 %t3508, i64 464)
  br label %fixmerge904
fixmerge904:
  %t3523 = phi i64 [ %t3521, %fixfast902 ], [ %t3522, %fixslow903 ]
  ret i64 %t3523
else901:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rd-delim?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3528 = icmp eq i64 %argc, 1
  br i1 %t3528, label %argok906, label %arityerr905
arityerr905:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok906:
  %t3529 = call i64 @rt_char_to_integer(i64 %a0)
  %t3530 = load i64, ptr @"scheme.base:rd-ws?"
  %t3531 = and i64 %t3530, -8
  %t3532 = inttoptr i64 %t3531 to ptr
  %t3533 = load i64, ptr %t3532
  %t3534 = inttoptr i64 %t3533 to ptr
  %t3535 = call fastcc i64%t3534(i64 %t3530, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3536 = icmp ne i64 %t3535, 1
  br i1 %t3536, label %then907, label %else908
then907:
  ret i64 %t3535
else908:
  %t3537 = or i64 %t3529, 320
  %t3538 = and i64 %t3537, 7
  %t3539 = icmp eq i64 %t3538, 0
  br i1 %t3539, label %fixfast909, label %fixslow910
fixfast909:
  %t3540 = icmp eq i64 %t3529, 320
  %t3541 = select i1 %t3540, i64 257, i64 1
  br label %fixmerge911
fixslow910:
  %t3542 = call i64 @rt_num_eq(i64 %t3529, i64 320)
  br label %fixmerge911
fixmerge911:
  %t3543 = phi i64 [ %t3541, %fixfast909 ], [ %t3542, %fixslow910 ]
  %t3544 = icmp ne i64 %t3543, 1
  br i1 %t3544, label %then912, label %else913
then912:
  ret i64 %t3543
else913:
  %t3545 = or i64 %t3529, 328
  %t3546 = and i64 %t3545, 7
  %t3547 = icmp eq i64 %t3546, 0
  br i1 %t3547, label %fixfast914, label %fixslow915
fixfast914:
  %t3548 = icmp eq i64 %t3529, 328
  %t3549 = select i1 %t3548, i64 257, i64 1
  br label %fixmerge916
fixslow915:
  %t3550 = call i64 @rt_num_eq(i64 %t3529, i64 328)
  br label %fixmerge916
fixmerge916:
  %t3551 = phi i64 [ %t3549, %fixfast914 ], [ %t3550, %fixslow915 ]
  %t3552 = icmp ne i64 %t3551, 1
  br i1 %t3552, label %then917, label %else918
then917:
  ret i64 %t3551
else918:
  %t3553 = or i64 %t3529, 728
  %t3554 = and i64 %t3553, 7
  %t3555 = icmp eq i64 %t3554, 0
  br i1 %t3555, label %fixfast919, label %fixslow920
fixfast919:
  %t3556 = icmp eq i64 %t3529, 728
  %t3557 = select i1 %t3556, i64 257, i64 1
  br label %fixmerge921
fixslow920:
  %t3558 = call i64 @rt_num_eq(i64 %t3529, i64 728)
  br label %fixmerge921
fixmerge921:
  %t3559 = phi i64 [ %t3557, %fixfast919 ], [ %t3558, %fixslow920 ]
  %t3560 = icmp ne i64 %t3559, 1
  br i1 %t3560, label %then922, label %else923
then922:
  ret i64 %t3559
else923:
  %t3561 = or i64 %t3529, 744
  %t3562 = and i64 %t3561, 7
  %t3563 = icmp eq i64 %t3562, 0
  br i1 %t3563, label %fixfast924, label %fixslow925
fixfast924:
  %t3564 = icmp eq i64 %t3529, 744
  %t3565 = select i1 %t3564, i64 257, i64 1
  br label %fixmerge926
fixslow925:
  %t3566 = call i64 @rt_num_eq(i64 %t3529, i64 744)
  br label %fixmerge926
fixmerge926:
  %t3567 = phi i64 [ %t3565, %fixfast924 ], [ %t3566, %fixslow925 ]
  %t3568 = icmp ne i64 %t3567, 1
  br i1 %t3568, label %then927, label %else928
then927:
  ret i64 %t3567
else928:
  %t3569 = or i64 %t3529, 272
  %t3570 = and i64 %t3569, 7
  %t3571 = icmp eq i64 %t3570, 0
  br i1 %t3571, label %fixfast929, label %fixslow930
fixfast929:
  %t3572 = icmp eq i64 %t3529, 272
  %t3573 = select i1 %t3572, i64 257, i64 1
  br label %fixmerge931
fixslow930:
  %t3574 = call i64 @rt_num_eq(i64 %t3529, i64 272)
  br label %fixmerge931
fixmerge931:
  %t3575 = phi i64 [ %t3573, %fixfast929 ], [ %t3574, %fixslow930 ]
  %t3576 = icmp ne i64 %t3575, 1
  br i1 %t3576, label %then932, label %else933
then932:
  ret i64 %t3575
else933:
  %t3577 = or i64 %t3529, 472
  %t3578 = and i64 %t3577, 7
  %t3579 = icmp eq i64 %t3578, 0
  br i1 %t3579, label %fixfast934, label %fixslow935
fixfast934:
  %t3580 = icmp eq i64 %t3529, 472
  %t3581 = select i1 %t3580, i64 257, i64 1
  br label %fixmerge936
fixslow935:
  %t3582 = call i64 @rt_num_eq(i64 %t3529, i64 472)
  br label %fixmerge936
fixmerge936:
  %t3583 = phi i64 [ %t3581, %fixfast934 ], [ %t3582, %fixslow935 ]
  ret i64 %t3583
}

define fastcc i64 @"scheme.base:code:rd-skip-line"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3588 = icmp eq i64 %argc, 3
  br i1 %t3588, label %argok938, label %arityerr937
arityerr937:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok938:
  %t3589 = or i64 %a2, %a1
  %t3590 = and i64 %t3589, 7
  %t3591 = icmp eq i64 %t3590, 0
  br i1 %t3591, label %fixfast939, label %fixslow940
fixfast939:
  %t3592 = icmp slt i64 %a2, %a1
  %t3593 = select i1 %t3592, i64 257, i64 1
  br label %fixmerge941
fixslow940:
  %t3594 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge941
fixmerge941:
  %t3595 = phi i64 [ %t3593, %fixfast939 ], [ %t3594, %fixslow940 ]
  %t3596 = icmp ne i64 %t3595, 1
  br i1 %t3596, label %then942, label %else943
then942:
  %t3597 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3598 = call i64 @rt_char_to_integer(i64 %t3597)
  %t3599 = or i64 %t3598, 80
  %t3600 = and i64 %t3599, 7
  %t3601 = icmp eq i64 %t3600, 0
  br i1 %t3601, label %fixfast944, label %fixslow945
fixfast944:
  %t3602 = icmp eq i64 %t3598, 80
  %t3603 = select i1 %t3602, i64 257, i64 1
  br label %fixmerge946
fixslow945:
  %t3604 = call i64 @rt_num_eq(i64 %t3598, i64 80)
  br label %fixmerge946
fixmerge946:
  %t3605 = phi i64 [ %t3603, %fixfast944 ], [ %t3604, %fixslow945 ]
  %t3606 = icmp ne i64 %t3605, 1
  br i1 %t3606, label %then947, label %else948
then947:
  %t3607 = or i64 %a2, 8
  %t3608 = and i64 %t3607, 7
  %t3609 = icmp eq i64 %t3608, 0
  br i1 %t3609, label %fixfast949, label %fixslow950
fixfast949:
  %t3610 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3611 = extractvalue {i64, i1} %t3610, 0
  %t3612 = extractvalue {i64, i1} %t3610, 1
  br i1 %t3612, label %fixslow950, label %fixmerge951
fixslow950:
  %t3613 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge951
fixmerge951:
  %t3614 = phi i64 [ %t3611, %fixfast949 ], [ %t3613, %fixslow950 ]
  ret i64 %t3614
else948:
  %t3615 = or i64 %a2, 8
  %t3616 = and i64 %t3615, 7
  %t3617 = icmp eq i64 %t3616, 0
  br i1 %t3617, label %fixfast952, label %fixslow953
fixfast952:
  %t3618 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3619 = extractvalue {i64, i1} %t3618, 0
  %t3620 = extractvalue {i64, i1} %t3618, 1
  br i1 %t3620, label %fixslow953, label %fixmerge954
fixslow953:
  %t3621 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge954
fixmerge954:
  %t3622 = phi i64 [ %t3619, %fixfast952 ], [ %t3621, %fixslow953 ]
  %t3623 = load i64, ptr @"scheme.base:rd-skip-line"
  %t3624 = and i64 %t3623, -8
  %t3625 = inttoptr i64 %t3624 to ptr
  %t3626 = load i64, ptr %t3625
  %t3627 = inttoptr i64 %t3626 to ptr
  %t3628 = musttail call fastcc i64 %t3627(i64 %t3623, i64 3, i64 %a0, i64 %a1, i64 %t3622, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3628
else943:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:rd-skip-ws"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3633 = icmp eq i64 %argc, 3
  br i1 %t3633, label %argok956, label %arityerr955
arityerr955:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok956:
  %t3634 = or i64 %a2, %a1
  %t3635 = and i64 %t3634, 7
  %t3636 = icmp eq i64 %t3635, 0
  br i1 %t3636, label %fixfast957, label %fixslow958
fixfast957:
  %t3637 = icmp slt i64 %a2, %a1
  %t3638 = select i1 %t3637, i64 257, i64 1
  br label %fixmerge959
fixslow958:
  %t3639 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge959
fixmerge959:
  %t3640 = phi i64 [ %t3638, %fixfast957 ], [ %t3639, %fixslow958 ]
  %t3641 = icmp ne i64 %t3640, 1
  br i1 %t3641, label %then960, label %else961
then960:
  %t3642 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3643 = load i64, ptr @"scheme.base:rd-ws?"
  %t3644 = and i64 %t3643, -8
  %t3645 = inttoptr i64 %t3644 to ptr
  %t3646 = load i64, ptr %t3645
  %t3647 = inttoptr i64 %t3646 to ptr
  %t3648 = call fastcc i64%t3647(i64 %t3643, i64 1, i64 %t3642, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3649 = icmp ne i64 %t3648, 1
  br i1 %t3649, label %then962, label %else963
then962:
  %t3650 = or i64 %a2, 8
  %t3651 = and i64 %t3650, 7
  %t3652 = icmp eq i64 %t3651, 0
  br i1 %t3652, label %fixfast964, label %fixslow965
fixfast964:
  %t3653 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3654 = extractvalue {i64, i1} %t3653, 0
  %t3655 = extractvalue {i64, i1} %t3653, 1
  br i1 %t3655, label %fixslow965, label %fixmerge966
fixslow965:
  %t3656 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge966
fixmerge966:
  %t3657 = phi i64 [ %t3654, %fixfast964 ], [ %t3656, %fixslow965 ]
  %t3658 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3659 = and i64 %t3658, -8
  %t3660 = inttoptr i64 %t3659 to ptr
  %t3661 = load i64, ptr %t3660
  %t3662 = inttoptr i64 %t3661 to ptr
  %t3663 = musttail call fastcc i64 %t3662(i64 %t3658, i64 3, i64 %a0, i64 %a1, i64 %t3657, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3663
else963:
  %t3664 = call i64 @rt_char_to_integer(i64 %t3642)
  %t3665 = or i64 %t3664, 472
  %t3666 = and i64 %t3665, 7
  %t3667 = icmp eq i64 %t3666, 0
  br i1 %t3667, label %fixfast967, label %fixslow968
fixfast967:
  %t3668 = icmp eq i64 %t3664, 472
  %t3669 = select i1 %t3668, i64 257, i64 1
  br label %fixmerge969
fixslow968:
  %t3670 = call i64 @rt_num_eq(i64 %t3664, i64 472)
  br label %fixmerge969
fixmerge969:
  %t3671 = phi i64 [ %t3669, %fixfast967 ], [ %t3670, %fixslow968 ]
  %t3672 = icmp ne i64 %t3671, 1
  br i1 %t3672, label %then970, label %else971
then970:
  %t3673 = or i64 %a2, 8
  %t3674 = and i64 %t3673, 7
  %t3675 = icmp eq i64 %t3674, 0
  br i1 %t3675, label %fixfast972, label %fixslow973
fixfast972:
  %t3676 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3677 = extractvalue {i64, i1} %t3676, 0
  %t3678 = extractvalue {i64, i1} %t3676, 1
  br i1 %t3678, label %fixslow973, label %fixmerge974
fixslow973:
  %t3679 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge974
fixmerge974:
  %t3680 = phi i64 [ %t3677, %fixfast972 ], [ %t3679, %fixslow973 ]
  %t3681 = load i64, ptr @"scheme.base:rd-skip-line"
  %t3682 = and i64 %t3681, -8
  %t3683 = inttoptr i64 %t3682 to ptr
  %t3684 = load i64, ptr %t3683
  %t3685 = inttoptr i64 %t3684 to ptr
  %t3686 = call fastcc i64%t3685(i64 %t3681, i64 3, i64 %a0, i64 %a1, i64 %t3680, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3687 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3688 = and i64 %t3687, -8
  %t3689 = inttoptr i64 %t3688 to ptr
  %t3690 = load i64, ptr %t3689
  %t3691 = inttoptr i64 %t3690 to ptr
  %t3692 = musttail call fastcc i64 %t3691(i64 %t3687, i64 3, i64 %a0, i64 %a1, i64 %t3686, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3692
else971:
  ret i64 %a2
else961:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:rd-token-end"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3697 = icmp eq i64 %argc, 3
  br i1 %t3697, label %argok976, label %arityerr975
arityerr975:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok976:
  %t3698 = or i64 %a2, %a1
  %t3699 = and i64 %t3698, 7
  %t3700 = icmp eq i64 %t3699, 0
  br i1 %t3700, label %fixfast977, label %fixslow978
fixfast977:
  %t3701 = icmp slt i64 %a2, %a1
  %t3702 = select i1 %t3701, i64 257, i64 1
  br label %fixmerge979
fixslow978:
  %t3703 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge979
fixmerge979:
  %t3704 = phi i64 [ %t3702, %fixfast977 ], [ %t3703, %fixslow978 ]
  %t3705 = icmp ne i64 %t3704, 1
  br i1 %t3705, label %then980, label %else981
then980:
  %t3706 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3707 = load i64, ptr @"scheme.base:rd-delim?"
  %t3708 = and i64 %t3707, -8
  %t3709 = inttoptr i64 %t3708 to ptr
  %t3710 = load i64, ptr %t3709
  %t3711 = inttoptr i64 %t3710 to ptr
  %t3712 = call fastcc i64%t3711(i64 %t3707, i64 1, i64 %t3706, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3713 = icmp ne i64 %t3712, 1
  br i1 %t3713, label %then982, label %else983
then982:
  ret i64 %a2
else983:
  %t3714 = or i64 %a2, 8
  %t3715 = and i64 %t3714, 7
  %t3716 = icmp eq i64 %t3715, 0
  br i1 %t3716, label %fixfast984, label %fixslow985
fixfast984:
  %t3717 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3718 = extractvalue {i64, i1} %t3717, 0
  %t3719 = extractvalue {i64, i1} %t3717, 1
  br i1 %t3719, label %fixslow985, label %fixmerge986
fixslow985:
  %t3720 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge986
fixmerge986:
  %t3721 = phi i64 [ %t3718, %fixfast984 ], [ %t3720, %fixslow985 ]
  %t3722 = load i64, ptr @"scheme.base:rd-token-end"
  %t3723 = and i64 %t3722, -8
  %t3724 = inttoptr i64 %t3723 to ptr
  %t3725 = load i64, ptr %t3724
  %t3726 = inttoptr i64 %t3725 to ptr
  %t3727 = musttail call fastcc i64 %t3726(i64 %t3722, i64 3, i64 %a0, i64 %a1, i64 %t3721, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3727
else981:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:rd-all-digits?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3732 = icmp eq i64 %argc, 3
  br i1 %t3732, label %argok988, label %arityerr987
arityerr987:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok988:
  %t3733 = or i64 %a1, %a2
  %t3734 = and i64 %t3733, 7
  %t3735 = icmp eq i64 %t3734, 0
  br i1 %t3735, label %fixfast989, label %fixslow990
fixfast989:
  %t3736 = icmp slt i64 %a1, %a2
  %t3737 = select i1 %t3736, i64 257, i64 1
  br label %fixmerge991
fixslow990:
  %t3738 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge991
fixmerge991:
  %t3739 = phi i64 [ %t3737, %fixfast989 ], [ %t3738, %fixslow990 ]
  %t3740 = icmp ne i64 %t3739, 1
  br i1 %t3740, label %then992, label %else993
then992:
  %t3741 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t3742 = load i64, ptr @"scheme.base:rd-digit?"
  %t3743 = and i64 %t3742, -8
  %t3744 = inttoptr i64 %t3743 to ptr
  %t3745 = load i64, ptr %t3744
  %t3746 = inttoptr i64 %t3745 to ptr
  %t3747 = call fastcc i64%t3746(i64 %t3742, i64 1, i64 %t3741, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3748 = icmp ne i64 %t3747, 1
  br i1 %t3748, label %then994, label %else995
then994:
  %t3749 = or i64 %a1, 8
  %t3750 = and i64 %t3749, 7
  %t3751 = icmp eq i64 %t3750, 0
  br i1 %t3751, label %fixfast996, label %fixslow997
fixfast996:
  %t3752 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t3753 = extractvalue {i64, i1} %t3752, 0
  %t3754 = extractvalue {i64, i1} %t3752, 1
  br i1 %t3754, label %fixslow997, label %fixmerge998
fixslow997:
  %t3755 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge998
fixmerge998:
  %t3756 = phi i64 [ %t3753, %fixfast996 ], [ %t3755, %fixslow997 ]
  %t3757 = load i64, ptr @"scheme.base:rd-all-digits?"
  %t3758 = and i64 %t3757, -8
  %t3759 = inttoptr i64 %t3758 to ptr
  %t3760 = load i64, ptr %t3759
  %t3761 = inttoptr i64 %t3760 to ptr
  %t3762 = musttail call fastcc i64 %t3761(i64 %t3757, i64 3, i64 %a0, i64 %t3756, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3762
else995:
  ret i64 1
else993:
  ret i64 257
}

define fastcc i64 @"scheme.base:code:rd-numeric?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3767 = icmp eq i64 %argc, 1
  br i1 %t3767, label %argok1000, label %arityerr999
arityerr999:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1000:
  %t3768 = call i64 @rt_string_length(i64 %a0)
  %t3769 = or i64 0, %t3768
  %t3770 = and i64 %t3769, 7
  %t3771 = icmp eq i64 %t3770, 0
  br i1 %t3771, label %fixfast1001, label %fixslow1002
fixfast1001:
  %t3772 = icmp slt i64 0, %t3768
  %t3773 = select i1 %t3772, i64 257, i64 1
  br label %fixmerge1003
fixslow1002:
  %t3774 = call i64 @rt_lt(i64 0, i64 %t3768)
  br label %fixmerge1003
fixmerge1003:
  %t3775 = phi i64 [ %t3773, %fixfast1001 ], [ %t3774, %fixslow1002 ]
  %t3776 = icmp ne i64 %t3775, 1
  br i1 %t3776, label %then1004, label %else1005
then1004:
  %t3777 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t3778 = call i64 @rt_char_to_integer(i64 %t3777)
  %t3779 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t3780 = load i64, ptr @"scheme.base:rd-digit?"
  %t3781 = and i64 %t3780, -8
  %t3782 = inttoptr i64 %t3781 to ptr
  %t3783 = load i64, ptr %t3782
  %t3784 = inttoptr i64 %t3783 to ptr
  %t3785 = call fastcc i64%t3784(i64 %t3780, i64 1, i64 %t3779, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3786 = icmp ne i64 %t3785, 1
  br i1 %t3786, label %then1006, label %else1007
then1006:
  %t3787 = load i64, ptr @"scheme.base:rd-all-digits?"
  %t3788 = and i64 %t3787, -8
  %t3789 = inttoptr i64 %t3788 to ptr
  %t3790 = load i64, ptr %t3789
  %t3791 = inttoptr i64 %t3790 to ptr
  %t3792 = musttail call fastcc i64 %t3791(i64 %t3787, i64 3, i64 %a0, i64 0, i64 %t3768, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3792
else1007:
  %t3793 = or i64 %t3778, 360
  %t3794 = and i64 %t3793, 7
  %t3795 = icmp eq i64 %t3794, 0
  br i1 %t3795, label %fixfast1008, label %fixslow1009
fixfast1008:
  %t3796 = icmp eq i64 %t3778, 360
  %t3797 = select i1 %t3796, i64 257, i64 1
  br label %fixmerge1010
fixslow1009:
  %t3798 = call i64 @rt_num_eq(i64 %t3778, i64 360)
  br label %fixmerge1010
fixmerge1010:
  %t3799 = phi i64 [ %t3797, %fixfast1008 ], [ %t3798, %fixslow1009 ]
  %t3800 = icmp ne i64 %t3799, 1
  br i1 %t3800, label %then1011, label %else1012
then1011:
  br label %merge1013
else1012:
  %t3801 = or i64 %t3778, 344
  %t3802 = and i64 %t3801, 7
  %t3803 = icmp eq i64 %t3802, 0
  br i1 %t3803, label %fixfast1014, label %fixslow1015
fixfast1014:
  %t3804 = icmp eq i64 %t3778, 344
  %t3805 = select i1 %t3804, i64 257, i64 1
  br label %fixmerge1016
fixslow1015:
  %t3806 = call i64 @rt_num_eq(i64 %t3778, i64 344)
  br label %fixmerge1016
fixmerge1016:
  %t3807 = phi i64 [ %t3805, %fixfast1014 ], [ %t3806, %fixslow1015 ]
  br label %merge1013
merge1013:
  %t3808 = phi i64 [ %t3799, %then1011 ], [ %t3807, %fixmerge1016 ]
  %t3809 = icmp ne i64 %t3808, 1
  br i1 %t3809, label %then1017, label %else1018
then1017:
  %t3810 = or i64 8, %t3768
  %t3811 = and i64 %t3810, 7
  %t3812 = icmp eq i64 %t3811, 0
  br i1 %t3812, label %fixfast1019, label %fixslow1020
fixfast1019:
  %t3813 = icmp slt i64 8, %t3768
  %t3814 = select i1 %t3813, i64 257, i64 1
  br label %fixmerge1021
fixslow1020:
  %t3815 = call i64 @rt_lt(i64 8, i64 %t3768)
  br label %fixmerge1021
fixmerge1021:
  %t3816 = phi i64 [ %t3814, %fixfast1019 ], [ %t3815, %fixslow1020 ]
  %t3817 = icmp ne i64 %t3816, 1
  br i1 %t3817, label %then1022, label %else1023
then1022:
  %t3818 = load i64, ptr @"scheme.base:rd-all-digits?"
  %t3819 = and i64 %t3818, -8
  %t3820 = inttoptr i64 %t3819 to ptr
  %t3821 = load i64, ptr %t3820
  %t3822 = inttoptr i64 %t3821 to ptr
  %t3823 = musttail call fastcc i64 %t3822(i64 %t3818, i64 3, i64 %a0, i64 8, i64 %t3768, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3823
else1023:
  ret i64 1
else1018:
  ret i64 1
else1005:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rd-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3828 = icmp eq i64 %argc, 4
  br i1 %t3828, label %argok1025, label %arityerr1024
arityerr1024:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1025:
  %t3829 = or i64 %a1, %a2
  %t3830 = and i64 %t3829, 7
  %t3831 = icmp eq i64 %t3830, 0
  br i1 %t3831, label %fixfast1026, label %fixslow1027
fixfast1026:
  %t3832 = icmp slt i64 %a1, %a2
  %t3833 = select i1 %t3832, i64 257, i64 1
  br label %fixmerge1028
fixslow1027:
  %t3834 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge1028
fixmerge1028:
  %t3835 = phi i64 [ %t3833, %fixfast1026 ], [ %t3834, %fixslow1027 ]
  %t3836 = icmp ne i64 %t3835, 1
  br i1 %t3836, label %then1029, label %else1030
then1029:
  %t3837 = or i64 %a1, 8
  %t3838 = and i64 %t3837, 7
  %t3839 = icmp eq i64 %t3838, 0
  br i1 %t3839, label %fixfast1031, label %fixslow1032
fixfast1031:
  %t3840 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t3841 = extractvalue {i64, i1} %t3840, 0
  %t3842 = extractvalue {i64, i1} %t3840, 1
  br i1 %t3842, label %fixslow1032, label %fixmerge1033
fixslow1032:
  %t3843 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge1033
fixmerge1033:
  %t3844 = phi i64 [ %t3841, %fixfast1031 ], [ %t3843, %fixslow1032 ]
  %t3845 = or i64 %a3, 80
  %t3846 = and i64 %t3845, 7
  %t3847 = icmp eq i64 %t3846, 0
  br i1 %t3847, label %fixfast1034, label %fixslow1035
fixfast1034:
  %t3848 = ashr i64 %a3, 3
  %t3849 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t3848, i64 80)
  %t3850 = extractvalue {i64, i1} %t3849, 0
  %t3851 = extractvalue {i64, i1} %t3849, 1
  br i1 %t3851, label %fixslow1035, label %fixmerge1036
fixslow1035:
  %t3852 = call i64 @rt_mul(i64 %a3, i64 80)
  br label %fixmerge1036
fixmerge1036:
  %t3853 = phi i64 [ %t3850, %fixfast1034 ], [ %t3852, %fixslow1035 ]
  %t3854 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t3855 = call i64 @rt_char_to_integer(i64 %t3854)
  %t3856 = or i64 %t3855, 384
  %t3857 = and i64 %t3856, 7
  %t3858 = icmp eq i64 %t3857, 0
  br i1 %t3858, label %fixfast1037, label %fixslow1038
fixfast1037:
  %t3859 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3855, i64 384)
  %t3860 = extractvalue {i64, i1} %t3859, 0
  %t3861 = extractvalue {i64, i1} %t3859, 1
  br i1 %t3861, label %fixslow1038, label %fixmerge1039
fixslow1038:
  %t3862 = call i64 @rt_sub(i64 %t3855, i64 384)
  br label %fixmerge1039
fixmerge1039:
  %t3863 = phi i64 [ %t3860, %fixfast1037 ], [ %t3862, %fixslow1038 ]
  %t3864 = or i64 %t3853, %t3863
  %t3865 = and i64 %t3864, 7
  %t3866 = icmp eq i64 %t3865, 0
  br i1 %t3866, label %fixfast1040, label %fixslow1041
fixfast1040:
  %t3867 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3853, i64 %t3863)
  %t3868 = extractvalue {i64, i1} %t3867, 0
  %t3869 = extractvalue {i64, i1} %t3867, 1
  br i1 %t3869, label %fixslow1041, label %fixmerge1042
fixslow1041:
  %t3870 = call i64 @rt_add(i64 %t3853, i64 %t3863)
  br label %fixmerge1042
fixmerge1042:
  %t3871 = phi i64 [ %t3868, %fixfast1040 ], [ %t3870, %fixslow1041 ]
  %t3872 = load i64, ptr @"scheme.base:rd-digits"
  %t3873 = and i64 %t3872, -8
  %t3874 = inttoptr i64 %t3873 to ptr
  %t3875 = load i64, ptr %t3874
  %t3876 = inttoptr i64 %t3875 to ptr
  %t3877 = musttail call fastcc i64 %t3876(i64 %t3872, i64 4, i64 %a0, i64 %t3844, i64 %a2, i64 %t3871, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3877
else1030:
  ret i64 %a3
}

define fastcc i64 @"scheme.base:code:rd-digits-neg"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3882 = icmp eq i64 %argc, 4
  br i1 %t3882, label %argok1044, label %arityerr1043
arityerr1043:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1044:
  %t3883 = or i64 %a1, %a2
  %t3884 = and i64 %t3883, 7
  %t3885 = icmp eq i64 %t3884, 0
  br i1 %t3885, label %fixfast1045, label %fixslow1046
fixfast1045:
  %t3886 = icmp slt i64 %a1, %a2
  %t3887 = select i1 %t3886, i64 257, i64 1
  br label %fixmerge1047
fixslow1046:
  %t3888 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge1047
fixmerge1047:
  %t3889 = phi i64 [ %t3887, %fixfast1045 ], [ %t3888, %fixslow1046 ]
  %t3890 = icmp ne i64 %t3889, 1
  br i1 %t3890, label %then1048, label %else1049
then1048:
  %t3891 = or i64 %a1, 8
  %t3892 = and i64 %t3891, 7
  %t3893 = icmp eq i64 %t3892, 0
  br i1 %t3893, label %fixfast1050, label %fixslow1051
fixfast1050:
  %t3894 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t3895 = extractvalue {i64, i1} %t3894, 0
  %t3896 = extractvalue {i64, i1} %t3894, 1
  br i1 %t3896, label %fixslow1051, label %fixmerge1052
fixslow1051:
  %t3897 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge1052
fixmerge1052:
  %t3898 = phi i64 [ %t3895, %fixfast1050 ], [ %t3897, %fixslow1051 ]
  %t3899 = or i64 %a3, 80
  %t3900 = and i64 %t3899, 7
  %t3901 = icmp eq i64 %t3900, 0
  br i1 %t3901, label %fixfast1053, label %fixslow1054
fixfast1053:
  %t3902 = ashr i64 %a3, 3
  %t3903 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t3902, i64 80)
  %t3904 = extractvalue {i64, i1} %t3903, 0
  %t3905 = extractvalue {i64, i1} %t3903, 1
  br i1 %t3905, label %fixslow1054, label %fixmerge1055
fixslow1054:
  %t3906 = call i64 @rt_mul(i64 %a3, i64 80)
  br label %fixmerge1055
fixmerge1055:
  %t3907 = phi i64 [ %t3904, %fixfast1053 ], [ %t3906, %fixslow1054 ]
  %t3908 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t3909 = call i64 @rt_char_to_integer(i64 %t3908)
  %t3910 = or i64 %t3909, 384
  %t3911 = and i64 %t3910, 7
  %t3912 = icmp eq i64 %t3911, 0
  br i1 %t3912, label %fixfast1056, label %fixslow1057
fixfast1056:
  %t3913 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3909, i64 384)
  %t3914 = extractvalue {i64, i1} %t3913, 0
  %t3915 = extractvalue {i64, i1} %t3913, 1
  br i1 %t3915, label %fixslow1057, label %fixmerge1058
fixslow1057:
  %t3916 = call i64 @rt_sub(i64 %t3909, i64 384)
  br label %fixmerge1058
fixmerge1058:
  %t3917 = phi i64 [ %t3914, %fixfast1056 ], [ %t3916, %fixslow1057 ]
  %t3918 = or i64 %t3907, %t3917
  %t3919 = and i64 %t3918, 7
  %t3920 = icmp eq i64 %t3919, 0
  br i1 %t3920, label %fixfast1059, label %fixslow1060
fixfast1059:
  %t3921 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3907, i64 %t3917)
  %t3922 = extractvalue {i64, i1} %t3921, 0
  %t3923 = extractvalue {i64, i1} %t3921, 1
  br i1 %t3923, label %fixslow1060, label %fixmerge1061
fixslow1060:
  %t3924 = call i64 @rt_sub(i64 %t3907, i64 %t3917)
  br label %fixmerge1061
fixmerge1061:
  %t3925 = phi i64 [ %t3922, %fixfast1059 ], [ %t3924, %fixslow1060 ]
  %t3926 = load i64, ptr @"scheme.base:rd-digits-neg"
  %t3927 = and i64 %t3926, -8
  %t3928 = inttoptr i64 %t3927 to ptr
  %t3929 = load i64, ptr %t3928
  %t3930 = inttoptr i64 %t3929 to ptr
  %t3931 = musttail call fastcc i64 %t3930(i64 %t3926, i64 4, i64 %a0, i64 %t3898, i64 %a2, i64 %t3925, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3931
else1049:
  ret i64 %a3
}

define fastcc i64 @"scheme.base:code:rd-parse-int"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3936 = icmp eq i64 %argc, 1
  br i1 %t3936, label %argok1063, label %arityerr1062
arityerr1062:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1063:
  %t3937 = call i64 @rt_string_length(i64 %a0)
  %t3938 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t3939 = call i64 @rt_char_to_integer(i64 %t3938)
  %t3940 = or i64 %t3939, 360
  %t3941 = and i64 %t3940, 7
  %t3942 = icmp eq i64 %t3941, 0
  br i1 %t3942, label %fixfast1064, label %fixslow1065
fixfast1064:
  %t3943 = icmp eq i64 %t3939, 360
  %t3944 = select i1 %t3943, i64 257, i64 1
  br label %fixmerge1066
fixslow1065:
  %t3945 = call i64 @rt_num_eq(i64 %t3939, i64 360)
  br label %fixmerge1066
fixmerge1066:
  %t3946 = phi i64 [ %t3944, %fixfast1064 ], [ %t3945, %fixslow1065 ]
  %t3947 = icmp ne i64 %t3946, 1
  br i1 %t3947, label %then1067, label %else1068
then1067:
  %t3948 = load i64, ptr @"scheme.base:rd-digits-neg"
  %t3949 = and i64 %t3948, -8
  %t3950 = inttoptr i64 %t3949 to ptr
  %t3951 = load i64, ptr %t3950
  %t3952 = inttoptr i64 %t3951 to ptr
  %t3953 = musttail call fastcc i64 %t3952(i64 %t3948, i64 4, i64 %a0, i64 8, i64 %t3937, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3953
else1068:
  %t3954 = or i64 %t3939, 344
  %t3955 = and i64 %t3954, 7
  %t3956 = icmp eq i64 %t3955, 0
  br i1 %t3956, label %fixfast1069, label %fixslow1070
fixfast1069:
  %t3957 = icmp eq i64 %t3939, 344
  %t3958 = select i1 %t3957, i64 257, i64 1
  br label %fixmerge1071
fixslow1070:
  %t3959 = call i64 @rt_num_eq(i64 %t3939, i64 344)
  br label %fixmerge1071
fixmerge1071:
  %t3960 = phi i64 [ %t3958, %fixfast1069 ], [ %t3959, %fixslow1070 ]
  %t3961 = icmp ne i64 %t3960, 1
  br i1 %t3961, label %then1072, label %else1073
then1072:
  %t3962 = load i64, ptr @"scheme.base:rd-digits"
  %t3963 = and i64 %t3962, -8
  %t3964 = inttoptr i64 %t3963 to ptr
  %t3965 = load i64, ptr %t3964
  %t3966 = inttoptr i64 %t3965 to ptr
  %t3967 = musttail call fastcc i64 %t3966(i64 %t3962, i64 4, i64 %a0, i64 8, i64 %t3937, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3967
else1073:
  %t3968 = load i64, ptr @"scheme.base:rd-digits"
  %t3969 = and i64 %t3968, -8
  %t3970 = inttoptr i64 %t3969 to ptr
  %t3971 = load i64, ptr %t3970
  %t3972 = inttoptr i64 %t3971 to ptr
  %t3973 = musttail call fastcc i64 %t3972(i64 %t3968, i64 4, i64 %a0, i64 0, i64 %t3937, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3973
}

define fastcc i64 @"scheme.base:code:rd-dotchar?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3978 = icmp eq i64 %argc, 1
  br i1 %t3978, label %argok1075, label %arityerr1074
arityerr1074:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1075:
  %t3979 = call i64 @rt_char_to_integer(i64 %a0)
  %t3980 = or i64 %t3979, 368
  %t3981 = and i64 %t3980, 7
  %t3982 = icmp eq i64 %t3981, 0
  br i1 %t3982, label %fixfast1076, label %fixslow1077
fixfast1076:
  %t3983 = icmp eq i64 %t3979, 368
  %t3984 = select i1 %t3983, i64 257, i64 1
  br label %fixmerge1078
fixslow1077:
  %t3985 = call i64 @rt_num_eq(i64 %t3979, i64 368)
  br label %fixmerge1078
fixmerge1078:
  %t3986 = phi i64 [ %t3984, %fixfast1076 ], [ %t3985, %fixslow1077 ]
  ret i64 %t3986
}

define fastcc i64 @"scheme.base:code:rd-exp-char?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3991 = icmp eq i64 %argc, 1
  br i1 %t3991, label %argok1080, label %arityerr1079
arityerr1079:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1080:
  %t3992 = call i64 @rt_char_to_integer(i64 %a0)
  %t3993 = or i64 %t3992, 808
  %t3994 = and i64 %t3993, 7
  %t3995 = icmp eq i64 %t3994, 0
  br i1 %t3995, label %fixfast1081, label %fixslow1082
fixfast1081:
  %t3996 = icmp eq i64 %t3992, 808
  %t3997 = select i1 %t3996, i64 257, i64 1
  br label %fixmerge1083
fixslow1082:
  %t3998 = call i64 @rt_num_eq(i64 %t3992, i64 808)
  br label %fixmerge1083
fixmerge1083:
  %t3999 = phi i64 [ %t3997, %fixfast1081 ], [ %t3998, %fixslow1082 ]
  %t4000 = icmp ne i64 %t3999, 1
  br i1 %t4000, label %then1084, label %else1085
then1084:
  ret i64 %t3999
else1085:
  %t4001 = or i64 %t3992, 552
  %t4002 = and i64 %t4001, 7
  %t4003 = icmp eq i64 %t4002, 0
  br i1 %t4003, label %fixfast1086, label %fixslow1087
fixfast1086:
  %t4004 = icmp eq i64 %t3992, 552
  %t4005 = select i1 %t4004, i64 257, i64 1
  br label %fixmerge1088
fixslow1087:
  %t4006 = call i64 @rt_num_eq(i64 %t3992, i64 552)
  br label %fixmerge1088
fixmerge1088:
  %t4007 = phi i64 [ %t4005, %fixfast1086 ], [ %t4006, %fixslow1087 ]
  ret i64 %t4007
}

define fastcc i64 @"scheme.base:code:rd-sign-char?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4012 = icmp eq i64 %argc, 1
  br i1 %t4012, label %argok1090, label %arityerr1089
arityerr1089:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1090:
  %t4013 = call i64 @rt_char_to_integer(i64 %a0)
  %t4014 = or i64 %t4013, 344
  %t4015 = and i64 %t4014, 7
  %t4016 = icmp eq i64 %t4015, 0
  br i1 %t4016, label %fixfast1091, label %fixslow1092
fixfast1091:
  %t4017 = icmp eq i64 %t4013, 344
  %t4018 = select i1 %t4017, i64 257, i64 1
  br label %fixmerge1093
fixslow1092:
  %t4019 = call i64 @rt_num_eq(i64 %t4013, i64 344)
  br label %fixmerge1093
fixmerge1093:
  %t4020 = phi i64 [ %t4018, %fixfast1091 ], [ %t4019, %fixslow1092 ]
  %t4021 = icmp ne i64 %t4020, 1
  br i1 %t4021, label %then1094, label %else1095
then1094:
  ret i64 %t4020
else1095:
  %t4022 = or i64 %t4013, 360
  %t4023 = and i64 %t4022, 7
  %t4024 = icmp eq i64 %t4023, 0
  br i1 %t4024, label %fixfast1096, label %fixslow1097
fixfast1096:
  %t4025 = icmp eq i64 %t4013, 360
  %t4026 = select i1 %t4025, i64 257, i64 1
  br label %fixmerge1098
fixslow1097:
  %t4027 = call i64 @rt_num_eq(i64 %t4013, i64 360)
  br label %fixmerge1098
fixmerge1098:
  %t4028 = phi i64 [ %t4026, %fixfast1096 ], [ %t4027, %fixslow1097 ]
  ret i64 %t4028
}

define fastcc i64 @"scheme.base:code:rd-scan-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4033 = icmp eq i64 %argc, 3
  br i1 %t4033, label %argok1100, label %arityerr1099
arityerr1099:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1100:
  %t4034 = or i64 %a1, %a2
  %t4035 = and i64 %t4034, 7
  %t4036 = icmp eq i64 %t4035, 0
  br i1 %t4036, label %fixfast1101, label %fixslow1102
fixfast1101:
  %t4037 = icmp slt i64 %a1, %a2
  %t4038 = select i1 %t4037, i64 257, i64 1
  br label %fixmerge1103
fixslow1102:
  %t4039 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge1103
fixmerge1103:
  %t4040 = phi i64 [ %t4038, %fixfast1101 ], [ %t4039, %fixslow1102 ]
  %t4041 = icmp ne i64 %t4040, 1
  br i1 %t4041, label %then1104, label %else1105
then1104:
  %t4042 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t4043 = load i64, ptr @"scheme.base:rd-digit?"
  %t4044 = and i64 %t4043, -8
  %t4045 = inttoptr i64 %t4044 to ptr
  %t4046 = load i64, ptr %t4045
  %t4047 = inttoptr i64 %t4046 to ptr
  %t4048 = call fastcc i64%t4047(i64 %t4043, i64 1, i64 %t4042, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge1106
else1105:
  br label %merge1106
merge1106:
  %t4049 = phi i64 [ %t4048, %then1104 ], [ 1, %else1105 ]
  %t4050 = icmp ne i64 %t4049, 1
  br i1 %t4050, label %then1107, label %else1108
then1107:
  %t4051 = or i64 %a1, 8
  %t4052 = and i64 %t4051, 7
  %t4053 = icmp eq i64 %t4052, 0
  br i1 %t4053, label %fixfast1109, label %fixslow1110
fixfast1109:
  %t4054 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t4055 = extractvalue {i64, i1} %t4054, 0
  %t4056 = extractvalue {i64, i1} %t4054, 1
  br i1 %t4056, label %fixslow1110, label %fixmerge1111
fixslow1110:
  %t4057 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge1111
fixmerge1111:
  %t4058 = phi i64 [ %t4055, %fixfast1109 ], [ %t4057, %fixslow1110 ]
  %t4059 = load i64, ptr @"scheme.base:rd-scan-digits"
  %t4060 = and i64 %t4059, -8
  %t4061 = inttoptr i64 %t4060 to ptr
  %t4062 = load i64, ptr %t4061
  %t4063 = inttoptr i64 %t4062 to ptr
  %t4064 = musttail call fastcc i64 %t4063(i64 %t4059, i64 3, i64 %a0, i64 %t4058, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4064
else1108:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:rd-flonum?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4069 = icmp eq i64 %argc, 1
  br i1 %t4069, label %argok1113, label %arityerr1112
arityerr1112:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1113:
  %t4070 = call i64 @rt_string_length(i64 %a0)
  %t4071 = or i64 0, %t4070
  %t4072 = and i64 %t4071, 7
  %t4073 = icmp eq i64 %t4072, 0
  br i1 %t4073, label %fixfast1114, label %fixslow1115
fixfast1114:
  %t4074 = icmp slt i64 0, %t4070
  %t4075 = select i1 %t4074, i64 257, i64 1
  br label %fixmerge1116
fixslow1115:
  %t4076 = call i64 @rt_lt(i64 0, i64 %t4070)
  br label %fixmerge1116
fixmerge1116:
  %t4077 = phi i64 [ %t4075, %fixfast1114 ], [ %t4076, %fixslow1115 ]
  %t4078 = icmp ne i64 %t4077, 1
  br i1 %t4078, label %then1117, label %else1118
then1117:
  %t4079 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t4080 = load i64, ptr @"scheme.base:rd-sign-char?"
  %t4081 = and i64 %t4080, -8
  %t4082 = inttoptr i64 %t4081 to ptr
  %t4083 = load i64, ptr %t4082
  %t4084 = inttoptr i64 %t4083 to ptr
  %t4085 = call fastcc i64%t4084(i64 %t4080, i64 1, i64 %t4079, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4086 = icmp ne i64 %t4085, 1
  br i1 %t4086, label %then1119, label %else1120
then1119:
  br label %merge1121
else1120:
  br label %merge1121
merge1121:
  %t4087 = phi i64 [ 8, %then1119 ], [ 0, %else1120 ]
  %t4088 = load i64, ptr @"scheme.base:rd-scan-digits"
  %t4089 = and i64 %t4088, -8
  %t4090 = inttoptr i64 %t4089 to ptr
  %t4091 = load i64, ptr %t4090
  %t4092 = inttoptr i64 %t4091 to ptr
  %t4093 = call fastcc i64%t4092(i64 %t4088, i64 3, i64 %a0, i64 %t4087, i64 %t4070, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4094 = or i64 %t4093, %t4070
  %t4095 = and i64 %t4094, 7
  %t4096 = icmp eq i64 %t4095, 0
  br i1 %t4096, label %fixfast1122, label %fixslow1123
fixfast1122:
  %t4097 = icmp slt i64 %t4093, %t4070
  %t4098 = select i1 %t4097, i64 257, i64 1
  br label %fixmerge1124
fixslow1123:
  %t4099 = call i64 @rt_lt(i64 %t4093, i64 %t4070)
  br label %fixmerge1124
fixmerge1124:
  %t4100 = phi i64 [ %t4098, %fixfast1122 ], [ %t4099, %fixslow1123 ]
  %t4101 = icmp ne i64 %t4100, 1
  br i1 %t4101, label %then1125, label %else1126
then1125:
  %t4102 = call i64 @rt_string_ref(i64 %a0, i64 %t4093)
  %t4103 = load i64, ptr @"scheme.base:rd-dotchar?"
  %t4104 = and i64 %t4103, -8
  %t4105 = inttoptr i64 %t4104 to ptr
  %t4106 = load i64, ptr %t4105
  %t4107 = inttoptr i64 %t4106 to ptr
  %t4108 = call fastcc i64%t4107(i64 %t4103, i64 1, i64 %t4102, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge1127
else1126:
  br label %merge1127
merge1127:
  %t4109 = phi i64 [ %t4108, %then1125 ], [ 1, %else1126 ]
  %t4110 = icmp ne i64 %t4109, 1
  br i1 %t4110, label %then1128, label %else1129
then1128:
  %t4111 = or i64 %t4093, 8
  %t4112 = and i64 %t4111, 7
  %t4113 = icmp eq i64 %t4112, 0
  br i1 %t4113, label %fixfast1131, label %fixslow1132
fixfast1131:
  %t4114 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4093, i64 8)
  %t4115 = extractvalue {i64, i1} %t4114, 0
  %t4116 = extractvalue {i64, i1} %t4114, 1
  br i1 %t4116, label %fixslow1132, label %fixmerge1133
fixslow1132:
  %t4117 = call i64 @rt_add(i64 %t4093, i64 8)
  br label %fixmerge1133
fixmerge1133:
  %t4118 = phi i64 [ %t4115, %fixfast1131 ], [ %t4117, %fixslow1132 ]
  br label %merge1130
else1129:
  br label %merge1130
merge1130:
  %t4119 = phi i64 [ %t4118, %fixmerge1133 ], [ %t4093, %else1129 ]
  %t4120 = or i64 %t4093, %t4119
  %t4121 = and i64 %t4120, 7
  %t4122 = icmp eq i64 %t4121, 0
  br i1 %t4122, label %fixfast1134, label %fixslow1135
fixfast1134:
  %t4123 = icmp slt i64 %t4093, %t4119
  %t4124 = select i1 %t4123, i64 257, i64 1
  br label %fixmerge1136
fixslow1135:
  %t4125 = call i64 @rt_lt(i64 %t4093, i64 %t4119)
  br label %fixmerge1136
fixmerge1136:
  %t4126 = phi i64 [ %t4124, %fixfast1134 ], [ %t4125, %fixslow1135 ]
  %t4127 = load i64, ptr @"scheme.base:rd-scan-digits"
  %t4128 = and i64 %t4127, -8
  %t4129 = inttoptr i64 %t4128 to ptr
  %t4130 = load i64, ptr %t4129
  %t4131 = inttoptr i64 %t4130 to ptr
  %t4132 = call fastcc i64%t4131(i64 %t4127, i64 3, i64 %a0, i64 %t4119, i64 %t4070, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4133 = or i64 %t4087, %t4093
  %t4134 = and i64 %t4133, 7
  %t4135 = icmp eq i64 %t4134, 0
  br i1 %t4135, label %fixfast1137, label %fixslow1138
fixfast1137:
  %t4136 = icmp slt i64 %t4087, %t4093
  %t4137 = select i1 %t4136, i64 257, i64 1
  br label %fixmerge1139
fixslow1138:
  %t4138 = call i64 @rt_lt(i64 %t4087, i64 %t4093)
  br label %fixmerge1139
fixmerge1139:
  %t4139 = phi i64 [ %t4137, %fixfast1137 ], [ %t4138, %fixslow1138 ]
  %t4140 = icmp ne i64 %t4139, 1
  br i1 %t4140, label %then1140, label %else1141
then1140:
  br label %merge1142
else1141:
  %t4141 = or i64 %t4119, %t4132
  %t4142 = and i64 %t4141, 7
  %t4143 = icmp eq i64 %t4142, 0
  br i1 %t4143, label %fixfast1143, label %fixslow1144
fixfast1143:
  %t4144 = icmp slt i64 %t4119, %t4132
  %t4145 = select i1 %t4144, i64 257, i64 1
  br label %fixmerge1145
fixslow1144:
  %t4146 = call i64 @rt_lt(i64 %t4119, i64 %t4132)
  br label %fixmerge1145
fixmerge1145:
  %t4147 = phi i64 [ %t4145, %fixfast1143 ], [ %t4146, %fixslow1144 ]
  br label %merge1142
merge1142:
  %t4148 = phi i64 [ %t4139, %then1140 ], [ %t4147, %fixmerge1145 ]
  %t4149 = icmp ne i64 %t4148, 1
  br i1 %t4149, label %then1146, label %else1147
then1146:
  %t4150 = or i64 %t4132, %t4070
  %t4151 = and i64 %t4150, 7
  %t4152 = icmp eq i64 %t4151, 0
  br i1 %t4152, label %fixfast1148, label %fixslow1149
fixfast1148:
  %t4153 = icmp slt i64 %t4132, %t4070
  %t4154 = select i1 %t4153, i64 257, i64 1
  br label %fixmerge1150
fixslow1149:
  %t4155 = call i64 @rt_lt(i64 %t4132, i64 %t4070)
  br label %fixmerge1150
fixmerge1150:
  %t4156 = phi i64 [ %t4154, %fixfast1148 ], [ %t4155, %fixslow1149 ]
  %t4157 = icmp ne i64 %t4156, 1
  br i1 %t4157, label %then1151, label %else1152
then1151:
  %t4158 = call i64 @rt_string_ref(i64 %a0, i64 %t4132)
  %t4159 = load i64, ptr @"scheme.base:rd-exp-char?"
  %t4160 = and i64 %t4159, -8
  %t4161 = inttoptr i64 %t4160 to ptr
  %t4162 = load i64, ptr %t4161
  %t4163 = inttoptr i64 %t4162 to ptr
  %t4164 = call fastcc i64%t4163(i64 %t4159, i64 1, i64 %t4158, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge1153
else1152:
  br label %merge1153
merge1153:
  %t4165 = phi i64 [ %t4164, %then1151 ], [ 1, %else1152 ]
  %t4166 = icmp ne i64 %t4165, 1
  br i1 %t4166, label %then1154, label %else1155
then1154:
  %t4167 = or i64 %t4132, 8
  %t4168 = and i64 %t4167, 7
  %t4169 = icmp eq i64 %t4168, 0
  br i1 %t4169, label %fixfast1157, label %fixslow1158
fixfast1157:
  %t4170 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4132, i64 8)
  %t4171 = extractvalue {i64, i1} %t4170, 0
  %t4172 = extractvalue {i64, i1} %t4170, 1
  br i1 %t4172, label %fixslow1158, label %fixmerge1159
fixslow1158:
  %t4173 = call i64 @rt_add(i64 %t4132, i64 8)
  br label %fixmerge1159
fixmerge1159:
  %t4174 = phi i64 [ %t4171, %fixfast1157 ], [ %t4173, %fixslow1158 ]
  %t4175 = or i64 %t4174, %t4070
  %t4176 = and i64 %t4175, 7
  %t4177 = icmp eq i64 %t4176, 0
  br i1 %t4177, label %fixfast1160, label %fixslow1161
fixfast1160:
  %t4178 = icmp slt i64 %t4174, %t4070
  %t4179 = select i1 %t4178, i64 257, i64 1
  br label %fixmerge1162
fixslow1161:
  %t4180 = call i64 @rt_lt(i64 %t4174, i64 %t4070)
  br label %fixmerge1162
fixmerge1162:
  %t4181 = phi i64 [ %t4179, %fixfast1160 ], [ %t4180, %fixslow1161 ]
  %t4182 = icmp ne i64 %t4181, 1
  br i1 %t4182, label %then1163, label %else1164
then1163:
  %t4183 = or i64 %t4132, 8
  %t4184 = and i64 %t4183, 7
  %t4185 = icmp eq i64 %t4184, 0
  br i1 %t4185, label %fixfast1166, label %fixslow1167
fixfast1166:
  %t4186 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4132, i64 8)
  %t4187 = extractvalue {i64, i1} %t4186, 0
  %t4188 = extractvalue {i64, i1} %t4186, 1
  br i1 %t4188, label %fixslow1167, label %fixmerge1168
fixslow1167:
  %t4189 = call i64 @rt_add(i64 %t4132, i64 8)
  br label %fixmerge1168
fixmerge1168:
  %t4190 = phi i64 [ %t4187, %fixfast1166 ], [ %t4189, %fixslow1167 ]
  %t4191 = call i64 @rt_string_ref(i64 %a0, i64 %t4190)
  %t4192 = load i64, ptr @"scheme.base:rd-sign-char?"
  %t4193 = and i64 %t4192, -8
  %t4194 = inttoptr i64 %t4193 to ptr
  %t4195 = load i64, ptr %t4194
  %t4196 = inttoptr i64 %t4195 to ptr
  %t4197 = call fastcc i64%t4196(i64 %t4192, i64 1, i64 %t4191, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge1165
else1164:
  br label %merge1165
merge1165:
  %t4198 = phi i64 [ %t4197, %fixmerge1168 ], [ 1, %else1164 ]
  %t4199 = icmp ne i64 %t4198, 1
  br i1 %t4199, label %then1169, label %else1170
then1169:
  %t4200 = or i64 %t4132, 16
  %t4201 = and i64 %t4200, 7
  %t4202 = icmp eq i64 %t4201, 0
  br i1 %t4202, label %fixfast1172, label %fixslow1173
fixfast1172:
  %t4203 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4132, i64 16)
  %t4204 = extractvalue {i64, i1} %t4203, 0
  %t4205 = extractvalue {i64, i1} %t4203, 1
  br i1 %t4205, label %fixslow1173, label %fixmerge1174
fixslow1173:
  %t4206 = call i64 @rt_add(i64 %t4132, i64 16)
  br label %fixmerge1174
fixmerge1174:
  %t4207 = phi i64 [ %t4204, %fixfast1172 ], [ %t4206, %fixslow1173 ]
  br label %merge1171
else1170:
  %t4208 = or i64 %t4132, 8
  %t4209 = and i64 %t4208, 7
  %t4210 = icmp eq i64 %t4209, 0
  br i1 %t4210, label %fixfast1175, label %fixslow1176
fixfast1175:
  %t4211 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4132, i64 8)
  %t4212 = extractvalue {i64, i1} %t4211, 0
  %t4213 = extractvalue {i64, i1} %t4211, 1
  br i1 %t4213, label %fixslow1176, label %fixmerge1177
fixslow1176:
  %t4214 = call i64 @rt_add(i64 %t4132, i64 8)
  br label %fixmerge1177
fixmerge1177:
  %t4215 = phi i64 [ %t4212, %fixfast1175 ], [ %t4214, %fixslow1176 ]
  br label %merge1171
merge1171:
  %t4216 = phi i64 [ %t4207, %fixmerge1174 ], [ %t4215, %fixmerge1177 ]
  %t4217 = load i64, ptr @"scheme.base:rd-scan-digits"
  %t4218 = and i64 %t4217, -8
  %t4219 = inttoptr i64 %t4218 to ptr
  %t4220 = load i64, ptr %t4219
  %t4221 = inttoptr i64 %t4220 to ptr
  %t4222 = call fastcc i64%t4221(i64 %t4217, i64 3, i64 %a0, i64 %t4216, i64 %t4070, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4223 = or i64 %t4216, %t4222
  %t4224 = and i64 %t4223, 7
  %t4225 = icmp eq i64 %t4224, 0
  br i1 %t4225, label %fixfast1178, label %fixslow1179
fixfast1178:
  %t4226 = icmp slt i64 %t4216, %t4222
  %t4227 = select i1 %t4226, i64 257, i64 1
  br label %fixmerge1180
fixslow1179:
  %t4228 = call i64 @rt_lt(i64 %t4216, i64 %t4222)
  br label %fixmerge1180
fixmerge1180:
  %t4229 = phi i64 [ %t4227, %fixfast1178 ], [ %t4228, %fixslow1179 ]
  %t4230 = icmp ne i64 %t4229, 1
  br i1 %t4230, label %then1181, label %else1182
then1181:
  br label %merge1183
else1182:
  br label %merge1183
merge1183:
  %t4231 = phi i64 [ %t4222, %then1181 ], [ -8, %else1182 ]
  br label %merge1156
else1155:
  br label %merge1156
merge1156:
  %t4232 = phi i64 [ %t4231, %merge1183 ], [ %t4132, %else1155 ]
  %t4233 = or i64 -8, %t4232
  %t4234 = and i64 %t4233, 7
  %t4235 = icmp eq i64 %t4234, 0
  br i1 %t4235, label %fixfast1184, label %fixslow1185
fixfast1184:
  %t4236 = icmp slt i64 -8, %t4232
  %t4237 = select i1 %t4236, i64 257, i64 1
  br label %fixmerge1186
fixslow1185:
  %t4238 = call i64 @rt_lt(i64 -8, i64 %t4232)
  br label %fixmerge1186
fixmerge1186:
  %t4239 = phi i64 [ %t4237, %fixfast1184 ], [ %t4238, %fixslow1185 ]
  %t4240 = icmp ne i64 %t4239, 1
  br i1 %t4240, label %then1187, label %else1188
then1187:
  %t4241 = or i64 %t4232, %t4070
  %t4242 = and i64 %t4241, 7
  %t4243 = icmp eq i64 %t4242, 0
  br i1 %t4243, label %fixfast1189, label %fixslow1190
fixfast1189:
  %t4244 = icmp eq i64 %t4232, %t4070
  %t4245 = select i1 %t4244, i64 257, i64 1
  br label %fixmerge1191
fixslow1190:
  %t4246 = call i64 @rt_num_eq(i64 %t4232, i64 %t4070)
  br label %fixmerge1191
fixmerge1191:
  %t4247 = phi i64 [ %t4245, %fixfast1189 ], [ %t4246, %fixslow1190 ]
  %t4248 = icmp ne i64 %t4247, 1
  br i1 %t4248, label %then1192, label %else1193
then1192:
  %t4249 = icmp ne i64 %t4126, 1
  br i1 %t4249, label %then1194, label %else1195
then1194:
  ret i64 %t4126
else1195:
  %t4250 = or i64 %t4132, %t4232
  %t4251 = and i64 %t4250, 7
  %t4252 = icmp eq i64 %t4251, 0
  br i1 %t4252, label %fixfast1196, label %fixslow1197
fixfast1196:
  %t4253 = icmp slt i64 %t4132, %t4232
  %t4254 = select i1 %t4253, i64 257, i64 1
  br label %fixmerge1198
fixslow1197:
  %t4255 = call i64 @rt_lt(i64 %t4132, i64 %t4232)
  br label %fixmerge1198
fixmerge1198:
  %t4256 = phi i64 [ %t4254, %fixfast1196 ], [ %t4255, %fixslow1197 ]
  ret i64 %t4256
else1193:
  ret i64 1
else1188:
  ret i64 1
else1147:
  ret i64 1
else1118:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rd-atom"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4261 = icmp eq i64 %argc, 3
  br i1 %t4261, label %argok1200, label %arityerr1199
arityerr1199:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1200:
  %t4262 = load i64, ptr @"scheme.base:rd-token-end"
  %t4263 = and i64 %t4262, -8
  %t4264 = inttoptr i64 %t4263 to ptr
  %t4265 = load i64, ptr %t4264
  %t4266 = inttoptr i64 %t4265 to ptr
  %t4267 = call fastcc i64%t4266(i64 %t4262, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4268 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t4267)
  %t4269 = load i64, ptr @"scheme.base:rd-numeric?"
  %t4270 = and i64 %t4269, -8
  %t4271 = inttoptr i64 %t4270 to ptr
  %t4272 = load i64, ptr %t4271
  %t4273 = inttoptr i64 %t4272 to ptr
  %t4274 = call fastcc i64%t4273(i64 %t4269, i64 1, i64 %t4268, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4275 = icmp ne i64 %t4274, 1
  br i1 %t4275, label %then1201, label %else1202
then1201:
  %t4276 = load i64, ptr @"scheme.base:rd-parse-int"
  %t4277 = and i64 %t4276, -8
  %t4278 = inttoptr i64 %t4277 to ptr
  %t4279 = load i64, ptr %t4278
  %t4280 = inttoptr i64 %t4279 to ptr
  %t4281 = call fastcc i64%t4280(i64 %t4276, i64 1, i64 %t4268, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge1203
else1202:
  %t4282 = load i64, ptr @"scheme.base:rd-flonum?"
  %t4283 = and i64 %t4282, -8
  %t4284 = inttoptr i64 %t4283 to ptr
  %t4285 = load i64, ptr %t4284
  %t4286 = inttoptr i64 %t4285 to ptr
  %t4287 = call fastcc i64%t4286(i64 %t4282, i64 1, i64 %t4268, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4288 = icmp ne i64 %t4287, 1
  br i1 %t4288, label %then1204, label %else1205
then1204:
  %t4289 = call i64 @rt_string_to_flonum(i64 %t4268)
  br label %merge1206
else1205:
  %t4290 = call i64 @rt_string_to_symbol(i64 %t4268)
  br label %merge1206
merge1206:
  %t4291 = phi i64 [ %t4289, %then1204 ], [ %t4290, %else1205 ]
  br label %merge1203
merge1203:
  %t4292 = phi i64 [ %t4281, %then1201 ], [ %t4291, %merge1206 ]
  %t4293 = call i64 @rt_cons(i64 %t4292, i64 %t4267)
  ret i64 %t4293
}

define fastcc i64 @"scheme.base:code:rd-hex-digit"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4298 = icmp eq i64 %argc, 1
  br i1 %t4298, label %argok1208, label %arityerr1207
arityerr1207:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1208:
  %t4299 = call i64 @rt_char_to_integer(i64 %a0)
  %t4300 = or i64 376, %t4299
  %t4301 = and i64 %t4300, 7
  %t4302 = icmp eq i64 %t4301, 0
  br i1 %t4302, label %fixfast1209, label %fixslow1210
fixfast1209:
  %t4303 = icmp slt i64 376, %t4299
  %t4304 = select i1 %t4303, i64 257, i64 1
  br label %fixmerge1211
fixslow1210:
  %t4305 = call i64 @rt_lt(i64 376, i64 %t4299)
  br label %fixmerge1211
fixmerge1211:
  %t4306 = phi i64 [ %t4304, %fixfast1209 ], [ %t4305, %fixslow1210 ]
  %t4307 = icmp ne i64 %t4306, 1
  br i1 %t4307, label %then1212, label %else1213
then1212:
  %t4308 = or i64 %t4299, 464
  %t4309 = and i64 %t4308, 7
  %t4310 = icmp eq i64 %t4309, 0
  br i1 %t4310, label %fixfast1215, label %fixslow1216
fixfast1215:
  %t4311 = icmp slt i64 %t4299, 464
  %t4312 = select i1 %t4311, i64 257, i64 1
  br label %fixmerge1217
fixslow1216:
  %t4313 = call i64 @rt_lt(i64 %t4299, i64 464)
  br label %fixmerge1217
fixmerge1217:
  %t4314 = phi i64 [ %t4312, %fixfast1215 ], [ %t4313, %fixslow1216 ]
  br label %merge1214
else1213:
  br label %merge1214
merge1214:
  %t4315 = phi i64 [ %t4314, %fixmerge1217 ], [ 1, %else1213 ]
  %t4316 = icmp ne i64 %t4315, 1
  br i1 %t4316, label %then1218, label %else1219
then1218:
  %t4317 = or i64 %t4299, 384
  %t4318 = and i64 %t4317, 7
  %t4319 = icmp eq i64 %t4318, 0
  br i1 %t4319, label %fixfast1220, label %fixslow1221
fixfast1220:
  %t4320 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4299, i64 384)
  %t4321 = extractvalue {i64, i1} %t4320, 0
  %t4322 = extractvalue {i64, i1} %t4320, 1
  br i1 %t4322, label %fixslow1221, label %fixmerge1222
fixslow1221:
  %t4323 = call i64 @rt_sub(i64 %t4299, i64 384)
  br label %fixmerge1222
fixmerge1222:
  %t4324 = phi i64 [ %t4321, %fixfast1220 ], [ %t4323, %fixslow1221 ]
  ret i64 %t4324
else1219:
  %t4325 = or i64 768, %t4299
  %t4326 = and i64 %t4325, 7
  %t4327 = icmp eq i64 %t4326, 0
  br i1 %t4327, label %fixfast1223, label %fixslow1224
fixfast1223:
  %t4328 = icmp slt i64 768, %t4299
  %t4329 = select i1 %t4328, i64 257, i64 1
  br label %fixmerge1225
fixslow1224:
  %t4330 = call i64 @rt_lt(i64 768, i64 %t4299)
  br label %fixmerge1225
fixmerge1225:
  %t4331 = phi i64 [ %t4329, %fixfast1223 ], [ %t4330, %fixslow1224 ]
  %t4332 = icmp ne i64 %t4331, 1
  br i1 %t4332, label %then1226, label %else1227
then1226:
  %t4333 = or i64 %t4299, 824
  %t4334 = and i64 %t4333, 7
  %t4335 = icmp eq i64 %t4334, 0
  br i1 %t4335, label %fixfast1229, label %fixslow1230
fixfast1229:
  %t4336 = icmp slt i64 %t4299, 824
  %t4337 = select i1 %t4336, i64 257, i64 1
  br label %fixmerge1231
fixslow1230:
  %t4338 = call i64 @rt_lt(i64 %t4299, i64 824)
  br label %fixmerge1231
fixmerge1231:
  %t4339 = phi i64 [ %t4337, %fixfast1229 ], [ %t4338, %fixslow1230 ]
  br label %merge1228
else1227:
  br label %merge1228
merge1228:
  %t4340 = phi i64 [ %t4339, %fixmerge1231 ], [ 1, %else1227 ]
  %t4341 = icmp ne i64 %t4340, 1
  br i1 %t4341, label %then1232, label %else1233
then1232:
  %t4342 = or i64 %t4299, 696
  %t4343 = and i64 %t4342, 7
  %t4344 = icmp eq i64 %t4343, 0
  br i1 %t4344, label %fixfast1234, label %fixslow1235
fixfast1234:
  %t4345 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4299, i64 696)
  %t4346 = extractvalue {i64, i1} %t4345, 0
  %t4347 = extractvalue {i64, i1} %t4345, 1
  br i1 %t4347, label %fixslow1235, label %fixmerge1236
fixslow1235:
  %t4348 = call i64 @rt_sub(i64 %t4299, i64 696)
  br label %fixmerge1236
fixmerge1236:
  %t4349 = phi i64 [ %t4346, %fixfast1234 ], [ %t4348, %fixslow1235 ]
  ret i64 %t4349
else1233:
  %t4350 = or i64 512, %t4299
  %t4351 = and i64 %t4350, 7
  %t4352 = icmp eq i64 %t4351, 0
  br i1 %t4352, label %fixfast1237, label %fixslow1238
fixfast1237:
  %t4353 = icmp slt i64 512, %t4299
  %t4354 = select i1 %t4353, i64 257, i64 1
  br label %fixmerge1239
fixslow1238:
  %t4355 = call i64 @rt_lt(i64 512, i64 %t4299)
  br label %fixmerge1239
fixmerge1239:
  %t4356 = phi i64 [ %t4354, %fixfast1237 ], [ %t4355, %fixslow1238 ]
  %t4357 = icmp ne i64 %t4356, 1
  br i1 %t4357, label %then1240, label %else1241
then1240:
  %t4358 = or i64 %t4299, 568
  %t4359 = and i64 %t4358, 7
  %t4360 = icmp eq i64 %t4359, 0
  br i1 %t4360, label %fixfast1243, label %fixslow1244
fixfast1243:
  %t4361 = icmp slt i64 %t4299, 568
  %t4362 = select i1 %t4361, i64 257, i64 1
  br label %fixmerge1245
fixslow1244:
  %t4363 = call i64 @rt_lt(i64 %t4299, i64 568)
  br label %fixmerge1245
fixmerge1245:
  %t4364 = phi i64 [ %t4362, %fixfast1243 ], [ %t4363, %fixslow1244 ]
  br label %merge1242
else1241:
  br label %merge1242
merge1242:
  %t4365 = phi i64 [ %t4364, %fixmerge1245 ], [ 1, %else1241 ]
  %t4366 = icmp ne i64 %t4365, 1
  br i1 %t4366, label %then1246, label %else1247
then1246:
  %t4367 = or i64 %t4299, 440
  %t4368 = and i64 %t4367, 7
  %t4369 = icmp eq i64 %t4368, 0
  br i1 %t4369, label %fixfast1248, label %fixslow1249
fixfast1248:
  %t4370 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4299, i64 440)
  %t4371 = extractvalue {i64, i1} %t4370, 0
  %t4372 = extractvalue {i64, i1} %t4370, 1
  br i1 %t4372, label %fixslow1249, label %fixmerge1250
fixslow1249:
  %t4373 = call i64 @rt_sub(i64 %t4299, i64 440)
  br label %fixmerge1250
fixmerge1250:
  %t4374 = phi i64 [ %t4371, %fixfast1248 ], [ %t4373, %fixslow1249 ]
  ret i64 %t4374
else1247:
  ret i64 0
}

define fastcc i64 @"scheme.base:code:rd-hex"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4379 = icmp eq i64 %argc, 4
  br i1 %t4379, label %argok1252, label %arityerr1251
arityerr1251:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1252:
  %t4380 = or i64 %a2, %a1
  %t4381 = and i64 %t4380, 7
  %t4382 = icmp eq i64 %t4381, 0
  br i1 %t4382, label %fixfast1253, label %fixslow1254
fixfast1253:
  %t4383 = icmp slt i64 %a2, %a1
  %t4384 = select i1 %t4383, i64 257, i64 1
  br label %fixmerge1255
fixslow1254:
  %t4385 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge1255
fixmerge1255:
  %t4386 = phi i64 [ %t4384, %fixfast1253 ], [ %t4385, %fixslow1254 ]
  %t4387 = icmp ne i64 %t4386, 1
  br i1 %t4387, label %then1256, label %else1257
then1256:
  %t4388 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t4389 = call i64 @rt_char_to_integer(i64 %t4388)
  %t4390 = or i64 %t4389, 472
  %t4391 = and i64 %t4390, 7
  %t4392 = icmp eq i64 %t4391, 0
  br i1 %t4392, label %fixfast1258, label %fixslow1259
fixfast1258:
  %t4393 = icmp eq i64 %t4389, 472
  %t4394 = select i1 %t4393, i64 257, i64 1
  br label %fixmerge1260
fixslow1259:
  %t4395 = call i64 @rt_num_eq(i64 %t4389, i64 472)
  br label %fixmerge1260
fixmerge1260:
  %t4396 = phi i64 [ %t4394, %fixfast1258 ], [ %t4395, %fixslow1259 ]
  %t4397 = icmp ne i64 %t4396, 1
  br i1 %t4397, label %then1261, label %else1262
then1261:
  %t4398 = or i64 %a2, 8
  %t4399 = and i64 %t4398, 7
  %t4400 = icmp eq i64 %t4399, 0
  br i1 %t4400, label %fixfast1263, label %fixslow1264
fixfast1263:
  %t4401 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4402 = extractvalue {i64, i1} %t4401, 0
  %t4403 = extractvalue {i64, i1} %t4401, 1
  br i1 %t4403, label %fixslow1264, label %fixmerge1265
fixslow1264:
  %t4404 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1265
fixmerge1265:
  %t4405 = phi i64 [ %t4402, %fixfast1263 ], [ %t4404, %fixslow1264 ]
  %t4406 = call i64 @rt_cons(i64 %a3, i64 %t4405)
  ret i64 %t4406
else1262:
  %t4407 = or i64 %a2, 8
  %t4408 = and i64 %t4407, 7
  %t4409 = icmp eq i64 %t4408, 0
  br i1 %t4409, label %fixfast1266, label %fixslow1267
fixfast1266:
  %t4410 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4411 = extractvalue {i64, i1} %t4410, 0
  %t4412 = extractvalue {i64, i1} %t4410, 1
  br i1 %t4412, label %fixslow1267, label %fixmerge1268
fixslow1267:
  %t4413 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1268
fixmerge1268:
  %t4414 = phi i64 [ %t4411, %fixfast1266 ], [ %t4413, %fixslow1267 ]
  %t4415 = or i64 %a3, 128
  %t4416 = and i64 %t4415, 7
  %t4417 = icmp eq i64 %t4416, 0
  br i1 %t4417, label %fixfast1269, label %fixslow1270
fixfast1269:
  %t4418 = ashr i64 %a3, 3
  %t4419 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t4418, i64 128)
  %t4420 = extractvalue {i64, i1} %t4419, 0
  %t4421 = extractvalue {i64, i1} %t4419, 1
  br i1 %t4421, label %fixslow1270, label %fixmerge1271
fixslow1270:
  %t4422 = call i64 @rt_mul(i64 %a3, i64 128)
  br label %fixmerge1271
fixmerge1271:
  %t4423 = phi i64 [ %t4420, %fixfast1269 ], [ %t4422, %fixslow1270 ]
  %t4424 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t4425 = load i64, ptr @"scheme.base:rd-hex-digit"
  %t4426 = and i64 %t4425, -8
  %t4427 = inttoptr i64 %t4426 to ptr
  %t4428 = load i64, ptr %t4427
  %t4429 = inttoptr i64 %t4428 to ptr
  %t4430 = call fastcc i64%t4429(i64 %t4425, i64 1, i64 %t4424, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4431 = or i64 %t4423, %t4430
  %t4432 = and i64 %t4431, 7
  %t4433 = icmp eq i64 %t4432, 0
  br i1 %t4433, label %fixfast1272, label %fixslow1273
fixfast1272:
  %t4434 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4423, i64 %t4430)
  %t4435 = extractvalue {i64, i1} %t4434, 0
  %t4436 = extractvalue {i64, i1} %t4434, 1
  br i1 %t4436, label %fixslow1273, label %fixmerge1274
fixslow1273:
  %t4437 = call i64 @rt_add(i64 %t4423, i64 %t4430)
  br label %fixmerge1274
fixmerge1274:
  %t4438 = phi i64 [ %t4435, %fixfast1272 ], [ %t4437, %fixslow1273 ]
  %t4439 = load i64, ptr @"scheme.base:rd-hex"
  %t4440 = and i64 %t4439, -8
  %t4441 = inttoptr i64 %t4440 to ptr
  %t4442 = load i64, ptr %t4441
  %t4443 = inttoptr i64 %t4442 to ptr
  %t4444 = musttail call fastcc i64 %t4443(i64 %t4439, i64 4, i64 %a0, i64 %a1, i64 %t4414, i64 %t4438, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4444
else1257:
  %t4445 = call i64 @rt_cons(i64 %a3, i64 %a2)
  ret i64 %t4445
}

define fastcc i64 @"scheme.base:code:rd-str-esc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4450 = icmp eq i64 %argc, 1
  br i1 %t4450, label %argok1276, label %arityerr1275
arityerr1275:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1276:
  %t4451 = call i64 @rt_char_to_integer(i64 %a0)
  %t4452 = or i64 %t4451, 880
  %t4453 = and i64 %t4452, 7
  %t4454 = icmp eq i64 %t4453, 0
  br i1 %t4454, label %fixfast1277, label %fixslow1278
fixfast1277:
  %t4455 = icmp eq i64 %t4451, 880
  %t4456 = select i1 %t4455, i64 257, i64 1
  br label %fixmerge1279
fixslow1278:
  %t4457 = call i64 @rt_num_eq(i64 %t4451, i64 880)
  br label %fixmerge1279
fixmerge1279:
  %t4458 = phi i64 [ %t4456, %fixfast1277 ], [ %t4457, %fixslow1278 ]
  %t4459 = icmp ne i64 %t4458, 1
  br i1 %t4459, label %then1280, label %else1281
then1280:
  %t4460 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t4460
else1281:
  %t4461 = or i64 %t4451, 928
  %t4462 = and i64 %t4461, 7
  %t4463 = icmp eq i64 %t4462, 0
  br i1 %t4463, label %fixfast1282, label %fixslow1283
fixfast1282:
  %t4464 = icmp eq i64 %t4451, 928
  %t4465 = select i1 %t4464, i64 257, i64 1
  br label %fixmerge1284
fixslow1283:
  %t4466 = call i64 @rt_num_eq(i64 %t4451, i64 928)
  br label %fixmerge1284
fixmerge1284:
  %t4467 = phi i64 [ %t4465, %fixfast1282 ], [ %t4466, %fixslow1283 ]
  %t4468 = icmp ne i64 %t4467, 1
  br i1 %t4468, label %then1285, label %else1286
then1285:
  %t4469 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t4469
else1286:
  %t4470 = or i64 %t4451, 912
  %t4471 = and i64 %t4470, 7
  %t4472 = icmp eq i64 %t4471, 0
  br i1 %t4472, label %fixfast1287, label %fixslow1288
fixfast1287:
  %t4473 = icmp eq i64 %t4451, 912
  %t4474 = select i1 %t4473, i64 257, i64 1
  br label %fixmerge1289
fixslow1288:
  %t4475 = call i64 @rt_num_eq(i64 %t4451, i64 912)
  br label %fixmerge1289
fixmerge1289:
  %t4476 = phi i64 [ %t4474, %fixfast1287 ], [ %t4475, %fixslow1288 ]
  %t4477 = icmp ne i64 %t4476, 1
  br i1 %t4477, label %then1290, label %else1291
then1290:
  %t4478 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t4478
else1291:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_1087"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4483 = icmp eq i64 %argc, 2
  br i1 %t4483, label %argok1293, label %arityerr1292
arityerr1292:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1293:
  %t4484 = and i64 %self, -8
  %t4485 = inttoptr i64 %t4484 to ptr
  %t4486 = getelementptr i64, ptr %t4485, i64 1
  %t4487 = load i64, ptr %t4486
  %t4488 = or i64 %a0, %t4487
  %t4489 = and i64 %t4488, 7
  %t4490 = icmp eq i64 %t4489, 0
  br i1 %t4490, label %fixfast1294, label %fixslow1295
fixfast1294:
  %t4491 = icmp slt i64 %a0, %t4487
  %t4492 = select i1 %t4491, i64 257, i64 1
  br label %fixmerge1296
fixslow1295:
  %t4493 = call i64 @rt_lt(i64 %a0, i64 %t4487)
  br label %fixmerge1296
fixmerge1296:
  %t4494 = phi i64 [ %t4492, %fixfast1294 ], [ %t4493, %fixslow1295 ]
  %t4495 = icmp ne i64 %t4494, 1
  br i1 %t4495, label %then1297, label %else1298
then1297:
  %t4496 = and i64 %self, -8
  %t4497 = inttoptr i64 %t4496 to ptr
  %t4498 = getelementptr i64, ptr %t4497, i64 2
  %t4499 = load i64, ptr %t4498
  %t4500 = call i64 @rt_string_ref(i64 %t4499, i64 %a0)
  %t4501 = call i64 @rt_char_to_integer(i64 %t4500)
  %t4502 = or i64 %t4501, 272
  %t4503 = and i64 %t4502, 7
  %t4504 = icmp eq i64 %t4503, 0
  br i1 %t4504, label %fixfast1299, label %fixslow1300
fixfast1299:
  %t4505 = icmp eq i64 %t4501, 272
  %t4506 = select i1 %t4505, i64 257, i64 1
  br label %fixmerge1301
fixslow1300:
  %t4507 = call i64 @rt_num_eq(i64 %t4501, i64 272)
  br label %fixmerge1301
fixmerge1301:
  %t4508 = phi i64 [ %t4506, %fixfast1299 ], [ %t4507, %fixslow1300 ]
  %t4509 = icmp ne i64 %t4508, 1
  br i1 %t4509, label %then1302, label %else1303
then1302:
  %t4510 = load i64, ptr @"scheme.base:reverse"
  %t4511 = and i64 %t4510, -8
  %t4512 = inttoptr i64 %t4511 to ptr
  %t4513 = load i64, ptr %t4512
  %t4514 = inttoptr i64 %t4513 to ptr
  %t4515 = call fastcc i64%t4514(i64 %t4510, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4516 = call i64 @rt_list_to_string(i64 %t4515)
  %t4517 = or i64 %a0, 8
  %t4518 = and i64 %t4517, 7
  %t4519 = icmp eq i64 %t4518, 0
  br i1 %t4519, label %fixfast1304, label %fixslow1305
fixfast1304:
  %t4520 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4521 = extractvalue {i64, i1} %t4520, 0
  %t4522 = extractvalue {i64, i1} %t4520, 1
  br i1 %t4522, label %fixslow1305, label %fixmerge1306
fixslow1305:
  %t4523 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1306
fixmerge1306:
  %t4524 = phi i64 [ %t4521, %fixfast1304 ], [ %t4523, %fixslow1305 ]
  %t4525 = call i64 @rt_cons(i64 %t4516, i64 %t4524)
  ret i64 %t4525
else1303:
  %t4526 = or i64 %t4501, 736
  %t4527 = and i64 %t4526, 7
  %t4528 = icmp eq i64 %t4527, 0
  br i1 %t4528, label %fixfast1307, label %fixslow1308
fixfast1307:
  %t4529 = icmp eq i64 %t4501, 736
  %t4530 = select i1 %t4529, i64 257, i64 1
  br label %fixmerge1309
fixslow1308:
  %t4531 = call i64 @rt_num_eq(i64 %t4501, i64 736)
  br label %fixmerge1309
fixmerge1309:
  %t4532 = phi i64 [ %t4530, %fixfast1307 ], [ %t4531, %fixslow1308 ]
  %t4533 = icmp ne i64 %t4532, 1
  br i1 %t4533, label %then1310, label %else1311
then1310:
  %t4534 = and i64 %self, -8
  %t4535 = inttoptr i64 %t4534 to ptr
  %t4536 = getelementptr i64, ptr %t4535, i64 2
  %t4537 = load i64, ptr %t4536
  %t4538 = or i64 %a0, 8
  %t4539 = and i64 %t4538, 7
  %t4540 = icmp eq i64 %t4539, 0
  br i1 %t4540, label %fixfast1312, label %fixslow1313
fixfast1312:
  %t4541 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4542 = extractvalue {i64, i1} %t4541, 0
  %t4543 = extractvalue {i64, i1} %t4541, 1
  br i1 %t4543, label %fixslow1313, label %fixmerge1314
fixslow1313:
  %t4544 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1314
fixmerge1314:
  %t4545 = phi i64 [ %t4542, %fixfast1312 ], [ %t4544, %fixslow1313 ]
  %t4546 = call i64 @rt_string_ref(i64 %t4537, i64 %t4545)
  %t4547 = call i64 @rt_char_to_integer(i64 %t4546)
  %t4548 = or i64 %t4547, 960
  %t4549 = and i64 %t4548, 7
  %t4550 = icmp eq i64 %t4549, 0
  br i1 %t4550, label %fixfast1315, label %fixslow1316
fixfast1315:
  %t4551 = icmp eq i64 %t4547, 960
  %t4552 = select i1 %t4551, i64 257, i64 1
  br label %fixmerge1317
fixslow1316:
  %t4553 = call i64 @rt_num_eq(i64 %t4547, i64 960)
  br label %fixmerge1317
fixmerge1317:
  %t4554 = phi i64 [ %t4552, %fixfast1315 ], [ %t4553, %fixslow1316 ]
  %t4555 = icmp ne i64 %t4554, 1
  br i1 %t4555, label %then1318, label %else1319
then1318:
  %t4556 = and i64 %self, -8
  %t4557 = inttoptr i64 %t4556 to ptr
  %t4558 = getelementptr i64, ptr %t4557, i64 2
  %t4559 = load i64, ptr %t4558
  %t4560 = and i64 %self, -8
  %t4561 = inttoptr i64 %t4560 to ptr
  %t4562 = getelementptr i64, ptr %t4561, i64 1
  %t4563 = load i64, ptr %t4562
  %t4564 = or i64 %a0, 16
  %t4565 = and i64 %t4564, 7
  %t4566 = icmp eq i64 %t4565, 0
  br i1 %t4566, label %fixfast1320, label %fixslow1321
fixfast1320:
  %t4567 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 16)
  %t4568 = extractvalue {i64, i1} %t4567, 0
  %t4569 = extractvalue {i64, i1} %t4567, 1
  br i1 %t4569, label %fixslow1321, label %fixmerge1322
fixslow1321:
  %t4570 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge1322
fixmerge1322:
  %t4571 = phi i64 [ %t4568, %fixfast1320 ], [ %t4570, %fixslow1321 ]
  %t4572 = load i64, ptr @"scheme.base:rd-hex"
  %t4573 = and i64 %t4572, -8
  %t4574 = inttoptr i64 %t4573 to ptr
  %t4575 = load i64, ptr %t4574
  %t4576 = inttoptr i64 %t4575 to ptr
  %t4577 = call fastcc i64%t4576(i64 %t4572, i64 4, i64 %t4559, i64 %t4563, i64 %t4571, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4578 = call i64 @rt_cdr(i64 %t4577)
  %t4579 = call i64 @rt_car(i64 %t4577)
  %t4580 = call i64 @rt_integer_to_char(i64 %t4579)
  %t4581 = call i64 @rt_cons(i64 %t4580, i64 %a1)
  %t4582 = musttail call fastcc i64 @"scheme.base:code_1087"(i64 %self, i64 2, i64 %t4578, i64 %t4581, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4582
else1319:
  %t4583 = or i64 %a0, 16
  %t4584 = and i64 %t4583, 7
  %t4585 = icmp eq i64 %t4584, 0
  br i1 %t4585, label %fixfast1323, label %fixslow1324
fixfast1323:
  %t4586 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 16)
  %t4587 = extractvalue {i64, i1} %t4586, 0
  %t4588 = extractvalue {i64, i1} %t4586, 1
  br i1 %t4588, label %fixslow1324, label %fixmerge1325
fixslow1324:
  %t4589 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge1325
fixmerge1325:
  %t4590 = phi i64 [ %t4587, %fixfast1323 ], [ %t4589, %fixslow1324 ]
  %t4591 = load i64, ptr @"scheme.base:rd-str-esc"
  %t4592 = and i64 %t4591, -8
  %t4593 = inttoptr i64 %t4592 to ptr
  %t4594 = load i64, ptr %t4593
  %t4595 = inttoptr i64 %t4594 to ptr
  %t4596 = call fastcc i64%t4595(i64 %t4591, i64 1, i64 %t4546, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4597 = call i64 @rt_cons(i64 %t4596, i64 %a1)
  %t4598 = musttail call fastcc i64 @"scheme.base:code_1087"(i64 %self, i64 2, i64 %t4590, i64 %t4597, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4598
else1311:
  %t4599 = or i64 %a0, 8
  %t4600 = and i64 %t4599, 7
  %t4601 = icmp eq i64 %t4600, 0
  br i1 %t4601, label %fixfast1326, label %fixslow1327
fixfast1326:
  %t4602 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4603 = extractvalue {i64, i1} %t4602, 0
  %t4604 = extractvalue {i64, i1} %t4602, 1
  br i1 %t4604, label %fixslow1327, label %fixmerge1328
fixslow1327:
  %t4605 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1328
fixmerge1328:
  %t4606 = phi i64 [ %t4603, %fixfast1326 ], [ %t4605, %fixslow1327 ]
  %t4607 = call i64 @rt_cons(i64 %t4500, i64 %a1)
  %t4608 = musttail call fastcc i64 @"scheme.base:code_1087"(i64 %self, i64 2, i64 %t4606, i64 %t4607, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4608
else1298:
  %t4609 = load i64, ptr @"scheme.base:reverse"
  %t4610 = and i64 %t4609, -8
  %t4611 = inttoptr i64 %t4610 to ptr
  %t4612 = load i64, ptr %t4611
  %t4613 = inttoptr i64 %t4612 to ptr
  %t4614 = call fastcc i64%t4613(i64 %t4609, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4615 = call i64 @rt_list_to_string(i64 %t4614)
  %t4616 = call i64 @rt_cons(i64 %t4615, i64 %a0)
  ret i64 %t4616
}

define fastcc i64 @"scheme.base:code:rd-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4617 = icmp eq i64 %argc, 3
  br i1 %t4617, label %argok1330, label %arityerr1329
arityerr1329:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1330:
  %t4618 = call ptr @rt_alloc_words(i64 4)
  %t4619 = ptrtoint ptr %t4618 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1087" to i64), ptr %t4618
  %t4620 = or i64 %t4619, 4
  %t4621 = getelementptr i64, ptr %t4618, i64 1
  store i64 %a1, ptr %t4621
  %t4622 = getelementptr i64, ptr %t4618, i64 2
  store i64 %a0, ptr %t4622
  %t4623 = getelementptr i64, ptr %t4618, i64 3
  store i64 %t4620, ptr %t4623
  %t4624 = musttail call fastcc i64 @"scheme.base:code_1087"(i64 %t4620, i64 2, i64 %a2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4624
}

define fastcc i64 @"scheme.base:code:rd-hash"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4629 = icmp eq i64 %argc, 3
  br i1 %t4629, label %argok1332, label %arityerr1331
arityerr1331:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1332:
  %t4630 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t4631 = call i64 @rt_char_to_integer(i64 %t4630)
  %t4632 = or i64 %t4631, 928
  %t4633 = and i64 %t4632, 7
  %t4634 = icmp eq i64 %t4633, 0
  br i1 %t4634, label %fixfast1333, label %fixslow1334
fixfast1333:
  %t4635 = icmp eq i64 %t4631, 928
  %t4636 = select i1 %t4635, i64 257, i64 1
  br label %fixmerge1335
fixslow1334:
  %t4637 = call i64 @rt_num_eq(i64 %t4631, i64 928)
  br label %fixmerge1335
fixmerge1335:
  %t4638 = phi i64 [ %t4636, %fixfast1333 ], [ %t4637, %fixslow1334 ]
  %t4639 = icmp ne i64 %t4638, 1
  br i1 %t4639, label %then1336, label %else1337
then1336:
  %t4640 = or i64 %a2, 8
  %t4641 = and i64 %t4640, 7
  %t4642 = icmp eq i64 %t4641, 0
  br i1 %t4642, label %fixfast1338, label %fixslow1339
fixfast1338:
  %t4643 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4644 = extractvalue {i64, i1} %t4643, 0
  %t4645 = extractvalue {i64, i1} %t4643, 1
  br i1 %t4645, label %fixslow1339, label %fixmerge1340
fixslow1339:
  %t4646 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1340
fixmerge1340:
  %t4647 = phi i64 [ %t4644, %fixfast1338 ], [ %t4646, %fixslow1339 ]
  %t4648 = call i64 @rt_cons(i64 257, i64 %t4647)
  ret i64 %t4648
else1337:
  %t4649 = or i64 %t4631, 816
  %t4650 = and i64 %t4649, 7
  %t4651 = icmp eq i64 %t4650, 0
  br i1 %t4651, label %fixfast1341, label %fixslow1342
fixfast1341:
  %t4652 = icmp eq i64 %t4631, 816
  %t4653 = select i1 %t4652, i64 257, i64 1
  br label %fixmerge1343
fixslow1342:
  %t4654 = call i64 @rt_num_eq(i64 %t4631, i64 816)
  br label %fixmerge1343
fixmerge1343:
  %t4655 = phi i64 [ %t4653, %fixfast1341 ], [ %t4654, %fixslow1342 ]
  %t4656 = icmp ne i64 %t4655, 1
  br i1 %t4656, label %then1344, label %else1345
then1344:
  %t4657 = or i64 %a2, 8
  %t4658 = and i64 %t4657, 7
  %t4659 = icmp eq i64 %t4658, 0
  br i1 %t4659, label %fixfast1346, label %fixslow1347
fixfast1346:
  %t4660 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4661 = extractvalue {i64, i1} %t4660, 0
  %t4662 = extractvalue {i64, i1} %t4660, 1
  br i1 %t4662, label %fixslow1347, label %fixmerge1348
fixslow1347:
  %t4663 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1348
fixmerge1348:
  %t4664 = phi i64 [ %t4661, %fixfast1346 ], [ %t4663, %fixslow1347 ]
  %t4665 = call i64 @rt_cons(i64 1, i64 %t4664)
  ret i64 %t4665
else1345:
  %t4666 = or i64 %t4631, 736
  %t4667 = and i64 %t4666, 7
  %t4668 = icmp eq i64 %t4667, 0
  br i1 %t4668, label %fixfast1349, label %fixslow1350
fixfast1349:
  %t4669 = icmp eq i64 %t4631, 736
  %t4670 = select i1 %t4669, i64 257, i64 1
  br label %fixmerge1351
fixslow1350:
  %t4671 = call i64 @rt_num_eq(i64 %t4631, i64 736)
  br label %fixmerge1351
fixmerge1351:
  %t4672 = phi i64 [ %t4670, %fixfast1349 ], [ %t4671, %fixslow1350 ]
  %t4673 = icmp ne i64 %t4672, 1
  br i1 %t4673, label %then1352, label %else1353
then1352:
  %t4674 = load i64, ptr @"scheme.base:rd-char"
  %t4675 = and i64 %t4674, -8
  %t4676 = inttoptr i64 %t4675 to ptr
  %t4677 = load i64, ptr %t4676
  %t4678 = inttoptr i64 %t4677 to ptr
  %t4679 = musttail call fastcc i64 %t4678(i64 %t4674, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4679
else1353:
  %t4680 = or i64 %t4631, 320
  %t4681 = and i64 %t4680, 7
  %t4682 = icmp eq i64 %t4681, 0
  br i1 %t4682, label %fixfast1354, label %fixslow1355
fixfast1354:
  %t4683 = icmp eq i64 %t4631, 320
  %t4684 = select i1 %t4683, i64 257, i64 1
  br label %fixmerge1356
fixslow1355:
  %t4685 = call i64 @rt_num_eq(i64 %t4631, i64 320)
  br label %fixmerge1356
fixmerge1356:
  %t4686 = phi i64 [ %t4684, %fixfast1354 ], [ %t4685, %fixslow1355 ]
  %t4687 = icmp ne i64 %t4686, 1
  br i1 %t4687, label %then1357, label %else1358
then1357:
  %t4688 = or i64 %a2, 8
  %t4689 = and i64 %t4688, 7
  %t4690 = icmp eq i64 %t4689, 0
  br i1 %t4690, label %fixfast1359, label %fixslow1360
fixfast1359:
  %t4691 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4692 = extractvalue {i64, i1} %t4691, 0
  %t4693 = extractvalue {i64, i1} %t4691, 1
  br i1 %t4693, label %fixslow1360, label %fixmerge1361
fixslow1360:
  %t4694 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1361
fixmerge1361:
  %t4695 = phi i64 [ %t4692, %fixfast1359 ], [ %t4694, %fixslow1360 ]
  %t4696 = load i64, ptr @"scheme.base:rd-list"
  %t4697 = and i64 %t4696, -8
  %t4698 = inttoptr i64 %t4697 to ptr
  %t4699 = load i64, ptr %t4698
  %t4700 = inttoptr i64 %t4699 to ptr
  %t4701 = call fastcc i64%t4700(i64 %t4696, i64 4, i64 %a0, i64 %a1, i64 %t4695, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4702 = call i64 @rt_car(i64 %t4701)
  %t4703 = load i64, ptr @"scheme.base:list->vector"
  %t4704 = and i64 %t4703, -8
  %t4705 = inttoptr i64 %t4704 to ptr
  %t4706 = load i64, ptr %t4705
  %t4707 = inttoptr i64 %t4706 to ptr
  %t4708 = call fastcc i64%t4707(i64 %t4703, i64 1, i64 %t4702, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4709 = call i64 @rt_cdr(i64 %t4701)
  %t4710 = call i64 @rt_cons(i64 %t4708, i64 %t4709)
  ret i64 %t4710
else1358:
  %t4711 = or i64 %t4631, 936
  %t4712 = and i64 %t4711, 7
  %t4713 = icmp eq i64 %t4712, 0
  br i1 %t4713, label %fixfast1362, label %fixslow1363
fixfast1362:
  %t4714 = icmp eq i64 %t4631, 936
  %t4715 = select i1 %t4714, i64 257, i64 1
  br label %fixmerge1364
fixslow1363:
  %t4716 = call i64 @rt_num_eq(i64 %t4631, i64 936)
  br label %fixmerge1364
fixmerge1364:
  %t4717 = phi i64 [ %t4715, %fixfast1362 ], [ %t4716, %fixslow1363 ]
  %t4718 = icmp ne i64 %t4717, 1
  br i1 %t4718, label %then1365, label %else1366
then1365:
  %t4719 = or i64 %a2, 16
  %t4720 = and i64 %t4719, 7
  %t4721 = icmp eq i64 %t4720, 0
  br i1 %t4721, label %fixfast1368, label %fixslow1369
fixfast1368:
  %t4722 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t4723 = extractvalue {i64, i1} %t4722, 0
  %t4724 = extractvalue {i64, i1} %t4722, 1
  br i1 %t4724, label %fixslow1369, label %fixmerge1370
fixslow1369:
  %t4725 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge1370
fixmerge1370:
  %t4726 = phi i64 [ %t4723, %fixfast1368 ], [ %t4725, %fixslow1369 ]
  %t4727 = or i64 %t4726, %a1
  %t4728 = and i64 %t4727, 7
  %t4729 = icmp eq i64 %t4728, 0
  br i1 %t4729, label %fixfast1371, label %fixslow1372
fixfast1371:
  %t4730 = icmp slt i64 %t4726, %a1
  %t4731 = select i1 %t4730, i64 257, i64 1
  br label %fixmerge1373
fixslow1372:
  %t4732 = call i64 @rt_lt(i64 %t4726, i64 %a1)
  br label %fixmerge1373
fixmerge1373:
  %t4733 = phi i64 [ %t4731, %fixfast1371 ], [ %t4732, %fixslow1372 ]
  %t4734 = icmp ne i64 %t4733, 1
  br i1 %t4734, label %then1374, label %else1375
then1374:
  %t4735 = or i64 %a2, 8
  %t4736 = and i64 %t4735, 7
  %t4737 = icmp eq i64 %t4736, 0
  br i1 %t4737, label %fixfast1377, label %fixslow1378
fixfast1377:
  %t4738 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4739 = extractvalue {i64, i1} %t4738, 0
  %t4740 = extractvalue {i64, i1} %t4738, 1
  br i1 %t4740, label %fixslow1378, label %fixmerge1379
fixslow1378:
  %t4741 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1379
fixmerge1379:
  %t4742 = phi i64 [ %t4739, %fixfast1377 ], [ %t4741, %fixslow1378 ]
  %t4743 = call i64 @rt_string_ref(i64 %a0, i64 %t4742)
  %t4744 = call i64 @rt_char_to_integer(i64 %t4743)
  %t4745 = or i64 %t4744, 448
  %t4746 = and i64 %t4745, 7
  %t4747 = icmp eq i64 %t4746, 0
  br i1 %t4747, label %fixfast1380, label %fixslow1381
fixfast1380:
  %t4748 = icmp eq i64 %t4744, 448
  %t4749 = select i1 %t4748, i64 257, i64 1
  br label %fixmerge1382
fixslow1381:
  %t4750 = call i64 @rt_num_eq(i64 %t4744, i64 448)
  br label %fixmerge1382
fixmerge1382:
  %t4751 = phi i64 [ %t4749, %fixfast1380 ], [ %t4750, %fixslow1381 ]
  %t4752 = icmp ne i64 %t4751, 1
  br i1 %t4752, label %then1383, label %else1384
then1383:
  %t4753 = or i64 %a2, 16
  %t4754 = and i64 %t4753, 7
  %t4755 = icmp eq i64 %t4754, 0
  br i1 %t4755, label %fixfast1386, label %fixslow1387
fixfast1386:
  %t4756 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t4757 = extractvalue {i64, i1} %t4756, 0
  %t4758 = extractvalue {i64, i1} %t4756, 1
  br i1 %t4758, label %fixslow1387, label %fixmerge1388
fixslow1387:
  %t4759 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge1388
fixmerge1388:
  %t4760 = phi i64 [ %t4757, %fixfast1386 ], [ %t4759, %fixslow1387 ]
  %t4761 = call i64 @rt_string_ref(i64 %a0, i64 %t4760)
  %t4762 = call i64 @rt_char_to_integer(i64 %t4761)
  %t4763 = or i64 %t4762, 320
  %t4764 = and i64 %t4763, 7
  %t4765 = icmp eq i64 %t4764, 0
  br i1 %t4765, label %fixfast1389, label %fixslow1390
fixfast1389:
  %t4766 = icmp eq i64 %t4762, 320
  %t4767 = select i1 %t4766, i64 257, i64 1
  br label %fixmerge1391
fixslow1390:
  %t4768 = call i64 @rt_num_eq(i64 %t4762, i64 320)
  br label %fixmerge1391
fixmerge1391:
  %t4769 = phi i64 [ %t4767, %fixfast1389 ], [ %t4768, %fixslow1390 ]
  br label %merge1385
else1384:
  br label %merge1385
merge1385:
  %t4770 = phi i64 [ %t4769, %fixmerge1391 ], [ 1, %else1384 ]
  br label %merge1376
else1375:
  br label %merge1376
merge1376:
  %t4771 = phi i64 [ %t4770, %merge1385 ], [ 1, %else1375 ]
  br label %merge1367
else1366:
  br label %merge1367
merge1367:
  %t4772 = phi i64 [ %t4771, %merge1376 ], [ 1, %else1366 ]
  %t4773 = icmp ne i64 %t4772, 1
  br i1 %t4773, label %then1392, label %else1393
then1392:
  %t4774 = or i64 %a2, 24
  %t4775 = and i64 %t4774, 7
  %t4776 = icmp eq i64 %t4775, 0
  br i1 %t4776, label %fixfast1394, label %fixslow1395
fixfast1394:
  %t4777 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 24)
  %t4778 = extractvalue {i64, i1} %t4777, 0
  %t4779 = extractvalue {i64, i1} %t4777, 1
  br i1 %t4779, label %fixslow1395, label %fixmerge1396
fixslow1395:
  %t4780 = call i64 @rt_add(i64 %a2, i64 24)
  br label %fixmerge1396
fixmerge1396:
  %t4781 = phi i64 [ %t4778, %fixfast1394 ], [ %t4780, %fixslow1395 ]
  %t4782 = load i64, ptr @"scheme.base:rd-list"
  %t4783 = and i64 %t4782, -8
  %t4784 = inttoptr i64 %t4783 to ptr
  %t4785 = load i64, ptr %t4784
  %t4786 = inttoptr i64 %t4785 to ptr
  %t4787 = call fastcc i64%t4786(i64 %t4782, i64 4, i64 %a0, i64 %a1, i64 %t4781, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4788 = call i64 @rt_car(i64 %t4787)
  %t4789 = load i64, ptr @"scheme.base:list->bytevector"
  %t4790 = and i64 %t4789, -8
  %t4791 = inttoptr i64 %t4790 to ptr
  %t4792 = load i64, ptr %t4791
  %t4793 = inttoptr i64 %t4792 to ptr
  %t4794 = call fastcc i64%t4793(i64 %t4789, i64 1, i64 %t4788, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4795 = call i64 @rt_cdr(i64 %t4787)
  %t4796 = call i64 @rt_cons(i64 %t4794, i64 %t4795)
  ret i64 %t4796
else1393:
  %t4797 = load i64, ptr @"scheme.base:rd-token-end"
  %t4798 = and i64 %t4797, -8
  %t4799 = inttoptr i64 %t4798 to ptr
  %t4800 = load i64, ptr %t4799
  %t4801 = inttoptr i64 %t4800 to ptr
  %t4802 = call fastcc i64%t4801(i64 %t4797, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4803 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t4802)
  %t4804 = call i64 @rt_string_to_symbol(i64 %t4803)
  %t4805 = call i64 @rt_cons(i64 %t4804, i64 %t4802)
  ret i64 %t4805
}

define fastcc i64 @"scheme.base:code:rd-char-name"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4810 = icmp eq i64 %argc, 1
  br i1 %t4810, label %argok1398, label %arityerr1397
arityerr1397:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1398:
  %t4811 = call i64 @rt_make_string(ptr @.str.lit.13, i64 5)
  %t4812 = call i64 @rt_string_eq(i64 %a0, i64 %t4811)
  %t4813 = icmp ne i64 %t4812, 1
  br i1 %t4813, label %then1399, label %else1400
then1399:
  %t4814 = call i64 @rt_integer_to_char(i64 256)
  ret i64 %t4814
else1400:
  %t4815 = call i64 @rt_make_string(ptr @.str.lit.14, i64 7)
  %t4816 = call i64 @rt_string_eq(i64 %a0, i64 %t4815)
  %t4817 = icmp ne i64 %t4816, 1
  br i1 %t4817, label %then1401, label %else1402
then1401:
  %t4818 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t4818
else1402:
  %t4819 = call i64 @rt_make_string(ptr @.str.lit.15, i64 3)
  %t4820 = call i64 @rt_string_eq(i64 %a0, i64 %t4819)
  %t4821 = icmp ne i64 %t4820, 1
  br i1 %t4821, label %then1403, label %else1404
then1403:
  %t4822 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t4822
else1404:
  %t4823 = call i64 @rt_make_string(ptr @.str.lit.16, i64 6)
  %t4824 = call i64 @rt_string_eq(i64 %a0, i64 %t4823)
  %t4825 = icmp ne i64 %t4824, 1
  br i1 %t4825, label %then1405, label %else1406
then1405:
  %t4826 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t4826
else1406:
  %t4827 = call i64 @rt_make_string(ptr @.str.lit.17, i64 3)
  %t4828 = call i64 @rt_string_eq(i64 %a0, i64 %t4827)
  %t4829 = icmp ne i64 %t4828, 1
  br i1 %t4829, label %then1407, label %else1408
then1407:
  %t4830 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t4830
else1408:
  %t4831 = call i64 @rt_make_string(ptr @.str.lit.18, i64 4)
  %t4832 = call i64 @rt_string_eq(i64 %a0, i64 %t4831)
  %t4833 = icmp ne i64 %t4832, 1
  br i1 %t4833, label %then1409, label %else1410
then1409:
  %t4834 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t4834
else1410:
  %t4835 = call i64 @rt_make_string(ptr @.str.lit.19, i64 6)
  %t4836 = call i64 @rt_string_eq(i64 %a0, i64 %t4835)
  %t4837 = icmp ne i64 %t4836, 1
  br i1 %t4837, label %then1411, label %else1412
then1411:
  %t4838 = call i64 @rt_integer_to_char(i64 1016)
  ret i64 %t4838
else1412:
  %t4839 = call i64 @rt_make_string(ptr @.str.lit.20, i64 7)
  %t4840 = call i64 @rt_string_eq(i64 %a0, i64 %t4839)
  %t4841 = icmp ne i64 %t4840, 1
  br i1 %t4841, label %then1413, label %else1414
then1413:
  %t4842 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t4842
else1414:
  %t4843 = call i64 @rt_make_string(ptr @.str.lit.21, i64 3)
  %t4844 = call i64 @rt_string_eq(i64 %a0, i64 %t4843)
  %t4845 = icmp ne i64 %t4844, 1
  br i1 %t4845, label %then1415, label %else1416
then1415:
  %t4846 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t4846
else1416:
  %t4847 = call i64 @rt_string_ref(i64 %a0, i64 0)
  ret i64 %t4847
}

define fastcc i64 @"scheme.base:code:rd-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4852 = icmp eq i64 %argc, 3
  br i1 %t4852, label %argok1418, label %arityerr1417
arityerr1417:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1418:
  %t4853 = or i64 %a2, 8
  %t4854 = and i64 %t4853, 7
  %t4855 = icmp eq i64 %t4854, 0
  br i1 %t4855, label %fixfast1419, label %fixslow1420
fixfast1419:
  %t4856 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4857 = extractvalue {i64, i1} %t4856, 0
  %t4858 = extractvalue {i64, i1} %t4856, 1
  br i1 %t4858, label %fixslow1420, label %fixmerge1421
fixslow1420:
  %t4859 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1421
fixmerge1421:
  %t4860 = phi i64 [ %t4857, %fixfast1419 ], [ %t4859, %fixslow1420 ]
  %t4861 = or i64 %t4860, 8
  %t4862 = and i64 %t4861, 7
  %t4863 = icmp eq i64 %t4862, 0
  br i1 %t4863, label %fixfast1422, label %fixslow1423
fixfast1422:
  %t4864 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4860, i64 8)
  %t4865 = extractvalue {i64, i1} %t4864, 0
  %t4866 = extractvalue {i64, i1} %t4864, 1
  br i1 %t4866, label %fixslow1423, label %fixmerge1424
fixslow1423:
  %t4867 = call i64 @rt_add(i64 %t4860, i64 8)
  br label %fixmerge1424
fixmerge1424:
  %t4868 = phi i64 [ %t4865, %fixfast1422 ], [ %t4867, %fixslow1423 ]
  %t4869 = load i64, ptr @"scheme.base:rd-token-end"
  %t4870 = and i64 %t4869, -8
  %t4871 = inttoptr i64 %t4870 to ptr
  %t4872 = load i64, ptr %t4871
  %t4873 = inttoptr i64 %t4872 to ptr
  %t4874 = call fastcc i64%t4873(i64 %t4869, i64 3, i64 %a0, i64 %a1, i64 %t4868, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4875 = call i64 @rt_substring(i64 %a0, i64 %t4860, i64 %t4874)
  %t4876 = call i64 @rt_string_length(i64 %t4875)
  %t4877 = or i64 %t4876, 8
  %t4878 = and i64 %t4877, 7
  %t4879 = icmp eq i64 %t4878, 0
  br i1 %t4879, label %fixfast1425, label %fixslow1426
fixfast1425:
  %t4880 = icmp eq i64 %t4876, 8
  %t4881 = select i1 %t4880, i64 257, i64 1
  br label %fixmerge1427
fixslow1426:
  %t4882 = call i64 @rt_num_eq(i64 %t4876, i64 8)
  br label %fixmerge1427
fixmerge1427:
  %t4883 = phi i64 [ %t4881, %fixfast1425 ], [ %t4882, %fixslow1426 ]
  %t4884 = icmp ne i64 %t4883, 1
  br i1 %t4884, label %then1428, label %else1429
then1428:
  %t4885 = call i64 @rt_string_ref(i64 %a0, i64 %t4860)
  %t4886 = call i64 @rt_cons(i64 %t4885, i64 %t4874)
  ret i64 %t4886
else1429:
  %t4887 = load i64, ptr @"scheme.base:rd-char-name"
  %t4888 = and i64 %t4887, -8
  %t4889 = inttoptr i64 %t4888 to ptr
  %t4890 = load i64, ptr %t4889
  %t4891 = inttoptr i64 %t4890 to ptr
  %t4892 = call fastcc i64%t4891(i64 %t4887, i64 1, i64 %t4875, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4893 = call i64 @rt_cons(i64 %t4892, i64 %t4874)
  ret i64 %t4893
}

define fastcc i64 @"scheme.base:code:rd-quote"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4898 = icmp eq i64 %argc, 3
  br i1 %t4898, label %argok1431, label %arityerr1430
arityerr1430:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1431:
  %t4899 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t4900 = and i64 %t4899, -8
  %t4901 = inttoptr i64 %t4900 to ptr
  %t4902 = load i64, ptr %t4901
  %t4903 = inttoptr i64 %t4902 to ptr
  %t4904 = call fastcc i64%t4903(i64 %t4899, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4905 = load i64, ptr @"scheme.base:rd-datum"
  %t4906 = and i64 %t4905, -8
  %t4907 = inttoptr i64 %t4906 to ptr
  %t4908 = load i64, ptr %t4907
  %t4909 = inttoptr i64 %t4908 to ptr
  %t4910 = call fastcc i64%t4909(i64 %t4905, i64 3, i64 %a0, i64 %a1, i64 %t4904, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4911 = call i64 @rt_intern(ptr @.str.sym.22)
  %t4912 = call i64 @rt_car(i64 %t4910)
  %t4913 = load i64, ptr @"scheme.base:list"
  %t4914 = and i64 %t4913, -8
  %t4915 = inttoptr i64 %t4914 to ptr
  %t4916 = load i64, ptr %t4915
  %t4917 = inttoptr i64 %t4916 to ptr
  %t4918 = call fastcc i64%t4917(i64 %t4913, i64 2, i64 %t4911, i64 %t4912, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4919 = call i64 @rt_cdr(i64 %t4910)
  %t4920 = call i64 @rt_cons(i64 %t4918, i64 %t4919)
  ret i64 %t4920
}

define fastcc i64 @"scheme.base:code:rd-quasi"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4925 = icmp eq i64 %argc, 3
  br i1 %t4925, label %argok1433, label %arityerr1432
arityerr1432:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1433:
  %t4926 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t4927 = and i64 %t4926, -8
  %t4928 = inttoptr i64 %t4927 to ptr
  %t4929 = load i64, ptr %t4928
  %t4930 = inttoptr i64 %t4929 to ptr
  %t4931 = call fastcc i64%t4930(i64 %t4926, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4932 = load i64, ptr @"scheme.base:rd-datum"
  %t4933 = and i64 %t4932, -8
  %t4934 = inttoptr i64 %t4933 to ptr
  %t4935 = load i64, ptr %t4934
  %t4936 = inttoptr i64 %t4935 to ptr
  %t4937 = call fastcc i64%t4936(i64 %t4932, i64 3, i64 %a0, i64 %a1, i64 %t4931, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4938 = call i64 @rt_intern(ptr @.str.sym.23)
  %t4939 = call i64 @rt_car(i64 %t4937)
  %t4940 = load i64, ptr @"scheme.base:list"
  %t4941 = and i64 %t4940, -8
  %t4942 = inttoptr i64 %t4941 to ptr
  %t4943 = load i64, ptr %t4942
  %t4944 = inttoptr i64 %t4943 to ptr
  %t4945 = call fastcc i64%t4944(i64 %t4940, i64 2, i64 %t4938, i64 %t4939, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4946 = call i64 @rt_cdr(i64 %t4937)
  %t4947 = call i64 @rt_cons(i64 %t4945, i64 %t4946)
  ret i64 %t4947
}

define fastcc i64 @"scheme.base:code:rd-unquote"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4952 = icmp eq i64 %argc, 3
  br i1 %t4952, label %argok1435, label %arityerr1434
arityerr1434:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1435:
  %t4953 = or i64 %a2, %a1
  %t4954 = and i64 %t4953, 7
  %t4955 = icmp eq i64 %t4954, 0
  br i1 %t4955, label %fixfast1436, label %fixslow1437
fixfast1436:
  %t4956 = icmp slt i64 %a2, %a1
  %t4957 = select i1 %t4956, i64 257, i64 1
  br label %fixmerge1438
fixslow1437:
  %t4958 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge1438
fixmerge1438:
  %t4959 = phi i64 [ %t4957, %fixfast1436 ], [ %t4958, %fixslow1437 ]
  %t4960 = icmp ne i64 %t4959, 1
  br i1 %t4960, label %then1439, label %else1440
then1439:
  %t4961 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t4962 = call i64 @rt_char_to_integer(i64 %t4961)
  %t4963 = or i64 %t4962, 512
  %t4964 = and i64 %t4963, 7
  %t4965 = icmp eq i64 %t4964, 0
  br i1 %t4965, label %fixfast1442, label %fixslow1443
fixfast1442:
  %t4966 = icmp eq i64 %t4962, 512
  %t4967 = select i1 %t4966, i64 257, i64 1
  br label %fixmerge1444
fixslow1443:
  %t4968 = call i64 @rt_num_eq(i64 %t4962, i64 512)
  br label %fixmerge1444
fixmerge1444:
  %t4969 = phi i64 [ %t4967, %fixfast1442 ], [ %t4968, %fixslow1443 ]
  br label %merge1441
else1440:
  br label %merge1441
merge1441:
  %t4970 = phi i64 [ %t4969, %fixmerge1444 ], [ 1, %else1440 ]
  %t4971 = icmp ne i64 %t4970, 1
  br i1 %t4971, label %then1445, label %else1446
then1445:
  %t4972 = or i64 %a2, 8
  %t4973 = and i64 %t4972, 7
  %t4974 = icmp eq i64 %t4973, 0
  br i1 %t4974, label %fixfast1447, label %fixslow1448
fixfast1447:
  %t4975 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4976 = extractvalue {i64, i1} %t4975, 0
  %t4977 = extractvalue {i64, i1} %t4975, 1
  br i1 %t4977, label %fixslow1448, label %fixmerge1449
fixslow1448:
  %t4978 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1449
fixmerge1449:
  %t4979 = phi i64 [ %t4976, %fixfast1447 ], [ %t4978, %fixslow1448 ]
  %t4980 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t4981 = and i64 %t4980, -8
  %t4982 = inttoptr i64 %t4981 to ptr
  %t4983 = load i64, ptr %t4982
  %t4984 = inttoptr i64 %t4983 to ptr
  %t4985 = call fastcc i64%t4984(i64 %t4980, i64 3, i64 %a0, i64 %a1, i64 %t4979, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4986 = load i64, ptr @"scheme.base:rd-datum"
  %t4987 = and i64 %t4986, -8
  %t4988 = inttoptr i64 %t4987 to ptr
  %t4989 = load i64, ptr %t4988
  %t4990 = inttoptr i64 %t4989 to ptr
  %t4991 = call fastcc i64%t4990(i64 %t4986, i64 3, i64 %a0, i64 %a1, i64 %t4985, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4992 = call i64 @rt_intern(ptr @.str.sym.24)
  %t4993 = call i64 @rt_car(i64 %t4991)
  %t4994 = load i64, ptr @"scheme.base:list"
  %t4995 = and i64 %t4994, -8
  %t4996 = inttoptr i64 %t4995 to ptr
  %t4997 = load i64, ptr %t4996
  %t4998 = inttoptr i64 %t4997 to ptr
  %t4999 = call fastcc i64%t4998(i64 %t4994, i64 2, i64 %t4992, i64 %t4993, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5000 = call i64 @rt_cdr(i64 %t4991)
  %t5001 = call i64 @rt_cons(i64 %t4999, i64 %t5000)
  ret i64 %t5001
else1446:
  %t5002 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t5003 = and i64 %t5002, -8
  %t5004 = inttoptr i64 %t5003 to ptr
  %t5005 = load i64, ptr %t5004
  %t5006 = inttoptr i64 %t5005 to ptr
  %t5007 = call fastcc i64%t5006(i64 %t5002, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5008 = load i64, ptr @"scheme.base:rd-datum"
  %t5009 = and i64 %t5008, -8
  %t5010 = inttoptr i64 %t5009 to ptr
  %t5011 = load i64, ptr %t5010
  %t5012 = inttoptr i64 %t5011 to ptr
  %t5013 = call fastcc i64%t5012(i64 %t5008, i64 3, i64 %a0, i64 %a1, i64 %t5007, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5014 = call i64 @rt_intern(ptr @.str.sym.25)
  %t5015 = call i64 @rt_car(i64 %t5013)
  %t5016 = load i64, ptr @"scheme.base:list"
  %t5017 = and i64 %t5016, -8
  %t5018 = inttoptr i64 %t5017 to ptr
  %t5019 = load i64, ptr %t5018
  %t5020 = inttoptr i64 %t5019 to ptr
  %t5021 = call fastcc i64%t5020(i64 %t5016, i64 2, i64 %t5014, i64 %t5015, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5022 = call i64 @rt_cdr(i64 %t5013)
  %t5023 = call i64 @rt_cons(i64 %t5021, i64 %t5022)
  ret i64 %t5023
}

define fastcc i64 @"scheme.base:code:rd-dot?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5028 = icmp eq i64 %argc, 3
  br i1 %t5028, label %argok1451, label %arityerr1450
arityerr1450:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1451:
  %t5029 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t5030 = call i64 @rt_char_to_integer(i64 %t5029)
  %t5031 = or i64 %t5030, 368
  %t5032 = and i64 %t5031, 7
  %t5033 = icmp eq i64 %t5032, 0
  br i1 %t5033, label %fixfast1452, label %fixslow1453
fixfast1452:
  %t5034 = icmp eq i64 %t5030, 368
  %t5035 = select i1 %t5034, i64 257, i64 1
  br label %fixmerge1454
fixslow1453:
  %t5036 = call i64 @rt_num_eq(i64 %t5030, i64 368)
  br label %fixmerge1454
fixmerge1454:
  %t5037 = phi i64 [ %t5035, %fixfast1452 ], [ %t5036, %fixslow1453 ]
  %t5038 = icmp ne i64 %t5037, 1
  br i1 %t5038, label %then1455, label %else1456
then1455:
  %t5039 = or i64 %a2, 8
  %t5040 = and i64 %t5039, 7
  %t5041 = icmp eq i64 %t5040, 0
  br i1 %t5041, label %fixfast1457, label %fixslow1458
fixfast1457:
  %t5042 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5043 = extractvalue {i64, i1} %t5042, 0
  %t5044 = extractvalue {i64, i1} %t5042, 1
  br i1 %t5044, label %fixslow1458, label %fixmerge1459
fixslow1458:
  %t5045 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1459
fixmerge1459:
  %t5046 = phi i64 [ %t5043, %fixfast1457 ], [ %t5045, %fixslow1458 ]
  %t5047 = load i64, ptr @"scheme.base:rd-token-end"
  %t5048 = and i64 %t5047, -8
  %t5049 = inttoptr i64 %t5048 to ptr
  %t5050 = load i64, ptr %t5049
  %t5051 = inttoptr i64 %t5050 to ptr
  %t5052 = call fastcc i64%t5051(i64 %t5047, i64 3, i64 %a0, i64 %a1, i64 %t5046, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5053 = or i64 %a2, 8
  %t5054 = and i64 %t5053, 7
  %t5055 = icmp eq i64 %t5054, 0
  br i1 %t5055, label %fixfast1460, label %fixslow1461
fixfast1460:
  %t5056 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5057 = extractvalue {i64, i1} %t5056, 0
  %t5058 = extractvalue {i64, i1} %t5056, 1
  br i1 %t5058, label %fixslow1461, label %fixmerge1462
fixslow1461:
  %t5059 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1462
fixmerge1462:
  %t5060 = phi i64 [ %t5057, %fixfast1460 ], [ %t5059, %fixslow1461 ]
  %t5061 = or i64 %t5052, %t5060
  %t5062 = and i64 %t5061, 7
  %t5063 = icmp eq i64 %t5062, 0
  br i1 %t5063, label %fixfast1463, label %fixslow1464
fixfast1463:
  %t5064 = icmp eq i64 %t5052, %t5060
  %t5065 = select i1 %t5064, i64 257, i64 1
  br label %fixmerge1465
fixslow1464:
  %t5066 = call i64 @rt_num_eq(i64 %t5052, i64 %t5060)
  br label %fixmerge1465
fixmerge1465:
  %t5067 = phi i64 [ %t5065, %fixfast1463 ], [ %t5066, %fixslow1464 ]
  ret i64 %t5067
else1456:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rd-append-reverse"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5072 = icmp eq i64 %argc, 2
  br i1 %t5072, label %argok1467, label %arityerr1466
arityerr1466:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1467:
  %t5073 = call i64 @rt_null_p(i64 %a0)
  %t5074 = icmp ne i64 %t5073, 1
  br i1 %t5074, label %then1468, label %else1469
then1468:
  ret i64 %a1
else1469:
  %t5075 = call i64 @rt_cdr(i64 %a0)
  %t5076 = call i64 @rt_car(i64 %a0)
  %t5077 = call i64 @rt_cons(i64 %t5076, i64 %a1)
  %t5078 = load i64, ptr @"scheme.base:rd-append-reverse"
  %t5079 = and i64 %t5078, -8
  %t5080 = inttoptr i64 %t5079 to ptr
  %t5081 = load i64, ptr %t5080
  %t5082 = inttoptr i64 %t5081 to ptr
  %t5083 = musttail call fastcc i64 %t5082(i64 %t5078, i64 2, i64 %t5075, i64 %t5077, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5083
}

define fastcc i64 @"scheme.base:code:rd-list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5088 = icmp eq i64 %argc, 4
  br i1 %t5088, label %argok1471, label %arityerr1470
arityerr1470:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1471:
  %t5089 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t5090 = and i64 %t5089, -8
  %t5091 = inttoptr i64 %t5090 to ptr
  %t5092 = load i64, ptr %t5091
  %t5093 = inttoptr i64 %t5092 to ptr
  %t5094 = call fastcc i64%t5093(i64 %t5089, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5095 = or i64 %t5094, %a1
  %t5096 = and i64 %t5095, 7
  %t5097 = icmp eq i64 %t5096, 0
  br i1 %t5097, label %fixfast1472, label %fixslow1473
fixfast1472:
  %t5098 = icmp slt i64 %t5094, %a1
  %t5099 = select i1 %t5098, i64 257, i64 1
  br label %fixmerge1474
fixslow1473:
  %t5100 = call i64 @rt_lt(i64 %t5094, i64 %a1)
  br label %fixmerge1474
fixmerge1474:
  %t5101 = phi i64 [ %t5099, %fixfast1472 ], [ %t5100, %fixslow1473 ]
  %t5102 = icmp ne i64 %t5101, 1
  br i1 %t5102, label %then1475, label %else1476
then1475:
  %t5103 = call i64 @rt_string_ref(i64 %a0, i64 %t5094)
  %t5104 = call i64 @rt_char_to_integer(i64 %t5103)
  %t5105 = or i64 %t5104, 328
  %t5106 = and i64 %t5105, 7
  %t5107 = icmp eq i64 %t5106, 0
  br i1 %t5107, label %fixfast1477, label %fixslow1478
fixfast1477:
  %t5108 = icmp eq i64 %t5104, 328
  %t5109 = select i1 %t5108, i64 257, i64 1
  br label %fixmerge1479
fixslow1478:
  %t5110 = call i64 @rt_num_eq(i64 %t5104, i64 328)
  br label %fixmerge1479
fixmerge1479:
  %t5111 = phi i64 [ %t5109, %fixfast1477 ], [ %t5110, %fixslow1478 ]
  %t5112 = icmp ne i64 %t5111, 1
  br i1 %t5112, label %then1480, label %else1481
then1480:
  br label %merge1482
else1481:
  %t5113 = or i64 %t5104, 744
  %t5114 = and i64 %t5113, 7
  %t5115 = icmp eq i64 %t5114, 0
  br i1 %t5115, label %fixfast1483, label %fixslow1484
fixfast1483:
  %t5116 = icmp eq i64 %t5104, 744
  %t5117 = select i1 %t5116, i64 257, i64 1
  br label %fixmerge1485
fixslow1484:
  %t5118 = call i64 @rt_num_eq(i64 %t5104, i64 744)
  br label %fixmerge1485
fixmerge1485:
  %t5119 = phi i64 [ %t5117, %fixfast1483 ], [ %t5118, %fixslow1484 ]
  br label %merge1482
merge1482:
  %t5120 = phi i64 [ %t5111, %then1480 ], [ %t5119, %fixmerge1485 ]
  %t5121 = icmp ne i64 %t5120, 1
  br i1 %t5121, label %then1486, label %else1487
then1486:
  %t5122 = load i64, ptr @"scheme.base:reverse"
  %t5123 = and i64 %t5122, -8
  %t5124 = inttoptr i64 %t5123 to ptr
  %t5125 = load i64, ptr %t5124
  %t5126 = inttoptr i64 %t5125 to ptr
  %t5127 = call fastcc i64%t5126(i64 %t5122, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5128 = or i64 %t5094, 8
  %t5129 = and i64 %t5128, 7
  %t5130 = icmp eq i64 %t5129, 0
  br i1 %t5130, label %fixfast1488, label %fixslow1489
fixfast1488:
  %t5131 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5094, i64 8)
  %t5132 = extractvalue {i64, i1} %t5131, 0
  %t5133 = extractvalue {i64, i1} %t5131, 1
  br i1 %t5133, label %fixslow1489, label %fixmerge1490
fixslow1489:
  %t5134 = call i64 @rt_add(i64 %t5094, i64 8)
  br label %fixmerge1490
fixmerge1490:
  %t5135 = phi i64 [ %t5132, %fixfast1488 ], [ %t5134, %fixslow1489 ]
  %t5136 = call i64 @rt_cons(i64 %t5127, i64 %t5135)
  ret i64 %t5136
else1487:
  %t5137 = load i64, ptr @"scheme.base:rd-dot?"
  %t5138 = and i64 %t5137, -8
  %t5139 = inttoptr i64 %t5138 to ptr
  %t5140 = load i64, ptr %t5139
  %t5141 = inttoptr i64 %t5140 to ptr
  %t5142 = call fastcc i64%t5141(i64 %t5137, i64 3, i64 %a0, i64 %a1, i64 %t5094, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5143 = icmp ne i64 %t5142, 1
  br i1 %t5143, label %then1491, label %else1492
then1491:
  %t5144 = or i64 %t5094, 8
  %t5145 = and i64 %t5144, 7
  %t5146 = icmp eq i64 %t5145, 0
  br i1 %t5146, label %fixfast1493, label %fixslow1494
fixfast1493:
  %t5147 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5094, i64 8)
  %t5148 = extractvalue {i64, i1} %t5147, 0
  %t5149 = extractvalue {i64, i1} %t5147, 1
  br i1 %t5149, label %fixslow1494, label %fixmerge1495
fixslow1494:
  %t5150 = call i64 @rt_add(i64 %t5094, i64 8)
  br label %fixmerge1495
fixmerge1495:
  %t5151 = phi i64 [ %t5148, %fixfast1493 ], [ %t5150, %fixslow1494 ]
  %t5152 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t5153 = and i64 %t5152, -8
  %t5154 = inttoptr i64 %t5153 to ptr
  %t5155 = load i64, ptr %t5154
  %t5156 = inttoptr i64 %t5155 to ptr
  %t5157 = call fastcc i64%t5156(i64 %t5152, i64 3, i64 %a0, i64 %a1, i64 %t5151, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5158 = load i64, ptr @"scheme.base:rd-datum"
  %t5159 = and i64 %t5158, -8
  %t5160 = inttoptr i64 %t5159 to ptr
  %t5161 = load i64, ptr %t5160
  %t5162 = inttoptr i64 %t5161 to ptr
  %t5163 = call fastcc i64%t5162(i64 %t5158, i64 3, i64 %a0, i64 %a1, i64 %t5157, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5164 = call i64 @rt_cdr(i64 %t5163)
  %t5165 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t5166 = and i64 %t5165, -8
  %t5167 = inttoptr i64 %t5166 to ptr
  %t5168 = load i64, ptr %t5167
  %t5169 = inttoptr i64 %t5168 to ptr
  %t5170 = call fastcc i64%t5169(i64 %t5165, i64 3, i64 %a0, i64 %a1, i64 %t5164, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5171 = call i64 @rt_car(i64 %t5163)
  %t5172 = load i64, ptr @"scheme.base:rd-append-reverse"
  %t5173 = and i64 %t5172, -8
  %t5174 = inttoptr i64 %t5173 to ptr
  %t5175 = load i64, ptr %t5174
  %t5176 = inttoptr i64 %t5175 to ptr
  %t5177 = call fastcc i64%t5176(i64 %t5172, i64 2, i64 %a3, i64 %t5171, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5178 = or i64 %t5170, 8
  %t5179 = and i64 %t5178, 7
  %t5180 = icmp eq i64 %t5179, 0
  br i1 %t5180, label %fixfast1496, label %fixslow1497
fixfast1496:
  %t5181 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5170, i64 8)
  %t5182 = extractvalue {i64, i1} %t5181, 0
  %t5183 = extractvalue {i64, i1} %t5181, 1
  br i1 %t5183, label %fixslow1497, label %fixmerge1498
fixslow1497:
  %t5184 = call i64 @rt_add(i64 %t5170, i64 8)
  br label %fixmerge1498
fixmerge1498:
  %t5185 = phi i64 [ %t5182, %fixfast1496 ], [ %t5184, %fixslow1497 ]
  %t5186 = call i64 @rt_cons(i64 %t5177, i64 %t5185)
  ret i64 %t5186
else1492:
  %t5187 = load i64, ptr @"scheme.base:rd-datum"
  %t5188 = and i64 %t5187, -8
  %t5189 = inttoptr i64 %t5188 to ptr
  %t5190 = load i64, ptr %t5189
  %t5191 = inttoptr i64 %t5190 to ptr
  %t5192 = call fastcc i64%t5191(i64 %t5187, i64 3, i64 %a0, i64 %a1, i64 %t5094, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5193 = call i64 @rt_cdr(i64 %t5192)
  %t5194 = call i64 @rt_car(i64 %t5192)
  %t5195 = call i64 @rt_cons(i64 %t5194, i64 %a3)
  %t5196 = load i64, ptr @"scheme.base:rd-list"
  %t5197 = and i64 %t5196, -8
  %t5198 = inttoptr i64 %t5197 to ptr
  %t5199 = load i64, ptr %t5198
  %t5200 = inttoptr i64 %t5199 to ptr
  %t5201 = musttail call fastcc i64 %t5200(i64 %t5196, i64 4, i64 %a0, i64 %a1, i64 %t5193, i64 %t5195, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5201
else1476:
  %t5202 = load i64, ptr @"scheme.base:reverse"
  %t5203 = and i64 %t5202, -8
  %t5204 = inttoptr i64 %t5203 to ptr
  %t5205 = load i64, ptr %t5204
  %t5206 = inttoptr i64 %t5205 to ptr
  %t5207 = call fastcc i64%t5206(i64 %t5202, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5208 = call i64 @rt_cons(i64 %t5207, i64 %t5094)
  ret i64 %t5208
}

define fastcc i64 @"scheme.base:code:rd-datum"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5213 = icmp eq i64 %argc, 3
  br i1 %t5213, label %argok1500, label %arityerr1499
arityerr1499:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1500:
  %t5214 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t5215 = call i64 @rt_char_to_integer(i64 %t5214)
  %t5216 = or i64 %t5215, 320
  %t5217 = and i64 %t5216, 7
  %t5218 = icmp eq i64 %t5217, 0
  br i1 %t5218, label %fixfast1501, label %fixslow1502
fixfast1501:
  %t5219 = icmp eq i64 %t5215, 320
  %t5220 = select i1 %t5219, i64 257, i64 1
  br label %fixmerge1503
fixslow1502:
  %t5221 = call i64 @rt_num_eq(i64 %t5215, i64 320)
  br label %fixmerge1503
fixmerge1503:
  %t5222 = phi i64 [ %t5220, %fixfast1501 ], [ %t5221, %fixslow1502 ]
  %t5223 = icmp ne i64 %t5222, 1
  br i1 %t5223, label %then1504, label %else1505
then1504:
  %t5224 = or i64 %a2, 8
  %t5225 = and i64 %t5224, 7
  %t5226 = icmp eq i64 %t5225, 0
  br i1 %t5226, label %fixfast1506, label %fixslow1507
fixfast1506:
  %t5227 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5228 = extractvalue {i64, i1} %t5227, 0
  %t5229 = extractvalue {i64, i1} %t5227, 1
  br i1 %t5229, label %fixslow1507, label %fixmerge1508
fixslow1507:
  %t5230 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1508
fixmerge1508:
  %t5231 = phi i64 [ %t5228, %fixfast1506 ], [ %t5230, %fixslow1507 ]
  %t5232 = load i64, ptr @"scheme.base:rd-list"
  %t5233 = and i64 %t5232, -8
  %t5234 = inttoptr i64 %t5233 to ptr
  %t5235 = load i64, ptr %t5234
  %t5236 = inttoptr i64 %t5235 to ptr
  %t5237 = musttail call fastcc i64 %t5236(i64 %t5232, i64 4, i64 %a0, i64 %a1, i64 %t5231, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5237
else1505:
  %t5238 = or i64 %t5215, 728
  %t5239 = and i64 %t5238, 7
  %t5240 = icmp eq i64 %t5239, 0
  br i1 %t5240, label %fixfast1509, label %fixslow1510
fixfast1509:
  %t5241 = icmp eq i64 %t5215, 728
  %t5242 = select i1 %t5241, i64 257, i64 1
  br label %fixmerge1511
fixslow1510:
  %t5243 = call i64 @rt_num_eq(i64 %t5215, i64 728)
  br label %fixmerge1511
fixmerge1511:
  %t5244 = phi i64 [ %t5242, %fixfast1509 ], [ %t5243, %fixslow1510 ]
  %t5245 = icmp ne i64 %t5244, 1
  br i1 %t5245, label %then1512, label %else1513
then1512:
  %t5246 = or i64 %a2, 8
  %t5247 = and i64 %t5246, 7
  %t5248 = icmp eq i64 %t5247, 0
  br i1 %t5248, label %fixfast1514, label %fixslow1515
fixfast1514:
  %t5249 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5250 = extractvalue {i64, i1} %t5249, 0
  %t5251 = extractvalue {i64, i1} %t5249, 1
  br i1 %t5251, label %fixslow1515, label %fixmerge1516
fixslow1515:
  %t5252 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1516
fixmerge1516:
  %t5253 = phi i64 [ %t5250, %fixfast1514 ], [ %t5252, %fixslow1515 ]
  %t5254 = load i64, ptr @"scheme.base:rd-list"
  %t5255 = and i64 %t5254, -8
  %t5256 = inttoptr i64 %t5255 to ptr
  %t5257 = load i64, ptr %t5256
  %t5258 = inttoptr i64 %t5257 to ptr
  %t5259 = musttail call fastcc i64 %t5258(i64 %t5254, i64 4, i64 %a0, i64 %a1, i64 %t5253, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5259
else1513:
  %t5260 = or i64 %t5215, 312
  %t5261 = and i64 %t5260, 7
  %t5262 = icmp eq i64 %t5261, 0
  br i1 %t5262, label %fixfast1517, label %fixslow1518
fixfast1517:
  %t5263 = icmp eq i64 %t5215, 312
  %t5264 = select i1 %t5263, i64 257, i64 1
  br label %fixmerge1519
fixslow1518:
  %t5265 = call i64 @rt_num_eq(i64 %t5215, i64 312)
  br label %fixmerge1519
fixmerge1519:
  %t5266 = phi i64 [ %t5264, %fixfast1517 ], [ %t5265, %fixslow1518 ]
  %t5267 = icmp ne i64 %t5266, 1
  br i1 %t5267, label %then1520, label %else1521
then1520:
  %t5268 = or i64 %a2, 8
  %t5269 = and i64 %t5268, 7
  %t5270 = icmp eq i64 %t5269, 0
  br i1 %t5270, label %fixfast1522, label %fixslow1523
fixfast1522:
  %t5271 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5272 = extractvalue {i64, i1} %t5271, 0
  %t5273 = extractvalue {i64, i1} %t5271, 1
  br i1 %t5273, label %fixslow1523, label %fixmerge1524
fixslow1523:
  %t5274 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1524
fixmerge1524:
  %t5275 = phi i64 [ %t5272, %fixfast1522 ], [ %t5274, %fixslow1523 ]
  %t5276 = load i64, ptr @"scheme.base:rd-quote"
  %t5277 = and i64 %t5276, -8
  %t5278 = inttoptr i64 %t5277 to ptr
  %t5279 = load i64, ptr %t5278
  %t5280 = inttoptr i64 %t5279 to ptr
  %t5281 = musttail call fastcc i64 %t5280(i64 %t5276, i64 3, i64 %a0, i64 %a1, i64 %t5275, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5281
else1521:
  %t5282 = or i64 %t5215, 768
  %t5283 = and i64 %t5282, 7
  %t5284 = icmp eq i64 %t5283, 0
  br i1 %t5284, label %fixfast1525, label %fixslow1526
fixfast1525:
  %t5285 = icmp eq i64 %t5215, 768
  %t5286 = select i1 %t5285, i64 257, i64 1
  br label %fixmerge1527
fixslow1526:
  %t5287 = call i64 @rt_num_eq(i64 %t5215, i64 768)
  br label %fixmerge1527
fixmerge1527:
  %t5288 = phi i64 [ %t5286, %fixfast1525 ], [ %t5287, %fixslow1526 ]
  %t5289 = icmp ne i64 %t5288, 1
  br i1 %t5289, label %then1528, label %else1529
then1528:
  %t5290 = or i64 %a2, 8
  %t5291 = and i64 %t5290, 7
  %t5292 = icmp eq i64 %t5291, 0
  br i1 %t5292, label %fixfast1530, label %fixslow1531
fixfast1530:
  %t5293 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5294 = extractvalue {i64, i1} %t5293, 0
  %t5295 = extractvalue {i64, i1} %t5293, 1
  br i1 %t5295, label %fixslow1531, label %fixmerge1532
fixslow1531:
  %t5296 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1532
fixmerge1532:
  %t5297 = phi i64 [ %t5294, %fixfast1530 ], [ %t5296, %fixslow1531 ]
  %t5298 = load i64, ptr @"scheme.base:rd-quasi"
  %t5299 = and i64 %t5298, -8
  %t5300 = inttoptr i64 %t5299 to ptr
  %t5301 = load i64, ptr %t5300
  %t5302 = inttoptr i64 %t5301 to ptr
  %t5303 = musttail call fastcc i64 %t5302(i64 %t5298, i64 3, i64 %a0, i64 %a1, i64 %t5297, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5303
else1529:
  %t5304 = or i64 %t5215, 352
  %t5305 = and i64 %t5304, 7
  %t5306 = icmp eq i64 %t5305, 0
  br i1 %t5306, label %fixfast1533, label %fixslow1534
fixfast1533:
  %t5307 = icmp eq i64 %t5215, 352
  %t5308 = select i1 %t5307, i64 257, i64 1
  br label %fixmerge1535
fixslow1534:
  %t5309 = call i64 @rt_num_eq(i64 %t5215, i64 352)
  br label %fixmerge1535
fixmerge1535:
  %t5310 = phi i64 [ %t5308, %fixfast1533 ], [ %t5309, %fixslow1534 ]
  %t5311 = icmp ne i64 %t5310, 1
  br i1 %t5311, label %then1536, label %else1537
then1536:
  %t5312 = or i64 %a2, 8
  %t5313 = and i64 %t5312, 7
  %t5314 = icmp eq i64 %t5313, 0
  br i1 %t5314, label %fixfast1538, label %fixslow1539
fixfast1538:
  %t5315 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5316 = extractvalue {i64, i1} %t5315, 0
  %t5317 = extractvalue {i64, i1} %t5315, 1
  br i1 %t5317, label %fixslow1539, label %fixmerge1540
fixslow1539:
  %t5318 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1540
fixmerge1540:
  %t5319 = phi i64 [ %t5316, %fixfast1538 ], [ %t5318, %fixslow1539 ]
  %t5320 = load i64, ptr @"scheme.base:rd-unquote"
  %t5321 = and i64 %t5320, -8
  %t5322 = inttoptr i64 %t5321 to ptr
  %t5323 = load i64, ptr %t5322
  %t5324 = inttoptr i64 %t5323 to ptr
  %t5325 = musttail call fastcc i64 %t5324(i64 %t5320, i64 3, i64 %a0, i64 %a1, i64 %t5319, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5325
else1537:
  %t5326 = or i64 %t5215, 272
  %t5327 = and i64 %t5326, 7
  %t5328 = icmp eq i64 %t5327, 0
  br i1 %t5328, label %fixfast1541, label %fixslow1542
fixfast1541:
  %t5329 = icmp eq i64 %t5215, 272
  %t5330 = select i1 %t5329, i64 257, i64 1
  br label %fixmerge1543
fixslow1542:
  %t5331 = call i64 @rt_num_eq(i64 %t5215, i64 272)
  br label %fixmerge1543
fixmerge1543:
  %t5332 = phi i64 [ %t5330, %fixfast1541 ], [ %t5331, %fixslow1542 ]
  %t5333 = icmp ne i64 %t5332, 1
  br i1 %t5333, label %then1544, label %else1545
then1544:
  %t5334 = or i64 %a2, 8
  %t5335 = and i64 %t5334, 7
  %t5336 = icmp eq i64 %t5335, 0
  br i1 %t5336, label %fixfast1546, label %fixslow1547
fixfast1546:
  %t5337 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5338 = extractvalue {i64, i1} %t5337, 0
  %t5339 = extractvalue {i64, i1} %t5337, 1
  br i1 %t5339, label %fixslow1547, label %fixmerge1548
fixslow1547:
  %t5340 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1548
fixmerge1548:
  %t5341 = phi i64 [ %t5338, %fixfast1546 ], [ %t5340, %fixslow1547 ]
  %t5342 = load i64, ptr @"scheme.base:rd-string"
  %t5343 = and i64 %t5342, -8
  %t5344 = inttoptr i64 %t5343 to ptr
  %t5345 = load i64, ptr %t5344
  %t5346 = inttoptr i64 %t5345 to ptr
  %t5347 = musttail call fastcc i64 %t5346(i64 %t5342, i64 3, i64 %a0, i64 %a1, i64 %t5341, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5347
else1545:
  %t5348 = or i64 %t5215, 280
  %t5349 = and i64 %t5348, 7
  %t5350 = icmp eq i64 %t5349, 0
  br i1 %t5350, label %fixfast1549, label %fixslow1550
fixfast1549:
  %t5351 = icmp eq i64 %t5215, 280
  %t5352 = select i1 %t5351, i64 257, i64 1
  br label %fixmerge1551
fixslow1550:
  %t5353 = call i64 @rt_num_eq(i64 %t5215, i64 280)
  br label %fixmerge1551
fixmerge1551:
  %t5354 = phi i64 [ %t5352, %fixfast1549 ], [ %t5353, %fixslow1550 ]
  %t5355 = icmp ne i64 %t5354, 1
  br i1 %t5355, label %then1552, label %else1553
then1552:
  %t5356 = or i64 %a2, 8
  %t5357 = and i64 %t5356, 7
  %t5358 = icmp eq i64 %t5357, 0
  br i1 %t5358, label %fixfast1554, label %fixslow1555
fixfast1554:
  %t5359 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5360 = extractvalue {i64, i1} %t5359, 0
  %t5361 = extractvalue {i64, i1} %t5359, 1
  br i1 %t5361, label %fixslow1555, label %fixmerge1556
fixslow1555:
  %t5362 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1556
fixmerge1556:
  %t5363 = phi i64 [ %t5360, %fixfast1554 ], [ %t5362, %fixslow1555 ]
  %t5364 = load i64, ptr @"scheme.base:rd-hash"
  %t5365 = and i64 %t5364, -8
  %t5366 = inttoptr i64 %t5365 to ptr
  %t5367 = load i64, ptr %t5366
  %t5368 = inttoptr i64 %t5367 to ptr
  %t5369 = musttail call fastcc i64 %t5368(i64 %t5364, i64 3, i64 %a0, i64 %a1, i64 %t5363, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5369
else1553:
  %t5370 = load i64, ptr @"scheme.base:rd-atom"
  %t5371 = and i64 %t5370, -8
  %t5372 = inttoptr i64 %t5371 to ptr
  %t5373 = load i64, ptr %t5372
  %t5374 = inttoptr i64 %t5373 to ptr
  %t5375 = musttail call fastcc i64 %t5374(i64 %t5370, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5375
}

define fastcc i64 @"scheme.base:code:read-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5380 = icmp eq i64 %argc, 1
  br i1 %t5380, label %argok1558, label %arityerr1557
arityerr1557:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1558:
  %t5381 = call i64 @rt_string_length(i64 %a0)
  %t5382 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t5383 = and i64 %t5382, -8
  %t5384 = inttoptr i64 %t5383 to ptr
  %t5385 = load i64, ptr %t5384
  %t5386 = inttoptr i64 %t5385 to ptr
  %t5387 = call fastcc i64%t5386(i64 %t5382, i64 3, i64 %a0, i64 %t5381, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5388 = load i64, ptr @"scheme.base:rd-datum"
  %t5389 = and i64 %t5388, -8
  %t5390 = inttoptr i64 %t5389 to ptr
  %t5391 = load i64, ptr %t5390
  %t5392 = inttoptr i64 %t5391 to ptr
  %t5393 = call fastcc i64%t5392(i64 %t5388, i64 3, i64 %a0, i64 %t5381, i64 %t5387, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5394 = call i64 @rt_car(i64 %t5393)
  ret i64 %t5394
}

define fastcc i64 @"scheme.base:code_1256"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5399 = icmp eq i64 %argc, 2
  br i1 %t5399, label %argok1560, label %arityerr1559
arityerr1559:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1560:
  %t5400 = and i64 %self, -8
  %t5401 = inttoptr i64 %t5400 to ptr
  %t5402 = getelementptr i64, ptr %t5401, i64 1
  %t5403 = load i64, ptr %t5402
  %t5404 = or i64 %a0, %t5403
  %t5405 = and i64 %t5404, 7
  %t5406 = icmp eq i64 %t5405, 0
  br i1 %t5406, label %fixfast1561, label %fixslow1562
fixfast1561:
  %t5407 = icmp slt i64 %a0, %t5403
  %t5408 = select i1 %t5407, i64 257, i64 1
  br label %fixmerge1563
fixslow1562:
  %t5409 = call i64 @rt_lt(i64 %a0, i64 %t5403)
  br label %fixmerge1563
fixmerge1563:
  %t5410 = phi i64 [ %t5408, %fixfast1561 ], [ %t5409, %fixslow1562 ]
  %t5411 = icmp ne i64 %t5410, 1
  br i1 %t5411, label %then1564, label %else1565
then1564:
  %t5412 = and i64 %self, -8
  %t5413 = inttoptr i64 %t5412 to ptr
  %t5414 = getelementptr i64, ptr %t5413, i64 2
  %t5415 = load i64, ptr %t5414
  %t5416 = and i64 %self, -8
  %t5417 = inttoptr i64 %t5416 to ptr
  %t5418 = getelementptr i64, ptr %t5417, i64 1
  %t5419 = load i64, ptr %t5418
  %t5420 = load i64, ptr @"scheme.base:rd-datum"
  %t5421 = and i64 %t5420, -8
  %t5422 = inttoptr i64 %t5421 to ptr
  %t5423 = load i64, ptr %t5422
  %t5424 = inttoptr i64 %t5423 to ptr
  %t5425 = call fastcc i64%t5424(i64 %t5420, i64 3, i64 %t5415, i64 %t5419, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5426 = and i64 %self, -8
  %t5427 = inttoptr i64 %t5426 to ptr
  %t5428 = getelementptr i64, ptr %t5427, i64 2
  %t5429 = load i64, ptr %t5428
  %t5430 = and i64 %self, -8
  %t5431 = inttoptr i64 %t5430 to ptr
  %t5432 = getelementptr i64, ptr %t5431, i64 1
  %t5433 = load i64, ptr %t5432
  %t5434 = call i64 @rt_cdr(i64 %t5425)
  %t5435 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t5436 = and i64 %t5435, -8
  %t5437 = inttoptr i64 %t5436 to ptr
  %t5438 = load i64, ptr %t5437
  %t5439 = inttoptr i64 %t5438 to ptr
  %t5440 = call fastcc i64%t5439(i64 %t5435, i64 3, i64 %t5429, i64 %t5433, i64 %t5434, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5441 = call i64 @rt_car(i64 %t5425)
  %t5442 = call i64 @rt_cons(i64 %t5441, i64 %a1)
  %t5443 = musttail call fastcc i64 @"scheme.base:code_1256"(i64 %self, i64 2, i64 %t5440, i64 %t5442, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5443
else1565:
  %t5444 = load i64, ptr @"scheme.base:reverse"
  %t5445 = and i64 %t5444, -8
  %t5446 = inttoptr i64 %t5445 to ptr
  %t5447 = load i64, ptr %t5446
  %t5448 = inttoptr i64 %t5447 to ptr
  %t5449 = musttail call fastcc i64 %t5448(i64 %t5444, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5449
}

define fastcc i64 @"scheme.base:code:read-all-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5450 = icmp eq i64 %argc, 1
  br i1 %t5450, label %argok1567, label %arityerr1566
arityerr1566:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1567:
  %t5451 = call i64 @rt_string_length(i64 %a0)
  %t5452 = call ptr @rt_alloc_words(i64 4)
  %t5453 = ptrtoint ptr %t5452 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1256" to i64), ptr %t5452
  %t5454 = or i64 %t5453, 4
  %t5455 = getelementptr i64, ptr %t5452, i64 1
  store i64 %t5451, ptr %t5455
  %t5456 = getelementptr i64, ptr %t5452, i64 2
  store i64 %a0, ptr %t5456
  %t5457 = getelementptr i64, ptr %t5452, i64 3
  store i64 %t5454, ptr %t5457
  %t5458 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t5459 = and i64 %t5458, -8
  %t5460 = inttoptr i64 %t5459 to ptr
  %t5461 = load i64, ptr %t5460
  %t5462 = inttoptr i64 %t5461 to ptr
  %t5463 = call fastcc i64%t5462(i64 %t5458, i64 3, i64 %a0, i64 %t5451, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5464 = musttail call fastcc i64 @"scheme.base:code_1256"(i64 %t5454, i64 2, i64 %t5463, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5464
}

define fastcc i64 @"scheme.base:code:%port-rtd"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5470 = icmp eq i64 %argc, 0
  br i1 %t5470, label %argok1569, label %arityerr1568
arityerr1568:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1569:
  %t5471 = load i64, ptr @"scheme.base:%port-rtd-cell"
  %t5472 = icmp ne i64 %t5471, 1
  br i1 %t5472, label %then1570, label %else1571
then1570:
  %t5473 = load i64, ptr @"scheme.base:%port-rtd-cell"
  ret i64 %t5473
else1571:
  %t5474 = call i64 @rt_make_string(ptr @.str.lit.26, i64 4)
  %t5475 = call i64 @rt_make_record_type(i64 %t5474)
  %t5476 = call i64 @rt_root(i64 %t5475)
  store i64 %t5476, ptr @"scheme.base:%port-rtd-cell"
  %t5477 = load i64, ptr @"scheme.base:%port-rtd-cell"
  ret i64 %t5477
}

define fastcc i64 @"scheme.base:code:%make-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5482 = icmp eq i64 %argc, 6
  br i1 %t5482, label %argok1573, label %arityerr1572
arityerr1572:
  call void @rt_arity_error(i64 6, i64 %argc)
  unreachable
argok1573:
  %t5483 = load i64, ptr @"scheme.base:%port-rtd"
  %t5484 = and i64 %t5483, -8
  %t5485 = inttoptr i64 %t5484 to ptr
  %t5486 = load i64, ptr %t5485
  %t5487 = inttoptr i64 %t5486 to ptr
  %t5488 = call fastcc i64%t5487(i64 %t5483, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5489 = load i64, ptr @"scheme.base:list"
  %t5490 = and i64 %t5489, -8
  %t5491 = inttoptr i64 %t5490 to ptr
  %t5492 = load i64, ptr %t5491
  %t5493 = inttoptr i64 %t5492 to ptr
  %t5494 = call fastcc i64%t5493(i64 %t5489, i64 6, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 0, i64 0, ptr null)
  %t5495 = call i64 @rt_make_record(i64 %t5488, i64 %t5494)
  ret i64 %t5495
}

define fastcc i64 @"scheme.base:code:port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5500 = icmp eq i64 %argc, 1
  br i1 %t5500, label %argok1575, label %arityerr1574
arityerr1574:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1575:
  %t5501 = load i64, ptr @"scheme.base:%port-rtd"
  %t5502 = and i64 %t5501, -8
  %t5503 = inttoptr i64 %t5502 to ptr
  %t5504 = load i64, ptr %t5503
  %t5505 = inttoptr i64 %t5504 to ptr
  %t5506 = call fastcc i64%t5505(i64 %t5501, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5507 = call i64 @rt_record_of_type_p(i64 %a0, i64 %t5506)
  ret i64 %t5507
}

define fastcc i64 @"scheme.base:code:input-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5512 = icmp eq i64 %argc, 1
  br i1 %t5512, label %argok1577, label %arityerr1576
arityerr1576:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1577:
  %t5513 = load i64, ptr @"scheme.base:port?"
  %t5514 = and i64 %t5513, -8
  %t5515 = inttoptr i64 %t5514 to ptr
  %t5516 = load i64, ptr %t5515
  %t5517 = inttoptr i64 %t5516 to ptr
  %t5518 = call fastcc i64%t5517(i64 %t5513, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5519 = icmp ne i64 %t5518, 1
  br i1 %t5519, label %then1578, label %else1579
then1578:
  %t5520 = call i64 @rt_record_ref(i64 %a0, i64 8)
  ret i64 %t5520
else1579:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5525 = icmp eq i64 %argc, 1
  br i1 %t5525, label %argok1581, label %arityerr1580
arityerr1580:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1581:
  %t5526 = load i64, ptr @"scheme.base:port?"
  %t5527 = and i64 %t5526, -8
  %t5528 = inttoptr i64 %t5527 to ptr
  %t5529 = load i64, ptr %t5528
  %t5530 = inttoptr i64 %t5529 to ptr
  %t5531 = call fastcc i64%t5530(i64 %t5526, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5532 = icmp ne i64 %t5531, 1
  br i1 %t5532, label %then1582, label %else1583
then1582:
  %t5533 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t5534 = call i64 @rt_not(i64 %t5533)
  ret i64 %t5534
else1583:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:textual-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5539 = icmp eq i64 %argc, 1
  br i1 %t5539, label %argok1585, label %arityerr1584
arityerr1584:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1585:
  %t5540 = load i64, ptr @"scheme.base:port?"
  %t5541 = and i64 %t5540, -8
  %t5542 = inttoptr i64 %t5541 to ptr
  %t5543 = load i64, ptr %t5542
  %t5544 = inttoptr i64 %t5543 to ptr
  %t5545 = musttail call fastcc i64 %t5544(i64 %t5540, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5545
}

define fastcc i64 @"scheme.base:code:port-closed?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5550 = icmp eq i64 %argc, 1
  br i1 %t5550, label %argok1587, label %arityerr1586
arityerr1586:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1587:
  %t5551 = call i64 @rt_record_ref(i64 %a0, i64 40)
  ret i64 %t5551
}

define fastcc i64 @"scheme.base:code:input-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5556 = icmp eq i64 %argc, 1
  br i1 %t5556, label %argok1589, label %arityerr1588
arityerr1588:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1589:
  %t5557 = load i64, ptr @"scheme.base:input-port?"
  %t5558 = and i64 %t5557, -8
  %t5559 = inttoptr i64 %t5558 to ptr
  %t5560 = load i64, ptr %t5559
  %t5561 = inttoptr i64 %t5560 to ptr
  %t5562 = call fastcc i64%t5561(i64 %t5557, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5563 = icmp ne i64 %t5562, 1
  br i1 %t5563, label %then1590, label %else1591
then1590:
  %t5564 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t5565 = call i64 @rt_not(i64 %t5564)
  ret i64 %t5565
else1591:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5570 = icmp eq i64 %argc, 1
  br i1 %t5570, label %argok1593, label %arityerr1592
arityerr1592:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1593:
  %t5571 = load i64, ptr @"scheme.base:output-port?"
  %t5572 = and i64 %t5571, -8
  %t5573 = inttoptr i64 %t5572 to ptr
  %t5574 = load i64, ptr %t5573
  %t5575 = inttoptr i64 %t5574 to ptr
  %t5576 = call fastcc i64%t5575(i64 %t5571, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5577 = icmp ne i64 %t5576, 1
  br i1 %t5577, label %then1594, label %else1595
then1594:
  %t5578 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t5579 = call i64 @rt_not(i64 %t5578)
  ret i64 %t5579
else1595:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%check-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5584 = icmp eq i64 %argc, 2
  br i1 %t5584, label %argok1597, label %arityerr1596
arityerr1596:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1597:
  %t5585 = load i64, ptr @"scheme.base:input-port?"
  %t5586 = and i64 %t5585, -8
  %t5587 = inttoptr i64 %t5586 to ptr
  %t5588 = load i64, ptr %t5587
  %t5589 = inttoptr i64 %t5588 to ptr
  %t5590 = call fastcc i64%t5589(i64 %t5585, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5591 = call i64 @rt_not(i64 %t5590)
  %t5592 = icmp ne i64 %t5591, 1
  br i1 %t5592, label %then1598, label %else1599
then1598:
  %t5593 = call i64 @rt_make_string(ptr @.str.lit.27, i64 17)
  %t5594 = load i64, ptr @"scheme.base:error"
  %t5595 = and i64 %t5594, -8
  %t5596 = inttoptr i64 %t5595 to ptr
  %t5597 = load i64, ptr %t5596
  %t5598 = inttoptr i64 %t5597 to ptr
  %t5599 = musttail call fastcc i64 %t5598(i64 %t5594, i64 3, i64 %a1, i64 %t5593, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5599
else1599:
  %t5600 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t5601 = icmp ne i64 %t5600, 1
  br i1 %t5601, label %then1600, label %else1601
then1600:
  %t5602 = call i64 @rt_make_string(ptr @.str.lit.28, i64 14)
  %t5603 = load i64, ptr @"scheme.base:error"
  %t5604 = and i64 %t5603, -8
  %t5605 = inttoptr i64 %t5604 to ptr
  %t5606 = load i64, ptr %t5605
  %t5607 = inttoptr i64 %t5606 to ptr
  %t5608 = musttail call fastcc i64 %t5607(i64 %t5603, i64 3, i64 %a1, i64 %t5602, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5608
else1601:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:%check-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5613 = icmp eq i64 %argc, 2
  br i1 %t5613, label %argok1603, label %arityerr1602
arityerr1602:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1603:
  %t5614 = load i64, ptr @"scheme.base:output-port?"
  %t5615 = and i64 %t5614, -8
  %t5616 = inttoptr i64 %t5615 to ptr
  %t5617 = load i64, ptr %t5616
  %t5618 = inttoptr i64 %t5617 to ptr
  %t5619 = call fastcc i64%t5618(i64 %t5614, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5620 = call i64 @rt_not(i64 %t5619)
  %t5621 = icmp ne i64 %t5620, 1
  br i1 %t5621, label %then1604, label %else1605
then1604:
  %t5622 = call i64 @rt_make_string(ptr @.str.lit.29, i64 18)
  %t5623 = load i64, ptr @"scheme.base:error"
  %t5624 = and i64 %t5623, -8
  %t5625 = inttoptr i64 %t5624 to ptr
  %t5626 = load i64, ptr %t5625
  %t5627 = inttoptr i64 %t5626 to ptr
  %t5628 = musttail call fastcc i64 %t5627(i64 %t5623, i64 3, i64 %a1, i64 %t5622, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5628
else1605:
  %t5629 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t5630 = icmp ne i64 %t5629, 1
  br i1 %t5630, label %then1606, label %else1607
then1606:
  %t5631 = call i64 @rt_make_string(ptr @.str.lit.30, i64 14)
  %t5632 = load i64, ptr @"scheme.base:error"
  %t5633 = and i64 %t5632, -8
  %t5634 = inttoptr i64 %t5633 to ptr
  %t5635 = load i64, ptr %t5634
  %t5636 = inttoptr i64 %t5635 to ptr
  %t5637 = musttail call fastcc i64 %t5636(i64 %t5632, i64 3, i64 %a1, i64 %t5631, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5637
else1607:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:%port-buf"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5642 = icmp eq i64 %argc, 1
  br i1 %t5642, label %argok1609, label %arityerr1608
arityerr1608:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1609:
  %t5643 = call i64 @rt_record_ref(i64 %a0, i64 16)
  %t5644 = icmp ne i64 %t5643, 1
  br i1 %t5644, label %then1610, label %else1611
then1610:
  ret i64 %t5643
else1611:
  %t5645 = call i64 @rt_read_all_stdin()
  %t5646 = call i64 @rt_record_set(i64 %a0, i64 16, i64 %t5645)
  ret i64 %t5645
}

define fastcc i64 @"scheme.base:code:open-input-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5651 = icmp eq i64 %argc, 1
  br i1 %t5651, label %argok1613, label %arityerr1612
arityerr1612:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1613:
  %t5652 = load i64, ptr @"scheme.base:%make-port"
  %t5653 = and i64 %t5652, -8
  %t5654 = inttoptr i64 %t5653 to ptr
  %t5655 = load i64, ptr %t5654
  %t5656 = inttoptr i64 %t5655 to ptr
  %t5657 = musttail call fastcc i64 %t5656(i64 %t5652, i64 6, i64 1, i64 257, i64 %a0, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t5657
}

define fastcc i64 @"scheme.base:code:open-input-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5662 = icmp eq i64 %argc, 1
  br i1 %t5662, label %argok1615, label %arityerr1614
arityerr1614:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1615:
  %t5663 = call i64 @rt_read_file(i64 %a0)
  %t5664 = icmp ne i64 %t5663, 1
  br i1 %t5664, label %then1616, label %else1617
then1616:
  %t5665 = load i64, ptr @"scheme.base:%make-port"
  %t5666 = and i64 %t5665, -8
  %t5667 = inttoptr i64 %t5666 to ptr
  %t5668 = load i64, ptr %t5667
  %t5669 = inttoptr i64 %t5668 to ptr
  %t5670 = musttail call fastcc i64 %t5669(i64 %t5665, i64 6, i64 1, i64 257, i64 %t5663, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t5670
else1617:
  %t5671 = call i64 @rt_intern(ptr @.str.sym.31)
  %t5672 = call i64 @rt_make_string(ptr @.str.lit.32, i64 26)
  %t5673 = load i64, ptr @"scheme.base:error"
  %t5674 = and i64 %t5673, -8
  %t5675 = inttoptr i64 %t5674 to ptr
  %t5676 = load i64, ptr %t5675
  %t5677 = inttoptr i64 %t5676 to ptr
  %t5678 = musttail call fastcc i64 %t5677(i64 %t5673, i64 3, i64 %t5671, i64 %t5672, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5678
}

define fastcc i64 @"scheme.base:code:%port-at-eof?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5683 = icmp eq i64 %argc, 1
  br i1 %t5683, label %argok1619, label %arityerr1618
arityerr1618:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1619:
  %t5684 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t5685 = load i64, ptr @"scheme.base:%port-buf"
  %t5686 = and i64 %t5685, -8
  %t5687 = inttoptr i64 %t5686 to ptr
  %t5688 = load i64, ptr %t5687
  %t5689 = inttoptr i64 %t5688 to ptr
  %t5690 = call fastcc i64%t5689(i64 %t5685, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5691 = call i64 @rt_string_length(i64 %t5690)
  %t5692 = or i64 %t5691, %t5684
  %t5693 = and i64 %t5692, 7
  %t5694 = icmp eq i64 %t5693, 0
  br i1 %t5694, label %fixfast1620, label %fixslow1621
fixfast1620:
  %t5695 = icmp slt i64 %t5691, %t5684
  %t5696 = select i1 %t5695, i64 257, i64 1
  br label %fixmerge1622
fixslow1621:
  %t5697 = call i64 @rt_lt(i64 %t5691, i64 %t5684)
  br label %fixmerge1622
fixmerge1622:
  %t5698 = phi i64 [ %t5696, %fixfast1620 ], [ %t5697, %fixslow1621 ]
  %t5699 = icmp ne i64 %t5698, 1
  br i1 %t5699, label %then1623, label %else1624
then1623:
  ret i64 257
else1624:
  %t5700 = or i64 %t5684, %t5691
  %t5701 = and i64 %t5700, 7
  %t5702 = icmp eq i64 %t5701, 0
  br i1 %t5702, label %fixfast1625, label %fixslow1626
fixfast1625:
  %t5703 = icmp eq i64 %t5684, %t5691
  %t5704 = select i1 %t5703, i64 257, i64 1
  br label %fixmerge1627
fixslow1626:
  %t5705 = call i64 @rt_num_eq(i64 %t5684, i64 %t5691)
  br label %fixmerge1627
fixmerge1627:
  %t5706 = phi i64 [ %t5704, %fixfast1625 ], [ %t5705, %fixslow1626 ]
  ret i64 %t5706
}

define fastcc i64 @"scheme.base:code:read-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5711 = icmp eq i64 %argc, 1
  br i1 %t5711, label %argok1629, label %arityerr1628
arityerr1628:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1629:
  %t5712 = call i64 @rt_intern(ptr @.str.sym.33)
  %t5713 = load i64, ptr @"scheme.base:%check-input-port"
  %t5714 = and i64 %t5713, -8
  %t5715 = inttoptr i64 %t5714 to ptr
  %t5716 = load i64, ptr %t5715
  %t5717 = inttoptr i64 %t5716 to ptr
  %t5718 = call fastcc i64%t5717(i64 %t5713, i64 2, i64 %a0, i64 %t5712, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5719 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t5720 = and i64 %t5719, -8
  %t5721 = inttoptr i64 %t5720 to ptr
  %t5722 = load i64, ptr %t5721
  %t5723 = inttoptr i64 %t5722 to ptr
  %t5724 = call fastcc i64%t5723(i64 %t5719, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5725 = icmp ne i64 %t5724, 1
  br i1 %t5725, label %then1630, label %else1631
then1630:
  %t5726 = call i64 @rt_eof_object()
  ret i64 %t5726
else1631:
  %t5727 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t5728 = or i64 %t5727, 8
  %t5729 = and i64 %t5728, 7
  %t5730 = icmp eq i64 %t5729, 0
  br i1 %t5730, label %fixfast1632, label %fixslow1633
fixfast1632:
  %t5731 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5727, i64 8)
  %t5732 = extractvalue {i64, i1} %t5731, 0
  %t5733 = extractvalue {i64, i1} %t5731, 1
  br i1 %t5733, label %fixslow1633, label %fixmerge1634
fixslow1633:
  %t5734 = call i64 @rt_add(i64 %t5727, i64 8)
  br label %fixmerge1634
fixmerge1634:
  %t5735 = phi i64 [ %t5732, %fixfast1632 ], [ %t5734, %fixslow1633 ]
  %t5736 = call i64 @rt_record_set(i64 %a0, i64 24, i64 %t5735)
  %t5737 = load i64, ptr @"scheme.base:%port-buf"
  %t5738 = and i64 %t5737, -8
  %t5739 = inttoptr i64 %t5738 to ptr
  %t5740 = load i64, ptr %t5739
  %t5741 = inttoptr i64 %t5740 to ptr
  %t5742 = call fastcc i64%t5741(i64 %t5737, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5743 = call i64 @rt_string_ref(i64 %t5742, i64 %t5727)
  ret i64 %t5743
}

define fastcc i64 @"scheme.base:code:peek-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5748 = icmp eq i64 %argc, 1
  br i1 %t5748, label %argok1636, label %arityerr1635
arityerr1635:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1636:
  %t5749 = call i64 @rt_intern(ptr @.str.sym.34)
  %t5750 = load i64, ptr @"scheme.base:%check-input-port"
  %t5751 = and i64 %t5750, -8
  %t5752 = inttoptr i64 %t5751 to ptr
  %t5753 = load i64, ptr %t5752
  %t5754 = inttoptr i64 %t5753 to ptr
  %t5755 = call fastcc i64%t5754(i64 %t5750, i64 2, i64 %a0, i64 %t5749, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5756 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t5757 = and i64 %t5756, -8
  %t5758 = inttoptr i64 %t5757 to ptr
  %t5759 = load i64, ptr %t5758
  %t5760 = inttoptr i64 %t5759 to ptr
  %t5761 = call fastcc i64%t5760(i64 %t5756, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5762 = icmp ne i64 %t5761, 1
  br i1 %t5762, label %then1637, label %else1638
then1637:
  %t5763 = call i64 @rt_eof_object()
  ret i64 %t5763
else1638:
  %t5764 = load i64, ptr @"scheme.base:%port-buf"
  %t5765 = and i64 %t5764, -8
  %t5766 = inttoptr i64 %t5765 to ptr
  %t5767 = load i64, ptr %t5766
  %t5768 = inttoptr i64 %t5767 to ptr
  %t5769 = call fastcc i64%t5768(i64 %t5764, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5770 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t5771 = call i64 @rt_string_ref(i64 %t5769, i64 %t5770)
  ret i64 %t5771
}

define fastcc i64 @"scheme.base:code_1318"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5776 = icmp eq i64 %argc, 1
  br i1 %t5776, label %argok1640, label %arityerr1639
arityerr1639:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1640:
  %t5777 = and i64 %self, -8
  %t5778 = inttoptr i64 %t5777 to ptr
  %t5779 = getelementptr i64, ptr %t5778, i64 1
  %t5780 = load i64, ptr %t5779
  %t5781 = or i64 %t5780, %a0
  %t5782 = and i64 %t5781, 7
  %t5783 = icmp eq i64 %t5782, 0
  br i1 %t5783, label %fixfast1641, label %fixslow1642
fixfast1641:
  %t5784 = icmp slt i64 %t5780, %a0
  %t5785 = select i1 %t5784, i64 257, i64 1
  br label %fixmerge1643
fixslow1642:
  %t5786 = call i64 @rt_lt(i64 %t5780, i64 %a0)
  br label %fixmerge1643
fixmerge1643:
  %t5787 = phi i64 [ %t5785, %fixfast1641 ], [ %t5786, %fixslow1642 ]
  %t5788 = icmp ne i64 %t5787, 1
  br i1 %t5788, label %then1644, label %else1645
then1644:
  br label %merge1646
else1645:
  %t5789 = or i64 %a0, %t5780
  %t5790 = and i64 %t5789, 7
  %t5791 = icmp eq i64 %t5790, 0
  br i1 %t5791, label %fixfast1647, label %fixslow1648
fixfast1647:
  %t5792 = icmp eq i64 %a0, %t5780
  %t5793 = select i1 %t5792, i64 257, i64 1
  br label %fixmerge1649
fixslow1648:
  %t5794 = call i64 @rt_num_eq(i64 %a0, i64 %t5780)
  br label %fixmerge1649
fixmerge1649:
  %t5795 = phi i64 [ %t5793, %fixfast1647 ], [ %t5794, %fixslow1648 ]
  br label %merge1646
merge1646:
  %t5796 = phi i64 [ 257, %then1644 ], [ %t5795, %fixmerge1649 ]
  %t5797 = icmp ne i64 %t5796, 1
  br i1 %t5797, label %then1650, label %else1651
then1650:
  %t5798 = and i64 %self, -8
  %t5799 = inttoptr i64 %t5798 to ptr
  %t5800 = getelementptr i64, ptr %t5799, i64 2
  %t5801 = load i64, ptr %t5800
  %t5802 = call i64 @rt_record_ref(i64 %t5801, i64 24)
  %t5803 = and i64 %self, -8
  %t5804 = inttoptr i64 %t5803 to ptr
  %t5805 = getelementptr i64, ptr %t5804, i64 2
  %t5806 = load i64, ptr %t5805
  %t5807 = and i64 %self, -8
  %t5808 = inttoptr i64 %t5807 to ptr
  %t5809 = getelementptr i64, ptr %t5808, i64 1
  %t5810 = load i64, ptr %t5809
  %t5811 = call i64 @rt_record_set(i64 %t5806, i64 24, i64 %t5810)
  %t5812 = and i64 %self, -8
  %t5813 = inttoptr i64 %t5812 to ptr
  %t5814 = getelementptr i64, ptr %t5813, i64 3
  %t5815 = load i64, ptr %t5814
  %t5816 = and i64 %self, -8
  %t5817 = inttoptr i64 %t5816 to ptr
  %t5818 = getelementptr i64, ptr %t5817, i64 1
  %t5819 = load i64, ptr %t5818
  %t5820 = call i64 @rt_substring(i64 %t5815, i64 %t5802, i64 %t5819)
  ret i64 %t5820
else1651:
  %t5821 = and i64 %self, -8
  %t5822 = inttoptr i64 %t5821 to ptr
  %t5823 = getelementptr i64, ptr %t5822, i64 3
  %t5824 = load i64, ptr %t5823
  %t5825 = call i64 @rt_string_ref(i64 %t5824, i64 %a0)
  %t5826 = load i64, ptr @"scheme.base:char=?"
  %t5827 = and i64 %t5826, -8
  %t5828 = inttoptr i64 %t5827 to ptr
  %t5829 = load i64, ptr %t5828
  %t5830 = inttoptr i64 %t5829 to ptr
  %t5831 = call fastcc i64%t5830(i64 %t5826, i64 2, i64 %t5825, i64 2569, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5832 = icmp ne i64 %t5831, 1
  br i1 %t5832, label %then1652, label %else1653
then1652:
  %t5833 = and i64 %self, -8
  %t5834 = inttoptr i64 %t5833 to ptr
  %t5835 = getelementptr i64, ptr %t5834, i64 2
  %t5836 = load i64, ptr %t5835
  %t5837 = call i64 @rt_record_ref(i64 %t5836, i64 24)
  %t5838 = and i64 %self, -8
  %t5839 = inttoptr i64 %t5838 to ptr
  %t5840 = getelementptr i64, ptr %t5839, i64 2
  %t5841 = load i64, ptr %t5840
  %t5842 = or i64 %a0, 8
  %t5843 = and i64 %t5842, 7
  %t5844 = icmp eq i64 %t5843, 0
  br i1 %t5844, label %fixfast1654, label %fixslow1655
fixfast1654:
  %t5845 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5846 = extractvalue {i64, i1} %t5845, 0
  %t5847 = extractvalue {i64, i1} %t5845, 1
  br i1 %t5847, label %fixslow1655, label %fixmerge1656
fixslow1655:
  %t5848 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1656
fixmerge1656:
  %t5849 = phi i64 [ %t5846, %fixfast1654 ], [ %t5848, %fixslow1655 ]
  %t5850 = call i64 @rt_record_set(i64 %t5841, i64 24, i64 %t5849)
  %t5851 = and i64 %self, -8
  %t5852 = inttoptr i64 %t5851 to ptr
  %t5853 = getelementptr i64, ptr %t5852, i64 3
  %t5854 = load i64, ptr %t5853
  %t5855 = call i64 @rt_substring(i64 %t5854, i64 %t5837, i64 %a0)
  ret i64 %t5855
else1653:
  %t5856 = or i64 %a0, 8
  %t5857 = and i64 %t5856, 7
  %t5858 = icmp eq i64 %t5857, 0
  br i1 %t5858, label %fixfast1657, label %fixslow1658
fixfast1657:
  %t5859 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5860 = extractvalue {i64, i1} %t5859, 0
  %t5861 = extractvalue {i64, i1} %t5859, 1
  br i1 %t5861, label %fixslow1658, label %fixmerge1659
fixslow1658:
  %t5862 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1659
fixmerge1659:
  %t5863 = phi i64 [ %t5860, %fixfast1657 ], [ %t5862, %fixslow1658 ]
  %t5864 = musttail call fastcc i64 @"scheme.base:code_1318"(i64 %self, i64 1, i64 %t5863, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5864
}

define fastcc i64 @"scheme.base:code:read-line"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5865 = icmp eq i64 %argc, 1
  br i1 %t5865, label %argok1661, label %arityerr1660
arityerr1660:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1661:
  %t5866 = call i64 @rt_intern(ptr @.str.sym.35)
  %t5867 = load i64, ptr @"scheme.base:%check-input-port"
  %t5868 = and i64 %t5867, -8
  %t5869 = inttoptr i64 %t5868 to ptr
  %t5870 = load i64, ptr %t5869
  %t5871 = inttoptr i64 %t5870 to ptr
  %t5872 = call fastcc i64%t5871(i64 %t5867, i64 2, i64 %a0, i64 %t5866, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5873 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t5874 = and i64 %t5873, -8
  %t5875 = inttoptr i64 %t5874 to ptr
  %t5876 = load i64, ptr %t5875
  %t5877 = inttoptr i64 %t5876 to ptr
  %t5878 = call fastcc i64%t5877(i64 %t5873, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5879 = icmp ne i64 %t5878, 1
  br i1 %t5879, label %then1662, label %else1663
then1662:
  %t5880 = call i64 @rt_eof_object()
  ret i64 %t5880
else1663:
  %t5881 = load i64, ptr @"scheme.base:%port-buf"
  %t5882 = and i64 %t5881, -8
  %t5883 = inttoptr i64 %t5882 to ptr
  %t5884 = load i64, ptr %t5883
  %t5885 = inttoptr i64 %t5884 to ptr
  %t5886 = call fastcc i64%t5885(i64 %t5881, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5887 = call i64 @rt_string_length(i64 %t5886)
  %t5888 = call ptr @rt_alloc_words(i64 5)
  %t5889 = ptrtoint ptr %t5888 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1318" to i64), ptr %t5888
  %t5890 = or i64 %t5889, 4
  %t5891 = getelementptr i64, ptr %t5888, i64 1
  store i64 %t5887, ptr %t5891
  %t5892 = getelementptr i64, ptr %t5888, i64 2
  store i64 %a0, ptr %t5892
  %t5893 = getelementptr i64, ptr %t5888, i64 3
  store i64 %t5886, ptr %t5893
  %t5894 = getelementptr i64, ptr %t5888, i64 4
  store i64 %t5890, ptr %t5894
  %t5895 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t5896 = musttail call fastcc i64 @"scheme.base:code_1318"(i64 %t5890, i64 1, i64 %t5895, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5896
}

define fastcc i64 @"scheme.base:code:read-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5901 = icmp eq i64 %argc, 2
  br i1 %t5901, label %argok1665, label %arityerr1664
arityerr1664:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1665:
  %t5902 = call i64 @rt_intern(ptr @.str.sym.36)
  %t5903 = load i64, ptr @"scheme.base:%check-input-port"
  %t5904 = and i64 %t5903, -8
  %t5905 = inttoptr i64 %t5904 to ptr
  %t5906 = load i64, ptr %t5905
  %t5907 = inttoptr i64 %t5906 to ptr
  %t5908 = call fastcc i64%t5907(i64 %t5903, i64 2, i64 %a1, i64 %t5902, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5909 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t5910 = and i64 %t5909, -8
  %t5911 = inttoptr i64 %t5910 to ptr
  %t5912 = load i64, ptr %t5911
  %t5913 = inttoptr i64 %t5912 to ptr
  %t5914 = call fastcc i64%t5913(i64 %t5909, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5915 = icmp ne i64 %t5914, 1
  br i1 %t5915, label %then1666, label %else1667
then1666:
  %t5916 = call i64 @rt_eof_object()
  ret i64 %t5916
else1667:
  %t5917 = load i64, ptr @"scheme.base:%port-buf"
  %t5918 = and i64 %t5917, -8
  %t5919 = inttoptr i64 %t5918 to ptr
  %t5920 = load i64, ptr %t5919
  %t5921 = inttoptr i64 %t5920 to ptr
  %t5922 = call fastcc i64%t5921(i64 %t5917, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5923 = call i64 @rt_string_length(i64 %t5922)
  %t5924 = call i64 @rt_record_ref(i64 %a1, i64 24)
  %t5925 = or i64 %t5924, %a0
  %t5926 = and i64 %t5925, 7
  %t5927 = icmp eq i64 %t5926, 0
  br i1 %t5927, label %fixfast1668, label %fixslow1669
fixfast1668:
  %t5928 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5924, i64 %a0)
  %t5929 = extractvalue {i64, i1} %t5928, 0
  %t5930 = extractvalue {i64, i1} %t5928, 1
  br i1 %t5930, label %fixslow1669, label %fixmerge1670
fixslow1669:
  %t5931 = call i64 @rt_add(i64 %t5924, i64 %a0)
  br label %fixmerge1670
fixmerge1670:
  %t5932 = phi i64 [ %t5929, %fixfast1668 ], [ %t5931, %fixslow1669 ]
  %t5933 = or i64 %t5923, %t5932
  %t5934 = and i64 %t5933, 7
  %t5935 = icmp eq i64 %t5934, 0
  br i1 %t5935, label %fixfast1671, label %fixslow1672
fixfast1671:
  %t5936 = icmp slt i64 %t5923, %t5932
  %t5937 = select i1 %t5936, i64 257, i64 1
  br label %fixmerge1673
fixslow1672:
  %t5938 = call i64 @rt_lt(i64 %t5923, i64 %t5932)
  br label %fixmerge1673
fixmerge1673:
  %t5939 = phi i64 [ %t5937, %fixfast1671 ], [ %t5938, %fixslow1672 ]
  %t5940 = icmp ne i64 %t5939, 1
  br i1 %t5940, label %then1674, label %else1675
then1674:
  br label %merge1676
else1675:
  %t5941 = or i64 %t5924, %a0
  %t5942 = and i64 %t5941, 7
  %t5943 = icmp eq i64 %t5942, 0
  br i1 %t5943, label %fixfast1677, label %fixslow1678
fixfast1677:
  %t5944 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5924, i64 %a0)
  %t5945 = extractvalue {i64, i1} %t5944, 0
  %t5946 = extractvalue {i64, i1} %t5944, 1
  br i1 %t5946, label %fixslow1678, label %fixmerge1679
fixslow1678:
  %t5947 = call i64 @rt_add(i64 %t5924, i64 %a0)
  br label %fixmerge1679
fixmerge1679:
  %t5948 = phi i64 [ %t5945, %fixfast1677 ], [ %t5947, %fixslow1678 ]
  br label %merge1676
merge1676:
  %t5949 = phi i64 [ %t5923, %then1674 ], [ %t5948, %fixmerge1679 ]
  %t5950 = call i64 @rt_record_set(i64 %a1, i64 24, i64 %t5949)
  %t5951 = call i64 @rt_substring(i64 %t5922, i64 %t5924, i64 %t5949)
  ret i64 %t5951
}

define fastcc i64 @"scheme.base:code:read"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5956 = icmp eq i64 %argc, 1
  br i1 %t5956, label %argok1681, label %arityerr1680
arityerr1680:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1681:
  %t5957 = call i64 @rt_intern(ptr @.str.sym.37)
  %t5958 = load i64, ptr @"scheme.base:%check-input-port"
  %t5959 = and i64 %t5958, -8
  %t5960 = inttoptr i64 %t5959 to ptr
  %t5961 = load i64, ptr %t5960
  %t5962 = inttoptr i64 %t5961 to ptr
  %t5963 = call fastcc i64%t5962(i64 %t5958, i64 2, i64 %a0, i64 %t5957, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5964 = load i64, ptr @"scheme.base:%port-buf"
  %t5965 = and i64 %t5964, -8
  %t5966 = inttoptr i64 %t5965 to ptr
  %t5967 = load i64, ptr %t5966
  %t5968 = inttoptr i64 %t5967 to ptr
  %t5969 = call fastcc i64%t5968(i64 %t5964, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5970 = call i64 @rt_string_length(i64 %t5969)
  %t5971 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t5972 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t5973 = and i64 %t5972, -8
  %t5974 = inttoptr i64 %t5973 to ptr
  %t5975 = load i64, ptr %t5974
  %t5976 = inttoptr i64 %t5975 to ptr
  %t5977 = call fastcc i64%t5976(i64 %t5972, i64 3, i64 %t5969, i64 %t5970, i64 %t5971, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5978 = or i64 %t5970, %t5977
  %t5979 = and i64 %t5978, 7
  %t5980 = icmp eq i64 %t5979, 0
  br i1 %t5980, label %fixfast1682, label %fixslow1683
fixfast1682:
  %t5981 = icmp slt i64 %t5970, %t5977
  %t5982 = select i1 %t5981, i64 257, i64 1
  br label %fixmerge1684
fixslow1683:
  %t5983 = call i64 @rt_lt(i64 %t5970, i64 %t5977)
  br label %fixmerge1684
fixmerge1684:
  %t5984 = phi i64 [ %t5982, %fixfast1682 ], [ %t5983, %fixslow1683 ]
  %t5985 = icmp ne i64 %t5984, 1
  br i1 %t5985, label %then1685, label %else1686
then1685:
  br label %merge1687
else1686:
  %t5986 = or i64 %t5977, %t5970
  %t5987 = and i64 %t5986, 7
  %t5988 = icmp eq i64 %t5987, 0
  br i1 %t5988, label %fixfast1688, label %fixslow1689
fixfast1688:
  %t5989 = icmp eq i64 %t5977, %t5970
  %t5990 = select i1 %t5989, i64 257, i64 1
  br label %fixmerge1690
fixslow1689:
  %t5991 = call i64 @rt_num_eq(i64 %t5977, i64 %t5970)
  br label %fixmerge1690
fixmerge1690:
  %t5992 = phi i64 [ %t5990, %fixfast1688 ], [ %t5991, %fixslow1689 ]
  br label %merge1687
merge1687:
  %t5993 = phi i64 [ 257, %then1685 ], [ %t5992, %fixmerge1690 ]
  %t5994 = icmp ne i64 %t5993, 1
  br i1 %t5994, label %then1691, label %else1692
then1691:
  %t5995 = call i64 @rt_record_set(i64 %a0, i64 24, i64 %t5970)
  %t5996 = call i64 @rt_eof_object()
  ret i64 %t5996
else1692:
  %t5997 = load i64, ptr @"scheme.base:rd-datum"
  %t5998 = and i64 %t5997, -8
  %t5999 = inttoptr i64 %t5998 to ptr
  %t6000 = load i64, ptr %t5999
  %t6001 = inttoptr i64 %t6000 to ptr
  %t6002 = call fastcc i64%t6001(i64 %t5997, i64 3, i64 %t5969, i64 %t5970, i64 %t5977, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6003 = call i64 @rt_cdr(i64 %t6002)
  %t6004 = call i64 @rt_record_set(i64 %a0, i64 24, i64 %t6003)
  %t6005 = call i64 @rt_car(i64 %t6002)
  ret i64 %t6005
}

define fastcc i64 @"scheme.base:code:open-output-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6010 = icmp eq i64 %argc, 1
  br i1 %t6010, label %argok1694, label %arityerr1693
arityerr1693:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1694:
  %t6011 = call i64 @rt_port_open_output_file(i64 %a0)
  %t6012 = icmp ne i64 %t6011, 1
  br i1 %t6012, label %then1695, label %else1696
then1695:
  %t6013 = load i64, ptr @"scheme.base:%make-port"
  %t6014 = and i64 %t6013, -8
  %t6015 = inttoptr i64 %t6014 to ptr
  %t6016 = load i64, ptr %t6015
  %t6017 = inttoptr i64 %t6016 to ptr
  %t6018 = musttail call fastcc i64 %t6017(i64 %t6013, i64 6, i64 %t6011, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t6018
else1696:
  %t6019 = call i64 @rt_intern(ptr @.str.sym.38)
  %t6020 = call i64 @rt_make_string(ptr @.str.lit.39, i64 27)
  %t6021 = load i64, ptr @"scheme.base:error"
  %t6022 = and i64 %t6021, -8
  %t6023 = inttoptr i64 %t6022 to ptr
  %t6024 = load i64, ptr %t6023
  %t6025 = inttoptr i64 %t6024 to ptr
  %t6026 = musttail call fastcc i64 %t6025(i64 %t6021, i64 3, i64 %t6019, i64 %t6020, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6026
}

define fastcc i64 @"scheme.base:code:open-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6031 = icmp eq i64 %argc, 0
  br i1 %t6031, label %argok1698, label %arityerr1697
arityerr1697:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1698:
  %t6032 = call i64 @rt_port_open_output_string()
  %t6033 = icmp ne i64 %t6032, 1
  br i1 %t6033, label %then1699, label %else1700
then1699:
  %t6034 = load i64, ptr @"scheme.base:%make-port"
  %t6035 = and i64 %t6034, -8
  %t6036 = inttoptr i64 %t6035 to ptr
  %t6037 = load i64, ptr %t6036
  %t6038 = inttoptr i64 %t6037 to ptr
  %t6039 = musttail call fastcc i64 %t6038(i64 %t6034, i64 6, i64 %t6032, i64 1, i64 1, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t6039
else1700:
  %t6040 = call i64 @rt_intern(ptr @.str.sym.40)
  %t6041 = call i64 @rt_make_string(ptr @.str.lit.41, i64 33)
  %t6042 = load i64, ptr @"scheme.base:error"
  %t6043 = and i64 %t6042, -8
  %t6044 = inttoptr i64 %t6043 to ptr
  %t6045 = load i64, ptr %t6044
  %t6046 = inttoptr i64 %t6045 to ptr
  %t6047 = musttail call fastcc i64 %t6046(i64 %t6042, i64 2, i64 %t6040, i64 %t6041, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6047
}

define fastcc i64 @"scheme.base:code:get-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6052 = icmp eq i64 %argc, 1
  br i1 %t6052, label %argok1702, label %arityerr1701
arityerr1701:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1702:
  %t6053 = load i64, ptr @"scheme.base:output-port?"
  %t6054 = and i64 %t6053, -8
  %t6055 = inttoptr i64 %t6054 to ptr
  %t6056 = load i64, ptr %t6055
  %t6057 = inttoptr i64 %t6056 to ptr
  %t6058 = call fastcc i64%t6057(i64 %t6053, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6059 = call i64 @rt_not(i64 %t6058)
  %t6060 = icmp ne i64 %t6059, 1
  br i1 %t6060, label %then1703, label %else1704
then1703:
  %t6061 = call i64 @rt_intern(ptr @.str.sym.42)
  %t6062 = call i64 @rt_make_string(ptr @.str.lit.43, i64 18)
  %t6063 = load i64, ptr @"scheme.base:error"
  %t6064 = and i64 %t6063, -8
  %t6065 = inttoptr i64 %t6064 to ptr
  %t6066 = load i64, ptr %t6065
  %t6067 = inttoptr i64 %t6066 to ptr
  %t6068 = musttail call fastcc i64 %t6067(i64 %t6063, i64 3, i64 %t6061, i64 %t6062, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6068
else1704:
  %t6069 = call i64 @rt_record_ref(i64 %a0, i64 32)
  %t6070 = call i64 @rt_not(i64 %t6069)
  %t6071 = icmp ne i64 %t6070, 1
  br i1 %t6071, label %then1705, label %else1706
then1705:
  %t6072 = call i64 @rt_intern(ptr @.str.sym.42)
  %t6073 = call i64 @rt_make_string(ptr @.str.lit.44, i64 17)
  %t6074 = load i64, ptr @"scheme.base:error"
  %t6075 = and i64 %t6074, -8
  %t6076 = inttoptr i64 %t6075 to ptr
  %t6077 = load i64, ptr %t6076
  %t6078 = inttoptr i64 %t6077 to ptr
  %t6079 = musttail call fastcc i64 %t6078(i64 %t6074, i64 3, i64 %t6072, i64 %t6073, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6079
else1706:
  %t6080 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t6081 = call i64 @rt_port_get_output_string(i64 %t6080)
  ret i64 %t6081
}

define fastcc i64 @"scheme.base:code:flush-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6086 = icmp eq i64 %argc, 1
  br i1 %t6086, label %argok1708, label %arityerr1707
arityerr1707:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1708:
  %t6087 = call i64 @rt_intern(ptr @.str.sym.45)
  %t6088 = load i64, ptr @"scheme.base:%check-output-port"
  %t6089 = and i64 %t6088, -8
  %t6090 = inttoptr i64 %t6089 to ptr
  %t6091 = load i64, ptr %t6090
  %t6092 = inttoptr i64 %t6091 to ptr
  %t6093 = call fastcc i64%t6092(i64 %t6088, i64 2, i64 %a0, i64 %t6087, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6094 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t6095 = call i64 @rt_port_flush(i64 %t6094)
  ret i64 %t6095
}

define fastcc i64 @"scheme.base:code:close-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6100 = icmp eq i64 %argc, 1
  br i1 %t6100, label %argok1710, label %arityerr1709
arityerr1709:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1710:
  %t6101 = load i64, ptr @"scheme.base:port?"
  %t6102 = and i64 %t6101, -8
  %t6103 = inttoptr i64 %t6102 to ptr
  %t6104 = load i64, ptr %t6103
  %t6105 = inttoptr i64 %t6104 to ptr
  %t6106 = call fastcc i64%t6105(i64 %t6101, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6107 = call i64 @rt_not(i64 %t6106)
  %t6108 = icmp ne i64 %t6107, 1
  br i1 %t6108, label %then1711, label %else1712
then1711:
  %t6109 = call i64 @rt_intern(ptr @.str.sym.46)
  %t6110 = call i64 @rt_make_string(ptr @.str.lit.47, i64 10)
  %t6111 = load i64, ptr @"scheme.base:error"
  %t6112 = and i64 %t6111, -8
  %t6113 = inttoptr i64 %t6112 to ptr
  %t6114 = load i64, ptr %t6113
  %t6115 = inttoptr i64 %t6114 to ptr
  %t6116 = musttail call fastcc i64 %t6115(i64 %t6111, i64 3, i64 %t6109, i64 %t6110, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6116
else1712:
  %t6117 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t6118 = icmp ne i64 %t6117, 1
  br i1 %t6118, label %then1713, label %else1714
then1713:
  %t6119 = icmp ne i64 1, 1
  br i1 %t6119, label %then1715, label %else1716
then1715:
  ret i64 1
else1716:
  ret i64 17
else1714:
  %t6120 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t6121 = call i64 @rt_not(i64 %t6120)
  %t6122 = icmp ne i64 %t6121, 1
  br i1 %t6122, label %then1717, label %else1718
then1717:
  %t6123 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t6124 = call i64 @rt_port_close(i64 %t6123)
  br label %merge1719
else1718:
  br label %merge1719
merge1719:
  %t6125 = phi i64 [ %t6124, %then1717 ], [ 17, %else1718 ]
  %t6126 = call i64 @rt_record_set(i64 %a0, i64 40, i64 257)
  %t6127 = icmp ne i64 1, 1
  br i1 %t6127, label %then1720, label %else1721
then1720:
  ret i64 1
else1721:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:close-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6132 = icmp eq i64 %argc, 1
  br i1 %t6132, label %argok1723, label %arityerr1722
arityerr1722:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1723:
  %t6133 = load i64, ptr @"scheme.base:input-port?"
  %t6134 = and i64 %t6133, -8
  %t6135 = inttoptr i64 %t6134 to ptr
  %t6136 = load i64, ptr %t6135
  %t6137 = inttoptr i64 %t6136 to ptr
  %t6138 = call fastcc i64%t6137(i64 %t6133, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6139 = icmp ne i64 %t6138, 1
  br i1 %t6139, label %then1724, label %else1725
then1724:
  %t6140 = load i64, ptr @"scheme.base:close-port"
  %t6141 = and i64 %t6140, -8
  %t6142 = inttoptr i64 %t6141 to ptr
  %t6143 = load i64, ptr %t6142
  %t6144 = inttoptr i64 %t6143 to ptr
  %t6145 = musttail call fastcc i64 %t6144(i64 %t6140, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6145
else1725:
  %t6146 = call i64 @rt_intern(ptr @.str.sym.48)
  %t6147 = call i64 @rt_make_string(ptr @.str.lit.49, i64 17)
  %t6148 = load i64, ptr @"scheme.base:error"
  %t6149 = and i64 %t6148, -8
  %t6150 = inttoptr i64 %t6149 to ptr
  %t6151 = load i64, ptr %t6150
  %t6152 = inttoptr i64 %t6151 to ptr
  %t6153 = musttail call fastcc i64 %t6152(i64 %t6148, i64 3, i64 %t6146, i64 %t6147, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6153
}

define fastcc i64 @"scheme.base:code:close-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6158 = icmp eq i64 %argc, 1
  br i1 %t6158, label %argok1727, label %arityerr1726
arityerr1726:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1727:
  %t6159 = load i64, ptr @"scheme.base:output-port?"
  %t6160 = and i64 %t6159, -8
  %t6161 = inttoptr i64 %t6160 to ptr
  %t6162 = load i64, ptr %t6161
  %t6163 = inttoptr i64 %t6162 to ptr
  %t6164 = call fastcc i64%t6163(i64 %t6159, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6165 = icmp ne i64 %t6164, 1
  br i1 %t6165, label %then1728, label %else1729
then1728:
  %t6166 = load i64, ptr @"scheme.base:close-port"
  %t6167 = and i64 %t6166, -8
  %t6168 = inttoptr i64 %t6167 to ptr
  %t6169 = load i64, ptr %t6168
  %t6170 = inttoptr i64 %t6169 to ptr
  %t6171 = musttail call fastcc i64 %t6170(i64 %t6166, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6171
else1729:
  %t6172 = call i64 @rt_intern(ptr @.str.sym.50)
  %t6173 = call i64 @rt_make_string(ptr @.str.lit.51, i64 18)
  %t6174 = load i64, ptr @"scheme.base:error"
  %t6175 = and i64 %t6174, -8
  %t6176 = inttoptr i64 %t6175 to ptr
  %t6177 = load i64, ptr %t6176
  %t6178 = inttoptr i64 %t6177 to ptr
  %t6179 = musttail call fastcc i64 %t6178(i64 %t6174, i64 3, i64 %t6172, i64 %t6173, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6179
}

define fastcc i64 @"scheme.base:code:current-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6187 = icmp sge i64 %argc, 0
  br i1 %t6187, label %argok1731, label %arityerr1730
arityerr1730:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1731:
  %t6188 = call ptr @rt_alloc_words(i64 8)
  %t6189 = getelementptr i64, ptr %t6188, i64 0
  store i64 %a0, ptr %t6189
  %t6190 = getelementptr i64, ptr %t6188, i64 1
  store i64 %a1, ptr %t6190
  %t6191 = getelementptr i64, ptr %t6188, i64 2
  store i64 %a2, ptr %t6191
  %t6192 = getelementptr i64, ptr %t6188, i64 3
  store i64 %a3, ptr %t6192
  %t6193 = getelementptr i64, ptr %t6188, i64 4
  store i64 %a4, ptr %t6193
  %t6194 = getelementptr i64, ptr %t6188, i64 5
  store i64 %a5, ptr %t6194
  %t6195 = getelementptr i64, ptr %t6188, i64 6
  store i64 %a6, ptr %t6195
  %t6196 = getelementptr i64, ptr %t6188, i64 7
  store i64 %a7, ptr %t6196
  %t6197 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t6188, ptr %overflow)
  %t6198 = call i64 @rt_null_p(i64 %t6197)
  %t6199 = icmp ne i64 %t6198, 1
  br i1 %t6199, label %then1732, label %else1733
then1732:
  %t6200 = load i64, ptr @"scheme.base:%stdout-port"
  %t6201 = call i64 @rt_not(i64 %t6200)
  %t6202 = icmp ne i64 %t6201, 1
  br i1 %t6202, label %then1734, label %else1735
then1734:
  %t6203 = load i64, ptr @"scheme.base:%make-port"
  %t6204 = and i64 %t6203, -8
  %t6205 = inttoptr i64 %t6204 to ptr
  %t6206 = load i64, ptr %t6205
  %t6207 = inttoptr i64 %t6206 to ptr
  %t6208 = call fastcc i64%t6207(i64 %t6203, i64 6, i64 0, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t6209 = call i64 @rt_root(i64 %t6208)
  store i64 %t6209, ptr @"scheme.base:%stdout-port"
  %t6210 = call i64 @rt_set_current_output(i64 0)
  br label %merge1736
else1735:
  br label %merge1736
merge1736:
  %t6211 = phi i64 [ %t6210, %then1734 ], [ 17, %else1735 ]
  %t6212 = load i64, ptr @"scheme.base:%stdout-port"
  ret i64 %t6212
else1733:
  %t6213 = call i64 @rt_car(i64 %t6197)
  %t6214 = call i64 @rt_root(i64 %t6213)
  store i64 %t6214, ptr @"scheme.base:%stdout-port"
  %t6215 = call i64 @rt_record_ref(i64 %t6213, i64 0)
  %t6216 = call i64 @rt_set_current_output(i64 %t6215)
  %t6217 = icmp ne i64 1, 1
  br i1 %t6217, label %then1737, label %else1738
then1737:
  ret i64 1
else1738:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-error-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6222 = icmp sge i64 %argc, 0
  br i1 %t6222, label %argok1740, label %arityerr1739
arityerr1739:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1740:
  %t6223 = call ptr @rt_alloc_words(i64 8)
  %t6224 = getelementptr i64, ptr %t6223, i64 0
  store i64 %a0, ptr %t6224
  %t6225 = getelementptr i64, ptr %t6223, i64 1
  store i64 %a1, ptr %t6225
  %t6226 = getelementptr i64, ptr %t6223, i64 2
  store i64 %a2, ptr %t6226
  %t6227 = getelementptr i64, ptr %t6223, i64 3
  store i64 %a3, ptr %t6227
  %t6228 = getelementptr i64, ptr %t6223, i64 4
  store i64 %a4, ptr %t6228
  %t6229 = getelementptr i64, ptr %t6223, i64 5
  store i64 %a5, ptr %t6229
  %t6230 = getelementptr i64, ptr %t6223, i64 6
  store i64 %a6, ptr %t6230
  %t6231 = getelementptr i64, ptr %t6223, i64 7
  store i64 %a7, ptr %t6231
  %t6232 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t6223, ptr %overflow)
  %t6233 = call i64 @rt_null_p(i64 %t6232)
  %t6234 = icmp ne i64 %t6233, 1
  br i1 %t6234, label %then1741, label %else1742
then1741:
  %t6235 = load i64, ptr @"scheme.base:%stderr-port"
  %t6236 = call i64 @rt_not(i64 %t6235)
  %t6237 = icmp ne i64 %t6236, 1
  br i1 %t6237, label %then1743, label %else1744
then1743:
  %t6238 = load i64, ptr @"scheme.base:%make-port"
  %t6239 = and i64 %t6238, -8
  %t6240 = inttoptr i64 %t6239 to ptr
  %t6241 = load i64, ptr %t6240
  %t6242 = inttoptr i64 %t6241 to ptr
  %t6243 = call fastcc i64%t6242(i64 %t6238, i64 6, i64 8, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t6244 = call i64 @rt_root(i64 %t6243)
  store i64 %t6244, ptr @"scheme.base:%stderr-port"
  br label %merge1745
else1744:
  br label %merge1745
merge1745:
  %t6245 = phi i64 [ 17, %then1743 ], [ 17, %else1744 ]
  %t6246 = load i64, ptr @"scheme.base:%stderr-port"
  ret i64 %t6246
else1742:
  %t6247 = call i64 @rt_car(i64 %t6232)
  %t6248 = call i64 @rt_root(i64 %t6247)
  store i64 %t6248, ptr @"scheme.base:%stderr-port"
  %t6249 = icmp ne i64 1, 1
  br i1 %t6249, label %then1746, label %else1747
then1746:
  ret i64 1
else1747:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6254 = icmp sge i64 %argc, 0
  br i1 %t6254, label %argok1749, label %arityerr1748
arityerr1748:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1749:
  %t6255 = call ptr @rt_alloc_words(i64 8)
  %t6256 = getelementptr i64, ptr %t6255, i64 0
  store i64 %a0, ptr %t6256
  %t6257 = getelementptr i64, ptr %t6255, i64 1
  store i64 %a1, ptr %t6257
  %t6258 = getelementptr i64, ptr %t6255, i64 2
  store i64 %a2, ptr %t6258
  %t6259 = getelementptr i64, ptr %t6255, i64 3
  store i64 %a3, ptr %t6259
  %t6260 = getelementptr i64, ptr %t6255, i64 4
  store i64 %a4, ptr %t6260
  %t6261 = getelementptr i64, ptr %t6255, i64 5
  store i64 %a5, ptr %t6261
  %t6262 = getelementptr i64, ptr %t6255, i64 6
  store i64 %a6, ptr %t6262
  %t6263 = getelementptr i64, ptr %t6255, i64 7
  store i64 %a7, ptr %t6263
  %t6264 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t6255, ptr %overflow)
  %t6265 = call i64 @rt_null_p(i64 %t6264)
  %t6266 = icmp ne i64 %t6265, 1
  br i1 %t6266, label %then1750, label %else1751
then1750:
  %t6267 = load i64, ptr @"scheme.base:%stdin-port"
  %t6268 = call i64 @rt_not(i64 %t6267)
  %t6269 = icmp ne i64 %t6268, 1
  br i1 %t6269, label %then1752, label %else1753
then1752:
  %t6270 = load i64, ptr @"scheme.base:%make-port"
  %t6271 = and i64 %t6270, -8
  %t6272 = inttoptr i64 %t6271 to ptr
  %t6273 = load i64, ptr %t6272
  %t6274 = inttoptr i64 %t6273 to ptr
  %t6275 = call fastcc i64%t6274(i64 %t6270, i64 6, i64 1, i64 257, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t6276 = call i64 @rt_root(i64 %t6275)
  store i64 %t6276, ptr @"scheme.base:%stdin-port"
  br label %merge1754
else1753:
  br label %merge1754
merge1754:
  %t6277 = phi i64 [ 17, %then1752 ], [ 17, %else1753 ]
  %t6278 = load i64, ptr @"scheme.base:%stdin-port"
  ret i64 %t6278
else1751:
  %t6279 = call i64 @rt_car(i64 %t6264)
  %t6280 = call i64 @rt_root(i64 %t6279)
  store i64 %t6280, ptr @"scheme.base:%stdin-port"
  %t6281 = icmp ne i64 1, 1
  br i1 %t6281, label %then1755, label %else1756
then1755:
  ret i64 1
else1756:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_1366"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6286 = icmp eq i64 %argc, 0
  br i1 %t6286, label %argok1758, label %arityerr1757
arityerr1757:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1758:
  %t6287 = icmp ne i64 1, 1
  br i1 %t6287, label %then1759, label %else1760
then1759:
  ret i64 1
else1760:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_1368"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6288 = icmp eq i64 %argc, 0
  br i1 %t6288, label %argok1762, label %arityerr1761
arityerr1761:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1762:
  %t6289 = and i64 %self, -8
  %t6290 = inttoptr i64 %t6289 to ptr
  %t6291 = getelementptr i64, ptr %t6290, i64 2
  %t6292 = load i64, ptr %t6291
  %t6293 = and i64 %self, -8
  %t6294 = inttoptr i64 %t6293 to ptr
  %t6295 = getelementptr i64, ptr %t6294, i64 1
  %t6296 = load i64, ptr %t6295
  %t6297 = and i64 %t6296, -8
  %t6298 = inttoptr i64 %t6297 to ptr
  %t6299 = load i64, ptr %t6298
  %t6300 = inttoptr i64 %t6299 to ptr
  %t6301 = musttail call fastcc i64 %t6300(i64 %t6296, i64 1, i64 %t6292, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6301
}

define fastcc i64 @"scheme.base:code_1370"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6302 = icmp eq i64 %argc, 0
  br i1 %t6302, label %argok1764, label %arityerr1763
arityerr1763:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1764:
  %t6303 = and i64 %self, -8
  %t6304 = inttoptr i64 %t6303 to ptr
  %t6305 = getelementptr i64, ptr %t6304, i64 1
  %t6306 = load i64, ptr %t6305
  %t6307 = load i64, ptr @"scheme.base:close-port"
  %t6308 = and i64 %t6307, -8
  %t6309 = inttoptr i64 %t6308 to ptr
  %t6310 = load i64, ptr %t6309
  %t6311 = inttoptr i64 %t6310 to ptr
  %t6312 = musttail call fastcc i64 %t6311(i64 %t6307, i64 1, i64 %t6306, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6312
}

define fastcc i64 @"scheme.base:code:call-with-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6313 = icmp eq i64 %argc, 2
  br i1 %t6313, label %argok1766, label %arityerr1765
arityerr1765:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1766:
  %t6314 = call ptr @rt_alloc_words(i64 1)
  %t6315 = ptrtoint ptr %t6314 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1366" to i64), ptr %t6314
  %t6316 = or i64 %t6315, 4
  %t6317 = call ptr @rt_alloc_words(i64 3)
  %t6318 = ptrtoint ptr %t6317 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1368" to i64), ptr %t6317
  %t6319 = getelementptr i64, ptr %t6317, i64 1
  store i64 %a1, ptr %t6319
  %t6320 = getelementptr i64, ptr %t6317, i64 2
  store i64 %a0, ptr %t6320
  %t6321 = or i64 %t6318, 4
  %t6322 = call ptr @rt_alloc_words(i64 2)
  %t6323 = ptrtoint ptr %t6322 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1370" to i64), ptr %t6322
  %t6324 = getelementptr i64, ptr %t6322, i64 1
  store i64 %a0, ptr %t6324
  %t6325 = or i64 %t6323, 4
  %t6326 = load i64, ptr @"scheme.base:dynamic-wind"
  %t6327 = and i64 %t6326, -8
  %t6328 = inttoptr i64 %t6327 to ptr
  %t6329 = load i64, ptr %t6328
  %t6330 = inttoptr i64 %t6329 to ptr
  %t6331 = musttail call fastcc i64 %t6330(i64 %t6326, i64 3, i64 %t6316, i64 %t6321, i64 %t6325, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6331
}

define fastcc i64 @"scheme.base:code_1377"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6336 = icmp eq i64 %argc, 0
  br i1 %t6336, label %argok1768, label %arityerr1767
arityerr1767:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1768:
  %t6337 = and i64 %self, -8
  %t6338 = inttoptr i64 %t6337 to ptr
  %t6339 = getelementptr i64, ptr %t6338, i64 1
  %t6340 = load i64, ptr %t6339
  %t6341 = load i64, ptr @"scheme.base:current-output-port"
  %t6342 = and i64 %t6341, -8
  %t6343 = inttoptr i64 %t6342 to ptr
  %t6344 = load i64, ptr %t6343
  %t6345 = inttoptr i64 %t6344 to ptr
  %t6346 = musttail call fastcc i64 %t6345(i64 %t6341, i64 1, i64 %t6340, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6346
}

define fastcc i64 @"scheme.base:code_1379"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6347 = icmp eq i64 %argc, 0
  br i1 %t6347, label %argok1770, label %arityerr1769
arityerr1769:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1770:
  %t6348 = and i64 %self, -8
  %t6349 = inttoptr i64 %t6348 to ptr
  %t6350 = getelementptr i64, ptr %t6349, i64 1
  %t6351 = load i64, ptr %t6350
  %t6352 = load i64, ptr @"scheme.base:current-output-port"
  %t6353 = and i64 %t6352, -8
  %t6354 = inttoptr i64 %t6353 to ptr
  %t6355 = load i64, ptr %t6354
  %t6356 = inttoptr i64 %t6355 to ptr
  %t6357 = call fastcc i64%t6356(i64 %t6352, i64 2, i64 %t6351, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6358 = and i64 %self, -8
  %t6359 = inttoptr i64 %t6358 to ptr
  %t6360 = getelementptr i64, ptr %t6359, i64 2
  %t6361 = load i64, ptr %t6360
  %t6362 = load i64, ptr @"scheme.base:close-port"
  %t6363 = and i64 %t6362, -8
  %t6364 = inttoptr i64 %t6363 to ptr
  %t6365 = load i64, ptr %t6364
  %t6366 = inttoptr i64 %t6365 to ptr
  %t6367 = musttail call fastcc i64 %t6366(i64 %t6362, i64 1, i64 %t6361, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6367
}

define fastcc i64 @"scheme.base:code:with-output-to-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6368 = icmp eq i64 %argc, 2
  br i1 %t6368, label %argok1772, label %arityerr1771
arityerr1771:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1772:
  %t6369 = load i64, ptr @"scheme.base:open-output-file"
  %t6370 = and i64 %t6369, -8
  %t6371 = inttoptr i64 %t6370 to ptr
  %t6372 = load i64, ptr %t6371
  %t6373 = inttoptr i64 %t6372 to ptr
  %t6374 = call fastcc i64%t6373(i64 %t6369, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6375 = load i64, ptr @"scheme.base:current-output-port"
  %t6376 = and i64 %t6375, -8
  %t6377 = inttoptr i64 %t6376 to ptr
  %t6378 = load i64, ptr %t6377
  %t6379 = inttoptr i64 %t6378 to ptr
  %t6380 = call fastcc i64%t6379(i64 %t6375, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6381 = call ptr @rt_alloc_words(i64 2)
  %t6382 = ptrtoint ptr %t6381 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1377" to i64), ptr %t6381
  %t6383 = getelementptr i64, ptr %t6381, i64 1
  store i64 %t6374, ptr %t6383
  %t6384 = or i64 %t6382, 4
  %t6385 = call ptr @rt_alloc_words(i64 3)
  %t6386 = ptrtoint ptr %t6385 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1379" to i64), ptr %t6385
  %t6387 = getelementptr i64, ptr %t6385, i64 1
  store i64 %t6380, ptr %t6387
  %t6388 = getelementptr i64, ptr %t6385, i64 2
  store i64 %t6374, ptr %t6388
  %t6389 = or i64 %t6386, 4
  %t6390 = load i64, ptr @"scheme.base:dynamic-wind"
  %t6391 = and i64 %t6390, -8
  %t6392 = inttoptr i64 %t6391 to ptr
  %t6393 = load i64, ptr %t6392
  %t6394 = inttoptr i64 %t6393 to ptr
  %t6395 = musttail call fastcc i64 %t6394(i64 %t6390, i64 3, i64 %t6384, i64 %a1, i64 %t6389, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6395
}

define fastcc i64 @"scheme.base:code_1386"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6400 = icmp eq i64 %argc, 0
  br i1 %t6400, label %argok1774, label %arityerr1773
arityerr1773:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1774:
  %t6401 = and i64 %self, -8
  %t6402 = inttoptr i64 %t6401 to ptr
  %t6403 = getelementptr i64, ptr %t6402, i64 1
  %t6404 = load i64, ptr %t6403
  %t6405 = load i64, ptr @"scheme.base:current-input-port"
  %t6406 = and i64 %t6405, -8
  %t6407 = inttoptr i64 %t6406 to ptr
  %t6408 = load i64, ptr %t6407
  %t6409 = inttoptr i64 %t6408 to ptr
  %t6410 = musttail call fastcc i64 %t6409(i64 %t6405, i64 1, i64 %t6404, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6410
}

define fastcc i64 @"scheme.base:code_1388"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6411 = icmp eq i64 %argc, 0
  br i1 %t6411, label %argok1776, label %arityerr1775
arityerr1775:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1776:
  %t6412 = and i64 %self, -8
  %t6413 = inttoptr i64 %t6412 to ptr
  %t6414 = getelementptr i64, ptr %t6413, i64 1
  %t6415 = load i64, ptr %t6414
  %t6416 = load i64, ptr @"scheme.base:current-input-port"
  %t6417 = and i64 %t6416, -8
  %t6418 = inttoptr i64 %t6417 to ptr
  %t6419 = load i64, ptr %t6418
  %t6420 = inttoptr i64 %t6419 to ptr
  %t6421 = call fastcc i64%t6420(i64 %t6416, i64 2, i64 %t6415, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6422 = and i64 %self, -8
  %t6423 = inttoptr i64 %t6422 to ptr
  %t6424 = getelementptr i64, ptr %t6423, i64 2
  %t6425 = load i64, ptr %t6424
  %t6426 = load i64, ptr @"scheme.base:close-port"
  %t6427 = and i64 %t6426, -8
  %t6428 = inttoptr i64 %t6427 to ptr
  %t6429 = load i64, ptr %t6428
  %t6430 = inttoptr i64 %t6429 to ptr
  %t6431 = musttail call fastcc i64 %t6430(i64 %t6426, i64 1, i64 %t6425, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6431
}

define fastcc i64 @"scheme.base:code:with-input-from-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6432 = icmp eq i64 %argc, 2
  br i1 %t6432, label %argok1778, label %arityerr1777
arityerr1777:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1778:
  %t6433 = load i64, ptr @"scheme.base:open-input-file"
  %t6434 = and i64 %t6433, -8
  %t6435 = inttoptr i64 %t6434 to ptr
  %t6436 = load i64, ptr %t6435
  %t6437 = inttoptr i64 %t6436 to ptr
  %t6438 = call fastcc i64%t6437(i64 %t6433, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6439 = load i64, ptr @"scheme.base:current-input-port"
  %t6440 = and i64 %t6439, -8
  %t6441 = inttoptr i64 %t6440 to ptr
  %t6442 = load i64, ptr %t6441
  %t6443 = inttoptr i64 %t6442 to ptr
  %t6444 = call fastcc i64%t6443(i64 %t6439, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6445 = call ptr @rt_alloc_words(i64 2)
  %t6446 = ptrtoint ptr %t6445 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1386" to i64), ptr %t6445
  %t6447 = getelementptr i64, ptr %t6445, i64 1
  store i64 %t6438, ptr %t6447
  %t6448 = or i64 %t6446, 4
  %t6449 = call ptr @rt_alloc_words(i64 3)
  %t6450 = ptrtoint ptr %t6449 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1388" to i64), ptr %t6449
  %t6451 = getelementptr i64, ptr %t6449, i64 1
  store i64 %t6444, ptr %t6451
  %t6452 = getelementptr i64, ptr %t6449, i64 2
  store i64 %t6438, ptr %t6452
  %t6453 = or i64 %t6450, 4
  %t6454 = load i64, ptr @"scheme.base:dynamic-wind"
  %t6455 = and i64 %t6454, -8
  %t6456 = inttoptr i64 %t6455 to ptr
  %t6457 = load i64, ptr %t6456
  %t6458 = inttoptr i64 %t6457 to ptr
  %t6459 = musttail call fastcc i64 %t6458(i64 %t6454, i64 3, i64 %t6448, i64 %a1, i64 %t6453, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6459
}

define fastcc i64 @"scheme.base:code:call-with-output-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6464 = icmp eq i64 %argc, 2
  br i1 %t6464, label %argok1780, label %arityerr1779
arityerr1779:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1780:
  %t6465 = load i64, ptr @"scheme.base:open-output-file"
  %t6466 = and i64 %t6465, -8
  %t6467 = inttoptr i64 %t6466 to ptr
  %t6468 = load i64, ptr %t6467
  %t6469 = inttoptr i64 %t6468 to ptr
  %t6470 = call fastcc i64%t6469(i64 %t6465, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6471 = load i64, ptr @"scheme.base:call-with-port"
  %t6472 = and i64 %t6471, -8
  %t6473 = inttoptr i64 %t6472 to ptr
  %t6474 = load i64, ptr %t6473
  %t6475 = inttoptr i64 %t6474 to ptr
  %t6476 = musttail call fastcc i64 %t6475(i64 %t6471, i64 2, i64 %t6470, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6476
}

define fastcc i64 @"scheme.base:code:call-with-input-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6481 = icmp eq i64 %argc, 2
  br i1 %t6481, label %argok1782, label %arityerr1781
arityerr1781:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1782:
  %t6482 = load i64, ptr @"scheme.base:open-input-file"
  %t6483 = and i64 %t6482, -8
  %t6484 = inttoptr i64 %t6483 to ptr
  %t6485 = load i64, ptr %t6484
  %t6486 = inttoptr i64 %t6485 to ptr
  %t6487 = call fastcc i64%t6486(i64 %t6482, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6488 = load i64, ptr @"scheme.base:call-with-port"
  %t6489 = and i64 %t6488, -8
  %t6490 = inttoptr i64 %t6489 to ptr
  %t6491 = load i64, ptr %t6490
  %t6492 = inttoptr i64 %t6491 to ptr
  %t6493 = musttail call fastcc i64 %t6492(i64 %t6488, i64 2, i64 %t6487, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6493
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
  store i64 ptrtoint (ptr @"scheme.base:code:complex?" to i64), ptr %t990
  %t992 = or i64 %t991, 4
  %t993 = call i64 @rt_root(i64 %t992)
  store i64 %t993, ptr @"scheme.base:complex?"
  ret i64 17
}

define i64 @"scheme.base:__init_48"() {
entry:
  %t998 = call ptr @rt_alloc_words(i64 1)
  %t999 = ptrtoint ptr %t998 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:exact-integer?" to i64), ptr %t998
  %t1000 = or i64 %t999, 4
  %t1001 = call i64 @rt_root(i64 %t1000)
  store i64 %t1001, ptr @"scheme.base:exact-integer?"
  ret i64 17
}

define i64 @"scheme.base:__init_49"() {
entry:
  %t1006 = call ptr @rt_alloc_words(i64 1)
  %t1007 = ptrtoint ptr %t1006 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rational?" to i64), ptr %t1006
  %t1008 = or i64 %t1007, 4
  %t1009 = call i64 @rt_root(i64 %t1008)
  store i64 %t1009, ptr @"scheme.base:rational?"
  ret i64 17
}

define i64 @"scheme.base:__init_50"() {
entry:
  %t1018 = call ptr @rt_alloc_words(i64 1)
  %t1019 = ptrtoint ptr %t1018 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:positive?" to i64), ptr %t1018
  %t1020 = or i64 %t1019, 4
  %t1021 = call i64 @rt_root(i64 %t1020)
  store i64 %t1021, ptr @"scheme.base:positive?"
  ret i64 17
}

define i64 @"scheme.base:__init_51"() {
entry:
  %t1030 = call ptr @rt_alloc_words(i64 1)
  %t1031 = ptrtoint ptr %t1030 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:negative?" to i64), ptr %t1030
  %t1032 = or i64 %t1031, 4
  %t1033 = call i64 @rt_root(i64 %t1032)
  store i64 %t1033, ptr @"scheme.base:negative?"
  ret i64 17
}

define i64 @"scheme.base:__init_52"() {
entry:
  %t1043 = call ptr @rt_alloc_words(i64 1)
  %t1044 = ptrtoint ptr %t1043 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:even?" to i64), ptr %t1043
  %t1045 = or i64 %t1044, 4
  %t1046 = call i64 @rt_root(i64 %t1045)
  store i64 %t1046, ptr @"scheme.base:even?"
  ret i64 17
}

define i64 @"scheme.base:__init_53"() {
entry:
  %t1057 = call ptr @rt_alloc_words(i64 1)
  %t1058 = ptrtoint ptr %t1057 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:odd?" to i64), ptr %t1057
  %t1059 = or i64 %t1058, 4
  %t1060 = call i64 @rt_root(i64 %t1059)
  store i64 %t1060, ptr @"scheme.base:odd?"
  ret i64 17
}

define i64 @"scheme.base:__init_54"() {
entry:
  %t1078 = call ptr @rt_alloc_words(i64 1)
  %t1079 = ptrtoint ptr %t1078 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:abs" to i64), ptr %t1078
  %t1080 = or i64 %t1079, 4
  %t1081 = call i64 @rt_root(i64 %t1080)
  store i64 %t1081, ptr @"scheme.base:abs"
  ret i64 17
}

define i64 @"scheme.base:__init_55"() {
entry:
  %t1092 = call ptr @rt_alloc_words(i64 1)
  %t1093 = ptrtoint ptr %t1092 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:square" to i64), ptr %t1092
  %t1094 = or i64 %t1093, 4
  %t1095 = call i64 @rt_root(i64 %t1094)
  store i64 %t1095, ptr @"scheme.base:square"
  ret i64 17
}

define i64 @"scheme.base:__init_56"() {
entry:
  %t1112 = call ptr @rt_alloc_words(i64 1)
  %t1113 = ptrtoint ptr %t1112 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%gcd2" to i64), ptr %t1112
  %t1114 = or i64 %t1113, 4
  %t1115 = call i64 @rt_root(i64 %t1114)
  store i64 %t1115, ptr @"scheme.base:%gcd2"
  ret i64 17
}

define i64 @"scheme.base:__init_57"() {
entry:
  %t1145 = call ptr @rt_alloc_words(i64 1)
  %t1146 = ptrtoint ptr %t1145 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%gcd-fold" to i64), ptr %t1145
  %t1147 = or i64 %t1146, 4
  %t1148 = call i64 @rt_root(i64 %t1147)
  store i64 %t1148, ptr @"scheme.base:%gcd-fold"
  ret i64 17
}

define i64 @"scheme.base:__init_58"() {
entry:
  %t1190 = call ptr @rt_alloc_words(i64 1)
  %t1191 = ptrtoint ptr %t1190 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%lcm-fold" to i64), ptr %t1190
  %t1192 = or i64 %t1191, 4
  %t1193 = call i64 @rt_root(i64 %t1192)
  store i64 %t1193, ptr @"scheme.base:%lcm-fold"
  ret i64 17
}

define i64 @"scheme.base:__init_59"() {
entry:
  %t1211 = call ptr @rt_alloc_words(i64 1)
  %t1212 = ptrtoint ptr %t1211 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:gcd" to i64), ptr %t1211
  %t1213 = or i64 %t1212, 4
  %t1214 = call i64 @rt_root(i64 %t1213)
  store i64 %t1214, ptr @"scheme.base:gcd"
  ret i64 17
}

define i64 @"scheme.base:__init_60"() {
entry:
  %t1232 = call ptr @rt_alloc_words(i64 1)
  %t1233 = ptrtoint ptr %t1232 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:lcm" to i64), ptr %t1232
  %t1234 = or i64 %t1233, 4
  %t1235 = call i64 @rt_root(i64 %t1234)
  store i64 %t1235, ptr @"scheme.base:lcm"
  ret i64 17
}

define i64 @"scheme.base:__init_61"() {
entry:
  %t1278 = call ptr @rt_alloc_words(i64 1)
  %t1279 = ptrtoint ptr %t1278 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%expt-exact" to i64), ptr %t1278
  %t1280 = or i64 %t1279, 4
  %t1281 = call i64 @rt_root(i64 %t1280)
  store i64 %t1281, ptr @"scheme.base:%expt-exact"
  ret i64 17
}

define i64 @"scheme.base:__init_62"() {
entry:
  %t1310 = call ptr @rt_alloc_words(i64 1)
  %t1311 = ptrtoint ptr %t1310 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:expt" to i64), ptr %t1310
  %t1312 = or i64 %t1311, 4
  %t1313 = call i64 @rt_root(i64 %t1312)
  store i64 %t1313, ptr @"scheme.base:expt"
  ret i64 17
}

define i64 @"scheme.base:__init_63"() {
entry:
  %t1339 = call ptr @rt_alloc_words(i64 1)
  %t1340 = ptrtoint ptr %t1339 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%isqrt-loop" to i64), ptr %t1339
  %t1341 = or i64 %t1340, 4
  %t1342 = call i64 @rt_root(i64 %t1341)
  store i64 %t1342, ptr @"scheme.base:%isqrt-loop"
  ret i64 17
}

define i64 @"scheme.base:__init_64"() {
entry:
  %t1358 = call ptr @rt_alloc_words(i64 1)
  %t1359 = ptrtoint ptr %t1358 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%isqrt" to i64), ptr %t1358
  %t1360 = or i64 %t1359, 4
  %t1361 = call i64 @rt_root(i64 %t1360)
  store i64 %t1361, ptr @"scheme.base:%isqrt"
  ret i64 17
}

define i64 @"scheme.base:__init_65"() {
entry:
  %t1392 = call ptr @rt_alloc_words(i64 1)
  %t1393 = ptrtoint ptr %t1392 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:exact-integer-sqrt" to i64), ptr %t1392
  %t1394 = or i64 %t1393, 4
  %t1395 = call i64 @rt_root(i64 %t1394)
  store i64 %t1395, ptr @"scheme.base:exact-integer-sqrt"
  ret i64 17
}

define i64 @"scheme.base:__init_66"() {
entry:
  %t1400 = call ptr @rt_alloc_words(i64 1)
  %t1401 = ptrtoint ptr %t1400 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:floor" to i64), ptr %t1400
  %t1402 = or i64 %t1401, 4
  %t1403 = call i64 @rt_root(i64 %t1402)
  store i64 %t1403, ptr @"scheme.base:floor"
  ret i64 17
}

define i64 @"scheme.base:__init_67"() {
entry:
  %t1408 = call ptr @rt_alloc_words(i64 1)
  %t1409 = ptrtoint ptr %t1408 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:ceiling" to i64), ptr %t1408
  %t1410 = or i64 %t1409, 4
  %t1411 = call i64 @rt_root(i64 %t1410)
  store i64 %t1411, ptr @"scheme.base:ceiling"
  ret i64 17
}

define i64 @"scheme.base:__init_68"() {
entry:
  %t1416 = call ptr @rt_alloc_words(i64 1)
  %t1417 = ptrtoint ptr %t1416 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:truncate" to i64), ptr %t1416
  %t1418 = or i64 %t1417, 4
  %t1419 = call i64 @rt_root(i64 %t1418)
  store i64 %t1419, ptr @"scheme.base:truncate"
  ret i64 17
}

define i64 @"scheme.base:__init_69"() {
entry:
  %t1424 = call ptr @rt_alloc_words(i64 1)
  %t1425 = ptrtoint ptr %t1424 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:round" to i64), ptr %t1424
  %t1426 = or i64 %t1425, 4
  %t1427 = call i64 @rt_root(i64 %t1426)
  store i64 %t1427, ptr @"scheme.base:round"
  ret i64 17
}

define i64 @"scheme.base:__init_70"() {
entry:
  %t1430 = call ptr @rt_alloc_words(i64 1)
  %t1431 = ptrtoint ptr %t1430 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:truncate-quotient" to i64), ptr %t1430
  %t1432 = or i64 %t1431, 4
  %t1433 = call i64 @rt_root(i64 %t1432)
  store i64 %t1433, ptr @"scheme.base:truncate-quotient"
  ret i64 17
}

define i64 @"scheme.base:__init_71"() {
entry:
  %t1436 = call ptr @rt_alloc_words(i64 1)
  %t1437 = ptrtoint ptr %t1436 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:truncate-remainder" to i64), ptr %t1436
  %t1438 = or i64 %t1437, 4
  %t1439 = call i64 @rt_root(i64 %t1438)
  store i64 %t1439, ptr @"scheme.base:truncate-remainder"
  ret i64 17
}

define i64 @"scheme.base:__init_72"() {
entry:
  %t1442 = call ptr @rt_alloc_words(i64 1)
  %t1443 = ptrtoint ptr %t1442 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:floor-remainder" to i64), ptr %t1442
  %t1444 = or i64 %t1443, 4
  %t1445 = call i64 @rt_root(i64 %t1444)
  store i64 %t1445, ptr @"scheme.base:floor-remainder"
  ret i64 17
}

define i64 @"scheme.base:__init_73"() {
entry:
  %t1457 = call ptr @rt_alloc_words(i64 1)
  %t1458 = ptrtoint ptr %t1457 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:floor-quotient" to i64), ptr %t1457
  %t1459 = or i64 %t1458, 4
  %t1460 = call i64 @rt_root(i64 %t1459)
  store i64 %t1460, ptr @"scheme.base:floor-quotient"
  ret i64 17
}

define i64 @"scheme.base:__init_74"() {
entry:
  %t1470 = call ptr @rt_alloc_words(i64 1)
  %t1471 = ptrtoint ptr %t1470 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:truncate/" to i64), ptr %t1470
  %t1472 = or i64 %t1471, 4
  %t1473 = call i64 @rt_root(i64 %t1472)
  store i64 %t1473, ptr @"scheme.base:truncate/"
  ret i64 17
}

define i64 @"scheme.base:__init_75"() {
entry:
  %t1488 = call ptr @rt_alloc_words(i64 1)
  %t1489 = ptrtoint ptr %t1488 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:floor/" to i64), ptr %t1488
  %t1490 = or i64 %t1489, 4
  %t1491 = call i64 @rt_root(i64 %t1490)
  store i64 %t1491, ptr @"scheme.base:floor/"
  ret i64 17
}

define i64 @"scheme.base:__init_76"() {
entry:
  %t1502 = call ptr @rt_alloc_words(i64 1)
  %t1503 = ptrtoint ptr %t1502 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:numerator" to i64), ptr %t1502
  %t1504 = or i64 %t1503, 4
  %t1505 = call i64 @rt_root(i64 %t1504)
  store i64 %t1505, ptr @"scheme.base:numerator"
  ret i64 17
}

define i64 @"scheme.base:__init_77"() {
entry:
  %t1519 = call ptr @rt_alloc_words(i64 1)
  %t1520 = ptrtoint ptr %t1519 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:denominator" to i64), ptr %t1519
  %t1521 = or i64 %t1520, 4
  %t1522 = call i64 @rt_root(i64 %t1521)
  store i64 %t1522, ptr @"scheme.base:denominator"
  ret i64 17
}

define i64 @"scheme.base:__init_78"() {
entry:
  %t1525 = call ptr @rt_alloc_words(i64 1)
  %t1526 = ptrtoint ptr %t1525 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:inexact" to i64), ptr %t1525
  %t1527 = or i64 %t1526, 4
  %t1528 = call i64 @rt_root(i64 %t1527)
  store i64 %t1528, ptr @"scheme.base:inexact"
  ret i64 17
}

define i64 @"scheme.base:__init_79"() {
entry:
  %t1531 = call ptr @rt_alloc_words(i64 1)
  %t1532 = ptrtoint ptr %t1531 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:exact" to i64), ptr %t1531
  %t1533 = or i64 %t1532, 4
  %t1534 = call i64 @rt_root(i64 %t1533)
  store i64 %t1534, ptr @"scheme.base:exact"
  ret i64 17
}

define i64 @"scheme.base:__init_80"() {
entry:
  %t1537 = call ptr @rt_alloc_words(i64 1)
  %t1538 = ptrtoint ptr %t1537 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:void" to i64), ptr %t1537
  %t1539 = or i64 %t1538, 4
  %t1540 = call i64 @rt_root(i64 %t1539)
  store i64 %t1540, ptr @"scheme.base:void"
  ret i64 17
}

define i64 @"scheme.base:__init_81"() {
entry:
  %t1553 = call ptr @rt_alloc_words(i64 1)
  %t1554 = ptrtoint ptr %t1553 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string" to i64), ptr %t1553
  %t1555 = or i64 %t1554, 4
  %t1556 = call i64 @rt_root(i64 %t1555)
  store i64 %t1556, ptr @"scheme.base:string"
  ret i64 17
}

define i64 @"scheme.base:__init_82"() {
entry:
  %t1570 = call ptr @rt_alloc_words(i64 1)
  %t1571 = ptrtoint ptr %t1570 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%str-concat" to i64), ptr %t1570
  %t1572 = or i64 %t1571, 4
  %t1573 = call i64 @rt_root(i64 %t1572)
  store i64 %t1573, ptr @"scheme.base:%str-concat"
  ret i64 17
}

define i64 @"scheme.base:__init_83"() {
entry:
  %t1593 = call ptr @rt_alloc_words(i64 1)
  %t1594 = ptrtoint ptr %t1593 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:chr-cmp" to i64), ptr %t1593
  %t1595 = or i64 %t1594, 4
  %t1596 = call i64 @rt_root(i64 %t1595)
  store i64 %t1596, ptr @"scheme.base:chr-cmp"
  ret i64 17
}

define i64 @"scheme.base:__init_84"() {
entry:
  %t1625 = call ptr @rt_alloc_words(i64 1)
  %t1626 = ptrtoint ptr %t1625 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char=?" to i64), ptr %t1625
  %t1627 = or i64 %t1626, 4
  %t1628 = call i64 @rt_root(i64 %t1627)
  store i64 %t1628, ptr @"scheme.base:char=?"
  ret i64 17
}

define i64 @"scheme.base:__init_85"() {
entry:
  %t1657 = call ptr @rt_alloc_words(i64 1)
  %t1658 = ptrtoint ptr %t1657 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char<?" to i64), ptr %t1657
  %t1659 = or i64 %t1658, 4
  %t1660 = call i64 @rt_root(i64 %t1659)
  store i64 %t1660, ptr @"scheme.base:char<?"
  ret i64 17
}

define i64 @"scheme.base:__init_86"() {
entry:
  %t1689 = call ptr @rt_alloc_words(i64 1)
  %t1690 = ptrtoint ptr %t1689 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char>?" to i64), ptr %t1689
  %t1691 = or i64 %t1690, 4
  %t1692 = call i64 @rt_root(i64 %t1691)
  store i64 %t1692, ptr @"scheme.base:char>?"
  ret i64 17
}

define i64 @"scheme.base:__init_87"() {
entry:
  %t1729 = call ptr @rt_alloc_words(i64 1)
  %t1730 = ptrtoint ptr %t1729 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char<=?" to i64), ptr %t1729
  %t1731 = or i64 %t1730, 4
  %t1732 = call i64 @rt_root(i64 %t1731)
  store i64 %t1732, ptr @"scheme.base:char<=?"
  ret i64 17
}

define i64 @"scheme.base:__init_88"() {
entry:
  %t1769 = call ptr @rt_alloc_words(i64 1)
  %t1770 = ptrtoint ptr %t1769 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char>=?" to i64), ptr %t1769
  %t1771 = or i64 %t1770, 4
  %t1772 = call i64 @rt_root(i64 %t1771)
  store i64 %t1772, ptr @"scheme.base:char>=?"
  ret i64 17
}

define i64 @"scheme.base:__init_89"() {
entry:
  %t1813 = call ptr @rt_alloc_words(i64 1)
  %t1814 = ptrtoint ptr %t1813 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string->list" to i64), ptr %t1813
  %t1815 = or i64 %t1814, 4
  %t1816 = call i64 @rt_root(i64 %t1815)
  store i64 %t1816, ptr @"scheme.base:string->list"
  ret i64 17
}

define i64 @"scheme.base:__init_90"() {
entry:
  %t1824 = call ptr @rt_alloc_words(i64 1)
  %t1825 = ptrtoint ptr %t1824 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:ns-digits" to i64), ptr %t1824
  %t1826 = or i64 %t1825, 4
  %t1827 = call i64 @rt_root(i64 %t1826)
  store i64 %t1827, ptr @"scheme.base:ns-digits"
  ret i64 17
}

define i64 @"scheme.base:__init_91"() {
entry:
  %t1855 = call ptr @rt_alloc_words(i64 1)
  %t1856 = ptrtoint ptr %t1855 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ns-digit-char" to i64), ptr %t1855
  %t1857 = or i64 %t1856, 4
  %t1858 = call i64 @rt_root(i64 %t1857)
  store i64 %t1858, ptr @"scheme.base:%ns-digit-char"
  ret i64 17
}

define i64 @"scheme.base:__init_92"() {
entry:
  %t1892 = call ptr @rt_alloc_words(i64 1)
  %t1893 = ptrtoint ptr %t1892 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:ns-digits-radix" to i64), ptr %t1892
  %t1894 = or i64 %t1893, 4
  %t1895 = call i64 @rt_root(i64 %t1894)
  store i64 %t1895, ptr @"scheme.base:ns-digits-radix"
  ret i64 17
}

define i64 @"scheme.base:__init_93"() {
entry:
  %t1928 = call ptr @rt_alloc_words(i64 1)
  %t1929 = ptrtoint ptr %t1928 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%radix-ok?" to i64), ptr %t1928
  %t1930 = or i64 %t1929, 4
  %t1931 = call i64 @rt_root(i64 %t1930)
  store i64 %t1931, ptr @"scheme.base:%radix-ok?"
  ret i64 17
}

define i64 @"scheme.base:__init_94"() {
entry:
  %t2019 = call ptr @rt_alloc_words(i64 1)
  %t2020 = ptrtoint ptr %t2019 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:number->string" to i64), ptr %t2019
  %t2021 = or i64 %t2020, 4
  %t2022 = call i64 @rt_root(i64 %t2021)
  store i64 %t2022, ptr @"scheme.base:number->string"
  ret i64 17
}

define i64 @"scheme.base:__init_95"() {
entry:
  %t2111 = call ptr @rt_alloc_words(i64 1)
  %t2112 = ptrtoint ptr %t2111 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%digit-in-radix" to i64), ptr %t2111
  %t2113 = or i64 %t2112, 4
  %t2114 = call i64 @rt_root(i64 %t2113)
  store i64 %t2114, ptr @"scheme.base:%digit-in-radix"
  ret i64 17
}

define i64 @"scheme.base:__init_96"() {
entry:
  %t2163 = call ptr @rt_alloc_words(i64 1)
  %t2164 = ptrtoint ptr %t2163 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%radix-digits" to i64), ptr %t2163
  %t2165 = or i64 %t2164, 4
  %t2166 = call i64 @rt_root(i64 %t2165)
  store i64 %t2166, ptr @"scheme.base:%radix-digits"
  ret i64 17
}

define i64 @"scheme.base:__init_97"() {
entry:
  %t2233 = call ptr @rt_alloc_words(i64 1)
  %t2234 = ptrtoint ptr %t2233 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%string->int" to i64), ptr %t2233
  %t2235 = or i64 %t2234, 4
  %t2236 = call i64 @rt_root(i64 %t2235)
  store i64 %t2236, ptr @"scheme.base:%string->int"
  ret i64 17
}

define i64 @"scheme.base:__init_98"() {
entry:
  %t2301 = call ptr @rt_alloc_words(i64 1)
  %t2302 = ptrtoint ptr %t2301 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string->number" to i64), ptr %t2301
  %t2303 = or i64 %t2302, 4
  %t2304 = call i64 @rt_root(i64 %t2303)
  store i64 %t2304, ptr @"scheme.base:string->number"
  ret i64 17
}

define i64 @"scheme.base:__init_99"() {
entry:
  %t2338 = call ptr @rt_alloc_words(i64 1)
  %t2339 = ptrtoint ptr %t2338 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error" to i64), ptr %t2338
  %t2340 = or i64 %t2339, 4
  %t2341 = call i64 @rt_root(i64 %t2340)
  store i64 %t2341, ptr @"scheme.base:error"
  ret i64 17
}

define i64 @"scheme.base:__init_100"() {
entry:
  %t2342 = call i64 @rt_root(i64 2)
  store i64 %t2342, ptr @"scheme.base:*winds*"
  ret i64 17
}

define i64 @"scheme.base:__init_101"() {
entry:
  %t2343 = call i64 @rt_root(i64 2)
  store i64 %t2343, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define i64 @"scheme.base:__init_102"() {
entry:
  %t2368 = call ptr @rt_alloc_words(i64 1)
  %t2369 = ptrtoint ptr %t2368 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%unwind-to" to i64), ptr %t2368
  %t2370 = or i64 %t2369, 4
  %t2371 = call i64 @rt_root(i64 %t2370)
  store i64 %t2371, ptr @"scheme.base:%unwind-to"
  ret i64 17
}

define i64 @"scheme.base:__init_103"() {
entry:
  %t2395 = call ptr @rt_alloc_words(i64 1)
  %t2396 = ptrtoint ptr %t2395 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:dynamic-wind" to i64), ptr %t2395
  %t2397 = or i64 %t2396, 4
  %t2398 = call i64 @rt_root(i64 %t2397)
  store i64 %t2398, ptr @"scheme.base:dynamic-wind"
  ret i64 17
}

define i64 @"scheme.base:__init_104"() {
entry:
  %t2459 = call ptr @rt_alloc_words(i64 1)
  %t2460 = ptrtoint ptr %t2459 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-current-continuation" to i64), ptr %t2459
  %t2461 = or i64 %t2460, 4
  %t2462 = call i64 @rt_root(i64 %t2461)
  store i64 %t2462, ptr @"scheme.base:call-with-current-continuation"
  ret i64 17
}

define i64 @"scheme.base:__init_105"() {
entry:
  %t2470 = call ptr @rt_alloc_words(i64 1)
  %t2471 = ptrtoint ptr %t2470 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call/cc" to i64), ptr %t2470
  %t2472 = or i64 %t2471, 4
  %t2473 = call i64 @rt_root(i64 %t2472)
  store i64 %t2473, ptr @"scheme.base:call/cc"
  ret i64 17
}

define i64 @"scheme.base:__init_106"() {
entry:
  %t2508 = call ptr @rt_alloc_words(i64 1)
  %t2509 = ptrtoint ptr %t2508 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%with-handler" to i64), ptr %t2508
  %t2510 = or i64 %t2509, 4
  %t2511 = call i64 @rt_root(i64 %t2510)
  store i64 %t2511, ptr @"scheme.base:%with-handler"
  ret i64 17
}

define i64 @"scheme.base:__init_107"() {
entry:
  %t2530 = call ptr @rt_alloc_words(i64 1)
  %t2531 = ptrtoint ptr %t2530 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:raise" to i64), ptr %t2530
  %t2532 = or i64 %t2531, 4
  %t2533 = call i64 @rt_root(i64 %t2532)
  store i64 %t2533, ptr @"scheme.base:raise"
  ret i64 17
}

define i64 @"scheme.base:__init_108"() {
entry:
  %t2536 = call ptr @rt_alloc_words(i64 1)
  %t2537 = ptrtoint ptr %t2536 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object?" to i64), ptr %t2536
  %t2538 = or i64 %t2537, 4
  %t2539 = call i64 @rt_root(i64 %t2538)
  store i64 %t2539, ptr @"scheme.base:error-object?"
  ret i64 17
}

define i64 @"scheme.base:__init_109"() {
entry:
  %t2542 = call ptr @rt_alloc_words(i64 1)
  %t2543 = ptrtoint ptr %t2542 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-message" to i64), ptr %t2542
  %t2544 = or i64 %t2543, 4
  %t2545 = call i64 @rt_root(i64 %t2544)
  store i64 %t2545, ptr @"scheme.base:error-object-message"
  ret i64 17
}

define i64 @"scheme.base:__init_110"() {
entry:
  %t2548 = call ptr @rt_alloc_words(i64 1)
  %t2549 = ptrtoint ptr %t2548 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-irritants" to i64), ptr %t2548
  %t2550 = or i64 %t2549, 4
  %t2551 = call i64 @rt_root(i64 %t2550)
  store i64 %t2551, ptr @"scheme.base:error-object-irritants"
  ret i64 17
}

define i64 @"scheme.base:__init_111"() {
entry:
  %t2633 = call ptr @rt_alloc_words(i64 1)
  %t2634 = ptrtoint ptr %t2633 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-parameter" to i64), ptr %t2633
  %t2635 = or i64 %t2634, 4
  %t2636 = call i64 @rt_root(i64 %t2635)
  store i64 %t2636, ptr @"scheme.base:make-parameter"
  ret i64 17
}

define i64 @"scheme.base:__init_112"() {
entry:
  %t2717 = call ptr @rt_alloc_words(i64 1)
  %t2718 = ptrtoint ptr %t2717 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%with-parameters" to i64), ptr %t2717
  %t2719 = or i64 %t2718, 4
  %t2720 = call i64 @rt_root(i64 %t2719)
  store i64 %t2720, ptr @"scheme.base:%with-parameters"
  ret i64 17
}

define i64 @"scheme.base:__init_113"() {
entry:
  %t2758 = call ptr @rt_alloc_words(i64 1)
  %t2759 = ptrtoint ptr %t2758 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->vector" to i64), ptr %t2758
  %t2760 = or i64 %t2759, 4
  %t2761 = call i64 @rt_root(i64 %t2760)
  store i64 %t2761, ptr @"scheme.base:list->vector"
  ret i64 17
}

define i64 @"scheme.base:__init_114"() {
entry:
  %t2779 = call ptr @rt_alloc_words(i64 1)
  %t2780 = ptrtoint ptr %t2779 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector" to i64), ptr %t2779
  %t2781 = or i64 %t2780, 4
  %t2782 = call i64 @rt_root(i64 %t2781)
  store i64 %t2782, ptr @"scheme.base:vector"
  ret i64 17
}

define i64 @"scheme.base:__init_115"() {
entry:
  %t2820 = call ptr @rt_alloc_words(i64 1)
  %t2821 = ptrtoint ptr %t2820 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->bytevector" to i64), ptr %t2820
  %t2822 = or i64 %t2821, 4
  %t2823 = call i64 @rt_root(i64 %t2822)
  store i64 %t2823, ptr @"scheme.base:list->bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_116"() {
entry:
  %t2841 = call ptr @rt_alloc_words(i64 1)
  %t2842 = ptrtoint ptr %t2841 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector" to i64), ptr %t2841
  %t2843 = or i64 %t2842, 4
  %t2844 = call i64 @rt_root(i64 %t2843)
  store i64 %t2844, ptr @"scheme.base:bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_117"() {
entry:
  %t2864 = call ptr @rt_alloc_words(i64 1)
  %t2865 = ptrtoint ptr %t2864 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:values" to i64), ptr %t2864
  %t2866 = or i64 %t2865, 4
  %t2867 = call i64 @rt_root(i64 %t2866)
  store i64 %t2867, ptr @"scheme.base:values"
  ret i64 17
}

define i64 @"scheme.base:__init_118"() {
entry:
  %t2909 = call ptr @rt_alloc_words(i64 1)
  %t2910 = ptrtoint ptr %t2909 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-values" to i64), ptr %t2909
  %t2911 = or i64 %t2910, 4
  %t2912 = call i64 @rt_root(i64 %t2911)
  store i64 %t2912, ptr @"scheme.base:call-with-values"
  ret i64 17
}

define i64 @"scheme.base:__init_119"() {
entry:
  %t2913 = call i64 @rt_root(i64 64)
  store i64 %t2913, ptr @"scheme.base:%ht-initial-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_120"() {
entry:
  %t2914 = call i64 @rt_root(i64 24)
  store i64 %t2914, ptr @"scheme.base:%ht-load-factor"
  ret i64 17
}

define i64 @"scheme.base:__init_121"() {
entry:
  %t2925 = call ptr @rt_alloc_words(i64 1)
  %t2926 = ptrtoint ptr %t2925 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-hash-table" to i64), ptr %t2925
  %t2927 = or i64 %t2926, 4
  %t2928 = call i64 @rt_root(i64 %t2927)
  store i64 %t2928, ptr @"scheme.base:make-hash-table"
  ret i64 17
}

define i64 @"scheme.base:__init_122"() {
entry:
  %t2931 = call ptr @rt_alloc_words(i64 1)
  %t2932 = ptrtoint ptr %t2931 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table?" to i64), ptr %t2931
  %t2933 = or i64 %t2932, 4
  %t2934 = call i64 @rt_root(i64 %t2933)
  store i64 %t2934, ptr @"scheme.base:hash-table?"
  ret i64 17
}

define i64 @"scheme.base:__init_123"() {
entry:
  %t2938 = call ptr @rt_alloc_words(i64 1)
  %t2939 = ptrtoint ptr %t2938 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-count" to i64), ptr %t2938
  %t2940 = or i64 %t2939, 4
  %t2941 = call i64 @rt_root(i64 %t2940)
  store i64 %t2941, ptr @"scheme.base:%ht-count"
  ret i64 17
}

define i64 @"scheme.base:__init_124"() {
entry:
  %t2945 = call ptr @rt_alloc_words(i64 1)
  %t2946 = ptrtoint ptr %t2945 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-buckets" to i64), ptr %t2945
  %t2947 = or i64 %t2946, 4
  %t2948 = call i64 @rt_root(i64 %t2947)
  store i64 %t2948, ptr @"scheme.base:%ht-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_125"() {
entry:
  %t2952 = call ptr @rt_alloc_words(i64 1)
  %t2953 = ptrtoint ptr %t2952 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-count!" to i64), ptr %t2952
  %t2954 = or i64 %t2953, 4
  %t2955 = call i64 @rt_root(i64 %t2954)
  store i64 %t2955, ptr @"scheme.base:%ht-set-count!"
  ret i64 17
}

define i64 @"scheme.base:__init_126"() {
entry:
  %t2959 = call ptr @rt_alloc_words(i64 1)
  %t2960 = ptrtoint ptr %t2959 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-buckets!" to i64), ptr %t2959
  %t2961 = or i64 %t2960, 4
  %t2962 = call i64 @rt_root(i64 %t2961)
  store i64 %t2962, ptr @"scheme.base:%ht-set-buckets!"
  ret i64 17
}

define i64 @"scheme.base:__init_127"() {
entry:
  %t2966 = call ptr @rt_alloc_words(i64 1)
  %t2967 = ptrtoint ptr %t2966 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-index" to i64), ptr %t2966
  %t2968 = or i64 %t2967, 4
  %t2969 = call i64 @rt_root(i64 %t2968)
  store i64 %t2969, ptr @"scheme.base:%ht-index"
  ret i64 17
}

define i64 @"scheme.base:__init_128"() {
entry:
  %t2985 = call ptr @rt_alloc_words(i64 1)
  %t2986 = ptrtoint ptr %t2985 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-assoc" to i64), ptr %t2985
  %t2987 = or i64 %t2986, 4
  %t2988 = call i64 @rt_root(i64 %t2987)
  store i64 %t2988, ptr @"scheme.base:%ht-assoc"
  ret i64 17
}

define i64 @"scheme.base:__init_129"() {
entry:
  %t3006 = call ptr @rt_alloc_words(i64 1)
  %t3007 = ptrtoint ptr %t3006 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-remove" to i64), ptr %t3006
  %t3008 = or i64 %t3007, 4
  %t3009 = call i64 @rt_root(i64 %t3008)
  store i64 %t3009, ptr @"scheme.base:%ht-remove"
  ret i64 17
}

define i64 @"scheme.base:__init_130"() {
entry:
  %t3033 = call ptr @rt_alloc_words(i64 1)
  %t3034 = ptrtoint ptr %t3033 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref/default" to i64), ptr %t3033
  %t3035 = or i64 %t3034, 4
  %t3036 = call i64 @rt_root(i64 %t3035)
  store i64 %t3036, ptr @"scheme.base:hash-table-ref/default"
  ret i64 17
}

define i64 @"scheme.base:__init_131"() {
entry:
  %t3059 = call ptr @rt_alloc_words(i64 1)
  %t3060 = ptrtoint ptr %t3059 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-contains?" to i64), ptr %t3059
  %t3061 = or i64 %t3060, 4
  %t3062 = call i64 @rt_root(i64 %t3061)
  store i64 %t3062, ptr @"scheme.base:hash-table-contains?"
  ret i64 17
}

define i64 @"scheme.base:__init_132"() {
entry:
  %t3093 = call ptr @rt_alloc_words(i64 1)
  %t3094 = ptrtoint ptr %t3093 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref" to i64), ptr %t3093
  %t3095 = or i64 %t3094, 4
  %t3096 = call i64 @rt_root(i64 %t3095)
  store i64 %t3096, ptr @"scheme.base:hash-table-ref"
  ret i64 17
}

define i64 @"scheme.base:__init_133"() {
entry:
  %t3180 = call ptr @rt_alloc_words(i64 1)
  %t3181 = ptrtoint ptr %t3180 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-set!" to i64), ptr %t3180
  %t3182 = or i64 %t3181, 4
  %t3183 = call i64 @rt_root(i64 %t3182)
  store i64 %t3183, ptr @"scheme.base:hash-table-set!"
  ret i64 17
}

define i64 @"scheme.base:__init_134"() {
entry:
  %t3233 = call ptr @rt_alloc_words(i64 1)
  %t3234 = ptrtoint ptr %t3233 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-delete!" to i64), ptr %t3233
  %t3235 = or i64 %t3234, 4
  %t3236 = call i64 @rt_root(i64 %t3235)
  store i64 %t3236, ptr @"scheme.base:hash-table-delete!"
  ret i64 17
}

define i64 @"scheme.base:__init_135"() {
entry:
  %t3340 = call ptr @rt_alloc_words(i64 1)
  %t3341 = ptrtoint ptr %t3340 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-grow!" to i64), ptr %t3340
  %t3342 = or i64 %t3341, 4
  %t3343 = call i64 @rt_root(i64 %t3342)
  store i64 %t3343, ptr @"scheme.base:%ht-grow!"
  ret i64 17
}

define i64 @"scheme.base:__init_136"() {
entry:
  %t3351 = call ptr @rt_alloc_words(i64 1)
  %t3352 = ptrtoint ptr %t3351 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-size" to i64), ptr %t3351
  %t3353 = or i64 %t3352, 4
  %t3354 = call i64 @rt_root(i64 %t3353)
  store i64 %t3354, ptr @"scheme.base:hash-table-size"
  ret i64 17
}

define i64 @"scheme.base:__init_137"() {
entry:
  %t3371 = call ptr @rt_alloc_words(i64 1)
  %t3372 = ptrtoint ptr %t3371 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-fold-buckets" to i64), ptr %t3371
  %t3373 = or i64 %t3372, 4
  %t3374 = call i64 @rt_root(i64 %t3373)
  store i64 %t3374, ptr @"scheme.base:%ht-fold-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_138"() {
entry:
  %t3422 = call ptr @rt_alloc_words(i64 1)
  %t3423 = ptrtoint ptr %t3422 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table->alist" to i64), ptr %t3422
  %t3424 = or i64 %t3423, 4
  %t3425 = call i64 @rt_root(i64 %t3424)
  store i64 %t3425, ptr @"scheme.base:hash-table->alist"
  ret i64 17
}

define i64 @"scheme.base:__init_139"() {
entry:
  %t3444 = call ptr @rt_alloc_words(i64 1)
  %t3445 = ptrtoint ptr %t3444 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-keys" to i64), ptr %t3444
  %t3446 = or i64 %t3445, 4
  %t3447 = call i64 @rt_root(i64 %t3446)
  store i64 %t3447, ptr @"scheme.base:hash-table-keys"
  ret i64 17
}

define i64 @"scheme.base:__init_140"() {
entry:
  %t3466 = call ptr @rt_alloc_words(i64 1)
  %t3467 = ptrtoint ptr %t3466 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-values" to i64), ptr %t3466
  %t3468 = or i64 %t3467, 4
  %t3469 = call i64 @rt_root(i64 %t3468)
  store i64 %t3469, ptr @"scheme.base:hash-table-values"
  ret i64 17
}

define i64 @"scheme.base:__init_141"() {
entry:
  %t3503 = call ptr @rt_alloc_words(i64 1)
  %t3504 = ptrtoint ptr %t3503 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-ws?" to i64), ptr %t3503
  %t3505 = or i64 %t3504, 4
  %t3506 = call i64 @rt_root(i64 %t3505)
  store i64 %t3506, ptr @"scheme.base:rd-ws?"
  ret i64 17
}

define i64 @"scheme.base:__init_142"() {
entry:
  %t3524 = call ptr @rt_alloc_words(i64 1)
  %t3525 = ptrtoint ptr %t3524 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-digit?" to i64), ptr %t3524
  %t3526 = or i64 %t3525, 4
  %t3527 = call i64 @rt_root(i64 %t3526)
  store i64 %t3527, ptr @"scheme.base:rd-digit?"
  ret i64 17
}

define i64 @"scheme.base:__init_143"() {
entry:
  %t3584 = call ptr @rt_alloc_words(i64 1)
  %t3585 = ptrtoint ptr %t3584 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-delim?" to i64), ptr %t3584
  %t3586 = or i64 %t3585, 4
  %t3587 = call i64 @rt_root(i64 %t3586)
  store i64 %t3587, ptr @"scheme.base:rd-delim?"
  ret i64 17
}

define i64 @"scheme.base:__init_144"() {
entry:
  %t3629 = call ptr @rt_alloc_words(i64 1)
  %t3630 = ptrtoint ptr %t3629 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-skip-line" to i64), ptr %t3629
  %t3631 = or i64 %t3630, 4
  %t3632 = call i64 @rt_root(i64 %t3631)
  store i64 %t3632, ptr @"scheme.base:rd-skip-line"
  ret i64 17
}

define i64 @"scheme.base:__init_145"() {
entry:
  %t3693 = call ptr @rt_alloc_words(i64 1)
  %t3694 = ptrtoint ptr %t3693 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-skip-ws" to i64), ptr %t3693
  %t3695 = or i64 %t3694, 4
  %t3696 = call i64 @rt_root(i64 %t3695)
  store i64 %t3696, ptr @"scheme.base:rd-skip-ws"
  ret i64 17
}

define i64 @"scheme.base:__init_146"() {
entry:
  %t3728 = call ptr @rt_alloc_words(i64 1)
  %t3729 = ptrtoint ptr %t3728 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-token-end" to i64), ptr %t3728
  %t3730 = or i64 %t3729, 4
  %t3731 = call i64 @rt_root(i64 %t3730)
  store i64 %t3731, ptr @"scheme.base:rd-token-end"
  ret i64 17
}

define i64 @"scheme.base:__init_147"() {
entry:
  %t3763 = call ptr @rt_alloc_words(i64 1)
  %t3764 = ptrtoint ptr %t3763 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-all-digits?" to i64), ptr %t3763
  %t3765 = or i64 %t3764, 4
  %t3766 = call i64 @rt_root(i64 %t3765)
  store i64 %t3766, ptr @"scheme.base:rd-all-digits?"
  ret i64 17
}

define i64 @"scheme.base:__init_148"() {
entry:
  %t3824 = call ptr @rt_alloc_words(i64 1)
  %t3825 = ptrtoint ptr %t3824 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-numeric?" to i64), ptr %t3824
  %t3826 = or i64 %t3825, 4
  %t3827 = call i64 @rt_root(i64 %t3826)
  store i64 %t3827, ptr @"scheme.base:rd-numeric?"
  ret i64 17
}

define i64 @"scheme.base:__init_149"() {
entry:
  %t3878 = call ptr @rt_alloc_words(i64 1)
  %t3879 = ptrtoint ptr %t3878 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-digits" to i64), ptr %t3878
  %t3880 = or i64 %t3879, 4
  %t3881 = call i64 @rt_root(i64 %t3880)
  store i64 %t3881, ptr @"scheme.base:rd-digits"
  ret i64 17
}

define i64 @"scheme.base:__init_150"() {
entry:
  %t3932 = call ptr @rt_alloc_words(i64 1)
  %t3933 = ptrtoint ptr %t3932 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-digits-neg" to i64), ptr %t3932
  %t3934 = or i64 %t3933, 4
  %t3935 = call i64 @rt_root(i64 %t3934)
  store i64 %t3935, ptr @"scheme.base:rd-digits-neg"
  ret i64 17
}

define i64 @"scheme.base:__init_151"() {
entry:
  %t3974 = call ptr @rt_alloc_words(i64 1)
  %t3975 = ptrtoint ptr %t3974 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-parse-int" to i64), ptr %t3974
  %t3976 = or i64 %t3975, 4
  %t3977 = call i64 @rt_root(i64 %t3976)
  store i64 %t3977, ptr @"scheme.base:rd-parse-int"
  ret i64 17
}

define i64 @"scheme.base:__init_152"() {
entry:
  %t3987 = call ptr @rt_alloc_words(i64 1)
  %t3988 = ptrtoint ptr %t3987 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-dotchar?" to i64), ptr %t3987
  %t3989 = or i64 %t3988, 4
  %t3990 = call i64 @rt_root(i64 %t3989)
  store i64 %t3990, ptr @"scheme.base:rd-dotchar?"
  ret i64 17
}

define i64 @"scheme.base:__init_153"() {
entry:
  %t4008 = call ptr @rt_alloc_words(i64 1)
  %t4009 = ptrtoint ptr %t4008 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-exp-char?" to i64), ptr %t4008
  %t4010 = or i64 %t4009, 4
  %t4011 = call i64 @rt_root(i64 %t4010)
  store i64 %t4011, ptr @"scheme.base:rd-exp-char?"
  ret i64 17
}

define i64 @"scheme.base:__init_154"() {
entry:
  %t4029 = call ptr @rt_alloc_words(i64 1)
  %t4030 = ptrtoint ptr %t4029 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-sign-char?" to i64), ptr %t4029
  %t4031 = or i64 %t4030, 4
  %t4032 = call i64 @rt_root(i64 %t4031)
  store i64 %t4032, ptr @"scheme.base:rd-sign-char?"
  ret i64 17
}

define i64 @"scheme.base:__init_155"() {
entry:
  %t4065 = call ptr @rt_alloc_words(i64 1)
  %t4066 = ptrtoint ptr %t4065 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-scan-digits" to i64), ptr %t4065
  %t4067 = or i64 %t4066, 4
  %t4068 = call i64 @rt_root(i64 %t4067)
  store i64 %t4068, ptr @"scheme.base:rd-scan-digits"
  ret i64 17
}

define i64 @"scheme.base:__init_156"() {
entry:
  %t4257 = call ptr @rt_alloc_words(i64 1)
  %t4258 = ptrtoint ptr %t4257 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-flonum?" to i64), ptr %t4257
  %t4259 = or i64 %t4258, 4
  %t4260 = call i64 @rt_root(i64 %t4259)
  store i64 %t4260, ptr @"scheme.base:rd-flonum?"
  ret i64 17
}

define i64 @"scheme.base:__init_157"() {
entry:
  %t4294 = call ptr @rt_alloc_words(i64 1)
  %t4295 = ptrtoint ptr %t4294 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-atom" to i64), ptr %t4294
  %t4296 = or i64 %t4295, 4
  %t4297 = call i64 @rt_root(i64 %t4296)
  store i64 %t4297, ptr @"scheme.base:rd-atom"
  ret i64 17
}

define i64 @"scheme.base:__init_158"() {
entry:
  %t4375 = call ptr @rt_alloc_words(i64 1)
  %t4376 = ptrtoint ptr %t4375 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-hex-digit" to i64), ptr %t4375
  %t4377 = or i64 %t4376, 4
  %t4378 = call i64 @rt_root(i64 %t4377)
  store i64 %t4378, ptr @"scheme.base:rd-hex-digit"
  ret i64 17
}

define i64 @"scheme.base:__init_159"() {
entry:
  %t4446 = call ptr @rt_alloc_words(i64 1)
  %t4447 = ptrtoint ptr %t4446 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-hex" to i64), ptr %t4446
  %t4448 = or i64 %t4447, 4
  %t4449 = call i64 @rt_root(i64 %t4448)
  store i64 %t4449, ptr @"scheme.base:rd-hex"
  ret i64 17
}

define i64 @"scheme.base:__init_160"() {
entry:
  %t4479 = call ptr @rt_alloc_words(i64 1)
  %t4480 = ptrtoint ptr %t4479 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-str-esc" to i64), ptr %t4479
  %t4481 = or i64 %t4480, 4
  %t4482 = call i64 @rt_root(i64 %t4481)
  store i64 %t4482, ptr @"scheme.base:rd-str-esc"
  ret i64 17
}

define i64 @"scheme.base:__init_161"() {
entry:
  %t4625 = call ptr @rt_alloc_words(i64 1)
  %t4626 = ptrtoint ptr %t4625 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-string" to i64), ptr %t4625
  %t4627 = or i64 %t4626, 4
  %t4628 = call i64 @rt_root(i64 %t4627)
  store i64 %t4628, ptr @"scheme.base:rd-string"
  ret i64 17
}

define i64 @"scheme.base:__init_162"() {
entry:
  %t4806 = call ptr @rt_alloc_words(i64 1)
  %t4807 = ptrtoint ptr %t4806 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-hash" to i64), ptr %t4806
  %t4808 = or i64 %t4807, 4
  %t4809 = call i64 @rt_root(i64 %t4808)
  store i64 %t4809, ptr @"scheme.base:rd-hash"
  ret i64 17
}

define i64 @"scheme.base:__init_163"() {
entry:
  %t4848 = call ptr @rt_alloc_words(i64 1)
  %t4849 = ptrtoint ptr %t4848 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-char-name" to i64), ptr %t4848
  %t4850 = or i64 %t4849, 4
  %t4851 = call i64 @rt_root(i64 %t4850)
  store i64 %t4851, ptr @"scheme.base:rd-char-name"
  ret i64 17
}

define i64 @"scheme.base:__init_164"() {
entry:
  %t4894 = call ptr @rt_alloc_words(i64 1)
  %t4895 = ptrtoint ptr %t4894 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-char" to i64), ptr %t4894
  %t4896 = or i64 %t4895, 4
  %t4897 = call i64 @rt_root(i64 %t4896)
  store i64 %t4897, ptr @"scheme.base:rd-char"
  ret i64 17
}

define i64 @"scheme.base:__init_165"() {
entry:
  %t4921 = call ptr @rt_alloc_words(i64 1)
  %t4922 = ptrtoint ptr %t4921 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-quote" to i64), ptr %t4921
  %t4923 = or i64 %t4922, 4
  %t4924 = call i64 @rt_root(i64 %t4923)
  store i64 %t4924, ptr @"scheme.base:rd-quote"
  ret i64 17
}

define i64 @"scheme.base:__init_166"() {
entry:
  %t4948 = call ptr @rt_alloc_words(i64 1)
  %t4949 = ptrtoint ptr %t4948 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-quasi" to i64), ptr %t4948
  %t4950 = or i64 %t4949, 4
  %t4951 = call i64 @rt_root(i64 %t4950)
  store i64 %t4951, ptr @"scheme.base:rd-quasi"
  ret i64 17
}

define i64 @"scheme.base:__init_167"() {
entry:
  %t5024 = call ptr @rt_alloc_words(i64 1)
  %t5025 = ptrtoint ptr %t5024 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-unquote" to i64), ptr %t5024
  %t5026 = or i64 %t5025, 4
  %t5027 = call i64 @rt_root(i64 %t5026)
  store i64 %t5027, ptr @"scheme.base:rd-unquote"
  ret i64 17
}

define i64 @"scheme.base:__init_168"() {
entry:
  %t5068 = call ptr @rt_alloc_words(i64 1)
  %t5069 = ptrtoint ptr %t5068 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-dot?" to i64), ptr %t5068
  %t5070 = or i64 %t5069, 4
  %t5071 = call i64 @rt_root(i64 %t5070)
  store i64 %t5071, ptr @"scheme.base:rd-dot?"
  ret i64 17
}

define i64 @"scheme.base:__init_169"() {
entry:
  %t5084 = call ptr @rt_alloc_words(i64 1)
  %t5085 = ptrtoint ptr %t5084 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-append-reverse" to i64), ptr %t5084
  %t5086 = or i64 %t5085, 4
  %t5087 = call i64 @rt_root(i64 %t5086)
  store i64 %t5087, ptr @"scheme.base:rd-append-reverse"
  ret i64 17
}

define i64 @"scheme.base:__init_170"() {
entry:
  %t5209 = call ptr @rt_alloc_words(i64 1)
  %t5210 = ptrtoint ptr %t5209 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-list" to i64), ptr %t5209
  %t5211 = or i64 %t5210, 4
  %t5212 = call i64 @rt_root(i64 %t5211)
  store i64 %t5212, ptr @"scheme.base:rd-list"
  ret i64 17
}

define i64 @"scheme.base:__init_171"() {
entry:
  %t5376 = call ptr @rt_alloc_words(i64 1)
  %t5377 = ptrtoint ptr %t5376 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-datum" to i64), ptr %t5376
  %t5378 = or i64 %t5377, 4
  %t5379 = call i64 @rt_root(i64 %t5378)
  store i64 %t5379, ptr @"scheme.base:rd-datum"
  ret i64 17
}

define i64 @"scheme.base:__init_172"() {
entry:
  %t5395 = call ptr @rt_alloc_words(i64 1)
  %t5396 = ptrtoint ptr %t5395 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-from-string" to i64), ptr %t5395
  %t5397 = or i64 %t5396, 4
  %t5398 = call i64 @rt_root(i64 %t5397)
  store i64 %t5398, ptr @"scheme.base:read-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_173"() {
entry:
  %t5465 = call ptr @rt_alloc_words(i64 1)
  %t5466 = ptrtoint ptr %t5465 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-all-from-string" to i64), ptr %t5465
  %t5467 = or i64 %t5466, 4
  %t5468 = call i64 @rt_root(i64 %t5467)
  store i64 %t5468, ptr @"scheme.base:read-all-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_174"() {
entry:
  %t5469 = call i64 @rt_root(i64 1)
  store i64 %t5469, ptr @"scheme.base:%port-rtd-cell"
  ret i64 17
}

define i64 @"scheme.base:__init_175"() {
entry:
  %t5478 = call ptr @rt_alloc_words(i64 1)
  %t5479 = ptrtoint ptr %t5478 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%port-rtd" to i64), ptr %t5478
  %t5480 = or i64 %t5479, 4
  %t5481 = call i64 @rt_root(i64 %t5480)
  store i64 %t5481, ptr @"scheme.base:%port-rtd"
  ret i64 17
}

define i64 @"scheme.base:__init_176"() {
entry:
  %t5496 = call ptr @rt_alloc_words(i64 1)
  %t5497 = ptrtoint ptr %t5496 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%make-port" to i64), ptr %t5496
  %t5498 = or i64 %t5497, 4
  %t5499 = call i64 @rt_root(i64 %t5498)
  store i64 %t5499, ptr @"scheme.base:%make-port"
  ret i64 17
}

define i64 @"scheme.base:__init_177"() {
entry:
  %t5508 = call ptr @rt_alloc_words(i64 1)
  %t5509 = ptrtoint ptr %t5508 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port?" to i64), ptr %t5508
  %t5510 = or i64 %t5509, 4
  %t5511 = call i64 @rt_root(i64 %t5510)
  store i64 %t5511, ptr @"scheme.base:port?"
  ret i64 17
}

define i64 @"scheme.base:__init_178"() {
entry:
  %t5521 = call ptr @rt_alloc_words(i64 1)
  %t5522 = ptrtoint ptr %t5521 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port?" to i64), ptr %t5521
  %t5523 = or i64 %t5522, 4
  %t5524 = call i64 @rt_root(i64 %t5523)
  store i64 %t5524, ptr @"scheme.base:input-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_179"() {
entry:
  %t5535 = call ptr @rt_alloc_words(i64 1)
  %t5536 = ptrtoint ptr %t5535 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port?" to i64), ptr %t5535
  %t5537 = or i64 %t5536, 4
  %t5538 = call i64 @rt_root(i64 %t5537)
  store i64 %t5538, ptr @"scheme.base:output-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_180"() {
entry:
  %t5546 = call ptr @rt_alloc_words(i64 1)
  %t5547 = ptrtoint ptr %t5546 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:textual-port?" to i64), ptr %t5546
  %t5548 = or i64 %t5547, 4
  %t5549 = call i64 @rt_root(i64 %t5548)
  store i64 %t5549, ptr @"scheme.base:textual-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_181"() {
entry:
  %t5552 = call ptr @rt_alloc_words(i64 1)
  %t5553 = ptrtoint ptr %t5552 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port-closed?" to i64), ptr %t5552
  %t5554 = or i64 %t5553, 4
  %t5555 = call i64 @rt_root(i64 %t5554)
  store i64 %t5555, ptr @"scheme.base:port-closed?"
  ret i64 17
}

define i64 @"scheme.base:__init_182"() {
entry:
  %t5566 = call ptr @rt_alloc_words(i64 1)
  %t5567 = ptrtoint ptr %t5566 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port-open?" to i64), ptr %t5566
  %t5568 = or i64 %t5567, 4
  %t5569 = call i64 @rt_root(i64 %t5568)
  store i64 %t5569, ptr @"scheme.base:input-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_183"() {
entry:
  %t5580 = call ptr @rt_alloc_words(i64 1)
  %t5581 = ptrtoint ptr %t5580 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port-open?" to i64), ptr %t5580
  %t5582 = or i64 %t5581, 4
  %t5583 = call i64 @rt_root(i64 %t5582)
  store i64 %t5583, ptr @"scheme.base:output-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_184"() {
entry:
  %t5609 = call ptr @rt_alloc_words(i64 1)
  %t5610 = ptrtoint ptr %t5609 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-input-port" to i64), ptr %t5609
  %t5611 = or i64 %t5610, 4
  %t5612 = call i64 @rt_root(i64 %t5611)
  store i64 %t5612, ptr @"scheme.base:%check-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_185"() {
entry:
  %t5638 = call ptr @rt_alloc_words(i64 1)
  %t5639 = ptrtoint ptr %t5638 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-output-port" to i64), ptr %t5638
  %t5640 = or i64 %t5639, 4
  %t5641 = call i64 @rt_root(i64 %t5640)
  store i64 %t5641, ptr @"scheme.base:%check-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_186"() {
entry:
  %t5647 = call ptr @rt_alloc_words(i64 1)
  %t5648 = ptrtoint ptr %t5647 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%port-buf" to i64), ptr %t5647
  %t5649 = or i64 %t5648, 4
  %t5650 = call i64 @rt_root(i64 %t5649)
  store i64 %t5650, ptr @"scheme.base:%port-buf"
  ret i64 17
}

define i64 @"scheme.base:__init_187"() {
entry:
  %t5658 = call ptr @rt_alloc_words(i64 1)
  %t5659 = ptrtoint ptr %t5658 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-input-string" to i64), ptr %t5658
  %t5660 = or i64 %t5659, 4
  %t5661 = call i64 @rt_root(i64 %t5660)
  store i64 %t5661, ptr @"scheme.base:open-input-string"
  ret i64 17
}

define i64 @"scheme.base:__init_188"() {
entry:
  %t5679 = call ptr @rt_alloc_words(i64 1)
  %t5680 = ptrtoint ptr %t5679 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-input-file" to i64), ptr %t5679
  %t5681 = or i64 %t5680, 4
  %t5682 = call i64 @rt_root(i64 %t5681)
  store i64 %t5682, ptr @"scheme.base:open-input-file"
  ret i64 17
}

define i64 @"scheme.base:__init_189"() {
entry:
  %t5707 = call ptr @rt_alloc_words(i64 1)
  %t5708 = ptrtoint ptr %t5707 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%port-at-eof?" to i64), ptr %t5707
  %t5709 = or i64 %t5708, 4
  %t5710 = call i64 @rt_root(i64 %t5709)
  store i64 %t5710, ptr @"scheme.base:%port-at-eof?"
  ret i64 17
}

define i64 @"scheme.base:__init_190"() {
entry:
  %t5744 = call ptr @rt_alloc_words(i64 1)
  %t5745 = ptrtoint ptr %t5744 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-char" to i64), ptr %t5744
  %t5746 = or i64 %t5745, 4
  %t5747 = call i64 @rt_root(i64 %t5746)
  store i64 %t5747, ptr @"scheme.base:read-char"
  ret i64 17
}

define i64 @"scheme.base:__init_191"() {
entry:
  %t5772 = call ptr @rt_alloc_words(i64 1)
  %t5773 = ptrtoint ptr %t5772 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:peek-char" to i64), ptr %t5772
  %t5774 = or i64 %t5773, 4
  %t5775 = call i64 @rt_root(i64 %t5774)
  store i64 %t5775, ptr @"scheme.base:peek-char"
  ret i64 17
}

define i64 @"scheme.base:__init_192"() {
entry:
  %t5897 = call ptr @rt_alloc_words(i64 1)
  %t5898 = ptrtoint ptr %t5897 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-line" to i64), ptr %t5897
  %t5899 = or i64 %t5898, 4
  %t5900 = call i64 @rt_root(i64 %t5899)
  store i64 %t5900, ptr @"scheme.base:read-line"
  ret i64 17
}

define i64 @"scheme.base:__init_193"() {
entry:
  %t5952 = call ptr @rt_alloc_words(i64 1)
  %t5953 = ptrtoint ptr %t5952 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-string" to i64), ptr %t5952
  %t5954 = or i64 %t5953, 4
  %t5955 = call i64 @rt_root(i64 %t5954)
  store i64 %t5955, ptr @"scheme.base:read-string"
  ret i64 17
}

define i64 @"scheme.base:__init_194"() {
entry:
  %t6006 = call ptr @rt_alloc_words(i64 1)
  %t6007 = ptrtoint ptr %t6006 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read" to i64), ptr %t6006
  %t6008 = or i64 %t6007, 4
  %t6009 = call i64 @rt_root(i64 %t6008)
  store i64 %t6009, ptr @"scheme.base:read"
  ret i64 17
}

define i64 @"scheme.base:__init_195"() {
entry:
  %t6027 = call ptr @rt_alloc_words(i64 1)
  %t6028 = ptrtoint ptr %t6027 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-output-file" to i64), ptr %t6027
  %t6029 = or i64 %t6028, 4
  %t6030 = call i64 @rt_root(i64 %t6029)
  store i64 %t6030, ptr @"scheme.base:open-output-file"
  ret i64 17
}

define i64 @"scheme.base:__init_196"() {
entry:
  %t6048 = call ptr @rt_alloc_words(i64 1)
  %t6049 = ptrtoint ptr %t6048 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-output-string" to i64), ptr %t6048
  %t6050 = or i64 %t6049, 4
  %t6051 = call i64 @rt_root(i64 %t6050)
  store i64 %t6051, ptr @"scheme.base:open-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_197"() {
entry:
  %t6082 = call ptr @rt_alloc_words(i64 1)
  %t6083 = ptrtoint ptr %t6082 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:get-output-string" to i64), ptr %t6082
  %t6084 = or i64 %t6083, 4
  %t6085 = call i64 @rt_root(i64 %t6084)
  store i64 %t6085, ptr @"scheme.base:get-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_198"() {
entry:
  %t6096 = call ptr @rt_alloc_words(i64 1)
  %t6097 = ptrtoint ptr %t6096 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:flush-output-port" to i64), ptr %t6096
  %t6098 = or i64 %t6097, 4
  %t6099 = call i64 @rt_root(i64 %t6098)
  store i64 %t6099, ptr @"scheme.base:flush-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_199"() {
entry:
  %t6128 = call ptr @rt_alloc_words(i64 1)
  %t6129 = ptrtoint ptr %t6128 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-port" to i64), ptr %t6128
  %t6130 = or i64 %t6129, 4
  %t6131 = call i64 @rt_root(i64 %t6130)
  store i64 %t6131, ptr @"scheme.base:close-port"
  ret i64 17
}

define i64 @"scheme.base:__init_200"() {
entry:
  %t6154 = call ptr @rt_alloc_words(i64 1)
  %t6155 = ptrtoint ptr %t6154 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-input-port" to i64), ptr %t6154
  %t6156 = or i64 %t6155, 4
  %t6157 = call i64 @rt_root(i64 %t6156)
  store i64 %t6157, ptr @"scheme.base:close-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_201"() {
entry:
  %t6180 = call ptr @rt_alloc_words(i64 1)
  %t6181 = ptrtoint ptr %t6180 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-output-port" to i64), ptr %t6180
  %t6182 = or i64 %t6181, 4
  %t6183 = call i64 @rt_root(i64 %t6182)
  store i64 %t6183, ptr @"scheme.base:close-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_202"() {
entry:
  %t6184 = call i64 @rt_root(i64 1)
  store i64 %t6184, ptr @"scheme.base:%stdout-port"
  ret i64 17
}

define i64 @"scheme.base:__init_203"() {
entry:
  %t6185 = call i64 @rt_root(i64 1)
  store i64 %t6185, ptr @"scheme.base:%stderr-port"
  ret i64 17
}

define i64 @"scheme.base:__init_204"() {
entry:
  %t6186 = call i64 @rt_root(i64 1)
  store i64 %t6186, ptr @"scheme.base:%stdin-port"
  ret i64 17
}

define i64 @"scheme.base:__init_205"() {
entry:
  %t6218 = call ptr @rt_alloc_words(i64 1)
  %t6219 = ptrtoint ptr %t6218 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-output-port" to i64), ptr %t6218
  %t6220 = or i64 %t6219, 4
  %t6221 = call i64 @rt_root(i64 %t6220)
  store i64 %t6221, ptr @"scheme.base:current-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_206"() {
entry:
  %t6250 = call ptr @rt_alloc_words(i64 1)
  %t6251 = ptrtoint ptr %t6250 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-error-port" to i64), ptr %t6250
  %t6252 = or i64 %t6251, 4
  %t6253 = call i64 @rt_root(i64 %t6252)
  store i64 %t6253, ptr @"scheme.base:current-error-port"
  ret i64 17
}

define i64 @"scheme.base:__init_207"() {
entry:
  %t6282 = call ptr @rt_alloc_words(i64 1)
  %t6283 = ptrtoint ptr %t6282 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-input-port" to i64), ptr %t6282
  %t6284 = or i64 %t6283, 4
  %t6285 = call i64 @rt_root(i64 %t6284)
  store i64 %t6285, ptr @"scheme.base:current-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_208"() {
entry:
  %t6332 = call ptr @rt_alloc_words(i64 1)
  %t6333 = ptrtoint ptr %t6332 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-port" to i64), ptr %t6332
  %t6334 = or i64 %t6333, 4
  %t6335 = call i64 @rt_root(i64 %t6334)
  store i64 %t6335, ptr @"scheme.base:call-with-port"
  ret i64 17
}

define i64 @"scheme.base:__init_209"() {
entry:
  %t6396 = call ptr @rt_alloc_words(i64 1)
  %t6397 = ptrtoint ptr %t6396 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-output-to-file" to i64), ptr %t6396
  %t6398 = or i64 %t6397, 4
  %t6399 = call i64 @rt_root(i64 %t6398)
  store i64 %t6399, ptr @"scheme.base:with-output-to-file"
  ret i64 17
}

define i64 @"scheme.base:__init_210"() {
entry:
  %t6460 = call ptr @rt_alloc_words(i64 1)
  %t6461 = ptrtoint ptr %t6460 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-input-from-file" to i64), ptr %t6460
  %t6462 = or i64 %t6461, 4
  %t6463 = call i64 @rt_root(i64 %t6462)
  store i64 %t6463, ptr @"scheme.base:with-input-from-file"
  ret i64 17
}

define i64 @"scheme.base:__init_211"() {
entry:
  %t6477 = call ptr @rt_alloc_words(i64 1)
  %t6478 = ptrtoint ptr %t6477 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-output-file" to i64), ptr %t6477
  %t6479 = or i64 %t6478, 4
  %t6480 = call i64 @rt_root(i64 %t6479)
  store i64 %t6480, ptr @"scheme.base:call-with-output-file"
  ret i64 17
}

define i64 @"scheme.base:__init_212"() {
entry:
  %t6494 = call ptr @rt_alloc_words(i64 1)
  %t6495 = ptrtoint ptr %t6494 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-input-file" to i64), ptr %t6494
  %t6496 = or i64 %t6495, 4
  %t6497 = call i64 @rt_root(i64 %t6496)
  store i64 %t6497, ptr @"scheme.base:call-with-input-file"
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
  call i64 @"scheme.base:__init_173"()
  call i64 @"scheme.base:__init_174"()
  call i64 @"scheme.base:__init_175"()
  call i64 @"scheme.base:__init_176"()
  call i64 @"scheme.base:__init_177"()
  call i64 @"scheme.base:__init_178"()
  call i64 @"scheme.base:__init_179"()
  call i64 @"scheme.base:__init_180"()
  call i64 @"scheme.base:__init_181"()
  call i64 @"scheme.base:__init_182"()
  call i64 @"scheme.base:__init_183"()
  call i64 @"scheme.base:__init_184"()
  call i64 @"scheme.base:__init_185"()
  call i64 @"scheme.base:__init_186"()
  call i64 @"scheme.base:__init_187"()
  call i64 @"scheme.base:__init_188"()
  call i64 @"scheme.base:__init_189"()
  call i64 @"scheme.base:__init_190"()
  call i64 @"scheme.base:__init_191"()
  call i64 @"scheme.base:__init_192"()
  call i64 @"scheme.base:__init_193"()
  call i64 @"scheme.base:__init_194"()
  call i64 @"scheme.base:__init_195"()
  call i64 @"scheme.base:__init_196"()
  call i64 @"scheme.base:__init_197"()
  call i64 @"scheme.base:__init_198"()
  call i64 @"scheme.base:__init_199"()
  call i64 @"scheme.base:__init_200"()
  call i64 @"scheme.base:__init_201"()
  call i64 @"scheme.base:__init_202"()
  call i64 @"scheme.base:__init_203"()
  call i64 @"scheme.base:__init_204"()
  call i64 @"scheme.base:__init_205"()
  call i64 @"scheme.base:__init_206"()
  call i64 @"scheme.base:__init_207"()
  call i64 @"scheme.base:__init_208"()
  call i64 @"scheme.base:__init_209"()
  call i64 @"scheme.base:__init_210"()
  call i64 @"scheme.base:__init_211"()
  call i64 @"scheme.base:__init_212"()
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

