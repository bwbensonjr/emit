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
@.str.sym.17 = private unnamed_addr constant [10 x i8] c"read-char\00"
@.str.sym.18 = private unnamed_addr constant [10 x i8] c"peek-char\00"
@.str.sym.19 = private unnamed_addr constant [10 x i8] c"read-line\00"
@.str.sym.20 = private unnamed_addr constant [12 x i8] c"read-string\00"
@.str.sym.21 = private unnamed_addr constant [19 x i8] c"open-output-string\00"
@.str.lit.22 = private unnamed_addr constant [34 x i8] c"cannot open an output string port\00"
@.str.sym.23 = private unnamed_addr constant [18 x i8] c"get-output-string\00"
@.str.lit.24 = private unnamed_addr constant [19 x i8] c"not an output port\00"
@.str.lit.25 = private unnamed_addr constant [18 x i8] c"not a string port\00"
@.str.sym.26 = private unnamed_addr constant [18 x i8] c"flush-output-port\00"
@.str.sym.27 = private unnamed_addr constant [11 x i8] c"close-port\00"
@.str.lit.28 = private unnamed_addr constant [11 x i8] c"not a port\00"
@.str.sym.29 = private unnamed_addr constant [17 x i8] c"close-input-port\00"
@.str.lit.30 = private unnamed_addr constant [18 x i8] c"not an input port\00"
@.str.sym.31 = private unnamed_addr constant [18 x i8] c"close-output-port\00"
@.str.lit.32 = private unnamed_addr constant [19 x i8] c"not an output port\00"
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

define fastcc i64 @"scheme.base:code:%digit-in-radix"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1915 = icmp eq i64 %argc, 2
  br i1 %t1915, label %argok529, label %arityerr528
arityerr528:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok529:
  %t1916 = call i64 @rt_char_to_integer(i64 %a0)
  %t1917 = or i64 376, %t1916
  %t1918 = and i64 %t1917, 7
  %t1919 = icmp eq i64 %t1918, 0
  br i1 %t1919, label %fixfast530, label %fixslow531
fixfast530:
  %t1920 = icmp slt i64 376, %t1916
  %t1921 = select i1 %t1920, i64 257, i64 1
  br label %fixmerge532
fixslow531:
  %t1922 = call i64 @rt_lt(i64 376, i64 %t1916)
  br label %fixmerge532
fixmerge532:
  %t1923 = phi i64 [ %t1921, %fixfast530 ], [ %t1922, %fixslow531 ]
  %t1924 = icmp ne i64 %t1923, 1
  br i1 %t1924, label %then533, label %else534
then533:
  %t1925 = or i64 %t1916, 464
  %t1926 = and i64 %t1925, 7
  %t1927 = icmp eq i64 %t1926, 0
  br i1 %t1927, label %fixfast536, label %fixslow537
fixfast536:
  %t1928 = icmp slt i64 %t1916, 464
  %t1929 = select i1 %t1928, i64 257, i64 1
  br label %fixmerge538
fixslow537:
  %t1930 = call i64 @rt_lt(i64 %t1916, i64 464)
  br label %fixmerge538
fixmerge538:
  %t1931 = phi i64 [ %t1929, %fixfast536 ], [ %t1930, %fixslow537 ]
  br label %merge535
else534:
  br label %merge535
merge535:
  %t1932 = phi i64 [ %t1931, %fixmerge538 ], [ 1, %else534 ]
  %t1933 = icmp ne i64 %t1932, 1
  br i1 %t1933, label %then539, label %else540
then539:
  %t1934 = or i64 %t1916, 384
  %t1935 = and i64 %t1934, 7
  %t1936 = icmp eq i64 %t1935, 0
  br i1 %t1936, label %fixfast542, label %fixslow543
fixfast542:
  %t1937 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t1916, i64 384)
  %t1938 = extractvalue {i64, i1} %t1937, 0
  %t1939 = extractvalue {i64, i1} %t1937, 1
  br i1 %t1939, label %fixslow543, label %fixmerge544
fixslow543:
  %t1940 = call i64 @rt_sub(i64 %t1916, i64 384)
  br label %fixmerge544
fixmerge544:
  %t1941 = phi i64 [ %t1938, %fixfast542 ], [ %t1940, %fixslow543 ]
  br label %merge541
else540:
  %t1942 = or i64 768, %t1916
  %t1943 = and i64 %t1942, 7
  %t1944 = icmp eq i64 %t1943, 0
  br i1 %t1944, label %fixfast545, label %fixslow546
fixfast545:
  %t1945 = icmp slt i64 768, %t1916
  %t1946 = select i1 %t1945, i64 257, i64 1
  br label %fixmerge547
fixslow546:
  %t1947 = call i64 @rt_lt(i64 768, i64 %t1916)
  br label %fixmerge547
fixmerge547:
  %t1948 = phi i64 [ %t1946, %fixfast545 ], [ %t1947, %fixslow546 ]
  %t1949 = icmp ne i64 %t1948, 1
  br i1 %t1949, label %then548, label %else549
then548:
  %t1950 = or i64 %t1916, 984
  %t1951 = and i64 %t1950, 7
  %t1952 = icmp eq i64 %t1951, 0
  br i1 %t1952, label %fixfast551, label %fixslow552
fixfast551:
  %t1953 = icmp slt i64 %t1916, 984
  %t1954 = select i1 %t1953, i64 257, i64 1
  br label %fixmerge553
fixslow552:
  %t1955 = call i64 @rt_lt(i64 %t1916, i64 984)
  br label %fixmerge553
fixmerge553:
  %t1956 = phi i64 [ %t1954, %fixfast551 ], [ %t1955, %fixslow552 ]
  br label %merge550
else549:
  br label %merge550
merge550:
  %t1957 = phi i64 [ %t1956, %fixmerge553 ], [ 1, %else549 ]
  %t1958 = icmp ne i64 %t1957, 1
  br i1 %t1958, label %then554, label %else555
then554:
  %t1959 = or i64 %t1916, 696
  %t1960 = and i64 %t1959, 7
  %t1961 = icmp eq i64 %t1960, 0
  br i1 %t1961, label %fixfast557, label %fixslow558
fixfast557:
  %t1962 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t1916, i64 696)
  %t1963 = extractvalue {i64, i1} %t1962, 0
  %t1964 = extractvalue {i64, i1} %t1962, 1
  br i1 %t1964, label %fixslow558, label %fixmerge559
fixslow558:
  %t1965 = call i64 @rt_sub(i64 %t1916, i64 696)
  br label %fixmerge559
fixmerge559:
  %t1966 = phi i64 [ %t1963, %fixfast557 ], [ %t1965, %fixslow558 ]
  br label %merge556
else555:
  %t1967 = or i64 512, %t1916
  %t1968 = and i64 %t1967, 7
  %t1969 = icmp eq i64 %t1968, 0
  br i1 %t1969, label %fixfast560, label %fixslow561
fixfast560:
  %t1970 = icmp slt i64 512, %t1916
  %t1971 = select i1 %t1970, i64 257, i64 1
  br label %fixmerge562
fixslow561:
  %t1972 = call i64 @rt_lt(i64 512, i64 %t1916)
  br label %fixmerge562
fixmerge562:
  %t1973 = phi i64 [ %t1971, %fixfast560 ], [ %t1972, %fixslow561 ]
  %t1974 = icmp ne i64 %t1973, 1
  br i1 %t1974, label %then563, label %else564
then563:
  %t1975 = or i64 %t1916, 728
  %t1976 = and i64 %t1975, 7
  %t1977 = icmp eq i64 %t1976, 0
  br i1 %t1977, label %fixfast566, label %fixslow567
fixfast566:
  %t1978 = icmp slt i64 %t1916, 728
  %t1979 = select i1 %t1978, i64 257, i64 1
  br label %fixmerge568
fixslow567:
  %t1980 = call i64 @rt_lt(i64 %t1916, i64 728)
  br label %fixmerge568
fixmerge568:
  %t1981 = phi i64 [ %t1979, %fixfast566 ], [ %t1980, %fixslow567 ]
  br label %merge565
else564:
  br label %merge565
merge565:
  %t1982 = phi i64 [ %t1981, %fixmerge568 ], [ 1, %else564 ]
  %t1983 = icmp ne i64 %t1982, 1
  br i1 %t1983, label %then569, label %else570
then569:
  %t1984 = or i64 %t1916, 440
  %t1985 = and i64 %t1984, 7
  %t1986 = icmp eq i64 %t1985, 0
  br i1 %t1986, label %fixfast572, label %fixslow573
fixfast572:
  %t1987 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t1916, i64 440)
  %t1988 = extractvalue {i64, i1} %t1987, 0
  %t1989 = extractvalue {i64, i1} %t1987, 1
  br i1 %t1989, label %fixslow573, label %fixmerge574
fixslow573:
  %t1990 = call i64 @rt_sub(i64 %t1916, i64 440)
  br label %fixmerge574
fixmerge574:
  %t1991 = phi i64 [ %t1988, %fixfast572 ], [ %t1990, %fixslow573 ]
  br label %merge571
else570:
  br label %merge571
merge571:
  %t1992 = phi i64 [ %t1991, %fixmerge574 ], [ 792, %else570 ]
  br label %merge556
merge556:
  %t1993 = phi i64 [ %t1966, %fixmerge559 ], [ %t1992, %merge571 ]
  br label %merge541
merge541:
  %t1994 = phi i64 [ %t1941, %fixmerge544 ], [ %t1993, %merge556 ]
  %t1995 = or i64 %t1994, %a1
  %t1996 = and i64 %t1995, 7
  %t1997 = icmp eq i64 %t1996, 0
  br i1 %t1997, label %fixfast575, label %fixslow576
fixfast575:
  %t1998 = icmp slt i64 %t1994, %a1
  %t1999 = select i1 %t1998, i64 257, i64 1
  br label %fixmerge577
fixslow576:
  %t2000 = call i64 @rt_lt(i64 %t1994, i64 %a1)
  br label %fixmerge577
fixmerge577:
  %t2001 = phi i64 [ %t1999, %fixfast575 ], [ %t2000, %fixslow576 ]
  %t2002 = icmp ne i64 %t2001, 1
  br i1 %t2002, label %then578, label %else579
then578:
  ret i64 %t1994
else579:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%radix-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2007 = icmp eq i64 %argc, 5
  br i1 %t2007, label %argok581, label %arityerr580
arityerr580:
  call void @rt_arity_error(i64 5, i64 %argc)
  unreachable
argok581:
  %t2008 = or i64 %a1, %a2
  %t2009 = and i64 %t2008, 7
  %t2010 = icmp eq i64 %t2009, 0
  br i1 %t2010, label %fixfast582, label %fixslow583
fixfast582:
  %t2011 = icmp slt i64 %a1, %a2
  %t2012 = select i1 %t2011, i64 257, i64 1
  br label %fixmerge584
fixslow583:
  %t2013 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge584
fixmerge584:
  %t2014 = phi i64 [ %t2012, %fixfast582 ], [ %t2013, %fixslow583 ]
  %t2015 = icmp ne i64 %t2014, 1
  br i1 %t2015, label %then585, label %else586
then585:
  %t2016 = call i64 @rt_string_ref(i64 %a0, i64 %a1)
  %t2017 = load i64, ptr @"scheme.base:%digit-in-radix"
  %t2018 = and i64 %t2017, -8
  %t2019 = inttoptr i64 %t2018 to ptr
  %t2020 = load i64, ptr %t2019
  %t2021 = inttoptr i64 %t2020 to ptr
  %t2022 = call fastcc i64%t2021(i64 %t2017, i64 2, i64 %t2016, i64 %a3, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2023 = icmp ne i64 %t2022, 1
  br i1 %t2023, label %then587, label %else588
then587:
  %t2024 = or i64 %a1, 8
  %t2025 = and i64 %t2024, 7
  %t2026 = icmp eq i64 %t2025, 0
  br i1 %t2026, label %fixfast589, label %fixslow590
fixfast589:
  %t2027 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t2028 = extractvalue {i64, i1} %t2027, 0
  %t2029 = extractvalue {i64, i1} %t2027, 1
  br i1 %t2029, label %fixslow590, label %fixmerge591
fixslow590:
  %t2030 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge591
fixmerge591:
  %t2031 = phi i64 [ %t2028, %fixfast589 ], [ %t2030, %fixslow590 ]
  %t2032 = or i64 %a4, %a3
  %t2033 = and i64 %t2032, 7
  %t2034 = icmp eq i64 %t2033, 0
  br i1 %t2034, label %fixfast592, label %fixslow593
fixfast592:
  %t2035 = ashr i64 %a4, 3
  %t2036 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t2035, i64 %a3)
  %t2037 = extractvalue {i64, i1} %t2036, 0
  %t2038 = extractvalue {i64, i1} %t2036, 1
  br i1 %t2038, label %fixslow593, label %fixmerge594
fixslow593:
  %t2039 = call i64 @rt_mul(i64 %a4, i64 %a3)
  br label %fixmerge594
fixmerge594:
  %t2040 = phi i64 [ %t2037, %fixfast592 ], [ %t2039, %fixslow593 ]
  %t2041 = or i64 %t2040, %t2022
  %t2042 = and i64 %t2041, 7
  %t2043 = icmp eq i64 %t2042, 0
  br i1 %t2043, label %fixfast595, label %fixslow596
fixfast595:
  %t2044 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t2040, i64 %t2022)
  %t2045 = extractvalue {i64, i1} %t2044, 0
  %t2046 = extractvalue {i64, i1} %t2044, 1
  br i1 %t2046, label %fixslow596, label %fixmerge597
fixslow596:
  %t2047 = call i64 @rt_sub(i64 %t2040, i64 %t2022)
  br label %fixmerge597
fixmerge597:
  %t2048 = phi i64 [ %t2045, %fixfast595 ], [ %t2047, %fixslow596 ]
  %t2049 = load i64, ptr @"scheme.base:%radix-digits"
  %t2050 = and i64 %t2049, -8
  %t2051 = inttoptr i64 %t2050 to ptr
  %t2052 = load i64, ptr %t2051
  %t2053 = inttoptr i64 %t2052 to ptr
  %t2054 = musttail call fastcc i64 %t2053(i64 %t2049, i64 5, i64 %a0, i64 %t2031, i64 %a2, i64 %a3, i64 %t2048, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2054
else588:
  ret i64 1
else586:
  ret i64 %a4
}

define fastcc i64 @"scheme.base:code:%string->int"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2059 = icmp eq i64 %argc, 2
  br i1 %t2059, label %argok599, label %arityerr598
arityerr598:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok599:
  %t2060 = call i64 @rt_string_length(i64 %a0)
  %t2061 = or i64 %t2060, 0
  %t2062 = and i64 %t2061, 7
  %t2063 = icmp eq i64 %t2062, 0
  br i1 %t2063, label %fixfast600, label %fixslow601
fixfast600:
  %t2064 = icmp eq i64 %t2060, 0
  %t2065 = select i1 %t2064, i64 257, i64 1
  br label %fixmerge602
fixslow601:
  %t2066 = call i64 @rt_num_eq(i64 %t2060, i64 0)
  br label %fixmerge602
fixmerge602:
  %t2067 = phi i64 [ %t2065, %fixfast600 ], [ %t2066, %fixslow601 ]
  %t2068 = icmp ne i64 %t2067, 1
  br i1 %t2068, label %then603, label %else604
then603:
  ret i64 1
else604:
  %t2069 = call i64 @rt_string_ref(i64 %a0, i64 0)
  %t2070 = call i64 @rt_char_to_integer(i64 %t2069)
  %t2071 = or i64 %t2070, 360
  %t2072 = and i64 %t2071, 7
  %t2073 = icmp eq i64 %t2072, 0
  br i1 %t2073, label %fixfast605, label %fixslow606
fixfast605:
  %t2074 = icmp eq i64 %t2070, 360
  %t2075 = select i1 %t2074, i64 257, i64 1
  br label %fixmerge607
fixslow606:
  %t2076 = call i64 @rt_num_eq(i64 %t2070, i64 360)
  br label %fixmerge607
fixmerge607:
  %t2077 = phi i64 [ %t2075, %fixfast605 ], [ %t2076, %fixslow606 ]
  %t2078 = icmp ne i64 %t2077, 1
  br i1 %t2078, label %then608, label %else609
then608:
  %t2079 = or i64 8, %t2060
  %t2080 = and i64 %t2079, 7
  %t2081 = icmp eq i64 %t2080, 0
  br i1 %t2081, label %fixfast610, label %fixslow611
fixfast610:
  %t2082 = icmp slt i64 8, %t2060
  %t2083 = select i1 %t2082, i64 257, i64 1
  br label %fixmerge612
fixslow611:
  %t2084 = call i64 @rt_lt(i64 8, i64 %t2060)
  br label %fixmerge612
fixmerge612:
  %t2085 = phi i64 [ %t2083, %fixfast610 ], [ %t2084, %fixslow611 ]
  %t2086 = icmp ne i64 %t2085, 1
  br i1 %t2086, label %then613, label %else614
then613:
  %t2087 = load i64, ptr @"scheme.base:%radix-digits"
  %t2088 = and i64 %t2087, -8
  %t2089 = inttoptr i64 %t2088 to ptr
  %t2090 = load i64, ptr %t2089
  %t2091 = inttoptr i64 %t2090 to ptr
  %t2092 = musttail call fastcc i64 %t2091(i64 %t2087, i64 5, i64 %a0, i64 8, i64 %t2060, i64 %a1, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2092
else614:
  ret i64 1
else609:
  %t2093 = or i64 %t2070, 344
  %t2094 = and i64 %t2093, 7
  %t2095 = icmp eq i64 %t2094, 0
  br i1 %t2095, label %fixfast615, label %fixslow616
fixfast615:
  %t2096 = icmp eq i64 %t2070, 344
  %t2097 = select i1 %t2096, i64 257, i64 1
  br label %fixmerge617
fixslow616:
  %t2098 = call i64 @rt_num_eq(i64 %t2070, i64 344)
  br label %fixmerge617
fixmerge617:
  %t2099 = phi i64 [ %t2097, %fixfast615 ], [ %t2098, %fixslow616 ]
  %t2100 = icmp ne i64 %t2099, 1
  br i1 %t2100, label %then618, label %else619
then618:
  br label %merge620
else619:
  br label %merge620
merge620:
  %t2101 = phi i64 [ 8, %then618 ], [ 0, %else619 ]
  %t2102 = or i64 %t2101, %t2060
  %t2103 = and i64 %t2102, 7
  %t2104 = icmp eq i64 %t2103, 0
  br i1 %t2104, label %fixfast621, label %fixslow622
fixfast621:
  %t2105 = icmp slt i64 %t2101, %t2060
  %t2106 = select i1 %t2105, i64 257, i64 1
  br label %fixmerge623
fixslow622:
  %t2107 = call i64 @rt_lt(i64 %t2101, i64 %t2060)
  br label %fixmerge623
fixmerge623:
  %t2108 = phi i64 [ %t2106, %fixfast621 ], [ %t2107, %fixslow622 ]
  %t2109 = icmp ne i64 %t2108, 1
  br i1 %t2109, label %then624, label %else625
then624:
  %t2110 = load i64, ptr @"scheme.base:%radix-digits"
  %t2111 = and i64 %t2110, -8
  %t2112 = inttoptr i64 %t2111 to ptr
  %t2113 = load i64, ptr %t2112
  %t2114 = inttoptr i64 %t2113 to ptr
  %t2115 = call fastcc i64%t2114(i64 %t2110, i64 5, i64 %a0, i64 %t2101, i64 %t2060, i64 %a1, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2116 = icmp ne i64 %t2115, 1
  br i1 %t2116, label %then626, label %else627
then626:
  %t2117 = or i64 0, %t2115
  %t2118 = and i64 %t2117, 7
  %t2119 = icmp eq i64 %t2118, 0
  br i1 %t2119, label %fixfast628, label %fixslow629
fixfast628:
  %t2120 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %t2115)
  %t2121 = extractvalue {i64, i1} %t2120, 0
  %t2122 = extractvalue {i64, i1} %t2120, 1
  br i1 %t2122, label %fixslow629, label %fixmerge630
fixslow629:
  %t2123 = call i64 @rt_sub(i64 0, i64 %t2115)
  br label %fixmerge630
fixmerge630:
  %t2124 = phi i64 [ %t2121, %fixfast628 ], [ %t2123, %fixslow629 ]
  ret i64 %t2124
else627:
  ret i64 1
else625:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:string->number"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2129 = icmp sge i64 %argc, 1
  br i1 %t2129, label %argok632, label %arityerr631
arityerr631:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok632:
  %t2130 = call ptr @rt_alloc_words(i64 8)
  %t2131 = getelementptr i64, ptr %t2130, i64 0
  store i64 %a0, ptr %t2131
  %t2132 = getelementptr i64, ptr %t2130, i64 1
  store i64 %a1, ptr %t2132
  %t2133 = getelementptr i64, ptr %t2130, i64 2
  store i64 %a2, ptr %t2133
  %t2134 = getelementptr i64, ptr %t2130, i64 3
  store i64 %a3, ptr %t2134
  %t2135 = getelementptr i64, ptr %t2130, i64 4
  store i64 %a4, ptr %t2135
  %t2136 = getelementptr i64, ptr %t2130, i64 5
  store i64 %a5, ptr %t2136
  %t2137 = getelementptr i64, ptr %t2130, i64 6
  store i64 %a6, ptr %t2137
  %t2138 = getelementptr i64, ptr %t2130, i64 7
  store i64 %a7, ptr %t2138
  %t2139 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2130, ptr %overflow)
  %t2140 = call i64 @rt_null_p(i64 %t2139)
  %t2141 = icmp ne i64 %t2140, 1
  br i1 %t2141, label %then633, label %else634
then633:
  br label %merge635
else634:
  %t2142 = call i64 @rt_car(i64 %t2139)
  br label %merge635
merge635:
  %t2143 = phi i64 [ 80, %then633 ], [ %t2142, %else634 ]
  %t2144 = load i64, ptr @"scheme.base:%radix-ok?"
  %t2145 = and i64 %t2144, -8
  %t2146 = inttoptr i64 %t2145 to ptr
  %t2147 = load i64, ptr %t2146
  %t2148 = inttoptr i64 %t2147 to ptr
  %t2149 = call fastcc i64%t2148(i64 %t2144, i64 1, i64 %t2143, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2150 = icmp ne i64 %t2149, 1
  br i1 %t2150, label %then636, label %else637
then636:
  %t2151 = or i64 %t2143, 80
  %t2152 = and i64 %t2151, 7
  %t2153 = icmp eq i64 %t2152, 0
  br i1 %t2153, label %fixfast638, label %fixslow639
fixfast638:
  %t2154 = icmp eq i64 %t2143, 80
  %t2155 = select i1 %t2154, i64 257, i64 1
  br label %fixmerge640
fixslow639:
  %t2156 = call i64 @rt_num_eq(i64 %t2143, i64 80)
  br label %fixmerge640
fixmerge640:
  %t2157 = phi i64 [ %t2155, %fixfast638 ], [ %t2156, %fixslow639 ]
  %t2158 = icmp ne i64 %t2157, 1
  br i1 %t2158, label %then641, label %else642
then641:
  %t2159 = load i64, ptr @"emit.internal:rd-numeric?"
  %t2160 = call fastcc i64 @"emit.internal:code:rd-numeric?"(i64 %t2159, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2161 = icmp ne i64 %t2160, 1
  br i1 %t2161, label %then643, label %else644
then643:
  %t2162 = load i64, ptr @"emit.internal:rd-parse-int"
  %t2163 = musttail call fastcc i64 @"emit.internal:code:rd-parse-int"(i64 %t2162, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2163
else644:
  %t2164 = load i64, ptr @"emit.internal:rd-nonfinite"
  %t2165 = call fastcc i64 @"emit.internal:code:rd-nonfinite"(i64 %t2164, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2166 = icmp ne i64 %t2165, 1
  br i1 %t2166, label %then645, label %else646
then645:
  ret i64 %t2165
else646:
  %t2167 = load i64, ptr @"emit.internal:rd-flonum?"
  %t2168 = call fastcc i64 @"emit.internal:code:rd-flonum?"(i64 %t2167, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2169 = icmp ne i64 %t2168, 1
  br i1 %t2169, label %then647, label %else648
then647:
  %t2170 = call i64 @rt_string_to_flonum(i64 %a0)
  ret i64 %t2170
else648:
  ret i64 1
else642:
  %t2171 = load i64, ptr @"scheme.base:%string->int"
  %t2172 = and i64 %t2171, -8
  %t2173 = inttoptr i64 %t2172 to ptr
  %t2174 = load i64, ptr %t2173
  %t2175 = inttoptr i64 %t2174 to ptr
  %t2176 = musttail call fastcc i64 %t2175(i64 %t2171, i64 2, i64 %a0, i64 %t2143, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2176
else637:
  %t2177 = call i64 @rt_make_string(ptr @.str.lit.8, i64 33)
  %t2178 = load i64, ptr @"scheme.base:error"
  %t2179 = and i64 %t2178, -8
  %t2180 = inttoptr i64 %t2179 to ptr
  %t2181 = load i64, ptr %t2180
  %t2182 = inttoptr i64 %t2181 to ptr
  %t2183 = musttail call fastcc i64 %t2182(i64 %t2178, i64 2, i64 %t2177, i64 %t2143, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2183
}

define fastcc i64 @"scheme.base:code:error"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2188 = icmp sge i64 %argc, 1
  br i1 %t2188, label %argok650, label %arityerr649
arityerr649:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok650:
  %t2189 = call ptr @rt_alloc_words(i64 8)
  %t2190 = getelementptr i64, ptr %t2189, i64 0
  store i64 %a0, ptr %t2190
  %t2191 = getelementptr i64, ptr %t2189, i64 1
  store i64 %a1, ptr %t2191
  %t2192 = getelementptr i64, ptr %t2189, i64 2
  store i64 %a2, ptr %t2192
  %t2193 = getelementptr i64, ptr %t2189, i64 3
  store i64 %a3, ptr %t2193
  %t2194 = getelementptr i64, ptr %t2189, i64 4
  store i64 %a4, ptr %t2194
  %t2195 = getelementptr i64, ptr %t2189, i64 5
  store i64 %a5, ptr %t2195
  %t2196 = getelementptr i64, ptr %t2189, i64 6
  store i64 %a6, ptr %t2196
  %t2197 = getelementptr i64, ptr %t2189, i64 7
  store i64 %a7, ptr %t2197
  %t2198 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2189, ptr %overflow)
  %t2199 = call i64 @rt_string_p(i64 %a0)
  %t2200 = icmp ne i64 %t2199, 1
  br i1 %t2200, label %then651, label %else652
then651:
  %t2201 = call i64 @rt_make_error_object(i64 %a0, i64 %t2198)
  %t2202 = load i64, ptr @"scheme.base:raise"
  %t2203 = and i64 %t2202, -8
  %t2204 = inttoptr i64 %t2203 to ptr
  %t2205 = load i64, ptr %t2204
  %t2206 = inttoptr i64 %t2205 to ptr
  %t2207 = musttail call fastcc i64 %t2206(i64 %t2202, i64 1, i64 %t2201, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2207
else652:
  %t2208 = call i64 @rt_symbol_to_string(i64 %a0)
  %t2209 = call i64 @rt_make_string(ptr @.str.lit.9, i64 2)
  %t2210 = call i64 @rt_car(i64 %t2198)
  %t2211 = call i64 @rt_string_append(i64 %t2209, i64 %t2210)
  %t2212 = call i64 @rt_string_append(i64 %t2208, i64 %t2211)
  %t2213 = call i64 @rt_cdr(i64 %t2198)
  %t2214 = call i64 @rt_make_error_object(i64 %t2212, i64 %t2213)
  %t2215 = load i64, ptr @"scheme.base:raise"
  %t2216 = and i64 %t2215, -8
  %t2217 = inttoptr i64 %t2216 to ptr
  %t2218 = load i64, ptr %t2217
  %t2219 = inttoptr i64 %t2218 to ptr
  %t2220 = musttail call fastcc i64 %t2219(i64 %t2215, i64 1, i64 %t2214, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2220
}

define fastcc i64 @"scheme.base:code:%unwind-to"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2227 = icmp eq i64 %argc, 1
  br i1 %t2227, label %argok654, label %arityerr653
arityerr653:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok654:
  %t2228 = load i64, ptr @"scheme.base:*winds*"
  %t2229 = call i64 @rt_eq_p(i64 %t2228, i64 %a0)
  %t2230 = icmp ne i64 %t2229, 1
  br i1 %t2230, label %then655, label %else656
then655:
  ret i64 257
else656:
  %t2231 = load i64, ptr @"scheme.base:*winds*"
  %t2232 = call i64 @rt_null_p(i64 %t2231)
  %t2233 = icmp ne i64 %t2232, 1
  br i1 %t2233, label %then657, label %else658
then657:
  ret i64 257
else658:
  %t2234 = load i64, ptr @"scheme.base:*winds*"
  %t2235 = call i64 @rt_car(i64 %t2234)
  %t2236 = load i64, ptr @"scheme.base:*winds*"
  %t2237 = call i64 @rt_cdr(i64 %t2236)
  %t2238 = call i64 @rt_root(i64 %t2237)
  store i64 %t2238, ptr @"scheme.base:*winds*"
  %t2239 = call i64 @rt_cdr(i64 %t2235)
  %t2240 = and i64 %t2239, -8
  %t2241 = inttoptr i64 %t2240 to ptr
  %t2242 = load i64, ptr %t2241
  %t2243 = inttoptr i64 %t2242 to ptr
  %t2244 = call fastcc i64%t2243(i64 %t2239, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2245 = load i64, ptr @"scheme.base:%unwind-to"
  %t2246 = and i64 %t2245, -8
  %t2247 = inttoptr i64 %t2246 to ptr
  %t2248 = load i64, ptr %t2247
  %t2249 = inttoptr i64 %t2248 to ptr
  %t2250 = musttail call fastcc i64 %t2249(i64 %t2245, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2250
}

define fastcc i64 @"scheme.base:code:dynamic-wind"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2255 = icmp eq i64 %argc, 3
  br i1 %t2255, label %argok660, label %arityerr659
arityerr659:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok660:
  %t2256 = and i64 %a0, -8
  %t2257 = inttoptr i64 %t2256 to ptr
  %t2258 = load i64, ptr %t2257
  %t2259 = inttoptr i64 %t2258 to ptr
  %t2260 = call fastcc i64%t2259(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2261 = call i64 @rt_cons(i64 %a0, i64 %a2)
  %t2262 = load i64, ptr @"scheme.base:*winds*"
  %t2263 = call i64 @rt_cons(i64 %t2261, i64 %t2262)
  %t2264 = call i64 @rt_root(i64 %t2263)
  store i64 %t2264, ptr @"scheme.base:*winds*"
  %t2265 = and i64 %a1, -8
  %t2266 = inttoptr i64 %t2265 to ptr
  %t2267 = load i64, ptr %t2266
  %t2268 = inttoptr i64 %t2267 to ptr
  %t2269 = call fastcc i64%t2268(i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2270 = load i64, ptr @"scheme.base:*winds*"
  %t2271 = call i64 @rt_cdr(i64 %t2270)
  %t2272 = call i64 @rt_root(i64 %t2271)
  store i64 %t2272, ptr @"scheme.base:*winds*"
  %t2273 = and i64 %a2, -8
  %t2274 = inttoptr i64 %t2273 to ptr
  %t2275 = load i64, ptr %t2274
  %t2276 = inttoptr i64 %t2275 to ptr
  %t2277 = call fastcc i64%t2276(i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2269
}

define fastcc i64 @"scheme.base:code_532"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2282 = icmp eq i64 %argc, 1
  br i1 %t2282, label %argok662, label %arityerr661
arityerr661:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok662:
  %t2283 = and i64 %self, -8
  %t2284 = inttoptr i64 %t2283 to ptr
  %t2285 = getelementptr i64, ptr %t2284, i64 1
  %t2286 = load i64, ptr %t2285
  %t2287 = call i64 @rt_escape_live_p(i64 %t2286)
  %t2288 = icmp ne i64 %t2287, 1
  br i1 %t2288, label %then663, label %else664
then663:
  %t2289 = and i64 %self, -8
  %t2290 = inttoptr i64 %t2289 to ptr
  %t2291 = getelementptr i64, ptr %t2290, i64 2
  %t2292 = load i64, ptr %t2291
  %t2293 = load i64, ptr @"scheme.base:%unwind-to"
  %t2294 = and i64 %t2293, -8
  %t2295 = inttoptr i64 %t2294 to ptr
  %t2296 = load i64, ptr %t2295
  %t2297 = inttoptr i64 %t2296 to ptr
  %t2298 = call fastcc i64%t2297(i64 %t2293, i64 1, i64 %t2292, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2299 = and i64 %self, -8
  %t2300 = inttoptr i64 %t2299 to ptr
  %t2301 = getelementptr i64, ptr %t2300, i64 1
  %t2302 = load i64, ptr %t2301
  %t2303 = call i64 @rt_escape_to(i64 %t2302, i64 %a0)
  br label %merge665
else664:
  br label %merge665
merge665:
  %t2304 = phi i64 [ %t2303, %then663 ], [ 1, %else664 ]
  %t2305 = call i64 @rt_intern(ptr @.str.sym.10)
  %t2306 = call i64 @rt_make_string(ptr @.str.lit.11, i64 39)
  %t2307 = load i64, ptr @"scheme.base:error"
  %t2308 = and i64 %t2307, -8
  %t2309 = inttoptr i64 %t2308 to ptr
  %t2310 = load i64, ptr %t2309
  %t2311 = inttoptr i64 %t2310 to ptr
  %t2312 = musttail call fastcc i64 %t2311(i64 %t2307, i64 2, i64 %t2305, i64 %t2306, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2312
}

define fastcc i64 @"scheme.base:code_530"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2313 = icmp eq i64 %argc, 0
  br i1 %t2313, label %argok667, label %arityerr666
arityerr666:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok667:
  %t2314 = call i64 @rt_escape_frame()
  %t2315 = and i64 %self, -8
  %t2316 = inttoptr i64 %t2315 to ptr
  %t2317 = getelementptr i64, ptr %t2316, i64 2
  %t2318 = load i64, ptr %t2317
  %t2319 = call ptr @rt_alloc_words(i64 3)
  %t2320 = ptrtoint ptr %t2319 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_532" to i64), ptr %t2319
  %t2321 = getelementptr i64, ptr %t2319, i64 1
  store i64 %t2314, ptr %t2321
  %t2322 = getelementptr i64, ptr %t2319, i64 2
  store i64 %t2318, ptr %t2322
  %t2323 = or i64 %t2320, 4
  %t2324 = and i64 %self, -8
  %t2325 = inttoptr i64 %t2324 to ptr
  %t2326 = getelementptr i64, ptr %t2325, i64 1
  %t2327 = load i64, ptr %t2326
  %t2328 = and i64 %t2327, -8
  %t2329 = inttoptr i64 %t2328 to ptr
  %t2330 = load i64, ptr %t2329
  %t2331 = inttoptr i64 %t2330 to ptr
  %t2332 = musttail call fastcc i64 %t2331(i64 %t2327, i64 1, i64 %t2323, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2332
}

define fastcc i64 @"scheme.base:code:call-with-current-continuation"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2333 = icmp eq i64 %argc, 1
  br i1 %t2333, label %argok669, label %arityerr668
arityerr668:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok669:
  %t2334 = load i64, ptr @"scheme.base:*winds*"
  %t2335 = call ptr @rt_alloc_words(i64 3)
  %t2336 = ptrtoint ptr %t2335 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_530" to i64), ptr %t2335
  %t2337 = getelementptr i64, ptr %t2335, i64 1
  store i64 %a0, ptr %t2337
  %t2338 = getelementptr i64, ptr %t2335, i64 2
  store i64 %t2334, ptr %t2338
  %t2339 = or i64 %t2336, 4
  %t2340 = call i64 @rt_run_guarded(ptr @__apply0, i64 %t2339)
  %t2341 = call i64 @rt_cdr(i64 %t2340)
  ret i64 %t2341
}

define fastcc i64 @"scheme.base:code:call/cc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2346 = icmp eq i64 %argc, 1
  br i1 %t2346, label %argok671, label %arityerr670
arityerr670:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok671:
  %t2347 = load i64, ptr @"scheme.base:call-with-current-continuation"
  %t2348 = and i64 %t2347, -8
  %t2349 = inttoptr i64 %t2348 to ptr
  %t2350 = load i64, ptr %t2349
  %t2351 = inttoptr i64 %t2350 to ptr
  %t2352 = musttail call fastcc i64 %t2351(i64 %t2347, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2352
}

define fastcc i64 @"scheme.base:code_540"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2357 = icmp eq i64 %argc, 0
  br i1 %t2357, label %argok673, label %arityerr672
arityerr672:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok673:
  %t2358 = and i64 %self, -8
  %t2359 = inttoptr i64 %t2358 to ptr
  %t2360 = getelementptr i64, ptr %t2359, i64 1
  %t2361 = load i64, ptr %t2360
  %t2362 = and i64 %self, -8
  %t2363 = inttoptr i64 %t2362 to ptr
  %t2364 = getelementptr i64, ptr %t2363, i64 2
  %t2365 = load i64, ptr %t2364
  %t2366 = call i64 @rt_cons(i64 %t2361, i64 %t2365)
  %t2367 = call i64 @rt_root(i64 %t2366)
  store i64 %t2367, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code_542"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2368 = icmp eq i64 %argc, 0
  br i1 %t2368, label %argok675, label %arityerr674
arityerr674:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok675:
  %t2369 = and i64 %self, -8
  %t2370 = inttoptr i64 %t2369 to ptr
  %t2371 = getelementptr i64, ptr %t2370, i64 1
  %t2372 = load i64, ptr %t2371
  %t2373 = call i64 @rt_root(i64 %t2372)
  store i64 %t2373, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code:with-exception-handler"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2374 = icmp eq i64 %argc, 2
  br i1 %t2374, label %argok677, label %arityerr676
arityerr676:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok677:
  %t2375 = load i64, ptr @"scheme.base:*handlers*"
  %t2376 = call ptr @rt_alloc_words(i64 3)
  %t2377 = ptrtoint ptr %t2376 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_540" to i64), ptr %t2376
  %t2378 = getelementptr i64, ptr %t2376, i64 1
  store i64 %a0, ptr %t2378
  %t2379 = getelementptr i64, ptr %t2376, i64 2
  store i64 %t2375, ptr %t2379
  %t2380 = or i64 %t2377, 4
  %t2381 = call ptr @rt_alloc_words(i64 2)
  %t2382 = ptrtoint ptr %t2381 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_542" to i64), ptr %t2381
  %t2383 = getelementptr i64, ptr %t2381, i64 1
  store i64 %t2375, ptr %t2383
  %t2384 = or i64 %t2382, 4
  %t2385 = load i64, ptr @"scheme.base:dynamic-wind"
  %t2386 = and i64 %t2385, -8
  %t2387 = inttoptr i64 %t2386 to ptr
  %t2388 = load i64, ptr %t2387
  %t2389 = inttoptr i64 %t2388 to ptr
  %t2390 = musttail call fastcc i64 %t2389(i64 %t2385, i64 3, i64 %t2380, i64 %a1, i64 %t2384, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2390
}

define fastcc i64 @"scheme.base:code:raise"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2395 = icmp eq i64 %argc, 1
  br i1 %t2395, label %argok679, label %arityerr678
arityerr678:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok679:
  %t2396 = load i64, ptr @"scheme.base:*handlers*"
  %t2397 = call i64 @rt_null_p(i64 %t2396)
  %t2398 = icmp ne i64 %t2397, 1
  br i1 %t2398, label %then680, label %else681
then680:
  %t2399 = call i64 @rt_raise(i64 %a0)
  ret i64 %t2399
else681:
  %t2400 = load i64, ptr @"scheme.base:*handlers*"
  %t2401 = call i64 @rt_car(i64 %t2400)
  %t2402 = load i64, ptr @"scheme.base:*handlers*"
  %t2403 = load i64, ptr @"scheme.base:*handlers*"
  %t2404 = call i64 @rt_cdr(i64 %t2403)
  %t2405 = call i64 @rt_root(i64 %t2404)
  store i64 %t2405, ptr @"scheme.base:*handlers*"
  %t2406 = and i64 %t2401, -8
  %t2407 = inttoptr i64 %t2406 to ptr
  %t2408 = load i64, ptr %t2407
  %t2409 = inttoptr i64 %t2408 to ptr
  %t2410 = call fastcc i64%t2409(i64 %t2401, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2411 = call i64 @rt_root(i64 %t2402)
  store i64 %t2411, ptr @"scheme.base:*handlers*"
  %t2412 = call i64 @rt_raise(i64 %a0)
  ret i64 %t2412
}

define fastcc i64 @"scheme.base:code:error-object?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2417 = icmp eq i64 %argc, 1
  br i1 %t2417, label %argok683, label %arityerr682
arityerr682:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok683:
  %t2418 = call i64 @rt_error_object_p(i64 %a0)
  ret i64 %t2418
}

define fastcc i64 @"scheme.base:code:error-object-message"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2423 = icmp eq i64 %argc, 1
  br i1 %t2423, label %argok685, label %arityerr684
arityerr684:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok685:
  %t2424 = call i64 @rt_error_object_message(i64 %a0)
  ret i64 %t2424
}

define fastcc i64 @"scheme.base:code:error-object-irritants"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2429 = icmp eq i64 %argc, 1
  br i1 %t2429, label %argok687, label %arityerr686
arityerr686:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok687:
  %t2430 = call i64 @rt_error_object_irritants(i64 %a0)
  ret i64 %t2430
}

define fastcc i64 @"scheme.base:code_562"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2435 = icmp eq i64 %argc, 1
  br i1 %t2435, label %argok689, label %arityerr688
arityerr688:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok689:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_564"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2436 = icmp eq i64 %argc, 1
  br i1 %t2436, label %argok691, label %arityerr690
arityerr690:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok691:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_566"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2437 = icmp sge i64 %argc, 0
  br i1 %t2437, label %argok693, label %arityerr692
arityerr692:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok693:
  %t2438 = call ptr @rt_alloc_words(i64 8)
  %t2439 = getelementptr i64, ptr %t2438, i64 0
  store i64 %a0, ptr %t2439
  %t2440 = getelementptr i64, ptr %t2438, i64 1
  store i64 %a1, ptr %t2440
  %t2441 = getelementptr i64, ptr %t2438, i64 2
  store i64 %a2, ptr %t2441
  %t2442 = getelementptr i64, ptr %t2438, i64 3
  store i64 %a3, ptr %t2442
  %t2443 = getelementptr i64, ptr %t2438, i64 4
  store i64 %a4, ptr %t2443
  %t2444 = getelementptr i64, ptr %t2438, i64 5
  store i64 %a5, ptr %t2444
  %t2445 = getelementptr i64, ptr %t2438, i64 6
  store i64 %a6, ptr %t2445
  %t2446 = getelementptr i64, ptr %t2438, i64 7
  store i64 %a7, ptr %t2446
  %t2447 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2438, ptr %overflow)
  %t2448 = call i64 @rt_null_p(i64 %t2447)
  %t2449 = icmp ne i64 %t2448, 1
  br i1 %t2449, label %then694, label %else695
then694:
  %t2450 = and i64 %self, -8
  %t2451 = inttoptr i64 %t2450 to ptr
  %t2452 = getelementptr i64, ptr %t2451, i64 1
  %t2453 = load i64, ptr %t2452
  %t2454 = call i64 @rt_vector_ref(i64 %t2453, i64 0)
  ret i64 %t2454
else695:
  %t2455 = call i64 @rt_cdr(i64 %t2447)
  %t2456 = call i64 @rt_null_p(i64 %t2455)
  %t2457 = icmp ne i64 %t2456, 1
  br i1 %t2457, label %then696, label %else697
then696:
  %t2458 = and i64 %self, -8
  %t2459 = inttoptr i64 %t2458 to ptr
  %t2460 = getelementptr i64, ptr %t2459, i64 1
  %t2461 = load i64, ptr %t2460
  %t2462 = call i64 @rt_car(i64 %t2447)
  %t2463 = and i64 %self, -8
  %t2464 = inttoptr i64 %t2463 to ptr
  %t2465 = getelementptr i64, ptr %t2464, i64 2
  %t2466 = load i64, ptr %t2465
  %t2467 = and i64 %t2466, -8
  %t2468 = inttoptr i64 %t2467 to ptr
  %t2469 = load i64, ptr %t2468
  %t2470 = inttoptr i64 %t2469 to ptr
  %t2471 = call fastcc i64%t2470(i64 %t2466, i64 1, i64 %t2462, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2472 = call i64 @rt_vector_set(i64 %t2461, i64 0, i64 %t2471)
  ret i64 %t2472
else697:
  %t2473 = and i64 %self, -8
  %t2474 = inttoptr i64 %t2473 to ptr
  %t2475 = getelementptr i64, ptr %t2474, i64 1
  %t2476 = load i64, ptr %t2475
  %t2477 = call i64 @rt_car(i64 %t2447)
  %t2478 = call i64 @rt_vector_set(i64 %t2476, i64 0, i64 %t2477)
  ret i64 %t2478
}

define fastcc i64 @"scheme.base:code:make-parameter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2479 = icmp sge i64 %argc, 1
  br i1 %t2479, label %argok699, label %arityerr698
arityerr698:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok699:
  %t2480 = call ptr @rt_alloc_words(i64 8)
  %t2481 = getelementptr i64, ptr %t2480, i64 0
  store i64 %a0, ptr %t2481
  %t2482 = getelementptr i64, ptr %t2480, i64 1
  store i64 %a1, ptr %t2482
  %t2483 = getelementptr i64, ptr %t2480, i64 2
  store i64 %a2, ptr %t2483
  %t2484 = getelementptr i64, ptr %t2480, i64 3
  store i64 %a3, ptr %t2484
  %t2485 = getelementptr i64, ptr %t2480, i64 4
  store i64 %a4, ptr %t2485
  %t2486 = getelementptr i64, ptr %t2480, i64 5
  store i64 %a5, ptr %t2486
  %t2487 = getelementptr i64, ptr %t2480, i64 6
  store i64 %a6, ptr %t2487
  %t2488 = getelementptr i64, ptr %t2480, i64 7
  store i64 %a7, ptr %t2488
  %t2489 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2480, ptr %overflow)
  %t2490 = call i64 @rt_null_p(i64 %t2489)
  %t2491 = icmp ne i64 %t2490, 1
  br i1 %t2491, label %then700, label %else701
then700:
  %t2492 = call ptr @rt_alloc_words(i64 1)
  %t2493 = ptrtoint ptr %t2492 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_562" to i64), ptr %t2492
  %t2494 = or i64 %t2493, 4
  br label %merge702
else701:
  %t2495 = call i64 @rt_car(i64 %t2489)
  br label %merge702
merge702:
  %t2496 = phi i64 [ %t2494, %then700 ], [ %t2495, %else701 ]
  %t2497 = call i64 @rt_make_vector(i64 8, i64 0)
  %t2498 = call i64 @rt_null_p(i64 %t2489)
  %t2499 = icmp ne i64 %t2498, 1
  br i1 %t2499, label %then703, label %else704
then703:
  %t2500 = call ptr @rt_alloc_words(i64 1)
  %t2501 = ptrtoint ptr %t2500 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_564" to i64), ptr %t2500
  %t2502 = or i64 %t2501, 4
  br label %merge705
else704:
  %t2503 = call i64 @rt_car(i64 %t2489)
  br label %merge705
merge705:
  %t2504 = phi i64 [ %t2502, %then703 ], [ %t2503, %else704 ]
  %t2505 = and i64 %t2504, -8
  %t2506 = inttoptr i64 %t2505 to ptr
  %t2507 = load i64, ptr %t2506
  %t2508 = inttoptr i64 %t2507 to ptr
  %t2509 = call fastcc i64%t2508(i64 %t2504, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2510 = call i64 @rt_vector_set(i64 %t2497, i64 0, i64 %t2509)
  %t2511 = call ptr @rt_alloc_words(i64 3)
  %t2512 = ptrtoint ptr %t2511 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_566" to i64), ptr %t2511
  %t2513 = getelementptr i64, ptr %t2511, i64 1
  store i64 %t2497, ptr %t2513
  %t2514 = getelementptr i64, ptr %t2511, i64 2
  store i64 %t2496, ptr %t2514
  %t2515 = or i64 %t2512, 4
  ret i64 %t2515
}

define fastcc i64 @"scheme.base:code_578"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2520 = icmp eq i64 %argc, 1
  br i1 %t2520, label %argok707, label %arityerr706
arityerr706:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok707:
  %t2521 = and i64 %a0, -8
  %t2522 = inttoptr i64 %t2521 to ptr
  %t2523 = load i64, ptr %t2522
  %t2524 = inttoptr i64 %t2523 to ptr
  %t2525 = musttail call fastcc i64 %t2524(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2525
}

define fastcc i64 @"scheme.base:code_582"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2526 = icmp eq i64 %argc, 2
  br i1 %t2526, label %argok709, label %arityerr708
arityerr708:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok709:
  %t2527 = and i64 %a0, -8
  %t2528 = inttoptr i64 %t2527 to ptr
  %t2529 = load i64, ptr %t2528
  %t2530 = inttoptr i64 %t2529 to ptr
  %t2531 = musttail call fastcc i64 %t2530(i64 %a0, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2531
}

define fastcc i64 @"scheme.base:code_580"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2532 = icmp eq i64 %argc, 0
  br i1 %t2532, label %argok711, label %arityerr710
arityerr710:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok711:
  %t2533 = call ptr @rt_alloc_words(i64 1)
  %t2534 = ptrtoint ptr %t2533 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_582" to i64), ptr %t2533
  %t2535 = or i64 %t2534, 4
  %t2536 = and i64 %self, -8
  %t2537 = inttoptr i64 %t2536 to ptr
  %t2538 = getelementptr i64, ptr %t2537, i64 1
  %t2539 = load i64, ptr %t2538
  %t2540 = and i64 %self, -8
  %t2541 = inttoptr i64 %t2540 to ptr
  %t2542 = getelementptr i64, ptr %t2541, i64 2
  %t2543 = load i64, ptr %t2542
  %t2544 = load i64, ptr @"scheme.base:for-each"
  %t2545 = and i64 %t2544, -8
  %t2546 = inttoptr i64 %t2545 to ptr
  %t2547 = load i64, ptr %t2546
  %t2548 = inttoptr i64 %t2547 to ptr
  %t2549 = musttail call fastcc i64 %t2548(i64 %t2544, i64 3, i64 %t2535, i64 %t2539, i64 %t2543, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2549
}

define fastcc i64 @"scheme.base:code_586"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2550 = icmp eq i64 %argc, 2
  br i1 %t2550, label %argok713, label %arityerr712
arityerr712:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok713:
  %t2551 = and i64 %a0, -8
  %t2552 = inttoptr i64 %t2551 to ptr
  %t2553 = load i64, ptr %t2552
  %t2554 = inttoptr i64 %t2553 to ptr
  %t2555 = musttail call fastcc i64 %t2554(i64 %a0, i64 2, i64 %a1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2555
}

define fastcc i64 @"scheme.base:code_584"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2556 = icmp eq i64 %argc, 0
  br i1 %t2556, label %argok715, label %arityerr714
arityerr714:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok715:
  %t2557 = call ptr @rt_alloc_words(i64 1)
  %t2558 = ptrtoint ptr %t2557 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_586" to i64), ptr %t2557
  %t2559 = or i64 %t2558, 4
  %t2560 = and i64 %self, -8
  %t2561 = inttoptr i64 %t2560 to ptr
  %t2562 = getelementptr i64, ptr %t2561, i64 1
  %t2563 = load i64, ptr %t2562
  %t2564 = and i64 %self, -8
  %t2565 = inttoptr i64 %t2564 to ptr
  %t2566 = getelementptr i64, ptr %t2565, i64 2
  %t2567 = load i64, ptr %t2566
  %t2568 = load i64, ptr @"scheme.base:for-each"
  %t2569 = and i64 %t2568, -8
  %t2570 = inttoptr i64 %t2569 to ptr
  %t2571 = load i64, ptr %t2570
  %t2572 = inttoptr i64 %t2571 to ptr
  %t2573 = musttail call fastcc i64 %t2572(i64 %t2568, i64 3, i64 %t2559, i64 %t2563, i64 %t2567, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2573
}

define fastcc i64 @"scheme.base:code:with-parameters"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2574 = icmp eq i64 %argc, 3
  br i1 %t2574, label %argok717, label %arityerr716
arityerr716:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok717:
  %t2575 = call ptr @rt_alloc_words(i64 1)
  %t2576 = ptrtoint ptr %t2575 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_578" to i64), ptr %t2575
  %t2577 = or i64 %t2576, 4
  %t2578 = load i64, ptr @"scheme.base:map"
  %t2579 = and i64 %t2578, -8
  %t2580 = inttoptr i64 %t2579 to ptr
  %t2581 = load i64, ptr %t2580
  %t2582 = inttoptr i64 %t2581 to ptr
  %t2583 = call fastcc i64%t2582(i64 %t2578, i64 2, i64 %t2577, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2584 = call ptr @rt_alloc_words(i64 3)
  %t2585 = ptrtoint ptr %t2584 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_580" to i64), ptr %t2584
  %t2586 = getelementptr i64, ptr %t2584, i64 1
  store i64 %a0, ptr %t2586
  %t2587 = getelementptr i64, ptr %t2584, i64 2
  store i64 %a1, ptr %t2587
  %t2588 = or i64 %t2585, 4
  %t2589 = call ptr @rt_alloc_words(i64 3)
  %t2590 = ptrtoint ptr %t2589 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_584" to i64), ptr %t2589
  %t2591 = getelementptr i64, ptr %t2589, i64 1
  store i64 %a0, ptr %t2591
  %t2592 = getelementptr i64, ptr %t2589, i64 2
  store i64 %t2583, ptr %t2592
  %t2593 = or i64 %t2590, 4
  %t2594 = load i64, ptr @"scheme.base:dynamic-wind"
  %t2595 = and i64 %t2594, -8
  %t2596 = inttoptr i64 %t2595 to ptr
  %t2597 = load i64, ptr %t2596
  %t2598 = inttoptr i64 %t2597 to ptr
  %t2599 = musttail call fastcc i64 %t2598(i64 %t2594, i64 3, i64 %t2588, i64 %a2, i64 %t2593, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2599
}

define fastcc i64 @"scheme.base:code_594"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2604 = icmp eq i64 %argc, 2
  br i1 %t2604, label %argok719, label %arityerr718
arityerr718:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok719:
  %t2605 = call i64 @rt_null_p(i64 %a0)
  %t2606 = icmp ne i64 %t2605, 1
  br i1 %t2606, label %then720, label %else721
then720:
  %t2607 = and i64 %self, -8
  %t2608 = inttoptr i64 %t2607 to ptr
  %t2609 = getelementptr i64, ptr %t2608, i64 1
  %t2610 = load i64, ptr %t2609
  ret i64 %t2610
else721:
  %t2611 = and i64 %self, -8
  %t2612 = inttoptr i64 %t2611 to ptr
  %t2613 = getelementptr i64, ptr %t2612, i64 1
  %t2614 = load i64, ptr %t2613
  %t2615 = call i64 @rt_car(i64 %a0)
  %t2616 = call i64 @rt_vector_set(i64 %t2614, i64 %a1, i64 %t2615)
  %t2617 = call i64 @rt_cdr(i64 %a0)
  %t2618 = or i64 %a1, 8
  %t2619 = and i64 %t2618, 7
  %t2620 = icmp eq i64 %t2619, 0
  br i1 %t2620, label %fixfast722, label %fixslow723
fixfast722:
  %t2621 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t2622 = extractvalue {i64, i1} %t2621, 0
  %t2623 = extractvalue {i64, i1} %t2621, 1
  br i1 %t2623, label %fixslow723, label %fixmerge724
fixslow723:
  %t2624 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge724
fixmerge724:
  %t2625 = phi i64 [ %t2622, %fixfast722 ], [ %t2624, %fixslow723 ]
  %t2626 = musttail call fastcc i64 @"scheme.base:code_594"(i64 %self, i64 2, i64 %t2617, i64 %t2625, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2626
}

define fastcc i64 @"scheme.base:code:list->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2627 = icmp eq i64 %argc, 1
  br i1 %t2627, label %argok726, label %arityerr725
arityerr725:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok726:
  %t2628 = load i64, ptr @"scheme.base:length"
  %t2629 = and i64 %t2628, -8
  %t2630 = inttoptr i64 %t2629 to ptr
  %t2631 = load i64, ptr %t2630
  %t2632 = inttoptr i64 %t2631 to ptr
  %t2633 = call fastcc i64%t2632(i64 %t2628, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2634 = call i64 @rt_make_vector(i64 %t2633, i64 0)
  %t2635 = call ptr @rt_alloc_words(i64 3)
  %t2636 = ptrtoint ptr %t2635 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_594" to i64), ptr %t2635
  %t2637 = or i64 %t2636, 4
  %t2638 = getelementptr i64, ptr %t2635, i64 1
  store i64 %t2634, ptr %t2638
  %t2639 = getelementptr i64, ptr %t2635, i64 2
  store i64 %t2637, ptr %t2639
  %t2640 = musttail call fastcc i64 @"scheme.base:code_594"(i64 %t2637, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2640
}

define fastcc i64 @"scheme.base:code:vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2645 = icmp sge i64 %argc, 0
  br i1 %t2645, label %argok728, label %arityerr727
arityerr727:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok728:
  %t2646 = call ptr @rt_alloc_words(i64 8)
  %t2647 = getelementptr i64, ptr %t2646, i64 0
  store i64 %a0, ptr %t2647
  %t2648 = getelementptr i64, ptr %t2646, i64 1
  store i64 %a1, ptr %t2648
  %t2649 = getelementptr i64, ptr %t2646, i64 2
  store i64 %a2, ptr %t2649
  %t2650 = getelementptr i64, ptr %t2646, i64 3
  store i64 %a3, ptr %t2650
  %t2651 = getelementptr i64, ptr %t2646, i64 4
  store i64 %a4, ptr %t2651
  %t2652 = getelementptr i64, ptr %t2646, i64 5
  store i64 %a5, ptr %t2652
  %t2653 = getelementptr i64, ptr %t2646, i64 6
  store i64 %a6, ptr %t2653
  %t2654 = getelementptr i64, ptr %t2646, i64 7
  store i64 %a7, ptr %t2654
  %t2655 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2646, ptr %overflow)
  %t2656 = load i64, ptr @"scheme.base:list->vector"
  %t2657 = and i64 %t2656, -8
  %t2658 = inttoptr i64 %t2657 to ptr
  %t2659 = load i64, ptr %t2658
  %t2660 = inttoptr i64 %t2659 to ptr
  %t2661 = musttail call fastcc i64 %t2660(i64 %t2656, i64 1, i64 %t2655, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2661
}

define fastcc i64 @"scheme.base:code_604"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2666 = icmp eq i64 %argc, 2
  br i1 %t2666, label %argok730, label %arityerr729
arityerr729:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok730:
  %t2667 = call i64 @rt_null_p(i64 %a0)
  %t2668 = icmp ne i64 %t2667, 1
  br i1 %t2668, label %then731, label %else732
then731:
  %t2669 = and i64 %self, -8
  %t2670 = inttoptr i64 %t2669 to ptr
  %t2671 = getelementptr i64, ptr %t2670, i64 1
  %t2672 = load i64, ptr %t2671
  ret i64 %t2672
else732:
  %t2673 = and i64 %self, -8
  %t2674 = inttoptr i64 %t2673 to ptr
  %t2675 = getelementptr i64, ptr %t2674, i64 1
  %t2676 = load i64, ptr %t2675
  %t2677 = call i64 @rt_car(i64 %a0)
  %t2678 = call i64 @rt_bytevector_u8_set(i64 %t2676, i64 %a1, i64 %t2677)
  %t2679 = call i64 @rt_cdr(i64 %a0)
  %t2680 = or i64 %a1, 8
  %t2681 = and i64 %t2680, 7
  %t2682 = icmp eq i64 %t2681, 0
  br i1 %t2682, label %fixfast733, label %fixslow734
fixfast733:
  %t2683 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t2684 = extractvalue {i64, i1} %t2683, 0
  %t2685 = extractvalue {i64, i1} %t2683, 1
  br i1 %t2685, label %fixslow734, label %fixmerge735
fixslow734:
  %t2686 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge735
fixmerge735:
  %t2687 = phi i64 [ %t2684, %fixfast733 ], [ %t2686, %fixslow734 ]
  %t2688 = musttail call fastcc i64 @"scheme.base:code_604"(i64 %self, i64 2, i64 %t2679, i64 %t2687, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2688
}

define fastcc i64 @"scheme.base:code:list->bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2689 = icmp eq i64 %argc, 1
  br i1 %t2689, label %argok737, label %arityerr736
arityerr736:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok737:
  %t2690 = load i64, ptr @"scheme.base:length"
  %t2691 = and i64 %t2690, -8
  %t2692 = inttoptr i64 %t2691 to ptr
  %t2693 = load i64, ptr %t2692
  %t2694 = inttoptr i64 %t2693 to ptr
  %t2695 = call fastcc i64%t2694(i64 %t2690, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2696 = call i64 @rt_make_bytevector(i64 %t2695, i64 0)
  %t2697 = call ptr @rt_alloc_words(i64 3)
  %t2698 = ptrtoint ptr %t2697 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_604" to i64), ptr %t2697
  %t2699 = or i64 %t2698, 4
  %t2700 = getelementptr i64, ptr %t2697, i64 1
  store i64 %t2696, ptr %t2700
  %t2701 = getelementptr i64, ptr %t2697, i64 2
  store i64 %t2699, ptr %t2701
  %t2702 = musttail call fastcc i64 @"scheme.base:code_604"(i64 %t2699, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2702
}

define fastcc i64 @"scheme.base:code:bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2707 = icmp sge i64 %argc, 0
  br i1 %t2707, label %argok739, label %arityerr738
arityerr738:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok739:
  %t2708 = call ptr @rt_alloc_words(i64 8)
  %t2709 = getelementptr i64, ptr %t2708, i64 0
  store i64 %a0, ptr %t2709
  %t2710 = getelementptr i64, ptr %t2708, i64 1
  store i64 %a1, ptr %t2710
  %t2711 = getelementptr i64, ptr %t2708, i64 2
  store i64 %a2, ptr %t2711
  %t2712 = getelementptr i64, ptr %t2708, i64 3
  store i64 %a3, ptr %t2712
  %t2713 = getelementptr i64, ptr %t2708, i64 4
  store i64 %a4, ptr %t2713
  %t2714 = getelementptr i64, ptr %t2708, i64 5
  store i64 %a5, ptr %t2714
  %t2715 = getelementptr i64, ptr %t2708, i64 6
  store i64 %a6, ptr %t2715
  %t2716 = getelementptr i64, ptr %t2708, i64 7
  store i64 %a7, ptr %t2716
  %t2717 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2708, ptr %overflow)
  %t2718 = load i64, ptr @"scheme.base:list->bytevector"
  %t2719 = and i64 %t2718, -8
  %t2720 = inttoptr i64 %t2719 to ptr
  %t2721 = load i64, ptr %t2720
  %t2722 = inttoptr i64 %t2721 to ptr
  %t2723 = musttail call fastcc i64 %t2722(i64 %t2718, i64 1, i64 %t2717, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2723
}

define fastcc i64 @"scheme.base:code:values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2728 = icmp sge i64 %argc, 0
  br i1 %t2728, label %argok741, label %arityerr740
arityerr740:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok741:
  %t2729 = call ptr @rt_alloc_words(i64 8)
  %t2730 = getelementptr i64, ptr %t2729, i64 0
  store i64 %a0, ptr %t2730
  %t2731 = getelementptr i64, ptr %t2729, i64 1
  store i64 %a1, ptr %t2731
  %t2732 = getelementptr i64, ptr %t2729, i64 2
  store i64 %a2, ptr %t2732
  %t2733 = getelementptr i64, ptr %t2729, i64 3
  store i64 %a3, ptr %t2733
  %t2734 = getelementptr i64, ptr %t2729, i64 4
  store i64 %a4, ptr %t2734
  %t2735 = getelementptr i64, ptr %t2729, i64 5
  store i64 %a5, ptr %t2735
  %t2736 = getelementptr i64, ptr %t2729, i64 6
  store i64 %a6, ptr %t2736
  %t2737 = getelementptr i64, ptr %t2729, i64 7
  store i64 %a7, ptr %t2737
  %t2738 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2729, ptr %overflow)
  %t2739 = call i64 @rt_pair_p(i64 %t2738)
  %t2740 = icmp ne i64 %t2739, 1
  br i1 %t2740, label %then742, label %else743
then742:
  %t2741 = call i64 @rt_cdr(i64 %t2738)
  %t2742 = call i64 @rt_null_p(i64 %t2741)
  br label %merge744
else743:
  br label %merge744
merge744:
  %t2743 = phi i64 [ %t2742, %then742 ], [ 1, %else743 ]
  %t2744 = icmp ne i64 %t2743, 1
  br i1 %t2744, label %then745, label %else746
then745:
  %t2745 = call i64 @rt_car(i64 %t2738)
  ret i64 %t2745
else746:
  %t2746 = call i64 @rt_list_to_mv(i64 %t2738)
  ret i64 %t2746
}

define fastcc i64 @"scheme.base:code:call-with-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2751 = icmp eq i64 %argc, 2
  br i1 %t2751, label %argok748, label %arityerr747
arityerr747:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok748:
  %t2752 = and i64 %a0, -8
  %t2753 = inttoptr i64 %t2752 to ptr
  %t2754 = load i64, ptr %t2753
  %t2755 = inttoptr i64 %t2754 to ptr
  %t2756 = call fastcc i64%t2755(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2757 = call i64 @rt_mv_p(i64 %t2756)
  %t2758 = icmp ne i64 %t2757, 1
  br i1 %t2758, label %then749, label %else750
then749:
  %t2759 = call i64 @rt_mv_to_list(i64 %t2756)
  %t2760 = and i64 %a1, -8
  %t2761 = inttoptr i64 %t2760 to ptr
  %t2762 = load i64, ptr %t2761
  %t2763 = inttoptr i64 %t2762 to ptr
  %t2764 = call i64 @rt_list_length(i64 %t2759)
  %t2765 = add i64 0, %t2764
  %t2766 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t2759, i64 8)
  %t2778 = getelementptr i64, ptr %t2766, i64 0
  %t2770 = load i64, ptr %t2778
  %t2779 = getelementptr i64, ptr %t2766, i64 1
  %t2771 = load i64, ptr %t2779
  %t2780 = getelementptr i64, ptr %t2766, i64 2
  %t2772 = load i64, ptr %t2780
  %t2781 = getelementptr i64, ptr %t2766, i64 3
  %t2773 = load i64, ptr %t2781
  %t2782 = getelementptr i64, ptr %t2766, i64 4
  %t2774 = load i64, ptr %t2782
  %t2783 = getelementptr i64, ptr %t2766, i64 5
  %t2775 = load i64, ptr %t2783
  %t2784 = getelementptr i64, ptr %t2766, i64 6
  %t2776 = load i64, ptr %t2784
  %t2785 = getelementptr i64, ptr %t2766, i64 7
  %t2777 = load i64, ptr %t2785
  %t2767 = icmp sgt i64 %t2765, 8
  %t2768 = getelementptr i64, ptr %t2766, i64 8
  %t2769 = select i1 %t2767, ptr %t2768, ptr null
  %t2786 = musttail call fastcc i64 %t2763(i64 %a1, i64 %t2765, i64 %t2770, i64 %t2771, i64 %t2772, i64 %t2773, i64 %t2774, i64 %t2775, i64 %t2776, i64 %t2777, ptr %t2769)
  ret i64 %t2786
else750:
  %t2787 = and i64 %a1, -8
  %t2788 = inttoptr i64 %t2787 to ptr
  %t2789 = load i64, ptr %t2788
  %t2790 = inttoptr i64 %t2789 to ptr
  %t2791 = musttail call fastcc i64 %t2790(i64 %a1, i64 1, i64 %t2756, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2791
}

define fastcc i64 @"scheme.base:code:make-hash-table"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2798 = icmp eq i64 %argc, 0
  br i1 %t2798, label %argok752, label %arityerr751
arityerr751:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok752:
  %t2799 = load i64, ptr @"scheme.base:%ht-initial-buckets"
  %t2800 = call i64 @rt_make_vector(i64 %t2799, i64 2)
  %t2801 = load i64, ptr @"scheme.base:vector"
  %t2802 = and i64 %t2801, -8
  %t2803 = inttoptr i64 %t2802 to ptr
  %t2804 = load i64, ptr %t2803
  %t2805 = inttoptr i64 %t2804 to ptr
  %t2806 = call fastcc i64%t2805(i64 %t2801, i64 3, i64 0, i64 %t2800, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2807 = call i64 @rt_make_hash_table(i64 %t2806)
  ret i64 %t2807
}

define fastcc i64 @"scheme.base:code:hash-table?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2812 = icmp eq i64 %argc, 1
  br i1 %t2812, label %argok754, label %arityerr753
arityerr753:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok754:
  %t2813 = call i64 @rt_hash_table_p(i64 %a0)
  ret i64 %t2813
}

define fastcc i64 @"scheme.base:code:%ht-count"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2818 = icmp eq i64 %argc, 1
  br i1 %t2818, label %argok756, label %arityerr755
arityerr755:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok756:
  %t2819 = call i64 @rt_hash_table_spine(i64 %a0)
  %t2820 = call i64 @rt_vector_ref(i64 %t2819, i64 0)
  ret i64 %t2820
}

define fastcc i64 @"scheme.base:code:%ht-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2825 = icmp eq i64 %argc, 1
  br i1 %t2825, label %argok758, label %arityerr757
arityerr757:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok758:
  %t2826 = call i64 @rt_hash_table_spine(i64 %a0)
  %t2827 = call i64 @rt_vector_ref(i64 %t2826, i64 8)
  ret i64 %t2827
}

define fastcc i64 @"scheme.base:code:%ht-set-count!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2832 = icmp eq i64 %argc, 2
  br i1 %t2832, label %argok760, label %arityerr759
arityerr759:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok760:
  %t2833 = call i64 @rt_hash_table_spine(i64 %a0)
  %t2834 = call i64 @rt_vector_set(i64 %t2833, i64 0, i64 %a1)
  ret i64 %t2834
}

define fastcc i64 @"scheme.base:code:%ht-set-buckets!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2839 = icmp eq i64 %argc, 2
  br i1 %t2839, label %argok762, label %arityerr761
arityerr761:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok762:
  %t2840 = call i64 @rt_hash_table_spine(i64 %a0)
  %t2841 = call i64 @rt_vector_set(i64 %t2840, i64 8, i64 %a1)
  ret i64 %t2841
}

define fastcc i64 @"scheme.base:code:%ht-index"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2846 = icmp eq i64 %argc, 2
  br i1 %t2846, label %argok764, label %arityerr763
arityerr763:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok764:
  %t2847 = call i64 @rt_hash(i64 %a0)
  %t2848 = call i64 @rt_remainder(i64 %t2847, i64 %a1)
  ret i64 %t2848
}

define fastcc i64 @"scheme.base:code:%ht-assoc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2853 = icmp eq i64 %argc, 2
  br i1 %t2853, label %argok766, label %arityerr765
arityerr765:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok766:
  %t2854 = call i64 @rt_null_p(i64 %a1)
  %t2855 = icmp ne i64 %t2854, 1
  br i1 %t2855, label %then767, label %else768
then767:
  ret i64 1
else768:
  %t2856 = call i64 @rt_car(i64 %a1)
  %t2857 = call i64 @rt_car(i64 %t2856)
  %t2858 = call i64 @rt_equal(i64 %a0, i64 %t2857)
  %t2859 = icmp ne i64 %t2858, 1
  br i1 %t2859, label %then769, label %else770
then769:
  %t2860 = call i64 @rt_car(i64 %a1)
  ret i64 %t2860
else770:
  %t2861 = call i64 @rt_cdr(i64 %a1)
  %t2862 = load i64, ptr @"scheme.base:%ht-assoc"
  %t2863 = and i64 %t2862, -8
  %t2864 = inttoptr i64 %t2863 to ptr
  %t2865 = load i64, ptr %t2864
  %t2866 = inttoptr i64 %t2865 to ptr
  %t2867 = musttail call fastcc i64 %t2866(i64 %t2862, i64 2, i64 %a0, i64 %t2861, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2867
}

define fastcc i64 @"scheme.base:code:%ht-remove"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2872 = icmp eq i64 %argc, 2
  br i1 %t2872, label %argok772, label %arityerr771
arityerr771:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok772:
  %t2873 = call i64 @rt_null_p(i64 %a1)
  %t2874 = icmp ne i64 %t2873, 1
  br i1 %t2874, label %then773, label %else774
then773:
  ret i64 2
else774:
  %t2875 = call i64 @rt_car(i64 %a1)
  %t2876 = call i64 @rt_car(i64 %t2875)
  %t2877 = call i64 @rt_equal(i64 %a0, i64 %t2876)
  %t2878 = icmp ne i64 %t2877, 1
  br i1 %t2878, label %then775, label %else776
then775:
  %t2879 = call i64 @rt_cdr(i64 %a1)
  ret i64 %t2879
else776:
  %t2880 = call i64 @rt_car(i64 %a1)
  %t2881 = call i64 @rt_cdr(i64 %a1)
  %t2882 = load i64, ptr @"scheme.base:%ht-remove"
  %t2883 = and i64 %t2882, -8
  %t2884 = inttoptr i64 %t2883 to ptr
  %t2885 = load i64, ptr %t2884
  %t2886 = inttoptr i64 %t2885 to ptr
  %t2887 = call fastcc i64%t2886(i64 %t2882, i64 2, i64 %a0, i64 %t2881, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2888 = call i64 @rt_cons(i64 %t2880, i64 %t2887)
  ret i64 %t2888
}

define fastcc i64 @"scheme.base:code:hash-table-ref/default"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2893 = icmp eq i64 %argc, 3
  br i1 %t2893, label %argok778, label %arityerr777
arityerr777:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok778:
  %t2894 = load i64, ptr @"scheme.base:%ht-buckets"
  %t2895 = and i64 %t2894, -8
  %t2896 = inttoptr i64 %t2895 to ptr
  %t2897 = load i64, ptr %t2896
  %t2898 = inttoptr i64 %t2897 to ptr
  %t2899 = call fastcc i64%t2898(i64 %t2894, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2900 = call i64 @rt_vector_length(i64 %t2899)
  %t2901 = load i64, ptr @"scheme.base:%ht-index"
  %t2902 = and i64 %t2901, -8
  %t2903 = inttoptr i64 %t2902 to ptr
  %t2904 = load i64, ptr %t2903
  %t2905 = inttoptr i64 %t2904 to ptr
  %t2906 = call fastcc i64%t2905(i64 %t2901, i64 2, i64 %a1, i64 %t2900, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2907 = call i64 @rt_vector_ref(i64 %t2899, i64 %t2906)
  %t2908 = load i64, ptr @"scheme.base:%ht-assoc"
  %t2909 = and i64 %t2908, -8
  %t2910 = inttoptr i64 %t2909 to ptr
  %t2911 = load i64, ptr %t2910
  %t2912 = inttoptr i64 %t2911 to ptr
  %t2913 = call fastcc i64%t2912(i64 %t2908, i64 2, i64 %a1, i64 %t2907, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2914 = icmp ne i64 %t2913, 1
  br i1 %t2914, label %then779, label %else780
then779:
  %t2915 = call i64 @rt_cdr(i64 %t2913)
  ret i64 %t2915
else780:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:hash-table-contains?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2920 = icmp eq i64 %argc, 2
  br i1 %t2920, label %argok782, label %arityerr781
arityerr781:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok782:
  %t2921 = load i64, ptr @"scheme.base:%ht-buckets"
  %t2922 = and i64 %t2921, -8
  %t2923 = inttoptr i64 %t2922 to ptr
  %t2924 = load i64, ptr %t2923
  %t2925 = inttoptr i64 %t2924 to ptr
  %t2926 = call fastcc i64%t2925(i64 %t2921, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2927 = call i64 @rt_vector_length(i64 %t2926)
  %t2928 = load i64, ptr @"scheme.base:%ht-index"
  %t2929 = and i64 %t2928, -8
  %t2930 = inttoptr i64 %t2929 to ptr
  %t2931 = load i64, ptr %t2930
  %t2932 = inttoptr i64 %t2931 to ptr
  %t2933 = call fastcc i64%t2932(i64 %t2928, i64 2, i64 %a1, i64 %t2927, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2934 = call i64 @rt_vector_ref(i64 %t2926, i64 %t2933)
  %t2935 = load i64, ptr @"scheme.base:%ht-assoc"
  %t2936 = and i64 %t2935, -8
  %t2937 = inttoptr i64 %t2936 to ptr
  %t2938 = load i64, ptr %t2937
  %t2939 = inttoptr i64 %t2938 to ptr
  %t2940 = call fastcc i64%t2939(i64 %t2935, i64 2, i64 %a1, i64 %t2934, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2941 = icmp ne i64 %t2940, 1
  br i1 %t2941, label %then783, label %else784
then783:
  ret i64 257
else784:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-ref"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2946 = icmp eq i64 %argc, 2
  br i1 %t2946, label %argok786, label %arityerr785
arityerr785:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok786:
  %t2947 = load i64, ptr @"scheme.base:%ht-buckets"
  %t2948 = and i64 %t2947, -8
  %t2949 = inttoptr i64 %t2948 to ptr
  %t2950 = load i64, ptr %t2949
  %t2951 = inttoptr i64 %t2950 to ptr
  %t2952 = call fastcc i64%t2951(i64 %t2947, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2953 = call i64 @rt_vector_length(i64 %t2952)
  %t2954 = load i64, ptr @"scheme.base:%ht-index"
  %t2955 = and i64 %t2954, -8
  %t2956 = inttoptr i64 %t2955 to ptr
  %t2957 = load i64, ptr %t2956
  %t2958 = inttoptr i64 %t2957 to ptr
  %t2959 = call fastcc i64%t2958(i64 %t2954, i64 2, i64 %a1, i64 %t2953, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2960 = call i64 @rt_vector_ref(i64 %t2952, i64 %t2959)
  %t2961 = load i64, ptr @"scheme.base:%ht-assoc"
  %t2962 = and i64 %t2961, -8
  %t2963 = inttoptr i64 %t2962 to ptr
  %t2964 = load i64, ptr %t2963
  %t2965 = inttoptr i64 %t2964 to ptr
  %t2966 = call fastcc i64%t2965(i64 %t2961, i64 2, i64 %a1, i64 %t2960, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2967 = icmp ne i64 %t2966, 1
  br i1 %t2967, label %then787, label %else788
then787:
  %t2968 = call i64 @rt_cdr(i64 %t2966)
  ret i64 %t2968
else788:
  %t2969 = call i64 @rt_make_string(ptr @.str.lit.12, i64 29)
  %t2970 = load i64, ptr @"scheme.base:error"
  %t2971 = and i64 %t2970, -8
  %t2972 = inttoptr i64 %t2971 to ptr
  %t2973 = load i64, ptr %t2972
  %t2974 = inttoptr i64 %t2973 to ptr
  %t2975 = musttail call fastcc i64 %t2974(i64 %t2970, i64 2, i64 %t2969, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2975
}

define fastcc i64 @"scheme.base:code:hash-table-set!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2980 = icmp eq i64 %argc, 3
  br i1 %t2980, label %argok790, label %arityerr789
arityerr789:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok790:
  %t2981 = load i64, ptr @"scheme.base:%ht-buckets"
  %t2982 = and i64 %t2981, -8
  %t2983 = inttoptr i64 %t2982 to ptr
  %t2984 = load i64, ptr %t2983
  %t2985 = inttoptr i64 %t2984 to ptr
  %t2986 = call fastcc i64%t2985(i64 %t2981, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2987 = call i64 @rt_vector_length(i64 %t2986)
  %t2988 = load i64, ptr @"scheme.base:%ht-index"
  %t2989 = and i64 %t2988, -8
  %t2990 = inttoptr i64 %t2989 to ptr
  %t2991 = load i64, ptr %t2990
  %t2992 = inttoptr i64 %t2991 to ptr
  %t2993 = call fastcc i64%t2992(i64 %t2988, i64 2, i64 %a1, i64 %t2987, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2994 = call i64 @rt_vector_ref(i64 %t2986, i64 %t2993)
  %t2995 = load i64, ptr @"scheme.base:%ht-assoc"
  %t2996 = and i64 %t2995, -8
  %t2997 = inttoptr i64 %t2996 to ptr
  %t2998 = load i64, ptr %t2997
  %t2999 = inttoptr i64 %t2998 to ptr
  %t3000 = call fastcc i64%t2999(i64 %t2995, i64 2, i64 %a1, i64 %t2994, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3001 = call i64 @rt_cons(i64 %a1, i64 %a2)
  %t3002 = icmp ne i64 %t3000, 1
  br i1 %t3002, label %then791, label %else792
then791:
  %t3003 = load i64, ptr @"scheme.base:%ht-remove"
  %t3004 = and i64 %t3003, -8
  %t3005 = inttoptr i64 %t3004 to ptr
  %t3006 = load i64, ptr %t3005
  %t3007 = inttoptr i64 %t3006 to ptr
  %t3008 = call fastcc i64%t3007(i64 %t3003, i64 2, i64 %a1, i64 %t2994, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge793
else792:
  br label %merge793
merge793:
  %t3009 = phi i64 [ %t3008, %then791 ], [ %t2994, %else792 ]
  %t3010 = call i64 @rt_cons(i64 %t3001, i64 %t3009)
  %t3011 = call i64 @rt_vector_set(i64 %t2986, i64 %t2993, i64 %t3010)
  %t3012 = icmp ne i64 %t3000, 1
  br i1 %t3012, label %then794, label %else795
then794:
  ret i64 1
else795:
  %t3013 = load i64, ptr @"scheme.base:%ht-count"
  %t3014 = and i64 %t3013, -8
  %t3015 = inttoptr i64 %t3014 to ptr
  %t3016 = load i64, ptr %t3015
  %t3017 = inttoptr i64 %t3016 to ptr
  %t3018 = call fastcc i64%t3017(i64 %t3013, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3019 = or i64 %t3018, 8
  %t3020 = and i64 %t3019, 7
  %t3021 = icmp eq i64 %t3020, 0
  br i1 %t3021, label %fixfast796, label %fixslow797
fixfast796:
  %t3022 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3018, i64 8)
  %t3023 = extractvalue {i64, i1} %t3022, 0
  %t3024 = extractvalue {i64, i1} %t3022, 1
  br i1 %t3024, label %fixslow797, label %fixmerge798
fixslow797:
  %t3025 = call i64 @rt_add(i64 %t3018, i64 8)
  br label %fixmerge798
fixmerge798:
  %t3026 = phi i64 [ %t3023, %fixfast796 ], [ %t3025, %fixslow797 ]
  %t3027 = load i64, ptr @"scheme.base:%ht-set-count!"
  %t3028 = and i64 %t3027, -8
  %t3029 = inttoptr i64 %t3028 to ptr
  %t3030 = load i64, ptr %t3029
  %t3031 = inttoptr i64 %t3030 to ptr
  %t3032 = call fastcc i64%t3031(i64 %t3027, i64 2, i64 %a0, i64 %t3026, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3033 = load i64, ptr @"scheme.base:%ht-count"
  %t3034 = and i64 %t3033, -8
  %t3035 = inttoptr i64 %t3034 to ptr
  %t3036 = load i64, ptr %t3035
  %t3037 = inttoptr i64 %t3036 to ptr
  %t3038 = call fastcc i64%t3037(i64 %t3033, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3039 = load i64, ptr @"scheme.base:%ht-load-factor"
  %t3040 = or i64 %t3039, %t2987
  %t3041 = and i64 %t3040, 7
  %t3042 = icmp eq i64 %t3041, 0
  br i1 %t3042, label %fixfast799, label %fixslow800
fixfast799:
  %t3043 = ashr i64 %t3039, 3
  %t3044 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t3043, i64 %t2987)
  %t3045 = extractvalue {i64, i1} %t3044, 0
  %t3046 = extractvalue {i64, i1} %t3044, 1
  br i1 %t3046, label %fixslow800, label %fixmerge801
fixslow800:
  %t3047 = call i64 @rt_mul(i64 %t3039, i64 %t2987)
  br label %fixmerge801
fixmerge801:
  %t3048 = phi i64 [ %t3045, %fixfast799 ], [ %t3047, %fixslow800 ]
  %t3049 = or i64 %t3048, %t3038
  %t3050 = and i64 %t3049, 7
  %t3051 = icmp eq i64 %t3050, 0
  br i1 %t3051, label %fixfast802, label %fixslow803
fixfast802:
  %t3052 = icmp slt i64 %t3048, %t3038
  %t3053 = select i1 %t3052, i64 257, i64 1
  br label %fixmerge804
fixslow803:
  %t3054 = call i64 @rt_lt(i64 %t3048, i64 %t3038)
  br label %fixmerge804
fixmerge804:
  %t3055 = phi i64 [ %t3053, %fixfast802 ], [ %t3054, %fixslow803 ]
  %t3056 = icmp ne i64 %t3055, 1
  br i1 %t3056, label %then805, label %else806
then805:
  %t3057 = load i64, ptr @"scheme.base:%ht-grow!"
  %t3058 = and i64 %t3057, -8
  %t3059 = inttoptr i64 %t3058 to ptr
  %t3060 = load i64, ptr %t3059
  %t3061 = inttoptr i64 %t3060 to ptr
  %t3062 = musttail call fastcc i64 %t3061(i64 %t3057, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3062
else806:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-delete!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3067 = icmp eq i64 %argc, 2
  br i1 %t3067, label %argok808, label %arityerr807
arityerr807:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok808:
  %t3068 = load i64, ptr @"scheme.base:%ht-buckets"
  %t3069 = and i64 %t3068, -8
  %t3070 = inttoptr i64 %t3069 to ptr
  %t3071 = load i64, ptr %t3070
  %t3072 = inttoptr i64 %t3071 to ptr
  %t3073 = call fastcc i64%t3072(i64 %t3068, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3074 = call i64 @rt_vector_length(i64 %t3073)
  %t3075 = load i64, ptr @"scheme.base:%ht-index"
  %t3076 = and i64 %t3075, -8
  %t3077 = inttoptr i64 %t3076 to ptr
  %t3078 = load i64, ptr %t3077
  %t3079 = inttoptr i64 %t3078 to ptr
  %t3080 = call fastcc i64%t3079(i64 %t3075, i64 2, i64 %a1, i64 %t3074, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3081 = call i64 @rt_vector_ref(i64 %t3073, i64 %t3080)
  %t3082 = load i64, ptr @"scheme.base:%ht-assoc"
  %t3083 = and i64 %t3082, -8
  %t3084 = inttoptr i64 %t3083 to ptr
  %t3085 = load i64, ptr %t3084
  %t3086 = inttoptr i64 %t3085 to ptr
  %t3087 = call fastcc i64%t3086(i64 %t3082, i64 2, i64 %a1, i64 %t3081, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3088 = icmp ne i64 %t3087, 1
  br i1 %t3088, label %then809, label %else810
then809:
  %t3089 = load i64, ptr @"scheme.base:%ht-remove"
  %t3090 = and i64 %t3089, -8
  %t3091 = inttoptr i64 %t3090 to ptr
  %t3092 = load i64, ptr %t3091
  %t3093 = inttoptr i64 %t3092 to ptr
  %t3094 = call fastcc i64%t3093(i64 %t3089, i64 2, i64 %a1, i64 %t3081, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3095 = call i64 @rt_vector_set(i64 %t3073, i64 %t3080, i64 %t3094)
  %t3096 = load i64, ptr @"scheme.base:%ht-count"
  %t3097 = and i64 %t3096, -8
  %t3098 = inttoptr i64 %t3097 to ptr
  %t3099 = load i64, ptr %t3098
  %t3100 = inttoptr i64 %t3099 to ptr
  %t3101 = call fastcc i64%t3100(i64 %t3096, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3102 = or i64 %t3101, 8
  %t3103 = and i64 %t3102, 7
  %t3104 = icmp eq i64 %t3103, 0
  br i1 %t3104, label %fixfast811, label %fixslow812
fixfast811:
  %t3105 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3101, i64 8)
  %t3106 = extractvalue {i64, i1} %t3105, 0
  %t3107 = extractvalue {i64, i1} %t3105, 1
  br i1 %t3107, label %fixslow812, label %fixmerge813
fixslow812:
  %t3108 = call i64 @rt_sub(i64 %t3101, i64 8)
  br label %fixmerge813
fixmerge813:
  %t3109 = phi i64 [ %t3106, %fixfast811 ], [ %t3108, %fixslow812 ]
  %t3110 = load i64, ptr @"scheme.base:%ht-set-count!"
  %t3111 = and i64 %t3110, -8
  %t3112 = inttoptr i64 %t3111 to ptr
  %t3113 = load i64, ptr %t3112
  %t3114 = inttoptr i64 %t3113 to ptr
  %t3115 = musttail call fastcc i64 %t3114(i64 %t3110, i64 2, i64 %a0, i64 %t3109, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3115
else810:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_687"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3120 = icmp eq i64 %argc, 1
  br i1 %t3120, label %argok815, label %arityerr814
arityerr814:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok815:
  %t3121 = call i64 @rt_null_p(i64 %a0)
  %t3122 = icmp ne i64 %t3121, 1
  br i1 %t3122, label %then816, label %else817
then816:
  ret i64 1
else817:
  %t3123 = call i64 @rt_car(i64 %a0)
  %t3124 = call i64 @rt_car(i64 %t3123)
  %t3125 = and i64 %self, -8
  %t3126 = inttoptr i64 %t3125 to ptr
  %t3127 = getelementptr i64, ptr %t3126, i64 1
  %t3128 = load i64, ptr %t3127
  %t3129 = load i64, ptr @"scheme.base:%ht-index"
  %t3130 = and i64 %t3129, -8
  %t3131 = inttoptr i64 %t3130 to ptr
  %t3132 = load i64, ptr %t3131
  %t3133 = inttoptr i64 %t3132 to ptr
  %t3134 = call fastcc i64%t3133(i64 %t3129, i64 2, i64 %t3124, i64 %t3128, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3135 = and i64 %self, -8
  %t3136 = inttoptr i64 %t3135 to ptr
  %t3137 = getelementptr i64, ptr %t3136, i64 2
  %t3138 = load i64, ptr %t3137
  %t3139 = and i64 %self, -8
  %t3140 = inttoptr i64 %t3139 to ptr
  %t3141 = getelementptr i64, ptr %t3140, i64 2
  %t3142 = load i64, ptr %t3141
  %t3143 = call i64 @rt_vector_ref(i64 %t3142, i64 %t3134)
  %t3144 = call i64 @rt_cons(i64 %t3123, i64 %t3143)
  %t3145 = call i64 @rt_vector_set(i64 %t3138, i64 %t3134, i64 %t3144)
  %t3146 = call i64 @rt_cdr(i64 %a0)
  %t3147 = musttail call fastcc i64 @"scheme.base:code_687"(i64 %self, i64 1, i64 %t3146, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3147
}

define fastcc i64 @"scheme.base:code_685"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3148 = icmp eq i64 %argc, 1
  br i1 %t3148, label %argok819, label %arityerr818
arityerr818:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok819:
  %t3149 = and i64 %self, -8
  %t3150 = inttoptr i64 %t3149 to ptr
  %t3151 = getelementptr i64, ptr %t3150, i64 1
  %t3152 = load i64, ptr %t3151
  %t3153 = call i64 @rt_vector_length(i64 %t3152)
  %t3154 = or i64 %a0, %t3153
  %t3155 = and i64 %t3154, 7
  %t3156 = icmp eq i64 %t3155, 0
  br i1 %t3156, label %fixfast820, label %fixslow821
fixfast820:
  %t3157 = icmp slt i64 %a0, %t3153
  %t3158 = select i1 %t3157, i64 257, i64 1
  br label %fixmerge822
fixslow821:
  %t3159 = call i64 @rt_lt(i64 %a0, i64 %t3153)
  br label %fixmerge822
fixmerge822:
  %t3160 = phi i64 [ %t3158, %fixfast820 ], [ %t3159, %fixslow821 ]
  %t3161 = icmp ne i64 %t3160, 1
  br i1 %t3161, label %then823, label %else824
then823:
  %t3162 = call ptr @rt_alloc_words(i64 4)
  %t3163 = ptrtoint ptr %t3162 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_687" to i64), ptr %t3162
  %t3164 = or i64 %t3163, 4
  %t3165 = and i64 %self, -8
  %t3166 = inttoptr i64 %t3165 to ptr
  %t3167 = getelementptr i64, ptr %t3166, i64 2
  %t3168 = load i64, ptr %t3167
  %t3169 = getelementptr i64, ptr %t3162, i64 1
  store i64 %t3168, ptr %t3169
  %t3170 = and i64 %self, -8
  %t3171 = inttoptr i64 %t3170 to ptr
  %t3172 = getelementptr i64, ptr %t3171, i64 3
  %t3173 = load i64, ptr %t3172
  %t3174 = getelementptr i64, ptr %t3162, i64 2
  store i64 %t3173, ptr %t3174
  %t3175 = getelementptr i64, ptr %t3162, i64 3
  store i64 %t3164, ptr %t3175
  %t3176 = and i64 %self, -8
  %t3177 = inttoptr i64 %t3176 to ptr
  %t3178 = getelementptr i64, ptr %t3177, i64 1
  %t3179 = load i64, ptr %t3178
  %t3180 = call i64 @rt_vector_ref(i64 %t3179, i64 %a0)
  %t3181 = call fastcc i64 @"scheme.base:code_687"(i64 %t3164, i64 1, i64 %t3180, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3182 = or i64 %a0, 8
  %t3183 = and i64 %t3182, 7
  %t3184 = icmp eq i64 %t3183, 0
  br i1 %t3184, label %fixfast825, label %fixslow826
fixfast825:
  %t3185 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3186 = extractvalue {i64, i1} %t3185, 0
  %t3187 = extractvalue {i64, i1} %t3185, 1
  br i1 %t3187, label %fixslow826, label %fixmerge827
fixslow826:
  %t3188 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge827
fixmerge827:
  %t3189 = phi i64 [ %t3186, %fixfast825 ], [ %t3188, %fixslow826 ]
  %t3190 = musttail call fastcc i64 @"scheme.base:code_685"(i64 %self, i64 1, i64 %t3189, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3190
else824:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%ht-grow!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3191 = icmp eq i64 %argc, 1
  br i1 %t3191, label %argok829, label %arityerr828
arityerr828:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok829:
  %t3192 = load i64, ptr @"scheme.base:%ht-buckets"
  %t3193 = and i64 %t3192, -8
  %t3194 = inttoptr i64 %t3193 to ptr
  %t3195 = load i64, ptr %t3194
  %t3196 = inttoptr i64 %t3195 to ptr
  %t3197 = call fastcc i64%t3196(i64 %t3192, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3198 = call i64 @rt_vector_length(i64 %t3197)
  %t3199 = or i64 16, %t3198
  %t3200 = and i64 %t3199, 7
  %t3201 = icmp eq i64 %t3200, 0
  br i1 %t3201, label %fixfast830, label %fixslow831
fixfast830:
  %t3202 = ashr i64 16, 3
  %t3203 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t3202, i64 %t3198)
  %t3204 = extractvalue {i64, i1} %t3203, 0
  %t3205 = extractvalue {i64, i1} %t3203, 1
  br i1 %t3205, label %fixslow831, label %fixmerge832
fixslow831:
  %t3206 = call i64 @rt_mul(i64 16, i64 %t3198)
  br label %fixmerge832
fixmerge832:
  %t3207 = phi i64 [ %t3204, %fixfast830 ], [ %t3206, %fixslow831 ]
  %t3208 = call i64 @rt_make_vector(i64 %t3207, i64 2)
  %t3209 = call ptr @rt_alloc_words(i64 5)
  %t3210 = ptrtoint ptr %t3209 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_685" to i64), ptr %t3209
  %t3211 = or i64 %t3210, 4
  %t3212 = getelementptr i64, ptr %t3209, i64 1
  store i64 %t3197, ptr %t3212
  %t3213 = getelementptr i64, ptr %t3209, i64 2
  store i64 %t3207, ptr %t3213
  %t3214 = getelementptr i64, ptr %t3209, i64 3
  store i64 %t3208, ptr %t3214
  %t3215 = getelementptr i64, ptr %t3209, i64 4
  store i64 %t3211, ptr %t3215
  %t3216 = call fastcc i64 @"scheme.base:code_685"(i64 %t3211, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3217 = load i64, ptr @"scheme.base:%ht-set-buckets!"
  %t3218 = and i64 %t3217, -8
  %t3219 = inttoptr i64 %t3218 to ptr
  %t3220 = load i64, ptr %t3219
  %t3221 = inttoptr i64 %t3220 to ptr
  %t3222 = musttail call fastcc i64 %t3221(i64 %t3217, i64 2, i64 %a0, i64 %t3208, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3222
}

define fastcc i64 @"scheme.base:code:hash-table-size"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3227 = icmp eq i64 %argc, 1
  br i1 %t3227, label %argok834, label %arityerr833
arityerr833:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok834:
  %t3228 = load i64, ptr @"scheme.base:%ht-count"
  %t3229 = and i64 %t3228, -8
  %t3230 = inttoptr i64 %t3229 to ptr
  %t3231 = load i64, ptr %t3230
  %t3232 = inttoptr i64 %t3231 to ptr
  %t3233 = musttail call fastcc i64 %t3232(i64 %t3228, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3233
}

define fastcc i64 @"scheme.base:code:%ht-fold-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3238 = icmp eq i64 %argc, 2
  br i1 %t3238, label %argok836, label %arityerr835
arityerr835:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok836:
  %t3239 = call i64 @rt_null_p(i64 %a0)
  %t3240 = icmp ne i64 %t3239, 1
  br i1 %t3240, label %then837, label %else838
then837:
  ret i64 %a1
else838:
  %t3241 = call i64 @rt_car(i64 %a0)
  %t3242 = call i64 @rt_car(i64 %t3241)
  %t3243 = call i64 @rt_car(i64 %a0)
  %t3244 = call i64 @rt_cdr(i64 %t3243)
  %t3245 = call i64 @rt_cons(i64 %t3242, i64 %t3244)
  %t3246 = call i64 @rt_cdr(i64 %a0)
  %t3247 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  %t3248 = and i64 %t3247, -8
  %t3249 = inttoptr i64 %t3248 to ptr
  %t3250 = load i64, ptr %t3249
  %t3251 = inttoptr i64 %t3250 to ptr
  %t3252 = call fastcc i64%t3251(i64 %t3247, i64 2, i64 %t3246, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3253 = call i64 @rt_cons(i64 %t3245, i64 %t3252)
  ret i64 %t3253
}

define fastcc i64 @"scheme.base:code_704"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3258 = icmp eq i64 %argc, 2
  br i1 %t3258, label %argok840, label %arityerr839
arityerr839:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok840:
  %t3259 = and i64 %self, -8
  %t3260 = inttoptr i64 %t3259 to ptr
  %t3261 = getelementptr i64, ptr %t3260, i64 1
  %t3262 = load i64, ptr %t3261
  %t3263 = call i64 @rt_vector_length(i64 %t3262)
  %t3264 = or i64 %a0, %t3263
  %t3265 = and i64 %t3264, 7
  %t3266 = icmp eq i64 %t3265, 0
  br i1 %t3266, label %fixfast841, label %fixslow842
fixfast841:
  %t3267 = icmp slt i64 %a0, %t3263
  %t3268 = select i1 %t3267, i64 257, i64 1
  br label %fixmerge843
fixslow842:
  %t3269 = call i64 @rt_lt(i64 %a0, i64 %t3263)
  br label %fixmerge843
fixmerge843:
  %t3270 = phi i64 [ %t3268, %fixfast841 ], [ %t3269, %fixslow842 ]
  %t3271 = icmp ne i64 %t3270, 1
  br i1 %t3271, label %then844, label %else845
then844:
  %t3272 = or i64 %a0, 8
  %t3273 = and i64 %t3272, 7
  %t3274 = icmp eq i64 %t3273, 0
  br i1 %t3274, label %fixfast846, label %fixslow847
fixfast846:
  %t3275 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3276 = extractvalue {i64, i1} %t3275, 0
  %t3277 = extractvalue {i64, i1} %t3275, 1
  br i1 %t3277, label %fixslow847, label %fixmerge848
fixslow847:
  %t3278 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge848
fixmerge848:
  %t3279 = phi i64 [ %t3276, %fixfast846 ], [ %t3278, %fixslow847 ]
  %t3280 = and i64 %self, -8
  %t3281 = inttoptr i64 %t3280 to ptr
  %t3282 = getelementptr i64, ptr %t3281, i64 1
  %t3283 = load i64, ptr %t3282
  %t3284 = call i64 @rt_vector_ref(i64 %t3283, i64 %a0)
  %t3285 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  %t3286 = and i64 %t3285, -8
  %t3287 = inttoptr i64 %t3286 to ptr
  %t3288 = load i64, ptr %t3287
  %t3289 = inttoptr i64 %t3288 to ptr
  %t3290 = call fastcc i64%t3289(i64 %t3285, i64 2, i64 %t3284, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3291 = musttail call fastcc i64 @"scheme.base:code_704"(i64 %self, i64 2, i64 %t3279, i64 %t3290, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3291
else845:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:hash-table->alist"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3292 = icmp eq i64 %argc, 1
  br i1 %t3292, label %argok850, label %arityerr849
arityerr849:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok850:
  %t3293 = load i64, ptr @"scheme.base:%ht-buckets"
  %t3294 = and i64 %t3293, -8
  %t3295 = inttoptr i64 %t3294 to ptr
  %t3296 = load i64, ptr %t3295
  %t3297 = inttoptr i64 %t3296 to ptr
  %t3298 = call fastcc i64%t3297(i64 %t3293, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3299 = call ptr @rt_alloc_words(i64 3)
  %t3300 = ptrtoint ptr %t3299 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_704" to i64), ptr %t3299
  %t3301 = or i64 %t3300, 4
  %t3302 = getelementptr i64, ptr %t3299, i64 1
  store i64 %t3298, ptr %t3302
  %t3303 = getelementptr i64, ptr %t3299, i64 2
  store i64 %t3301, ptr %t3303
  %t3304 = musttail call fastcc i64 @"scheme.base:code_704"(i64 %t3301, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3304
}

define fastcc i64 @"scheme.base:code_709"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3309 = icmp eq i64 %argc, 1
  br i1 %t3309, label %argok852, label %arityerr851
arityerr851:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok852:
  %t3310 = call i64 @rt_car(i64 %a0)
  ret i64 %t3310
}

define fastcc i64 @"scheme.base:code:hash-table-keys"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3311 = icmp eq i64 %argc, 1
  br i1 %t3311, label %argok854, label %arityerr853
arityerr853:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok854:
  %t3312 = call ptr @rt_alloc_words(i64 1)
  %t3313 = ptrtoint ptr %t3312 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_709" to i64), ptr %t3312
  %t3314 = or i64 %t3313, 4
  %t3315 = load i64, ptr @"scheme.base:hash-table->alist"
  %t3316 = and i64 %t3315, -8
  %t3317 = inttoptr i64 %t3316 to ptr
  %t3318 = load i64, ptr %t3317
  %t3319 = inttoptr i64 %t3318 to ptr
  %t3320 = call fastcc i64%t3319(i64 %t3315, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3321 = load i64, ptr @"scheme.base:map"
  %t3322 = and i64 %t3321, -8
  %t3323 = inttoptr i64 %t3322 to ptr
  %t3324 = load i64, ptr %t3323
  %t3325 = inttoptr i64 %t3324 to ptr
  %t3326 = musttail call fastcc i64 %t3325(i64 %t3321, i64 2, i64 %t3314, i64 %t3320, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3326
}

define fastcc i64 @"scheme.base:code_714"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3331 = icmp eq i64 %argc, 1
  br i1 %t3331, label %argok856, label %arityerr855
arityerr855:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok856:
  %t3332 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t3332
}

define fastcc i64 @"scheme.base:code:hash-table-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3333 = icmp eq i64 %argc, 1
  br i1 %t3333, label %argok858, label %arityerr857
arityerr857:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok858:
  %t3334 = call ptr @rt_alloc_words(i64 1)
  %t3335 = ptrtoint ptr %t3334 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_714" to i64), ptr %t3334
  %t3336 = or i64 %t3335, 4
  %t3337 = load i64, ptr @"scheme.base:hash-table->alist"
  %t3338 = and i64 %t3337, -8
  %t3339 = inttoptr i64 %t3338 to ptr
  %t3340 = load i64, ptr %t3339
  %t3341 = inttoptr i64 %t3340 to ptr
  %t3342 = call fastcc i64%t3341(i64 %t3337, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3343 = load i64, ptr @"scheme.base:map"
  %t3344 = and i64 %t3343, -8
  %t3345 = inttoptr i64 %t3344 to ptr
  %t3346 = load i64, ptr %t3345
  %t3347 = inttoptr i64 %t3346 to ptr
  %t3348 = musttail call fastcc i64 %t3347(i64 %t3343, i64 2, i64 %t3336, i64 %t3342, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3348
}

define fastcc i64 @"scheme.base:code:read-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3353 = icmp eq i64 %argc, 1
  br i1 %t3353, label %argok860, label %arityerr859
arityerr859:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok860:
  %t3354 = call i64 @rt_string_length(i64 %a0)
  %t3355 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t3356 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t3355, i64 3, i64 %a0, i64 %t3354, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3357 = load i64, ptr @"emit.internal:rd-datum"
  %t3358 = call fastcc i64 @"emit.internal:code:rd-datum"(i64 %t3357, i64 3, i64 %a0, i64 %t3354, i64 %t3356, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3359 = call i64 @rt_car(i64 %t3358)
  ret i64 %t3359
}

define fastcc i64 @"scheme.base:code_730"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3364 = icmp eq i64 %argc, 2
  br i1 %t3364, label %argok862, label %arityerr861
arityerr861:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok862:
  %t3365 = and i64 %self, -8
  %t3366 = inttoptr i64 %t3365 to ptr
  %t3367 = getelementptr i64, ptr %t3366, i64 1
  %t3368 = load i64, ptr %t3367
  %t3369 = or i64 %a0, %t3368
  %t3370 = and i64 %t3369, 7
  %t3371 = icmp eq i64 %t3370, 0
  br i1 %t3371, label %fixfast863, label %fixslow864
fixfast863:
  %t3372 = icmp slt i64 %a0, %t3368
  %t3373 = select i1 %t3372, i64 257, i64 1
  br label %fixmerge865
fixslow864:
  %t3374 = call i64 @rt_lt(i64 %a0, i64 %t3368)
  br label %fixmerge865
fixmerge865:
  %t3375 = phi i64 [ %t3373, %fixfast863 ], [ %t3374, %fixslow864 ]
  %t3376 = icmp ne i64 %t3375, 1
  br i1 %t3376, label %then866, label %else867
then866:
  %t3377 = and i64 %self, -8
  %t3378 = inttoptr i64 %t3377 to ptr
  %t3379 = getelementptr i64, ptr %t3378, i64 2
  %t3380 = load i64, ptr %t3379
  %t3381 = and i64 %self, -8
  %t3382 = inttoptr i64 %t3381 to ptr
  %t3383 = getelementptr i64, ptr %t3382, i64 1
  %t3384 = load i64, ptr %t3383
  %t3385 = load i64, ptr @"emit.internal:rd-datum"
  %t3386 = call fastcc i64 @"emit.internal:code:rd-datum"(i64 %t3385, i64 3, i64 %t3380, i64 %t3384, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3387 = and i64 %self, -8
  %t3388 = inttoptr i64 %t3387 to ptr
  %t3389 = getelementptr i64, ptr %t3388, i64 2
  %t3390 = load i64, ptr %t3389
  %t3391 = and i64 %self, -8
  %t3392 = inttoptr i64 %t3391 to ptr
  %t3393 = getelementptr i64, ptr %t3392, i64 1
  %t3394 = load i64, ptr %t3393
  %t3395 = call i64 @rt_cdr(i64 %t3386)
  %t3396 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t3397 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t3396, i64 3, i64 %t3390, i64 %t3394, i64 %t3395, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3398 = call i64 @rt_car(i64 %t3386)
  %t3399 = call i64 @rt_cons(i64 %t3398, i64 %a1)
  %t3400 = musttail call fastcc i64 @"scheme.base:code_730"(i64 %self, i64 2, i64 %t3397, i64 %t3399, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3400
else867:
  %t3401 = load i64, ptr @"scheme.base:reverse"
  %t3402 = and i64 %t3401, -8
  %t3403 = inttoptr i64 %t3402 to ptr
  %t3404 = load i64, ptr %t3403
  %t3405 = inttoptr i64 %t3404 to ptr
  %t3406 = musttail call fastcc i64 %t3405(i64 %t3401, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3406
}

define fastcc i64 @"scheme.base:code:read-all-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3407 = icmp eq i64 %argc, 1
  br i1 %t3407, label %argok869, label %arityerr868
arityerr868:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok869:
  %t3408 = call i64 @rt_string_length(i64 %a0)
  %t3409 = call ptr @rt_alloc_words(i64 4)
  %t3410 = ptrtoint ptr %t3409 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_730" to i64), ptr %t3409
  %t3411 = or i64 %t3410, 4
  %t3412 = getelementptr i64, ptr %t3409, i64 1
  store i64 %t3408, ptr %t3412
  %t3413 = getelementptr i64, ptr %t3409, i64 2
  store i64 %a0, ptr %t3413
  %t3414 = getelementptr i64, ptr %t3409, i64 3
  store i64 %t3411, ptr %t3414
  %t3415 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t3416 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t3415, i64 3, i64 %a0, i64 %t3408, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3417 = musttail call fastcc i64 @"scheme.base:code_730"(i64 %t3411, i64 2, i64 %t3416, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3417
}

define fastcc i64 @"scheme.base:code:port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3422 = icmp eq i64 %argc, 1
  br i1 %t3422, label %argok871, label %arityerr870
arityerr870:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok871:
  %t3423 = load i64, ptr @"emit.internal:%port-rtd"
  %t3424 = call fastcc i64 @"emit.internal:code:%port-rtd"(i64 %t3423, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3425 = call i64 @rt_record_of_type_p(i64 %a0, i64 %t3424)
  ret i64 %t3425
}

define fastcc i64 @"scheme.base:code:input-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3430 = icmp eq i64 %argc, 1
  br i1 %t3430, label %argok873, label %arityerr872
arityerr872:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok873:
  %t3431 = load i64, ptr @"scheme.base:port?"
  %t3432 = and i64 %t3431, -8
  %t3433 = inttoptr i64 %t3432 to ptr
  %t3434 = load i64, ptr %t3433
  %t3435 = inttoptr i64 %t3434 to ptr
  %t3436 = call fastcc i64%t3435(i64 %t3431, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3437 = icmp ne i64 %t3436, 1
  br i1 %t3437, label %then874, label %else875
then874:
  %t3438 = call i64 @rt_record_ref(i64 %a0, i64 8)
  ret i64 %t3438
else875:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3443 = icmp eq i64 %argc, 1
  br i1 %t3443, label %argok877, label %arityerr876
arityerr876:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok877:
  %t3444 = load i64, ptr @"scheme.base:port?"
  %t3445 = and i64 %t3444, -8
  %t3446 = inttoptr i64 %t3445 to ptr
  %t3447 = load i64, ptr %t3446
  %t3448 = inttoptr i64 %t3447 to ptr
  %t3449 = call fastcc i64%t3448(i64 %t3444, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3450 = icmp ne i64 %t3449, 1
  br i1 %t3450, label %then878, label %else879
then878:
  %t3451 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t3452 = call i64 @rt_not(i64 %t3451)
  ret i64 %t3452
else879:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:textual-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3457 = icmp eq i64 %argc, 1
  br i1 %t3457, label %argok881, label %arityerr880
arityerr880:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok881:
  %t3458 = load i64, ptr @"scheme.base:port?"
  %t3459 = and i64 %t3458, -8
  %t3460 = inttoptr i64 %t3459 to ptr
  %t3461 = load i64, ptr %t3460
  %t3462 = inttoptr i64 %t3461 to ptr
  %t3463 = musttail call fastcc i64 %t3462(i64 %t3458, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3463
}

define fastcc i64 @"scheme.base:code:port-closed?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3468 = icmp eq i64 %argc, 1
  br i1 %t3468, label %argok883, label %arityerr882
arityerr882:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok883:
  %t3469 = call i64 @rt_record_ref(i64 %a0, i64 40)
  ret i64 %t3469
}

define fastcc i64 @"scheme.base:code:input-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3474 = icmp eq i64 %argc, 1
  br i1 %t3474, label %argok885, label %arityerr884
arityerr884:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok885:
  %t3475 = load i64, ptr @"scheme.base:input-port?"
  %t3476 = and i64 %t3475, -8
  %t3477 = inttoptr i64 %t3476 to ptr
  %t3478 = load i64, ptr %t3477
  %t3479 = inttoptr i64 %t3478 to ptr
  %t3480 = call fastcc i64%t3479(i64 %t3475, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3481 = icmp ne i64 %t3480, 1
  br i1 %t3481, label %then886, label %else887
then886:
  %t3482 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t3483 = call i64 @rt_not(i64 %t3482)
  ret i64 %t3483
else887:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3488 = icmp eq i64 %argc, 1
  br i1 %t3488, label %argok889, label %arityerr888
arityerr888:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok889:
  %t3489 = load i64, ptr @"scheme.base:output-port?"
  %t3490 = and i64 %t3489, -8
  %t3491 = inttoptr i64 %t3490 to ptr
  %t3492 = load i64, ptr %t3491
  %t3493 = inttoptr i64 %t3492 to ptr
  %t3494 = call fastcc i64%t3493(i64 %t3489, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3495 = icmp ne i64 %t3494, 1
  br i1 %t3495, label %then890, label %else891
then890:
  %t3496 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t3497 = call i64 @rt_not(i64 %t3496)
  ret i64 %t3497
else891:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%check-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3502 = icmp eq i64 %argc, 2
  br i1 %t3502, label %argok893, label %arityerr892
arityerr892:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok893:
  %t3503 = load i64, ptr @"scheme.base:input-port?"
  %t3504 = and i64 %t3503, -8
  %t3505 = inttoptr i64 %t3504 to ptr
  %t3506 = load i64, ptr %t3505
  %t3507 = inttoptr i64 %t3506 to ptr
  %t3508 = call fastcc i64%t3507(i64 %t3503, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3509 = call i64 @rt_not(i64 %t3508)
  %t3510 = icmp ne i64 %t3509, 1
  br i1 %t3510, label %then894, label %else895
then894:
  %t3511 = call i64 @rt_make_string(ptr @.str.lit.13, i64 17)
  %t3512 = load i64, ptr @"scheme.base:error"
  %t3513 = and i64 %t3512, -8
  %t3514 = inttoptr i64 %t3513 to ptr
  %t3515 = load i64, ptr %t3514
  %t3516 = inttoptr i64 %t3515 to ptr
  %t3517 = musttail call fastcc i64 %t3516(i64 %t3512, i64 3, i64 %a1, i64 %t3511, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3517
else895:
  %t3518 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t3519 = icmp ne i64 %t3518, 1
  br i1 %t3519, label %then896, label %else897
then896:
  %t3520 = call i64 @rt_make_string(ptr @.str.lit.14, i64 14)
  %t3521 = load i64, ptr @"scheme.base:error"
  %t3522 = and i64 %t3521, -8
  %t3523 = inttoptr i64 %t3522 to ptr
  %t3524 = load i64, ptr %t3523
  %t3525 = inttoptr i64 %t3524 to ptr
  %t3526 = musttail call fastcc i64 %t3525(i64 %t3521, i64 3, i64 %a1, i64 %t3520, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3526
else897:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:%check-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3531 = icmp eq i64 %argc, 2
  br i1 %t3531, label %argok899, label %arityerr898
arityerr898:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok899:
  %t3532 = load i64, ptr @"scheme.base:output-port?"
  %t3533 = and i64 %t3532, -8
  %t3534 = inttoptr i64 %t3533 to ptr
  %t3535 = load i64, ptr %t3534
  %t3536 = inttoptr i64 %t3535 to ptr
  %t3537 = call fastcc i64%t3536(i64 %t3532, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3538 = call i64 @rt_not(i64 %t3537)
  %t3539 = icmp ne i64 %t3538, 1
  br i1 %t3539, label %then900, label %else901
then900:
  %t3540 = call i64 @rt_make_string(ptr @.str.lit.15, i64 18)
  %t3541 = load i64, ptr @"scheme.base:error"
  %t3542 = and i64 %t3541, -8
  %t3543 = inttoptr i64 %t3542 to ptr
  %t3544 = load i64, ptr %t3543
  %t3545 = inttoptr i64 %t3544 to ptr
  %t3546 = musttail call fastcc i64 %t3545(i64 %t3541, i64 3, i64 %a1, i64 %t3540, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3546
else901:
  %t3547 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t3548 = icmp ne i64 %t3547, 1
  br i1 %t3548, label %then902, label %else903
then902:
  %t3549 = call i64 @rt_make_string(ptr @.str.lit.16, i64 14)
  %t3550 = load i64, ptr @"scheme.base:error"
  %t3551 = and i64 %t3550, -8
  %t3552 = inttoptr i64 %t3551 to ptr
  %t3553 = load i64, ptr %t3552
  %t3554 = inttoptr i64 %t3553 to ptr
  %t3555 = musttail call fastcc i64 %t3554(i64 %t3550, i64 3, i64 %a1, i64 %t3549, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3555
else903:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:open-input-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3560 = icmp eq i64 %argc, 1
  br i1 %t3560, label %argok905, label %arityerr904
arityerr904:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok905:
  %t3561 = load i64, ptr @"emit.internal:%make-port"
  %t3562 = musttail call fastcc i64 @"emit.internal:code:%make-port"(i64 %t3561, i64 6, i64 1, i64 257, i64 %a0, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t3562
}

define fastcc i64 @"scheme.base:code:%port-at-eof?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3567 = icmp eq i64 %argc, 1
  br i1 %t3567, label %argok907, label %arityerr906
arityerr906:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok907:
  %t3568 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t3569 = load i64, ptr @"emit.internal:%port-buf"
  %t3570 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t3569, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3571 = call i64 @rt_string_length(i64 %t3570)
  %t3572 = or i64 %t3571, %t3568
  %t3573 = and i64 %t3572, 7
  %t3574 = icmp eq i64 %t3573, 0
  br i1 %t3574, label %fixfast908, label %fixslow909
fixfast908:
  %t3575 = icmp slt i64 %t3571, %t3568
  %t3576 = select i1 %t3575, i64 257, i64 1
  br label %fixmerge910
fixslow909:
  %t3577 = call i64 @rt_lt(i64 %t3571, i64 %t3568)
  br label %fixmerge910
fixmerge910:
  %t3578 = phi i64 [ %t3576, %fixfast908 ], [ %t3577, %fixslow909 ]
  %t3579 = icmp ne i64 %t3578, 1
  br i1 %t3579, label %then911, label %else912
then911:
  ret i64 257
else912:
  %t3580 = or i64 %t3568, %t3571
  %t3581 = and i64 %t3580, 7
  %t3582 = icmp eq i64 %t3581, 0
  br i1 %t3582, label %fixfast913, label %fixslow914
fixfast913:
  %t3583 = icmp eq i64 %t3568, %t3571
  %t3584 = select i1 %t3583, i64 257, i64 1
  br label %fixmerge915
fixslow914:
  %t3585 = call i64 @rt_num_eq(i64 %t3568, i64 %t3571)
  br label %fixmerge915
fixmerge915:
  %t3586 = phi i64 [ %t3584, %fixfast913 ], [ %t3585, %fixslow914 ]
  ret i64 %t3586
}

define fastcc i64 @"scheme.base:code:read-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3591 = icmp eq i64 %argc, 1
  br i1 %t3591, label %argok917, label %arityerr916
arityerr916:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok917:
  %t3592 = call i64 @rt_intern(ptr @.str.sym.17)
  %t3593 = load i64, ptr @"scheme.base:%check-input-port"
  %t3594 = and i64 %t3593, -8
  %t3595 = inttoptr i64 %t3594 to ptr
  %t3596 = load i64, ptr %t3595
  %t3597 = inttoptr i64 %t3596 to ptr
  %t3598 = call fastcc i64%t3597(i64 %t3593, i64 2, i64 %a0, i64 %t3592, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3599 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t3600 = and i64 %t3599, -8
  %t3601 = inttoptr i64 %t3600 to ptr
  %t3602 = load i64, ptr %t3601
  %t3603 = inttoptr i64 %t3602 to ptr
  %t3604 = call fastcc i64%t3603(i64 %t3599, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3605 = icmp ne i64 %t3604, 1
  br i1 %t3605, label %then918, label %else919
then918:
  %t3606 = call i64 @rt_eof_object()
  ret i64 %t3606
else919:
  %t3607 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t3608 = or i64 %t3607, 8
  %t3609 = and i64 %t3608, 7
  %t3610 = icmp eq i64 %t3609, 0
  br i1 %t3610, label %fixfast920, label %fixslow921
fixfast920:
  %t3611 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3607, i64 8)
  %t3612 = extractvalue {i64, i1} %t3611, 0
  %t3613 = extractvalue {i64, i1} %t3611, 1
  br i1 %t3613, label %fixslow921, label %fixmerge922
fixslow921:
  %t3614 = call i64 @rt_add(i64 %t3607, i64 8)
  br label %fixmerge922
fixmerge922:
  %t3615 = phi i64 [ %t3612, %fixfast920 ], [ %t3614, %fixslow921 ]
  %t3616 = call i64 @rt_record_set(i64 %a0, i64 24, i64 %t3615)
  %t3617 = load i64, ptr @"emit.internal:%port-buf"
  %t3618 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t3617, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3619 = call i64 @rt_string_ref(i64 %t3618, i64 %t3607)
  ret i64 %t3619
}

define fastcc i64 @"scheme.base:code:peek-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3624 = icmp eq i64 %argc, 1
  br i1 %t3624, label %argok924, label %arityerr923
arityerr923:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok924:
  %t3625 = call i64 @rt_intern(ptr @.str.sym.18)
  %t3626 = load i64, ptr @"scheme.base:%check-input-port"
  %t3627 = and i64 %t3626, -8
  %t3628 = inttoptr i64 %t3627 to ptr
  %t3629 = load i64, ptr %t3628
  %t3630 = inttoptr i64 %t3629 to ptr
  %t3631 = call fastcc i64%t3630(i64 %t3626, i64 2, i64 %a0, i64 %t3625, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3632 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t3633 = and i64 %t3632, -8
  %t3634 = inttoptr i64 %t3633 to ptr
  %t3635 = load i64, ptr %t3634
  %t3636 = inttoptr i64 %t3635 to ptr
  %t3637 = call fastcc i64%t3636(i64 %t3632, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3638 = icmp ne i64 %t3637, 1
  br i1 %t3638, label %then925, label %else926
then925:
  %t3639 = call i64 @rt_eof_object()
  ret i64 %t3639
else926:
  %t3640 = load i64, ptr @"emit.internal:%port-buf"
  %t3641 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t3640, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3642 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t3643 = call i64 @rt_string_ref(i64 %t3641, i64 %t3642)
  ret i64 %t3643
}

define fastcc i64 @"scheme.base:code_777"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3648 = icmp eq i64 %argc, 1
  br i1 %t3648, label %argok928, label %arityerr927
arityerr927:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok928:
  %t3649 = and i64 %self, -8
  %t3650 = inttoptr i64 %t3649 to ptr
  %t3651 = getelementptr i64, ptr %t3650, i64 1
  %t3652 = load i64, ptr %t3651
  %t3653 = or i64 %t3652, %a0
  %t3654 = and i64 %t3653, 7
  %t3655 = icmp eq i64 %t3654, 0
  br i1 %t3655, label %fixfast929, label %fixslow930
fixfast929:
  %t3656 = icmp slt i64 %t3652, %a0
  %t3657 = select i1 %t3656, i64 257, i64 1
  br label %fixmerge931
fixslow930:
  %t3658 = call i64 @rt_lt(i64 %t3652, i64 %a0)
  br label %fixmerge931
fixmerge931:
  %t3659 = phi i64 [ %t3657, %fixfast929 ], [ %t3658, %fixslow930 ]
  %t3660 = icmp ne i64 %t3659, 1
  br i1 %t3660, label %then932, label %else933
then932:
  br label %merge934
else933:
  %t3661 = or i64 %a0, %t3652
  %t3662 = and i64 %t3661, 7
  %t3663 = icmp eq i64 %t3662, 0
  br i1 %t3663, label %fixfast935, label %fixslow936
fixfast935:
  %t3664 = icmp eq i64 %a0, %t3652
  %t3665 = select i1 %t3664, i64 257, i64 1
  br label %fixmerge937
fixslow936:
  %t3666 = call i64 @rt_num_eq(i64 %a0, i64 %t3652)
  br label %fixmerge937
fixmerge937:
  %t3667 = phi i64 [ %t3665, %fixfast935 ], [ %t3666, %fixslow936 ]
  br label %merge934
merge934:
  %t3668 = phi i64 [ 257, %then932 ], [ %t3667, %fixmerge937 ]
  %t3669 = icmp ne i64 %t3668, 1
  br i1 %t3669, label %then938, label %else939
then938:
  %t3670 = and i64 %self, -8
  %t3671 = inttoptr i64 %t3670 to ptr
  %t3672 = getelementptr i64, ptr %t3671, i64 2
  %t3673 = load i64, ptr %t3672
  %t3674 = call i64 @rt_record_ref(i64 %t3673, i64 24)
  %t3675 = and i64 %self, -8
  %t3676 = inttoptr i64 %t3675 to ptr
  %t3677 = getelementptr i64, ptr %t3676, i64 2
  %t3678 = load i64, ptr %t3677
  %t3679 = and i64 %self, -8
  %t3680 = inttoptr i64 %t3679 to ptr
  %t3681 = getelementptr i64, ptr %t3680, i64 1
  %t3682 = load i64, ptr %t3681
  %t3683 = call i64 @rt_record_set(i64 %t3678, i64 24, i64 %t3682)
  %t3684 = and i64 %self, -8
  %t3685 = inttoptr i64 %t3684 to ptr
  %t3686 = getelementptr i64, ptr %t3685, i64 3
  %t3687 = load i64, ptr %t3686
  %t3688 = and i64 %self, -8
  %t3689 = inttoptr i64 %t3688 to ptr
  %t3690 = getelementptr i64, ptr %t3689, i64 1
  %t3691 = load i64, ptr %t3690
  %t3692 = call i64 @rt_substring(i64 %t3687, i64 %t3674, i64 %t3691)
  ret i64 %t3692
else939:
  %t3693 = and i64 %self, -8
  %t3694 = inttoptr i64 %t3693 to ptr
  %t3695 = getelementptr i64, ptr %t3694, i64 3
  %t3696 = load i64, ptr %t3695
  %t3697 = call i64 @rt_string_ref(i64 %t3696, i64 %a0)
  %t3698 = load i64, ptr @"scheme.base:char=?"
  %t3699 = and i64 %t3698, -8
  %t3700 = inttoptr i64 %t3699 to ptr
  %t3701 = load i64, ptr %t3700
  %t3702 = inttoptr i64 %t3701 to ptr
  %t3703 = call fastcc i64%t3702(i64 %t3698, i64 2, i64 %t3697, i64 2569, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3704 = icmp ne i64 %t3703, 1
  br i1 %t3704, label %then940, label %else941
then940:
  %t3705 = and i64 %self, -8
  %t3706 = inttoptr i64 %t3705 to ptr
  %t3707 = getelementptr i64, ptr %t3706, i64 2
  %t3708 = load i64, ptr %t3707
  %t3709 = call i64 @rt_record_ref(i64 %t3708, i64 24)
  %t3710 = and i64 %self, -8
  %t3711 = inttoptr i64 %t3710 to ptr
  %t3712 = getelementptr i64, ptr %t3711, i64 2
  %t3713 = load i64, ptr %t3712
  %t3714 = or i64 %a0, 8
  %t3715 = and i64 %t3714, 7
  %t3716 = icmp eq i64 %t3715, 0
  br i1 %t3716, label %fixfast942, label %fixslow943
fixfast942:
  %t3717 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3718 = extractvalue {i64, i1} %t3717, 0
  %t3719 = extractvalue {i64, i1} %t3717, 1
  br i1 %t3719, label %fixslow943, label %fixmerge944
fixslow943:
  %t3720 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge944
fixmerge944:
  %t3721 = phi i64 [ %t3718, %fixfast942 ], [ %t3720, %fixslow943 ]
  %t3722 = call i64 @rt_record_set(i64 %t3713, i64 24, i64 %t3721)
  %t3723 = and i64 %self, -8
  %t3724 = inttoptr i64 %t3723 to ptr
  %t3725 = getelementptr i64, ptr %t3724, i64 3
  %t3726 = load i64, ptr %t3725
  %t3727 = call i64 @rt_substring(i64 %t3726, i64 %t3709, i64 %a0)
  ret i64 %t3727
else941:
  %t3728 = or i64 %a0, 8
  %t3729 = and i64 %t3728, 7
  %t3730 = icmp eq i64 %t3729, 0
  br i1 %t3730, label %fixfast945, label %fixslow946
fixfast945:
  %t3731 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3732 = extractvalue {i64, i1} %t3731, 0
  %t3733 = extractvalue {i64, i1} %t3731, 1
  br i1 %t3733, label %fixslow946, label %fixmerge947
fixslow946:
  %t3734 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge947
fixmerge947:
  %t3735 = phi i64 [ %t3732, %fixfast945 ], [ %t3734, %fixslow946 ]
  %t3736 = musttail call fastcc i64 @"scheme.base:code_777"(i64 %self, i64 1, i64 %t3735, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3736
}

define fastcc i64 @"scheme.base:code:read-line"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3737 = icmp eq i64 %argc, 1
  br i1 %t3737, label %argok949, label %arityerr948
arityerr948:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok949:
  %t3738 = call i64 @rt_intern(ptr @.str.sym.19)
  %t3739 = load i64, ptr @"scheme.base:%check-input-port"
  %t3740 = and i64 %t3739, -8
  %t3741 = inttoptr i64 %t3740 to ptr
  %t3742 = load i64, ptr %t3741
  %t3743 = inttoptr i64 %t3742 to ptr
  %t3744 = call fastcc i64%t3743(i64 %t3739, i64 2, i64 %a0, i64 %t3738, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3745 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t3746 = and i64 %t3745, -8
  %t3747 = inttoptr i64 %t3746 to ptr
  %t3748 = load i64, ptr %t3747
  %t3749 = inttoptr i64 %t3748 to ptr
  %t3750 = call fastcc i64%t3749(i64 %t3745, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3751 = icmp ne i64 %t3750, 1
  br i1 %t3751, label %then950, label %else951
then950:
  %t3752 = call i64 @rt_eof_object()
  ret i64 %t3752
else951:
  %t3753 = load i64, ptr @"emit.internal:%port-buf"
  %t3754 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t3753, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3755 = call i64 @rt_string_length(i64 %t3754)
  %t3756 = call ptr @rt_alloc_words(i64 5)
  %t3757 = ptrtoint ptr %t3756 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_777" to i64), ptr %t3756
  %t3758 = or i64 %t3757, 4
  %t3759 = getelementptr i64, ptr %t3756, i64 1
  store i64 %t3755, ptr %t3759
  %t3760 = getelementptr i64, ptr %t3756, i64 2
  store i64 %a0, ptr %t3760
  %t3761 = getelementptr i64, ptr %t3756, i64 3
  store i64 %t3754, ptr %t3761
  %t3762 = getelementptr i64, ptr %t3756, i64 4
  store i64 %t3758, ptr %t3762
  %t3763 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t3764 = musttail call fastcc i64 @"scheme.base:code_777"(i64 %t3758, i64 1, i64 %t3763, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3764
}

define fastcc i64 @"scheme.base:code:read-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3769 = icmp eq i64 %argc, 2
  br i1 %t3769, label %argok953, label %arityerr952
arityerr952:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok953:
  %t3770 = call i64 @rt_intern(ptr @.str.sym.20)
  %t3771 = load i64, ptr @"scheme.base:%check-input-port"
  %t3772 = and i64 %t3771, -8
  %t3773 = inttoptr i64 %t3772 to ptr
  %t3774 = load i64, ptr %t3773
  %t3775 = inttoptr i64 %t3774 to ptr
  %t3776 = call fastcc i64%t3775(i64 %t3771, i64 2, i64 %a1, i64 %t3770, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3777 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t3778 = and i64 %t3777, -8
  %t3779 = inttoptr i64 %t3778 to ptr
  %t3780 = load i64, ptr %t3779
  %t3781 = inttoptr i64 %t3780 to ptr
  %t3782 = call fastcc i64%t3781(i64 %t3777, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3783 = icmp ne i64 %t3782, 1
  br i1 %t3783, label %then954, label %else955
then954:
  %t3784 = call i64 @rt_eof_object()
  ret i64 %t3784
else955:
  %t3785 = load i64, ptr @"emit.internal:%port-buf"
  %t3786 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t3785, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3787 = call i64 @rt_string_length(i64 %t3786)
  %t3788 = call i64 @rt_record_ref(i64 %a1, i64 24)
  %t3789 = or i64 %t3788, %a0
  %t3790 = and i64 %t3789, 7
  %t3791 = icmp eq i64 %t3790, 0
  br i1 %t3791, label %fixfast956, label %fixslow957
fixfast956:
  %t3792 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3788, i64 %a0)
  %t3793 = extractvalue {i64, i1} %t3792, 0
  %t3794 = extractvalue {i64, i1} %t3792, 1
  br i1 %t3794, label %fixslow957, label %fixmerge958
fixslow957:
  %t3795 = call i64 @rt_add(i64 %t3788, i64 %a0)
  br label %fixmerge958
fixmerge958:
  %t3796 = phi i64 [ %t3793, %fixfast956 ], [ %t3795, %fixslow957 ]
  %t3797 = or i64 %t3787, %t3796
  %t3798 = and i64 %t3797, 7
  %t3799 = icmp eq i64 %t3798, 0
  br i1 %t3799, label %fixfast959, label %fixslow960
fixfast959:
  %t3800 = icmp slt i64 %t3787, %t3796
  %t3801 = select i1 %t3800, i64 257, i64 1
  br label %fixmerge961
fixslow960:
  %t3802 = call i64 @rt_lt(i64 %t3787, i64 %t3796)
  br label %fixmerge961
fixmerge961:
  %t3803 = phi i64 [ %t3801, %fixfast959 ], [ %t3802, %fixslow960 ]
  %t3804 = icmp ne i64 %t3803, 1
  br i1 %t3804, label %then962, label %else963
then962:
  br label %merge964
else963:
  %t3805 = or i64 %t3788, %a0
  %t3806 = and i64 %t3805, 7
  %t3807 = icmp eq i64 %t3806, 0
  br i1 %t3807, label %fixfast965, label %fixslow966
fixfast965:
  %t3808 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3788, i64 %a0)
  %t3809 = extractvalue {i64, i1} %t3808, 0
  %t3810 = extractvalue {i64, i1} %t3808, 1
  br i1 %t3810, label %fixslow966, label %fixmerge967
fixslow966:
  %t3811 = call i64 @rt_add(i64 %t3788, i64 %a0)
  br label %fixmerge967
fixmerge967:
  %t3812 = phi i64 [ %t3809, %fixfast965 ], [ %t3811, %fixslow966 ]
  br label %merge964
merge964:
  %t3813 = phi i64 [ %t3787, %then962 ], [ %t3812, %fixmerge967 ]
  %t3814 = call i64 @rt_record_set(i64 %a1, i64 24, i64 %t3813)
  %t3815 = call i64 @rt_substring(i64 %t3786, i64 %t3788, i64 %t3813)
  ret i64 %t3815
}

define fastcc i64 @"scheme.base:code:open-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3820 = icmp eq i64 %argc, 0
  br i1 %t3820, label %argok969, label %arityerr968
arityerr968:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok969:
  %t3821 = call i64 @rt_port_open_output_string()
  %t3822 = icmp ne i64 %t3821, 1
  br i1 %t3822, label %then970, label %else971
then970:
  %t3823 = load i64, ptr @"emit.internal:%make-port"
  %t3824 = musttail call fastcc i64 @"emit.internal:code:%make-port"(i64 %t3823, i64 6, i64 %t3821, i64 1, i64 1, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t3824
else971:
  %t3825 = call i64 @rt_intern(ptr @.str.sym.21)
  %t3826 = call i64 @rt_make_string(ptr @.str.lit.22, i64 33)
  %t3827 = load i64, ptr @"scheme.base:error"
  %t3828 = and i64 %t3827, -8
  %t3829 = inttoptr i64 %t3828 to ptr
  %t3830 = load i64, ptr %t3829
  %t3831 = inttoptr i64 %t3830 to ptr
  %t3832 = musttail call fastcc i64 %t3831(i64 %t3827, i64 2, i64 %t3825, i64 %t3826, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3832
}

define fastcc i64 @"scheme.base:code:get-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3837 = icmp eq i64 %argc, 1
  br i1 %t3837, label %argok973, label %arityerr972
arityerr972:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok973:
  %t3838 = load i64, ptr @"scheme.base:output-port?"
  %t3839 = and i64 %t3838, -8
  %t3840 = inttoptr i64 %t3839 to ptr
  %t3841 = load i64, ptr %t3840
  %t3842 = inttoptr i64 %t3841 to ptr
  %t3843 = call fastcc i64%t3842(i64 %t3838, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3844 = call i64 @rt_not(i64 %t3843)
  %t3845 = icmp ne i64 %t3844, 1
  br i1 %t3845, label %then974, label %else975
then974:
  %t3846 = call i64 @rt_intern(ptr @.str.sym.23)
  %t3847 = call i64 @rt_make_string(ptr @.str.lit.24, i64 18)
  %t3848 = load i64, ptr @"scheme.base:error"
  %t3849 = and i64 %t3848, -8
  %t3850 = inttoptr i64 %t3849 to ptr
  %t3851 = load i64, ptr %t3850
  %t3852 = inttoptr i64 %t3851 to ptr
  %t3853 = musttail call fastcc i64 %t3852(i64 %t3848, i64 3, i64 %t3846, i64 %t3847, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3853
else975:
  %t3854 = call i64 @rt_record_ref(i64 %a0, i64 32)
  %t3855 = call i64 @rt_not(i64 %t3854)
  %t3856 = icmp ne i64 %t3855, 1
  br i1 %t3856, label %then976, label %else977
then976:
  %t3857 = call i64 @rt_intern(ptr @.str.sym.23)
  %t3858 = call i64 @rt_make_string(ptr @.str.lit.25, i64 17)
  %t3859 = load i64, ptr @"scheme.base:error"
  %t3860 = and i64 %t3859, -8
  %t3861 = inttoptr i64 %t3860 to ptr
  %t3862 = load i64, ptr %t3861
  %t3863 = inttoptr i64 %t3862 to ptr
  %t3864 = musttail call fastcc i64 %t3863(i64 %t3859, i64 3, i64 %t3857, i64 %t3858, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3864
else977:
  %t3865 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t3866 = call i64 @rt_port_get_output_string(i64 %t3865)
  ret i64 %t3866
}

define fastcc i64 @"scheme.base:code:flush-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3871 = icmp eq i64 %argc, 1
  br i1 %t3871, label %argok979, label %arityerr978
arityerr978:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok979:
  %t3872 = call i64 @rt_intern(ptr @.str.sym.26)
  %t3873 = load i64, ptr @"scheme.base:%check-output-port"
  %t3874 = and i64 %t3873, -8
  %t3875 = inttoptr i64 %t3874 to ptr
  %t3876 = load i64, ptr %t3875
  %t3877 = inttoptr i64 %t3876 to ptr
  %t3878 = call fastcc i64%t3877(i64 %t3873, i64 2, i64 %a0, i64 %t3872, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3879 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t3880 = call i64 @rt_port_flush(i64 %t3879)
  ret i64 %t3880
}

define fastcc i64 @"scheme.base:code:close-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3885 = icmp eq i64 %argc, 1
  br i1 %t3885, label %argok981, label %arityerr980
arityerr980:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok981:
  %t3886 = load i64, ptr @"scheme.base:port?"
  %t3887 = and i64 %t3886, -8
  %t3888 = inttoptr i64 %t3887 to ptr
  %t3889 = load i64, ptr %t3888
  %t3890 = inttoptr i64 %t3889 to ptr
  %t3891 = call fastcc i64%t3890(i64 %t3886, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3892 = call i64 @rt_not(i64 %t3891)
  %t3893 = icmp ne i64 %t3892, 1
  br i1 %t3893, label %then982, label %else983
then982:
  %t3894 = call i64 @rt_intern(ptr @.str.sym.27)
  %t3895 = call i64 @rt_make_string(ptr @.str.lit.28, i64 10)
  %t3896 = load i64, ptr @"scheme.base:error"
  %t3897 = and i64 %t3896, -8
  %t3898 = inttoptr i64 %t3897 to ptr
  %t3899 = load i64, ptr %t3898
  %t3900 = inttoptr i64 %t3899 to ptr
  %t3901 = musttail call fastcc i64 %t3900(i64 %t3896, i64 3, i64 %t3894, i64 %t3895, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3901
else983:
  %t3902 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t3903 = icmp ne i64 %t3902, 1
  br i1 %t3903, label %then984, label %else985
then984:
  %t3904 = icmp ne i64 1, 1
  br i1 %t3904, label %then986, label %else987
then986:
  ret i64 1
else987:
  ret i64 17
else985:
  %t3905 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t3906 = call i64 @rt_not(i64 %t3905)
  %t3907 = icmp ne i64 %t3906, 1
  br i1 %t3907, label %then988, label %else989
then988:
  %t3908 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t3909 = call i64 @rt_port_close(i64 %t3908)
  br label %merge990
else989:
  br label %merge990
merge990:
  %t3910 = phi i64 [ %t3909, %then988 ], [ 17, %else989 ]
  %t3911 = call i64 @rt_record_set(i64 %a0, i64 40, i64 257)
  %t3912 = icmp ne i64 1, 1
  br i1 %t3912, label %then991, label %else992
then991:
  ret i64 1
else992:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:close-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3917 = icmp eq i64 %argc, 1
  br i1 %t3917, label %argok994, label %arityerr993
arityerr993:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok994:
  %t3918 = load i64, ptr @"scheme.base:input-port?"
  %t3919 = and i64 %t3918, -8
  %t3920 = inttoptr i64 %t3919 to ptr
  %t3921 = load i64, ptr %t3920
  %t3922 = inttoptr i64 %t3921 to ptr
  %t3923 = call fastcc i64%t3922(i64 %t3918, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3924 = icmp ne i64 %t3923, 1
  br i1 %t3924, label %then995, label %else996
then995:
  %t3925 = load i64, ptr @"scheme.base:close-port"
  %t3926 = and i64 %t3925, -8
  %t3927 = inttoptr i64 %t3926 to ptr
  %t3928 = load i64, ptr %t3927
  %t3929 = inttoptr i64 %t3928 to ptr
  %t3930 = musttail call fastcc i64 %t3929(i64 %t3925, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3930
else996:
  %t3931 = call i64 @rt_intern(ptr @.str.sym.29)
  %t3932 = call i64 @rt_make_string(ptr @.str.lit.30, i64 17)
  %t3933 = load i64, ptr @"scheme.base:error"
  %t3934 = and i64 %t3933, -8
  %t3935 = inttoptr i64 %t3934 to ptr
  %t3936 = load i64, ptr %t3935
  %t3937 = inttoptr i64 %t3936 to ptr
  %t3938 = musttail call fastcc i64 %t3937(i64 %t3933, i64 3, i64 %t3931, i64 %t3932, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3938
}

define fastcc i64 @"scheme.base:code:close-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3943 = icmp eq i64 %argc, 1
  br i1 %t3943, label %argok998, label %arityerr997
arityerr997:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok998:
  %t3944 = load i64, ptr @"scheme.base:output-port?"
  %t3945 = and i64 %t3944, -8
  %t3946 = inttoptr i64 %t3945 to ptr
  %t3947 = load i64, ptr %t3946
  %t3948 = inttoptr i64 %t3947 to ptr
  %t3949 = call fastcc i64%t3948(i64 %t3944, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3950 = icmp ne i64 %t3949, 1
  br i1 %t3950, label %then999, label %else1000
then999:
  %t3951 = load i64, ptr @"scheme.base:close-port"
  %t3952 = and i64 %t3951, -8
  %t3953 = inttoptr i64 %t3952 to ptr
  %t3954 = load i64, ptr %t3953
  %t3955 = inttoptr i64 %t3954 to ptr
  %t3956 = musttail call fastcc i64 %t3955(i64 %t3951, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3956
else1000:
  %t3957 = call i64 @rt_intern(ptr @.str.sym.31)
  %t3958 = call i64 @rt_make_string(ptr @.str.lit.32, i64 18)
  %t3959 = load i64, ptr @"scheme.base:error"
  %t3960 = and i64 %t3959, -8
  %t3961 = inttoptr i64 %t3960 to ptr
  %t3962 = load i64, ptr %t3961
  %t3963 = inttoptr i64 %t3962 to ptr
  %t3964 = musttail call fastcc i64 %t3963(i64 %t3959, i64 3, i64 %t3957, i64 %t3958, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3964
}

define fastcc i64 @"scheme.base:code:current-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3972 = icmp sge i64 %argc, 0
  br i1 %t3972, label %argok1002, label %arityerr1001
arityerr1001:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1002:
  %t3973 = call ptr @rt_alloc_words(i64 8)
  %t3974 = getelementptr i64, ptr %t3973, i64 0
  store i64 %a0, ptr %t3974
  %t3975 = getelementptr i64, ptr %t3973, i64 1
  store i64 %a1, ptr %t3975
  %t3976 = getelementptr i64, ptr %t3973, i64 2
  store i64 %a2, ptr %t3976
  %t3977 = getelementptr i64, ptr %t3973, i64 3
  store i64 %a3, ptr %t3977
  %t3978 = getelementptr i64, ptr %t3973, i64 4
  store i64 %a4, ptr %t3978
  %t3979 = getelementptr i64, ptr %t3973, i64 5
  store i64 %a5, ptr %t3979
  %t3980 = getelementptr i64, ptr %t3973, i64 6
  store i64 %a6, ptr %t3980
  %t3981 = getelementptr i64, ptr %t3973, i64 7
  store i64 %a7, ptr %t3981
  %t3982 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t3973, ptr %overflow)
  %t3983 = call i64 @rt_null_p(i64 %t3982)
  %t3984 = icmp ne i64 %t3983, 1
  br i1 %t3984, label %then1003, label %else1004
then1003:
  %t3985 = load i64, ptr @"scheme.base:%stdout-port"
  %t3986 = call i64 @rt_not(i64 %t3985)
  %t3987 = icmp ne i64 %t3986, 1
  br i1 %t3987, label %then1005, label %else1006
then1005:
  %t3988 = load i64, ptr @"emit.internal:%make-port"
  %t3989 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t3988, i64 6, i64 0, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t3990 = call i64 @rt_root(i64 %t3989)
  store i64 %t3990, ptr @"scheme.base:%stdout-port"
  %t3991 = call i64 @rt_set_current_output(i64 0)
  br label %merge1007
else1006:
  br label %merge1007
merge1007:
  %t3992 = phi i64 [ %t3991, %then1005 ], [ 17, %else1006 ]
  %t3993 = load i64, ptr @"scheme.base:%stdout-port"
  ret i64 %t3993
else1004:
  %t3994 = call i64 @rt_car(i64 %t3982)
  %t3995 = call i64 @rt_root(i64 %t3994)
  store i64 %t3995, ptr @"scheme.base:%stdout-port"
  %t3996 = call i64 @rt_record_ref(i64 %t3994, i64 0)
  %t3997 = call i64 @rt_set_current_output(i64 %t3996)
  %t3998 = icmp ne i64 1, 1
  br i1 %t3998, label %then1008, label %else1009
then1008:
  ret i64 1
else1009:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-error-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4003 = icmp sge i64 %argc, 0
  br i1 %t4003, label %argok1011, label %arityerr1010
arityerr1010:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1011:
  %t4004 = call ptr @rt_alloc_words(i64 8)
  %t4005 = getelementptr i64, ptr %t4004, i64 0
  store i64 %a0, ptr %t4005
  %t4006 = getelementptr i64, ptr %t4004, i64 1
  store i64 %a1, ptr %t4006
  %t4007 = getelementptr i64, ptr %t4004, i64 2
  store i64 %a2, ptr %t4007
  %t4008 = getelementptr i64, ptr %t4004, i64 3
  store i64 %a3, ptr %t4008
  %t4009 = getelementptr i64, ptr %t4004, i64 4
  store i64 %a4, ptr %t4009
  %t4010 = getelementptr i64, ptr %t4004, i64 5
  store i64 %a5, ptr %t4010
  %t4011 = getelementptr i64, ptr %t4004, i64 6
  store i64 %a6, ptr %t4011
  %t4012 = getelementptr i64, ptr %t4004, i64 7
  store i64 %a7, ptr %t4012
  %t4013 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t4004, ptr %overflow)
  %t4014 = call i64 @rt_null_p(i64 %t4013)
  %t4015 = icmp ne i64 %t4014, 1
  br i1 %t4015, label %then1012, label %else1013
then1012:
  %t4016 = load i64, ptr @"scheme.base:%stderr-port"
  %t4017 = call i64 @rt_not(i64 %t4016)
  %t4018 = icmp ne i64 %t4017, 1
  br i1 %t4018, label %then1014, label %else1015
then1014:
  %t4019 = load i64, ptr @"emit.internal:%make-port"
  %t4020 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t4019, i64 6, i64 8, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t4021 = call i64 @rt_root(i64 %t4020)
  store i64 %t4021, ptr @"scheme.base:%stderr-port"
  br label %merge1016
else1015:
  br label %merge1016
merge1016:
  %t4022 = phi i64 [ 17, %then1014 ], [ 17, %else1015 ]
  %t4023 = load i64, ptr @"scheme.base:%stderr-port"
  ret i64 %t4023
else1013:
  %t4024 = call i64 @rt_car(i64 %t4013)
  %t4025 = call i64 @rt_root(i64 %t4024)
  store i64 %t4025, ptr @"scheme.base:%stderr-port"
  %t4026 = icmp ne i64 1, 1
  br i1 %t4026, label %then1017, label %else1018
then1017:
  ret i64 1
else1018:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4031 = icmp sge i64 %argc, 0
  br i1 %t4031, label %argok1020, label %arityerr1019
arityerr1019:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1020:
  %t4032 = call ptr @rt_alloc_words(i64 8)
  %t4033 = getelementptr i64, ptr %t4032, i64 0
  store i64 %a0, ptr %t4033
  %t4034 = getelementptr i64, ptr %t4032, i64 1
  store i64 %a1, ptr %t4034
  %t4035 = getelementptr i64, ptr %t4032, i64 2
  store i64 %a2, ptr %t4035
  %t4036 = getelementptr i64, ptr %t4032, i64 3
  store i64 %a3, ptr %t4036
  %t4037 = getelementptr i64, ptr %t4032, i64 4
  store i64 %a4, ptr %t4037
  %t4038 = getelementptr i64, ptr %t4032, i64 5
  store i64 %a5, ptr %t4038
  %t4039 = getelementptr i64, ptr %t4032, i64 6
  store i64 %a6, ptr %t4039
  %t4040 = getelementptr i64, ptr %t4032, i64 7
  store i64 %a7, ptr %t4040
  %t4041 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t4032, ptr %overflow)
  %t4042 = call i64 @rt_null_p(i64 %t4041)
  %t4043 = icmp ne i64 %t4042, 1
  br i1 %t4043, label %then1021, label %else1022
then1021:
  %t4044 = load i64, ptr @"scheme.base:%stdin-port"
  %t4045 = call i64 @rt_not(i64 %t4044)
  %t4046 = icmp ne i64 %t4045, 1
  br i1 %t4046, label %then1023, label %else1024
then1023:
  %t4047 = load i64, ptr @"emit.internal:%make-port"
  %t4048 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t4047, i64 6, i64 1, i64 257, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t4049 = call i64 @rt_root(i64 %t4048)
  store i64 %t4049, ptr @"scheme.base:%stdin-port"
  br label %merge1025
else1024:
  br label %merge1025
merge1025:
  %t4050 = phi i64 [ 17, %then1023 ], [ 17, %else1024 ]
  %t4051 = load i64, ptr @"scheme.base:%stdin-port"
  ret i64 %t4051
else1022:
  %t4052 = call i64 @rt_car(i64 %t4041)
  %t4053 = call i64 @rt_root(i64 %t4052)
  store i64 %t4053, ptr @"scheme.base:%stdin-port"
  %t4054 = icmp ne i64 1, 1
  br i1 %t4054, label %then1026, label %else1027
then1026:
  ret i64 1
else1027:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_812"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4059 = icmp eq i64 %argc, 0
  br i1 %t4059, label %argok1029, label %arityerr1028
arityerr1028:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1029:
  %t4060 = icmp ne i64 1, 1
  br i1 %t4060, label %then1030, label %else1031
then1030:
  ret i64 1
else1031:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_814"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4061 = icmp eq i64 %argc, 0
  br i1 %t4061, label %argok1033, label %arityerr1032
arityerr1032:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1033:
  %t4062 = and i64 %self, -8
  %t4063 = inttoptr i64 %t4062 to ptr
  %t4064 = getelementptr i64, ptr %t4063, i64 2
  %t4065 = load i64, ptr %t4064
  %t4066 = and i64 %self, -8
  %t4067 = inttoptr i64 %t4066 to ptr
  %t4068 = getelementptr i64, ptr %t4067, i64 1
  %t4069 = load i64, ptr %t4068
  %t4070 = and i64 %t4069, -8
  %t4071 = inttoptr i64 %t4070 to ptr
  %t4072 = load i64, ptr %t4071
  %t4073 = inttoptr i64 %t4072 to ptr
  %t4074 = musttail call fastcc i64 %t4073(i64 %t4069, i64 1, i64 %t4065, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4074
}

define fastcc i64 @"scheme.base:code_816"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4075 = icmp eq i64 %argc, 0
  br i1 %t4075, label %argok1035, label %arityerr1034
arityerr1034:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1035:
  %t4076 = and i64 %self, -8
  %t4077 = inttoptr i64 %t4076 to ptr
  %t4078 = getelementptr i64, ptr %t4077, i64 1
  %t4079 = load i64, ptr %t4078
  %t4080 = load i64, ptr @"scheme.base:close-port"
  %t4081 = and i64 %t4080, -8
  %t4082 = inttoptr i64 %t4081 to ptr
  %t4083 = load i64, ptr %t4082
  %t4084 = inttoptr i64 %t4083 to ptr
  %t4085 = musttail call fastcc i64 %t4084(i64 %t4080, i64 1, i64 %t4079, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4085
}

define fastcc i64 @"scheme.base:code:call-with-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4086 = icmp eq i64 %argc, 2
  br i1 %t4086, label %argok1037, label %arityerr1036
arityerr1036:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1037:
  %t4087 = call ptr @rt_alloc_words(i64 1)
  %t4088 = ptrtoint ptr %t4087 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_812" to i64), ptr %t4087
  %t4089 = or i64 %t4088, 4
  %t4090 = call ptr @rt_alloc_words(i64 3)
  %t4091 = ptrtoint ptr %t4090 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_814" to i64), ptr %t4090
  %t4092 = getelementptr i64, ptr %t4090, i64 1
  store i64 %a1, ptr %t4092
  %t4093 = getelementptr i64, ptr %t4090, i64 2
  store i64 %a0, ptr %t4093
  %t4094 = or i64 %t4091, 4
  %t4095 = call ptr @rt_alloc_words(i64 2)
  %t4096 = ptrtoint ptr %t4095 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_816" to i64), ptr %t4095
  %t4097 = getelementptr i64, ptr %t4095, i64 1
  store i64 %a0, ptr %t4097
  %t4098 = or i64 %t4096, 4
  %t4099 = load i64, ptr @"scheme.base:dynamic-wind"
  %t4100 = and i64 %t4099, -8
  %t4101 = inttoptr i64 %t4100 to ptr
  %t4102 = load i64, ptr %t4101
  %t4103 = inttoptr i64 %t4102 to ptr
  %t4104 = musttail call fastcc i64 %t4103(i64 %t4099, i64 3, i64 %t4089, i64 %t4094, i64 %t4098, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4104
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
  %t2003 = call ptr @rt_alloc_words(i64 1)
  %t2004 = ptrtoint ptr %t2003 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%digit-in-radix" to i64), ptr %t2003
  %t2005 = or i64 %t2004, 4
  %t2006 = call i64 @rt_root(i64 %t2005)
  store i64 %t2006, ptr @"scheme.base:%digit-in-radix"
  ret i64 17
}

define i64 @"scheme.base:__init_87"() {
entry:
  %t2055 = call ptr @rt_alloc_words(i64 1)
  %t2056 = ptrtoint ptr %t2055 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%radix-digits" to i64), ptr %t2055
  %t2057 = or i64 %t2056, 4
  %t2058 = call i64 @rt_root(i64 %t2057)
  store i64 %t2058, ptr @"scheme.base:%radix-digits"
  ret i64 17
}

define i64 @"scheme.base:__init_88"() {
entry:
  %t2125 = call ptr @rt_alloc_words(i64 1)
  %t2126 = ptrtoint ptr %t2125 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%string->int" to i64), ptr %t2125
  %t2127 = or i64 %t2126, 4
  %t2128 = call i64 @rt_root(i64 %t2127)
  store i64 %t2128, ptr @"scheme.base:%string->int"
  ret i64 17
}

define i64 @"scheme.base:__init_89"() {
entry:
  %t2184 = call ptr @rt_alloc_words(i64 1)
  %t2185 = ptrtoint ptr %t2184 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string->number" to i64), ptr %t2184
  %t2186 = or i64 %t2185, 4
  %t2187 = call i64 @rt_root(i64 %t2186)
  store i64 %t2187, ptr @"scheme.base:string->number"
  ret i64 17
}

define i64 @"scheme.base:__init_90"() {
entry:
  %t2221 = call ptr @rt_alloc_words(i64 1)
  %t2222 = ptrtoint ptr %t2221 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error" to i64), ptr %t2221
  %t2223 = or i64 %t2222, 4
  %t2224 = call i64 @rt_root(i64 %t2223)
  store i64 %t2224, ptr @"scheme.base:error"
  ret i64 17
}

define i64 @"scheme.base:__init_91"() {
entry:
  %t2225 = call i64 @rt_root(i64 2)
  store i64 %t2225, ptr @"scheme.base:*winds*"
  ret i64 17
}

define i64 @"scheme.base:__init_92"() {
entry:
  %t2226 = call i64 @rt_root(i64 2)
  store i64 %t2226, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define i64 @"scheme.base:__init_93"() {
entry:
  %t2251 = call ptr @rt_alloc_words(i64 1)
  %t2252 = ptrtoint ptr %t2251 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%unwind-to" to i64), ptr %t2251
  %t2253 = or i64 %t2252, 4
  %t2254 = call i64 @rt_root(i64 %t2253)
  store i64 %t2254, ptr @"scheme.base:%unwind-to"
  ret i64 17
}

define i64 @"scheme.base:__init_94"() {
entry:
  %t2278 = call ptr @rt_alloc_words(i64 1)
  %t2279 = ptrtoint ptr %t2278 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:dynamic-wind" to i64), ptr %t2278
  %t2280 = or i64 %t2279, 4
  %t2281 = call i64 @rt_root(i64 %t2280)
  store i64 %t2281, ptr @"scheme.base:dynamic-wind"
  ret i64 17
}

define i64 @"scheme.base:__init_95"() {
entry:
  %t2342 = call ptr @rt_alloc_words(i64 1)
  %t2343 = ptrtoint ptr %t2342 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-current-continuation" to i64), ptr %t2342
  %t2344 = or i64 %t2343, 4
  %t2345 = call i64 @rt_root(i64 %t2344)
  store i64 %t2345, ptr @"scheme.base:call-with-current-continuation"
  ret i64 17
}

define i64 @"scheme.base:__init_96"() {
entry:
  %t2353 = call ptr @rt_alloc_words(i64 1)
  %t2354 = ptrtoint ptr %t2353 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call/cc" to i64), ptr %t2353
  %t2355 = or i64 %t2354, 4
  %t2356 = call i64 @rt_root(i64 %t2355)
  store i64 %t2356, ptr @"scheme.base:call/cc"
  ret i64 17
}

define i64 @"scheme.base:__init_97"() {
entry:
  %t2391 = call ptr @rt_alloc_words(i64 1)
  %t2392 = ptrtoint ptr %t2391 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-exception-handler" to i64), ptr %t2391
  %t2393 = or i64 %t2392, 4
  %t2394 = call i64 @rt_root(i64 %t2393)
  store i64 %t2394, ptr @"scheme.base:with-exception-handler"
  ret i64 17
}

define i64 @"scheme.base:__init_98"() {
entry:
  %t2413 = call ptr @rt_alloc_words(i64 1)
  %t2414 = ptrtoint ptr %t2413 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:raise" to i64), ptr %t2413
  %t2415 = or i64 %t2414, 4
  %t2416 = call i64 @rt_root(i64 %t2415)
  store i64 %t2416, ptr @"scheme.base:raise"
  ret i64 17
}

define i64 @"scheme.base:__init_99"() {
entry:
  %t2419 = call ptr @rt_alloc_words(i64 1)
  %t2420 = ptrtoint ptr %t2419 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object?" to i64), ptr %t2419
  %t2421 = or i64 %t2420, 4
  %t2422 = call i64 @rt_root(i64 %t2421)
  store i64 %t2422, ptr @"scheme.base:error-object?"
  ret i64 17
}

define i64 @"scheme.base:__init_100"() {
entry:
  %t2425 = call ptr @rt_alloc_words(i64 1)
  %t2426 = ptrtoint ptr %t2425 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-message" to i64), ptr %t2425
  %t2427 = or i64 %t2426, 4
  %t2428 = call i64 @rt_root(i64 %t2427)
  store i64 %t2428, ptr @"scheme.base:error-object-message"
  ret i64 17
}

define i64 @"scheme.base:__init_101"() {
entry:
  %t2431 = call ptr @rt_alloc_words(i64 1)
  %t2432 = ptrtoint ptr %t2431 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-irritants" to i64), ptr %t2431
  %t2433 = or i64 %t2432, 4
  %t2434 = call i64 @rt_root(i64 %t2433)
  store i64 %t2434, ptr @"scheme.base:error-object-irritants"
  ret i64 17
}

define i64 @"scheme.base:__init_102"() {
entry:
  %t2516 = call ptr @rt_alloc_words(i64 1)
  %t2517 = ptrtoint ptr %t2516 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-parameter" to i64), ptr %t2516
  %t2518 = or i64 %t2517, 4
  %t2519 = call i64 @rt_root(i64 %t2518)
  store i64 %t2519, ptr @"scheme.base:make-parameter"
  ret i64 17
}

define i64 @"scheme.base:__init_103"() {
entry:
  %t2600 = call ptr @rt_alloc_words(i64 1)
  %t2601 = ptrtoint ptr %t2600 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-parameters" to i64), ptr %t2600
  %t2602 = or i64 %t2601, 4
  %t2603 = call i64 @rt_root(i64 %t2602)
  store i64 %t2603, ptr @"scheme.base:with-parameters"
  ret i64 17
}

define i64 @"scheme.base:__init_104"() {
entry:
  %t2641 = call ptr @rt_alloc_words(i64 1)
  %t2642 = ptrtoint ptr %t2641 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->vector" to i64), ptr %t2641
  %t2643 = or i64 %t2642, 4
  %t2644 = call i64 @rt_root(i64 %t2643)
  store i64 %t2644, ptr @"scheme.base:list->vector"
  ret i64 17
}

define i64 @"scheme.base:__init_105"() {
entry:
  %t2662 = call ptr @rt_alloc_words(i64 1)
  %t2663 = ptrtoint ptr %t2662 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector" to i64), ptr %t2662
  %t2664 = or i64 %t2663, 4
  %t2665 = call i64 @rt_root(i64 %t2664)
  store i64 %t2665, ptr @"scheme.base:vector"
  ret i64 17
}

define i64 @"scheme.base:__init_106"() {
entry:
  %t2703 = call ptr @rt_alloc_words(i64 1)
  %t2704 = ptrtoint ptr %t2703 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->bytevector" to i64), ptr %t2703
  %t2705 = or i64 %t2704, 4
  %t2706 = call i64 @rt_root(i64 %t2705)
  store i64 %t2706, ptr @"scheme.base:list->bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_107"() {
entry:
  %t2724 = call ptr @rt_alloc_words(i64 1)
  %t2725 = ptrtoint ptr %t2724 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector" to i64), ptr %t2724
  %t2726 = or i64 %t2725, 4
  %t2727 = call i64 @rt_root(i64 %t2726)
  store i64 %t2727, ptr @"scheme.base:bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_108"() {
entry:
  %t2747 = call ptr @rt_alloc_words(i64 1)
  %t2748 = ptrtoint ptr %t2747 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:values" to i64), ptr %t2747
  %t2749 = or i64 %t2748, 4
  %t2750 = call i64 @rt_root(i64 %t2749)
  store i64 %t2750, ptr @"scheme.base:values"
  ret i64 17
}

define i64 @"scheme.base:__init_109"() {
entry:
  %t2792 = call ptr @rt_alloc_words(i64 1)
  %t2793 = ptrtoint ptr %t2792 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-values" to i64), ptr %t2792
  %t2794 = or i64 %t2793, 4
  %t2795 = call i64 @rt_root(i64 %t2794)
  store i64 %t2795, ptr @"scheme.base:call-with-values"
  ret i64 17
}

define i64 @"scheme.base:__init_110"() {
entry:
  %t2796 = call i64 @rt_root(i64 64)
  store i64 %t2796, ptr @"scheme.base:%ht-initial-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_111"() {
entry:
  %t2797 = call i64 @rt_root(i64 24)
  store i64 %t2797, ptr @"scheme.base:%ht-load-factor"
  ret i64 17
}

define i64 @"scheme.base:__init_112"() {
entry:
  %t2808 = call ptr @rt_alloc_words(i64 1)
  %t2809 = ptrtoint ptr %t2808 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-hash-table" to i64), ptr %t2808
  %t2810 = or i64 %t2809, 4
  %t2811 = call i64 @rt_root(i64 %t2810)
  store i64 %t2811, ptr @"scheme.base:make-hash-table"
  ret i64 17
}

define i64 @"scheme.base:__init_113"() {
entry:
  %t2814 = call ptr @rt_alloc_words(i64 1)
  %t2815 = ptrtoint ptr %t2814 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table?" to i64), ptr %t2814
  %t2816 = or i64 %t2815, 4
  %t2817 = call i64 @rt_root(i64 %t2816)
  store i64 %t2817, ptr @"scheme.base:hash-table?"
  ret i64 17
}

define i64 @"scheme.base:__init_114"() {
entry:
  %t2821 = call ptr @rt_alloc_words(i64 1)
  %t2822 = ptrtoint ptr %t2821 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-count" to i64), ptr %t2821
  %t2823 = or i64 %t2822, 4
  %t2824 = call i64 @rt_root(i64 %t2823)
  store i64 %t2824, ptr @"scheme.base:%ht-count"
  ret i64 17
}

define i64 @"scheme.base:__init_115"() {
entry:
  %t2828 = call ptr @rt_alloc_words(i64 1)
  %t2829 = ptrtoint ptr %t2828 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-buckets" to i64), ptr %t2828
  %t2830 = or i64 %t2829, 4
  %t2831 = call i64 @rt_root(i64 %t2830)
  store i64 %t2831, ptr @"scheme.base:%ht-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_116"() {
entry:
  %t2835 = call ptr @rt_alloc_words(i64 1)
  %t2836 = ptrtoint ptr %t2835 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-count!" to i64), ptr %t2835
  %t2837 = or i64 %t2836, 4
  %t2838 = call i64 @rt_root(i64 %t2837)
  store i64 %t2838, ptr @"scheme.base:%ht-set-count!"
  ret i64 17
}

define i64 @"scheme.base:__init_117"() {
entry:
  %t2842 = call ptr @rt_alloc_words(i64 1)
  %t2843 = ptrtoint ptr %t2842 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-buckets!" to i64), ptr %t2842
  %t2844 = or i64 %t2843, 4
  %t2845 = call i64 @rt_root(i64 %t2844)
  store i64 %t2845, ptr @"scheme.base:%ht-set-buckets!"
  ret i64 17
}

define i64 @"scheme.base:__init_118"() {
entry:
  %t2849 = call ptr @rt_alloc_words(i64 1)
  %t2850 = ptrtoint ptr %t2849 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-index" to i64), ptr %t2849
  %t2851 = or i64 %t2850, 4
  %t2852 = call i64 @rt_root(i64 %t2851)
  store i64 %t2852, ptr @"scheme.base:%ht-index"
  ret i64 17
}

define i64 @"scheme.base:__init_119"() {
entry:
  %t2868 = call ptr @rt_alloc_words(i64 1)
  %t2869 = ptrtoint ptr %t2868 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-assoc" to i64), ptr %t2868
  %t2870 = or i64 %t2869, 4
  %t2871 = call i64 @rt_root(i64 %t2870)
  store i64 %t2871, ptr @"scheme.base:%ht-assoc"
  ret i64 17
}

define i64 @"scheme.base:__init_120"() {
entry:
  %t2889 = call ptr @rt_alloc_words(i64 1)
  %t2890 = ptrtoint ptr %t2889 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-remove" to i64), ptr %t2889
  %t2891 = or i64 %t2890, 4
  %t2892 = call i64 @rt_root(i64 %t2891)
  store i64 %t2892, ptr @"scheme.base:%ht-remove"
  ret i64 17
}

define i64 @"scheme.base:__init_121"() {
entry:
  %t2916 = call ptr @rt_alloc_words(i64 1)
  %t2917 = ptrtoint ptr %t2916 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref/default" to i64), ptr %t2916
  %t2918 = or i64 %t2917, 4
  %t2919 = call i64 @rt_root(i64 %t2918)
  store i64 %t2919, ptr @"scheme.base:hash-table-ref/default"
  ret i64 17
}

define i64 @"scheme.base:__init_122"() {
entry:
  %t2942 = call ptr @rt_alloc_words(i64 1)
  %t2943 = ptrtoint ptr %t2942 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-contains?" to i64), ptr %t2942
  %t2944 = or i64 %t2943, 4
  %t2945 = call i64 @rt_root(i64 %t2944)
  store i64 %t2945, ptr @"scheme.base:hash-table-contains?"
  ret i64 17
}

define i64 @"scheme.base:__init_123"() {
entry:
  %t2976 = call ptr @rt_alloc_words(i64 1)
  %t2977 = ptrtoint ptr %t2976 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref" to i64), ptr %t2976
  %t2978 = or i64 %t2977, 4
  %t2979 = call i64 @rt_root(i64 %t2978)
  store i64 %t2979, ptr @"scheme.base:hash-table-ref"
  ret i64 17
}

define i64 @"scheme.base:__init_124"() {
entry:
  %t3063 = call ptr @rt_alloc_words(i64 1)
  %t3064 = ptrtoint ptr %t3063 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-set!" to i64), ptr %t3063
  %t3065 = or i64 %t3064, 4
  %t3066 = call i64 @rt_root(i64 %t3065)
  store i64 %t3066, ptr @"scheme.base:hash-table-set!"
  ret i64 17
}

define i64 @"scheme.base:__init_125"() {
entry:
  %t3116 = call ptr @rt_alloc_words(i64 1)
  %t3117 = ptrtoint ptr %t3116 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-delete!" to i64), ptr %t3116
  %t3118 = or i64 %t3117, 4
  %t3119 = call i64 @rt_root(i64 %t3118)
  store i64 %t3119, ptr @"scheme.base:hash-table-delete!"
  ret i64 17
}

define i64 @"scheme.base:__init_126"() {
entry:
  %t3223 = call ptr @rt_alloc_words(i64 1)
  %t3224 = ptrtoint ptr %t3223 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-grow!" to i64), ptr %t3223
  %t3225 = or i64 %t3224, 4
  %t3226 = call i64 @rt_root(i64 %t3225)
  store i64 %t3226, ptr @"scheme.base:%ht-grow!"
  ret i64 17
}

define i64 @"scheme.base:__init_127"() {
entry:
  %t3234 = call ptr @rt_alloc_words(i64 1)
  %t3235 = ptrtoint ptr %t3234 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-size" to i64), ptr %t3234
  %t3236 = or i64 %t3235, 4
  %t3237 = call i64 @rt_root(i64 %t3236)
  store i64 %t3237, ptr @"scheme.base:hash-table-size"
  ret i64 17
}

define i64 @"scheme.base:__init_128"() {
entry:
  %t3254 = call ptr @rt_alloc_words(i64 1)
  %t3255 = ptrtoint ptr %t3254 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-fold-buckets" to i64), ptr %t3254
  %t3256 = or i64 %t3255, 4
  %t3257 = call i64 @rt_root(i64 %t3256)
  store i64 %t3257, ptr @"scheme.base:%ht-fold-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_129"() {
entry:
  %t3305 = call ptr @rt_alloc_words(i64 1)
  %t3306 = ptrtoint ptr %t3305 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table->alist" to i64), ptr %t3305
  %t3307 = or i64 %t3306, 4
  %t3308 = call i64 @rt_root(i64 %t3307)
  store i64 %t3308, ptr @"scheme.base:hash-table->alist"
  ret i64 17
}

define i64 @"scheme.base:__init_130"() {
entry:
  %t3327 = call ptr @rt_alloc_words(i64 1)
  %t3328 = ptrtoint ptr %t3327 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-keys" to i64), ptr %t3327
  %t3329 = or i64 %t3328, 4
  %t3330 = call i64 @rt_root(i64 %t3329)
  store i64 %t3330, ptr @"scheme.base:hash-table-keys"
  ret i64 17
}

define i64 @"scheme.base:__init_131"() {
entry:
  %t3349 = call ptr @rt_alloc_words(i64 1)
  %t3350 = ptrtoint ptr %t3349 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-values" to i64), ptr %t3349
  %t3351 = or i64 %t3350, 4
  %t3352 = call i64 @rt_root(i64 %t3351)
  store i64 %t3352, ptr @"scheme.base:hash-table-values"
  ret i64 17
}

define i64 @"scheme.base:__init_132"() {
entry:
  %t3360 = call ptr @rt_alloc_words(i64 1)
  %t3361 = ptrtoint ptr %t3360 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-from-string" to i64), ptr %t3360
  %t3362 = or i64 %t3361, 4
  %t3363 = call i64 @rt_root(i64 %t3362)
  store i64 %t3363, ptr @"scheme.base:read-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_133"() {
entry:
  %t3418 = call ptr @rt_alloc_words(i64 1)
  %t3419 = ptrtoint ptr %t3418 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-all-from-string" to i64), ptr %t3418
  %t3420 = or i64 %t3419, 4
  %t3421 = call i64 @rt_root(i64 %t3420)
  store i64 %t3421, ptr @"scheme.base:read-all-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_134"() {
entry:
  %t3426 = call ptr @rt_alloc_words(i64 1)
  %t3427 = ptrtoint ptr %t3426 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port?" to i64), ptr %t3426
  %t3428 = or i64 %t3427, 4
  %t3429 = call i64 @rt_root(i64 %t3428)
  store i64 %t3429, ptr @"scheme.base:port?"
  ret i64 17
}

define i64 @"scheme.base:__init_135"() {
entry:
  %t3439 = call ptr @rt_alloc_words(i64 1)
  %t3440 = ptrtoint ptr %t3439 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port?" to i64), ptr %t3439
  %t3441 = or i64 %t3440, 4
  %t3442 = call i64 @rt_root(i64 %t3441)
  store i64 %t3442, ptr @"scheme.base:input-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_136"() {
entry:
  %t3453 = call ptr @rt_alloc_words(i64 1)
  %t3454 = ptrtoint ptr %t3453 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port?" to i64), ptr %t3453
  %t3455 = or i64 %t3454, 4
  %t3456 = call i64 @rt_root(i64 %t3455)
  store i64 %t3456, ptr @"scheme.base:output-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_137"() {
entry:
  %t3464 = call ptr @rt_alloc_words(i64 1)
  %t3465 = ptrtoint ptr %t3464 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:textual-port?" to i64), ptr %t3464
  %t3466 = or i64 %t3465, 4
  %t3467 = call i64 @rt_root(i64 %t3466)
  store i64 %t3467, ptr @"scheme.base:textual-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_138"() {
entry:
  %t3470 = call ptr @rt_alloc_words(i64 1)
  %t3471 = ptrtoint ptr %t3470 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port-closed?" to i64), ptr %t3470
  %t3472 = or i64 %t3471, 4
  %t3473 = call i64 @rt_root(i64 %t3472)
  store i64 %t3473, ptr @"scheme.base:port-closed?"
  ret i64 17
}

define i64 @"scheme.base:__init_139"() {
entry:
  %t3484 = call ptr @rt_alloc_words(i64 1)
  %t3485 = ptrtoint ptr %t3484 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port-open?" to i64), ptr %t3484
  %t3486 = or i64 %t3485, 4
  %t3487 = call i64 @rt_root(i64 %t3486)
  store i64 %t3487, ptr @"scheme.base:input-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_140"() {
entry:
  %t3498 = call ptr @rt_alloc_words(i64 1)
  %t3499 = ptrtoint ptr %t3498 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port-open?" to i64), ptr %t3498
  %t3500 = or i64 %t3499, 4
  %t3501 = call i64 @rt_root(i64 %t3500)
  store i64 %t3501, ptr @"scheme.base:output-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_141"() {
entry:
  %t3527 = call ptr @rt_alloc_words(i64 1)
  %t3528 = ptrtoint ptr %t3527 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-input-port" to i64), ptr %t3527
  %t3529 = or i64 %t3528, 4
  %t3530 = call i64 @rt_root(i64 %t3529)
  store i64 %t3530, ptr @"scheme.base:%check-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_142"() {
entry:
  %t3556 = call ptr @rt_alloc_words(i64 1)
  %t3557 = ptrtoint ptr %t3556 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-output-port" to i64), ptr %t3556
  %t3558 = or i64 %t3557, 4
  %t3559 = call i64 @rt_root(i64 %t3558)
  store i64 %t3559, ptr @"scheme.base:%check-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_143"() {
entry:
  %t3563 = call ptr @rt_alloc_words(i64 1)
  %t3564 = ptrtoint ptr %t3563 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-input-string" to i64), ptr %t3563
  %t3565 = or i64 %t3564, 4
  %t3566 = call i64 @rt_root(i64 %t3565)
  store i64 %t3566, ptr @"scheme.base:open-input-string"
  ret i64 17
}

define i64 @"scheme.base:__init_144"() {
entry:
  %t3587 = call ptr @rt_alloc_words(i64 1)
  %t3588 = ptrtoint ptr %t3587 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%port-at-eof?" to i64), ptr %t3587
  %t3589 = or i64 %t3588, 4
  %t3590 = call i64 @rt_root(i64 %t3589)
  store i64 %t3590, ptr @"scheme.base:%port-at-eof?"
  ret i64 17
}

define i64 @"scheme.base:__init_145"() {
entry:
  %t3620 = call ptr @rt_alloc_words(i64 1)
  %t3621 = ptrtoint ptr %t3620 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-char" to i64), ptr %t3620
  %t3622 = or i64 %t3621, 4
  %t3623 = call i64 @rt_root(i64 %t3622)
  store i64 %t3623, ptr @"scheme.base:read-char"
  ret i64 17
}

define i64 @"scheme.base:__init_146"() {
entry:
  %t3644 = call ptr @rt_alloc_words(i64 1)
  %t3645 = ptrtoint ptr %t3644 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:peek-char" to i64), ptr %t3644
  %t3646 = or i64 %t3645, 4
  %t3647 = call i64 @rt_root(i64 %t3646)
  store i64 %t3647, ptr @"scheme.base:peek-char"
  ret i64 17
}

define i64 @"scheme.base:__init_147"() {
entry:
  %t3765 = call ptr @rt_alloc_words(i64 1)
  %t3766 = ptrtoint ptr %t3765 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-line" to i64), ptr %t3765
  %t3767 = or i64 %t3766, 4
  %t3768 = call i64 @rt_root(i64 %t3767)
  store i64 %t3768, ptr @"scheme.base:read-line"
  ret i64 17
}

define i64 @"scheme.base:__init_148"() {
entry:
  %t3816 = call ptr @rt_alloc_words(i64 1)
  %t3817 = ptrtoint ptr %t3816 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-string" to i64), ptr %t3816
  %t3818 = or i64 %t3817, 4
  %t3819 = call i64 @rt_root(i64 %t3818)
  store i64 %t3819, ptr @"scheme.base:read-string"
  ret i64 17
}

define i64 @"scheme.base:__init_149"() {
entry:
  %t3833 = call ptr @rt_alloc_words(i64 1)
  %t3834 = ptrtoint ptr %t3833 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-output-string" to i64), ptr %t3833
  %t3835 = or i64 %t3834, 4
  %t3836 = call i64 @rt_root(i64 %t3835)
  store i64 %t3836, ptr @"scheme.base:open-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_150"() {
entry:
  %t3867 = call ptr @rt_alloc_words(i64 1)
  %t3868 = ptrtoint ptr %t3867 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:get-output-string" to i64), ptr %t3867
  %t3869 = or i64 %t3868, 4
  %t3870 = call i64 @rt_root(i64 %t3869)
  store i64 %t3870, ptr @"scheme.base:get-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_151"() {
entry:
  %t3881 = call ptr @rt_alloc_words(i64 1)
  %t3882 = ptrtoint ptr %t3881 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:flush-output-port" to i64), ptr %t3881
  %t3883 = or i64 %t3882, 4
  %t3884 = call i64 @rt_root(i64 %t3883)
  store i64 %t3884, ptr @"scheme.base:flush-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_152"() {
entry:
  %t3913 = call ptr @rt_alloc_words(i64 1)
  %t3914 = ptrtoint ptr %t3913 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-port" to i64), ptr %t3913
  %t3915 = or i64 %t3914, 4
  %t3916 = call i64 @rt_root(i64 %t3915)
  store i64 %t3916, ptr @"scheme.base:close-port"
  ret i64 17
}

define i64 @"scheme.base:__init_153"() {
entry:
  %t3939 = call ptr @rt_alloc_words(i64 1)
  %t3940 = ptrtoint ptr %t3939 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-input-port" to i64), ptr %t3939
  %t3941 = or i64 %t3940, 4
  %t3942 = call i64 @rt_root(i64 %t3941)
  store i64 %t3942, ptr @"scheme.base:close-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_154"() {
entry:
  %t3965 = call ptr @rt_alloc_words(i64 1)
  %t3966 = ptrtoint ptr %t3965 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-output-port" to i64), ptr %t3965
  %t3967 = or i64 %t3966, 4
  %t3968 = call i64 @rt_root(i64 %t3967)
  store i64 %t3968, ptr @"scheme.base:close-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_155"() {
entry:
  %t3969 = call i64 @rt_root(i64 1)
  store i64 %t3969, ptr @"scheme.base:%stdout-port"
  ret i64 17
}

define i64 @"scheme.base:__init_156"() {
entry:
  %t3970 = call i64 @rt_root(i64 1)
  store i64 %t3970, ptr @"scheme.base:%stderr-port"
  ret i64 17
}

define i64 @"scheme.base:__init_157"() {
entry:
  %t3971 = call i64 @rt_root(i64 1)
  store i64 %t3971, ptr @"scheme.base:%stdin-port"
  ret i64 17
}

define i64 @"scheme.base:__init_158"() {
entry:
  %t3999 = call ptr @rt_alloc_words(i64 1)
  %t4000 = ptrtoint ptr %t3999 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-output-port" to i64), ptr %t3999
  %t4001 = or i64 %t4000, 4
  %t4002 = call i64 @rt_root(i64 %t4001)
  store i64 %t4002, ptr @"scheme.base:current-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_159"() {
entry:
  %t4027 = call ptr @rt_alloc_words(i64 1)
  %t4028 = ptrtoint ptr %t4027 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-error-port" to i64), ptr %t4027
  %t4029 = or i64 %t4028, 4
  %t4030 = call i64 @rt_root(i64 %t4029)
  store i64 %t4030, ptr @"scheme.base:current-error-port"
  ret i64 17
}

define i64 @"scheme.base:__init_160"() {
entry:
  %t4055 = call ptr @rt_alloc_words(i64 1)
  %t4056 = ptrtoint ptr %t4055 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-input-port" to i64), ptr %t4055
  %t4057 = or i64 %t4056, 4
  %t4058 = call i64 @rt_root(i64 %t4057)
  store i64 %t4058, ptr @"scheme.base:current-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_161"() {
entry:
  %t4105 = call ptr @rt_alloc_words(i64 1)
  %t4106 = ptrtoint ptr %t4105 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-port" to i64), ptr %t4105
  %t4107 = or i64 %t4106, 4
  %t4108 = call i64 @rt_root(i64 %t4107)
  store i64 %t4108, ptr @"scheme.base:call-with-port"
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

