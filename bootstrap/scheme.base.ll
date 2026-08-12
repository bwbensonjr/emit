declare align 8 ptr @rt_alloc_words(i64)
declare i64 @rt_cons(i64, i64)
declare i64 @rt_car(i64)
declare i64 @rt_cdr(i64)
declare i64 @rt_set_car(i64, i64)
declare i64 @rt_set_cdr(i64, i64)
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
declare i64 @rt_procedure_p(i64)
declare i64 @rt_make_string_1(i64)
declare i64 @rt_make_vector_1(i64)
declare i64 @rt_string_copy_from(i64, i64)
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
declare void @rt_check_callable(i64)
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
@.str.sym.5 = private unnamed_addr constant [13 x i8] c"string->list\00"
@.str.lit.6 = private unnamed_addr constant [2 x i8] c"0\00"
@.str.lit.7 = private unnamed_addr constant [55 x i8] c"number->string: radix must be 10 for an inexact number\00"
@.str.lit.8 = private unnamed_addr constant [34 x i8] c"number->string: unsupported radix\00"
@.str.lit.9 = private unnamed_addr constant [34 x i8] c"string->number: unsupported radix\00"
@.str.lit.10 = private unnamed_addr constant [3 x i8] c": \00"
@.str.sym.11 = private unnamed_addr constant [8 x i8] c"call/cc\00"
@.str.lit.12 = private unnamed_addr constant [40 x i8] c"continuation invoked outside its extent\00"
@.str.lit.13 = private unnamed_addr constant [20 x i8] c"range out of bounds\00"
@.str.sym.14 = private unnamed_addr constant [13 x i8] c"vector->list\00"
@.str.sym.15 = private unnamed_addr constant [12 x i8] c"vector-copy\00"
@.str.sym.16 = private unnamed_addr constant [13 x i8] c"vector-fill!\00"
@.str.sym.17 = private unnamed_addr constant [13 x i8] c"vector-copy!\00"
@.str.sym.18 = private unnamed_addr constant [15 x i8] c"string->vector\00"
@.str.sym.19 = private unnamed_addr constant [15 x i8] c"vector->string\00"
@.str.sym.20 = private unnamed_addr constant [13 x i8] c"string-fill!\00"
@.str.sym.21 = private unnamed_addr constant [13 x i8] c"string-copy!\00"
@.str.sym.22 = private unnamed_addr constant [16 x i8] c"bytevector-copy\00"
@.str.sym.23 = private unnamed_addr constant [17 x i8] c"bytevector-copy!\00"
@.str.lit.24 = private unnamed_addr constant [70 x i8] c"rationalize: no exact rational in range (Emit has no exact rationals)\00"
@.str.lit.25 = private unnamed_addr constant [70 x i8] c"rationalize: no exact rational in range (Emit has no exact rationals)\00"
@.str.lit.26 = private unnamed_addr constant [60 x i8] c"rationalize: no rational found within the denominator limit\00"
@.flo.lit.27 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.flo.lit.28 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.flo.lit.29 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.lit.30 = private unnamed_addr constant [30 x i8] c"hash-table-ref: key not found\00"
@.str.sym.31 = private unnamed_addr constant [17 x i8] c"rd-block-comment\00"
@.str.sym.32 = private unnamed_addr constant [5 x i8] c"read\00"
@.str.lit.33 = private unnamed_addr constant [46 x i8] c"unterminated block comment #| opened at index\00"
@.str.sym.34 = private unnamed_addr constant [7 x i8] c"rd-bar\00"
@.str.lit.35 = private unnamed_addr constant [42 x i8] c"unterminated |identifier| opened at index\00"
@.str.sym.36 = private unnamed_addr constant [21 x i8] c"rd-unterminated-list\00"
@.str.lit.37 = private unnamed_addr constant [14 x i8] c"unterminated \00"
@.str.lit.38 = private unnamed_addr constant [7 x i8] c"list [\00"
@.str.lit.39 = private unnamed_addr constant [16 x i8] c"bytevector #u8(\00"
@.str.lit.40 = private unnamed_addr constant [10 x i8] c"vector #(\00"
@.str.lit.41 = private unnamed_addr constant [7 x i8] c"list (\00"
@.str.lit.42 = private unnamed_addr constant [17 x i8] c" opened at index\00"
@.str.sym.43 = private unnamed_addr constant [23 x i8] c"rd-unterminated-string\00"
@.str.lit.44 = private unnamed_addr constant [38 x i8] c"unterminated string \22 opened at index\00"
@.str.sym.45 = private unnamed_addr constant [7 x i8] c"rd-eof\00"
@.str.lit.46 = private unnamed_addr constant [50 x i8] c"end of input where a datum was expected, at index\00"
@.str.sym.47 = private unnamed_addr constant [14 x i8] c"rd-unexpected\00"
@.str.lit.48 = private unnamed_addr constant [24 x i8] c"no datum here, at index\00"
@.str.sym.49 = private unnamed_addr constant [12 x i8] c"rd-rational\00"
@.str.lit.50 = private unnamed_addr constant [57 x i8] c"rational literal syntax is not supported -- Emit has no \00"
@.str.lit.51 = private unnamed_addr constant [39 x i8] c"exact rationals; write 0.5, or (/ 1 2)\00"
@.str.lit.52 = private unnamed_addr constant [20 x i8] c"unrecognized syntax\00"
@.str.lit.53 = private unnamed_addr constant [18 x i8] c"not an input port\00"
@.str.lit.54 = private unnamed_addr constant [15 x i8] c"port is closed\00"
@.str.lit.55 = private unnamed_addr constant [19 x i8] c"not an output port\00"
@.str.lit.56 = private unnamed_addr constant [15 x i8] c"port is closed\00"
@.str.sym.57 = private unnamed_addr constant [10 x i8] c"read-char\00"
@.str.sym.58 = private unnamed_addr constant [10 x i8] c"peek-char\00"
@.str.sym.59 = private unnamed_addr constant [10 x i8] c"read-line\00"
@.str.sym.60 = private unnamed_addr constant [12 x i8] c"read-string\00"
@.str.sym.61 = private unnamed_addr constant [19 x i8] c"open-output-string\00"
@.str.lit.62 = private unnamed_addr constant [34 x i8] c"cannot open an output string port\00"
@.str.sym.63 = private unnamed_addr constant [18 x i8] c"get-output-string\00"
@.str.lit.64 = private unnamed_addr constant [19 x i8] c"not an output port\00"
@.str.lit.65 = private unnamed_addr constant [18 x i8] c"not a string port\00"
@.str.sym.66 = private unnamed_addr constant [18 x i8] c"flush-output-port\00"
@.str.sym.67 = private unnamed_addr constant [11 x i8] c"close-port\00"
@.str.lit.68 = private unnamed_addr constant [11 x i8] c"not a port\00"
@.str.sym.69 = private unnamed_addr constant [17 x i8] c"close-input-port\00"
@.str.lit.70 = private unnamed_addr constant [18 x i8] c"not an input port\00"
@.str.sym.71 = private unnamed_addr constant [18 x i8] c"close-output-port\00"
@.str.lit.72 = private unnamed_addr constant [19 x i8] c"not an output port\00"
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
@"scheme.base:member-by" = global i64 0
@"scheme.base:assoc" = global i64 0
@"scheme.base:assoc-by" = global i64 0
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
@"scheme.base:list-set!" = global i64 0
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
@"scheme.base:rng-start" = global i64 0
@"scheme.base:rng-end" = global i64 0
@"scheme.base:rng-check" = global i64 0
@"scheme.base:assv" = global i64 0
@"scheme.base:list-copy" = global i64 0
@"scheme.base:boolean=?" = global i64 0
@"scheme.base:symbol=?" = global i64 0
@"scheme.base:eqv-chain?" = global i64 0
@"scheme.base:str-cmp" = global i64 0
@"scheme.base:str-chain?" = global i64 0
@"scheme.base:string<?" = global i64 0
@"scheme.base:string>?" = global i64 0
@"scheme.base:string<=?" = global i64 0
@"scheme.base:string>=?" = global i64 0
@"scheme.base:vector->list" = global i64 0
@"scheme.base:vector-copy" = global i64 0
@"scheme.base:vector-append" = global i64 0
@"scheme.base:vec-total" = global i64 0
@"scheme.base:vector-fill!" = global i64 0
@"scheme.base:vector-copy!" = global i64 0
@"scheme.base:vector-map" = global i64 0
@"scheme.base:vector-for-each" = global i64 0
@"scheme.base:vec-min-len" = global i64 0
@"scheme.base:vec-nth" = global i64 0
@"scheme.base:string->vector" = global i64 0
@"scheme.base:vector->string" = global i64 0
@"scheme.base:string-map" = global i64 0
@"scheme.base:str-map1" = global i64 0
@"scheme.base:str-mapn" = global i64 0
@"scheme.base:string-for-each" = global i64 0
@"scheme.base:str-min-len" = global i64 0
@"scheme.base:str-nth" = global i64 0
@"scheme.base:string-fill!" = global i64 0
@"scheme.base:string-copy!" = global i64 0
@"scheme.base:bytevector-copy" = global i64 0
@"scheme.base:bytevector-copy!" = global i64 0
@"scheme.base:bytevector-append" = global i64 0
@"scheme.base:bv-total" = global i64 0
@"scheme.base:rat-max-denom" = global i64 0
@"scheme.base:rationalize" = global i64 0
@"scheme.base:rat-exact" = global i64 0
@"scheme.base:rat-ceil" = global i64 0
@"scheme.base:rat-floor" = global i64 0
@"scheme.base:rat-inexact" = global i64 0
@"scheme.base:rat-num-in" = global i64 0
@"scheme.base:rat-ceil-flo" = global i64 0
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
@"scheme.base:read-all-from-string-ci" = global i64 0
@"scheme.base:rd-all" = global i64 0
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
  call void @rt_check_callable(i64 %t89)
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
  call void @rt_check_callable(i64 %t119)
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
  call void @rt_check_callable(i64 %t147)
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
  call void @rt_check_callable(i64 %a0)
  %t161 = and i64 %a0, -8
  %t162 = inttoptr i64 %t161 to ptr
  %t163 = load i64, ptr %t162
  %t164 = inttoptr i64 %t163 to ptr
  %t165 = call fastcc i64%t164(i64 %a0, i64 1, i64 %t160, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t166 = call i64 @rt_cdr(i64 %a1)
  %t167 = load i64, ptr @"scheme.base:%map1"
  call void @rt_check_callable(i64 %t167)
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
  call void @rt_check_callable(i64 %t185)
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
  call void @rt_check_callable(i64 %t200)
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
  call void @rt_check_callable(i64 %t210)
  %t211 = and i64 %t210, -8
  %t212 = inttoptr i64 %t211 to ptr
  %t213 = load i64, ptr %t212
  %t214 = inttoptr i64 %t213 to ptr
  %t215 = call fastcc i64%t214(i64 %t210, i64 2, i64 %t209, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  call void @rt_check_callable(i64 %a0)
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
  call void @rt_check_callable(i64 %t246)
  %t247 = and i64 %t246, -8
  %t248 = inttoptr i64 %t247 to ptr
  %t249 = load i64, ptr %t248
  %t250 = inttoptr i64 %t249 to ptr
  %t251 = call fastcc i64%t250(i64 %t246, i64 2, i64 %t245, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t252 = load i64, ptr @"scheme.base:%mapn"
  call void @rt_check_callable(i64 %t252)
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
  call void @rt_check_callable(i64 %t276)
  %t277 = and i64 %t276, -8
  %t278 = inttoptr i64 %t277 to ptr
  %t279 = load i64, ptr %t278
  %t280 = inttoptr i64 %t279 to ptr
  %t281 = musttail call fastcc i64 %t280(i64 %t276, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t281
else57:
  %t282 = call i64 @rt_cons(i64 %a1, i64 %t273)
  %t283 = load i64, ptr @"scheme.base:%mapn"
  call void @rt_check_callable(i64 %t283)
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
  call void @rt_check_callable(i64 %t300)
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
  call void @rt_check_callable(i64 %t317)
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
  call void @rt_check_callable(i64 %t336)
  %t337 = and i64 %t336, -8
  %t338 = inttoptr i64 %t337 to ptr
  %t339 = load i64, ptr %t338
  %t340 = inttoptr i64 %t339 to ptr
  %t341 = musttail call fastcc i64 %t340(i64 %t336, i64 2, i64 %a0, i64 %t335, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t341
}

define fastcc i64 @"scheme.base:code:member"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t346 = icmp sge i64 %argc, 2
  br i1 %t346, label %argok77, label %arityerr76
arityerr76:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok77:
  %t347 = call ptr @rt_alloc_words(i64 8)
  %t348 = getelementptr i64, ptr %t347, i64 0
  store i64 %a0, ptr %t348
  %t349 = getelementptr i64, ptr %t347, i64 1
  store i64 %a1, ptr %t349
  %t350 = getelementptr i64, ptr %t347, i64 2
  store i64 %a2, ptr %t350
  %t351 = getelementptr i64, ptr %t347, i64 3
  store i64 %a3, ptr %t351
  %t352 = getelementptr i64, ptr %t347, i64 4
  store i64 %a4, ptr %t352
  %t353 = getelementptr i64, ptr %t347, i64 5
  store i64 %a5, ptr %t353
  %t354 = getelementptr i64, ptr %t347, i64 6
  store i64 %a6, ptr %t354
  %t355 = getelementptr i64, ptr %t347, i64 7
  store i64 %a7, ptr %t355
  %t356 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t347, ptr %overflow)
  %t357 = call i64 @rt_null_p(i64 %t356)
  %t358 = icmp ne i64 %t357, 1
  br i1 %t358, label %then78, label %else79
then78:
  %t359 = call i64 @rt_null_p(i64 %a1)
  %t360 = icmp ne i64 %t359, 1
  br i1 %t360, label %then80, label %else81
then80:
  ret i64 1
else81:
  %t361 = call i64 @rt_car(i64 %a1)
  %t362 = call i64 @rt_equal(i64 %a0, i64 %t361)
  %t363 = icmp ne i64 %t362, 1
  br i1 %t363, label %then82, label %else83
then82:
  ret i64 %a1
else83:
  %t364 = call i64 @rt_cdr(i64 %a1)
  %t365 = load i64, ptr @"scheme.base:member"
  call void @rt_check_callable(i64 %t365)
  %t366 = and i64 %t365, -8
  %t367 = inttoptr i64 %t366 to ptr
  %t368 = load i64, ptr %t367
  %t369 = inttoptr i64 %t368 to ptr
  %t370 = musttail call fastcc i64 %t369(i64 %t365, i64 2, i64 %a0, i64 %t364, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t370
else79:
  %t371 = call i64 @rt_car(i64 %t356)
  %t372 = load i64, ptr @"scheme.base:member-by"
  call void @rt_check_callable(i64 %t372)
  %t373 = and i64 %t372, -8
  %t374 = inttoptr i64 %t373 to ptr
  %t375 = load i64, ptr %t374
  %t376 = inttoptr i64 %t375 to ptr
  %t377 = musttail call fastcc i64 %t376(i64 %t372, i64 3, i64 %a0, i64 %a1, i64 %t371, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t377
}

define fastcc i64 @"scheme.base:code:member-by"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t382 = icmp eq i64 %argc, 3
  br i1 %t382, label %argok85, label %arityerr84
arityerr84:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok85:
  %t383 = call i64 @rt_null_p(i64 %a1)
  %t384 = icmp ne i64 %t383, 1
  br i1 %t384, label %then86, label %else87
then86:
  ret i64 1
else87:
  %t385 = call i64 @rt_car(i64 %a1)
  call void @rt_check_callable(i64 %a2)
  %t386 = and i64 %a2, -8
  %t387 = inttoptr i64 %t386 to ptr
  %t388 = load i64, ptr %t387
  %t389 = inttoptr i64 %t388 to ptr
  %t390 = call fastcc i64%t389(i64 %a2, i64 2, i64 %a0, i64 %t385, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t391 = icmp ne i64 %t390, 1
  br i1 %t391, label %then88, label %else89
then88:
  ret i64 %a1
else89:
  %t392 = call i64 @rt_cdr(i64 %a1)
  %t393 = load i64, ptr @"scheme.base:member-by"
  call void @rt_check_callable(i64 %t393)
  %t394 = and i64 %t393, -8
  %t395 = inttoptr i64 %t394 to ptr
  %t396 = load i64, ptr %t395
  %t397 = inttoptr i64 %t396 to ptr
  %t398 = musttail call fastcc i64 %t397(i64 %t393, i64 3, i64 %a0, i64 %t392, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t398
}

define fastcc i64 @"scheme.base:code:assoc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t403 = icmp sge i64 %argc, 2
  br i1 %t403, label %argok91, label %arityerr90
arityerr90:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok91:
  %t404 = call ptr @rt_alloc_words(i64 8)
  %t405 = getelementptr i64, ptr %t404, i64 0
  store i64 %a0, ptr %t405
  %t406 = getelementptr i64, ptr %t404, i64 1
  store i64 %a1, ptr %t406
  %t407 = getelementptr i64, ptr %t404, i64 2
  store i64 %a2, ptr %t407
  %t408 = getelementptr i64, ptr %t404, i64 3
  store i64 %a3, ptr %t408
  %t409 = getelementptr i64, ptr %t404, i64 4
  store i64 %a4, ptr %t409
  %t410 = getelementptr i64, ptr %t404, i64 5
  store i64 %a5, ptr %t410
  %t411 = getelementptr i64, ptr %t404, i64 6
  store i64 %a6, ptr %t411
  %t412 = getelementptr i64, ptr %t404, i64 7
  store i64 %a7, ptr %t412
  %t413 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t404, ptr %overflow)
  %t414 = call i64 @rt_null_p(i64 %t413)
  %t415 = icmp ne i64 %t414, 1
  br i1 %t415, label %then92, label %else93
then92:
  %t416 = call i64 @rt_null_p(i64 %a1)
  %t417 = icmp ne i64 %t416, 1
  br i1 %t417, label %then94, label %else95
then94:
  ret i64 1
else95:
  %t418 = call i64 @rt_car(i64 %a1)
  %t419 = call i64 @rt_car(i64 %t418)
  %t420 = call i64 @rt_equal(i64 %a0, i64 %t419)
  %t421 = icmp ne i64 %t420, 1
  br i1 %t421, label %then96, label %else97
then96:
  %t422 = call i64 @rt_car(i64 %a1)
  ret i64 %t422
else97:
  %t423 = call i64 @rt_cdr(i64 %a1)
  %t424 = load i64, ptr @"scheme.base:assoc"
  call void @rt_check_callable(i64 %t424)
  %t425 = and i64 %t424, -8
  %t426 = inttoptr i64 %t425 to ptr
  %t427 = load i64, ptr %t426
  %t428 = inttoptr i64 %t427 to ptr
  %t429 = musttail call fastcc i64 %t428(i64 %t424, i64 2, i64 %a0, i64 %t423, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t429
else93:
  %t430 = call i64 @rt_car(i64 %t413)
  %t431 = load i64, ptr @"scheme.base:assoc-by"
  call void @rt_check_callable(i64 %t431)
  %t432 = and i64 %t431, -8
  %t433 = inttoptr i64 %t432 to ptr
  %t434 = load i64, ptr %t433
  %t435 = inttoptr i64 %t434 to ptr
  %t436 = musttail call fastcc i64 %t435(i64 %t431, i64 3, i64 %a0, i64 %a1, i64 %t430, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t436
}

define fastcc i64 @"scheme.base:code:assoc-by"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t441 = icmp eq i64 %argc, 3
  br i1 %t441, label %argok99, label %arityerr98
arityerr98:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok99:
  %t442 = call i64 @rt_null_p(i64 %a1)
  %t443 = icmp ne i64 %t442, 1
  br i1 %t443, label %then100, label %else101
then100:
  ret i64 1
else101:
  %t444 = call i64 @rt_car(i64 %a1)
  %t445 = call i64 @rt_car(i64 %t444)
  call void @rt_check_callable(i64 %a2)
  %t446 = and i64 %a2, -8
  %t447 = inttoptr i64 %t446 to ptr
  %t448 = load i64, ptr %t447
  %t449 = inttoptr i64 %t448 to ptr
  %t450 = call fastcc i64%t449(i64 %a2, i64 2, i64 %a0, i64 %t445, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t451 = icmp ne i64 %t450, 1
  br i1 %t451, label %then102, label %else103
then102:
  %t452 = call i64 @rt_car(i64 %a1)
  ret i64 %t452
else103:
  %t453 = call i64 @rt_cdr(i64 %a1)
  %t454 = load i64, ptr @"scheme.base:assoc-by"
  call void @rt_check_callable(i64 %t454)
  %t455 = and i64 %t454, -8
  %t456 = inttoptr i64 %t455 to ptr
  %t457 = load i64, ptr %t456
  %t458 = inttoptr i64 %t457 to ptr
  %t459 = musttail call fastcc i64 %t458(i64 %t454, i64 3, i64 %a0, i64 %t453, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t459
}

define fastcc i64 @"scheme.base:code:filter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t464 = icmp eq i64 %argc, 2
  br i1 %t464, label %argok105, label %arityerr104
arityerr104:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok105:
  %t465 = call i64 @rt_null_p(i64 %a1)
  %t466 = icmp ne i64 %t465, 1
  br i1 %t466, label %then106, label %else107
then106:
  ret i64 2
else107:
  %t467 = call i64 @rt_car(i64 %a1)
  call void @rt_check_callable(i64 %a0)
  %t468 = and i64 %a0, -8
  %t469 = inttoptr i64 %t468 to ptr
  %t470 = load i64, ptr %t469
  %t471 = inttoptr i64 %t470 to ptr
  %t472 = call fastcc i64%t471(i64 %a0, i64 1, i64 %t467, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t473 = icmp ne i64 %t472, 1
  br i1 %t473, label %then108, label %else109
then108:
  %t474 = call i64 @rt_car(i64 %a1)
  %t475 = call i64 @rt_cdr(i64 %a1)
  %t476 = load i64, ptr @"scheme.base:filter"
  call void @rt_check_callable(i64 %t476)
  %t477 = and i64 %t476, -8
  %t478 = inttoptr i64 %t477 to ptr
  %t479 = load i64, ptr %t478
  %t480 = inttoptr i64 %t479 to ptr
  %t481 = call fastcc i64%t480(i64 %t476, i64 2, i64 %a0, i64 %t475, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t482 = call i64 @rt_cons(i64 %t474, i64 %t481)
  ret i64 %t482
else109:
  %t483 = call i64 @rt_cdr(i64 %a1)
  %t484 = load i64, ptr @"scheme.base:filter"
  call void @rt_check_callable(i64 %t484)
  %t485 = and i64 %t484, -8
  %t486 = inttoptr i64 %t485 to ptr
  %t487 = load i64, ptr %t486
  %t488 = inttoptr i64 %t487 to ptr
  %t489 = musttail call fastcc i64 %t488(i64 %t484, i64 2, i64 %a0, i64 %t483, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t489
}

define fastcc i64 @"scheme.base:code:fold-left"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t494 = icmp eq i64 %argc, 3
  br i1 %t494, label %argok111, label %arityerr110
arityerr110:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok111:
  %t495 = call i64 @rt_null_p(i64 %a2)
  %t496 = icmp ne i64 %t495, 1
  br i1 %t496, label %then112, label %else113
then112:
  ret i64 %a1
else113:
  %t497 = call i64 @rt_car(i64 %a2)
  call void @rt_check_callable(i64 %a0)
  %t498 = and i64 %a0, -8
  %t499 = inttoptr i64 %t498 to ptr
  %t500 = load i64, ptr %t499
  %t501 = inttoptr i64 %t500 to ptr
  %t502 = call fastcc i64%t501(i64 %a0, i64 2, i64 %a1, i64 %t497, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t503 = call i64 @rt_cdr(i64 %a2)
  %t504 = load i64, ptr @"scheme.base:fold-left"
  call void @rt_check_callable(i64 %t504)
  %t505 = and i64 %t504, -8
  %t506 = inttoptr i64 %t505 to ptr
  %t507 = load i64, ptr %t506
  %t508 = inttoptr i64 %t507 to ptr
  %t509 = musttail call fastcc i64 %t508(i64 %t504, i64 3, i64 %a0, i64 %t502, i64 %t503, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t509
}

define fastcc i64 @"scheme.base:code:fold-right"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t514 = icmp eq i64 %argc, 3
  br i1 %t514, label %argok115, label %arityerr114
arityerr114:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok115:
  %t515 = call i64 @rt_null_p(i64 %a2)
  %t516 = icmp ne i64 %t515, 1
  br i1 %t516, label %then116, label %else117
then116:
  ret i64 %a1
else117:
  %t517 = call i64 @rt_car(i64 %a2)
  %t518 = call i64 @rt_cdr(i64 %a2)
  %t519 = load i64, ptr @"scheme.base:fold-right"
  call void @rt_check_callable(i64 %t519)
  %t520 = and i64 %t519, -8
  %t521 = inttoptr i64 %t520 to ptr
  %t522 = load i64, ptr %t521
  %t523 = inttoptr i64 %t522 to ptr
  %t524 = call fastcc i64%t523(i64 %t519, i64 3, i64 %a0, i64 %a1, i64 %t518, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  call void @rt_check_callable(i64 %a0)
  %t525 = and i64 %a0, -8
  %t526 = inttoptr i64 %t525 to ptr
  %t527 = load i64, ptr %t526
  %t528 = inttoptr i64 %t527 to ptr
  %t529 = musttail call fastcc i64 %t528(i64 %a0, i64 2, i64 %t517, i64 %t524, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t529
}

define fastcc i64 @"scheme.base:code:%for-each1"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t534 = icmp eq i64 %argc, 2
  br i1 %t534, label %argok119, label %arityerr118
arityerr118:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok119:
  %t535 = call i64 @rt_null_p(i64 %a1)
  %t536 = icmp ne i64 %t535, 1
  br i1 %t536, label %then120, label %else121
then120:
  %t537 = icmp ne i64 1, 1
  br i1 %t537, label %then122, label %else123
then122:
  ret i64 1
else123:
  ret i64 17
else121:
  %t538 = call i64 @rt_car(i64 %a1)
  call void @rt_check_callable(i64 %a0)
  %t539 = and i64 %a0, -8
  %t540 = inttoptr i64 %t539 to ptr
  %t541 = load i64, ptr %t540
  %t542 = inttoptr i64 %t541 to ptr
  %t543 = call fastcc i64%t542(i64 %a0, i64 1, i64 %t538, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t544 = call i64 @rt_cdr(i64 %a1)
  %t545 = load i64, ptr @"scheme.base:%for-each1"
  call void @rt_check_callable(i64 %t545)
  %t546 = and i64 %t545, -8
  %t547 = inttoptr i64 %t546 to ptr
  %t548 = load i64, ptr %t547
  %t549 = inttoptr i64 %t548 to ptr
  %t550 = musttail call fastcc i64 %t549(i64 %t545, i64 2, i64 %a0, i64 %t544, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t550
}

define fastcc i64 @"scheme.base:code_103"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t555 = icmp eq i64 %argc, 1
  br i1 %t555, label %argok125, label %arityerr124
arityerr124:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok125:
  %t556 = call i64 @rt_car(i64 %a0)
  ret i64 %t556
}

define fastcc i64 @"scheme.base:code_105"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t557 = icmp eq i64 %argc, 1
  br i1 %t557, label %argok127, label %arityerr126
arityerr126:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok127:
  %t558 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t558
}

define fastcc i64 @"scheme.base:code:%for-eachn"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t559 = icmp eq i64 %argc, 2
  br i1 %t559, label %argok129, label %arityerr128
arityerr128:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok129:
  %t560 = load i64, ptr @"scheme.base:%any-null?"
  call void @rt_check_callable(i64 %t560)
  %t561 = and i64 %t560, -8
  %t562 = inttoptr i64 %t561 to ptr
  %t563 = load i64, ptr %t562
  %t564 = inttoptr i64 %t563 to ptr
  %t565 = call fastcc i64%t564(i64 %t560, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t566 = icmp ne i64 %t565, 1
  br i1 %t566, label %then130, label %else131
then130:
  %t567 = icmp ne i64 1, 1
  br i1 %t567, label %then132, label %else133
then132:
  ret i64 1
else133:
  ret i64 17
else131:
  %t568 = call ptr @rt_alloc_words(i64 1)
  %t569 = ptrtoint ptr %t568 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_103" to i64), ptr %t568
  %t570 = or i64 %t569, 4
  %t571 = load i64, ptr @"scheme.base:%map1"
  call void @rt_check_callable(i64 %t571)
  %t572 = and i64 %t571, -8
  %t573 = inttoptr i64 %t572 to ptr
  %t574 = load i64, ptr %t573
  %t575 = inttoptr i64 %t574 to ptr
  %t576 = call fastcc i64%t575(i64 %t571, i64 2, i64 %t570, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  call void @rt_check_callable(i64 %a0)
  %t577 = and i64 %a0, -8
  %t578 = inttoptr i64 %t577 to ptr
  %t579 = load i64, ptr %t578
  %t580 = inttoptr i64 %t579 to ptr
  %t581 = call i64 @rt_list_length(i64 %t576)
  %t582 = add i64 0, %t581
  %t583 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t576, i64 8)
  %t595 = getelementptr i64, ptr %t583, i64 0
  %t587 = load i64, ptr %t595
  %t596 = getelementptr i64, ptr %t583, i64 1
  %t588 = load i64, ptr %t596
  %t597 = getelementptr i64, ptr %t583, i64 2
  %t589 = load i64, ptr %t597
  %t598 = getelementptr i64, ptr %t583, i64 3
  %t590 = load i64, ptr %t598
  %t599 = getelementptr i64, ptr %t583, i64 4
  %t591 = load i64, ptr %t599
  %t600 = getelementptr i64, ptr %t583, i64 5
  %t592 = load i64, ptr %t600
  %t601 = getelementptr i64, ptr %t583, i64 6
  %t593 = load i64, ptr %t601
  %t602 = getelementptr i64, ptr %t583, i64 7
  %t594 = load i64, ptr %t602
  %t584 = icmp sgt i64 %t582, 8
  %t585 = getelementptr i64, ptr %t583, i64 8
  %t586 = select i1 %t584, ptr %t585, ptr null
  %t603 = call fastcc i64%t580(i64 %a0, i64 %t582, i64 %t587, i64 %t588, i64 %t589, i64 %t590, i64 %t591, i64 %t592, i64 %t593, i64 %t594, ptr %t586)
  %t604 = call ptr @rt_alloc_words(i64 1)
  %t605 = ptrtoint ptr %t604 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_105" to i64), ptr %t604
  %t606 = or i64 %t605, 4
  %t607 = load i64, ptr @"scheme.base:%map1"
  call void @rt_check_callable(i64 %t607)
  %t608 = and i64 %t607, -8
  %t609 = inttoptr i64 %t608 to ptr
  %t610 = load i64, ptr %t609
  %t611 = inttoptr i64 %t610 to ptr
  %t612 = call fastcc i64%t611(i64 %t607, i64 2, i64 %t606, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t613 = load i64, ptr @"scheme.base:%for-eachn"
  call void @rt_check_callable(i64 %t613)
  %t614 = and i64 %t613, -8
  %t615 = inttoptr i64 %t614 to ptr
  %t616 = load i64, ptr %t615
  %t617 = inttoptr i64 %t616 to ptr
  %t618 = musttail call fastcc i64 %t617(i64 %t613, i64 2, i64 %a0, i64 %t612, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t618
}

define fastcc i64 @"scheme.base:code:for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t623 = icmp sge i64 %argc, 2
  br i1 %t623, label %argok135, label %arityerr134
arityerr134:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok135:
  %t624 = call ptr @rt_alloc_words(i64 8)
  %t625 = getelementptr i64, ptr %t624, i64 0
  store i64 %a0, ptr %t625
  %t626 = getelementptr i64, ptr %t624, i64 1
  store i64 %a1, ptr %t626
  %t627 = getelementptr i64, ptr %t624, i64 2
  store i64 %a2, ptr %t627
  %t628 = getelementptr i64, ptr %t624, i64 3
  store i64 %a3, ptr %t628
  %t629 = getelementptr i64, ptr %t624, i64 4
  store i64 %a4, ptr %t629
  %t630 = getelementptr i64, ptr %t624, i64 5
  store i64 %a5, ptr %t630
  %t631 = getelementptr i64, ptr %t624, i64 6
  store i64 %a6, ptr %t631
  %t632 = getelementptr i64, ptr %t624, i64 7
  store i64 %a7, ptr %t632
  %t633 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t624, ptr %overflow)
  %t634 = call i64 @rt_null_p(i64 %t633)
  %t635 = icmp ne i64 %t634, 1
  br i1 %t635, label %then136, label %else137
then136:
  %t636 = load i64, ptr @"scheme.base:%for-each1"
  call void @rt_check_callable(i64 %t636)
  %t637 = and i64 %t636, -8
  %t638 = inttoptr i64 %t637 to ptr
  %t639 = load i64, ptr %t638
  %t640 = inttoptr i64 %t639 to ptr
  %t641 = musttail call fastcc i64 %t640(i64 %t636, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t641
else137:
  %t642 = call i64 @rt_cons(i64 %a1, i64 %t633)
  %t643 = load i64, ptr @"scheme.base:%for-eachn"
  call void @rt_check_callable(i64 %t643)
  %t644 = and i64 %t643, -8
  %t645 = inttoptr i64 %t644 to ptr
  %t646 = load i64, ptr %t645
  %t647 = inttoptr i64 %t646 to ptr
  %t648 = musttail call fastcc i64 %t647(i64 %t643, i64 2, i64 %a0, i64 %t642, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t648
}

define fastcc i64 @"scheme.base:code:andmap"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t653 = icmp eq i64 %argc, 2
  br i1 %t653, label %argok139, label %arityerr138
arityerr138:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok139:
  %t654 = call i64 @rt_null_p(i64 %a1)
  %t655 = icmp ne i64 %t654, 1
  br i1 %t655, label %then140, label %else141
then140:
  ret i64 257
else141:
  %t656 = call i64 @rt_car(i64 %a1)
  call void @rt_check_callable(i64 %a0)
  %t657 = and i64 %a0, -8
  %t658 = inttoptr i64 %t657 to ptr
  %t659 = load i64, ptr %t658
  %t660 = inttoptr i64 %t659 to ptr
  %t661 = call fastcc i64%t660(i64 %a0, i64 1, i64 %t656, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t662 = icmp ne i64 %t661, 1
  br i1 %t662, label %then142, label %else143
then142:
  %t663 = call i64 @rt_cdr(i64 %a1)
  %t664 = load i64, ptr @"scheme.base:andmap"
  call void @rt_check_callable(i64 %t664)
  %t665 = and i64 %t664, -8
  %t666 = inttoptr i64 %t665 to ptr
  %t667 = load i64, ptr %t666
  %t668 = inttoptr i64 %t667 to ptr
  %t669 = musttail call fastcc i64 %t668(i64 %t664, i64 2, i64 %a0, i64 %t663, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t669
else143:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:memp"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t674 = icmp eq i64 %argc, 2
  br i1 %t674, label %argok145, label %arityerr144
arityerr144:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok145:
  %t675 = call i64 @rt_null_p(i64 %a1)
  %t676 = icmp ne i64 %t675, 1
  br i1 %t676, label %then146, label %else147
then146:
  ret i64 1
else147:
  %t677 = call i64 @rt_car(i64 %a1)
  call void @rt_check_callable(i64 %a0)
  %t678 = and i64 %a0, -8
  %t679 = inttoptr i64 %t678 to ptr
  %t680 = load i64, ptr %t679
  %t681 = inttoptr i64 %t680 to ptr
  %t682 = call fastcc i64%t681(i64 %a0, i64 1, i64 %t677, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t683 = icmp ne i64 %t682, 1
  br i1 %t683, label %then148, label %else149
then148:
  ret i64 %a1
else149:
  %t684 = call i64 @rt_cdr(i64 %a1)
  %t685 = load i64, ptr @"scheme.base:memp"
  call void @rt_check_callable(i64 %t685)
  %t686 = and i64 %t685, -8
  %t687 = inttoptr i64 %t686 to ptr
  %t688 = load i64, ptr %t687
  %t689 = inttoptr i64 %t688 to ptr
  %t690 = musttail call fastcc i64 %t689(i64 %t685, i64 2, i64 %a0, i64 %t684, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t690
}

define fastcc i64 @"scheme.base:code:list?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t695 = icmp eq i64 %argc, 1
  br i1 %t695, label %argok151, label %arityerr150
arityerr150:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok151:
  %t696 = call i64 @rt_null_p(i64 %a0)
  %t697 = icmp ne i64 %t696, 1
  br i1 %t697, label %then152, label %else153
then152:
  ret i64 257
else153:
  %t698 = call i64 @rt_pair_p(i64 %a0)
  %t699 = icmp ne i64 %t698, 1
  br i1 %t699, label %then154, label %else155
then154:
  %t700 = call i64 @rt_cdr(i64 %a0)
  %t701 = load i64, ptr @"scheme.base:list?"
  call void @rt_check_callable(i64 %t701)
  %t702 = and i64 %t701, -8
  %t703 = inttoptr i64 %t702 to ptr
  %t704 = load i64, ptr %t703
  %t705 = inttoptr i64 %t704 to ptr
  %t706 = musttail call fastcc i64 %t705(i64 %t701, i64 1, i64 %t700, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t706
else155:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:zero?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t711 = icmp eq i64 %argc, 1
  br i1 %t711, label %argok157, label %arityerr156
arityerr156:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok157:
  %t712 = or i64 %a0, 0
  %t713 = and i64 %t712, 7
  %t714 = icmp eq i64 %t713, 0
  br i1 %t714, label %fixfast158, label %fixslow159
fixfast158:
  %t715 = icmp eq i64 %a0, 0
  %t716 = select i1 %t715, i64 257, i64 1
  br label %fixmerge160
fixslow159:
  %t717 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge160
fixmerge160:
  %t718 = phi i64 [ %t716, %fixfast158 ], [ %t717, %fixslow159 ]
  ret i64 %t718
}

define fastcc i64 @"scheme.base:code:list-tail"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t723 = icmp eq i64 %argc, 2
  br i1 %t723, label %argok162, label %arityerr161
arityerr161:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok162:
  %t724 = load i64, ptr @"scheme.base:zero?"
  call void @rt_check_callable(i64 %t724)
  %t725 = and i64 %t724, -8
  %t726 = inttoptr i64 %t725 to ptr
  %t727 = load i64, ptr %t726
  %t728 = inttoptr i64 %t727 to ptr
  %t729 = call fastcc i64%t728(i64 %t724, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t730 = icmp ne i64 %t729, 1
  br i1 %t730, label %then163, label %else164
then163:
  ret i64 %a0
else164:
  %t731 = call i64 @rt_cdr(i64 %a0)
  %t732 = or i64 %a1, 8
  %t733 = and i64 %t732, 7
  %t734 = icmp eq i64 %t733, 0
  br i1 %t734, label %fixfast165, label %fixslow166
fixfast165:
  %t735 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a1, i64 8)
  %t736 = extractvalue {i64, i1} %t735, 0
  %t737 = extractvalue {i64, i1} %t735, 1
  br i1 %t737, label %fixslow166, label %fixmerge167
fixslow166:
  %t738 = call i64 @rt_sub(i64 %a1, i64 8)
  br label %fixmerge167
fixmerge167:
  %t739 = phi i64 [ %t736, %fixfast165 ], [ %t738, %fixslow166 ]
  %t740 = load i64, ptr @"scheme.base:list-tail"
  call void @rt_check_callable(i64 %t740)
  %t741 = and i64 %t740, -8
  %t742 = inttoptr i64 %t741 to ptr
  %t743 = load i64, ptr %t742
  %t744 = inttoptr i64 %t743 to ptr
  %t745 = musttail call fastcc i64 %t744(i64 %t740, i64 2, i64 %t731, i64 %t739, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t745
}

define fastcc i64 @"scheme.base:code:list-ref"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t750 = icmp eq i64 %argc, 2
  br i1 %t750, label %argok169, label %arityerr168
arityerr168:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok169:
  %t751 = load i64, ptr @"scheme.base:list-tail"
  call void @rt_check_callable(i64 %t751)
  %t752 = and i64 %t751, -8
  %t753 = inttoptr i64 %t752 to ptr
  %t754 = load i64, ptr %t753
  %t755 = inttoptr i64 %t754 to ptr
  %t756 = call fastcc i64%t755(i64 %t751, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t757 = call i64 @rt_car(i64 %t756)
  ret i64 %t757
}

define fastcc i64 @"scheme.base:code:list-set!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t762 = icmp eq i64 %argc, 3
  br i1 %t762, label %argok171, label %arityerr170
arityerr170:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok171:
  %t763 = load i64, ptr @"scheme.base:list-tail"
  call void @rt_check_callable(i64 %t763)
  %t764 = and i64 %t763, -8
  %t765 = inttoptr i64 %t764 to ptr
  %t766 = load i64, ptr %t765
  %t767 = inttoptr i64 %t766 to ptr
  %t768 = call fastcc i64%t767(i64 %t763, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t769 = call i64 @rt_set_car(i64 %t768, i64 %a2)
  ret i64 %t769
}

define fastcc i64 @"scheme.base:code:list-head"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t774 = icmp eq i64 %argc, 2
  br i1 %t774, label %argok173, label %arityerr172
arityerr172:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok173:
  %t775 = load i64, ptr @"scheme.base:zero?"
  call void @rt_check_callable(i64 %t775)
  %t776 = and i64 %t775, -8
  %t777 = inttoptr i64 %t776 to ptr
  %t778 = load i64, ptr %t777
  %t779 = inttoptr i64 %t778 to ptr
  %t780 = call fastcc i64%t779(i64 %t775, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t781 = icmp ne i64 %t780, 1
  br i1 %t781, label %then174, label %else175
then174:
  ret i64 2
else175:
  %t782 = call i64 @rt_car(i64 %a0)
  %t783 = call i64 @rt_cdr(i64 %a0)
  %t784 = or i64 %a1, 8
  %t785 = and i64 %t784, 7
  %t786 = icmp eq i64 %t785, 0
  br i1 %t786, label %fixfast176, label %fixslow177
fixfast176:
  %t787 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a1, i64 8)
  %t788 = extractvalue {i64, i1} %t787, 0
  %t789 = extractvalue {i64, i1} %t787, 1
  br i1 %t789, label %fixslow177, label %fixmerge178
fixslow177:
  %t790 = call i64 @rt_sub(i64 %a1, i64 8)
  br label %fixmerge178
fixmerge178:
  %t791 = phi i64 [ %t788, %fixfast176 ], [ %t790, %fixslow177 ]
  %t792 = load i64, ptr @"scheme.base:list-head"
  call void @rt_check_callable(i64 %t792)
  %t793 = and i64 %t792, -8
  %t794 = inttoptr i64 %t793 to ptr
  %t795 = load i64, ptr %t794
  %t796 = inttoptr i64 %t795 to ptr
  %t797 = call fastcc i64%t796(i64 %t792, i64 2, i64 %t783, i64 %t791, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t798 = call i64 @rt_cons(i64 %t782, i64 %t797)
  ret i64 %t798
}

define fastcc i64 @"scheme.base:code:make-list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t803 = icmp eq i64 %argc, 2
  br i1 %t803, label %argok180, label %arityerr179
arityerr179:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok180:
  %t804 = load i64, ptr @"scheme.base:zero?"
  call void @rt_check_callable(i64 %t804)
  %t805 = and i64 %t804, -8
  %t806 = inttoptr i64 %t805 to ptr
  %t807 = load i64, ptr %t806
  %t808 = inttoptr i64 %t807 to ptr
  %t809 = call fastcc i64%t808(i64 %t804, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t810 = icmp ne i64 %t809, 1
  br i1 %t810, label %then181, label %else182
then181:
  ret i64 2
else182:
  %t811 = or i64 %a0, 8
  %t812 = and i64 %t811, 7
  %t813 = icmp eq i64 %t812, 0
  br i1 %t813, label %fixfast183, label %fixslow184
fixfast183:
  %t814 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t815 = extractvalue {i64, i1} %t814, 0
  %t816 = extractvalue {i64, i1} %t814, 1
  br i1 %t816, label %fixslow184, label %fixmerge185
fixslow184:
  %t817 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge185
fixmerge185:
  %t818 = phi i64 [ %t815, %fixfast183 ], [ %t817, %fixslow184 ]
  %t819 = load i64, ptr @"scheme.base:make-list"
  call void @rt_check_callable(i64 %t819)
  %t820 = and i64 %t819, -8
  %t821 = inttoptr i64 %t820 to ptr
  %t822 = load i64, ptr %t821
  %t823 = inttoptr i64 %t822 to ptr
  %t824 = call fastcc i64%t823(i64 %t819, i64 2, i64 %t818, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t825 = call i64 @rt_cons(i64 %a1, i64 %t824)
  ret i64 %t825
}

define fastcc i64 @"scheme.base:code_150"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t830 = icmp eq i64 %argc, 2
  br i1 %t830, label %argok187, label %arityerr186
arityerr186:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok187:
  %t831 = and i64 %self, -8
  %t832 = inttoptr i64 %t831 to ptr
  %t833 = getelementptr i64, ptr %t832, i64 1
  %t834 = load i64, ptr %t833
  %t835 = or i64 %a0, %t834
  %t836 = and i64 %t835, 7
  %t837 = icmp eq i64 %t836, 0
  br i1 %t837, label %fixfast188, label %fixslow189
fixfast188:
  %t838 = icmp eq i64 %a0, %t834
  %t839 = select i1 %t838, i64 257, i64 1
  br label %fixmerge190
fixslow189:
  %t840 = call i64 @rt_num_eq(i64 %a0, i64 %t834)
  br label %fixmerge190
fixmerge190:
  %t841 = phi i64 [ %t839, %fixfast188 ], [ %t840, %fixslow189 ]
  %t842 = icmp ne i64 %t841, 1
  br i1 %t842, label %then191, label %else192
then191:
  %t843 = load i64, ptr @"scheme.base:reverse"
  call void @rt_check_callable(i64 %t843)
  %t844 = and i64 %t843, -8
  %t845 = inttoptr i64 %t844 to ptr
  %t846 = load i64, ptr %t845
  %t847 = inttoptr i64 %t846 to ptr
  %t848 = musttail call fastcc i64 %t847(i64 %t843, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t848
else192:
  %t849 = or i64 %a0, 8
  %t850 = and i64 %t849, 7
  %t851 = icmp eq i64 %t850, 0
  br i1 %t851, label %fixfast193, label %fixslow194
fixfast193:
  %t852 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t853 = extractvalue {i64, i1} %t852, 0
  %t854 = extractvalue {i64, i1} %t852, 1
  br i1 %t854, label %fixslow194, label %fixmerge195
fixslow194:
  %t855 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge195
fixmerge195:
  %t856 = phi i64 [ %t853, %fixfast193 ], [ %t855, %fixslow194 ]
  %t857 = call i64 @rt_cons(i64 %a0, i64 %a1)
  %t858 = musttail call fastcc i64 @"scheme.base:code_150"(i64 %self, i64 2, i64 %t856, i64 %t857, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t858
}

define fastcc i64 @"scheme.base:code:iota"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t859 = icmp eq i64 %argc, 1
  br i1 %t859, label %argok197, label %arityerr196
arityerr196:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok197:
  %t860 = call ptr @rt_alloc_words(i64 3)
  %t861 = ptrtoint ptr %t860 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_150" to i64), ptr %t860
  %t862 = or i64 %t861, 4
  %t863 = getelementptr i64, ptr %t860, i64 1
  store i64 %a0, ptr %t863
  %t864 = getelementptr i64, ptr %t860, i64 2
  store i64 %t862, ptr %t864
  %t865 = musttail call fastcc i64 @"scheme.base:code_150"(i64 %t862, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t865
}

define fastcc i64 @"scheme.base:code:%minmax-fold"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t870 = icmp eq i64 %argc, 4
  br i1 %t870, label %argok199, label %arityerr198
arityerr198:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok199:
  %t871 = call i64 @rt_null_p(i64 %a1)
  %t872 = icmp ne i64 %t871, 1
  br i1 %t872, label %then200, label %else201
then200:
  %t873 = icmp ne i64 %a3, 1
  br i1 %t873, label %then202, label %else203
then202:
  %t874 = call i64 @rt_exact_to_inexact(i64 %a2)
  ret i64 %t874
else203:
  ret i64 %a2
else201:
  %t875 = call i64 @rt_cdr(i64 %a1)
  %t876 = call i64 @rt_car(i64 %a1)
  call void @rt_check_callable(i64 %a0)
  %t877 = and i64 %a0, -8
  %t878 = inttoptr i64 %t877 to ptr
  %t879 = load i64, ptr %t878
  %t880 = inttoptr i64 %t879 to ptr
  %t881 = call fastcc i64%t880(i64 %a0, i64 2, i64 %a2, i64 %t876, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t882 = icmp ne i64 %a3, 1
  br i1 %t882, label %then204, label %else205
then204:
  br label %merge206
else205:
  %t883 = call i64 @rt_car(i64 %a1)
  %t884 = call i64 @rt_inexact_p(i64 %t883)
  br label %merge206
merge206:
  %t885 = phi i64 [ 257, %then204 ], [ %t884, %else205 ]
  %t886 = load i64, ptr @"scheme.base:%minmax-fold"
  call void @rt_check_callable(i64 %t886)
  %t887 = and i64 %t886, -8
  %t888 = inttoptr i64 %t887 to ptr
  %t889 = load i64, ptr %t888
  %t890 = inttoptr i64 %t889 to ptr
  %t891 = musttail call fastcc i64 %t890(i64 %t886, i64 4, i64 %a0, i64 %t875, i64 %t881, i64 %t885, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t891
}

define fastcc i64 @"scheme.base:code:%minmax"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t896 = icmp eq i64 %argc, 3
  br i1 %t896, label %argok208, label %arityerr207
arityerr207:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok208:
  %t897 = call i64 @rt_inexact_p(i64 %a1)
  %t898 = load i64, ptr @"scheme.base:%minmax-fold"
  call void @rt_check_callable(i64 %t898)
  %t899 = and i64 %t898, -8
  %t900 = inttoptr i64 %t899 to ptr
  %t901 = load i64, ptr %t900
  %t902 = inttoptr i64 %t901 to ptr
  %t903 = musttail call fastcc i64 %t902(i64 %t898, i64 4, i64 %a0, i64 %a2, i64 %a1, i64 %t897, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t903
}

define fastcc i64 @"scheme.base:code_170"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t908 = icmp eq i64 %argc, 2
  br i1 %t908, label %argok210, label %arityerr209
arityerr209:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok210:
  %t909 = or i64 %a0, %a1
  %t910 = and i64 %t909, 7
  %t911 = icmp eq i64 %t910, 0
  br i1 %t911, label %fixfast211, label %fixslow212
fixfast211:
  %t912 = icmp slt i64 %a0, %a1
  %t913 = select i1 %t912, i64 257, i64 1
  br label %fixmerge213
fixslow212:
  %t914 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge213
fixmerge213:
  %t915 = phi i64 [ %t913, %fixfast211 ], [ %t914, %fixslow212 ]
  %t916 = icmp ne i64 %t915, 1
  br i1 %t916, label %then214, label %else215
then214:
  ret i64 %a1
else215:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:max"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t917 = icmp sge i64 %argc, 1
  br i1 %t917, label %argok217, label %arityerr216
arityerr216:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok217:
  %t918 = call ptr @rt_alloc_words(i64 8)
  %t919 = getelementptr i64, ptr %t918, i64 0
  store i64 %a0, ptr %t919
  %t920 = getelementptr i64, ptr %t918, i64 1
  store i64 %a1, ptr %t920
  %t921 = getelementptr i64, ptr %t918, i64 2
  store i64 %a2, ptr %t921
  %t922 = getelementptr i64, ptr %t918, i64 3
  store i64 %a3, ptr %t922
  %t923 = getelementptr i64, ptr %t918, i64 4
  store i64 %a4, ptr %t923
  %t924 = getelementptr i64, ptr %t918, i64 5
  store i64 %a5, ptr %t924
  %t925 = getelementptr i64, ptr %t918, i64 6
  store i64 %a6, ptr %t925
  %t926 = getelementptr i64, ptr %t918, i64 7
  store i64 %a7, ptr %t926
  %t927 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t918, ptr %overflow)
  %t928 = call ptr @rt_alloc_words(i64 1)
  %t929 = ptrtoint ptr %t928 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_170" to i64), ptr %t928
  %t930 = or i64 %t929, 4
  %t931 = load i64, ptr @"scheme.base:%minmax"
  call void @rt_check_callable(i64 %t931)
  %t932 = and i64 %t931, -8
  %t933 = inttoptr i64 %t932 to ptr
  %t934 = load i64, ptr %t933
  %t935 = inttoptr i64 %t934 to ptr
  %t936 = musttail call fastcc i64 %t935(i64 %t931, i64 3, i64 %t930, i64 %a0, i64 %t927, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t936
}

define fastcc i64 @"scheme.base:code_181"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t941 = icmp eq i64 %argc, 2
  br i1 %t941, label %argok219, label %arityerr218
arityerr218:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok219:
  %t942 = or i64 %a1, %a0
  %t943 = and i64 %t942, 7
  %t944 = icmp eq i64 %t943, 0
  br i1 %t944, label %fixfast220, label %fixslow221
fixfast220:
  %t945 = icmp slt i64 %a1, %a0
  %t946 = select i1 %t945, i64 257, i64 1
  br label %fixmerge222
fixslow221:
  %t947 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge222
fixmerge222:
  %t948 = phi i64 [ %t946, %fixfast220 ], [ %t947, %fixslow221 ]
  %t949 = icmp ne i64 %t948, 1
  br i1 %t949, label %then223, label %else224
then223:
  ret i64 %a1
else224:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:min"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t950 = icmp sge i64 %argc, 1
  br i1 %t950, label %argok226, label %arityerr225
arityerr225:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok226:
  %t951 = call ptr @rt_alloc_words(i64 8)
  %t952 = getelementptr i64, ptr %t951, i64 0
  store i64 %a0, ptr %t952
  %t953 = getelementptr i64, ptr %t951, i64 1
  store i64 %a1, ptr %t953
  %t954 = getelementptr i64, ptr %t951, i64 2
  store i64 %a2, ptr %t954
  %t955 = getelementptr i64, ptr %t951, i64 3
  store i64 %a3, ptr %t955
  %t956 = getelementptr i64, ptr %t951, i64 4
  store i64 %a4, ptr %t956
  %t957 = getelementptr i64, ptr %t951, i64 5
  store i64 %a5, ptr %t957
  %t958 = getelementptr i64, ptr %t951, i64 6
  store i64 %a6, ptr %t958
  %t959 = getelementptr i64, ptr %t951, i64 7
  store i64 %a7, ptr %t959
  %t960 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t951, ptr %overflow)
  %t961 = call ptr @rt_alloc_words(i64 1)
  %t962 = ptrtoint ptr %t961 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_181" to i64), ptr %t961
  %t963 = or i64 %t962, 4
  %t964 = load i64, ptr @"scheme.base:%minmax"
  call void @rt_check_callable(i64 %t964)
  %t965 = and i64 %t964, -8
  %t966 = inttoptr i64 %t965 to ptr
  %t967 = load i64, ptr %t966
  %t968 = inttoptr i64 %t967 to ptr
  %t969 = musttail call fastcc i64 %t968(i64 %t964, i64 3, i64 %t963, i64 %a0, i64 %t960, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t969
}

define fastcc i64 @"scheme.base:code:complex?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t974 = icmp eq i64 %argc, 1
  br i1 %t974, label %argok228, label %arityerr227
arityerr227:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok228:
  %t975 = call i64 @rt_number_p(i64 %a0)
  ret i64 %t975
}

define fastcc i64 @"scheme.base:code:exact-integer?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t980 = icmp eq i64 %argc, 1
  br i1 %t980, label %argok230, label %arityerr229
arityerr229:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok230:
  %t981 = call i64 @rt_exact_p(i64 %a0)
  %t982 = icmp ne i64 %t981, 1
  br i1 %t982, label %then231, label %else232
then231:
  %t983 = call i64 @rt_integer_p(i64 %a0)
  ret i64 %t983
else232:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rational?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t988 = icmp eq i64 %argc, 1
  br i1 %t988, label %argok234, label %arityerr233
arityerr233:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok234:
  %t989 = call i64 @rt_number_p(i64 %a0)
  %t990 = icmp ne i64 %t989, 1
  br i1 %t990, label %then235, label %else236
then235:
  %t991 = call i64 @rt_finite_p(i64 %a0)
  ret i64 %t991
else236:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:positive?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t996 = icmp eq i64 %argc, 1
  br i1 %t996, label %argok238, label %arityerr237
arityerr237:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok238:
  %t997 = or i64 0, %a0
  %t998 = and i64 %t997, 7
  %t999 = icmp eq i64 %t998, 0
  br i1 %t999, label %fixfast239, label %fixslow240
fixfast239:
  %t1000 = icmp slt i64 0, %a0
  %t1001 = select i1 %t1000, i64 257, i64 1
  br label %fixmerge241
fixslow240:
  %t1002 = call i64 @rt_lt(i64 0, i64 %a0)
  br label %fixmerge241
fixmerge241:
  %t1003 = phi i64 [ %t1001, %fixfast239 ], [ %t1002, %fixslow240 ]
  ret i64 %t1003
}

define fastcc i64 @"scheme.base:code:negative?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1008 = icmp eq i64 %argc, 1
  br i1 %t1008, label %argok243, label %arityerr242
arityerr242:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok243:
  %t1009 = or i64 %a0, 0
  %t1010 = and i64 %t1009, 7
  %t1011 = icmp eq i64 %t1010, 0
  br i1 %t1011, label %fixfast244, label %fixslow245
fixfast244:
  %t1012 = icmp slt i64 %a0, 0
  %t1013 = select i1 %t1012, i64 257, i64 1
  br label %fixmerge246
fixslow245:
  %t1014 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge246
fixmerge246:
  %t1015 = phi i64 [ %t1013, %fixfast244 ], [ %t1014, %fixslow245 ]
  ret i64 %t1015
}

define fastcc i64 @"scheme.base:code:even?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1020 = icmp eq i64 %argc, 1
  br i1 %t1020, label %argok248, label %arityerr247
arityerr247:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok248:
  %t1021 = call i64 @rt_remainder(i64 %a0, i64 16)
  %t1022 = or i64 0, %t1021
  %t1023 = and i64 %t1022, 7
  %t1024 = icmp eq i64 %t1023, 0
  br i1 %t1024, label %fixfast249, label %fixslow250
fixfast249:
  %t1025 = icmp eq i64 0, %t1021
  %t1026 = select i1 %t1025, i64 257, i64 1
  br label %fixmerge251
fixslow250:
  %t1027 = call i64 @rt_num_eq(i64 0, i64 %t1021)
  br label %fixmerge251
fixmerge251:
  %t1028 = phi i64 [ %t1026, %fixfast249 ], [ %t1027, %fixslow250 ]
  ret i64 %t1028
}

define fastcc i64 @"scheme.base:code:odd?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1033 = icmp eq i64 %argc, 1
  br i1 %t1033, label %argok253, label %arityerr252
arityerr252:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok253:
  %t1034 = call i64 @rt_remainder(i64 %a0, i64 16)
  %t1035 = or i64 0, %t1034
  %t1036 = and i64 %t1035, 7
  %t1037 = icmp eq i64 %t1036, 0
  br i1 %t1037, label %fixfast254, label %fixslow255
fixfast254:
  %t1038 = icmp eq i64 0, %t1034
  %t1039 = select i1 %t1038, i64 257, i64 1
  br label %fixmerge256
fixslow255:
  %t1040 = call i64 @rt_num_eq(i64 0, i64 %t1034)
  br label %fixmerge256
fixmerge256:
  %t1041 = phi i64 [ %t1039, %fixfast254 ], [ %t1040, %fixslow255 ]
  %t1042 = icmp ne i64 %t1041, 1
  br i1 %t1042, label %then257, label %else258
then257:
  ret i64 1
else258:
  ret i64 257
}

define fastcc i64 @"scheme.base:code:abs"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1047 = icmp eq i64 %argc, 1
  br i1 %t1047, label %argok260, label %arityerr259
arityerr259:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok260:
  %t1048 = or i64 %a0, 0
  %t1049 = and i64 %t1048, 7
  %t1050 = icmp eq i64 %t1049, 0
  br i1 %t1050, label %fixfast261, label %fixslow262
fixfast261:
  %t1051 = icmp slt i64 %a0, 0
  %t1052 = select i1 %t1051, i64 257, i64 1
  br label %fixmerge263
fixslow262:
  %t1053 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge263
fixmerge263:
  %t1054 = phi i64 [ %t1052, %fixfast261 ], [ %t1053, %fixslow262 ]
  %t1055 = icmp ne i64 %t1054, 1
  br i1 %t1055, label %then264, label %else265
then264:
  %t1056 = or i64 0, %a0
  %t1057 = and i64 %t1056, 7
  %t1058 = icmp eq i64 %t1057, 0
  br i1 %t1058, label %fixfast266, label %fixslow267
fixfast266:
  %t1059 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %a0)
  %t1060 = extractvalue {i64, i1} %t1059, 0
  %t1061 = extractvalue {i64, i1} %t1059, 1
  br i1 %t1061, label %fixslow267, label %fixmerge268
fixslow267:
  %t1062 = call i64 @rt_sub(i64 0, i64 %a0)
  br label %fixmerge268
fixmerge268:
  %t1063 = phi i64 [ %t1060, %fixfast266 ], [ %t1062, %fixslow267 ]
  ret i64 %t1063
else265:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:square"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1068 = icmp eq i64 %argc, 1
  br i1 %t1068, label %argok270, label %arityerr269
arityerr269:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok270:
  %t1069 = or i64 %a0, %a0
  %t1070 = and i64 %t1069, 7
  %t1071 = icmp eq i64 %t1070, 0
  br i1 %t1071, label %fixfast271, label %fixslow272
fixfast271:
  %t1072 = ashr i64 %a0, 3
  %t1073 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1072, i64 %a0)
  %t1074 = extractvalue {i64, i1} %t1073, 0
  %t1075 = extractvalue {i64, i1} %t1073, 1
  br i1 %t1075, label %fixslow272, label %fixmerge273
fixslow272:
  %t1076 = call i64 @rt_mul(i64 %a0, i64 %a0)
  br label %fixmerge273
fixmerge273:
  %t1077 = phi i64 [ %t1074, %fixfast271 ], [ %t1076, %fixslow272 ]
  ret i64 %t1077
}

define fastcc i64 @"scheme.base:code:%gcd2"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1082 = icmp eq i64 %argc, 2
  br i1 %t1082, label %argok275, label %arityerr274
arityerr274:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok275:
  %t1083 = or i64 %a1, 0
  %t1084 = and i64 %t1083, 7
  %t1085 = icmp eq i64 %t1084, 0
  br i1 %t1085, label %fixfast276, label %fixslow277
fixfast276:
  %t1086 = icmp eq i64 %a1, 0
  %t1087 = select i1 %t1086, i64 257, i64 1
  br label %fixmerge278
fixslow277:
  %t1088 = call i64 @rt_num_eq(i64 %a1, i64 0)
  br label %fixmerge278
fixmerge278:
  %t1089 = phi i64 [ %t1087, %fixfast276 ], [ %t1088, %fixslow277 ]
  %t1090 = icmp ne i64 %t1089, 1
  br i1 %t1090, label %then279, label %else280
then279:
  ret i64 %a0
else280:
  %t1091 = call i64 @rt_remainder(i64 %a0, i64 %a1)
  %t1092 = load i64, ptr @"scheme.base:%gcd2"
  call void @rt_check_callable(i64 %t1092)
  %t1093 = and i64 %t1092, -8
  %t1094 = inttoptr i64 %t1093 to ptr
  %t1095 = load i64, ptr %t1094
  %t1096 = inttoptr i64 %t1095 to ptr
  %t1097 = musttail call fastcc i64 %t1096(i64 %t1092, i64 2, i64 %a1, i64 %t1091, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1097
}

define fastcc i64 @"scheme.base:code:%gcd-fold"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1102 = icmp eq i64 %argc, 2
  br i1 %t1102, label %argok282, label %arityerr281
arityerr281:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok282:
  %t1103 = call i64 @rt_null_p(i64 %a0)
  %t1104 = icmp ne i64 %t1103, 1
  br i1 %t1104, label %then283, label %else284
then283:
  ret i64 %a1
else284:
  %t1105 = call i64 @rt_cdr(i64 %a0)
  %t1106 = call i64 @rt_car(i64 %a0)
  %t1107 = load i64, ptr @"scheme.base:abs"
  call void @rt_check_callable(i64 %t1107)
  %t1108 = and i64 %t1107, -8
  %t1109 = inttoptr i64 %t1108 to ptr
  %t1110 = load i64, ptr %t1109
  %t1111 = inttoptr i64 %t1110 to ptr
  %t1112 = call fastcc i64%t1111(i64 %t1107, i64 1, i64 %t1106, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1113 = load i64, ptr @"scheme.base:abs"
  call void @rt_check_callable(i64 %t1113)
  %t1114 = and i64 %t1113, -8
  %t1115 = inttoptr i64 %t1114 to ptr
  %t1116 = load i64, ptr %t1115
  %t1117 = inttoptr i64 %t1116 to ptr
  %t1118 = call fastcc i64%t1117(i64 %t1113, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1119 = load i64, ptr @"scheme.base:%gcd2"
  call void @rt_check_callable(i64 %t1119)
  %t1120 = and i64 %t1119, -8
  %t1121 = inttoptr i64 %t1120 to ptr
  %t1122 = load i64, ptr %t1121
  %t1123 = inttoptr i64 %t1122 to ptr
  %t1124 = call fastcc i64%t1123(i64 %t1119, i64 2, i64 %t1112, i64 %t1118, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1125 = load i64, ptr @"scheme.base:%gcd-fold"
  call void @rt_check_callable(i64 %t1125)
  %t1126 = and i64 %t1125, -8
  %t1127 = inttoptr i64 %t1126 to ptr
  %t1128 = load i64, ptr %t1127
  %t1129 = inttoptr i64 %t1128 to ptr
  %t1130 = musttail call fastcc i64 %t1129(i64 %t1125, i64 2, i64 %t1105, i64 %t1124, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1130
}

define fastcc i64 @"scheme.base:code:%lcm-fold"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1135 = icmp eq i64 %argc, 2
  br i1 %t1135, label %argok286, label %arityerr285
arityerr285:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok286:
  %t1136 = call i64 @rt_null_p(i64 %a0)
  %t1137 = icmp ne i64 %t1136, 1
  br i1 %t1137, label %then287, label %else288
then287:
  ret i64 %a1
else288:
  %t1138 = call i64 @rt_car(i64 %a0)
  %t1139 = load i64, ptr @"scheme.base:abs"
  call void @rt_check_callable(i64 %t1139)
  %t1140 = and i64 %t1139, -8
  %t1141 = inttoptr i64 %t1140 to ptr
  %t1142 = load i64, ptr %t1141
  %t1143 = inttoptr i64 %t1142 to ptr
  %t1144 = call fastcc i64%t1143(i64 %t1139, i64 1, i64 %t1138, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1145 = or i64 %t1144, 0
  %t1146 = and i64 %t1145, 7
  %t1147 = icmp eq i64 %t1146, 0
  br i1 %t1147, label %fixfast289, label %fixslow290
fixfast289:
  %t1148 = icmp eq i64 %t1144, 0
  %t1149 = select i1 %t1148, i64 257, i64 1
  br label %fixmerge291
fixslow290:
  %t1150 = call i64 @rt_num_eq(i64 %t1144, i64 0)
  br label %fixmerge291
fixmerge291:
  %t1151 = phi i64 [ %t1149, %fixfast289 ], [ %t1150, %fixslow290 ]
  %t1152 = icmp ne i64 %t1151, 1
  br i1 %t1152, label %then292, label %else293
then292:
  ret i64 0
else293:
  %t1153 = call i64 @rt_cdr(i64 %a0)
  %t1154 = or i64 %a1, %t1144
  %t1155 = and i64 %t1154, 7
  %t1156 = icmp eq i64 %t1155, 0
  br i1 %t1156, label %fixfast294, label %fixslow295
fixfast294:
  %t1157 = ashr i64 %a1, 3
  %t1158 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1157, i64 %t1144)
  %t1159 = extractvalue {i64, i1} %t1158, 0
  %t1160 = extractvalue {i64, i1} %t1158, 1
  br i1 %t1160, label %fixslow295, label %fixmerge296
fixslow295:
  %t1161 = call i64 @rt_mul(i64 %a1, i64 %t1144)
  br label %fixmerge296
fixmerge296:
  %t1162 = phi i64 [ %t1159, %fixfast294 ], [ %t1161, %fixslow295 ]
  %t1163 = load i64, ptr @"scheme.base:%gcd2"
  call void @rt_check_callable(i64 %t1163)
  %t1164 = and i64 %t1163, -8
  %t1165 = inttoptr i64 %t1164 to ptr
  %t1166 = load i64, ptr %t1165
  %t1167 = inttoptr i64 %t1166 to ptr
  %t1168 = call fastcc i64%t1167(i64 %t1163, i64 2, i64 %a1, i64 %t1144, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1169 = call i64 @rt_quotient(i64 %t1162, i64 %t1168)
  %t1170 = load i64, ptr @"scheme.base:%lcm-fold"
  call void @rt_check_callable(i64 %t1170)
  %t1171 = and i64 %t1170, -8
  %t1172 = inttoptr i64 %t1171 to ptr
  %t1173 = load i64, ptr %t1172
  %t1174 = inttoptr i64 %t1173 to ptr
  %t1175 = musttail call fastcc i64 %t1174(i64 %t1170, i64 2, i64 %t1153, i64 %t1169, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1175
}

define fastcc i64 @"scheme.base:code:gcd"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1180 = icmp sge i64 %argc, 0
  br i1 %t1180, label %argok298, label %arityerr297
arityerr297:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok298:
  %t1181 = call ptr @rt_alloc_words(i64 8)
  %t1182 = getelementptr i64, ptr %t1181, i64 0
  store i64 %a0, ptr %t1182
  %t1183 = getelementptr i64, ptr %t1181, i64 1
  store i64 %a1, ptr %t1183
  %t1184 = getelementptr i64, ptr %t1181, i64 2
  store i64 %a2, ptr %t1184
  %t1185 = getelementptr i64, ptr %t1181, i64 3
  store i64 %a3, ptr %t1185
  %t1186 = getelementptr i64, ptr %t1181, i64 4
  store i64 %a4, ptr %t1186
  %t1187 = getelementptr i64, ptr %t1181, i64 5
  store i64 %a5, ptr %t1187
  %t1188 = getelementptr i64, ptr %t1181, i64 6
  store i64 %a6, ptr %t1188
  %t1189 = getelementptr i64, ptr %t1181, i64 7
  store i64 %a7, ptr %t1189
  %t1190 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1181, ptr %overflow)
  %t1191 = load i64, ptr @"scheme.base:%gcd-fold"
  call void @rt_check_callable(i64 %t1191)
  %t1192 = and i64 %t1191, -8
  %t1193 = inttoptr i64 %t1192 to ptr
  %t1194 = load i64, ptr %t1193
  %t1195 = inttoptr i64 %t1194 to ptr
  %t1196 = musttail call fastcc i64 %t1195(i64 %t1191, i64 2, i64 %t1190, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1196
}

define fastcc i64 @"scheme.base:code:lcm"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1201 = icmp sge i64 %argc, 0
  br i1 %t1201, label %argok300, label %arityerr299
arityerr299:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok300:
  %t1202 = call ptr @rt_alloc_words(i64 8)
  %t1203 = getelementptr i64, ptr %t1202, i64 0
  store i64 %a0, ptr %t1203
  %t1204 = getelementptr i64, ptr %t1202, i64 1
  store i64 %a1, ptr %t1204
  %t1205 = getelementptr i64, ptr %t1202, i64 2
  store i64 %a2, ptr %t1205
  %t1206 = getelementptr i64, ptr %t1202, i64 3
  store i64 %a3, ptr %t1206
  %t1207 = getelementptr i64, ptr %t1202, i64 4
  store i64 %a4, ptr %t1207
  %t1208 = getelementptr i64, ptr %t1202, i64 5
  store i64 %a5, ptr %t1208
  %t1209 = getelementptr i64, ptr %t1202, i64 6
  store i64 %a6, ptr %t1209
  %t1210 = getelementptr i64, ptr %t1202, i64 7
  store i64 %a7, ptr %t1210
  %t1211 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1202, ptr %overflow)
  %t1212 = load i64, ptr @"scheme.base:%lcm-fold"
  call void @rt_check_callable(i64 %t1212)
  %t1213 = and i64 %t1212, -8
  %t1214 = inttoptr i64 %t1213 to ptr
  %t1215 = load i64, ptr %t1214
  %t1216 = inttoptr i64 %t1215 to ptr
  %t1217 = musttail call fastcc i64 %t1216(i64 %t1212, i64 2, i64 %t1211, i64 8, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1217
}

define fastcc i64 @"scheme.base:code:%expt-exact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1222 = icmp eq i64 %argc, 3
  br i1 %t1222, label %argok302, label %arityerr301
arityerr301:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok302:
  %t1223 = or i64 %a1, 0
  %t1224 = and i64 %t1223, 7
  %t1225 = icmp eq i64 %t1224, 0
  br i1 %t1225, label %fixfast303, label %fixslow304
fixfast303:
  %t1226 = icmp eq i64 %a1, 0
  %t1227 = select i1 %t1226, i64 257, i64 1
  br label %fixmerge305
fixslow304:
  %t1228 = call i64 @rt_num_eq(i64 %a1, i64 0)
  br label %fixmerge305
fixmerge305:
  %t1229 = phi i64 [ %t1227, %fixfast303 ], [ %t1228, %fixslow304 ]
  %t1230 = icmp ne i64 %t1229, 1
  br i1 %t1230, label %then306, label %else307
then306:
  ret i64 %a2
else307:
  %t1231 = or i64 %a0, %a0
  %t1232 = and i64 %t1231, 7
  %t1233 = icmp eq i64 %t1232, 0
  br i1 %t1233, label %fixfast308, label %fixslow309
fixfast308:
  %t1234 = ashr i64 %a0, 3
  %t1235 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1234, i64 %a0)
  %t1236 = extractvalue {i64, i1} %t1235, 0
  %t1237 = extractvalue {i64, i1} %t1235, 1
  br i1 %t1237, label %fixslow309, label %fixmerge310
fixslow309:
  %t1238 = call i64 @rt_mul(i64 %a0, i64 %a0)
  br label %fixmerge310
fixmerge310:
  %t1239 = phi i64 [ %t1236, %fixfast308 ], [ %t1238, %fixslow309 ]
  %t1240 = call i64 @rt_quotient(i64 %a1, i64 16)
  %t1241 = load i64, ptr @"scheme.base:odd?"
  call void @rt_check_callable(i64 %t1241)
  %t1242 = and i64 %t1241, -8
  %t1243 = inttoptr i64 %t1242 to ptr
  %t1244 = load i64, ptr %t1243
  %t1245 = inttoptr i64 %t1244 to ptr
  %t1246 = call fastcc i64%t1245(i64 %t1241, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1247 = icmp ne i64 %t1246, 1
  br i1 %t1247, label %then311, label %else312
then311:
  %t1248 = or i64 %a2, %a0
  %t1249 = and i64 %t1248, 7
  %t1250 = icmp eq i64 %t1249, 0
  br i1 %t1250, label %fixfast314, label %fixslow315
fixfast314:
  %t1251 = ashr i64 %a2, 3
  %t1252 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1251, i64 %a0)
  %t1253 = extractvalue {i64, i1} %t1252, 0
  %t1254 = extractvalue {i64, i1} %t1252, 1
  br i1 %t1254, label %fixslow315, label %fixmerge316
fixslow315:
  %t1255 = call i64 @rt_mul(i64 %a2, i64 %a0)
  br label %fixmerge316
fixmerge316:
  %t1256 = phi i64 [ %t1253, %fixfast314 ], [ %t1255, %fixslow315 ]
  br label %merge313
else312:
  br label %merge313
merge313:
  %t1257 = phi i64 [ %t1256, %fixmerge316 ], [ %a2, %else312 ]
  %t1258 = load i64, ptr @"scheme.base:%expt-exact"
  call void @rt_check_callable(i64 %t1258)
  %t1259 = and i64 %t1258, -8
  %t1260 = inttoptr i64 %t1259 to ptr
  %t1261 = load i64, ptr %t1260
  %t1262 = inttoptr i64 %t1261 to ptr
  %t1263 = musttail call fastcc i64 %t1262(i64 %t1258, i64 3, i64 %t1239, i64 %t1240, i64 %t1257, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1263
}

define fastcc i64 @"scheme.base:code:expt"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1268 = icmp eq i64 %argc, 2
  br i1 %t1268, label %argok318, label %arityerr317
arityerr317:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok318:
  %t1269 = call i64 @rt_exact_p(i64 %a1)
  %t1270 = icmp ne i64 %t1269, 1
  br i1 %t1270, label %then319, label %else320
then319:
  %t1271 = or i64 %a1, 0
  %t1272 = and i64 %t1271, 7
  %t1273 = icmp eq i64 %t1272, 0
  br i1 %t1273, label %fixfast321, label %fixslow322
fixfast321:
  %t1274 = icmp slt i64 %a1, 0
  %t1275 = select i1 %t1274, i64 257, i64 1
  br label %fixmerge323
fixslow322:
  %t1276 = call i64 @rt_lt(i64 %a1, i64 0)
  br label %fixmerge323
fixmerge323:
  %t1277 = phi i64 [ %t1275, %fixfast321 ], [ %t1276, %fixslow322 ]
  %t1278 = icmp ne i64 %t1277, 1
  br i1 %t1278, label %then324, label %else325
then324:
  %t1279 = call i64 @rt_pow(i64 %a0, i64 %a1)
  ret i64 %t1279
else325:
  %t1280 = call i64 @rt_exact_p(i64 %a0)
  %t1281 = icmp ne i64 %t1280, 1
  br i1 %t1281, label %then326, label %else327
then326:
  %t1282 = load i64, ptr @"scheme.base:%expt-exact"
  call void @rt_check_callable(i64 %t1282)
  %t1283 = and i64 %t1282, -8
  %t1284 = inttoptr i64 %t1283 to ptr
  %t1285 = load i64, ptr %t1284
  %t1286 = inttoptr i64 %t1285 to ptr
  %t1287 = musttail call fastcc i64 %t1286(i64 %t1282, i64 3, i64 %a0, i64 %a1, i64 8, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1287
else327:
  %t1288 = call i64 @rt_flonum_lit(ptr @.flo.lit.0)
  %t1289 = load i64, ptr @"scheme.base:%expt-exact"
  call void @rt_check_callable(i64 %t1289)
  %t1290 = and i64 %t1289, -8
  %t1291 = inttoptr i64 %t1290 to ptr
  %t1292 = load i64, ptr %t1291
  %t1293 = inttoptr i64 %t1292 to ptr
  %t1294 = musttail call fastcc i64 %t1293(i64 %t1289, i64 3, i64 %a0, i64 %a1, i64 %t1288, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1294
else320:
  %t1295 = call i64 @rt_pow(i64 %a0, i64 %a1)
  ret i64 %t1295
}

define fastcc i64 @"scheme.base:code:%isqrt-loop"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1300 = icmp eq i64 %argc, 2
  br i1 %t1300, label %argok329, label %arityerr328
arityerr328:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok329:
  %t1301 = call i64 @rt_quotient(i64 %a0, i64 %a1)
  %t1302 = or i64 %a1, %t1301
  %t1303 = and i64 %t1302, 7
  %t1304 = icmp eq i64 %t1303, 0
  br i1 %t1304, label %fixfast330, label %fixslow331
fixfast330:
  %t1305 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t1301)
  %t1306 = extractvalue {i64, i1} %t1305, 0
  %t1307 = extractvalue {i64, i1} %t1305, 1
  br i1 %t1307, label %fixslow331, label %fixmerge332
fixslow331:
  %t1308 = call i64 @rt_add(i64 %a1, i64 %t1301)
  br label %fixmerge332
fixmerge332:
  %t1309 = phi i64 [ %t1306, %fixfast330 ], [ %t1308, %fixslow331 ]
  %t1310 = call i64 @rt_quotient(i64 %t1309, i64 16)
  %t1311 = or i64 %t1310, %a1
  %t1312 = and i64 %t1311, 7
  %t1313 = icmp eq i64 %t1312, 0
  br i1 %t1313, label %fixfast333, label %fixslow334
fixfast333:
  %t1314 = icmp slt i64 %t1310, %a1
  %t1315 = select i1 %t1314, i64 257, i64 1
  br label %fixmerge335
fixslow334:
  %t1316 = call i64 @rt_lt(i64 %t1310, i64 %a1)
  br label %fixmerge335
fixmerge335:
  %t1317 = phi i64 [ %t1315, %fixfast333 ], [ %t1316, %fixslow334 ]
  %t1318 = icmp ne i64 %t1317, 1
  br i1 %t1318, label %then336, label %else337
then336:
  %t1319 = load i64, ptr @"scheme.base:%isqrt-loop"
  call void @rt_check_callable(i64 %t1319)
  %t1320 = and i64 %t1319, -8
  %t1321 = inttoptr i64 %t1320 to ptr
  %t1322 = load i64, ptr %t1321
  %t1323 = inttoptr i64 %t1322 to ptr
  %t1324 = musttail call fastcc i64 %t1323(i64 %t1319, i64 2, i64 %a0, i64 %t1310, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1324
else337:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:%isqrt"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1329 = icmp eq i64 %argc, 1
  br i1 %t1329, label %argok339, label %arityerr338
arityerr338:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok339:
  %t1330 = or i64 %a0, 0
  %t1331 = and i64 %t1330, 7
  %t1332 = icmp eq i64 %t1331, 0
  br i1 %t1332, label %fixfast340, label %fixslow341
fixfast340:
  %t1333 = icmp eq i64 %a0, 0
  %t1334 = select i1 %t1333, i64 257, i64 1
  br label %fixmerge342
fixslow341:
  %t1335 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge342
fixmerge342:
  %t1336 = phi i64 [ %t1334, %fixfast340 ], [ %t1335, %fixslow341 ]
  %t1337 = icmp ne i64 %t1336, 1
  br i1 %t1337, label %then343, label %else344
then343:
  ret i64 0
else344:
  %t1338 = load i64, ptr @"scheme.base:%isqrt-loop"
  call void @rt_check_callable(i64 %t1338)
  %t1339 = and i64 %t1338, -8
  %t1340 = inttoptr i64 %t1339 to ptr
  %t1341 = load i64, ptr %t1340
  %t1342 = inttoptr i64 %t1341 to ptr
  %t1343 = musttail call fastcc i64 %t1342(i64 %t1338, i64 2, i64 %a0, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1343
}

define fastcc i64 @"scheme.base:code:exact-integer-sqrt"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1348 = icmp eq i64 %argc, 1
  br i1 %t1348, label %argok346, label %arityerr345
arityerr345:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok346:
  %t1349 = load i64, ptr @"scheme.base:%isqrt"
  call void @rt_check_callable(i64 %t1349)
  %t1350 = and i64 %t1349, -8
  %t1351 = inttoptr i64 %t1350 to ptr
  %t1352 = load i64, ptr %t1351
  %t1353 = inttoptr i64 %t1352 to ptr
  %t1354 = call fastcc i64%t1353(i64 %t1349, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1355 = or i64 %t1354, %t1354
  %t1356 = and i64 %t1355, 7
  %t1357 = icmp eq i64 %t1356, 0
  br i1 %t1357, label %fixfast347, label %fixslow348
fixfast347:
  %t1358 = ashr i64 %t1354, 3
  %t1359 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1358, i64 %t1354)
  %t1360 = extractvalue {i64, i1} %t1359, 0
  %t1361 = extractvalue {i64, i1} %t1359, 1
  br i1 %t1361, label %fixslow348, label %fixmerge349
fixslow348:
  %t1362 = call i64 @rt_mul(i64 %t1354, i64 %t1354)
  br label %fixmerge349
fixmerge349:
  %t1363 = phi i64 [ %t1360, %fixfast347 ], [ %t1362, %fixslow348 ]
  %t1364 = or i64 %a0, %t1363
  %t1365 = and i64 %t1364, 7
  %t1366 = icmp eq i64 %t1365, 0
  br i1 %t1366, label %fixfast350, label %fixslow351
fixfast350:
  %t1367 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t1363)
  %t1368 = extractvalue {i64, i1} %t1367, 0
  %t1369 = extractvalue {i64, i1} %t1367, 1
  br i1 %t1369, label %fixslow351, label %fixmerge352
fixslow351:
  %t1370 = call i64 @rt_sub(i64 %a0, i64 %t1363)
  br label %fixmerge352
fixmerge352:
  %t1371 = phi i64 [ %t1368, %fixfast350 ], [ %t1370, %fixslow351 ]
  %t1372 = load i64, ptr @"scheme.base:values"
  call void @rt_check_callable(i64 %t1372)
  %t1373 = and i64 %t1372, -8
  %t1374 = inttoptr i64 %t1373 to ptr
  %t1375 = load i64, ptr %t1374
  %t1376 = inttoptr i64 %t1375 to ptr
  %t1377 = musttail call fastcc i64 %t1376(i64 %t1372, i64 2, i64 %t1354, i64 %t1371, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1377
}

define fastcc i64 @"scheme.base:code:floor"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1382 = icmp eq i64 %argc, 1
  br i1 %t1382, label %argok354, label %arityerr353
arityerr353:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok354:
  %t1383 = call i64 @rt_exact_p(i64 %a0)
  %t1384 = icmp ne i64 %t1383, 1
  br i1 %t1384, label %then355, label %else356
then355:
  ret i64 %a0
else356:
  %t1385 = call i64 @rt_flo_floor(i64 %a0)
  ret i64 %t1385
}

define fastcc i64 @"scheme.base:code:ceiling"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1390 = icmp eq i64 %argc, 1
  br i1 %t1390, label %argok358, label %arityerr357
arityerr357:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok358:
  %t1391 = call i64 @rt_exact_p(i64 %a0)
  %t1392 = icmp ne i64 %t1391, 1
  br i1 %t1392, label %then359, label %else360
then359:
  ret i64 %a0
else360:
  %t1393 = call i64 @rt_flo_ceiling(i64 %a0)
  ret i64 %t1393
}

define fastcc i64 @"scheme.base:code:truncate"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1398 = icmp eq i64 %argc, 1
  br i1 %t1398, label %argok362, label %arityerr361
arityerr361:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok362:
  %t1399 = call i64 @rt_exact_p(i64 %a0)
  %t1400 = icmp ne i64 %t1399, 1
  br i1 %t1400, label %then363, label %else364
then363:
  ret i64 %a0
else364:
  %t1401 = call i64 @rt_flo_truncate(i64 %a0)
  ret i64 %t1401
}

define fastcc i64 @"scheme.base:code:round"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1406 = icmp eq i64 %argc, 1
  br i1 %t1406, label %argok366, label %arityerr365
arityerr365:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok366:
  %t1407 = call i64 @rt_exact_p(i64 %a0)
  %t1408 = icmp ne i64 %t1407, 1
  br i1 %t1408, label %then367, label %else368
then367:
  ret i64 %a0
else368:
  %t1409 = call i64 @rt_flo_round(i64 %a0)
  ret i64 %t1409
}

define fastcc i64 @"scheme.base:code:truncate-quotient"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1414 = icmp eq i64 %argc, 2
  br i1 %t1414, label %argok370, label %arityerr369
arityerr369:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok370:
  %t1415 = call i64 @rt_quotient(i64 %a0, i64 %a1)
  ret i64 %t1415
}

define fastcc i64 @"scheme.base:code:truncate-remainder"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1420 = icmp eq i64 %argc, 2
  br i1 %t1420, label %argok372, label %arityerr371
arityerr371:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok372:
  %t1421 = call i64 @rt_remainder(i64 %a0, i64 %a1)
  ret i64 %t1421
}

define fastcc i64 @"scheme.base:code:floor-remainder"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1426 = icmp eq i64 %argc, 2
  br i1 %t1426, label %argok374, label %arityerr373
arityerr373:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok374:
  %t1427 = call i64 @rt_modulo(i64 %a0, i64 %a1)
  ret i64 %t1427
}

define fastcc i64 @"scheme.base:code:floor-quotient"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1432 = icmp eq i64 %argc, 2
  br i1 %t1432, label %argok376, label %arityerr375
arityerr375:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok376:
  %t1433 = call i64 @rt_modulo(i64 %a0, i64 %a1)
  %t1434 = or i64 %a0, %t1433
  %t1435 = and i64 %t1434, 7
  %t1436 = icmp eq i64 %t1435, 0
  br i1 %t1436, label %fixfast377, label %fixslow378
fixfast377:
  %t1437 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t1433)
  %t1438 = extractvalue {i64, i1} %t1437, 0
  %t1439 = extractvalue {i64, i1} %t1437, 1
  br i1 %t1439, label %fixslow378, label %fixmerge379
fixslow378:
  %t1440 = call i64 @rt_sub(i64 %a0, i64 %t1433)
  br label %fixmerge379
fixmerge379:
  %t1441 = phi i64 [ %t1438, %fixfast377 ], [ %t1440, %fixslow378 ]
  %t1442 = call i64 @rt_quotient(i64 %t1441, i64 %a1)
  ret i64 %t1442
}

define fastcc i64 @"scheme.base:code:truncate/"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1447 = icmp eq i64 %argc, 2
  br i1 %t1447, label %argok381, label %arityerr380
arityerr380:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok381:
  %t1448 = call i64 @rt_quotient(i64 %a0, i64 %a1)
  %t1449 = call i64 @rt_remainder(i64 %a0, i64 %a1)
  %t1450 = load i64, ptr @"scheme.base:values"
  call void @rt_check_callable(i64 %t1450)
  %t1451 = and i64 %t1450, -8
  %t1452 = inttoptr i64 %t1451 to ptr
  %t1453 = load i64, ptr %t1452
  %t1454 = inttoptr i64 %t1453 to ptr
  %t1455 = musttail call fastcc i64 %t1454(i64 %t1450, i64 2, i64 %t1448, i64 %t1449, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1455
}

define fastcc i64 @"scheme.base:code:floor/"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1460 = icmp eq i64 %argc, 2
  br i1 %t1460, label %argok383, label %arityerr382
arityerr382:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok383:
  %t1461 = load i64, ptr @"scheme.base:floor-quotient"
  call void @rt_check_callable(i64 %t1461)
  %t1462 = and i64 %t1461, -8
  %t1463 = inttoptr i64 %t1462 to ptr
  %t1464 = load i64, ptr %t1463
  %t1465 = inttoptr i64 %t1464 to ptr
  %t1466 = call fastcc i64%t1465(i64 %t1461, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1467 = call i64 @rt_modulo(i64 %a0, i64 %a1)
  %t1468 = load i64, ptr @"scheme.base:values"
  call void @rt_check_callable(i64 %t1468)
  %t1469 = and i64 %t1468, -8
  %t1470 = inttoptr i64 %t1469 to ptr
  %t1471 = load i64, ptr %t1470
  %t1472 = inttoptr i64 %t1471 to ptr
  %t1473 = musttail call fastcc i64 %t1472(i64 %t1468, i64 2, i64 %t1466, i64 %t1467, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1473
}

define fastcc i64 @"scheme.base:code:numerator"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1478 = icmp eq i64 %argc, 1
  br i1 %t1478, label %argok385, label %arityerr384
arityerr384:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok385:
  %t1479 = call i64 @rt_integer_p(i64 %a0)
  %t1480 = icmp ne i64 %t1479, 1
  br i1 %t1480, label %then386, label %else387
then386:
  ret i64 %a0
else387:
  %t1481 = call i64 @rt_make_string(ptr @.str.lit.1, i64 25)
  %t1482 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t1482)
  %t1483 = and i64 %t1482, -8
  %t1484 = inttoptr i64 %t1483 to ptr
  %t1485 = load i64, ptr %t1484
  %t1486 = inttoptr i64 %t1485 to ptr
  %t1487 = musttail call fastcc i64 %t1486(i64 %t1482, i64 2, i64 %t1481, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1487
}

define fastcc i64 @"scheme.base:code:denominator"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1492 = icmp eq i64 %argc, 1
  br i1 %t1492, label %argok389, label %arityerr388
arityerr388:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok389:
  %t1493 = call i64 @rt_integer_p(i64 %a0)
  %t1494 = icmp ne i64 %t1493, 1
  br i1 %t1494, label %then390, label %else391
then390:
  %t1495 = call i64 @rt_exact_p(i64 %a0)
  %t1496 = icmp ne i64 %t1495, 1
  br i1 %t1496, label %then392, label %else393
then392:
  ret i64 8
else393:
  %t1497 = call i64 @rt_flonum_lit(ptr @.flo.lit.2)
  ret i64 %t1497
else391:
  %t1498 = call i64 @rt_make_string(ptr @.str.lit.3, i64 27)
  %t1499 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t1499)
  %t1500 = and i64 %t1499, -8
  %t1501 = inttoptr i64 %t1500 to ptr
  %t1502 = load i64, ptr %t1501
  %t1503 = inttoptr i64 %t1502 to ptr
  %t1504 = musttail call fastcc i64 %t1503(i64 %t1499, i64 2, i64 %t1498, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1504
}

define fastcc i64 @"scheme.base:code:inexact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1509 = icmp eq i64 %argc, 1
  br i1 %t1509, label %argok395, label %arityerr394
arityerr394:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok395:
  %t1510 = call i64 @rt_exact_to_inexact(i64 %a0)
  ret i64 %t1510
}

define fastcc i64 @"scheme.base:code:exact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1515 = icmp eq i64 %argc, 1
  br i1 %t1515, label %argok397, label %arityerr396
arityerr396:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok397:
  %t1516 = call i64 @rt_inexact_to_exact(i64 %a0)
  ret i64 %t1516
}

define fastcc i64 @"scheme.base:code:void"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1521 = icmp eq i64 %argc, 0
  br i1 %t1521, label %argok399, label %arityerr398
arityerr398:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok399:
  %t1522 = icmp ne i64 1, 1
  br i1 %t1522, label %then400, label %else401
then400:
  ret i64 1
else401:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1527 = icmp sge i64 %argc, 0
  br i1 %t1527, label %argok403, label %arityerr402
arityerr402:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok403:
  %t1528 = call ptr @rt_alloc_words(i64 8)
  %t1529 = getelementptr i64, ptr %t1528, i64 0
  store i64 %a0, ptr %t1529
  %t1530 = getelementptr i64, ptr %t1528, i64 1
  store i64 %a1, ptr %t1530
  %t1531 = getelementptr i64, ptr %t1528, i64 2
  store i64 %a2, ptr %t1531
  %t1532 = getelementptr i64, ptr %t1528, i64 3
  store i64 %a3, ptr %t1532
  %t1533 = getelementptr i64, ptr %t1528, i64 4
  store i64 %a4, ptr %t1533
  %t1534 = getelementptr i64, ptr %t1528, i64 5
  store i64 %a5, ptr %t1534
  %t1535 = getelementptr i64, ptr %t1528, i64 6
  store i64 %a6, ptr %t1535
  %t1536 = getelementptr i64, ptr %t1528, i64 7
  store i64 %a7, ptr %t1536
  %t1537 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1528, ptr %overflow)
  %t1538 = call i64 @rt_list_to_string(i64 %t1537)
  ret i64 %t1538
}

define fastcc i64 @"scheme.base:code:%str-concat"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1543 = icmp eq i64 %argc, 1
  br i1 %t1543, label %argok405, label %arityerr404
arityerr404:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok405:
  %t1544 = call i64 @rt_null_p(i64 %a0)
  %t1545 = icmp ne i64 %t1544, 1
  br i1 %t1545, label %then406, label %else407
then406:
  %t1546 = call i64 @rt_make_string(ptr @.str.lit.4, i64 0)
  ret i64 %t1546
else407:
  %t1547 = call i64 @rt_car(i64 %a0)
  %t1548 = call i64 @rt_cdr(i64 %a0)
  %t1549 = load i64, ptr @"scheme.base:%str-concat"
  call void @rt_check_callable(i64 %t1549)
  %t1550 = and i64 %t1549, -8
  %t1551 = inttoptr i64 %t1550 to ptr
  %t1552 = load i64, ptr %t1551
  %t1553 = inttoptr i64 %t1552 to ptr
  %t1554 = call fastcc i64%t1553(i64 %t1549, i64 1, i64 %t1548, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1555 = call i64 @rt_string_append(i64 %t1547, i64 %t1554)
  ret i64 %t1555
}

define fastcc i64 @"scheme.base:code:chr-cmp"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1560 = icmp eq i64 %argc, 4
  br i1 %t1560, label %argok409, label %arityerr408
arityerr408:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok409:
  %t1561 = call i64 @rt_char_to_integer(i64 %a1)
  %t1562 = call i64 @rt_char_to_integer(i64 %a2)
  call void @rt_check_callable(i64 %a0)
  %t1563 = and i64 %a0, -8
  %t1564 = inttoptr i64 %t1563 to ptr
  %t1565 = load i64, ptr %t1564
  %t1566 = inttoptr i64 %t1565 to ptr
  %t1567 = call fastcc i64%t1566(i64 %a0, i64 2, i64 %t1561, i64 %t1562, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1568 = icmp ne i64 %t1567, 1
  br i1 %t1568, label %then410, label %else411
then410:
  %t1569 = call i64 @rt_null_p(i64 %a3)
  %t1570 = icmp ne i64 %t1569, 1
  br i1 %t1570, label %then412, label %else413
then412:
  ret i64 257
else413:
  %t1571 = call i64 @rt_car(i64 %a3)
  %t1572 = call i64 @rt_cdr(i64 %a3)
  %t1573 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1573)
  %t1574 = and i64 %t1573, -8
  %t1575 = inttoptr i64 %t1574 to ptr
  %t1576 = load i64, ptr %t1575
  %t1577 = inttoptr i64 %t1576 to ptr
  %t1578 = musttail call fastcc i64 %t1577(i64 %t1573, i64 4, i64 %a0, i64 %a2, i64 %t1571, i64 %t1572, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1578
else411:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_329"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1583 = icmp eq i64 %argc, 2
  br i1 %t1583, label %argok415, label %arityerr414
arityerr414:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok415:
  %t1584 = or i64 %a0, %a1
  %t1585 = and i64 %t1584, 7
  %t1586 = icmp eq i64 %t1585, 0
  br i1 %t1586, label %fixfast416, label %fixslow417
fixfast416:
  %t1587 = icmp eq i64 %a0, %a1
  %t1588 = select i1 %t1587, i64 257, i64 1
  br label %fixmerge418
fixslow417:
  %t1589 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge418
fixmerge418:
  %t1590 = phi i64 [ %t1588, %fixfast416 ], [ %t1589, %fixslow417 ]
  ret i64 %t1590
}

define fastcc i64 @"scheme.base:code:char=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1591 = icmp sge i64 %argc, 2
  br i1 %t1591, label %argok420, label %arityerr419
arityerr419:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok420:
  %t1592 = call ptr @rt_alloc_words(i64 8)
  %t1593 = getelementptr i64, ptr %t1592, i64 0
  store i64 %a0, ptr %t1593
  %t1594 = getelementptr i64, ptr %t1592, i64 1
  store i64 %a1, ptr %t1594
  %t1595 = getelementptr i64, ptr %t1592, i64 2
  store i64 %a2, ptr %t1595
  %t1596 = getelementptr i64, ptr %t1592, i64 3
  store i64 %a3, ptr %t1596
  %t1597 = getelementptr i64, ptr %t1592, i64 4
  store i64 %a4, ptr %t1597
  %t1598 = getelementptr i64, ptr %t1592, i64 5
  store i64 %a5, ptr %t1598
  %t1599 = getelementptr i64, ptr %t1592, i64 6
  store i64 %a6, ptr %t1599
  %t1600 = getelementptr i64, ptr %t1592, i64 7
  store i64 %a7, ptr %t1600
  %t1601 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1592, ptr %overflow)
  %t1602 = call ptr @rt_alloc_words(i64 1)
  %t1603 = ptrtoint ptr %t1602 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_329" to i64), ptr %t1602
  %t1604 = or i64 %t1603, 4
  %t1605 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1605)
  %t1606 = and i64 %t1605, -8
  %t1607 = inttoptr i64 %t1606 to ptr
  %t1608 = load i64, ptr %t1607
  %t1609 = inttoptr i64 %t1608 to ptr
  %t1610 = musttail call fastcc i64 %t1609(i64 %t1605, i64 4, i64 %t1604, i64 %a0, i64 %a1, i64 %t1601, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1610
}

define fastcc i64 @"scheme.base:code_341"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1615 = icmp eq i64 %argc, 2
  br i1 %t1615, label %argok422, label %arityerr421
arityerr421:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok422:
  %t1616 = or i64 %a0, %a1
  %t1617 = and i64 %t1616, 7
  %t1618 = icmp eq i64 %t1617, 0
  br i1 %t1618, label %fixfast423, label %fixslow424
fixfast423:
  %t1619 = icmp slt i64 %a0, %a1
  %t1620 = select i1 %t1619, i64 257, i64 1
  br label %fixmerge425
fixslow424:
  %t1621 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge425
fixmerge425:
  %t1622 = phi i64 [ %t1620, %fixfast423 ], [ %t1621, %fixslow424 ]
  ret i64 %t1622
}

define fastcc i64 @"scheme.base:code:char<?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1623 = icmp sge i64 %argc, 2
  br i1 %t1623, label %argok427, label %arityerr426
arityerr426:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok427:
  %t1624 = call ptr @rt_alloc_words(i64 8)
  %t1625 = getelementptr i64, ptr %t1624, i64 0
  store i64 %a0, ptr %t1625
  %t1626 = getelementptr i64, ptr %t1624, i64 1
  store i64 %a1, ptr %t1626
  %t1627 = getelementptr i64, ptr %t1624, i64 2
  store i64 %a2, ptr %t1627
  %t1628 = getelementptr i64, ptr %t1624, i64 3
  store i64 %a3, ptr %t1628
  %t1629 = getelementptr i64, ptr %t1624, i64 4
  store i64 %a4, ptr %t1629
  %t1630 = getelementptr i64, ptr %t1624, i64 5
  store i64 %a5, ptr %t1630
  %t1631 = getelementptr i64, ptr %t1624, i64 6
  store i64 %a6, ptr %t1631
  %t1632 = getelementptr i64, ptr %t1624, i64 7
  store i64 %a7, ptr %t1632
  %t1633 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1624, ptr %overflow)
  %t1634 = call ptr @rt_alloc_words(i64 1)
  %t1635 = ptrtoint ptr %t1634 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_341" to i64), ptr %t1634
  %t1636 = or i64 %t1635, 4
  %t1637 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1637)
  %t1638 = and i64 %t1637, -8
  %t1639 = inttoptr i64 %t1638 to ptr
  %t1640 = load i64, ptr %t1639
  %t1641 = inttoptr i64 %t1640 to ptr
  %t1642 = musttail call fastcc i64 %t1641(i64 %t1637, i64 4, i64 %t1636, i64 %a0, i64 %a1, i64 %t1633, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1642
}

define fastcc i64 @"scheme.base:code_353"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1647 = icmp eq i64 %argc, 2
  br i1 %t1647, label %argok429, label %arityerr428
arityerr428:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok429:
  %t1648 = or i64 %a1, %a0
  %t1649 = and i64 %t1648, 7
  %t1650 = icmp eq i64 %t1649, 0
  br i1 %t1650, label %fixfast430, label %fixslow431
fixfast430:
  %t1651 = icmp slt i64 %a1, %a0
  %t1652 = select i1 %t1651, i64 257, i64 1
  br label %fixmerge432
fixslow431:
  %t1653 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge432
fixmerge432:
  %t1654 = phi i64 [ %t1652, %fixfast430 ], [ %t1653, %fixslow431 ]
  ret i64 %t1654
}

define fastcc i64 @"scheme.base:code:char>?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1655 = icmp sge i64 %argc, 2
  br i1 %t1655, label %argok434, label %arityerr433
arityerr433:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok434:
  %t1656 = call ptr @rt_alloc_words(i64 8)
  %t1657 = getelementptr i64, ptr %t1656, i64 0
  store i64 %a0, ptr %t1657
  %t1658 = getelementptr i64, ptr %t1656, i64 1
  store i64 %a1, ptr %t1658
  %t1659 = getelementptr i64, ptr %t1656, i64 2
  store i64 %a2, ptr %t1659
  %t1660 = getelementptr i64, ptr %t1656, i64 3
  store i64 %a3, ptr %t1660
  %t1661 = getelementptr i64, ptr %t1656, i64 4
  store i64 %a4, ptr %t1661
  %t1662 = getelementptr i64, ptr %t1656, i64 5
  store i64 %a5, ptr %t1662
  %t1663 = getelementptr i64, ptr %t1656, i64 6
  store i64 %a6, ptr %t1663
  %t1664 = getelementptr i64, ptr %t1656, i64 7
  store i64 %a7, ptr %t1664
  %t1665 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1656, ptr %overflow)
  %t1666 = call ptr @rt_alloc_words(i64 1)
  %t1667 = ptrtoint ptr %t1666 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_353" to i64), ptr %t1666
  %t1668 = or i64 %t1667, 4
  %t1669 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1669)
  %t1670 = and i64 %t1669, -8
  %t1671 = inttoptr i64 %t1670 to ptr
  %t1672 = load i64, ptr %t1671
  %t1673 = inttoptr i64 %t1672 to ptr
  %t1674 = musttail call fastcc i64 %t1673(i64 %t1669, i64 4, i64 %t1668, i64 %a0, i64 %a1, i64 %t1665, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1674
}

define fastcc i64 @"scheme.base:code_365"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1679 = icmp eq i64 %argc, 2
  br i1 %t1679, label %argok436, label %arityerr435
arityerr435:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok436:
  %t1680 = or i64 %a0, %a1
  %t1681 = and i64 %t1680, 7
  %t1682 = icmp eq i64 %t1681, 0
  br i1 %t1682, label %fixfast437, label %fixslow438
fixfast437:
  %t1683 = icmp slt i64 %a0, %a1
  %t1684 = select i1 %t1683, i64 257, i64 1
  br label %fixmerge439
fixslow438:
  %t1685 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge439
fixmerge439:
  %t1686 = phi i64 [ %t1684, %fixfast437 ], [ %t1685, %fixslow438 ]
  %t1687 = icmp ne i64 %t1686, 1
  br i1 %t1687, label %then440, label %else441
then440:
  ret i64 257
else441:
  %t1688 = or i64 %a0, %a1
  %t1689 = and i64 %t1688, 7
  %t1690 = icmp eq i64 %t1689, 0
  br i1 %t1690, label %fixfast442, label %fixslow443
fixfast442:
  %t1691 = icmp eq i64 %a0, %a1
  %t1692 = select i1 %t1691, i64 257, i64 1
  br label %fixmerge444
fixslow443:
  %t1693 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge444
fixmerge444:
  %t1694 = phi i64 [ %t1692, %fixfast442 ], [ %t1693, %fixslow443 ]
  ret i64 %t1694
}

define fastcc i64 @"scheme.base:code:char<=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1695 = icmp sge i64 %argc, 2
  br i1 %t1695, label %argok446, label %arityerr445
arityerr445:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok446:
  %t1696 = call ptr @rt_alloc_words(i64 8)
  %t1697 = getelementptr i64, ptr %t1696, i64 0
  store i64 %a0, ptr %t1697
  %t1698 = getelementptr i64, ptr %t1696, i64 1
  store i64 %a1, ptr %t1698
  %t1699 = getelementptr i64, ptr %t1696, i64 2
  store i64 %a2, ptr %t1699
  %t1700 = getelementptr i64, ptr %t1696, i64 3
  store i64 %a3, ptr %t1700
  %t1701 = getelementptr i64, ptr %t1696, i64 4
  store i64 %a4, ptr %t1701
  %t1702 = getelementptr i64, ptr %t1696, i64 5
  store i64 %a5, ptr %t1702
  %t1703 = getelementptr i64, ptr %t1696, i64 6
  store i64 %a6, ptr %t1703
  %t1704 = getelementptr i64, ptr %t1696, i64 7
  store i64 %a7, ptr %t1704
  %t1705 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1696, ptr %overflow)
  %t1706 = call ptr @rt_alloc_words(i64 1)
  %t1707 = ptrtoint ptr %t1706 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_365" to i64), ptr %t1706
  %t1708 = or i64 %t1707, 4
  %t1709 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1709)
  %t1710 = and i64 %t1709, -8
  %t1711 = inttoptr i64 %t1710 to ptr
  %t1712 = load i64, ptr %t1711
  %t1713 = inttoptr i64 %t1712 to ptr
  %t1714 = musttail call fastcc i64 %t1713(i64 %t1709, i64 4, i64 %t1708, i64 %a0, i64 %a1, i64 %t1705, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1714
}

define fastcc i64 @"scheme.base:code_377"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1719 = icmp eq i64 %argc, 2
  br i1 %t1719, label %argok448, label %arityerr447
arityerr447:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok448:
  %t1720 = or i64 %a1, %a0
  %t1721 = and i64 %t1720, 7
  %t1722 = icmp eq i64 %t1721, 0
  br i1 %t1722, label %fixfast449, label %fixslow450
fixfast449:
  %t1723 = icmp slt i64 %a1, %a0
  %t1724 = select i1 %t1723, i64 257, i64 1
  br label %fixmerge451
fixslow450:
  %t1725 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge451
fixmerge451:
  %t1726 = phi i64 [ %t1724, %fixfast449 ], [ %t1725, %fixslow450 ]
  %t1727 = icmp ne i64 %t1726, 1
  br i1 %t1727, label %then452, label %else453
then452:
  ret i64 257
else453:
  %t1728 = or i64 %a0, %a1
  %t1729 = and i64 %t1728, 7
  %t1730 = icmp eq i64 %t1729, 0
  br i1 %t1730, label %fixfast454, label %fixslow455
fixfast454:
  %t1731 = icmp eq i64 %a0, %a1
  %t1732 = select i1 %t1731, i64 257, i64 1
  br label %fixmerge456
fixslow455:
  %t1733 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge456
fixmerge456:
  %t1734 = phi i64 [ %t1732, %fixfast454 ], [ %t1733, %fixslow455 ]
  ret i64 %t1734
}

define fastcc i64 @"scheme.base:code:char>=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1735 = icmp sge i64 %argc, 2
  br i1 %t1735, label %argok458, label %arityerr457
arityerr457:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok458:
  %t1736 = call ptr @rt_alloc_words(i64 8)
  %t1737 = getelementptr i64, ptr %t1736, i64 0
  store i64 %a0, ptr %t1737
  %t1738 = getelementptr i64, ptr %t1736, i64 1
  store i64 %a1, ptr %t1738
  %t1739 = getelementptr i64, ptr %t1736, i64 2
  store i64 %a2, ptr %t1739
  %t1740 = getelementptr i64, ptr %t1736, i64 3
  store i64 %a3, ptr %t1740
  %t1741 = getelementptr i64, ptr %t1736, i64 4
  store i64 %a4, ptr %t1741
  %t1742 = getelementptr i64, ptr %t1736, i64 5
  store i64 %a5, ptr %t1742
  %t1743 = getelementptr i64, ptr %t1736, i64 6
  store i64 %a6, ptr %t1743
  %t1744 = getelementptr i64, ptr %t1736, i64 7
  store i64 %a7, ptr %t1744
  %t1745 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1736, ptr %overflow)
  %t1746 = call ptr @rt_alloc_words(i64 1)
  %t1747 = ptrtoint ptr %t1746 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_377" to i64), ptr %t1746
  %t1748 = or i64 %t1747, 4
  %t1749 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1749)
  %t1750 = and i64 %t1749, -8
  %t1751 = inttoptr i64 %t1750 to ptr
  %t1752 = load i64, ptr %t1751
  %t1753 = inttoptr i64 %t1752 to ptr
  %t1754 = musttail call fastcc i64 %t1753(i64 %t1749, i64 4, i64 %t1748, i64 %a0, i64 %a1, i64 %t1745, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1754
}

define fastcc i64 @"scheme.base:code_392"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1759 = icmp eq i64 %argc, 2
  br i1 %t1759, label %argok460, label %arityerr459
arityerr459:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok460:
  %t1760 = and i64 %self, -8
  %t1761 = inttoptr i64 %t1760 to ptr
  %t1762 = getelementptr i64, ptr %t1761, i64 1
  %t1763 = load i64, ptr %t1762
  %t1764 = or i64 %a0, %t1763
  %t1765 = and i64 %t1764, 7
  %t1766 = icmp eq i64 %t1765, 0
  br i1 %t1766, label %fixfast461, label %fixslow462
fixfast461:
  %t1767 = icmp slt i64 %a0, %t1763
  %t1768 = select i1 %t1767, i64 257, i64 1
  br label %fixmerge463
fixslow462:
  %t1769 = call i64 @rt_lt(i64 %a0, i64 %t1763)
  br label %fixmerge463
fixmerge463:
  %t1770 = phi i64 [ %t1768, %fixfast461 ], [ %t1769, %fixslow462 ]
  %t1771 = icmp ne i64 %t1770, 1
  br i1 %t1771, label %then464, label %else465
then464:
  ret i64 %a1
else465:
  %t1772 = or i64 %a0, 8
  %t1773 = and i64 %t1772, 7
  %t1774 = icmp eq i64 %t1773, 0
  br i1 %t1774, label %fixfast466, label %fixslow467
fixfast466:
  %t1775 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t1776 = extractvalue {i64, i1} %t1775, 0
  %t1777 = extractvalue {i64, i1} %t1775, 1
  br i1 %t1777, label %fixslow467, label %fixmerge468
fixslow467:
  %t1778 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge468
fixmerge468:
  %t1779 = phi i64 [ %t1776, %fixfast466 ], [ %t1778, %fixslow467 ]
  %t1780 = and i64 %self, -8
  %t1781 = inttoptr i64 %t1780 to ptr
  %t1782 = getelementptr i64, ptr %t1781, i64 3
  %t1783 = load i64, ptr %t1782
  %t1784 = call i64 @rt_string_ref(i64 %t1783, i64 %a0)
  %t1785 = call i64 @rt_cons(i64 %t1784, i64 %a1)
  %t1786 = musttail call fastcc i64 @"scheme.base:code_392"(i64 %self, i64 2, i64 %t1779, i64 %t1785, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1786
}

define fastcc i64 @"scheme.base:code:string->list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1787 = icmp sge i64 %argc, 1
  br i1 %t1787, label %argok470, label %arityerr469
arityerr469:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok470:
  %t1788 = call ptr @rt_alloc_words(i64 8)
  %t1789 = getelementptr i64, ptr %t1788, i64 0
  store i64 %a0, ptr %t1789
  %t1790 = getelementptr i64, ptr %t1788, i64 1
  store i64 %a1, ptr %t1790
  %t1791 = getelementptr i64, ptr %t1788, i64 2
  store i64 %a2, ptr %t1791
  %t1792 = getelementptr i64, ptr %t1788, i64 3
  store i64 %a3, ptr %t1792
  %t1793 = getelementptr i64, ptr %t1788, i64 4
  store i64 %a4, ptr %t1793
  %t1794 = getelementptr i64, ptr %t1788, i64 5
  store i64 %a5, ptr %t1794
  %t1795 = getelementptr i64, ptr %t1788, i64 6
  store i64 %a6, ptr %t1795
  %t1796 = getelementptr i64, ptr %t1788, i64 7
  store i64 %a7, ptr %t1796
  %t1797 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t1788, ptr %overflow)
  %t1798 = call i64 @rt_string_length(i64 %a0)
  %t1799 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t1799)
  %t1800 = and i64 %t1799, -8
  %t1801 = inttoptr i64 %t1800 to ptr
  %t1802 = load i64, ptr %t1801
  %t1803 = inttoptr i64 %t1802 to ptr
  %t1804 = call fastcc i64%t1803(i64 %t1799, i64 1, i64 %t1797, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1805 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t1805)
  %t1806 = and i64 %t1805, -8
  %t1807 = inttoptr i64 %t1806 to ptr
  %t1808 = load i64, ptr %t1807
  %t1809 = inttoptr i64 %t1808 to ptr
  %t1810 = call fastcc i64%t1809(i64 %t1805, i64 2, i64 %t1797, i64 %t1798, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1811 = call i64 @rt_intern(ptr @.str.sym.5)
  %t1812 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t1812)
  %t1813 = and i64 %t1812, -8
  %t1814 = inttoptr i64 %t1813 to ptr
  %t1815 = load i64, ptr %t1814
  %t1816 = inttoptr i64 %t1815 to ptr
  %t1817 = call fastcc i64%t1816(i64 %t1812, i64 4, i64 %t1811, i64 %t1804, i64 %t1810, i64 %t1798, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1818 = call ptr @rt_alloc_words(i64 4)
  %t1819 = ptrtoint ptr %t1818 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_392" to i64), ptr %t1818
  %t1820 = or i64 %t1819, 4
  %t1821 = getelementptr i64, ptr %t1818, i64 1
  store i64 %t1804, ptr %t1821
  %t1822 = getelementptr i64, ptr %t1818, i64 2
  store i64 %t1820, ptr %t1822
  %t1823 = getelementptr i64, ptr %t1818, i64 3
  store i64 %a0, ptr %t1823
  %t1824 = or i64 %t1810, 8
  %t1825 = and i64 %t1824, 7
  %t1826 = icmp eq i64 %t1825, 0
  br i1 %t1826, label %fixfast471, label %fixslow472
fixfast471:
  %t1827 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t1810, i64 8)
  %t1828 = extractvalue {i64, i1} %t1827, 0
  %t1829 = extractvalue {i64, i1} %t1827, 1
  br i1 %t1829, label %fixslow472, label %fixmerge473
fixslow472:
  %t1830 = call i64 @rt_sub(i64 %t1810, i64 8)
  br label %fixmerge473
fixmerge473:
  %t1831 = phi i64 [ %t1828, %fixfast471 ], [ %t1830, %fixslow472 ]
  %t1832 = musttail call fastcc i64 @"scheme.base:code_392"(i64 %t1820, i64 2, i64 %t1831, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1832
}

define fastcc i64 @"scheme.base:code:ns-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1837 = icmp eq i64 %argc, 2
  br i1 %t1837, label %argok475, label %arityerr474
arityerr474:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok475:
  %t1838 = load i64, ptr @"scheme.base:ns-digits-radix"
  call void @rt_check_callable(i64 %t1838)
  %t1839 = and i64 %t1838, -8
  %t1840 = inttoptr i64 %t1839 to ptr
  %t1841 = load i64, ptr %t1840
  %t1842 = inttoptr i64 %t1841 to ptr
  %t1843 = musttail call fastcc i64 %t1842(i64 %t1838, i64 3, i64 %a0, i64 80, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1843
}

define fastcc i64 @"scheme.base:code:%ns-digit-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1848 = icmp eq i64 %argc, 1
  br i1 %t1848, label %argok477, label %arityerr476
arityerr476:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok477:
  %t1849 = or i64 %a0, 80
  %t1850 = and i64 %t1849, 7
  %t1851 = icmp eq i64 %t1850, 0
  br i1 %t1851, label %fixfast478, label %fixslow479
fixfast478:
  %t1852 = icmp slt i64 %a0, 80
  %t1853 = select i1 %t1852, i64 257, i64 1
  br label %fixmerge480
fixslow479:
  %t1854 = call i64 @rt_lt(i64 %a0, i64 80)
  br label %fixmerge480
fixmerge480:
  %t1855 = phi i64 [ %t1853, %fixfast478 ], [ %t1854, %fixslow479 ]
  %t1856 = icmp ne i64 %t1855, 1
  br i1 %t1856, label %then481, label %else482
then481:
  %t1857 = or i64 384, %a0
  %t1858 = and i64 %t1857, 7
  %t1859 = icmp eq i64 %t1858, 0
  br i1 %t1859, label %fixfast483, label %fixslow484
fixfast483:
  %t1860 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 384, i64 %a0)
  %t1861 = extractvalue {i64, i1} %t1860, 0
  %t1862 = extractvalue {i64, i1} %t1860, 1
  br i1 %t1862, label %fixslow484, label %fixmerge485
fixslow484:
  %t1863 = call i64 @rt_add(i64 384, i64 %a0)
  br label %fixmerge485
fixmerge485:
  %t1864 = phi i64 [ %t1861, %fixfast483 ], [ %t1863, %fixslow484 ]
  %t1865 = call i64 @rt_integer_to_char(i64 %t1864)
  ret i64 %t1865
else482:
  %t1866 = or i64 696, %a0
  %t1867 = and i64 %t1866, 7
  %t1868 = icmp eq i64 %t1867, 0
  br i1 %t1868, label %fixfast486, label %fixslow487
fixfast486:
  %t1869 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 696, i64 %a0)
  %t1870 = extractvalue {i64, i1} %t1869, 0
  %t1871 = extractvalue {i64, i1} %t1869, 1
  br i1 %t1871, label %fixslow487, label %fixmerge488
fixslow487:
  %t1872 = call i64 @rt_add(i64 696, i64 %a0)
  br label %fixmerge488
fixmerge488:
  %t1873 = phi i64 [ %t1870, %fixfast486 ], [ %t1872, %fixslow487 ]
  %t1874 = call i64 @rt_integer_to_char(i64 %t1873)
  ret i64 %t1874
}

define fastcc i64 @"scheme.base:code:ns-digits-radix"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1879 = icmp eq i64 %argc, 3
  br i1 %t1879, label %argok490, label %arityerr489
arityerr489:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok490:
  %t1880 = call i64 @rt_remainder(i64 %a0, i64 %a1)
  %t1881 = or i64 0, %t1880
  %t1882 = and i64 %t1881, 7
  %t1883 = icmp eq i64 %t1882, 0
  br i1 %t1883, label %fixfast491, label %fixslow492
fixfast491:
  %t1884 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %t1880)
  %t1885 = extractvalue {i64, i1} %t1884, 0
  %t1886 = extractvalue {i64, i1} %t1884, 1
  br i1 %t1886, label %fixslow492, label %fixmerge493
fixslow492:
  %t1887 = call i64 @rt_sub(i64 0, i64 %t1880)
  br label %fixmerge493
fixmerge493:
  %t1888 = phi i64 [ %t1885, %fixfast491 ], [ %t1887, %fixslow492 ]
  %t1889 = load i64, ptr @"scheme.base:%ns-digit-char"
  call void @rt_check_callable(i64 %t1889)
  %t1890 = and i64 %t1889, -8
  %t1891 = inttoptr i64 %t1890 to ptr
  %t1892 = load i64, ptr %t1891
  %t1893 = inttoptr i64 %t1892 to ptr
  %t1894 = call fastcc i64%t1893(i64 %t1889, i64 1, i64 %t1888, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1895 = call i64 @rt_quotient(i64 %a0, i64 %a1)
  %t1896 = or i64 %t1895, 0
  %t1897 = and i64 %t1896, 7
  %t1898 = icmp eq i64 %t1897, 0
  br i1 %t1898, label %fixfast494, label %fixslow495
fixfast494:
  %t1899 = icmp eq i64 %t1895, 0
  %t1900 = select i1 %t1899, i64 257, i64 1
  br label %fixmerge496
fixslow495:
  %t1901 = call i64 @rt_num_eq(i64 %t1895, i64 0)
  br label %fixmerge496
fixmerge496:
  %t1902 = phi i64 [ %t1900, %fixfast494 ], [ %t1901, %fixslow495 ]
  %t1903 = icmp ne i64 %t1902, 1
  br i1 %t1903, label %then497, label %else498
then497:
  %t1904 = call i64 @rt_cons(i64 %t1894, i64 %a2)
  ret i64 %t1904
else498:
  %t1905 = call i64 @rt_cons(i64 %t1894, i64 %a2)
  %t1906 = load i64, ptr @"scheme.base:ns-digits-radix"
  call void @rt_check_callable(i64 %t1906)
  %t1907 = and i64 %t1906, -8
  %t1908 = inttoptr i64 %t1907 to ptr
  %t1909 = load i64, ptr %t1908
  %t1910 = inttoptr i64 %t1909 to ptr
  %t1911 = musttail call fastcc i64 %t1910(i64 %t1906, i64 3, i64 %t1895, i64 %a1, i64 %t1905, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1911
}

define fastcc i64 @"scheme.base:code:%radix-ok?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1916 = icmp eq i64 %argc, 1
  br i1 %t1916, label %argok500, label %arityerr499
arityerr499:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok500:
  %t1917 = or i64 %a0, 80
  %t1918 = and i64 %t1917, 7
  %t1919 = icmp eq i64 %t1918, 0
  br i1 %t1919, label %fixfast501, label %fixslow502
fixfast501:
  %t1920 = icmp eq i64 %a0, 80
  %t1921 = select i1 %t1920, i64 257, i64 1
  br label %fixmerge503
fixslow502:
  %t1922 = call i64 @rt_num_eq(i64 %a0, i64 80)
  br label %fixmerge503
fixmerge503:
  %t1923 = phi i64 [ %t1921, %fixfast501 ], [ %t1922, %fixslow502 ]
  %t1924 = icmp ne i64 %t1923, 1
  br i1 %t1924, label %then504, label %else505
then504:
  ret i64 257
else505:
  %t1925 = or i64 %a0, 128
  %t1926 = and i64 %t1925, 7
  %t1927 = icmp eq i64 %t1926, 0
  br i1 %t1927, label %fixfast506, label %fixslow507
fixfast506:
  %t1928 = icmp eq i64 %a0, 128
  %t1929 = select i1 %t1928, i64 257, i64 1
  br label %fixmerge508
fixslow507:
  %t1930 = call i64 @rt_num_eq(i64 %a0, i64 128)
  br label %fixmerge508
fixmerge508:
  %t1931 = phi i64 [ %t1929, %fixfast506 ], [ %t1930, %fixslow507 ]
  %t1932 = icmp ne i64 %t1931, 1
  br i1 %t1932, label %then509, label %else510
then509:
  ret i64 257
else510:
  %t1933 = or i64 %a0, 64
  %t1934 = and i64 %t1933, 7
  %t1935 = icmp eq i64 %t1934, 0
  br i1 %t1935, label %fixfast511, label %fixslow512
fixfast511:
  %t1936 = icmp eq i64 %a0, 64
  %t1937 = select i1 %t1936, i64 257, i64 1
  br label %fixmerge513
fixslow512:
  %t1938 = call i64 @rt_num_eq(i64 %a0, i64 64)
  br label %fixmerge513
fixmerge513:
  %t1939 = phi i64 [ %t1937, %fixfast511 ], [ %t1938, %fixslow512 ]
  %t1940 = icmp ne i64 %t1939, 1
  br i1 %t1940, label %then514, label %else515
then514:
  ret i64 257
else515:
  %t1941 = or i64 %a0, 16
  %t1942 = and i64 %t1941, 7
  %t1943 = icmp eq i64 %t1942, 0
  br i1 %t1943, label %fixfast516, label %fixslow517
fixfast516:
  %t1944 = icmp eq i64 %a0, 16
  %t1945 = select i1 %t1944, i64 257, i64 1
  br label %fixmerge518
fixslow517:
  %t1946 = call i64 @rt_num_eq(i64 %a0, i64 16)
  br label %fixmerge518
fixmerge518:
  %t1947 = phi i64 [ %t1945, %fixfast516 ], [ %t1946, %fixslow517 ]
  ret i64 %t1947
}

define fastcc i64 @"scheme.base:code:number->string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1952 = icmp sge i64 %argc, 1
  br i1 %t1952, label %argok520, label %arityerr519
arityerr519:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok520:
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
  %t1963 = call i64 @rt_null_p(i64 %t1962)
  %t1964 = icmp ne i64 %t1963, 1
  br i1 %t1964, label %then521, label %else522
then521:
  br label %merge523
else522:
  %t1965 = call i64 @rt_car(i64 %t1962)
  br label %merge523
merge523:
  %t1966 = phi i64 [ 80, %then521 ], [ %t1965, %else522 ]
  %t1967 = load i64, ptr @"scheme.base:%radix-ok?"
  call void @rt_check_callable(i64 %t1967)
  %t1968 = and i64 %t1967, -8
  %t1969 = inttoptr i64 %t1968 to ptr
  %t1970 = load i64, ptr %t1969
  %t1971 = inttoptr i64 %t1970 to ptr
  %t1972 = call fastcc i64%t1971(i64 %t1967, i64 1, i64 %t1966, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1973 = icmp ne i64 %t1972, 1
  br i1 %t1973, label %then524, label %else525
then524:
  %t1974 = call i64 @rt_exact_p(i64 %a0)
  %t1975 = icmp ne i64 %t1974, 1
  br i1 %t1975, label %then526, label %else527
then526:
  %t1976 = or i64 %a0, 0
  %t1977 = and i64 %t1976, 7
  %t1978 = icmp eq i64 %t1977, 0
  br i1 %t1978, label %fixfast528, label %fixslow529
fixfast528:
  %t1979 = icmp eq i64 %a0, 0
  %t1980 = select i1 %t1979, i64 257, i64 1
  br label %fixmerge530
fixslow529:
  %t1981 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge530
fixmerge530:
  %t1982 = phi i64 [ %t1980, %fixfast528 ], [ %t1981, %fixslow529 ]
  %t1983 = icmp ne i64 %t1982, 1
  br i1 %t1983, label %then531, label %else532
then531:
  %t1984 = call i64 @rt_make_string(ptr @.str.lit.6, i64 1)
  ret i64 %t1984
else532:
  %t1985 = or i64 %a0, 0
  %t1986 = and i64 %t1985, 7
  %t1987 = icmp eq i64 %t1986, 0
  br i1 %t1987, label %fixfast533, label %fixslow534
fixfast533:
  %t1988 = icmp slt i64 %a0, 0
  %t1989 = select i1 %t1988, i64 257, i64 1
  br label %fixmerge535
fixslow534:
  %t1990 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge535
fixmerge535:
  %t1991 = phi i64 [ %t1989, %fixfast533 ], [ %t1990, %fixslow534 ]
  %t1992 = icmp ne i64 %t1991, 1
  br i1 %t1992, label %then536, label %else537
then536:
  %t1993 = load i64, ptr @"scheme.base:ns-digits-radix"
  call void @rt_check_callable(i64 %t1993)
  %t1994 = and i64 %t1993, -8
  %t1995 = inttoptr i64 %t1994 to ptr
  %t1996 = load i64, ptr %t1995
  %t1997 = inttoptr i64 %t1996 to ptr
  %t1998 = call fastcc i64%t1997(i64 %t1993, i64 3, i64 %a0, i64 %t1966, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1999 = call i64 @rt_cons(i64 11529, i64 %t1998)
  %t2000 = call i64 @rt_list_to_string(i64 %t1999)
  ret i64 %t2000
else537:
  %t2001 = or i64 0, %a0
  %t2002 = and i64 %t2001, 7
  %t2003 = icmp eq i64 %t2002, 0
  br i1 %t2003, label %fixfast538, label %fixslow539
fixfast538:
  %t2004 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %a0)
  %t2005 = extractvalue {i64, i1} %t2004, 0
  %t2006 = extractvalue {i64, i1} %t2004, 1
  br i1 %t2006, label %fixslow539, label %fixmerge540
fixslow539:
  %t2007 = call i64 @rt_sub(i64 0, i64 %a0)
  br label %fixmerge540
fixmerge540:
  %t2008 = phi i64 [ %t2005, %fixfast538 ], [ %t2007, %fixslow539 ]
  %t2009 = load i64, ptr @"scheme.base:ns-digits-radix"
  call void @rt_check_callable(i64 %t2009)
  %t2010 = and i64 %t2009, -8
  %t2011 = inttoptr i64 %t2010 to ptr
  %t2012 = load i64, ptr %t2011
  %t2013 = inttoptr i64 %t2012 to ptr
  %t2014 = call fastcc i64%t2013(i64 %t2009, i64 3, i64 %t2008, i64 %t1966, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2015 = call i64 @rt_list_to_string(i64 %t2014)
  ret i64 %t2015
else527:
  %t2016 = or i64 %t1966, 80
  %t2017 = and i64 %t2016, 7
  %t2018 = icmp eq i64 %t2017, 0
  br i1 %t2018, label %fixfast541, label %fixslow542
fixfast541:
  %t2019 = icmp eq i64 %t1966, 80
  %t2020 = select i1 %t2019, i64 257, i64 1
  br label %fixmerge543
fixslow542:
  %t2021 = call i64 @rt_num_eq(i64 %t1966, i64 80)
  br label %fixmerge543
fixmerge543:
  %t2022 = phi i64 [ %t2020, %fixfast541 ], [ %t2021, %fixslow542 ]
  %t2023 = icmp ne i64 %t2022, 1
  br i1 %t2023, label %then544, label %else545
then544:
  %t2024 = call i64 @rt_flonum_to_string(i64 %a0)
  ret i64 %t2024
else545:
  %t2025 = call i64 @rt_make_string(ptr @.str.lit.7, i64 54)
  %t2026 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t2026)
  %t2027 = and i64 %t2026, -8
  %t2028 = inttoptr i64 %t2027 to ptr
  %t2029 = load i64, ptr %t2028
  %t2030 = inttoptr i64 %t2029 to ptr
  %t2031 = musttail call fastcc i64 %t2030(i64 %t2026, i64 2, i64 %t2025, i64 %t1966, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2031
else525:
  %t2032 = call i64 @rt_make_string(ptr @.str.lit.8, i64 33)
  %t2033 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t2033)
  %t2034 = and i64 %t2033, -8
  %t2035 = inttoptr i64 %t2034 to ptr
  %t2036 = load i64, ptr %t2035
  %t2037 = inttoptr i64 %t2036 to ptr
  %t2038 = musttail call fastcc i64 %t2037(i64 %t2033, i64 2, i64 %t2032, i64 %t1966, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2038
}

define fastcc i64 @"scheme.base:code:string->number"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2043 = icmp sge i64 %argc, 1
  br i1 %t2043, label %argok547, label %arityerr546
arityerr546:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok547:
  %t2044 = call ptr @rt_alloc_words(i64 8)
  %t2045 = getelementptr i64, ptr %t2044, i64 0
  store i64 %a0, ptr %t2045
  %t2046 = getelementptr i64, ptr %t2044, i64 1
  store i64 %a1, ptr %t2046
  %t2047 = getelementptr i64, ptr %t2044, i64 2
  store i64 %a2, ptr %t2047
  %t2048 = getelementptr i64, ptr %t2044, i64 3
  store i64 %a3, ptr %t2048
  %t2049 = getelementptr i64, ptr %t2044, i64 4
  store i64 %a4, ptr %t2049
  %t2050 = getelementptr i64, ptr %t2044, i64 5
  store i64 %a5, ptr %t2050
  %t2051 = getelementptr i64, ptr %t2044, i64 6
  store i64 %a6, ptr %t2051
  %t2052 = getelementptr i64, ptr %t2044, i64 7
  store i64 %a7, ptr %t2052
  %t2053 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2044, ptr %overflow)
  %t2054 = call i64 @rt_null_p(i64 %t2053)
  %t2055 = icmp ne i64 %t2054, 1
  br i1 %t2055, label %then548, label %else549
then548:
  br label %merge550
else549:
  %t2056 = call i64 @rt_car(i64 %t2053)
  br label %merge550
merge550:
  %t2057 = phi i64 [ 80, %then548 ], [ %t2056, %else549 ]
  %t2058 = load i64, ptr @"scheme.base:%radix-ok?"
  call void @rt_check_callable(i64 %t2058)
  %t2059 = and i64 %t2058, -8
  %t2060 = inttoptr i64 %t2059 to ptr
  %t2061 = load i64, ptr %t2060
  %t2062 = inttoptr i64 %t2061 to ptr
  %t2063 = call fastcc i64%t2062(i64 %t2058, i64 1, i64 %t2057, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2064 = icmp ne i64 %t2063, 1
  br i1 %t2064, label %then551, label %else552
then551:
  %t2065 = load i64, ptr @"emit.internal:rd-number"
  %t2066 = call fastcc i64 @"emit.internal:code:rd-number"(i64 %t2065, i64 2, i64 %a0, i64 %t2057, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2067 = call i64 @rt_symbol_p(i64 %t2066)
  %t2068 = icmp ne i64 %t2067, 1
  br i1 %t2068, label %then553, label %else554
then553:
  ret i64 1
else554:
  ret i64 %t2066
else552:
  %t2069 = call i64 @rt_make_string(ptr @.str.lit.9, i64 33)
  %t2070 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t2070)
  %t2071 = and i64 %t2070, -8
  %t2072 = inttoptr i64 %t2071 to ptr
  %t2073 = load i64, ptr %t2072
  %t2074 = inttoptr i64 %t2073 to ptr
  %t2075 = musttail call fastcc i64 %t2074(i64 %t2070, i64 2, i64 %t2069, i64 %t2057, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2075
}

define fastcc i64 @"scheme.base:code:error"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2080 = icmp sge i64 %argc, 1
  br i1 %t2080, label %argok556, label %arityerr555
arityerr555:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok556:
  %t2081 = call ptr @rt_alloc_words(i64 8)
  %t2082 = getelementptr i64, ptr %t2081, i64 0
  store i64 %a0, ptr %t2082
  %t2083 = getelementptr i64, ptr %t2081, i64 1
  store i64 %a1, ptr %t2083
  %t2084 = getelementptr i64, ptr %t2081, i64 2
  store i64 %a2, ptr %t2084
  %t2085 = getelementptr i64, ptr %t2081, i64 3
  store i64 %a3, ptr %t2085
  %t2086 = getelementptr i64, ptr %t2081, i64 4
  store i64 %a4, ptr %t2086
  %t2087 = getelementptr i64, ptr %t2081, i64 5
  store i64 %a5, ptr %t2087
  %t2088 = getelementptr i64, ptr %t2081, i64 6
  store i64 %a6, ptr %t2088
  %t2089 = getelementptr i64, ptr %t2081, i64 7
  store i64 %a7, ptr %t2089
  %t2090 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2081, ptr %overflow)
  %t2091 = call i64 @rt_string_p(i64 %a0)
  %t2092 = icmp ne i64 %t2091, 1
  br i1 %t2092, label %then557, label %else558
then557:
  %t2093 = call i64 @rt_make_error_object(i64 %a0, i64 %t2090)
  %t2094 = load i64, ptr @"scheme.base:raise"
  call void @rt_check_callable(i64 %t2094)
  %t2095 = and i64 %t2094, -8
  %t2096 = inttoptr i64 %t2095 to ptr
  %t2097 = load i64, ptr %t2096
  %t2098 = inttoptr i64 %t2097 to ptr
  %t2099 = musttail call fastcc i64 %t2098(i64 %t2094, i64 1, i64 %t2093, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2099
else558:
  %t2100 = call i64 @rt_symbol_to_string(i64 %a0)
  %t2101 = call i64 @rt_make_string(ptr @.str.lit.10, i64 2)
  %t2102 = call i64 @rt_car(i64 %t2090)
  %t2103 = call i64 @rt_string_append(i64 %t2101, i64 %t2102)
  %t2104 = call i64 @rt_string_append(i64 %t2100, i64 %t2103)
  %t2105 = call i64 @rt_cdr(i64 %t2090)
  %t2106 = call i64 @rt_make_error_object(i64 %t2104, i64 %t2105)
  %t2107 = load i64, ptr @"scheme.base:raise"
  call void @rt_check_callable(i64 %t2107)
  %t2108 = and i64 %t2107, -8
  %t2109 = inttoptr i64 %t2108 to ptr
  %t2110 = load i64, ptr %t2109
  %t2111 = inttoptr i64 %t2110 to ptr
  %t2112 = musttail call fastcc i64 %t2111(i64 %t2107, i64 1, i64 %t2106, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2112
}

define fastcc i64 @"scheme.base:code:%unwind-to"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2119 = icmp eq i64 %argc, 1
  br i1 %t2119, label %argok560, label %arityerr559
arityerr559:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok560:
  %t2120 = load i64, ptr @"scheme.base:*winds*"
  %t2121 = call i64 @rt_eq_p(i64 %t2120, i64 %a0)
  %t2122 = icmp ne i64 %t2121, 1
  br i1 %t2122, label %then561, label %else562
then561:
  ret i64 257
else562:
  %t2123 = load i64, ptr @"scheme.base:*winds*"
  %t2124 = call i64 @rt_null_p(i64 %t2123)
  %t2125 = icmp ne i64 %t2124, 1
  br i1 %t2125, label %then563, label %else564
then563:
  ret i64 257
else564:
  %t2126 = load i64, ptr @"scheme.base:*winds*"
  %t2127 = call i64 @rt_car(i64 %t2126)
  %t2128 = load i64, ptr @"scheme.base:*winds*"
  %t2129 = call i64 @rt_cdr(i64 %t2128)
  %t2130 = call i64 @rt_root(i64 %t2129)
  store i64 %t2130, ptr @"scheme.base:*winds*"
  %t2131 = call i64 @rt_cdr(i64 %t2127)
  call void @rt_check_callable(i64 %t2131)
  %t2132 = and i64 %t2131, -8
  %t2133 = inttoptr i64 %t2132 to ptr
  %t2134 = load i64, ptr %t2133
  %t2135 = inttoptr i64 %t2134 to ptr
  %t2136 = call fastcc i64%t2135(i64 %t2131, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2137 = load i64, ptr @"scheme.base:%unwind-to"
  call void @rt_check_callable(i64 %t2137)
  %t2138 = and i64 %t2137, -8
  %t2139 = inttoptr i64 %t2138 to ptr
  %t2140 = load i64, ptr %t2139
  %t2141 = inttoptr i64 %t2140 to ptr
  %t2142 = musttail call fastcc i64 %t2141(i64 %t2137, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2142
}

define fastcc i64 @"scheme.base:code:dynamic-wind"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2147 = icmp eq i64 %argc, 3
  br i1 %t2147, label %argok566, label %arityerr565
arityerr565:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok566:
  call void @rt_check_callable(i64 %a0)
  %t2148 = and i64 %a0, -8
  %t2149 = inttoptr i64 %t2148 to ptr
  %t2150 = load i64, ptr %t2149
  %t2151 = inttoptr i64 %t2150 to ptr
  %t2152 = call fastcc i64%t2151(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2153 = call i64 @rt_cons(i64 %a0, i64 %a2)
  %t2154 = load i64, ptr @"scheme.base:*winds*"
  %t2155 = call i64 @rt_cons(i64 %t2153, i64 %t2154)
  %t2156 = call i64 @rt_root(i64 %t2155)
  store i64 %t2156, ptr @"scheme.base:*winds*"
  call void @rt_check_callable(i64 %a1)
  %t2157 = and i64 %a1, -8
  %t2158 = inttoptr i64 %t2157 to ptr
  %t2159 = load i64, ptr %t2158
  %t2160 = inttoptr i64 %t2159 to ptr
  %t2161 = call fastcc i64%t2160(i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2162 = load i64, ptr @"scheme.base:*winds*"
  %t2163 = call i64 @rt_cdr(i64 %t2162)
  %t2164 = call i64 @rt_root(i64 %t2163)
  store i64 %t2164, ptr @"scheme.base:*winds*"
  call void @rt_check_callable(i64 %a2)
  %t2165 = and i64 %a2, -8
  %t2166 = inttoptr i64 %t2165 to ptr
  %t2167 = load i64, ptr %t2166
  %t2168 = inttoptr i64 %t2167 to ptr
  %t2169 = call fastcc i64%t2168(i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2161
}

define fastcc i64 @"scheme.base:code_474"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2174 = icmp eq i64 %argc, 1
  br i1 %t2174, label %argok568, label %arityerr567
arityerr567:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok568:
  %t2175 = and i64 %self, -8
  %t2176 = inttoptr i64 %t2175 to ptr
  %t2177 = getelementptr i64, ptr %t2176, i64 1
  %t2178 = load i64, ptr %t2177
  %t2179 = call i64 @rt_escape_live_p(i64 %t2178)
  %t2180 = icmp ne i64 %t2179, 1
  br i1 %t2180, label %then569, label %else570
then569:
  %t2181 = and i64 %self, -8
  %t2182 = inttoptr i64 %t2181 to ptr
  %t2183 = getelementptr i64, ptr %t2182, i64 2
  %t2184 = load i64, ptr %t2183
  %t2185 = load i64, ptr @"scheme.base:%unwind-to"
  call void @rt_check_callable(i64 %t2185)
  %t2186 = and i64 %t2185, -8
  %t2187 = inttoptr i64 %t2186 to ptr
  %t2188 = load i64, ptr %t2187
  %t2189 = inttoptr i64 %t2188 to ptr
  %t2190 = call fastcc i64%t2189(i64 %t2185, i64 1, i64 %t2184, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2191 = and i64 %self, -8
  %t2192 = inttoptr i64 %t2191 to ptr
  %t2193 = getelementptr i64, ptr %t2192, i64 1
  %t2194 = load i64, ptr %t2193
  %t2195 = call i64 @rt_escape_to(i64 %t2194, i64 %a0)
  br label %merge571
else570:
  br label %merge571
merge571:
  %t2196 = phi i64 [ %t2195, %then569 ], [ 1, %else570 ]
  %t2197 = call i64 @rt_intern(ptr @.str.sym.11)
  %t2198 = call i64 @rt_make_string(ptr @.str.lit.12, i64 39)
  %t2199 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t2199)
  %t2200 = and i64 %t2199, -8
  %t2201 = inttoptr i64 %t2200 to ptr
  %t2202 = load i64, ptr %t2201
  %t2203 = inttoptr i64 %t2202 to ptr
  %t2204 = musttail call fastcc i64 %t2203(i64 %t2199, i64 2, i64 %t2197, i64 %t2198, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2204
}

define fastcc i64 @"scheme.base:code_472"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2205 = icmp eq i64 %argc, 0
  br i1 %t2205, label %argok573, label %arityerr572
arityerr572:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok573:
  %t2206 = call i64 @rt_escape_frame()
  %t2207 = and i64 %self, -8
  %t2208 = inttoptr i64 %t2207 to ptr
  %t2209 = getelementptr i64, ptr %t2208, i64 2
  %t2210 = load i64, ptr %t2209
  %t2211 = call ptr @rt_alloc_words(i64 3)
  %t2212 = ptrtoint ptr %t2211 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_474" to i64), ptr %t2211
  %t2213 = getelementptr i64, ptr %t2211, i64 1
  store i64 %t2206, ptr %t2213
  %t2214 = getelementptr i64, ptr %t2211, i64 2
  store i64 %t2210, ptr %t2214
  %t2215 = or i64 %t2212, 4
  %t2216 = and i64 %self, -8
  %t2217 = inttoptr i64 %t2216 to ptr
  %t2218 = getelementptr i64, ptr %t2217, i64 1
  %t2219 = load i64, ptr %t2218
  call void @rt_check_callable(i64 %t2219)
  %t2220 = and i64 %t2219, -8
  %t2221 = inttoptr i64 %t2220 to ptr
  %t2222 = load i64, ptr %t2221
  %t2223 = inttoptr i64 %t2222 to ptr
  %t2224 = musttail call fastcc i64 %t2223(i64 %t2219, i64 1, i64 %t2215, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2224
}

define fastcc i64 @"scheme.base:code:call-with-current-continuation"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2225 = icmp eq i64 %argc, 1
  br i1 %t2225, label %argok575, label %arityerr574
arityerr574:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok575:
  %t2226 = load i64, ptr @"scheme.base:*winds*"
  %t2227 = call ptr @rt_alloc_words(i64 3)
  %t2228 = ptrtoint ptr %t2227 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_472" to i64), ptr %t2227
  %t2229 = getelementptr i64, ptr %t2227, i64 1
  store i64 %a0, ptr %t2229
  %t2230 = getelementptr i64, ptr %t2227, i64 2
  store i64 %t2226, ptr %t2230
  %t2231 = or i64 %t2228, 4
  %t2232 = call i64 @rt_run_guarded(ptr @__apply0, i64 %t2231)
  %t2233 = call i64 @rt_cdr(i64 %t2232)
  ret i64 %t2233
}

define fastcc i64 @"scheme.base:code:call/cc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2238 = icmp eq i64 %argc, 1
  br i1 %t2238, label %argok577, label %arityerr576
arityerr576:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok577:
  %t2239 = load i64, ptr @"scheme.base:call-with-current-continuation"
  call void @rt_check_callable(i64 %t2239)
  %t2240 = and i64 %t2239, -8
  %t2241 = inttoptr i64 %t2240 to ptr
  %t2242 = load i64, ptr %t2241
  %t2243 = inttoptr i64 %t2242 to ptr
  %t2244 = musttail call fastcc i64 %t2243(i64 %t2239, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2244
}

define fastcc i64 @"scheme.base:code_482"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2249 = icmp eq i64 %argc, 0
  br i1 %t2249, label %argok579, label %arityerr578
arityerr578:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok579:
  %t2250 = and i64 %self, -8
  %t2251 = inttoptr i64 %t2250 to ptr
  %t2252 = getelementptr i64, ptr %t2251, i64 1
  %t2253 = load i64, ptr %t2252
  %t2254 = and i64 %self, -8
  %t2255 = inttoptr i64 %t2254 to ptr
  %t2256 = getelementptr i64, ptr %t2255, i64 2
  %t2257 = load i64, ptr %t2256
  %t2258 = call i64 @rt_cons(i64 %t2253, i64 %t2257)
  %t2259 = call i64 @rt_root(i64 %t2258)
  store i64 %t2259, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code_484"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2260 = icmp eq i64 %argc, 0
  br i1 %t2260, label %argok581, label %arityerr580
arityerr580:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok581:
  %t2261 = and i64 %self, -8
  %t2262 = inttoptr i64 %t2261 to ptr
  %t2263 = getelementptr i64, ptr %t2262, i64 1
  %t2264 = load i64, ptr %t2263
  %t2265 = call i64 @rt_root(i64 %t2264)
  store i64 %t2265, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code:with-exception-handler"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2266 = icmp eq i64 %argc, 2
  br i1 %t2266, label %argok583, label %arityerr582
arityerr582:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok583:
  %t2267 = load i64, ptr @"scheme.base:*handlers*"
  %t2268 = call ptr @rt_alloc_words(i64 3)
  %t2269 = ptrtoint ptr %t2268 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_482" to i64), ptr %t2268
  %t2270 = getelementptr i64, ptr %t2268, i64 1
  store i64 %a0, ptr %t2270
  %t2271 = getelementptr i64, ptr %t2268, i64 2
  store i64 %t2267, ptr %t2271
  %t2272 = or i64 %t2269, 4
  %t2273 = call ptr @rt_alloc_words(i64 2)
  %t2274 = ptrtoint ptr %t2273 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_484" to i64), ptr %t2273
  %t2275 = getelementptr i64, ptr %t2273, i64 1
  store i64 %t2267, ptr %t2275
  %t2276 = or i64 %t2274, 4
  %t2277 = load i64, ptr @"scheme.base:dynamic-wind"
  call void @rt_check_callable(i64 %t2277)
  %t2278 = and i64 %t2277, -8
  %t2279 = inttoptr i64 %t2278 to ptr
  %t2280 = load i64, ptr %t2279
  %t2281 = inttoptr i64 %t2280 to ptr
  %t2282 = musttail call fastcc i64 %t2281(i64 %t2277, i64 3, i64 %t2272, i64 %a1, i64 %t2276, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2282
}

define fastcc i64 @"scheme.base:code:raise"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2287 = icmp eq i64 %argc, 1
  br i1 %t2287, label %argok585, label %arityerr584
arityerr584:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok585:
  %t2288 = load i64, ptr @"scheme.base:*handlers*"
  %t2289 = call i64 @rt_null_p(i64 %t2288)
  %t2290 = icmp ne i64 %t2289, 1
  br i1 %t2290, label %then586, label %else587
then586:
  %t2291 = call i64 @rt_raise(i64 %a0)
  ret i64 %t2291
else587:
  %t2292 = load i64, ptr @"scheme.base:*handlers*"
  %t2293 = call i64 @rt_car(i64 %t2292)
  %t2294 = load i64, ptr @"scheme.base:*handlers*"
  %t2295 = load i64, ptr @"scheme.base:*handlers*"
  %t2296 = call i64 @rt_cdr(i64 %t2295)
  %t2297 = call i64 @rt_root(i64 %t2296)
  store i64 %t2297, ptr @"scheme.base:*handlers*"
  call void @rt_check_callable(i64 %t2293)
  %t2298 = and i64 %t2293, -8
  %t2299 = inttoptr i64 %t2298 to ptr
  %t2300 = load i64, ptr %t2299
  %t2301 = inttoptr i64 %t2300 to ptr
  %t2302 = call fastcc i64%t2301(i64 %t2293, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2303 = call i64 @rt_root(i64 %t2294)
  store i64 %t2303, ptr @"scheme.base:*handlers*"
  %t2304 = call i64 @rt_raise(i64 %a0)
  ret i64 %t2304
}

define fastcc i64 @"scheme.base:code:error-object?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2309 = icmp eq i64 %argc, 1
  br i1 %t2309, label %argok589, label %arityerr588
arityerr588:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok589:
  %t2310 = call i64 @rt_error_object_p(i64 %a0)
  ret i64 %t2310
}

define fastcc i64 @"scheme.base:code:error-object-message"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2315 = icmp eq i64 %argc, 1
  br i1 %t2315, label %argok591, label %arityerr590
arityerr590:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok591:
  %t2316 = call i64 @rt_error_object_message(i64 %a0)
  ret i64 %t2316
}

define fastcc i64 @"scheme.base:code:error-object-irritants"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2321 = icmp eq i64 %argc, 1
  br i1 %t2321, label %argok593, label %arityerr592
arityerr592:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok593:
  %t2322 = call i64 @rt_error_object_irritants(i64 %a0)
  ret i64 %t2322
}

define fastcc i64 @"scheme.base:code_504"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2327 = icmp eq i64 %argc, 1
  br i1 %t2327, label %argok595, label %arityerr594
arityerr594:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok595:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_506"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2328 = icmp eq i64 %argc, 1
  br i1 %t2328, label %argok597, label %arityerr596
arityerr596:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok597:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_508"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2329 = icmp sge i64 %argc, 0
  br i1 %t2329, label %argok599, label %arityerr598
arityerr598:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok599:
  %t2330 = call ptr @rt_alloc_words(i64 8)
  %t2331 = getelementptr i64, ptr %t2330, i64 0
  store i64 %a0, ptr %t2331
  %t2332 = getelementptr i64, ptr %t2330, i64 1
  store i64 %a1, ptr %t2332
  %t2333 = getelementptr i64, ptr %t2330, i64 2
  store i64 %a2, ptr %t2333
  %t2334 = getelementptr i64, ptr %t2330, i64 3
  store i64 %a3, ptr %t2334
  %t2335 = getelementptr i64, ptr %t2330, i64 4
  store i64 %a4, ptr %t2335
  %t2336 = getelementptr i64, ptr %t2330, i64 5
  store i64 %a5, ptr %t2336
  %t2337 = getelementptr i64, ptr %t2330, i64 6
  store i64 %a6, ptr %t2337
  %t2338 = getelementptr i64, ptr %t2330, i64 7
  store i64 %a7, ptr %t2338
  %t2339 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2330, ptr %overflow)
  %t2340 = call i64 @rt_null_p(i64 %t2339)
  %t2341 = icmp ne i64 %t2340, 1
  br i1 %t2341, label %then600, label %else601
then600:
  %t2342 = and i64 %self, -8
  %t2343 = inttoptr i64 %t2342 to ptr
  %t2344 = getelementptr i64, ptr %t2343, i64 1
  %t2345 = load i64, ptr %t2344
  %t2346 = call i64 @rt_vector_ref(i64 %t2345, i64 0)
  ret i64 %t2346
else601:
  %t2347 = call i64 @rt_cdr(i64 %t2339)
  %t2348 = call i64 @rt_null_p(i64 %t2347)
  %t2349 = icmp ne i64 %t2348, 1
  br i1 %t2349, label %then602, label %else603
then602:
  %t2350 = and i64 %self, -8
  %t2351 = inttoptr i64 %t2350 to ptr
  %t2352 = getelementptr i64, ptr %t2351, i64 1
  %t2353 = load i64, ptr %t2352
  %t2354 = call i64 @rt_car(i64 %t2339)
  %t2355 = and i64 %self, -8
  %t2356 = inttoptr i64 %t2355 to ptr
  %t2357 = getelementptr i64, ptr %t2356, i64 2
  %t2358 = load i64, ptr %t2357
  call void @rt_check_callable(i64 %t2358)
  %t2359 = and i64 %t2358, -8
  %t2360 = inttoptr i64 %t2359 to ptr
  %t2361 = load i64, ptr %t2360
  %t2362 = inttoptr i64 %t2361 to ptr
  %t2363 = call fastcc i64%t2362(i64 %t2358, i64 1, i64 %t2354, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2364 = call i64 @rt_vector_set(i64 %t2353, i64 0, i64 %t2363)
  ret i64 %t2364
else603:
  %t2365 = and i64 %self, -8
  %t2366 = inttoptr i64 %t2365 to ptr
  %t2367 = getelementptr i64, ptr %t2366, i64 1
  %t2368 = load i64, ptr %t2367
  %t2369 = call i64 @rt_car(i64 %t2339)
  %t2370 = call i64 @rt_vector_set(i64 %t2368, i64 0, i64 %t2369)
  ret i64 %t2370
}

define fastcc i64 @"scheme.base:code:make-parameter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2371 = icmp sge i64 %argc, 1
  br i1 %t2371, label %argok605, label %arityerr604
arityerr604:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok605:
  %t2372 = call ptr @rt_alloc_words(i64 8)
  %t2373 = getelementptr i64, ptr %t2372, i64 0
  store i64 %a0, ptr %t2373
  %t2374 = getelementptr i64, ptr %t2372, i64 1
  store i64 %a1, ptr %t2374
  %t2375 = getelementptr i64, ptr %t2372, i64 2
  store i64 %a2, ptr %t2375
  %t2376 = getelementptr i64, ptr %t2372, i64 3
  store i64 %a3, ptr %t2376
  %t2377 = getelementptr i64, ptr %t2372, i64 4
  store i64 %a4, ptr %t2377
  %t2378 = getelementptr i64, ptr %t2372, i64 5
  store i64 %a5, ptr %t2378
  %t2379 = getelementptr i64, ptr %t2372, i64 6
  store i64 %a6, ptr %t2379
  %t2380 = getelementptr i64, ptr %t2372, i64 7
  store i64 %a7, ptr %t2380
  %t2381 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2372, ptr %overflow)
  %t2382 = call i64 @rt_null_p(i64 %t2381)
  %t2383 = icmp ne i64 %t2382, 1
  br i1 %t2383, label %then606, label %else607
then606:
  %t2384 = call ptr @rt_alloc_words(i64 1)
  %t2385 = ptrtoint ptr %t2384 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_504" to i64), ptr %t2384
  %t2386 = or i64 %t2385, 4
  br label %merge608
else607:
  %t2387 = call i64 @rt_car(i64 %t2381)
  br label %merge608
merge608:
  %t2388 = phi i64 [ %t2386, %then606 ], [ %t2387, %else607 ]
  %t2389 = call i64 @rt_make_vector(i64 8, i64 0)
  %t2390 = call i64 @rt_null_p(i64 %t2381)
  %t2391 = icmp ne i64 %t2390, 1
  br i1 %t2391, label %then609, label %else610
then609:
  %t2392 = call ptr @rt_alloc_words(i64 1)
  %t2393 = ptrtoint ptr %t2392 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_506" to i64), ptr %t2392
  %t2394 = or i64 %t2393, 4
  br label %merge611
else610:
  %t2395 = call i64 @rt_car(i64 %t2381)
  br label %merge611
merge611:
  %t2396 = phi i64 [ %t2394, %then609 ], [ %t2395, %else610 ]
  call void @rt_check_callable(i64 %t2396)
  %t2397 = and i64 %t2396, -8
  %t2398 = inttoptr i64 %t2397 to ptr
  %t2399 = load i64, ptr %t2398
  %t2400 = inttoptr i64 %t2399 to ptr
  %t2401 = call fastcc i64%t2400(i64 %t2396, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2402 = call i64 @rt_vector_set(i64 %t2389, i64 0, i64 %t2401)
  %t2403 = call ptr @rt_alloc_words(i64 3)
  %t2404 = ptrtoint ptr %t2403 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_508" to i64), ptr %t2403
  %t2405 = getelementptr i64, ptr %t2403, i64 1
  store i64 %t2389, ptr %t2405
  %t2406 = getelementptr i64, ptr %t2403, i64 2
  store i64 %t2388, ptr %t2406
  %t2407 = or i64 %t2404, 4
  ret i64 %t2407
}

define fastcc i64 @"scheme.base:code_520"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2412 = icmp eq i64 %argc, 1
  br i1 %t2412, label %argok613, label %arityerr612
arityerr612:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok613:
  call void @rt_check_callable(i64 %a0)
  %t2413 = and i64 %a0, -8
  %t2414 = inttoptr i64 %t2413 to ptr
  %t2415 = load i64, ptr %t2414
  %t2416 = inttoptr i64 %t2415 to ptr
  %t2417 = musttail call fastcc i64 %t2416(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2417
}

define fastcc i64 @"scheme.base:code_524"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2418 = icmp eq i64 %argc, 2
  br i1 %t2418, label %argok615, label %arityerr614
arityerr614:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok615:
  call void @rt_check_callable(i64 %a0)
  %t2419 = and i64 %a0, -8
  %t2420 = inttoptr i64 %t2419 to ptr
  %t2421 = load i64, ptr %t2420
  %t2422 = inttoptr i64 %t2421 to ptr
  %t2423 = musttail call fastcc i64 %t2422(i64 %a0, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2423
}

define fastcc i64 @"scheme.base:code_522"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2424 = icmp eq i64 %argc, 0
  br i1 %t2424, label %argok617, label %arityerr616
arityerr616:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok617:
  %t2425 = call ptr @rt_alloc_words(i64 1)
  %t2426 = ptrtoint ptr %t2425 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_524" to i64), ptr %t2425
  %t2427 = or i64 %t2426, 4
  %t2428 = and i64 %self, -8
  %t2429 = inttoptr i64 %t2428 to ptr
  %t2430 = getelementptr i64, ptr %t2429, i64 1
  %t2431 = load i64, ptr %t2430
  %t2432 = and i64 %self, -8
  %t2433 = inttoptr i64 %t2432 to ptr
  %t2434 = getelementptr i64, ptr %t2433, i64 2
  %t2435 = load i64, ptr %t2434
  %t2436 = load i64, ptr @"scheme.base:for-each"
  call void @rt_check_callable(i64 %t2436)
  %t2437 = and i64 %t2436, -8
  %t2438 = inttoptr i64 %t2437 to ptr
  %t2439 = load i64, ptr %t2438
  %t2440 = inttoptr i64 %t2439 to ptr
  %t2441 = musttail call fastcc i64 %t2440(i64 %t2436, i64 3, i64 %t2427, i64 %t2431, i64 %t2435, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2441
}

define fastcc i64 @"scheme.base:code_528"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2442 = icmp eq i64 %argc, 2
  br i1 %t2442, label %argok619, label %arityerr618
arityerr618:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok619:
  call void @rt_check_callable(i64 %a0)
  %t2443 = and i64 %a0, -8
  %t2444 = inttoptr i64 %t2443 to ptr
  %t2445 = load i64, ptr %t2444
  %t2446 = inttoptr i64 %t2445 to ptr
  %t2447 = musttail call fastcc i64 %t2446(i64 %a0, i64 2, i64 %a1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2447
}

define fastcc i64 @"scheme.base:code_526"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2448 = icmp eq i64 %argc, 0
  br i1 %t2448, label %argok621, label %arityerr620
arityerr620:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok621:
  %t2449 = call ptr @rt_alloc_words(i64 1)
  %t2450 = ptrtoint ptr %t2449 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_528" to i64), ptr %t2449
  %t2451 = or i64 %t2450, 4
  %t2452 = and i64 %self, -8
  %t2453 = inttoptr i64 %t2452 to ptr
  %t2454 = getelementptr i64, ptr %t2453, i64 1
  %t2455 = load i64, ptr %t2454
  %t2456 = and i64 %self, -8
  %t2457 = inttoptr i64 %t2456 to ptr
  %t2458 = getelementptr i64, ptr %t2457, i64 2
  %t2459 = load i64, ptr %t2458
  %t2460 = load i64, ptr @"scheme.base:for-each"
  call void @rt_check_callable(i64 %t2460)
  %t2461 = and i64 %t2460, -8
  %t2462 = inttoptr i64 %t2461 to ptr
  %t2463 = load i64, ptr %t2462
  %t2464 = inttoptr i64 %t2463 to ptr
  %t2465 = musttail call fastcc i64 %t2464(i64 %t2460, i64 3, i64 %t2451, i64 %t2455, i64 %t2459, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2465
}

define fastcc i64 @"scheme.base:code:with-parameters"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2466 = icmp eq i64 %argc, 3
  br i1 %t2466, label %argok623, label %arityerr622
arityerr622:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok623:
  %t2467 = call ptr @rt_alloc_words(i64 1)
  %t2468 = ptrtoint ptr %t2467 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_520" to i64), ptr %t2467
  %t2469 = or i64 %t2468, 4
  %t2470 = load i64, ptr @"scheme.base:map"
  call void @rt_check_callable(i64 %t2470)
  %t2471 = and i64 %t2470, -8
  %t2472 = inttoptr i64 %t2471 to ptr
  %t2473 = load i64, ptr %t2472
  %t2474 = inttoptr i64 %t2473 to ptr
  %t2475 = call fastcc i64%t2474(i64 %t2470, i64 2, i64 %t2469, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2476 = call ptr @rt_alloc_words(i64 3)
  %t2477 = ptrtoint ptr %t2476 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_522" to i64), ptr %t2476
  %t2478 = getelementptr i64, ptr %t2476, i64 1
  store i64 %a0, ptr %t2478
  %t2479 = getelementptr i64, ptr %t2476, i64 2
  store i64 %a1, ptr %t2479
  %t2480 = or i64 %t2477, 4
  %t2481 = call ptr @rt_alloc_words(i64 3)
  %t2482 = ptrtoint ptr %t2481 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_526" to i64), ptr %t2481
  %t2483 = getelementptr i64, ptr %t2481, i64 1
  store i64 %a0, ptr %t2483
  %t2484 = getelementptr i64, ptr %t2481, i64 2
  store i64 %t2475, ptr %t2484
  %t2485 = or i64 %t2482, 4
  %t2486 = load i64, ptr @"scheme.base:dynamic-wind"
  call void @rt_check_callable(i64 %t2486)
  %t2487 = and i64 %t2486, -8
  %t2488 = inttoptr i64 %t2487 to ptr
  %t2489 = load i64, ptr %t2488
  %t2490 = inttoptr i64 %t2489 to ptr
  %t2491 = musttail call fastcc i64 %t2490(i64 %t2486, i64 3, i64 %t2480, i64 %a2, i64 %t2485, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2491
}

define fastcc i64 @"scheme.base:code_536"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2496 = icmp eq i64 %argc, 2
  br i1 %t2496, label %argok625, label %arityerr624
arityerr624:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok625:
  %t2497 = call i64 @rt_null_p(i64 %a0)
  %t2498 = icmp ne i64 %t2497, 1
  br i1 %t2498, label %then626, label %else627
then626:
  %t2499 = and i64 %self, -8
  %t2500 = inttoptr i64 %t2499 to ptr
  %t2501 = getelementptr i64, ptr %t2500, i64 1
  %t2502 = load i64, ptr %t2501
  ret i64 %t2502
else627:
  %t2503 = and i64 %self, -8
  %t2504 = inttoptr i64 %t2503 to ptr
  %t2505 = getelementptr i64, ptr %t2504, i64 1
  %t2506 = load i64, ptr %t2505
  %t2507 = call i64 @rt_car(i64 %a0)
  %t2508 = call i64 @rt_vector_set(i64 %t2506, i64 %a1, i64 %t2507)
  %t2509 = call i64 @rt_cdr(i64 %a0)
  %t2510 = or i64 %a1, 8
  %t2511 = and i64 %t2510, 7
  %t2512 = icmp eq i64 %t2511, 0
  br i1 %t2512, label %fixfast628, label %fixslow629
fixfast628:
  %t2513 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t2514 = extractvalue {i64, i1} %t2513, 0
  %t2515 = extractvalue {i64, i1} %t2513, 1
  br i1 %t2515, label %fixslow629, label %fixmerge630
fixslow629:
  %t2516 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge630
fixmerge630:
  %t2517 = phi i64 [ %t2514, %fixfast628 ], [ %t2516, %fixslow629 ]
  %t2518 = musttail call fastcc i64 @"scheme.base:code_536"(i64 %self, i64 2, i64 %t2509, i64 %t2517, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2518
}

define fastcc i64 @"scheme.base:code:list->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2519 = icmp eq i64 %argc, 1
  br i1 %t2519, label %argok632, label %arityerr631
arityerr631:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok632:
  %t2520 = load i64, ptr @"scheme.base:length"
  call void @rt_check_callable(i64 %t2520)
  %t2521 = and i64 %t2520, -8
  %t2522 = inttoptr i64 %t2521 to ptr
  %t2523 = load i64, ptr %t2522
  %t2524 = inttoptr i64 %t2523 to ptr
  %t2525 = call fastcc i64%t2524(i64 %t2520, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2526 = call i64 @rt_make_vector(i64 %t2525, i64 0)
  %t2527 = call ptr @rt_alloc_words(i64 3)
  %t2528 = ptrtoint ptr %t2527 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_536" to i64), ptr %t2527
  %t2529 = or i64 %t2528, 4
  %t2530 = getelementptr i64, ptr %t2527, i64 1
  store i64 %t2526, ptr %t2530
  %t2531 = getelementptr i64, ptr %t2527, i64 2
  store i64 %t2529, ptr %t2531
  %t2532 = musttail call fastcc i64 @"scheme.base:code_536"(i64 %t2529, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2532
}

define fastcc i64 @"scheme.base:code:vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2537 = icmp sge i64 %argc, 0
  br i1 %t2537, label %argok634, label %arityerr633
arityerr633:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok634:
  %t2538 = call ptr @rt_alloc_words(i64 8)
  %t2539 = getelementptr i64, ptr %t2538, i64 0
  store i64 %a0, ptr %t2539
  %t2540 = getelementptr i64, ptr %t2538, i64 1
  store i64 %a1, ptr %t2540
  %t2541 = getelementptr i64, ptr %t2538, i64 2
  store i64 %a2, ptr %t2541
  %t2542 = getelementptr i64, ptr %t2538, i64 3
  store i64 %a3, ptr %t2542
  %t2543 = getelementptr i64, ptr %t2538, i64 4
  store i64 %a4, ptr %t2543
  %t2544 = getelementptr i64, ptr %t2538, i64 5
  store i64 %a5, ptr %t2544
  %t2545 = getelementptr i64, ptr %t2538, i64 6
  store i64 %a6, ptr %t2545
  %t2546 = getelementptr i64, ptr %t2538, i64 7
  store i64 %a7, ptr %t2546
  %t2547 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2538, ptr %overflow)
  %t2548 = load i64, ptr @"scheme.base:list->vector"
  call void @rt_check_callable(i64 %t2548)
  %t2549 = and i64 %t2548, -8
  %t2550 = inttoptr i64 %t2549 to ptr
  %t2551 = load i64, ptr %t2550
  %t2552 = inttoptr i64 %t2551 to ptr
  %t2553 = musttail call fastcc i64 %t2552(i64 %t2548, i64 1, i64 %t2547, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2553
}

define fastcc i64 @"scheme.base:code_546"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2558 = icmp eq i64 %argc, 2
  br i1 %t2558, label %argok636, label %arityerr635
arityerr635:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok636:
  %t2559 = call i64 @rt_null_p(i64 %a0)
  %t2560 = icmp ne i64 %t2559, 1
  br i1 %t2560, label %then637, label %else638
then637:
  %t2561 = and i64 %self, -8
  %t2562 = inttoptr i64 %t2561 to ptr
  %t2563 = getelementptr i64, ptr %t2562, i64 1
  %t2564 = load i64, ptr %t2563
  ret i64 %t2564
else638:
  %t2565 = and i64 %self, -8
  %t2566 = inttoptr i64 %t2565 to ptr
  %t2567 = getelementptr i64, ptr %t2566, i64 1
  %t2568 = load i64, ptr %t2567
  %t2569 = call i64 @rt_car(i64 %a0)
  %t2570 = call i64 @rt_bytevector_u8_set(i64 %t2568, i64 %a1, i64 %t2569)
  %t2571 = call i64 @rt_cdr(i64 %a0)
  %t2572 = or i64 %a1, 8
  %t2573 = and i64 %t2572, 7
  %t2574 = icmp eq i64 %t2573, 0
  br i1 %t2574, label %fixfast639, label %fixslow640
fixfast639:
  %t2575 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t2576 = extractvalue {i64, i1} %t2575, 0
  %t2577 = extractvalue {i64, i1} %t2575, 1
  br i1 %t2577, label %fixslow640, label %fixmerge641
fixslow640:
  %t2578 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge641
fixmerge641:
  %t2579 = phi i64 [ %t2576, %fixfast639 ], [ %t2578, %fixslow640 ]
  %t2580 = musttail call fastcc i64 @"scheme.base:code_546"(i64 %self, i64 2, i64 %t2571, i64 %t2579, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2580
}

define fastcc i64 @"scheme.base:code:list->bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2581 = icmp eq i64 %argc, 1
  br i1 %t2581, label %argok643, label %arityerr642
arityerr642:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok643:
  %t2582 = load i64, ptr @"scheme.base:length"
  call void @rt_check_callable(i64 %t2582)
  %t2583 = and i64 %t2582, -8
  %t2584 = inttoptr i64 %t2583 to ptr
  %t2585 = load i64, ptr %t2584
  %t2586 = inttoptr i64 %t2585 to ptr
  %t2587 = call fastcc i64%t2586(i64 %t2582, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2588 = call i64 @rt_make_bytevector(i64 %t2587, i64 0)
  %t2589 = call ptr @rt_alloc_words(i64 3)
  %t2590 = ptrtoint ptr %t2589 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_546" to i64), ptr %t2589
  %t2591 = or i64 %t2590, 4
  %t2592 = getelementptr i64, ptr %t2589, i64 1
  store i64 %t2588, ptr %t2592
  %t2593 = getelementptr i64, ptr %t2589, i64 2
  store i64 %t2591, ptr %t2593
  %t2594 = musttail call fastcc i64 @"scheme.base:code_546"(i64 %t2591, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2594
}

define fastcc i64 @"scheme.base:code:bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2599 = icmp sge i64 %argc, 0
  br i1 %t2599, label %argok645, label %arityerr644
arityerr644:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok645:
  %t2600 = call ptr @rt_alloc_words(i64 8)
  %t2601 = getelementptr i64, ptr %t2600, i64 0
  store i64 %a0, ptr %t2601
  %t2602 = getelementptr i64, ptr %t2600, i64 1
  store i64 %a1, ptr %t2602
  %t2603 = getelementptr i64, ptr %t2600, i64 2
  store i64 %a2, ptr %t2603
  %t2604 = getelementptr i64, ptr %t2600, i64 3
  store i64 %a3, ptr %t2604
  %t2605 = getelementptr i64, ptr %t2600, i64 4
  store i64 %a4, ptr %t2605
  %t2606 = getelementptr i64, ptr %t2600, i64 5
  store i64 %a5, ptr %t2606
  %t2607 = getelementptr i64, ptr %t2600, i64 6
  store i64 %a6, ptr %t2607
  %t2608 = getelementptr i64, ptr %t2600, i64 7
  store i64 %a7, ptr %t2608
  %t2609 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2600, ptr %overflow)
  %t2610 = load i64, ptr @"scheme.base:list->bytevector"
  call void @rt_check_callable(i64 %t2610)
  %t2611 = and i64 %t2610, -8
  %t2612 = inttoptr i64 %t2611 to ptr
  %t2613 = load i64, ptr %t2612
  %t2614 = inttoptr i64 %t2613 to ptr
  %t2615 = musttail call fastcc i64 %t2614(i64 %t2610, i64 1, i64 %t2609, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2615
}

define fastcc i64 @"scheme.base:code:rng-start"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2620 = icmp eq i64 %argc, 1
  br i1 %t2620, label %argok647, label %arityerr646
arityerr646:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok647:
  %t2621 = call i64 @rt_pair_p(i64 %a0)
  %t2622 = icmp ne i64 %t2621, 1
  br i1 %t2622, label %then648, label %else649
then648:
  %t2623 = call i64 @rt_car(i64 %a0)
  ret i64 %t2623
else649:
  ret i64 0
}

define fastcc i64 @"scheme.base:code:rng-end"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2628 = icmp eq i64 %argc, 2
  br i1 %t2628, label %argok651, label %arityerr650
arityerr650:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok651:
  %t2629 = call i64 @rt_pair_p(i64 %a0)
  %t2630 = icmp ne i64 %t2629, 1
  br i1 %t2630, label %then652, label %else653
then652:
  %t2631 = call i64 @rt_cdr(i64 %a0)
  %t2632 = call i64 @rt_pair_p(i64 %t2631)
  br label %merge654
else653:
  br label %merge654
merge654:
  %t2633 = phi i64 [ %t2632, %then652 ], [ 1, %else653 ]
  %t2634 = icmp ne i64 %t2633, 1
  br i1 %t2634, label %then655, label %else656
then655:
  %t2635 = call i64 @rt_cdr(i64 %a0)
  %t2636 = call i64 @rt_car(i64 %t2635)
  ret i64 %t2636
else656:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:rng-check"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2641 = icmp eq i64 %argc, 4
  br i1 %t2641, label %argok658, label %arityerr657
arityerr657:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok658:
  %t2642 = or i64 0, %a1
  %t2643 = and i64 %t2642, 7
  %t2644 = icmp eq i64 %t2643, 0
  br i1 %t2644, label %fixfast659, label %fixslow660
fixfast659:
  %t2645 = icmp slt i64 0, %a1
  %t2646 = select i1 %t2645, i64 257, i64 1
  br label %fixmerge661
fixslow660:
  %t2647 = call i64 @rt_lt(i64 0, i64 %a1)
  br label %fixmerge661
fixmerge661:
  %t2648 = phi i64 [ %t2646, %fixfast659 ], [ %t2647, %fixslow660 ]
  %t2649 = icmp ne i64 %t2648, 1
  br i1 %t2649, label %then662, label %else663
then662:
  br label %merge664
else663:
  %t2650 = or i64 0, %a1
  %t2651 = and i64 %t2650, 7
  %t2652 = icmp eq i64 %t2651, 0
  br i1 %t2652, label %fixfast665, label %fixslow666
fixfast665:
  %t2653 = icmp eq i64 0, %a1
  %t2654 = select i1 %t2653, i64 257, i64 1
  br label %fixmerge667
fixslow666:
  %t2655 = call i64 @rt_num_eq(i64 0, i64 %a1)
  br label %fixmerge667
fixmerge667:
  %t2656 = phi i64 [ %t2654, %fixfast665 ], [ %t2655, %fixslow666 ]
  br label %merge664
merge664:
  %t2657 = phi i64 [ 257, %then662 ], [ %t2656, %fixmerge667 ]
  %t2658 = icmp ne i64 %t2657, 1
  br i1 %t2658, label %then668, label %else669
then668:
  %t2659 = or i64 %a1, %a2
  %t2660 = and i64 %t2659, 7
  %t2661 = icmp eq i64 %t2660, 0
  br i1 %t2661, label %fixfast671, label %fixslow672
fixfast671:
  %t2662 = icmp slt i64 %a1, %a2
  %t2663 = select i1 %t2662, i64 257, i64 1
  br label %fixmerge673
fixslow672:
  %t2664 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge673
fixmerge673:
  %t2665 = phi i64 [ %t2663, %fixfast671 ], [ %t2664, %fixslow672 ]
  %t2666 = icmp ne i64 %t2665, 1
  br i1 %t2666, label %then674, label %else675
then674:
  br label %merge676
else675:
  %t2667 = or i64 %a1, %a2
  %t2668 = and i64 %t2667, 7
  %t2669 = icmp eq i64 %t2668, 0
  br i1 %t2669, label %fixfast677, label %fixslow678
fixfast677:
  %t2670 = icmp eq i64 %a1, %a2
  %t2671 = select i1 %t2670, i64 257, i64 1
  br label %fixmerge679
fixslow678:
  %t2672 = call i64 @rt_num_eq(i64 %a1, i64 %a2)
  br label %fixmerge679
fixmerge679:
  %t2673 = phi i64 [ %t2671, %fixfast677 ], [ %t2672, %fixslow678 ]
  br label %merge676
merge676:
  %t2674 = phi i64 [ 257, %then674 ], [ %t2673, %fixmerge679 ]
  %t2675 = icmp ne i64 %t2674, 1
  br i1 %t2675, label %then680, label %else681
then680:
  %t2676 = or i64 %a2, %a3
  %t2677 = and i64 %t2676, 7
  %t2678 = icmp eq i64 %t2677, 0
  br i1 %t2678, label %fixfast683, label %fixslow684
fixfast683:
  %t2679 = icmp slt i64 %a2, %a3
  %t2680 = select i1 %t2679, i64 257, i64 1
  br label %fixmerge685
fixslow684:
  %t2681 = call i64 @rt_lt(i64 %a2, i64 %a3)
  br label %fixmerge685
fixmerge685:
  %t2682 = phi i64 [ %t2680, %fixfast683 ], [ %t2681, %fixslow684 ]
  %t2683 = icmp ne i64 %t2682, 1
  br i1 %t2683, label %then686, label %else687
then686:
  br label %merge688
else687:
  %t2684 = or i64 %a2, %a3
  %t2685 = and i64 %t2684, 7
  %t2686 = icmp eq i64 %t2685, 0
  br i1 %t2686, label %fixfast689, label %fixslow690
fixfast689:
  %t2687 = icmp eq i64 %a2, %a3
  %t2688 = select i1 %t2687, i64 257, i64 1
  br label %fixmerge691
fixslow690:
  %t2689 = call i64 @rt_num_eq(i64 %a2, i64 %a3)
  br label %fixmerge691
fixmerge691:
  %t2690 = phi i64 [ %t2688, %fixfast689 ], [ %t2689, %fixslow690 ]
  br label %merge688
merge688:
  %t2691 = phi i64 [ 257, %then686 ], [ %t2690, %fixmerge691 ]
  br label %merge682
else681:
  br label %merge682
merge682:
  %t2692 = phi i64 [ %t2691, %merge688 ], [ 1, %else681 ]
  br label %merge670
else669:
  br label %merge670
merge670:
  %t2693 = phi i64 [ %t2692, %merge682 ], [ 1, %else669 ]
  %t2694 = icmp ne i64 %t2693, 1
  br i1 %t2694, label %then692, label %else693
then692:
  ret i64 257
else693:
  %t2695 = call i64 @rt_make_string(ptr @.str.lit.13, i64 19)
  %t2696 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t2696)
  %t2697 = and i64 %t2696, -8
  %t2698 = inttoptr i64 %t2697 to ptr
  %t2699 = load i64, ptr %t2698
  %t2700 = inttoptr i64 %t2699 to ptr
  %t2701 = musttail call fastcc i64 %t2700(i64 %t2696, i64 5, i64 %t2695, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2701
}

define fastcc i64 @"scheme.base:code:assv"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2706 = icmp eq i64 %argc, 2
  br i1 %t2706, label %argok695, label %arityerr694
arityerr694:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok695:
  %t2707 = call i64 @rt_null_p(i64 %a1)
  %t2708 = icmp ne i64 %t2707, 1
  br i1 %t2708, label %then696, label %else697
then696:
  ret i64 1
else697:
  %t2709 = call i64 @rt_car(i64 %a1)
  %t2710 = call i64 @rt_car(i64 %t2709)
  %t2711 = call i64 @rt_eqv_p(i64 %a0, i64 %t2710)
  %t2712 = icmp ne i64 %t2711, 1
  br i1 %t2712, label %then698, label %else699
then698:
  %t2713 = call i64 @rt_car(i64 %a1)
  ret i64 %t2713
else699:
  %t2714 = call i64 @rt_cdr(i64 %a1)
  %t2715 = load i64, ptr @"scheme.base:assv"
  call void @rt_check_callable(i64 %t2715)
  %t2716 = and i64 %t2715, -8
  %t2717 = inttoptr i64 %t2716 to ptr
  %t2718 = load i64, ptr %t2717
  %t2719 = inttoptr i64 %t2718 to ptr
  %t2720 = musttail call fastcc i64 %t2719(i64 %t2715, i64 2, i64 %a0, i64 %t2714, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2720
}

define fastcc i64 @"scheme.base:code:list-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2725 = icmp eq i64 %argc, 1
  br i1 %t2725, label %argok701, label %arityerr700
arityerr700:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok701:
  %t2726 = call i64 @rt_pair_p(i64 %a0)
  %t2727 = icmp ne i64 %t2726, 1
  br i1 %t2727, label %then702, label %else703
then702:
  %t2728 = call i64 @rt_car(i64 %a0)
  %t2729 = call i64 @rt_cdr(i64 %a0)
  %t2730 = load i64, ptr @"scheme.base:list-copy"
  call void @rt_check_callable(i64 %t2730)
  %t2731 = and i64 %t2730, -8
  %t2732 = inttoptr i64 %t2731 to ptr
  %t2733 = load i64, ptr %t2732
  %t2734 = inttoptr i64 %t2733 to ptr
  %t2735 = call fastcc i64%t2734(i64 %t2730, i64 1, i64 %t2729, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2736 = call i64 @rt_cons(i64 %t2728, i64 %t2735)
  ret i64 %t2736
else703:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:boolean=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2741 = icmp sge i64 %argc, 2
  br i1 %t2741, label %argok705, label %arityerr704
arityerr704:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok705:
  %t2742 = call ptr @rt_alloc_words(i64 8)
  %t2743 = getelementptr i64, ptr %t2742, i64 0
  store i64 %a0, ptr %t2743
  %t2744 = getelementptr i64, ptr %t2742, i64 1
  store i64 %a1, ptr %t2744
  %t2745 = getelementptr i64, ptr %t2742, i64 2
  store i64 %a2, ptr %t2745
  %t2746 = getelementptr i64, ptr %t2742, i64 3
  store i64 %a3, ptr %t2746
  %t2747 = getelementptr i64, ptr %t2742, i64 4
  store i64 %a4, ptr %t2747
  %t2748 = getelementptr i64, ptr %t2742, i64 5
  store i64 %a5, ptr %t2748
  %t2749 = getelementptr i64, ptr %t2742, i64 6
  store i64 %a6, ptr %t2749
  %t2750 = getelementptr i64, ptr %t2742, i64 7
  store i64 %a7, ptr %t2750
  %t2751 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t2742, ptr %overflow)
  %t2752 = call i64 @rt_cons(i64 %a1, i64 %t2751)
  %t2753 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t2753)
  %t2754 = and i64 %t2753, -8
  %t2755 = inttoptr i64 %t2754 to ptr
  %t2756 = load i64, ptr %t2755
  %t2757 = inttoptr i64 %t2756 to ptr
  %t2758 = musttail call fastcc i64 %t2757(i64 %t2753, i64 2, i64 %a0, i64 %t2752, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2758
}

define fastcc i64 @"scheme.base:code:symbol=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2763 = icmp sge i64 %argc, 2
  br i1 %t2763, label %argok707, label %arityerr706
arityerr706:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok707:
  %t2764 = call ptr @rt_alloc_words(i64 8)
  %t2765 = getelementptr i64, ptr %t2764, i64 0
  store i64 %a0, ptr %t2765
  %t2766 = getelementptr i64, ptr %t2764, i64 1
  store i64 %a1, ptr %t2766
  %t2767 = getelementptr i64, ptr %t2764, i64 2
  store i64 %a2, ptr %t2767
  %t2768 = getelementptr i64, ptr %t2764, i64 3
  store i64 %a3, ptr %t2768
  %t2769 = getelementptr i64, ptr %t2764, i64 4
  store i64 %a4, ptr %t2769
  %t2770 = getelementptr i64, ptr %t2764, i64 5
  store i64 %a5, ptr %t2770
  %t2771 = getelementptr i64, ptr %t2764, i64 6
  store i64 %a6, ptr %t2771
  %t2772 = getelementptr i64, ptr %t2764, i64 7
  store i64 %a7, ptr %t2772
  %t2773 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t2764, ptr %overflow)
  %t2774 = call i64 @rt_cons(i64 %a1, i64 %t2773)
  %t2775 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t2775)
  %t2776 = and i64 %t2775, -8
  %t2777 = inttoptr i64 %t2776 to ptr
  %t2778 = load i64, ptr %t2777
  %t2779 = inttoptr i64 %t2778 to ptr
  %t2780 = musttail call fastcc i64 %t2779(i64 %t2775, i64 2, i64 %a0, i64 %t2774, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2780
}

define fastcc i64 @"scheme.base:code:eqv-chain?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2785 = icmp eq i64 %argc, 2
  br i1 %t2785, label %argok709, label %arityerr708
arityerr708:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok709:
  %t2786 = call i64 @rt_null_p(i64 %a1)
  %t2787 = icmp ne i64 %t2786, 1
  br i1 %t2787, label %then710, label %else711
then710:
  ret i64 257
else711:
  %t2788 = call i64 @rt_car(i64 %a1)
  %t2789 = call i64 @rt_eqv_p(i64 %a0, i64 %t2788)
  %t2790 = icmp ne i64 %t2789, 1
  br i1 %t2790, label %then712, label %else713
then712:
  %t2791 = call i64 @rt_car(i64 %a1)
  %t2792 = call i64 @rt_cdr(i64 %a1)
  %t2793 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t2793)
  %t2794 = and i64 %t2793, -8
  %t2795 = inttoptr i64 %t2794 to ptr
  %t2796 = load i64, ptr %t2795
  %t2797 = inttoptr i64 %t2796 to ptr
  %t2798 = musttail call fastcc i64 %t2797(i64 %t2793, i64 2, i64 %t2791, i64 %t2792, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2798
else713:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_629"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2803 = icmp eq i64 %argc, 1
  br i1 %t2803, label %argok715, label %arityerr714
arityerr714:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok715:
  %t2804 = and i64 %self, -8
  %t2805 = inttoptr i64 %t2804 to ptr
  %t2806 = getelementptr i64, ptr %t2805, i64 1
  %t2807 = load i64, ptr %t2806
  %t2808 = or i64 %a0, %t2807
  %t2809 = and i64 %t2808, 7
  %t2810 = icmp eq i64 %t2809, 0
  br i1 %t2810, label %fixfast716, label %fixslow717
fixfast716:
  %t2811 = icmp eq i64 %a0, %t2807
  %t2812 = select i1 %t2811, i64 257, i64 1
  br label %fixmerge718
fixslow717:
  %t2813 = call i64 @rt_num_eq(i64 %a0, i64 %t2807)
  br label %fixmerge718
fixmerge718:
  %t2814 = phi i64 [ %t2812, %fixfast716 ], [ %t2813, %fixslow717 ]
  %t2815 = icmp ne i64 %t2814, 1
  br i1 %t2815, label %then719, label %else720
then719:
  %t2816 = and i64 %self, -8
  %t2817 = inttoptr i64 %t2816 to ptr
  %t2818 = getelementptr i64, ptr %t2817, i64 2
  %t2819 = load i64, ptr %t2818
  %t2820 = or i64 %a0, %t2819
  %t2821 = and i64 %t2820, 7
  %t2822 = icmp eq i64 %t2821, 0
  br i1 %t2822, label %fixfast722, label %fixslow723
fixfast722:
  %t2823 = icmp eq i64 %a0, %t2819
  %t2824 = select i1 %t2823, i64 257, i64 1
  br label %fixmerge724
fixslow723:
  %t2825 = call i64 @rt_num_eq(i64 %a0, i64 %t2819)
  br label %fixmerge724
fixmerge724:
  %t2826 = phi i64 [ %t2824, %fixfast722 ], [ %t2825, %fixslow723 ]
  br label %merge721
else720:
  br label %merge721
merge721:
  %t2827 = phi i64 [ %t2826, %fixmerge724 ], [ 1, %else720 ]
  %t2828 = icmp ne i64 %t2827, 1
  br i1 %t2828, label %then725, label %else726
then725:
  ret i64 0
else726:
  %t2829 = and i64 %self, -8
  %t2830 = inttoptr i64 %t2829 to ptr
  %t2831 = getelementptr i64, ptr %t2830, i64 1
  %t2832 = load i64, ptr %t2831
  %t2833 = or i64 %a0, %t2832
  %t2834 = and i64 %t2833, 7
  %t2835 = icmp eq i64 %t2834, 0
  br i1 %t2835, label %fixfast727, label %fixslow728
fixfast727:
  %t2836 = icmp eq i64 %a0, %t2832
  %t2837 = select i1 %t2836, i64 257, i64 1
  br label %fixmerge729
fixslow728:
  %t2838 = call i64 @rt_num_eq(i64 %a0, i64 %t2832)
  br label %fixmerge729
fixmerge729:
  %t2839 = phi i64 [ %t2837, %fixfast727 ], [ %t2838, %fixslow728 ]
  %t2840 = icmp ne i64 %t2839, 1
  br i1 %t2840, label %then730, label %else731
then730:
  ret i64 -8
else731:
  %t2841 = and i64 %self, -8
  %t2842 = inttoptr i64 %t2841 to ptr
  %t2843 = getelementptr i64, ptr %t2842, i64 2
  %t2844 = load i64, ptr %t2843
  %t2845 = or i64 %a0, %t2844
  %t2846 = and i64 %t2845, 7
  %t2847 = icmp eq i64 %t2846, 0
  br i1 %t2847, label %fixfast732, label %fixslow733
fixfast732:
  %t2848 = icmp eq i64 %a0, %t2844
  %t2849 = select i1 %t2848, i64 257, i64 1
  br label %fixmerge734
fixslow733:
  %t2850 = call i64 @rt_num_eq(i64 %a0, i64 %t2844)
  br label %fixmerge734
fixmerge734:
  %t2851 = phi i64 [ %t2849, %fixfast732 ], [ %t2850, %fixslow733 ]
  %t2852 = icmp ne i64 %t2851, 1
  br i1 %t2852, label %then735, label %else736
then735:
  ret i64 8
else736:
  %t2853 = and i64 %self, -8
  %t2854 = inttoptr i64 %t2853 to ptr
  %t2855 = getelementptr i64, ptr %t2854, i64 3
  %t2856 = load i64, ptr %t2855
  %t2857 = call i64 @rt_string_ref(i64 %t2856, i64 %a0)
  %t2858 = call i64 @rt_char_to_integer(i64 %t2857)
  %t2859 = and i64 %self, -8
  %t2860 = inttoptr i64 %t2859 to ptr
  %t2861 = getelementptr i64, ptr %t2860, i64 4
  %t2862 = load i64, ptr %t2861
  %t2863 = call i64 @rt_string_ref(i64 %t2862, i64 %a0)
  %t2864 = call i64 @rt_char_to_integer(i64 %t2863)
  %t2865 = or i64 %t2858, %t2864
  %t2866 = and i64 %t2865, 7
  %t2867 = icmp eq i64 %t2866, 0
  br i1 %t2867, label %fixfast737, label %fixslow738
fixfast737:
  %t2868 = icmp slt i64 %t2858, %t2864
  %t2869 = select i1 %t2868, i64 257, i64 1
  br label %fixmerge739
fixslow738:
  %t2870 = call i64 @rt_lt(i64 %t2858, i64 %t2864)
  br label %fixmerge739
fixmerge739:
  %t2871 = phi i64 [ %t2869, %fixfast737 ], [ %t2870, %fixslow738 ]
  %t2872 = icmp ne i64 %t2871, 1
  br i1 %t2872, label %then740, label %else741
then740:
  ret i64 -8
else741:
  %t2873 = or i64 %t2864, %t2858
  %t2874 = and i64 %t2873, 7
  %t2875 = icmp eq i64 %t2874, 0
  br i1 %t2875, label %fixfast742, label %fixslow743
fixfast742:
  %t2876 = icmp slt i64 %t2864, %t2858
  %t2877 = select i1 %t2876, i64 257, i64 1
  br label %fixmerge744
fixslow743:
  %t2878 = call i64 @rt_lt(i64 %t2864, i64 %t2858)
  br label %fixmerge744
fixmerge744:
  %t2879 = phi i64 [ %t2877, %fixfast742 ], [ %t2878, %fixslow743 ]
  %t2880 = icmp ne i64 %t2879, 1
  br i1 %t2880, label %then745, label %else746
then745:
  ret i64 8
else746:
  %t2881 = or i64 %a0, 8
  %t2882 = and i64 %t2881, 7
  %t2883 = icmp eq i64 %t2882, 0
  br i1 %t2883, label %fixfast747, label %fixslow748
fixfast747:
  %t2884 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t2885 = extractvalue {i64, i1} %t2884, 0
  %t2886 = extractvalue {i64, i1} %t2884, 1
  br i1 %t2886, label %fixslow748, label %fixmerge749
fixslow748:
  %t2887 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge749
fixmerge749:
  %t2888 = phi i64 [ %t2885, %fixfast747 ], [ %t2887, %fixslow748 ]
  %t2889 = musttail call fastcc i64 @"scheme.base:code_629"(i64 %self, i64 1, i64 %t2888, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2889
}

define fastcc i64 @"scheme.base:code:str-cmp"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2890 = icmp eq i64 %argc, 2
  br i1 %t2890, label %argok751, label %arityerr750
arityerr750:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok751:
  %t2891 = call i64 @rt_string_length(i64 %a0)
  %t2892 = call i64 @rt_string_length(i64 %a1)
  %t2893 = call ptr @rt_alloc_words(i64 6)
  %t2894 = ptrtoint ptr %t2893 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_629" to i64), ptr %t2893
  %t2895 = or i64 %t2894, 4
  %t2896 = getelementptr i64, ptr %t2893, i64 1
  store i64 %t2891, ptr %t2896
  %t2897 = getelementptr i64, ptr %t2893, i64 2
  store i64 %t2892, ptr %t2897
  %t2898 = getelementptr i64, ptr %t2893, i64 3
  store i64 %a0, ptr %t2898
  %t2899 = getelementptr i64, ptr %t2893, i64 4
  store i64 %a1, ptr %t2899
  %t2900 = getelementptr i64, ptr %t2893, i64 5
  store i64 %t2895, ptr %t2900
  %t2901 = musttail call fastcc i64 @"scheme.base:code_629"(i64 %t2895, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2901
}

define fastcc i64 @"scheme.base:code:str-chain?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2906 = icmp eq i64 %argc, 3
  br i1 %t2906, label %argok753, label %arityerr752
arityerr752:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok753:
  %t2907 = call i64 @rt_null_p(i64 %a2)
  %t2908 = icmp ne i64 %t2907, 1
  br i1 %t2908, label %then754, label %else755
then754:
  ret i64 257
else755:
  %t2909 = call i64 @rt_car(i64 %a2)
  call void @rt_check_callable(i64 %a0)
  %t2910 = and i64 %a0, -8
  %t2911 = inttoptr i64 %t2910 to ptr
  %t2912 = load i64, ptr %t2911
  %t2913 = inttoptr i64 %t2912 to ptr
  %t2914 = call fastcc i64%t2913(i64 %a0, i64 2, i64 %a1, i64 %t2909, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2915 = icmp ne i64 %t2914, 1
  br i1 %t2915, label %then756, label %else757
then756:
  %t2916 = call i64 @rt_car(i64 %a2)
  %t2917 = call i64 @rt_cdr(i64 %a2)
  %t2918 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t2918)
  %t2919 = and i64 %t2918, -8
  %t2920 = inttoptr i64 %t2919 to ptr
  %t2921 = load i64, ptr %t2920
  %t2922 = inttoptr i64 %t2921 to ptr
  %t2923 = musttail call fastcc i64 %t2922(i64 %t2918, i64 3, i64 %a0, i64 %t2916, i64 %t2917, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2923
else757:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_645"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2928 = icmp eq i64 %argc, 2
  br i1 %t2928, label %argok759, label %arityerr758
arityerr758:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok759:
  %t2929 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t2929)
  %t2930 = and i64 %t2929, -8
  %t2931 = inttoptr i64 %t2930 to ptr
  %t2932 = load i64, ptr %t2931
  %t2933 = inttoptr i64 %t2932 to ptr
  %t2934 = call fastcc i64%t2933(i64 %t2929, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2935 = or i64 %t2934, 0
  %t2936 = and i64 %t2935, 7
  %t2937 = icmp eq i64 %t2936, 0
  br i1 %t2937, label %fixfast760, label %fixslow761
fixfast760:
  %t2938 = icmp slt i64 %t2934, 0
  %t2939 = select i1 %t2938, i64 257, i64 1
  br label %fixmerge762
fixslow761:
  %t2940 = call i64 @rt_lt(i64 %t2934, i64 0)
  br label %fixmerge762
fixmerge762:
  %t2941 = phi i64 [ %t2939, %fixfast760 ], [ %t2940, %fixslow761 ]
  ret i64 %t2941
}

define fastcc i64 @"scheme.base:code:string<?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2942 = icmp sge i64 %argc, 2
  br i1 %t2942, label %argok764, label %arityerr763
arityerr763:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok764:
  %t2943 = call ptr @rt_alloc_words(i64 8)
  %t2944 = getelementptr i64, ptr %t2943, i64 0
  store i64 %a0, ptr %t2944
  %t2945 = getelementptr i64, ptr %t2943, i64 1
  store i64 %a1, ptr %t2945
  %t2946 = getelementptr i64, ptr %t2943, i64 2
  store i64 %a2, ptr %t2946
  %t2947 = getelementptr i64, ptr %t2943, i64 3
  store i64 %a3, ptr %t2947
  %t2948 = getelementptr i64, ptr %t2943, i64 4
  store i64 %a4, ptr %t2948
  %t2949 = getelementptr i64, ptr %t2943, i64 5
  store i64 %a5, ptr %t2949
  %t2950 = getelementptr i64, ptr %t2943, i64 6
  store i64 %a6, ptr %t2950
  %t2951 = getelementptr i64, ptr %t2943, i64 7
  store i64 %a7, ptr %t2951
  %t2952 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t2943, ptr %overflow)
  %t2953 = call ptr @rt_alloc_words(i64 1)
  %t2954 = ptrtoint ptr %t2953 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_645" to i64), ptr %t2953
  %t2955 = or i64 %t2954, 4
  %t2956 = call i64 @rt_cons(i64 %a1, i64 %t2952)
  %t2957 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t2957)
  %t2958 = and i64 %t2957, -8
  %t2959 = inttoptr i64 %t2958 to ptr
  %t2960 = load i64, ptr %t2959
  %t2961 = inttoptr i64 %t2960 to ptr
  %t2962 = musttail call fastcc i64 %t2961(i64 %t2957, i64 3, i64 %t2955, i64 %a0, i64 %t2956, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2962
}

define fastcc i64 @"scheme.base:code_657"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2967 = icmp eq i64 %argc, 2
  br i1 %t2967, label %argok766, label %arityerr765
arityerr765:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok766:
  %t2968 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t2968)
  %t2969 = and i64 %t2968, -8
  %t2970 = inttoptr i64 %t2969 to ptr
  %t2971 = load i64, ptr %t2970
  %t2972 = inttoptr i64 %t2971 to ptr
  %t2973 = call fastcc i64%t2972(i64 %t2968, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2974 = or i64 0, %t2973
  %t2975 = and i64 %t2974, 7
  %t2976 = icmp eq i64 %t2975, 0
  br i1 %t2976, label %fixfast767, label %fixslow768
fixfast767:
  %t2977 = icmp slt i64 0, %t2973
  %t2978 = select i1 %t2977, i64 257, i64 1
  br label %fixmerge769
fixslow768:
  %t2979 = call i64 @rt_lt(i64 0, i64 %t2973)
  br label %fixmerge769
fixmerge769:
  %t2980 = phi i64 [ %t2978, %fixfast767 ], [ %t2979, %fixslow768 ]
  ret i64 %t2980
}

define fastcc i64 @"scheme.base:code:string>?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2981 = icmp sge i64 %argc, 2
  br i1 %t2981, label %argok771, label %arityerr770
arityerr770:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok771:
  %t2982 = call ptr @rt_alloc_words(i64 8)
  %t2983 = getelementptr i64, ptr %t2982, i64 0
  store i64 %a0, ptr %t2983
  %t2984 = getelementptr i64, ptr %t2982, i64 1
  store i64 %a1, ptr %t2984
  %t2985 = getelementptr i64, ptr %t2982, i64 2
  store i64 %a2, ptr %t2985
  %t2986 = getelementptr i64, ptr %t2982, i64 3
  store i64 %a3, ptr %t2986
  %t2987 = getelementptr i64, ptr %t2982, i64 4
  store i64 %a4, ptr %t2987
  %t2988 = getelementptr i64, ptr %t2982, i64 5
  store i64 %a5, ptr %t2988
  %t2989 = getelementptr i64, ptr %t2982, i64 6
  store i64 %a6, ptr %t2989
  %t2990 = getelementptr i64, ptr %t2982, i64 7
  store i64 %a7, ptr %t2990
  %t2991 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t2982, ptr %overflow)
  %t2992 = call ptr @rt_alloc_words(i64 1)
  %t2993 = ptrtoint ptr %t2992 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_657" to i64), ptr %t2992
  %t2994 = or i64 %t2993, 4
  %t2995 = call i64 @rt_cons(i64 %a1, i64 %t2991)
  %t2996 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t2996)
  %t2997 = and i64 %t2996, -8
  %t2998 = inttoptr i64 %t2997 to ptr
  %t2999 = load i64, ptr %t2998
  %t3000 = inttoptr i64 %t2999 to ptr
  %t3001 = musttail call fastcc i64 %t3000(i64 %t2996, i64 3, i64 %t2994, i64 %a0, i64 %t2995, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3001
}

define fastcc i64 @"scheme.base:code_669"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3006 = icmp eq i64 %argc, 2
  br i1 %t3006, label %argok773, label %arityerr772
arityerr772:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok773:
  %t3007 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t3007)
  %t3008 = and i64 %t3007, -8
  %t3009 = inttoptr i64 %t3008 to ptr
  %t3010 = load i64, ptr %t3009
  %t3011 = inttoptr i64 %t3010 to ptr
  %t3012 = call fastcc i64%t3011(i64 %t3007, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3013 = or i64 0, %t3012
  %t3014 = and i64 %t3013, 7
  %t3015 = icmp eq i64 %t3014, 0
  br i1 %t3015, label %fixfast774, label %fixslow775
fixfast774:
  %t3016 = icmp slt i64 0, %t3012
  %t3017 = select i1 %t3016, i64 257, i64 1
  br label %fixmerge776
fixslow775:
  %t3018 = call i64 @rt_lt(i64 0, i64 %t3012)
  br label %fixmerge776
fixmerge776:
  %t3019 = phi i64 [ %t3017, %fixfast774 ], [ %t3018, %fixslow775 ]
  %t3020 = call i64 @rt_not(i64 %t3019)
  ret i64 %t3020
}

define fastcc i64 @"scheme.base:code:string<=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3021 = icmp sge i64 %argc, 2
  br i1 %t3021, label %argok778, label %arityerr777
arityerr777:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok778:
  %t3022 = call ptr @rt_alloc_words(i64 8)
  %t3023 = getelementptr i64, ptr %t3022, i64 0
  store i64 %a0, ptr %t3023
  %t3024 = getelementptr i64, ptr %t3022, i64 1
  store i64 %a1, ptr %t3024
  %t3025 = getelementptr i64, ptr %t3022, i64 2
  store i64 %a2, ptr %t3025
  %t3026 = getelementptr i64, ptr %t3022, i64 3
  store i64 %a3, ptr %t3026
  %t3027 = getelementptr i64, ptr %t3022, i64 4
  store i64 %a4, ptr %t3027
  %t3028 = getelementptr i64, ptr %t3022, i64 5
  store i64 %a5, ptr %t3028
  %t3029 = getelementptr i64, ptr %t3022, i64 6
  store i64 %a6, ptr %t3029
  %t3030 = getelementptr i64, ptr %t3022, i64 7
  store i64 %a7, ptr %t3030
  %t3031 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3022, ptr %overflow)
  %t3032 = call ptr @rt_alloc_words(i64 1)
  %t3033 = ptrtoint ptr %t3032 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_669" to i64), ptr %t3032
  %t3034 = or i64 %t3033, 4
  %t3035 = call i64 @rt_cons(i64 %a1, i64 %t3031)
  %t3036 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3036)
  %t3037 = and i64 %t3036, -8
  %t3038 = inttoptr i64 %t3037 to ptr
  %t3039 = load i64, ptr %t3038
  %t3040 = inttoptr i64 %t3039 to ptr
  %t3041 = musttail call fastcc i64 %t3040(i64 %t3036, i64 3, i64 %t3034, i64 %a0, i64 %t3035, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3041
}

define fastcc i64 @"scheme.base:code_681"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3046 = icmp eq i64 %argc, 2
  br i1 %t3046, label %argok780, label %arityerr779
arityerr779:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok780:
  %t3047 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t3047)
  %t3048 = and i64 %t3047, -8
  %t3049 = inttoptr i64 %t3048 to ptr
  %t3050 = load i64, ptr %t3049
  %t3051 = inttoptr i64 %t3050 to ptr
  %t3052 = call fastcc i64%t3051(i64 %t3047, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3053 = or i64 %t3052, 0
  %t3054 = and i64 %t3053, 7
  %t3055 = icmp eq i64 %t3054, 0
  br i1 %t3055, label %fixfast781, label %fixslow782
fixfast781:
  %t3056 = icmp slt i64 %t3052, 0
  %t3057 = select i1 %t3056, i64 257, i64 1
  br label %fixmerge783
fixslow782:
  %t3058 = call i64 @rt_lt(i64 %t3052, i64 0)
  br label %fixmerge783
fixmerge783:
  %t3059 = phi i64 [ %t3057, %fixfast781 ], [ %t3058, %fixslow782 ]
  %t3060 = call i64 @rt_not(i64 %t3059)
  ret i64 %t3060
}

define fastcc i64 @"scheme.base:code:string>=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3061 = icmp sge i64 %argc, 2
  br i1 %t3061, label %argok785, label %arityerr784
arityerr784:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok785:
  %t3062 = call ptr @rt_alloc_words(i64 8)
  %t3063 = getelementptr i64, ptr %t3062, i64 0
  store i64 %a0, ptr %t3063
  %t3064 = getelementptr i64, ptr %t3062, i64 1
  store i64 %a1, ptr %t3064
  %t3065 = getelementptr i64, ptr %t3062, i64 2
  store i64 %a2, ptr %t3065
  %t3066 = getelementptr i64, ptr %t3062, i64 3
  store i64 %a3, ptr %t3066
  %t3067 = getelementptr i64, ptr %t3062, i64 4
  store i64 %a4, ptr %t3067
  %t3068 = getelementptr i64, ptr %t3062, i64 5
  store i64 %a5, ptr %t3068
  %t3069 = getelementptr i64, ptr %t3062, i64 6
  store i64 %a6, ptr %t3069
  %t3070 = getelementptr i64, ptr %t3062, i64 7
  store i64 %a7, ptr %t3070
  %t3071 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3062, ptr %overflow)
  %t3072 = call ptr @rt_alloc_words(i64 1)
  %t3073 = ptrtoint ptr %t3072 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_681" to i64), ptr %t3072
  %t3074 = or i64 %t3073, 4
  %t3075 = call i64 @rt_cons(i64 %a1, i64 %t3071)
  %t3076 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3076)
  %t3077 = and i64 %t3076, -8
  %t3078 = inttoptr i64 %t3077 to ptr
  %t3079 = load i64, ptr %t3078
  %t3080 = inttoptr i64 %t3079 to ptr
  %t3081 = musttail call fastcc i64 %t3080(i64 %t3076, i64 3, i64 %t3074, i64 %a0, i64 %t3075, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3081
}

define fastcc i64 @"scheme.base:code_696"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3086 = icmp eq i64 %argc, 2
  br i1 %t3086, label %argok787, label %arityerr786
arityerr786:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok787:
  %t3087 = and i64 %self, -8
  %t3088 = inttoptr i64 %t3087 to ptr
  %t3089 = getelementptr i64, ptr %t3088, i64 1
  %t3090 = load i64, ptr %t3089
  %t3091 = or i64 %a0, %t3090
  %t3092 = and i64 %t3091, 7
  %t3093 = icmp eq i64 %t3092, 0
  br i1 %t3093, label %fixfast788, label %fixslow789
fixfast788:
  %t3094 = icmp slt i64 %a0, %t3090
  %t3095 = select i1 %t3094, i64 257, i64 1
  br label %fixmerge790
fixslow789:
  %t3096 = call i64 @rt_lt(i64 %a0, i64 %t3090)
  br label %fixmerge790
fixmerge790:
  %t3097 = phi i64 [ %t3095, %fixfast788 ], [ %t3096, %fixslow789 ]
  %t3098 = icmp ne i64 %t3097, 1
  br i1 %t3098, label %then791, label %else792
then791:
  ret i64 %a1
else792:
  %t3099 = or i64 %a0, 8
  %t3100 = and i64 %t3099, 7
  %t3101 = icmp eq i64 %t3100, 0
  br i1 %t3101, label %fixfast793, label %fixslow794
fixfast793:
  %t3102 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t3103 = extractvalue {i64, i1} %t3102, 0
  %t3104 = extractvalue {i64, i1} %t3102, 1
  br i1 %t3104, label %fixslow794, label %fixmerge795
fixslow794:
  %t3105 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge795
fixmerge795:
  %t3106 = phi i64 [ %t3103, %fixfast793 ], [ %t3105, %fixslow794 ]
  %t3107 = and i64 %self, -8
  %t3108 = inttoptr i64 %t3107 to ptr
  %t3109 = getelementptr i64, ptr %t3108, i64 3
  %t3110 = load i64, ptr %t3109
  %t3111 = call i64 @rt_vector_ref(i64 %t3110, i64 %a0)
  %t3112 = call i64 @rt_cons(i64 %t3111, i64 %a1)
  %t3113 = musttail call fastcc i64 @"scheme.base:code_696"(i64 %self, i64 2, i64 %t3106, i64 %t3112, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3113
}

define fastcc i64 @"scheme.base:code:vector->list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3114 = icmp sge i64 %argc, 1
  br i1 %t3114, label %argok797, label %arityerr796
arityerr796:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok797:
  %t3115 = call ptr @rt_alloc_words(i64 8)
  %t3116 = getelementptr i64, ptr %t3115, i64 0
  store i64 %a0, ptr %t3116
  %t3117 = getelementptr i64, ptr %t3115, i64 1
  store i64 %a1, ptr %t3117
  %t3118 = getelementptr i64, ptr %t3115, i64 2
  store i64 %a2, ptr %t3118
  %t3119 = getelementptr i64, ptr %t3115, i64 3
  store i64 %a3, ptr %t3119
  %t3120 = getelementptr i64, ptr %t3115, i64 4
  store i64 %a4, ptr %t3120
  %t3121 = getelementptr i64, ptr %t3115, i64 5
  store i64 %a5, ptr %t3121
  %t3122 = getelementptr i64, ptr %t3115, i64 6
  store i64 %a6, ptr %t3122
  %t3123 = getelementptr i64, ptr %t3115, i64 7
  store i64 %a7, ptr %t3123
  %t3124 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t3115, ptr %overflow)
  %t3125 = call i64 @rt_vector_length(i64 %a0)
  %t3126 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t3126)
  %t3127 = and i64 %t3126, -8
  %t3128 = inttoptr i64 %t3127 to ptr
  %t3129 = load i64, ptr %t3128
  %t3130 = inttoptr i64 %t3129 to ptr
  %t3131 = call fastcc i64%t3130(i64 %t3126, i64 1, i64 %t3124, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3132 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t3132)
  %t3133 = and i64 %t3132, -8
  %t3134 = inttoptr i64 %t3133 to ptr
  %t3135 = load i64, ptr %t3134
  %t3136 = inttoptr i64 %t3135 to ptr
  %t3137 = call fastcc i64%t3136(i64 %t3132, i64 2, i64 %t3124, i64 %t3125, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3138 = call i64 @rt_intern(ptr @.str.sym.14)
  %t3139 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t3139)
  %t3140 = and i64 %t3139, -8
  %t3141 = inttoptr i64 %t3140 to ptr
  %t3142 = load i64, ptr %t3141
  %t3143 = inttoptr i64 %t3142 to ptr
  %t3144 = call fastcc i64%t3143(i64 %t3139, i64 4, i64 %t3138, i64 %t3131, i64 %t3137, i64 %t3125, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3145 = call ptr @rt_alloc_words(i64 4)
  %t3146 = ptrtoint ptr %t3145 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_696" to i64), ptr %t3145
  %t3147 = or i64 %t3146, 4
  %t3148 = getelementptr i64, ptr %t3145, i64 1
  store i64 %t3131, ptr %t3148
  %t3149 = getelementptr i64, ptr %t3145, i64 2
  store i64 %t3147, ptr %t3149
  %t3150 = getelementptr i64, ptr %t3145, i64 3
  store i64 %a0, ptr %t3150
  %t3151 = or i64 %t3137, 8
  %t3152 = and i64 %t3151, 7
  %t3153 = icmp eq i64 %t3152, 0
  br i1 %t3153, label %fixfast798, label %fixslow799
fixfast798:
  %t3154 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3137, i64 8)
  %t3155 = extractvalue {i64, i1} %t3154, 0
  %t3156 = extractvalue {i64, i1} %t3154, 1
  br i1 %t3156, label %fixslow799, label %fixmerge800
fixslow799:
  %t3157 = call i64 @rt_sub(i64 %t3137, i64 8)
  br label %fixmerge800
fixmerge800:
  %t3158 = phi i64 [ %t3155, %fixfast798 ], [ %t3157, %fixslow799 ]
  %t3159 = musttail call fastcc i64 @"scheme.base:code_696"(i64 %t3147, i64 2, i64 %t3158, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3159
}

define fastcc i64 @"scheme.base:code_711"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3164 = icmp eq i64 %argc, 1
  br i1 %t3164, label %argok802, label %arityerr801
arityerr801:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok802:
  %t3165 = and i64 %self, -8
  %t3166 = inttoptr i64 %t3165 to ptr
  %t3167 = getelementptr i64, ptr %t3166, i64 1
  %t3168 = load i64, ptr %t3167
  %t3169 = or i64 %a0, %t3168
  %t3170 = and i64 %t3169, 7
  %t3171 = icmp eq i64 %t3170, 0
  br i1 %t3171, label %fixfast803, label %fixslow804
fixfast803:
  %t3172 = icmp eq i64 %a0, %t3168
  %t3173 = select i1 %t3172, i64 257, i64 1
  br label %fixmerge805
fixslow804:
  %t3174 = call i64 @rt_num_eq(i64 %a0, i64 %t3168)
  br label %fixmerge805
fixmerge805:
  %t3175 = phi i64 [ %t3173, %fixfast803 ], [ %t3174, %fixslow804 ]
  %t3176 = icmp ne i64 %t3175, 1
  br i1 %t3176, label %then806, label %else807
then806:
  %t3177 = and i64 %self, -8
  %t3178 = inttoptr i64 %t3177 to ptr
  %t3179 = getelementptr i64, ptr %t3178, i64 2
  %t3180 = load i64, ptr %t3179
  ret i64 %t3180
else807:
  %t3181 = and i64 %self, -8
  %t3182 = inttoptr i64 %t3181 to ptr
  %t3183 = getelementptr i64, ptr %t3182, i64 2
  %t3184 = load i64, ptr %t3183
  %t3185 = and i64 %self, -8
  %t3186 = inttoptr i64 %t3185 to ptr
  %t3187 = getelementptr i64, ptr %t3186, i64 3
  %t3188 = load i64, ptr %t3187
  %t3189 = or i64 %a0, %t3188
  %t3190 = and i64 %t3189, 7
  %t3191 = icmp eq i64 %t3190, 0
  br i1 %t3191, label %fixfast808, label %fixslow809
fixfast808:
  %t3192 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t3188)
  %t3193 = extractvalue {i64, i1} %t3192, 0
  %t3194 = extractvalue {i64, i1} %t3192, 1
  br i1 %t3194, label %fixslow809, label %fixmerge810
fixslow809:
  %t3195 = call i64 @rt_sub(i64 %a0, i64 %t3188)
  br label %fixmerge810
fixmerge810:
  %t3196 = phi i64 [ %t3193, %fixfast808 ], [ %t3195, %fixslow809 ]
  %t3197 = and i64 %self, -8
  %t3198 = inttoptr i64 %t3197 to ptr
  %t3199 = getelementptr i64, ptr %t3198, i64 4
  %t3200 = load i64, ptr %t3199
  %t3201 = call i64 @rt_vector_ref(i64 %t3200, i64 %a0)
  %t3202 = call i64 @rt_vector_set(i64 %t3184, i64 %t3196, i64 %t3201)
  %t3203 = or i64 %a0, 8
  %t3204 = and i64 %t3203, 7
  %t3205 = icmp eq i64 %t3204, 0
  br i1 %t3205, label %fixfast811, label %fixslow812
fixfast811:
  %t3206 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3207 = extractvalue {i64, i1} %t3206, 0
  %t3208 = extractvalue {i64, i1} %t3206, 1
  br i1 %t3208, label %fixslow812, label %fixmerge813
fixslow812:
  %t3209 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge813
fixmerge813:
  %t3210 = phi i64 [ %t3207, %fixfast811 ], [ %t3209, %fixslow812 ]
  %t3211 = musttail call fastcc i64 @"scheme.base:code_711"(i64 %self, i64 1, i64 %t3210, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3211
}

define fastcc i64 @"scheme.base:code:vector-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3212 = icmp sge i64 %argc, 1
  br i1 %t3212, label %argok815, label %arityerr814
arityerr814:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok815:
  %t3213 = call ptr @rt_alloc_words(i64 8)
  %t3214 = getelementptr i64, ptr %t3213, i64 0
  store i64 %a0, ptr %t3214
  %t3215 = getelementptr i64, ptr %t3213, i64 1
  store i64 %a1, ptr %t3215
  %t3216 = getelementptr i64, ptr %t3213, i64 2
  store i64 %a2, ptr %t3216
  %t3217 = getelementptr i64, ptr %t3213, i64 3
  store i64 %a3, ptr %t3217
  %t3218 = getelementptr i64, ptr %t3213, i64 4
  store i64 %a4, ptr %t3218
  %t3219 = getelementptr i64, ptr %t3213, i64 5
  store i64 %a5, ptr %t3219
  %t3220 = getelementptr i64, ptr %t3213, i64 6
  store i64 %a6, ptr %t3220
  %t3221 = getelementptr i64, ptr %t3213, i64 7
  store i64 %a7, ptr %t3221
  %t3222 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t3213, ptr %overflow)
  %t3223 = call i64 @rt_vector_length(i64 %a0)
  %t3224 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t3224)
  %t3225 = and i64 %t3224, -8
  %t3226 = inttoptr i64 %t3225 to ptr
  %t3227 = load i64, ptr %t3226
  %t3228 = inttoptr i64 %t3227 to ptr
  %t3229 = call fastcc i64%t3228(i64 %t3224, i64 1, i64 %t3222, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3230 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t3230)
  %t3231 = and i64 %t3230, -8
  %t3232 = inttoptr i64 %t3231 to ptr
  %t3233 = load i64, ptr %t3232
  %t3234 = inttoptr i64 %t3233 to ptr
  %t3235 = call fastcc i64%t3234(i64 %t3230, i64 2, i64 %t3222, i64 %t3223, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3236 = call i64 @rt_intern(ptr @.str.sym.15)
  %t3237 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t3237)
  %t3238 = and i64 %t3237, -8
  %t3239 = inttoptr i64 %t3238 to ptr
  %t3240 = load i64, ptr %t3239
  %t3241 = inttoptr i64 %t3240 to ptr
  %t3242 = call fastcc i64%t3241(i64 %t3237, i64 4, i64 %t3236, i64 %t3229, i64 %t3235, i64 %t3223, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3243 = or i64 %t3235, %t3229
  %t3244 = and i64 %t3243, 7
  %t3245 = icmp eq i64 %t3244, 0
  br i1 %t3245, label %fixfast816, label %fixslow817
fixfast816:
  %t3246 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3235, i64 %t3229)
  %t3247 = extractvalue {i64, i1} %t3246, 0
  %t3248 = extractvalue {i64, i1} %t3246, 1
  br i1 %t3248, label %fixslow817, label %fixmerge818
fixslow817:
  %t3249 = call i64 @rt_sub(i64 %t3235, i64 %t3229)
  br label %fixmerge818
fixmerge818:
  %t3250 = phi i64 [ %t3247, %fixfast816 ], [ %t3249, %fixslow817 ]
  %t3251 = call i64 @rt_make_vector(i64 %t3250, i64 0)
  %t3252 = call ptr @rt_alloc_words(i64 6)
  %t3253 = ptrtoint ptr %t3252 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_711" to i64), ptr %t3252
  %t3254 = or i64 %t3253, 4
  %t3255 = getelementptr i64, ptr %t3252, i64 1
  store i64 %t3235, ptr %t3255
  %t3256 = getelementptr i64, ptr %t3252, i64 2
  store i64 %t3251, ptr %t3256
  %t3257 = getelementptr i64, ptr %t3252, i64 3
  store i64 %t3229, ptr %t3257
  %t3258 = getelementptr i64, ptr %t3252, i64 4
  store i64 %a0, ptr %t3258
  %t3259 = getelementptr i64, ptr %t3252, i64 5
  store i64 %t3254, ptr %t3259
  %t3260 = musttail call fastcc i64 @"scheme.base:code_711"(i64 %t3254, i64 1, i64 %t3229, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3260
}

define fastcc i64 @"scheme.base:code_729"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3265 = icmp eq i64 %argc, 1
  br i1 %t3265, label %argok820, label %arityerr819
arityerr819:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok820:
  %t3266 = and i64 %self, -8
  %t3267 = inttoptr i64 %t3266 to ptr
  %t3268 = getelementptr i64, ptr %t3267, i64 1
  %t3269 = load i64, ptr %t3268
  %t3270 = or i64 %a0, %t3269
  %t3271 = and i64 %t3270, 7
  %t3272 = icmp eq i64 %t3271, 0
  br i1 %t3272, label %fixfast821, label %fixslow822
fixfast821:
  %t3273 = icmp eq i64 %a0, %t3269
  %t3274 = select i1 %t3273, i64 257, i64 1
  br label %fixmerge823
fixslow822:
  %t3275 = call i64 @rt_num_eq(i64 %a0, i64 %t3269)
  br label %fixmerge823
fixmerge823:
  %t3276 = phi i64 [ %t3274, %fixfast821 ], [ %t3275, %fixslow822 ]
  %t3277 = icmp ne i64 %t3276, 1
  br i1 %t3277, label %then824, label %else825
then824:
  %t3278 = and i64 %self, -8
  %t3279 = inttoptr i64 %t3278 to ptr
  %t3280 = getelementptr i64, ptr %t3279, i64 3
  %t3281 = load i64, ptr %t3280
  %t3282 = call i64 @rt_cdr(i64 %t3281)
  %t3283 = and i64 %self, -8
  %t3284 = inttoptr i64 %t3283 to ptr
  %t3285 = getelementptr i64, ptr %t3284, i64 4
  %t3286 = load i64, ptr %t3285
  %t3287 = and i64 %self, -8
  %t3288 = inttoptr i64 %t3287 to ptr
  %t3289 = getelementptr i64, ptr %t3288, i64 1
  %t3290 = load i64, ptr %t3289
  %t3291 = or i64 %t3286, %t3290
  %t3292 = and i64 %t3291, 7
  %t3293 = icmp eq i64 %t3292, 0
  br i1 %t3293, label %fixfast826, label %fixslow827
fixfast826:
  %t3294 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3286, i64 %t3290)
  %t3295 = extractvalue {i64, i1} %t3294, 0
  %t3296 = extractvalue {i64, i1} %t3294, 1
  br i1 %t3296, label %fixslow827, label %fixmerge828
fixslow827:
  %t3297 = call i64 @rt_add(i64 %t3286, i64 %t3290)
  br label %fixmerge828
fixmerge828:
  %t3298 = phi i64 [ %t3295, %fixfast826 ], [ %t3297, %fixslow827 ]
  %t3299 = and i64 %self, -8
  %t3300 = inttoptr i64 %t3299 to ptr
  %t3301 = getelementptr i64, ptr %t3300, i64 2
  %t3302 = load i64, ptr %t3301
  %t3303 = musttail call fastcc i64 @"scheme.base:code_727"(i64 %t3302, i64 2, i64 %t3282, i64 %t3298, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3303
else825:
  %t3304 = and i64 %self, -8
  %t3305 = inttoptr i64 %t3304 to ptr
  %t3306 = getelementptr i64, ptr %t3305, i64 5
  %t3307 = load i64, ptr %t3306
  %t3308 = and i64 %self, -8
  %t3309 = inttoptr i64 %t3308 to ptr
  %t3310 = getelementptr i64, ptr %t3309, i64 4
  %t3311 = load i64, ptr %t3310
  %t3312 = or i64 %t3311, %a0
  %t3313 = and i64 %t3312, 7
  %t3314 = icmp eq i64 %t3313, 0
  br i1 %t3314, label %fixfast829, label %fixslow830
fixfast829:
  %t3315 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3311, i64 %a0)
  %t3316 = extractvalue {i64, i1} %t3315, 0
  %t3317 = extractvalue {i64, i1} %t3315, 1
  br i1 %t3317, label %fixslow830, label %fixmerge831
fixslow830:
  %t3318 = call i64 @rt_add(i64 %t3311, i64 %a0)
  br label %fixmerge831
fixmerge831:
  %t3319 = phi i64 [ %t3316, %fixfast829 ], [ %t3318, %fixslow830 ]
  %t3320 = and i64 %self, -8
  %t3321 = inttoptr i64 %t3320 to ptr
  %t3322 = getelementptr i64, ptr %t3321, i64 6
  %t3323 = load i64, ptr %t3322
  %t3324 = call i64 @rt_vector_ref(i64 %t3323, i64 %a0)
  %t3325 = call i64 @rt_vector_set(i64 %t3307, i64 %t3319, i64 %t3324)
  %t3326 = or i64 %a0, 8
  %t3327 = and i64 %t3326, 7
  %t3328 = icmp eq i64 %t3327, 0
  br i1 %t3328, label %fixfast832, label %fixslow833
fixfast832:
  %t3329 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3330 = extractvalue {i64, i1} %t3329, 0
  %t3331 = extractvalue {i64, i1} %t3329, 1
  br i1 %t3331, label %fixslow833, label %fixmerge834
fixslow833:
  %t3332 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge834
fixmerge834:
  %t3333 = phi i64 [ %t3330, %fixfast832 ], [ %t3332, %fixslow833 ]
  %t3334 = musttail call fastcc i64 @"scheme.base:code_729"(i64 %self, i64 1, i64 %t3333, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3334
}

define fastcc i64 @"scheme.base:code_727"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3335 = icmp eq i64 %argc, 2
  br i1 %t3335, label %argok836, label %arityerr835
arityerr835:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok836:
  %t3336 = call i64 @rt_null_p(i64 %a0)
  %t3337 = icmp ne i64 %t3336, 1
  br i1 %t3337, label %then837, label %else838
then837:
  %t3338 = and i64 %self, -8
  %t3339 = inttoptr i64 %t3338 to ptr
  %t3340 = getelementptr i64, ptr %t3339, i64 1
  %t3341 = load i64, ptr %t3340
  ret i64 %t3341
else838:
  %t3342 = call i64 @rt_car(i64 %a0)
  %t3343 = call i64 @rt_vector_length(i64 %t3342)
  %t3344 = call ptr @rt_alloc_words(i64 8)
  %t3345 = ptrtoint ptr %t3344 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_729" to i64), ptr %t3344
  %t3346 = or i64 %t3345, 4
  %t3347 = getelementptr i64, ptr %t3344, i64 1
  store i64 %t3343, ptr %t3347
  %t3348 = and i64 %self, -8
  %t3349 = inttoptr i64 %t3348 to ptr
  %t3350 = getelementptr i64, ptr %t3349, i64 2
  %t3351 = load i64, ptr %t3350
  %t3352 = getelementptr i64, ptr %t3344, i64 2
  store i64 %t3351, ptr %t3352
  %t3353 = getelementptr i64, ptr %t3344, i64 3
  store i64 %a0, ptr %t3353
  %t3354 = getelementptr i64, ptr %t3344, i64 4
  store i64 %a1, ptr %t3354
  %t3355 = and i64 %self, -8
  %t3356 = inttoptr i64 %t3355 to ptr
  %t3357 = getelementptr i64, ptr %t3356, i64 1
  %t3358 = load i64, ptr %t3357
  %t3359 = getelementptr i64, ptr %t3344, i64 5
  store i64 %t3358, ptr %t3359
  %t3360 = getelementptr i64, ptr %t3344, i64 6
  store i64 %t3342, ptr %t3360
  %t3361 = getelementptr i64, ptr %t3344, i64 7
  store i64 %t3346, ptr %t3361
  %t3362 = musttail call fastcc i64 @"scheme.base:code_729"(i64 %t3346, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3362
}

define fastcc i64 @"scheme.base:code:vector-append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3363 = icmp sge i64 %argc, 0
  br i1 %t3363, label %argok840, label %arityerr839
arityerr839:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok840:
  %t3364 = call ptr @rt_alloc_words(i64 8)
  %t3365 = getelementptr i64, ptr %t3364, i64 0
  store i64 %a0, ptr %t3365
  %t3366 = getelementptr i64, ptr %t3364, i64 1
  store i64 %a1, ptr %t3366
  %t3367 = getelementptr i64, ptr %t3364, i64 2
  store i64 %a2, ptr %t3367
  %t3368 = getelementptr i64, ptr %t3364, i64 3
  store i64 %a3, ptr %t3368
  %t3369 = getelementptr i64, ptr %t3364, i64 4
  store i64 %a4, ptr %t3369
  %t3370 = getelementptr i64, ptr %t3364, i64 5
  store i64 %a5, ptr %t3370
  %t3371 = getelementptr i64, ptr %t3364, i64 6
  store i64 %a6, ptr %t3371
  %t3372 = getelementptr i64, ptr %t3364, i64 7
  store i64 %a7, ptr %t3372
  %t3373 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t3364, ptr %overflow)
  %t3374 = load i64, ptr @"scheme.base:vec-total"
  call void @rt_check_callable(i64 %t3374)
  %t3375 = and i64 %t3374, -8
  %t3376 = inttoptr i64 %t3375 to ptr
  %t3377 = load i64, ptr %t3376
  %t3378 = inttoptr i64 %t3377 to ptr
  %t3379 = call fastcc i64%t3378(i64 %t3374, i64 1, i64 %t3373, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3380 = call i64 @rt_make_vector(i64 %t3379, i64 0)
  %t3381 = call ptr @rt_alloc_words(i64 3)
  %t3382 = ptrtoint ptr %t3381 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_727" to i64), ptr %t3381
  %t3383 = or i64 %t3382, 4
  %t3384 = getelementptr i64, ptr %t3381, i64 1
  store i64 %t3380, ptr %t3384
  %t3385 = getelementptr i64, ptr %t3381, i64 2
  store i64 %t3383, ptr %t3385
  %t3386 = musttail call fastcc i64 @"scheme.base:code_727"(i64 %t3383, i64 2, i64 %t3373, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3386
}

define fastcc i64 @"scheme.base:code:vec-total"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3391 = icmp eq i64 %argc, 1
  br i1 %t3391, label %argok842, label %arityerr841
arityerr841:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok842:
  %t3392 = call i64 @rt_null_p(i64 %a0)
  %t3393 = icmp ne i64 %t3392, 1
  br i1 %t3393, label %then843, label %else844
then843:
  ret i64 0
else844:
  %t3394 = call i64 @rt_car(i64 %a0)
  %t3395 = call i64 @rt_vector_length(i64 %t3394)
  %t3396 = call i64 @rt_cdr(i64 %a0)
  %t3397 = load i64, ptr @"scheme.base:vec-total"
  call void @rt_check_callable(i64 %t3397)
  %t3398 = and i64 %t3397, -8
  %t3399 = inttoptr i64 %t3398 to ptr
  %t3400 = load i64, ptr %t3399
  %t3401 = inttoptr i64 %t3400 to ptr
  %t3402 = call fastcc i64%t3401(i64 %t3397, i64 1, i64 %t3396, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3403 = or i64 %t3395, %t3402
  %t3404 = and i64 %t3403, 7
  %t3405 = icmp eq i64 %t3404, 0
  br i1 %t3405, label %fixfast845, label %fixslow846
fixfast845:
  %t3406 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3395, i64 %t3402)
  %t3407 = extractvalue {i64, i1} %t3406, 0
  %t3408 = extractvalue {i64, i1} %t3406, 1
  br i1 %t3408, label %fixslow846, label %fixmerge847
fixslow846:
  %t3409 = call i64 @rt_add(i64 %t3395, i64 %t3402)
  br label %fixmerge847
fixmerge847:
  %t3410 = phi i64 [ %t3407, %fixfast845 ], [ %t3409, %fixslow846 ]
  ret i64 %t3410
}

define fastcc i64 @"scheme.base:code_746"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3415 = icmp eq i64 %argc, 1
  br i1 %t3415, label %argok849, label %arityerr848
arityerr848:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok849:
  %t3416 = and i64 %self, -8
  %t3417 = inttoptr i64 %t3416 to ptr
  %t3418 = getelementptr i64, ptr %t3417, i64 1
  %t3419 = load i64, ptr %t3418
  %t3420 = or i64 %a0, %t3419
  %t3421 = and i64 %t3420, 7
  %t3422 = icmp eq i64 %t3421, 0
  br i1 %t3422, label %fixfast850, label %fixslow851
fixfast850:
  %t3423 = icmp eq i64 %a0, %t3419
  %t3424 = select i1 %t3423, i64 257, i64 1
  br label %fixmerge852
fixslow851:
  %t3425 = call i64 @rt_num_eq(i64 %a0, i64 %t3419)
  br label %fixmerge852
fixmerge852:
  %t3426 = phi i64 [ %t3424, %fixfast850 ], [ %t3425, %fixslow851 ]
  %t3427 = icmp ne i64 %t3426, 1
  br i1 %t3427, label %then853, label %else854
then853:
  %t3428 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t3428)
  %t3429 = and i64 %t3428, -8
  %t3430 = inttoptr i64 %t3429 to ptr
  %t3431 = load i64, ptr %t3430
  %t3432 = inttoptr i64 %t3431 to ptr
  %t3433 = musttail call fastcc i64 %t3432(i64 %t3428, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3433
else854:
  %t3434 = and i64 %self, -8
  %t3435 = inttoptr i64 %t3434 to ptr
  %t3436 = getelementptr i64, ptr %t3435, i64 2
  %t3437 = load i64, ptr %t3436
  %t3438 = and i64 %self, -8
  %t3439 = inttoptr i64 %t3438 to ptr
  %t3440 = getelementptr i64, ptr %t3439, i64 3
  %t3441 = load i64, ptr %t3440
  %t3442 = call i64 @rt_vector_set(i64 %t3437, i64 %a0, i64 %t3441)
  %t3443 = or i64 %a0, 8
  %t3444 = and i64 %t3443, 7
  %t3445 = icmp eq i64 %t3444, 0
  br i1 %t3445, label %fixfast855, label %fixslow856
fixfast855:
  %t3446 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3447 = extractvalue {i64, i1} %t3446, 0
  %t3448 = extractvalue {i64, i1} %t3446, 1
  br i1 %t3448, label %fixslow856, label %fixmerge857
fixslow856:
  %t3449 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge857
fixmerge857:
  %t3450 = phi i64 [ %t3447, %fixfast855 ], [ %t3449, %fixslow856 ]
  %t3451 = musttail call fastcc i64 @"scheme.base:code_746"(i64 %self, i64 1, i64 %t3450, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3451
}

define fastcc i64 @"scheme.base:code:vector-fill!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3452 = icmp sge i64 %argc, 2
  br i1 %t3452, label %argok859, label %arityerr858
arityerr858:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok859:
  %t3453 = call ptr @rt_alloc_words(i64 8)
  %t3454 = getelementptr i64, ptr %t3453, i64 0
  store i64 %a0, ptr %t3454
  %t3455 = getelementptr i64, ptr %t3453, i64 1
  store i64 %a1, ptr %t3455
  %t3456 = getelementptr i64, ptr %t3453, i64 2
  store i64 %a2, ptr %t3456
  %t3457 = getelementptr i64, ptr %t3453, i64 3
  store i64 %a3, ptr %t3457
  %t3458 = getelementptr i64, ptr %t3453, i64 4
  store i64 %a4, ptr %t3458
  %t3459 = getelementptr i64, ptr %t3453, i64 5
  store i64 %a5, ptr %t3459
  %t3460 = getelementptr i64, ptr %t3453, i64 6
  store i64 %a6, ptr %t3460
  %t3461 = getelementptr i64, ptr %t3453, i64 7
  store i64 %a7, ptr %t3461
  %t3462 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3453, ptr %overflow)
  %t3463 = call i64 @rt_vector_length(i64 %a0)
  %t3464 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t3464)
  %t3465 = and i64 %t3464, -8
  %t3466 = inttoptr i64 %t3465 to ptr
  %t3467 = load i64, ptr %t3466
  %t3468 = inttoptr i64 %t3467 to ptr
  %t3469 = call fastcc i64%t3468(i64 %t3464, i64 1, i64 %t3462, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3470 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t3470)
  %t3471 = and i64 %t3470, -8
  %t3472 = inttoptr i64 %t3471 to ptr
  %t3473 = load i64, ptr %t3472
  %t3474 = inttoptr i64 %t3473 to ptr
  %t3475 = call fastcc i64%t3474(i64 %t3470, i64 2, i64 %t3462, i64 %t3463, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3476 = call i64 @rt_intern(ptr @.str.sym.16)
  %t3477 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t3477)
  %t3478 = and i64 %t3477, -8
  %t3479 = inttoptr i64 %t3478 to ptr
  %t3480 = load i64, ptr %t3479
  %t3481 = inttoptr i64 %t3480 to ptr
  %t3482 = call fastcc i64%t3481(i64 %t3477, i64 4, i64 %t3476, i64 %t3469, i64 %t3475, i64 %t3463, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3483 = call ptr @rt_alloc_words(i64 5)
  %t3484 = ptrtoint ptr %t3483 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_746" to i64), ptr %t3483
  %t3485 = or i64 %t3484, 4
  %t3486 = getelementptr i64, ptr %t3483, i64 1
  store i64 %t3475, ptr %t3486
  %t3487 = getelementptr i64, ptr %t3483, i64 2
  store i64 %a0, ptr %t3487
  %t3488 = getelementptr i64, ptr %t3483, i64 3
  store i64 %a1, ptr %t3488
  %t3489 = getelementptr i64, ptr %t3483, i64 4
  store i64 %t3485, ptr %t3489
  %t3490 = musttail call fastcc i64 @"scheme.base:code_746"(i64 %t3485, i64 1, i64 %t3469, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3490
}

define fastcc i64 @"scheme.base:code_772"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3495 = icmp eq i64 %argc, 1
  br i1 %t3495, label %argok861, label %arityerr860
arityerr860:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok861:
  %t3496 = or i64 %a0, 0
  %t3497 = and i64 %t3496, 7
  %t3498 = icmp eq i64 %t3497, 0
  br i1 %t3498, label %fixfast862, label %fixslow863
fixfast862:
  %t3499 = icmp slt i64 %a0, 0
  %t3500 = select i1 %t3499, i64 257, i64 1
  br label %fixmerge864
fixslow863:
  %t3501 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge864
fixmerge864:
  %t3502 = phi i64 [ %t3500, %fixfast862 ], [ %t3501, %fixslow863 ]
  %t3503 = icmp ne i64 %t3502, 1
  br i1 %t3503, label %then865, label %else866
then865:
  %t3504 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t3504)
  %t3505 = and i64 %t3504, -8
  %t3506 = inttoptr i64 %t3505 to ptr
  %t3507 = load i64, ptr %t3506
  %t3508 = inttoptr i64 %t3507 to ptr
  %t3509 = musttail call fastcc i64 %t3508(i64 %t3504, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3509
else866:
  %t3510 = and i64 %self, -8
  %t3511 = inttoptr i64 %t3510 to ptr
  %t3512 = getelementptr i64, ptr %t3511, i64 1
  %t3513 = load i64, ptr %t3512
  %t3514 = and i64 %self, -8
  %t3515 = inttoptr i64 %t3514 to ptr
  %t3516 = getelementptr i64, ptr %t3515, i64 2
  %t3517 = load i64, ptr %t3516
  %t3518 = or i64 %t3517, %a0
  %t3519 = and i64 %t3518, 7
  %t3520 = icmp eq i64 %t3519, 0
  br i1 %t3520, label %fixfast867, label %fixslow868
fixfast867:
  %t3521 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3517, i64 %a0)
  %t3522 = extractvalue {i64, i1} %t3521, 0
  %t3523 = extractvalue {i64, i1} %t3521, 1
  br i1 %t3523, label %fixslow868, label %fixmerge869
fixslow868:
  %t3524 = call i64 @rt_add(i64 %t3517, i64 %a0)
  br label %fixmerge869
fixmerge869:
  %t3525 = phi i64 [ %t3522, %fixfast867 ], [ %t3524, %fixslow868 ]
  %t3526 = and i64 %self, -8
  %t3527 = inttoptr i64 %t3526 to ptr
  %t3528 = getelementptr i64, ptr %t3527, i64 3
  %t3529 = load i64, ptr %t3528
  %t3530 = and i64 %self, -8
  %t3531 = inttoptr i64 %t3530 to ptr
  %t3532 = getelementptr i64, ptr %t3531, i64 4
  %t3533 = load i64, ptr %t3532
  %t3534 = or i64 %t3533, %a0
  %t3535 = and i64 %t3534, 7
  %t3536 = icmp eq i64 %t3535, 0
  br i1 %t3536, label %fixfast870, label %fixslow871
fixfast870:
  %t3537 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3533, i64 %a0)
  %t3538 = extractvalue {i64, i1} %t3537, 0
  %t3539 = extractvalue {i64, i1} %t3537, 1
  br i1 %t3539, label %fixslow871, label %fixmerge872
fixslow871:
  %t3540 = call i64 @rt_add(i64 %t3533, i64 %a0)
  br label %fixmerge872
fixmerge872:
  %t3541 = phi i64 [ %t3538, %fixfast870 ], [ %t3540, %fixslow871 ]
  %t3542 = call i64 @rt_vector_ref(i64 %t3529, i64 %t3541)
  %t3543 = call i64 @rt_vector_set(i64 %t3513, i64 %t3525, i64 %t3542)
  %t3544 = or i64 %a0, 8
  %t3545 = and i64 %t3544, 7
  %t3546 = icmp eq i64 %t3545, 0
  br i1 %t3546, label %fixfast873, label %fixslow874
fixfast873:
  %t3547 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t3548 = extractvalue {i64, i1} %t3547, 0
  %t3549 = extractvalue {i64, i1} %t3547, 1
  br i1 %t3549, label %fixslow874, label %fixmerge875
fixslow874:
  %t3550 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge875
fixmerge875:
  %t3551 = phi i64 [ %t3548, %fixfast873 ], [ %t3550, %fixslow874 ]
  %t3552 = musttail call fastcc i64 @"scheme.base:code_772"(i64 %self, i64 1, i64 %t3551, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3552
}

define fastcc i64 @"scheme.base:code_774"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3553 = icmp eq i64 %argc, 1
  br i1 %t3553, label %argok877, label %arityerr876
arityerr876:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok877:
  %t3554 = and i64 %self, -8
  %t3555 = inttoptr i64 %t3554 to ptr
  %t3556 = getelementptr i64, ptr %t3555, i64 1
  %t3557 = load i64, ptr %t3556
  %t3558 = and i64 %self, -8
  %t3559 = inttoptr i64 %t3558 to ptr
  %t3560 = getelementptr i64, ptr %t3559, i64 2
  %t3561 = load i64, ptr %t3560
  %t3562 = or i64 %t3557, %t3561
  %t3563 = and i64 %t3562, 7
  %t3564 = icmp eq i64 %t3563, 0
  br i1 %t3564, label %fixfast878, label %fixslow879
fixfast878:
  %t3565 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3557, i64 %t3561)
  %t3566 = extractvalue {i64, i1} %t3565, 0
  %t3567 = extractvalue {i64, i1} %t3565, 1
  br i1 %t3567, label %fixslow879, label %fixmerge880
fixslow879:
  %t3568 = call i64 @rt_sub(i64 %t3557, i64 %t3561)
  br label %fixmerge880
fixmerge880:
  %t3569 = phi i64 [ %t3566, %fixfast878 ], [ %t3568, %fixslow879 ]
  %t3570 = or i64 %a0, %t3569
  %t3571 = and i64 %t3570, 7
  %t3572 = icmp eq i64 %t3571, 0
  br i1 %t3572, label %fixfast881, label %fixslow882
fixfast881:
  %t3573 = icmp eq i64 %a0, %t3569
  %t3574 = select i1 %t3573, i64 257, i64 1
  br label %fixmerge883
fixslow882:
  %t3575 = call i64 @rt_num_eq(i64 %a0, i64 %t3569)
  br label %fixmerge883
fixmerge883:
  %t3576 = phi i64 [ %t3574, %fixfast881 ], [ %t3575, %fixslow882 ]
  %t3577 = icmp ne i64 %t3576, 1
  br i1 %t3577, label %then884, label %else885
then884:
  %t3578 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t3578)
  %t3579 = and i64 %t3578, -8
  %t3580 = inttoptr i64 %t3579 to ptr
  %t3581 = load i64, ptr %t3580
  %t3582 = inttoptr i64 %t3581 to ptr
  %t3583 = musttail call fastcc i64 %t3582(i64 %t3578, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3583
else885:
  %t3584 = and i64 %self, -8
  %t3585 = inttoptr i64 %t3584 to ptr
  %t3586 = getelementptr i64, ptr %t3585, i64 3
  %t3587 = load i64, ptr %t3586
  %t3588 = and i64 %self, -8
  %t3589 = inttoptr i64 %t3588 to ptr
  %t3590 = getelementptr i64, ptr %t3589, i64 4
  %t3591 = load i64, ptr %t3590
  %t3592 = or i64 %t3591, %a0
  %t3593 = and i64 %t3592, 7
  %t3594 = icmp eq i64 %t3593, 0
  br i1 %t3594, label %fixfast886, label %fixslow887
fixfast886:
  %t3595 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3591, i64 %a0)
  %t3596 = extractvalue {i64, i1} %t3595, 0
  %t3597 = extractvalue {i64, i1} %t3595, 1
  br i1 %t3597, label %fixslow887, label %fixmerge888
fixslow887:
  %t3598 = call i64 @rt_add(i64 %t3591, i64 %a0)
  br label %fixmerge888
fixmerge888:
  %t3599 = phi i64 [ %t3596, %fixfast886 ], [ %t3598, %fixslow887 ]
  %t3600 = and i64 %self, -8
  %t3601 = inttoptr i64 %t3600 to ptr
  %t3602 = getelementptr i64, ptr %t3601, i64 5
  %t3603 = load i64, ptr %t3602
  %t3604 = and i64 %self, -8
  %t3605 = inttoptr i64 %t3604 to ptr
  %t3606 = getelementptr i64, ptr %t3605, i64 2
  %t3607 = load i64, ptr %t3606
  %t3608 = or i64 %t3607, %a0
  %t3609 = and i64 %t3608, 7
  %t3610 = icmp eq i64 %t3609, 0
  br i1 %t3610, label %fixfast889, label %fixslow890
fixfast889:
  %t3611 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3607, i64 %a0)
  %t3612 = extractvalue {i64, i1} %t3611, 0
  %t3613 = extractvalue {i64, i1} %t3611, 1
  br i1 %t3613, label %fixslow890, label %fixmerge891
fixslow890:
  %t3614 = call i64 @rt_add(i64 %t3607, i64 %a0)
  br label %fixmerge891
fixmerge891:
  %t3615 = phi i64 [ %t3612, %fixfast889 ], [ %t3614, %fixslow890 ]
  %t3616 = call i64 @rt_vector_ref(i64 %t3603, i64 %t3615)
  %t3617 = call i64 @rt_vector_set(i64 %t3587, i64 %t3599, i64 %t3616)
  %t3618 = or i64 %a0, 8
  %t3619 = and i64 %t3618, 7
  %t3620 = icmp eq i64 %t3619, 0
  br i1 %t3620, label %fixfast892, label %fixslow893
fixfast892:
  %t3621 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3622 = extractvalue {i64, i1} %t3621, 0
  %t3623 = extractvalue {i64, i1} %t3621, 1
  br i1 %t3623, label %fixslow893, label %fixmerge894
fixslow893:
  %t3624 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge894
fixmerge894:
  %t3625 = phi i64 [ %t3622, %fixfast892 ], [ %t3624, %fixslow893 ]
  %t3626 = musttail call fastcc i64 @"scheme.base:code_774"(i64 %self, i64 1, i64 %t3625, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3626
}

define fastcc i64 @"scheme.base:code:vector-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3627 = icmp sge i64 %argc, 3
  br i1 %t3627, label %argok896, label %arityerr895
arityerr895:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok896:
  %t3628 = call ptr @rt_alloc_words(i64 8)
  %t3629 = getelementptr i64, ptr %t3628, i64 0
  store i64 %a0, ptr %t3629
  %t3630 = getelementptr i64, ptr %t3628, i64 1
  store i64 %a1, ptr %t3630
  %t3631 = getelementptr i64, ptr %t3628, i64 2
  store i64 %a2, ptr %t3631
  %t3632 = getelementptr i64, ptr %t3628, i64 3
  store i64 %a3, ptr %t3632
  %t3633 = getelementptr i64, ptr %t3628, i64 4
  store i64 %a4, ptr %t3633
  %t3634 = getelementptr i64, ptr %t3628, i64 5
  store i64 %a5, ptr %t3634
  %t3635 = getelementptr i64, ptr %t3628, i64 6
  store i64 %a6, ptr %t3635
  %t3636 = getelementptr i64, ptr %t3628, i64 7
  store i64 %a7, ptr %t3636
  %t3637 = call i64 @rt_build_rest(i64 %argc, i64 3, i64 8, ptr %t3628, ptr %overflow)
  %t3638 = call i64 @rt_vector_length(i64 %a2)
  %t3639 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t3639)
  %t3640 = and i64 %t3639, -8
  %t3641 = inttoptr i64 %t3640 to ptr
  %t3642 = load i64, ptr %t3641
  %t3643 = inttoptr i64 %t3642 to ptr
  %t3644 = call fastcc i64%t3643(i64 %t3639, i64 1, i64 %t3637, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3645 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t3645)
  %t3646 = and i64 %t3645, -8
  %t3647 = inttoptr i64 %t3646 to ptr
  %t3648 = load i64, ptr %t3647
  %t3649 = inttoptr i64 %t3648 to ptr
  %t3650 = call fastcc i64%t3649(i64 %t3645, i64 2, i64 %t3637, i64 %t3638, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3651 = call i64 @rt_intern(ptr @.str.sym.17)
  %t3652 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t3652)
  %t3653 = and i64 %t3652, -8
  %t3654 = inttoptr i64 %t3653 to ptr
  %t3655 = load i64, ptr %t3654
  %t3656 = inttoptr i64 %t3655 to ptr
  %t3657 = call fastcc i64%t3656(i64 %t3652, i64 4, i64 %t3651, i64 %t3644, i64 %t3650, i64 %t3638, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3658 = call i64 @rt_intern(ptr @.str.sym.17)
  %t3659 = or i64 %t3650, %t3644
  %t3660 = and i64 %t3659, 7
  %t3661 = icmp eq i64 %t3660, 0
  br i1 %t3661, label %fixfast897, label %fixslow898
fixfast897:
  %t3662 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3650, i64 %t3644)
  %t3663 = extractvalue {i64, i1} %t3662, 0
  %t3664 = extractvalue {i64, i1} %t3662, 1
  br i1 %t3664, label %fixslow898, label %fixmerge899
fixslow898:
  %t3665 = call i64 @rt_sub(i64 %t3650, i64 %t3644)
  br label %fixmerge899
fixmerge899:
  %t3666 = phi i64 [ %t3663, %fixfast897 ], [ %t3665, %fixslow898 ]
  %t3667 = or i64 %a1, %t3666
  %t3668 = and i64 %t3667, 7
  %t3669 = icmp eq i64 %t3668, 0
  br i1 %t3669, label %fixfast900, label %fixslow901
fixfast900:
  %t3670 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t3666)
  %t3671 = extractvalue {i64, i1} %t3670, 0
  %t3672 = extractvalue {i64, i1} %t3670, 1
  br i1 %t3672, label %fixslow901, label %fixmerge902
fixslow901:
  %t3673 = call i64 @rt_add(i64 %a1, i64 %t3666)
  br label %fixmerge902
fixmerge902:
  %t3674 = phi i64 [ %t3671, %fixfast900 ], [ %t3673, %fixslow901 ]
  %t3675 = call i64 @rt_vector_length(i64 %a0)
  %t3676 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t3676)
  %t3677 = and i64 %t3676, -8
  %t3678 = inttoptr i64 %t3677 to ptr
  %t3679 = load i64, ptr %t3678
  %t3680 = inttoptr i64 %t3679 to ptr
  %t3681 = call fastcc i64%t3680(i64 %t3676, i64 4, i64 %t3658, i64 %a1, i64 %t3674, i64 %t3675, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3682 = or i64 %t3644, %a1
  %t3683 = and i64 %t3682, 7
  %t3684 = icmp eq i64 %t3683, 0
  br i1 %t3684, label %fixfast903, label %fixslow904
fixfast903:
  %t3685 = icmp slt i64 %t3644, %a1
  %t3686 = select i1 %t3685, i64 257, i64 1
  br label %fixmerge905
fixslow904:
  %t3687 = call i64 @rt_lt(i64 %t3644, i64 %a1)
  br label %fixmerge905
fixmerge905:
  %t3688 = phi i64 [ %t3686, %fixfast903 ], [ %t3687, %fixslow904 ]
  %t3689 = icmp ne i64 %t3688, 1
  br i1 %t3689, label %then906, label %else907
then906:
  %t3690 = call ptr @rt_alloc_words(i64 6)
  %t3691 = ptrtoint ptr %t3690 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_772" to i64), ptr %t3690
  %t3692 = or i64 %t3691, 4
  %t3693 = getelementptr i64, ptr %t3690, i64 1
  store i64 %a0, ptr %t3693
  %t3694 = getelementptr i64, ptr %t3690, i64 2
  store i64 %a1, ptr %t3694
  %t3695 = getelementptr i64, ptr %t3690, i64 3
  store i64 %a2, ptr %t3695
  %t3696 = getelementptr i64, ptr %t3690, i64 4
  store i64 %t3644, ptr %t3696
  %t3697 = getelementptr i64, ptr %t3690, i64 5
  store i64 %t3692, ptr %t3697
  %t3698 = or i64 %t3650, %t3644
  %t3699 = and i64 %t3698, 7
  %t3700 = icmp eq i64 %t3699, 0
  br i1 %t3700, label %fixfast908, label %fixslow909
fixfast908:
  %t3701 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3650, i64 %t3644)
  %t3702 = extractvalue {i64, i1} %t3701, 0
  %t3703 = extractvalue {i64, i1} %t3701, 1
  br i1 %t3703, label %fixslow909, label %fixmerge910
fixslow909:
  %t3704 = call i64 @rt_sub(i64 %t3650, i64 %t3644)
  br label %fixmerge910
fixmerge910:
  %t3705 = phi i64 [ %t3702, %fixfast908 ], [ %t3704, %fixslow909 ]
  %t3706 = or i64 %t3705, 8
  %t3707 = and i64 %t3706, 7
  %t3708 = icmp eq i64 %t3707, 0
  br i1 %t3708, label %fixfast911, label %fixslow912
fixfast911:
  %t3709 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3705, i64 8)
  %t3710 = extractvalue {i64, i1} %t3709, 0
  %t3711 = extractvalue {i64, i1} %t3709, 1
  br i1 %t3711, label %fixslow912, label %fixmerge913
fixslow912:
  %t3712 = call i64 @rt_sub(i64 %t3705, i64 8)
  br label %fixmerge913
fixmerge913:
  %t3713 = phi i64 [ %t3710, %fixfast911 ], [ %t3712, %fixslow912 ]
  %t3714 = musttail call fastcc i64 @"scheme.base:code_772"(i64 %t3692, i64 1, i64 %t3713, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3714
else907:
  %t3715 = call ptr @rt_alloc_words(i64 7)
  %t3716 = ptrtoint ptr %t3715 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_774" to i64), ptr %t3715
  %t3717 = or i64 %t3716, 4
  %t3718 = getelementptr i64, ptr %t3715, i64 1
  store i64 %t3650, ptr %t3718
  %t3719 = getelementptr i64, ptr %t3715, i64 2
  store i64 %t3644, ptr %t3719
  %t3720 = getelementptr i64, ptr %t3715, i64 3
  store i64 %a0, ptr %t3720
  %t3721 = getelementptr i64, ptr %t3715, i64 4
  store i64 %a1, ptr %t3721
  %t3722 = getelementptr i64, ptr %t3715, i64 5
  store i64 %a2, ptr %t3722
  %t3723 = getelementptr i64, ptr %t3715, i64 6
  store i64 %t3717, ptr %t3723
  %t3724 = musttail call fastcc i64 @"scheme.base:code_774"(i64 %t3717, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3724
}

define fastcc i64 @"scheme.base:code_797"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3729 = icmp eq i64 %argc, 1
  br i1 %t3729, label %argok915, label %arityerr914
arityerr914:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok915:
  %t3730 = and i64 %self, -8
  %t3731 = inttoptr i64 %t3730 to ptr
  %t3732 = getelementptr i64, ptr %t3731, i64 1
  %t3733 = load i64, ptr %t3732
  %t3734 = or i64 %a0, %t3733
  %t3735 = and i64 %t3734, 7
  %t3736 = icmp eq i64 %t3735, 0
  br i1 %t3736, label %fixfast916, label %fixslow917
fixfast916:
  %t3737 = icmp eq i64 %a0, %t3733
  %t3738 = select i1 %t3737, i64 257, i64 1
  br label %fixmerge918
fixslow917:
  %t3739 = call i64 @rt_num_eq(i64 %a0, i64 %t3733)
  br label %fixmerge918
fixmerge918:
  %t3740 = phi i64 [ %t3738, %fixfast916 ], [ %t3739, %fixslow917 ]
  %t3741 = icmp ne i64 %t3740, 1
  br i1 %t3741, label %then919, label %else920
then919:
  %t3742 = and i64 %self, -8
  %t3743 = inttoptr i64 %t3742 to ptr
  %t3744 = getelementptr i64, ptr %t3743, i64 2
  %t3745 = load i64, ptr %t3744
  ret i64 %t3745
else920:
  %t3746 = and i64 %self, -8
  %t3747 = inttoptr i64 %t3746 to ptr
  %t3748 = getelementptr i64, ptr %t3747, i64 2
  %t3749 = load i64, ptr %t3748
  %t3750 = and i64 %self, -8
  %t3751 = inttoptr i64 %t3750 to ptr
  %t3752 = getelementptr i64, ptr %t3751, i64 4
  %t3753 = load i64, ptr %t3752
  %t3754 = call i64 @rt_vector_ref(i64 %t3753, i64 %a0)
  %t3755 = and i64 %self, -8
  %t3756 = inttoptr i64 %t3755 to ptr
  %t3757 = getelementptr i64, ptr %t3756, i64 3
  %t3758 = load i64, ptr %t3757
  call void @rt_check_callable(i64 %t3758)
  %t3759 = and i64 %t3758, -8
  %t3760 = inttoptr i64 %t3759 to ptr
  %t3761 = load i64, ptr %t3760
  %t3762 = inttoptr i64 %t3761 to ptr
  %t3763 = call fastcc i64%t3762(i64 %t3758, i64 1, i64 %t3754, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3764 = call i64 @rt_vector_set(i64 %t3749, i64 %a0, i64 %t3763)
  %t3765 = or i64 %a0, 8
  %t3766 = and i64 %t3765, 7
  %t3767 = icmp eq i64 %t3766, 0
  br i1 %t3767, label %fixfast921, label %fixslow922
fixfast921:
  %t3768 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3769 = extractvalue {i64, i1} %t3768, 0
  %t3770 = extractvalue {i64, i1} %t3768, 1
  br i1 %t3770, label %fixslow922, label %fixmerge923
fixslow922:
  %t3771 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge923
fixmerge923:
  %t3772 = phi i64 [ %t3769, %fixfast921 ], [ %t3771, %fixslow922 ]
  %t3773 = musttail call fastcc i64 @"scheme.base:code_797"(i64 %self, i64 1, i64 %t3772, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3773
}

define fastcc i64 @"scheme.base:code_799"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3774 = icmp eq i64 %argc, 1
  br i1 %t3774, label %argok925, label %arityerr924
arityerr924:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok925:
  %t3775 = and i64 %self, -8
  %t3776 = inttoptr i64 %t3775 to ptr
  %t3777 = getelementptr i64, ptr %t3776, i64 1
  %t3778 = load i64, ptr %t3777
  %t3779 = or i64 %a0, %t3778
  %t3780 = and i64 %t3779, 7
  %t3781 = icmp eq i64 %t3780, 0
  br i1 %t3781, label %fixfast926, label %fixslow927
fixfast926:
  %t3782 = icmp eq i64 %a0, %t3778
  %t3783 = select i1 %t3782, i64 257, i64 1
  br label %fixmerge928
fixslow927:
  %t3784 = call i64 @rt_num_eq(i64 %a0, i64 %t3778)
  br label %fixmerge928
fixmerge928:
  %t3785 = phi i64 [ %t3783, %fixfast926 ], [ %t3784, %fixslow927 ]
  %t3786 = icmp ne i64 %t3785, 1
  br i1 %t3786, label %then929, label %else930
then929:
  %t3787 = and i64 %self, -8
  %t3788 = inttoptr i64 %t3787 to ptr
  %t3789 = getelementptr i64, ptr %t3788, i64 2
  %t3790 = load i64, ptr %t3789
  ret i64 %t3790
else930:
  %t3791 = and i64 %self, -8
  %t3792 = inttoptr i64 %t3791 to ptr
  %t3793 = getelementptr i64, ptr %t3792, i64 2
  %t3794 = load i64, ptr %t3793
  %t3795 = and i64 %self, -8
  %t3796 = inttoptr i64 %t3795 to ptr
  %t3797 = getelementptr i64, ptr %t3796, i64 4
  %t3798 = load i64, ptr %t3797
  %t3799 = load i64, ptr @"scheme.base:vec-nth"
  call void @rt_check_callable(i64 %t3799)
  %t3800 = and i64 %t3799, -8
  %t3801 = inttoptr i64 %t3800 to ptr
  %t3802 = load i64, ptr %t3801
  %t3803 = inttoptr i64 %t3802 to ptr
  %t3804 = call fastcc i64%t3803(i64 %t3799, i64 2, i64 %t3798, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3805 = and i64 %self, -8
  %t3806 = inttoptr i64 %t3805 to ptr
  %t3807 = getelementptr i64, ptr %t3806, i64 3
  %t3808 = load i64, ptr %t3807
  call void @rt_check_callable(i64 %t3808)
  %t3809 = and i64 %t3808, -8
  %t3810 = inttoptr i64 %t3809 to ptr
  %t3811 = load i64, ptr %t3810
  %t3812 = inttoptr i64 %t3811 to ptr
  %t3813 = call i64 @rt_list_length(i64 %t3804)
  %t3814 = add i64 0, %t3813
  %t3815 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t3804, i64 8)
  %t3827 = getelementptr i64, ptr %t3815, i64 0
  %t3819 = load i64, ptr %t3827
  %t3828 = getelementptr i64, ptr %t3815, i64 1
  %t3820 = load i64, ptr %t3828
  %t3829 = getelementptr i64, ptr %t3815, i64 2
  %t3821 = load i64, ptr %t3829
  %t3830 = getelementptr i64, ptr %t3815, i64 3
  %t3822 = load i64, ptr %t3830
  %t3831 = getelementptr i64, ptr %t3815, i64 4
  %t3823 = load i64, ptr %t3831
  %t3832 = getelementptr i64, ptr %t3815, i64 5
  %t3824 = load i64, ptr %t3832
  %t3833 = getelementptr i64, ptr %t3815, i64 6
  %t3825 = load i64, ptr %t3833
  %t3834 = getelementptr i64, ptr %t3815, i64 7
  %t3826 = load i64, ptr %t3834
  %t3816 = icmp sgt i64 %t3814, 8
  %t3817 = getelementptr i64, ptr %t3815, i64 8
  %t3818 = select i1 %t3816, ptr %t3817, ptr null
  %t3835 = call fastcc i64%t3812(i64 %t3808, i64 %t3814, i64 %t3819, i64 %t3820, i64 %t3821, i64 %t3822, i64 %t3823, i64 %t3824, i64 %t3825, i64 %t3826, ptr %t3818)
  %t3836 = call i64 @rt_vector_set(i64 %t3794, i64 %a0, i64 %t3835)
  %t3837 = or i64 %a0, 8
  %t3838 = and i64 %t3837, 7
  %t3839 = icmp eq i64 %t3838, 0
  br i1 %t3839, label %fixfast931, label %fixslow932
fixfast931:
  %t3840 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3841 = extractvalue {i64, i1} %t3840, 0
  %t3842 = extractvalue {i64, i1} %t3840, 1
  br i1 %t3842, label %fixslow932, label %fixmerge933
fixslow932:
  %t3843 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge933
fixmerge933:
  %t3844 = phi i64 [ %t3841, %fixfast931 ], [ %t3843, %fixslow932 ]
  %t3845 = musttail call fastcc i64 @"scheme.base:code_799"(i64 %self, i64 1, i64 %t3844, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3845
}

define fastcc i64 @"scheme.base:code:vector-map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3846 = icmp sge i64 %argc, 2
  br i1 %t3846, label %argok935, label %arityerr934
arityerr934:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok935:
  %t3847 = call ptr @rt_alloc_words(i64 8)
  %t3848 = getelementptr i64, ptr %t3847, i64 0
  store i64 %a0, ptr %t3848
  %t3849 = getelementptr i64, ptr %t3847, i64 1
  store i64 %a1, ptr %t3849
  %t3850 = getelementptr i64, ptr %t3847, i64 2
  store i64 %a2, ptr %t3850
  %t3851 = getelementptr i64, ptr %t3847, i64 3
  store i64 %a3, ptr %t3851
  %t3852 = getelementptr i64, ptr %t3847, i64 4
  store i64 %a4, ptr %t3852
  %t3853 = getelementptr i64, ptr %t3847, i64 5
  store i64 %a5, ptr %t3853
  %t3854 = getelementptr i64, ptr %t3847, i64 6
  store i64 %a6, ptr %t3854
  %t3855 = getelementptr i64, ptr %t3847, i64 7
  store i64 %a7, ptr %t3855
  %t3856 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3847, ptr %overflow)
  %t3857 = call i64 @rt_null_p(i64 %t3856)
  %t3858 = icmp ne i64 %t3857, 1
  br i1 %t3858, label %then936, label %else937
then936:
  %t3859 = call i64 @rt_vector_length(i64 %a1)
  %t3860 = call i64 @rt_make_vector(i64 %t3859, i64 0)
  %t3861 = call ptr @rt_alloc_words(i64 6)
  %t3862 = ptrtoint ptr %t3861 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_797" to i64), ptr %t3861
  %t3863 = or i64 %t3862, 4
  %t3864 = getelementptr i64, ptr %t3861, i64 1
  store i64 %t3859, ptr %t3864
  %t3865 = getelementptr i64, ptr %t3861, i64 2
  store i64 %t3860, ptr %t3865
  %t3866 = getelementptr i64, ptr %t3861, i64 3
  store i64 %a0, ptr %t3866
  %t3867 = getelementptr i64, ptr %t3861, i64 4
  store i64 %a1, ptr %t3867
  %t3868 = getelementptr i64, ptr %t3861, i64 5
  store i64 %t3863, ptr %t3868
  %t3869 = musttail call fastcc i64 @"scheme.base:code_797"(i64 %t3863, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3869
else937:
  %t3870 = call i64 @rt_cons(i64 %a1, i64 %t3856)
  %t3871 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t3871)
  %t3872 = and i64 %t3871, -8
  %t3873 = inttoptr i64 %t3872 to ptr
  %t3874 = load i64, ptr %t3873
  %t3875 = inttoptr i64 %t3874 to ptr
  %t3876 = call fastcc i64%t3875(i64 %t3871, i64 1, i64 %t3870, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3877 = call i64 @rt_make_vector(i64 %t3876, i64 0)
  %t3878 = call ptr @rt_alloc_words(i64 6)
  %t3879 = ptrtoint ptr %t3878 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_799" to i64), ptr %t3878
  %t3880 = or i64 %t3879, 4
  %t3881 = getelementptr i64, ptr %t3878, i64 1
  store i64 %t3876, ptr %t3881
  %t3882 = getelementptr i64, ptr %t3878, i64 2
  store i64 %t3877, ptr %t3882
  %t3883 = getelementptr i64, ptr %t3878, i64 3
  store i64 %a0, ptr %t3883
  %t3884 = getelementptr i64, ptr %t3878, i64 4
  store i64 %t3870, ptr %t3884
  %t3885 = getelementptr i64, ptr %t3878, i64 5
  store i64 %t3880, ptr %t3885
  %t3886 = musttail call fastcc i64 @"scheme.base:code_799"(i64 %t3880, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3886
}

define fastcc i64 @"scheme.base:code_820"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3891 = icmp eq i64 %argc, 1
  br i1 %t3891, label %argok939, label %arityerr938
arityerr938:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok939:
  %t3892 = and i64 %self, -8
  %t3893 = inttoptr i64 %t3892 to ptr
  %t3894 = getelementptr i64, ptr %t3893, i64 1
  %t3895 = load i64, ptr %t3894
  %t3896 = or i64 %a0, %t3895
  %t3897 = and i64 %t3896, 7
  %t3898 = icmp eq i64 %t3897, 0
  br i1 %t3898, label %fixfast940, label %fixslow941
fixfast940:
  %t3899 = icmp eq i64 %a0, %t3895
  %t3900 = select i1 %t3899, i64 257, i64 1
  br label %fixmerge942
fixslow941:
  %t3901 = call i64 @rt_num_eq(i64 %a0, i64 %t3895)
  br label %fixmerge942
fixmerge942:
  %t3902 = phi i64 [ %t3900, %fixfast940 ], [ %t3901, %fixslow941 ]
  %t3903 = icmp ne i64 %t3902, 1
  br i1 %t3903, label %then943, label %else944
then943:
  %t3904 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t3904)
  %t3905 = and i64 %t3904, -8
  %t3906 = inttoptr i64 %t3905 to ptr
  %t3907 = load i64, ptr %t3906
  %t3908 = inttoptr i64 %t3907 to ptr
  %t3909 = musttail call fastcc i64 %t3908(i64 %t3904, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3909
else944:
  %t3910 = and i64 %self, -8
  %t3911 = inttoptr i64 %t3910 to ptr
  %t3912 = getelementptr i64, ptr %t3911, i64 3
  %t3913 = load i64, ptr %t3912
  %t3914 = call i64 @rt_vector_ref(i64 %t3913, i64 %a0)
  %t3915 = and i64 %self, -8
  %t3916 = inttoptr i64 %t3915 to ptr
  %t3917 = getelementptr i64, ptr %t3916, i64 2
  %t3918 = load i64, ptr %t3917
  call void @rt_check_callable(i64 %t3918)
  %t3919 = and i64 %t3918, -8
  %t3920 = inttoptr i64 %t3919 to ptr
  %t3921 = load i64, ptr %t3920
  %t3922 = inttoptr i64 %t3921 to ptr
  %t3923 = call fastcc i64%t3922(i64 %t3918, i64 1, i64 %t3914, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3924 = or i64 %a0, 8
  %t3925 = and i64 %t3924, 7
  %t3926 = icmp eq i64 %t3925, 0
  br i1 %t3926, label %fixfast945, label %fixslow946
fixfast945:
  %t3927 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3928 = extractvalue {i64, i1} %t3927, 0
  %t3929 = extractvalue {i64, i1} %t3927, 1
  br i1 %t3929, label %fixslow946, label %fixmerge947
fixslow946:
  %t3930 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge947
fixmerge947:
  %t3931 = phi i64 [ %t3928, %fixfast945 ], [ %t3930, %fixslow946 ]
  %t3932 = musttail call fastcc i64 @"scheme.base:code_820"(i64 %self, i64 1, i64 %t3931, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3932
}

define fastcc i64 @"scheme.base:code_822"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3933 = icmp eq i64 %argc, 1
  br i1 %t3933, label %argok949, label %arityerr948
arityerr948:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok949:
  %t3934 = and i64 %self, -8
  %t3935 = inttoptr i64 %t3934 to ptr
  %t3936 = getelementptr i64, ptr %t3935, i64 1
  %t3937 = load i64, ptr %t3936
  %t3938 = or i64 %a0, %t3937
  %t3939 = and i64 %t3938, 7
  %t3940 = icmp eq i64 %t3939, 0
  br i1 %t3940, label %fixfast950, label %fixslow951
fixfast950:
  %t3941 = icmp eq i64 %a0, %t3937
  %t3942 = select i1 %t3941, i64 257, i64 1
  br label %fixmerge952
fixslow951:
  %t3943 = call i64 @rt_num_eq(i64 %a0, i64 %t3937)
  br label %fixmerge952
fixmerge952:
  %t3944 = phi i64 [ %t3942, %fixfast950 ], [ %t3943, %fixslow951 ]
  %t3945 = icmp ne i64 %t3944, 1
  br i1 %t3945, label %then953, label %else954
then953:
  %t3946 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t3946)
  %t3947 = and i64 %t3946, -8
  %t3948 = inttoptr i64 %t3947 to ptr
  %t3949 = load i64, ptr %t3948
  %t3950 = inttoptr i64 %t3949 to ptr
  %t3951 = musttail call fastcc i64 %t3950(i64 %t3946, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3951
else954:
  %t3952 = and i64 %self, -8
  %t3953 = inttoptr i64 %t3952 to ptr
  %t3954 = getelementptr i64, ptr %t3953, i64 3
  %t3955 = load i64, ptr %t3954
  %t3956 = load i64, ptr @"scheme.base:vec-nth"
  call void @rt_check_callable(i64 %t3956)
  %t3957 = and i64 %t3956, -8
  %t3958 = inttoptr i64 %t3957 to ptr
  %t3959 = load i64, ptr %t3958
  %t3960 = inttoptr i64 %t3959 to ptr
  %t3961 = call fastcc i64%t3960(i64 %t3956, i64 2, i64 %t3955, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3962 = and i64 %self, -8
  %t3963 = inttoptr i64 %t3962 to ptr
  %t3964 = getelementptr i64, ptr %t3963, i64 2
  %t3965 = load i64, ptr %t3964
  call void @rt_check_callable(i64 %t3965)
  %t3966 = and i64 %t3965, -8
  %t3967 = inttoptr i64 %t3966 to ptr
  %t3968 = load i64, ptr %t3967
  %t3969 = inttoptr i64 %t3968 to ptr
  %t3970 = call i64 @rt_list_length(i64 %t3961)
  %t3971 = add i64 0, %t3970
  %t3972 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t3961, i64 8)
  %t3984 = getelementptr i64, ptr %t3972, i64 0
  %t3976 = load i64, ptr %t3984
  %t3985 = getelementptr i64, ptr %t3972, i64 1
  %t3977 = load i64, ptr %t3985
  %t3986 = getelementptr i64, ptr %t3972, i64 2
  %t3978 = load i64, ptr %t3986
  %t3987 = getelementptr i64, ptr %t3972, i64 3
  %t3979 = load i64, ptr %t3987
  %t3988 = getelementptr i64, ptr %t3972, i64 4
  %t3980 = load i64, ptr %t3988
  %t3989 = getelementptr i64, ptr %t3972, i64 5
  %t3981 = load i64, ptr %t3989
  %t3990 = getelementptr i64, ptr %t3972, i64 6
  %t3982 = load i64, ptr %t3990
  %t3991 = getelementptr i64, ptr %t3972, i64 7
  %t3983 = load i64, ptr %t3991
  %t3973 = icmp sgt i64 %t3971, 8
  %t3974 = getelementptr i64, ptr %t3972, i64 8
  %t3975 = select i1 %t3973, ptr %t3974, ptr null
  %t3992 = call fastcc i64%t3969(i64 %t3965, i64 %t3971, i64 %t3976, i64 %t3977, i64 %t3978, i64 %t3979, i64 %t3980, i64 %t3981, i64 %t3982, i64 %t3983, ptr %t3975)
  %t3993 = or i64 %a0, 8
  %t3994 = and i64 %t3993, 7
  %t3995 = icmp eq i64 %t3994, 0
  br i1 %t3995, label %fixfast955, label %fixslow956
fixfast955:
  %t3996 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3997 = extractvalue {i64, i1} %t3996, 0
  %t3998 = extractvalue {i64, i1} %t3996, 1
  br i1 %t3998, label %fixslow956, label %fixmerge957
fixslow956:
  %t3999 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge957
fixmerge957:
  %t4000 = phi i64 [ %t3997, %fixfast955 ], [ %t3999, %fixslow956 ]
  %t4001 = musttail call fastcc i64 @"scheme.base:code_822"(i64 %self, i64 1, i64 %t4000, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4001
}

define fastcc i64 @"scheme.base:code:vector-for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4002 = icmp sge i64 %argc, 2
  br i1 %t4002, label %argok959, label %arityerr958
arityerr958:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok959:
  %t4003 = call ptr @rt_alloc_words(i64 8)
  %t4004 = getelementptr i64, ptr %t4003, i64 0
  store i64 %a0, ptr %t4004
  %t4005 = getelementptr i64, ptr %t4003, i64 1
  store i64 %a1, ptr %t4005
  %t4006 = getelementptr i64, ptr %t4003, i64 2
  store i64 %a2, ptr %t4006
  %t4007 = getelementptr i64, ptr %t4003, i64 3
  store i64 %a3, ptr %t4007
  %t4008 = getelementptr i64, ptr %t4003, i64 4
  store i64 %a4, ptr %t4008
  %t4009 = getelementptr i64, ptr %t4003, i64 5
  store i64 %a5, ptr %t4009
  %t4010 = getelementptr i64, ptr %t4003, i64 6
  store i64 %a6, ptr %t4010
  %t4011 = getelementptr i64, ptr %t4003, i64 7
  store i64 %a7, ptr %t4011
  %t4012 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t4003, ptr %overflow)
  %t4013 = call i64 @rt_null_p(i64 %t4012)
  %t4014 = icmp ne i64 %t4013, 1
  br i1 %t4014, label %then960, label %else961
then960:
  %t4015 = call i64 @rt_vector_length(i64 %a1)
  %t4016 = call ptr @rt_alloc_words(i64 5)
  %t4017 = ptrtoint ptr %t4016 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_820" to i64), ptr %t4016
  %t4018 = or i64 %t4017, 4
  %t4019 = getelementptr i64, ptr %t4016, i64 1
  store i64 %t4015, ptr %t4019
  %t4020 = getelementptr i64, ptr %t4016, i64 2
  store i64 %a0, ptr %t4020
  %t4021 = getelementptr i64, ptr %t4016, i64 3
  store i64 %a1, ptr %t4021
  %t4022 = getelementptr i64, ptr %t4016, i64 4
  store i64 %t4018, ptr %t4022
  %t4023 = musttail call fastcc i64 @"scheme.base:code_820"(i64 %t4018, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4023
else961:
  %t4024 = call i64 @rt_cons(i64 %a1, i64 %t4012)
  %t4025 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t4025)
  %t4026 = and i64 %t4025, -8
  %t4027 = inttoptr i64 %t4026 to ptr
  %t4028 = load i64, ptr %t4027
  %t4029 = inttoptr i64 %t4028 to ptr
  %t4030 = call fastcc i64%t4029(i64 %t4025, i64 1, i64 %t4024, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4031 = call ptr @rt_alloc_words(i64 5)
  %t4032 = ptrtoint ptr %t4031 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_822" to i64), ptr %t4031
  %t4033 = or i64 %t4032, 4
  %t4034 = getelementptr i64, ptr %t4031, i64 1
  store i64 %t4030, ptr %t4034
  %t4035 = getelementptr i64, ptr %t4031, i64 2
  store i64 %a0, ptr %t4035
  %t4036 = getelementptr i64, ptr %t4031, i64 3
  store i64 %t4024, ptr %t4036
  %t4037 = getelementptr i64, ptr %t4031, i64 4
  store i64 %t4033, ptr %t4037
  %t4038 = musttail call fastcc i64 @"scheme.base:code_822"(i64 %t4033, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4038
}

define fastcc i64 @"scheme.base:code:vec-min-len"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4043 = icmp eq i64 %argc, 1
  br i1 %t4043, label %argok963, label %arityerr962
arityerr962:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok963:
  %t4044 = call i64 @rt_cdr(i64 %a0)
  %t4045 = call i64 @rt_null_p(i64 %t4044)
  %t4046 = icmp ne i64 %t4045, 1
  br i1 %t4046, label %then964, label %else965
then964:
  %t4047 = call i64 @rt_car(i64 %a0)
  %t4048 = call i64 @rt_vector_length(i64 %t4047)
  ret i64 %t4048
else965:
  %t4049 = call i64 @rt_car(i64 %a0)
  %t4050 = call i64 @rt_vector_length(i64 %t4049)
  %t4051 = call i64 @rt_cdr(i64 %a0)
  %t4052 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t4052)
  %t4053 = and i64 %t4052, -8
  %t4054 = inttoptr i64 %t4053 to ptr
  %t4055 = load i64, ptr %t4054
  %t4056 = inttoptr i64 %t4055 to ptr
  %t4057 = call fastcc i64%t4056(i64 %t4052, i64 1, i64 %t4051, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4058 = or i64 %t4050, %t4057
  %t4059 = and i64 %t4058, 7
  %t4060 = icmp eq i64 %t4059, 0
  br i1 %t4060, label %fixfast966, label %fixslow967
fixfast966:
  %t4061 = icmp slt i64 %t4050, %t4057
  %t4062 = select i1 %t4061, i64 257, i64 1
  br label %fixmerge968
fixslow967:
  %t4063 = call i64 @rt_lt(i64 %t4050, i64 %t4057)
  br label %fixmerge968
fixmerge968:
  %t4064 = phi i64 [ %t4062, %fixfast966 ], [ %t4063, %fixslow967 ]
  %t4065 = icmp ne i64 %t4064, 1
  br i1 %t4065, label %then969, label %else970
then969:
  ret i64 %t4050
else970:
  ret i64 %t4057
}

define fastcc i64 @"scheme.base:code:vec-nth"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4070 = icmp eq i64 %argc, 2
  br i1 %t4070, label %argok972, label %arityerr971
arityerr971:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok972:
  %t4071 = call i64 @rt_null_p(i64 %a0)
  %t4072 = icmp ne i64 %t4071, 1
  br i1 %t4072, label %then973, label %else974
then973:
  ret i64 2
else974:
  %t4073 = call i64 @rt_car(i64 %a0)
  %t4074 = call i64 @rt_vector_ref(i64 %t4073, i64 %a1)
  %t4075 = call i64 @rt_cdr(i64 %a0)
  %t4076 = load i64, ptr @"scheme.base:vec-nth"
  call void @rt_check_callable(i64 %t4076)
  %t4077 = and i64 %t4076, -8
  %t4078 = inttoptr i64 %t4077 to ptr
  %t4079 = load i64, ptr %t4078
  %t4080 = inttoptr i64 %t4079 to ptr
  %t4081 = call fastcc i64%t4080(i64 %t4076, i64 2, i64 %t4075, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4082 = call i64 @rt_cons(i64 %t4074, i64 %t4081)
  ret i64 %t4082
}

define fastcc i64 @"scheme.base:code_848"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4087 = icmp eq i64 %argc, 1
  br i1 %t4087, label %argok976, label %arityerr975
arityerr975:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok976:
  %t4088 = and i64 %self, -8
  %t4089 = inttoptr i64 %t4088 to ptr
  %t4090 = getelementptr i64, ptr %t4089, i64 1
  %t4091 = load i64, ptr %t4090
  %t4092 = or i64 %a0, %t4091
  %t4093 = and i64 %t4092, 7
  %t4094 = icmp eq i64 %t4093, 0
  br i1 %t4094, label %fixfast977, label %fixslow978
fixfast977:
  %t4095 = icmp eq i64 %a0, %t4091
  %t4096 = select i1 %t4095, i64 257, i64 1
  br label %fixmerge979
fixslow978:
  %t4097 = call i64 @rt_num_eq(i64 %a0, i64 %t4091)
  br label %fixmerge979
fixmerge979:
  %t4098 = phi i64 [ %t4096, %fixfast977 ], [ %t4097, %fixslow978 ]
  %t4099 = icmp ne i64 %t4098, 1
  br i1 %t4099, label %then980, label %else981
then980:
  %t4100 = and i64 %self, -8
  %t4101 = inttoptr i64 %t4100 to ptr
  %t4102 = getelementptr i64, ptr %t4101, i64 2
  %t4103 = load i64, ptr %t4102
  ret i64 %t4103
else981:
  %t4104 = and i64 %self, -8
  %t4105 = inttoptr i64 %t4104 to ptr
  %t4106 = getelementptr i64, ptr %t4105, i64 2
  %t4107 = load i64, ptr %t4106
  %t4108 = and i64 %self, -8
  %t4109 = inttoptr i64 %t4108 to ptr
  %t4110 = getelementptr i64, ptr %t4109, i64 3
  %t4111 = load i64, ptr %t4110
  %t4112 = or i64 %a0, %t4111
  %t4113 = and i64 %t4112, 7
  %t4114 = icmp eq i64 %t4113, 0
  br i1 %t4114, label %fixfast982, label %fixslow983
fixfast982:
  %t4115 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t4111)
  %t4116 = extractvalue {i64, i1} %t4115, 0
  %t4117 = extractvalue {i64, i1} %t4115, 1
  br i1 %t4117, label %fixslow983, label %fixmerge984
fixslow983:
  %t4118 = call i64 @rt_sub(i64 %a0, i64 %t4111)
  br label %fixmerge984
fixmerge984:
  %t4119 = phi i64 [ %t4116, %fixfast982 ], [ %t4118, %fixslow983 ]
  %t4120 = and i64 %self, -8
  %t4121 = inttoptr i64 %t4120 to ptr
  %t4122 = getelementptr i64, ptr %t4121, i64 4
  %t4123 = load i64, ptr %t4122
  %t4124 = call i64 @rt_string_ref(i64 %t4123, i64 %a0)
  %t4125 = call i64 @rt_vector_set(i64 %t4107, i64 %t4119, i64 %t4124)
  %t4126 = or i64 %a0, 8
  %t4127 = and i64 %t4126, 7
  %t4128 = icmp eq i64 %t4127, 0
  br i1 %t4128, label %fixfast985, label %fixslow986
fixfast985:
  %t4129 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4130 = extractvalue {i64, i1} %t4129, 0
  %t4131 = extractvalue {i64, i1} %t4129, 1
  br i1 %t4131, label %fixslow986, label %fixmerge987
fixslow986:
  %t4132 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge987
fixmerge987:
  %t4133 = phi i64 [ %t4130, %fixfast985 ], [ %t4132, %fixslow986 ]
  %t4134 = musttail call fastcc i64 @"scheme.base:code_848"(i64 %self, i64 1, i64 %t4133, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4134
}

define fastcc i64 @"scheme.base:code:string->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4135 = icmp sge i64 %argc, 1
  br i1 %t4135, label %argok989, label %arityerr988
arityerr988:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok989:
  %t4136 = call ptr @rt_alloc_words(i64 8)
  %t4137 = getelementptr i64, ptr %t4136, i64 0
  store i64 %a0, ptr %t4137
  %t4138 = getelementptr i64, ptr %t4136, i64 1
  store i64 %a1, ptr %t4138
  %t4139 = getelementptr i64, ptr %t4136, i64 2
  store i64 %a2, ptr %t4139
  %t4140 = getelementptr i64, ptr %t4136, i64 3
  store i64 %a3, ptr %t4140
  %t4141 = getelementptr i64, ptr %t4136, i64 4
  store i64 %a4, ptr %t4141
  %t4142 = getelementptr i64, ptr %t4136, i64 5
  store i64 %a5, ptr %t4142
  %t4143 = getelementptr i64, ptr %t4136, i64 6
  store i64 %a6, ptr %t4143
  %t4144 = getelementptr i64, ptr %t4136, i64 7
  store i64 %a7, ptr %t4144
  %t4145 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t4136, ptr %overflow)
  %t4146 = call i64 @rt_string_length(i64 %a0)
  %t4147 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4147)
  %t4148 = and i64 %t4147, -8
  %t4149 = inttoptr i64 %t4148 to ptr
  %t4150 = load i64, ptr %t4149
  %t4151 = inttoptr i64 %t4150 to ptr
  %t4152 = call fastcc i64%t4151(i64 %t4147, i64 1, i64 %t4145, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4153 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4153)
  %t4154 = and i64 %t4153, -8
  %t4155 = inttoptr i64 %t4154 to ptr
  %t4156 = load i64, ptr %t4155
  %t4157 = inttoptr i64 %t4156 to ptr
  %t4158 = call fastcc i64%t4157(i64 %t4153, i64 2, i64 %t4145, i64 %t4146, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4159 = call i64 @rt_intern(ptr @.str.sym.18)
  %t4160 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4160)
  %t4161 = and i64 %t4160, -8
  %t4162 = inttoptr i64 %t4161 to ptr
  %t4163 = load i64, ptr %t4162
  %t4164 = inttoptr i64 %t4163 to ptr
  %t4165 = call fastcc i64%t4164(i64 %t4160, i64 4, i64 %t4159, i64 %t4152, i64 %t4158, i64 %t4146, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4166 = or i64 %t4158, %t4152
  %t4167 = and i64 %t4166, 7
  %t4168 = icmp eq i64 %t4167, 0
  br i1 %t4168, label %fixfast990, label %fixslow991
fixfast990:
  %t4169 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4158, i64 %t4152)
  %t4170 = extractvalue {i64, i1} %t4169, 0
  %t4171 = extractvalue {i64, i1} %t4169, 1
  br i1 %t4171, label %fixslow991, label %fixmerge992
fixslow991:
  %t4172 = call i64 @rt_sub(i64 %t4158, i64 %t4152)
  br label %fixmerge992
fixmerge992:
  %t4173 = phi i64 [ %t4170, %fixfast990 ], [ %t4172, %fixslow991 ]
  %t4174 = call i64 @rt_make_vector(i64 %t4173, i64 0)
  %t4175 = call ptr @rt_alloc_words(i64 6)
  %t4176 = ptrtoint ptr %t4175 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_848" to i64), ptr %t4175
  %t4177 = or i64 %t4176, 4
  %t4178 = getelementptr i64, ptr %t4175, i64 1
  store i64 %t4158, ptr %t4178
  %t4179 = getelementptr i64, ptr %t4175, i64 2
  store i64 %t4174, ptr %t4179
  %t4180 = getelementptr i64, ptr %t4175, i64 3
  store i64 %t4152, ptr %t4180
  %t4181 = getelementptr i64, ptr %t4175, i64 4
  store i64 %a0, ptr %t4181
  %t4182 = getelementptr i64, ptr %t4175, i64 5
  store i64 %t4177, ptr %t4182
  %t4183 = musttail call fastcc i64 @"scheme.base:code_848"(i64 %t4177, i64 1, i64 %t4152, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4183
}

define fastcc i64 @"scheme.base:code:vector->string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4188 = icmp sge i64 %argc, 1
  br i1 %t4188, label %argok994, label %arityerr993
arityerr993:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok994:
  %t4189 = call ptr @rt_alloc_words(i64 8)
  %t4190 = getelementptr i64, ptr %t4189, i64 0
  store i64 %a0, ptr %t4190
  %t4191 = getelementptr i64, ptr %t4189, i64 1
  store i64 %a1, ptr %t4191
  %t4192 = getelementptr i64, ptr %t4189, i64 2
  store i64 %a2, ptr %t4192
  %t4193 = getelementptr i64, ptr %t4189, i64 3
  store i64 %a3, ptr %t4193
  %t4194 = getelementptr i64, ptr %t4189, i64 4
  store i64 %a4, ptr %t4194
  %t4195 = getelementptr i64, ptr %t4189, i64 5
  store i64 %a5, ptr %t4195
  %t4196 = getelementptr i64, ptr %t4189, i64 6
  store i64 %a6, ptr %t4196
  %t4197 = getelementptr i64, ptr %t4189, i64 7
  store i64 %a7, ptr %t4197
  %t4198 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t4189, ptr %overflow)
  %t4199 = call i64 @rt_vector_length(i64 %a0)
  %t4200 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4200)
  %t4201 = and i64 %t4200, -8
  %t4202 = inttoptr i64 %t4201 to ptr
  %t4203 = load i64, ptr %t4202
  %t4204 = inttoptr i64 %t4203 to ptr
  %t4205 = call fastcc i64%t4204(i64 %t4200, i64 1, i64 %t4198, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4206 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4206)
  %t4207 = and i64 %t4206, -8
  %t4208 = inttoptr i64 %t4207 to ptr
  %t4209 = load i64, ptr %t4208
  %t4210 = inttoptr i64 %t4209 to ptr
  %t4211 = call fastcc i64%t4210(i64 %t4206, i64 2, i64 %t4198, i64 %t4199, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4212 = call i64 @rt_intern(ptr @.str.sym.19)
  %t4213 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4213)
  %t4214 = and i64 %t4213, -8
  %t4215 = inttoptr i64 %t4214 to ptr
  %t4216 = load i64, ptr %t4215
  %t4217 = inttoptr i64 %t4216 to ptr
  %t4218 = call fastcc i64%t4217(i64 %t4213, i64 4, i64 %t4212, i64 %t4205, i64 %t4211, i64 %t4199, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4219 = load i64, ptr @"scheme.base:vector->list"
  call void @rt_check_callable(i64 %t4219)
  %t4220 = and i64 %t4219, -8
  %t4221 = inttoptr i64 %t4220 to ptr
  %t4222 = load i64, ptr %t4221
  %t4223 = inttoptr i64 %t4222 to ptr
  %t4224 = call fastcc i64%t4223(i64 %t4219, i64 3, i64 %a0, i64 %t4205, i64 %t4211, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4225 = call i64 @rt_list_to_string(i64 %t4224)
  ret i64 %t4225
}

define fastcc i64 @"scheme.base:code:string-map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4230 = icmp sge i64 %argc, 2
  br i1 %t4230, label %argok996, label %arityerr995
arityerr995:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok996:
  %t4231 = call ptr @rt_alloc_words(i64 8)
  %t4232 = getelementptr i64, ptr %t4231, i64 0
  store i64 %a0, ptr %t4232
  %t4233 = getelementptr i64, ptr %t4231, i64 1
  store i64 %a1, ptr %t4233
  %t4234 = getelementptr i64, ptr %t4231, i64 2
  store i64 %a2, ptr %t4234
  %t4235 = getelementptr i64, ptr %t4231, i64 3
  store i64 %a3, ptr %t4235
  %t4236 = getelementptr i64, ptr %t4231, i64 4
  store i64 %a4, ptr %t4236
  %t4237 = getelementptr i64, ptr %t4231, i64 5
  store i64 %a5, ptr %t4237
  %t4238 = getelementptr i64, ptr %t4231, i64 6
  store i64 %a6, ptr %t4238
  %t4239 = getelementptr i64, ptr %t4231, i64 7
  store i64 %a7, ptr %t4239
  %t4240 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t4231, ptr %overflow)
  %t4241 = call i64 @rt_null_p(i64 %t4240)
  %t4242 = icmp ne i64 %t4241, 1
  br i1 %t4242, label %then997, label %else998
then997:
  %t4243 = load i64, ptr @"scheme.base:string->list"
  call void @rt_check_callable(i64 %t4243)
  %t4244 = and i64 %t4243, -8
  %t4245 = inttoptr i64 %t4244 to ptr
  %t4246 = load i64, ptr %t4245
  %t4247 = inttoptr i64 %t4246 to ptr
  %t4248 = call fastcc i64%t4247(i64 %t4243, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4249 = load i64, ptr @"scheme.base:str-map1"
  call void @rt_check_callable(i64 %t4249)
  %t4250 = and i64 %t4249, -8
  %t4251 = inttoptr i64 %t4250 to ptr
  %t4252 = load i64, ptr %t4251
  %t4253 = inttoptr i64 %t4252 to ptr
  %t4254 = call fastcc i64%t4253(i64 %t4249, i64 2, i64 %a0, i64 %t4248, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4255 = call i64 @rt_list_to_string(i64 %t4254)
  ret i64 %t4255
else998:
  %t4256 = call i64 @rt_cons(i64 %a1, i64 %t4240)
  %t4257 = load i64, ptr @"scheme.base:str-mapn"
  call void @rt_check_callable(i64 %t4257)
  %t4258 = and i64 %t4257, -8
  %t4259 = inttoptr i64 %t4258 to ptr
  %t4260 = load i64, ptr %t4259
  %t4261 = inttoptr i64 %t4260 to ptr
  %t4262 = call fastcc i64%t4261(i64 %t4257, i64 2, i64 %a0, i64 %t4256, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4263 = call i64 @rt_list_to_string(i64 %t4262)
  ret i64 %t4263
}

define fastcc i64 @"scheme.base:code:str-map1"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4268 = icmp eq i64 %argc, 2
  br i1 %t4268, label %argok1000, label %arityerr999
arityerr999:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1000:
  %t4269 = call i64 @rt_null_p(i64 %a1)
  %t4270 = icmp ne i64 %t4269, 1
  br i1 %t4270, label %then1001, label %else1002
then1001:
  ret i64 2
else1002:
  %t4271 = call i64 @rt_car(i64 %a1)
  call void @rt_check_callable(i64 %a0)
  %t4272 = and i64 %a0, -8
  %t4273 = inttoptr i64 %t4272 to ptr
  %t4274 = load i64, ptr %t4273
  %t4275 = inttoptr i64 %t4274 to ptr
  %t4276 = call fastcc i64%t4275(i64 %a0, i64 1, i64 %t4271, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4277 = call i64 @rt_cdr(i64 %a1)
  %t4278 = load i64, ptr @"scheme.base:str-map1"
  call void @rt_check_callable(i64 %t4278)
  %t4279 = and i64 %t4278, -8
  %t4280 = inttoptr i64 %t4279 to ptr
  %t4281 = load i64, ptr %t4280
  %t4282 = inttoptr i64 %t4281 to ptr
  %t4283 = call fastcc i64%t4282(i64 %t4278, i64 2, i64 %a0, i64 %t4277, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4284 = call i64 @rt_cons(i64 %t4276, i64 %t4283)
  ret i64 %t4284
}

define fastcc i64 @"scheme.base:code_873"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4289 = icmp eq i64 %argc, 1
  br i1 %t4289, label %argok1004, label %arityerr1003
arityerr1003:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1004:
  %t4290 = and i64 %self, -8
  %t4291 = inttoptr i64 %t4290 to ptr
  %t4292 = getelementptr i64, ptr %t4291, i64 1
  %t4293 = load i64, ptr %t4292
  %t4294 = or i64 %a0, %t4293
  %t4295 = and i64 %t4294, 7
  %t4296 = icmp eq i64 %t4295, 0
  br i1 %t4296, label %fixfast1005, label %fixslow1006
fixfast1005:
  %t4297 = icmp eq i64 %a0, %t4293
  %t4298 = select i1 %t4297, i64 257, i64 1
  br label %fixmerge1007
fixslow1006:
  %t4299 = call i64 @rt_num_eq(i64 %a0, i64 %t4293)
  br label %fixmerge1007
fixmerge1007:
  %t4300 = phi i64 [ %t4298, %fixfast1005 ], [ %t4299, %fixslow1006 ]
  %t4301 = icmp ne i64 %t4300, 1
  br i1 %t4301, label %then1008, label %else1009
then1008:
  ret i64 2
else1009:
  %t4302 = and i64 %self, -8
  %t4303 = inttoptr i64 %t4302 to ptr
  %t4304 = getelementptr i64, ptr %t4303, i64 3
  %t4305 = load i64, ptr %t4304
  %t4306 = load i64, ptr @"scheme.base:str-nth"
  call void @rt_check_callable(i64 %t4306)
  %t4307 = and i64 %t4306, -8
  %t4308 = inttoptr i64 %t4307 to ptr
  %t4309 = load i64, ptr %t4308
  %t4310 = inttoptr i64 %t4309 to ptr
  %t4311 = call fastcc i64%t4310(i64 %t4306, i64 2, i64 %t4305, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4312 = and i64 %self, -8
  %t4313 = inttoptr i64 %t4312 to ptr
  %t4314 = getelementptr i64, ptr %t4313, i64 2
  %t4315 = load i64, ptr %t4314
  call void @rt_check_callable(i64 %t4315)
  %t4316 = and i64 %t4315, -8
  %t4317 = inttoptr i64 %t4316 to ptr
  %t4318 = load i64, ptr %t4317
  %t4319 = inttoptr i64 %t4318 to ptr
  %t4320 = call i64 @rt_list_length(i64 %t4311)
  %t4321 = add i64 0, %t4320
  %t4322 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t4311, i64 8)
  %t4334 = getelementptr i64, ptr %t4322, i64 0
  %t4326 = load i64, ptr %t4334
  %t4335 = getelementptr i64, ptr %t4322, i64 1
  %t4327 = load i64, ptr %t4335
  %t4336 = getelementptr i64, ptr %t4322, i64 2
  %t4328 = load i64, ptr %t4336
  %t4337 = getelementptr i64, ptr %t4322, i64 3
  %t4329 = load i64, ptr %t4337
  %t4338 = getelementptr i64, ptr %t4322, i64 4
  %t4330 = load i64, ptr %t4338
  %t4339 = getelementptr i64, ptr %t4322, i64 5
  %t4331 = load i64, ptr %t4339
  %t4340 = getelementptr i64, ptr %t4322, i64 6
  %t4332 = load i64, ptr %t4340
  %t4341 = getelementptr i64, ptr %t4322, i64 7
  %t4333 = load i64, ptr %t4341
  %t4323 = icmp sgt i64 %t4321, 8
  %t4324 = getelementptr i64, ptr %t4322, i64 8
  %t4325 = select i1 %t4323, ptr %t4324, ptr null
  %t4342 = call fastcc i64%t4319(i64 %t4315, i64 %t4321, i64 %t4326, i64 %t4327, i64 %t4328, i64 %t4329, i64 %t4330, i64 %t4331, i64 %t4332, i64 %t4333, ptr %t4325)
  %t4343 = or i64 %a0, 8
  %t4344 = and i64 %t4343, 7
  %t4345 = icmp eq i64 %t4344, 0
  br i1 %t4345, label %fixfast1010, label %fixslow1011
fixfast1010:
  %t4346 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4347 = extractvalue {i64, i1} %t4346, 0
  %t4348 = extractvalue {i64, i1} %t4346, 1
  br i1 %t4348, label %fixslow1011, label %fixmerge1012
fixslow1011:
  %t4349 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1012
fixmerge1012:
  %t4350 = phi i64 [ %t4347, %fixfast1010 ], [ %t4349, %fixslow1011 ]
  %t4351 = call fastcc i64 @"scheme.base:code_873"(i64 %self, i64 1, i64 %t4350, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4352 = call i64 @rt_cons(i64 %t4342, i64 %t4351)
  ret i64 %t4352
}

define fastcc i64 @"scheme.base:code:str-mapn"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4353 = icmp eq i64 %argc, 2
  br i1 %t4353, label %argok1014, label %arityerr1013
arityerr1013:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1014:
  %t4354 = load i64, ptr @"scheme.base:str-min-len"
  call void @rt_check_callable(i64 %t4354)
  %t4355 = and i64 %t4354, -8
  %t4356 = inttoptr i64 %t4355 to ptr
  %t4357 = load i64, ptr %t4356
  %t4358 = inttoptr i64 %t4357 to ptr
  %t4359 = call fastcc i64%t4358(i64 %t4354, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4360 = call ptr @rt_alloc_words(i64 5)
  %t4361 = ptrtoint ptr %t4360 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_873" to i64), ptr %t4360
  %t4362 = or i64 %t4361, 4
  %t4363 = getelementptr i64, ptr %t4360, i64 1
  store i64 %t4359, ptr %t4363
  %t4364 = getelementptr i64, ptr %t4360, i64 2
  store i64 %a0, ptr %t4364
  %t4365 = getelementptr i64, ptr %t4360, i64 3
  store i64 %a1, ptr %t4365
  %t4366 = getelementptr i64, ptr %t4360, i64 4
  store i64 %t4362, ptr %t4366
  %t4367 = musttail call fastcc i64 @"scheme.base:code_873"(i64 %t4362, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4367
}

define fastcc i64 @"scheme.base:code_894"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4372 = icmp eq i64 %argc, 1
  br i1 %t4372, label %argok1016, label %arityerr1015
arityerr1015:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1016:
  %t4373 = and i64 %self, -8
  %t4374 = inttoptr i64 %t4373 to ptr
  %t4375 = getelementptr i64, ptr %t4374, i64 1
  %t4376 = load i64, ptr %t4375
  %t4377 = or i64 %a0, %t4376
  %t4378 = and i64 %t4377, 7
  %t4379 = icmp eq i64 %t4378, 0
  br i1 %t4379, label %fixfast1017, label %fixslow1018
fixfast1017:
  %t4380 = icmp eq i64 %a0, %t4376
  %t4381 = select i1 %t4380, i64 257, i64 1
  br label %fixmerge1019
fixslow1018:
  %t4382 = call i64 @rt_num_eq(i64 %a0, i64 %t4376)
  br label %fixmerge1019
fixmerge1019:
  %t4383 = phi i64 [ %t4381, %fixfast1017 ], [ %t4382, %fixslow1018 ]
  %t4384 = icmp ne i64 %t4383, 1
  br i1 %t4384, label %then1020, label %else1021
then1020:
  %t4385 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4385)
  %t4386 = and i64 %t4385, -8
  %t4387 = inttoptr i64 %t4386 to ptr
  %t4388 = load i64, ptr %t4387
  %t4389 = inttoptr i64 %t4388 to ptr
  %t4390 = musttail call fastcc i64 %t4389(i64 %t4385, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4390
else1021:
  %t4391 = and i64 %self, -8
  %t4392 = inttoptr i64 %t4391 to ptr
  %t4393 = getelementptr i64, ptr %t4392, i64 3
  %t4394 = load i64, ptr %t4393
  %t4395 = call i64 @rt_string_ref(i64 %t4394, i64 %a0)
  %t4396 = and i64 %self, -8
  %t4397 = inttoptr i64 %t4396 to ptr
  %t4398 = getelementptr i64, ptr %t4397, i64 2
  %t4399 = load i64, ptr %t4398
  call void @rt_check_callable(i64 %t4399)
  %t4400 = and i64 %t4399, -8
  %t4401 = inttoptr i64 %t4400 to ptr
  %t4402 = load i64, ptr %t4401
  %t4403 = inttoptr i64 %t4402 to ptr
  %t4404 = call fastcc i64%t4403(i64 %t4399, i64 1, i64 %t4395, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4405 = or i64 %a0, 8
  %t4406 = and i64 %t4405, 7
  %t4407 = icmp eq i64 %t4406, 0
  br i1 %t4407, label %fixfast1022, label %fixslow1023
fixfast1022:
  %t4408 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4409 = extractvalue {i64, i1} %t4408, 0
  %t4410 = extractvalue {i64, i1} %t4408, 1
  br i1 %t4410, label %fixslow1023, label %fixmerge1024
fixslow1023:
  %t4411 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1024
fixmerge1024:
  %t4412 = phi i64 [ %t4409, %fixfast1022 ], [ %t4411, %fixslow1023 ]
  %t4413 = musttail call fastcc i64 @"scheme.base:code_894"(i64 %self, i64 1, i64 %t4412, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4413
}

define fastcc i64 @"scheme.base:code_896"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4414 = icmp eq i64 %argc, 1
  br i1 %t4414, label %argok1026, label %arityerr1025
arityerr1025:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1026:
  %t4415 = and i64 %self, -8
  %t4416 = inttoptr i64 %t4415 to ptr
  %t4417 = getelementptr i64, ptr %t4416, i64 1
  %t4418 = load i64, ptr %t4417
  %t4419 = or i64 %a0, %t4418
  %t4420 = and i64 %t4419, 7
  %t4421 = icmp eq i64 %t4420, 0
  br i1 %t4421, label %fixfast1027, label %fixslow1028
fixfast1027:
  %t4422 = icmp eq i64 %a0, %t4418
  %t4423 = select i1 %t4422, i64 257, i64 1
  br label %fixmerge1029
fixslow1028:
  %t4424 = call i64 @rt_num_eq(i64 %a0, i64 %t4418)
  br label %fixmerge1029
fixmerge1029:
  %t4425 = phi i64 [ %t4423, %fixfast1027 ], [ %t4424, %fixslow1028 ]
  %t4426 = icmp ne i64 %t4425, 1
  br i1 %t4426, label %then1030, label %else1031
then1030:
  %t4427 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4427)
  %t4428 = and i64 %t4427, -8
  %t4429 = inttoptr i64 %t4428 to ptr
  %t4430 = load i64, ptr %t4429
  %t4431 = inttoptr i64 %t4430 to ptr
  %t4432 = musttail call fastcc i64 %t4431(i64 %t4427, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4432
else1031:
  %t4433 = and i64 %self, -8
  %t4434 = inttoptr i64 %t4433 to ptr
  %t4435 = getelementptr i64, ptr %t4434, i64 3
  %t4436 = load i64, ptr %t4435
  %t4437 = load i64, ptr @"scheme.base:str-nth"
  call void @rt_check_callable(i64 %t4437)
  %t4438 = and i64 %t4437, -8
  %t4439 = inttoptr i64 %t4438 to ptr
  %t4440 = load i64, ptr %t4439
  %t4441 = inttoptr i64 %t4440 to ptr
  %t4442 = call fastcc i64%t4441(i64 %t4437, i64 2, i64 %t4436, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4443 = and i64 %self, -8
  %t4444 = inttoptr i64 %t4443 to ptr
  %t4445 = getelementptr i64, ptr %t4444, i64 2
  %t4446 = load i64, ptr %t4445
  call void @rt_check_callable(i64 %t4446)
  %t4447 = and i64 %t4446, -8
  %t4448 = inttoptr i64 %t4447 to ptr
  %t4449 = load i64, ptr %t4448
  %t4450 = inttoptr i64 %t4449 to ptr
  %t4451 = call i64 @rt_list_length(i64 %t4442)
  %t4452 = add i64 0, %t4451
  %t4453 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t4442, i64 8)
  %t4465 = getelementptr i64, ptr %t4453, i64 0
  %t4457 = load i64, ptr %t4465
  %t4466 = getelementptr i64, ptr %t4453, i64 1
  %t4458 = load i64, ptr %t4466
  %t4467 = getelementptr i64, ptr %t4453, i64 2
  %t4459 = load i64, ptr %t4467
  %t4468 = getelementptr i64, ptr %t4453, i64 3
  %t4460 = load i64, ptr %t4468
  %t4469 = getelementptr i64, ptr %t4453, i64 4
  %t4461 = load i64, ptr %t4469
  %t4470 = getelementptr i64, ptr %t4453, i64 5
  %t4462 = load i64, ptr %t4470
  %t4471 = getelementptr i64, ptr %t4453, i64 6
  %t4463 = load i64, ptr %t4471
  %t4472 = getelementptr i64, ptr %t4453, i64 7
  %t4464 = load i64, ptr %t4472
  %t4454 = icmp sgt i64 %t4452, 8
  %t4455 = getelementptr i64, ptr %t4453, i64 8
  %t4456 = select i1 %t4454, ptr %t4455, ptr null
  %t4473 = call fastcc i64%t4450(i64 %t4446, i64 %t4452, i64 %t4457, i64 %t4458, i64 %t4459, i64 %t4460, i64 %t4461, i64 %t4462, i64 %t4463, i64 %t4464, ptr %t4456)
  %t4474 = or i64 %a0, 8
  %t4475 = and i64 %t4474, 7
  %t4476 = icmp eq i64 %t4475, 0
  br i1 %t4476, label %fixfast1032, label %fixslow1033
fixfast1032:
  %t4477 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4478 = extractvalue {i64, i1} %t4477, 0
  %t4479 = extractvalue {i64, i1} %t4477, 1
  br i1 %t4479, label %fixslow1033, label %fixmerge1034
fixslow1033:
  %t4480 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1034
fixmerge1034:
  %t4481 = phi i64 [ %t4478, %fixfast1032 ], [ %t4480, %fixslow1033 ]
  %t4482 = musttail call fastcc i64 @"scheme.base:code_896"(i64 %self, i64 1, i64 %t4481, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4482
}

define fastcc i64 @"scheme.base:code:string-for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4483 = icmp sge i64 %argc, 2
  br i1 %t4483, label %argok1036, label %arityerr1035
arityerr1035:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1036:
  %t4484 = call ptr @rt_alloc_words(i64 8)
  %t4485 = getelementptr i64, ptr %t4484, i64 0
  store i64 %a0, ptr %t4485
  %t4486 = getelementptr i64, ptr %t4484, i64 1
  store i64 %a1, ptr %t4486
  %t4487 = getelementptr i64, ptr %t4484, i64 2
  store i64 %a2, ptr %t4487
  %t4488 = getelementptr i64, ptr %t4484, i64 3
  store i64 %a3, ptr %t4488
  %t4489 = getelementptr i64, ptr %t4484, i64 4
  store i64 %a4, ptr %t4489
  %t4490 = getelementptr i64, ptr %t4484, i64 5
  store i64 %a5, ptr %t4490
  %t4491 = getelementptr i64, ptr %t4484, i64 6
  store i64 %a6, ptr %t4491
  %t4492 = getelementptr i64, ptr %t4484, i64 7
  store i64 %a7, ptr %t4492
  %t4493 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t4484, ptr %overflow)
  %t4494 = call i64 @rt_null_p(i64 %t4493)
  %t4495 = icmp ne i64 %t4494, 1
  br i1 %t4495, label %then1037, label %else1038
then1037:
  %t4496 = call i64 @rt_string_length(i64 %a1)
  %t4497 = call ptr @rt_alloc_words(i64 5)
  %t4498 = ptrtoint ptr %t4497 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_894" to i64), ptr %t4497
  %t4499 = or i64 %t4498, 4
  %t4500 = getelementptr i64, ptr %t4497, i64 1
  store i64 %t4496, ptr %t4500
  %t4501 = getelementptr i64, ptr %t4497, i64 2
  store i64 %a0, ptr %t4501
  %t4502 = getelementptr i64, ptr %t4497, i64 3
  store i64 %a1, ptr %t4502
  %t4503 = getelementptr i64, ptr %t4497, i64 4
  store i64 %t4499, ptr %t4503
  %t4504 = musttail call fastcc i64 @"scheme.base:code_894"(i64 %t4499, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4504
else1038:
  %t4505 = call i64 @rt_cons(i64 %a1, i64 %t4493)
  %t4506 = load i64, ptr @"scheme.base:str-min-len"
  call void @rt_check_callable(i64 %t4506)
  %t4507 = and i64 %t4506, -8
  %t4508 = inttoptr i64 %t4507 to ptr
  %t4509 = load i64, ptr %t4508
  %t4510 = inttoptr i64 %t4509 to ptr
  %t4511 = call fastcc i64%t4510(i64 %t4506, i64 1, i64 %t4505, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4512 = call ptr @rt_alloc_words(i64 5)
  %t4513 = ptrtoint ptr %t4512 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_896" to i64), ptr %t4512
  %t4514 = or i64 %t4513, 4
  %t4515 = getelementptr i64, ptr %t4512, i64 1
  store i64 %t4511, ptr %t4515
  %t4516 = getelementptr i64, ptr %t4512, i64 2
  store i64 %a0, ptr %t4516
  %t4517 = getelementptr i64, ptr %t4512, i64 3
  store i64 %t4505, ptr %t4517
  %t4518 = getelementptr i64, ptr %t4512, i64 4
  store i64 %t4514, ptr %t4518
  %t4519 = musttail call fastcc i64 @"scheme.base:code_896"(i64 %t4514, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4519
}

define fastcc i64 @"scheme.base:code:str-min-len"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4524 = icmp eq i64 %argc, 1
  br i1 %t4524, label %argok1040, label %arityerr1039
arityerr1039:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1040:
  %t4525 = call i64 @rt_cdr(i64 %a0)
  %t4526 = call i64 @rt_null_p(i64 %t4525)
  %t4527 = icmp ne i64 %t4526, 1
  br i1 %t4527, label %then1041, label %else1042
then1041:
  %t4528 = call i64 @rt_car(i64 %a0)
  %t4529 = call i64 @rt_string_length(i64 %t4528)
  ret i64 %t4529
else1042:
  %t4530 = call i64 @rt_car(i64 %a0)
  %t4531 = call i64 @rt_string_length(i64 %t4530)
  %t4532 = call i64 @rt_cdr(i64 %a0)
  %t4533 = load i64, ptr @"scheme.base:str-min-len"
  call void @rt_check_callable(i64 %t4533)
  %t4534 = and i64 %t4533, -8
  %t4535 = inttoptr i64 %t4534 to ptr
  %t4536 = load i64, ptr %t4535
  %t4537 = inttoptr i64 %t4536 to ptr
  %t4538 = call fastcc i64%t4537(i64 %t4533, i64 1, i64 %t4532, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4539 = or i64 %t4531, %t4538
  %t4540 = and i64 %t4539, 7
  %t4541 = icmp eq i64 %t4540, 0
  br i1 %t4541, label %fixfast1043, label %fixslow1044
fixfast1043:
  %t4542 = icmp slt i64 %t4531, %t4538
  %t4543 = select i1 %t4542, i64 257, i64 1
  br label %fixmerge1045
fixslow1044:
  %t4544 = call i64 @rt_lt(i64 %t4531, i64 %t4538)
  br label %fixmerge1045
fixmerge1045:
  %t4545 = phi i64 [ %t4543, %fixfast1043 ], [ %t4544, %fixslow1044 ]
  %t4546 = icmp ne i64 %t4545, 1
  br i1 %t4546, label %then1046, label %else1047
then1046:
  ret i64 %t4531
else1047:
  ret i64 %t4538
}

define fastcc i64 @"scheme.base:code:str-nth"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4551 = icmp eq i64 %argc, 2
  br i1 %t4551, label %argok1049, label %arityerr1048
arityerr1048:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1049:
  %t4552 = call i64 @rt_null_p(i64 %a0)
  %t4553 = icmp ne i64 %t4552, 1
  br i1 %t4553, label %then1050, label %else1051
then1050:
  ret i64 2
else1051:
  %t4554 = call i64 @rt_car(i64 %a0)
  %t4555 = call i64 @rt_string_ref(i64 %t4554, i64 %a1)
  %t4556 = call i64 @rt_cdr(i64 %a0)
  %t4557 = load i64, ptr @"scheme.base:str-nth"
  call void @rt_check_callable(i64 %t4557)
  %t4558 = and i64 %t4557, -8
  %t4559 = inttoptr i64 %t4558 to ptr
  %t4560 = load i64, ptr %t4559
  %t4561 = inttoptr i64 %t4560 to ptr
  %t4562 = call fastcc i64%t4561(i64 %t4557, i64 2, i64 %t4556, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4563 = call i64 @rt_cons(i64 %t4555, i64 %t4562)
  ret i64 %t4563
}

define fastcc i64 @"scheme.base:code_922"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4568 = icmp eq i64 %argc, 1
  br i1 %t4568, label %argok1053, label %arityerr1052
arityerr1052:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1053:
  %t4569 = and i64 %self, -8
  %t4570 = inttoptr i64 %t4569 to ptr
  %t4571 = getelementptr i64, ptr %t4570, i64 1
  %t4572 = load i64, ptr %t4571
  %t4573 = or i64 %a0, %t4572
  %t4574 = and i64 %t4573, 7
  %t4575 = icmp eq i64 %t4574, 0
  br i1 %t4575, label %fixfast1054, label %fixslow1055
fixfast1054:
  %t4576 = icmp eq i64 %a0, %t4572
  %t4577 = select i1 %t4576, i64 257, i64 1
  br label %fixmerge1056
fixslow1055:
  %t4578 = call i64 @rt_num_eq(i64 %a0, i64 %t4572)
  br label %fixmerge1056
fixmerge1056:
  %t4579 = phi i64 [ %t4577, %fixfast1054 ], [ %t4578, %fixslow1055 ]
  %t4580 = icmp ne i64 %t4579, 1
  br i1 %t4580, label %then1057, label %else1058
then1057:
  %t4581 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4581)
  %t4582 = and i64 %t4581, -8
  %t4583 = inttoptr i64 %t4582 to ptr
  %t4584 = load i64, ptr %t4583
  %t4585 = inttoptr i64 %t4584 to ptr
  %t4586 = musttail call fastcc i64 %t4585(i64 %t4581, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4586
else1058:
  %t4587 = and i64 %self, -8
  %t4588 = inttoptr i64 %t4587 to ptr
  %t4589 = getelementptr i64, ptr %t4588, i64 2
  %t4590 = load i64, ptr %t4589
  %t4591 = and i64 %self, -8
  %t4592 = inttoptr i64 %t4591 to ptr
  %t4593 = getelementptr i64, ptr %t4592, i64 3
  %t4594 = load i64, ptr %t4593
  %t4595 = call i64 @rt_string_set(i64 %t4590, i64 %a0, i64 %t4594)
  %t4596 = or i64 %a0, 8
  %t4597 = and i64 %t4596, 7
  %t4598 = icmp eq i64 %t4597, 0
  br i1 %t4598, label %fixfast1059, label %fixslow1060
fixfast1059:
  %t4599 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4600 = extractvalue {i64, i1} %t4599, 0
  %t4601 = extractvalue {i64, i1} %t4599, 1
  br i1 %t4601, label %fixslow1060, label %fixmerge1061
fixslow1060:
  %t4602 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1061
fixmerge1061:
  %t4603 = phi i64 [ %t4600, %fixfast1059 ], [ %t4602, %fixslow1060 ]
  %t4604 = musttail call fastcc i64 @"scheme.base:code_922"(i64 %self, i64 1, i64 %t4603, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4604
}

define fastcc i64 @"scheme.base:code:string-fill!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4605 = icmp sge i64 %argc, 2
  br i1 %t4605, label %argok1063, label %arityerr1062
arityerr1062:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1063:
  %t4606 = call ptr @rt_alloc_words(i64 8)
  %t4607 = getelementptr i64, ptr %t4606, i64 0
  store i64 %a0, ptr %t4607
  %t4608 = getelementptr i64, ptr %t4606, i64 1
  store i64 %a1, ptr %t4608
  %t4609 = getelementptr i64, ptr %t4606, i64 2
  store i64 %a2, ptr %t4609
  %t4610 = getelementptr i64, ptr %t4606, i64 3
  store i64 %a3, ptr %t4610
  %t4611 = getelementptr i64, ptr %t4606, i64 4
  store i64 %a4, ptr %t4611
  %t4612 = getelementptr i64, ptr %t4606, i64 5
  store i64 %a5, ptr %t4612
  %t4613 = getelementptr i64, ptr %t4606, i64 6
  store i64 %a6, ptr %t4613
  %t4614 = getelementptr i64, ptr %t4606, i64 7
  store i64 %a7, ptr %t4614
  %t4615 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t4606, ptr %overflow)
  %t4616 = call i64 @rt_string_length(i64 %a0)
  %t4617 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4617)
  %t4618 = and i64 %t4617, -8
  %t4619 = inttoptr i64 %t4618 to ptr
  %t4620 = load i64, ptr %t4619
  %t4621 = inttoptr i64 %t4620 to ptr
  %t4622 = call fastcc i64%t4621(i64 %t4617, i64 1, i64 %t4615, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4623 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4623)
  %t4624 = and i64 %t4623, -8
  %t4625 = inttoptr i64 %t4624 to ptr
  %t4626 = load i64, ptr %t4625
  %t4627 = inttoptr i64 %t4626 to ptr
  %t4628 = call fastcc i64%t4627(i64 %t4623, i64 2, i64 %t4615, i64 %t4616, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4629 = call i64 @rt_intern(ptr @.str.sym.20)
  %t4630 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4630)
  %t4631 = and i64 %t4630, -8
  %t4632 = inttoptr i64 %t4631 to ptr
  %t4633 = load i64, ptr %t4632
  %t4634 = inttoptr i64 %t4633 to ptr
  %t4635 = call fastcc i64%t4634(i64 %t4630, i64 4, i64 %t4629, i64 %t4622, i64 %t4628, i64 %t4616, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4636 = call ptr @rt_alloc_words(i64 5)
  %t4637 = ptrtoint ptr %t4636 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_922" to i64), ptr %t4636
  %t4638 = or i64 %t4637, 4
  %t4639 = getelementptr i64, ptr %t4636, i64 1
  store i64 %t4628, ptr %t4639
  %t4640 = getelementptr i64, ptr %t4636, i64 2
  store i64 %a0, ptr %t4640
  %t4641 = getelementptr i64, ptr %t4636, i64 3
  store i64 %a1, ptr %t4641
  %t4642 = getelementptr i64, ptr %t4636, i64 4
  store i64 %t4638, ptr %t4642
  %t4643 = musttail call fastcc i64 @"scheme.base:code_922"(i64 %t4638, i64 1, i64 %t4622, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4643
}

define fastcc i64 @"scheme.base:code_948"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4648 = icmp eq i64 %argc, 1
  br i1 %t4648, label %argok1065, label %arityerr1064
arityerr1064:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1065:
  %t4649 = or i64 %a0, 0
  %t4650 = and i64 %t4649, 7
  %t4651 = icmp eq i64 %t4650, 0
  br i1 %t4651, label %fixfast1066, label %fixslow1067
fixfast1066:
  %t4652 = icmp slt i64 %a0, 0
  %t4653 = select i1 %t4652, i64 257, i64 1
  br label %fixmerge1068
fixslow1067:
  %t4654 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge1068
fixmerge1068:
  %t4655 = phi i64 [ %t4653, %fixfast1066 ], [ %t4654, %fixslow1067 ]
  %t4656 = icmp ne i64 %t4655, 1
  br i1 %t4656, label %then1069, label %else1070
then1069:
  %t4657 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4657)
  %t4658 = and i64 %t4657, -8
  %t4659 = inttoptr i64 %t4658 to ptr
  %t4660 = load i64, ptr %t4659
  %t4661 = inttoptr i64 %t4660 to ptr
  %t4662 = musttail call fastcc i64 %t4661(i64 %t4657, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4662
else1070:
  %t4663 = and i64 %self, -8
  %t4664 = inttoptr i64 %t4663 to ptr
  %t4665 = getelementptr i64, ptr %t4664, i64 1
  %t4666 = load i64, ptr %t4665
  %t4667 = and i64 %self, -8
  %t4668 = inttoptr i64 %t4667 to ptr
  %t4669 = getelementptr i64, ptr %t4668, i64 2
  %t4670 = load i64, ptr %t4669
  %t4671 = or i64 %t4670, %a0
  %t4672 = and i64 %t4671, 7
  %t4673 = icmp eq i64 %t4672, 0
  br i1 %t4673, label %fixfast1071, label %fixslow1072
fixfast1071:
  %t4674 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4670, i64 %a0)
  %t4675 = extractvalue {i64, i1} %t4674, 0
  %t4676 = extractvalue {i64, i1} %t4674, 1
  br i1 %t4676, label %fixslow1072, label %fixmerge1073
fixslow1072:
  %t4677 = call i64 @rt_add(i64 %t4670, i64 %a0)
  br label %fixmerge1073
fixmerge1073:
  %t4678 = phi i64 [ %t4675, %fixfast1071 ], [ %t4677, %fixslow1072 ]
  %t4679 = and i64 %self, -8
  %t4680 = inttoptr i64 %t4679 to ptr
  %t4681 = getelementptr i64, ptr %t4680, i64 3
  %t4682 = load i64, ptr %t4681
  %t4683 = and i64 %self, -8
  %t4684 = inttoptr i64 %t4683 to ptr
  %t4685 = getelementptr i64, ptr %t4684, i64 4
  %t4686 = load i64, ptr %t4685
  %t4687 = or i64 %t4686, %a0
  %t4688 = and i64 %t4687, 7
  %t4689 = icmp eq i64 %t4688, 0
  br i1 %t4689, label %fixfast1074, label %fixslow1075
fixfast1074:
  %t4690 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4686, i64 %a0)
  %t4691 = extractvalue {i64, i1} %t4690, 0
  %t4692 = extractvalue {i64, i1} %t4690, 1
  br i1 %t4692, label %fixslow1075, label %fixmerge1076
fixslow1075:
  %t4693 = call i64 @rt_add(i64 %t4686, i64 %a0)
  br label %fixmerge1076
fixmerge1076:
  %t4694 = phi i64 [ %t4691, %fixfast1074 ], [ %t4693, %fixslow1075 ]
  %t4695 = call i64 @rt_string_ref(i64 %t4682, i64 %t4694)
  %t4696 = call i64 @rt_string_set(i64 %t4666, i64 %t4678, i64 %t4695)
  %t4697 = or i64 %a0, 8
  %t4698 = and i64 %t4697, 7
  %t4699 = icmp eq i64 %t4698, 0
  br i1 %t4699, label %fixfast1077, label %fixslow1078
fixfast1077:
  %t4700 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t4701 = extractvalue {i64, i1} %t4700, 0
  %t4702 = extractvalue {i64, i1} %t4700, 1
  br i1 %t4702, label %fixslow1078, label %fixmerge1079
fixslow1078:
  %t4703 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge1079
fixmerge1079:
  %t4704 = phi i64 [ %t4701, %fixfast1077 ], [ %t4703, %fixslow1078 ]
  %t4705 = musttail call fastcc i64 @"scheme.base:code_948"(i64 %self, i64 1, i64 %t4704, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4705
}

define fastcc i64 @"scheme.base:code_950"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4706 = icmp eq i64 %argc, 1
  br i1 %t4706, label %argok1081, label %arityerr1080
arityerr1080:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1081:
  %t4707 = and i64 %self, -8
  %t4708 = inttoptr i64 %t4707 to ptr
  %t4709 = getelementptr i64, ptr %t4708, i64 1
  %t4710 = load i64, ptr %t4709
  %t4711 = and i64 %self, -8
  %t4712 = inttoptr i64 %t4711 to ptr
  %t4713 = getelementptr i64, ptr %t4712, i64 2
  %t4714 = load i64, ptr %t4713
  %t4715 = or i64 %t4710, %t4714
  %t4716 = and i64 %t4715, 7
  %t4717 = icmp eq i64 %t4716, 0
  br i1 %t4717, label %fixfast1082, label %fixslow1083
fixfast1082:
  %t4718 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4710, i64 %t4714)
  %t4719 = extractvalue {i64, i1} %t4718, 0
  %t4720 = extractvalue {i64, i1} %t4718, 1
  br i1 %t4720, label %fixslow1083, label %fixmerge1084
fixslow1083:
  %t4721 = call i64 @rt_sub(i64 %t4710, i64 %t4714)
  br label %fixmerge1084
fixmerge1084:
  %t4722 = phi i64 [ %t4719, %fixfast1082 ], [ %t4721, %fixslow1083 ]
  %t4723 = or i64 %a0, %t4722
  %t4724 = and i64 %t4723, 7
  %t4725 = icmp eq i64 %t4724, 0
  br i1 %t4725, label %fixfast1085, label %fixslow1086
fixfast1085:
  %t4726 = icmp eq i64 %a0, %t4722
  %t4727 = select i1 %t4726, i64 257, i64 1
  br label %fixmerge1087
fixslow1086:
  %t4728 = call i64 @rt_num_eq(i64 %a0, i64 %t4722)
  br label %fixmerge1087
fixmerge1087:
  %t4729 = phi i64 [ %t4727, %fixfast1085 ], [ %t4728, %fixslow1086 ]
  %t4730 = icmp ne i64 %t4729, 1
  br i1 %t4730, label %then1088, label %else1089
then1088:
  %t4731 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4731)
  %t4732 = and i64 %t4731, -8
  %t4733 = inttoptr i64 %t4732 to ptr
  %t4734 = load i64, ptr %t4733
  %t4735 = inttoptr i64 %t4734 to ptr
  %t4736 = musttail call fastcc i64 %t4735(i64 %t4731, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4736
else1089:
  %t4737 = and i64 %self, -8
  %t4738 = inttoptr i64 %t4737 to ptr
  %t4739 = getelementptr i64, ptr %t4738, i64 3
  %t4740 = load i64, ptr %t4739
  %t4741 = and i64 %self, -8
  %t4742 = inttoptr i64 %t4741 to ptr
  %t4743 = getelementptr i64, ptr %t4742, i64 4
  %t4744 = load i64, ptr %t4743
  %t4745 = or i64 %t4744, %a0
  %t4746 = and i64 %t4745, 7
  %t4747 = icmp eq i64 %t4746, 0
  br i1 %t4747, label %fixfast1090, label %fixslow1091
fixfast1090:
  %t4748 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4744, i64 %a0)
  %t4749 = extractvalue {i64, i1} %t4748, 0
  %t4750 = extractvalue {i64, i1} %t4748, 1
  br i1 %t4750, label %fixslow1091, label %fixmerge1092
fixslow1091:
  %t4751 = call i64 @rt_add(i64 %t4744, i64 %a0)
  br label %fixmerge1092
fixmerge1092:
  %t4752 = phi i64 [ %t4749, %fixfast1090 ], [ %t4751, %fixslow1091 ]
  %t4753 = and i64 %self, -8
  %t4754 = inttoptr i64 %t4753 to ptr
  %t4755 = getelementptr i64, ptr %t4754, i64 5
  %t4756 = load i64, ptr %t4755
  %t4757 = and i64 %self, -8
  %t4758 = inttoptr i64 %t4757 to ptr
  %t4759 = getelementptr i64, ptr %t4758, i64 2
  %t4760 = load i64, ptr %t4759
  %t4761 = or i64 %t4760, %a0
  %t4762 = and i64 %t4761, 7
  %t4763 = icmp eq i64 %t4762, 0
  br i1 %t4763, label %fixfast1093, label %fixslow1094
fixfast1093:
  %t4764 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4760, i64 %a0)
  %t4765 = extractvalue {i64, i1} %t4764, 0
  %t4766 = extractvalue {i64, i1} %t4764, 1
  br i1 %t4766, label %fixslow1094, label %fixmerge1095
fixslow1094:
  %t4767 = call i64 @rt_add(i64 %t4760, i64 %a0)
  br label %fixmerge1095
fixmerge1095:
  %t4768 = phi i64 [ %t4765, %fixfast1093 ], [ %t4767, %fixslow1094 ]
  %t4769 = call i64 @rt_string_ref(i64 %t4756, i64 %t4768)
  %t4770 = call i64 @rt_string_set(i64 %t4740, i64 %t4752, i64 %t4769)
  %t4771 = or i64 %a0, 8
  %t4772 = and i64 %t4771, 7
  %t4773 = icmp eq i64 %t4772, 0
  br i1 %t4773, label %fixfast1096, label %fixslow1097
fixfast1096:
  %t4774 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4775 = extractvalue {i64, i1} %t4774, 0
  %t4776 = extractvalue {i64, i1} %t4774, 1
  br i1 %t4776, label %fixslow1097, label %fixmerge1098
fixslow1097:
  %t4777 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1098
fixmerge1098:
  %t4778 = phi i64 [ %t4775, %fixfast1096 ], [ %t4777, %fixslow1097 ]
  %t4779 = musttail call fastcc i64 @"scheme.base:code_950"(i64 %self, i64 1, i64 %t4778, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4779
}

define fastcc i64 @"scheme.base:code:string-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4780 = icmp sge i64 %argc, 3
  br i1 %t4780, label %argok1100, label %arityerr1099
arityerr1099:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1100:
  %t4781 = call ptr @rt_alloc_words(i64 8)
  %t4782 = getelementptr i64, ptr %t4781, i64 0
  store i64 %a0, ptr %t4782
  %t4783 = getelementptr i64, ptr %t4781, i64 1
  store i64 %a1, ptr %t4783
  %t4784 = getelementptr i64, ptr %t4781, i64 2
  store i64 %a2, ptr %t4784
  %t4785 = getelementptr i64, ptr %t4781, i64 3
  store i64 %a3, ptr %t4785
  %t4786 = getelementptr i64, ptr %t4781, i64 4
  store i64 %a4, ptr %t4786
  %t4787 = getelementptr i64, ptr %t4781, i64 5
  store i64 %a5, ptr %t4787
  %t4788 = getelementptr i64, ptr %t4781, i64 6
  store i64 %a6, ptr %t4788
  %t4789 = getelementptr i64, ptr %t4781, i64 7
  store i64 %a7, ptr %t4789
  %t4790 = call i64 @rt_build_rest(i64 %argc, i64 3, i64 8, ptr %t4781, ptr %overflow)
  %t4791 = call i64 @rt_string_length(i64 %a2)
  %t4792 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4792)
  %t4793 = and i64 %t4792, -8
  %t4794 = inttoptr i64 %t4793 to ptr
  %t4795 = load i64, ptr %t4794
  %t4796 = inttoptr i64 %t4795 to ptr
  %t4797 = call fastcc i64%t4796(i64 %t4792, i64 1, i64 %t4790, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4798 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4798)
  %t4799 = and i64 %t4798, -8
  %t4800 = inttoptr i64 %t4799 to ptr
  %t4801 = load i64, ptr %t4800
  %t4802 = inttoptr i64 %t4801 to ptr
  %t4803 = call fastcc i64%t4802(i64 %t4798, i64 2, i64 %t4790, i64 %t4791, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4804 = call i64 @rt_intern(ptr @.str.sym.21)
  %t4805 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4805)
  %t4806 = and i64 %t4805, -8
  %t4807 = inttoptr i64 %t4806 to ptr
  %t4808 = load i64, ptr %t4807
  %t4809 = inttoptr i64 %t4808 to ptr
  %t4810 = call fastcc i64%t4809(i64 %t4805, i64 4, i64 %t4804, i64 %t4797, i64 %t4803, i64 %t4791, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4811 = call i64 @rt_intern(ptr @.str.sym.21)
  %t4812 = or i64 %t4803, %t4797
  %t4813 = and i64 %t4812, 7
  %t4814 = icmp eq i64 %t4813, 0
  br i1 %t4814, label %fixfast1101, label %fixslow1102
fixfast1101:
  %t4815 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4803, i64 %t4797)
  %t4816 = extractvalue {i64, i1} %t4815, 0
  %t4817 = extractvalue {i64, i1} %t4815, 1
  br i1 %t4817, label %fixslow1102, label %fixmerge1103
fixslow1102:
  %t4818 = call i64 @rt_sub(i64 %t4803, i64 %t4797)
  br label %fixmerge1103
fixmerge1103:
  %t4819 = phi i64 [ %t4816, %fixfast1101 ], [ %t4818, %fixslow1102 ]
  %t4820 = or i64 %a1, %t4819
  %t4821 = and i64 %t4820, 7
  %t4822 = icmp eq i64 %t4821, 0
  br i1 %t4822, label %fixfast1104, label %fixslow1105
fixfast1104:
  %t4823 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t4819)
  %t4824 = extractvalue {i64, i1} %t4823, 0
  %t4825 = extractvalue {i64, i1} %t4823, 1
  br i1 %t4825, label %fixslow1105, label %fixmerge1106
fixslow1105:
  %t4826 = call i64 @rt_add(i64 %a1, i64 %t4819)
  br label %fixmerge1106
fixmerge1106:
  %t4827 = phi i64 [ %t4824, %fixfast1104 ], [ %t4826, %fixslow1105 ]
  %t4828 = call i64 @rt_string_length(i64 %a0)
  %t4829 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4829)
  %t4830 = and i64 %t4829, -8
  %t4831 = inttoptr i64 %t4830 to ptr
  %t4832 = load i64, ptr %t4831
  %t4833 = inttoptr i64 %t4832 to ptr
  %t4834 = call fastcc i64%t4833(i64 %t4829, i64 4, i64 %t4811, i64 %a1, i64 %t4827, i64 %t4828, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4835 = or i64 %t4797, %a1
  %t4836 = and i64 %t4835, 7
  %t4837 = icmp eq i64 %t4836, 0
  br i1 %t4837, label %fixfast1107, label %fixslow1108
fixfast1107:
  %t4838 = icmp slt i64 %t4797, %a1
  %t4839 = select i1 %t4838, i64 257, i64 1
  br label %fixmerge1109
fixslow1108:
  %t4840 = call i64 @rt_lt(i64 %t4797, i64 %a1)
  br label %fixmerge1109
fixmerge1109:
  %t4841 = phi i64 [ %t4839, %fixfast1107 ], [ %t4840, %fixslow1108 ]
  %t4842 = icmp ne i64 %t4841, 1
  br i1 %t4842, label %then1110, label %else1111
then1110:
  %t4843 = call ptr @rt_alloc_words(i64 6)
  %t4844 = ptrtoint ptr %t4843 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_948" to i64), ptr %t4843
  %t4845 = or i64 %t4844, 4
  %t4846 = getelementptr i64, ptr %t4843, i64 1
  store i64 %a0, ptr %t4846
  %t4847 = getelementptr i64, ptr %t4843, i64 2
  store i64 %a1, ptr %t4847
  %t4848 = getelementptr i64, ptr %t4843, i64 3
  store i64 %a2, ptr %t4848
  %t4849 = getelementptr i64, ptr %t4843, i64 4
  store i64 %t4797, ptr %t4849
  %t4850 = getelementptr i64, ptr %t4843, i64 5
  store i64 %t4845, ptr %t4850
  %t4851 = or i64 %t4803, %t4797
  %t4852 = and i64 %t4851, 7
  %t4853 = icmp eq i64 %t4852, 0
  br i1 %t4853, label %fixfast1112, label %fixslow1113
fixfast1112:
  %t4854 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4803, i64 %t4797)
  %t4855 = extractvalue {i64, i1} %t4854, 0
  %t4856 = extractvalue {i64, i1} %t4854, 1
  br i1 %t4856, label %fixslow1113, label %fixmerge1114
fixslow1113:
  %t4857 = call i64 @rt_sub(i64 %t4803, i64 %t4797)
  br label %fixmerge1114
fixmerge1114:
  %t4858 = phi i64 [ %t4855, %fixfast1112 ], [ %t4857, %fixslow1113 ]
  %t4859 = or i64 %t4858, 8
  %t4860 = and i64 %t4859, 7
  %t4861 = icmp eq i64 %t4860, 0
  br i1 %t4861, label %fixfast1115, label %fixslow1116
fixfast1115:
  %t4862 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4858, i64 8)
  %t4863 = extractvalue {i64, i1} %t4862, 0
  %t4864 = extractvalue {i64, i1} %t4862, 1
  br i1 %t4864, label %fixslow1116, label %fixmerge1117
fixslow1116:
  %t4865 = call i64 @rt_sub(i64 %t4858, i64 8)
  br label %fixmerge1117
fixmerge1117:
  %t4866 = phi i64 [ %t4863, %fixfast1115 ], [ %t4865, %fixslow1116 ]
  %t4867 = musttail call fastcc i64 @"scheme.base:code_948"(i64 %t4845, i64 1, i64 %t4866, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4867
else1111:
  %t4868 = call ptr @rt_alloc_words(i64 7)
  %t4869 = ptrtoint ptr %t4868 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_950" to i64), ptr %t4868
  %t4870 = or i64 %t4869, 4
  %t4871 = getelementptr i64, ptr %t4868, i64 1
  store i64 %t4803, ptr %t4871
  %t4872 = getelementptr i64, ptr %t4868, i64 2
  store i64 %t4797, ptr %t4872
  %t4873 = getelementptr i64, ptr %t4868, i64 3
  store i64 %a0, ptr %t4873
  %t4874 = getelementptr i64, ptr %t4868, i64 4
  store i64 %a1, ptr %t4874
  %t4875 = getelementptr i64, ptr %t4868, i64 5
  store i64 %a2, ptr %t4875
  %t4876 = getelementptr i64, ptr %t4868, i64 6
  store i64 %t4870, ptr %t4876
  %t4877 = musttail call fastcc i64 @"scheme.base:code_950"(i64 %t4870, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4877
}

define fastcc i64 @"scheme.base:code_965"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4882 = icmp eq i64 %argc, 1
  br i1 %t4882, label %argok1119, label %arityerr1118
arityerr1118:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1119:
  %t4883 = and i64 %self, -8
  %t4884 = inttoptr i64 %t4883 to ptr
  %t4885 = getelementptr i64, ptr %t4884, i64 1
  %t4886 = load i64, ptr %t4885
  %t4887 = or i64 %a0, %t4886
  %t4888 = and i64 %t4887, 7
  %t4889 = icmp eq i64 %t4888, 0
  br i1 %t4889, label %fixfast1120, label %fixslow1121
fixfast1120:
  %t4890 = icmp eq i64 %a0, %t4886
  %t4891 = select i1 %t4890, i64 257, i64 1
  br label %fixmerge1122
fixslow1121:
  %t4892 = call i64 @rt_num_eq(i64 %a0, i64 %t4886)
  br label %fixmerge1122
fixmerge1122:
  %t4893 = phi i64 [ %t4891, %fixfast1120 ], [ %t4892, %fixslow1121 ]
  %t4894 = icmp ne i64 %t4893, 1
  br i1 %t4894, label %then1123, label %else1124
then1123:
  %t4895 = and i64 %self, -8
  %t4896 = inttoptr i64 %t4895 to ptr
  %t4897 = getelementptr i64, ptr %t4896, i64 2
  %t4898 = load i64, ptr %t4897
  ret i64 %t4898
else1124:
  %t4899 = and i64 %self, -8
  %t4900 = inttoptr i64 %t4899 to ptr
  %t4901 = getelementptr i64, ptr %t4900, i64 2
  %t4902 = load i64, ptr %t4901
  %t4903 = and i64 %self, -8
  %t4904 = inttoptr i64 %t4903 to ptr
  %t4905 = getelementptr i64, ptr %t4904, i64 3
  %t4906 = load i64, ptr %t4905
  %t4907 = or i64 %a0, %t4906
  %t4908 = and i64 %t4907, 7
  %t4909 = icmp eq i64 %t4908, 0
  br i1 %t4909, label %fixfast1125, label %fixslow1126
fixfast1125:
  %t4910 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t4906)
  %t4911 = extractvalue {i64, i1} %t4910, 0
  %t4912 = extractvalue {i64, i1} %t4910, 1
  br i1 %t4912, label %fixslow1126, label %fixmerge1127
fixslow1126:
  %t4913 = call i64 @rt_sub(i64 %a0, i64 %t4906)
  br label %fixmerge1127
fixmerge1127:
  %t4914 = phi i64 [ %t4911, %fixfast1125 ], [ %t4913, %fixslow1126 ]
  %t4915 = and i64 %self, -8
  %t4916 = inttoptr i64 %t4915 to ptr
  %t4917 = getelementptr i64, ptr %t4916, i64 4
  %t4918 = load i64, ptr %t4917
  %t4919 = call i64 @rt_bytevector_u8_ref(i64 %t4918, i64 %a0)
  %t4920 = call i64 @rt_bytevector_u8_set(i64 %t4902, i64 %t4914, i64 %t4919)
  %t4921 = or i64 %a0, 8
  %t4922 = and i64 %t4921, 7
  %t4923 = icmp eq i64 %t4922, 0
  br i1 %t4923, label %fixfast1128, label %fixslow1129
fixfast1128:
  %t4924 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4925 = extractvalue {i64, i1} %t4924, 0
  %t4926 = extractvalue {i64, i1} %t4924, 1
  br i1 %t4926, label %fixslow1129, label %fixmerge1130
fixslow1129:
  %t4927 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1130
fixmerge1130:
  %t4928 = phi i64 [ %t4925, %fixfast1128 ], [ %t4927, %fixslow1129 ]
  %t4929 = musttail call fastcc i64 @"scheme.base:code_965"(i64 %self, i64 1, i64 %t4928, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4929
}

define fastcc i64 @"scheme.base:code:bytevector-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4930 = icmp sge i64 %argc, 1
  br i1 %t4930, label %argok1132, label %arityerr1131
arityerr1131:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1132:
  %t4931 = call ptr @rt_alloc_words(i64 8)
  %t4932 = getelementptr i64, ptr %t4931, i64 0
  store i64 %a0, ptr %t4932
  %t4933 = getelementptr i64, ptr %t4931, i64 1
  store i64 %a1, ptr %t4933
  %t4934 = getelementptr i64, ptr %t4931, i64 2
  store i64 %a2, ptr %t4934
  %t4935 = getelementptr i64, ptr %t4931, i64 3
  store i64 %a3, ptr %t4935
  %t4936 = getelementptr i64, ptr %t4931, i64 4
  store i64 %a4, ptr %t4936
  %t4937 = getelementptr i64, ptr %t4931, i64 5
  store i64 %a5, ptr %t4937
  %t4938 = getelementptr i64, ptr %t4931, i64 6
  store i64 %a6, ptr %t4938
  %t4939 = getelementptr i64, ptr %t4931, i64 7
  store i64 %a7, ptr %t4939
  %t4940 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t4931, ptr %overflow)
  %t4941 = call i64 @rt_bytevector_length(i64 %a0)
  %t4942 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4942)
  %t4943 = and i64 %t4942, -8
  %t4944 = inttoptr i64 %t4943 to ptr
  %t4945 = load i64, ptr %t4944
  %t4946 = inttoptr i64 %t4945 to ptr
  %t4947 = call fastcc i64%t4946(i64 %t4942, i64 1, i64 %t4940, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4948 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4948)
  %t4949 = and i64 %t4948, -8
  %t4950 = inttoptr i64 %t4949 to ptr
  %t4951 = load i64, ptr %t4950
  %t4952 = inttoptr i64 %t4951 to ptr
  %t4953 = call fastcc i64%t4952(i64 %t4948, i64 2, i64 %t4940, i64 %t4941, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4954 = call i64 @rt_intern(ptr @.str.sym.22)
  %t4955 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4955)
  %t4956 = and i64 %t4955, -8
  %t4957 = inttoptr i64 %t4956 to ptr
  %t4958 = load i64, ptr %t4957
  %t4959 = inttoptr i64 %t4958 to ptr
  %t4960 = call fastcc i64%t4959(i64 %t4955, i64 4, i64 %t4954, i64 %t4947, i64 %t4953, i64 %t4941, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4961 = or i64 %t4953, %t4947
  %t4962 = and i64 %t4961, 7
  %t4963 = icmp eq i64 %t4962, 0
  br i1 %t4963, label %fixfast1133, label %fixslow1134
fixfast1133:
  %t4964 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4953, i64 %t4947)
  %t4965 = extractvalue {i64, i1} %t4964, 0
  %t4966 = extractvalue {i64, i1} %t4964, 1
  br i1 %t4966, label %fixslow1134, label %fixmerge1135
fixslow1134:
  %t4967 = call i64 @rt_sub(i64 %t4953, i64 %t4947)
  br label %fixmerge1135
fixmerge1135:
  %t4968 = phi i64 [ %t4965, %fixfast1133 ], [ %t4967, %fixslow1134 ]
  %t4969 = call i64 @rt_make_bytevector(i64 %t4968, i64 0)
  %t4970 = call ptr @rt_alloc_words(i64 6)
  %t4971 = ptrtoint ptr %t4970 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_965" to i64), ptr %t4970
  %t4972 = or i64 %t4971, 4
  %t4973 = getelementptr i64, ptr %t4970, i64 1
  store i64 %t4953, ptr %t4973
  %t4974 = getelementptr i64, ptr %t4970, i64 2
  store i64 %t4969, ptr %t4974
  %t4975 = getelementptr i64, ptr %t4970, i64 3
  store i64 %t4947, ptr %t4975
  %t4976 = getelementptr i64, ptr %t4970, i64 4
  store i64 %a0, ptr %t4976
  %t4977 = getelementptr i64, ptr %t4970, i64 5
  store i64 %t4972, ptr %t4977
  %t4978 = musttail call fastcc i64 @"scheme.base:code_965"(i64 %t4972, i64 1, i64 %t4947, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4978
}

define fastcc i64 @"scheme.base:code_991"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4983 = icmp eq i64 %argc, 1
  br i1 %t4983, label %argok1137, label %arityerr1136
arityerr1136:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1137:
  %t4984 = or i64 %a0, 0
  %t4985 = and i64 %t4984, 7
  %t4986 = icmp eq i64 %t4985, 0
  br i1 %t4986, label %fixfast1138, label %fixslow1139
fixfast1138:
  %t4987 = icmp slt i64 %a0, 0
  %t4988 = select i1 %t4987, i64 257, i64 1
  br label %fixmerge1140
fixslow1139:
  %t4989 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge1140
fixmerge1140:
  %t4990 = phi i64 [ %t4988, %fixfast1138 ], [ %t4989, %fixslow1139 ]
  %t4991 = icmp ne i64 %t4990, 1
  br i1 %t4991, label %then1141, label %else1142
then1141:
  %t4992 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4992)
  %t4993 = and i64 %t4992, -8
  %t4994 = inttoptr i64 %t4993 to ptr
  %t4995 = load i64, ptr %t4994
  %t4996 = inttoptr i64 %t4995 to ptr
  %t4997 = musttail call fastcc i64 %t4996(i64 %t4992, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4997
else1142:
  %t4998 = and i64 %self, -8
  %t4999 = inttoptr i64 %t4998 to ptr
  %t5000 = getelementptr i64, ptr %t4999, i64 1
  %t5001 = load i64, ptr %t5000
  %t5002 = and i64 %self, -8
  %t5003 = inttoptr i64 %t5002 to ptr
  %t5004 = getelementptr i64, ptr %t5003, i64 2
  %t5005 = load i64, ptr %t5004
  %t5006 = or i64 %t5005, %a0
  %t5007 = and i64 %t5006, 7
  %t5008 = icmp eq i64 %t5007, 0
  br i1 %t5008, label %fixfast1143, label %fixslow1144
fixfast1143:
  %t5009 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5005, i64 %a0)
  %t5010 = extractvalue {i64, i1} %t5009, 0
  %t5011 = extractvalue {i64, i1} %t5009, 1
  br i1 %t5011, label %fixslow1144, label %fixmerge1145
fixslow1144:
  %t5012 = call i64 @rt_add(i64 %t5005, i64 %a0)
  br label %fixmerge1145
fixmerge1145:
  %t5013 = phi i64 [ %t5010, %fixfast1143 ], [ %t5012, %fixslow1144 ]
  %t5014 = and i64 %self, -8
  %t5015 = inttoptr i64 %t5014 to ptr
  %t5016 = getelementptr i64, ptr %t5015, i64 3
  %t5017 = load i64, ptr %t5016
  %t5018 = and i64 %self, -8
  %t5019 = inttoptr i64 %t5018 to ptr
  %t5020 = getelementptr i64, ptr %t5019, i64 4
  %t5021 = load i64, ptr %t5020
  %t5022 = or i64 %t5021, %a0
  %t5023 = and i64 %t5022, 7
  %t5024 = icmp eq i64 %t5023, 0
  br i1 %t5024, label %fixfast1146, label %fixslow1147
fixfast1146:
  %t5025 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5021, i64 %a0)
  %t5026 = extractvalue {i64, i1} %t5025, 0
  %t5027 = extractvalue {i64, i1} %t5025, 1
  br i1 %t5027, label %fixslow1147, label %fixmerge1148
fixslow1147:
  %t5028 = call i64 @rt_add(i64 %t5021, i64 %a0)
  br label %fixmerge1148
fixmerge1148:
  %t5029 = phi i64 [ %t5026, %fixfast1146 ], [ %t5028, %fixslow1147 ]
  %t5030 = call i64 @rt_bytevector_u8_ref(i64 %t5017, i64 %t5029)
  %t5031 = call i64 @rt_bytevector_u8_set(i64 %t5001, i64 %t5013, i64 %t5030)
  %t5032 = or i64 %a0, 8
  %t5033 = and i64 %t5032, 7
  %t5034 = icmp eq i64 %t5033, 0
  br i1 %t5034, label %fixfast1149, label %fixslow1150
fixfast1149:
  %t5035 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t5036 = extractvalue {i64, i1} %t5035, 0
  %t5037 = extractvalue {i64, i1} %t5035, 1
  br i1 %t5037, label %fixslow1150, label %fixmerge1151
fixslow1150:
  %t5038 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge1151
fixmerge1151:
  %t5039 = phi i64 [ %t5036, %fixfast1149 ], [ %t5038, %fixslow1150 ]
  %t5040 = musttail call fastcc i64 @"scheme.base:code_991"(i64 %self, i64 1, i64 %t5039, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5040
}

define fastcc i64 @"scheme.base:code_993"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5041 = icmp eq i64 %argc, 1
  br i1 %t5041, label %argok1153, label %arityerr1152
arityerr1152:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1153:
  %t5042 = and i64 %self, -8
  %t5043 = inttoptr i64 %t5042 to ptr
  %t5044 = getelementptr i64, ptr %t5043, i64 1
  %t5045 = load i64, ptr %t5044
  %t5046 = and i64 %self, -8
  %t5047 = inttoptr i64 %t5046 to ptr
  %t5048 = getelementptr i64, ptr %t5047, i64 2
  %t5049 = load i64, ptr %t5048
  %t5050 = or i64 %t5045, %t5049
  %t5051 = and i64 %t5050, 7
  %t5052 = icmp eq i64 %t5051, 0
  br i1 %t5052, label %fixfast1154, label %fixslow1155
fixfast1154:
  %t5053 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5045, i64 %t5049)
  %t5054 = extractvalue {i64, i1} %t5053, 0
  %t5055 = extractvalue {i64, i1} %t5053, 1
  br i1 %t5055, label %fixslow1155, label %fixmerge1156
fixslow1155:
  %t5056 = call i64 @rt_sub(i64 %t5045, i64 %t5049)
  br label %fixmerge1156
fixmerge1156:
  %t5057 = phi i64 [ %t5054, %fixfast1154 ], [ %t5056, %fixslow1155 ]
  %t5058 = or i64 %a0, %t5057
  %t5059 = and i64 %t5058, 7
  %t5060 = icmp eq i64 %t5059, 0
  br i1 %t5060, label %fixfast1157, label %fixslow1158
fixfast1157:
  %t5061 = icmp eq i64 %a0, %t5057
  %t5062 = select i1 %t5061, i64 257, i64 1
  br label %fixmerge1159
fixslow1158:
  %t5063 = call i64 @rt_num_eq(i64 %a0, i64 %t5057)
  br label %fixmerge1159
fixmerge1159:
  %t5064 = phi i64 [ %t5062, %fixfast1157 ], [ %t5063, %fixslow1158 ]
  %t5065 = icmp ne i64 %t5064, 1
  br i1 %t5065, label %then1160, label %else1161
then1160:
  %t5066 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t5066)
  %t5067 = and i64 %t5066, -8
  %t5068 = inttoptr i64 %t5067 to ptr
  %t5069 = load i64, ptr %t5068
  %t5070 = inttoptr i64 %t5069 to ptr
  %t5071 = musttail call fastcc i64 %t5070(i64 %t5066, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5071
else1161:
  %t5072 = and i64 %self, -8
  %t5073 = inttoptr i64 %t5072 to ptr
  %t5074 = getelementptr i64, ptr %t5073, i64 3
  %t5075 = load i64, ptr %t5074
  %t5076 = and i64 %self, -8
  %t5077 = inttoptr i64 %t5076 to ptr
  %t5078 = getelementptr i64, ptr %t5077, i64 4
  %t5079 = load i64, ptr %t5078
  %t5080 = or i64 %t5079, %a0
  %t5081 = and i64 %t5080, 7
  %t5082 = icmp eq i64 %t5081, 0
  br i1 %t5082, label %fixfast1162, label %fixslow1163
fixfast1162:
  %t5083 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5079, i64 %a0)
  %t5084 = extractvalue {i64, i1} %t5083, 0
  %t5085 = extractvalue {i64, i1} %t5083, 1
  br i1 %t5085, label %fixslow1163, label %fixmerge1164
fixslow1163:
  %t5086 = call i64 @rt_add(i64 %t5079, i64 %a0)
  br label %fixmerge1164
fixmerge1164:
  %t5087 = phi i64 [ %t5084, %fixfast1162 ], [ %t5086, %fixslow1163 ]
  %t5088 = and i64 %self, -8
  %t5089 = inttoptr i64 %t5088 to ptr
  %t5090 = getelementptr i64, ptr %t5089, i64 5
  %t5091 = load i64, ptr %t5090
  %t5092 = and i64 %self, -8
  %t5093 = inttoptr i64 %t5092 to ptr
  %t5094 = getelementptr i64, ptr %t5093, i64 2
  %t5095 = load i64, ptr %t5094
  %t5096 = or i64 %t5095, %a0
  %t5097 = and i64 %t5096, 7
  %t5098 = icmp eq i64 %t5097, 0
  br i1 %t5098, label %fixfast1165, label %fixslow1166
fixfast1165:
  %t5099 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5095, i64 %a0)
  %t5100 = extractvalue {i64, i1} %t5099, 0
  %t5101 = extractvalue {i64, i1} %t5099, 1
  br i1 %t5101, label %fixslow1166, label %fixmerge1167
fixslow1166:
  %t5102 = call i64 @rt_add(i64 %t5095, i64 %a0)
  br label %fixmerge1167
fixmerge1167:
  %t5103 = phi i64 [ %t5100, %fixfast1165 ], [ %t5102, %fixslow1166 ]
  %t5104 = call i64 @rt_bytevector_u8_ref(i64 %t5091, i64 %t5103)
  %t5105 = call i64 @rt_bytevector_u8_set(i64 %t5075, i64 %t5087, i64 %t5104)
  %t5106 = or i64 %a0, 8
  %t5107 = and i64 %t5106, 7
  %t5108 = icmp eq i64 %t5107, 0
  br i1 %t5108, label %fixfast1168, label %fixslow1169
fixfast1168:
  %t5109 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5110 = extractvalue {i64, i1} %t5109, 0
  %t5111 = extractvalue {i64, i1} %t5109, 1
  br i1 %t5111, label %fixslow1169, label %fixmerge1170
fixslow1169:
  %t5112 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1170
fixmerge1170:
  %t5113 = phi i64 [ %t5110, %fixfast1168 ], [ %t5112, %fixslow1169 ]
  %t5114 = musttail call fastcc i64 @"scheme.base:code_993"(i64 %self, i64 1, i64 %t5113, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5114
}

define fastcc i64 @"scheme.base:code:bytevector-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5115 = icmp sge i64 %argc, 3
  br i1 %t5115, label %argok1172, label %arityerr1171
arityerr1171:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1172:
  %t5116 = call ptr @rt_alloc_words(i64 8)
  %t5117 = getelementptr i64, ptr %t5116, i64 0
  store i64 %a0, ptr %t5117
  %t5118 = getelementptr i64, ptr %t5116, i64 1
  store i64 %a1, ptr %t5118
  %t5119 = getelementptr i64, ptr %t5116, i64 2
  store i64 %a2, ptr %t5119
  %t5120 = getelementptr i64, ptr %t5116, i64 3
  store i64 %a3, ptr %t5120
  %t5121 = getelementptr i64, ptr %t5116, i64 4
  store i64 %a4, ptr %t5121
  %t5122 = getelementptr i64, ptr %t5116, i64 5
  store i64 %a5, ptr %t5122
  %t5123 = getelementptr i64, ptr %t5116, i64 6
  store i64 %a6, ptr %t5123
  %t5124 = getelementptr i64, ptr %t5116, i64 7
  store i64 %a7, ptr %t5124
  %t5125 = call i64 @rt_build_rest(i64 %argc, i64 3, i64 8, ptr %t5116, ptr %overflow)
  %t5126 = call i64 @rt_bytevector_length(i64 %a2)
  %t5127 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5127)
  %t5128 = and i64 %t5127, -8
  %t5129 = inttoptr i64 %t5128 to ptr
  %t5130 = load i64, ptr %t5129
  %t5131 = inttoptr i64 %t5130 to ptr
  %t5132 = call fastcc i64%t5131(i64 %t5127, i64 1, i64 %t5125, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5133 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5133)
  %t5134 = and i64 %t5133, -8
  %t5135 = inttoptr i64 %t5134 to ptr
  %t5136 = load i64, ptr %t5135
  %t5137 = inttoptr i64 %t5136 to ptr
  %t5138 = call fastcc i64%t5137(i64 %t5133, i64 2, i64 %t5125, i64 %t5126, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5139 = call i64 @rt_intern(ptr @.str.sym.23)
  %t5140 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5140)
  %t5141 = and i64 %t5140, -8
  %t5142 = inttoptr i64 %t5141 to ptr
  %t5143 = load i64, ptr %t5142
  %t5144 = inttoptr i64 %t5143 to ptr
  %t5145 = call fastcc i64%t5144(i64 %t5140, i64 4, i64 %t5139, i64 %t5132, i64 %t5138, i64 %t5126, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5146 = call i64 @rt_intern(ptr @.str.sym.23)
  %t5147 = or i64 %t5138, %t5132
  %t5148 = and i64 %t5147, 7
  %t5149 = icmp eq i64 %t5148, 0
  br i1 %t5149, label %fixfast1173, label %fixslow1174
fixfast1173:
  %t5150 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5138, i64 %t5132)
  %t5151 = extractvalue {i64, i1} %t5150, 0
  %t5152 = extractvalue {i64, i1} %t5150, 1
  br i1 %t5152, label %fixslow1174, label %fixmerge1175
fixslow1174:
  %t5153 = call i64 @rt_sub(i64 %t5138, i64 %t5132)
  br label %fixmerge1175
fixmerge1175:
  %t5154 = phi i64 [ %t5151, %fixfast1173 ], [ %t5153, %fixslow1174 ]
  %t5155 = or i64 %a1, %t5154
  %t5156 = and i64 %t5155, 7
  %t5157 = icmp eq i64 %t5156, 0
  br i1 %t5157, label %fixfast1176, label %fixslow1177
fixfast1176:
  %t5158 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t5154)
  %t5159 = extractvalue {i64, i1} %t5158, 0
  %t5160 = extractvalue {i64, i1} %t5158, 1
  br i1 %t5160, label %fixslow1177, label %fixmerge1178
fixslow1177:
  %t5161 = call i64 @rt_add(i64 %a1, i64 %t5154)
  br label %fixmerge1178
fixmerge1178:
  %t5162 = phi i64 [ %t5159, %fixfast1176 ], [ %t5161, %fixslow1177 ]
  %t5163 = call i64 @rt_bytevector_length(i64 %a0)
  %t5164 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5164)
  %t5165 = and i64 %t5164, -8
  %t5166 = inttoptr i64 %t5165 to ptr
  %t5167 = load i64, ptr %t5166
  %t5168 = inttoptr i64 %t5167 to ptr
  %t5169 = call fastcc i64%t5168(i64 %t5164, i64 4, i64 %t5146, i64 %a1, i64 %t5162, i64 %t5163, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5170 = or i64 %t5132, %a1
  %t5171 = and i64 %t5170, 7
  %t5172 = icmp eq i64 %t5171, 0
  br i1 %t5172, label %fixfast1179, label %fixslow1180
fixfast1179:
  %t5173 = icmp slt i64 %t5132, %a1
  %t5174 = select i1 %t5173, i64 257, i64 1
  br label %fixmerge1181
fixslow1180:
  %t5175 = call i64 @rt_lt(i64 %t5132, i64 %a1)
  br label %fixmerge1181
fixmerge1181:
  %t5176 = phi i64 [ %t5174, %fixfast1179 ], [ %t5175, %fixslow1180 ]
  %t5177 = icmp ne i64 %t5176, 1
  br i1 %t5177, label %then1182, label %else1183
then1182:
  %t5178 = call ptr @rt_alloc_words(i64 6)
  %t5179 = ptrtoint ptr %t5178 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_991" to i64), ptr %t5178
  %t5180 = or i64 %t5179, 4
  %t5181 = getelementptr i64, ptr %t5178, i64 1
  store i64 %a0, ptr %t5181
  %t5182 = getelementptr i64, ptr %t5178, i64 2
  store i64 %a1, ptr %t5182
  %t5183 = getelementptr i64, ptr %t5178, i64 3
  store i64 %a2, ptr %t5183
  %t5184 = getelementptr i64, ptr %t5178, i64 4
  store i64 %t5132, ptr %t5184
  %t5185 = getelementptr i64, ptr %t5178, i64 5
  store i64 %t5180, ptr %t5185
  %t5186 = or i64 %t5138, %t5132
  %t5187 = and i64 %t5186, 7
  %t5188 = icmp eq i64 %t5187, 0
  br i1 %t5188, label %fixfast1184, label %fixslow1185
fixfast1184:
  %t5189 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5138, i64 %t5132)
  %t5190 = extractvalue {i64, i1} %t5189, 0
  %t5191 = extractvalue {i64, i1} %t5189, 1
  br i1 %t5191, label %fixslow1185, label %fixmerge1186
fixslow1185:
  %t5192 = call i64 @rt_sub(i64 %t5138, i64 %t5132)
  br label %fixmerge1186
fixmerge1186:
  %t5193 = phi i64 [ %t5190, %fixfast1184 ], [ %t5192, %fixslow1185 ]
  %t5194 = or i64 %t5193, 8
  %t5195 = and i64 %t5194, 7
  %t5196 = icmp eq i64 %t5195, 0
  br i1 %t5196, label %fixfast1187, label %fixslow1188
fixfast1187:
  %t5197 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5193, i64 8)
  %t5198 = extractvalue {i64, i1} %t5197, 0
  %t5199 = extractvalue {i64, i1} %t5197, 1
  br i1 %t5199, label %fixslow1188, label %fixmerge1189
fixslow1188:
  %t5200 = call i64 @rt_sub(i64 %t5193, i64 8)
  br label %fixmerge1189
fixmerge1189:
  %t5201 = phi i64 [ %t5198, %fixfast1187 ], [ %t5200, %fixslow1188 ]
  %t5202 = musttail call fastcc i64 @"scheme.base:code_991"(i64 %t5180, i64 1, i64 %t5201, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5202
else1183:
  %t5203 = call ptr @rt_alloc_words(i64 7)
  %t5204 = ptrtoint ptr %t5203 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_993" to i64), ptr %t5203
  %t5205 = or i64 %t5204, 4
  %t5206 = getelementptr i64, ptr %t5203, i64 1
  store i64 %t5138, ptr %t5206
  %t5207 = getelementptr i64, ptr %t5203, i64 2
  store i64 %t5132, ptr %t5207
  %t5208 = getelementptr i64, ptr %t5203, i64 3
  store i64 %a0, ptr %t5208
  %t5209 = getelementptr i64, ptr %t5203, i64 4
  store i64 %a1, ptr %t5209
  %t5210 = getelementptr i64, ptr %t5203, i64 5
  store i64 %a2, ptr %t5210
  %t5211 = getelementptr i64, ptr %t5203, i64 6
  store i64 %t5205, ptr %t5211
  %t5212 = musttail call fastcc i64 @"scheme.base:code_993"(i64 %t5205, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5212
}

define fastcc i64 @"scheme.base:code_1011"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5217 = icmp eq i64 %argc, 1
  br i1 %t5217, label %argok1191, label %arityerr1190
arityerr1190:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1191:
  %t5218 = and i64 %self, -8
  %t5219 = inttoptr i64 %t5218 to ptr
  %t5220 = getelementptr i64, ptr %t5219, i64 1
  %t5221 = load i64, ptr %t5220
  %t5222 = or i64 %a0, %t5221
  %t5223 = and i64 %t5222, 7
  %t5224 = icmp eq i64 %t5223, 0
  br i1 %t5224, label %fixfast1192, label %fixslow1193
fixfast1192:
  %t5225 = icmp eq i64 %a0, %t5221
  %t5226 = select i1 %t5225, i64 257, i64 1
  br label %fixmerge1194
fixslow1193:
  %t5227 = call i64 @rt_num_eq(i64 %a0, i64 %t5221)
  br label %fixmerge1194
fixmerge1194:
  %t5228 = phi i64 [ %t5226, %fixfast1192 ], [ %t5227, %fixslow1193 ]
  %t5229 = icmp ne i64 %t5228, 1
  br i1 %t5229, label %then1195, label %else1196
then1195:
  %t5230 = and i64 %self, -8
  %t5231 = inttoptr i64 %t5230 to ptr
  %t5232 = getelementptr i64, ptr %t5231, i64 3
  %t5233 = load i64, ptr %t5232
  %t5234 = call i64 @rt_cdr(i64 %t5233)
  %t5235 = and i64 %self, -8
  %t5236 = inttoptr i64 %t5235 to ptr
  %t5237 = getelementptr i64, ptr %t5236, i64 4
  %t5238 = load i64, ptr %t5237
  %t5239 = and i64 %self, -8
  %t5240 = inttoptr i64 %t5239 to ptr
  %t5241 = getelementptr i64, ptr %t5240, i64 1
  %t5242 = load i64, ptr %t5241
  %t5243 = or i64 %t5238, %t5242
  %t5244 = and i64 %t5243, 7
  %t5245 = icmp eq i64 %t5244, 0
  br i1 %t5245, label %fixfast1197, label %fixslow1198
fixfast1197:
  %t5246 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5238, i64 %t5242)
  %t5247 = extractvalue {i64, i1} %t5246, 0
  %t5248 = extractvalue {i64, i1} %t5246, 1
  br i1 %t5248, label %fixslow1198, label %fixmerge1199
fixslow1198:
  %t5249 = call i64 @rt_add(i64 %t5238, i64 %t5242)
  br label %fixmerge1199
fixmerge1199:
  %t5250 = phi i64 [ %t5247, %fixfast1197 ], [ %t5249, %fixslow1198 ]
  %t5251 = and i64 %self, -8
  %t5252 = inttoptr i64 %t5251 to ptr
  %t5253 = getelementptr i64, ptr %t5252, i64 2
  %t5254 = load i64, ptr %t5253
  %t5255 = musttail call fastcc i64 @"scheme.base:code_1009"(i64 %t5254, i64 2, i64 %t5234, i64 %t5250, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5255
else1196:
  %t5256 = and i64 %self, -8
  %t5257 = inttoptr i64 %t5256 to ptr
  %t5258 = getelementptr i64, ptr %t5257, i64 5
  %t5259 = load i64, ptr %t5258
  %t5260 = and i64 %self, -8
  %t5261 = inttoptr i64 %t5260 to ptr
  %t5262 = getelementptr i64, ptr %t5261, i64 4
  %t5263 = load i64, ptr %t5262
  %t5264 = or i64 %t5263, %a0
  %t5265 = and i64 %t5264, 7
  %t5266 = icmp eq i64 %t5265, 0
  br i1 %t5266, label %fixfast1200, label %fixslow1201
fixfast1200:
  %t5267 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5263, i64 %a0)
  %t5268 = extractvalue {i64, i1} %t5267, 0
  %t5269 = extractvalue {i64, i1} %t5267, 1
  br i1 %t5269, label %fixslow1201, label %fixmerge1202
fixslow1201:
  %t5270 = call i64 @rt_add(i64 %t5263, i64 %a0)
  br label %fixmerge1202
fixmerge1202:
  %t5271 = phi i64 [ %t5268, %fixfast1200 ], [ %t5270, %fixslow1201 ]
  %t5272 = and i64 %self, -8
  %t5273 = inttoptr i64 %t5272 to ptr
  %t5274 = getelementptr i64, ptr %t5273, i64 6
  %t5275 = load i64, ptr %t5274
  %t5276 = call i64 @rt_bytevector_u8_ref(i64 %t5275, i64 %a0)
  %t5277 = call i64 @rt_bytevector_u8_set(i64 %t5259, i64 %t5271, i64 %t5276)
  %t5278 = or i64 %a0, 8
  %t5279 = and i64 %t5278, 7
  %t5280 = icmp eq i64 %t5279, 0
  br i1 %t5280, label %fixfast1203, label %fixslow1204
fixfast1203:
  %t5281 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5282 = extractvalue {i64, i1} %t5281, 0
  %t5283 = extractvalue {i64, i1} %t5281, 1
  br i1 %t5283, label %fixslow1204, label %fixmerge1205
fixslow1204:
  %t5284 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1205
fixmerge1205:
  %t5285 = phi i64 [ %t5282, %fixfast1203 ], [ %t5284, %fixslow1204 ]
  %t5286 = musttail call fastcc i64 @"scheme.base:code_1011"(i64 %self, i64 1, i64 %t5285, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5286
}

define fastcc i64 @"scheme.base:code_1009"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5287 = icmp eq i64 %argc, 2
  br i1 %t5287, label %argok1207, label %arityerr1206
arityerr1206:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1207:
  %t5288 = call i64 @rt_null_p(i64 %a0)
  %t5289 = icmp ne i64 %t5288, 1
  br i1 %t5289, label %then1208, label %else1209
then1208:
  %t5290 = and i64 %self, -8
  %t5291 = inttoptr i64 %t5290 to ptr
  %t5292 = getelementptr i64, ptr %t5291, i64 1
  %t5293 = load i64, ptr %t5292
  ret i64 %t5293
else1209:
  %t5294 = call i64 @rt_car(i64 %a0)
  %t5295 = call i64 @rt_bytevector_length(i64 %t5294)
  %t5296 = call ptr @rt_alloc_words(i64 8)
  %t5297 = ptrtoint ptr %t5296 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1011" to i64), ptr %t5296
  %t5298 = or i64 %t5297, 4
  %t5299 = getelementptr i64, ptr %t5296, i64 1
  store i64 %t5295, ptr %t5299
  %t5300 = and i64 %self, -8
  %t5301 = inttoptr i64 %t5300 to ptr
  %t5302 = getelementptr i64, ptr %t5301, i64 2
  %t5303 = load i64, ptr %t5302
  %t5304 = getelementptr i64, ptr %t5296, i64 2
  store i64 %t5303, ptr %t5304
  %t5305 = getelementptr i64, ptr %t5296, i64 3
  store i64 %a0, ptr %t5305
  %t5306 = getelementptr i64, ptr %t5296, i64 4
  store i64 %a1, ptr %t5306
  %t5307 = and i64 %self, -8
  %t5308 = inttoptr i64 %t5307 to ptr
  %t5309 = getelementptr i64, ptr %t5308, i64 1
  %t5310 = load i64, ptr %t5309
  %t5311 = getelementptr i64, ptr %t5296, i64 5
  store i64 %t5310, ptr %t5311
  %t5312 = getelementptr i64, ptr %t5296, i64 6
  store i64 %t5294, ptr %t5312
  %t5313 = getelementptr i64, ptr %t5296, i64 7
  store i64 %t5298, ptr %t5313
  %t5314 = musttail call fastcc i64 @"scheme.base:code_1011"(i64 %t5298, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5314
}

define fastcc i64 @"scheme.base:code:bytevector-append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5315 = icmp sge i64 %argc, 0
  br i1 %t5315, label %argok1211, label %arityerr1210
arityerr1210:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1211:
  %t5316 = call ptr @rt_alloc_words(i64 8)
  %t5317 = getelementptr i64, ptr %t5316, i64 0
  store i64 %a0, ptr %t5317
  %t5318 = getelementptr i64, ptr %t5316, i64 1
  store i64 %a1, ptr %t5318
  %t5319 = getelementptr i64, ptr %t5316, i64 2
  store i64 %a2, ptr %t5319
  %t5320 = getelementptr i64, ptr %t5316, i64 3
  store i64 %a3, ptr %t5320
  %t5321 = getelementptr i64, ptr %t5316, i64 4
  store i64 %a4, ptr %t5321
  %t5322 = getelementptr i64, ptr %t5316, i64 5
  store i64 %a5, ptr %t5322
  %t5323 = getelementptr i64, ptr %t5316, i64 6
  store i64 %a6, ptr %t5323
  %t5324 = getelementptr i64, ptr %t5316, i64 7
  store i64 %a7, ptr %t5324
  %t5325 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t5316, ptr %overflow)
  %t5326 = load i64, ptr @"scheme.base:bv-total"
  call void @rt_check_callable(i64 %t5326)
  %t5327 = and i64 %t5326, -8
  %t5328 = inttoptr i64 %t5327 to ptr
  %t5329 = load i64, ptr %t5328
  %t5330 = inttoptr i64 %t5329 to ptr
  %t5331 = call fastcc i64%t5330(i64 %t5326, i64 1, i64 %t5325, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5332 = call i64 @rt_make_bytevector(i64 %t5331, i64 0)
  %t5333 = call ptr @rt_alloc_words(i64 3)
  %t5334 = ptrtoint ptr %t5333 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1009" to i64), ptr %t5333
  %t5335 = or i64 %t5334, 4
  %t5336 = getelementptr i64, ptr %t5333, i64 1
  store i64 %t5332, ptr %t5336
  %t5337 = getelementptr i64, ptr %t5333, i64 2
  store i64 %t5335, ptr %t5337
  %t5338 = musttail call fastcc i64 @"scheme.base:code_1009"(i64 %t5335, i64 2, i64 %t5325, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5338
}

define fastcc i64 @"scheme.base:code:bv-total"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5343 = icmp eq i64 %argc, 1
  br i1 %t5343, label %argok1213, label %arityerr1212
arityerr1212:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1213:
  %t5344 = call i64 @rt_null_p(i64 %a0)
  %t5345 = icmp ne i64 %t5344, 1
  br i1 %t5345, label %then1214, label %else1215
then1214:
  ret i64 0
else1215:
  %t5346 = call i64 @rt_car(i64 %a0)
  %t5347 = call i64 @rt_bytevector_length(i64 %t5346)
  %t5348 = call i64 @rt_cdr(i64 %a0)
  %t5349 = load i64, ptr @"scheme.base:bv-total"
  call void @rt_check_callable(i64 %t5349)
  %t5350 = and i64 %t5349, -8
  %t5351 = inttoptr i64 %t5350 to ptr
  %t5352 = load i64, ptr %t5351
  %t5353 = inttoptr i64 %t5352 to ptr
  %t5354 = call fastcc i64%t5353(i64 %t5349, i64 1, i64 %t5348, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5355 = or i64 %t5347, %t5354
  %t5356 = and i64 %t5355, 7
  %t5357 = icmp eq i64 %t5356, 0
  br i1 %t5357, label %fixfast1216, label %fixslow1217
fixfast1216:
  %t5358 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5347, i64 %t5354)
  %t5359 = extractvalue {i64, i1} %t5358, 0
  %t5360 = extractvalue {i64, i1} %t5358, 1
  br i1 %t5360, label %fixslow1217, label %fixmerge1218
fixslow1217:
  %t5361 = call i64 @rt_add(i64 %t5347, i64 %t5354)
  br label %fixmerge1218
fixmerge1218:
  %t5362 = phi i64 [ %t5359, %fixfast1216 ], [ %t5361, %fixslow1217 ]
  ret i64 %t5362
}

define fastcc i64 @"scheme.base:code:rationalize"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5368 = icmp eq i64 %argc, 2
  br i1 %t5368, label %argok1220, label %arityerr1219
arityerr1219:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1220:
  %t5369 = load i64, ptr @"scheme.base:abs"
  call void @rt_check_callable(i64 %t5369)
  %t5370 = and i64 %t5369, -8
  %t5371 = inttoptr i64 %t5370 to ptr
  %t5372 = load i64, ptr %t5371
  %t5373 = inttoptr i64 %t5372 to ptr
  %t5374 = call fastcc i64%t5373(i64 %t5369, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5375 = or i64 %a0, %t5374
  %t5376 = and i64 %t5375, 7
  %t5377 = icmp eq i64 %t5376, 0
  br i1 %t5377, label %fixfast1221, label %fixslow1222
fixfast1221:
  %t5378 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t5374)
  %t5379 = extractvalue {i64, i1} %t5378, 0
  %t5380 = extractvalue {i64, i1} %t5378, 1
  br i1 %t5380, label %fixslow1222, label %fixmerge1223
fixslow1222:
  %t5381 = call i64 @rt_sub(i64 %a0, i64 %t5374)
  br label %fixmerge1223
fixmerge1223:
  %t5382 = phi i64 [ %t5379, %fixfast1221 ], [ %t5381, %fixslow1222 ]
  %t5383 = load i64, ptr @"scheme.base:abs"
  call void @rt_check_callable(i64 %t5383)
  %t5384 = and i64 %t5383, -8
  %t5385 = inttoptr i64 %t5384 to ptr
  %t5386 = load i64, ptr %t5385
  %t5387 = inttoptr i64 %t5386 to ptr
  %t5388 = call fastcc i64%t5387(i64 %t5383, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5389 = or i64 %a0, %t5388
  %t5390 = and i64 %t5389, 7
  %t5391 = icmp eq i64 %t5390, 0
  br i1 %t5391, label %fixfast1224, label %fixslow1225
fixfast1224:
  %t5392 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 %t5388)
  %t5393 = extractvalue {i64, i1} %t5392, 0
  %t5394 = extractvalue {i64, i1} %t5392, 1
  br i1 %t5394, label %fixslow1225, label %fixmerge1226
fixslow1225:
  %t5395 = call i64 @rt_add(i64 %a0, i64 %t5388)
  br label %fixmerge1226
fixmerge1226:
  %t5396 = phi i64 [ %t5393, %fixfast1224 ], [ %t5395, %fixslow1225 ]
  %t5397 = call i64 @rt_exact_p(i64 %a0)
  %t5398 = icmp ne i64 %t5397, 1
  br i1 %t5398, label %then1227, label %else1228
then1227:
  %t5399 = call i64 @rt_exact_p(i64 %a1)
  br label %merge1229
else1228:
  br label %merge1229
merge1229:
  %t5400 = phi i64 [ %t5399, %then1227 ], [ 1, %else1228 ]
  %t5401 = icmp ne i64 %t5400, 1
  br i1 %t5401, label %then1230, label %else1231
then1230:
  %t5402 = load i64, ptr @"scheme.base:rat-exact"
  call void @rt_check_callable(i64 %t5402)
  %t5403 = and i64 %t5402, -8
  %t5404 = inttoptr i64 %t5403 to ptr
  %t5405 = load i64, ptr %t5404
  %t5406 = inttoptr i64 %t5405 to ptr
  %t5407 = musttail call fastcc i64 %t5406(i64 %t5402, i64 2, i64 %t5382, i64 %t5396, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5407
else1231:
  %t5408 = call i64 @rt_exact_to_inexact(i64 %t5382)
  %t5409 = call i64 @rt_exact_to_inexact(i64 %t5396)
  %t5410 = load i64, ptr @"scheme.base:rat-inexact"
  call void @rt_check_callable(i64 %t5410)
  %t5411 = and i64 %t5410, -8
  %t5412 = inttoptr i64 %t5411 to ptr
  %t5413 = load i64, ptr %t5412
  %t5414 = inttoptr i64 %t5413 to ptr
  %t5415 = musttail call fastcc i64 %t5414(i64 %t5410, i64 2, i64 %t5408, i64 %t5409, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5415
}

define fastcc i64 @"scheme.base:code:rat-exact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5420 = icmp eq i64 %argc, 2
  br i1 %t5420, label %argok1233, label %arityerr1232
arityerr1232:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1233:
  %t5421 = or i64 %a0, 0
  %t5422 = and i64 %t5421, 7
  %t5423 = icmp eq i64 %t5422, 0
  br i1 %t5423, label %fixfast1234, label %fixslow1235
fixfast1234:
  %t5424 = icmp slt i64 %a0, 0
  %t5425 = select i1 %t5424, i64 257, i64 1
  br label %fixmerge1236
fixslow1235:
  %t5426 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge1236
fixmerge1236:
  %t5427 = phi i64 [ %t5425, %fixfast1234 ], [ %t5426, %fixslow1235 ]
  %t5428 = icmp ne i64 %t5427, 1
  br i1 %t5428, label %then1237, label %else1238
then1237:
  br label %merge1239
else1238:
  %t5429 = or i64 %a0, 0
  %t5430 = and i64 %t5429, 7
  %t5431 = icmp eq i64 %t5430, 0
  br i1 %t5431, label %fixfast1240, label %fixslow1241
fixfast1240:
  %t5432 = icmp eq i64 %a0, 0
  %t5433 = select i1 %t5432, i64 257, i64 1
  br label %fixmerge1242
fixslow1241:
  %t5434 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge1242
fixmerge1242:
  %t5435 = phi i64 [ %t5433, %fixfast1240 ], [ %t5434, %fixslow1241 ]
  br label %merge1239
merge1239:
  %t5436 = phi i64 [ 257, %then1237 ], [ %t5435, %fixmerge1242 ]
  %t5437 = icmp ne i64 %t5436, 1
  br i1 %t5437, label %then1243, label %else1244
then1243:
  %t5438 = or i64 0, %a1
  %t5439 = and i64 %t5438, 7
  %t5440 = icmp eq i64 %t5439, 0
  br i1 %t5440, label %fixfast1246, label %fixslow1247
fixfast1246:
  %t5441 = icmp slt i64 0, %a1
  %t5442 = select i1 %t5441, i64 257, i64 1
  br label %fixmerge1248
fixslow1247:
  %t5443 = call i64 @rt_lt(i64 0, i64 %a1)
  br label %fixmerge1248
fixmerge1248:
  %t5444 = phi i64 [ %t5442, %fixfast1246 ], [ %t5443, %fixslow1247 ]
  %t5445 = icmp ne i64 %t5444, 1
  br i1 %t5445, label %then1249, label %else1250
then1249:
  br label %merge1251
else1250:
  %t5446 = or i64 0, %a1
  %t5447 = and i64 %t5446, 7
  %t5448 = icmp eq i64 %t5447, 0
  br i1 %t5448, label %fixfast1252, label %fixslow1253
fixfast1252:
  %t5449 = icmp eq i64 0, %a1
  %t5450 = select i1 %t5449, i64 257, i64 1
  br label %fixmerge1254
fixslow1253:
  %t5451 = call i64 @rt_num_eq(i64 0, i64 %a1)
  br label %fixmerge1254
fixmerge1254:
  %t5452 = phi i64 [ %t5450, %fixfast1252 ], [ %t5451, %fixslow1253 ]
  br label %merge1251
merge1251:
  %t5453 = phi i64 [ 257, %then1249 ], [ %t5452, %fixmerge1254 ]
  br label %merge1245
else1244:
  br label %merge1245
merge1245:
  %t5454 = phi i64 [ %t5453, %merge1251 ], [ 1, %else1244 ]
  %t5455 = icmp ne i64 %t5454, 1
  br i1 %t5455, label %then1255, label %else1256
then1255:
  ret i64 0
else1256:
  %t5456 = or i64 0, %a0
  %t5457 = and i64 %t5456, 7
  %t5458 = icmp eq i64 %t5457, 0
  br i1 %t5458, label %fixfast1257, label %fixslow1258
fixfast1257:
  %t5459 = icmp slt i64 0, %a0
  %t5460 = select i1 %t5459, i64 257, i64 1
  br label %fixmerge1259
fixslow1258:
  %t5461 = call i64 @rt_lt(i64 0, i64 %a0)
  br label %fixmerge1259
fixmerge1259:
  %t5462 = phi i64 [ %t5460, %fixfast1257 ], [ %t5461, %fixslow1258 ]
  %t5463 = icmp ne i64 %t5462, 1
  br i1 %t5463, label %then1260, label %else1261
then1260:
  %t5464 = load i64, ptr @"scheme.base:rat-ceil"
  call void @rt_check_callable(i64 %t5464)
  %t5465 = and i64 %t5464, -8
  %t5466 = inttoptr i64 %t5465 to ptr
  %t5467 = load i64, ptr %t5466
  %t5468 = inttoptr i64 %t5467 to ptr
  %t5469 = call fastcc i64%t5468(i64 %t5464, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5470 = or i64 %t5469, %a1
  %t5471 = and i64 %t5470, 7
  %t5472 = icmp eq i64 %t5471, 0
  br i1 %t5472, label %fixfast1262, label %fixslow1263
fixfast1262:
  %t5473 = icmp slt i64 %t5469, %a1
  %t5474 = select i1 %t5473, i64 257, i64 1
  br label %fixmerge1264
fixslow1263:
  %t5475 = call i64 @rt_lt(i64 %t5469, i64 %a1)
  br label %fixmerge1264
fixmerge1264:
  %t5476 = phi i64 [ %t5474, %fixfast1262 ], [ %t5475, %fixslow1263 ]
  %t5477 = icmp ne i64 %t5476, 1
  br i1 %t5477, label %then1265, label %else1266
then1265:
  br label %merge1267
else1266:
  %t5478 = or i64 %t5469, %a1
  %t5479 = and i64 %t5478, 7
  %t5480 = icmp eq i64 %t5479, 0
  br i1 %t5480, label %fixfast1268, label %fixslow1269
fixfast1268:
  %t5481 = icmp eq i64 %t5469, %a1
  %t5482 = select i1 %t5481, i64 257, i64 1
  br label %fixmerge1270
fixslow1269:
  %t5483 = call i64 @rt_num_eq(i64 %t5469, i64 %a1)
  br label %fixmerge1270
fixmerge1270:
  %t5484 = phi i64 [ %t5482, %fixfast1268 ], [ %t5483, %fixslow1269 ]
  br label %merge1267
merge1267:
  %t5485 = phi i64 [ 257, %then1265 ], [ %t5484, %fixmerge1270 ]
  %t5486 = icmp ne i64 %t5485, 1
  br i1 %t5486, label %then1271, label %else1272
then1271:
  %t5487 = load i64, ptr @"scheme.base:rat-ceil"
  call void @rt_check_callable(i64 %t5487)
  %t5488 = and i64 %t5487, -8
  %t5489 = inttoptr i64 %t5488 to ptr
  %t5490 = load i64, ptr %t5489
  %t5491 = inttoptr i64 %t5490 to ptr
  %t5492 = musttail call fastcc i64 %t5491(i64 %t5487, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5492
else1272:
  %t5493 = call i64 @rt_make_string(ptr @.str.lit.24, i64 69)
  %t5494 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t5494)
  %t5495 = and i64 %t5494, -8
  %t5496 = inttoptr i64 %t5495 to ptr
  %t5497 = load i64, ptr %t5496
  %t5498 = inttoptr i64 %t5497 to ptr
  %t5499 = musttail call fastcc i64 %t5498(i64 %t5494, i64 3, i64 %t5493, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5499
else1261:
  %t5500 = load i64, ptr @"scheme.base:rat-floor"
  call void @rt_check_callable(i64 %t5500)
  %t5501 = and i64 %t5500, -8
  %t5502 = inttoptr i64 %t5501 to ptr
  %t5503 = load i64, ptr %t5502
  %t5504 = inttoptr i64 %t5503 to ptr
  %t5505 = call fastcc i64%t5504(i64 %t5500, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5506 = or i64 %a0, %t5505
  %t5507 = and i64 %t5506, 7
  %t5508 = icmp eq i64 %t5507, 0
  br i1 %t5508, label %fixfast1273, label %fixslow1274
fixfast1273:
  %t5509 = icmp slt i64 %a0, %t5505
  %t5510 = select i1 %t5509, i64 257, i64 1
  br label %fixmerge1275
fixslow1274:
  %t5511 = call i64 @rt_lt(i64 %a0, i64 %t5505)
  br label %fixmerge1275
fixmerge1275:
  %t5512 = phi i64 [ %t5510, %fixfast1273 ], [ %t5511, %fixslow1274 ]
  %t5513 = icmp ne i64 %t5512, 1
  br i1 %t5513, label %then1276, label %else1277
then1276:
  br label %merge1278
else1277:
  %t5514 = or i64 %a0, %t5505
  %t5515 = and i64 %t5514, 7
  %t5516 = icmp eq i64 %t5515, 0
  br i1 %t5516, label %fixfast1279, label %fixslow1280
fixfast1279:
  %t5517 = icmp eq i64 %a0, %t5505
  %t5518 = select i1 %t5517, i64 257, i64 1
  br label %fixmerge1281
fixslow1280:
  %t5519 = call i64 @rt_num_eq(i64 %a0, i64 %t5505)
  br label %fixmerge1281
fixmerge1281:
  %t5520 = phi i64 [ %t5518, %fixfast1279 ], [ %t5519, %fixslow1280 ]
  br label %merge1278
merge1278:
  %t5521 = phi i64 [ 257, %then1276 ], [ %t5520, %fixmerge1281 ]
  %t5522 = icmp ne i64 %t5521, 1
  br i1 %t5522, label %then1282, label %else1283
then1282:
  %t5523 = load i64, ptr @"scheme.base:rat-floor"
  call void @rt_check_callable(i64 %t5523)
  %t5524 = and i64 %t5523, -8
  %t5525 = inttoptr i64 %t5524 to ptr
  %t5526 = load i64, ptr %t5525
  %t5527 = inttoptr i64 %t5526 to ptr
  %t5528 = musttail call fastcc i64 %t5527(i64 %t5523, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5528
else1283:
  %t5529 = call i64 @rt_make_string(ptr @.str.lit.25, i64 69)
  %t5530 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t5530)
  %t5531 = and i64 %t5530, -8
  %t5532 = inttoptr i64 %t5531 to ptr
  %t5533 = load i64, ptr %t5532
  %t5534 = inttoptr i64 %t5533 to ptr
  %t5535 = musttail call fastcc i64 %t5534(i64 %t5530, i64 3, i64 %t5529, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5535
}

define fastcc i64 @"scheme.base:code:rat-ceil"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5540 = icmp eq i64 %argc, 1
  br i1 %t5540, label %argok1285, label %arityerr1284
arityerr1284:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1285:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:rat-floor"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5545 = icmp eq i64 %argc, 1
  br i1 %t5545, label %argok1287, label %arityerr1286
arityerr1286:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1287:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_1065"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5550 = icmp eq i64 %argc, 1
  br i1 %t5550, label %argok1289, label %arityerr1288
arityerr1288:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1289:
  %t5551 = load i64, ptr @"scheme.base:rat-max-denom"
  %t5552 = or i64 %t5551, %a0
  %t5553 = and i64 %t5552, 7
  %t5554 = icmp eq i64 %t5553, 0
  br i1 %t5554, label %fixfast1290, label %fixslow1291
fixfast1290:
  %t5555 = icmp slt i64 %t5551, %a0
  %t5556 = select i1 %t5555, i64 257, i64 1
  br label %fixmerge1292
fixslow1291:
  %t5557 = call i64 @rt_lt(i64 %t5551, i64 %a0)
  br label %fixmerge1292
fixmerge1292:
  %t5558 = phi i64 [ %t5556, %fixfast1290 ], [ %t5557, %fixslow1291 ]
  %t5559 = icmp ne i64 %t5558, 1
  br i1 %t5559, label %then1293, label %else1294
then1293:
  %t5560 = call i64 @rt_make_string(ptr @.str.lit.26, i64 59)
  %t5561 = and i64 %self, -8
  %t5562 = inttoptr i64 %t5561 to ptr
  %t5563 = getelementptr i64, ptr %t5562, i64 1
  %t5564 = load i64, ptr %t5563
  %t5565 = and i64 %self, -8
  %t5566 = inttoptr i64 %t5565 to ptr
  %t5567 = getelementptr i64, ptr %t5566, i64 2
  %t5568 = load i64, ptr %t5567
  %t5569 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t5569)
  %t5570 = and i64 %t5569, -8
  %t5571 = inttoptr i64 %t5570 to ptr
  %t5572 = load i64, ptr %t5571
  %t5573 = inttoptr i64 %t5572 to ptr
  %t5574 = musttail call fastcc i64 %t5573(i64 %t5569, i64 3, i64 %t5560, i64 %t5564, i64 %t5568, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5574
else1294:
  %t5575 = and i64 %self, -8
  %t5576 = inttoptr i64 %t5575 to ptr
  %t5577 = getelementptr i64, ptr %t5576, i64 1
  %t5578 = load i64, ptr %t5577
  %t5579 = or i64 %t5578, %a0
  %t5580 = and i64 %t5579, 7
  %t5581 = icmp eq i64 %t5580, 0
  br i1 %t5581, label %fixfast1295, label %fixslow1296
fixfast1295:
  %t5582 = ashr i64 %t5578, 3
  %t5583 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t5582, i64 %a0)
  %t5584 = extractvalue {i64, i1} %t5583, 0
  %t5585 = extractvalue {i64, i1} %t5583, 1
  br i1 %t5585, label %fixslow1296, label %fixmerge1297
fixslow1296:
  %t5586 = call i64 @rt_mul(i64 %t5578, i64 %a0)
  br label %fixmerge1297
fixmerge1297:
  %t5587 = phi i64 [ %t5584, %fixfast1295 ], [ %t5586, %fixslow1296 ]
  %t5588 = and i64 %self, -8
  %t5589 = inttoptr i64 %t5588 to ptr
  %t5590 = getelementptr i64, ptr %t5589, i64 2
  %t5591 = load i64, ptr %t5590
  %t5592 = or i64 %t5591, %a0
  %t5593 = and i64 %t5592, 7
  %t5594 = icmp eq i64 %t5593, 0
  br i1 %t5594, label %fixfast1298, label %fixslow1299
fixfast1298:
  %t5595 = ashr i64 %t5591, 3
  %t5596 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t5595, i64 %a0)
  %t5597 = extractvalue {i64, i1} %t5596, 0
  %t5598 = extractvalue {i64, i1} %t5596, 1
  br i1 %t5598, label %fixslow1299, label %fixmerge1300
fixslow1299:
  %t5599 = call i64 @rt_mul(i64 %t5591, i64 %a0)
  br label %fixmerge1300
fixmerge1300:
  %t5600 = phi i64 [ %t5597, %fixfast1298 ], [ %t5599, %fixslow1299 ]
  %t5601 = load i64, ptr @"scheme.base:rat-num-in"
  call void @rt_check_callable(i64 %t5601)
  %t5602 = and i64 %t5601, -8
  %t5603 = inttoptr i64 %t5602 to ptr
  %t5604 = load i64, ptr %t5603
  %t5605 = inttoptr i64 %t5604 to ptr
  %t5606 = call fastcc i64%t5605(i64 %t5601, i64 2, i64 %t5587, i64 %t5600, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5607 = icmp ne i64 %t5606, 1
  br i1 %t5607, label %then1301, label %else1302
then1301:
  %t5608 = call i64 @rt_exact_to_inexact(i64 %t5606)
  %t5609 = call i64 @rt_exact_to_inexact(i64 %a0)
  %t5610 = call i64 @rt_div(i64 %t5608, i64 %t5609)
  ret i64 %t5610
else1302:
  %t5611 = or i64 %a0, 8
  %t5612 = and i64 %t5611, 7
  %t5613 = icmp eq i64 %t5612, 0
  br i1 %t5613, label %fixfast1303, label %fixslow1304
fixfast1303:
  %t5614 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5615 = extractvalue {i64, i1} %t5614, 0
  %t5616 = extractvalue {i64, i1} %t5614, 1
  br i1 %t5616, label %fixslow1304, label %fixmerge1305
fixslow1304:
  %t5617 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1305
fixmerge1305:
  %t5618 = phi i64 [ %t5615, %fixfast1303 ], [ %t5617, %fixslow1304 ]
  %t5619 = musttail call fastcc i64 @"scheme.base:code_1065"(i64 %self, i64 1, i64 %t5618, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5619
}

define fastcc i64 @"scheme.base:code:rat-inexact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5620 = icmp eq i64 %argc, 2
  br i1 %t5620, label %argok1307, label %arityerr1306
arityerr1306:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1307:
  %t5621 = call i64 @rt_flonum_lit(ptr @.flo.lit.27)
  %t5622 = or i64 %a0, %t5621
  %t5623 = and i64 %t5622, 7
  %t5624 = icmp eq i64 %t5623, 0
  br i1 %t5624, label %fixfast1308, label %fixslow1309
fixfast1308:
  %t5625 = icmp slt i64 %a0, %t5621
  %t5626 = select i1 %t5625, i64 257, i64 1
  br label %fixmerge1310
fixslow1309:
  %t5627 = call i64 @rt_lt(i64 %a0, i64 %t5621)
  br label %fixmerge1310
fixmerge1310:
  %t5628 = phi i64 [ %t5626, %fixfast1308 ], [ %t5627, %fixslow1309 ]
  %t5629 = icmp ne i64 %t5628, 1
  br i1 %t5629, label %then1311, label %else1312
then1311:
  br label %merge1313
else1312:
  %t5630 = or i64 %a0, %t5621
  %t5631 = and i64 %t5630, 7
  %t5632 = icmp eq i64 %t5631, 0
  br i1 %t5632, label %fixfast1314, label %fixslow1315
fixfast1314:
  %t5633 = icmp eq i64 %a0, %t5621
  %t5634 = select i1 %t5633, i64 257, i64 1
  br label %fixmerge1316
fixslow1315:
  %t5635 = call i64 @rt_num_eq(i64 %a0, i64 %t5621)
  br label %fixmerge1316
fixmerge1316:
  %t5636 = phi i64 [ %t5634, %fixfast1314 ], [ %t5635, %fixslow1315 ]
  br label %merge1313
merge1313:
  %t5637 = phi i64 [ 257, %then1311 ], [ %t5636, %fixmerge1316 ]
  %t5638 = icmp ne i64 %t5637, 1
  br i1 %t5638, label %then1317, label %else1318
then1317:
  %t5639 = call i64 @rt_flonum_lit(ptr @.flo.lit.28)
  %t5640 = or i64 %t5639, %a1
  %t5641 = and i64 %t5640, 7
  %t5642 = icmp eq i64 %t5641, 0
  br i1 %t5642, label %fixfast1320, label %fixslow1321
fixfast1320:
  %t5643 = icmp slt i64 %t5639, %a1
  %t5644 = select i1 %t5643, i64 257, i64 1
  br label %fixmerge1322
fixslow1321:
  %t5645 = call i64 @rt_lt(i64 %t5639, i64 %a1)
  br label %fixmerge1322
fixmerge1322:
  %t5646 = phi i64 [ %t5644, %fixfast1320 ], [ %t5645, %fixslow1321 ]
  %t5647 = icmp ne i64 %t5646, 1
  br i1 %t5647, label %then1323, label %else1324
then1323:
  br label %merge1325
else1324:
  %t5648 = or i64 %t5639, %a1
  %t5649 = and i64 %t5648, 7
  %t5650 = icmp eq i64 %t5649, 0
  br i1 %t5650, label %fixfast1326, label %fixslow1327
fixfast1326:
  %t5651 = icmp eq i64 %t5639, %a1
  %t5652 = select i1 %t5651, i64 257, i64 1
  br label %fixmerge1328
fixslow1327:
  %t5653 = call i64 @rt_num_eq(i64 %t5639, i64 %a1)
  br label %fixmerge1328
fixmerge1328:
  %t5654 = phi i64 [ %t5652, %fixfast1326 ], [ %t5653, %fixslow1327 ]
  br label %merge1325
merge1325:
  %t5655 = phi i64 [ 257, %then1323 ], [ %t5654, %fixmerge1328 ]
  br label %merge1319
else1318:
  br label %merge1319
merge1319:
  %t5656 = phi i64 [ %t5655, %merge1325 ], [ 1, %else1318 ]
  %t5657 = icmp ne i64 %t5656, 1
  br i1 %t5657, label %then1329, label %else1330
then1329:
  %t5658 = call i64 @rt_flonum_lit(ptr @.flo.lit.29)
  ret i64 %t5658
else1330:
  %t5659 = call ptr @rt_alloc_words(i64 4)
  %t5660 = ptrtoint ptr %t5659 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1065" to i64), ptr %t5659
  %t5661 = or i64 %t5660, 4
  %t5662 = getelementptr i64, ptr %t5659, i64 1
  store i64 %a0, ptr %t5662
  %t5663 = getelementptr i64, ptr %t5659, i64 2
  store i64 %a1, ptr %t5663
  %t5664 = getelementptr i64, ptr %t5659, i64 3
  store i64 %t5661, ptr %t5664
  %t5665 = musttail call fastcc i64 @"scheme.base:code_1065"(i64 %t5661, i64 1, i64 8, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5665
}

define fastcc i64 @"scheme.base:code:rat-num-in"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5670 = icmp eq i64 %argc, 2
  br i1 %t5670, label %argok1332, label %arityerr1331
arityerr1331:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1332:
  %t5671 = load i64, ptr @"scheme.base:rat-ceil-flo"
  call void @rt_check_callable(i64 %t5671)
  %t5672 = and i64 %t5671, -8
  %t5673 = inttoptr i64 %t5672 to ptr
  %t5674 = load i64, ptr %t5673
  %t5675 = inttoptr i64 %t5674 to ptr
  %t5676 = call fastcc i64%t5675(i64 %t5671, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5677 = call i64 @rt_exact_to_inexact(i64 %t5676)
  %t5678 = or i64 %t5677, %a1
  %t5679 = and i64 %t5678, 7
  %t5680 = icmp eq i64 %t5679, 0
  br i1 %t5680, label %fixfast1333, label %fixslow1334
fixfast1333:
  %t5681 = icmp slt i64 %t5677, %a1
  %t5682 = select i1 %t5681, i64 257, i64 1
  br label %fixmerge1335
fixslow1334:
  %t5683 = call i64 @rt_lt(i64 %t5677, i64 %a1)
  br label %fixmerge1335
fixmerge1335:
  %t5684 = phi i64 [ %t5682, %fixfast1333 ], [ %t5683, %fixslow1334 ]
  %t5685 = icmp ne i64 %t5684, 1
  br i1 %t5685, label %then1336, label %else1337
then1336:
  br label %merge1338
else1337:
  %t5686 = or i64 %t5677, %a1
  %t5687 = and i64 %t5686, 7
  %t5688 = icmp eq i64 %t5687, 0
  br i1 %t5688, label %fixfast1339, label %fixslow1340
fixfast1339:
  %t5689 = icmp eq i64 %t5677, %a1
  %t5690 = select i1 %t5689, i64 257, i64 1
  br label %fixmerge1341
fixslow1340:
  %t5691 = call i64 @rt_num_eq(i64 %t5677, i64 %a1)
  br label %fixmerge1341
fixmerge1341:
  %t5692 = phi i64 [ %t5690, %fixfast1339 ], [ %t5691, %fixslow1340 ]
  br label %merge1338
merge1338:
  %t5693 = phi i64 [ 257, %then1336 ], [ %t5692, %fixmerge1341 ]
  %t5694 = icmp ne i64 %t5693, 1
  br i1 %t5694, label %then1342, label %else1343
then1342:
  ret i64 %t5676
else1343:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rat-ceil-flo"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5699 = icmp eq i64 %argc, 1
  br i1 %t5699, label %argok1345, label %arityerr1344
arityerr1344:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1345:
  %t5700 = load i64, ptr @"scheme.base:floor"
  call void @rt_check_callable(i64 %t5700)
  %t5701 = and i64 %t5700, -8
  %t5702 = inttoptr i64 %t5701 to ptr
  %t5703 = load i64, ptr %t5702
  %t5704 = inttoptr i64 %t5703 to ptr
  %t5705 = call fastcc i64%t5704(i64 %t5700, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5706 = call i64 @rt_inexact_to_exact(i64 %t5705)
  %t5707 = call i64 @rt_exact_to_inexact(i64 %t5706)
  %t5708 = or i64 %t5707, %a0
  %t5709 = and i64 %t5708, 7
  %t5710 = icmp eq i64 %t5709, 0
  br i1 %t5710, label %fixfast1346, label %fixslow1347
fixfast1346:
  %t5711 = icmp slt i64 %t5707, %a0
  %t5712 = select i1 %t5711, i64 257, i64 1
  br label %fixmerge1348
fixslow1347:
  %t5713 = call i64 @rt_lt(i64 %t5707, i64 %a0)
  br label %fixmerge1348
fixmerge1348:
  %t5714 = phi i64 [ %t5712, %fixfast1346 ], [ %t5713, %fixslow1347 ]
  %t5715 = icmp ne i64 %t5714, 1
  br i1 %t5715, label %then1349, label %else1350
then1349:
  %t5716 = or i64 %t5706, 8
  %t5717 = and i64 %t5716, 7
  %t5718 = icmp eq i64 %t5717, 0
  br i1 %t5718, label %fixfast1351, label %fixslow1352
fixfast1351:
  %t5719 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5706, i64 8)
  %t5720 = extractvalue {i64, i1} %t5719, 0
  %t5721 = extractvalue {i64, i1} %t5719, 1
  br i1 %t5721, label %fixslow1352, label %fixmerge1353
fixslow1352:
  %t5722 = call i64 @rt_add(i64 %t5706, i64 8)
  br label %fixmerge1353
fixmerge1353:
  %t5723 = phi i64 [ %t5720, %fixfast1351 ], [ %t5722, %fixslow1352 ]
  ret i64 %t5723
else1350:
  ret i64 %t5706
}

define fastcc i64 @"scheme.base:code:values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5728 = icmp sge i64 %argc, 0
  br i1 %t5728, label %argok1355, label %arityerr1354
arityerr1354:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1355:
  %t5729 = call ptr @rt_alloc_words(i64 8)
  %t5730 = getelementptr i64, ptr %t5729, i64 0
  store i64 %a0, ptr %t5730
  %t5731 = getelementptr i64, ptr %t5729, i64 1
  store i64 %a1, ptr %t5731
  %t5732 = getelementptr i64, ptr %t5729, i64 2
  store i64 %a2, ptr %t5732
  %t5733 = getelementptr i64, ptr %t5729, i64 3
  store i64 %a3, ptr %t5733
  %t5734 = getelementptr i64, ptr %t5729, i64 4
  store i64 %a4, ptr %t5734
  %t5735 = getelementptr i64, ptr %t5729, i64 5
  store i64 %a5, ptr %t5735
  %t5736 = getelementptr i64, ptr %t5729, i64 6
  store i64 %a6, ptr %t5736
  %t5737 = getelementptr i64, ptr %t5729, i64 7
  store i64 %a7, ptr %t5737
  %t5738 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t5729, ptr %overflow)
  %t5739 = call i64 @rt_pair_p(i64 %t5738)
  %t5740 = icmp ne i64 %t5739, 1
  br i1 %t5740, label %then1356, label %else1357
then1356:
  %t5741 = call i64 @rt_cdr(i64 %t5738)
  %t5742 = call i64 @rt_null_p(i64 %t5741)
  br label %merge1358
else1357:
  br label %merge1358
merge1358:
  %t5743 = phi i64 [ %t5742, %then1356 ], [ 1, %else1357 ]
  %t5744 = icmp ne i64 %t5743, 1
  br i1 %t5744, label %then1359, label %else1360
then1359:
  %t5745 = call i64 @rt_car(i64 %t5738)
  ret i64 %t5745
else1360:
  %t5746 = call i64 @rt_list_to_mv(i64 %t5738)
  ret i64 %t5746
}

define fastcc i64 @"scheme.base:code:call-with-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5751 = icmp eq i64 %argc, 2
  br i1 %t5751, label %argok1362, label %arityerr1361
arityerr1361:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1362:
  call void @rt_check_callable(i64 %a0)
  %t5752 = and i64 %a0, -8
  %t5753 = inttoptr i64 %t5752 to ptr
  %t5754 = load i64, ptr %t5753
  %t5755 = inttoptr i64 %t5754 to ptr
  %t5756 = call fastcc i64%t5755(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5757 = call i64 @rt_mv_p(i64 %t5756)
  %t5758 = icmp ne i64 %t5757, 1
  br i1 %t5758, label %then1363, label %else1364
then1363:
  %t5759 = call i64 @rt_mv_to_list(i64 %t5756)
  call void @rt_check_callable(i64 %a1)
  %t5760 = and i64 %a1, -8
  %t5761 = inttoptr i64 %t5760 to ptr
  %t5762 = load i64, ptr %t5761
  %t5763 = inttoptr i64 %t5762 to ptr
  %t5764 = call i64 @rt_list_length(i64 %t5759)
  %t5765 = add i64 0, %t5764
  %t5766 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t5759, i64 8)
  %t5778 = getelementptr i64, ptr %t5766, i64 0
  %t5770 = load i64, ptr %t5778
  %t5779 = getelementptr i64, ptr %t5766, i64 1
  %t5771 = load i64, ptr %t5779
  %t5780 = getelementptr i64, ptr %t5766, i64 2
  %t5772 = load i64, ptr %t5780
  %t5781 = getelementptr i64, ptr %t5766, i64 3
  %t5773 = load i64, ptr %t5781
  %t5782 = getelementptr i64, ptr %t5766, i64 4
  %t5774 = load i64, ptr %t5782
  %t5783 = getelementptr i64, ptr %t5766, i64 5
  %t5775 = load i64, ptr %t5783
  %t5784 = getelementptr i64, ptr %t5766, i64 6
  %t5776 = load i64, ptr %t5784
  %t5785 = getelementptr i64, ptr %t5766, i64 7
  %t5777 = load i64, ptr %t5785
  %t5767 = icmp sgt i64 %t5765, 8
  %t5768 = getelementptr i64, ptr %t5766, i64 8
  %t5769 = select i1 %t5767, ptr %t5768, ptr null
  %t5786 = musttail call fastcc i64 %t5763(i64 %a1, i64 %t5765, i64 %t5770, i64 %t5771, i64 %t5772, i64 %t5773, i64 %t5774, i64 %t5775, i64 %t5776, i64 %t5777, ptr %t5769)
  ret i64 %t5786
else1364:
  call void @rt_check_callable(i64 %a1)
  %t5787 = and i64 %a1, -8
  %t5788 = inttoptr i64 %t5787 to ptr
  %t5789 = load i64, ptr %t5788
  %t5790 = inttoptr i64 %t5789 to ptr
  %t5791 = musttail call fastcc i64 %t5790(i64 %a1, i64 1, i64 %t5756, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5791
}

define fastcc i64 @"scheme.base:code:make-hash-table"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5798 = icmp eq i64 %argc, 0
  br i1 %t5798, label %argok1366, label %arityerr1365
arityerr1365:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1366:
  %t5799 = load i64, ptr @"scheme.base:%ht-initial-buckets"
  %t5800 = call i64 @rt_make_vector(i64 %t5799, i64 2)
  %t5801 = load i64, ptr @"scheme.base:vector"
  call void @rt_check_callable(i64 %t5801)
  %t5802 = and i64 %t5801, -8
  %t5803 = inttoptr i64 %t5802 to ptr
  %t5804 = load i64, ptr %t5803
  %t5805 = inttoptr i64 %t5804 to ptr
  %t5806 = call fastcc i64%t5805(i64 %t5801, i64 3, i64 0, i64 %t5800, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5807 = call i64 @rt_make_hash_table(i64 %t5806)
  ret i64 %t5807
}

define fastcc i64 @"scheme.base:code:hash-table?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5812 = icmp eq i64 %argc, 1
  br i1 %t5812, label %argok1368, label %arityerr1367
arityerr1367:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1368:
  %t5813 = call i64 @rt_hash_table_p(i64 %a0)
  ret i64 %t5813
}

define fastcc i64 @"scheme.base:code:%ht-count"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5818 = icmp eq i64 %argc, 1
  br i1 %t5818, label %argok1370, label %arityerr1369
arityerr1369:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1370:
  %t5819 = call i64 @rt_hash_table_spine(i64 %a0)
  %t5820 = call i64 @rt_vector_ref(i64 %t5819, i64 0)
  ret i64 %t5820
}

define fastcc i64 @"scheme.base:code:%ht-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5825 = icmp eq i64 %argc, 1
  br i1 %t5825, label %argok1372, label %arityerr1371
arityerr1371:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1372:
  %t5826 = call i64 @rt_hash_table_spine(i64 %a0)
  %t5827 = call i64 @rt_vector_ref(i64 %t5826, i64 8)
  ret i64 %t5827
}

define fastcc i64 @"scheme.base:code:%ht-set-count!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5832 = icmp eq i64 %argc, 2
  br i1 %t5832, label %argok1374, label %arityerr1373
arityerr1373:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1374:
  %t5833 = call i64 @rt_hash_table_spine(i64 %a0)
  %t5834 = call i64 @rt_vector_set(i64 %t5833, i64 0, i64 %a1)
  ret i64 %t5834
}

define fastcc i64 @"scheme.base:code:%ht-set-buckets!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5839 = icmp eq i64 %argc, 2
  br i1 %t5839, label %argok1376, label %arityerr1375
arityerr1375:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1376:
  %t5840 = call i64 @rt_hash_table_spine(i64 %a0)
  %t5841 = call i64 @rt_vector_set(i64 %t5840, i64 8, i64 %a1)
  ret i64 %t5841
}

define fastcc i64 @"scheme.base:code:%ht-index"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5846 = icmp eq i64 %argc, 2
  br i1 %t5846, label %argok1378, label %arityerr1377
arityerr1377:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1378:
  %t5847 = call i64 @rt_hash(i64 %a0)
  %t5848 = call i64 @rt_remainder(i64 %t5847, i64 %a1)
  ret i64 %t5848
}

define fastcc i64 @"scheme.base:code:%ht-assoc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5853 = icmp eq i64 %argc, 2
  br i1 %t5853, label %argok1380, label %arityerr1379
arityerr1379:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1380:
  %t5854 = call i64 @rt_null_p(i64 %a1)
  %t5855 = icmp ne i64 %t5854, 1
  br i1 %t5855, label %then1381, label %else1382
then1381:
  ret i64 1
else1382:
  %t5856 = call i64 @rt_car(i64 %a1)
  %t5857 = call i64 @rt_car(i64 %t5856)
  %t5858 = call i64 @rt_equal(i64 %a0, i64 %t5857)
  %t5859 = icmp ne i64 %t5858, 1
  br i1 %t5859, label %then1383, label %else1384
then1383:
  %t5860 = call i64 @rt_car(i64 %a1)
  ret i64 %t5860
else1384:
  %t5861 = call i64 @rt_cdr(i64 %a1)
  %t5862 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t5862)
  %t5863 = and i64 %t5862, -8
  %t5864 = inttoptr i64 %t5863 to ptr
  %t5865 = load i64, ptr %t5864
  %t5866 = inttoptr i64 %t5865 to ptr
  %t5867 = musttail call fastcc i64 %t5866(i64 %t5862, i64 2, i64 %a0, i64 %t5861, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5867
}

define fastcc i64 @"scheme.base:code:%ht-remove"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5872 = icmp eq i64 %argc, 2
  br i1 %t5872, label %argok1386, label %arityerr1385
arityerr1385:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1386:
  %t5873 = call i64 @rt_null_p(i64 %a1)
  %t5874 = icmp ne i64 %t5873, 1
  br i1 %t5874, label %then1387, label %else1388
then1387:
  ret i64 2
else1388:
  %t5875 = call i64 @rt_car(i64 %a1)
  %t5876 = call i64 @rt_car(i64 %t5875)
  %t5877 = call i64 @rt_equal(i64 %a0, i64 %t5876)
  %t5878 = icmp ne i64 %t5877, 1
  br i1 %t5878, label %then1389, label %else1390
then1389:
  %t5879 = call i64 @rt_cdr(i64 %a1)
  ret i64 %t5879
else1390:
  %t5880 = call i64 @rt_car(i64 %a1)
  %t5881 = call i64 @rt_cdr(i64 %a1)
  %t5882 = load i64, ptr @"scheme.base:%ht-remove"
  call void @rt_check_callable(i64 %t5882)
  %t5883 = and i64 %t5882, -8
  %t5884 = inttoptr i64 %t5883 to ptr
  %t5885 = load i64, ptr %t5884
  %t5886 = inttoptr i64 %t5885 to ptr
  %t5887 = call fastcc i64%t5886(i64 %t5882, i64 2, i64 %a0, i64 %t5881, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5888 = call i64 @rt_cons(i64 %t5880, i64 %t5887)
  ret i64 %t5888
}

define fastcc i64 @"scheme.base:code:hash-table-ref/default"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5893 = icmp eq i64 %argc, 3
  br i1 %t5893, label %argok1392, label %arityerr1391
arityerr1391:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1392:
  %t5894 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t5894)
  %t5895 = and i64 %t5894, -8
  %t5896 = inttoptr i64 %t5895 to ptr
  %t5897 = load i64, ptr %t5896
  %t5898 = inttoptr i64 %t5897 to ptr
  %t5899 = call fastcc i64%t5898(i64 %t5894, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5900 = call i64 @rt_vector_length(i64 %t5899)
  %t5901 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t5901)
  %t5902 = and i64 %t5901, -8
  %t5903 = inttoptr i64 %t5902 to ptr
  %t5904 = load i64, ptr %t5903
  %t5905 = inttoptr i64 %t5904 to ptr
  %t5906 = call fastcc i64%t5905(i64 %t5901, i64 2, i64 %a1, i64 %t5900, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5907 = call i64 @rt_vector_ref(i64 %t5899, i64 %t5906)
  %t5908 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t5908)
  %t5909 = and i64 %t5908, -8
  %t5910 = inttoptr i64 %t5909 to ptr
  %t5911 = load i64, ptr %t5910
  %t5912 = inttoptr i64 %t5911 to ptr
  %t5913 = call fastcc i64%t5912(i64 %t5908, i64 2, i64 %a1, i64 %t5907, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5914 = icmp ne i64 %t5913, 1
  br i1 %t5914, label %then1393, label %else1394
then1393:
  %t5915 = call i64 @rt_cdr(i64 %t5913)
  ret i64 %t5915
else1394:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:hash-table-contains?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5920 = icmp eq i64 %argc, 2
  br i1 %t5920, label %argok1396, label %arityerr1395
arityerr1395:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1396:
  %t5921 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t5921)
  %t5922 = and i64 %t5921, -8
  %t5923 = inttoptr i64 %t5922 to ptr
  %t5924 = load i64, ptr %t5923
  %t5925 = inttoptr i64 %t5924 to ptr
  %t5926 = call fastcc i64%t5925(i64 %t5921, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5927 = call i64 @rt_vector_length(i64 %t5926)
  %t5928 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t5928)
  %t5929 = and i64 %t5928, -8
  %t5930 = inttoptr i64 %t5929 to ptr
  %t5931 = load i64, ptr %t5930
  %t5932 = inttoptr i64 %t5931 to ptr
  %t5933 = call fastcc i64%t5932(i64 %t5928, i64 2, i64 %a1, i64 %t5927, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5934 = call i64 @rt_vector_ref(i64 %t5926, i64 %t5933)
  %t5935 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t5935)
  %t5936 = and i64 %t5935, -8
  %t5937 = inttoptr i64 %t5936 to ptr
  %t5938 = load i64, ptr %t5937
  %t5939 = inttoptr i64 %t5938 to ptr
  %t5940 = call fastcc i64%t5939(i64 %t5935, i64 2, i64 %a1, i64 %t5934, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5941 = icmp ne i64 %t5940, 1
  br i1 %t5941, label %then1397, label %else1398
then1397:
  ret i64 257
else1398:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-ref"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5946 = icmp eq i64 %argc, 2
  br i1 %t5946, label %argok1400, label %arityerr1399
arityerr1399:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1400:
  %t5947 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t5947)
  %t5948 = and i64 %t5947, -8
  %t5949 = inttoptr i64 %t5948 to ptr
  %t5950 = load i64, ptr %t5949
  %t5951 = inttoptr i64 %t5950 to ptr
  %t5952 = call fastcc i64%t5951(i64 %t5947, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5953 = call i64 @rt_vector_length(i64 %t5952)
  %t5954 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t5954)
  %t5955 = and i64 %t5954, -8
  %t5956 = inttoptr i64 %t5955 to ptr
  %t5957 = load i64, ptr %t5956
  %t5958 = inttoptr i64 %t5957 to ptr
  %t5959 = call fastcc i64%t5958(i64 %t5954, i64 2, i64 %a1, i64 %t5953, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5960 = call i64 @rt_vector_ref(i64 %t5952, i64 %t5959)
  %t5961 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t5961)
  %t5962 = and i64 %t5961, -8
  %t5963 = inttoptr i64 %t5962 to ptr
  %t5964 = load i64, ptr %t5963
  %t5965 = inttoptr i64 %t5964 to ptr
  %t5966 = call fastcc i64%t5965(i64 %t5961, i64 2, i64 %a1, i64 %t5960, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5967 = icmp ne i64 %t5966, 1
  br i1 %t5967, label %then1401, label %else1402
then1401:
  %t5968 = call i64 @rt_cdr(i64 %t5966)
  ret i64 %t5968
else1402:
  %t5969 = call i64 @rt_make_string(ptr @.str.lit.30, i64 29)
  %t5970 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t5970)
  %t5971 = and i64 %t5970, -8
  %t5972 = inttoptr i64 %t5971 to ptr
  %t5973 = load i64, ptr %t5972
  %t5974 = inttoptr i64 %t5973 to ptr
  %t5975 = musttail call fastcc i64 %t5974(i64 %t5970, i64 2, i64 %t5969, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5975
}

define fastcc i64 @"scheme.base:code:hash-table-set!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5980 = icmp eq i64 %argc, 3
  br i1 %t5980, label %argok1404, label %arityerr1403
arityerr1403:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1404:
  %t5981 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t5981)
  %t5982 = and i64 %t5981, -8
  %t5983 = inttoptr i64 %t5982 to ptr
  %t5984 = load i64, ptr %t5983
  %t5985 = inttoptr i64 %t5984 to ptr
  %t5986 = call fastcc i64%t5985(i64 %t5981, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5987 = call i64 @rt_vector_length(i64 %t5986)
  %t5988 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t5988)
  %t5989 = and i64 %t5988, -8
  %t5990 = inttoptr i64 %t5989 to ptr
  %t5991 = load i64, ptr %t5990
  %t5992 = inttoptr i64 %t5991 to ptr
  %t5993 = call fastcc i64%t5992(i64 %t5988, i64 2, i64 %a1, i64 %t5987, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5994 = call i64 @rt_vector_ref(i64 %t5986, i64 %t5993)
  %t5995 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t5995)
  %t5996 = and i64 %t5995, -8
  %t5997 = inttoptr i64 %t5996 to ptr
  %t5998 = load i64, ptr %t5997
  %t5999 = inttoptr i64 %t5998 to ptr
  %t6000 = call fastcc i64%t5999(i64 %t5995, i64 2, i64 %a1, i64 %t5994, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6001 = call i64 @rt_cons(i64 %a1, i64 %a2)
  %t6002 = icmp ne i64 %t6000, 1
  br i1 %t6002, label %then1405, label %else1406
then1405:
  %t6003 = load i64, ptr @"scheme.base:%ht-remove"
  call void @rt_check_callable(i64 %t6003)
  %t6004 = and i64 %t6003, -8
  %t6005 = inttoptr i64 %t6004 to ptr
  %t6006 = load i64, ptr %t6005
  %t6007 = inttoptr i64 %t6006 to ptr
  %t6008 = call fastcc i64%t6007(i64 %t6003, i64 2, i64 %a1, i64 %t5994, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge1407
else1406:
  br label %merge1407
merge1407:
  %t6009 = phi i64 [ %t6008, %then1405 ], [ %t5994, %else1406 ]
  %t6010 = call i64 @rt_cons(i64 %t6001, i64 %t6009)
  %t6011 = call i64 @rt_vector_set(i64 %t5986, i64 %t5993, i64 %t6010)
  %t6012 = icmp ne i64 %t6000, 1
  br i1 %t6012, label %then1408, label %else1409
then1408:
  ret i64 1
else1409:
  %t6013 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t6013)
  %t6014 = and i64 %t6013, -8
  %t6015 = inttoptr i64 %t6014 to ptr
  %t6016 = load i64, ptr %t6015
  %t6017 = inttoptr i64 %t6016 to ptr
  %t6018 = call fastcc i64%t6017(i64 %t6013, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6019 = or i64 %t6018, 8
  %t6020 = and i64 %t6019, 7
  %t6021 = icmp eq i64 %t6020, 0
  br i1 %t6021, label %fixfast1410, label %fixslow1411
fixfast1410:
  %t6022 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6018, i64 8)
  %t6023 = extractvalue {i64, i1} %t6022, 0
  %t6024 = extractvalue {i64, i1} %t6022, 1
  br i1 %t6024, label %fixslow1411, label %fixmerge1412
fixslow1411:
  %t6025 = call i64 @rt_add(i64 %t6018, i64 8)
  br label %fixmerge1412
fixmerge1412:
  %t6026 = phi i64 [ %t6023, %fixfast1410 ], [ %t6025, %fixslow1411 ]
  %t6027 = load i64, ptr @"scheme.base:%ht-set-count!"
  call void @rt_check_callable(i64 %t6027)
  %t6028 = and i64 %t6027, -8
  %t6029 = inttoptr i64 %t6028 to ptr
  %t6030 = load i64, ptr %t6029
  %t6031 = inttoptr i64 %t6030 to ptr
  %t6032 = call fastcc i64%t6031(i64 %t6027, i64 2, i64 %a0, i64 %t6026, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6033 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t6033)
  %t6034 = and i64 %t6033, -8
  %t6035 = inttoptr i64 %t6034 to ptr
  %t6036 = load i64, ptr %t6035
  %t6037 = inttoptr i64 %t6036 to ptr
  %t6038 = call fastcc i64%t6037(i64 %t6033, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6039 = load i64, ptr @"scheme.base:%ht-load-factor"
  %t6040 = or i64 %t6039, %t5987
  %t6041 = and i64 %t6040, 7
  %t6042 = icmp eq i64 %t6041, 0
  br i1 %t6042, label %fixfast1413, label %fixslow1414
fixfast1413:
  %t6043 = ashr i64 %t6039, 3
  %t6044 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t6043, i64 %t5987)
  %t6045 = extractvalue {i64, i1} %t6044, 0
  %t6046 = extractvalue {i64, i1} %t6044, 1
  br i1 %t6046, label %fixslow1414, label %fixmerge1415
fixslow1414:
  %t6047 = call i64 @rt_mul(i64 %t6039, i64 %t5987)
  br label %fixmerge1415
fixmerge1415:
  %t6048 = phi i64 [ %t6045, %fixfast1413 ], [ %t6047, %fixslow1414 ]
  %t6049 = or i64 %t6048, %t6038
  %t6050 = and i64 %t6049, 7
  %t6051 = icmp eq i64 %t6050, 0
  br i1 %t6051, label %fixfast1416, label %fixslow1417
fixfast1416:
  %t6052 = icmp slt i64 %t6048, %t6038
  %t6053 = select i1 %t6052, i64 257, i64 1
  br label %fixmerge1418
fixslow1417:
  %t6054 = call i64 @rt_lt(i64 %t6048, i64 %t6038)
  br label %fixmerge1418
fixmerge1418:
  %t6055 = phi i64 [ %t6053, %fixfast1416 ], [ %t6054, %fixslow1417 ]
  %t6056 = icmp ne i64 %t6055, 1
  br i1 %t6056, label %then1419, label %else1420
then1419:
  %t6057 = load i64, ptr @"scheme.base:%ht-grow!"
  call void @rt_check_callable(i64 %t6057)
  %t6058 = and i64 %t6057, -8
  %t6059 = inttoptr i64 %t6058 to ptr
  %t6060 = load i64, ptr %t6059
  %t6061 = inttoptr i64 %t6060 to ptr
  %t6062 = musttail call fastcc i64 %t6061(i64 %t6057, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6062
else1420:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-delete!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6067 = icmp eq i64 %argc, 2
  br i1 %t6067, label %argok1422, label %arityerr1421
arityerr1421:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1422:
  %t6068 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t6068)
  %t6069 = and i64 %t6068, -8
  %t6070 = inttoptr i64 %t6069 to ptr
  %t6071 = load i64, ptr %t6070
  %t6072 = inttoptr i64 %t6071 to ptr
  %t6073 = call fastcc i64%t6072(i64 %t6068, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6074 = call i64 @rt_vector_length(i64 %t6073)
  %t6075 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t6075)
  %t6076 = and i64 %t6075, -8
  %t6077 = inttoptr i64 %t6076 to ptr
  %t6078 = load i64, ptr %t6077
  %t6079 = inttoptr i64 %t6078 to ptr
  %t6080 = call fastcc i64%t6079(i64 %t6075, i64 2, i64 %a1, i64 %t6074, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6081 = call i64 @rt_vector_ref(i64 %t6073, i64 %t6080)
  %t6082 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t6082)
  %t6083 = and i64 %t6082, -8
  %t6084 = inttoptr i64 %t6083 to ptr
  %t6085 = load i64, ptr %t6084
  %t6086 = inttoptr i64 %t6085 to ptr
  %t6087 = call fastcc i64%t6086(i64 %t6082, i64 2, i64 %a1, i64 %t6081, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6088 = icmp ne i64 %t6087, 1
  br i1 %t6088, label %then1423, label %else1424
then1423:
  %t6089 = load i64, ptr @"scheme.base:%ht-remove"
  call void @rt_check_callable(i64 %t6089)
  %t6090 = and i64 %t6089, -8
  %t6091 = inttoptr i64 %t6090 to ptr
  %t6092 = load i64, ptr %t6091
  %t6093 = inttoptr i64 %t6092 to ptr
  %t6094 = call fastcc i64%t6093(i64 %t6089, i64 2, i64 %a1, i64 %t6081, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6095 = call i64 @rt_vector_set(i64 %t6073, i64 %t6080, i64 %t6094)
  %t6096 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t6096)
  %t6097 = and i64 %t6096, -8
  %t6098 = inttoptr i64 %t6097 to ptr
  %t6099 = load i64, ptr %t6098
  %t6100 = inttoptr i64 %t6099 to ptr
  %t6101 = call fastcc i64%t6100(i64 %t6096, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6102 = or i64 %t6101, 8
  %t6103 = and i64 %t6102, 7
  %t6104 = icmp eq i64 %t6103, 0
  br i1 %t6104, label %fixfast1425, label %fixslow1426
fixfast1425:
  %t6105 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6101, i64 8)
  %t6106 = extractvalue {i64, i1} %t6105, 0
  %t6107 = extractvalue {i64, i1} %t6105, 1
  br i1 %t6107, label %fixslow1426, label %fixmerge1427
fixslow1426:
  %t6108 = call i64 @rt_sub(i64 %t6101, i64 8)
  br label %fixmerge1427
fixmerge1427:
  %t6109 = phi i64 [ %t6106, %fixfast1425 ], [ %t6108, %fixslow1426 ]
  %t6110 = load i64, ptr @"scheme.base:%ht-set-count!"
  call void @rt_check_callable(i64 %t6110)
  %t6111 = and i64 %t6110, -8
  %t6112 = inttoptr i64 %t6111 to ptr
  %t6113 = load i64, ptr %t6112
  %t6114 = inttoptr i64 %t6113 to ptr
  %t6115 = musttail call fastcc i64 %t6114(i64 %t6110, i64 2, i64 %a0, i64 %t6109, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6115
else1424:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_1161"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6120 = icmp eq i64 %argc, 1
  br i1 %t6120, label %argok1429, label %arityerr1428
arityerr1428:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1429:
  %t6121 = call i64 @rt_null_p(i64 %a0)
  %t6122 = icmp ne i64 %t6121, 1
  br i1 %t6122, label %then1430, label %else1431
then1430:
  ret i64 1
else1431:
  %t6123 = call i64 @rt_car(i64 %a0)
  %t6124 = call i64 @rt_car(i64 %t6123)
  %t6125 = and i64 %self, -8
  %t6126 = inttoptr i64 %t6125 to ptr
  %t6127 = getelementptr i64, ptr %t6126, i64 1
  %t6128 = load i64, ptr %t6127
  %t6129 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t6129)
  %t6130 = and i64 %t6129, -8
  %t6131 = inttoptr i64 %t6130 to ptr
  %t6132 = load i64, ptr %t6131
  %t6133 = inttoptr i64 %t6132 to ptr
  %t6134 = call fastcc i64%t6133(i64 %t6129, i64 2, i64 %t6124, i64 %t6128, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6135 = and i64 %self, -8
  %t6136 = inttoptr i64 %t6135 to ptr
  %t6137 = getelementptr i64, ptr %t6136, i64 2
  %t6138 = load i64, ptr %t6137
  %t6139 = and i64 %self, -8
  %t6140 = inttoptr i64 %t6139 to ptr
  %t6141 = getelementptr i64, ptr %t6140, i64 2
  %t6142 = load i64, ptr %t6141
  %t6143 = call i64 @rt_vector_ref(i64 %t6142, i64 %t6134)
  %t6144 = call i64 @rt_cons(i64 %t6123, i64 %t6143)
  %t6145 = call i64 @rt_vector_set(i64 %t6138, i64 %t6134, i64 %t6144)
  %t6146 = call i64 @rt_cdr(i64 %a0)
  %t6147 = musttail call fastcc i64 @"scheme.base:code_1161"(i64 %self, i64 1, i64 %t6146, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6147
}

define fastcc i64 @"scheme.base:code_1159"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6148 = icmp eq i64 %argc, 1
  br i1 %t6148, label %argok1433, label %arityerr1432
arityerr1432:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1433:
  %t6149 = and i64 %self, -8
  %t6150 = inttoptr i64 %t6149 to ptr
  %t6151 = getelementptr i64, ptr %t6150, i64 1
  %t6152 = load i64, ptr %t6151
  %t6153 = call i64 @rt_vector_length(i64 %t6152)
  %t6154 = or i64 %a0, %t6153
  %t6155 = and i64 %t6154, 7
  %t6156 = icmp eq i64 %t6155, 0
  br i1 %t6156, label %fixfast1434, label %fixslow1435
fixfast1434:
  %t6157 = icmp slt i64 %a0, %t6153
  %t6158 = select i1 %t6157, i64 257, i64 1
  br label %fixmerge1436
fixslow1435:
  %t6159 = call i64 @rt_lt(i64 %a0, i64 %t6153)
  br label %fixmerge1436
fixmerge1436:
  %t6160 = phi i64 [ %t6158, %fixfast1434 ], [ %t6159, %fixslow1435 ]
  %t6161 = icmp ne i64 %t6160, 1
  br i1 %t6161, label %then1437, label %else1438
then1437:
  %t6162 = call ptr @rt_alloc_words(i64 4)
  %t6163 = ptrtoint ptr %t6162 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1161" to i64), ptr %t6162
  %t6164 = or i64 %t6163, 4
  %t6165 = and i64 %self, -8
  %t6166 = inttoptr i64 %t6165 to ptr
  %t6167 = getelementptr i64, ptr %t6166, i64 2
  %t6168 = load i64, ptr %t6167
  %t6169 = getelementptr i64, ptr %t6162, i64 1
  store i64 %t6168, ptr %t6169
  %t6170 = and i64 %self, -8
  %t6171 = inttoptr i64 %t6170 to ptr
  %t6172 = getelementptr i64, ptr %t6171, i64 3
  %t6173 = load i64, ptr %t6172
  %t6174 = getelementptr i64, ptr %t6162, i64 2
  store i64 %t6173, ptr %t6174
  %t6175 = getelementptr i64, ptr %t6162, i64 3
  store i64 %t6164, ptr %t6175
  %t6176 = and i64 %self, -8
  %t6177 = inttoptr i64 %t6176 to ptr
  %t6178 = getelementptr i64, ptr %t6177, i64 1
  %t6179 = load i64, ptr %t6178
  %t6180 = call i64 @rt_vector_ref(i64 %t6179, i64 %a0)
  %t6181 = call fastcc i64 @"scheme.base:code_1161"(i64 %t6164, i64 1, i64 %t6180, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6182 = or i64 %a0, 8
  %t6183 = and i64 %t6182, 7
  %t6184 = icmp eq i64 %t6183, 0
  br i1 %t6184, label %fixfast1439, label %fixslow1440
fixfast1439:
  %t6185 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t6186 = extractvalue {i64, i1} %t6185, 0
  %t6187 = extractvalue {i64, i1} %t6185, 1
  br i1 %t6187, label %fixslow1440, label %fixmerge1441
fixslow1440:
  %t6188 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1441
fixmerge1441:
  %t6189 = phi i64 [ %t6186, %fixfast1439 ], [ %t6188, %fixslow1440 ]
  %t6190 = musttail call fastcc i64 @"scheme.base:code_1159"(i64 %self, i64 1, i64 %t6189, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6190
else1438:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%ht-grow!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6191 = icmp eq i64 %argc, 1
  br i1 %t6191, label %argok1443, label %arityerr1442
arityerr1442:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1443:
  %t6192 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t6192)
  %t6193 = and i64 %t6192, -8
  %t6194 = inttoptr i64 %t6193 to ptr
  %t6195 = load i64, ptr %t6194
  %t6196 = inttoptr i64 %t6195 to ptr
  %t6197 = call fastcc i64%t6196(i64 %t6192, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6198 = call i64 @rt_vector_length(i64 %t6197)
  %t6199 = or i64 16, %t6198
  %t6200 = and i64 %t6199, 7
  %t6201 = icmp eq i64 %t6200, 0
  br i1 %t6201, label %fixfast1444, label %fixslow1445
fixfast1444:
  %t6202 = ashr i64 16, 3
  %t6203 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t6202, i64 %t6198)
  %t6204 = extractvalue {i64, i1} %t6203, 0
  %t6205 = extractvalue {i64, i1} %t6203, 1
  br i1 %t6205, label %fixslow1445, label %fixmerge1446
fixslow1445:
  %t6206 = call i64 @rt_mul(i64 16, i64 %t6198)
  br label %fixmerge1446
fixmerge1446:
  %t6207 = phi i64 [ %t6204, %fixfast1444 ], [ %t6206, %fixslow1445 ]
  %t6208 = call i64 @rt_make_vector(i64 %t6207, i64 2)
  %t6209 = call ptr @rt_alloc_words(i64 5)
  %t6210 = ptrtoint ptr %t6209 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1159" to i64), ptr %t6209
  %t6211 = or i64 %t6210, 4
  %t6212 = getelementptr i64, ptr %t6209, i64 1
  store i64 %t6197, ptr %t6212
  %t6213 = getelementptr i64, ptr %t6209, i64 2
  store i64 %t6207, ptr %t6213
  %t6214 = getelementptr i64, ptr %t6209, i64 3
  store i64 %t6208, ptr %t6214
  %t6215 = getelementptr i64, ptr %t6209, i64 4
  store i64 %t6211, ptr %t6215
  %t6216 = call fastcc i64 @"scheme.base:code_1159"(i64 %t6211, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6217 = load i64, ptr @"scheme.base:%ht-set-buckets!"
  call void @rt_check_callable(i64 %t6217)
  %t6218 = and i64 %t6217, -8
  %t6219 = inttoptr i64 %t6218 to ptr
  %t6220 = load i64, ptr %t6219
  %t6221 = inttoptr i64 %t6220 to ptr
  %t6222 = musttail call fastcc i64 %t6221(i64 %t6217, i64 2, i64 %a0, i64 %t6208, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6222
}

define fastcc i64 @"scheme.base:code:hash-table-size"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6227 = icmp eq i64 %argc, 1
  br i1 %t6227, label %argok1448, label %arityerr1447
arityerr1447:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1448:
  %t6228 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t6228)
  %t6229 = and i64 %t6228, -8
  %t6230 = inttoptr i64 %t6229 to ptr
  %t6231 = load i64, ptr %t6230
  %t6232 = inttoptr i64 %t6231 to ptr
  %t6233 = musttail call fastcc i64 %t6232(i64 %t6228, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6233
}

define fastcc i64 @"scheme.base:code:%ht-fold-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6238 = icmp eq i64 %argc, 2
  br i1 %t6238, label %argok1450, label %arityerr1449
arityerr1449:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1450:
  %t6239 = call i64 @rt_null_p(i64 %a0)
  %t6240 = icmp ne i64 %t6239, 1
  br i1 %t6240, label %then1451, label %else1452
then1451:
  ret i64 %a1
else1452:
  %t6241 = call i64 @rt_car(i64 %a0)
  %t6242 = call i64 @rt_car(i64 %t6241)
  %t6243 = call i64 @rt_car(i64 %a0)
  %t6244 = call i64 @rt_cdr(i64 %t6243)
  %t6245 = call i64 @rt_cons(i64 %t6242, i64 %t6244)
  %t6246 = call i64 @rt_cdr(i64 %a0)
  %t6247 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  call void @rt_check_callable(i64 %t6247)
  %t6248 = and i64 %t6247, -8
  %t6249 = inttoptr i64 %t6248 to ptr
  %t6250 = load i64, ptr %t6249
  %t6251 = inttoptr i64 %t6250 to ptr
  %t6252 = call fastcc i64%t6251(i64 %t6247, i64 2, i64 %t6246, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6253 = call i64 @rt_cons(i64 %t6245, i64 %t6252)
  ret i64 %t6253
}

define fastcc i64 @"scheme.base:code_1178"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6258 = icmp eq i64 %argc, 2
  br i1 %t6258, label %argok1454, label %arityerr1453
arityerr1453:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1454:
  %t6259 = and i64 %self, -8
  %t6260 = inttoptr i64 %t6259 to ptr
  %t6261 = getelementptr i64, ptr %t6260, i64 1
  %t6262 = load i64, ptr %t6261
  %t6263 = call i64 @rt_vector_length(i64 %t6262)
  %t6264 = or i64 %a0, %t6263
  %t6265 = and i64 %t6264, 7
  %t6266 = icmp eq i64 %t6265, 0
  br i1 %t6266, label %fixfast1455, label %fixslow1456
fixfast1455:
  %t6267 = icmp slt i64 %a0, %t6263
  %t6268 = select i1 %t6267, i64 257, i64 1
  br label %fixmerge1457
fixslow1456:
  %t6269 = call i64 @rt_lt(i64 %a0, i64 %t6263)
  br label %fixmerge1457
fixmerge1457:
  %t6270 = phi i64 [ %t6268, %fixfast1455 ], [ %t6269, %fixslow1456 ]
  %t6271 = icmp ne i64 %t6270, 1
  br i1 %t6271, label %then1458, label %else1459
then1458:
  %t6272 = or i64 %a0, 8
  %t6273 = and i64 %t6272, 7
  %t6274 = icmp eq i64 %t6273, 0
  br i1 %t6274, label %fixfast1460, label %fixslow1461
fixfast1460:
  %t6275 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t6276 = extractvalue {i64, i1} %t6275, 0
  %t6277 = extractvalue {i64, i1} %t6275, 1
  br i1 %t6277, label %fixslow1461, label %fixmerge1462
fixslow1461:
  %t6278 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1462
fixmerge1462:
  %t6279 = phi i64 [ %t6276, %fixfast1460 ], [ %t6278, %fixslow1461 ]
  %t6280 = and i64 %self, -8
  %t6281 = inttoptr i64 %t6280 to ptr
  %t6282 = getelementptr i64, ptr %t6281, i64 1
  %t6283 = load i64, ptr %t6282
  %t6284 = call i64 @rt_vector_ref(i64 %t6283, i64 %a0)
  %t6285 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  call void @rt_check_callable(i64 %t6285)
  %t6286 = and i64 %t6285, -8
  %t6287 = inttoptr i64 %t6286 to ptr
  %t6288 = load i64, ptr %t6287
  %t6289 = inttoptr i64 %t6288 to ptr
  %t6290 = call fastcc i64%t6289(i64 %t6285, i64 2, i64 %t6284, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6291 = musttail call fastcc i64 @"scheme.base:code_1178"(i64 %self, i64 2, i64 %t6279, i64 %t6290, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6291
else1459:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:hash-table->alist"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6292 = icmp eq i64 %argc, 1
  br i1 %t6292, label %argok1464, label %arityerr1463
arityerr1463:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1464:
  %t6293 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t6293)
  %t6294 = and i64 %t6293, -8
  %t6295 = inttoptr i64 %t6294 to ptr
  %t6296 = load i64, ptr %t6295
  %t6297 = inttoptr i64 %t6296 to ptr
  %t6298 = call fastcc i64%t6297(i64 %t6293, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6299 = call ptr @rt_alloc_words(i64 3)
  %t6300 = ptrtoint ptr %t6299 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1178" to i64), ptr %t6299
  %t6301 = or i64 %t6300, 4
  %t6302 = getelementptr i64, ptr %t6299, i64 1
  store i64 %t6298, ptr %t6302
  %t6303 = getelementptr i64, ptr %t6299, i64 2
  store i64 %t6301, ptr %t6303
  %t6304 = musttail call fastcc i64 @"scheme.base:code_1178"(i64 %t6301, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6304
}

define fastcc i64 @"scheme.base:code_1183"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6309 = icmp eq i64 %argc, 1
  br i1 %t6309, label %argok1466, label %arityerr1465
arityerr1465:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1466:
  %t6310 = call i64 @rt_car(i64 %a0)
  ret i64 %t6310
}

define fastcc i64 @"scheme.base:code:hash-table-keys"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6311 = icmp eq i64 %argc, 1
  br i1 %t6311, label %argok1468, label %arityerr1467
arityerr1467:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1468:
  %t6312 = call ptr @rt_alloc_words(i64 1)
  %t6313 = ptrtoint ptr %t6312 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1183" to i64), ptr %t6312
  %t6314 = or i64 %t6313, 4
  %t6315 = load i64, ptr @"scheme.base:hash-table->alist"
  call void @rt_check_callable(i64 %t6315)
  %t6316 = and i64 %t6315, -8
  %t6317 = inttoptr i64 %t6316 to ptr
  %t6318 = load i64, ptr %t6317
  %t6319 = inttoptr i64 %t6318 to ptr
  %t6320 = call fastcc i64%t6319(i64 %t6315, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6321 = load i64, ptr @"scheme.base:map"
  call void @rt_check_callable(i64 %t6321)
  %t6322 = and i64 %t6321, -8
  %t6323 = inttoptr i64 %t6322 to ptr
  %t6324 = load i64, ptr %t6323
  %t6325 = inttoptr i64 %t6324 to ptr
  %t6326 = musttail call fastcc i64 %t6325(i64 %t6321, i64 2, i64 %t6314, i64 %t6320, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6326
}

define fastcc i64 @"scheme.base:code_1188"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6331 = icmp eq i64 %argc, 1
  br i1 %t6331, label %argok1470, label %arityerr1469
arityerr1469:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1470:
  %t6332 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t6332
}

define fastcc i64 @"scheme.base:code:hash-table-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6333 = icmp eq i64 %argc, 1
  br i1 %t6333, label %argok1472, label %arityerr1471
arityerr1471:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1472:
  %t6334 = call ptr @rt_alloc_words(i64 1)
  %t6335 = ptrtoint ptr %t6334 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1188" to i64), ptr %t6334
  %t6336 = or i64 %t6335, 4
  %t6337 = load i64, ptr @"scheme.base:hash-table->alist"
  call void @rt_check_callable(i64 %t6337)
  %t6338 = and i64 %t6337, -8
  %t6339 = inttoptr i64 %t6338 to ptr
  %t6340 = load i64, ptr %t6339
  %t6341 = inttoptr i64 %t6340 to ptr
  %t6342 = call fastcc i64%t6341(i64 %t6337, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6343 = load i64, ptr @"scheme.base:map"
  call void @rt_check_callable(i64 %t6343)
  %t6344 = and i64 %t6343, -8
  %t6345 = inttoptr i64 %t6344 to ptr
  %t6346 = load i64, ptr %t6345
  %t6347 = inttoptr i64 %t6346 to ptr
  %t6348 = musttail call fastcc i64 %t6347(i64 %t6343, i64 2, i64 %t6336, i64 %t6342, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6348
}

define fastcc i64 @"scheme.base:code:rd-report"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6353 = icmp eq i64 %argc, 3
  br i1 %t6353, label %argok1474, label %arityerr1473
arityerr1473:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1474:
  %t6354 = call i64 @rt_car(i64 %a2)
  %t6355 = call i64 @rt_cdr(i64 %a2)
  %t6356 = load i64, ptr @"emit.internal:rd-fail-pos"
  %t6357 = call fastcc i64 @"emit.internal:code:rd-fail-pos"(i64 %t6356, i64 1, i64 %t6355, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6358 = call i64 @rt_intern(ptr @.str.sym.31)
  %t6359 = call i64 @rt_eq_p(i64 %t6354, i64 %t6358)
  %t6360 = icmp ne i64 %t6359, 1
  br i1 %t6360, label %then1475, label %else1476
then1475:
  %t6361 = call i64 @rt_intern(ptr @.str.sym.32)
  %t6362 = call i64 @rt_make_string(ptr @.str.lit.33, i64 45)
  %t6363 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6363)
  %t6364 = and i64 %t6363, -8
  %t6365 = inttoptr i64 %t6364 to ptr
  %t6366 = load i64, ptr %t6365
  %t6367 = inttoptr i64 %t6366 to ptr
  %t6368 = musttail call fastcc i64 %t6367(i64 %t6363, i64 3, i64 %t6361, i64 %t6362, i64 %t6357, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6368
else1476:
  %t6369 = call i64 @rt_intern(ptr @.str.sym.34)
  %t6370 = call i64 @rt_eq_p(i64 %t6354, i64 %t6369)
  %t6371 = icmp ne i64 %t6370, 1
  br i1 %t6371, label %then1477, label %else1478
then1477:
  %t6372 = call i64 @rt_intern(ptr @.str.sym.32)
  %t6373 = call i64 @rt_make_string(ptr @.str.lit.35, i64 41)
  %t6374 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6374)
  %t6375 = and i64 %t6374, -8
  %t6376 = inttoptr i64 %t6375 to ptr
  %t6377 = load i64, ptr %t6376
  %t6378 = inttoptr i64 %t6377 to ptr
  %t6379 = musttail call fastcc i64 %t6378(i64 %t6374, i64 3, i64 %t6372, i64 %t6373, i64 %t6357, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6379
else1478:
  %t6380 = call i64 @rt_intern(ptr @.str.sym.36)
  %t6381 = call i64 @rt_eq_p(i64 %t6354, i64 %t6380)
  %t6382 = icmp ne i64 %t6381, 1
  br i1 %t6382, label %then1479, label %else1480
then1479:
  %t6383 = call i64 @rt_intern(ptr @.str.sym.32)
  %t6384 = call i64 @rt_make_string(ptr @.str.lit.37, i64 13)
  %t6385 = call i64 @rt_string_ref(i64 %a0, i64 %t6357)
  %t6386 = call i64 @rt_char_to_integer(i64 %t6385)
  %t6387 = or i64 %t6386, 728
  %t6388 = and i64 %t6387, 7
  %t6389 = icmp eq i64 %t6388, 0
  br i1 %t6389, label %fixfast1481, label %fixslow1482
fixfast1481:
  %t6390 = icmp eq i64 %t6386, 728
  %t6391 = select i1 %t6390, i64 257, i64 1
  br label %fixmerge1483
fixslow1482:
  %t6392 = call i64 @rt_num_eq(i64 %t6386, i64 728)
  br label %fixmerge1483
fixmerge1483:
  %t6393 = phi i64 [ %t6391, %fixfast1481 ], [ %t6392, %fixslow1482 ]
  %t6394 = icmp ne i64 %t6393, 1
  br i1 %t6394, label %then1484, label %else1485
then1484:
  %t6395 = call i64 @rt_make_string(ptr @.str.lit.38, i64 6)
  br label %merge1486
else1485:
  %t6396 = or i64 %t6386, 280
  %t6397 = and i64 %t6396, 7
  %t6398 = icmp eq i64 %t6397, 0
  br i1 %t6398, label %fixfast1487, label %fixslow1488
fixfast1487:
  %t6399 = icmp eq i64 %t6386, 280
  %t6400 = select i1 %t6399, i64 257, i64 1
  br label %fixmerge1489
fixslow1488:
  %t6401 = call i64 @rt_num_eq(i64 %t6386, i64 280)
  br label %fixmerge1489
fixmerge1489:
  %t6402 = phi i64 [ %t6400, %fixfast1487 ], [ %t6401, %fixslow1488 ]
  %t6403 = icmp ne i64 %t6402, 1
  br i1 %t6403, label %then1490, label %else1491
then1490:
  %t6404 = or i64 %t6357, 8
  %t6405 = and i64 %t6404, 7
  %t6406 = icmp eq i64 %t6405, 0
  br i1 %t6406, label %fixfast1493, label %fixslow1494
fixfast1493:
  %t6407 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6357, i64 8)
  %t6408 = extractvalue {i64, i1} %t6407, 0
  %t6409 = extractvalue {i64, i1} %t6407, 1
  br i1 %t6409, label %fixslow1494, label %fixmerge1495
fixslow1494:
  %t6410 = call i64 @rt_add(i64 %t6357, i64 8)
  br label %fixmerge1495
fixmerge1495:
  %t6411 = phi i64 [ %t6408, %fixfast1493 ], [ %t6410, %fixslow1494 ]
  %t6412 = or i64 %t6411, %a1
  %t6413 = and i64 %t6412, 7
  %t6414 = icmp eq i64 %t6413, 0
  br i1 %t6414, label %fixfast1496, label %fixslow1497
fixfast1496:
  %t6415 = icmp slt i64 %t6411, %a1
  %t6416 = select i1 %t6415, i64 257, i64 1
  br label %fixmerge1498
fixslow1497:
  %t6417 = call i64 @rt_lt(i64 %t6411, i64 %a1)
  br label %fixmerge1498
fixmerge1498:
  %t6418 = phi i64 [ %t6416, %fixfast1496 ], [ %t6417, %fixslow1497 ]
  %t6419 = icmp ne i64 %t6418, 1
  br i1 %t6419, label %then1499, label %else1500
then1499:
  %t6420 = or i64 %t6357, 8
  %t6421 = and i64 %t6420, 7
  %t6422 = icmp eq i64 %t6421, 0
  br i1 %t6422, label %fixfast1502, label %fixslow1503
fixfast1502:
  %t6423 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6357, i64 8)
  %t6424 = extractvalue {i64, i1} %t6423, 0
  %t6425 = extractvalue {i64, i1} %t6423, 1
  br i1 %t6425, label %fixslow1503, label %fixmerge1504
fixslow1503:
  %t6426 = call i64 @rt_add(i64 %t6357, i64 8)
  br label %fixmerge1504
fixmerge1504:
  %t6427 = phi i64 [ %t6424, %fixfast1502 ], [ %t6426, %fixslow1503 ]
  %t6428 = call i64 @rt_string_ref(i64 %a0, i64 %t6427)
  %t6429 = call i64 @rt_char_to_integer(i64 %t6428)
  %t6430 = or i64 %t6429, 936
  %t6431 = and i64 %t6430, 7
  %t6432 = icmp eq i64 %t6431, 0
  br i1 %t6432, label %fixfast1505, label %fixslow1506
fixfast1505:
  %t6433 = icmp eq i64 %t6429, 936
  %t6434 = select i1 %t6433, i64 257, i64 1
  br label %fixmerge1507
fixslow1506:
  %t6435 = call i64 @rt_num_eq(i64 %t6429, i64 936)
  br label %fixmerge1507
fixmerge1507:
  %t6436 = phi i64 [ %t6434, %fixfast1505 ], [ %t6435, %fixslow1506 ]
  br label %merge1501
else1500:
  br label %merge1501
merge1501:
  %t6437 = phi i64 [ %t6436, %fixmerge1507 ], [ 1, %else1500 ]
  br label %merge1492
else1491:
  br label %merge1492
merge1492:
  %t6438 = phi i64 [ %t6437, %merge1501 ], [ 1, %else1491 ]
  %t6439 = icmp ne i64 %t6438, 1
  br i1 %t6439, label %then1508, label %else1509
then1508:
  %t6440 = call i64 @rt_make_string(ptr @.str.lit.39, i64 15)
  br label %merge1510
else1509:
  %t6441 = or i64 %t6386, 280
  %t6442 = and i64 %t6441, 7
  %t6443 = icmp eq i64 %t6442, 0
  br i1 %t6443, label %fixfast1511, label %fixslow1512
fixfast1511:
  %t6444 = icmp eq i64 %t6386, 280
  %t6445 = select i1 %t6444, i64 257, i64 1
  br label %fixmerge1513
fixslow1512:
  %t6446 = call i64 @rt_num_eq(i64 %t6386, i64 280)
  br label %fixmerge1513
fixmerge1513:
  %t6447 = phi i64 [ %t6445, %fixfast1511 ], [ %t6446, %fixslow1512 ]
  %t6448 = icmp ne i64 %t6447, 1
  br i1 %t6448, label %then1514, label %else1515
then1514:
  %t6449 = call i64 @rt_make_string(ptr @.str.lit.40, i64 9)
  br label %merge1516
else1515:
  %t6450 = call i64 @rt_make_string(ptr @.str.lit.41, i64 6)
  br label %merge1516
merge1516:
  %t6451 = phi i64 [ %t6449, %then1514 ], [ %t6450, %else1515 ]
  br label %merge1510
merge1510:
  %t6452 = phi i64 [ %t6440, %then1508 ], [ %t6451, %merge1516 ]
  br label %merge1486
merge1486:
  %t6453 = phi i64 [ %t6395, %then1484 ], [ %t6452, %merge1510 ]
  %t6454 = call i64 @rt_string_append(i64 %t6384, i64 %t6453)
  %t6455 = call i64 @rt_make_string(ptr @.str.lit.42, i64 16)
  %t6456 = call i64 @rt_string_append(i64 %t6454, i64 %t6455)
  %t6457 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6457)
  %t6458 = and i64 %t6457, -8
  %t6459 = inttoptr i64 %t6458 to ptr
  %t6460 = load i64, ptr %t6459
  %t6461 = inttoptr i64 %t6460 to ptr
  %t6462 = musttail call fastcc i64 %t6461(i64 %t6457, i64 3, i64 %t6383, i64 %t6456, i64 %t6357, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6462
else1480:
  %t6463 = call i64 @rt_intern(ptr @.str.sym.43)
  %t6464 = call i64 @rt_eq_p(i64 %t6354, i64 %t6463)
  %t6465 = icmp ne i64 %t6464, 1
  br i1 %t6465, label %then1517, label %else1518
then1517:
  %t6466 = call i64 @rt_intern(ptr @.str.sym.32)
  %t6467 = call i64 @rt_make_string(ptr @.str.lit.44, i64 37)
  %t6468 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6468)
  %t6469 = and i64 %t6468, -8
  %t6470 = inttoptr i64 %t6469 to ptr
  %t6471 = load i64, ptr %t6470
  %t6472 = inttoptr i64 %t6471 to ptr
  %t6473 = musttail call fastcc i64 %t6472(i64 %t6468, i64 3, i64 %t6466, i64 %t6467, i64 %t6357, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6473
else1518:
  %t6474 = call i64 @rt_intern(ptr @.str.sym.45)
  %t6475 = call i64 @rt_eq_p(i64 %t6354, i64 %t6474)
  %t6476 = icmp ne i64 %t6475, 1
  br i1 %t6476, label %then1519, label %else1520
then1519:
  %t6477 = call i64 @rt_intern(ptr @.str.sym.32)
  %t6478 = call i64 @rt_make_string(ptr @.str.lit.46, i64 49)
  %t6479 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6479)
  %t6480 = and i64 %t6479, -8
  %t6481 = inttoptr i64 %t6480 to ptr
  %t6482 = load i64, ptr %t6481
  %t6483 = inttoptr i64 %t6482 to ptr
  %t6484 = musttail call fastcc i64 %t6483(i64 %t6479, i64 3, i64 %t6477, i64 %t6478, i64 %t6357, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6484
else1520:
  %t6485 = call i64 @rt_intern(ptr @.str.sym.47)
  %t6486 = call i64 @rt_eq_p(i64 %t6354, i64 %t6485)
  %t6487 = icmp ne i64 %t6486, 1
  br i1 %t6487, label %then1521, label %else1522
then1521:
  %t6488 = call i64 @rt_intern(ptr @.str.sym.32)
  %t6489 = call i64 @rt_make_string(ptr @.str.lit.48, i64 23)
  %t6490 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6490)
  %t6491 = and i64 %t6490, -8
  %t6492 = inttoptr i64 %t6491 to ptr
  %t6493 = load i64, ptr %t6492
  %t6494 = inttoptr i64 %t6493 to ptr
  %t6495 = musttail call fastcc i64 %t6494(i64 %t6490, i64 3, i64 %t6488, i64 %t6489, i64 %t6357, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6495
else1522:
  %t6496 = call i64 @rt_intern(ptr @.str.sym.49)
  %t6497 = call i64 @rt_eq_p(i64 %t6354, i64 %t6496)
  %t6498 = icmp ne i64 %t6497, 1
  br i1 %t6498, label %then1523, label %else1524
then1523:
  %t6499 = call i64 @rt_intern(ptr @.str.sym.32)
  %t6500 = call i64 @rt_make_string(ptr @.str.lit.50, i64 56)
  %t6501 = call i64 @rt_make_string(ptr @.str.lit.51, i64 38)
  %t6502 = call i64 @rt_string_append(i64 %t6500, i64 %t6501)
  %t6503 = load i64, ptr @"emit.internal:rd-token-at"
  %t6504 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t6503, i64 3, i64 %a0, i64 %a1, i64 %t6357, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6505 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6505)
  %t6506 = and i64 %t6505, -8
  %t6507 = inttoptr i64 %t6506 to ptr
  %t6508 = load i64, ptr %t6507
  %t6509 = inttoptr i64 %t6508 to ptr
  %t6510 = musttail call fastcc i64 %t6509(i64 %t6505, i64 3, i64 %t6499, i64 %t6502, i64 %t6504, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6510
else1524:
  %t6511 = call i64 @rt_intern(ptr @.str.sym.32)
  %t6512 = call i64 @rt_make_string(ptr @.str.lit.52, i64 19)
  %t6513 = load i64, ptr @"emit.internal:rd-token-at"
  %t6514 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t6513, i64 3, i64 %a0, i64 %a1, i64 %t6357, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6515 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6515)
  %t6516 = and i64 %t6515, -8
  %t6517 = inttoptr i64 %t6516 to ptr
  %t6518 = load i64, ptr %t6517
  %t6519 = inttoptr i64 %t6518 to ptr
  %t6520 = musttail call fastcc i64 %t6519(i64 %t6515, i64 3, i64 %t6511, i64 %t6512, i64 %t6514, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6520
}

define fastcc i64 @"scheme.base:code:read-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6525 = icmp eq i64 %argc, 1
  br i1 %t6525, label %argok1526, label %arityerr1525
arityerr1525:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1526:
  %t6526 = call i64 @rt_string_length(i64 %a0)
  %t6527 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t6528 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t6527, i64 3, i64 %a0, i64 %t6526, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6529 = load i64, ptr @"emit.internal:rd-datum"
  %t6530 = call fastcc i64 @"emit.internal:code:rd-datum"(i64 %t6529, i64 4, i64 %a0, i64 %t6526, i64 %t6528, i64 1, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6531 = call i64 @rt_cdr(i64 %t6530)
  %t6532 = load i64, ptr @"emit.internal:rd-fail?"
  %t6533 = call fastcc i64 @"emit.internal:code:rd-fail?"(i64 %t6532, i64 1, i64 %t6531, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6534 = icmp ne i64 %t6533, 1
  br i1 %t6534, label %then1527, label %else1528
then1527:
  %t6535 = load i64, ptr @"scheme.base:rd-report"
  call void @rt_check_callable(i64 %t6535)
  %t6536 = and i64 %t6535, -8
  %t6537 = inttoptr i64 %t6536 to ptr
  %t6538 = load i64, ptr %t6537
  %t6539 = inttoptr i64 %t6538 to ptr
  %t6540 = musttail call fastcc i64 %t6539(i64 %t6535, i64 3, i64 %a0, i64 %t6526, i64 %t6530, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6540
else1528:
  %t6541 = call i64 @rt_car(i64 %t6530)
  ret i64 %t6541
}

define fastcc i64 @"scheme.base:code:read-all-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6546 = icmp eq i64 %argc, 1
  br i1 %t6546, label %argok1530, label %arityerr1529
arityerr1529:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1530:
  %t6547 = load i64, ptr @"scheme.base:rd-all"
  call void @rt_check_callable(i64 %t6547)
  %t6548 = and i64 %t6547, -8
  %t6549 = inttoptr i64 %t6548 to ptr
  %t6550 = load i64, ptr %t6549
  %t6551 = inttoptr i64 %t6550 to ptr
  %t6552 = musttail call fastcc i64 %t6551(i64 %t6547, i64 2, i64 %a0, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6552
}

define fastcc i64 @"scheme.base:code:read-all-from-string-ci"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6557 = icmp eq i64 %argc, 1
  br i1 %t6557, label %argok1532, label %arityerr1531
arityerr1531:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1532:
  %t6558 = load i64, ptr @"scheme.base:rd-all"
  call void @rt_check_callable(i64 %t6558)
  %t6559 = and i64 %t6558, -8
  %t6560 = inttoptr i64 %t6559 to ptr
  %t6561 = load i64, ptr %t6560
  %t6562 = inttoptr i64 %t6561 to ptr
  %t6563 = musttail call fastcc i64 %t6562(i64 %t6558, i64 2, i64 %a0, i64 257, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6563
}

define fastcc i64 @"scheme.base:code_1265"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6568 = icmp eq i64 %argc, 2
  br i1 %t6568, label %argok1534, label %arityerr1533
arityerr1533:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1534:
  %t6569 = load i64, ptr @"emit.internal:rd-fail?"
  %t6570 = call fastcc i64 @"emit.internal:code:rd-fail?"(i64 %t6569, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6571 = icmp ne i64 %t6570, 1
  br i1 %t6571, label %then1535, label %else1536
then1535:
  %t6572 = and i64 %self, -8
  %t6573 = inttoptr i64 %t6572 to ptr
  %t6574 = getelementptr i64, ptr %t6573, i64 1
  %t6575 = load i64, ptr %t6574
  %t6576 = and i64 %self, -8
  %t6577 = inttoptr i64 %t6576 to ptr
  %t6578 = getelementptr i64, ptr %t6577, i64 2
  %t6579 = load i64, ptr %t6578
  %t6580 = call i64 @rt_intern(ptr @.str.sym.31)
  %t6581 = call i64 @rt_cons(i64 %t6580, i64 %a0)
  %t6582 = load i64, ptr @"scheme.base:rd-report"
  call void @rt_check_callable(i64 %t6582)
  %t6583 = and i64 %t6582, -8
  %t6584 = inttoptr i64 %t6583 to ptr
  %t6585 = load i64, ptr %t6584
  %t6586 = inttoptr i64 %t6585 to ptr
  %t6587 = musttail call fastcc i64 %t6586(i64 %t6582, i64 3, i64 %t6575, i64 %t6579, i64 %t6581, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6587
else1536:
  %t6588 = and i64 %self, -8
  %t6589 = inttoptr i64 %t6588 to ptr
  %t6590 = getelementptr i64, ptr %t6589, i64 2
  %t6591 = load i64, ptr %t6590
  %t6592 = or i64 %a0, %t6591
  %t6593 = and i64 %t6592, 7
  %t6594 = icmp eq i64 %t6593, 0
  br i1 %t6594, label %fixfast1537, label %fixslow1538
fixfast1537:
  %t6595 = icmp slt i64 %a0, %t6591
  %t6596 = select i1 %t6595, i64 257, i64 1
  br label %fixmerge1539
fixslow1538:
  %t6597 = call i64 @rt_lt(i64 %a0, i64 %t6591)
  br label %fixmerge1539
fixmerge1539:
  %t6598 = phi i64 [ %t6596, %fixfast1537 ], [ %t6597, %fixslow1538 ]
  %t6599 = icmp ne i64 %t6598, 1
  br i1 %t6599, label %then1540, label %else1541
then1540:
  %t6600 = and i64 %self, -8
  %t6601 = inttoptr i64 %t6600 to ptr
  %t6602 = getelementptr i64, ptr %t6601, i64 1
  %t6603 = load i64, ptr %t6602
  %t6604 = and i64 %self, -8
  %t6605 = inttoptr i64 %t6604 to ptr
  %t6606 = getelementptr i64, ptr %t6605, i64 2
  %t6607 = load i64, ptr %t6606
  %t6608 = and i64 %self, -8
  %t6609 = inttoptr i64 %t6608 to ptr
  %t6610 = getelementptr i64, ptr %t6609, i64 3
  %t6611 = load i64, ptr %t6610
  %t6612 = load i64, ptr @"emit.internal:rd-datum"
  %t6613 = call fastcc i64 @"emit.internal:code:rd-datum"(i64 %t6612, i64 4, i64 %t6603, i64 %t6607, i64 %a0, i64 %t6611, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6614 = call i64 @rt_cdr(i64 %t6613)
  %t6615 = load i64, ptr @"emit.internal:rd-fail?"
  %t6616 = call fastcc i64 @"emit.internal:code:rd-fail?"(i64 %t6615, i64 1, i64 %t6614, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6617 = icmp ne i64 %t6616, 1
  br i1 %t6617, label %then1542, label %else1543
then1542:
  %t6618 = and i64 %self, -8
  %t6619 = inttoptr i64 %t6618 to ptr
  %t6620 = getelementptr i64, ptr %t6619, i64 1
  %t6621 = load i64, ptr %t6620
  %t6622 = and i64 %self, -8
  %t6623 = inttoptr i64 %t6622 to ptr
  %t6624 = getelementptr i64, ptr %t6623, i64 2
  %t6625 = load i64, ptr %t6624
  %t6626 = load i64, ptr @"scheme.base:rd-report"
  call void @rt_check_callable(i64 %t6626)
  %t6627 = and i64 %t6626, -8
  %t6628 = inttoptr i64 %t6627 to ptr
  %t6629 = load i64, ptr %t6628
  %t6630 = inttoptr i64 %t6629 to ptr
  %t6631 = musttail call fastcc i64 %t6630(i64 %t6626, i64 3, i64 %t6621, i64 %t6625, i64 %t6613, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6631
else1543:
  %t6632 = and i64 %self, -8
  %t6633 = inttoptr i64 %t6632 to ptr
  %t6634 = getelementptr i64, ptr %t6633, i64 1
  %t6635 = load i64, ptr %t6634
  %t6636 = and i64 %self, -8
  %t6637 = inttoptr i64 %t6636 to ptr
  %t6638 = getelementptr i64, ptr %t6637, i64 2
  %t6639 = load i64, ptr %t6638
  %t6640 = call i64 @rt_cdr(i64 %t6613)
  %t6641 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t6642 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t6641, i64 3, i64 %t6635, i64 %t6639, i64 %t6640, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6643 = call i64 @rt_car(i64 %t6613)
  %t6644 = call i64 @rt_cons(i64 %t6643, i64 %a1)
  %t6645 = musttail call fastcc i64 @"scheme.base:code_1265"(i64 %self, i64 2, i64 %t6642, i64 %t6644, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6645
else1541:
  %t6646 = load i64, ptr @"scheme.base:reverse"
  call void @rt_check_callable(i64 %t6646)
  %t6647 = and i64 %t6646, -8
  %t6648 = inttoptr i64 %t6647 to ptr
  %t6649 = load i64, ptr %t6648
  %t6650 = inttoptr i64 %t6649 to ptr
  %t6651 = musttail call fastcc i64 %t6650(i64 %t6646, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6651
}

define fastcc i64 @"scheme.base:code:rd-all"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6652 = icmp eq i64 %argc, 2
  br i1 %t6652, label %argok1545, label %arityerr1544
arityerr1544:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1545:
  %t6653 = call i64 @rt_string_length(i64 %a0)
  %t6654 = call ptr @rt_alloc_words(i64 5)
  %t6655 = ptrtoint ptr %t6654 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1265" to i64), ptr %t6654
  %t6656 = or i64 %t6655, 4
  %t6657 = getelementptr i64, ptr %t6654, i64 1
  store i64 %a0, ptr %t6657
  %t6658 = getelementptr i64, ptr %t6654, i64 2
  store i64 %t6653, ptr %t6658
  %t6659 = getelementptr i64, ptr %t6654, i64 3
  store i64 %a1, ptr %t6659
  %t6660 = getelementptr i64, ptr %t6654, i64 4
  store i64 %t6656, ptr %t6660
  %t6661 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t6662 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t6661, i64 3, i64 %a0, i64 %t6653, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6663 = musttail call fastcc i64 @"scheme.base:code_1265"(i64 %t6656, i64 2, i64 %t6662, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6663
}

define fastcc i64 @"scheme.base:code:port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6668 = icmp eq i64 %argc, 1
  br i1 %t6668, label %argok1547, label %arityerr1546
arityerr1546:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1547:
  %t6669 = load i64, ptr @"emit.internal:%port-rtd"
  %t6670 = call fastcc i64 @"emit.internal:code:%port-rtd"(i64 %t6669, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6671 = call i64 @rt_record_of_type_p(i64 %a0, i64 %t6670)
  ret i64 %t6671
}

define fastcc i64 @"scheme.base:code:input-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6676 = icmp eq i64 %argc, 1
  br i1 %t6676, label %argok1549, label %arityerr1548
arityerr1548:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1549:
  %t6677 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t6677)
  %t6678 = and i64 %t6677, -8
  %t6679 = inttoptr i64 %t6678 to ptr
  %t6680 = load i64, ptr %t6679
  %t6681 = inttoptr i64 %t6680 to ptr
  %t6682 = call fastcc i64%t6681(i64 %t6677, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6683 = icmp ne i64 %t6682, 1
  br i1 %t6683, label %then1550, label %else1551
then1550:
  %t6684 = call i64 @rt_record_ref(i64 %a0, i64 8)
  ret i64 %t6684
else1551:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6689 = icmp eq i64 %argc, 1
  br i1 %t6689, label %argok1553, label %arityerr1552
arityerr1552:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1553:
  %t6690 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t6690)
  %t6691 = and i64 %t6690, -8
  %t6692 = inttoptr i64 %t6691 to ptr
  %t6693 = load i64, ptr %t6692
  %t6694 = inttoptr i64 %t6693 to ptr
  %t6695 = call fastcc i64%t6694(i64 %t6690, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6696 = icmp ne i64 %t6695, 1
  br i1 %t6696, label %then1554, label %else1555
then1554:
  %t6697 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t6698 = call i64 @rt_not(i64 %t6697)
  ret i64 %t6698
else1555:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:textual-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6703 = icmp eq i64 %argc, 1
  br i1 %t6703, label %argok1557, label %arityerr1556
arityerr1556:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1557:
  %t6704 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t6704)
  %t6705 = and i64 %t6704, -8
  %t6706 = inttoptr i64 %t6705 to ptr
  %t6707 = load i64, ptr %t6706
  %t6708 = inttoptr i64 %t6707 to ptr
  %t6709 = musttail call fastcc i64 %t6708(i64 %t6704, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6709
}

define fastcc i64 @"scheme.base:code:port-closed?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6714 = icmp eq i64 %argc, 1
  br i1 %t6714, label %argok1559, label %arityerr1558
arityerr1558:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1559:
  %t6715 = call i64 @rt_record_ref(i64 %a0, i64 40)
  ret i64 %t6715
}

define fastcc i64 @"scheme.base:code:input-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6720 = icmp eq i64 %argc, 1
  br i1 %t6720, label %argok1561, label %arityerr1560
arityerr1560:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1561:
  %t6721 = load i64, ptr @"scheme.base:input-port?"
  call void @rt_check_callable(i64 %t6721)
  %t6722 = and i64 %t6721, -8
  %t6723 = inttoptr i64 %t6722 to ptr
  %t6724 = load i64, ptr %t6723
  %t6725 = inttoptr i64 %t6724 to ptr
  %t6726 = call fastcc i64%t6725(i64 %t6721, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6727 = icmp ne i64 %t6726, 1
  br i1 %t6727, label %then1562, label %else1563
then1562:
  %t6728 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t6729 = call i64 @rt_not(i64 %t6728)
  ret i64 %t6729
else1563:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6734 = icmp eq i64 %argc, 1
  br i1 %t6734, label %argok1565, label %arityerr1564
arityerr1564:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1565:
  %t6735 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t6735)
  %t6736 = and i64 %t6735, -8
  %t6737 = inttoptr i64 %t6736 to ptr
  %t6738 = load i64, ptr %t6737
  %t6739 = inttoptr i64 %t6738 to ptr
  %t6740 = call fastcc i64%t6739(i64 %t6735, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6741 = icmp ne i64 %t6740, 1
  br i1 %t6741, label %then1566, label %else1567
then1566:
  %t6742 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t6743 = call i64 @rt_not(i64 %t6742)
  ret i64 %t6743
else1567:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%check-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6748 = icmp eq i64 %argc, 2
  br i1 %t6748, label %argok1569, label %arityerr1568
arityerr1568:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1569:
  %t6749 = load i64, ptr @"scheme.base:input-port?"
  call void @rt_check_callable(i64 %t6749)
  %t6750 = and i64 %t6749, -8
  %t6751 = inttoptr i64 %t6750 to ptr
  %t6752 = load i64, ptr %t6751
  %t6753 = inttoptr i64 %t6752 to ptr
  %t6754 = call fastcc i64%t6753(i64 %t6749, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6755 = call i64 @rt_not(i64 %t6754)
  %t6756 = icmp ne i64 %t6755, 1
  br i1 %t6756, label %then1570, label %else1571
then1570:
  %t6757 = call i64 @rt_make_string(ptr @.str.lit.53, i64 17)
  %t6758 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6758)
  %t6759 = and i64 %t6758, -8
  %t6760 = inttoptr i64 %t6759 to ptr
  %t6761 = load i64, ptr %t6760
  %t6762 = inttoptr i64 %t6761 to ptr
  %t6763 = musttail call fastcc i64 %t6762(i64 %t6758, i64 3, i64 %a1, i64 %t6757, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6763
else1571:
  %t6764 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t6765 = icmp ne i64 %t6764, 1
  br i1 %t6765, label %then1572, label %else1573
then1572:
  %t6766 = call i64 @rt_make_string(ptr @.str.lit.54, i64 14)
  %t6767 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6767)
  %t6768 = and i64 %t6767, -8
  %t6769 = inttoptr i64 %t6768 to ptr
  %t6770 = load i64, ptr %t6769
  %t6771 = inttoptr i64 %t6770 to ptr
  %t6772 = musttail call fastcc i64 %t6771(i64 %t6767, i64 3, i64 %a1, i64 %t6766, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6772
else1573:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:%check-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6777 = icmp eq i64 %argc, 2
  br i1 %t6777, label %argok1575, label %arityerr1574
arityerr1574:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1575:
  %t6778 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t6778)
  %t6779 = and i64 %t6778, -8
  %t6780 = inttoptr i64 %t6779 to ptr
  %t6781 = load i64, ptr %t6780
  %t6782 = inttoptr i64 %t6781 to ptr
  %t6783 = call fastcc i64%t6782(i64 %t6778, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6784 = call i64 @rt_not(i64 %t6783)
  %t6785 = icmp ne i64 %t6784, 1
  br i1 %t6785, label %then1576, label %else1577
then1576:
  %t6786 = call i64 @rt_make_string(ptr @.str.lit.55, i64 18)
  %t6787 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6787)
  %t6788 = and i64 %t6787, -8
  %t6789 = inttoptr i64 %t6788 to ptr
  %t6790 = load i64, ptr %t6789
  %t6791 = inttoptr i64 %t6790 to ptr
  %t6792 = musttail call fastcc i64 %t6791(i64 %t6787, i64 3, i64 %a1, i64 %t6786, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6792
else1577:
  %t6793 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t6794 = icmp ne i64 %t6793, 1
  br i1 %t6794, label %then1578, label %else1579
then1578:
  %t6795 = call i64 @rt_make_string(ptr @.str.lit.56, i64 14)
  %t6796 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6796)
  %t6797 = and i64 %t6796, -8
  %t6798 = inttoptr i64 %t6797 to ptr
  %t6799 = load i64, ptr %t6798
  %t6800 = inttoptr i64 %t6799 to ptr
  %t6801 = musttail call fastcc i64 %t6800(i64 %t6796, i64 3, i64 %a1, i64 %t6795, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6801
else1579:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:open-input-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6806 = icmp eq i64 %argc, 1
  br i1 %t6806, label %argok1581, label %arityerr1580
arityerr1580:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1581:
  %t6807 = load i64, ptr @"emit.internal:%make-port"
  %t6808 = musttail call fastcc i64 @"emit.internal:code:%make-port"(i64 %t6807, i64 6, i64 1, i64 257, i64 %a0, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t6808
}

define fastcc i64 @"scheme.base:code:%port-at-eof?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6813 = icmp eq i64 %argc, 1
  br i1 %t6813, label %argok1583, label %arityerr1582
arityerr1582:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1583:
  %t6814 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t6815 = load i64, ptr @"emit.internal:%port-buf"
  %t6816 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t6815, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6817 = call i64 @rt_string_length(i64 %t6816)
  %t6818 = or i64 %t6817, %t6814
  %t6819 = and i64 %t6818, 7
  %t6820 = icmp eq i64 %t6819, 0
  br i1 %t6820, label %fixfast1584, label %fixslow1585
fixfast1584:
  %t6821 = icmp slt i64 %t6817, %t6814
  %t6822 = select i1 %t6821, i64 257, i64 1
  br label %fixmerge1586
fixslow1585:
  %t6823 = call i64 @rt_lt(i64 %t6817, i64 %t6814)
  br label %fixmerge1586
fixmerge1586:
  %t6824 = phi i64 [ %t6822, %fixfast1584 ], [ %t6823, %fixslow1585 ]
  %t6825 = icmp ne i64 %t6824, 1
  br i1 %t6825, label %then1587, label %else1588
then1587:
  ret i64 257
else1588:
  %t6826 = or i64 %t6814, %t6817
  %t6827 = and i64 %t6826, 7
  %t6828 = icmp eq i64 %t6827, 0
  br i1 %t6828, label %fixfast1589, label %fixslow1590
fixfast1589:
  %t6829 = icmp eq i64 %t6814, %t6817
  %t6830 = select i1 %t6829, i64 257, i64 1
  br label %fixmerge1591
fixslow1590:
  %t6831 = call i64 @rt_num_eq(i64 %t6814, i64 %t6817)
  br label %fixmerge1591
fixmerge1591:
  %t6832 = phi i64 [ %t6830, %fixfast1589 ], [ %t6831, %fixslow1590 ]
  ret i64 %t6832
}

define fastcc i64 @"scheme.base:code:read-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6837 = icmp eq i64 %argc, 1
  br i1 %t6837, label %argok1593, label %arityerr1592
arityerr1592:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1593:
  %t6838 = call i64 @rt_intern(ptr @.str.sym.57)
  %t6839 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t6839)
  %t6840 = and i64 %t6839, -8
  %t6841 = inttoptr i64 %t6840 to ptr
  %t6842 = load i64, ptr %t6841
  %t6843 = inttoptr i64 %t6842 to ptr
  %t6844 = call fastcc i64%t6843(i64 %t6839, i64 2, i64 %a0, i64 %t6838, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6845 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t6845)
  %t6846 = and i64 %t6845, -8
  %t6847 = inttoptr i64 %t6846 to ptr
  %t6848 = load i64, ptr %t6847
  %t6849 = inttoptr i64 %t6848 to ptr
  %t6850 = call fastcc i64%t6849(i64 %t6845, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6851 = icmp ne i64 %t6850, 1
  br i1 %t6851, label %then1594, label %else1595
then1594:
  %t6852 = call i64 @rt_eof_object()
  ret i64 %t6852
else1595:
  %t6853 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t6854 = or i64 %t6853, 8
  %t6855 = and i64 %t6854, 7
  %t6856 = icmp eq i64 %t6855, 0
  br i1 %t6856, label %fixfast1596, label %fixslow1597
fixfast1596:
  %t6857 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6853, i64 8)
  %t6858 = extractvalue {i64, i1} %t6857, 0
  %t6859 = extractvalue {i64, i1} %t6857, 1
  br i1 %t6859, label %fixslow1597, label %fixmerge1598
fixslow1597:
  %t6860 = call i64 @rt_add(i64 %t6853, i64 8)
  br label %fixmerge1598
fixmerge1598:
  %t6861 = phi i64 [ %t6858, %fixfast1596 ], [ %t6860, %fixslow1597 ]
  %t6862 = call i64 @rt_record_set(i64 %a0, i64 24, i64 %t6861)
  %t6863 = load i64, ptr @"emit.internal:%port-buf"
  %t6864 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t6863, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6865 = call i64 @rt_string_ref(i64 %t6864, i64 %t6853)
  ret i64 %t6865
}

define fastcc i64 @"scheme.base:code:peek-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6870 = icmp eq i64 %argc, 1
  br i1 %t6870, label %argok1600, label %arityerr1599
arityerr1599:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1600:
  %t6871 = call i64 @rt_intern(ptr @.str.sym.58)
  %t6872 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t6872)
  %t6873 = and i64 %t6872, -8
  %t6874 = inttoptr i64 %t6873 to ptr
  %t6875 = load i64, ptr %t6874
  %t6876 = inttoptr i64 %t6875 to ptr
  %t6877 = call fastcc i64%t6876(i64 %t6872, i64 2, i64 %a0, i64 %t6871, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6878 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t6878)
  %t6879 = and i64 %t6878, -8
  %t6880 = inttoptr i64 %t6879 to ptr
  %t6881 = load i64, ptr %t6880
  %t6882 = inttoptr i64 %t6881 to ptr
  %t6883 = call fastcc i64%t6882(i64 %t6878, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6884 = icmp ne i64 %t6883, 1
  br i1 %t6884, label %then1601, label %else1602
then1601:
  %t6885 = call i64 @rt_eof_object()
  ret i64 %t6885
else1602:
  %t6886 = load i64, ptr @"emit.internal:%port-buf"
  %t6887 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t6886, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6888 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t6889 = call i64 @rt_string_ref(i64 %t6887, i64 %t6888)
  ret i64 %t6889
}

define fastcc i64 @"scheme.base:code_1312"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6894 = icmp eq i64 %argc, 1
  br i1 %t6894, label %argok1604, label %arityerr1603
arityerr1603:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1604:
  %t6895 = and i64 %self, -8
  %t6896 = inttoptr i64 %t6895 to ptr
  %t6897 = getelementptr i64, ptr %t6896, i64 1
  %t6898 = load i64, ptr %t6897
  %t6899 = or i64 %t6898, %a0
  %t6900 = and i64 %t6899, 7
  %t6901 = icmp eq i64 %t6900, 0
  br i1 %t6901, label %fixfast1605, label %fixslow1606
fixfast1605:
  %t6902 = icmp slt i64 %t6898, %a0
  %t6903 = select i1 %t6902, i64 257, i64 1
  br label %fixmerge1607
fixslow1606:
  %t6904 = call i64 @rt_lt(i64 %t6898, i64 %a0)
  br label %fixmerge1607
fixmerge1607:
  %t6905 = phi i64 [ %t6903, %fixfast1605 ], [ %t6904, %fixslow1606 ]
  %t6906 = icmp ne i64 %t6905, 1
  br i1 %t6906, label %then1608, label %else1609
then1608:
  br label %merge1610
else1609:
  %t6907 = or i64 %a0, %t6898
  %t6908 = and i64 %t6907, 7
  %t6909 = icmp eq i64 %t6908, 0
  br i1 %t6909, label %fixfast1611, label %fixslow1612
fixfast1611:
  %t6910 = icmp eq i64 %a0, %t6898
  %t6911 = select i1 %t6910, i64 257, i64 1
  br label %fixmerge1613
fixslow1612:
  %t6912 = call i64 @rt_num_eq(i64 %a0, i64 %t6898)
  br label %fixmerge1613
fixmerge1613:
  %t6913 = phi i64 [ %t6911, %fixfast1611 ], [ %t6912, %fixslow1612 ]
  br label %merge1610
merge1610:
  %t6914 = phi i64 [ 257, %then1608 ], [ %t6913, %fixmerge1613 ]
  %t6915 = icmp ne i64 %t6914, 1
  br i1 %t6915, label %then1614, label %else1615
then1614:
  %t6916 = and i64 %self, -8
  %t6917 = inttoptr i64 %t6916 to ptr
  %t6918 = getelementptr i64, ptr %t6917, i64 2
  %t6919 = load i64, ptr %t6918
  %t6920 = call i64 @rt_record_ref(i64 %t6919, i64 24)
  %t6921 = and i64 %self, -8
  %t6922 = inttoptr i64 %t6921 to ptr
  %t6923 = getelementptr i64, ptr %t6922, i64 2
  %t6924 = load i64, ptr %t6923
  %t6925 = and i64 %self, -8
  %t6926 = inttoptr i64 %t6925 to ptr
  %t6927 = getelementptr i64, ptr %t6926, i64 1
  %t6928 = load i64, ptr %t6927
  %t6929 = call i64 @rt_record_set(i64 %t6924, i64 24, i64 %t6928)
  %t6930 = and i64 %self, -8
  %t6931 = inttoptr i64 %t6930 to ptr
  %t6932 = getelementptr i64, ptr %t6931, i64 3
  %t6933 = load i64, ptr %t6932
  %t6934 = and i64 %self, -8
  %t6935 = inttoptr i64 %t6934 to ptr
  %t6936 = getelementptr i64, ptr %t6935, i64 1
  %t6937 = load i64, ptr %t6936
  %t6938 = call i64 @rt_substring(i64 %t6933, i64 %t6920, i64 %t6937)
  ret i64 %t6938
else1615:
  %t6939 = and i64 %self, -8
  %t6940 = inttoptr i64 %t6939 to ptr
  %t6941 = getelementptr i64, ptr %t6940, i64 3
  %t6942 = load i64, ptr %t6941
  %t6943 = call i64 @rt_string_ref(i64 %t6942, i64 %a0)
  %t6944 = load i64, ptr @"scheme.base:char=?"
  call void @rt_check_callable(i64 %t6944)
  %t6945 = and i64 %t6944, -8
  %t6946 = inttoptr i64 %t6945 to ptr
  %t6947 = load i64, ptr %t6946
  %t6948 = inttoptr i64 %t6947 to ptr
  %t6949 = call fastcc i64%t6948(i64 %t6944, i64 2, i64 %t6943, i64 2569, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6950 = icmp ne i64 %t6949, 1
  br i1 %t6950, label %then1616, label %else1617
then1616:
  %t6951 = and i64 %self, -8
  %t6952 = inttoptr i64 %t6951 to ptr
  %t6953 = getelementptr i64, ptr %t6952, i64 2
  %t6954 = load i64, ptr %t6953
  %t6955 = call i64 @rt_record_ref(i64 %t6954, i64 24)
  %t6956 = and i64 %self, -8
  %t6957 = inttoptr i64 %t6956 to ptr
  %t6958 = getelementptr i64, ptr %t6957, i64 2
  %t6959 = load i64, ptr %t6958
  %t6960 = or i64 %a0, 8
  %t6961 = and i64 %t6960, 7
  %t6962 = icmp eq i64 %t6961, 0
  br i1 %t6962, label %fixfast1618, label %fixslow1619
fixfast1618:
  %t6963 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t6964 = extractvalue {i64, i1} %t6963, 0
  %t6965 = extractvalue {i64, i1} %t6963, 1
  br i1 %t6965, label %fixslow1619, label %fixmerge1620
fixslow1619:
  %t6966 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1620
fixmerge1620:
  %t6967 = phi i64 [ %t6964, %fixfast1618 ], [ %t6966, %fixslow1619 ]
  %t6968 = call i64 @rt_record_set(i64 %t6959, i64 24, i64 %t6967)
  %t6969 = and i64 %self, -8
  %t6970 = inttoptr i64 %t6969 to ptr
  %t6971 = getelementptr i64, ptr %t6970, i64 3
  %t6972 = load i64, ptr %t6971
  %t6973 = call i64 @rt_substring(i64 %t6972, i64 %t6955, i64 %a0)
  ret i64 %t6973
else1617:
  %t6974 = or i64 %a0, 8
  %t6975 = and i64 %t6974, 7
  %t6976 = icmp eq i64 %t6975, 0
  br i1 %t6976, label %fixfast1621, label %fixslow1622
fixfast1621:
  %t6977 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t6978 = extractvalue {i64, i1} %t6977, 0
  %t6979 = extractvalue {i64, i1} %t6977, 1
  br i1 %t6979, label %fixslow1622, label %fixmerge1623
fixslow1622:
  %t6980 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1623
fixmerge1623:
  %t6981 = phi i64 [ %t6978, %fixfast1621 ], [ %t6980, %fixslow1622 ]
  %t6982 = musttail call fastcc i64 @"scheme.base:code_1312"(i64 %self, i64 1, i64 %t6981, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6982
}

define fastcc i64 @"scheme.base:code:read-line"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6983 = icmp eq i64 %argc, 1
  br i1 %t6983, label %argok1625, label %arityerr1624
arityerr1624:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1625:
  %t6984 = call i64 @rt_intern(ptr @.str.sym.59)
  %t6985 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t6985)
  %t6986 = and i64 %t6985, -8
  %t6987 = inttoptr i64 %t6986 to ptr
  %t6988 = load i64, ptr %t6987
  %t6989 = inttoptr i64 %t6988 to ptr
  %t6990 = call fastcc i64%t6989(i64 %t6985, i64 2, i64 %a0, i64 %t6984, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6991 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t6991)
  %t6992 = and i64 %t6991, -8
  %t6993 = inttoptr i64 %t6992 to ptr
  %t6994 = load i64, ptr %t6993
  %t6995 = inttoptr i64 %t6994 to ptr
  %t6996 = call fastcc i64%t6995(i64 %t6991, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6997 = icmp ne i64 %t6996, 1
  br i1 %t6997, label %then1626, label %else1627
then1626:
  %t6998 = call i64 @rt_eof_object()
  ret i64 %t6998
else1627:
  %t6999 = load i64, ptr @"emit.internal:%port-buf"
  %t7000 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t6999, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7001 = call i64 @rt_string_length(i64 %t7000)
  %t7002 = call ptr @rt_alloc_words(i64 5)
  %t7003 = ptrtoint ptr %t7002 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1312" to i64), ptr %t7002
  %t7004 = or i64 %t7003, 4
  %t7005 = getelementptr i64, ptr %t7002, i64 1
  store i64 %t7001, ptr %t7005
  %t7006 = getelementptr i64, ptr %t7002, i64 2
  store i64 %a0, ptr %t7006
  %t7007 = getelementptr i64, ptr %t7002, i64 3
  store i64 %t7000, ptr %t7007
  %t7008 = getelementptr i64, ptr %t7002, i64 4
  store i64 %t7004, ptr %t7008
  %t7009 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t7010 = musttail call fastcc i64 @"scheme.base:code_1312"(i64 %t7004, i64 1, i64 %t7009, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7010
}

define fastcc i64 @"scheme.base:code:read-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7015 = icmp eq i64 %argc, 2
  br i1 %t7015, label %argok1629, label %arityerr1628
arityerr1628:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1629:
  %t7016 = call i64 @rt_intern(ptr @.str.sym.60)
  %t7017 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t7017)
  %t7018 = and i64 %t7017, -8
  %t7019 = inttoptr i64 %t7018 to ptr
  %t7020 = load i64, ptr %t7019
  %t7021 = inttoptr i64 %t7020 to ptr
  %t7022 = call fastcc i64%t7021(i64 %t7017, i64 2, i64 %a1, i64 %t7016, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7023 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t7023)
  %t7024 = and i64 %t7023, -8
  %t7025 = inttoptr i64 %t7024 to ptr
  %t7026 = load i64, ptr %t7025
  %t7027 = inttoptr i64 %t7026 to ptr
  %t7028 = call fastcc i64%t7027(i64 %t7023, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7029 = icmp ne i64 %t7028, 1
  br i1 %t7029, label %then1630, label %else1631
then1630:
  %t7030 = call i64 @rt_eof_object()
  ret i64 %t7030
else1631:
  %t7031 = load i64, ptr @"emit.internal:%port-buf"
  %t7032 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t7031, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7033 = call i64 @rt_string_length(i64 %t7032)
  %t7034 = call i64 @rt_record_ref(i64 %a1, i64 24)
  %t7035 = or i64 %t7034, %a0
  %t7036 = and i64 %t7035, 7
  %t7037 = icmp eq i64 %t7036, 0
  br i1 %t7037, label %fixfast1632, label %fixslow1633
fixfast1632:
  %t7038 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t7034, i64 %a0)
  %t7039 = extractvalue {i64, i1} %t7038, 0
  %t7040 = extractvalue {i64, i1} %t7038, 1
  br i1 %t7040, label %fixslow1633, label %fixmerge1634
fixslow1633:
  %t7041 = call i64 @rt_add(i64 %t7034, i64 %a0)
  br label %fixmerge1634
fixmerge1634:
  %t7042 = phi i64 [ %t7039, %fixfast1632 ], [ %t7041, %fixslow1633 ]
  %t7043 = or i64 %t7033, %t7042
  %t7044 = and i64 %t7043, 7
  %t7045 = icmp eq i64 %t7044, 0
  br i1 %t7045, label %fixfast1635, label %fixslow1636
fixfast1635:
  %t7046 = icmp slt i64 %t7033, %t7042
  %t7047 = select i1 %t7046, i64 257, i64 1
  br label %fixmerge1637
fixslow1636:
  %t7048 = call i64 @rt_lt(i64 %t7033, i64 %t7042)
  br label %fixmerge1637
fixmerge1637:
  %t7049 = phi i64 [ %t7047, %fixfast1635 ], [ %t7048, %fixslow1636 ]
  %t7050 = icmp ne i64 %t7049, 1
  br i1 %t7050, label %then1638, label %else1639
then1638:
  br label %merge1640
else1639:
  %t7051 = or i64 %t7034, %a0
  %t7052 = and i64 %t7051, 7
  %t7053 = icmp eq i64 %t7052, 0
  br i1 %t7053, label %fixfast1641, label %fixslow1642
fixfast1641:
  %t7054 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t7034, i64 %a0)
  %t7055 = extractvalue {i64, i1} %t7054, 0
  %t7056 = extractvalue {i64, i1} %t7054, 1
  br i1 %t7056, label %fixslow1642, label %fixmerge1643
fixslow1642:
  %t7057 = call i64 @rt_add(i64 %t7034, i64 %a0)
  br label %fixmerge1643
fixmerge1643:
  %t7058 = phi i64 [ %t7055, %fixfast1641 ], [ %t7057, %fixslow1642 ]
  br label %merge1640
merge1640:
  %t7059 = phi i64 [ %t7033, %then1638 ], [ %t7058, %fixmerge1643 ]
  %t7060 = call i64 @rt_record_set(i64 %a1, i64 24, i64 %t7059)
  %t7061 = call i64 @rt_substring(i64 %t7032, i64 %t7034, i64 %t7059)
  ret i64 %t7061
}

define fastcc i64 @"scheme.base:code:open-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7066 = icmp eq i64 %argc, 0
  br i1 %t7066, label %argok1645, label %arityerr1644
arityerr1644:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1645:
  %t7067 = call i64 @rt_port_open_output_string()
  %t7068 = icmp ne i64 %t7067, 1
  br i1 %t7068, label %then1646, label %else1647
then1646:
  %t7069 = load i64, ptr @"emit.internal:%make-port"
  %t7070 = musttail call fastcc i64 @"emit.internal:code:%make-port"(i64 %t7069, i64 6, i64 %t7067, i64 1, i64 1, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t7070
else1647:
  %t7071 = call i64 @rt_intern(ptr @.str.sym.61)
  %t7072 = call i64 @rt_make_string(ptr @.str.lit.62, i64 33)
  %t7073 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t7073)
  %t7074 = and i64 %t7073, -8
  %t7075 = inttoptr i64 %t7074 to ptr
  %t7076 = load i64, ptr %t7075
  %t7077 = inttoptr i64 %t7076 to ptr
  %t7078 = musttail call fastcc i64 %t7077(i64 %t7073, i64 2, i64 %t7071, i64 %t7072, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7078
}

define fastcc i64 @"scheme.base:code:get-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7083 = icmp eq i64 %argc, 1
  br i1 %t7083, label %argok1649, label %arityerr1648
arityerr1648:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1649:
  %t7084 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t7084)
  %t7085 = and i64 %t7084, -8
  %t7086 = inttoptr i64 %t7085 to ptr
  %t7087 = load i64, ptr %t7086
  %t7088 = inttoptr i64 %t7087 to ptr
  %t7089 = call fastcc i64%t7088(i64 %t7084, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7090 = call i64 @rt_not(i64 %t7089)
  %t7091 = icmp ne i64 %t7090, 1
  br i1 %t7091, label %then1650, label %else1651
then1650:
  %t7092 = call i64 @rt_intern(ptr @.str.sym.63)
  %t7093 = call i64 @rt_make_string(ptr @.str.lit.64, i64 18)
  %t7094 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t7094)
  %t7095 = and i64 %t7094, -8
  %t7096 = inttoptr i64 %t7095 to ptr
  %t7097 = load i64, ptr %t7096
  %t7098 = inttoptr i64 %t7097 to ptr
  %t7099 = musttail call fastcc i64 %t7098(i64 %t7094, i64 3, i64 %t7092, i64 %t7093, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7099
else1651:
  %t7100 = call i64 @rt_record_ref(i64 %a0, i64 32)
  %t7101 = call i64 @rt_not(i64 %t7100)
  %t7102 = icmp ne i64 %t7101, 1
  br i1 %t7102, label %then1652, label %else1653
then1652:
  %t7103 = call i64 @rt_intern(ptr @.str.sym.63)
  %t7104 = call i64 @rt_make_string(ptr @.str.lit.65, i64 17)
  %t7105 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t7105)
  %t7106 = and i64 %t7105, -8
  %t7107 = inttoptr i64 %t7106 to ptr
  %t7108 = load i64, ptr %t7107
  %t7109 = inttoptr i64 %t7108 to ptr
  %t7110 = musttail call fastcc i64 %t7109(i64 %t7105, i64 3, i64 %t7103, i64 %t7104, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7110
else1653:
  %t7111 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t7112 = call i64 @rt_port_get_output_string(i64 %t7111)
  ret i64 %t7112
}

define fastcc i64 @"scheme.base:code:flush-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7117 = icmp eq i64 %argc, 1
  br i1 %t7117, label %argok1655, label %arityerr1654
arityerr1654:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1655:
  %t7118 = call i64 @rt_intern(ptr @.str.sym.66)
  %t7119 = load i64, ptr @"scheme.base:%check-output-port"
  call void @rt_check_callable(i64 %t7119)
  %t7120 = and i64 %t7119, -8
  %t7121 = inttoptr i64 %t7120 to ptr
  %t7122 = load i64, ptr %t7121
  %t7123 = inttoptr i64 %t7122 to ptr
  %t7124 = call fastcc i64%t7123(i64 %t7119, i64 2, i64 %a0, i64 %t7118, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7125 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t7126 = call i64 @rt_port_flush(i64 %t7125)
  ret i64 %t7126
}

define fastcc i64 @"scheme.base:code:close-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7131 = icmp eq i64 %argc, 1
  br i1 %t7131, label %argok1657, label %arityerr1656
arityerr1656:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1657:
  %t7132 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t7132)
  %t7133 = and i64 %t7132, -8
  %t7134 = inttoptr i64 %t7133 to ptr
  %t7135 = load i64, ptr %t7134
  %t7136 = inttoptr i64 %t7135 to ptr
  %t7137 = call fastcc i64%t7136(i64 %t7132, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7138 = call i64 @rt_not(i64 %t7137)
  %t7139 = icmp ne i64 %t7138, 1
  br i1 %t7139, label %then1658, label %else1659
then1658:
  %t7140 = call i64 @rt_intern(ptr @.str.sym.67)
  %t7141 = call i64 @rt_make_string(ptr @.str.lit.68, i64 10)
  %t7142 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t7142)
  %t7143 = and i64 %t7142, -8
  %t7144 = inttoptr i64 %t7143 to ptr
  %t7145 = load i64, ptr %t7144
  %t7146 = inttoptr i64 %t7145 to ptr
  %t7147 = musttail call fastcc i64 %t7146(i64 %t7142, i64 3, i64 %t7140, i64 %t7141, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7147
else1659:
  %t7148 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t7149 = icmp ne i64 %t7148, 1
  br i1 %t7149, label %then1660, label %else1661
then1660:
  %t7150 = icmp ne i64 1, 1
  br i1 %t7150, label %then1662, label %else1663
then1662:
  ret i64 1
else1663:
  ret i64 17
else1661:
  %t7151 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t7152 = call i64 @rt_not(i64 %t7151)
  %t7153 = icmp ne i64 %t7152, 1
  br i1 %t7153, label %then1664, label %else1665
then1664:
  %t7154 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t7155 = call i64 @rt_port_close(i64 %t7154)
  br label %merge1666
else1665:
  br label %merge1666
merge1666:
  %t7156 = phi i64 [ %t7155, %then1664 ], [ 17, %else1665 ]
  %t7157 = call i64 @rt_record_set(i64 %a0, i64 40, i64 257)
  %t7158 = icmp ne i64 1, 1
  br i1 %t7158, label %then1667, label %else1668
then1667:
  ret i64 1
else1668:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:close-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7163 = icmp eq i64 %argc, 1
  br i1 %t7163, label %argok1670, label %arityerr1669
arityerr1669:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1670:
  %t7164 = load i64, ptr @"scheme.base:input-port?"
  call void @rt_check_callable(i64 %t7164)
  %t7165 = and i64 %t7164, -8
  %t7166 = inttoptr i64 %t7165 to ptr
  %t7167 = load i64, ptr %t7166
  %t7168 = inttoptr i64 %t7167 to ptr
  %t7169 = call fastcc i64%t7168(i64 %t7164, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7170 = icmp ne i64 %t7169, 1
  br i1 %t7170, label %then1671, label %else1672
then1671:
  %t7171 = load i64, ptr @"scheme.base:close-port"
  call void @rt_check_callable(i64 %t7171)
  %t7172 = and i64 %t7171, -8
  %t7173 = inttoptr i64 %t7172 to ptr
  %t7174 = load i64, ptr %t7173
  %t7175 = inttoptr i64 %t7174 to ptr
  %t7176 = musttail call fastcc i64 %t7175(i64 %t7171, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7176
else1672:
  %t7177 = call i64 @rt_intern(ptr @.str.sym.69)
  %t7178 = call i64 @rt_make_string(ptr @.str.lit.70, i64 17)
  %t7179 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t7179)
  %t7180 = and i64 %t7179, -8
  %t7181 = inttoptr i64 %t7180 to ptr
  %t7182 = load i64, ptr %t7181
  %t7183 = inttoptr i64 %t7182 to ptr
  %t7184 = musttail call fastcc i64 %t7183(i64 %t7179, i64 3, i64 %t7177, i64 %t7178, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7184
}

define fastcc i64 @"scheme.base:code:close-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7189 = icmp eq i64 %argc, 1
  br i1 %t7189, label %argok1674, label %arityerr1673
arityerr1673:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1674:
  %t7190 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t7190)
  %t7191 = and i64 %t7190, -8
  %t7192 = inttoptr i64 %t7191 to ptr
  %t7193 = load i64, ptr %t7192
  %t7194 = inttoptr i64 %t7193 to ptr
  %t7195 = call fastcc i64%t7194(i64 %t7190, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7196 = icmp ne i64 %t7195, 1
  br i1 %t7196, label %then1675, label %else1676
then1675:
  %t7197 = load i64, ptr @"scheme.base:close-port"
  call void @rt_check_callable(i64 %t7197)
  %t7198 = and i64 %t7197, -8
  %t7199 = inttoptr i64 %t7198 to ptr
  %t7200 = load i64, ptr %t7199
  %t7201 = inttoptr i64 %t7200 to ptr
  %t7202 = musttail call fastcc i64 %t7201(i64 %t7197, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7202
else1676:
  %t7203 = call i64 @rt_intern(ptr @.str.sym.71)
  %t7204 = call i64 @rt_make_string(ptr @.str.lit.72, i64 18)
  %t7205 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t7205)
  %t7206 = and i64 %t7205, -8
  %t7207 = inttoptr i64 %t7206 to ptr
  %t7208 = load i64, ptr %t7207
  %t7209 = inttoptr i64 %t7208 to ptr
  %t7210 = musttail call fastcc i64 %t7209(i64 %t7205, i64 3, i64 %t7203, i64 %t7204, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7210
}

define fastcc i64 @"scheme.base:code:current-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7218 = icmp sge i64 %argc, 0
  br i1 %t7218, label %argok1678, label %arityerr1677
arityerr1677:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1678:
  %t7219 = call ptr @rt_alloc_words(i64 8)
  %t7220 = getelementptr i64, ptr %t7219, i64 0
  store i64 %a0, ptr %t7220
  %t7221 = getelementptr i64, ptr %t7219, i64 1
  store i64 %a1, ptr %t7221
  %t7222 = getelementptr i64, ptr %t7219, i64 2
  store i64 %a2, ptr %t7222
  %t7223 = getelementptr i64, ptr %t7219, i64 3
  store i64 %a3, ptr %t7223
  %t7224 = getelementptr i64, ptr %t7219, i64 4
  store i64 %a4, ptr %t7224
  %t7225 = getelementptr i64, ptr %t7219, i64 5
  store i64 %a5, ptr %t7225
  %t7226 = getelementptr i64, ptr %t7219, i64 6
  store i64 %a6, ptr %t7226
  %t7227 = getelementptr i64, ptr %t7219, i64 7
  store i64 %a7, ptr %t7227
  %t7228 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t7219, ptr %overflow)
  %t7229 = call i64 @rt_null_p(i64 %t7228)
  %t7230 = icmp ne i64 %t7229, 1
  br i1 %t7230, label %then1679, label %else1680
then1679:
  %t7231 = load i64, ptr @"scheme.base:%stdout-port"
  %t7232 = call i64 @rt_not(i64 %t7231)
  %t7233 = icmp ne i64 %t7232, 1
  br i1 %t7233, label %then1681, label %else1682
then1681:
  %t7234 = load i64, ptr @"emit.internal:%make-port"
  %t7235 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t7234, i64 6, i64 0, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t7236 = call i64 @rt_root(i64 %t7235)
  store i64 %t7236, ptr @"scheme.base:%stdout-port"
  %t7237 = call i64 @rt_set_current_output(i64 0)
  br label %merge1683
else1682:
  br label %merge1683
merge1683:
  %t7238 = phi i64 [ %t7237, %then1681 ], [ 17, %else1682 ]
  %t7239 = load i64, ptr @"scheme.base:%stdout-port"
  ret i64 %t7239
else1680:
  %t7240 = call i64 @rt_car(i64 %t7228)
  %t7241 = call i64 @rt_root(i64 %t7240)
  store i64 %t7241, ptr @"scheme.base:%stdout-port"
  %t7242 = call i64 @rt_record_ref(i64 %t7240, i64 0)
  %t7243 = call i64 @rt_set_current_output(i64 %t7242)
  %t7244 = icmp ne i64 1, 1
  br i1 %t7244, label %then1684, label %else1685
then1684:
  ret i64 1
else1685:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-error-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7249 = icmp sge i64 %argc, 0
  br i1 %t7249, label %argok1687, label %arityerr1686
arityerr1686:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1687:
  %t7250 = call ptr @rt_alloc_words(i64 8)
  %t7251 = getelementptr i64, ptr %t7250, i64 0
  store i64 %a0, ptr %t7251
  %t7252 = getelementptr i64, ptr %t7250, i64 1
  store i64 %a1, ptr %t7252
  %t7253 = getelementptr i64, ptr %t7250, i64 2
  store i64 %a2, ptr %t7253
  %t7254 = getelementptr i64, ptr %t7250, i64 3
  store i64 %a3, ptr %t7254
  %t7255 = getelementptr i64, ptr %t7250, i64 4
  store i64 %a4, ptr %t7255
  %t7256 = getelementptr i64, ptr %t7250, i64 5
  store i64 %a5, ptr %t7256
  %t7257 = getelementptr i64, ptr %t7250, i64 6
  store i64 %a6, ptr %t7257
  %t7258 = getelementptr i64, ptr %t7250, i64 7
  store i64 %a7, ptr %t7258
  %t7259 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t7250, ptr %overflow)
  %t7260 = call i64 @rt_null_p(i64 %t7259)
  %t7261 = icmp ne i64 %t7260, 1
  br i1 %t7261, label %then1688, label %else1689
then1688:
  %t7262 = load i64, ptr @"scheme.base:%stderr-port"
  %t7263 = call i64 @rt_not(i64 %t7262)
  %t7264 = icmp ne i64 %t7263, 1
  br i1 %t7264, label %then1690, label %else1691
then1690:
  %t7265 = load i64, ptr @"emit.internal:%make-port"
  %t7266 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t7265, i64 6, i64 8, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t7267 = call i64 @rt_root(i64 %t7266)
  store i64 %t7267, ptr @"scheme.base:%stderr-port"
  br label %merge1692
else1691:
  br label %merge1692
merge1692:
  %t7268 = phi i64 [ 17, %then1690 ], [ 17, %else1691 ]
  %t7269 = load i64, ptr @"scheme.base:%stderr-port"
  ret i64 %t7269
else1689:
  %t7270 = call i64 @rt_car(i64 %t7259)
  %t7271 = call i64 @rt_root(i64 %t7270)
  store i64 %t7271, ptr @"scheme.base:%stderr-port"
  %t7272 = icmp ne i64 1, 1
  br i1 %t7272, label %then1693, label %else1694
then1693:
  ret i64 1
else1694:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7277 = icmp sge i64 %argc, 0
  br i1 %t7277, label %argok1696, label %arityerr1695
arityerr1695:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1696:
  %t7278 = call ptr @rt_alloc_words(i64 8)
  %t7279 = getelementptr i64, ptr %t7278, i64 0
  store i64 %a0, ptr %t7279
  %t7280 = getelementptr i64, ptr %t7278, i64 1
  store i64 %a1, ptr %t7280
  %t7281 = getelementptr i64, ptr %t7278, i64 2
  store i64 %a2, ptr %t7281
  %t7282 = getelementptr i64, ptr %t7278, i64 3
  store i64 %a3, ptr %t7282
  %t7283 = getelementptr i64, ptr %t7278, i64 4
  store i64 %a4, ptr %t7283
  %t7284 = getelementptr i64, ptr %t7278, i64 5
  store i64 %a5, ptr %t7284
  %t7285 = getelementptr i64, ptr %t7278, i64 6
  store i64 %a6, ptr %t7285
  %t7286 = getelementptr i64, ptr %t7278, i64 7
  store i64 %a7, ptr %t7286
  %t7287 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t7278, ptr %overflow)
  %t7288 = call i64 @rt_null_p(i64 %t7287)
  %t7289 = icmp ne i64 %t7288, 1
  br i1 %t7289, label %then1697, label %else1698
then1697:
  %t7290 = load i64, ptr @"scheme.base:%stdin-port"
  %t7291 = call i64 @rt_not(i64 %t7290)
  %t7292 = icmp ne i64 %t7291, 1
  br i1 %t7292, label %then1699, label %else1700
then1699:
  %t7293 = load i64, ptr @"emit.internal:%make-port"
  %t7294 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t7293, i64 6, i64 1, i64 257, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t7295 = call i64 @rt_root(i64 %t7294)
  store i64 %t7295, ptr @"scheme.base:%stdin-port"
  br label %merge1701
else1700:
  br label %merge1701
merge1701:
  %t7296 = phi i64 [ 17, %then1699 ], [ 17, %else1700 ]
  %t7297 = load i64, ptr @"scheme.base:%stdin-port"
  ret i64 %t7297
else1698:
  %t7298 = call i64 @rt_car(i64 %t7287)
  %t7299 = call i64 @rt_root(i64 %t7298)
  store i64 %t7299, ptr @"scheme.base:%stdin-port"
  %t7300 = icmp ne i64 1, 1
  br i1 %t7300, label %then1702, label %else1703
then1702:
  ret i64 1
else1703:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_1347"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7305 = icmp eq i64 %argc, 0
  br i1 %t7305, label %argok1705, label %arityerr1704
arityerr1704:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1705:
  %t7306 = icmp ne i64 1, 1
  br i1 %t7306, label %then1706, label %else1707
then1706:
  ret i64 1
else1707:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_1349"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7307 = icmp eq i64 %argc, 0
  br i1 %t7307, label %argok1709, label %arityerr1708
arityerr1708:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1709:
  %t7308 = and i64 %self, -8
  %t7309 = inttoptr i64 %t7308 to ptr
  %t7310 = getelementptr i64, ptr %t7309, i64 2
  %t7311 = load i64, ptr %t7310
  %t7312 = and i64 %self, -8
  %t7313 = inttoptr i64 %t7312 to ptr
  %t7314 = getelementptr i64, ptr %t7313, i64 1
  %t7315 = load i64, ptr %t7314
  call void @rt_check_callable(i64 %t7315)
  %t7316 = and i64 %t7315, -8
  %t7317 = inttoptr i64 %t7316 to ptr
  %t7318 = load i64, ptr %t7317
  %t7319 = inttoptr i64 %t7318 to ptr
  %t7320 = musttail call fastcc i64 %t7319(i64 %t7315, i64 1, i64 %t7311, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7320
}

define fastcc i64 @"scheme.base:code_1351"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7321 = icmp eq i64 %argc, 0
  br i1 %t7321, label %argok1711, label %arityerr1710
arityerr1710:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1711:
  %t7322 = and i64 %self, -8
  %t7323 = inttoptr i64 %t7322 to ptr
  %t7324 = getelementptr i64, ptr %t7323, i64 1
  %t7325 = load i64, ptr %t7324
  %t7326 = load i64, ptr @"scheme.base:close-port"
  call void @rt_check_callable(i64 %t7326)
  %t7327 = and i64 %t7326, -8
  %t7328 = inttoptr i64 %t7327 to ptr
  %t7329 = load i64, ptr %t7328
  %t7330 = inttoptr i64 %t7329 to ptr
  %t7331 = musttail call fastcc i64 %t7330(i64 %t7326, i64 1, i64 %t7325, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7331
}

define fastcc i64 @"scheme.base:code:call-with-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7332 = icmp eq i64 %argc, 2
  br i1 %t7332, label %argok1713, label %arityerr1712
arityerr1712:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1713:
  %t7333 = call ptr @rt_alloc_words(i64 1)
  %t7334 = ptrtoint ptr %t7333 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1347" to i64), ptr %t7333
  %t7335 = or i64 %t7334, 4
  %t7336 = call ptr @rt_alloc_words(i64 3)
  %t7337 = ptrtoint ptr %t7336 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1349" to i64), ptr %t7336
  %t7338 = getelementptr i64, ptr %t7336, i64 1
  store i64 %a1, ptr %t7338
  %t7339 = getelementptr i64, ptr %t7336, i64 2
  store i64 %a0, ptr %t7339
  %t7340 = or i64 %t7337, 4
  %t7341 = call ptr @rt_alloc_words(i64 2)
  %t7342 = ptrtoint ptr %t7341 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1351" to i64), ptr %t7341
  %t7343 = getelementptr i64, ptr %t7341, i64 1
  store i64 %a0, ptr %t7343
  %t7344 = or i64 %t7342, 4
  %t7345 = load i64, ptr @"scheme.base:dynamic-wind"
  call void @rt_check_callable(i64 %t7345)
  %t7346 = and i64 %t7345, -8
  %t7347 = inttoptr i64 %t7346 to ptr
  %t7348 = load i64, ptr %t7347
  %t7349 = inttoptr i64 %t7348 to ptr
  %t7350 = musttail call fastcc i64 %t7349(i64 %t7345, i64 3, i64 %t7335, i64 %t7340, i64 %t7344, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7350
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
  %t378 = call ptr @rt_alloc_words(i64 1)
  %t379 = ptrtoint ptr %t378 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:member" to i64), ptr %t378
  %t380 = or i64 %t379, 4
  %t381 = call i64 @rt_root(i64 %t380)
  store i64 %t381, ptr @"scheme.base:member"
  ret i64 17
}

define i64 @"scheme.base:__init_18"() {
entry:
  %t399 = call ptr @rt_alloc_words(i64 1)
  %t400 = ptrtoint ptr %t399 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:member-by" to i64), ptr %t399
  %t401 = or i64 %t400, 4
  %t402 = call i64 @rt_root(i64 %t401)
  store i64 %t402, ptr @"scheme.base:member-by"
  ret i64 17
}

define i64 @"scheme.base:__init_19"() {
entry:
  %t437 = call ptr @rt_alloc_words(i64 1)
  %t438 = ptrtoint ptr %t437 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:assoc" to i64), ptr %t437
  %t439 = or i64 %t438, 4
  %t440 = call i64 @rt_root(i64 %t439)
  store i64 %t440, ptr @"scheme.base:assoc"
  ret i64 17
}

define i64 @"scheme.base:__init_20"() {
entry:
  %t460 = call ptr @rt_alloc_words(i64 1)
  %t461 = ptrtoint ptr %t460 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:assoc-by" to i64), ptr %t460
  %t462 = or i64 %t461, 4
  %t463 = call i64 @rt_root(i64 %t462)
  store i64 %t463, ptr @"scheme.base:assoc-by"
  ret i64 17
}

define i64 @"scheme.base:__init_21"() {
entry:
  %t490 = call ptr @rt_alloc_words(i64 1)
  %t491 = ptrtoint ptr %t490 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:filter" to i64), ptr %t490
  %t492 = or i64 %t491, 4
  %t493 = call i64 @rt_root(i64 %t492)
  store i64 %t493, ptr @"scheme.base:filter"
  ret i64 17
}

define i64 @"scheme.base:__init_22"() {
entry:
  %t510 = call ptr @rt_alloc_words(i64 1)
  %t511 = ptrtoint ptr %t510 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:fold-left" to i64), ptr %t510
  %t512 = or i64 %t511, 4
  %t513 = call i64 @rt_root(i64 %t512)
  store i64 %t513, ptr @"scheme.base:fold-left"
  ret i64 17
}

define i64 @"scheme.base:__init_23"() {
entry:
  %t530 = call ptr @rt_alloc_words(i64 1)
  %t531 = ptrtoint ptr %t530 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:fold-right" to i64), ptr %t530
  %t532 = or i64 %t531, 4
  %t533 = call i64 @rt_root(i64 %t532)
  store i64 %t533, ptr @"scheme.base:fold-right"
  ret i64 17
}

define i64 @"scheme.base:__init_24"() {
entry:
  %t551 = call ptr @rt_alloc_words(i64 1)
  %t552 = ptrtoint ptr %t551 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%for-each1" to i64), ptr %t551
  %t553 = or i64 %t552, 4
  %t554 = call i64 @rt_root(i64 %t553)
  store i64 %t554, ptr @"scheme.base:%for-each1"
  ret i64 17
}

define i64 @"scheme.base:__init_25"() {
entry:
  %t619 = call ptr @rt_alloc_words(i64 1)
  %t620 = ptrtoint ptr %t619 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%for-eachn" to i64), ptr %t619
  %t621 = or i64 %t620, 4
  %t622 = call i64 @rt_root(i64 %t621)
  store i64 %t622, ptr @"scheme.base:%for-eachn"
  ret i64 17
}

define i64 @"scheme.base:__init_26"() {
entry:
  %t649 = call ptr @rt_alloc_words(i64 1)
  %t650 = ptrtoint ptr %t649 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:for-each" to i64), ptr %t649
  %t651 = or i64 %t650, 4
  %t652 = call i64 @rt_root(i64 %t651)
  store i64 %t652, ptr @"scheme.base:for-each"
  ret i64 17
}

define i64 @"scheme.base:__init_27"() {
entry:
  %t670 = call ptr @rt_alloc_words(i64 1)
  %t671 = ptrtoint ptr %t670 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:andmap" to i64), ptr %t670
  %t672 = or i64 %t671, 4
  %t673 = call i64 @rt_root(i64 %t672)
  store i64 %t673, ptr @"scheme.base:andmap"
  ret i64 17
}

define i64 @"scheme.base:__init_28"() {
entry:
  %t691 = call ptr @rt_alloc_words(i64 1)
  %t692 = ptrtoint ptr %t691 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:memp" to i64), ptr %t691
  %t693 = or i64 %t692, 4
  %t694 = call i64 @rt_root(i64 %t693)
  store i64 %t694, ptr @"scheme.base:memp"
  ret i64 17
}

define i64 @"scheme.base:__init_29"() {
entry:
  %t707 = call ptr @rt_alloc_words(i64 1)
  %t708 = ptrtoint ptr %t707 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list?" to i64), ptr %t707
  %t709 = or i64 %t708, 4
  %t710 = call i64 @rt_root(i64 %t709)
  store i64 %t710, ptr @"scheme.base:list?"
  ret i64 17
}

define i64 @"scheme.base:__init_30"() {
entry:
  %t719 = call ptr @rt_alloc_words(i64 1)
  %t720 = ptrtoint ptr %t719 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:zero?" to i64), ptr %t719
  %t721 = or i64 %t720, 4
  %t722 = call i64 @rt_root(i64 %t721)
  store i64 %t722, ptr @"scheme.base:zero?"
  ret i64 17
}

define i64 @"scheme.base:__init_31"() {
entry:
  %t746 = call ptr @rt_alloc_words(i64 1)
  %t747 = ptrtoint ptr %t746 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-tail" to i64), ptr %t746
  %t748 = or i64 %t747, 4
  %t749 = call i64 @rt_root(i64 %t748)
  store i64 %t749, ptr @"scheme.base:list-tail"
  ret i64 17
}

define i64 @"scheme.base:__init_32"() {
entry:
  %t758 = call ptr @rt_alloc_words(i64 1)
  %t759 = ptrtoint ptr %t758 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-ref" to i64), ptr %t758
  %t760 = or i64 %t759, 4
  %t761 = call i64 @rt_root(i64 %t760)
  store i64 %t761, ptr @"scheme.base:list-ref"
  ret i64 17
}

define i64 @"scheme.base:__init_33"() {
entry:
  %t770 = call ptr @rt_alloc_words(i64 1)
  %t771 = ptrtoint ptr %t770 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-set!" to i64), ptr %t770
  %t772 = or i64 %t771, 4
  %t773 = call i64 @rt_root(i64 %t772)
  store i64 %t773, ptr @"scheme.base:list-set!"
  ret i64 17
}

define i64 @"scheme.base:__init_34"() {
entry:
  %t799 = call ptr @rt_alloc_words(i64 1)
  %t800 = ptrtoint ptr %t799 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-head" to i64), ptr %t799
  %t801 = or i64 %t800, 4
  %t802 = call i64 @rt_root(i64 %t801)
  store i64 %t802, ptr @"scheme.base:list-head"
  ret i64 17
}

define i64 @"scheme.base:__init_35"() {
entry:
  %t826 = call ptr @rt_alloc_words(i64 1)
  %t827 = ptrtoint ptr %t826 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-list" to i64), ptr %t826
  %t828 = or i64 %t827, 4
  %t829 = call i64 @rt_root(i64 %t828)
  store i64 %t829, ptr @"scheme.base:make-list"
  ret i64 17
}

define i64 @"scheme.base:__init_36"() {
entry:
  %t866 = call ptr @rt_alloc_words(i64 1)
  %t867 = ptrtoint ptr %t866 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:iota" to i64), ptr %t866
  %t868 = or i64 %t867, 4
  %t869 = call i64 @rt_root(i64 %t868)
  store i64 %t869, ptr @"scheme.base:iota"
  ret i64 17
}

define i64 @"scheme.base:__init_37"() {
entry:
  %t892 = call ptr @rt_alloc_words(i64 1)
  %t893 = ptrtoint ptr %t892 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%minmax-fold" to i64), ptr %t892
  %t894 = or i64 %t893, 4
  %t895 = call i64 @rt_root(i64 %t894)
  store i64 %t895, ptr @"scheme.base:%minmax-fold"
  ret i64 17
}

define i64 @"scheme.base:__init_38"() {
entry:
  %t904 = call ptr @rt_alloc_words(i64 1)
  %t905 = ptrtoint ptr %t904 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%minmax" to i64), ptr %t904
  %t906 = or i64 %t905, 4
  %t907 = call i64 @rt_root(i64 %t906)
  store i64 %t907, ptr @"scheme.base:%minmax"
  ret i64 17
}

define i64 @"scheme.base:__init_39"() {
entry:
  %t937 = call ptr @rt_alloc_words(i64 1)
  %t938 = ptrtoint ptr %t937 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:max" to i64), ptr %t937
  %t939 = or i64 %t938, 4
  %t940 = call i64 @rt_root(i64 %t939)
  store i64 %t940, ptr @"scheme.base:max"
  ret i64 17
}

define i64 @"scheme.base:__init_40"() {
entry:
  %t970 = call ptr @rt_alloc_words(i64 1)
  %t971 = ptrtoint ptr %t970 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:min" to i64), ptr %t970
  %t972 = or i64 %t971, 4
  %t973 = call i64 @rt_root(i64 %t972)
  store i64 %t973, ptr @"scheme.base:min"
  ret i64 17
}

define i64 @"scheme.base:__init_41"() {
entry:
  %t976 = call ptr @rt_alloc_words(i64 1)
  %t977 = ptrtoint ptr %t976 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:complex?" to i64), ptr %t976
  %t978 = or i64 %t977, 4
  %t979 = call i64 @rt_root(i64 %t978)
  store i64 %t979, ptr @"scheme.base:complex?"
  ret i64 17
}

define i64 @"scheme.base:__init_42"() {
entry:
  %t984 = call ptr @rt_alloc_words(i64 1)
  %t985 = ptrtoint ptr %t984 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:exact-integer?" to i64), ptr %t984
  %t986 = or i64 %t985, 4
  %t987 = call i64 @rt_root(i64 %t986)
  store i64 %t987, ptr @"scheme.base:exact-integer?"
  ret i64 17
}

define i64 @"scheme.base:__init_43"() {
entry:
  %t992 = call ptr @rt_alloc_words(i64 1)
  %t993 = ptrtoint ptr %t992 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rational?" to i64), ptr %t992
  %t994 = or i64 %t993, 4
  %t995 = call i64 @rt_root(i64 %t994)
  store i64 %t995, ptr @"scheme.base:rational?"
  ret i64 17
}

define i64 @"scheme.base:__init_44"() {
entry:
  %t1004 = call ptr @rt_alloc_words(i64 1)
  %t1005 = ptrtoint ptr %t1004 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:positive?" to i64), ptr %t1004
  %t1006 = or i64 %t1005, 4
  %t1007 = call i64 @rt_root(i64 %t1006)
  store i64 %t1007, ptr @"scheme.base:positive?"
  ret i64 17
}

define i64 @"scheme.base:__init_45"() {
entry:
  %t1016 = call ptr @rt_alloc_words(i64 1)
  %t1017 = ptrtoint ptr %t1016 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:negative?" to i64), ptr %t1016
  %t1018 = or i64 %t1017, 4
  %t1019 = call i64 @rt_root(i64 %t1018)
  store i64 %t1019, ptr @"scheme.base:negative?"
  ret i64 17
}

define i64 @"scheme.base:__init_46"() {
entry:
  %t1029 = call ptr @rt_alloc_words(i64 1)
  %t1030 = ptrtoint ptr %t1029 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:even?" to i64), ptr %t1029
  %t1031 = or i64 %t1030, 4
  %t1032 = call i64 @rt_root(i64 %t1031)
  store i64 %t1032, ptr @"scheme.base:even?"
  ret i64 17
}

define i64 @"scheme.base:__init_47"() {
entry:
  %t1043 = call ptr @rt_alloc_words(i64 1)
  %t1044 = ptrtoint ptr %t1043 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:odd?" to i64), ptr %t1043
  %t1045 = or i64 %t1044, 4
  %t1046 = call i64 @rt_root(i64 %t1045)
  store i64 %t1046, ptr @"scheme.base:odd?"
  ret i64 17
}

define i64 @"scheme.base:__init_48"() {
entry:
  %t1064 = call ptr @rt_alloc_words(i64 1)
  %t1065 = ptrtoint ptr %t1064 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:abs" to i64), ptr %t1064
  %t1066 = or i64 %t1065, 4
  %t1067 = call i64 @rt_root(i64 %t1066)
  store i64 %t1067, ptr @"scheme.base:abs"
  ret i64 17
}

define i64 @"scheme.base:__init_49"() {
entry:
  %t1078 = call ptr @rt_alloc_words(i64 1)
  %t1079 = ptrtoint ptr %t1078 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:square" to i64), ptr %t1078
  %t1080 = or i64 %t1079, 4
  %t1081 = call i64 @rt_root(i64 %t1080)
  store i64 %t1081, ptr @"scheme.base:square"
  ret i64 17
}

define i64 @"scheme.base:__init_50"() {
entry:
  %t1098 = call ptr @rt_alloc_words(i64 1)
  %t1099 = ptrtoint ptr %t1098 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%gcd2" to i64), ptr %t1098
  %t1100 = or i64 %t1099, 4
  %t1101 = call i64 @rt_root(i64 %t1100)
  store i64 %t1101, ptr @"scheme.base:%gcd2"
  ret i64 17
}

define i64 @"scheme.base:__init_51"() {
entry:
  %t1131 = call ptr @rt_alloc_words(i64 1)
  %t1132 = ptrtoint ptr %t1131 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%gcd-fold" to i64), ptr %t1131
  %t1133 = or i64 %t1132, 4
  %t1134 = call i64 @rt_root(i64 %t1133)
  store i64 %t1134, ptr @"scheme.base:%gcd-fold"
  ret i64 17
}

define i64 @"scheme.base:__init_52"() {
entry:
  %t1176 = call ptr @rt_alloc_words(i64 1)
  %t1177 = ptrtoint ptr %t1176 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%lcm-fold" to i64), ptr %t1176
  %t1178 = or i64 %t1177, 4
  %t1179 = call i64 @rt_root(i64 %t1178)
  store i64 %t1179, ptr @"scheme.base:%lcm-fold"
  ret i64 17
}

define i64 @"scheme.base:__init_53"() {
entry:
  %t1197 = call ptr @rt_alloc_words(i64 1)
  %t1198 = ptrtoint ptr %t1197 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:gcd" to i64), ptr %t1197
  %t1199 = or i64 %t1198, 4
  %t1200 = call i64 @rt_root(i64 %t1199)
  store i64 %t1200, ptr @"scheme.base:gcd"
  ret i64 17
}

define i64 @"scheme.base:__init_54"() {
entry:
  %t1218 = call ptr @rt_alloc_words(i64 1)
  %t1219 = ptrtoint ptr %t1218 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:lcm" to i64), ptr %t1218
  %t1220 = or i64 %t1219, 4
  %t1221 = call i64 @rt_root(i64 %t1220)
  store i64 %t1221, ptr @"scheme.base:lcm"
  ret i64 17
}

define i64 @"scheme.base:__init_55"() {
entry:
  %t1264 = call ptr @rt_alloc_words(i64 1)
  %t1265 = ptrtoint ptr %t1264 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%expt-exact" to i64), ptr %t1264
  %t1266 = or i64 %t1265, 4
  %t1267 = call i64 @rt_root(i64 %t1266)
  store i64 %t1267, ptr @"scheme.base:%expt-exact"
  ret i64 17
}

define i64 @"scheme.base:__init_56"() {
entry:
  %t1296 = call ptr @rt_alloc_words(i64 1)
  %t1297 = ptrtoint ptr %t1296 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:expt" to i64), ptr %t1296
  %t1298 = or i64 %t1297, 4
  %t1299 = call i64 @rt_root(i64 %t1298)
  store i64 %t1299, ptr @"scheme.base:expt"
  ret i64 17
}

define i64 @"scheme.base:__init_57"() {
entry:
  %t1325 = call ptr @rt_alloc_words(i64 1)
  %t1326 = ptrtoint ptr %t1325 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%isqrt-loop" to i64), ptr %t1325
  %t1327 = or i64 %t1326, 4
  %t1328 = call i64 @rt_root(i64 %t1327)
  store i64 %t1328, ptr @"scheme.base:%isqrt-loop"
  ret i64 17
}

define i64 @"scheme.base:__init_58"() {
entry:
  %t1344 = call ptr @rt_alloc_words(i64 1)
  %t1345 = ptrtoint ptr %t1344 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%isqrt" to i64), ptr %t1344
  %t1346 = or i64 %t1345, 4
  %t1347 = call i64 @rt_root(i64 %t1346)
  store i64 %t1347, ptr @"scheme.base:%isqrt"
  ret i64 17
}

define i64 @"scheme.base:__init_59"() {
entry:
  %t1378 = call ptr @rt_alloc_words(i64 1)
  %t1379 = ptrtoint ptr %t1378 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:exact-integer-sqrt" to i64), ptr %t1378
  %t1380 = or i64 %t1379, 4
  %t1381 = call i64 @rt_root(i64 %t1380)
  store i64 %t1381, ptr @"scheme.base:exact-integer-sqrt"
  ret i64 17
}

define i64 @"scheme.base:__init_60"() {
entry:
  %t1386 = call ptr @rt_alloc_words(i64 1)
  %t1387 = ptrtoint ptr %t1386 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:floor" to i64), ptr %t1386
  %t1388 = or i64 %t1387, 4
  %t1389 = call i64 @rt_root(i64 %t1388)
  store i64 %t1389, ptr @"scheme.base:floor"
  ret i64 17
}

define i64 @"scheme.base:__init_61"() {
entry:
  %t1394 = call ptr @rt_alloc_words(i64 1)
  %t1395 = ptrtoint ptr %t1394 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:ceiling" to i64), ptr %t1394
  %t1396 = or i64 %t1395, 4
  %t1397 = call i64 @rt_root(i64 %t1396)
  store i64 %t1397, ptr @"scheme.base:ceiling"
  ret i64 17
}

define i64 @"scheme.base:__init_62"() {
entry:
  %t1402 = call ptr @rt_alloc_words(i64 1)
  %t1403 = ptrtoint ptr %t1402 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:truncate" to i64), ptr %t1402
  %t1404 = or i64 %t1403, 4
  %t1405 = call i64 @rt_root(i64 %t1404)
  store i64 %t1405, ptr @"scheme.base:truncate"
  ret i64 17
}

define i64 @"scheme.base:__init_63"() {
entry:
  %t1410 = call ptr @rt_alloc_words(i64 1)
  %t1411 = ptrtoint ptr %t1410 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:round" to i64), ptr %t1410
  %t1412 = or i64 %t1411, 4
  %t1413 = call i64 @rt_root(i64 %t1412)
  store i64 %t1413, ptr @"scheme.base:round"
  ret i64 17
}

define i64 @"scheme.base:__init_64"() {
entry:
  %t1416 = call ptr @rt_alloc_words(i64 1)
  %t1417 = ptrtoint ptr %t1416 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:truncate-quotient" to i64), ptr %t1416
  %t1418 = or i64 %t1417, 4
  %t1419 = call i64 @rt_root(i64 %t1418)
  store i64 %t1419, ptr @"scheme.base:truncate-quotient"
  ret i64 17
}

define i64 @"scheme.base:__init_65"() {
entry:
  %t1422 = call ptr @rt_alloc_words(i64 1)
  %t1423 = ptrtoint ptr %t1422 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:truncate-remainder" to i64), ptr %t1422
  %t1424 = or i64 %t1423, 4
  %t1425 = call i64 @rt_root(i64 %t1424)
  store i64 %t1425, ptr @"scheme.base:truncate-remainder"
  ret i64 17
}

define i64 @"scheme.base:__init_66"() {
entry:
  %t1428 = call ptr @rt_alloc_words(i64 1)
  %t1429 = ptrtoint ptr %t1428 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:floor-remainder" to i64), ptr %t1428
  %t1430 = or i64 %t1429, 4
  %t1431 = call i64 @rt_root(i64 %t1430)
  store i64 %t1431, ptr @"scheme.base:floor-remainder"
  ret i64 17
}

define i64 @"scheme.base:__init_67"() {
entry:
  %t1443 = call ptr @rt_alloc_words(i64 1)
  %t1444 = ptrtoint ptr %t1443 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:floor-quotient" to i64), ptr %t1443
  %t1445 = or i64 %t1444, 4
  %t1446 = call i64 @rt_root(i64 %t1445)
  store i64 %t1446, ptr @"scheme.base:floor-quotient"
  ret i64 17
}

define i64 @"scheme.base:__init_68"() {
entry:
  %t1456 = call ptr @rt_alloc_words(i64 1)
  %t1457 = ptrtoint ptr %t1456 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:truncate/" to i64), ptr %t1456
  %t1458 = or i64 %t1457, 4
  %t1459 = call i64 @rt_root(i64 %t1458)
  store i64 %t1459, ptr @"scheme.base:truncate/"
  ret i64 17
}

define i64 @"scheme.base:__init_69"() {
entry:
  %t1474 = call ptr @rt_alloc_words(i64 1)
  %t1475 = ptrtoint ptr %t1474 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:floor/" to i64), ptr %t1474
  %t1476 = or i64 %t1475, 4
  %t1477 = call i64 @rt_root(i64 %t1476)
  store i64 %t1477, ptr @"scheme.base:floor/"
  ret i64 17
}

define i64 @"scheme.base:__init_70"() {
entry:
  %t1488 = call ptr @rt_alloc_words(i64 1)
  %t1489 = ptrtoint ptr %t1488 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:numerator" to i64), ptr %t1488
  %t1490 = or i64 %t1489, 4
  %t1491 = call i64 @rt_root(i64 %t1490)
  store i64 %t1491, ptr @"scheme.base:numerator"
  ret i64 17
}

define i64 @"scheme.base:__init_71"() {
entry:
  %t1505 = call ptr @rt_alloc_words(i64 1)
  %t1506 = ptrtoint ptr %t1505 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:denominator" to i64), ptr %t1505
  %t1507 = or i64 %t1506, 4
  %t1508 = call i64 @rt_root(i64 %t1507)
  store i64 %t1508, ptr @"scheme.base:denominator"
  ret i64 17
}

define i64 @"scheme.base:__init_72"() {
entry:
  %t1511 = call ptr @rt_alloc_words(i64 1)
  %t1512 = ptrtoint ptr %t1511 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:inexact" to i64), ptr %t1511
  %t1513 = or i64 %t1512, 4
  %t1514 = call i64 @rt_root(i64 %t1513)
  store i64 %t1514, ptr @"scheme.base:inexact"
  ret i64 17
}

define i64 @"scheme.base:__init_73"() {
entry:
  %t1517 = call ptr @rt_alloc_words(i64 1)
  %t1518 = ptrtoint ptr %t1517 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:exact" to i64), ptr %t1517
  %t1519 = or i64 %t1518, 4
  %t1520 = call i64 @rt_root(i64 %t1519)
  store i64 %t1520, ptr @"scheme.base:exact"
  ret i64 17
}

define i64 @"scheme.base:__init_74"() {
entry:
  %t1523 = call ptr @rt_alloc_words(i64 1)
  %t1524 = ptrtoint ptr %t1523 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:void" to i64), ptr %t1523
  %t1525 = or i64 %t1524, 4
  %t1526 = call i64 @rt_root(i64 %t1525)
  store i64 %t1526, ptr @"scheme.base:void"
  ret i64 17
}

define i64 @"scheme.base:__init_75"() {
entry:
  %t1539 = call ptr @rt_alloc_words(i64 1)
  %t1540 = ptrtoint ptr %t1539 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string" to i64), ptr %t1539
  %t1541 = or i64 %t1540, 4
  %t1542 = call i64 @rt_root(i64 %t1541)
  store i64 %t1542, ptr @"scheme.base:string"
  ret i64 17
}

define i64 @"scheme.base:__init_76"() {
entry:
  %t1556 = call ptr @rt_alloc_words(i64 1)
  %t1557 = ptrtoint ptr %t1556 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%str-concat" to i64), ptr %t1556
  %t1558 = or i64 %t1557, 4
  %t1559 = call i64 @rt_root(i64 %t1558)
  store i64 %t1559, ptr @"scheme.base:%str-concat"
  ret i64 17
}

define i64 @"scheme.base:__init_77"() {
entry:
  %t1579 = call ptr @rt_alloc_words(i64 1)
  %t1580 = ptrtoint ptr %t1579 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:chr-cmp" to i64), ptr %t1579
  %t1581 = or i64 %t1580, 4
  %t1582 = call i64 @rt_root(i64 %t1581)
  store i64 %t1582, ptr @"scheme.base:chr-cmp"
  ret i64 17
}

define i64 @"scheme.base:__init_78"() {
entry:
  %t1611 = call ptr @rt_alloc_words(i64 1)
  %t1612 = ptrtoint ptr %t1611 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char=?" to i64), ptr %t1611
  %t1613 = or i64 %t1612, 4
  %t1614 = call i64 @rt_root(i64 %t1613)
  store i64 %t1614, ptr @"scheme.base:char=?"
  ret i64 17
}

define i64 @"scheme.base:__init_79"() {
entry:
  %t1643 = call ptr @rt_alloc_words(i64 1)
  %t1644 = ptrtoint ptr %t1643 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char<?" to i64), ptr %t1643
  %t1645 = or i64 %t1644, 4
  %t1646 = call i64 @rt_root(i64 %t1645)
  store i64 %t1646, ptr @"scheme.base:char<?"
  ret i64 17
}

define i64 @"scheme.base:__init_80"() {
entry:
  %t1675 = call ptr @rt_alloc_words(i64 1)
  %t1676 = ptrtoint ptr %t1675 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char>?" to i64), ptr %t1675
  %t1677 = or i64 %t1676, 4
  %t1678 = call i64 @rt_root(i64 %t1677)
  store i64 %t1678, ptr @"scheme.base:char>?"
  ret i64 17
}

define i64 @"scheme.base:__init_81"() {
entry:
  %t1715 = call ptr @rt_alloc_words(i64 1)
  %t1716 = ptrtoint ptr %t1715 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char<=?" to i64), ptr %t1715
  %t1717 = or i64 %t1716, 4
  %t1718 = call i64 @rt_root(i64 %t1717)
  store i64 %t1718, ptr @"scheme.base:char<=?"
  ret i64 17
}

define i64 @"scheme.base:__init_82"() {
entry:
  %t1755 = call ptr @rt_alloc_words(i64 1)
  %t1756 = ptrtoint ptr %t1755 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char>=?" to i64), ptr %t1755
  %t1757 = or i64 %t1756, 4
  %t1758 = call i64 @rt_root(i64 %t1757)
  store i64 %t1758, ptr @"scheme.base:char>=?"
  ret i64 17
}

define i64 @"scheme.base:__init_83"() {
entry:
  %t1833 = call ptr @rt_alloc_words(i64 1)
  %t1834 = ptrtoint ptr %t1833 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string->list" to i64), ptr %t1833
  %t1835 = or i64 %t1834, 4
  %t1836 = call i64 @rt_root(i64 %t1835)
  store i64 %t1836, ptr @"scheme.base:string->list"
  ret i64 17
}

define i64 @"scheme.base:__init_84"() {
entry:
  %t1844 = call ptr @rt_alloc_words(i64 1)
  %t1845 = ptrtoint ptr %t1844 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:ns-digits" to i64), ptr %t1844
  %t1846 = or i64 %t1845, 4
  %t1847 = call i64 @rt_root(i64 %t1846)
  store i64 %t1847, ptr @"scheme.base:ns-digits"
  ret i64 17
}

define i64 @"scheme.base:__init_85"() {
entry:
  %t1875 = call ptr @rt_alloc_words(i64 1)
  %t1876 = ptrtoint ptr %t1875 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ns-digit-char" to i64), ptr %t1875
  %t1877 = or i64 %t1876, 4
  %t1878 = call i64 @rt_root(i64 %t1877)
  store i64 %t1878, ptr @"scheme.base:%ns-digit-char"
  ret i64 17
}

define i64 @"scheme.base:__init_86"() {
entry:
  %t1912 = call ptr @rt_alloc_words(i64 1)
  %t1913 = ptrtoint ptr %t1912 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:ns-digits-radix" to i64), ptr %t1912
  %t1914 = or i64 %t1913, 4
  %t1915 = call i64 @rt_root(i64 %t1914)
  store i64 %t1915, ptr @"scheme.base:ns-digits-radix"
  ret i64 17
}

define i64 @"scheme.base:__init_87"() {
entry:
  %t1948 = call ptr @rt_alloc_words(i64 1)
  %t1949 = ptrtoint ptr %t1948 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%radix-ok?" to i64), ptr %t1948
  %t1950 = or i64 %t1949, 4
  %t1951 = call i64 @rt_root(i64 %t1950)
  store i64 %t1951, ptr @"scheme.base:%radix-ok?"
  ret i64 17
}

define i64 @"scheme.base:__init_88"() {
entry:
  %t2039 = call ptr @rt_alloc_words(i64 1)
  %t2040 = ptrtoint ptr %t2039 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:number->string" to i64), ptr %t2039
  %t2041 = or i64 %t2040, 4
  %t2042 = call i64 @rt_root(i64 %t2041)
  store i64 %t2042, ptr @"scheme.base:number->string"
  ret i64 17
}

define i64 @"scheme.base:__init_89"() {
entry:
  %t2076 = call ptr @rt_alloc_words(i64 1)
  %t2077 = ptrtoint ptr %t2076 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string->number" to i64), ptr %t2076
  %t2078 = or i64 %t2077, 4
  %t2079 = call i64 @rt_root(i64 %t2078)
  store i64 %t2079, ptr @"scheme.base:string->number"
  ret i64 17
}

define i64 @"scheme.base:__init_90"() {
entry:
  %t2113 = call ptr @rt_alloc_words(i64 1)
  %t2114 = ptrtoint ptr %t2113 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error" to i64), ptr %t2113
  %t2115 = or i64 %t2114, 4
  %t2116 = call i64 @rt_root(i64 %t2115)
  store i64 %t2116, ptr @"scheme.base:error"
  ret i64 17
}

define i64 @"scheme.base:__init_91"() {
entry:
  %t2117 = call i64 @rt_root(i64 2)
  store i64 %t2117, ptr @"scheme.base:*winds*"
  ret i64 17
}

define i64 @"scheme.base:__init_92"() {
entry:
  %t2118 = call i64 @rt_root(i64 2)
  store i64 %t2118, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define i64 @"scheme.base:__init_93"() {
entry:
  %t2143 = call ptr @rt_alloc_words(i64 1)
  %t2144 = ptrtoint ptr %t2143 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%unwind-to" to i64), ptr %t2143
  %t2145 = or i64 %t2144, 4
  %t2146 = call i64 @rt_root(i64 %t2145)
  store i64 %t2146, ptr @"scheme.base:%unwind-to"
  ret i64 17
}

define i64 @"scheme.base:__init_94"() {
entry:
  %t2170 = call ptr @rt_alloc_words(i64 1)
  %t2171 = ptrtoint ptr %t2170 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:dynamic-wind" to i64), ptr %t2170
  %t2172 = or i64 %t2171, 4
  %t2173 = call i64 @rt_root(i64 %t2172)
  store i64 %t2173, ptr @"scheme.base:dynamic-wind"
  ret i64 17
}

define i64 @"scheme.base:__init_95"() {
entry:
  %t2234 = call ptr @rt_alloc_words(i64 1)
  %t2235 = ptrtoint ptr %t2234 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-current-continuation" to i64), ptr %t2234
  %t2236 = or i64 %t2235, 4
  %t2237 = call i64 @rt_root(i64 %t2236)
  store i64 %t2237, ptr @"scheme.base:call-with-current-continuation"
  ret i64 17
}

define i64 @"scheme.base:__init_96"() {
entry:
  %t2245 = call ptr @rt_alloc_words(i64 1)
  %t2246 = ptrtoint ptr %t2245 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call/cc" to i64), ptr %t2245
  %t2247 = or i64 %t2246, 4
  %t2248 = call i64 @rt_root(i64 %t2247)
  store i64 %t2248, ptr @"scheme.base:call/cc"
  ret i64 17
}

define i64 @"scheme.base:__init_97"() {
entry:
  %t2283 = call ptr @rt_alloc_words(i64 1)
  %t2284 = ptrtoint ptr %t2283 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-exception-handler" to i64), ptr %t2283
  %t2285 = or i64 %t2284, 4
  %t2286 = call i64 @rt_root(i64 %t2285)
  store i64 %t2286, ptr @"scheme.base:with-exception-handler"
  ret i64 17
}

define i64 @"scheme.base:__init_98"() {
entry:
  %t2305 = call ptr @rt_alloc_words(i64 1)
  %t2306 = ptrtoint ptr %t2305 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:raise" to i64), ptr %t2305
  %t2307 = or i64 %t2306, 4
  %t2308 = call i64 @rt_root(i64 %t2307)
  store i64 %t2308, ptr @"scheme.base:raise"
  ret i64 17
}

define i64 @"scheme.base:__init_99"() {
entry:
  %t2311 = call ptr @rt_alloc_words(i64 1)
  %t2312 = ptrtoint ptr %t2311 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object?" to i64), ptr %t2311
  %t2313 = or i64 %t2312, 4
  %t2314 = call i64 @rt_root(i64 %t2313)
  store i64 %t2314, ptr @"scheme.base:error-object?"
  ret i64 17
}

define i64 @"scheme.base:__init_100"() {
entry:
  %t2317 = call ptr @rt_alloc_words(i64 1)
  %t2318 = ptrtoint ptr %t2317 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-message" to i64), ptr %t2317
  %t2319 = or i64 %t2318, 4
  %t2320 = call i64 @rt_root(i64 %t2319)
  store i64 %t2320, ptr @"scheme.base:error-object-message"
  ret i64 17
}

define i64 @"scheme.base:__init_101"() {
entry:
  %t2323 = call ptr @rt_alloc_words(i64 1)
  %t2324 = ptrtoint ptr %t2323 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-irritants" to i64), ptr %t2323
  %t2325 = or i64 %t2324, 4
  %t2326 = call i64 @rt_root(i64 %t2325)
  store i64 %t2326, ptr @"scheme.base:error-object-irritants"
  ret i64 17
}

define i64 @"scheme.base:__init_102"() {
entry:
  %t2408 = call ptr @rt_alloc_words(i64 1)
  %t2409 = ptrtoint ptr %t2408 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-parameter" to i64), ptr %t2408
  %t2410 = or i64 %t2409, 4
  %t2411 = call i64 @rt_root(i64 %t2410)
  store i64 %t2411, ptr @"scheme.base:make-parameter"
  ret i64 17
}

define i64 @"scheme.base:__init_103"() {
entry:
  %t2492 = call ptr @rt_alloc_words(i64 1)
  %t2493 = ptrtoint ptr %t2492 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-parameters" to i64), ptr %t2492
  %t2494 = or i64 %t2493, 4
  %t2495 = call i64 @rt_root(i64 %t2494)
  store i64 %t2495, ptr @"scheme.base:with-parameters"
  ret i64 17
}

define i64 @"scheme.base:__init_104"() {
entry:
  %t2533 = call ptr @rt_alloc_words(i64 1)
  %t2534 = ptrtoint ptr %t2533 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->vector" to i64), ptr %t2533
  %t2535 = or i64 %t2534, 4
  %t2536 = call i64 @rt_root(i64 %t2535)
  store i64 %t2536, ptr @"scheme.base:list->vector"
  ret i64 17
}

define i64 @"scheme.base:__init_105"() {
entry:
  %t2554 = call ptr @rt_alloc_words(i64 1)
  %t2555 = ptrtoint ptr %t2554 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector" to i64), ptr %t2554
  %t2556 = or i64 %t2555, 4
  %t2557 = call i64 @rt_root(i64 %t2556)
  store i64 %t2557, ptr @"scheme.base:vector"
  ret i64 17
}

define i64 @"scheme.base:__init_106"() {
entry:
  %t2595 = call ptr @rt_alloc_words(i64 1)
  %t2596 = ptrtoint ptr %t2595 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->bytevector" to i64), ptr %t2595
  %t2597 = or i64 %t2596, 4
  %t2598 = call i64 @rt_root(i64 %t2597)
  store i64 %t2598, ptr @"scheme.base:list->bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_107"() {
entry:
  %t2616 = call ptr @rt_alloc_words(i64 1)
  %t2617 = ptrtoint ptr %t2616 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector" to i64), ptr %t2616
  %t2618 = or i64 %t2617, 4
  %t2619 = call i64 @rt_root(i64 %t2618)
  store i64 %t2619, ptr @"scheme.base:bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_108"() {
entry:
  %t2624 = call ptr @rt_alloc_words(i64 1)
  %t2625 = ptrtoint ptr %t2624 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rng-start" to i64), ptr %t2624
  %t2626 = or i64 %t2625, 4
  %t2627 = call i64 @rt_root(i64 %t2626)
  store i64 %t2627, ptr @"scheme.base:rng-start"
  ret i64 17
}

define i64 @"scheme.base:__init_109"() {
entry:
  %t2637 = call ptr @rt_alloc_words(i64 1)
  %t2638 = ptrtoint ptr %t2637 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rng-end" to i64), ptr %t2637
  %t2639 = or i64 %t2638, 4
  %t2640 = call i64 @rt_root(i64 %t2639)
  store i64 %t2640, ptr @"scheme.base:rng-end"
  ret i64 17
}

define i64 @"scheme.base:__init_110"() {
entry:
  %t2702 = call ptr @rt_alloc_words(i64 1)
  %t2703 = ptrtoint ptr %t2702 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rng-check" to i64), ptr %t2702
  %t2704 = or i64 %t2703, 4
  %t2705 = call i64 @rt_root(i64 %t2704)
  store i64 %t2705, ptr @"scheme.base:rng-check"
  ret i64 17
}

define i64 @"scheme.base:__init_111"() {
entry:
  %t2721 = call ptr @rt_alloc_words(i64 1)
  %t2722 = ptrtoint ptr %t2721 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:assv" to i64), ptr %t2721
  %t2723 = or i64 %t2722, 4
  %t2724 = call i64 @rt_root(i64 %t2723)
  store i64 %t2724, ptr @"scheme.base:assv"
  ret i64 17
}

define i64 @"scheme.base:__init_112"() {
entry:
  %t2737 = call ptr @rt_alloc_words(i64 1)
  %t2738 = ptrtoint ptr %t2737 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-copy" to i64), ptr %t2737
  %t2739 = or i64 %t2738, 4
  %t2740 = call i64 @rt_root(i64 %t2739)
  store i64 %t2740, ptr @"scheme.base:list-copy"
  ret i64 17
}

define i64 @"scheme.base:__init_113"() {
entry:
  %t2759 = call ptr @rt_alloc_words(i64 1)
  %t2760 = ptrtoint ptr %t2759 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:boolean=?" to i64), ptr %t2759
  %t2761 = or i64 %t2760, 4
  %t2762 = call i64 @rt_root(i64 %t2761)
  store i64 %t2762, ptr @"scheme.base:boolean=?"
  ret i64 17
}

define i64 @"scheme.base:__init_114"() {
entry:
  %t2781 = call ptr @rt_alloc_words(i64 1)
  %t2782 = ptrtoint ptr %t2781 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:symbol=?" to i64), ptr %t2781
  %t2783 = or i64 %t2782, 4
  %t2784 = call i64 @rt_root(i64 %t2783)
  store i64 %t2784, ptr @"scheme.base:symbol=?"
  ret i64 17
}

define i64 @"scheme.base:__init_115"() {
entry:
  %t2799 = call ptr @rt_alloc_words(i64 1)
  %t2800 = ptrtoint ptr %t2799 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:eqv-chain?" to i64), ptr %t2799
  %t2801 = or i64 %t2800, 4
  %t2802 = call i64 @rt_root(i64 %t2801)
  store i64 %t2802, ptr @"scheme.base:eqv-chain?"
  ret i64 17
}

define i64 @"scheme.base:__init_116"() {
entry:
  %t2902 = call ptr @rt_alloc_words(i64 1)
  %t2903 = ptrtoint ptr %t2902 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-cmp" to i64), ptr %t2902
  %t2904 = or i64 %t2903, 4
  %t2905 = call i64 @rt_root(i64 %t2904)
  store i64 %t2905, ptr @"scheme.base:str-cmp"
  ret i64 17
}

define i64 @"scheme.base:__init_117"() {
entry:
  %t2924 = call ptr @rt_alloc_words(i64 1)
  %t2925 = ptrtoint ptr %t2924 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-chain?" to i64), ptr %t2924
  %t2926 = or i64 %t2925, 4
  %t2927 = call i64 @rt_root(i64 %t2926)
  store i64 %t2927, ptr @"scheme.base:str-chain?"
  ret i64 17
}

define i64 @"scheme.base:__init_118"() {
entry:
  %t2963 = call ptr @rt_alloc_words(i64 1)
  %t2964 = ptrtoint ptr %t2963 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string<?" to i64), ptr %t2963
  %t2965 = or i64 %t2964, 4
  %t2966 = call i64 @rt_root(i64 %t2965)
  store i64 %t2966, ptr @"scheme.base:string<?"
  ret i64 17
}

define i64 @"scheme.base:__init_119"() {
entry:
  %t3002 = call ptr @rt_alloc_words(i64 1)
  %t3003 = ptrtoint ptr %t3002 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string>?" to i64), ptr %t3002
  %t3004 = or i64 %t3003, 4
  %t3005 = call i64 @rt_root(i64 %t3004)
  store i64 %t3005, ptr @"scheme.base:string>?"
  ret i64 17
}

define i64 @"scheme.base:__init_120"() {
entry:
  %t3042 = call ptr @rt_alloc_words(i64 1)
  %t3043 = ptrtoint ptr %t3042 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string<=?" to i64), ptr %t3042
  %t3044 = or i64 %t3043, 4
  %t3045 = call i64 @rt_root(i64 %t3044)
  store i64 %t3045, ptr @"scheme.base:string<=?"
  ret i64 17
}

define i64 @"scheme.base:__init_121"() {
entry:
  %t3082 = call ptr @rt_alloc_words(i64 1)
  %t3083 = ptrtoint ptr %t3082 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string>=?" to i64), ptr %t3082
  %t3084 = or i64 %t3083, 4
  %t3085 = call i64 @rt_root(i64 %t3084)
  store i64 %t3085, ptr @"scheme.base:string>=?"
  ret i64 17
}

define i64 @"scheme.base:__init_122"() {
entry:
  %t3160 = call ptr @rt_alloc_words(i64 1)
  %t3161 = ptrtoint ptr %t3160 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector->list" to i64), ptr %t3160
  %t3162 = or i64 %t3161, 4
  %t3163 = call i64 @rt_root(i64 %t3162)
  store i64 %t3163, ptr @"scheme.base:vector->list"
  ret i64 17
}

define i64 @"scheme.base:__init_123"() {
entry:
  %t3261 = call ptr @rt_alloc_words(i64 1)
  %t3262 = ptrtoint ptr %t3261 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-copy" to i64), ptr %t3261
  %t3263 = or i64 %t3262, 4
  %t3264 = call i64 @rt_root(i64 %t3263)
  store i64 %t3264, ptr @"scheme.base:vector-copy"
  ret i64 17
}

define i64 @"scheme.base:__init_124"() {
entry:
  %t3387 = call ptr @rt_alloc_words(i64 1)
  %t3388 = ptrtoint ptr %t3387 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-append" to i64), ptr %t3387
  %t3389 = or i64 %t3388, 4
  %t3390 = call i64 @rt_root(i64 %t3389)
  store i64 %t3390, ptr @"scheme.base:vector-append"
  ret i64 17
}

define i64 @"scheme.base:__init_125"() {
entry:
  %t3411 = call ptr @rt_alloc_words(i64 1)
  %t3412 = ptrtoint ptr %t3411 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vec-total" to i64), ptr %t3411
  %t3413 = or i64 %t3412, 4
  %t3414 = call i64 @rt_root(i64 %t3413)
  store i64 %t3414, ptr @"scheme.base:vec-total"
  ret i64 17
}

define i64 @"scheme.base:__init_126"() {
entry:
  %t3491 = call ptr @rt_alloc_words(i64 1)
  %t3492 = ptrtoint ptr %t3491 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-fill!" to i64), ptr %t3491
  %t3493 = or i64 %t3492, 4
  %t3494 = call i64 @rt_root(i64 %t3493)
  store i64 %t3494, ptr @"scheme.base:vector-fill!"
  ret i64 17
}

define i64 @"scheme.base:__init_127"() {
entry:
  %t3725 = call ptr @rt_alloc_words(i64 1)
  %t3726 = ptrtoint ptr %t3725 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-copy!" to i64), ptr %t3725
  %t3727 = or i64 %t3726, 4
  %t3728 = call i64 @rt_root(i64 %t3727)
  store i64 %t3728, ptr @"scheme.base:vector-copy!"
  ret i64 17
}

define i64 @"scheme.base:__init_128"() {
entry:
  %t3887 = call ptr @rt_alloc_words(i64 1)
  %t3888 = ptrtoint ptr %t3887 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-map" to i64), ptr %t3887
  %t3889 = or i64 %t3888, 4
  %t3890 = call i64 @rt_root(i64 %t3889)
  store i64 %t3890, ptr @"scheme.base:vector-map"
  ret i64 17
}

define i64 @"scheme.base:__init_129"() {
entry:
  %t4039 = call ptr @rt_alloc_words(i64 1)
  %t4040 = ptrtoint ptr %t4039 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-for-each" to i64), ptr %t4039
  %t4041 = or i64 %t4040, 4
  %t4042 = call i64 @rt_root(i64 %t4041)
  store i64 %t4042, ptr @"scheme.base:vector-for-each"
  ret i64 17
}

define i64 @"scheme.base:__init_130"() {
entry:
  %t4066 = call ptr @rt_alloc_words(i64 1)
  %t4067 = ptrtoint ptr %t4066 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vec-min-len" to i64), ptr %t4066
  %t4068 = or i64 %t4067, 4
  %t4069 = call i64 @rt_root(i64 %t4068)
  store i64 %t4069, ptr @"scheme.base:vec-min-len"
  ret i64 17
}

define i64 @"scheme.base:__init_131"() {
entry:
  %t4083 = call ptr @rt_alloc_words(i64 1)
  %t4084 = ptrtoint ptr %t4083 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vec-nth" to i64), ptr %t4083
  %t4085 = or i64 %t4084, 4
  %t4086 = call i64 @rt_root(i64 %t4085)
  store i64 %t4086, ptr @"scheme.base:vec-nth"
  ret i64 17
}

define i64 @"scheme.base:__init_132"() {
entry:
  %t4184 = call ptr @rt_alloc_words(i64 1)
  %t4185 = ptrtoint ptr %t4184 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string->vector" to i64), ptr %t4184
  %t4186 = or i64 %t4185, 4
  %t4187 = call i64 @rt_root(i64 %t4186)
  store i64 %t4187, ptr @"scheme.base:string->vector"
  ret i64 17
}

define i64 @"scheme.base:__init_133"() {
entry:
  %t4226 = call ptr @rt_alloc_words(i64 1)
  %t4227 = ptrtoint ptr %t4226 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector->string" to i64), ptr %t4226
  %t4228 = or i64 %t4227, 4
  %t4229 = call i64 @rt_root(i64 %t4228)
  store i64 %t4229, ptr @"scheme.base:vector->string"
  ret i64 17
}

define i64 @"scheme.base:__init_134"() {
entry:
  %t4264 = call ptr @rt_alloc_words(i64 1)
  %t4265 = ptrtoint ptr %t4264 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-map" to i64), ptr %t4264
  %t4266 = or i64 %t4265, 4
  %t4267 = call i64 @rt_root(i64 %t4266)
  store i64 %t4267, ptr @"scheme.base:string-map"
  ret i64 17
}

define i64 @"scheme.base:__init_135"() {
entry:
  %t4285 = call ptr @rt_alloc_words(i64 1)
  %t4286 = ptrtoint ptr %t4285 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-map1" to i64), ptr %t4285
  %t4287 = or i64 %t4286, 4
  %t4288 = call i64 @rt_root(i64 %t4287)
  store i64 %t4288, ptr @"scheme.base:str-map1"
  ret i64 17
}

define i64 @"scheme.base:__init_136"() {
entry:
  %t4368 = call ptr @rt_alloc_words(i64 1)
  %t4369 = ptrtoint ptr %t4368 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-mapn" to i64), ptr %t4368
  %t4370 = or i64 %t4369, 4
  %t4371 = call i64 @rt_root(i64 %t4370)
  store i64 %t4371, ptr @"scheme.base:str-mapn"
  ret i64 17
}

define i64 @"scheme.base:__init_137"() {
entry:
  %t4520 = call ptr @rt_alloc_words(i64 1)
  %t4521 = ptrtoint ptr %t4520 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-for-each" to i64), ptr %t4520
  %t4522 = or i64 %t4521, 4
  %t4523 = call i64 @rt_root(i64 %t4522)
  store i64 %t4523, ptr @"scheme.base:string-for-each"
  ret i64 17
}

define i64 @"scheme.base:__init_138"() {
entry:
  %t4547 = call ptr @rt_alloc_words(i64 1)
  %t4548 = ptrtoint ptr %t4547 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-min-len" to i64), ptr %t4547
  %t4549 = or i64 %t4548, 4
  %t4550 = call i64 @rt_root(i64 %t4549)
  store i64 %t4550, ptr @"scheme.base:str-min-len"
  ret i64 17
}

define i64 @"scheme.base:__init_139"() {
entry:
  %t4564 = call ptr @rt_alloc_words(i64 1)
  %t4565 = ptrtoint ptr %t4564 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-nth" to i64), ptr %t4564
  %t4566 = or i64 %t4565, 4
  %t4567 = call i64 @rt_root(i64 %t4566)
  store i64 %t4567, ptr @"scheme.base:str-nth"
  ret i64 17
}

define i64 @"scheme.base:__init_140"() {
entry:
  %t4644 = call ptr @rt_alloc_words(i64 1)
  %t4645 = ptrtoint ptr %t4644 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-fill!" to i64), ptr %t4644
  %t4646 = or i64 %t4645, 4
  %t4647 = call i64 @rt_root(i64 %t4646)
  store i64 %t4647, ptr @"scheme.base:string-fill!"
  ret i64 17
}

define i64 @"scheme.base:__init_141"() {
entry:
  %t4878 = call ptr @rt_alloc_words(i64 1)
  %t4879 = ptrtoint ptr %t4878 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-copy!" to i64), ptr %t4878
  %t4880 = or i64 %t4879, 4
  %t4881 = call i64 @rt_root(i64 %t4880)
  store i64 %t4881, ptr @"scheme.base:string-copy!"
  ret i64 17
}

define i64 @"scheme.base:__init_142"() {
entry:
  %t4979 = call ptr @rt_alloc_words(i64 1)
  %t4980 = ptrtoint ptr %t4979 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector-copy" to i64), ptr %t4979
  %t4981 = or i64 %t4980, 4
  %t4982 = call i64 @rt_root(i64 %t4981)
  store i64 %t4982, ptr @"scheme.base:bytevector-copy"
  ret i64 17
}

define i64 @"scheme.base:__init_143"() {
entry:
  %t5213 = call ptr @rt_alloc_words(i64 1)
  %t5214 = ptrtoint ptr %t5213 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector-copy!" to i64), ptr %t5213
  %t5215 = or i64 %t5214, 4
  %t5216 = call i64 @rt_root(i64 %t5215)
  store i64 %t5216, ptr @"scheme.base:bytevector-copy!"
  ret i64 17
}

define i64 @"scheme.base:__init_144"() {
entry:
  %t5339 = call ptr @rt_alloc_words(i64 1)
  %t5340 = ptrtoint ptr %t5339 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector-append" to i64), ptr %t5339
  %t5341 = or i64 %t5340, 4
  %t5342 = call i64 @rt_root(i64 %t5341)
  store i64 %t5342, ptr @"scheme.base:bytevector-append"
  ret i64 17
}

define i64 @"scheme.base:__init_145"() {
entry:
  %t5363 = call ptr @rt_alloc_words(i64 1)
  %t5364 = ptrtoint ptr %t5363 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bv-total" to i64), ptr %t5363
  %t5365 = or i64 %t5364, 4
  %t5366 = call i64 @rt_root(i64 %t5365)
  store i64 %t5366, ptr @"scheme.base:bv-total"
  ret i64 17
}

define i64 @"scheme.base:__init_146"() {
entry:
  %t5367 = call i64 @rt_root(i64 8000000)
  store i64 %t5367, ptr @"scheme.base:rat-max-denom"
  ret i64 17
}

define i64 @"scheme.base:__init_147"() {
entry:
  %t5416 = call ptr @rt_alloc_words(i64 1)
  %t5417 = ptrtoint ptr %t5416 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rationalize" to i64), ptr %t5416
  %t5418 = or i64 %t5417, 4
  %t5419 = call i64 @rt_root(i64 %t5418)
  store i64 %t5419, ptr @"scheme.base:rationalize"
  ret i64 17
}

define i64 @"scheme.base:__init_148"() {
entry:
  %t5536 = call ptr @rt_alloc_words(i64 1)
  %t5537 = ptrtoint ptr %t5536 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-exact" to i64), ptr %t5536
  %t5538 = or i64 %t5537, 4
  %t5539 = call i64 @rt_root(i64 %t5538)
  store i64 %t5539, ptr @"scheme.base:rat-exact"
  ret i64 17
}

define i64 @"scheme.base:__init_149"() {
entry:
  %t5541 = call ptr @rt_alloc_words(i64 1)
  %t5542 = ptrtoint ptr %t5541 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-ceil" to i64), ptr %t5541
  %t5543 = or i64 %t5542, 4
  %t5544 = call i64 @rt_root(i64 %t5543)
  store i64 %t5544, ptr @"scheme.base:rat-ceil"
  ret i64 17
}

define i64 @"scheme.base:__init_150"() {
entry:
  %t5546 = call ptr @rt_alloc_words(i64 1)
  %t5547 = ptrtoint ptr %t5546 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-floor" to i64), ptr %t5546
  %t5548 = or i64 %t5547, 4
  %t5549 = call i64 @rt_root(i64 %t5548)
  store i64 %t5549, ptr @"scheme.base:rat-floor"
  ret i64 17
}

define i64 @"scheme.base:__init_151"() {
entry:
  %t5666 = call ptr @rt_alloc_words(i64 1)
  %t5667 = ptrtoint ptr %t5666 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-inexact" to i64), ptr %t5666
  %t5668 = or i64 %t5667, 4
  %t5669 = call i64 @rt_root(i64 %t5668)
  store i64 %t5669, ptr @"scheme.base:rat-inexact"
  ret i64 17
}

define i64 @"scheme.base:__init_152"() {
entry:
  %t5695 = call ptr @rt_alloc_words(i64 1)
  %t5696 = ptrtoint ptr %t5695 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-num-in" to i64), ptr %t5695
  %t5697 = or i64 %t5696, 4
  %t5698 = call i64 @rt_root(i64 %t5697)
  store i64 %t5698, ptr @"scheme.base:rat-num-in"
  ret i64 17
}

define i64 @"scheme.base:__init_153"() {
entry:
  %t5724 = call ptr @rt_alloc_words(i64 1)
  %t5725 = ptrtoint ptr %t5724 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-ceil-flo" to i64), ptr %t5724
  %t5726 = or i64 %t5725, 4
  %t5727 = call i64 @rt_root(i64 %t5726)
  store i64 %t5727, ptr @"scheme.base:rat-ceil-flo"
  ret i64 17
}

define i64 @"scheme.base:__init_154"() {
entry:
  %t5747 = call ptr @rt_alloc_words(i64 1)
  %t5748 = ptrtoint ptr %t5747 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:values" to i64), ptr %t5747
  %t5749 = or i64 %t5748, 4
  %t5750 = call i64 @rt_root(i64 %t5749)
  store i64 %t5750, ptr @"scheme.base:values"
  ret i64 17
}

define i64 @"scheme.base:__init_155"() {
entry:
  %t5792 = call ptr @rt_alloc_words(i64 1)
  %t5793 = ptrtoint ptr %t5792 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-values" to i64), ptr %t5792
  %t5794 = or i64 %t5793, 4
  %t5795 = call i64 @rt_root(i64 %t5794)
  store i64 %t5795, ptr @"scheme.base:call-with-values"
  ret i64 17
}

define i64 @"scheme.base:__init_156"() {
entry:
  %t5796 = call i64 @rt_root(i64 64)
  store i64 %t5796, ptr @"scheme.base:%ht-initial-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_157"() {
entry:
  %t5797 = call i64 @rt_root(i64 24)
  store i64 %t5797, ptr @"scheme.base:%ht-load-factor"
  ret i64 17
}

define i64 @"scheme.base:__init_158"() {
entry:
  %t5808 = call ptr @rt_alloc_words(i64 1)
  %t5809 = ptrtoint ptr %t5808 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-hash-table" to i64), ptr %t5808
  %t5810 = or i64 %t5809, 4
  %t5811 = call i64 @rt_root(i64 %t5810)
  store i64 %t5811, ptr @"scheme.base:make-hash-table"
  ret i64 17
}

define i64 @"scheme.base:__init_159"() {
entry:
  %t5814 = call ptr @rt_alloc_words(i64 1)
  %t5815 = ptrtoint ptr %t5814 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table?" to i64), ptr %t5814
  %t5816 = or i64 %t5815, 4
  %t5817 = call i64 @rt_root(i64 %t5816)
  store i64 %t5817, ptr @"scheme.base:hash-table?"
  ret i64 17
}

define i64 @"scheme.base:__init_160"() {
entry:
  %t5821 = call ptr @rt_alloc_words(i64 1)
  %t5822 = ptrtoint ptr %t5821 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-count" to i64), ptr %t5821
  %t5823 = or i64 %t5822, 4
  %t5824 = call i64 @rt_root(i64 %t5823)
  store i64 %t5824, ptr @"scheme.base:%ht-count"
  ret i64 17
}

define i64 @"scheme.base:__init_161"() {
entry:
  %t5828 = call ptr @rt_alloc_words(i64 1)
  %t5829 = ptrtoint ptr %t5828 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-buckets" to i64), ptr %t5828
  %t5830 = or i64 %t5829, 4
  %t5831 = call i64 @rt_root(i64 %t5830)
  store i64 %t5831, ptr @"scheme.base:%ht-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_162"() {
entry:
  %t5835 = call ptr @rt_alloc_words(i64 1)
  %t5836 = ptrtoint ptr %t5835 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-count!" to i64), ptr %t5835
  %t5837 = or i64 %t5836, 4
  %t5838 = call i64 @rt_root(i64 %t5837)
  store i64 %t5838, ptr @"scheme.base:%ht-set-count!"
  ret i64 17
}

define i64 @"scheme.base:__init_163"() {
entry:
  %t5842 = call ptr @rt_alloc_words(i64 1)
  %t5843 = ptrtoint ptr %t5842 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-buckets!" to i64), ptr %t5842
  %t5844 = or i64 %t5843, 4
  %t5845 = call i64 @rt_root(i64 %t5844)
  store i64 %t5845, ptr @"scheme.base:%ht-set-buckets!"
  ret i64 17
}

define i64 @"scheme.base:__init_164"() {
entry:
  %t5849 = call ptr @rt_alloc_words(i64 1)
  %t5850 = ptrtoint ptr %t5849 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-index" to i64), ptr %t5849
  %t5851 = or i64 %t5850, 4
  %t5852 = call i64 @rt_root(i64 %t5851)
  store i64 %t5852, ptr @"scheme.base:%ht-index"
  ret i64 17
}

define i64 @"scheme.base:__init_165"() {
entry:
  %t5868 = call ptr @rt_alloc_words(i64 1)
  %t5869 = ptrtoint ptr %t5868 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-assoc" to i64), ptr %t5868
  %t5870 = or i64 %t5869, 4
  %t5871 = call i64 @rt_root(i64 %t5870)
  store i64 %t5871, ptr @"scheme.base:%ht-assoc"
  ret i64 17
}

define i64 @"scheme.base:__init_166"() {
entry:
  %t5889 = call ptr @rt_alloc_words(i64 1)
  %t5890 = ptrtoint ptr %t5889 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-remove" to i64), ptr %t5889
  %t5891 = or i64 %t5890, 4
  %t5892 = call i64 @rt_root(i64 %t5891)
  store i64 %t5892, ptr @"scheme.base:%ht-remove"
  ret i64 17
}

define i64 @"scheme.base:__init_167"() {
entry:
  %t5916 = call ptr @rt_alloc_words(i64 1)
  %t5917 = ptrtoint ptr %t5916 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref/default" to i64), ptr %t5916
  %t5918 = or i64 %t5917, 4
  %t5919 = call i64 @rt_root(i64 %t5918)
  store i64 %t5919, ptr @"scheme.base:hash-table-ref/default"
  ret i64 17
}

define i64 @"scheme.base:__init_168"() {
entry:
  %t5942 = call ptr @rt_alloc_words(i64 1)
  %t5943 = ptrtoint ptr %t5942 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-contains?" to i64), ptr %t5942
  %t5944 = or i64 %t5943, 4
  %t5945 = call i64 @rt_root(i64 %t5944)
  store i64 %t5945, ptr @"scheme.base:hash-table-contains?"
  ret i64 17
}

define i64 @"scheme.base:__init_169"() {
entry:
  %t5976 = call ptr @rt_alloc_words(i64 1)
  %t5977 = ptrtoint ptr %t5976 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref" to i64), ptr %t5976
  %t5978 = or i64 %t5977, 4
  %t5979 = call i64 @rt_root(i64 %t5978)
  store i64 %t5979, ptr @"scheme.base:hash-table-ref"
  ret i64 17
}

define i64 @"scheme.base:__init_170"() {
entry:
  %t6063 = call ptr @rt_alloc_words(i64 1)
  %t6064 = ptrtoint ptr %t6063 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-set!" to i64), ptr %t6063
  %t6065 = or i64 %t6064, 4
  %t6066 = call i64 @rt_root(i64 %t6065)
  store i64 %t6066, ptr @"scheme.base:hash-table-set!"
  ret i64 17
}

define i64 @"scheme.base:__init_171"() {
entry:
  %t6116 = call ptr @rt_alloc_words(i64 1)
  %t6117 = ptrtoint ptr %t6116 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-delete!" to i64), ptr %t6116
  %t6118 = or i64 %t6117, 4
  %t6119 = call i64 @rt_root(i64 %t6118)
  store i64 %t6119, ptr @"scheme.base:hash-table-delete!"
  ret i64 17
}

define i64 @"scheme.base:__init_172"() {
entry:
  %t6223 = call ptr @rt_alloc_words(i64 1)
  %t6224 = ptrtoint ptr %t6223 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-grow!" to i64), ptr %t6223
  %t6225 = or i64 %t6224, 4
  %t6226 = call i64 @rt_root(i64 %t6225)
  store i64 %t6226, ptr @"scheme.base:%ht-grow!"
  ret i64 17
}

define i64 @"scheme.base:__init_173"() {
entry:
  %t6234 = call ptr @rt_alloc_words(i64 1)
  %t6235 = ptrtoint ptr %t6234 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-size" to i64), ptr %t6234
  %t6236 = or i64 %t6235, 4
  %t6237 = call i64 @rt_root(i64 %t6236)
  store i64 %t6237, ptr @"scheme.base:hash-table-size"
  ret i64 17
}

define i64 @"scheme.base:__init_174"() {
entry:
  %t6254 = call ptr @rt_alloc_words(i64 1)
  %t6255 = ptrtoint ptr %t6254 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-fold-buckets" to i64), ptr %t6254
  %t6256 = or i64 %t6255, 4
  %t6257 = call i64 @rt_root(i64 %t6256)
  store i64 %t6257, ptr @"scheme.base:%ht-fold-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_175"() {
entry:
  %t6305 = call ptr @rt_alloc_words(i64 1)
  %t6306 = ptrtoint ptr %t6305 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table->alist" to i64), ptr %t6305
  %t6307 = or i64 %t6306, 4
  %t6308 = call i64 @rt_root(i64 %t6307)
  store i64 %t6308, ptr @"scheme.base:hash-table->alist"
  ret i64 17
}

define i64 @"scheme.base:__init_176"() {
entry:
  %t6327 = call ptr @rt_alloc_words(i64 1)
  %t6328 = ptrtoint ptr %t6327 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-keys" to i64), ptr %t6327
  %t6329 = or i64 %t6328, 4
  %t6330 = call i64 @rt_root(i64 %t6329)
  store i64 %t6330, ptr @"scheme.base:hash-table-keys"
  ret i64 17
}

define i64 @"scheme.base:__init_177"() {
entry:
  %t6349 = call ptr @rt_alloc_words(i64 1)
  %t6350 = ptrtoint ptr %t6349 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-values" to i64), ptr %t6349
  %t6351 = or i64 %t6350, 4
  %t6352 = call i64 @rt_root(i64 %t6351)
  store i64 %t6352, ptr @"scheme.base:hash-table-values"
  ret i64 17
}

define i64 @"scheme.base:__init_178"() {
entry:
  %t6521 = call ptr @rt_alloc_words(i64 1)
  %t6522 = ptrtoint ptr %t6521 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-report" to i64), ptr %t6521
  %t6523 = or i64 %t6522, 4
  %t6524 = call i64 @rt_root(i64 %t6523)
  store i64 %t6524, ptr @"scheme.base:rd-report"
  ret i64 17
}

define i64 @"scheme.base:__init_179"() {
entry:
  %t6542 = call ptr @rt_alloc_words(i64 1)
  %t6543 = ptrtoint ptr %t6542 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-from-string" to i64), ptr %t6542
  %t6544 = or i64 %t6543, 4
  %t6545 = call i64 @rt_root(i64 %t6544)
  store i64 %t6545, ptr @"scheme.base:read-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_180"() {
entry:
  %t6553 = call ptr @rt_alloc_words(i64 1)
  %t6554 = ptrtoint ptr %t6553 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-all-from-string" to i64), ptr %t6553
  %t6555 = or i64 %t6554, 4
  %t6556 = call i64 @rt_root(i64 %t6555)
  store i64 %t6556, ptr @"scheme.base:read-all-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_181"() {
entry:
  %t6564 = call ptr @rt_alloc_words(i64 1)
  %t6565 = ptrtoint ptr %t6564 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-all-from-string-ci" to i64), ptr %t6564
  %t6566 = or i64 %t6565, 4
  %t6567 = call i64 @rt_root(i64 %t6566)
  store i64 %t6567, ptr @"scheme.base:read-all-from-string-ci"
  ret i64 17
}

define i64 @"scheme.base:__init_182"() {
entry:
  %t6664 = call ptr @rt_alloc_words(i64 1)
  %t6665 = ptrtoint ptr %t6664 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-all" to i64), ptr %t6664
  %t6666 = or i64 %t6665, 4
  %t6667 = call i64 @rt_root(i64 %t6666)
  store i64 %t6667, ptr @"scheme.base:rd-all"
  ret i64 17
}

define i64 @"scheme.base:__init_183"() {
entry:
  %t6672 = call ptr @rt_alloc_words(i64 1)
  %t6673 = ptrtoint ptr %t6672 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port?" to i64), ptr %t6672
  %t6674 = or i64 %t6673, 4
  %t6675 = call i64 @rt_root(i64 %t6674)
  store i64 %t6675, ptr @"scheme.base:port?"
  ret i64 17
}

define i64 @"scheme.base:__init_184"() {
entry:
  %t6685 = call ptr @rt_alloc_words(i64 1)
  %t6686 = ptrtoint ptr %t6685 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port?" to i64), ptr %t6685
  %t6687 = or i64 %t6686, 4
  %t6688 = call i64 @rt_root(i64 %t6687)
  store i64 %t6688, ptr @"scheme.base:input-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_185"() {
entry:
  %t6699 = call ptr @rt_alloc_words(i64 1)
  %t6700 = ptrtoint ptr %t6699 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port?" to i64), ptr %t6699
  %t6701 = or i64 %t6700, 4
  %t6702 = call i64 @rt_root(i64 %t6701)
  store i64 %t6702, ptr @"scheme.base:output-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_186"() {
entry:
  %t6710 = call ptr @rt_alloc_words(i64 1)
  %t6711 = ptrtoint ptr %t6710 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:textual-port?" to i64), ptr %t6710
  %t6712 = or i64 %t6711, 4
  %t6713 = call i64 @rt_root(i64 %t6712)
  store i64 %t6713, ptr @"scheme.base:textual-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_187"() {
entry:
  %t6716 = call ptr @rt_alloc_words(i64 1)
  %t6717 = ptrtoint ptr %t6716 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port-closed?" to i64), ptr %t6716
  %t6718 = or i64 %t6717, 4
  %t6719 = call i64 @rt_root(i64 %t6718)
  store i64 %t6719, ptr @"scheme.base:port-closed?"
  ret i64 17
}

define i64 @"scheme.base:__init_188"() {
entry:
  %t6730 = call ptr @rt_alloc_words(i64 1)
  %t6731 = ptrtoint ptr %t6730 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port-open?" to i64), ptr %t6730
  %t6732 = or i64 %t6731, 4
  %t6733 = call i64 @rt_root(i64 %t6732)
  store i64 %t6733, ptr @"scheme.base:input-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_189"() {
entry:
  %t6744 = call ptr @rt_alloc_words(i64 1)
  %t6745 = ptrtoint ptr %t6744 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port-open?" to i64), ptr %t6744
  %t6746 = or i64 %t6745, 4
  %t6747 = call i64 @rt_root(i64 %t6746)
  store i64 %t6747, ptr @"scheme.base:output-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_190"() {
entry:
  %t6773 = call ptr @rt_alloc_words(i64 1)
  %t6774 = ptrtoint ptr %t6773 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-input-port" to i64), ptr %t6773
  %t6775 = or i64 %t6774, 4
  %t6776 = call i64 @rt_root(i64 %t6775)
  store i64 %t6776, ptr @"scheme.base:%check-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_191"() {
entry:
  %t6802 = call ptr @rt_alloc_words(i64 1)
  %t6803 = ptrtoint ptr %t6802 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-output-port" to i64), ptr %t6802
  %t6804 = or i64 %t6803, 4
  %t6805 = call i64 @rt_root(i64 %t6804)
  store i64 %t6805, ptr @"scheme.base:%check-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_192"() {
entry:
  %t6809 = call ptr @rt_alloc_words(i64 1)
  %t6810 = ptrtoint ptr %t6809 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-input-string" to i64), ptr %t6809
  %t6811 = or i64 %t6810, 4
  %t6812 = call i64 @rt_root(i64 %t6811)
  store i64 %t6812, ptr @"scheme.base:open-input-string"
  ret i64 17
}

define i64 @"scheme.base:__init_193"() {
entry:
  %t6833 = call ptr @rt_alloc_words(i64 1)
  %t6834 = ptrtoint ptr %t6833 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%port-at-eof?" to i64), ptr %t6833
  %t6835 = or i64 %t6834, 4
  %t6836 = call i64 @rt_root(i64 %t6835)
  store i64 %t6836, ptr @"scheme.base:%port-at-eof?"
  ret i64 17
}

define i64 @"scheme.base:__init_194"() {
entry:
  %t6866 = call ptr @rt_alloc_words(i64 1)
  %t6867 = ptrtoint ptr %t6866 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-char" to i64), ptr %t6866
  %t6868 = or i64 %t6867, 4
  %t6869 = call i64 @rt_root(i64 %t6868)
  store i64 %t6869, ptr @"scheme.base:read-char"
  ret i64 17
}

define i64 @"scheme.base:__init_195"() {
entry:
  %t6890 = call ptr @rt_alloc_words(i64 1)
  %t6891 = ptrtoint ptr %t6890 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:peek-char" to i64), ptr %t6890
  %t6892 = or i64 %t6891, 4
  %t6893 = call i64 @rt_root(i64 %t6892)
  store i64 %t6893, ptr @"scheme.base:peek-char"
  ret i64 17
}

define i64 @"scheme.base:__init_196"() {
entry:
  %t7011 = call ptr @rt_alloc_words(i64 1)
  %t7012 = ptrtoint ptr %t7011 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-line" to i64), ptr %t7011
  %t7013 = or i64 %t7012, 4
  %t7014 = call i64 @rt_root(i64 %t7013)
  store i64 %t7014, ptr @"scheme.base:read-line"
  ret i64 17
}

define i64 @"scheme.base:__init_197"() {
entry:
  %t7062 = call ptr @rt_alloc_words(i64 1)
  %t7063 = ptrtoint ptr %t7062 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-string" to i64), ptr %t7062
  %t7064 = or i64 %t7063, 4
  %t7065 = call i64 @rt_root(i64 %t7064)
  store i64 %t7065, ptr @"scheme.base:read-string"
  ret i64 17
}

define i64 @"scheme.base:__init_198"() {
entry:
  %t7079 = call ptr @rt_alloc_words(i64 1)
  %t7080 = ptrtoint ptr %t7079 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-output-string" to i64), ptr %t7079
  %t7081 = or i64 %t7080, 4
  %t7082 = call i64 @rt_root(i64 %t7081)
  store i64 %t7082, ptr @"scheme.base:open-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_199"() {
entry:
  %t7113 = call ptr @rt_alloc_words(i64 1)
  %t7114 = ptrtoint ptr %t7113 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:get-output-string" to i64), ptr %t7113
  %t7115 = or i64 %t7114, 4
  %t7116 = call i64 @rt_root(i64 %t7115)
  store i64 %t7116, ptr @"scheme.base:get-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_200"() {
entry:
  %t7127 = call ptr @rt_alloc_words(i64 1)
  %t7128 = ptrtoint ptr %t7127 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:flush-output-port" to i64), ptr %t7127
  %t7129 = or i64 %t7128, 4
  %t7130 = call i64 @rt_root(i64 %t7129)
  store i64 %t7130, ptr @"scheme.base:flush-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_201"() {
entry:
  %t7159 = call ptr @rt_alloc_words(i64 1)
  %t7160 = ptrtoint ptr %t7159 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-port" to i64), ptr %t7159
  %t7161 = or i64 %t7160, 4
  %t7162 = call i64 @rt_root(i64 %t7161)
  store i64 %t7162, ptr @"scheme.base:close-port"
  ret i64 17
}

define i64 @"scheme.base:__init_202"() {
entry:
  %t7185 = call ptr @rt_alloc_words(i64 1)
  %t7186 = ptrtoint ptr %t7185 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-input-port" to i64), ptr %t7185
  %t7187 = or i64 %t7186, 4
  %t7188 = call i64 @rt_root(i64 %t7187)
  store i64 %t7188, ptr @"scheme.base:close-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_203"() {
entry:
  %t7211 = call ptr @rt_alloc_words(i64 1)
  %t7212 = ptrtoint ptr %t7211 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-output-port" to i64), ptr %t7211
  %t7213 = or i64 %t7212, 4
  %t7214 = call i64 @rt_root(i64 %t7213)
  store i64 %t7214, ptr @"scheme.base:close-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_204"() {
entry:
  %t7215 = call i64 @rt_root(i64 1)
  store i64 %t7215, ptr @"scheme.base:%stdout-port"
  ret i64 17
}

define i64 @"scheme.base:__init_205"() {
entry:
  %t7216 = call i64 @rt_root(i64 1)
  store i64 %t7216, ptr @"scheme.base:%stderr-port"
  ret i64 17
}

define i64 @"scheme.base:__init_206"() {
entry:
  %t7217 = call i64 @rt_root(i64 1)
  store i64 %t7217, ptr @"scheme.base:%stdin-port"
  ret i64 17
}

define i64 @"scheme.base:__init_207"() {
entry:
  %t7245 = call ptr @rt_alloc_words(i64 1)
  %t7246 = ptrtoint ptr %t7245 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-output-port" to i64), ptr %t7245
  %t7247 = or i64 %t7246, 4
  %t7248 = call i64 @rt_root(i64 %t7247)
  store i64 %t7248, ptr @"scheme.base:current-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_208"() {
entry:
  %t7273 = call ptr @rt_alloc_words(i64 1)
  %t7274 = ptrtoint ptr %t7273 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-error-port" to i64), ptr %t7273
  %t7275 = or i64 %t7274, 4
  %t7276 = call i64 @rt_root(i64 %t7275)
  store i64 %t7276, ptr @"scheme.base:current-error-port"
  ret i64 17
}

define i64 @"scheme.base:__init_209"() {
entry:
  %t7301 = call ptr @rt_alloc_words(i64 1)
  %t7302 = ptrtoint ptr %t7301 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-input-port" to i64), ptr %t7301
  %t7303 = or i64 %t7302, 4
  %t7304 = call i64 @rt_root(i64 %t7303)
  store i64 %t7304, ptr @"scheme.base:current-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_210"() {
entry:
  %t7351 = call ptr @rt_alloc_words(i64 1)
  %t7352 = ptrtoint ptr %t7351 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-port" to i64), ptr %t7351
  %t7353 = or i64 %t7352, 4
  %t7354 = call i64 @rt_root(i64 %t7353)
  store i64 %t7354, ptr @"scheme.base:call-with-port"
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

