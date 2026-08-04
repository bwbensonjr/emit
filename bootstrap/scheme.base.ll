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
@.str.lit.13 = private unnamed_addr constant [18 x i8] c"not an input port\00"
@.str.lit.14 = private unnamed_addr constant [15 x i8] c"port is closed\00"
@.str.lit.15 = private unnamed_addr constant [19 x i8] c"not an output port\00"
@.str.lit.16 = private unnamed_addr constant [15 x i8] c"port is closed\00"
@.str.sym.17 = private unnamed_addr constant [16 x i8] c"open-input-file\00"
@.str.lit.18 = private unnamed_addr constant [27 x i8] c"cannot open file for input\00"
@.str.sym.19 = private unnamed_addr constant [10 x i8] c"read-char\00"
@.str.sym.20 = private unnamed_addr constant [10 x i8] c"peek-char\00"
@.str.sym.21 = private unnamed_addr constant [10 x i8] c"read-line\00"
@.str.sym.22 = private unnamed_addr constant [12 x i8] c"read-string\00"
@.str.sym.23 = private unnamed_addr constant [5 x i8] c"read\00"
@.str.sym.24 = private unnamed_addr constant [17 x i8] c"open-output-file\00"
@.str.lit.25 = private unnamed_addr constant [28 x i8] c"cannot open file for output\00"
@.str.sym.26 = private unnamed_addr constant [19 x i8] c"open-output-string\00"
@.str.lit.27 = private unnamed_addr constant [34 x i8] c"cannot open an output string port\00"
@.str.sym.28 = private unnamed_addr constant [18 x i8] c"get-output-string\00"
@.str.lit.29 = private unnamed_addr constant [19 x i8] c"not an output port\00"
@.str.lit.30 = private unnamed_addr constant [18 x i8] c"not a string port\00"
@.str.sym.31 = private unnamed_addr constant [18 x i8] c"flush-output-port\00"
@.str.sym.32 = private unnamed_addr constant [11 x i8] c"close-port\00"
@.str.lit.33 = private unnamed_addr constant [11 x i8] c"not a port\00"
@.str.sym.34 = private unnamed_addr constant [17 x i8] c"close-input-port\00"
@.str.lit.35 = private unnamed_addr constant [18 x i8] c"not an input port\00"
@.str.sym.36 = private unnamed_addr constant [18 x i8] c"close-output-port\00"
@.str.lit.37 = private unnamed_addr constant [19 x i8] c"not an output port\00"
@"emit.internal:rd-numeric?" = external global i64
@"emit.internal:rd-parse-int" = external global i64
@"emit.internal:rd-nonfinite" = external global i64
@"emit.internal:rd-flonum?" = external global i64
@"emit.internal:rd-datum" = external global i64
@"emit.internal:rd-skip-ws" = external global i64
@"emit.internal:%port-rtd" = external global i64
@"emit.internal:%make-port" = external global i64
@"emit.internal:%port-buf" = external global i64
declare fastcc i64 @"emit.internal:code:rd-numeric?"(i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, ptr)
declare fastcc i64 @"emit.internal:code:rd-parse-int"(i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, ptr)
declare fastcc i64 @"emit.internal:code:rd-nonfinite"(i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, ptr)
declare fastcc i64 @"emit.internal:code:rd-flonum?"(i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, ptr)
declare fastcc i64 @"emit.internal:code:rd-datum"(i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, ptr)
declare fastcc i64 @"emit.internal:code:rd-skip-ws"(i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, ptr)
declare fastcc i64 @"emit.internal:code:%port-rtd"(i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, ptr)
declare fastcc i64 @"emit.internal:code:%make-port"(i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, ptr)
declare fastcc i64 @"emit.internal:code:%port-buf"(i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, ptr)
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
  %t2267 = load i64, ptr @"emit.internal:rd-numeric?"
  %t2268 = call fastcc i64 @"emit.internal:code:rd-numeric?"(i64 %t2267, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2269 = icmp ne i64 %t2268, 1
  br i1 %t2269, label %then661, label %else662
then661:
  %t2270 = load i64, ptr @"emit.internal:rd-parse-int"
  %t2271 = musttail call fastcc i64 @"emit.internal:code:rd-parse-int"(i64 %t2270, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2271
else662:
  %t2272 = load i64, ptr @"emit.internal:rd-nonfinite"
  %t2273 = call fastcc i64 @"emit.internal:code:rd-nonfinite"(i64 %t2272, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2274 = icmp ne i64 %t2273, 1
  br i1 %t2274, label %then663, label %else664
then663:
  ret i64 %t2273
else664:
  %t2275 = load i64, ptr @"emit.internal:rd-flonum?"
  %t2276 = call fastcc i64 @"emit.internal:code:rd-flonum?"(i64 %t2275, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2277 = icmp ne i64 %t2276, 1
  br i1 %t2277, label %then665, label %else666
then665:
  %t2278 = call i64 @rt_string_to_flonum(i64 %a0)
  ret i64 %t2278
else666:
  ret i64 1
else660:
  %t2279 = load i64, ptr @"scheme.base:%string->int"
  %t2280 = and i64 %t2279, -8
  %t2281 = inttoptr i64 %t2280 to ptr
  %t2282 = load i64, ptr %t2281
  %t2283 = inttoptr i64 %t2282 to ptr
  %t2284 = musttail call fastcc i64 %t2283(i64 %t2279, i64 2, i64 %a0, i64 %t2251, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2284
else655:
  %t2285 = call i64 @rt_make_string(ptr @.str.lit.8, i64 33)
  %t2286 = load i64, ptr @"scheme.base:error"
  %t2287 = and i64 %t2286, -8
  %t2288 = inttoptr i64 %t2287 to ptr
  %t2289 = load i64, ptr %t2288
  %t2290 = inttoptr i64 %t2289 to ptr
  %t2291 = musttail call fastcc i64 %t2290(i64 %t2286, i64 2, i64 %t2285, i64 %t2251, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2291
}

define fastcc i64 @"scheme.base:code:error"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2296 = icmp sge i64 %argc, 1
  br i1 %t2296, label %argok668, label %arityerr667
arityerr667:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok668:
  %t2297 = call ptr @rt_alloc_words(i64 8)
  %t2298 = getelementptr i64, ptr %t2297, i64 0
  store i64 %a0, ptr %t2298
  %t2299 = getelementptr i64, ptr %t2297, i64 1
  store i64 %a1, ptr %t2299
  %t2300 = getelementptr i64, ptr %t2297, i64 2
  store i64 %a2, ptr %t2300
  %t2301 = getelementptr i64, ptr %t2297, i64 3
  store i64 %a3, ptr %t2301
  %t2302 = getelementptr i64, ptr %t2297, i64 4
  store i64 %a4, ptr %t2302
  %t2303 = getelementptr i64, ptr %t2297, i64 5
  store i64 %a5, ptr %t2303
  %t2304 = getelementptr i64, ptr %t2297, i64 6
  store i64 %a6, ptr %t2304
  %t2305 = getelementptr i64, ptr %t2297, i64 7
  store i64 %a7, ptr %t2305
  %t2306 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2297, ptr %overflow)
  %t2307 = call i64 @rt_string_p(i64 %a0)
  %t2308 = icmp ne i64 %t2307, 1
  br i1 %t2308, label %then669, label %else670
then669:
  %t2309 = call i64 @rt_make_error_object(i64 %a0, i64 %t2306)
  %t2310 = load i64, ptr @"scheme.base:raise"
  %t2311 = and i64 %t2310, -8
  %t2312 = inttoptr i64 %t2311 to ptr
  %t2313 = load i64, ptr %t2312
  %t2314 = inttoptr i64 %t2313 to ptr
  %t2315 = musttail call fastcc i64 %t2314(i64 %t2310, i64 1, i64 %t2309, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2315
else670:
  %t2316 = call i64 @rt_symbol_to_string(i64 %a0)
  %t2317 = call i64 @rt_make_string(ptr @.str.lit.9, i64 2)
  %t2318 = call i64 @rt_car(i64 %t2306)
  %t2319 = call i64 @rt_string_append(i64 %t2317, i64 %t2318)
  %t2320 = call i64 @rt_string_append(i64 %t2316, i64 %t2319)
  %t2321 = call i64 @rt_cdr(i64 %t2306)
  %t2322 = call i64 @rt_make_error_object(i64 %t2320, i64 %t2321)
  %t2323 = load i64, ptr @"scheme.base:raise"
  %t2324 = and i64 %t2323, -8
  %t2325 = inttoptr i64 %t2324 to ptr
  %t2326 = load i64, ptr %t2325
  %t2327 = inttoptr i64 %t2326 to ptr
  %t2328 = musttail call fastcc i64 %t2327(i64 %t2323, i64 1, i64 %t2322, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2328
}

define fastcc i64 @"scheme.base:code:%unwind-to"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2335 = icmp eq i64 %argc, 1
  br i1 %t2335, label %argok672, label %arityerr671
arityerr671:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok672:
  %t2336 = load i64, ptr @"scheme.base:*winds*"
  %t2337 = call i64 @rt_eq_p(i64 %t2336, i64 %a0)
  %t2338 = icmp ne i64 %t2337, 1
  br i1 %t2338, label %then673, label %else674
then673:
  ret i64 257
else674:
  %t2339 = load i64, ptr @"scheme.base:*winds*"
  %t2340 = call i64 @rt_null_p(i64 %t2339)
  %t2341 = icmp ne i64 %t2340, 1
  br i1 %t2341, label %then675, label %else676
then675:
  ret i64 257
else676:
  %t2342 = load i64, ptr @"scheme.base:*winds*"
  %t2343 = call i64 @rt_car(i64 %t2342)
  %t2344 = load i64, ptr @"scheme.base:*winds*"
  %t2345 = call i64 @rt_cdr(i64 %t2344)
  %t2346 = call i64 @rt_root(i64 %t2345)
  store i64 %t2346, ptr @"scheme.base:*winds*"
  %t2347 = call i64 @rt_cdr(i64 %t2343)
  %t2348 = and i64 %t2347, -8
  %t2349 = inttoptr i64 %t2348 to ptr
  %t2350 = load i64, ptr %t2349
  %t2351 = inttoptr i64 %t2350 to ptr
  %t2352 = call fastcc i64%t2351(i64 %t2347, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2353 = load i64, ptr @"scheme.base:%unwind-to"
  %t2354 = and i64 %t2353, -8
  %t2355 = inttoptr i64 %t2354 to ptr
  %t2356 = load i64, ptr %t2355
  %t2357 = inttoptr i64 %t2356 to ptr
  %t2358 = musttail call fastcc i64 %t2357(i64 %t2353, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2358
}

define fastcc i64 @"scheme.base:code:dynamic-wind"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2363 = icmp eq i64 %argc, 3
  br i1 %t2363, label %argok678, label %arityerr677
arityerr677:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok678:
  %t2364 = and i64 %a0, -8
  %t2365 = inttoptr i64 %t2364 to ptr
  %t2366 = load i64, ptr %t2365
  %t2367 = inttoptr i64 %t2366 to ptr
  %t2368 = call fastcc i64%t2367(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2369 = call i64 @rt_cons(i64 %a0, i64 %a2)
  %t2370 = load i64, ptr @"scheme.base:*winds*"
  %t2371 = call i64 @rt_cons(i64 %t2369, i64 %t2370)
  %t2372 = call i64 @rt_root(i64 %t2371)
  store i64 %t2372, ptr @"scheme.base:*winds*"
  %t2373 = and i64 %a1, -8
  %t2374 = inttoptr i64 %t2373 to ptr
  %t2375 = load i64, ptr %t2374
  %t2376 = inttoptr i64 %t2375 to ptr
  %t2377 = call fastcc i64%t2376(i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2378 = load i64, ptr @"scheme.base:*winds*"
  %t2379 = call i64 @rt_cdr(i64 %t2378)
  %t2380 = call i64 @rt_root(i64 %t2379)
  store i64 %t2380, ptr @"scheme.base:*winds*"
  %t2381 = and i64 %a2, -8
  %t2382 = inttoptr i64 %t2381 to ptr
  %t2383 = load i64, ptr %t2382
  %t2384 = inttoptr i64 %t2383 to ptr
  %t2385 = call fastcc i64%t2384(i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2377
}

define fastcc i64 @"scheme.base:code_550"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2390 = icmp eq i64 %argc, 1
  br i1 %t2390, label %argok680, label %arityerr679
arityerr679:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok680:
  %t2391 = and i64 %self, -8
  %t2392 = inttoptr i64 %t2391 to ptr
  %t2393 = getelementptr i64, ptr %t2392, i64 1
  %t2394 = load i64, ptr %t2393
  %t2395 = call i64 @rt_escape_live_p(i64 %t2394)
  %t2396 = icmp ne i64 %t2395, 1
  br i1 %t2396, label %then681, label %else682
then681:
  %t2397 = and i64 %self, -8
  %t2398 = inttoptr i64 %t2397 to ptr
  %t2399 = getelementptr i64, ptr %t2398, i64 2
  %t2400 = load i64, ptr %t2399
  %t2401 = load i64, ptr @"scheme.base:%unwind-to"
  %t2402 = and i64 %t2401, -8
  %t2403 = inttoptr i64 %t2402 to ptr
  %t2404 = load i64, ptr %t2403
  %t2405 = inttoptr i64 %t2404 to ptr
  %t2406 = call fastcc i64%t2405(i64 %t2401, i64 1, i64 %t2400, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2407 = and i64 %self, -8
  %t2408 = inttoptr i64 %t2407 to ptr
  %t2409 = getelementptr i64, ptr %t2408, i64 1
  %t2410 = load i64, ptr %t2409
  %t2411 = call i64 @rt_escape_to(i64 %t2410, i64 %a0)
  br label %merge683
else682:
  br label %merge683
merge683:
  %t2412 = phi i64 [ %t2411, %then681 ], [ 1, %else682 ]
  %t2413 = call i64 @rt_intern(ptr @.str.sym.10)
  %t2414 = call i64 @rt_make_string(ptr @.str.lit.11, i64 39)
  %t2415 = load i64, ptr @"scheme.base:error"
  %t2416 = and i64 %t2415, -8
  %t2417 = inttoptr i64 %t2416 to ptr
  %t2418 = load i64, ptr %t2417
  %t2419 = inttoptr i64 %t2418 to ptr
  %t2420 = musttail call fastcc i64 %t2419(i64 %t2415, i64 2, i64 %t2413, i64 %t2414, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2420
}

define fastcc i64 @"scheme.base:code_548"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2421 = icmp eq i64 %argc, 0
  br i1 %t2421, label %argok685, label %arityerr684
arityerr684:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok685:
  %t2422 = call i64 @rt_escape_frame()
  %t2423 = and i64 %self, -8
  %t2424 = inttoptr i64 %t2423 to ptr
  %t2425 = getelementptr i64, ptr %t2424, i64 2
  %t2426 = load i64, ptr %t2425
  %t2427 = call ptr @rt_alloc_words(i64 3)
  %t2428 = ptrtoint ptr %t2427 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_550" to i64), ptr %t2427
  %t2429 = getelementptr i64, ptr %t2427, i64 1
  store i64 %t2422, ptr %t2429
  %t2430 = getelementptr i64, ptr %t2427, i64 2
  store i64 %t2426, ptr %t2430
  %t2431 = or i64 %t2428, 4
  %t2432 = and i64 %self, -8
  %t2433 = inttoptr i64 %t2432 to ptr
  %t2434 = getelementptr i64, ptr %t2433, i64 1
  %t2435 = load i64, ptr %t2434
  %t2436 = and i64 %t2435, -8
  %t2437 = inttoptr i64 %t2436 to ptr
  %t2438 = load i64, ptr %t2437
  %t2439 = inttoptr i64 %t2438 to ptr
  %t2440 = musttail call fastcc i64 %t2439(i64 %t2435, i64 1, i64 %t2431, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2440
}

define fastcc i64 @"scheme.base:code:call-with-current-continuation"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2441 = icmp eq i64 %argc, 1
  br i1 %t2441, label %argok687, label %arityerr686
arityerr686:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok687:
  %t2442 = load i64, ptr @"scheme.base:*winds*"
  %t2443 = call ptr @rt_alloc_words(i64 3)
  %t2444 = ptrtoint ptr %t2443 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_548" to i64), ptr %t2443
  %t2445 = getelementptr i64, ptr %t2443, i64 1
  store i64 %a0, ptr %t2445
  %t2446 = getelementptr i64, ptr %t2443, i64 2
  store i64 %t2442, ptr %t2446
  %t2447 = or i64 %t2444, 4
  %t2448 = call i64 @rt_run_guarded(ptr @__apply0, i64 %t2447)
  %t2449 = call i64 @rt_cdr(i64 %t2448)
  ret i64 %t2449
}

define fastcc i64 @"scheme.base:code:call/cc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2454 = icmp eq i64 %argc, 1
  br i1 %t2454, label %argok689, label %arityerr688
arityerr688:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok689:
  %t2455 = load i64, ptr @"scheme.base:call-with-current-continuation"
  %t2456 = and i64 %t2455, -8
  %t2457 = inttoptr i64 %t2456 to ptr
  %t2458 = load i64, ptr %t2457
  %t2459 = inttoptr i64 %t2458 to ptr
  %t2460 = musttail call fastcc i64 %t2459(i64 %t2455, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2460
}

define fastcc i64 @"scheme.base:code_558"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2465 = icmp eq i64 %argc, 0
  br i1 %t2465, label %argok691, label %arityerr690
arityerr690:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok691:
  %t2466 = and i64 %self, -8
  %t2467 = inttoptr i64 %t2466 to ptr
  %t2468 = getelementptr i64, ptr %t2467, i64 1
  %t2469 = load i64, ptr %t2468
  %t2470 = and i64 %self, -8
  %t2471 = inttoptr i64 %t2470 to ptr
  %t2472 = getelementptr i64, ptr %t2471, i64 2
  %t2473 = load i64, ptr %t2472
  %t2474 = call i64 @rt_cons(i64 %t2469, i64 %t2473)
  %t2475 = call i64 @rt_root(i64 %t2474)
  store i64 %t2475, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code_560"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2476 = icmp eq i64 %argc, 0
  br i1 %t2476, label %argok693, label %arityerr692
arityerr692:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok693:
  %t2477 = and i64 %self, -8
  %t2478 = inttoptr i64 %t2477 to ptr
  %t2479 = getelementptr i64, ptr %t2478, i64 1
  %t2480 = load i64, ptr %t2479
  %t2481 = call i64 @rt_root(i64 %t2480)
  store i64 %t2481, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code:with-exception-handler"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2482 = icmp eq i64 %argc, 2
  br i1 %t2482, label %argok695, label %arityerr694
arityerr694:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok695:
  %t2483 = load i64, ptr @"scheme.base:*handlers*"
  %t2484 = call ptr @rt_alloc_words(i64 3)
  %t2485 = ptrtoint ptr %t2484 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_558" to i64), ptr %t2484
  %t2486 = getelementptr i64, ptr %t2484, i64 1
  store i64 %a0, ptr %t2486
  %t2487 = getelementptr i64, ptr %t2484, i64 2
  store i64 %t2483, ptr %t2487
  %t2488 = or i64 %t2485, 4
  %t2489 = call ptr @rt_alloc_words(i64 2)
  %t2490 = ptrtoint ptr %t2489 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_560" to i64), ptr %t2489
  %t2491 = getelementptr i64, ptr %t2489, i64 1
  store i64 %t2483, ptr %t2491
  %t2492 = or i64 %t2490, 4
  %t2493 = load i64, ptr @"scheme.base:dynamic-wind"
  %t2494 = and i64 %t2493, -8
  %t2495 = inttoptr i64 %t2494 to ptr
  %t2496 = load i64, ptr %t2495
  %t2497 = inttoptr i64 %t2496 to ptr
  %t2498 = musttail call fastcc i64 %t2497(i64 %t2493, i64 3, i64 %t2488, i64 %a1, i64 %t2492, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2498
}

define fastcc i64 @"scheme.base:code:raise"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2503 = icmp eq i64 %argc, 1
  br i1 %t2503, label %argok697, label %arityerr696
arityerr696:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok697:
  %t2504 = load i64, ptr @"scheme.base:*handlers*"
  %t2505 = call i64 @rt_null_p(i64 %t2504)
  %t2506 = icmp ne i64 %t2505, 1
  br i1 %t2506, label %then698, label %else699
then698:
  %t2507 = call i64 @rt_raise(i64 %a0)
  ret i64 %t2507
else699:
  %t2508 = load i64, ptr @"scheme.base:*handlers*"
  %t2509 = call i64 @rt_car(i64 %t2508)
  %t2510 = load i64, ptr @"scheme.base:*handlers*"
  %t2511 = load i64, ptr @"scheme.base:*handlers*"
  %t2512 = call i64 @rt_cdr(i64 %t2511)
  %t2513 = call i64 @rt_root(i64 %t2512)
  store i64 %t2513, ptr @"scheme.base:*handlers*"
  %t2514 = and i64 %t2509, -8
  %t2515 = inttoptr i64 %t2514 to ptr
  %t2516 = load i64, ptr %t2515
  %t2517 = inttoptr i64 %t2516 to ptr
  %t2518 = call fastcc i64%t2517(i64 %t2509, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2519 = call i64 @rt_root(i64 %t2510)
  store i64 %t2519, ptr @"scheme.base:*handlers*"
  %t2520 = call i64 @rt_raise(i64 %a0)
  ret i64 %t2520
}

define fastcc i64 @"scheme.base:code:error-object?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2525 = icmp eq i64 %argc, 1
  br i1 %t2525, label %argok701, label %arityerr700
arityerr700:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok701:
  %t2526 = call i64 @rt_error_object_p(i64 %a0)
  ret i64 %t2526
}

define fastcc i64 @"scheme.base:code:error-object-message"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2531 = icmp eq i64 %argc, 1
  br i1 %t2531, label %argok703, label %arityerr702
arityerr702:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok703:
  %t2532 = call i64 @rt_error_object_message(i64 %a0)
  ret i64 %t2532
}

define fastcc i64 @"scheme.base:code:error-object-irritants"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2537 = icmp eq i64 %argc, 1
  br i1 %t2537, label %argok705, label %arityerr704
arityerr704:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok705:
  %t2538 = call i64 @rt_error_object_irritants(i64 %a0)
  ret i64 %t2538
}

define fastcc i64 @"scheme.base:code_580"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2543 = icmp eq i64 %argc, 1
  br i1 %t2543, label %argok707, label %arityerr706
arityerr706:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok707:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_582"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2544 = icmp eq i64 %argc, 1
  br i1 %t2544, label %argok709, label %arityerr708
arityerr708:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok709:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_584"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2545 = icmp sge i64 %argc, 0
  br i1 %t2545, label %argok711, label %arityerr710
arityerr710:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok711:
  %t2546 = call ptr @rt_alloc_words(i64 8)
  %t2547 = getelementptr i64, ptr %t2546, i64 0
  store i64 %a0, ptr %t2547
  %t2548 = getelementptr i64, ptr %t2546, i64 1
  store i64 %a1, ptr %t2548
  %t2549 = getelementptr i64, ptr %t2546, i64 2
  store i64 %a2, ptr %t2549
  %t2550 = getelementptr i64, ptr %t2546, i64 3
  store i64 %a3, ptr %t2550
  %t2551 = getelementptr i64, ptr %t2546, i64 4
  store i64 %a4, ptr %t2551
  %t2552 = getelementptr i64, ptr %t2546, i64 5
  store i64 %a5, ptr %t2552
  %t2553 = getelementptr i64, ptr %t2546, i64 6
  store i64 %a6, ptr %t2553
  %t2554 = getelementptr i64, ptr %t2546, i64 7
  store i64 %a7, ptr %t2554
  %t2555 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2546, ptr %overflow)
  %t2556 = call i64 @rt_null_p(i64 %t2555)
  %t2557 = icmp ne i64 %t2556, 1
  br i1 %t2557, label %then712, label %else713
then712:
  %t2558 = and i64 %self, -8
  %t2559 = inttoptr i64 %t2558 to ptr
  %t2560 = getelementptr i64, ptr %t2559, i64 1
  %t2561 = load i64, ptr %t2560
  %t2562 = call i64 @rt_vector_ref(i64 %t2561, i64 0)
  ret i64 %t2562
else713:
  %t2563 = call i64 @rt_cdr(i64 %t2555)
  %t2564 = call i64 @rt_null_p(i64 %t2563)
  %t2565 = icmp ne i64 %t2564, 1
  br i1 %t2565, label %then714, label %else715
then714:
  %t2566 = and i64 %self, -8
  %t2567 = inttoptr i64 %t2566 to ptr
  %t2568 = getelementptr i64, ptr %t2567, i64 1
  %t2569 = load i64, ptr %t2568
  %t2570 = call i64 @rt_car(i64 %t2555)
  %t2571 = and i64 %self, -8
  %t2572 = inttoptr i64 %t2571 to ptr
  %t2573 = getelementptr i64, ptr %t2572, i64 2
  %t2574 = load i64, ptr %t2573
  %t2575 = and i64 %t2574, -8
  %t2576 = inttoptr i64 %t2575 to ptr
  %t2577 = load i64, ptr %t2576
  %t2578 = inttoptr i64 %t2577 to ptr
  %t2579 = call fastcc i64%t2578(i64 %t2574, i64 1, i64 %t2570, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2580 = call i64 @rt_vector_set(i64 %t2569, i64 0, i64 %t2579)
  ret i64 %t2580
else715:
  %t2581 = and i64 %self, -8
  %t2582 = inttoptr i64 %t2581 to ptr
  %t2583 = getelementptr i64, ptr %t2582, i64 1
  %t2584 = load i64, ptr %t2583
  %t2585 = call i64 @rt_car(i64 %t2555)
  %t2586 = call i64 @rt_vector_set(i64 %t2584, i64 0, i64 %t2585)
  ret i64 %t2586
}

define fastcc i64 @"scheme.base:code:make-parameter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2587 = icmp sge i64 %argc, 1
  br i1 %t2587, label %argok717, label %arityerr716
arityerr716:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok717:
  %t2588 = call ptr @rt_alloc_words(i64 8)
  %t2589 = getelementptr i64, ptr %t2588, i64 0
  store i64 %a0, ptr %t2589
  %t2590 = getelementptr i64, ptr %t2588, i64 1
  store i64 %a1, ptr %t2590
  %t2591 = getelementptr i64, ptr %t2588, i64 2
  store i64 %a2, ptr %t2591
  %t2592 = getelementptr i64, ptr %t2588, i64 3
  store i64 %a3, ptr %t2592
  %t2593 = getelementptr i64, ptr %t2588, i64 4
  store i64 %a4, ptr %t2593
  %t2594 = getelementptr i64, ptr %t2588, i64 5
  store i64 %a5, ptr %t2594
  %t2595 = getelementptr i64, ptr %t2588, i64 6
  store i64 %a6, ptr %t2595
  %t2596 = getelementptr i64, ptr %t2588, i64 7
  store i64 %a7, ptr %t2596
  %t2597 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2588, ptr %overflow)
  %t2598 = call i64 @rt_null_p(i64 %t2597)
  %t2599 = icmp ne i64 %t2598, 1
  br i1 %t2599, label %then718, label %else719
then718:
  %t2600 = call ptr @rt_alloc_words(i64 1)
  %t2601 = ptrtoint ptr %t2600 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_580" to i64), ptr %t2600
  %t2602 = or i64 %t2601, 4
  br label %merge720
else719:
  %t2603 = call i64 @rt_car(i64 %t2597)
  br label %merge720
merge720:
  %t2604 = phi i64 [ %t2602, %then718 ], [ %t2603, %else719 ]
  %t2605 = call i64 @rt_make_vector(i64 8, i64 0)
  %t2606 = call i64 @rt_null_p(i64 %t2597)
  %t2607 = icmp ne i64 %t2606, 1
  br i1 %t2607, label %then721, label %else722
then721:
  %t2608 = call ptr @rt_alloc_words(i64 1)
  %t2609 = ptrtoint ptr %t2608 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_582" to i64), ptr %t2608
  %t2610 = or i64 %t2609, 4
  br label %merge723
else722:
  %t2611 = call i64 @rt_car(i64 %t2597)
  br label %merge723
merge723:
  %t2612 = phi i64 [ %t2610, %then721 ], [ %t2611, %else722 ]
  %t2613 = and i64 %t2612, -8
  %t2614 = inttoptr i64 %t2613 to ptr
  %t2615 = load i64, ptr %t2614
  %t2616 = inttoptr i64 %t2615 to ptr
  %t2617 = call fastcc i64%t2616(i64 %t2612, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2618 = call i64 @rt_vector_set(i64 %t2605, i64 0, i64 %t2617)
  %t2619 = call ptr @rt_alloc_words(i64 3)
  %t2620 = ptrtoint ptr %t2619 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_584" to i64), ptr %t2619
  %t2621 = getelementptr i64, ptr %t2619, i64 1
  store i64 %t2605, ptr %t2621
  %t2622 = getelementptr i64, ptr %t2619, i64 2
  store i64 %t2604, ptr %t2622
  %t2623 = or i64 %t2620, 4
  ret i64 %t2623
}

define fastcc i64 @"scheme.base:code_596"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2628 = icmp eq i64 %argc, 1
  br i1 %t2628, label %argok725, label %arityerr724
arityerr724:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok725:
  %t2629 = and i64 %a0, -8
  %t2630 = inttoptr i64 %t2629 to ptr
  %t2631 = load i64, ptr %t2630
  %t2632 = inttoptr i64 %t2631 to ptr
  %t2633 = musttail call fastcc i64 %t2632(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2633
}

define fastcc i64 @"scheme.base:code_600"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2634 = icmp eq i64 %argc, 2
  br i1 %t2634, label %argok727, label %arityerr726
arityerr726:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok727:
  %t2635 = and i64 %a0, -8
  %t2636 = inttoptr i64 %t2635 to ptr
  %t2637 = load i64, ptr %t2636
  %t2638 = inttoptr i64 %t2637 to ptr
  %t2639 = musttail call fastcc i64 %t2638(i64 %a0, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2639
}

define fastcc i64 @"scheme.base:code_598"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2640 = icmp eq i64 %argc, 0
  br i1 %t2640, label %argok729, label %arityerr728
arityerr728:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok729:
  %t2641 = call ptr @rt_alloc_words(i64 1)
  %t2642 = ptrtoint ptr %t2641 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_600" to i64), ptr %t2641
  %t2643 = or i64 %t2642, 4
  %t2644 = and i64 %self, -8
  %t2645 = inttoptr i64 %t2644 to ptr
  %t2646 = getelementptr i64, ptr %t2645, i64 1
  %t2647 = load i64, ptr %t2646
  %t2648 = and i64 %self, -8
  %t2649 = inttoptr i64 %t2648 to ptr
  %t2650 = getelementptr i64, ptr %t2649, i64 2
  %t2651 = load i64, ptr %t2650
  %t2652 = load i64, ptr @"scheme.base:for-each"
  %t2653 = and i64 %t2652, -8
  %t2654 = inttoptr i64 %t2653 to ptr
  %t2655 = load i64, ptr %t2654
  %t2656 = inttoptr i64 %t2655 to ptr
  %t2657 = musttail call fastcc i64 %t2656(i64 %t2652, i64 3, i64 %t2643, i64 %t2647, i64 %t2651, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2657
}

define fastcc i64 @"scheme.base:code_604"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2658 = icmp eq i64 %argc, 2
  br i1 %t2658, label %argok731, label %arityerr730
arityerr730:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok731:
  %t2659 = and i64 %a0, -8
  %t2660 = inttoptr i64 %t2659 to ptr
  %t2661 = load i64, ptr %t2660
  %t2662 = inttoptr i64 %t2661 to ptr
  %t2663 = musttail call fastcc i64 %t2662(i64 %a0, i64 2, i64 %a1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2663
}

define fastcc i64 @"scheme.base:code_602"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2664 = icmp eq i64 %argc, 0
  br i1 %t2664, label %argok733, label %arityerr732
arityerr732:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok733:
  %t2665 = call ptr @rt_alloc_words(i64 1)
  %t2666 = ptrtoint ptr %t2665 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_604" to i64), ptr %t2665
  %t2667 = or i64 %t2666, 4
  %t2668 = and i64 %self, -8
  %t2669 = inttoptr i64 %t2668 to ptr
  %t2670 = getelementptr i64, ptr %t2669, i64 1
  %t2671 = load i64, ptr %t2670
  %t2672 = and i64 %self, -8
  %t2673 = inttoptr i64 %t2672 to ptr
  %t2674 = getelementptr i64, ptr %t2673, i64 2
  %t2675 = load i64, ptr %t2674
  %t2676 = load i64, ptr @"scheme.base:for-each"
  %t2677 = and i64 %t2676, -8
  %t2678 = inttoptr i64 %t2677 to ptr
  %t2679 = load i64, ptr %t2678
  %t2680 = inttoptr i64 %t2679 to ptr
  %t2681 = musttail call fastcc i64 %t2680(i64 %t2676, i64 3, i64 %t2667, i64 %t2671, i64 %t2675, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2681
}

define fastcc i64 @"scheme.base:code:with-parameters"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2682 = icmp eq i64 %argc, 3
  br i1 %t2682, label %argok735, label %arityerr734
arityerr734:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok735:
  %t2683 = call ptr @rt_alloc_words(i64 1)
  %t2684 = ptrtoint ptr %t2683 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_596" to i64), ptr %t2683
  %t2685 = or i64 %t2684, 4
  %t2686 = load i64, ptr @"scheme.base:map"
  %t2687 = and i64 %t2686, -8
  %t2688 = inttoptr i64 %t2687 to ptr
  %t2689 = load i64, ptr %t2688
  %t2690 = inttoptr i64 %t2689 to ptr
  %t2691 = call fastcc i64%t2690(i64 %t2686, i64 2, i64 %t2685, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2692 = call ptr @rt_alloc_words(i64 3)
  %t2693 = ptrtoint ptr %t2692 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_598" to i64), ptr %t2692
  %t2694 = getelementptr i64, ptr %t2692, i64 1
  store i64 %a0, ptr %t2694
  %t2695 = getelementptr i64, ptr %t2692, i64 2
  store i64 %a1, ptr %t2695
  %t2696 = or i64 %t2693, 4
  %t2697 = call ptr @rt_alloc_words(i64 3)
  %t2698 = ptrtoint ptr %t2697 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_602" to i64), ptr %t2697
  %t2699 = getelementptr i64, ptr %t2697, i64 1
  store i64 %a0, ptr %t2699
  %t2700 = getelementptr i64, ptr %t2697, i64 2
  store i64 %t2691, ptr %t2700
  %t2701 = or i64 %t2698, 4
  %t2702 = load i64, ptr @"scheme.base:dynamic-wind"
  %t2703 = and i64 %t2702, -8
  %t2704 = inttoptr i64 %t2703 to ptr
  %t2705 = load i64, ptr %t2704
  %t2706 = inttoptr i64 %t2705 to ptr
  %t2707 = musttail call fastcc i64 %t2706(i64 %t2702, i64 3, i64 %t2696, i64 %a2, i64 %t2701, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2707
}

define fastcc i64 @"scheme.base:code_612"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2712 = icmp eq i64 %argc, 2
  br i1 %t2712, label %argok737, label %arityerr736
arityerr736:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok737:
  %t2713 = call i64 @rt_null_p(i64 %a0)
  %t2714 = icmp ne i64 %t2713, 1
  br i1 %t2714, label %then738, label %else739
then738:
  %t2715 = and i64 %self, -8
  %t2716 = inttoptr i64 %t2715 to ptr
  %t2717 = getelementptr i64, ptr %t2716, i64 1
  %t2718 = load i64, ptr %t2717
  ret i64 %t2718
else739:
  %t2719 = and i64 %self, -8
  %t2720 = inttoptr i64 %t2719 to ptr
  %t2721 = getelementptr i64, ptr %t2720, i64 1
  %t2722 = load i64, ptr %t2721
  %t2723 = call i64 @rt_car(i64 %a0)
  %t2724 = call i64 @rt_vector_set(i64 %t2722, i64 %a1, i64 %t2723)
  %t2725 = call i64 @rt_cdr(i64 %a0)
  %t2726 = or i64 %a1, 8
  %t2727 = and i64 %t2726, 7
  %t2728 = icmp eq i64 %t2727, 0
  br i1 %t2728, label %fixfast740, label %fixslow741
fixfast740:
  %t2729 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t2730 = extractvalue {i64, i1} %t2729, 0
  %t2731 = extractvalue {i64, i1} %t2729, 1
  br i1 %t2731, label %fixslow741, label %fixmerge742
fixslow741:
  %t2732 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge742
fixmerge742:
  %t2733 = phi i64 [ %t2730, %fixfast740 ], [ %t2732, %fixslow741 ]
  %t2734 = musttail call fastcc i64 @"scheme.base:code_612"(i64 %self, i64 2, i64 %t2725, i64 %t2733, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2734
}

define fastcc i64 @"scheme.base:code:list->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2735 = icmp eq i64 %argc, 1
  br i1 %t2735, label %argok744, label %arityerr743
arityerr743:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok744:
  %t2736 = load i64, ptr @"scheme.base:length"
  %t2737 = and i64 %t2736, -8
  %t2738 = inttoptr i64 %t2737 to ptr
  %t2739 = load i64, ptr %t2738
  %t2740 = inttoptr i64 %t2739 to ptr
  %t2741 = call fastcc i64%t2740(i64 %t2736, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2742 = call i64 @rt_make_vector(i64 %t2741, i64 0)
  %t2743 = call ptr @rt_alloc_words(i64 3)
  %t2744 = ptrtoint ptr %t2743 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_612" to i64), ptr %t2743
  %t2745 = or i64 %t2744, 4
  %t2746 = getelementptr i64, ptr %t2743, i64 1
  store i64 %t2742, ptr %t2746
  %t2747 = getelementptr i64, ptr %t2743, i64 2
  store i64 %t2745, ptr %t2747
  %t2748 = musttail call fastcc i64 @"scheme.base:code_612"(i64 %t2745, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2748
}

define fastcc i64 @"scheme.base:code:vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2753 = icmp sge i64 %argc, 0
  br i1 %t2753, label %argok746, label %arityerr745
arityerr745:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok746:
  %t2754 = call ptr @rt_alloc_words(i64 8)
  %t2755 = getelementptr i64, ptr %t2754, i64 0
  store i64 %a0, ptr %t2755
  %t2756 = getelementptr i64, ptr %t2754, i64 1
  store i64 %a1, ptr %t2756
  %t2757 = getelementptr i64, ptr %t2754, i64 2
  store i64 %a2, ptr %t2757
  %t2758 = getelementptr i64, ptr %t2754, i64 3
  store i64 %a3, ptr %t2758
  %t2759 = getelementptr i64, ptr %t2754, i64 4
  store i64 %a4, ptr %t2759
  %t2760 = getelementptr i64, ptr %t2754, i64 5
  store i64 %a5, ptr %t2760
  %t2761 = getelementptr i64, ptr %t2754, i64 6
  store i64 %a6, ptr %t2761
  %t2762 = getelementptr i64, ptr %t2754, i64 7
  store i64 %a7, ptr %t2762
  %t2763 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2754, ptr %overflow)
  %t2764 = load i64, ptr @"scheme.base:list->vector"
  %t2765 = and i64 %t2764, -8
  %t2766 = inttoptr i64 %t2765 to ptr
  %t2767 = load i64, ptr %t2766
  %t2768 = inttoptr i64 %t2767 to ptr
  %t2769 = musttail call fastcc i64 %t2768(i64 %t2764, i64 1, i64 %t2763, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2769
}

define fastcc i64 @"scheme.base:code_622"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2774 = icmp eq i64 %argc, 2
  br i1 %t2774, label %argok748, label %arityerr747
arityerr747:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok748:
  %t2775 = call i64 @rt_null_p(i64 %a0)
  %t2776 = icmp ne i64 %t2775, 1
  br i1 %t2776, label %then749, label %else750
then749:
  %t2777 = and i64 %self, -8
  %t2778 = inttoptr i64 %t2777 to ptr
  %t2779 = getelementptr i64, ptr %t2778, i64 1
  %t2780 = load i64, ptr %t2779
  ret i64 %t2780
else750:
  %t2781 = and i64 %self, -8
  %t2782 = inttoptr i64 %t2781 to ptr
  %t2783 = getelementptr i64, ptr %t2782, i64 1
  %t2784 = load i64, ptr %t2783
  %t2785 = call i64 @rt_car(i64 %a0)
  %t2786 = call i64 @rt_bytevector_u8_set(i64 %t2784, i64 %a1, i64 %t2785)
  %t2787 = call i64 @rt_cdr(i64 %a0)
  %t2788 = or i64 %a1, 8
  %t2789 = and i64 %t2788, 7
  %t2790 = icmp eq i64 %t2789, 0
  br i1 %t2790, label %fixfast751, label %fixslow752
fixfast751:
  %t2791 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t2792 = extractvalue {i64, i1} %t2791, 0
  %t2793 = extractvalue {i64, i1} %t2791, 1
  br i1 %t2793, label %fixslow752, label %fixmerge753
fixslow752:
  %t2794 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge753
fixmerge753:
  %t2795 = phi i64 [ %t2792, %fixfast751 ], [ %t2794, %fixslow752 ]
  %t2796 = musttail call fastcc i64 @"scheme.base:code_622"(i64 %self, i64 2, i64 %t2787, i64 %t2795, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2796
}

define fastcc i64 @"scheme.base:code:list->bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2797 = icmp eq i64 %argc, 1
  br i1 %t2797, label %argok755, label %arityerr754
arityerr754:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok755:
  %t2798 = load i64, ptr @"scheme.base:length"
  %t2799 = and i64 %t2798, -8
  %t2800 = inttoptr i64 %t2799 to ptr
  %t2801 = load i64, ptr %t2800
  %t2802 = inttoptr i64 %t2801 to ptr
  %t2803 = call fastcc i64%t2802(i64 %t2798, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2804 = call i64 @rt_make_bytevector(i64 %t2803, i64 0)
  %t2805 = call ptr @rt_alloc_words(i64 3)
  %t2806 = ptrtoint ptr %t2805 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_622" to i64), ptr %t2805
  %t2807 = or i64 %t2806, 4
  %t2808 = getelementptr i64, ptr %t2805, i64 1
  store i64 %t2804, ptr %t2808
  %t2809 = getelementptr i64, ptr %t2805, i64 2
  store i64 %t2807, ptr %t2809
  %t2810 = musttail call fastcc i64 @"scheme.base:code_622"(i64 %t2807, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2810
}

define fastcc i64 @"scheme.base:code:bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2815 = icmp sge i64 %argc, 0
  br i1 %t2815, label %argok757, label %arityerr756
arityerr756:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok757:
  %t2816 = call ptr @rt_alloc_words(i64 8)
  %t2817 = getelementptr i64, ptr %t2816, i64 0
  store i64 %a0, ptr %t2817
  %t2818 = getelementptr i64, ptr %t2816, i64 1
  store i64 %a1, ptr %t2818
  %t2819 = getelementptr i64, ptr %t2816, i64 2
  store i64 %a2, ptr %t2819
  %t2820 = getelementptr i64, ptr %t2816, i64 3
  store i64 %a3, ptr %t2820
  %t2821 = getelementptr i64, ptr %t2816, i64 4
  store i64 %a4, ptr %t2821
  %t2822 = getelementptr i64, ptr %t2816, i64 5
  store i64 %a5, ptr %t2822
  %t2823 = getelementptr i64, ptr %t2816, i64 6
  store i64 %a6, ptr %t2823
  %t2824 = getelementptr i64, ptr %t2816, i64 7
  store i64 %a7, ptr %t2824
  %t2825 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2816, ptr %overflow)
  %t2826 = load i64, ptr @"scheme.base:list->bytevector"
  %t2827 = and i64 %t2826, -8
  %t2828 = inttoptr i64 %t2827 to ptr
  %t2829 = load i64, ptr %t2828
  %t2830 = inttoptr i64 %t2829 to ptr
  %t2831 = musttail call fastcc i64 %t2830(i64 %t2826, i64 1, i64 %t2825, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2831
}

define fastcc i64 @"scheme.base:code:values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2836 = icmp sge i64 %argc, 0
  br i1 %t2836, label %argok759, label %arityerr758
arityerr758:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok759:
  %t2837 = call ptr @rt_alloc_words(i64 8)
  %t2838 = getelementptr i64, ptr %t2837, i64 0
  store i64 %a0, ptr %t2838
  %t2839 = getelementptr i64, ptr %t2837, i64 1
  store i64 %a1, ptr %t2839
  %t2840 = getelementptr i64, ptr %t2837, i64 2
  store i64 %a2, ptr %t2840
  %t2841 = getelementptr i64, ptr %t2837, i64 3
  store i64 %a3, ptr %t2841
  %t2842 = getelementptr i64, ptr %t2837, i64 4
  store i64 %a4, ptr %t2842
  %t2843 = getelementptr i64, ptr %t2837, i64 5
  store i64 %a5, ptr %t2843
  %t2844 = getelementptr i64, ptr %t2837, i64 6
  store i64 %a6, ptr %t2844
  %t2845 = getelementptr i64, ptr %t2837, i64 7
  store i64 %a7, ptr %t2845
  %t2846 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2837, ptr %overflow)
  %t2847 = call i64 @rt_pair_p(i64 %t2846)
  %t2848 = icmp ne i64 %t2847, 1
  br i1 %t2848, label %then760, label %else761
then760:
  %t2849 = call i64 @rt_cdr(i64 %t2846)
  %t2850 = call i64 @rt_null_p(i64 %t2849)
  br label %merge762
else761:
  br label %merge762
merge762:
  %t2851 = phi i64 [ %t2850, %then760 ], [ 1, %else761 ]
  %t2852 = icmp ne i64 %t2851, 1
  br i1 %t2852, label %then763, label %else764
then763:
  %t2853 = call i64 @rt_car(i64 %t2846)
  ret i64 %t2853
else764:
  %t2854 = call i64 @rt_list_to_mv(i64 %t2846)
  ret i64 %t2854
}

define fastcc i64 @"scheme.base:code:call-with-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2859 = icmp eq i64 %argc, 2
  br i1 %t2859, label %argok766, label %arityerr765
arityerr765:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok766:
  %t2860 = and i64 %a0, -8
  %t2861 = inttoptr i64 %t2860 to ptr
  %t2862 = load i64, ptr %t2861
  %t2863 = inttoptr i64 %t2862 to ptr
  %t2864 = call fastcc i64%t2863(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2865 = call i64 @rt_mv_p(i64 %t2864)
  %t2866 = icmp ne i64 %t2865, 1
  br i1 %t2866, label %then767, label %else768
then767:
  %t2867 = call i64 @rt_mv_to_list(i64 %t2864)
  %t2868 = and i64 %a1, -8
  %t2869 = inttoptr i64 %t2868 to ptr
  %t2870 = load i64, ptr %t2869
  %t2871 = inttoptr i64 %t2870 to ptr
  %t2872 = call i64 @rt_list_length(i64 %t2867)
  %t2873 = add i64 0, %t2872
  %t2874 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t2867, i64 8)
  %t2886 = getelementptr i64, ptr %t2874, i64 0
  %t2878 = load i64, ptr %t2886
  %t2887 = getelementptr i64, ptr %t2874, i64 1
  %t2879 = load i64, ptr %t2887
  %t2888 = getelementptr i64, ptr %t2874, i64 2
  %t2880 = load i64, ptr %t2888
  %t2889 = getelementptr i64, ptr %t2874, i64 3
  %t2881 = load i64, ptr %t2889
  %t2890 = getelementptr i64, ptr %t2874, i64 4
  %t2882 = load i64, ptr %t2890
  %t2891 = getelementptr i64, ptr %t2874, i64 5
  %t2883 = load i64, ptr %t2891
  %t2892 = getelementptr i64, ptr %t2874, i64 6
  %t2884 = load i64, ptr %t2892
  %t2893 = getelementptr i64, ptr %t2874, i64 7
  %t2885 = load i64, ptr %t2893
  %t2875 = icmp sgt i64 %t2873, 8
  %t2876 = getelementptr i64, ptr %t2874, i64 8
  %t2877 = select i1 %t2875, ptr %t2876, ptr null
  %t2894 = musttail call fastcc i64 %t2871(i64 %a1, i64 %t2873, i64 %t2878, i64 %t2879, i64 %t2880, i64 %t2881, i64 %t2882, i64 %t2883, i64 %t2884, i64 %t2885, ptr %t2877)
  ret i64 %t2894
else768:
  %t2895 = and i64 %a1, -8
  %t2896 = inttoptr i64 %t2895 to ptr
  %t2897 = load i64, ptr %t2896
  %t2898 = inttoptr i64 %t2897 to ptr
  %t2899 = musttail call fastcc i64 %t2898(i64 %a1, i64 1, i64 %t2864, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2899
}

define fastcc i64 @"scheme.base:code:make-hash-table"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2906 = icmp eq i64 %argc, 0
  br i1 %t2906, label %argok770, label %arityerr769
arityerr769:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok770:
  %t2907 = load i64, ptr @"scheme.base:%ht-initial-buckets"
  %t2908 = call i64 @rt_make_vector(i64 %t2907, i64 2)
  %t2909 = load i64, ptr @"scheme.base:vector"
  %t2910 = and i64 %t2909, -8
  %t2911 = inttoptr i64 %t2910 to ptr
  %t2912 = load i64, ptr %t2911
  %t2913 = inttoptr i64 %t2912 to ptr
  %t2914 = call fastcc i64%t2913(i64 %t2909, i64 3, i64 0, i64 %t2908, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2915 = call i64 @rt_make_hash_table(i64 %t2914)
  ret i64 %t2915
}

define fastcc i64 @"scheme.base:code:hash-table?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2920 = icmp eq i64 %argc, 1
  br i1 %t2920, label %argok772, label %arityerr771
arityerr771:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok772:
  %t2921 = call i64 @rt_hash_table_p(i64 %a0)
  ret i64 %t2921
}

define fastcc i64 @"scheme.base:code:%ht-count"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2926 = icmp eq i64 %argc, 1
  br i1 %t2926, label %argok774, label %arityerr773
arityerr773:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok774:
  %t2927 = call i64 @rt_hash_table_spine(i64 %a0)
  %t2928 = call i64 @rt_vector_ref(i64 %t2927, i64 0)
  ret i64 %t2928
}

define fastcc i64 @"scheme.base:code:%ht-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2933 = icmp eq i64 %argc, 1
  br i1 %t2933, label %argok776, label %arityerr775
arityerr775:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok776:
  %t2934 = call i64 @rt_hash_table_spine(i64 %a0)
  %t2935 = call i64 @rt_vector_ref(i64 %t2934, i64 8)
  ret i64 %t2935
}

define fastcc i64 @"scheme.base:code:%ht-set-count!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2940 = icmp eq i64 %argc, 2
  br i1 %t2940, label %argok778, label %arityerr777
arityerr777:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok778:
  %t2941 = call i64 @rt_hash_table_spine(i64 %a0)
  %t2942 = call i64 @rt_vector_set(i64 %t2941, i64 0, i64 %a1)
  ret i64 %t2942
}

define fastcc i64 @"scheme.base:code:%ht-set-buckets!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2947 = icmp eq i64 %argc, 2
  br i1 %t2947, label %argok780, label %arityerr779
arityerr779:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok780:
  %t2948 = call i64 @rt_hash_table_spine(i64 %a0)
  %t2949 = call i64 @rt_vector_set(i64 %t2948, i64 8, i64 %a1)
  ret i64 %t2949
}

define fastcc i64 @"scheme.base:code:%ht-index"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2954 = icmp eq i64 %argc, 2
  br i1 %t2954, label %argok782, label %arityerr781
arityerr781:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok782:
  %t2955 = call i64 @rt_hash(i64 %a0)
  %t2956 = call i64 @rt_remainder(i64 %t2955, i64 %a1)
  ret i64 %t2956
}

define fastcc i64 @"scheme.base:code:%ht-assoc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2961 = icmp eq i64 %argc, 2
  br i1 %t2961, label %argok784, label %arityerr783
arityerr783:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok784:
  %t2962 = call i64 @rt_null_p(i64 %a1)
  %t2963 = icmp ne i64 %t2962, 1
  br i1 %t2963, label %then785, label %else786
then785:
  ret i64 1
else786:
  %t2964 = call i64 @rt_car(i64 %a1)
  %t2965 = call i64 @rt_car(i64 %t2964)
  %t2966 = call i64 @rt_equal(i64 %a0, i64 %t2965)
  %t2967 = icmp ne i64 %t2966, 1
  br i1 %t2967, label %then787, label %else788
then787:
  %t2968 = call i64 @rt_car(i64 %a1)
  ret i64 %t2968
else788:
  %t2969 = call i64 @rt_cdr(i64 %a1)
  %t2970 = load i64, ptr @"scheme.base:%ht-assoc"
  %t2971 = and i64 %t2970, -8
  %t2972 = inttoptr i64 %t2971 to ptr
  %t2973 = load i64, ptr %t2972
  %t2974 = inttoptr i64 %t2973 to ptr
  %t2975 = musttail call fastcc i64 %t2974(i64 %t2970, i64 2, i64 %a0, i64 %t2969, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2975
}

define fastcc i64 @"scheme.base:code:%ht-remove"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2980 = icmp eq i64 %argc, 2
  br i1 %t2980, label %argok790, label %arityerr789
arityerr789:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok790:
  %t2981 = call i64 @rt_null_p(i64 %a1)
  %t2982 = icmp ne i64 %t2981, 1
  br i1 %t2982, label %then791, label %else792
then791:
  ret i64 2
else792:
  %t2983 = call i64 @rt_car(i64 %a1)
  %t2984 = call i64 @rt_car(i64 %t2983)
  %t2985 = call i64 @rt_equal(i64 %a0, i64 %t2984)
  %t2986 = icmp ne i64 %t2985, 1
  br i1 %t2986, label %then793, label %else794
then793:
  %t2987 = call i64 @rt_cdr(i64 %a1)
  ret i64 %t2987
else794:
  %t2988 = call i64 @rt_car(i64 %a1)
  %t2989 = call i64 @rt_cdr(i64 %a1)
  %t2990 = load i64, ptr @"scheme.base:%ht-remove"
  %t2991 = and i64 %t2990, -8
  %t2992 = inttoptr i64 %t2991 to ptr
  %t2993 = load i64, ptr %t2992
  %t2994 = inttoptr i64 %t2993 to ptr
  %t2995 = call fastcc i64%t2994(i64 %t2990, i64 2, i64 %a0, i64 %t2989, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2996 = call i64 @rt_cons(i64 %t2988, i64 %t2995)
  ret i64 %t2996
}

define fastcc i64 @"scheme.base:code:hash-table-ref/default"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3001 = icmp eq i64 %argc, 3
  br i1 %t3001, label %argok796, label %arityerr795
arityerr795:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok796:
  %t3002 = load i64, ptr @"scheme.base:%ht-buckets"
  %t3003 = and i64 %t3002, -8
  %t3004 = inttoptr i64 %t3003 to ptr
  %t3005 = load i64, ptr %t3004
  %t3006 = inttoptr i64 %t3005 to ptr
  %t3007 = call fastcc i64%t3006(i64 %t3002, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3008 = call i64 @rt_vector_length(i64 %t3007)
  %t3009 = load i64, ptr @"scheme.base:%ht-index"
  %t3010 = and i64 %t3009, -8
  %t3011 = inttoptr i64 %t3010 to ptr
  %t3012 = load i64, ptr %t3011
  %t3013 = inttoptr i64 %t3012 to ptr
  %t3014 = call fastcc i64%t3013(i64 %t3009, i64 2, i64 %a1, i64 %t3008, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3015 = call i64 @rt_vector_ref(i64 %t3007, i64 %t3014)
  %t3016 = load i64, ptr @"scheme.base:%ht-assoc"
  %t3017 = and i64 %t3016, -8
  %t3018 = inttoptr i64 %t3017 to ptr
  %t3019 = load i64, ptr %t3018
  %t3020 = inttoptr i64 %t3019 to ptr
  %t3021 = call fastcc i64%t3020(i64 %t3016, i64 2, i64 %a1, i64 %t3015, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3022 = icmp ne i64 %t3021, 1
  br i1 %t3022, label %then797, label %else798
then797:
  %t3023 = call i64 @rt_cdr(i64 %t3021)
  ret i64 %t3023
else798:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:hash-table-contains?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3028 = icmp eq i64 %argc, 2
  br i1 %t3028, label %argok800, label %arityerr799
arityerr799:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok800:
  %t3029 = load i64, ptr @"scheme.base:%ht-buckets"
  %t3030 = and i64 %t3029, -8
  %t3031 = inttoptr i64 %t3030 to ptr
  %t3032 = load i64, ptr %t3031
  %t3033 = inttoptr i64 %t3032 to ptr
  %t3034 = call fastcc i64%t3033(i64 %t3029, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3035 = call i64 @rt_vector_length(i64 %t3034)
  %t3036 = load i64, ptr @"scheme.base:%ht-index"
  %t3037 = and i64 %t3036, -8
  %t3038 = inttoptr i64 %t3037 to ptr
  %t3039 = load i64, ptr %t3038
  %t3040 = inttoptr i64 %t3039 to ptr
  %t3041 = call fastcc i64%t3040(i64 %t3036, i64 2, i64 %a1, i64 %t3035, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3042 = call i64 @rt_vector_ref(i64 %t3034, i64 %t3041)
  %t3043 = load i64, ptr @"scheme.base:%ht-assoc"
  %t3044 = and i64 %t3043, -8
  %t3045 = inttoptr i64 %t3044 to ptr
  %t3046 = load i64, ptr %t3045
  %t3047 = inttoptr i64 %t3046 to ptr
  %t3048 = call fastcc i64%t3047(i64 %t3043, i64 2, i64 %a1, i64 %t3042, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3049 = icmp ne i64 %t3048, 1
  br i1 %t3049, label %then801, label %else802
then801:
  ret i64 257
else802:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-ref"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3054 = icmp eq i64 %argc, 2
  br i1 %t3054, label %argok804, label %arityerr803
arityerr803:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok804:
  %t3055 = load i64, ptr @"scheme.base:%ht-buckets"
  %t3056 = and i64 %t3055, -8
  %t3057 = inttoptr i64 %t3056 to ptr
  %t3058 = load i64, ptr %t3057
  %t3059 = inttoptr i64 %t3058 to ptr
  %t3060 = call fastcc i64%t3059(i64 %t3055, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3061 = call i64 @rt_vector_length(i64 %t3060)
  %t3062 = load i64, ptr @"scheme.base:%ht-index"
  %t3063 = and i64 %t3062, -8
  %t3064 = inttoptr i64 %t3063 to ptr
  %t3065 = load i64, ptr %t3064
  %t3066 = inttoptr i64 %t3065 to ptr
  %t3067 = call fastcc i64%t3066(i64 %t3062, i64 2, i64 %a1, i64 %t3061, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3068 = call i64 @rt_vector_ref(i64 %t3060, i64 %t3067)
  %t3069 = load i64, ptr @"scheme.base:%ht-assoc"
  %t3070 = and i64 %t3069, -8
  %t3071 = inttoptr i64 %t3070 to ptr
  %t3072 = load i64, ptr %t3071
  %t3073 = inttoptr i64 %t3072 to ptr
  %t3074 = call fastcc i64%t3073(i64 %t3069, i64 2, i64 %a1, i64 %t3068, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3075 = icmp ne i64 %t3074, 1
  br i1 %t3075, label %then805, label %else806
then805:
  %t3076 = call i64 @rt_cdr(i64 %t3074)
  ret i64 %t3076
else806:
  %t3077 = call i64 @rt_make_string(ptr @.str.lit.12, i64 29)
  %t3078 = load i64, ptr @"scheme.base:error"
  %t3079 = and i64 %t3078, -8
  %t3080 = inttoptr i64 %t3079 to ptr
  %t3081 = load i64, ptr %t3080
  %t3082 = inttoptr i64 %t3081 to ptr
  %t3083 = musttail call fastcc i64 %t3082(i64 %t3078, i64 2, i64 %t3077, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3083
}

define fastcc i64 @"scheme.base:code:hash-table-set!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3088 = icmp eq i64 %argc, 3
  br i1 %t3088, label %argok808, label %arityerr807
arityerr807:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok808:
  %t3089 = load i64, ptr @"scheme.base:%ht-buckets"
  %t3090 = and i64 %t3089, -8
  %t3091 = inttoptr i64 %t3090 to ptr
  %t3092 = load i64, ptr %t3091
  %t3093 = inttoptr i64 %t3092 to ptr
  %t3094 = call fastcc i64%t3093(i64 %t3089, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3095 = call i64 @rt_vector_length(i64 %t3094)
  %t3096 = load i64, ptr @"scheme.base:%ht-index"
  %t3097 = and i64 %t3096, -8
  %t3098 = inttoptr i64 %t3097 to ptr
  %t3099 = load i64, ptr %t3098
  %t3100 = inttoptr i64 %t3099 to ptr
  %t3101 = call fastcc i64%t3100(i64 %t3096, i64 2, i64 %a1, i64 %t3095, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3102 = call i64 @rt_vector_ref(i64 %t3094, i64 %t3101)
  %t3103 = load i64, ptr @"scheme.base:%ht-assoc"
  %t3104 = and i64 %t3103, -8
  %t3105 = inttoptr i64 %t3104 to ptr
  %t3106 = load i64, ptr %t3105
  %t3107 = inttoptr i64 %t3106 to ptr
  %t3108 = call fastcc i64%t3107(i64 %t3103, i64 2, i64 %a1, i64 %t3102, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3109 = call i64 @rt_cons(i64 %a1, i64 %a2)
  %t3110 = icmp ne i64 %t3108, 1
  br i1 %t3110, label %then809, label %else810
then809:
  %t3111 = load i64, ptr @"scheme.base:%ht-remove"
  %t3112 = and i64 %t3111, -8
  %t3113 = inttoptr i64 %t3112 to ptr
  %t3114 = load i64, ptr %t3113
  %t3115 = inttoptr i64 %t3114 to ptr
  %t3116 = call fastcc i64%t3115(i64 %t3111, i64 2, i64 %a1, i64 %t3102, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge811
else810:
  br label %merge811
merge811:
  %t3117 = phi i64 [ %t3116, %then809 ], [ %t3102, %else810 ]
  %t3118 = call i64 @rt_cons(i64 %t3109, i64 %t3117)
  %t3119 = call i64 @rt_vector_set(i64 %t3094, i64 %t3101, i64 %t3118)
  %t3120 = icmp ne i64 %t3108, 1
  br i1 %t3120, label %then812, label %else813
then812:
  ret i64 1
else813:
  %t3121 = load i64, ptr @"scheme.base:%ht-count"
  %t3122 = and i64 %t3121, -8
  %t3123 = inttoptr i64 %t3122 to ptr
  %t3124 = load i64, ptr %t3123
  %t3125 = inttoptr i64 %t3124 to ptr
  %t3126 = call fastcc i64%t3125(i64 %t3121, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3127 = or i64 %t3126, 8
  %t3128 = and i64 %t3127, 7
  %t3129 = icmp eq i64 %t3128, 0
  br i1 %t3129, label %fixfast814, label %fixslow815
fixfast814:
  %t3130 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3126, i64 8)
  %t3131 = extractvalue {i64, i1} %t3130, 0
  %t3132 = extractvalue {i64, i1} %t3130, 1
  br i1 %t3132, label %fixslow815, label %fixmerge816
fixslow815:
  %t3133 = call i64 @rt_add(i64 %t3126, i64 8)
  br label %fixmerge816
fixmerge816:
  %t3134 = phi i64 [ %t3131, %fixfast814 ], [ %t3133, %fixslow815 ]
  %t3135 = load i64, ptr @"scheme.base:%ht-set-count!"
  %t3136 = and i64 %t3135, -8
  %t3137 = inttoptr i64 %t3136 to ptr
  %t3138 = load i64, ptr %t3137
  %t3139 = inttoptr i64 %t3138 to ptr
  %t3140 = call fastcc i64%t3139(i64 %t3135, i64 2, i64 %a0, i64 %t3134, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3141 = load i64, ptr @"scheme.base:%ht-count"
  %t3142 = and i64 %t3141, -8
  %t3143 = inttoptr i64 %t3142 to ptr
  %t3144 = load i64, ptr %t3143
  %t3145 = inttoptr i64 %t3144 to ptr
  %t3146 = call fastcc i64%t3145(i64 %t3141, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3147 = load i64, ptr @"scheme.base:%ht-load-factor"
  %t3148 = or i64 %t3147, %t3095
  %t3149 = and i64 %t3148, 7
  %t3150 = icmp eq i64 %t3149, 0
  br i1 %t3150, label %fixfast817, label %fixslow818
fixfast817:
  %t3151 = ashr i64 %t3147, 3
  %t3152 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t3151, i64 %t3095)
  %t3153 = extractvalue {i64, i1} %t3152, 0
  %t3154 = extractvalue {i64, i1} %t3152, 1
  br i1 %t3154, label %fixslow818, label %fixmerge819
fixslow818:
  %t3155 = call i64 @rt_mul(i64 %t3147, i64 %t3095)
  br label %fixmerge819
fixmerge819:
  %t3156 = phi i64 [ %t3153, %fixfast817 ], [ %t3155, %fixslow818 ]
  %t3157 = or i64 %t3156, %t3146
  %t3158 = and i64 %t3157, 7
  %t3159 = icmp eq i64 %t3158, 0
  br i1 %t3159, label %fixfast820, label %fixslow821
fixfast820:
  %t3160 = icmp slt i64 %t3156, %t3146
  %t3161 = select i1 %t3160, i64 257, i64 1
  br label %fixmerge822
fixslow821:
  %t3162 = call i64 @rt_lt(i64 %t3156, i64 %t3146)
  br label %fixmerge822
fixmerge822:
  %t3163 = phi i64 [ %t3161, %fixfast820 ], [ %t3162, %fixslow821 ]
  %t3164 = icmp ne i64 %t3163, 1
  br i1 %t3164, label %then823, label %else824
then823:
  %t3165 = load i64, ptr @"scheme.base:%ht-grow!"
  %t3166 = and i64 %t3165, -8
  %t3167 = inttoptr i64 %t3166 to ptr
  %t3168 = load i64, ptr %t3167
  %t3169 = inttoptr i64 %t3168 to ptr
  %t3170 = musttail call fastcc i64 %t3169(i64 %t3165, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3170
else824:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-delete!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3175 = icmp eq i64 %argc, 2
  br i1 %t3175, label %argok826, label %arityerr825
arityerr825:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok826:
  %t3176 = load i64, ptr @"scheme.base:%ht-buckets"
  %t3177 = and i64 %t3176, -8
  %t3178 = inttoptr i64 %t3177 to ptr
  %t3179 = load i64, ptr %t3178
  %t3180 = inttoptr i64 %t3179 to ptr
  %t3181 = call fastcc i64%t3180(i64 %t3176, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3182 = call i64 @rt_vector_length(i64 %t3181)
  %t3183 = load i64, ptr @"scheme.base:%ht-index"
  %t3184 = and i64 %t3183, -8
  %t3185 = inttoptr i64 %t3184 to ptr
  %t3186 = load i64, ptr %t3185
  %t3187 = inttoptr i64 %t3186 to ptr
  %t3188 = call fastcc i64%t3187(i64 %t3183, i64 2, i64 %a1, i64 %t3182, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3189 = call i64 @rt_vector_ref(i64 %t3181, i64 %t3188)
  %t3190 = load i64, ptr @"scheme.base:%ht-assoc"
  %t3191 = and i64 %t3190, -8
  %t3192 = inttoptr i64 %t3191 to ptr
  %t3193 = load i64, ptr %t3192
  %t3194 = inttoptr i64 %t3193 to ptr
  %t3195 = call fastcc i64%t3194(i64 %t3190, i64 2, i64 %a1, i64 %t3189, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3196 = icmp ne i64 %t3195, 1
  br i1 %t3196, label %then827, label %else828
then827:
  %t3197 = load i64, ptr @"scheme.base:%ht-remove"
  %t3198 = and i64 %t3197, -8
  %t3199 = inttoptr i64 %t3198 to ptr
  %t3200 = load i64, ptr %t3199
  %t3201 = inttoptr i64 %t3200 to ptr
  %t3202 = call fastcc i64%t3201(i64 %t3197, i64 2, i64 %a1, i64 %t3189, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3203 = call i64 @rt_vector_set(i64 %t3181, i64 %t3188, i64 %t3202)
  %t3204 = load i64, ptr @"scheme.base:%ht-count"
  %t3205 = and i64 %t3204, -8
  %t3206 = inttoptr i64 %t3205 to ptr
  %t3207 = load i64, ptr %t3206
  %t3208 = inttoptr i64 %t3207 to ptr
  %t3209 = call fastcc i64%t3208(i64 %t3204, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3210 = or i64 %t3209, 8
  %t3211 = and i64 %t3210, 7
  %t3212 = icmp eq i64 %t3211, 0
  br i1 %t3212, label %fixfast829, label %fixslow830
fixfast829:
  %t3213 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3209, i64 8)
  %t3214 = extractvalue {i64, i1} %t3213, 0
  %t3215 = extractvalue {i64, i1} %t3213, 1
  br i1 %t3215, label %fixslow830, label %fixmerge831
fixslow830:
  %t3216 = call i64 @rt_sub(i64 %t3209, i64 8)
  br label %fixmerge831
fixmerge831:
  %t3217 = phi i64 [ %t3214, %fixfast829 ], [ %t3216, %fixslow830 ]
  %t3218 = load i64, ptr @"scheme.base:%ht-set-count!"
  %t3219 = and i64 %t3218, -8
  %t3220 = inttoptr i64 %t3219 to ptr
  %t3221 = load i64, ptr %t3220
  %t3222 = inttoptr i64 %t3221 to ptr
  %t3223 = musttail call fastcc i64 %t3222(i64 %t3218, i64 2, i64 %a0, i64 %t3217, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3223
else828:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_705"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3228 = icmp eq i64 %argc, 1
  br i1 %t3228, label %argok833, label %arityerr832
arityerr832:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok833:
  %t3229 = call i64 @rt_null_p(i64 %a0)
  %t3230 = icmp ne i64 %t3229, 1
  br i1 %t3230, label %then834, label %else835
then834:
  ret i64 1
else835:
  %t3231 = call i64 @rt_car(i64 %a0)
  %t3232 = call i64 @rt_car(i64 %t3231)
  %t3233 = and i64 %self, -8
  %t3234 = inttoptr i64 %t3233 to ptr
  %t3235 = getelementptr i64, ptr %t3234, i64 1
  %t3236 = load i64, ptr %t3235
  %t3237 = load i64, ptr @"scheme.base:%ht-index"
  %t3238 = and i64 %t3237, -8
  %t3239 = inttoptr i64 %t3238 to ptr
  %t3240 = load i64, ptr %t3239
  %t3241 = inttoptr i64 %t3240 to ptr
  %t3242 = call fastcc i64%t3241(i64 %t3237, i64 2, i64 %t3232, i64 %t3236, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3243 = and i64 %self, -8
  %t3244 = inttoptr i64 %t3243 to ptr
  %t3245 = getelementptr i64, ptr %t3244, i64 2
  %t3246 = load i64, ptr %t3245
  %t3247 = and i64 %self, -8
  %t3248 = inttoptr i64 %t3247 to ptr
  %t3249 = getelementptr i64, ptr %t3248, i64 2
  %t3250 = load i64, ptr %t3249
  %t3251 = call i64 @rt_vector_ref(i64 %t3250, i64 %t3242)
  %t3252 = call i64 @rt_cons(i64 %t3231, i64 %t3251)
  %t3253 = call i64 @rt_vector_set(i64 %t3246, i64 %t3242, i64 %t3252)
  %t3254 = call i64 @rt_cdr(i64 %a0)
  %t3255 = musttail call fastcc i64 @"scheme.base:code_705"(i64 %self, i64 1, i64 %t3254, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3255
}

define fastcc i64 @"scheme.base:code_703"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3256 = icmp eq i64 %argc, 1
  br i1 %t3256, label %argok837, label %arityerr836
arityerr836:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok837:
  %t3257 = and i64 %self, -8
  %t3258 = inttoptr i64 %t3257 to ptr
  %t3259 = getelementptr i64, ptr %t3258, i64 1
  %t3260 = load i64, ptr %t3259
  %t3261 = call i64 @rt_vector_length(i64 %t3260)
  %t3262 = or i64 %a0, %t3261
  %t3263 = and i64 %t3262, 7
  %t3264 = icmp eq i64 %t3263, 0
  br i1 %t3264, label %fixfast838, label %fixslow839
fixfast838:
  %t3265 = icmp slt i64 %a0, %t3261
  %t3266 = select i1 %t3265, i64 257, i64 1
  br label %fixmerge840
fixslow839:
  %t3267 = call i64 @rt_lt(i64 %a0, i64 %t3261)
  br label %fixmerge840
fixmerge840:
  %t3268 = phi i64 [ %t3266, %fixfast838 ], [ %t3267, %fixslow839 ]
  %t3269 = icmp ne i64 %t3268, 1
  br i1 %t3269, label %then841, label %else842
then841:
  %t3270 = call ptr @rt_alloc_words(i64 4)
  %t3271 = ptrtoint ptr %t3270 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_705" to i64), ptr %t3270
  %t3272 = or i64 %t3271, 4
  %t3273 = and i64 %self, -8
  %t3274 = inttoptr i64 %t3273 to ptr
  %t3275 = getelementptr i64, ptr %t3274, i64 2
  %t3276 = load i64, ptr %t3275
  %t3277 = getelementptr i64, ptr %t3270, i64 1
  store i64 %t3276, ptr %t3277
  %t3278 = and i64 %self, -8
  %t3279 = inttoptr i64 %t3278 to ptr
  %t3280 = getelementptr i64, ptr %t3279, i64 3
  %t3281 = load i64, ptr %t3280
  %t3282 = getelementptr i64, ptr %t3270, i64 2
  store i64 %t3281, ptr %t3282
  %t3283 = getelementptr i64, ptr %t3270, i64 3
  store i64 %t3272, ptr %t3283
  %t3284 = and i64 %self, -8
  %t3285 = inttoptr i64 %t3284 to ptr
  %t3286 = getelementptr i64, ptr %t3285, i64 1
  %t3287 = load i64, ptr %t3286
  %t3288 = call i64 @rt_vector_ref(i64 %t3287, i64 %a0)
  %t3289 = call fastcc i64 @"scheme.base:code_705"(i64 %t3272, i64 1, i64 %t3288, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3290 = or i64 %a0, 8
  %t3291 = and i64 %t3290, 7
  %t3292 = icmp eq i64 %t3291, 0
  br i1 %t3292, label %fixfast843, label %fixslow844
fixfast843:
  %t3293 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3294 = extractvalue {i64, i1} %t3293, 0
  %t3295 = extractvalue {i64, i1} %t3293, 1
  br i1 %t3295, label %fixslow844, label %fixmerge845
fixslow844:
  %t3296 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge845
fixmerge845:
  %t3297 = phi i64 [ %t3294, %fixfast843 ], [ %t3296, %fixslow844 ]
  %t3298 = musttail call fastcc i64 @"scheme.base:code_703"(i64 %self, i64 1, i64 %t3297, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3298
else842:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%ht-grow!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3299 = icmp eq i64 %argc, 1
  br i1 %t3299, label %argok847, label %arityerr846
arityerr846:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok847:
  %t3300 = load i64, ptr @"scheme.base:%ht-buckets"
  %t3301 = and i64 %t3300, -8
  %t3302 = inttoptr i64 %t3301 to ptr
  %t3303 = load i64, ptr %t3302
  %t3304 = inttoptr i64 %t3303 to ptr
  %t3305 = call fastcc i64%t3304(i64 %t3300, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3306 = call i64 @rt_vector_length(i64 %t3305)
  %t3307 = or i64 16, %t3306
  %t3308 = and i64 %t3307, 7
  %t3309 = icmp eq i64 %t3308, 0
  br i1 %t3309, label %fixfast848, label %fixslow849
fixfast848:
  %t3310 = ashr i64 16, 3
  %t3311 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t3310, i64 %t3306)
  %t3312 = extractvalue {i64, i1} %t3311, 0
  %t3313 = extractvalue {i64, i1} %t3311, 1
  br i1 %t3313, label %fixslow849, label %fixmerge850
fixslow849:
  %t3314 = call i64 @rt_mul(i64 16, i64 %t3306)
  br label %fixmerge850
fixmerge850:
  %t3315 = phi i64 [ %t3312, %fixfast848 ], [ %t3314, %fixslow849 ]
  %t3316 = call i64 @rt_make_vector(i64 %t3315, i64 2)
  %t3317 = call ptr @rt_alloc_words(i64 5)
  %t3318 = ptrtoint ptr %t3317 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_703" to i64), ptr %t3317
  %t3319 = or i64 %t3318, 4
  %t3320 = getelementptr i64, ptr %t3317, i64 1
  store i64 %t3305, ptr %t3320
  %t3321 = getelementptr i64, ptr %t3317, i64 2
  store i64 %t3315, ptr %t3321
  %t3322 = getelementptr i64, ptr %t3317, i64 3
  store i64 %t3316, ptr %t3322
  %t3323 = getelementptr i64, ptr %t3317, i64 4
  store i64 %t3319, ptr %t3323
  %t3324 = call fastcc i64 @"scheme.base:code_703"(i64 %t3319, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3325 = load i64, ptr @"scheme.base:%ht-set-buckets!"
  %t3326 = and i64 %t3325, -8
  %t3327 = inttoptr i64 %t3326 to ptr
  %t3328 = load i64, ptr %t3327
  %t3329 = inttoptr i64 %t3328 to ptr
  %t3330 = musttail call fastcc i64 %t3329(i64 %t3325, i64 2, i64 %a0, i64 %t3316, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3330
}

define fastcc i64 @"scheme.base:code:hash-table-size"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3335 = icmp eq i64 %argc, 1
  br i1 %t3335, label %argok852, label %arityerr851
arityerr851:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok852:
  %t3336 = load i64, ptr @"scheme.base:%ht-count"
  %t3337 = and i64 %t3336, -8
  %t3338 = inttoptr i64 %t3337 to ptr
  %t3339 = load i64, ptr %t3338
  %t3340 = inttoptr i64 %t3339 to ptr
  %t3341 = musttail call fastcc i64 %t3340(i64 %t3336, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3341
}

define fastcc i64 @"scheme.base:code:%ht-fold-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3346 = icmp eq i64 %argc, 2
  br i1 %t3346, label %argok854, label %arityerr853
arityerr853:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok854:
  %t3347 = call i64 @rt_null_p(i64 %a0)
  %t3348 = icmp ne i64 %t3347, 1
  br i1 %t3348, label %then855, label %else856
then855:
  ret i64 %a1
else856:
  %t3349 = call i64 @rt_car(i64 %a0)
  %t3350 = call i64 @rt_car(i64 %t3349)
  %t3351 = call i64 @rt_car(i64 %a0)
  %t3352 = call i64 @rt_cdr(i64 %t3351)
  %t3353 = call i64 @rt_cons(i64 %t3350, i64 %t3352)
  %t3354 = call i64 @rt_cdr(i64 %a0)
  %t3355 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  %t3356 = and i64 %t3355, -8
  %t3357 = inttoptr i64 %t3356 to ptr
  %t3358 = load i64, ptr %t3357
  %t3359 = inttoptr i64 %t3358 to ptr
  %t3360 = call fastcc i64%t3359(i64 %t3355, i64 2, i64 %t3354, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3361 = call i64 @rt_cons(i64 %t3353, i64 %t3360)
  ret i64 %t3361
}

define fastcc i64 @"scheme.base:code_722"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3366 = icmp eq i64 %argc, 2
  br i1 %t3366, label %argok858, label %arityerr857
arityerr857:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok858:
  %t3367 = and i64 %self, -8
  %t3368 = inttoptr i64 %t3367 to ptr
  %t3369 = getelementptr i64, ptr %t3368, i64 1
  %t3370 = load i64, ptr %t3369
  %t3371 = call i64 @rt_vector_length(i64 %t3370)
  %t3372 = or i64 %a0, %t3371
  %t3373 = and i64 %t3372, 7
  %t3374 = icmp eq i64 %t3373, 0
  br i1 %t3374, label %fixfast859, label %fixslow860
fixfast859:
  %t3375 = icmp slt i64 %a0, %t3371
  %t3376 = select i1 %t3375, i64 257, i64 1
  br label %fixmerge861
fixslow860:
  %t3377 = call i64 @rt_lt(i64 %a0, i64 %t3371)
  br label %fixmerge861
fixmerge861:
  %t3378 = phi i64 [ %t3376, %fixfast859 ], [ %t3377, %fixslow860 ]
  %t3379 = icmp ne i64 %t3378, 1
  br i1 %t3379, label %then862, label %else863
then862:
  %t3380 = or i64 %a0, 8
  %t3381 = and i64 %t3380, 7
  %t3382 = icmp eq i64 %t3381, 0
  br i1 %t3382, label %fixfast864, label %fixslow865
fixfast864:
  %t3383 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3384 = extractvalue {i64, i1} %t3383, 0
  %t3385 = extractvalue {i64, i1} %t3383, 1
  br i1 %t3385, label %fixslow865, label %fixmerge866
fixslow865:
  %t3386 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge866
fixmerge866:
  %t3387 = phi i64 [ %t3384, %fixfast864 ], [ %t3386, %fixslow865 ]
  %t3388 = and i64 %self, -8
  %t3389 = inttoptr i64 %t3388 to ptr
  %t3390 = getelementptr i64, ptr %t3389, i64 1
  %t3391 = load i64, ptr %t3390
  %t3392 = call i64 @rt_vector_ref(i64 %t3391, i64 %a0)
  %t3393 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  %t3394 = and i64 %t3393, -8
  %t3395 = inttoptr i64 %t3394 to ptr
  %t3396 = load i64, ptr %t3395
  %t3397 = inttoptr i64 %t3396 to ptr
  %t3398 = call fastcc i64%t3397(i64 %t3393, i64 2, i64 %t3392, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3399 = musttail call fastcc i64 @"scheme.base:code_722"(i64 %self, i64 2, i64 %t3387, i64 %t3398, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3399
else863:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:hash-table->alist"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3400 = icmp eq i64 %argc, 1
  br i1 %t3400, label %argok868, label %arityerr867
arityerr867:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok868:
  %t3401 = load i64, ptr @"scheme.base:%ht-buckets"
  %t3402 = and i64 %t3401, -8
  %t3403 = inttoptr i64 %t3402 to ptr
  %t3404 = load i64, ptr %t3403
  %t3405 = inttoptr i64 %t3404 to ptr
  %t3406 = call fastcc i64%t3405(i64 %t3401, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3407 = call ptr @rt_alloc_words(i64 3)
  %t3408 = ptrtoint ptr %t3407 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_722" to i64), ptr %t3407
  %t3409 = or i64 %t3408, 4
  %t3410 = getelementptr i64, ptr %t3407, i64 1
  store i64 %t3406, ptr %t3410
  %t3411 = getelementptr i64, ptr %t3407, i64 2
  store i64 %t3409, ptr %t3411
  %t3412 = musttail call fastcc i64 @"scheme.base:code_722"(i64 %t3409, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3412
}

define fastcc i64 @"scheme.base:code_727"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3417 = icmp eq i64 %argc, 1
  br i1 %t3417, label %argok870, label %arityerr869
arityerr869:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok870:
  %t3418 = call i64 @rt_car(i64 %a0)
  ret i64 %t3418
}

define fastcc i64 @"scheme.base:code:hash-table-keys"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3419 = icmp eq i64 %argc, 1
  br i1 %t3419, label %argok872, label %arityerr871
arityerr871:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok872:
  %t3420 = call ptr @rt_alloc_words(i64 1)
  %t3421 = ptrtoint ptr %t3420 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_727" to i64), ptr %t3420
  %t3422 = or i64 %t3421, 4
  %t3423 = load i64, ptr @"scheme.base:hash-table->alist"
  %t3424 = and i64 %t3423, -8
  %t3425 = inttoptr i64 %t3424 to ptr
  %t3426 = load i64, ptr %t3425
  %t3427 = inttoptr i64 %t3426 to ptr
  %t3428 = call fastcc i64%t3427(i64 %t3423, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3429 = load i64, ptr @"scheme.base:map"
  %t3430 = and i64 %t3429, -8
  %t3431 = inttoptr i64 %t3430 to ptr
  %t3432 = load i64, ptr %t3431
  %t3433 = inttoptr i64 %t3432 to ptr
  %t3434 = musttail call fastcc i64 %t3433(i64 %t3429, i64 2, i64 %t3422, i64 %t3428, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3434
}

define fastcc i64 @"scheme.base:code_732"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3439 = icmp eq i64 %argc, 1
  br i1 %t3439, label %argok874, label %arityerr873
arityerr873:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok874:
  %t3440 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t3440
}

define fastcc i64 @"scheme.base:code:hash-table-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3441 = icmp eq i64 %argc, 1
  br i1 %t3441, label %argok876, label %arityerr875
arityerr875:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok876:
  %t3442 = call ptr @rt_alloc_words(i64 1)
  %t3443 = ptrtoint ptr %t3442 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_732" to i64), ptr %t3442
  %t3444 = or i64 %t3443, 4
  %t3445 = load i64, ptr @"scheme.base:hash-table->alist"
  %t3446 = and i64 %t3445, -8
  %t3447 = inttoptr i64 %t3446 to ptr
  %t3448 = load i64, ptr %t3447
  %t3449 = inttoptr i64 %t3448 to ptr
  %t3450 = call fastcc i64%t3449(i64 %t3445, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3451 = load i64, ptr @"scheme.base:map"
  %t3452 = and i64 %t3451, -8
  %t3453 = inttoptr i64 %t3452 to ptr
  %t3454 = load i64, ptr %t3453
  %t3455 = inttoptr i64 %t3454 to ptr
  %t3456 = musttail call fastcc i64 %t3455(i64 %t3451, i64 2, i64 %t3444, i64 %t3450, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3456
}

define fastcc i64 @"scheme.base:code:read-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3461 = icmp eq i64 %argc, 1
  br i1 %t3461, label %argok878, label %arityerr877
arityerr877:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok878:
  %t3462 = call i64 @rt_string_length(i64 %a0)
  %t3463 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t3464 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t3463, i64 3, i64 %a0, i64 %t3462, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3465 = load i64, ptr @"emit.internal:rd-datum"
  %t3466 = call fastcc i64 @"emit.internal:code:rd-datum"(i64 %t3465, i64 3, i64 %a0, i64 %t3462, i64 %t3464, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3467 = call i64 @rt_car(i64 %t3466)
  ret i64 %t3467
}

define fastcc i64 @"scheme.base:code_748"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3472 = icmp eq i64 %argc, 2
  br i1 %t3472, label %argok880, label %arityerr879
arityerr879:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok880:
  %t3473 = and i64 %self, -8
  %t3474 = inttoptr i64 %t3473 to ptr
  %t3475 = getelementptr i64, ptr %t3474, i64 1
  %t3476 = load i64, ptr %t3475
  %t3477 = or i64 %a0, %t3476
  %t3478 = and i64 %t3477, 7
  %t3479 = icmp eq i64 %t3478, 0
  br i1 %t3479, label %fixfast881, label %fixslow882
fixfast881:
  %t3480 = icmp slt i64 %a0, %t3476
  %t3481 = select i1 %t3480, i64 257, i64 1
  br label %fixmerge883
fixslow882:
  %t3482 = call i64 @rt_lt(i64 %a0, i64 %t3476)
  br label %fixmerge883
fixmerge883:
  %t3483 = phi i64 [ %t3481, %fixfast881 ], [ %t3482, %fixslow882 ]
  %t3484 = icmp ne i64 %t3483, 1
  br i1 %t3484, label %then884, label %else885
then884:
  %t3485 = and i64 %self, -8
  %t3486 = inttoptr i64 %t3485 to ptr
  %t3487 = getelementptr i64, ptr %t3486, i64 2
  %t3488 = load i64, ptr %t3487
  %t3489 = and i64 %self, -8
  %t3490 = inttoptr i64 %t3489 to ptr
  %t3491 = getelementptr i64, ptr %t3490, i64 1
  %t3492 = load i64, ptr %t3491
  %t3493 = load i64, ptr @"emit.internal:rd-datum"
  %t3494 = call fastcc i64 @"emit.internal:code:rd-datum"(i64 %t3493, i64 3, i64 %t3488, i64 %t3492, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3495 = and i64 %self, -8
  %t3496 = inttoptr i64 %t3495 to ptr
  %t3497 = getelementptr i64, ptr %t3496, i64 2
  %t3498 = load i64, ptr %t3497
  %t3499 = and i64 %self, -8
  %t3500 = inttoptr i64 %t3499 to ptr
  %t3501 = getelementptr i64, ptr %t3500, i64 1
  %t3502 = load i64, ptr %t3501
  %t3503 = call i64 @rt_cdr(i64 %t3494)
  %t3504 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t3505 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t3504, i64 3, i64 %t3498, i64 %t3502, i64 %t3503, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3506 = call i64 @rt_car(i64 %t3494)
  %t3507 = call i64 @rt_cons(i64 %t3506, i64 %a1)
  %t3508 = musttail call fastcc i64 @"scheme.base:code_748"(i64 %self, i64 2, i64 %t3505, i64 %t3507, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3508
else885:
  %t3509 = load i64, ptr @"scheme.base:reverse"
  %t3510 = and i64 %t3509, -8
  %t3511 = inttoptr i64 %t3510 to ptr
  %t3512 = load i64, ptr %t3511
  %t3513 = inttoptr i64 %t3512 to ptr
  %t3514 = musttail call fastcc i64 %t3513(i64 %t3509, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3514
}

define fastcc i64 @"scheme.base:code:read-all-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3515 = icmp eq i64 %argc, 1
  br i1 %t3515, label %argok887, label %arityerr886
arityerr886:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok887:
  %t3516 = call i64 @rt_string_length(i64 %a0)
  %t3517 = call ptr @rt_alloc_words(i64 4)
  %t3518 = ptrtoint ptr %t3517 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_748" to i64), ptr %t3517
  %t3519 = or i64 %t3518, 4
  %t3520 = getelementptr i64, ptr %t3517, i64 1
  store i64 %t3516, ptr %t3520
  %t3521 = getelementptr i64, ptr %t3517, i64 2
  store i64 %a0, ptr %t3521
  %t3522 = getelementptr i64, ptr %t3517, i64 3
  store i64 %t3519, ptr %t3522
  %t3523 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t3524 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t3523, i64 3, i64 %a0, i64 %t3516, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3525 = musttail call fastcc i64 @"scheme.base:code_748"(i64 %t3519, i64 2, i64 %t3524, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3525
}

define fastcc i64 @"scheme.base:code:port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3530 = icmp eq i64 %argc, 1
  br i1 %t3530, label %argok889, label %arityerr888
arityerr888:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok889:
  %t3531 = load i64, ptr @"emit.internal:%port-rtd"
  %t3532 = call fastcc i64 @"emit.internal:code:%port-rtd"(i64 %t3531, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3533 = call i64 @rt_record_of_type_p(i64 %a0, i64 %t3532)
  ret i64 %t3533
}

define fastcc i64 @"scheme.base:code:input-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3538 = icmp eq i64 %argc, 1
  br i1 %t3538, label %argok891, label %arityerr890
arityerr890:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok891:
  %t3539 = load i64, ptr @"scheme.base:port?"
  %t3540 = and i64 %t3539, -8
  %t3541 = inttoptr i64 %t3540 to ptr
  %t3542 = load i64, ptr %t3541
  %t3543 = inttoptr i64 %t3542 to ptr
  %t3544 = call fastcc i64%t3543(i64 %t3539, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3545 = icmp ne i64 %t3544, 1
  br i1 %t3545, label %then892, label %else893
then892:
  %t3546 = call i64 @rt_record_ref(i64 %a0, i64 8)
  ret i64 %t3546
else893:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3551 = icmp eq i64 %argc, 1
  br i1 %t3551, label %argok895, label %arityerr894
arityerr894:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok895:
  %t3552 = load i64, ptr @"scheme.base:port?"
  %t3553 = and i64 %t3552, -8
  %t3554 = inttoptr i64 %t3553 to ptr
  %t3555 = load i64, ptr %t3554
  %t3556 = inttoptr i64 %t3555 to ptr
  %t3557 = call fastcc i64%t3556(i64 %t3552, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3558 = icmp ne i64 %t3557, 1
  br i1 %t3558, label %then896, label %else897
then896:
  %t3559 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t3560 = call i64 @rt_not(i64 %t3559)
  ret i64 %t3560
else897:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:textual-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3565 = icmp eq i64 %argc, 1
  br i1 %t3565, label %argok899, label %arityerr898
arityerr898:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok899:
  %t3566 = load i64, ptr @"scheme.base:port?"
  %t3567 = and i64 %t3566, -8
  %t3568 = inttoptr i64 %t3567 to ptr
  %t3569 = load i64, ptr %t3568
  %t3570 = inttoptr i64 %t3569 to ptr
  %t3571 = musttail call fastcc i64 %t3570(i64 %t3566, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3571
}

define fastcc i64 @"scheme.base:code:port-closed?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3576 = icmp eq i64 %argc, 1
  br i1 %t3576, label %argok901, label %arityerr900
arityerr900:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok901:
  %t3577 = call i64 @rt_record_ref(i64 %a0, i64 40)
  ret i64 %t3577
}

define fastcc i64 @"scheme.base:code:input-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3582 = icmp eq i64 %argc, 1
  br i1 %t3582, label %argok903, label %arityerr902
arityerr902:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok903:
  %t3583 = load i64, ptr @"scheme.base:input-port?"
  %t3584 = and i64 %t3583, -8
  %t3585 = inttoptr i64 %t3584 to ptr
  %t3586 = load i64, ptr %t3585
  %t3587 = inttoptr i64 %t3586 to ptr
  %t3588 = call fastcc i64%t3587(i64 %t3583, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3589 = icmp ne i64 %t3588, 1
  br i1 %t3589, label %then904, label %else905
then904:
  %t3590 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t3591 = call i64 @rt_not(i64 %t3590)
  ret i64 %t3591
else905:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3596 = icmp eq i64 %argc, 1
  br i1 %t3596, label %argok907, label %arityerr906
arityerr906:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok907:
  %t3597 = load i64, ptr @"scheme.base:output-port?"
  %t3598 = and i64 %t3597, -8
  %t3599 = inttoptr i64 %t3598 to ptr
  %t3600 = load i64, ptr %t3599
  %t3601 = inttoptr i64 %t3600 to ptr
  %t3602 = call fastcc i64%t3601(i64 %t3597, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3603 = icmp ne i64 %t3602, 1
  br i1 %t3603, label %then908, label %else909
then908:
  %t3604 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t3605 = call i64 @rt_not(i64 %t3604)
  ret i64 %t3605
else909:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%check-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3610 = icmp eq i64 %argc, 2
  br i1 %t3610, label %argok911, label %arityerr910
arityerr910:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok911:
  %t3611 = load i64, ptr @"scheme.base:input-port?"
  %t3612 = and i64 %t3611, -8
  %t3613 = inttoptr i64 %t3612 to ptr
  %t3614 = load i64, ptr %t3613
  %t3615 = inttoptr i64 %t3614 to ptr
  %t3616 = call fastcc i64%t3615(i64 %t3611, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3617 = call i64 @rt_not(i64 %t3616)
  %t3618 = icmp ne i64 %t3617, 1
  br i1 %t3618, label %then912, label %else913
then912:
  %t3619 = call i64 @rt_make_string(ptr @.str.lit.13, i64 17)
  %t3620 = load i64, ptr @"scheme.base:error"
  %t3621 = and i64 %t3620, -8
  %t3622 = inttoptr i64 %t3621 to ptr
  %t3623 = load i64, ptr %t3622
  %t3624 = inttoptr i64 %t3623 to ptr
  %t3625 = musttail call fastcc i64 %t3624(i64 %t3620, i64 3, i64 %a1, i64 %t3619, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3625
else913:
  %t3626 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t3627 = icmp ne i64 %t3626, 1
  br i1 %t3627, label %then914, label %else915
then914:
  %t3628 = call i64 @rt_make_string(ptr @.str.lit.14, i64 14)
  %t3629 = load i64, ptr @"scheme.base:error"
  %t3630 = and i64 %t3629, -8
  %t3631 = inttoptr i64 %t3630 to ptr
  %t3632 = load i64, ptr %t3631
  %t3633 = inttoptr i64 %t3632 to ptr
  %t3634 = musttail call fastcc i64 %t3633(i64 %t3629, i64 3, i64 %a1, i64 %t3628, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3634
else915:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:%check-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3639 = icmp eq i64 %argc, 2
  br i1 %t3639, label %argok917, label %arityerr916
arityerr916:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok917:
  %t3640 = load i64, ptr @"scheme.base:output-port?"
  %t3641 = and i64 %t3640, -8
  %t3642 = inttoptr i64 %t3641 to ptr
  %t3643 = load i64, ptr %t3642
  %t3644 = inttoptr i64 %t3643 to ptr
  %t3645 = call fastcc i64%t3644(i64 %t3640, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3646 = call i64 @rt_not(i64 %t3645)
  %t3647 = icmp ne i64 %t3646, 1
  br i1 %t3647, label %then918, label %else919
then918:
  %t3648 = call i64 @rt_make_string(ptr @.str.lit.15, i64 18)
  %t3649 = load i64, ptr @"scheme.base:error"
  %t3650 = and i64 %t3649, -8
  %t3651 = inttoptr i64 %t3650 to ptr
  %t3652 = load i64, ptr %t3651
  %t3653 = inttoptr i64 %t3652 to ptr
  %t3654 = musttail call fastcc i64 %t3653(i64 %t3649, i64 3, i64 %a1, i64 %t3648, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3654
else919:
  %t3655 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t3656 = icmp ne i64 %t3655, 1
  br i1 %t3656, label %then920, label %else921
then920:
  %t3657 = call i64 @rt_make_string(ptr @.str.lit.16, i64 14)
  %t3658 = load i64, ptr @"scheme.base:error"
  %t3659 = and i64 %t3658, -8
  %t3660 = inttoptr i64 %t3659 to ptr
  %t3661 = load i64, ptr %t3660
  %t3662 = inttoptr i64 %t3661 to ptr
  %t3663 = musttail call fastcc i64 %t3662(i64 %t3658, i64 3, i64 %a1, i64 %t3657, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3663
else921:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:open-input-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3668 = icmp eq i64 %argc, 1
  br i1 %t3668, label %argok923, label %arityerr922
arityerr922:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok923:
  %t3669 = load i64, ptr @"emit.internal:%make-port"
  %t3670 = musttail call fastcc i64 @"emit.internal:code:%make-port"(i64 %t3669, i64 6, i64 1, i64 257, i64 %a0, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t3670
}

define fastcc i64 @"scheme.base:code:open-input-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3675 = icmp eq i64 %argc, 1
  br i1 %t3675, label %argok925, label %arityerr924
arityerr924:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok925:
  %t3676 = call i64 @rt_read_file(i64 %a0)
  %t3677 = icmp ne i64 %t3676, 1
  br i1 %t3677, label %then926, label %else927
then926:
  %t3678 = load i64, ptr @"emit.internal:%make-port"
  %t3679 = musttail call fastcc i64 @"emit.internal:code:%make-port"(i64 %t3678, i64 6, i64 1, i64 257, i64 %t3676, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t3679
else927:
  %t3680 = call i64 @rt_intern(ptr @.str.sym.17)
  %t3681 = call i64 @rt_make_string(ptr @.str.lit.18, i64 26)
  %t3682 = load i64, ptr @"scheme.base:error"
  %t3683 = and i64 %t3682, -8
  %t3684 = inttoptr i64 %t3683 to ptr
  %t3685 = load i64, ptr %t3684
  %t3686 = inttoptr i64 %t3685 to ptr
  %t3687 = musttail call fastcc i64 %t3686(i64 %t3682, i64 3, i64 %t3680, i64 %t3681, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3687
}

define fastcc i64 @"scheme.base:code:%port-at-eof?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3692 = icmp eq i64 %argc, 1
  br i1 %t3692, label %argok929, label %arityerr928
arityerr928:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok929:
  %t3693 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t3694 = load i64, ptr @"emit.internal:%port-buf"
  %t3695 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t3694, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3696 = call i64 @rt_string_length(i64 %t3695)
  %t3697 = or i64 %t3696, %t3693
  %t3698 = and i64 %t3697, 7
  %t3699 = icmp eq i64 %t3698, 0
  br i1 %t3699, label %fixfast930, label %fixslow931
fixfast930:
  %t3700 = icmp slt i64 %t3696, %t3693
  %t3701 = select i1 %t3700, i64 257, i64 1
  br label %fixmerge932
fixslow931:
  %t3702 = call i64 @rt_lt(i64 %t3696, i64 %t3693)
  br label %fixmerge932
fixmerge932:
  %t3703 = phi i64 [ %t3701, %fixfast930 ], [ %t3702, %fixslow931 ]
  %t3704 = icmp ne i64 %t3703, 1
  br i1 %t3704, label %then933, label %else934
then933:
  ret i64 257
else934:
  %t3705 = or i64 %t3693, %t3696
  %t3706 = and i64 %t3705, 7
  %t3707 = icmp eq i64 %t3706, 0
  br i1 %t3707, label %fixfast935, label %fixslow936
fixfast935:
  %t3708 = icmp eq i64 %t3693, %t3696
  %t3709 = select i1 %t3708, i64 257, i64 1
  br label %fixmerge937
fixslow936:
  %t3710 = call i64 @rt_num_eq(i64 %t3693, i64 %t3696)
  br label %fixmerge937
fixmerge937:
  %t3711 = phi i64 [ %t3709, %fixfast935 ], [ %t3710, %fixslow936 ]
  ret i64 %t3711
}

define fastcc i64 @"scheme.base:code:read-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3716 = icmp eq i64 %argc, 1
  br i1 %t3716, label %argok939, label %arityerr938
arityerr938:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok939:
  %t3717 = call i64 @rt_intern(ptr @.str.sym.19)
  %t3718 = load i64, ptr @"scheme.base:%check-input-port"
  %t3719 = and i64 %t3718, -8
  %t3720 = inttoptr i64 %t3719 to ptr
  %t3721 = load i64, ptr %t3720
  %t3722 = inttoptr i64 %t3721 to ptr
  %t3723 = call fastcc i64%t3722(i64 %t3718, i64 2, i64 %a0, i64 %t3717, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3724 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t3725 = and i64 %t3724, -8
  %t3726 = inttoptr i64 %t3725 to ptr
  %t3727 = load i64, ptr %t3726
  %t3728 = inttoptr i64 %t3727 to ptr
  %t3729 = call fastcc i64%t3728(i64 %t3724, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3730 = icmp ne i64 %t3729, 1
  br i1 %t3730, label %then940, label %else941
then940:
  %t3731 = call i64 @rt_eof_object()
  ret i64 %t3731
else941:
  %t3732 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t3733 = or i64 %t3732, 8
  %t3734 = and i64 %t3733, 7
  %t3735 = icmp eq i64 %t3734, 0
  br i1 %t3735, label %fixfast942, label %fixslow943
fixfast942:
  %t3736 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3732, i64 8)
  %t3737 = extractvalue {i64, i1} %t3736, 0
  %t3738 = extractvalue {i64, i1} %t3736, 1
  br i1 %t3738, label %fixslow943, label %fixmerge944
fixslow943:
  %t3739 = call i64 @rt_add(i64 %t3732, i64 8)
  br label %fixmerge944
fixmerge944:
  %t3740 = phi i64 [ %t3737, %fixfast942 ], [ %t3739, %fixslow943 ]
  %t3741 = call i64 @rt_record_set(i64 %a0, i64 24, i64 %t3740)
  %t3742 = load i64, ptr @"emit.internal:%port-buf"
  %t3743 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t3742, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3744 = call i64 @rt_string_ref(i64 %t3743, i64 %t3732)
  ret i64 %t3744
}

define fastcc i64 @"scheme.base:code:peek-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3749 = icmp eq i64 %argc, 1
  br i1 %t3749, label %argok946, label %arityerr945
arityerr945:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok946:
  %t3750 = call i64 @rt_intern(ptr @.str.sym.20)
  %t3751 = load i64, ptr @"scheme.base:%check-input-port"
  %t3752 = and i64 %t3751, -8
  %t3753 = inttoptr i64 %t3752 to ptr
  %t3754 = load i64, ptr %t3753
  %t3755 = inttoptr i64 %t3754 to ptr
  %t3756 = call fastcc i64%t3755(i64 %t3751, i64 2, i64 %a0, i64 %t3750, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3757 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t3758 = and i64 %t3757, -8
  %t3759 = inttoptr i64 %t3758 to ptr
  %t3760 = load i64, ptr %t3759
  %t3761 = inttoptr i64 %t3760 to ptr
  %t3762 = call fastcc i64%t3761(i64 %t3757, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3763 = icmp ne i64 %t3762, 1
  br i1 %t3763, label %then947, label %else948
then947:
  %t3764 = call i64 @rt_eof_object()
  ret i64 %t3764
else948:
  %t3765 = load i64, ptr @"emit.internal:%port-buf"
  %t3766 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t3765, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3767 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t3768 = call i64 @rt_string_ref(i64 %t3766, i64 %t3767)
  ret i64 %t3768
}

define fastcc i64 @"scheme.base:code_798"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3773 = icmp eq i64 %argc, 1
  br i1 %t3773, label %argok950, label %arityerr949
arityerr949:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok950:
  %t3774 = and i64 %self, -8
  %t3775 = inttoptr i64 %t3774 to ptr
  %t3776 = getelementptr i64, ptr %t3775, i64 1
  %t3777 = load i64, ptr %t3776
  %t3778 = or i64 %t3777, %a0
  %t3779 = and i64 %t3778, 7
  %t3780 = icmp eq i64 %t3779, 0
  br i1 %t3780, label %fixfast951, label %fixslow952
fixfast951:
  %t3781 = icmp slt i64 %t3777, %a0
  %t3782 = select i1 %t3781, i64 257, i64 1
  br label %fixmerge953
fixslow952:
  %t3783 = call i64 @rt_lt(i64 %t3777, i64 %a0)
  br label %fixmerge953
fixmerge953:
  %t3784 = phi i64 [ %t3782, %fixfast951 ], [ %t3783, %fixslow952 ]
  %t3785 = icmp ne i64 %t3784, 1
  br i1 %t3785, label %then954, label %else955
then954:
  br label %merge956
else955:
  %t3786 = or i64 %a0, %t3777
  %t3787 = and i64 %t3786, 7
  %t3788 = icmp eq i64 %t3787, 0
  br i1 %t3788, label %fixfast957, label %fixslow958
fixfast957:
  %t3789 = icmp eq i64 %a0, %t3777
  %t3790 = select i1 %t3789, i64 257, i64 1
  br label %fixmerge959
fixslow958:
  %t3791 = call i64 @rt_num_eq(i64 %a0, i64 %t3777)
  br label %fixmerge959
fixmerge959:
  %t3792 = phi i64 [ %t3790, %fixfast957 ], [ %t3791, %fixslow958 ]
  br label %merge956
merge956:
  %t3793 = phi i64 [ 257, %then954 ], [ %t3792, %fixmerge959 ]
  %t3794 = icmp ne i64 %t3793, 1
  br i1 %t3794, label %then960, label %else961
then960:
  %t3795 = and i64 %self, -8
  %t3796 = inttoptr i64 %t3795 to ptr
  %t3797 = getelementptr i64, ptr %t3796, i64 2
  %t3798 = load i64, ptr %t3797
  %t3799 = call i64 @rt_record_ref(i64 %t3798, i64 24)
  %t3800 = and i64 %self, -8
  %t3801 = inttoptr i64 %t3800 to ptr
  %t3802 = getelementptr i64, ptr %t3801, i64 2
  %t3803 = load i64, ptr %t3802
  %t3804 = and i64 %self, -8
  %t3805 = inttoptr i64 %t3804 to ptr
  %t3806 = getelementptr i64, ptr %t3805, i64 1
  %t3807 = load i64, ptr %t3806
  %t3808 = call i64 @rt_record_set(i64 %t3803, i64 24, i64 %t3807)
  %t3809 = and i64 %self, -8
  %t3810 = inttoptr i64 %t3809 to ptr
  %t3811 = getelementptr i64, ptr %t3810, i64 3
  %t3812 = load i64, ptr %t3811
  %t3813 = and i64 %self, -8
  %t3814 = inttoptr i64 %t3813 to ptr
  %t3815 = getelementptr i64, ptr %t3814, i64 1
  %t3816 = load i64, ptr %t3815
  %t3817 = call i64 @rt_substring(i64 %t3812, i64 %t3799, i64 %t3816)
  ret i64 %t3817
else961:
  %t3818 = and i64 %self, -8
  %t3819 = inttoptr i64 %t3818 to ptr
  %t3820 = getelementptr i64, ptr %t3819, i64 3
  %t3821 = load i64, ptr %t3820
  %t3822 = call i64 @rt_string_ref(i64 %t3821, i64 %a0)
  %t3823 = load i64, ptr @"scheme.base:char=?"
  %t3824 = and i64 %t3823, -8
  %t3825 = inttoptr i64 %t3824 to ptr
  %t3826 = load i64, ptr %t3825
  %t3827 = inttoptr i64 %t3826 to ptr
  %t3828 = call fastcc i64%t3827(i64 %t3823, i64 2, i64 %t3822, i64 2569, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3829 = icmp ne i64 %t3828, 1
  br i1 %t3829, label %then962, label %else963
then962:
  %t3830 = and i64 %self, -8
  %t3831 = inttoptr i64 %t3830 to ptr
  %t3832 = getelementptr i64, ptr %t3831, i64 2
  %t3833 = load i64, ptr %t3832
  %t3834 = call i64 @rt_record_ref(i64 %t3833, i64 24)
  %t3835 = and i64 %self, -8
  %t3836 = inttoptr i64 %t3835 to ptr
  %t3837 = getelementptr i64, ptr %t3836, i64 2
  %t3838 = load i64, ptr %t3837
  %t3839 = or i64 %a0, 8
  %t3840 = and i64 %t3839, 7
  %t3841 = icmp eq i64 %t3840, 0
  br i1 %t3841, label %fixfast964, label %fixslow965
fixfast964:
  %t3842 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3843 = extractvalue {i64, i1} %t3842, 0
  %t3844 = extractvalue {i64, i1} %t3842, 1
  br i1 %t3844, label %fixslow965, label %fixmerge966
fixslow965:
  %t3845 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge966
fixmerge966:
  %t3846 = phi i64 [ %t3843, %fixfast964 ], [ %t3845, %fixslow965 ]
  %t3847 = call i64 @rt_record_set(i64 %t3838, i64 24, i64 %t3846)
  %t3848 = and i64 %self, -8
  %t3849 = inttoptr i64 %t3848 to ptr
  %t3850 = getelementptr i64, ptr %t3849, i64 3
  %t3851 = load i64, ptr %t3850
  %t3852 = call i64 @rt_substring(i64 %t3851, i64 %t3834, i64 %a0)
  ret i64 %t3852
else963:
  %t3853 = or i64 %a0, 8
  %t3854 = and i64 %t3853, 7
  %t3855 = icmp eq i64 %t3854, 0
  br i1 %t3855, label %fixfast967, label %fixslow968
fixfast967:
  %t3856 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3857 = extractvalue {i64, i1} %t3856, 0
  %t3858 = extractvalue {i64, i1} %t3856, 1
  br i1 %t3858, label %fixslow968, label %fixmerge969
fixslow968:
  %t3859 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge969
fixmerge969:
  %t3860 = phi i64 [ %t3857, %fixfast967 ], [ %t3859, %fixslow968 ]
  %t3861 = musttail call fastcc i64 @"scheme.base:code_798"(i64 %self, i64 1, i64 %t3860, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3861
}

define fastcc i64 @"scheme.base:code:read-line"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3862 = icmp eq i64 %argc, 1
  br i1 %t3862, label %argok971, label %arityerr970
arityerr970:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok971:
  %t3863 = call i64 @rt_intern(ptr @.str.sym.21)
  %t3864 = load i64, ptr @"scheme.base:%check-input-port"
  %t3865 = and i64 %t3864, -8
  %t3866 = inttoptr i64 %t3865 to ptr
  %t3867 = load i64, ptr %t3866
  %t3868 = inttoptr i64 %t3867 to ptr
  %t3869 = call fastcc i64%t3868(i64 %t3864, i64 2, i64 %a0, i64 %t3863, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3870 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t3871 = and i64 %t3870, -8
  %t3872 = inttoptr i64 %t3871 to ptr
  %t3873 = load i64, ptr %t3872
  %t3874 = inttoptr i64 %t3873 to ptr
  %t3875 = call fastcc i64%t3874(i64 %t3870, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3876 = icmp ne i64 %t3875, 1
  br i1 %t3876, label %then972, label %else973
then972:
  %t3877 = call i64 @rt_eof_object()
  ret i64 %t3877
else973:
  %t3878 = load i64, ptr @"emit.internal:%port-buf"
  %t3879 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t3878, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3880 = call i64 @rt_string_length(i64 %t3879)
  %t3881 = call ptr @rt_alloc_words(i64 5)
  %t3882 = ptrtoint ptr %t3881 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_798" to i64), ptr %t3881
  %t3883 = or i64 %t3882, 4
  %t3884 = getelementptr i64, ptr %t3881, i64 1
  store i64 %t3880, ptr %t3884
  %t3885 = getelementptr i64, ptr %t3881, i64 2
  store i64 %a0, ptr %t3885
  %t3886 = getelementptr i64, ptr %t3881, i64 3
  store i64 %t3879, ptr %t3886
  %t3887 = getelementptr i64, ptr %t3881, i64 4
  store i64 %t3883, ptr %t3887
  %t3888 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t3889 = musttail call fastcc i64 @"scheme.base:code_798"(i64 %t3883, i64 1, i64 %t3888, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3889
}

define fastcc i64 @"scheme.base:code:read-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3894 = icmp eq i64 %argc, 2
  br i1 %t3894, label %argok975, label %arityerr974
arityerr974:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok975:
  %t3895 = call i64 @rt_intern(ptr @.str.sym.22)
  %t3896 = load i64, ptr @"scheme.base:%check-input-port"
  %t3897 = and i64 %t3896, -8
  %t3898 = inttoptr i64 %t3897 to ptr
  %t3899 = load i64, ptr %t3898
  %t3900 = inttoptr i64 %t3899 to ptr
  %t3901 = call fastcc i64%t3900(i64 %t3896, i64 2, i64 %a1, i64 %t3895, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3902 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t3903 = and i64 %t3902, -8
  %t3904 = inttoptr i64 %t3903 to ptr
  %t3905 = load i64, ptr %t3904
  %t3906 = inttoptr i64 %t3905 to ptr
  %t3907 = call fastcc i64%t3906(i64 %t3902, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3908 = icmp ne i64 %t3907, 1
  br i1 %t3908, label %then976, label %else977
then976:
  %t3909 = call i64 @rt_eof_object()
  ret i64 %t3909
else977:
  %t3910 = load i64, ptr @"emit.internal:%port-buf"
  %t3911 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t3910, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3912 = call i64 @rt_string_length(i64 %t3911)
  %t3913 = call i64 @rt_record_ref(i64 %a1, i64 24)
  %t3914 = or i64 %t3913, %a0
  %t3915 = and i64 %t3914, 7
  %t3916 = icmp eq i64 %t3915, 0
  br i1 %t3916, label %fixfast978, label %fixslow979
fixfast978:
  %t3917 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3913, i64 %a0)
  %t3918 = extractvalue {i64, i1} %t3917, 0
  %t3919 = extractvalue {i64, i1} %t3917, 1
  br i1 %t3919, label %fixslow979, label %fixmerge980
fixslow979:
  %t3920 = call i64 @rt_add(i64 %t3913, i64 %a0)
  br label %fixmerge980
fixmerge980:
  %t3921 = phi i64 [ %t3918, %fixfast978 ], [ %t3920, %fixslow979 ]
  %t3922 = or i64 %t3912, %t3921
  %t3923 = and i64 %t3922, 7
  %t3924 = icmp eq i64 %t3923, 0
  br i1 %t3924, label %fixfast981, label %fixslow982
fixfast981:
  %t3925 = icmp slt i64 %t3912, %t3921
  %t3926 = select i1 %t3925, i64 257, i64 1
  br label %fixmerge983
fixslow982:
  %t3927 = call i64 @rt_lt(i64 %t3912, i64 %t3921)
  br label %fixmerge983
fixmerge983:
  %t3928 = phi i64 [ %t3926, %fixfast981 ], [ %t3927, %fixslow982 ]
  %t3929 = icmp ne i64 %t3928, 1
  br i1 %t3929, label %then984, label %else985
then984:
  br label %merge986
else985:
  %t3930 = or i64 %t3913, %a0
  %t3931 = and i64 %t3930, 7
  %t3932 = icmp eq i64 %t3931, 0
  br i1 %t3932, label %fixfast987, label %fixslow988
fixfast987:
  %t3933 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3913, i64 %a0)
  %t3934 = extractvalue {i64, i1} %t3933, 0
  %t3935 = extractvalue {i64, i1} %t3933, 1
  br i1 %t3935, label %fixslow988, label %fixmerge989
fixslow988:
  %t3936 = call i64 @rt_add(i64 %t3913, i64 %a0)
  br label %fixmerge989
fixmerge989:
  %t3937 = phi i64 [ %t3934, %fixfast987 ], [ %t3936, %fixslow988 ]
  br label %merge986
merge986:
  %t3938 = phi i64 [ %t3912, %then984 ], [ %t3937, %fixmerge989 ]
  %t3939 = call i64 @rt_record_set(i64 %a1, i64 24, i64 %t3938)
  %t3940 = call i64 @rt_substring(i64 %t3911, i64 %t3913, i64 %t3938)
  ret i64 %t3940
}

define fastcc i64 @"scheme.base:code:read"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3945 = icmp eq i64 %argc, 1
  br i1 %t3945, label %argok991, label %arityerr990
arityerr990:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok991:
  %t3946 = call i64 @rt_intern(ptr @.str.sym.23)
  %t3947 = load i64, ptr @"scheme.base:%check-input-port"
  %t3948 = and i64 %t3947, -8
  %t3949 = inttoptr i64 %t3948 to ptr
  %t3950 = load i64, ptr %t3949
  %t3951 = inttoptr i64 %t3950 to ptr
  %t3952 = call fastcc i64%t3951(i64 %t3947, i64 2, i64 %a0, i64 %t3946, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3953 = load i64, ptr @"emit.internal:%port-buf"
  %t3954 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t3953, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3955 = call i64 @rt_string_length(i64 %t3954)
  %t3956 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t3957 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t3958 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t3957, i64 3, i64 %t3954, i64 %t3955, i64 %t3956, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3959 = or i64 %t3955, %t3958
  %t3960 = and i64 %t3959, 7
  %t3961 = icmp eq i64 %t3960, 0
  br i1 %t3961, label %fixfast992, label %fixslow993
fixfast992:
  %t3962 = icmp slt i64 %t3955, %t3958
  %t3963 = select i1 %t3962, i64 257, i64 1
  br label %fixmerge994
fixslow993:
  %t3964 = call i64 @rt_lt(i64 %t3955, i64 %t3958)
  br label %fixmerge994
fixmerge994:
  %t3965 = phi i64 [ %t3963, %fixfast992 ], [ %t3964, %fixslow993 ]
  %t3966 = icmp ne i64 %t3965, 1
  br i1 %t3966, label %then995, label %else996
then995:
  br label %merge997
else996:
  %t3967 = or i64 %t3958, %t3955
  %t3968 = and i64 %t3967, 7
  %t3969 = icmp eq i64 %t3968, 0
  br i1 %t3969, label %fixfast998, label %fixslow999
fixfast998:
  %t3970 = icmp eq i64 %t3958, %t3955
  %t3971 = select i1 %t3970, i64 257, i64 1
  br label %fixmerge1000
fixslow999:
  %t3972 = call i64 @rt_num_eq(i64 %t3958, i64 %t3955)
  br label %fixmerge1000
fixmerge1000:
  %t3973 = phi i64 [ %t3971, %fixfast998 ], [ %t3972, %fixslow999 ]
  br label %merge997
merge997:
  %t3974 = phi i64 [ 257, %then995 ], [ %t3973, %fixmerge1000 ]
  %t3975 = icmp ne i64 %t3974, 1
  br i1 %t3975, label %then1001, label %else1002
then1001:
  %t3976 = call i64 @rt_record_set(i64 %a0, i64 24, i64 %t3955)
  %t3977 = call i64 @rt_eof_object()
  ret i64 %t3977
else1002:
  %t3978 = load i64, ptr @"emit.internal:rd-datum"
  %t3979 = call fastcc i64 @"emit.internal:code:rd-datum"(i64 %t3978, i64 3, i64 %t3954, i64 %t3955, i64 %t3958, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3980 = call i64 @rt_cdr(i64 %t3979)
  %t3981 = call i64 @rt_record_set(i64 %a0, i64 24, i64 %t3980)
  %t3982 = call i64 @rt_car(i64 %t3979)
  ret i64 %t3982
}

define fastcc i64 @"scheme.base:code:open-output-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3987 = icmp eq i64 %argc, 1
  br i1 %t3987, label %argok1004, label %arityerr1003
arityerr1003:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1004:
  %t3988 = call i64 @rt_port_open_output_file(i64 %a0)
  %t3989 = icmp ne i64 %t3988, 1
  br i1 %t3989, label %then1005, label %else1006
then1005:
  %t3990 = load i64, ptr @"emit.internal:%make-port"
  %t3991 = musttail call fastcc i64 @"emit.internal:code:%make-port"(i64 %t3990, i64 6, i64 %t3988, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t3991
else1006:
  %t3992 = call i64 @rt_intern(ptr @.str.sym.24)
  %t3993 = call i64 @rt_make_string(ptr @.str.lit.25, i64 27)
  %t3994 = load i64, ptr @"scheme.base:error"
  %t3995 = and i64 %t3994, -8
  %t3996 = inttoptr i64 %t3995 to ptr
  %t3997 = load i64, ptr %t3996
  %t3998 = inttoptr i64 %t3997 to ptr
  %t3999 = musttail call fastcc i64 %t3998(i64 %t3994, i64 3, i64 %t3992, i64 %t3993, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3999
}

define fastcc i64 @"scheme.base:code:open-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4004 = icmp eq i64 %argc, 0
  br i1 %t4004, label %argok1008, label %arityerr1007
arityerr1007:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1008:
  %t4005 = call i64 @rt_port_open_output_string()
  %t4006 = icmp ne i64 %t4005, 1
  br i1 %t4006, label %then1009, label %else1010
then1009:
  %t4007 = load i64, ptr @"emit.internal:%make-port"
  %t4008 = musttail call fastcc i64 @"emit.internal:code:%make-port"(i64 %t4007, i64 6, i64 %t4005, i64 1, i64 1, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t4008
else1010:
  %t4009 = call i64 @rt_intern(ptr @.str.sym.26)
  %t4010 = call i64 @rt_make_string(ptr @.str.lit.27, i64 33)
  %t4011 = load i64, ptr @"scheme.base:error"
  %t4012 = and i64 %t4011, -8
  %t4013 = inttoptr i64 %t4012 to ptr
  %t4014 = load i64, ptr %t4013
  %t4015 = inttoptr i64 %t4014 to ptr
  %t4016 = musttail call fastcc i64 %t4015(i64 %t4011, i64 2, i64 %t4009, i64 %t4010, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4016
}

define fastcc i64 @"scheme.base:code:get-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4021 = icmp eq i64 %argc, 1
  br i1 %t4021, label %argok1012, label %arityerr1011
arityerr1011:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1012:
  %t4022 = load i64, ptr @"scheme.base:output-port?"
  %t4023 = and i64 %t4022, -8
  %t4024 = inttoptr i64 %t4023 to ptr
  %t4025 = load i64, ptr %t4024
  %t4026 = inttoptr i64 %t4025 to ptr
  %t4027 = call fastcc i64%t4026(i64 %t4022, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4028 = call i64 @rt_not(i64 %t4027)
  %t4029 = icmp ne i64 %t4028, 1
  br i1 %t4029, label %then1013, label %else1014
then1013:
  %t4030 = call i64 @rt_intern(ptr @.str.sym.28)
  %t4031 = call i64 @rt_make_string(ptr @.str.lit.29, i64 18)
  %t4032 = load i64, ptr @"scheme.base:error"
  %t4033 = and i64 %t4032, -8
  %t4034 = inttoptr i64 %t4033 to ptr
  %t4035 = load i64, ptr %t4034
  %t4036 = inttoptr i64 %t4035 to ptr
  %t4037 = musttail call fastcc i64 %t4036(i64 %t4032, i64 3, i64 %t4030, i64 %t4031, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4037
else1014:
  %t4038 = call i64 @rt_record_ref(i64 %a0, i64 32)
  %t4039 = call i64 @rt_not(i64 %t4038)
  %t4040 = icmp ne i64 %t4039, 1
  br i1 %t4040, label %then1015, label %else1016
then1015:
  %t4041 = call i64 @rt_intern(ptr @.str.sym.28)
  %t4042 = call i64 @rt_make_string(ptr @.str.lit.30, i64 17)
  %t4043 = load i64, ptr @"scheme.base:error"
  %t4044 = and i64 %t4043, -8
  %t4045 = inttoptr i64 %t4044 to ptr
  %t4046 = load i64, ptr %t4045
  %t4047 = inttoptr i64 %t4046 to ptr
  %t4048 = musttail call fastcc i64 %t4047(i64 %t4043, i64 3, i64 %t4041, i64 %t4042, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4048
else1016:
  %t4049 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t4050 = call i64 @rt_port_get_output_string(i64 %t4049)
  ret i64 %t4050
}

define fastcc i64 @"scheme.base:code:flush-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4055 = icmp eq i64 %argc, 1
  br i1 %t4055, label %argok1018, label %arityerr1017
arityerr1017:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1018:
  %t4056 = call i64 @rt_intern(ptr @.str.sym.31)
  %t4057 = load i64, ptr @"scheme.base:%check-output-port"
  %t4058 = and i64 %t4057, -8
  %t4059 = inttoptr i64 %t4058 to ptr
  %t4060 = load i64, ptr %t4059
  %t4061 = inttoptr i64 %t4060 to ptr
  %t4062 = call fastcc i64%t4061(i64 %t4057, i64 2, i64 %a0, i64 %t4056, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4063 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t4064 = call i64 @rt_port_flush(i64 %t4063)
  ret i64 %t4064
}

define fastcc i64 @"scheme.base:code:close-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4069 = icmp eq i64 %argc, 1
  br i1 %t4069, label %argok1020, label %arityerr1019
arityerr1019:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1020:
  %t4070 = load i64, ptr @"scheme.base:port?"
  %t4071 = and i64 %t4070, -8
  %t4072 = inttoptr i64 %t4071 to ptr
  %t4073 = load i64, ptr %t4072
  %t4074 = inttoptr i64 %t4073 to ptr
  %t4075 = call fastcc i64%t4074(i64 %t4070, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4076 = call i64 @rt_not(i64 %t4075)
  %t4077 = icmp ne i64 %t4076, 1
  br i1 %t4077, label %then1021, label %else1022
then1021:
  %t4078 = call i64 @rt_intern(ptr @.str.sym.32)
  %t4079 = call i64 @rt_make_string(ptr @.str.lit.33, i64 10)
  %t4080 = load i64, ptr @"scheme.base:error"
  %t4081 = and i64 %t4080, -8
  %t4082 = inttoptr i64 %t4081 to ptr
  %t4083 = load i64, ptr %t4082
  %t4084 = inttoptr i64 %t4083 to ptr
  %t4085 = musttail call fastcc i64 %t4084(i64 %t4080, i64 3, i64 %t4078, i64 %t4079, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4085
else1022:
  %t4086 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t4087 = icmp ne i64 %t4086, 1
  br i1 %t4087, label %then1023, label %else1024
then1023:
  %t4088 = icmp ne i64 1, 1
  br i1 %t4088, label %then1025, label %else1026
then1025:
  ret i64 1
else1026:
  ret i64 17
else1024:
  %t4089 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t4090 = call i64 @rt_not(i64 %t4089)
  %t4091 = icmp ne i64 %t4090, 1
  br i1 %t4091, label %then1027, label %else1028
then1027:
  %t4092 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t4093 = call i64 @rt_port_close(i64 %t4092)
  br label %merge1029
else1028:
  br label %merge1029
merge1029:
  %t4094 = phi i64 [ %t4093, %then1027 ], [ 17, %else1028 ]
  %t4095 = call i64 @rt_record_set(i64 %a0, i64 40, i64 257)
  %t4096 = icmp ne i64 1, 1
  br i1 %t4096, label %then1030, label %else1031
then1030:
  ret i64 1
else1031:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:close-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4101 = icmp eq i64 %argc, 1
  br i1 %t4101, label %argok1033, label %arityerr1032
arityerr1032:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1033:
  %t4102 = load i64, ptr @"scheme.base:input-port?"
  %t4103 = and i64 %t4102, -8
  %t4104 = inttoptr i64 %t4103 to ptr
  %t4105 = load i64, ptr %t4104
  %t4106 = inttoptr i64 %t4105 to ptr
  %t4107 = call fastcc i64%t4106(i64 %t4102, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4108 = icmp ne i64 %t4107, 1
  br i1 %t4108, label %then1034, label %else1035
then1034:
  %t4109 = load i64, ptr @"scheme.base:close-port"
  %t4110 = and i64 %t4109, -8
  %t4111 = inttoptr i64 %t4110 to ptr
  %t4112 = load i64, ptr %t4111
  %t4113 = inttoptr i64 %t4112 to ptr
  %t4114 = musttail call fastcc i64 %t4113(i64 %t4109, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4114
else1035:
  %t4115 = call i64 @rt_intern(ptr @.str.sym.34)
  %t4116 = call i64 @rt_make_string(ptr @.str.lit.35, i64 17)
  %t4117 = load i64, ptr @"scheme.base:error"
  %t4118 = and i64 %t4117, -8
  %t4119 = inttoptr i64 %t4118 to ptr
  %t4120 = load i64, ptr %t4119
  %t4121 = inttoptr i64 %t4120 to ptr
  %t4122 = musttail call fastcc i64 %t4121(i64 %t4117, i64 3, i64 %t4115, i64 %t4116, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4122
}

define fastcc i64 @"scheme.base:code:close-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4127 = icmp eq i64 %argc, 1
  br i1 %t4127, label %argok1037, label %arityerr1036
arityerr1036:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1037:
  %t4128 = load i64, ptr @"scheme.base:output-port?"
  %t4129 = and i64 %t4128, -8
  %t4130 = inttoptr i64 %t4129 to ptr
  %t4131 = load i64, ptr %t4130
  %t4132 = inttoptr i64 %t4131 to ptr
  %t4133 = call fastcc i64%t4132(i64 %t4128, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4134 = icmp ne i64 %t4133, 1
  br i1 %t4134, label %then1038, label %else1039
then1038:
  %t4135 = load i64, ptr @"scheme.base:close-port"
  %t4136 = and i64 %t4135, -8
  %t4137 = inttoptr i64 %t4136 to ptr
  %t4138 = load i64, ptr %t4137
  %t4139 = inttoptr i64 %t4138 to ptr
  %t4140 = musttail call fastcc i64 %t4139(i64 %t4135, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4140
else1039:
  %t4141 = call i64 @rt_intern(ptr @.str.sym.36)
  %t4142 = call i64 @rt_make_string(ptr @.str.lit.37, i64 18)
  %t4143 = load i64, ptr @"scheme.base:error"
  %t4144 = and i64 %t4143, -8
  %t4145 = inttoptr i64 %t4144 to ptr
  %t4146 = load i64, ptr %t4145
  %t4147 = inttoptr i64 %t4146 to ptr
  %t4148 = musttail call fastcc i64 %t4147(i64 %t4143, i64 3, i64 %t4141, i64 %t4142, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4148
}

define fastcc i64 @"scheme.base:code:current-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4156 = icmp sge i64 %argc, 0
  br i1 %t4156, label %argok1041, label %arityerr1040
arityerr1040:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1041:
  %t4157 = call ptr @rt_alloc_words(i64 8)
  %t4158 = getelementptr i64, ptr %t4157, i64 0
  store i64 %a0, ptr %t4158
  %t4159 = getelementptr i64, ptr %t4157, i64 1
  store i64 %a1, ptr %t4159
  %t4160 = getelementptr i64, ptr %t4157, i64 2
  store i64 %a2, ptr %t4160
  %t4161 = getelementptr i64, ptr %t4157, i64 3
  store i64 %a3, ptr %t4161
  %t4162 = getelementptr i64, ptr %t4157, i64 4
  store i64 %a4, ptr %t4162
  %t4163 = getelementptr i64, ptr %t4157, i64 5
  store i64 %a5, ptr %t4163
  %t4164 = getelementptr i64, ptr %t4157, i64 6
  store i64 %a6, ptr %t4164
  %t4165 = getelementptr i64, ptr %t4157, i64 7
  store i64 %a7, ptr %t4165
  %t4166 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t4157, ptr %overflow)
  %t4167 = call i64 @rt_null_p(i64 %t4166)
  %t4168 = icmp ne i64 %t4167, 1
  br i1 %t4168, label %then1042, label %else1043
then1042:
  %t4169 = load i64, ptr @"scheme.base:%stdout-port"
  %t4170 = call i64 @rt_not(i64 %t4169)
  %t4171 = icmp ne i64 %t4170, 1
  br i1 %t4171, label %then1044, label %else1045
then1044:
  %t4172 = load i64, ptr @"emit.internal:%make-port"
  %t4173 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t4172, i64 6, i64 0, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t4174 = call i64 @rt_root(i64 %t4173)
  store i64 %t4174, ptr @"scheme.base:%stdout-port"
  %t4175 = call i64 @rt_set_current_output(i64 0)
  br label %merge1046
else1045:
  br label %merge1046
merge1046:
  %t4176 = phi i64 [ %t4175, %then1044 ], [ 17, %else1045 ]
  %t4177 = load i64, ptr @"scheme.base:%stdout-port"
  ret i64 %t4177
else1043:
  %t4178 = call i64 @rt_car(i64 %t4166)
  %t4179 = call i64 @rt_root(i64 %t4178)
  store i64 %t4179, ptr @"scheme.base:%stdout-port"
  %t4180 = call i64 @rt_record_ref(i64 %t4178, i64 0)
  %t4181 = call i64 @rt_set_current_output(i64 %t4180)
  %t4182 = icmp ne i64 1, 1
  br i1 %t4182, label %then1047, label %else1048
then1047:
  ret i64 1
else1048:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-error-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4187 = icmp sge i64 %argc, 0
  br i1 %t4187, label %argok1050, label %arityerr1049
arityerr1049:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1050:
  %t4188 = call ptr @rt_alloc_words(i64 8)
  %t4189 = getelementptr i64, ptr %t4188, i64 0
  store i64 %a0, ptr %t4189
  %t4190 = getelementptr i64, ptr %t4188, i64 1
  store i64 %a1, ptr %t4190
  %t4191 = getelementptr i64, ptr %t4188, i64 2
  store i64 %a2, ptr %t4191
  %t4192 = getelementptr i64, ptr %t4188, i64 3
  store i64 %a3, ptr %t4192
  %t4193 = getelementptr i64, ptr %t4188, i64 4
  store i64 %a4, ptr %t4193
  %t4194 = getelementptr i64, ptr %t4188, i64 5
  store i64 %a5, ptr %t4194
  %t4195 = getelementptr i64, ptr %t4188, i64 6
  store i64 %a6, ptr %t4195
  %t4196 = getelementptr i64, ptr %t4188, i64 7
  store i64 %a7, ptr %t4196
  %t4197 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t4188, ptr %overflow)
  %t4198 = call i64 @rt_null_p(i64 %t4197)
  %t4199 = icmp ne i64 %t4198, 1
  br i1 %t4199, label %then1051, label %else1052
then1051:
  %t4200 = load i64, ptr @"scheme.base:%stderr-port"
  %t4201 = call i64 @rt_not(i64 %t4200)
  %t4202 = icmp ne i64 %t4201, 1
  br i1 %t4202, label %then1053, label %else1054
then1053:
  %t4203 = load i64, ptr @"emit.internal:%make-port"
  %t4204 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t4203, i64 6, i64 8, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t4205 = call i64 @rt_root(i64 %t4204)
  store i64 %t4205, ptr @"scheme.base:%stderr-port"
  br label %merge1055
else1054:
  br label %merge1055
merge1055:
  %t4206 = phi i64 [ 17, %then1053 ], [ 17, %else1054 ]
  %t4207 = load i64, ptr @"scheme.base:%stderr-port"
  ret i64 %t4207
else1052:
  %t4208 = call i64 @rt_car(i64 %t4197)
  %t4209 = call i64 @rt_root(i64 %t4208)
  store i64 %t4209, ptr @"scheme.base:%stderr-port"
  %t4210 = icmp ne i64 1, 1
  br i1 %t4210, label %then1056, label %else1057
then1056:
  ret i64 1
else1057:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4215 = icmp sge i64 %argc, 0
  br i1 %t4215, label %argok1059, label %arityerr1058
arityerr1058:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1059:
  %t4216 = call ptr @rt_alloc_words(i64 8)
  %t4217 = getelementptr i64, ptr %t4216, i64 0
  store i64 %a0, ptr %t4217
  %t4218 = getelementptr i64, ptr %t4216, i64 1
  store i64 %a1, ptr %t4218
  %t4219 = getelementptr i64, ptr %t4216, i64 2
  store i64 %a2, ptr %t4219
  %t4220 = getelementptr i64, ptr %t4216, i64 3
  store i64 %a3, ptr %t4220
  %t4221 = getelementptr i64, ptr %t4216, i64 4
  store i64 %a4, ptr %t4221
  %t4222 = getelementptr i64, ptr %t4216, i64 5
  store i64 %a5, ptr %t4222
  %t4223 = getelementptr i64, ptr %t4216, i64 6
  store i64 %a6, ptr %t4223
  %t4224 = getelementptr i64, ptr %t4216, i64 7
  store i64 %a7, ptr %t4224
  %t4225 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t4216, ptr %overflow)
  %t4226 = call i64 @rt_null_p(i64 %t4225)
  %t4227 = icmp ne i64 %t4226, 1
  br i1 %t4227, label %then1060, label %else1061
then1060:
  %t4228 = load i64, ptr @"scheme.base:%stdin-port"
  %t4229 = call i64 @rt_not(i64 %t4228)
  %t4230 = icmp ne i64 %t4229, 1
  br i1 %t4230, label %then1062, label %else1063
then1062:
  %t4231 = load i64, ptr @"emit.internal:%make-port"
  %t4232 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t4231, i64 6, i64 1, i64 257, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t4233 = call i64 @rt_root(i64 %t4232)
  store i64 %t4233, ptr @"scheme.base:%stdin-port"
  br label %merge1064
else1063:
  br label %merge1064
merge1064:
  %t4234 = phi i64 [ 17, %then1062 ], [ 17, %else1063 ]
  %t4235 = load i64, ptr @"scheme.base:%stdin-port"
  ret i64 %t4235
else1061:
  %t4236 = call i64 @rt_car(i64 %t4225)
  %t4237 = call i64 @rt_root(i64 %t4236)
  store i64 %t4237, ptr @"scheme.base:%stdin-port"
  %t4238 = icmp ne i64 1, 1
  br i1 %t4238, label %then1065, label %else1066
then1065:
  ret i64 1
else1066:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_846"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4243 = icmp eq i64 %argc, 0
  br i1 %t4243, label %argok1068, label %arityerr1067
arityerr1067:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1068:
  %t4244 = icmp ne i64 1, 1
  br i1 %t4244, label %then1069, label %else1070
then1069:
  ret i64 1
else1070:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_848"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4245 = icmp eq i64 %argc, 0
  br i1 %t4245, label %argok1072, label %arityerr1071
arityerr1071:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1072:
  %t4246 = and i64 %self, -8
  %t4247 = inttoptr i64 %t4246 to ptr
  %t4248 = getelementptr i64, ptr %t4247, i64 2
  %t4249 = load i64, ptr %t4248
  %t4250 = and i64 %self, -8
  %t4251 = inttoptr i64 %t4250 to ptr
  %t4252 = getelementptr i64, ptr %t4251, i64 1
  %t4253 = load i64, ptr %t4252
  %t4254 = and i64 %t4253, -8
  %t4255 = inttoptr i64 %t4254 to ptr
  %t4256 = load i64, ptr %t4255
  %t4257 = inttoptr i64 %t4256 to ptr
  %t4258 = musttail call fastcc i64 %t4257(i64 %t4253, i64 1, i64 %t4249, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4258
}

define fastcc i64 @"scheme.base:code_850"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4259 = icmp eq i64 %argc, 0
  br i1 %t4259, label %argok1074, label %arityerr1073
arityerr1073:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1074:
  %t4260 = and i64 %self, -8
  %t4261 = inttoptr i64 %t4260 to ptr
  %t4262 = getelementptr i64, ptr %t4261, i64 1
  %t4263 = load i64, ptr %t4262
  %t4264 = load i64, ptr @"scheme.base:close-port"
  %t4265 = and i64 %t4264, -8
  %t4266 = inttoptr i64 %t4265 to ptr
  %t4267 = load i64, ptr %t4266
  %t4268 = inttoptr i64 %t4267 to ptr
  %t4269 = musttail call fastcc i64 %t4268(i64 %t4264, i64 1, i64 %t4263, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4269
}

define fastcc i64 @"scheme.base:code:call-with-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4270 = icmp eq i64 %argc, 2
  br i1 %t4270, label %argok1076, label %arityerr1075
arityerr1075:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1076:
  %t4271 = call ptr @rt_alloc_words(i64 1)
  %t4272 = ptrtoint ptr %t4271 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_846" to i64), ptr %t4271
  %t4273 = or i64 %t4272, 4
  %t4274 = call ptr @rt_alloc_words(i64 3)
  %t4275 = ptrtoint ptr %t4274 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_848" to i64), ptr %t4274
  %t4276 = getelementptr i64, ptr %t4274, i64 1
  store i64 %a1, ptr %t4276
  %t4277 = getelementptr i64, ptr %t4274, i64 2
  store i64 %a0, ptr %t4277
  %t4278 = or i64 %t4275, 4
  %t4279 = call ptr @rt_alloc_words(i64 2)
  %t4280 = ptrtoint ptr %t4279 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_850" to i64), ptr %t4279
  %t4281 = getelementptr i64, ptr %t4279, i64 1
  store i64 %a0, ptr %t4281
  %t4282 = or i64 %t4280, 4
  %t4283 = load i64, ptr @"scheme.base:dynamic-wind"
  %t4284 = and i64 %t4283, -8
  %t4285 = inttoptr i64 %t4284 to ptr
  %t4286 = load i64, ptr %t4285
  %t4287 = inttoptr i64 %t4286 to ptr
  %t4288 = musttail call fastcc i64 %t4287(i64 %t4283, i64 3, i64 %t4273, i64 %t4278, i64 %t4282, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4288
}

define fastcc i64 @"scheme.base:code_857"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4293 = icmp eq i64 %argc, 0
  br i1 %t4293, label %argok1078, label %arityerr1077
arityerr1077:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1078:
  %t4294 = and i64 %self, -8
  %t4295 = inttoptr i64 %t4294 to ptr
  %t4296 = getelementptr i64, ptr %t4295, i64 1
  %t4297 = load i64, ptr %t4296
  %t4298 = load i64, ptr @"scheme.base:current-output-port"
  %t4299 = and i64 %t4298, -8
  %t4300 = inttoptr i64 %t4299 to ptr
  %t4301 = load i64, ptr %t4300
  %t4302 = inttoptr i64 %t4301 to ptr
  %t4303 = musttail call fastcc i64 %t4302(i64 %t4298, i64 1, i64 %t4297, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4303
}

define fastcc i64 @"scheme.base:code_859"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4304 = icmp eq i64 %argc, 0
  br i1 %t4304, label %argok1080, label %arityerr1079
arityerr1079:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1080:
  %t4305 = and i64 %self, -8
  %t4306 = inttoptr i64 %t4305 to ptr
  %t4307 = getelementptr i64, ptr %t4306, i64 1
  %t4308 = load i64, ptr %t4307
  %t4309 = load i64, ptr @"scheme.base:current-output-port"
  %t4310 = and i64 %t4309, -8
  %t4311 = inttoptr i64 %t4310 to ptr
  %t4312 = load i64, ptr %t4311
  %t4313 = inttoptr i64 %t4312 to ptr
  %t4314 = call fastcc i64%t4313(i64 %t4309, i64 2, i64 %t4308, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4315 = and i64 %self, -8
  %t4316 = inttoptr i64 %t4315 to ptr
  %t4317 = getelementptr i64, ptr %t4316, i64 2
  %t4318 = load i64, ptr %t4317
  %t4319 = load i64, ptr @"scheme.base:close-port"
  %t4320 = and i64 %t4319, -8
  %t4321 = inttoptr i64 %t4320 to ptr
  %t4322 = load i64, ptr %t4321
  %t4323 = inttoptr i64 %t4322 to ptr
  %t4324 = musttail call fastcc i64 %t4323(i64 %t4319, i64 1, i64 %t4318, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4324
}

define fastcc i64 @"scheme.base:code:with-output-to-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4325 = icmp eq i64 %argc, 2
  br i1 %t4325, label %argok1082, label %arityerr1081
arityerr1081:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1082:
  %t4326 = load i64, ptr @"scheme.base:open-output-file"
  %t4327 = and i64 %t4326, -8
  %t4328 = inttoptr i64 %t4327 to ptr
  %t4329 = load i64, ptr %t4328
  %t4330 = inttoptr i64 %t4329 to ptr
  %t4331 = call fastcc i64%t4330(i64 %t4326, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4332 = load i64, ptr @"scheme.base:current-output-port"
  %t4333 = and i64 %t4332, -8
  %t4334 = inttoptr i64 %t4333 to ptr
  %t4335 = load i64, ptr %t4334
  %t4336 = inttoptr i64 %t4335 to ptr
  %t4337 = call fastcc i64%t4336(i64 %t4332, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4338 = call ptr @rt_alloc_words(i64 2)
  %t4339 = ptrtoint ptr %t4338 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_857" to i64), ptr %t4338
  %t4340 = getelementptr i64, ptr %t4338, i64 1
  store i64 %t4331, ptr %t4340
  %t4341 = or i64 %t4339, 4
  %t4342 = call ptr @rt_alloc_words(i64 3)
  %t4343 = ptrtoint ptr %t4342 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_859" to i64), ptr %t4342
  %t4344 = getelementptr i64, ptr %t4342, i64 1
  store i64 %t4337, ptr %t4344
  %t4345 = getelementptr i64, ptr %t4342, i64 2
  store i64 %t4331, ptr %t4345
  %t4346 = or i64 %t4343, 4
  %t4347 = load i64, ptr @"scheme.base:dynamic-wind"
  %t4348 = and i64 %t4347, -8
  %t4349 = inttoptr i64 %t4348 to ptr
  %t4350 = load i64, ptr %t4349
  %t4351 = inttoptr i64 %t4350 to ptr
  %t4352 = musttail call fastcc i64 %t4351(i64 %t4347, i64 3, i64 %t4341, i64 %a1, i64 %t4346, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4352
}

define fastcc i64 @"scheme.base:code_866"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4357 = icmp eq i64 %argc, 0
  br i1 %t4357, label %argok1084, label %arityerr1083
arityerr1083:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1084:
  %t4358 = and i64 %self, -8
  %t4359 = inttoptr i64 %t4358 to ptr
  %t4360 = getelementptr i64, ptr %t4359, i64 1
  %t4361 = load i64, ptr %t4360
  %t4362 = load i64, ptr @"scheme.base:current-input-port"
  %t4363 = and i64 %t4362, -8
  %t4364 = inttoptr i64 %t4363 to ptr
  %t4365 = load i64, ptr %t4364
  %t4366 = inttoptr i64 %t4365 to ptr
  %t4367 = musttail call fastcc i64 %t4366(i64 %t4362, i64 1, i64 %t4361, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4367
}

define fastcc i64 @"scheme.base:code_868"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4368 = icmp eq i64 %argc, 0
  br i1 %t4368, label %argok1086, label %arityerr1085
arityerr1085:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1086:
  %t4369 = and i64 %self, -8
  %t4370 = inttoptr i64 %t4369 to ptr
  %t4371 = getelementptr i64, ptr %t4370, i64 1
  %t4372 = load i64, ptr %t4371
  %t4373 = load i64, ptr @"scheme.base:current-input-port"
  %t4374 = and i64 %t4373, -8
  %t4375 = inttoptr i64 %t4374 to ptr
  %t4376 = load i64, ptr %t4375
  %t4377 = inttoptr i64 %t4376 to ptr
  %t4378 = call fastcc i64%t4377(i64 %t4373, i64 2, i64 %t4372, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4379 = and i64 %self, -8
  %t4380 = inttoptr i64 %t4379 to ptr
  %t4381 = getelementptr i64, ptr %t4380, i64 2
  %t4382 = load i64, ptr %t4381
  %t4383 = load i64, ptr @"scheme.base:close-port"
  %t4384 = and i64 %t4383, -8
  %t4385 = inttoptr i64 %t4384 to ptr
  %t4386 = load i64, ptr %t4385
  %t4387 = inttoptr i64 %t4386 to ptr
  %t4388 = musttail call fastcc i64 %t4387(i64 %t4383, i64 1, i64 %t4382, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4388
}

define fastcc i64 @"scheme.base:code:with-input-from-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4389 = icmp eq i64 %argc, 2
  br i1 %t4389, label %argok1088, label %arityerr1087
arityerr1087:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1088:
  %t4390 = load i64, ptr @"scheme.base:open-input-file"
  %t4391 = and i64 %t4390, -8
  %t4392 = inttoptr i64 %t4391 to ptr
  %t4393 = load i64, ptr %t4392
  %t4394 = inttoptr i64 %t4393 to ptr
  %t4395 = call fastcc i64%t4394(i64 %t4390, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4396 = load i64, ptr @"scheme.base:current-input-port"
  %t4397 = and i64 %t4396, -8
  %t4398 = inttoptr i64 %t4397 to ptr
  %t4399 = load i64, ptr %t4398
  %t4400 = inttoptr i64 %t4399 to ptr
  %t4401 = call fastcc i64%t4400(i64 %t4396, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4402 = call ptr @rt_alloc_words(i64 2)
  %t4403 = ptrtoint ptr %t4402 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_866" to i64), ptr %t4402
  %t4404 = getelementptr i64, ptr %t4402, i64 1
  store i64 %t4395, ptr %t4404
  %t4405 = or i64 %t4403, 4
  %t4406 = call ptr @rt_alloc_words(i64 3)
  %t4407 = ptrtoint ptr %t4406 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_868" to i64), ptr %t4406
  %t4408 = getelementptr i64, ptr %t4406, i64 1
  store i64 %t4401, ptr %t4408
  %t4409 = getelementptr i64, ptr %t4406, i64 2
  store i64 %t4395, ptr %t4409
  %t4410 = or i64 %t4407, 4
  %t4411 = load i64, ptr @"scheme.base:dynamic-wind"
  %t4412 = and i64 %t4411, -8
  %t4413 = inttoptr i64 %t4412 to ptr
  %t4414 = load i64, ptr %t4413
  %t4415 = inttoptr i64 %t4414 to ptr
  %t4416 = musttail call fastcc i64 %t4415(i64 %t4411, i64 3, i64 %t4405, i64 %a1, i64 %t4410, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4416
}

define fastcc i64 @"scheme.base:code:call-with-output-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4421 = icmp eq i64 %argc, 2
  br i1 %t4421, label %argok1090, label %arityerr1089
arityerr1089:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1090:
  %t4422 = load i64, ptr @"scheme.base:open-output-file"
  %t4423 = and i64 %t4422, -8
  %t4424 = inttoptr i64 %t4423 to ptr
  %t4425 = load i64, ptr %t4424
  %t4426 = inttoptr i64 %t4425 to ptr
  %t4427 = call fastcc i64%t4426(i64 %t4422, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4428 = load i64, ptr @"scheme.base:call-with-port"
  %t4429 = and i64 %t4428, -8
  %t4430 = inttoptr i64 %t4429 to ptr
  %t4431 = load i64, ptr %t4430
  %t4432 = inttoptr i64 %t4431 to ptr
  %t4433 = musttail call fastcc i64 %t4432(i64 %t4428, i64 2, i64 %t4427, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4433
}

define fastcc i64 @"scheme.base:code:call-with-input-file"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4438 = icmp eq i64 %argc, 2
  br i1 %t4438, label %argok1092, label %arityerr1091
arityerr1091:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1092:
  %t4439 = load i64, ptr @"scheme.base:open-input-file"
  %t4440 = and i64 %t4439, -8
  %t4441 = inttoptr i64 %t4440 to ptr
  %t4442 = load i64, ptr %t4441
  %t4443 = inttoptr i64 %t4442 to ptr
  %t4444 = call fastcc i64%t4443(i64 %t4439, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4445 = load i64, ptr @"scheme.base:call-with-port"
  %t4446 = and i64 %t4445, -8
  %t4447 = inttoptr i64 %t4446 to ptr
  %t4448 = load i64, ptr %t4447
  %t4449 = inttoptr i64 %t4448 to ptr
  %t4450 = musttail call fastcc i64 %t4449(i64 %t4445, i64 2, i64 %t4444, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4450
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
  %t2292 = call ptr @rt_alloc_words(i64 1)
  %t2293 = ptrtoint ptr %t2292 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string->number" to i64), ptr %t2292
  %t2294 = or i64 %t2293, 4
  %t2295 = call i64 @rt_root(i64 %t2294)
  store i64 %t2295, ptr @"scheme.base:string->number"
  ret i64 17
}

define i64 @"scheme.base:__init_99"() {
entry:
  %t2329 = call ptr @rt_alloc_words(i64 1)
  %t2330 = ptrtoint ptr %t2329 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error" to i64), ptr %t2329
  %t2331 = or i64 %t2330, 4
  %t2332 = call i64 @rt_root(i64 %t2331)
  store i64 %t2332, ptr @"scheme.base:error"
  ret i64 17
}

define i64 @"scheme.base:__init_100"() {
entry:
  %t2333 = call i64 @rt_root(i64 2)
  store i64 %t2333, ptr @"scheme.base:*winds*"
  ret i64 17
}

define i64 @"scheme.base:__init_101"() {
entry:
  %t2334 = call i64 @rt_root(i64 2)
  store i64 %t2334, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define i64 @"scheme.base:__init_102"() {
entry:
  %t2359 = call ptr @rt_alloc_words(i64 1)
  %t2360 = ptrtoint ptr %t2359 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%unwind-to" to i64), ptr %t2359
  %t2361 = or i64 %t2360, 4
  %t2362 = call i64 @rt_root(i64 %t2361)
  store i64 %t2362, ptr @"scheme.base:%unwind-to"
  ret i64 17
}

define i64 @"scheme.base:__init_103"() {
entry:
  %t2386 = call ptr @rt_alloc_words(i64 1)
  %t2387 = ptrtoint ptr %t2386 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:dynamic-wind" to i64), ptr %t2386
  %t2388 = or i64 %t2387, 4
  %t2389 = call i64 @rt_root(i64 %t2388)
  store i64 %t2389, ptr @"scheme.base:dynamic-wind"
  ret i64 17
}

define i64 @"scheme.base:__init_104"() {
entry:
  %t2450 = call ptr @rt_alloc_words(i64 1)
  %t2451 = ptrtoint ptr %t2450 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-current-continuation" to i64), ptr %t2450
  %t2452 = or i64 %t2451, 4
  %t2453 = call i64 @rt_root(i64 %t2452)
  store i64 %t2453, ptr @"scheme.base:call-with-current-continuation"
  ret i64 17
}

define i64 @"scheme.base:__init_105"() {
entry:
  %t2461 = call ptr @rt_alloc_words(i64 1)
  %t2462 = ptrtoint ptr %t2461 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call/cc" to i64), ptr %t2461
  %t2463 = or i64 %t2462, 4
  %t2464 = call i64 @rt_root(i64 %t2463)
  store i64 %t2464, ptr @"scheme.base:call/cc"
  ret i64 17
}

define i64 @"scheme.base:__init_106"() {
entry:
  %t2499 = call ptr @rt_alloc_words(i64 1)
  %t2500 = ptrtoint ptr %t2499 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-exception-handler" to i64), ptr %t2499
  %t2501 = or i64 %t2500, 4
  %t2502 = call i64 @rt_root(i64 %t2501)
  store i64 %t2502, ptr @"scheme.base:with-exception-handler"
  ret i64 17
}

define i64 @"scheme.base:__init_107"() {
entry:
  %t2521 = call ptr @rt_alloc_words(i64 1)
  %t2522 = ptrtoint ptr %t2521 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:raise" to i64), ptr %t2521
  %t2523 = or i64 %t2522, 4
  %t2524 = call i64 @rt_root(i64 %t2523)
  store i64 %t2524, ptr @"scheme.base:raise"
  ret i64 17
}

define i64 @"scheme.base:__init_108"() {
entry:
  %t2527 = call ptr @rt_alloc_words(i64 1)
  %t2528 = ptrtoint ptr %t2527 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object?" to i64), ptr %t2527
  %t2529 = or i64 %t2528, 4
  %t2530 = call i64 @rt_root(i64 %t2529)
  store i64 %t2530, ptr @"scheme.base:error-object?"
  ret i64 17
}

define i64 @"scheme.base:__init_109"() {
entry:
  %t2533 = call ptr @rt_alloc_words(i64 1)
  %t2534 = ptrtoint ptr %t2533 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-message" to i64), ptr %t2533
  %t2535 = or i64 %t2534, 4
  %t2536 = call i64 @rt_root(i64 %t2535)
  store i64 %t2536, ptr @"scheme.base:error-object-message"
  ret i64 17
}

define i64 @"scheme.base:__init_110"() {
entry:
  %t2539 = call ptr @rt_alloc_words(i64 1)
  %t2540 = ptrtoint ptr %t2539 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-irritants" to i64), ptr %t2539
  %t2541 = or i64 %t2540, 4
  %t2542 = call i64 @rt_root(i64 %t2541)
  store i64 %t2542, ptr @"scheme.base:error-object-irritants"
  ret i64 17
}

define i64 @"scheme.base:__init_111"() {
entry:
  %t2624 = call ptr @rt_alloc_words(i64 1)
  %t2625 = ptrtoint ptr %t2624 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-parameter" to i64), ptr %t2624
  %t2626 = or i64 %t2625, 4
  %t2627 = call i64 @rt_root(i64 %t2626)
  store i64 %t2627, ptr @"scheme.base:make-parameter"
  ret i64 17
}

define i64 @"scheme.base:__init_112"() {
entry:
  %t2708 = call ptr @rt_alloc_words(i64 1)
  %t2709 = ptrtoint ptr %t2708 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-parameters" to i64), ptr %t2708
  %t2710 = or i64 %t2709, 4
  %t2711 = call i64 @rt_root(i64 %t2710)
  store i64 %t2711, ptr @"scheme.base:with-parameters"
  ret i64 17
}

define i64 @"scheme.base:__init_113"() {
entry:
  %t2749 = call ptr @rt_alloc_words(i64 1)
  %t2750 = ptrtoint ptr %t2749 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->vector" to i64), ptr %t2749
  %t2751 = or i64 %t2750, 4
  %t2752 = call i64 @rt_root(i64 %t2751)
  store i64 %t2752, ptr @"scheme.base:list->vector"
  ret i64 17
}

define i64 @"scheme.base:__init_114"() {
entry:
  %t2770 = call ptr @rt_alloc_words(i64 1)
  %t2771 = ptrtoint ptr %t2770 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector" to i64), ptr %t2770
  %t2772 = or i64 %t2771, 4
  %t2773 = call i64 @rt_root(i64 %t2772)
  store i64 %t2773, ptr @"scheme.base:vector"
  ret i64 17
}

define i64 @"scheme.base:__init_115"() {
entry:
  %t2811 = call ptr @rt_alloc_words(i64 1)
  %t2812 = ptrtoint ptr %t2811 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->bytevector" to i64), ptr %t2811
  %t2813 = or i64 %t2812, 4
  %t2814 = call i64 @rt_root(i64 %t2813)
  store i64 %t2814, ptr @"scheme.base:list->bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_116"() {
entry:
  %t2832 = call ptr @rt_alloc_words(i64 1)
  %t2833 = ptrtoint ptr %t2832 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector" to i64), ptr %t2832
  %t2834 = or i64 %t2833, 4
  %t2835 = call i64 @rt_root(i64 %t2834)
  store i64 %t2835, ptr @"scheme.base:bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_117"() {
entry:
  %t2855 = call ptr @rt_alloc_words(i64 1)
  %t2856 = ptrtoint ptr %t2855 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:values" to i64), ptr %t2855
  %t2857 = or i64 %t2856, 4
  %t2858 = call i64 @rt_root(i64 %t2857)
  store i64 %t2858, ptr @"scheme.base:values"
  ret i64 17
}

define i64 @"scheme.base:__init_118"() {
entry:
  %t2900 = call ptr @rt_alloc_words(i64 1)
  %t2901 = ptrtoint ptr %t2900 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-values" to i64), ptr %t2900
  %t2902 = or i64 %t2901, 4
  %t2903 = call i64 @rt_root(i64 %t2902)
  store i64 %t2903, ptr @"scheme.base:call-with-values"
  ret i64 17
}

define i64 @"scheme.base:__init_119"() {
entry:
  %t2904 = call i64 @rt_root(i64 64)
  store i64 %t2904, ptr @"scheme.base:%ht-initial-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_120"() {
entry:
  %t2905 = call i64 @rt_root(i64 24)
  store i64 %t2905, ptr @"scheme.base:%ht-load-factor"
  ret i64 17
}

define i64 @"scheme.base:__init_121"() {
entry:
  %t2916 = call ptr @rt_alloc_words(i64 1)
  %t2917 = ptrtoint ptr %t2916 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-hash-table" to i64), ptr %t2916
  %t2918 = or i64 %t2917, 4
  %t2919 = call i64 @rt_root(i64 %t2918)
  store i64 %t2919, ptr @"scheme.base:make-hash-table"
  ret i64 17
}

define i64 @"scheme.base:__init_122"() {
entry:
  %t2922 = call ptr @rt_alloc_words(i64 1)
  %t2923 = ptrtoint ptr %t2922 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table?" to i64), ptr %t2922
  %t2924 = or i64 %t2923, 4
  %t2925 = call i64 @rt_root(i64 %t2924)
  store i64 %t2925, ptr @"scheme.base:hash-table?"
  ret i64 17
}

define i64 @"scheme.base:__init_123"() {
entry:
  %t2929 = call ptr @rt_alloc_words(i64 1)
  %t2930 = ptrtoint ptr %t2929 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-count" to i64), ptr %t2929
  %t2931 = or i64 %t2930, 4
  %t2932 = call i64 @rt_root(i64 %t2931)
  store i64 %t2932, ptr @"scheme.base:%ht-count"
  ret i64 17
}

define i64 @"scheme.base:__init_124"() {
entry:
  %t2936 = call ptr @rt_alloc_words(i64 1)
  %t2937 = ptrtoint ptr %t2936 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-buckets" to i64), ptr %t2936
  %t2938 = or i64 %t2937, 4
  %t2939 = call i64 @rt_root(i64 %t2938)
  store i64 %t2939, ptr @"scheme.base:%ht-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_125"() {
entry:
  %t2943 = call ptr @rt_alloc_words(i64 1)
  %t2944 = ptrtoint ptr %t2943 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-count!" to i64), ptr %t2943
  %t2945 = or i64 %t2944, 4
  %t2946 = call i64 @rt_root(i64 %t2945)
  store i64 %t2946, ptr @"scheme.base:%ht-set-count!"
  ret i64 17
}

define i64 @"scheme.base:__init_126"() {
entry:
  %t2950 = call ptr @rt_alloc_words(i64 1)
  %t2951 = ptrtoint ptr %t2950 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-buckets!" to i64), ptr %t2950
  %t2952 = or i64 %t2951, 4
  %t2953 = call i64 @rt_root(i64 %t2952)
  store i64 %t2953, ptr @"scheme.base:%ht-set-buckets!"
  ret i64 17
}

define i64 @"scheme.base:__init_127"() {
entry:
  %t2957 = call ptr @rt_alloc_words(i64 1)
  %t2958 = ptrtoint ptr %t2957 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-index" to i64), ptr %t2957
  %t2959 = or i64 %t2958, 4
  %t2960 = call i64 @rt_root(i64 %t2959)
  store i64 %t2960, ptr @"scheme.base:%ht-index"
  ret i64 17
}

define i64 @"scheme.base:__init_128"() {
entry:
  %t2976 = call ptr @rt_alloc_words(i64 1)
  %t2977 = ptrtoint ptr %t2976 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-assoc" to i64), ptr %t2976
  %t2978 = or i64 %t2977, 4
  %t2979 = call i64 @rt_root(i64 %t2978)
  store i64 %t2979, ptr @"scheme.base:%ht-assoc"
  ret i64 17
}

define i64 @"scheme.base:__init_129"() {
entry:
  %t2997 = call ptr @rt_alloc_words(i64 1)
  %t2998 = ptrtoint ptr %t2997 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-remove" to i64), ptr %t2997
  %t2999 = or i64 %t2998, 4
  %t3000 = call i64 @rt_root(i64 %t2999)
  store i64 %t3000, ptr @"scheme.base:%ht-remove"
  ret i64 17
}

define i64 @"scheme.base:__init_130"() {
entry:
  %t3024 = call ptr @rt_alloc_words(i64 1)
  %t3025 = ptrtoint ptr %t3024 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref/default" to i64), ptr %t3024
  %t3026 = or i64 %t3025, 4
  %t3027 = call i64 @rt_root(i64 %t3026)
  store i64 %t3027, ptr @"scheme.base:hash-table-ref/default"
  ret i64 17
}

define i64 @"scheme.base:__init_131"() {
entry:
  %t3050 = call ptr @rt_alloc_words(i64 1)
  %t3051 = ptrtoint ptr %t3050 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-contains?" to i64), ptr %t3050
  %t3052 = or i64 %t3051, 4
  %t3053 = call i64 @rt_root(i64 %t3052)
  store i64 %t3053, ptr @"scheme.base:hash-table-contains?"
  ret i64 17
}

define i64 @"scheme.base:__init_132"() {
entry:
  %t3084 = call ptr @rt_alloc_words(i64 1)
  %t3085 = ptrtoint ptr %t3084 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref" to i64), ptr %t3084
  %t3086 = or i64 %t3085, 4
  %t3087 = call i64 @rt_root(i64 %t3086)
  store i64 %t3087, ptr @"scheme.base:hash-table-ref"
  ret i64 17
}

define i64 @"scheme.base:__init_133"() {
entry:
  %t3171 = call ptr @rt_alloc_words(i64 1)
  %t3172 = ptrtoint ptr %t3171 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-set!" to i64), ptr %t3171
  %t3173 = or i64 %t3172, 4
  %t3174 = call i64 @rt_root(i64 %t3173)
  store i64 %t3174, ptr @"scheme.base:hash-table-set!"
  ret i64 17
}

define i64 @"scheme.base:__init_134"() {
entry:
  %t3224 = call ptr @rt_alloc_words(i64 1)
  %t3225 = ptrtoint ptr %t3224 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-delete!" to i64), ptr %t3224
  %t3226 = or i64 %t3225, 4
  %t3227 = call i64 @rt_root(i64 %t3226)
  store i64 %t3227, ptr @"scheme.base:hash-table-delete!"
  ret i64 17
}

define i64 @"scheme.base:__init_135"() {
entry:
  %t3331 = call ptr @rt_alloc_words(i64 1)
  %t3332 = ptrtoint ptr %t3331 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-grow!" to i64), ptr %t3331
  %t3333 = or i64 %t3332, 4
  %t3334 = call i64 @rt_root(i64 %t3333)
  store i64 %t3334, ptr @"scheme.base:%ht-grow!"
  ret i64 17
}

define i64 @"scheme.base:__init_136"() {
entry:
  %t3342 = call ptr @rt_alloc_words(i64 1)
  %t3343 = ptrtoint ptr %t3342 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-size" to i64), ptr %t3342
  %t3344 = or i64 %t3343, 4
  %t3345 = call i64 @rt_root(i64 %t3344)
  store i64 %t3345, ptr @"scheme.base:hash-table-size"
  ret i64 17
}

define i64 @"scheme.base:__init_137"() {
entry:
  %t3362 = call ptr @rt_alloc_words(i64 1)
  %t3363 = ptrtoint ptr %t3362 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-fold-buckets" to i64), ptr %t3362
  %t3364 = or i64 %t3363, 4
  %t3365 = call i64 @rt_root(i64 %t3364)
  store i64 %t3365, ptr @"scheme.base:%ht-fold-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_138"() {
entry:
  %t3413 = call ptr @rt_alloc_words(i64 1)
  %t3414 = ptrtoint ptr %t3413 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table->alist" to i64), ptr %t3413
  %t3415 = or i64 %t3414, 4
  %t3416 = call i64 @rt_root(i64 %t3415)
  store i64 %t3416, ptr @"scheme.base:hash-table->alist"
  ret i64 17
}

define i64 @"scheme.base:__init_139"() {
entry:
  %t3435 = call ptr @rt_alloc_words(i64 1)
  %t3436 = ptrtoint ptr %t3435 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-keys" to i64), ptr %t3435
  %t3437 = or i64 %t3436, 4
  %t3438 = call i64 @rt_root(i64 %t3437)
  store i64 %t3438, ptr @"scheme.base:hash-table-keys"
  ret i64 17
}

define i64 @"scheme.base:__init_140"() {
entry:
  %t3457 = call ptr @rt_alloc_words(i64 1)
  %t3458 = ptrtoint ptr %t3457 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-values" to i64), ptr %t3457
  %t3459 = or i64 %t3458, 4
  %t3460 = call i64 @rt_root(i64 %t3459)
  store i64 %t3460, ptr @"scheme.base:hash-table-values"
  ret i64 17
}

define i64 @"scheme.base:__init_141"() {
entry:
  %t3468 = call ptr @rt_alloc_words(i64 1)
  %t3469 = ptrtoint ptr %t3468 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-from-string" to i64), ptr %t3468
  %t3470 = or i64 %t3469, 4
  %t3471 = call i64 @rt_root(i64 %t3470)
  store i64 %t3471, ptr @"scheme.base:read-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_142"() {
entry:
  %t3526 = call ptr @rt_alloc_words(i64 1)
  %t3527 = ptrtoint ptr %t3526 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-all-from-string" to i64), ptr %t3526
  %t3528 = or i64 %t3527, 4
  %t3529 = call i64 @rt_root(i64 %t3528)
  store i64 %t3529, ptr @"scheme.base:read-all-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_143"() {
entry:
  %t3534 = call ptr @rt_alloc_words(i64 1)
  %t3535 = ptrtoint ptr %t3534 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port?" to i64), ptr %t3534
  %t3536 = or i64 %t3535, 4
  %t3537 = call i64 @rt_root(i64 %t3536)
  store i64 %t3537, ptr @"scheme.base:port?"
  ret i64 17
}

define i64 @"scheme.base:__init_144"() {
entry:
  %t3547 = call ptr @rt_alloc_words(i64 1)
  %t3548 = ptrtoint ptr %t3547 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port?" to i64), ptr %t3547
  %t3549 = or i64 %t3548, 4
  %t3550 = call i64 @rt_root(i64 %t3549)
  store i64 %t3550, ptr @"scheme.base:input-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_145"() {
entry:
  %t3561 = call ptr @rt_alloc_words(i64 1)
  %t3562 = ptrtoint ptr %t3561 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port?" to i64), ptr %t3561
  %t3563 = or i64 %t3562, 4
  %t3564 = call i64 @rt_root(i64 %t3563)
  store i64 %t3564, ptr @"scheme.base:output-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_146"() {
entry:
  %t3572 = call ptr @rt_alloc_words(i64 1)
  %t3573 = ptrtoint ptr %t3572 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:textual-port?" to i64), ptr %t3572
  %t3574 = or i64 %t3573, 4
  %t3575 = call i64 @rt_root(i64 %t3574)
  store i64 %t3575, ptr @"scheme.base:textual-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_147"() {
entry:
  %t3578 = call ptr @rt_alloc_words(i64 1)
  %t3579 = ptrtoint ptr %t3578 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port-closed?" to i64), ptr %t3578
  %t3580 = or i64 %t3579, 4
  %t3581 = call i64 @rt_root(i64 %t3580)
  store i64 %t3581, ptr @"scheme.base:port-closed?"
  ret i64 17
}

define i64 @"scheme.base:__init_148"() {
entry:
  %t3592 = call ptr @rt_alloc_words(i64 1)
  %t3593 = ptrtoint ptr %t3592 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port-open?" to i64), ptr %t3592
  %t3594 = or i64 %t3593, 4
  %t3595 = call i64 @rt_root(i64 %t3594)
  store i64 %t3595, ptr @"scheme.base:input-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_149"() {
entry:
  %t3606 = call ptr @rt_alloc_words(i64 1)
  %t3607 = ptrtoint ptr %t3606 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port-open?" to i64), ptr %t3606
  %t3608 = or i64 %t3607, 4
  %t3609 = call i64 @rt_root(i64 %t3608)
  store i64 %t3609, ptr @"scheme.base:output-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_150"() {
entry:
  %t3635 = call ptr @rt_alloc_words(i64 1)
  %t3636 = ptrtoint ptr %t3635 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-input-port" to i64), ptr %t3635
  %t3637 = or i64 %t3636, 4
  %t3638 = call i64 @rt_root(i64 %t3637)
  store i64 %t3638, ptr @"scheme.base:%check-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_151"() {
entry:
  %t3664 = call ptr @rt_alloc_words(i64 1)
  %t3665 = ptrtoint ptr %t3664 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-output-port" to i64), ptr %t3664
  %t3666 = or i64 %t3665, 4
  %t3667 = call i64 @rt_root(i64 %t3666)
  store i64 %t3667, ptr @"scheme.base:%check-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_152"() {
entry:
  %t3671 = call ptr @rt_alloc_words(i64 1)
  %t3672 = ptrtoint ptr %t3671 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-input-string" to i64), ptr %t3671
  %t3673 = or i64 %t3672, 4
  %t3674 = call i64 @rt_root(i64 %t3673)
  store i64 %t3674, ptr @"scheme.base:open-input-string"
  ret i64 17
}

define i64 @"scheme.base:__init_153"() {
entry:
  %t3688 = call ptr @rt_alloc_words(i64 1)
  %t3689 = ptrtoint ptr %t3688 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-input-file" to i64), ptr %t3688
  %t3690 = or i64 %t3689, 4
  %t3691 = call i64 @rt_root(i64 %t3690)
  store i64 %t3691, ptr @"scheme.base:open-input-file"
  ret i64 17
}

define i64 @"scheme.base:__init_154"() {
entry:
  %t3712 = call ptr @rt_alloc_words(i64 1)
  %t3713 = ptrtoint ptr %t3712 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%port-at-eof?" to i64), ptr %t3712
  %t3714 = or i64 %t3713, 4
  %t3715 = call i64 @rt_root(i64 %t3714)
  store i64 %t3715, ptr @"scheme.base:%port-at-eof?"
  ret i64 17
}

define i64 @"scheme.base:__init_155"() {
entry:
  %t3745 = call ptr @rt_alloc_words(i64 1)
  %t3746 = ptrtoint ptr %t3745 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-char" to i64), ptr %t3745
  %t3747 = or i64 %t3746, 4
  %t3748 = call i64 @rt_root(i64 %t3747)
  store i64 %t3748, ptr @"scheme.base:read-char"
  ret i64 17
}

define i64 @"scheme.base:__init_156"() {
entry:
  %t3769 = call ptr @rt_alloc_words(i64 1)
  %t3770 = ptrtoint ptr %t3769 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:peek-char" to i64), ptr %t3769
  %t3771 = or i64 %t3770, 4
  %t3772 = call i64 @rt_root(i64 %t3771)
  store i64 %t3772, ptr @"scheme.base:peek-char"
  ret i64 17
}

define i64 @"scheme.base:__init_157"() {
entry:
  %t3890 = call ptr @rt_alloc_words(i64 1)
  %t3891 = ptrtoint ptr %t3890 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-line" to i64), ptr %t3890
  %t3892 = or i64 %t3891, 4
  %t3893 = call i64 @rt_root(i64 %t3892)
  store i64 %t3893, ptr @"scheme.base:read-line"
  ret i64 17
}

define i64 @"scheme.base:__init_158"() {
entry:
  %t3941 = call ptr @rt_alloc_words(i64 1)
  %t3942 = ptrtoint ptr %t3941 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-string" to i64), ptr %t3941
  %t3943 = or i64 %t3942, 4
  %t3944 = call i64 @rt_root(i64 %t3943)
  store i64 %t3944, ptr @"scheme.base:read-string"
  ret i64 17
}

define i64 @"scheme.base:__init_159"() {
entry:
  %t3983 = call ptr @rt_alloc_words(i64 1)
  %t3984 = ptrtoint ptr %t3983 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read" to i64), ptr %t3983
  %t3985 = or i64 %t3984, 4
  %t3986 = call i64 @rt_root(i64 %t3985)
  store i64 %t3986, ptr @"scheme.base:read"
  ret i64 17
}

define i64 @"scheme.base:__init_160"() {
entry:
  %t4000 = call ptr @rt_alloc_words(i64 1)
  %t4001 = ptrtoint ptr %t4000 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-output-file" to i64), ptr %t4000
  %t4002 = or i64 %t4001, 4
  %t4003 = call i64 @rt_root(i64 %t4002)
  store i64 %t4003, ptr @"scheme.base:open-output-file"
  ret i64 17
}

define i64 @"scheme.base:__init_161"() {
entry:
  %t4017 = call ptr @rt_alloc_words(i64 1)
  %t4018 = ptrtoint ptr %t4017 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-output-string" to i64), ptr %t4017
  %t4019 = or i64 %t4018, 4
  %t4020 = call i64 @rt_root(i64 %t4019)
  store i64 %t4020, ptr @"scheme.base:open-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_162"() {
entry:
  %t4051 = call ptr @rt_alloc_words(i64 1)
  %t4052 = ptrtoint ptr %t4051 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:get-output-string" to i64), ptr %t4051
  %t4053 = or i64 %t4052, 4
  %t4054 = call i64 @rt_root(i64 %t4053)
  store i64 %t4054, ptr @"scheme.base:get-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_163"() {
entry:
  %t4065 = call ptr @rt_alloc_words(i64 1)
  %t4066 = ptrtoint ptr %t4065 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:flush-output-port" to i64), ptr %t4065
  %t4067 = or i64 %t4066, 4
  %t4068 = call i64 @rt_root(i64 %t4067)
  store i64 %t4068, ptr @"scheme.base:flush-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_164"() {
entry:
  %t4097 = call ptr @rt_alloc_words(i64 1)
  %t4098 = ptrtoint ptr %t4097 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-port" to i64), ptr %t4097
  %t4099 = or i64 %t4098, 4
  %t4100 = call i64 @rt_root(i64 %t4099)
  store i64 %t4100, ptr @"scheme.base:close-port"
  ret i64 17
}

define i64 @"scheme.base:__init_165"() {
entry:
  %t4123 = call ptr @rt_alloc_words(i64 1)
  %t4124 = ptrtoint ptr %t4123 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-input-port" to i64), ptr %t4123
  %t4125 = or i64 %t4124, 4
  %t4126 = call i64 @rt_root(i64 %t4125)
  store i64 %t4126, ptr @"scheme.base:close-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_166"() {
entry:
  %t4149 = call ptr @rt_alloc_words(i64 1)
  %t4150 = ptrtoint ptr %t4149 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-output-port" to i64), ptr %t4149
  %t4151 = or i64 %t4150, 4
  %t4152 = call i64 @rt_root(i64 %t4151)
  store i64 %t4152, ptr @"scheme.base:close-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_167"() {
entry:
  %t4153 = call i64 @rt_root(i64 1)
  store i64 %t4153, ptr @"scheme.base:%stdout-port"
  ret i64 17
}

define i64 @"scheme.base:__init_168"() {
entry:
  %t4154 = call i64 @rt_root(i64 1)
  store i64 %t4154, ptr @"scheme.base:%stderr-port"
  ret i64 17
}

define i64 @"scheme.base:__init_169"() {
entry:
  %t4155 = call i64 @rt_root(i64 1)
  store i64 %t4155, ptr @"scheme.base:%stdin-port"
  ret i64 17
}

define i64 @"scheme.base:__init_170"() {
entry:
  %t4183 = call ptr @rt_alloc_words(i64 1)
  %t4184 = ptrtoint ptr %t4183 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-output-port" to i64), ptr %t4183
  %t4185 = or i64 %t4184, 4
  %t4186 = call i64 @rt_root(i64 %t4185)
  store i64 %t4186, ptr @"scheme.base:current-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_171"() {
entry:
  %t4211 = call ptr @rt_alloc_words(i64 1)
  %t4212 = ptrtoint ptr %t4211 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-error-port" to i64), ptr %t4211
  %t4213 = or i64 %t4212, 4
  %t4214 = call i64 @rt_root(i64 %t4213)
  store i64 %t4214, ptr @"scheme.base:current-error-port"
  ret i64 17
}

define i64 @"scheme.base:__init_172"() {
entry:
  %t4239 = call ptr @rt_alloc_words(i64 1)
  %t4240 = ptrtoint ptr %t4239 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-input-port" to i64), ptr %t4239
  %t4241 = or i64 %t4240, 4
  %t4242 = call i64 @rt_root(i64 %t4241)
  store i64 %t4242, ptr @"scheme.base:current-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_173"() {
entry:
  %t4289 = call ptr @rt_alloc_words(i64 1)
  %t4290 = ptrtoint ptr %t4289 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-port" to i64), ptr %t4289
  %t4291 = or i64 %t4290, 4
  %t4292 = call i64 @rt_root(i64 %t4291)
  store i64 %t4292, ptr @"scheme.base:call-with-port"
  ret i64 17
}

define i64 @"scheme.base:__init_174"() {
entry:
  %t4353 = call ptr @rt_alloc_words(i64 1)
  %t4354 = ptrtoint ptr %t4353 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-output-to-file" to i64), ptr %t4353
  %t4355 = or i64 %t4354, 4
  %t4356 = call i64 @rt_root(i64 %t4355)
  store i64 %t4356, ptr @"scheme.base:with-output-to-file"
  ret i64 17
}

define i64 @"scheme.base:__init_175"() {
entry:
  %t4417 = call ptr @rt_alloc_words(i64 1)
  %t4418 = ptrtoint ptr %t4417 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-input-from-file" to i64), ptr %t4417
  %t4419 = or i64 %t4418, 4
  %t4420 = call i64 @rt_root(i64 %t4419)
  store i64 %t4420, ptr @"scheme.base:with-input-from-file"
  ret i64 17
}

define i64 @"scheme.base:__init_176"() {
entry:
  %t4434 = call ptr @rt_alloc_words(i64 1)
  %t4435 = ptrtoint ptr %t4434 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-output-file" to i64), ptr %t4434
  %t4436 = or i64 %t4435, 4
  %t4437 = call i64 @rt_root(i64 %t4436)
  store i64 %t4437, ptr @"scheme.base:call-with-output-file"
  ret i64 17
}

define i64 @"scheme.base:__init_177"() {
entry:
  %t4451 = call ptr @rt_alloc_words(i64 1)
  %t4452 = ptrtoint ptr %t4451 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-input-file" to i64), ptr %t4451
  %t4453 = or i64 %t4452, 4
  %t4454 = call i64 @rt_root(i64 %t4453)
  store i64 %t4454, ptr @"scheme.base:call-with-input-file"
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

