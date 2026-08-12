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
  %t366 = and i64 %t365, -8
  %t367 = inttoptr i64 %t366 to ptr
  %t368 = load i64, ptr %t367
  %t369 = inttoptr i64 %t368 to ptr
  %t370 = musttail call fastcc i64 %t369(i64 %t365, i64 2, i64 %a0, i64 %t364, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t370
else79:
  %t371 = call i64 @rt_car(i64 %t356)
  %t372 = load i64, ptr @"scheme.base:member-by"
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
  %t425 = and i64 %t424, -8
  %t426 = inttoptr i64 %t425 to ptr
  %t427 = load i64, ptr %t426
  %t428 = inttoptr i64 %t427 to ptr
  %t429 = musttail call fastcc i64 %t428(i64 %t424, i64 2, i64 %a0, i64 %t423, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t429
else93:
  %t430 = call i64 @rt_car(i64 %t413)
  %t431 = load i64, ptr @"scheme.base:assoc-by"
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
  %t498 = and i64 %a0, -8
  %t499 = inttoptr i64 %t498 to ptr
  %t500 = load i64, ptr %t499
  %t501 = inttoptr i64 %t500 to ptr
  %t502 = call fastcc i64%t501(i64 %a0, i64 2, i64 %a1, i64 %t497, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t503 = call i64 @rt_cdr(i64 %a2)
  %t504 = load i64, ptr @"scheme.base:fold-left"
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
  %t520 = and i64 %t519, -8
  %t521 = inttoptr i64 %t520 to ptr
  %t522 = load i64, ptr %t521
  %t523 = inttoptr i64 %t522 to ptr
  %t524 = call fastcc i64%t523(i64 %t519, i64 3, i64 %a0, i64 %a1, i64 %t518, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
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
  %t539 = and i64 %a0, -8
  %t540 = inttoptr i64 %t539 to ptr
  %t541 = load i64, ptr %t540
  %t542 = inttoptr i64 %t541 to ptr
  %t543 = call fastcc i64%t542(i64 %a0, i64 1, i64 %t538, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t544 = call i64 @rt_cdr(i64 %a1)
  %t545 = load i64, ptr @"scheme.base:%for-each1"
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
  %t572 = and i64 %t571, -8
  %t573 = inttoptr i64 %t572 to ptr
  %t574 = load i64, ptr %t573
  %t575 = inttoptr i64 %t574 to ptr
  %t576 = call fastcc i64%t575(i64 %t571, i64 2, i64 %t570, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
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
  %t608 = and i64 %t607, -8
  %t609 = inttoptr i64 %t608 to ptr
  %t610 = load i64, ptr %t609
  %t611 = inttoptr i64 %t610 to ptr
  %t612 = call fastcc i64%t611(i64 %t607, i64 2, i64 %t606, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t613 = load i64, ptr @"scheme.base:%for-eachn"
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
  %t637 = and i64 %t636, -8
  %t638 = inttoptr i64 %t637 to ptr
  %t639 = load i64, ptr %t638
  %t640 = inttoptr i64 %t639 to ptr
  %t641 = musttail call fastcc i64 %t640(i64 %t636, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t641
else137:
  %t642 = call i64 @rt_cons(i64 %a1, i64 %t633)
  %t643 = load i64, ptr @"scheme.base:%for-eachn"
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
  %t752 = and i64 %t751, -8
  %t753 = inttoptr i64 %t752 to ptr
  %t754 = load i64, ptr %t753
  %t755 = inttoptr i64 %t754 to ptr
  %t756 = call fastcc i64%t755(i64 %t751, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t757 = call i64 @rt_car(i64 %t756)
  ret i64 %t757
}

define fastcc i64 @"scheme.base:code:list-head"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t762 = icmp eq i64 %argc, 2
  br i1 %t762, label %argok171, label %arityerr170
arityerr170:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok171:
  %t763 = load i64, ptr @"scheme.base:zero?"
  %t764 = and i64 %t763, -8
  %t765 = inttoptr i64 %t764 to ptr
  %t766 = load i64, ptr %t765
  %t767 = inttoptr i64 %t766 to ptr
  %t768 = call fastcc i64%t767(i64 %t763, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t769 = icmp ne i64 %t768, 1
  br i1 %t769, label %then172, label %else173
then172:
  ret i64 2
else173:
  %t770 = call i64 @rt_car(i64 %a0)
  %t771 = call i64 @rt_cdr(i64 %a0)
  %t772 = or i64 %a1, 8
  %t773 = and i64 %t772, 7
  %t774 = icmp eq i64 %t773, 0
  br i1 %t774, label %fixfast174, label %fixslow175
fixfast174:
  %t775 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a1, i64 8)
  %t776 = extractvalue {i64, i1} %t775, 0
  %t777 = extractvalue {i64, i1} %t775, 1
  br i1 %t777, label %fixslow175, label %fixmerge176
fixslow175:
  %t778 = call i64 @rt_sub(i64 %a1, i64 8)
  br label %fixmerge176
fixmerge176:
  %t779 = phi i64 [ %t776, %fixfast174 ], [ %t778, %fixslow175 ]
  %t780 = load i64, ptr @"scheme.base:list-head"
  %t781 = and i64 %t780, -8
  %t782 = inttoptr i64 %t781 to ptr
  %t783 = load i64, ptr %t782
  %t784 = inttoptr i64 %t783 to ptr
  %t785 = call fastcc i64%t784(i64 %t780, i64 2, i64 %t771, i64 %t779, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t786 = call i64 @rt_cons(i64 %t770, i64 %t785)
  ret i64 %t786
}

define fastcc i64 @"scheme.base:code:make-list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t791 = icmp eq i64 %argc, 2
  br i1 %t791, label %argok178, label %arityerr177
arityerr177:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok178:
  %t792 = load i64, ptr @"scheme.base:zero?"
  %t793 = and i64 %t792, -8
  %t794 = inttoptr i64 %t793 to ptr
  %t795 = load i64, ptr %t794
  %t796 = inttoptr i64 %t795 to ptr
  %t797 = call fastcc i64%t796(i64 %t792, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t798 = icmp ne i64 %t797, 1
  br i1 %t798, label %then179, label %else180
then179:
  ret i64 2
else180:
  %t799 = or i64 %a0, 8
  %t800 = and i64 %t799, 7
  %t801 = icmp eq i64 %t800, 0
  br i1 %t801, label %fixfast181, label %fixslow182
fixfast181:
  %t802 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t803 = extractvalue {i64, i1} %t802, 0
  %t804 = extractvalue {i64, i1} %t802, 1
  br i1 %t804, label %fixslow182, label %fixmerge183
fixslow182:
  %t805 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge183
fixmerge183:
  %t806 = phi i64 [ %t803, %fixfast181 ], [ %t805, %fixslow182 ]
  %t807 = load i64, ptr @"scheme.base:make-list"
  %t808 = and i64 %t807, -8
  %t809 = inttoptr i64 %t808 to ptr
  %t810 = load i64, ptr %t809
  %t811 = inttoptr i64 %t810 to ptr
  %t812 = call fastcc i64%t811(i64 %t807, i64 2, i64 %t806, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t813 = call i64 @rt_cons(i64 %a1, i64 %t812)
  ret i64 %t813
}

define fastcc i64 @"scheme.base:code_146"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t818 = icmp eq i64 %argc, 2
  br i1 %t818, label %argok185, label %arityerr184
arityerr184:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok185:
  %t819 = and i64 %self, -8
  %t820 = inttoptr i64 %t819 to ptr
  %t821 = getelementptr i64, ptr %t820, i64 1
  %t822 = load i64, ptr %t821
  %t823 = or i64 %a0, %t822
  %t824 = and i64 %t823, 7
  %t825 = icmp eq i64 %t824, 0
  br i1 %t825, label %fixfast186, label %fixslow187
fixfast186:
  %t826 = icmp eq i64 %a0, %t822
  %t827 = select i1 %t826, i64 257, i64 1
  br label %fixmerge188
fixslow187:
  %t828 = call i64 @rt_num_eq(i64 %a0, i64 %t822)
  br label %fixmerge188
fixmerge188:
  %t829 = phi i64 [ %t827, %fixfast186 ], [ %t828, %fixslow187 ]
  %t830 = icmp ne i64 %t829, 1
  br i1 %t830, label %then189, label %else190
then189:
  %t831 = load i64, ptr @"scheme.base:reverse"
  %t832 = and i64 %t831, -8
  %t833 = inttoptr i64 %t832 to ptr
  %t834 = load i64, ptr %t833
  %t835 = inttoptr i64 %t834 to ptr
  %t836 = musttail call fastcc i64 %t835(i64 %t831, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t836
else190:
  %t837 = or i64 %a0, 8
  %t838 = and i64 %t837, 7
  %t839 = icmp eq i64 %t838, 0
  br i1 %t839, label %fixfast191, label %fixslow192
fixfast191:
  %t840 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t841 = extractvalue {i64, i1} %t840, 0
  %t842 = extractvalue {i64, i1} %t840, 1
  br i1 %t842, label %fixslow192, label %fixmerge193
fixslow192:
  %t843 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge193
fixmerge193:
  %t844 = phi i64 [ %t841, %fixfast191 ], [ %t843, %fixslow192 ]
  %t845 = call i64 @rt_cons(i64 %a0, i64 %a1)
  %t846 = musttail call fastcc i64 @"scheme.base:code_146"(i64 %self, i64 2, i64 %t844, i64 %t845, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t846
}

define fastcc i64 @"scheme.base:code:iota"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t847 = icmp eq i64 %argc, 1
  br i1 %t847, label %argok195, label %arityerr194
arityerr194:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok195:
  %t848 = call ptr @rt_alloc_words(i64 3)
  %t849 = ptrtoint ptr %t848 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_146" to i64), ptr %t848
  %t850 = or i64 %t849, 4
  %t851 = getelementptr i64, ptr %t848, i64 1
  store i64 %a0, ptr %t851
  %t852 = getelementptr i64, ptr %t848, i64 2
  store i64 %t850, ptr %t852
  %t853 = musttail call fastcc i64 @"scheme.base:code_146"(i64 %t850, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t853
}

define fastcc i64 @"scheme.base:code:%minmax-fold"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t858 = icmp eq i64 %argc, 4
  br i1 %t858, label %argok197, label %arityerr196
arityerr196:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok197:
  %t859 = call i64 @rt_null_p(i64 %a1)
  %t860 = icmp ne i64 %t859, 1
  br i1 %t860, label %then198, label %else199
then198:
  %t861 = icmp ne i64 %a3, 1
  br i1 %t861, label %then200, label %else201
then200:
  %t862 = call i64 @rt_exact_to_inexact(i64 %a2)
  ret i64 %t862
else201:
  ret i64 %a2
else199:
  %t863 = call i64 @rt_cdr(i64 %a1)
  %t864 = call i64 @rt_car(i64 %a1)
  %t865 = and i64 %a0, -8
  %t866 = inttoptr i64 %t865 to ptr
  %t867 = load i64, ptr %t866
  %t868 = inttoptr i64 %t867 to ptr
  %t869 = call fastcc i64%t868(i64 %a0, i64 2, i64 %a2, i64 %t864, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t870 = icmp ne i64 %a3, 1
  br i1 %t870, label %then202, label %else203
then202:
  br label %merge204
else203:
  %t871 = call i64 @rt_car(i64 %a1)
  %t872 = call i64 @rt_inexact_p(i64 %t871)
  br label %merge204
merge204:
  %t873 = phi i64 [ 257, %then202 ], [ %t872, %else203 ]
  %t874 = load i64, ptr @"scheme.base:%minmax-fold"
  %t875 = and i64 %t874, -8
  %t876 = inttoptr i64 %t875 to ptr
  %t877 = load i64, ptr %t876
  %t878 = inttoptr i64 %t877 to ptr
  %t879 = musttail call fastcc i64 %t878(i64 %t874, i64 4, i64 %a0, i64 %t863, i64 %t869, i64 %t873, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t879
}

define fastcc i64 @"scheme.base:code:%minmax"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t884 = icmp eq i64 %argc, 3
  br i1 %t884, label %argok206, label %arityerr205
arityerr205:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok206:
  %t885 = call i64 @rt_inexact_p(i64 %a1)
  %t886 = load i64, ptr @"scheme.base:%minmax-fold"
  %t887 = and i64 %t886, -8
  %t888 = inttoptr i64 %t887 to ptr
  %t889 = load i64, ptr %t888
  %t890 = inttoptr i64 %t889 to ptr
  %t891 = musttail call fastcc i64 %t890(i64 %t886, i64 4, i64 %a0, i64 %a2, i64 %a1, i64 %t885, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t891
}

define fastcc i64 @"scheme.base:code_166"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t896 = icmp eq i64 %argc, 2
  br i1 %t896, label %argok208, label %arityerr207
arityerr207:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok208:
  %t897 = or i64 %a0, %a1
  %t898 = and i64 %t897, 7
  %t899 = icmp eq i64 %t898, 0
  br i1 %t899, label %fixfast209, label %fixslow210
fixfast209:
  %t900 = icmp slt i64 %a0, %a1
  %t901 = select i1 %t900, i64 257, i64 1
  br label %fixmerge211
fixslow210:
  %t902 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge211
fixmerge211:
  %t903 = phi i64 [ %t901, %fixfast209 ], [ %t902, %fixslow210 ]
  %t904 = icmp ne i64 %t903, 1
  br i1 %t904, label %then212, label %else213
then212:
  ret i64 %a1
else213:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:max"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t905 = icmp sge i64 %argc, 1
  br i1 %t905, label %argok215, label %arityerr214
arityerr214:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok215:
  %t906 = call ptr @rt_alloc_words(i64 8)
  %t907 = getelementptr i64, ptr %t906, i64 0
  store i64 %a0, ptr %t907
  %t908 = getelementptr i64, ptr %t906, i64 1
  store i64 %a1, ptr %t908
  %t909 = getelementptr i64, ptr %t906, i64 2
  store i64 %a2, ptr %t909
  %t910 = getelementptr i64, ptr %t906, i64 3
  store i64 %a3, ptr %t910
  %t911 = getelementptr i64, ptr %t906, i64 4
  store i64 %a4, ptr %t911
  %t912 = getelementptr i64, ptr %t906, i64 5
  store i64 %a5, ptr %t912
  %t913 = getelementptr i64, ptr %t906, i64 6
  store i64 %a6, ptr %t913
  %t914 = getelementptr i64, ptr %t906, i64 7
  store i64 %a7, ptr %t914
  %t915 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t906, ptr %overflow)
  %t916 = call ptr @rt_alloc_words(i64 1)
  %t917 = ptrtoint ptr %t916 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_166" to i64), ptr %t916
  %t918 = or i64 %t917, 4
  %t919 = load i64, ptr @"scheme.base:%minmax"
  %t920 = and i64 %t919, -8
  %t921 = inttoptr i64 %t920 to ptr
  %t922 = load i64, ptr %t921
  %t923 = inttoptr i64 %t922 to ptr
  %t924 = musttail call fastcc i64 %t923(i64 %t919, i64 3, i64 %t918, i64 %a0, i64 %t915, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t924
}

define fastcc i64 @"scheme.base:code_177"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t929 = icmp eq i64 %argc, 2
  br i1 %t929, label %argok217, label %arityerr216
arityerr216:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok217:
  %t930 = or i64 %a1, %a0
  %t931 = and i64 %t930, 7
  %t932 = icmp eq i64 %t931, 0
  br i1 %t932, label %fixfast218, label %fixslow219
fixfast218:
  %t933 = icmp slt i64 %a1, %a0
  %t934 = select i1 %t933, i64 257, i64 1
  br label %fixmerge220
fixslow219:
  %t935 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge220
fixmerge220:
  %t936 = phi i64 [ %t934, %fixfast218 ], [ %t935, %fixslow219 ]
  %t937 = icmp ne i64 %t936, 1
  br i1 %t937, label %then221, label %else222
then221:
  ret i64 %a1
else222:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:min"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t938 = icmp sge i64 %argc, 1
  br i1 %t938, label %argok224, label %arityerr223
arityerr223:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok224:
  %t939 = call ptr @rt_alloc_words(i64 8)
  %t940 = getelementptr i64, ptr %t939, i64 0
  store i64 %a0, ptr %t940
  %t941 = getelementptr i64, ptr %t939, i64 1
  store i64 %a1, ptr %t941
  %t942 = getelementptr i64, ptr %t939, i64 2
  store i64 %a2, ptr %t942
  %t943 = getelementptr i64, ptr %t939, i64 3
  store i64 %a3, ptr %t943
  %t944 = getelementptr i64, ptr %t939, i64 4
  store i64 %a4, ptr %t944
  %t945 = getelementptr i64, ptr %t939, i64 5
  store i64 %a5, ptr %t945
  %t946 = getelementptr i64, ptr %t939, i64 6
  store i64 %a6, ptr %t946
  %t947 = getelementptr i64, ptr %t939, i64 7
  store i64 %a7, ptr %t947
  %t948 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t939, ptr %overflow)
  %t949 = call ptr @rt_alloc_words(i64 1)
  %t950 = ptrtoint ptr %t949 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_177" to i64), ptr %t949
  %t951 = or i64 %t950, 4
  %t952 = load i64, ptr @"scheme.base:%minmax"
  %t953 = and i64 %t952, -8
  %t954 = inttoptr i64 %t953 to ptr
  %t955 = load i64, ptr %t954
  %t956 = inttoptr i64 %t955 to ptr
  %t957 = musttail call fastcc i64 %t956(i64 %t952, i64 3, i64 %t951, i64 %a0, i64 %t948, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t957
}

define fastcc i64 @"scheme.base:code:complex?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t962 = icmp eq i64 %argc, 1
  br i1 %t962, label %argok226, label %arityerr225
arityerr225:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok226:
  %t963 = call i64 @rt_number_p(i64 %a0)
  ret i64 %t963
}

define fastcc i64 @"scheme.base:code:exact-integer?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t968 = icmp eq i64 %argc, 1
  br i1 %t968, label %argok228, label %arityerr227
arityerr227:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok228:
  %t969 = call i64 @rt_exact_p(i64 %a0)
  %t970 = icmp ne i64 %t969, 1
  br i1 %t970, label %then229, label %else230
then229:
  %t971 = call i64 @rt_integer_p(i64 %a0)
  ret i64 %t971
else230:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rational?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t976 = icmp eq i64 %argc, 1
  br i1 %t976, label %argok232, label %arityerr231
arityerr231:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok232:
  %t977 = call i64 @rt_number_p(i64 %a0)
  %t978 = icmp ne i64 %t977, 1
  br i1 %t978, label %then233, label %else234
then233:
  %t979 = call i64 @rt_finite_p(i64 %a0)
  ret i64 %t979
else234:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:positive?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t984 = icmp eq i64 %argc, 1
  br i1 %t984, label %argok236, label %arityerr235
arityerr235:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok236:
  %t985 = or i64 0, %a0
  %t986 = and i64 %t985, 7
  %t987 = icmp eq i64 %t986, 0
  br i1 %t987, label %fixfast237, label %fixslow238
fixfast237:
  %t988 = icmp slt i64 0, %a0
  %t989 = select i1 %t988, i64 257, i64 1
  br label %fixmerge239
fixslow238:
  %t990 = call i64 @rt_lt(i64 0, i64 %a0)
  br label %fixmerge239
fixmerge239:
  %t991 = phi i64 [ %t989, %fixfast237 ], [ %t990, %fixslow238 ]
  ret i64 %t991
}

define fastcc i64 @"scheme.base:code:negative?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t996 = icmp eq i64 %argc, 1
  br i1 %t996, label %argok241, label %arityerr240
arityerr240:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok241:
  %t997 = or i64 %a0, 0
  %t998 = and i64 %t997, 7
  %t999 = icmp eq i64 %t998, 0
  br i1 %t999, label %fixfast242, label %fixslow243
fixfast242:
  %t1000 = icmp slt i64 %a0, 0
  %t1001 = select i1 %t1000, i64 257, i64 1
  br label %fixmerge244
fixslow243:
  %t1002 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge244
fixmerge244:
  %t1003 = phi i64 [ %t1001, %fixfast242 ], [ %t1002, %fixslow243 ]
  ret i64 %t1003
}

define fastcc i64 @"scheme.base:code:even?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1008 = icmp eq i64 %argc, 1
  br i1 %t1008, label %argok246, label %arityerr245
arityerr245:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok246:
  %t1009 = call i64 @rt_remainder(i64 %a0, i64 16)
  %t1010 = or i64 0, %t1009
  %t1011 = and i64 %t1010, 7
  %t1012 = icmp eq i64 %t1011, 0
  br i1 %t1012, label %fixfast247, label %fixslow248
fixfast247:
  %t1013 = icmp eq i64 0, %t1009
  %t1014 = select i1 %t1013, i64 257, i64 1
  br label %fixmerge249
fixslow248:
  %t1015 = call i64 @rt_num_eq(i64 0, i64 %t1009)
  br label %fixmerge249
fixmerge249:
  %t1016 = phi i64 [ %t1014, %fixfast247 ], [ %t1015, %fixslow248 ]
  ret i64 %t1016
}

define fastcc i64 @"scheme.base:code:odd?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1021 = icmp eq i64 %argc, 1
  br i1 %t1021, label %argok251, label %arityerr250
arityerr250:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok251:
  %t1022 = call i64 @rt_remainder(i64 %a0, i64 16)
  %t1023 = or i64 0, %t1022
  %t1024 = and i64 %t1023, 7
  %t1025 = icmp eq i64 %t1024, 0
  br i1 %t1025, label %fixfast252, label %fixslow253
fixfast252:
  %t1026 = icmp eq i64 0, %t1022
  %t1027 = select i1 %t1026, i64 257, i64 1
  br label %fixmerge254
fixslow253:
  %t1028 = call i64 @rt_num_eq(i64 0, i64 %t1022)
  br label %fixmerge254
fixmerge254:
  %t1029 = phi i64 [ %t1027, %fixfast252 ], [ %t1028, %fixslow253 ]
  %t1030 = icmp ne i64 %t1029, 1
  br i1 %t1030, label %then255, label %else256
then255:
  ret i64 1
else256:
  ret i64 257
}

define fastcc i64 @"scheme.base:code:abs"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1035 = icmp eq i64 %argc, 1
  br i1 %t1035, label %argok258, label %arityerr257
arityerr257:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok258:
  %t1036 = or i64 %a0, 0
  %t1037 = and i64 %t1036, 7
  %t1038 = icmp eq i64 %t1037, 0
  br i1 %t1038, label %fixfast259, label %fixslow260
fixfast259:
  %t1039 = icmp slt i64 %a0, 0
  %t1040 = select i1 %t1039, i64 257, i64 1
  br label %fixmerge261
fixslow260:
  %t1041 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge261
fixmerge261:
  %t1042 = phi i64 [ %t1040, %fixfast259 ], [ %t1041, %fixslow260 ]
  %t1043 = icmp ne i64 %t1042, 1
  br i1 %t1043, label %then262, label %else263
then262:
  %t1044 = or i64 0, %a0
  %t1045 = and i64 %t1044, 7
  %t1046 = icmp eq i64 %t1045, 0
  br i1 %t1046, label %fixfast264, label %fixslow265
fixfast264:
  %t1047 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %a0)
  %t1048 = extractvalue {i64, i1} %t1047, 0
  %t1049 = extractvalue {i64, i1} %t1047, 1
  br i1 %t1049, label %fixslow265, label %fixmerge266
fixslow265:
  %t1050 = call i64 @rt_sub(i64 0, i64 %a0)
  br label %fixmerge266
fixmerge266:
  %t1051 = phi i64 [ %t1048, %fixfast264 ], [ %t1050, %fixslow265 ]
  ret i64 %t1051
else263:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:square"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1056 = icmp eq i64 %argc, 1
  br i1 %t1056, label %argok268, label %arityerr267
arityerr267:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok268:
  %t1057 = or i64 %a0, %a0
  %t1058 = and i64 %t1057, 7
  %t1059 = icmp eq i64 %t1058, 0
  br i1 %t1059, label %fixfast269, label %fixslow270
fixfast269:
  %t1060 = ashr i64 %a0, 3
  %t1061 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1060, i64 %a0)
  %t1062 = extractvalue {i64, i1} %t1061, 0
  %t1063 = extractvalue {i64, i1} %t1061, 1
  br i1 %t1063, label %fixslow270, label %fixmerge271
fixslow270:
  %t1064 = call i64 @rt_mul(i64 %a0, i64 %a0)
  br label %fixmerge271
fixmerge271:
  %t1065 = phi i64 [ %t1062, %fixfast269 ], [ %t1064, %fixslow270 ]
  ret i64 %t1065
}

define fastcc i64 @"scheme.base:code:%gcd2"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1070 = icmp eq i64 %argc, 2
  br i1 %t1070, label %argok273, label %arityerr272
arityerr272:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok273:
  %t1071 = or i64 %a1, 0
  %t1072 = and i64 %t1071, 7
  %t1073 = icmp eq i64 %t1072, 0
  br i1 %t1073, label %fixfast274, label %fixslow275
fixfast274:
  %t1074 = icmp eq i64 %a1, 0
  %t1075 = select i1 %t1074, i64 257, i64 1
  br label %fixmerge276
fixslow275:
  %t1076 = call i64 @rt_num_eq(i64 %a1, i64 0)
  br label %fixmerge276
fixmerge276:
  %t1077 = phi i64 [ %t1075, %fixfast274 ], [ %t1076, %fixslow275 ]
  %t1078 = icmp ne i64 %t1077, 1
  br i1 %t1078, label %then277, label %else278
then277:
  ret i64 %a0
else278:
  %t1079 = call i64 @rt_remainder(i64 %a0, i64 %a1)
  %t1080 = load i64, ptr @"scheme.base:%gcd2"
  %t1081 = and i64 %t1080, -8
  %t1082 = inttoptr i64 %t1081 to ptr
  %t1083 = load i64, ptr %t1082
  %t1084 = inttoptr i64 %t1083 to ptr
  %t1085 = musttail call fastcc i64 %t1084(i64 %t1080, i64 2, i64 %a1, i64 %t1079, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1085
}

define fastcc i64 @"scheme.base:code:%gcd-fold"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1090 = icmp eq i64 %argc, 2
  br i1 %t1090, label %argok280, label %arityerr279
arityerr279:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok280:
  %t1091 = call i64 @rt_null_p(i64 %a0)
  %t1092 = icmp ne i64 %t1091, 1
  br i1 %t1092, label %then281, label %else282
then281:
  ret i64 %a1
else282:
  %t1093 = call i64 @rt_cdr(i64 %a0)
  %t1094 = call i64 @rt_car(i64 %a0)
  %t1095 = load i64, ptr @"scheme.base:abs"
  %t1096 = and i64 %t1095, -8
  %t1097 = inttoptr i64 %t1096 to ptr
  %t1098 = load i64, ptr %t1097
  %t1099 = inttoptr i64 %t1098 to ptr
  %t1100 = call fastcc i64%t1099(i64 %t1095, i64 1, i64 %t1094, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1101 = load i64, ptr @"scheme.base:abs"
  %t1102 = and i64 %t1101, -8
  %t1103 = inttoptr i64 %t1102 to ptr
  %t1104 = load i64, ptr %t1103
  %t1105 = inttoptr i64 %t1104 to ptr
  %t1106 = call fastcc i64%t1105(i64 %t1101, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1107 = load i64, ptr @"scheme.base:%gcd2"
  %t1108 = and i64 %t1107, -8
  %t1109 = inttoptr i64 %t1108 to ptr
  %t1110 = load i64, ptr %t1109
  %t1111 = inttoptr i64 %t1110 to ptr
  %t1112 = call fastcc i64%t1111(i64 %t1107, i64 2, i64 %t1100, i64 %t1106, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1113 = load i64, ptr @"scheme.base:%gcd-fold"
  %t1114 = and i64 %t1113, -8
  %t1115 = inttoptr i64 %t1114 to ptr
  %t1116 = load i64, ptr %t1115
  %t1117 = inttoptr i64 %t1116 to ptr
  %t1118 = musttail call fastcc i64 %t1117(i64 %t1113, i64 2, i64 %t1093, i64 %t1112, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1118
}

define fastcc i64 @"scheme.base:code:%lcm-fold"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1123 = icmp eq i64 %argc, 2
  br i1 %t1123, label %argok284, label %arityerr283
arityerr283:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok284:
  %t1124 = call i64 @rt_null_p(i64 %a0)
  %t1125 = icmp ne i64 %t1124, 1
  br i1 %t1125, label %then285, label %else286
then285:
  ret i64 %a1
else286:
  %t1126 = call i64 @rt_car(i64 %a0)
  %t1127 = load i64, ptr @"scheme.base:abs"
  %t1128 = and i64 %t1127, -8
  %t1129 = inttoptr i64 %t1128 to ptr
  %t1130 = load i64, ptr %t1129
  %t1131 = inttoptr i64 %t1130 to ptr
  %t1132 = call fastcc i64%t1131(i64 %t1127, i64 1, i64 %t1126, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1133 = or i64 %t1132, 0
  %t1134 = and i64 %t1133, 7
  %t1135 = icmp eq i64 %t1134, 0
  br i1 %t1135, label %fixfast287, label %fixslow288
fixfast287:
  %t1136 = icmp eq i64 %t1132, 0
  %t1137 = select i1 %t1136, i64 257, i64 1
  br label %fixmerge289
fixslow288:
  %t1138 = call i64 @rt_num_eq(i64 %t1132, i64 0)
  br label %fixmerge289
fixmerge289:
  %t1139 = phi i64 [ %t1137, %fixfast287 ], [ %t1138, %fixslow288 ]
  %t1140 = icmp ne i64 %t1139, 1
  br i1 %t1140, label %then290, label %else291
then290:
  ret i64 0
else291:
  %t1141 = call i64 @rt_cdr(i64 %a0)
  %t1142 = or i64 %a1, %t1132
  %t1143 = and i64 %t1142, 7
  %t1144 = icmp eq i64 %t1143, 0
  br i1 %t1144, label %fixfast292, label %fixslow293
fixfast292:
  %t1145 = ashr i64 %a1, 3
  %t1146 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1145, i64 %t1132)
  %t1147 = extractvalue {i64, i1} %t1146, 0
  %t1148 = extractvalue {i64, i1} %t1146, 1
  br i1 %t1148, label %fixslow293, label %fixmerge294
fixslow293:
  %t1149 = call i64 @rt_mul(i64 %a1, i64 %t1132)
  br label %fixmerge294
fixmerge294:
  %t1150 = phi i64 [ %t1147, %fixfast292 ], [ %t1149, %fixslow293 ]
  %t1151 = load i64, ptr @"scheme.base:%gcd2"
  %t1152 = and i64 %t1151, -8
  %t1153 = inttoptr i64 %t1152 to ptr
  %t1154 = load i64, ptr %t1153
  %t1155 = inttoptr i64 %t1154 to ptr
  %t1156 = call fastcc i64%t1155(i64 %t1151, i64 2, i64 %a1, i64 %t1132, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1157 = call i64 @rt_quotient(i64 %t1150, i64 %t1156)
  %t1158 = load i64, ptr @"scheme.base:%lcm-fold"
  %t1159 = and i64 %t1158, -8
  %t1160 = inttoptr i64 %t1159 to ptr
  %t1161 = load i64, ptr %t1160
  %t1162 = inttoptr i64 %t1161 to ptr
  %t1163 = musttail call fastcc i64 %t1162(i64 %t1158, i64 2, i64 %t1141, i64 %t1157, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1163
}

define fastcc i64 @"scheme.base:code:gcd"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1168 = icmp sge i64 %argc, 0
  br i1 %t1168, label %argok296, label %arityerr295
arityerr295:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok296:
  %t1169 = call ptr @rt_alloc_words(i64 8)
  %t1170 = getelementptr i64, ptr %t1169, i64 0
  store i64 %a0, ptr %t1170
  %t1171 = getelementptr i64, ptr %t1169, i64 1
  store i64 %a1, ptr %t1171
  %t1172 = getelementptr i64, ptr %t1169, i64 2
  store i64 %a2, ptr %t1172
  %t1173 = getelementptr i64, ptr %t1169, i64 3
  store i64 %a3, ptr %t1173
  %t1174 = getelementptr i64, ptr %t1169, i64 4
  store i64 %a4, ptr %t1174
  %t1175 = getelementptr i64, ptr %t1169, i64 5
  store i64 %a5, ptr %t1175
  %t1176 = getelementptr i64, ptr %t1169, i64 6
  store i64 %a6, ptr %t1176
  %t1177 = getelementptr i64, ptr %t1169, i64 7
  store i64 %a7, ptr %t1177
  %t1178 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1169, ptr %overflow)
  %t1179 = load i64, ptr @"scheme.base:%gcd-fold"
  %t1180 = and i64 %t1179, -8
  %t1181 = inttoptr i64 %t1180 to ptr
  %t1182 = load i64, ptr %t1181
  %t1183 = inttoptr i64 %t1182 to ptr
  %t1184 = musttail call fastcc i64 %t1183(i64 %t1179, i64 2, i64 %t1178, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1184
}

define fastcc i64 @"scheme.base:code:lcm"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1189 = icmp sge i64 %argc, 0
  br i1 %t1189, label %argok298, label %arityerr297
arityerr297:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok298:
  %t1190 = call ptr @rt_alloc_words(i64 8)
  %t1191 = getelementptr i64, ptr %t1190, i64 0
  store i64 %a0, ptr %t1191
  %t1192 = getelementptr i64, ptr %t1190, i64 1
  store i64 %a1, ptr %t1192
  %t1193 = getelementptr i64, ptr %t1190, i64 2
  store i64 %a2, ptr %t1193
  %t1194 = getelementptr i64, ptr %t1190, i64 3
  store i64 %a3, ptr %t1194
  %t1195 = getelementptr i64, ptr %t1190, i64 4
  store i64 %a4, ptr %t1195
  %t1196 = getelementptr i64, ptr %t1190, i64 5
  store i64 %a5, ptr %t1196
  %t1197 = getelementptr i64, ptr %t1190, i64 6
  store i64 %a6, ptr %t1197
  %t1198 = getelementptr i64, ptr %t1190, i64 7
  store i64 %a7, ptr %t1198
  %t1199 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1190, ptr %overflow)
  %t1200 = load i64, ptr @"scheme.base:%lcm-fold"
  %t1201 = and i64 %t1200, -8
  %t1202 = inttoptr i64 %t1201 to ptr
  %t1203 = load i64, ptr %t1202
  %t1204 = inttoptr i64 %t1203 to ptr
  %t1205 = musttail call fastcc i64 %t1204(i64 %t1200, i64 2, i64 %t1199, i64 8, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1205
}

define fastcc i64 @"scheme.base:code:%expt-exact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1210 = icmp eq i64 %argc, 3
  br i1 %t1210, label %argok300, label %arityerr299
arityerr299:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok300:
  %t1211 = or i64 %a1, 0
  %t1212 = and i64 %t1211, 7
  %t1213 = icmp eq i64 %t1212, 0
  br i1 %t1213, label %fixfast301, label %fixslow302
fixfast301:
  %t1214 = icmp eq i64 %a1, 0
  %t1215 = select i1 %t1214, i64 257, i64 1
  br label %fixmerge303
fixslow302:
  %t1216 = call i64 @rt_num_eq(i64 %a1, i64 0)
  br label %fixmerge303
fixmerge303:
  %t1217 = phi i64 [ %t1215, %fixfast301 ], [ %t1216, %fixslow302 ]
  %t1218 = icmp ne i64 %t1217, 1
  br i1 %t1218, label %then304, label %else305
then304:
  ret i64 %a2
else305:
  %t1219 = or i64 %a0, %a0
  %t1220 = and i64 %t1219, 7
  %t1221 = icmp eq i64 %t1220, 0
  br i1 %t1221, label %fixfast306, label %fixslow307
fixfast306:
  %t1222 = ashr i64 %a0, 3
  %t1223 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1222, i64 %a0)
  %t1224 = extractvalue {i64, i1} %t1223, 0
  %t1225 = extractvalue {i64, i1} %t1223, 1
  br i1 %t1225, label %fixslow307, label %fixmerge308
fixslow307:
  %t1226 = call i64 @rt_mul(i64 %a0, i64 %a0)
  br label %fixmerge308
fixmerge308:
  %t1227 = phi i64 [ %t1224, %fixfast306 ], [ %t1226, %fixslow307 ]
  %t1228 = call i64 @rt_quotient(i64 %a1, i64 16)
  %t1229 = load i64, ptr @"scheme.base:odd?"
  %t1230 = and i64 %t1229, -8
  %t1231 = inttoptr i64 %t1230 to ptr
  %t1232 = load i64, ptr %t1231
  %t1233 = inttoptr i64 %t1232 to ptr
  %t1234 = call fastcc i64%t1233(i64 %t1229, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1235 = icmp ne i64 %t1234, 1
  br i1 %t1235, label %then309, label %else310
then309:
  %t1236 = or i64 %a2, %a0
  %t1237 = and i64 %t1236, 7
  %t1238 = icmp eq i64 %t1237, 0
  br i1 %t1238, label %fixfast312, label %fixslow313
fixfast312:
  %t1239 = ashr i64 %a2, 3
  %t1240 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1239, i64 %a0)
  %t1241 = extractvalue {i64, i1} %t1240, 0
  %t1242 = extractvalue {i64, i1} %t1240, 1
  br i1 %t1242, label %fixslow313, label %fixmerge314
fixslow313:
  %t1243 = call i64 @rt_mul(i64 %a2, i64 %a0)
  br label %fixmerge314
fixmerge314:
  %t1244 = phi i64 [ %t1241, %fixfast312 ], [ %t1243, %fixslow313 ]
  br label %merge311
else310:
  br label %merge311
merge311:
  %t1245 = phi i64 [ %t1244, %fixmerge314 ], [ %a2, %else310 ]
  %t1246 = load i64, ptr @"scheme.base:%expt-exact"
  %t1247 = and i64 %t1246, -8
  %t1248 = inttoptr i64 %t1247 to ptr
  %t1249 = load i64, ptr %t1248
  %t1250 = inttoptr i64 %t1249 to ptr
  %t1251 = musttail call fastcc i64 %t1250(i64 %t1246, i64 3, i64 %t1227, i64 %t1228, i64 %t1245, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1251
}

define fastcc i64 @"scheme.base:code:expt"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1256 = icmp eq i64 %argc, 2
  br i1 %t1256, label %argok316, label %arityerr315
arityerr315:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok316:
  %t1257 = call i64 @rt_exact_p(i64 %a1)
  %t1258 = icmp ne i64 %t1257, 1
  br i1 %t1258, label %then317, label %else318
then317:
  %t1259 = or i64 %a1, 0
  %t1260 = and i64 %t1259, 7
  %t1261 = icmp eq i64 %t1260, 0
  br i1 %t1261, label %fixfast319, label %fixslow320
fixfast319:
  %t1262 = icmp slt i64 %a1, 0
  %t1263 = select i1 %t1262, i64 257, i64 1
  br label %fixmerge321
fixslow320:
  %t1264 = call i64 @rt_lt(i64 %a1, i64 0)
  br label %fixmerge321
fixmerge321:
  %t1265 = phi i64 [ %t1263, %fixfast319 ], [ %t1264, %fixslow320 ]
  %t1266 = icmp ne i64 %t1265, 1
  br i1 %t1266, label %then322, label %else323
then322:
  %t1267 = call i64 @rt_pow(i64 %a0, i64 %a1)
  ret i64 %t1267
else323:
  %t1268 = call i64 @rt_exact_p(i64 %a0)
  %t1269 = icmp ne i64 %t1268, 1
  br i1 %t1269, label %then324, label %else325
then324:
  %t1270 = load i64, ptr @"scheme.base:%expt-exact"
  %t1271 = and i64 %t1270, -8
  %t1272 = inttoptr i64 %t1271 to ptr
  %t1273 = load i64, ptr %t1272
  %t1274 = inttoptr i64 %t1273 to ptr
  %t1275 = musttail call fastcc i64 %t1274(i64 %t1270, i64 3, i64 %a0, i64 %a1, i64 8, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1275
else325:
  %t1276 = call i64 @rt_flonum_lit(ptr @.flo.lit.0)
  %t1277 = load i64, ptr @"scheme.base:%expt-exact"
  %t1278 = and i64 %t1277, -8
  %t1279 = inttoptr i64 %t1278 to ptr
  %t1280 = load i64, ptr %t1279
  %t1281 = inttoptr i64 %t1280 to ptr
  %t1282 = musttail call fastcc i64 %t1281(i64 %t1277, i64 3, i64 %a0, i64 %a1, i64 %t1276, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1282
else318:
  %t1283 = call i64 @rt_pow(i64 %a0, i64 %a1)
  ret i64 %t1283
}

define fastcc i64 @"scheme.base:code:%isqrt-loop"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1288 = icmp eq i64 %argc, 2
  br i1 %t1288, label %argok327, label %arityerr326
arityerr326:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok327:
  %t1289 = call i64 @rt_quotient(i64 %a0, i64 %a1)
  %t1290 = or i64 %a1, %t1289
  %t1291 = and i64 %t1290, 7
  %t1292 = icmp eq i64 %t1291, 0
  br i1 %t1292, label %fixfast328, label %fixslow329
fixfast328:
  %t1293 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t1289)
  %t1294 = extractvalue {i64, i1} %t1293, 0
  %t1295 = extractvalue {i64, i1} %t1293, 1
  br i1 %t1295, label %fixslow329, label %fixmerge330
fixslow329:
  %t1296 = call i64 @rt_add(i64 %a1, i64 %t1289)
  br label %fixmerge330
fixmerge330:
  %t1297 = phi i64 [ %t1294, %fixfast328 ], [ %t1296, %fixslow329 ]
  %t1298 = call i64 @rt_quotient(i64 %t1297, i64 16)
  %t1299 = or i64 %t1298, %a1
  %t1300 = and i64 %t1299, 7
  %t1301 = icmp eq i64 %t1300, 0
  br i1 %t1301, label %fixfast331, label %fixslow332
fixfast331:
  %t1302 = icmp slt i64 %t1298, %a1
  %t1303 = select i1 %t1302, i64 257, i64 1
  br label %fixmerge333
fixslow332:
  %t1304 = call i64 @rt_lt(i64 %t1298, i64 %a1)
  br label %fixmerge333
fixmerge333:
  %t1305 = phi i64 [ %t1303, %fixfast331 ], [ %t1304, %fixslow332 ]
  %t1306 = icmp ne i64 %t1305, 1
  br i1 %t1306, label %then334, label %else335
then334:
  %t1307 = load i64, ptr @"scheme.base:%isqrt-loop"
  %t1308 = and i64 %t1307, -8
  %t1309 = inttoptr i64 %t1308 to ptr
  %t1310 = load i64, ptr %t1309
  %t1311 = inttoptr i64 %t1310 to ptr
  %t1312 = musttail call fastcc i64 %t1311(i64 %t1307, i64 2, i64 %a0, i64 %t1298, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1312
else335:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:%isqrt"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1317 = icmp eq i64 %argc, 1
  br i1 %t1317, label %argok337, label %arityerr336
arityerr336:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok337:
  %t1318 = or i64 %a0, 0
  %t1319 = and i64 %t1318, 7
  %t1320 = icmp eq i64 %t1319, 0
  br i1 %t1320, label %fixfast338, label %fixslow339
fixfast338:
  %t1321 = icmp eq i64 %a0, 0
  %t1322 = select i1 %t1321, i64 257, i64 1
  br label %fixmerge340
fixslow339:
  %t1323 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge340
fixmerge340:
  %t1324 = phi i64 [ %t1322, %fixfast338 ], [ %t1323, %fixslow339 ]
  %t1325 = icmp ne i64 %t1324, 1
  br i1 %t1325, label %then341, label %else342
then341:
  ret i64 0
else342:
  %t1326 = load i64, ptr @"scheme.base:%isqrt-loop"
  %t1327 = and i64 %t1326, -8
  %t1328 = inttoptr i64 %t1327 to ptr
  %t1329 = load i64, ptr %t1328
  %t1330 = inttoptr i64 %t1329 to ptr
  %t1331 = musttail call fastcc i64 %t1330(i64 %t1326, i64 2, i64 %a0, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1331
}

define fastcc i64 @"scheme.base:code:exact-integer-sqrt"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1336 = icmp eq i64 %argc, 1
  br i1 %t1336, label %argok344, label %arityerr343
arityerr343:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok344:
  %t1337 = load i64, ptr @"scheme.base:%isqrt"
  %t1338 = and i64 %t1337, -8
  %t1339 = inttoptr i64 %t1338 to ptr
  %t1340 = load i64, ptr %t1339
  %t1341 = inttoptr i64 %t1340 to ptr
  %t1342 = call fastcc i64%t1341(i64 %t1337, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1343 = or i64 %t1342, %t1342
  %t1344 = and i64 %t1343, 7
  %t1345 = icmp eq i64 %t1344, 0
  br i1 %t1345, label %fixfast345, label %fixslow346
fixfast345:
  %t1346 = ashr i64 %t1342, 3
  %t1347 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1346, i64 %t1342)
  %t1348 = extractvalue {i64, i1} %t1347, 0
  %t1349 = extractvalue {i64, i1} %t1347, 1
  br i1 %t1349, label %fixslow346, label %fixmerge347
fixslow346:
  %t1350 = call i64 @rt_mul(i64 %t1342, i64 %t1342)
  br label %fixmerge347
fixmerge347:
  %t1351 = phi i64 [ %t1348, %fixfast345 ], [ %t1350, %fixslow346 ]
  %t1352 = or i64 %a0, %t1351
  %t1353 = and i64 %t1352, 7
  %t1354 = icmp eq i64 %t1353, 0
  br i1 %t1354, label %fixfast348, label %fixslow349
fixfast348:
  %t1355 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t1351)
  %t1356 = extractvalue {i64, i1} %t1355, 0
  %t1357 = extractvalue {i64, i1} %t1355, 1
  br i1 %t1357, label %fixslow349, label %fixmerge350
fixslow349:
  %t1358 = call i64 @rt_sub(i64 %a0, i64 %t1351)
  br label %fixmerge350
fixmerge350:
  %t1359 = phi i64 [ %t1356, %fixfast348 ], [ %t1358, %fixslow349 ]
  %t1360 = load i64, ptr @"scheme.base:values"
  %t1361 = and i64 %t1360, -8
  %t1362 = inttoptr i64 %t1361 to ptr
  %t1363 = load i64, ptr %t1362
  %t1364 = inttoptr i64 %t1363 to ptr
  %t1365 = musttail call fastcc i64 %t1364(i64 %t1360, i64 2, i64 %t1342, i64 %t1359, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1365
}

define fastcc i64 @"scheme.base:code:floor"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1370 = icmp eq i64 %argc, 1
  br i1 %t1370, label %argok352, label %arityerr351
arityerr351:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok352:
  %t1371 = call i64 @rt_exact_p(i64 %a0)
  %t1372 = icmp ne i64 %t1371, 1
  br i1 %t1372, label %then353, label %else354
then353:
  ret i64 %a0
else354:
  %t1373 = call i64 @rt_flo_floor(i64 %a0)
  ret i64 %t1373
}

define fastcc i64 @"scheme.base:code:ceiling"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1378 = icmp eq i64 %argc, 1
  br i1 %t1378, label %argok356, label %arityerr355
arityerr355:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok356:
  %t1379 = call i64 @rt_exact_p(i64 %a0)
  %t1380 = icmp ne i64 %t1379, 1
  br i1 %t1380, label %then357, label %else358
then357:
  ret i64 %a0
else358:
  %t1381 = call i64 @rt_flo_ceiling(i64 %a0)
  ret i64 %t1381
}

define fastcc i64 @"scheme.base:code:truncate"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1386 = icmp eq i64 %argc, 1
  br i1 %t1386, label %argok360, label %arityerr359
arityerr359:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok360:
  %t1387 = call i64 @rt_exact_p(i64 %a0)
  %t1388 = icmp ne i64 %t1387, 1
  br i1 %t1388, label %then361, label %else362
then361:
  ret i64 %a0
else362:
  %t1389 = call i64 @rt_flo_truncate(i64 %a0)
  ret i64 %t1389
}

define fastcc i64 @"scheme.base:code:round"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1394 = icmp eq i64 %argc, 1
  br i1 %t1394, label %argok364, label %arityerr363
arityerr363:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok364:
  %t1395 = call i64 @rt_exact_p(i64 %a0)
  %t1396 = icmp ne i64 %t1395, 1
  br i1 %t1396, label %then365, label %else366
then365:
  ret i64 %a0
else366:
  %t1397 = call i64 @rt_flo_round(i64 %a0)
  ret i64 %t1397
}

define fastcc i64 @"scheme.base:code:truncate-quotient"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1402 = icmp eq i64 %argc, 2
  br i1 %t1402, label %argok368, label %arityerr367
arityerr367:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok368:
  %t1403 = call i64 @rt_quotient(i64 %a0, i64 %a1)
  ret i64 %t1403
}

define fastcc i64 @"scheme.base:code:truncate-remainder"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1408 = icmp eq i64 %argc, 2
  br i1 %t1408, label %argok370, label %arityerr369
arityerr369:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok370:
  %t1409 = call i64 @rt_remainder(i64 %a0, i64 %a1)
  ret i64 %t1409
}

define fastcc i64 @"scheme.base:code:floor-remainder"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1414 = icmp eq i64 %argc, 2
  br i1 %t1414, label %argok372, label %arityerr371
arityerr371:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok372:
  %t1415 = call i64 @rt_modulo(i64 %a0, i64 %a1)
  ret i64 %t1415
}

define fastcc i64 @"scheme.base:code:floor-quotient"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1420 = icmp eq i64 %argc, 2
  br i1 %t1420, label %argok374, label %arityerr373
arityerr373:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok374:
  %t1421 = call i64 @rt_modulo(i64 %a0, i64 %a1)
  %t1422 = or i64 %a0, %t1421
  %t1423 = and i64 %t1422, 7
  %t1424 = icmp eq i64 %t1423, 0
  br i1 %t1424, label %fixfast375, label %fixslow376
fixfast375:
  %t1425 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t1421)
  %t1426 = extractvalue {i64, i1} %t1425, 0
  %t1427 = extractvalue {i64, i1} %t1425, 1
  br i1 %t1427, label %fixslow376, label %fixmerge377
fixslow376:
  %t1428 = call i64 @rt_sub(i64 %a0, i64 %t1421)
  br label %fixmerge377
fixmerge377:
  %t1429 = phi i64 [ %t1426, %fixfast375 ], [ %t1428, %fixslow376 ]
  %t1430 = call i64 @rt_quotient(i64 %t1429, i64 %a1)
  ret i64 %t1430
}

define fastcc i64 @"scheme.base:code:truncate/"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1435 = icmp eq i64 %argc, 2
  br i1 %t1435, label %argok379, label %arityerr378
arityerr378:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok379:
  %t1436 = call i64 @rt_quotient(i64 %a0, i64 %a1)
  %t1437 = call i64 @rt_remainder(i64 %a0, i64 %a1)
  %t1438 = load i64, ptr @"scheme.base:values"
  %t1439 = and i64 %t1438, -8
  %t1440 = inttoptr i64 %t1439 to ptr
  %t1441 = load i64, ptr %t1440
  %t1442 = inttoptr i64 %t1441 to ptr
  %t1443 = musttail call fastcc i64 %t1442(i64 %t1438, i64 2, i64 %t1436, i64 %t1437, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1443
}

define fastcc i64 @"scheme.base:code:floor/"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1448 = icmp eq i64 %argc, 2
  br i1 %t1448, label %argok381, label %arityerr380
arityerr380:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok381:
  %t1449 = load i64, ptr @"scheme.base:floor-quotient"
  %t1450 = and i64 %t1449, -8
  %t1451 = inttoptr i64 %t1450 to ptr
  %t1452 = load i64, ptr %t1451
  %t1453 = inttoptr i64 %t1452 to ptr
  %t1454 = call fastcc i64%t1453(i64 %t1449, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1455 = call i64 @rt_modulo(i64 %a0, i64 %a1)
  %t1456 = load i64, ptr @"scheme.base:values"
  %t1457 = and i64 %t1456, -8
  %t1458 = inttoptr i64 %t1457 to ptr
  %t1459 = load i64, ptr %t1458
  %t1460 = inttoptr i64 %t1459 to ptr
  %t1461 = musttail call fastcc i64 %t1460(i64 %t1456, i64 2, i64 %t1454, i64 %t1455, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1461
}

define fastcc i64 @"scheme.base:code:numerator"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1466 = icmp eq i64 %argc, 1
  br i1 %t1466, label %argok383, label %arityerr382
arityerr382:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok383:
  %t1467 = call i64 @rt_integer_p(i64 %a0)
  %t1468 = icmp ne i64 %t1467, 1
  br i1 %t1468, label %then384, label %else385
then384:
  ret i64 %a0
else385:
  %t1469 = call i64 @rt_make_string(ptr @.str.lit.1, i64 25)
  %t1470 = load i64, ptr @"scheme.base:error"
  %t1471 = and i64 %t1470, -8
  %t1472 = inttoptr i64 %t1471 to ptr
  %t1473 = load i64, ptr %t1472
  %t1474 = inttoptr i64 %t1473 to ptr
  %t1475 = musttail call fastcc i64 %t1474(i64 %t1470, i64 2, i64 %t1469, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1475
}

define fastcc i64 @"scheme.base:code:denominator"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1480 = icmp eq i64 %argc, 1
  br i1 %t1480, label %argok387, label %arityerr386
arityerr386:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok387:
  %t1481 = call i64 @rt_integer_p(i64 %a0)
  %t1482 = icmp ne i64 %t1481, 1
  br i1 %t1482, label %then388, label %else389
then388:
  %t1483 = call i64 @rt_exact_p(i64 %a0)
  %t1484 = icmp ne i64 %t1483, 1
  br i1 %t1484, label %then390, label %else391
then390:
  ret i64 8
else391:
  %t1485 = call i64 @rt_flonum_lit(ptr @.flo.lit.2)
  ret i64 %t1485
else389:
  %t1486 = call i64 @rt_make_string(ptr @.str.lit.3, i64 27)
  %t1487 = load i64, ptr @"scheme.base:error"
  %t1488 = and i64 %t1487, -8
  %t1489 = inttoptr i64 %t1488 to ptr
  %t1490 = load i64, ptr %t1489
  %t1491 = inttoptr i64 %t1490 to ptr
  %t1492 = musttail call fastcc i64 %t1491(i64 %t1487, i64 2, i64 %t1486, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1492
}

define fastcc i64 @"scheme.base:code:inexact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1497 = icmp eq i64 %argc, 1
  br i1 %t1497, label %argok393, label %arityerr392
arityerr392:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok393:
  %t1498 = call i64 @rt_exact_to_inexact(i64 %a0)
  ret i64 %t1498
}

define fastcc i64 @"scheme.base:code:exact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1503 = icmp eq i64 %argc, 1
  br i1 %t1503, label %argok395, label %arityerr394
arityerr394:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok395:
  %t1504 = call i64 @rt_inexact_to_exact(i64 %a0)
  ret i64 %t1504
}

define fastcc i64 @"scheme.base:code:void"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1509 = icmp eq i64 %argc, 0
  br i1 %t1509, label %argok397, label %arityerr396
arityerr396:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok397:
  %t1510 = icmp ne i64 1, 1
  br i1 %t1510, label %then398, label %else399
then398:
  ret i64 1
else399:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1515 = icmp sge i64 %argc, 0
  br i1 %t1515, label %argok401, label %arityerr400
arityerr400:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok401:
  %t1516 = call ptr @rt_alloc_words(i64 8)
  %t1517 = getelementptr i64, ptr %t1516, i64 0
  store i64 %a0, ptr %t1517
  %t1518 = getelementptr i64, ptr %t1516, i64 1
  store i64 %a1, ptr %t1518
  %t1519 = getelementptr i64, ptr %t1516, i64 2
  store i64 %a2, ptr %t1519
  %t1520 = getelementptr i64, ptr %t1516, i64 3
  store i64 %a3, ptr %t1520
  %t1521 = getelementptr i64, ptr %t1516, i64 4
  store i64 %a4, ptr %t1521
  %t1522 = getelementptr i64, ptr %t1516, i64 5
  store i64 %a5, ptr %t1522
  %t1523 = getelementptr i64, ptr %t1516, i64 6
  store i64 %a6, ptr %t1523
  %t1524 = getelementptr i64, ptr %t1516, i64 7
  store i64 %a7, ptr %t1524
  %t1525 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1516, ptr %overflow)
  %t1526 = call i64 @rt_list_to_string(i64 %t1525)
  ret i64 %t1526
}

define fastcc i64 @"scheme.base:code:%str-concat"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1531 = icmp eq i64 %argc, 1
  br i1 %t1531, label %argok403, label %arityerr402
arityerr402:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok403:
  %t1532 = call i64 @rt_null_p(i64 %a0)
  %t1533 = icmp ne i64 %t1532, 1
  br i1 %t1533, label %then404, label %else405
then404:
  %t1534 = call i64 @rt_make_string(ptr @.str.lit.4, i64 0)
  ret i64 %t1534
else405:
  %t1535 = call i64 @rt_car(i64 %a0)
  %t1536 = call i64 @rt_cdr(i64 %a0)
  %t1537 = load i64, ptr @"scheme.base:%str-concat"
  %t1538 = and i64 %t1537, -8
  %t1539 = inttoptr i64 %t1538 to ptr
  %t1540 = load i64, ptr %t1539
  %t1541 = inttoptr i64 %t1540 to ptr
  %t1542 = call fastcc i64%t1541(i64 %t1537, i64 1, i64 %t1536, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1543 = call i64 @rt_string_append(i64 %t1535, i64 %t1542)
  ret i64 %t1543
}

define fastcc i64 @"scheme.base:code:chr-cmp"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1548 = icmp eq i64 %argc, 4
  br i1 %t1548, label %argok407, label %arityerr406
arityerr406:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok407:
  %t1549 = call i64 @rt_char_to_integer(i64 %a1)
  %t1550 = call i64 @rt_char_to_integer(i64 %a2)
  %t1551 = and i64 %a0, -8
  %t1552 = inttoptr i64 %t1551 to ptr
  %t1553 = load i64, ptr %t1552
  %t1554 = inttoptr i64 %t1553 to ptr
  %t1555 = call fastcc i64%t1554(i64 %a0, i64 2, i64 %t1549, i64 %t1550, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1556 = icmp ne i64 %t1555, 1
  br i1 %t1556, label %then408, label %else409
then408:
  %t1557 = call i64 @rt_null_p(i64 %a3)
  %t1558 = icmp ne i64 %t1557, 1
  br i1 %t1558, label %then410, label %else411
then410:
  ret i64 257
else411:
  %t1559 = call i64 @rt_car(i64 %a3)
  %t1560 = call i64 @rt_cdr(i64 %a3)
  %t1561 = load i64, ptr @"scheme.base:chr-cmp"
  %t1562 = and i64 %t1561, -8
  %t1563 = inttoptr i64 %t1562 to ptr
  %t1564 = load i64, ptr %t1563
  %t1565 = inttoptr i64 %t1564 to ptr
  %t1566 = musttail call fastcc i64 %t1565(i64 %t1561, i64 4, i64 %a0, i64 %a2, i64 %t1559, i64 %t1560, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1566
else409:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_325"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1571 = icmp eq i64 %argc, 2
  br i1 %t1571, label %argok413, label %arityerr412
arityerr412:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok413:
  %t1572 = or i64 %a0, %a1
  %t1573 = and i64 %t1572, 7
  %t1574 = icmp eq i64 %t1573, 0
  br i1 %t1574, label %fixfast414, label %fixslow415
fixfast414:
  %t1575 = icmp eq i64 %a0, %a1
  %t1576 = select i1 %t1575, i64 257, i64 1
  br label %fixmerge416
fixslow415:
  %t1577 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge416
fixmerge416:
  %t1578 = phi i64 [ %t1576, %fixfast414 ], [ %t1577, %fixslow415 ]
  ret i64 %t1578
}

define fastcc i64 @"scheme.base:code:char=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1579 = icmp sge i64 %argc, 2
  br i1 %t1579, label %argok418, label %arityerr417
arityerr417:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok418:
  %t1580 = call ptr @rt_alloc_words(i64 8)
  %t1581 = getelementptr i64, ptr %t1580, i64 0
  store i64 %a0, ptr %t1581
  %t1582 = getelementptr i64, ptr %t1580, i64 1
  store i64 %a1, ptr %t1582
  %t1583 = getelementptr i64, ptr %t1580, i64 2
  store i64 %a2, ptr %t1583
  %t1584 = getelementptr i64, ptr %t1580, i64 3
  store i64 %a3, ptr %t1584
  %t1585 = getelementptr i64, ptr %t1580, i64 4
  store i64 %a4, ptr %t1585
  %t1586 = getelementptr i64, ptr %t1580, i64 5
  store i64 %a5, ptr %t1586
  %t1587 = getelementptr i64, ptr %t1580, i64 6
  store i64 %a6, ptr %t1587
  %t1588 = getelementptr i64, ptr %t1580, i64 7
  store i64 %a7, ptr %t1588
  %t1589 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1580, ptr %overflow)
  %t1590 = call ptr @rt_alloc_words(i64 1)
  %t1591 = ptrtoint ptr %t1590 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_325" to i64), ptr %t1590
  %t1592 = or i64 %t1591, 4
  %t1593 = load i64, ptr @"scheme.base:chr-cmp"
  %t1594 = and i64 %t1593, -8
  %t1595 = inttoptr i64 %t1594 to ptr
  %t1596 = load i64, ptr %t1595
  %t1597 = inttoptr i64 %t1596 to ptr
  %t1598 = musttail call fastcc i64 %t1597(i64 %t1593, i64 4, i64 %t1592, i64 %a0, i64 %a1, i64 %t1589, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1598
}

define fastcc i64 @"scheme.base:code_337"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1603 = icmp eq i64 %argc, 2
  br i1 %t1603, label %argok420, label %arityerr419
arityerr419:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok420:
  %t1604 = or i64 %a0, %a1
  %t1605 = and i64 %t1604, 7
  %t1606 = icmp eq i64 %t1605, 0
  br i1 %t1606, label %fixfast421, label %fixslow422
fixfast421:
  %t1607 = icmp slt i64 %a0, %a1
  %t1608 = select i1 %t1607, i64 257, i64 1
  br label %fixmerge423
fixslow422:
  %t1609 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge423
fixmerge423:
  %t1610 = phi i64 [ %t1608, %fixfast421 ], [ %t1609, %fixslow422 ]
  ret i64 %t1610
}

define fastcc i64 @"scheme.base:code:char<?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1611 = icmp sge i64 %argc, 2
  br i1 %t1611, label %argok425, label %arityerr424
arityerr424:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok425:
  %t1612 = call ptr @rt_alloc_words(i64 8)
  %t1613 = getelementptr i64, ptr %t1612, i64 0
  store i64 %a0, ptr %t1613
  %t1614 = getelementptr i64, ptr %t1612, i64 1
  store i64 %a1, ptr %t1614
  %t1615 = getelementptr i64, ptr %t1612, i64 2
  store i64 %a2, ptr %t1615
  %t1616 = getelementptr i64, ptr %t1612, i64 3
  store i64 %a3, ptr %t1616
  %t1617 = getelementptr i64, ptr %t1612, i64 4
  store i64 %a4, ptr %t1617
  %t1618 = getelementptr i64, ptr %t1612, i64 5
  store i64 %a5, ptr %t1618
  %t1619 = getelementptr i64, ptr %t1612, i64 6
  store i64 %a6, ptr %t1619
  %t1620 = getelementptr i64, ptr %t1612, i64 7
  store i64 %a7, ptr %t1620
  %t1621 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1612, ptr %overflow)
  %t1622 = call ptr @rt_alloc_words(i64 1)
  %t1623 = ptrtoint ptr %t1622 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_337" to i64), ptr %t1622
  %t1624 = or i64 %t1623, 4
  %t1625 = load i64, ptr @"scheme.base:chr-cmp"
  %t1626 = and i64 %t1625, -8
  %t1627 = inttoptr i64 %t1626 to ptr
  %t1628 = load i64, ptr %t1627
  %t1629 = inttoptr i64 %t1628 to ptr
  %t1630 = musttail call fastcc i64 %t1629(i64 %t1625, i64 4, i64 %t1624, i64 %a0, i64 %a1, i64 %t1621, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1630
}

define fastcc i64 @"scheme.base:code_349"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1635 = icmp eq i64 %argc, 2
  br i1 %t1635, label %argok427, label %arityerr426
arityerr426:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok427:
  %t1636 = or i64 %a1, %a0
  %t1637 = and i64 %t1636, 7
  %t1638 = icmp eq i64 %t1637, 0
  br i1 %t1638, label %fixfast428, label %fixslow429
fixfast428:
  %t1639 = icmp slt i64 %a1, %a0
  %t1640 = select i1 %t1639, i64 257, i64 1
  br label %fixmerge430
fixslow429:
  %t1641 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge430
fixmerge430:
  %t1642 = phi i64 [ %t1640, %fixfast428 ], [ %t1641, %fixslow429 ]
  ret i64 %t1642
}

define fastcc i64 @"scheme.base:code:char>?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1643 = icmp sge i64 %argc, 2
  br i1 %t1643, label %argok432, label %arityerr431
arityerr431:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok432:
  %t1644 = call ptr @rt_alloc_words(i64 8)
  %t1645 = getelementptr i64, ptr %t1644, i64 0
  store i64 %a0, ptr %t1645
  %t1646 = getelementptr i64, ptr %t1644, i64 1
  store i64 %a1, ptr %t1646
  %t1647 = getelementptr i64, ptr %t1644, i64 2
  store i64 %a2, ptr %t1647
  %t1648 = getelementptr i64, ptr %t1644, i64 3
  store i64 %a3, ptr %t1648
  %t1649 = getelementptr i64, ptr %t1644, i64 4
  store i64 %a4, ptr %t1649
  %t1650 = getelementptr i64, ptr %t1644, i64 5
  store i64 %a5, ptr %t1650
  %t1651 = getelementptr i64, ptr %t1644, i64 6
  store i64 %a6, ptr %t1651
  %t1652 = getelementptr i64, ptr %t1644, i64 7
  store i64 %a7, ptr %t1652
  %t1653 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1644, ptr %overflow)
  %t1654 = call ptr @rt_alloc_words(i64 1)
  %t1655 = ptrtoint ptr %t1654 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_349" to i64), ptr %t1654
  %t1656 = or i64 %t1655, 4
  %t1657 = load i64, ptr @"scheme.base:chr-cmp"
  %t1658 = and i64 %t1657, -8
  %t1659 = inttoptr i64 %t1658 to ptr
  %t1660 = load i64, ptr %t1659
  %t1661 = inttoptr i64 %t1660 to ptr
  %t1662 = musttail call fastcc i64 %t1661(i64 %t1657, i64 4, i64 %t1656, i64 %a0, i64 %a1, i64 %t1653, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1662
}

define fastcc i64 @"scheme.base:code_361"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1667 = icmp eq i64 %argc, 2
  br i1 %t1667, label %argok434, label %arityerr433
arityerr433:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok434:
  %t1668 = or i64 %a0, %a1
  %t1669 = and i64 %t1668, 7
  %t1670 = icmp eq i64 %t1669, 0
  br i1 %t1670, label %fixfast435, label %fixslow436
fixfast435:
  %t1671 = icmp slt i64 %a0, %a1
  %t1672 = select i1 %t1671, i64 257, i64 1
  br label %fixmerge437
fixslow436:
  %t1673 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge437
fixmerge437:
  %t1674 = phi i64 [ %t1672, %fixfast435 ], [ %t1673, %fixslow436 ]
  %t1675 = icmp ne i64 %t1674, 1
  br i1 %t1675, label %then438, label %else439
then438:
  ret i64 257
else439:
  %t1676 = or i64 %a0, %a1
  %t1677 = and i64 %t1676, 7
  %t1678 = icmp eq i64 %t1677, 0
  br i1 %t1678, label %fixfast440, label %fixslow441
fixfast440:
  %t1679 = icmp eq i64 %a0, %a1
  %t1680 = select i1 %t1679, i64 257, i64 1
  br label %fixmerge442
fixslow441:
  %t1681 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge442
fixmerge442:
  %t1682 = phi i64 [ %t1680, %fixfast440 ], [ %t1681, %fixslow441 ]
  ret i64 %t1682
}

define fastcc i64 @"scheme.base:code:char<=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1683 = icmp sge i64 %argc, 2
  br i1 %t1683, label %argok444, label %arityerr443
arityerr443:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok444:
  %t1684 = call ptr @rt_alloc_words(i64 8)
  %t1685 = getelementptr i64, ptr %t1684, i64 0
  store i64 %a0, ptr %t1685
  %t1686 = getelementptr i64, ptr %t1684, i64 1
  store i64 %a1, ptr %t1686
  %t1687 = getelementptr i64, ptr %t1684, i64 2
  store i64 %a2, ptr %t1687
  %t1688 = getelementptr i64, ptr %t1684, i64 3
  store i64 %a3, ptr %t1688
  %t1689 = getelementptr i64, ptr %t1684, i64 4
  store i64 %a4, ptr %t1689
  %t1690 = getelementptr i64, ptr %t1684, i64 5
  store i64 %a5, ptr %t1690
  %t1691 = getelementptr i64, ptr %t1684, i64 6
  store i64 %a6, ptr %t1691
  %t1692 = getelementptr i64, ptr %t1684, i64 7
  store i64 %a7, ptr %t1692
  %t1693 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1684, ptr %overflow)
  %t1694 = call ptr @rt_alloc_words(i64 1)
  %t1695 = ptrtoint ptr %t1694 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_361" to i64), ptr %t1694
  %t1696 = or i64 %t1695, 4
  %t1697 = load i64, ptr @"scheme.base:chr-cmp"
  %t1698 = and i64 %t1697, -8
  %t1699 = inttoptr i64 %t1698 to ptr
  %t1700 = load i64, ptr %t1699
  %t1701 = inttoptr i64 %t1700 to ptr
  %t1702 = musttail call fastcc i64 %t1701(i64 %t1697, i64 4, i64 %t1696, i64 %a0, i64 %a1, i64 %t1693, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1702
}

define fastcc i64 @"scheme.base:code_373"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1707 = icmp eq i64 %argc, 2
  br i1 %t1707, label %argok446, label %arityerr445
arityerr445:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok446:
  %t1708 = or i64 %a1, %a0
  %t1709 = and i64 %t1708, 7
  %t1710 = icmp eq i64 %t1709, 0
  br i1 %t1710, label %fixfast447, label %fixslow448
fixfast447:
  %t1711 = icmp slt i64 %a1, %a0
  %t1712 = select i1 %t1711, i64 257, i64 1
  br label %fixmerge449
fixslow448:
  %t1713 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge449
fixmerge449:
  %t1714 = phi i64 [ %t1712, %fixfast447 ], [ %t1713, %fixslow448 ]
  %t1715 = icmp ne i64 %t1714, 1
  br i1 %t1715, label %then450, label %else451
then450:
  ret i64 257
else451:
  %t1716 = or i64 %a0, %a1
  %t1717 = and i64 %t1716, 7
  %t1718 = icmp eq i64 %t1717, 0
  br i1 %t1718, label %fixfast452, label %fixslow453
fixfast452:
  %t1719 = icmp eq i64 %a0, %a1
  %t1720 = select i1 %t1719, i64 257, i64 1
  br label %fixmerge454
fixslow453:
  %t1721 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge454
fixmerge454:
  %t1722 = phi i64 [ %t1720, %fixfast452 ], [ %t1721, %fixslow453 ]
  ret i64 %t1722
}

define fastcc i64 @"scheme.base:code:char>=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1723 = icmp sge i64 %argc, 2
  br i1 %t1723, label %argok456, label %arityerr455
arityerr455:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok456:
  %t1724 = call ptr @rt_alloc_words(i64 8)
  %t1725 = getelementptr i64, ptr %t1724, i64 0
  store i64 %a0, ptr %t1725
  %t1726 = getelementptr i64, ptr %t1724, i64 1
  store i64 %a1, ptr %t1726
  %t1727 = getelementptr i64, ptr %t1724, i64 2
  store i64 %a2, ptr %t1727
  %t1728 = getelementptr i64, ptr %t1724, i64 3
  store i64 %a3, ptr %t1728
  %t1729 = getelementptr i64, ptr %t1724, i64 4
  store i64 %a4, ptr %t1729
  %t1730 = getelementptr i64, ptr %t1724, i64 5
  store i64 %a5, ptr %t1730
  %t1731 = getelementptr i64, ptr %t1724, i64 6
  store i64 %a6, ptr %t1731
  %t1732 = getelementptr i64, ptr %t1724, i64 7
  store i64 %a7, ptr %t1732
  %t1733 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1724, ptr %overflow)
  %t1734 = call ptr @rt_alloc_words(i64 1)
  %t1735 = ptrtoint ptr %t1734 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_373" to i64), ptr %t1734
  %t1736 = or i64 %t1735, 4
  %t1737 = load i64, ptr @"scheme.base:chr-cmp"
  %t1738 = and i64 %t1737, -8
  %t1739 = inttoptr i64 %t1738 to ptr
  %t1740 = load i64, ptr %t1739
  %t1741 = inttoptr i64 %t1740 to ptr
  %t1742 = musttail call fastcc i64 %t1741(i64 %t1737, i64 4, i64 %t1736, i64 %a0, i64 %a1, i64 %t1733, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1742
}

define fastcc i64 @"scheme.base:code_388"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1747 = icmp eq i64 %argc, 2
  br i1 %t1747, label %argok458, label %arityerr457
arityerr457:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok458:
  %t1748 = and i64 %self, -8
  %t1749 = inttoptr i64 %t1748 to ptr
  %t1750 = getelementptr i64, ptr %t1749, i64 1
  %t1751 = load i64, ptr %t1750
  %t1752 = or i64 %a0, %t1751
  %t1753 = and i64 %t1752, 7
  %t1754 = icmp eq i64 %t1753, 0
  br i1 %t1754, label %fixfast459, label %fixslow460
fixfast459:
  %t1755 = icmp slt i64 %a0, %t1751
  %t1756 = select i1 %t1755, i64 257, i64 1
  br label %fixmerge461
fixslow460:
  %t1757 = call i64 @rt_lt(i64 %a0, i64 %t1751)
  br label %fixmerge461
fixmerge461:
  %t1758 = phi i64 [ %t1756, %fixfast459 ], [ %t1757, %fixslow460 ]
  %t1759 = icmp ne i64 %t1758, 1
  br i1 %t1759, label %then462, label %else463
then462:
  ret i64 %a1
else463:
  %t1760 = or i64 %a0, 8
  %t1761 = and i64 %t1760, 7
  %t1762 = icmp eq i64 %t1761, 0
  br i1 %t1762, label %fixfast464, label %fixslow465
fixfast464:
  %t1763 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t1764 = extractvalue {i64, i1} %t1763, 0
  %t1765 = extractvalue {i64, i1} %t1763, 1
  br i1 %t1765, label %fixslow465, label %fixmerge466
fixslow465:
  %t1766 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge466
fixmerge466:
  %t1767 = phi i64 [ %t1764, %fixfast464 ], [ %t1766, %fixslow465 ]
  %t1768 = and i64 %self, -8
  %t1769 = inttoptr i64 %t1768 to ptr
  %t1770 = getelementptr i64, ptr %t1769, i64 3
  %t1771 = load i64, ptr %t1770
  %t1772 = call i64 @rt_string_ref(i64 %t1771, i64 %a0)
  %t1773 = call i64 @rt_cons(i64 %t1772, i64 %a1)
  %t1774 = musttail call fastcc i64 @"scheme.base:code_388"(i64 %self, i64 2, i64 %t1767, i64 %t1773, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1774
}

define fastcc i64 @"scheme.base:code:string->list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1775 = icmp sge i64 %argc, 1
  br i1 %t1775, label %argok468, label %arityerr467
arityerr467:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok468:
  %t1776 = call ptr @rt_alloc_words(i64 8)
  %t1777 = getelementptr i64, ptr %t1776, i64 0
  store i64 %a0, ptr %t1777
  %t1778 = getelementptr i64, ptr %t1776, i64 1
  store i64 %a1, ptr %t1778
  %t1779 = getelementptr i64, ptr %t1776, i64 2
  store i64 %a2, ptr %t1779
  %t1780 = getelementptr i64, ptr %t1776, i64 3
  store i64 %a3, ptr %t1780
  %t1781 = getelementptr i64, ptr %t1776, i64 4
  store i64 %a4, ptr %t1781
  %t1782 = getelementptr i64, ptr %t1776, i64 5
  store i64 %a5, ptr %t1782
  %t1783 = getelementptr i64, ptr %t1776, i64 6
  store i64 %a6, ptr %t1783
  %t1784 = getelementptr i64, ptr %t1776, i64 7
  store i64 %a7, ptr %t1784
  %t1785 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t1776, ptr %overflow)
  %t1786 = call i64 @rt_string_length(i64 %a0)
  %t1787 = load i64, ptr @"scheme.base:rng-start"
  %t1788 = and i64 %t1787, -8
  %t1789 = inttoptr i64 %t1788 to ptr
  %t1790 = load i64, ptr %t1789
  %t1791 = inttoptr i64 %t1790 to ptr
  %t1792 = call fastcc i64%t1791(i64 %t1787, i64 1, i64 %t1785, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1793 = load i64, ptr @"scheme.base:rng-end"
  %t1794 = and i64 %t1793, -8
  %t1795 = inttoptr i64 %t1794 to ptr
  %t1796 = load i64, ptr %t1795
  %t1797 = inttoptr i64 %t1796 to ptr
  %t1798 = call fastcc i64%t1797(i64 %t1793, i64 2, i64 %t1785, i64 %t1786, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1799 = call i64 @rt_intern(ptr @.str.sym.5)
  %t1800 = load i64, ptr @"scheme.base:rng-check"
  %t1801 = and i64 %t1800, -8
  %t1802 = inttoptr i64 %t1801 to ptr
  %t1803 = load i64, ptr %t1802
  %t1804 = inttoptr i64 %t1803 to ptr
  %t1805 = call fastcc i64%t1804(i64 %t1800, i64 4, i64 %t1799, i64 %t1792, i64 %t1798, i64 %t1786, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1806 = call ptr @rt_alloc_words(i64 4)
  %t1807 = ptrtoint ptr %t1806 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_388" to i64), ptr %t1806
  %t1808 = or i64 %t1807, 4
  %t1809 = getelementptr i64, ptr %t1806, i64 1
  store i64 %t1792, ptr %t1809
  %t1810 = getelementptr i64, ptr %t1806, i64 2
  store i64 %t1808, ptr %t1810
  %t1811 = getelementptr i64, ptr %t1806, i64 3
  store i64 %a0, ptr %t1811
  %t1812 = or i64 %t1798, 8
  %t1813 = and i64 %t1812, 7
  %t1814 = icmp eq i64 %t1813, 0
  br i1 %t1814, label %fixfast469, label %fixslow470
fixfast469:
  %t1815 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t1798, i64 8)
  %t1816 = extractvalue {i64, i1} %t1815, 0
  %t1817 = extractvalue {i64, i1} %t1815, 1
  br i1 %t1817, label %fixslow470, label %fixmerge471
fixslow470:
  %t1818 = call i64 @rt_sub(i64 %t1798, i64 8)
  br label %fixmerge471
fixmerge471:
  %t1819 = phi i64 [ %t1816, %fixfast469 ], [ %t1818, %fixslow470 ]
  %t1820 = musttail call fastcc i64 @"scheme.base:code_388"(i64 %t1808, i64 2, i64 %t1819, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1820
}

define fastcc i64 @"scheme.base:code:ns-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1825 = icmp eq i64 %argc, 2
  br i1 %t1825, label %argok473, label %arityerr472
arityerr472:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok473:
  %t1826 = load i64, ptr @"scheme.base:ns-digits-radix"
  %t1827 = and i64 %t1826, -8
  %t1828 = inttoptr i64 %t1827 to ptr
  %t1829 = load i64, ptr %t1828
  %t1830 = inttoptr i64 %t1829 to ptr
  %t1831 = musttail call fastcc i64 %t1830(i64 %t1826, i64 3, i64 %a0, i64 80, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1831
}

define fastcc i64 @"scheme.base:code:%ns-digit-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1836 = icmp eq i64 %argc, 1
  br i1 %t1836, label %argok475, label %arityerr474
arityerr474:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok475:
  %t1837 = or i64 %a0, 80
  %t1838 = and i64 %t1837, 7
  %t1839 = icmp eq i64 %t1838, 0
  br i1 %t1839, label %fixfast476, label %fixslow477
fixfast476:
  %t1840 = icmp slt i64 %a0, 80
  %t1841 = select i1 %t1840, i64 257, i64 1
  br label %fixmerge478
fixslow477:
  %t1842 = call i64 @rt_lt(i64 %a0, i64 80)
  br label %fixmerge478
fixmerge478:
  %t1843 = phi i64 [ %t1841, %fixfast476 ], [ %t1842, %fixslow477 ]
  %t1844 = icmp ne i64 %t1843, 1
  br i1 %t1844, label %then479, label %else480
then479:
  %t1845 = or i64 384, %a0
  %t1846 = and i64 %t1845, 7
  %t1847 = icmp eq i64 %t1846, 0
  br i1 %t1847, label %fixfast481, label %fixslow482
fixfast481:
  %t1848 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 384, i64 %a0)
  %t1849 = extractvalue {i64, i1} %t1848, 0
  %t1850 = extractvalue {i64, i1} %t1848, 1
  br i1 %t1850, label %fixslow482, label %fixmerge483
fixslow482:
  %t1851 = call i64 @rt_add(i64 384, i64 %a0)
  br label %fixmerge483
fixmerge483:
  %t1852 = phi i64 [ %t1849, %fixfast481 ], [ %t1851, %fixslow482 ]
  %t1853 = call i64 @rt_integer_to_char(i64 %t1852)
  ret i64 %t1853
else480:
  %t1854 = or i64 696, %a0
  %t1855 = and i64 %t1854, 7
  %t1856 = icmp eq i64 %t1855, 0
  br i1 %t1856, label %fixfast484, label %fixslow485
fixfast484:
  %t1857 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 696, i64 %a0)
  %t1858 = extractvalue {i64, i1} %t1857, 0
  %t1859 = extractvalue {i64, i1} %t1857, 1
  br i1 %t1859, label %fixslow485, label %fixmerge486
fixslow485:
  %t1860 = call i64 @rt_add(i64 696, i64 %a0)
  br label %fixmerge486
fixmerge486:
  %t1861 = phi i64 [ %t1858, %fixfast484 ], [ %t1860, %fixslow485 ]
  %t1862 = call i64 @rt_integer_to_char(i64 %t1861)
  ret i64 %t1862
}

define fastcc i64 @"scheme.base:code:ns-digits-radix"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1867 = icmp eq i64 %argc, 3
  br i1 %t1867, label %argok488, label %arityerr487
arityerr487:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok488:
  %t1868 = call i64 @rt_remainder(i64 %a0, i64 %a1)
  %t1869 = or i64 0, %t1868
  %t1870 = and i64 %t1869, 7
  %t1871 = icmp eq i64 %t1870, 0
  br i1 %t1871, label %fixfast489, label %fixslow490
fixfast489:
  %t1872 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %t1868)
  %t1873 = extractvalue {i64, i1} %t1872, 0
  %t1874 = extractvalue {i64, i1} %t1872, 1
  br i1 %t1874, label %fixslow490, label %fixmerge491
fixslow490:
  %t1875 = call i64 @rt_sub(i64 0, i64 %t1868)
  br label %fixmerge491
fixmerge491:
  %t1876 = phi i64 [ %t1873, %fixfast489 ], [ %t1875, %fixslow490 ]
  %t1877 = load i64, ptr @"scheme.base:%ns-digit-char"
  %t1878 = and i64 %t1877, -8
  %t1879 = inttoptr i64 %t1878 to ptr
  %t1880 = load i64, ptr %t1879
  %t1881 = inttoptr i64 %t1880 to ptr
  %t1882 = call fastcc i64%t1881(i64 %t1877, i64 1, i64 %t1876, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1883 = call i64 @rt_quotient(i64 %a0, i64 %a1)
  %t1884 = or i64 %t1883, 0
  %t1885 = and i64 %t1884, 7
  %t1886 = icmp eq i64 %t1885, 0
  br i1 %t1886, label %fixfast492, label %fixslow493
fixfast492:
  %t1887 = icmp eq i64 %t1883, 0
  %t1888 = select i1 %t1887, i64 257, i64 1
  br label %fixmerge494
fixslow493:
  %t1889 = call i64 @rt_num_eq(i64 %t1883, i64 0)
  br label %fixmerge494
fixmerge494:
  %t1890 = phi i64 [ %t1888, %fixfast492 ], [ %t1889, %fixslow493 ]
  %t1891 = icmp ne i64 %t1890, 1
  br i1 %t1891, label %then495, label %else496
then495:
  %t1892 = call i64 @rt_cons(i64 %t1882, i64 %a2)
  ret i64 %t1892
else496:
  %t1893 = call i64 @rt_cons(i64 %t1882, i64 %a2)
  %t1894 = load i64, ptr @"scheme.base:ns-digits-radix"
  %t1895 = and i64 %t1894, -8
  %t1896 = inttoptr i64 %t1895 to ptr
  %t1897 = load i64, ptr %t1896
  %t1898 = inttoptr i64 %t1897 to ptr
  %t1899 = musttail call fastcc i64 %t1898(i64 %t1894, i64 3, i64 %t1883, i64 %a1, i64 %t1893, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1899
}

define fastcc i64 @"scheme.base:code:%radix-ok?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1904 = icmp eq i64 %argc, 1
  br i1 %t1904, label %argok498, label %arityerr497
arityerr497:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok498:
  %t1905 = or i64 %a0, 80
  %t1906 = and i64 %t1905, 7
  %t1907 = icmp eq i64 %t1906, 0
  br i1 %t1907, label %fixfast499, label %fixslow500
fixfast499:
  %t1908 = icmp eq i64 %a0, 80
  %t1909 = select i1 %t1908, i64 257, i64 1
  br label %fixmerge501
fixslow500:
  %t1910 = call i64 @rt_num_eq(i64 %a0, i64 80)
  br label %fixmerge501
fixmerge501:
  %t1911 = phi i64 [ %t1909, %fixfast499 ], [ %t1910, %fixslow500 ]
  %t1912 = icmp ne i64 %t1911, 1
  br i1 %t1912, label %then502, label %else503
then502:
  ret i64 257
else503:
  %t1913 = or i64 %a0, 128
  %t1914 = and i64 %t1913, 7
  %t1915 = icmp eq i64 %t1914, 0
  br i1 %t1915, label %fixfast504, label %fixslow505
fixfast504:
  %t1916 = icmp eq i64 %a0, 128
  %t1917 = select i1 %t1916, i64 257, i64 1
  br label %fixmerge506
fixslow505:
  %t1918 = call i64 @rt_num_eq(i64 %a0, i64 128)
  br label %fixmerge506
fixmerge506:
  %t1919 = phi i64 [ %t1917, %fixfast504 ], [ %t1918, %fixslow505 ]
  %t1920 = icmp ne i64 %t1919, 1
  br i1 %t1920, label %then507, label %else508
then507:
  ret i64 257
else508:
  %t1921 = or i64 %a0, 64
  %t1922 = and i64 %t1921, 7
  %t1923 = icmp eq i64 %t1922, 0
  br i1 %t1923, label %fixfast509, label %fixslow510
fixfast509:
  %t1924 = icmp eq i64 %a0, 64
  %t1925 = select i1 %t1924, i64 257, i64 1
  br label %fixmerge511
fixslow510:
  %t1926 = call i64 @rt_num_eq(i64 %a0, i64 64)
  br label %fixmerge511
fixmerge511:
  %t1927 = phi i64 [ %t1925, %fixfast509 ], [ %t1926, %fixslow510 ]
  %t1928 = icmp ne i64 %t1927, 1
  br i1 %t1928, label %then512, label %else513
then512:
  ret i64 257
else513:
  %t1929 = or i64 %a0, 16
  %t1930 = and i64 %t1929, 7
  %t1931 = icmp eq i64 %t1930, 0
  br i1 %t1931, label %fixfast514, label %fixslow515
fixfast514:
  %t1932 = icmp eq i64 %a0, 16
  %t1933 = select i1 %t1932, i64 257, i64 1
  br label %fixmerge516
fixslow515:
  %t1934 = call i64 @rt_num_eq(i64 %a0, i64 16)
  br label %fixmerge516
fixmerge516:
  %t1935 = phi i64 [ %t1933, %fixfast514 ], [ %t1934, %fixslow515 ]
  ret i64 %t1935
}

define fastcc i64 @"scheme.base:code:number->string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1940 = icmp sge i64 %argc, 1
  br i1 %t1940, label %argok518, label %arityerr517
arityerr517:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok518:
  %t1941 = call ptr @rt_alloc_words(i64 8)
  %t1942 = getelementptr i64, ptr %t1941, i64 0
  store i64 %a0, ptr %t1942
  %t1943 = getelementptr i64, ptr %t1941, i64 1
  store i64 %a1, ptr %t1943
  %t1944 = getelementptr i64, ptr %t1941, i64 2
  store i64 %a2, ptr %t1944
  %t1945 = getelementptr i64, ptr %t1941, i64 3
  store i64 %a3, ptr %t1945
  %t1946 = getelementptr i64, ptr %t1941, i64 4
  store i64 %a4, ptr %t1946
  %t1947 = getelementptr i64, ptr %t1941, i64 5
  store i64 %a5, ptr %t1947
  %t1948 = getelementptr i64, ptr %t1941, i64 6
  store i64 %a6, ptr %t1948
  %t1949 = getelementptr i64, ptr %t1941, i64 7
  store i64 %a7, ptr %t1949
  %t1950 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t1941, ptr %overflow)
  %t1951 = call i64 @rt_null_p(i64 %t1950)
  %t1952 = icmp ne i64 %t1951, 1
  br i1 %t1952, label %then519, label %else520
then519:
  br label %merge521
else520:
  %t1953 = call i64 @rt_car(i64 %t1950)
  br label %merge521
merge521:
  %t1954 = phi i64 [ 80, %then519 ], [ %t1953, %else520 ]
  %t1955 = load i64, ptr @"scheme.base:%radix-ok?"
  %t1956 = and i64 %t1955, -8
  %t1957 = inttoptr i64 %t1956 to ptr
  %t1958 = load i64, ptr %t1957
  %t1959 = inttoptr i64 %t1958 to ptr
  %t1960 = call fastcc i64%t1959(i64 %t1955, i64 1, i64 %t1954, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1961 = icmp ne i64 %t1960, 1
  br i1 %t1961, label %then522, label %else523
then522:
  %t1962 = call i64 @rt_exact_p(i64 %a0)
  %t1963 = icmp ne i64 %t1962, 1
  br i1 %t1963, label %then524, label %else525
then524:
  %t1964 = or i64 %a0, 0
  %t1965 = and i64 %t1964, 7
  %t1966 = icmp eq i64 %t1965, 0
  br i1 %t1966, label %fixfast526, label %fixslow527
fixfast526:
  %t1967 = icmp eq i64 %a0, 0
  %t1968 = select i1 %t1967, i64 257, i64 1
  br label %fixmerge528
fixslow527:
  %t1969 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge528
fixmerge528:
  %t1970 = phi i64 [ %t1968, %fixfast526 ], [ %t1969, %fixslow527 ]
  %t1971 = icmp ne i64 %t1970, 1
  br i1 %t1971, label %then529, label %else530
then529:
  %t1972 = call i64 @rt_make_string(ptr @.str.lit.6, i64 1)
  ret i64 %t1972
else530:
  %t1973 = or i64 %a0, 0
  %t1974 = and i64 %t1973, 7
  %t1975 = icmp eq i64 %t1974, 0
  br i1 %t1975, label %fixfast531, label %fixslow532
fixfast531:
  %t1976 = icmp slt i64 %a0, 0
  %t1977 = select i1 %t1976, i64 257, i64 1
  br label %fixmerge533
fixslow532:
  %t1978 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge533
fixmerge533:
  %t1979 = phi i64 [ %t1977, %fixfast531 ], [ %t1978, %fixslow532 ]
  %t1980 = icmp ne i64 %t1979, 1
  br i1 %t1980, label %then534, label %else535
then534:
  %t1981 = load i64, ptr @"scheme.base:ns-digits-radix"
  %t1982 = and i64 %t1981, -8
  %t1983 = inttoptr i64 %t1982 to ptr
  %t1984 = load i64, ptr %t1983
  %t1985 = inttoptr i64 %t1984 to ptr
  %t1986 = call fastcc i64%t1985(i64 %t1981, i64 3, i64 %a0, i64 %t1954, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1987 = call i64 @rt_cons(i64 11529, i64 %t1986)
  %t1988 = call i64 @rt_list_to_string(i64 %t1987)
  ret i64 %t1988
else535:
  %t1989 = or i64 0, %a0
  %t1990 = and i64 %t1989, 7
  %t1991 = icmp eq i64 %t1990, 0
  br i1 %t1991, label %fixfast536, label %fixslow537
fixfast536:
  %t1992 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %a0)
  %t1993 = extractvalue {i64, i1} %t1992, 0
  %t1994 = extractvalue {i64, i1} %t1992, 1
  br i1 %t1994, label %fixslow537, label %fixmerge538
fixslow537:
  %t1995 = call i64 @rt_sub(i64 0, i64 %a0)
  br label %fixmerge538
fixmerge538:
  %t1996 = phi i64 [ %t1993, %fixfast536 ], [ %t1995, %fixslow537 ]
  %t1997 = load i64, ptr @"scheme.base:ns-digits-radix"
  %t1998 = and i64 %t1997, -8
  %t1999 = inttoptr i64 %t1998 to ptr
  %t2000 = load i64, ptr %t1999
  %t2001 = inttoptr i64 %t2000 to ptr
  %t2002 = call fastcc i64%t2001(i64 %t1997, i64 3, i64 %t1996, i64 %t1954, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2003 = call i64 @rt_list_to_string(i64 %t2002)
  ret i64 %t2003
else525:
  %t2004 = or i64 %t1954, 80
  %t2005 = and i64 %t2004, 7
  %t2006 = icmp eq i64 %t2005, 0
  br i1 %t2006, label %fixfast539, label %fixslow540
fixfast539:
  %t2007 = icmp eq i64 %t1954, 80
  %t2008 = select i1 %t2007, i64 257, i64 1
  br label %fixmerge541
fixslow540:
  %t2009 = call i64 @rt_num_eq(i64 %t1954, i64 80)
  br label %fixmerge541
fixmerge541:
  %t2010 = phi i64 [ %t2008, %fixfast539 ], [ %t2009, %fixslow540 ]
  %t2011 = icmp ne i64 %t2010, 1
  br i1 %t2011, label %then542, label %else543
then542:
  %t2012 = call i64 @rt_flonum_to_string(i64 %a0)
  ret i64 %t2012
else543:
  %t2013 = call i64 @rt_make_string(ptr @.str.lit.7, i64 54)
  %t2014 = load i64, ptr @"scheme.base:error"
  %t2015 = and i64 %t2014, -8
  %t2016 = inttoptr i64 %t2015 to ptr
  %t2017 = load i64, ptr %t2016
  %t2018 = inttoptr i64 %t2017 to ptr
  %t2019 = musttail call fastcc i64 %t2018(i64 %t2014, i64 2, i64 %t2013, i64 %t1954, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2019
else523:
  %t2020 = call i64 @rt_make_string(ptr @.str.lit.8, i64 33)
  %t2021 = load i64, ptr @"scheme.base:error"
  %t2022 = and i64 %t2021, -8
  %t2023 = inttoptr i64 %t2022 to ptr
  %t2024 = load i64, ptr %t2023
  %t2025 = inttoptr i64 %t2024 to ptr
  %t2026 = musttail call fastcc i64 %t2025(i64 %t2021, i64 2, i64 %t2020, i64 %t1954, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2026
}

define fastcc i64 @"scheme.base:code:string->number"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2031 = icmp sge i64 %argc, 1
  br i1 %t2031, label %argok545, label %arityerr544
arityerr544:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok545:
  %t2032 = call ptr @rt_alloc_words(i64 8)
  %t2033 = getelementptr i64, ptr %t2032, i64 0
  store i64 %a0, ptr %t2033
  %t2034 = getelementptr i64, ptr %t2032, i64 1
  store i64 %a1, ptr %t2034
  %t2035 = getelementptr i64, ptr %t2032, i64 2
  store i64 %a2, ptr %t2035
  %t2036 = getelementptr i64, ptr %t2032, i64 3
  store i64 %a3, ptr %t2036
  %t2037 = getelementptr i64, ptr %t2032, i64 4
  store i64 %a4, ptr %t2037
  %t2038 = getelementptr i64, ptr %t2032, i64 5
  store i64 %a5, ptr %t2038
  %t2039 = getelementptr i64, ptr %t2032, i64 6
  store i64 %a6, ptr %t2039
  %t2040 = getelementptr i64, ptr %t2032, i64 7
  store i64 %a7, ptr %t2040
  %t2041 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2032, ptr %overflow)
  %t2042 = call i64 @rt_null_p(i64 %t2041)
  %t2043 = icmp ne i64 %t2042, 1
  br i1 %t2043, label %then546, label %else547
then546:
  br label %merge548
else547:
  %t2044 = call i64 @rt_car(i64 %t2041)
  br label %merge548
merge548:
  %t2045 = phi i64 [ 80, %then546 ], [ %t2044, %else547 ]
  %t2046 = load i64, ptr @"scheme.base:%radix-ok?"
  %t2047 = and i64 %t2046, -8
  %t2048 = inttoptr i64 %t2047 to ptr
  %t2049 = load i64, ptr %t2048
  %t2050 = inttoptr i64 %t2049 to ptr
  %t2051 = call fastcc i64%t2050(i64 %t2046, i64 1, i64 %t2045, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2052 = icmp ne i64 %t2051, 1
  br i1 %t2052, label %then549, label %else550
then549:
  %t2053 = load i64, ptr @"emit.internal:rd-number"
  %t2054 = call fastcc i64 @"emit.internal:code:rd-number"(i64 %t2053, i64 2, i64 %a0, i64 %t2045, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2055 = call i64 @rt_symbol_p(i64 %t2054)
  %t2056 = icmp ne i64 %t2055, 1
  br i1 %t2056, label %then551, label %else552
then551:
  ret i64 1
else552:
  ret i64 %t2054
else550:
  %t2057 = call i64 @rt_make_string(ptr @.str.lit.9, i64 33)
  %t2058 = load i64, ptr @"scheme.base:error"
  %t2059 = and i64 %t2058, -8
  %t2060 = inttoptr i64 %t2059 to ptr
  %t2061 = load i64, ptr %t2060
  %t2062 = inttoptr i64 %t2061 to ptr
  %t2063 = musttail call fastcc i64 %t2062(i64 %t2058, i64 2, i64 %t2057, i64 %t2045, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2063
}

define fastcc i64 @"scheme.base:code:error"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2068 = icmp sge i64 %argc, 1
  br i1 %t2068, label %argok554, label %arityerr553
arityerr553:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok554:
  %t2069 = call ptr @rt_alloc_words(i64 8)
  %t2070 = getelementptr i64, ptr %t2069, i64 0
  store i64 %a0, ptr %t2070
  %t2071 = getelementptr i64, ptr %t2069, i64 1
  store i64 %a1, ptr %t2071
  %t2072 = getelementptr i64, ptr %t2069, i64 2
  store i64 %a2, ptr %t2072
  %t2073 = getelementptr i64, ptr %t2069, i64 3
  store i64 %a3, ptr %t2073
  %t2074 = getelementptr i64, ptr %t2069, i64 4
  store i64 %a4, ptr %t2074
  %t2075 = getelementptr i64, ptr %t2069, i64 5
  store i64 %a5, ptr %t2075
  %t2076 = getelementptr i64, ptr %t2069, i64 6
  store i64 %a6, ptr %t2076
  %t2077 = getelementptr i64, ptr %t2069, i64 7
  store i64 %a7, ptr %t2077
  %t2078 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2069, ptr %overflow)
  %t2079 = call i64 @rt_string_p(i64 %a0)
  %t2080 = icmp ne i64 %t2079, 1
  br i1 %t2080, label %then555, label %else556
then555:
  %t2081 = call i64 @rt_make_error_object(i64 %a0, i64 %t2078)
  %t2082 = load i64, ptr @"scheme.base:raise"
  %t2083 = and i64 %t2082, -8
  %t2084 = inttoptr i64 %t2083 to ptr
  %t2085 = load i64, ptr %t2084
  %t2086 = inttoptr i64 %t2085 to ptr
  %t2087 = musttail call fastcc i64 %t2086(i64 %t2082, i64 1, i64 %t2081, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2087
else556:
  %t2088 = call i64 @rt_symbol_to_string(i64 %a0)
  %t2089 = call i64 @rt_make_string(ptr @.str.lit.10, i64 2)
  %t2090 = call i64 @rt_car(i64 %t2078)
  %t2091 = call i64 @rt_string_append(i64 %t2089, i64 %t2090)
  %t2092 = call i64 @rt_string_append(i64 %t2088, i64 %t2091)
  %t2093 = call i64 @rt_cdr(i64 %t2078)
  %t2094 = call i64 @rt_make_error_object(i64 %t2092, i64 %t2093)
  %t2095 = load i64, ptr @"scheme.base:raise"
  %t2096 = and i64 %t2095, -8
  %t2097 = inttoptr i64 %t2096 to ptr
  %t2098 = load i64, ptr %t2097
  %t2099 = inttoptr i64 %t2098 to ptr
  %t2100 = musttail call fastcc i64 %t2099(i64 %t2095, i64 1, i64 %t2094, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2100
}

define fastcc i64 @"scheme.base:code:%unwind-to"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2107 = icmp eq i64 %argc, 1
  br i1 %t2107, label %argok558, label %arityerr557
arityerr557:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok558:
  %t2108 = load i64, ptr @"scheme.base:*winds*"
  %t2109 = call i64 @rt_eq_p(i64 %t2108, i64 %a0)
  %t2110 = icmp ne i64 %t2109, 1
  br i1 %t2110, label %then559, label %else560
then559:
  ret i64 257
else560:
  %t2111 = load i64, ptr @"scheme.base:*winds*"
  %t2112 = call i64 @rt_null_p(i64 %t2111)
  %t2113 = icmp ne i64 %t2112, 1
  br i1 %t2113, label %then561, label %else562
then561:
  ret i64 257
else562:
  %t2114 = load i64, ptr @"scheme.base:*winds*"
  %t2115 = call i64 @rt_car(i64 %t2114)
  %t2116 = load i64, ptr @"scheme.base:*winds*"
  %t2117 = call i64 @rt_cdr(i64 %t2116)
  %t2118 = call i64 @rt_root(i64 %t2117)
  store i64 %t2118, ptr @"scheme.base:*winds*"
  %t2119 = call i64 @rt_cdr(i64 %t2115)
  %t2120 = and i64 %t2119, -8
  %t2121 = inttoptr i64 %t2120 to ptr
  %t2122 = load i64, ptr %t2121
  %t2123 = inttoptr i64 %t2122 to ptr
  %t2124 = call fastcc i64%t2123(i64 %t2119, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2125 = load i64, ptr @"scheme.base:%unwind-to"
  %t2126 = and i64 %t2125, -8
  %t2127 = inttoptr i64 %t2126 to ptr
  %t2128 = load i64, ptr %t2127
  %t2129 = inttoptr i64 %t2128 to ptr
  %t2130 = musttail call fastcc i64 %t2129(i64 %t2125, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2130
}

define fastcc i64 @"scheme.base:code:dynamic-wind"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2135 = icmp eq i64 %argc, 3
  br i1 %t2135, label %argok564, label %arityerr563
arityerr563:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok564:
  %t2136 = and i64 %a0, -8
  %t2137 = inttoptr i64 %t2136 to ptr
  %t2138 = load i64, ptr %t2137
  %t2139 = inttoptr i64 %t2138 to ptr
  %t2140 = call fastcc i64%t2139(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2141 = call i64 @rt_cons(i64 %a0, i64 %a2)
  %t2142 = load i64, ptr @"scheme.base:*winds*"
  %t2143 = call i64 @rt_cons(i64 %t2141, i64 %t2142)
  %t2144 = call i64 @rt_root(i64 %t2143)
  store i64 %t2144, ptr @"scheme.base:*winds*"
  %t2145 = and i64 %a1, -8
  %t2146 = inttoptr i64 %t2145 to ptr
  %t2147 = load i64, ptr %t2146
  %t2148 = inttoptr i64 %t2147 to ptr
  %t2149 = call fastcc i64%t2148(i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2150 = load i64, ptr @"scheme.base:*winds*"
  %t2151 = call i64 @rt_cdr(i64 %t2150)
  %t2152 = call i64 @rt_root(i64 %t2151)
  store i64 %t2152, ptr @"scheme.base:*winds*"
  %t2153 = and i64 %a2, -8
  %t2154 = inttoptr i64 %t2153 to ptr
  %t2155 = load i64, ptr %t2154
  %t2156 = inttoptr i64 %t2155 to ptr
  %t2157 = call fastcc i64%t2156(i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2149
}

define fastcc i64 @"scheme.base:code_470"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2162 = icmp eq i64 %argc, 1
  br i1 %t2162, label %argok566, label %arityerr565
arityerr565:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok566:
  %t2163 = and i64 %self, -8
  %t2164 = inttoptr i64 %t2163 to ptr
  %t2165 = getelementptr i64, ptr %t2164, i64 1
  %t2166 = load i64, ptr %t2165
  %t2167 = call i64 @rt_escape_live_p(i64 %t2166)
  %t2168 = icmp ne i64 %t2167, 1
  br i1 %t2168, label %then567, label %else568
then567:
  %t2169 = and i64 %self, -8
  %t2170 = inttoptr i64 %t2169 to ptr
  %t2171 = getelementptr i64, ptr %t2170, i64 2
  %t2172 = load i64, ptr %t2171
  %t2173 = load i64, ptr @"scheme.base:%unwind-to"
  %t2174 = and i64 %t2173, -8
  %t2175 = inttoptr i64 %t2174 to ptr
  %t2176 = load i64, ptr %t2175
  %t2177 = inttoptr i64 %t2176 to ptr
  %t2178 = call fastcc i64%t2177(i64 %t2173, i64 1, i64 %t2172, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2179 = and i64 %self, -8
  %t2180 = inttoptr i64 %t2179 to ptr
  %t2181 = getelementptr i64, ptr %t2180, i64 1
  %t2182 = load i64, ptr %t2181
  %t2183 = call i64 @rt_escape_to(i64 %t2182, i64 %a0)
  br label %merge569
else568:
  br label %merge569
merge569:
  %t2184 = phi i64 [ %t2183, %then567 ], [ 1, %else568 ]
  %t2185 = call i64 @rt_intern(ptr @.str.sym.11)
  %t2186 = call i64 @rt_make_string(ptr @.str.lit.12, i64 39)
  %t2187 = load i64, ptr @"scheme.base:error"
  %t2188 = and i64 %t2187, -8
  %t2189 = inttoptr i64 %t2188 to ptr
  %t2190 = load i64, ptr %t2189
  %t2191 = inttoptr i64 %t2190 to ptr
  %t2192 = musttail call fastcc i64 %t2191(i64 %t2187, i64 2, i64 %t2185, i64 %t2186, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2192
}

define fastcc i64 @"scheme.base:code_468"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2193 = icmp eq i64 %argc, 0
  br i1 %t2193, label %argok571, label %arityerr570
arityerr570:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok571:
  %t2194 = call i64 @rt_escape_frame()
  %t2195 = and i64 %self, -8
  %t2196 = inttoptr i64 %t2195 to ptr
  %t2197 = getelementptr i64, ptr %t2196, i64 2
  %t2198 = load i64, ptr %t2197
  %t2199 = call ptr @rt_alloc_words(i64 3)
  %t2200 = ptrtoint ptr %t2199 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_470" to i64), ptr %t2199
  %t2201 = getelementptr i64, ptr %t2199, i64 1
  store i64 %t2194, ptr %t2201
  %t2202 = getelementptr i64, ptr %t2199, i64 2
  store i64 %t2198, ptr %t2202
  %t2203 = or i64 %t2200, 4
  %t2204 = and i64 %self, -8
  %t2205 = inttoptr i64 %t2204 to ptr
  %t2206 = getelementptr i64, ptr %t2205, i64 1
  %t2207 = load i64, ptr %t2206
  %t2208 = and i64 %t2207, -8
  %t2209 = inttoptr i64 %t2208 to ptr
  %t2210 = load i64, ptr %t2209
  %t2211 = inttoptr i64 %t2210 to ptr
  %t2212 = musttail call fastcc i64 %t2211(i64 %t2207, i64 1, i64 %t2203, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2212
}

define fastcc i64 @"scheme.base:code:call-with-current-continuation"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2213 = icmp eq i64 %argc, 1
  br i1 %t2213, label %argok573, label %arityerr572
arityerr572:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok573:
  %t2214 = load i64, ptr @"scheme.base:*winds*"
  %t2215 = call ptr @rt_alloc_words(i64 3)
  %t2216 = ptrtoint ptr %t2215 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_468" to i64), ptr %t2215
  %t2217 = getelementptr i64, ptr %t2215, i64 1
  store i64 %a0, ptr %t2217
  %t2218 = getelementptr i64, ptr %t2215, i64 2
  store i64 %t2214, ptr %t2218
  %t2219 = or i64 %t2216, 4
  %t2220 = call i64 @rt_run_guarded(ptr @__apply0, i64 %t2219)
  %t2221 = call i64 @rt_cdr(i64 %t2220)
  ret i64 %t2221
}

define fastcc i64 @"scheme.base:code:call/cc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2226 = icmp eq i64 %argc, 1
  br i1 %t2226, label %argok575, label %arityerr574
arityerr574:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok575:
  %t2227 = load i64, ptr @"scheme.base:call-with-current-continuation"
  %t2228 = and i64 %t2227, -8
  %t2229 = inttoptr i64 %t2228 to ptr
  %t2230 = load i64, ptr %t2229
  %t2231 = inttoptr i64 %t2230 to ptr
  %t2232 = musttail call fastcc i64 %t2231(i64 %t2227, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2232
}

define fastcc i64 @"scheme.base:code_478"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2237 = icmp eq i64 %argc, 0
  br i1 %t2237, label %argok577, label %arityerr576
arityerr576:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok577:
  %t2238 = and i64 %self, -8
  %t2239 = inttoptr i64 %t2238 to ptr
  %t2240 = getelementptr i64, ptr %t2239, i64 1
  %t2241 = load i64, ptr %t2240
  %t2242 = and i64 %self, -8
  %t2243 = inttoptr i64 %t2242 to ptr
  %t2244 = getelementptr i64, ptr %t2243, i64 2
  %t2245 = load i64, ptr %t2244
  %t2246 = call i64 @rt_cons(i64 %t2241, i64 %t2245)
  %t2247 = call i64 @rt_root(i64 %t2246)
  store i64 %t2247, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code_480"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2248 = icmp eq i64 %argc, 0
  br i1 %t2248, label %argok579, label %arityerr578
arityerr578:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok579:
  %t2249 = and i64 %self, -8
  %t2250 = inttoptr i64 %t2249 to ptr
  %t2251 = getelementptr i64, ptr %t2250, i64 1
  %t2252 = load i64, ptr %t2251
  %t2253 = call i64 @rt_root(i64 %t2252)
  store i64 %t2253, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code:with-exception-handler"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2254 = icmp eq i64 %argc, 2
  br i1 %t2254, label %argok581, label %arityerr580
arityerr580:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok581:
  %t2255 = load i64, ptr @"scheme.base:*handlers*"
  %t2256 = call ptr @rt_alloc_words(i64 3)
  %t2257 = ptrtoint ptr %t2256 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_478" to i64), ptr %t2256
  %t2258 = getelementptr i64, ptr %t2256, i64 1
  store i64 %a0, ptr %t2258
  %t2259 = getelementptr i64, ptr %t2256, i64 2
  store i64 %t2255, ptr %t2259
  %t2260 = or i64 %t2257, 4
  %t2261 = call ptr @rt_alloc_words(i64 2)
  %t2262 = ptrtoint ptr %t2261 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_480" to i64), ptr %t2261
  %t2263 = getelementptr i64, ptr %t2261, i64 1
  store i64 %t2255, ptr %t2263
  %t2264 = or i64 %t2262, 4
  %t2265 = load i64, ptr @"scheme.base:dynamic-wind"
  %t2266 = and i64 %t2265, -8
  %t2267 = inttoptr i64 %t2266 to ptr
  %t2268 = load i64, ptr %t2267
  %t2269 = inttoptr i64 %t2268 to ptr
  %t2270 = musttail call fastcc i64 %t2269(i64 %t2265, i64 3, i64 %t2260, i64 %a1, i64 %t2264, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2270
}

define fastcc i64 @"scheme.base:code:raise"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2275 = icmp eq i64 %argc, 1
  br i1 %t2275, label %argok583, label %arityerr582
arityerr582:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok583:
  %t2276 = load i64, ptr @"scheme.base:*handlers*"
  %t2277 = call i64 @rt_null_p(i64 %t2276)
  %t2278 = icmp ne i64 %t2277, 1
  br i1 %t2278, label %then584, label %else585
then584:
  %t2279 = call i64 @rt_raise(i64 %a0)
  ret i64 %t2279
else585:
  %t2280 = load i64, ptr @"scheme.base:*handlers*"
  %t2281 = call i64 @rt_car(i64 %t2280)
  %t2282 = load i64, ptr @"scheme.base:*handlers*"
  %t2283 = load i64, ptr @"scheme.base:*handlers*"
  %t2284 = call i64 @rt_cdr(i64 %t2283)
  %t2285 = call i64 @rt_root(i64 %t2284)
  store i64 %t2285, ptr @"scheme.base:*handlers*"
  %t2286 = and i64 %t2281, -8
  %t2287 = inttoptr i64 %t2286 to ptr
  %t2288 = load i64, ptr %t2287
  %t2289 = inttoptr i64 %t2288 to ptr
  %t2290 = call fastcc i64%t2289(i64 %t2281, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2291 = call i64 @rt_root(i64 %t2282)
  store i64 %t2291, ptr @"scheme.base:*handlers*"
  %t2292 = call i64 @rt_raise(i64 %a0)
  ret i64 %t2292
}

define fastcc i64 @"scheme.base:code:error-object?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2297 = icmp eq i64 %argc, 1
  br i1 %t2297, label %argok587, label %arityerr586
arityerr586:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok587:
  %t2298 = call i64 @rt_error_object_p(i64 %a0)
  ret i64 %t2298
}

define fastcc i64 @"scheme.base:code:error-object-message"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2303 = icmp eq i64 %argc, 1
  br i1 %t2303, label %argok589, label %arityerr588
arityerr588:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok589:
  %t2304 = call i64 @rt_error_object_message(i64 %a0)
  ret i64 %t2304
}

define fastcc i64 @"scheme.base:code:error-object-irritants"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2309 = icmp eq i64 %argc, 1
  br i1 %t2309, label %argok591, label %arityerr590
arityerr590:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok591:
  %t2310 = call i64 @rt_error_object_irritants(i64 %a0)
  ret i64 %t2310
}

define fastcc i64 @"scheme.base:code_500"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2315 = icmp eq i64 %argc, 1
  br i1 %t2315, label %argok593, label %arityerr592
arityerr592:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok593:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_502"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2316 = icmp eq i64 %argc, 1
  br i1 %t2316, label %argok595, label %arityerr594
arityerr594:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok595:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_504"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2317 = icmp sge i64 %argc, 0
  br i1 %t2317, label %argok597, label %arityerr596
arityerr596:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok597:
  %t2318 = call ptr @rt_alloc_words(i64 8)
  %t2319 = getelementptr i64, ptr %t2318, i64 0
  store i64 %a0, ptr %t2319
  %t2320 = getelementptr i64, ptr %t2318, i64 1
  store i64 %a1, ptr %t2320
  %t2321 = getelementptr i64, ptr %t2318, i64 2
  store i64 %a2, ptr %t2321
  %t2322 = getelementptr i64, ptr %t2318, i64 3
  store i64 %a3, ptr %t2322
  %t2323 = getelementptr i64, ptr %t2318, i64 4
  store i64 %a4, ptr %t2323
  %t2324 = getelementptr i64, ptr %t2318, i64 5
  store i64 %a5, ptr %t2324
  %t2325 = getelementptr i64, ptr %t2318, i64 6
  store i64 %a6, ptr %t2325
  %t2326 = getelementptr i64, ptr %t2318, i64 7
  store i64 %a7, ptr %t2326
  %t2327 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2318, ptr %overflow)
  %t2328 = call i64 @rt_null_p(i64 %t2327)
  %t2329 = icmp ne i64 %t2328, 1
  br i1 %t2329, label %then598, label %else599
then598:
  %t2330 = and i64 %self, -8
  %t2331 = inttoptr i64 %t2330 to ptr
  %t2332 = getelementptr i64, ptr %t2331, i64 1
  %t2333 = load i64, ptr %t2332
  %t2334 = call i64 @rt_vector_ref(i64 %t2333, i64 0)
  ret i64 %t2334
else599:
  %t2335 = call i64 @rt_cdr(i64 %t2327)
  %t2336 = call i64 @rt_null_p(i64 %t2335)
  %t2337 = icmp ne i64 %t2336, 1
  br i1 %t2337, label %then600, label %else601
then600:
  %t2338 = and i64 %self, -8
  %t2339 = inttoptr i64 %t2338 to ptr
  %t2340 = getelementptr i64, ptr %t2339, i64 1
  %t2341 = load i64, ptr %t2340
  %t2342 = call i64 @rt_car(i64 %t2327)
  %t2343 = and i64 %self, -8
  %t2344 = inttoptr i64 %t2343 to ptr
  %t2345 = getelementptr i64, ptr %t2344, i64 2
  %t2346 = load i64, ptr %t2345
  %t2347 = and i64 %t2346, -8
  %t2348 = inttoptr i64 %t2347 to ptr
  %t2349 = load i64, ptr %t2348
  %t2350 = inttoptr i64 %t2349 to ptr
  %t2351 = call fastcc i64%t2350(i64 %t2346, i64 1, i64 %t2342, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2352 = call i64 @rt_vector_set(i64 %t2341, i64 0, i64 %t2351)
  ret i64 %t2352
else601:
  %t2353 = and i64 %self, -8
  %t2354 = inttoptr i64 %t2353 to ptr
  %t2355 = getelementptr i64, ptr %t2354, i64 1
  %t2356 = load i64, ptr %t2355
  %t2357 = call i64 @rt_car(i64 %t2327)
  %t2358 = call i64 @rt_vector_set(i64 %t2356, i64 0, i64 %t2357)
  ret i64 %t2358
}

define fastcc i64 @"scheme.base:code:make-parameter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2359 = icmp sge i64 %argc, 1
  br i1 %t2359, label %argok603, label %arityerr602
arityerr602:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok603:
  %t2360 = call ptr @rt_alloc_words(i64 8)
  %t2361 = getelementptr i64, ptr %t2360, i64 0
  store i64 %a0, ptr %t2361
  %t2362 = getelementptr i64, ptr %t2360, i64 1
  store i64 %a1, ptr %t2362
  %t2363 = getelementptr i64, ptr %t2360, i64 2
  store i64 %a2, ptr %t2363
  %t2364 = getelementptr i64, ptr %t2360, i64 3
  store i64 %a3, ptr %t2364
  %t2365 = getelementptr i64, ptr %t2360, i64 4
  store i64 %a4, ptr %t2365
  %t2366 = getelementptr i64, ptr %t2360, i64 5
  store i64 %a5, ptr %t2366
  %t2367 = getelementptr i64, ptr %t2360, i64 6
  store i64 %a6, ptr %t2367
  %t2368 = getelementptr i64, ptr %t2360, i64 7
  store i64 %a7, ptr %t2368
  %t2369 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2360, ptr %overflow)
  %t2370 = call i64 @rt_null_p(i64 %t2369)
  %t2371 = icmp ne i64 %t2370, 1
  br i1 %t2371, label %then604, label %else605
then604:
  %t2372 = call ptr @rt_alloc_words(i64 1)
  %t2373 = ptrtoint ptr %t2372 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_500" to i64), ptr %t2372
  %t2374 = or i64 %t2373, 4
  br label %merge606
else605:
  %t2375 = call i64 @rt_car(i64 %t2369)
  br label %merge606
merge606:
  %t2376 = phi i64 [ %t2374, %then604 ], [ %t2375, %else605 ]
  %t2377 = call i64 @rt_make_vector(i64 8, i64 0)
  %t2378 = call i64 @rt_null_p(i64 %t2369)
  %t2379 = icmp ne i64 %t2378, 1
  br i1 %t2379, label %then607, label %else608
then607:
  %t2380 = call ptr @rt_alloc_words(i64 1)
  %t2381 = ptrtoint ptr %t2380 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_502" to i64), ptr %t2380
  %t2382 = or i64 %t2381, 4
  br label %merge609
else608:
  %t2383 = call i64 @rt_car(i64 %t2369)
  br label %merge609
merge609:
  %t2384 = phi i64 [ %t2382, %then607 ], [ %t2383, %else608 ]
  %t2385 = and i64 %t2384, -8
  %t2386 = inttoptr i64 %t2385 to ptr
  %t2387 = load i64, ptr %t2386
  %t2388 = inttoptr i64 %t2387 to ptr
  %t2389 = call fastcc i64%t2388(i64 %t2384, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2390 = call i64 @rt_vector_set(i64 %t2377, i64 0, i64 %t2389)
  %t2391 = call ptr @rt_alloc_words(i64 3)
  %t2392 = ptrtoint ptr %t2391 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_504" to i64), ptr %t2391
  %t2393 = getelementptr i64, ptr %t2391, i64 1
  store i64 %t2377, ptr %t2393
  %t2394 = getelementptr i64, ptr %t2391, i64 2
  store i64 %t2376, ptr %t2394
  %t2395 = or i64 %t2392, 4
  ret i64 %t2395
}

define fastcc i64 @"scheme.base:code_516"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2400 = icmp eq i64 %argc, 1
  br i1 %t2400, label %argok611, label %arityerr610
arityerr610:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok611:
  %t2401 = and i64 %a0, -8
  %t2402 = inttoptr i64 %t2401 to ptr
  %t2403 = load i64, ptr %t2402
  %t2404 = inttoptr i64 %t2403 to ptr
  %t2405 = musttail call fastcc i64 %t2404(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2405
}

define fastcc i64 @"scheme.base:code_520"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2406 = icmp eq i64 %argc, 2
  br i1 %t2406, label %argok613, label %arityerr612
arityerr612:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok613:
  %t2407 = and i64 %a0, -8
  %t2408 = inttoptr i64 %t2407 to ptr
  %t2409 = load i64, ptr %t2408
  %t2410 = inttoptr i64 %t2409 to ptr
  %t2411 = musttail call fastcc i64 %t2410(i64 %a0, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2411
}

define fastcc i64 @"scheme.base:code_518"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2412 = icmp eq i64 %argc, 0
  br i1 %t2412, label %argok615, label %arityerr614
arityerr614:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok615:
  %t2413 = call ptr @rt_alloc_words(i64 1)
  %t2414 = ptrtoint ptr %t2413 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_520" to i64), ptr %t2413
  %t2415 = or i64 %t2414, 4
  %t2416 = and i64 %self, -8
  %t2417 = inttoptr i64 %t2416 to ptr
  %t2418 = getelementptr i64, ptr %t2417, i64 1
  %t2419 = load i64, ptr %t2418
  %t2420 = and i64 %self, -8
  %t2421 = inttoptr i64 %t2420 to ptr
  %t2422 = getelementptr i64, ptr %t2421, i64 2
  %t2423 = load i64, ptr %t2422
  %t2424 = load i64, ptr @"scheme.base:for-each"
  %t2425 = and i64 %t2424, -8
  %t2426 = inttoptr i64 %t2425 to ptr
  %t2427 = load i64, ptr %t2426
  %t2428 = inttoptr i64 %t2427 to ptr
  %t2429 = musttail call fastcc i64 %t2428(i64 %t2424, i64 3, i64 %t2415, i64 %t2419, i64 %t2423, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2429
}

define fastcc i64 @"scheme.base:code_524"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2430 = icmp eq i64 %argc, 2
  br i1 %t2430, label %argok617, label %arityerr616
arityerr616:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok617:
  %t2431 = and i64 %a0, -8
  %t2432 = inttoptr i64 %t2431 to ptr
  %t2433 = load i64, ptr %t2432
  %t2434 = inttoptr i64 %t2433 to ptr
  %t2435 = musttail call fastcc i64 %t2434(i64 %a0, i64 2, i64 %a1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2435
}

define fastcc i64 @"scheme.base:code_522"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2436 = icmp eq i64 %argc, 0
  br i1 %t2436, label %argok619, label %arityerr618
arityerr618:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok619:
  %t2437 = call ptr @rt_alloc_words(i64 1)
  %t2438 = ptrtoint ptr %t2437 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_524" to i64), ptr %t2437
  %t2439 = or i64 %t2438, 4
  %t2440 = and i64 %self, -8
  %t2441 = inttoptr i64 %t2440 to ptr
  %t2442 = getelementptr i64, ptr %t2441, i64 1
  %t2443 = load i64, ptr %t2442
  %t2444 = and i64 %self, -8
  %t2445 = inttoptr i64 %t2444 to ptr
  %t2446 = getelementptr i64, ptr %t2445, i64 2
  %t2447 = load i64, ptr %t2446
  %t2448 = load i64, ptr @"scheme.base:for-each"
  %t2449 = and i64 %t2448, -8
  %t2450 = inttoptr i64 %t2449 to ptr
  %t2451 = load i64, ptr %t2450
  %t2452 = inttoptr i64 %t2451 to ptr
  %t2453 = musttail call fastcc i64 %t2452(i64 %t2448, i64 3, i64 %t2439, i64 %t2443, i64 %t2447, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2453
}

define fastcc i64 @"scheme.base:code:with-parameters"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2454 = icmp eq i64 %argc, 3
  br i1 %t2454, label %argok621, label %arityerr620
arityerr620:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok621:
  %t2455 = call ptr @rt_alloc_words(i64 1)
  %t2456 = ptrtoint ptr %t2455 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_516" to i64), ptr %t2455
  %t2457 = or i64 %t2456, 4
  %t2458 = load i64, ptr @"scheme.base:map"
  %t2459 = and i64 %t2458, -8
  %t2460 = inttoptr i64 %t2459 to ptr
  %t2461 = load i64, ptr %t2460
  %t2462 = inttoptr i64 %t2461 to ptr
  %t2463 = call fastcc i64%t2462(i64 %t2458, i64 2, i64 %t2457, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2464 = call ptr @rt_alloc_words(i64 3)
  %t2465 = ptrtoint ptr %t2464 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_518" to i64), ptr %t2464
  %t2466 = getelementptr i64, ptr %t2464, i64 1
  store i64 %a0, ptr %t2466
  %t2467 = getelementptr i64, ptr %t2464, i64 2
  store i64 %a1, ptr %t2467
  %t2468 = or i64 %t2465, 4
  %t2469 = call ptr @rt_alloc_words(i64 3)
  %t2470 = ptrtoint ptr %t2469 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_522" to i64), ptr %t2469
  %t2471 = getelementptr i64, ptr %t2469, i64 1
  store i64 %a0, ptr %t2471
  %t2472 = getelementptr i64, ptr %t2469, i64 2
  store i64 %t2463, ptr %t2472
  %t2473 = or i64 %t2470, 4
  %t2474 = load i64, ptr @"scheme.base:dynamic-wind"
  %t2475 = and i64 %t2474, -8
  %t2476 = inttoptr i64 %t2475 to ptr
  %t2477 = load i64, ptr %t2476
  %t2478 = inttoptr i64 %t2477 to ptr
  %t2479 = musttail call fastcc i64 %t2478(i64 %t2474, i64 3, i64 %t2468, i64 %a2, i64 %t2473, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2479
}

define fastcc i64 @"scheme.base:code_532"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2484 = icmp eq i64 %argc, 2
  br i1 %t2484, label %argok623, label %arityerr622
arityerr622:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok623:
  %t2485 = call i64 @rt_null_p(i64 %a0)
  %t2486 = icmp ne i64 %t2485, 1
  br i1 %t2486, label %then624, label %else625
then624:
  %t2487 = and i64 %self, -8
  %t2488 = inttoptr i64 %t2487 to ptr
  %t2489 = getelementptr i64, ptr %t2488, i64 1
  %t2490 = load i64, ptr %t2489
  ret i64 %t2490
else625:
  %t2491 = and i64 %self, -8
  %t2492 = inttoptr i64 %t2491 to ptr
  %t2493 = getelementptr i64, ptr %t2492, i64 1
  %t2494 = load i64, ptr %t2493
  %t2495 = call i64 @rt_car(i64 %a0)
  %t2496 = call i64 @rt_vector_set(i64 %t2494, i64 %a1, i64 %t2495)
  %t2497 = call i64 @rt_cdr(i64 %a0)
  %t2498 = or i64 %a1, 8
  %t2499 = and i64 %t2498, 7
  %t2500 = icmp eq i64 %t2499, 0
  br i1 %t2500, label %fixfast626, label %fixslow627
fixfast626:
  %t2501 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t2502 = extractvalue {i64, i1} %t2501, 0
  %t2503 = extractvalue {i64, i1} %t2501, 1
  br i1 %t2503, label %fixslow627, label %fixmerge628
fixslow627:
  %t2504 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge628
fixmerge628:
  %t2505 = phi i64 [ %t2502, %fixfast626 ], [ %t2504, %fixslow627 ]
  %t2506 = musttail call fastcc i64 @"scheme.base:code_532"(i64 %self, i64 2, i64 %t2497, i64 %t2505, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2506
}

define fastcc i64 @"scheme.base:code:list->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2507 = icmp eq i64 %argc, 1
  br i1 %t2507, label %argok630, label %arityerr629
arityerr629:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok630:
  %t2508 = load i64, ptr @"scheme.base:length"
  %t2509 = and i64 %t2508, -8
  %t2510 = inttoptr i64 %t2509 to ptr
  %t2511 = load i64, ptr %t2510
  %t2512 = inttoptr i64 %t2511 to ptr
  %t2513 = call fastcc i64%t2512(i64 %t2508, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2514 = call i64 @rt_make_vector(i64 %t2513, i64 0)
  %t2515 = call ptr @rt_alloc_words(i64 3)
  %t2516 = ptrtoint ptr %t2515 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_532" to i64), ptr %t2515
  %t2517 = or i64 %t2516, 4
  %t2518 = getelementptr i64, ptr %t2515, i64 1
  store i64 %t2514, ptr %t2518
  %t2519 = getelementptr i64, ptr %t2515, i64 2
  store i64 %t2517, ptr %t2519
  %t2520 = musttail call fastcc i64 @"scheme.base:code_532"(i64 %t2517, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2520
}

define fastcc i64 @"scheme.base:code:vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2525 = icmp sge i64 %argc, 0
  br i1 %t2525, label %argok632, label %arityerr631
arityerr631:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok632:
  %t2526 = call ptr @rt_alloc_words(i64 8)
  %t2527 = getelementptr i64, ptr %t2526, i64 0
  store i64 %a0, ptr %t2527
  %t2528 = getelementptr i64, ptr %t2526, i64 1
  store i64 %a1, ptr %t2528
  %t2529 = getelementptr i64, ptr %t2526, i64 2
  store i64 %a2, ptr %t2529
  %t2530 = getelementptr i64, ptr %t2526, i64 3
  store i64 %a3, ptr %t2530
  %t2531 = getelementptr i64, ptr %t2526, i64 4
  store i64 %a4, ptr %t2531
  %t2532 = getelementptr i64, ptr %t2526, i64 5
  store i64 %a5, ptr %t2532
  %t2533 = getelementptr i64, ptr %t2526, i64 6
  store i64 %a6, ptr %t2533
  %t2534 = getelementptr i64, ptr %t2526, i64 7
  store i64 %a7, ptr %t2534
  %t2535 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2526, ptr %overflow)
  %t2536 = load i64, ptr @"scheme.base:list->vector"
  %t2537 = and i64 %t2536, -8
  %t2538 = inttoptr i64 %t2537 to ptr
  %t2539 = load i64, ptr %t2538
  %t2540 = inttoptr i64 %t2539 to ptr
  %t2541 = musttail call fastcc i64 %t2540(i64 %t2536, i64 1, i64 %t2535, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2541
}

define fastcc i64 @"scheme.base:code_542"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2546 = icmp eq i64 %argc, 2
  br i1 %t2546, label %argok634, label %arityerr633
arityerr633:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok634:
  %t2547 = call i64 @rt_null_p(i64 %a0)
  %t2548 = icmp ne i64 %t2547, 1
  br i1 %t2548, label %then635, label %else636
then635:
  %t2549 = and i64 %self, -8
  %t2550 = inttoptr i64 %t2549 to ptr
  %t2551 = getelementptr i64, ptr %t2550, i64 1
  %t2552 = load i64, ptr %t2551
  ret i64 %t2552
else636:
  %t2553 = and i64 %self, -8
  %t2554 = inttoptr i64 %t2553 to ptr
  %t2555 = getelementptr i64, ptr %t2554, i64 1
  %t2556 = load i64, ptr %t2555
  %t2557 = call i64 @rt_car(i64 %a0)
  %t2558 = call i64 @rt_bytevector_u8_set(i64 %t2556, i64 %a1, i64 %t2557)
  %t2559 = call i64 @rt_cdr(i64 %a0)
  %t2560 = or i64 %a1, 8
  %t2561 = and i64 %t2560, 7
  %t2562 = icmp eq i64 %t2561, 0
  br i1 %t2562, label %fixfast637, label %fixslow638
fixfast637:
  %t2563 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t2564 = extractvalue {i64, i1} %t2563, 0
  %t2565 = extractvalue {i64, i1} %t2563, 1
  br i1 %t2565, label %fixslow638, label %fixmerge639
fixslow638:
  %t2566 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge639
fixmerge639:
  %t2567 = phi i64 [ %t2564, %fixfast637 ], [ %t2566, %fixslow638 ]
  %t2568 = musttail call fastcc i64 @"scheme.base:code_542"(i64 %self, i64 2, i64 %t2559, i64 %t2567, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2568
}

define fastcc i64 @"scheme.base:code:list->bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2569 = icmp eq i64 %argc, 1
  br i1 %t2569, label %argok641, label %arityerr640
arityerr640:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok641:
  %t2570 = load i64, ptr @"scheme.base:length"
  %t2571 = and i64 %t2570, -8
  %t2572 = inttoptr i64 %t2571 to ptr
  %t2573 = load i64, ptr %t2572
  %t2574 = inttoptr i64 %t2573 to ptr
  %t2575 = call fastcc i64%t2574(i64 %t2570, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2576 = call i64 @rt_make_bytevector(i64 %t2575, i64 0)
  %t2577 = call ptr @rt_alloc_words(i64 3)
  %t2578 = ptrtoint ptr %t2577 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_542" to i64), ptr %t2577
  %t2579 = or i64 %t2578, 4
  %t2580 = getelementptr i64, ptr %t2577, i64 1
  store i64 %t2576, ptr %t2580
  %t2581 = getelementptr i64, ptr %t2577, i64 2
  store i64 %t2579, ptr %t2581
  %t2582 = musttail call fastcc i64 @"scheme.base:code_542"(i64 %t2579, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2582
}

define fastcc i64 @"scheme.base:code:bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2587 = icmp sge i64 %argc, 0
  br i1 %t2587, label %argok643, label %arityerr642
arityerr642:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok643:
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
  %t2597 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2588, ptr %overflow)
  %t2598 = load i64, ptr @"scheme.base:list->bytevector"
  %t2599 = and i64 %t2598, -8
  %t2600 = inttoptr i64 %t2599 to ptr
  %t2601 = load i64, ptr %t2600
  %t2602 = inttoptr i64 %t2601 to ptr
  %t2603 = musttail call fastcc i64 %t2602(i64 %t2598, i64 1, i64 %t2597, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2603
}

define fastcc i64 @"scheme.base:code:rng-start"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2608 = icmp eq i64 %argc, 1
  br i1 %t2608, label %argok645, label %arityerr644
arityerr644:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok645:
  %t2609 = call i64 @rt_pair_p(i64 %a0)
  %t2610 = icmp ne i64 %t2609, 1
  br i1 %t2610, label %then646, label %else647
then646:
  %t2611 = call i64 @rt_car(i64 %a0)
  ret i64 %t2611
else647:
  ret i64 0
}

define fastcc i64 @"scheme.base:code:rng-end"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2616 = icmp eq i64 %argc, 2
  br i1 %t2616, label %argok649, label %arityerr648
arityerr648:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok649:
  %t2617 = call i64 @rt_pair_p(i64 %a0)
  %t2618 = icmp ne i64 %t2617, 1
  br i1 %t2618, label %then650, label %else651
then650:
  %t2619 = call i64 @rt_cdr(i64 %a0)
  %t2620 = call i64 @rt_pair_p(i64 %t2619)
  br label %merge652
else651:
  br label %merge652
merge652:
  %t2621 = phi i64 [ %t2620, %then650 ], [ 1, %else651 ]
  %t2622 = icmp ne i64 %t2621, 1
  br i1 %t2622, label %then653, label %else654
then653:
  %t2623 = call i64 @rt_cdr(i64 %a0)
  %t2624 = call i64 @rt_car(i64 %t2623)
  ret i64 %t2624
else654:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:rng-check"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2629 = icmp eq i64 %argc, 4
  br i1 %t2629, label %argok656, label %arityerr655
arityerr655:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok656:
  %t2630 = or i64 0, %a1
  %t2631 = and i64 %t2630, 7
  %t2632 = icmp eq i64 %t2631, 0
  br i1 %t2632, label %fixfast657, label %fixslow658
fixfast657:
  %t2633 = icmp slt i64 0, %a1
  %t2634 = select i1 %t2633, i64 257, i64 1
  br label %fixmerge659
fixslow658:
  %t2635 = call i64 @rt_lt(i64 0, i64 %a1)
  br label %fixmerge659
fixmerge659:
  %t2636 = phi i64 [ %t2634, %fixfast657 ], [ %t2635, %fixslow658 ]
  %t2637 = icmp ne i64 %t2636, 1
  br i1 %t2637, label %then660, label %else661
then660:
  br label %merge662
else661:
  %t2638 = or i64 0, %a1
  %t2639 = and i64 %t2638, 7
  %t2640 = icmp eq i64 %t2639, 0
  br i1 %t2640, label %fixfast663, label %fixslow664
fixfast663:
  %t2641 = icmp eq i64 0, %a1
  %t2642 = select i1 %t2641, i64 257, i64 1
  br label %fixmerge665
fixslow664:
  %t2643 = call i64 @rt_num_eq(i64 0, i64 %a1)
  br label %fixmerge665
fixmerge665:
  %t2644 = phi i64 [ %t2642, %fixfast663 ], [ %t2643, %fixslow664 ]
  br label %merge662
merge662:
  %t2645 = phi i64 [ 257, %then660 ], [ %t2644, %fixmerge665 ]
  %t2646 = icmp ne i64 %t2645, 1
  br i1 %t2646, label %then666, label %else667
then666:
  %t2647 = or i64 %a1, %a2
  %t2648 = and i64 %t2647, 7
  %t2649 = icmp eq i64 %t2648, 0
  br i1 %t2649, label %fixfast669, label %fixslow670
fixfast669:
  %t2650 = icmp slt i64 %a1, %a2
  %t2651 = select i1 %t2650, i64 257, i64 1
  br label %fixmerge671
fixslow670:
  %t2652 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge671
fixmerge671:
  %t2653 = phi i64 [ %t2651, %fixfast669 ], [ %t2652, %fixslow670 ]
  %t2654 = icmp ne i64 %t2653, 1
  br i1 %t2654, label %then672, label %else673
then672:
  br label %merge674
else673:
  %t2655 = or i64 %a1, %a2
  %t2656 = and i64 %t2655, 7
  %t2657 = icmp eq i64 %t2656, 0
  br i1 %t2657, label %fixfast675, label %fixslow676
fixfast675:
  %t2658 = icmp eq i64 %a1, %a2
  %t2659 = select i1 %t2658, i64 257, i64 1
  br label %fixmerge677
fixslow676:
  %t2660 = call i64 @rt_num_eq(i64 %a1, i64 %a2)
  br label %fixmerge677
fixmerge677:
  %t2661 = phi i64 [ %t2659, %fixfast675 ], [ %t2660, %fixslow676 ]
  br label %merge674
merge674:
  %t2662 = phi i64 [ 257, %then672 ], [ %t2661, %fixmerge677 ]
  %t2663 = icmp ne i64 %t2662, 1
  br i1 %t2663, label %then678, label %else679
then678:
  %t2664 = or i64 %a2, %a3
  %t2665 = and i64 %t2664, 7
  %t2666 = icmp eq i64 %t2665, 0
  br i1 %t2666, label %fixfast681, label %fixslow682
fixfast681:
  %t2667 = icmp slt i64 %a2, %a3
  %t2668 = select i1 %t2667, i64 257, i64 1
  br label %fixmerge683
fixslow682:
  %t2669 = call i64 @rt_lt(i64 %a2, i64 %a3)
  br label %fixmerge683
fixmerge683:
  %t2670 = phi i64 [ %t2668, %fixfast681 ], [ %t2669, %fixslow682 ]
  %t2671 = icmp ne i64 %t2670, 1
  br i1 %t2671, label %then684, label %else685
then684:
  br label %merge686
else685:
  %t2672 = or i64 %a2, %a3
  %t2673 = and i64 %t2672, 7
  %t2674 = icmp eq i64 %t2673, 0
  br i1 %t2674, label %fixfast687, label %fixslow688
fixfast687:
  %t2675 = icmp eq i64 %a2, %a3
  %t2676 = select i1 %t2675, i64 257, i64 1
  br label %fixmerge689
fixslow688:
  %t2677 = call i64 @rt_num_eq(i64 %a2, i64 %a3)
  br label %fixmerge689
fixmerge689:
  %t2678 = phi i64 [ %t2676, %fixfast687 ], [ %t2677, %fixslow688 ]
  br label %merge686
merge686:
  %t2679 = phi i64 [ 257, %then684 ], [ %t2678, %fixmerge689 ]
  br label %merge680
else679:
  br label %merge680
merge680:
  %t2680 = phi i64 [ %t2679, %merge686 ], [ 1, %else679 ]
  br label %merge668
else667:
  br label %merge668
merge668:
  %t2681 = phi i64 [ %t2680, %merge680 ], [ 1, %else667 ]
  %t2682 = icmp ne i64 %t2681, 1
  br i1 %t2682, label %then690, label %else691
then690:
  ret i64 257
else691:
  %t2683 = call i64 @rt_make_string(ptr @.str.lit.13, i64 19)
  %t2684 = load i64, ptr @"scheme.base:error"
  %t2685 = and i64 %t2684, -8
  %t2686 = inttoptr i64 %t2685 to ptr
  %t2687 = load i64, ptr %t2686
  %t2688 = inttoptr i64 %t2687 to ptr
  %t2689 = musttail call fastcc i64 %t2688(i64 %t2684, i64 5, i64 %t2683, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2689
}

define fastcc i64 @"scheme.base:code:assv"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2694 = icmp eq i64 %argc, 2
  br i1 %t2694, label %argok693, label %arityerr692
arityerr692:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok693:
  %t2695 = call i64 @rt_null_p(i64 %a1)
  %t2696 = icmp ne i64 %t2695, 1
  br i1 %t2696, label %then694, label %else695
then694:
  ret i64 1
else695:
  %t2697 = call i64 @rt_car(i64 %a1)
  %t2698 = call i64 @rt_car(i64 %t2697)
  %t2699 = call i64 @rt_eqv_p(i64 %a0, i64 %t2698)
  %t2700 = icmp ne i64 %t2699, 1
  br i1 %t2700, label %then696, label %else697
then696:
  %t2701 = call i64 @rt_car(i64 %a1)
  ret i64 %t2701
else697:
  %t2702 = call i64 @rt_cdr(i64 %a1)
  %t2703 = load i64, ptr @"scheme.base:assv"
  %t2704 = and i64 %t2703, -8
  %t2705 = inttoptr i64 %t2704 to ptr
  %t2706 = load i64, ptr %t2705
  %t2707 = inttoptr i64 %t2706 to ptr
  %t2708 = musttail call fastcc i64 %t2707(i64 %t2703, i64 2, i64 %a0, i64 %t2702, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2708
}

define fastcc i64 @"scheme.base:code:list-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2713 = icmp eq i64 %argc, 1
  br i1 %t2713, label %argok699, label %arityerr698
arityerr698:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok699:
  %t2714 = call i64 @rt_pair_p(i64 %a0)
  %t2715 = icmp ne i64 %t2714, 1
  br i1 %t2715, label %then700, label %else701
then700:
  %t2716 = call i64 @rt_car(i64 %a0)
  %t2717 = call i64 @rt_cdr(i64 %a0)
  %t2718 = load i64, ptr @"scheme.base:list-copy"
  %t2719 = and i64 %t2718, -8
  %t2720 = inttoptr i64 %t2719 to ptr
  %t2721 = load i64, ptr %t2720
  %t2722 = inttoptr i64 %t2721 to ptr
  %t2723 = call fastcc i64%t2722(i64 %t2718, i64 1, i64 %t2717, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2724 = call i64 @rt_cons(i64 %t2716, i64 %t2723)
  ret i64 %t2724
else701:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:boolean=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2729 = icmp sge i64 %argc, 2
  br i1 %t2729, label %argok703, label %arityerr702
arityerr702:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok703:
  %t2730 = call ptr @rt_alloc_words(i64 8)
  %t2731 = getelementptr i64, ptr %t2730, i64 0
  store i64 %a0, ptr %t2731
  %t2732 = getelementptr i64, ptr %t2730, i64 1
  store i64 %a1, ptr %t2732
  %t2733 = getelementptr i64, ptr %t2730, i64 2
  store i64 %a2, ptr %t2733
  %t2734 = getelementptr i64, ptr %t2730, i64 3
  store i64 %a3, ptr %t2734
  %t2735 = getelementptr i64, ptr %t2730, i64 4
  store i64 %a4, ptr %t2735
  %t2736 = getelementptr i64, ptr %t2730, i64 5
  store i64 %a5, ptr %t2736
  %t2737 = getelementptr i64, ptr %t2730, i64 6
  store i64 %a6, ptr %t2737
  %t2738 = getelementptr i64, ptr %t2730, i64 7
  store i64 %a7, ptr %t2738
  %t2739 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t2730, ptr %overflow)
  %t2740 = call i64 @rt_cons(i64 %a1, i64 %t2739)
  %t2741 = load i64, ptr @"scheme.base:eqv-chain?"
  %t2742 = and i64 %t2741, -8
  %t2743 = inttoptr i64 %t2742 to ptr
  %t2744 = load i64, ptr %t2743
  %t2745 = inttoptr i64 %t2744 to ptr
  %t2746 = musttail call fastcc i64 %t2745(i64 %t2741, i64 2, i64 %a0, i64 %t2740, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2746
}

define fastcc i64 @"scheme.base:code:symbol=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2751 = icmp sge i64 %argc, 2
  br i1 %t2751, label %argok705, label %arityerr704
arityerr704:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok705:
  %t2752 = call ptr @rt_alloc_words(i64 8)
  %t2753 = getelementptr i64, ptr %t2752, i64 0
  store i64 %a0, ptr %t2753
  %t2754 = getelementptr i64, ptr %t2752, i64 1
  store i64 %a1, ptr %t2754
  %t2755 = getelementptr i64, ptr %t2752, i64 2
  store i64 %a2, ptr %t2755
  %t2756 = getelementptr i64, ptr %t2752, i64 3
  store i64 %a3, ptr %t2756
  %t2757 = getelementptr i64, ptr %t2752, i64 4
  store i64 %a4, ptr %t2757
  %t2758 = getelementptr i64, ptr %t2752, i64 5
  store i64 %a5, ptr %t2758
  %t2759 = getelementptr i64, ptr %t2752, i64 6
  store i64 %a6, ptr %t2759
  %t2760 = getelementptr i64, ptr %t2752, i64 7
  store i64 %a7, ptr %t2760
  %t2761 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t2752, ptr %overflow)
  %t2762 = call i64 @rt_cons(i64 %a1, i64 %t2761)
  %t2763 = load i64, ptr @"scheme.base:eqv-chain?"
  %t2764 = and i64 %t2763, -8
  %t2765 = inttoptr i64 %t2764 to ptr
  %t2766 = load i64, ptr %t2765
  %t2767 = inttoptr i64 %t2766 to ptr
  %t2768 = musttail call fastcc i64 %t2767(i64 %t2763, i64 2, i64 %a0, i64 %t2762, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2768
}

define fastcc i64 @"scheme.base:code:eqv-chain?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2773 = icmp eq i64 %argc, 2
  br i1 %t2773, label %argok707, label %arityerr706
arityerr706:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok707:
  %t2774 = call i64 @rt_null_p(i64 %a1)
  %t2775 = icmp ne i64 %t2774, 1
  br i1 %t2775, label %then708, label %else709
then708:
  ret i64 257
else709:
  %t2776 = call i64 @rt_car(i64 %a1)
  %t2777 = call i64 @rt_eqv_p(i64 %a0, i64 %t2776)
  %t2778 = icmp ne i64 %t2777, 1
  br i1 %t2778, label %then710, label %else711
then710:
  %t2779 = call i64 @rt_car(i64 %a1)
  %t2780 = call i64 @rt_cdr(i64 %a1)
  %t2781 = load i64, ptr @"scheme.base:eqv-chain?"
  %t2782 = and i64 %t2781, -8
  %t2783 = inttoptr i64 %t2782 to ptr
  %t2784 = load i64, ptr %t2783
  %t2785 = inttoptr i64 %t2784 to ptr
  %t2786 = musttail call fastcc i64 %t2785(i64 %t2781, i64 2, i64 %t2779, i64 %t2780, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2786
else711:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_625"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2791 = icmp eq i64 %argc, 1
  br i1 %t2791, label %argok713, label %arityerr712
arityerr712:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok713:
  %t2792 = and i64 %self, -8
  %t2793 = inttoptr i64 %t2792 to ptr
  %t2794 = getelementptr i64, ptr %t2793, i64 1
  %t2795 = load i64, ptr %t2794
  %t2796 = or i64 %a0, %t2795
  %t2797 = and i64 %t2796, 7
  %t2798 = icmp eq i64 %t2797, 0
  br i1 %t2798, label %fixfast714, label %fixslow715
fixfast714:
  %t2799 = icmp eq i64 %a0, %t2795
  %t2800 = select i1 %t2799, i64 257, i64 1
  br label %fixmerge716
fixslow715:
  %t2801 = call i64 @rt_num_eq(i64 %a0, i64 %t2795)
  br label %fixmerge716
fixmerge716:
  %t2802 = phi i64 [ %t2800, %fixfast714 ], [ %t2801, %fixslow715 ]
  %t2803 = icmp ne i64 %t2802, 1
  br i1 %t2803, label %then717, label %else718
then717:
  %t2804 = and i64 %self, -8
  %t2805 = inttoptr i64 %t2804 to ptr
  %t2806 = getelementptr i64, ptr %t2805, i64 2
  %t2807 = load i64, ptr %t2806
  %t2808 = or i64 %a0, %t2807
  %t2809 = and i64 %t2808, 7
  %t2810 = icmp eq i64 %t2809, 0
  br i1 %t2810, label %fixfast720, label %fixslow721
fixfast720:
  %t2811 = icmp eq i64 %a0, %t2807
  %t2812 = select i1 %t2811, i64 257, i64 1
  br label %fixmerge722
fixslow721:
  %t2813 = call i64 @rt_num_eq(i64 %a0, i64 %t2807)
  br label %fixmerge722
fixmerge722:
  %t2814 = phi i64 [ %t2812, %fixfast720 ], [ %t2813, %fixslow721 ]
  br label %merge719
else718:
  br label %merge719
merge719:
  %t2815 = phi i64 [ %t2814, %fixmerge722 ], [ 1, %else718 ]
  %t2816 = icmp ne i64 %t2815, 1
  br i1 %t2816, label %then723, label %else724
then723:
  ret i64 0
else724:
  %t2817 = and i64 %self, -8
  %t2818 = inttoptr i64 %t2817 to ptr
  %t2819 = getelementptr i64, ptr %t2818, i64 1
  %t2820 = load i64, ptr %t2819
  %t2821 = or i64 %a0, %t2820
  %t2822 = and i64 %t2821, 7
  %t2823 = icmp eq i64 %t2822, 0
  br i1 %t2823, label %fixfast725, label %fixslow726
fixfast725:
  %t2824 = icmp eq i64 %a0, %t2820
  %t2825 = select i1 %t2824, i64 257, i64 1
  br label %fixmerge727
fixslow726:
  %t2826 = call i64 @rt_num_eq(i64 %a0, i64 %t2820)
  br label %fixmerge727
fixmerge727:
  %t2827 = phi i64 [ %t2825, %fixfast725 ], [ %t2826, %fixslow726 ]
  %t2828 = icmp ne i64 %t2827, 1
  br i1 %t2828, label %then728, label %else729
then728:
  ret i64 -8
else729:
  %t2829 = and i64 %self, -8
  %t2830 = inttoptr i64 %t2829 to ptr
  %t2831 = getelementptr i64, ptr %t2830, i64 2
  %t2832 = load i64, ptr %t2831
  %t2833 = or i64 %a0, %t2832
  %t2834 = and i64 %t2833, 7
  %t2835 = icmp eq i64 %t2834, 0
  br i1 %t2835, label %fixfast730, label %fixslow731
fixfast730:
  %t2836 = icmp eq i64 %a0, %t2832
  %t2837 = select i1 %t2836, i64 257, i64 1
  br label %fixmerge732
fixslow731:
  %t2838 = call i64 @rt_num_eq(i64 %a0, i64 %t2832)
  br label %fixmerge732
fixmerge732:
  %t2839 = phi i64 [ %t2837, %fixfast730 ], [ %t2838, %fixslow731 ]
  %t2840 = icmp ne i64 %t2839, 1
  br i1 %t2840, label %then733, label %else734
then733:
  ret i64 8
else734:
  %t2841 = and i64 %self, -8
  %t2842 = inttoptr i64 %t2841 to ptr
  %t2843 = getelementptr i64, ptr %t2842, i64 3
  %t2844 = load i64, ptr %t2843
  %t2845 = call i64 @rt_string_ref(i64 %t2844, i64 %a0)
  %t2846 = call i64 @rt_char_to_integer(i64 %t2845)
  %t2847 = and i64 %self, -8
  %t2848 = inttoptr i64 %t2847 to ptr
  %t2849 = getelementptr i64, ptr %t2848, i64 4
  %t2850 = load i64, ptr %t2849
  %t2851 = call i64 @rt_string_ref(i64 %t2850, i64 %a0)
  %t2852 = call i64 @rt_char_to_integer(i64 %t2851)
  %t2853 = or i64 %t2846, %t2852
  %t2854 = and i64 %t2853, 7
  %t2855 = icmp eq i64 %t2854, 0
  br i1 %t2855, label %fixfast735, label %fixslow736
fixfast735:
  %t2856 = icmp slt i64 %t2846, %t2852
  %t2857 = select i1 %t2856, i64 257, i64 1
  br label %fixmerge737
fixslow736:
  %t2858 = call i64 @rt_lt(i64 %t2846, i64 %t2852)
  br label %fixmerge737
fixmerge737:
  %t2859 = phi i64 [ %t2857, %fixfast735 ], [ %t2858, %fixslow736 ]
  %t2860 = icmp ne i64 %t2859, 1
  br i1 %t2860, label %then738, label %else739
then738:
  ret i64 -8
else739:
  %t2861 = or i64 %t2852, %t2846
  %t2862 = and i64 %t2861, 7
  %t2863 = icmp eq i64 %t2862, 0
  br i1 %t2863, label %fixfast740, label %fixslow741
fixfast740:
  %t2864 = icmp slt i64 %t2852, %t2846
  %t2865 = select i1 %t2864, i64 257, i64 1
  br label %fixmerge742
fixslow741:
  %t2866 = call i64 @rt_lt(i64 %t2852, i64 %t2846)
  br label %fixmerge742
fixmerge742:
  %t2867 = phi i64 [ %t2865, %fixfast740 ], [ %t2866, %fixslow741 ]
  %t2868 = icmp ne i64 %t2867, 1
  br i1 %t2868, label %then743, label %else744
then743:
  ret i64 8
else744:
  %t2869 = or i64 %a0, 8
  %t2870 = and i64 %t2869, 7
  %t2871 = icmp eq i64 %t2870, 0
  br i1 %t2871, label %fixfast745, label %fixslow746
fixfast745:
  %t2872 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t2873 = extractvalue {i64, i1} %t2872, 0
  %t2874 = extractvalue {i64, i1} %t2872, 1
  br i1 %t2874, label %fixslow746, label %fixmerge747
fixslow746:
  %t2875 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge747
fixmerge747:
  %t2876 = phi i64 [ %t2873, %fixfast745 ], [ %t2875, %fixslow746 ]
  %t2877 = musttail call fastcc i64 @"scheme.base:code_625"(i64 %self, i64 1, i64 %t2876, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2877
}

define fastcc i64 @"scheme.base:code:str-cmp"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2878 = icmp eq i64 %argc, 2
  br i1 %t2878, label %argok749, label %arityerr748
arityerr748:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok749:
  %t2879 = call i64 @rt_string_length(i64 %a0)
  %t2880 = call i64 @rt_string_length(i64 %a1)
  %t2881 = call ptr @rt_alloc_words(i64 6)
  %t2882 = ptrtoint ptr %t2881 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_625" to i64), ptr %t2881
  %t2883 = or i64 %t2882, 4
  %t2884 = getelementptr i64, ptr %t2881, i64 1
  store i64 %t2879, ptr %t2884
  %t2885 = getelementptr i64, ptr %t2881, i64 2
  store i64 %t2880, ptr %t2885
  %t2886 = getelementptr i64, ptr %t2881, i64 3
  store i64 %a0, ptr %t2886
  %t2887 = getelementptr i64, ptr %t2881, i64 4
  store i64 %a1, ptr %t2887
  %t2888 = getelementptr i64, ptr %t2881, i64 5
  store i64 %t2883, ptr %t2888
  %t2889 = musttail call fastcc i64 @"scheme.base:code_625"(i64 %t2883, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2889
}

define fastcc i64 @"scheme.base:code:str-chain?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2894 = icmp eq i64 %argc, 3
  br i1 %t2894, label %argok751, label %arityerr750
arityerr750:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok751:
  %t2895 = call i64 @rt_null_p(i64 %a2)
  %t2896 = icmp ne i64 %t2895, 1
  br i1 %t2896, label %then752, label %else753
then752:
  ret i64 257
else753:
  %t2897 = call i64 @rt_car(i64 %a2)
  %t2898 = and i64 %a0, -8
  %t2899 = inttoptr i64 %t2898 to ptr
  %t2900 = load i64, ptr %t2899
  %t2901 = inttoptr i64 %t2900 to ptr
  %t2902 = call fastcc i64%t2901(i64 %a0, i64 2, i64 %a1, i64 %t2897, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2903 = icmp ne i64 %t2902, 1
  br i1 %t2903, label %then754, label %else755
then754:
  %t2904 = call i64 @rt_car(i64 %a2)
  %t2905 = call i64 @rt_cdr(i64 %a2)
  %t2906 = load i64, ptr @"scheme.base:str-chain?"
  %t2907 = and i64 %t2906, -8
  %t2908 = inttoptr i64 %t2907 to ptr
  %t2909 = load i64, ptr %t2908
  %t2910 = inttoptr i64 %t2909 to ptr
  %t2911 = musttail call fastcc i64 %t2910(i64 %t2906, i64 3, i64 %a0, i64 %t2904, i64 %t2905, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2911
else755:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_641"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2916 = icmp eq i64 %argc, 2
  br i1 %t2916, label %argok757, label %arityerr756
arityerr756:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok757:
  %t2917 = load i64, ptr @"scheme.base:str-cmp"
  %t2918 = and i64 %t2917, -8
  %t2919 = inttoptr i64 %t2918 to ptr
  %t2920 = load i64, ptr %t2919
  %t2921 = inttoptr i64 %t2920 to ptr
  %t2922 = call fastcc i64%t2921(i64 %t2917, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2923 = or i64 %t2922, 0
  %t2924 = and i64 %t2923, 7
  %t2925 = icmp eq i64 %t2924, 0
  br i1 %t2925, label %fixfast758, label %fixslow759
fixfast758:
  %t2926 = icmp slt i64 %t2922, 0
  %t2927 = select i1 %t2926, i64 257, i64 1
  br label %fixmerge760
fixslow759:
  %t2928 = call i64 @rt_lt(i64 %t2922, i64 0)
  br label %fixmerge760
fixmerge760:
  %t2929 = phi i64 [ %t2927, %fixfast758 ], [ %t2928, %fixslow759 ]
  ret i64 %t2929
}

define fastcc i64 @"scheme.base:code:string<?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2930 = icmp sge i64 %argc, 2
  br i1 %t2930, label %argok762, label %arityerr761
arityerr761:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok762:
  %t2931 = call ptr @rt_alloc_words(i64 8)
  %t2932 = getelementptr i64, ptr %t2931, i64 0
  store i64 %a0, ptr %t2932
  %t2933 = getelementptr i64, ptr %t2931, i64 1
  store i64 %a1, ptr %t2933
  %t2934 = getelementptr i64, ptr %t2931, i64 2
  store i64 %a2, ptr %t2934
  %t2935 = getelementptr i64, ptr %t2931, i64 3
  store i64 %a3, ptr %t2935
  %t2936 = getelementptr i64, ptr %t2931, i64 4
  store i64 %a4, ptr %t2936
  %t2937 = getelementptr i64, ptr %t2931, i64 5
  store i64 %a5, ptr %t2937
  %t2938 = getelementptr i64, ptr %t2931, i64 6
  store i64 %a6, ptr %t2938
  %t2939 = getelementptr i64, ptr %t2931, i64 7
  store i64 %a7, ptr %t2939
  %t2940 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t2931, ptr %overflow)
  %t2941 = call ptr @rt_alloc_words(i64 1)
  %t2942 = ptrtoint ptr %t2941 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_641" to i64), ptr %t2941
  %t2943 = or i64 %t2942, 4
  %t2944 = call i64 @rt_cons(i64 %a1, i64 %t2940)
  %t2945 = load i64, ptr @"scheme.base:str-chain?"
  %t2946 = and i64 %t2945, -8
  %t2947 = inttoptr i64 %t2946 to ptr
  %t2948 = load i64, ptr %t2947
  %t2949 = inttoptr i64 %t2948 to ptr
  %t2950 = musttail call fastcc i64 %t2949(i64 %t2945, i64 3, i64 %t2943, i64 %a0, i64 %t2944, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2950
}

define fastcc i64 @"scheme.base:code_653"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2955 = icmp eq i64 %argc, 2
  br i1 %t2955, label %argok764, label %arityerr763
arityerr763:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok764:
  %t2956 = load i64, ptr @"scheme.base:str-cmp"
  %t2957 = and i64 %t2956, -8
  %t2958 = inttoptr i64 %t2957 to ptr
  %t2959 = load i64, ptr %t2958
  %t2960 = inttoptr i64 %t2959 to ptr
  %t2961 = call fastcc i64%t2960(i64 %t2956, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2962 = or i64 0, %t2961
  %t2963 = and i64 %t2962, 7
  %t2964 = icmp eq i64 %t2963, 0
  br i1 %t2964, label %fixfast765, label %fixslow766
fixfast765:
  %t2965 = icmp slt i64 0, %t2961
  %t2966 = select i1 %t2965, i64 257, i64 1
  br label %fixmerge767
fixslow766:
  %t2967 = call i64 @rt_lt(i64 0, i64 %t2961)
  br label %fixmerge767
fixmerge767:
  %t2968 = phi i64 [ %t2966, %fixfast765 ], [ %t2967, %fixslow766 ]
  ret i64 %t2968
}

define fastcc i64 @"scheme.base:code:string>?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2969 = icmp sge i64 %argc, 2
  br i1 %t2969, label %argok769, label %arityerr768
arityerr768:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok769:
  %t2970 = call ptr @rt_alloc_words(i64 8)
  %t2971 = getelementptr i64, ptr %t2970, i64 0
  store i64 %a0, ptr %t2971
  %t2972 = getelementptr i64, ptr %t2970, i64 1
  store i64 %a1, ptr %t2972
  %t2973 = getelementptr i64, ptr %t2970, i64 2
  store i64 %a2, ptr %t2973
  %t2974 = getelementptr i64, ptr %t2970, i64 3
  store i64 %a3, ptr %t2974
  %t2975 = getelementptr i64, ptr %t2970, i64 4
  store i64 %a4, ptr %t2975
  %t2976 = getelementptr i64, ptr %t2970, i64 5
  store i64 %a5, ptr %t2976
  %t2977 = getelementptr i64, ptr %t2970, i64 6
  store i64 %a6, ptr %t2977
  %t2978 = getelementptr i64, ptr %t2970, i64 7
  store i64 %a7, ptr %t2978
  %t2979 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t2970, ptr %overflow)
  %t2980 = call ptr @rt_alloc_words(i64 1)
  %t2981 = ptrtoint ptr %t2980 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_653" to i64), ptr %t2980
  %t2982 = or i64 %t2981, 4
  %t2983 = call i64 @rt_cons(i64 %a1, i64 %t2979)
  %t2984 = load i64, ptr @"scheme.base:str-chain?"
  %t2985 = and i64 %t2984, -8
  %t2986 = inttoptr i64 %t2985 to ptr
  %t2987 = load i64, ptr %t2986
  %t2988 = inttoptr i64 %t2987 to ptr
  %t2989 = musttail call fastcc i64 %t2988(i64 %t2984, i64 3, i64 %t2982, i64 %a0, i64 %t2983, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2989
}

define fastcc i64 @"scheme.base:code_665"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2994 = icmp eq i64 %argc, 2
  br i1 %t2994, label %argok771, label %arityerr770
arityerr770:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok771:
  %t2995 = load i64, ptr @"scheme.base:str-cmp"
  %t2996 = and i64 %t2995, -8
  %t2997 = inttoptr i64 %t2996 to ptr
  %t2998 = load i64, ptr %t2997
  %t2999 = inttoptr i64 %t2998 to ptr
  %t3000 = call fastcc i64%t2999(i64 %t2995, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3001 = or i64 0, %t3000
  %t3002 = and i64 %t3001, 7
  %t3003 = icmp eq i64 %t3002, 0
  br i1 %t3003, label %fixfast772, label %fixslow773
fixfast772:
  %t3004 = icmp slt i64 0, %t3000
  %t3005 = select i1 %t3004, i64 257, i64 1
  br label %fixmerge774
fixslow773:
  %t3006 = call i64 @rt_lt(i64 0, i64 %t3000)
  br label %fixmerge774
fixmerge774:
  %t3007 = phi i64 [ %t3005, %fixfast772 ], [ %t3006, %fixslow773 ]
  %t3008 = call i64 @rt_not(i64 %t3007)
  ret i64 %t3008
}

define fastcc i64 @"scheme.base:code:string<=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3009 = icmp sge i64 %argc, 2
  br i1 %t3009, label %argok776, label %arityerr775
arityerr775:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok776:
  %t3010 = call ptr @rt_alloc_words(i64 8)
  %t3011 = getelementptr i64, ptr %t3010, i64 0
  store i64 %a0, ptr %t3011
  %t3012 = getelementptr i64, ptr %t3010, i64 1
  store i64 %a1, ptr %t3012
  %t3013 = getelementptr i64, ptr %t3010, i64 2
  store i64 %a2, ptr %t3013
  %t3014 = getelementptr i64, ptr %t3010, i64 3
  store i64 %a3, ptr %t3014
  %t3015 = getelementptr i64, ptr %t3010, i64 4
  store i64 %a4, ptr %t3015
  %t3016 = getelementptr i64, ptr %t3010, i64 5
  store i64 %a5, ptr %t3016
  %t3017 = getelementptr i64, ptr %t3010, i64 6
  store i64 %a6, ptr %t3017
  %t3018 = getelementptr i64, ptr %t3010, i64 7
  store i64 %a7, ptr %t3018
  %t3019 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3010, ptr %overflow)
  %t3020 = call ptr @rt_alloc_words(i64 1)
  %t3021 = ptrtoint ptr %t3020 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_665" to i64), ptr %t3020
  %t3022 = or i64 %t3021, 4
  %t3023 = call i64 @rt_cons(i64 %a1, i64 %t3019)
  %t3024 = load i64, ptr @"scheme.base:str-chain?"
  %t3025 = and i64 %t3024, -8
  %t3026 = inttoptr i64 %t3025 to ptr
  %t3027 = load i64, ptr %t3026
  %t3028 = inttoptr i64 %t3027 to ptr
  %t3029 = musttail call fastcc i64 %t3028(i64 %t3024, i64 3, i64 %t3022, i64 %a0, i64 %t3023, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3029
}

define fastcc i64 @"scheme.base:code_677"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3034 = icmp eq i64 %argc, 2
  br i1 %t3034, label %argok778, label %arityerr777
arityerr777:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok778:
  %t3035 = load i64, ptr @"scheme.base:str-cmp"
  %t3036 = and i64 %t3035, -8
  %t3037 = inttoptr i64 %t3036 to ptr
  %t3038 = load i64, ptr %t3037
  %t3039 = inttoptr i64 %t3038 to ptr
  %t3040 = call fastcc i64%t3039(i64 %t3035, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3041 = or i64 %t3040, 0
  %t3042 = and i64 %t3041, 7
  %t3043 = icmp eq i64 %t3042, 0
  br i1 %t3043, label %fixfast779, label %fixslow780
fixfast779:
  %t3044 = icmp slt i64 %t3040, 0
  %t3045 = select i1 %t3044, i64 257, i64 1
  br label %fixmerge781
fixslow780:
  %t3046 = call i64 @rt_lt(i64 %t3040, i64 0)
  br label %fixmerge781
fixmerge781:
  %t3047 = phi i64 [ %t3045, %fixfast779 ], [ %t3046, %fixslow780 ]
  %t3048 = call i64 @rt_not(i64 %t3047)
  ret i64 %t3048
}

define fastcc i64 @"scheme.base:code:string>=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3049 = icmp sge i64 %argc, 2
  br i1 %t3049, label %argok783, label %arityerr782
arityerr782:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok783:
  %t3050 = call ptr @rt_alloc_words(i64 8)
  %t3051 = getelementptr i64, ptr %t3050, i64 0
  store i64 %a0, ptr %t3051
  %t3052 = getelementptr i64, ptr %t3050, i64 1
  store i64 %a1, ptr %t3052
  %t3053 = getelementptr i64, ptr %t3050, i64 2
  store i64 %a2, ptr %t3053
  %t3054 = getelementptr i64, ptr %t3050, i64 3
  store i64 %a3, ptr %t3054
  %t3055 = getelementptr i64, ptr %t3050, i64 4
  store i64 %a4, ptr %t3055
  %t3056 = getelementptr i64, ptr %t3050, i64 5
  store i64 %a5, ptr %t3056
  %t3057 = getelementptr i64, ptr %t3050, i64 6
  store i64 %a6, ptr %t3057
  %t3058 = getelementptr i64, ptr %t3050, i64 7
  store i64 %a7, ptr %t3058
  %t3059 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3050, ptr %overflow)
  %t3060 = call ptr @rt_alloc_words(i64 1)
  %t3061 = ptrtoint ptr %t3060 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_677" to i64), ptr %t3060
  %t3062 = or i64 %t3061, 4
  %t3063 = call i64 @rt_cons(i64 %a1, i64 %t3059)
  %t3064 = load i64, ptr @"scheme.base:str-chain?"
  %t3065 = and i64 %t3064, -8
  %t3066 = inttoptr i64 %t3065 to ptr
  %t3067 = load i64, ptr %t3066
  %t3068 = inttoptr i64 %t3067 to ptr
  %t3069 = musttail call fastcc i64 %t3068(i64 %t3064, i64 3, i64 %t3062, i64 %a0, i64 %t3063, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3069
}

define fastcc i64 @"scheme.base:code_692"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3074 = icmp eq i64 %argc, 2
  br i1 %t3074, label %argok785, label %arityerr784
arityerr784:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok785:
  %t3075 = and i64 %self, -8
  %t3076 = inttoptr i64 %t3075 to ptr
  %t3077 = getelementptr i64, ptr %t3076, i64 1
  %t3078 = load i64, ptr %t3077
  %t3079 = or i64 %a0, %t3078
  %t3080 = and i64 %t3079, 7
  %t3081 = icmp eq i64 %t3080, 0
  br i1 %t3081, label %fixfast786, label %fixslow787
fixfast786:
  %t3082 = icmp slt i64 %a0, %t3078
  %t3083 = select i1 %t3082, i64 257, i64 1
  br label %fixmerge788
fixslow787:
  %t3084 = call i64 @rt_lt(i64 %a0, i64 %t3078)
  br label %fixmerge788
fixmerge788:
  %t3085 = phi i64 [ %t3083, %fixfast786 ], [ %t3084, %fixslow787 ]
  %t3086 = icmp ne i64 %t3085, 1
  br i1 %t3086, label %then789, label %else790
then789:
  ret i64 %a1
else790:
  %t3087 = or i64 %a0, 8
  %t3088 = and i64 %t3087, 7
  %t3089 = icmp eq i64 %t3088, 0
  br i1 %t3089, label %fixfast791, label %fixslow792
fixfast791:
  %t3090 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t3091 = extractvalue {i64, i1} %t3090, 0
  %t3092 = extractvalue {i64, i1} %t3090, 1
  br i1 %t3092, label %fixslow792, label %fixmerge793
fixslow792:
  %t3093 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge793
fixmerge793:
  %t3094 = phi i64 [ %t3091, %fixfast791 ], [ %t3093, %fixslow792 ]
  %t3095 = and i64 %self, -8
  %t3096 = inttoptr i64 %t3095 to ptr
  %t3097 = getelementptr i64, ptr %t3096, i64 3
  %t3098 = load i64, ptr %t3097
  %t3099 = call i64 @rt_vector_ref(i64 %t3098, i64 %a0)
  %t3100 = call i64 @rt_cons(i64 %t3099, i64 %a1)
  %t3101 = musttail call fastcc i64 @"scheme.base:code_692"(i64 %self, i64 2, i64 %t3094, i64 %t3100, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3101
}

define fastcc i64 @"scheme.base:code:vector->list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3102 = icmp sge i64 %argc, 1
  br i1 %t3102, label %argok795, label %arityerr794
arityerr794:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok795:
  %t3103 = call ptr @rt_alloc_words(i64 8)
  %t3104 = getelementptr i64, ptr %t3103, i64 0
  store i64 %a0, ptr %t3104
  %t3105 = getelementptr i64, ptr %t3103, i64 1
  store i64 %a1, ptr %t3105
  %t3106 = getelementptr i64, ptr %t3103, i64 2
  store i64 %a2, ptr %t3106
  %t3107 = getelementptr i64, ptr %t3103, i64 3
  store i64 %a3, ptr %t3107
  %t3108 = getelementptr i64, ptr %t3103, i64 4
  store i64 %a4, ptr %t3108
  %t3109 = getelementptr i64, ptr %t3103, i64 5
  store i64 %a5, ptr %t3109
  %t3110 = getelementptr i64, ptr %t3103, i64 6
  store i64 %a6, ptr %t3110
  %t3111 = getelementptr i64, ptr %t3103, i64 7
  store i64 %a7, ptr %t3111
  %t3112 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t3103, ptr %overflow)
  %t3113 = call i64 @rt_vector_length(i64 %a0)
  %t3114 = load i64, ptr @"scheme.base:rng-start"
  %t3115 = and i64 %t3114, -8
  %t3116 = inttoptr i64 %t3115 to ptr
  %t3117 = load i64, ptr %t3116
  %t3118 = inttoptr i64 %t3117 to ptr
  %t3119 = call fastcc i64%t3118(i64 %t3114, i64 1, i64 %t3112, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3120 = load i64, ptr @"scheme.base:rng-end"
  %t3121 = and i64 %t3120, -8
  %t3122 = inttoptr i64 %t3121 to ptr
  %t3123 = load i64, ptr %t3122
  %t3124 = inttoptr i64 %t3123 to ptr
  %t3125 = call fastcc i64%t3124(i64 %t3120, i64 2, i64 %t3112, i64 %t3113, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3126 = call i64 @rt_intern(ptr @.str.sym.14)
  %t3127 = load i64, ptr @"scheme.base:rng-check"
  %t3128 = and i64 %t3127, -8
  %t3129 = inttoptr i64 %t3128 to ptr
  %t3130 = load i64, ptr %t3129
  %t3131 = inttoptr i64 %t3130 to ptr
  %t3132 = call fastcc i64%t3131(i64 %t3127, i64 4, i64 %t3126, i64 %t3119, i64 %t3125, i64 %t3113, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3133 = call ptr @rt_alloc_words(i64 4)
  %t3134 = ptrtoint ptr %t3133 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_692" to i64), ptr %t3133
  %t3135 = or i64 %t3134, 4
  %t3136 = getelementptr i64, ptr %t3133, i64 1
  store i64 %t3119, ptr %t3136
  %t3137 = getelementptr i64, ptr %t3133, i64 2
  store i64 %t3135, ptr %t3137
  %t3138 = getelementptr i64, ptr %t3133, i64 3
  store i64 %a0, ptr %t3138
  %t3139 = or i64 %t3125, 8
  %t3140 = and i64 %t3139, 7
  %t3141 = icmp eq i64 %t3140, 0
  br i1 %t3141, label %fixfast796, label %fixslow797
fixfast796:
  %t3142 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3125, i64 8)
  %t3143 = extractvalue {i64, i1} %t3142, 0
  %t3144 = extractvalue {i64, i1} %t3142, 1
  br i1 %t3144, label %fixslow797, label %fixmerge798
fixslow797:
  %t3145 = call i64 @rt_sub(i64 %t3125, i64 8)
  br label %fixmerge798
fixmerge798:
  %t3146 = phi i64 [ %t3143, %fixfast796 ], [ %t3145, %fixslow797 ]
  %t3147 = musttail call fastcc i64 @"scheme.base:code_692"(i64 %t3135, i64 2, i64 %t3146, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3147
}

define fastcc i64 @"scheme.base:code_707"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3152 = icmp eq i64 %argc, 1
  br i1 %t3152, label %argok800, label %arityerr799
arityerr799:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok800:
  %t3153 = and i64 %self, -8
  %t3154 = inttoptr i64 %t3153 to ptr
  %t3155 = getelementptr i64, ptr %t3154, i64 1
  %t3156 = load i64, ptr %t3155
  %t3157 = or i64 %a0, %t3156
  %t3158 = and i64 %t3157, 7
  %t3159 = icmp eq i64 %t3158, 0
  br i1 %t3159, label %fixfast801, label %fixslow802
fixfast801:
  %t3160 = icmp eq i64 %a0, %t3156
  %t3161 = select i1 %t3160, i64 257, i64 1
  br label %fixmerge803
fixslow802:
  %t3162 = call i64 @rt_num_eq(i64 %a0, i64 %t3156)
  br label %fixmerge803
fixmerge803:
  %t3163 = phi i64 [ %t3161, %fixfast801 ], [ %t3162, %fixslow802 ]
  %t3164 = icmp ne i64 %t3163, 1
  br i1 %t3164, label %then804, label %else805
then804:
  %t3165 = and i64 %self, -8
  %t3166 = inttoptr i64 %t3165 to ptr
  %t3167 = getelementptr i64, ptr %t3166, i64 2
  %t3168 = load i64, ptr %t3167
  ret i64 %t3168
else805:
  %t3169 = and i64 %self, -8
  %t3170 = inttoptr i64 %t3169 to ptr
  %t3171 = getelementptr i64, ptr %t3170, i64 2
  %t3172 = load i64, ptr %t3171
  %t3173 = and i64 %self, -8
  %t3174 = inttoptr i64 %t3173 to ptr
  %t3175 = getelementptr i64, ptr %t3174, i64 3
  %t3176 = load i64, ptr %t3175
  %t3177 = or i64 %a0, %t3176
  %t3178 = and i64 %t3177, 7
  %t3179 = icmp eq i64 %t3178, 0
  br i1 %t3179, label %fixfast806, label %fixslow807
fixfast806:
  %t3180 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t3176)
  %t3181 = extractvalue {i64, i1} %t3180, 0
  %t3182 = extractvalue {i64, i1} %t3180, 1
  br i1 %t3182, label %fixslow807, label %fixmerge808
fixslow807:
  %t3183 = call i64 @rt_sub(i64 %a0, i64 %t3176)
  br label %fixmerge808
fixmerge808:
  %t3184 = phi i64 [ %t3181, %fixfast806 ], [ %t3183, %fixslow807 ]
  %t3185 = and i64 %self, -8
  %t3186 = inttoptr i64 %t3185 to ptr
  %t3187 = getelementptr i64, ptr %t3186, i64 4
  %t3188 = load i64, ptr %t3187
  %t3189 = call i64 @rt_vector_ref(i64 %t3188, i64 %a0)
  %t3190 = call i64 @rt_vector_set(i64 %t3172, i64 %t3184, i64 %t3189)
  %t3191 = or i64 %a0, 8
  %t3192 = and i64 %t3191, 7
  %t3193 = icmp eq i64 %t3192, 0
  br i1 %t3193, label %fixfast809, label %fixslow810
fixfast809:
  %t3194 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3195 = extractvalue {i64, i1} %t3194, 0
  %t3196 = extractvalue {i64, i1} %t3194, 1
  br i1 %t3196, label %fixslow810, label %fixmerge811
fixslow810:
  %t3197 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge811
fixmerge811:
  %t3198 = phi i64 [ %t3195, %fixfast809 ], [ %t3197, %fixslow810 ]
  %t3199 = musttail call fastcc i64 @"scheme.base:code_707"(i64 %self, i64 1, i64 %t3198, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3199
}

define fastcc i64 @"scheme.base:code:vector-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3200 = icmp sge i64 %argc, 1
  br i1 %t3200, label %argok813, label %arityerr812
arityerr812:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok813:
  %t3201 = call ptr @rt_alloc_words(i64 8)
  %t3202 = getelementptr i64, ptr %t3201, i64 0
  store i64 %a0, ptr %t3202
  %t3203 = getelementptr i64, ptr %t3201, i64 1
  store i64 %a1, ptr %t3203
  %t3204 = getelementptr i64, ptr %t3201, i64 2
  store i64 %a2, ptr %t3204
  %t3205 = getelementptr i64, ptr %t3201, i64 3
  store i64 %a3, ptr %t3205
  %t3206 = getelementptr i64, ptr %t3201, i64 4
  store i64 %a4, ptr %t3206
  %t3207 = getelementptr i64, ptr %t3201, i64 5
  store i64 %a5, ptr %t3207
  %t3208 = getelementptr i64, ptr %t3201, i64 6
  store i64 %a6, ptr %t3208
  %t3209 = getelementptr i64, ptr %t3201, i64 7
  store i64 %a7, ptr %t3209
  %t3210 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t3201, ptr %overflow)
  %t3211 = call i64 @rt_vector_length(i64 %a0)
  %t3212 = load i64, ptr @"scheme.base:rng-start"
  %t3213 = and i64 %t3212, -8
  %t3214 = inttoptr i64 %t3213 to ptr
  %t3215 = load i64, ptr %t3214
  %t3216 = inttoptr i64 %t3215 to ptr
  %t3217 = call fastcc i64%t3216(i64 %t3212, i64 1, i64 %t3210, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3218 = load i64, ptr @"scheme.base:rng-end"
  %t3219 = and i64 %t3218, -8
  %t3220 = inttoptr i64 %t3219 to ptr
  %t3221 = load i64, ptr %t3220
  %t3222 = inttoptr i64 %t3221 to ptr
  %t3223 = call fastcc i64%t3222(i64 %t3218, i64 2, i64 %t3210, i64 %t3211, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3224 = call i64 @rt_intern(ptr @.str.sym.15)
  %t3225 = load i64, ptr @"scheme.base:rng-check"
  %t3226 = and i64 %t3225, -8
  %t3227 = inttoptr i64 %t3226 to ptr
  %t3228 = load i64, ptr %t3227
  %t3229 = inttoptr i64 %t3228 to ptr
  %t3230 = call fastcc i64%t3229(i64 %t3225, i64 4, i64 %t3224, i64 %t3217, i64 %t3223, i64 %t3211, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3231 = or i64 %t3223, %t3217
  %t3232 = and i64 %t3231, 7
  %t3233 = icmp eq i64 %t3232, 0
  br i1 %t3233, label %fixfast814, label %fixslow815
fixfast814:
  %t3234 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3223, i64 %t3217)
  %t3235 = extractvalue {i64, i1} %t3234, 0
  %t3236 = extractvalue {i64, i1} %t3234, 1
  br i1 %t3236, label %fixslow815, label %fixmerge816
fixslow815:
  %t3237 = call i64 @rt_sub(i64 %t3223, i64 %t3217)
  br label %fixmerge816
fixmerge816:
  %t3238 = phi i64 [ %t3235, %fixfast814 ], [ %t3237, %fixslow815 ]
  %t3239 = call i64 @rt_make_vector(i64 %t3238, i64 0)
  %t3240 = call ptr @rt_alloc_words(i64 6)
  %t3241 = ptrtoint ptr %t3240 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_707" to i64), ptr %t3240
  %t3242 = or i64 %t3241, 4
  %t3243 = getelementptr i64, ptr %t3240, i64 1
  store i64 %t3223, ptr %t3243
  %t3244 = getelementptr i64, ptr %t3240, i64 2
  store i64 %t3239, ptr %t3244
  %t3245 = getelementptr i64, ptr %t3240, i64 3
  store i64 %t3217, ptr %t3245
  %t3246 = getelementptr i64, ptr %t3240, i64 4
  store i64 %a0, ptr %t3246
  %t3247 = getelementptr i64, ptr %t3240, i64 5
  store i64 %t3242, ptr %t3247
  %t3248 = musttail call fastcc i64 @"scheme.base:code_707"(i64 %t3242, i64 1, i64 %t3217, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3248
}

define fastcc i64 @"scheme.base:code_725"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3253 = icmp eq i64 %argc, 1
  br i1 %t3253, label %argok818, label %arityerr817
arityerr817:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok818:
  %t3254 = and i64 %self, -8
  %t3255 = inttoptr i64 %t3254 to ptr
  %t3256 = getelementptr i64, ptr %t3255, i64 1
  %t3257 = load i64, ptr %t3256
  %t3258 = or i64 %a0, %t3257
  %t3259 = and i64 %t3258, 7
  %t3260 = icmp eq i64 %t3259, 0
  br i1 %t3260, label %fixfast819, label %fixslow820
fixfast819:
  %t3261 = icmp eq i64 %a0, %t3257
  %t3262 = select i1 %t3261, i64 257, i64 1
  br label %fixmerge821
fixslow820:
  %t3263 = call i64 @rt_num_eq(i64 %a0, i64 %t3257)
  br label %fixmerge821
fixmerge821:
  %t3264 = phi i64 [ %t3262, %fixfast819 ], [ %t3263, %fixslow820 ]
  %t3265 = icmp ne i64 %t3264, 1
  br i1 %t3265, label %then822, label %else823
then822:
  %t3266 = and i64 %self, -8
  %t3267 = inttoptr i64 %t3266 to ptr
  %t3268 = getelementptr i64, ptr %t3267, i64 3
  %t3269 = load i64, ptr %t3268
  %t3270 = call i64 @rt_cdr(i64 %t3269)
  %t3271 = and i64 %self, -8
  %t3272 = inttoptr i64 %t3271 to ptr
  %t3273 = getelementptr i64, ptr %t3272, i64 4
  %t3274 = load i64, ptr %t3273
  %t3275 = and i64 %self, -8
  %t3276 = inttoptr i64 %t3275 to ptr
  %t3277 = getelementptr i64, ptr %t3276, i64 1
  %t3278 = load i64, ptr %t3277
  %t3279 = or i64 %t3274, %t3278
  %t3280 = and i64 %t3279, 7
  %t3281 = icmp eq i64 %t3280, 0
  br i1 %t3281, label %fixfast824, label %fixslow825
fixfast824:
  %t3282 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3274, i64 %t3278)
  %t3283 = extractvalue {i64, i1} %t3282, 0
  %t3284 = extractvalue {i64, i1} %t3282, 1
  br i1 %t3284, label %fixslow825, label %fixmerge826
fixslow825:
  %t3285 = call i64 @rt_add(i64 %t3274, i64 %t3278)
  br label %fixmerge826
fixmerge826:
  %t3286 = phi i64 [ %t3283, %fixfast824 ], [ %t3285, %fixslow825 ]
  %t3287 = and i64 %self, -8
  %t3288 = inttoptr i64 %t3287 to ptr
  %t3289 = getelementptr i64, ptr %t3288, i64 2
  %t3290 = load i64, ptr %t3289
  %t3291 = musttail call fastcc i64 @"scheme.base:code_723"(i64 %t3290, i64 2, i64 %t3270, i64 %t3286, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3291
else823:
  %t3292 = and i64 %self, -8
  %t3293 = inttoptr i64 %t3292 to ptr
  %t3294 = getelementptr i64, ptr %t3293, i64 5
  %t3295 = load i64, ptr %t3294
  %t3296 = and i64 %self, -8
  %t3297 = inttoptr i64 %t3296 to ptr
  %t3298 = getelementptr i64, ptr %t3297, i64 4
  %t3299 = load i64, ptr %t3298
  %t3300 = or i64 %t3299, %a0
  %t3301 = and i64 %t3300, 7
  %t3302 = icmp eq i64 %t3301, 0
  br i1 %t3302, label %fixfast827, label %fixslow828
fixfast827:
  %t3303 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3299, i64 %a0)
  %t3304 = extractvalue {i64, i1} %t3303, 0
  %t3305 = extractvalue {i64, i1} %t3303, 1
  br i1 %t3305, label %fixslow828, label %fixmerge829
fixslow828:
  %t3306 = call i64 @rt_add(i64 %t3299, i64 %a0)
  br label %fixmerge829
fixmerge829:
  %t3307 = phi i64 [ %t3304, %fixfast827 ], [ %t3306, %fixslow828 ]
  %t3308 = and i64 %self, -8
  %t3309 = inttoptr i64 %t3308 to ptr
  %t3310 = getelementptr i64, ptr %t3309, i64 6
  %t3311 = load i64, ptr %t3310
  %t3312 = call i64 @rt_vector_ref(i64 %t3311, i64 %a0)
  %t3313 = call i64 @rt_vector_set(i64 %t3295, i64 %t3307, i64 %t3312)
  %t3314 = or i64 %a0, 8
  %t3315 = and i64 %t3314, 7
  %t3316 = icmp eq i64 %t3315, 0
  br i1 %t3316, label %fixfast830, label %fixslow831
fixfast830:
  %t3317 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3318 = extractvalue {i64, i1} %t3317, 0
  %t3319 = extractvalue {i64, i1} %t3317, 1
  br i1 %t3319, label %fixslow831, label %fixmerge832
fixslow831:
  %t3320 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge832
fixmerge832:
  %t3321 = phi i64 [ %t3318, %fixfast830 ], [ %t3320, %fixslow831 ]
  %t3322 = musttail call fastcc i64 @"scheme.base:code_725"(i64 %self, i64 1, i64 %t3321, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3322
}

define fastcc i64 @"scheme.base:code_723"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3323 = icmp eq i64 %argc, 2
  br i1 %t3323, label %argok834, label %arityerr833
arityerr833:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok834:
  %t3324 = call i64 @rt_null_p(i64 %a0)
  %t3325 = icmp ne i64 %t3324, 1
  br i1 %t3325, label %then835, label %else836
then835:
  %t3326 = and i64 %self, -8
  %t3327 = inttoptr i64 %t3326 to ptr
  %t3328 = getelementptr i64, ptr %t3327, i64 1
  %t3329 = load i64, ptr %t3328
  ret i64 %t3329
else836:
  %t3330 = call i64 @rt_car(i64 %a0)
  %t3331 = call i64 @rt_vector_length(i64 %t3330)
  %t3332 = call ptr @rt_alloc_words(i64 8)
  %t3333 = ptrtoint ptr %t3332 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_725" to i64), ptr %t3332
  %t3334 = or i64 %t3333, 4
  %t3335 = getelementptr i64, ptr %t3332, i64 1
  store i64 %t3331, ptr %t3335
  %t3336 = and i64 %self, -8
  %t3337 = inttoptr i64 %t3336 to ptr
  %t3338 = getelementptr i64, ptr %t3337, i64 2
  %t3339 = load i64, ptr %t3338
  %t3340 = getelementptr i64, ptr %t3332, i64 2
  store i64 %t3339, ptr %t3340
  %t3341 = getelementptr i64, ptr %t3332, i64 3
  store i64 %a0, ptr %t3341
  %t3342 = getelementptr i64, ptr %t3332, i64 4
  store i64 %a1, ptr %t3342
  %t3343 = and i64 %self, -8
  %t3344 = inttoptr i64 %t3343 to ptr
  %t3345 = getelementptr i64, ptr %t3344, i64 1
  %t3346 = load i64, ptr %t3345
  %t3347 = getelementptr i64, ptr %t3332, i64 5
  store i64 %t3346, ptr %t3347
  %t3348 = getelementptr i64, ptr %t3332, i64 6
  store i64 %t3330, ptr %t3348
  %t3349 = getelementptr i64, ptr %t3332, i64 7
  store i64 %t3334, ptr %t3349
  %t3350 = musttail call fastcc i64 @"scheme.base:code_725"(i64 %t3334, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3350
}

define fastcc i64 @"scheme.base:code:vector-append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3351 = icmp sge i64 %argc, 0
  br i1 %t3351, label %argok838, label %arityerr837
arityerr837:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok838:
  %t3352 = call ptr @rt_alloc_words(i64 8)
  %t3353 = getelementptr i64, ptr %t3352, i64 0
  store i64 %a0, ptr %t3353
  %t3354 = getelementptr i64, ptr %t3352, i64 1
  store i64 %a1, ptr %t3354
  %t3355 = getelementptr i64, ptr %t3352, i64 2
  store i64 %a2, ptr %t3355
  %t3356 = getelementptr i64, ptr %t3352, i64 3
  store i64 %a3, ptr %t3356
  %t3357 = getelementptr i64, ptr %t3352, i64 4
  store i64 %a4, ptr %t3357
  %t3358 = getelementptr i64, ptr %t3352, i64 5
  store i64 %a5, ptr %t3358
  %t3359 = getelementptr i64, ptr %t3352, i64 6
  store i64 %a6, ptr %t3359
  %t3360 = getelementptr i64, ptr %t3352, i64 7
  store i64 %a7, ptr %t3360
  %t3361 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t3352, ptr %overflow)
  %t3362 = load i64, ptr @"scheme.base:vec-total"
  %t3363 = and i64 %t3362, -8
  %t3364 = inttoptr i64 %t3363 to ptr
  %t3365 = load i64, ptr %t3364
  %t3366 = inttoptr i64 %t3365 to ptr
  %t3367 = call fastcc i64%t3366(i64 %t3362, i64 1, i64 %t3361, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3368 = call i64 @rt_make_vector(i64 %t3367, i64 0)
  %t3369 = call ptr @rt_alloc_words(i64 3)
  %t3370 = ptrtoint ptr %t3369 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_723" to i64), ptr %t3369
  %t3371 = or i64 %t3370, 4
  %t3372 = getelementptr i64, ptr %t3369, i64 1
  store i64 %t3368, ptr %t3372
  %t3373 = getelementptr i64, ptr %t3369, i64 2
  store i64 %t3371, ptr %t3373
  %t3374 = musttail call fastcc i64 @"scheme.base:code_723"(i64 %t3371, i64 2, i64 %t3361, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3374
}

define fastcc i64 @"scheme.base:code:vec-total"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3379 = icmp eq i64 %argc, 1
  br i1 %t3379, label %argok840, label %arityerr839
arityerr839:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok840:
  %t3380 = call i64 @rt_null_p(i64 %a0)
  %t3381 = icmp ne i64 %t3380, 1
  br i1 %t3381, label %then841, label %else842
then841:
  ret i64 0
else842:
  %t3382 = call i64 @rt_car(i64 %a0)
  %t3383 = call i64 @rt_vector_length(i64 %t3382)
  %t3384 = call i64 @rt_cdr(i64 %a0)
  %t3385 = load i64, ptr @"scheme.base:vec-total"
  %t3386 = and i64 %t3385, -8
  %t3387 = inttoptr i64 %t3386 to ptr
  %t3388 = load i64, ptr %t3387
  %t3389 = inttoptr i64 %t3388 to ptr
  %t3390 = call fastcc i64%t3389(i64 %t3385, i64 1, i64 %t3384, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3391 = or i64 %t3383, %t3390
  %t3392 = and i64 %t3391, 7
  %t3393 = icmp eq i64 %t3392, 0
  br i1 %t3393, label %fixfast843, label %fixslow844
fixfast843:
  %t3394 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3383, i64 %t3390)
  %t3395 = extractvalue {i64, i1} %t3394, 0
  %t3396 = extractvalue {i64, i1} %t3394, 1
  br i1 %t3396, label %fixslow844, label %fixmerge845
fixslow844:
  %t3397 = call i64 @rt_add(i64 %t3383, i64 %t3390)
  br label %fixmerge845
fixmerge845:
  %t3398 = phi i64 [ %t3395, %fixfast843 ], [ %t3397, %fixslow844 ]
  ret i64 %t3398
}

define fastcc i64 @"scheme.base:code_742"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3403 = icmp eq i64 %argc, 1
  br i1 %t3403, label %argok847, label %arityerr846
arityerr846:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok847:
  %t3404 = and i64 %self, -8
  %t3405 = inttoptr i64 %t3404 to ptr
  %t3406 = getelementptr i64, ptr %t3405, i64 1
  %t3407 = load i64, ptr %t3406
  %t3408 = or i64 %a0, %t3407
  %t3409 = and i64 %t3408, 7
  %t3410 = icmp eq i64 %t3409, 0
  br i1 %t3410, label %fixfast848, label %fixslow849
fixfast848:
  %t3411 = icmp eq i64 %a0, %t3407
  %t3412 = select i1 %t3411, i64 257, i64 1
  br label %fixmerge850
fixslow849:
  %t3413 = call i64 @rt_num_eq(i64 %a0, i64 %t3407)
  br label %fixmerge850
fixmerge850:
  %t3414 = phi i64 [ %t3412, %fixfast848 ], [ %t3413, %fixslow849 ]
  %t3415 = icmp ne i64 %t3414, 1
  br i1 %t3415, label %then851, label %else852
then851:
  %t3416 = load i64, ptr @"scheme.base:void"
  %t3417 = and i64 %t3416, -8
  %t3418 = inttoptr i64 %t3417 to ptr
  %t3419 = load i64, ptr %t3418
  %t3420 = inttoptr i64 %t3419 to ptr
  %t3421 = musttail call fastcc i64 %t3420(i64 %t3416, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3421
else852:
  %t3422 = and i64 %self, -8
  %t3423 = inttoptr i64 %t3422 to ptr
  %t3424 = getelementptr i64, ptr %t3423, i64 2
  %t3425 = load i64, ptr %t3424
  %t3426 = and i64 %self, -8
  %t3427 = inttoptr i64 %t3426 to ptr
  %t3428 = getelementptr i64, ptr %t3427, i64 3
  %t3429 = load i64, ptr %t3428
  %t3430 = call i64 @rt_vector_set(i64 %t3425, i64 %a0, i64 %t3429)
  %t3431 = or i64 %a0, 8
  %t3432 = and i64 %t3431, 7
  %t3433 = icmp eq i64 %t3432, 0
  br i1 %t3433, label %fixfast853, label %fixslow854
fixfast853:
  %t3434 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3435 = extractvalue {i64, i1} %t3434, 0
  %t3436 = extractvalue {i64, i1} %t3434, 1
  br i1 %t3436, label %fixslow854, label %fixmerge855
fixslow854:
  %t3437 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge855
fixmerge855:
  %t3438 = phi i64 [ %t3435, %fixfast853 ], [ %t3437, %fixslow854 ]
  %t3439 = musttail call fastcc i64 @"scheme.base:code_742"(i64 %self, i64 1, i64 %t3438, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3439
}

define fastcc i64 @"scheme.base:code:vector-fill!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3440 = icmp sge i64 %argc, 2
  br i1 %t3440, label %argok857, label %arityerr856
arityerr856:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok857:
  %t3441 = call ptr @rt_alloc_words(i64 8)
  %t3442 = getelementptr i64, ptr %t3441, i64 0
  store i64 %a0, ptr %t3442
  %t3443 = getelementptr i64, ptr %t3441, i64 1
  store i64 %a1, ptr %t3443
  %t3444 = getelementptr i64, ptr %t3441, i64 2
  store i64 %a2, ptr %t3444
  %t3445 = getelementptr i64, ptr %t3441, i64 3
  store i64 %a3, ptr %t3445
  %t3446 = getelementptr i64, ptr %t3441, i64 4
  store i64 %a4, ptr %t3446
  %t3447 = getelementptr i64, ptr %t3441, i64 5
  store i64 %a5, ptr %t3447
  %t3448 = getelementptr i64, ptr %t3441, i64 6
  store i64 %a6, ptr %t3448
  %t3449 = getelementptr i64, ptr %t3441, i64 7
  store i64 %a7, ptr %t3449
  %t3450 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3441, ptr %overflow)
  %t3451 = call i64 @rt_vector_length(i64 %a0)
  %t3452 = load i64, ptr @"scheme.base:rng-start"
  %t3453 = and i64 %t3452, -8
  %t3454 = inttoptr i64 %t3453 to ptr
  %t3455 = load i64, ptr %t3454
  %t3456 = inttoptr i64 %t3455 to ptr
  %t3457 = call fastcc i64%t3456(i64 %t3452, i64 1, i64 %t3450, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3458 = load i64, ptr @"scheme.base:rng-end"
  %t3459 = and i64 %t3458, -8
  %t3460 = inttoptr i64 %t3459 to ptr
  %t3461 = load i64, ptr %t3460
  %t3462 = inttoptr i64 %t3461 to ptr
  %t3463 = call fastcc i64%t3462(i64 %t3458, i64 2, i64 %t3450, i64 %t3451, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3464 = call i64 @rt_intern(ptr @.str.sym.16)
  %t3465 = load i64, ptr @"scheme.base:rng-check"
  %t3466 = and i64 %t3465, -8
  %t3467 = inttoptr i64 %t3466 to ptr
  %t3468 = load i64, ptr %t3467
  %t3469 = inttoptr i64 %t3468 to ptr
  %t3470 = call fastcc i64%t3469(i64 %t3465, i64 4, i64 %t3464, i64 %t3457, i64 %t3463, i64 %t3451, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3471 = call ptr @rt_alloc_words(i64 5)
  %t3472 = ptrtoint ptr %t3471 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_742" to i64), ptr %t3471
  %t3473 = or i64 %t3472, 4
  %t3474 = getelementptr i64, ptr %t3471, i64 1
  store i64 %t3463, ptr %t3474
  %t3475 = getelementptr i64, ptr %t3471, i64 2
  store i64 %a0, ptr %t3475
  %t3476 = getelementptr i64, ptr %t3471, i64 3
  store i64 %a1, ptr %t3476
  %t3477 = getelementptr i64, ptr %t3471, i64 4
  store i64 %t3473, ptr %t3477
  %t3478 = musttail call fastcc i64 @"scheme.base:code_742"(i64 %t3473, i64 1, i64 %t3457, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3478
}

define fastcc i64 @"scheme.base:code_768"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3483 = icmp eq i64 %argc, 1
  br i1 %t3483, label %argok859, label %arityerr858
arityerr858:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok859:
  %t3484 = or i64 %a0, 0
  %t3485 = and i64 %t3484, 7
  %t3486 = icmp eq i64 %t3485, 0
  br i1 %t3486, label %fixfast860, label %fixslow861
fixfast860:
  %t3487 = icmp slt i64 %a0, 0
  %t3488 = select i1 %t3487, i64 257, i64 1
  br label %fixmerge862
fixslow861:
  %t3489 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge862
fixmerge862:
  %t3490 = phi i64 [ %t3488, %fixfast860 ], [ %t3489, %fixslow861 ]
  %t3491 = icmp ne i64 %t3490, 1
  br i1 %t3491, label %then863, label %else864
then863:
  %t3492 = load i64, ptr @"scheme.base:void"
  %t3493 = and i64 %t3492, -8
  %t3494 = inttoptr i64 %t3493 to ptr
  %t3495 = load i64, ptr %t3494
  %t3496 = inttoptr i64 %t3495 to ptr
  %t3497 = musttail call fastcc i64 %t3496(i64 %t3492, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3497
else864:
  %t3498 = and i64 %self, -8
  %t3499 = inttoptr i64 %t3498 to ptr
  %t3500 = getelementptr i64, ptr %t3499, i64 1
  %t3501 = load i64, ptr %t3500
  %t3502 = and i64 %self, -8
  %t3503 = inttoptr i64 %t3502 to ptr
  %t3504 = getelementptr i64, ptr %t3503, i64 2
  %t3505 = load i64, ptr %t3504
  %t3506 = or i64 %t3505, %a0
  %t3507 = and i64 %t3506, 7
  %t3508 = icmp eq i64 %t3507, 0
  br i1 %t3508, label %fixfast865, label %fixslow866
fixfast865:
  %t3509 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3505, i64 %a0)
  %t3510 = extractvalue {i64, i1} %t3509, 0
  %t3511 = extractvalue {i64, i1} %t3509, 1
  br i1 %t3511, label %fixslow866, label %fixmerge867
fixslow866:
  %t3512 = call i64 @rt_add(i64 %t3505, i64 %a0)
  br label %fixmerge867
fixmerge867:
  %t3513 = phi i64 [ %t3510, %fixfast865 ], [ %t3512, %fixslow866 ]
  %t3514 = and i64 %self, -8
  %t3515 = inttoptr i64 %t3514 to ptr
  %t3516 = getelementptr i64, ptr %t3515, i64 3
  %t3517 = load i64, ptr %t3516
  %t3518 = and i64 %self, -8
  %t3519 = inttoptr i64 %t3518 to ptr
  %t3520 = getelementptr i64, ptr %t3519, i64 4
  %t3521 = load i64, ptr %t3520
  %t3522 = or i64 %t3521, %a0
  %t3523 = and i64 %t3522, 7
  %t3524 = icmp eq i64 %t3523, 0
  br i1 %t3524, label %fixfast868, label %fixslow869
fixfast868:
  %t3525 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3521, i64 %a0)
  %t3526 = extractvalue {i64, i1} %t3525, 0
  %t3527 = extractvalue {i64, i1} %t3525, 1
  br i1 %t3527, label %fixslow869, label %fixmerge870
fixslow869:
  %t3528 = call i64 @rt_add(i64 %t3521, i64 %a0)
  br label %fixmerge870
fixmerge870:
  %t3529 = phi i64 [ %t3526, %fixfast868 ], [ %t3528, %fixslow869 ]
  %t3530 = call i64 @rt_vector_ref(i64 %t3517, i64 %t3529)
  %t3531 = call i64 @rt_vector_set(i64 %t3501, i64 %t3513, i64 %t3530)
  %t3532 = or i64 %a0, 8
  %t3533 = and i64 %t3532, 7
  %t3534 = icmp eq i64 %t3533, 0
  br i1 %t3534, label %fixfast871, label %fixslow872
fixfast871:
  %t3535 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t3536 = extractvalue {i64, i1} %t3535, 0
  %t3537 = extractvalue {i64, i1} %t3535, 1
  br i1 %t3537, label %fixslow872, label %fixmerge873
fixslow872:
  %t3538 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge873
fixmerge873:
  %t3539 = phi i64 [ %t3536, %fixfast871 ], [ %t3538, %fixslow872 ]
  %t3540 = musttail call fastcc i64 @"scheme.base:code_768"(i64 %self, i64 1, i64 %t3539, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3540
}

define fastcc i64 @"scheme.base:code_770"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3541 = icmp eq i64 %argc, 1
  br i1 %t3541, label %argok875, label %arityerr874
arityerr874:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok875:
  %t3542 = and i64 %self, -8
  %t3543 = inttoptr i64 %t3542 to ptr
  %t3544 = getelementptr i64, ptr %t3543, i64 1
  %t3545 = load i64, ptr %t3544
  %t3546 = and i64 %self, -8
  %t3547 = inttoptr i64 %t3546 to ptr
  %t3548 = getelementptr i64, ptr %t3547, i64 2
  %t3549 = load i64, ptr %t3548
  %t3550 = or i64 %t3545, %t3549
  %t3551 = and i64 %t3550, 7
  %t3552 = icmp eq i64 %t3551, 0
  br i1 %t3552, label %fixfast876, label %fixslow877
fixfast876:
  %t3553 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3545, i64 %t3549)
  %t3554 = extractvalue {i64, i1} %t3553, 0
  %t3555 = extractvalue {i64, i1} %t3553, 1
  br i1 %t3555, label %fixslow877, label %fixmerge878
fixslow877:
  %t3556 = call i64 @rt_sub(i64 %t3545, i64 %t3549)
  br label %fixmerge878
fixmerge878:
  %t3557 = phi i64 [ %t3554, %fixfast876 ], [ %t3556, %fixslow877 ]
  %t3558 = or i64 %a0, %t3557
  %t3559 = and i64 %t3558, 7
  %t3560 = icmp eq i64 %t3559, 0
  br i1 %t3560, label %fixfast879, label %fixslow880
fixfast879:
  %t3561 = icmp eq i64 %a0, %t3557
  %t3562 = select i1 %t3561, i64 257, i64 1
  br label %fixmerge881
fixslow880:
  %t3563 = call i64 @rt_num_eq(i64 %a0, i64 %t3557)
  br label %fixmerge881
fixmerge881:
  %t3564 = phi i64 [ %t3562, %fixfast879 ], [ %t3563, %fixslow880 ]
  %t3565 = icmp ne i64 %t3564, 1
  br i1 %t3565, label %then882, label %else883
then882:
  %t3566 = load i64, ptr @"scheme.base:void"
  %t3567 = and i64 %t3566, -8
  %t3568 = inttoptr i64 %t3567 to ptr
  %t3569 = load i64, ptr %t3568
  %t3570 = inttoptr i64 %t3569 to ptr
  %t3571 = musttail call fastcc i64 %t3570(i64 %t3566, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3571
else883:
  %t3572 = and i64 %self, -8
  %t3573 = inttoptr i64 %t3572 to ptr
  %t3574 = getelementptr i64, ptr %t3573, i64 3
  %t3575 = load i64, ptr %t3574
  %t3576 = and i64 %self, -8
  %t3577 = inttoptr i64 %t3576 to ptr
  %t3578 = getelementptr i64, ptr %t3577, i64 4
  %t3579 = load i64, ptr %t3578
  %t3580 = or i64 %t3579, %a0
  %t3581 = and i64 %t3580, 7
  %t3582 = icmp eq i64 %t3581, 0
  br i1 %t3582, label %fixfast884, label %fixslow885
fixfast884:
  %t3583 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3579, i64 %a0)
  %t3584 = extractvalue {i64, i1} %t3583, 0
  %t3585 = extractvalue {i64, i1} %t3583, 1
  br i1 %t3585, label %fixslow885, label %fixmerge886
fixslow885:
  %t3586 = call i64 @rt_add(i64 %t3579, i64 %a0)
  br label %fixmerge886
fixmerge886:
  %t3587 = phi i64 [ %t3584, %fixfast884 ], [ %t3586, %fixslow885 ]
  %t3588 = and i64 %self, -8
  %t3589 = inttoptr i64 %t3588 to ptr
  %t3590 = getelementptr i64, ptr %t3589, i64 5
  %t3591 = load i64, ptr %t3590
  %t3592 = and i64 %self, -8
  %t3593 = inttoptr i64 %t3592 to ptr
  %t3594 = getelementptr i64, ptr %t3593, i64 2
  %t3595 = load i64, ptr %t3594
  %t3596 = or i64 %t3595, %a0
  %t3597 = and i64 %t3596, 7
  %t3598 = icmp eq i64 %t3597, 0
  br i1 %t3598, label %fixfast887, label %fixslow888
fixfast887:
  %t3599 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3595, i64 %a0)
  %t3600 = extractvalue {i64, i1} %t3599, 0
  %t3601 = extractvalue {i64, i1} %t3599, 1
  br i1 %t3601, label %fixslow888, label %fixmerge889
fixslow888:
  %t3602 = call i64 @rt_add(i64 %t3595, i64 %a0)
  br label %fixmerge889
fixmerge889:
  %t3603 = phi i64 [ %t3600, %fixfast887 ], [ %t3602, %fixslow888 ]
  %t3604 = call i64 @rt_vector_ref(i64 %t3591, i64 %t3603)
  %t3605 = call i64 @rt_vector_set(i64 %t3575, i64 %t3587, i64 %t3604)
  %t3606 = or i64 %a0, 8
  %t3607 = and i64 %t3606, 7
  %t3608 = icmp eq i64 %t3607, 0
  br i1 %t3608, label %fixfast890, label %fixslow891
fixfast890:
  %t3609 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3610 = extractvalue {i64, i1} %t3609, 0
  %t3611 = extractvalue {i64, i1} %t3609, 1
  br i1 %t3611, label %fixslow891, label %fixmerge892
fixslow891:
  %t3612 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge892
fixmerge892:
  %t3613 = phi i64 [ %t3610, %fixfast890 ], [ %t3612, %fixslow891 ]
  %t3614 = musttail call fastcc i64 @"scheme.base:code_770"(i64 %self, i64 1, i64 %t3613, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3614
}

define fastcc i64 @"scheme.base:code:vector-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3615 = icmp sge i64 %argc, 3
  br i1 %t3615, label %argok894, label %arityerr893
arityerr893:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok894:
  %t3616 = call ptr @rt_alloc_words(i64 8)
  %t3617 = getelementptr i64, ptr %t3616, i64 0
  store i64 %a0, ptr %t3617
  %t3618 = getelementptr i64, ptr %t3616, i64 1
  store i64 %a1, ptr %t3618
  %t3619 = getelementptr i64, ptr %t3616, i64 2
  store i64 %a2, ptr %t3619
  %t3620 = getelementptr i64, ptr %t3616, i64 3
  store i64 %a3, ptr %t3620
  %t3621 = getelementptr i64, ptr %t3616, i64 4
  store i64 %a4, ptr %t3621
  %t3622 = getelementptr i64, ptr %t3616, i64 5
  store i64 %a5, ptr %t3622
  %t3623 = getelementptr i64, ptr %t3616, i64 6
  store i64 %a6, ptr %t3623
  %t3624 = getelementptr i64, ptr %t3616, i64 7
  store i64 %a7, ptr %t3624
  %t3625 = call i64 @rt_build_rest(i64 %argc, i64 3, i64 8, ptr %t3616, ptr %overflow)
  %t3626 = call i64 @rt_vector_length(i64 %a2)
  %t3627 = load i64, ptr @"scheme.base:rng-start"
  %t3628 = and i64 %t3627, -8
  %t3629 = inttoptr i64 %t3628 to ptr
  %t3630 = load i64, ptr %t3629
  %t3631 = inttoptr i64 %t3630 to ptr
  %t3632 = call fastcc i64%t3631(i64 %t3627, i64 1, i64 %t3625, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3633 = load i64, ptr @"scheme.base:rng-end"
  %t3634 = and i64 %t3633, -8
  %t3635 = inttoptr i64 %t3634 to ptr
  %t3636 = load i64, ptr %t3635
  %t3637 = inttoptr i64 %t3636 to ptr
  %t3638 = call fastcc i64%t3637(i64 %t3633, i64 2, i64 %t3625, i64 %t3626, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3639 = call i64 @rt_intern(ptr @.str.sym.17)
  %t3640 = load i64, ptr @"scheme.base:rng-check"
  %t3641 = and i64 %t3640, -8
  %t3642 = inttoptr i64 %t3641 to ptr
  %t3643 = load i64, ptr %t3642
  %t3644 = inttoptr i64 %t3643 to ptr
  %t3645 = call fastcc i64%t3644(i64 %t3640, i64 4, i64 %t3639, i64 %t3632, i64 %t3638, i64 %t3626, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3646 = call i64 @rt_intern(ptr @.str.sym.17)
  %t3647 = or i64 %t3638, %t3632
  %t3648 = and i64 %t3647, 7
  %t3649 = icmp eq i64 %t3648, 0
  br i1 %t3649, label %fixfast895, label %fixslow896
fixfast895:
  %t3650 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3638, i64 %t3632)
  %t3651 = extractvalue {i64, i1} %t3650, 0
  %t3652 = extractvalue {i64, i1} %t3650, 1
  br i1 %t3652, label %fixslow896, label %fixmerge897
fixslow896:
  %t3653 = call i64 @rt_sub(i64 %t3638, i64 %t3632)
  br label %fixmerge897
fixmerge897:
  %t3654 = phi i64 [ %t3651, %fixfast895 ], [ %t3653, %fixslow896 ]
  %t3655 = or i64 %a1, %t3654
  %t3656 = and i64 %t3655, 7
  %t3657 = icmp eq i64 %t3656, 0
  br i1 %t3657, label %fixfast898, label %fixslow899
fixfast898:
  %t3658 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t3654)
  %t3659 = extractvalue {i64, i1} %t3658, 0
  %t3660 = extractvalue {i64, i1} %t3658, 1
  br i1 %t3660, label %fixslow899, label %fixmerge900
fixslow899:
  %t3661 = call i64 @rt_add(i64 %a1, i64 %t3654)
  br label %fixmerge900
fixmerge900:
  %t3662 = phi i64 [ %t3659, %fixfast898 ], [ %t3661, %fixslow899 ]
  %t3663 = call i64 @rt_vector_length(i64 %a0)
  %t3664 = load i64, ptr @"scheme.base:rng-check"
  %t3665 = and i64 %t3664, -8
  %t3666 = inttoptr i64 %t3665 to ptr
  %t3667 = load i64, ptr %t3666
  %t3668 = inttoptr i64 %t3667 to ptr
  %t3669 = call fastcc i64%t3668(i64 %t3664, i64 4, i64 %t3646, i64 %a1, i64 %t3662, i64 %t3663, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3670 = or i64 %t3632, %a1
  %t3671 = and i64 %t3670, 7
  %t3672 = icmp eq i64 %t3671, 0
  br i1 %t3672, label %fixfast901, label %fixslow902
fixfast901:
  %t3673 = icmp slt i64 %t3632, %a1
  %t3674 = select i1 %t3673, i64 257, i64 1
  br label %fixmerge903
fixslow902:
  %t3675 = call i64 @rt_lt(i64 %t3632, i64 %a1)
  br label %fixmerge903
fixmerge903:
  %t3676 = phi i64 [ %t3674, %fixfast901 ], [ %t3675, %fixslow902 ]
  %t3677 = icmp ne i64 %t3676, 1
  br i1 %t3677, label %then904, label %else905
then904:
  %t3678 = call ptr @rt_alloc_words(i64 6)
  %t3679 = ptrtoint ptr %t3678 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_768" to i64), ptr %t3678
  %t3680 = or i64 %t3679, 4
  %t3681 = getelementptr i64, ptr %t3678, i64 1
  store i64 %a0, ptr %t3681
  %t3682 = getelementptr i64, ptr %t3678, i64 2
  store i64 %a1, ptr %t3682
  %t3683 = getelementptr i64, ptr %t3678, i64 3
  store i64 %a2, ptr %t3683
  %t3684 = getelementptr i64, ptr %t3678, i64 4
  store i64 %t3632, ptr %t3684
  %t3685 = getelementptr i64, ptr %t3678, i64 5
  store i64 %t3680, ptr %t3685
  %t3686 = or i64 %t3638, %t3632
  %t3687 = and i64 %t3686, 7
  %t3688 = icmp eq i64 %t3687, 0
  br i1 %t3688, label %fixfast906, label %fixslow907
fixfast906:
  %t3689 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3638, i64 %t3632)
  %t3690 = extractvalue {i64, i1} %t3689, 0
  %t3691 = extractvalue {i64, i1} %t3689, 1
  br i1 %t3691, label %fixslow907, label %fixmerge908
fixslow907:
  %t3692 = call i64 @rt_sub(i64 %t3638, i64 %t3632)
  br label %fixmerge908
fixmerge908:
  %t3693 = phi i64 [ %t3690, %fixfast906 ], [ %t3692, %fixslow907 ]
  %t3694 = or i64 %t3693, 8
  %t3695 = and i64 %t3694, 7
  %t3696 = icmp eq i64 %t3695, 0
  br i1 %t3696, label %fixfast909, label %fixslow910
fixfast909:
  %t3697 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3693, i64 8)
  %t3698 = extractvalue {i64, i1} %t3697, 0
  %t3699 = extractvalue {i64, i1} %t3697, 1
  br i1 %t3699, label %fixslow910, label %fixmerge911
fixslow910:
  %t3700 = call i64 @rt_sub(i64 %t3693, i64 8)
  br label %fixmerge911
fixmerge911:
  %t3701 = phi i64 [ %t3698, %fixfast909 ], [ %t3700, %fixslow910 ]
  %t3702 = musttail call fastcc i64 @"scheme.base:code_768"(i64 %t3680, i64 1, i64 %t3701, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3702
else905:
  %t3703 = call ptr @rt_alloc_words(i64 7)
  %t3704 = ptrtoint ptr %t3703 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_770" to i64), ptr %t3703
  %t3705 = or i64 %t3704, 4
  %t3706 = getelementptr i64, ptr %t3703, i64 1
  store i64 %t3638, ptr %t3706
  %t3707 = getelementptr i64, ptr %t3703, i64 2
  store i64 %t3632, ptr %t3707
  %t3708 = getelementptr i64, ptr %t3703, i64 3
  store i64 %a0, ptr %t3708
  %t3709 = getelementptr i64, ptr %t3703, i64 4
  store i64 %a1, ptr %t3709
  %t3710 = getelementptr i64, ptr %t3703, i64 5
  store i64 %a2, ptr %t3710
  %t3711 = getelementptr i64, ptr %t3703, i64 6
  store i64 %t3705, ptr %t3711
  %t3712 = musttail call fastcc i64 @"scheme.base:code_770"(i64 %t3705, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3712
}

define fastcc i64 @"scheme.base:code_793"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3717 = icmp eq i64 %argc, 1
  br i1 %t3717, label %argok913, label %arityerr912
arityerr912:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok913:
  %t3718 = and i64 %self, -8
  %t3719 = inttoptr i64 %t3718 to ptr
  %t3720 = getelementptr i64, ptr %t3719, i64 1
  %t3721 = load i64, ptr %t3720
  %t3722 = or i64 %a0, %t3721
  %t3723 = and i64 %t3722, 7
  %t3724 = icmp eq i64 %t3723, 0
  br i1 %t3724, label %fixfast914, label %fixslow915
fixfast914:
  %t3725 = icmp eq i64 %a0, %t3721
  %t3726 = select i1 %t3725, i64 257, i64 1
  br label %fixmerge916
fixslow915:
  %t3727 = call i64 @rt_num_eq(i64 %a0, i64 %t3721)
  br label %fixmerge916
fixmerge916:
  %t3728 = phi i64 [ %t3726, %fixfast914 ], [ %t3727, %fixslow915 ]
  %t3729 = icmp ne i64 %t3728, 1
  br i1 %t3729, label %then917, label %else918
then917:
  %t3730 = and i64 %self, -8
  %t3731 = inttoptr i64 %t3730 to ptr
  %t3732 = getelementptr i64, ptr %t3731, i64 2
  %t3733 = load i64, ptr %t3732
  ret i64 %t3733
else918:
  %t3734 = and i64 %self, -8
  %t3735 = inttoptr i64 %t3734 to ptr
  %t3736 = getelementptr i64, ptr %t3735, i64 2
  %t3737 = load i64, ptr %t3736
  %t3738 = and i64 %self, -8
  %t3739 = inttoptr i64 %t3738 to ptr
  %t3740 = getelementptr i64, ptr %t3739, i64 4
  %t3741 = load i64, ptr %t3740
  %t3742 = call i64 @rt_vector_ref(i64 %t3741, i64 %a0)
  %t3743 = and i64 %self, -8
  %t3744 = inttoptr i64 %t3743 to ptr
  %t3745 = getelementptr i64, ptr %t3744, i64 3
  %t3746 = load i64, ptr %t3745
  %t3747 = and i64 %t3746, -8
  %t3748 = inttoptr i64 %t3747 to ptr
  %t3749 = load i64, ptr %t3748
  %t3750 = inttoptr i64 %t3749 to ptr
  %t3751 = call fastcc i64%t3750(i64 %t3746, i64 1, i64 %t3742, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3752 = call i64 @rt_vector_set(i64 %t3737, i64 %a0, i64 %t3751)
  %t3753 = or i64 %a0, 8
  %t3754 = and i64 %t3753, 7
  %t3755 = icmp eq i64 %t3754, 0
  br i1 %t3755, label %fixfast919, label %fixslow920
fixfast919:
  %t3756 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3757 = extractvalue {i64, i1} %t3756, 0
  %t3758 = extractvalue {i64, i1} %t3756, 1
  br i1 %t3758, label %fixslow920, label %fixmerge921
fixslow920:
  %t3759 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge921
fixmerge921:
  %t3760 = phi i64 [ %t3757, %fixfast919 ], [ %t3759, %fixslow920 ]
  %t3761 = musttail call fastcc i64 @"scheme.base:code_793"(i64 %self, i64 1, i64 %t3760, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3761
}

define fastcc i64 @"scheme.base:code_795"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3762 = icmp eq i64 %argc, 1
  br i1 %t3762, label %argok923, label %arityerr922
arityerr922:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok923:
  %t3763 = and i64 %self, -8
  %t3764 = inttoptr i64 %t3763 to ptr
  %t3765 = getelementptr i64, ptr %t3764, i64 1
  %t3766 = load i64, ptr %t3765
  %t3767 = or i64 %a0, %t3766
  %t3768 = and i64 %t3767, 7
  %t3769 = icmp eq i64 %t3768, 0
  br i1 %t3769, label %fixfast924, label %fixslow925
fixfast924:
  %t3770 = icmp eq i64 %a0, %t3766
  %t3771 = select i1 %t3770, i64 257, i64 1
  br label %fixmerge926
fixslow925:
  %t3772 = call i64 @rt_num_eq(i64 %a0, i64 %t3766)
  br label %fixmerge926
fixmerge926:
  %t3773 = phi i64 [ %t3771, %fixfast924 ], [ %t3772, %fixslow925 ]
  %t3774 = icmp ne i64 %t3773, 1
  br i1 %t3774, label %then927, label %else928
then927:
  %t3775 = and i64 %self, -8
  %t3776 = inttoptr i64 %t3775 to ptr
  %t3777 = getelementptr i64, ptr %t3776, i64 2
  %t3778 = load i64, ptr %t3777
  ret i64 %t3778
else928:
  %t3779 = and i64 %self, -8
  %t3780 = inttoptr i64 %t3779 to ptr
  %t3781 = getelementptr i64, ptr %t3780, i64 2
  %t3782 = load i64, ptr %t3781
  %t3783 = and i64 %self, -8
  %t3784 = inttoptr i64 %t3783 to ptr
  %t3785 = getelementptr i64, ptr %t3784, i64 4
  %t3786 = load i64, ptr %t3785
  %t3787 = load i64, ptr @"scheme.base:vec-nth"
  %t3788 = and i64 %t3787, -8
  %t3789 = inttoptr i64 %t3788 to ptr
  %t3790 = load i64, ptr %t3789
  %t3791 = inttoptr i64 %t3790 to ptr
  %t3792 = call fastcc i64%t3791(i64 %t3787, i64 2, i64 %t3786, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3793 = and i64 %self, -8
  %t3794 = inttoptr i64 %t3793 to ptr
  %t3795 = getelementptr i64, ptr %t3794, i64 3
  %t3796 = load i64, ptr %t3795
  %t3797 = and i64 %t3796, -8
  %t3798 = inttoptr i64 %t3797 to ptr
  %t3799 = load i64, ptr %t3798
  %t3800 = inttoptr i64 %t3799 to ptr
  %t3801 = call i64 @rt_list_length(i64 %t3792)
  %t3802 = add i64 0, %t3801
  %t3803 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t3792, i64 8)
  %t3815 = getelementptr i64, ptr %t3803, i64 0
  %t3807 = load i64, ptr %t3815
  %t3816 = getelementptr i64, ptr %t3803, i64 1
  %t3808 = load i64, ptr %t3816
  %t3817 = getelementptr i64, ptr %t3803, i64 2
  %t3809 = load i64, ptr %t3817
  %t3818 = getelementptr i64, ptr %t3803, i64 3
  %t3810 = load i64, ptr %t3818
  %t3819 = getelementptr i64, ptr %t3803, i64 4
  %t3811 = load i64, ptr %t3819
  %t3820 = getelementptr i64, ptr %t3803, i64 5
  %t3812 = load i64, ptr %t3820
  %t3821 = getelementptr i64, ptr %t3803, i64 6
  %t3813 = load i64, ptr %t3821
  %t3822 = getelementptr i64, ptr %t3803, i64 7
  %t3814 = load i64, ptr %t3822
  %t3804 = icmp sgt i64 %t3802, 8
  %t3805 = getelementptr i64, ptr %t3803, i64 8
  %t3806 = select i1 %t3804, ptr %t3805, ptr null
  %t3823 = call fastcc i64%t3800(i64 %t3796, i64 %t3802, i64 %t3807, i64 %t3808, i64 %t3809, i64 %t3810, i64 %t3811, i64 %t3812, i64 %t3813, i64 %t3814, ptr %t3806)
  %t3824 = call i64 @rt_vector_set(i64 %t3782, i64 %a0, i64 %t3823)
  %t3825 = or i64 %a0, 8
  %t3826 = and i64 %t3825, 7
  %t3827 = icmp eq i64 %t3826, 0
  br i1 %t3827, label %fixfast929, label %fixslow930
fixfast929:
  %t3828 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3829 = extractvalue {i64, i1} %t3828, 0
  %t3830 = extractvalue {i64, i1} %t3828, 1
  br i1 %t3830, label %fixslow930, label %fixmerge931
fixslow930:
  %t3831 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge931
fixmerge931:
  %t3832 = phi i64 [ %t3829, %fixfast929 ], [ %t3831, %fixslow930 ]
  %t3833 = musttail call fastcc i64 @"scheme.base:code_795"(i64 %self, i64 1, i64 %t3832, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3833
}

define fastcc i64 @"scheme.base:code:vector-map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3834 = icmp sge i64 %argc, 2
  br i1 %t3834, label %argok933, label %arityerr932
arityerr932:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok933:
  %t3835 = call ptr @rt_alloc_words(i64 8)
  %t3836 = getelementptr i64, ptr %t3835, i64 0
  store i64 %a0, ptr %t3836
  %t3837 = getelementptr i64, ptr %t3835, i64 1
  store i64 %a1, ptr %t3837
  %t3838 = getelementptr i64, ptr %t3835, i64 2
  store i64 %a2, ptr %t3838
  %t3839 = getelementptr i64, ptr %t3835, i64 3
  store i64 %a3, ptr %t3839
  %t3840 = getelementptr i64, ptr %t3835, i64 4
  store i64 %a4, ptr %t3840
  %t3841 = getelementptr i64, ptr %t3835, i64 5
  store i64 %a5, ptr %t3841
  %t3842 = getelementptr i64, ptr %t3835, i64 6
  store i64 %a6, ptr %t3842
  %t3843 = getelementptr i64, ptr %t3835, i64 7
  store i64 %a7, ptr %t3843
  %t3844 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3835, ptr %overflow)
  %t3845 = call i64 @rt_null_p(i64 %t3844)
  %t3846 = icmp ne i64 %t3845, 1
  br i1 %t3846, label %then934, label %else935
then934:
  %t3847 = call i64 @rt_vector_length(i64 %a1)
  %t3848 = call i64 @rt_make_vector(i64 %t3847, i64 0)
  %t3849 = call ptr @rt_alloc_words(i64 6)
  %t3850 = ptrtoint ptr %t3849 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_793" to i64), ptr %t3849
  %t3851 = or i64 %t3850, 4
  %t3852 = getelementptr i64, ptr %t3849, i64 1
  store i64 %t3847, ptr %t3852
  %t3853 = getelementptr i64, ptr %t3849, i64 2
  store i64 %t3848, ptr %t3853
  %t3854 = getelementptr i64, ptr %t3849, i64 3
  store i64 %a0, ptr %t3854
  %t3855 = getelementptr i64, ptr %t3849, i64 4
  store i64 %a1, ptr %t3855
  %t3856 = getelementptr i64, ptr %t3849, i64 5
  store i64 %t3851, ptr %t3856
  %t3857 = musttail call fastcc i64 @"scheme.base:code_793"(i64 %t3851, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3857
else935:
  %t3858 = call i64 @rt_cons(i64 %a1, i64 %t3844)
  %t3859 = load i64, ptr @"scheme.base:vec-min-len"
  %t3860 = and i64 %t3859, -8
  %t3861 = inttoptr i64 %t3860 to ptr
  %t3862 = load i64, ptr %t3861
  %t3863 = inttoptr i64 %t3862 to ptr
  %t3864 = call fastcc i64%t3863(i64 %t3859, i64 1, i64 %t3858, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3865 = call i64 @rt_make_vector(i64 %t3864, i64 0)
  %t3866 = call ptr @rt_alloc_words(i64 6)
  %t3867 = ptrtoint ptr %t3866 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_795" to i64), ptr %t3866
  %t3868 = or i64 %t3867, 4
  %t3869 = getelementptr i64, ptr %t3866, i64 1
  store i64 %t3864, ptr %t3869
  %t3870 = getelementptr i64, ptr %t3866, i64 2
  store i64 %t3865, ptr %t3870
  %t3871 = getelementptr i64, ptr %t3866, i64 3
  store i64 %a0, ptr %t3871
  %t3872 = getelementptr i64, ptr %t3866, i64 4
  store i64 %t3858, ptr %t3872
  %t3873 = getelementptr i64, ptr %t3866, i64 5
  store i64 %t3868, ptr %t3873
  %t3874 = musttail call fastcc i64 @"scheme.base:code_795"(i64 %t3868, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3874
}

define fastcc i64 @"scheme.base:code_816"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3879 = icmp eq i64 %argc, 1
  br i1 %t3879, label %argok937, label %arityerr936
arityerr936:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok937:
  %t3880 = and i64 %self, -8
  %t3881 = inttoptr i64 %t3880 to ptr
  %t3882 = getelementptr i64, ptr %t3881, i64 1
  %t3883 = load i64, ptr %t3882
  %t3884 = or i64 %a0, %t3883
  %t3885 = and i64 %t3884, 7
  %t3886 = icmp eq i64 %t3885, 0
  br i1 %t3886, label %fixfast938, label %fixslow939
fixfast938:
  %t3887 = icmp eq i64 %a0, %t3883
  %t3888 = select i1 %t3887, i64 257, i64 1
  br label %fixmerge940
fixslow939:
  %t3889 = call i64 @rt_num_eq(i64 %a0, i64 %t3883)
  br label %fixmerge940
fixmerge940:
  %t3890 = phi i64 [ %t3888, %fixfast938 ], [ %t3889, %fixslow939 ]
  %t3891 = icmp ne i64 %t3890, 1
  br i1 %t3891, label %then941, label %else942
then941:
  %t3892 = load i64, ptr @"scheme.base:void"
  %t3893 = and i64 %t3892, -8
  %t3894 = inttoptr i64 %t3893 to ptr
  %t3895 = load i64, ptr %t3894
  %t3896 = inttoptr i64 %t3895 to ptr
  %t3897 = musttail call fastcc i64 %t3896(i64 %t3892, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3897
else942:
  %t3898 = and i64 %self, -8
  %t3899 = inttoptr i64 %t3898 to ptr
  %t3900 = getelementptr i64, ptr %t3899, i64 3
  %t3901 = load i64, ptr %t3900
  %t3902 = call i64 @rt_vector_ref(i64 %t3901, i64 %a0)
  %t3903 = and i64 %self, -8
  %t3904 = inttoptr i64 %t3903 to ptr
  %t3905 = getelementptr i64, ptr %t3904, i64 2
  %t3906 = load i64, ptr %t3905
  %t3907 = and i64 %t3906, -8
  %t3908 = inttoptr i64 %t3907 to ptr
  %t3909 = load i64, ptr %t3908
  %t3910 = inttoptr i64 %t3909 to ptr
  %t3911 = call fastcc i64%t3910(i64 %t3906, i64 1, i64 %t3902, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3912 = or i64 %a0, 8
  %t3913 = and i64 %t3912, 7
  %t3914 = icmp eq i64 %t3913, 0
  br i1 %t3914, label %fixfast943, label %fixslow944
fixfast943:
  %t3915 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3916 = extractvalue {i64, i1} %t3915, 0
  %t3917 = extractvalue {i64, i1} %t3915, 1
  br i1 %t3917, label %fixslow944, label %fixmerge945
fixslow944:
  %t3918 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge945
fixmerge945:
  %t3919 = phi i64 [ %t3916, %fixfast943 ], [ %t3918, %fixslow944 ]
  %t3920 = musttail call fastcc i64 @"scheme.base:code_816"(i64 %self, i64 1, i64 %t3919, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3920
}

define fastcc i64 @"scheme.base:code_818"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3921 = icmp eq i64 %argc, 1
  br i1 %t3921, label %argok947, label %arityerr946
arityerr946:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok947:
  %t3922 = and i64 %self, -8
  %t3923 = inttoptr i64 %t3922 to ptr
  %t3924 = getelementptr i64, ptr %t3923, i64 1
  %t3925 = load i64, ptr %t3924
  %t3926 = or i64 %a0, %t3925
  %t3927 = and i64 %t3926, 7
  %t3928 = icmp eq i64 %t3927, 0
  br i1 %t3928, label %fixfast948, label %fixslow949
fixfast948:
  %t3929 = icmp eq i64 %a0, %t3925
  %t3930 = select i1 %t3929, i64 257, i64 1
  br label %fixmerge950
fixslow949:
  %t3931 = call i64 @rt_num_eq(i64 %a0, i64 %t3925)
  br label %fixmerge950
fixmerge950:
  %t3932 = phi i64 [ %t3930, %fixfast948 ], [ %t3931, %fixslow949 ]
  %t3933 = icmp ne i64 %t3932, 1
  br i1 %t3933, label %then951, label %else952
then951:
  %t3934 = load i64, ptr @"scheme.base:void"
  %t3935 = and i64 %t3934, -8
  %t3936 = inttoptr i64 %t3935 to ptr
  %t3937 = load i64, ptr %t3936
  %t3938 = inttoptr i64 %t3937 to ptr
  %t3939 = musttail call fastcc i64 %t3938(i64 %t3934, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3939
else952:
  %t3940 = and i64 %self, -8
  %t3941 = inttoptr i64 %t3940 to ptr
  %t3942 = getelementptr i64, ptr %t3941, i64 3
  %t3943 = load i64, ptr %t3942
  %t3944 = load i64, ptr @"scheme.base:vec-nth"
  %t3945 = and i64 %t3944, -8
  %t3946 = inttoptr i64 %t3945 to ptr
  %t3947 = load i64, ptr %t3946
  %t3948 = inttoptr i64 %t3947 to ptr
  %t3949 = call fastcc i64%t3948(i64 %t3944, i64 2, i64 %t3943, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3950 = and i64 %self, -8
  %t3951 = inttoptr i64 %t3950 to ptr
  %t3952 = getelementptr i64, ptr %t3951, i64 2
  %t3953 = load i64, ptr %t3952
  %t3954 = and i64 %t3953, -8
  %t3955 = inttoptr i64 %t3954 to ptr
  %t3956 = load i64, ptr %t3955
  %t3957 = inttoptr i64 %t3956 to ptr
  %t3958 = call i64 @rt_list_length(i64 %t3949)
  %t3959 = add i64 0, %t3958
  %t3960 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t3949, i64 8)
  %t3972 = getelementptr i64, ptr %t3960, i64 0
  %t3964 = load i64, ptr %t3972
  %t3973 = getelementptr i64, ptr %t3960, i64 1
  %t3965 = load i64, ptr %t3973
  %t3974 = getelementptr i64, ptr %t3960, i64 2
  %t3966 = load i64, ptr %t3974
  %t3975 = getelementptr i64, ptr %t3960, i64 3
  %t3967 = load i64, ptr %t3975
  %t3976 = getelementptr i64, ptr %t3960, i64 4
  %t3968 = load i64, ptr %t3976
  %t3977 = getelementptr i64, ptr %t3960, i64 5
  %t3969 = load i64, ptr %t3977
  %t3978 = getelementptr i64, ptr %t3960, i64 6
  %t3970 = load i64, ptr %t3978
  %t3979 = getelementptr i64, ptr %t3960, i64 7
  %t3971 = load i64, ptr %t3979
  %t3961 = icmp sgt i64 %t3959, 8
  %t3962 = getelementptr i64, ptr %t3960, i64 8
  %t3963 = select i1 %t3961, ptr %t3962, ptr null
  %t3980 = call fastcc i64%t3957(i64 %t3953, i64 %t3959, i64 %t3964, i64 %t3965, i64 %t3966, i64 %t3967, i64 %t3968, i64 %t3969, i64 %t3970, i64 %t3971, ptr %t3963)
  %t3981 = or i64 %a0, 8
  %t3982 = and i64 %t3981, 7
  %t3983 = icmp eq i64 %t3982, 0
  br i1 %t3983, label %fixfast953, label %fixslow954
fixfast953:
  %t3984 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3985 = extractvalue {i64, i1} %t3984, 0
  %t3986 = extractvalue {i64, i1} %t3984, 1
  br i1 %t3986, label %fixslow954, label %fixmerge955
fixslow954:
  %t3987 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge955
fixmerge955:
  %t3988 = phi i64 [ %t3985, %fixfast953 ], [ %t3987, %fixslow954 ]
  %t3989 = musttail call fastcc i64 @"scheme.base:code_818"(i64 %self, i64 1, i64 %t3988, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3989
}

define fastcc i64 @"scheme.base:code:vector-for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3990 = icmp sge i64 %argc, 2
  br i1 %t3990, label %argok957, label %arityerr956
arityerr956:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok957:
  %t3991 = call ptr @rt_alloc_words(i64 8)
  %t3992 = getelementptr i64, ptr %t3991, i64 0
  store i64 %a0, ptr %t3992
  %t3993 = getelementptr i64, ptr %t3991, i64 1
  store i64 %a1, ptr %t3993
  %t3994 = getelementptr i64, ptr %t3991, i64 2
  store i64 %a2, ptr %t3994
  %t3995 = getelementptr i64, ptr %t3991, i64 3
  store i64 %a3, ptr %t3995
  %t3996 = getelementptr i64, ptr %t3991, i64 4
  store i64 %a4, ptr %t3996
  %t3997 = getelementptr i64, ptr %t3991, i64 5
  store i64 %a5, ptr %t3997
  %t3998 = getelementptr i64, ptr %t3991, i64 6
  store i64 %a6, ptr %t3998
  %t3999 = getelementptr i64, ptr %t3991, i64 7
  store i64 %a7, ptr %t3999
  %t4000 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3991, ptr %overflow)
  %t4001 = call i64 @rt_null_p(i64 %t4000)
  %t4002 = icmp ne i64 %t4001, 1
  br i1 %t4002, label %then958, label %else959
then958:
  %t4003 = call i64 @rt_vector_length(i64 %a1)
  %t4004 = call ptr @rt_alloc_words(i64 5)
  %t4005 = ptrtoint ptr %t4004 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_816" to i64), ptr %t4004
  %t4006 = or i64 %t4005, 4
  %t4007 = getelementptr i64, ptr %t4004, i64 1
  store i64 %t4003, ptr %t4007
  %t4008 = getelementptr i64, ptr %t4004, i64 2
  store i64 %a0, ptr %t4008
  %t4009 = getelementptr i64, ptr %t4004, i64 3
  store i64 %a1, ptr %t4009
  %t4010 = getelementptr i64, ptr %t4004, i64 4
  store i64 %t4006, ptr %t4010
  %t4011 = musttail call fastcc i64 @"scheme.base:code_816"(i64 %t4006, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4011
else959:
  %t4012 = call i64 @rt_cons(i64 %a1, i64 %t4000)
  %t4013 = load i64, ptr @"scheme.base:vec-min-len"
  %t4014 = and i64 %t4013, -8
  %t4015 = inttoptr i64 %t4014 to ptr
  %t4016 = load i64, ptr %t4015
  %t4017 = inttoptr i64 %t4016 to ptr
  %t4018 = call fastcc i64%t4017(i64 %t4013, i64 1, i64 %t4012, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4019 = call ptr @rt_alloc_words(i64 5)
  %t4020 = ptrtoint ptr %t4019 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_818" to i64), ptr %t4019
  %t4021 = or i64 %t4020, 4
  %t4022 = getelementptr i64, ptr %t4019, i64 1
  store i64 %t4018, ptr %t4022
  %t4023 = getelementptr i64, ptr %t4019, i64 2
  store i64 %a0, ptr %t4023
  %t4024 = getelementptr i64, ptr %t4019, i64 3
  store i64 %t4012, ptr %t4024
  %t4025 = getelementptr i64, ptr %t4019, i64 4
  store i64 %t4021, ptr %t4025
  %t4026 = musttail call fastcc i64 @"scheme.base:code_818"(i64 %t4021, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4026
}

define fastcc i64 @"scheme.base:code:vec-min-len"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4031 = icmp eq i64 %argc, 1
  br i1 %t4031, label %argok961, label %arityerr960
arityerr960:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok961:
  %t4032 = call i64 @rt_cdr(i64 %a0)
  %t4033 = call i64 @rt_null_p(i64 %t4032)
  %t4034 = icmp ne i64 %t4033, 1
  br i1 %t4034, label %then962, label %else963
then962:
  %t4035 = call i64 @rt_car(i64 %a0)
  %t4036 = call i64 @rt_vector_length(i64 %t4035)
  ret i64 %t4036
else963:
  %t4037 = call i64 @rt_car(i64 %a0)
  %t4038 = call i64 @rt_vector_length(i64 %t4037)
  %t4039 = call i64 @rt_cdr(i64 %a0)
  %t4040 = load i64, ptr @"scheme.base:vec-min-len"
  %t4041 = and i64 %t4040, -8
  %t4042 = inttoptr i64 %t4041 to ptr
  %t4043 = load i64, ptr %t4042
  %t4044 = inttoptr i64 %t4043 to ptr
  %t4045 = call fastcc i64%t4044(i64 %t4040, i64 1, i64 %t4039, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4046 = or i64 %t4038, %t4045
  %t4047 = and i64 %t4046, 7
  %t4048 = icmp eq i64 %t4047, 0
  br i1 %t4048, label %fixfast964, label %fixslow965
fixfast964:
  %t4049 = icmp slt i64 %t4038, %t4045
  %t4050 = select i1 %t4049, i64 257, i64 1
  br label %fixmerge966
fixslow965:
  %t4051 = call i64 @rt_lt(i64 %t4038, i64 %t4045)
  br label %fixmerge966
fixmerge966:
  %t4052 = phi i64 [ %t4050, %fixfast964 ], [ %t4051, %fixslow965 ]
  %t4053 = icmp ne i64 %t4052, 1
  br i1 %t4053, label %then967, label %else968
then967:
  ret i64 %t4038
else968:
  ret i64 %t4045
}

define fastcc i64 @"scheme.base:code:vec-nth"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4058 = icmp eq i64 %argc, 2
  br i1 %t4058, label %argok970, label %arityerr969
arityerr969:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok970:
  %t4059 = call i64 @rt_null_p(i64 %a0)
  %t4060 = icmp ne i64 %t4059, 1
  br i1 %t4060, label %then971, label %else972
then971:
  ret i64 2
else972:
  %t4061 = call i64 @rt_car(i64 %a0)
  %t4062 = call i64 @rt_vector_ref(i64 %t4061, i64 %a1)
  %t4063 = call i64 @rt_cdr(i64 %a0)
  %t4064 = load i64, ptr @"scheme.base:vec-nth"
  %t4065 = and i64 %t4064, -8
  %t4066 = inttoptr i64 %t4065 to ptr
  %t4067 = load i64, ptr %t4066
  %t4068 = inttoptr i64 %t4067 to ptr
  %t4069 = call fastcc i64%t4068(i64 %t4064, i64 2, i64 %t4063, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4070 = call i64 @rt_cons(i64 %t4062, i64 %t4069)
  ret i64 %t4070
}

define fastcc i64 @"scheme.base:code_844"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4075 = icmp eq i64 %argc, 1
  br i1 %t4075, label %argok974, label %arityerr973
arityerr973:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok974:
  %t4076 = and i64 %self, -8
  %t4077 = inttoptr i64 %t4076 to ptr
  %t4078 = getelementptr i64, ptr %t4077, i64 1
  %t4079 = load i64, ptr %t4078
  %t4080 = or i64 %a0, %t4079
  %t4081 = and i64 %t4080, 7
  %t4082 = icmp eq i64 %t4081, 0
  br i1 %t4082, label %fixfast975, label %fixslow976
fixfast975:
  %t4083 = icmp eq i64 %a0, %t4079
  %t4084 = select i1 %t4083, i64 257, i64 1
  br label %fixmerge977
fixslow976:
  %t4085 = call i64 @rt_num_eq(i64 %a0, i64 %t4079)
  br label %fixmerge977
fixmerge977:
  %t4086 = phi i64 [ %t4084, %fixfast975 ], [ %t4085, %fixslow976 ]
  %t4087 = icmp ne i64 %t4086, 1
  br i1 %t4087, label %then978, label %else979
then978:
  %t4088 = and i64 %self, -8
  %t4089 = inttoptr i64 %t4088 to ptr
  %t4090 = getelementptr i64, ptr %t4089, i64 2
  %t4091 = load i64, ptr %t4090
  ret i64 %t4091
else979:
  %t4092 = and i64 %self, -8
  %t4093 = inttoptr i64 %t4092 to ptr
  %t4094 = getelementptr i64, ptr %t4093, i64 2
  %t4095 = load i64, ptr %t4094
  %t4096 = and i64 %self, -8
  %t4097 = inttoptr i64 %t4096 to ptr
  %t4098 = getelementptr i64, ptr %t4097, i64 3
  %t4099 = load i64, ptr %t4098
  %t4100 = or i64 %a0, %t4099
  %t4101 = and i64 %t4100, 7
  %t4102 = icmp eq i64 %t4101, 0
  br i1 %t4102, label %fixfast980, label %fixslow981
fixfast980:
  %t4103 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t4099)
  %t4104 = extractvalue {i64, i1} %t4103, 0
  %t4105 = extractvalue {i64, i1} %t4103, 1
  br i1 %t4105, label %fixslow981, label %fixmerge982
fixslow981:
  %t4106 = call i64 @rt_sub(i64 %a0, i64 %t4099)
  br label %fixmerge982
fixmerge982:
  %t4107 = phi i64 [ %t4104, %fixfast980 ], [ %t4106, %fixslow981 ]
  %t4108 = and i64 %self, -8
  %t4109 = inttoptr i64 %t4108 to ptr
  %t4110 = getelementptr i64, ptr %t4109, i64 4
  %t4111 = load i64, ptr %t4110
  %t4112 = call i64 @rt_string_ref(i64 %t4111, i64 %a0)
  %t4113 = call i64 @rt_vector_set(i64 %t4095, i64 %t4107, i64 %t4112)
  %t4114 = or i64 %a0, 8
  %t4115 = and i64 %t4114, 7
  %t4116 = icmp eq i64 %t4115, 0
  br i1 %t4116, label %fixfast983, label %fixslow984
fixfast983:
  %t4117 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4118 = extractvalue {i64, i1} %t4117, 0
  %t4119 = extractvalue {i64, i1} %t4117, 1
  br i1 %t4119, label %fixslow984, label %fixmerge985
fixslow984:
  %t4120 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge985
fixmerge985:
  %t4121 = phi i64 [ %t4118, %fixfast983 ], [ %t4120, %fixslow984 ]
  %t4122 = musttail call fastcc i64 @"scheme.base:code_844"(i64 %self, i64 1, i64 %t4121, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4122
}

define fastcc i64 @"scheme.base:code:string->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4123 = icmp sge i64 %argc, 1
  br i1 %t4123, label %argok987, label %arityerr986
arityerr986:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok987:
  %t4124 = call ptr @rt_alloc_words(i64 8)
  %t4125 = getelementptr i64, ptr %t4124, i64 0
  store i64 %a0, ptr %t4125
  %t4126 = getelementptr i64, ptr %t4124, i64 1
  store i64 %a1, ptr %t4126
  %t4127 = getelementptr i64, ptr %t4124, i64 2
  store i64 %a2, ptr %t4127
  %t4128 = getelementptr i64, ptr %t4124, i64 3
  store i64 %a3, ptr %t4128
  %t4129 = getelementptr i64, ptr %t4124, i64 4
  store i64 %a4, ptr %t4129
  %t4130 = getelementptr i64, ptr %t4124, i64 5
  store i64 %a5, ptr %t4130
  %t4131 = getelementptr i64, ptr %t4124, i64 6
  store i64 %a6, ptr %t4131
  %t4132 = getelementptr i64, ptr %t4124, i64 7
  store i64 %a7, ptr %t4132
  %t4133 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t4124, ptr %overflow)
  %t4134 = call i64 @rt_string_length(i64 %a0)
  %t4135 = load i64, ptr @"scheme.base:rng-start"
  %t4136 = and i64 %t4135, -8
  %t4137 = inttoptr i64 %t4136 to ptr
  %t4138 = load i64, ptr %t4137
  %t4139 = inttoptr i64 %t4138 to ptr
  %t4140 = call fastcc i64%t4139(i64 %t4135, i64 1, i64 %t4133, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4141 = load i64, ptr @"scheme.base:rng-end"
  %t4142 = and i64 %t4141, -8
  %t4143 = inttoptr i64 %t4142 to ptr
  %t4144 = load i64, ptr %t4143
  %t4145 = inttoptr i64 %t4144 to ptr
  %t4146 = call fastcc i64%t4145(i64 %t4141, i64 2, i64 %t4133, i64 %t4134, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4147 = call i64 @rt_intern(ptr @.str.sym.18)
  %t4148 = load i64, ptr @"scheme.base:rng-check"
  %t4149 = and i64 %t4148, -8
  %t4150 = inttoptr i64 %t4149 to ptr
  %t4151 = load i64, ptr %t4150
  %t4152 = inttoptr i64 %t4151 to ptr
  %t4153 = call fastcc i64%t4152(i64 %t4148, i64 4, i64 %t4147, i64 %t4140, i64 %t4146, i64 %t4134, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4154 = or i64 %t4146, %t4140
  %t4155 = and i64 %t4154, 7
  %t4156 = icmp eq i64 %t4155, 0
  br i1 %t4156, label %fixfast988, label %fixslow989
fixfast988:
  %t4157 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4146, i64 %t4140)
  %t4158 = extractvalue {i64, i1} %t4157, 0
  %t4159 = extractvalue {i64, i1} %t4157, 1
  br i1 %t4159, label %fixslow989, label %fixmerge990
fixslow989:
  %t4160 = call i64 @rt_sub(i64 %t4146, i64 %t4140)
  br label %fixmerge990
fixmerge990:
  %t4161 = phi i64 [ %t4158, %fixfast988 ], [ %t4160, %fixslow989 ]
  %t4162 = call i64 @rt_make_vector(i64 %t4161, i64 0)
  %t4163 = call ptr @rt_alloc_words(i64 6)
  %t4164 = ptrtoint ptr %t4163 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_844" to i64), ptr %t4163
  %t4165 = or i64 %t4164, 4
  %t4166 = getelementptr i64, ptr %t4163, i64 1
  store i64 %t4146, ptr %t4166
  %t4167 = getelementptr i64, ptr %t4163, i64 2
  store i64 %t4162, ptr %t4167
  %t4168 = getelementptr i64, ptr %t4163, i64 3
  store i64 %t4140, ptr %t4168
  %t4169 = getelementptr i64, ptr %t4163, i64 4
  store i64 %a0, ptr %t4169
  %t4170 = getelementptr i64, ptr %t4163, i64 5
  store i64 %t4165, ptr %t4170
  %t4171 = musttail call fastcc i64 @"scheme.base:code_844"(i64 %t4165, i64 1, i64 %t4140, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4171
}

define fastcc i64 @"scheme.base:code:vector->string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4176 = icmp sge i64 %argc, 1
  br i1 %t4176, label %argok992, label %arityerr991
arityerr991:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok992:
  %t4177 = call ptr @rt_alloc_words(i64 8)
  %t4178 = getelementptr i64, ptr %t4177, i64 0
  store i64 %a0, ptr %t4178
  %t4179 = getelementptr i64, ptr %t4177, i64 1
  store i64 %a1, ptr %t4179
  %t4180 = getelementptr i64, ptr %t4177, i64 2
  store i64 %a2, ptr %t4180
  %t4181 = getelementptr i64, ptr %t4177, i64 3
  store i64 %a3, ptr %t4181
  %t4182 = getelementptr i64, ptr %t4177, i64 4
  store i64 %a4, ptr %t4182
  %t4183 = getelementptr i64, ptr %t4177, i64 5
  store i64 %a5, ptr %t4183
  %t4184 = getelementptr i64, ptr %t4177, i64 6
  store i64 %a6, ptr %t4184
  %t4185 = getelementptr i64, ptr %t4177, i64 7
  store i64 %a7, ptr %t4185
  %t4186 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t4177, ptr %overflow)
  %t4187 = call i64 @rt_vector_length(i64 %a0)
  %t4188 = load i64, ptr @"scheme.base:rng-start"
  %t4189 = and i64 %t4188, -8
  %t4190 = inttoptr i64 %t4189 to ptr
  %t4191 = load i64, ptr %t4190
  %t4192 = inttoptr i64 %t4191 to ptr
  %t4193 = call fastcc i64%t4192(i64 %t4188, i64 1, i64 %t4186, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4194 = load i64, ptr @"scheme.base:rng-end"
  %t4195 = and i64 %t4194, -8
  %t4196 = inttoptr i64 %t4195 to ptr
  %t4197 = load i64, ptr %t4196
  %t4198 = inttoptr i64 %t4197 to ptr
  %t4199 = call fastcc i64%t4198(i64 %t4194, i64 2, i64 %t4186, i64 %t4187, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4200 = call i64 @rt_intern(ptr @.str.sym.19)
  %t4201 = load i64, ptr @"scheme.base:rng-check"
  %t4202 = and i64 %t4201, -8
  %t4203 = inttoptr i64 %t4202 to ptr
  %t4204 = load i64, ptr %t4203
  %t4205 = inttoptr i64 %t4204 to ptr
  %t4206 = call fastcc i64%t4205(i64 %t4201, i64 4, i64 %t4200, i64 %t4193, i64 %t4199, i64 %t4187, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4207 = load i64, ptr @"scheme.base:vector->list"
  %t4208 = and i64 %t4207, -8
  %t4209 = inttoptr i64 %t4208 to ptr
  %t4210 = load i64, ptr %t4209
  %t4211 = inttoptr i64 %t4210 to ptr
  %t4212 = call fastcc i64%t4211(i64 %t4207, i64 3, i64 %a0, i64 %t4193, i64 %t4199, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4213 = call i64 @rt_list_to_string(i64 %t4212)
  ret i64 %t4213
}

define fastcc i64 @"scheme.base:code:string-map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4218 = icmp sge i64 %argc, 2
  br i1 %t4218, label %argok994, label %arityerr993
arityerr993:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok994:
  %t4219 = call ptr @rt_alloc_words(i64 8)
  %t4220 = getelementptr i64, ptr %t4219, i64 0
  store i64 %a0, ptr %t4220
  %t4221 = getelementptr i64, ptr %t4219, i64 1
  store i64 %a1, ptr %t4221
  %t4222 = getelementptr i64, ptr %t4219, i64 2
  store i64 %a2, ptr %t4222
  %t4223 = getelementptr i64, ptr %t4219, i64 3
  store i64 %a3, ptr %t4223
  %t4224 = getelementptr i64, ptr %t4219, i64 4
  store i64 %a4, ptr %t4224
  %t4225 = getelementptr i64, ptr %t4219, i64 5
  store i64 %a5, ptr %t4225
  %t4226 = getelementptr i64, ptr %t4219, i64 6
  store i64 %a6, ptr %t4226
  %t4227 = getelementptr i64, ptr %t4219, i64 7
  store i64 %a7, ptr %t4227
  %t4228 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t4219, ptr %overflow)
  %t4229 = call i64 @rt_null_p(i64 %t4228)
  %t4230 = icmp ne i64 %t4229, 1
  br i1 %t4230, label %then995, label %else996
then995:
  %t4231 = load i64, ptr @"scheme.base:string->list"
  %t4232 = and i64 %t4231, -8
  %t4233 = inttoptr i64 %t4232 to ptr
  %t4234 = load i64, ptr %t4233
  %t4235 = inttoptr i64 %t4234 to ptr
  %t4236 = call fastcc i64%t4235(i64 %t4231, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4237 = load i64, ptr @"scheme.base:str-map1"
  %t4238 = and i64 %t4237, -8
  %t4239 = inttoptr i64 %t4238 to ptr
  %t4240 = load i64, ptr %t4239
  %t4241 = inttoptr i64 %t4240 to ptr
  %t4242 = call fastcc i64%t4241(i64 %t4237, i64 2, i64 %a0, i64 %t4236, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4243 = call i64 @rt_list_to_string(i64 %t4242)
  ret i64 %t4243
else996:
  %t4244 = call i64 @rt_cons(i64 %a1, i64 %t4228)
  %t4245 = load i64, ptr @"scheme.base:str-mapn"
  %t4246 = and i64 %t4245, -8
  %t4247 = inttoptr i64 %t4246 to ptr
  %t4248 = load i64, ptr %t4247
  %t4249 = inttoptr i64 %t4248 to ptr
  %t4250 = call fastcc i64%t4249(i64 %t4245, i64 2, i64 %a0, i64 %t4244, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4251 = call i64 @rt_list_to_string(i64 %t4250)
  ret i64 %t4251
}

define fastcc i64 @"scheme.base:code:str-map1"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4256 = icmp eq i64 %argc, 2
  br i1 %t4256, label %argok998, label %arityerr997
arityerr997:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok998:
  %t4257 = call i64 @rt_null_p(i64 %a1)
  %t4258 = icmp ne i64 %t4257, 1
  br i1 %t4258, label %then999, label %else1000
then999:
  ret i64 2
else1000:
  %t4259 = call i64 @rt_car(i64 %a1)
  %t4260 = and i64 %a0, -8
  %t4261 = inttoptr i64 %t4260 to ptr
  %t4262 = load i64, ptr %t4261
  %t4263 = inttoptr i64 %t4262 to ptr
  %t4264 = call fastcc i64%t4263(i64 %a0, i64 1, i64 %t4259, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4265 = call i64 @rt_cdr(i64 %a1)
  %t4266 = load i64, ptr @"scheme.base:str-map1"
  %t4267 = and i64 %t4266, -8
  %t4268 = inttoptr i64 %t4267 to ptr
  %t4269 = load i64, ptr %t4268
  %t4270 = inttoptr i64 %t4269 to ptr
  %t4271 = call fastcc i64%t4270(i64 %t4266, i64 2, i64 %a0, i64 %t4265, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4272 = call i64 @rt_cons(i64 %t4264, i64 %t4271)
  ret i64 %t4272
}

define fastcc i64 @"scheme.base:code_869"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4277 = icmp eq i64 %argc, 1
  br i1 %t4277, label %argok1002, label %arityerr1001
arityerr1001:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1002:
  %t4278 = and i64 %self, -8
  %t4279 = inttoptr i64 %t4278 to ptr
  %t4280 = getelementptr i64, ptr %t4279, i64 1
  %t4281 = load i64, ptr %t4280
  %t4282 = or i64 %a0, %t4281
  %t4283 = and i64 %t4282, 7
  %t4284 = icmp eq i64 %t4283, 0
  br i1 %t4284, label %fixfast1003, label %fixslow1004
fixfast1003:
  %t4285 = icmp eq i64 %a0, %t4281
  %t4286 = select i1 %t4285, i64 257, i64 1
  br label %fixmerge1005
fixslow1004:
  %t4287 = call i64 @rt_num_eq(i64 %a0, i64 %t4281)
  br label %fixmerge1005
fixmerge1005:
  %t4288 = phi i64 [ %t4286, %fixfast1003 ], [ %t4287, %fixslow1004 ]
  %t4289 = icmp ne i64 %t4288, 1
  br i1 %t4289, label %then1006, label %else1007
then1006:
  ret i64 2
else1007:
  %t4290 = and i64 %self, -8
  %t4291 = inttoptr i64 %t4290 to ptr
  %t4292 = getelementptr i64, ptr %t4291, i64 3
  %t4293 = load i64, ptr %t4292
  %t4294 = load i64, ptr @"scheme.base:str-nth"
  %t4295 = and i64 %t4294, -8
  %t4296 = inttoptr i64 %t4295 to ptr
  %t4297 = load i64, ptr %t4296
  %t4298 = inttoptr i64 %t4297 to ptr
  %t4299 = call fastcc i64%t4298(i64 %t4294, i64 2, i64 %t4293, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4300 = and i64 %self, -8
  %t4301 = inttoptr i64 %t4300 to ptr
  %t4302 = getelementptr i64, ptr %t4301, i64 2
  %t4303 = load i64, ptr %t4302
  %t4304 = and i64 %t4303, -8
  %t4305 = inttoptr i64 %t4304 to ptr
  %t4306 = load i64, ptr %t4305
  %t4307 = inttoptr i64 %t4306 to ptr
  %t4308 = call i64 @rt_list_length(i64 %t4299)
  %t4309 = add i64 0, %t4308
  %t4310 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t4299, i64 8)
  %t4322 = getelementptr i64, ptr %t4310, i64 0
  %t4314 = load i64, ptr %t4322
  %t4323 = getelementptr i64, ptr %t4310, i64 1
  %t4315 = load i64, ptr %t4323
  %t4324 = getelementptr i64, ptr %t4310, i64 2
  %t4316 = load i64, ptr %t4324
  %t4325 = getelementptr i64, ptr %t4310, i64 3
  %t4317 = load i64, ptr %t4325
  %t4326 = getelementptr i64, ptr %t4310, i64 4
  %t4318 = load i64, ptr %t4326
  %t4327 = getelementptr i64, ptr %t4310, i64 5
  %t4319 = load i64, ptr %t4327
  %t4328 = getelementptr i64, ptr %t4310, i64 6
  %t4320 = load i64, ptr %t4328
  %t4329 = getelementptr i64, ptr %t4310, i64 7
  %t4321 = load i64, ptr %t4329
  %t4311 = icmp sgt i64 %t4309, 8
  %t4312 = getelementptr i64, ptr %t4310, i64 8
  %t4313 = select i1 %t4311, ptr %t4312, ptr null
  %t4330 = call fastcc i64%t4307(i64 %t4303, i64 %t4309, i64 %t4314, i64 %t4315, i64 %t4316, i64 %t4317, i64 %t4318, i64 %t4319, i64 %t4320, i64 %t4321, ptr %t4313)
  %t4331 = or i64 %a0, 8
  %t4332 = and i64 %t4331, 7
  %t4333 = icmp eq i64 %t4332, 0
  br i1 %t4333, label %fixfast1008, label %fixslow1009
fixfast1008:
  %t4334 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4335 = extractvalue {i64, i1} %t4334, 0
  %t4336 = extractvalue {i64, i1} %t4334, 1
  br i1 %t4336, label %fixslow1009, label %fixmerge1010
fixslow1009:
  %t4337 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1010
fixmerge1010:
  %t4338 = phi i64 [ %t4335, %fixfast1008 ], [ %t4337, %fixslow1009 ]
  %t4339 = call fastcc i64 @"scheme.base:code_869"(i64 %self, i64 1, i64 %t4338, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4340 = call i64 @rt_cons(i64 %t4330, i64 %t4339)
  ret i64 %t4340
}

define fastcc i64 @"scheme.base:code:str-mapn"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4341 = icmp eq i64 %argc, 2
  br i1 %t4341, label %argok1012, label %arityerr1011
arityerr1011:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1012:
  %t4342 = load i64, ptr @"scheme.base:str-min-len"
  %t4343 = and i64 %t4342, -8
  %t4344 = inttoptr i64 %t4343 to ptr
  %t4345 = load i64, ptr %t4344
  %t4346 = inttoptr i64 %t4345 to ptr
  %t4347 = call fastcc i64%t4346(i64 %t4342, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4348 = call ptr @rt_alloc_words(i64 5)
  %t4349 = ptrtoint ptr %t4348 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_869" to i64), ptr %t4348
  %t4350 = or i64 %t4349, 4
  %t4351 = getelementptr i64, ptr %t4348, i64 1
  store i64 %t4347, ptr %t4351
  %t4352 = getelementptr i64, ptr %t4348, i64 2
  store i64 %a0, ptr %t4352
  %t4353 = getelementptr i64, ptr %t4348, i64 3
  store i64 %a1, ptr %t4353
  %t4354 = getelementptr i64, ptr %t4348, i64 4
  store i64 %t4350, ptr %t4354
  %t4355 = musttail call fastcc i64 @"scheme.base:code_869"(i64 %t4350, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4355
}

define fastcc i64 @"scheme.base:code_890"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4360 = icmp eq i64 %argc, 1
  br i1 %t4360, label %argok1014, label %arityerr1013
arityerr1013:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1014:
  %t4361 = and i64 %self, -8
  %t4362 = inttoptr i64 %t4361 to ptr
  %t4363 = getelementptr i64, ptr %t4362, i64 1
  %t4364 = load i64, ptr %t4363
  %t4365 = or i64 %a0, %t4364
  %t4366 = and i64 %t4365, 7
  %t4367 = icmp eq i64 %t4366, 0
  br i1 %t4367, label %fixfast1015, label %fixslow1016
fixfast1015:
  %t4368 = icmp eq i64 %a0, %t4364
  %t4369 = select i1 %t4368, i64 257, i64 1
  br label %fixmerge1017
fixslow1016:
  %t4370 = call i64 @rt_num_eq(i64 %a0, i64 %t4364)
  br label %fixmerge1017
fixmerge1017:
  %t4371 = phi i64 [ %t4369, %fixfast1015 ], [ %t4370, %fixslow1016 ]
  %t4372 = icmp ne i64 %t4371, 1
  br i1 %t4372, label %then1018, label %else1019
then1018:
  %t4373 = load i64, ptr @"scheme.base:void"
  %t4374 = and i64 %t4373, -8
  %t4375 = inttoptr i64 %t4374 to ptr
  %t4376 = load i64, ptr %t4375
  %t4377 = inttoptr i64 %t4376 to ptr
  %t4378 = musttail call fastcc i64 %t4377(i64 %t4373, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4378
else1019:
  %t4379 = and i64 %self, -8
  %t4380 = inttoptr i64 %t4379 to ptr
  %t4381 = getelementptr i64, ptr %t4380, i64 3
  %t4382 = load i64, ptr %t4381
  %t4383 = call i64 @rt_string_ref(i64 %t4382, i64 %a0)
  %t4384 = and i64 %self, -8
  %t4385 = inttoptr i64 %t4384 to ptr
  %t4386 = getelementptr i64, ptr %t4385, i64 2
  %t4387 = load i64, ptr %t4386
  %t4388 = and i64 %t4387, -8
  %t4389 = inttoptr i64 %t4388 to ptr
  %t4390 = load i64, ptr %t4389
  %t4391 = inttoptr i64 %t4390 to ptr
  %t4392 = call fastcc i64%t4391(i64 %t4387, i64 1, i64 %t4383, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4393 = or i64 %a0, 8
  %t4394 = and i64 %t4393, 7
  %t4395 = icmp eq i64 %t4394, 0
  br i1 %t4395, label %fixfast1020, label %fixslow1021
fixfast1020:
  %t4396 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4397 = extractvalue {i64, i1} %t4396, 0
  %t4398 = extractvalue {i64, i1} %t4396, 1
  br i1 %t4398, label %fixslow1021, label %fixmerge1022
fixslow1021:
  %t4399 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1022
fixmerge1022:
  %t4400 = phi i64 [ %t4397, %fixfast1020 ], [ %t4399, %fixslow1021 ]
  %t4401 = musttail call fastcc i64 @"scheme.base:code_890"(i64 %self, i64 1, i64 %t4400, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4401
}

define fastcc i64 @"scheme.base:code_892"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4402 = icmp eq i64 %argc, 1
  br i1 %t4402, label %argok1024, label %arityerr1023
arityerr1023:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1024:
  %t4403 = and i64 %self, -8
  %t4404 = inttoptr i64 %t4403 to ptr
  %t4405 = getelementptr i64, ptr %t4404, i64 1
  %t4406 = load i64, ptr %t4405
  %t4407 = or i64 %a0, %t4406
  %t4408 = and i64 %t4407, 7
  %t4409 = icmp eq i64 %t4408, 0
  br i1 %t4409, label %fixfast1025, label %fixslow1026
fixfast1025:
  %t4410 = icmp eq i64 %a0, %t4406
  %t4411 = select i1 %t4410, i64 257, i64 1
  br label %fixmerge1027
fixslow1026:
  %t4412 = call i64 @rt_num_eq(i64 %a0, i64 %t4406)
  br label %fixmerge1027
fixmerge1027:
  %t4413 = phi i64 [ %t4411, %fixfast1025 ], [ %t4412, %fixslow1026 ]
  %t4414 = icmp ne i64 %t4413, 1
  br i1 %t4414, label %then1028, label %else1029
then1028:
  %t4415 = load i64, ptr @"scheme.base:void"
  %t4416 = and i64 %t4415, -8
  %t4417 = inttoptr i64 %t4416 to ptr
  %t4418 = load i64, ptr %t4417
  %t4419 = inttoptr i64 %t4418 to ptr
  %t4420 = musttail call fastcc i64 %t4419(i64 %t4415, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4420
else1029:
  %t4421 = and i64 %self, -8
  %t4422 = inttoptr i64 %t4421 to ptr
  %t4423 = getelementptr i64, ptr %t4422, i64 3
  %t4424 = load i64, ptr %t4423
  %t4425 = load i64, ptr @"scheme.base:str-nth"
  %t4426 = and i64 %t4425, -8
  %t4427 = inttoptr i64 %t4426 to ptr
  %t4428 = load i64, ptr %t4427
  %t4429 = inttoptr i64 %t4428 to ptr
  %t4430 = call fastcc i64%t4429(i64 %t4425, i64 2, i64 %t4424, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4431 = and i64 %self, -8
  %t4432 = inttoptr i64 %t4431 to ptr
  %t4433 = getelementptr i64, ptr %t4432, i64 2
  %t4434 = load i64, ptr %t4433
  %t4435 = and i64 %t4434, -8
  %t4436 = inttoptr i64 %t4435 to ptr
  %t4437 = load i64, ptr %t4436
  %t4438 = inttoptr i64 %t4437 to ptr
  %t4439 = call i64 @rt_list_length(i64 %t4430)
  %t4440 = add i64 0, %t4439
  %t4441 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t4430, i64 8)
  %t4453 = getelementptr i64, ptr %t4441, i64 0
  %t4445 = load i64, ptr %t4453
  %t4454 = getelementptr i64, ptr %t4441, i64 1
  %t4446 = load i64, ptr %t4454
  %t4455 = getelementptr i64, ptr %t4441, i64 2
  %t4447 = load i64, ptr %t4455
  %t4456 = getelementptr i64, ptr %t4441, i64 3
  %t4448 = load i64, ptr %t4456
  %t4457 = getelementptr i64, ptr %t4441, i64 4
  %t4449 = load i64, ptr %t4457
  %t4458 = getelementptr i64, ptr %t4441, i64 5
  %t4450 = load i64, ptr %t4458
  %t4459 = getelementptr i64, ptr %t4441, i64 6
  %t4451 = load i64, ptr %t4459
  %t4460 = getelementptr i64, ptr %t4441, i64 7
  %t4452 = load i64, ptr %t4460
  %t4442 = icmp sgt i64 %t4440, 8
  %t4443 = getelementptr i64, ptr %t4441, i64 8
  %t4444 = select i1 %t4442, ptr %t4443, ptr null
  %t4461 = call fastcc i64%t4438(i64 %t4434, i64 %t4440, i64 %t4445, i64 %t4446, i64 %t4447, i64 %t4448, i64 %t4449, i64 %t4450, i64 %t4451, i64 %t4452, ptr %t4444)
  %t4462 = or i64 %a0, 8
  %t4463 = and i64 %t4462, 7
  %t4464 = icmp eq i64 %t4463, 0
  br i1 %t4464, label %fixfast1030, label %fixslow1031
fixfast1030:
  %t4465 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4466 = extractvalue {i64, i1} %t4465, 0
  %t4467 = extractvalue {i64, i1} %t4465, 1
  br i1 %t4467, label %fixslow1031, label %fixmerge1032
fixslow1031:
  %t4468 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1032
fixmerge1032:
  %t4469 = phi i64 [ %t4466, %fixfast1030 ], [ %t4468, %fixslow1031 ]
  %t4470 = musttail call fastcc i64 @"scheme.base:code_892"(i64 %self, i64 1, i64 %t4469, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4470
}

define fastcc i64 @"scheme.base:code:string-for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4471 = icmp sge i64 %argc, 2
  br i1 %t4471, label %argok1034, label %arityerr1033
arityerr1033:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1034:
  %t4472 = call ptr @rt_alloc_words(i64 8)
  %t4473 = getelementptr i64, ptr %t4472, i64 0
  store i64 %a0, ptr %t4473
  %t4474 = getelementptr i64, ptr %t4472, i64 1
  store i64 %a1, ptr %t4474
  %t4475 = getelementptr i64, ptr %t4472, i64 2
  store i64 %a2, ptr %t4475
  %t4476 = getelementptr i64, ptr %t4472, i64 3
  store i64 %a3, ptr %t4476
  %t4477 = getelementptr i64, ptr %t4472, i64 4
  store i64 %a4, ptr %t4477
  %t4478 = getelementptr i64, ptr %t4472, i64 5
  store i64 %a5, ptr %t4478
  %t4479 = getelementptr i64, ptr %t4472, i64 6
  store i64 %a6, ptr %t4479
  %t4480 = getelementptr i64, ptr %t4472, i64 7
  store i64 %a7, ptr %t4480
  %t4481 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t4472, ptr %overflow)
  %t4482 = call i64 @rt_null_p(i64 %t4481)
  %t4483 = icmp ne i64 %t4482, 1
  br i1 %t4483, label %then1035, label %else1036
then1035:
  %t4484 = call i64 @rt_string_length(i64 %a1)
  %t4485 = call ptr @rt_alloc_words(i64 5)
  %t4486 = ptrtoint ptr %t4485 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_890" to i64), ptr %t4485
  %t4487 = or i64 %t4486, 4
  %t4488 = getelementptr i64, ptr %t4485, i64 1
  store i64 %t4484, ptr %t4488
  %t4489 = getelementptr i64, ptr %t4485, i64 2
  store i64 %a0, ptr %t4489
  %t4490 = getelementptr i64, ptr %t4485, i64 3
  store i64 %a1, ptr %t4490
  %t4491 = getelementptr i64, ptr %t4485, i64 4
  store i64 %t4487, ptr %t4491
  %t4492 = musttail call fastcc i64 @"scheme.base:code_890"(i64 %t4487, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4492
else1036:
  %t4493 = call i64 @rt_cons(i64 %a1, i64 %t4481)
  %t4494 = load i64, ptr @"scheme.base:str-min-len"
  %t4495 = and i64 %t4494, -8
  %t4496 = inttoptr i64 %t4495 to ptr
  %t4497 = load i64, ptr %t4496
  %t4498 = inttoptr i64 %t4497 to ptr
  %t4499 = call fastcc i64%t4498(i64 %t4494, i64 1, i64 %t4493, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4500 = call ptr @rt_alloc_words(i64 5)
  %t4501 = ptrtoint ptr %t4500 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_892" to i64), ptr %t4500
  %t4502 = or i64 %t4501, 4
  %t4503 = getelementptr i64, ptr %t4500, i64 1
  store i64 %t4499, ptr %t4503
  %t4504 = getelementptr i64, ptr %t4500, i64 2
  store i64 %a0, ptr %t4504
  %t4505 = getelementptr i64, ptr %t4500, i64 3
  store i64 %t4493, ptr %t4505
  %t4506 = getelementptr i64, ptr %t4500, i64 4
  store i64 %t4502, ptr %t4506
  %t4507 = musttail call fastcc i64 @"scheme.base:code_892"(i64 %t4502, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4507
}

define fastcc i64 @"scheme.base:code:str-min-len"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4512 = icmp eq i64 %argc, 1
  br i1 %t4512, label %argok1038, label %arityerr1037
arityerr1037:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1038:
  %t4513 = call i64 @rt_cdr(i64 %a0)
  %t4514 = call i64 @rt_null_p(i64 %t4513)
  %t4515 = icmp ne i64 %t4514, 1
  br i1 %t4515, label %then1039, label %else1040
then1039:
  %t4516 = call i64 @rt_car(i64 %a0)
  %t4517 = call i64 @rt_string_length(i64 %t4516)
  ret i64 %t4517
else1040:
  %t4518 = call i64 @rt_car(i64 %a0)
  %t4519 = call i64 @rt_string_length(i64 %t4518)
  %t4520 = call i64 @rt_cdr(i64 %a0)
  %t4521 = load i64, ptr @"scheme.base:str-min-len"
  %t4522 = and i64 %t4521, -8
  %t4523 = inttoptr i64 %t4522 to ptr
  %t4524 = load i64, ptr %t4523
  %t4525 = inttoptr i64 %t4524 to ptr
  %t4526 = call fastcc i64%t4525(i64 %t4521, i64 1, i64 %t4520, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4527 = or i64 %t4519, %t4526
  %t4528 = and i64 %t4527, 7
  %t4529 = icmp eq i64 %t4528, 0
  br i1 %t4529, label %fixfast1041, label %fixslow1042
fixfast1041:
  %t4530 = icmp slt i64 %t4519, %t4526
  %t4531 = select i1 %t4530, i64 257, i64 1
  br label %fixmerge1043
fixslow1042:
  %t4532 = call i64 @rt_lt(i64 %t4519, i64 %t4526)
  br label %fixmerge1043
fixmerge1043:
  %t4533 = phi i64 [ %t4531, %fixfast1041 ], [ %t4532, %fixslow1042 ]
  %t4534 = icmp ne i64 %t4533, 1
  br i1 %t4534, label %then1044, label %else1045
then1044:
  ret i64 %t4519
else1045:
  ret i64 %t4526
}

define fastcc i64 @"scheme.base:code:str-nth"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4539 = icmp eq i64 %argc, 2
  br i1 %t4539, label %argok1047, label %arityerr1046
arityerr1046:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1047:
  %t4540 = call i64 @rt_null_p(i64 %a0)
  %t4541 = icmp ne i64 %t4540, 1
  br i1 %t4541, label %then1048, label %else1049
then1048:
  ret i64 2
else1049:
  %t4542 = call i64 @rt_car(i64 %a0)
  %t4543 = call i64 @rt_string_ref(i64 %t4542, i64 %a1)
  %t4544 = call i64 @rt_cdr(i64 %a0)
  %t4545 = load i64, ptr @"scheme.base:str-nth"
  %t4546 = and i64 %t4545, -8
  %t4547 = inttoptr i64 %t4546 to ptr
  %t4548 = load i64, ptr %t4547
  %t4549 = inttoptr i64 %t4548 to ptr
  %t4550 = call fastcc i64%t4549(i64 %t4545, i64 2, i64 %t4544, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4551 = call i64 @rt_cons(i64 %t4543, i64 %t4550)
  ret i64 %t4551
}

define fastcc i64 @"scheme.base:code_918"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4556 = icmp eq i64 %argc, 1
  br i1 %t4556, label %argok1051, label %arityerr1050
arityerr1050:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1051:
  %t4557 = and i64 %self, -8
  %t4558 = inttoptr i64 %t4557 to ptr
  %t4559 = getelementptr i64, ptr %t4558, i64 1
  %t4560 = load i64, ptr %t4559
  %t4561 = or i64 %a0, %t4560
  %t4562 = and i64 %t4561, 7
  %t4563 = icmp eq i64 %t4562, 0
  br i1 %t4563, label %fixfast1052, label %fixslow1053
fixfast1052:
  %t4564 = icmp eq i64 %a0, %t4560
  %t4565 = select i1 %t4564, i64 257, i64 1
  br label %fixmerge1054
fixslow1053:
  %t4566 = call i64 @rt_num_eq(i64 %a0, i64 %t4560)
  br label %fixmerge1054
fixmerge1054:
  %t4567 = phi i64 [ %t4565, %fixfast1052 ], [ %t4566, %fixslow1053 ]
  %t4568 = icmp ne i64 %t4567, 1
  br i1 %t4568, label %then1055, label %else1056
then1055:
  %t4569 = load i64, ptr @"scheme.base:void"
  %t4570 = and i64 %t4569, -8
  %t4571 = inttoptr i64 %t4570 to ptr
  %t4572 = load i64, ptr %t4571
  %t4573 = inttoptr i64 %t4572 to ptr
  %t4574 = musttail call fastcc i64 %t4573(i64 %t4569, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4574
else1056:
  %t4575 = and i64 %self, -8
  %t4576 = inttoptr i64 %t4575 to ptr
  %t4577 = getelementptr i64, ptr %t4576, i64 2
  %t4578 = load i64, ptr %t4577
  %t4579 = and i64 %self, -8
  %t4580 = inttoptr i64 %t4579 to ptr
  %t4581 = getelementptr i64, ptr %t4580, i64 3
  %t4582 = load i64, ptr %t4581
  %t4583 = call i64 @rt_string_set(i64 %t4578, i64 %a0, i64 %t4582)
  %t4584 = or i64 %a0, 8
  %t4585 = and i64 %t4584, 7
  %t4586 = icmp eq i64 %t4585, 0
  br i1 %t4586, label %fixfast1057, label %fixslow1058
fixfast1057:
  %t4587 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4588 = extractvalue {i64, i1} %t4587, 0
  %t4589 = extractvalue {i64, i1} %t4587, 1
  br i1 %t4589, label %fixslow1058, label %fixmerge1059
fixslow1058:
  %t4590 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1059
fixmerge1059:
  %t4591 = phi i64 [ %t4588, %fixfast1057 ], [ %t4590, %fixslow1058 ]
  %t4592 = musttail call fastcc i64 @"scheme.base:code_918"(i64 %self, i64 1, i64 %t4591, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4592
}

define fastcc i64 @"scheme.base:code:string-fill!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4593 = icmp sge i64 %argc, 2
  br i1 %t4593, label %argok1061, label %arityerr1060
arityerr1060:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1061:
  %t4594 = call ptr @rt_alloc_words(i64 8)
  %t4595 = getelementptr i64, ptr %t4594, i64 0
  store i64 %a0, ptr %t4595
  %t4596 = getelementptr i64, ptr %t4594, i64 1
  store i64 %a1, ptr %t4596
  %t4597 = getelementptr i64, ptr %t4594, i64 2
  store i64 %a2, ptr %t4597
  %t4598 = getelementptr i64, ptr %t4594, i64 3
  store i64 %a3, ptr %t4598
  %t4599 = getelementptr i64, ptr %t4594, i64 4
  store i64 %a4, ptr %t4599
  %t4600 = getelementptr i64, ptr %t4594, i64 5
  store i64 %a5, ptr %t4600
  %t4601 = getelementptr i64, ptr %t4594, i64 6
  store i64 %a6, ptr %t4601
  %t4602 = getelementptr i64, ptr %t4594, i64 7
  store i64 %a7, ptr %t4602
  %t4603 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t4594, ptr %overflow)
  %t4604 = call i64 @rt_string_length(i64 %a0)
  %t4605 = load i64, ptr @"scheme.base:rng-start"
  %t4606 = and i64 %t4605, -8
  %t4607 = inttoptr i64 %t4606 to ptr
  %t4608 = load i64, ptr %t4607
  %t4609 = inttoptr i64 %t4608 to ptr
  %t4610 = call fastcc i64%t4609(i64 %t4605, i64 1, i64 %t4603, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4611 = load i64, ptr @"scheme.base:rng-end"
  %t4612 = and i64 %t4611, -8
  %t4613 = inttoptr i64 %t4612 to ptr
  %t4614 = load i64, ptr %t4613
  %t4615 = inttoptr i64 %t4614 to ptr
  %t4616 = call fastcc i64%t4615(i64 %t4611, i64 2, i64 %t4603, i64 %t4604, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4617 = call i64 @rt_intern(ptr @.str.sym.20)
  %t4618 = load i64, ptr @"scheme.base:rng-check"
  %t4619 = and i64 %t4618, -8
  %t4620 = inttoptr i64 %t4619 to ptr
  %t4621 = load i64, ptr %t4620
  %t4622 = inttoptr i64 %t4621 to ptr
  %t4623 = call fastcc i64%t4622(i64 %t4618, i64 4, i64 %t4617, i64 %t4610, i64 %t4616, i64 %t4604, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4624 = call ptr @rt_alloc_words(i64 5)
  %t4625 = ptrtoint ptr %t4624 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_918" to i64), ptr %t4624
  %t4626 = or i64 %t4625, 4
  %t4627 = getelementptr i64, ptr %t4624, i64 1
  store i64 %t4616, ptr %t4627
  %t4628 = getelementptr i64, ptr %t4624, i64 2
  store i64 %a0, ptr %t4628
  %t4629 = getelementptr i64, ptr %t4624, i64 3
  store i64 %a1, ptr %t4629
  %t4630 = getelementptr i64, ptr %t4624, i64 4
  store i64 %t4626, ptr %t4630
  %t4631 = musttail call fastcc i64 @"scheme.base:code_918"(i64 %t4626, i64 1, i64 %t4610, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4631
}

define fastcc i64 @"scheme.base:code_944"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4636 = icmp eq i64 %argc, 1
  br i1 %t4636, label %argok1063, label %arityerr1062
arityerr1062:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1063:
  %t4637 = or i64 %a0, 0
  %t4638 = and i64 %t4637, 7
  %t4639 = icmp eq i64 %t4638, 0
  br i1 %t4639, label %fixfast1064, label %fixslow1065
fixfast1064:
  %t4640 = icmp slt i64 %a0, 0
  %t4641 = select i1 %t4640, i64 257, i64 1
  br label %fixmerge1066
fixslow1065:
  %t4642 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge1066
fixmerge1066:
  %t4643 = phi i64 [ %t4641, %fixfast1064 ], [ %t4642, %fixslow1065 ]
  %t4644 = icmp ne i64 %t4643, 1
  br i1 %t4644, label %then1067, label %else1068
then1067:
  %t4645 = load i64, ptr @"scheme.base:void"
  %t4646 = and i64 %t4645, -8
  %t4647 = inttoptr i64 %t4646 to ptr
  %t4648 = load i64, ptr %t4647
  %t4649 = inttoptr i64 %t4648 to ptr
  %t4650 = musttail call fastcc i64 %t4649(i64 %t4645, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4650
else1068:
  %t4651 = and i64 %self, -8
  %t4652 = inttoptr i64 %t4651 to ptr
  %t4653 = getelementptr i64, ptr %t4652, i64 1
  %t4654 = load i64, ptr %t4653
  %t4655 = and i64 %self, -8
  %t4656 = inttoptr i64 %t4655 to ptr
  %t4657 = getelementptr i64, ptr %t4656, i64 2
  %t4658 = load i64, ptr %t4657
  %t4659 = or i64 %t4658, %a0
  %t4660 = and i64 %t4659, 7
  %t4661 = icmp eq i64 %t4660, 0
  br i1 %t4661, label %fixfast1069, label %fixslow1070
fixfast1069:
  %t4662 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4658, i64 %a0)
  %t4663 = extractvalue {i64, i1} %t4662, 0
  %t4664 = extractvalue {i64, i1} %t4662, 1
  br i1 %t4664, label %fixslow1070, label %fixmerge1071
fixslow1070:
  %t4665 = call i64 @rt_add(i64 %t4658, i64 %a0)
  br label %fixmerge1071
fixmerge1071:
  %t4666 = phi i64 [ %t4663, %fixfast1069 ], [ %t4665, %fixslow1070 ]
  %t4667 = and i64 %self, -8
  %t4668 = inttoptr i64 %t4667 to ptr
  %t4669 = getelementptr i64, ptr %t4668, i64 3
  %t4670 = load i64, ptr %t4669
  %t4671 = and i64 %self, -8
  %t4672 = inttoptr i64 %t4671 to ptr
  %t4673 = getelementptr i64, ptr %t4672, i64 4
  %t4674 = load i64, ptr %t4673
  %t4675 = or i64 %t4674, %a0
  %t4676 = and i64 %t4675, 7
  %t4677 = icmp eq i64 %t4676, 0
  br i1 %t4677, label %fixfast1072, label %fixslow1073
fixfast1072:
  %t4678 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4674, i64 %a0)
  %t4679 = extractvalue {i64, i1} %t4678, 0
  %t4680 = extractvalue {i64, i1} %t4678, 1
  br i1 %t4680, label %fixslow1073, label %fixmerge1074
fixslow1073:
  %t4681 = call i64 @rt_add(i64 %t4674, i64 %a0)
  br label %fixmerge1074
fixmerge1074:
  %t4682 = phi i64 [ %t4679, %fixfast1072 ], [ %t4681, %fixslow1073 ]
  %t4683 = call i64 @rt_string_ref(i64 %t4670, i64 %t4682)
  %t4684 = call i64 @rt_string_set(i64 %t4654, i64 %t4666, i64 %t4683)
  %t4685 = or i64 %a0, 8
  %t4686 = and i64 %t4685, 7
  %t4687 = icmp eq i64 %t4686, 0
  br i1 %t4687, label %fixfast1075, label %fixslow1076
fixfast1075:
  %t4688 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t4689 = extractvalue {i64, i1} %t4688, 0
  %t4690 = extractvalue {i64, i1} %t4688, 1
  br i1 %t4690, label %fixslow1076, label %fixmerge1077
fixslow1076:
  %t4691 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge1077
fixmerge1077:
  %t4692 = phi i64 [ %t4689, %fixfast1075 ], [ %t4691, %fixslow1076 ]
  %t4693 = musttail call fastcc i64 @"scheme.base:code_944"(i64 %self, i64 1, i64 %t4692, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4693
}

define fastcc i64 @"scheme.base:code_946"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4694 = icmp eq i64 %argc, 1
  br i1 %t4694, label %argok1079, label %arityerr1078
arityerr1078:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1079:
  %t4695 = and i64 %self, -8
  %t4696 = inttoptr i64 %t4695 to ptr
  %t4697 = getelementptr i64, ptr %t4696, i64 1
  %t4698 = load i64, ptr %t4697
  %t4699 = and i64 %self, -8
  %t4700 = inttoptr i64 %t4699 to ptr
  %t4701 = getelementptr i64, ptr %t4700, i64 2
  %t4702 = load i64, ptr %t4701
  %t4703 = or i64 %t4698, %t4702
  %t4704 = and i64 %t4703, 7
  %t4705 = icmp eq i64 %t4704, 0
  br i1 %t4705, label %fixfast1080, label %fixslow1081
fixfast1080:
  %t4706 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4698, i64 %t4702)
  %t4707 = extractvalue {i64, i1} %t4706, 0
  %t4708 = extractvalue {i64, i1} %t4706, 1
  br i1 %t4708, label %fixslow1081, label %fixmerge1082
fixslow1081:
  %t4709 = call i64 @rt_sub(i64 %t4698, i64 %t4702)
  br label %fixmerge1082
fixmerge1082:
  %t4710 = phi i64 [ %t4707, %fixfast1080 ], [ %t4709, %fixslow1081 ]
  %t4711 = or i64 %a0, %t4710
  %t4712 = and i64 %t4711, 7
  %t4713 = icmp eq i64 %t4712, 0
  br i1 %t4713, label %fixfast1083, label %fixslow1084
fixfast1083:
  %t4714 = icmp eq i64 %a0, %t4710
  %t4715 = select i1 %t4714, i64 257, i64 1
  br label %fixmerge1085
fixslow1084:
  %t4716 = call i64 @rt_num_eq(i64 %a0, i64 %t4710)
  br label %fixmerge1085
fixmerge1085:
  %t4717 = phi i64 [ %t4715, %fixfast1083 ], [ %t4716, %fixslow1084 ]
  %t4718 = icmp ne i64 %t4717, 1
  br i1 %t4718, label %then1086, label %else1087
then1086:
  %t4719 = load i64, ptr @"scheme.base:void"
  %t4720 = and i64 %t4719, -8
  %t4721 = inttoptr i64 %t4720 to ptr
  %t4722 = load i64, ptr %t4721
  %t4723 = inttoptr i64 %t4722 to ptr
  %t4724 = musttail call fastcc i64 %t4723(i64 %t4719, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4724
else1087:
  %t4725 = and i64 %self, -8
  %t4726 = inttoptr i64 %t4725 to ptr
  %t4727 = getelementptr i64, ptr %t4726, i64 3
  %t4728 = load i64, ptr %t4727
  %t4729 = and i64 %self, -8
  %t4730 = inttoptr i64 %t4729 to ptr
  %t4731 = getelementptr i64, ptr %t4730, i64 4
  %t4732 = load i64, ptr %t4731
  %t4733 = or i64 %t4732, %a0
  %t4734 = and i64 %t4733, 7
  %t4735 = icmp eq i64 %t4734, 0
  br i1 %t4735, label %fixfast1088, label %fixslow1089
fixfast1088:
  %t4736 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4732, i64 %a0)
  %t4737 = extractvalue {i64, i1} %t4736, 0
  %t4738 = extractvalue {i64, i1} %t4736, 1
  br i1 %t4738, label %fixslow1089, label %fixmerge1090
fixslow1089:
  %t4739 = call i64 @rt_add(i64 %t4732, i64 %a0)
  br label %fixmerge1090
fixmerge1090:
  %t4740 = phi i64 [ %t4737, %fixfast1088 ], [ %t4739, %fixslow1089 ]
  %t4741 = and i64 %self, -8
  %t4742 = inttoptr i64 %t4741 to ptr
  %t4743 = getelementptr i64, ptr %t4742, i64 5
  %t4744 = load i64, ptr %t4743
  %t4745 = and i64 %self, -8
  %t4746 = inttoptr i64 %t4745 to ptr
  %t4747 = getelementptr i64, ptr %t4746, i64 2
  %t4748 = load i64, ptr %t4747
  %t4749 = or i64 %t4748, %a0
  %t4750 = and i64 %t4749, 7
  %t4751 = icmp eq i64 %t4750, 0
  br i1 %t4751, label %fixfast1091, label %fixslow1092
fixfast1091:
  %t4752 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4748, i64 %a0)
  %t4753 = extractvalue {i64, i1} %t4752, 0
  %t4754 = extractvalue {i64, i1} %t4752, 1
  br i1 %t4754, label %fixslow1092, label %fixmerge1093
fixslow1092:
  %t4755 = call i64 @rt_add(i64 %t4748, i64 %a0)
  br label %fixmerge1093
fixmerge1093:
  %t4756 = phi i64 [ %t4753, %fixfast1091 ], [ %t4755, %fixslow1092 ]
  %t4757 = call i64 @rt_string_ref(i64 %t4744, i64 %t4756)
  %t4758 = call i64 @rt_string_set(i64 %t4728, i64 %t4740, i64 %t4757)
  %t4759 = or i64 %a0, 8
  %t4760 = and i64 %t4759, 7
  %t4761 = icmp eq i64 %t4760, 0
  br i1 %t4761, label %fixfast1094, label %fixslow1095
fixfast1094:
  %t4762 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4763 = extractvalue {i64, i1} %t4762, 0
  %t4764 = extractvalue {i64, i1} %t4762, 1
  br i1 %t4764, label %fixslow1095, label %fixmerge1096
fixslow1095:
  %t4765 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1096
fixmerge1096:
  %t4766 = phi i64 [ %t4763, %fixfast1094 ], [ %t4765, %fixslow1095 ]
  %t4767 = musttail call fastcc i64 @"scheme.base:code_946"(i64 %self, i64 1, i64 %t4766, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4767
}

define fastcc i64 @"scheme.base:code:string-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4768 = icmp sge i64 %argc, 3
  br i1 %t4768, label %argok1098, label %arityerr1097
arityerr1097:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1098:
  %t4769 = call ptr @rt_alloc_words(i64 8)
  %t4770 = getelementptr i64, ptr %t4769, i64 0
  store i64 %a0, ptr %t4770
  %t4771 = getelementptr i64, ptr %t4769, i64 1
  store i64 %a1, ptr %t4771
  %t4772 = getelementptr i64, ptr %t4769, i64 2
  store i64 %a2, ptr %t4772
  %t4773 = getelementptr i64, ptr %t4769, i64 3
  store i64 %a3, ptr %t4773
  %t4774 = getelementptr i64, ptr %t4769, i64 4
  store i64 %a4, ptr %t4774
  %t4775 = getelementptr i64, ptr %t4769, i64 5
  store i64 %a5, ptr %t4775
  %t4776 = getelementptr i64, ptr %t4769, i64 6
  store i64 %a6, ptr %t4776
  %t4777 = getelementptr i64, ptr %t4769, i64 7
  store i64 %a7, ptr %t4777
  %t4778 = call i64 @rt_build_rest(i64 %argc, i64 3, i64 8, ptr %t4769, ptr %overflow)
  %t4779 = call i64 @rt_string_length(i64 %a2)
  %t4780 = load i64, ptr @"scheme.base:rng-start"
  %t4781 = and i64 %t4780, -8
  %t4782 = inttoptr i64 %t4781 to ptr
  %t4783 = load i64, ptr %t4782
  %t4784 = inttoptr i64 %t4783 to ptr
  %t4785 = call fastcc i64%t4784(i64 %t4780, i64 1, i64 %t4778, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4786 = load i64, ptr @"scheme.base:rng-end"
  %t4787 = and i64 %t4786, -8
  %t4788 = inttoptr i64 %t4787 to ptr
  %t4789 = load i64, ptr %t4788
  %t4790 = inttoptr i64 %t4789 to ptr
  %t4791 = call fastcc i64%t4790(i64 %t4786, i64 2, i64 %t4778, i64 %t4779, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4792 = call i64 @rt_intern(ptr @.str.sym.21)
  %t4793 = load i64, ptr @"scheme.base:rng-check"
  %t4794 = and i64 %t4793, -8
  %t4795 = inttoptr i64 %t4794 to ptr
  %t4796 = load i64, ptr %t4795
  %t4797 = inttoptr i64 %t4796 to ptr
  %t4798 = call fastcc i64%t4797(i64 %t4793, i64 4, i64 %t4792, i64 %t4785, i64 %t4791, i64 %t4779, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4799 = call i64 @rt_intern(ptr @.str.sym.21)
  %t4800 = or i64 %t4791, %t4785
  %t4801 = and i64 %t4800, 7
  %t4802 = icmp eq i64 %t4801, 0
  br i1 %t4802, label %fixfast1099, label %fixslow1100
fixfast1099:
  %t4803 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4791, i64 %t4785)
  %t4804 = extractvalue {i64, i1} %t4803, 0
  %t4805 = extractvalue {i64, i1} %t4803, 1
  br i1 %t4805, label %fixslow1100, label %fixmerge1101
fixslow1100:
  %t4806 = call i64 @rt_sub(i64 %t4791, i64 %t4785)
  br label %fixmerge1101
fixmerge1101:
  %t4807 = phi i64 [ %t4804, %fixfast1099 ], [ %t4806, %fixslow1100 ]
  %t4808 = or i64 %a1, %t4807
  %t4809 = and i64 %t4808, 7
  %t4810 = icmp eq i64 %t4809, 0
  br i1 %t4810, label %fixfast1102, label %fixslow1103
fixfast1102:
  %t4811 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t4807)
  %t4812 = extractvalue {i64, i1} %t4811, 0
  %t4813 = extractvalue {i64, i1} %t4811, 1
  br i1 %t4813, label %fixslow1103, label %fixmerge1104
fixslow1103:
  %t4814 = call i64 @rt_add(i64 %a1, i64 %t4807)
  br label %fixmerge1104
fixmerge1104:
  %t4815 = phi i64 [ %t4812, %fixfast1102 ], [ %t4814, %fixslow1103 ]
  %t4816 = call i64 @rt_string_length(i64 %a0)
  %t4817 = load i64, ptr @"scheme.base:rng-check"
  %t4818 = and i64 %t4817, -8
  %t4819 = inttoptr i64 %t4818 to ptr
  %t4820 = load i64, ptr %t4819
  %t4821 = inttoptr i64 %t4820 to ptr
  %t4822 = call fastcc i64%t4821(i64 %t4817, i64 4, i64 %t4799, i64 %a1, i64 %t4815, i64 %t4816, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4823 = or i64 %t4785, %a1
  %t4824 = and i64 %t4823, 7
  %t4825 = icmp eq i64 %t4824, 0
  br i1 %t4825, label %fixfast1105, label %fixslow1106
fixfast1105:
  %t4826 = icmp slt i64 %t4785, %a1
  %t4827 = select i1 %t4826, i64 257, i64 1
  br label %fixmerge1107
fixslow1106:
  %t4828 = call i64 @rt_lt(i64 %t4785, i64 %a1)
  br label %fixmerge1107
fixmerge1107:
  %t4829 = phi i64 [ %t4827, %fixfast1105 ], [ %t4828, %fixslow1106 ]
  %t4830 = icmp ne i64 %t4829, 1
  br i1 %t4830, label %then1108, label %else1109
then1108:
  %t4831 = call ptr @rt_alloc_words(i64 6)
  %t4832 = ptrtoint ptr %t4831 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_944" to i64), ptr %t4831
  %t4833 = or i64 %t4832, 4
  %t4834 = getelementptr i64, ptr %t4831, i64 1
  store i64 %a0, ptr %t4834
  %t4835 = getelementptr i64, ptr %t4831, i64 2
  store i64 %a1, ptr %t4835
  %t4836 = getelementptr i64, ptr %t4831, i64 3
  store i64 %a2, ptr %t4836
  %t4837 = getelementptr i64, ptr %t4831, i64 4
  store i64 %t4785, ptr %t4837
  %t4838 = getelementptr i64, ptr %t4831, i64 5
  store i64 %t4833, ptr %t4838
  %t4839 = or i64 %t4791, %t4785
  %t4840 = and i64 %t4839, 7
  %t4841 = icmp eq i64 %t4840, 0
  br i1 %t4841, label %fixfast1110, label %fixslow1111
fixfast1110:
  %t4842 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4791, i64 %t4785)
  %t4843 = extractvalue {i64, i1} %t4842, 0
  %t4844 = extractvalue {i64, i1} %t4842, 1
  br i1 %t4844, label %fixslow1111, label %fixmerge1112
fixslow1111:
  %t4845 = call i64 @rt_sub(i64 %t4791, i64 %t4785)
  br label %fixmerge1112
fixmerge1112:
  %t4846 = phi i64 [ %t4843, %fixfast1110 ], [ %t4845, %fixslow1111 ]
  %t4847 = or i64 %t4846, 8
  %t4848 = and i64 %t4847, 7
  %t4849 = icmp eq i64 %t4848, 0
  br i1 %t4849, label %fixfast1113, label %fixslow1114
fixfast1113:
  %t4850 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4846, i64 8)
  %t4851 = extractvalue {i64, i1} %t4850, 0
  %t4852 = extractvalue {i64, i1} %t4850, 1
  br i1 %t4852, label %fixslow1114, label %fixmerge1115
fixslow1114:
  %t4853 = call i64 @rt_sub(i64 %t4846, i64 8)
  br label %fixmerge1115
fixmerge1115:
  %t4854 = phi i64 [ %t4851, %fixfast1113 ], [ %t4853, %fixslow1114 ]
  %t4855 = musttail call fastcc i64 @"scheme.base:code_944"(i64 %t4833, i64 1, i64 %t4854, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4855
else1109:
  %t4856 = call ptr @rt_alloc_words(i64 7)
  %t4857 = ptrtoint ptr %t4856 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_946" to i64), ptr %t4856
  %t4858 = or i64 %t4857, 4
  %t4859 = getelementptr i64, ptr %t4856, i64 1
  store i64 %t4791, ptr %t4859
  %t4860 = getelementptr i64, ptr %t4856, i64 2
  store i64 %t4785, ptr %t4860
  %t4861 = getelementptr i64, ptr %t4856, i64 3
  store i64 %a0, ptr %t4861
  %t4862 = getelementptr i64, ptr %t4856, i64 4
  store i64 %a1, ptr %t4862
  %t4863 = getelementptr i64, ptr %t4856, i64 5
  store i64 %a2, ptr %t4863
  %t4864 = getelementptr i64, ptr %t4856, i64 6
  store i64 %t4858, ptr %t4864
  %t4865 = musttail call fastcc i64 @"scheme.base:code_946"(i64 %t4858, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4865
}

define fastcc i64 @"scheme.base:code_961"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4870 = icmp eq i64 %argc, 1
  br i1 %t4870, label %argok1117, label %arityerr1116
arityerr1116:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1117:
  %t4871 = and i64 %self, -8
  %t4872 = inttoptr i64 %t4871 to ptr
  %t4873 = getelementptr i64, ptr %t4872, i64 1
  %t4874 = load i64, ptr %t4873
  %t4875 = or i64 %a0, %t4874
  %t4876 = and i64 %t4875, 7
  %t4877 = icmp eq i64 %t4876, 0
  br i1 %t4877, label %fixfast1118, label %fixslow1119
fixfast1118:
  %t4878 = icmp eq i64 %a0, %t4874
  %t4879 = select i1 %t4878, i64 257, i64 1
  br label %fixmerge1120
fixslow1119:
  %t4880 = call i64 @rt_num_eq(i64 %a0, i64 %t4874)
  br label %fixmerge1120
fixmerge1120:
  %t4881 = phi i64 [ %t4879, %fixfast1118 ], [ %t4880, %fixslow1119 ]
  %t4882 = icmp ne i64 %t4881, 1
  br i1 %t4882, label %then1121, label %else1122
then1121:
  %t4883 = and i64 %self, -8
  %t4884 = inttoptr i64 %t4883 to ptr
  %t4885 = getelementptr i64, ptr %t4884, i64 2
  %t4886 = load i64, ptr %t4885
  ret i64 %t4886
else1122:
  %t4887 = and i64 %self, -8
  %t4888 = inttoptr i64 %t4887 to ptr
  %t4889 = getelementptr i64, ptr %t4888, i64 2
  %t4890 = load i64, ptr %t4889
  %t4891 = and i64 %self, -8
  %t4892 = inttoptr i64 %t4891 to ptr
  %t4893 = getelementptr i64, ptr %t4892, i64 3
  %t4894 = load i64, ptr %t4893
  %t4895 = or i64 %a0, %t4894
  %t4896 = and i64 %t4895, 7
  %t4897 = icmp eq i64 %t4896, 0
  br i1 %t4897, label %fixfast1123, label %fixslow1124
fixfast1123:
  %t4898 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t4894)
  %t4899 = extractvalue {i64, i1} %t4898, 0
  %t4900 = extractvalue {i64, i1} %t4898, 1
  br i1 %t4900, label %fixslow1124, label %fixmerge1125
fixslow1124:
  %t4901 = call i64 @rt_sub(i64 %a0, i64 %t4894)
  br label %fixmerge1125
fixmerge1125:
  %t4902 = phi i64 [ %t4899, %fixfast1123 ], [ %t4901, %fixslow1124 ]
  %t4903 = and i64 %self, -8
  %t4904 = inttoptr i64 %t4903 to ptr
  %t4905 = getelementptr i64, ptr %t4904, i64 4
  %t4906 = load i64, ptr %t4905
  %t4907 = call i64 @rt_bytevector_u8_ref(i64 %t4906, i64 %a0)
  %t4908 = call i64 @rt_bytevector_u8_set(i64 %t4890, i64 %t4902, i64 %t4907)
  %t4909 = or i64 %a0, 8
  %t4910 = and i64 %t4909, 7
  %t4911 = icmp eq i64 %t4910, 0
  br i1 %t4911, label %fixfast1126, label %fixslow1127
fixfast1126:
  %t4912 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4913 = extractvalue {i64, i1} %t4912, 0
  %t4914 = extractvalue {i64, i1} %t4912, 1
  br i1 %t4914, label %fixslow1127, label %fixmerge1128
fixslow1127:
  %t4915 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1128
fixmerge1128:
  %t4916 = phi i64 [ %t4913, %fixfast1126 ], [ %t4915, %fixslow1127 ]
  %t4917 = musttail call fastcc i64 @"scheme.base:code_961"(i64 %self, i64 1, i64 %t4916, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4917
}

define fastcc i64 @"scheme.base:code:bytevector-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4918 = icmp sge i64 %argc, 1
  br i1 %t4918, label %argok1130, label %arityerr1129
arityerr1129:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1130:
  %t4919 = call ptr @rt_alloc_words(i64 8)
  %t4920 = getelementptr i64, ptr %t4919, i64 0
  store i64 %a0, ptr %t4920
  %t4921 = getelementptr i64, ptr %t4919, i64 1
  store i64 %a1, ptr %t4921
  %t4922 = getelementptr i64, ptr %t4919, i64 2
  store i64 %a2, ptr %t4922
  %t4923 = getelementptr i64, ptr %t4919, i64 3
  store i64 %a3, ptr %t4923
  %t4924 = getelementptr i64, ptr %t4919, i64 4
  store i64 %a4, ptr %t4924
  %t4925 = getelementptr i64, ptr %t4919, i64 5
  store i64 %a5, ptr %t4925
  %t4926 = getelementptr i64, ptr %t4919, i64 6
  store i64 %a6, ptr %t4926
  %t4927 = getelementptr i64, ptr %t4919, i64 7
  store i64 %a7, ptr %t4927
  %t4928 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t4919, ptr %overflow)
  %t4929 = call i64 @rt_bytevector_length(i64 %a0)
  %t4930 = load i64, ptr @"scheme.base:rng-start"
  %t4931 = and i64 %t4930, -8
  %t4932 = inttoptr i64 %t4931 to ptr
  %t4933 = load i64, ptr %t4932
  %t4934 = inttoptr i64 %t4933 to ptr
  %t4935 = call fastcc i64%t4934(i64 %t4930, i64 1, i64 %t4928, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4936 = load i64, ptr @"scheme.base:rng-end"
  %t4937 = and i64 %t4936, -8
  %t4938 = inttoptr i64 %t4937 to ptr
  %t4939 = load i64, ptr %t4938
  %t4940 = inttoptr i64 %t4939 to ptr
  %t4941 = call fastcc i64%t4940(i64 %t4936, i64 2, i64 %t4928, i64 %t4929, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4942 = call i64 @rt_intern(ptr @.str.sym.22)
  %t4943 = load i64, ptr @"scheme.base:rng-check"
  %t4944 = and i64 %t4943, -8
  %t4945 = inttoptr i64 %t4944 to ptr
  %t4946 = load i64, ptr %t4945
  %t4947 = inttoptr i64 %t4946 to ptr
  %t4948 = call fastcc i64%t4947(i64 %t4943, i64 4, i64 %t4942, i64 %t4935, i64 %t4941, i64 %t4929, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4949 = or i64 %t4941, %t4935
  %t4950 = and i64 %t4949, 7
  %t4951 = icmp eq i64 %t4950, 0
  br i1 %t4951, label %fixfast1131, label %fixslow1132
fixfast1131:
  %t4952 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4941, i64 %t4935)
  %t4953 = extractvalue {i64, i1} %t4952, 0
  %t4954 = extractvalue {i64, i1} %t4952, 1
  br i1 %t4954, label %fixslow1132, label %fixmerge1133
fixslow1132:
  %t4955 = call i64 @rt_sub(i64 %t4941, i64 %t4935)
  br label %fixmerge1133
fixmerge1133:
  %t4956 = phi i64 [ %t4953, %fixfast1131 ], [ %t4955, %fixslow1132 ]
  %t4957 = call i64 @rt_make_bytevector(i64 %t4956, i64 0)
  %t4958 = call ptr @rt_alloc_words(i64 6)
  %t4959 = ptrtoint ptr %t4958 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_961" to i64), ptr %t4958
  %t4960 = or i64 %t4959, 4
  %t4961 = getelementptr i64, ptr %t4958, i64 1
  store i64 %t4941, ptr %t4961
  %t4962 = getelementptr i64, ptr %t4958, i64 2
  store i64 %t4957, ptr %t4962
  %t4963 = getelementptr i64, ptr %t4958, i64 3
  store i64 %t4935, ptr %t4963
  %t4964 = getelementptr i64, ptr %t4958, i64 4
  store i64 %a0, ptr %t4964
  %t4965 = getelementptr i64, ptr %t4958, i64 5
  store i64 %t4960, ptr %t4965
  %t4966 = musttail call fastcc i64 @"scheme.base:code_961"(i64 %t4960, i64 1, i64 %t4935, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4966
}

define fastcc i64 @"scheme.base:code_987"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4971 = icmp eq i64 %argc, 1
  br i1 %t4971, label %argok1135, label %arityerr1134
arityerr1134:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1135:
  %t4972 = or i64 %a0, 0
  %t4973 = and i64 %t4972, 7
  %t4974 = icmp eq i64 %t4973, 0
  br i1 %t4974, label %fixfast1136, label %fixslow1137
fixfast1136:
  %t4975 = icmp slt i64 %a0, 0
  %t4976 = select i1 %t4975, i64 257, i64 1
  br label %fixmerge1138
fixslow1137:
  %t4977 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge1138
fixmerge1138:
  %t4978 = phi i64 [ %t4976, %fixfast1136 ], [ %t4977, %fixslow1137 ]
  %t4979 = icmp ne i64 %t4978, 1
  br i1 %t4979, label %then1139, label %else1140
then1139:
  %t4980 = load i64, ptr @"scheme.base:void"
  %t4981 = and i64 %t4980, -8
  %t4982 = inttoptr i64 %t4981 to ptr
  %t4983 = load i64, ptr %t4982
  %t4984 = inttoptr i64 %t4983 to ptr
  %t4985 = musttail call fastcc i64 %t4984(i64 %t4980, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4985
else1140:
  %t4986 = and i64 %self, -8
  %t4987 = inttoptr i64 %t4986 to ptr
  %t4988 = getelementptr i64, ptr %t4987, i64 1
  %t4989 = load i64, ptr %t4988
  %t4990 = and i64 %self, -8
  %t4991 = inttoptr i64 %t4990 to ptr
  %t4992 = getelementptr i64, ptr %t4991, i64 2
  %t4993 = load i64, ptr %t4992
  %t4994 = or i64 %t4993, %a0
  %t4995 = and i64 %t4994, 7
  %t4996 = icmp eq i64 %t4995, 0
  br i1 %t4996, label %fixfast1141, label %fixslow1142
fixfast1141:
  %t4997 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4993, i64 %a0)
  %t4998 = extractvalue {i64, i1} %t4997, 0
  %t4999 = extractvalue {i64, i1} %t4997, 1
  br i1 %t4999, label %fixslow1142, label %fixmerge1143
fixslow1142:
  %t5000 = call i64 @rt_add(i64 %t4993, i64 %a0)
  br label %fixmerge1143
fixmerge1143:
  %t5001 = phi i64 [ %t4998, %fixfast1141 ], [ %t5000, %fixslow1142 ]
  %t5002 = and i64 %self, -8
  %t5003 = inttoptr i64 %t5002 to ptr
  %t5004 = getelementptr i64, ptr %t5003, i64 3
  %t5005 = load i64, ptr %t5004
  %t5006 = and i64 %self, -8
  %t5007 = inttoptr i64 %t5006 to ptr
  %t5008 = getelementptr i64, ptr %t5007, i64 4
  %t5009 = load i64, ptr %t5008
  %t5010 = or i64 %t5009, %a0
  %t5011 = and i64 %t5010, 7
  %t5012 = icmp eq i64 %t5011, 0
  br i1 %t5012, label %fixfast1144, label %fixslow1145
fixfast1144:
  %t5013 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5009, i64 %a0)
  %t5014 = extractvalue {i64, i1} %t5013, 0
  %t5015 = extractvalue {i64, i1} %t5013, 1
  br i1 %t5015, label %fixslow1145, label %fixmerge1146
fixslow1145:
  %t5016 = call i64 @rt_add(i64 %t5009, i64 %a0)
  br label %fixmerge1146
fixmerge1146:
  %t5017 = phi i64 [ %t5014, %fixfast1144 ], [ %t5016, %fixslow1145 ]
  %t5018 = call i64 @rt_bytevector_u8_ref(i64 %t5005, i64 %t5017)
  %t5019 = call i64 @rt_bytevector_u8_set(i64 %t4989, i64 %t5001, i64 %t5018)
  %t5020 = or i64 %a0, 8
  %t5021 = and i64 %t5020, 7
  %t5022 = icmp eq i64 %t5021, 0
  br i1 %t5022, label %fixfast1147, label %fixslow1148
fixfast1147:
  %t5023 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t5024 = extractvalue {i64, i1} %t5023, 0
  %t5025 = extractvalue {i64, i1} %t5023, 1
  br i1 %t5025, label %fixslow1148, label %fixmerge1149
fixslow1148:
  %t5026 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge1149
fixmerge1149:
  %t5027 = phi i64 [ %t5024, %fixfast1147 ], [ %t5026, %fixslow1148 ]
  %t5028 = musttail call fastcc i64 @"scheme.base:code_987"(i64 %self, i64 1, i64 %t5027, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5028
}

define fastcc i64 @"scheme.base:code_989"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5029 = icmp eq i64 %argc, 1
  br i1 %t5029, label %argok1151, label %arityerr1150
arityerr1150:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1151:
  %t5030 = and i64 %self, -8
  %t5031 = inttoptr i64 %t5030 to ptr
  %t5032 = getelementptr i64, ptr %t5031, i64 1
  %t5033 = load i64, ptr %t5032
  %t5034 = and i64 %self, -8
  %t5035 = inttoptr i64 %t5034 to ptr
  %t5036 = getelementptr i64, ptr %t5035, i64 2
  %t5037 = load i64, ptr %t5036
  %t5038 = or i64 %t5033, %t5037
  %t5039 = and i64 %t5038, 7
  %t5040 = icmp eq i64 %t5039, 0
  br i1 %t5040, label %fixfast1152, label %fixslow1153
fixfast1152:
  %t5041 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5033, i64 %t5037)
  %t5042 = extractvalue {i64, i1} %t5041, 0
  %t5043 = extractvalue {i64, i1} %t5041, 1
  br i1 %t5043, label %fixslow1153, label %fixmerge1154
fixslow1153:
  %t5044 = call i64 @rt_sub(i64 %t5033, i64 %t5037)
  br label %fixmerge1154
fixmerge1154:
  %t5045 = phi i64 [ %t5042, %fixfast1152 ], [ %t5044, %fixslow1153 ]
  %t5046 = or i64 %a0, %t5045
  %t5047 = and i64 %t5046, 7
  %t5048 = icmp eq i64 %t5047, 0
  br i1 %t5048, label %fixfast1155, label %fixslow1156
fixfast1155:
  %t5049 = icmp eq i64 %a0, %t5045
  %t5050 = select i1 %t5049, i64 257, i64 1
  br label %fixmerge1157
fixslow1156:
  %t5051 = call i64 @rt_num_eq(i64 %a0, i64 %t5045)
  br label %fixmerge1157
fixmerge1157:
  %t5052 = phi i64 [ %t5050, %fixfast1155 ], [ %t5051, %fixslow1156 ]
  %t5053 = icmp ne i64 %t5052, 1
  br i1 %t5053, label %then1158, label %else1159
then1158:
  %t5054 = load i64, ptr @"scheme.base:void"
  %t5055 = and i64 %t5054, -8
  %t5056 = inttoptr i64 %t5055 to ptr
  %t5057 = load i64, ptr %t5056
  %t5058 = inttoptr i64 %t5057 to ptr
  %t5059 = musttail call fastcc i64 %t5058(i64 %t5054, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5059
else1159:
  %t5060 = and i64 %self, -8
  %t5061 = inttoptr i64 %t5060 to ptr
  %t5062 = getelementptr i64, ptr %t5061, i64 3
  %t5063 = load i64, ptr %t5062
  %t5064 = and i64 %self, -8
  %t5065 = inttoptr i64 %t5064 to ptr
  %t5066 = getelementptr i64, ptr %t5065, i64 4
  %t5067 = load i64, ptr %t5066
  %t5068 = or i64 %t5067, %a0
  %t5069 = and i64 %t5068, 7
  %t5070 = icmp eq i64 %t5069, 0
  br i1 %t5070, label %fixfast1160, label %fixslow1161
fixfast1160:
  %t5071 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5067, i64 %a0)
  %t5072 = extractvalue {i64, i1} %t5071, 0
  %t5073 = extractvalue {i64, i1} %t5071, 1
  br i1 %t5073, label %fixslow1161, label %fixmerge1162
fixslow1161:
  %t5074 = call i64 @rt_add(i64 %t5067, i64 %a0)
  br label %fixmerge1162
fixmerge1162:
  %t5075 = phi i64 [ %t5072, %fixfast1160 ], [ %t5074, %fixslow1161 ]
  %t5076 = and i64 %self, -8
  %t5077 = inttoptr i64 %t5076 to ptr
  %t5078 = getelementptr i64, ptr %t5077, i64 5
  %t5079 = load i64, ptr %t5078
  %t5080 = and i64 %self, -8
  %t5081 = inttoptr i64 %t5080 to ptr
  %t5082 = getelementptr i64, ptr %t5081, i64 2
  %t5083 = load i64, ptr %t5082
  %t5084 = or i64 %t5083, %a0
  %t5085 = and i64 %t5084, 7
  %t5086 = icmp eq i64 %t5085, 0
  br i1 %t5086, label %fixfast1163, label %fixslow1164
fixfast1163:
  %t5087 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5083, i64 %a0)
  %t5088 = extractvalue {i64, i1} %t5087, 0
  %t5089 = extractvalue {i64, i1} %t5087, 1
  br i1 %t5089, label %fixslow1164, label %fixmerge1165
fixslow1164:
  %t5090 = call i64 @rt_add(i64 %t5083, i64 %a0)
  br label %fixmerge1165
fixmerge1165:
  %t5091 = phi i64 [ %t5088, %fixfast1163 ], [ %t5090, %fixslow1164 ]
  %t5092 = call i64 @rt_bytevector_u8_ref(i64 %t5079, i64 %t5091)
  %t5093 = call i64 @rt_bytevector_u8_set(i64 %t5063, i64 %t5075, i64 %t5092)
  %t5094 = or i64 %a0, 8
  %t5095 = and i64 %t5094, 7
  %t5096 = icmp eq i64 %t5095, 0
  br i1 %t5096, label %fixfast1166, label %fixslow1167
fixfast1166:
  %t5097 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5098 = extractvalue {i64, i1} %t5097, 0
  %t5099 = extractvalue {i64, i1} %t5097, 1
  br i1 %t5099, label %fixslow1167, label %fixmerge1168
fixslow1167:
  %t5100 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1168
fixmerge1168:
  %t5101 = phi i64 [ %t5098, %fixfast1166 ], [ %t5100, %fixslow1167 ]
  %t5102 = musttail call fastcc i64 @"scheme.base:code_989"(i64 %self, i64 1, i64 %t5101, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5102
}

define fastcc i64 @"scheme.base:code:bytevector-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5103 = icmp sge i64 %argc, 3
  br i1 %t5103, label %argok1170, label %arityerr1169
arityerr1169:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1170:
  %t5104 = call ptr @rt_alloc_words(i64 8)
  %t5105 = getelementptr i64, ptr %t5104, i64 0
  store i64 %a0, ptr %t5105
  %t5106 = getelementptr i64, ptr %t5104, i64 1
  store i64 %a1, ptr %t5106
  %t5107 = getelementptr i64, ptr %t5104, i64 2
  store i64 %a2, ptr %t5107
  %t5108 = getelementptr i64, ptr %t5104, i64 3
  store i64 %a3, ptr %t5108
  %t5109 = getelementptr i64, ptr %t5104, i64 4
  store i64 %a4, ptr %t5109
  %t5110 = getelementptr i64, ptr %t5104, i64 5
  store i64 %a5, ptr %t5110
  %t5111 = getelementptr i64, ptr %t5104, i64 6
  store i64 %a6, ptr %t5111
  %t5112 = getelementptr i64, ptr %t5104, i64 7
  store i64 %a7, ptr %t5112
  %t5113 = call i64 @rt_build_rest(i64 %argc, i64 3, i64 8, ptr %t5104, ptr %overflow)
  %t5114 = call i64 @rt_bytevector_length(i64 %a2)
  %t5115 = load i64, ptr @"scheme.base:rng-start"
  %t5116 = and i64 %t5115, -8
  %t5117 = inttoptr i64 %t5116 to ptr
  %t5118 = load i64, ptr %t5117
  %t5119 = inttoptr i64 %t5118 to ptr
  %t5120 = call fastcc i64%t5119(i64 %t5115, i64 1, i64 %t5113, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5121 = load i64, ptr @"scheme.base:rng-end"
  %t5122 = and i64 %t5121, -8
  %t5123 = inttoptr i64 %t5122 to ptr
  %t5124 = load i64, ptr %t5123
  %t5125 = inttoptr i64 %t5124 to ptr
  %t5126 = call fastcc i64%t5125(i64 %t5121, i64 2, i64 %t5113, i64 %t5114, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5127 = call i64 @rt_intern(ptr @.str.sym.23)
  %t5128 = load i64, ptr @"scheme.base:rng-check"
  %t5129 = and i64 %t5128, -8
  %t5130 = inttoptr i64 %t5129 to ptr
  %t5131 = load i64, ptr %t5130
  %t5132 = inttoptr i64 %t5131 to ptr
  %t5133 = call fastcc i64%t5132(i64 %t5128, i64 4, i64 %t5127, i64 %t5120, i64 %t5126, i64 %t5114, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5134 = call i64 @rt_intern(ptr @.str.sym.23)
  %t5135 = or i64 %t5126, %t5120
  %t5136 = and i64 %t5135, 7
  %t5137 = icmp eq i64 %t5136, 0
  br i1 %t5137, label %fixfast1171, label %fixslow1172
fixfast1171:
  %t5138 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5126, i64 %t5120)
  %t5139 = extractvalue {i64, i1} %t5138, 0
  %t5140 = extractvalue {i64, i1} %t5138, 1
  br i1 %t5140, label %fixslow1172, label %fixmerge1173
fixslow1172:
  %t5141 = call i64 @rt_sub(i64 %t5126, i64 %t5120)
  br label %fixmerge1173
fixmerge1173:
  %t5142 = phi i64 [ %t5139, %fixfast1171 ], [ %t5141, %fixslow1172 ]
  %t5143 = or i64 %a1, %t5142
  %t5144 = and i64 %t5143, 7
  %t5145 = icmp eq i64 %t5144, 0
  br i1 %t5145, label %fixfast1174, label %fixslow1175
fixfast1174:
  %t5146 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t5142)
  %t5147 = extractvalue {i64, i1} %t5146, 0
  %t5148 = extractvalue {i64, i1} %t5146, 1
  br i1 %t5148, label %fixslow1175, label %fixmerge1176
fixslow1175:
  %t5149 = call i64 @rt_add(i64 %a1, i64 %t5142)
  br label %fixmerge1176
fixmerge1176:
  %t5150 = phi i64 [ %t5147, %fixfast1174 ], [ %t5149, %fixslow1175 ]
  %t5151 = call i64 @rt_bytevector_length(i64 %a0)
  %t5152 = load i64, ptr @"scheme.base:rng-check"
  %t5153 = and i64 %t5152, -8
  %t5154 = inttoptr i64 %t5153 to ptr
  %t5155 = load i64, ptr %t5154
  %t5156 = inttoptr i64 %t5155 to ptr
  %t5157 = call fastcc i64%t5156(i64 %t5152, i64 4, i64 %t5134, i64 %a1, i64 %t5150, i64 %t5151, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5158 = or i64 %t5120, %a1
  %t5159 = and i64 %t5158, 7
  %t5160 = icmp eq i64 %t5159, 0
  br i1 %t5160, label %fixfast1177, label %fixslow1178
fixfast1177:
  %t5161 = icmp slt i64 %t5120, %a1
  %t5162 = select i1 %t5161, i64 257, i64 1
  br label %fixmerge1179
fixslow1178:
  %t5163 = call i64 @rt_lt(i64 %t5120, i64 %a1)
  br label %fixmerge1179
fixmerge1179:
  %t5164 = phi i64 [ %t5162, %fixfast1177 ], [ %t5163, %fixslow1178 ]
  %t5165 = icmp ne i64 %t5164, 1
  br i1 %t5165, label %then1180, label %else1181
then1180:
  %t5166 = call ptr @rt_alloc_words(i64 6)
  %t5167 = ptrtoint ptr %t5166 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_987" to i64), ptr %t5166
  %t5168 = or i64 %t5167, 4
  %t5169 = getelementptr i64, ptr %t5166, i64 1
  store i64 %a0, ptr %t5169
  %t5170 = getelementptr i64, ptr %t5166, i64 2
  store i64 %a1, ptr %t5170
  %t5171 = getelementptr i64, ptr %t5166, i64 3
  store i64 %a2, ptr %t5171
  %t5172 = getelementptr i64, ptr %t5166, i64 4
  store i64 %t5120, ptr %t5172
  %t5173 = getelementptr i64, ptr %t5166, i64 5
  store i64 %t5168, ptr %t5173
  %t5174 = or i64 %t5126, %t5120
  %t5175 = and i64 %t5174, 7
  %t5176 = icmp eq i64 %t5175, 0
  br i1 %t5176, label %fixfast1182, label %fixslow1183
fixfast1182:
  %t5177 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5126, i64 %t5120)
  %t5178 = extractvalue {i64, i1} %t5177, 0
  %t5179 = extractvalue {i64, i1} %t5177, 1
  br i1 %t5179, label %fixslow1183, label %fixmerge1184
fixslow1183:
  %t5180 = call i64 @rt_sub(i64 %t5126, i64 %t5120)
  br label %fixmerge1184
fixmerge1184:
  %t5181 = phi i64 [ %t5178, %fixfast1182 ], [ %t5180, %fixslow1183 ]
  %t5182 = or i64 %t5181, 8
  %t5183 = and i64 %t5182, 7
  %t5184 = icmp eq i64 %t5183, 0
  br i1 %t5184, label %fixfast1185, label %fixslow1186
fixfast1185:
  %t5185 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5181, i64 8)
  %t5186 = extractvalue {i64, i1} %t5185, 0
  %t5187 = extractvalue {i64, i1} %t5185, 1
  br i1 %t5187, label %fixslow1186, label %fixmerge1187
fixslow1186:
  %t5188 = call i64 @rt_sub(i64 %t5181, i64 8)
  br label %fixmerge1187
fixmerge1187:
  %t5189 = phi i64 [ %t5186, %fixfast1185 ], [ %t5188, %fixslow1186 ]
  %t5190 = musttail call fastcc i64 @"scheme.base:code_987"(i64 %t5168, i64 1, i64 %t5189, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5190
else1181:
  %t5191 = call ptr @rt_alloc_words(i64 7)
  %t5192 = ptrtoint ptr %t5191 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_989" to i64), ptr %t5191
  %t5193 = or i64 %t5192, 4
  %t5194 = getelementptr i64, ptr %t5191, i64 1
  store i64 %t5126, ptr %t5194
  %t5195 = getelementptr i64, ptr %t5191, i64 2
  store i64 %t5120, ptr %t5195
  %t5196 = getelementptr i64, ptr %t5191, i64 3
  store i64 %a0, ptr %t5196
  %t5197 = getelementptr i64, ptr %t5191, i64 4
  store i64 %a1, ptr %t5197
  %t5198 = getelementptr i64, ptr %t5191, i64 5
  store i64 %a2, ptr %t5198
  %t5199 = getelementptr i64, ptr %t5191, i64 6
  store i64 %t5193, ptr %t5199
  %t5200 = musttail call fastcc i64 @"scheme.base:code_989"(i64 %t5193, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5200
}

define fastcc i64 @"scheme.base:code_1007"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5205 = icmp eq i64 %argc, 1
  br i1 %t5205, label %argok1189, label %arityerr1188
arityerr1188:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1189:
  %t5206 = and i64 %self, -8
  %t5207 = inttoptr i64 %t5206 to ptr
  %t5208 = getelementptr i64, ptr %t5207, i64 1
  %t5209 = load i64, ptr %t5208
  %t5210 = or i64 %a0, %t5209
  %t5211 = and i64 %t5210, 7
  %t5212 = icmp eq i64 %t5211, 0
  br i1 %t5212, label %fixfast1190, label %fixslow1191
fixfast1190:
  %t5213 = icmp eq i64 %a0, %t5209
  %t5214 = select i1 %t5213, i64 257, i64 1
  br label %fixmerge1192
fixslow1191:
  %t5215 = call i64 @rt_num_eq(i64 %a0, i64 %t5209)
  br label %fixmerge1192
fixmerge1192:
  %t5216 = phi i64 [ %t5214, %fixfast1190 ], [ %t5215, %fixslow1191 ]
  %t5217 = icmp ne i64 %t5216, 1
  br i1 %t5217, label %then1193, label %else1194
then1193:
  %t5218 = and i64 %self, -8
  %t5219 = inttoptr i64 %t5218 to ptr
  %t5220 = getelementptr i64, ptr %t5219, i64 3
  %t5221 = load i64, ptr %t5220
  %t5222 = call i64 @rt_cdr(i64 %t5221)
  %t5223 = and i64 %self, -8
  %t5224 = inttoptr i64 %t5223 to ptr
  %t5225 = getelementptr i64, ptr %t5224, i64 4
  %t5226 = load i64, ptr %t5225
  %t5227 = and i64 %self, -8
  %t5228 = inttoptr i64 %t5227 to ptr
  %t5229 = getelementptr i64, ptr %t5228, i64 1
  %t5230 = load i64, ptr %t5229
  %t5231 = or i64 %t5226, %t5230
  %t5232 = and i64 %t5231, 7
  %t5233 = icmp eq i64 %t5232, 0
  br i1 %t5233, label %fixfast1195, label %fixslow1196
fixfast1195:
  %t5234 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5226, i64 %t5230)
  %t5235 = extractvalue {i64, i1} %t5234, 0
  %t5236 = extractvalue {i64, i1} %t5234, 1
  br i1 %t5236, label %fixslow1196, label %fixmerge1197
fixslow1196:
  %t5237 = call i64 @rt_add(i64 %t5226, i64 %t5230)
  br label %fixmerge1197
fixmerge1197:
  %t5238 = phi i64 [ %t5235, %fixfast1195 ], [ %t5237, %fixslow1196 ]
  %t5239 = and i64 %self, -8
  %t5240 = inttoptr i64 %t5239 to ptr
  %t5241 = getelementptr i64, ptr %t5240, i64 2
  %t5242 = load i64, ptr %t5241
  %t5243 = musttail call fastcc i64 @"scheme.base:code_1005"(i64 %t5242, i64 2, i64 %t5222, i64 %t5238, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5243
else1194:
  %t5244 = and i64 %self, -8
  %t5245 = inttoptr i64 %t5244 to ptr
  %t5246 = getelementptr i64, ptr %t5245, i64 5
  %t5247 = load i64, ptr %t5246
  %t5248 = and i64 %self, -8
  %t5249 = inttoptr i64 %t5248 to ptr
  %t5250 = getelementptr i64, ptr %t5249, i64 4
  %t5251 = load i64, ptr %t5250
  %t5252 = or i64 %t5251, %a0
  %t5253 = and i64 %t5252, 7
  %t5254 = icmp eq i64 %t5253, 0
  br i1 %t5254, label %fixfast1198, label %fixslow1199
fixfast1198:
  %t5255 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5251, i64 %a0)
  %t5256 = extractvalue {i64, i1} %t5255, 0
  %t5257 = extractvalue {i64, i1} %t5255, 1
  br i1 %t5257, label %fixslow1199, label %fixmerge1200
fixslow1199:
  %t5258 = call i64 @rt_add(i64 %t5251, i64 %a0)
  br label %fixmerge1200
fixmerge1200:
  %t5259 = phi i64 [ %t5256, %fixfast1198 ], [ %t5258, %fixslow1199 ]
  %t5260 = and i64 %self, -8
  %t5261 = inttoptr i64 %t5260 to ptr
  %t5262 = getelementptr i64, ptr %t5261, i64 6
  %t5263 = load i64, ptr %t5262
  %t5264 = call i64 @rt_bytevector_u8_ref(i64 %t5263, i64 %a0)
  %t5265 = call i64 @rt_bytevector_u8_set(i64 %t5247, i64 %t5259, i64 %t5264)
  %t5266 = or i64 %a0, 8
  %t5267 = and i64 %t5266, 7
  %t5268 = icmp eq i64 %t5267, 0
  br i1 %t5268, label %fixfast1201, label %fixslow1202
fixfast1201:
  %t5269 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5270 = extractvalue {i64, i1} %t5269, 0
  %t5271 = extractvalue {i64, i1} %t5269, 1
  br i1 %t5271, label %fixslow1202, label %fixmerge1203
fixslow1202:
  %t5272 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1203
fixmerge1203:
  %t5273 = phi i64 [ %t5270, %fixfast1201 ], [ %t5272, %fixslow1202 ]
  %t5274 = musttail call fastcc i64 @"scheme.base:code_1007"(i64 %self, i64 1, i64 %t5273, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5274
}

define fastcc i64 @"scheme.base:code_1005"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5275 = icmp eq i64 %argc, 2
  br i1 %t5275, label %argok1205, label %arityerr1204
arityerr1204:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1205:
  %t5276 = call i64 @rt_null_p(i64 %a0)
  %t5277 = icmp ne i64 %t5276, 1
  br i1 %t5277, label %then1206, label %else1207
then1206:
  %t5278 = and i64 %self, -8
  %t5279 = inttoptr i64 %t5278 to ptr
  %t5280 = getelementptr i64, ptr %t5279, i64 1
  %t5281 = load i64, ptr %t5280
  ret i64 %t5281
else1207:
  %t5282 = call i64 @rt_car(i64 %a0)
  %t5283 = call i64 @rt_bytevector_length(i64 %t5282)
  %t5284 = call ptr @rt_alloc_words(i64 8)
  %t5285 = ptrtoint ptr %t5284 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1007" to i64), ptr %t5284
  %t5286 = or i64 %t5285, 4
  %t5287 = getelementptr i64, ptr %t5284, i64 1
  store i64 %t5283, ptr %t5287
  %t5288 = and i64 %self, -8
  %t5289 = inttoptr i64 %t5288 to ptr
  %t5290 = getelementptr i64, ptr %t5289, i64 2
  %t5291 = load i64, ptr %t5290
  %t5292 = getelementptr i64, ptr %t5284, i64 2
  store i64 %t5291, ptr %t5292
  %t5293 = getelementptr i64, ptr %t5284, i64 3
  store i64 %a0, ptr %t5293
  %t5294 = getelementptr i64, ptr %t5284, i64 4
  store i64 %a1, ptr %t5294
  %t5295 = and i64 %self, -8
  %t5296 = inttoptr i64 %t5295 to ptr
  %t5297 = getelementptr i64, ptr %t5296, i64 1
  %t5298 = load i64, ptr %t5297
  %t5299 = getelementptr i64, ptr %t5284, i64 5
  store i64 %t5298, ptr %t5299
  %t5300 = getelementptr i64, ptr %t5284, i64 6
  store i64 %t5282, ptr %t5300
  %t5301 = getelementptr i64, ptr %t5284, i64 7
  store i64 %t5286, ptr %t5301
  %t5302 = musttail call fastcc i64 @"scheme.base:code_1007"(i64 %t5286, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5302
}

define fastcc i64 @"scheme.base:code:bytevector-append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5303 = icmp sge i64 %argc, 0
  br i1 %t5303, label %argok1209, label %arityerr1208
arityerr1208:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1209:
  %t5304 = call ptr @rt_alloc_words(i64 8)
  %t5305 = getelementptr i64, ptr %t5304, i64 0
  store i64 %a0, ptr %t5305
  %t5306 = getelementptr i64, ptr %t5304, i64 1
  store i64 %a1, ptr %t5306
  %t5307 = getelementptr i64, ptr %t5304, i64 2
  store i64 %a2, ptr %t5307
  %t5308 = getelementptr i64, ptr %t5304, i64 3
  store i64 %a3, ptr %t5308
  %t5309 = getelementptr i64, ptr %t5304, i64 4
  store i64 %a4, ptr %t5309
  %t5310 = getelementptr i64, ptr %t5304, i64 5
  store i64 %a5, ptr %t5310
  %t5311 = getelementptr i64, ptr %t5304, i64 6
  store i64 %a6, ptr %t5311
  %t5312 = getelementptr i64, ptr %t5304, i64 7
  store i64 %a7, ptr %t5312
  %t5313 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t5304, ptr %overflow)
  %t5314 = load i64, ptr @"scheme.base:bv-total"
  %t5315 = and i64 %t5314, -8
  %t5316 = inttoptr i64 %t5315 to ptr
  %t5317 = load i64, ptr %t5316
  %t5318 = inttoptr i64 %t5317 to ptr
  %t5319 = call fastcc i64%t5318(i64 %t5314, i64 1, i64 %t5313, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5320 = call i64 @rt_make_bytevector(i64 %t5319, i64 0)
  %t5321 = call ptr @rt_alloc_words(i64 3)
  %t5322 = ptrtoint ptr %t5321 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1005" to i64), ptr %t5321
  %t5323 = or i64 %t5322, 4
  %t5324 = getelementptr i64, ptr %t5321, i64 1
  store i64 %t5320, ptr %t5324
  %t5325 = getelementptr i64, ptr %t5321, i64 2
  store i64 %t5323, ptr %t5325
  %t5326 = musttail call fastcc i64 @"scheme.base:code_1005"(i64 %t5323, i64 2, i64 %t5313, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5326
}

define fastcc i64 @"scheme.base:code:bv-total"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5331 = icmp eq i64 %argc, 1
  br i1 %t5331, label %argok1211, label %arityerr1210
arityerr1210:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1211:
  %t5332 = call i64 @rt_null_p(i64 %a0)
  %t5333 = icmp ne i64 %t5332, 1
  br i1 %t5333, label %then1212, label %else1213
then1212:
  ret i64 0
else1213:
  %t5334 = call i64 @rt_car(i64 %a0)
  %t5335 = call i64 @rt_bytevector_length(i64 %t5334)
  %t5336 = call i64 @rt_cdr(i64 %a0)
  %t5337 = load i64, ptr @"scheme.base:bv-total"
  %t5338 = and i64 %t5337, -8
  %t5339 = inttoptr i64 %t5338 to ptr
  %t5340 = load i64, ptr %t5339
  %t5341 = inttoptr i64 %t5340 to ptr
  %t5342 = call fastcc i64%t5341(i64 %t5337, i64 1, i64 %t5336, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5343 = or i64 %t5335, %t5342
  %t5344 = and i64 %t5343, 7
  %t5345 = icmp eq i64 %t5344, 0
  br i1 %t5345, label %fixfast1214, label %fixslow1215
fixfast1214:
  %t5346 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5335, i64 %t5342)
  %t5347 = extractvalue {i64, i1} %t5346, 0
  %t5348 = extractvalue {i64, i1} %t5346, 1
  br i1 %t5348, label %fixslow1215, label %fixmerge1216
fixslow1215:
  %t5349 = call i64 @rt_add(i64 %t5335, i64 %t5342)
  br label %fixmerge1216
fixmerge1216:
  %t5350 = phi i64 [ %t5347, %fixfast1214 ], [ %t5349, %fixslow1215 ]
  ret i64 %t5350
}

define fastcc i64 @"scheme.base:code:rationalize"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5356 = icmp eq i64 %argc, 2
  br i1 %t5356, label %argok1218, label %arityerr1217
arityerr1217:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1218:
  %t5357 = load i64, ptr @"scheme.base:abs"
  %t5358 = and i64 %t5357, -8
  %t5359 = inttoptr i64 %t5358 to ptr
  %t5360 = load i64, ptr %t5359
  %t5361 = inttoptr i64 %t5360 to ptr
  %t5362 = call fastcc i64%t5361(i64 %t5357, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5363 = or i64 %a0, %t5362
  %t5364 = and i64 %t5363, 7
  %t5365 = icmp eq i64 %t5364, 0
  br i1 %t5365, label %fixfast1219, label %fixslow1220
fixfast1219:
  %t5366 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t5362)
  %t5367 = extractvalue {i64, i1} %t5366, 0
  %t5368 = extractvalue {i64, i1} %t5366, 1
  br i1 %t5368, label %fixslow1220, label %fixmerge1221
fixslow1220:
  %t5369 = call i64 @rt_sub(i64 %a0, i64 %t5362)
  br label %fixmerge1221
fixmerge1221:
  %t5370 = phi i64 [ %t5367, %fixfast1219 ], [ %t5369, %fixslow1220 ]
  %t5371 = load i64, ptr @"scheme.base:abs"
  %t5372 = and i64 %t5371, -8
  %t5373 = inttoptr i64 %t5372 to ptr
  %t5374 = load i64, ptr %t5373
  %t5375 = inttoptr i64 %t5374 to ptr
  %t5376 = call fastcc i64%t5375(i64 %t5371, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5377 = or i64 %a0, %t5376
  %t5378 = and i64 %t5377, 7
  %t5379 = icmp eq i64 %t5378, 0
  br i1 %t5379, label %fixfast1222, label %fixslow1223
fixfast1222:
  %t5380 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 %t5376)
  %t5381 = extractvalue {i64, i1} %t5380, 0
  %t5382 = extractvalue {i64, i1} %t5380, 1
  br i1 %t5382, label %fixslow1223, label %fixmerge1224
fixslow1223:
  %t5383 = call i64 @rt_add(i64 %a0, i64 %t5376)
  br label %fixmerge1224
fixmerge1224:
  %t5384 = phi i64 [ %t5381, %fixfast1222 ], [ %t5383, %fixslow1223 ]
  %t5385 = call i64 @rt_exact_p(i64 %a0)
  %t5386 = icmp ne i64 %t5385, 1
  br i1 %t5386, label %then1225, label %else1226
then1225:
  %t5387 = call i64 @rt_exact_p(i64 %a1)
  br label %merge1227
else1226:
  br label %merge1227
merge1227:
  %t5388 = phi i64 [ %t5387, %then1225 ], [ 1, %else1226 ]
  %t5389 = icmp ne i64 %t5388, 1
  br i1 %t5389, label %then1228, label %else1229
then1228:
  %t5390 = load i64, ptr @"scheme.base:rat-exact"
  %t5391 = and i64 %t5390, -8
  %t5392 = inttoptr i64 %t5391 to ptr
  %t5393 = load i64, ptr %t5392
  %t5394 = inttoptr i64 %t5393 to ptr
  %t5395 = musttail call fastcc i64 %t5394(i64 %t5390, i64 2, i64 %t5370, i64 %t5384, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5395
else1229:
  %t5396 = call i64 @rt_exact_to_inexact(i64 %t5370)
  %t5397 = call i64 @rt_exact_to_inexact(i64 %t5384)
  %t5398 = load i64, ptr @"scheme.base:rat-inexact"
  %t5399 = and i64 %t5398, -8
  %t5400 = inttoptr i64 %t5399 to ptr
  %t5401 = load i64, ptr %t5400
  %t5402 = inttoptr i64 %t5401 to ptr
  %t5403 = musttail call fastcc i64 %t5402(i64 %t5398, i64 2, i64 %t5396, i64 %t5397, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5403
}

define fastcc i64 @"scheme.base:code:rat-exact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5408 = icmp eq i64 %argc, 2
  br i1 %t5408, label %argok1231, label %arityerr1230
arityerr1230:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1231:
  %t5409 = or i64 %a0, 0
  %t5410 = and i64 %t5409, 7
  %t5411 = icmp eq i64 %t5410, 0
  br i1 %t5411, label %fixfast1232, label %fixslow1233
fixfast1232:
  %t5412 = icmp slt i64 %a0, 0
  %t5413 = select i1 %t5412, i64 257, i64 1
  br label %fixmerge1234
fixslow1233:
  %t5414 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge1234
fixmerge1234:
  %t5415 = phi i64 [ %t5413, %fixfast1232 ], [ %t5414, %fixslow1233 ]
  %t5416 = icmp ne i64 %t5415, 1
  br i1 %t5416, label %then1235, label %else1236
then1235:
  br label %merge1237
else1236:
  %t5417 = or i64 %a0, 0
  %t5418 = and i64 %t5417, 7
  %t5419 = icmp eq i64 %t5418, 0
  br i1 %t5419, label %fixfast1238, label %fixslow1239
fixfast1238:
  %t5420 = icmp eq i64 %a0, 0
  %t5421 = select i1 %t5420, i64 257, i64 1
  br label %fixmerge1240
fixslow1239:
  %t5422 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge1240
fixmerge1240:
  %t5423 = phi i64 [ %t5421, %fixfast1238 ], [ %t5422, %fixslow1239 ]
  br label %merge1237
merge1237:
  %t5424 = phi i64 [ 257, %then1235 ], [ %t5423, %fixmerge1240 ]
  %t5425 = icmp ne i64 %t5424, 1
  br i1 %t5425, label %then1241, label %else1242
then1241:
  %t5426 = or i64 0, %a1
  %t5427 = and i64 %t5426, 7
  %t5428 = icmp eq i64 %t5427, 0
  br i1 %t5428, label %fixfast1244, label %fixslow1245
fixfast1244:
  %t5429 = icmp slt i64 0, %a1
  %t5430 = select i1 %t5429, i64 257, i64 1
  br label %fixmerge1246
fixslow1245:
  %t5431 = call i64 @rt_lt(i64 0, i64 %a1)
  br label %fixmerge1246
fixmerge1246:
  %t5432 = phi i64 [ %t5430, %fixfast1244 ], [ %t5431, %fixslow1245 ]
  %t5433 = icmp ne i64 %t5432, 1
  br i1 %t5433, label %then1247, label %else1248
then1247:
  br label %merge1249
else1248:
  %t5434 = or i64 0, %a1
  %t5435 = and i64 %t5434, 7
  %t5436 = icmp eq i64 %t5435, 0
  br i1 %t5436, label %fixfast1250, label %fixslow1251
fixfast1250:
  %t5437 = icmp eq i64 0, %a1
  %t5438 = select i1 %t5437, i64 257, i64 1
  br label %fixmerge1252
fixslow1251:
  %t5439 = call i64 @rt_num_eq(i64 0, i64 %a1)
  br label %fixmerge1252
fixmerge1252:
  %t5440 = phi i64 [ %t5438, %fixfast1250 ], [ %t5439, %fixslow1251 ]
  br label %merge1249
merge1249:
  %t5441 = phi i64 [ 257, %then1247 ], [ %t5440, %fixmerge1252 ]
  br label %merge1243
else1242:
  br label %merge1243
merge1243:
  %t5442 = phi i64 [ %t5441, %merge1249 ], [ 1, %else1242 ]
  %t5443 = icmp ne i64 %t5442, 1
  br i1 %t5443, label %then1253, label %else1254
then1253:
  ret i64 0
else1254:
  %t5444 = or i64 0, %a0
  %t5445 = and i64 %t5444, 7
  %t5446 = icmp eq i64 %t5445, 0
  br i1 %t5446, label %fixfast1255, label %fixslow1256
fixfast1255:
  %t5447 = icmp slt i64 0, %a0
  %t5448 = select i1 %t5447, i64 257, i64 1
  br label %fixmerge1257
fixslow1256:
  %t5449 = call i64 @rt_lt(i64 0, i64 %a0)
  br label %fixmerge1257
fixmerge1257:
  %t5450 = phi i64 [ %t5448, %fixfast1255 ], [ %t5449, %fixslow1256 ]
  %t5451 = icmp ne i64 %t5450, 1
  br i1 %t5451, label %then1258, label %else1259
then1258:
  %t5452 = load i64, ptr @"scheme.base:rat-ceil"
  %t5453 = and i64 %t5452, -8
  %t5454 = inttoptr i64 %t5453 to ptr
  %t5455 = load i64, ptr %t5454
  %t5456 = inttoptr i64 %t5455 to ptr
  %t5457 = call fastcc i64%t5456(i64 %t5452, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5458 = or i64 %t5457, %a1
  %t5459 = and i64 %t5458, 7
  %t5460 = icmp eq i64 %t5459, 0
  br i1 %t5460, label %fixfast1260, label %fixslow1261
fixfast1260:
  %t5461 = icmp slt i64 %t5457, %a1
  %t5462 = select i1 %t5461, i64 257, i64 1
  br label %fixmerge1262
fixslow1261:
  %t5463 = call i64 @rt_lt(i64 %t5457, i64 %a1)
  br label %fixmerge1262
fixmerge1262:
  %t5464 = phi i64 [ %t5462, %fixfast1260 ], [ %t5463, %fixslow1261 ]
  %t5465 = icmp ne i64 %t5464, 1
  br i1 %t5465, label %then1263, label %else1264
then1263:
  br label %merge1265
else1264:
  %t5466 = or i64 %t5457, %a1
  %t5467 = and i64 %t5466, 7
  %t5468 = icmp eq i64 %t5467, 0
  br i1 %t5468, label %fixfast1266, label %fixslow1267
fixfast1266:
  %t5469 = icmp eq i64 %t5457, %a1
  %t5470 = select i1 %t5469, i64 257, i64 1
  br label %fixmerge1268
fixslow1267:
  %t5471 = call i64 @rt_num_eq(i64 %t5457, i64 %a1)
  br label %fixmerge1268
fixmerge1268:
  %t5472 = phi i64 [ %t5470, %fixfast1266 ], [ %t5471, %fixslow1267 ]
  br label %merge1265
merge1265:
  %t5473 = phi i64 [ 257, %then1263 ], [ %t5472, %fixmerge1268 ]
  %t5474 = icmp ne i64 %t5473, 1
  br i1 %t5474, label %then1269, label %else1270
then1269:
  %t5475 = load i64, ptr @"scheme.base:rat-ceil"
  %t5476 = and i64 %t5475, -8
  %t5477 = inttoptr i64 %t5476 to ptr
  %t5478 = load i64, ptr %t5477
  %t5479 = inttoptr i64 %t5478 to ptr
  %t5480 = musttail call fastcc i64 %t5479(i64 %t5475, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5480
else1270:
  %t5481 = call i64 @rt_make_string(ptr @.str.lit.24, i64 69)
  %t5482 = load i64, ptr @"scheme.base:error"
  %t5483 = and i64 %t5482, -8
  %t5484 = inttoptr i64 %t5483 to ptr
  %t5485 = load i64, ptr %t5484
  %t5486 = inttoptr i64 %t5485 to ptr
  %t5487 = musttail call fastcc i64 %t5486(i64 %t5482, i64 3, i64 %t5481, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5487
else1259:
  %t5488 = load i64, ptr @"scheme.base:rat-floor"
  %t5489 = and i64 %t5488, -8
  %t5490 = inttoptr i64 %t5489 to ptr
  %t5491 = load i64, ptr %t5490
  %t5492 = inttoptr i64 %t5491 to ptr
  %t5493 = call fastcc i64%t5492(i64 %t5488, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5494 = or i64 %a0, %t5493
  %t5495 = and i64 %t5494, 7
  %t5496 = icmp eq i64 %t5495, 0
  br i1 %t5496, label %fixfast1271, label %fixslow1272
fixfast1271:
  %t5497 = icmp slt i64 %a0, %t5493
  %t5498 = select i1 %t5497, i64 257, i64 1
  br label %fixmerge1273
fixslow1272:
  %t5499 = call i64 @rt_lt(i64 %a0, i64 %t5493)
  br label %fixmerge1273
fixmerge1273:
  %t5500 = phi i64 [ %t5498, %fixfast1271 ], [ %t5499, %fixslow1272 ]
  %t5501 = icmp ne i64 %t5500, 1
  br i1 %t5501, label %then1274, label %else1275
then1274:
  br label %merge1276
else1275:
  %t5502 = or i64 %a0, %t5493
  %t5503 = and i64 %t5502, 7
  %t5504 = icmp eq i64 %t5503, 0
  br i1 %t5504, label %fixfast1277, label %fixslow1278
fixfast1277:
  %t5505 = icmp eq i64 %a0, %t5493
  %t5506 = select i1 %t5505, i64 257, i64 1
  br label %fixmerge1279
fixslow1278:
  %t5507 = call i64 @rt_num_eq(i64 %a0, i64 %t5493)
  br label %fixmerge1279
fixmerge1279:
  %t5508 = phi i64 [ %t5506, %fixfast1277 ], [ %t5507, %fixslow1278 ]
  br label %merge1276
merge1276:
  %t5509 = phi i64 [ 257, %then1274 ], [ %t5508, %fixmerge1279 ]
  %t5510 = icmp ne i64 %t5509, 1
  br i1 %t5510, label %then1280, label %else1281
then1280:
  %t5511 = load i64, ptr @"scheme.base:rat-floor"
  %t5512 = and i64 %t5511, -8
  %t5513 = inttoptr i64 %t5512 to ptr
  %t5514 = load i64, ptr %t5513
  %t5515 = inttoptr i64 %t5514 to ptr
  %t5516 = musttail call fastcc i64 %t5515(i64 %t5511, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5516
else1281:
  %t5517 = call i64 @rt_make_string(ptr @.str.lit.25, i64 69)
  %t5518 = load i64, ptr @"scheme.base:error"
  %t5519 = and i64 %t5518, -8
  %t5520 = inttoptr i64 %t5519 to ptr
  %t5521 = load i64, ptr %t5520
  %t5522 = inttoptr i64 %t5521 to ptr
  %t5523 = musttail call fastcc i64 %t5522(i64 %t5518, i64 3, i64 %t5517, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5523
}

define fastcc i64 @"scheme.base:code:rat-ceil"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5528 = icmp eq i64 %argc, 1
  br i1 %t5528, label %argok1283, label %arityerr1282
arityerr1282:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1283:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:rat-floor"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5533 = icmp eq i64 %argc, 1
  br i1 %t5533, label %argok1285, label %arityerr1284
arityerr1284:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1285:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_1061"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5538 = icmp eq i64 %argc, 1
  br i1 %t5538, label %argok1287, label %arityerr1286
arityerr1286:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1287:
  %t5539 = load i64, ptr @"scheme.base:rat-max-denom"
  %t5540 = or i64 %t5539, %a0
  %t5541 = and i64 %t5540, 7
  %t5542 = icmp eq i64 %t5541, 0
  br i1 %t5542, label %fixfast1288, label %fixslow1289
fixfast1288:
  %t5543 = icmp slt i64 %t5539, %a0
  %t5544 = select i1 %t5543, i64 257, i64 1
  br label %fixmerge1290
fixslow1289:
  %t5545 = call i64 @rt_lt(i64 %t5539, i64 %a0)
  br label %fixmerge1290
fixmerge1290:
  %t5546 = phi i64 [ %t5544, %fixfast1288 ], [ %t5545, %fixslow1289 ]
  %t5547 = icmp ne i64 %t5546, 1
  br i1 %t5547, label %then1291, label %else1292
then1291:
  %t5548 = call i64 @rt_make_string(ptr @.str.lit.26, i64 59)
  %t5549 = and i64 %self, -8
  %t5550 = inttoptr i64 %t5549 to ptr
  %t5551 = getelementptr i64, ptr %t5550, i64 1
  %t5552 = load i64, ptr %t5551
  %t5553 = and i64 %self, -8
  %t5554 = inttoptr i64 %t5553 to ptr
  %t5555 = getelementptr i64, ptr %t5554, i64 2
  %t5556 = load i64, ptr %t5555
  %t5557 = load i64, ptr @"scheme.base:error"
  %t5558 = and i64 %t5557, -8
  %t5559 = inttoptr i64 %t5558 to ptr
  %t5560 = load i64, ptr %t5559
  %t5561 = inttoptr i64 %t5560 to ptr
  %t5562 = musttail call fastcc i64 %t5561(i64 %t5557, i64 3, i64 %t5548, i64 %t5552, i64 %t5556, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5562
else1292:
  %t5563 = and i64 %self, -8
  %t5564 = inttoptr i64 %t5563 to ptr
  %t5565 = getelementptr i64, ptr %t5564, i64 1
  %t5566 = load i64, ptr %t5565
  %t5567 = or i64 %t5566, %a0
  %t5568 = and i64 %t5567, 7
  %t5569 = icmp eq i64 %t5568, 0
  br i1 %t5569, label %fixfast1293, label %fixslow1294
fixfast1293:
  %t5570 = ashr i64 %t5566, 3
  %t5571 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t5570, i64 %a0)
  %t5572 = extractvalue {i64, i1} %t5571, 0
  %t5573 = extractvalue {i64, i1} %t5571, 1
  br i1 %t5573, label %fixslow1294, label %fixmerge1295
fixslow1294:
  %t5574 = call i64 @rt_mul(i64 %t5566, i64 %a0)
  br label %fixmerge1295
fixmerge1295:
  %t5575 = phi i64 [ %t5572, %fixfast1293 ], [ %t5574, %fixslow1294 ]
  %t5576 = and i64 %self, -8
  %t5577 = inttoptr i64 %t5576 to ptr
  %t5578 = getelementptr i64, ptr %t5577, i64 2
  %t5579 = load i64, ptr %t5578
  %t5580 = or i64 %t5579, %a0
  %t5581 = and i64 %t5580, 7
  %t5582 = icmp eq i64 %t5581, 0
  br i1 %t5582, label %fixfast1296, label %fixslow1297
fixfast1296:
  %t5583 = ashr i64 %t5579, 3
  %t5584 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t5583, i64 %a0)
  %t5585 = extractvalue {i64, i1} %t5584, 0
  %t5586 = extractvalue {i64, i1} %t5584, 1
  br i1 %t5586, label %fixslow1297, label %fixmerge1298
fixslow1297:
  %t5587 = call i64 @rt_mul(i64 %t5579, i64 %a0)
  br label %fixmerge1298
fixmerge1298:
  %t5588 = phi i64 [ %t5585, %fixfast1296 ], [ %t5587, %fixslow1297 ]
  %t5589 = load i64, ptr @"scheme.base:rat-num-in"
  %t5590 = and i64 %t5589, -8
  %t5591 = inttoptr i64 %t5590 to ptr
  %t5592 = load i64, ptr %t5591
  %t5593 = inttoptr i64 %t5592 to ptr
  %t5594 = call fastcc i64%t5593(i64 %t5589, i64 2, i64 %t5575, i64 %t5588, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5595 = icmp ne i64 %t5594, 1
  br i1 %t5595, label %then1299, label %else1300
then1299:
  %t5596 = call i64 @rt_exact_to_inexact(i64 %t5594)
  %t5597 = call i64 @rt_exact_to_inexact(i64 %a0)
  %t5598 = call i64 @rt_div(i64 %t5596, i64 %t5597)
  ret i64 %t5598
else1300:
  %t5599 = or i64 %a0, 8
  %t5600 = and i64 %t5599, 7
  %t5601 = icmp eq i64 %t5600, 0
  br i1 %t5601, label %fixfast1301, label %fixslow1302
fixfast1301:
  %t5602 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5603 = extractvalue {i64, i1} %t5602, 0
  %t5604 = extractvalue {i64, i1} %t5602, 1
  br i1 %t5604, label %fixslow1302, label %fixmerge1303
fixslow1302:
  %t5605 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1303
fixmerge1303:
  %t5606 = phi i64 [ %t5603, %fixfast1301 ], [ %t5605, %fixslow1302 ]
  %t5607 = musttail call fastcc i64 @"scheme.base:code_1061"(i64 %self, i64 1, i64 %t5606, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5607
}

define fastcc i64 @"scheme.base:code:rat-inexact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5608 = icmp eq i64 %argc, 2
  br i1 %t5608, label %argok1305, label %arityerr1304
arityerr1304:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1305:
  %t5609 = call i64 @rt_flonum_lit(ptr @.flo.lit.27)
  %t5610 = or i64 %a0, %t5609
  %t5611 = and i64 %t5610, 7
  %t5612 = icmp eq i64 %t5611, 0
  br i1 %t5612, label %fixfast1306, label %fixslow1307
fixfast1306:
  %t5613 = icmp slt i64 %a0, %t5609
  %t5614 = select i1 %t5613, i64 257, i64 1
  br label %fixmerge1308
fixslow1307:
  %t5615 = call i64 @rt_lt(i64 %a0, i64 %t5609)
  br label %fixmerge1308
fixmerge1308:
  %t5616 = phi i64 [ %t5614, %fixfast1306 ], [ %t5615, %fixslow1307 ]
  %t5617 = icmp ne i64 %t5616, 1
  br i1 %t5617, label %then1309, label %else1310
then1309:
  br label %merge1311
else1310:
  %t5618 = or i64 %a0, %t5609
  %t5619 = and i64 %t5618, 7
  %t5620 = icmp eq i64 %t5619, 0
  br i1 %t5620, label %fixfast1312, label %fixslow1313
fixfast1312:
  %t5621 = icmp eq i64 %a0, %t5609
  %t5622 = select i1 %t5621, i64 257, i64 1
  br label %fixmerge1314
fixslow1313:
  %t5623 = call i64 @rt_num_eq(i64 %a0, i64 %t5609)
  br label %fixmerge1314
fixmerge1314:
  %t5624 = phi i64 [ %t5622, %fixfast1312 ], [ %t5623, %fixslow1313 ]
  br label %merge1311
merge1311:
  %t5625 = phi i64 [ 257, %then1309 ], [ %t5624, %fixmerge1314 ]
  %t5626 = icmp ne i64 %t5625, 1
  br i1 %t5626, label %then1315, label %else1316
then1315:
  %t5627 = call i64 @rt_flonum_lit(ptr @.flo.lit.28)
  %t5628 = or i64 %t5627, %a1
  %t5629 = and i64 %t5628, 7
  %t5630 = icmp eq i64 %t5629, 0
  br i1 %t5630, label %fixfast1318, label %fixslow1319
fixfast1318:
  %t5631 = icmp slt i64 %t5627, %a1
  %t5632 = select i1 %t5631, i64 257, i64 1
  br label %fixmerge1320
fixslow1319:
  %t5633 = call i64 @rt_lt(i64 %t5627, i64 %a1)
  br label %fixmerge1320
fixmerge1320:
  %t5634 = phi i64 [ %t5632, %fixfast1318 ], [ %t5633, %fixslow1319 ]
  %t5635 = icmp ne i64 %t5634, 1
  br i1 %t5635, label %then1321, label %else1322
then1321:
  br label %merge1323
else1322:
  %t5636 = or i64 %t5627, %a1
  %t5637 = and i64 %t5636, 7
  %t5638 = icmp eq i64 %t5637, 0
  br i1 %t5638, label %fixfast1324, label %fixslow1325
fixfast1324:
  %t5639 = icmp eq i64 %t5627, %a1
  %t5640 = select i1 %t5639, i64 257, i64 1
  br label %fixmerge1326
fixslow1325:
  %t5641 = call i64 @rt_num_eq(i64 %t5627, i64 %a1)
  br label %fixmerge1326
fixmerge1326:
  %t5642 = phi i64 [ %t5640, %fixfast1324 ], [ %t5641, %fixslow1325 ]
  br label %merge1323
merge1323:
  %t5643 = phi i64 [ 257, %then1321 ], [ %t5642, %fixmerge1326 ]
  br label %merge1317
else1316:
  br label %merge1317
merge1317:
  %t5644 = phi i64 [ %t5643, %merge1323 ], [ 1, %else1316 ]
  %t5645 = icmp ne i64 %t5644, 1
  br i1 %t5645, label %then1327, label %else1328
then1327:
  %t5646 = call i64 @rt_flonum_lit(ptr @.flo.lit.29)
  ret i64 %t5646
else1328:
  %t5647 = call ptr @rt_alloc_words(i64 4)
  %t5648 = ptrtoint ptr %t5647 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1061" to i64), ptr %t5647
  %t5649 = or i64 %t5648, 4
  %t5650 = getelementptr i64, ptr %t5647, i64 1
  store i64 %a0, ptr %t5650
  %t5651 = getelementptr i64, ptr %t5647, i64 2
  store i64 %a1, ptr %t5651
  %t5652 = getelementptr i64, ptr %t5647, i64 3
  store i64 %t5649, ptr %t5652
  %t5653 = musttail call fastcc i64 @"scheme.base:code_1061"(i64 %t5649, i64 1, i64 8, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5653
}

define fastcc i64 @"scheme.base:code:rat-num-in"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5658 = icmp eq i64 %argc, 2
  br i1 %t5658, label %argok1330, label %arityerr1329
arityerr1329:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1330:
  %t5659 = load i64, ptr @"scheme.base:rat-ceil-flo"
  %t5660 = and i64 %t5659, -8
  %t5661 = inttoptr i64 %t5660 to ptr
  %t5662 = load i64, ptr %t5661
  %t5663 = inttoptr i64 %t5662 to ptr
  %t5664 = call fastcc i64%t5663(i64 %t5659, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5665 = call i64 @rt_exact_to_inexact(i64 %t5664)
  %t5666 = or i64 %t5665, %a1
  %t5667 = and i64 %t5666, 7
  %t5668 = icmp eq i64 %t5667, 0
  br i1 %t5668, label %fixfast1331, label %fixslow1332
fixfast1331:
  %t5669 = icmp slt i64 %t5665, %a1
  %t5670 = select i1 %t5669, i64 257, i64 1
  br label %fixmerge1333
fixslow1332:
  %t5671 = call i64 @rt_lt(i64 %t5665, i64 %a1)
  br label %fixmerge1333
fixmerge1333:
  %t5672 = phi i64 [ %t5670, %fixfast1331 ], [ %t5671, %fixslow1332 ]
  %t5673 = icmp ne i64 %t5672, 1
  br i1 %t5673, label %then1334, label %else1335
then1334:
  br label %merge1336
else1335:
  %t5674 = or i64 %t5665, %a1
  %t5675 = and i64 %t5674, 7
  %t5676 = icmp eq i64 %t5675, 0
  br i1 %t5676, label %fixfast1337, label %fixslow1338
fixfast1337:
  %t5677 = icmp eq i64 %t5665, %a1
  %t5678 = select i1 %t5677, i64 257, i64 1
  br label %fixmerge1339
fixslow1338:
  %t5679 = call i64 @rt_num_eq(i64 %t5665, i64 %a1)
  br label %fixmerge1339
fixmerge1339:
  %t5680 = phi i64 [ %t5678, %fixfast1337 ], [ %t5679, %fixslow1338 ]
  br label %merge1336
merge1336:
  %t5681 = phi i64 [ 257, %then1334 ], [ %t5680, %fixmerge1339 ]
  %t5682 = icmp ne i64 %t5681, 1
  br i1 %t5682, label %then1340, label %else1341
then1340:
  ret i64 %t5664
else1341:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rat-ceil-flo"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5687 = icmp eq i64 %argc, 1
  br i1 %t5687, label %argok1343, label %arityerr1342
arityerr1342:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1343:
  %t5688 = load i64, ptr @"scheme.base:floor"
  %t5689 = and i64 %t5688, -8
  %t5690 = inttoptr i64 %t5689 to ptr
  %t5691 = load i64, ptr %t5690
  %t5692 = inttoptr i64 %t5691 to ptr
  %t5693 = call fastcc i64%t5692(i64 %t5688, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5694 = call i64 @rt_inexact_to_exact(i64 %t5693)
  %t5695 = call i64 @rt_exact_to_inexact(i64 %t5694)
  %t5696 = or i64 %t5695, %a0
  %t5697 = and i64 %t5696, 7
  %t5698 = icmp eq i64 %t5697, 0
  br i1 %t5698, label %fixfast1344, label %fixslow1345
fixfast1344:
  %t5699 = icmp slt i64 %t5695, %a0
  %t5700 = select i1 %t5699, i64 257, i64 1
  br label %fixmerge1346
fixslow1345:
  %t5701 = call i64 @rt_lt(i64 %t5695, i64 %a0)
  br label %fixmerge1346
fixmerge1346:
  %t5702 = phi i64 [ %t5700, %fixfast1344 ], [ %t5701, %fixslow1345 ]
  %t5703 = icmp ne i64 %t5702, 1
  br i1 %t5703, label %then1347, label %else1348
then1347:
  %t5704 = or i64 %t5694, 8
  %t5705 = and i64 %t5704, 7
  %t5706 = icmp eq i64 %t5705, 0
  br i1 %t5706, label %fixfast1349, label %fixslow1350
fixfast1349:
  %t5707 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5694, i64 8)
  %t5708 = extractvalue {i64, i1} %t5707, 0
  %t5709 = extractvalue {i64, i1} %t5707, 1
  br i1 %t5709, label %fixslow1350, label %fixmerge1351
fixslow1350:
  %t5710 = call i64 @rt_add(i64 %t5694, i64 8)
  br label %fixmerge1351
fixmerge1351:
  %t5711 = phi i64 [ %t5708, %fixfast1349 ], [ %t5710, %fixslow1350 ]
  ret i64 %t5711
else1348:
  ret i64 %t5694
}

define fastcc i64 @"scheme.base:code:values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5716 = icmp sge i64 %argc, 0
  br i1 %t5716, label %argok1353, label %arityerr1352
arityerr1352:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1353:
  %t5717 = call ptr @rt_alloc_words(i64 8)
  %t5718 = getelementptr i64, ptr %t5717, i64 0
  store i64 %a0, ptr %t5718
  %t5719 = getelementptr i64, ptr %t5717, i64 1
  store i64 %a1, ptr %t5719
  %t5720 = getelementptr i64, ptr %t5717, i64 2
  store i64 %a2, ptr %t5720
  %t5721 = getelementptr i64, ptr %t5717, i64 3
  store i64 %a3, ptr %t5721
  %t5722 = getelementptr i64, ptr %t5717, i64 4
  store i64 %a4, ptr %t5722
  %t5723 = getelementptr i64, ptr %t5717, i64 5
  store i64 %a5, ptr %t5723
  %t5724 = getelementptr i64, ptr %t5717, i64 6
  store i64 %a6, ptr %t5724
  %t5725 = getelementptr i64, ptr %t5717, i64 7
  store i64 %a7, ptr %t5725
  %t5726 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t5717, ptr %overflow)
  %t5727 = call i64 @rt_pair_p(i64 %t5726)
  %t5728 = icmp ne i64 %t5727, 1
  br i1 %t5728, label %then1354, label %else1355
then1354:
  %t5729 = call i64 @rt_cdr(i64 %t5726)
  %t5730 = call i64 @rt_null_p(i64 %t5729)
  br label %merge1356
else1355:
  br label %merge1356
merge1356:
  %t5731 = phi i64 [ %t5730, %then1354 ], [ 1, %else1355 ]
  %t5732 = icmp ne i64 %t5731, 1
  br i1 %t5732, label %then1357, label %else1358
then1357:
  %t5733 = call i64 @rt_car(i64 %t5726)
  ret i64 %t5733
else1358:
  %t5734 = call i64 @rt_list_to_mv(i64 %t5726)
  ret i64 %t5734
}

define fastcc i64 @"scheme.base:code:call-with-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5739 = icmp eq i64 %argc, 2
  br i1 %t5739, label %argok1360, label %arityerr1359
arityerr1359:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1360:
  %t5740 = and i64 %a0, -8
  %t5741 = inttoptr i64 %t5740 to ptr
  %t5742 = load i64, ptr %t5741
  %t5743 = inttoptr i64 %t5742 to ptr
  %t5744 = call fastcc i64%t5743(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5745 = call i64 @rt_mv_p(i64 %t5744)
  %t5746 = icmp ne i64 %t5745, 1
  br i1 %t5746, label %then1361, label %else1362
then1361:
  %t5747 = call i64 @rt_mv_to_list(i64 %t5744)
  %t5748 = and i64 %a1, -8
  %t5749 = inttoptr i64 %t5748 to ptr
  %t5750 = load i64, ptr %t5749
  %t5751 = inttoptr i64 %t5750 to ptr
  %t5752 = call i64 @rt_list_length(i64 %t5747)
  %t5753 = add i64 0, %t5752
  %t5754 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t5747, i64 8)
  %t5766 = getelementptr i64, ptr %t5754, i64 0
  %t5758 = load i64, ptr %t5766
  %t5767 = getelementptr i64, ptr %t5754, i64 1
  %t5759 = load i64, ptr %t5767
  %t5768 = getelementptr i64, ptr %t5754, i64 2
  %t5760 = load i64, ptr %t5768
  %t5769 = getelementptr i64, ptr %t5754, i64 3
  %t5761 = load i64, ptr %t5769
  %t5770 = getelementptr i64, ptr %t5754, i64 4
  %t5762 = load i64, ptr %t5770
  %t5771 = getelementptr i64, ptr %t5754, i64 5
  %t5763 = load i64, ptr %t5771
  %t5772 = getelementptr i64, ptr %t5754, i64 6
  %t5764 = load i64, ptr %t5772
  %t5773 = getelementptr i64, ptr %t5754, i64 7
  %t5765 = load i64, ptr %t5773
  %t5755 = icmp sgt i64 %t5753, 8
  %t5756 = getelementptr i64, ptr %t5754, i64 8
  %t5757 = select i1 %t5755, ptr %t5756, ptr null
  %t5774 = musttail call fastcc i64 %t5751(i64 %a1, i64 %t5753, i64 %t5758, i64 %t5759, i64 %t5760, i64 %t5761, i64 %t5762, i64 %t5763, i64 %t5764, i64 %t5765, ptr %t5757)
  ret i64 %t5774
else1362:
  %t5775 = and i64 %a1, -8
  %t5776 = inttoptr i64 %t5775 to ptr
  %t5777 = load i64, ptr %t5776
  %t5778 = inttoptr i64 %t5777 to ptr
  %t5779 = musttail call fastcc i64 %t5778(i64 %a1, i64 1, i64 %t5744, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5779
}

define fastcc i64 @"scheme.base:code:make-hash-table"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5786 = icmp eq i64 %argc, 0
  br i1 %t5786, label %argok1364, label %arityerr1363
arityerr1363:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1364:
  %t5787 = load i64, ptr @"scheme.base:%ht-initial-buckets"
  %t5788 = call i64 @rt_make_vector(i64 %t5787, i64 2)
  %t5789 = load i64, ptr @"scheme.base:vector"
  %t5790 = and i64 %t5789, -8
  %t5791 = inttoptr i64 %t5790 to ptr
  %t5792 = load i64, ptr %t5791
  %t5793 = inttoptr i64 %t5792 to ptr
  %t5794 = call fastcc i64%t5793(i64 %t5789, i64 3, i64 0, i64 %t5788, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5795 = call i64 @rt_make_hash_table(i64 %t5794)
  ret i64 %t5795
}

define fastcc i64 @"scheme.base:code:hash-table?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5800 = icmp eq i64 %argc, 1
  br i1 %t5800, label %argok1366, label %arityerr1365
arityerr1365:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1366:
  %t5801 = call i64 @rt_hash_table_p(i64 %a0)
  ret i64 %t5801
}

define fastcc i64 @"scheme.base:code:%ht-count"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5806 = icmp eq i64 %argc, 1
  br i1 %t5806, label %argok1368, label %arityerr1367
arityerr1367:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1368:
  %t5807 = call i64 @rt_hash_table_spine(i64 %a0)
  %t5808 = call i64 @rt_vector_ref(i64 %t5807, i64 0)
  ret i64 %t5808
}

define fastcc i64 @"scheme.base:code:%ht-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5813 = icmp eq i64 %argc, 1
  br i1 %t5813, label %argok1370, label %arityerr1369
arityerr1369:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1370:
  %t5814 = call i64 @rt_hash_table_spine(i64 %a0)
  %t5815 = call i64 @rt_vector_ref(i64 %t5814, i64 8)
  ret i64 %t5815
}

define fastcc i64 @"scheme.base:code:%ht-set-count!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5820 = icmp eq i64 %argc, 2
  br i1 %t5820, label %argok1372, label %arityerr1371
arityerr1371:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1372:
  %t5821 = call i64 @rt_hash_table_spine(i64 %a0)
  %t5822 = call i64 @rt_vector_set(i64 %t5821, i64 0, i64 %a1)
  ret i64 %t5822
}

define fastcc i64 @"scheme.base:code:%ht-set-buckets!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5827 = icmp eq i64 %argc, 2
  br i1 %t5827, label %argok1374, label %arityerr1373
arityerr1373:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1374:
  %t5828 = call i64 @rt_hash_table_spine(i64 %a0)
  %t5829 = call i64 @rt_vector_set(i64 %t5828, i64 8, i64 %a1)
  ret i64 %t5829
}

define fastcc i64 @"scheme.base:code:%ht-index"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5834 = icmp eq i64 %argc, 2
  br i1 %t5834, label %argok1376, label %arityerr1375
arityerr1375:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1376:
  %t5835 = call i64 @rt_hash(i64 %a0)
  %t5836 = call i64 @rt_remainder(i64 %t5835, i64 %a1)
  ret i64 %t5836
}

define fastcc i64 @"scheme.base:code:%ht-assoc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5841 = icmp eq i64 %argc, 2
  br i1 %t5841, label %argok1378, label %arityerr1377
arityerr1377:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1378:
  %t5842 = call i64 @rt_null_p(i64 %a1)
  %t5843 = icmp ne i64 %t5842, 1
  br i1 %t5843, label %then1379, label %else1380
then1379:
  ret i64 1
else1380:
  %t5844 = call i64 @rt_car(i64 %a1)
  %t5845 = call i64 @rt_car(i64 %t5844)
  %t5846 = call i64 @rt_equal(i64 %a0, i64 %t5845)
  %t5847 = icmp ne i64 %t5846, 1
  br i1 %t5847, label %then1381, label %else1382
then1381:
  %t5848 = call i64 @rt_car(i64 %a1)
  ret i64 %t5848
else1382:
  %t5849 = call i64 @rt_cdr(i64 %a1)
  %t5850 = load i64, ptr @"scheme.base:%ht-assoc"
  %t5851 = and i64 %t5850, -8
  %t5852 = inttoptr i64 %t5851 to ptr
  %t5853 = load i64, ptr %t5852
  %t5854 = inttoptr i64 %t5853 to ptr
  %t5855 = musttail call fastcc i64 %t5854(i64 %t5850, i64 2, i64 %a0, i64 %t5849, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5855
}

define fastcc i64 @"scheme.base:code:%ht-remove"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5860 = icmp eq i64 %argc, 2
  br i1 %t5860, label %argok1384, label %arityerr1383
arityerr1383:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1384:
  %t5861 = call i64 @rt_null_p(i64 %a1)
  %t5862 = icmp ne i64 %t5861, 1
  br i1 %t5862, label %then1385, label %else1386
then1385:
  ret i64 2
else1386:
  %t5863 = call i64 @rt_car(i64 %a1)
  %t5864 = call i64 @rt_car(i64 %t5863)
  %t5865 = call i64 @rt_equal(i64 %a0, i64 %t5864)
  %t5866 = icmp ne i64 %t5865, 1
  br i1 %t5866, label %then1387, label %else1388
then1387:
  %t5867 = call i64 @rt_cdr(i64 %a1)
  ret i64 %t5867
else1388:
  %t5868 = call i64 @rt_car(i64 %a1)
  %t5869 = call i64 @rt_cdr(i64 %a1)
  %t5870 = load i64, ptr @"scheme.base:%ht-remove"
  %t5871 = and i64 %t5870, -8
  %t5872 = inttoptr i64 %t5871 to ptr
  %t5873 = load i64, ptr %t5872
  %t5874 = inttoptr i64 %t5873 to ptr
  %t5875 = call fastcc i64%t5874(i64 %t5870, i64 2, i64 %a0, i64 %t5869, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5876 = call i64 @rt_cons(i64 %t5868, i64 %t5875)
  ret i64 %t5876
}

define fastcc i64 @"scheme.base:code:hash-table-ref/default"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5881 = icmp eq i64 %argc, 3
  br i1 %t5881, label %argok1390, label %arityerr1389
arityerr1389:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1390:
  %t5882 = load i64, ptr @"scheme.base:%ht-buckets"
  %t5883 = and i64 %t5882, -8
  %t5884 = inttoptr i64 %t5883 to ptr
  %t5885 = load i64, ptr %t5884
  %t5886 = inttoptr i64 %t5885 to ptr
  %t5887 = call fastcc i64%t5886(i64 %t5882, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5888 = call i64 @rt_vector_length(i64 %t5887)
  %t5889 = load i64, ptr @"scheme.base:%ht-index"
  %t5890 = and i64 %t5889, -8
  %t5891 = inttoptr i64 %t5890 to ptr
  %t5892 = load i64, ptr %t5891
  %t5893 = inttoptr i64 %t5892 to ptr
  %t5894 = call fastcc i64%t5893(i64 %t5889, i64 2, i64 %a1, i64 %t5888, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5895 = call i64 @rt_vector_ref(i64 %t5887, i64 %t5894)
  %t5896 = load i64, ptr @"scheme.base:%ht-assoc"
  %t5897 = and i64 %t5896, -8
  %t5898 = inttoptr i64 %t5897 to ptr
  %t5899 = load i64, ptr %t5898
  %t5900 = inttoptr i64 %t5899 to ptr
  %t5901 = call fastcc i64%t5900(i64 %t5896, i64 2, i64 %a1, i64 %t5895, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5902 = icmp ne i64 %t5901, 1
  br i1 %t5902, label %then1391, label %else1392
then1391:
  %t5903 = call i64 @rt_cdr(i64 %t5901)
  ret i64 %t5903
else1392:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:hash-table-contains?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5908 = icmp eq i64 %argc, 2
  br i1 %t5908, label %argok1394, label %arityerr1393
arityerr1393:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1394:
  %t5909 = load i64, ptr @"scheme.base:%ht-buckets"
  %t5910 = and i64 %t5909, -8
  %t5911 = inttoptr i64 %t5910 to ptr
  %t5912 = load i64, ptr %t5911
  %t5913 = inttoptr i64 %t5912 to ptr
  %t5914 = call fastcc i64%t5913(i64 %t5909, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5915 = call i64 @rt_vector_length(i64 %t5914)
  %t5916 = load i64, ptr @"scheme.base:%ht-index"
  %t5917 = and i64 %t5916, -8
  %t5918 = inttoptr i64 %t5917 to ptr
  %t5919 = load i64, ptr %t5918
  %t5920 = inttoptr i64 %t5919 to ptr
  %t5921 = call fastcc i64%t5920(i64 %t5916, i64 2, i64 %a1, i64 %t5915, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5922 = call i64 @rt_vector_ref(i64 %t5914, i64 %t5921)
  %t5923 = load i64, ptr @"scheme.base:%ht-assoc"
  %t5924 = and i64 %t5923, -8
  %t5925 = inttoptr i64 %t5924 to ptr
  %t5926 = load i64, ptr %t5925
  %t5927 = inttoptr i64 %t5926 to ptr
  %t5928 = call fastcc i64%t5927(i64 %t5923, i64 2, i64 %a1, i64 %t5922, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5929 = icmp ne i64 %t5928, 1
  br i1 %t5929, label %then1395, label %else1396
then1395:
  ret i64 257
else1396:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-ref"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5934 = icmp eq i64 %argc, 2
  br i1 %t5934, label %argok1398, label %arityerr1397
arityerr1397:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1398:
  %t5935 = load i64, ptr @"scheme.base:%ht-buckets"
  %t5936 = and i64 %t5935, -8
  %t5937 = inttoptr i64 %t5936 to ptr
  %t5938 = load i64, ptr %t5937
  %t5939 = inttoptr i64 %t5938 to ptr
  %t5940 = call fastcc i64%t5939(i64 %t5935, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5941 = call i64 @rt_vector_length(i64 %t5940)
  %t5942 = load i64, ptr @"scheme.base:%ht-index"
  %t5943 = and i64 %t5942, -8
  %t5944 = inttoptr i64 %t5943 to ptr
  %t5945 = load i64, ptr %t5944
  %t5946 = inttoptr i64 %t5945 to ptr
  %t5947 = call fastcc i64%t5946(i64 %t5942, i64 2, i64 %a1, i64 %t5941, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5948 = call i64 @rt_vector_ref(i64 %t5940, i64 %t5947)
  %t5949 = load i64, ptr @"scheme.base:%ht-assoc"
  %t5950 = and i64 %t5949, -8
  %t5951 = inttoptr i64 %t5950 to ptr
  %t5952 = load i64, ptr %t5951
  %t5953 = inttoptr i64 %t5952 to ptr
  %t5954 = call fastcc i64%t5953(i64 %t5949, i64 2, i64 %a1, i64 %t5948, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5955 = icmp ne i64 %t5954, 1
  br i1 %t5955, label %then1399, label %else1400
then1399:
  %t5956 = call i64 @rt_cdr(i64 %t5954)
  ret i64 %t5956
else1400:
  %t5957 = call i64 @rt_make_string(ptr @.str.lit.30, i64 29)
  %t5958 = load i64, ptr @"scheme.base:error"
  %t5959 = and i64 %t5958, -8
  %t5960 = inttoptr i64 %t5959 to ptr
  %t5961 = load i64, ptr %t5960
  %t5962 = inttoptr i64 %t5961 to ptr
  %t5963 = musttail call fastcc i64 %t5962(i64 %t5958, i64 2, i64 %t5957, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5963
}

define fastcc i64 @"scheme.base:code:hash-table-set!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5968 = icmp eq i64 %argc, 3
  br i1 %t5968, label %argok1402, label %arityerr1401
arityerr1401:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1402:
  %t5969 = load i64, ptr @"scheme.base:%ht-buckets"
  %t5970 = and i64 %t5969, -8
  %t5971 = inttoptr i64 %t5970 to ptr
  %t5972 = load i64, ptr %t5971
  %t5973 = inttoptr i64 %t5972 to ptr
  %t5974 = call fastcc i64%t5973(i64 %t5969, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5975 = call i64 @rt_vector_length(i64 %t5974)
  %t5976 = load i64, ptr @"scheme.base:%ht-index"
  %t5977 = and i64 %t5976, -8
  %t5978 = inttoptr i64 %t5977 to ptr
  %t5979 = load i64, ptr %t5978
  %t5980 = inttoptr i64 %t5979 to ptr
  %t5981 = call fastcc i64%t5980(i64 %t5976, i64 2, i64 %a1, i64 %t5975, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5982 = call i64 @rt_vector_ref(i64 %t5974, i64 %t5981)
  %t5983 = load i64, ptr @"scheme.base:%ht-assoc"
  %t5984 = and i64 %t5983, -8
  %t5985 = inttoptr i64 %t5984 to ptr
  %t5986 = load i64, ptr %t5985
  %t5987 = inttoptr i64 %t5986 to ptr
  %t5988 = call fastcc i64%t5987(i64 %t5983, i64 2, i64 %a1, i64 %t5982, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5989 = call i64 @rt_cons(i64 %a1, i64 %a2)
  %t5990 = icmp ne i64 %t5988, 1
  br i1 %t5990, label %then1403, label %else1404
then1403:
  %t5991 = load i64, ptr @"scheme.base:%ht-remove"
  %t5992 = and i64 %t5991, -8
  %t5993 = inttoptr i64 %t5992 to ptr
  %t5994 = load i64, ptr %t5993
  %t5995 = inttoptr i64 %t5994 to ptr
  %t5996 = call fastcc i64%t5995(i64 %t5991, i64 2, i64 %a1, i64 %t5982, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge1405
else1404:
  br label %merge1405
merge1405:
  %t5997 = phi i64 [ %t5996, %then1403 ], [ %t5982, %else1404 ]
  %t5998 = call i64 @rt_cons(i64 %t5989, i64 %t5997)
  %t5999 = call i64 @rt_vector_set(i64 %t5974, i64 %t5981, i64 %t5998)
  %t6000 = icmp ne i64 %t5988, 1
  br i1 %t6000, label %then1406, label %else1407
then1406:
  ret i64 1
else1407:
  %t6001 = load i64, ptr @"scheme.base:%ht-count"
  %t6002 = and i64 %t6001, -8
  %t6003 = inttoptr i64 %t6002 to ptr
  %t6004 = load i64, ptr %t6003
  %t6005 = inttoptr i64 %t6004 to ptr
  %t6006 = call fastcc i64%t6005(i64 %t6001, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6007 = or i64 %t6006, 8
  %t6008 = and i64 %t6007, 7
  %t6009 = icmp eq i64 %t6008, 0
  br i1 %t6009, label %fixfast1408, label %fixslow1409
fixfast1408:
  %t6010 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6006, i64 8)
  %t6011 = extractvalue {i64, i1} %t6010, 0
  %t6012 = extractvalue {i64, i1} %t6010, 1
  br i1 %t6012, label %fixslow1409, label %fixmerge1410
fixslow1409:
  %t6013 = call i64 @rt_add(i64 %t6006, i64 8)
  br label %fixmerge1410
fixmerge1410:
  %t6014 = phi i64 [ %t6011, %fixfast1408 ], [ %t6013, %fixslow1409 ]
  %t6015 = load i64, ptr @"scheme.base:%ht-set-count!"
  %t6016 = and i64 %t6015, -8
  %t6017 = inttoptr i64 %t6016 to ptr
  %t6018 = load i64, ptr %t6017
  %t6019 = inttoptr i64 %t6018 to ptr
  %t6020 = call fastcc i64%t6019(i64 %t6015, i64 2, i64 %a0, i64 %t6014, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6021 = load i64, ptr @"scheme.base:%ht-count"
  %t6022 = and i64 %t6021, -8
  %t6023 = inttoptr i64 %t6022 to ptr
  %t6024 = load i64, ptr %t6023
  %t6025 = inttoptr i64 %t6024 to ptr
  %t6026 = call fastcc i64%t6025(i64 %t6021, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6027 = load i64, ptr @"scheme.base:%ht-load-factor"
  %t6028 = or i64 %t6027, %t5975
  %t6029 = and i64 %t6028, 7
  %t6030 = icmp eq i64 %t6029, 0
  br i1 %t6030, label %fixfast1411, label %fixslow1412
fixfast1411:
  %t6031 = ashr i64 %t6027, 3
  %t6032 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t6031, i64 %t5975)
  %t6033 = extractvalue {i64, i1} %t6032, 0
  %t6034 = extractvalue {i64, i1} %t6032, 1
  br i1 %t6034, label %fixslow1412, label %fixmerge1413
fixslow1412:
  %t6035 = call i64 @rt_mul(i64 %t6027, i64 %t5975)
  br label %fixmerge1413
fixmerge1413:
  %t6036 = phi i64 [ %t6033, %fixfast1411 ], [ %t6035, %fixslow1412 ]
  %t6037 = or i64 %t6036, %t6026
  %t6038 = and i64 %t6037, 7
  %t6039 = icmp eq i64 %t6038, 0
  br i1 %t6039, label %fixfast1414, label %fixslow1415
fixfast1414:
  %t6040 = icmp slt i64 %t6036, %t6026
  %t6041 = select i1 %t6040, i64 257, i64 1
  br label %fixmerge1416
fixslow1415:
  %t6042 = call i64 @rt_lt(i64 %t6036, i64 %t6026)
  br label %fixmerge1416
fixmerge1416:
  %t6043 = phi i64 [ %t6041, %fixfast1414 ], [ %t6042, %fixslow1415 ]
  %t6044 = icmp ne i64 %t6043, 1
  br i1 %t6044, label %then1417, label %else1418
then1417:
  %t6045 = load i64, ptr @"scheme.base:%ht-grow!"
  %t6046 = and i64 %t6045, -8
  %t6047 = inttoptr i64 %t6046 to ptr
  %t6048 = load i64, ptr %t6047
  %t6049 = inttoptr i64 %t6048 to ptr
  %t6050 = musttail call fastcc i64 %t6049(i64 %t6045, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6050
else1418:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-delete!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6055 = icmp eq i64 %argc, 2
  br i1 %t6055, label %argok1420, label %arityerr1419
arityerr1419:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1420:
  %t6056 = load i64, ptr @"scheme.base:%ht-buckets"
  %t6057 = and i64 %t6056, -8
  %t6058 = inttoptr i64 %t6057 to ptr
  %t6059 = load i64, ptr %t6058
  %t6060 = inttoptr i64 %t6059 to ptr
  %t6061 = call fastcc i64%t6060(i64 %t6056, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6062 = call i64 @rt_vector_length(i64 %t6061)
  %t6063 = load i64, ptr @"scheme.base:%ht-index"
  %t6064 = and i64 %t6063, -8
  %t6065 = inttoptr i64 %t6064 to ptr
  %t6066 = load i64, ptr %t6065
  %t6067 = inttoptr i64 %t6066 to ptr
  %t6068 = call fastcc i64%t6067(i64 %t6063, i64 2, i64 %a1, i64 %t6062, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6069 = call i64 @rt_vector_ref(i64 %t6061, i64 %t6068)
  %t6070 = load i64, ptr @"scheme.base:%ht-assoc"
  %t6071 = and i64 %t6070, -8
  %t6072 = inttoptr i64 %t6071 to ptr
  %t6073 = load i64, ptr %t6072
  %t6074 = inttoptr i64 %t6073 to ptr
  %t6075 = call fastcc i64%t6074(i64 %t6070, i64 2, i64 %a1, i64 %t6069, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6076 = icmp ne i64 %t6075, 1
  br i1 %t6076, label %then1421, label %else1422
then1421:
  %t6077 = load i64, ptr @"scheme.base:%ht-remove"
  %t6078 = and i64 %t6077, -8
  %t6079 = inttoptr i64 %t6078 to ptr
  %t6080 = load i64, ptr %t6079
  %t6081 = inttoptr i64 %t6080 to ptr
  %t6082 = call fastcc i64%t6081(i64 %t6077, i64 2, i64 %a1, i64 %t6069, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6083 = call i64 @rt_vector_set(i64 %t6061, i64 %t6068, i64 %t6082)
  %t6084 = load i64, ptr @"scheme.base:%ht-count"
  %t6085 = and i64 %t6084, -8
  %t6086 = inttoptr i64 %t6085 to ptr
  %t6087 = load i64, ptr %t6086
  %t6088 = inttoptr i64 %t6087 to ptr
  %t6089 = call fastcc i64%t6088(i64 %t6084, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6090 = or i64 %t6089, 8
  %t6091 = and i64 %t6090, 7
  %t6092 = icmp eq i64 %t6091, 0
  br i1 %t6092, label %fixfast1423, label %fixslow1424
fixfast1423:
  %t6093 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6089, i64 8)
  %t6094 = extractvalue {i64, i1} %t6093, 0
  %t6095 = extractvalue {i64, i1} %t6093, 1
  br i1 %t6095, label %fixslow1424, label %fixmerge1425
fixslow1424:
  %t6096 = call i64 @rt_sub(i64 %t6089, i64 8)
  br label %fixmerge1425
fixmerge1425:
  %t6097 = phi i64 [ %t6094, %fixfast1423 ], [ %t6096, %fixslow1424 ]
  %t6098 = load i64, ptr @"scheme.base:%ht-set-count!"
  %t6099 = and i64 %t6098, -8
  %t6100 = inttoptr i64 %t6099 to ptr
  %t6101 = load i64, ptr %t6100
  %t6102 = inttoptr i64 %t6101 to ptr
  %t6103 = musttail call fastcc i64 %t6102(i64 %t6098, i64 2, i64 %a0, i64 %t6097, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6103
else1422:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_1157"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6108 = icmp eq i64 %argc, 1
  br i1 %t6108, label %argok1427, label %arityerr1426
arityerr1426:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1427:
  %t6109 = call i64 @rt_null_p(i64 %a0)
  %t6110 = icmp ne i64 %t6109, 1
  br i1 %t6110, label %then1428, label %else1429
then1428:
  ret i64 1
else1429:
  %t6111 = call i64 @rt_car(i64 %a0)
  %t6112 = call i64 @rt_car(i64 %t6111)
  %t6113 = and i64 %self, -8
  %t6114 = inttoptr i64 %t6113 to ptr
  %t6115 = getelementptr i64, ptr %t6114, i64 1
  %t6116 = load i64, ptr %t6115
  %t6117 = load i64, ptr @"scheme.base:%ht-index"
  %t6118 = and i64 %t6117, -8
  %t6119 = inttoptr i64 %t6118 to ptr
  %t6120 = load i64, ptr %t6119
  %t6121 = inttoptr i64 %t6120 to ptr
  %t6122 = call fastcc i64%t6121(i64 %t6117, i64 2, i64 %t6112, i64 %t6116, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6123 = and i64 %self, -8
  %t6124 = inttoptr i64 %t6123 to ptr
  %t6125 = getelementptr i64, ptr %t6124, i64 2
  %t6126 = load i64, ptr %t6125
  %t6127 = and i64 %self, -8
  %t6128 = inttoptr i64 %t6127 to ptr
  %t6129 = getelementptr i64, ptr %t6128, i64 2
  %t6130 = load i64, ptr %t6129
  %t6131 = call i64 @rt_vector_ref(i64 %t6130, i64 %t6122)
  %t6132 = call i64 @rt_cons(i64 %t6111, i64 %t6131)
  %t6133 = call i64 @rt_vector_set(i64 %t6126, i64 %t6122, i64 %t6132)
  %t6134 = call i64 @rt_cdr(i64 %a0)
  %t6135 = musttail call fastcc i64 @"scheme.base:code_1157"(i64 %self, i64 1, i64 %t6134, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6135
}

define fastcc i64 @"scheme.base:code_1155"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6136 = icmp eq i64 %argc, 1
  br i1 %t6136, label %argok1431, label %arityerr1430
arityerr1430:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1431:
  %t6137 = and i64 %self, -8
  %t6138 = inttoptr i64 %t6137 to ptr
  %t6139 = getelementptr i64, ptr %t6138, i64 1
  %t6140 = load i64, ptr %t6139
  %t6141 = call i64 @rt_vector_length(i64 %t6140)
  %t6142 = or i64 %a0, %t6141
  %t6143 = and i64 %t6142, 7
  %t6144 = icmp eq i64 %t6143, 0
  br i1 %t6144, label %fixfast1432, label %fixslow1433
fixfast1432:
  %t6145 = icmp slt i64 %a0, %t6141
  %t6146 = select i1 %t6145, i64 257, i64 1
  br label %fixmerge1434
fixslow1433:
  %t6147 = call i64 @rt_lt(i64 %a0, i64 %t6141)
  br label %fixmerge1434
fixmerge1434:
  %t6148 = phi i64 [ %t6146, %fixfast1432 ], [ %t6147, %fixslow1433 ]
  %t6149 = icmp ne i64 %t6148, 1
  br i1 %t6149, label %then1435, label %else1436
then1435:
  %t6150 = call ptr @rt_alloc_words(i64 4)
  %t6151 = ptrtoint ptr %t6150 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1157" to i64), ptr %t6150
  %t6152 = or i64 %t6151, 4
  %t6153 = and i64 %self, -8
  %t6154 = inttoptr i64 %t6153 to ptr
  %t6155 = getelementptr i64, ptr %t6154, i64 2
  %t6156 = load i64, ptr %t6155
  %t6157 = getelementptr i64, ptr %t6150, i64 1
  store i64 %t6156, ptr %t6157
  %t6158 = and i64 %self, -8
  %t6159 = inttoptr i64 %t6158 to ptr
  %t6160 = getelementptr i64, ptr %t6159, i64 3
  %t6161 = load i64, ptr %t6160
  %t6162 = getelementptr i64, ptr %t6150, i64 2
  store i64 %t6161, ptr %t6162
  %t6163 = getelementptr i64, ptr %t6150, i64 3
  store i64 %t6152, ptr %t6163
  %t6164 = and i64 %self, -8
  %t6165 = inttoptr i64 %t6164 to ptr
  %t6166 = getelementptr i64, ptr %t6165, i64 1
  %t6167 = load i64, ptr %t6166
  %t6168 = call i64 @rt_vector_ref(i64 %t6167, i64 %a0)
  %t6169 = call fastcc i64 @"scheme.base:code_1157"(i64 %t6152, i64 1, i64 %t6168, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6170 = or i64 %a0, 8
  %t6171 = and i64 %t6170, 7
  %t6172 = icmp eq i64 %t6171, 0
  br i1 %t6172, label %fixfast1437, label %fixslow1438
fixfast1437:
  %t6173 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t6174 = extractvalue {i64, i1} %t6173, 0
  %t6175 = extractvalue {i64, i1} %t6173, 1
  br i1 %t6175, label %fixslow1438, label %fixmerge1439
fixslow1438:
  %t6176 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1439
fixmerge1439:
  %t6177 = phi i64 [ %t6174, %fixfast1437 ], [ %t6176, %fixslow1438 ]
  %t6178 = musttail call fastcc i64 @"scheme.base:code_1155"(i64 %self, i64 1, i64 %t6177, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6178
else1436:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%ht-grow!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6179 = icmp eq i64 %argc, 1
  br i1 %t6179, label %argok1441, label %arityerr1440
arityerr1440:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1441:
  %t6180 = load i64, ptr @"scheme.base:%ht-buckets"
  %t6181 = and i64 %t6180, -8
  %t6182 = inttoptr i64 %t6181 to ptr
  %t6183 = load i64, ptr %t6182
  %t6184 = inttoptr i64 %t6183 to ptr
  %t6185 = call fastcc i64%t6184(i64 %t6180, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6186 = call i64 @rt_vector_length(i64 %t6185)
  %t6187 = or i64 16, %t6186
  %t6188 = and i64 %t6187, 7
  %t6189 = icmp eq i64 %t6188, 0
  br i1 %t6189, label %fixfast1442, label %fixslow1443
fixfast1442:
  %t6190 = ashr i64 16, 3
  %t6191 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t6190, i64 %t6186)
  %t6192 = extractvalue {i64, i1} %t6191, 0
  %t6193 = extractvalue {i64, i1} %t6191, 1
  br i1 %t6193, label %fixslow1443, label %fixmerge1444
fixslow1443:
  %t6194 = call i64 @rt_mul(i64 16, i64 %t6186)
  br label %fixmerge1444
fixmerge1444:
  %t6195 = phi i64 [ %t6192, %fixfast1442 ], [ %t6194, %fixslow1443 ]
  %t6196 = call i64 @rt_make_vector(i64 %t6195, i64 2)
  %t6197 = call ptr @rt_alloc_words(i64 5)
  %t6198 = ptrtoint ptr %t6197 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1155" to i64), ptr %t6197
  %t6199 = or i64 %t6198, 4
  %t6200 = getelementptr i64, ptr %t6197, i64 1
  store i64 %t6185, ptr %t6200
  %t6201 = getelementptr i64, ptr %t6197, i64 2
  store i64 %t6195, ptr %t6201
  %t6202 = getelementptr i64, ptr %t6197, i64 3
  store i64 %t6196, ptr %t6202
  %t6203 = getelementptr i64, ptr %t6197, i64 4
  store i64 %t6199, ptr %t6203
  %t6204 = call fastcc i64 @"scheme.base:code_1155"(i64 %t6199, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6205 = load i64, ptr @"scheme.base:%ht-set-buckets!"
  %t6206 = and i64 %t6205, -8
  %t6207 = inttoptr i64 %t6206 to ptr
  %t6208 = load i64, ptr %t6207
  %t6209 = inttoptr i64 %t6208 to ptr
  %t6210 = musttail call fastcc i64 %t6209(i64 %t6205, i64 2, i64 %a0, i64 %t6196, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6210
}

define fastcc i64 @"scheme.base:code:hash-table-size"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6215 = icmp eq i64 %argc, 1
  br i1 %t6215, label %argok1446, label %arityerr1445
arityerr1445:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1446:
  %t6216 = load i64, ptr @"scheme.base:%ht-count"
  %t6217 = and i64 %t6216, -8
  %t6218 = inttoptr i64 %t6217 to ptr
  %t6219 = load i64, ptr %t6218
  %t6220 = inttoptr i64 %t6219 to ptr
  %t6221 = musttail call fastcc i64 %t6220(i64 %t6216, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6221
}

define fastcc i64 @"scheme.base:code:%ht-fold-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6226 = icmp eq i64 %argc, 2
  br i1 %t6226, label %argok1448, label %arityerr1447
arityerr1447:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1448:
  %t6227 = call i64 @rt_null_p(i64 %a0)
  %t6228 = icmp ne i64 %t6227, 1
  br i1 %t6228, label %then1449, label %else1450
then1449:
  ret i64 %a1
else1450:
  %t6229 = call i64 @rt_car(i64 %a0)
  %t6230 = call i64 @rt_car(i64 %t6229)
  %t6231 = call i64 @rt_car(i64 %a0)
  %t6232 = call i64 @rt_cdr(i64 %t6231)
  %t6233 = call i64 @rt_cons(i64 %t6230, i64 %t6232)
  %t6234 = call i64 @rt_cdr(i64 %a0)
  %t6235 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  %t6236 = and i64 %t6235, -8
  %t6237 = inttoptr i64 %t6236 to ptr
  %t6238 = load i64, ptr %t6237
  %t6239 = inttoptr i64 %t6238 to ptr
  %t6240 = call fastcc i64%t6239(i64 %t6235, i64 2, i64 %t6234, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6241 = call i64 @rt_cons(i64 %t6233, i64 %t6240)
  ret i64 %t6241
}

define fastcc i64 @"scheme.base:code_1174"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6246 = icmp eq i64 %argc, 2
  br i1 %t6246, label %argok1452, label %arityerr1451
arityerr1451:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1452:
  %t6247 = and i64 %self, -8
  %t6248 = inttoptr i64 %t6247 to ptr
  %t6249 = getelementptr i64, ptr %t6248, i64 1
  %t6250 = load i64, ptr %t6249
  %t6251 = call i64 @rt_vector_length(i64 %t6250)
  %t6252 = or i64 %a0, %t6251
  %t6253 = and i64 %t6252, 7
  %t6254 = icmp eq i64 %t6253, 0
  br i1 %t6254, label %fixfast1453, label %fixslow1454
fixfast1453:
  %t6255 = icmp slt i64 %a0, %t6251
  %t6256 = select i1 %t6255, i64 257, i64 1
  br label %fixmerge1455
fixslow1454:
  %t6257 = call i64 @rt_lt(i64 %a0, i64 %t6251)
  br label %fixmerge1455
fixmerge1455:
  %t6258 = phi i64 [ %t6256, %fixfast1453 ], [ %t6257, %fixslow1454 ]
  %t6259 = icmp ne i64 %t6258, 1
  br i1 %t6259, label %then1456, label %else1457
then1456:
  %t6260 = or i64 %a0, 8
  %t6261 = and i64 %t6260, 7
  %t6262 = icmp eq i64 %t6261, 0
  br i1 %t6262, label %fixfast1458, label %fixslow1459
fixfast1458:
  %t6263 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t6264 = extractvalue {i64, i1} %t6263, 0
  %t6265 = extractvalue {i64, i1} %t6263, 1
  br i1 %t6265, label %fixslow1459, label %fixmerge1460
fixslow1459:
  %t6266 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1460
fixmerge1460:
  %t6267 = phi i64 [ %t6264, %fixfast1458 ], [ %t6266, %fixslow1459 ]
  %t6268 = and i64 %self, -8
  %t6269 = inttoptr i64 %t6268 to ptr
  %t6270 = getelementptr i64, ptr %t6269, i64 1
  %t6271 = load i64, ptr %t6270
  %t6272 = call i64 @rt_vector_ref(i64 %t6271, i64 %a0)
  %t6273 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  %t6274 = and i64 %t6273, -8
  %t6275 = inttoptr i64 %t6274 to ptr
  %t6276 = load i64, ptr %t6275
  %t6277 = inttoptr i64 %t6276 to ptr
  %t6278 = call fastcc i64%t6277(i64 %t6273, i64 2, i64 %t6272, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6279 = musttail call fastcc i64 @"scheme.base:code_1174"(i64 %self, i64 2, i64 %t6267, i64 %t6278, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6279
else1457:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:hash-table->alist"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6280 = icmp eq i64 %argc, 1
  br i1 %t6280, label %argok1462, label %arityerr1461
arityerr1461:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1462:
  %t6281 = load i64, ptr @"scheme.base:%ht-buckets"
  %t6282 = and i64 %t6281, -8
  %t6283 = inttoptr i64 %t6282 to ptr
  %t6284 = load i64, ptr %t6283
  %t6285 = inttoptr i64 %t6284 to ptr
  %t6286 = call fastcc i64%t6285(i64 %t6281, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6287 = call ptr @rt_alloc_words(i64 3)
  %t6288 = ptrtoint ptr %t6287 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1174" to i64), ptr %t6287
  %t6289 = or i64 %t6288, 4
  %t6290 = getelementptr i64, ptr %t6287, i64 1
  store i64 %t6286, ptr %t6290
  %t6291 = getelementptr i64, ptr %t6287, i64 2
  store i64 %t6289, ptr %t6291
  %t6292 = musttail call fastcc i64 @"scheme.base:code_1174"(i64 %t6289, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6292
}

define fastcc i64 @"scheme.base:code_1179"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6297 = icmp eq i64 %argc, 1
  br i1 %t6297, label %argok1464, label %arityerr1463
arityerr1463:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1464:
  %t6298 = call i64 @rt_car(i64 %a0)
  ret i64 %t6298
}

define fastcc i64 @"scheme.base:code:hash-table-keys"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6299 = icmp eq i64 %argc, 1
  br i1 %t6299, label %argok1466, label %arityerr1465
arityerr1465:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1466:
  %t6300 = call ptr @rt_alloc_words(i64 1)
  %t6301 = ptrtoint ptr %t6300 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1179" to i64), ptr %t6300
  %t6302 = or i64 %t6301, 4
  %t6303 = load i64, ptr @"scheme.base:hash-table->alist"
  %t6304 = and i64 %t6303, -8
  %t6305 = inttoptr i64 %t6304 to ptr
  %t6306 = load i64, ptr %t6305
  %t6307 = inttoptr i64 %t6306 to ptr
  %t6308 = call fastcc i64%t6307(i64 %t6303, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6309 = load i64, ptr @"scheme.base:map"
  %t6310 = and i64 %t6309, -8
  %t6311 = inttoptr i64 %t6310 to ptr
  %t6312 = load i64, ptr %t6311
  %t6313 = inttoptr i64 %t6312 to ptr
  %t6314 = musttail call fastcc i64 %t6313(i64 %t6309, i64 2, i64 %t6302, i64 %t6308, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6314
}

define fastcc i64 @"scheme.base:code_1184"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6319 = icmp eq i64 %argc, 1
  br i1 %t6319, label %argok1468, label %arityerr1467
arityerr1467:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1468:
  %t6320 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t6320
}

define fastcc i64 @"scheme.base:code:hash-table-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6321 = icmp eq i64 %argc, 1
  br i1 %t6321, label %argok1470, label %arityerr1469
arityerr1469:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1470:
  %t6322 = call ptr @rt_alloc_words(i64 1)
  %t6323 = ptrtoint ptr %t6322 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1184" to i64), ptr %t6322
  %t6324 = or i64 %t6323, 4
  %t6325 = load i64, ptr @"scheme.base:hash-table->alist"
  %t6326 = and i64 %t6325, -8
  %t6327 = inttoptr i64 %t6326 to ptr
  %t6328 = load i64, ptr %t6327
  %t6329 = inttoptr i64 %t6328 to ptr
  %t6330 = call fastcc i64%t6329(i64 %t6325, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6331 = load i64, ptr @"scheme.base:map"
  %t6332 = and i64 %t6331, -8
  %t6333 = inttoptr i64 %t6332 to ptr
  %t6334 = load i64, ptr %t6333
  %t6335 = inttoptr i64 %t6334 to ptr
  %t6336 = musttail call fastcc i64 %t6335(i64 %t6331, i64 2, i64 %t6324, i64 %t6330, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6336
}

define fastcc i64 @"scheme.base:code:rd-report"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6341 = icmp eq i64 %argc, 3
  br i1 %t6341, label %argok1472, label %arityerr1471
arityerr1471:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1472:
  %t6342 = call i64 @rt_car(i64 %a2)
  %t6343 = call i64 @rt_cdr(i64 %a2)
  %t6344 = load i64, ptr @"emit.internal:rd-fail-pos"
  %t6345 = call fastcc i64 @"emit.internal:code:rd-fail-pos"(i64 %t6344, i64 1, i64 %t6343, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6346 = call i64 @rt_intern(ptr @.str.sym.31)
  %t6347 = call i64 @rt_eq_p(i64 %t6342, i64 %t6346)
  %t6348 = icmp ne i64 %t6347, 1
  br i1 %t6348, label %then1473, label %else1474
then1473:
  %t6349 = call i64 @rt_intern(ptr @.str.sym.32)
  %t6350 = call i64 @rt_make_string(ptr @.str.lit.33, i64 45)
  %t6351 = load i64, ptr @"scheme.base:error"
  %t6352 = and i64 %t6351, -8
  %t6353 = inttoptr i64 %t6352 to ptr
  %t6354 = load i64, ptr %t6353
  %t6355 = inttoptr i64 %t6354 to ptr
  %t6356 = musttail call fastcc i64 %t6355(i64 %t6351, i64 3, i64 %t6349, i64 %t6350, i64 %t6345, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6356
else1474:
  %t6357 = call i64 @rt_intern(ptr @.str.sym.34)
  %t6358 = call i64 @rt_eq_p(i64 %t6342, i64 %t6357)
  %t6359 = icmp ne i64 %t6358, 1
  br i1 %t6359, label %then1475, label %else1476
then1475:
  %t6360 = call i64 @rt_intern(ptr @.str.sym.32)
  %t6361 = call i64 @rt_make_string(ptr @.str.lit.35, i64 41)
  %t6362 = load i64, ptr @"scheme.base:error"
  %t6363 = and i64 %t6362, -8
  %t6364 = inttoptr i64 %t6363 to ptr
  %t6365 = load i64, ptr %t6364
  %t6366 = inttoptr i64 %t6365 to ptr
  %t6367 = musttail call fastcc i64 %t6366(i64 %t6362, i64 3, i64 %t6360, i64 %t6361, i64 %t6345, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6367
else1476:
  %t6368 = call i64 @rt_intern(ptr @.str.sym.36)
  %t6369 = call i64 @rt_eq_p(i64 %t6342, i64 %t6368)
  %t6370 = icmp ne i64 %t6369, 1
  br i1 %t6370, label %then1477, label %else1478
then1477:
  %t6371 = call i64 @rt_intern(ptr @.str.sym.32)
  %t6372 = call i64 @rt_make_string(ptr @.str.lit.37, i64 13)
  %t6373 = call i64 @rt_string_ref(i64 %a0, i64 %t6345)
  %t6374 = call i64 @rt_char_to_integer(i64 %t6373)
  %t6375 = or i64 %t6374, 728
  %t6376 = and i64 %t6375, 7
  %t6377 = icmp eq i64 %t6376, 0
  br i1 %t6377, label %fixfast1479, label %fixslow1480
fixfast1479:
  %t6378 = icmp eq i64 %t6374, 728
  %t6379 = select i1 %t6378, i64 257, i64 1
  br label %fixmerge1481
fixslow1480:
  %t6380 = call i64 @rt_num_eq(i64 %t6374, i64 728)
  br label %fixmerge1481
fixmerge1481:
  %t6381 = phi i64 [ %t6379, %fixfast1479 ], [ %t6380, %fixslow1480 ]
  %t6382 = icmp ne i64 %t6381, 1
  br i1 %t6382, label %then1482, label %else1483
then1482:
  %t6383 = call i64 @rt_make_string(ptr @.str.lit.38, i64 6)
  br label %merge1484
else1483:
  %t6384 = or i64 %t6374, 280
  %t6385 = and i64 %t6384, 7
  %t6386 = icmp eq i64 %t6385, 0
  br i1 %t6386, label %fixfast1485, label %fixslow1486
fixfast1485:
  %t6387 = icmp eq i64 %t6374, 280
  %t6388 = select i1 %t6387, i64 257, i64 1
  br label %fixmerge1487
fixslow1486:
  %t6389 = call i64 @rt_num_eq(i64 %t6374, i64 280)
  br label %fixmerge1487
fixmerge1487:
  %t6390 = phi i64 [ %t6388, %fixfast1485 ], [ %t6389, %fixslow1486 ]
  %t6391 = icmp ne i64 %t6390, 1
  br i1 %t6391, label %then1488, label %else1489
then1488:
  %t6392 = or i64 %t6345, 8
  %t6393 = and i64 %t6392, 7
  %t6394 = icmp eq i64 %t6393, 0
  br i1 %t6394, label %fixfast1491, label %fixslow1492
fixfast1491:
  %t6395 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6345, i64 8)
  %t6396 = extractvalue {i64, i1} %t6395, 0
  %t6397 = extractvalue {i64, i1} %t6395, 1
  br i1 %t6397, label %fixslow1492, label %fixmerge1493
fixslow1492:
  %t6398 = call i64 @rt_add(i64 %t6345, i64 8)
  br label %fixmerge1493
fixmerge1493:
  %t6399 = phi i64 [ %t6396, %fixfast1491 ], [ %t6398, %fixslow1492 ]
  %t6400 = or i64 %t6399, %a1
  %t6401 = and i64 %t6400, 7
  %t6402 = icmp eq i64 %t6401, 0
  br i1 %t6402, label %fixfast1494, label %fixslow1495
fixfast1494:
  %t6403 = icmp slt i64 %t6399, %a1
  %t6404 = select i1 %t6403, i64 257, i64 1
  br label %fixmerge1496
fixslow1495:
  %t6405 = call i64 @rt_lt(i64 %t6399, i64 %a1)
  br label %fixmerge1496
fixmerge1496:
  %t6406 = phi i64 [ %t6404, %fixfast1494 ], [ %t6405, %fixslow1495 ]
  %t6407 = icmp ne i64 %t6406, 1
  br i1 %t6407, label %then1497, label %else1498
then1497:
  %t6408 = or i64 %t6345, 8
  %t6409 = and i64 %t6408, 7
  %t6410 = icmp eq i64 %t6409, 0
  br i1 %t6410, label %fixfast1500, label %fixslow1501
fixfast1500:
  %t6411 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6345, i64 8)
  %t6412 = extractvalue {i64, i1} %t6411, 0
  %t6413 = extractvalue {i64, i1} %t6411, 1
  br i1 %t6413, label %fixslow1501, label %fixmerge1502
fixslow1501:
  %t6414 = call i64 @rt_add(i64 %t6345, i64 8)
  br label %fixmerge1502
fixmerge1502:
  %t6415 = phi i64 [ %t6412, %fixfast1500 ], [ %t6414, %fixslow1501 ]
  %t6416 = call i64 @rt_string_ref(i64 %a0, i64 %t6415)
  %t6417 = call i64 @rt_char_to_integer(i64 %t6416)
  %t6418 = or i64 %t6417, 936
  %t6419 = and i64 %t6418, 7
  %t6420 = icmp eq i64 %t6419, 0
  br i1 %t6420, label %fixfast1503, label %fixslow1504
fixfast1503:
  %t6421 = icmp eq i64 %t6417, 936
  %t6422 = select i1 %t6421, i64 257, i64 1
  br label %fixmerge1505
fixslow1504:
  %t6423 = call i64 @rt_num_eq(i64 %t6417, i64 936)
  br label %fixmerge1505
fixmerge1505:
  %t6424 = phi i64 [ %t6422, %fixfast1503 ], [ %t6423, %fixslow1504 ]
  br label %merge1499
else1498:
  br label %merge1499
merge1499:
  %t6425 = phi i64 [ %t6424, %fixmerge1505 ], [ 1, %else1498 ]
  br label %merge1490
else1489:
  br label %merge1490
merge1490:
  %t6426 = phi i64 [ %t6425, %merge1499 ], [ 1, %else1489 ]
  %t6427 = icmp ne i64 %t6426, 1
  br i1 %t6427, label %then1506, label %else1507
then1506:
  %t6428 = call i64 @rt_make_string(ptr @.str.lit.39, i64 15)
  br label %merge1508
else1507:
  %t6429 = or i64 %t6374, 280
  %t6430 = and i64 %t6429, 7
  %t6431 = icmp eq i64 %t6430, 0
  br i1 %t6431, label %fixfast1509, label %fixslow1510
fixfast1509:
  %t6432 = icmp eq i64 %t6374, 280
  %t6433 = select i1 %t6432, i64 257, i64 1
  br label %fixmerge1511
fixslow1510:
  %t6434 = call i64 @rt_num_eq(i64 %t6374, i64 280)
  br label %fixmerge1511
fixmerge1511:
  %t6435 = phi i64 [ %t6433, %fixfast1509 ], [ %t6434, %fixslow1510 ]
  %t6436 = icmp ne i64 %t6435, 1
  br i1 %t6436, label %then1512, label %else1513
then1512:
  %t6437 = call i64 @rt_make_string(ptr @.str.lit.40, i64 9)
  br label %merge1514
else1513:
  %t6438 = call i64 @rt_make_string(ptr @.str.lit.41, i64 6)
  br label %merge1514
merge1514:
  %t6439 = phi i64 [ %t6437, %then1512 ], [ %t6438, %else1513 ]
  br label %merge1508
merge1508:
  %t6440 = phi i64 [ %t6428, %then1506 ], [ %t6439, %merge1514 ]
  br label %merge1484
merge1484:
  %t6441 = phi i64 [ %t6383, %then1482 ], [ %t6440, %merge1508 ]
  %t6442 = call i64 @rt_string_append(i64 %t6372, i64 %t6441)
  %t6443 = call i64 @rt_make_string(ptr @.str.lit.42, i64 16)
  %t6444 = call i64 @rt_string_append(i64 %t6442, i64 %t6443)
  %t6445 = load i64, ptr @"scheme.base:error"
  %t6446 = and i64 %t6445, -8
  %t6447 = inttoptr i64 %t6446 to ptr
  %t6448 = load i64, ptr %t6447
  %t6449 = inttoptr i64 %t6448 to ptr
  %t6450 = musttail call fastcc i64 %t6449(i64 %t6445, i64 3, i64 %t6371, i64 %t6444, i64 %t6345, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6450
else1478:
  %t6451 = call i64 @rt_intern(ptr @.str.sym.43)
  %t6452 = call i64 @rt_eq_p(i64 %t6342, i64 %t6451)
  %t6453 = icmp ne i64 %t6452, 1
  br i1 %t6453, label %then1515, label %else1516
then1515:
  %t6454 = call i64 @rt_intern(ptr @.str.sym.32)
  %t6455 = call i64 @rt_make_string(ptr @.str.lit.44, i64 37)
  %t6456 = load i64, ptr @"scheme.base:error"
  %t6457 = and i64 %t6456, -8
  %t6458 = inttoptr i64 %t6457 to ptr
  %t6459 = load i64, ptr %t6458
  %t6460 = inttoptr i64 %t6459 to ptr
  %t6461 = musttail call fastcc i64 %t6460(i64 %t6456, i64 3, i64 %t6454, i64 %t6455, i64 %t6345, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6461
else1516:
  %t6462 = call i64 @rt_intern(ptr @.str.sym.45)
  %t6463 = call i64 @rt_eq_p(i64 %t6342, i64 %t6462)
  %t6464 = icmp ne i64 %t6463, 1
  br i1 %t6464, label %then1517, label %else1518
then1517:
  %t6465 = call i64 @rt_intern(ptr @.str.sym.32)
  %t6466 = call i64 @rt_make_string(ptr @.str.lit.46, i64 49)
  %t6467 = load i64, ptr @"scheme.base:error"
  %t6468 = and i64 %t6467, -8
  %t6469 = inttoptr i64 %t6468 to ptr
  %t6470 = load i64, ptr %t6469
  %t6471 = inttoptr i64 %t6470 to ptr
  %t6472 = musttail call fastcc i64 %t6471(i64 %t6467, i64 3, i64 %t6465, i64 %t6466, i64 %t6345, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6472
else1518:
  %t6473 = call i64 @rt_intern(ptr @.str.sym.47)
  %t6474 = call i64 @rt_eq_p(i64 %t6342, i64 %t6473)
  %t6475 = icmp ne i64 %t6474, 1
  br i1 %t6475, label %then1519, label %else1520
then1519:
  %t6476 = call i64 @rt_intern(ptr @.str.sym.32)
  %t6477 = call i64 @rt_make_string(ptr @.str.lit.48, i64 23)
  %t6478 = load i64, ptr @"scheme.base:error"
  %t6479 = and i64 %t6478, -8
  %t6480 = inttoptr i64 %t6479 to ptr
  %t6481 = load i64, ptr %t6480
  %t6482 = inttoptr i64 %t6481 to ptr
  %t6483 = musttail call fastcc i64 %t6482(i64 %t6478, i64 3, i64 %t6476, i64 %t6477, i64 %t6345, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6483
else1520:
  %t6484 = call i64 @rt_intern(ptr @.str.sym.49)
  %t6485 = call i64 @rt_eq_p(i64 %t6342, i64 %t6484)
  %t6486 = icmp ne i64 %t6485, 1
  br i1 %t6486, label %then1521, label %else1522
then1521:
  %t6487 = call i64 @rt_intern(ptr @.str.sym.32)
  %t6488 = call i64 @rt_make_string(ptr @.str.lit.50, i64 56)
  %t6489 = call i64 @rt_make_string(ptr @.str.lit.51, i64 38)
  %t6490 = call i64 @rt_string_append(i64 %t6488, i64 %t6489)
  %t6491 = load i64, ptr @"emit.internal:rd-token-at"
  %t6492 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t6491, i64 3, i64 %a0, i64 %a1, i64 %t6345, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6493 = load i64, ptr @"scheme.base:error"
  %t6494 = and i64 %t6493, -8
  %t6495 = inttoptr i64 %t6494 to ptr
  %t6496 = load i64, ptr %t6495
  %t6497 = inttoptr i64 %t6496 to ptr
  %t6498 = musttail call fastcc i64 %t6497(i64 %t6493, i64 3, i64 %t6487, i64 %t6490, i64 %t6492, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6498
else1522:
  %t6499 = call i64 @rt_intern(ptr @.str.sym.32)
  %t6500 = call i64 @rt_make_string(ptr @.str.lit.52, i64 19)
  %t6501 = load i64, ptr @"emit.internal:rd-token-at"
  %t6502 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t6501, i64 3, i64 %a0, i64 %a1, i64 %t6345, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6503 = load i64, ptr @"scheme.base:error"
  %t6504 = and i64 %t6503, -8
  %t6505 = inttoptr i64 %t6504 to ptr
  %t6506 = load i64, ptr %t6505
  %t6507 = inttoptr i64 %t6506 to ptr
  %t6508 = musttail call fastcc i64 %t6507(i64 %t6503, i64 3, i64 %t6499, i64 %t6500, i64 %t6502, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6508
}

define fastcc i64 @"scheme.base:code:read-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6513 = icmp eq i64 %argc, 1
  br i1 %t6513, label %argok1524, label %arityerr1523
arityerr1523:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1524:
  %t6514 = call i64 @rt_string_length(i64 %a0)
  %t6515 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t6516 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t6515, i64 3, i64 %a0, i64 %t6514, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6517 = load i64, ptr @"emit.internal:rd-datum"
  %t6518 = call fastcc i64 @"emit.internal:code:rd-datum"(i64 %t6517, i64 4, i64 %a0, i64 %t6514, i64 %t6516, i64 1, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6519 = call i64 @rt_cdr(i64 %t6518)
  %t6520 = load i64, ptr @"emit.internal:rd-fail?"
  %t6521 = call fastcc i64 @"emit.internal:code:rd-fail?"(i64 %t6520, i64 1, i64 %t6519, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6522 = icmp ne i64 %t6521, 1
  br i1 %t6522, label %then1525, label %else1526
then1525:
  %t6523 = load i64, ptr @"scheme.base:rd-report"
  %t6524 = and i64 %t6523, -8
  %t6525 = inttoptr i64 %t6524 to ptr
  %t6526 = load i64, ptr %t6525
  %t6527 = inttoptr i64 %t6526 to ptr
  %t6528 = musttail call fastcc i64 %t6527(i64 %t6523, i64 3, i64 %a0, i64 %t6514, i64 %t6518, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6528
else1526:
  %t6529 = call i64 @rt_car(i64 %t6518)
  ret i64 %t6529
}

define fastcc i64 @"scheme.base:code:read-all-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6534 = icmp eq i64 %argc, 1
  br i1 %t6534, label %argok1528, label %arityerr1527
arityerr1527:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1528:
  %t6535 = load i64, ptr @"scheme.base:rd-all"
  %t6536 = and i64 %t6535, -8
  %t6537 = inttoptr i64 %t6536 to ptr
  %t6538 = load i64, ptr %t6537
  %t6539 = inttoptr i64 %t6538 to ptr
  %t6540 = musttail call fastcc i64 %t6539(i64 %t6535, i64 2, i64 %a0, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6540
}

define fastcc i64 @"scheme.base:code:read-all-from-string-ci"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6545 = icmp eq i64 %argc, 1
  br i1 %t6545, label %argok1530, label %arityerr1529
arityerr1529:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1530:
  %t6546 = load i64, ptr @"scheme.base:rd-all"
  %t6547 = and i64 %t6546, -8
  %t6548 = inttoptr i64 %t6547 to ptr
  %t6549 = load i64, ptr %t6548
  %t6550 = inttoptr i64 %t6549 to ptr
  %t6551 = musttail call fastcc i64 %t6550(i64 %t6546, i64 2, i64 %a0, i64 257, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6551
}

define fastcc i64 @"scheme.base:code_1261"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6556 = icmp eq i64 %argc, 2
  br i1 %t6556, label %argok1532, label %arityerr1531
arityerr1531:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1532:
  %t6557 = load i64, ptr @"emit.internal:rd-fail?"
  %t6558 = call fastcc i64 @"emit.internal:code:rd-fail?"(i64 %t6557, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6559 = icmp ne i64 %t6558, 1
  br i1 %t6559, label %then1533, label %else1534
then1533:
  %t6560 = and i64 %self, -8
  %t6561 = inttoptr i64 %t6560 to ptr
  %t6562 = getelementptr i64, ptr %t6561, i64 1
  %t6563 = load i64, ptr %t6562
  %t6564 = and i64 %self, -8
  %t6565 = inttoptr i64 %t6564 to ptr
  %t6566 = getelementptr i64, ptr %t6565, i64 2
  %t6567 = load i64, ptr %t6566
  %t6568 = call i64 @rt_intern(ptr @.str.sym.31)
  %t6569 = call i64 @rt_cons(i64 %t6568, i64 %a0)
  %t6570 = load i64, ptr @"scheme.base:rd-report"
  %t6571 = and i64 %t6570, -8
  %t6572 = inttoptr i64 %t6571 to ptr
  %t6573 = load i64, ptr %t6572
  %t6574 = inttoptr i64 %t6573 to ptr
  %t6575 = musttail call fastcc i64 %t6574(i64 %t6570, i64 3, i64 %t6563, i64 %t6567, i64 %t6569, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6575
else1534:
  %t6576 = and i64 %self, -8
  %t6577 = inttoptr i64 %t6576 to ptr
  %t6578 = getelementptr i64, ptr %t6577, i64 2
  %t6579 = load i64, ptr %t6578
  %t6580 = or i64 %a0, %t6579
  %t6581 = and i64 %t6580, 7
  %t6582 = icmp eq i64 %t6581, 0
  br i1 %t6582, label %fixfast1535, label %fixslow1536
fixfast1535:
  %t6583 = icmp slt i64 %a0, %t6579
  %t6584 = select i1 %t6583, i64 257, i64 1
  br label %fixmerge1537
fixslow1536:
  %t6585 = call i64 @rt_lt(i64 %a0, i64 %t6579)
  br label %fixmerge1537
fixmerge1537:
  %t6586 = phi i64 [ %t6584, %fixfast1535 ], [ %t6585, %fixslow1536 ]
  %t6587 = icmp ne i64 %t6586, 1
  br i1 %t6587, label %then1538, label %else1539
then1538:
  %t6588 = and i64 %self, -8
  %t6589 = inttoptr i64 %t6588 to ptr
  %t6590 = getelementptr i64, ptr %t6589, i64 1
  %t6591 = load i64, ptr %t6590
  %t6592 = and i64 %self, -8
  %t6593 = inttoptr i64 %t6592 to ptr
  %t6594 = getelementptr i64, ptr %t6593, i64 2
  %t6595 = load i64, ptr %t6594
  %t6596 = and i64 %self, -8
  %t6597 = inttoptr i64 %t6596 to ptr
  %t6598 = getelementptr i64, ptr %t6597, i64 3
  %t6599 = load i64, ptr %t6598
  %t6600 = load i64, ptr @"emit.internal:rd-datum"
  %t6601 = call fastcc i64 @"emit.internal:code:rd-datum"(i64 %t6600, i64 4, i64 %t6591, i64 %t6595, i64 %a0, i64 %t6599, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6602 = call i64 @rt_cdr(i64 %t6601)
  %t6603 = load i64, ptr @"emit.internal:rd-fail?"
  %t6604 = call fastcc i64 @"emit.internal:code:rd-fail?"(i64 %t6603, i64 1, i64 %t6602, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6605 = icmp ne i64 %t6604, 1
  br i1 %t6605, label %then1540, label %else1541
then1540:
  %t6606 = and i64 %self, -8
  %t6607 = inttoptr i64 %t6606 to ptr
  %t6608 = getelementptr i64, ptr %t6607, i64 1
  %t6609 = load i64, ptr %t6608
  %t6610 = and i64 %self, -8
  %t6611 = inttoptr i64 %t6610 to ptr
  %t6612 = getelementptr i64, ptr %t6611, i64 2
  %t6613 = load i64, ptr %t6612
  %t6614 = load i64, ptr @"scheme.base:rd-report"
  %t6615 = and i64 %t6614, -8
  %t6616 = inttoptr i64 %t6615 to ptr
  %t6617 = load i64, ptr %t6616
  %t6618 = inttoptr i64 %t6617 to ptr
  %t6619 = musttail call fastcc i64 %t6618(i64 %t6614, i64 3, i64 %t6609, i64 %t6613, i64 %t6601, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6619
else1541:
  %t6620 = and i64 %self, -8
  %t6621 = inttoptr i64 %t6620 to ptr
  %t6622 = getelementptr i64, ptr %t6621, i64 1
  %t6623 = load i64, ptr %t6622
  %t6624 = and i64 %self, -8
  %t6625 = inttoptr i64 %t6624 to ptr
  %t6626 = getelementptr i64, ptr %t6625, i64 2
  %t6627 = load i64, ptr %t6626
  %t6628 = call i64 @rt_cdr(i64 %t6601)
  %t6629 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t6630 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t6629, i64 3, i64 %t6623, i64 %t6627, i64 %t6628, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6631 = call i64 @rt_car(i64 %t6601)
  %t6632 = call i64 @rt_cons(i64 %t6631, i64 %a1)
  %t6633 = musttail call fastcc i64 @"scheme.base:code_1261"(i64 %self, i64 2, i64 %t6630, i64 %t6632, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6633
else1539:
  %t6634 = load i64, ptr @"scheme.base:reverse"
  %t6635 = and i64 %t6634, -8
  %t6636 = inttoptr i64 %t6635 to ptr
  %t6637 = load i64, ptr %t6636
  %t6638 = inttoptr i64 %t6637 to ptr
  %t6639 = musttail call fastcc i64 %t6638(i64 %t6634, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6639
}

define fastcc i64 @"scheme.base:code:rd-all"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6640 = icmp eq i64 %argc, 2
  br i1 %t6640, label %argok1543, label %arityerr1542
arityerr1542:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1543:
  %t6641 = call i64 @rt_string_length(i64 %a0)
  %t6642 = call ptr @rt_alloc_words(i64 5)
  %t6643 = ptrtoint ptr %t6642 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1261" to i64), ptr %t6642
  %t6644 = or i64 %t6643, 4
  %t6645 = getelementptr i64, ptr %t6642, i64 1
  store i64 %a0, ptr %t6645
  %t6646 = getelementptr i64, ptr %t6642, i64 2
  store i64 %t6641, ptr %t6646
  %t6647 = getelementptr i64, ptr %t6642, i64 3
  store i64 %a1, ptr %t6647
  %t6648 = getelementptr i64, ptr %t6642, i64 4
  store i64 %t6644, ptr %t6648
  %t6649 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t6650 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t6649, i64 3, i64 %a0, i64 %t6641, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6651 = musttail call fastcc i64 @"scheme.base:code_1261"(i64 %t6644, i64 2, i64 %t6650, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6651
}

define fastcc i64 @"scheme.base:code:port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6656 = icmp eq i64 %argc, 1
  br i1 %t6656, label %argok1545, label %arityerr1544
arityerr1544:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1545:
  %t6657 = load i64, ptr @"emit.internal:%port-rtd"
  %t6658 = call fastcc i64 @"emit.internal:code:%port-rtd"(i64 %t6657, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6659 = call i64 @rt_record_of_type_p(i64 %a0, i64 %t6658)
  ret i64 %t6659
}

define fastcc i64 @"scheme.base:code:input-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6664 = icmp eq i64 %argc, 1
  br i1 %t6664, label %argok1547, label %arityerr1546
arityerr1546:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1547:
  %t6665 = load i64, ptr @"scheme.base:port?"
  %t6666 = and i64 %t6665, -8
  %t6667 = inttoptr i64 %t6666 to ptr
  %t6668 = load i64, ptr %t6667
  %t6669 = inttoptr i64 %t6668 to ptr
  %t6670 = call fastcc i64%t6669(i64 %t6665, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6671 = icmp ne i64 %t6670, 1
  br i1 %t6671, label %then1548, label %else1549
then1548:
  %t6672 = call i64 @rt_record_ref(i64 %a0, i64 8)
  ret i64 %t6672
else1549:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6677 = icmp eq i64 %argc, 1
  br i1 %t6677, label %argok1551, label %arityerr1550
arityerr1550:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1551:
  %t6678 = load i64, ptr @"scheme.base:port?"
  %t6679 = and i64 %t6678, -8
  %t6680 = inttoptr i64 %t6679 to ptr
  %t6681 = load i64, ptr %t6680
  %t6682 = inttoptr i64 %t6681 to ptr
  %t6683 = call fastcc i64%t6682(i64 %t6678, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6684 = icmp ne i64 %t6683, 1
  br i1 %t6684, label %then1552, label %else1553
then1552:
  %t6685 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t6686 = call i64 @rt_not(i64 %t6685)
  ret i64 %t6686
else1553:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:textual-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6691 = icmp eq i64 %argc, 1
  br i1 %t6691, label %argok1555, label %arityerr1554
arityerr1554:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1555:
  %t6692 = load i64, ptr @"scheme.base:port?"
  %t6693 = and i64 %t6692, -8
  %t6694 = inttoptr i64 %t6693 to ptr
  %t6695 = load i64, ptr %t6694
  %t6696 = inttoptr i64 %t6695 to ptr
  %t6697 = musttail call fastcc i64 %t6696(i64 %t6692, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6697
}

define fastcc i64 @"scheme.base:code:port-closed?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6702 = icmp eq i64 %argc, 1
  br i1 %t6702, label %argok1557, label %arityerr1556
arityerr1556:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1557:
  %t6703 = call i64 @rt_record_ref(i64 %a0, i64 40)
  ret i64 %t6703
}

define fastcc i64 @"scheme.base:code:input-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6708 = icmp eq i64 %argc, 1
  br i1 %t6708, label %argok1559, label %arityerr1558
arityerr1558:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1559:
  %t6709 = load i64, ptr @"scheme.base:input-port?"
  %t6710 = and i64 %t6709, -8
  %t6711 = inttoptr i64 %t6710 to ptr
  %t6712 = load i64, ptr %t6711
  %t6713 = inttoptr i64 %t6712 to ptr
  %t6714 = call fastcc i64%t6713(i64 %t6709, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6715 = icmp ne i64 %t6714, 1
  br i1 %t6715, label %then1560, label %else1561
then1560:
  %t6716 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t6717 = call i64 @rt_not(i64 %t6716)
  ret i64 %t6717
else1561:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6722 = icmp eq i64 %argc, 1
  br i1 %t6722, label %argok1563, label %arityerr1562
arityerr1562:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1563:
  %t6723 = load i64, ptr @"scheme.base:output-port?"
  %t6724 = and i64 %t6723, -8
  %t6725 = inttoptr i64 %t6724 to ptr
  %t6726 = load i64, ptr %t6725
  %t6727 = inttoptr i64 %t6726 to ptr
  %t6728 = call fastcc i64%t6727(i64 %t6723, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6729 = icmp ne i64 %t6728, 1
  br i1 %t6729, label %then1564, label %else1565
then1564:
  %t6730 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t6731 = call i64 @rt_not(i64 %t6730)
  ret i64 %t6731
else1565:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%check-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6736 = icmp eq i64 %argc, 2
  br i1 %t6736, label %argok1567, label %arityerr1566
arityerr1566:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1567:
  %t6737 = load i64, ptr @"scheme.base:input-port?"
  %t6738 = and i64 %t6737, -8
  %t6739 = inttoptr i64 %t6738 to ptr
  %t6740 = load i64, ptr %t6739
  %t6741 = inttoptr i64 %t6740 to ptr
  %t6742 = call fastcc i64%t6741(i64 %t6737, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6743 = call i64 @rt_not(i64 %t6742)
  %t6744 = icmp ne i64 %t6743, 1
  br i1 %t6744, label %then1568, label %else1569
then1568:
  %t6745 = call i64 @rt_make_string(ptr @.str.lit.53, i64 17)
  %t6746 = load i64, ptr @"scheme.base:error"
  %t6747 = and i64 %t6746, -8
  %t6748 = inttoptr i64 %t6747 to ptr
  %t6749 = load i64, ptr %t6748
  %t6750 = inttoptr i64 %t6749 to ptr
  %t6751 = musttail call fastcc i64 %t6750(i64 %t6746, i64 3, i64 %a1, i64 %t6745, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6751
else1569:
  %t6752 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t6753 = icmp ne i64 %t6752, 1
  br i1 %t6753, label %then1570, label %else1571
then1570:
  %t6754 = call i64 @rt_make_string(ptr @.str.lit.54, i64 14)
  %t6755 = load i64, ptr @"scheme.base:error"
  %t6756 = and i64 %t6755, -8
  %t6757 = inttoptr i64 %t6756 to ptr
  %t6758 = load i64, ptr %t6757
  %t6759 = inttoptr i64 %t6758 to ptr
  %t6760 = musttail call fastcc i64 %t6759(i64 %t6755, i64 3, i64 %a1, i64 %t6754, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6760
else1571:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:%check-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6765 = icmp eq i64 %argc, 2
  br i1 %t6765, label %argok1573, label %arityerr1572
arityerr1572:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1573:
  %t6766 = load i64, ptr @"scheme.base:output-port?"
  %t6767 = and i64 %t6766, -8
  %t6768 = inttoptr i64 %t6767 to ptr
  %t6769 = load i64, ptr %t6768
  %t6770 = inttoptr i64 %t6769 to ptr
  %t6771 = call fastcc i64%t6770(i64 %t6766, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6772 = call i64 @rt_not(i64 %t6771)
  %t6773 = icmp ne i64 %t6772, 1
  br i1 %t6773, label %then1574, label %else1575
then1574:
  %t6774 = call i64 @rt_make_string(ptr @.str.lit.55, i64 18)
  %t6775 = load i64, ptr @"scheme.base:error"
  %t6776 = and i64 %t6775, -8
  %t6777 = inttoptr i64 %t6776 to ptr
  %t6778 = load i64, ptr %t6777
  %t6779 = inttoptr i64 %t6778 to ptr
  %t6780 = musttail call fastcc i64 %t6779(i64 %t6775, i64 3, i64 %a1, i64 %t6774, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6780
else1575:
  %t6781 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t6782 = icmp ne i64 %t6781, 1
  br i1 %t6782, label %then1576, label %else1577
then1576:
  %t6783 = call i64 @rt_make_string(ptr @.str.lit.56, i64 14)
  %t6784 = load i64, ptr @"scheme.base:error"
  %t6785 = and i64 %t6784, -8
  %t6786 = inttoptr i64 %t6785 to ptr
  %t6787 = load i64, ptr %t6786
  %t6788 = inttoptr i64 %t6787 to ptr
  %t6789 = musttail call fastcc i64 %t6788(i64 %t6784, i64 3, i64 %a1, i64 %t6783, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6789
else1577:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:open-input-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6794 = icmp eq i64 %argc, 1
  br i1 %t6794, label %argok1579, label %arityerr1578
arityerr1578:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1579:
  %t6795 = load i64, ptr @"emit.internal:%make-port"
  %t6796 = musttail call fastcc i64 @"emit.internal:code:%make-port"(i64 %t6795, i64 6, i64 1, i64 257, i64 %a0, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t6796
}

define fastcc i64 @"scheme.base:code:%port-at-eof?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6801 = icmp eq i64 %argc, 1
  br i1 %t6801, label %argok1581, label %arityerr1580
arityerr1580:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1581:
  %t6802 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t6803 = load i64, ptr @"emit.internal:%port-buf"
  %t6804 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t6803, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6805 = call i64 @rt_string_length(i64 %t6804)
  %t6806 = or i64 %t6805, %t6802
  %t6807 = and i64 %t6806, 7
  %t6808 = icmp eq i64 %t6807, 0
  br i1 %t6808, label %fixfast1582, label %fixslow1583
fixfast1582:
  %t6809 = icmp slt i64 %t6805, %t6802
  %t6810 = select i1 %t6809, i64 257, i64 1
  br label %fixmerge1584
fixslow1583:
  %t6811 = call i64 @rt_lt(i64 %t6805, i64 %t6802)
  br label %fixmerge1584
fixmerge1584:
  %t6812 = phi i64 [ %t6810, %fixfast1582 ], [ %t6811, %fixslow1583 ]
  %t6813 = icmp ne i64 %t6812, 1
  br i1 %t6813, label %then1585, label %else1586
then1585:
  ret i64 257
else1586:
  %t6814 = or i64 %t6802, %t6805
  %t6815 = and i64 %t6814, 7
  %t6816 = icmp eq i64 %t6815, 0
  br i1 %t6816, label %fixfast1587, label %fixslow1588
fixfast1587:
  %t6817 = icmp eq i64 %t6802, %t6805
  %t6818 = select i1 %t6817, i64 257, i64 1
  br label %fixmerge1589
fixslow1588:
  %t6819 = call i64 @rt_num_eq(i64 %t6802, i64 %t6805)
  br label %fixmerge1589
fixmerge1589:
  %t6820 = phi i64 [ %t6818, %fixfast1587 ], [ %t6819, %fixslow1588 ]
  ret i64 %t6820
}

define fastcc i64 @"scheme.base:code:read-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6825 = icmp eq i64 %argc, 1
  br i1 %t6825, label %argok1591, label %arityerr1590
arityerr1590:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1591:
  %t6826 = call i64 @rt_intern(ptr @.str.sym.57)
  %t6827 = load i64, ptr @"scheme.base:%check-input-port"
  %t6828 = and i64 %t6827, -8
  %t6829 = inttoptr i64 %t6828 to ptr
  %t6830 = load i64, ptr %t6829
  %t6831 = inttoptr i64 %t6830 to ptr
  %t6832 = call fastcc i64%t6831(i64 %t6827, i64 2, i64 %a0, i64 %t6826, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6833 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t6834 = and i64 %t6833, -8
  %t6835 = inttoptr i64 %t6834 to ptr
  %t6836 = load i64, ptr %t6835
  %t6837 = inttoptr i64 %t6836 to ptr
  %t6838 = call fastcc i64%t6837(i64 %t6833, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6839 = icmp ne i64 %t6838, 1
  br i1 %t6839, label %then1592, label %else1593
then1592:
  %t6840 = call i64 @rt_eof_object()
  ret i64 %t6840
else1593:
  %t6841 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t6842 = or i64 %t6841, 8
  %t6843 = and i64 %t6842, 7
  %t6844 = icmp eq i64 %t6843, 0
  br i1 %t6844, label %fixfast1594, label %fixslow1595
fixfast1594:
  %t6845 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6841, i64 8)
  %t6846 = extractvalue {i64, i1} %t6845, 0
  %t6847 = extractvalue {i64, i1} %t6845, 1
  br i1 %t6847, label %fixslow1595, label %fixmerge1596
fixslow1595:
  %t6848 = call i64 @rt_add(i64 %t6841, i64 8)
  br label %fixmerge1596
fixmerge1596:
  %t6849 = phi i64 [ %t6846, %fixfast1594 ], [ %t6848, %fixslow1595 ]
  %t6850 = call i64 @rt_record_set(i64 %a0, i64 24, i64 %t6849)
  %t6851 = load i64, ptr @"emit.internal:%port-buf"
  %t6852 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t6851, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6853 = call i64 @rt_string_ref(i64 %t6852, i64 %t6841)
  ret i64 %t6853
}

define fastcc i64 @"scheme.base:code:peek-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6858 = icmp eq i64 %argc, 1
  br i1 %t6858, label %argok1598, label %arityerr1597
arityerr1597:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1598:
  %t6859 = call i64 @rt_intern(ptr @.str.sym.58)
  %t6860 = load i64, ptr @"scheme.base:%check-input-port"
  %t6861 = and i64 %t6860, -8
  %t6862 = inttoptr i64 %t6861 to ptr
  %t6863 = load i64, ptr %t6862
  %t6864 = inttoptr i64 %t6863 to ptr
  %t6865 = call fastcc i64%t6864(i64 %t6860, i64 2, i64 %a0, i64 %t6859, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6866 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t6867 = and i64 %t6866, -8
  %t6868 = inttoptr i64 %t6867 to ptr
  %t6869 = load i64, ptr %t6868
  %t6870 = inttoptr i64 %t6869 to ptr
  %t6871 = call fastcc i64%t6870(i64 %t6866, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6872 = icmp ne i64 %t6871, 1
  br i1 %t6872, label %then1599, label %else1600
then1599:
  %t6873 = call i64 @rt_eof_object()
  ret i64 %t6873
else1600:
  %t6874 = load i64, ptr @"emit.internal:%port-buf"
  %t6875 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t6874, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6876 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t6877 = call i64 @rt_string_ref(i64 %t6875, i64 %t6876)
  ret i64 %t6877
}

define fastcc i64 @"scheme.base:code_1308"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6882 = icmp eq i64 %argc, 1
  br i1 %t6882, label %argok1602, label %arityerr1601
arityerr1601:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1602:
  %t6883 = and i64 %self, -8
  %t6884 = inttoptr i64 %t6883 to ptr
  %t6885 = getelementptr i64, ptr %t6884, i64 1
  %t6886 = load i64, ptr %t6885
  %t6887 = or i64 %t6886, %a0
  %t6888 = and i64 %t6887, 7
  %t6889 = icmp eq i64 %t6888, 0
  br i1 %t6889, label %fixfast1603, label %fixslow1604
fixfast1603:
  %t6890 = icmp slt i64 %t6886, %a0
  %t6891 = select i1 %t6890, i64 257, i64 1
  br label %fixmerge1605
fixslow1604:
  %t6892 = call i64 @rt_lt(i64 %t6886, i64 %a0)
  br label %fixmerge1605
fixmerge1605:
  %t6893 = phi i64 [ %t6891, %fixfast1603 ], [ %t6892, %fixslow1604 ]
  %t6894 = icmp ne i64 %t6893, 1
  br i1 %t6894, label %then1606, label %else1607
then1606:
  br label %merge1608
else1607:
  %t6895 = or i64 %a0, %t6886
  %t6896 = and i64 %t6895, 7
  %t6897 = icmp eq i64 %t6896, 0
  br i1 %t6897, label %fixfast1609, label %fixslow1610
fixfast1609:
  %t6898 = icmp eq i64 %a0, %t6886
  %t6899 = select i1 %t6898, i64 257, i64 1
  br label %fixmerge1611
fixslow1610:
  %t6900 = call i64 @rt_num_eq(i64 %a0, i64 %t6886)
  br label %fixmerge1611
fixmerge1611:
  %t6901 = phi i64 [ %t6899, %fixfast1609 ], [ %t6900, %fixslow1610 ]
  br label %merge1608
merge1608:
  %t6902 = phi i64 [ 257, %then1606 ], [ %t6901, %fixmerge1611 ]
  %t6903 = icmp ne i64 %t6902, 1
  br i1 %t6903, label %then1612, label %else1613
then1612:
  %t6904 = and i64 %self, -8
  %t6905 = inttoptr i64 %t6904 to ptr
  %t6906 = getelementptr i64, ptr %t6905, i64 2
  %t6907 = load i64, ptr %t6906
  %t6908 = call i64 @rt_record_ref(i64 %t6907, i64 24)
  %t6909 = and i64 %self, -8
  %t6910 = inttoptr i64 %t6909 to ptr
  %t6911 = getelementptr i64, ptr %t6910, i64 2
  %t6912 = load i64, ptr %t6911
  %t6913 = and i64 %self, -8
  %t6914 = inttoptr i64 %t6913 to ptr
  %t6915 = getelementptr i64, ptr %t6914, i64 1
  %t6916 = load i64, ptr %t6915
  %t6917 = call i64 @rt_record_set(i64 %t6912, i64 24, i64 %t6916)
  %t6918 = and i64 %self, -8
  %t6919 = inttoptr i64 %t6918 to ptr
  %t6920 = getelementptr i64, ptr %t6919, i64 3
  %t6921 = load i64, ptr %t6920
  %t6922 = and i64 %self, -8
  %t6923 = inttoptr i64 %t6922 to ptr
  %t6924 = getelementptr i64, ptr %t6923, i64 1
  %t6925 = load i64, ptr %t6924
  %t6926 = call i64 @rt_substring(i64 %t6921, i64 %t6908, i64 %t6925)
  ret i64 %t6926
else1613:
  %t6927 = and i64 %self, -8
  %t6928 = inttoptr i64 %t6927 to ptr
  %t6929 = getelementptr i64, ptr %t6928, i64 3
  %t6930 = load i64, ptr %t6929
  %t6931 = call i64 @rt_string_ref(i64 %t6930, i64 %a0)
  %t6932 = load i64, ptr @"scheme.base:char=?"
  %t6933 = and i64 %t6932, -8
  %t6934 = inttoptr i64 %t6933 to ptr
  %t6935 = load i64, ptr %t6934
  %t6936 = inttoptr i64 %t6935 to ptr
  %t6937 = call fastcc i64%t6936(i64 %t6932, i64 2, i64 %t6931, i64 2569, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6938 = icmp ne i64 %t6937, 1
  br i1 %t6938, label %then1614, label %else1615
then1614:
  %t6939 = and i64 %self, -8
  %t6940 = inttoptr i64 %t6939 to ptr
  %t6941 = getelementptr i64, ptr %t6940, i64 2
  %t6942 = load i64, ptr %t6941
  %t6943 = call i64 @rt_record_ref(i64 %t6942, i64 24)
  %t6944 = and i64 %self, -8
  %t6945 = inttoptr i64 %t6944 to ptr
  %t6946 = getelementptr i64, ptr %t6945, i64 2
  %t6947 = load i64, ptr %t6946
  %t6948 = or i64 %a0, 8
  %t6949 = and i64 %t6948, 7
  %t6950 = icmp eq i64 %t6949, 0
  br i1 %t6950, label %fixfast1616, label %fixslow1617
fixfast1616:
  %t6951 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t6952 = extractvalue {i64, i1} %t6951, 0
  %t6953 = extractvalue {i64, i1} %t6951, 1
  br i1 %t6953, label %fixslow1617, label %fixmerge1618
fixslow1617:
  %t6954 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1618
fixmerge1618:
  %t6955 = phi i64 [ %t6952, %fixfast1616 ], [ %t6954, %fixslow1617 ]
  %t6956 = call i64 @rt_record_set(i64 %t6947, i64 24, i64 %t6955)
  %t6957 = and i64 %self, -8
  %t6958 = inttoptr i64 %t6957 to ptr
  %t6959 = getelementptr i64, ptr %t6958, i64 3
  %t6960 = load i64, ptr %t6959
  %t6961 = call i64 @rt_substring(i64 %t6960, i64 %t6943, i64 %a0)
  ret i64 %t6961
else1615:
  %t6962 = or i64 %a0, 8
  %t6963 = and i64 %t6962, 7
  %t6964 = icmp eq i64 %t6963, 0
  br i1 %t6964, label %fixfast1619, label %fixslow1620
fixfast1619:
  %t6965 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t6966 = extractvalue {i64, i1} %t6965, 0
  %t6967 = extractvalue {i64, i1} %t6965, 1
  br i1 %t6967, label %fixslow1620, label %fixmerge1621
fixslow1620:
  %t6968 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1621
fixmerge1621:
  %t6969 = phi i64 [ %t6966, %fixfast1619 ], [ %t6968, %fixslow1620 ]
  %t6970 = musttail call fastcc i64 @"scheme.base:code_1308"(i64 %self, i64 1, i64 %t6969, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6970
}

define fastcc i64 @"scheme.base:code:read-line"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6971 = icmp eq i64 %argc, 1
  br i1 %t6971, label %argok1623, label %arityerr1622
arityerr1622:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1623:
  %t6972 = call i64 @rt_intern(ptr @.str.sym.59)
  %t6973 = load i64, ptr @"scheme.base:%check-input-port"
  %t6974 = and i64 %t6973, -8
  %t6975 = inttoptr i64 %t6974 to ptr
  %t6976 = load i64, ptr %t6975
  %t6977 = inttoptr i64 %t6976 to ptr
  %t6978 = call fastcc i64%t6977(i64 %t6973, i64 2, i64 %a0, i64 %t6972, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6979 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t6980 = and i64 %t6979, -8
  %t6981 = inttoptr i64 %t6980 to ptr
  %t6982 = load i64, ptr %t6981
  %t6983 = inttoptr i64 %t6982 to ptr
  %t6984 = call fastcc i64%t6983(i64 %t6979, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6985 = icmp ne i64 %t6984, 1
  br i1 %t6985, label %then1624, label %else1625
then1624:
  %t6986 = call i64 @rt_eof_object()
  ret i64 %t6986
else1625:
  %t6987 = load i64, ptr @"emit.internal:%port-buf"
  %t6988 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t6987, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6989 = call i64 @rt_string_length(i64 %t6988)
  %t6990 = call ptr @rt_alloc_words(i64 5)
  %t6991 = ptrtoint ptr %t6990 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1308" to i64), ptr %t6990
  %t6992 = or i64 %t6991, 4
  %t6993 = getelementptr i64, ptr %t6990, i64 1
  store i64 %t6989, ptr %t6993
  %t6994 = getelementptr i64, ptr %t6990, i64 2
  store i64 %a0, ptr %t6994
  %t6995 = getelementptr i64, ptr %t6990, i64 3
  store i64 %t6988, ptr %t6995
  %t6996 = getelementptr i64, ptr %t6990, i64 4
  store i64 %t6992, ptr %t6996
  %t6997 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t6998 = musttail call fastcc i64 @"scheme.base:code_1308"(i64 %t6992, i64 1, i64 %t6997, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6998
}

define fastcc i64 @"scheme.base:code:read-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7003 = icmp eq i64 %argc, 2
  br i1 %t7003, label %argok1627, label %arityerr1626
arityerr1626:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1627:
  %t7004 = call i64 @rt_intern(ptr @.str.sym.60)
  %t7005 = load i64, ptr @"scheme.base:%check-input-port"
  %t7006 = and i64 %t7005, -8
  %t7007 = inttoptr i64 %t7006 to ptr
  %t7008 = load i64, ptr %t7007
  %t7009 = inttoptr i64 %t7008 to ptr
  %t7010 = call fastcc i64%t7009(i64 %t7005, i64 2, i64 %a1, i64 %t7004, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7011 = load i64, ptr @"scheme.base:%port-at-eof?"
  %t7012 = and i64 %t7011, -8
  %t7013 = inttoptr i64 %t7012 to ptr
  %t7014 = load i64, ptr %t7013
  %t7015 = inttoptr i64 %t7014 to ptr
  %t7016 = call fastcc i64%t7015(i64 %t7011, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7017 = icmp ne i64 %t7016, 1
  br i1 %t7017, label %then1628, label %else1629
then1628:
  %t7018 = call i64 @rt_eof_object()
  ret i64 %t7018
else1629:
  %t7019 = load i64, ptr @"emit.internal:%port-buf"
  %t7020 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t7019, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7021 = call i64 @rt_string_length(i64 %t7020)
  %t7022 = call i64 @rt_record_ref(i64 %a1, i64 24)
  %t7023 = or i64 %t7022, %a0
  %t7024 = and i64 %t7023, 7
  %t7025 = icmp eq i64 %t7024, 0
  br i1 %t7025, label %fixfast1630, label %fixslow1631
fixfast1630:
  %t7026 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t7022, i64 %a0)
  %t7027 = extractvalue {i64, i1} %t7026, 0
  %t7028 = extractvalue {i64, i1} %t7026, 1
  br i1 %t7028, label %fixslow1631, label %fixmerge1632
fixslow1631:
  %t7029 = call i64 @rt_add(i64 %t7022, i64 %a0)
  br label %fixmerge1632
fixmerge1632:
  %t7030 = phi i64 [ %t7027, %fixfast1630 ], [ %t7029, %fixslow1631 ]
  %t7031 = or i64 %t7021, %t7030
  %t7032 = and i64 %t7031, 7
  %t7033 = icmp eq i64 %t7032, 0
  br i1 %t7033, label %fixfast1633, label %fixslow1634
fixfast1633:
  %t7034 = icmp slt i64 %t7021, %t7030
  %t7035 = select i1 %t7034, i64 257, i64 1
  br label %fixmerge1635
fixslow1634:
  %t7036 = call i64 @rt_lt(i64 %t7021, i64 %t7030)
  br label %fixmerge1635
fixmerge1635:
  %t7037 = phi i64 [ %t7035, %fixfast1633 ], [ %t7036, %fixslow1634 ]
  %t7038 = icmp ne i64 %t7037, 1
  br i1 %t7038, label %then1636, label %else1637
then1636:
  br label %merge1638
else1637:
  %t7039 = or i64 %t7022, %a0
  %t7040 = and i64 %t7039, 7
  %t7041 = icmp eq i64 %t7040, 0
  br i1 %t7041, label %fixfast1639, label %fixslow1640
fixfast1639:
  %t7042 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t7022, i64 %a0)
  %t7043 = extractvalue {i64, i1} %t7042, 0
  %t7044 = extractvalue {i64, i1} %t7042, 1
  br i1 %t7044, label %fixslow1640, label %fixmerge1641
fixslow1640:
  %t7045 = call i64 @rt_add(i64 %t7022, i64 %a0)
  br label %fixmerge1641
fixmerge1641:
  %t7046 = phi i64 [ %t7043, %fixfast1639 ], [ %t7045, %fixslow1640 ]
  br label %merge1638
merge1638:
  %t7047 = phi i64 [ %t7021, %then1636 ], [ %t7046, %fixmerge1641 ]
  %t7048 = call i64 @rt_record_set(i64 %a1, i64 24, i64 %t7047)
  %t7049 = call i64 @rt_substring(i64 %t7020, i64 %t7022, i64 %t7047)
  ret i64 %t7049
}

define fastcc i64 @"scheme.base:code:open-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7054 = icmp eq i64 %argc, 0
  br i1 %t7054, label %argok1643, label %arityerr1642
arityerr1642:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1643:
  %t7055 = call i64 @rt_port_open_output_string()
  %t7056 = icmp ne i64 %t7055, 1
  br i1 %t7056, label %then1644, label %else1645
then1644:
  %t7057 = load i64, ptr @"emit.internal:%make-port"
  %t7058 = musttail call fastcc i64 @"emit.internal:code:%make-port"(i64 %t7057, i64 6, i64 %t7055, i64 1, i64 1, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t7058
else1645:
  %t7059 = call i64 @rt_intern(ptr @.str.sym.61)
  %t7060 = call i64 @rt_make_string(ptr @.str.lit.62, i64 33)
  %t7061 = load i64, ptr @"scheme.base:error"
  %t7062 = and i64 %t7061, -8
  %t7063 = inttoptr i64 %t7062 to ptr
  %t7064 = load i64, ptr %t7063
  %t7065 = inttoptr i64 %t7064 to ptr
  %t7066 = musttail call fastcc i64 %t7065(i64 %t7061, i64 2, i64 %t7059, i64 %t7060, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7066
}

define fastcc i64 @"scheme.base:code:get-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7071 = icmp eq i64 %argc, 1
  br i1 %t7071, label %argok1647, label %arityerr1646
arityerr1646:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1647:
  %t7072 = load i64, ptr @"scheme.base:output-port?"
  %t7073 = and i64 %t7072, -8
  %t7074 = inttoptr i64 %t7073 to ptr
  %t7075 = load i64, ptr %t7074
  %t7076 = inttoptr i64 %t7075 to ptr
  %t7077 = call fastcc i64%t7076(i64 %t7072, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7078 = call i64 @rt_not(i64 %t7077)
  %t7079 = icmp ne i64 %t7078, 1
  br i1 %t7079, label %then1648, label %else1649
then1648:
  %t7080 = call i64 @rt_intern(ptr @.str.sym.63)
  %t7081 = call i64 @rt_make_string(ptr @.str.lit.64, i64 18)
  %t7082 = load i64, ptr @"scheme.base:error"
  %t7083 = and i64 %t7082, -8
  %t7084 = inttoptr i64 %t7083 to ptr
  %t7085 = load i64, ptr %t7084
  %t7086 = inttoptr i64 %t7085 to ptr
  %t7087 = musttail call fastcc i64 %t7086(i64 %t7082, i64 3, i64 %t7080, i64 %t7081, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7087
else1649:
  %t7088 = call i64 @rt_record_ref(i64 %a0, i64 32)
  %t7089 = call i64 @rt_not(i64 %t7088)
  %t7090 = icmp ne i64 %t7089, 1
  br i1 %t7090, label %then1650, label %else1651
then1650:
  %t7091 = call i64 @rt_intern(ptr @.str.sym.63)
  %t7092 = call i64 @rt_make_string(ptr @.str.lit.65, i64 17)
  %t7093 = load i64, ptr @"scheme.base:error"
  %t7094 = and i64 %t7093, -8
  %t7095 = inttoptr i64 %t7094 to ptr
  %t7096 = load i64, ptr %t7095
  %t7097 = inttoptr i64 %t7096 to ptr
  %t7098 = musttail call fastcc i64 %t7097(i64 %t7093, i64 3, i64 %t7091, i64 %t7092, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7098
else1651:
  %t7099 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t7100 = call i64 @rt_port_get_output_string(i64 %t7099)
  ret i64 %t7100
}

define fastcc i64 @"scheme.base:code:flush-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7105 = icmp eq i64 %argc, 1
  br i1 %t7105, label %argok1653, label %arityerr1652
arityerr1652:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1653:
  %t7106 = call i64 @rt_intern(ptr @.str.sym.66)
  %t7107 = load i64, ptr @"scheme.base:%check-output-port"
  %t7108 = and i64 %t7107, -8
  %t7109 = inttoptr i64 %t7108 to ptr
  %t7110 = load i64, ptr %t7109
  %t7111 = inttoptr i64 %t7110 to ptr
  %t7112 = call fastcc i64%t7111(i64 %t7107, i64 2, i64 %a0, i64 %t7106, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7113 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t7114 = call i64 @rt_port_flush(i64 %t7113)
  ret i64 %t7114
}

define fastcc i64 @"scheme.base:code:close-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7119 = icmp eq i64 %argc, 1
  br i1 %t7119, label %argok1655, label %arityerr1654
arityerr1654:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1655:
  %t7120 = load i64, ptr @"scheme.base:port?"
  %t7121 = and i64 %t7120, -8
  %t7122 = inttoptr i64 %t7121 to ptr
  %t7123 = load i64, ptr %t7122
  %t7124 = inttoptr i64 %t7123 to ptr
  %t7125 = call fastcc i64%t7124(i64 %t7120, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7126 = call i64 @rt_not(i64 %t7125)
  %t7127 = icmp ne i64 %t7126, 1
  br i1 %t7127, label %then1656, label %else1657
then1656:
  %t7128 = call i64 @rt_intern(ptr @.str.sym.67)
  %t7129 = call i64 @rt_make_string(ptr @.str.lit.68, i64 10)
  %t7130 = load i64, ptr @"scheme.base:error"
  %t7131 = and i64 %t7130, -8
  %t7132 = inttoptr i64 %t7131 to ptr
  %t7133 = load i64, ptr %t7132
  %t7134 = inttoptr i64 %t7133 to ptr
  %t7135 = musttail call fastcc i64 %t7134(i64 %t7130, i64 3, i64 %t7128, i64 %t7129, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7135
else1657:
  %t7136 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t7137 = icmp ne i64 %t7136, 1
  br i1 %t7137, label %then1658, label %else1659
then1658:
  %t7138 = icmp ne i64 1, 1
  br i1 %t7138, label %then1660, label %else1661
then1660:
  ret i64 1
else1661:
  ret i64 17
else1659:
  %t7139 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t7140 = call i64 @rt_not(i64 %t7139)
  %t7141 = icmp ne i64 %t7140, 1
  br i1 %t7141, label %then1662, label %else1663
then1662:
  %t7142 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t7143 = call i64 @rt_port_close(i64 %t7142)
  br label %merge1664
else1663:
  br label %merge1664
merge1664:
  %t7144 = phi i64 [ %t7143, %then1662 ], [ 17, %else1663 ]
  %t7145 = call i64 @rt_record_set(i64 %a0, i64 40, i64 257)
  %t7146 = icmp ne i64 1, 1
  br i1 %t7146, label %then1665, label %else1666
then1665:
  ret i64 1
else1666:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:close-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7151 = icmp eq i64 %argc, 1
  br i1 %t7151, label %argok1668, label %arityerr1667
arityerr1667:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1668:
  %t7152 = load i64, ptr @"scheme.base:input-port?"
  %t7153 = and i64 %t7152, -8
  %t7154 = inttoptr i64 %t7153 to ptr
  %t7155 = load i64, ptr %t7154
  %t7156 = inttoptr i64 %t7155 to ptr
  %t7157 = call fastcc i64%t7156(i64 %t7152, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7158 = icmp ne i64 %t7157, 1
  br i1 %t7158, label %then1669, label %else1670
then1669:
  %t7159 = load i64, ptr @"scheme.base:close-port"
  %t7160 = and i64 %t7159, -8
  %t7161 = inttoptr i64 %t7160 to ptr
  %t7162 = load i64, ptr %t7161
  %t7163 = inttoptr i64 %t7162 to ptr
  %t7164 = musttail call fastcc i64 %t7163(i64 %t7159, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7164
else1670:
  %t7165 = call i64 @rt_intern(ptr @.str.sym.69)
  %t7166 = call i64 @rt_make_string(ptr @.str.lit.70, i64 17)
  %t7167 = load i64, ptr @"scheme.base:error"
  %t7168 = and i64 %t7167, -8
  %t7169 = inttoptr i64 %t7168 to ptr
  %t7170 = load i64, ptr %t7169
  %t7171 = inttoptr i64 %t7170 to ptr
  %t7172 = musttail call fastcc i64 %t7171(i64 %t7167, i64 3, i64 %t7165, i64 %t7166, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7172
}

define fastcc i64 @"scheme.base:code:close-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7177 = icmp eq i64 %argc, 1
  br i1 %t7177, label %argok1672, label %arityerr1671
arityerr1671:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1672:
  %t7178 = load i64, ptr @"scheme.base:output-port?"
  %t7179 = and i64 %t7178, -8
  %t7180 = inttoptr i64 %t7179 to ptr
  %t7181 = load i64, ptr %t7180
  %t7182 = inttoptr i64 %t7181 to ptr
  %t7183 = call fastcc i64%t7182(i64 %t7178, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7184 = icmp ne i64 %t7183, 1
  br i1 %t7184, label %then1673, label %else1674
then1673:
  %t7185 = load i64, ptr @"scheme.base:close-port"
  %t7186 = and i64 %t7185, -8
  %t7187 = inttoptr i64 %t7186 to ptr
  %t7188 = load i64, ptr %t7187
  %t7189 = inttoptr i64 %t7188 to ptr
  %t7190 = musttail call fastcc i64 %t7189(i64 %t7185, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7190
else1674:
  %t7191 = call i64 @rt_intern(ptr @.str.sym.71)
  %t7192 = call i64 @rt_make_string(ptr @.str.lit.72, i64 18)
  %t7193 = load i64, ptr @"scheme.base:error"
  %t7194 = and i64 %t7193, -8
  %t7195 = inttoptr i64 %t7194 to ptr
  %t7196 = load i64, ptr %t7195
  %t7197 = inttoptr i64 %t7196 to ptr
  %t7198 = musttail call fastcc i64 %t7197(i64 %t7193, i64 3, i64 %t7191, i64 %t7192, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7198
}

define fastcc i64 @"scheme.base:code:current-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7206 = icmp sge i64 %argc, 0
  br i1 %t7206, label %argok1676, label %arityerr1675
arityerr1675:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1676:
  %t7207 = call ptr @rt_alloc_words(i64 8)
  %t7208 = getelementptr i64, ptr %t7207, i64 0
  store i64 %a0, ptr %t7208
  %t7209 = getelementptr i64, ptr %t7207, i64 1
  store i64 %a1, ptr %t7209
  %t7210 = getelementptr i64, ptr %t7207, i64 2
  store i64 %a2, ptr %t7210
  %t7211 = getelementptr i64, ptr %t7207, i64 3
  store i64 %a3, ptr %t7211
  %t7212 = getelementptr i64, ptr %t7207, i64 4
  store i64 %a4, ptr %t7212
  %t7213 = getelementptr i64, ptr %t7207, i64 5
  store i64 %a5, ptr %t7213
  %t7214 = getelementptr i64, ptr %t7207, i64 6
  store i64 %a6, ptr %t7214
  %t7215 = getelementptr i64, ptr %t7207, i64 7
  store i64 %a7, ptr %t7215
  %t7216 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t7207, ptr %overflow)
  %t7217 = call i64 @rt_null_p(i64 %t7216)
  %t7218 = icmp ne i64 %t7217, 1
  br i1 %t7218, label %then1677, label %else1678
then1677:
  %t7219 = load i64, ptr @"scheme.base:%stdout-port"
  %t7220 = call i64 @rt_not(i64 %t7219)
  %t7221 = icmp ne i64 %t7220, 1
  br i1 %t7221, label %then1679, label %else1680
then1679:
  %t7222 = load i64, ptr @"emit.internal:%make-port"
  %t7223 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t7222, i64 6, i64 0, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t7224 = call i64 @rt_root(i64 %t7223)
  store i64 %t7224, ptr @"scheme.base:%stdout-port"
  %t7225 = call i64 @rt_set_current_output(i64 0)
  br label %merge1681
else1680:
  br label %merge1681
merge1681:
  %t7226 = phi i64 [ %t7225, %then1679 ], [ 17, %else1680 ]
  %t7227 = load i64, ptr @"scheme.base:%stdout-port"
  ret i64 %t7227
else1678:
  %t7228 = call i64 @rt_car(i64 %t7216)
  %t7229 = call i64 @rt_root(i64 %t7228)
  store i64 %t7229, ptr @"scheme.base:%stdout-port"
  %t7230 = call i64 @rt_record_ref(i64 %t7228, i64 0)
  %t7231 = call i64 @rt_set_current_output(i64 %t7230)
  %t7232 = icmp ne i64 1, 1
  br i1 %t7232, label %then1682, label %else1683
then1682:
  ret i64 1
else1683:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-error-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7237 = icmp sge i64 %argc, 0
  br i1 %t7237, label %argok1685, label %arityerr1684
arityerr1684:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1685:
  %t7238 = call ptr @rt_alloc_words(i64 8)
  %t7239 = getelementptr i64, ptr %t7238, i64 0
  store i64 %a0, ptr %t7239
  %t7240 = getelementptr i64, ptr %t7238, i64 1
  store i64 %a1, ptr %t7240
  %t7241 = getelementptr i64, ptr %t7238, i64 2
  store i64 %a2, ptr %t7241
  %t7242 = getelementptr i64, ptr %t7238, i64 3
  store i64 %a3, ptr %t7242
  %t7243 = getelementptr i64, ptr %t7238, i64 4
  store i64 %a4, ptr %t7243
  %t7244 = getelementptr i64, ptr %t7238, i64 5
  store i64 %a5, ptr %t7244
  %t7245 = getelementptr i64, ptr %t7238, i64 6
  store i64 %a6, ptr %t7245
  %t7246 = getelementptr i64, ptr %t7238, i64 7
  store i64 %a7, ptr %t7246
  %t7247 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t7238, ptr %overflow)
  %t7248 = call i64 @rt_null_p(i64 %t7247)
  %t7249 = icmp ne i64 %t7248, 1
  br i1 %t7249, label %then1686, label %else1687
then1686:
  %t7250 = load i64, ptr @"scheme.base:%stderr-port"
  %t7251 = call i64 @rt_not(i64 %t7250)
  %t7252 = icmp ne i64 %t7251, 1
  br i1 %t7252, label %then1688, label %else1689
then1688:
  %t7253 = load i64, ptr @"emit.internal:%make-port"
  %t7254 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t7253, i64 6, i64 8, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t7255 = call i64 @rt_root(i64 %t7254)
  store i64 %t7255, ptr @"scheme.base:%stderr-port"
  br label %merge1690
else1689:
  br label %merge1690
merge1690:
  %t7256 = phi i64 [ 17, %then1688 ], [ 17, %else1689 ]
  %t7257 = load i64, ptr @"scheme.base:%stderr-port"
  ret i64 %t7257
else1687:
  %t7258 = call i64 @rt_car(i64 %t7247)
  %t7259 = call i64 @rt_root(i64 %t7258)
  store i64 %t7259, ptr @"scheme.base:%stderr-port"
  %t7260 = icmp ne i64 1, 1
  br i1 %t7260, label %then1691, label %else1692
then1691:
  ret i64 1
else1692:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7265 = icmp sge i64 %argc, 0
  br i1 %t7265, label %argok1694, label %arityerr1693
arityerr1693:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1694:
  %t7266 = call ptr @rt_alloc_words(i64 8)
  %t7267 = getelementptr i64, ptr %t7266, i64 0
  store i64 %a0, ptr %t7267
  %t7268 = getelementptr i64, ptr %t7266, i64 1
  store i64 %a1, ptr %t7268
  %t7269 = getelementptr i64, ptr %t7266, i64 2
  store i64 %a2, ptr %t7269
  %t7270 = getelementptr i64, ptr %t7266, i64 3
  store i64 %a3, ptr %t7270
  %t7271 = getelementptr i64, ptr %t7266, i64 4
  store i64 %a4, ptr %t7271
  %t7272 = getelementptr i64, ptr %t7266, i64 5
  store i64 %a5, ptr %t7272
  %t7273 = getelementptr i64, ptr %t7266, i64 6
  store i64 %a6, ptr %t7273
  %t7274 = getelementptr i64, ptr %t7266, i64 7
  store i64 %a7, ptr %t7274
  %t7275 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t7266, ptr %overflow)
  %t7276 = call i64 @rt_null_p(i64 %t7275)
  %t7277 = icmp ne i64 %t7276, 1
  br i1 %t7277, label %then1695, label %else1696
then1695:
  %t7278 = load i64, ptr @"scheme.base:%stdin-port"
  %t7279 = call i64 @rt_not(i64 %t7278)
  %t7280 = icmp ne i64 %t7279, 1
  br i1 %t7280, label %then1697, label %else1698
then1697:
  %t7281 = load i64, ptr @"emit.internal:%make-port"
  %t7282 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t7281, i64 6, i64 1, i64 257, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t7283 = call i64 @rt_root(i64 %t7282)
  store i64 %t7283, ptr @"scheme.base:%stdin-port"
  br label %merge1699
else1698:
  br label %merge1699
merge1699:
  %t7284 = phi i64 [ 17, %then1697 ], [ 17, %else1698 ]
  %t7285 = load i64, ptr @"scheme.base:%stdin-port"
  ret i64 %t7285
else1696:
  %t7286 = call i64 @rt_car(i64 %t7275)
  %t7287 = call i64 @rt_root(i64 %t7286)
  store i64 %t7287, ptr @"scheme.base:%stdin-port"
  %t7288 = icmp ne i64 1, 1
  br i1 %t7288, label %then1700, label %else1701
then1700:
  ret i64 1
else1701:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_1343"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7293 = icmp eq i64 %argc, 0
  br i1 %t7293, label %argok1703, label %arityerr1702
arityerr1702:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1703:
  %t7294 = icmp ne i64 1, 1
  br i1 %t7294, label %then1704, label %else1705
then1704:
  ret i64 1
else1705:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_1345"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7295 = icmp eq i64 %argc, 0
  br i1 %t7295, label %argok1707, label %arityerr1706
arityerr1706:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1707:
  %t7296 = and i64 %self, -8
  %t7297 = inttoptr i64 %t7296 to ptr
  %t7298 = getelementptr i64, ptr %t7297, i64 2
  %t7299 = load i64, ptr %t7298
  %t7300 = and i64 %self, -8
  %t7301 = inttoptr i64 %t7300 to ptr
  %t7302 = getelementptr i64, ptr %t7301, i64 1
  %t7303 = load i64, ptr %t7302
  %t7304 = and i64 %t7303, -8
  %t7305 = inttoptr i64 %t7304 to ptr
  %t7306 = load i64, ptr %t7305
  %t7307 = inttoptr i64 %t7306 to ptr
  %t7308 = musttail call fastcc i64 %t7307(i64 %t7303, i64 1, i64 %t7299, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7308
}

define fastcc i64 @"scheme.base:code_1347"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7309 = icmp eq i64 %argc, 0
  br i1 %t7309, label %argok1709, label %arityerr1708
arityerr1708:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1709:
  %t7310 = and i64 %self, -8
  %t7311 = inttoptr i64 %t7310 to ptr
  %t7312 = getelementptr i64, ptr %t7311, i64 1
  %t7313 = load i64, ptr %t7312
  %t7314 = load i64, ptr @"scheme.base:close-port"
  %t7315 = and i64 %t7314, -8
  %t7316 = inttoptr i64 %t7315 to ptr
  %t7317 = load i64, ptr %t7316
  %t7318 = inttoptr i64 %t7317 to ptr
  %t7319 = musttail call fastcc i64 %t7318(i64 %t7314, i64 1, i64 %t7313, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7319
}

define fastcc i64 @"scheme.base:code:call-with-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7320 = icmp eq i64 %argc, 2
  br i1 %t7320, label %argok1711, label %arityerr1710
arityerr1710:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1711:
  %t7321 = call ptr @rt_alloc_words(i64 1)
  %t7322 = ptrtoint ptr %t7321 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1343" to i64), ptr %t7321
  %t7323 = or i64 %t7322, 4
  %t7324 = call ptr @rt_alloc_words(i64 3)
  %t7325 = ptrtoint ptr %t7324 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1345" to i64), ptr %t7324
  %t7326 = getelementptr i64, ptr %t7324, i64 1
  store i64 %a1, ptr %t7326
  %t7327 = getelementptr i64, ptr %t7324, i64 2
  store i64 %a0, ptr %t7327
  %t7328 = or i64 %t7325, 4
  %t7329 = call ptr @rt_alloc_words(i64 2)
  %t7330 = ptrtoint ptr %t7329 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1347" to i64), ptr %t7329
  %t7331 = getelementptr i64, ptr %t7329, i64 1
  store i64 %a0, ptr %t7331
  %t7332 = or i64 %t7330, 4
  %t7333 = load i64, ptr @"scheme.base:dynamic-wind"
  %t7334 = and i64 %t7333, -8
  %t7335 = inttoptr i64 %t7334 to ptr
  %t7336 = load i64, ptr %t7335
  %t7337 = inttoptr i64 %t7336 to ptr
  %t7338 = musttail call fastcc i64 %t7337(i64 %t7333, i64 3, i64 %t7323, i64 %t7328, i64 %t7332, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7338
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
  %t787 = call ptr @rt_alloc_words(i64 1)
  %t788 = ptrtoint ptr %t787 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-head" to i64), ptr %t787
  %t789 = or i64 %t788, 4
  %t790 = call i64 @rt_root(i64 %t789)
  store i64 %t790, ptr @"scheme.base:list-head"
  ret i64 17
}

define i64 @"scheme.base:__init_34"() {
entry:
  %t814 = call ptr @rt_alloc_words(i64 1)
  %t815 = ptrtoint ptr %t814 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-list" to i64), ptr %t814
  %t816 = or i64 %t815, 4
  %t817 = call i64 @rt_root(i64 %t816)
  store i64 %t817, ptr @"scheme.base:make-list"
  ret i64 17
}

define i64 @"scheme.base:__init_35"() {
entry:
  %t854 = call ptr @rt_alloc_words(i64 1)
  %t855 = ptrtoint ptr %t854 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:iota" to i64), ptr %t854
  %t856 = or i64 %t855, 4
  %t857 = call i64 @rt_root(i64 %t856)
  store i64 %t857, ptr @"scheme.base:iota"
  ret i64 17
}

define i64 @"scheme.base:__init_36"() {
entry:
  %t880 = call ptr @rt_alloc_words(i64 1)
  %t881 = ptrtoint ptr %t880 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%minmax-fold" to i64), ptr %t880
  %t882 = or i64 %t881, 4
  %t883 = call i64 @rt_root(i64 %t882)
  store i64 %t883, ptr @"scheme.base:%minmax-fold"
  ret i64 17
}

define i64 @"scheme.base:__init_37"() {
entry:
  %t892 = call ptr @rt_alloc_words(i64 1)
  %t893 = ptrtoint ptr %t892 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%minmax" to i64), ptr %t892
  %t894 = or i64 %t893, 4
  %t895 = call i64 @rt_root(i64 %t894)
  store i64 %t895, ptr @"scheme.base:%minmax"
  ret i64 17
}

define i64 @"scheme.base:__init_38"() {
entry:
  %t925 = call ptr @rt_alloc_words(i64 1)
  %t926 = ptrtoint ptr %t925 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:max" to i64), ptr %t925
  %t927 = or i64 %t926, 4
  %t928 = call i64 @rt_root(i64 %t927)
  store i64 %t928, ptr @"scheme.base:max"
  ret i64 17
}

define i64 @"scheme.base:__init_39"() {
entry:
  %t958 = call ptr @rt_alloc_words(i64 1)
  %t959 = ptrtoint ptr %t958 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:min" to i64), ptr %t958
  %t960 = or i64 %t959, 4
  %t961 = call i64 @rt_root(i64 %t960)
  store i64 %t961, ptr @"scheme.base:min"
  ret i64 17
}

define i64 @"scheme.base:__init_40"() {
entry:
  %t964 = call ptr @rt_alloc_words(i64 1)
  %t965 = ptrtoint ptr %t964 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:complex?" to i64), ptr %t964
  %t966 = or i64 %t965, 4
  %t967 = call i64 @rt_root(i64 %t966)
  store i64 %t967, ptr @"scheme.base:complex?"
  ret i64 17
}

define i64 @"scheme.base:__init_41"() {
entry:
  %t972 = call ptr @rt_alloc_words(i64 1)
  %t973 = ptrtoint ptr %t972 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:exact-integer?" to i64), ptr %t972
  %t974 = or i64 %t973, 4
  %t975 = call i64 @rt_root(i64 %t974)
  store i64 %t975, ptr @"scheme.base:exact-integer?"
  ret i64 17
}

define i64 @"scheme.base:__init_42"() {
entry:
  %t980 = call ptr @rt_alloc_words(i64 1)
  %t981 = ptrtoint ptr %t980 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rational?" to i64), ptr %t980
  %t982 = or i64 %t981, 4
  %t983 = call i64 @rt_root(i64 %t982)
  store i64 %t983, ptr @"scheme.base:rational?"
  ret i64 17
}

define i64 @"scheme.base:__init_43"() {
entry:
  %t992 = call ptr @rt_alloc_words(i64 1)
  %t993 = ptrtoint ptr %t992 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:positive?" to i64), ptr %t992
  %t994 = or i64 %t993, 4
  %t995 = call i64 @rt_root(i64 %t994)
  store i64 %t995, ptr @"scheme.base:positive?"
  ret i64 17
}

define i64 @"scheme.base:__init_44"() {
entry:
  %t1004 = call ptr @rt_alloc_words(i64 1)
  %t1005 = ptrtoint ptr %t1004 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:negative?" to i64), ptr %t1004
  %t1006 = or i64 %t1005, 4
  %t1007 = call i64 @rt_root(i64 %t1006)
  store i64 %t1007, ptr @"scheme.base:negative?"
  ret i64 17
}

define i64 @"scheme.base:__init_45"() {
entry:
  %t1017 = call ptr @rt_alloc_words(i64 1)
  %t1018 = ptrtoint ptr %t1017 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:even?" to i64), ptr %t1017
  %t1019 = or i64 %t1018, 4
  %t1020 = call i64 @rt_root(i64 %t1019)
  store i64 %t1020, ptr @"scheme.base:even?"
  ret i64 17
}

define i64 @"scheme.base:__init_46"() {
entry:
  %t1031 = call ptr @rt_alloc_words(i64 1)
  %t1032 = ptrtoint ptr %t1031 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:odd?" to i64), ptr %t1031
  %t1033 = or i64 %t1032, 4
  %t1034 = call i64 @rt_root(i64 %t1033)
  store i64 %t1034, ptr @"scheme.base:odd?"
  ret i64 17
}

define i64 @"scheme.base:__init_47"() {
entry:
  %t1052 = call ptr @rt_alloc_words(i64 1)
  %t1053 = ptrtoint ptr %t1052 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:abs" to i64), ptr %t1052
  %t1054 = or i64 %t1053, 4
  %t1055 = call i64 @rt_root(i64 %t1054)
  store i64 %t1055, ptr @"scheme.base:abs"
  ret i64 17
}

define i64 @"scheme.base:__init_48"() {
entry:
  %t1066 = call ptr @rt_alloc_words(i64 1)
  %t1067 = ptrtoint ptr %t1066 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:square" to i64), ptr %t1066
  %t1068 = or i64 %t1067, 4
  %t1069 = call i64 @rt_root(i64 %t1068)
  store i64 %t1069, ptr @"scheme.base:square"
  ret i64 17
}

define i64 @"scheme.base:__init_49"() {
entry:
  %t1086 = call ptr @rt_alloc_words(i64 1)
  %t1087 = ptrtoint ptr %t1086 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%gcd2" to i64), ptr %t1086
  %t1088 = or i64 %t1087, 4
  %t1089 = call i64 @rt_root(i64 %t1088)
  store i64 %t1089, ptr @"scheme.base:%gcd2"
  ret i64 17
}

define i64 @"scheme.base:__init_50"() {
entry:
  %t1119 = call ptr @rt_alloc_words(i64 1)
  %t1120 = ptrtoint ptr %t1119 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%gcd-fold" to i64), ptr %t1119
  %t1121 = or i64 %t1120, 4
  %t1122 = call i64 @rt_root(i64 %t1121)
  store i64 %t1122, ptr @"scheme.base:%gcd-fold"
  ret i64 17
}

define i64 @"scheme.base:__init_51"() {
entry:
  %t1164 = call ptr @rt_alloc_words(i64 1)
  %t1165 = ptrtoint ptr %t1164 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%lcm-fold" to i64), ptr %t1164
  %t1166 = or i64 %t1165, 4
  %t1167 = call i64 @rt_root(i64 %t1166)
  store i64 %t1167, ptr @"scheme.base:%lcm-fold"
  ret i64 17
}

define i64 @"scheme.base:__init_52"() {
entry:
  %t1185 = call ptr @rt_alloc_words(i64 1)
  %t1186 = ptrtoint ptr %t1185 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:gcd" to i64), ptr %t1185
  %t1187 = or i64 %t1186, 4
  %t1188 = call i64 @rt_root(i64 %t1187)
  store i64 %t1188, ptr @"scheme.base:gcd"
  ret i64 17
}

define i64 @"scheme.base:__init_53"() {
entry:
  %t1206 = call ptr @rt_alloc_words(i64 1)
  %t1207 = ptrtoint ptr %t1206 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:lcm" to i64), ptr %t1206
  %t1208 = or i64 %t1207, 4
  %t1209 = call i64 @rt_root(i64 %t1208)
  store i64 %t1209, ptr @"scheme.base:lcm"
  ret i64 17
}

define i64 @"scheme.base:__init_54"() {
entry:
  %t1252 = call ptr @rt_alloc_words(i64 1)
  %t1253 = ptrtoint ptr %t1252 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%expt-exact" to i64), ptr %t1252
  %t1254 = or i64 %t1253, 4
  %t1255 = call i64 @rt_root(i64 %t1254)
  store i64 %t1255, ptr @"scheme.base:%expt-exact"
  ret i64 17
}

define i64 @"scheme.base:__init_55"() {
entry:
  %t1284 = call ptr @rt_alloc_words(i64 1)
  %t1285 = ptrtoint ptr %t1284 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:expt" to i64), ptr %t1284
  %t1286 = or i64 %t1285, 4
  %t1287 = call i64 @rt_root(i64 %t1286)
  store i64 %t1287, ptr @"scheme.base:expt"
  ret i64 17
}

define i64 @"scheme.base:__init_56"() {
entry:
  %t1313 = call ptr @rt_alloc_words(i64 1)
  %t1314 = ptrtoint ptr %t1313 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%isqrt-loop" to i64), ptr %t1313
  %t1315 = or i64 %t1314, 4
  %t1316 = call i64 @rt_root(i64 %t1315)
  store i64 %t1316, ptr @"scheme.base:%isqrt-loop"
  ret i64 17
}

define i64 @"scheme.base:__init_57"() {
entry:
  %t1332 = call ptr @rt_alloc_words(i64 1)
  %t1333 = ptrtoint ptr %t1332 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%isqrt" to i64), ptr %t1332
  %t1334 = or i64 %t1333, 4
  %t1335 = call i64 @rt_root(i64 %t1334)
  store i64 %t1335, ptr @"scheme.base:%isqrt"
  ret i64 17
}

define i64 @"scheme.base:__init_58"() {
entry:
  %t1366 = call ptr @rt_alloc_words(i64 1)
  %t1367 = ptrtoint ptr %t1366 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:exact-integer-sqrt" to i64), ptr %t1366
  %t1368 = or i64 %t1367, 4
  %t1369 = call i64 @rt_root(i64 %t1368)
  store i64 %t1369, ptr @"scheme.base:exact-integer-sqrt"
  ret i64 17
}

define i64 @"scheme.base:__init_59"() {
entry:
  %t1374 = call ptr @rt_alloc_words(i64 1)
  %t1375 = ptrtoint ptr %t1374 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:floor" to i64), ptr %t1374
  %t1376 = or i64 %t1375, 4
  %t1377 = call i64 @rt_root(i64 %t1376)
  store i64 %t1377, ptr @"scheme.base:floor"
  ret i64 17
}

define i64 @"scheme.base:__init_60"() {
entry:
  %t1382 = call ptr @rt_alloc_words(i64 1)
  %t1383 = ptrtoint ptr %t1382 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:ceiling" to i64), ptr %t1382
  %t1384 = or i64 %t1383, 4
  %t1385 = call i64 @rt_root(i64 %t1384)
  store i64 %t1385, ptr @"scheme.base:ceiling"
  ret i64 17
}

define i64 @"scheme.base:__init_61"() {
entry:
  %t1390 = call ptr @rt_alloc_words(i64 1)
  %t1391 = ptrtoint ptr %t1390 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:truncate" to i64), ptr %t1390
  %t1392 = or i64 %t1391, 4
  %t1393 = call i64 @rt_root(i64 %t1392)
  store i64 %t1393, ptr @"scheme.base:truncate"
  ret i64 17
}

define i64 @"scheme.base:__init_62"() {
entry:
  %t1398 = call ptr @rt_alloc_words(i64 1)
  %t1399 = ptrtoint ptr %t1398 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:round" to i64), ptr %t1398
  %t1400 = or i64 %t1399, 4
  %t1401 = call i64 @rt_root(i64 %t1400)
  store i64 %t1401, ptr @"scheme.base:round"
  ret i64 17
}

define i64 @"scheme.base:__init_63"() {
entry:
  %t1404 = call ptr @rt_alloc_words(i64 1)
  %t1405 = ptrtoint ptr %t1404 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:truncate-quotient" to i64), ptr %t1404
  %t1406 = or i64 %t1405, 4
  %t1407 = call i64 @rt_root(i64 %t1406)
  store i64 %t1407, ptr @"scheme.base:truncate-quotient"
  ret i64 17
}

define i64 @"scheme.base:__init_64"() {
entry:
  %t1410 = call ptr @rt_alloc_words(i64 1)
  %t1411 = ptrtoint ptr %t1410 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:truncate-remainder" to i64), ptr %t1410
  %t1412 = or i64 %t1411, 4
  %t1413 = call i64 @rt_root(i64 %t1412)
  store i64 %t1413, ptr @"scheme.base:truncate-remainder"
  ret i64 17
}

define i64 @"scheme.base:__init_65"() {
entry:
  %t1416 = call ptr @rt_alloc_words(i64 1)
  %t1417 = ptrtoint ptr %t1416 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:floor-remainder" to i64), ptr %t1416
  %t1418 = or i64 %t1417, 4
  %t1419 = call i64 @rt_root(i64 %t1418)
  store i64 %t1419, ptr @"scheme.base:floor-remainder"
  ret i64 17
}

define i64 @"scheme.base:__init_66"() {
entry:
  %t1431 = call ptr @rt_alloc_words(i64 1)
  %t1432 = ptrtoint ptr %t1431 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:floor-quotient" to i64), ptr %t1431
  %t1433 = or i64 %t1432, 4
  %t1434 = call i64 @rt_root(i64 %t1433)
  store i64 %t1434, ptr @"scheme.base:floor-quotient"
  ret i64 17
}

define i64 @"scheme.base:__init_67"() {
entry:
  %t1444 = call ptr @rt_alloc_words(i64 1)
  %t1445 = ptrtoint ptr %t1444 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:truncate/" to i64), ptr %t1444
  %t1446 = or i64 %t1445, 4
  %t1447 = call i64 @rt_root(i64 %t1446)
  store i64 %t1447, ptr @"scheme.base:truncate/"
  ret i64 17
}

define i64 @"scheme.base:__init_68"() {
entry:
  %t1462 = call ptr @rt_alloc_words(i64 1)
  %t1463 = ptrtoint ptr %t1462 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:floor/" to i64), ptr %t1462
  %t1464 = or i64 %t1463, 4
  %t1465 = call i64 @rt_root(i64 %t1464)
  store i64 %t1465, ptr @"scheme.base:floor/"
  ret i64 17
}

define i64 @"scheme.base:__init_69"() {
entry:
  %t1476 = call ptr @rt_alloc_words(i64 1)
  %t1477 = ptrtoint ptr %t1476 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:numerator" to i64), ptr %t1476
  %t1478 = or i64 %t1477, 4
  %t1479 = call i64 @rt_root(i64 %t1478)
  store i64 %t1479, ptr @"scheme.base:numerator"
  ret i64 17
}

define i64 @"scheme.base:__init_70"() {
entry:
  %t1493 = call ptr @rt_alloc_words(i64 1)
  %t1494 = ptrtoint ptr %t1493 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:denominator" to i64), ptr %t1493
  %t1495 = or i64 %t1494, 4
  %t1496 = call i64 @rt_root(i64 %t1495)
  store i64 %t1496, ptr @"scheme.base:denominator"
  ret i64 17
}

define i64 @"scheme.base:__init_71"() {
entry:
  %t1499 = call ptr @rt_alloc_words(i64 1)
  %t1500 = ptrtoint ptr %t1499 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:inexact" to i64), ptr %t1499
  %t1501 = or i64 %t1500, 4
  %t1502 = call i64 @rt_root(i64 %t1501)
  store i64 %t1502, ptr @"scheme.base:inexact"
  ret i64 17
}

define i64 @"scheme.base:__init_72"() {
entry:
  %t1505 = call ptr @rt_alloc_words(i64 1)
  %t1506 = ptrtoint ptr %t1505 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:exact" to i64), ptr %t1505
  %t1507 = or i64 %t1506, 4
  %t1508 = call i64 @rt_root(i64 %t1507)
  store i64 %t1508, ptr @"scheme.base:exact"
  ret i64 17
}

define i64 @"scheme.base:__init_73"() {
entry:
  %t1511 = call ptr @rt_alloc_words(i64 1)
  %t1512 = ptrtoint ptr %t1511 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:void" to i64), ptr %t1511
  %t1513 = or i64 %t1512, 4
  %t1514 = call i64 @rt_root(i64 %t1513)
  store i64 %t1514, ptr @"scheme.base:void"
  ret i64 17
}

define i64 @"scheme.base:__init_74"() {
entry:
  %t1527 = call ptr @rt_alloc_words(i64 1)
  %t1528 = ptrtoint ptr %t1527 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string" to i64), ptr %t1527
  %t1529 = or i64 %t1528, 4
  %t1530 = call i64 @rt_root(i64 %t1529)
  store i64 %t1530, ptr @"scheme.base:string"
  ret i64 17
}

define i64 @"scheme.base:__init_75"() {
entry:
  %t1544 = call ptr @rt_alloc_words(i64 1)
  %t1545 = ptrtoint ptr %t1544 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%str-concat" to i64), ptr %t1544
  %t1546 = or i64 %t1545, 4
  %t1547 = call i64 @rt_root(i64 %t1546)
  store i64 %t1547, ptr @"scheme.base:%str-concat"
  ret i64 17
}

define i64 @"scheme.base:__init_76"() {
entry:
  %t1567 = call ptr @rt_alloc_words(i64 1)
  %t1568 = ptrtoint ptr %t1567 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:chr-cmp" to i64), ptr %t1567
  %t1569 = or i64 %t1568, 4
  %t1570 = call i64 @rt_root(i64 %t1569)
  store i64 %t1570, ptr @"scheme.base:chr-cmp"
  ret i64 17
}

define i64 @"scheme.base:__init_77"() {
entry:
  %t1599 = call ptr @rt_alloc_words(i64 1)
  %t1600 = ptrtoint ptr %t1599 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char=?" to i64), ptr %t1599
  %t1601 = or i64 %t1600, 4
  %t1602 = call i64 @rt_root(i64 %t1601)
  store i64 %t1602, ptr @"scheme.base:char=?"
  ret i64 17
}

define i64 @"scheme.base:__init_78"() {
entry:
  %t1631 = call ptr @rt_alloc_words(i64 1)
  %t1632 = ptrtoint ptr %t1631 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char<?" to i64), ptr %t1631
  %t1633 = or i64 %t1632, 4
  %t1634 = call i64 @rt_root(i64 %t1633)
  store i64 %t1634, ptr @"scheme.base:char<?"
  ret i64 17
}

define i64 @"scheme.base:__init_79"() {
entry:
  %t1663 = call ptr @rt_alloc_words(i64 1)
  %t1664 = ptrtoint ptr %t1663 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char>?" to i64), ptr %t1663
  %t1665 = or i64 %t1664, 4
  %t1666 = call i64 @rt_root(i64 %t1665)
  store i64 %t1666, ptr @"scheme.base:char>?"
  ret i64 17
}

define i64 @"scheme.base:__init_80"() {
entry:
  %t1703 = call ptr @rt_alloc_words(i64 1)
  %t1704 = ptrtoint ptr %t1703 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char<=?" to i64), ptr %t1703
  %t1705 = or i64 %t1704, 4
  %t1706 = call i64 @rt_root(i64 %t1705)
  store i64 %t1706, ptr @"scheme.base:char<=?"
  ret i64 17
}

define i64 @"scheme.base:__init_81"() {
entry:
  %t1743 = call ptr @rt_alloc_words(i64 1)
  %t1744 = ptrtoint ptr %t1743 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char>=?" to i64), ptr %t1743
  %t1745 = or i64 %t1744, 4
  %t1746 = call i64 @rt_root(i64 %t1745)
  store i64 %t1746, ptr @"scheme.base:char>=?"
  ret i64 17
}

define i64 @"scheme.base:__init_82"() {
entry:
  %t1821 = call ptr @rt_alloc_words(i64 1)
  %t1822 = ptrtoint ptr %t1821 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string->list" to i64), ptr %t1821
  %t1823 = or i64 %t1822, 4
  %t1824 = call i64 @rt_root(i64 %t1823)
  store i64 %t1824, ptr @"scheme.base:string->list"
  ret i64 17
}

define i64 @"scheme.base:__init_83"() {
entry:
  %t1832 = call ptr @rt_alloc_words(i64 1)
  %t1833 = ptrtoint ptr %t1832 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:ns-digits" to i64), ptr %t1832
  %t1834 = or i64 %t1833, 4
  %t1835 = call i64 @rt_root(i64 %t1834)
  store i64 %t1835, ptr @"scheme.base:ns-digits"
  ret i64 17
}

define i64 @"scheme.base:__init_84"() {
entry:
  %t1863 = call ptr @rt_alloc_words(i64 1)
  %t1864 = ptrtoint ptr %t1863 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ns-digit-char" to i64), ptr %t1863
  %t1865 = or i64 %t1864, 4
  %t1866 = call i64 @rt_root(i64 %t1865)
  store i64 %t1866, ptr @"scheme.base:%ns-digit-char"
  ret i64 17
}

define i64 @"scheme.base:__init_85"() {
entry:
  %t1900 = call ptr @rt_alloc_words(i64 1)
  %t1901 = ptrtoint ptr %t1900 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:ns-digits-radix" to i64), ptr %t1900
  %t1902 = or i64 %t1901, 4
  %t1903 = call i64 @rt_root(i64 %t1902)
  store i64 %t1903, ptr @"scheme.base:ns-digits-radix"
  ret i64 17
}

define i64 @"scheme.base:__init_86"() {
entry:
  %t1936 = call ptr @rt_alloc_words(i64 1)
  %t1937 = ptrtoint ptr %t1936 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%radix-ok?" to i64), ptr %t1936
  %t1938 = or i64 %t1937, 4
  %t1939 = call i64 @rt_root(i64 %t1938)
  store i64 %t1939, ptr @"scheme.base:%radix-ok?"
  ret i64 17
}

define i64 @"scheme.base:__init_87"() {
entry:
  %t2027 = call ptr @rt_alloc_words(i64 1)
  %t2028 = ptrtoint ptr %t2027 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:number->string" to i64), ptr %t2027
  %t2029 = or i64 %t2028, 4
  %t2030 = call i64 @rt_root(i64 %t2029)
  store i64 %t2030, ptr @"scheme.base:number->string"
  ret i64 17
}

define i64 @"scheme.base:__init_88"() {
entry:
  %t2064 = call ptr @rt_alloc_words(i64 1)
  %t2065 = ptrtoint ptr %t2064 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string->number" to i64), ptr %t2064
  %t2066 = or i64 %t2065, 4
  %t2067 = call i64 @rt_root(i64 %t2066)
  store i64 %t2067, ptr @"scheme.base:string->number"
  ret i64 17
}

define i64 @"scheme.base:__init_89"() {
entry:
  %t2101 = call ptr @rt_alloc_words(i64 1)
  %t2102 = ptrtoint ptr %t2101 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error" to i64), ptr %t2101
  %t2103 = or i64 %t2102, 4
  %t2104 = call i64 @rt_root(i64 %t2103)
  store i64 %t2104, ptr @"scheme.base:error"
  ret i64 17
}

define i64 @"scheme.base:__init_90"() {
entry:
  %t2105 = call i64 @rt_root(i64 2)
  store i64 %t2105, ptr @"scheme.base:*winds*"
  ret i64 17
}

define i64 @"scheme.base:__init_91"() {
entry:
  %t2106 = call i64 @rt_root(i64 2)
  store i64 %t2106, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define i64 @"scheme.base:__init_92"() {
entry:
  %t2131 = call ptr @rt_alloc_words(i64 1)
  %t2132 = ptrtoint ptr %t2131 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%unwind-to" to i64), ptr %t2131
  %t2133 = or i64 %t2132, 4
  %t2134 = call i64 @rt_root(i64 %t2133)
  store i64 %t2134, ptr @"scheme.base:%unwind-to"
  ret i64 17
}

define i64 @"scheme.base:__init_93"() {
entry:
  %t2158 = call ptr @rt_alloc_words(i64 1)
  %t2159 = ptrtoint ptr %t2158 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:dynamic-wind" to i64), ptr %t2158
  %t2160 = or i64 %t2159, 4
  %t2161 = call i64 @rt_root(i64 %t2160)
  store i64 %t2161, ptr @"scheme.base:dynamic-wind"
  ret i64 17
}

define i64 @"scheme.base:__init_94"() {
entry:
  %t2222 = call ptr @rt_alloc_words(i64 1)
  %t2223 = ptrtoint ptr %t2222 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-current-continuation" to i64), ptr %t2222
  %t2224 = or i64 %t2223, 4
  %t2225 = call i64 @rt_root(i64 %t2224)
  store i64 %t2225, ptr @"scheme.base:call-with-current-continuation"
  ret i64 17
}

define i64 @"scheme.base:__init_95"() {
entry:
  %t2233 = call ptr @rt_alloc_words(i64 1)
  %t2234 = ptrtoint ptr %t2233 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call/cc" to i64), ptr %t2233
  %t2235 = or i64 %t2234, 4
  %t2236 = call i64 @rt_root(i64 %t2235)
  store i64 %t2236, ptr @"scheme.base:call/cc"
  ret i64 17
}

define i64 @"scheme.base:__init_96"() {
entry:
  %t2271 = call ptr @rt_alloc_words(i64 1)
  %t2272 = ptrtoint ptr %t2271 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-exception-handler" to i64), ptr %t2271
  %t2273 = or i64 %t2272, 4
  %t2274 = call i64 @rt_root(i64 %t2273)
  store i64 %t2274, ptr @"scheme.base:with-exception-handler"
  ret i64 17
}

define i64 @"scheme.base:__init_97"() {
entry:
  %t2293 = call ptr @rt_alloc_words(i64 1)
  %t2294 = ptrtoint ptr %t2293 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:raise" to i64), ptr %t2293
  %t2295 = or i64 %t2294, 4
  %t2296 = call i64 @rt_root(i64 %t2295)
  store i64 %t2296, ptr @"scheme.base:raise"
  ret i64 17
}

define i64 @"scheme.base:__init_98"() {
entry:
  %t2299 = call ptr @rt_alloc_words(i64 1)
  %t2300 = ptrtoint ptr %t2299 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object?" to i64), ptr %t2299
  %t2301 = or i64 %t2300, 4
  %t2302 = call i64 @rt_root(i64 %t2301)
  store i64 %t2302, ptr @"scheme.base:error-object?"
  ret i64 17
}

define i64 @"scheme.base:__init_99"() {
entry:
  %t2305 = call ptr @rt_alloc_words(i64 1)
  %t2306 = ptrtoint ptr %t2305 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-message" to i64), ptr %t2305
  %t2307 = or i64 %t2306, 4
  %t2308 = call i64 @rt_root(i64 %t2307)
  store i64 %t2308, ptr @"scheme.base:error-object-message"
  ret i64 17
}

define i64 @"scheme.base:__init_100"() {
entry:
  %t2311 = call ptr @rt_alloc_words(i64 1)
  %t2312 = ptrtoint ptr %t2311 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-irritants" to i64), ptr %t2311
  %t2313 = or i64 %t2312, 4
  %t2314 = call i64 @rt_root(i64 %t2313)
  store i64 %t2314, ptr @"scheme.base:error-object-irritants"
  ret i64 17
}

define i64 @"scheme.base:__init_101"() {
entry:
  %t2396 = call ptr @rt_alloc_words(i64 1)
  %t2397 = ptrtoint ptr %t2396 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-parameter" to i64), ptr %t2396
  %t2398 = or i64 %t2397, 4
  %t2399 = call i64 @rt_root(i64 %t2398)
  store i64 %t2399, ptr @"scheme.base:make-parameter"
  ret i64 17
}

define i64 @"scheme.base:__init_102"() {
entry:
  %t2480 = call ptr @rt_alloc_words(i64 1)
  %t2481 = ptrtoint ptr %t2480 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-parameters" to i64), ptr %t2480
  %t2482 = or i64 %t2481, 4
  %t2483 = call i64 @rt_root(i64 %t2482)
  store i64 %t2483, ptr @"scheme.base:with-parameters"
  ret i64 17
}

define i64 @"scheme.base:__init_103"() {
entry:
  %t2521 = call ptr @rt_alloc_words(i64 1)
  %t2522 = ptrtoint ptr %t2521 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->vector" to i64), ptr %t2521
  %t2523 = or i64 %t2522, 4
  %t2524 = call i64 @rt_root(i64 %t2523)
  store i64 %t2524, ptr @"scheme.base:list->vector"
  ret i64 17
}

define i64 @"scheme.base:__init_104"() {
entry:
  %t2542 = call ptr @rt_alloc_words(i64 1)
  %t2543 = ptrtoint ptr %t2542 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector" to i64), ptr %t2542
  %t2544 = or i64 %t2543, 4
  %t2545 = call i64 @rt_root(i64 %t2544)
  store i64 %t2545, ptr @"scheme.base:vector"
  ret i64 17
}

define i64 @"scheme.base:__init_105"() {
entry:
  %t2583 = call ptr @rt_alloc_words(i64 1)
  %t2584 = ptrtoint ptr %t2583 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->bytevector" to i64), ptr %t2583
  %t2585 = or i64 %t2584, 4
  %t2586 = call i64 @rt_root(i64 %t2585)
  store i64 %t2586, ptr @"scheme.base:list->bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_106"() {
entry:
  %t2604 = call ptr @rt_alloc_words(i64 1)
  %t2605 = ptrtoint ptr %t2604 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector" to i64), ptr %t2604
  %t2606 = or i64 %t2605, 4
  %t2607 = call i64 @rt_root(i64 %t2606)
  store i64 %t2607, ptr @"scheme.base:bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_107"() {
entry:
  %t2612 = call ptr @rt_alloc_words(i64 1)
  %t2613 = ptrtoint ptr %t2612 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rng-start" to i64), ptr %t2612
  %t2614 = or i64 %t2613, 4
  %t2615 = call i64 @rt_root(i64 %t2614)
  store i64 %t2615, ptr @"scheme.base:rng-start"
  ret i64 17
}

define i64 @"scheme.base:__init_108"() {
entry:
  %t2625 = call ptr @rt_alloc_words(i64 1)
  %t2626 = ptrtoint ptr %t2625 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rng-end" to i64), ptr %t2625
  %t2627 = or i64 %t2626, 4
  %t2628 = call i64 @rt_root(i64 %t2627)
  store i64 %t2628, ptr @"scheme.base:rng-end"
  ret i64 17
}

define i64 @"scheme.base:__init_109"() {
entry:
  %t2690 = call ptr @rt_alloc_words(i64 1)
  %t2691 = ptrtoint ptr %t2690 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rng-check" to i64), ptr %t2690
  %t2692 = or i64 %t2691, 4
  %t2693 = call i64 @rt_root(i64 %t2692)
  store i64 %t2693, ptr @"scheme.base:rng-check"
  ret i64 17
}

define i64 @"scheme.base:__init_110"() {
entry:
  %t2709 = call ptr @rt_alloc_words(i64 1)
  %t2710 = ptrtoint ptr %t2709 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:assv" to i64), ptr %t2709
  %t2711 = or i64 %t2710, 4
  %t2712 = call i64 @rt_root(i64 %t2711)
  store i64 %t2712, ptr @"scheme.base:assv"
  ret i64 17
}

define i64 @"scheme.base:__init_111"() {
entry:
  %t2725 = call ptr @rt_alloc_words(i64 1)
  %t2726 = ptrtoint ptr %t2725 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-copy" to i64), ptr %t2725
  %t2727 = or i64 %t2726, 4
  %t2728 = call i64 @rt_root(i64 %t2727)
  store i64 %t2728, ptr @"scheme.base:list-copy"
  ret i64 17
}

define i64 @"scheme.base:__init_112"() {
entry:
  %t2747 = call ptr @rt_alloc_words(i64 1)
  %t2748 = ptrtoint ptr %t2747 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:boolean=?" to i64), ptr %t2747
  %t2749 = or i64 %t2748, 4
  %t2750 = call i64 @rt_root(i64 %t2749)
  store i64 %t2750, ptr @"scheme.base:boolean=?"
  ret i64 17
}

define i64 @"scheme.base:__init_113"() {
entry:
  %t2769 = call ptr @rt_alloc_words(i64 1)
  %t2770 = ptrtoint ptr %t2769 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:symbol=?" to i64), ptr %t2769
  %t2771 = or i64 %t2770, 4
  %t2772 = call i64 @rt_root(i64 %t2771)
  store i64 %t2772, ptr @"scheme.base:symbol=?"
  ret i64 17
}

define i64 @"scheme.base:__init_114"() {
entry:
  %t2787 = call ptr @rt_alloc_words(i64 1)
  %t2788 = ptrtoint ptr %t2787 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:eqv-chain?" to i64), ptr %t2787
  %t2789 = or i64 %t2788, 4
  %t2790 = call i64 @rt_root(i64 %t2789)
  store i64 %t2790, ptr @"scheme.base:eqv-chain?"
  ret i64 17
}

define i64 @"scheme.base:__init_115"() {
entry:
  %t2890 = call ptr @rt_alloc_words(i64 1)
  %t2891 = ptrtoint ptr %t2890 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-cmp" to i64), ptr %t2890
  %t2892 = or i64 %t2891, 4
  %t2893 = call i64 @rt_root(i64 %t2892)
  store i64 %t2893, ptr @"scheme.base:str-cmp"
  ret i64 17
}

define i64 @"scheme.base:__init_116"() {
entry:
  %t2912 = call ptr @rt_alloc_words(i64 1)
  %t2913 = ptrtoint ptr %t2912 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-chain?" to i64), ptr %t2912
  %t2914 = or i64 %t2913, 4
  %t2915 = call i64 @rt_root(i64 %t2914)
  store i64 %t2915, ptr @"scheme.base:str-chain?"
  ret i64 17
}

define i64 @"scheme.base:__init_117"() {
entry:
  %t2951 = call ptr @rt_alloc_words(i64 1)
  %t2952 = ptrtoint ptr %t2951 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string<?" to i64), ptr %t2951
  %t2953 = or i64 %t2952, 4
  %t2954 = call i64 @rt_root(i64 %t2953)
  store i64 %t2954, ptr @"scheme.base:string<?"
  ret i64 17
}

define i64 @"scheme.base:__init_118"() {
entry:
  %t2990 = call ptr @rt_alloc_words(i64 1)
  %t2991 = ptrtoint ptr %t2990 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string>?" to i64), ptr %t2990
  %t2992 = or i64 %t2991, 4
  %t2993 = call i64 @rt_root(i64 %t2992)
  store i64 %t2993, ptr @"scheme.base:string>?"
  ret i64 17
}

define i64 @"scheme.base:__init_119"() {
entry:
  %t3030 = call ptr @rt_alloc_words(i64 1)
  %t3031 = ptrtoint ptr %t3030 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string<=?" to i64), ptr %t3030
  %t3032 = or i64 %t3031, 4
  %t3033 = call i64 @rt_root(i64 %t3032)
  store i64 %t3033, ptr @"scheme.base:string<=?"
  ret i64 17
}

define i64 @"scheme.base:__init_120"() {
entry:
  %t3070 = call ptr @rt_alloc_words(i64 1)
  %t3071 = ptrtoint ptr %t3070 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string>=?" to i64), ptr %t3070
  %t3072 = or i64 %t3071, 4
  %t3073 = call i64 @rt_root(i64 %t3072)
  store i64 %t3073, ptr @"scheme.base:string>=?"
  ret i64 17
}

define i64 @"scheme.base:__init_121"() {
entry:
  %t3148 = call ptr @rt_alloc_words(i64 1)
  %t3149 = ptrtoint ptr %t3148 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector->list" to i64), ptr %t3148
  %t3150 = or i64 %t3149, 4
  %t3151 = call i64 @rt_root(i64 %t3150)
  store i64 %t3151, ptr @"scheme.base:vector->list"
  ret i64 17
}

define i64 @"scheme.base:__init_122"() {
entry:
  %t3249 = call ptr @rt_alloc_words(i64 1)
  %t3250 = ptrtoint ptr %t3249 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-copy" to i64), ptr %t3249
  %t3251 = or i64 %t3250, 4
  %t3252 = call i64 @rt_root(i64 %t3251)
  store i64 %t3252, ptr @"scheme.base:vector-copy"
  ret i64 17
}

define i64 @"scheme.base:__init_123"() {
entry:
  %t3375 = call ptr @rt_alloc_words(i64 1)
  %t3376 = ptrtoint ptr %t3375 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-append" to i64), ptr %t3375
  %t3377 = or i64 %t3376, 4
  %t3378 = call i64 @rt_root(i64 %t3377)
  store i64 %t3378, ptr @"scheme.base:vector-append"
  ret i64 17
}

define i64 @"scheme.base:__init_124"() {
entry:
  %t3399 = call ptr @rt_alloc_words(i64 1)
  %t3400 = ptrtoint ptr %t3399 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vec-total" to i64), ptr %t3399
  %t3401 = or i64 %t3400, 4
  %t3402 = call i64 @rt_root(i64 %t3401)
  store i64 %t3402, ptr @"scheme.base:vec-total"
  ret i64 17
}

define i64 @"scheme.base:__init_125"() {
entry:
  %t3479 = call ptr @rt_alloc_words(i64 1)
  %t3480 = ptrtoint ptr %t3479 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-fill!" to i64), ptr %t3479
  %t3481 = or i64 %t3480, 4
  %t3482 = call i64 @rt_root(i64 %t3481)
  store i64 %t3482, ptr @"scheme.base:vector-fill!"
  ret i64 17
}

define i64 @"scheme.base:__init_126"() {
entry:
  %t3713 = call ptr @rt_alloc_words(i64 1)
  %t3714 = ptrtoint ptr %t3713 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-copy!" to i64), ptr %t3713
  %t3715 = or i64 %t3714, 4
  %t3716 = call i64 @rt_root(i64 %t3715)
  store i64 %t3716, ptr @"scheme.base:vector-copy!"
  ret i64 17
}

define i64 @"scheme.base:__init_127"() {
entry:
  %t3875 = call ptr @rt_alloc_words(i64 1)
  %t3876 = ptrtoint ptr %t3875 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-map" to i64), ptr %t3875
  %t3877 = or i64 %t3876, 4
  %t3878 = call i64 @rt_root(i64 %t3877)
  store i64 %t3878, ptr @"scheme.base:vector-map"
  ret i64 17
}

define i64 @"scheme.base:__init_128"() {
entry:
  %t4027 = call ptr @rt_alloc_words(i64 1)
  %t4028 = ptrtoint ptr %t4027 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-for-each" to i64), ptr %t4027
  %t4029 = or i64 %t4028, 4
  %t4030 = call i64 @rt_root(i64 %t4029)
  store i64 %t4030, ptr @"scheme.base:vector-for-each"
  ret i64 17
}

define i64 @"scheme.base:__init_129"() {
entry:
  %t4054 = call ptr @rt_alloc_words(i64 1)
  %t4055 = ptrtoint ptr %t4054 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vec-min-len" to i64), ptr %t4054
  %t4056 = or i64 %t4055, 4
  %t4057 = call i64 @rt_root(i64 %t4056)
  store i64 %t4057, ptr @"scheme.base:vec-min-len"
  ret i64 17
}

define i64 @"scheme.base:__init_130"() {
entry:
  %t4071 = call ptr @rt_alloc_words(i64 1)
  %t4072 = ptrtoint ptr %t4071 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vec-nth" to i64), ptr %t4071
  %t4073 = or i64 %t4072, 4
  %t4074 = call i64 @rt_root(i64 %t4073)
  store i64 %t4074, ptr @"scheme.base:vec-nth"
  ret i64 17
}

define i64 @"scheme.base:__init_131"() {
entry:
  %t4172 = call ptr @rt_alloc_words(i64 1)
  %t4173 = ptrtoint ptr %t4172 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string->vector" to i64), ptr %t4172
  %t4174 = or i64 %t4173, 4
  %t4175 = call i64 @rt_root(i64 %t4174)
  store i64 %t4175, ptr @"scheme.base:string->vector"
  ret i64 17
}

define i64 @"scheme.base:__init_132"() {
entry:
  %t4214 = call ptr @rt_alloc_words(i64 1)
  %t4215 = ptrtoint ptr %t4214 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector->string" to i64), ptr %t4214
  %t4216 = or i64 %t4215, 4
  %t4217 = call i64 @rt_root(i64 %t4216)
  store i64 %t4217, ptr @"scheme.base:vector->string"
  ret i64 17
}

define i64 @"scheme.base:__init_133"() {
entry:
  %t4252 = call ptr @rt_alloc_words(i64 1)
  %t4253 = ptrtoint ptr %t4252 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-map" to i64), ptr %t4252
  %t4254 = or i64 %t4253, 4
  %t4255 = call i64 @rt_root(i64 %t4254)
  store i64 %t4255, ptr @"scheme.base:string-map"
  ret i64 17
}

define i64 @"scheme.base:__init_134"() {
entry:
  %t4273 = call ptr @rt_alloc_words(i64 1)
  %t4274 = ptrtoint ptr %t4273 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-map1" to i64), ptr %t4273
  %t4275 = or i64 %t4274, 4
  %t4276 = call i64 @rt_root(i64 %t4275)
  store i64 %t4276, ptr @"scheme.base:str-map1"
  ret i64 17
}

define i64 @"scheme.base:__init_135"() {
entry:
  %t4356 = call ptr @rt_alloc_words(i64 1)
  %t4357 = ptrtoint ptr %t4356 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-mapn" to i64), ptr %t4356
  %t4358 = or i64 %t4357, 4
  %t4359 = call i64 @rt_root(i64 %t4358)
  store i64 %t4359, ptr @"scheme.base:str-mapn"
  ret i64 17
}

define i64 @"scheme.base:__init_136"() {
entry:
  %t4508 = call ptr @rt_alloc_words(i64 1)
  %t4509 = ptrtoint ptr %t4508 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-for-each" to i64), ptr %t4508
  %t4510 = or i64 %t4509, 4
  %t4511 = call i64 @rt_root(i64 %t4510)
  store i64 %t4511, ptr @"scheme.base:string-for-each"
  ret i64 17
}

define i64 @"scheme.base:__init_137"() {
entry:
  %t4535 = call ptr @rt_alloc_words(i64 1)
  %t4536 = ptrtoint ptr %t4535 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-min-len" to i64), ptr %t4535
  %t4537 = or i64 %t4536, 4
  %t4538 = call i64 @rt_root(i64 %t4537)
  store i64 %t4538, ptr @"scheme.base:str-min-len"
  ret i64 17
}

define i64 @"scheme.base:__init_138"() {
entry:
  %t4552 = call ptr @rt_alloc_words(i64 1)
  %t4553 = ptrtoint ptr %t4552 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-nth" to i64), ptr %t4552
  %t4554 = or i64 %t4553, 4
  %t4555 = call i64 @rt_root(i64 %t4554)
  store i64 %t4555, ptr @"scheme.base:str-nth"
  ret i64 17
}

define i64 @"scheme.base:__init_139"() {
entry:
  %t4632 = call ptr @rt_alloc_words(i64 1)
  %t4633 = ptrtoint ptr %t4632 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-fill!" to i64), ptr %t4632
  %t4634 = or i64 %t4633, 4
  %t4635 = call i64 @rt_root(i64 %t4634)
  store i64 %t4635, ptr @"scheme.base:string-fill!"
  ret i64 17
}

define i64 @"scheme.base:__init_140"() {
entry:
  %t4866 = call ptr @rt_alloc_words(i64 1)
  %t4867 = ptrtoint ptr %t4866 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-copy!" to i64), ptr %t4866
  %t4868 = or i64 %t4867, 4
  %t4869 = call i64 @rt_root(i64 %t4868)
  store i64 %t4869, ptr @"scheme.base:string-copy!"
  ret i64 17
}

define i64 @"scheme.base:__init_141"() {
entry:
  %t4967 = call ptr @rt_alloc_words(i64 1)
  %t4968 = ptrtoint ptr %t4967 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector-copy" to i64), ptr %t4967
  %t4969 = or i64 %t4968, 4
  %t4970 = call i64 @rt_root(i64 %t4969)
  store i64 %t4970, ptr @"scheme.base:bytevector-copy"
  ret i64 17
}

define i64 @"scheme.base:__init_142"() {
entry:
  %t5201 = call ptr @rt_alloc_words(i64 1)
  %t5202 = ptrtoint ptr %t5201 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector-copy!" to i64), ptr %t5201
  %t5203 = or i64 %t5202, 4
  %t5204 = call i64 @rt_root(i64 %t5203)
  store i64 %t5204, ptr @"scheme.base:bytevector-copy!"
  ret i64 17
}

define i64 @"scheme.base:__init_143"() {
entry:
  %t5327 = call ptr @rt_alloc_words(i64 1)
  %t5328 = ptrtoint ptr %t5327 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector-append" to i64), ptr %t5327
  %t5329 = or i64 %t5328, 4
  %t5330 = call i64 @rt_root(i64 %t5329)
  store i64 %t5330, ptr @"scheme.base:bytevector-append"
  ret i64 17
}

define i64 @"scheme.base:__init_144"() {
entry:
  %t5351 = call ptr @rt_alloc_words(i64 1)
  %t5352 = ptrtoint ptr %t5351 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bv-total" to i64), ptr %t5351
  %t5353 = or i64 %t5352, 4
  %t5354 = call i64 @rt_root(i64 %t5353)
  store i64 %t5354, ptr @"scheme.base:bv-total"
  ret i64 17
}

define i64 @"scheme.base:__init_145"() {
entry:
  %t5355 = call i64 @rt_root(i64 8000000)
  store i64 %t5355, ptr @"scheme.base:rat-max-denom"
  ret i64 17
}

define i64 @"scheme.base:__init_146"() {
entry:
  %t5404 = call ptr @rt_alloc_words(i64 1)
  %t5405 = ptrtoint ptr %t5404 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rationalize" to i64), ptr %t5404
  %t5406 = or i64 %t5405, 4
  %t5407 = call i64 @rt_root(i64 %t5406)
  store i64 %t5407, ptr @"scheme.base:rationalize"
  ret i64 17
}

define i64 @"scheme.base:__init_147"() {
entry:
  %t5524 = call ptr @rt_alloc_words(i64 1)
  %t5525 = ptrtoint ptr %t5524 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-exact" to i64), ptr %t5524
  %t5526 = or i64 %t5525, 4
  %t5527 = call i64 @rt_root(i64 %t5526)
  store i64 %t5527, ptr @"scheme.base:rat-exact"
  ret i64 17
}

define i64 @"scheme.base:__init_148"() {
entry:
  %t5529 = call ptr @rt_alloc_words(i64 1)
  %t5530 = ptrtoint ptr %t5529 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-ceil" to i64), ptr %t5529
  %t5531 = or i64 %t5530, 4
  %t5532 = call i64 @rt_root(i64 %t5531)
  store i64 %t5532, ptr @"scheme.base:rat-ceil"
  ret i64 17
}

define i64 @"scheme.base:__init_149"() {
entry:
  %t5534 = call ptr @rt_alloc_words(i64 1)
  %t5535 = ptrtoint ptr %t5534 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-floor" to i64), ptr %t5534
  %t5536 = or i64 %t5535, 4
  %t5537 = call i64 @rt_root(i64 %t5536)
  store i64 %t5537, ptr @"scheme.base:rat-floor"
  ret i64 17
}

define i64 @"scheme.base:__init_150"() {
entry:
  %t5654 = call ptr @rt_alloc_words(i64 1)
  %t5655 = ptrtoint ptr %t5654 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-inexact" to i64), ptr %t5654
  %t5656 = or i64 %t5655, 4
  %t5657 = call i64 @rt_root(i64 %t5656)
  store i64 %t5657, ptr @"scheme.base:rat-inexact"
  ret i64 17
}

define i64 @"scheme.base:__init_151"() {
entry:
  %t5683 = call ptr @rt_alloc_words(i64 1)
  %t5684 = ptrtoint ptr %t5683 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-num-in" to i64), ptr %t5683
  %t5685 = or i64 %t5684, 4
  %t5686 = call i64 @rt_root(i64 %t5685)
  store i64 %t5686, ptr @"scheme.base:rat-num-in"
  ret i64 17
}

define i64 @"scheme.base:__init_152"() {
entry:
  %t5712 = call ptr @rt_alloc_words(i64 1)
  %t5713 = ptrtoint ptr %t5712 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-ceil-flo" to i64), ptr %t5712
  %t5714 = or i64 %t5713, 4
  %t5715 = call i64 @rt_root(i64 %t5714)
  store i64 %t5715, ptr @"scheme.base:rat-ceil-flo"
  ret i64 17
}

define i64 @"scheme.base:__init_153"() {
entry:
  %t5735 = call ptr @rt_alloc_words(i64 1)
  %t5736 = ptrtoint ptr %t5735 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:values" to i64), ptr %t5735
  %t5737 = or i64 %t5736, 4
  %t5738 = call i64 @rt_root(i64 %t5737)
  store i64 %t5738, ptr @"scheme.base:values"
  ret i64 17
}

define i64 @"scheme.base:__init_154"() {
entry:
  %t5780 = call ptr @rt_alloc_words(i64 1)
  %t5781 = ptrtoint ptr %t5780 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-values" to i64), ptr %t5780
  %t5782 = or i64 %t5781, 4
  %t5783 = call i64 @rt_root(i64 %t5782)
  store i64 %t5783, ptr @"scheme.base:call-with-values"
  ret i64 17
}

define i64 @"scheme.base:__init_155"() {
entry:
  %t5784 = call i64 @rt_root(i64 64)
  store i64 %t5784, ptr @"scheme.base:%ht-initial-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_156"() {
entry:
  %t5785 = call i64 @rt_root(i64 24)
  store i64 %t5785, ptr @"scheme.base:%ht-load-factor"
  ret i64 17
}

define i64 @"scheme.base:__init_157"() {
entry:
  %t5796 = call ptr @rt_alloc_words(i64 1)
  %t5797 = ptrtoint ptr %t5796 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-hash-table" to i64), ptr %t5796
  %t5798 = or i64 %t5797, 4
  %t5799 = call i64 @rt_root(i64 %t5798)
  store i64 %t5799, ptr @"scheme.base:make-hash-table"
  ret i64 17
}

define i64 @"scheme.base:__init_158"() {
entry:
  %t5802 = call ptr @rt_alloc_words(i64 1)
  %t5803 = ptrtoint ptr %t5802 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table?" to i64), ptr %t5802
  %t5804 = or i64 %t5803, 4
  %t5805 = call i64 @rt_root(i64 %t5804)
  store i64 %t5805, ptr @"scheme.base:hash-table?"
  ret i64 17
}

define i64 @"scheme.base:__init_159"() {
entry:
  %t5809 = call ptr @rt_alloc_words(i64 1)
  %t5810 = ptrtoint ptr %t5809 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-count" to i64), ptr %t5809
  %t5811 = or i64 %t5810, 4
  %t5812 = call i64 @rt_root(i64 %t5811)
  store i64 %t5812, ptr @"scheme.base:%ht-count"
  ret i64 17
}

define i64 @"scheme.base:__init_160"() {
entry:
  %t5816 = call ptr @rt_alloc_words(i64 1)
  %t5817 = ptrtoint ptr %t5816 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-buckets" to i64), ptr %t5816
  %t5818 = or i64 %t5817, 4
  %t5819 = call i64 @rt_root(i64 %t5818)
  store i64 %t5819, ptr @"scheme.base:%ht-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_161"() {
entry:
  %t5823 = call ptr @rt_alloc_words(i64 1)
  %t5824 = ptrtoint ptr %t5823 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-count!" to i64), ptr %t5823
  %t5825 = or i64 %t5824, 4
  %t5826 = call i64 @rt_root(i64 %t5825)
  store i64 %t5826, ptr @"scheme.base:%ht-set-count!"
  ret i64 17
}

define i64 @"scheme.base:__init_162"() {
entry:
  %t5830 = call ptr @rt_alloc_words(i64 1)
  %t5831 = ptrtoint ptr %t5830 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-buckets!" to i64), ptr %t5830
  %t5832 = or i64 %t5831, 4
  %t5833 = call i64 @rt_root(i64 %t5832)
  store i64 %t5833, ptr @"scheme.base:%ht-set-buckets!"
  ret i64 17
}

define i64 @"scheme.base:__init_163"() {
entry:
  %t5837 = call ptr @rt_alloc_words(i64 1)
  %t5838 = ptrtoint ptr %t5837 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-index" to i64), ptr %t5837
  %t5839 = or i64 %t5838, 4
  %t5840 = call i64 @rt_root(i64 %t5839)
  store i64 %t5840, ptr @"scheme.base:%ht-index"
  ret i64 17
}

define i64 @"scheme.base:__init_164"() {
entry:
  %t5856 = call ptr @rt_alloc_words(i64 1)
  %t5857 = ptrtoint ptr %t5856 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-assoc" to i64), ptr %t5856
  %t5858 = or i64 %t5857, 4
  %t5859 = call i64 @rt_root(i64 %t5858)
  store i64 %t5859, ptr @"scheme.base:%ht-assoc"
  ret i64 17
}

define i64 @"scheme.base:__init_165"() {
entry:
  %t5877 = call ptr @rt_alloc_words(i64 1)
  %t5878 = ptrtoint ptr %t5877 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-remove" to i64), ptr %t5877
  %t5879 = or i64 %t5878, 4
  %t5880 = call i64 @rt_root(i64 %t5879)
  store i64 %t5880, ptr @"scheme.base:%ht-remove"
  ret i64 17
}

define i64 @"scheme.base:__init_166"() {
entry:
  %t5904 = call ptr @rt_alloc_words(i64 1)
  %t5905 = ptrtoint ptr %t5904 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref/default" to i64), ptr %t5904
  %t5906 = or i64 %t5905, 4
  %t5907 = call i64 @rt_root(i64 %t5906)
  store i64 %t5907, ptr @"scheme.base:hash-table-ref/default"
  ret i64 17
}

define i64 @"scheme.base:__init_167"() {
entry:
  %t5930 = call ptr @rt_alloc_words(i64 1)
  %t5931 = ptrtoint ptr %t5930 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-contains?" to i64), ptr %t5930
  %t5932 = or i64 %t5931, 4
  %t5933 = call i64 @rt_root(i64 %t5932)
  store i64 %t5933, ptr @"scheme.base:hash-table-contains?"
  ret i64 17
}

define i64 @"scheme.base:__init_168"() {
entry:
  %t5964 = call ptr @rt_alloc_words(i64 1)
  %t5965 = ptrtoint ptr %t5964 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref" to i64), ptr %t5964
  %t5966 = or i64 %t5965, 4
  %t5967 = call i64 @rt_root(i64 %t5966)
  store i64 %t5967, ptr @"scheme.base:hash-table-ref"
  ret i64 17
}

define i64 @"scheme.base:__init_169"() {
entry:
  %t6051 = call ptr @rt_alloc_words(i64 1)
  %t6052 = ptrtoint ptr %t6051 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-set!" to i64), ptr %t6051
  %t6053 = or i64 %t6052, 4
  %t6054 = call i64 @rt_root(i64 %t6053)
  store i64 %t6054, ptr @"scheme.base:hash-table-set!"
  ret i64 17
}

define i64 @"scheme.base:__init_170"() {
entry:
  %t6104 = call ptr @rt_alloc_words(i64 1)
  %t6105 = ptrtoint ptr %t6104 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-delete!" to i64), ptr %t6104
  %t6106 = or i64 %t6105, 4
  %t6107 = call i64 @rt_root(i64 %t6106)
  store i64 %t6107, ptr @"scheme.base:hash-table-delete!"
  ret i64 17
}

define i64 @"scheme.base:__init_171"() {
entry:
  %t6211 = call ptr @rt_alloc_words(i64 1)
  %t6212 = ptrtoint ptr %t6211 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-grow!" to i64), ptr %t6211
  %t6213 = or i64 %t6212, 4
  %t6214 = call i64 @rt_root(i64 %t6213)
  store i64 %t6214, ptr @"scheme.base:%ht-grow!"
  ret i64 17
}

define i64 @"scheme.base:__init_172"() {
entry:
  %t6222 = call ptr @rt_alloc_words(i64 1)
  %t6223 = ptrtoint ptr %t6222 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-size" to i64), ptr %t6222
  %t6224 = or i64 %t6223, 4
  %t6225 = call i64 @rt_root(i64 %t6224)
  store i64 %t6225, ptr @"scheme.base:hash-table-size"
  ret i64 17
}

define i64 @"scheme.base:__init_173"() {
entry:
  %t6242 = call ptr @rt_alloc_words(i64 1)
  %t6243 = ptrtoint ptr %t6242 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-fold-buckets" to i64), ptr %t6242
  %t6244 = or i64 %t6243, 4
  %t6245 = call i64 @rt_root(i64 %t6244)
  store i64 %t6245, ptr @"scheme.base:%ht-fold-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_174"() {
entry:
  %t6293 = call ptr @rt_alloc_words(i64 1)
  %t6294 = ptrtoint ptr %t6293 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table->alist" to i64), ptr %t6293
  %t6295 = or i64 %t6294, 4
  %t6296 = call i64 @rt_root(i64 %t6295)
  store i64 %t6296, ptr @"scheme.base:hash-table->alist"
  ret i64 17
}

define i64 @"scheme.base:__init_175"() {
entry:
  %t6315 = call ptr @rt_alloc_words(i64 1)
  %t6316 = ptrtoint ptr %t6315 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-keys" to i64), ptr %t6315
  %t6317 = or i64 %t6316, 4
  %t6318 = call i64 @rt_root(i64 %t6317)
  store i64 %t6318, ptr @"scheme.base:hash-table-keys"
  ret i64 17
}

define i64 @"scheme.base:__init_176"() {
entry:
  %t6337 = call ptr @rt_alloc_words(i64 1)
  %t6338 = ptrtoint ptr %t6337 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-values" to i64), ptr %t6337
  %t6339 = or i64 %t6338, 4
  %t6340 = call i64 @rt_root(i64 %t6339)
  store i64 %t6340, ptr @"scheme.base:hash-table-values"
  ret i64 17
}

define i64 @"scheme.base:__init_177"() {
entry:
  %t6509 = call ptr @rt_alloc_words(i64 1)
  %t6510 = ptrtoint ptr %t6509 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-report" to i64), ptr %t6509
  %t6511 = or i64 %t6510, 4
  %t6512 = call i64 @rt_root(i64 %t6511)
  store i64 %t6512, ptr @"scheme.base:rd-report"
  ret i64 17
}

define i64 @"scheme.base:__init_178"() {
entry:
  %t6530 = call ptr @rt_alloc_words(i64 1)
  %t6531 = ptrtoint ptr %t6530 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-from-string" to i64), ptr %t6530
  %t6532 = or i64 %t6531, 4
  %t6533 = call i64 @rt_root(i64 %t6532)
  store i64 %t6533, ptr @"scheme.base:read-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_179"() {
entry:
  %t6541 = call ptr @rt_alloc_words(i64 1)
  %t6542 = ptrtoint ptr %t6541 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-all-from-string" to i64), ptr %t6541
  %t6543 = or i64 %t6542, 4
  %t6544 = call i64 @rt_root(i64 %t6543)
  store i64 %t6544, ptr @"scheme.base:read-all-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_180"() {
entry:
  %t6552 = call ptr @rt_alloc_words(i64 1)
  %t6553 = ptrtoint ptr %t6552 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-all-from-string-ci" to i64), ptr %t6552
  %t6554 = or i64 %t6553, 4
  %t6555 = call i64 @rt_root(i64 %t6554)
  store i64 %t6555, ptr @"scheme.base:read-all-from-string-ci"
  ret i64 17
}

define i64 @"scheme.base:__init_181"() {
entry:
  %t6652 = call ptr @rt_alloc_words(i64 1)
  %t6653 = ptrtoint ptr %t6652 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-all" to i64), ptr %t6652
  %t6654 = or i64 %t6653, 4
  %t6655 = call i64 @rt_root(i64 %t6654)
  store i64 %t6655, ptr @"scheme.base:rd-all"
  ret i64 17
}

define i64 @"scheme.base:__init_182"() {
entry:
  %t6660 = call ptr @rt_alloc_words(i64 1)
  %t6661 = ptrtoint ptr %t6660 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port?" to i64), ptr %t6660
  %t6662 = or i64 %t6661, 4
  %t6663 = call i64 @rt_root(i64 %t6662)
  store i64 %t6663, ptr @"scheme.base:port?"
  ret i64 17
}

define i64 @"scheme.base:__init_183"() {
entry:
  %t6673 = call ptr @rt_alloc_words(i64 1)
  %t6674 = ptrtoint ptr %t6673 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port?" to i64), ptr %t6673
  %t6675 = or i64 %t6674, 4
  %t6676 = call i64 @rt_root(i64 %t6675)
  store i64 %t6676, ptr @"scheme.base:input-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_184"() {
entry:
  %t6687 = call ptr @rt_alloc_words(i64 1)
  %t6688 = ptrtoint ptr %t6687 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port?" to i64), ptr %t6687
  %t6689 = or i64 %t6688, 4
  %t6690 = call i64 @rt_root(i64 %t6689)
  store i64 %t6690, ptr @"scheme.base:output-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_185"() {
entry:
  %t6698 = call ptr @rt_alloc_words(i64 1)
  %t6699 = ptrtoint ptr %t6698 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:textual-port?" to i64), ptr %t6698
  %t6700 = or i64 %t6699, 4
  %t6701 = call i64 @rt_root(i64 %t6700)
  store i64 %t6701, ptr @"scheme.base:textual-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_186"() {
entry:
  %t6704 = call ptr @rt_alloc_words(i64 1)
  %t6705 = ptrtoint ptr %t6704 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port-closed?" to i64), ptr %t6704
  %t6706 = or i64 %t6705, 4
  %t6707 = call i64 @rt_root(i64 %t6706)
  store i64 %t6707, ptr @"scheme.base:port-closed?"
  ret i64 17
}

define i64 @"scheme.base:__init_187"() {
entry:
  %t6718 = call ptr @rt_alloc_words(i64 1)
  %t6719 = ptrtoint ptr %t6718 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port-open?" to i64), ptr %t6718
  %t6720 = or i64 %t6719, 4
  %t6721 = call i64 @rt_root(i64 %t6720)
  store i64 %t6721, ptr @"scheme.base:input-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_188"() {
entry:
  %t6732 = call ptr @rt_alloc_words(i64 1)
  %t6733 = ptrtoint ptr %t6732 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port-open?" to i64), ptr %t6732
  %t6734 = or i64 %t6733, 4
  %t6735 = call i64 @rt_root(i64 %t6734)
  store i64 %t6735, ptr @"scheme.base:output-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_189"() {
entry:
  %t6761 = call ptr @rt_alloc_words(i64 1)
  %t6762 = ptrtoint ptr %t6761 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-input-port" to i64), ptr %t6761
  %t6763 = or i64 %t6762, 4
  %t6764 = call i64 @rt_root(i64 %t6763)
  store i64 %t6764, ptr @"scheme.base:%check-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_190"() {
entry:
  %t6790 = call ptr @rt_alloc_words(i64 1)
  %t6791 = ptrtoint ptr %t6790 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-output-port" to i64), ptr %t6790
  %t6792 = or i64 %t6791, 4
  %t6793 = call i64 @rt_root(i64 %t6792)
  store i64 %t6793, ptr @"scheme.base:%check-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_191"() {
entry:
  %t6797 = call ptr @rt_alloc_words(i64 1)
  %t6798 = ptrtoint ptr %t6797 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-input-string" to i64), ptr %t6797
  %t6799 = or i64 %t6798, 4
  %t6800 = call i64 @rt_root(i64 %t6799)
  store i64 %t6800, ptr @"scheme.base:open-input-string"
  ret i64 17
}

define i64 @"scheme.base:__init_192"() {
entry:
  %t6821 = call ptr @rt_alloc_words(i64 1)
  %t6822 = ptrtoint ptr %t6821 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%port-at-eof?" to i64), ptr %t6821
  %t6823 = or i64 %t6822, 4
  %t6824 = call i64 @rt_root(i64 %t6823)
  store i64 %t6824, ptr @"scheme.base:%port-at-eof?"
  ret i64 17
}

define i64 @"scheme.base:__init_193"() {
entry:
  %t6854 = call ptr @rt_alloc_words(i64 1)
  %t6855 = ptrtoint ptr %t6854 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-char" to i64), ptr %t6854
  %t6856 = or i64 %t6855, 4
  %t6857 = call i64 @rt_root(i64 %t6856)
  store i64 %t6857, ptr @"scheme.base:read-char"
  ret i64 17
}

define i64 @"scheme.base:__init_194"() {
entry:
  %t6878 = call ptr @rt_alloc_words(i64 1)
  %t6879 = ptrtoint ptr %t6878 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:peek-char" to i64), ptr %t6878
  %t6880 = or i64 %t6879, 4
  %t6881 = call i64 @rt_root(i64 %t6880)
  store i64 %t6881, ptr @"scheme.base:peek-char"
  ret i64 17
}

define i64 @"scheme.base:__init_195"() {
entry:
  %t6999 = call ptr @rt_alloc_words(i64 1)
  %t7000 = ptrtoint ptr %t6999 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-line" to i64), ptr %t6999
  %t7001 = or i64 %t7000, 4
  %t7002 = call i64 @rt_root(i64 %t7001)
  store i64 %t7002, ptr @"scheme.base:read-line"
  ret i64 17
}

define i64 @"scheme.base:__init_196"() {
entry:
  %t7050 = call ptr @rt_alloc_words(i64 1)
  %t7051 = ptrtoint ptr %t7050 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-string" to i64), ptr %t7050
  %t7052 = or i64 %t7051, 4
  %t7053 = call i64 @rt_root(i64 %t7052)
  store i64 %t7053, ptr @"scheme.base:read-string"
  ret i64 17
}

define i64 @"scheme.base:__init_197"() {
entry:
  %t7067 = call ptr @rt_alloc_words(i64 1)
  %t7068 = ptrtoint ptr %t7067 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-output-string" to i64), ptr %t7067
  %t7069 = or i64 %t7068, 4
  %t7070 = call i64 @rt_root(i64 %t7069)
  store i64 %t7070, ptr @"scheme.base:open-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_198"() {
entry:
  %t7101 = call ptr @rt_alloc_words(i64 1)
  %t7102 = ptrtoint ptr %t7101 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:get-output-string" to i64), ptr %t7101
  %t7103 = or i64 %t7102, 4
  %t7104 = call i64 @rt_root(i64 %t7103)
  store i64 %t7104, ptr @"scheme.base:get-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_199"() {
entry:
  %t7115 = call ptr @rt_alloc_words(i64 1)
  %t7116 = ptrtoint ptr %t7115 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:flush-output-port" to i64), ptr %t7115
  %t7117 = or i64 %t7116, 4
  %t7118 = call i64 @rt_root(i64 %t7117)
  store i64 %t7118, ptr @"scheme.base:flush-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_200"() {
entry:
  %t7147 = call ptr @rt_alloc_words(i64 1)
  %t7148 = ptrtoint ptr %t7147 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-port" to i64), ptr %t7147
  %t7149 = or i64 %t7148, 4
  %t7150 = call i64 @rt_root(i64 %t7149)
  store i64 %t7150, ptr @"scheme.base:close-port"
  ret i64 17
}

define i64 @"scheme.base:__init_201"() {
entry:
  %t7173 = call ptr @rt_alloc_words(i64 1)
  %t7174 = ptrtoint ptr %t7173 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-input-port" to i64), ptr %t7173
  %t7175 = or i64 %t7174, 4
  %t7176 = call i64 @rt_root(i64 %t7175)
  store i64 %t7176, ptr @"scheme.base:close-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_202"() {
entry:
  %t7199 = call ptr @rt_alloc_words(i64 1)
  %t7200 = ptrtoint ptr %t7199 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-output-port" to i64), ptr %t7199
  %t7201 = or i64 %t7200, 4
  %t7202 = call i64 @rt_root(i64 %t7201)
  store i64 %t7202, ptr @"scheme.base:close-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_203"() {
entry:
  %t7203 = call i64 @rt_root(i64 1)
  store i64 %t7203, ptr @"scheme.base:%stdout-port"
  ret i64 17
}

define i64 @"scheme.base:__init_204"() {
entry:
  %t7204 = call i64 @rt_root(i64 1)
  store i64 %t7204, ptr @"scheme.base:%stderr-port"
  ret i64 17
}

define i64 @"scheme.base:__init_205"() {
entry:
  %t7205 = call i64 @rt_root(i64 1)
  store i64 %t7205, ptr @"scheme.base:%stdin-port"
  ret i64 17
}

define i64 @"scheme.base:__init_206"() {
entry:
  %t7233 = call ptr @rt_alloc_words(i64 1)
  %t7234 = ptrtoint ptr %t7233 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-output-port" to i64), ptr %t7233
  %t7235 = or i64 %t7234, 4
  %t7236 = call i64 @rt_root(i64 %t7235)
  store i64 %t7236, ptr @"scheme.base:current-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_207"() {
entry:
  %t7261 = call ptr @rt_alloc_words(i64 1)
  %t7262 = ptrtoint ptr %t7261 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-error-port" to i64), ptr %t7261
  %t7263 = or i64 %t7262, 4
  %t7264 = call i64 @rt_root(i64 %t7263)
  store i64 %t7264, ptr @"scheme.base:current-error-port"
  ret i64 17
}

define i64 @"scheme.base:__init_208"() {
entry:
  %t7289 = call ptr @rt_alloc_words(i64 1)
  %t7290 = ptrtoint ptr %t7289 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-input-port" to i64), ptr %t7289
  %t7291 = or i64 %t7290, 4
  %t7292 = call i64 @rt_root(i64 %t7291)
  store i64 %t7292, ptr @"scheme.base:current-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_209"() {
entry:
  %t7339 = call ptr @rt_alloc_words(i64 1)
  %t7340 = ptrtoint ptr %t7339 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-port" to i64), ptr %t7339
  %t7341 = or i64 %t7340, 4
  %t7342 = call i64 @rt_root(i64 %t7341)
  store i64 %t7342, ptr @"scheme.base:call-with-port"
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

