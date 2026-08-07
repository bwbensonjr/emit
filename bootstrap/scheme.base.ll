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
@.str.sym.13 = private unnamed_addr constant [17 x i8] c"rd-block-comment\00"
@.str.sym.14 = private unnamed_addr constant [5 x i8] c"read\00"
@.str.lit.15 = private unnamed_addr constant [46 x i8] c"unterminated block comment #| opened at index\00"
@.str.sym.16 = private unnamed_addr constant [7 x i8] c"rd-bar\00"
@.str.lit.17 = private unnamed_addr constant [42 x i8] c"unterminated |identifier| opened at index\00"
@.str.sym.18 = private unnamed_addr constant [7 x i8] c"rd-eof\00"
@.str.lit.19 = private unnamed_addr constant [50 x i8] c"end of input where a datum was expected, at index\00"
@.str.sym.20 = private unnamed_addr constant [14 x i8] c"rd-unexpected\00"
@.str.lit.21 = private unnamed_addr constant [24 x i8] c"no datum here, at index\00"
@.str.sym.22 = private unnamed_addr constant [12 x i8] c"rd-rational\00"
@.str.lit.23 = private unnamed_addr constant [57 x i8] c"rational literal syntax is not supported -- Emit has no \00"
@.str.lit.24 = private unnamed_addr constant [39 x i8] c"exact rationals; write 0.5, or (/ 1 2)\00"
@.str.lit.25 = private unnamed_addr constant [20 x i8] c"unrecognized syntax\00"
@.str.lit.26 = private unnamed_addr constant [18 x i8] c"not an input port\00"
@.str.lit.27 = private unnamed_addr constant [15 x i8] c"port is closed\00"
@.str.lit.28 = private unnamed_addr constant [19 x i8] c"not an output port\00"
@.str.lit.29 = private unnamed_addr constant [15 x i8] c"port is closed\00"
@.str.sym.30 = private unnamed_addr constant [10 x i8] c"read-char\00"
@.str.sym.31 = private unnamed_addr constant [10 x i8] c"peek-char\00"
@.str.sym.32 = private unnamed_addr constant [10 x i8] c"read-line\00"
@.str.sym.33 = private unnamed_addr constant [12 x i8] c"read-string\00"
@.str.sym.34 = private unnamed_addr constant [19 x i8] c"open-output-string\00"
@.str.lit.35 = private unnamed_addr constant [34 x i8] c"cannot open an output string port\00"
@.str.sym.36 = private unnamed_addr constant [18 x i8] c"get-output-string\00"
@.str.lit.37 = private unnamed_addr constant [19 x i8] c"not an output port\00"
@.str.lit.38 = private unnamed_addr constant [18 x i8] c"not a string port\00"
@.str.sym.39 = private unnamed_addr constant [18 x i8] c"flush-output-port\00"
@.str.sym.40 = private unnamed_addr constant [11 x i8] c"close-port\00"
@.str.lit.41 = private unnamed_addr constant [11 x i8] c"not a port\00"
@.str.sym.42 = private unnamed_addr constant [17 x i8] c"close-input-port\00"
@.str.lit.43 = private unnamed_addr constant [18 x i8] c"not an input port\00"
@.str.sym.44 = private unnamed_addr constant [18 x i8] c"close-output-port\00"
@.str.lit.45 = private unnamed_addr constant [19 x i8] c"not an output port\00"
@"emit.internal:rd-number" = external global i64
@"emit.internal:rd-fail-pos" = external global i64
@"emit.internal:rd-token-at" = external global i64
@"emit.internal:rd-datum" = external global i64
@"emit.internal:rd-skip-ws" = external global i64
@"emit.internal:rd-fail?" = external global i64
@"emit.internal:%port-rtd" = external global i64
@"emit.internal:%make-port" = external global i64
@"emit.internal:%port-buf" = external global i64
declare fastcc i64 @"emit.internal:code:rd-number"(i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, ptr)
declare fastcc i64 @"emit.internal:code:rd-fail-pos"(i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, ptr)
declare fastcc i64 @"emit.internal:code:rd-token-at"(i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, ptr)
declare fastcc i64 @"emit.internal:code:rd-datum"(i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, ptr)
declare fastcc i64 @"emit.internal:code:rd-skip-ws"(i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, ptr)
declare fastcc i64 @"emit.internal:code:rd-fail?"(i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, ptr)
declare fastcc i64 @"emit.internal:code:%port-rtd"(i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, ptr)
declare fastcc i64 @"emit.internal:code:%make-port"(i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, ptr)
declare fastcc i64 @"emit.internal:code:%port-buf"(i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, ptr)
@"scheme.base:__inited" = global i64 0
@"scheme.base:list" = global i64 0
@"scheme.base:caar" = global i64 0
@"scheme.base:cadr" = global i64 0
@"scheme.base:cdar" = global i64 0
@"scheme.base:cddr" = global i64 0
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
@"scheme.base:string->number" = global i64 0
@"scheme.base:error" = global i64 0
@"scheme.base:*winds*" = global i64 0
@"scheme.base:*handlers*" = global i64 0
@"scheme.base:%unwind-to" = global i64 0
@"scheme.base:dynamic-wind" = global i64 0
@"scheme.base:call-with-current-continuation" = global i64 0
@"scheme.base:call/cc" = global i64 0
@"scheme.base:with-exception-handler" = global i64 0
@"scheme.base:raise" = global i64 0
@"scheme.base:error-object?" = global i64 0
@"scheme.base:error-object-message" = global i64 0
@"scheme.base:error-object-irritants" = global i64 0
@"scheme.base:make-parameter" = global i64 0
@"scheme.base:with-parameters" = global i64 0
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
@"scheme.base:rd-report" = global i64 0
@"scheme.base:read-from-string" = global i64 0
@"scheme.base:read-all-from-string" = global i64 0
@"scheme.base:port?" = global i64 0
@"scheme.base:input-port?" = global i64 0
@"scheme.base:output-port?" = global i64 0
@"scheme.base:textual-port?" = global i64 0
@"scheme.base:port-closed?" = global i64 0
@"scheme.base:input-port-open?" = global i64 0
@"scheme.base:output-port-open?" = global i64 0
@"scheme.base:%check-input-port" = global i64 0
@"scheme.base:%check-output-port" = global i64 0
@"scheme.base:open-input-string" = global i64 0
@"scheme.base:%port-at-eof?" = global i64 0
@"scheme.base:read-char" = global i64 0
@"scheme.base:peek-char" = global i64 0
@"scheme.base:read-line" = global i64 0
@"scheme.base:read-string" = global i64 0
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

define fastcc i64 @"scheme.base:code_15"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t44 = icmp eq i64 %argc, 2
  br i1 %t44, label %argok12, label %arityerr11
arityerr11:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok12:
  %t45 = call i64 @rt_null_p(i64 %a0)
  %t46 = icmp ne i64 %t45, 1
  br i1 %t46, label %then13, label %else14
then13:
  ret i64 %a1
else14:
  %t47 = call i64 @rt_cdr(i64 %a0)
  %t48 = or i64 %a1, 8
  %t49 = and i64 %t48, 7
  %t50 = icmp eq i64 %t49, 0
  br i1 %t50, label %fixfast15, label %fixslow16
fixfast15:
  %t51 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t52 = extractvalue {i64, i1} %t51, 0
  %t53 = extractvalue {i64, i1} %t51, 1
  br i1 %t53, label %fixslow16, label %fixmerge17
fixslow16:
  %t54 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge17
fixmerge17:
  %t55 = phi i64 [ %t52, %fixfast15 ], [ %t54, %fixslow16 ]
  %t56 = musttail call fastcc i64 @"scheme.base:code_15"(i64 %self, i64 2, i64 %t47, i64 %t55, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t56
}

define fastcc i64 @"scheme.base:code:length"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t57 = icmp eq i64 %argc, 1
  br i1 %t57, label %argok19, label %arityerr18
arityerr18:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok19:
  %t58 = call ptr @rt_alloc_words(i64 2)
  %t59 = ptrtoint ptr %t58 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_15" to i64), ptr %t58
  %t60 = or i64 %t59, 4
  %t61 = getelementptr i64, ptr %t58, i64 1
  store i64 %t60, ptr %t61
  %t62 = musttail call fastcc i64 @"scheme.base:code_15"(i64 %t60, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t62
}

define fastcc i64 @"scheme.base:code_22"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t67 = icmp eq i64 %argc, 2
  br i1 %t67, label %argok21, label %arityerr20
arityerr20:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok21:
  %t68 = call i64 @rt_null_p(i64 %a0)
  %t69 = icmp ne i64 %t68, 1
  br i1 %t69, label %then22, label %else23
then22:
  ret i64 %a1
else23:
  %t70 = call i64 @rt_cdr(i64 %a0)
  %t71 = call i64 @rt_car(i64 %a0)
  %t72 = call i64 @rt_cons(i64 %t71, i64 %a1)
  %t73 = musttail call fastcc i64 @"scheme.base:code_22"(i64 %self, i64 2, i64 %t70, i64 %t72, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t73
}

define fastcc i64 @"scheme.base:code:reverse"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t74 = icmp eq i64 %argc, 1
  br i1 %t74, label %argok25, label %arityerr24
arityerr24:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok25:
  %t75 = call ptr @rt_alloc_words(i64 2)
  %t76 = ptrtoint ptr %t75 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_22" to i64), ptr %t75
  %t77 = or i64 %t76, 4
  %t78 = getelementptr i64, ptr %t75, i64 1
  store i64 %t77, ptr %t78
  %t79 = musttail call fastcc i64 @"scheme.base:code_22"(i64 %t77, i64 2, i64 %a0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t79
}

define fastcc i64 @"scheme.base:code:%append2"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t84 = icmp eq i64 %argc, 2
  br i1 %t84, label %argok27, label %arityerr26
arityerr26:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok27:
  %t85 = call i64 @rt_null_p(i64 %a0)
  %t86 = icmp ne i64 %t85, 1
  br i1 %t86, label %then28, label %else29
then28:
  ret i64 %a1
else29:
  %t87 = call i64 @rt_car(i64 %a0)
  %t88 = call i64 @rt_cdr(i64 %a0)
  %t89 = load i64, ptr @"scheme.base:%append2"
  %t90 = and i64 %t89, -8
  %t91 = inttoptr i64 %t90 to ptr
  %t92 = load i64, ptr %t91
  %t93 = inttoptr i64 %t92 to ptr
  %t94 = call fastcc i64%t93(i64 %t89, i64 2, i64 %t88, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t95 = call i64 @rt_cons(i64 %t87, i64 %t94)
  ret i64 %t95
}

define fastcc i64 @"scheme.base:code:append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t100 = icmp sge i64 %argc, 0
  br i1 %t100, label %argok31, label %arityerr30
arityerr30:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok31:
  %t101 = call ptr @rt_alloc_words(i64 8)
  %t102 = getelementptr i64, ptr %t101, i64 0
  store i64 %a0, ptr %t102
  %t103 = getelementptr i64, ptr %t101, i64 1
  store i64 %a1, ptr %t103
  %t104 = getelementptr i64, ptr %t101, i64 2
  store i64 %a2, ptr %t104
  %t105 = getelementptr i64, ptr %t101, i64 3
  store i64 %a3, ptr %t105
  %t106 = getelementptr i64, ptr %t101, i64 4
  store i64 %a4, ptr %t106
  %t107 = getelementptr i64, ptr %t101, i64 5
  store i64 %a5, ptr %t107
  %t108 = getelementptr i64, ptr %t101, i64 6
  store i64 %a6, ptr %t108
  %t109 = getelementptr i64, ptr %t101, i64 7
  store i64 %a7, ptr %t109
  %t110 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t101, ptr %overflow)
  %t111 = call i64 @rt_null_p(i64 %t110)
  %t112 = icmp ne i64 %t111, 1
  br i1 %t112, label %then32, label %else33
then32:
  ret i64 2
else33:
  %t113 = call i64 @rt_cdr(i64 %t110)
  %t114 = call i64 @rt_null_p(i64 %t113)
  %t115 = icmp ne i64 %t114, 1
  br i1 %t115, label %then34, label %else35
then34:
  %t116 = call i64 @rt_car(i64 %t110)
  ret i64 %t116
else35:
  %t117 = call i64 @rt_car(i64 %t110)
  %t118 = call i64 @rt_cdr(i64 %t110)
  %t119 = load i64, ptr @"scheme.base:append"
  %t120 = and i64 %t119, -8
  %t121 = inttoptr i64 %t120 to ptr
  %t122 = load i64, ptr %t121
  %t123 = inttoptr i64 %t122 to ptr
  %t124 = call i64 @rt_list_length(i64 %t118)
  %t125 = add i64 0, %t124
  %t126 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t118, i64 8)
  %t138 = getelementptr i64, ptr %t126, i64 0
  %t130 = load i64, ptr %t138
  %t139 = getelementptr i64, ptr %t126, i64 1
  %t131 = load i64, ptr %t139
  %t140 = getelementptr i64, ptr %t126, i64 2
  %t132 = load i64, ptr %t140
  %t141 = getelementptr i64, ptr %t126, i64 3
  %t133 = load i64, ptr %t141
  %t142 = getelementptr i64, ptr %t126, i64 4
  %t134 = load i64, ptr %t142
  %t143 = getelementptr i64, ptr %t126, i64 5
  %t135 = load i64, ptr %t143
  %t144 = getelementptr i64, ptr %t126, i64 6
  %t136 = load i64, ptr %t144
  %t145 = getelementptr i64, ptr %t126, i64 7
  %t137 = load i64, ptr %t145
  %t127 = icmp sgt i64 %t125, 8
  %t128 = getelementptr i64, ptr %t126, i64 8
  %t129 = select i1 %t127, ptr %t128, ptr null
  %t146 = call fastcc i64%t123(i64 %t119, i64 %t125, i64 %t130, i64 %t131, i64 %t132, i64 %t133, i64 %t134, i64 %t135, i64 %t136, i64 %t137, ptr %t129)
  %t147 = load i64, ptr @"scheme.base:%append2"
  %t148 = and i64 %t147, -8
  %t149 = inttoptr i64 %t148 to ptr
  %t150 = load i64, ptr %t149
  %t151 = inttoptr i64 %t150 to ptr
  %t152 = musttail call fastcc i64 %t151(i64 %t147, i64 2, i64 %t117, i64 %t146, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t152
}

define fastcc i64 @"scheme.base:code:%map1"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t157 = icmp eq i64 %argc, 2
  br i1 %t157, label %argok37, label %arityerr36
arityerr36:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok37:
  %t158 = call i64 @rt_null_p(i64 %a1)
  %t159 = icmp ne i64 %t158, 1
  br i1 %t159, label %then38, label %else39
then38:
  ret i64 2
else39:
  %t160 = call i64 @rt_car(i64 %a1)
  %t161 = and i64 %a0, -8
  %t162 = inttoptr i64 %t161 to ptr
  %t163 = load i64, ptr %t162
  %t164 = inttoptr i64 %t163 to ptr
  %t165 = call fastcc i64%t164(i64 %a0, i64 1, i64 %t160, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t166 = call i64 @rt_cdr(i64 %a1)
  %t167 = load i64, ptr @"scheme.base:%map1"
  %t168 = and i64 %t167, -8
  %t169 = inttoptr i64 %t168 to ptr
  %t170 = load i64, ptr %t169
  %t171 = inttoptr i64 %t170 to ptr
  %t172 = call fastcc i64%t171(i64 %t167, i64 2, i64 %a0, i64 %t166, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t173 = call i64 @rt_cons(i64 %t165, i64 %t172)
  ret i64 %t173
}

define fastcc i64 @"scheme.base:code:%any-null?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t178 = icmp eq i64 %argc, 1
  br i1 %t178, label %argok41, label %arityerr40
arityerr40:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok41:
  %t179 = call i64 @rt_null_p(i64 %a0)
  %t180 = icmp ne i64 %t179, 1
  br i1 %t180, label %then42, label %else43
then42:
  ret i64 1
else43:
  %t181 = call i64 @rt_car(i64 %a0)
  %t182 = call i64 @rt_null_p(i64 %t181)
  %t183 = icmp ne i64 %t182, 1
  br i1 %t183, label %then44, label %else45
then44:
  ret i64 257
else45:
  %t184 = call i64 @rt_cdr(i64 %a0)
  %t185 = load i64, ptr @"scheme.base:%any-null?"
  %t186 = and i64 %t185, -8
  %t187 = inttoptr i64 %t186 to ptr
  %t188 = load i64, ptr %t187
  %t189 = inttoptr i64 %t188 to ptr
  %t190 = musttail call fastcc i64 %t189(i64 %t185, i64 1, i64 %t184, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t190
}

define fastcc i64 @"scheme.base:code_39"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t195 = icmp eq i64 %argc, 1
  br i1 %t195, label %argok47, label %arityerr46
arityerr46:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok47:
  %t196 = call i64 @rt_car(i64 %a0)
  ret i64 %t196
}

define fastcc i64 @"scheme.base:code_41"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t197 = icmp eq i64 %argc, 1
  br i1 %t197, label %argok49, label %arityerr48
arityerr48:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok49:
  %t198 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t198
}

define fastcc i64 @"scheme.base:code:%mapn"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t199 = icmp eq i64 %argc, 2
  br i1 %t199, label %argok51, label %arityerr50
arityerr50:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok51:
  %t200 = load i64, ptr @"scheme.base:%any-null?"
  %t201 = and i64 %t200, -8
  %t202 = inttoptr i64 %t201 to ptr
  %t203 = load i64, ptr %t202
  %t204 = inttoptr i64 %t203 to ptr
  %t205 = call fastcc i64%t204(i64 %t200, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t206 = icmp ne i64 %t205, 1
  br i1 %t206, label %then52, label %else53
then52:
  ret i64 2
else53:
  %t207 = call ptr @rt_alloc_words(i64 1)
  %t208 = ptrtoint ptr %t207 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_39" to i64), ptr %t207
  %t209 = or i64 %t208, 4
  %t210 = load i64, ptr @"scheme.base:%map1"
  %t211 = and i64 %t210, -8
  %t212 = inttoptr i64 %t211 to ptr
  %t213 = load i64, ptr %t212
  %t214 = inttoptr i64 %t213 to ptr
  %t215 = call fastcc i64%t214(i64 %t210, i64 2, i64 %t209, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t216 = and i64 %a0, -8
  %t217 = inttoptr i64 %t216 to ptr
  %t218 = load i64, ptr %t217
  %t219 = inttoptr i64 %t218 to ptr
  %t220 = call i64 @rt_list_length(i64 %t215)
  %t221 = add i64 0, %t220
  %t222 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t215, i64 8)
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
  %t242 = call fastcc i64%t219(i64 %a0, i64 %t221, i64 %t226, i64 %t227, i64 %t228, i64 %t229, i64 %t230, i64 %t231, i64 %t232, i64 %t233, ptr %t225)
  %t243 = call ptr @rt_alloc_words(i64 1)
  %t244 = ptrtoint ptr %t243 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_41" to i64), ptr %t243
  %t245 = or i64 %t244, 4
  %t246 = load i64, ptr @"scheme.base:%map1"
  %t247 = and i64 %t246, -8
  %t248 = inttoptr i64 %t247 to ptr
  %t249 = load i64, ptr %t248
  %t250 = inttoptr i64 %t249 to ptr
  %t251 = call fastcc i64%t250(i64 %t246, i64 2, i64 %t245, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t252 = load i64, ptr @"scheme.base:%mapn"
  %t253 = and i64 %t252, -8
  %t254 = inttoptr i64 %t253 to ptr
  %t255 = load i64, ptr %t254
  %t256 = inttoptr i64 %t255 to ptr
  %t257 = call fastcc i64%t256(i64 %t252, i64 2, i64 %a0, i64 %t251, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t258 = call i64 @rt_cons(i64 %t242, i64 %t257)
  ret i64 %t258
}

define fastcc i64 @"scheme.base:code:map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t263 = icmp sge i64 %argc, 2
  br i1 %t263, label %argok55, label %arityerr54
arityerr54:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok55:
  %t264 = call ptr @rt_alloc_words(i64 8)
  %t265 = getelementptr i64, ptr %t264, i64 0
  store i64 %a0, ptr %t265
  %t266 = getelementptr i64, ptr %t264, i64 1
  store i64 %a1, ptr %t266
  %t267 = getelementptr i64, ptr %t264, i64 2
  store i64 %a2, ptr %t267
  %t268 = getelementptr i64, ptr %t264, i64 3
  store i64 %a3, ptr %t268
  %t269 = getelementptr i64, ptr %t264, i64 4
  store i64 %a4, ptr %t269
  %t270 = getelementptr i64, ptr %t264, i64 5
  store i64 %a5, ptr %t270
  %t271 = getelementptr i64, ptr %t264, i64 6
  store i64 %a6, ptr %t271
  %t272 = getelementptr i64, ptr %t264, i64 7
  store i64 %a7, ptr %t272
  %t273 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t264, ptr %overflow)
  %t274 = call i64 @rt_null_p(i64 %t273)
  %t275 = icmp ne i64 %t274, 1
  br i1 %t275, label %then56, label %else57
then56:
  %t276 = load i64, ptr @"scheme.base:%map1"
  %t277 = and i64 %t276, -8
  %t278 = inttoptr i64 %t277 to ptr
  %t279 = load i64, ptr %t278
  %t280 = inttoptr i64 %t279 to ptr
  %t281 = musttail call fastcc i64 %t280(i64 %t276, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t281
else57:
  %t282 = call i64 @rt_cons(i64 %a1, i64 %t273)
  %t283 = load i64, ptr @"scheme.base:%mapn"
  %t284 = and i64 %t283, -8
  %t285 = inttoptr i64 %t284 to ptr
  %t286 = load i64, ptr %t285
  %t287 = inttoptr i64 %t286 to ptr
  %t288 = musttail call fastcc i64 %t287(i64 %t283, i64 2, i64 %a0, i64 %t282, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t288
}

define fastcc i64 @"scheme.base:code:memq"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t293 = icmp eq i64 %argc, 2
  br i1 %t293, label %argok59, label %arityerr58
arityerr58:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok59:
  %t294 = call i64 @rt_null_p(i64 %a1)
  %t295 = icmp ne i64 %t294, 1
  br i1 %t295, label %then60, label %else61
then60:
  ret i64 1
else61:
  %t296 = call i64 @rt_car(i64 %a1)
  %t297 = call i64 @rt_eq_p(i64 %a0, i64 %t296)
  %t298 = icmp ne i64 %t297, 1
  br i1 %t298, label %then62, label %else63
then62:
  ret i64 %a1
else63:
  %t299 = call i64 @rt_cdr(i64 %a1)
  %t300 = load i64, ptr @"scheme.base:memq"
  %t301 = and i64 %t300, -8
  %t302 = inttoptr i64 %t301 to ptr
  %t303 = load i64, ptr %t302
  %t304 = inttoptr i64 %t303 to ptr
  %t305 = musttail call fastcc i64 %t304(i64 %t300, i64 2, i64 %a0, i64 %t299, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t305
}

define fastcc i64 @"scheme.base:code:memv"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t310 = icmp eq i64 %argc, 2
  br i1 %t310, label %argok65, label %arityerr64
arityerr64:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok65:
  %t311 = call i64 @rt_null_p(i64 %a1)
  %t312 = icmp ne i64 %t311, 1
  br i1 %t312, label %then66, label %else67
then66:
  ret i64 1
else67:
  %t313 = call i64 @rt_car(i64 %a1)
  %t314 = call i64 @rt_eqv_p(i64 %a0, i64 %t313)
  %t315 = icmp ne i64 %t314, 1
  br i1 %t315, label %then68, label %else69
then68:
  ret i64 %a1
else69:
  %t316 = call i64 @rt_cdr(i64 %a1)
  %t317 = load i64, ptr @"scheme.base:memv"
  %t318 = and i64 %t317, -8
  %t319 = inttoptr i64 %t318 to ptr
  %t320 = load i64, ptr %t319
  %t321 = inttoptr i64 %t320 to ptr
  %t322 = musttail call fastcc i64 %t321(i64 %t317, i64 2, i64 %a0, i64 %t316, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t322
}

define fastcc i64 @"scheme.base:code:assq"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t327 = icmp eq i64 %argc, 2
  br i1 %t327, label %argok71, label %arityerr70
arityerr70:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok71:
  %t328 = call i64 @rt_null_p(i64 %a1)
  %t329 = icmp ne i64 %t328, 1
  br i1 %t329, label %then72, label %else73
then72:
  ret i64 1
else73:
  %t330 = call i64 @rt_car(i64 %a1)
  %t331 = call i64 @rt_car(i64 %t330)
  %t332 = call i64 @rt_eq_p(i64 %a0, i64 %t331)
  %t333 = icmp ne i64 %t332, 1
  br i1 %t333, label %then74, label %else75
then74:
  %t334 = call i64 @rt_car(i64 %a1)
  ret i64 %t334
else75:
  %t335 = call i64 @rt_cdr(i64 %a1)
  %t336 = load i64, ptr @"scheme.base:assq"
  %t337 = and i64 %t336, -8
  %t338 = inttoptr i64 %t337 to ptr
  %t339 = load i64, ptr %t338
  %t340 = inttoptr i64 %t339 to ptr
  %t341 = musttail call fastcc i64 %t340(i64 %t336, i64 2, i64 %a0, i64 %t335, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t341
}

define fastcc i64 @"scheme.base:code:member"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t346 = icmp eq i64 %argc, 2
  br i1 %t346, label %argok77, label %arityerr76
arityerr76:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok77:
  %t347 = call i64 @rt_null_p(i64 %a1)
  %t348 = icmp ne i64 %t347, 1
  br i1 %t348, label %then78, label %else79
then78:
  ret i64 1
else79:
  %t349 = call i64 @rt_car(i64 %a1)
  %t350 = call i64 @rt_equal(i64 %a0, i64 %t349)
  %t351 = icmp ne i64 %t350, 1
  br i1 %t351, label %then80, label %else81
then80:
  ret i64 %a1
else81:
  %t352 = call i64 @rt_cdr(i64 %a1)
  %t353 = load i64, ptr @"scheme.base:member"
  %t354 = and i64 %t353, -8
  %t355 = inttoptr i64 %t354 to ptr
  %t356 = load i64, ptr %t355
  %t357 = inttoptr i64 %t356 to ptr
  %t358 = musttail call fastcc i64 %t357(i64 %t353, i64 2, i64 %a0, i64 %t352, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t358
}

define fastcc i64 @"scheme.base:code:assoc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t363 = icmp eq i64 %argc, 2
  br i1 %t363, label %argok83, label %arityerr82
arityerr82:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok83:
  %t364 = call i64 @rt_null_p(i64 %a1)
  %t365 = icmp ne i64 %t364, 1
  br i1 %t365, label %then84, label %else85
then84:
  ret i64 1
else85:
  %t366 = call i64 @rt_car(i64 %a1)
  %t367 = call i64 @rt_car(i64 %t366)
  %t368 = call i64 @rt_equal(i64 %a0, i64 %t367)
  %t369 = icmp ne i64 %t368, 1
  br i1 %t369, label %then86, label %else87
then86:
  %t370 = call i64 @rt_car(i64 %a1)
  ret i64 %t370
else87:
  %t371 = call i64 @rt_cdr(i64 %a1)
  %t372 = load i64, ptr @"scheme.base:assoc"
  %t373 = and i64 %t372, -8
  %t374 = inttoptr i64 %t373 to ptr
  %t375 = load i64, ptr %t374
  %t376 = inttoptr i64 %t375 to ptr
  %t377 = musttail call fastcc i64 %t376(i64 %t372, i64 2, i64 %a0, i64 %t371, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t377
}

define fastcc i64 @"scheme.base:code:filter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t382 = icmp eq i64 %argc, 2
  br i1 %t382, label %argok89, label %arityerr88
arityerr88:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok89:
  %t383 = call i64 @rt_null_p(i64 %a1)
  %t384 = icmp ne i64 %t383, 1
  br i1 %t384, label %then90, label %else91
then90:
  ret i64 2
else91:
  %t385 = call i64 @rt_car(i64 %a1)
  %t386 = and i64 %a0, -8
  %t387 = inttoptr i64 %t386 to ptr
  %t388 = load i64, ptr %t387
  %t389 = inttoptr i64 %t388 to ptr
  %t390 = call fastcc i64%t389(i64 %a0, i64 1, i64 %t385, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t391 = icmp ne i64 %t390, 1
  br i1 %t391, label %then92, label %else93
then92:
  %t392 = call i64 @rt_car(i64 %a1)
  %t393 = call i64 @rt_cdr(i64 %a1)
  %t394 = load i64, ptr @"scheme.base:filter"
  %t395 = and i64 %t394, -8
  %t396 = inttoptr i64 %t395 to ptr
  %t397 = load i64, ptr %t396
  %t398 = inttoptr i64 %t397 to ptr
  %t399 = call fastcc i64%t398(i64 %t394, i64 2, i64 %a0, i64 %t393, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t400 = call i64 @rt_cons(i64 %t392, i64 %t399)
  ret i64 %t400
else93:
  %t401 = call i64 @rt_cdr(i64 %a1)
  %t402 = load i64, ptr @"scheme.base:filter"
  %t403 = and i64 %t402, -8
  %t404 = inttoptr i64 %t403 to ptr
  %t405 = load i64, ptr %t404
  %t406 = inttoptr i64 %t405 to ptr
  %t407 = musttail call fastcc i64 %t406(i64 %t402, i64 2, i64 %a0, i64 %t401, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t407
}

define fastcc i64 @"scheme.base:code:fold-left"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t412 = icmp eq i64 %argc, 3
  br i1 %t412, label %argok95, label %arityerr94
arityerr94:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok95:
  %t413 = call i64 @rt_null_p(i64 %a2)
  %t414 = icmp ne i64 %t413, 1
  br i1 %t414, label %then96, label %else97
then96:
  ret i64 %a1
else97:
  %t415 = call i64 @rt_car(i64 %a2)
  %t416 = and i64 %a0, -8
  %t417 = inttoptr i64 %t416 to ptr
  %t418 = load i64, ptr %t417
  %t419 = inttoptr i64 %t418 to ptr
  %t420 = call fastcc i64%t419(i64 %a0, i64 2, i64 %a1, i64 %t415, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t421 = call i64 @rt_cdr(i64 %a2)
  %t422 = load i64, ptr @"scheme.base:fold-left"
  %t423 = and i64 %t422, -8
  %t424 = inttoptr i64 %t423 to ptr
  %t425 = load i64, ptr %t424
  %t426 = inttoptr i64 %t425 to ptr
  %t427 = musttail call fastcc i64 %t426(i64 %t422, i64 3, i64 %a0, i64 %t420, i64 %t421, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t427
}

define fastcc i64 @"scheme.base:code:fold-right"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t432 = icmp eq i64 %argc, 3
  br i1 %t432, label %argok99, label %arityerr98
arityerr98:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok99:
  %t433 = call i64 @rt_null_p(i64 %a2)
  %t434 = icmp ne i64 %t433, 1
  br i1 %t434, label %then100, label %else101
then100:
  ret i64 %a1
else101:
  %t435 = call i64 @rt_car(i64 %a2)
  %t436 = call i64 @rt_cdr(i64 %a2)
  %t437 = load i64, ptr @"scheme.base:fold-right"
  %t438 = and i64 %t437, -8
  %t439 = inttoptr i64 %t438 to ptr
  %t440 = load i64, ptr %t439
  %t441 = inttoptr i64 %t440 to ptr
  %t442 = call fastcc i64%t441(i64 %t437, i64 3, i64 %a0, i64 %a1, i64 %t436, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t443 = and i64 %a0, -8
  %t444 = inttoptr i64 %t443 to ptr
  %t445 = load i64, ptr %t444
  %t446 = inttoptr i64 %t445 to ptr
  %t447 = musttail call fastcc i64 %t446(i64 %a0, i64 2, i64 %t435, i64 %t442, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t447
}

define fastcc i64 @"scheme.base:code:%for-each1"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t452 = icmp eq i64 %argc, 2
  br i1 %t452, label %argok103, label %arityerr102
arityerr102:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok103:
  %t453 = call i64 @rt_null_p(i64 %a1)
  %t454 = icmp ne i64 %t453, 1
  br i1 %t454, label %then104, label %else105
then104:
  %t455 = icmp ne i64 1, 1
  br i1 %t455, label %then106, label %else107
then106:
  ret i64 1
else107:
  ret i64 17
else105:
  %t456 = call i64 @rt_car(i64 %a1)
  %t457 = and i64 %a0, -8
  %t458 = inttoptr i64 %t457 to ptr
  %t459 = load i64, ptr %t458
  %t460 = inttoptr i64 %t459 to ptr
  %t461 = call fastcc i64%t460(i64 %a0, i64 1, i64 %t456, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t462 = call i64 @rt_cdr(i64 %a1)
  %t463 = load i64, ptr @"scheme.base:%for-each1"
  %t464 = and i64 %t463, -8
  %t465 = inttoptr i64 %t464 to ptr
  %t466 = load i64, ptr %t465
  %t467 = inttoptr i64 %t466 to ptr
  %t468 = musttail call fastcc i64 %t467(i64 %t463, i64 2, i64 %a0, i64 %t462, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t468
}

define fastcc i64 @"scheme.base:code_93"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t473 = icmp eq i64 %argc, 1
  br i1 %t473, label %argok109, label %arityerr108
arityerr108:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok109:
  %t474 = call i64 @rt_car(i64 %a0)
  ret i64 %t474
}

define fastcc i64 @"scheme.base:code_95"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t475 = icmp eq i64 %argc, 1
  br i1 %t475, label %argok111, label %arityerr110
arityerr110:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok111:
  %t476 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t476
}

define fastcc i64 @"scheme.base:code:%for-eachn"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t477 = icmp eq i64 %argc, 2
  br i1 %t477, label %argok113, label %arityerr112
arityerr112:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok113:
  %t478 = load i64, ptr @"scheme.base:%any-null?"
  %t479 = and i64 %t478, -8
  %t480 = inttoptr i64 %t479 to ptr
  %t481 = load i64, ptr %t480
  %t482 = inttoptr i64 %t481 to ptr
  %t483 = call fastcc i64%t482(i64 %t478, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t484 = icmp ne i64 %t483, 1
  br i1 %t484, label %then114, label %else115
then114:
  %t485 = icmp ne i64 1, 1
  br i1 %t485, label %then116, label %else117
then116:
  ret i64 1
else117:
  ret i64 17
else115:
  %t486 = call ptr @rt_alloc_words(i64 1)
  %t487 = ptrtoint ptr %t486 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_93" to i64), ptr %t486
  %t488 = or i64 %t487, 4
  %t489 = load i64, ptr @"scheme.base:%map1"
  %t490 = and i64 %t489, -8
  %t491 = inttoptr i64 %t490 to ptr
  %t492 = load i64, ptr %t491
  %t493 = inttoptr i64 %t492 to ptr
  %t494 = call fastcc i64%t493(i64 %t489, i64 2, i64 %t488, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t495 = and i64 %a0, -8
  %t496 = inttoptr i64 %t495 to ptr
  %t497 = load i64, ptr %t496
  %t498 = inttoptr i64 %t497 to ptr
  %t499 = call i64 @rt_list_length(i64 %t494)
  %t500 = add i64 0, %t499
  %t501 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t494, i64 8)
  %t513 = getelementptr i64, ptr %t501, i64 0
  %t505 = load i64, ptr %t513
  %t514 = getelementptr i64, ptr %t501, i64 1
  %t506 = load i64, ptr %t514
  %t515 = getelementptr i64, ptr %t501, i64 2
  %t507 = load i64, ptr %t515
  %t516 = getelementptr i64, ptr %t501, i64 3
  %t508 = load i64, ptr %t516
  %t517 = getelementptr i64, ptr %t501, i64 4
  %t509 = load i64, ptr %t517
  %t518 = getelementptr i64, ptr %t501, i64 5
  %t510 = load i64, ptr %t518
  %t519 = getelementptr i64, ptr %t501, i64 6
  %t511 = load i64, ptr %t519
  %t520 = getelementptr i64, ptr %t501, i64 7
  %t512 = load i64, ptr %t520
  %t502 = icmp sgt i64 %t500, 8
  %t503 = getelementptr i64, ptr %t501, i64 8
  %t504 = select i1 %t502, ptr %t503, ptr null
  %t521 = call fastcc i64%t498(i64 %a0, i64 %t500, i64 %t505, i64 %t506, i64 %t507, i64 %t508, i64 %t509, i64 %t510, i64 %t511, i64 %t512, ptr %t504)
  %t522 = call ptr @rt_alloc_words(i64 1)
  %t523 = ptrtoint ptr %t522 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_95" to i64), ptr %t522
  %t524 = or i64 %t523, 4
  %t525 = load i64, ptr @"scheme.base:%map1"
  %t526 = and i64 %t525, -8
  %t527 = inttoptr i64 %t526 to ptr
  %t528 = load i64, ptr %t527
  %t529 = inttoptr i64 %t528 to ptr
  %t530 = call fastcc i64%t529(i64 %t525, i64 2, i64 %t524, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t531 = load i64, ptr @"scheme.base:%for-eachn"
  %t532 = and i64 %t531, -8
  %t533 = inttoptr i64 %t532 to ptr
  %t534 = load i64, ptr %t533
  %t535 = inttoptr i64 %t534 to ptr
  %t536 = musttail call fastcc i64 %t535(i64 %t531, i64 2, i64 %a0, i64 %t530, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t536
}

define fastcc i64 @"scheme.base:code:for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t541 = icmp sge i64 %argc, 2
  br i1 %t541, label %argok119, label %arityerr118
arityerr118:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok119:
  %t542 = call ptr @rt_alloc_words(i64 8)
  %t543 = getelementptr i64, ptr %t542, i64 0
  store i64 %a0, ptr %t543
  %t544 = getelementptr i64, ptr %t542, i64 1
  store i64 %a1, ptr %t544
  %t545 = getelementptr i64, ptr %t542, i64 2
  store i64 %a2, ptr %t545
  %t546 = getelementptr i64, ptr %t542, i64 3
  store i64 %a3, ptr %t546
  %t547 = getelementptr i64, ptr %t542, i64 4
  store i64 %a4, ptr %t547
  %t548 = getelementptr i64, ptr %t542, i64 5
  store i64 %a5, ptr %t548
  %t549 = getelementptr i64, ptr %t542, i64 6
  store i64 %a6, ptr %t549
  %t550 = getelementptr i64, ptr %t542, i64 7
  store i64 %a7, ptr %t550
  %t551 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t542, ptr %overflow)
  %t552 = call i64 @rt_null_p(i64 %t551)
  %t553 = icmp ne i64 %t552, 1
  br i1 %t553, label %then120, label %else121
then120:
  %t554 = load i64, ptr @"scheme.base:%for-each1"
  %t555 = and i64 %t554, -8
  %t556 = inttoptr i64 %t555 to ptr
  %t557 = load i64, ptr %t556
  %t558 = inttoptr i64 %t557 to ptr
  %t559 = musttail call fastcc i64 %t558(i64 %t554, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t559
else121:
  %t560 = call i64 @rt_cons(i64 %a1, i64 %t551)
  %t561 = load i64, ptr @"scheme.base:%for-eachn"
  %t562 = and i64 %t561, -8
  %t563 = inttoptr i64 %t562 to ptr
  %t564 = load i64, ptr %t563
  %t565 = inttoptr i64 %t564 to ptr
  %t566 = musttail call fastcc i64 %t565(i64 %t561, i64 2, i64 %a0, i64 %t560, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t566
}

define fastcc i64 @"scheme.base:code:andmap"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t571 = icmp eq i64 %argc, 2
  br i1 %t571, label %argok123, label %arityerr122
arityerr122:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok123:
  %t572 = call i64 @rt_null_p(i64 %a1)
  %t573 = icmp ne i64 %t572, 1
  br i1 %t573, label %then124, label %else125
then124:
  ret i64 257
else125:
  %t574 = call i64 @rt_car(i64 %a1)
  %t575 = and i64 %a0, -8
  %t576 = inttoptr i64 %t575 to ptr
  %t577 = load i64, ptr %t576
  %t578 = inttoptr i64 %t577 to ptr
  %t579 = call fastcc i64%t578(i64 %a0, i64 1, i64 %t574, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t580 = icmp ne i64 %t579, 1
  br i1 %t580, label %then126, label %else127
then126:
  %t581 = call i64 @rt_cdr(i64 %a1)
  %t582 = load i64, ptr @"scheme.base:andmap"
  %t583 = and i64 %t582, -8
  %t584 = inttoptr i64 %t583 to ptr
  %t585 = load i64, ptr %t584
  %t586 = inttoptr i64 %t585 to ptr
  %t587 = musttail call fastcc i64 %t586(i64 %t582, i64 2, i64 %a0, i64 %t581, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t587
else127:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:memp"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t592 = icmp eq i64 %argc, 2
  br i1 %t592, label %argok129, label %arityerr128
arityerr128:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok129:
  %t593 = call i64 @rt_null_p(i64 %a1)
  %t594 = icmp ne i64 %t593, 1
  br i1 %t594, label %then130, label %else131
then130:
  ret i64 1
else131:
  %t595 = call i64 @rt_car(i64 %a1)
  %t596 = and i64 %a0, -8
  %t597 = inttoptr i64 %t596 to ptr
  %t598 = load i64, ptr %t597
  %t599 = inttoptr i64 %t598 to ptr
  %t600 = call fastcc i64%t599(i64 %a0, i64 1, i64 %t595, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t601 = icmp ne i64 %t600, 1
  br i1 %t601, label %then132, label %else133
then132:
  ret i64 %a1
else133:
  %t602 = call i64 @rt_cdr(i64 %a1)
  %t603 = load i64, ptr @"scheme.base:memp"
  %t604 = and i64 %t603, -8
  %t605 = inttoptr i64 %t604 to ptr
  %t606 = load i64, ptr %t605
  %t607 = inttoptr i64 %t606 to ptr
  %t608 = musttail call fastcc i64 %t607(i64 %t603, i64 2, i64 %a0, i64 %t602, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t608
}

define fastcc i64 @"scheme.base:code:list?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t613 = icmp eq i64 %argc, 1
  br i1 %t613, label %argok135, label %arityerr134
arityerr134:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok135:
  %t614 = call i64 @rt_null_p(i64 %a0)
  %t615 = icmp ne i64 %t614, 1
  br i1 %t615, label %then136, label %else137
then136:
  ret i64 257
else137:
  %t616 = call i64 @rt_pair_p(i64 %a0)
  %t617 = icmp ne i64 %t616, 1
  br i1 %t617, label %then138, label %else139
then138:
  %t618 = call i64 @rt_cdr(i64 %a0)
  %t619 = load i64, ptr @"scheme.base:list?"
  %t620 = and i64 %t619, -8
  %t621 = inttoptr i64 %t620 to ptr
  %t622 = load i64, ptr %t621
  %t623 = inttoptr i64 %t622 to ptr
  %t624 = musttail call fastcc i64 %t623(i64 %t619, i64 1, i64 %t618, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t624
else139:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:zero?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t629 = icmp eq i64 %argc, 1
  br i1 %t629, label %argok141, label %arityerr140
arityerr140:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok141:
  %t630 = or i64 %a0, 0
  %t631 = and i64 %t630, 7
  %t632 = icmp eq i64 %t631, 0
  br i1 %t632, label %fixfast142, label %fixslow143
fixfast142:
  %t633 = icmp eq i64 %a0, 0
  %t634 = select i1 %t633, i64 257, i64 1
  br label %fixmerge144
fixslow143:
  %t635 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge144
fixmerge144:
  %t636 = phi i64 [ %t634, %fixfast142 ], [ %t635, %fixslow143 ]
  ret i64 %t636
}

define fastcc i64 @"scheme.base:code:list-tail"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t641 = icmp eq i64 %argc, 2
  br i1 %t641, label %argok146, label %arityerr145
arityerr145:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok146:
  %t642 = load i64, ptr @"scheme.base:zero?"
  %t643 = and i64 %t642, -8
  %t644 = inttoptr i64 %t643 to ptr
  %t645 = load i64, ptr %t644
  %t646 = inttoptr i64 %t645 to ptr
  %t647 = call fastcc i64%t646(i64 %t642, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t648 = icmp ne i64 %t647, 1
  br i1 %t648, label %then147, label %else148
then147:
  ret i64 %a0
else148:
  %t649 = call i64 @rt_cdr(i64 %a0)
  %t650 = or i64 %a1, 8
  %t651 = and i64 %t650, 7
  %t652 = icmp eq i64 %t651, 0
  br i1 %t652, label %fixfast149, label %fixslow150
fixfast149:
  %t653 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a1, i64 8)
  %t654 = extractvalue {i64, i1} %t653, 0
  %t655 = extractvalue {i64, i1} %t653, 1
  br i1 %t655, label %fixslow150, label %fixmerge151
fixslow150:
  %t656 = call i64 @rt_sub(i64 %a1, i64 8)
  br label %fixmerge151
fixmerge151:
  %t657 = phi i64 [ %t654, %fixfast149 ], [ %t656, %fixslow150 ]
  %t658 = load i64, ptr @"scheme.base:list-tail"
  %t659 = and i64 %t658, -8
  %t660 = inttoptr i64 %t659 to ptr
  %t661 = load i64, ptr %t660
  %t662 = inttoptr i64 %t661 to ptr
  %t663 = musttail call fastcc i64 %t662(i64 %t658, i64 2, i64 %t649, i64 %t657, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t663
}

define fastcc i64 @"scheme.base:code:list-ref"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t668 = icmp eq i64 %argc, 2
  br i1 %t668, label %argok153, label %arityerr152
arityerr152:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok153:
  %t669 = load i64, ptr @"scheme.base:list-tail"
  %t670 = and i64 %t669, -8
  %t671 = inttoptr i64 %t670 to ptr
  %t672 = load i64, ptr %t671
  %t673 = inttoptr i64 %t672 to ptr
  %t674 = call fastcc i64%t673(i64 %t669, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t675 = call i64 @rt_car(i64 %t674)
  ret i64 %t675
}

define fastcc i64 @"scheme.base:code:list-head"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t680 = icmp eq i64 %argc, 2
  br i1 %t680, label %argok155, label %arityerr154
arityerr154:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok155:
  %t681 = load i64, ptr @"scheme.base:zero?"
  %t682 = and i64 %t681, -8
  %t683 = inttoptr i64 %t682 to ptr
  %t684 = load i64, ptr %t683
  %t685 = inttoptr i64 %t684 to ptr
  %t686 = call fastcc i64%t685(i64 %t681, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t687 = icmp ne i64 %t686, 1
  br i1 %t687, label %then156, label %else157
then156:
  ret i64 2
else157:
  %t688 = call i64 @rt_car(i64 %a0)
  %t689 = call i64 @rt_cdr(i64 %a0)
  %t690 = or i64 %a1, 8
  %t691 = and i64 %t690, 7
  %t692 = icmp eq i64 %t691, 0
  br i1 %t692, label %fixfast158, label %fixslow159
fixfast158:
  %t693 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a1, i64 8)
  %t694 = extractvalue {i64, i1} %t693, 0
  %t695 = extractvalue {i64, i1} %t693, 1
  br i1 %t695, label %fixslow159, label %fixmerge160
fixslow159:
  %t696 = call i64 @rt_sub(i64 %a1, i64 8)
  br label %fixmerge160
fixmerge160:
  %t697 = phi i64 [ %t694, %fixfast158 ], [ %t696, %fixslow159 ]
  %t698 = load i64, ptr @"scheme.base:list-head"
  %t699 = and i64 %t698, -8
  %t700 = inttoptr i64 %t699 to ptr
  %t701 = load i64, ptr %t700
  %t702 = inttoptr i64 %t701 to ptr
  %t703 = call fastcc i64%t702(i64 %t698, i64 2, i64 %t689, i64 %t697, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t704 = call i64 @rt_cons(i64 %t688, i64 %t703)
  ret i64 %t704
}

define fastcc i64 @"scheme.base:code:make-list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t709 = icmp eq i64 %argc, 2
  br i1 %t709, label %argok162, label %arityerr161
arityerr161:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok162:
  %t710 = load i64, ptr @"scheme.base:zero?"
  %t711 = and i64 %t710, -8
  %t712 = inttoptr i64 %t711 to ptr
  %t713 = load i64, ptr %t712
  %t714 = inttoptr i64 %t713 to ptr
  %t715 = call fastcc i64%t714(i64 %t710, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t716 = icmp ne i64 %t715, 1
  br i1 %t716, label %then163, label %else164
then163:
  ret i64 2
else164:
  %t717 = or i64 %a0, 8
  %t718 = and i64 %t717, 7
  %t719 = icmp eq i64 %t718, 0
  br i1 %t719, label %fixfast165, label %fixslow166
fixfast165:
  %t720 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t721 = extractvalue {i64, i1} %t720, 0
  %t722 = extractvalue {i64, i1} %t720, 1
  br i1 %t722, label %fixslow166, label %fixmerge167
fixslow166:
  %t723 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge167
fixmerge167:
  %t724 = phi i64 [ %t721, %fixfast165 ], [ %t723, %fixslow166 ]
  %t725 = load i64, ptr @"scheme.base:make-list"
  %t726 = and i64 %t725, -8
  %t727 = inttoptr i64 %t726 to ptr
  %t728 = load i64, ptr %t727
  %t729 = inttoptr i64 %t728 to ptr
  %t730 = call fastcc i64%t729(i64 %t725, i64 2, i64 %t724, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t731 = call i64 @rt_cons(i64 %a1, i64 %t730)
  ret i64 %t731
}

define fastcc i64 @"scheme.base:code_136"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t736 = icmp eq i64 %argc, 2
  br i1 %t736, label %argok169, label %arityerr168
arityerr168:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok169:
  %t737 = and i64 %self, -8
  %t738 = inttoptr i64 %t737 to ptr
  %t739 = getelementptr i64, ptr %t738, i64 1
  %t740 = load i64, ptr %t739
  %t741 = or i64 %a0, %t740
  %t742 = and i64 %t741, 7
  %t743 = icmp eq i64 %t742, 0
  br i1 %t743, label %fixfast170, label %fixslow171
fixfast170:
  %t744 = icmp eq i64 %a0, %t740
  %t745 = select i1 %t744, i64 257, i64 1
  br label %fixmerge172
fixslow171:
  %t746 = call i64 @rt_num_eq(i64 %a0, i64 %t740)
  br label %fixmerge172
fixmerge172:
  %t747 = phi i64 [ %t745, %fixfast170 ], [ %t746, %fixslow171 ]
  %t748 = icmp ne i64 %t747, 1
  br i1 %t748, label %then173, label %else174
then173:
  %t749 = load i64, ptr @"scheme.base:reverse"
  %t750 = and i64 %t749, -8
  %t751 = inttoptr i64 %t750 to ptr
  %t752 = load i64, ptr %t751
  %t753 = inttoptr i64 %t752 to ptr
  %t754 = musttail call fastcc i64 %t753(i64 %t749, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t754
else174:
  %t755 = or i64 %a0, 8
  %t756 = and i64 %t755, 7
  %t757 = icmp eq i64 %t756, 0
  br i1 %t757, label %fixfast175, label %fixslow176
fixfast175:
  %t758 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t759 = extractvalue {i64, i1} %t758, 0
  %t760 = extractvalue {i64, i1} %t758, 1
  br i1 %t760, label %fixslow176, label %fixmerge177
fixslow176:
  %t761 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge177
fixmerge177:
  %t762 = phi i64 [ %t759, %fixfast175 ], [ %t761, %fixslow176 ]
  %t763 = call i64 @rt_cons(i64 %a0, i64 %a1)
  %t764 = musttail call fastcc i64 @"scheme.base:code_136"(i64 %self, i64 2, i64 %t762, i64 %t763, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t764
}

define fastcc i64 @"scheme.base:code:iota"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t765 = icmp eq i64 %argc, 1
  br i1 %t765, label %argok179, label %arityerr178
arityerr178:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok179:
  %t766 = call ptr @rt_alloc_words(i64 3)
  %t767 = ptrtoint ptr %t766 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_136" to i64), ptr %t766
  %t768 = or i64 %t767, 4
  %t769 = getelementptr i64, ptr %t766, i64 1
  store i64 %a0, ptr %t769
  %t770 = getelementptr i64, ptr %t766, i64 2
  store i64 %t768, ptr %t770
  %t771 = musttail call fastcc i64 @"scheme.base:code_136"(i64 %t768, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t771
}

define fastcc i64 @"scheme.base:code:%minmax-fold"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t776 = icmp eq i64 %argc, 4
  br i1 %t776, label %argok181, label %arityerr180
arityerr180:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok181:
  %t777 = call i64 @rt_null_p(i64 %a1)
  %t778 = icmp ne i64 %t777, 1
  br i1 %t778, label %then182, label %else183
then182:
  %t779 = icmp ne i64 %a3, 1
  br i1 %t779, label %then184, label %else185
then184:
  %t780 = call i64 @rt_exact_to_inexact(i64 %a2)
  ret i64 %t780
else185:
  ret i64 %a2
else183:
  %t781 = call i64 @rt_cdr(i64 %a1)
  %t782 = call i64 @rt_car(i64 %a1)
  %t783 = and i64 %a0, -8
  %t784 = inttoptr i64 %t783 to ptr
  %t785 = load i64, ptr %t784
  %t786 = inttoptr i64 %t785 to ptr
  %t787 = call fastcc i64%t786(i64 %a0, i64 2, i64 %a2, i64 %t782, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t788 = icmp ne i64 %a3, 1
  br i1 %t788, label %then186, label %else187
then186:
  br label %merge188
else187:
  %t789 = call i64 @rt_car(i64 %a1)
  %t790 = call i64 @rt_inexact_p(i64 %t789)
  br label %merge188
merge188:
  %t791 = phi i64 [ 257, %then186 ], [ %t790, %else187 ]
  %t792 = load i64, ptr @"scheme.base:%minmax-fold"
  %t793 = and i64 %t792, -8
  %t794 = inttoptr i64 %t793 to ptr
  %t795 = load i64, ptr %t794
  %t796 = inttoptr i64 %t795 to ptr
  %t797 = musttail call fastcc i64 %t796(i64 %t792, i64 4, i64 %a0, i64 %t781, i64 %t787, i64 %t791, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t797
}

define fastcc i64 @"scheme.base:code:%minmax"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t802 = icmp eq i64 %argc, 3
  br i1 %t802, label %argok190, label %arityerr189
arityerr189:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok190:
  %t803 = call i64 @rt_inexact_p(i64 %a1)
  %t804 = load i64, ptr @"scheme.base:%minmax-fold"
  %t805 = and i64 %t804, -8
  %t806 = inttoptr i64 %t805 to ptr
  %t807 = load i64, ptr %t806
  %t808 = inttoptr i64 %t807 to ptr
  %t809 = musttail call fastcc i64 %t808(i64 %t804, i64 4, i64 %a0, i64 %a2, i64 %a1, i64 %t803, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t809
}

define fastcc i64 @"scheme.base:code_156"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t814 = icmp eq i64 %argc, 2
  br i1 %t814, label %argok192, label %arityerr191
arityerr191:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok192:
  %t815 = or i64 %a0, %a1
  %t816 = and i64 %t815, 7
  %t817 = icmp eq i64 %t816, 0
  br i1 %t817, label %fixfast193, label %fixslow194
fixfast193:
  %t818 = icmp slt i64 %a0, %a1
  %t819 = select i1 %t818, i64 257, i64 1
  br label %fixmerge195
fixslow194:
  %t820 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge195
fixmerge195:
  %t821 = phi i64 [ %t819, %fixfast193 ], [ %t820, %fixslow194 ]
  %t822 = icmp ne i64 %t821, 1
  br i1 %t822, label %then196, label %else197
then196:
  ret i64 %a1
else197:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:max"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t823 = icmp sge i64 %argc, 1
  br i1 %t823, label %argok199, label %arityerr198
arityerr198:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok199:
  %t824 = call ptr @rt_alloc_words(i64 8)
  %t825 = getelementptr i64, ptr %t824, i64 0
  store i64 %a0, ptr %t825
  %t826 = getelementptr i64, ptr %t824, i64 1
  store i64 %a1, ptr %t826
  %t827 = getelementptr i64, ptr %t824, i64 2
  store i64 %a2, ptr %t827
  %t828 = getelementptr i64, ptr %t824, i64 3
  store i64 %a3, ptr %t828
  %t829 = getelementptr i64, ptr %t824, i64 4
  store i64 %a4, ptr %t829
  %t830 = getelementptr i64, ptr %t824, i64 5
  store i64 %a5, ptr %t830
  %t831 = getelementptr i64, ptr %t824, i64 6
  store i64 %a6, ptr %t831
  %t832 = getelementptr i64, ptr %t824, i64 7
  store i64 %a7, ptr %t832
  %t833 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t824, ptr %overflow)
  %t834 = call ptr @rt_alloc_words(i64 1)
  %t835 = ptrtoint ptr %t834 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_156" to i64), ptr %t834
  %t836 = or i64 %t835, 4
  %t837 = load i64, ptr @"scheme.base:%minmax"
  %t838 = and i64 %t837, -8
  %t839 = inttoptr i64 %t838 to ptr
  %t840 = load i64, ptr %t839
  %t841 = inttoptr i64 %t840 to ptr
  %t842 = musttail call fastcc i64 %t841(i64 %t837, i64 3, i64 %t836, i64 %a0, i64 %t833, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t842
}

define fastcc i64 @"scheme.base:code_167"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t847 = icmp eq i64 %argc, 2
  br i1 %t847, label %argok201, label %arityerr200
arityerr200:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok201:
  %t848 = or i64 %a1, %a0
  %t849 = and i64 %t848, 7
  %t850 = icmp eq i64 %t849, 0
  br i1 %t850, label %fixfast202, label %fixslow203
fixfast202:
  %t851 = icmp slt i64 %a1, %a0
  %t852 = select i1 %t851, i64 257, i64 1
  br label %fixmerge204
fixslow203:
  %t853 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge204
fixmerge204:
  %t854 = phi i64 [ %t852, %fixfast202 ], [ %t853, %fixslow203 ]
  %t855 = icmp ne i64 %t854, 1
  br i1 %t855, label %then205, label %else206
then205:
  ret i64 %a1
else206:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:min"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t856 = icmp sge i64 %argc, 1
  br i1 %t856, label %argok208, label %arityerr207
arityerr207:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok208:
  %t857 = call ptr @rt_alloc_words(i64 8)
  %t858 = getelementptr i64, ptr %t857, i64 0
  store i64 %a0, ptr %t858
  %t859 = getelementptr i64, ptr %t857, i64 1
  store i64 %a1, ptr %t859
  %t860 = getelementptr i64, ptr %t857, i64 2
  store i64 %a2, ptr %t860
  %t861 = getelementptr i64, ptr %t857, i64 3
  store i64 %a3, ptr %t861
  %t862 = getelementptr i64, ptr %t857, i64 4
  store i64 %a4, ptr %t862
  %t863 = getelementptr i64, ptr %t857, i64 5
  store i64 %a5, ptr %t863
  %t864 = getelementptr i64, ptr %t857, i64 6
  store i64 %a6, ptr %t864
  %t865 = getelementptr i64, ptr %t857, i64 7
  store i64 %a7, ptr %t865
  %t866 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t857, ptr %overflow)
  %t867 = call ptr @rt_alloc_words(i64 1)
  %t868 = ptrtoint ptr %t867 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_167" to i64), ptr %t867
  %t869 = or i64 %t868, 4
  %t870 = load i64, ptr @"scheme.base:%minmax"
  %t871 = and i64 %t870, -8
  %t872 = inttoptr i64 %t871 to ptr
  %t873 = load i64, ptr %t872
  %t874 = inttoptr i64 %t873 to ptr
  %t875 = musttail call fastcc i64 %t874(i64 %t870, i64 3, i64 %t869, i64 %a0, i64 %t866, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t875
}

define fastcc i64 @"scheme.base:code:complex?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t880 = icmp eq i64 %argc, 1
  br i1 %t880, label %argok210, label %arityerr209
arityerr209:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok210:
  %t881 = call i64 @rt_number_p(i64 %a0)
  ret i64 %t881
}

define fastcc i64 @"scheme.base:code:exact-integer?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t886 = icmp eq i64 %argc, 1
  br i1 %t886, label %argok212, label %arityerr211
arityerr211:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok212:
  %t887 = call i64 @rt_exact_p(i64 %a0)
  %t888 = icmp ne i64 %t887, 1
  br i1 %t888, label %then213, label %else214
then213:
  %t889 = call i64 @rt_integer_p(i64 %a0)
  ret i64 %t889
else214:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rational?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t894 = icmp eq i64 %argc, 1
  br i1 %t894, label %argok216, label %arityerr215
arityerr215:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok216:
  %t895 = call i64 @rt_number_p(i64 %a0)
  %t896 = icmp ne i64 %t895, 1
  br i1 %t896, label %then217, label %else218
then217:
  %t897 = call i64 @rt_finite_p(i64 %a0)
  ret i64 %t897
else218:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:positive?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t902 = icmp eq i64 %argc, 1
  br i1 %t902, label %argok220, label %arityerr219
arityerr219:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok220:
  %t903 = or i64 0, %a0
  %t904 = and i64 %t903, 7
  %t905 = icmp eq i64 %t904, 0
  br i1 %t905, label %fixfast221, label %fixslow222
fixfast221:
  %t906 = icmp slt i64 0, %a0
  %t907 = select i1 %t906, i64 257, i64 1
  br label %fixmerge223
fixslow222:
  %t908 = call i64 @rt_lt(i64 0, i64 %a0)
  br label %fixmerge223
fixmerge223:
  %t909 = phi i64 [ %t907, %fixfast221 ], [ %t908, %fixslow222 ]
  ret i64 %t909
}

define fastcc i64 @"scheme.base:code:negative?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t914 = icmp eq i64 %argc, 1
  br i1 %t914, label %argok225, label %arityerr224
arityerr224:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok225:
  %t915 = or i64 %a0, 0
  %t916 = and i64 %t915, 7
  %t917 = icmp eq i64 %t916, 0
  br i1 %t917, label %fixfast226, label %fixslow227
fixfast226:
  %t918 = icmp slt i64 %a0, 0
  %t919 = select i1 %t918, i64 257, i64 1
  br label %fixmerge228
fixslow227:
  %t920 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge228
fixmerge228:
  %t921 = phi i64 [ %t919, %fixfast226 ], [ %t920, %fixslow227 ]
  ret i64 %t921
}

define fastcc i64 @"scheme.base:code:even?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t926 = icmp eq i64 %argc, 1
  br i1 %t926, label %argok230, label %arityerr229
arityerr229:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok230:
  %t927 = call i64 @rt_remainder(i64 %a0, i64 16)
  %t928 = or i64 0, %t927
  %t929 = and i64 %t928, 7
  %t930 = icmp eq i64 %t929, 0
  br i1 %t930, label %fixfast231, label %fixslow232
fixfast231:
  %t931 = icmp eq i64 0, %t927
  %t932 = select i1 %t931, i64 257, i64 1
  br label %fixmerge233
fixslow232:
  %t933 = call i64 @rt_num_eq(i64 0, i64 %t927)
  br label %fixmerge233
fixmerge233:
  %t934 = phi i64 [ %t932, %fixfast231 ], [ %t933, %fixslow232 ]
  ret i64 %t934
}

define fastcc i64 @"scheme.base:code:odd?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t939 = icmp eq i64 %argc, 1
  br i1 %t939, label %argok235, label %arityerr234
arityerr234:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok235:
  %t940 = call i64 @rt_remainder(i64 %a0, i64 16)
  %t941 = or i64 0, %t940
  %t942 = and i64 %t941, 7
  %t943 = icmp eq i64 %t942, 0
  br i1 %t943, label %fixfast236, label %fixslow237
fixfast236:
  %t944 = icmp eq i64 0, %t940
  %t945 = select i1 %t944, i64 257, i64 1
  br label %fixmerge238
fixslow237:
  %t946 = call i64 @rt_num_eq(i64 0, i64 %t940)
  br label %fixmerge238
fixmerge238:
  %t947 = phi i64 [ %t945, %fixfast236 ], [ %t946, %fixslow237 ]
  %t948 = icmp ne i64 %t947, 1
  br i1 %t948, label %then239, label %else240
then239:
  ret i64 1
else240:
  ret i64 257
}

define fastcc i64 @"scheme.base:code:abs"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t953 = icmp eq i64 %argc, 1
  br i1 %t953, label %argok242, label %arityerr241
arityerr241:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok242:
  %t954 = or i64 %a0, 0
  %t955 = and i64 %t954, 7
  %t956 = icmp eq i64 %t955, 0
  br i1 %t956, label %fixfast243, label %fixslow244
fixfast243:
  %t957 = icmp slt i64 %a0, 0
  %t958 = select i1 %t957, i64 257, i64 1
  br label %fixmerge245
fixslow244:
  %t959 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge245
fixmerge245:
  %t960 = phi i64 [ %t958, %fixfast243 ], [ %t959, %fixslow244 ]
  %t961 = icmp ne i64 %t960, 1
  br i1 %t961, label %then246, label %else247
then246:
  %t962 = or i64 0, %a0
  %t963 = and i64 %t962, 7
  %t964 = icmp eq i64 %t963, 0
  br i1 %t964, label %fixfast248, label %fixslow249
fixfast248:
  %t965 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %a0)
  %t966 = extractvalue {i64, i1} %t965, 0
  %t967 = extractvalue {i64, i1} %t965, 1
  br i1 %t967, label %fixslow249, label %fixmerge250
fixslow249:
  %t968 = call i64 @rt_sub(i64 0, i64 %a0)
  br label %fixmerge250
fixmerge250:
  %t969 = phi i64 [ %t966, %fixfast248 ], [ %t968, %fixslow249 ]
  ret i64 %t969
else247:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:square"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t974 = icmp eq i64 %argc, 1
  br i1 %t974, label %argok252, label %arityerr251
arityerr251:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok252:
  %t975 = or i64 %a0, %a0
  %t976 = and i64 %t975, 7
  %t977 = icmp eq i64 %t976, 0
  br i1 %t977, label %fixfast253, label %fixslow254
fixfast253:
  %t978 = ashr i64 %a0, 3
  %t979 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t978, i64 %a0)
  %t980 = extractvalue {i64, i1} %t979, 0
  %t981 = extractvalue {i64, i1} %t979, 1
  br i1 %t981, label %fixslow254, label %fixmerge255
fixslow254:
  %t982 = call i64 @rt_mul(i64 %a0, i64 %a0)
  br label %fixmerge255
fixmerge255:
  %t983 = phi i64 [ %t980, %fixfast253 ], [ %t982, %fixslow254 ]
  ret i64 %t983
}

define fastcc i64 @"scheme.base:code:%gcd2"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t988 = icmp eq i64 %argc, 2
  br i1 %t988, label %argok257, label %arityerr256
arityerr256:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok257:
  %t989 = or i64 %a1, 0
  %t990 = and i64 %t989, 7
  %t991 = icmp eq i64 %t990, 0
  br i1 %t991, label %fixfast258, label %fixslow259
fixfast258:
  %t992 = icmp eq i64 %a1, 0
  %t993 = select i1 %t992, i64 257, i64 1
  br label %fixmerge260
fixslow259:
  %t994 = call i64 @rt_num_eq(i64 %a1, i64 0)
  br label %fixmerge260
fixmerge260:
  %t995 = phi i64 [ %t993, %fixfast258 ], [ %t994, %fixslow259 ]
  %t996 = icmp ne i64 %t995, 1
  br i1 %t996, label %then261, label %else262
then261:
  ret i64 %a0
else262:
  %t997 = call i64 @rt_remainder(i64 %a0, i64 %a1)
  %t998 = load i64, ptr @"scheme.base:%gcd2"
  %t999 = and i64 %t998, -8
  %t1000 = inttoptr i64 %t999 to ptr
  %t1001 = load i64, ptr %t1000
  %t1002 = inttoptr i64 %t1001 to ptr
  %t1003 = musttail call fastcc i64 %t1002(i64 %t998, i64 2, i64 %a1, i64 %t997, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1003
}

define fastcc i64 @"scheme.base:code:%gcd-fold"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1008 = icmp eq i64 %argc, 2
  br i1 %t1008, label %argok264, label %arityerr263
arityerr263:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok264:
  %t1009 = call i64 @rt_null_p(i64 %a0)
  %t1010 = icmp ne i64 %t1009, 1
  br i1 %t1010, label %then265, label %else266
then265:
  ret i64 %a1
else266:
  %t1011 = call i64 @rt_cdr(i64 %a0)
  %t1012 = call i64 @rt_car(i64 %a0)
  %t1013 = load i64, ptr @"scheme.base:abs"
  %t1014 = and i64 %t1013, -8
  %t1015 = inttoptr i64 %t1014 to ptr
  %t1016 = load i64, ptr %t1015
  %t1017 = inttoptr i64 %t1016 to ptr
  %t1018 = call fastcc i64%t1017(i64 %t1013, i64 1, i64 %t1012, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1019 = load i64, ptr @"scheme.base:abs"
  %t1020 = and i64 %t1019, -8
  %t1021 = inttoptr i64 %t1020 to ptr
  %t1022 = load i64, ptr %t1021
  %t1023 = inttoptr i64 %t1022 to ptr
  %t1024 = call fastcc i64%t1023(i64 %t1019, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1025 = load i64, ptr @"scheme.base:%gcd2"
  %t1026 = and i64 %t1025, -8
  %t1027 = inttoptr i64 %t1026 to ptr
  %t1028 = load i64, ptr %t1027
  %t1029 = inttoptr i64 %t1028 to ptr
  %t1030 = call fastcc i64%t1029(i64 %t1025, i64 2, i64 %t1018, i64 %t1024, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1031 = load i64, ptr @"scheme.base:%gcd-fold"
  %t1032 = and i64 %t1031, -8
  %t1033 = inttoptr i64 %t1032 to ptr
  %t1034 = load i64, ptr %t1033
  %t1035 = inttoptr i64 %t1034 to ptr
  %t1036 = musttail call fastcc i64 %t1035(i64 %t1031, i64 2, i64 %t1011, i64 %t1030, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1036
}

define fastcc i64 @"scheme.base:code:%lcm-fold"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1041 = icmp eq i64 %argc, 2
  br i1 %t1041, label %argok268, label %arityerr267
arityerr267:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok268:
  %t1042 = call i64 @rt_null_p(i64 %a0)
  %t1043 = icmp ne i64 %t1042, 1
  br i1 %t1043, label %then269, label %else270
then269:
  ret i64 %a1
else270:
  %t1044 = call i64 @rt_car(i64 %a0)
  %t1045 = load i64, ptr @"scheme.base:abs"
  %t1046 = and i64 %t1045, -8
  %t1047 = inttoptr i64 %t1046 to ptr
  %t1048 = load i64, ptr %t1047
  %t1049 = inttoptr i64 %t1048 to ptr
  %t1050 = call fastcc i64%t1049(i64 %t1045, i64 1, i64 %t1044, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1051 = or i64 %t1050, 0
  %t1052 = and i64 %t1051, 7
  %t1053 = icmp eq i64 %t1052, 0
  br i1 %t1053, label %fixfast271, label %fixslow272
fixfast271:
  %t1054 = icmp eq i64 %t1050, 0
  %t1055 = select i1 %t1054, i64 257, i64 1
  br label %fixmerge273
fixslow272:
  %t1056 = call i64 @rt_num_eq(i64 %t1050, i64 0)
  br label %fixmerge273
fixmerge273:
  %t1057 = phi i64 [ %t1055, %fixfast271 ], [ %t1056, %fixslow272 ]
  %t1058 = icmp ne i64 %t1057, 1
  br i1 %t1058, label %then274, label %else275
then274:
  ret i64 0
else275:
  %t1059 = call i64 @rt_cdr(i64 %a0)
  %t1060 = or i64 %a1, %t1050
  %t1061 = and i64 %t1060, 7
  %t1062 = icmp eq i64 %t1061, 0
  br i1 %t1062, label %fixfast276, label %fixslow277
fixfast276:
  %t1063 = ashr i64 %a1, 3
  %t1064 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1063, i64 %t1050)
  %t1065 = extractvalue {i64, i1} %t1064, 0
  %t1066 = extractvalue {i64, i1} %t1064, 1
  br i1 %t1066, label %fixslow277, label %fixmerge278
fixslow277:
  %t1067 = call i64 @rt_mul(i64 %a1, i64 %t1050)
  br label %fixmerge278
fixmerge278:
  %t1068 = phi i64 [ %t1065, %fixfast276 ], [ %t1067, %fixslow277 ]
  %t1069 = load i64, ptr @"scheme.base:%gcd2"
  %t1070 = and i64 %t1069, -8
  %t1071 = inttoptr i64 %t1070 to ptr
  %t1072 = load i64, ptr %t1071
  %t1073 = inttoptr i64 %t1072 to ptr
  %t1074 = call fastcc i64%t1073(i64 %t1069, i64 2, i64 %a1, i64 %t1050, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1075 = call i64 @rt_quotient(i64 %t1068, i64 %t1074)
  %t1076 = load i64, ptr @"scheme.base:%lcm-fold"
  %t1077 = and i64 %t1076, -8
  %t1078 = inttoptr i64 %t1077 to ptr
  %t1079 = load i64, ptr %t1078
  %t1080 = inttoptr i64 %t1079 to ptr
  %t1081 = musttail call fastcc i64 %t1080(i64 %t1076, i64 2, i64 %t1059, i64 %t1075, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1081
}

define fastcc i64 @"scheme.base:code:gcd"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1086 = icmp sge i64 %argc, 0
  br i1 %t1086, label %argok280, label %arityerr279
arityerr279:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok280:
  %t1087 = call ptr @rt_alloc_words(i64 8)
  %t1088 = getelementptr i64, ptr %t1087, i64 0
  store i64 %a0, ptr %t1088
  %t1089 = getelementptr i64, ptr %t1087, i64 1
  store i64 %a1, ptr %t1089
  %t1090 = getelementptr i64, ptr %t1087, i64 2
  store i64 %a2, ptr %t1090
  %t1091 = getelementptr i64, ptr %t1087, i64 3
  store i64 %a3, ptr %t1091
  %t1092 = getelementptr i64, ptr %t1087, i64 4
  store i64 %a4, ptr %t1092
  %t1093 = getelementptr i64, ptr %t1087, i64 5
  store i64 %a5, ptr %t1093
  %t1094 = getelementptr i64, ptr %t1087, i64 6
  store i64 %a6, ptr %t1094
  %t1095 = getelementptr i64, ptr %t1087, i64 7
  store i64 %a7, ptr %t1095
  %t1096 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1087, ptr %overflow)
  %t1097 = load i64, ptr @"scheme.base:%gcd-fold"
  %t1098 = and i64 %t1097, -8
  %t1099 = inttoptr i64 %t1098 to ptr
  %t1100 = load i64, ptr %t1099
  %t1101 = inttoptr i64 %t1100 to ptr
  %t1102 = musttail call fastcc i64 %t1101(i64 %t1097, i64 2, i64 %t1096, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1102
}

define fastcc i64 @"scheme.base:code:lcm"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1107 = icmp sge i64 %argc, 0
  br i1 %t1107, label %argok282, label %arityerr281
arityerr281:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok282:
  %t1108 = call ptr @rt_alloc_words(i64 8)
  %t1109 = getelementptr i64, ptr %t1108, i64 0
  store i64 %a0, ptr %t1109
  %t1110 = getelementptr i64, ptr %t1108, i64 1
  store i64 %a1, ptr %t1110
  %t1111 = getelementptr i64, ptr %t1108, i64 2
  store i64 %a2, ptr %t1111
  %t1112 = getelementptr i64, ptr %t1108, i64 3
  store i64 %a3, ptr %t1112
  %t1113 = getelementptr i64, ptr %t1108, i64 4
  store i64 %a4, ptr %t1113
  %t1114 = getelementptr i64, ptr %t1108, i64 5
  store i64 %a5, ptr %t1114
  %t1115 = getelementptr i64, ptr %t1108, i64 6
  store i64 %a6, ptr %t1115
  %t1116 = getelementptr i64, ptr %t1108, i64 7
  store i64 %a7, ptr %t1116
  %t1117 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1108, ptr %overflow)
  %t1118 = load i64, ptr @"scheme.base:%lcm-fold"
  %t1119 = and i64 %t1118, -8
  %t1120 = inttoptr i64 %t1119 to ptr
  %t1121 = load i64, ptr %t1120
  %t1122 = inttoptr i64 %t1121 to ptr
  %t1123 = musttail call fastcc i64 %t1122(i64 %t1118, i64 2, i64 %t1117, i64 8, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1123
}

define fastcc i64 @"scheme.base:code:%expt-exact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1128 = icmp eq i64 %argc, 3
  br i1 %t1128, label %argok284, label %arityerr283
arityerr283:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok284:
  %t1129 = or i64 %a1, 0
  %t1130 = and i64 %t1129, 7
  %t1131 = icmp eq i64 %t1130, 0
  br i1 %t1131, label %fixfast285, label %fixslow286
fixfast285:
  %t1132 = icmp eq i64 %a1, 0
  %t1133 = select i1 %t1132, i64 257, i64 1
  br label %fixmerge287
fixslow286:
  %t1134 = call i64 @rt_num_eq(i64 %a1, i64 0)
  br label %fixmerge287
fixmerge287:
  %t1135 = phi i64 [ %t1133, %fixfast285 ], [ %t1134, %fixslow286 ]
  %t1136 = icmp ne i64 %t1135, 1
  br i1 %t1136, label %then288, label %else289
then288:
  ret i64 %a2
else289:
  %t1137 = or i64 %a0, %a0
  %t1138 = and i64 %t1137, 7
  %t1139 = icmp eq i64 %t1138, 0
  br i1 %t1139, label %fixfast290, label %fixslow291
fixfast290:
  %t1140 = ashr i64 %a0, 3
  %t1141 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1140, i64 %a0)
  %t1142 = extractvalue {i64, i1} %t1141, 0
  %t1143 = extractvalue {i64, i1} %t1141, 1
  br i1 %t1143, label %fixslow291, label %fixmerge292
fixslow291:
  %t1144 = call i64 @rt_mul(i64 %a0, i64 %a0)
  br label %fixmerge292
fixmerge292:
  %t1145 = phi i64 [ %t1142, %fixfast290 ], [ %t1144, %fixslow291 ]
  %t1146 = call i64 @rt_quotient(i64 %a1, i64 16)
  %t1147 = load i64, ptr @"scheme.base:odd?"
  %t1148 = and i64 %t1147, -8
  %t1149 = inttoptr i64 %t1148 to ptr
  %t1150 = load i64, ptr %t1149
  %t1151 = inttoptr i64 %t1150 to ptr
  %t1152 = call fastcc i64%t1151(i64 %t1147, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1153 = icmp ne i64 %t1152, 1
  br i1 %t1153, label %then293, label %else294
then293:
  %t1154 = or i64 %a2, %a0
  %t1155 = and i64 %t1154, 7
  %t1156 = icmp eq i64 %t1155, 0
  br i1 %t1156, label %fixfast296, label %fixslow297
fixfast296:
  %t1157 = ashr i64 %a2, 3
  %t1158 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1157, i64 %a0)
  %t1159 = extractvalue {i64, i1} %t1158, 0
  %t1160 = extractvalue {i64, i1} %t1158, 1
  br i1 %t1160, label %fixslow297, label %fixmerge298
fixslow297:
  %t1161 = call i64 @rt_mul(i64 %a2, i64 %a0)
  br label %fixmerge298
fixmerge298:
  %t1162 = phi i64 [ %t1159, %fixfast296 ], [ %t1161, %fixslow297 ]
  br label %merge295
else294:
  br label %merge295
merge295:
  %t1163 = phi i64 [ %t1162, %fixmerge298 ], [ %a2, %else294 ]
  %t1164 = load i64, ptr @"scheme.base:%expt-exact"
  %t1165 = and i64 %t1164, -8
  %t1166 = inttoptr i64 %t1165 to ptr
  %t1167 = load i64, ptr %t1166
  %t1168 = inttoptr i64 %t1167 to ptr
  %t1169 = musttail call fastcc i64 %t1168(i64 %t1164, i64 3, i64 %t1145, i64 %t1146, i64 %t1163, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1169
}

define fastcc i64 @"scheme.base:code:expt"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1174 = icmp eq i64 %argc, 2
  br i1 %t1174, label %argok300, label %arityerr299
arityerr299:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok300:
  %t1175 = call i64 @rt_exact_p(i64 %a1)
  %t1176 = icmp ne i64 %t1175, 1
  br i1 %t1176, label %then301, label %else302
then301:
  %t1177 = or i64 %a1, 0
  %t1178 = and i64 %t1177, 7
  %t1179 = icmp eq i64 %t1178, 0
  br i1 %t1179, label %fixfast303, label %fixslow304
fixfast303:
  %t1180 = icmp slt i64 %a1, 0
  %t1181 = select i1 %t1180, i64 257, i64 1
  br label %fixmerge305
fixslow304:
  %t1182 = call i64 @rt_lt(i64 %a1, i64 0)
  br label %fixmerge305
fixmerge305:
  %t1183 = phi i64 [ %t1181, %fixfast303 ], [ %t1182, %fixslow304 ]
  %t1184 = icmp ne i64 %t1183, 1
  br i1 %t1184, label %then306, label %else307
then306:
  %t1185 = call i64 @rt_pow(i64 %a0, i64 %a1)
  ret i64 %t1185
else307:
  %t1186 = call i64 @rt_exact_p(i64 %a0)
  %t1187 = icmp ne i64 %t1186, 1
  br i1 %t1187, label %then308, label %else309
then308:
  %t1188 = load i64, ptr @"scheme.base:%expt-exact"
  %t1189 = and i64 %t1188, -8
  %t1190 = inttoptr i64 %t1189 to ptr
  %t1191 = load i64, ptr %t1190
  %t1192 = inttoptr i64 %t1191 to ptr
  %t1193 = musttail call fastcc i64 %t1192(i64 %t1188, i64 3, i64 %a0, i64 %a1, i64 8, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1193
else309:
  %t1194 = call i64 @rt_flonum_lit(ptr @.flo.lit.0)
  %t1195 = load i64, ptr @"scheme.base:%expt-exact"
  %t1196 = and i64 %t1195, -8
  %t1197 = inttoptr i64 %t1196 to ptr
  %t1198 = load i64, ptr %t1197
  %t1199 = inttoptr i64 %t1198 to ptr
  %t1200 = musttail call fastcc i64 %t1199(i64 %t1195, i64 3, i64 %a0, i64 %a1, i64 %t1194, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1200
else302:
  %t1201 = call i64 @rt_pow(i64 %a0, i64 %a1)
  ret i64 %t1201
}

define fastcc i64 @"scheme.base:code:%isqrt-loop"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1206 = icmp eq i64 %argc, 2
  br i1 %t1206, label %argok311, label %arityerr310
arityerr310:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok311:
  %t1207 = call i64 @rt_quotient(i64 %a0, i64 %a1)
  %t1208 = or i64 %a1, %t1207
  %t1209 = and i64 %t1208, 7
  %t1210 = icmp eq i64 %t1209, 0
  br i1 %t1210, label %fixfast312, label %fixslow313
fixfast312:
  %t1211 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t1207)
  %t1212 = extractvalue {i64, i1} %t1211, 0
  %t1213 = extractvalue {i64, i1} %t1211, 1
  br i1 %t1213, label %fixslow313, label %fixmerge314
fixslow313:
  %t1214 = call i64 @rt_add(i64 %a1, i64 %t1207)
  br label %fixmerge314
fixmerge314:
  %t1215 = phi i64 [ %t1212, %fixfast312 ], [ %t1214, %fixslow313 ]
  %t1216 = call i64 @rt_quotient(i64 %t1215, i64 16)
  %t1217 = or i64 %t1216, %a1
  %t1218 = and i64 %t1217, 7
  %t1219 = icmp eq i64 %t1218, 0
  br i1 %t1219, label %fixfast315, label %fixslow316
fixfast315:
  %t1220 = icmp slt i64 %t1216, %a1
  %t1221 = select i1 %t1220, i64 257, i64 1
  br label %fixmerge317
fixslow316:
  %t1222 = call i64 @rt_lt(i64 %t1216, i64 %a1)
  br label %fixmerge317
fixmerge317:
  %t1223 = phi i64 [ %t1221, %fixfast315 ], [ %t1222, %fixslow316 ]
  %t1224 = icmp ne i64 %t1223, 1
  br i1 %t1224, label %then318, label %else319
then318:
  %t1225 = load i64, ptr @"scheme.base:%isqrt-loop"
  %t1226 = and i64 %t1225, -8
  %t1227 = inttoptr i64 %t1226 to ptr
  %t1228 = load i64, ptr %t1227
  %t1229 = inttoptr i64 %t1228 to ptr
  %t1230 = musttail call fastcc i64 %t1229(i64 %t1225, i64 2, i64 %a0, i64 %t1216, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1230
else319:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:%isqrt"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1235 = icmp eq i64 %argc, 1
  br i1 %t1235, label %argok321, label %arityerr320
arityerr320:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok321:
  %t1236 = or i64 %a0, 0
  %t1237 = and i64 %t1236, 7
  %t1238 = icmp eq i64 %t1237, 0
  br i1 %t1238, label %fixfast322, label %fixslow323
fixfast322:
  %t1239 = icmp eq i64 %a0, 0
  %t1240 = select i1 %t1239, i64 257, i64 1
  br label %fixmerge324
fixslow323:
  %t1241 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge324
fixmerge324:
  %t1242 = phi i64 [ %t1240, %fixfast322 ], [ %t1241, %fixslow323 ]
  %t1243 = icmp ne i64 %t1242, 1
  br i1 %t1243, label %then325, label %else326
then325:
  ret i64 0
else326:
  %t1244 = load i64, ptr @"scheme.base:%isqrt-loop"
  %t1245 = and i64 %t1244, -8
  %t1246 = inttoptr i64 %t1245 to ptr
  %t1247 = load i64, ptr %t1246
  %t1248 = inttoptr i64 %t1247 to ptr
  %t1249 = musttail call fastcc i64 %t1248(i64 %t1244, i64 2, i64 %a0, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1249
}

define fastcc i64 @"scheme.base:code:exact-integer-sqrt"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1254 = icmp eq i64 %argc, 1
  br i1 %t1254, label %argok328, label %arityerr327
arityerr327:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok328:
  %t1255 = load i64, ptr @"scheme.base:%isqrt"
  %t1256 = and i64 %t1255, -8
  %t1257 = inttoptr i64 %t1256 to ptr
  %t1258 = load i64, ptr %t1257
  %t1259 = inttoptr i64 %t1258 to ptr
  %t1260 = call fastcc i64%t1259(i64 %t1255, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1261 = or i64 %t1260, %t1260
  %t1262 = and i64 %t1261, 7
  %t1263 = icmp eq i64 %t1262, 0
  br i1 %t1263, label %fixfast329, label %fixslow330
fixfast329:
  %t1264 = ashr i64 %t1260, 3
  %t1265 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1264, i64 %t1260)
  %t1266 = extractvalue {i64, i1} %t1265, 0
  %t1267 = extractvalue {i64, i1} %t1265, 1
  br i1 %t1267, label %fixslow330, label %fixmerge331
fixslow330:
  %t1268 = call i64 @rt_mul(i64 %t1260, i64 %t1260)
  br label %fixmerge331
fixmerge331:
  %t1269 = phi i64 [ %t1266, %fixfast329 ], [ %t1268, %fixslow330 ]
  %t1270 = or i64 %a0, %t1269
  %t1271 = and i64 %t1270, 7
  %t1272 = icmp eq i64 %t1271, 0
  br i1 %t1272, label %fixfast332, label %fixslow333
fixfast332:
  %t1273 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t1269)
  %t1274 = extractvalue {i64, i1} %t1273, 0
  %t1275 = extractvalue {i64, i1} %t1273, 1
  br i1 %t1275, label %fixslow333, label %fixmerge334
fixslow333:
  %t1276 = call i64 @rt_sub(i64 %a0, i64 %t1269)
  br label %fixmerge334
fixmerge334:
  %t1277 = phi i64 [ %t1274, %fixfast332 ], [ %t1276, %fixslow333 ]
  %t1278 = load i64, ptr @"scheme.base:values"
  %t1279 = and i64 %t1278, -8
  %t1280 = inttoptr i64 %t1279 to ptr
  %t1281 = load i64, ptr %t1280
  %t1282 = inttoptr i64 %t1281 to ptr
  %t1283 = musttail call fastcc i64 %t1282(i64 %t1278, i64 2, i64 %t1260, i64 %t1277, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1283
}

define fastcc i64 @"scheme.base:code:floor"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1288 = icmp eq i64 %argc, 1
  br i1 %t1288, label %argok336, label %arityerr335
arityerr335:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok336:
  %t1289 = call i64 @rt_exact_p(i64 %a0)
  %t1290 = icmp ne i64 %t1289, 1
  br i1 %t1290, label %then337, label %else338
then337:
  ret i64 %a0
else338:
  %t1291 = call i64 @rt_flo_floor(i64 %a0)
  ret i64 %t1291
}

define fastcc i64 @"scheme.base:code:ceiling"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1296 = icmp eq i64 %argc, 1
  br i1 %t1296, label %argok340, label %arityerr339
arityerr339:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok340:
  %t1297 = call i64 @rt_exact_p(i64 %a0)
  %t1298 = icmp ne i64 %t1297, 1
  br i1 %t1298, label %then341, label %else342
then341:
  ret i64 %a0
else342:
  %t1299 = call i64 @rt_flo_ceiling(i64 %a0)
  ret i64 %t1299
}

define fastcc i64 @"scheme.base:code:truncate"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1304 = icmp eq i64 %argc, 1
  br i1 %t1304, label %argok344, label %arityerr343
arityerr343:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok344:
  %t1305 = call i64 @rt_exact_p(i64 %a0)
  %t1306 = icmp ne i64 %t1305, 1
  br i1 %t1306, label %then345, label %else346
then345:
  ret i64 %a0
else346:
  %t1307 = call i64 @rt_flo_truncate(i64 %a0)
  ret i64 %t1307
}

define fastcc i64 @"scheme.base:code:round"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1312 = icmp eq i64 %argc, 1
  br i1 %t1312, label %argok348, label %arityerr347
arityerr347:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok348:
  %t1313 = call i64 @rt_exact_p(i64 %a0)
  %t1314 = icmp ne i64 %t1313, 1
  br i1 %t1314, label %then349, label %else350
then349:
  ret i64 %a0
else350:
  %t1315 = call i64 @rt_flo_round(i64 %a0)
  ret i64 %t1315
}

define fastcc i64 @"scheme.base:code:truncate-quotient"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1320 = icmp eq i64 %argc, 2
  br i1 %t1320, label %argok352, label %arityerr351
arityerr351:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok352:
  %t1321 = call i64 @rt_quotient(i64 %a0, i64 %a1)
  ret i64 %t1321
}

define fastcc i64 @"scheme.base:code:truncate-remainder"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1326 = icmp eq i64 %argc, 2
  br i1 %t1326, label %argok354, label %arityerr353
arityerr353:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok354:
  %t1327 = call i64 @rt_remainder(i64 %a0, i64 %a1)
  ret i64 %t1327
}

define fastcc i64 @"scheme.base:code:floor-remainder"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1332 = icmp eq i64 %argc, 2
  br i1 %t1332, label %argok356, label %arityerr355
arityerr355:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok356:
  %t1333 = call i64 @rt_modulo(i64 %a0, i64 %a1)
  ret i64 %t1333
}

define fastcc i64 @"scheme.base:code:floor-quotient"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1338 = icmp eq i64 %argc, 2
  br i1 %t1338, label %argok358, label %arityerr357
arityerr357:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok358:
  %t1339 = call i64 @rt_modulo(i64 %a0, i64 %a1)
  %t1340 = or i64 %a0, %t1339
  %t1341 = and i64 %t1340, 7
  %t1342 = icmp eq i64 %t1341, 0
  br i1 %t1342, label %fixfast359, label %fixslow360
fixfast359:
  %t1343 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t1339)
  %t1344 = extractvalue {i64, i1} %t1343, 0
  %t1345 = extractvalue {i64, i1} %t1343, 1
  br i1 %t1345, label %fixslow360, label %fixmerge361
fixslow360:
  %t1346 = call i64 @rt_sub(i64 %a0, i64 %t1339)
  br label %fixmerge361
fixmerge361:
  %t1347 = phi i64 [ %t1344, %fixfast359 ], [ %t1346, %fixslow360 ]
  %t1348 = call i64 @rt_quotient(i64 %t1347, i64 %a1)
  ret i64 %t1348
}

define fastcc i64 @"scheme.base:code:truncate/"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1353 = icmp eq i64 %argc, 2
  br i1 %t1353, label %argok363, label %arityerr362
arityerr362:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok363:
  %t1354 = call i64 @rt_quotient(i64 %a0, i64 %a1)
  %t1355 = call i64 @rt_remainder(i64 %a0, i64 %a1)
  %t1356 = load i64, ptr @"scheme.base:values"
  %t1357 = and i64 %t1356, -8
  %t1358 = inttoptr i64 %t1357 to ptr
  %t1359 = load i64, ptr %t1358
  %t1360 = inttoptr i64 %t1359 to ptr
  %t1361 = musttail call fastcc i64 %t1360(i64 %t1356, i64 2, i64 %t1354, i64 %t1355, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1361
}

define fastcc i64 @"scheme.base:code:floor/"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1366 = icmp eq i64 %argc, 2
  br i1 %t1366, label %argok365, label %arityerr364
arityerr364:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok365:
  %t1367 = load i64, ptr @"scheme.base:floor-quotient"
  %t1368 = and i64 %t1367, -8
  %t1369 = inttoptr i64 %t1368 to ptr
  %t1370 = load i64, ptr %t1369
  %t1371 = inttoptr i64 %t1370 to ptr
  %t1372 = call fastcc i64%t1371(i64 %t1367, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1373 = call i64 @rt_modulo(i64 %a0, i64 %a1)
  %t1374 = load i64, ptr @"scheme.base:values"
  %t1375 = and i64 %t1374, -8
  %t1376 = inttoptr i64 %t1375 to ptr
  %t1377 = load i64, ptr %t1376
  %t1378 = inttoptr i64 %t1377 to ptr
  %t1379 = musttail call fastcc i64 %t1378(i64 %t1374, i64 2, i64 %t1372, i64 %t1373, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1379
}

define fastcc i64 @"scheme.base:code:numerator"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1384 = icmp eq i64 %argc, 1
  br i1 %t1384, label %argok367, label %arityerr366
arityerr366:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok367:
  %t1385 = call i64 @rt_integer_p(i64 %a0)
  %t1386 = icmp ne i64 %t1385, 1
  br i1 %t1386, label %then368, label %else369
then368:
  ret i64 %a0
else369:
  %t1387 = call i64 @rt_make_string(ptr @.str.lit.1, i64 25)
  %t1388 = load i64, ptr @"scheme.base:error"
  %t1389 = and i64 %t1388, -8
  %t1390 = inttoptr i64 %t1389 to ptr
  %t1391 = load i64, ptr %t1390
  %t1392 = inttoptr i64 %t1391 to ptr
  %t1393 = musttail call fastcc i64 %t1392(i64 %t1388, i64 2, i64 %t1387, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1393
}

define fastcc i64 @"scheme.base:code:denominator"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1398 = icmp eq i64 %argc, 1
  br i1 %t1398, label %argok371, label %arityerr370
arityerr370:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok371:
  %t1399 = call i64 @rt_integer_p(i64 %a0)
  %t1400 = icmp ne i64 %t1399, 1
  br i1 %t1400, label %then372, label %else373
then372:
  %t1401 = call i64 @rt_exact_p(i64 %a0)
  %t1402 = icmp ne i64 %t1401, 1
  br i1 %t1402, label %then374, label %else375
then374:
  ret i64 8
else375:
  %t1403 = call i64 @rt_flonum_lit(ptr @.flo.lit.2)
  ret i64 %t1403
else373:
  %t1404 = call i64 @rt_make_string(ptr @.str.lit.3, i64 27)
  %t1405 = load i64, ptr @"scheme.base:error"
  %t1406 = and i64 %t1405, -8
  %t1407 = inttoptr i64 %t1406 to ptr
  %t1408 = load i64, ptr %t1407
  %t1409 = inttoptr i64 %t1408 to ptr
  %t1410 = musttail call fastcc i64 %t1409(i64 %t1405, i64 2, i64 %t1404, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1410
}

define fastcc i64 @"scheme.base:code:inexact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1415 = icmp eq i64 %argc, 1
  br i1 %t1415, label %argok377, label %arityerr376
arityerr376:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok377:
  %t1416 = call i64 @rt_exact_to_inexact(i64 %a0)
  ret i64 %t1416
}

define fastcc i64 @"scheme.base:code:exact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1421 = icmp eq i64 %argc, 1
  br i1 %t1421, label %argok379, label %arityerr378
arityerr378:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok379:
  %t1422 = call i64 @rt_inexact_to_exact(i64 %a0)
  ret i64 %t1422
}

define fastcc i64 @"scheme.base:code:void"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1427 = icmp eq i64 %argc, 0
  br i1 %t1427, label %argok381, label %arityerr380
arityerr380:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok381:
  %t1428 = icmp ne i64 1, 1
  br i1 %t1428, label %then382, label %else383
then382:
  ret i64 1
else383:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1433 = icmp sge i64 %argc, 0
  br i1 %t1433, label %argok385, label %arityerr384
arityerr384:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok385:
  %t1434 = call ptr @rt_alloc_words(i64 8)
  %t1435 = getelementptr i64, ptr %t1434, i64 0
  store i64 %a0, ptr %t1435
  %t1436 = getelementptr i64, ptr %t1434, i64 1
  store i64 %a1, ptr %t1436
  %t1437 = getelementptr i64, ptr %t1434, i64 2
  store i64 %a2, ptr %t1437
  %t1438 = getelementptr i64, ptr %t1434, i64 3
  store i64 %a3, ptr %t1438
  %t1439 = getelementptr i64, ptr %t1434, i64 4
  store i64 %a4, ptr %t1439
  %t1440 = getelementptr i64, ptr %t1434, i64 5
  store i64 %a5, ptr %t1440
  %t1441 = getelementptr i64, ptr %t1434, i64 6
  store i64 %a6, ptr %t1441
  %t1442 = getelementptr i64, ptr %t1434, i64 7
  store i64 %a7, ptr %t1442
  %t1443 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1434, ptr %overflow)
  %t1444 = call i64 @rt_list_to_string(i64 %t1443)
  ret i64 %t1444
}

define fastcc i64 @"scheme.base:code:%str-concat"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1449 = icmp eq i64 %argc, 1
  br i1 %t1449, label %argok387, label %arityerr386
arityerr386:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok387:
  %t1450 = call i64 @rt_null_p(i64 %a0)
  %t1451 = icmp ne i64 %t1450, 1
  br i1 %t1451, label %then388, label %else389
then388:
  %t1452 = call i64 @rt_make_string(ptr @.str.lit.4, i64 0)
  ret i64 %t1452
else389:
  %t1453 = call i64 @rt_car(i64 %a0)
  %t1454 = call i64 @rt_cdr(i64 %a0)
  %t1455 = load i64, ptr @"scheme.base:%str-concat"
  %t1456 = and i64 %t1455, -8
  %t1457 = inttoptr i64 %t1456 to ptr
  %t1458 = load i64, ptr %t1457
  %t1459 = inttoptr i64 %t1458 to ptr
  %t1460 = call fastcc i64%t1459(i64 %t1455, i64 1, i64 %t1454, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1461 = call i64 @rt_string_append(i64 %t1453, i64 %t1460)
  ret i64 %t1461
}

define fastcc i64 @"scheme.base:code:chr-cmp"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1466 = icmp eq i64 %argc, 4
  br i1 %t1466, label %argok391, label %arityerr390
arityerr390:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok391:
  %t1467 = call i64 @rt_char_to_integer(i64 %a1)
  %t1468 = call i64 @rt_char_to_integer(i64 %a2)
  %t1469 = and i64 %a0, -8
  %t1470 = inttoptr i64 %t1469 to ptr
  %t1471 = load i64, ptr %t1470
  %t1472 = inttoptr i64 %t1471 to ptr
  %t1473 = call fastcc i64%t1472(i64 %a0, i64 2, i64 %t1467, i64 %t1468, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1474 = icmp ne i64 %t1473, 1
  br i1 %t1474, label %then392, label %else393
then392:
  %t1475 = call i64 @rt_null_p(i64 %a3)
  %t1476 = icmp ne i64 %t1475, 1
  br i1 %t1476, label %then394, label %else395
then394:
  ret i64 257
else395:
  %t1477 = call i64 @rt_car(i64 %a3)
  %t1478 = call i64 @rt_cdr(i64 %a3)
  %t1479 = load i64, ptr @"scheme.base:chr-cmp"
  %t1480 = and i64 %t1479, -8
  %t1481 = inttoptr i64 %t1480 to ptr
  %t1482 = load i64, ptr %t1481
  %t1483 = inttoptr i64 %t1482 to ptr
  %t1484 = musttail call fastcc i64 %t1483(i64 %t1479, i64 4, i64 %a0, i64 %a2, i64 %t1477, i64 %t1478, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1484
else393:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_315"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1489 = icmp eq i64 %argc, 2
  br i1 %t1489, label %argok397, label %arityerr396
arityerr396:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok397:
  %t1490 = or i64 %a0, %a1
  %t1491 = and i64 %t1490, 7
  %t1492 = icmp eq i64 %t1491, 0
  br i1 %t1492, label %fixfast398, label %fixslow399
fixfast398:
  %t1493 = icmp eq i64 %a0, %a1
  %t1494 = select i1 %t1493, i64 257, i64 1
  br label %fixmerge400
fixslow399:
  %t1495 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge400
fixmerge400:
  %t1496 = phi i64 [ %t1494, %fixfast398 ], [ %t1495, %fixslow399 ]
  ret i64 %t1496
}

define fastcc i64 @"scheme.base:code:char=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1497 = icmp sge i64 %argc, 2
  br i1 %t1497, label %argok402, label %arityerr401
arityerr401:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok402:
  %t1498 = call ptr @rt_alloc_words(i64 8)
  %t1499 = getelementptr i64, ptr %t1498, i64 0
  store i64 %a0, ptr %t1499
  %t1500 = getelementptr i64, ptr %t1498, i64 1
  store i64 %a1, ptr %t1500
  %t1501 = getelementptr i64, ptr %t1498, i64 2
  store i64 %a2, ptr %t1501
  %t1502 = getelementptr i64, ptr %t1498, i64 3
  store i64 %a3, ptr %t1502
  %t1503 = getelementptr i64, ptr %t1498, i64 4
  store i64 %a4, ptr %t1503
  %t1504 = getelementptr i64, ptr %t1498, i64 5
  store i64 %a5, ptr %t1504
  %t1505 = getelementptr i64, ptr %t1498, i64 6
  store i64 %a6, ptr %t1505
  %t1506 = getelementptr i64, ptr %t1498, i64 7
  store i64 %a7, ptr %t1506
  %t1507 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1498, ptr %overflow)
  %t1508 = call ptr @rt_alloc_words(i64 1)
  %t1509 = ptrtoint ptr %t1508 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_315" to i64), ptr %t1508
  %t1510 = or i64 %t1509, 4
  %t1511 = load i64, ptr @"scheme.base:chr-cmp"
  %t1512 = and i64 %t1511, -8
  %t1513 = inttoptr i64 %t1512 to ptr
  %t1514 = load i64, ptr %t1513
  %t1515 = inttoptr i64 %t1514 to ptr
  %t1516 = musttail call fastcc i64 %t1515(i64 %t1511, i64 4, i64 %t1510, i64 %a0, i64 %a1, i64 %t1507, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1516
}

define fastcc i64 @"scheme.base:code_327"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1521 = icmp eq i64 %argc, 2
  br i1 %t1521, label %argok404, label %arityerr403
arityerr403:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok404:
  %t1522 = or i64 %a0, %a1
  %t1523 = and i64 %t1522, 7
  %t1524 = icmp eq i64 %t1523, 0
  br i1 %t1524, label %fixfast405, label %fixslow406
fixfast405:
  %t1525 = icmp slt i64 %a0, %a1
  %t1526 = select i1 %t1525, i64 257, i64 1
  br label %fixmerge407
fixslow406:
  %t1527 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge407
fixmerge407:
  %t1528 = phi i64 [ %t1526, %fixfast405 ], [ %t1527, %fixslow406 ]
  ret i64 %t1528
}

define fastcc i64 @"scheme.base:code:char<?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1529 = icmp sge i64 %argc, 2
  br i1 %t1529, label %argok409, label %arityerr408
arityerr408:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok409:
  %t1530 = call ptr @rt_alloc_words(i64 8)
  %t1531 = getelementptr i64, ptr %t1530, i64 0
  store i64 %a0, ptr %t1531
  %t1532 = getelementptr i64, ptr %t1530, i64 1
  store i64 %a1, ptr %t1532
  %t1533 = getelementptr i64, ptr %t1530, i64 2
  store i64 %a2, ptr %t1533
  %t1534 = getelementptr i64, ptr %t1530, i64 3
  store i64 %a3, ptr %t1534
  %t1535 = getelementptr i64, ptr %t1530, i64 4
  store i64 %a4, ptr %t1535
  %t1536 = getelementptr i64, ptr %t1530, i64 5
  store i64 %a5, ptr %t1536
  %t1537 = getelementptr i64, ptr %t1530, i64 6
  store i64 %a6, ptr %t1537
  %t1538 = getelementptr i64, ptr %t1530, i64 7
  store i64 %a7, ptr %t1538
  %t1539 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1530, ptr %overflow)
  %t1540 = call ptr @rt_alloc_words(i64 1)
  %t1541 = ptrtoint ptr %t1540 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_327" to i64), ptr %t1540
  %t1542 = or i64 %t1541, 4
  %t1543 = load i64, ptr @"scheme.base:chr-cmp"
  %t1544 = and i64 %t1543, -8
  %t1545 = inttoptr i64 %t1544 to ptr
  %t1546 = load i64, ptr %t1545
  %t1547 = inttoptr i64 %t1546 to ptr
  %t1548 = musttail call fastcc i64 %t1547(i64 %t1543, i64 4, i64 %t1542, i64 %a0, i64 %a1, i64 %t1539, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1548
}

define fastcc i64 @"scheme.base:code_339"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1553 = icmp eq i64 %argc, 2
  br i1 %t1553, label %argok411, label %arityerr410
arityerr410:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok411:
  %t1554 = or i64 %a1, %a0
  %t1555 = and i64 %t1554, 7
  %t1556 = icmp eq i64 %t1555, 0
  br i1 %t1556, label %fixfast412, label %fixslow413
fixfast412:
  %t1557 = icmp slt i64 %a1, %a0
  %t1558 = select i1 %t1557, i64 257, i64 1
  br label %fixmerge414
fixslow413:
  %t1559 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge414
fixmerge414:
  %t1560 = phi i64 [ %t1558, %fixfast412 ], [ %t1559, %fixslow413 ]
  ret i64 %t1560
}

define fastcc i64 @"scheme.base:code:char>?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1561 = icmp sge i64 %argc, 2
  br i1 %t1561, label %argok416, label %arityerr415
arityerr415:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok416:
  %t1562 = call ptr @rt_alloc_words(i64 8)
  %t1563 = getelementptr i64, ptr %t1562, i64 0
  store i64 %a0, ptr %t1563
  %t1564 = getelementptr i64, ptr %t1562, i64 1
  store i64 %a1, ptr %t1564
  %t1565 = getelementptr i64, ptr %t1562, i64 2
  store i64 %a2, ptr %t1565
  %t1566 = getelementptr i64, ptr %t1562, i64 3
  store i64 %a3, ptr %t1566
  %t1567 = getelementptr i64, ptr %t1562, i64 4
  store i64 %a4, ptr %t1567
  %t1568 = getelementptr i64, ptr %t1562, i64 5
  store i64 %a5, ptr %t1568
  %t1569 = getelementptr i64, ptr %t1562, i64 6
  store i64 %a6, ptr %t1569
  %t1570 = getelementptr i64, ptr %t1562, i64 7
  store i64 %a7, ptr %t1570
  %t1571 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1562, ptr %overflow)
  %t1572 = call ptr @rt_alloc_words(i64 1)
  %t1573 = ptrtoint ptr %t1572 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_339" to i64), ptr %t1572
  %t1574 = or i64 %t1573, 4
  %t1575 = load i64, ptr @"scheme.base:chr-cmp"
  %t1576 = and i64 %t1575, -8
  %t1577 = inttoptr i64 %t1576 to ptr
  %t1578 = load i64, ptr %t1577
  %t1579 = inttoptr i64 %t1578 to ptr
  %t1580 = musttail call fastcc i64 %t1579(i64 %t1575, i64 4, i64 %t1574, i64 %a0, i64 %a1, i64 %t1571, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1580
}

define fastcc i64 @"scheme.base:code_351"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1585 = icmp eq i64 %argc, 2
  br i1 %t1585, label %argok418, label %arityerr417
arityerr417:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok418:
  %t1586 = or i64 %a0, %a1
  %t1587 = and i64 %t1586, 7
  %t1588 = icmp eq i64 %t1587, 0
  br i1 %t1588, label %fixfast419, label %fixslow420
fixfast419:
  %t1589 = icmp slt i64 %a0, %a1
  %t1590 = select i1 %t1589, i64 257, i64 1
  br label %fixmerge421
fixslow420:
  %t1591 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge421
fixmerge421:
  %t1592 = phi i64 [ %t1590, %fixfast419 ], [ %t1591, %fixslow420 ]
  %t1593 = icmp ne i64 %t1592, 1
  br i1 %t1593, label %then422, label %else423
then422:
  ret i64 257
else423:
  %t1594 = or i64 %a0, %a1
  %t1595 = and i64 %t1594, 7
  %t1596 = icmp eq i64 %t1595, 0
  br i1 %t1596, label %fixfast424, label %fixslow425
fixfast424:
  %t1597 = icmp eq i64 %a0, %a1
  %t1598 = select i1 %t1597, i64 257, i64 1
  br label %fixmerge426
fixslow425:
  %t1599 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge426
fixmerge426:
  %t1600 = phi i64 [ %t1598, %fixfast424 ], [ %t1599, %fixslow425 ]
  ret i64 %t1600
}

define fastcc i64 @"scheme.base:code:char<=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1601 = icmp sge i64 %argc, 2
  br i1 %t1601, label %argok428, label %arityerr427
arityerr427:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok428:
  %t1602 = call ptr @rt_alloc_words(i64 8)
  %t1603 = getelementptr i64, ptr %t1602, i64 0
  store i64 %a0, ptr %t1603
  %t1604 = getelementptr i64, ptr %t1602, i64 1
  store i64 %a1, ptr %t1604
  %t1605 = getelementptr i64, ptr %t1602, i64 2
  store i64 %a2, ptr %t1605
  %t1606 = getelementptr i64, ptr %t1602, i64 3
  store i64 %a3, ptr %t1606
  %t1607 = getelementptr i64, ptr %t1602, i64 4
  store i64 %a4, ptr %t1607
  %t1608 = getelementptr i64, ptr %t1602, i64 5
  store i64 %a5, ptr %t1608
  %t1609 = getelementptr i64, ptr %t1602, i64 6
  store i64 %a6, ptr %t1609
  %t1610 = getelementptr i64, ptr %t1602, i64 7
  store i64 %a7, ptr %t1610
  %t1611 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1602, ptr %overflow)
  %t1612 = call ptr @rt_alloc_words(i64 1)
  %t1613 = ptrtoint ptr %t1612 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_351" to i64), ptr %t1612
  %t1614 = or i64 %t1613, 4
  %t1615 = load i64, ptr @"scheme.base:chr-cmp"
  %t1616 = and i64 %t1615, -8
  %t1617 = inttoptr i64 %t1616 to ptr
  %t1618 = load i64, ptr %t1617
  %t1619 = inttoptr i64 %t1618 to ptr
  %t1620 = musttail call fastcc i64 %t1619(i64 %t1615, i64 4, i64 %t1614, i64 %a0, i64 %a1, i64 %t1611, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1620
}

define fastcc i64 @"scheme.base:code_363"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1625 = icmp eq i64 %argc, 2
  br i1 %t1625, label %argok430, label %arityerr429
arityerr429:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok430:
  %t1626 = or i64 %a1, %a0
  %t1627 = and i64 %t1626, 7
  %t1628 = icmp eq i64 %t1627, 0
  br i1 %t1628, label %fixfast431, label %fixslow432
fixfast431:
  %t1629 = icmp slt i64 %a1, %a0
  %t1630 = select i1 %t1629, i64 257, i64 1
  br label %fixmerge433
fixslow432:
  %t1631 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge433
fixmerge433:
  %t1632 = phi i64 [ %t1630, %fixfast431 ], [ %t1631, %fixslow432 ]
  %t1633 = icmp ne i64 %t1632, 1
  br i1 %t1633, label %then434, label %else435
then434:
  ret i64 257
else435:
  %t1634 = or i64 %a0, %a1
  %t1635 = and i64 %t1634, 7
  %t1636 = icmp eq i64 %t1635, 0
  br i1 %t1636, label %fixfast436, label %fixslow437
fixfast436:
  %t1637 = icmp eq i64 %a0, %a1
  %t1638 = select i1 %t1637, i64 257, i64 1
  br label %fixmerge438
fixslow437:
  %t1639 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge438
fixmerge438:
  %t1640 = phi i64 [ %t1638, %fixfast436 ], [ %t1639, %fixslow437 ]
  ret i64 %t1640
}

define fastcc i64 @"scheme.base:code:char>=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1641 = icmp sge i64 %argc, 2
  br i1 %t1641, label %argok440, label %arityerr439
arityerr439:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok440:
  %t1642 = call ptr @rt_alloc_words(i64 8)
  %t1643 = getelementptr i64, ptr %t1642, i64 0
  store i64 %a0, ptr %t1643
  %t1644 = getelementptr i64, ptr %t1642, i64 1
  store i64 %a1, ptr %t1644
  %t1645 = getelementptr i64, ptr %t1642, i64 2
  store i64 %a2, ptr %t1645
  %t1646 = getelementptr i64, ptr %t1642, i64 3
  store i64 %a3, ptr %t1646
  %t1647 = getelementptr i64, ptr %t1642, i64 4
  store i64 %a4, ptr %t1647
  %t1648 = getelementptr i64, ptr %t1642, i64 5
  store i64 %a5, ptr %t1648
  %t1649 = getelementptr i64, ptr %t1642, i64 6
  store i64 %a6, ptr %t1649
  %t1650 = getelementptr i64, ptr %t1642, i64 7
  store i64 %a7, ptr %t1650
  %t1651 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1642, ptr %overflow)
  %t1652 = call ptr @rt_alloc_words(i64 1)
  %t1653 = ptrtoint ptr %t1652 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_363" to i64), ptr %t1652
  %t1654 = or i64 %t1653, 4
  %t1655 = load i64, ptr @"scheme.base:chr-cmp"
  %t1656 = and i64 %t1655, -8
  %t1657 = inttoptr i64 %t1656 to ptr
  %t1658 = load i64, ptr %t1657
  %t1659 = inttoptr i64 %t1658 to ptr
  %t1660 = musttail call fastcc i64 %t1659(i64 %t1655, i64 4, i64 %t1654, i64 %a0, i64 %a1, i64 %t1651, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1660
}

define fastcc i64 @"scheme.base:code_374"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1665 = icmp eq i64 %argc, 2
  br i1 %t1665, label %argok442, label %arityerr441
arityerr441:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok442:
  %t1666 = or i64 %a0, 0
  %t1667 = and i64 %t1666, 7
  %t1668 = icmp eq i64 %t1667, 0
  br i1 %t1668, label %fixfast443, label %fixslow444
fixfast443:
  %t1669 = icmp slt i64 %a0, 0
  %t1670 = select i1 %t1669, i64 257, i64 1
  br label %fixmerge445
fixslow444:
  %t1671 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge445
fixmerge445:
  %t1672 = phi i64 [ %t1670, %fixfast443 ], [ %t1671, %fixslow444 ]
  %t1673 = icmp ne i64 %t1672, 1
  br i1 %t1673, label %then446, label %else447
then446:
  ret i64 %a1
else447:
  %t1674 = or i64 %a0, 8
  %t1675 = and i64 %t1674, 7
  %t1676 = icmp eq i64 %t1675, 0
  br i1 %t1676, label %fixfast448, label %fixslow449
fixfast448:
  %t1677 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t1678 = extractvalue {i64, i1} %t1677, 0
  %t1679 = extractvalue {i64, i1} %t1677, 1
  br i1 %t1679, label %fixslow449, label %fixmerge450
fixslow449:
  %t1680 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge450
fixmerge450:
  %t1681 = phi i64 [ %t1678, %fixfast448 ], [ %t1680, %fixslow449 ]
  %t1682 = and i64 %self, -8
  %t1683 = inttoptr i64 %t1682 to ptr
  %t1684 = getelementptr i64, ptr %t1683, i64 2
  %t1685 = load i64, ptr %t1684
  %t1686 = call i64 @rt_string_ref(i64 %t1685, i64 %a0)
  %t1687 = call i64 @rt_cons(i64 %t1686, i64 %a1)
  %t1688 = musttail call fastcc i64 @"scheme.base:code_374"(i64 %self, i64 2, i64 %t1681, i64 %t1687, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1688
}

define fastcc i64 @"scheme.base:code:string->list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1689 = icmp eq i64 %argc, 1
  br i1 %t1689, label %argok452, label %arityerr451
arityerr451:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok452:
  %t1690 = call ptr @rt_alloc_words(i64 3)
  %t1691 = ptrtoint ptr %t1690 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_374" to i64), ptr %t1690
  %t1692 = or i64 %t1691, 4
  %t1693 = getelementptr i64, ptr %t1690, i64 1
  store i64 %t1692, ptr %t1693
  %t1694 = getelementptr i64, ptr %t1690, i64 2
  store i64 %a0, ptr %t1694
  %t1695 = call i64 @rt_string_length(i64 %a0)
  %t1696 = or i64 %t1695, 8
  %t1697 = and i64 %t1696, 7
  %t1698 = icmp eq i64 %t1697, 0
  br i1 %t1698, label %fixfast453, label %fixslow454
fixfast453:
  %t1699 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t1695, i64 8)
  %t1700 = extractvalue {i64, i1} %t1699, 0
  %t1701 = extractvalue {i64, i1} %t1699, 1
  br i1 %t1701, label %fixslow454, label %fixmerge455
fixslow454:
  %t1702 = call i64 @rt_sub(i64 %t1695, i64 8)
  br label %fixmerge455
fixmerge455:
  %t1703 = phi i64 [ %t1700, %fixfast453 ], [ %t1702, %fixslow454 ]
  %t1704 = musttail call fastcc i64 @"scheme.base:code_374"(i64 %t1692, i64 2, i64 %t1703, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1704
}

define fastcc i64 @"scheme.base:code:ns-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1709 = icmp eq i64 %argc, 2
  br i1 %t1709, label %argok457, label %arityerr456
arityerr456:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok457:
  %t1710 = load i64, ptr @"scheme.base:ns-digits-radix"
  %t1711 = and i64 %t1710, -8
  %t1712 = inttoptr i64 %t1711 to ptr
  %t1713 = load i64, ptr %t1712
  %t1714 = inttoptr i64 %t1713 to ptr
  %t1715 = musttail call fastcc i64 %t1714(i64 %t1710, i64 3, i64 %a0, i64 80, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1715
}

define fastcc i64 @"scheme.base:code:%ns-digit-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1720 = icmp eq i64 %argc, 1
  br i1 %t1720, label %argok459, label %arityerr458
arityerr458:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok459:
  %t1721 = or i64 %a0, 80
  %t1722 = and i64 %t1721, 7
  %t1723 = icmp eq i64 %t1722, 0
  br i1 %t1723, label %fixfast460, label %fixslow461
fixfast460:
  %t1724 = icmp slt i64 %a0, 80
  %t1725 = select i1 %t1724, i64 257, i64 1
  br label %fixmerge462
fixslow461:
  %t1726 = call i64 @rt_lt(i64 %a0, i64 80)
  br label %fixmerge462
fixmerge462:
  %t1727 = phi i64 [ %t1725, %fixfast460 ], [ %t1726, %fixslow461 ]
  %t1728 = icmp ne i64 %t1727, 1
  br i1 %t1728, label %then463, label %else464
then463:
  %t1729 = or i64 384, %a0
  %t1730 = and i64 %t1729, 7
  %t1731 = icmp eq i64 %t1730, 0
  br i1 %t1731, label %fixfast465, label %fixslow466
fixfast465:
  %t1732 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 384, i64 %a0)
  %t1733 = extractvalue {i64, i1} %t1732, 0
  %t1734 = extractvalue {i64, i1} %t1732, 1
  br i1 %t1734, label %fixslow466, label %fixmerge467
fixslow466:
  %t1735 = call i64 @rt_add(i64 384, i64 %a0)
  br label %fixmerge467
fixmerge467:
  %t1736 = phi i64 [ %t1733, %fixfast465 ], [ %t1735, %fixslow466 ]
  %t1737 = call i64 @rt_integer_to_char(i64 %t1736)
  ret i64 %t1737
else464:
  %t1738 = or i64 696, %a0
  %t1739 = and i64 %t1738, 7
  %t1740 = icmp eq i64 %t1739, 0
  br i1 %t1740, label %fixfast468, label %fixslow469
fixfast468:
  %t1741 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 696, i64 %a0)
  %t1742 = extractvalue {i64, i1} %t1741, 0
  %t1743 = extractvalue {i64, i1} %t1741, 1
  br i1 %t1743, label %fixslow469, label %fixmerge470
fixslow469:
  %t1744 = call i64 @rt_add(i64 696, i64 %a0)
  br label %fixmerge470
fixmerge470:
  %t1745 = phi i64 [ %t1742, %fixfast468 ], [ %t1744, %fixslow469 ]
  %t1746 = call i64 @rt_integer_to_char(i64 %t1745)
  ret i64 %t1746
}

define fastcc i64 @"scheme.base:code:ns-digits-radix"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1751 = icmp eq i64 %argc, 3
  br i1 %t1751, label %argok472, label %arityerr471
arityerr471:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok472:
  %t1752 = call i64 @rt_remainder(i64 %a0, i64 %a1)
  %t1753 = or i64 0, %t1752
  %t1754 = and i64 %t1753, 7
  %t1755 = icmp eq i64 %t1754, 0
  br i1 %t1755, label %fixfast473, label %fixslow474
fixfast473:
  %t1756 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %t1752)
  %t1757 = extractvalue {i64, i1} %t1756, 0
  %t1758 = extractvalue {i64, i1} %t1756, 1
  br i1 %t1758, label %fixslow474, label %fixmerge475
fixslow474:
  %t1759 = call i64 @rt_sub(i64 0, i64 %t1752)
  br label %fixmerge475
fixmerge475:
  %t1760 = phi i64 [ %t1757, %fixfast473 ], [ %t1759, %fixslow474 ]
  %t1761 = load i64, ptr @"scheme.base:%ns-digit-char"
  %t1762 = and i64 %t1761, -8
  %t1763 = inttoptr i64 %t1762 to ptr
  %t1764 = load i64, ptr %t1763
  %t1765 = inttoptr i64 %t1764 to ptr
  %t1766 = call fastcc i64%t1765(i64 %t1761, i64 1, i64 %t1760, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1767 = call i64 @rt_quotient(i64 %a0, i64 %a1)
  %t1768 = or i64 %t1767, 0
  %t1769 = and i64 %t1768, 7
  %t1770 = icmp eq i64 %t1769, 0
  br i1 %t1770, label %fixfast476, label %fixslow477
fixfast476:
  %t1771 = icmp eq i64 %t1767, 0
  %t1772 = select i1 %t1771, i64 257, i64 1
  br label %fixmerge478
fixslow477:
  %t1773 = call i64 @rt_num_eq(i64 %t1767, i64 0)
  br label %fixmerge478
fixmerge478:
  %t1774 = phi i64 [ %t1772, %fixfast476 ], [ %t1773, %fixslow477 ]
  %t1775 = icmp ne i64 %t1774, 1
  br i1 %t1775, label %then479, label %else480
then479:
  %t1776 = call i64 @rt_cons(i64 %t1766, i64 %a2)
  ret i64 %t1776
else480:
  %t1777 = call i64 @rt_cons(i64 %t1766, i64 %a2)
  %t1778 = load i64, ptr @"scheme.base:ns-digits-radix"
  %t1779 = and i64 %t1778, -8
  %t1780 = inttoptr i64 %t1779 to ptr
  %t1781 = load i64, ptr %t1780
  %t1782 = inttoptr i64 %t1781 to ptr
  %t1783 = musttail call fastcc i64 %t1782(i64 %t1778, i64 3, i64 %t1767, i64 %a1, i64 %t1777, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1783
}

define fastcc i64 @"scheme.base:code:%radix-ok?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1788 = icmp eq i64 %argc, 1
  br i1 %t1788, label %argok482, label %arityerr481
arityerr481:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok482:
  %t1789 = or i64 %a0, 80
  %t1790 = and i64 %t1789, 7
  %t1791 = icmp eq i64 %t1790, 0
  br i1 %t1791, label %fixfast483, label %fixslow484
fixfast483:
  %t1792 = icmp eq i64 %a0, 80
  %t1793 = select i1 %t1792, i64 257, i64 1
  br label %fixmerge485
fixslow484:
  %t1794 = call i64 @rt_num_eq(i64 %a0, i64 80)
  br label %fixmerge485
fixmerge485:
  %t1795 = phi i64 [ %t1793, %fixfast483 ], [ %t1794, %fixslow484 ]
  %t1796 = icmp ne i64 %t1795, 1
  br i1 %t1796, label %then486, label %else487
then486:
  ret i64 257
else487:
  %t1797 = or i64 %a0, 128
  %t1798 = and i64 %t1797, 7
  %t1799 = icmp eq i64 %t1798, 0
  br i1 %t1799, label %fixfast488, label %fixslow489
fixfast488:
  %t1800 = icmp eq i64 %a0, 128
  %t1801 = select i1 %t1800, i64 257, i64 1
  br label %fixmerge490
fixslow489:
  %t1802 = call i64 @rt_num_eq(i64 %a0, i64 128)
  br label %fixmerge490
fixmerge490:
  %t1803 = phi i64 [ %t1801, %fixfast488 ], [ %t1802, %fixslow489 ]
  %t1804 = icmp ne i64 %t1803, 1
  br i1 %t1804, label %then491, label %else492
then491:
  ret i64 257
else492:
  %t1805 = or i64 %a0, 64
  %t1806 = and i64 %t1805, 7
  %t1807 = icmp eq i64 %t1806, 0
  br i1 %t1807, label %fixfast493, label %fixslow494
fixfast493:
  %t1808 = icmp eq i64 %a0, 64
  %t1809 = select i1 %t1808, i64 257, i64 1
  br label %fixmerge495
fixslow494:
  %t1810 = call i64 @rt_num_eq(i64 %a0, i64 64)
  br label %fixmerge495
fixmerge495:
  %t1811 = phi i64 [ %t1809, %fixfast493 ], [ %t1810, %fixslow494 ]
  %t1812 = icmp ne i64 %t1811, 1
  br i1 %t1812, label %then496, label %else497
then496:
  ret i64 257
else497:
  %t1813 = or i64 %a0, 16
  %t1814 = and i64 %t1813, 7
  %t1815 = icmp eq i64 %t1814, 0
  br i1 %t1815, label %fixfast498, label %fixslow499
fixfast498:
  %t1816 = icmp eq i64 %a0, 16
  %t1817 = select i1 %t1816, i64 257, i64 1
  br label %fixmerge500
fixslow499:
  %t1818 = call i64 @rt_num_eq(i64 %a0, i64 16)
  br label %fixmerge500
fixmerge500:
  %t1819 = phi i64 [ %t1817, %fixfast498 ], [ %t1818, %fixslow499 ]
  ret i64 %t1819
}

define fastcc i64 @"scheme.base:code:number->string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1824 = icmp sge i64 %argc, 1
  br i1 %t1824, label %argok502, label %arityerr501
arityerr501:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok502:
  %t1825 = call ptr @rt_alloc_words(i64 8)
  %t1826 = getelementptr i64, ptr %t1825, i64 0
  store i64 %a0, ptr %t1826
  %t1827 = getelementptr i64, ptr %t1825, i64 1
  store i64 %a1, ptr %t1827
  %t1828 = getelementptr i64, ptr %t1825, i64 2
  store i64 %a2, ptr %t1828
  %t1829 = getelementptr i64, ptr %t1825, i64 3
  store i64 %a3, ptr %t1829
  %t1830 = getelementptr i64, ptr %t1825, i64 4
  store i64 %a4, ptr %t1830
  %t1831 = getelementptr i64, ptr %t1825, i64 5
  store i64 %a5, ptr %t1831
  %t1832 = getelementptr i64, ptr %t1825, i64 6
  store i64 %a6, ptr %t1832
  %t1833 = getelementptr i64, ptr %t1825, i64 7
  store i64 %a7, ptr %t1833
  %t1834 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t1825, ptr %overflow)
  %t1835 = call i64 @rt_null_p(i64 %t1834)
  %t1836 = icmp ne i64 %t1835, 1
  br i1 %t1836, label %then503, label %else504
then503:
  br label %merge505
else504:
  %t1837 = call i64 @rt_car(i64 %t1834)
  br label %merge505
merge505:
  %t1838 = phi i64 [ 80, %then503 ], [ %t1837, %else504 ]
  %t1839 = load i64, ptr @"scheme.base:%radix-ok?"
  %t1840 = and i64 %t1839, -8
  %t1841 = inttoptr i64 %t1840 to ptr
  %t1842 = load i64, ptr %t1841
  %t1843 = inttoptr i64 %t1842 to ptr
  %t1844 = call fastcc i64%t1843(i64 %t1839, i64 1, i64 %t1838, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1845 = icmp ne i64 %t1844, 1
  br i1 %t1845, label %then506, label %else507
then506:
  %t1846 = call i64 @rt_exact_p(i64 %a0)
  %t1847 = icmp ne i64 %t1846, 1
  br i1 %t1847, label %then508, label %else509
then508:
  %t1848 = or i64 %a0, 0
  %t1849 = and i64 %t1848, 7
  %t1850 = icmp eq i64 %t1849, 0
  br i1 %t1850, label %fixfast510, label %fixslow511
fixfast510:
  %t1851 = icmp eq i64 %a0, 0
  %t1852 = select i1 %t1851, i64 257, i64 1
  br label %fixmerge512
fixslow511:
  %t1853 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge512
fixmerge512:
  %t1854 = phi i64 [ %t1852, %fixfast510 ], [ %t1853, %fixslow511 ]
  %t1855 = icmp ne i64 %t1854, 1
  br i1 %t1855, label %then513, label %else514
then513:
  %t1856 = call i64 @rt_make_string(ptr @.str.lit.5, i64 1)
  ret i64 %t1856
else514:
  %t1857 = or i64 %a0, 0
  %t1858 = and i64 %t1857, 7
  %t1859 = icmp eq i64 %t1858, 0
  br i1 %t1859, label %fixfast515, label %fixslow516
fixfast515:
  %t1860 = icmp slt i64 %a0, 0
  %t1861 = select i1 %t1860, i64 257, i64 1
  br label %fixmerge517
fixslow516:
  %t1862 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge517
fixmerge517:
  %t1863 = phi i64 [ %t1861, %fixfast515 ], [ %t1862, %fixslow516 ]
  %t1864 = icmp ne i64 %t1863, 1
  br i1 %t1864, label %then518, label %else519
then518:
  %t1865 = load i64, ptr @"scheme.base:ns-digits-radix"
  %t1866 = and i64 %t1865, -8
  %t1867 = inttoptr i64 %t1866 to ptr
  %t1868 = load i64, ptr %t1867
  %t1869 = inttoptr i64 %t1868 to ptr
  %t1870 = call fastcc i64%t1869(i64 %t1865, i64 3, i64 %a0, i64 %t1838, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1871 = call i64 @rt_cons(i64 11529, i64 %t1870)
  %t1872 = call i64 @rt_list_to_string(i64 %t1871)
  ret i64 %t1872
else519:
  %t1873 = or i64 0, %a0
  %t1874 = and i64 %t1873, 7
  %t1875 = icmp eq i64 %t1874, 0
  br i1 %t1875, label %fixfast520, label %fixslow521
fixfast520:
  %t1876 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %a0)
  %t1877 = extractvalue {i64, i1} %t1876, 0
  %t1878 = extractvalue {i64, i1} %t1876, 1
  br i1 %t1878, label %fixslow521, label %fixmerge522
fixslow521:
  %t1879 = call i64 @rt_sub(i64 0, i64 %a0)
  br label %fixmerge522
fixmerge522:
  %t1880 = phi i64 [ %t1877, %fixfast520 ], [ %t1879, %fixslow521 ]
  %t1881 = load i64, ptr @"scheme.base:ns-digits-radix"
  %t1882 = and i64 %t1881, -8
  %t1883 = inttoptr i64 %t1882 to ptr
  %t1884 = load i64, ptr %t1883
  %t1885 = inttoptr i64 %t1884 to ptr
  %t1886 = call fastcc i64%t1885(i64 %t1881, i64 3, i64 %t1880, i64 %t1838, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1887 = call i64 @rt_list_to_string(i64 %t1886)
  ret i64 %t1887
else509:
  %t1888 = or i64 %t1838, 80
  %t1889 = and i64 %t1888, 7
  %t1890 = icmp eq i64 %t1889, 0
  br i1 %t1890, label %fixfast523, label %fixslow524
fixfast523:
  %t1891 = icmp eq i64 %t1838, 80
  %t1892 = select i1 %t1891, i64 257, i64 1
  br label %fixmerge525
fixslow524:
  %t1893 = call i64 @rt_num_eq(i64 %t1838, i64 80)
  br label %fixmerge525
fixmerge525:
  %t1894 = phi i64 [ %t1892, %fixfast523 ], [ %t1893, %fixslow524 ]
  %t1895 = icmp ne i64 %t1894, 1
  br i1 %t1895, label %then526, label %else527
then526:
  %t1896 = call i64 @rt_flonum_to_string(i64 %a0)
  ret i64 %t1896
else527:
  %t1897 = call i64 @rt_make_string(ptr @.str.lit.6, i64 54)
  %t1898 = load i64, ptr @"scheme.base:error"
  %t1899 = and i64 %t1898, -8
  %t1900 = inttoptr i64 %t1899 to ptr
  %t1901 = load i64, ptr %t1900
  %t1902 = inttoptr i64 %t1901 to ptr
  %t1903 = musttail call fastcc i64 %t1902(i64 %t1898, i64 2, i64 %t1897, i64 %t1838, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1903
else507:
  %t1904 = call i64 @rt_make_string(ptr @.str.lit.7, i64 33)
  %t1905 = load i64, ptr @"scheme.base:error"
  %t1906 = and i64 %t1905, -8
  %t1907 = inttoptr i64 %t1906 to ptr
  %t1908 = load i64, ptr %t1907
  %t1909 = inttoptr i64 %t1908 to ptr
  %t1910 = musttail call fastcc i64 %t1909(i64 %t1905, i64 2, i64 %t1904, i64 %t1838, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1910
}

define fastcc i64 @"scheme.base:code:string->number"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1915 = icmp sge i64 %argc, 1
  br i1 %t1915, label %argok529, label %arityerr528
arityerr528:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok529:
  %t1916 = call ptr @rt_alloc_words(i64 8)
  %t1917 = getelementptr i64, ptr %t1916, i64 0
  store i64 %a0, ptr %t1917
  %t1918 = getelementptr i64, ptr %t1916, i64 1
  store i64 %a1, ptr %t1918
  %t1919 = getelementptr i64, ptr %t1916, i64 2
  store i64 %a2, ptr %t1919
  %t1920 = getelementptr i64, ptr %t1916, i64 3
  store i64 %a3, ptr %t1920
  %t1921 = getelementptr i64, ptr %t1916, i64 4
  store i64 %a4, ptr %t1921
  %t1922 = getelementptr i64, ptr %t1916, i64 5
  store i64 %a5, ptr %t1922
  %t1923 = getelementptr i64, ptr %t1916, i64 6
  store i64 %a6, ptr %t1923
  %t1924 = getelementptr i64, ptr %t1916, i64 7
  store i64 %a7, ptr %t1924
  %t1925 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t1916, ptr %overflow)
  %t1926 = call i64 @rt_null_p(i64 %t1925)
  %t1927 = icmp ne i64 %t1926, 1
  br i1 %t1927, label %then530, label %else531
then530:
  br label %merge532
else531:
  %t1928 = call i64 @rt_car(i64 %t1925)
  br label %merge532
merge532:
  %t1929 = phi i64 [ 80, %then530 ], [ %t1928, %else531 ]
  %t1930 = load i64, ptr @"scheme.base:%radix-ok?"
  %t1931 = and i64 %t1930, -8
  %t1932 = inttoptr i64 %t1931 to ptr
  %t1933 = load i64, ptr %t1932
  %t1934 = inttoptr i64 %t1933 to ptr
  %t1935 = call fastcc i64%t1934(i64 %t1930, i64 1, i64 %t1929, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1936 = icmp ne i64 %t1935, 1
  br i1 %t1936, label %then533, label %else534
then533:
  %t1937 = load i64, ptr @"emit.internal:rd-number"
  %t1938 = call fastcc i64 @"emit.internal:code:rd-number"(i64 %t1937, i64 2, i64 %a0, i64 %t1929, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1939 = call i64 @rt_symbol_p(i64 %t1938)
  %t1940 = icmp ne i64 %t1939, 1
  br i1 %t1940, label %then535, label %else536
then535:
  ret i64 1
else536:
  ret i64 %t1938
else534:
  %t1941 = call i64 @rt_make_string(ptr @.str.lit.8, i64 33)
  %t1942 = load i64, ptr @"scheme.base:error"
  %t1943 = and i64 %t1942, -8
  %t1944 = inttoptr i64 %t1943 to ptr
  %t1945 = load i64, ptr %t1944
  %t1946 = inttoptr i64 %t1945 to ptr
  %t1947 = musttail call fastcc i64 %t1946(i64 %t1942, i64 2, i64 %t1941, i64 %t1929, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1947
}

define fastcc i64 @"scheme.base:code:error"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1952 = icmp sge i64 %argc, 1
  br i1 %t1952, label %argok538, label %arityerr537
arityerr537:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok538:
  %t1953 = call ptr @rt_alloc_words(i64 8)
  %t1954 = getelementptr i64, ptr %t1953, i64 0
  store i64 %a0, ptr %t1954
  %t1955 = getelementptr i64, ptr %t1953, i64 1
  store i64 %a1, ptr %t1955
  %t1956 = getelementptr i64, ptr %t1953, i64 2
  store i64 %a2, ptr %t1956
  %t1957 = getelementptr i64, ptr %t1953, i64 3
  store i64 %a3, ptr %t1957
  %t1958 = getelementptr i64, ptr %t1953, i64 4
  store i64 %a4, ptr %t1958
  %t1959 = getelementptr i64, ptr %t1953, i64 5
  store i64 %a5, ptr %t1959
  %t1960 = getelementptr i64, ptr %t1953, i64 6
  store i64 %a6, ptr %t1960
  %t1961 = getelementptr i64, ptr %t1953, i64 7
  store i64 %a7, ptr %t1961
  %t1962 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t1953, ptr %overflow)
  %t1963 = call i64 @rt_string_p(i64 %a0)
  %t1964 = icmp ne i64 %t1963, 1
  br i1 %t1964, label %then539, label %else540
then539:
  %t1965 = call i64 @rt_make_error_object(i64 %a0, i64 %t1962)
  %t1966 = load i64, ptr @"scheme.base:raise"
  %t1967 = and i64 %t1966, -8
  %t1968 = inttoptr i64 %t1967 to ptr
  %t1969 = load i64, ptr %t1968
  %t1970 = inttoptr i64 %t1969 to ptr
  %t1971 = musttail call fastcc i64 %t1970(i64 %t1966, i64 1, i64 %t1965, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1971
else540:
  %t1972 = call i64 @rt_symbol_to_string(i64 %a0)
  %t1973 = call i64 @rt_make_string(ptr @.str.lit.9, i64 2)
  %t1974 = call i64 @rt_car(i64 %t1962)
  %t1975 = call i64 @rt_string_append(i64 %t1973, i64 %t1974)
  %t1976 = call i64 @rt_string_append(i64 %t1972, i64 %t1975)
  %t1977 = call i64 @rt_cdr(i64 %t1962)
  %t1978 = call i64 @rt_make_error_object(i64 %t1976, i64 %t1977)
  %t1979 = load i64, ptr @"scheme.base:raise"
  %t1980 = and i64 %t1979, -8
  %t1981 = inttoptr i64 %t1980 to ptr
  %t1982 = load i64, ptr %t1981
  %t1983 = inttoptr i64 %t1982 to ptr
  %t1984 = musttail call fastcc i64 %t1983(i64 %t1979, i64 1, i64 %t1978, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1984
}

define fastcc i64 @"scheme.base:code:%unwind-to"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1991 = icmp eq i64 %argc, 1
  br i1 %t1991, label %argok542, label %arityerr541
arityerr541:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok542:
  %t1992 = load i64, ptr @"scheme.base:*winds*"
  %t1993 = call i64 @rt_eq_p(i64 %t1992, i64 %a0)
  %t1994 = icmp ne i64 %t1993, 1
  br i1 %t1994, label %then543, label %else544
then543:
  ret i64 257
else544:
  %t1995 = load i64, ptr @"scheme.base:*winds*"
  %t1996 = call i64 @rt_null_p(i64 %t1995)
  %t1997 = icmp ne i64 %t1996, 1
  br i1 %t1997, label %then545, label %else546
then545:
  ret i64 257
else546:
  %t1998 = load i64, ptr @"scheme.base:*winds*"
  %t1999 = call i64 @rt_car(i64 %t1998)
  %t2000 = load i64, ptr @"scheme.base:*winds*"
  %t2001 = call i64 @rt_cdr(i64 %t2000)
  %t2002 = call i64 @rt_root(i64 %t2001)
  store i64 %t2002, ptr @"scheme.base:*winds*"
  %t2003 = call i64 @rt_cdr(i64 %t1999)
  %t2004 = and i64 %t2003, -8
  %t2005 = inttoptr i64 %t2004 to ptr
  %t2006 = load i64, ptr %t2005
  %t2007 = inttoptr i64 %t2006 to ptr
  %t2008 = call fastcc i64%t2007(i64 %t2003, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2009 = load i64, ptr @"scheme.base:%unwind-to"
  %t2010 = and i64 %t2009, -8
  %t2011 = inttoptr i64 %t2010 to ptr
  %t2012 = load i64, ptr %t2011
  %t2013 = inttoptr i64 %t2012 to ptr
  %t2014 = musttail call fastcc i64 %t2013(i64 %t2009, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2014
}

define fastcc i64 @"scheme.base:code:dynamic-wind"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2019 = icmp eq i64 %argc, 3
  br i1 %t2019, label %argok548, label %arityerr547
arityerr547:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok548:
  %t2020 = and i64 %a0, -8
  %t2021 = inttoptr i64 %t2020 to ptr
  %t2022 = load i64, ptr %t2021
  %t2023 = inttoptr i64 %t2022 to ptr
  %t2024 = call fastcc i64%t2023(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2025 = call i64 @rt_cons(i64 %a0, i64 %a2)
  %t2026 = load i64, ptr @"scheme.base:*winds*"
  %t2027 = call i64 @rt_cons(i64 %t2025, i64 %t2026)
  %t2028 = call i64 @rt_root(i64 %t2027)
  store i64 %t2028, ptr @"scheme.base:*winds*"
  %t2029 = and i64 %a1, -8
  %t2030 = inttoptr i64 %t2029 to ptr
  %t2031 = load i64, ptr %t2030
  %t2032 = inttoptr i64 %t2031 to ptr
  %t2033 = call fastcc i64%t2032(i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2034 = load i64, ptr @"scheme.base:*winds*"
  %t2035 = call i64 @rt_cdr(i64 %t2034)
  %t2036 = call i64 @rt_root(i64 %t2035)
  store i64 %t2036, ptr @"scheme.base:*winds*"
  %t2037 = and i64 %a2, -8
  %t2038 = inttoptr i64 %t2037 to ptr
  %t2039 = load i64, ptr %t2038
  %t2040 = inttoptr i64 %t2039 to ptr
  %t2041 = call fastcc i64%t2040(i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2033
}

define fastcc i64 @"scheme.base:code_456"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2046 = icmp eq i64 %argc, 1
  br i1 %t2046, label %argok550, label %arityerr549
arityerr549:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok550:
  %t2047 = and i64 %self, -8
  %t2048 = inttoptr i64 %t2047 to ptr
  %t2049 = getelementptr i64, ptr %t2048, i64 1
  %t2050 = load i64, ptr %t2049
  %t2051 = call i64 @rt_escape_live_p(i64 %t2050)
  %t2052 = icmp ne i64 %t2051, 1
  br i1 %t2052, label %then551, label %else552
then551:
  %t2053 = and i64 %self, -8
  %t2054 = inttoptr i64 %t2053 to ptr
  %t2055 = getelementptr i64, ptr %t2054, i64 2
  %t2056 = load i64, ptr %t2055
  %t2057 = load i64, ptr @"scheme.base:%unwind-to"
  %t2058 = and i64 %t2057, -8
  %t2059 = inttoptr i64 %t2058 to ptr
  %t2060 = load i64, ptr %t2059
  %t2061 = inttoptr i64 %t2060 to ptr
  %t2062 = call fastcc i64%t2061(i64 %t2057, i64 1, i64 %t2056, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2063 = and i64 %self, -8
  %t2064 = inttoptr i64 %t2063 to ptr
  %t2065 = getelementptr i64, ptr %t2064, i64 1
  %t2066 = load i64, ptr %t2065
  %t2067 = call i64 @rt_escape_to(i64 %t2066, i64 %a0)
  br label %merge553
else552:
  br label %merge553
merge553:
  %t2068 = phi i64 [ %t2067, %then551 ], [ 1, %else552 ]
  %t2069 = call i64 @rt_intern(ptr @.str.sym.10)
  %t2070 = call i64 @rt_make_string(ptr @.str.lit.11, i64 39)
  %t2071 = load i64, ptr @"scheme.base:error"
  %t2072 = and i64 %t2071, -8
  %t2073 = inttoptr i64 %t2072 to ptr
  %t2074 = load i64, ptr %t2073
  %t2075 = inttoptr i64 %t2074 to ptr
  %t2076 = musttail call fastcc i64 %t2075(i64 %t2071, i64 2, i64 %t2069, i64 %t2070, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2076
}

define fastcc i64 @"scheme.base:code_454"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2077 = icmp eq i64 %argc, 0
  br i1 %t2077, label %argok555, label %arityerr554
arityerr554:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok555:
  %t2078 = call i64 @rt_escape_frame()
  %t2079 = and i64 %self, -8
  %t2080 = inttoptr i64 %t2079 to ptr
  %t2081 = getelementptr i64, ptr %t2080, i64 2
  %t2082 = load i64, ptr %t2081
  %t2083 = call ptr @rt_alloc_words(i64 3)
  %t2084 = ptrtoint ptr %t2083 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_456" to i64), ptr %t2083
  %t2085 = getelementptr i64, ptr %t2083, i64 1
  store i64 %t2078, ptr %t2085
  %t2086 = getelementptr i64, ptr %t2083, i64 2
  store i64 %t2082, ptr %t2086
  %t2087 = or i64 %t2084, 4
  %t2088 = and i64 %self, -8
  %t2089 = inttoptr i64 %t2088 to ptr
  %t2090 = getelementptr i64, ptr %t2089, i64 1
  %t2091 = load i64, ptr %t2090
  %t2092 = and i64 %t2091, -8
  %t2093 = inttoptr i64 %t2092 to ptr
  %t2094 = load i64, ptr %t2093
  %t2095 = inttoptr i64 %t2094 to ptr
  %t2096 = musttail call fastcc i64 %t2095(i64 %t2091, i64 1, i64 %t2087, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2096
}

define fastcc i64 @"scheme.base:code:call-with-current-continuation"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2097 = icmp eq i64 %argc, 1
  br i1 %t2097, label %argok557, label %arityerr556
arityerr556:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok557:
  %t2098 = load i64, ptr @"scheme.base:*winds*"
  %t2099 = call ptr @rt_alloc_words(i64 3)
  %t2100 = ptrtoint ptr %t2099 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_454" to i64), ptr %t2099
  %t2101 = getelementptr i64, ptr %t2099, i64 1
  store i64 %a0, ptr %t2101
  %t2102 = getelementptr i64, ptr %t2099, i64 2
  store i64 %t2098, ptr %t2102
  %t2103 = or i64 %t2100, 4
  %t2104 = call i64 @rt_run_guarded(ptr @__apply0, i64 %t2103)
  %t2105 = call i64 @rt_cdr(i64 %t2104)
  ret i64 %t2105
}

define fastcc i64 @"scheme.base:code:call/cc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2110 = icmp eq i64 %argc, 1
  br i1 %t2110, label %argok559, label %arityerr558
arityerr558:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok559:
  %t2111 = load i64, ptr @"scheme.base:call-with-current-continuation"
  %t2112 = and i64 %t2111, -8
  %t2113 = inttoptr i64 %t2112 to ptr
  %t2114 = load i64, ptr %t2113
  %t2115 = inttoptr i64 %t2114 to ptr
  %t2116 = musttail call fastcc i64 %t2115(i64 %t2111, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2116
}

define fastcc i64 @"scheme.base:code_464"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2121 = icmp eq i64 %argc, 0
  br i1 %t2121, label %argok561, label %arityerr560
arityerr560:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok561:
  %t2122 = and i64 %self, -8
  %t2123 = inttoptr i64 %t2122 to ptr
  %t2124 = getelementptr i64, ptr %t2123, i64 1
  %t2125 = load i64, ptr %t2124
  %t2126 = and i64 %self, -8
  %t2127 = inttoptr i64 %t2126 to ptr
  %t2128 = getelementptr i64, ptr %t2127, i64 2
  %t2129 = load i64, ptr %t2128
  %t2130 = call i64 @rt_cons(i64 %t2125, i64 %t2129)
  %t2131 = call i64 @rt_root(i64 %t2130)
  store i64 %t2131, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code_466"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2132 = icmp eq i64 %argc, 0
  br i1 %t2132, label %argok563, label %arityerr562
arityerr562:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok563:
  %t2133 = and i64 %self, -8
  %t2134 = inttoptr i64 %t2133 to ptr
  %t2135 = getelementptr i64, ptr %t2134, i64 1
  %t2136 = load i64, ptr %t2135
  %t2137 = call i64 @rt_root(i64 %t2136)
  store i64 %t2137, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code:with-exception-handler"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2138 = icmp eq i64 %argc, 2
  br i1 %t2138, label %argok565, label %arityerr564
arityerr564:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok565:
  %t2139 = load i64, ptr @"scheme.base:*handlers*"
  %t2140 = call ptr @rt_alloc_words(i64 3)
  %t2141 = ptrtoint ptr %t2140 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_464" to i64), ptr %t2140
  %t2142 = getelementptr i64, ptr %t2140, i64 1
  store i64 %a0, ptr %t2142
  %t2143 = getelementptr i64, ptr %t2140, i64 2
  store i64 %t2139, ptr %t2143
  %t2144 = or i64 %t2141, 4
  %t2145 = call ptr @rt_alloc_words(i64 2)
  %t2146 = ptrtoint ptr %t2145 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_466" to i64), ptr %t2145
  %t2147 = getelementptr i64, ptr %t2145, i64 1
  store i64 %t2139, ptr %t2147
  %t2148 = or i64 %t2146, 4
  %t2149 = load i64, ptr @"scheme.base:dynamic-wind"
  %t2150 = and i64 %t2149, -8
  %t2151 = inttoptr i64 %t2150 to ptr
  %t2152 = load i64, ptr %t2151
  %t2153 = inttoptr i64 %t2152 to ptr
  %t2154 = musttail call fastcc i64 %t2153(i64 %t2149, i64 3, i64 %t2144, i64 %a1, i64 %t2148, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2154
}

define fastcc i64 @"scheme.base:code:raise"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2159 = icmp eq i64 %argc, 1
  br i1 %t2159, label %argok567, label %arityerr566
arityerr566:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok567:
  %t2160 = load i64, ptr @"scheme.base:*handlers*"
  %t2161 = call i64 @rt_null_p(i64 %t2160)
  %t2162 = icmp ne i64 %t2161, 1
  br i1 %t2162, label %then568, label %else569
then568:
  %t2163 = call i64 @rt_raise(i64 %a0)
  ret i64 %t2163
else569:
  %t2164 = load i64, ptr @"scheme.base:*handlers*"
  %t2165 = call i64 @rt_car(i64 %t2164)
  %t2166 = load i64, ptr @"scheme.base:*handlers*"
  %t2167 = load i64, ptr @"scheme.base:*handlers*"
  %t2168 = call i64 @rt_cdr(i64 %t2167)
  %t2169 = call i64 @rt_root(i64 %t2168)
  store i64 %t2169, ptr @"scheme.base:*handlers*"
  %t2170 = and i64 %t2165, -8
  %t2171 = inttoptr i64 %t2170 to ptr
  %t2172 = load i64, ptr %t2171
  %t2173 = inttoptr i64 %t2172 to ptr
  %t2174 = call fastcc i64%t2173(i64 %t2165, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2175 = call i64 @rt_root(i64 %t2166)
  store i64 %t2175, ptr @"scheme.base:*handlers*"
  %t2176 = call i64 @rt_raise(i64 %a0)
  ret i64 %t2176
}

define fastcc i64 @"scheme.base:code:error-object?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2181 = icmp eq i64 %argc, 1
  br i1 %t2181, label %argok571, label %arityerr570
arityerr570:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok571:
  %t2182 = call i64 @rt_error_object_p(i64 %a0)
  ret i64 %t2182
}

define fastcc i64 @"scheme.base:code:error-object-message"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2187 = icmp eq i64 %argc, 1
  br i1 %t2187, label %argok573, label %arityerr572
arityerr572:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok573:
  %t2188 = call i64 @rt_error_object_message(i64 %a0)
  ret i64 %t2188
}

define fastcc i64 @"scheme.base:code:error-object-irritants"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2193 = icmp eq i64 %argc, 1
  br i1 %t2193, label %argok575, label %arityerr574
arityerr574:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok575:
  %t2194 = call i64 @rt_error_object_irritants(i64 %a0)
  ret i64 %t2194
}

define fastcc i64 @"scheme.base:code_486"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2199 = icmp eq i64 %argc, 1
  br i1 %t2199, label %argok577, label %arityerr576
arityerr576:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok577:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_488"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2200 = icmp eq i64 %argc, 1
  br i1 %t2200, label %argok579, label %arityerr578
arityerr578:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok579:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_490"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2201 = icmp sge i64 %argc, 0
  br i1 %t2201, label %argok581, label %arityerr580
arityerr580:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok581:
  %t2202 = call ptr @rt_alloc_words(i64 8)
  %t2203 = getelementptr i64, ptr %t2202, i64 0
  store i64 %a0, ptr %t2203
  %t2204 = getelementptr i64, ptr %t2202, i64 1
  store i64 %a1, ptr %t2204
  %t2205 = getelementptr i64, ptr %t2202, i64 2
  store i64 %a2, ptr %t2205
  %t2206 = getelementptr i64, ptr %t2202, i64 3
  store i64 %a3, ptr %t2206
  %t2207 = getelementptr i64, ptr %t2202, i64 4
  store i64 %a4, ptr %t2207
  %t2208 = getelementptr i64, ptr %t2202, i64 5
  store i64 %a5, ptr %t2208
  %t2209 = getelementptr i64, ptr %t2202, i64 6
  store i64 %a6, ptr %t2209
  %t2210 = getelementptr i64, ptr %t2202, i64 7
  store i64 %a7, ptr %t2210
  %t2211 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2202, ptr %overflow)
  %t2212 = call i64 @rt_null_p(i64 %t2211)
  %t2213 = icmp ne i64 %t2212, 1
  br i1 %t2213, label %then582, label %else583
then582:
  %t2214 = and i64 %self, -8
  %t2215 = inttoptr i64 %t2214 to ptr
  %t2216 = getelementptr i64, ptr %t2215, i64 1
  %t2217 = load i64, ptr %t2216
  %t2218 = call i64 @rt_vector_ref(i64 %t2217, i64 0)
  ret i64 %t2218
else583:
  %t2219 = call i64 @rt_cdr(i64 %t2211)
  %t2220 = call i64 @rt_null_p(i64 %t2219)
  %t2221 = icmp ne i64 %t2220, 1
  br i1 %t2221, label %then584, label %else585
then584:
  %t2222 = and i64 %self, -8
  %t2223 = inttoptr i64 %t2222 to ptr
  %t2224 = getelementptr i64, ptr %t2223, i64 1
  %t2225 = load i64, ptr %t2224
  %t2226 = call i64 @rt_car(i64 %t2211)
  %t2227 = and i64 %self, -8
  %t2228 = inttoptr i64 %t2227 to ptr
  %t2229 = getelementptr i64, ptr %t2228, i64 2
  %t2230 = load i64, ptr %t2229
  %t2231 = and i64 %t2230, -8
  %t2232 = inttoptr i64 %t2231 to ptr
  %t2233 = load i64, ptr %t2232
  %t2234 = inttoptr i64 %t2233 to ptr
  %t2235 = call fastcc i64%t2234(i64 %t2230, i64 1, i64 %t2226, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2236 = call i64 @rt_vector_set(i64 %t2225, i64 0, i64 %t2235)
  ret i64 %t2236
else585:
  %t2237 = and i64 %self, -8
  %t2238 = inttoptr i64 %t2237 to ptr
  %t2239 = getelementptr i64, ptr %t2238, i64 1
  %t2240 = load i64, ptr %t2239
  %t2241 = call i64 @rt_car(i64 %t2211)
  %t2242 = call i64 @rt_vector_set(i64 %t2240, i64 0, i64 %t2241)
  ret i64 %t2242
}

define fastcc i64 @"scheme.base:code:make-parameter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2243 = icmp sge i64 %argc, 1
  br i1 %t2243, label %argok587, label %arityerr586
arityerr586:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok587:
  %t2244 = call ptr @rt_alloc_words(i64 8)
  %t2245 = getelementptr i64, ptr %t2244, i64 0
  store i64 %a0, ptr %t2245
  %t2246 = getelementptr i64, ptr %t2244, i64 1
  store i64 %a1, ptr %t2246
  %t2247 = getelementptr i64, ptr %t2244, i64 2
  store i64 %a2, ptr %t2247
  %t2248 = getelementptr i64, ptr %t2244, i64 3
  store i64 %a3, ptr %t2248
  %t2249 = getelementptr i64, ptr %t2244, i64 4
  store i64 %a4, ptr %t2249
  %t2250 = getelementptr i64, ptr %t2244, i64 5
  store i64 %a5, ptr %t2250
  %t2251 = getelementptr i64, ptr %t2244, i64 6
  store i64 %a6, ptr %t2251
  %t2252 = getelementptr i64, ptr %t2244, i64 7
  store i64 %a7, ptr %t2252
  %t2253 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2244, ptr %overflow)
  %t2254 = call i64 @rt_null_p(i64 %t2253)
  %t2255 = icmp ne i64 %t2254, 1
  br i1 %t2255, label %then588, label %else589
then588:
  %t2256 = call ptr @rt_alloc_words(i64 1)
  %t2257 = ptrtoint ptr %t2256 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_486" to i64), ptr %t2256
  %t2258 = or i64 %t2257, 4
  br label %merge590
else589:
  %t2259 = call i64 @rt_car(i64 %t2253)
  br label %merge590
merge590:
  %t2260 = phi i64 [ %t2258, %then588 ], [ %t2259, %else589 ]
  %t2261 = call i64 @rt_make_vector(i64 8, i64 0)
  %t2262 = call i64 @rt_null_p(i64 %t2253)
  %t2263 = icmp ne i64 %t2262, 1
  br i1 %t2263, label %then591, label %else592
then591:
  %t2264 = call ptr @rt_alloc_words(i64 1)
  %t2265 = ptrtoint ptr %t2264 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_488" to i64), ptr %t2264
  %t2266 = or i64 %t2265, 4
  br label %merge593
else592:
  %t2267 = call i64 @rt_car(i64 %t2253)
  br label %merge593
merge593:
  %t2268 = phi i64 [ %t2266, %then591 ], [ %t2267, %else592 ]
  %t2269 = and i64 %t2268, -8
  %t2270 = inttoptr i64 %t2269 to ptr
  %t2271 = load i64, ptr %t2270
  %t2272 = inttoptr i64 %t2271 to ptr
  %t2273 = call fastcc i64%t2272(i64 %t2268, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2274 = call i64 @rt_vector_set(i64 %t2261, i64 0, i64 %t2273)
  %t2275 = call ptr @rt_alloc_words(i64 3)
  %t2276 = ptrtoint ptr %t2275 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_490" to i64), ptr %t2275
  %t2277 = getelementptr i64, ptr %t2275, i64 1
  store i64 %t2261, ptr %t2277
  %t2278 = getelementptr i64, ptr %t2275, i64 2
  store i64 %t2260, ptr %t2278
  %t2279 = or i64 %t2276, 4
  ret i64 %t2279
}

define fastcc i64 @"scheme.base:code_502"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2284 = icmp eq i64 %argc, 1
  br i1 %t2284, label %argok595, label %arityerr594
arityerr594:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok595:
  %t2285 = and i64 %a0, -8
  %t2286 = inttoptr i64 %t2285 to ptr
  %t2287 = load i64, ptr %t2286
  %t2288 = inttoptr i64 %t2287 to ptr
  %t2289 = musttail call fastcc i64 %t2288(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2289
}

define fastcc i64 @"scheme.base:code_506"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2290 = icmp eq i64 %argc, 2
  br i1 %t2290, label %argok597, label %arityerr596
arityerr596:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok597:
  %t2291 = and i64 %a0, -8
  %t2292 = inttoptr i64 %t2291 to ptr
  %t2293 = load i64, ptr %t2292
  %t2294 = inttoptr i64 %t2293 to ptr
  %t2295 = musttail call fastcc i64 %t2294(i64 %a0, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2295
}

define fastcc i64 @"scheme.base:code_504"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2296 = icmp eq i64 %argc, 0
  br i1 %t2296, label %argok599, label %arityerr598
arityerr598:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok599:
  %t2297 = call ptr @rt_alloc_words(i64 1)
  %t2298 = ptrtoint ptr %t2297 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_506" to i64), ptr %t2297
  %t2299 = or i64 %t2298, 4
  %t2300 = and i64 %self, -8
  %t2301 = inttoptr i64 %t2300 to ptr
  %t2302 = getelementptr i64, ptr %t2301, i64 1
  %t2303 = load i64, ptr %t2302
  %t2304 = and i64 %self, -8
  %t2305 = inttoptr i64 %t2304 to ptr
  %t2306 = getelementptr i64, ptr %t2305, i64 2
  %t2307 = load i64, ptr %t2306
  %t2308 = load i64, ptr @"scheme.base:for-each"
  %t2309 = and i64 %t2308, -8
  %t2310 = inttoptr i64 %t2309 to ptr
  %t2311 = load i64, ptr %t2310
  %t2312 = inttoptr i64 %t2311 to ptr
  %t2313 = musttail call fastcc i64 %t2312(i64 %t2308, i64 3, i64 %t2299, i64 %t2303, i64 %t2307, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2313
}

define fastcc i64 @"scheme.base:code_510"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2314 = icmp eq i64 %argc, 2
  br i1 %t2314, label %argok601, label %arityerr600
arityerr600:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok601:
  %t2315 = and i64 %a0, -8
  %t2316 = inttoptr i64 %t2315 to ptr
  %t2317 = load i64, ptr %t2316
  %t2318 = inttoptr i64 %t2317 to ptr
  %t2319 = musttail call fastcc i64 %t2318(i64 %a0, i64 2, i64 %a1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2319
}

define fastcc i64 @"scheme.base:code_508"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2320 = icmp eq i64 %argc, 0
  br i1 %t2320, label %argok603, label %arityerr602
arityerr602:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok603:
  %t2321 = call ptr @rt_alloc_words(i64 1)
  %t2322 = ptrtoint ptr %t2321 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_510" to i64), ptr %t2321
  %t2323 = or i64 %t2322, 4
  %t2324 = and i64 %self, -8
  %t2325 = inttoptr i64 %t2324 to ptr
  %t2326 = getelementptr i64, ptr %t2325, i64 1
  %t2327 = load i64, ptr %t2326
  %t2328 = and i64 %self, -8
  %t2329 = inttoptr i64 %t2328 to ptr
  %t2330 = getelementptr i64, ptr %t2329, i64 2
  %t2331 = load i64, ptr %t2330
  %t2332 = load i64, ptr @"scheme.base:for-each"
  %t2333 = and i64 %t2332, -8
  %t2334 = inttoptr i64 %t2333 to ptr
  %t2335 = load i64, ptr %t2334
  %t2336 = inttoptr i64 %t2335 to ptr
  %t2337 = musttail call fastcc i64 %t2336(i64 %t2332, i64 3, i64 %t2323, i64 %t2327, i64 %t2331, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2337
}

define fastcc i64 @"scheme.base:code:with-parameters"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2338 = icmp eq i64 %argc, 3
  br i1 %t2338, label %argok605, label %arityerr604
arityerr604:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok605:
  %t2339 = call ptr @rt_alloc_words(i64 1)
  %t2340 = ptrtoint ptr %t2339 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_502" to i64), ptr %t2339
  %t2341 = or i64 %t2340, 4
  %t2342 = load i64, ptr @"scheme.base:map"
  %t2343 = and i64 %t2342, -8
  %t2344 = inttoptr i64 %t2343 to ptr
  %t2345 = load i64, ptr %t2344
  %t2346 = inttoptr i64 %t2345 to ptr
  %t2347 = call fastcc i64%t2346(i64 %t2342, i64 2, i64 %t2341, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2348 = call ptr @rt_alloc_words(i64 3)
  %t2349 = ptrtoint ptr %t2348 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_504" to i64), ptr %t2348
  %t2350 = getelementptr i64, ptr %t2348, i64 1
  store i64 %a0, ptr %t2350
  %t2351 = getelementptr i64, ptr %t2348, i64 2
  store i64 %a1, ptr %t2351
  %t2352 = or i64 %t2349, 4
  %t2353 = call ptr @rt_alloc_words(i64 3)
  %t2354 = ptrtoint ptr %t2353 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_508" to i64), ptr %t2353
  %t2355 = getelementptr i64, ptr %t2353, i64 1
  store i64 %a0, ptr %t2355
  %t2356 = getelementptr i64, ptr %t2353, i64 2
  store i64 %t2347, ptr %t2356
  %t2357 = or i64 %t2354, 4
  %t2358 = load i64, ptr @"scheme.base:dynamic-wind"
  %t2359 = and i64 %t2358, -8
  %t2360 = inttoptr i64 %t2359 to ptr
  %t2361 = load i64, ptr %t2360
  %t2362 = inttoptr i64 %t2361 to ptr
  %t2363 = musttail call fastcc i64 %t2362(i64 %t2358, i64 3, i64 %t2352, i64 %a2, i64 %t2357, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2363
}

define fastcc i64 @"scheme.base:code_518"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2368 = icmp eq i64 %argc, 2
  br i1 %t2368, label %argok607, label %arityerr606
arityerr606:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok607:
  %t2369 = call i64 @rt_null_p(i64 %a0)
  %t2370 = icmp ne i64 %t2369, 1
  br i1 %t2370, label %then608, label %else609
then608:
  %t2371 = and i64 %self, -8
  %t2372 = inttoptr i64 %t2371 to ptr
  %t2373 = getelementptr i64, ptr %t2372, i64 1
  %t2374 = load i64, ptr %t2373
  ret i64 %t2374
else609:
  %t2375 = and i64 %self, -8
  %t2376 = inttoptr i64 %t2375 to ptr
  %t2377 = getelementptr i64, ptr %t2376, i64 1
  %t2378 = load i64, ptr %t2377
  %t2379 = call i64 @rt_car(i64 %a0)
  %t2380 = call i64 @rt_vector_set(i64 %t2378, i64 %a1, i64 %t2379)
  %t2381 = call i64 @rt_cdr(i64 %a0)
  %t2382 = or i64 %a1, 8
  %t2383 = and i64 %t2382, 7
  %t2384 = icmp eq i64 %t2383, 0
  br i1 %t2384, label %fixfast610, label %fixslow611
fixfast610:
  %t2385 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t2386 = extractvalue {i64, i1} %t2385, 0
  %t2387 = extractvalue {i64, i1} %t2385, 1
  br i1 %t2387, label %fixslow611, label %fixmerge612
fixslow611:
  %t2388 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge612
fixmerge612:
  %t2389 = phi i64 [ %t2386, %fixfast610 ], [ %t2388, %fixslow611 ]
  %t2390 = musttail call fastcc i64 @"scheme.base:code_518"(i64 %self, i64 2, i64 %t2381, i64 %t2389, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2390
}

define fastcc i64 @"scheme.base:code:list->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2391 = icmp eq i64 %argc, 1
  br i1 %t2391, label %argok614, label %arityerr613
arityerr613:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok614:
  %t2392 = load i64, ptr @"scheme.base:length"
  %t2393 = and i64 %t2392, -8
  %t2394 = inttoptr i64 %t2393 to ptr
  %t2395 = load i64, ptr %t2394
  %t2396 = inttoptr i64 %t2395 to ptr
  %t2397 = call fastcc i64%t2396(i64 %t2392, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2398 = call i64 @rt_make_vector(i64 %t2397, i64 0)
  %t2399 = call ptr @rt_alloc_words(i64 3)
  %t2400 = ptrtoint ptr %t2399 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_518" to i64), ptr %t2399
  %t2401 = or i64 %t2400, 4
  %t2402 = getelementptr i64, ptr %t2399, i64 1
  store i64 %t2398, ptr %t2402
  %t2403 = getelementptr i64, ptr %t2399, i64 2
  store i64 %t2401, ptr %t2403
  %t2404 = musttail call fastcc i64 @"scheme.base:code_518"(i64 %t2401, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2404
}

define fastcc i64 @"scheme.base:code:vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2409 = icmp sge i64 %argc, 0
  br i1 %t2409, label %argok616, label %arityerr615
arityerr615:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok616:
  %t2410 = call ptr @rt_alloc_words(i64 8)
  %t2411 = getelementptr i64, ptr %t2410, i64 0
  store i64 %a0, ptr %t2411
  %t2412 = getelementptr i64, ptr %t2410, i64 1
  store i64 %a1, ptr %t2412
  %t2413 = getelementptr i64, ptr %t2410, i64 2
  store i64 %a2, ptr %t2413
  %t2414 = getelementptr i64, ptr %t2410, i64 3
  store i64 %a3, ptr %t2414
  %t2415 = getelementptr i64, ptr %t2410, i64 4
  store i64 %a4, ptr %t2415
  %t2416 = getelementptr i64, ptr %t2410, i64 5
  store i64 %a5, ptr %t2416
  %t2417 = getelementptr i64, ptr %t2410, i64 6
  store i64 %a6, ptr %t2417
  %t2418 = getelementptr i64, ptr %t2410, i64 7
  store i64 %a7, ptr %t2418
  %t2419 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2410, ptr %overflow)
  %t2420 = load i64, ptr @"scheme.base:list->vector"
  %t2421 = and i64 %t2420, -8
  %t2422 = inttoptr i64 %t2421 to ptr
  %t2423 = load i64, ptr %t2422
  %t2424 = inttoptr i64 %t2423 to ptr
  %t2425 = musttail call fastcc i64 %t2424(i64 %t2420, i64 1, i64 %t2419, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2425
}

define fastcc i64 @"scheme.base:code_528"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2430 = icmp eq i64 %argc, 2
  br i1 %t2430, label %argok618, label %arityerr617
arityerr617:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok618:
  %t2431 = call i64 @rt_null_p(i64 %a0)
  %t2432 = icmp ne i64 %t2431, 1
  br i1 %t2432, label %then619, label %else620
then619:
  %t2433 = and i64 %self, -8
  %t2434 = inttoptr i64 %t2433 to ptr
  %t2435 = getelementptr i64, ptr %t2434, i64 1
  %t2436 = load i64, ptr %t2435
  ret i64 %t2436
else620:
  %t2437 = and i64 %self, -8
  %t2438 = inttoptr i64 %t2437 to ptr
  %t2439 = getelementptr i64, ptr %t2438, i64 1
  %t2440 = load i64, ptr %t2439
  %t2441 = call i64 @rt_car(i64 %a0)
  %t2442 = call i64 @rt_bytevector_u8_set(i64 %t2440, i64 %a1, i64 %t2441)
  %t2443 = call i64 @rt_cdr(i64 %a0)
  %t2444 = or i64 %a1, 8
  %t2445 = and i64 %t2444, 7
  %t2446 = icmp eq i64 %t2445, 0
  br i1 %t2446, label %fixfast621, label %fixslow622
fixfast621:
  %t2447 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t2448 = extractvalue {i64, i1} %t2447, 0
  %t2449 = extractvalue {i64, i1} %t2447, 1
  br i1 %t2449, label %fixslow622, label %fixmerge623
fixslow622:
  %t2450 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge623
fixmerge623:
  %t2451 = phi i64 [ %t2448, %fixfast621 ], [ %t2450, %fixslow622 ]
  %t2452 = musttail call fastcc i64 @"scheme.base:code_528"(i64 %self, i64 2, i64 %t2443, i64 %t2451, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2452
}

define fastcc i64 @"scheme.base:code:list->bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2453 = icmp eq i64 %argc, 1
  br i1 %t2453, label %argok625, label %arityerr624
arityerr624:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok625:
  %t2454 = load i64, ptr @"scheme.base:length"
  %t2455 = and i64 %t2454, -8
  %t2456 = inttoptr i64 %t2455 to ptr
  %t2457 = load i64, ptr %t2456
  %t2458 = inttoptr i64 %t2457 to ptr
  %t2459 = call fastcc i64%t2458(i64 %t2454, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2460 = call i64 @rt_make_bytevector(i64 %t2459, i64 0)
  %t2461 = call ptr @rt_alloc_words(i64 3)
  %t2462 = ptrtoint ptr %t2461 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_528" to i64), ptr %t2461
  %t2463 = or i64 %t2462, 4
  %t2464 = getelementptr i64, ptr %t2461, i64 1
  store i64 %t2460, ptr %t2464
  %t2465 = getelementptr i64, ptr %t2461, i64 2
  store i64 %t2463, ptr %t2465
  %t2466 = musttail call fastcc i64 @"scheme.base:code_528"(i64 %t2463, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2466
}

define fastcc i64 @"scheme.base:code:bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2471 = icmp sge i64 %argc, 0
  br i1 %t2471, label %argok627, label %arityerr626
arityerr626:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok627:
  %t2472 = call ptr @rt_alloc_words(i64 8)
  %t2473 = getelementptr i64, ptr %t2472, i64 0
  store i64 %a0, ptr %t2473
  %t2474 = getelementptr i64, ptr %t2472, i64 1
  store i64 %a1, ptr %t2474
  %t2475 = getelementptr i64, ptr %t2472, i64 2
  store i64 %a2, ptr %t2475
  %t2476 = getelementptr i64, ptr %t2472, i64 3
  store i64 %a3, ptr %t2476
  %t2477 = getelementptr i64, ptr %t2472, i64 4
  store i64 %a4, ptr %t2477
  %t2478 = getelementptr i64, ptr %t2472, i64 5
  store i64 %a5, ptr %t2478
  %t2479 = getelementptr i64, ptr %t2472, i64 6
  store i64 %a6, ptr %t2479
  %t2480 = getelementptr i64, ptr %t2472, i64 7
  store i64 %a7, ptr %t2480
  %t2481 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2472, ptr %overflow)
  %t2482 = load i64, ptr @"scheme.base:list->bytevector"
  %t2483 = and i64 %t2482, -8
  %t2484 = inttoptr i64 %t2483 to ptr
  %t2485 = load i64, ptr %t2484
  %t2486 = inttoptr i64 %t2485 to ptr
  %t2487 = musttail call fastcc i64 %t2486(i64 %t2482, i64 1, i64 %t2481, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2487
}

define fastcc i64 @"scheme.base:code:values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2492 = icmp sge i64 %argc, 0
  br i1 %t2492, label %argok629, label %arityerr628
arityerr628:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok629:
  %t2493 = call ptr @rt_alloc_words(i64 8)
  %t2494 = getelementptr i64, ptr %t2493, i64 0
  store i64 %a0, ptr %t2494
  %t2495 = getelementptr i64, ptr %t2493, i64 1
  store i64 %a1, ptr %t2495
  %t2496 = getelementptr i64, ptr %t2493, i64 2
  store i64 %a2, ptr %t2496
  %t2497 = getelementptr i64, ptr %t2493, i64 3
  store i64 %a3, ptr %t2497
  %t2498 = getelementptr i64, ptr %t2493, i64 4
  store i64 %a4, ptr %t2498
  %t2499 = getelementptr i64, ptr %t2493, i64 5
  store i64 %a5, ptr %t2499
  %t2500 = getelementptr i64, ptr %t2493, i64 6
  store i64 %a6, ptr %t2500
  %t2501 = getelementptr i64, ptr %t2493, i64 7
  store i64 %a7, ptr %t2501
  %t2502 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2493, ptr %overflow)
  %t2503 = call i64 @rt_pair_p(i64 %t2502)
  %t2504 = icmp ne i64 %t2503, 1
  br i1 %t2504, label %then630, label %else631
then630:
  %t2505 = call i64 @rt_cdr(i64 %t2502)
  %t2506 = call i64 @rt_null_p(i64 %t2505)
  br label %merge632
else631:
  br label %merge632
merge632:
  %t2507 = phi i64 [ %t2506, %then630 ], [ 1, %else631 ]
  %t2508 = icmp ne i64 %t2507, 1
  br i1 %t2508, label %then633, label %else634
then633:
  %t2509 = call i64 @rt_car(i64 %t2502)
  ret i64 %t2509
else634:
  %t2510 = call i64 @rt_list_to_mv(i64 %t2502)
  ret i64 %t2510
}

define fastcc i64 @"scheme.base:code:call-with-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2515 = icmp eq i64 %argc, 2
  br i1 %t2515, label %argok636, label %arityerr635
arityerr635:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok636:
  %t2516 = and i64 %a0, -8
  %t2517 = inttoptr i64 %t2516 to ptr
  %t2518 = load i64, ptr %t2517
  %t2519 = inttoptr i64 %t2518 to ptr
  %t2520 = call fastcc i64%t2519(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2521 = call i64 @rt_mv_p(i64 %t2520)
  %t2522 = icmp ne i64 %t2521, 1
  br i1 %t2522, label %then637, label %else638
then637:
  %t2523 = call i64 @rt_mv_to_list(i64 %t2520)
  %t2524 = and i64 %a1, -8
  %t2525 = inttoptr i64 %t2524 to ptr
  %t2526 = load i64, ptr %t2525
  %t2527 = inttoptr i64 %t2526 to ptr
  %t2528 = call i64 @rt_list_length(i64 %t2523)
  %t2529 = add i64 0, %t2528
  %t2530 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t2523, i64 8)
  %t2542 = getelementptr i64, ptr %t2530, i64 0
  %t2534 = load i64, ptr %t2542
  %t2543 = getelementptr i64, ptr %t2530, i64 1
  %t2535 = load i64, ptr %t2543
  %t2544 = getelementptr i64, ptr %t2530, i64 2
  %t2536 = load i64, ptr %t2544
  %t2545 = getelementptr i64, ptr %t2530, i64 3
  %t2537 = load i64, ptr %t2545
  %t2546 = getelementptr i64, ptr %t2530, i64 4
  %t2538 = load i64, ptr %t2546
  %t2547 = getelementptr i64, ptr %t2530, i64 5
  %t2539 = load i64, ptr %t2547
  %t2548 = getelementptr i64, ptr %t2530, i64 6
  %t2540 = load i64, ptr %t2548
  %t2549 = getelementptr i64, ptr %t2530, i64 7
  %t2541 = load i64, ptr %t2549
  %t2531 = icmp sgt i64 %t2529, 8
  %t2532 = getelementptr i64, ptr %t2530, i64 8
  %t2533 = select i1 %t2531, ptr %t2532, ptr null
  %t2550 = musttail call fastcc i64 %t2527(i64 %a1, i64 %t2529, i64 %t2534, i64 %t2535, i64 %t2536, i64 %t2537, i64 %t2538, i64 %t2539, i64 %t2540, i64 %t2541, ptr %t2533)
  ret i64 %t2550
else638:
  %t2551 = and i64 %a1, -8
  %t2552 = inttoptr i64 %t2551 to ptr
  %t2553 = load i64, ptr %t2552
  %t2554 = inttoptr i64 %t2553 to ptr
  %t2555 = musttail call fastcc i64 %t2554(i64 %a1, i64 1, i64 %t2520, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2555
}

define fastcc i64 @"scheme.base:code:make-hash-table"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2562 = icmp eq i64 %argc, 0
  br i1 %t2562, label %argok640, label %arityerr639
arityerr639:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok640:
  %t2563 = load i64, ptr @"scheme.base:%ht-initial-buckets"
  %t2564 = call i64 @rt_make_vector(i64 %t2563, i64 2)
  %t2565 = load i64, ptr @"scheme.base:vector"
  %t2566 = and i64 %t2565, -8
  %t2567 = inttoptr i64 %t2566 to ptr
  %t2568 = load i64, ptr %t2567
  %t2569 = inttoptr i64 %t2568 to ptr
  %t2570 = call fastcc i64%t2569(i64 %t2565, i64 3, i64 0, i64 %t2564, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2571 = call i64 @rt_make_hash_table(i64 %t2570)
  ret i64 %t2571
}

define fastcc i64 @"scheme.base:code:hash-table?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2576 = icmp eq i64 %argc, 1
  br i1 %t2576, label %argok642, label %arityerr641
arityerr641:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok642:
  %t2577 = call i64 @rt_hash_table_p(i64 %a0)
  ret i64 %t2577
}

define fastcc i64 @"scheme.base:code:%ht-count"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2582 = icmp eq i64 %argc, 1
  br i1 %t2582, label %argok644, label %arityerr643
arityerr643:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok644:
  %t2583 = call i64 @rt_hash_table_spine(i64 %a0)
  %t2584 = call i64 @rt_vector_ref(i64 %t2583, i64 0)
  ret i64 %t2584
}

define fastcc i64 @"scheme.base:code:%ht-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2589 = icmp eq i64 %argc, 1
  br i1 %t2589, label %argok646, label %arityerr645
arityerr645:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok646:
  %t2590 = call i64 @rt_hash_table_spine(i64 %a0)
  %t2591 = call i64 @rt_vector_ref(i64 %t2590, i64 8)
  ret i64 %t2591
}

define fastcc i64 @"scheme.base:code:%ht-set-count!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2596 = icmp eq i64 %argc, 2
  br i1 %t2596, label %argok648, label %arityerr647
arityerr647:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok648:
  %t2597 = call i64 @rt_hash_table_spine(i64 %a0)
  %t2598 = call i64 @rt_vector_set(i64 %t2597, i64 0, i64 %a1)
  ret i64 %t2598
}

define fastcc i64 @"scheme.base:code:%ht-set-buckets!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2603 = icmp eq i64 %argc, 2
  br i1 %t2603, label %argok650, label %arityerr649
arityerr649:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok650:
  %t2604 = call i64 @rt_hash_table_spine(i64 %a0)
  %t2605 = call i64 @rt_vector_set(i64 %t2604, i64 8, i64 %a1)
  ret i64 %t2605
}

define fastcc i64 @"scheme.base:code:%ht-index"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2610 = icmp eq i64 %argc, 2
  br i1 %t2610, label %argok652, label %arityerr651
arityerr651:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok652:
  %t2611 = call i64 @rt_hash(i64 %a0)
  %t2612 = call i64 @rt_remainder(i64 %t2611, i64 %a1)
  ret i64 %t2612
}

define fastcc i64 @"scheme.base:code:%ht-assoc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2617 = icmp eq i64 %argc, 2
  br i1 %t2617, label %argok654, label %arityerr653
arityerr653:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok654:
  %t2618 = call i64 @rt_null_p(i64 %a1)
  %t2619 = icmp ne i64 %t2618, 1
  br i1 %t2619, label %then655, label %else656
then655:
  ret i64 1
else656:
  %t2620 = call i64 @rt_car(i64 %a1)
  %t2621 = call i64 @rt_car(i64 %t2620)
  %t2622 = call i64 @rt_equal(i64 %a0, i64 %t2621)
  %t2623 = icmp ne i64 %t2622, 1
  br i1 %t2623, label %then657, label %else658
then657:
  %t2624 = call i64 @rt_car(i64 %a1)
  ret i64 %t2624
else658:
  %t2625 = call i64 @rt_cdr(i64 %a1)
  %t2626 = load i64, ptr @"scheme.base:%ht-assoc"
  %t2627 = and i64 %t2626, -8
  %t2628 = inttoptr i64 %t2627 to ptr
  %t2629 = load i64, ptr %t2628
  %t2630 = inttoptr i64 %t2629 to ptr
  %t2631 = musttail call fastcc i64 %t2630(i64 %t2626, i64 2, i64 %a0, i64 %t2625, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2631
}

define fastcc i64 @"scheme.base:code:%ht-remove"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2636 = icmp eq i64 %argc, 2
  br i1 %t2636, label %argok660, label %arityerr659
arityerr659:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok660:
  %t2637 = call i64 @rt_null_p(i64 %a1)
  %t2638 = icmp ne i64 %t2637, 1
  br i1 %t2638, label %then661, label %else662
then661:
  ret i64 2
else662:
  %t2639 = call i64 @rt_car(i64 %a1)
  %t2640 = call i64 @rt_car(i64 %t2639)
  %t2641 = call i64 @rt_equal(i64 %a0, i64 %t2640)
  %t2642 = icmp ne i64 %t2641, 1
  br i1 %t2642, label %then663, label %else664
then663:
  %t2643 = call i64 @rt_cdr(i64 %a1)
  ret i64 %t2643
else664:
  %t2644 = call i64 @rt_car(i64 %a1)
  %t2645 = call i64 @rt_cdr(i64 %a1)
  %t2646 = load i64, ptr @"scheme.base:%ht-remove"
  %t2647 = and i64 %t2646, -8
  %t2648 = inttoptr i64 %t2647 to ptr
  %t2649 = load i64, ptr %t2648
  %t2650 = inttoptr i64 %t2649 to ptr
  %t2651 = call fastcc i64%t2650(i64 %t2646, i64 2, i64 %a0, i64 %t2645, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2652 = call i64 @rt_cons(i64 %t2644, i64 %t2651)
  ret i64 %t2652
}

define fastcc i64 @"scheme.base:code:hash-table-ref/default"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2657 = icmp eq i64 %argc, 3
  br i1 %t2657, label %argok666, label %arityerr665
arityerr665:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok666:
  %t2658 = load i64, ptr @"scheme.base:%ht-buckets"
  %t2659 = and i64 %t2658, -8
  %t2660 = inttoptr i64 %t2659 to ptr
  %t2661 = load i64, ptr %t2660
  %t2662 = inttoptr i64 %t2661 to ptr
  %t2663 = call fastcc i64%t2662(i64 %t2658, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2664 = call i64 @rt_vector_length(i64 %t2663)
  %t2665 = load i64, ptr @"scheme.base:%ht-index"
  %t2666 = and i64 %t2665, -8
  %t2667 = inttoptr i64 %t2666 to ptr
  %t2668 = load i64, ptr %t2667
  %t2669 = inttoptr i64 %t2668 to ptr
  %t2670 = call fastcc i64%t2669(i64 %t2665, i64 2, i64 %a1, i64 %t2664, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2671 = call i64 @rt_vector_ref(i64 %t2663, i64 %t2670)
  %t2672 = load i64, ptr @"scheme.base:%ht-assoc"
  %t2673 = and i64 %t2672, -8
  %t2674 = inttoptr i64 %t2673 to ptr
  %t2675 = load i64, ptr %t2674
  %t2676 = inttoptr i64 %t2675 to ptr
  %t2677 = call fastcc i64%t2676(i64 %t2672, i64 2, i64 %a1, i64 %t2671, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2678 = icmp ne i64 %t2677, 1
  br i1 %t2678, label %then667, label %else668
then667:
  %t2679 = call i64 @rt_cdr(i64 %t2677)
  ret i64 %t2679
else668:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:hash-table-contains?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2684 = icmp eq i64 %argc, 2
  br i1 %t2684, label %argok670, label %arityerr669
arityerr669:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok670:
  %t2685 = load i64, ptr @"scheme.base:%ht-buckets"
  %t2686 = and i64 %t2685, -8
  %t2687 = inttoptr i64 %t2686 to ptr
  %t2688 = load i64, ptr %t2687
  %t2689 = inttoptr i64 %t2688 to ptr
  %t2690 = call fastcc i64%t2689(i64 %t2685, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2691 = call i64 @rt_vector_length(i64 %t2690)
  %t2692 = load i64, ptr @"scheme.base:%ht-index"
  %t2693 = and i64 %t2692, -8
  %t2694 = inttoptr i64 %t2693 to ptr
  %t2695 = load i64, ptr %t2694
  %t2696 = inttoptr i64 %t2695 to ptr
  %t2697 = call fastcc i64%t2696(i64 %t2692, i64 2, i64 %a1, i64 %t2691, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2698 = call i64 @rt_vector_ref(i64 %t2690, i64 %t2697)
  %t2699 = load i64, ptr @"scheme.base:%ht-assoc"
  %t2700 = and i64 %t2699, -8
  %t2701 = inttoptr i64 %t2700 to ptr
  %t2702 = load i64, ptr %t2701
  %t2703 = inttoptr i64 %t2702 to ptr
  %t2704 = call fastcc i64%t2703(i64 %t2699, i64 2, i64 %a1, i64 %t2698, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2705 = icmp ne i64 %t2704, 1
  br i1 %t2705, label %then671, label %else672
then671:
  ret i64 257
else672:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-ref"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2710 = icmp eq i64 %argc, 2
  br i1 %t2710, label %argok674, label %arityerr673
arityerr673:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok674:
  %t2711 = load i64, ptr @"scheme.base:%ht-buckets"
  %t2712 = and i64 %t2711, -8
  %t2713 = inttoptr i64 %t2712 to ptr
  %t2714 = load i64, ptr %t2713
  %t2715 = inttoptr i64 %t2714 to ptr
  %t2716 = call fastcc i64%t2715(i64 %t2711, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2717 = call i64 @rt_vector_length(i64 %t2716)
  %t2718 = load i64, ptr @"scheme.base:%ht-index"
  %t2719 = and i64 %t2718, -8
  %t2720 = inttoptr i64 %t2719 to ptr
  %t2721 = load i64, ptr %t2720
  %t2722 = inttoptr i64 %t2721 to ptr
  %t2723 = call fastcc i64%t2722(i64 %t2718, i64 2, i64 %a1, i64 %t2717, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2724 = call i64 @rt_vector_ref(i64 %t2716, i64 %t2723)
  %t2725 = load i64, ptr @"scheme.base:%ht-assoc"
  %t2726 = and i64 %t2725, -8
  %t2727 = inttoptr i64 %t2726 to ptr
  %t2728 = load i64, ptr %t2727
  %t2729 = inttoptr i64 %t2728 to ptr
  %t2730 = call fastcc i64%t2729(i64 %t2725, i64 2, i64 %a1, i64 %t2724, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2731 = icmp ne i64 %t2730, 1
  br i1 %t2731, label %then675, label %else676
then675:
  %t2732 = call i64 @rt_cdr(i64 %t2730)
  ret i64 %t2732
else676:
  %t2733 = call i64 @rt_make_string(ptr @.str.lit.12, i64 29)
  %t2734 = load i64, ptr @"scheme.base:error"
  %t2735 = and i64 %t2734, -8
  %t2736 = inttoptr i64 %t2735 to ptr
  %t2737 = load i64, ptr %t2736
  %t2738 = inttoptr i64 %t2737 to ptr
  %t2739 = musttail call fastcc i64 %t2738(i64 %t2734, i64 2, i64 %t2733, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2739
}

define fastcc i64 @"scheme.base:code:hash-table-set!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2744 = icmp eq i64 %argc, 3
  br i1 %t2744, label %argok678, label %arityerr677
arityerr677:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok678:
  %t2745 = load i64, ptr @"scheme.base:%ht-buckets"
  %t2746 = and i64 %t2745, -8
  %t2747 = inttoptr i64 %t2746 to ptr
  %t2748 = load i64, ptr %t2747
  %t2749 = inttoptr i64 %t2748 to ptr
  %t2750 = call fastcc i64%t2749(i64 %t2745, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2751 = call i64 @rt_vector_length(i64 %t2750)
  %t2752 = load i64, ptr @"scheme.base:%ht-index"
  %t2753 = and i64 %t2752, -8
  %t2754 = inttoptr i64 %t2753 to ptr
  %t2755 = load i64, ptr %t2754
  %t2756 = inttoptr i64 %t2755 to ptr
  %t2757 = call fastcc i64%t2756(i64 %t2752, i64 2, i64 %a1, i64 %t2751, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2758 = call i64 @rt_vector_ref(i64 %t2750, i64 %t2757)
  %t2759 = load i64, ptr @"scheme.base:%ht-assoc"
  %t2760 = and i64 %t2759, -8
  %t2761 = inttoptr i64 %t2760 to ptr
  %t2762 = load i64, ptr %t2761
  %t2763 = inttoptr i64 %t2762 to ptr
  %t2764 = call fastcc i64%t2763(i64 %t2759, i64 2, i64 %a1, i64 %t2758, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2765 = call i64 @rt_cons(i64 %a1, i64 %a2)
  %t2766 = icmp ne i64 %t2764, 1
  br i1 %t2766, label %then679, label %else680
then679:
  %t2767 = load i64, ptr @"scheme.base:%ht-remove"
  %t2768 = and i64 %t2767, -8
  %t2769 = inttoptr i64 %t2768 to ptr
  %t2770 = load i64, ptr %t2769
  %t2771 = inttoptr i64 %t2770 to ptr
  %t2772 = call fastcc i64%t2771(i64 %t2767, i64 2, i64 %a1, i64 %t2758, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge681
else680:
  br label %merge681
merge681:
  %t2773 = phi i64 [ %t2772, %then679 ], [ %t2758, %else680 ]
  %t2774 = call i64 @rt_cons(i64 %t2765, i64 %t2773)
  %t2775 = call i64 @rt_vector_set(i64 %t2750, i64 %t2757, i64 %t2774)
  %t2776 = icmp ne i64 %t2764, 1
  br i1 %t2776, label %then682, label %else683
then682:
  ret i64 1
else683:
  %t2777 = load i64, ptr @"scheme.base:%ht-count"
  %t2778 = and i64 %t2777, -8
  %t2779 = inttoptr i64 %t2778 to ptr
  %t2780 = load i64, ptr %t2779
  %t2781 = inttoptr i64 %t2780 to ptr
  %t2782 = call fastcc i64%t2781(i64 %t2777, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2783 = or i64 %t2782, 8
  %t2784 = and i64 %t2783, 7
  %t2785 = icmp eq i64 %t2784, 0
  br i1 %t2785, label %fixfast684, label %fixslow685
fixfast684:
  %t2786 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t2782, i64 8)
  %t2787 = extractvalue {i64, i1} %t2786, 0
  %t2788 = extractvalue {i64, i1} %t2786, 1
  br i1 %t2788, label %fixslow685, label %fixmerge686
fixslow685:
  %t2789 = call i64 @rt_add(i64 %t2782, i64 8)
  br label %fixmerge686
fixmerge686:
  %t2790 = phi i64 [ %t2787, %fixfast684 ], [ %t2789, %fixslow685 ]
  %t2791 = load i64, ptr @"scheme.base:%ht-set-count!"
  %t2792 = and i64 %t2791, -8
  %t2793 = inttoptr i64 %t2792 to ptr
  %t2794 = load i64, ptr %t2793
  %t2795 = inttoptr i64 %t2794 to ptr
  %t2796 = call fastcc i64%t2795(i64 %t2791, i64 2, i64 %a0, i64 %t2790, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2797 = load i64, ptr @"scheme.base:%ht-count"
  %t2798 = and i64 %t2797, -8
  %t2799 = inttoptr i64 %t2798 to ptr
  %t2800 = load i64, ptr %t2799
  %t2801 = inttoptr i64 %t2800 to ptr
  %t2802 = call fastcc i64%t2801(i64 %t2797, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2803 = load i64, ptr @"scheme.base:%ht-load-factor"
  %t2804 = or i64 %t2803, %t2751
  %t2805 = and i64 %t2804, 7
  %t2806 = icmp eq i64 %t2805, 0
  br i1 %t2806, label %fixfast687, label %fixslow688
fixfast687:
  %t2807 = ashr i64 %t2803, 3
  %t2808 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t2807, i64 %t2751)
  %t2809 = extractvalue {i64, i1} %t2808, 0
  %t2810 = extractvalue {i64, i1} %t2808, 1
  br i1 %t2810, label %fixslow688, label %fixmerge689
fixslow688:
  %t2811 = call i64 @rt_mul(i64 %t2803, i64 %t2751)
  br label %fixmerge689
fixmerge689:
  %t2812 = phi i64 [ %t2809, %fixfast687 ], [ %t2811, %fixslow688 ]
  %t2813 = or i64 %t2812, %t2802
  %t2814 = and i64 %t2813, 7
  %t2815 = icmp eq i64 %t2814, 0
  br i1 %t2815, label %fixfast690, label %fixslow691
fixfast690:
  %t2816 = icmp slt i64 %t2812, %t2802
  %t2817 = select i1 %t2816, i64 257, i64 1
  br label %fixmerge692
fixslow691:
  %t2818 = call i64 @rt_lt(i64 %t2812, i64 %t2802)
  br label %fixmerge692
fixmerge692:
  %t2819 = phi i64 [ %t2817, %fixfast690 ], [ %t2818, %fixslow691 ]
  %t2820 = icmp ne i64 %t2819, 1
  br i1 %t2820, label %then693, label %else694
then693:
  %t2821 = load i64, ptr @"scheme.base:%ht-grow!"
  %t2822 = and i64 %t2821, -8
  %t2823 = inttoptr i64 %t2822 to ptr
  %t2824 = load i64, ptr %t2823
  %t2825 = inttoptr i64 %t2824 to ptr
  %t2826 = musttail call fastcc i64 %t2825(i64 %t2821, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2826
else694:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-delete!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2831 = icmp eq i64 %argc, 2
  br i1 %t2831, label %argok696, label %arityerr695
arityerr695:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok696:
  %t2832 = load i64, ptr @"scheme.base:%ht-buckets"
  %t2833 = and i64 %t2832, -8
  %t2834 = inttoptr i64 %t2833 to ptr
  %t2835 = load i64, ptr %t2834
  %t2836 = inttoptr i64 %t2835 to ptr
  %t2837 = call fastcc i64%t2836(i64 %t2832, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2838 = call i64 @rt_vector_length(i64 %t2837)
  %t2839 = load i64, ptr @"scheme.base:%ht-index"
  %t2840 = and i64 %t2839, -8
  %t2841 = inttoptr i64 %t2840 to ptr
  %t2842 = load i64, ptr %t2841
  %t2843 = inttoptr i64 %t2842 to ptr
  %t2844 = call fastcc i64%t2843(i64 %t2839, i64 2, i64 %a1, i64 %t2838, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2845 = call i64 @rt_vector_ref(i64 %t2837, i64 %t2844)
  %t2846 = load i64, ptr @"scheme.base:%ht-assoc"
  %t2847 = and i64 %t2846, -8
  %t2848 = inttoptr i64 %t2847 to ptr
  %t2849 = load i64, ptr %t2848
  %t2850 = inttoptr i64 %t2849 to ptr
  %t2851 = call fastcc i64%t2850(i64 %t2846, i64 2, i64 %a1, i64 %t2845, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2852 = icmp ne i64 %t2851, 1
  br i1 %t2852, label %then697, label %else698
then697:
  %t2853 = load i64, ptr @"scheme.base:%ht-remove"
  %t2854 = and i64 %t2853, -8
  %t2855 = inttoptr i64 %t2854 to ptr
  %t2856 = load i64, ptr %t2855
  %t2857 = inttoptr i64 %t2856 to ptr
  %t2858 = call fastcc i64%t2857(i64 %t2853, i64 2, i64 %a1, i64 %t2845, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2859 = call i64 @rt_vector_set(i64 %t2837, i64 %t2844, i64 %t2858)
  %t2860 = load i64, ptr @"scheme.base:%ht-count"
  %t2861 = and i64 %t2860, -8
  %t2862 = inttoptr i64 %t2861 to ptr
  %t2863 = load i64, ptr %t2862
  %t2864 = inttoptr i64 %t2863 to ptr
  %t2865 = call fastcc i64%t2864(i64 %t2860, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2866 = or i64 %t2865, 8
  %t2867 = and i64 %t2866, 7
  %t2868 = icmp eq i64 %t2867, 0
  br i1 %t2868, label %fixfast699, label %fixslow700
fixfast699:
  %t2869 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t2865, i64 8)
  %t2870 = extractvalue {i64, i1} %t2869, 0
  %t2871 = extractvalue {i64, i1} %t2869, 1
  br i1 %t2871, label %fixslow700, label %fixmerge701
fixslow700:
  %t2872 = call i64 @rt_sub(i64 %t2865, i64 8)
  br label %fixmerge701
fixmerge701:
  %t2873 = phi i64 [ %t2870, %fixfast699 ], [ %t2872, %fixslow700 ]
  %t2874 = load i64, ptr @"scheme.base:%ht-set-count!"
  %t2875 = and i64 %t2874, -8
  %t2876 = inttoptr i64 %t2875 to ptr
  %t2877 = load i64, ptr %t2876
  %t2878 = inttoptr i64 %t2877 to ptr
  %t2879 = musttail call fastcc i64 %t2878(i64 %t2874, i64 2, i64 %a0, i64 %t2873, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2879
else698:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_611"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2884 = icmp eq i64 %argc, 1
  br i1 %t2884, label %argok703, label %arityerr702
arityerr702:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok703:
  %t2885 = call i64 @rt_null_p(i64 %a0)
  %t2886 = icmp ne i64 %t2885, 1
  br i1 %t2886, label %then704, label %else705
then704:
  ret i64 1
else705:
  %t2887 = call i64 @rt_car(i64 %a0)
  %t2888 = call i64 @rt_car(i64 %t2887)
  %t2889 = and i64 %self, -8
  %t2890 = inttoptr i64 %t2889 to ptr
  %t2891 = getelementptr i64, ptr %t2890, i64 1
  %t2892 = load i64, ptr %t2891
  %t2893 = load i64, ptr @"scheme.base:%ht-index"
  %t2894 = and i64 %t2893, -8
  %t2895 = inttoptr i64 %t2894 to ptr
  %t2896 = load i64, ptr %t2895
  %t2897 = inttoptr i64 %t2896 to ptr
  %t2898 = call fastcc i64%t2897(i64 %t2893, i64 2, i64 %t2888, i64 %t2892, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2899 = and i64 %self, -8
  %t2900 = inttoptr i64 %t2899 to ptr
  %t2901 = getelementptr i64, ptr %t2900, i64 2
  %t2902 = load i64, ptr %t2901
  %t2903 = and i64 %self, -8
  %t2904 = inttoptr i64 %t2903 to ptr
  %t2905 = getelementptr i64, ptr %t2904, i64 2
  %t2906 = load i64, ptr %t2905
  %t2907 = call i64 @rt_vector_ref(i64 %t2906, i64 %t2898)
  %t2908 = call i64 @rt_cons(i64 %t2887, i64 %t2907)
  %t2909 = call i64 @rt_vector_set(i64 %t2902, i64 %t2898, i64 %t2908)
  %t2910 = call i64 @rt_cdr(i64 %a0)
  %t2911 = musttail call fastcc i64 @"scheme.base:code_611"(i64 %self, i64 1, i64 %t2910, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2911
}

define fastcc i64 @"scheme.base:code_609"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2912 = icmp eq i64 %argc, 1
  br i1 %t2912, label %argok707, label %arityerr706
arityerr706:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok707:
  %t2913 = and i64 %self, -8
  %t2914 = inttoptr i64 %t2913 to ptr
  %t2915 = getelementptr i64, ptr %t2914, i64 1
  %t2916 = load i64, ptr %t2915
  %t2917 = call i64 @rt_vector_length(i64 %t2916)
  %t2918 = or i64 %a0, %t2917
  %t2919 = and i64 %t2918, 7
  %t2920 = icmp eq i64 %t2919, 0
  br i1 %t2920, label %fixfast708, label %fixslow709
fixfast708:
  %t2921 = icmp slt i64 %a0, %t2917
  %t2922 = select i1 %t2921, i64 257, i64 1
  br label %fixmerge710
fixslow709:
  %t2923 = call i64 @rt_lt(i64 %a0, i64 %t2917)
  br label %fixmerge710
fixmerge710:
  %t2924 = phi i64 [ %t2922, %fixfast708 ], [ %t2923, %fixslow709 ]
  %t2925 = icmp ne i64 %t2924, 1
  br i1 %t2925, label %then711, label %else712
then711:
  %t2926 = call ptr @rt_alloc_words(i64 4)
  %t2927 = ptrtoint ptr %t2926 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_611" to i64), ptr %t2926
  %t2928 = or i64 %t2927, 4
  %t2929 = and i64 %self, -8
  %t2930 = inttoptr i64 %t2929 to ptr
  %t2931 = getelementptr i64, ptr %t2930, i64 2
  %t2932 = load i64, ptr %t2931
  %t2933 = getelementptr i64, ptr %t2926, i64 1
  store i64 %t2932, ptr %t2933
  %t2934 = and i64 %self, -8
  %t2935 = inttoptr i64 %t2934 to ptr
  %t2936 = getelementptr i64, ptr %t2935, i64 3
  %t2937 = load i64, ptr %t2936
  %t2938 = getelementptr i64, ptr %t2926, i64 2
  store i64 %t2937, ptr %t2938
  %t2939 = getelementptr i64, ptr %t2926, i64 3
  store i64 %t2928, ptr %t2939
  %t2940 = and i64 %self, -8
  %t2941 = inttoptr i64 %t2940 to ptr
  %t2942 = getelementptr i64, ptr %t2941, i64 1
  %t2943 = load i64, ptr %t2942
  %t2944 = call i64 @rt_vector_ref(i64 %t2943, i64 %a0)
  %t2945 = call fastcc i64 @"scheme.base:code_611"(i64 %t2928, i64 1, i64 %t2944, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2946 = or i64 %a0, 8
  %t2947 = and i64 %t2946, 7
  %t2948 = icmp eq i64 %t2947, 0
  br i1 %t2948, label %fixfast713, label %fixslow714
fixfast713:
  %t2949 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t2950 = extractvalue {i64, i1} %t2949, 0
  %t2951 = extractvalue {i64, i1} %t2949, 1
  br i1 %t2951, label %fixslow714, label %fixmerge715
fixslow714:
  %t2952 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge715
fixmerge715:
  %t2953 = phi i64 [ %t2950, %fixfast713 ], [ %t2952, %fixslow714 ]
  %t2954 = musttail call fastcc i64 @"scheme.base:code_609"(i64 %self, i64 1, i64 %t2953, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2954
else712:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%ht-grow!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2955 = icmp eq i64 %argc, 1
  br i1 %t2955, label %argok717, label %arityerr716
arityerr716:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok717:
  %t2956 = load i64, ptr @"scheme.base:%ht-buckets"
  %t2957 = and i64 %t2956, -8
  %t2958 = inttoptr i64 %t2957 to ptr
  %t2959 = load i64, ptr %t2958
  %t2960 = inttoptr i64 %t2959 to ptr
  %t2961 = call fastcc i64%t2960(i64 %t2956, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2962 = call i64 @rt_vector_length(i64 %t2961)
  %t2963 = or i64 16, %t2962
  %t2964 = and i64 %t2963, 7
  %t2965 = icmp eq i64 %t2964, 0
  br i1 %t2965, label %fixfast718, label %fixslow719
fixfast718:
  %t2966 = ashr i64 16, 3
  %t2967 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t2966, i64 %t2962)
  %t2968 = extractvalue {i64, i1} %t2967, 0
  %t2969 = extractvalue {i64, i1} %t2967, 1
  br i1 %t2969, label %fixslow719, label %fixmerge720
fixslow719:
  %t2970 = call i64 @rt_mul(i64 16, i64 %t2962)
  br label %fixmerge720
fixmerge720:
  %t2971 = phi i64 [ %t2968, %fixfast718 ], [ %t2970, %fixslow719 ]
  %t2972 = call i64 @rt_make_vector(i64 %t2971, i64 2)
  %t2973 = call ptr @rt_alloc_words(i64 5)
  %t2974 = ptrtoint ptr %t2973 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_609" to i64), ptr %t2973
  %t2975 = or i64 %t2974, 4
  %t2976 = getelementptr i64, ptr %t2973, i64 1
  store i64 %t2961, ptr %t2976
  %t2977 = getelementptr i64, ptr %t2973, i64 2
  store i64 %t2971, ptr %t2977
  %t2978 = getelementptr i64, ptr %t2973, i64 3
  store i64 %t2972, ptr %t2978
  %t2979 = getelementptr i64, ptr %t2973, i64 4
  store i64 %t2975, ptr %t2979
  %t2980 = call fastcc i64 @"scheme.base:code_609"(i64 %t2975, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2981 = load i64, ptr @"scheme.base:%ht-set-buckets!"
  %t2982 = and i64 %t2981, -8
  %t2983 = inttoptr i64 %t2982 to ptr
  %t2984 = load i64, ptr %t2983
  %t2985 = inttoptr i64 %t2984 to ptr
  %t2986 = musttail call fastcc i64 %t2985(i64 %t2981, i64 2, i64 %a0, i64 %t2972, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2986
}

define fastcc i64 @"scheme.base:code:hash-table-size"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2991 = icmp eq i64 %argc, 1
  br i1 %t2991, label %argok722, label %arityerr721
arityerr721:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok722:
  %t2992 = load i64, ptr @"scheme.base:%ht-count"
  %t2993 = and i64 %t2992, -8
  %t2994 = inttoptr i64 %t2993 to ptr
  %t2995 = load i64, ptr %t2994
  %t2996 = inttoptr i64 %t2995 to ptr
  %t2997 = musttail call fastcc i64 %t2996(i64 %t2992, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2997
}

define fastcc i64 @"scheme.base:code:%ht-fold-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3002 = icmp eq i64 %argc, 2
  br i1 %t3002, label %argok724, label %arityerr723
arityerr723:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok724:
  %t3003 = call i64 @rt_null_p(i64 %a0)
  %t3004 = icmp ne i64 %t3003, 1
  br i1 %t3004, label %then725, label %else726
then725:
  ret i64 %a1
else726:
  %t3005 = call i64 @rt_car(i64 %a0)
  %t3006 = call i64 @rt_car(i64 %t3005)
  %t3007 = call i64 @rt_car(i64 %a0)
  %t3008 = call i64 @rt_cdr(i64 %t3007)
  %t3009 = call i64 @rt_cons(i64 %t3006, i64 %t3008)
  %t3010 = call i64 @rt_cdr(i64 %a0)
  %t3011 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  %t3012 = and i64 %t3011, -8
  %t3013 = inttoptr i64 %t3012 to ptr
  %t3014 = load i64, ptr %t3013
  %t3015 = inttoptr i64 %t3014 to ptr
  %t3016 = call fastcc i64%t3015(i64 %t3011, i64 2, i64 %t3010, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3017 = call i64 @rt_cons(i64 %t3009, i64 %t3016)
  ret i64 %t3017
}

define fastcc i64 @"scheme.base:code_628"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3022 = icmp eq i64 %argc, 2
  br i1 %t3022, label %argok728, label %arityerr727
arityerr727:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok728:
  %t3023 = and i64 %self, -8
  %t3024 = inttoptr i64 %t3023 to ptr
  %t3025 = getelementptr i64, ptr %t3024, i64 1
  %t3026 = load i64, ptr %t3025
  %t3027 = call i64 @rt_vector_length(i64 %t3026)
  %t3028 = or i64 %a0, %t3027
  %t3029 = and i64 %t3028, 7
  %t3030 = icmp eq i64 %t3029, 0
  br i1 %t3030, label %fixfast729, label %fixslow730
fixfast729:
  %t3031 = icmp slt i64 %a0, %t3027
  %t3032 = select i1 %t3031, i64 257, i64 1
  br label %fixmerge731
fixslow730:
  %t3033 = call i64 @rt_lt(i64 %a0, i64 %t3027)
  br label %fixmerge731
fixmerge731:
  %t3034 = phi i64 [ %t3032, %fixfast729 ], [ %t3033, %fixslow730 ]
  %t3035 = icmp ne i64 %t3034, 1
  br i1 %t3035, label %then732, label %else733
then732:
  %t3036 = or i64 %a0, 8
  %t3037 = and i64 %t3036, 7
  %t3038 = icmp eq i64 %t3037, 0
  br i1 %t3038, label %fixfast734, label %fixslow735
fixfast734:
  %t3039 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3040 = extractvalue {i64, i1} %t3039, 0
  %t3041 = extractvalue {i64, i1} %t3039, 1
  br i1 %t3041, label %fixslow735, label %fixmerge736
fixslow735:
  %t3042 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge736
fixmerge736:
  %t3043 = phi i64 [ %t3040, %fixfast734 ], [ %t3042, %fixslow735 ]
  %t3044 = and i64 %self, -8
  %t3045 = inttoptr i64 %t3044 to ptr
  %t3046 = getelementptr i64, ptr %t3045, i64 1
  %t3047 = load i64, ptr %t3046
  %t3048 = call i64 @rt_vector_ref(i64 %t3047, i64 %a0)
  %t3049 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  %t3050 = and i64 %t3049, -8
  %t3051 = inttoptr i64 %t3050 to ptr
  %t3052 = load i64, ptr %t3051
  %t3053 = inttoptr i64 %t3052 to ptr
  %t3054 = call fastcc i64%t3053(i64 %t3049, i64 2, i64 %t3048, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3055 = musttail call fastcc i64 @"scheme.base:code_628"(i64 %self, i64 2, i64 %t3043, i64 %t3054, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3055
else733:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:hash-table->alist"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3056 = icmp eq i64 %argc, 1
  br i1 %t3056, label %argok738, label %arityerr737
arityerr737:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok738:
  %t3057 = load i64, ptr @"scheme.base:%ht-buckets"
  %t3058 = and i64 %t3057, -8
  %t3059 = inttoptr i64 %t3058 to ptr
  %t3060 = load i64, ptr %t3059
  %t3061 = inttoptr i64 %t3060 to ptr
  %t3062 = call fastcc i64%t3061(i64 %t3057, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3063 = call ptr @rt_alloc_words(i64 3)
  %t3064 = ptrtoint ptr %t3063 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_628" to i64), ptr %t3063
  %t3065 = or i64 %t3064, 4
  %t3066 = getelementptr i64, ptr %t3063, i64 1
  store i64 %t3062, ptr %t3066
  %t3067 = getelementptr i64, ptr %t3063, i64 2
  store i64 %t3065, ptr %t3067
  %t3068 = musttail call fastcc i64 @"scheme.base:code_628"(i64 %t3065, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3068
}

define fastcc i64 @"scheme.base:code_633"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3073 = icmp eq i64 %argc, 1
  br i1 %t3073, label %argok740, label %arityerr739
arityerr739:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok740:
  %t3074 = call i64 @rt_car(i64 %a0)
  ret i64 %t3074
}

define fastcc i64 @"scheme.base:code:hash-table-keys"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3075 = icmp eq i64 %argc, 1
  br i1 %t3075, label %argok742, label %arityerr741
arityerr741:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok742:
  %t3076 = call ptr @rt_alloc_words(i64 1)
  %t3077 = ptrtoint ptr %t3076 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_633" to i64), ptr %t3076
  %t3078 = or i64 %t3077, 4
  %t3079 = load i64, ptr @"scheme.base:hash-table->alist"
  %t3080 = and i64 %t3079, -8
  %t3081 = inttoptr i64 %t3080 to ptr
  %t3082 = load i64, ptr %t3081
  %t3083 = inttoptr i64 %t3082 to ptr
  %t3084 = call fastcc i64%t3083(i64 %t3079, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3085 = load i64, ptr @"scheme.base:map"
  %t3086 = and i64 %t3085, -8
  %t3087 = inttoptr i64 %t3086 to ptr
  %t3088 = load i64, ptr %t3087
  %t3089 = inttoptr i64 %t3088 to ptr
  %t3090 = musttail call fastcc i64 %t3089(i64 %t3085, i64 2, i64 %t3078, i64 %t3084, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3090
}

define fastcc i64 @"scheme.base:code_638"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3095 = icmp eq i64 %argc, 1
  br i1 %t3095, label %argok744, label %arityerr743
arityerr743:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok744:
  %t3096 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t3096
}

define fastcc i64 @"scheme.base:code:hash-table-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3097 = icmp eq i64 %argc, 1
  br i1 %t3097, label %argok746, label %arityerr745
arityerr745:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok746:
  %t3098 = call ptr @rt_alloc_words(i64 1)
  %t3099 = ptrtoint ptr %t3098 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_638" to i64), ptr %t3098
  %t3100 = or i64 %t3099, 4
  %t3101 = load i64, ptr @"scheme.base:hash-table->alist"
  %t3102 = and i64 %t3101, -8
  %t3103 = inttoptr i64 %t3102 to ptr
  %t3104 = load i64, ptr %t3103
  %t3105 = inttoptr i64 %t3104 to ptr
  %t3106 = call fastcc i64%t3105(i64 %t3101, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3107 = load i64, ptr @"scheme.base:map"
  %t3108 = and i64 %t3107, -8
  %t3109 = inttoptr i64 %t3108 to ptr
  %t3110 = load i64, ptr %t3109
  %t3111 = inttoptr i64 %t3110 to ptr
  %t3112 = musttail call fastcc i64 %t3111(i64 %t3107, i64 2, i64 %t3100, i64 %t3106, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3112
}

define fastcc i64 @"scheme.base:code:rd-report"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3117 = icmp eq i64 %argc, 3
  br i1 %t3117, label %argok748, label %arityerr747
arityerr747:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok748:
  %t3118 = call i64 @rt_car(i64 %a2)
  %t3119 = call i64 @rt_cdr(i64 %a2)
  %t3120 = load i64, ptr @"emit.internal:rd-fail-pos"
  %t3121 = call fastcc i64 @"emit.internal:code:rd-fail-pos"(i64 %t3120, i64 1, i64 %t3119, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3122 = call i64 @rt_intern(ptr @.str.sym.13)
  %t3123 = call i64 @rt_eq_p(i64 %t3118, i64 %t3122)
  %t3124 = icmp ne i64 %t3123, 1
  br i1 %t3124, label %then749, label %else750
then749:
  %t3125 = call i64 @rt_intern(ptr @.str.sym.14)
  %t3126 = call i64 @rt_make_string(ptr @.str.lit.15, i64 45)
  %t3127 = load i64, ptr @"scheme.base:error"
  %t3128 = and i64 %t3127, -8
  %t3129 = inttoptr i64 %t3128 to ptr
  %t3130 = load i64, ptr %t3129
  %t3131 = inttoptr i64 %t3130 to ptr
  %t3132 = musttail call fastcc i64 %t3131(i64 %t3127, i64 3, i64 %t3125, i64 %t3126, i64 %t3121, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3132
else750:
  %t3133 = call i64 @rt_intern(ptr @.str.sym.16)
  %t3134 = call i64 @rt_eq_p(i64 %t3118, i64 %t3133)
  %t3135 = icmp ne i64 %t3134, 1
  br i1 %t3135, label %then751, label %else752
then751:
  %t3136 = call i64 @rt_intern(ptr @.str.sym.14)
  %t3137 = call i64 @rt_make_string(ptr @.str.lit.17, i64 41)
  %t3138 = load i64, ptr @"scheme.base:error"
  %t3139 = and i64 %t3138, -8
  %t3140 = inttoptr i64 %t3139 to ptr
  %t3141 = load i64, ptr %t3140
  %t3142 = inttoptr i64 %t3141 to ptr
  %t3143 = musttail call fastcc i64 %t3142(i64 %t3138, i64 3, i64 %t3136, i64 %t3137, i64 %t3121, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3143
else752:
  %t3144 = call i64 @rt_intern(ptr @.str.sym.18)
  %t3145 = call i64 @rt_eq_p(i64 %t3118, i64 %t3144)
  %t3146 = icmp ne i64 %t3145, 1
  br i1 %t3146, label %then753, label %else754
then753:
  %t3147 = call i64 @rt_intern(ptr @.str.sym.14)
  %t3148 = call i64 @rt_make_string(ptr @.str.lit.19, i64 49)
  %t3149 = load i64, ptr @"scheme.base:error"
  %t3150 = and i64 %t3149, -8
  %t3151 = inttoptr i64 %t3150 to ptr
  %t3152 = load i64, ptr %t3151
  %t3153 = inttoptr i64 %t3152 to ptr
  %t3154 = musttail call fastcc i64 %t3153(i64 %t3149, i64 3, i64 %t3147, i64 %t3148, i64 %t3121, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3154
else754:
  %t3155 = call i64 @rt_intern(ptr @.str.sym.20)
  %t3156 = call i64 @rt_eq_p(i64 %t3118, i64 %t3155)
  %t3157 = icmp ne i64 %t3156, 1
  br i1 %t3157, label %then755, label %else756
then755:
  %t3158 = call i64 @rt_intern(ptr @.str.sym.14)
  %t3159 = call i64 @rt_make_string(ptr @.str.lit.21, i64 23)
  %t3160 = load i64, ptr @"scheme.base:error"
  %t3161 = and i64 %t3160, -8
  %t3162 = inttoptr i64 %t3161 to ptr
  %t3163 = load i64, ptr %t3162
  %t3164 = inttoptr i64 %t3163 to ptr
  %t3165 = musttail call fastcc i64 %t3164(i64 %t3160, i64 3, i64 %t3158, i64 %t3159, i64 %t3121, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3165
else756:
  %t3166 = call i64 @rt_intern(ptr @.str.sym.22)
  %t3167 = call i64 @rt_eq_p(i64 %t3118, i64 %t3166)
  %t3168 = icmp ne i64 %t3167, 1
  br i1 %t3168, label %then757, label %else758
then757:
  %t3169 = call i64 @rt_intern(ptr @.str.sym.14)
  %t3170 = call i64 @rt_make_string(ptr @.str.lit.23, i64 56)
  %t3171 = call i64 @rt_make_string(ptr @.str.lit.24, i64 38)
  %t3172 = call i64 @rt_string_append(i64 %t3170, i64 %t3171)
  %t3173 = load i64, ptr @"emit.internal:rd-token-at"
  %t3174 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t3173, i64 3, i64 %a0, i64 %a1, i64 %t3121, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3175 = load i64, ptr @"scheme.base:error"
  %t3176 = and i64 %t3175, -8
  %t3177 = inttoptr i64 %t3176 to ptr
  %t3178 = load i64, ptr %t3177
  %t3179 = inttoptr i64 %t3178 to ptr
  %t3180 = musttail call fastcc i64 %t3179(i64 %t3175, i64 3, i64 %t3169, i64 %t3172, i64 %t3174, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3180
else758:
  %t3181 = call i64 @rt_intern(ptr @.str.sym.14)
  %t3182 = call i64 @rt_make_string(ptr @.str.lit.25, i64 19)
  %t3183 = load i64, ptr @"emit.internal:rd-token-at"
  %t3184 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t3183, i64 3, i64 %a0, i64 %a1, i64 %t3121, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3185 = load i64, ptr @"scheme.base:error"
  %t3186 = and i64 %t3185, -8
  %t3187 = inttoptr i64 %t3186 to ptr
  %t3188 = load i64, ptr %t3187
  %t3189 = inttoptr i64 %t3188 to ptr
  %t3190 = musttail call fastcc i64 %t3189(i64 %t3185, i64 3, i64 %t3181, i64 %t3182, i64 %t3184, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3190
}

define fastcc i64 @"scheme.base:code:read-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3195 = icmp eq i64 %argc, 1
  br i1 %t3195, label %argok760, label %arityerr759
arityerr759:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok760:
  %t3196 = call i64 @rt_string_length(i64 %a0)
  %t3197 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t3198 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t3197, i64 3, i64 %a0, i64 %t3196, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3199 = load i64, ptr @"emit.internal:rd-datum"
  %t3200 = call fastcc i64 @"emit.internal:code:rd-datum"(i64 %t3199, i64 3, i64 %a0, i64 %t3196, i64 %t3198, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3201 = call i64 @rt_cdr(i64 %t3200)
  %t3202 = load i64, ptr @"emit.internal:rd-fail?"
  %t3203 = call fastcc i64 @"emit.internal:code:rd-fail?"(i64 %t3202, i64 1, i64 %t3201, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3204 = icmp ne i64 %t3203, 1
  br i1 %t3204, label %then761, label %else762
then761:
  %t3205 = load i64, ptr @"scheme.base:rd-report"
  %t3206 = and i64 %t3205, -8
  %t3207 = inttoptr i64 %t3206 to ptr
  %t3208 = load i64, ptr %t3207
  %t3209 = inttoptr i64 %t3208 to ptr
  %t3210 = musttail call fastcc i64 %t3209(i64 %t3205, i64 3, i64 %a0, i64 %t3196, i64 %t3200, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3210
else762:
  %t3211 = call i64 @rt_car(i64 %t3200)
  ret i64 %t3211
}

define fastcc i64 @"scheme.base:code_681"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3216 = icmp eq i64 %argc, 2
  br i1 %t3216, label %argok764, label %arityerr763
arityerr763:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok764:
  %t3217 = load i64, ptr @"emit.internal:rd-fail?"
  %t3218 = call fastcc i64 @"emit.internal:code:rd-fail?"(i64 %t3217, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3219 = icmp ne i64 %t3218, 1
  br i1 %t3219, label %then765, label %else766
then765:
  %t3220 = and i64 %self, -8
  %t3221 = inttoptr i64 %t3220 to ptr
  %t3222 = getelementptr i64, ptr %t3221, i64 1
  %t3223 = load i64, ptr %t3222
  %t3224 = and i64 %self, -8
  %t3225 = inttoptr i64 %t3224 to ptr
  %t3226 = getelementptr i64, ptr %t3225, i64 2
  %t3227 = load i64, ptr %t3226
  %t3228 = call i64 @rt_intern(ptr @.str.sym.13)
  %t3229 = call i64 @rt_cons(i64 %t3228, i64 %a0)
  %t3230 = load i64, ptr @"scheme.base:rd-report"
  %t3231 = and i64 %t3230, -8
  %t3232 = inttoptr i64 %t3231 to ptr
  %t3233 = load i64, ptr %t3232
  %t3234 = inttoptr i64 %t3233 to ptr
  %t3235 = musttail call fastcc i64 %t3234(i64 %t3230, i64 3, i64 %t3223, i64 %t3227, i64 %t3229, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3235
else766:
  %t3236 = and i64 %self, -8
  %t3237 = inttoptr i64 %t3236 to ptr
  %t3238 = getelementptr i64, ptr %t3237, i64 2
  %t3239 = load i64, ptr %t3238
  %t3240 = or i64 %a0, %t3239
  %t3241 = and i64 %t3240, 7
  %t3242 = icmp eq i64 %t3241, 0
  br i1 %t3242, label %fixfast767, label %fixslow768
fixfast767:
  %t3243 = icmp slt i64 %a0, %t3239
  %t3244 = select i1 %t3243, i64 257, i64 1
  br label %fixmerge769
fixslow768:
  %t3245 = call i64 @rt_lt(i64 %a0, i64 %t3239)
  br label %fixmerge769
fixmerge769:
  %t3246 = phi i64 [ %t3244, %fixfast767 ], [ %t3245, %fixslow768 ]
  %t3247 = icmp ne i64 %t3246, 1
  br i1 %t3247, label %then770, label %else771
then770:
  %t3248 = and i64 %self, -8
  %t3249 = inttoptr i64 %t3248 to ptr
  %t3250 = getelementptr i64, ptr %t3249, i64 1
  %t3251 = load i64, ptr %t3250
  %t3252 = and i64 %self, -8
  %t3253 = inttoptr i64 %t3252 to ptr
  %t3254 = getelementptr i64, ptr %t3253, i64 2
  %t3255 = load i64, ptr %t3254
  %t3256 = load i64, ptr @"emit.internal:rd-datum"
  %t3257 = call fastcc i64 @"emit.internal:code:rd-datum"(i64 %t3256, i64 3, i64 %t3251, i64 %t3255, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3258 = call i64 @rt_cdr(i64 %t3257)
  %t3259 = load i64, ptr @"emit.internal:rd-fail?"
  %t3260 = call fastcc i64 @"emit.internal:code:rd-fail?"(i64 %t3259, i64 1, i64 %t3258, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3261 = icmp ne i64 %t3260, 1
  br i1 %t3261, label %then772, label %else773
then772:
  %t3262 = and i64 %self, -8
  %t3263 = inttoptr i64 %t3262 to ptr
  %t3264 = getelementptr i64, ptr %t3263, i64 1
  %t3265 = load i64, ptr %t3264
  %t3266 = and i64 %self, -8
  %t3267 = inttoptr i64 %t3266 to ptr
  %t3268 = getelementptr i64, ptr %t3267, i64 2
  %t3269 = load i64, ptr %t3268
  %t3270 = load i64, ptr @"scheme.base:rd-report"
  %t3271 = and i64 %t3270, -8
  %t3272 = inttoptr i64 %t3271 to ptr
  %t3273 = load i64, ptr %t3272
  %t3274 = inttoptr i64 %t3273 to ptr
  %t3275 = musttail call fastcc i64 %t3274(i64 %t3270, i64 3, i64 %t3265, i64 %t3269, i64 %t3257, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3275
else773:
  %t3276 = and i64 %self, -8
  %t3277 = inttoptr i64 %t3276 to ptr
  %t3278 = getelementptr i64, ptr %t3277, i64 1
  %t3279 = load i64, ptr %t3278
  %t3280 = and i64 %self, -8
  %t3281 = inttoptr i64 %t3280 to ptr
  %t3282 = getelementptr i64, ptr %t3281, i64 2
  %t3283 = load i64, ptr %t3282
  %t3284 = call i64 @rt_cdr(i64 %t3257)
  %t3285 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t3286 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t3285, i64 3, i64 %t3279, i64 %t3283, i64 %t3284, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3287 = call i64 @rt_car(i64 %t3257)
  %t3288 = call i64 @rt_cons(i64 %t3287, i64 %a1)
  %t3289 = musttail call fastcc i64 @"scheme.base:code_681"(i64 %self, i64 2, i64 %t3286, i64 %t3288, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3289
else771:
  %t3290 = load i64, ptr @"scheme.base:reverse"
  %t3291 = and i64 %t3290, -8
  %t3292 = inttoptr i64 %t3291 to ptr
  %t3293 = load i64, ptr %t3292
  %t3294 = inttoptr i64 %t3293 to ptr
  %t3295 = musttail call fastcc i64 %t3294(i64 %t3290, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3295
}

define fastcc i64 @"scheme.base:code:read-all-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3296 = icmp eq i64 %argc, 1
  br i1 %t3296, label %argok775, label %arityerr774
arityerr774:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok775:
  %t3297 = call i64 @rt_string_length(i64 %a0)
  %t3298 = call ptr @rt_alloc_words(i64 4)
  %t3299 = ptrtoint ptr %t3298 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_681" to i64), ptr %t3298
  %t3300 = or i64 %t3299, 4
  %t3301 = getelementptr i64, ptr %t3298, i64 1
  store i64 %a0, ptr %t3301
  %t3302 = getelementptr i64, ptr %t3298, i64 2
  store i64 %t3297, ptr %t3302
  %t3303 = getelementptr i64, ptr %t3298, i64 3
  store i64 %t3300, ptr %t3303
  %t3304 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t3305 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t3304, i64 3, i64 %a0, i64 %t3297, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3306 = musttail call fastcc i64 @"scheme.base:code_681"(i64 %t3300, i64 2, i64 %t3305, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3306
}

define fastcc i64 @"scheme.base:code:port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3311 = icmp eq i64 %argc, 1
  br i1 %t3311, label %argok777, label %arityerr776
arityerr776:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok777:
  %t3312 = load i64, ptr @"emit.internal:%port-rtd"
  %t3313 = call fastcc i64 @"emit.internal:code:%port-rtd"(i64 %t3312, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3314 = call i64 @rt_record_of_type_p(i64 %a0, i64 %t3313)
  ret i64 %t3314
}

define fastcc i64 @"scheme.base:code:input-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3319 = icmp eq i64 %argc, 1
  br i1 %t3319, label %argok779, label %arityerr778
arityerr778:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok779:
  %t3320 = load i64, ptr @"scheme.base:port?"
  %t3321 = and i64 %t3320, -8
  %t3322 = inttoptr i64 %t3321 to ptr
  %t3323 = load i64, ptr %t3322
  %t3324 = inttoptr i64 %t3323 to ptr
  %t3325 = call fastcc i64%t3324(i64 %t3320, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3326 = icmp ne i64 %t3325, 1
  br i1 %t3326, label %then780, label %else781
then780:
  %t3327 = call i64 @rt_record_ref(i64 %a0, i64 8)
  ret i64 %t3327
else781:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3332 = icmp eq i64 %argc, 1
  br i1 %t3332, label %argok783, label %arityerr782
arityerr782:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok783:
  %t3333 = load i64, ptr @"scheme.base:port?"
  %t3334 = and i64 %t3333, -8
  %t3335 = inttoptr i64 %t3334 to ptr
  %t3336 = load i64, ptr %t3335
  %t3337 = inttoptr i64 %t3336 to ptr
  %t3338 = call fastcc i64%t3337(i64 %t3333, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3339 = icmp ne i64 %t3338, 1
  br i1 %t3339, label %then784, label %else785
then784:
  %t3340 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t3341 = call i64 @rt_not(i64 %t3340)
  ret i64 %t3341
else785:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:textual-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3346 = icmp eq i64 %argc, 1
  br i1 %t3346, label %argok787, label %arityerr786
arityerr786:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok787:
  %t3347 = load i64, ptr @"scheme.base:port?"
  %t3348 = and i64 %t3347, -8
  %t3349 = inttoptr i64 %t3348 to ptr
  %t3350 = load i64, ptr %t3349
  %t3351 = inttoptr i64 %t3350 to ptr
  %t3352 = musttail call fastcc i64 %t3351(i64 %t3347, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3352
}

define fastcc i64 @"scheme.base:code:port-closed?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3357 = icmp eq i64 %argc, 1
  br i1 %t3357, label %argok789, label %arityerr788
arityerr788:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok789:
  %t3358 = call i64 @rt_record_ref(i64 %a0, i64 40)
  ret i64 %t3358
}

define fastcc i64 @"scheme.base:code:input-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3363 = icmp eq i64 %argc, 1
  br i1 %t3363, label %argok791, label %arityerr790
arityerr790:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok791:
  %t3364 = load i64, ptr @"scheme.base:input-port?"
  %t3365 = and i64 %t3364, -8
  %t3366 = inttoptr i64 %t3365 to ptr
  %t3367 = load i64, ptr %t3366
  %t3368 = inttoptr i64 %t3367 to ptr
  %t3369 = call fastcc i64%t3368(i64 %t3364, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3370 = icmp ne i64 %t3369, 1
  br i1 %t3370, label %then792, label %else793
then792:
  %t3371 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t3372 = call i64 @rt_not(i64 %t3371)
  ret i64 %t3372
else793:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3377 = icmp eq i64 %argc, 1
  br i1 %t3377, label %argok795, label %arityerr794
arityerr794:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok795:
  %t3378 = load i64, ptr @"scheme.base:output-port?"
  %t3379 = and i64 %t3378, -8
  %t3380 = inttoptr i64 %t3379 to ptr
  %t3381 = load i64, ptr %t3380
  %t3382 = inttoptr i64 %t3381 to ptr
  %t3383 = call fastcc i64%t3382(i64 %t3378, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3384 = icmp ne i64 %t3383, 1
  br i1 %t3384, label %then796, label %else797
then796:
  %t3385 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t3386 = call i64 @rt_not(i64 %t3385)
  ret i64 %t3386
else797:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%check-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3391 = icmp eq i64 %argc, 2
  br i1 %t3391, label %argok799, label %arityerr798
arityerr798:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok799:
  %t3392 = load i64, ptr @"scheme.base:input-port?"
  %t3393 = and i64 %t3392, -8
  %t3394 = inttoptr i64 %t3393 to ptr
  %t3395 = load i64, ptr %t3394
  %t3396 = inttoptr i64 %t3395 to ptr
  %t3397 = call fastcc i64%t3396(i64 %t3392, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3398 = call i64 @rt_not(i64 %t3397)
  %t3399 = icmp ne i64 %t3398, 1
  br i1 %t3399, label %then800, label %else801
then800:
  %t3400 = call i64 @rt_make_string(ptr @.str.lit.26, i64 17)
  %t3401 = load i64, ptr @"scheme.base:error"
  %t3402 = and i64 %t3401, -8
  %t3403 = inttoptr i64 %t3402 to ptr
  %t3404 = load i64, ptr %t3403
  %t3405 = inttoptr i64 %t3404 to ptr
  %t3406 = musttail call fastcc i64 %t3405(i64 %t3401, i64 3, i64 %a1, i64 %t3400, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3406
else801:
  %t3407 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t3408 = icmp ne i64 %t3407, 1
  br i1 %t3408, label %then802, label %else803
then802:
  %t3409 = call i64 @rt_make_string(ptr @.str.lit.27, i64 14)
  %t3410 = load i64, ptr @"scheme.base:error"
  %t3411 = and i64 %t3410, -8
  %t3412 = inttoptr i64 %t3411 to ptr
  %t3413 = load i64, ptr %t3412
  %t3414 = inttoptr i64 %t3413 to ptr
  %t3415 = musttail call fastcc i64 %t3414(i64 %t3410, i64 3, i64 %a1, i64 %t3409, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3415
else803:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:%check-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3420 = icmp eq i64 %argc, 2
  br i1 %t3420, label %argok805, label %arityerr804
arityerr804:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok805:
  %t3421 = load i64, ptr @"scheme.base:output-port?"
  %t3422 = and i64 %t3421, -8
  %t3423 = inttoptr i64 %t3422 to ptr
  %t3424 = load i64, ptr %t3423
  %t3425 = inttoptr i64 %t3424 to ptr
  %t3426 = call fastcc i64%t3425(i64 %t3421, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3427 = call i64 @rt_not(i64 %t3426)
  %t3428 = icmp ne i64 %t3427, 1
  br i1 %t3428, label %then806, label %else807
then806:
  %t3429 = call i64 @rt_make_string(ptr @.str.lit.28, i64 18)
  %t3430 = load i64, ptr @"scheme.base:error"
  %t3431 = and i64 %t3430, -8
  %t3432 = inttoptr i64 %t3431 to ptr
  %t3433 = load i64, ptr %t3432
  %t3434 = inttoptr i64 %t3433 to ptr
  %t3435 = musttail call fastcc i64 %t3434(i64 %t3430, i64 3, i64 %a1, i64 %t3429, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3435
else807:
  %t3436 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t3437 = icmp ne i64 %t3436, 1
  br i1 %t3437, label %then808, label %else809
then808:
  %t3438 = call i64 @rt_make_string(ptr @.str.lit.29, i64 14)
  %t3439 = load i64, ptr @"scheme.base:error"
  %t3440 = and i64 %t3439, -8
  %t3441 = inttoptr i64 %t3440 to ptr
  %t3442 = load i64, ptr %t3441
  %t3443 = inttoptr i64 %t3442 to ptr
  %t3444 = musttail call fastcc i64 %t3443(i64 %t3439, i64 3, i64 %a1, i64 %t3438, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3444
else809:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:open-input-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3449 = icmp eq i64 %argc, 1
  br i1 %t3449, label %argok811, label %arityerr810
arityerr810:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok811:
  %t3450 = load i64, ptr @"emit.internal:%make-port"
  %t3451 = musttail call fastcc i64 @"emit.internal:code:%make-port"(i64 %t3450, i64 6, i64 1, i64 257, i64 %a0, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t3451
}

define fastcc i64 @"scheme.base:code:%port-at-eof?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3456 = icmp eq i64 %argc, 1
  br i1 %t3456, label %argok813, label %arityerr812
arityerr812:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok813:
  %t3457 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t3458 = load i64, ptr @"emit.internal:%port-buf"
  %t3459 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t3458, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3460 = call i64 @rt_string_length(i64 %t3459)
  %t3461 = or i64 %t3460, %t3457
  %t3462 = and i64 %t3461, 7
  %t3463 = icmp eq i64 %t3462, 0
  br i1 %t3463, label %fixfast814, label %fixslow815
fixfast814:
  %t3464 = icmp slt i64 %t3460, %t3457
  %t3465 = select i1 %t3464, i64 257, i64 1
  br label %fixmerge816
fixslow815:
  %t3466 = call i64 @rt_lt(i64 %t3460, i64 %t3457)
  br label %fixmerge816
fixmerge816:
  %t3467 = phi i64 [ %t3465, %fixfast814 ], [ %t3466, %fixslow815 ]
  %t3468 = icmp ne i64 %t3467, 1
  br i1 %t3468, label %then817, label %else818
then817:
  ret i64 257
else818:
  %t3469 = or i64 %t3457, %t3460
  %t3470 = and i64 %t3469, 7
  %t3471 = icmp eq i64 %t3470, 0
  br i1 %t3471, label %fixfast819, label %fixslow820
fixfast819:
  %t3472 = icmp eq i64 %t3457, %t3460
  %t3473 = select i1 %t3472, i64 257, i64 1
  br label %fixmerge821
fixslow820:
  %t3474 = call i64 @rt_num_eq(i64 %t3457, i64 %t3460)
  br label %fixmerge821
fixmerge821:
  %t3475 = phi i64 [ %t3473, %fixfast819 ], [ %t3474, %fixslow820 ]
  ret i64 %t3475
}

define fastcc i64 @"scheme.base:code:read-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3480 = icmp eq i64 %argc, 1
  br i1 %t3480, label %argok823, label %arityerr822
arityerr822:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok823:
  %t3481 = call i64 @rt_intern(ptr @.str.sym.30)
  %t3482 = load i64, ptr @"scheme.base:%check-input-port"
  %t3483 = and i64 %t3482, -8
  %t3484 = inttoptr i64 %t3483 to ptr
  %t3485 = load i64, ptr %t3484
  %t3486 = inttoptr i64 %t3485 to ptr
  %t3487 = call fastcc i64%t3486(i64 %t3482, i64 2, i64 %a0, i64 %t3481, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3488 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t3489 = and i64 %t3488, -8
  %t3490 = inttoptr i64 %t3489 to ptr
  %t3491 = load i64, ptr %t3490
  %t3492 = inttoptr i64 %t3491 to ptr
  %t3493 = call fastcc i64%t3492(i64 %t3488, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3494 = icmp ne i64 %t3493, 1
  br i1 %t3494, label %then824, label %else825
then824:
  %t3495 = call i64 @rt_eof_object()
  ret i64 %t3495
else825:
  %t3496 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t3497 = or i64 %t3496, 8
  %t3498 = and i64 %t3497, 7
  %t3499 = icmp eq i64 %t3498, 0
  br i1 %t3499, label %fixfast826, label %fixslow827
fixfast826:
  %t3500 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3496, i64 8)
  %t3501 = extractvalue {i64, i1} %t3500, 0
  %t3502 = extractvalue {i64, i1} %t3500, 1
  br i1 %t3502, label %fixslow827, label %fixmerge828
fixslow827:
  %t3503 = call i64 @rt_add(i64 %t3496, i64 8)
  br label %fixmerge828
fixmerge828:
  %t3504 = phi i64 [ %t3501, %fixfast826 ], [ %t3503, %fixslow827 ]
  %t3505 = call i64 @rt_record_set(i64 %a0, i64 24, i64 %t3504)
  %t3506 = load i64, ptr @"emit.internal:%port-buf"
  %t3507 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t3506, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3508 = call i64 @rt_string_ref(i64 %t3507, i64 %t3496)
  ret i64 %t3508
}

define fastcc i64 @"scheme.base:code:peek-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3513 = icmp eq i64 %argc, 1
  br i1 %t3513, label %argok830, label %arityerr829
arityerr829:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok830:
  %t3514 = call i64 @rt_intern(ptr @.str.sym.31)
  %t3515 = load i64, ptr @"scheme.base:%check-input-port"
  %t3516 = and i64 %t3515, -8
  %t3517 = inttoptr i64 %t3516 to ptr
  %t3518 = load i64, ptr %t3517
  %t3519 = inttoptr i64 %t3518 to ptr
  %t3520 = call fastcc i64%t3519(i64 %t3515, i64 2, i64 %a0, i64 %t3514, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3521 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t3522 = and i64 %t3521, -8
  %t3523 = inttoptr i64 %t3522 to ptr
  %t3524 = load i64, ptr %t3523
  %t3525 = inttoptr i64 %t3524 to ptr
  %t3526 = call fastcc i64%t3525(i64 %t3521, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3527 = icmp ne i64 %t3526, 1
  br i1 %t3527, label %then831, label %else832
then831:
  %t3528 = call i64 @rt_eof_object()
  ret i64 %t3528
else832:
  %t3529 = load i64, ptr @"emit.internal:%port-buf"
  %t3530 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t3529, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3531 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t3532 = call i64 @rt_string_ref(i64 %t3530, i64 %t3531)
  ret i64 %t3532
}

define fastcc i64 @"scheme.base:code_728"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3537 = icmp eq i64 %argc, 1
  br i1 %t3537, label %argok834, label %arityerr833
arityerr833:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok834:
  %t3538 = and i64 %self, -8
  %t3539 = inttoptr i64 %t3538 to ptr
  %t3540 = getelementptr i64, ptr %t3539, i64 1
  %t3541 = load i64, ptr %t3540
  %t3542 = or i64 %t3541, %a0
  %t3543 = and i64 %t3542, 7
  %t3544 = icmp eq i64 %t3543, 0
  br i1 %t3544, label %fixfast835, label %fixslow836
fixfast835:
  %t3545 = icmp slt i64 %t3541, %a0
  %t3546 = select i1 %t3545, i64 257, i64 1
  br label %fixmerge837
fixslow836:
  %t3547 = call i64 @rt_lt(i64 %t3541, i64 %a0)
  br label %fixmerge837
fixmerge837:
  %t3548 = phi i64 [ %t3546, %fixfast835 ], [ %t3547, %fixslow836 ]
  %t3549 = icmp ne i64 %t3548, 1
  br i1 %t3549, label %then838, label %else839
then838:
  br label %merge840
else839:
  %t3550 = or i64 %a0, %t3541
  %t3551 = and i64 %t3550, 7
  %t3552 = icmp eq i64 %t3551, 0
  br i1 %t3552, label %fixfast841, label %fixslow842
fixfast841:
  %t3553 = icmp eq i64 %a0, %t3541
  %t3554 = select i1 %t3553, i64 257, i64 1
  br label %fixmerge843
fixslow842:
  %t3555 = call i64 @rt_num_eq(i64 %a0, i64 %t3541)
  br label %fixmerge843
fixmerge843:
  %t3556 = phi i64 [ %t3554, %fixfast841 ], [ %t3555, %fixslow842 ]
  br label %merge840
merge840:
  %t3557 = phi i64 [ 257, %then838 ], [ %t3556, %fixmerge843 ]
  %t3558 = icmp ne i64 %t3557, 1
  br i1 %t3558, label %then844, label %else845
then844:
  %t3559 = and i64 %self, -8
  %t3560 = inttoptr i64 %t3559 to ptr
  %t3561 = getelementptr i64, ptr %t3560, i64 2
  %t3562 = load i64, ptr %t3561
  %t3563 = call i64 @rt_record_ref(i64 %t3562, i64 24)
  %t3564 = and i64 %self, -8
  %t3565 = inttoptr i64 %t3564 to ptr
  %t3566 = getelementptr i64, ptr %t3565, i64 2
  %t3567 = load i64, ptr %t3566
  %t3568 = and i64 %self, -8
  %t3569 = inttoptr i64 %t3568 to ptr
  %t3570 = getelementptr i64, ptr %t3569, i64 1
  %t3571 = load i64, ptr %t3570
  %t3572 = call i64 @rt_record_set(i64 %t3567, i64 24, i64 %t3571)
  %t3573 = and i64 %self, -8
  %t3574 = inttoptr i64 %t3573 to ptr
  %t3575 = getelementptr i64, ptr %t3574, i64 3
  %t3576 = load i64, ptr %t3575
  %t3577 = and i64 %self, -8
  %t3578 = inttoptr i64 %t3577 to ptr
  %t3579 = getelementptr i64, ptr %t3578, i64 1
  %t3580 = load i64, ptr %t3579
  %t3581 = call i64 @rt_substring(i64 %t3576, i64 %t3563, i64 %t3580)
  ret i64 %t3581
else845:
  %t3582 = and i64 %self, -8
  %t3583 = inttoptr i64 %t3582 to ptr
  %t3584 = getelementptr i64, ptr %t3583, i64 3
  %t3585 = load i64, ptr %t3584
  %t3586 = call i64 @rt_string_ref(i64 %t3585, i64 %a0)
  %t3587 = load i64, ptr @"scheme.base:char=?"
  %t3588 = and i64 %t3587, -8
  %t3589 = inttoptr i64 %t3588 to ptr
  %t3590 = load i64, ptr %t3589
  %t3591 = inttoptr i64 %t3590 to ptr
  %t3592 = call fastcc i64%t3591(i64 %t3587, i64 2, i64 %t3586, i64 2569, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3593 = icmp ne i64 %t3592, 1
  br i1 %t3593, label %then846, label %else847
then846:
  %t3594 = and i64 %self, -8
  %t3595 = inttoptr i64 %t3594 to ptr
  %t3596 = getelementptr i64, ptr %t3595, i64 2
  %t3597 = load i64, ptr %t3596
  %t3598 = call i64 @rt_record_ref(i64 %t3597, i64 24)
  %t3599 = and i64 %self, -8
  %t3600 = inttoptr i64 %t3599 to ptr
  %t3601 = getelementptr i64, ptr %t3600, i64 2
  %t3602 = load i64, ptr %t3601
  %t3603 = or i64 %a0, 8
  %t3604 = and i64 %t3603, 7
  %t3605 = icmp eq i64 %t3604, 0
  br i1 %t3605, label %fixfast848, label %fixslow849
fixfast848:
  %t3606 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3607 = extractvalue {i64, i1} %t3606, 0
  %t3608 = extractvalue {i64, i1} %t3606, 1
  br i1 %t3608, label %fixslow849, label %fixmerge850
fixslow849:
  %t3609 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge850
fixmerge850:
  %t3610 = phi i64 [ %t3607, %fixfast848 ], [ %t3609, %fixslow849 ]
  %t3611 = call i64 @rt_record_set(i64 %t3602, i64 24, i64 %t3610)
  %t3612 = and i64 %self, -8
  %t3613 = inttoptr i64 %t3612 to ptr
  %t3614 = getelementptr i64, ptr %t3613, i64 3
  %t3615 = load i64, ptr %t3614
  %t3616 = call i64 @rt_substring(i64 %t3615, i64 %t3598, i64 %a0)
  ret i64 %t3616
else847:
  %t3617 = or i64 %a0, 8
  %t3618 = and i64 %t3617, 7
  %t3619 = icmp eq i64 %t3618, 0
  br i1 %t3619, label %fixfast851, label %fixslow852
fixfast851:
  %t3620 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3621 = extractvalue {i64, i1} %t3620, 0
  %t3622 = extractvalue {i64, i1} %t3620, 1
  br i1 %t3622, label %fixslow852, label %fixmerge853
fixslow852:
  %t3623 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge853
fixmerge853:
  %t3624 = phi i64 [ %t3621, %fixfast851 ], [ %t3623, %fixslow852 ]
  %t3625 = musttail call fastcc i64 @"scheme.base:code_728"(i64 %self, i64 1, i64 %t3624, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3625
}

define fastcc i64 @"scheme.base:code:read-line"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3626 = icmp eq i64 %argc, 1
  br i1 %t3626, label %argok855, label %arityerr854
arityerr854:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok855:
  %t3627 = call i64 @rt_intern(ptr @.str.sym.32)
  %t3628 = load i64, ptr @"scheme.base:%check-input-port"
  %t3629 = and i64 %t3628, -8
  %t3630 = inttoptr i64 %t3629 to ptr
  %t3631 = load i64, ptr %t3630
  %t3632 = inttoptr i64 %t3631 to ptr
  %t3633 = call fastcc i64%t3632(i64 %t3628, i64 2, i64 %a0, i64 %t3627, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3634 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t3635 = and i64 %t3634, -8
  %t3636 = inttoptr i64 %t3635 to ptr
  %t3637 = load i64, ptr %t3636
  %t3638 = inttoptr i64 %t3637 to ptr
  %t3639 = call fastcc i64%t3638(i64 %t3634, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3640 = icmp ne i64 %t3639, 1
  br i1 %t3640, label %then856, label %else857
then856:
  %t3641 = call i64 @rt_eof_object()
  ret i64 %t3641
else857:
  %t3642 = load i64, ptr @"emit.internal:%port-buf"
  %t3643 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t3642, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3644 = call i64 @rt_string_length(i64 %t3643)
  %t3645 = call ptr @rt_alloc_words(i64 5)
  %t3646 = ptrtoint ptr %t3645 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_728" to i64), ptr %t3645
  %t3647 = or i64 %t3646, 4
  %t3648 = getelementptr i64, ptr %t3645, i64 1
  store i64 %t3644, ptr %t3648
  %t3649 = getelementptr i64, ptr %t3645, i64 2
  store i64 %a0, ptr %t3649
  %t3650 = getelementptr i64, ptr %t3645, i64 3
  store i64 %t3643, ptr %t3650
  %t3651 = getelementptr i64, ptr %t3645, i64 4
  store i64 %t3647, ptr %t3651
  %t3652 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t3653 = musttail call fastcc i64 @"scheme.base:code_728"(i64 %t3647, i64 1, i64 %t3652, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3653
}

define fastcc i64 @"scheme.base:code:read-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3658 = icmp eq i64 %argc, 2
  br i1 %t3658, label %argok859, label %arityerr858
arityerr858:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok859:
  %t3659 = call i64 @rt_intern(ptr @.str.sym.33)
  %t3660 = load i64, ptr @"scheme.base:%check-input-port"
  %t3661 = and i64 %t3660, -8
  %t3662 = inttoptr i64 %t3661 to ptr
  %t3663 = load i64, ptr %t3662
  %t3664 = inttoptr i64 %t3663 to ptr
  %t3665 = call fastcc i64%t3664(i64 %t3660, i64 2, i64 %a1, i64 %t3659, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3666 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t3667 = and i64 %t3666, -8
  %t3668 = inttoptr i64 %t3667 to ptr
  %t3669 = load i64, ptr %t3668
  %t3670 = inttoptr i64 %t3669 to ptr
  %t3671 = call fastcc i64%t3670(i64 %t3666, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3672 = icmp ne i64 %t3671, 1
  br i1 %t3672, label %then860, label %else861
then860:
  %t3673 = call i64 @rt_eof_object()
  ret i64 %t3673
else861:
  %t3674 = load i64, ptr @"emit.internal:%port-buf"
  %t3675 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t3674, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3676 = call i64 @rt_string_length(i64 %t3675)
  %t3677 = call i64 @rt_record_ref(i64 %a1, i64 24)
  %t3678 = or i64 %t3677, %a0
  %t3679 = and i64 %t3678, 7
  %t3680 = icmp eq i64 %t3679, 0
  br i1 %t3680, label %fixfast862, label %fixslow863
fixfast862:
  %t3681 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3677, i64 %a0)
  %t3682 = extractvalue {i64, i1} %t3681, 0
  %t3683 = extractvalue {i64, i1} %t3681, 1
  br i1 %t3683, label %fixslow863, label %fixmerge864
fixslow863:
  %t3684 = call i64 @rt_add(i64 %t3677, i64 %a0)
  br label %fixmerge864
fixmerge864:
  %t3685 = phi i64 [ %t3682, %fixfast862 ], [ %t3684, %fixslow863 ]
  %t3686 = or i64 %t3676, %t3685
  %t3687 = and i64 %t3686, 7
  %t3688 = icmp eq i64 %t3687, 0
  br i1 %t3688, label %fixfast865, label %fixslow866
fixfast865:
  %t3689 = icmp slt i64 %t3676, %t3685
  %t3690 = select i1 %t3689, i64 257, i64 1
  br label %fixmerge867
fixslow866:
  %t3691 = call i64 @rt_lt(i64 %t3676, i64 %t3685)
  br label %fixmerge867
fixmerge867:
  %t3692 = phi i64 [ %t3690, %fixfast865 ], [ %t3691, %fixslow866 ]
  %t3693 = icmp ne i64 %t3692, 1
  br i1 %t3693, label %then868, label %else869
then868:
  br label %merge870
else869:
  %t3694 = or i64 %t3677, %a0
  %t3695 = and i64 %t3694, 7
  %t3696 = icmp eq i64 %t3695, 0
  br i1 %t3696, label %fixfast871, label %fixslow872
fixfast871:
  %t3697 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3677, i64 %a0)
  %t3698 = extractvalue {i64, i1} %t3697, 0
  %t3699 = extractvalue {i64, i1} %t3697, 1
  br i1 %t3699, label %fixslow872, label %fixmerge873
fixslow872:
  %t3700 = call i64 @rt_add(i64 %t3677, i64 %a0)
  br label %fixmerge873
fixmerge873:
  %t3701 = phi i64 [ %t3698, %fixfast871 ], [ %t3700, %fixslow872 ]
  br label %merge870
merge870:
  %t3702 = phi i64 [ %t3676, %then868 ], [ %t3701, %fixmerge873 ]
  %t3703 = call i64 @rt_record_set(i64 %a1, i64 24, i64 %t3702)
  %t3704 = call i64 @rt_substring(i64 %t3675, i64 %t3677, i64 %t3702)
  ret i64 %t3704
}

define fastcc i64 @"scheme.base:code:open-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3709 = icmp eq i64 %argc, 0
  br i1 %t3709, label %argok875, label %arityerr874
arityerr874:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok875:
  %t3710 = call i64 @rt_port_open_output_string()
  %t3711 = icmp ne i64 %t3710, 1
  br i1 %t3711, label %then876, label %else877
then876:
  %t3712 = load i64, ptr @"emit.internal:%make-port"
  %t3713 = musttail call fastcc i64 @"emit.internal:code:%make-port"(i64 %t3712, i64 6, i64 %t3710, i64 1, i64 1, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t3713
else877:
  %t3714 = call i64 @rt_intern(ptr @.str.sym.34)
  %t3715 = call i64 @rt_make_string(ptr @.str.lit.35, i64 33)
  %t3716 = load i64, ptr @"scheme.base:error"
  %t3717 = and i64 %t3716, -8
  %t3718 = inttoptr i64 %t3717 to ptr
  %t3719 = load i64, ptr %t3718
  %t3720 = inttoptr i64 %t3719 to ptr
  %t3721 = musttail call fastcc i64 %t3720(i64 %t3716, i64 2, i64 %t3714, i64 %t3715, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3721
}

define fastcc i64 @"scheme.base:code:get-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3726 = icmp eq i64 %argc, 1
  br i1 %t3726, label %argok879, label %arityerr878
arityerr878:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok879:
  %t3727 = load i64, ptr @"scheme.base:output-port?"
  %t3728 = and i64 %t3727, -8
  %t3729 = inttoptr i64 %t3728 to ptr
  %t3730 = load i64, ptr %t3729
  %t3731 = inttoptr i64 %t3730 to ptr
  %t3732 = call fastcc i64%t3731(i64 %t3727, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3733 = call i64 @rt_not(i64 %t3732)
  %t3734 = icmp ne i64 %t3733, 1
  br i1 %t3734, label %then880, label %else881
then880:
  %t3735 = call i64 @rt_intern(ptr @.str.sym.36)
  %t3736 = call i64 @rt_make_string(ptr @.str.lit.37, i64 18)
  %t3737 = load i64, ptr @"scheme.base:error"
  %t3738 = and i64 %t3737, -8
  %t3739 = inttoptr i64 %t3738 to ptr
  %t3740 = load i64, ptr %t3739
  %t3741 = inttoptr i64 %t3740 to ptr
  %t3742 = musttail call fastcc i64 %t3741(i64 %t3737, i64 3, i64 %t3735, i64 %t3736, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3742
else881:
  %t3743 = call i64 @rt_record_ref(i64 %a0, i64 32)
  %t3744 = call i64 @rt_not(i64 %t3743)
  %t3745 = icmp ne i64 %t3744, 1
  br i1 %t3745, label %then882, label %else883
then882:
  %t3746 = call i64 @rt_intern(ptr @.str.sym.36)
  %t3747 = call i64 @rt_make_string(ptr @.str.lit.38, i64 17)
  %t3748 = load i64, ptr @"scheme.base:error"
  %t3749 = and i64 %t3748, -8
  %t3750 = inttoptr i64 %t3749 to ptr
  %t3751 = load i64, ptr %t3750
  %t3752 = inttoptr i64 %t3751 to ptr
  %t3753 = musttail call fastcc i64 %t3752(i64 %t3748, i64 3, i64 %t3746, i64 %t3747, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3753
else883:
  %t3754 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t3755 = call i64 @rt_port_get_output_string(i64 %t3754)
  ret i64 %t3755
}

define fastcc i64 @"scheme.base:code:flush-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3760 = icmp eq i64 %argc, 1
  br i1 %t3760, label %argok885, label %arityerr884
arityerr884:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok885:
  %t3761 = call i64 @rt_intern(ptr @.str.sym.39)
  %t3762 = load i64, ptr @"scheme.base:%check-output-port"
  %t3763 = and i64 %t3762, -8
  %t3764 = inttoptr i64 %t3763 to ptr
  %t3765 = load i64, ptr %t3764
  %t3766 = inttoptr i64 %t3765 to ptr
  %t3767 = call fastcc i64%t3766(i64 %t3762, i64 2, i64 %a0, i64 %t3761, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3768 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t3769 = call i64 @rt_port_flush(i64 %t3768)
  ret i64 %t3769
}

define fastcc i64 @"scheme.base:code:close-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3774 = icmp eq i64 %argc, 1
  br i1 %t3774, label %argok887, label %arityerr886
arityerr886:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok887:
  %t3775 = load i64, ptr @"scheme.base:port?"
  %t3776 = and i64 %t3775, -8
  %t3777 = inttoptr i64 %t3776 to ptr
  %t3778 = load i64, ptr %t3777
  %t3779 = inttoptr i64 %t3778 to ptr
  %t3780 = call fastcc i64%t3779(i64 %t3775, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3781 = call i64 @rt_not(i64 %t3780)
  %t3782 = icmp ne i64 %t3781, 1
  br i1 %t3782, label %then888, label %else889
then888:
  %t3783 = call i64 @rt_intern(ptr @.str.sym.40)
  %t3784 = call i64 @rt_make_string(ptr @.str.lit.41, i64 10)
  %t3785 = load i64, ptr @"scheme.base:error"
  %t3786 = and i64 %t3785, -8
  %t3787 = inttoptr i64 %t3786 to ptr
  %t3788 = load i64, ptr %t3787
  %t3789 = inttoptr i64 %t3788 to ptr
  %t3790 = musttail call fastcc i64 %t3789(i64 %t3785, i64 3, i64 %t3783, i64 %t3784, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3790
else889:
  %t3791 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t3792 = icmp ne i64 %t3791, 1
  br i1 %t3792, label %then890, label %else891
then890:
  %t3793 = icmp ne i64 1, 1
  br i1 %t3793, label %then892, label %else893
then892:
  ret i64 1
else893:
  ret i64 17
else891:
  %t3794 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t3795 = call i64 @rt_not(i64 %t3794)
  %t3796 = icmp ne i64 %t3795, 1
  br i1 %t3796, label %then894, label %else895
then894:
  %t3797 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t3798 = call i64 @rt_port_close(i64 %t3797)
  br label %merge896
else895:
  br label %merge896
merge896:
  %t3799 = phi i64 [ %t3798, %then894 ], [ 17, %else895 ]
  %t3800 = call i64 @rt_record_set(i64 %a0, i64 40, i64 257)
  %t3801 = icmp ne i64 1, 1
  br i1 %t3801, label %then897, label %else898
then897:
  ret i64 1
else898:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:close-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3806 = icmp eq i64 %argc, 1
  br i1 %t3806, label %argok900, label %arityerr899
arityerr899:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok900:
  %t3807 = load i64, ptr @"scheme.base:input-port?"
  %t3808 = and i64 %t3807, -8
  %t3809 = inttoptr i64 %t3808 to ptr
  %t3810 = load i64, ptr %t3809
  %t3811 = inttoptr i64 %t3810 to ptr
  %t3812 = call fastcc i64%t3811(i64 %t3807, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3813 = icmp ne i64 %t3812, 1
  br i1 %t3813, label %then901, label %else902
then901:
  %t3814 = load i64, ptr @"scheme.base:close-port"
  %t3815 = and i64 %t3814, -8
  %t3816 = inttoptr i64 %t3815 to ptr
  %t3817 = load i64, ptr %t3816
  %t3818 = inttoptr i64 %t3817 to ptr
  %t3819 = musttail call fastcc i64 %t3818(i64 %t3814, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3819
else902:
  %t3820 = call i64 @rt_intern(ptr @.str.sym.42)
  %t3821 = call i64 @rt_make_string(ptr @.str.lit.43, i64 17)
  %t3822 = load i64, ptr @"scheme.base:error"
  %t3823 = and i64 %t3822, -8
  %t3824 = inttoptr i64 %t3823 to ptr
  %t3825 = load i64, ptr %t3824
  %t3826 = inttoptr i64 %t3825 to ptr
  %t3827 = musttail call fastcc i64 %t3826(i64 %t3822, i64 3, i64 %t3820, i64 %t3821, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3827
}

define fastcc i64 @"scheme.base:code:close-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3832 = icmp eq i64 %argc, 1
  br i1 %t3832, label %argok904, label %arityerr903
arityerr903:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok904:
  %t3833 = load i64, ptr @"scheme.base:output-port?"
  %t3834 = and i64 %t3833, -8
  %t3835 = inttoptr i64 %t3834 to ptr
  %t3836 = load i64, ptr %t3835
  %t3837 = inttoptr i64 %t3836 to ptr
  %t3838 = call fastcc i64%t3837(i64 %t3833, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3839 = icmp ne i64 %t3838, 1
  br i1 %t3839, label %then905, label %else906
then905:
  %t3840 = load i64, ptr @"scheme.base:close-port"
  %t3841 = and i64 %t3840, -8
  %t3842 = inttoptr i64 %t3841 to ptr
  %t3843 = load i64, ptr %t3842
  %t3844 = inttoptr i64 %t3843 to ptr
  %t3845 = musttail call fastcc i64 %t3844(i64 %t3840, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3845
else906:
  %t3846 = call i64 @rt_intern(ptr @.str.sym.44)
  %t3847 = call i64 @rt_make_string(ptr @.str.lit.45, i64 18)
  %t3848 = load i64, ptr @"scheme.base:error"
  %t3849 = and i64 %t3848, -8
  %t3850 = inttoptr i64 %t3849 to ptr
  %t3851 = load i64, ptr %t3850
  %t3852 = inttoptr i64 %t3851 to ptr
  %t3853 = musttail call fastcc i64 %t3852(i64 %t3848, i64 3, i64 %t3846, i64 %t3847, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3853
}

define fastcc i64 @"scheme.base:code:current-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3861 = icmp sge i64 %argc, 0
  br i1 %t3861, label %argok908, label %arityerr907
arityerr907:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok908:
  %t3862 = call ptr @rt_alloc_words(i64 8)
  %t3863 = getelementptr i64, ptr %t3862, i64 0
  store i64 %a0, ptr %t3863
  %t3864 = getelementptr i64, ptr %t3862, i64 1
  store i64 %a1, ptr %t3864
  %t3865 = getelementptr i64, ptr %t3862, i64 2
  store i64 %a2, ptr %t3865
  %t3866 = getelementptr i64, ptr %t3862, i64 3
  store i64 %a3, ptr %t3866
  %t3867 = getelementptr i64, ptr %t3862, i64 4
  store i64 %a4, ptr %t3867
  %t3868 = getelementptr i64, ptr %t3862, i64 5
  store i64 %a5, ptr %t3868
  %t3869 = getelementptr i64, ptr %t3862, i64 6
  store i64 %a6, ptr %t3869
  %t3870 = getelementptr i64, ptr %t3862, i64 7
  store i64 %a7, ptr %t3870
  %t3871 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t3862, ptr %overflow)
  %t3872 = call i64 @rt_null_p(i64 %t3871)
  %t3873 = icmp ne i64 %t3872, 1
  br i1 %t3873, label %then909, label %else910
then909:
  %t3874 = load i64, ptr @"scheme.base:%stdout-port"
  %t3875 = call i64 @rt_not(i64 %t3874)
  %t3876 = icmp ne i64 %t3875, 1
  br i1 %t3876, label %then911, label %else912
then911:
  %t3877 = load i64, ptr @"emit.internal:%make-port"
  %t3878 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t3877, i64 6, i64 0, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t3879 = call i64 @rt_root(i64 %t3878)
  store i64 %t3879, ptr @"scheme.base:%stdout-port"
  %t3880 = call i64 @rt_set_current_output(i64 0)
  br label %merge913
else912:
  br label %merge913
merge913:
  %t3881 = phi i64 [ %t3880, %then911 ], [ 17, %else912 ]
  %t3882 = load i64, ptr @"scheme.base:%stdout-port"
  ret i64 %t3882
else910:
  %t3883 = call i64 @rt_car(i64 %t3871)
  %t3884 = call i64 @rt_root(i64 %t3883)
  store i64 %t3884, ptr @"scheme.base:%stdout-port"
  %t3885 = call i64 @rt_record_ref(i64 %t3883, i64 0)
  %t3886 = call i64 @rt_set_current_output(i64 %t3885)
  %t3887 = icmp ne i64 1, 1
  br i1 %t3887, label %then914, label %else915
then914:
  ret i64 1
else915:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-error-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3892 = icmp sge i64 %argc, 0
  br i1 %t3892, label %argok917, label %arityerr916
arityerr916:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok917:
  %t3893 = call ptr @rt_alloc_words(i64 8)
  %t3894 = getelementptr i64, ptr %t3893, i64 0
  store i64 %a0, ptr %t3894
  %t3895 = getelementptr i64, ptr %t3893, i64 1
  store i64 %a1, ptr %t3895
  %t3896 = getelementptr i64, ptr %t3893, i64 2
  store i64 %a2, ptr %t3896
  %t3897 = getelementptr i64, ptr %t3893, i64 3
  store i64 %a3, ptr %t3897
  %t3898 = getelementptr i64, ptr %t3893, i64 4
  store i64 %a4, ptr %t3898
  %t3899 = getelementptr i64, ptr %t3893, i64 5
  store i64 %a5, ptr %t3899
  %t3900 = getelementptr i64, ptr %t3893, i64 6
  store i64 %a6, ptr %t3900
  %t3901 = getelementptr i64, ptr %t3893, i64 7
  store i64 %a7, ptr %t3901
  %t3902 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t3893, ptr %overflow)
  %t3903 = call i64 @rt_null_p(i64 %t3902)
  %t3904 = icmp ne i64 %t3903, 1
  br i1 %t3904, label %then918, label %else919
then918:
  %t3905 = load i64, ptr @"scheme.base:%stderr-port"
  %t3906 = call i64 @rt_not(i64 %t3905)
  %t3907 = icmp ne i64 %t3906, 1
  br i1 %t3907, label %then920, label %else921
then920:
  %t3908 = load i64, ptr @"emit.internal:%make-port"
  %t3909 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t3908, i64 6, i64 8, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t3910 = call i64 @rt_root(i64 %t3909)
  store i64 %t3910, ptr @"scheme.base:%stderr-port"
  br label %merge922
else921:
  br label %merge922
merge922:
  %t3911 = phi i64 [ 17, %then920 ], [ 17, %else921 ]
  %t3912 = load i64, ptr @"scheme.base:%stderr-port"
  ret i64 %t3912
else919:
  %t3913 = call i64 @rt_car(i64 %t3902)
  %t3914 = call i64 @rt_root(i64 %t3913)
  store i64 %t3914, ptr @"scheme.base:%stderr-port"
  %t3915 = icmp ne i64 1, 1
  br i1 %t3915, label %then923, label %else924
then923:
  ret i64 1
else924:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3920 = icmp sge i64 %argc, 0
  br i1 %t3920, label %argok926, label %arityerr925
arityerr925:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok926:
  %t3921 = call ptr @rt_alloc_words(i64 8)
  %t3922 = getelementptr i64, ptr %t3921, i64 0
  store i64 %a0, ptr %t3922
  %t3923 = getelementptr i64, ptr %t3921, i64 1
  store i64 %a1, ptr %t3923
  %t3924 = getelementptr i64, ptr %t3921, i64 2
  store i64 %a2, ptr %t3924
  %t3925 = getelementptr i64, ptr %t3921, i64 3
  store i64 %a3, ptr %t3925
  %t3926 = getelementptr i64, ptr %t3921, i64 4
  store i64 %a4, ptr %t3926
  %t3927 = getelementptr i64, ptr %t3921, i64 5
  store i64 %a5, ptr %t3927
  %t3928 = getelementptr i64, ptr %t3921, i64 6
  store i64 %a6, ptr %t3928
  %t3929 = getelementptr i64, ptr %t3921, i64 7
  store i64 %a7, ptr %t3929
  %t3930 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t3921, ptr %overflow)
  %t3931 = call i64 @rt_null_p(i64 %t3930)
  %t3932 = icmp ne i64 %t3931, 1
  br i1 %t3932, label %then927, label %else928
then927:
  %t3933 = load i64, ptr @"scheme.base:%stdin-port"
  %t3934 = call i64 @rt_not(i64 %t3933)
  %t3935 = icmp ne i64 %t3934, 1
  br i1 %t3935, label %then929, label %else930
then929:
  %t3936 = load i64, ptr @"emit.internal:%make-port"
  %t3937 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t3936, i64 6, i64 1, i64 257, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t3938 = call i64 @rt_root(i64 %t3937)
  store i64 %t3938, ptr @"scheme.base:%stdin-port"
  br label %merge931
else930:
  br label %merge931
merge931:
  %t3939 = phi i64 [ 17, %then929 ], [ 17, %else930 ]
  %t3940 = load i64, ptr @"scheme.base:%stdin-port"
  ret i64 %t3940
else928:
  %t3941 = call i64 @rt_car(i64 %t3930)
  %t3942 = call i64 @rt_root(i64 %t3941)
  store i64 %t3942, ptr @"scheme.base:%stdin-port"
  %t3943 = icmp ne i64 1, 1
  br i1 %t3943, label %then932, label %else933
then932:
  ret i64 1
else933:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_763"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3948 = icmp eq i64 %argc, 0
  br i1 %t3948, label %argok935, label %arityerr934
arityerr934:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok935:
  %t3949 = icmp ne i64 1, 1
  br i1 %t3949, label %then936, label %else937
then936:
  ret i64 1
else937:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_765"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3950 = icmp eq i64 %argc, 0
  br i1 %t3950, label %argok939, label %arityerr938
arityerr938:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok939:
  %t3951 = and i64 %self, -8
  %t3952 = inttoptr i64 %t3951 to ptr
  %t3953 = getelementptr i64, ptr %t3952, i64 2
  %t3954 = load i64, ptr %t3953
  %t3955 = and i64 %self, -8
  %t3956 = inttoptr i64 %t3955 to ptr
  %t3957 = getelementptr i64, ptr %t3956, i64 1
  %t3958 = load i64, ptr %t3957
  %t3959 = and i64 %t3958, -8
  %t3960 = inttoptr i64 %t3959 to ptr
  %t3961 = load i64, ptr %t3960
  %t3962 = inttoptr i64 %t3961 to ptr
  %t3963 = musttail call fastcc i64 %t3962(i64 %t3958, i64 1, i64 %t3954, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3963
}

define fastcc i64 @"scheme.base:code_767"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3964 = icmp eq i64 %argc, 0
  br i1 %t3964, label %argok941, label %arityerr940
arityerr940:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok941:
  %t3965 = and i64 %self, -8
  %t3966 = inttoptr i64 %t3965 to ptr
  %t3967 = getelementptr i64, ptr %t3966, i64 1
  %t3968 = load i64, ptr %t3967
  %t3969 = load i64, ptr @"scheme.base:close-port"
  %t3970 = and i64 %t3969, -8
  %t3971 = inttoptr i64 %t3970 to ptr
  %t3972 = load i64, ptr %t3971
  %t3973 = inttoptr i64 %t3972 to ptr
  %t3974 = musttail call fastcc i64 %t3973(i64 %t3969, i64 1, i64 %t3968, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3974
}

define fastcc i64 @"scheme.base:code:call-with-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3975 = icmp eq i64 %argc, 2
  br i1 %t3975, label %argok943, label %arityerr942
arityerr942:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok943:
  %t3976 = call ptr @rt_alloc_words(i64 1)
  %t3977 = ptrtoint ptr %t3976 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_763" to i64), ptr %t3976
  %t3978 = or i64 %t3977, 4
  %t3979 = call ptr @rt_alloc_words(i64 3)
  %t3980 = ptrtoint ptr %t3979 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_765" to i64), ptr %t3979
  %t3981 = getelementptr i64, ptr %t3979, i64 1
  store i64 %a1, ptr %t3981
  %t3982 = getelementptr i64, ptr %t3979, i64 2
  store i64 %a0, ptr %t3982
  %t3983 = or i64 %t3980, 4
  %t3984 = call ptr @rt_alloc_words(i64 2)
  %t3985 = ptrtoint ptr %t3984 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_767" to i64), ptr %t3984
  %t3986 = getelementptr i64, ptr %t3984, i64 1
  store i64 %a0, ptr %t3986
  %t3987 = or i64 %t3985, 4
  %t3988 = load i64, ptr @"scheme.base:dynamic-wind"
  %t3989 = and i64 %t3988, -8
  %t3990 = inttoptr i64 %t3989 to ptr
  %t3991 = load i64, ptr %t3990
  %t3992 = inttoptr i64 %t3991 to ptr
  %t3993 = musttail call fastcc i64 %t3992(i64 %t3988, i64 3, i64 %t3978, i64 %t3983, i64 %t3987, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3993
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
  %t63 = call ptr @rt_alloc_words(i64 1)
  %t64 = ptrtoint ptr %t63 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:length" to i64), ptr %t63
  %t65 = or i64 %t64, 4
  %t66 = call i64 @rt_root(i64 %t65)
  store i64 %t66, ptr @"scheme.base:length"
  ret i64 17
}

define i64 @"scheme.base:__init_7"() {
entry:
  %t80 = call ptr @rt_alloc_words(i64 1)
  %t81 = ptrtoint ptr %t80 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:reverse" to i64), ptr %t80
  %t82 = or i64 %t81, 4
  %t83 = call i64 @rt_root(i64 %t82)
  store i64 %t83, ptr @"scheme.base:reverse"
  ret i64 17
}

define i64 @"scheme.base:__init_8"() {
entry:
  %t96 = call ptr @rt_alloc_words(i64 1)
  %t97 = ptrtoint ptr %t96 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%append2" to i64), ptr %t96
  %t98 = or i64 %t97, 4
  %t99 = call i64 @rt_root(i64 %t98)
  store i64 %t99, ptr @"scheme.base:%append2"
  ret i64 17
}

define i64 @"scheme.base:__init_9"() {
entry:
  %t153 = call ptr @rt_alloc_words(i64 1)
  %t154 = ptrtoint ptr %t153 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:append" to i64), ptr %t153
  %t155 = or i64 %t154, 4
  %t156 = call i64 @rt_root(i64 %t155)
  store i64 %t156, ptr @"scheme.base:append"
  ret i64 17
}

define i64 @"scheme.base:__init_10"() {
entry:
  %t174 = call ptr @rt_alloc_words(i64 1)
  %t175 = ptrtoint ptr %t174 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%map1" to i64), ptr %t174
  %t176 = or i64 %t175, 4
  %t177 = call i64 @rt_root(i64 %t176)
  store i64 %t177, ptr @"scheme.base:%map1"
  ret i64 17
}

define i64 @"scheme.base:__init_11"() {
entry:
  %t191 = call ptr @rt_alloc_words(i64 1)
  %t192 = ptrtoint ptr %t191 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%any-null?" to i64), ptr %t191
  %t193 = or i64 %t192, 4
  %t194 = call i64 @rt_root(i64 %t193)
  store i64 %t194, ptr @"scheme.base:%any-null?"
  ret i64 17
}

define i64 @"scheme.base:__init_12"() {
entry:
  %t259 = call ptr @rt_alloc_words(i64 1)
  %t260 = ptrtoint ptr %t259 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%mapn" to i64), ptr %t259
  %t261 = or i64 %t260, 4
  %t262 = call i64 @rt_root(i64 %t261)
  store i64 %t262, ptr @"scheme.base:%mapn"
  ret i64 17
}

define i64 @"scheme.base:__init_13"() {
entry:
  %t289 = call ptr @rt_alloc_words(i64 1)
  %t290 = ptrtoint ptr %t289 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:map" to i64), ptr %t289
  %t291 = or i64 %t290, 4
  %t292 = call i64 @rt_root(i64 %t291)
  store i64 %t292, ptr @"scheme.base:map"
  ret i64 17
}

define i64 @"scheme.base:__init_14"() {
entry:
  %t306 = call ptr @rt_alloc_words(i64 1)
  %t307 = ptrtoint ptr %t306 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:memq" to i64), ptr %t306
  %t308 = or i64 %t307, 4
  %t309 = call i64 @rt_root(i64 %t308)
  store i64 %t309, ptr @"scheme.base:memq"
  ret i64 17
}

define i64 @"scheme.base:__init_15"() {
entry:
  %t323 = call ptr @rt_alloc_words(i64 1)
  %t324 = ptrtoint ptr %t323 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:memv" to i64), ptr %t323
  %t325 = or i64 %t324, 4
  %t326 = call i64 @rt_root(i64 %t325)
  store i64 %t326, ptr @"scheme.base:memv"
  ret i64 17
}

define i64 @"scheme.base:__init_16"() {
entry:
  %t342 = call ptr @rt_alloc_words(i64 1)
  %t343 = ptrtoint ptr %t342 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:assq" to i64), ptr %t342
  %t344 = or i64 %t343, 4
  %t345 = call i64 @rt_root(i64 %t344)
  store i64 %t345, ptr @"scheme.base:assq"
  ret i64 17
}

define i64 @"scheme.base:__init_17"() {
entry:
  %t359 = call ptr @rt_alloc_words(i64 1)
  %t360 = ptrtoint ptr %t359 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:member" to i64), ptr %t359
  %t361 = or i64 %t360, 4
  %t362 = call i64 @rt_root(i64 %t361)
  store i64 %t362, ptr @"scheme.base:member"
  ret i64 17
}

define i64 @"scheme.base:__init_18"() {
entry:
  %t378 = call ptr @rt_alloc_words(i64 1)
  %t379 = ptrtoint ptr %t378 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:assoc" to i64), ptr %t378
  %t380 = or i64 %t379, 4
  %t381 = call i64 @rt_root(i64 %t380)
  store i64 %t381, ptr @"scheme.base:assoc"
  ret i64 17
}

define i64 @"scheme.base:__init_19"() {
entry:
  %t408 = call ptr @rt_alloc_words(i64 1)
  %t409 = ptrtoint ptr %t408 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:filter" to i64), ptr %t408
  %t410 = or i64 %t409, 4
  %t411 = call i64 @rt_root(i64 %t410)
  store i64 %t411, ptr @"scheme.base:filter"
  ret i64 17
}

define i64 @"scheme.base:__init_20"() {
entry:
  %t428 = call ptr @rt_alloc_words(i64 1)
  %t429 = ptrtoint ptr %t428 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:fold-left" to i64), ptr %t428
  %t430 = or i64 %t429, 4
  %t431 = call i64 @rt_root(i64 %t430)
  store i64 %t431, ptr @"scheme.base:fold-left"
  ret i64 17
}

define i64 @"scheme.base:__init_21"() {
entry:
  %t448 = call ptr @rt_alloc_words(i64 1)
  %t449 = ptrtoint ptr %t448 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:fold-right" to i64), ptr %t448
  %t450 = or i64 %t449, 4
  %t451 = call i64 @rt_root(i64 %t450)
  store i64 %t451, ptr @"scheme.base:fold-right"
  ret i64 17
}

define i64 @"scheme.base:__init_22"() {
entry:
  %t469 = call ptr @rt_alloc_words(i64 1)
  %t470 = ptrtoint ptr %t469 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%for-each1" to i64), ptr %t469
  %t471 = or i64 %t470, 4
  %t472 = call i64 @rt_root(i64 %t471)
  store i64 %t472, ptr @"scheme.base:%for-each1"
  ret i64 17
}

define i64 @"scheme.base:__init_23"() {
entry:
  %t537 = call ptr @rt_alloc_words(i64 1)
  %t538 = ptrtoint ptr %t537 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%for-eachn" to i64), ptr %t537
  %t539 = or i64 %t538, 4
  %t540 = call i64 @rt_root(i64 %t539)
  store i64 %t540, ptr @"scheme.base:%for-eachn"
  ret i64 17
}

define i64 @"scheme.base:__init_24"() {
entry:
  %t567 = call ptr @rt_alloc_words(i64 1)
  %t568 = ptrtoint ptr %t567 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:for-each" to i64), ptr %t567
  %t569 = or i64 %t568, 4
  %t570 = call i64 @rt_root(i64 %t569)
  store i64 %t570, ptr @"scheme.base:for-each"
  ret i64 17
}

define i64 @"scheme.base:__init_25"() {
entry:
  %t588 = call ptr @rt_alloc_words(i64 1)
  %t589 = ptrtoint ptr %t588 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:andmap" to i64), ptr %t588
  %t590 = or i64 %t589, 4
  %t591 = call i64 @rt_root(i64 %t590)
  store i64 %t591, ptr @"scheme.base:andmap"
  ret i64 17
}

define i64 @"scheme.base:__init_26"() {
entry:
  %t609 = call ptr @rt_alloc_words(i64 1)
  %t610 = ptrtoint ptr %t609 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:memp" to i64), ptr %t609
  %t611 = or i64 %t610, 4
  %t612 = call i64 @rt_root(i64 %t611)
  store i64 %t612, ptr @"scheme.base:memp"
  ret i64 17
}

define i64 @"scheme.base:__init_27"() {
entry:
  %t625 = call ptr @rt_alloc_words(i64 1)
  %t626 = ptrtoint ptr %t625 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list?" to i64), ptr %t625
  %t627 = or i64 %t626, 4
  %t628 = call i64 @rt_root(i64 %t627)
  store i64 %t628, ptr @"scheme.base:list?"
  ret i64 17
}

define i64 @"scheme.base:__init_28"() {
entry:
  %t637 = call ptr @rt_alloc_words(i64 1)
  %t638 = ptrtoint ptr %t637 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:zero?" to i64), ptr %t637
  %t639 = or i64 %t638, 4
  %t640 = call i64 @rt_root(i64 %t639)
  store i64 %t640, ptr @"scheme.base:zero?"
  ret i64 17
}

define i64 @"scheme.base:__init_29"() {
entry:
  %t664 = call ptr @rt_alloc_words(i64 1)
  %t665 = ptrtoint ptr %t664 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-tail" to i64), ptr %t664
  %t666 = or i64 %t665, 4
  %t667 = call i64 @rt_root(i64 %t666)
  store i64 %t667, ptr @"scheme.base:list-tail"
  ret i64 17
}

define i64 @"scheme.base:__init_30"() {
entry:
  %t676 = call ptr @rt_alloc_words(i64 1)
  %t677 = ptrtoint ptr %t676 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-ref" to i64), ptr %t676
  %t678 = or i64 %t677, 4
  %t679 = call i64 @rt_root(i64 %t678)
  store i64 %t679, ptr @"scheme.base:list-ref"
  ret i64 17
}

define i64 @"scheme.base:__init_31"() {
entry:
  %t705 = call ptr @rt_alloc_words(i64 1)
  %t706 = ptrtoint ptr %t705 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-head" to i64), ptr %t705
  %t707 = or i64 %t706, 4
  %t708 = call i64 @rt_root(i64 %t707)
  store i64 %t708, ptr @"scheme.base:list-head"
  ret i64 17
}

define i64 @"scheme.base:__init_32"() {
entry:
  %t732 = call ptr @rt_alloc_words(i64 1)
  %t733 = ptrtoint ptr %t732 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-list" to i64), ptr %t732
  %t734 = or i64 %t733, 4
  %t735 = call i64 @rt_root(i64 %t734)
  store i64 %t735, ptr @"scheme.base:make-list"
  ret i64 17
}

define i64 @"scheme.base:__init_33"() {
entry:
  %t772 = call ptr @rt_alloc_words(i64 1)
  %t773 = ptrtoint ptr %t772 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:iota" to i64), ptr %t772
  %t774 = or i64 %t773, 4
  %t775 = call i64 @rt_root(i64 %t774)
  store i64 %t775, ptr @"scheme.base:iota"
  ret i64 17
}

define i64 @"scheme.base:__init_34"() {
entry:
  %t798 = call ptr @rt_alloc_words(i64 1)
  %t799 = ptrtoint ptr %t798 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%minmax-fold" to i64), ptr %t798
  %t800 = or i64 %t799, 4
  %t801 = call i64 @rt_root(i64 %t800)
  store i64 %t801, ptr @"scheme.base:%minmax-fold"
  ret i64 17
}

define i64 @"scheme.base:__init_35"() {
entry:
  %t810 = call ptr @rt_alloc_words(i64 1)
  %t811 = ptrtoint ptr %t810 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%minmax" to i64), ptr %t810
  %t812 = or i64 %t811, 4
  %t813 = call i64 @rt_root(i64 %t812)
  store i64 %t813, ptr @"scheme.base:%minmax"
  ret i64 17
}

define i64 @"scheme.base:__init_36"() {
entry:
  %t843 = call ptr @rt_alloc_words(i64 1)
  %t844 = ptrtoint ptr %t843 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:max" to i64), ptr %t843
  %t845 = or i64 %t844, 4
  %t846 = call i64 @rt_root(i64 %t845)
  store i64 %t846, ptr @"scheme.base:max"
  ret i64 17
}

define i64 @"scheme.base:__init_37"() {
entry:
  %t876 = call ptr @rt_alloc_words(i64 1)
  %t877 = ptrtoint ptr %t876 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:min" to i64), ptr %t876
  %t878 = or i64 %t877, 4
  %t879 = call i64 @rt_root(i64 %t878)
  store i64 %t879, ptr @"scheme.base:min"
  ret i64 17
}

define i64 @"scheme.base:__init_38"() {
entry:
  %t882 = call ptr @rt_alloc_words(i64 1)
  %t883 = ptrtoint ptr %t882 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:complex?" to i64), ptr %t882
  %t884 = or i64 %t883, 4
  %t885 = call i64 @rt_root(i64 %t884)
  store i64 %t885, ptr @"scheme.base:complex?"
  ret i64 17
}

define i64 @"scheme.base:__init_39"() {
entry:
  %t890 = call ptr @rt_alloc_words(i64 1)
  %t891 = ptrtoint ptr %t890 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:exact-integer?" to i64), ptr %t890
  %t892 = or i64 %t891, 4
  %t893 = call i64 @rt_root(i64 %t892)
  store i64 %t893, ptr @"scheme.base:exact-integer?"
  ret i64 17
}

define i64 @"scheme.base:__init_40"() {
entry:
  %t898 = call ptr @rt_alloc_words(i64 1)
  %t899 = ptrtoint ptr %t898 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rational?" to i64), ptr %t898
  %t900 = or i64 %t899, 4
  %t901 = call i64 @rt_root(i64 %t900)
  store i64 %t901, ptr @"scheme.base:rational?"
  ret i64 17
}

define i64 @"scheme.base:__init_41"() {
entry:
  %t910 = call ptr @rt_alloc_words(i64 1)
  %t911 = ptrtoint ptr %t910 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:positive?" to i64), ptr %t910
  %t912 = or i64 %t911, 4
  %t913 = call i64 @rt_root(i64 %t912)
  store i64 %t913, ptr @"scheme.base:positive?"
  ret i64 17
}

define i64 @"scheme.base:__init_42"() {
entry:
  %t922 = call ptr @rt_alloc_words(i64 1)
  %t923 = ptrtoint ptr %t922 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:negative?" to i64), ptr %t922
  %t924 = or i64 %t923, 4
  %t925 = call i64 @rt_root(i64 %t924)
  store i64 %t925, ptr @"scheme.base:negative?"
  ret i64 17
}

define i64 @"scheme.base:__init_43"() {
entry:
  %t935 = call ptr @rt_alloc_words(i64 1)
  %t936 = ptrtoint ptr %t935 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:even?" to i64), ptr %t935
  %t937 = or i64 %t936, 4
  %t938 = call i64 @rt_root(i64 %t937)
  store i64 %t938, ptr @"scheme.base:even?"
  ret i64 17
}

define i64 @"scheme.base:__init_44"() {
entry:
  %t949 = call ptr @rt_alloc_words(i64 1)
  %t950 = ptrtoint ptr %t949 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:odd?" to i64), ptr %t949
  %t951 = or i64 %t950, 4
  %t952 = call i64 @rt_root(i64 %t951)
  store i64 %t952, ptr @"scheme.base:odd?"
  ret i64 17
}

define i64 @"scheme.base:__init_45"() {
entry:
  %t970 = call ptr @rt_alloc_words(i64 1)
  %t971 = ptrtoint ptr %t970 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:abs" to i64), ptr %t970
  %t972 = or i64 %t971, 4
  %t973 = call i64 @rt_root(i64 %t972)
  store i64 %t973, ptr @"scheme.base:abs"
  ret i64 17
}

define i64 @"scheme.base:__init_46"() {
entry:
  %t984 = call ptr @rt_alloc_words(i64 1)
  %t985 = ptrtoint ptr %t984 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:square" to i64), ptr %t984
  %t986 = or i64 %t985, 4
  %t987 = call i64 @rt_root(i64 %t986)
  store i64 %t987, ptr @"scheme.base:square"
  ret i64 17
}

define i64 @"scheme.base:__init_47"() {
entry:
  %t1004 = call ptr @rt_alloc_words(i64 1)
  %t1005 = ptrtoint ptr %t1004 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%gcd2" to i64), ptr %t1004
  %t1006 = or i64 %t1005, 4
  %t1007 = call i64 @rt_root(i64 %t1006)
  store i64 %t1007, ptr @"scheme.base:%gcd2"
  ret i64 17
}

define i64 @"scheme.base:__init_48"() {
entry:
  %t1037 = call ptr @rt_alloc_words(i64 1)
  %t1038 = ptrtoint ptr %t1037 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%gcd-fold" to i64), ptr %t1037
  %t1039 = or i64 %t1038, 4
  %t1040 = call i64 @rt_root(i64 %t1039)
  store i64 %t1040, ptr @"scheme.base:%gcd-fold"
  ret i64 17
}

define i64 @"scheme.base:__init_49"() {
entry:
  %t1082 = call ptr @rt_alloc_words(i64 1)
  %t1083 = ptrtoint ptr %t1082 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%lcm-fold" to i64), ptr %t1082
  %t1084 = or i64 %t1083, 4
  %t1085 = call i64 @rt_root(i64 %t1084)
  store i64 %t1085, ptr @"scheme.base:%lcm-fold"
  ret i64 17
}

define i64 @"scheme.base:__init_50"() {
entry:
  %t1103 = call ptr @rt_alloc_words(i64 1)
  %t1104 = ptrtoint ptr %t1103 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:gcd" to i64), ptr %t1103
  %t1105 = or i64 %t1104, 4
  %t1106 = call i64 @rt_root(i64 %t1105)
  store i64 %t1106, ptr @"scheme.base:gcd"
  ret i64 17
}

define i64 @"scheme.base:__init_51"() {
entry:
  %t1124 = call ptr @rt_alloc_words(i64 1)
  %t1125 = ptrtoint ptr %t1124 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:lcm" to i64), ptr %t1124
  %t1126 = or i64 %t1125, 4
  %t1127 = call i64 @rt_root(i64 %t1126)
  store i64 %t1127, ptr @"scheme.base:lcm"
  ret i64 17
}

define i64 @"scheme.base:__init_52"() {
entry:
  %t1170 = call ptr @rt_alloc_words(i64 1)
  %t1171 = ptrtoint ptr %t1170 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%expt-exact" to i64), ptr %t1170
  %t1172 = or i64 %t1171, 4
  %t1173 = call i64 @rt_root(i64 %t1172)
  store i64 %t1173, ptr @"scheme.base:%expt-exact"
  ret i64 17
}

define i64 @"scheme.base:__init_53"() {
entry:
  %t1202 = call ptr @rt_alloc_words(i64 1)
  %t1203 = ptrtoint ptr %t1202 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:expt" to i64), ptr %t1202
  %t1204 = or i64 %t1203, 4
  %t1205 = call i64 @rt_root(i64 %t1204)
  store i64 %t1205, ptr @"scheme.base:expt"
  ret i64 17
}

define i64 @"scheme.base:__init_54"() {
entry:
  %t1231 = call ptr @rt_alloc_words(i64 1)
  %t1232 = ptrtoint ptr %t1231 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%isqrt-loop" to i64), ptr %t1231
  %t1233 = or i64 %t1232, 4
  %t1234 = call i64 @rt_root(i64 %t1233)
  store i64 %t1234, ptr @"scheme.base:%isqrt-loop"
  ret i64 17
}

define i64 @"scheme.base:__init_55"() {
entry:
  %t1250 = call ptr @rt_alloc_words(i64 1)
  %t1251 = ptrtoint ptr %t1250 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%isqrt" to i64), ptr %t1250
  %t1252 = or i64 %t1251, 4
  %t1253 = call i64 @rt_root(i64 %t1252)
  store i64 %t1253, ptr @"scheme.base:%isqrt"
  ret i64 17
}

define i64 @"scheme.base:__init_56"() {
entry:
  %t1284 = call ptr @rt_alloc_words(i64 1)
  %t1285 = ptrtoint ptr %t1284 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:exact-integer-sqrt" to i64), ptr %t1284
  %t1286 = or i64 %t1285, 4
  %t1287 = call i64 @rt_root(i64 %t1286)
  store i64 %t1287, ptr @"scheme.base:exact-integer-sqrt"
  ret i64 17
}

define i64 @"scheme.base:__init_57"() {
entry:
  %t1292 = call ptr @rt_alloc_words(i64 1)
  %t1293 = ptrtoint ptr %t1292 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:floor" to i64), ptr %t1292
  %t1294 = or i64 %t1293, 4
  %t1295 = call i64 @rt_root(i64 %t1294)
  store i64 %t1295, ptr @"scheme.base:floor"
  ret i64 17
}

define i64 @"scheme.base:__init_58"() {
entry:
  %t1300 = call ptr @rt_alloc_words(i64 1)
  %t1301 = ptrtoint ptr %t1300 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:ceiling" to i64), ptr %t1300
  %t1302 = or i64 %t1301, 4
  %t1303 = call i64 @rt_root(i64 %t1302)
  store i64 %t1303, ptr @"scheme.base:ceiling"
  ret i64 17
}

define i64 @"scheme.base:__init_59"() {
entry:
  %t1308 = call ptr @rt_alloc_words(i64 1)
  %t1309 = ptrtoint ptr %t1308 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:truncate" to i64), ptr %t1308
  %t1310 = or i64 %t1309, 4
  %t1311 = call i64 @rt_root(i64 %t1310)
  store i64 %t1311, ptr @"scheme.base:truncate"
  ret i64 17
}

define i64 @"scheme.base:__init_60"() {
entry:
  %t1316 = call ptr @rt_alloc_words(i64 1)
  %t1317 = ptrtoint ptr %t1316 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:round" to i64), ptr %t1316
  %t1318 = or i64 %t1317, 4
  %t1319 = call i64 @rt_root(i64 %t1318)
  store i64 %t1319, ptr @"scheme.base:round"
  ret i64 17
}

define i64 @"scheme.base:__init_61"() {
entry:
  %t1322 = call ptr @rt_alloc_words(i64 1)
  %t1323 = ptrtoint ptr %t1322 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:truncate-quotient" to i64), ptr %t1322
  %t1324 = or i64 %t1323, 4
  %t1325 = call i64 @rt_root(i64 %t1324)
  store i64 %t1325, ptr @"scheme.base:truncate-quotient"
  ret i64 17
}

define i64 @"scheme.base:__init_62"() {
entry:
  %t1328 = call ptr @rt_alloc_words(i64 1)
  %t1329 = ptrtoint ptr %t1328 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:truncate-remainder" to i64), ptr %t1328
  %t1330 = or i64 %t1329, 4
  %t1331 = call i64 @rt_root(i64 %t1330)
  store i64 %t1331, ptr @"scheme.base:truncate-remainder"
  ret i64 17
}

define i64 @"scheme.base:__init_63"() {
entry:
  %t1334 = call ptr @rt_alloc_words(i64 1)
  %t1335 = ptrtoint ptr %t1334 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:floor-remainder" to i64), ptr %t1334
  %t1336 = or i64 %t1335, 4
  %t1337 = call i64 @rt_root(i64 %t1336)
  store i64 %t1337, ptr @"scheme.base:floor-remainder"
  ret i64 17
}

define i64 @"scheme.base:__init_64"() {
entry:
  %t1349 = call ptr @rt_alloc_words(i64 1)
  %t1350 = ptrtoint ptr %t1349 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:floor-quotient" to i64), ptr %t1349
  %t1351 = or i64 %t1350, 4
  %t1352 = call i64 @rt_root(i64 %t1351)
  store i64 %t1352, ptr @"scheme.base:floor-quotient"
  ret i64 17
}

define i64 @"scheme.base:__init_65"() {
entry:
  %t1362 = call ptr @rt_alloc_words(i64 1)
  %t1363 = ptrtoint ptr %t1362 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:truncate/" to i64), ptr %t1362
  %t1364 = or i64 %t1363, 4
  %t1365 = call i64 @rt_root(i64 %t1364)
  store i64 %t1365, ptr @"scheme.base:truncate/"
  ret i64 17
}

define i64 @"scheme.base:__init_66"() {
entry:
  %t1380 = call ptr @rt_alloc_words(i64 1)
  %t1381 = ptrtoint ptr %t1380 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:floor/" to i64), ptr %t1380
  %t1382 = or i64 %t1381, 4
  %t1383 = call i64 @rt_root(i64 %t1382)
  store i64 %t1383, ptr @"scheme.base:floor/"
  ret i64 17
}

define i64 @"scheme.base:__init_67"() {
entry:
  %t1394 = call ptr @rt_alloc_words(i64 1)
  %t1395 = ptrtoint ptr %t1394 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:numerator" to i64), ptr %t1394
  %t1396 = or i64 %t1395, 4
  %t1397 = call i64 @rt_root(i64 %t1396)
  store i64 %t1397, ptr @"scheme.base:numerator"
  ret i64 17
}

define i64 @"scheme.base:__init_68"() {
entry:
  %t1411 = call ptr @rt_alloc_words(i64 1)
  %t1412 = ptrtoint ptr %t1411 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:denominator" to i64), ptr %t1411
  %t1413 = or i64 %t1412, 4
  %t1414 = call i64 @rt_root(i64 %t1413)
  store i64 %t1414, ptr @"scheme.base:denominator"
  ret i64 17
}

define i64 @"scheme.base:__init_69"() {
entry:
  %t1417 = call ptr @rt_alloc_words(i64 1)
  %t1418 = ptrtoint ptr %t1417 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:inexact" to i64), ptr %t1417
  %t1419 = or i64 %t1418, 4
  %t1420 = call i64 @rt_root(i64 %t1419)
  store i64 %t1420, ptr @"scheme.base:inexact"
  ret i64 17
}

define i64 @"scheme.base:__init_70"() {
entry:
  %t1423 = call ptr @rt_alloc_words(i64 1)
  %t1424 = ptrtoint ptr %t1423 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:exact" to i64), ptr %t1423
  %t1425 = or i64 %t1424, 4
  %t1426 = call i64 @rt_root(i64 %t1425)
  store i64 %t1426, ptr @"scheme.base:exact"
  ret i64 17
}

define i64 @"scheme.base:__init_71"() {
entry:
  %t1429 = call ptr @rt_alloc_words(i64 1)
  %t1430 = ptrtoint ptr %t1429 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:void" to i64), ptr %t1429
  %t1431 = or i64 %t1430, 4
  %t1432 = call i64 @rt_root(i64 %t1431)
  store i64 %t1432, ptr @"scheme.base:void"
  ret i64 17
}

define i64 @"scheme.base:__init_72"() {
entry:
  %t1445 = call ptr @rt_alloc_words(i64 1)
  %t1446 = ptrtoint ptr %t1445 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string" to i64), ptr %t1445
  %t1447 = or i64 %t1446, 4
  %t1448 = call i64 @rt_root(i64 %t1447)
  store i64 %t1448, ptr @"scheme.base:string"
  ret i64 17
}

define i64 @"scheme.base:__init_73"() {
entry:
  %t1462 = call ptr @rt_alloc_words(i64 1)
  %t1463 = ptrtoint ptr %t1462 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%str-concat" to i64), ptr %t1462
  %t1464 = or i64 %t1463, 4
  %t1465 = call i64 @rt_root(i64 %t1464)
  store i64 %t1465, ptr @"scheme.base:%str-concat"
  ret i64 17
}

define i64 @"scheme.base:__init_74"() {
entry:
  %t1485 = call ptr @rt_alloc_words(i64 1)
  %t1486 = ptrtoint ptr %t1485 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:chr-cmp" to i64), ptr %t1485
  %t1487 = or i64 %t1486, 4
  %t1488 = call i64 @rt_root(i64 %t1487)
  store i64 %t1488, ptr @"scheme.base:chr-cmp"
  ret i64 17
}

define i64 @"scheme.base:__init_75"() {
entry:
  %t1517 = call ptr @rt_alloc_words(i64 1)
  %t1518 = ptrtoint ptr %t1517 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char=?" to i64), ptr %t1517
  %t1519 = or i64 %t1518, 4
  %t1520 = call i64 @rt_root(i64 %t1519)
  store i64 %t1520, ptr @"scheme.base:char=?"
  ret i64 17
}

define i64 @"scheme.base:__init_76"() {
entry:
  %t1549 = call ptr @rt_alloc_words(i64 1)
  %t1550 = ptrtoint ptr %t1549 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char<?" to i64), ptr %t1549
  %t1551 = or i64 %t1550, 4
  %t1552 = call i64 @rt_root(i64 %t1551)
  store i64 %t1552, ptr @"scheme.base:char<?"
  ret i64 17
}

define i64 @"scheme.base:__init_77"() {
entry:
  %t1581 = call ptr @rt_alloc_words(i64 1)
  %t1582 = ptrtoint ptr %t1581 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char>?" to i64), ptr %t1581
  %t1583 = or i64 %t1582, 4
  %t1584 = call i64 @rt_root(i64 %t1583)
  store i64 %t1584, ptr @"scheme.base:char>?"
  ret i64 17
}

define i64 @"scheme.base:__init_78"() {
entry:
  %t1621 = call ptr @rt_alloc_words(i64 1)
  %t1622 = ptrtoint ptr %t1621 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char<=?" to i64), ptr %t1621
  %t1623 = or i64 %t1622, 4
  %t1624 = call i64 @rt_root(i64 %t1623)
  store i64 %t1624, ptr @"scheme.base:char<=?"
  ret i64 17
}

define i64 @"scheme.base:__init_79"() {
entry:
  %t1661 = call ptr @rt_alloc_words(i64 1)
  %t1662 = ptrtoint ptr %t1661 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char>=?" to i64), ptr %t1661
  %t1663 = or i64 %t1662, 4
  %t1664 = call i64 @rt_root(i64 %t1663)
  store i64 %t1664, ptr @"scheme.base:char>=?"
  ret i64 17
}

define i64 @"scheme.base:__init_80"() {
entry:
  %t1705 = call ptr @rt_alloc_words(i64 1)
  %t1706 = ptrtoint ptr %t1705 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string->list" to i64), ptr %t1705
  %t1707 = or i64 %t1706, 4
  %t1708 = call i64 @rt_root(i64 %t1707)
  store i64 %t1708, ptr @"scheme.base:string->list"
  ret i64 17
}

define i64 @"scheme.base:__init_81"() {
entry:
  %t1716 = call ptr @rt_alloc_words(i64 1)
  %t1717 = ptrtoint ptr %t1716 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:ns-digits" to i64), ptr %t1716
  %t1718 = or i64 %t1717, 4
  %t1719 = call i64 @rt_root(i64 %t1718)
  store i64 %t1719, ptr @"scheme.base:ns-digits"
  ret i64 17
}

define i64 @"scheme.base:__init_82"() {
entry:
  %t1747 = call ptr @rt_alloc_words(i64 1)
  %t1748 = ptrtoint ptr %t1747 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ns-digit-char" to i64), ptr %t1747
  %t1749 = or i64 %t1748, 4
  %t1750 = call i64 @rt_root(i64 %t1749)
  store i64 %t1750, ptr @"scheme.base:%ns-digit-char"
  ret i64 17
}

define i64 @"scheme.base:__init_83"() {
entry:
  %t1784 = call ptr @rt_alloc_words(i64 1)
  %t1785 = ptrtoint ptr %t1784 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:ns-digits-radix" to i64), ptr %t1784
  %t1786 = or i64 %t1785, 4
  %t1787 = call i64 @rt_root(i64 %t1786)
  store i64 %t1787, ptr @"scheme.base:ns-digits-radix"
  ret i64 17
}

define i64 @"scheme.base:__init_84"() {
entry:
  %t1820 = call ptr @rt_alloc_words(i64 1)
  %t1821 = ptrtoint ptr %t1820 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%radix-ok?" to i64), ptr %t1820
  %t1822 = or i64 %t1821, 4
  %t1823 = call i64 @rt_root(i64 %t1822)
  store i64 %t1823, ptr @"scheme.base:%radix-ok?"
  ret i64 17
}

define i64 @"scheme.base:__init_85"() {
entry:
  %t1911 = call ptr @rt_alloc_words(i64 1)
  %t1912 = ptrtoint ptr %t1911 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:number->string" to i64), ptr %t1911
  %t1913 = or i64 %t1912, 4
  %t1914 = call i64 @rt_root(i64 %t1913)
  store i64 %t1914, ptr @"scheme.base:number->string"
  ret i64 17
}

define i64 @"scheme.base:__init_86"() {
entry:
  %t1948 = call ptr @rt_alloc_words(i64 1)
  %t1949 = ptrtoint ptr %t1948 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string->number" to i64), ptr %t1948
  %t1950 = or i64 %t1949, 4
  %t1951 = call i64 @rt_root(i64 %t1950)
  store i64 %t1951, ptr @"scheme.base:string->number"
  ret i64 17
}

define i64 @"scheme.base:__init_87"() {
entry:
  %t1985 = call ptr @rt_alloc_words(i64 1)
  %t1986 = ptrtoint ptr %t1985 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error" to i64), ptr %t1985
  %t1987 = or i64 %t1986, 4
  %t1988 = call i64 @rt_root(i64 %t1987)
  store i64 %t1988, ptr @"scheme.base:error"
  ret i64 17
}

define i64 @"scheme.base:__init_88"() {
entry:
  %t1989 = call i64 @rt_root(i64 2)
  store i64 %t1989, ptr @"scheme.base:*winds*"
  ret i64 17
}

define i64 @"scheme.base:__init_89"() {
entry:
  %t1990 = call i64 @rt_root(i64 2)
  store i64 %t1990, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define i64 @"scheme.base:__init_90"() {
entry:
  %t2015 = call ptr @rt_alloc_words(i64 1)
  %t2016 = ptrtoint ptr %t2015 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%unwind-to" to i64), ptr %t2015
  %t2017 = or i64 %t2016, 4
  %t2018 = call i64 @rt_root(i64 %t2017)
  store i64 %t2018, ptr @"scheme.base:%unwind-to"
  ret i64 17
}

define i64 @"scheme.base:__init_91"() {
entry:
  %t2042 = call ptr @rt_alloc_words(i64 1)
  %t2043 = ptrtoint ptr %t2042 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:dynamic-wind" to i64), ptr %t2042
  %t2044 = or i64 %t2043, 4
  %t2045 = call i64 @rt_root(i64 %t2044)
  store i64 %t2045, ptr @"scheme.base:dynamic-wind"
  ret i64 17
}

define i64 @"scheme.base:__init_92"() {
entry:
  %t2106 = call ptr @rt_alloc_words(i64 1)
  %t2107 = ptrtoint ptr %t2106 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-current-continuation" to i64), ptr %t2106
  %t2108 = or i64 %t2107, 4
  %t2109 = call i64 @rt_root(i64 %t2108)
  store i64 %t2109, ptr @"scheme.base:call-with-current-continuation"
  ret i64 17
}

define i64 @"scheme.base:__init_93"() {
entry:
  %t2117 = call ptr @rt_alloc_words(i64 1)
  %t2118 = ptrtoint ptr %t2117 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call/cc" to i64), ptr %t2117
  %t2119 = or i64 %t2118, 4
  %t2120 = call i64 @rt_root(i64 %t2119)
  store i64 %t2120, ptr @"scheme.base:call/cc"
  ret i64 17
}

define i64 @"scheme.base:__init_94"() {
entry:
  %t2155 = call ptr @rt_alloc_words(i64 1)
  %t2156 = ptrtoint ptr %t2155 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-exception-handler" to i64), ptr %t2155
  %t2157 = or i64 %t2156, 4
  %t2158 = call i64 @rt_root(i64 %t2157)
  store i64 %t2158, ptr @"scheme.base:with-exception-handler"
  ret i64 17
}

define i64 @"scheme.base:__init_95"() {
entry:
  %t2177 = call ptr @rt_alloc_words(i64 1)
  %t2178 = ptrtoint ptr %t2177 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:raise" to i64), ptr %t2177
  %t2179 = or i64 %t2178, 4
  %t2180 = call i64 @rt_root(i64 %t2179)
  store i64 %t2180, ptr @"scheme.base:raise"
  ret i64 17
}

define i64 @"scheme.base:__init_96"() {
entry:
  %t2183 = call ptr @rt_alloc_words(i64 1)
  %t2184 = ptrtoint ptr %t2183 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object?" to i64), ptr %t2183
  %t2185 = or i64 %t2184, 4
  %t2186 = call i64 @rt_root(i64 %t2185)
  store i64 %t2186, ptr @"scheme.base:error-object?"
  ret i64 17
}

define i64 @"scheme.base:__init_97"() {
entry:
  %t2189 = call ptr @rt_alloc_words(i64 1)
  %t2190 = ptrtoint ptr %t2189 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-message" to i64), ptr %t2189
  %t2191 = or i64 %t2190, 4
  %t2192 = call i64 @rt_root(i64 %t2191)
  store i64 %t2192, ptr @"scheme.base:error-object-message"
  ret i64 17
}

define i64 @"scheme.base:__init_98"() {
entry:
  %t2195 = call ptr @rt_alloc_words(i64 1)
  %t2196 = ptrtoint ptr %t2195 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-irritants" to i64), ptr %t2195
  %t2197 = or i64 %t2196, 4
  %t2198 = call i64 @rt_root(i64 %t2197)
  store i64 %t2198, ptr @"scheme.base:error-object-irritants"
  ret i64 17
}

define i64 @"scheme.base:__init_99"() {
entry:
  %t2280 = call ptr @rt_alloc_words(i64 1)
  %t2281 = ptrtoint ptr %t2280 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-parameter" to i64), ptr %t2280
  %t2282 = or i64 %t2281, 4
  %t2283 = call i64 @rt_root(i64 %t2282)
  store i64 %t2283, ptr @"scheme.base:make-parameter"
  ret i64 17
}

define i64 @"scheme.base:__init_100"() {
entry:
  %t2364 = call ptr @rt_alloc_words(i64 1)
  %t2365 = ptrtoint ptr %t2364 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-parameters" to i64), ptr %t2364
  %t2366 = or i64 %t2365, 4
  %t2367 = call i64 @rt_root(i64 %t2366)
  store i64 %t2367, ptr @"scheme.base:with-parameters"
  ret i64 17
}

define i64 @"scheme.base:__init_101"() {
entry:
  %t2405 = call ptr @rt_alloc_words(i64 1)
  %t2406 = ptrtoint ptr %t2405 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->vector" to i64), ptr %t2405
  %t2407 = or i64 %t2406, 4
  %t2408 = call i64 @rt_root(i64 %t2407)
  store i64 %t2408, ptr @"scheme.base:list->vector"
  ret i64 17
}

define i64 @"scheme.base:__init_102"() {
entry:
  %t2426 = call ptr @rt_alloc_words(i64 1)
  %t2427 = ptrtoint ptr %t2426 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector" to i64), ptr %t2426
  %t2428 = or i64 %t2427, 4
  %t2429 = call i64 @rt_root(i64 %t2428)
  store i64 %t2429, ptr @"scheme.base:vector"
  ret i64 17
}

define i64 @"scheme.base:__init_103"() {
entry:
  %t2467 = call ptr @rt_alloc_words(i64 1)
  %t2468 = ptrtoint ptr %t2467 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->bytevector" to i64), ptr %t2467
  %t2469 = or i64 %t2468, 4
  %t2470 = call i64 @rt_root(i64 %t2469)
  store i64 %t2470, ptr @"scheme.base:list->bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_104"() {
entry:
  %t2488 = call ptr @rt_alloc_words(i64 1)
  %t2489 = ptrtoint ptr %t2488 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector" to i64), ptr %t2488
  %t2490 = or i64 %t2489, 4
  %t2491 = call i64 @rt_root(i64 %t2490)
  store i64 %t2491, ptr @"scheme.base:bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_105"() {
entry:
  %t2511 = call ptr @rt_alloc_words(i64 1)
  %t2512 = ptrtoint ptr %t2511 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:values" to i64), ptr %t2511
  %t2513 = or i64 %t2512, 4
  %t2514 = call i64 @rt_root(i64 %t2513)
  store i64 %t2514, ptr @"scheme.base:values"
  ret i64 17
}

define i64 @"scheme.base:__init_106"() {
entry:
  %t2556 = call ptr @rt_alloc_words(i64 1)
  %t2557 = ptrtoint ptr %t2556 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-values" to i64), ptr %t2556
  %t2558 = or i64 %t2557, 4
  %t2559 = call i64 @rt_root(i64 %t2558)
  store i64 %t2559, ptr @"scheme.base:call-with-values"
  ret i64 17
}

define i64 @"scheme.base:__init_107"() {
entry:
  %t2560 = call i64 @rt_root(i64 64)
  store i64 %t2560, ptr @"scheme.base:%ht-initial-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_108"() {
entry:
  %t2561 = call i64 @rt_root(i64 24)
  store i64 %t2561, ptr @"scheme.base:%ht-load-factor"
  ret i64 17
}

define i64 @"scheme.base:__init_109"() {
entry:
  %t2572 = call ptr @rt_alloc_words(i64 1)
  %t2573 = ptrtoint ptr %t2572 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-hash-table" to i64), ptr %t2572
  %t2574 = or i64 %t2573, 4
  %t2575 = call i64 @rt_root(i64 %t2574)
  store i64 %t2575, ptr @"scheme.base:make-hash-table"
  ret i64 17
}

define i64 @"scheme.base:__init_110"() {
entry:
  %t2578 = call ptr @rt_alloc_words(i64 1)
  %t2579 = ptrtoint ptr %t2578 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table?" to i64), ptr %t2578
  %t2580 = or i64 %t2579, 4
  %t2581 = call i64 @rt_root(i64 %t2580)
  store i64 %t2581, ptr @"scheme.base:hash-table?"
  ret i64 17
}

define i64 @"scheme.base:__init_111"() {
entry:
  %t2585 = call ptr @rt_alloc_words(i64 1)
  %t2586 = ptrtoint ptr %t2585 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-count" to i64), ptr %t2585
  %t2587 = or i64 %t2586, 4
  %t2588 = call i64 @rt_root(i64 %t2587)
  store i64 %t2588, ptr @"scheme.base:%ht-count"
  ret i64 17
}

define i64 @"scheme.base:__init_112"() {
entry:
  %t2592 = call ptr @rt_alloc_words(i64 1)
  %t2593 = ptrtoint ptr %t2592 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-buckets" to i64), ptr %t2592
  %t2594 = or i64 %t2593, 4
  %t2595 = call i64 @rt_root(i64 %t2594)
  store i64 %t2595, ptr @"scheme.base:%ht-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_113"() {
entry:
  %t2599 = call ptr @rt_alloc_words(i64 1)
  %t2600 = ptrtoint ptr %t2599 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-count!" to i64), ptr %t2599
  %t2601 = or i64 %t2600, 4
  %t2602 = call i64 @rt_root(i64 %t2601)
  store i64 %t2602, ptr @"scheme.base:%ht-set-count!"
  ret i64 17
}

define i64 @"scheme.base:__init_114"() {
entry:
  %t2606 = call ptr @rt_alloc_words(i64 1)
  %t2607 = ptrtoint ptr %t2606 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-buckets!" to i64), ptr %t2606
  %t2608 = or i64 %t2607, 4
  %t2609 = call i64 @rt_root(i64 %t2608)
  store i64 %t2609, ptr @"scheme.base:%ht-set-buckets!"
  ret i64 17
}

define i64 @"scheme.base:__init_115"() {
entry:
  %t2613 = call ptr @rt_alloc_words(i64 1)
  %t2614 = ptrtoint ptr %t2613 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-index" to i64), ptr %t2613
  %t2615 = or i64 %t2614, 4
  %t2616 = call i64 @rt_root(i64 %t2615)
  store i64 %t2616, ptr @"scheme.base:%ht-index"
  ret i64 17
}

define i64 @"scheme.base:__init_116"() {
entry:
  %t2632 = call ptr @rt_alloc_words(i64 1)
  %t2633 = ptrtoint ptr %t2632 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-assoc" to i64), ptr %t2632
  %t2634 = or i64 %t2633, 4
  %t2635 = call i64 @rt_root(i64 %t2634)
  store i64 %t2635, ptr @"scheme.base:%ht-assoc"
  ret i64 17
}

define i64 @"scheme.base:__init_117"() {
entry:
  %t2653 = call ptr @rt_alloc_words(i64 1)
  %t2654 = ptrtoint ptr %t2653 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-remove" to i64), ptr %t2653
  %t2655 = or i64 %t2654, 4
  %t2656 = call i64 @rt_root(i64 %t2655)
  store i64 %t2656, ptr @"scheme.base:%ht-remove"
  ret i64 17
}

define i64 @"scheme.base:__init_118"() {
entry:
  %t2680 = call ptr @rt_alloc_words(i64 1)
  %t2681 = ptrtoint ptr %t2680 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref/default" to i64), ptr %t2680
  %t2682 = or i64 %t2681, 4
  %t2683 = call i64 @rt_root(i64 %t2682)
  store i64 %t2683, ptr @"scheme.base:hash-table-ref/default"
  ret i64 17
}

define i64 @"scheme.base:__init_119"() {
entry:
  %t2706 = call ptr @rt_alloc_words(i64 1)
  %t2707 = ptrtoint ptr %t2706 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-contains?" to i64), ptr %t2706
  %t2708 = or i64 %t2707, 4
  %t2709 = call i64 @rt_root(i64 %t2708)
  store i64 %t2709, ptr @"scheme.base:hash-table-contains?"
  ret i64 17
}

define i64 @"scheme.base:__init_120"() {
entry:
  %t2740 = call ptr @rt_alloc_words(i64 1)
  %t2741 = ptrtoint ptr %t2740 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref" to i64), ptr %t2740
  %t2742 = or i64 %t2741, 4
  %t2743 = call i64 @rt_root(i64 %t2742)
  store i64 %t2743, ptr @"scheme.base:hash-table-ref"
  ret i64 17
}

define i64 @"scheme.base:__init_121"() {
entry:
  %t2827 = call ptr @rt_alloc_words(i64 1)
  %t2828 = ptrtoint ptr %t2827 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-set!" to i64), ptr %t2827
  %t2829 = or i64 %t2828, 4
  %t2830 = call i64 @rt_root(i64 %t2829)
  store i64 %t2830, ptr @"scheme.base:hash-table-set!"
  ret i64 17
}

define i64 @"scheme.base:__init_122"() {
entry:
  %t2880 = call ptr @rt_alloc_words(i64 1)
  %t2881 = ptrtoint ptr %t2880 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-delete!" to i64), ptr %t2880
  %t2882 = or i64 %t2881, 4
  %t2883 = call i64 @rt_root(i64 %t2882)
  store i64 %t2883, ptr @"scheme.base:hash-table-delete!"
  ret i64 17
}

define i64 @"scheme.base:__init_123"() {
entry:
  %t2987 = call ptr @rt_alloc_words(i64 1)
  %t2988 = ptrtoint ptr %t2987 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-grow!" to i64), ptr %t2987
  %t2989 = or i64 %t2988, 4
  %t2990 = call i64 @rt_root(i64 %t2989)
  store i64 %t2990, ptr @"scheme.base:%ht-grow!"
  ret i64 17
}

define i64 @"scheme.base:__init_124"() {
entry:
  %t2998 = call ptr @rt_alloc_words(i64 1)
  %t2999 = ptrtoint ptr %t2998 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-size" to i64), ptr %t2998
  %t3000 = or i64 %t2999, 4
  %t3001 = call i64 @rt_root(i64 %t3000)
  store i64 %t3001, ptr @"scheme.base:hash-table-size"
  ret i64 17
}

define i64 @"scheme.base:__init_125"() {
entry:
  %t3018 = call ptr @rt_alloc_words(i64 1)
  %t3019 = ptrtoint ptr %t3018 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-fold-buckets" to i64), ptr %t3018
  %t3020 = or i64 %t3019, 4
  %t3021 = call i64 @rt_root(i64 %t3020)
  store i64 %t3021, ptr @"scheme.base:%ht-fold-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_126"() {
entry:
  %t3069 = call ptr @rt_alloc_words(i64 1)
  %t3070 = ptrtoint ptr %t3069 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table->alist" to i64), ptr %t3069
  %t3071 = or i64 %t3070, 4
  %t3072 = call i64 @rt_root(i64 %t3071)
  store i64 %t3072, ptr @"scheme.base:hash-table->alist"
  ret i64 17
}

define i64 @"scheme.base:__init_127"() {
entry:
  %t3091 = call ptr @rt_alloc_words(i64 1)
  %t3092 = ptrtoint ptr %t3091 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-keys" to i64), ptr %t3091
  %t3093 = or i64 %t3092, 4
  %t3094 = call i64 @rt_root(i64 %t3093)
  store i64 %t3094, ptr @"scheme.base:hash-table-keys"
  ret i64 17
}

define i64 @"scheme.base:__init_128"() {
entry:
  %t3113 = call ptr @rt_alloc_words(i64 1)
  %t3114 = ptrtoint ptr %t3113 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-values" to i64), ptr %t3113
  %t3115 = or i64 %t3114, 4
  %t3116 = call i64 @rt_root(i64 %t3115)
  store i64 %t3116, ptr @"scheme.base:hash-table-values"
  ret i64 17
}

define i64 @"scheme.base:__init_129"() {
entry:
  %t3191 = call ptr @rt_alloc_words(i64 1)
  %t3192 = ptrtoint ptr %t3191 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-report" to i64), ptr %t3191
  %t3193 = or i64 %t3192, 4
  %t3194 = call i64 @rt_root(i64 %t3193)
  store i64 %t3194, ptr @"scheme.base:rd-report"
  ret i64 17
}

define i64 @"scheme.base:__init_130"() {
entry:
  %t3212 = call ptr @rt_alloc_words(i64 1)
  %t3213 = ptrtoint ptr %t3212 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-from-string" to i64), ptr %t3212
  %t3214 = or i64 %t3213, 4
  %t3215 = call i64 @rt_root(i64 %t3214)
  store i64 %t3215, ptr @"scheme.base:read-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_131"() {
entry:
  %t3307 = call ptr @rt_alloc_words(i64 1)
  %t3308 = ptrtoint ptr %t3307 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-all-from-string" to i64), ptr %t3307
  %t3309 = or i64 %t3308, 4
  %t3310 = call i64 @rt_root(i64 %t3309)
  store i64 %t3310, ptr @"scheme.base:read-all-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_132"() {
entry:
  %t3315 = call ptr @rt_alloc_words(i64 1)
  %t3316 = ptrtoint ptr %t3315 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port?" to i64), ptr %t3315
  %t3317 = or i64 %t3316, 4
  %t3318 = call i64 @rt_root(i64 %t3317)
  store i64 %t3318, ptr @"scheme.base:port?"
  ret i64 17
}

define i64 @"scheme.base:__init_133"() {
entry:
  %t3328 = call ptr @rt_alloc_words(i64 1)
  %t3329 = ptrtoint ptr %t3328 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port?" to i64), ptr %t3328
  %t3330 = or i64 %t3329, 4
  %t3331 = call i64 @rt_root(i64 %t3330)
  store i64 %t3331, ptr @"scheme.base:input-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_134"() {
entry:
  %t3342 = call ptr @rt_alloc_words(i64 1)
  %t3343 = ptrtoint ptr %t3342 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port?" to i64), ptr %t3342
  %t3344 = or i64 %t3343, 4
  %t3345 = call i64 @rt_root(i64 %t3344)
  store i64 %t3345, ptr @"scheme.base:output-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_135"() {
entry:
  %t3353 = call ptr @rt_alloc_words(i64 1)
  %t3354 = ptrtoint ptr %t3353 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:textual-port?" to i64), ptr %t3353
  %t3355 = or i64 %t3354, 4
  %t3356 = call i64 @rt_root(i64 %t3355)
  store i64 %t3356, ptr @"scheme.base:textual-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_136"() {
entry:
  %t3359 = call ptr @rt_alloc_words(i64 1)
  %t3360 = ptrtoint ptr %t3359 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port-closed?" to i64), ptr %t3359
  %t3361 = or i64 %t3360, 4
  %t3362 = call i64 @rt_root(i64 %t3361)
  store i64 %t3362, ptr @"scheme.base:port-closed?"
  ret i64 17
}

define i64 @"scheme.base:__init_137"() {
entry:
  %t3373 = call ptr @rt_alloc_words(i64 1)
  %t3374 = ptrtoint ptr %t3373 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port-open?" to i64), ptr %t3373
  %t3375 = or i64 %t3374, 4
  %t3376 = call i64 @rt_root(i64 %t3375)
  store i64 %t3376, ptr @"scheme.base:input-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_138"() {
entry:
  %t3387 = call ptr @rt_alloc_words(i64 1)
  %t3388 = ptrtoint ptr %t3387 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port-open?" to i64), ptr %t3387
  %t3389 = or i64 %t3388, 4
  %t3390 = call i64 @rt_root(i64 %t3389)
  store i64 %t3390, ptr @"scheme.base:output-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_139"() {
entry:
  %t3416 = call ptr @rt_alloc_words(i64 1)
  %t3417 = ptrtoint ptr %t3416 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-input-port" to i64), ptr %t3416
  %t3418 = or i64 %t3417, 4
  %t3419 = call i64 @rt_root(i64 %t3418)
  store i64 %t3419, ptr @"scheme.base:%check-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_140"() {
entry:
  %t3445 = call ptr @rt_alloc_words(i64 1)
  %t3446 = ptrtoint ptr %t3445 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-output-port" to i64), ptr %t3445
  %t3447 = or i64 %t3446, 4
  %t3448 = call i64 @rt_root(i64 %t3447)
  store i64 %t3448, ptr @"scheme.base:%check-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_141"() {
entry:
  %t3452 = call ptr @rt_alloc_words(i64 1)
  %t3453 = ptrtoint ptr %t3452 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-input-string" to i64), ptr %t3452
  %t3454 = or i64 %t3453, 4
  %t3455 = call i64 @rt_root(i64 %t3454)
  store i64 %t3455, ptr @"scheme.base:open-input-string"
  ret i64 17
}

define i64 @"scheme.base:__init_142"() {
entry:
  %t3476 = call ptr @rt_alloc_words(i64 1)
  %t3477 = ptrtoint ptr %t3476 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%port-at-eof?" to i64), ptr %t3476
  %t3478 = or i64 %t3477, 4
  %t3479 = call i64 @rt_root(i64 %t3478)
  store i64 %t3479, ptr @"scheme.base:%port-at-eof?"
  ret i64 17
}

define i64 @"scheme.base:__init_143"() {
entry:
  %t3509 = call ptr @rt_alloc_words(i64 1)
  %t3510 = ptrtoint ptr %t3509 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-char" to i64), ptr %t3509
  %t3511 = or i64 %t3510, 4
  %t3512 = call i64 @rt_root(i64 %t3511)
  store i64 %t3512, ptr @"scheme.base:read-char"
  ret i64 17
}

define i64 @"scheme.base:__init_144"() {
entry:
  %t3533 = call ptr @rt_alloc_words(i64 1)
  %t3534 = ptrtoint ptr %t3533 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:peek-char" to i64), ptr %t3533
  %t3535 = or i64 %t3534, 4
  %t3536 = call i64 @rt_root(i64 %t3535)
  store i64 %t3536, ptr @"scheme.base:peek-char"
  ret i64 17
}

define i64 @"scheme.base:__init_145"() {
entry:
  %t3654 = call ptr @rt_alloc_words(i64 1)
  %t3655 = ptrtoint ptr %t3654 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-line" to i64), ptr %t3654
  %t3656 = or i64 %t3655, 4
  %t3657 = call i64 @rt_root(i64 %t3656)
  store i64 %t3657, ptr @"scheme.base:read-line"
  ret i64 17
}

define i64 @"scheme.base:__init_146"() {
entry:
  %t3705 = call ptr @rt_alloc_words(i64 1)
  %t3706 = ptrtoint ptr %t3705 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-string" to i64), ptr %t3705
  %t3707 = or i64 %t3706, 4
  %t3708 = call i64 @rt_root(i64 %t3707)
  store i64 %t3708, ptr @"scheme.base:read-string"
  ret i64 17
}

define i64 @"scheme.base:__init_147"() {
entry:
  %t3722 = call ptr @rt_alloc_words(i64 1)
  %t3723 = ptrtoint ptr %t3722 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-output-string" to i64), ptr %t3722
  %t3724 = or i64 %t3723, 4
  %t3725 = call i64 @rt_root(i64 %t3724)
  store i64 %t3725, ptr @"scheme.base:open-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_148"() {
entry:
  %t3756 = call ptr @rt_alloc_words(i64 1)
  %t3757 = ptrtoint ptr %t3756 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:get-output-string" to i64), ptr %t3756
  %t3758 = or i64 %t3757, 4
  %t3759 = call i64 @rt_root(i64 %t3758)
  store i64 %t3759, ptr @"scheme.base:get-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_149"() {
entry:
  %t3770 = call ptr @rt_alloc_words(i64 1)
  %t3771 = ptrtoint ptr %t3770 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:flush-output-port" to i64), ptr %t3770
  %t3772 = or i64 %t3771, 4
  %t3773 = call i64 @rt_root(i64 %t3772)
  store i64 %t3773, ptr @"scheme.base:flush-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_150"() {
entry:
  %t3802 = call ptr @rt_alloc_words(i64 1)
  %t3803 = ptrtoint ptr %t3802 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-port" to i64), ptr %t3802
  %t3804 = or i64 %t3803, 4
  %t3805 = call i64 @rt_root(i64 %t3804)
  store i64 %t3805, ptr @"scheme.base:close-port"
  ret i64 17
}

define i64 @"scheme.base:__init_151"() {
entry:
  %t3828 = call ptr @rt_alloc_words(i64 1)
  %t3829 = ptrtoint ptr %t3828 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-input-port" to i64), ptr %t3828
  %t3830 = or i64 %t3829, 4
  %t3831 = call i64 @rt_root(i64 %t3830)
  store i64 %t3831, ptr @"scheme.base:close-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_152"() {
entry:
  %t3854 = call ptr @rt_alloc_words(i64 1)
  %t3855 = ptrtoint ptr %t3854 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-output-port" to i64), ptr %t3854
  %t3856 = or i64 %t3855, 4
  %t3857 = call i64 @rt_root(i64 %t3856)
  store i64 %t3857, ptr @"scheme.base:close-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_153"() {
entry:
  %t3858 = call i64 @rt_root(i64 1)
  store i64 %t3858, ptr @"scheme.base:%stdout-port"
  ret i64 17
}

define i64 @"scheme.base:__init_154"() {
entry:
  %t3859 = call i64 @rt_root(i64 1)
  store i64 %t3859, ptr @"scheme.base:%stderr-port"
  ret i64 17
}

define i64 @"scheme.base:__init_155"() {
entry:
  %t3860 = call i64 @rt_root(i64 1)
  store i64 %t3860, ptr @"scheme.base:%stdin-port"
  ret i64 17
}

define i64 @"scheme.base:__init_156"() {
entry:
  %t3888 = call ptr @rt_alloc_words(i64 1)
  %t3889 = ptrtoint ptr %t3888 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-output-port" to i64), ptr %t3888
  %t3890 = or i64 %t3889, 4
  %t3891 = call i64 @rt_root(i64 %t3890)
  store i64 %t3891, ptr @"scheme.base:current-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_157"() {
entry:
  %t3916 = call ptr @rt_alloc_words(i64 1)
  %t3917 = ptrtoint ptr %t3916 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-error-port" to i64), ptr %t3916
  %t3918 = or i64 %t3917, 4
  %t3919 = call i64 @rt_root(i64 %t3918)
  store i64 %t3919, ptr @"scheme.base:current-error-port"
  ret i64 17
}

define i64 @"scheme.base:__init_158"() {
entry:
  %t3944 = call ptr @rt_alloc_words(i64 1)
  %t3945 = ptrtoint ptr %t3944 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-input-port" to i64), ptr %t3944
  %t3946 = or i64 %t3945, 4
  %t3947 = call i64 @rt_root(i64 %t3946)
  store i64 %t3947, ptr @"scheme.base:current-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_159"() {
entry:
  %t3994 = call ptr @rt_alloc_words(i64 1)
  %t3995 = ptrtoint ptr %t3994 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-port" to i64), ptr %t3994
  %t3996 = or i64 %t3995, 4
  %t3997 = call i64 @rt_root(i64 %t3996)
  store i64 %t3997, ptr @"scheme.base:call-with-port"
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

