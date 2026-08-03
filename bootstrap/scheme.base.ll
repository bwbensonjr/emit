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
@.str.lit.13 = private unnamed_addr constant [7 x i8] c"+inf.0\00"
@.str.lit.14 = private unnamed_addr constant [4 x i8] c"inf\00"
@.str.lit.15 = private unnamed_addr constant [7 x i8] c"-inf.0\00"
@.str.lit.16 = private unnamed_addr constant [5 x i8] c"-inf\00"
@.str.lit.17 = private unnamed_addr constant [7 x i8] c"+nan.0\00"
@.str.lit.18 = private unnamed_addr constant [4 x i8] c"nan\00"
@.str.lit.19 = private unnamed_addr constant [6 x i8] c"space\00"
@.str.lit.20 = private unnamed_addr constant [8 x i8] c"newline\00"
@.str.lit.21 = private unnamed_addr constant [4 x i8] c"tab\00"
@.str.lit.22 = private unnamed_addr constant [7 x i8] c"return\00"
@.str.lit.23 = private unnamed_addr constant [4 x i8] c"nul\00"
@.str.lit.24 = private unnamed_addr constant [5 x i8] c"null\00"
@.str.lit.25 = private unnamed_addr constant [7 x i8] c"delete\00"
@.str.lit.26 = private unnamed_addr constant [8 x i8] c"altmode\00"
@.str.lit.27 = private unnamed_addr constant [4 x i8] c"esc\00"
@.str.sym.28 = private unnamed_addr constant [6 x i8] c"quote\00"
@.str.sym.29 = private unnamed_addr constant [11 x i8] c"quasiquote\00"
@.str.sym.30 = private unnamed_addr constant [17 x i8] c"unquote-splicing\00"
@.str.sym.31 = private unnamed_addr constant [8 x i8] c"unquote\00"
@.str.lit.32 = private unnamed_addr constant [5 x i8] c"port\00"
@.str.lit.33 = private unnamed_addr constant [18 x i8] c"not an input port\00"
@.str.lit.34 = private unnamed_addr constant [15 x i8] c"port is closed\00"
@.str.lit.35 = private unnamed_addr constant [19 x i8] c"not an output port\00"
@.str.lit.36 = private unnamed_addr constant [15 x i8] c"port is closed\00"
@.str.sym.37 = private unnamed_addr constant [16 x i8] c"open-input-file\00"
@.str.lit.38 = private unnamed_addr constant [27 x i8] c"cannot open file for input\00"
@.str.sym.39 = private unnamed_addr constant [10 x i8] c"read-char\00"
@.str.sym.40 = private unnamed_addr constant [10 x i8] c"peek-char\00"
@.str.sym.41 = private unnamed_addr constant [10 x i8] c"read-line\00"
@.str.sym.42 = private unnamed_addr constant [12 x i8] c"read-string\00"
@.str.sym.43 = private unnamed_addr constant [5 x i8] c"read\00"
@.str.sym.44 = private unnamed_addr constant [17 x i8] c"open-output-file\00"
@.str.lit.45 = private unnamed_addr constant [28 x i8] c"cannot open file for output\00"
@.str.sym.46 = private unnamed_addr constant [19 x i8] c"open-output-string\00"
@.str.lit.47 = private unnamed_addr constant [34 x i8] c"cannot open an output string port\00"
@.str.sym.48 = private unnamed_addr constant [18 x i8] c"get-output-string\00"
@.str.lit.49 = private unnamed_addr constant [19 x i8] c"not an output port\00"
@.str.lit.50 = private unnamed_addr constant [18 x i8] c"not a string port\00"
@.str.sym.51 = private unnamed_addr constant [18 x i8] c"flush-output-port\00"
@.str.sym.52 = private unnamed_addr constant [11 x i8] c"close-port\00"
@.str.lit.53 = private unnamed_addr constant [11 x i8] c"not a port\00"
@.str.sym.54 = private unnamed_addr constant [17 x i8] c"close-input-port\00"
@.str.lit.55 = private unnamed_addr constant [18 x i8] c"not an input port\00"
@.str.sym.56 = private unnamed_addr constant [18 x i8] c"close-output-port\00"
@.str.lit.57 = private unnamed_addr constant [19 x i8] c"not an output port\00"
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
@"scheme.base:rd-nonfinite" = global i64 0
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
  %t2280 = load i64, ptr @"scheme.base:rd-nonfinite"
  %t2281 = and i64 %t2280, -8
  %t2282 = inttoptr i64 %t2281 to ptr
  %t2283 = load i64, ptr %t2282
  %t2284 = inttoptr i64 %t2283 to ptr
  %t2285 = call fastcc i64%t2284(i64 %t2280, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2286 = icmp ne i64 %t2285, 1
  br i1 %t2286, label %then663, label %else664
then663:
  ret i64 %t2285
else664:
  %t2287 = load i64, ptr @"scheme.base:rd-flonum?"
  %t2288 = and i64 %t2287, -8
  %t2289 = inttoptr i64 %t2288 to ptr
  %t2290 = load i64, ptr %t2289
  %t2291 = inttoptr i64 %t2290 to ptr
  %t2292 = call fastcc i64%t2291(i64 %t2287, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2293 = icmp ne i64 %t2292, 1
  br i1 %t2293, label %then665, label %else666
then665:
  %t2294 = call i64 @rt_string_to_flonum(i64 %a0)
  ret i64 %t2294
else666:
  ret i64 1
else660:
  %t2295 = load i64, ptr @"scheme.base:%string->int"
  %t2296 = and i64 %t2295, -8
  %t2297 = inttoptr i64 %t2296 to ptr
  %t2298 = load i64, ptr %t2297
  %t2299 = inttoptr i64 %t2298 to ptr
  %t2300 = musttail call fastcc i64 %t2299(i64 %t2295, i64 2, i64 %a0, i64 %t2251, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2300
else655:
  %t2301 = call i64 @rt_make_string(ptr @.str.lit.8, i64 33)
  %t2302 = load i64, ptr @"scheme.base:error"
  %t2303 = and i64 %t2302, -8
  %t2304 = inttoptr i64 %t2303 to ptr
  %t2305 = load i64, ptr %t2304
  %t2306 = inttoptr i64 %t2305 to ptr
  %t2307 = musttail call fastcc i64 %t2306(i64 %t2302, i64 2, i64 %t2301, i64 %t2251, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2307
}

define fastcc i64 @"scheme.base:code:error"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2312 = icmp sge i64 %argc, 1
  br i1 %t2312, label %argok668, label %arityerr667
arityerr667:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok668:
  %t2313 = call ptr @rt_alloc_words(i64 8)
  %t2314 = getelementptr i64, ptr %t2313, i64 0
  store i64 %a0, ptr %t2314
  %t2315 = getelementptr i64, ptr %t2313, i64 1
  store i64 %a1, ptr %t2315
  %t2316 = getelementptr i64, ptr %t2313, i64 2
  store i64 %a2, ptr %t2316
  %t2317 = getelementptr i64, ptr %t2313, i64 3
  store i64 %a3, ptr %t2317
  %t2318 = getelementptr i64, ptr %t2313, i64 4
  store i64 %a4, ptr %t2318
  %t2319 = getelementptr i64, ptr %t2313, i64 5
  store i64 %a5, ptr %t2319
  %t2320 = getelementptr i64, ptr %t2313, i64 6
  store i64 %a6, ptr %t2320
  %t2321 = getelementptr i64, ptr %t2313, i64 7
  store i64 %a7, ptr %t2321
  %t2322 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2313, ptr %overflow)
  %t2323 = call i64 @rt_string_p(i64 %a0)
  %t2324 = icmp ne i64 %t2323, 1
  br i1 %t2324, label %then669, label %else670
then669:
  %t2325 = call i64 @rt_make_error_object(i64 %a0, i64 %t2322)
  %t2326 = load i64, ptr @"scheme.base:raise"
  %t2327 = and i64 %t2326, -8
  %t2328 = inttoptr i64 %t2327 to ptr
  %t2329 = load i64, ptr %t2328
  %t2330 = inttoptr i64 %t2329 to ptr
  %t2331 = musttail call fastcc i64 %t2330(i64 %t2326, i64 1, i64 %t2325, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2331
else670:
  %t2332 = call i64 @rt_symbol_to_string(i64 %a0)
  %t2333 = call i64 @rt_make_string(ptr @.str.lit.9, i64 2)
  %t2334 = call i64 @rt_car(i64 %t2322)
  %t2335 = call i64 @rt_string_append(i64 %t2333, i64 %t2334)
  %t2336 = call i64 @rt_string_append(i64 %t2332, i64 %t2335)
  %t2337 = call i64 @rt_cdr(i64 %t2322)
  %t2338 = call i64 @rt_make_error_object(i64 %t2336, i64 %t2337)
  %t2339 = load i64, ptr @"scheme.base:raise"
  %t2340 = and i64 %t2339, -8
  %t2341 = inttoptr i64 %t2340 to ptr
  %t2342 = load i64, ptr %t2341
  %t2343 = inttoptr i64 %t2342 to ptr
  %t2344 = musttail call fastcc i64 %t2343(i64 %t2339, i64 1, i64 %t2338, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2344
}

define fastcc i64 @"scheme.base:code:%unwind-to"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2351 = icmp eq i64 %argc, 1
  br i1 %t2351, label %argok672, label %arityerr671
arityerr671:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok672:
  %t2352 = load i64, ptr @"scheme.base:*winds*"
  %t2353 = call i64 @rt_eq_p(i64 %t2352, i64 %a0)
  %t2354 = icmp ne i64 %t2353, 1
  br i1 %t2354, label %then673, label %else674
then673:
  ret i64 257
else674:
  %t2355 = load i64, ptr @"scheme.base:*winds*"
  %t2356 = call i64 @rt_null_p(i64 %t2355)
  %t2357 = icmp ne i64 %t2356, 1
  br i1 %t2357, label %then675, label %else676
then675:
  ret i64 257
else676:
  %t2358 = load i64, ptr @"scheme.base:*winds*"
  %t2359 = call i64 @rt_car(i64 %t2358)
  %t2360 = load i64, ptr @"scheme.base:*winds*"
  %t2361 = call i64 @rt_cdr(i64 %t2360)
  %t2362 = call i64 @rt_root(i64 %t2361)
  store i64 %t2362, ptr @"scheme.base:*winds*"
  %t2363 = call i64 @rt_cdr(i64 %t2359)
  %t2364 = and i64 %t2363, -8
  %t2365 = inttoptr i64 %t2364 to ptr
  %t2366 = load i64, ptr %t2365
  %t2367 = inttoptr i64 %t2366 to ptr
  %t2368 = call fastcc i64%t2367(i64 %t2363, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2369 = load i64, ptr @"scheme.base:%unwind-to"
  %t2370 = and i64 %t2369, -8
  %t2371 = inttoptr i64 %t2370 to ptr
  %t2372 = load i64, ptr %t2371
  %t2373 = inttoptr i64 %t2372 to ptr
  %t2374 = musttail call fastcc i64 %t2373(i64 %t2369, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2374
}

define fastcc i64 @"scheme.base:code:dynamic-wind"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2379 = icmp eq i64 %argc, 3
  br i1 %t2379, label %argok678, label %arityerr677
arityerr677:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok678:
  %t2380 = and i64 %a0, -8
  %t2381 = inttoptr i64 %t2380 to ptr
  %t2382 = load i64, ptr %t2381
  %t2383 = inttoptr i64 %t2382 to ptr
  %t2384 = call fastcc i64%t2383(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2385 = call i64 @rt_cons(i64 %a0, i64 %a2)
  %t2386 = load i64, ptr @"scheme.base:*winds*"
  %t2387 = call i64 @rt_cons(i64 %t2385, i64 %t2386)
  %t2388 = call i64 @rt_root(i64 %t2387)
  store i64 %t2388, ptr @"scheme.base:*winds*"
  %t2389 = and i64 %a1, -8
  %t2390 = inttoptr i64 %t2389 to ptr
  %t2391 = load i64, ptr %t2390
  %t2392 = inttoptr i64 %t2391 to ptr
  %t2393 = call fastcc i64%t2392(i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2394 = load i64, ptr @"scheme.base:*winds*"
  %t2395 = call i64 @rt_cdr(i64 %t2394)
  %t2396 = call i64 @rt_root(i64 %t2395)
  store i64 %t2396, ptr @"scheme.base:*winds*"
  %t2397 = and i64 %a2, -8
  %t2398 = inttoptr i64 %t2397 to ptr
  %t2399 = load i64, ptr %t2398
  %t2400 = inttoptr i64 %t2399 to ptr
  %t2401 = call fastcc i64%t2400(i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2393
}

define fastcc i64 @"scheme.base:code_550"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2406 = icmp eq i64 %argc, 1
  br i1 %t2406, label %argok680, label %arityerr679
arityerr679:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok680:
  %t2407 = and i64 %self, -8
  %t2408 = inttoptr i64 %t2407 to ptr
  %t2409 = getelementptr i64, ptr %t2408, i64 1
  %t2410 = load i64, ptr %t2409
  %t2411 = call i64 @rt_escape_live_p(i64 %t2410)
  %t2412 = icmp ne i64 %t2411, 1
  br i1 %t2412, label %then681, label %else682
then681:
  %t2413 = and i64 %self, -8
  %t2414 = inttoptr i64 %t2413 to ptr
  %t2415 = getelementptr i64, ptr %t2414, i64 2
  %t2416 = load i64, ptr %t2415
  %t2417 = load i64, ptr @"scheme.base:%unwind-to"
  %t2418 = and i64 %t2417, -8
  %t2419 = inttoptr i64 %t2418 to ptr
  %t2420 = load i64, ptr %t2419
  %t2421 = inttoptr i64 %t2420 to ptr
  %t2422 = call fastcc i64%t2421(i64 %t2417, i64 1, i64 %t2416, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2423 = and i64 %self, -8
  %t2424 = inttoptr i64 %t2423 to ptr
  %t2425 = getelementptr i64, ptr %t2424, i64 1
  %t2426 = load i64, ptr %t2425
  %t2427 = call i64 @rt_escape_to(i64 %t2426, i64 %a0)
  br label %merge683
else682:
  br label %merge683
merge683:
  %t2428 = phi i64 [ %t2427, %then681 ], [ 1, %else682 ]
  %t2429 = call i64 @rt_intern(ptr @.str.sym.10)
  %t2430 = call i64 @rt_make_string(ptr @.str.lit.11, i64 39)
  %t2431 = load i64, ptr @"scheme.base:error"
  %t2432 = and i64 %t2431, -8
  %t2433 = inttoptr i64 %t2432 to ptr
  %t2434 = load i64, ptr %t2433
  %t2435 = inttoptr i64 %t2434 to ptr
  %t2436 = musttail call fastcc i64 %t2435(i64 %t2431, i64 2, i64 %t2429, i64 %t2430, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2436
}

define fastcc i64 @"scheme.base:code_548"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2437 = icmp eq i64 %argc, 0
  br i1 %t2437, label %argok685, label %arityerr684
arityerr684:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok685:
  %t2438 = call i64 @rt_escape_frame()
  %t2439 = and i64 %self, -8
  %t2440 = inttoptr i64 %t2439 to ptr
  %t2441 = getelementptr i64, ptr %t2440, i64 2
  %t2442 = load i64, ptr %t2441
  %t2443 = call ptr @rt_alloc_words(i64 3)
  %t2444 = ptrtoint ptr %t2443 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_550" to i64), ptr %t2443
  %t2445 = getelementptr i64, ptr %t2443, i64 1
  store i64 %t2438, ptr %t2445
  %t2446 = getelementptr i64, ptr %t2443, i64 2
  store i64 %t2442, ptr %t2446
  %t2447 = or i64 %t2444, 4
  %t2448 = and i64 %self, -8
  %t2449 = inttoptr i64 %t2448 to ptr
  %t2450 = getelementptr i64, ptr %t2449, i64 1
  %t2451 = load i64, ptr %t2450
  %t2452 = and i64 %t2451, -8
  %t2453 = inttoptr i64 %t2452 to ptr
  %t2454 = load i64, ptr %t2453
  %t2455 = inttoptr i64 %t2454 to ptr
  %t2456 = musttail call fastcc i64 %t2455(i64 %t2451, i64 1, i64 %t2447, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2456
}

define fastcc i64 @"scheme.base:code:call-with-current-continuation"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2457 = icmp eq i64 %argc, 1
  br i1 %t2457, label %argok687, label %arityerr686
arityerr686:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok687:
  %t2458 = load i64, ptr @"scheme.base:*winds*"
  %t2459 = call ptr @rt_alloc_words(i64 3)
  %t2460 = ptrtoint ptr %t2459 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_548" to i64), ptr %t2459
  %t2461 = getelementptr i64, ptr %t2459, i64 1
  store i64 %a0, ptr %t2461
  %t2462 = getelementptr i64, ptr %t2459, i64 2
  store i64 %t2458, ptr %t2462
  %t2463 = or i64 %t2460, 4
  %t2464 = call i64 @rt_run_guarded(ptr @__apply0, i64 %t2463)
  %t2465 = call i64 @rt_cdr(i64 %t2464)
  ret i64 %t2465
}

define fastcc i64 @"scheme.base:code:call/cc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2470 = icmp eq i64 %argc, 1
  br i1 %t2470, label %argok689, label %arityerr688
arityerr688:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok689:
  %t2471 = load i64, ptr @"scheme.base:call-with-current-continuation"
  %t2472 = and i64 %t2471, -8
  %t2473 = inttoptr i64 %t2472 to ptr
  %t2474 = load i64, ptr %t2473
  %t2475 = inttoptr i64 %t2474 to ptr
  %t2476 = musttail call fastcc i64 %t2475(i64 %t2471, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2476
}

define fastcc i64 @"scheme.base:code_558"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2481 = icmp eq i64 %argc, 0
  br i1 %t2481, label %argok691, label %arityerr690
arityerr690:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok691:
  %t2482 = and i64 %self, -8
  %t2483 = inttoptr i64 %t2482 to ptr
  %t2484 = getelementptr i64, ptr %t2483, i64 1
  %t2485 = load i64, ptr %t2484
  %t2486 = and i64 %self, -8
  %t2487 = inttoptr i64 %t2486 to ptr
  %t2488 = getelementptr i64, ptr %t2487, i64 2
  %t2489 = load i64, ptr %t2488
  %t2490 = call i64 @rt_cons(i64 %t2485, i64 %t2489)
  %t2491 = call i64 @rt_root(i64 %t2490)
  store i64 %t2491, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code_560"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2492 = icmp eq i64 %argc, 0
  br i1 %t2492, label %argok693, label %arityerr692
arityerr692:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok693:
  %t2493 = and i64 %self, -8
  %t2494 = inttoptr i64 %t2493 to ptr
  %t2495 = getelementptr i64, ptr %t2494, i64 1
  %t2496 = load i64, ptr %t2495
  %t2497 = call i64 @rt_root(i64 %t2496)
  store i64 %t2497, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code:%with-handler"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2498 = icmp eq i64 %argc, 2
  br i1 %t2498, label %argok695, label %arityerr694
arityerr694:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok695:
  %t2499 = load i64, ptr @"scheme.base:*handlers*"
  %t2500 = call ptr @rt_alloc_words(i64 3)
  %t2501 = ptrtoint ptr %t2500 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_558" to i64), ptr %t2500
  %t2502 = getelementptr i64, ptr %t2500, i64 1
  store i64 %a0, ptr %t2502
  %t2503 = getelementptr i64, ptr %t2500, i64 2
  store i64 %t2499, ptr %t2503
  %t2504 = or i64 %t2501, 4
  %t2505 = call ptr @rt_alloc_words(i64 2)
  %t2506 = ptrtoint ptr %t2505 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_560" to i64), ptr %t2505
  %t2507 = getelementptr i64, ptr %t2505, i64 1
  store i64 %t2499, ptr %t2507
  %t2508 = or i64 %t2506, 4
  %t2509 = load i64, ptr @"scheme.base:dynamic-wind"
  %t2510 = and i64 %t2509, -8
  %t2511 = inttoptr i64 %t2510 to ptr
  %t2512 = load i64, ptr %t2511
  %t2513 = inttoptr i64 %t2512 to ptr
  %t2514 = musttail call fastcc i64 %t2513(i64 %t2509, i64 3, i64 %t2504, i64 %a1, i64 %t2508, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2514
}

define fastcc i64 @"scheme.base:code:raise"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2519 = icmp eq i64 %argc, 1
  br i1 %t2519, label %argok697, label %arityerr696
arityerr696:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok697:
  %t2520 = load i64, ptr @"scheme.base:*handlers*"
  %t2521 = call i64 @rt_null_p(i64 %t2520)
  %t2522 = icmp ne i64 %t2521, 1
  br i1 %t2522, label %then698, label %else699
then698:
  %t2523 = call i64 @rt_raise(i64 %a0)
  ret i64 %t2523
else699:
  %t2524 = load i64, ptr @"scheme.base:*handlers*"
  %t2525 = call i64 @rt_car(i64 %t2524)
  %t2526 = load i64, ptr @"scheme.base:*handlers*"
  %t2527 = load i64, ptr @"scheme.base:*handlers*"
  %t2528 = call i64 @rt_cdr(i64 %t2527)
  %t2529 = call i64 @rt_root(i64 %t2528)
  store i64 %t2529, ptr @"scheme.base:*handlers*"
  %t2530 = and i64 %t2525, -8
  %t2531 = inttoptr i64 %t2530 to ptr
  %t2532 = load i64, ptr %t2531
  %t2533 = inttoptr i64 %t2532 to ptr
  %t2534 = call fastcc i64%t2533(i64 %t2525, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2535 = call i64 @rt_root(i64 %t2526)
  store i64 %t2535, ptr @"scheme.base:*handlers*"
  %t2536 = call i64 @rt_raise(i64 %a0)
  ret i64 %t2536
}

define fastcc i64 @"scheme.base:code:error-object?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2541 = icmp eq i64 %argc, 1
  br i1 %t2541, label %argok701, label %arityerr700
arityerr700:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok701:
  %t2542 = call i64 @rt_error_object_p(i64 %a0)
  ret i64 %t2542
}

define fastcc i64 @"scheme.base:code:error-object-message"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2547 = icmp eq i64 %argc, 1
  br i1 %t2547, label %argok703, label %arityerr702
arityerr702:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok703:
  %t2548 = call i64 @rt_error_object_message(i64 %a0)
  ret i64 %t2548
}

define fastcc i64 @"scheme.base:code:error-object-irritants"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2553 = icmp eq i64 %argc, 1
  br i1 %t2553, label %argok705, label %arityerr704
arityerr704:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok705:
  %t2554 = call i64 @rt_error_object_irritants(i64 %a0)
  ret i64 %t2554
}

define fastcc i64 @"scheme.base:code_580"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2559 = icmp eq i64 %argc, 1
  br i1 %t2559, label %argok707, label %arityerr706
arityerr706:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok707:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_582"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2560 = icmp eq i64 %argc, 1
  br i1 %t2560, label %argok709, label %arityerr708
arityerr708:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok709:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_584"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2561 = icmp sge i64 %argc, 0
  br i1 %t2561, label %argok711, label %arityerr710
arityerr710:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok711:
  %t2562 = call ptr @rt_alloc_words(i64 8)
  %t2563 = getelementptr i64, ptr %t2562, i64 0
  store i64 %a0, ptr %t2563
  %t2564 = getelementptr i64, ptr %t2562, i64 1
  store i64 %a1, ptr %t2564
  %t2565 = getelementptr i64, ptr %t2562, i64 2
  store i64 %a2, ptr %t2565
  %t2566 = getelementptr i64, ptr %t2562, i64 3
  store i64 %a3, ptr %t2566
  %t2567 = getelementptr i64, ptr %t2562, i64 4
  store i64 %a4, ptr %t2567
  %t2568 = getelementptr i64, ptr %t2562, i64 5
  store i64 %a5, ptr %t2568
  %t2569 = getelementptr i64, ptr %t2562, i64 6
  store i64 %a6, ptr %t2569
  %t2570 = getelementptr i64, ptr %t2562, i64 7
  store i64 %a7, ptr %t2570
  %t2571 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2562, ptr %overflow)
  %t2572 = call i64 @rt_null_p(i64 %t2571)
  %t2573 = icmp ne i64 %t2572, 1
  br i1 %t2573, label %then712, label %else713
then712:
  %t2574 = and i64 %self, -8
  %t2575 = inttoptr i64 %t2574 to ptr
  %t2576 = getelementptr i64, ptr %t2575, i64 1
  %t2577 = load i64, ptr %t2576
  %t2578 = call i64 @rt_vector_ref(i64 %t2577, i64 0)
  ret i64 %t2578
else713:
  %t2579 = call i64 @rt_cdr(i64 %t2571)
  %t2580 = call i64 @rt_null_p(i64 %t2579)
  %t2581 = icmp ne i64 %t2580, 1
  br i1 %t2581, label %then714, label %else715
then714:
  %t2582 = and i64 %self, -8
  %t2583 = inttoptr i64 %t2582 to ptr
  %t2584 = getelementptr i64, ptr %t2583, i64 1
  %t2585 = load i64, ptr %t2584
  %t2586 = call i64 @rt_car(i64 %t2571)
  %t2587 = and i64 %self, -8
  %t2588 = inttoptr i64 %t2587 to ptr
  %t2589 = getelementptr i64, ptr %t2588, i64 2
  %t2590 = load i64, ptr %t2589
  %t2591 = and i64 %t2590, -8
  %t2592 = inttoptr i64 %t2591 to ptr
  %t2593 = load i64, ptr %t2592
  %t2594 = inttoptr i64 %t2593 to ptr
  %t2595 = call fastcc i64%t2594(i64 %t2590, i64 1, i64 %t2586, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2596 = call i64 @rt_vector_set(i64 %t2585, i64 0, i64 %t2595)
  ret i64 %t2596
else715:
  %t2597 = and i64 %self, -8
  %t2598 = inttoptr i64 %t2597 to ptr
  %t2599 = getelementptr i64, ptr %t2598, i64 1
  %t2600 = load i64, ptr %t2599
  %t2601 = call i64 @rt_car(i64 %t2571)
  %t2602 = call i64 @rt_vector_set(i64 %t2600, i64 0, i64 %t2601)
  ret i64 %t2602
}

define fastcc i64 @"scheme.base:code:make-parameter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2603 = icmp sge i64 %argc, 1
  br i1 %t2603, label %argok717, label %arityerr716
arityerr716:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok717:
  %t2604 = call ptr @rt_alloc_words(i64 8)
  %t2605 = getelementptr i64, ptr %t2604, i64 0
  store i64 %a0, ptr %t2605
  %t2606 = getelementptr i64, ptr %t2604, i64 1
  store i64 %a1, ptr %t2606
  %t2607 = getelementptr i64, ptr %t2604, i64 2
  store i64 %a2, ptr %t2607
  %t2608 = getelementptr i64, ptr %t2604, i64 3
  store i64 %a3, ptr %t2608
  %t2609 = getelementptr i64, ptr %t2604, i64 4
  store i64 %a4, ptr %t2609
  %t2610 = getelementptr i64, ptr %t2604, i64 5
  store i64 %a5, ptr %t2610
  %t2611 = getelementptr i64, ptr %t2604, i64 6
  store i64 %a6, ptr %t2611
  %t2612 = getelementptr i64, ptr %t2604, i64 7
  store i64 %a7, ptr %t2612
  %t2613 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2604, ptr %overflow)
  %t2614 = call i64 @rt_null_p(i64 %t2613)
  %t2615 = icmp ne i64 %t2614, 1
  br i1 %t2615, label %then718, label %else719
then718:
  %t2616 = call ptr @rt_alloc_words(i64 1)
  %t2617 = ptrtoint ptr %t2616 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_580" to i64), ptr %t2616
  %t2618 = or i64 %t2617, 4
  br label %merge720
else719:
  %t2619 = call i64 @rt_car(i64 %t2613)
  br label %merge720
merge720:
  %t2620 = phi i64 [ %t2618, %then718 ], [ %t2619, %else719 ]
  %t2621 = call i64 @rt_make_vector(i64 8, i64 0)
  %t2622 = call i64 @rt_null_p(i64 %t2613)
  %t2623 = icmp ne i64 %t2622, 1
  br i1 %t2623, label %then721, label %else722
then721:
  %t2624 = call ptr @rt_alloc_words(i64 1)
  %t2625 = ptrtoint ptr %t2624 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_582" to i64), ptr %t2624
  %t2626 = or i64 %t2625, 4
  br label %merge723
else722:
  %t2627 = call i64 @rt_car(i64 %t2613)
  br label %merge723
merge723:
  %t2628 = phi i64 [ %t2626, %then721 ], [ %t2627, %else722 ]
  %t2629 = and i64 %t2628, -8
  %t2630 = inttoptr i64 %t2629 to ptr
  %t2631 = load i64, ptr %t2630
  %t2632 = inttoptr i64 %t2631 to ptr
  %t2633 = call fastcc i64%t2632(i64 %t2628, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2634 = call i64 @rt_vector_set(i64 %t2621, i64 0, i64 %t2633)
  %t2635 = call ptr @rt_alloc_words(i64 3)
  %t2636 = ptrtoint ptr %t2635 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_584" to i64), ptr %t2635
  %t2637 = getelementptr i64, ptr %t2635, i64 1
  store i64 %t2621, ptr %t2637
  %t2638 = getelementptr i64, ptr %t2635, i64 2
  store i64 %t2620, ptr %t2638
  %t2639 = or i64 %t2636, 4
  ret i64 %t2639
}

define fastcc i64 @"scheme.base:code_596"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2644 = icmp eq i64 %argc, 1
  br i1 %t2644, label %argok725, label %arityerr724
arityerr724:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok725:
  %t2645 = and i64 %a0, -8
  %t2646 = inttoptr i64 %t2645 to ptr
  %t2647 = load i64, ptr %t2646
  %t2648 = inttoptr i64 %t2647 to ptr
  %t2649 = musttail call fastcc i64 %t2648(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2649
}

define fastcc i64 @"scheme.base:code_600"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2650 = icmp eq i64 %argc, 2
  br i1 %t2650, label %argok727, label %arityerr726
arityerr726:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok727:
  %t2651 = and i64 %a0, -8
  %t2652 = inttoptr i64 %t2651 to ptr
  %t2653 = load i64, ptr %t2652
  %t2654 = inttoptr i64 %t2653 to ptr
  %t2655 = musttail call fastcc i64 %t2654(i64 %a0, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2655
}

define fastcc i64 @"scheme.base:code_598"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2656 = icmp eq i64 %argc, 0
  br i1 %t2656, label %argok729, label %arityerr728
arityerr728:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok729:
  %t2657 = call ptr @rt_alloc_words(i64 1)
  %t2658 = ptrtoint ptr %t2657 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_600" to i64), ptr %t2657
  %t2659 = or i64 %t2658, 4
  %t2660 = and i64 %self, -8
  %t2661 = inttoptr i64 %t2660 to ptr
  %t2662 = getelementptr i64, ptr %t2661, i64 1
  %t2663 = load i64, ptr %t2662
  %t2664 = and i64 %self, -8
  %t2665 = inttoptr i64 %t2664 to ptr
  %t2666 = getelementptr i64, ptr %t2665, i64 2
  %t2667 = load i64, ptr %t2666
  %t2668 = load i64, ptr @"scheme.base:for-each"
  %t2669 = and i64 %t2668, -8
  %t2670 = inttoptr i64 %t2669 to ptr
  %t2671 = load i64, ptr %t2670
  %t2672 = inttoptr i64 %t2671 to ptr
  %t2673 = musttail call fastcc i64 %t2672(i64 %t2668, i64 3, i64 %t2659, i64 %t2663, i64 %t2667, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2673
}

define fastcc i64 @"scheme.base:code_604"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2674 = icmp eq i64 %argc, 2
  br i1 %t2674, label %argok731, label %arityerr730
arityerr730:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok731:
  %t2675 = and i64 %a0, -8
  %t2676 = inttoptr i64 %t2675 to ptr
  %t2677 = load i64, ptr %t2676
  %t2678 = inttoptr i64 %t2677 to ptr
  %t2679 = musttail call fastcc i64 %t2678(i64 %a0, i64 2, i64 %a1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2679
}

define fastcc i64 @"scheme.base:code_602"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2680 = icmp eq i64 %argc, 0
  br i1 %t2680, label %argok733, label %arityerr732
arityerr732:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok733:
  %t2681 = call ptr @rt_alloc_words(i64 1)
  %t2682 = ptrtoint ptr %t2681 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_604" to i64), ptr %t2681
  %t2683 = or i64 %t2682, 4
  %t2684 = and i64 %self, -8
  %t2685 = inttoptr i64 %t2684 to ptr
  %t2686 = getelementptr i64, ptr %t2685, i64 1
  %t2687 = load i64, ptr %t2686
  %t2688 = and i64 %self, -8
  %t2689 = inttoptr i64 %t2688 to ptr
  %t2690 = getelementptr i64, ptr %t2689, i64 2
  %t2691 = load i64, ptr %t2690
  %t2692 = load i64, ptr @"scheme.base:for-each"
  %t2693 = and i64 %t2692, -8
  %t2694 = inttoptr i64 %t2693 to ptr
  %t2695 = load i64, ptr %t2694
  %t2696 = inttoptr i64 %t2695 to ptr
  %t2697 = musttail call fastcc i64 %t2696(i64 %t2692, i64 3, i64 %t2683, i64 %t2687, i64 %t2691, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2697
}

define fastcc i64 @"scheme.base:code:%with-parameters"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2698 = icmp eq i64 %argc, 3
  br i1 %t2698, label %argok735, label %arityerr734
arityerr734:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok735:
  %t2699 = call ptr @rt_alloc_words(i64 1)
  %t2700 = ptrtoint ptr %t2699 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_596" to i64), ptr %t2699
  %t2701 = or i64 %t2700, 4
  %t2702 = load i64, ptr @"scheme.base:map"
  %t2703 = and i64 %t2702, -8
  %t2704 = inttoptr i64 %t2703 to ptr
  %t2705 = load i64, ptr %t2704
  %t2706 = inttoptr i64 %t2705 to ptr
  %t2707 = call fastcc i64%t2706(i64 %t2702, i64 2, i64 %t2701, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2708 = call ptr @rt_alloc_words(i64 3)
  %t2709 = ptrtoint ptr %t2708 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_598" to i64), ptr %t2708
  %t2710 = getelementptr i64, ptr %t2708, i64 1
  store i64 %a0, ptr %t2710
  %t2711 = getelementptr i64, ptr %t2708, i64 2
  store i64 %a1, ptr %t2711
  %t2712 = or i64 %t2709, 4
  %t2713 = call ptr @rt_alloc_words(i64 3)
  %t2714 = ptrtoint ptr %t2713 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_602" to i64), ptr %t2713
  %t2715 = getelementptr i64, ptr %t2713, i64 1
  store i64 %a0, ptr %t2715
  %t2716 = getelementptr i64, ptr %t2713, i64 2
  store i64 %t2707, ptr %t2716
  %t2717 = or i64 %t2714, 4
  %t2718 = load i64, ptr @"scheme.base:dynamic-wind"
  %t2719 = and i64 %t2718, -8
  %t2720 = inttoptr i64 %t2719 to ptr
  %t2721 = load i64, ptr %t2720
  %t2722 = inttoptr i64 %t2721 to ptr
  %t2723 = musttail call fastcc i64 %t2722(i64 %t2718, i64 3, i64 %t2712, i64 %a2, i64 %t2717, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2723
}

define fastcc i64 @"scheme.base:code_612"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2728 = icmp eq i64 %argc, 2
  br i1 %t2728, label %argok737, label %arityerr736
arityerr736:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok737:
  %t2729 = call i64 @rt_null_p(i64 %a0)
  %t2730 = icmp ne i64 %t2729, 1
  br i1 %t2730, label %then738, label %else739
then738:
  %t2731 = and i64 %self, -8
  %t2732 = inttoptr i64 %t2731 to ptr
  %t2733 = getelementptr i64, ptr %t2732, i64 1
  %t2734 = load i64, ptr %t2733
  ret i64 %t2734
else739:
  %t2735 = and i64 %self, -8
  %t2736 = inttoptr i64 %t2735 to ptr
  %t2737 = getelementptr i64, ptr %t2736, i64 1
  %t2738 = load i64, ptr %t2737
  %t2739 = call i64 @rt_car(i64 %a0)
  %t2740 = call i64 @rt_vector_set(i64 %t2738, i64 %a1, i64 %t2739)
  %t2741 = call i64 @rt_cdr(i64 %a0)
  %t2742 = or i64 %a1, 8
  %t2743 = and i64 %t2742, 7
  %t2744 = icmp eq i64 %t2743, 0
  br i1 %t2744, label %fixfast740, label %fixslow741
fixfast740:
  %t2745 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t2746 = extractvalue {i64, i1} %t2745, 0
  %t2747 = extractvalue {i64, i1} %t2745, 1
  br i1 %t2747, label %fixslow741, label %fixmerge742
fixslow741:
  %t2748 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge742
fixmerge742:
  %t2749 = phi i64 [ %t2746, %fixfast740 ], [ %t2748, %fixslow741 ]
  %t2750 = musttail call fastcc i64 @"scheme.base:code_612"(i64 %self, i64 2, i64 %t2741, i64 %t2749, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2750
}

define fastcc i64 @"scheme.base:code:list->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2751 = icmp eq i64 %argc, 1
  br i1 %t2751, label %argok744, label %arityerr743
arityerr743:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok744:
  %t2752 = load i64, ptr @"scheme.base:length"
  %t2753 = and i64 %t2752, -8
  %t2754 = inttoptr i64 %t2753 to ptr
  %t2755 = load i64, ptr %t2754
  %t2756 = inttoptr i64 %t2755 to ptr
  %t2757 = call fastcc i64%t2756(i64 %t2752, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2758 = call i64 @rt_make_vector(i64 %t2757, i64 0)
  %t2759 = call ptr @rt_alloc_words(i64 3)
  %t2760 = ptrtoint ptr %t2759 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_612" to i64), ptr %t2759
  %t2761 = or i64 %t2760, 4
  %t2762 = getelementptr i64, ptr %t2759, i64 1
  store i64 %t2758, ptr %t2762
  %t2763 = getelementptr i64, ptr %t2759, i64 2
  store i64 %t2761, ptr %t2763
  %t2764 = musttail call fastcc i64 @"scheme.base:code_612"(i64 %t2761, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2764
}

define fastcc i64 @"scheme.base:code:vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2769 = icmp sge i64 %argc, 0
  br i1 %t2769, label %argok746, label %arityerr745
arityerr745:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok746:
  %t2770 = call ptr @rt_alloc_words(i64 8)
  %t2771 = getelementptr i64, ptr %t2770, i64 0
  store i64 %a0, ptr %t2771
  %t2772 = getelementptr i64, ptr %t2770, i64 1
  store i64 %a1, ptr %t2772
  %t2773 = getelementptr i64, ptr %t2770, i64 2
  store i64 %a2, ptr %t2773
  %t2774 = getelementptr i64, ptr %t2770, i64 3
  store i64 %a3, ptr %t2774
  %t2775 = getelementptr i64, ptr %t2770, i64 4
  store i64 %a4, ptr %t2775
  %t2776 = getelementptr i64, ptr %t2770, i64 5
  store i64 %a5, ptr %t2776
  %t2777 = getelementptr i64, ptr %t2770, i64 6
  store i64 %a6, ptr %t2777
  %t2778 = getelementptr i64, ptr %t2770, i64 7
  store i64 %a7, ptr %t2778
  %t2779 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2770, ptr %overflow)
  %t2780 = load i64, ptr @"scheme.base:list->vector"
  %t2781 = and i64 %t2780, -8
  %t2782 = inttoptr i64 %t2781 to ptr
  %t2783 = load i64, ptr %t2782
  %t2784 = inttoptr i64 %t2783 to ptr
  %t2785 = musttail call fastcc i64 %t2784(i64 %t2780, i64 1, i64 %t2779, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2785
}

define fastcc i64 @"scheme.base:code_622"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2790 = icmp eq i64 %argc, 2
  br i1 %t2790, label %argok748, label %arityerr747
arityerr747:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok748:
  %t2791 = call i64 @rt_null_p(i64 %a0)
  %t2792 = icmp ne i64 %t2791, 1
  br i1 %t2792, label %then749, label %else750
then749:
  %t2793 = and i64 %self, -8
  %t2794 = inttoptr i64 %t2793 to ptr
  %t2795 = getelementptr i64, ptr %t2794, i64 1
  %t2796 = load i64, ptr %t2795
  ret i64 %t2796
else750:
  %t2797 = and i64 %self, -8
  %t2798 = inttoptr i64 %t2797 to ptr
  %t2799 = getelementptr i64, ptr %t2798, i64 1
  %t2800 = load i64, ptr %t2799
  %t2801 = call i64 @rt_car(i64 %a0)
  %t2802 = call i64 @rt_bytevector_u8_set(i64 %t2800, i64 %a1, i64 %t2801)
  %t2803 = call i64 @rt_cdr(i64 %a0)
  %t2804 = or i64 %a1, 8
  %t2805 = and i64 %t2804, 7
  %t2806 = icmp eq i64 %t2805, 0
  br i1 %t2806, label %fixfast751, label %fixslow752
fixfast751:
  %t2807 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t2808 = extractvalue {i64, i1} %t2807, 0
  %t2809 = extractvalue {i64, i1} %t2807, 1
  br i1 %t2809, label %fixslow752, label %fixmerge753
fixslow752:
  %t2810 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge753
fixmerge753:
  %t2811 = phi i64 [ %t2808, %fixfast751 ], [ %t2810, %fixslow752 ]
  %t2812 = musttail call fastcc i64 @"scheme.base:code_622"(i64 %self, i64 2, i64 %t2803, i64 %t2811, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2812
}

define fastcc i64 @"scheme.base:code:list->bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2813 = icmp eq i64 %argc, 1
  br i1 %t2813, label %argok755, label %arityerr754
arityerr754:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok755:
  %t2814 = load i64, ptr @"scheme.base:length"
  %t2815 = and i64 %t2814, -8
  %t2816 = inttoptr i64 %t2815 to ptr
  %t2817 = load i64, ptr %t2816
  %t2818 = inttoptr i64 %t2817 to ptr
  %t2819 = call fastcc i64%t2818(i64 %t2814, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2820 = call i64 @rt_make_bytevector(i64 %t2819, i64 0)
  %t2821 = call ptr @rt_alloc_words(i64 3)
  %t2822 = ptrtoint ptr %t2821 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_622" to i64), ptr %t2821
  %t2823 = or i64 %t2822, 4
  %t2824 = getelementptr i64, ptr %t2821, i64 1
  store i64 %t2820, ptr %t2824
  %t2825 = getelementptr i64, ptr %t2821, i64 2
  store i64 %t2823, ptr %t2825
  %t2826 = musttail call fastcc i64 @"scheme.base:code_622"(i64 %t2823, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2826
}

define fastcc i64 @"scheme.base:code:bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2831 = icmp sge i64 %argc, 0
  br i1 %t2831, label %argok757, label %arityerr756
arityerr756:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok757:
  %t2832 = call ptr @rt_alloc_words(i64 8)
  %t2833 = getelementptr i64, ptr %t2832, i64 0
  store i64 %a0, ptr %t2833
  %t2834 = getelementptr i64, ptr %t2832, i64 1
  store i64 %a1, ptr %t2834
  %t2835 = getelementptr i64, ptr %t2832, i64 2
  store i64 %a2, ptr %t2835
  %t2836 = getelementptr i64, ptr %t2832, i64 3
  store i64 %a3, ptr %t2836
  %t2837 = getelementptr i64, ptr %t2832, i64 4
  store i64 %a4, ptr %t2837
  %t2838 = getelementptr i64, ptr %t2832, i64 5
  store i64 %a5, ptr %t2838
  %t2839 = getelementptr i64, ptr %t2832, i64 6
  store i64 %a6, ptr %t2839
  %t2840 = getelementptr i64, ptr %t2832, i64 7
  store i64 %a7, ptr %t2840
  %t2841 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2832, ptr %overflow)
  %t2842 = load i64, ptr @"scheme.base:list->bytevector"
  %t2843 = and i64 %t2842, -8
  %t2844 = inttoptr i64 %t2843 to ptr
  %t2845 = load i64, ptr %t2844
  %t2846 = inttoptr i64 %t2845 to ptr
  %t2847 = musttail call fastcc i64 %t2846(i64 %t2842, i64 1, i64 %t2841, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2847
}

define fastcc i64 @"scheme.base:code:values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2852 = icmp sge i64 %argc, 0
  br i1 %t2852, label %argok759, label %arityerr758
arityerr758:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok759:
  %t2853 = call ptr @rt_alloc_words(i64 8)
  %t2854 = getelementptr i64, ptr %t2853, i64 0
  store i64 %a0, ptr %t2854
  %t2855 = getelementptr i64, ptr %t2853, i64 1
  store i64 %a1, ptr %t2855
  %t2856 = getelementptr i64, ptr %t2853, i64 2
  store i64 %a2, ptr %t2856
  %t2857 = getelementptr i64, ptr %t2853, i64 3
  store i64 %a3, ptr %t2857
  %t2858 = getelementptr i64, ptr %t2853, i64 4
  store i64 %a4, ptr %t2858
  %t2859 = getelementptr i64, ptr %t2853, i64 5
  store i64 %a5, ptr %t2859
  %t2860 = getelementptr i64, ptr %t2853, i64 6
  store i64 %a6, ptr %t2860
  %t2861 = getelementptr i64, ptr %t2853, i64 7
  store i64 %a7, ptr %t2861
  %t2862 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2853, ptr %overflow)
  %t2863 = call i64 @rt_pair_p(i64 %t2862)
  %t2864 = icmp ne i64 %t2863, 1
  br i1 %t2864, label %then760, label %else761
then760:
  %t2865 = call i64 @rt_cdr(i64 %t2862)
  %t2866 = call i64 @rt_null_p(i64 %t2865)
  br label %merge762
else761:
  br label %merge762
merge762:
  %t2867 = phi i64 [ %t2866, %then760 ], [ 1, %else761 ]
  %t2868 = icmp ne i64 %t2867, 1
  br i1 %t2868, label %then763, label %else764
then763:
  %t2869 = call i64 @rt_car(i64 %t2862)
  ret i64 %t2869
else764:
  %t2870 = call i64 @rt_list_to_mv(i64 %t2862)
  ret i64 %t2870
}

define fastcc i64 @"scheme.base:code:call-with-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2875 = icmp eq i64 %argc, 2
  br i1 %t2875, label %argok766, label %arityerr765
arityerr765:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok766:
  %t2876 = and i64 %a0, -8
  %t2877 = inttoptr i64 %t2876 to ptr
  %t2878 = load i64, ptr %t2877
  %t2879 = inttoptr i64 %t2878 to ptr
  %t2880 = call fastcc i64%t2879(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2881 = call i64 @rt_mv_p(i64 %t2880)
  %t2882 = icmp ne i64 %t2881, 1
  br i1 %t2882, label %then767, label %else768
then767:
  %t2883 = call i64 @rt_mv_to_list(i64 %t2880)
  %t2884 = and i64 %a1, -8
  %t2885 = inttoptr i64 %t2884 to ptr
  %t2886 = load i64, ptr %t2885
  %t2887 = inttoptr i64 %t2886 to ptr
  %t2888 = call i64 @rt_list_length(i64 %t2883)
  %t2889 = add i64 0, %t2888
  %t2890 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t2883, i64 8)
  %t2902 = getelementptr i64, ptr %t2890, i64 0
  %t2894 = load i64, ptr %t2902
  %t2903 = getelementptr i64, ptr %t2890, i64 1
  %t2895 = load i64, ptr %t2903
  %t2904 = getelementptr i64, ptr %t2890, i64 2
  %t2896 = load i64, ptr %t2904
  %t2905 = getelementptr i64, ptr %t2890, i64 3
  %t2897 = load i64, ptr %t2905
  %t2906 = getelementptr i64, ptr %t2890, i64 4
  %t2898 = load i64, ptr %t2906
  %t2907 = getelementptr i64, ptr %t2890, i64 5
  %t2899 = load i64, ptr %t2907
  %t2908 = getelementptr i64, ptr %t2890, i64 6
  %t2900 = load i64, ptr %t2908
  %t2909 = getelementptr i64, ptr %t2890, i64 7
  %t2901 = load i64, ptr %t2909
  %t2891 = icmp sgt i64 %t2889, 8
  %t2892 = getelementptr i64, ptr %t2890, i64 8
  %t2893 = select i1 %t2891, ptr %t2892, ptr null
  %t2910 = musttail call fastcc i64 %t2887(i64 %a1, i64 %t2889, i64 %t2894, i64 %t2895, i64 %t2896, i64 %t2897, i64 %t2898, i64 %t2899, i64 %t2900, i64 %t2901, ptr %t2893)
  ret i64 %t2910
else768:
  %t2911 = and i64 %a1, -8
  %t2912 = inttoptr i64 %t2911 to ptr
  %t2913 = load i64, ptr %t2912
  %t2914 = inttoptr i64 %t2913 to ptr
  %t2915 = musttail call fastcc i64 %t2914(i64 %a1, i64 1, i64 %t2880, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2915
}

define fastcc i64 @"scheme.base:code:make-hash-table"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2922 = icmp eq i64 %argc, 0
  br i1 %t2922, label %argok770, label %arityerr769
arityerr769:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok770:
  %t2923 = load i64, ptr @"scheme.base:%ht-initial-buckets"
  %t2924 = call i64 @rt_make_vector(i64 %t2923, i64 2)
  %t2925 = load i64, ptr @"scheme.base:vector"
  %t2926 = and i64 %t2925, -8
  %t2927 = inttoptr i64 %t2926 to ptr
  %t2928 = load i64, ptr %t2927
  %t2929 = inttoptr i64 %t2928 to ptr
  %t2930 = call fastcc i64%t2929(i64 %t2925, i64 3, i64 0, i64 %t2924, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2931 = call i64 @rt_make_hash_table(i64 %t2930)
  ret i64 %t2931
}

define fastcc i64 @"scheme.base:code:hash-table?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2936 = icmp eq i64 %argc, 1
  br i1 %t2936, label %argok772, label %arityerr771
arityerr771:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok772:
  %t2937 = call i64 @rt_hash_table_p(i64 %a0)
  ret i64 %t2937
}

define fastcc i64 @"scheme.base:code:%ht-count"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2942 = icmp eq i64 %argc, 1
  br i1 %t2942, label %argok774, label %arityerr773
arityerr773:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok774:
  %t2943 = call i64 @rt_hash_table_spine(i64 %a0)
  %t2944 = call i64 @rt_vector_ref(i64 %t2943, i64 0)
  ret i64 %t2944
}

define fastcc i64 @"scheme.base:code:%ht-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2949 = icmp eq i64 %argc, 1
  br i1 %t2949, label %argok776, label %arityerr775
arityerr775:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok776:
  %t2950 = call i64 @rt_hash_table_spine(i64 %a0)
  %t2951 = call i64 @rt_vector_ref(i64 %t2950, i64 8)
  ret i64 %t2951
}

define fastcc i64 @"scheme.base:code:%ht-set-count!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2956 = icmp eq i64 %argc, 2
  br i1 %t2956, label %argok778, label %arityerr777
arityerr777:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok778:
  %t2957 = call i64 @rt_hash_table_spine(i64 %a0)
  %t2958 = call i64 @rt_vector_set(i64 %t2957, i64 0, i64 %a1)
  ret i64 %t2958
}

define fastcc i64 @"scheme.base:code:%ht-set-buckets!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2963 = icmp eq i64 %argc, 2
  br i1 %t2963, label %argok780, label %arityerr779
arityerr779:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok780:
  %t2964 = call i64 @rt_hash_table_spine(i64 %a0)
  %t2965 = call i64 @rt_vector_set(i64 %t2964, i64 8, i64 %a1)
  ret i64 %t2965
}

define fastcc i64 @"scheme.base:code:%ht-index"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2970 = icmp eq i64 %argc, 2
  br i1 %t2970, label %argok782, label %arityerr781
arityerr781:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok782:
  %t2971 = call i64 @rt_hash(i64 %a0)
  %t2972 = call i64 @rt_remainder(i64 %t2971, i64 %a1)
  ret i64 %t2972
}

define fastcc i64 @"scheme.base:code:%ht-assoc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2977 = icmp eq i64 %argc, 2
  br i1 %t2977, label %argok784, label %arityerr783
arityerr783:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok784:
  %t2978 = call i64 @rt_null_p(i64 %a1)
  %t2979 = icmp ne i64 %t2978, 1
  br i1 %t2979, label %then785, label %else786
then785:
  ret i64 1
else786:
  %t2980 = call i64 @rt_car(i64 %a1)
  %t2981 = call i64 @rt_car(i64 %t2980)
  %t2982 = call i64 @rt_equal(i64 %a0, i64 %t2981)
  %t2983 = icmp ne i64 %t2982, 1
  br i1 %t2983, label %then787, label %else788
then787:
  %t2984 = call i64 @rt_car(i64 %a1)
  ret i64 %t2984
else788:
  %t2985 = call i64 @rt_cdr(i64 %a1)
  %t2986 = load i64, ptr @"scheme.base:%ht-assoc"
  %t2987 = and i64 %t2986, -8
  %t2988 = inttoptr i64 %t2987 to ptr
  %t2989 = load i64, ptr %t2988
  %t2990 = inttoptr i64 %t2989 to ptr
  %t2991 = musttail call fastcc i64 %t2990(i64 %t2986, i64 2, i64 %a0, i64 %t2985, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2991
}

define fastcc i64 @"scheme.base:code:%ht-remove"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2996 = icmp eq i64 %argc, 2
  br i1 %t2996, label %argok790, label %arityerr789
arityerr789:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok790:
  %t2997 = call i64 @rt_null_p(i64 %a1)
  %t2998 = icmp ne i64 %t2997, 1
  br i1 %t2998, label %then791, label %else792
then791:
  ret i64 2
else792:
  %t2999 = call i64 @rt_car(i64 %a1)
  %t3000 = call i64 @rt_car(i64 %t2999)
  %t3001 = call i64 @rt_equal(i64 %a0, i64 %t3000)
  %t3002 = icmp ne i64 %t3001, 1
  br i1 %t3002, label %then793, label %else794
then793:
  %t3003 = call i64 @rt_cdr(i64 %a1)
  ret i64 %t3003
else794:
  %t3004 = call i64 @rt_car(i64 %a1)
  %t3005 = call i64 @rt_cdr(i64 %a1)
  %t3006 = load i64, ptr @"scheme.base:%ht-remove"
  %t3007 = and i64 %t3006, -8
  %t3008 = inttoptr i64 %t3007 to ptr
  %t3009 = load i64, ptr %t3008
  %t3010 = inttoptr i64 %t3009 to ptr
  %t3011 = call fastcc i64%t3010(i64 %t3006, i64 2, i64 %a0, i64 %t3005, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3012 = call i64 @rt_cons(i64 %t3004, i64 %t3011)
  ret i64 %t3012
}

define fastcc i64 @"scheme.base:code:hash-table-ref/default"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3017 = icmp eq i64 %argc, 3
  br i1 %t3017, label %argok796, label %arityerr795
arityerr795:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok796:
  %t3018 = load i64, ptr @"scheme.base:%ht-buckets"
  %t3019 = and i64 %t3018, -8
  %t3020 = inttoptr i64 %t3019 to ptr
  %t3021 = load i64, ptr %t3020
  %t3022 = inttoptr i64 %t3021 to ptr
  %t3023 = call fastcc i64%t3022(i64 %t3018, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3024 = call i64 @rt_vector_length(i64 %t3023)
  %t3025 = load i64, ptr @"scheme.base:%ht-index"
  %t3026 = and i64 %t3025, -8
  %t3027 = inttoptr i64 %t3026 to ptr
  %t3028 = load i64, ptr %t3027
  %t3029 = inttoptr i64 %t3028 to ptr
  %t3030 = call fastcc i64%t3029(i64 %t3025, i64 2, i64 %a1, i64 %t3024, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3031 = call i64 @rt_vector_ref(i64 %t3023, i64 %t3030)
  %t3032 = load i64, ptr @"scheme.base:%ht-assoc"
  %t3033 = and i64 %t3032, -8
  %t3034 = inttoptr i64 %t3033 to ptr
  %t3035 = load i64, ptr %t3034
  %t3036 = inttoptr i64 %t3035 to ptr
  %t3037 = call fastcc i64%t3036(i64 %t3032, i64 2, i64 %a1, i64 %t3031, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3038 = icmp ne i64 %t3037, 1
  br i1 %t3038, label %then797, label %else798
then797:
  %t3039 = call i64 @rt_cdr(i64 %t3037)
  ret i64 %t3039
else798:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:hash-table-contains?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3044 = icmp eq i64 %argc, 2
  br i1 %t3044, label %argok800, label %arityerr799
arityerr799:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok800:
  %t3045 = load i64, ptr @"scheme.base:%ht-buckets"
  %t3046 = and i64 %t3045, -8
  %t3047 = inttoptr i64 %t3046 to ptr
  %t3048 = load i64, ptr %t3047
  %t3049 = inttoptr i64 %t3048 to ptr
  %t3050 = call fastcc i64%t3049(i64 %t3045, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3051 = call i64 @rt_vector_length(i64 %t3050)
  %t3052 = load i64, ptr @"scheme.base:%ht-index"
  %t3053 = and i64 %t3052, -8
  %t3054 = inttoptr i64 %t3053 to ptr
  %t3055 = load i64, ptr %t3054
  %t3056 = inttoptr i64 %t3055 to ptr
  %t3057 = call fastcc i64%t3056(i64 %t3052, i64 2, i64 %a1, i64 %t3051, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3058 = call i64 @rt_vector_ref(i64 %t3050, i64 %t3057)
  %t3059 = load i64, ptr @"scheme.base:%ht-assoc"
  %t3060 = and i64 %t3059, -8
  %t3061 = inttoptr i64 %t3060 to ptr
  %t3062 = load i64, ptr %t3061
  %t3063 = inttoptr i64 %t3062 to ptr
  %t3064 = call fastcc i64%t3063(i64 %t3059, i64 2, i64 %a1, i64 %t3058, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3065 = icmp ne i64 %t3064, 1
  br i1 %t3065, label %then801, label %else802
then801:
  ret i64 257
else802:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-ref"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3070 = icmp eq i64 %argc, 2
  br i1 %t3070, label %argok804, label %arityerr803
arityerr803:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok804:
  %t3071 = load i64, ptr @"scheme.base:%ht-buckets"
  %t3072 = and i64 %t3071, -8
  %t3073 = inttoptr i64 %t3072 to ptr
  %t3074 = load i64, ptr %t3073
  %t3075 = inttoptr i64 %t3074 to ptr
  %t3076 = call fastcc i64%t3075(i64 %t3071, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3077 = call i64 @rt_vector_length(i64 %t3076)
  %t3078 = load i64, ptr @"scheme.base:%ht-index"
  %t3079 = and i64 %t3078, -8
  %t3080 = inttoptr i64 %t3079 to ptr
  %t3081 = load i64, ptr %t3080
  %t3082 = inttoptr i64 %t3081 to ptr
  %t3083 = call fastcc i64%t3082(i64 %t3078, i64 2, i64 %a1, i64 %t3077, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3084 = call i64 @rt_vector_ref(i64 %t3076, i64 %t3083)
  %t3085 = load i64, ptr @"scheme.base:%ht-assoc"
  %t3086 = and i64 %t3085, -8
  %t3087 = inttoptr i64 %t3086 to ptr
  %t3088 = load i64, ptr %t3087
  %t3089 = inttoptr i64 %t3088 to ptr
  %t3090 = call fastcc i64%t3089(i64 %t3085, i64 2, i64 %a1, i64 %t3084, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3091 = icmp ne i64 %t3090, 1
  br i1 %t3091, label %then805, label %else806
then805:
  %t3092 = call i64 @rt_cdr(i64 %t3090)
  ret i64 %t3092
else806:
  %t3093 = call i64 @rt_make_string(ptr @.str.lit.12, i64 29)
  %t3094 = load i64, ptr @"scheme.base:error"
  %t3095 = and i64 %t3094, -8
  %t3096 = inttoptr i64 %t3095 to ptr
  %t3097 = load i64, ptr %t3096
  %t3098 = inttoptr i64 %t3097 to ptr
  %t3099 = musttail call fastcc i64 %t3098(i64 %t3094, i64 2, i64 %t3093, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3099
}

define fastcc i64 @"scheme.base:code:hash-table-set!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3104 = icmp eq i64 %argc, 3
  br i1 %t3104, label %argok808, label %arityerr807
arityerr807:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok808:
  %t3105 = load i64, ptr @"scheme.base:%ht-buckets"
  %t3106 = and i64 %t3105, -8
  %t3107 = inttoptr i64 %t3106 to ptr
  %t3108 = load i64, ptr %t3107
  %t3109 = inttoptr i64 %t3108 to ptr
  %t3110 = call fastcc i64%t3109(i64 %t3105, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3111 = call i64 @rt_vector_length(i64 %t3110)
  %t3112 = load i64, ptr @"scheme.base:%ht-index"
  %t3113 = and i64 %t3112, -8
  %t3114 = inttoptr i64 %t3113 to ptr
  %t3115 = load i64, ptr %t3114
  %t3116 = inttoptr i64 %t3115 to ptr
  %t3117 = call fastcc i64%t3116(i64 %t3112, i64 2, i64 %a1, i64 %t3111, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3118 = call i64 @rt_vector_ref(i64 %t3110, i64 %t3117)
  %t3119 = load i64, ptr @"scheme.base:%ht-assoc"
  %t3120 = and i64 %t3119, -8
  %t3121 = inttoptr i64 %t3120 to ptr
  %t3122 = load i64, ptr %t3121
  %t3123 = inttoptr i64 %t3122 to ptr
  %t3124 = call fastcc i64%t3123(i64 %t3119, i64 2, i64 %a1, i64 %t3118, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3125 = call i64 @rt_cons(i64 %a1, i64 %a2)
  %t3126 = icmp ne i64 %t3124, 1
  br i1 %t3126, label %then809, label %else810
then809:
  %t3127 = load i64, ptr @"scheme.base:%ht-remove"
  %t3128 = and i64 %t3127, -8
  %t3129 = inttoptr i64 %t3128 to ptr
  %t3130 = load i64, ptr %t3129
  %t3131 = inttoptr i64 %t3130 to ptr
  %t3132 = call fastcc i64%t3131(i64 %t3127, i64 2, i64 %a1, i64 %t3118, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge811
else810:
  br label %merge811
merge811:
  %t3133 = phi i64 [ %t3132, %then809 ], [ %t3118, %else810 ]
  %t3134 = call i64 @rt_cons(i64 %t3125, i64 %t3133)
  %t3135 = call i64 @rt_vector_set(i64 %t3110, i64 %t3117, i64 %t3134)
  %t3136 = icmp ne i64 %t3124, 1
  br i1 %t3136, label %then812, label %else813
then812:
  ret i64 1
else813:
  %t3137 = load i64, ptr @"scheme.base:%ht-count"
  %t3138 = and i64 %t3137, -8
  %t3139 = inttoptr i64 %t3138 to ptr
  %t3140 = load i64, ptr %t3139
  %t3141 = inttoptr i64 %t3140 to ptr
  %t3142 = call fastcc i64%t3141(i64 %t3137, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3143 = or i64 %t3142, 8
  %t3144 = and i64 %t3143, 7
  %t3145 = icmp eq i64 %t3144, 0
  br i1 %t3145, label %fixfast814, label %fixslow815
fixfast814:
  %t3146 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3142, i64 8)
  %t3147 = extractvalue {i64, i1} %t3146, 0
  %t3148 = extractvalue {i64, i1} %t3146, 1
  br i1 %t3148, label %fixslow815, label %fixmerge816
fixslow815:
  %t3149 = call i64 @rt_add(i64 %t3142, i64 8)
  br label %fixmerge816
fixmerge816:
  %t3150 = phi i64 [ %t3147, %fixfast814 ], [ %t3149, %fixslow815 ]
  %t3151 = load i64, ptr @"scheme.base:%ht-set-count!"
  %t3152 = and i64 %t3151, -8
  %t3153 = inttoptr i64 %t3152 to ptr
  %t3154 = load i64, ptr %t3153
  %t3155 = inttoptr i64 %t3154 to ptr
  %t3156 = call fastcc i64%t3155(i64 %t3151, i64 2, i64 %a0, i64 %t3150, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3157 = load i64, ptr @"scheme.base:%ht-count"
  %t3158 = and i64 %t3157, -8
  %t3159 = inttoptr i64 %t3158 to ptr
  %t3160 = load i64, ptr %t3159
  %t3161 = inttoptr i64 %t3160 to ptr
  %t3162 = call fastcc i64%t3161(i64 %t3157, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3163 = load i64, ptr @"scheme.base:%ht-load-factor"
  %t3164 = or i64 %t3163, %t3111
  %t3165 = and i64 %t3164, 7
  %t3166 = icmp eq i64 %t3165, 0
  br i1 %t3166, label %fixfast817, label %fixslow818
fixfast817:
  %t3167 = ashr i64 %t3163, 3
  %t3168 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t3167, i64 %t3111)
  %t3169 = extractvalue {i64, i1} %t3168, 0
  %t3170 = extractvalue {i64, i1} %t3168, 1
  br i1 %t3170, label %fixslow818, label %fixmerge819
fixslow818:
  %t3171 = call i64 @rt_mul(i64 %t3163, i64 %t3111)
  br label %fixmerge819
fixmerge819:
  %t3172 = phi i64 [ %t3169, %fixfast817 ], [ %t3171, %fixslow818 ]
  %t3173 = or i64 %t3172, %t3162
  %t3174 = and i64 %t3173, 7
  %t3175 = icmp eq i64 %t3174, 0
  br i1 %t3175, label %fixfast820, label %fixslow821
fixfast820:
  %t3176 = icmp slt i64 %t3172, %t3162
  %t3177 = select i1 %t3176, i64 257, i64 1
  br label %fixmerge822
fixslow821:
  %t3178 = call i64 @rt_lt(i64 %t3172, i64 %t3162)
  br label %fixmerge822
fixmerge822:
  %t3179 = phi i64 [ %t3177, %fixfast820 ], [ %t3178, %fixslow821 ]
  %t3180 = icmp ne i64 %t3179, 1
  br i1 %t3180, label %then823, label %else824
then823:
  %t3181 = load i64, ptr @"scheme.base:%ht-grow!"
  %t3182 = and i64 %t3181, -8
  %t3183 = inttoptr i64 %t3182 to ptr
  %t3184 = load i64, ptr %t3183
  %t3185 = inttoptr i64 %t3184 to ptr
  %t3186 = musttail call fastcc i64 %t3185(i64 %t3181, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3186
else824:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-delete!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3191 = icmp eq i64 %argc, 2
  br i1 %t3191, label %argok826, label %arityerr825
arityerr825:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok826:
  %t3192 = load i64, ptr @"scheme.base:%ht-buckets"
  %t3193 = and i64 %t3192, -8
  %t3194 = inttoptr i64 %t3193 to ptr
  %t3195 = load i64, ptr %t3194
  %t3196 = inttoptr i64 %t3195 to ptr
  %t3197 = call fastcc i64%t3196(i64 %t3192, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3198 = call i64 @rt_vector_length(i64 %t3197)
  %t3199 = load i64, ptr @"scheme.base:%ht-index"
  %t3200 = and i64 %t3199, -8
  %t3201 = inttoptr i64 %t3200 to ptr
  %t3202 = load i64, ptr %t3201
  %t3203 = inttoptr i64 %t3202 to ptr
  %t3204 = call fastcc i64%t3203(i64 %t3199, i64 2, i64 %a1, i64 %t3198, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3205 = call i64 @rt_vector_ref(i64 %t3197, i64 %t3204)
  %t3206 = load i64, ptr @"scheme.base:%ht-assoc"
  %t3207 = and i64 %t3206, -8
  %t3208 = inttoptr i64 %t3207 to ptr
  %t3209 = load i64, ptr %t3208
  %t3210 = inttoptr i64 %t3209 to ptr
  %t3211 = call fastcc i64%t3210(i64 %t3206, i64 2, i64 %a1, i64 %t3205, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3212 = icmp ne i64 %t3211, 1
  br i1 %t3212, label %then827, label %else828
then827:
  %t3213 = load i64, ptr @"scheme.base:%ht-remove"
  %t3214 = and i64 %t3213, -8
  %t3215 = inttoptr i64 %t3214 to ptr
  %t3216 = load i64, ptr %t3215
  %t3217 = inttoptr i64 %t3216 to ptr
  %t3218 = call fastcc i64%t3217(i64 %t3213, i64 2, i64 %a1, i64 %t3205, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3219 = call i64 @rt_vector_set(i64 %t3197, i64 %t3204, i64 %t3218)
  %t3220 = load i64, ptr @"scheme.base:%ht-count"
  %t3221 = and i64 %t3220, -8
  %t3222 = inttoptr i64 %t3221 to ptr
  %t3223 = load i64, ptr %t3222
  %t3224 = inttoptr i64 %t3223 to ptr
  %t3225 = call fastcc i64%t3224(i64 %t3220, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3226 = or i64 %t3225, 8
  %t3227 = and i64 %t3226, 7
  %t3228 = icmp eq i64 %t3227, 0
  br i1 %t3228, label %fixfast829, label %fixslow830
fixfast829:
  %t3229 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3225, i64 8)
  %t3230 = extractvalue {i64, i1} %t3229, 0
  %t3231 = extractvalue {i64, i1} %t3229, 1
  br i1 %t3231, label %fixslow830, label %fixmerge831
fixslow830:
  %t3232 = call i64 @rt_sub(i64 %t3225, i64 8)
  br label %fixmerge831
fixmerge831:
  %t3233 = phi i64 [ %t3230, %fixfast829 ], [ %t3232, %fixslow830 ]
  %t3234 = load i64, ptr @"scheme.base:%ht-set-count!"
  %t3235 = and i64 %t3234, -8
  %t3236 = inttoptr i64 %t3235 to ptr
  %t3237 = load i64, ptr %t3236
  %t3238 = inttoptr i64 %t3237 to ptr
  %t3239 = musttail call fastcc i64 %t3238(i64 %t3234, i64 2, i64 %a0, i64 %t3233, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3239
else828:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_705"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3244 = icmp eq i64 %argc, 1
  br i1 %t3244, label %argok833, label %arityerr832
arityerr832:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok833:
  %t3245 = call i64 @rt_null_p(i64 %a0)
  %t3246 = icmp ne i64 %t3245, 1
  br i1 %t3246, label %then834, label %else835
then834:
  ret i64 1
else835:
  %t3247 = call i64 @rt_car(i64 %a0)
  %t3248 = call i64 @rt_car(i64 %t3247)
  %t3249 = and i64 %self, -8
  %t3250 = inttoptr i64 %t3249 to ptr
  %t3251 = getelementptr i64, ptr %t3250, i64 1
  %t3252 = load i64, ptr %t3251
  %t3253 = load i64, ptr @"scheme.base:%ht-index"
  %t3254 = and i64 %t3253, -8
  %t3255 = inttoptr i64 %t3254 to ptr
  %t3256 = load i64, ptr %t3255
  %t3257 = inttoptr i64 %t3256 to ptr
  %t3258 = call fastcc i64%t3257(i64 %t3253, i64 2, i64 %t3248, i64 %t3252, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3259 = and i64 %self, -8
  %t3260 = inttoptr i64 %t3259 to ptr
  %t3261 = getelementptr i64, ptr %t3260, i64 2
  %t3262 = load i64, ptr %t3261
  %t3263 = and i64 %self, -8
  %t3264 = inttoptr i64 %t3263 to ptr
  %t3265 = getelementptr i64, ptr %t3264, i64 2
  %t3266 = load i64, ptr %t3265
  %t3267 = call i64 @rt_vector_ref(i64 %t3266, i64 %t3258)
  %t3268 = call i64 @rt_cons(i64 %t3247, i64 %t3267)
  %t3269 = call i64 @rt_vector_set(i64 %t3262, i64 %t3258, i64 %t3268)
  %t3270 = call i64 @rt_cdr(i64 %a0)
  %t3271 = musttail call fastcc i64 @"scheme.base:code_705"(i64 %self, i64 1, i64 %t3270, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3271
}

define fastcc i64 @"scheme.base:code_703"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3272 = icmp eq i64 %argc, 1
  br i1 %t3272, label %argok837, label %arityerr836
arityerr836:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok837:
  %t3273 = and i64 %self, -8
  %t3274 = inttoptr i64 %t3273 to ptr
  %t3275 = getelementptr i64, ptr %t3274, i64 1
  %t3276 = load i64, ptr %t3275
  %t3277 = call i64 @rt_vector_length(i64 %t3276)
  %t3278 = or i64 %a0, %t3277
  %t3279 = and i64 %t3278, 7
  %t3280 = icmp eq i64 %t3279, 0
  br i1 %t3280, label %fixfast838, label %fixslow839
fixfast838:
  %t3281 = icmp slt i64 %a0, %t3277
  %t3282 = select i1 %t3281, i64 257, i64 1
  br label %fixmerge840
fixslow839:
  %t3283 = call i64 @rt_lt(i64 %a0, i64 %t3277)
  br label %fixmerge840
fixmerge840:
  %t3284 = phi i64 [ %t3282, %fixfast838 ], [ %t3283, %fixslow839 ]
  %t3285 = icmp ne i64 %t3284, 1
  br i1 %t3285, label %then841, label %else842
then841:
  %t3286 = call ptr @rt_alloc_words(i64 4)
  %t3287 = ptrtoint ptr %t3286 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_705" to i64), ptr %t3286
  %t3288 = or i64 %t3287, 4
  %t3289 = and i64 %self, -8
  %t3290 = inttoptr i64 %t3289 to ptr
  %t3291 = getelementptr i64, ptr %t3290, i64 2
  %t3292 = load i64, ptr %t3291
  %t3293 = getelementptr i64, ptr %t3286, i64 1
  store i64 %t3292, ptr %t3293
  %t3294 = and i64 %self, -8
  %t3295 = inttoptr i64 %t3294 to ptr
  %t3296 = getelementptr i64, ptr %t3295, i64 3
  %t3297 = load i64, ptr %t3296
  %t3298 = getelementptr i64, ptr %t3286, i64 2
  store i64 %t3297, ptr %t3298
  %t3299 = getelementptr i64, ptr %t3286, i64 3
  store i64 %t3288, ptr %t3299
  %t3300 = and i64 %self, -8
  %t3301 = inttoptr i64 %t3300 to ptr
  %t3302 = getelementptr i64, ptr %t3301, i64 1
  %t3303 = load i64, ptr %t3302
  %t3304 = call i64 @rt_vector_ref(i64 %t3303, i64 %a0)
  %t3305 = call fastcc i64 @"scheme.base:code_705"(i64 %t3288, i64 1, i64 %t3304, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3306 = or i64 %a0, 8
  %t3307 = and i64 %t3306, 7
  %t3308 = icmp eq i64 %t3307, 0
  br i1 %t3308, label %fixfast843, label %fixslow844
fixfast843:
  %t3309 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3310 = extractvalue {i64, i1} %t3309, 0
  %t3311 = extractvalue {i64, i1} %t3309, 1
  br i1 %t3311, label %fixslow844, label %fixmerge845
fixslow844:
  %t3312 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge845
fixmerge845:
  %t3313 = phi i64 [ %t3310, %fixfast843 ], [ %t3312, %fixslow844 ]
  %t3314 = musttail call fastcc i64 @"scheme.base:code_703"(i64 %self, i64 1, i64 %t3313, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3314
else842:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%ht-grow!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3315 = icmp eq i64 %argc, 1
  br i1 %t3315, label %argok847, label %arityerr846
arityerr846:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok847:
  %t3316 = load i64, ptr @"scheme.base:%ht-buckets"
  %t3317 = and i64 %t3316, -8
  %t3318 = inttoptr i64 %t3317 to ptr
  %t3319 = load i64, ptr %t3318
  %t3320 = inttoptr i64 %t3319 to ptr
  %t3321 = call fastcc i64%t3320(i64 %t3316, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3322 = call i64 @rt_vector_length(i64 %t3321)
  %t3323 = or i64 16, %t3322
  %t3324 = and i64 %t3323, 7
  %t3325 = icmp eq i64 %t3324, 0
  br i1 %t3325, label %fixfast848, label %fixslow849
fixfast848:
  %t3326 = ashr i64 16, 3
  %t3327 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t3326, i64 %t3322)
  %t3328 = extractvalue {i64, i1} %t3327, 0
  %t3329 = extractvalue {i64, i1} %t3327, 1
  br i1 %t3329, label %fixslow849, label %fixmerge850
fixslow849:
  %t3330 = call i64 @rt_mul(i64 16, i64 %t3322)
  br label %fixmerge850
fixmerge850:
  %t3331 = phi i64 [ %t3328, %fixfast848 ], [ %t3330, %fixslow849 ]
  %t3332 = call i64 @rt_make_vector(i64 %t3331, i64 2)
  %t3333 = call ptr @rt_alloc_words(i64 5)
  %t3334 = ptrtoint ptr %t3333 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_703" to i64), ptr %t3333
  %t3335 = or i64 %t3334, 4
  %t3336 = getelementptr i64, ptr %t3333, i64 1
  store i64 %t3321, ptr %t3336
  %t3337 = getelementptr i64, ptr %t3333, i64 2
  store i64 %t3331, ptr %t3337
  %t3338 = getelementptr i64, ptr %t3333, i64 3
  store i64 %t3332, ptr %t3338
  %t3339 = getelementptr i64, ptr %t3333, i64 4
  store i64 %t3335, ptr %t3339
  %t3340 = call fastcc i64 @"scheme.base:code_703"(i64 %t3335, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3341 = load i64, ptr @"scheme.base:%ht-set-buckets!"
  %t3342 = and i64 %t3341, -8
  %t3343 = inttoptr i64 %t3342 to ptr
  %t3344 = load i64, ptr %t3343
  %t3345 = inttoptr i64 %t3344 to ptr
  %t3346 = musttail call fastcc i64 %t3345(i64 %t3341, i64 2, i64 %a0, i64 %t3332, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3346
}

define fastcc i64 @"scheme.base:code:hash-table-size"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3351 = icmp eq i64 %argc, 1
  br i1 %t3351, label %argok852, label %arityerr851
arityerr851:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok852:
  %t3352 = load i64, ptr @"scheme.base:%ht-count"
  %t3353 = and i64 %t3352, -8
  %t3354 = inttoptr i64 %t3353 to ptr
  %t3355 = load i64, ptr %t3354
  %t3356 = inttoptr i64 %t3355 to ptr
  %t3357 = musttail call fastcc i64 %t3356(i64 %t3352, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3357
}

define fastcc i64 @"scheme.base:code:%ht-fold-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3362 = icmp eq i64 %argc, 2
  br i1 %t3362, label %argok854, label %arityerr853
arityerr853:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok854:
  %t3363 = call i64 @rt_null_p(i64 %a0)
  %t3364 = icmp ne i64 %t3363, 1
  br i1 %t3364, label %then855, label %else856
then855:
  ret i64 %a1
else856:
  %t3365 = call i64 @rt_car(i64 %a0)
  %t3366 = call i64 @rt_car(i64 %t3365)
  %t3367 = call i64 @rt_car(i64 %a0)
  %t3368 = call i64 @rt_cdr(i64 %t3367)
  %t3369 = call i64 @rt_cons(i64 %t3366, i64 %t3368)
  %t3370 = call i64 @rt_cdr(i64 %a0)
  %t3371 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  %t3372 = and i64 %t3371, -8
  %t3373 = inttoptr i64 %t3372 to ptr
  %t3374 = load i64, ptr %t3373
  %t3375 = inttoptr i64 %t3374 to ptr
  %t3376 = call fastcc i64%t3375(i64 %t3371, i64 2, i64 %t3370, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3377 = call i64 @rt_cons(i64 %t3369, i64 %t3376)
  ret i64 %t3377
}

define fastcc i64 @"scheme.base:code_722"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3382 = icmp eq i64 %argc, 2
  br i1 %t3382, label %argok858, label %arityerr857
arityerr857:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok858:
  %t3383 = and i64 %self, -8
  %t3384 = inttoptr i64 %t3383 to ptr
  %t3385 = getelementptr i64, ptr %t3384, i64 1
  %t3386 = load i64, ptr %t3385
  %t3387 = call i64 @rt_vector_length(i64 %t3386)
  %t3388 = or i64 %a0, %t3387
  %t3389 = and i64 %t3388, 7
  %t3390 = icmp eq i64 %t3389, 0
  br i1 %t3390, label %fixfast859, label %fixslow860
fixfast859:
  %t3391 = icmp slt i64 %a0, %t3387
  %t3392 = select i1 %t3391, i64 257, i64 1
  br label %fixmerge861
fixslow860:
  %t3393 = call i64 @rt_lt(i64 %a0, i64 %t3387)
  br label %fixmerge861
fixmerge861:
  %t3394 = phi i64 [ %t3392, %fixfast859 ], [ %t3393, %fixslow860 ]
  %t3395 = icmp ne i64 %t3394, 1
  br i1 %t3395, label %then862, label %else863
then862:
  %t3396 = or i64 %a0, 8
  %t3397 = and i64 %t3396, 7
  %t3398 = icmp eq i64 %t3397, 0
  br i1 %t3398, label %fixfast864, label %fixslow865
fixfast864:
  %t3399 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3400 = extractvalue {i64, i1} %t3399, 0
  %t3401 = extractvalue {i64, i1} %t3399, 1
  br i1 %t3401, label %fixslow865, label %fixmerge866
fixslow865:
  %t3402 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge866
fixmerge866:
  %t3403 = phi i64 [ %t3400, %fixfast864 ], [ %t3402, %fixslow865 ]
  %t3404 = and i64 %self, -8
  %t3405 = inttoptr i64 %t3404 to ptr
  %t3406 = getelementptr i64, ptr %t3405, i64 1
  %t3407 = load i64, ptr %t3406
  %t3408 = call i64 @rt_vector_ref(i64 %t3407, i64 %a0)
  %t3409 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  %t3410 = and i64 %t3409, -8
  %t3411 = inttoptr i64 %t3410 to ptr
  %t3412 = load i64, ptr %t3411
  %t3413 = inttoptr i64 %t3412 to ptr
  %t3414 = call fastcc i64%t3413(i64 %t3409, i64 2, i64 %t3408, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3415 = musttail call fastcc i64 @"scheme.base:code_722"(i64 %self, i64 2, i64 %t3403, i64 %t3414, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3415
else863:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:hash-table->alist"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3416 = icmp eq i64 %argc, 1
  br i1 %t3416, label %argok868, label %arityerr867
arityerr867:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok868:
  %t3417 = load i64, ptr @"scheme.base:%ht-buckets"
  %t3418 = and i64 %t3417, -8
  %t3419 = inttoptr i64 %t3418 to ptr
  %t3420 = load i64, ptr %t3419
  %t3421 = inttoptr i64 %t3420 to ptr
  %t3422 = call fastcc i64%t3421(i64 %t3417, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3423 = call ptr @rt_alloc_words(i64 3)
  %t3424 = ptrtoint ptr %t3423 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_722" to i64), ptr %t3423
  %t3425 = or i64 %t3424, 4
  %t3426 = getelementptr i64, ptr %t3423, i64 1
  store i64 %t3422, ptr %t3426
  %t3427 = getelementptr i64, ptr %t3423, i64 2
  store i64 %t3425, ptr %t3427
  %t3428 = musttail call fastcc i64 @"scheme.base:code_722"(i64 %t3425, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3428
}

define fastcc i64 @"scheme.base:code_727"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3433 = icmp eq i64 %argc, 1
  br i1 %t3433, label %argok870, label %arityerr869
arityerr869:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok870:
  %t3434 = call i64 @rt_car(i64 %a0)
  ret i64 %t3434
}

define fastcc i64 @"scheme.base:code:hash-table-keys"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3435 = icmp eq i64 %argc, 1
  br i1 %t3435, label %argok872, label %arityerr871
arityerr871:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok872:
  %t3436 = call ptr @rt_alloc_words(i64 1)
  %t3437 = ptrtoint ptr %t3436 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_727" to i64), ptr %t3436
  %t3438 = or i64 %t3437, 4
  %t3439 = load i64, ptr @"scheme.base:hash-table->alist"
  %t3440 = and i64 %t3439, -8
  %t3441 = inttoptr i64 %t3440 to ptr
  %t3442 = load i64, ptr %t3441
  %t3443 = inttoptr i64 %t3442 to ptr
  %t3444 = call fastcc i64%t3443(i64 %t3439, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3445 = load i64, ptr @"scheme.base:map"
  %t3446 = and i64 %t3445, -8
  %t3447 = inttoptr i64 %t3446 to ptr
  %t3448 = load i64, ptr %t3447
  %t3449 = inttoptr i64 %t3448 to ptr
  %t3450 = musttail call fastcc i64 %t3449(i64 %t3445, i64 2, i64 %t3438, i64 %t3444, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3450
}

define fastcc i64 @"scheme.base:code_732"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3455 = icmp eq i64 %argc, 1
  br i1 %t3455, label %argok874, label %arityerr873
arityerr873:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok874:
  %t3456 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t3456
}

define fastcc i64 @"scheme.base:code:hash-table-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3457 = icmp eq i64 %argc, 1
  br i1 %t3457, label %argok876, label %arityerr875
arityerr875:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok876:
  %t3458 = call ptr @rt_alloc_words(i64 1)
  %t3459 = ptrtoint ptr %t3458 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_732" to i64), ptr %t3458
  %t3460 = or i64 %t3459, 4
  %t3461 = load i64, ptr @"scheme.base:hash-table->alist"
  %t3462 = and i64 %t3461, -8
  %t3463 = inttoptr i64 %t3462 to ptr
  %t3464 = load i64, ptr %t3463
  %t3465 = inttoptr i64 %t3464 to ptr
  %t3466 = call fastcc i64%t3465(i64 %t3461, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3467 = load i64, ptr @"scheme.base:map"
  %t3468 = and i64 %t3467, -8
  %t3469 = inttoptr i64 %t3468 to ptr
  %t3470 = load i64, ptr %t3469
  %t3471 = inttoptr i64 %t3470 to ptr
  %t3472 = musttail call fastcc i64 %t3471(i64 %t3467, i64 2, i64 %t3460, i64 %t3466, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3472
}

define fastcc i64 @"scheme.base:code:rd-ws?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3477 = icmp eq i64 %argc, 1
  br i1 %t3477, label %argok878, label %arityerr877
arityerr877:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok878:
  %t3478 = call i64 @rt_char_to_integer(i64 %a0)
  %t3479 = or i64 %t3478, 256
  %t3480 = and i64 %t3479, 7
  %t3481 = icmp eq i64 %t3480, 0
  br i1 %t3481, label %fixfast879, label %fixslow880
fixfast879:
  %t3482 = icmp eq i64 %t3478, 256
  %t3483 = select i1 %t3482, i64 257, i64 1
  br label %fixmerge881
fixslow880:
  %t3484 = call i64 @rt_num_eq(i64 %t3478, i64 256)
  br label %fixmerge881
fixmerge881:
  %t3485 = phi i64 [ %t3483, %fixfast879 ], [ %t3484, %fixslow880 ]
  %t3486 = icmp ne i64 %t3485, 1
  br i1 %t3486, label %then882, label %else883
then882:
  ret i64 %t3485
else883:
  %t3487 = or i64 %t3478, 72
  %t3488 = and i64 %t3487, 7
  %t3489 = icmp eq i64 %t3488, 0
  br i1 %t3489, label %fixfast884, label %fixslow885
fixfast884:
  %t3490 = icmp eq i64 %t3478, 72
  %t3491 = select i1 %t3490, i64 257, i64 1
  br label %fixmerge886
fixslow885:
  %t3492 = call i64 @rt_num_eq(i64 %t3478, i64 72)
  br label %fixmerge886
fixmerge886:
  %t3493 = phi i64 [ %t3491, %fixfast884 ], [ %t3492, %fixslow885 ]
  %t3494 = icmp ne i64 %t3493, 1
  br i1 %t3494, label %then887, label %else888
then887:
  ret i64 %t3493
else888:
  %t3495 = or i64 %t3478, 80
  %t3496 = and i64 %t3495, 7
  %t3497 = icmp eq i64 %t3496, 0
  br i1 %t3497, label %fixfast889, label %fixslow890
fixfast889:
  %t3498 = icmp eq i64 %t3478, 80
  %t3499 = select i1 %t3498, i64 257, i64 1
  br label %fixmerge891
fixslow890:
  %t3500 = call i64 @rt_num_eq(i64 %t3478, i64 80)
  br label %fixmerge891
fixmerge891:
  %t3501 = phi i64 [ %t3499, %fixfast889 ], [ %t3500, %fixslow890 ]
  %t3502 = icmp ne i64 %t3501, 1
  br i1 %t3502, label %then892, label %else893
then892:
  ret i64 %t3501
else893:
  %t3503 = or i64 %t3478, 104
  %t3504 = and i64 %t3503, 7
  %t3505 = icmp eq i64 %t3504, 0
  br i1 %t3505, label %fixfast894, label %fixslow895
fixfast894:
  %t3506 = icmp eq i64 %t3478, 104
  %t3507 = select i1 %t3506, i64 257, i64 1
  br label %fixmerge896
fixslow895:
  %t3508 = call i64 @rt_num_eq(i64 %t3478, i64 104)
  br label %fixmerge896
fixmerge896:
  %t3509 = phi i64 [ %t3507, %fixfast894 ], [ %t3508, %fixslow895 ]
  ret i64 %t3509
}

define fastcc i64 @"scheme.base:code:rd-digit?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3514 = icmp eq i64 %argc, 1
  br i1 %t3514, label %argok898, label %arityerr897
arityerr897:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok898:
  %t3515 = call i64 @rt_char_to_integer(i64 %a0)
  %t3516 = or i64 376, %t3515
  %t3517 = and i64 %t3516, 7
  %t3518 = icmp eq i64 %t3517, 0
  br i1 %t3518, label %fixfast899, label %fixslow900
fixfast899:
  %t3519 = icmp slt i64 376, %t3515
  %t3520 = select i1 %t3519, i64 257, i64 1
  br label %fixmerge901
fixslow900:
  %t3521 = call i64 @rt_lt(i64 376, i64 %t3515)
  br label %fixmerge901
fixmerge901:
  %t3522 = phi i64 [ %t3520, %fixfast899 ], [ %t3521, %fixslow900 ]
  %t3523 = icmp ne i64 %t3522, 1
  br i1 %t3523, label %then902, label %else903
then902:
  %t3524 = or i64 %t3515, 464
  %t3525 = and i64 %t3524, 7
  %t3526 = icmp eq i64 %t3525, 0
  br i1 %t3526, label %fixfast904, label %fixslow905
fixfast904:
  %t3527 = icmp slt i64 %t3515, 464
  %t3528 = select i1 %t3527, i64 257, i64 1
  br label %fixmerge906
fixslow905:
  %t3529 = call i64 @rt_lt(i64 %t3515, i64 464)
  br label %fixmerge906
fixmerge906:
  %t3530 = phi i64 [ %t3528, %fixfast904 ], [ %t3529, %fixslow905 ]
  ret i64 %t3530
else903:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rd-delim?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3535 = icmp eq i64 %argc, 1
  br i1 %t3535, label %argok908, label %arityerr907
arityerr907:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok908:
  %t3536 = call i64 @rt_char_to_integer(i64 %a0)
  %t3537 = load i64, ptr @"scheme.base:rd-ws?"
  %t3538 = and i64 %t3537, -8
  %t3539 = inttoptr i64 %t3538 to ptr
  %t3540 = load i64, ptr %t3539
  %t3541 = inttoptr i64 %t3540 to ptr
  %t3542 = call fastcc i64%t3541(i64 %t3537, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3543 = icmp ne i64 %t3542, 1
  br i1 %t3543, label %then909, label %else910
then909:
  ret i64 %t3542
else910:
  %t3544 = or i64 %t3536, 320
  %t3545 = and i64 %t3544, 7
  %t3546 = icmp eq i64 %t3545, 0
  br i1 %t3546, label %fixfast911, label %fixslow912
fixfast911:
  %t3547 = icmp eq i64 %t3536, 320
  %t3548 = select i1 %t3547, i64 257, i64 1
  br label %fixmerge913
fixslow912:
  %t3549 = call i64 @rt_num_eq(i64 %t3536, i64 320)
  br label %fixmerge913
fixmerge913:
  %t3550 = phi i64 [ %t3548, %fixfast911 ], [ %t3549, %fixslow912 ]
  %t3551 = icmp ne i64 %t3550, 1
  br i1 %t3551, label %then914, label %else915
then914:
  ret i64 %t3550
else915:
  %t3552 = or i64 %t3536, 328
  %t3553 = and i64 %t3552, 7
  %t3554 = icmp eq i64 %t3553, 0
  br i1 %t3554, label %fixfast916, label %fixslow917
fixfast916:
  %t3555 = icmp eq i64 %t3536, 328
  %t3556 = select i1 %t3555, i64 257, i64 1
  br label %fixmerge918
fixslow917:
  %t3557 = call i64 @rt_num_eq(i64 %t3536, i64 328)
  br label %fixmerge918
fixmerge918:
  %t3558 = phi i64 [ %t3556, %fixfast916 ], [ %t3557, %fixslow917 ]
  %t3559 = icmp ne i64 %t3558, 1
  br i1 %t3559, label %then919, label %else920
then919:
  ret i64 %t3558
else920:
  %t3560 = or i64 %t3536, 728
  %t3561 = and i64 %t3560, 7
  %t3562 = icmp eq i64 %t3561, 0
  br i1 %t3562, label %fixfast921, label %fixslow922
fixfast921:
  %t3563 = icmp eq i64 %t3536, 728
  %t3564 = select i1 %t3563, i64 257, i64 1
  br label %fixmerge923
fixslow922:
  %t3565 = call i64 @rt_num_eq(i64 %t3536, i64 728)
  br label %fixmerge923
fixmerge923:
  %t3566 = phi i64 [ %t3564, %fixfast921 ], [ %t3565, %fixslow922 ]
  %t3567 = icmp ne i64 %t3566, 1
  br i1 %t3567, label %then924, label %else925
then924:
  ret i64 %t3566
else925:
  %t3568 = or i64 %t3536, 744
  %t3569 = and i64 %t3568, 7
  %t3570 = icmp eq i64 %t3569, 0
  br i1 %t3570, label %fixfast926, label %fixslow927
fixfast926:
  %t3571 = icmp eq i64 %t3536, 744
  %t3572 = select i1 %t3571, i64 257, i64 1
  br label %fixmerge928
fixslow927:
  %t3573 = call i64 @rt_num_eq(i64 %t3536, i64 744)
  br label %fixmerge928
fixmerge928:
  %t3574 = phi i64 [ %t3572, %fixfast926 ], [ %t3573, %fixslow927 ]
  %t3575 = icmp ne i64 %t3574, 1
  br i1 %t3575, label %then929, label %else930
then929:
  ret i64 %t3574
else930:
  %t3576 = or i64 %t3536, 272
  %t3577 = and i64 %t3576, 7
  %t3578 = icmp eq i64 %t3577, 0
  br i1 %t3578, label %fixfast931, label %fixslow932
fixfast931:
  %t3579 = icmp eq i64 %t3536, 272
  %t3580 = select i1 %t3579, i64 257, i64 1
  br label %fixmerge933
fixslow932:
  %t3581 = call i64 @rt_num_eq(i64 %t3536, i64 272)
  br label %fixmerge933
fixmerge933:
  %t3582 = phi i64 [ %t3580, %fixfast931 ], [ %t3581, %fixslow932 ]
  %t3583 = icmp ne i64 %t3582, 1
  br i1 %t3583, label %then934, label %else935
then934:
  ret i64 %t3582
else935:
  %t3584 = or i64 %t3536, 472
  %t3585 = and i64 %t3584, 7
  %t3586 = icmp eq i64 %t3585, 0
  br i1 %t3586, label %fixfast936, label %fixslow937
fixfast936:
  %t3587 = icmp eq i64 %t3536, 472
  %t3588 = select i1 %t3587, i64 257, i64 1
  br label %fixmerge938
fixslow937:
  %t3589 = call i64 @rt_num_eq(i64 %t3536, i64 472)
  br label %fixmerge938
fixmerge938:
  %t3590 = phi i64 [ %t3588, %fixfast936 ], [ %t3589, %fixslow937 ]
  ret i64 %t3590
}

define fastcc i64 @"scheme.base:code:rd-skip-line"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3595 = icmp eq i64 %argc, 3
  br i1 %t3595, label %argok940, label %arityerr939
arityerr939:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok940:
  %t3596 = or i64 %a2, %a1
  %t3597 = and i64 %t3596, 7
  %t3598 = icmp eq i64 %t3597, 0
  br i1 %t3598, label %fixfast941, label %fixslow942
fixfast941:
  %t3599 = icmp slt i64 %a2, %a1
  %t3600 = select i1 %t3599, i64 257, i64 1
  br label %fixmerge943
fixslow942:
  %t3601 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge943
fixmerge943:
  %t3602 = phi i64 [ %t3600, %fixfast941 ], [ %t3601, %fixslow942 ]
  %t3603 = icmp ne i64 %t3602, 1
  br i1 %t3603, label %then944, label %else945
then944:
  %t3604 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3605 = call i64 @rt_char_to_integer(i64 %t3604)
  %t3606 = or i64 %t3605, 80
  %t3607 = and i64 %t3606, 7
  %t3608 = icmp eq i64 %t3607, 0
  br i1 %t3608, label %fixfast946, label %fixslow947
fixfast946:
  %t3609 = icmp eq i64 %t3605, 80
  %t3610 = select i1 %t3609, i64 257, i64 1
  br label %fixmerge948
fixslow947:
  %t3611 = call i64 @rt_num_eq(i64 %t3605, i64 80)
  br label %fixmerge948
fixmerge948:
  %t3612 = phi i64 [ %t3610, %fixfast946 ], [ %t3611, %fixslow947 ]
  %t3613 = icmp ne i64 %t3612, 1
  br i1 %t3613, label %then949, label %else950
then949:
  %t3614 = or i64 %a2, 8
  %t3615 = and i64 %t3614, 7
  %t3616 = icmp eq i64 %t3615, 0
  br i1 %t3616, label %fixfast951, label %fixslow952
fixfast951:
  %t3617 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3618 = extractvalue {i64, i1} %t3617, 0
  %t3619 = extractvalue {i64, i1} %t3617, 1
  br i1 %t3619, label %fixslow952, label %fixmerge953
fixslow952:
  %t3620 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge953
fixmerge953:
  %t3621 = phi i64 [ %t3618, %fixfast951 ], [ %t3620, %fixslow952 ]
  ret i64 %t3621
else950:
  %t3622 = or i64 %a2, 8
  %t3623 = and i64 %t3622, 7
  %t3624 = icmp eq i64 %t3623, 0
  br i1 %t3624, label %fixfast954, label %fixslow955
fixfast954:
  %t3625 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3626 = extractvalue {i64, i1} %t3625, 0
  %t3627 = extractvalue {i64, i1} %t3625, 1
  br i1 %t3627, label %fixslow955, label %fixmerge956
fixslow955:
  %t3628 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge956
fixmerge956:
  %t3629 = phi i64 [ %t3626, %fixfast954 ], [ %t3628, %fixslow955 ]
  %t3630 = load i64, ptr @"scheme.base:rd-skip-line"
  %t3631 = and i64 %t3630, -8
  %t3632 = inttoptr i64 %t3631 to ptr
  %t3633 = load i64, ptr %t3632
  %t3634 = inttoptr i64 %t3633 to ptr
  %t3635 = musttail call fastcc i64 %t3634(i64 %t3630, i64 3, i64 %a0, i64 %a1, i64 %t3629, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3635
else945:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:rd-skip-ws"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3640 = icmp eq i64 %argc, 3
  br i1 %t3640, label %argok958, label %arityerr957
arityerr957:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok958:
  %t3641 = or i64 %a2, %a1
  %t3642 = and i64 %t3641, 7
  %t3643 = icmp eq i64 %t3642, 0
  br i1 %t3643, label %fixfast959, label %fixslow960
fixfast959:
  %t3644 = icmp slt i64 %a2, %a1
  %t3645 = select i1 %t3644, i64 257, i64 1
  br label %fixmerge961
fixslow960:
  %t3646 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge961
fixmerge961:
  %t3647 = phi i64 [ %t3645, %fixfast959 ], [ %t3646, %fixslow960 ]
  %t3648 = icmp ne i64 %t3647, 1
  br i1 %t3648, label %then962, label %else963
then962:
  %t3649 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3650 = load i64, ptr @"scheme.base:rd-ws?"
  %t3651 = and i64 %t3650, -8
  %t3652 = inttoptr i64 %t3651 to ptr
  %t3653 = load i64, ptr %t3652
  %t3654 = inttoptr i64 %t3653 to ptr
  %t3655 = call fastcc i64%t3654(i64 %t3650, i64 1, i64 %t3649, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3656 = icmp ne i64 %t3655, 1
  br i1 %t3656, label %then964, label %else965
then964:
  %t3657 = or i64 %a2, 8
  %t3658 = and i64 %t3657, 7
  %t3659 = icmp eq i64 %t3658, 0
  br i1 %t3659, label %fixfast966, label %fixslow967
fixfast966:
  %t3660 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3661 = extractvalue {i64, i1} %t3660, 0
  %t3662 = extractvalue {i64, i1} %t3660, 1
  br i1 %t3662, label %fixslow967, label %fixmerge968
fixslow967:
  %t3663 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge968
fixmerge968:
  %t3664 = phi i64 [ %t3661, %fixfast966 ], [ %t3663, %fixslow967 ]
  %t3665 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3666 = and i64 %t3665, -8
  %t3667 = inttoptr i64 %t3666 to ptr
  %t3668 = load i64, ptr %t3667
  %t3669 = inttoptr i64 %t3668 to ptr
  %t3670 = musttail call fastcc i64 %t3669(i64 %t3665, i64 3, i64 %a0, i64 %a1, i64 %t3664, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3670
else965:
  %t3671 = call i64 @rt_char_to_integer(i64 %t3649)
  %t3672 = or i64 %t3671, 472
  %t3673 = and i64 %t3672, 7
  %t3674 = icmp eq i64 %t3673, 0
  br i1 %t3674, label %fixfast969, label %fixslow970
fixfast969:
  %t3675 = icmp eq i64 %t3671, 472
  %t3676 = select i1 %t3675, i64 257, i64 1
  br label %fixmerge971
fixslow970:
  %t3677 = call i64 @rt_num_eq(i64 %t3671, i64 472)
  br label %fixmerge971
fixmerge971:
  %t3678 = phi i64 [ %t3676, %fixfast969 ], [ %t3677, %fixslow970 ]
  %t3679 = icmp ne i64 %t3678, 1
  br i1 %t3679, label %then972, label %else973
then972:
  %t3680 = or i64 %a2, 8
  %t3681 = and i64 %t3680, 7
  %t3682 = icmp eq i64 %t3681, 0
  br i1 %t3682, label %fixfast974, label %fixslow975
fixfast974:
  %t3683 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3684 = extractvalue {i64, i1} %t3683, 0
  %t3685 = extractvalue {i64, i1} %t3683, 1
  br i1 %t3685, label %fixslow975, label %fixmerge976
fixslow975:
  %t3686 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge976
fixmerge976:
  %t3687 = phi i64 [ %t3684, %fixfast974 ], [ %t3686, %fixslow975 ]
  %t3688 = load i64, ptr @"scheme.base:rd-skip-line"
  %t3689 = and i64 %t3688, -8
  %t3690 = inttoptr i64 %t3689 to ptr
  %t3691 = load i64, ptr %t3690
  %t3692 = inttoptr i64 %t3691 to ptr
  %t3693 = call fastcc i64%t3692(i64 %t3688, i64 3, i64 %a0, i64 %a1, i64 %t3687, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3694 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t3695 = and i64 %t3694, -8
  %t3696 = inttoptr i64 %t3695 to ptr
  %t3697 = load i64, ptr %t3696
  %t3698 = inttoptr i64 %t3697 to ptr
  %t3699 = musttail call fastcc i64 %t3698(i64 %t3694, i64 3, i64 %a0, i64 %a1, i64 %t3693, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3699
else973:
  ret i64 %a2
else963:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:rd-token-end"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3704 = icmp eq i64 %argc, 3
  br i1 %t3704, label %argok978, label %arityerr977
arityerr977:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok978:
  %t3705 = or i64 %a2, %a1
  %t3706 = and i64 %t3705, 7
  %t3707 = icmp eq i64 %t3706, 0
  br i1 %t3707, label %fixfast979, label %fixslow980
fixfast979:
  %t3708 = icmp slt i64 %a2, %a1
  %t3709 = select i1 %t3708, i64 257, i64 1
  br label %fixmerge981
fixslow980:
  %t3710 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge981
fixmerge981:
  %t3711 = phi i64 [ %t3709, %fixfast979 ], [ %t3710, %fixslow980 ]
  %t3712 = icmp ne i64 %t3711, 1
  br i1 %t3712, label %then982, label %else983
then982:
  %t3713 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t3714 = load i64, ptr @"scheme.base:rd-delim?"
  %t3715 = and i64 %t3714, -8
  %t3716 = inttoptr i64 %t3715 to ptr
  %t3717 = load i64, ptr %t3716
  %t3718 = inttoptr i64 %t3717 to ptr
  %t3719 = call fastcc i64%t3718(i64 %t3714, i64 1, i64 %t3713, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3720 = icmp ne i64 %t3719, 1
  br i1 %t3720, label %then984, label %else985
then984:
  ret i64 %a2
else985:
  %t3721 = or i64 %a2, 8
  %t3722 = and i64 %t3721, 7
  %t3723 = icmp eq i64 %t3722, 0
  br i1 %t3723, label %fixfast986, label %fixslow987
fixfast986:
  %t3724 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t3725 = extractvalue {i64, i1} %t3724, 0
  %t3726 = extractvalue {i64, i1} %t3724, 1
  br i1 %t3726, label %fixslow987, label %fixmerge988
fixslow987:
  %t3727 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge988
fixmerge988:
  %t3728 = phi i64 [ %t3725, %fixfast986 ], [ %t3727, %fixslow987 ]
  %t3729 = load i64, ptr @"scheme.base:rd-token-end"
  %t3730 = and i64 %t3729, -8
  %t3731 = inttoptr i64 %t3730 to ptr
  %t3732 = load i64, ptr %t3731
  %t3733 = inttoptr i64 %t3732 to ptr
  %t3734 = musttail call fastcc i64 %t3733(i64 %t3729, i64 3, i64 %a0, i64 %a1, i64 %t3728, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3734
else983:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:rd-all-digits?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3739 = icmp eq i64 %argc, 3
  br i1 %t3739, label %argok990, label %arityerr989
arityerr989:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok990:
  %t3740 = or i64 %a1, %a2
  %t3741 = and i64 %t3740, 7
  %t3742 = icmp eq i64 %t3741, 0
  br i1 %t3742, label %fixfast991, label %fixslow992
fixfast991:
  %t3743 = icmp slt i64 %a1, %a2
  %t3744 = select i1 %t3743, i64 257, i64 1
  br label %fixmerge993
fixslow992:
  %t3745 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge993
fixmerge993:
  %t3746 = phi i64 [ %t3744, %fixfast991 ], [ %t3745, %fixslow992 ]
  %t3747 = icmp ne i64 %t3746, 1
  br i1 %t3747, label %then994, label %else995
then994:
  %t3748 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t3749 = load i64, ptr @"scheme.base:rd-digit?"
  %t3750 = and i64 %t3749, -8
  %t3751 = inttoptr i64 %t3750 to ptr
  %t3752 = load i64, ptr %t3751
  %t3753 = inttoptr i64 %t3752 to ptr
  %t3754 = call fastcc i64%t3753(i64 %t3749, i64 1, i64 %t3748, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3755 = icmp ne i64 %t3754, 1
  br i1 %t3755, label %then996, label %else997
then996:
  %t3756 = or i64 %a1, 8
  %t3757 = and i64 %t3756, 7
  %t3758 = icmp eq i64 %t3757, 0
  br i1 %t3758, label %fixfast998, label %fixslow999
fixfast998:
  %t3759 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t3760 = extractvalue {i64, i1} %t3759, 0
  %t3761 = extractvalue {i64, i1} %t3759, 1
  br i1 %t3761, label %fixslow999, label %fixmerge1000
fixslow999:
  %t3762 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge1000
fixmerge1000:
  %t3763 = phi i64 [ %t3760, %fixfast998 ], [ %t3762, %fixslow999 ]
  %t3764 = load i64, ptr @"scheme.base:rd-all-digits?"
  %t3765 = and i64 %t3764, -8
  %t3766 = inttoptr i64 %t3765 to ptr
  %t3767 = load i64, ptr %t3766
  %t3768 = inttoptr i64 %t3767 to ptr
  %t3769 = musttail call fastcc i64 %t3768(i64 %t3764, i64 3, i64 %a0, i64 %t3763, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3769
else997:
  ret i64 1
else995:
  ret i64 257
}

define fastcc i64 @"scheme.base:code:rd-numeric?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3774 = icmp eq i64 %argc, 1
  br i1 %t3774, label %argok1002, label %arityerr1001
arityerr1001:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1002:
  %t3775 = call i64 @rt_string_length(i64 %a0)
  %t3776 = or i64 0, %t3775
  %t3777 = and i64 %t3776, 7
  %t3778 = icmp eq i64 %t3777, 0
  br i1 %t3778, label %fixfast1003, label %fixslow1004
fixfast1003:
  %t3779 = icmp slt i64 0, %t3775
  %t3780 = select i1 %t3779, i64 257, i64 1
  br label %fixmerge1005
fixslow1004:
  %t3781 = call i64 @rt_lt(i64 0, i64 %t3775)
  br label %fixmerge1005
fixmerge1005:
  %t3782 = phi i64 [ %t3780, %fixfast1003 ], [ %t3781, %fixslow1004 ]
  %t3783 = icmp ne i64 %t3782, 1
  br i1 %t3783, label %then1006, label %else1007
then1006:
  %t3784 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t3785 = call i64 @rt_char_to_integer(i64 %t3784)
  %t3786 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t3787 = load i64, ptr @"scheme.base:rd-digit?"
  %t3788 = and i64 %t3787, -8
  %t3789 = inttoptr i64 %t3788 to ptr
  %t3790 = load i64, ptr %t3789
  %t3791 = inttoptr i64 %t3790 to ptr
  %t3792 = call fastcc i64%t3791(i64 %t3787, i64 1, i64 %t3786, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3793 = icmp ne i64 %t3792, 1
  br i1 %t3793, label %then1008, label %else1009
then1008:
  %t3794 = load i64, ptr @"scheme.base:rd-all-digits?"
  %t3795 = and i64 %t3794, -8
  %t3796 = inttoptr i64 %t3795 to ptr
  %t3797 = load i64, ptr %t3796
  %t3798 = inttoptr i64 %t3797 to ptr
  %t3799 = musttail call fastcc i64 %t3798(i64 %t3794, i64 3, i64 %a0, i64 0, i64 %t3775, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3799
else1009:
  %t3800 = or i64 %t3785, 360
  %t3801 = and i64 %t3800, 7
  %t3802 = icmp eq i64 %t3801, 0
  br i1 %t3802, label %fixfast1010, label %fixslow1011
fixfast1010:
  %t3803 = icmp eq i64 %t3785, 360
  %t3804 = select i1 %t3803, i64 257, i64 1
  br label %fixmerge1012
fixslow1011:
  %t3805 = call i64 @rt_num_eq(i64 %t3785, i64 360)
  br label %fixmerge1012
fixmerge1012:
  %t3806 = phi i64 [ %t3804, %fixfast1010 ], [ %t3805, %fixslow1011 ]
  %t3807 = icmp ne i64 %t3806, 1
  br i1 %t3807, label %then1013, label %else1014
then1013:
  br label %merge1015
else1014:
  %t3808 = or i64 %t3785, 344
  %t3809 = and i64 %t3808, 7
  %t3810 = icmp eq i64 %t3809, 0
  br i1 %t3810, label %fixfast1016, label %fixslow1017
fixfast1016:
  %t3811 = icmp eq i64 %t3785, 344
  %t3812 = select i1 %t3811, i64 257, i64 1
  br label %fixmerge1018
fixslow1017:
  %t3813 = call i64 @rt_num_eq(i64 %t3785, i64 344)
  br label %fixmerge1018
fixmerge1018:
  %t3814 = phi i64 [ %t3812, %fixfast1016 ], [ %t3813, %fixslow1017 ]
  br label %merge1015
merge1015:
  %t3815 = phi i64 [ %t3806, %then1013 ], [ %t3814, %fixmerge1018 ]
  %t3816 = icmp ne i64 %t3815, 1
  br i1 %t3816, label %then1019, label %else1020
then1019:
  %t3817 = or i64 8, %t3775
  %t3818 = and i64 %t3817, 7
  %t3819 = icmp eq i64 %t3818, 0
  br i1 %t3819, label %fixfast1021, label %fixslow1022
fixfast1021:
  %t3820 = icmp slt i64 8, %t3775
  %t3821 = select i1 %t3820, i64 257, i64 1
  br label %fixmerge1023
fixslow1022:
  %t3822 = call i64 @rt_lt(i64 8, i64 %t3775)
  br label %fixmerge1023
fixmerge1023:
  %t3823 = phi i64 [ %t3821, %fixfast1021 ], [ %t3822, %fixslow1022 ]
  %t3824 = icmp ne i64 %t3823, 1
  br i1 %t3824, label %then1024, label %else1025
then1024:
  %t3825 = load i64, ptr @"scheme.base:rd-all-digits?"
  %t3826 = and i64 %t3825, -8
  %t3827 = inttoptr i64 %t3826 to ptr
  %t3828 = load i64, ptr %t3827
  %t3829 = inttoptr i64 %t3828 to ptr
  %t3830 = musttail call fastcc i64 %t3829(i64 %t3825, i64 3, i64 %a0, i64 8, i64 %t3775, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3830
else1025:
  ret i64 1
else1020:
  ret i64 1
else1007:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rd-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3835 = icmp eq i64 %argc, 4
  br i1 %t3835, label %argok1027, label %arityerr1026
arityerr1026:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1027:
  %t3836 = or i64 %a1, %a2
  %t3837 = and i64 %t3836, 7
  %t3838 = icmp eq i64 %t3837, 0
  br i1 %t3838, label %fixfast1028, label %fixslow1029
fixfast1028:
  %t3839 = icmp slt i64 %a1, %a2
  %t3840 = select i1 %t3839, i64 257, i64 1
  br label %fixmerge1030
fixslow1029:
  %t3841 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge1030
fixmerge1030:
  %t3842 = phi i64 [ %t3840, %fixfast1028 ], [ %t3841, %fixslow1029 ]
  %t3843 = icmp ne i64 %t3842, 1
  br i1 %t3843, label %then1031, label %else1032
then1031:
  %t3844 = or i64 %a1, 8
  %t3845 = and i64 %t3844, 7
  %t3846 = icmp eq i64 %t3845, 0
  br i1 %t3846, label %fixfast1033, label %fixslow1034
fixfast1033:
  %t3847 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t3848 = extractvalue {i64, i1} %t3847, 0
  %t3849 = extractvalue {i64, i1} %t3847, 1
  br i1 %t3849, label %fixslow1034, label %fixmerge1035
fixslow1034:
  %t3850 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge1035
fixmerge1035:
  %t3851 = phi i64 [ %t3848, %fixfast1033 ], [ %t3850, %fixslow1034 ]
  %t3852 = or i64 %a3, 80
  %t3853 = and i64 %t3852, 7
  %t3854 = icmp eq i64 %t3853, 0
  br i1 %t3854, label %fixfast1036, label %fixslow1037
fixfast1036:
  %t3855 = ashr i64 %a3, 3
  %t3856 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t3855, i64 80)
  %t3857 = extractvalue {i64, i1} %t3856, 0
  %t3858 = extractvalue {i64, i1} %t3856, 1
  br i1 %t3858, label %fixslow1037, label %fixmerge1038
fixslow1037:
  %t3859 = call i64 @rt_mul(i64 %a3, i64 80)
  br label %fixmerge1038
fixmerge1038:
  %t3860 = phi i64 [ %t3857, %fixfast1036 ], [ %t3859, %fixslow1037 ]
  %t3861 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t3862 = call i64 @rt_char_to_integer(i64 %t3861)
  %t3863 = or i64 %t3862, 384
  %t3864 = and i64 %t3863, 7
  %t3865 = icmp eq i64 %t3864, 0
  br i1 %t3865, label %fixfast1039, label %fixslow1040
fixfast1039:
  %t3866 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3862, i64 384)
  %t3867 = extractvalue {i64, i1} %t3866, 0
  %t3868 = extractvalue {i64, i1} %t3866, 1
  br i1 %t3868, label %fixslow1040, label %fixmerge1041
fixslow1040:
  %t3869 = call i64 @rt_sub(i64 %t3862, i64 384)
  br label %fixmerge1041
fixmerge1041:
  %t3870 = phi i64 [ %t3867, %fixfast1039 ], [ %t3869, %fixslow1040 ]
  %t3871 = or i64 %t3860, %t3870
  %t3872 = and i64 %t3871, 7
  %t3873 = icmp eq i64 %t3872, 0
  br i1 %t3873, label %fixfast1042, label %fixslow1043
fixfast1042:
  %t3874 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3860, i64 %t3870)
  %t3875 = extractvalue {i64, i1} %t3874, 0
  %t3876 = extractvalue {i64, i1} %t3874, 1
  br i1 %t3876, label %fixslow1043, label %fixmerge1044
fixslow1043:
  %t3877 = call i64 @rt_add(i64 %t3860, i64 %t3870)
  br label %fixmerge1044
fixmerge1044:
  %t3878 = phi i64 [ %t3875, %fixfast1042 ], [ %t3877, %fixslow1043 ]
  %t3879 = load i64, ptr @"scheme.base:rd-digits"
  %t3880 = and i64 %t3879, -8
  %t3881 = inttoptr i64 %t3880 to ptr
  %t3882 = load i64, ptr %t3881
  %t3883 = inttoptr i64 %t3882 to ptr
  %t3884 = musttail call fastcc i64 %t3883(i64 %t3879, i64 4, i64 %a0, i64 %t3851, i64 %a2, i64 %t3878, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3884
else1032:
  ret i64 %a3
}

define fastcc i64 @"scheme.base:code:rd-digits-neg"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3889 = icmp eq i64 %argc, 4
  br i1 %t3889, label %argok1046, label %arityerr1045
arityerr1045:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1046:
  %t3890 = or i64 %a1, %a2
  %t3891 = and i64 %t3890, 7
  %t3892 = icmp eq i64 %t3891, 0
  br i1 %t3892, label %fixfast1047, label %fixslow1048
fixfast1047:
  %t3893 = icmp slt i64 %a1, %a2
  %t3894 = select i1 %t3893, i64 257, i64 1
  br label %fixmerge1049
fixslow1048:
  %t3895 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge1049
fixmerge1049:
  %t3896 = phi i64 [ %t3894, %fixfast1047 ], [ %t3895, %fixslow1048 ]
  %t3897 = icmp ne i64 %t3896, 1
  br i1 %t3897, label %then1050, label %else1051
then1050:
  %t3898 = or i64 %a1, 8
  %t3899 = and i64 %t3898, 7
  %t3900 = icmp eq i64 %t3899, 0
  br i1 %t3900, label %fixfast1052, label %fixslow1053
fixfast1052:
  %t3901 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t3902 = extractvalue {i64, i1} %t3901, 0
  %t3903 = extractvalue {i64, i1} %t3901, 1
  br i1 %t3903, label %fixslow1053, label %fixmerge1054
fixslow1053:
  %t3904 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge1054
fixmerge1054:
  %t3905 = phi i64 [ %t3902, %fixfast1052 ], [ %t3904, %fixslow1053 ]
  %t3906 = or i64 %a3, 80
  %t3907 = and i64 %t3906, 7
  %t3908 = icmp eq i64 %t3907, 0
  br i1 %t3908, label %fixfast1055, label %fixslow1056
fixfast1055:
  %t3909 = ashr i64 %a3, 3
  %t3910 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t3909, i64 80)
  %t3911 = extractvalue {i64, i1} %t3910, 0
  %t3912 = extractvalue {i64, i1} %t3910, 1
  br i1 %t3912, label %fixslow1056, label %fixmerge1057
fixslow1056:
  %t3913 = call i64 @rt_mul(i64 %a3, i64 80)
  br label %fixmerge1057
fixmerge1057:
  %t3914 = phi i64 [ %t3911, %fixfast1055 ], [ %t3913, %fixslow1056 ]
  %t3915 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t3916 = call i64 @rt_char_to_integer(i64 %t3915)
  %t3917 = or i64 %t3916, 384
  %t3918 = and i64 %t3917, 7
  %t3919 = icmp eq i64 %t3918, 0
  br i1 %t3919, label %fixfast1058, label %fixslow1059
fixfast1058:
  %t3920 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3916, i64 384)
  %t3921 = extractvalue {i64, i1} %t3920, 0
  %t3922 = extractvalue {i64, i1} %t3920, 1
  br i1 %t3922, label %fixslow1059, label %fixmerge1060
fixslow1059:
  %t3923 = call i64 @rt_sub(i64 %t3916, i64 384)
  br label %fixmerge1060
fixmerge1060:
  %t3924 = phi i64 [ %t3921, %fixfast1058 ], [ %t3923, %fixslow1059 ]
  %t3925 = or i64 %t3914, %t3924
  %t3926 = and i64 %t3925, 7
  %t3927 = icmp eq i64 %t3926, 0
  br i1 %t3927, label %fixfast1061, label %fixslow1062
fixfast1061:
  %t3928 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3914, i64 %t3924)
  %t3929 = extractvalue {i64, i1} %t3928, 0
  %t3930 = extractvalue {i64, i1} %t3928, 1
  br i1 %t3930, label %fixslow1062, label %fixmerge1063
fixslow1062:
  %t3931 = call i64 @rt_sub(i64 %t3914, i64 %t3924)
  br label %fixmerge1063
fixmerge1063:
  %t3932 = phi i64 [ %t3929, %fixfast1061 ], [ %t3931, %fixslow1062 ]
  %t3933 = load i64, ptr @"scheme.base:rd-digits-neg"
  %t3934 = and i64 %t3933, -8
  %t3935 = inttoptr i64 %t3934 to ptr
  %t3936 = load i64, ptr %t3935
  %t3937 = inttoptr i64 %t3936 to ptr
  %t3938 = musttail call fastcc i64 %t3937(i64 %t3933, i64 4, i64 %a0, i64 %t3905, i64 %a2, i64 %t3932, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3938
else1051:
  ret i64 %a3
}

define fastcc i64 @"scheme.base:code:rd-parse-int"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3943 = icmp eq i64 %argc, 1
  br i1 %t3943, label %argok1065, label %arityerr1064
arityerr1064:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1065:
  %t3944 = call i64 @rt_string_length(i64 %a0)
  %t3945 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t3946 = call i64 @rt_char_to_integer(i64 %t3945)
  %t3947 = or i64 %t3946, 360
  %t3948 = and i64 %t3947, 7
  %t3949 = icmp eq i64 %t3948, 0
  br i1 %t3949, label %fixfast1066, label %fixslow1067
fixfast1066:
  %t3950 = icmp eq i64 %t3946, 360
  %t3951 = select i1 %t3950, i64 257, i64 1
  br label %fixmerge1068
fixslow1067:
  %t3952 = call i64 @rt_num_eq(i64 %t3946, i64 360)
  br label %fixmerge1068
fixmerge1068:
  %t3953 = phi i64 [ %t3951, %fixfast1066 ], [ %t3952, %fixslow1067 ]
  %t3954 = icmp ne i64 %t3953, 1
  br i1 %t3954, label %then1069, label %else1070
then1069:
  %t3955 = load i64, ptr @"scheme.base:rd-digits-neg"
  %t3956 = and i64 %t3955, -8
  %t3957 = inttoptr i64 %t3956 to ptr
  %t3958 = load i64, ptr %t3957
  %t3959 = inttoptr i64 %t3958 to ptr
  %t3960 = musttail call fastcc i64 %t3959(i64 %t3955, i64 4, i64 %a0, i64 8, i64 %t3944, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3960
else1070:
  %t3961 = or i64 %t3946, 344
  %t3962 = and i64 %t3961, 7
  %t3963 = icmp eq i64 %t3962, 0
  br i1 %t3963, label %fixfast1071, label %fixslow1072
fixfast1071:
  %t3964 = icmp eq i64 %t3946, 344
  %t3965 = select i1 %t3964, i64 257, i64 1
  br label %fixmerge1073
fixslow1072:
  %t3966 = call i64 @rt_num_eq(i64 %t3946, i64 344)
  br label %fixmerge1073
fixmerge1073:
  %t3967 = phi i64 [ %t3965, %fixfast1071 ], [ %t3966, %fixslow1072 ]
  %t3968 = icmp ne i64 %t3967, 1
  br i1 %t3968, label %then1074, label %else1075
then1074:
  %t3969 = load i64, ptr @"scheme.base:rd-digits"
  %t3970 = and i64 %t3969, -8
  %t3971 = inttoptr i64 %t3970 to ptr
  %t3972 = load i64, ptr %t3971
  %t3973 = inttoptr i64 %t3972 to ptr
  %t3974 = musttail call fastcc i64 %t3973(i64 %t3969, i64 4, i64 %a0, i64 8, i64 %t3944, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3974
else1075:
  %t3975 = load i64, ptr @"scheme.base:rd-digits"
  %t3976 = and i64 %t3975, -8
  %t3977 = inttoptr i64 %t3976 to ptr
  %t3978 = load i64, ptr %t3977
  %t3979 = inttoptr i64 %t3978 to ptr
  %t3980 = musttail call fastcc i64 %t3979(i64 %t3975, i64 4, i64 %a0, i64 0, i64 %t3944, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3980
}

define fastcc i64 @"scheme.base:code:rd-dotchar?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3985 = icmp eq i64 %argc, 1
  br i1 %t3985, label %argok1077, label %arityerr1076
arityerr1076:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1077:
  %t3986 = call i64 @rt_char_to_integer(i64 %a0)
  %t3987 = or i64 %t3986, 368
  %t3988 = and i64 %t3987, 7
  %t3989 = icmp eq i64 %t3988, 0
  br i1 %t3989, label %fixfast1078, label %fixslow1079
fixfast1078:
  %t3990 = icmp eq i64 %t3986, 368
  %t3991 = select i1 %t3990, i64 257, i64 1
  br label %fixmerge1080
fixslow1079:
  %t3992 = call i64 @rt_num_eq(i64 %t3986, i64 368)
  br label %fixmerge1080
fixmerge1080:
  %t3993 = phi i64 [ %t3991, %fixfast1078 ], [ %t3992, %fixslow1079 ]
  ret i64 %t3993
}

define fastcc i64 @"scheme.base:code:rd-exp-char?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3998 = icmp eq i64 %argc, 1
  br i1 %t3998, label %argok1082, label %arityerr1081
arityerr1081:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1082:
  %t3999 = call i64 @rt_char_to_integer(i64 %a0)
  %t4000 = or i64 %t3999, 808
  %t4001 = and i64 %t4000, 7
  %t4002 = icmp eq i64 %t4001, 0
  br i1 %t4002, label %fixfast1083, label %fixslow1084
fixfast1083:
  %t4003 = icmp eq i64 %t3999, 808
  %t4004 = select i1 %t4003, i64 257, i64 1
  br label %fixmerge1085
fixslow1084:
  %t4005 = call i64 @rt_num_eq(i64 %t3999, i64 808)
  br label %fixmerge1085
fixmerge1085:
  %t4006 = phi i64 [ %t4004, %fixfast1083 ], [ %t4005, %fixslow1084 ]
  %t4007 = icmp ne i64 %t4006, 1
  br i1 %t4007, label %then1086, label %else1087
then1086:
  ret i64 %t4006
else1087:
  %t4008 = or i64 %t3999, 552
  %t4009 = and i64 %t4008, 7
  %t4010 = icmp eq i64 %t4009, 0
  br i1 %t4010, label %fixfast1088, label %fixslow1089
fixfast1088:
  %t4011 = icmp eq i64 %t3999, 552
  %t4012 = select i1 %t4011, i64 257, i64 1
  br label %fixmerge1090
fixslow1089:
  %t4013 = call i64 @rt_num_eq(i64 %t3999, i64 552)
  br label %fixmerge1090
fixmerge1090:
  %t4014 = phi i64 [ %t4012, %fixfast1088 ], [ %t4013, %fixslow1089 ]
  ret i64 %t4014
}

define fastcc i64 @"scheme.base:code:rd-sign-char?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4019 = icmp eq i64 %argc, 1
  br i1 %t4019, label %argok1092, label %arityerr1091
arityerr1091:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1092:
  %t4020 = call i64 @rt_char_to_integer(i64 %a0)
  %t4021 = or i64 %t4020, 344
  %t4022 = and i64 %t4021, 7
  %t4023 = icmp eq i64 %t4022, 0
  br i1 %t4023, label %fixfast1093, label %fixslow1094
fixfast1093:
  %t4024 = icmp eq i64 %t4020, 344
  %t4025 = select i1 %t4024, i64 257, i64 1
  br label %fixmerge1095
fixslow1094:
  %t4026 = call i64 @rt_num_eq(i64 %t4020, i64 344)
  br label %fixmerge1095
fixmerge1095:
  %t4027 = phi i64 [ %t4025, %fixfast1093 ], [ %t4026, %fixslow1094 ]
  %t4028 = icmp ne i64 %t4027, 1
  br i1 %t4028, label %then1096, label %else1097
then1096:
  ret i64 %t4027
else1097:
  %t4029 = or i64 %t4020, 360
  %t4030 = and i64 %t4029, 7
  %t4031 = icmp eq i64 %t4030, 0
  br i1 %t4031, label %fixfast1098, label %fixslow1099
fixfast1098:
  %t4032 = icmp eq i64 %t4020, 360
  %t4033 = select i1 %t4032, i64 257, i64 1
  br label %fixmerge1100
fixslow1099:
  %t4034 = call i64 @rt_num_eq(i64 %t4020, i64 360)
  br label %fixmerge1100
fixmerge1100:
  %t4035 = phi i64 [ %t4033, %fixfast1098 ], [ %t4034, %fixslow1099 ]
  ret i64 %t4035
}

define fastcc i64 @"scheme.base:code:rd-scan-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4040 = icmp eq i64 %argc, 3
  br i1 %t4040, label %argok1102, label %arityerr1101
arityerr1101:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1102:
  %t4041 = or i64 %a1, %a2
  %t4042 = and i64 %t4041, 7
  %t4043 = icmp eq i64 %t4042, 0
  br i1 %t4043, label %fixfast1103, label %fixslow1104
fixfast1103:
  %t4044 = icmp slt i64 %a1, %a2
  %t4045 = select i1 %t4044, i64 257, i64 1
  br label %fixmerge1105
fixslow1104:
  %t4046 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge1105
fixmerge1105:
  %t4047 = phi i64 [ %t4045, %fixfast1103 ], [ %t4046, %fixslow1104 ]
  %t4048 = icmp ne i64 %t4047, 1
  br i1 %t4048, label %then1106, label %else1107
then1106:
  %t4049 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t4050 = load i64, ptr @"scheme.base:rd-digit?"
  %t4051 = and i64 %t4050, -8
  %t4052 = inttoptr i64 %t4051 to ptr
  %t4053 = load i64, ptr %t4052
  %t4054 = inttoptr i64 %t4053 to ptr
  %t4055 = call fastcc i64%t4054(i64 %t4050, i64 1, i64 %t4049, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge1108
else1107:
  br label %merge1108
merge1108:
  %t4056 = phi i64 [ %t4055, %then1106 ], [ 1, %else1107 ]
  %t4057 = icmp ne i64 %t4056, 1
  br i1 %t4057, label %then1109, label %else1110
then1109:
  %t4058 = or i64 %a1, 8
  %t4059 = and i64 %t4058, 7
  %t4060 = icmp eq i64 %t4059, 0
  br i1 %t4060, label %fixfast1111, label %fixslow1112
fixfast1111:
  %t4061 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t4062 = extractvalue {i64, i1} %t4061, 0
  %t4063 = extractvalue {i64, i1} %t4061, 1
  br i1 %t4063, label %fixslow1112, label %fixmerge1113
fixslow1112:
  %t4064 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge1113
fixmerge1113:
  %t4065 = phi i64 [ %t4062, %fixfast1111 ], [ %t4064, %fixslow1112 ]
  %t4066 = load i64, ptr @"scheme.base:rd-scan-digits"
  %t4067 = and i64 %t4066, -8
  %t4068 = inttoptr i64 %t4067 to ptr
  %t4069 = load i64, ptr %t4068
  %t4070 = inttoptr i64 %t4069 to ptr
  %t4071 = musttail call fastcc i64 %t4070(i64 %t4066, i64 3, i64 %a0, i64 %t4065, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4071
else1110:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:rd-flonum?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4076 = icmp eq i64 %argc, 1
  br i1 %t4076, label %argok1115, label %arityerr1114
arityerr1114:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1115:
  %t4077 = call i64 @rt_string_length(i64 %a0)
  %t4078 = or i64 0, %t4077
  %t4079 = and i64 %t4078, 7
  %t4080 = icmp eq i64 %t4079, 0
  br i1 %t4080, label %fixfast1116, label %fixslow1117
fixfast1116:
  %t4081 = icmp slt i64 0, %t4077
  %t4082 = select i1 %t4081, i64 257, i64 1
  br label %fixmerge1118
fixslow1117:
  %t4083 = call i64 @rt_lt(i64 0, i64 %t4077)
  br label %fixmerge1118
fixmerge1118:
  %t4084 = phi i64 [ %t4082, %fixfast1116 ], [ %t4083, %fixslow1117 ]
  %t4085 = icmp ne i64 %t4084, 1
  br i1 %t4085, label %then1119, label %else1120
then1119:
  %t4086 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t4087 = load i64, ptr @"scheme.base:rd-sign-char?"
  %t4088 = and i64 %t4087, -8
  %t4089 = inttoptr i64 %t4088 to ptr
  %t4090 = load i64, ptr %t4089
  %t4091 = inttoptr i64 %t4090 to ptr
  %t4092 = call fastcc i64%t4091(i64 %t4087, i64 1, i64 %t4086, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4093 = icmp ne i64 %t4092, 1
  br i1 %t4093, label %then1121, label %else1122
then1121:
  br label %merge1123
else1122:
  br label %merge1123
merge1123:
  %t4094 = phi i64 [ 8, %then1121 ], [ 0, %else1122 ]
  %t4095 = load i64, ptr @"scheme.base:rd-scan-digits"
  %t4096 = and i64 %t4095, -8
  %t4097 = inttoptr i64 %t4096 to ptr
  %t4098 = load i64, ptr %t4097
  %t4099 = inttoptr i64 %t4098 to ptr
  %t4100 = call fastcc i64%t4099(i64 %t4095, i64 3, i64 %a0, i64 %t4094, i64 %t4077, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4101 = or i64 %t4100, %t4077
  %t4102 = and i64 %t4101, 7
  %t4103 = icmp eq i64 %t4102, 0
  br i1 %t4103, label %fixfast1124, label %fixslow1125
fixfast1124:
  %t4104 = icmp slt i64 %t4100, %t4077
  %t4105 = select i1 %t4104, i64 257, i64 1
  br label %fixmerge1126
fixslow1125:
  %t4106 = call i64 @rt_lt(i64 %t4100, i64 %t4077)
  br label %fixmerge1126
fixmerge1126:
  %t4107 = phi i64 [ %t4105, %fixfast1124 ], [ %t4106, %fixslow1125 ]
  %t4108 = icmp ne i64 %t4107, 1
  br i1 %t4108, label %then1127, label %else1128
then1127:
  %t4109 = call i64 @rt_string_ref(i64 %a0, i64 %t4100)
  %t4110 = load i64, ptr @"scheme.base:rd-dotchar?"
  %t4111 = and i64 %t4110, -8
  %t4112 = inttoptr i64 %t4111 to ptr
  %t4113 = load i64, ptr %t4112
  %t4114 = inttoptr i64 %t4113 to ptr
  %t4115 = call fastcc i64%t4114(i64 %t4110, i64 1, i64 %t4109, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge1129
else1128:
  br label %merge1129
merge1129:
  %t4116 = phi i64 [ %t4115, %then1127 ], [ 1, %else1128 ]
  %t4117 = icmp ne i64 %t4116, 1
  br i1 %t4117, label %then1130, label %else1131
then1130:
  %t4118 = or i64 %t4100, 8
  %t4119 = and i64 %t4118, 7
  %t4120 = icmp eq i64 %t4119, 0
  br i1 %t4120, label %fixfast1133, label %fixslow1134
fixfast1133:
  %t4121 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4100, i64 8)
  %t4122 = extractvalue {i64, i1} %t4121, 0
  %t4123 = extractvalue {i64, i1} %t4121, 1
  br i1 %t4123, label %fixslow1134, label %fixmerge1135
fixslow1134:
  %t4124 = call i64 @rt_add(i64 %t4100, i64 8)
  br label %fixmerge1135
fixmerge1135:
  %t4125 = phi i64 [ %t4122, %fixfast1133 ], [ %t4124, %fixslow1134 ]
  br label %merge1132
else1131:
  br label %merge1132
merge1132:
  %t4126 = phi i64 [ %t4125, %fixmerge1135 ], [ %t4100, %else1131 ]
  %t4127 = or i64 %t4100, %t4126
  %t4128 = and i64 %t4127, 7
  %t4129 = icmp eq i64 %t4128, 0
  br i1 %t4129, label %fixfast1136, label %fixslow1137
fixfast1136:
  %t4130 = icmp slt i64 %t4100, %t4126
  %t4131 = select i1 %t4130, i64 257, i64 1
  br label %fixmerge1138
fixslow1137:
  %t4132 = call i64 @rt_lt(i64 %t4100, i64 %t4126)
  br label %fixmerge1138
fixmerge1138:
  %t4133 = phi i64 [ %t4131, %fixfast1136 ], [ %t4132, %fixslow1137 ]
  %t4134 = load i64, ptr @"scheme.base:rd-scan-digits"
  %t4135 = and i64 %t4134, -8
  %t4136 = inttoptr i64 %t4135 to ptr
  %t4137 = load i64, ptr %t4136
  %t4138 = inttoptr i64 %t4137 to ptr
  %t4139 = call fastcc i64%t4138(i64 %t4134, i64 3, i64 %a0, i64 %t4126, i64 %t4077, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4140 = or i64 %t4094, %t4100
  %t4141 = and i64 %t4140, 7
  %t4142 = icmp eq i64 %t4141, 0
  br i1 %t4142, label %fixfast1139, label %fixslow1140
fixfast1139:
  %t4143 = icmp slt i64 %t4094, %t4100
  %t4144 = select i1 %t4143, i64 257, i64 1
  br label %fixmerge1141
fixslow1140:
  %t4145 = call i64 @rt_lt(i64 %t4094, i64 %t4100)
  br label %fixmerge1141
fixmerge1141:
  %t4146 = phi i64 [ %t4144, %fixfast1139 ], [ %t4145, %fixslow1140 ]
  %t4147 = icmp ne i64 %t4146, 1
  br i1 %t4147, label %then1142, label %else1143
then1142:
  br label %merge1144
else1143:
  %t4148 = or i64 %t4126, %t4139
  %t4149 = and i64 %t4148, 7
  %t4150 = icmp eq i64 %t4149, 0
  br i1 %t4150, label %fixfast1145, label %fixslow1146
fixfast1145:
  %t4151 = icmp slt i64 %t4126, %t4139
  %t4152 = select i1 %t4151, i64 257, i64 1
  br label %fixmerge1147
fixslow1146:
  %t4153 = call i64 @rt_lt(i64 %t4126, i64 %t4139)
  br label %fixmerge1147
fixmerge1147:
  %t4154 = phi i64 [ %t4152, %fixfast1145 ], [ %t4153, %fixslow1146 ]
  br label %merge1144
merge1144:
  %t4155 = phi i64 [ %t4146, %then1142 ], [ %t4154, %fixmerge1147 ]
  %t4156 = icmp ne i64 %t4155, 1
  br i1 %t4156, label %then1148, label %else1149
then1148:
  %t4157 = or i64 %t4139, %t4077
  %t4158 = and i64 %t4157, 7
  %t4159 = icmp eq i64 %t4158, 0
  br i1 %t4159, label %fixfast1150, label %fixslow1151
fixfast1150:
  %t4160 = icmp slt i64 %t4139, %t4077
  %t4161 = select i1 %t4160, i64 257, i64 1
  br label %fixmerge1152
fixslow1151:
  %t4162 = call i64 @rt_lt(i64 %t4139, i64 %t4077)
  br label %fixmerge1152
fixmerge1152:
  %t4163 = phi i64 [ %t4161, %fixfast1150 ], [ %t4162, %fixslow1151 ]
  %t4164 = icmp ne i64 %t4163, 1
  br i1 %t4164, label %then1153, label %else1154
then1153:
  %t4165 = call i64 @rt_string_ref(i64 %a0, i64 %t4139)
  %t4166 = load i64, ptr @"scheme.base:rd-exp-char?"
  %t4167 = and i64 %t4166, -8
  %t4168 = inttoptr i64 %t4167 to ptr
  %t4169 = load i64, ptr %t4168
  %t4170 = inttoptr i64 %t4169 to ptr
  %t4171 = call fastcc i64%t4170(i64 %t4166, i64 1, i64 %t4165, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge1155
else1154:
  br label %merge1155
merge1155:
  %t4172 = phi i64 [ %t4171, %then1153 ], [ 1, %else1154 ]
  %t4173 = icmp ne i64 %t4172, 1
  br i1 %t4173, label %then1156, label %else1157
then1156:
  %t4174 = or i64 %t4139, 8
  %t4175 = and i64 %t4174, 7
  %t4176 = icmp eq i64 %t4175, 0
  br i1 %t4176, label %fixfast1159, label %fixslow1160
fixfast1159:
  %t4177 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4139, i64 8)
  %t4178 = extractvalue {i64, i1} %t4177, 0
  %t4179 = extractvalue {i64, i1} %t4177, 1
  br i1 %t4179, label %fixslow1160, label %fixmerge1161
fixslow1160:
  %t4180 = call i64 @rt_add(i64 %t4139, i64 8)
  br label %fixmerge1161
fixmerge1161:
  %t4181 = phi i64 [ %t4178, %fixfast1159 ], [ %t4180, %fixslow1160 ]
  %t4182 = or i64 %t4181, %t4077
  %t4183 = and i64 %t4182, 7
  %t4184 = icmp eq i64 %t4183, 0
  br i1 %t4184, label %fixfast1162, label %fixslow1163
fixfast1162:
  %t4185 = icmp slt i64 %t4181, %t4077
  %t4186 = select i1 %t4185, i64 257, i64 1
  br label %fixmerge1164
fixslow1163:
  %t4187 = call i64 @rt_lt(i64 %t4181, i64 %t4077)
  br label %fixmerge1164
fixmerge1164:
  %t4188 = phi i64 [ %t4186, %fixfast1162 ], [ %t4187, %fixslow1163 ]
  %t4189 = icmp ne i64 %t4188, 1
  br i1 %t4189, label %then1165, label %else1166
then1165:
  %t4190 = or i64 %t4139, 8
  %t4191 = and i64 %t4190, 7
  %t4192 = icmp eq i64 %t4191, 0
  br i1 %t4192, label %fixfast1168, label %fixslow1169
fixfast1168:
  %t4193 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4139, i64 8)
  %t4194 = extractvalue {i64, i1} %t4193, 0
  %t4195 = extractvalue {i64, i1} %t4193, 1
  br i1 %t4195, label %fixslow1169, label %fixmerge1170
fixslow1169:
  %t4196 = call i64 @rt_add(i64 %t4139, i64 8)
  br label %fixmerge1170
fixmerge1170:
  %t4197 = phi i64 [ %t4194, %fixfast1168 ], [ %t4196, %fixslow1169 ]
  %t4198 = call i64 @rt_string_ref(i64 %a0, i64 %t4197)
  %t4199 = load i64, ptr @"scheme.base:rd-sign-char?"
  %t4200 = and i64 %t4199, -8
  %t4201 = inttoptr i64 %t4200 to ptr
  %t4202 = load i64, ptr %t4201
  %t4203 = inttoptr i64 %t4202 to ptr
  %t4204 = call fastcc i64%t4203(i64 %t4199, i64 1, i64 %t4198, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge1167
else1166:
  br label %merge1167
merge1167:
  %t4205 = phi i64 [ %t4204, %fixmerge1170 ], [ 1, %else1166 ]
  %t4206 = icmp ne i64 %t4205, 1
  br i1 %t4206, label %then1171, label %else1172
then1171:
  %t4207 = or i64 %t4139, 16
  %t4208 = and i64 %t4207, 7
  %t4209 = icmp eq i64 %t4208, 0
  br i1 %t4209, label %fixfast1174, label %fixslow1175
fixfast1174:
  %t4210 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4139, i64 16)
  %t4211 = extractvalue {i64, i1} %t4210, 0
  %t4212 = extractvalue {i64, i1} %t4210, 1
  br i1 %t4212, label %fixslow1175, label %fixmerge1176
fixslow1175:
  %t4213 = call i64 @rt_add(i64 %t4139, i64 16)
  br label %fixmerge1176
fixmerge1176:
  %t4214 = phi i64 [ %t4211, %fixfast1174 ], [ %t4213, %fixslow1175 ]
  br label %merge1173
else1172:
  %t4215 = or i64 %t4139, 8
  %t4216 = and i64 %t4215, 7
  %t4217 = icmp eq i64 %t4216, 0
  br i1 %t4217, label %fixfast1177, label %fixslow1178
fixfast1177:
  %t4218 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4139, i64 8)
  %t4219 = extractvalue {i64, i1} %t4218, 0
  %t4220 = extractvalue {i64, i1} %t4218, 1
  br i1 %t4220, label %fixslow1178, label %fixmerge1179
fixslow1178:
  %t4221 = call i64 @rt_add(i64 %t4139, i64 8)
  br label %fixmerge1179
fixmerge1179:
  %t4222 = phi i64 [ %t4219, %fixfast1177 ], [ %t4221, %fixslow1178 ]
  br label %merge1173
merge1173:
  %t4223 = phi i64 [ %t4214, %fixmerge1176 ], [ %t4222, %fixmerge1179 ]
  %t4224 = load i64, ptr @"scheme.base:rd-scan-digits"
  %t4225 = and i64 %t4224, -8
  %t4226 = inttoptr i64 %t4225 to ptr
  %t4227 = load i64, ptr %t4226
  %t4228 = inttoptr i64 %t4227 to ptr
  %t4229 = call fastcc i64%t4228(i64 %t4224, i64 3, i64 %a0, i64 %t4223, i64 %t4077, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4230 = or i64 %t4223, %t4229
  %t4231 = and i64 %t4230, 7
  %t4232 = icmp eq i64 %t4231, 0
  br i1 %t4232, label %fixfast1180, label %fixslow1181
fixfast1180:
  %t4233 = icmp slt i64 %t4223, %t4229
  %t4234 = select i1 %t4233, i64 257, i64 1
  br label %fixmerge1182
fixslow1181:
  %t4235 = call i64 @rt_lt(i64 %t4223, i64 %t4229)
  br label %fixmerge1182
fixmerge1182:
  %t4236 = phi i64 [ %t4234, %fixfast1180 ], [ %t4235, %fixslow1181 ]
  %t4237 = icmp ne i64 %t4236, 1
  br i1 %t4237, label %then1183, label %else1184
then1183:
  br label %merge1185
else1184:
  br label %merge1185
merge1185:
  %t4238 = phi i64 [ %t4229, %then1183 ], [ -8, %else1184 ]
  br label %merge1158
else1157:
  br label %merge1158
merge1158:
  %t4239 = phi i64 [ %t4238, %merge1185 ], [ %t4139, %else1157 ]
  %t4240 = or i64 -8, %t4239
  %t4241 = and i64 %t4240, 7
  %t4242 = icmp eq i64 %t4241, 0
  br i1 %t4242, label %fixfast1186, label %fixslow1187
fixfast1186:
  %t4243 = icmp slt i64 -8, %t4239
  %t4244 = select i1 %t4243, i64 257, i64 1
  br label %fixmerge1188
fixslow1187:
  %t4245 = call i64 @rt_lt(i64 -8, i64 %t4239)
  br label %fixmerge1188
fixmerge1188:
  %t4246 = phi i64 [ %t4244, %fixfast1186 ], [ %t4245, %fixslow1187 ]
  %t4247 = icmp ne i64 %t4246, 1
  br i1 %t4247, label %then1189, label %else1190
then1189:
  %t4248 = or i64 %t4239, %t4077
  %t4249 = and i64 %t4248, 7
  %t4250 = icmp eq i64 %t4249, 0
  br i1 %t4250, label %fixfast1191, label %fixslow1192
fixfast1191:
  %t4251 = icmp eq i64 %t4239, %t4077
  %t4252 = select i1 %t4251, i64 257, i64 1
  br label %fixmerge1193
fixslow1192:
  %t4253 = call i64 @rt_num_eq(i64 %t4239, i64 %t4077)
  br label %fixmerge1193
fixmerge1193:
  %t4254 = phi i64 [ %t4252, %fixfast1191 ], [ %t4253, %fixslow1192 ]
  %t4255 = icmp ne i64 %t4254, 1
  br i1 %t4255, label %then1194, label %else1195
then1194:
  %t4256 = icmp ne i64 %t4133, 1
  br i1 %t4256, label %then1196, label %else1197
then1196:
  ret i64 %t4133
else1197:
  %t4257 = or i64 %t4139, %t4239
  %t4258 = and i64 %t4257, 7
  %t4259 = icmp eq i64 %t4258, 0
  br i1 %t4259, label %fixfast1198, label %fixslow1199
fixfast1198:
  %t4260 = icmp slt i64 %t4139, %t4239
  %t4261 = select i1 %t4260, i64 257, i64 1
  br label %fixmerge1200
fixslow1199:
  %t4262 = call i64 @rt_lt(i64 %t4139, i64 %t4239)
  br label %fixmerge1200
fixmerge1200:
  %t4263 = phi i64 [ %t4261, %fixfast1198 ], [ %t4262, %fixslow1199 ]
  ret i64 %t4263
else1195:
  ret i64 1
else1190:
  ret i64 1
else1149:
  ret i64 1
else1120:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rd-nonfinite"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4268 = icmp eq i64 %argc, 1
  br i1 %t4268, label %argok1202, label %arityerr1201
arityerr1201:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1202:
  %t4269 = call i64 @rt_make_string(ptr @.str.lit.13, i64 6)
  %t4270 = call i64 @rt_string_eq(i64 %a0, i64 %t4269)
  %t4271 = icmp ne i64 %t4270, 1
  br i1 %t4271, label %then1203, label %else1204
then1203:
  %t4272 = call i64 @rt_make_string(ptr @.str.lit.14, i64 3)
  %t4273 = call i64 @rt_string_to_flonum(i64 %t4272)
  ret i64 %t4273
else1204:
  %t4274 = call i64 @rt_make_string(ptr @.str.lit.15, i64 6)
  %t4275 = call i64 @rt_string_eq(i64 %a0, i64 %t4274)
  %t4276 = icmp ne i64 %t4275, 1
  br i1 %t4276, label %then1205, label %else1206
then1205:
  %t4277 = call i64 @rt_make_string(ptr @.str.lit.16, i64 4)
  %t4278 = call i64 @rt_string_to_flonum(i64 %t4277)
  ret i64 %t4278
else1206:
  %t4279 = call i64 @rt_make_string(ptr @.str.lit.17, i64 6)
  %t4280 = call i64 @rt_string_eq(i64 %a0, i64 %t4279)
  %t4281 = icmp ne i64 %t4280, 1
  br i1 %t4281, label %then1207, label %else1208
then1207:
  %t4282 = call i64 @rt_make_string(ptr @.str.lit.18, i64 3)
  %t4283 = call i64 @rt_string_to_flonum(i64 %t4282)
  ret i64 %t4283
else1208:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rd-atom"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4288 = icmp eq i64 %argc, 3
  br i1 %t4288, label %argok1210, label %arityerr1209
arityerr1209:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1210:
  %t4289 = load i64, ptr @"scheme.base:rd-token-end"
  %t4290 = and i64 %t4289, -8
  %t4291 = inttoptr i64 %t4290 to ptr
  %t4292 = load i64, ptr %t4291
  %t4293 = inttoptr i64 %t4292 to ptr
  %t4294 = call fastcc i64%t4293(i64 %t4289, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4295 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t4294)
  %t4296 = load i64, ptr @"scheme.base:rd-numeric?"
  %t4297 = and i64 %t4296, -8
  %t4298 = inttoptr i64 %t4297 to ptr
  %t4299 = load i64, ptr %t4298
  %t4300 = inttoptr i64 %t4299 to ptr
  %t4301 = call fastcc i64%t4300(i64 %t4296, i64 1, i64 %t4295, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4302 = icmp ne i64 %t4301, 1
  br i1 %t4302, label %then1211, label %else1212
then1211:
  %t4303 = load i64, ptr @"scheme.base:rd-parse-int"
  %t4304 = and i64 %t4303, -8
  %t4305 = inttoptr i64 %t4304 to ptr
  %t4306 = load i64, ptr %t4305
  %t4307 = inttoptr i64 %t4306 to ptr
  %t4308 = call fastcc i64%t4307(i64 %t4303, i64 1, i64 %t4295, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge1213
else1212:
  %t4309 = load i64, ptr @"scheme.base:rd-nonfinite"
  %t4310 = and i64 %t4309, -8
  %t4311 = inttoptr i64 %t4310 to ptr
  %t4312 = load i64, ptr %t4311
  %t4313 = inttoptr i64 %t4312 to ptr
  %t4314 = call fastcc i64%t4313(i64 %t4309, i64 1, i64 %t4295, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4315 = icmp ne i64 %t4314, 1
  br i1 %t4315, label %then1214, label %else1215
then1214:
  br label %merge1216
else1215:
  %t4316 = load i64, ptr @"scheme.base:rd-flonum?"
  %t4317 = and i64 %t4316, -8
  %t4318 = inttoptr i64 %t4317 to ptr
  %t4319 = load i64, ptr %t4318
  %t4320 = inttoptr i64 %t4319 to ptr
  %t4321 = call fastcc i64%t4320(i64 %t4316, i64 1, i64 %t4295, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4322 = icmp ne i64 %t4321, 1
  br i1 %t4322, label %then1217, label %else1218
then1217:
  %t4323 = call i64 @rt_string_to_flonum(i64 %t4295)
  br label %merge1219
else1218:
  %t4324 = call i64 @rt_string_to_symbol(i64 %t4295)
  br label %merge1219
merge1219:
  %t4325 = phi i64 [ %t4323, %then1217 ], [ %t4324, %else1218 ]
  br label %merge1216
merge1216:
  %t4326 = phi i64 [ %t4314, %then1214 ], [ %t4325, %merge1219 ]
  br label %merge1213
merge1213:
  %t4327 = phi i64 [ %t4308, %then1211 ], [ %t4326, %merge1216 ]
  %t4328 = call i64 @rt_cons(i64 %t4327, i64 %t4294)
  ret i64 %t4328
}

define fastcc i64 @"scheme.base:code:rd-hex-digit"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4333 = icmp eq i64 %argc, 1
  br i1 %t4333, label %argok1221, label %arityerr1220
arityerr1220:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1221:
  %t4334 = call i64 @rt_char_to_integer(i64 %a0)
  %t4335 = or i64 376, %t4334
  %t4336 = and i64 %t4335, 7
  %t4337 = icmp eq i64 %t4336, 0
  br i1 %t4337, label %fixfast1222, label %fixslow1223
fixfast1222:
  %t4338 = icmp slt i64 376, %t4334
  %t4339 = select i1 %t4338, i64 257, i64 1
  br label %fixmerge1224
fixslow1223:
  %t4340 = call i64 @rt_lt(i64 376, i64 %t4334)
  br label %fixmerge1224
fixmerge1224:
  %t4341 = phi i64 [ %t4339, %fixfast1222 ], [ %t4340, %fixslow1223 ]
  %t4342 = icmp ne i64 %t4341, 1
  br i1 %t4342, label %then1225, label %else1226
then1225:
  %t4343 = or i64 %t4334, 464
  %t4344 = and i64 %t4343, 7
  %t4345 = icmp eq i64 %t4344, 0
  br i1 %t4345, label %fixfast1228, label %fixslow1229
fixfast1228:
  %t4346 = icmp slt i64 %t4334, 464
  %t4347 = select i1 %t4346, i64 257, i64 1
  br label %fixmerge1230
fixslow1229:
  %t4348 = call i64 @rt_lt(i64 %t4334, i64 464)
  br label %fixmerge1230
fixmerge1230:
  %t4349 = phi i64 [ %t4347, %fixfast1228 ], [ %t4348, %fixslow1229 ]
  br label %merge1227
else1226:
  br label %merge1227
merge1227:
  %t4350 = phi i64 [ %t4349, %fixmerge1230 ], [ 1, %else1226 ]
  %t4351 = icmp ne i64 %t4350, 1
  br i1 %t4351, label %then1231, label %else1232
then1231:
  %t4352 = or i64 %t4334, 384
  %t4353 = and i64 %t4352, 7
  %t4354 = icmp eq i64 %t4353, 0
  br i1 %t4354, label %fixfast1233, label %fixslow1234
fixfast1233:
  %t4355 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4334, i64 384)
  %t4356 = extractvalue {i64, i1} %t4355, 0
  %t4357 = extractvalue {i64, i1} %t4355, 1
  br i1 %t4357, label %fixslow1234, label %fixmerge1235
fixslow1234:
  %t4358 = call i64 @rt_sub(i64 %t4334, i64 384)
  br label %fixmerge1235
fixmerge1235:
  %t4359 = phi i64 [ %t4356, %fixfast1233 ], [ %t4358, %fixslow1234 ]
  ret i64 %t4359
else1232:
  %t4360 = or i64 768, %t4334
  %t4361 = and i64 %t4360, 7
  %t4362 = icmp eq i64 %t4361, 0
  br i1 %t4362, label %fixfast1236, label %fixslow1237
fixfast1236:
  %t4363 = icmp slt i64 768, %t4334
  %t4364 = select i1 %t4363, i64 257, i64 1
  br label %fixmerge1238
fixslow1237:
  %t4365 = call i64 @rt_lt(i64 768, i64 %t4334)
  br label %fixmerge1238
fixmerge1238:
  %t4366 = phi i64 [ %t4364, %fixfast1236 ], [ %t4365, %fixslow1237 ]
  %t4367 = icmp ne i64 %t4366, 1
  br i1 %t4367, label %then1239, label %else1240
then1239:
  %t4368 = or i64 %t4334, 824
  %t4369 = and i64 %t4368, 7
  %t4370 = icmp eq i64 %t4369, 0
  br i1 %t4370, label %fixfast1242, label %fixslow1243
fixfast1242:
  %t4371 = icmp slt i64 %t4334, 824
  %t4372 = select i1 %t4371, i64 257, i64 1
  br label %fixmerge1244
fixslow1243:
  %t4373 = call i64 @rt_lt(i64 %t4334, i64 824)
  br label %fixmerge1244
fixmerge1244:
  %t4374 = phi i64 [ %t4372, %fixfast1242 ], [ %t4373, %fixslow1243 ]
  br label %merge1241
else1240:
  br label %merge1241
merge1241:
  %t4375 = phi i64 [ %t4374, %fixmerge1244 ], [ 1, %else1240 ]
  %t4376 = icmp ne i64 %t4375, 1
  br i1 %t4376, label %then1245, label %else1246
then1245:
  %t4377 = or i64 %t4334, 696
  %t4378 = and i64 %t4377, 7
  %t4379 = icmp eq i64 %t4378, 0
  br i1 %t4379, label %fixfast1247, label %fixslow1248
fixfast1247:
  %t4380 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4334, i64 696)
  %t4381 = extractvalue {i64, i1} %t4380, 0
  %t4382 = extractvalue {i64, i1} %t4380, 1
  br i1 %t4382, label %fixslow1248, label %fixmerge1249
fixslow1248:
  %t4383 = call i64 @rt_sub(i64 %t4334, i64 696)
  br label %fixmerge1249
fixmerge1249:
  %t4384 = phi i64 [ %t4381, %fixfast1247 ], [ %t4383, %fixslow1248 ]
  ret i64 %t4384
else1246:
  %t4385 = or i64 512, %t4334
  %t4386 = and i64 %t4385, 7
  %t4387 = icmp eq i64 %t4386, 0
  br i1 %t4387, label %fixfast1250, label %fixslow1251
fixfast1250:
  %t4388 = icmp slt i64 512, %t4334
  %t4389 = select i1 %t4388, i64 257, i64 1
  br label %fixmerge1252
fixslow1251:
  %t4390 = call i64 @rt_lt(i64 512, i64 %t4334)
  br label %fixmerge1252
fixmerge1252:
  %t4391 = phi i64 [ %t4389, %fixfast1250 ], [ %t4390, %fixslow1251 ]
  %t4392 = icmp ne i64 %t4391, 1
  br i1 %t4392, label %then1253, label %else1254
then1253:
  %t4393 = or i64 %t4334, 568
  %t4394 = and i64 %t4393, 7
  %t4395 = icmp eq i64 %t4394, 0
  br i1 %t4395, label %fixfast1256, label %fixslow1257
fixfast1256:
  %t4396 = icmp slt i64 %t4334, 568
  %t4397 = select i1 %t4396, i64 257, i64 1
  br label %fixmerge1258
fixslow1257:
  %t4398 = call i64 @rt_lt(i64 %t4334, i64 568)
  br label %fixmerge1258
fixmerge1258:
  %t4399 = phi i64 [ %t4397, %fixfast1256 ], [ %t4398, %fixslow1257 ]
  br label %merge1255
else1254:
  br label %merge1255
merge1255:
  %t4400 = phi i64 [ %t4399, %fixmerge1258 ], [ 1, %else1254 ]
  %t4401 = icmp ne i64 %t4400, 1
  br i1 %t4401, label %then1259, label %else1260
then1259:
  %t4402 = or i64 %t4334, 440
  %t4403 = and i64 %t4402, 7
  %t4404 = icmp eq i64 %t4403, 0
  br i1 %t4404, label %fixfast1261, label %fixslow1262
fixfast1261:
  %t4405 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4334, i64 440)
  %t4406 = extractvalue {i64, i1} %t4405, 0
  %t4407 = extractvalue {i64, i1} %t4405, 1
  br i1 %t4407, label %fixslow1262, label %fixmerge1263
fixslow1262:
  %t4408 = call i64 @rt_sub(i64 %t4334, i64 440)
  br label %fixmerge1263
fixmerge1263:
  %t4409 = phi i64 [ %t4406, %fixfast1261 ], [ %t4408, %fixslow1262 ]
  ret i64 %t4409
else1260:
  ret i64 0
}

define fastcc i64 @"scheme.base:code:rd-hex"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4414 = icmp eq i64 %argc, 4
  br i1 %t4414, label %argok1265, label %arityerr1264
arityerr1264:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1265:
  %t4415 = or i64 %a2, %a1
  %t4416 = and i64 %t4415, 7
  %t4417 = icmp eq i64 %t4416, 0
  br i1 %t4417, label %fixfast1266, label %fixslow1267
fixfast1266:
  %t4418 = icmp slt i64 %a2, %a1
  %t4419 = select i1 %t4418, i64 257, i64 1
  br label %fixmerge1268
fixslow1267:
  %t4420 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge1268
fixmerge1268:
  %t4421 = phi i64 [ %t4419, %fixfast1266 ], [ %t4420, %fixslow1267 ]
  %t4422 = icmp ne i64 %t4421, 1
  br i1 %t4422, label %then1269, label %else1270
then1269:
  %t4423 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t4424 = call i64 @rt_char_to_integer(i64 %t4423)
  %t4425 = or i64 %t4424, 472
  %t4426 = and i64 %t4425, 7
  %t4427 = icmp eq i64 %t4426, 0
  br i1 %t4427, label %fixfast1271, label %fixslow1272
fixfast1271:
  %t4428 = icmp eq i64 %t4424, 472
  %t4429 = select i1 %t4428, i64 257, i64 1
  br label %fixmerge1273
fixslow1272:
  %t4430 = call i64 @rt_num_eq(i64 %t4424, i64 472)
  br label %fixmerge1273
fixmerge1273:
  %t4431 = phi i64 [ %t4429, %fixfast1271 ], [ %t4430, %fixslow1272 ]
  %t4432 = icmp ne i64 %t4431, 1
  br i1 %t4432, label %then1274, label %else1275
then1274:
  %t4433 = or i64 %a2, 8
  %t4434 = and i64 %t4433, 7
  %t4435 = icmp eq i64 %t4434, 0
  br i1 %t4435, label %fixfast1276, label %fixslow1277
fixfast1276:
  %t4436 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4437 = extractvalue {i64, i1} %t4436, 0
  %t4438 = extractvalue {i64, i1} %t4436, 1
  br i1 %t4438, label %fixslow1277, label %fixmerge1278
fixslow1277:
  %t4439 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1278
fixmerge1278:
  %t4440 = phi i64 [ %t4437, %fixfast1276 ], [ %t4439, %fixslow1277 ]
  %t4441 = call i64 @rt_cons(i64 %a3, i64 %t4440)
  ret i64 %t4441
else1275:
  %t4442 = or i64 %a2, 8
  %t4443 = and i64 %t4442, 7
  %t4444 = icmp eq i64 %t4443, 0
  br i1 %t4444, label %fixfast1279, label %fixslow1280
fixfast1279:
  %t4445 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4446 = extractvalue {i64, i1} %t4445, 0
  %t4447 = extractvalue {i64, i1} %t4445, 1
  br i1 %t4447, label %fixslow1280, label %fixmerge1281
fixslow1280:
  %t4448 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1281
fixmerge1281:
  %t4449 = phi i64 [ %t4446, %fixfast1279 ], [ %t4448, %fixslow1280 ]
  %t4450 = or i64 %a3, 128
  %t4451 = and i64 %t4450, 7
  %t4452 = icmp eq i64 %t4451, 0
  br i1 %t4452, label %fixfast1282, label %fixslow1283
fixfast1282:
  %t4453 = ashr i64 %a3, 3
  %t4454 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t4453, i64 128)
  %t4455 = extractvalue {i64, i1} %t4454, 0
  %t4456 = extractvalue {i64, i1} %t4454, 1
  br i1 %t4456, label %fixslow1283, label %fixmerge1284
fixslow1283:
  %t4457 = call i64 @rt_mul(i64 %a3, i64 128)
  br label %fixmerge1284
fixmerge1284:
  %t4458 = phi i64 [ %t4455, %fixfast1282 ], [ %t4457, %fixslow1283 ]
  %t4459 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t4460 = load i64, ptr @"scheme.base:rd-hex-digit"
  %t4461 = and i64 %t4460, -8
  %t4462 = inttoptr i64 %t4461 to ptr
  %t4463 = load i64, ptr %t4462
  %t4464 = inttoptr i64 %t4463 to ptr
  %t4465 = call fastcc i64%t4464(i64 %t4460, i64 1, i64 %t4459, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4466 = or i64 %t4458, %t4465
  %t4467 = and i64 %t4466, 7
  %t4468 = icmp eq i64 %t4467, 0
  br i1 %t4468, label %fixfast1285, label %fixslow1286
fixfast1285:
  %t4469 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4458, i64 %t4465)
  %t4470 = extractvalue {i64, i1} %t4469, 0
  %t4471 = extractvalue {i64, i1} %t4469, 1
  br i1 %t4471, label %fixslow1286, label %fixmerge1287
fixslow1286:
  %t4472 = call i64 @rt_add(i64 %t4458, i64 %t4465)
  br label %fixmerge1287
fixmerge1287:
  %t4473 = phi i64 [ %t4470, %fixfast1285 ], [ %t4472, %fixslow1286 ]
  %t4474 = load i64, ptr @"scheme.base:rd-hex"
  %t4475 = and i64 %t4474, -8
  %t4476 = inttoptr i64 %t4475 to ptr
  %t4477 = load i64, ptr %t4476
  %t4478 = inttoptr i64 %t4477 to ptr
  %t4479 = musttail call fastcc i64 %t4478(i64 %t4474, i64 4, i64 %a0, i64 %a1, i64 %t4449, i64 %t4473, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4479
else1270:
  %t4480 = call i64 @rt_cons(i64 %a3, i64 %a2)
  ret i64 %t4480
}

define fastcc i64 @"scheme.base:code:rd-str-esc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4485 = icmp eq i64 %argc, 1
  br i1 %t4485, label %argok1289, label %arityerr1288
arityerr1288:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1289:
  %t4486 = call i64 @rt_char_to_integer(i64 %a0)
  %t4487 = or i64 %t4486, 880
  %t4488 = and i64 %t4487, 7
  %t4489 = icmp eq i64 %t4488, 0
  br i1 %t4489, label %fixfast1290, label %fixslow1291
fixfast1290:
  %t4490 = icmp eq i64 %t4486, 880
  %t4491 = select i1 %t4490, i64 257, i64 1
  br label %fixmerge1292
fixslow1291:
  %t4492 = call i64 @rt_num_eq(i64 %t4486, i64 880)
  br label %fixmerge1292
fixmerge1292:
  %t4493 = phi i64 [ %t4491, %fixfast1290 ], [ %t4492, %fixslow1291 ]
  %t4494 = icmp ne i64 %t4493, 1
  br i1 %t4494, label %then1293, label %else1294
then1293:
  %t4495 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t4495
else1294:
  %t4496 = or i64 %t4486, 928
  %t4497 = and i64 %t4496, 7
  %t4498 = icmp eq i64 %t4497, 0
  br i1 %t4498, label %fixfast1295, label %fixslow1296
fixfast1295:
  %t4499 = icmp eq i64 %t4486, 928
  %t4500 = select i1 %t4499, i64 257, i64 1
  br label %fixmerge1297
fixslow1296:
  %t4501 = call i64 @rt_num_eq(i64 %t4486, i64 928)
  br label %fixmerge1297
fixmerge1297:
  %t4502 = phi i64 [ %t4500, %fixfast1295 ], [ %t4501, %fixslow1296 ]
  %t4503 = icmp ne i64 %t4502, 1
  br i1 %t4503, label %then1298, label %else1299
then1298:
  %t4504 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t4504
else1299:
  %t4505 = or i64 %t4486, 912
  %t4506 = and i64 %t4505, 7
  %t4507 = icmp eq i64 %t4506, 0
  br i1 %t4507, label %fixfast1300, label %fixslow1301
fixfast1300:
  %t4508 = icmp eq i64 %t4486, 912
  %t4509 = select i1 %t4508, i64 257, i64 1
  br label %fixmerge1302
fixslow1301:
  %t4510 = call i64 @rt_num_eq(i64 %t4486, i64 912)
  br label %fixmerge1302
fixmerge1302:
  %t4511 = phi i64 [ %t4509, %fixfast1300 ], [ %t4510, %fixslow1301 ]
  %t4512 = icmp ne i64 %t4511, 1
  br i1 %t4512, label %then1303, label %else1304
then1303:
  %t4513 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t4513
else1304:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_1093"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4518 = icmp eq i64 %argc, 2
  br i1 %t4518, label %argok1306, label %arityerr1305
arityerr1305:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1306:
  %t4519 = and i64 %self, -8
  %t4520 = inttoptr i64 %t4519 to ptr
  %t4521 = getelementptr i64, ptr %t4520, i64 1
  %t4522 = load i64, ptr %t4521
  %t4523 = or i64 %a0, %t4522
  %t4524 = and i64 %t4523, 7
  %t4525 = icmp eq i64 %t4524, 0
  br i1 %t4525, label %fixfast1307, label %fixslow1308
fixfast1307:
  %t4526 = icmp slt i64 %a0, %t4522
  %t4527 = select i1 %t4526, i64 257, i64 1
  br label %fixmerge1309
fixslow1308:
  %t4528 = call i64 @rt_lt(i64 %a0, i64 %t4522)
  br label %fixmerge1309
fixmerge1309:
  %t4529 = phi i64 [ %t4527, %fixfast1307 ], [ %t4528, %fixslow1308 ]
  %t4530 = icmp ne i64 %t4529, 1
  br i1 %t4530, label %then1310, label %else1311
then1310:
  %t4531 = and i64 %self, -8
  %t4532 = inttoptr i64 %t4531 to ptr
  %t4533 = getelementptr i64, ptr %t4532, i64 2
  %t4534 = load i64, ptr %t4533
  %t4535 = call i64 @rt_string_ref(i64 %t4534, i64 %a0)
  %t4536 = call i64 @rt_char_to_integer(i64 %t4535)
  %t4537 = or i64 %t4536, 272
  %t4538 = and i64 %t4537, 7
  %t4539 = icmp eq i64 %t4538, 0
  br i1 %t4539, label %fixfast1312, label %fixslow1313
fixfast1312:
  %t4540 = icmp eq i64 %t4536, 272
  %t4541 = select i1 %t4540, i64 257, i64 1
  br label %fixmerge1314
fixslow1313:
  %t4542 = call i64 @rt_num_eq(i64 %t4536, i64 272)
  br label %fixmerge1314
fixmerge1314:
  %t4543 = phi i64 [ %t4541, %fixfast1312 ], [ %t4542, %fixslow1313 ]
  %t4544 = icmp ne i64 %t4543, 1
  br i1 %t4544, label %then1315, label %else1316
then1315:
  %t4545 = load i64, ptr @"scheme.base:reverse"
  %t4546 = and i64 %t4545, -8
  %t4547 = inttoptr i64 %t4546 to ptr
  %t4548 = load i64, ptr %t4547
  %t4549 = inttoptr i64 %t4548 to ptr
  %t4550 = call fastcc i64%t4549(i64 %t4545, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4551 = call i64 @rt_list_to_string(i64 %t4550)
  %t4552 = or i64 %a0, 8
  %t4553 = and i64 %t4552, 7
  %t4554 = icmp eq i64 %t4553, 0
  br i1 %t4554, label %fixfast1317, label %fixslow1318
fixfast1317:
  %t4555 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4556 = extractvalue {i64, i1} %t4555, 0
  %t4557 = extractvalue {i64, i1} %t4555, 1
  br i1 %t4557, label %fixslow1318, label %fixmerge1319
fixslow1318:
  %t4558 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1319
fixmerge1319:
  %t4559 = phi i64 [ %t4556, %fixfast1317 ], [ %t4558, %fixslow1318 ]
  %t4560 = call i64 @rt_cons(i64 %t4551, i64 %t4559)
  ret i64 %t4560
else1316:
  %t4561 = or i64 %t4536, 736
  %t4562 = and i64 %t4561, 7
  %t4563 = icmp eq i64 %t4562, 0
  br i1 %t4563, label %fixfast1320, label %fixslow1321
fixfast1320:
  %t4564 = icmp eq i64 %t4536, 736
  %t4565 = select i1 %t4564, i64 257, i64 1
  br label %fixmerge1322
fixslow1321:
  %t4566 = call i64 @rt_num_eq(i64 %t4536, i64 736)
  br label %fixmerge1322
fixmerge1322:
  %t4567 = phi i64 [ %t4565, %fixfast1320 ], [ %t4566, %fixslow1321 ]
  %t4568 = icmp ne i64 %t4567, 1
  br i1 %t4568, label %then1323, label %else1324
then1323:
  %t4569 = and i64 %self, -8
  %t4570 = inttoptr i64 %t4569 to ptr
  %t4571 = getelementptr i64, ptr %t4570, i64 2
  %t4572 = load i64, ptr %t4571
  %t4573 = or i64 %a0, 8
  %t4574 = and i64 %t4573, 7
  %t4575 = icmp eq i64 %t4574, 0
  br i1 %t4575, label %fixfast1325, label %fixslow1326
fixfast1325:
  %t4576 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4577 = extractvalue {i64, i1} %t4576, 0
  %t4578 = extractvalue {i64, i1} %t4576, 1
  br i1 %t4578, label %fixslow1326, label %fixmerge1327
fixslow1326:
  %t4579 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1327
fixmerge1327:
  %t4580 = phi i64 [ %t4577, %fixfast1325 ], [ %t4579, %fixslow1326 ]
  %t4581 = call i64 @rt_string_ref(i64 %t4572, i64 %t4580)
  %t4582 = call i64 @rt_char_to_integer(i64 %t4581)
  %t4583 = or i64 %t4582, 960
  %t4584 = and i64 %t4583, 7
  %t4585 = icmp eq i64 %t4584, 0
  br i1 %t4585, label %fixfast1328, label %fixslow1329
fixfast1328:
  %t4586 = icmp eq i64 %t4582, 960
  %t4587 = select i1 %t4586, i64 257, i64 1
  br label %fixmerge1330
fixslow1329:
  %t4588 = call i64 @rt_num_eq(i64 %t4582, i64 960)
  br label %fixmerge1330
fixmerge1330:
  %t4589 = phi i64 [ %t4587, %fixfast1328 ], [ %t4588, %fixslow1329 ]
  %t4590 = icmp ne i64 %t4589, 1
  br i1 %t4590, label %then1331, label %else1332
then1331:
  %t4591 = and i64 %self, -8
  %t4592 = inttoptr i64 %t4591 to ptr
  %t4593 = getelementptr i64, ptr %t4592, i64 2
  %t4594 = load i64, ptr %t4593
  %t4595 = and i64 %self, -8
  %t4596 = inttoptr i64 %t4595 to ptr
  %t4597 = getelementptr i64, ptr %t4596, i64 1
  %t4598 = load i64, ptr %t4597
  %t4599 = or i64 %a0, 16
  %t4600 = and i64 %t4599, 7
  %t4601 = icmp eq i64 %t4600, 0
  br i1 %t4601, label %fixfast1333, label %fixslow1334
fixfast1333:
  %t4602 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 16)
  %t4603 = extractvalue {i64, i1} %t4602, 0
  %t4604 = extractvalue {i64, i1} %t4602, 1
  br i1 %t4604, label %fixslow1334, label %fixmerge1335
fixslow1334:
  %t4605 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge1335
fixmerge1335:
  %t4606 = phi i64 [ %t4603, %fixfast1333 ], [ %t4605, %fixslow1334 ]
  %t4607 = load i64, ptr @"scheme.base:rd-hex"
  %t4608 = and i64 %t4607, -8
  %t4609 = inttoptr i64 %t4608 to ptr
  %t4610 = load i64, ptr %t4609
  %t4611 = inttoptr i64 %t4610 to ptr
  %t4612 = call fastcc i64%t4611(i64 %t4607, i64 4, i64 %t4594, i64 %t4598, i64 %t4606, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4613 = call i64 @rt_cdr(i64 %t4612)
  %t4614 = call i64 @rt_car(i64 %t4612)
  %t4615 = call i64 @rt_integer_to_char(i64 %t4614)
  %t4616 = call i64 @rt_cons(i64 %t4615, i64 %a1)
  %t4617 = musttail call fastcc i64 @"scheme.base:code_1093"(i64 %self, i64 2, i64 %t4613, i64 %t4616, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4617
else1332:
  %t4618 = or i64 %a0, 16
  %t4619 = and i64 %t4618, 7
  %t4620 = icmp eq i64 %t4619, 0
  br i1 %t4620, label %fixfast1336, label %fixslow1337
fixfast1336:
  %t4621 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 16)
  %t4622 = extractvalue {i64, i1} %t4621, 0
  %t4623 = extractvalue {i64, i1} %t4621, 1
  br i1 %t4623, label %fixslow1337, label %fixmerge1338
fixslow1337:
  %t4624 = call i64 @rt_add(i64 %a0, i64 16)
  br label %fixmerge1338
fixmerge1338:
  %t4625 = phi i64 [ %t4622, %fixfast1336 ], [ %t4624, %fixslow1337 ]
  %t4626 = load i64, ptr @"scheme.base:rd-str-esc"
  %t4627 = and i64 %t4626, -8
  %t4628 = inttoptr i64 %t4627 to ptr
  %t4629 = load i64, ptr %t4628
  %t4630 = inttoptr i64 %t4629 to ptr
  %t4631 = call fastcc i64%t4630(i64 %t4626, i64 1, i64 %t4581, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4632 = call i64 @rt_cons(i64 %t4631, i64 %a1)
  %t4633 = musttail call fastcc i64 @"scheme.base:code_1093"(i64 %self, i64 2, i64 %t4625, i64 %t4632, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4633
else1324:
  %t4634 = or i64 %a0, 8
  %t4635 = and i64 %t4634, 7
  %t4636 = icmp eq i64 %t4635, 0
  br i1 %t4636, label %fixfast1339, label %fixslow1340
fixfast1339:
  %t4637 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4638 = extractvalue {i64, i1} %t4637, 0
  %t4639 = extractvalue {i64, i1} %t4637, 1
  br i1 %t4639, label %fixslow1340, label %fixmerge1341
fixslow1340:
  %t4640 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1341
fixmerge1341:
  %t4641 = phi i64 [ %t4638, %fixfast1339 ], [ %t4640, %fixslow1340 ]
  %t4642 = call i64 @rt_cons(i64 %t4535, i64 %a1)
  %t4643 = musttail call fastcc i64 @"scheme.base:code_1093"(i64 %self, i64 2, i64 %t4641, i64 %t4642, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4643
else1311:
  %t4644 = load i64, ptr @"scheme.base:reverse"
  %t4645 = and i64 %t4644, -8
  %t4646 = inttoptr i64 %t4645 to ptr
  %t4647 = load i64, ptr %t4646
  %t4648 = inttoptr i64 %t4647 to ptr
  %t4649 = call fastcc i64%t4648(i64 %t4644, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4650 = call i64 @rt_list_to_string(i64 %t4649)
  %t4651 = call i64 @rt_cons(i64 %t4650, i64 %a0)
  ret i64 %t4651
}

define fastcc i64 @"scheme.base:code:rd-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4652 = icmp eq i64 %argc, 3
  br i1 %t4652, label %argok1343, label %arityerr1342
arityerr1342:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1343:
  %t4653 = call ptr @rt_alloc_words(i64 4)
  %t4654 = ptrtoint ptr %t4653 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1093" to i64), ptr %t4653
  %t4655 = or i64 %t4654, 4
  %t4656 = getelementptr i64, ptr %t4653, i64 1
  store i64 %a1, ptr %t4656
  %t4657 = getelementptr i64, ptr %t4653, i64 2
  store i64 %a0, ptr %t4657
  %t4658 = getelementptr i64, ptr %t4653, i64 3
  store i64 %t4655, ptr %t4658
  %t4659 = musttail call fastcc i64 @"scheme.base:code_1093"(i64 %t4655, i64 2, i64 %a2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4659
}

define fastcc i64 @"scheme.base:code:rd-hash"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4664 = icmp eq i64 %argc, 3
  br i1 %t4664, label %argok1345, label %arityerr1344
arityerr1344:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1345:
  %t4665 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t4666 = call i64 @rt_char_to_integer(i64 %t4665)
  %t4667 = or i64 %t4666, 928
  %t4668 = and i64 %t4667, 7
  %t4669 = icmp eq i64 %t4668, 0
  br i1 %t4669, label %fixfast1346, label %fixslow1347
fixfast1346:
  %t4670 = icmp eq i64 %t4666, 928
  %t4671 = select i1 %t4670, i64 257, i64 1
  br label %fixmerge1348
fixslow1347:
  %t4672 = call i64 @rt_num_eq(i64 %t4666, i64 928)
  br label %fixmerge1348
fixmerge1348:
  %t4673 = phi i64 [ %t4671, %fixfast1346 ], [ %t4672, %fixslow1347 ]
  %t4674 = icmp ne i64 %t4673, 1
  br i1 %t4674, label %then1349, label %else1350
then1349:
  %t4675 = or i64 %a2, 8
  %t4676 = and i64 %t4675, 7
  %t4677 = icmp eq i64 %t4676, 0
  br i1 %t4677, label %fixfast1351, label %fixslow1352
fixfast1351:
  %t4678 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4679 = extractvalue {i64, i1} %t4678, 0
  %t4680 = extractvalue {i64, i1} %t4678, 1
  br i1 %t4680, label %fixslow1352, label %fixmerge1353
fixslow1352:
  %t4681 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1353
fixmerge1353:
  %t4682 = phi i64 [ %t4679, %fixfast1351 ], [ %t4681, %fixslow1352 ]
  %t4683 = call i64 @rt_cons(i64 257, i64 %t4682)
  ret i64 %t4683
else1350:
  %t4684 = or i64 %t4666, 816
  %t4685 = and i64 %t4684, 7
  %t4686 = icmp eq i64 %t4685, 0
  br i1 %t4686, label %fixfast1354, label %fixslow1355
fixfast1354:
  %t4687 = icmp eq i64 %t4666, 816
  %t4688 = select i1 %t4687, i64 257, i64 1
  br label %fixmerge1356
fixslow1355:
  %t4689 = call i64 @rt_num_eq(i64 %t4666, i64 816)
  br label %fixmerge1356
fixmerge1356:
  %t4690 = phi i64 [ %t4688, %fixfast1354 ], [ %t4689, %fixslow1355 ]
  %t4691 = icmp ne i64 %t4690, 1
  br i1 %t4691, label %then1357, label %else1358
then1357:
  %t4692 = or i64 %a2, 8
  %t4693 = and i64 %t4692, 7
  %t4694 = icmp eq i64 %t4693, 0
  br i1 %t4694, label %fixfast1359, label %fixslow1360
fixfast1359:
  %t4695 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4696 = extractvalue {i64, i1} %t4695, 0
  %t4697 = extractvalue {i64, i1} %t4695, 1
  br i1 %t4697, label %fixslow1360, label %fixmerge1361
fixslow1360:
  %t4698 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1361
fixmerge1361:
  %t4699 = phi i64 [ %t4696, %fixfast1359 ], [ %t4698, %fixslow1360 ]
  %t4700 = call i64 @rt_cons(i64 1, i64 %t4699)
  ret i64 %t4700
else1358:
  %t4701 = or i64 %t4666, 736
  %t4702 = and i64 %t4701, 7
  %t4703 = icmp eq i64 %t4702, 0
  br i1 %t4703, label %fixfast1362, label %fixslow1363
fixfast1362:
  %t4704 = icmp eq i64 %t4666, 736
  %t4705 = select i1 %t4704, i64 257, i64 1
  br label %fixmerge1364
fixslow1363:
  %t4706 = call i64 @rt_num_eq(i64 %t4666, i64 736)
  br label %fixmerge1364
fixmerge1364:
  %t4707 = phi i64 [ %t4705, %fixfast1362 ], [ %t4706, %fixslow1363 ]
  %t4708 = icmp ne i64 %t4707, 1
  br i1 %t4708, label %then1365, label %else1366
then1365:
  %t4709 = load i64, ptr @"scheme.base:rd-char"
  %t4710 = and i64 %t4709, -8
  %t4711 = inttoptr i64 %t4710 to ptr
  %t4712 = load i64, ptr %t4711
  %t4713 = inttoptr i64 %t4712 to ptr
  %t4714 = musttail call fastcc i64 %t4713(i64 %t4709, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4714
else1366:
  %t4715 = or i64 %t4666, 320
  %t4716 = and i64 %t4715, 7
  %t4717 = icmp eq i64 %t4716, 0
  br i1 %t4717, label %fixfast1367, label %fixslow1368
fixfast1367:
  %t4718 = icmp eq i64 %t4666, 320
  %t4719 = select i1 %t4718, i64 257, i64 1
  br label %fixmerge1369
fixslow1368:
  %t4720 = call i64 @rt_num_eq(i64 %t4666, i64 320)
  br label %fixmerge1369
fixmerge1369:
  %t4721 = phi i64 [ %t4719, %fixfast1367 ], [ %t4720, %fixslow1368 ]
  %t4722 = icmp ne i64 %t4721, 1
  br i1 %t4722, label %then1370, label %else1371
then1370:
  %t4723 = or i64 %a2, 8
  %t4724 = and i64 %t4723, 7
  %t4725 = icmp eq i64 %t4724, 0
  br i1 %t4725, label %fixfast1372, label %fixslow1373
fixfast1372:
  %t4726 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4727 = extractvalue {i64, i1} %t4726, 0
  %t4728 = extractvalue {i64, i1} %t4726, 1
  br i1 %t4728, label %fixslow1373, label %fixmerge1374
fixslow1373:
  %t4729 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1374
fixmerge1374:
  %t4730 = phi i64 [ %t4727, %fixfast1372 ], [ %t4729, %fixslow1373 ]
  %t4731 = load i64, ptr @"scheme.base:rd-list"
  %t4732 = and i64 %t4731, -8
  %t4733 = inttoptr i64 %t4732 to ptr
  %t4734 = load i64, ptr %t4733
  %t4735 = inttoptr i64 %t4734 to ptr
  %t4736 = call fastcc i64%t4735(i64 %t4731, i64 4, i64 %a0, i64 %a1, i64 %t4730, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4737 = call i64 @rt_car(i64 %t4736)
  %t4738 = load i64, ptr @"scheme.base:list->vector"
  %t4739 = and i64 %t4738, -8
  %t4740 = inttoptr i64 %t4739 to ptr
  %t4741 = load i64, ptr %t4740
  %t4742 = inttoptr i64 %t4741 to ptr
  %t4743 = call fastcc i64%t4742(i64 %t4738, i64 1, i64 %t4737, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4744 = call i64 @rt_cdr(i64 %t4736)
  %t4745 = call i64 @rt_cons(i64 %t4743, i64 %t4744)
  ret i64 %t4745
else1371:
  %t4746 = or i64 %t4666, 936
  %t4747 = and i64 %t4746, 7
  %t4748 = icmp eq i64 %t4747, 0
  br i1 %t4748, label %fixfast1375, label %fixslow1376
fixfast1375:
  %t4749 = icmp eq i64 %t4666, 936
  %t4750 = select i1 %t4749, i64 257, i64 1
  br label %fixmerge1377
fixslow1376:
  %t4751 = call i64 @rt_num_eq(i64 %t4666, i64 936)
  br label %fixmerge1377
fixmerge1377:
  %t4752 = phi i64 [ %t4750, %fixfast1375 ], [ %t4751, %fixslow1376 ]
  %t4753 = icmp ne i64 %t4752, 1
  br i1 %t4753, label %then1378, label %else1379
then1378:
  %t4754 = or i64 %a2, 16
  %t4755 = and i64 %t4754, 7
  %t4756 = icmp eq i64 %t4755, 0
  br i1 %t4756, label %fixfast1381, label %fixslow1382
fixfast1381:
  %t4757 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t4758 = extractvalue {i64, i1} %t4757, 0
  %t4759 = extractvalue {i64, i1} %t4757, 1
  br i1 %t4759, label %fixslow1382, label %fixmerge1383
fixslow1382:
  %t4760 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge1383
fixmerge1383:
  %t4761 = phi i64 [ %t4758, %fixfast1381 ], [ %t4760, %fixslow1382 ]
  %t4762 = or i64 %t4761, %a1
  %t4763 = and i64 %t4762, 7
  %t4764 = icmp eq i64 %t4763, 0
  br i1 %t4764, label %fixfast1384, label %fixslow1385
fixfast1384:
  %t4765 = icmp slt i64 %t4761, %a1
  %t4766 = select i1 %t4765, i64 257, i64 1
  br label %fixmerge1386
fixslow1385:
  %t4767 = call i64 @rt_lt(i64 %t4761, i64 %a1)
  br label %fixmerge1386
fixmerge1386:
  %t4768 = phi i64 [ %t4766, %fixfast1384 ], [ %t4767, %fixslow1385 ]
  %t4769 = icmp ne i64 %t4768, 1
  br i1 %t4769, label %then1387, label %else1388
then1387:
  %t4770 = or i64 %a2, 8
  %t4771 = and i64 %t4770, 7
  %t4772 = icmp eq i64 %t4771, 0
  br i1 %t4772, label %fixfast1390, label %fixslow1391
fixfast1390:
  %t4773 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4774 = extractvalue {i64, i1} %t4773, 0
  %t4775 = extractvalue {i64, i1} %t4773, 1
  br i1 %t4775, label %fixslow1391, label %fixmerge1392
fixslow1391:
  %t4776 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1392
fixmerge1392:
  %t4777 = phi i64 [ %t4774, %fixfast1390 ], [ %t4776, %fixslow1391 ]
  %t4778 = call i64 @rt_string_ref(i64 %a0, i64 %t4777)
  %t4779 = call i64 @rt_char_to_integer(i64 %t4778)
  %t4780 = or i64 %t4779, 448
  %t4781 = and i64 %t4780, 7
  %t4782 = icmp eq i64 %t4781, 0
  br i1 %t4782, label %fixfast1393, label %fixslow1394
fixfast1393:
  %t4783 = icmp eq i64 %t4779, 448
  %t4784 = select i1 %t4783, i64 257, i64 1
  br label %fixmerge1395
fixslow1394:
  %t4785 = call i64 @rt_num_eq(i64 %t4779, i64 448)
  br label %fixmerge1395
fixmerge1395:
  %t4786 = phi i64 [ %t4784, %fixfast1393 ], [ %t4785, %fixslow1394 ]
  %t4787 = icmp ne i64 %t4786, 1
  br i1 %t4787, label %then1396, label %else1397
then1396:
  %t4788 = or i64 %a2, 16
  %t4789 = and i64 %t4788, 7
  %t4790 = icmp eq i64 %t4789, 0
  br i1 %t4790, label %fixfast1399, label %fixslow1400
fixfast1399:
  %t4791 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 16)
  %t4792 = extractvalue {i64, i1} %t4791, 0
  %t4793 = extractvalue {i64, i1} %t4791, 1
  br i1 %t4793, label %fixslow1400, label %fixmerge1401
fixslow1400:
  %t4794 = call i64 @rt_add(i64 %a2, i64 16)
  br label %fixmerge1401
fixmerge1401:
  %t4795 = phi i64 [ %t4792, %fixfast1399 ], [ %t4794, %fixslow1400 ]
  %t4796 = call i64 @rt_string_ref(i64 %a0, i64 %t4795)
  %t4797 = call i64 @rt_char_to_integer(i64 %t4796)
  %t4798 = or i64 %t4797, 320
  %t4799 = and i64 %t4798, 7
  %t4800 = icmp eq i64 %t4799, 0
  br i1 %t4800, label %fixfast1402, label %fixslow1403
fixfast1402:
  %t4801 = icmp eq i64 %t4797, 320
  %t4802 = select i1 %t4801, i64 257, i64 1
  br label %fixmerge1404
fixslow1403:
  %t4803 = call i64 @rt_num_eq(i64 %t4797, i64 320)
  br label %fixmerge1404
fixmerge1404:
  %t4804 = phi i64 [ %t4802, %fixfast1402 ], [ %t4803, %fixslow1403 ]
  br label %merge1398
else1397:
  br label %merge1398
merge1398:
  %t4805 = phi i64 [ %t4804, %fixmerge1404 ], [ 1, %else1397 ]
  br label %merge1389
else1388:
  br label %merge1389
merge1389:
  %t4806 = phi i64 [ %t4805, %merge1398 ], [ 1, %else1388 ]
  br label %merge1380
else1379:
  br label %merge1380
merge1380:
  %t4807 = phi i64 [ %t4806, %merge1389 ], [ 1, %else1379 ]
  %t4808 = icmp ne i64 %t4807, 1
  br i1 %t4808, label %then1405, label %else1406
then1405:
  %t4809 = or i64 %a2, 24
  %t4810 = and i64 %t4809, 7
  %t4811 = icmp eq i64 %t4810, 0
  br i1 %t4811, label %fixfast1407, label %fixslow1408
fixfast1407:
  %t4812 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 24)
  %t4813 = extractvalue {i64, i1} %t4812, 0
  %t4814 = extractvalue {i64, i1} %t4812, 1
  br i1 %t4814, label %fixslow1408, label %fixmerge1409
fixslow1408:
  %t4815 = call i64 @rt_add(i64 %a2, i64 24)
  br label %fixmerge1409
fixmerge1409:
  %t4816 = phi i64 [ %t4813, %fixfast1407 ], [ %t4815, %fixslow1408 ]
  %t4817 = load i64, ptr @"scheme.base:rd-list"
  %t4818 = and i64 %t4817, -8
  %t4819 = inttoptr i64 %t4818 to ptr
  %t4820 = load i64, ptr %t4819
  %t4821 = inttoptr i64 %t4820 to ptr
  %t4822 = call fastcc i64%t4821(i64 %t4817, i64 4, i64 %a0, i64 %a1, i64 %t4816, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4823 = call i64 @rt_car(i64 %t4822)
  %t4824 = load i64, ptr @"scheme.base:list->bytevector"
  %t4825 = and i64 %t4824, -8
  %t4826 = inttoptr i64 %t4825 to ptr
  %t4827 = load i64, ptr %t4826
  %t4828 = inttoptr i64 %t4827 to ptr
  %t4829 = call fastcc i64%t4828(i64 %t4824, i64 1, i64 %t4823, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4830 = call i64 @rt_cdr(i64 %t4822)
  %t4831 = call i64 @rt_cons(i64 %t4829, i64 %t4830)
  ret i64 %t4831
else1406:
  %t4832 = load i64, ptr @"scheme.base:rd-token-end"
  %t4833 = and i64 %t4832, -8
  %t4834 = inttoptr i64 %t4833 to ptr
  %t4835 = load i64, ptr %t4834
  %t4836 = inttoptr i64 %t4835 to ptr
  %t4837 = call fastcc i64%t4836(i64 %t4832, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4838 = call i64 @rt_substring(i64 %a0, i64 %a2, i64 %t4837)
  %t4839 = call i64 @rt_string_to_symbol(i64 %t4838)
  %t4840 = call i64 @rt_cons(i64 %t4839, i64 %t4837)
  ret i64 %t4840
}

define fastcc i64 @"scheme.base:code:rd-char-name"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4845 = icmp eq i64 %argc, 1
  br i1 %t4845, label %argok1411, label %arityerr1410
arityerr1410:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1411:
  %t4846 = call i64 @rt_make_string(ptr @.str.lit.19, i64 5)
  %t4847 = call i64 @rt_string_eq(i64 %a0, i64 %t4846)
  %t4848 = icmp ne i64 %t4847, 1
  br i1 %t4848, label %then1412, label %else1413
then1412:
  %t4849 = call i64 @rt_integer_to_char(i64 256)
  ret i64 %t4849
else1413:
  %t4850 = call i64 @rt_make_string(ptr @.str.lit.20, i64 7)
  %t4851 = call i64 @rt_string_eq(i64 %a0, i64 %t4850)
  %t4852 = icmp ne i64 %t4851, 1
  br i1 %t4852, label %then1414, label %else1415
then1414:
  %t4853 = call i64 @rt_integer_to_char(i64 80)
  ret i64 %t4853
else1415:
  %t4854 = call i64 @rt_make_string(ptr @.str.lit.21, i64 3)
  %t4855 = call i64 @rt_string_eq(i64 %a0, i64 %t4854)
  %t4856 = icmp ne i64 %t4855, 1
  br i1 %t4856, label %then1416, label %else1417
then1416:
  %t4857 = call i64 @rt_integer_to_char(i64 72)
  ret i64 %t4857
else1417:
  %t4858 = call i64 @rt_make_string(ptr @.str.lit.22, i64 6)
  %t4859 = call i64 @rt_string_eq(i64 %a0, i64 %t4858)
  %t4860 = icmp ne i64 %t4859, 1
  br i1 %t4860, label %then1418, label %else1419
then1418:
  %t4861 = call i64 @rt_integer_to_char(i64 104)
  ret i64 %t4861
else1419:
  %t4862 = call i64 @rt_make_string(ptr @.str.lit.23, i64 3)
  %t4863 = call i64 @rt_string_eq(i64 %a0, i64 %t4862)
  %t4864 = icmp ne i64 %t4863, 1
  br i1 %t4864, label %then1420, label %else1421
then1420:
  %t4865 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t4865
else1421:
  %t4866 = call i64 @rt_make_string(ptr @.str.lit.24, i64 4)
  %t4867 = call i64 @rt_string_eq(i64 %a0, i64 %t4866)
  %t4868 = icmp ne i64 %t4867, 1
  br i1 %t4868, label %then1422, label %else1423
then1422:
  %t4869 = call i64 @rt_integer_to_char(i64 0)
  ret i64 %t4869
else1423:
  %t4870 = call i64 @rt_make_string(ptr @.str.lit.25, i64 6)
  %t4871 = call i64 @rt_string_eq(i64 %a0, i64 %t4870)
  %t4872 = icmp ne i64 %t4871, 1
  br i1 %t4872, label %then1424, label %else1425
then1424:
  %t4873 = call i64 @rt_integer_to_char(i64 1016)
  ret i64 %t4873
else1425:
  %t4874 = call i64 @rt_make_string(ptr @.str.lit.26, i64 7)
  %t4875 = call i64 @rt_string_eq(i64 %a0, i64 %t4874)
  %t4876 = icmp ne i64 %t4875, 1
  br i1 %t4876, label %then1426, label %else1427
then1426:
  %t4877 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t4877
else1427:
  %t4878 = call i64 @rt_make_string(ptr @.str.lit.27, i64 3)
  %t4879 = call i64 @rt_string_eq(i64 %a0, i64 %t4878)
  %t4880 = icmp ne i64 %t4879, 1
  br i1 %t4880, label %then1428, label %else1429
then1428:
  %t4881 = call i64 @rt_integer_to_char(i64 216)
  ret i64 %t4881
else1429:
  %t4882 = call i64 @rt_string_ref(i64 %a0, i64 0)
  ret i64 %t4882
}

define fastcc i64 @"scheme.base:code:rd-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4887 = icmp eq i64 %argc, 3
  br i1 %t4887, label %argok1431, label %arityerr1430
arityerr1430:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1431:
  %t4888 = or i64 %a2, 8
  %t4889 = and i64 %t4888, 7
  %t4890 = icmp eq i64 %t4889, 0
  br i1 %t4890, label %fixfast1432, label %fixslow1433
fixfast1432:
  %t4891 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t4892 = extractvalue {i64, i1} %t4891, 0
  %t4893 = extractvalue {i64, i1} %t4891, 1
  br i1 %t4893, label %fixslow1433, label %fixmerge1434
fixslow1433:
  %t4894 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1434
fixmerge1434:
  %t4895 = phi i64 [ %t4892, %fixfast1432 ], [ %t4894, %fixslow1433 ]
  %t4896 = or i64 %t4895, 8
  %t4897 = and i64 %t4896, 7
  %t4898 = icmp eq i64 %t4897, 0
  br i1 %t4898, label %fixfast1435, label %fixslow1436
fixfast1435:
  %t4899 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4895, i64 8)
  %t4900 = extractvalue {i64, i1} %t4899, 0
  %t4901 = extractvalue {i64, i1} %t4899, 1
  br i1 %t4901, label %fixslow1436, label %fixmerge1437
fixslow1436:
  %t4902 = call i64 @rt_add(i64 %t4895, i64 8)
  br label %fixmerge1437
fixmerge1437:
  %t4903 = phi i64 [ %t4900, %fixfast1435 ], [ %t4902, %fixslow1436 ]
  %t4904 = load i64, ptr @"scheme.base:rd-token-end"
  %t4905 = and i64 %t4904, -8
  %t4906 = inttoptr i64 %t4905 to ptr
  %t4907 = load i64, ptr %t4906
  %t4908 = inttoptr i64 %t4907 to ptr
  %t4909 = call fastcc i64%t4908(i64 %t4904, i64 3, i64 %a0, i64 %a1, i64 %t4903, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4910 = call i64 @rt_substring(i64 %a0, i64 %t4895, i64 %t4909)
  %t4911 = call i64 @rt_string_length(i64 %t4910)
  %t4912 = or i64 %t4911, 8
  %t4913 = and i64 %t4912, 7
  %t4914 = icmp eq i64 %t4913, 0
  br i1 %t4914, label %fixfast1438, label %fixslow1439
fixfast1438:
  %t4915 = icmp eq i64 %t4911, 8
  %t4916 = select i1 %t4915, i64 257, i64 1
  br label %fixmerge1440
fixslow1439:
  %t4917 = call i64 @rt_num_eq(i64 %t4911, i64 8)
  br label %fixmerge1440
fixmerge1440:
  %t4918 = phi i64 [ %t4916, %fixfast1438 ], [ %t4917, %fixslow1439 ]
  %t4919 = icmp ne i64 %t4918, 1
  br i1 %t4919, label %then1441, label %else1442
then1441:
  %t4920 = call i64 @rt_string_ref(i64 %a0, i64 %t4895)
  %t4921 = call i64 @rt_cons(i64 %t4920, i64 %t4909)
  ret i64 %t4921
else1442:
  %t4922 = load i64, ptr @"scheme.base:rd-char-name"
  %t4923 = and i64 %t4922, -8
  %t4924 = inttoptr i64 %t4923 to ptr
  %t4925 = load i64, ptr %t4924
  %t4926 = inttoptr i64 %t4925 to ptr
  %t4927 = call fastcc i64%t4926(i64 %t4922, i64 1, i64 %t4910, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4928 = call i64 @rt_cons(i64 %t4927, i64 %t4909)
  ret i64 %t4928
}

define fastcc i64 @"scheme.base:code:rd-quote"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4933 = icmp eq i64 %argc, 3
  br i1 %t4933, label %argok1444, label %arityerr1443
arityerr1443:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1444:
  %t4934 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t4935 = and i64 %t4934, -8
  %t4936 = inttoptr i64 %t4935 to ptr
  %t4937 = load i64, ptr %t4936
  %t4938 = inttoptr i64 %t4937 to ptr
  %t4939 = call fastcc i64%t4938(i64 %t4934, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4940 = load i64, ptr @"scheme.base:rd-datum"
  %t4941 = and i64 %t4940, -8
  %t4942 = inttoptr i64 %t4941 to ptr
  %t4943 = load i64, ptr %t4942
  %t4944 = inttoptr i64 %t4943 to ptr
  %t4945 = call fastcc i64%t4944(i64 %t4940, i64 3, i64 %a0, i64 %a1, i64 %t4939, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4946 = call i64 @rt_intern(ptr @.str.sym.28)
  %t4947 = call i64 @rt_car(i64 %t4945)
  %t4948 = load i64, ptr @"scheme.base:list"
  %t4949 = and i64 %t4948, -8
  %t4950 = inttoptr i64 %t4949 to ptr
  %t4951 = load i64, ptr %t4950
  %t4952 = inttoptr i64 %t4951 to ptr
  %t4953 = call fastcc i64%t4952(i64 %t4948, i64 2, i64 %t4946, i64 %t4947, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4954 = call i64 @rt_cdr(i64 %t4945)
  %t4955 = call i64 @rt_cons(i64 %t4953, i64 %t4954)
  ret i64 %t4955
}

define fastcc i64 @"scheme.base:code:rd-quasi"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4960 = icmp eq i64 %argc, 3
  br i1 %t4960, label %argok1446, label %arityerr1445
arityerr1445:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1446:
  %t4961 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t4962 = and i64 %t4961, -8
  %t4963 = inttoptr i64 %t4962 to ptr
  %t4964 = load i64, ptr %t4963
  %t4965 = inttoptr i64 %t4964 to ptr
  %t4966 = call fastcc i64%t4965(i64 %t4961, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4967 = load i64, ptr @"scheme.base:rd-datum"
  %t4968 = and i64 %t4967, -8
  %t4969 = inttoptr i64 %t4968 to ptr
  %t4970 = load i64, ptr %t4969
  %t4971 = inttoptr i64 %t4970 to ptr
  %t4972 = call fastcc i64%t4971(i64 %t4967, i64 3, i64 %a0, i64 %a1, i64 %t4966, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4973 = call i64 @rt_intern(ptr @.str.sym.29)
  %t4974 = call i64 @rt_car(i64 %t4972)
  %t4975 = load i64, ptr @"scheme.base:list"
  %t4976 = and i64 %t4975, -8
  %t4977 = inttoptr i64 %t4976 to ptr
  %t4978 = load i64, ptr %t4977
  %t4979 = inttoptr i64 %t4978 to ptr
  %t4980 = call fastcc i64%t4979(i64 %t4975, i64 2, i64 %t4973, i64 %t4974, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4981 = call i64 @rt_cdr(i64 %t4972)
  %t4982 = call i64 @rt_cons(i64 %t4980, i64 %t4981)
  ret i64 %t4982
}

define fastcc i64 @"scheme.base:code:rd-unquote"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4987 = icmp eq i64 %argc, 3
  br i1 %t4987, label %argok1448, label %arityerr1447
arityerr1447:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1448:
  %t4988 = or i64 %a2, %a1
  %t4989 = and i64 %t4988, 7
  %t4990 = icmp eq i64 %t4989, 0
  br i1 %t4990, label %fixfast1449, label %fixslow1450
fixfast1449:
  %t4991 = icmp slt i64 %a2, %a1
  %t4992 = select i1 %t4991, i64 257, i64 1
  br label %fixmerge1451
fixslow1450:
  %t4993 = call i64 @rt_lt(i64 %a2, i64 %a1)
  br label %fixmerge1451
fixmerge1451:
  %t4994 = phi i64 [ %t4992, %fixfast1449 ], [ %t4993, %fixslow1450 ]
  %t4995 = icmp ne i64 %t4994, 1
  br i1 %t4995, label %then1452, label %else1453
then1452:
  %t4996 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t4997 = call i64 @rt_char_to_integer(i64 %t4996)
  %t4998 = or i64 %t4997, 512
  %t4999 = and i64 %t4998, 7
  %t5000 = icmp eq i64 %t4999, 0
  br i1 %t5000, label %fixfast1455, label %fixslow1456
fixfast1455:
  %t5001 = icmp eq i64 %t4997, 512
  %t5002 = select i1 %t5001, i64 257, i64 1
  br label %fixmerge1457
fixslow1456:
  %t5003 = call i64 @rt_num_eq(i64 %t4997, i64 512)
  br label %fixmerge1457
fixmerge1457:
  %t5004 = phi i64 [ %t5002, %fixfast1455 ], [ %t5003, %fixslow1456 ]
  br label %merge1454
else1453:
  br label %merge1454
merge1454:
  %t5005 = phi i64 [ %t5004, %fixmerge1457 ], [ 1, %else1453 ]
  %t5006 = icmp ne i64 %t5005, 1
  br i1 %t5006, label %then1458, label %else1459
then1458:
  %t5007 = or i64 %a2, 8
  %t5008 = and i64 %t5007, 7
  %t5009 = icmp eq i64 %t5008, 0
  br i1 %t5009, label %fixfast1460, label %fixslow1461
fixfast1460:
  %t5010 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5011 = extractvalue {i64, i1} %t5010, 0
  %t5012 = extractvalue {i64, i1} %t5010, 1
  br i1 %t5012, label %fixslow1461, label %fixmerge1462
fixslow1461:
  %t5013 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1462
fixmerge1462:
  %t5014 = phi i64 [ %t5011, %fixfast1460 ], [ %t5013, %fixslow1461 ]
  %t5015 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t5016 = and i64 %t5015, -8
  %t5017 = inttoptr i64 %t5016 to ptr
  %t5018 = load i64, ptr %t5017
  %t5019 = inttoptr i64 %t5018 to ptr
  %t5020 = call fastcc i64%t5019(i64 %t5015, i64 3, i64 %a0, i64 %a1, i64 %t5014, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5021 = load i64, ptr @"scheme.base:rd-datum"
  %t5022 = and i64 %t5021, -8
  %t5023 = inttoptr i64 %t5022 to ptr
  %t5024 = load i64, ptr %t5023
  %t5025 = inttoptr i64 %t5024 to ptr
  %t5026 = call fastcc i64%t5025(i64 %t5021, i64 3, i64 %a0, i64 %a1, i64 %t5020, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5027 = call i64 @rt_intern(ptr @.str.sym.30)
  %t5028 = call i64 @rt_car(i64 %t5026)
  %t5029 = load i64, ptr @"scheme.base:list"
  %t5030 = and i64 %t5029, -8
  %t5031 = inttoptr i64 %t5030 to ptr
  %t5032 = load i64, ptr %t5031
  %t5033 = inttoptr i64 %t5032 to ptr
  %t5034 = call fastcc i64%t5033(i64 %t5029, i64 2, i64 %t5027, i64 %t5028, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5035 = call i64 @rt_cdr(i64 %t5026)
  %t5036 = call i64 @rt_cons(i64 %t5034, i64 %t5035)
  ret i64 %t5036
else1459:
  %t5037 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t5038 = and i64 %t5037, -8
  %t5039 = inttoptr i64 %t5038 to ptr
  %t5040 = load i64, ptr %t5039
  %t5041 = inttoptr i64 %t5040 to ptr
  %t5042 = call fastcc i64%t5041(i64 %t5037, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5043 = load i64, ptr @"scheme.base:rd-datum"
  %t5044 = and i64 %t5043, -8
  %t5045 = inttoptr i64 %t5044 to ptr
  %t5046 = load i64, ptr %t5045
  %t5047 = inttoptr i64 %t5046 to ptr
  %t5048 = call fastcc i64%t5047(i64 %t5043, i64 3, i64 %a0, i64 %a1, i64 %t5042, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5049 = call i64 @rt_intern(ptr @.str.sym.31)
  %t5050 = call i64 @rt_car(i64 %t5048)
  %t5051 = load i64, ptr @"scheme.base:list"
  %t5052 = and i64 %t5051, -8
  %t5053 = inttoptr i64 %t5052 to ptr
  %t5054 = load i64, ptr %t5053
  %t5055 = inttoptr i64 %t5054 to ptr
  %t5056 = call fastcc i64%t5055(i64 %t5051, i64 2, i64 %t5049, i64 %t5050, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5057 = call i64 @rt_cdr(i64 %t5048)
  %t5058 = call i64 @rt_cons(i64 %t5056, i64 %t5057)
  ret i64 %t5058
}

define fastcc i64 @"scheme.base:code:rd-dot?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5063 = icmp eq i64 %argc, 3
  br i1 %t5063, label %argok1464, label %arityerr1463
arityerr1463:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1464:
  %t5064 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t5065 = call i64 @rt_char_to_integer(i64 %t5064)
  %t5066 = or i64 %t5065, 368
  %t5067 = and i64 %t5066, 7
  %t5068 = icmp eq i64 %t5067, 0
  br i1 %t5068, label %fixfast1465, label %fixslow1466
fixfast1465:
  %t5069 = icmp eq i64 %t5065, 368
  %t5070 = select i1 %t5069, i64 257, i64 1
  br label %fixmerge1467
fixslow1466:
  %t5071 = call i64 @rt_num_eq(i64 %t5065, i64 368)
  br label %fixmerge1467
fixmerge1467:
  %t5072 = phi i64 [ %t5070, %fixfast1465 ], [ %t5071, %fixslow1466 ]
  %t5073 = icmp ne i64 %t5072, 1
  br i1 %t5073, label %then1468, label %else1469
then1468:
  %t5074 = or i64 %a2, 8
  %t5075 = and i64 %t5074, 7
  %t5076 = icmp eq i64 %t5075, 0
  br i1 %t5076, label %fixfast1470, label %fixslow1471
fixfast1470:
  %t5077 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5078 = extractvalue {i64, i1} %t5077, 0
  %t5079 = extractvalue {i64, i1} %t5077, 1
  br i1 %t5079, label %fixslow1471, label %fixmerge1472
fixslow1471:
  %t5080 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1472
fixmerge1472:
  %t5081 = phi i64 [ %t5078, %fixfast1470 ], [ %t5080, %fixslow1471 ]
  %t5082 = load i64, ptr @"scheme.base:rd-token-end"
  %t5083 = and i64 %t5082, -8
  %t5084 = inttoptr i64 %t5083 to ptr
  %t5085 = load i64, ptr %t5084
  %t5086 = inttoptr i64 %t5085 to ptr
  %t5087 = call fastcc i64%t5086(i64 %t5082, i64 3, i64 %a0, i64 %a1, i64 %t5081, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5088 = or i64 %a2, 8
  %t5089 = and i64 %t5088, 7
  %t5090 = icmp eq i64 %t5089, 0
  br i1 %t5090, label %fixfast1473, label %fixslow1474
fixfast1473:
  %t5091 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5092 = extractvalue {i64, i1} %t5091, 0
  %t5093 = extractvalue {i64, i1} %t5091, 1
  br i1 %t5093, label %fixslow1474, label %fixmerge1475
fixslow1474:
  %t5094 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1475
fixmerge1475:
  %t5095 = phi i64 [ %t5092, %fixfast1473 ], [ %t5094, %fixslow1474 ]
  %t5096 = or i64 %t5087, %t5095
  %t5097 = and i64 %t5096, 7
  %t5098 = icmp eq i64 %t5097, 0
  br i1 %t5098, label %fixfast1476, label %fixslow1477
fixfast1476:
  %t5099 = icmp eq i64 %t5087, %t5095
  %t5100 = select i1 %t5099, i64 257, i64 1
  br label %fixmerge1478
fixslow1477:
  %t5101 = call i64 @rt_num_eq(i64 %t5087, i64 %t5095)
  br label %fixmerge1478
fixmerge1478:
  %t5102 = phi i64 [ %t5100, %fixfast1476 ], [ %t5101, %fixslow1477 ]
  ret i64 %t5102
else1469:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rd-append-reverse"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5107 = icmp eq i64 %argc, 2
  br i1 %t5107, label %argok1480, label %arityerr1479
arityerr1479:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1480:
  %t5108 = call i64 @rt_null_p(i64 %a0)
  %t5109 = icmp ne i64 %t5108, 1
  br i1 %t5109, label %then1481, label %else1482
then1481:
  ret i64 %a1
else1482:
  %t5110 = call i64 @rt_cdr(i64 %a0)
  %t5111 = call i64 @rt_car(i64 %a0)
  %t5112 = call i64 @rt_cons(i64 %t5111, i64 %a1)
  %t5113 = load i64, ptr @"scheme.base:rd-append-reverse"
  %t5114 = and i64 %t5113, -8
  %t5115 = inttoptr i64 %t5114 to ptr
  %t5116 = load i64, ptr %t5115
  %t5117 = inttoptr i64 %t5116 to ptr
  %t5118 = musttail call fastcc i64 %t5117(i64 %t5113, i64 2, i64 %t5110, i64 %t5112, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5118
}

define fastcc i64 @"scheme.base:code:rd-list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5123 = icmp eq i64 %argc, 4
  br i1 %t5123, label %argok1484, label %arityerr1483
arityerr1483:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok1484:
  %t5124 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t5125 = and i64 %t5124, -8
  %t5126 = inttoptr i64 %t5125 to ptr
  %t5127 = load i64, ptr %t5126
  %t5128 = inttoptr i64 %t5127 to ptr
  %t5129 = call fastcc i64%t5128(i64 %t5124, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5130 = or i64 %t5129, %a1
  %t5131 = and i64 %t5130, 7
  %t5132 = icmp eq i64 %t5131, 0
  br i1 %t5132, label %fixfast1485, label %fixslow1486
fixfast1485:
  %t5133 = icmp slt i64 %t5129, %a1
  %t5134 = select i1 %t5133, i64 257, i64 1
  br label %fixmerge1487
fixslow1486:
  %t5135 = call i64 @rt_lt(i64 %t5129, i64 %a1)
  br label %fixmerge1487
fixmerge1487:
  %t5136 = phi i64 [ %t5134, %fixfast1485 ], [ %t5135, %fixslow1486 ]
  %t5137 = icmp ne i64 %t5136, 1
  br i1 %t5137, label %then1488, label %else1489
then1488:
  %t5138 = call i64 @rt_string_ref(i64 %a0, i64 %t5129)
  %t5139 = call i64 @rt_char_to_integer(i64 %t5138)
  %t5140 = or i64 %t5139, 328
  %t5141 = and i64 %t5140, 7
  %t5142 = icmp eq i64 %t5141, 0
  br i1 %t5142, label %fixfast1490, label %fixslow1491
fixfast1490:
  %t5143 = icmp eq i64 %t5139, 328
  %t5144 = select i1 %t5143, i64 257, i64 1
  br label %fixmerge1492
fixslow1491:
  %t5145 = call i64 @rt_num_eq(i64 %t5139, i64 328)
  br label %fixmerge1492
fixmerge1492:
  %t5146 = phi i64 [ %t5144, %fixfast1490 ], [ %t5145, %fixslow1491 ]
  %t5147 = icmp ne i64 %t5146, 1
  br i1 %t5147, label %then1493, label %else1494
then1493:
  br label %merge1495
else1494:
  %t5148 = or i64 %t5139, 744
  %t5149 = and i64 %t5148, 7
  %t5150 = icmp eq i64 %t5149, 0
  br i1 %t5150, label %fixfast1496, label %fixslow1497
fixfast1496:
  %t5151 = icmp eq i64 %t5139, 744
  %t5152 = select i1 %t5151, i64 257, i64 1
  br label %fixmerge1498
fixslow1497:
  %t5153 = call i64 @rt_num_eq(i64 %t5139, i64 744)
  br label %fixmerge1498
fixmerge1498:
  %t5154 = phi i64 [ %t5152, %fixfast1496 ], [ %t5153, %fixslow1497 ]
  br label %merge1495
merge1495:
  %t5155 = phi i64 [ %t5146, %then1493 ], [ %t5154, %fixmerge1498 ]
  %t5156 = icmp ne i64 %t5155, 1
  br i1 %t5156, label %then1499, label %else1500
then1499:
  %t5157 = load i64, ptr @"scheme.base:reverse"
  %t5158 = and i64 %t5157, -8
  %t5159 = inttoptr i64 %t5158 to ptr
  %t5160 = load i64, ptr %t5159
  %t5161 = inttoptr i64 %t5160 to ptr
  %t5162 = call fastcc i64%t5161(i64 %t5157, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5163 = or i64 %t5129, 8
  %t5164 = and i64 %t5163, 7
  %t5165 = icmp eq i64 %t5164, 0
  br i1 %t5165, label %fixfast1501, label %fixslow1502
fixfast1501:
  %t5166 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5129, i64 8)
  %t5167 = extractvalue {i64, i1} %t5166, 0
  %t5168 = extractvalue {i64, i1} %t5166, 1
  br i1 %t5168, label %fixslow1502, label %fixmerge1503
fixslow1502:
  %t5169 = call i64 @rt_add(i64 %t5129, i64 8)
  br label %fixmerge1503
fixmerge1503:
  %t5170 = phi i64 [ %t5167, %fixfast1501 ], [ %t5169, %fixslow1502 ]
  %t5171 = call i64 @rt_cons(i64 %t5162, i64 %t5170)
  ret i64 %t5171
else1500:
  %t5172 = load i64, ptr @"scheme.base:rd-dot?"
  %t5173 = and i64 %t5172, -8
  %t5174 = inttoptr i64 %t5173 to ptr
  %t5175 = load i64, ptr %t5174
  %t5176 = inttoptr i64 %t5175 to ptr
  %t5177 = call fastcc i64%t5176(i64 %t5172, i64 3, i64 %a0, i64 %a1, i64 %t5129, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5178 = icmp ne i64 %t5177, 1
  br i1 %t5178, label %then1504, label %else1505
then1504:
  %t5179 = or i64 %t5129, 8
  %t5180 = and i64 %t5179, 7
  %t5181 = icmp eq i64 %t5180, 0
  br i1 %t5181, label %fixfast1506, label %fixslow1507
fixfast1506:
  %t5182 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5129, i64 8)
  %t5183 = extractvalue {i64, i1} %t5182, 0
  %t5184 = extractvalue {i64, i1} %t5182, 1
  br i1 %t5184, label %fixslow1507, label %fixmerge1508
fixslow1507:
  %t5185 = call i64 @rt_add(i64 %t5129, i64 8)
  br label %fixmerge1508
fixmerge1508:
  %t5186 = phi i64 [ %t5183, %fixfast1506 ], [ %t5185, %fixslow1507 ]
  %t5187 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t5188 = and i64 %t5187, -8
  %t5189 = inttoptr i64 %t5188 to ptr
  %t5190 = load i64, ptr %t5189
  %t5191 = inttoptr i64 %t5190 to ptr
  %t5192 = call fastcc i64%t5191(i64 %t5187, i64 3, i64 %a0, i64 %a1, i64 %t5186, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5193 = load i64, ptr @"scheme.base:rd-datum"
  %t5194 = and i64 %t5193, -8
  %t5195 = inttoptr i64 %t5194 to ptr
  %t5196 = load i64, ptr %t5195
  %t5197 = inttoptr i64 %t5196 to ptr
  %t5198 = call fastcc i64%t5197(i64 %t5193, i64 3, i64 %a0, i64 %a1, i64 %t5192, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5199 = call i64 @rt_cdr(i64 %t5198)
  %t5200 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t5201 = and i64 %t5200, -8
  %t5202 = inttoptr i64 %t5201 to ptr
  %t5203 = load i64, ptr %t5202
  %t5204 = inttoptr i64 %t5203 to ptr
  %t5205 = call fastcc i64%t5204(i64 %t5200, i64 3, i64 %a0, i64 %a1, i64 %t5199, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5206 = call i64 @rt_car(i64 %t5198)
  %t5207 = load i64, ptr @"scheme.base:rd-append-reverse"
  %t5208 = and i64 %t5207, -8
  %t5209 = inttoptr i64 %t5208 to ptr
  %t5210 = load i64, ptr %t5209
  %t5211 = inttoptr i64 %t5210 to ptr
  %t5212 = call fastcc i64%t5211(i64 %t5207, i64 2, i64 %a3, i64 %t5206, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5213 = or i64 %t5205, 8
  %t5214 = and i64 %t5213, 7
  %t5215 = icmp eq i64 %t5214, 0
  br i1 %t5215, label %fixfast1509, label %fixslow1510
fixfast1509:
  %t5216 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5205, i64 8)
  %t5217 = extractvalue {i64, i1} %t5216, 0
  %t5218 = extractvalue {i64, i1} %t5216, 1
  br i1 %t5218, label %fixslow1510, label %fixmerge1511
fixslow1510:
  %t5219 = call i64 @rt_add(i64 %t5205, i64 8)
  br label %fixmerge1511
fixmerge1511:
  %t5220 = phi i64 [ %t5217, %fixfast1509 ], [ %t5219, %fixslow1510 ]
  %t5221 = call i64 @rt_cons(i64 %t5212, i64 %t5220)
  ret i64 %t5221
else1505:
  %t5222 = load i64, ptr @"scheme.base:rd-datum"
  %t5223 = and i64 %t5222, -8
  %t5224 = inttoptr i64 %t5223 to ptr
  %t5225 = load i64, ptr %t5224
  %t5226 = inttoptr i64 %t5225 to ptr
  %t5227 = call fastcc i64%t5226(i64 %t5222, i64 3, i64 %a0, i64 %a1, i64 %t5129, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5228 = call i64 @rt_cdr(i64 %t5227)
  %t5229 = call i64 @rt_car(i64 %t5227)
  %t5230 = call i64 @rt_cons(i64 %t5229, i64 %a3)
  %t5231 = load i64, ptr @"scheme.base:rd-list"
  %t5232 = and i64 %t5231, -8
  %t5233 = inttoptr i64 %t5232 to ptr
  %t5234 = load i64, ptr %t5233
  %t5235 = inttoptr i64 %t5234 to ptr
  %t5236 = musttail call fastcc i64 %t5235(i64 %t5231, i64 4, i64 %a0, i64 %a1, i64 %t5228, i64 %t5230, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5236
else1489:
  %t5237 = load i64, ptr @"scheme.base:reverse"
  %t5238 = and i64 %t5237, -8
  %t5239 = inttoptr i64 %t5238 to ptr
  %t5240 = load i64, ptr %t5239
  %t5241 = inttoptr i64 %t5240 to ptr
  %t5242 = call fastcc i64%t5241(i64 %t5237, i64 1, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5243 = call i64 @rt_cons(i64 %t5242, i64 %t5129)
  ret i64 %t5243
}

define fastcc i64 @"scheme.base:code:rd-datum"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5248 = icmp eq i64 %argc, 3
  br i1 %t5248, label %argok1513, label %arityerr1512
arityerr1512:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1513:
  %t5249 = call i64 @rt_string_ref(i64 %a0, i64 %a2)
  %t5250 = call i64 @rt_char_to_integer(i64 %t5249)
  %t5251 = or i64 %t5250, 320
  %t5252 = and i64 %t5251, 7
  %t5253 = icmp eq i64 %t5252, 0
  br i1 %t5253, label %fixfast1514, label %fixslow1515
fixfast1514:
  %t5254 = icmp eq i64 %t5250, 320
  %t5255 = select i1 %t5254, i64 257, i64 1
  br label %fixmerge1516
fixslow1515:
  %t5256 = call i64 @rt_num_eq(i64 %t5250, i64 320)
  br label %fixmerge1516
fixmerge1516:
  %t5257 = phi i64 [ %t5255, %fixfast1514 ], [ %t5256, %fixslow1515 ]
  %t5258 = icmp ne i64 %t5257, 1
  br i1 %t5258, label %then1517, label %else1518
then1517:
  %t5259 = or i64 %a2, 8
  %t5260 = and i64 %t5259, 7
  %t5261 = icmp eq i64 %t5260, 0
  br i1 %t5261, label %fixfast1519, label %fixslow1520
fixfast1519:
  %t5262 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5263 = extractvalue {i64, i1} %t5262, 0
  %t5264 = extractvalue {i64, i1} %t5262, 1
  br i1 %t5264, label %fixslow1520, label %fixmerge1521
fixslow1520:
  %t5265 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1521
fixmerge1521:
  %t5266 = phi i64 [ %t5263, %fixfast1519 ], [ %t5265, %fixslow1520 ]
  %t5267 = load i64, ptr @"scheme.base:rd-list"
  %t5268 = and i64 %t5267, -8
  %t5269 = inttoptr i64 %t5268 to ptr
  %t5270 = load i64, ptr %t5269
  %t5271 = inttoptr i64 %t5270 to ptr
  %t5272 = musttail call fastcc i64 %t5271(i64 %t5267, i64 4, i64 %a0, i64 %a1, i64 %t5266, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5272
else1518:
  %t5273 = or i64 %t5250, 728
  %t5274 = and i64 %t5273, 7
  %t5275 = icmp eq i64 %t5274, 0
  br i1 %t5275, label %fixfast1522, label %fixslow1523
fixfast1522:
  %t5276 = icmp eq i64 %t5250, 728
  %t5277 = select i1 %t5276, i64 257, i64 1
  br label %fixmerge1524
fixslow1523:
  %t5278 = call i64 @rt_num_eq(i64 %t5250, i64 728)
  br label %fixmerge1524
fixmerge1524:
  %t5279 = phi i64 [ %t5277, %fixfast1522 ], [ %t5278, %fixslow1523 ]
  %t5280 = icmp ne i64 %t5279, 1
  br i1 %t5280, label %then1525, label %else1526
then1525:
  %t5281 = or i64 %a2, 8
  %t5282 = and i64 %t5281, 7
  %t5283 = icmp eq i64 %t5282, 0
  br i1 %t5283, label %fixfast1527, label %fixslow1528
fixfast1527:
  %t5284 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5285 = extractvalue {i64, i1} %t5284, 0
  %t5286 = extractvalue {i64, i1} %t5284, 1
  br i1 %t5286, label %fixslow1528, label %fixmerge1529
fixslow1528:
  %t5287 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1529
fixmerge1529:
  %t5288 = phi i64 [ %t5285, %fixfast1527 ], [ %t5287, %fixslow1528 ]
  %t5289 = load i64, ptr @"scheme.base:rd-list"
  %t5290 = and i64 %t5289, -8
  %t5291 = inttoptr i64 %t5290 to ptr
  %t5292 = load i64, ptr %t5291
  %t5293 = inttoptr i64 %t5292 to ptr
  %t5294 = musttail call fastcc i64 %t5293(i64 %t5289, i64 4, i64 %a0, i64 %a1, i64 %t5288, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5294
else1526:
  %t5295 = or i64 %t5250, 312
  %t5296 = and i64 %t5295, 7
  %t5297 = icmp eq i64 %t5296, 0
  br i1 %t5297, label %fixfast1530, label %fixslow1531
fixfast1530:
  %t5298 = icmp eq i64 %t5250, 312
  %t5299 = select i1 %t5298, i64 257, i64 1
  br label %fixmerge1532
fixslow1531:
  %t5300 = call i64 @rt_num_eq(i64 %t5250, i64 312)
  br label %fixmerge1532
fixmerge1532:
  %t5301 = phi i64 [ %t5299, %fixfast1530 ], [ %t5300, %fixslow1531 ]
  %t5302 = icmp ne i64 %t5301, 1
  br i1 %t5302, label %then1533, label %else1534
then1533:
  %t5303 = or i64 %a2, 8
  %t5304 = and i64 %t5303, 7
  %t5305 = icmp eq i64 %t5304, 0
  br i1 %t5305, label %fixfast1535, label %fixslow1536
fixfast1535:
  %t5306 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5307 = extractvalue {i64, i1} %t5306, 0
  %t5308 = extractvalue {i64, i1} %t5306, 1
  br i1 %t5308, label %fixslow1536, label %fixmerge1537
fixslow1536:
  %t5309 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1537
fixmerge1537:
  %t5310 = phi i64 [ %t5307, %fixfast1535 ], [ %t5309, %fixslow1536 ]
  %t5311 = load i64, ptr @"scheme.base:rd-quote"
  %t5312 = and i64 %t5311, -8
  %t5313 = inttoptr i64 %t5312 to ptr
  %t5314 = load i64, ptr %t5313
  %t5315 = inttoptr i64 %t5314 to ptr
  %t5316 = musttail call fastcc i64 %t5315(i64 %t5311, i64 3, i64 %a0, i64 %a1, i64 %t5310, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5316
else1534:
  %t5317 = or i64 %t5250, 768
  %t5318 = and i64 %t5317, 7
  %t5319 = icmp eq i64 %t5318, 0
  br i1 %t5319, label %fixfast1538, label %fixslow1539
fixfast1538:
  %t5320 = icmp eq i64 %t5250, 768
  %t5321 = select i1 %t5320, i64 257, i64 1
  br label %fixmerge1540
fixslow1539:
  %t5322 = call i64 @rt_num_eq(i64 %t5250, i64 768)
  br label %fixmerge1540
fixmerge1540:
  %t5323 = phi i64 [ %t5321, %fixfast1538 ], [ %t5322, %fixslow1539 ]
  %t5324 = icmp ne i64 %t5323, 1
  br i1 %t5324, label %then1541, label %else1542
then1541:
  %t5325 = or i64 %a2, 8
  %t5326 = and i64 %t5325, 7
  %t5327 = icmp eq i64 %t5326, 0
  br i1 %t5327, label %fixfast1543, label %fixslow1544
fixfast1543:
  %t5328 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5329 = extractvalue {i64, i1} %t5328, 0
  %t5330 = extractvalue {i64, i1} %t5328, 1
  br i1 %t5330, label %fixslow1544, label %fixmerge1545
fixslow1544:
  %t5331 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1545
fixmerge1545:
  %t5332 = phi i64 [ %t5329, %fixfast1543 ], [ %t5331, %fixslow1544 ]
  %t5333 = load i64, ptr @"scheme.base:rd-quasi"
  %t5334 = and i64 %t5333, -8
  %t5335 = inttoptr i64 %t5334 to ptr
  %t5336 = load i64, ptr %t5335
  %t5337 = inttoptr i64 %t5336 to ptr
  %t5338 = musttail call fastcc i64 %t5337(i64 %t5333, i64 3, i64 %a0, i64 %a1, i64 %t5332, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5338
else1542:
  %t5339 = or i64 %t5250, 352
  %t5340 = and i64 %t5339, 7
  %t5341 = icmp eq i64 %t5340, 0
  br i1 %t5341, label %fixfast1546, label %fixslow1547
fixfast1546:
  %t5342 = icmp eq i64 %t5250, 352
  %t5343 = select i1 %t5342, i64 257, i64 1
  br label %fixmerge1548
fixslow1547:
  %t5344 = call i64 @rt_num_eq(i64 %t5250, i64 352)
  br label %fixmerge1548
fixmerge1548:
  %t5345 = phi i64 [ %t5343, %fixfast1546 ], [ %t5344, %fixslow1547 ]
  %t5346 = icmp ne i64 %t5345, 1
  br i1 %t5346, label %then1549, label %else1550
then1549:
  %t5347 = or i64 %a2, 8
  %t5348 = and i64 %t5347, 7
  %t5349 = icmp eq i64 %t5348, 0
  br i1 %t5349, label %fixfast1551, label %fixslow1552
fixfast1551:
  %t5350 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5351 = extractvalue {i64, i1} %t5350, 0
  %t5352 = extractvalue {i64, i1} %t5350, 1
  br i1 %t5352, label %fixslow1552, label %fixmerge1553
fixslow1552:
  %t5353 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1553
fixmerge1553:
  %t5354 = phi i64 [ %t5351, %fixfast1551 ], [ %t5353, %fixslow1552 ]
  %t5355 = load i64, ptr @"scheme.base:rd-unquote"
  %t5356 = and i64 %t5355, -8
  %t5357 = inttoptr i64 %t5356 to ptr
  %t5358 = load i64, ptr %t5357
  %t5359 = inttoptr i64 %t5358 to ptr
  %t5360 = musttail call fastcc i64 %t5359(i64 %t5355, i64 3, i64 %a0, i64 %a1, i64 %t5354, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5360
else1550:
  %t5361 = or i64 %t5250, 272
  %t5362 = and i64 %t5361, 7
  %t5363 = icmp eq i64 %t5362, 0
  br i1 %t5363, label %fixfast1554, label %fixslow1555
fixfast1554:
  %t5364 = icmp eq i64 %t5250, 272
  %t5365 = select i1 %t5364, i64 257, i64 1
  br label %fixmerge1556
fixslow1555:
  %t5366 = call i64 @rt_num_eq(i64 %t5250, i64 272)
  br label %fixmerge1556
fixmerge1556:
  %t5367 = phi i64 [ %t5365, %fixfast1554 ], [ %t5366, %fixslow1555 ]
  %t5368 = icmp ne i64 %t5367, 1
  br i1 %t5368, label %then1557, label %else1558
then1557:
  %t5369 = or i64 %a2, 8
  %t5370 = and i64 %t5369, 7
  %t5371 = icmp eq i64 %t5370, 0
  br i1 %t5371, label %fixfast1559, label %fixslow1560
fixfast1559:
  %t5372 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5373 = extractvalue {i64, i1} %t5372, 0
  %t5374 = extractvalue {i64, i1} %t5372, 1
  br i1 %t5374, label %fixslow1560, label %fixmerge1561
fixslow1560:
  %t5375 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1561
fixmerge1561:
  %t5376 = phi i64 [ %t5373, %fixfast1559 ], [ %t5375, %fixslow1560 ]
  %t5377 = load i64, ptr @"scheme.base:rd-string"
  %t5378 = and i64 %t5377, -8
  %t5379 = inttoptr i64 %t5378 to ptr
  %t5380 = load i64, ptr %t5379
  %t5381 = inttoptr i64 %t5380 to ptr
  %t5382 = musttail call fastcc i64 %t5381(i64 %t5377, i64 3, i64 %a0, i64 %a1, i64 %t5376, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5382
else1558:
  %t5383 = or i64 %t5250, 280
  %t5384 = and i64 %t5383, 7
  %t5385 = icmp eq i64 %t5384, 0
  br i1 %t5385, label %fixfast1562, label %fixslow1563
fixfast1562:
  %t5386 = icmp eq i64 %t5250, 280
  %t5387 = select i1 %t5386, i64 257, i64 1
  br label %fixmerge1564
fixslow1563:
  %t5388 = call i64 @rt_num_eq(i64 %t5250, i64 280)
  br label %fixmerge1564
fixmerge1564:
  %t5389 = phi i64 [ %t5387, %fixfast1562 ], [ %t5388, %fixslow1563 ]
  %t5390 = icmp ne i64 %t5389, 1
  br i1 %t5390, label %then1565, label %else1566
then1565:
  %t5391 = or i64 %a2, 8
  %t5392 = and i64 %t5391, 7
  %t5393 = icmp eq i64 %t5392, 0
  br i1 %t5393, label %fixfast1567, label %fixslow1568
fixfast1567:
  %t5394 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a2, i64 8)
  %t5395 = extractvalue {i64, i1} %t5394, 0
  %t5396 = extractvalue {i64, i1} %t5394, 1
  br i1 %t5396, label %fixslow1568, label %fixmerge1569
fixslow1568:
  %t5397 = call i64 @rt_add(i64 %a2, i64 8)
  br label %fixmerge1569
fixmerge1569:
  %t5398 = phi i64 [ %t5395, %fixfast1567 ], [ %t5397, %fixslow1568 ]
  %t5399 = load i64, ptr @"scheme.base:rd-hash"
  %t5400 = and i64 %t5399, -8
  %t5401 = inttoptr i64 %t5400 to ptr
  %t5402 = load i64, ptr %t5401
  %t5403 = inttoptr i64 %t5402 to ptr
  %t5404 = musttail call fastcc i64 %t5403(i64 %t5399, i64 3, i64 %a0, i64 %a1, i64 %t5398, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5404
else1566:
  %t5405 = load i64, ptr @"scheme.base:rd-atom"
  %t5406 = and i64 %t5405, -8
  %t5407 = inttoptr i64 %t5406 to ptr
  %t5408 = load i64, ptr %t5407
  %t5409 = inttoptr i64 %t5408 to ptr
  %t5410 = musttail call fastcc i64 %t5409(i64 %t5405, i64 3, i64 %a0, i64 %a1, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5410
}

define fastcc i64 @"scheme.base:code:read-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5415 = icmp eq i64 %argc, 1
  br i1 %t5415, label %argok1571, label %arityerr1570
arityerr1570:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1571:
  %t5416 = call i64 @rt_string_length(i64 %a0)
  %t5417 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t5418 = and i64 %t5417, -8
  %t5419 = inttoptr i64 %t5418 to ptr
  %t5420 = load i64, ptr %t5419
  %t5421 = inttoptr i64 %t5420 to ptr
  %t5422 = call fastcc i64%t5421(i64 %t5417, i64 3, i64 %a0, i64 %t5416, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5423 = load i64, ptr @"scheme.base:rd-datum"
  %t5424 = and i64 %t5423, -8
  %t5425 = inttoptr i64 %t5424 to ptr
  %t5426 = load i64, ptr %t5425
  %t5427 = inttoptr i64 %t5426 to ptr
  %t5428 = call fastcc i64%t5427(i64 %t5423, i64 3, i64 %a0, i64 %t5416, i64 %t5422, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5429 = call i64 @rt_car(i64 %t5428)
  ret i64 %t5429
}

define fastcc i64 @"scheme.base:code_1262"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5434 = icmp eq i64 %argc, 2
  br i1 %t5434, label %argok1573, label %arityerr1572
arityerr1572:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1573:
  %t5435 = and i64 %self, -8
  %t5436 = inttoptr i64 %t5435 to ptr
  %t5437 = getelementptr i64, ptr %t5436, i64 1
  %t5438 = load i64, ptr %t5437
  %t5439 = or i64 %a0, %t5438
  %t5440 = and i64 %t5439, 7
  %t5441 = icmp eq i64 %t5440, 0
  br i1 %t5441, label %fixfast1574, label %fixslow1575
fixfast1574:
  %t5442 = icmp slt i64 %a0, %t5438
  %t5443 = select i1 %t5442, i64 257, i64 1
  br label %fixmerge1576
fixslow1575:
  %t5444 = call i64 @rt_lt(i64 %a0, i64 %t5438)
  br label %fixmerge1576
fixmerge1576:
  %t5445 = phi i64 [ %t5443, %fixfast1574 ], [ %t5444, %fixslow1575 ]
  %t5446 = icmp ne i64 %t5445, 1
  br i1 %t5446, label %then1577, label %else1578
then1577:
  %t5447 = and i64 %self, -8
  %t5448 = inttoptr i64 %t5447 to ptr
  %t5449 = getelementptr i64, ptr %t5448, i64 2
  %t5450 = load i64, ptr %t5449
  %t5451 = and i64 %self, -8
  %t5452 = inttoptr i64 %t5451 to ptr
  %t5453 = getelementptr i64, ptr %t5452, i64 1
  %t5454 = load i64, ptr %t5453
  %t5455 = load i64, ptr @"scheme.base:rd-datum"
  %t5456 = and i64 %t5455, -8
  %t5457 = inttoptr i64 %t5456 to ptr
  %t5458 = load i64, ptr %t5457
  %t5459 = inttoptr i64 %t5458 to ptr
  %t5460 = call fastcc i64%t5459(i64 %t5455, i64 3, i64 %t5450, i64 %t5454, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5461 = and i64 %self, -8
  %t5462 = inttoptr i64 %t5461 to ptr
  %t5463 = getelementptr i64, ptr %t5462, i64 2
  %t5464 = load i64, ptr %t5463
  %t5465 = and i64 %self, -8
  %t5466 = inttoptr i64 %t5465 to ptr
  %t5467 = getelementptr i64, ptr %t5466, i64 1
  %t5468 = load i64, ptr %t5467
  %t5469 = call i64 @rt_cdr(i64 %t5460)
  %t5470 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t5471 = and i64 %t5470, -8
  %t5472 = inttoptr i64 %t5471 to ptr
  %t5473 = load i64, ptr %t5472
  %t5474 = inttoptr i64 %t5473 to ptr
  %t5475 = call fastcc i64%t5474(i64 %t5470, i64 3, i64 %t5464, i64 %t5468, i64 %t5469, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5476 = call i64 @rt_car(i64 %t5460)
  %t5477 = call i64 @rt_cons(i64 %t5476, i64 %a1)
  %t5478 = musttail call fastcc i64 @"scheme.base:code_1262"(i64 %self, i64 2, i64 %t5475, i64 %t5477, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5478
else1578:
  %t5479 = load i64, ptr @"scheme.base:reverse"
  %t5480 = and i64 %t5479, -8
  %t5481 = inttoptr i64 %t5480 to ptr
  %t5482 = load i64, ptr %t5481
  %t5483 = inttoptr i64 %t5482 to ptr
  %t5484 = musttail call fastcc i64 %t5483(i64 %t5479, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5484
}

define fastcc i64 @"scheme.base:code:read-all-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5485 = icmp eq i64 %argc, 1
  br i1 %t5485, label %argok1580, label %arityerr1579
arityerr1579:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1580:
  %t5486 = call i64 @rt_string_length(i64 %a0)
  %t5487 = call ptr @rt_alloc_words(i64 4)
  %t5488 = ptrtoint ptr %t5487 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1262" to i64), ptr %t5487
  %t5489 = or i64 %t5488, 4
  %t5490 = getelementptr i64, ptr %t5487, i64 1
  store i64 %t5486, ptr %t5490
  %t5491 = getelementptr i64, ptr %t5487, i64 2
  store i64 %a0, ptr %t5491
  %t5492 = getelementptr i64, ptr %t5487, i64 3
  store i64 %t5489, ptr %t5492
  %t5493 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t5494 = and i64 %t5493, -8
  %t5495 = inttoptr i64 %t5494 to ptr
  %t5496 = load i64, ptr %t5495
  %t5497 = inttoptr i64 %t5496 to ptr
  %t5498 = call fastcc i64%t5497(i64 %t5493, i64 3, i64 %a0, i64 %t5486, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5499 = musttail call fastcc i64 @"scheme.base:code_1262"(i64 %t5489, i64 2, i64 %t5498, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5499
}

define fastcc i64 @"scheme.base:code:%port-rtd"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5505 = icmp eq i64 %argc, 0
  br i1 %t5505, label %argok1582, label %arityerr1581
arityerr1581:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1582:
  %t5506 = load i64, ptr @"scheme.base:%port-rtd-cell"
  %t5507 = icmp ne i64 %t5506, 1
  br i1 %t5507, label %then1583, label %else1584
then1583:
  %t5508 = load i64, ptr @"scheme.base:%port-rtd-cell"
  ret i64 %t5508
else1584:
  %t5509 = call i64 @rt_make_string(ptr @.str.lit.32, i64 4)
  %t5510 = call i64 @rt_make_record_type(i64 %t5509)
  %t5511 = call i64 @rt_root(i64 %t5510)
  store i64 %t5511, ptr @"scheme.base:%port-rtd-cell"
  %t5512 = load i64, ptr @"scheme.base:%port-rtd-cell"
  ret i64 %t5512
}

define fastcc i64 @"scheme.base:code:%make-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5517 = icmp eq i64 %argc, 6
  br i1 %t5517, label %argok1586, label %arityerr1585
arityerr1585:
  call void @rt_arity_error(i64 6, i64 %argc)
  unreachable
argok1586:
  %t5518 = load i64, ptr @"scheme.base:%port-rtd"
  %t5519 = and i64 %t5518, -8
  %t5520 = inttoptr i64 %t5519 to ptr
  %t5521 = load i64, ptr %t5520
  %t5522 = inttoptr i64 %t5521 to ptr
  %t5523 = call fastcc i64%t5522(i64 %t5518, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5524 = load i64, ptr @"scheme.base:list"
  %t5525 = and i64 %t5524, -8
  %t5526 = inttoptr i64 %t5525 to ptr
  %t5527 = load i64, ptr %t5526
  %t5528 = inttoptr i64 %t5527 to ptr
  %t5529 = call fastcc i64%t5528(i64 %t5524, i64 6, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 0, i64 0, ptr null)
  %t5530 = call i64 @rt_make_record(i64 %t5523, i64 %t5529)
  ret i64 %t5530
}

define fastcc i64 @"scheme.base:code:port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5535 = icmp eq i64 %argc, 1
  br i1 %t5535, label %argok1588, label %arityerr1587
arityerr1587:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1588:
  %t5536 = load i64, ptr @"scheme.base:%port-rtd"
  %t5537 = and i64 %t5536, -8
  %t5538 = inttoptr i64 %t5537 to ptr
  %t5539 = load i64, ptr %t5538
  %t5540 = inttoptr i64 %t5539 to ptr
  %t5541 = call fastcc i64%t5540(i64 %t5536, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5542 = call i64 @rt_record_of_type_p(i64 %a0, i64 %t5541)
  ret i64 %t5542
}

define fastcc i64 @"scheme.base:code:input-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5547 = icmp eq i64 %argc, 1
  br i1 %t5547, label %argok1590, label %arityerr1589
arityerr1589:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1590:
  %t5548 = load i64, ptr @"scheme.base:port?"
  %t5549 = and i64 %t5548, -8
  %t5550 = inttoptr i64 %t5549 to ptr
  %t5551 = load i64, ptr %t5550
  %t5552 = inttoptr i64 %t5551 to ptr
  %t5553 = call fastcc i64%t5552(i64 %t5548, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5554 = icmp ne i64 %t5553, 1
  br i1 %t5554, label %then1591, label %else1592
then1591:
  %t5555 = call i64 @rt_record_ref(i64 %a0, i64 8)
  ret i64 %t5555
else1592:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5560 = icmp eq i64 %argc, 1
  br i1 %t5560, label %argok1594, label %arityerr1593
arityerr1593:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1594:
  %t5561 = load i64, ptr @"scheme.base:port?"
  %t5562 = and i64 %t5561, -8
  %t5563 = inttoptr i64 %t5562 to ptr
  %t5564 = load i64, ptr %t5563
  %t5565 = inttoptr i64 %t5564 to ptr
  %t5566 = call fastcc i64%t5565(i64 %t5561, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5567 = icmp ne i64 %t5566, 1
  br i1 %t5567, label %then1595, label %else1596
then1595:
  %t5568 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t5569 = call i64 @rt_not(i64 %t5568)
  ret i64 %t5569
else1596:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:textual-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5574 = icmp eq i64 %argc, 1
  br i1 %t5574, label %argok1598, label %arityerr1597
arityerr1597:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1598:
  %t5575 = load i64, ptr @"scheme.base:port?"
  %t5576 = and i64 %t5575, -8
  %t5577 = inttoptr i64 %t5576 to ptr
  %t5578 = load i64, ptr %t5577
  %t5579 = inttoptr i64 %t5578 to ptr
  %t5580 = musttail call fastcc i64 %t5579(i64 %t5575, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5580
}

define fastcc i64 @"scheme.base:code:port-closed?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5585 = icmp eq i64 %argc, 1
  br i1 %t5585, label %argok1600, label %arityerr1599
arityerr1599:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1600:
  %t5586 = call i64 @rt_record_ref(i64 %a0, i64 40)
  ret i64 %t5586
}

define fastcc i64 @"scheme.base:code:input-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5591 = icmp eq i64 %argc, 1
  br i1 %t5591, label %argok1602, label %arityerr1601
arityerr1601:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1602:
  %t5592 = load i64, ptr @"scheme.base:input-port?"
  %t5593 = and i64 %t5592, -8
  %t5594 = inttoptr i64 %t5593 to ptr
  %t5595 = load i64, ptr %t5594
  %t5596 = inttoptr i64 %t5595 to ptr
  %t5597 = call fastcc i64%t5596(i64 %t5592, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5598 = icmp ne i64 %t5597, 1
  br i1 %t5598, label %then1603, label %else1604
then1603:
  %t5599 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t5600 = call i64 @rt_not(i64 %t5599)
  ret i64 %t5600
else1604:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5605 = icmp eq i64 %argc, 1
  br i1 %t5605, label %argok1606, label %arityerr1605
arityerr1605:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1606:
  %t5606 = load i64, ptr @"scheme.base:output-port?"
  %t5607 = and i64 %t5606, -8
  %t5608 = inttoptr i64 %t5607 to ptr
  %t5609 = load i64, ptr %t5608
  %t5610 = inttoptr i64 %t5609 to ptr
  %t5611 = call fastcc i64%t5610(i64 %t5606, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5612 = icmp ne i64 %t5611, 1
  br i1 %t5612, label %then1607, label %else1608
then1607:
  %t5613 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t5614 = call i64 @rt_not(i64 %t5613)
  ret i64 %t5614
else1608:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%check-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5619 = icmp eq i64 %argc, 2
  br i1 %t5619, label %argok1610, label %arityerr1609
arityerr1609:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1610:
  %t5620 = load i64, ptr @"scheme.base:input-port?"
  %t5621 = and i64 %t5620, -8
  %t5622 = inttoptr i64 %t5621 to ptr
  %t5623 = load i64, ptr %t5622
  %t5624 = inttoptr i64 %t5623 to ptr
  %t5625 = call fastcc i64%t5624(i64 %t5620, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5626 = call i64 @rt_not(i64 %t5625)
  %t5627 = icmp ne i64 %t5626, 1
  br i1 %t5627, label %then1611, label %else1612
then1611:
  %t5628 = call i64 @rt_make_string(ptr @.str.lit.33, i64 17)
  %t5629 = load i64, ptr @"scheme.base:error"
  %t5630 = and i64 %t5629, -8
  %t5631 = inttoptr i64 %t5630 to ptr
  %t5632 = load i64, ptr %t5631
  %t5633 = inttoptr i64 %t5632 to ptr
  %t5634 = musttail call fastcc i64 %t5633(i64 %t5629, i64 3, i64 %a1, i64 %t5628, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5634
else1612:
  %t5635 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t5636 = icmp ne i64 %t5635, 1
  br i1 %t5636, label %then1613, label %else1614
then1613:
  %t5637 = call i64 @rt_make_string(ptr @.str.lit.34, i64 14)
  %t5638 = load i64, ptr @"scheme.base:error"
  %t5639 = and i64 %t5638, -8
  %t5640 = inttoptr i64 %t5639 to ptr
  %t5641 = load i64, ptr %t5640
  %t5642 = inttoptr i64 %t5641 to ptr
  %t5643 = musttail call fastcc i64 %t5642(i64 %t5638, i64 3, i64 %a1, i64 %t5637, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5643
else1614:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:%check-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5648 = icmp eq i64 %argc, 2
  br i1 %t5648, label %argok1616, label %arityerr1615
arityerr1615:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1616:
  %t5649 = load i64, ptr @"scheme.base:output-port?"
  %t5650 = and i64 %t5649, -8
  %t5651 = inttoptr i64 %t5650 to ptr
  %t5652 = load i64, ptr %t5651
  %t5653 = inttoptr i64 %t5652 to ptr
  %t5654 = call fastcc i64%t5653(i64 %t5649, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5655 = call i64 @rt_not(i64 %t5654)
  %t5656 = icmp ne i64 %t5655, 1
  br i1 %t5656, label %then1617, label %else1618
then1617:
  %t5657 = call i64 @rt_make_string(ptr @.str.lit.35, i64 18)
  %t5658 = load i64, ptr @"scheme.base:error"
  %t5659 = and i64 %t5658, -8
  %t5660 = inttoptr i64 %t5659 to ptr
  %t5661 = load i64, ptr %t5660
  %t5662 = inttoptr i64 %t5661 to ptr
  %t5663 = musttail call fastcc i64 %t5662(i64 %t5658, i64 3, i64 %a1, i64 %t5657, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5663
else1618:
  %t5664 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t5665 = icmp ne i64 %t5664, 1
  br i1 %t5665, label %then1619, label %else1620
then1619:
  %t5666 = call i64 @rt_make_string(ptr @.str.lit.36, i64 14)
  %t5667 = load i64, ptr @"scheme.base:error"
  %t5668 = and i64 %t5667, -8
  %t5669 = inttoptr i64 %t5668 to ptr
  %t5670 = load i64, ptr %t5669
  %t5671 = inttoptr i64 %t5670 to ptr
  %t5672 = musttail call fastcc i64 %t5671(i64 %t5667, i64 3, i64 %a1, i64 %t5666, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5672
else1620:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:%port-buf"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5677 = icmp eq i64 %argc, 1
  br i1 %t5677, label %argok1622, label %arityerr1621
arityerr1621:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1622:
  %t5678 = call i64 @rt_record_ref(i64 %a0, i64 16)
  %t5679 = icmp ne i64 %t5678, 1
  br i1 %t5679, label %then1623, label %else1624
then1623:
  ret i64 %t5678
else1624:
  %t5680 = call i64 @rt_read_all_stdin()
  %t5681 = call i64 @rt_record_set(i64 %a0, i64 16, i64 %t5680)
  ret i64 %t5680
}

define fastcc i64 @"scheme.base:code:open-input-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5686 = icmp eq i64 %argc, 1
  br i1 %t5686, label %argok1626, label %arityerr1625
arityerr1625:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1626:
  %t5687 = load i64, ptr @"scheme.base:%make-port"
  %t5688 = and i64 %t5687, -8
  %t5689 = inttoptr i64 %t5688 to ptr
  %t5690 = load i64, ptr %t5689
  %t5691 = inttoptr i64 %t5690 to ptr
  %t5692 = musttail call fastcc i64 %t5691(i64 %t5687, i64 6, i64 1, i64 257, i64 %a0, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t5692
}

define fastcc i64 @"scheme.base:code:open-input-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5697 = icmp eq i64 %argc, 1
  br i1 %t5697, label %argok1628, label %arityerr1627
arityerr1627:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1628:
  %t5698 = call i64 @rt_read_file(i64 %a0)
  %t5699 = icmp ne i64 %t5698, 1
  br i1 %t5699, label %then1629, label %else1630
then1629:
  %t5700 = load i64, ptr @"scheme.base:%make-port"
  %t5701 = and i64 %t5700, -8
  %t5702 = inttoptr i64 %t5701 to ptr
  %t5703 = load i64, ptr %t5702
  %t5704 = inttoptr i64 %t5703 to ptr
  %t5705 = musttail call fastcc i64 %t5704(i64 %t5700, i64 6, i64 1, i64 257, i64 %t5698, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t5705
else1630:
  %t5706 = call i64 @rt_intern(ptr @.str.sym.37)
  %t5707 = call i64 @rt_make_string(ptr @.str.lit.38, i64 26)
  %t5708 = load i64, ptr @"scheme.base:error"
  %t5709 = and i64 %t5708, -8
  %t5710 = inttoptr i64 %t5709 to ptr
  %t5711 = load i64, ptr %t5710
  %t5712 = inttoptr i64 %t5711 to ptr
  %t5713 = musttail call fastcc i64 %t5712(i64 %t5708, i64 3, i64 %t5706, i64 %t5707, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5713
}

define fastcc i64 @"scheme.base:code:%port-at-eof?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5718 = icmp eq i64 %argc, 1
  br i1 %t5718, label %argok1632, label %arityerr1631
arityerr1631:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1632:
  %t5719 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t5720 = load i64, ptr @"scheme.base:%port-buf"
  %t5721 = and i64 %t5720, -8
  %t5722 = inttoptr i64 %t5721 to ptr
  %t5723 = load i64, ptr %t5722
  %t5724 = inttoptr i64 %t5723 to ptr
  %t5725 = call fastcc i64%t5724(i64 %t5720, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5726 = call i64 @rt_string_length(i64 %t5725)
  %t5727 = or i64 %t5726, %t5719
  %t5728 = and i64 %t5727, 7
  %t5729 = icmp eq i64 %t5728, 0
  br i1 %t5729, label %fixfast1633, label %fixslow1634
fixfast1633:
  %t5730 = icmp slt i64 %t5726, %t5719
  %t5731 = select i1 %t5730, i64 257, i64 1
  br label %fixmerge1635
fixslow1634:
  %t5732 = call i64 @rt_lt(i64 %t5726, i64 %t5719)
  br label %fixmerge1635
fixmerge1635:
  %t5733 = phi i64 [ %t5731, %fixfast1633 ], [ %t5732, %fixslow1634 ]
  %t5734 = icmp ne i64 %t5733, 1
  br i1 %t5734, label %then1636, label %else1637
then1636:
  ret i64 257
else1637:
  %t5735 = or i64 %t5719, %t5726
  %t5736 = and i64 %t5735, 7
  %t5737 = icmp eq i64 %t5736, 0
  br i1 %t5737, label %fixfast1638, label %fixslow1639
fixfast1638:
  %t5738 = icmp eq i64 %t5719, %t5726
  %t5739 = select i1 %t5738, i64 257, i64 1
  br label %fixmerge1640
fixslow1639:
  %t5740 = call i64 @rt_num_eq(i64 %t5719, i64 %t5726)
  br label %fixmerge1640
fixmerge1640:
  %t5741 = phi i64 [ %t5739, %fixfast1638 ], [ %t5740, %fixslow1639 ]
  ret i64 %t5741
}

define fastcc i64 @"scheme.base:code:read-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5746 = icmp eq i64 %argc, 1
  br i1 %t5746, label %argok1642, label %arityerr1641
arityerr1641:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1642:
  %t5747 = call i64 @rt_intern(ptr @.str.sym.39)
  %t5748 = load i64, ptr @"scheme.base:%check-input-port"
  %t5749 = and i64 %t5748, -8
  %t5750 = inttoptr i64 %t5749 to ptr
  %t5751 = load i64, ptr %t5750
  %t5752 = inttoptr i64 %t5751 to ptr
  %t5753 = call fastcc i64%t5752(i64 %t5748, i64 2, i64 %a0, i64 %t5747, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5754 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t5755 = and i64 %t5754, -8
  %t5756 = inttoptr i64 %t5755 to ptr
  %t5757 = load i64, ptr %t5756
  %t5758 = inttoptr i64 %t5757 to ptr
  %t5759 = call fastcc i64%t5758(i64 %t5754, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5760 = icmp ne i64 %t5759, 1
  br i1 %t5760, label %then1643, label %else1644
then1643:
  %t5761 = call i64 @rt_eof_object()
  ret i64 %t5761
else1644:
  %t5762 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t5763 = or i64 %t5762, 8
  %t5764 = and i64 %t5763, 7
  %t5765 = icmp eq i64 %t5764, 0
  br i1 %t5765, label %fixfast1645, label %fixslow1646
fixfast1645:
  %t5766 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5762, i64 8)
  %t5767 = extractvalue {i64, i1} %t5766, 0
  %t5768 = extractvalue {i64, i1} %t5766, 1
  br i1 %t5768, label %fixslow1646, label %fixmerge1647
fixslow1646:
  %t5769 = call i64 @rt_add(i64 %t5762, i64 8)
  br label %fixmerge1647
fixmerge1647:
  %t5770 = phi i64 [ %t5767, %fixfast1645 ], [ %t5769, %fixslow1646 ]
  %t5771 = call i64 @rt_record_set(i64 %a0, i64 24, i64 %t5770)
  %t5772 = load i64, ptr @"scheme.base:%port-buf"
  %t5773 = and i64 %t5772, -8
  %t5774 = inttoptr i64 %t5773 to ptr
  %t5775 = load i64, ptr %t5774
  %t5776 = inttoptr i64 %t5775 to ptr
  %t5777 = call fastcc i64%t5776(i64 %t5772, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5778 = call i64 @rt_string_ref(i64 %t5777, i64 %t5762)
  ret i64 %t5778
}

define fastcc i64 @"scheme.base:code:peek-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5783 = icmp eq i64 %argc, 1
  br i1 %t5783, label %argok1649, label %arityerr1648
arityerr1648:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1649:
  %t5784 = call i64 @rt_intern(ptr @.str.sym.40)
  %t5785 = load i64, ptr @"scheme.base:%check-input-port"
  %t5786 = and i64 %t5785, -8
  %t5787 = inttoptr i64 %t5786 to ptr
  %t5788 = load i64, ptr %t5787
  %t5789 = inttoptr i64 %t5788 to ptr
  %t5790 = call fastcc i64%t5789(i64 %t5785, i64 2, i64 %a0, i64 %t5784, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5791 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t5792 = and i64 %t5791, -8
  %t5793 = inttoptr i64 %t5792 to ptr
  %t5794 = load i64, ptr %t5793
  %t5795 = inttoptr i64 %t5794 to ptr
  %t5796 = call fastcc i64%t5795(i64 %t5791, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5797 = icmp ne i64 %t5796, 1
  br i1 %t5797, label %then1650, label %else1651
then1650:
  %t5798 = call i64 @rt_eof_object()
  ret i64 %t5798
else1651:
  %t5799 = load i64, ptr @"scheme.base:%port-buf"
  %t5800 = and i64 %t5799, -8
  %t5801 = inttoptr i64 %t5800 to ptr
  %t5802 = load i64, ptr %t5801
  %t5803 = inttoptr i64 %t5802 to ptr
  %t5804 = call fastcc i64%t5803(i64 %t5799, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5805 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t5806 = call i64 @rt_string_ref(i64 %t5804, i64 %t5805)
  ret i64 %t5806
}

define fastcc i64 @"scheme.base:code_1324"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5811 = icmp eq i64 %argc, 1
  br i1 %t5811, label %argok1653, label %arityerr1652
arityerr1652:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1653:
  %t5812 = and i64 %self, -8
  %t5813 = inttoptr i64 %t5812 to ptr
  %t5814 = getelementptr i64, ptr %t5813, i64 1
  %t5815 = load i64, ptr %t5814
  %t5816 = or i64 %t5815, %a0
  %t5817 = and i64 %t5816, 7
  %t5818 = icmp eq i64 %t5817, 0
  br i1 %t5818, label %fixfast1654, label %fixslow1655
fixfast1654:
  %t5819 = icmp slt i64 %t5815, %a0
  %t5820 = select i1 %t5819, i64 257, i64 1
  br label %fixmerge1656
fixslow1655:
  %t5821 = call i64 @rt_lt(i64 %t5815, i64 %a0)
  br label %fixmerge1656
fixmerge1656:
  %t5822 = phi i64 [ %t5820, %fixfast1654 ], [ %t5821, %fixslow1655 ]
  %t5823 = icmp ne i64 %t5822, 1
  br i1 %t5823, label %then1657, label %else1658
then1657:
  br label %merge1659
else1658:
  %t5824 = or i64 %a0, %t5815
  %t5825 = and i64 %t5824, 7
  %t5826 = icmp eq i64 %t5825, 0
  br i1 %t5826, label %fixfast1660, label %fixslow1661
fixfast1660:
  %t5827 = icmp eq i64 %a0, %t5815
  %t5828 = select i1 %t5827, i64 257, i64 1
  br label %fixmerge1662
fixslow1661:
  %t5829 = call i64 @rt_num_eq(i64 %a0, i64 %t5815)
  br label %fixmerge1662
fixmerge1662:
  %t5830 = phi i64 [ %t5828, %fixfast1660 ], [ %t5829, %fixslow1661 ]
  br label %merge1659
merge1659:
  %t5831 = phi i64 [ 257, %then1657 ], [ %t5830, %fixmerge1662 ]
  %t5832 = icmp ne i64 %t5831, 1
  br i1 %t5832, label %then1663, label %else1664
then1663:
  %t5833 = and i64 %self, -8
  %t5834 = inttoptr i64 %t5833 to ptr
  %t5835 = getelementptr i64, ptr %t5834, i64 2
  %t5836 = load i64, ptr %t5835
  %t5837 = call i64 @rt_record_ref(i64 %t5836, i64 24)
  %t5838 = and i64 %self, -8
  %t5839 = inttoptr i64 %t5838 to ptr
  %t5840 = getelementptr i64, ptr %t5839, i64 2
  %t5841 = load i64, ptr %t5840
  %t5842 = and i64 %self, -8
  %t5843 = inttoptr i64 %t5842 to ptr
  %t5844 = getelementptr i64, ptr %t5843, i64 1
  %t5845 = load i64, ptr %t5844
  %t5846 = call i64 @rt_record_set(i64 %t5841, i64 24, i64 %t5845)
  %t5847 = and i64 %self, -8
  %t5848 = inttoptr i64 %t5847 to ptr
  %t5849 = getelementptr i64, ptr %t5848, i64 3
  %t5850 = load i64, ptr %t5849
  %t5851 = and i64 %self, -8
  %t5852 = inttoptr i64 %t5851 to ptr
  %t5853 = getelementptr i64, ptr %t5852, i64 1
  %t5854 = load i64, ptr %t5853
  %t5855 = call i64 @rt_substring(i64 %t5850, i64 %t5837, i64 %t5854)
  ret i64 %t5855
else1664:
  %t5856 = and i64 %self, -8
  %t5857 = inttoptr i64 %t5856 to ptr
  %t5858 = getelementptr i64, ptr %t5857, i64 3
  %t5859 = load i64, ptr %t5858
  %t5860 = call i64 @rt_string_ref(i64 %t5859, i64 %a0)
  %t5861 = load i64, ptr @"scheme.base:char=?"
  %t5862 = and i64 %t5861, -8
  %t5863 = inttoptr i64 %t5862 to ptr
  %t5864 = load i64, ptr %t5863
  %t5865 = inttoptr i64 %t5864 to ptr
  %t5866 = call fastcc i64%t5865(i64 %t5861, i64 2, i64 %t5860, i64 2569, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5867 = icmp ne i64 %t5866, 1
  br i1 %t5867, label %then1665, label %else1666
then1665:
  %t5868 = and i64 %self, -8
  %t5869 = inttoptr i64 %t5868 to ptr
  %t5870 = getelementptr i64, ptr %t5869, i64 2
  %t5871 = load i64, ptr %t5870
  %t5872 = call i64 @rt_record_ref(i64 %t5871, i64 24)
  %t5873 = and i64 %self, -8
  %t5874 = inttoptr i64 %t5873 to ptr
  %t5875 = getelementptr i64, ptr %t5874, i64 2
  %t5876 = load i64, ptr %t5875
  %t5877 = or i64 %a0, 8
  %t5878 = and i64 %t5877, 7
  %t5879 = icmp eq i64 %t5878, 0
  br i1 %t5879, label %fixfast1667, label %fixslow1668
fixfast1667:
  %t5880 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5881 = extractvalue {i64, i1} %t5880, 0
  %t5882 = extractvalue {i64, i1} %t5880, 1
  br i1 %t5882, label %fixslow1668, label %fixmerge1669
fixslow1668:
  %t5883 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1669
fixmerge1669:
  %t5884 = phi i64 [ %t5881, %fixfast1667 ], [ %t5883, %fixslow1668 ]
  %t5885 = call i64 @rt_record_set(i64 %t5876, i64 24, i64 %t5884)
  %t5886 = and i64 %self, -8
  %t5887 = inttoptr i64 %t5886 to ptr
  %t5888 = getelementptr i64, ptr %t5887, i64 3
  %t5889 = load i64, ptr %t5888
  %t5890 = call i64 @rt_substring(i64 %t5889, i64 %t5872, i64 %a0)
  ret i64 %t5890
else1666:
  %t5891 = or i64 %a0, 8
  %t5892 = and i64 %t5891, 7
  %t5893 = icmp eq i64 %t5892, 0
  br i1 %t5893, label %fixfast1670, label %fixslow1671
fixfast1670:
  %t5894 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5895 = extractvalue {i64, i1} %t5894, 0
  %t5896 = extractvalue {i64, i1} %t5894, 1
  br i1 %t5896, label %fixslow1671, label %fixmerge1672
fixslow1671:
  %t5897 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1672
fixmerge1672:
  %t5898 = phi i64 [ %t5895, %fixfast1670 ], [ %t5897, %fixslow1671 ]
  %t5899 = musttail call fastcc i64 @"scheme.base:code_1324"(i64 %self, i64 1, i64 %t5898, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5899
}

define fastcc i64 @"scheme.base:code:read-line"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5900 = icmp eq i64 %argc, 1
  br i1 %t5900, label %argok1674, label %arityerr1673
arityerr1673:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1674:
  %t5901 = call i64 @rt_intern(ptr @.str.sym.41)
  %t5902 = load i64, ptr @"scheme.base:%check-input-port"
  %t5903 = and i64 %t5902, -8
  %t5904 = inttoptr i64 %t5903 to ptr
  %t5905 = load i64, ptr %t5904
  %t5906 = inttoptr i64 %t5905 to ptr
  %t5907 = call fastcc i64%t5906(i64 %t5902, i64 2, i64 %a0, i64 %t5901, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5908 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t5909 = and i64 %t5908, -8
  %t5910 = inttoptr i64 %t5909 to ptr
  %t5911 = load i64, ptr %t5910
  %t5912 = inttoptr i64 %t5911 to ptr
  %t5913 = call fastcc i64%t5912(i64 %t5908, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5914 = icmp ne i64 %t5913, 1
  br i1 %t5914, label %then1675, label %else1676
then1675:
  %t5915 = call i64 @rt_eof_object()
  ret i64 %t5915
else1676:
  %t5916 = load i64, ptr @"scheme.base:%port-buf"
  %t5917 = and i64 %t5916, -8
  %t5918 = inttoptr i64 %t5917 to ptr
  %t5919 = load i64, ptr %t5918
  %t5920 = inttoptr i64 %t5919 to ptr
  %t5921 = call fastcc i64%t5920(i64 %t5916, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5922 = call i64 @rt_string_length(i64 %t5921)
  %t5923 = call ptr @rt_alloc_words(i64 5)
  %t5924 = ptrtoint ptr %t5923 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1324" to i64), ptr %t5923
  %t5925 = or i64 %t5924, 4
  %t5926 = getelementptr i64, ptr %t5923, i64 1
  store i64 %t5922, ptr %t5926
  %t5927 = getelementptr i64, ptr %t5923, i64 2
  store i64 %a0, ptr %t5927
  %t5928 = getelementptr i64, ptr %t5923, i64 3
  store i64 %t5921, ptr %t5928
  %t5929 = getelementptr i64, ptr %t5923, i64 4
  store i64 %t5925, ptr %t5929
  %t5930 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t5931 = musttail call fastcc i64 @"scheme.base:code_1324"(i64 %t5925, i64 1, i64 %t5930, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5931
}

define fastcc i64 @"scheme.base:code:read-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5936 = icmp eq i64 %argc, 2
  br i1 %t5936, label %argok1678, label %arityerr1677
arityerr1677:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1678:
  %t5937 = call i64 @rt_intern(ptr @.str.sym.42)
  %t5938 = load i64, ptr @"scheme.base:%check-input-port"
  %t5939 = and i64 %t5938, -8
  %t5940 = inttoptr i64 %t5939 to ptr
  %t5941 = load i64, ptr %t5940
  %t5942 = inttoptr i64 %t5941 to ptr
  %t5943 = call fastcc i64%t5942(i64 %t5938, i64 2, i64 %a1, i64 %t5937, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5944 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t5945 = and i64 %t5944, -8
  %t5946 = inttoptr i64 %t5945 to ptr
  %t5947 = load i64, ptr %t5946
  %t5948 = inttoptr i64 %t5947 to ptr
  %t5949 = call fastcc i64%t5948(i64 %t5944, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5950 = icmp ne i64 %t5949, 1
  br i1 %t5950, label %then1679, label %else1680
then1679:
  %t5951 = call i64 @rt_eof_object()
  ret i64 %t5951
else1680:
  %t5952 = load i64, ptr @"scheme.base:%port-buf"
  %t5953 = and i64 %t5952, -8
  %t5954 = inttoptr i64 %t5953 to ptr
  %t5955 = load i64, ptr %t5954
  %t5956 = inttoptr i64 %t5955 to ptr
  %t5957 = call fastcc i64%t5956(i64 %t5952, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5958 = call i64 @rt_string_length(i64 %t5957)
  %t5959 = call i64 @rt_record_ref(i64 %a1, i64 24)
  %t5960 = or i64 %t5959, %a0
  %t5961 = and i64 %t5960, 7
  %t5962 = icmp eq i64 %t5961, 0
  br i1 %t5962, label %fixfast1681, label %fixslow1682
fixfast1681:
  %t5963 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5959, i64 %a0)
  %t5964 = extractvalue {i64, i1} %t5963, 0
  %t5965 = extractvalue {i64, i1} %t5963, 1
  br i1 %t5965, label %fixslow1682, label %fixmerge1683
fixslow1682:
  %t5966 = call i64 @rt_add(i64 %t5959, i64 %a0)
  br label %fixmerge1683
fixmerge1683:
  %t5967 = phi i64 [ %t5964, %fixfast1681 ], [ %t5966, %fixslow1682 ]
  %t5968 = or i64 %t5958, %t5967
  %t5969 = and i64 %t5968, 7
  %t5970 = icmp eq i64 %t5969, 0
  br i1 %t5970, label %fixfast1684, label %fixslow1685
fixfast1684:
  %t5971 = icmp slt i64 %t5958, %t5967
  %t5972 = select i1 %t5971, i64 257, i64 1
  br label %fixmerge1686
fixslow1685:
  %t5973 = call i64 @rt_lt(i64 %t5958, i64 %t5967)
  br label %fixmerge1686
fixmerge1686:
  %t5974 = phi i64 [ %t5972, %fixfast1684 ], [ %t5973, %fixslow1685 ]
  %t5975 = icmp ne i64 %t5974, 1
  br i1 %t5975, label %then1687, label %else1688
then1687:
  br label %merge1689
else1688:
  %t5976 = or i64 %t5959, %a0
  %t5977 = and i64 %t5976, 7
  %t5978 = icmp eq i64 %t5977, 0
  br i1 %t5978, label %fixfast1690, label %fixslow1691
fixfast1690:
  %t5979 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5959, i64 %a0)
  %t5980 = extractvalue {i64, i1} %t5979, 0
  %t5981 = extractvalue {i64, i1} %t5979, 1
  br i1 %t5981, label %fixslow1691, label %fixmerge1692
fixslow1691:
  %t5982 = call i64 @rt_add(i64 %t5959, i64 %a0)
  br label %fixmerge1692
fixmerge1692:
  %t5983 = phi i64 [ %t5980, %fixfast1690 ], [ %t5982, %fixslow1691 ]
  br label %merge1689
merge1689:
  %t5984 = phi i64 [ %t5958, %then1687 ], [ %t5983, %fixmerge1692 ]
  %t5985 = call i64 @rt_record_set(i64 %a1, i64 24, i64 %t5984)
  %t5986 = call i64 @rt_substring(i64 %t5957, i64 %t5959, i64 %t5984)
  ret i64 %t5986
}

define fastcc i64 @"scheme.base:code:read"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5991 = icmp eq i64 %argc, 1
  br i1 %t5991, label %argok1694, label %arityerr1693
arityerr1693:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1694:
  %t5992 = call i64 @rt_intern(ptr @.str.sym.43)
  %t5993 = load i64, ptr @"scheme.base:%check-input-port"
  %t5994 = and i64 %t5993, -8
  %t5995 = inttoptr i64 %t5994 to ptr
  %t5996 = load i64, ptr %t5995
  %t5997 = inttoptr i64 %t5996 to ptr
  %t5998 = call fastcc i64%t5997(i64 %t5993, i64 2, i64 %a0, i64 %t5992, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5999 = load i64, ptr @"scheme.base:%port-buf"
  %t6000 = and i64 %t5999, -8
  %t6001 = inttoptr i64 %t6000 to ptr
  %t6002 = load i64, ptr %t6001
  %t6003 = inttoptr i64 %t6002 to ptr
  %t6004 = call fastcc i64%t6003(i64 %t5999, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6005 = call i64 @rt_string_length(i64 %t6004)
  %t6006 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t6007 = load i64, ptr @"scheme.base:rd-skip-ws"
  %t6008 = and i64 %t6007, -8
  %t6009 = inttoptr i64 %t6008 to ptr
  %t6010 = load i64, ptr %t6009
  %t6011 = inttoptr i64 %t6010 to ptr
  %t6012 = call fastcc i64%t6011(i64 %t6007, i64 3, i64 %t6004, i64 %t6005, i64 %t6006, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6013 = or i64 %t6005, %t6012
  %t6014 = and i64 %t6013, 7
  %t6015 = icmp eq i64 %t6014, 0
  br i1 %t6015, label %fixfast1695, label %fixslow1696
fixfast1695:
  %t6016 = icmp slt i64 %t6005, %t6012
  %t6017 = select i1 %t6016, i64 257, i64 1
  br label %fixmerge1697
fixslow1696:
  %t6018 = call i64 @rt_lt(i64 %t6005, i64 %t6012)
  br label %fixmerge1697
fixmerge1697:
  %t6019 = phi i64 [ %t6017, %fixfast1695 ], [ %t6018, %fixslow1696 ]
  %t6020 = icmp ne i64 %t6019, 1
  br i1 %t6020, label %then1698, label %else1699
then1698:
  br label %merge1700
else1699:
  %t6021 = or i64 %t6012, %t6005
  %t6022 = and i64 %t6021, 7
  %t6023 = icmp eq i64 %t6022, 0
  br i1 %t6023, label %fixfast1701, label %fixslow1702
fixfast1701:
  %t6024 = icmp eq i64 %t6012, %t6005
  %t6025 = select i1 %t6024, i64 257, i64 1
  br label %fixmerge1703
fixslow1702:
  %t6026 = call i64 @rt_num_eq(i64 %t6012, i64 %t6005)
  br label %fixmerge1703
fixmerge1703:
  %t6027 = phi i64 [ %t6025, %fixfast1701 ], [ %t6026, %fixslow1702 ]
  br label %merge1700
merge1700:
  %t6028 = phi i64 [ 257, %then1698 ], [ %t6027, %fixmerge1703 ]
  %t6029 = icmp ne i64 %t6028, 1
  br i1 %t6029, label %then1704, label %else1705
then1704:
  %t6030 = call i64 @rt_record_set(i64 %a0, i64 24, i64 %t6005)
  %t6031 = call i64 @rt_eof_object()
  ret i64 %t6031
else1705:
  %t6032 = load i64, ptr @"scheme.base:rd-datum"
  %t6033 = and i64 %t6032, -8
  %t6034 = inttoptr i64 %t6033 to ptr
  %t6035 = load i64, ptr %t6034
  %t6036 = inttoptr i64 %t6035 to ptr
  %t6037 = call fastcc i64%t6036(i64 %t6032, i64 3, i64 %t6004, i64 %t6005, i64 %t6012, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6038 = call i64 @rt_cdr(i64 %t6037)
  %t6039 = call i64 @rt_record_set(i64 %a0, i64 24, i64 %t6038)
  %t6040 = call i64 @rt_car(i64 %t6037)
  ret i64 %t6040
}

define fastcc i64 @"scheme.base:code:open-output-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6045 = icmp eq i64 %argc, 1
  br i1 %t6045, label %argok1707, label %arityerr1706
arityerr1706:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1707:
  %t6046 = call i64 @rt_port_open_output_file(i64 %a0)
  %t6047 = icmp ne i64 %t6046, 1
  br i1 %t6047, label %then1708, label %else1709
then1708:
  %t6048 = load i64, ptr @"scheme.base:%make-port"
  %t6049 = and i64 %t6048, -8
  %t6050 = inttoptr i64 %t6049 to ptr
  %t6051 = load i64, ptr %t6050
  %t6052 = inttoptr i64 %t6051 to ptr
  %t6053 = musttail call fastcc i64 %t6052(i64 %t6048, i64 6, i64 %t6046, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t6053
else1709:
  %t6054 = call i64 @rt_intern(ptr @.str.sym.44)
  %t6055 = call i64 @rt_make_string(ptr @.str.lit.45, i64 27)
  %t6056 = load i64, ptr @"scheme.base:error"
  %t6057 = and i64 %t6056, -8
  %t6058 = inttoptr i64 %t6057 to ptr
  %t6059 = load i64, ptr %t6058
  %t6060 = inttoptr i64 %t6059 to ptr
  %t6061 = musttail call fastcc i64 %t6060(i64 %t6056, i64 3, i64 %t6054, i64 %t6055, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6061
}

define fastcc i64 @"scheme.base:code:open-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6066 = icmp eq i64 %argc, 0
  br i1 %t6066, label %argok1711, label %arityerr1710
arityerr1710:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1711:
  %t6067 = call i64 @rt_port_open_output_string()
  %t6068 = icmp ne i64 %t6067, 1
  br i1 %t6068, label %then1712, label %else1713
then1712:
  %t6069 = load i64, ptr @"scheme.base:%make-port"
  %t6070 = and i64 %t6069, -8
  %t6071 = inttoptr i64 %t6070 to ptr
  %t6072 = load i64, ptr %t6071
  %t6073 = inttoptr i64 %t6072 to ptr
  %t6074 = musttail call fastcc i64 %t6073(i64 %t6069, i64 6, i64 %t6067, i64 1, i64 1, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t6074
else1713:
  %t6075 = call i64 @rt_intern(ptr @.str.sym.46)
  %t6076 = call i64 @rt_make_string(ptr @.str.lit.47, i64 33)
  %t6077 = load i64, ptr @"scheme.base:error"
  %t6078 = and i64 %t6077, -8
  %t6079 = inttoptr i64 %t6078 to ptr
  %t6080 = load i64, ptr %t6079
  %t6081 = inttoptr i64 %t6080 to ptr
  %t6082 = musttail call fastcc i64 %t6081(i64 %t6077, i64 2, i64 %t6075, i64 %t6076, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6082
}

define fastcc i64 @"scheme.base:code:get-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6087 = icmp eq i64 %argc, 1
  br i1 %t6087, label %argok1715, label %arityerr1714
arityerr1714:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1715:
  %t6088 = load i64, ptr @"scheme.base:output-port?"
  %t6089 = and i64 %t6088, -8
  %t6090 = inttoptr i64 %t6089 to ptr
  %t6091 = load i64, ptr %t6090
  %t6092 = inttoptr i64 %t6091 to ptr
  %t6093 = call fastcc i64%t6092(i64 %t6088, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6094 = call i64 @rt_not(i64 %t6093)
  %t6095 = icmp ne i64 %t6094, 1
  br i1 %t6095, label %then1716, label %else1717
then1716:
  %t6096 = call i64 @rt_intern(ptr @.str.sym.48)
  %t6097 = call i64 @rt_make_string(ptr @.str.lit.49, i64 18)
  %t6098 = load i64, ptr @"scheme.base:error"
  %t6099 = and i64 %t6098, -8
  %t6100 = inttoptr i64 %t6099 to ptr
  %t6101 = load i64, ptr %t6100
  %t6102 = inttoptr i64 %t6101 to ptr
  %t6103 = musttail call fastcc i64 %t6102(i64 %t6098, i64 3, i64 %t6096, i64 %t6097, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6103
else1717:
  %t6104 = call i64 @rt_record_ref(i64 %a0, i64 32)
  %t6105 = call i64 @rt_not(i64 %t6104)
  %t6106 = icmp ne i64 %t6105, 1
  br i1 %t6106, label %then1718, label %else1719
then1718:
  %t6107 = call i64 @rt_intern(ptr @.str.sym.48)
  %t6108 = call i64 @rt_make_string(ptr @.str.lit.50, i64 17)
  %t6109 = load i64, ptr @"scheme.base:error"
  %t6110 = and i64 %t6109, -8
  %t6111 = inttoptr i64 %t6110 to ptr
  %t6112 = load i64, ptr %t6111
  %t6113 = inttoptr i64 %t6112 to ptr
  %t6114 = musttail call fastcc i64 %t6113(i64 %t6109, i64 3, i64 %t6107, i64 %t6108, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6114
else1719:
  %t6115 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t6116 = call i64 @rt_port_get_output_string(i64 %t6115)
  ret i64 %t6116
}

define fastcc i64 @"scheme.base:code:flush-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6121 = icmp eq i64 %argc, 1
  br i1 %t6121, label %argok1721, label %arityerr1720
arityerr1720:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1721:
  %t6122 = call i64 @rt_intern(ptr @.str.sym.51)
  %t6123 = load i64, ptr @"scheme.base:%check-output-port"
  %t6124 = and i64 %t6123, -8
  %t6125 = inttoptr i64 %t6124 to ptr
  %t6126 = load i64, ptr %t6125
  %t6127 = inttoptr i64 %t6126 to ptr
  %t6128 = call fastcc i64%t6127(i64 %t6123, i64 2, i64 %a0, i64 %t6122, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6129 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t6130 = call i64 @rt_port_flush(i64 %t6129)
  ret i64 %t6130
}

define fastcc i64 @"scheme.base:code:close-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6135 = icmp eq i64 %argc, 1
  br i1 %t6135, label %argok1723, label %arityerr1722
arityerr1722:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1723:
  %t6136 = load i64, ptr @"scheme.base:port?"
  %t6137 = and i64 %t6136, -8
  %t6138 = inttoptr i64 %t6137 to ptr
  %t6139 = load i64, ptr %t6138
  %t6140 = inttoptr i64 %t6139 to ptr
  %t6141 = call fastcc i64%t6140(i64 %t6136, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6142 = call i64 @rt_not(i64 %t6141)
  %t6143 = icmp ne i64 %t6142, 1
  br i1 %t6143, label %then1724, label %else1725
then1724:
  %t6144 = call i64 @rt_intern(ptr @.str.sym.52)
  %t6145 = call i64 @rt_make_string(ptr @.str.lit.53, i64 10)
  %t6146 = load i64, ptr @"scheme.base:error"
  %t6147 = and i64 %t6146, -8
  %t6148 = inttoptr i64 %t6147 to ptr
  %t6149 = load i64, ptr %t6148
  %t6150 = inttoptr i64 %t6149 to ptr
  %t6151 = musttail call fastcc i64 %t6150(i64 %t6146, i64 3, i64 %t6144, i64 %t6145, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6151
else1725:
  %t6152 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t6153 = icmp ne i64 %t6152, 1
  br i1 %t6153, label %then1726, label %else1727
then1726:
  %t6154 = icmp ne i64 1, 1
  br i1 %t6154, label %then1728, label %else1729
then1728:
  ret i64 1
else1729:
  ret i64 17
else1727:
  %t6155 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t6156 = call i64 @rt_not(i64 %t6155)
  %t6157 = icmp ne i64 %t6156, 1
  br i1 %t6157, label %then1730, label %else1731
then1730:
  %t6158 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t6159 = call i64 @rt_port_close(i64 %t6158)
  br label %merge1732
else1731:
  br label %merge1732
merge1732:
  %t6160 = phi i64 [ %t6159, %then1730 ], [ 17, %else1731 ]
  %t6161 = call i64 @rt_record_set(i64 %a0, i64 40, i64 257)
  %t6162 = icmp ne i64 1, 1
  br i1 %t6162, label %then1733, label %else1734
then1733:
  ret i64 1
else1734:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:close-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6167 = icmp eq i64 %argc, 1
  br i1 %t6167, label %argok1736, label %arityerr1735
arityerr1735:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1736:
  %t6168 = load i64, ptr @"scheme.base:input-port?"
  %t6169 = and i64 %t6168, -8
  %t6170 = inttoptr i64 %t6169 to ptr
  %t6171 = load i64, ptr %t6170
  %t6172 = inttoptr i64 %t6171 to ptr
  %t6173 = call fastcc i64%t6172(i64 %t6168, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6174 = icmp ne i64 %t6173, 1
  br i1 %t6174, label %then1737, label %else1738
then1737:
  %t6175 = load i64, ptr @"scheme.base:close-port"
  %t6176 = and i64 %t6175, -8
  %t6177 = inttoptr i64 %t6176 to ptr
  %t6178 = load i64, ptr %t6177
  %t6179 = inttoptr i64 %t6178 to ptr
  %t6180 = musttail call fastcc i64 %t6179(i64 %t6175, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6180
else1738:
  %t6181 = call i64 @rt_intern(ptr @.str.sym.54)
  %t6182 = call i64 @rt_make_string(ptr @.str.lit.55, i64 17)
  %t6183 = load i64, ptr @"scheme.base:error"
  %t6184 = and i64 %t6183, -8
  %t6185 = inttoptr i64 %t6184 to ptr
  %t6186 = load i64, ptr %t6185
  %t6187 = inttoptr i64 %t6186 to ptr
  %t6188 = musttail call fastcc i64 %t6187(i64 %t6183, i64 3, i64 %t6181, i64 %t6182, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6188
}

define fastcc i64 @"scheme.base:code:close-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6193 = icmp eq i64 %argc, 1
  br i1 %t6193, label %argok1740, label %arityerr1739
arityerr1739:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1740:
  %t6194 = load i64, ptr @"scheme.base:output-port?"
  %t6195 = and i64 %t6194, -8
  %t6196 = inttoptr i64 %t6195 to ptr
  %t6197 = load i64, ptr %t6196
  %t6198 = inttoptr i64 %t6197 to ptr
  %t6199 = call fastcc i64%t6198(i64 %t6194, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6200 = icmp ne i64 %t6199, 1
  br i1 %t6200, label %then1741, label %else1742
then1741:
  %t6201 = load i64, ptr @"scheme.base:close-port"
  %t6202 = and i64 %t6201, -8
  %t6203 = inttoptr i64 %t6202 to ptr
  %t6204 = load i64, ptr %t6203
  %t6205 = inttoptr i64 %t6204 to ptr
  %t6206 = musttail call fastcc i64 %t6205(i64 %t6201, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6206
else1742:
  %t6207 = call i64 @rt_intern(ptr @.str.sym.56)
  %t6208 = call i64 @rt_make_string(ptr @.str.lit.57, i64 18)
  %t6209 = load i64, ptr @"scheme.base:error"
  %t6210 = and i64 %t6209, -8
  %t6211 = inttoptr i64 %t6210 to ptr
  %t6212 = load i64, ptr %t6211
  %t6213 = inttoptr i64 %t6212 to ptr
  %t6214 = musttail call fastcc i64 %t6213(i64 %t6209, i64 3, i64 %t6207, i64 %t6208, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6214
}

define fastcc i64 @"scheme.base:code:current-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6222 = icmp sge i64 %argc, 0
  br i1 %t6222, label %argok1744, label %arityerr1743
arityerr1743:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1744:
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
  br i1 %t6234, label %then1745, label %else1746
then1745:
  %t6235 = load i64, ptr @"scheme.base:%stdout-port"
  %t6236 = call i64 @rt_not(i64 %t6235)
  %t6237 = icmp ne i64 %t6236, 1
  br i1 %t6237, label %then1747, label %else1748
then1747:
  %t6238 = load i64, ptr @"scheme.base:%make-port"
  %t6239 = and i64 %t6238, -8
  %t6240 = inttoptr i64 %t6239 to ptr
  %t6241 = load i64, ptr %t6240
  %t6242 = inttoptr i64 %t6241 to ptr
  %t6243 = call fastcc i64%t6242(i64 %t6238, i64 6, i64 0, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t6244 = call i64 @rt_root(i64 %t6243)
  store i64 %t6244, ptr @"scheme.base:%stdout-port"
  %t6245 = call i64 @rt_set_current_output(i64 0)
  br label %merge1749
else1748:
  br label %merge1749
merge1749:
  %t6246 = phi i64 [ %t6245, %then1747 ], [ 17, %else1748 ]
  %t6247 = load i64, ptr @"scheme.base:%stdout-port"
  ret i64 %t6247
else1746:
  %t6248 = call i64 @rt_car(i64 %t6232)
  %t6249 = call i64 @rt_root(i64 %t6248)
  store i64 %t6249, ptr @"scheme.base:%stdout-port"
  %t6250 = call i64 @rt_record_ref(i64 %t6248, i64 0)
  %t6251 = call i64 @rt_set_current_output(i64 %t6250)
  %t6252 = icmp ne i64 1, 1
  br i1 %t6252, label %then1750, label %else1751
then1750:
  ret i64 1
else1751:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-error-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6257 = icmp sge i64 %argc, 0
  br i1 %t6257, label %argok1753, label %arityerr1752
arityerr1752:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1753:
  %t6258 = call ptr @rt_alloc_words(i64 8)
  %t6259 = getelementptr i64, ptr %t6258, i64 0
  store i64 %a0, ptr %t6259
  %t6260 = getelementptr i64, ptr %t6258, i64 1
  store i64 %a1, ptr %t6260
  %t6261 = getelementptr i64, ptr %t6258, i64 2
  store i64 %a2, ptr %t6261
  %t6262 = getelementptr i64, ptr %t6258, i64 3
  store i64 %a3, ptr %t6262
  %t6263 = getelementptr i64, ptr %t6258, i64 4
  store i64 %a4, ptr %t6263
  %t6264 = getelementptr i64, ptr %t6258, i64 5
  store i64 %a5, ptr %t6264
  %t6265 = getelementptr i64, ptr %t6258, i64 6
  store i64 %a6, ptr %t6265
  %t6266 = getelementptr i64, ptr %t6258, i64 7
  store i64 %a7, ptr %t6266
  %t6267 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t6258, ptr %overflow)
  %t6268 = call i64 @rt_null_p(i64 %t6267)
  %t6269 = icmp ne i64 %t6268, 1
  br i1 %t6269, label %then1754, label %else1755
then1754:
  %t6270 = load i64, ptr @"scheme.base:%stderr-port"
  %t6271 = call i64 @rt_not(i64 %t6270)
  %t6272 = icmp ne i64 %t6271, 1
  br i1 %t6272, label %then1756, label %else1757
then1756:
  %t6273 = load i64, ptr @"scheme.base:%make-port"
  %t6274 = and i64 %t6273, -8
  %t6275 = inttoptr i64 %t6274 to ptr
  %t6276 = load i64, ptr %t6275
  %t6277 = inttoptr i64 %t6276 to ptr
  %t6278 = call fastcc i64%t6277(i64 %t6273, i64 6, i64 8, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t6279 = call i64 @rt_root(i64 %t6278)
  store i64 %t6279, ptr @"scheme.base:%stderr-port"
  br label %merge1758
else1757:
  br label %merge1758
merge1758:
  %t6280 = phi i64 [ 17, %then1756 ], [ 17, %else1757 ]
  %t6281 = load i64, ptr @"scheme.base:%stderr-port"
  ret i64 %t6281
else1755:
  %t6282 = call i64 @rt_car(i64 %t6267)
  %t6283 = call i64 @rt_root(i64 %t6282)
  store i64 %t6283, ptr @"scheme.base:%stderr-port"
  %t6284 = icmp ne i64 1, 1
  br i1 %t6284, label %then1759, label %else1760
then1759:
  ret i64 1
else1760:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6289 = icmp sge i64 %argc, 0
  br i1 %t6289, label %argok1762, label %arityerr1761
arityerr1761:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1762:
  %t6290 = call ptr @rt_alloc_words(i64 8)
  %t6291 = getelementptr i64, ptr %t6290, i64 0
  store i64 %a0, ptr %t6291
  %t6292 = getelementptr i64, ptr %t6290, i64 1
  store i64 %a1, ptr %t6292
  %t6293 = getelementptr i64, ptr %t6290, i64 2
  store i64 %a2, ptr %t6293
  %t6294 = getelementptr i64, ptr %t6290, i64 3
  store i64 %a3, ptr %t6294
  %t6295 = getelementptr i64, ptr %t6290, i64 4
  store i64 %a4, ptr %t6295
  %t6296 = getelementptr i64, ptr %t6290, i64 5
  store i64 %a5, ptr %t6296
  %t6297 = getelementptr i64, ptr %t6290, i64 6
  store i64 %a6, ptr %t6297
  %t6298 = getelementptr i64, ptr %t6290, i64 7
  store i64 %a7, ptr %t6298
  %t6299 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t6290, ptr %overflow)
  %t6300 = call i64 @rt_null_p(i64 %t6299)
  %t6301 = icmp ne i64 %t6300, 1
  br i1 %t6301, label %then1763, label %else1764
then1763:
  %t6302 = load i64, ptr @"scheme.base:%stdin-port"
  %t6303 = call i64 @rt_not(i64 %t6302)
  %t6304 = icmp ne i64 %t6303, 1
  br i1 %t6304, label %then1765, label %else1766
then1765:
  %t6305 = load i64, ptr @"scheme.base:%make-port"
  %t6306 = and i64 %t6305, -8
  %t6307 = inttoptr i64 %t6306 to ptr
  %t6308 = load i64, ptr %t6307
  %t6309 = inttoptr i64 %t6308 to ptr
  %t6310 = call fastcc i64%t6309(i64 %t6305, i64 6, i64 1, i64 257, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t6311 = call i64 @rt_root(i64 %t6310)
  store i64 %t6311, ptr @"scheme.base:%stdin-port"
  br label %merge1767
else1766:
  br label %merge1767
merge1767:
  %t6312 = phi i64 [ 17, %then1765 ], [ 17, %else1766 ]
  %t6313 = load i64, ptr @"scheme.base:%stdin-port"
  ret i64 %t6313
else1764:
  %t6314 = call i64 @rt_car(i64 %t6299)
  %t6315 = call i64 @rt_root(i64 %t6314)
  store i64 %t6315, ptr @"scheme.base:%stdin-port"
  %t6316 = icmp ne i64 1, 1
  br i1 %t6316, label %then1768, label %else1769
then1768:
  ret i64 1
else1769:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_1372"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6321 = icmp eq i64 %argc, 0
  br i1 %t6321, label %argok1771, label %arityerr1770
arityerr1770:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1771:
  %t6322 = icmp ne i64 1, 1
  br i1 %t6322, label %then1772, label %else1773
then1772:
  ret i64 1
else1773:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_1374"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6323 = icmp eq i64 %argc, 0
  br i1 %t6323, label %argok1775, label %arityerr1774
arityerr1774:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1775:
  %t6324 = and i64 %self, -8
  %t6325 = inttoptr i64 %t6324 to ptr
  %t6326 = getelementptr i64, ptr %t6325, i64 2
  %t6327 = load i64, ptr %t6326
  %t6328 = and i64 %self, -8
  %t6329 = inttoptr i64 %t6328 to ptr
  %t6330 = getelementptr i64, ptr %t6329, i64 1
  %t6331 = load i64, ptr %t6330
  %t6332 = and i64 %t6331, -8
  %t6333 = inttoptr i64 %t6332 to ptr
  %t6334 = load i64, ptr %t6333
  %t6335 = inttoptr i64 %t6334 to ptr
  %t6336 = musttail call fastcc i64 %t6335(i64 %t6331, i64 1, i64 %t6327, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6336
}

define fastcc i64 @"scheme.base:code_1376"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6337 = icmp eq i64 %argc, 0
  br i1 %t6337, label %argok1777, label %arityerr1776
arityerr1776:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1777:
  %t6338 = and i64 %self, -8
  %t6339 = inttoptr i64 %t6338 to ptr
  %t6340 = getelementptr i64, ptr %t6339, i64 1
  %t6341 = load i64, ptr %t6340
  %t6342 = load i64, ptr @"scheme.base:close-port"
  %t6343 = and i64 %t6342, -8
  %t6344 = inttoptr i64 %t6343 to ptr
  %t6345 = load i64, ptr %t6344
  %t6346 = inttoptr i64 %t6345 to ptr
  %t6347 = musttail call fastcc i64 %t6346(i64 %t6342, i64 1, i64 %t6341, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6347
}

define fastcc i64 @"scheme.base:code:call-with-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6348 = icmp eq i64 %argc, 2
  br i1 %t6348, label %argok1779, label %arityerr1778
arityerr1778:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1779:
  %t6349 = call ptr @rt_alloc_words(i64 1)
  %t6350 = ptrtoint ptr %t6349 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1372" to i64), ptr %t6349
  %t6351 = or i64 %t6350, 4
  %t6352 = call ptr @rt_alloc_words(i64 3)
  %t6353 = ptrtoint ptr %t6352 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1374" to i64), ptr %t6352
  %t6354 = getelementptr i64, ptr %t6352, i64 1
  store i64 %a1, ptr %t6354
  %t6355 = getelementptr i64, ptr %t6352, i64 2
  store i64 %a0, ptr %t6355
  %t6356 = or i64 %t6353, 4
  %t6357 = call ptr @rt_alloc_words(i64 2)
  %t6358 = ptrtoint ptr %t6357 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1376" to i64), ptr %t6357
  %t6359 = getelementptr i64, ptr %t6357, i64 1
  store i64 %a0, ptr %t6359
  %t6360 = or i64 %t6358, 4
  %t6361 = load i64, ptr @"scheme.base:dynamic-wind"
  %t6362 = and i64 %t6361, -8
  %t6363 = inttoptr i64 %t6362 to ptr
  %t6364 = load i64, ptr %t6363
  %t6365 = inttoptr i64 %t6364 to ptr
  %t6366 = musttail call fastcc i64 %t6365(i64 %t6361, i64 3, i64 %t6351, i64 %t6356, i64 %t6360, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6366
}

define fastcc i64 @"scheme.base:code_1383"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6371 = icmp eq i64 %argc, 0
  br i1 %t6371, label %argok1781, label %arityerr1780
arityerr1780:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1781:
  %t6372 = and i64 %self, -8
  %t6373 = inttoptr i64 %t6372 to ptr
  %t6374 = getelementptr i64, ptr %t6373, i64 1
  %t6375 = load i64, ptr %t6374
  %t6376 = load i64, ptr @"scheme.base:current-output-port"
  %t6377 = and i64 %t6376, -8
  %t6378 = inttoptr i64 %t6377 to ptr
  %t6379 = load i64, ptr %t6378
  %t6380 = inttoptr i64 %t6379 to ptr
  %t6381 = musttail call fastcc i64 %t6380(i64 %t6376, i64 1, i64 %t6375, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6381
}

define fastcc i64 @"scheme.base:code_1385"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6382 = icmp eq i64 %argc, 0
  br i1 %t6382, label %argok1783, label %arityerr1782
arityerr1782:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1783:
  %t6383 = and i64 %self, -8
  %t6384 = inttoptr i64 %t6383 to ptr
  %t6385 = getelementptr i64, ptr %t6384, i64 1
  %t6386 = load i64, ptr %t6385
  %t6387 = load i64, ptr @"scheme.base:current-output-port"
  %t6388 = and i64 %t6387, -8
  %t6389 = inttoptr i64 %t6388 to ptr
  %t6390 = load i64, ptr %t6389
  %t6391 = inttoptr i64 %t6390 to ptr
  %t6392 = call fastcc i64%t6391(i64 %t6387, i64 2, i64 %t6386, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6393 = and i64 %self, -8
  %t6394 = inttoptr i64 %t6393 to ptr
  %t6395 = getelementptr i64, ptr %t6394, i64 2
  %t6396 = load i64, ptr %t6395
  %t6397 = load i64, ptr @"scheme.base:close-port"
  %t6398 = and i64 %t6397, -8
  %t6399 = inttoptr i64 %t6398 to ptr
  %t6400 = load i64, ptr %t6399
  %t6401 = inttoptr i64 %t6400 to ptr
  %t6402 = musttail call fastcc i64 %t6401(i64 %t6397, i64 1, i64 %t6396, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6402
}

define fastcc i64 @"scheme.base:code:with-output-to-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6403 = icmp eq i64 %argc, 2
  br i1 %t6403, label %argok1785, label %arityerr1784
arityerr1784:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1785:
  %t6404 = load i64, ptr @"scheme.base:open-output-file"
  %t6405 = and i64 %t6404, -8
  %t6406 = inttoptr i64 %t6405 to ptr
  %t6407 = load i64, ptr %t6406
  %t6408 = inttoptr i64 %t6407 to ptr
  %t6409 = call fastcc i64%t6408(i64 %t6404, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6410 = load i64, ptr @"scheme.base:current-output-port"
  %t6411 = and i64 %t6410, -8
  %t6412 = inttoptr i64 %t6411 to ptr
  %t6413 = load i64, ptr %t6412
  %t6414 = inttoptr i64 %t6413 to ptr
  %t6415 = call fastcc i64%t6414(i64 %t6410, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6416 = call ptr @rt_alloc_words(i64 2)
  %t6417 = ptrtoint ptr %t6416 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1383" to i64), ptr %t6416
  %t6418 = getelementptr i64, ptr %t6416, i64 1
  store i64 %t6409, ptr %t6418
  %t6419 = or i64 %t6417, 4
  %t6420 = call ptr @rt_alloc_words(i64 3)
  %t6421 = ptrtoint ptr %t6420 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1385" to i64), ptr %t6420
  %t6422 = getelementptr i64, ptr %t6420, i64 1
  store i64 %t6415, ptr %t6422
  %t6423 = getelementptr i64, ptr %t6420, i64 2
  store i64 %t6409, ptr %t6423
  %t6424 = or i64 %t6421, 4
  %t6425 = load i64, ptr @"scheme.base:dynamic-wind"
  %t6426 = and i64 %t6425, -8
  %t6427 = inttoptr i64 %t6426 to ptr
  %t6428 = load i64, ptr %t6427
  %t6429 = inttoptr i64 %t6428 to ptr
  %t6430 = musttail call fastcc i64 %t6429(i64 %t6425, i64 3, i64 %t6419, i64 %a1, i64 %t6424, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6430
}

define fastcc i64 @"scheme.base:code_1392"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6435 = icmp eq i64 %argc, 0
  br i1 %t6435, label %argok1787, label %arityerr1786
arityerr1786:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1787:
  %t6436 = and i64 %self, -8
  %t6437 = inttoptr i64 %t6436 to ptr
  %t6438 = getelementptr i64, ptr %t6437, i64 1
  %t6439 = load i64, ptr %t6438
  %t6440 = load i64, ptr @"scheme.base:current-input-port"
  %t6441 = and i64 %t6440, -8
  %t6442 = inttoptr i64 %t6441 to ptr
  %t6443 = load i64, ptr %t6442
  %t6444 = inttoptr i64 %t6443 to ptr
  %t6445 = musttail call fastcc i64 %t6444(i64 %t6440, i64 1, i64 %t6439, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6445
}

define fastcc i64 @"scheme.base:code_1394"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6446 = icmp eq i64 %argc, 0
  br i1 %t6446, label %argok1789, label %arityerr1788
arityerr1788:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1789:
  %t6447 = and i64 %self, -8
  %t6448 = inttoptr i64 %t6447 to ptr
  %t6449 = getelementptr i64, ptr %t6448, i64 1
  %t6450 = load i64, ptr %t6449
  %t6451 = load i64, ptr @"scheme.base:current-input-port"
  %t6452 = and i64 %t6451, -8
  %t6453 = inttoptr i64 %t6452 to ptr
  %t6454 = load i64, ptr %t6453
  %t6455 = inttoptr i64 %t6454 to ptr
  %t6456 = call fastcc i64%t6455(i64 %t6451, i64 2, i64 %t6450, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6457 = and i64 %self, -8
  %t6458 = inttoptr i64 %t6457 to ptr
  %t6459 = getelementptr i64, ptr %t6458, i64 2
  %t6460 = load i64, ptr %t6459
  %t6461 = load i64, ptr @"scheme.base:close-port"
  %t6462 = and i64 %t6461, -8
  %t6463 = inttoptr i64 %t6462 to ptr
  %t6464 = load i64, ptr %t6463
  %t6465 = inttoptr i64 %t6464 to ptr
  %t6466 = musttail call fastcc i64 %t6465(i64 %t6461, i64 1, i64 %t6460, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6466
}

define fastcc i64 @"scheme.base:code:with-input-from-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6467 = icmp eq i64 %argc, 2
  br i1 %t6467, label %argok1791, label %arityerr1790
arityerr1790:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1791:
  %t6468 = load i64, ptr @"scheme.base:open-input-file"
  %t6469 = and i64 %t6468, -8
  %t6470 = inttoptr i64 %t6469 to ptr
  %t6471 = load i64, ptr %t6470
  %t6472 = inttoptr i64 %t6471 to ptr
  %t6473 = call fastcc i64%t6472(i64 %t6468, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6474 = load i64, ptr @"scheme.base:current-input-port"
  %t6475 = and i64 %t6474, -8
  %t6476 = inttoptr i64 %t6475 to ptr
  %t6477 = load i64, ptr %t6476
  %t6478 = inttoptr i64 %t6477 to ptr
  %t6479 = call fastcc i64%t6478(i64 %t6474, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6480 = call ptr @rt_alloc_words(i64 2)
  %t6481 = ptrtoint ptr %t6480 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1392" to i64), ptr %t6480
  %t6482 = getelementptr i64, ptr %t6480, i64 1
  store i64 %t6473, ptr %t6482
  %t6483 = or i64 %t6481, 4
  %t6484 = call ptr @rt_alloc_words(i64 3)
  %t6485 = ptrtoint ptr %t6484 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1394" to i64), ptr %t6484
  %t6486 = getelementptr i64, ptr %t6484, i64 1
  store i64 %t6479, ptr %t6486
  %t6487 = getelementptr i64, ptr %t6484, i64 2
  store i64 %t6473, ptr %t6487
  %t6488 = or i64 %t6485, 4
  %t6489 = load i64, ptr @"scheme.base:dynamic-wind"
  %t6490 = and i64 %t6489, -8
  %t6491 = inttoptr i64 %t6490 to ptr
  %t6492 = load i64, ptr %t6491
  %t6493 = inttoptr i64 %t6492 to ptr
  %t6494 = musttail call fastcc i64 %t6493(i64 %t6489, i64 3, i64 %t6483, i64 %a1, i64 %t6488, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6494
}

define fastcc i64 @"scheme.base:code:call-with-output-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6499 = icmp eq i64 %argc, 2
  br i1 %t6499, label %argok1793, label %arityerr1792
arityerr1792:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1793:
  %t6500 = load i64, ptr @"scheme.base:open-output-file"
  %t6501 = and i64 %t6500, -8
  %t6502 = inttoptr i64 %t6501 to ptr
  %t6503 = load i64, ptr %t6502
  %t6504 = inttoptr i64 %t6503 to ptr
  %t6505 = call fastcc i64%t6504(i64 %t6500, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6506 = load i64, ptr @"scheme.base:call-with-port"
  %t6507 = and i64 %t6506, -8
  %t6508 = inttoptr i64 %t6507 to ptr
  %t6509 = load i64, ptr %t6508
  %t6510 = inttoptr i64 %t6509 to ptr
  %t6511 = musttail call fastcc i64 %t6510(i64 %t6506, i64 2, i64 %t6505, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6511
}

define fastcc i64 @"scheme.base:code:call-with-input-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6516 = icmp eq i64 %argc, 2
  br i1 %t6516, label %argok1795, label %arityerr1794
arityerr1794:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1795:
  %t6517 = load i64, ptr @"scheme.base:open-input-file"
  %t6518 = and i64 %t6517, -8
  %t6519 = inttoptr i64 %t6518 to ptr
  %t6520 = load i64, ptr %t6519
  %t6521 = inttoptr i64 %t6520 to ptr
  %t6522 = call fastcc i64%t6521(i64 %t6517, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6523 = load i64, ptr @"scheme.base:call-with-port"
  %t6524 = and i64 %t6523, -8
  %t6525 = inttoptr i64 %t6524 to ptr
  %t6526 = load i64, ptr %t6525
  %t6527 = inttoptr i64 %t6526 to ptr
  %t6528 = musttail call fastcc i64 %t6527(i64 %t6523, i64 2, i64 %t6522, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6528
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
  %t2308 = call ptr @rt_alloc_words(i64 1)
  %t2309 = ptrtoint ptr %t2308 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string->number" to i64), ptr %t2308
  %t2310 = or i64 %t2309, 4
  %t2311 = call i64 @rt_root(i64 %t2310)
  store i64 %t2311, ptr @"scheme.base:string->number"
  ret i64 17
}

define i64 @"scheme.base:__init_99"() {
entry:
  %t2345 = call ptr @rt_alloc_words(i64 1)
  %t2346 = ptrtoint ptr %t2345 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error" to i64), ptr %t2345
  %t2347 = or i64 %t2346, 4
  %t2348 = call i64 @rt_root(i64 %t2347)
  store i64 %t2348, ptr @"scheme.base:error"
  ret i64 17
}

define i64 @"scheme.base:__init_100"() {
entry:
  %t2349 = call i64 @rt_root(i64 2)
  store i64 %t2349, ptr @"scheme.base:*winds*"
  ret i64 17
}

define i64 @"scheme.base:__init_101"() {
entry:
  %t2350 = call i64 @rt_root(i64 2)
  store i64 %t2350, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define i64 @"scheme.base:__init_102"() {
entry:
  %t2375 = call ptr @rt_alloc_words(i64 1)
  %t2376 = ptrtoint ptr %t2375 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%unwind-to" to i64), ptr %t2375
  %t2377 = or i64 %t2376, 4
  %t2378 = call i64 @rt_root(i64 %t2377)
  store i64 %t2378, ptr @"scheme.base:%unwind-to"
  ret i64 17
}

define i64 @"scheme.base:__init_103"() {
entry:
  %t2402 = call ptr @rt_alloc_words(i64 1)
  %t2403 = ptrtoint ptr %t2402 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:dynamic-wind" to i64), ptr %t2402
  %t2404 = or i64 %t2403, 4
  %t2405 = call i64 @rt_root(i64 %t2404)
  store i64 %t2405, ptr @"scheme.base:dynamic-wind"
  ret i64 17
}

define i64 @"scheme.base:__init_104"() {
entry:
  %t2466 = call ptr @rt_alloc_words(i64 1)
  %t2467 = ptrtoint ptr %t2466 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-current-continuation" to i64), ptr %t2466
  %t2468 = or i64 %t2467, 4
  %t2469 = call i64 @rt_root(i64 %t2468)
  store i64 %t2469, ptr @"scheme.base:call-with-current-continuation"
  ret i64 17
}

define i64 @"scheme.base:__init_105"() {
entry:
  %t2477 = call ptr @rt_alloc_words(i64 1)
  %t2478 = ptrtoint ptr %t2477 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call/cc" to i64), ptr %t2477
  %t2479 = or i64 %t2478, 4
  %t2480 = call i64 @rt_root(i64 %t2479)
  store i64 %t2480, ptr @"scheme.base:call/cc"
  ret i64 17
}

define i64 @"scheme.base:__init_106"() {
entry:
  %t2515 = call ptr @rt_alloc_words(i64 1)
  %t2516 = ptrtoint ptr %t2515 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%with-handler" to i64), ptr %t2515
  %t2517 = or i64 %t2516, 4
  %t2518 = call i64 @rt_root(i64 %t2517)
  store i64 %t2518, ptr @"scheme.base:%with-handler"
  ret i64 17
}

define i64 @"scheme.base:__init_107"() {
entry:
  %t2537 = call ptr @rt_alloc_words(i64 1)
  %t2538 = ptrtoint ptr %t2537 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:raise" to i64), ptr %t2537
  %t2539 = or i64 %t2538, 4
  %t2540 = call i64 @rt_root(i64 %t2539)
  store i64 %t2540, ptr @"scheme.base:raise"
  ret i64 17
}

define i64 @"scheme.base:__init_108"() {
entry:
  %t2543 = call ptr @rt_alloc_words(i64 1)
  %t2544 = ptrtoint ptr %t2543 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object?" to i64), ptr %t2543
  %t2545 = or i64 %t2544, 4
  %t2546 = call i64 @rt_root(i64 %t2545)
  store i64 %t2546, ptr @"scheme.base:error-object?"
  ret i64 17
}

define i64 @"scheme.base:__init_109"() {
entry:
  %t2549 = call ptr @rt_alloc_words(i64 1)
  %t2550 = ptrtoint ptr %t2549 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-message" to i64), ptr %t2549
  %t2551 = or i64 %t2550, 4
  %t2552 = call i64 @rt_root(i64 %t2551)
  store i64 %t2552, ptr @"scheme.base:error-object-message"
  ret i64 17
}

define i64 @"scheme.base:__init_110"() {
entry:
  %t2555 = call ptr @rt_alloc_words(i64 1)
  %t2556 = ptrtoint ptr %t2555 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-irritants" to i64), ptr %t2555
  %t2557 = or i64 %t2556, 4
  %t2558 = call i64 @rt_root(i64 %t2557)
  store i64 %t2558, ptr @"scheme.base:error-object-irritants"
  ret i64 17
}

define i64 @"scheme.base:__init_111"() {
entry:
  %t2640 = call ptr @rt_alloc_words(i64 1)
  %t2641 = ptrtoint ptr %t2640 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-parameter" to i64), ptr %t2640
  %t2642 = or i64 %t2641, 4
  %t2643 = call i64 @rt_root(i64 %t2642)
  store i64 %t2643, ptr @"scheme.base:make-parameter"
  ret i64 17
}

define i64 @"scheme.base:__init_112"() {
entry:
  %t2724 = call ptr @rt_alloc_words(i64 1)
  %t2725 = ptrtoint ptr %t2724 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%with-parameters" to i64), ptr %t2724
  %t2726 = or i64 %t2725, 4
  %t2727 = call i64 @rt_root(i64 %t2726)
  store i64 %t2727, ptr @"scheme.base:%with-parameters"
  ret i64 17
}

define i64 @"scheme.base:__init_113"() {
entry:
  %t2765 = call ptr @rt_alloc_words(i64 1)
  %t2766 = ptrtoint ptr %t2765 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->vector" to i64), ptr %t2765
  %t2767 = or i64 %t2766, 4
  %t2768 = call i64 @rt_root(i64 %t2767)
  store i64 %t2768, ptr @"scheme.base:list->vector"
  ret i64 17
}

define i64 @"scheme.base:__init_114"() {
entry:
  %t2786 = call ptr @rt_alloc_words(i64 1)
  %t2787 = ptrtoint ptr %t2786 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector" to i64), ptr %t2786
  %t2788 = or i64 %t2787, 4
  %t2789 = call i64 @rt_root(i64 %t2788)
  store i64 %t2789, ptr @"scheme.base:vector"
  ret i64 17
}

define i64 @"scheme.base:__init_115"() {
entry:
  %t2827 = call ptr @rt_alloc_words(i64 1)
  %t2828 = ptrtoint ptr %t2827 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->bytevector" to i64), ptr %t2827
  %t2829 = or i64 %t2828, 4
  %t2830 = call i64 @rt_root(i64 %t2829)
  store i64 %t2830, ptr @"scheme.base:list->bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_116"() {
entry:
  %t2848 = call ptr @rt_alloc_words(i64 1)
  %t2849 = ptrtoint ptr %t2848 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector" to i64), ptr %t2848
  %t2850 = or i64 %t2849, 4
  %t2851 = call i64 @rt_root(i64 %t2850)
  store i64 %t2851, ptr @"scheme.base:bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_117"() {
entry:
  %t2871 = call ptr @rt_alloc_words(i64 1)
  %t2872 = ptrtoint ptr %t2871 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:values" to i64), ptr %t2871
  %t2873 = or i64 %t2872, 4
  %t2874 = call i64 @rt_root(i64 %t2873)
  store i64 %t2874, ptr @"scheme.base:values"
  ret i64 17
}

define i64 @"scheme.base:__init_118"() {
entry:
  %t2916 = call ptr @rt_alloc_words(i64 1)
  %t2917 = ptrtoint ptr %t2916 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-values" to i64), ptr %t2916
  %t2918 = or i64 %t2917, 4
  %t2919 = call i64 @rt_root(i64 %t2918)
  store i64 %t2919, ptr @"scheme.base:call-with-values"
  ret i64 17
}

define i64 @"scheme.base:__init_119"() {
entry:
  %t2920 = call i64 @rt_root(i64 64)
  store i64 %t2920, ptr @"scheme.base:%ht-initial-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_120"() {
entry:
  %t2921 = call i64 @rt_root(i64 24)
  store i64 %t2921, ptr @"scheme.base:%ht-load-factor"
  ret i64 17
}

define i64 @"scheme.base:__init_121"() {
entry:
  %t2932 = call ptr @rt_alloc_words(i64 1)
  %t2933 = ptrtoint ptr %t2932 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-hash-table" to i64), ptr %t2932
  %t2934 = or i64 %t2933, 4
  %t2935 = call i64 @rt_root(i64 %t2934)
  store i64 %t2935, ptr @"scheme.base:make-hash-table"
  ret i64 17
}

define i64 @"scheme.base:__init_122"() {
entry:
  %t2938 = call ptr @rt_alloc_words(i64 1)
  %t2939 = ptrtoint ptr %t2938 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table?" to i64), ptr %t2938
  %t2940 = or i64 %t2939, 4
  %t2941 = call i64 @rt_root(i64 %t2940)
  store i64 %t2941, ptr @"scheme.base:hash-table?"
  ret i64 17
}

define i64 @"scheme.base:__init_123"() {
entry:
  %t2945 = call ptr @rt_alloc_words(i64 1)
  %t2946 = ptrtoint ptr %t2945 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-count" to i64), ptr %t2945
  %t2947 = or i64 %t2946, 4
  %t2948 = call i64 @rt_root(i64 %t2947)
  store i64 %t2948, ptr @"scheme.base:%ht-count"
  ret i64 17
}

define i64 @"scheme.base:__init_124"() {
entry:
  %t2952 = call ptr @rt_alloc_words(i64 1)
  %t2953 = ptrtoint ptr %t2952 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-buckets" to i64), ptr %t2952
  %t2954 = or i64 %t2953, 4
  %t2955 = call i64 @rt_root(i64 %t2954)
  store i64 %t2955, ptr @"scheme.base:%ht-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_125"() {
entry:
  %t2959 = call ptr @rt_alloc_words(i64 1)
  %t2960 = ptrtoint ptr %t2959 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-count!" to i64), ptr %t2959
  %t2961 = or i64 %t2960, 4
  %t2962 = call i64 @rt_root(i64 %t2961)
  store i64 %t2962, ptr @"scheme.base:%ht-set-count!"
  ret i64 17
}

define i64 @"scheme.base:__init_126"() {
entry:
  %t2966 = call ptr @rt_alloc_words(i64 1)
  %t2967 = ptrtoint ptr %t2966 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-buckets!" to i64), ptr %t2966
  %t2968 = or i64 %t2967, 4
  %t2969 = call i64 @rt_root(i64 %t2968)
  store i64 %t2969, ptr @"scheme.base:%ht-set-buckets!"
  ret i64 17
}

define i64 @"scheme.base:__init_127"() {
entry:
  %t2973 = call ptr @rt_alloc_words(i64 1)
  %t2974 = ptrtoint ptr %t2973 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-index" to i64), ptr %t2973
  %t2975 = or i64 %t2974, 4
  %t2976 = call i64 @rt_root(i64 %t2975)
  store i64 %t2976, ptr @"scheme.base:%ht-index"
  ret i64 17
}

define i64 @"scheme.base:__init_128"() {
entry:
  %t2992 = call ptr @rt_alloc_words(i64 1)
  %t2993 = ptrtoint ptr %t2992 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-assoc" to i64), ptr %t2992
  %t2994 = or i64 %t2993, 4
  %t2995 = call i64 @rt_root(i64 %t2994)
  store i64 %t2995, ptr @"scheme.base:%ht-assoc"
  ret i64 17
}

define i64 @"scheme.base:__init_129"() {
entry:
  %t3013 = call ptr @rt_alloc_words(i64 1)
  %t3014 = ptrtoint ptr %t3013 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-remove" to i64), ptr %t3013
  %t3015 = or i64 %t3014, 4
  %t3016 = call i64 @rt_root(i64 %t3015)
  store i64 %t3016, ptr @"scheme.base:%ht-remove"
  ret i64 17
}

define i64 @"scheme.base:__init_130"() {
entry:
  %t3040 = call ptr @rt_alloc_words(i64 1)
  %t3041 = ptrtoint ptr %t3040 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref/default" to i64), ptr %t3040
  %t3042 = or i64 %t3041, 4
  %t3043 = call i64 @rt_root(i64 %t3042)
  store i64 %t3043, ptr @"scheme.base:hash-table-ref/default"
  ret i64 17
}

define i64 @"scheme.base:__init_131"() {
entry:
  %t3066 = call ptr @rt_alloc_words(i64 1)
  %t3067 = ptrtoint ptr %t3066 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-contains?" to i64), ptr %t3066
  %t3068 = or i64 %t3067, 4
  %t3069 = call i64 @rt_root(i64 %t3068)
  store i64 %t3069, ptr @"scheme.base:hash-table-contains?"
  ret i64 17
}

define i64 @"scheme.base:__init_132"() {
entry:
  %t3100 = call ptr @rt_alloc_words(i64 1)
  %t3101 = ptrtoint ptr %t3100 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref" to i64), ptr %t3100
  %t3102 = or i64 %t3101, 4
  %t3103 = call i64 @rt_root(i64 %t3102)
  store i64 %t3103, ptr @"scheme.base:hash-table-ref"
  ret i64 17
}

define i64 @"scheme.base:__init_133"() {
entry:
  %t3187 = call ptr @rt_alloc_words(i64 1)
  %t3188 = ptrtoint ptr %t3187 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-set!" to i64), ptr %t3187
  %t3189 = or i64 %t3188, 4
  %t3190 = call i64 @rt_root(i64 %t3189)
  store i64 %t3190, ptr @"scheme.base:hash-table-set!"
  ret i64 17
}

define i64 @"scheme.base:__init_134"() {
entry:
  %t3240 = call ptr @rt_alloc_words(i64 1)
  %t3241 = ptrtoint ptr %t3240 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-delete!" to i64), ptr %t3240
  %t3242 = or i64 %t3241, 4
  %t3243 = call i64 @rt_root(i64 %t3242)
  store i64 %t3243, ptr @"scheme.base:hash-table-delete!"
  ret i64 17
}

define i64 @"scheme.base:__init_135"() {
entry:
  %t3347 = call ptr @rt_alloc_words(i64 1)
  %t3348 = ptrtoint ptr %t3347 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-grow!" to i64), ptr %t3347
  %t3349 = or i64 %t3348, 4
  %t3350 = call i64 @rt_root(i64 %t3349)
  store i64 %t3350, ptr @"scheme.base:%ht-grow!"
  ret i64 17
}

define i64 @"scheme.base:__init_136"() {
entry:
  %t3358 = call ptr @rt_alloc_words(i64 1)
  %t3359 = ptrtoint ptr %t3358 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-size" to i64), ptr %t3358
  %t3360 = or i64 %t3359, 4
  %t3361 = call i64 @rt_root(i64 %t3360)
  store i64 %t3361, ptr @"scheme.base:hash-table-size"
  ret i64 17
}

define i64 @"scheme.base:__init_137"() {
entry:
  %t3378 = call ptr @rt_alloc_words(i64 1)
  %t3379 = ptrtoint ptr %t3378 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-fold-buckets" to i64), ptr %t3378
  %t3380 = or i64 %t3379, 4
  %t3381 = call i64 @rt_root(i64 %t3380)
  store i64 %t3381, ptr @"scheme.base:%ht-fold-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_138"() {
entry:
  %t3429 = call ptr @rt_alloc_words(i64 1)
  %t3430 = ptrtoint ptr %t3429 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table->alist" to i64), ptr %t3429
  %t3431 = or i64 %t3430, 4
  %t3432 = call i64 @rt_root(i64 %t3431)
  store i64 %t3432, ptr @"scheme.base:hash-table->alist"
  ret i64 17
}

define i64 @"scheme.base:__init_139"() {
entry:
  %t3451 = call ptr @rt_alloc_words(i64 1)
  %t3452 = ptrtoint ptr %t3451 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-keys" to i64), ptr %t3451
  %t3453 = or i64 %t3452, 4
  %t3454 = call i64 @rt_root(i64 %t3453)
  store i64 %t3454, ptr @"scheme.base:hash-table-keys"
  ret i64 17
}

define i64 @"scheme.base:__init_140"() {
entry:
  %t3473 = call ptr @rt_alloc_words(i64 1)
  %t3474 = ptrtoint ptr %t3473 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-values" to i64), ptr %t3473
  %t3475 = or i64 %t3474, 4
  %t3476 = call i64 @rt_root(i64 %t3475)
  store i64 %t3476, ptr @"scheme.base:hash-table-values"
  ret i64 17
}

define i64 @"scheme.base:__init_141"() {
entry:
  %t3510 = call ptr @rt_alloc_words(i64 1)
  %t3511 = ptrtoint ptr %t3510 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-ws?" to i64), ptr %t3510
  %t3512 = or i64 %t3511, 4
  %t3513 = call i64 @rt_root(i64 %t3512)
  store i64 %t3513, ptr @"scheme.base:rd-ws?"
  ret i64 17
}

define i64 @"scheme.base:__init_142"() {
entry:
  %t3531 = call ptr @rt_alloc_words(i64 1)
  %t3532 = ptrtoint ptr %t3531 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-digit?" to i64), ptr %t3531
  %t3533 = or i64 %t3532, 4
  %t3534 = call i64 @rt_root(i64 %t3533)
  store i64 %t3534, ptr @"scheme.base:rd-digit?"
  ret i64 17
}

define i64 @"scheme.base:__init_143"() {
entry:
  %t3591 = call ptr @rt_alloc_words(i64 1)
  %t3592 = ptrtoint ptr %t3591 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-delim?" to i64), ptr %t3591
  %t3593 = or i64 %t3592, 4
  %t3594 = call i64 @rt_root(i64 %t3593)
  store i64 %t3594, ptr @"scheme.base:rd-delim?"
  ret i64 17
}

define i64 @"scheme.base:__init_144"() {
entry:
  %t3636 = call ptr @rt_alloc_words(i64 1)
  %t3637 = ptrtoint ptr %t3636 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-skip-line" to i64), ptr %t3636
  %t3638 = or i64 %t3637, 4
  %t3639 = call i64 @rt_root(i64 %t3638)
  store i64 %t3639, ptr @"scheme.base:rd-skip-line"
  ret i64 17
}

define i64 @"scheme.base:__init_145"() {
entry:
  %t3700 = call ptr @rt_alloc_words(i64 1)
  %t3701 = ptrtoint ptr %t3700 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-skip-ws" to i64), ptr %t3700
  %t3702 = or i64 %t3701, 4
  %t3703 = call i64 @rt_root(i64 %t3702)
  store i64 %t3703, ptr @"scheme.base:rd-skip-ws"
  ret i64 17
}

define i64 @"scheme.base:__init_146"() {
entry:
  %t3735 = call ptr @rt_alloc_words(i64 1)
  %t3736 = ptrtoint ptr %t3735 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-token-end" to i64), ptr %t3735
  %t3737 = or i64 %t3736, 4
  %t3738 = call i64 @rt_root(i64 %t3737)
  store i64 %t3738, ptr @"scheme.base:rd-token-end"
  ret i64 17
}

define i64 @"scheme.base:__init_147"() {
entry:
  %t3770 = call ptr @rt_alloc_words(i64 1)
  %t3771 = ptrtoint ptr %t3770 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-all-digits?" to i64), ptr %t3770
  %t3772 = or i64 %t3771, 4
  %t3773 = call i64 @rt_root(i64 %t3772)
  store i64 %t3773, ptr @"scheme.base:rd-all-digits?"
  ret i64 17
}

define i64 @"scheme.base:__init_148"() {
entry:
  %t3831 = call ptr @rt_alloc_words(i64 1)
  %t3832 = ptrtoint ptr %t3831 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-numeric?" to i64), ptr %t3831
  %t3833 = or i64 %t3832, 4
  %t3834 = call i64 @rt_root(i64 %t3833)
  store i64 %t3834, ptr @"scheme.base:rd-numeric?"
  ret i64 17
}

define i64 @"scheme.base:__init_149"() {
entry:
  %t3885 = call ptr @rt_alloc_words(i64 1)
  %t3886 = ptrtoint ptr %t3885 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-digits" to i64), ptr %t3885
  %t3887 = or i64 %t3886, 4
  %t3888 = call i64 @rt_root(i64 %t3887)
  store i64 %t3888, ptr @"scheme.base:rd-digits"
  ret i64 17
}

define i64 @"scheme.base:__init_150"() {
entry:
  %t3939 = call ptr @rt_alloc_words(i64 1)
  %t3940 = ptrtoint ptr %t3939 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-digits-neg" to i64), ptr %t3939
  %t3941 = or i64 %t3940, 4
  %t3942 = call i64 @rt_root(i64 %t3941)
  store i64 %t3942, ptr @"scheme.base:rd-digits-neg"
  ret i64 17
}

define i64 @"scheme.base:__init_151"() {
entry:
  %t3981 = call ptr @rt_alloc_words(i64 1)
  %t3982 = ptrtoint ptr %t3981 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-parse-int" to i64), ptr %t3981
  %t3983 = or i64 %t3982, 4
  %t3984 = call i64 @rt_root(i64 %t3983)
  store i64 %t3984, ptr @"scheme.base:rd-parse-int"
  ret i64 17
}

define i64 @"scheme.base:__init_152"() {
entry:
  %t3994 = call ptr @rt_alloc_words(i64 1)
  %t3995 = ptrtoint ptr %t3994 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-dotchar?" to i64), ptr %t3994
  %t3996 = or i64 %t3995, 4
  %t3997 = call i64 @rt_root(i64 %t3996)
  store i64 %t3997, ptr @"scheme.base:rd-dotchar?"
  ret i64 17
}

define i64 @"scheme.base:__init_153"() {
entry:
  %t4015 = call ptr @rt_alloc_words(i64 1)
  %t4016 = ptrtoint ptr %t4015 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-exp-char?" to i64), ptr %t4015
  %t4017 = or i64 %t4016, 4
  %t4018 = call i64 @rt_root(i64 %t4017)
  store i64 %t4018, ptr @"scheme.base:rd-exp-char?"
  ret i64 17
}

define i64 @"scheme.base:__init_154"() {
entry:
  %t4036 = call ptr @rt_alloc_words(i64 1)
  %t4037 = ptrtoint ptr %t4036 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-sign-char?" to i64), ptr %t4036
  %t4038 = or i64 %t4037, 4
  %t4039 = call i64 @rt_root(i64 %t4038)
  store i64 %t4039, ptr @"scheme.base:rd-sign-char?"
  ret i64 17
}

define i64 @"scheme.base:__init_155"() {
entry:
  %t4072 = call ptr @rt_alloc_words(i64 1)
  %t4073 = ptrtoint ptr %t4072 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-scan-digits" to i64), ptr %t4072
  %t4074 = or i64 %t4073, 4
  %t4075 = call i64 @rt_root(i64 %t4074)
  store i64 %t4075, ptr @"scheme.base:rd-scan-digits"
  ret i64 17
}

define i64 @"scheme.base:__init_156"() {
entry:
  %t4264 = call ptr @rt_alloc_words(i64 1)
  %t4265 = ptrtoint ptr %t4264 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-flonum?" to i64), ptr %t4264
  %t4266 = or i64 %t4265, 4
  %t4267 = call i64 @rt_root(i64 %t4266)
  store i64 %t4267, ptr @"scheme.base:rd-flonum?"
  ret i64 17
}

define i64 @"scheme.base:__init_157"() {
entry:
  %t4284 = call ptr @rt_alloc_words(i64 1)
  %t4285 = ptrtoint ptr %t4284 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-nonfinite" to i64), ptr %t4284
  %t4286 = or i64 %t4285, 4
  %t4287 = call i64 @rt_root(i64 %t4286)
  store i64 %t4287, ptr @"scheme.base:rd-nonfinite"
  ret i64 17
}

define i64 @"scheme.base:__init_158"() {
entry:
  %t4329 = call ptr @rt_alloc_words(i64 1)
  %t4330 = ptrtoint ptr %t4329 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-atom" to i64), ptr %t4329
  %t4331 = or i64 %t4330, 4
  %t4332 = call i64 @rt_root(i64 %t4331)
  store i64 %t4332, ptr @"scheme.base:rd-atom"
  ret i64 17
}

define i64 @"scheme.base:__init_159"() {
entry:
  %t4410 = call ptr @rt_alloc_words(i64 1)
  %t4411 = ptrtoint ptr %t4410 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-hex-digit" to i64), ptr %t4410
  %t4412 = or i64 %t4411, 4
  %t4413 = call i64 @rt_root(i64 %t4412)
  store i64 %t4413, ptr @"scheme.base:rd-hex-digit"
  ret i64 17
}

define i64 @"scheme.base:__init_160"() {
entry:
  %t4481 = call ptr @rt_alloc_words(i64 1)
  %t4482 = ptrtoint ptr %t4481 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-hex" to i64), ptr %t4481
  %t4483 = or i64 %t4482, 4
  %t4484 = call i64 @rt_root(i64 %t4483)
  store i64 %t4484, ptr @"scheme.base:rd-hex"
  ret i64 17
}

define i64 @"scheme.base:__init_161"() {
entry:
  %t4514 = call ptr @rt_alloc_words(i64 1)
  %t4515 = ptrtoint ptr %t4514 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-str-esc" to i64), ptr %t4514
  %t4516 = or i64 %t4515, 4
  %t4517 = call i64 @rt_root(i64 %t4516)
  store i64 %t4517, ptr @"scheme.base:rd-str-esc"
  ret i64 17
}

define i64 @"scheme.base:__init_162"() {
entry:
  %t4660 = call ptr @rt_alloc_words(i64 1)
  %t4661 = ptrtoint ptr %t4660 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-string" to i64), ptr %t4660
  %t4662 = or i64 %t4661, 4
  %t4663 = call i64 @rt_root(i64 %t4662)
  store i64 %t4663, ptr @"scheme.base:rd-string"
  ret i64 17
}

define i64 @"scheme.base:__init_163"() {
entry:
  %t4841 = call ptr @rt_alloc_words(i64 1)
  %t4842 = ptrtoint ptr %t4841 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-hash" to i64), ptr %t4841
  %t4843 = or i64 %t4842, 4
  %t4844 = call i64 @rt_root(i64 %t4843)
  store i64 %t4844, ptr @"scheme.base:rd-hash"
  ret i64 17
}

define i64 @"scheme.base:__init_164"() {
entry:
  %t4883 = call ptr @rt_alloc_words(i64 1)
  %t4884 = ptrtoint ptr %t4883 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-char-name" to i64), ptr %t4883
  %t4885 = or i64 %t4884, 4
  %t4886 = call i64 @rt_root(i64 %t4885)
  store i64 %t4886, ptr @"scheme.base:rd-char-name"
  ret i64 17
}

define i64 @"scheme.base:__init_165"() {
entry:
  %t4929 = call ptr @rt_alloc_words(i64 1)
  %t4930 = ptrtoint ptr %t4929 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-char" to i64), ptr %t4929
  %t4931 = or i64 %t4930, 4
  %t4932 = call i64 @rt_root(i64 %t4931)
  store i64 %t4932, ptr @"scheme.base:rd-char"
  ret i64 17
}

define i64 @"scheme.base:__init_166"() {
entry:
  %t4956 = call ptr @rt_alloc_words(i64 1)
  %t4957 = ptrtoint ptr %t4956 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-quote" to i64), ptr %t4956
  %t4958 = or i64 %t4957, 4
  %t4959 = call i64 @rt_root(i64 %t4958)
  store i64 %t4959, ptr @"scheme.base:rd-quote"
  ret i64 17
}

define i64 @"scheme.base:__init_167"() {
entry:
  %t4983 = call ptr @rt_alloc_words(i64 1)
  %t4984 = ptrtoint ptr %t4983 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-quasi" to i64), ptr %t4983
  %t4985 = or i64 %t4984, 4
  %t4986 = call i64 @rt_root(i64 %t4985)
  store i64 %t4986, ptr @"scheme.base:rd-quasi"
  ret i64 17
}

define i64 @"scheme.base:__init_168"() {
entry:
  %t5059 = call ptr @rt_alloc_words(i64 1)
  %t5060 = ptrtoint ptr %t5059 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-unquote" to i64), ptr %t5059
  %t5061 = or i64 %t5060, 4
  %t5062 = call i64 @rt_root(i64 %t5061)
  store i64 %t5062, ptr @"scheme.base:rd-unquote"
  ret i64 17
}

define i64 @"scheme.base:__init_169"() {
entry:
  %t5103 = call ptr @rt_alloc_words(i64 1)
  %t5104 = ptrtoint ptr %t5103 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-dot?" to i64), ptr %t5103
  %t5105 = or i64 %t5104, 4
  %t5106 = call i64 @rt_root(i64 %t5105)
  store i64 %t5106, ptr @"scheme.base:rd-dot?"
  ret i64 17
}

define i64 @"scheme.base:__init_170"() {
entry:
  %t5119 = call ptr @rt_alloc_words(i64 1)
  %t5120 = ptrtoint ptr %t5119 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-append-reverse" to i64), ptr %t5119
  %t5121 = or i64 %t5120, 4
  %t5122 = call i64 @rt_root(i64 %t5121)
  store i64 %t5122, ptr @"scheme.base:rd-append-reverse"
  ret i64 17
}

define i64 @"scheme.base:__init_171"() {
entry:
  %t5244 = call ptr @rt_alloc_words(i64 1)
  %t5245 = ptrtoint ptr %t5244 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-list" to i64), ptr %t5244
  %t5246 = or i64 %t5245, 4
  %t5247 = call i64 @rt_root(i64 %t5246)
  store i64 %t5247, ptr @"scheme.base:rd-list"
  ret i64 17
}

define i64 @"scheme.base:__init_172"() {
entry:
  %t5411 = call ptr @rt_alloc_words(i64 1)
  %t5412 = ptrtoint ptr %t5411 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-datum" to i64), ptr %t5411
  %t5413 = or i64 %t5412, 4
  %t5414 = call i64 @rt_root(i64 %t5413)
  store i64 %t5414, ptr @"scheme.base:rd-datum"
  ret i64 17
}

define i64 @"scheme.base:__init_173"() {
entry:
  %t5430 = call ptr @rt_alloc_words(i64 1)
  %t5431 = ptrtoint ptr %t5430 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-from-string" to i64), ptr %t5430
  %t5432 = or i64 %t5431, 4
  %t5433 = call i64 @rt_root(i64 %t5432)
  store i64 %t5433, ptr @"scheme.base:read-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_174"() {
entry:
  %t5500 = call ptr @rt_alloc_words(i64 1)
  %t5501 = ptrtoint ptr %t5500 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-all-from-string" to i64), ptr %t5500
  %t5502 = or i64 %t5501, 4
  %t5503 = call i64 @rt_root(i64 %t5502)
  store i64 %t5503, ptr @"scheme.base:read-all-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_175"() {
entry:
  %t5504 = call i64 @rt_root(i64 1)
  store i64 %t5504, ptr @"scheme.base:%port-rtd-cell"
  ret i64 17
}

define i64 @"scheme.base:__init_176"() {
entry:
  %t5513 = call ptr @rt_alloc_words(i64 1)
  %t5514 = ptrtoint ptr %t5513 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%port-rtd" to i64), ptr %t5513
  %t5515 = or i64 %t5514, 4
  %t5516 = call i64 @rt_root(i64 %t5515)
  store i64 %t5516, ptr @"scheme.base:%port-rtd"
  ret i64 17
}

define i64 @"scheme.base:__init_177"() {
entry:
  %t5531 = call ptr @rt_alloc_words(i64 1)
  %t5532 = ptrtoint ptr %t5531 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%make-port" to i64), ptr %t5531
  %t5533 = or i64 %t5532, 4
  %t5534 = call i64 @rt_root(i64 %t5533)
  store i64 %t5534, ptr @"scheme.base:%make-port"
  ret i64 17
}

define i64 @"scheme.base:__init_178"() {
entry:
  %t5543 = call ptr @rt_alloc_words(i64 1)
  %t5544 = ptrtoint ptr %t5543 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port?" to i64), ptr %t5543
  %t5545 = or i64 %t5544, 4
  %t5546 = call i64 @rt_root(i64 %t5545)
  store i64 %t5546, ptr @"scheme.base:port?"
  ret i64 17
}

define i64 @"scheme.base:__init_179"() {
entry:
  %t5556 = call ptr @rt_alloc_words(i64 1)
  %t5557 = ptrtoint ptr %t5556 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port?" to i64), ptr %t5556
  %t5558 = or i64 %t5557, 4
  %t5559 = call i64 @rt_root(i64 %t5558)
  store i64 %t5559, ptr @"scheme.base:input-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_180"() {
entry:
  %t5570 = call ptr @rt_alloc_words(i64 1)
  %t5571 = ptrtoint ptr %t5570 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port?" to i64), ptr %t5570
  %t5572 = or i64 %t5571, 4
  %t5573 = call i64 @rt_root(i64 %t5572)
  store i64 %t5573, ptr @"scheme.base:output-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_181"() {
entry:
  %t5581 = call ptr @rt_alloc_words(i64 1)
  %t5582 = ptrtoint ptr %t5581 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:textual-port?" to i64), ptr %t5581
  %t5583 = or i64 %t5582, 4
  %t5584 = call i64 @rt_root(i64 %t5583)
  store i64 %t5584, ptr @"scheme.base:textual-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_182"() {
entry:
  %t5587 = call ptr @rt_alloc_words(i64 1)
  %t5588 = ptrtoint ptr %t5587 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port-closed?" to i64), ptr %t5587
  %t5589 = or i64 %t5588, 4
  %t5590 = call i64 @rt_root(i64 %t5589)
  store i64 %t5590, ptr @"scheme.base:port-closed?"
  ret i64 17
}

define i64 @"scheme.base:__init_183"() {
entry:
  %t5601 = call ptr @rt_alloc_words(i64 1)
  %t5602 = ptrtoint ptr %t5601 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port-open?" to i64), ptr %t5601
  %t5603 = or i64 %t5602, 4
  %t5604 = call i64 @rt_root(i64 %t5603)
  store i64 %t5604, ptr @"scheme.base:input-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_184"() {
entry:
  %t5615 = call ptr @rt_alloc_words(i64 1)
  %t5616 = ptrtoint ptr %t5615 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port-open?" to i64), ptr %t5615
  %t5617 = or i64 %t5616, 4
  %t5618 = call i64 @rt_root(i64 %t5617)
  store i64 %t5618, ptr @"scheme.base:output-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_185"() {
entry:
  %t5644 = call ptr @rt_alloc_words(i64 1)
  %t5645 = ptrtoint ptr %t5644 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-input-port" to i64), ptr %t5644
  %t5646 = or i64 %t5645, 4
  %t5647 = call i64 @rt_root(i64 %t5646)
  store i64 %t5647, ptr @"scheme.base:%check-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_186"() {
entry:
  %t5673 = call ptr @rt_alloc_words(i64 1)
  %t5674 = ptrtoint ptr %t5673 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-output-port" to i64), ptr %t5673
  %t5675 = or i64 %t5674, 4
  %t5676 = call i64 @rt_root(i64 %t5675)
  store i64 %t5676, ptr @"scheme.base:%check-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_187"() {
entry:
  %t5682 = call ptr @rt_alloc_words(i64 1)
  %t5683 = ptrtoint ptr %t5682 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%port-buf" to i64), ptr %t5682
  %t5684 = or i64 %t5683, 4
  %t5685 = call i64 @rt_root(i64 %t5684)
  store i64 %t5685, ptr @"scheme.base:%port-buf"
  ret i64 17
}

define i64 @"scheme.base:__init_188"() {
entry:
  %t5693 = call ptr @rt_alloc_words(i64 1)
  %t5694 = ptrtoint ptr %t5693 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-input-string" to i64), ptr %t5693
  %t5695 = or i64 %t5694, 4
  %t5696 = call i64 @rt_root(i64 %t5695)
  store i64 %t5696, ptr @"scheme.base:open-input-string"
  ret i64 17
}

define i64 @"scheme.base:__init_189"() {
entry:
  %t5714 = call ptr @rt_alloc_words(i64 1)
  %t5715 = ptrtoint ptr %t5714 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-input-file" to i64), ptr %t5714
  %t5716 = or i64 %t5715, 4
  %t5717 = call i64 @rt_root(i64 %t5716)
  store i64 %t5717, ptr @"scheme.base:open-input-file"
  ret i64 17
}

define i64 @"scheme.base:__init_190"() {
entry:
  %t5742 = call ptr @rt_alloc_words(i64 1)
  %t5743 = ptrtoint ptr %t5742 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%port-at-eof?" to i64), ptr %t5742
  %t5744 = or i64 %t5743, 4
  %t5745 = call i64 @rt_root(i64 %t5744)
  store i64 %t5745, ptr @"scheme.base:%port-at-eof?"
  ret i64 17
}

define i64 @"scheme.base:__init_191"() {
entry:
  %t5779 = call ptr @rt_alloc_words(i64 1)
  %t5780 = ptrtoint ptr %t5779 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-char" to i64), ptr %t5779
  %t5781 = or i64 %t5780, 4
  %t5782 = call i64 @rt_root(i64 %t5781)
  store i64 %t5782, ptr @"scheme.base:read-char"
  ret i64 17
}

define i64 @"scheme.base:__init_192"() {
entry:
  %t5807 = call ptr @rt_alloc_words(i64 1)
  %t5808 = ptrtoint ptr %t5807 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:peek-char" to i64), ptr %t5807
  %t5809 = or i64 %t5808, 4
  %t5810 = call i64 @rt_root(i64 %t5809)
  store i64 %t5810, ptr @"scheme.base:peek-char"
  ret i64 17
}

define i64 @"scheme.base:__init_193"() {
entry:
  %t5932 = call ptr @rt_alloc_words(i64 1)
  %t5933 = ptrtoint ptr %t5932 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-line" to i64), ptr %t5932
  %t5934 = or i64 %t5933, 4
  %t5935 = call i64 @rt_root(i64 %t5934)
  store i64 %t5935, ptr @"scheme.base:read-line"
  ret i64 17
}

define i64 @"scheme.base:__init_194"() {
entry:
  %t5987 = call ptr @rt_alloc_words(i64 1)
  %t5988 = ptrtoint ptr %t5987 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-string" to i64), ptr %t5987
  %t5989 = or i64 %t5988, 4
  %t5990 = call i64 @rt_root(i64 %t5989)
  store i64 %t5990, ptr @"scheme.base:read-string"
  ret i64 17
}

define i64 @"scheme.base:__init_195"() {
entry:
  %t6041 = call ptr @rt_alloc_words(i64 1)
  %t6042 = ptrtoint ptr %t6041 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read" to i64), ptr %t6041
  %t6043 = or i64 %t6042, 4
  %t6044 = call i64 @rt_root(i64 %t6043)
  store i64 %t6044, ptr @"scheme.base:read"
  ret i64 17
}

define i64 @"scheme.base:__init_196"() {
entry:
  %t6062 = call ptr @rt_alloc_words(i64 1)
  %t6063 = ptrtoint ptr %t6062 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-output-file" to i64), ptr %t6062
  %t6064 = or i64 %t6063, 4
  %t6065 = call i64 @rt_root(i64 %t6064)
  store i64 %t6065, ptr @"scheme.base:open-output-file"
  ret i64 17
}

define i64 @"scheme.base:__init_197"() {
entry:
  %t6083 = call ptr @rt_alloc_words(i64 1)
  %t6084 = ptrtoint ptr %t6083 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-output-string" to i64), ptr %t6083
  %t6085 = or i64 %t6084, 4
  %t6086 = call i64 @rt_root(i64 %t6085)
  store i64 %t6086, ptr @"scheme.base:open-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_198"() {
entry:
  %t6117 = call ptr @rt_alloc_words(i64 1)
  %t6118 = ptrtoint ptr %t6117 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:get-output-string" to i64), ptr %t6117
  %t6119 = or i64 %t6118, 4
  %t6120 = call i64 @rt_root(i64 %t6119)
  store i64 %t6120, ptr @"scheme.base:get-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_199"() {
entry:
  %t6131 = call ptr @rt_alloc_words(i64 1)
  %t6132 = ptrtoint ptr %t6131 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:flush-output-port" to i64), ptr %t6131
  %t6133 = or i64 %t6132, 4
  %t6134 = call i64 @rt_root(i64 %t6133)
  store i64 %t6134, ptr @"scheme.base:flush-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_200"() {
entry:
  %t6163 = call ptr @rt_alloc_words(i64 1)
  %t6164 = ptrtoint ptr %t6163 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-port" to i64), ptr %t6163
  %t6165 = or i64 %t6164, 4
  %t6166 = call i64 @rt_root(i64 %t6165)
  store i64 %t6166, ptr @"scheme.base:close-port"
  ret i64 17
}

define i64 @"scheme.base:__init_201"() {
entry:
  %t6189 = call ptr @rt_alloc_words(i64 1)
  %t6190 = ptrtoint ptr %t6189 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-input-port" to i64), ptr %t6189
  %t6191 = or i64 %t6190, 4
  %t6192 = call i64 @rt_root(i64 %t6191)
  store i64 %t6192, ptr @"scheme.base:close-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_202"() {
entry:
  %t6215 = call ptr @rt_alloc_words(i64 1)
  %t6216 = ptrtoint ptr %t6215 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-output-port" to i64), ptr %t6215
  %t6217 = or i64 %t6216, 4
  %t6218 = call i64 @rt_root(i64 %t6217)
  store i64 %t6218, ptr @"scheme.base:close-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_203"() {
entry:
  %t6219 = call i64 @rt_root(i64 1)
  store i64 %t6219, ptr @"scheme.base:%stdout-port"
  ret i64 17
}

define i64 @"scheme.base:__init_204"() {
entry:
  %t6220 = call i64 @rt_root(i64 1)
  store i64 %t6220, ptr @"scheme.base:%stderr-port"
  ret i64 17
}

define i64 @"scheme.base:__init_205"() {
entry:
  %t6221 = call i64 @rt_root(i64 1)
  store i64 %t6221, ptr @"scheme.base:%stdin-port"
  ret i64 17
}

define i64 @"scheme.base:__init_206"() {
entry:
  %t6253 = call ptr @rt_alloc_words(i64 1)
  %t6254 = ptrtoint ptr %t6253 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-output-port" to i64), ptr %t6253
  %t6255 = or i64 %t6254, 4
  %t6256 = call i64 @rt_root(i64 %t6255)
  store i64 %t6256, ptr @"scheme.base:current-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_207"() {
entry:
  %t6285 = call ptr @rt_alloc_words(i64 1)
  %t6286 = ptrtoint ptr %t6285 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-error-port" to i64), ptr %t6285
  %t6287 = or i64 %t6286, 4
  %t6288 = call i64 @rt_root(i64 %t6287)
  store i64 %t6288, ptr @"scheme.base:current-error-port"
  ret i64 17
}

define i64 @"scheme.base:__init_208"() {
entry:
  %t6317 = call ptr @rt_alloc_words(i64 1)
  %t6318 = ptrtoint ptr %t6317 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-input-port" to i64), ptr %t6317
  %t6319 = or i64 %t6318, 4
  %t6320 = call i64 @rt_root(i64 %t6319)
  store i64 %t6320, ptr @"scheme.base:current-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_209"() {
entry:
  %t6367 = call ptr @rt_alloc_words(i64 1)
  %t6368 = ptrtoint ptr %t6367 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-port" to i64), ptr %t6367
  %t6369 = or i64 %t6368, 4
  %t6370 = call i64 @rt_root(i64 %t6369)
  store i64 %t6370, ptr @"scheme.base:call-with-port"
  ret i64 17
}

define i64 @"scheme.base:__init_210"() {
entry:
  %t6431 = call ptr @rt_alloc_words(i64 1)
  %t6432 = ptrtoint ptr %t6431 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-output-to-file" to i64), ptr %t6431
  %t6433 = or i64 %t6432, 4
  %t6434 = call i64 @rt_root(i64 %t6433)
  store i64 %t6434, ptr @"scheme.base:with-output-to-file"
  ret i64 17
}

define i64 @"scheme.base:__init_211"() {
entry:
  %t6495 = call ptr @rt_alloc_words(i64 1)
  %t6496 = ptrtoint ptr %t6495 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-input-from-file" to i64), ptr %t6495
  %t6497 = or i64 %t6496, 4
  %t6498 = call i64 @rt_root(i64 %t6497)
  store i64 %t6498, ptr @"scheme.base:with-input-from-file"
  ret i64 17
}

define i64 @"scheme.base:__init_212"() {
entry:
  %t6512 = call ptr @rt_alloc_words(i64 1)
  %t6513 = ptrtoint ptr %t6512 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-output-file" to i64), ptr %t6512
  %t6514 = or i64 %t6513, 4
  %t6515 = call i64 @rt_root(i64 %t6514)
  store i64 %t6515, ptr @"scheme.base:call-with-output-file"
  ret i64 17
}

define i64 @"scheme.base:__init_213"() {
entry:
  %t6529 = call ptr @rt_alloc_words(i64 1)
  %t6530 = ptrtoint ptr %t6529 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-input-file" to i64), ptr %t6529
  %t6531 = or i64 %t6530, 4
  %t6532 = call i64 @rt_root(i64 %t6531)
  store i64 %t6532, ptr @"scheme.base:call-with-input-file"
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
  call i64 @"scheme.base:__init_213"()
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

