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
declare i64 @rt_make_error_object_kind(i64, i64, i64)
declare i64 @rt_error_object_kind(i64)
declare i64 @rt_set_trap_raiser(ptr, i64)
declare i64 @rt_trap_object()
declare i64 @rt_file_exists_p(i64)
declare i64 @rt_delete_file(i64)
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
@.str.lit.9 = private unnamed_addr constant [2 x i8] c"0\00"
@.str.lit.10 = private unnamed_addr constant [55 x i8] c"number->string: radix must be 10 for an inexact number\00"
@.str.lit.11 = private unnamed_addr constant [34 x i8] c"number->string: unsupported radix\00"
@.str.lit.12 = private unnamed_addr constant [34 x i8] c"string->number: unsupported radix\00"
@.str.lit.13 = private unnamed_addr constant [34 x i8] c"string->number: unsupported radix\00"
@.str.lit.14 = private unnamed_addr constant [3 x i8] c": \00"
@.str.sym.15 = private unnamed_addr constant [6 x i8] c"error\00"
@.str.sym.16 = private unnamed_addr constant [5 x i8] c"read\00"
@.str.sym.17 = private unnamed_addr constant [8 x i8] c"call/cc\00"
@.str.lit.18 = private unnamed_addr constant [40 x i8] c"continuation invoked outside its extent\00"
@.str.sym.19 = private unnamed_addr constant [5 x i8] c"file\00"
@.str.lit.20 = private unnamed_addr constant [20 x i8] c"range out of bounds\00"
@.str.sym.21 = private unnamed_addr constant [13 x i8] c"vector->list\00"
@.str.sym.22 = private unnamed_addr constant [12 x i8] c"vector-copy\00"
@.str.sym.23 = private unnamed_addr constant [13 x i8] c"vector-fill!\00"
@.str.sym.24 = private unnamed_addr constant [13 x i8] c"vector-copy!\00"
@.str.sym.25 = private unnamed_addr constant [15 x i8] c"string->vector\00"
@.str.sym.26 = private unnamed_addr constant [15 x i8] c"vector->string\00"
@.str.sym.27 = private unnamed_addr constant [13 x i8] c"string-fill!\00"
@.str.sym.28 = private unnamed_addr constant [13 x i8] c"string-copy!\00"
@.str.sym.29 = private unnamed_addr constant [16 x i8] c"bytevector-copy\00"
@.str.sym.30 = private unnamed_addr constant [17 x i8] c"bytevector-copy!\00"
@.str.lit.31 = private unnamed_addr constant [70 x i8] c"rationalize: no exact rational in range (Emit has no exact rationals)\00"
@.str.lit.32 = private unnamed_addr constant [70 x i8] c"rationalize: no exact rational in range (Emit has no exact rationals)\00"
@.str.lit.33 = private unnamed_addr constant [60 x i8] c"rationalize: no rational found within the denominator limit\00"
@.flo.lit.34 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.flo.lit.35 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.flo.lit.36 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.lit.37 = private unnamed_addr constant [30 x i8] c"hash-table-ref: key not found\00"
@.str.sym.38 = private unnamed_addr constant [17 x i8] c"rd-block-comment\00"
@.str.lit.39 = private unnamed_addr constant [46 x i8] c"unterminated block comment #| opened at index\00"
@.str.sym.40 = private unnamed_addr constant [7 x i8] c"rd-bar\00"
@.str.lit.41 = private unnamed_addr constant [42 x i8] c"unterminated |identifier| opened at index\00"
@.str.sym.42 = private unnamed_addr constant [21 x i8] c"rd-unterminated-list\00"
@.str.lit.43 = private unnamed_addr constant [14 x i8] c"unterminated \00"
@.str.lit.44 = private unnamed_addr constant [7 x i8] c"list [\00"
@.str.lit.45 = private unnamed_addr constant [16 x i8] c"bytevector #u8(\00"
@.str.lit.46 = private unnamed_addr constant [10 x i8] c"vector #(\00"
@.str.lit.47 = private unnamed_addr constant [7 x i8] c"list (\00"
@.str.lit.48 = private unnamed_addr constant [17 x i8] c" opened at index\00"
@.str.sym.49 = private unnamed_addr constant [23 x i8] c"rd-unterminated-string\00"
@.str.lit.50 = private unnamed_addr constant [38 x i8] c"unterminated string \22 opened at index\00"
@.str.sym.51 = private unnamed_addr constant [13 x i8] c"rd-char-name\00"
@.str.lit.52 = private unnamed_addr constant [23 x i8] c"unknown character name\00"
@.str.sym.53 = private unnamed_addr constant [14 x i8] c"rd-hash-token\00"
@.str.lit.54 = private unnamed_addr constant [45 x i8] c"not a boolean; write #t, #true, #f or #false\00"
@.str.sym.55 = private unnamed_addr constant [19 x i8] c"rd-label-duplicate\00"
@.str.lit.56 = private unnamed_addr constant [22 x i8] c"duplicate datum label\00"
@.str.sym.57 = private unnamed_addr constant [20 x i8] c"rd-label-unresolved\00"
@.str.lit.58 = private unnamed_addr constant [48 x i8] c"datum label reference has no earlier definition\00"
@.str.sym.59 = private unnamed_addr constant [14 x i8] c"rd-label-self\00"
@.str.lit.60 = private unnamed_addr constant [56 x i8] c"datum label cannot be defined as only its own reference\00"
@.str.sym.61 = private unnamed_addr constant [9 x i8] c"rd-label\00"
@.str.lit.62 = private unnamed_addr constant [22 x i8] c"malformed datum label\00"
@.str.sym.63 = private unnamed_addr constant [7 x i8] c"rd-eof\00"
@.str.lit.64 = private unnamed_addr constant [50 x i8] c"end of input where a datum was expected, at index\00"
@.str.sym.65 = private unnamed_addr constant [14 x i8] c"rd-unexpected\00"
@.str.lit.66 = private unnamed_addr constant [24 x i8] c"no datum here, at index\00"
@.str.sym.67 = private unnamed_addr constant [12 x i8] c"rd-rational\00"
@.str.lit.68 = private unnamed_addr constant [57 x i8] c"rational literal syntax is not supported -- Emit has no \00"
@.str.lit.69 = private unnamed_addr constant [39 x i8] c"exact rationals; write 0.5, or (/ 1 2)\00"
@.str.lit.70 = private unnamed_addr constant [20 x i8] c"unrecognized syntax\00"
@.str.lit.71 = private unnamed_addr constant [18 x i8] c"not an input port\00"
@.str.lit.72 = private unnamed_addr constant [15 x i8] c"port is closed\00"
@.str.lit.73 = private unnamed_addr constant [19 x i8] c"not an output port\00"
@.str.lit.74 = private unnamed_addr constant [15 x i8] c"port is closed\00"
@.str.sym.75 = private unnamed_addr constant [10 x i8] c"read-char\00"
@.str.sym.76 = private unnamed_addr constant [10 x i8] c"peek-char\00"
@.str.sym.77 = private unnamed_addr constant [10 x i8] c"read-line\00"
@.str.sym.78 = private unnamed_addr constant [12 x i8] c"read-string\00"
@.str.sym.79 = private unnamed_addr constant [19 x i8] c"open-output-string\00"
@.str.lit.80 = private unnamed_addr constant [34 x i8] c"cannot open an output string port\00"
@.str.sym.81 = private unnamed_addr constant [18 x i8] c"get-output-string\00"
@.str.lit.82 = private unnamed_addr constant [19 x i8] c"not an output port\00"
@.str.lit.83 = private unnamed_addr constant [18 x i8] c"not a string port\00"
@.str.sym.84 = private unnamed_addr constant [18 x i8] c"flush-output-port\00"
@.str.sym.85 = private unnamed_addr constant [11 x i8] c"close-port\00"
@.str.lit.86 = private unnamed_addr constant [11 x i8] c"not a port\00"
@.str.sym.87 = private unnamed_addr constant [17 x i8] c"close-input-port\00"
@.str.lit.88 = private unnamed_addr constant [18 x i8] c"not an input port\00"
@.str.sym.89 = private unnamed_addr constant [18 x i8] c"close-output-port\00"
@.str.lit.90 = private unnamed_addr constant [19 x i8] c"not an output port\00"
@"emit.internal:rd-number" = external global i64
@"emit.internal:rd-fail-pos" = external global i64
@"emit.internal:rd-token-at" = external global i64
@"emit.internal:rd-state" = external global i64
@"emit.internal:rd-finish" = external global i64
@"emit.internal:rd-datum" = external global i64
@"emit.internal:rd-skip-ws" = external global i64
@"emit.internal:rd-fail?" = external global i64
@"emit.internal:rd-state-child" = external global i64
@"emit.internal:%port-rtd" = external global i64
@"emit.internal:%make-port" = external global i64
@"emit.internal:%port-buf" = external global i64
declare fastcc i64 @"emit.internal:code:rd-number"(i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, ptr)
declare fastcc i64 @"emit.internal:code:rd-fail-pos"(i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, ptr)
declare fastcc i64 @"emit.internal:code:rd-token-at"(i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, ptr)
declare fastcc i64 @"emit.internal:code:rd-state"(i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, ptr)
declare fastcc i64 @"emit.internal:code:rd-finish"(i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, ptr)
declare fastcc i64 @"emit.internal:code:rd-datum"(i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, ptr)
declare fastcc i64 @"emit.internal:code:rd-skip-ws"(i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, ptr)
declare fastcc i64 @"emit.internal:code:rd-fail?"(i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, ptr)
declare fastcc i64 @"emit.internal:code:rd-state-child"(i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, ptr)
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
@"scheme.base:%raise-kinded" = global i64 0
@"scheme.base:error" = global i64 0
@"scheme.base:%read-error" = global i64 0
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
@"scheme.base:read-error?" = global i64 0
@"scheme.base:file-error?" = global i64 0
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

define fastcc i64 @"min-entry:$scheme.base$ccode$clist"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  ret i64 2
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

define fastcc i64 @"min-entry:$scheme.base$ccode$cappend"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t153 = call i64 @rt_null_p(i64 2)
  %t154 = icmp ne i64 %t153, 1
  br i1 %t154, label %then36, label %else37
then36:
  ret i64 2
else37:
  %t155 = call i64 @rt_cdr(i64 2)
  %t156 = call i64 @rt_null_p(i64 %t155)
  %t157 = icmp ne i64 %t156, 1
  br i1 %t157, label %then38, label %else39
then38:
  %t158 = call i64 @rt_car(i64 2)
  ret i64 %t158
else39:
  %t159 = call i64 @rt_car(i64 2)
  %t160 = call i64 @rt_cdr(i64 2)
  %t161 = load i64, ptr @"scheme.base:append"
  call void @rt_check_callable(i64 %t161)
  %t162 = and i64 %t161, -8
  %t163 = inttoptr i64 %t162 to ptr
  %t164 = load i64, ptr %t163
  %t165 = inttoptr i64 %t164 to ptr
  %t166 = call i64 @rt_list_length(i64 %t160)
  %t167 = add i64 0, %t166
  %t168 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t160, i64 8)
  %t180 = getelementptr i64, ptr %t168, i64 0
  %t172 = load i64, ptr %t180
  %t181 = getelementptr i64, ptr %t168, i64 1
  %t173 = load i64, ptr %t181
  %t182 = getelementptr i64, ptr %t168, i64 2
  %t174 = load i64, ptr %t182
  %t183 = getelementptr i64, ptr %t168, i64 3
  %t175 = load i64, ptr %t183
  %t184 = getelementptr i64, ptr %t168, i64 4
  %t176 = load i64, ptr %t184
  %t185 = getelementptr i64, ptr %t168, i64 5
  %t177 = load i64, ptr %t185
  %t186 = getelementptr i64, ptr %t168, i64 6
  %t178 = load i64, ptr %t186
  %t187 = getelementptr i64, ptr %t168, i64 7
  %t179 = load i64, ptr %t187
  %t169 = icmp sgt i64 %t167, 8
  %t170 = getelementptr i64, ptr %t168, i64 8
  %t171 = select i1 %t169, ptr %t170, ptr null
  %t188 = call fastcc i64%t165(i64 %t161, i64 %t167, i64 %t172, i64 %t173, i64 %t174, i64 %t175, i64 %t176, i64 %t177, i64 %t178, i64 %t179, ptr %t171)
  %t189 = load i64, ptr @"scheme.base:%append2"
  call void @rt_check_callable(i64 %t189)
  %t190 = and i64 %t189, -8
  %t191 = inttoptr i64 %t190 to ptr
  %t192 = load i64, ptr %t191
  %t193 = inttoptr i64 %t192 to ptr
  %t194 = musttail call fastcc i64 %t193(i64 %t189, i64 2, i64 %t159, i64 %t188, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t194
}

define fastcc i64 @"scheme.base:code:%map1"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t199 = icmp eq i64 %argc, 2
  br i1 %t199, label %argok41, label %arityerr40
arityerr40:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok41:
  %t200 = call i64 @rt_null_p(i64 %a1)
  %t201 = icmp ne i64 %t200, 1
  br i1 %t201, label %then42, label %else43
then42:
  ret i64 2
else43:
  %t202 = call i64 @rt_car(i64 %a1)
  call void @rt_check_callable(i64 %a0)
  %t203 = and i64 %a0, -8
  %t204 = inttoptr i64 %t203 to ptr
  %t205 = load i64, ptr %t204
  %t206 = inttoptr i64 %t205 to ptr
  %t207 = call fastcc i64%t206(i64 %a0, i64 1, i64 %t202, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t208 = call i64 @rt_cdr(i64 %a1)
  %t209 = load i64, ptr @"scheme.base:%map1"
  call void @rt_check_callable(i64 %t209)
  %t210 = and i64 %t209, -8
  %t211 = inttoptr i64 %t210 to ptr
  %t212 = load i64, ptr %t211
  %t213 = inttoptr i64 %t212 to ptr
  %t214 = call fastcc i64%t213(i64 %t209, i64 2, i64 %a0, i64 %t208, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t215 = call i64 @rt_cons(i64 %t207, i64 %t214)
  ret i64 %t215
}

define fastcc i64 @"scheme.base:code:%any-null?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t220 = icmp eq i64 %argc, 1
  br i1 %t220, label %argok45, label %arityerr44
arityerr44:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok45:
  %t221 = call i64 @rt_null_p(i64 %a0)
  %t222 = icmp ne i64 %t221, 1
  br i1 %t222, label %then46, label %else47
then46:
  ret i64 1
else47:
  %t223 = call i64 @rt_car(i64 %a0)
  %t224 = call i64 @rt_null_p(i64 %t223)
  %t225 = icmp ne i64 %t224, 1
  br i1 %t225, label %then48, label %else49
then48:
  ret i64 257
else49:
  %t226 = call i64 @rt_cdr(i64 %a0)
  %t227 = load i64, ptr @"scheme.base:%any-null?"
  call void @rt_check_callable(i64 %t227)
  %t228 = and i64 %t227, -8
  %t229 = inttoptr i64 %t228 to ptr
  %t230 = load i64, ptr %t229
  %t231 = inttoptr i64 %t230 to ptr
  %t232 = musttail call fastcc i64 %t231(i64 %t227, i64 1, i64 %t226, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t232
}

define fastcc i64 @"scheme.base:code_39"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t237 = icmp eq i64 %argc, 1
  br i1 %t237, label %argok51, label %arityerr50
arityerr50:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok51:
  %t238 = call i64 @rt_car(i64 %a0)
  ret i64 %t238
}

define fastcc i64 @"scheme.base:code_41"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t239 = icmp eq i64 %argc, 1
  br i1 %t239, label %argok53, label %arityerr52
arityerr52:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok53:
  %t240 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t240
}

define fastcc i64 @"scheme.base:code:%mapn"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t241 = icmp eq i64 %argc, 2
  br i1 %t241, label %argok55, label %arityerr54
arityerr54:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok55:
  %t242 = load i64, ptr @"scheme.base:%any-null?"
  call void @rt_check_callable(i64 %t242)
  %t243 = and i64 %t242, -8
  %t244 = inttoptr i64 %t243 to ptr
  %t245 = load i64, ptr %t244
  %t246 = inttoptr i64 %t245 to ptr
  %t247 = call fastcc i64%t246(i64 %t242, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t248 = icmp ne i64 %t247, 1
  br i1 %t248, label %then56, label %else57
then56:
  ret i64 2
else57:
  %t249 = call ptr @rt_alloc_words(i64 1)
  %t250 = ptrtoint ptr %t249 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_39" to i64), ptr %t249
  %t251 = or i64 %t250, 4
  %t252 = load i64, ptr @"scheme.base:%map1"
  call void @rt_check_callable(i64 %t252)
  %t253 = and i64 %t252, -8
  %t254 = inttoptr i64 %t253 to ptr
  %t255 = load i64, ptr %t254
  %t256 = inttoptr i64 %t255 to ptr
  %t257 = call fastcc i64%t256(i64 %t252, i64 2, i64 %t251, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  call void @rt_check_callable(i64 %a0)
  %t258 = and i64 %a0, -8
  %t259 = inttoptr i64 %t258 to ptr
  %t260 = load i64, ptr %t259
  %t261 = inttoptr i64 %t260 to ptr
  %t262 = call i64 @rt_list_length(i64 %t257)
  %t263 = add i64 0, %t262
  %t264 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t257, i64 8)
  %t276 = getelementptr i64, ptr %t264, i64 0
  %t268 = load i64, ptr %t276
  %t277 = getelementptr i64, ptr %t264, i64 1
  %t269 = load i64, ptr %t277
  %t278 = getelementptr i64, ptr %t264, i64 2
  %t270 = load i64, ptr %t278
  %t279 = getelementptr i64, ptr %t264, i64 3
  %t271 = load i64, ptr %t279
  %t280 = getelementptr i64, ptr %t264, i64 4
  %t272 = load i64, ptr %t280
  %t281 = getelementptr i64, ptr %t264, i64 5
  %t273 = load i64, ptr %t281
  %t282 = getelementptr i64, ptr %t264, i64 6
  %t274 = load i64, ptr %t282
  %t283 = getelementptr i64, ptr %t264, i64 7
  %t275 = load i64, ptr %t283
  %t265 = icmp sgt i64 %t263, 8
  %t266 = getelementptr i64, ptr %t264, i64 8
  %t267 = select i1 %t265, ptr %t266, ptr null
  %t284 = call fastcc i64%t261(i64 %a0, i64 %t263, i64 %t268, i64 %t269, i64 %t270, i64 %t271, i64 %t272, i64 %t273, i64 %t274, i64 %t275, ptr %t267)
  %t285 = call ptr @rt_alloc_words(i64 1)
  %t286 = ptrtoint ptr %t285 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_41" to i64), ptr %t285
  %t287 = or i64 %t286, 4
  %t288 = load i64, ptr @"scheme.base:%map1"
  call void @rt_check_callable(i64 %t288)
  %t289 = and i64 %t288, -8
  %t290 = inttoptr i64 %t289 to ptr
  %t291 = load i64, ptr %t290
  %t292 = inttoptr i64 %t291 to ptr
  %t293 = call fastcc i64%t292(i64 %t288, i64 2, i64 %t287, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t294 = load i64, ptr @"scheme.base:%mapn"
  call void @rt_check_callable(i64 %t294)
  %t295 = and i64 %t294, -8
  %t296 = inttoptr i64 %t295 to ptr
  %t297 = load i64, ptr %t296
  %t298 = inttoptr i64 %t297 to ptr
  %t299 = call fastcc i64%t298(i64 %t294, i64 2, i64 %a0, i64 %t293, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t300 = call i64 @rt_cons(i64 %t284, i64 %t299)
  ret i64 %t300
}

define fastcc i64 @"scheme.base:code:map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t305 = icmp sge i64 %argc, 2
  br i1 %t305, label %argok59, label %arityerr58
arityerr58:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok59:
  %t306 = call ptr @rt_alloc_words(i64 8)
  %t307 = getelementptr i64, ptr %t306, i64 0
  store i64 %a0, ptr %t307
  %t308 = getelementptr i64, ptr %t306, i64 1
  store i64 %a1, ptr %t308
  %t309 = getelementptr i64, ptr %t306, i64 2
  store i64 %a2, ptr %t309
  %t310 = getelementptr i64, ptr %t306, i64 3
  store i64 %a3, ptr %t310
  %t311 = getelementptr i64, ptr %t306, i64 4
  store i64 %a4, ptr %t311
  %t312 = getelementptr i64, ptr %t306, i64 5
  store i64 %a5, ptr %t312
  %t313 = getelementptr i64, ptr %t306, i64 6
  store i64 %a6, ptr %t313
  %t314 = getelementptr i64, ptr %t306, i64 7
  store i64 %a7, ptr %t314
  %t315 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t306, ptr %overflow)
  %t316 = call i64 @rt_null_p(i64 %t315)
  %t317 = icmp ne i64 %t316, 1
  br i1 %t317, label %then60, label %else61
then60:
  %t318 = load i64, ptr @"scheme.base:%map1"
  call void @rt_check_callable(i64 %t318)
  %t319 = and i64 %t318, -8
  %t320 = inttoptr i64 %t319 to ptr
  %t321 = load i64, ptr %t320
  %t322 = inttoptr i64 %t321 to ptr
  %t323 = musttail call fastcc i64 %t322(i64 %t318, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t323
else61:
  %t324 = call i64 @rt_cons(i64 %a1, i64 %t315)
  %t325 = load i64, ptr @"scheme.base:%mapn"
  call void @rt_check_callable(i64 %t325)
  %t326 = and i64 %t325, -8
  %t327 = inttoptr i64 %t326 to ptr
  %t328 = load i64, ptr %t327
  %t329 = inttoptr i64 %t328 to ptr
  %t330 = musttail call fastcc i64 %t329(i64 %t325, i64 2, i64 %a0, i64 %t324, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t330
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cmap"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t331 = call i64 @rt_null_p(i64 2)
  %t332 = icmp ne i64 %t331, 1
  br i1 %t332, label %then62, label %else63
then62:
  %t333 = load i64, ptr @"scheme.base:%map1"
  call void @rt_check_callable(i64 %t333)
  %t334 = and i64 %t333, -8
  %t335 = inttoptr i64 %t334 to ptr
  %t336 = load i64, ptr %t335
  %t337 = inttoptr i64 %t336 to ptr
  %t338 = musttail call fastcc i64 %t337(i64 %t333, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t338
else63:
  %t339 = call i64 @rt_cons(i64 %a1, i64 2)
  %t340 = load i64, ptr @"scheme.base:%mapn"
  call void @rt_check_callable(i64 %t340)
  %t341 = and i64 %t340, -8
  %t342 = inttoptr i64 %t341 to ptr
  %t343 = load i64, ptr %t342
  %t344 = inttoptr i64 %t343 to ptr
  %t345 = musttail call fastcc i64 %t344(i64 %t340, i64 2, i64 %a0, i64 %t339, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t345
}

define fastcc i64 @"scheme.base:code:memq"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t350 = icmp eq i64 %argc, 2
  br i1 %t350, label %argok65, label %arityerr64
arityerr64:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok65:
  %t351 = call i64 @rt_null_p(i64 %a1)
  %t352 = icmp ne i64 %t351, 1
  br i1 %t352, label %then66, label %else67
then66:
  ret i64 1
else67:
  %t353 = call i64 @rt_car(i64 %a1)
  %t354 = call i64 @rt_eq_p(i64 %a0, i64 %t353)
  %t355 = icmp ne i64 %t354, 1
  br i1 %t355, label %then68, label %else69
then68:
  ret i64 %a1
else69:
  %t356 = call i64 @rt_cdr(i64 %a1)
  %t357 = load i64, ptr @"scheme.base:memq"
  call void @rt_check_callable(i64 %t357)
  %t358 = and i64 %t357, -8
  %t359 = inttoptr i64 %t358 to ptr
  %t360 = load i64, ptr %t359
  %t361 = inttoptr i64 %t360 to ptr
  %t362 = musttail call fastcc i64 %t361(i64 %t357, i64 2, i64 %a0, i64 %t356, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t362
}

define fastcc i64 @"scheme.base:code:memv"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t367 = icmp eq i64 %argc, 2
  br i1 %t367, label %argok71, label %arityerr70
arityerr70:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok71:
  %t368 = call i64 @rt_null_p(i64 %a1)
  %t369 = icmp ne i64 %t368, 1
  br i1 %t369, label %then72, label %else73
then72:
  ret i64 1
else73:
  %t370 = call i64 @rt_car(i64 %a1)
  %t371 = call i64 @rt_eqv_p(i64 %a0, i64 %t370)
  %t372 = icmp ne i64 %t371, 1
  br i1 %t372, label %then74, label %else75
then74:
  ret i64 %a1
else75:
  %t373 = call i64 @rt_cdr(i64 %a1)
  %t374 = load i64, ptr @"scheme.base:memv"
  call void @rt_check_callable(i64 %t374)
  %t375 = and i64 %t374, -8
  %t376 = inttoptr i64 %t375 to ptr
  %t377 = load i64, ptr %t376
  %t378 = inttoptr i64 %t377 to ptr
  %t379 = musttail call fastcc i64 %t378(i64 %t374, i64 2, i64 %a0, i64 %t373, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t379
}

define fastcc i64 @"scheme.base:code:assq"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t384 = icmp eq i64 %argc, 2
  br i1 %t384, label %argok77, label %arityerr76
arityerr76:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok77:
  %t385 = call i64 @rt_null_p(i64 %a1)
  %t386 = icmp ne i64 %t385, 1
  br i1 %t386, label %then78, label %else79
then78:
  ret i64 1
else79:
  %t387 = call i64 @rt_car(i64 %a1)
  %t388 = call i64 @rt_car(i64 %t387)
  %t389 = call i64 @rt_eq_p(i64 %a0, i64 %t388)
  %t390 = icmp ne i64 %t389, 1
  br i1 %t390, label %then80, label %else81
then80:
  %t391 = call i64 @rt_car(i64 %a1)
  ret i64 %t391
else81:
  %t392 = call i64 @rt_cdr(i64 %a1)
  %t393 = load i64, ptr @"scheme.base:assq"
  call void @rt_check_callable(i64 %t393)
  %t394 = and i64 %t393, -8
  %t395 = inttoptr i64 %t394 to ptr
  %t396 = load i64, ptr %t395
  %t397 = inttoptr i64 %t396 to ptr
  %t398 = musttail call fastcc i64 %t397(i64 %t393, i64 2, i64 %a0, i64 %t392, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t398
}

define fastcc i64 @"scheme.base:code:member"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t403 = icmp sge i64 %argc, 2
  br i1 %t403, label %argok83, label %arityerr82
arityerr82:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok83:
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
  br i1 %t415, label %then84, label %else85
then84:
  %t416 = call i64 @rt_null_p(i64 %a1)
  %t417 = icmp ne i64 %t416, 1
  br i1 %t417, label %then86, label %else87
then86:
  ret i64 1
else87:
  %t418 = call i64 @rt_car(i64 %a1)
  %t419 = call i64 @rt_equal(i64 %a0, i64 %t418)
  %t420 = icmp ne i64 %t419, 1
  br i1 %t420, label %then88, label %else89
then88:
  ret i64 %a1
else89:
  %t421 = call i64 @rt_cdr(i64 %a1)
  %t422 = load i64, ptr @"scheme.base:member"
  call void @rt_check_callable(i64 %t422)
  %t423 = and i64 %t422, -8
  %t424 = inttoptr i64 %t423 to ptr
  %t425 = load i64, ptr %t424
  %t426 = inttoptr i64 %t425 to ptr
  %t427 = musttail call fastcc i64 %t426(i64 %t422, i64 2, i64 %a0, i64 %t421, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t427
else85:
  %t428 = call i64 @rt_car(i64 %t413)
  %t429 = load i64, ptr @"scheme.base:member-by"
  call void @rt_check_callable(i64 %t429)
  %t430 = and i64 %t429, -8
  %t431 = inttoptr i64 %t430 to ptr
  %t432 = load i64, ptr %t431
  %t433 = inttoptr i64 %t432 to ptr
  %t434 = musttail call fastcc i64 %t433(i64 %t429, i64 3, i64 %a0, i64 %a1, i64 %t428, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t434
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cmember"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t435 = call i64 @rt_null_p(i64 2)
  %t436 = icmp ne i64 %t435, 1
  br i1 %t436, label %then90, label %else91
then90:
  %t437 = call i64 @rt_null_p(i64 %a1)
  %t438 = icmp ne i64 %t437, 1
  br i1 %t438, label %then92, label %else93
then92:
  ret i64 1
else93:
  %t439 = call i64 @rt_car(i64 %a1)
  %t440 = call i64 @rt_equal(i64 %a0, i64 %t439)
  %t441 = icmp ne i64 %t440, 1
  br i1 %t441, label %then94, label %else95
then94:
  ret i64 %a1
else95:
  %t442 = call i64 @rt_cdr(i64 %a1)
  %t443 = load i64, ptr @"scheme.base:member"
  call void @rt_check_callable(i64 %t443)
  %t444 = and i64 %t443, -8
  %t445 = inttoptr i64 %t444 to ptr
  %t446 = load i64, ptr %t445
  %t447 = inttoptr i64 %t446 to ptr
  %t448 = musttail call fastcc i64 %t447(i64 %t443, i64 2, i64 %a0, i64 %t442, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t448
else91:
  %t449 = call i64 @rt_car(i64 2)
  %t450 = load i64, ptr @"scheme.base:member-by"
  call void @rt_check_callable(i64 %t450)
  %t451 = and i64 %t450, -8
  %t452 = inttoptr i64 %t451 to ptr
  %t453 = load i64, ptr %t452
  %t454 = inttoptr i64 %t453 to ptr
  %t455 = musttail call fastcc i64 %t454(i64 %t450, i64 3, i64 %a0, i64 %a1, i64 %t449, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t455
}

define fastcc i64 @"scheme.base:code:member-by"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t460 = icmp eq i64 %argc, 3
  br i1 %t460, label %argok97, label %arityerr96
arityerr96:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok97:
  %t461 = call i64 @rt_null_p(i64 %a1)
  %t462 = icmp ne i64 %t461, 1
  br i1 %t462, label %then98, label %else99
then98:
  ret i64 1
else99:
  %t463 = call i64 @rt_car(i64 %a1)
  call void @rt_check_callable(i64 %a2)
  %t464 = and i64 %a2, -8
  %t465 = inttoptr i64 %t464 to ptr
  %t466 = load i64, ptr %t465
  %t467 = inttoptr i64 %t466 to ptr
  %t468 = call fastcc i64%t467(i64 %a2, i64 2, i64 %a0, i64 %t463, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t469 = icmp ne i64 %t468, 1
  br i1 %t469, label %then100, label %else101
then100:
  ret i64 %a1
else101:
  %t470 = call i64 @rt_cdr(i64 %a1)
  %t471 = load i64, ptr @"scheme.base:member-by"
  call void @rt_check_callable(i64 %t471)
  %t472 = and i64 %t471, -8
  %t473 = inttoptr i64 %t472 to ptr
  %t474 = load i64, ptr %t473
  %t475 = inttoptr i64 %t474 to ptr
  %t476 = musttail call fastcc i64 %t475(i64 %t471, i64 3, i64 %a0, i64 %t470, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t476
}

define fastcc i64 @"scheme.base:code:assoc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t481 = icmp sge i64 %argc, 2
  br i1 %t481, label %argok103, label %arityerr102
arityerr102:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok103:
  %t482 = call ptr @rt_alloc_words(i64 8)
  %t483 = getelementptr i64, ptr %t482, i64 0
  store i64 %a0, ptr %t483
  %t484 = getelementptr i64, ptr %t482, i64 1
  store i64 %a1, ptr %t484
  %t485 = getelementptr i64, ptr %t482, i64 2
  store i64 %a2, ptr %t485
  %t486 = getelementptr i64, ptr %t482, i64 3
  store i64 %a3, ptr %t486
  %t487 = getelementptr i64, ptr %t482, i64 4
  store i64 %a4, ptr %t487
  %t488 = getelementptr i64, ptr %t482, i64 5
  store i64 %a5, ptr %t488
  %t489 = getelementptr i64, ptr %t482, i64 6
  store i64 %a6, ptr %t489
  %t490 = getelementptr i64, ptr %t482, i64 7
  store i64 %a7, ptr %t490
  %t491 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t482, ptr %overflow)
  %t492 = call i64 @rt_null_p(i64 %t491)
  %t493 = icmp ne i64 %t492, 1
  br i1 %t493, label %then104, label %else105
then104:
  %t494 = call i64 @rt_null_p(i64 %a1)
  %t495 = icmp ne i64 %t494, 1
  br i1 %t495, label %then106, label %else107
then106:
  ret i64 1
else107:
  %t496 = call i64 @rt_car(i64 %a1)
  %t497 = call i64 @rt_car(i64 %t496)
  %t498 = call i64 @rt_equal(i64 %a0, i64 %t497)
  %t499 = icmp ne i64 %t498, 1
  br i1 %t499, label %then108, label %else109
then108:
  %t500 = call i64 @rt_car(i64 %a1)
  ret i64 %t500
else109:
  %t501 = call i64 @rt_cdr(i64 %a1)
  %t502 = load i64, ptr @"scheme.base:assoc"
  call void @rt_check_callable(i64 %t502)
  %t503 = and i64 %t502, -8
  %t504 = inttoptr i64 %t503 to ptr
  %t505 = load i64, ptr %t504
  %t506 = inttoptr i64 %t505 to ptr
  %t507 = musttail call fastcc i64 %t506(i64 %t502, i64 2, i64 %a0, i64 %t501, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t507
else105:
  %t508 = call i64 @rt_car(i64 %t491)
  %t509 = load i64, ptr @"scheme.base:assoc-by"
  call void @rt_check_callable(i64 %t509)
  %t510 = and i64 %t509, -8
  %t511 = inttoptr i64 %t510 to ptr
  %t512 = load i64, ptr %t511
  %t513 = inttoptr i64 %t512 to ptr
  %t514 = musttail call fastcc i64 %t513(i64 %t509, i64 3, i64 %a0, i64 %a1, i64 %t508, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t514
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cassoc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t515 = call i64 @rt_null_p(i64 2)
  %t516 = icmp ne i64 %t515, 1
  br i1 %t516, label %then110, label %else111
then110:
  %t517 = call i64 @rt_null_p(i64 %a1)
  %t518 = icmp ne i64 %t517, 1
  br i1 %t518, label %then112, label %else113
then112:
  ret i64 1
else113:
  %t519 = call i64 @rt_car(i64 %a1)
  %t520 = call i64 @rt_car(i64 %t519)
  %t521 = call i64 @rt_equal(i64 %a0, i64 %t520)
  %t522 = icmp ne i64 %t521, 1
  br i1 %t522, label %then114, label %else115
then114:
  %t523 = call i64 @rt_car(i64 %a1)
  ret i64 %t523
else115:
  %t524 = call i64 @rt_cdr(i64 %a1)
  %t525 = load i64, ptr @"scheme.base:assoc"
  call void @rt_check_callable(i64 %t525)
  %t526 = and i64 %t525, -8
  %t527 = inttoptr i64 %t526 to ptr
  %t528 = load i64, ptr %t527
  %t529 = inttoptr i64 %t528 to ptr
  %t530 = musttail call fastcc i64 %t529(i64 %t525, i64 2, i64 %a0, i64 %t524, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t530
else111:
  %t531 = call i64 @rt_car(i64 2)
  %t532 = load i64, ptr @"scheme.base:assoc-by"
  call void @rt_check_callable(i64 %t532)
  %t533 = and i64 %t532, -8
  %t534 = inttoptr i64 %t533 to ptr
  %t535 = load i64, ptr %t534
  %t536 = inttoptr i64 %t535 to ptr
  %t537 = musttail call fastcc i64 %t536(i64 %t532, i64 3, i64 %a0, i64 %a1, i64 %t531, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t537
}

define fastcc i64 @"scheme.base:code:assoc-by"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t542 = icmp eq i64 %argc, 3
  br i1 %t542, label %argok117, label %arityerr116
arityerr116:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok117:
  %t543 = call i64 @rt_null_p(i64 %a1)
  %t544 = icmp ne i64 %t543, 1
  br i1 %t544, label %then118, label %else119
then118:
  ret i64 1
else119:
  %t545 = call i64 @rt_car(i64 %a1)
  %t546 = call i64 @rt_car(i64 %t545)
  call void @rt_check_callable(i64 %a2)
  %t547 = and i64 %a2, -8
  %t548 = inttoptr i64 %t547 to ptr
  %t549 = load i64, ptr %t548
  %t550 = inttoptr i64 %t549 to ptr
  %t551 = call fastcc i64%t550(i64 %a2, i64 2, i64 %a0, i64 %t546, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t552 = icmp ne i64 %t551, 1
  br i1 %t552, label %then120, label %else121
then120:
  %t553 = call i64 @rt_car(i64 %a1)
  ret i64 %t553
else121:
  %t554 = call i64 @rt_cdr(i64 %a1)
  %t555 = load i64, ptr @"scheme.base:assoc-by"
  call void @rt_check_callable(i64 %t555)
  %t556 = and i64 %t555, -8
  %t557 = inttoptr i64 %t556 to ptr
  %t558 = load i64, ptr %t557
  %t559 = inttoptr i64 %t558 to ptr
  %t560 = musttail call fastcc i64 %t559(i64 %t555, i64 3, i64 %a0, i64 %t554, i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t560
}

define fastcc i64 @"scheme.base:code:filter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t565 = icmp eq i64 %argc, 2
  br i1 %t565, label %argok123, label %arityerr122
arityerr122:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok123:
  %t566 = call i64 @rt_null_p(i64 %a1)
  %t567 = icmp ne i64 %t566, 1
  br i1 %t567, label %then124, label %else125
then124:
  ret i64 2
else125:
  %t568 = call i64 @rt_car(i64 %a1)
  call void @rt_check_callable(i64 %a0)
  %t569 = and i64 %a0, -8
  %t570 = inttoptr i64 %t569 to ptr
  %t571 = load i64, ptr %t570
  %t572 = inttoptr i64 %t571 to ptr
  %t573 = call fastcc i64%t572(i64 %a0, i64 1, i64 %t568, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t574 = icmp ne i64 %t573, 1
  br i1 %t574, label %then126, label %else127
then126:
  %t575 = call i64 @rt_car(i64 %a1)
  %t576 = call i64 @rt_cdr(i64 %a1)
  %t577 = load i64, ptr @"scheme.base:filter"
  call void @rt_check_callable(i64 %t577)
  %t578 = and i64 %t577, -8
  %t579 = inttoptr i64 %t578 to ptr
  %t580 = load i64, ptr %t579
  %t581 = inttoptr i64 %t580 to ptr
  %t582 = call fastcc i64%t581(i64 %t577, i64 2, i64 %a0, i64 %t576, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t583 = call i64 @rt_cons(i64 %t575, i64 %t582)
  ret i64 %t583
else127:
  %t584 = call i64 @rt_cdr(i64 %a1)
  %t585 = load i64, ptr @"scheme.base:filter"
  call void @rt_check_callable(i64 %t585)
  %t586 = and i64 %t585, -8
  %t587 = inttoptr i64 %t586 to ptr
  %t588 = load i64, ptr %t587
  %t589 = inttoptr i64 %t588 to ptr
  %t590 = musttail call fastcc i64 %t589(i64 %t585, i64 2, i64 %a0, i64 %t584, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t590
}

define fastcc i64 @"scheme.base:code:fold-left"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t595 = icmp eq i64 %argc, 3
  br i1 %t595, label %argok129, label %arityerr128
arityerr128:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok129:
  %t596 = call i64 @rt_null_p(i64 %a2)
  %t597 = icmp ne i64 %t596, 1
  br i1 %t597, label %then130, label %else131
then130:
  ret i64 %a1
else131:
  %t598 = call i64 @rt_car(i64 %a2)
  call void @rt_check_callable(i64 %a0)
  %t599 = and i64 %a0, -8
  %t600 = inttoptr i64 %t599 to ptr
  %t601 = load i64, ptr %t600
  %t602 = inttoptr i64 %t601 to ptr
  %t603 = call fastcc i64%t602(i64 %a0, i64 2, i64 %a1, i64 %t598, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t604 = call i64 @rt_cdr(i64 %a2)
  %t605 = load i64, ptr @"scheme.base:fold-left"
  call void @rt_check_callable(i64 %t605)
  %t606 = and i64 %t605, -8
  %t607 = inttoptr i64 %t606 to ptr
  %t608 = load i64, ptr %t607
  %t609 = inttoptr i64 %t608 to ptr
  %t610 = musttail call fastcc i64 %t609(i64 %t605, i64 3, i64 %a0, i64 %t603, i64 %t604, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t610
}

define fastcc i64 @"scheme.base:code:fold-right"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t615 = icmp eq i64 %argc, 3
  br i1 %t615, label %argok133, label %arityerr132
arityerr132:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok133:
  %t616 = call i64 @rt_null_p(i64 %a2)
  %t617 = icmp ne i64 %t616, 1
  br i1 %t617, label %then134, label %else135
then134:
  ret i64 %a1
else135:
  %t618 = call i64 @rt_car(i64 %a2)
  %t619 = call i64 @rt_cdr(i64 %a2)
  %t620 = load i64, ptr @"scheme.base:fold-right"
  call void @rt_check_callable(i64 %t620)
  %t621 = and i64 %t620, -8
  %t622 = inttoptr i64 %t621 to ptr
  %t623 = load i64, ptr %t622
  %t624 = inttoptr i64 %t623 to ptr
  %t625 = call fastcc i64%t624(i64 %t620, i64 3, i64 %a0, i64 %a1, i64 %t619, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  call void @rt_check_callable(i64 %a0)
  %t626 = and i64 %a0, -8
  %t627 = inttoptr i64 %t626 to ptr
  %t628 = load i64, ptr %t627
  %t629 = inttoptr i64 %t628 to ptr
  %t630 = musttail call fastcc i64 %t629(i64 %a0, i64 2, i64 %t618, i64 %t625, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t630
}

define fastcc i64 @"scheme.base:code:%for-each1"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t635 = icmp eq i64 %argc, 2
  br i1 %t635, label %argok137, label %arityerr136
arityerr136:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok137:
  %t636 = call i64 @rt_null_p(i64 %a1)
  %t637 = icmp ne i64 %t636, 1
  br i1 %t637, label %then138, label %else139
then138:
  %t638 = icmp ne i64 1, 1
  br i1 %t638, label %then140, label %else141
then140:
  ret i64 1
else141:
  ret i64 17
else139:
  %t639 = call i64 @rt_car(i64 %a1)
  call void @rt_check_callable(i64 %a0)
  %t640 = and i64 %a0, -8
  %t641 = inttoptr i64 %t640 to ptr
  %t642 = load i64, ptr %t641
  %t643 = inttoptr i64 %t642 to ptr
  %t644 = call fastcc i64%t643(i64 %a0, i64 1, i64 %t639, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t645 = call i64 @rt_cdr(i64 %a1)
  %t646 = load i64, ptr @"scheme.base:%for-each1"
  call void @rt_check_callable(i64 %t646)
  %t647 = and i64 %t646, -8
  %t648 = inttoptr i64 %t647 to ptr
  %t649 = load i64, ptr %t648
  %t650 = inttoptr i64 %t649 to ptr
  %t651 = musttail call fastcc i64 %t650(i64 %t646, i64 2, i64 %a0, i64 %t645, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t651
}

define fastcc i64 @"scheme.base:code_103"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t656 = icmp eq i64 %argc, 1
  br i1 %t656, label %argok143, label %arityerr142
arityerr142:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok143:
  %t657 = call i64 @rt_car(i64 %a0)
  ret i64 %t657
}

define fastcc i64 @"scheme.base:code_105"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t658 = icmp eq i64 %argc, 1
  br i1 %t658, label %argok145, label %arityerr144
arityerr144:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok145:
  %t659 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t659
}

define fastcc i64 @"scheme.base:code:%for-eachn"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t660 = icmp eq i64 %argc, 2
  br i1 %t660, label %argok147, label %arityerr146
arityerr146:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok147:
  %t661 = load i64, ptr @"scheme.base:%any-null?"
  call void @rt_check_callable(i64 %t661)
  %t662 = and i64 %t661, -8
  %t663 = inttoptr i64 %t662 to ptr
  %t664 = load i64, ptr %t663
  %t665 = inttoptr i64 %t664 to ptr
  %t666 = call fastcc i64%t665(i64 %t661, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t667 = icmp ne i64 %t666, 1
  br i1 %t667, label %then148, label %else149
then148:
  %t668 = icmp ne i64 1, 1
  br i1 %t668, label %then150, label %else151
then150:
  ret i64 1
else151:
  ret i64 17
else149:
  %t669 = call ptr @rt_alloc_words(i64 1)
  %t670 = ptrtoint ptr %t669 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_103" to i64), ptr %t669
  %t671 = or i64 %t670, 4
  %t672 = load i64, ptr @"scheme.base:%map1"
  call void @rt_check_callable(i64 %t672)
  %t673 = and i64 %t672, -8
  %t674 = inttoptr i64 %t673 to ptr
  %t675 = load i64, ptr %t674
  %t676 = inttoptr i64 %t675 to ptr
  %t677 = call fastcc i64%t676(i64 %t672, i64 2, i64 %t671, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  call void @rt_check_callable(i64 %a0)
  %t678 = and i64 %a0, -8
  %t679 = inttoptr i64 %t678 to ptr
  %t680 = load i64, ptr %t679
  %t681 = inttoptr i64 %t680 to ptr
  %t682 = call i64 @rt_list_length(i64 %t677)
  %t683 = add i64 0, %t682
  %t684 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t677, i64 8)
  %t696 = getelementptr i64, ptr %t684, i64 0
  %t688 = load i64, ptr %t696
  %t697 = getelementptr i64, ptr %t684, i64 1
  %t689 = load i64, ptr %t697
  %t698 = getelementptr i64, ptr %t684, i64 2
  %t690 = load i64, ptr %t698
  %t699 = getelementptr i64, ptr %t684, i64 3
  %t691 = load i64, ptr %t699
  %t700 = getelementptr i64, ptr %t684, i64 4
  %t692 = load i64, ptr %t700
  %t701 = getelementptr i64, ptr %t684, i64 5
  %t693 = load i64, ptr %t701
  %t702 = getelementptr i64, ptr %t684, i64 6
  %t694 = load i64, ptr %t702
  %t703 = getelementptr i64, ptr %t684, i64 7
  %t695 = load i64, ptr %t703
  %t685 = icmp sgt i64 %t683, 8
  %t686 = getelementptr i64, ptr %t684, i64 8
  %t687 = select i1 %t685, ptr %t686, ptr null
  %t704 = call fastcc i64%t681(i64 %a0, i64 %t683, i64 %t688, i64 %t689, i64 %t690, i64 %t691, i64 %t692, i64 %t693, i64 %t694, i64 %t695, ptr %t687)
  %t705 = call ptr @rt_alloc_words(i64 1)
  %t706 = ptrtoint ptr %t705 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_105" to i64), ptr %t705
  %t707 = or i64 %t706, 4
  %t708 = load i64, ptr @"scheme.base:%map1"
  call void @rt_check_callable(i64 %t708)
  %t709 = and i64 %t708, -8
  %t710 = inttoptr i64 %t709 to ptr
  %t711 = load i64, ptr %t710
  %t712 = inttoptr i64 %t711 to ptr
  %t713 = call fastcc i64%t712(i64 %t708, i64 2, i64 %t707, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t714 = load i64, ptr @"scheme.base:%for-eachn"
  call void @rt_check_callable(i64 %t714)
  %t715 = and i64 %t714, -8
  %t716 = inttoptr i64 %t715 to ptr
  %t717 = load i64, ptr %t716
  %t718 = inttoptr i64 %t717 to ptr
  %t719 = musttail call fastcc i64 %t718(i64 %t714, i64 2, i64 %a0, i64 %t713, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t719
}

define fastcc i64 @"scheme.base:code:for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t724 = icmp sge i64 %argc, 2
  br i1 %t724, label %argok153, label %arityerr152
arityerr152:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok153:
  %t725 = call ptr @rt_alloc_words(i64 8)
  %t726 = getelementptr i64, ptr %t725, i64 0
  store i64 %a0, ptr %t726
  %t727 = getelementptr i64, ptr %t725, i64 1
  store i64 %a1, ptr %t727
  %t728 = getelementptr i64, ptr %t725, i64 2
  store i64 %a2, ptr %t728
  %t729 = getelementptr i64, ptr %t725, i64 3
  store i64 %a3, ptr %t729
  %t730 = getelementptr i64, ptr %t725, i64 4
  store i64 %a4, ptr %t730
  %t731 = getelementptr i64, ptr %t725, i64 5
  store i64 %a5, ptr %t731
  %t732 = getelementptr i64, ptr %t725, i64 6
  store i64 %a6, ptr %t732
  %t733 = getelementptr i64, ptr %t725, i64 7
  store i64 %a7, ptr %t733
  %t734 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t725, ptr %overflow)
  %t735 = call i64 @rt_null_p(i64 %t734)
  %t736 = icmp ne i64 %t735, 1
  br i1 %t736, label %then154, label %else155
then154:
  %t737 = load i64, ptr @"scheme.base:%for-each1"
  call void @rt_check_callable(i64 %t737)
  %t738 = and i64 %t737, -8
  %t739 = inttoptr i64 %t738 to ptr
  %t740 = load i64, ptr %t739
  %t741 = inttoptr i64 %t740 to ptr
  %t742 = musttail call fastcc i64 %t741(i64 %t737, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t742
else155:
  %t743 = call i64 @rt_cons(i64 %a1, i64 %t734)
  %t744 = load i64, ptr @"scheme.base:%for-eachn"
  call void @rt_check_callable(i64 %t744)
  %t745 = and i64 %t744, -8
  %t746 = inttoptr i64 %t745 to ptr
  %t747 = load i64, ptr %t746
  %t748 = inttoptr i64 %t747 to ptr
  %t749 = musttail call fastcc i64 %t748(i64 %t744, i64 2, i64 %a0, i64 %t743, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t749
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cfor-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t750 = call i64 @rt_null_p(i64 2)
  %t751 = icmp ne i64 %t750, 1
  br i1 %t751, label %then156, label %else157
then156:
  %t752 = load i64, ptr @"scheme.base:%for-each1"
  call void @rt_check_callable(i64 %t752)
  %t753 = and i64 %t752, -8
  %t754 = inttoptr i64 %t753 to ptr
  %t755 = load i64, ptr %t754
  %t756 = inttoptr i64 %t755 to ptr
  %t757 = musttail call fastcc i64 %t756(i64 %t752, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t757
else157:
  %t758 = call i64 @rt_cons(i64 %a1, i64 2)
  %t759 = load i64, ptr @"scheme.base:%for-eachn"
  call void @rt_check_callable(i64 %t759)
  %t760 = and i64 %t759, -8
  %t761 = inttoptr i64 %t760 to ptr
  %t762 = load i64, ptr %t761
  %t763 = inttoptr i64 %t762 to ptr
  %t764 = musttail call fastcc i64 %t763(i64 %t759, i64 2, i64 %a0, i64 %t758, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t764
}

define fastcc i64 @"scheme.base:code:andmap"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t769 = icmp eq i64 %argc, 2
  br i1 %t769, label %argok159, label %arityerr158
arityerr158:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok159:
  %t770 = call i64 @rt_null_p(i64 %a1)
  %t771 = icmp ne i64 %t770, 1
  br i1 %t771, label %then160, label %else161
then160:
  ret i64 257
else161:
  %t772 = call i64 @rt_car(i64 %a1)
  call void @rt_check_callable(i64 %a0)
  %t773 = and i64 %a0, -8
  %t774 = inttoptr i64 %t773 to ptr
  %t775 = load i64, ptr %t774
  %t776 = inttoptr i64 %t775 to ptr
  %t777 = call fastcc i64%t776(i64 %a0, i64 1, i64 %t772, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t778 = icmp ne i64 %t777, 1
  br i1 %t778, label %then162, label %else163
then162:
  %t779 = call i64 @rt_cdr(i64 %a1)
  %t780 = load i64, ptr @"scheme.base:andmap"
  call void @rt_check_callable(i64 %t780)
  %t781 = and i64 %t780, -8
  %t782 = inttoptr i64 %t781 to ptr
  %t783 = load i64, ptr %t782
  %t784 = inttoptr i64 %t783 to ptr
  %t785 = musttail call fastcc i64 %t784(i64 %t780, i64 2, i64 %a0, i64 %t779, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t785
else163:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:memp"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t790 = icmp eq i64 %argc, 2
  br i1 %t790, label %argok165, label %arityerr164
arityerr164:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok165:
  %t791 = call i64 @rt_null_p(i64 %a1)
  %t792 = icmp ne i64 %t791, 1
  br i1 %t792, label %then166, label %else167
then166:
  ret i64 1
else167:
  %t793 = call i64 @rt_car(i64 %a1)
  call void @rt_check_callable(i64 %a0)
  %t794 = and i64 %a0, -8
  %t795 = inttoptr i64 %t794 to ptr
  %t796 = load i64, ptr %t795
  %t797 = inttoptr i64 %t796 to ptr
  %t798 = call fastcc i64%t797(i64 %a0, i64 1, i64 %t793, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t799 = icmp ne i64 %t798, 1
  br i1 %t799, label %then168, label %else169
then168:
  ret i64 %a1
else169:
  %t800 = call i64 @rt_cdr(i64 %a1)
  %t801 = load i64, ptr @"scheme.base:memp"
  call void @rt_check_callable(i64 %t801)
  %t802 = and i64 %t801, -8
  %t803 = inttoptr i64 %t802 to ptr
  %t804 = load i64, ptr %t803
  %t805 = inttoptr i64 %t804 to ptr
  %t806 = musttail call fastcc i64 %t805(i64 %t801, i64 2, i64 %a0, i64 %t800, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t806
}

define fastcc i64 @"scheme.base:code_129"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t811 = icmp eq i64 %argc, 2
  br i1 %t811, label %argok171, label %arityerr170
arityerr170:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok171:
  %t812 = call i64 @rt_null_p(i64 %a1)
  %t813 = icmp ne i64 %t812, 1
  br i1 %t813, label %then172, label %else173
then172:
  ret i64 257
else173:
  %t814 = call i64 @rt_pair_p(i64 %a1)
  %t815 = call i64 @rt_not(i64 %t814)
  %t816 = icmp ne i64 %t815, 1
  br i1 %t816, label %then174, label %else175
then174:
  ret i64 1
else175:
  %t817 = call i64 @rt_cdr(i64 %a1)
  %t818 = call i64 @rt_null_p(i64 %t817)
  %t819 = icmp ne i64 %t818, 1
  br i1 %t819, label %then176, label %else177
then176:
  ret i64 257
else177:
  %t820 = call i64 @rt_pair_p(i64 %t817)
  %t821 = call i64 @rt_not(i64 %t820)
  %t822 = icmp ne i64 %t821, 1
  br i1 %t822, label %then178, label %else179
then178:
  ret i64 1
else179:
  %t823 = call i64 @rt_cdr(i64 %a0)
  %t824 = call i64 @rt_cdr(i64 %t817)
  %t825 = call i64 @rt_eq_p(i64 %t823, i64 %t824)
  %t826 = icmp ne i64 %t825, 1
  br i1 %t826, label %then180, label %else181
then180:
  ret i64 1
else181:
  %t827 = musttail call fastcc i64 @"scheme.base:code_129"(i64 %self, i64 2, i64 %t823, i64 %t824, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t827
}

define fastcc i64 @"scheme.base:code:list?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t828 = icmp eq i64 %argc, 1
  br i1 %t828, label %argok183, label %arityerr182
arityerr182:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok183:
  %t829 = call ptr @rt_alloc_words(i64 2)
  %t830 = ptrtoint ptr %t829 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_129" to i64), ptr %t829
  %t831 = or i64 %t830, 4
  %t832 = getelementptr i64, ptr %t829, i64 1
  store i64 %t831, ptr %t832
  %t833 = musttail call fastcc i64 @"scheme.base:code_129"(i64 %t831, i64 2, i64 %a0, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t833
}

define fastcc i64 @"scheme.base:code:zero?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t838 = icmp eq i64 %argc, 1
  br i1 %t838, label %argok185, label %arityerr184
arityerr184:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok185:
  %t839 = or i64 %a0, 0
  %t840 = and i64 %t839, 7
  %t841 = icmp eq i64 %t840, 0
  br i1 %t841, label %fixfast186, label %fixslow187
fixfast186:
  %t842 = icmp eq i64 %a0, 0
  %t843 = select i1 %t842, i64 257, i64 1
  br label %fixmerge188
fixslow187:
  %t844 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge188
fixmerge188:
  %t845 = phi i64 [ %t843, %fixfast186 ], [ %t844, %fixslow187 ]
  ret i64 %t845
}

define fastcc i64 @"scheme.base:code:list-tail"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t850 = icmp eq i64 %argc, 2
  br i1 %t850, label %argok190, label %arityerr189
arityerr189:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok190:
  %t851 = load i64, ptr @"scheme.base:zero?"
  call void @rt_check_callable(i64 %t851)
  %t852 = and i64 %t851, -8
  %t853 = inttoptr i64 %t852 to ptr
  %t854 = load i64, ptr %t853
  %t855 = inttoptr i64 %t854 to ptr
  %t856 = call fastcc i64%t855(i64 %t851, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t857 = icmp ne i64 %t856, 1
  br i1 %t857, label %then191, label %else192
then191:
  ret i64 %a0
else192:
  %t858 = call i64 @rt_cdr(i64 %a0)
  %t859 = or i64 %a1, 8
  %t860 = and i64 %t859, 7
  %t861 = icmp eq i64 %t860, 0
  br i1 %t861, label %fixfast193, label %fixslow194
fixfast193:
  %t862 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a1, i64 8)
  %t863 = extractvalue {i64, i1} %t862, 0
  %t864 = extractvalue {i64, i1} %t862, 1
  br i1 %t864, label %fixslow194, label %fixmerge195
fixslow194:
  %t865 = call i64 @rt_sub(i64 %a1, i64 8)
  br label %fixmerge195
fixmerge195:
  %t866 = phi i64 [ %t863, %fixfast193 ], [ %t865, %fixslow194 ]
  %t867 = load i64, ptr @"scheme.base:list-tail"
  call void @rt_check_callable(i64 %t867)
  %t868 = and i64 %t867, -8
  %t869 = inttoptr i64 %t868 to ptr
  %t870 = load i64, ptr %t869
  %t871 = inttoptr i64 %t870 to ptr
  %t872 = musttail call fastcc i64 %t871(i64 %t867, i64 2, i64 %t858, i64 %t866, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t872
}

define fastcc i64 @"scheme.base:code:list-ref"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t877 = icmp eq i64 %argc, 2
  br i1 %t877, label %argok197, label %arityerr196
arityerr196:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok197:
  %t878 = load i64, ptr @"scheme.base:list-tail"
  call void @rt_check_callable(i64 %t878)
  %t879 = and i64 %t878, -8
  %t880 = inttoptr i64 %t879 to ptr
  %t881 = load i64, ptr %t880
  %t882 = inttoptr i64 %t881 to ptr
  %t883 = call fastcc i64%t882(i64 %t878, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t884 = call i64 @rt_car(i64 %t883)
  ret i64 %t884
}

define fastcc i64 @"scheme.base:code:list-set!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t889 = icmp eq i64 %argc, 3
  br i1 %t889, label %argok199, label %arityerr198
arityerr198:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok199:
  %t890 = load i64, ptr @"scheme.base:list-tail"
  call void @rt_check_callable(i64 %t890)
  %t891 = and i64 %t890, -8
  %t892 = inttoptr i64 %t891 to ptr
  %t893 = load i64, ptr %t892
  %t894 = inttoptr i64 %t893 to ptr
  %t895 = call fastcc i64%t894(i64 %t890, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t896 = call i64 @rt_set_car(i64 %t895, i64 %a2)
  ret i64 %t896
}

define fastcc i64 @"scheme.base:code:list-head"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t901 = icmp eq i64 %argc, 2
  br i1 %t901, label %argok201, label %arityerr200
arityerr200:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok201:
  %t902 = load i64, ptr @"scheme.base:zero?"
  call void @rt_check_callable(i64 %t902)
  %t903 = and i64 %t902, -8
  %t904 = inttoptr i64 %t903 to ptr
  %t905 = load i64, ptr %t904
  %t906 = inttoptr i64 %t905 to ptr
  %t907 = call fastcc i64%t906(i64 %t902, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t908 = icmp ne i64 %t907, 1
  br i1 %t908, label %then202, label %else203
then202:
  ret i64 2
else203:
  %t909 = call i64 @rt_car(i64 %a0)
  %t910 = call i64 @rt_cdr(i64 %a0)
  %t911 = or i64 %a1, 8
  %t912 = and i64 %t911, 7
  %t913 = icmp eq i64 %t912, 0
  br i1 %t913, label %fixfast204, label %fixslow205
fixfast204:
  %t914 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a1, i64 8)
  %t915 = extractvalue {i64, i1} %t914, 0
  %t916 = extractvalue {i64, i1} %t914, 1
  br i1 %t916, label %fixslow205, label %fixmerge206
fixslow205:
  %t917 = call i64 @rt_sub(i64 %a1, i64 8)
  br label %fixmerge206
fixmerge206:
  %t918 = phi i64 [ %t915, %fixfast204 ], [ %t917, %fixslow205 ]
  %t919 = load i64, ptr @"scheme.base:list-head"
  call void @rt_check_callable(i64 %t919)
  %t920 = and i64 %t919, -8
  %t921 = inttoptr i64 %t920 to ptr
  %t922 = load i64, ptr %t921
  %t923 = inttoptr i64 %t922 to ptr
  %t924 = call fastcc i64%t923(i64 %t919, i64 2, i64 %t910, i64 %t918, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t925 = call i64 @rt_cons(i64 %t909, i64 %t924)
  ret i64 %t925
}

define fastcc i64 @"scheme.base:code:make-list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t930 = icmp eq i64 %argc, 2
  br i1 %t930, label %argok208, label %arityerr207
arityerr207:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok208:
  %t931 = load i64, ptr @"scheme.base:zero?"
  call void @rt_check_callable(i64 %t931)
  %t932 = and i64 %t931, -8
  %t933 = inttoptr i64 %t932 to ptr
  %t934 = load i64, ptr %t933
  %t935 = inttoptr i64 %t934 to ptr
  %t936 = call fastcc i64%t935(i64 %t931, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t937 = icmp ne i64 %t936, 1
  br i1 %t937, label %then209, label %else210
then209:
  ret i64 2
else210:
  %t938 = or i64 %a0, 8
  %t939 = and i64 %t938, 7
  %t940 = icmp eq i64 %t939, 0
  br i1 %t940, label %fixfast211, label %fixslow212
fixfast211:
  %t941 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t942 = extractvalue {i64, i1} %t941, 0
  %t943 = extractvalue {i64, i1} %t941, 1
  br i1 %t943, label %fixslow212, label %fixmerge213
fixslow212:
  %t944 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge213
fixmerge213:
  %t945 = phi i64 [ %t942, %fixfast211 ], [ %t944, %fixslow212 ]
  %t946 = load i64, ptr @"scheme.base:make-list"
  call void @rt_check_callable(i64 %t946)
  %t947 = and i64 %t946, -8
  %t948 = inttoptr i64 %t947 to ptr
  %t949 = load i64, ptr %t948
  %t950 = inttoptr i64 %t949 to ptr
  %t951 = call fastcc i64%t950(i64 %t946, i64 2, i64 %t945, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t952 = call i64 @rt_cons(i64 %a1, i64 %t951)
  ret i64 %t952
}

define fastcc i64 @"scheme.base:code_162"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t957 = icmp eq i64 %argc, 2
  br i1 %t957, label %argok215, label %arityerr214
arityerr214:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok215:
  %t958 = and i64 %self, -8
  %t959 = inttoptr i64 %t958 to ptr
  %t960 = getelementptr i64, ptr %t959, i64 1
  %t961 = load i64, ptr %t960
  %t962 = or i64 %a0, %t961
  %t963 = and i64 %t962, 7
  %t964 = icmp eq i64 %t963, 0
  br i1 %t964, label %fixfast216, label %fixslow217
fixfast216:
  %t965 = icmp eq i64 %a0, %t961
  %t966 = select i1 %t965, i64 257, i64 1
  br label %fixmerge218
fixslow217:
  %t967 = call i64 @rt_num_eq(i64 %a0, i64 %t961)
  br label %fixmerge218
fixmerge218:
  %t968 = phi i64 [ %t966, %fixfast216 ], [ %t967, %fixslow217 ]
  %t969 = icmp ne i64 %t968, 1
  br i1 %t969, label %then219, label %else220
then219:
  %t970 = load i64, ptr @"scheme.base:reverse"
  call void @rt_check_callable(i64 %t970)
  %t971 = and i64 %t970, -8
  %t972 = inttoptr i64 %t971 to ptr
  %t973 = load i64, ptr %t972
  %t974 = inttoptr i64 %t973 to ptr
  %t975 = musttail call fastcc i64 %t974(i64 %t970, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t975
else220:
  %t976 = or i64 %a0, 8
  %t977 = and i64 %t976, 7
  %t978 = icmp eq i64 %t977, 0
  br i1 %t978, label %fixfast221, label %fixslow222
fixfast221:
  %t979 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t980 = extractvalue {i64, i1} %t979, 0
  %t981 = extractvalue {i64, i1} %t979, 1
  br i1 %t981, label %fixslow222, label %fixmerge223
fixslow222:
  %t982 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge223
fixmerge223:
  %t983 = phi i64 [ %t980, %fixfast221 ], [ %t982, %fixslow222 ]
  %t984 = call i64 @rt_cons(i64 %a0, i64 %a1)
  %t985 = musttail call fastcc i64 @"scheme.base:code_162"(i64 %self, i64 2, i64 %t983, i64 %t984, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t985
}

define fastcc i64 @"scheme.base:code:iota"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t986 = icmp eq i64 %argc, 1
  br i1 %t986, label %argok225, label %arityerr224
arityerr224:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok225:
  %t987 = call ptr @rt_alloc_words(i64 3)
  %t988 = ptrtoint ptr %t987 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_162" to i64), ptr %t987
  %t989 = or i64 %t988, 4
  %t990 = getelementptr i64, ptr %t987, i64 1
  store i64 %a0, ptr %t990
  %t991 = getelementptr i64, ptr %t987, i64 2
  store i64 %t989, ptr %t991
  %t992 = musttail call fastcc i64 @"scheme.base:code_162"(i64 %t989, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t992
}

define fastcc i64 @"scheme.base:code:%minmax-fold"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t997 = icmp eq i64 %argc, 4
  br i1 %t997, label %argok227, label %arityerr226
arityerr226:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok227:
  %t998 = call i64 @rt_null_p(i64 %a1)
  %t999 = icmp ne i64 %t998, 1
  br i1 %t999, label %then228, label %else229
then228:
  %t1000 = icmp ne i64 %a3, 1
  br i1 %t1000, label %then230, label %else231
then230:
  %t1001 = call i64 @rt_exact_to_inexact(i64 %a2)
  ret i64 %t1001
else231:
  ret i64 %a2
else229:
  %t1002 = call i64 @rt_cdr(i64 %a1)
  %t1003 = call i64 @rt_car(i64 %a1)
  call void @rt_check_callable(i64 %a0)
  %t1004 = and i64 %a0, -8
  %t1005 = inttoptr i64 %t1004 to ptr
  %t1006 = load i64, ptr %t1005
  %t1007 = inttoptr i64 %t1006 to ptr
  %t1008 = call fastcc i64%t1007(i64 %a0, i64 2, i64 %a2, i64 %t1003, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1009 = icmp ne i64 %a3, 1
  br i1 %t1009, label %then232, label %else233
then232:
  br label %merge234
else233:
  %t1010 = call i64 @rt_car(i64 %a1)
  %t1011 = call i64 @rt_inexact_p(i64 %t1010)
  br label %merge234
merge234:
  %t1012 = phi i64 [ 257, %then232 ], [ %t1011, %else233 ]
  %t1013 = load i64, ptr @"scheme.base:%minmax-fold"
  call void @rt_check_callable(i64 %t1013)
  %t1014 = and i64 %t1013, -8
  %t1015 = inttoptr i64 %t1014 to ptr
  %t1016 = load i64, ptr %t1015
  %t1017 = inttoptr i64 %t1016 to ptr
  %t1018 = musttail call fastcc i64 %t1017(i64 %t1013, i64 4, i64 %a0, i64 %t1002, i64 %t1008, i64 %t1012, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1018
}

define fastcc i64 @"scheme.base:code:%minmax"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1023 = icmp eq i64 %argc, 3
  br i1 %t1023, label %argok236, label %arityerr235
arityerr235:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok236:
  %t1024 = call i64 @rt_inexact_p(i64 %a1)
  %t1025 = load i64, ptr @"scheme.base:%minmax-fold"
  call void @rt_check_callable(i64 %t1025)
  %t1026 = and i64 %t1025, -8
  %t1027 = inttoptr i64 %t1026 to ptr
  %t1028 = load i64, ptr %t1027
  %t1029 = inttoptr i64 %t1028 to ptr
  %t1030 = musttail call fastcc i64 %t1029(i64 %t1025, i64 4, i64 %a0, i64 %a2, i64 %a1, i64 %t1024, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1030
}

define fastcc i64 @"scheme.base:code_182"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1035 = icmp eq i64 %argc, 2
  br i1 %t1035, label %argok238, label %arityerr237
arityerr237:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok238:
  %t1036 = or i64 %a0, %a1
  %t1037 = and i64 %t1036, 7
  %t1038 = icmp eq i64 %t1037, 0
  br i1 %t1038, label %fixfast239, label %fixslow240
fixfast239:
  %t1039 = icmp slt i64 %a0, %a1
  %t1040 = select i1 %t1039, i64 257, i64 1
  br label %fixmerge241
fixslow240:
  %t1041 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge241
fixmerge241:
  %t1042 = phi i64 [ %t1040, %fixfast239 ], [ %t1041, %fixslow240 ]
  %t1043 = icmp ne i64 %t1042, 1
  br i1 %t1043, label %then242, label %else243
then242:
  ret i64 %a1
else243:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:max"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1044 = icmp sge i64 %argc, 1
  br i1 %t1044, label %argok245, label %arityerr244
arityerr244:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok245:
  %t1045 = call ptr @rt_alloc_words(i64 8)
  %t1046 = getelementptr i64, ptr %t1045, i64 0
  store i64 %a0, ptr %t1046
  %t1047 = getelementptr i64, ptr %t1045, i64 1
  store i64 %a1, ptr %t1047
  %t1048 = getelementptr i64, ptr %t1045, i64 2
  store i64 %a2, ptr %t1048
  %t1049 = getelementptr i64, ptr %t1045, i64 3
  store i64 %a3, ptr %t1049
  %t1050 = getelementptr i64, ptr %t1045, i64 4
  store i64 %a4, ptr %t1050
  %t1051 = getelementptr i64, ptr %t1045, i64 5
  store i64 %a5, ptr %t1051
  %t1052 = getelementptr i64, ptr %t1045, i64 6
  store i64 %a6, ptr %t1052
  %t1053 = getelementptr i64, ptr %t1045, i64 7
  store i64 %a7, ptr %t1053
  %t1054 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t1045, ptr %overflow)
  %t1055 = call ptr @rt_alloc_words(i64 1)
  %t1056 = ptrtoint ptr %t1055 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_182" to i64), ptr %t1055
  %t1057 = or i64 %t1056, 4
  %t1058 = load i64, ptr @"scheme.base:%minmax"
  call void @rt_check_callable(i64 %t1058)
  %t1059 = and i64 %t1058, -8
  %t1060 = inttoptr i64 %t1059 to ptr
  %t1061 = load i64, ptr %t1060
  %t1062 = inttoptr i64 %t1061 to ptr
  %t1063 = musttail call fastcc i64 %t1062(i64 %t1058, i64 3, i64 %t1057, i64 %a0, i64 %t1054, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1063
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cmax"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1064 = call ptr @rt_alloc_words(i64 1)
  %t1065 = ptrtoint ptr %t1064 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_182" to i64), ptr %t1064
  %t1066 = or i64 %t1065, 4
  %t1067 = load i64, ptr @"scheme.base:%minmax"
  call void @rt_check_callable(i64 %t1067)
  %t1068 = and i64 %t1067, -8
  %t1069 = inttoptr i64 %t1068 to ptr
  %t1070 = load i64, ptr %t1069
  %t1071 = inttoptr i64 %t1070 to ptr
  %t1072 = musttail call fastcc i64 %t1071(i64 %t1067, i64 3, i64 %t1066, i64 %a0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1072
}

define fastcc i64 @"scheme.base:code_193"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1077 = icmp eq i64 %argc, 2
  br i1 %t1077, label %argok247, label %arityerr246
arityerr246:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok247:
  %t1078 = or i64 %a1, %a0
  %t1079 = and i64 %t1078, 7
  %t1080 = icmp eq i64 %t1079, 0
  br i1 %t1080, label %fixfast248, label %fixslow249
fixfast248:
  %t1081 = icmp slt i64 %a1, %a0
  %t1082 = select i1 %t1081, i64 257, i64 1
  br label %fixmerge250
fixslow249:
  %t1083 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge250
fixmerge250:
  %t1084 = phi i64 [ %t1082, %fixfast248 ], [ %t1083, %fixslow249 ]
  %t1085 = icmp ne i64 %t1084, 1
  br i1 %t1085, label %then251, label %else252
then251:
  ret i64 %a1
else252:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:min"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1086 = icmp sge i64 %argc, 1
  br i1 %t1086, label %argok254, label %arityerr253
arityerr253:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok254:
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
  %t1096 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t1087, ptr %overflow)
  %t1097 = call ptr @rt_alloc_words(i64 1)
  %t1098 = ptrtoint ptr %t1097 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_193" to i64), ptr %t1097
  %t1099 = or i64 %t1098, 4
  %t1100 = load i64, ptr @"scheme.base:%minmax"
  call void @rt_check_callable(i64 %t1100)
  %t1101 = and i64 %t1100, -8
  %t1102 = inttoptr i64 %t1101 to ptr
  %t1103 = load i64, ptr %t1102
  %t1104 = inttoptr i64 %t1103 to ptr
  %t1105 = musttail call fastcc i64 %t1104(i64 %t1100, i64 3, i64 %t1099, i64 %a0, i64 %t1096, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1105
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cmin"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1106 = call ptr @rt_alloc_words(i64 1)
  %t1107 = ptrtoint ptr %t1106 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_193" to i64), ptr %t1106
  %t1108 = or i64 %t1107, 4
  %t1109 = load i64, ptr @"scheme.base:%minmax"
  call void @rt_check_callable(i64 %t1109)
  %t1110 = and i64 %t1109, -8
  %t1111 = inttoptr i64 %t1110 to ptr
  %t1112 = load i64, ptr %t1111
  %t1113 = inttoptr i64 %t1112 to ptr
  %t1114 = musttail call fastcc i64 %t1113(i64 %t1109, i64 3, i64 %t1108, i64 %a0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1114
}

define fastcc i64 @"scheme.base:code:complex?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1119 = icmp eq i64 %argc, 1
  br i1 %t1119, label %argok256, label %arityerr255
arityerr255:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok256:
  %t1120 = call i64 @rt_number_p(i64 %a0)
  ret i64 %t1120
}

define fastcc i64 @"scheme.base:code:exact-integer?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1125 = icmp eq i64 %argc, 1
  br i1 %t1125, label %argok258, label %arityerr257
arityerr257:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok258:
  %t1126 = call i64 @rt_exact_p(i64 %a0)
  %t1127 = icmp ne i64 %t1126, 1
  br i1 %t1127, label %then259, label %else260
then259:
  %t1128 = call i64 @rt_integer_p(i64 %a0)
  ret i64 %t1128
else260:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rational?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1133 = icmp eq i64 %argc, 1
  br i1 %t1133, label %argok262, label %arityerr261
arityerr261:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok262:
  %t1134 = call i64 @rt_number_p(i64 %a0)
  %t1135 = icmp ne i64 %t1134, 1
  br i1 %t1135, label %then263, label %else264
then263:
  %t1136 = call i64 @rt_finite_p(i64 %a0)
  ret i64 %t1136
else264:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:positive?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1141 = icmp eq i64 %argc, 1
  br i1 %t1141, label %argok266, label %arityerr265
arityerr265:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok266:
  %t1142 = or i64 0, %a0
  %t1143 = and i64 %t1142, 7
  %t1144 = icmp eq i64 %t1143, 0
  br i1 %t1144, label %fixfast267, label %fixslow268
fixfast267:
  %t1145 = icmp slt i64 0, %a0
  %t1146 = select i1 %t1145, i64 257, i64 1
  br label %fixmerge269
fixslow268:
  %t1147 = call i64 @rt_lt(i64 0, i64 %a0)
  br label %fixmerge269
fixmerge269:
  %t1148 = phi i64 [ %t1146, %fixfast267 ], [ %t1147, %fixslow268 ]
  ret i64 %t1148
}

define fastcc i64 @"scheme.base:code:negative?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1153 = icmp eq i64 %argc, 1
  br i1 %t1153, label %argok271, label %arityerr270
arityerr270:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok271:
  %t1154 = or i64 %a0, 0
  %t1155 = and i64 %t1154, 7
  %t1156 = icmp eq i64 %t1155, 0
  br i1 %t1156, label %fixfast272, label %fixslow273
fixfast272:
  %t1157 = icmp slt i64 %a0, 0
  %t1158 = select i1 %t1157, i64 257, i64 1
  br label %fixmerge274
fixslow273:
  %t1159 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge274
fixmerge274:
  %t1160 = phi i64 [ %t1158, %fixfast272 ], [ %t1159, %fixslow273 ]
  ret i64 %t1160
}

define fastcc i64 @"scheme.base:code:even?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1165 = icmp eq i64 %argc, 1
  br i1 %t1165, label %argok276, label %arityerr275
arityerr275:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok276:
  %t1166 = call i64 @rt_remainder(i64 %a0, i64 16)
  %t1167 = or i64 0, %t1166
  %t1168 = and i64 %t1167, 7
  %t1169 = icmp eq i64 %t1168, 0
  br i1 %t1169, label %fixfast277, label %fixslow278
fixfast277:
  %t1170 = icmp eq i64 0, %t1166
  %t1171 = select i1 %t1170, i64 257, i64 1
  br label %fixmerge279
fixslow278:
  %t1172 = call i64 @rt_num_eq(i64 0, i64 %t1166)
  br label %fixmerge279
fixmerge279:
  %t1173 = phi i64 [ %t1171, %fixfast277 ], [ %t1172, %fixslow278 ]
  ret i64 %t1173
}

define fastcc i64 @"scheme.base:code:odd?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1178 = icmp eq i64 %argc, 1
  br i1 %t1178, label %argok281, label %arityerr280
arityerr280:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok281:
  %t1179 = call i64 @rt_remainder(i64 %a0, i64 16)
  %t1180 = or i64 0, %t1179
  %t1181 = and i64 %t1180, 7
  %t1182 = icmp eq i64 %t1181, 0
  br i1 %t1182, label %fixfast282, label %fixslow283
fixfast282:
  %t1183 = icmp eq i64 0, %t1179
  %t1184 = select i1 %t1183, i64 257, i64 1
  br label %fixmerge284
fixslow283:
  %t1185 = call i64 @rt_num_eq(i64 0, i64 %t1179)
  br label %fixmerge284
fixmerge284:
  %t1186 = phi i64 [ %t1184, %fixfast282 ], [ %t1185, %fixslow283 ]
  %t1187 = icmp ne i64 %t1186, 1
  br i1 %t1187, label %then285, label %else286
then285:
  ret i64 1
else286:
  ret i64 257
}

define fastcc i64 @"scheme.base:code:abs"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1192 = icmp eq i64 %argc, 1
  br i1 %t1192, label %argok288, label %arityerr287
arityerr287:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok288:
  %t1193 = or i64 %a0, 0
  %t1194 = and i64 %t1193, 7
  %t1195 = icmp eq i64 %t1194, 0
  br i1 %t1195, label %fixfast289, label %fixslow290
fixfast289:
  %t1196 = icmp slt i64 %a0, 0
  %t1197 = select i1 %t1196, i64 257, i64 1
  br label %fixmerge291
fixslow290:
  %t1198 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge291
fixmerge291:
  %t1199 = phi i64 [ %t1197, %fixfast289 ], [ %t1198, %fixslow290 ]
  %t1200 = icmp ne i64 %t1199, 1
  br i1 %t1200, label %then292, label %else293
then292:
  %t1201 = or i64 0, %a0
  %t1202 = and i64 %t1201, 7
  %t1203 = icmp eq i64 %t1202, 0
  br i1 %t1203, label %fixfast294, label %fixslow295
fixfast294:
  %t1204 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %a0)
  %t1205 = extractvalue {i64, i1} %t1204, 0
  %t1206 = extractvalue {i64, i1} %t1204, 1
  br i1 %t1206, label %fixslow295, label %fixmerge296
fixslow295:
  %t1207 = call i64 @rt_sub(i64 0, i64 %a0)
  br label %fixmerge296
fixmerge296:
  %t1208 = phi i64 [ %t1205, %fixfast294 ], [ %t1207, %fixslow295 ]
  ret i64 %t1208
else293:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:square"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1213 = icmp eq i64 %argc, 1
  br i1 %t1213, label %argok298, label %arityerr297
arityerr297:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok298:
  %t1214 = or i64 %a0, %a0
  %t1215 = and i64 %t1214, 7
  %t1216 = icmp eq i64 %t1215, 0
  br i1 %t1216, label %fixfast299, label %fixslow300
fixfast299:
  %t1217 = ashr i64 %a0, 3
  %t1218 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1217, i64 %a0)
  %t1219 = extractvalue {i64, i1} %t1218, 0
  %t1220 = extractvalue {i64, i1} %t1218, 1
  br i1 %t1220, label %fixslow300, label %fixmerge301
fixslow300:
  %t1221 = call i64 @rt_mul(i64 %a0, i64 %a0)
  br label %fixmerge301
fixmerge301:
  %t1222 = phi i64 [ %t1219, %fixfast299 ], [ %t1221, %fixslow300 ]
  ret i64 %t1222
}

define fastcc i64 @"scheme.base:code:%gcd2"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1227 = icmp eq i64 %argc, 2
  br i1 %t1227, label %argok303, label %arityerr302
arityerr302:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok303:
  %t1228 = or i64 %a1, 0
  %t1229 = and i64 %t1228, 7
  %t1230 = icmp eq i64 %t1229, 0
  br i1 %t1230, label %fixfast304, label %fixslow305
fixfast304:
  %t1231 = icmp eq i64 %a1, 0
  %t1232 = select i1 %t1231, i64 257, i64 1
  br label %fixmerge306
fixslow305:
  %t1233 = call i64 @rt_num_eq(i64 %a1, i64 0)
  br label %fixmerge306
fixmerge306:
  %t1234 = phi i64 [ %t1232, %fixfast304 ], [ %t1233, %fixslow305 ]
  %t1235 = icmp ne i64 %t1234, 1
  br i1 %t1235, label %then307, label %else308
then307:
  ret i64 %a0
else308:
  %t1236 = call i64 @rt_remainder(i64 %a0, i64 %a1)
  %t1237 = load i64, ptr @"scheme.base:%gcd2"
  call void @rt_check_callable(i64 %t1237)
  %t1238 = and i64 %t1237, -8
  %t1239 = inttoptr i64 %t1238 to ptr
  %t1240 = load i64, ptr %t1239
  %t1241 = inttoptr i64 %t1240 to ptr
  %t1242 = musttail call fastcc i64 %t1241(i64 %t1237, i64 2, i64 %a1, i64 %t1236, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1242
}

define fastcc i64 @"scheme.base:code:%gcd-fold"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1247 = icmp eq i64 %argc, 2
  br i1 %t1247, label %argok310, label %arityerr309
arityerr309:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok310:
  %t1248 = call i64 @rt_null_p(i64 %a0)
  %t1249 = icmp ne i64 %t1248, 1
  br i1 %t1249, label %then311, label %else312
then311:
  ret i64 %a1
else312:
  %t1250 = call i64 @rt_cdr(i64 %a0)
  %t1251 = call i64 @rt_car(i64 %a0)
  %t1252 = load i64, ptr @"scheme.base:abs"
  call void @rt_check_callable(i64 %t1252)
  %t1253 = and i64 %t1252, -8
  %t1254 = inttoptr i64 %t1253 to ptr
  %t1255 = load i64, ptr %t1254
  %t1256 = inttoptr i64 %t1255 to ptr
  %t1257 = call fastcc i64%t1256(i64 %t1252, i64 1, i64 %t1251, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1258 = load i64, ptr @"scheme.base:abs"
  call void @rt_check_callable(i64 %t1258)
  %t1259 = and i64 %t1258, -8
  %t1260 = inttoptr i64 %t1259 to ptr
  %t1261 = load i64, ptr %t1260
  %t1262 = inttoptr i64 %t1261 to ptr
  %t1263 = call fastcc i64%t1262(i64 %t1258, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1264 = load i64, ptr @"scheme.base:%gcd2"
  call void @rt_check_callable(i64 %t1264)
  %t1265 = and i64 %t1264, -8
  %t1266 = inttoptr i64 %t1265 to ptr
  %t1267 = load i64, ptr %t1266
  %t1268 = inttoptr i64 %t1267 to ptr
  %t1269 = call fastcc i64%t1268(i64 %t1264, i64 2, i64 %t1257, i64 %t1263, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1270 = load i64, ptr @"scheme.base:%gcd-fold"
  call void @rt_check_callable(i64 %t1270)
  %t1271 = and i64 %t1270, -8
  %t1272 = inttoptr i64 %t1271 to ptr
  %t1273 = load i64, ptr %t1272
  %t1274 = inttoptr i64 %t1273 to ptr
  %t1275 = musttail call fastcc i64 %t1274(i64 %t1270, i64 2, i64 %t1250, i64 %t1269, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1275
}

define fastcc i64 @"scheme.base:code:%lcm-fold"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1280 = icmp eq i64 %argc, 2
  br i1 %t1280, label %argok314, label %arityerr313
arityerr313:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok314:
  %t1281 = call i64 @rt_null_p(i64 %a0)
  %t1282 = icmp ne i64 %t1281, 1
  br i1 %t1282, label %then315, label %else316
then315:
  ret i64 %a1
else316:
  %t1283 = call i64 @rt_car(i64 %a0)
  %t1284 = load i64, ptr @"scheme.base:abs"
  call void @rt_check_callable(i64 %t1284)
  %t1285 = and i64 %t1284, -8
  %t1286 = inttoptr i64 %t1285 to ptr
  %t1287 = load i64, ptr %t1286
  %t1288 = inttoptr i64 %t1287 to ptr
  %t1289 = call fastcc i64%t1288(i64 %t1284, i64 1, i64 %t1283, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1290 = or i64 %t1289, 0
  %t1291 = and i64 %t1290, 7
  %t1292 = icmp eq i64 %t1291, 0
  br i1 %t1292, label %fixfast317, label %fixslow318
fixfast317:
  %t1293 = icmp eq i64 %t1289, 0
  %t1294 = select i1 %t1293, i64 257, i64 1
  br label %fixmerge319
fixslow318:
  %t1295 = call i64 @rt_num_eq(i64 %t1289, i64 0)
  br label %fixmerge319
fixmerge319:
  %t1296 = phi i64 [ %t1294, %fixfast317 ], [ %t1295, %fixslow318 ]
  %t1297 = icmp ne i64 %t1296, 1
  br i1 %t1297, label %then320, label %else321
then320:
  ret i64 0
else321:
  %t1298 = call i64 @rt_cdr(i64 %a0)
  %t1299 = or i64 %a1, %t1289
  %t1300 = and i64 %t1299, 7
  %t1301 = icmp eq i64 %t1300, 0
  br i1 %t1301, label %fixfast322, label %fixslow323
fixfast322:
  %t1302 = ashr i64 %a1, 3
  %t1303 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1302, i64 %t1289)
  %t1304 = extractvalue {i64, i1} %t1303, 0
  %t1305 = extractvalue {i64, i1} %t1303, 1
  br i1 %t1305, label %fixslow323, label %fixmerge324
fixslow323:
  %t1306 = call i64 @rt_mul(i64 %a1, i64 %t1289)
  br label %fixmerge324
fixmerge324:
  %t1307 = phi i64 [ %t1304, %fixfast322 ], [ %t1306, %fixslow323 ]
  %t1308 = load i64, ptr @"scheme.base:%gcd2"
  call void @rt_check_callable(i64 %t1308)
  %t1309 = and i64 %t1308, -8
  %t1310 = inttoptr i64 %t1309 to ptr
  %t1311 = load i64, ptr %t1310
  %t1312 = inttoptr i64 %t1311 to ptr
  %t1313 = call fastcc i64%t1312(i64 %t1308, i64 2, i64 %a1, i64 %t1289, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1314 = call i64 @rt_quotient(i64 %t1307, i64 %t1313)
  %t1315 = load i64, ptr @"scheme.base:%lcm-fold"
  call void @rt_check_callable(i64 %t1315)
  %t1316 = and i64 %t1315, -8
  %t1317 = inttoptr i64 %t1316 to ptr
  %t1318 = load i64, ptr %t1317
  %t1319 = inttoptr i64 %t1318 to ptr
  %t1320 = musttail call fastcc i64 %t1319(i64 %t1315, i64 2, i64 %t1298, i64 %t1314, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1320
}

define fastcc i64 @"scheme.base:code:gcd"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1325 = icmp sge i64 %argc, 0
  br i1 %t1325, label %argok326, label %arityerr325
arityerr325:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok326:
  %t1326 = call ptr @rt_alloc_words(i64 8)
  %t1327 = getelementptr i64, ptr %t1326, i64 0
  store i64 %a0, ptr %t1327
  %t1328 = getelementptr i64, ptr %t1326, i64 1
  store i64 %a1, ptr %t1328
  %t1329 = getelementptr i64, ptr %t1326, i64 2
  store i64 %a2, ptr %t1329
  %t1330 = getelementptr i64, ptr %t1326, i64 3
  store i64 %a3, ptr %t1330
  %t1331 = getelementptr i64, ptr %t1326, i64 4
  store i64 %a4, ptr %t1331
  %t1332 = getelementptr i64, ptr %t1326, i64 5
  store i64 %a5, ptr %t1332
  %t1333 = getelementptr i64, ptr %t1326, i64 6
  store i64 %a6, ptr %t1333
  %t1334 = getelementptr i64, ptr %t1326, i64 7
  store i64 %a7, ptr %t1334
  %t1335 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1326, ptr %overflow)
  %t1336 = load i64, ptr @"scheme.base:%gcd-fold"
  call void @rt_check_callable(i64 %t1336)
  %t1337 = and i64 %t1336, -8
  %t1338 = inttoptr i64 %t1337 to ptr
  %t1339 = load i64, ptr %t1338
  %t1340 = inttoptr i64 %t1339 to ptr
  %t1341 = musttail call fastcc i64 %t1340(i64 %t1336, i64 2, i64 %t1335, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1341
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cgcd"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1342 = load i64, ptr @"scheme.base:%gcd-fold"
  call void @rt_check_callable(i64 %t1342)
  %t1343 = and i64 %t1342, -8
  %t1344 = inttoptr i64 %t1343 to ptr
  %t1345 = load i64, ptr %t1344
  %t1346 = inttoptr i64 %t1345 to ptr
  %t1347 = musttail call fastcc i64 %t1346(i64 %t1342, i64 2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1347
}

define fastcc i64 @"scheme.base:code:lcm"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1352 = icmp sge i64 %argc, 0
  br i1 %t1352, label %argok328, label %arityerr327
arityerr327:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok328:
  %t1353 = call ptr @rt_alloc_words(i64 8)
  %t1354 = getelementptr i64, ptr %t1353, i64 0
  store i64 %a0, ptr %t1354
  %t1355 = getelementptr i64, ptr %t1353, i64 1
  store i64 %a1, ptr %t1355
  %t1356 = getelementptr i64, ptr %t1353, i64 2
  store i64 %a2, ptr %t1356
  %t1357 = getelementptr i64, ptr %t1353, i64 3
  store i64 %a3, ptr %t1357
  %t1358 = getelementptr i64, ptr %t1353, i64 4
  store i64 %a4, ptr %t1358
  %t1359 = getelementptr i64, ptr %t1353, i64 5
  store i64 %a5, ptr %t1359
  %t1360 = getelementptr i64, ptr %t1353, i64 6
  store i64 %a6, ptr %t1360
  %t1361 = getelementptr i64, ptr %t1353, i64 7
  store i64 %a7, ptr %t1361
  %t1362 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1353, ptr %overflow)
  %t1363 = load i64, ptr @"scheme.base:%lcm-fold"
  call void @rt_check_callable(i64 %t1363)
  %t1364 = and i64 %t1363, -8
  %t1365 = inttoptr i64 %t1364 to ptr
  %t1366 = load i64, ptr %t1365
  %t1367 = inttoptr i64 %t1366 to ptr
  %t1368 = musttail call fastcc i64 %t1367(i64 %t1363, i64 2, i64 %t1362, i64 8, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1368
}

define fastcc i64 @"min-entry:$scheme.base$ccode$clcm"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1369 = load i64, ptr @"scheme.base:%lcm-fold"
  call void @rt_check_callable(i64 %t1369)
  %t1370 = and i64 %t1369, -8
  %t1371 = inttoptr i64 %t1370 to ptr
  %t1372 = load i64, ptr %t1371
  %t1373 = inttoptr i64 %t1372 to ptr
  %t1374 = musttail call fastcc i64 %t1373(i64 %t1369, i64 2, i64 2, i64 8, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1374
}

define fastcc i64 @"scheme.base:code:%expt-exact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1379 = icmp eq i64 %argc, 3
  br i1 %t1379, label %argok330, label %arityerr329
arityerr329:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok330:
  %t1380 = or i64 %a1, 0
  %t1381 = and i64 %t1380, 7
  %t1382 = icmp eq i64 %t1381, 0
  br i1 %t1382, label %fixfast331, label %fixslow332
fixfast331:
  %t1383 = icmp eq i64 %a1, 0
  %t1384 = select i1 %t1383, i64 257, i64 1
  br label %fixmerge333
fixslow332:
  %t1385 = call i64 @rt_num_eq(i64 %a1, i64 0)
  br label %fixmerge333
fixmerge333:
  %t1386 = phi i64 [ %t1384, %fixfast331 ], [ %t1385, %fixslow332 ]
  %t1387 = icmp ne i64 %t1386, 1
  br i1 %t1387, label %then334, label %else335
then334:
  ret i64 %a2
else335:
  %t1388 = or i64 %a0, %a0
  %t1389 = and i64 %t1388, 7
  %t1390 = icmp eq i64 %t1389, 0
  br i1 %t1390, label %fixfast336, label %fixslow337
fixfast336:
  %t1391 = ashr i64 %a0, 3
  %t1392 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1391, i64 %a0)
  %t1393 = extractvalue {i64, i1} %t1392, 0
  %t1394 = extractvalue {i64, i1} %t1392, 1
  br i1 %t1394, label %fixslow337, label %fixmerge338
fixslow337:
  %t1395 = call i64 @rt_mul(i64 %a0, i64 %a0)
  br label %fixmerge338
fixmerge338:
  %t1396 = phi i64 [ %t1393, %fixfast336 ], [ %t1395, %fixslow337 ]
  %t1397 = call i64 @rt_quotient(i64 %a1, i64 16)
  %t1398 = load i64, ptr @"scheme.base:odd?"
  call void @rt_check_callable(i64 %t1398)
  %t1399 = and i64 %t1398, -8
  %t1400 = inttoptr i64 %t1399 to ptr
  %t1401 = load i64, ptr %t1400
  %t1402 = inttoptr i64 %t1401 to ptr
  %t1403 = call fastcc i64%t1402(i64 %t1398, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1404 = icmp ne i64 %t1403, 1
  br i1 %t1404, label %then339, label %else340
then339:
  %t1405 = or i64 %a2, %a0
  %t1406 = and i64 %t1405, 7
  %t1407 = icmp eq i64 %t1406, 0
  br i1 %t1407, label %fixfast342, label %fixslow343
fixfast342:
  %t1408 = ashr i64 %a2, 3
  %t1409 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1408, i64 %a0)
  %t1410 = extractvalue {i64, i1} %t1409, 0
  %t1411 = extractvalue {i64, i1} %t1409, 1
  br i1 %t1411, label %fixslow343, label %fixmerge344
fixslow343:
  %t1412 = call i64 @rt_mul(i64 %a2, i64 %a0)
  br label %fixmerge344
fixmerge344:
  %t1413 = phi i64 [ %t1410, %fixfast342 ], [ %t1412, %fixslow343 ]
  br label %merge341
else340:
  br label %merge341
merge341:
  %t1414 = phi i64 [ %t1413, %fixmerge344 ], [ %a2, %else340 ]
  %t1415 = load i64, ptr @"scheme.base:%expt-exact"
  call void @rt_check_callable(i64 %t1415)
  %t1416 = and i64 %t1415, -8
  %t1417 = inttoptr i64 %t1416 to ptr
  %t1418 = load i64, ptr %t1417
  %t1419 = inttoptr i64 %t1418 to ptr
  %t1420 = musttail call fastcc i64 %t1419(i64 %t1415, i64 3, i64 %t1396, i64 %t1397, i64 %t1414, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1420
}

define fastcc i64 @"scheme.base:code:expt"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1425 = icmp eq i64 %argc, 2
  br i1 %t1425, label %argok346, label %arityerr345
arityerr345:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok346:
  %t1426 = call i64 @rt_exact_p(i64 %a1)
  %t1427 = icmp ne i64 %t1426, 1
  br i1 %t1427, label %then347, label %else348
then347:
  %t1428 = or i64 %a1, 0
  %t1429 = and i64 %t1428, 7
  %t1430 = icmp eq i64 %t1429, 0
  br i1 %t1430, label %fixfast349, label %fixslow350
fixfast349:
  %t1431 = icmp slt i64 %a1, 0
  %t1432 = select i1 %t1431, i64 257, i64 1
  br label %fixmerge351
fixslow350:
  %t1433 = call i64 @rt_lt(i64 %a1, i64 0)
  br label %fixmerge351
fixmerge351:
  %t1434 = phi i64 [ %t1432, %fixfast349 ], [ %t1433, %fixslow350 ]
  %t1435 = icmp ne i64 %t1434, 1
  br i1 %t1435, label %then352, label %else353
then352:
  %t1436 = call i64 @rt_pow(i64 %a0, i64 %a1)
  ret i64 %t1436
else353:
  %t1437 = call i64 @rt_exact_p(i64 %a0)
  %t1438 = icmp ne i64 %t1437, 1
  br i1 %t1438, label %then354, label %else355
then354:
  %t1439 = load i64, ptr @"scheme.base:%expt-exact"
  call void @rt_check_callable(i64 %t1439)
  %t1440 = and i64 %t1439, -8
  %t1441 = inttoptr i64 %t1440 to ptr
  %t1442 = load i64, ptr %t1441
  %t1443 = inttoptr i64 %t1442 to ptr
  %t1444 = musttail call fastcc i64 %t1443(i64 %t1439, i64 3, i64 %a0, i64 %a1, i64 8, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1444
else355:
  %t1445 = call i64 @rt_flonum_lit(ptr @.flo.lit.0)
  %t1446 = load i64, ptr @"scheme.base:%expt-exact"
  call void @rt_check_callable(i64 %t1446)
  %t1447 = and i64 %t1446, -8
  %t1448 = inttoptr i64 %t1447 to ptr
  %t1449 = load i64, ptr %t1448
  %t1450 = inttoptr i64 %t1449 to ptr
  %t1451 = musttail call fastcc i64 %t1450(i64 %t1446, i64 3, i64 %a0, i64 %a1, i64 %t1445, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1451
else348:
  %t1452 = call i64 @rt_pow(i64 %a0, i64 %a1)
  ret i64 %t1452
}

define fastcc i64 @"scheme.base:code:%isqrt-loop"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1457 = icmp eq i64 %argc, 2
  br i1 %t1457, label %argok357, label %arityerr356
arityerr356:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok357:
  %t1458 = call i64 @rt_quotient(i64 %a0, i64 %a1)
  %t1459 = or i64 %a1, %t1458
  %t1460 = and i64 %t1459, 7
  %t1461 = icmp eq i64 %t1460, 0
  br i1 %t1461, label %fixfast358, label %fixslow359
fixfast358:
  %t1462 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t1458)
  %t1463 = extractvalue {i64, i1} %t1462, 0
  %t1464 = extractvalue {i64, i1} %t1462, 1
  br i1 %t1464, label %fixslow359, label %fixmerge360
fixslow359:
  %t1465 = call i64 @rt_add(i64 %a1, i64 %t1458)
  br label %fixmerge360
fixmerge360:
  %t1466 = phi i64 [ %t1463, %fixfast358 ], [ %t1465, %fixslow359 ]
  %t1467 = call i64 @rt_quotient(i64 %t1466, i64 16)
  %t1468 = or i64 %t1467, %a1
  %t1469 = and i64 %t1468, 7
  %t1470 = icmp eq i64 %t1469, 0
  br i1 %t1470, label %fixfast361, label %fixslow362
fixfast361:
  %t1471 = icmp slt i64 %t1467, %a1
  %t1472 = select i1 %t1471, i64 257, i64 1
  br label %fixmerge363
fixslow362:
  %t1473 = call i64 @rt_lt(i64 %t1467, i64 %a1)
  br label %fixmerge363
fixmerge363:
  %t1474 = phi i64 [ %t1472, %fixfast361 ], [ %t1473, %fixslow362 ]
  %t1475 = icmp ne i64 %t1474, 1
  br i1 %t1475, label %then364, label %else365
then364:
  %t1476 = load i64, ptr @"scheme.base:%isqrt-loop"
  call void @rt_check_callable(i64 %t1476)
  %t1477 = and i64 %t1476, -8
  %t1478 = inttoptr i64 %t1477 to ptr
  %t1479 = load i64, ptr %t1478
  %t1480 = inttoptr i64 %t1479 to ptr
  %t1481 = musttail call fastcc i64 %t1480(i64 %t1476, i64 2, i64 %a0, i64 %t1467, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1481
else365:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:%isqrt"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1486 = icmp eq i64 %argc, 1
  br i1 %t1486, label %argok367, label %arityerr366
arityerr366:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok367:
  %t1487 = or i64 %a0, 0
  %t1488 = and i64 %t1487, 7
  %t1489 = icmp eq i64 %t1488, 0
  br i1 %t1489, label %fixfast368, label %fixslow369
fixfast368:
  %t1490 = icmp eq i64 %a0, 0
  %t1491 = select i1 %t1490, i64 257, i64 1
  br label %fixmerge370
fixslow369:
  %t1492 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge370
fixmerge370:
  %t1493 = phi i64 [ %t1491, %fixfast368 ], [ %t1492, %fixslow369 ]
  %t1494 = icmp ne i64 %t1493, 1
  br i1 %t1494, label %then371, label %else372
then371:
  ret i64 0
else372:
  %t1495 = load i64, ptr @"scheme.base:%isqrt-loop"
  call void @rt_check_callable(i64 %t1495)
  %t1496 = and i64 %t1495, -8
  %t1497 = inttoptr i64 %t1496 to ptr
  %t1498 = load i64, ptr %t1497
  %t1499 = inttoptr i64 %t1498 to ptr
  %t1500 = musttail call fastcc i64 %t1499(i64 %t1495, i64 2, i64 %a0, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1500
}

define fastcc i64 @"scheme.base:code:exact-integer-sqrt"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1505 = icmp eq i64 %argc, 1
  br i1 %t1505, label %argok374, label %arityerr373
arityerr373:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok374:
  %t1506 = load i64, ptr @"scheme.base:%isqrt"
  call void @rt_check_callable(i64 %t1506)
  %t1507 = and i64 %t1506, -8
  %t1508 = inttoptr i64 %t1507 to ptr
  %t1509 = load i64, ptr %t1508
  %t1510 = inttoptr i64 %t1509 to ptr
  %t1511 = call fastcc i64%t1510(i64 %t1506, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1512 = or i64 %t1511, %t1511
  %t1513 = and i64 %t1512, 7
  %t1514 = icmp eq i64 %t1513, 0
  br i1 %t1514, label %fixfast375, label %fixslow376
fixfast375:
  %t1515 = ashr i64 %t1511, 3
  %t1516 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1515, i64 %t1511)
  %t1517 = extractvalue {i64, i1} %t1516, 0
  %t1518 = extractvalue {i64, i1} %t1516, 1
  br i1 %t1518, label %fixslow376, label %fixmerge377
fixslow376:
  %t1519 = call i64 @rt_mul(i64 %t1511, i64 %t1511)
  br label %fixmerge377
fixmerge377:
  %t1520 = phi i64 [ %t1517, %fixfast375 ], [ %t1519, %fixslow376 ]
  %t1521 = or i64 %a0, %t1520
  %t1522 = and i64 %t1521, 7
  %t1523 = icmp eq i64 %t1522, 0
  br i1 %t1523, label %fixfast378, label %fixslow379
fixfast378:
  %t1524 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t1520)
  %t1525 = extractvalue {i64, i1} %t1524, 0
  %t1526 = extractvalue {i64, i1} %t1524, 1
  br i1 %t1526, label %fixslow379, label %fixmerge380
fixslow379:
  %t1527 = call i64 @rt_sub(i64 %a0, i64 %t1520)
  br label %fixmerge380
fixmerge380:
  %t1528 = phi i64 [ %t1525, %fixfast378 ], [ %t1527, %fixslow379 ]
  %t1529 = load i64, ptr @"scheme.base:values"
  call void @rt_check_callable(i64 %t1529)
  %t1530 = and i64 %t1529, -8
  %t1531 = inttoptr i64 %t1530 to ptr
  %t1532 = load i64, ptr %t1531
  %t1533 = inttoptr i64 %t1532 to ptr
  %t1534 = musttail call fastcc i64 %t1533(i64 %t1529, i64 2, i64 %t1511, i64 %t1528, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1534
}

define fastcc i64 @"scheme.base:code:floor"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1539 = icmp eq i64 %argc, 1
  br i1 %t1539, label %argok382, label %arityerr381
arityerr381:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok382:
  %t1540 = call i64 @rt_exact_p(i64 %a0)
  %t1541 = icmp ne i64 %t1540, 1
  br i1 %t1541, label %then383, label %else384
then383:
  ret i64 %a0
else384:
  %t1542 = call i64 @rt_flo_floor(i64 %a0)
  ret i64 %t1542
}

define fastcc i64 @"scheme.base:code:ceiling"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1547 = icmp eq i64 %argc, 1
  br i1 %t1547, label %argok386, label %arityerr385
arityerr385:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok386:
  %t1548 = call i64 @rt_exact_p(i64 %a0)
  %t1549 = icmp ne i64 %t1548, 1
  br i1 %t1549, label %then387, label %else388
then387:
  ret i64 %a0
else388:
  %t1550 = call i64 @rt_flo_ceiling(i64 %a0)
  ret i64 %t1550
}

define fastcc i64 @"scheme.base:code:truncate"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1555 = icmp eq i64 %argc, 1
  br i1 %t1555, label %argok390, label %arityerr389
arityerr389:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok390:
  %t1556 = call i64 @rt_exact_p(i64 %a0)
  %t1557 = icmp ne i64 %t1556, 1
  br i1 %t1557, label %then391, label %else392
then391:
  ret i64 %a0
else392:
  %t1558 = call i64 @rt_flo_truncate(i64 %a0)
  ret i64 %t1558
}

define fastcc i64 @"scheme.base:code:round"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1563 = icmp eq i64 %argc, 1
  br i1 %t1563, label %argok394, label %arityerr393
arityerr393:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok394:
  %t1564 = call i64 @rt_exact_p(i64 %a0)
  %t1565 = icmp ne i64 %t1564, 1
  br i1 %t1565, label %then395, label %else396
then395:
  ret i64 %a0
else396:
  %t1566 = call i64 @rt_flo_round(i64 %a0)
  ret i64 %t1566
}

define fastcc i64 @"scheme.base:code:truncate-quotient"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1571 = icmp eq i64 %argc, 2
  br i1 %t1571, label %argok398, label %arityerr397
arityerr397:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok398:
  %t1572 = call i64 @rt_quotient(i64 %a0, i64 %a1)
  ret i64 %t1572
}

define fastcc i64 @"scheme.base:code:truncate-remainder"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1577 = icmp eq i64 %argc, 2
  br i1 %t1577, label %argok400, label %arityerr399
arityerr399:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok400:
  %t1578 = call i64 @rt_remainder(i64 %a0, i64 %a1)
  ret i64 %t1578
}

define fastcc i64 @"scheme.base:code:floor-remainder"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1583 = icmp eq i64 %argc, 2
  br i1 %t1583, label %argok402, label %arityerr401
arityerr401:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok402:
  %t1584 = call i64 @rt_modulo(i64 %a0, i64 %a1)
  ret i64 %t1584
}

define fastcc i64 @"scheme.base:code:floor-quotient"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1589 = icmp eq i64 %argc, 2
  br i1 %t1589, label %argok404, label %arityerr403
arityerr403:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok404:
  %t1590 = call i64 @rt_modulo(i64 %a0, i64 %a1)
  %t1591 = or i64 %a0, %t1590
  %t1592 = and i64 %t1591, 7
  %t1593 = icmp eq i64 %t1592, 0
  br i1 %t1593, label %fixfast405, label %fixslow406
fixfast405:
  %t1594 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t1590)
  %t1595 = extractvalue {i64, i1} %t1594, 0
  %t1596 = extractvalue {i64, i1} %t1594, 1
  br i1 %t1596, label %fixslow406, label %fixmerge407
fixslow406:
  %t1597 = call i64 @rt_sub(i64 %a0, i64 %t1590)
  br label %fixmerge407
fixmerge407:
  %t1598 = phi i64 [ %t1595, %fixfast405 ], [ %t1597, %fixslow406 ]
  %t1599 = call i64 @rt_quotient(i64 %t1598, i64 %a1)
  ret i64 %t1599
}

define fastcc i64 @"scheme.base:code:truncate/"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1604 = icmp eq i64 %argc, 2
  br i1 %t1604, label %argok409, label %arityerr408
arityerr408:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok409:
  %t1605 = call i64 @rt_quotient(i64 %a0, i64 %a1)
  %t1606 = call i64 @rt_remainder(i64 %a0, i64 %a1)
  %t1607 = load i64, ptr @"scheme.base:values"
  call void @rt_check_callable(i64 %t1607)
  %t1608 = and i64 %t1607, -8
  %t1609 = inttoptr i64 %t1608 to ptr
  %t1610 = load i64, ptr %t1609
  %t1611 = inttoptr i64 %t1610 to ptr
  %t1612 = musttail call fastcc i64 %t1611(i64 %t1607, i64 2, i64 %t1605, i64 %t1606, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1612
}

define fastcc i64 @"scheme.base:code:floor/"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1617 = icmp eq i64 %argc, 2
  br i1 %t1617, label %argok411, label %arityerr410
arityerr410:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok411:
  %t1618 = load i64, ptr @"scheme.base:floor-quotient"
  call void @rt_check_callable(i64 %t1618)
  %t1619 = and i64 %t1618, -8
  %t1620 = inttoptr i64 %t1619 to ptr
  %t1621 = load i64, ptr %t1620
  %t1622 = inttoptr i64 %t1621 to ptr
  %t1623 = call fastcc i64%t1622(i64 %t1618, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1624 = call i64 @rt_modulo(i64 %a0, i64 %a1)
  %t1625 = load i64, ptr @"scheme.base:values"
  call void @rt_check_callable(i64 %t1625)
  %t1626 = and i64 %t1625, -8
  %t1627 = inttoptr i64 %t1626 to ptr
  %t1628 = load i64, ptr %t1627
  %t1629 = inttoptr i64 %t1628 to ptr
  %t1630 = musttail call fastcc i64 %t1629(i64 %t1625, i64 2, i64 %t1623, i64 %t1624, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1630
}

define fastcc i64 @"scheme.base:code:numerator"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1635 = icmp eq i64 %argc, 1
  br i1 %t1635, label %argok413, label %arityerr412
arityerr412:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok413:
  %t1636 = call i64 @rt_integer_p(i64 %a0)
  %t1637 = icmp ne i64 %t1636, 1
  br i1 %t1637, label %then414, label %else415
then414:
  ret i64 %a0
else415:
  %t1638 = call i64 @rt_make_string(ptr @.str.lit.1, i64 25)
  %t1639 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t1639)
  %t1640 = and i64 %t1639, -8
  %t1641 = inttoptr i64 %t1640 to ptr
  %t1642 = load i64, ptr %t1641
  %t1643 = inttoptr i64 %t1642 to ptr
  %t1644 = musttail call fastcc i64 %t1643(i64 %t1639, i64 2, i64 %t1638, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1644
}

define fastcc i64 @"scheme.base:code:denominator"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1649 = icmp eq i64 %argc, 1
  br i1 %t1649, label %argok417, label %arityerr416
arityerr416:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok417:
  %t1650 = call i64 @rt_integer_p(i64 %a0)
  %t1651 = icmp ne i64 %t1650, 1
  br i1 %t1651, label %then418, label %else419
then418:
  %t1652 = call i64 @rt_exact_p(i64 %a0)
  %t1653 = icmp ne i64 %t1652, 1
  br i1 %t1653, label %then420, label %else421
then420:
  ret i64 8
else421:
  %t1654 = call i64 @rt_flonum_lit(ptr @.flo.lit.2)
  ret i64 %t1654
else419:
  %t1655 = call i64 @rt_make_string(ptr @.str.lit.3, i64 27)
  %t1656 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t1656)
  %t1657 = and i64 %t1656, -8
  %t1658 = inttoptr i64 %t1657 to ptr
  %t1659 = load i64, ptr %t1658
  %t1660 = inttoptr i64 %t1659 to ptr
  %t1661 = musttail call fastcc i64 %t1660(i64 %t1656, i64 2, i64 %t1655, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1661
}

define fastcc i64 @"scheme.base:code:inexact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1666 = icmp eq i64 %argc, 1
  br i1 %t1666, label %argok423, label %arityerr422
arityerr422:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok423:
  %t1667 = call i64 @rt_exact_to_inexact(i64 %a0)
  ret i64 %t1667
}

define fastcc i64 @"scheme.base:code:exact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1672 = icmp eq i64 %argc, 1
  br i1 %t1672, label %argok425, label %arityerr424
arityerr424:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok425:
  %t1673 = call i64 @rt_inexact_to_exact(i64 %a0)
  ret i64 %t1673
}

define fastcc i64 @"scheme.base:code:void"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1678 = icmp eq i64 %argc, 0
  br i1 %t1678, label %argok427, label %arityerr426
arityerr426:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok427:
  %t1679 = icmp ne i64 1, 1
  br i1 %t1679, label %then428, label %else429
then428:
  ret i64 1
else429:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1684 = icmp sge i64 %argc, 0
  br i1 %t1684, label %argok431, label %arityerr430
arityerr430:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok431:
  %t1685 = call ptr @rt_alloc_words(i64 8)
  %t1686 = getelementptr i64, ptr %t1685, i64 0
  store i64 %a0, ptr %t1686
  %t1687 = getelementptr i64, ptr %t1685, i64 1
  store i64 %a1, ptr %t1687
  %t1688 = getelementptr i64, ptr %t1685, i64 2
  store i64 %a2, ptr %t1688
  %t1689 = getelementptr i64, ptr %t1685, i64 3
  store i64 %a3, ptr %t1689
  %t1690 = getelementptr i64, ptr %t1685, i64 4
  store i64 %a4, ptr %t1690
  %t1691 = getelementptr i64, ptr %t1685, i64 5
  store i64 %a5, ptr %t1691
  %t1692 = getelementptr i64, ptr %t1685, i64 6
  store i64 %a6, ptr %t1692
  %t1693 = getelementptr i64, ptr %t1685, i64 7
  store i64 %a7, ptr %t1693
  %t1694 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1685, ptr %overflow)
  %t1695 = call i64 @rt_list_to_string(i64 %t1694)
  ret i64 %t1695
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1696 = call i64 @rt_list_to_string(i64 2)
  ret i64 %t1696
}

define fastcc i64 @"scheme.base:code:%str-concat"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1701 = icmp eq i64 %argc, 1
  br i1 %t1701, label %argok433, label %arityerr432
arityerr432:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok433:
  %t1702 = call i64 @rt_null_p(i64 %a0)
  %t1703 = icmp ne i64 %t1702, 1
  br i1 %t1703, label %then434, label %else435
then434:
  %t1704 = call i64 @rt_make_string(ptr @.str.lit.4, i64 0)
  ret i64 %t1704
else435:
  %t1705 = call i64 @rt_car(i64 %a0)
  %t1706 = call i64 @rt_cdr(i64 %a0)
  %t1707 = load i64, ptr @"scheme.base:%str-concat"
  call void @rt_check_callable(i64 %t1707)
  %t1708 = and i64 %t1707, -8
  %t1709 = inttoptr i64 %t1708 to ptr
  %t1710 = load i64, ptr %t1709
  %t1711 = inttoptr i64 %t1710 to ptr
  %t1712 = call fastcc i64%t1711(i64 %t1707, i64 1, i64 %t1706, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1713 = call i64 @rt_string_append(i64 %t1705, i64 %t1712)
  ret i64 %t1713
}

define fastcc i64 @"scheme.base:code:chr-cmp"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1718 = icmp eq i64 %argc, 4
  br i1 %t1718, label %argok437, label %arityerr436
arityerr436:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok437:
  %t1719 = call i64 @rt_char_to_integer(i64 %a1)
  %t1720 = call i64 @rt_char_to_integer(i64 %a2)
  call void @rt_check_callable(i64 %a0)
  %t1721 = and i64 %a0, -8
  %t1722 = inttoptr i64 %t1721 to ptr
  %t1723 = load i64, ptr %t1722
  %t1724 = inttoptr i64 %t1723 to ptr
  %t1725 = call fastcc i64%t1724(i64 %a0, i64 2, i64 %t1719, i64 %t1720, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1726 = icmp ne i64 %t1725, 1
  br i1 %t1726, label %then438, label %else439
then438:
  %t1727 = call i64 @rt_null_p(i64 %a3)
  %t1728 = icmp ne i64 %t1727, 1
  br i1 %t1728, label %then440, label %else441
then440:
  ret i64 257
else441:
  %t1729 = call i64 @rt_car(i64 %a3)
  %t1730 = call i64 @rt_cdr(i64 %a3)
  %t1731 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1731)
  %t1732 = and i64 %t1731, -8
  %t1733 = inttoptr i64 %t1732 to ptr
  %t1734 = load i64, ptr %t1733
  %t1735 = inttoptr i64 %t1734 to ptr
  %t1736 = musttail call fastcc i64 %t1735(i64 %t1731, i64 4, i64 %a0, i64 %a2, i64 %t1729, i64 %t1730, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1736
else439:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_341"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1741 = icmp eq i64 %argc, 2
  br i1 %t1741, label %argok443, label %arityerr442
arityerr442:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok443:
  %t1742 = or i64 %a0, %a1
  %t1743 = and i64 %t1742, 7
  %t1744 = icmp eq i64 %t1743, 0
  br i1 %t1744, label %fixfast444, label %fixslow445
fixfast444:
  %t1745 = icmp eq i64 %a0, %a1
  %t1746 = select i1 %t1745, i64 257, i64 1
  br label %fixmerge446
fixslow445:
  %t1747 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge446
fixmerge446:
  %t1748 = phi i64 [ %t1746, %fixfast444 ], [ %t1747, %fixslow445 ]
  ret i64 %t1748
}

define fastcc i64 @"scheme.base:code:char=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1749 = icmp sge i64 %argc, 2
  br i1 %t1749, label %argok448, label %arityerr447
arityerr447:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok448:
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
  store i64 ptrtoint (ptr @"scheme.base:code_341" to i64), ptr %t1760
  %t1762 = or i64 %t1761, 4
  %t1763 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1763)
  %t1764 = and i64 %t1763, -8
  %t1765 = inttoptr i64 %t1764 to ptr
  %t1766 = load i64, ptr %t1765
  %t1767 = inttoptr i64 %t1766 to ptr
  %t1768 = musttail call fastcc i64 %t1767(i64 %t1763, i64 4, i64 %t1762, i64 %a0, i64 %a1, i64 %t1759, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1768
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cchar=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1769 = call ptr @rt_alloc_words(i64 1)
  %t1770 = ptrtoint ptr %t1769 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_341" to i64), ptr %t1769
  %t1771 = or i64 %t1770, 4
  %t1772 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1772)
  %t1773 = and i64 %t1772, -8
  %t1774 = inttoptr i64 %t1773 to ptr
  %t1775 = load i64, ptr %t1774
  %t1776 = inttoptr i64 %t1775 to ptr
  %t1777 = musttail call fastcc i64 %t1776(i64 %t1772, i64 4, i64 %t1771, i64 %a0, i64 %a1, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1777
}

define fastcc i64 @"scheme.base:code_353"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1782 = icmp eq i64 %argc, 2
  br i1 %t1782, label %argok450, label %arityerr449
arityerr449:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok450:
  %t1783 = or i64 %a0, %a1
  %t1784 = and i64 %t1783, 7
  %t1785 = icmp eq i64 %t1784, 0
  br i1 %t1785, label %fixfast451, label %fixslow452
fixfast451:
  %t1786 = icmp slt i64 %a0, %a1
  %t1787 = select i1 %t1786, i64 257, i64 1
  br label %fixmerge453
fixslow452:
  %t1788 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge453
fixmerge453:
  %t1789 = phi i64 [ %t1787, %fixfast451 ], [ %t1788, %fixslow452 ]
  ret i64 %t1789
}

define fastcc i64 @"scheme.base:code:char<?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1790 = icmp sge i64 %argc, 2
  br i1 %t1790, label %argok455, label %arityerr454
arityerr454:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok455:
  %t1791 = call ptr @rt_alloc_words(i64 8)
  %t1792 = getelementptr i64, ptr %t1791, i64 0
  store i64 %a0, ptr %t1792
  %t1793 = getelementptr i64, ptr %t1791, i64 1
  store i64 %a1, ptr %t1793
  %t1794 = getelementptr i64, ptr %t1791, i64 2
  store i64 %a2, ptr %t1794
  %t1795 = getelementptr i64, ptr %t1791, i64 3
  store i64 %a3, ptr %t1795
  %t1796 = getelementptr i64, ptr %t1791, i64 4
  store i64 %a4, ptr %t1796
  %t1797 = getelementptr i64, ptr %t1791, i64 5
  store i64 %a5, ptr %t1797
  %t1798 = getelementptr i64, ptr %t1791, i64 6
  store i64 %a6, ptr %t1798
  %t1799 = getelementptr i64, ptr %t1791, i64 7
  store i64 %a7, ptr %t1799
  %t1800 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1791, ptr %overflow)
  %t1801 = call ptr @rt_alloc_words(i64 1)
  %t1802 = ptrtoint ptr %t1801 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_353" to i64), ptr %t1801
  %t1803 = or i64 %t1802, 4
  %t1804 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1804)
  %t1805 = and i64 %t1804, -8
  %t1806 = inttoptr i64 %t1805 to ptr
  %t1807 = load i64, ptr %t1806
  %t1808 = inttoptr i64 %t1807 to ptr
  %t1809 = musttail call fastcc i64 %t1808(i64 %t1804, i64 4, i64 %t1803, i64 %a0, i64 %a1, i64 %t1800, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1809
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cchar<?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1810 = call ptr @rt_alloc_words(i64 1)
  %t1811 = ptrtoint ptr %t1810 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_353" to i64), ptr %t1810
  %t1812 = or i64 %t1811, 4
  %t1813 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1813)
  %t1814 = and i64 %t1813, -8
  %t1815 = inttoptr i64 %t1814 to ptr
  %t1816 = load i64, ptr %t1815
  %t1817 = inttoptr i64 %t1816 to ptr
  %t1818 = musttail call fastcc i64 %t1817(i64 %t1813, i64 4, i64 %t1812, i64 %a0, i64 %a1, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1818
}

define fastcc i64 @"scheme.base:code_365"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1823 = icmp eq i64 %argc, 2
  br i1 %t1823, label %argok457, label %arityerr456
arityerr456:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok457:
  %t1824 = or i64 %a1, %a0
  %t1825 = and i64 %t1824, 7
  %t1826 = icmp eq i64 %t1825, 0
  br i1 %t1826, label %fixfast458, label %fixslow459
fixfast458:
  %t1827 = icmp slt i64 %a1, %a0
  %t1828 = select i1 %t1827, i64 257, i64 1
  br label %fixmerge460
fixslow459:
  %t1829 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge460
fixmerge460:
  %t1830 = phi i64 [ %t1828, %fixfast458 ], [ %t1829, %fixslow459 ]
  ret i64 %t1830
}

define fastcc i64 @"scheme.base:code:char>?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1831 = icmp sge i64 %argc, 2
  br i1 %t1831, label %argok462, label %arityerr461
arityerr461:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok462:
  %t1832 = call ptr @rt_alloc_words(i64 8)
  %t1833 = getelementptr i64, ptr %t1832, i64 0
  store i64 %a0, ptr %t1833
  %t1834 = getelementptr i64, ptr %t1832, i64 1
  store i64 %a1, ptr %t1834
  %t1835 = getelementptr i64, ptr %t1832, i64 2
  store i64 %a2, ptr %t1835
  %t1836 = getelementptr i64, ptr %t1832, i64 3
  store i64 %a3, ptr %t1836
  %t1837 = getelementptr i64, ptr %t1832, i64 4
  store i64 %a4, ptr %t1837
  %t1838 = getelementptr i64, ptr %t1832, i64 5
  store i64 %a5, ptr %t1838
  %t1839 = getelementptr i64, ptr %t1832, i64 6
  store i64 %a6, ptr %t1839
  %t1840 = getelementptr i64, ptr %t1832, i64 7
  store i64 %a7, ptr %t1840
  %t1841 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1832, ptr %overflow)
  %t1842 = call ptr @rt_alloc_words(i64 1)
  %t1843 = ptrtoint ptr %t1842 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_365" to i64), ptr %t1842
  %t1844 = or i64 %t1843, 4
  %t1845 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1845)
  %t1846 = and i64 %t1845, -8
  %t1847 = inttoptr i64 %t1846 to ptr
  %t1848 = load i64, ptr %t1847
  %t1849 = inttoptr i64 %t1848 to ptr
  %t1850 = musttail call fastcc i64 %t1849(i64 %t1845, i64 4, i64 %t1844, i64 %a0, i64 %a1, i64 %t1841, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1850
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cchar>?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1851 = call ptr @rt_alloc_words(i64 1)
  %t1852 = ptrtoint ptr %t1851 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_365" to i64), ptr %t1851
  %t1853 = or i64 %t1852, 4
  %t1854 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1854)
  %t1855 = and i64 %t1854, -8
  %t1856 = inttoptr i64 %t1855 to ptr
  %t1857 = load i64, ptr %t1856
  %t1858 = inttoptr i64 %t1857 to ptr
  %t1859 = musttail call fastcc i64 %t1858(i64 %t1854, i64 4, i64 %t1853, i64 %a0, i64 %a1, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1859
}

define fastcc i64 @"scheme.base:code_377"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1864 = icmp eq i64 %argc, 2
  br i1 %t1864, label %argok464, label %arityerr463
arityerr463:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok464:
  %t1865 = or i64 %a0, %a1
  %t1866 = and i64 %t1865, 7
  %t1867 = icmp eq i64 %t1866, 0
  br i1 %t1867, label %fixfast465, label %fixslow466
fixfast465:
  %t1868 = icmp slt i64 %a0, %a1
  %t1869 = select i1 %t1868, i64 257, i64 1
  br label %fixmerge467
fixslow466:
  %t1870 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge467
fixmerge467:
  %t1871 = phi i64 [ %t1869, %fixfast465 ], [ %t1870, %fixslow466 ]
  %t1872 = icmp ne i64 %t1871, 1
  br i1 %t1872, label %then468, label %else469
then468:
  ret i64 257
else469:
  %t1873 = or i64 %a0, %a1
  %t1874 = and i64 %t1873, 7
  %t1875 = icmp eq i64 %t1874, 0
  br i1 %t1875, label %fixfast470, label %fixslow471
fixfast470:
  %t1876 = icmp eq i64 %a0, %a1
  %t1877 = select i1 %t1876, i64 257, i64 1
  br label %fixmerge472
fixslow471:
  %t1878 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge472
fixmerge472:
  %t1879 = phi i64 [ %t1877, %fixfast470 ], [ %t1878, %fixslow471 ]
  ret i64 %t1879
}

define fastcc i64 @"scheme.base:code:char<=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1880 = icmp sge i64 %argc, 2
  br i1 %t1880, label %argok474, label %arityerr473
arityerr473:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok474:
  %t1881 = call ptr @rt_alloc_words(i64 8)
  %t1882 = getelementptr i64, ptr %t1881, i64 0
  store i64 %a0, ptr %t1882
  %t1883 = getelementptr i64, ptr %t1881, i64 1
  store i64 %a1, ptr %t1883
  %t1884 = getelementptr i64, ptr %t1881, i64 2
  store i64 %a2, ptr %t1884
  %t1885 = getelementptr i64, ptr %t1881, i64 3
  store i64 %a3, ptr %t1885
  %t1886 = getelementptr i64, ptr %t1881, i64 4
  store i64 %a4, ptr %t1886
  %t1887 = getelementptr i64, ptr %t1881, i64 5
  store i64 %a5, ptr %t1887
  %t1888 = getelementptr i64, ptr %t1881, i64 6
  store i64 %a6, ptr %t1888
  %t1889 = getelementptr i64, ptr %t1881, i64 7
  store i64 %a7, ptr %t1889
  %t1890 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1881, ptr %overflow)
  %t1891 = call ptr @rt_alloc_words(i64 1)
  %t1892 = ptrtoint ptr %t1891 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_377" to i64), ptr %t1891
  %t1893 = or i64 %t1892, 4
  %t1894 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1894)
  %t1895 = and i64 %t1894, -8
  %t1896 = inttoptr i64 %t1895 to ptr
  %t1897 = load i64, ptr %t1896
  %t1898 = inttoptr i64 %t1897 to ptr
  %t1899 = musttail call fastcc i64 %t1898(i64 %t1894, i64 4, i64 %t1893, i64 %a0, i64 %a1, i64 %t1890, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1899
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cchar<=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1900 = call ptr @rt_alloc_words(i64 1)
  %t1901 = ptrtoint ptr %t1900 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_377" to i64), ptr %t1900
  %t1902 = or i64 %t1901, 4
  %t1903 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1903)
  %t1904 = and i64 %t1903, -8
  %t1905 = inttoptr i64 %t1904 to ptr
  %t1906 = load i64, ptr %t1905
  %t1907 = inttoptr i64 %t1906 to ptr
  %t1908 = musttail call fastcc i64 %t1907(i64 %t1903, i64 4, i64 %t1902, i64 %a0, i64 %a1, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1908
}

define fastcc i64 @"scheme.base:code_389"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1913 = icmp eq i64 %argc, 2
  br i1 %t1913, label %argok476, label %arityerr475
arityerr475:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok476:
  %t1914 = or i64 %a1, %a0
  %t1915 = and i64 %t1914, 7
  %t1916 = icmp eq i64 %t1915, 0
  br i1 %t1916, label %fixfast477, label %fixslow478
fixfast477:
  %t1917 = icmp slt i64 %a1, %a0
  %t1918 = select i1 %t1917, i64 257, i64 1
  br label %fixmerge479
fixslow478:
  %t1919 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge479
fixmerge479:
  %t1920 = phi i64 [ %t1918, %fixfast477 ], [ %t1919, %fixslow478 ]
  %t1921 = icmp ne i64 %t1920, 1
  br i1 %t1921, label %then480, label %else481
then480:
  ret i64 257
else481:
  %t1922 = or i64 %a0, %a1
  %t1923 = and i64 %t1922, 7
  %t1924 = icmp eq i64 %t1923, 0
  br i1 %t1924, label %fixfast482, label %fixslow483
fixfast482:
  %t1925 = icmp eq i64 %a0, %a1
  %t1926 = select i1 %t1925, i64 257, i64 1
  br label %fixmerge484
fixslow483:
  %t1927 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge484
fixmerge484:
  %t1928 = phi i64 [ %t1926, %fixfast482 ], [ %t1927, %fixslow483 ]
  ret i64 %t1928
}

define fastcc i64 @"scheme.base:code:char>=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1929 = icmp sge i64 %argc, 2
  br i1 %t1929, label %argok486, label %arityerr485
arityerr485:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok486:
  %t1930 = call ptr @rt_alloc_words(i64 8)
  %t1931 = getelementptr i64, ptr %t1930, i64 0
  store i64 %a0, ptr %t1931
  %t1932 = getelementptr i64, ptr %t1930, i64 1
  store i64 %a1, ptr %t1932
  %t1933 = getelementptr i64, ptr %t1930, i64 2
  store i64 %a2, ptr %t1933
  %t1934 = getelementptr i64, ptr %t1930, i64 3
  store i64 %a3, ptr %t1934
  %t1935 = getelementptr i64, ptr %t1930, i64 4
  store i64 %a4, ptr %t1935
  %t1936 = getelementptr i64, ptr %t1930, i64 5
  store i64 %a5, ptr %t1936
  %t1937 = getelementptr i64, ptr %t1930, i64 6
  store i64 %a6, ptr %t1937
  %t1938 = getelementptr i64, ptr %t1930, i64 7
  store i64 %a7, ptr %t1938
  %t1939 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1930, ptr %overflow)
  %t1940 = call ptr @rt_alloc_words(i64 1)
  %t1941 = ptrtoint ptr %t1940 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_389" to i64), ptr %t1940
  %t1942 = or i64 %t1941, 4
  %t1943 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1943)
  %t1944 = and i64 %t1943, -8
  %t1945 = inttoptr i64 %t1944 to ptr
  %t1946 = load i64, ptr %t1945
  %t1947 = inttoptr i64 %t1946 to ptr
  %t1948 = musttail call fastcc i64 %t1947(i64 %t1943, i64 4, i64 %t1942, i64 %a0, i64 %a1, i64 %t1939, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1948
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cchar>=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1949 = call ptr @rt_alloc_words(i64 1)
  %t1950 = ptrtoint ptr %t1949 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_389" to i64), ptr %t1949
  %t1951 = or i64 %t1950, 4
  %t1952 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1952)
  %t1953 = and i64 %t1952, -8
  %t1954 = inttoptr i64 %t1953 to ptr
  %t1955 = load i64, ptr %t1954
  %t1956 = inttoptr i64 %t1955 to ptr
  %t1957 = musttail call fastcc i64 %t1956(i64 %t1952, i64 4, i64 %t1951, i64 %a0, i64 %a1, i64 2, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1957
}

define fastcc i64 @"scheme.base:code_404"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1962 = icmp eq i64 %argc, 2
  br i1 %t1962, label %argok488, label %arityerr487
arityerr487:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok488:
  %t1963 = and i64 %self, -8
  %t1964 = inttoptr i64 %t1963 to ptr
  %t1965 = getelementptr i64, ptr %t1964, i64 1
  %t1966 = load i64, ptr %t1965
  %t1967 = or i64 %a0, %t1966
  %t1968 = and i64 %t1967, 7
  %t1969 = icmp eq i64 %t1968, 0
  br i1 %t1969, label %fixfast489, label %fixslow490
fixfast489:
  %t1970 = icmp slt i64 %a0, %t1966
  %t1971 = select i1 %t1970, i64 257, i64 1
  br label %fixmerge491
fixslow490:
  %t1972 = call i64 @rt_lt(i64 %a0, i64 %t1966)
  br label %fixmerge491
fixmerge491:
  %t1973 = phi i64 [ %t1971, %fixfast489 ], [ %t1972, %fixslow490 ]
  %t1974 = icmp ne i64 %t1973, 1
  br i1 %t1974, label %then492, label %else493
then492:
  ret i64 %a1
else493:
  %t1975 = or i64 %a0, 8
  %t1976 = and i64 %t1975, 7
  %t1977 = icmp eq i64 %t1976, 0
  br i1 %t1977, label %fixfast494, label %fixslow495
fixfast494:
  %t1978 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t1979 = extractvalue {i64, i1} %t1978, 0
  %t1980 = extractvalue {i64, i1} %t1978, 1
  br i1 %t1980, label %fixslow495, label %fixmerge496
fixslow495:
  %t1981 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge496
fixmerge496:
  %t1982 = phi i64 [ %t1979, %fixfast494 ], [ %t1981, %fixslow495 ]
  %t1983 = and i64 %self, -8
  %t1984 = inttoptr i64 %t1983 to ptr
  %t1985 = getelementptr i64, ptr %t1984, i64 3
  %t1986 = load i64, ptr %t1985
  %t1987 = call i64 @rt_string_ref(i64 %t1986, i64 %a0)
  %t1988 = call i64 @rt_cons(i64 %t1987, i64 %a1)
  %t1989 = musttail call fastcc i64 @"scheme.base:code_404"(i64 %self, i64 2, i64 %t1982, i64 %t1988, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1989
}

define fastcc i64 @"scheme.base:code:string->list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1990 = icmp sge i64 %argc, 1
  br i1 %t1990, label %argok498, label %arityerr497
arityerr497:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok498:
  %t1991 = call ptr @rt_alloc_words(i64 8)
  %t1992 = getelementptr i64, ptr %t1991, i64 0
  store i64 %a0, ptr %t1992
  %t1993 = getelementptr i64, ptr %t1991, i64 1
  store i64 %a1, ptr %t1993
  %t1994 = getelementptr i64, ptr %t1991, i64 2
  store i64 %a2, ptr %t1994
  %t1995 = getelementptr i64, ptr %t1991, i64 3
  store i64 %a3, ptr %t1995
  %t1996 = getelementptr i64, ptr %t1991, i64 4
  store i64 %a4, ptr %t1996
  %t1997 = getelementptr i64, ptr %t1991, i64 5
  store i64 %a5, ptr %t1997
  %t1998 = getelementptr i64, ptr %t1991, i64 6
  store i64 %a6, ptr %t1998
  %t1999 = getelementptr i64, ptr %t1991, i64 7
  store i64 %a7, ptr %t1999
  %t2000 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t1991, ptr %overflow)
  %t2001 = call i64 @rt_string_length(i64 %a0)
  %t2002 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t2002)
  %t2003 = and i64 %t2002, -8
  %t2004 = inttoptr i64 %t2003 to ptr
  %t2005 = load i64, ptr %t2004
  %t2006 = inttoptr i64 %t2005 to ptr
  %t2007 = call fastcc i64%t2006(i64 %t2002, i64 1, i64 %t2000, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2008 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t2008)
  %t2009 = and i64 %t2008, -8
  %t2010 = inttoptr i64 %t2009 to ptr
  %t2011 = load i64, ptr %t2010
  %t2012 = inttoptr i64 %t2011 to ptr
  %t2013 = call fastcc i64%t2012(i64 %t2008, i64 2, i64 %t2000, i64 %t2001, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2014 = call i64 @rt_intern(ptr @.str.sym.5)
  %t2015 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t2015)
  %t2016 = and i64 %t2015, -8
  %t2017 = inttoptr i64 %t2016 to ptr
  %t2018 = load i64, ptr %t2017
  %t2019 = inttoptr i64 %t2018 to ptr
  %t2020 = call fastcc i64%t2019(i64 %t2015, i64 4, i64 %t2014, i64 %t2007, i64 %t2013, i64 %t2001, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2021 = call ptr @rt_alloc_words(i64 4)
  %t2022 = ptrtoint ptr %t2021 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_404" to i64), ptr %t2021
  %t2023 = or i64 %t2022, 4
  %t2024 = getelementptr i64, ptr %t2021, i64 1
  store i64 %t2007, ptr %t2024
  %t2025 = getelementptr i64, ptr %t2021, i64 2
  store i64 %t2023, ptr %t2025
  %t2026 = getelementptr i64, ptr %t2021, i64 3
  store i64 %a0, ptr %t2026
  %t2027 = or i64 %t2013, 8
  %t2028 = and i64 %t2027, 7
  %t2029 = icmp eq i64 %t2028, 0
  br i1 %t2029, label %fixfast499, label %fixslow500
fixfast499:
  %t2030 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t2013, i64 8)
  %t2031 = extractvalue {i64, i1} %t2030, 0
  %t2032 = extractvalue {i64, i1} %t2030, 1
  br i1 %t2032, label %fixslow500, label %fixmerge501
fixslow500:
  %t2033 = call i64 @rt_sub(i64 %t2013, i64 8)
  br label %fixmerge501
fixmerge501:
  %t2034 = phi i64 [ %t2031, %fixfast499 ], [ %t2033, %fixslow500 ]
  %t2035 = musttail call fastcc i64 @"scheme.base:code_404"(i64 %t2023, i64 2, i64 %t2034, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2035
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring->list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2036 = call i64 @rt_string_length(i64 %a0)
  %t2037 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t2037)
  %t2038 = and i64 %t2037, -8
  %t2039 = inttoptr i64 %t2038 to ptr
  %t2040 = load i64, ptr %t2039
  %t2041 = inttoptr i64 %t2040 to ptr
  %t2042 = call fastcc i64%t2041(i64 %t2037, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2043 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t2043)
  %t2044 = and i64 %t2043, -8
  %t2045 = inttoptr i64 %t2044 to ptr
  %t2046 = load i64, ptr %t2045
  %t2047 = inttoptr i64 %t2046 to ptr
  %t2048 = call fastcc i64%t2047(i64 %t2043, i64 2, i64 2, i64 %t2036, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2049 = call i64 @rt_intern(ptr @.str.sym.5)
  %t2050 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t2050)
  %t2051 = and i64 %t2050, -8
  %t2052 = inttoptr i64 %t2051 to ptr
  %t2053 = load i64, ptr %t2052
  %t2054 = inttoptr i64 %t2053 to ptr
  %t2055 = call fastcc i64%t2054(i64 %t2050, i64 4, i64 %t2049, i64 %t2042, i64 %t2048, i64 %t2036, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2056 = call ptr @rt_alloc_words(i64 4)
  %t2057 = ptrtoint ptr %t2056 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_404" to i64), ptr %t2056
  %t2058 = or i64 %t2057, 4
  %t2059 = getelementptr i64, ptr %t2056, i64 1
  store i64 %t2042, ptr %t2059
  %t2060 = getelementptr i64, ptr %t2056, i64 2
  store i64 %t2058, ptr %t2060
  %t2061 = getelementptr i64, ptr %t2056, i64 3
  store i64 %a0, ptr %t2061
  %t2062 = or i64 %t2048, 8
  %t2063 = and i64 %t2062, 7
  %t2064 = icmp eq i64 %t2063, 0
  br i1 %t2064, label %fixfast502, label %fixslow503
fixfast502:
  %t2065 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t2048, i64 8)
  %t2066 = extractvalue {i64, i1} %t2065, 0
  %t2067 = extractvalue {i64, i1} %t2065, 1
  br i1 %t2067, label %fixslow503, label %fixmerge504
fixslow503:
  %t2068 = call i64 @rt_sub(i64 %t2048, i64 8)
  br label %fixmerge504
fixmerge504:
  %t2069 = phi i64 [ %t2066, %fixfast502 ], [ %t2068, %fixslow503 ]
  %t2070 = musttail call fastcc i64 @"scheme.base:code_404"(i64 %t2058, i64 2, i64 %t2069, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2070
}

define fastcc i64 @"scheme.base:code:ns-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2075 = icmp eq i64 %argc, 2
  br i1 %t2075, label %argok506, label %arityerr505
arityerr505:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok506:
  %t2076 = load i64, ptr @"scheme.base:ns-digits-radix"
  call void @rt_check_callable(i64 %t2076)
  %t2077 = and i64 %t2076, -8
  %t2078 = inttoptr i64 %t2077 to ptr
  %t2079 = load i64, ptr %t2078
  %t2080 = inttoptr i64 %t2079 to ptr
  %t2081 = musttail call fastcc i64 %t2080(i64 %t2076, i64 3, i64 %a0, i64 80, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2081
}

define fastcc i64 @"scheme.base:code:%ns-digit-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2086 = icmp eq i64 %argc, 1
  br i1 %t2086, label %argok508, label %arityerr507
arityerr507:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok508:
  %t2087 = or i64 %a0, 80
  %t2088 = and i64 %t2087, 7
  %t2089 = icmp eq i64 %t2088, 0
  br i1 %t2089, label %fixfast509, label %fixslow510
fixfast509:
  %t2090 = icmp slt i64 %a0, 80
  %t2091 = select i1 %t2090, i64 257, i64 1
  br label %fixmerge511
fixslow510:
  %t2092 = call i64 @rt_lt(i64 %a0, i64 80)
  br label %fixmerge511
fixmerge511:
  %t2093 = phi i64 [ %t2091, %fixfast509 ], [ %t2092, %fixslow510 ]
  %t2094 = icmp ne i64 %t2093, 1
  br i1 %t2094, label %then512, label %else513
then512:
  %t2095 = or i64 384, %a0
  %t2096 = and i64 %t2095, 7
  %t2097 = icmp eq i64 %t2096, 0
  br i1 %t2097, label %fixfast514, label %fixslow515
fixfast514:
  %t2098 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 384, i64 %a0)
  %t2099 = extractvalue {i64, i1} %t2098, 0
  %t2100 = extractvalue {i64, i1} %t2098, 1
  br i1 %t2100, label %fixslow515, label %fixmerge516
fixslow515:
  %t2101 = call i64 @rt_add(i64 384, i64 %a0)
  br label %fixmerge516
fixmerge516:
  %t2102 = phi i64 [ %t2099, %fixfast514 ], [ %t2101, %fixslow515 ]
  %t2103 = call i64 @rt_integer_to_char(i64 %t2102)
  ret i64 %t2103
else513:
  %t2104 = or i64 696, %a0
  %t2105 = and i64 %t2104, 7
  %t2106 = icmp eq i64 %t2105, 0
  br i1 %t2106, label %fixfast517, label %fixslow518
fixfast517:
  %t2107 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 696, i64 %a0)
  %t2108 = extractvalue {i64, i1} %t2107, 0
  %t2109 = extractvalue {i64, i1} %t2107, 1
  br i1 %t2109, label %fixslow518, label %fixmerge519
fixslow518:
  %t2110 = call i64 @rt_add(i64 696, i64 %a0)
  br label %fixmerge519
fixmerge519:
  %t2111 = phi i64 [ %t2108, %fixfast517 ], [ %t2110, %fixslow518 ]
  %t2112 = call i64 @rt_integer_to_char(i64 %t2111)
  ret i64 %t2112
}

define fastcc i64 @"scheme.base:code:ns-digits-radix"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2117 = icmp eq i64 %argc, 3
  br i1 %t2117, label %argok521, label %arityerr520
arityerr520:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok521:
  %t2118 = call i64 @rt_remainder(i64 %a0, i64 %a1)
  %t2119 = or i64 0, %t2118
  %t2120 = and i64 %t2119, 7
  %t2121 = icmp eq i64 %t2120, 0
  br i1 %t2121, label %fixfast522, label %fixslow523
fixfast522:
  %t2122 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %t2118)
  %t2123 = extractvalue {i64, i1} %t2122, 0
  %t2124 = extractvalue {i64, i1} %t2122, 1
  br i1 %t2124, label %fixslow523, label %fixmerge524
fixslow523:
  %t2125 = call i64 @rt_sub(i64 0, i64 %t2118)
  br label %fixmerge524
fixmerge524:
  %t2126 = phi i64 [ %t2123, %fixfast522 ], [ %t2125, %fixslow523 ]
  %t2127 = load i64, ptr @"scheme.base:%ns-digit-char"
  call void @rt_check_callable(i64 %t2127)
  %t2128 = and i64 %t2127, -8
  %t2129 = inttoptr i64 %t2128 to ptr
  %t2130 = load i64, ptr %t2129
  %t2131 = inttoptr i64 %t2130 to ptr
  %t2132 = call fastcc i64%t2131(i64 %t2127, i64 1, i64 %t2126, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2133 = call i64 @rt_quotient(i64 %a0, i64 %a1)
  %t2134 = or i64 %t2133, 0
  %t2135 = and i64 %t2134, 7
  %t2136 = icmp eq i64 %t2135, 0
  br i1 %t2136, label %fixfast525, label %fixslow526
fixfast525:
  %t2137 = icmp eq i64 %t2133, 0
  %t2138 = select i1 %t2137, i64 257, i64 1
  br label %fixmerge527
fixslow526:
  %t2139 = call i64 @rt_num_eq(i64 %t2133, i64 0)
  br label %fixmerge527
fixmerge527:
  %t2140 = phi i64 [ %t2138, %fixfast525 ], [ %t2139, %fixslow526 ]
  %t2141 = icmp ne i64 %t2140, 1
  br i1 %t2141, label %then528, label %else529
then528:
  %t2142 = call i64 @rt_cons(i64 %t2132, i64 %a2)
  ret i64 %t2142
else529:
  %t2143 = call i64 @rt_cons(i64 %t2132, i64 %a2)
  %t2144 = load i64, ptr @"scheme.base:ns-digits-radix"
  call void @rt_check_callable(i64 %t2144)
  %t2145 = and i64 %t2144, -8
  %t2146 = inttoptr i64 %t2145 to ptr
  %t2147 = load i64, ptr %t2146
  %t2148 = inttoptr i64 %t2147 to ptr
  %t2149 = musttail call fastcc i64 %t2148(i64 %t2144, i64 3, i64 %t2133, i64 %a1, i64 %t2143, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2149
}

define fastcc i64 @"scheme.base:code:%radix-ok?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2154 = icmp eq i64 %argc, 1
  br i1 %t2154, label %argok531, label %arityerr530
arityerr530:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok531:
  %t2155 = or i64 %a0, 80
  %t2156 = and i64 %t2155, 7
  %t2157 = icmp eq i64 %t2156, 0
  br i1 %t2157, label %fixfast532, label %fixslow533
fixfast532:
  %t2158 = icmp eq i64 %a0, 80
  %t2159 = select i1 %t2158, i64 257, i64 1
  br label %fixmerge534
fixslow533:
  %t2160 = call i64 @rt_num_eq(i64 %a0, i64 80)
  br label %fixmerge534
fixmerge534:
  %t2161 = phi i64 [ %t2159, %fixfast532 ], [ %t2160, %fixslow533 ]
  %t2162 = icmp ne i64 %t2161, 1
  br i1 %t2162, label %then535, label %else536
then535:
  ret i64 257
else536:
  %t2163 = or i64 %a0, 128
  %t2164 = and i64 %t2163, 7
  %t2165 = icmp eq i64 %t2164, 0
  br i1 %t2165, label %fixfast537, label %fixslow538
fixfast537:
  %t2166 = icmp eq i64 %a0, 128
  %t2167 = select i1 %t2166, i64 257, i64 1
  br label %fixmerge539
fixslow538:
  %t2168 = call i64 @rt_num_eq(i64 %a0, i64 128)
  br label %fixmerge539
fixmerge539:
  %t2169 = phi i64 [ %t2167, %fixfast537 ], [ %t2168, %fixslow538 ]
  %t2170 = icmp ne i64 %t2169, 1
  br i1 %t2170, label %then540, label %else541
then540:
  ret i64 257
else541:
  %t2171 = or i64 %a0, 64
  %t2172 = and i64 %t2171, 7
  %t2173 = icmp eq i64 %t2172, 0
  br i1 %t2173, label %fixfast542, label %fixslow543
fixfast542:
  %t2174 = icmp eq i64 %a0, 64
  %t2175 = select i1 %t2174, i64 257, i64 1
  br label %fixmerge544
fixslow543:
  %t2176 = call i64 @rt_num_eq(i64 %a0, i64 64)
  br label %fixmerge544
fixmerge544:
  %t2177 = phi i64 [ %t2175, %fixfast542 ], [ %t2176, %fixslow543 ]
  %t2178 = icmp ne i64 %t2177, 1
  br i1 %t2178, label %then545, label %else546
then545:
  ret i64 257
else546:
  %t2179 = or i64 %a0, 16
  %t2180 = and i64 %t2179, 7
  %t2181 = icmp eq i64 %t2180, 0
  br i1 %t2181, label %fixfast547, label %fixslow548
fixfast547:
  %t2182 = icmp eq i64 %a0, 16
  %t2183 = select i1 %t2182, i64 257, i64 1
  br label %fixmerge549
fixslow548:
  %t2184 = call i64 @rt_num_eq(i64 %a0, i64 16)
  br label %fixmerge549
fixmerge549:
  %t2185 = phi i64 [ %t2183, %fixfast547 ], [ %t2184, %fixslow548 ]
  ret i64 %t2185
}

define fastcc i64 @"scheme.base:code:number->string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2190 = icmp sge i64 %argc, 1
  br i1 %t2190, label %argok551, label %arityerr550
arityerr550:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok551:
  %t2191 = call ptr @rt_alloc_words(i64 8)
  %t2192 = getelementptr i64, ptr %t2191, i64 0
  store i64 %a0, ptr %t2192
  %t2193 = getelementptr i64, ptr %t2191, i64 1
  store i64 %a1, ptr %t2193
  %t2194 = getelementptr i64, ptr %t2191, i64 2
  store i64 %a2, ptr %t2194
  %t2195 = getelementptr i64, ptr %t2191, i64 3
  store i64 %a3, ptr %t2195
  %t2196 = getelementptr i64, ptr %t2191, i64 4
  store i64 %a4, ptr %t2196
  %t2197 = getelementptr i64, ptr %t2191, i64 5
  store i64 %a5, ptr %t2197
  %t2198 = getelementptr i64, ptr %t2191, i64 6
  store i64 %a6, ptr %t2198
  %t2199 = getelementptr i64, ptr %t2191, i64 7
  store i64 %a7, ptr %t2199
  %t2200 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2191, ptr %overflow)
  %t2201 = call i64 @rt_null_p(i64 %t2200)
  %t2202 = icmp ne i64 %t2201, 1
  br i1 %t2202, label %then552, label %else553
then552:
  br label %merge554
else553:
  %t2203 = call i64 @rt_car(i64 %t2200)
  br label %merge554
merge554:
  %t2204 = phi i64 [ 80, %then552 ], [ %t2203, %else553 ]
  %t2205 = load i64, ptr @"scheme.base:%radix-ok?"
  call void @rt_check_callable(i64 %t2205)
  %t2206 = and i64 %t2205, -8
  %t2207 = inttoptr i64 %t2206 to ptr
  %t2208 = load i64, ptr %t2207
  %t2209 = inttoptr i64 %t2208 to ptr
  %t2210 = call fastcc i64%t2209(i64 %t2205, i64 1, i64 %t2204, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2211 = icmp ne i64 %t2210, 1
  br i1 %t2211, label %then555, label %else556
then555:
  %t2212 = call i64 @rt_exact_p(i64 %a0)
  %t2213 = icmp ne i64 %t2212, 1
  br i1 %t2213, label %then557, label %else558
then557:
  %t2214 = or i64 %a0, 0
  %t2215 = and i64 %t2214, 7
  %t2216 = icmp eq i64 %t2215, 0
  br i1 %t2216, label %fixfast559, label %fixslow560
fixfast559:
  %t2217 = icmp eq i64 %a0, 0
  %t2218 = select i1 %t2217, i64 257, i64 1
  br label %fixmerge561
fixslow560:
  %t2219 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge561
fixmerge561:
  %t2220 = phi i64 [ %t2218, %fixfast559 ], [ %t2219, %fixslow560 ]
  %t2221 = icmp ne i64 %t2220, 1
  br i1 %t2221, label %then562, label %else563
then562:
  %t2222 = call i64 @rt_make_string(ptr @.str.lit.6, i64 1)
  ret i64 %t2222
else563:
  %t2223 = or i64 %a0, 0
  %t2224 = and i64 %t2223, 7
  %t2225 = icmp eq i64 %t2224, 0
  br i1 %t2225, label %fixfast564, label %fixslow565
fixfast564:
  %t2226 = icmp slt i64 %a0, 0
  %t2227 = select i1 %t2226, i64 257, i64 1
  br label %fixmerge566
fixslow565:
  %t2228 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge566
fixmerge566:
  %t2229 = phi i64 [ %t2227, %fixfast564 ], [ %t2228, %fixslow565 ]
  %t2230 = icmp ne i64 %t2229, 1
  br i1 %t2230, label %then567, label %else568
then567:
  %t2231 = load i64, ptr @"scheme.base:ns-digits-radix"
  call void @rt_check_callable(i64 %t2231)
  %t2232 = and i64 %t2231, -8
  %t2233 = inttoptr i64 %t2232 to ptr
  %t2234 = load i64, ptr %t2233
  %t2235 = inttoptr i64 %t2234 to ptr
  %t2236 = call fastcc i64%t2235(i64 %t2231, i64 3, i64 %a0, i64 %t2204, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2237 = call i64 @rt_cons(i64 11529, i64 %t2236)
  %t2238 = call i64 @rt_list_to_string(i64 %t2237)
  ret i64 %t2238
else568:
  %t2239 = or i64 0, %a0
  %t2240 = and i64 %t2239, 7
  %t2241 = icmp eq i64 %t2240, 0
  br i1 %t2241, label %fixfast569, label %fixslow570
fixfast569:
  %t2242 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %a0)
  %t2243 = extractvalue {i64, i1} %t2242, 0
  %t2244 = extractvalue {i64, i1} %t2242, 1
  br i1 %t2244, label %fixslow570, label %fixmerge571
fixslow570:
  %t2245 = call i64 @rt_sub(i64 0, i64 %a0)
  br label %fixmerge571
fixmerge571:
  %t2246 = phi i64 [ %t2243, %fixfast569 ], [ %t2245, %fixslow570 ]
  %t2247 = load i64, ptr @"scheme.base:ns-digits-radix"
  call void @rt_check_callable(i64 %t2247)
  %t2248 = and i64 %t2247, -8
  %t2249 = inttoptr i64 %t2248 to ptr
  %t2250 = load i64, ptr %t2249
  %t2251 = inttoptr i64 %t2250 to ptr
  %t2252 = call fastcc i64%t2251(i64 %t2247, i64 3, i64 %t2246, i64 %t2204, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2253 = call i64 @rt_list_to_string(i64 %t2252)
  ret i64 %t2253
else558:
  %t2254 = or i64 %t2204, 80
  %t2255 = and i64 %t2254, 7
  %t2256 = icmp eq i64 %t2255, 0
  br i1 %t2256, label %fixfast572, label %fixslow573
fixfast572:
  %t2257 = icmp eq i64 %t2204, 80
  %t2258 = select i1 %t2257, i64 257, i64 1
  br label %fixmerge574
fixslow573:
  %t2259 = call i64 @rt_num_eq(i64 %t2204, i64 80)
  br label %fixmerge574
fixmerge574:
  %t2260 = phi i64 [ %t2258, %fixfast572 ], [ %t2259, %fixslow573 ]
  %t2261 = icmp ne i64 %t2260, 1
  br i1 %t2261, label %then575, label %else576
then575:
  %t2262 = call i64 @rt_flonum_to_string(i64 %a0)
  ret i64 %t2262
else576:
  %t2263 = call i64 @rt_make_string(ptr @.str.lit.7, i64 54)
  %t2264 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t2264)
  %t2265 = and i64 %t2264, -8
  %t2266 = inttoptr i64 %t2265 to ptr
  %t2267 = load i64, ptr %t2266
  %t2268 = inttoptr i64 %t2267 to ptr
  %t2269 = musttail call fastcc i64 %t2268(i64 %t2264, i64 2, i64 %t2263, i64 %t2204, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2269
else556:
  %t2270 = call i64 @rt_make_string(ptr @.str.lit.8, i64 33)
  %t2271 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t2271)
  %t2272 = and i64 %t2271, -8
  %t2273 = inttoptr i64 %t2272 to ptr
  %t2274 = load i64, ptr %t2273
  %t2275 = inttoptr i64 %t2274 to ptr
  %t2276 = musttail call fastcc i64 %t2275(i64 %t2271, i64 2, i64 %t2270, i64 %t2204, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2276
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cnumber->string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2277 = call i64 @rt_null_p(i64 2)
  %t2278 = icmp ne i64 %t2277, 1
  br i1 %t2278, label %then577, label %else578
then577:
  br label %merge579
else578:
  %t2279 = call i64 @rt_car(i64 2)
  br label %merge579
merge579:
  %t2280 = phi i64 [ 80, %then577 ], [ %t2279, %else578 ]
  %t2281 = load i64, ptr @"scheme.base:%radix-ok?"
  call void @rt_check_callable(i64 %t2281)
  %t2282 = and i64 %t2281, -8
  %t2283 = inttoptr i64 %t2282 to ptr
  %t2284 = load i64, ptr %t2283
  %t2285 = inttoptr i64 %t2284 to ptr
  %t2286 = call fastcc i64%t2285(i64 %t2281, i64 1, i64 %t2280, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2287 = icmp ne i64 %t2286, 1
  br i1 %t2287, label %then580, label %else581
then580:
  %t2288 = call i64 @rt_exact_p(i64 %a0)
  %t2289 = icmp ne i64 %t2288, 1
  br i1 %t2289, label %then582, label %else583
then582:
  %t2290 = or i64 %a0, 0
  %t2291 = and i64 %t2290, 7
  %t2292 = icmp eq i64 %t2291, 0
  br i1 %t2292, label %fixfast584, label %fixslow585
fixfast584:
  %t2293 = icmp eq i64 %a0, 0
  %t2294 = select i1 %t2293, i64 257, i64 1
  br label %fixmerge586
fixslow585:
  %t2295 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge586
fixmerge586:
  %t2296 = phi i64 [ %t2294, %fixfast584 ], [ %t2295, %fixslow585 ]
  %t2297 = icmp ne i64 %t2296, 1
  br i1 %t2297, label %then587, label %else588
then587:
  %t2298 = call i64 @rt_make_string(ptr @.str.lit.9, i64 1)
  ret i64 %t2298
else588:
  %t2299 = or i64 %a0, 0
  %t2300 = and i64 %t2299, 7
  %t2301 = icmp eq i64 %t2300, 0
  br i1 %t2301, label %fixfast589, label %fixslow590
fixfast589:
  %t2302 = icmp slt i64 %a0, 0
  %t2303 = select i1 %t2302, i64 257, i64 1
  br label %fixmerge591
fixslow590:
  %t2304 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge591
fixmerge591:
  %t2305 = phi i64 [ %t2303, %fixfast589 ], [ %t2304, %fixslow590 ]
  %t2306 = icmp ne i64 %t2305, 1
  br i1 %t2306, label %then592, label %else593
then592:
  %t2307 = load i64, ptr @"scheme.base:ns-digits-radix"
  call void @rt_check_callable(i64 %t2307)
  %t2308 = and i64 %t2307, -8
  %t2309 = inttoptr i64 %t2308 to ptr
  %t2310 = load i64, ptr %t2309
  %t2311 = inttoptr i64 %t2310 to ptr
  %t2312 = call fastcc i64%t2311(i64 %t2307, i64 3, i64 %a0, i64 %t2280, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2313 = call i64 @rt_cons(i64 11529, i64 %t2312)
  %t2314 = call i64 @rt_list_to_string(i64 %t2313)
  ret i64 %t2314
else593:
  %t2315 = or i64 0, %a0
  %t2316 = and i64 %t2315, 7
  %t2317 = icmp eq i64 %t2316, 0
  br i1 %t2317, label %fixfast594, label %fixslow595
fixfast594:
  %t2318 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %a0)
  %t2319 = extractvalue {i64, i1} %t2318, 0
  %t2320 = extractvalue {i64, i1} %t2318, 1
  br i1 %t2320, label %fixslow595, label %fixmerge596
fixslow595:
  %t2321 = call i64 @rt_sub(i64 0, i64 %a0)
  br label %fixmerge596
fixmerge596:
  %t2322 = phi i64 [ %t2319, %fixfast594 ], [ %t2321, %fixslow595 ]
  %t2323 = load i64, ptr @"scheme.base:ns-digits-radix"
  call void @rt_check_callable(i64 %t2323)
  %t2324 = and i64 %t2323, -8
  %t2325 = inttoptr i64 %t2324 to ptr
  %t2326 = load i64, ptr %t2325
  %t2327 = inttoptr i64 %t2326 to ptr
  %t2328 = call fastcc i64%t2327(i64 %t2323, i64 3, i64 %t2322, i64 %t2280, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2329 = call i64 @rt_list_to_string(i64 %t2328)
  ret i64 %t2329
else583:
  %t2330 = or i64 %t2280, 80
  %t2331 = and i64 %t2330, 7
  %t2332 = icmp eq i64 %t2331, 0
  br i1 %t2332, label %fixfast597, label %fixslow598
fixfast597:
  %t2333 = icmp eq i64 %t2280, 80
  %t2334 = select i1 %t2333, i64 257, i64 1
  br label %fixmerge599
fixslow598:
  %t2335 = call i64 @rt_num_eq(i64 %t2280, i64 80)
  br label %fixmerge599
fixmerge599:
  %t2336 = phi i64 [ %t2334, %fixfast597 ], [ %t2335, %fixslow598 ]
  %t2337 = icmp ne i64 %t2336, 1
  br i1 %t2337, label %then600, label %else601
then600:
  %t2338 = call i64 @rt_flonum_to_string(i64 %a0)
  ret i64 %t2338
else601:
  %t2339 = call i64 @rt_make_string(ptr @.str.lit.10, i64 54)
  %t2340 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t2340)
  %t2341 = and i64 %t2340, -8
  %t2342 = inttoptr i64 %t2341 to ptr
  %t2343 = load i64, ptr %t2342
  %t2344 = inttoptr i64 %t2343 to ptr
  %t2345 = musttail call fastcc i64 %t2344(i64 %t2340, i64 2, i64 %t2339, i64 %t2280, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2345
else581:
  %t2346 = call i64 @rt_make_string(ptr @.str.lit.11, i64 33)
  %t2347 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t2347)
  %t2348 = and i64 %t2347, -8
  %t2349 = inttoptr i64 %t2348 to ptr
  %t2350 = load i64, ptr %t2349
  %t2351 = inttoptr i64 %t2350 to ptr
  %t2352 = musttail call fastcc i64 %t2351(i64 %t2347, i64 2, i64 %t2346, i64 %t2280, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2352
}

define fastcc i64 @"scheme.base:code:string->number"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2357 = icmp sge i64 %argc, 1
  br i1 %t2357, label %argok603, label %arityerr602
arityerr602:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok603:
  %t2358 = call ptr @rt_alloc_words(i64 8)
  %t2359 = getelementptr i64, ptr %t2358, i64 0
  store i64 %a0, ptr %t2359
  %t2360 = getelementptr i64, ptr %t2358, i64 1
  store i64 %a1, ptr %t2360
  %t2361 = getelementptr i64, ptr %t2358, i64 2
  store i64 %a2, ptr %t2361
  %t2362 = getelementptr i64, ptr %t2358, i64 3
  store i64 %a3, ptr %t2362
  %t2363 = getelementptr i64, ptr %t2358, i64 4
  store i64 %a4, ptr %t2363
  %t2364 = getelementptr i64, ptr %t2358, i64 5
  store i64 %a5, ptr %t2364
  %t2365 = getelementptr i64, ptr %t2358, i64 6
  store i64 %a6, ptr %t2365
  %t2366 = getelementptr i64, ptr %t2358, i64 7
  store i64 %a7, ptr %t2366
  %t2367 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2358, ptr %overflow)
  %t2368 = call i64 @rt_null_p(i64 %t2367)
  %t2369 = icmp ne i64 %t2368, 1
  br i1 %t2369, label %then604, label %else605
then604:
  br label %merge606
else605:
  %t2370 = call i64 @rt_car(i64 %t2367)
  br label %merge606
merge606:
  %t2371 = phi i64 [ 80, %then604 ], [ %t2370, %else605 ]
  %t2372 = load i64, ptr @"scheme.base:%radix-ok?"
  call void @rt_check_callable(i64 %t2372)
  %t2373 = and i64 %t2372, -8
  %t2374 = inttoptr i64 %t2373 to ptr
  %t2375 = load i64, ptr %t2374
  %t2376 = inttoptr i64 %t2375 to ptr
  %t2377 = call fastcc i64%t2376(i64 %t2372, i64 1, i64 %t2371, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2378 = icmp ne i64 %t2377, 1
  br i1 %t2378, label %then607, label %else608
then607:
  %t2379 = load i64, ptr @"emit.internal:rd-number"
  %t2380 = call fastcc i64 @"emit.internal:code:rd-number"(i64 %t2379, i64 2, i64 %a0, i64 %t2371, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2381 = call i64 @rt_symbol_p(i64 %t2380)
  %t2382 = icmp ne i64 %t2381, 1
  br i1 %t2382, label %then609, label %else610
then609:
  ret i64 1
else610:
  ret i64 %t2380
else608:
  %t2383 = call i64 @rt_make_string(ptr @.str.lit.12, i64 33)
  %t2384 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t2384)
  %t2385 = and i64 %t2384, -8
  %t2386 = inttoptr i64 %t2385 to ptr
  %t2387 = load i64, ptr %t2386
  %t2388 = inttoptr i64 %t2387 to ptr
  %t2389 = musttail call fastcc i64 %t2388(i64 %t2384, i64 2, i64 %t2383, i64 %t2371, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2389
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring->number"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2390 = call i64 @rt_null_p(i64 2)
  %t2391 = icmp ne i64 %t2390, 1
  br i1 %t2391, label %then611, label %else612
then611:
  br label %merge613
else612:
  %t2392 = call i64 @rt_car(i64 2)
  br label %merge613
merge613:
  %t2393 = phi i64 [ 80, %then611 ], [ %t2392, %else612 ]
  %t2394 = load i64, ptr @"scheme.base:%radix-ok?"
  call void @rt_check_callable(i64 %t2394)
  %t2395 = and i64 %t2394, -8
  %t2396 = inttoptr i64 %t2395 to ptr
  %t2397 = load i64, ptr %t2396
  %t2398 = inttoptr i64 %t2397 to ptr
  %t2399 = call fastcc i64%t2398(i64 %t2394, i64 1, i64 %t2393, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2400 = icmp ne i64 %t2399, 1
  br i1 %t2400, label %then614, label %else615
then614:
  %t2401 = load i64, ptr @"emit.internal:rd-number"
  %t2402 = call fastcc i64 @"emit.internal:code:rd-number"(i64 %t2401, i64 2, i64 %a0, i64 %t2393, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2403 = call i64 @rt_symbol_p(i64 %t2402)
  %t2404 = icmp ne i64 %t2403, 1
  br i1 %t2404, label %then616, label %else617
then616:
  ret i64 1
else617:
  ret i64 %t2402
else615:
  %t2405 = call i64 @rt_make_string(ptr @.str.lit.13, i64 33)
  %t2406 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t2406)
  %t2407 = and i64 %t2406, -8
  %t2408 = inttoptr i64 %t2407 to ptr
  %t2409 = load i64, ptr %t2408
  %t2410 = inttoptr i64 %t2409 to ptr
  %t2411 = musttail call fastcc i64 %t2410(i64 %t2406, i64 2, i64 %t2405, i64 %t2393, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2411
}

define fastcc i64 @"scheme.base:code:%raise-kinded"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2416 = icmp eq i64 %argc, 3
  br i1 %t2416, label %argok619, label %arityerr618
arityerr618:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok619:
  %t2417 = call i64 @rt_string_p(i64 %a1)
  %t2418 = icmp ne i64 %t2417, 1
  br i1 %t2418, label %then620, label %else621
then620:
  %t2419 = call i64 @rt_make_error_object_kind(i64 %a1, i64 %a2, i64 %a0)
  %t2420 = load i64, ptr @"scheme.base:raise"
  call void @rt_check_callable(i64 %t2420)
  %t2421 = and i64 %t2420, -8
  %t2422 = inttoptr i64 %t2421 to ptr
  %t2423 = load i64, ptr %t2422
  %t2424 = inttoptr i64 %t2423 to ptr
  %t2425 = musttail call fastcc i64 %t2424(i64 %t2420, i64 1, i64 %t2419, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2425
else621:
  %t2426 = call i64 @rt_symbol_to_string(i64 %a1)
  %t2427 = call i64 @rt_make_string(ptr @.str.lit.14, i64 2)
  %t2428 = call i64 @rt_car(i64 %a2)
  %t2429 = call i64 @rt_string_append(i64 %t2427, i64 %t2428)
  %t2430 = call i64 @rt_string_append(i64 %t2426, i64 %t2429)
  %t2431 = call i64 @rt_cdr(i64 %a2)
  %t2432 = call i64 @rt_make_error_object_kind(i64 %t2430, i64 %t2431, i64 %a0)
  %t2433 = load i64, ptr @"scheme.base:raise"
  call void @rt_check_callable(i64 %t2433)
  %t2434 = and i64 %t2433, -8
  %t2435 = inttoptr i64 %t2434 to ptr
  %t2436 = load i64, ptr %t2435
  %t2437 = inttoptr i64 %t2436 to ptr
  %t2438 = musttail call fastcc i64 %t2437(i64 %t2433, i64 1, i64 %t2432, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2438
}

define fastcc i64 @"scheme.base:code:error"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2443 = icmp sge i64 %argc, 1
  br i1 %t2443, label %argok623, label %arityerr622
arityerr622:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok623:
  %t2444 = call ptr @rt_alloc_words(i64 8)
  %t2445 = getelementptr i64, ptr %t2444, i64 0
  store i64 %a0, ptr %t2445
  %t2446 = getelementptr i64, ptr %t2444, i64 1
  store i64 %a1, ptr %t2446
  %t2447 = getelementptr i64, ptr %t2444, i64 2
  store i64 %a2, ptr %t2447
  %t2448 = getelementptr i64, ptr %t2444, i64 3
  store i64 %a3, ptr %t2448
  %t2449 = getelementptr i64, ptr %t2444, i64 4
  store i64 %a4, ptr %t2449
  %t2450 = getelementptr i64, ptr %t2444, i64 5
  store i64 %a5, ptr %t2450
  %t2451 = getelementptr i64, ptr %t2444, i64 6
  store i64 %a6, ptr %t2451
  %t2452 = getelementptr i64, ptr %t2444, i64 7
  store i64 %a7, ptr %t2452
  %t2453 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2444, ptr %overflow)
  %t2454 = call i64 @rt_intern(ptr @.str.sym.15)
  %t2455 = load i64, ptr @"scheme.base:%raise-kinded"
  call void @rt_check_callable(i64 %t2455)
  %t2456 = and i64 %t2455, -8
  %t2457 = inttoptr i64 %t2456 to ptr
  %t2458 = load i64, ptr %t2457
  %t2459 = inttoptr i64 %t2458 to ptr
  %t2460 = musttail call fastcc i64 %t2459(i64 %t2455, i64 3, i64 %t2454, i64 %a0, i64 %t2453, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2460
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cerror"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2461 = call i64 @rt_intern(ptr @.str.sym.15)
  %t2462 = load i64, ptr @"scheme.base:%raise-kinded"
  call void @rt_check_callable(i64 %t2462)
  %t2463 = and i64 %t2462, -8
  %t2464 = inttoptr i64 %t2463 to ptr
  %t2465 = load i64, ptr %t2464
  %t2466 = inttoptr i64 %t2465 to ptr
  %t2467 = musttail call fastcc i64 %t2466(i64 %t2462, i64 3, i64 %t2461, i64 %a0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2467
}

define fastcc i64 @"scheme.base:code:%read-error"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2472 = icmp sge i64 %argc, 1
  br i1 %t2472, label %argok625, label %arityerr624
arityerr624:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok625:
  %t2473 = call ptr @rt_alloc_words(i64 8)
  %t2474 = getelementptr i64, ptr %t2473, i64 0
  store i64 %a0, ptr %t2474
  %t2475 = getelementptr i64, ptr %t2473, i64 1
  store i64 %a1, ptr %t2475
  %t2476 = getelementptr i64, ptr %t2473, i64 2
  store i64 %a2, ptr %t2476
  %t2477 = getelementptr i64, ptr %t2473, i64 3
  store i64 %a3, ptr %t2477
  %t2478 = getelementptr i64, ptr %t2473, i64 4
  store i64 %a4, ptr %t2478
  %t2479 = getelementptr i64, ptr %t2473, i64 5
  store i64 %a5, ptr %t2479
  %t2480 = getelementptr i64, ptr %t2473, i64 6
  store i64 %a6, ptr %t2480
  %t2481 = getelementptr i64, ptr %t2473, i64 7
  store i64 %a7, ptr %t2481
  %t2482 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2473, ptr %overflow)
  %t2483 = call i64 @rt_intern(ptr @.str.sym.16)
  %t2484 = load i64, ptr @"scheme.base:%raise-kinded"
  call void @rt_check_callable(i64 %t2484)
  %t2485 = and i64 %t2484, -8
  %t2486 = inttoptr i64 %t2485 to ptr
  %t2487 = load i64, ptr %t2486
  %t2488 = inttoptr i64 %t2487 to ptr
  %t2489 = musttail call fastcc i64 %t2488(i64 %t2484, i64 3, i64 %t2483, i64 %a0, i64 %t2482, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2489
}

define fastcc i64 @"min-entry:$scheme.base$ccode$c%read-error"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2490 = call i64 @rt_intern(ptr @.str.sym.16)
  %t2491 = load i64, ptr @"scheme.base:%raise-kinded"
  call void @rt_check_callable(i64 %t2491)
  %t2492 = and i64 %t2491, -8
  %t2493 = inttoptr i64 %t2492 to ptr
  %t2494 = load i64, ptr %t2493
  %t2495 = inttoptr i64 %t2494 to ptr
  %t2496 = musttail call fastcc i64 %t2495(i64 %t2491, i64 3, i64 %t2490, i64 %a0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2496
}

define fastcc i64 @"scheme.base:code_474"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2502 = icmp eq i64 %argc, 0
  br i1 %t2502, label %argok627, label %arityerr626
arityerr626:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok627:
  %t2503 = call i64 @rt_trap_object()
  %t2504 = load i64, ptr @"scheme.base:raise"
  call void @rt_check_callable(i64 %t2504)
  %t2505 = and i64 %t2504, -8
  %t2506 = inttoptr i64 %t2505 to ptr
  %t2507 = load i64, ptr %t2506
  %t2508 = inttoptr i64 %t2507 to ptr
  %t2509 = musttail call fastcc i64 %t2508(i64 %t2504, i64 1, i64 %t2503, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2509
}

define fastcc i64 @"scheme.base:code:%unwind-to"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2515 = icmp eq i64 %argc, 1
  br i1 %t2515, label %argok629, label %arityerr628
arityerr628:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok629:
  %t2516 = load i64, ptr @"scheme.base:*winds*"
  %t2517 = call i64 @rt_eq_p(i64 %t2516, i64 %a0)
  %t2518 = icmp ne i64 %t2517, 1
  br i1 %t2518, label %then630, label %else631
then630:
  ret i64 257
else631:
  %t2519 = load i64, ptr @"scheme.base:*winds*"
  %t2520 = call i64 @rt_null_p(i64 %t2519)
  %t2521 = icmp ne i64 %t2520, 1
  br i1 %t2521, label %then632, label %else633
then632:
  ret i64 257
else633:
  %t2522 = load i64, ptr @"scheme.base:*winds*"
  %t2523 = call i64 @rt_car(i64 %t2522)
  %t2524 = load i64, ptr @"scheme.base:*winds*"
  %t2525 = call i64 @rt_cdr(i64 %t2524)
  %t2526 = call i64 @rt_root(i64 %t2525)
  store i64 %t2526, ptr @"scheme.base:*winds*"
  %t2527 = call i64 @rt_cdr(i64 %t2523)
  call void @rt_check_callable(i64 %t2527)
  %t2528 = and i64 %t2527, -8
  %t2529 = inttoptr i64 %t2528 to ptr
  %t2530 = load i64, ptr %t2529
  %t2531 = inttoptr i64 %t2530 to ptr
  %t2532 = call fastcc i64%t2531(i64 %t2527, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2533 = load i64, ptr @"scheme.base:%unwind-to"
  call void @rt_check_callable(i64 %t2533)
  %t2534 = and i64 %t2533, -8
  %t2535 = inttoptr i64 %t2534 to ptr
  %t2536 = load i64, ptr %t2535
  %t2537 = inttoptr i64 %t2536 to ptr
  %t2538 = musttail call fastcc i64 %t2537(i64 %t2533, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2538
}

define fastcc i64 @"scheme.base:code:dynamic-wind"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2543 = icmp eq i64 %argc, 3
  br i1 %t2543, label %argok635, label %arityerr634
arityerr634:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok635:
  call void @rt_check_callable(i64 %a0)
  %t2544 = and i64 %a0, -8
  %t2545 = inttoptr i64 %t2544 to ptr
  %t2546 = load i64, ptr %t2545
  %t2547 = inttoptr i64 %t2546 to ptr
  %t2548 = call fastcc i64%t2547(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2549 = call i64 @rt_cons(i64 %a0, i64 %a2)
  %t2550 = load i64, ptr @"scheme.base:*winds*"
  %t2551 = call i64 @rt_cons(i64 %t2549, i64 %t2550)
  %t2552 = call i64 @rt_root(i64 %t2551)
  store i64 %t2552, ptr @"scheme.base:*winds*"
  call void @rt_check_callable(i64 %a1)
  %t2553 = and i64 %a1, -8
  %t2554 = inttoptr i64 %t2553 to ptr
  %t2555 = load i64, ptr %t2554
  %t2556 = inttoptr i64 %t2555 to ptr
  %t2557 = call fastcc i64%t2556(i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2558 = load i64, ptr @"scheme.base:*winds*"
  %t2559 = call i64 @rt_cdr(i64 %t2558)
  %t2560 = call i64 @rt_root(i64 %t2559)
  store i64 %t2560, ptr @"scheme.base:*winds*"
  call void @rt_check_callable(i64 %a2)
  %t2561 = and i64 %a2, -8
  %t2562 = inttoptr i64 %t2561 to ptr
  %t2563 = load i64, ptr %t2562
  %t2564 = inttoptr i64 %t2563 to ptr
  %t2565 = call fastcc i64%t2564(i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2557
}

define fastcc i64 @"scheme.base:code_495"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2570 = icmp eq i64 %argc, 1
  br i1 %t2570, label %argok637, label %arityerr636
arityerr636:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok637:
  %t2571 = and i64 %self, -8
  %t2572 = inttoptr i64 %t2571 to ptr
  %t2573 = getelementptr i64, ptr %t2572, i64 1
  %t2574 = load i64, ptr %t2573
  %t2575 = call i64 @rt_escape_live_p(i64 %t2574)
  %t2576 = icmp ne i64 %t2575, 1
  br i1 %t2576, label %then638, label %else639
then638:
  %t2577 = and i64 %self, -8
  %t2578 = inttoptr i64 %t2577 to ptr
  %t2579 = getelementptr i64, ptr %t2578, i64 2
  %t2580 = load i64, ptr %t2579
  %t2581 = load i64, ptr @"scheme.base:%unwind-to"
  call void @rt_check_callable(i64 %t2581)
  %t2582 = and i64 %t2581, -8
  %t2583 = inttoptr i64 %t2582 to ptr
  %t2584 = load i64, ptr %t2583
  %t2585 = inttoptr i64 %t2584 to ptr
  %t2586 = call fastcc i64%t2585(i64 %t2581, i64 1, i64 %t2580, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2587 = and i64 %self, -8
  %t2588 = inttoptr i64 %t2587 to ptr
  %t2589 = getelementptr i64, ptr %t2588, i64 1
  %t2590 = load i64, ptr %t2589
  %t2591 = call i64 @rt_escape_to(i64 %t2590, i64 %a0)
  br label %merge640
else639:
  br label %merge640
merge640:
  %t2592 = phi i64 [ %t2591, %then638 ], [ 1, %else639 ]
  %t2593 = call i64 @rt_intern(ptr @.str.sym.17)
  %t2594 = call i64 @rt_make_string(ptr @.str.lit.18, i64 39)
  %t2595 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t2595)
  %t2596 = and i64 %t2595, -8
  %t2597 = inttoptr i64 %t2596 to ptr
  %t2598 = load i64, ptr %t2597
  %t2599 = inttoptr i64 %t2598 to ptr
  %t2600 = musttail call fastcc i64 %t2599(i64 %t2595, i64 2, i64 %t2593, i64 %t2594, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2600
}

define fastcc i64 @"scheme.base:code_493"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2601 = icmp eq i64 %argc, 0
  br i1 %t2601, label %argok642, label %arityerr641
arityerr641:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok642:
  %t2602 = call i64 @rt_escape_frame()
  %t2603 = and i64 %self, -8
  %t2604 = inttoptr i64 %t2603 to ptr
  %t2605 = getelementptr i64, ptr %t2604, i64 2
  %t2606 = load i64, ptr %t2605
  %t2607 = call ptr @rt_alloc_words(i64 3)
  %t2608 = ptrtoint ptr %t2607 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_495" to i64), ptr %t2607
  %t2609 = getelementptr i64, ptr %t2607, i64 1
  store i64 %t2602, ptr %t2609
  %t2610 = getelementptr i64, ptr %t2607, i64 2
  store i64 %t2606, ptr %t2610
  %t2611 = or i64 %t2608, 4
  %t2612 = and i64 %self, -8
  %t2613 = inttoptr i64 %t2612 to ptr
  %t2614 = getelementptr i64, ptr %t2613, i64 1
  %t2615 = load i64, ptr %t2614
  call void @rt_check_callable(i64 %t2615)
  %t2616 = and i64 %t2615, -8
  %t2617 = inttoptr i64 %t2616 to ptr
  %t2618 = load i64, ptr %t2617
  %t2619 = inttoptr i64 %t2618 to ptr
  %t2620 = musttail call fastcc i64 %t2619(i64 %t2615, i64 1, i64 %t2611, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2620
}

define fastcc i64 @"scheme.base:code:call-with-current-continuation"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2621 = icmp eq i64 %argc, 1
  br i1 %t2621, label %argok644, label %arityerr643
arityerr643:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok644:
  %t2622 = load i64, ptr @"scheme.base:*winds*"
  %t2623 = call ptr @rt_alloc_words(i64 3)
  %t2624 = ptrtoint ptr %t2623 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_493" to i64), ptr %t2623
  %t2625 = getelementptr i64, ptr %t2623, i64 1
  store i64 %a0, ptr %t2625
  %t2626 = getelementptr i64, ptr %t2623, i64 2
  store i64 %t2622, ptr %t2626
  %t2627 = or i64 %t2624, 4
  %t2628 = call i64 @rt_run_guarded(ptr @__apply0, i64 %t2627)
  %t2629 = call i64 @rt_cdr(i64 %t2628)
  ret i64 %t2629
}

define fastcc i64 @"scheme.base:code:call/cc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2634 = icmp eq i64 %argc, 1
  br i1 %t2634, label %argok646, label %arityerr645
arityerr645:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok646:
  %t2635 = load i64, ptr @"scheme.base:call-with-current-continuation"
  call void @rt_check_callable(i64 %t2635)
  %t2636 = and i64 %t2635, -8
  %t2637 = inttoptr i64 %t2636 to ptr
  %t2638 = load i64, ptr %t2637
  %t2639 = inttoptr i64 %t2638 to ptr
  %t2640 = musttail call fastcc i64 %t2639(i64 %t2635, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2640
}

define fastcc i64 @"scheme.base:code_503"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2645 = icmp eq i64 %argc, 0
  br i1 %t2645, label %argok648, label %arityerr647
arityerr647:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok648:
  %t2646 = and i64 %self, -8
  %t2647 = inttoptr i64 %t2646 to ptr
  %t2648 = getelementptr i64, ptr %t2647, i64 1
  %t2649 = load i64, ptr %t2648
  %t2650 = and i64 %self, -8
  %t2651 = inttoptr i64 %t2650 to ptr
  %t2652 = getelementptr i64, ptr %t2651, i64 2
  %t2653 = load i64, ptr %t2652
  %t2654 = call i64 @rt_cons(i64 %t2649, i64 %t2653)
  %t2655 = call i64 @rt_root(i64 %t2654)
  store i64 %t2655, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code_505"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2656 = icmp eq i64 %argc, 0
  br i1 %t2656, label %argok650, label %arityerr649
arityerr649:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok650:
  %t2657 = and i64 %self, -8
  %t2658 = inttoptr i64 %t2657 to ptr
  %t2659 = getelementptr i64, ptr %t2658, i64 1
  %t2660 = load i64, ptr %t2659
  %t2661 = call i64 @rt_root(i64 %t2660)
  store i64 %t2661, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code:with-exception-handler"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2662 = icmp eq i64 %argc, 2
  br i1 %t2662, label %argok652, label %arityerr651
arityerr651:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok652:
  %t2663 = load i64, ptr @"scheme.base:*handlers*"
  %t2664 = call ptr @rt_alloc_words(i64 3)
  %t2665 = ptrtoint ptr %t2664 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_503" to i64), ptr %t2664
  %t2666 = getelementptr i64, ptr %t2664, i64 1
  store i64 %a0, ptr %t2666
  %t2667 = getelementptr i64, ptr %t2664, i64 2
  store i64 %t2663, ptr %t2667
  %t2668 = or i64 %t2665, 4
  %t2669 = call ptr @rt_alloc_words(i64 2)
  %t2670 = ptrtoint ptr %t2669 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_505" to i64), ptr %t2669
  %t2671 = getelementptr i64, ptr %t2669, i64 1
  store i64 %t2663, ptr %t2671
  %t2672 = or i64 %t2670, 4
  %t2673 = load i64, ptr @"scheme.base:dynamic-wind"
  call void @rt_check_callable(i64 %t2673)
  %t2674 = and i64 %t2673, -8
  %t2675 = inttoptr i64 %t2674 to ptr
  %t2676 = load i64, ptr %t2675
  %t2677 = inttoptr i64 %t2676 to ptr
  %t2678 = musttail call fastcc i64 %t2677(i64 %t2673, i64 3, i64 %t2668, i64 %a1, i64 %t2672, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2678
}

define fastcc i64 @"scheme.base:code:raise"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2683 = icmp eq i64 %argc, 1
  br i1 %t2683, label %argok654, label %arityerr653
arityerr653:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok654:
  %t2684 = load i64, ptr @"scheme.base:*handlers*"
  %t2685 = call i64 @rt_null_p(i64 %t2684)
  %t2686 = icmp ne i64 %t2685, 1
  br i1 %t2686, label %then655, label %else656
then655:
  %t2687 = call i64 @rt_raise(i64 %a0)
  ret i64 %t2687
else656:
  %t2688 = load i64, ptr @"scheme.base:*handlers*"
  %t2689 = call i64 @rt_car(i64 %t2688)
  %t2690 = load i64, ptr @"scheme.base:*handlers*"
  %t2691 = load i64, ptr @"scheme.base:*handlers*"
  %t2692 = call i64 @rt_cdr(i64 %t2691)
  %t2693 = call i64 @rt_root(i64 %t2692)
  store i64 %t2693, ptr @"scheme.base:*handlers*"
  call void @rt_check_callable(i64 %t2689)
  %t2694 = and i64 %t2689, -8
  %t2695 = inttoptr i64 %t2694 to ptr
  %t2696 = load i64, ptr %t2695
  %t2697 = inttoptr i64 %t2696 to ptr
  %t2698 = call fastcc i64%t2697(i64 %t2689, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2699 = call i64 @rt_root(i64 %t2690)
  store i64 %t2699, ptr @"scheme.base:*handlers*"
  %t2700 = call i64 @rt_raise(i64 %a0)
  ret i64 %t2700
}

define fastcc i64 @"scheme.base:code:error-object?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2705 = icmp eq i64 %argc, 1
  br i1 %t2705, label %argok658, label %arityerr657
arityerr657:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok658:
  %t2706 = call i64 @rt_error_object_p(i64 %a0)
  ret i64 %t2706
}

define fastcc i64 @"scheme.base:code:error-object-message"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2711 = icmp eq i64 %argc, 1
  br i1 %t2711, label %argok660, label %arityerr659
arityerr659:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok660:
  %t2712 = call i64 @rt_error_object_message(i64 %a0)
  ret i64 %t2712
}

define fastcc i64 @"scheme.base:code:error-object-irritants"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2717 = icmp eq i64 %argc, 1
  br i1 %t2717, label %argok662, label %arityerr661
arityerr661:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok662:
  %t2718 = call i64 @rt_error_object_irritants(i64 %a0)
  ret i64 %t2718
}

define fastcc i64 @"scheme.base:code:read-error?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2723 = icmp eq i64 %argc, 1
  br i1 %t2723, label %argok664, label %arityerr663
arityerr663:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok664:
  %t2724 = call i64 @rt_error_object_p(i64 %a0)
  %t2725 = icmp ne i64 %t2724, 1
  br i1 %t2725, label %then665, label %else666
then665:
  %t2726 = call i64 @rt_error_object_kind(i64 %a0)
  %t2727 = call i64 @rt_intern(ptr @.str.sym.16)
  %t2728 = call i64 @rt_eq_p(i64 %t2726, i64 %t2727)
  ret i64 %t2728
else666:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:file-error?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2733 = icmp eq i64 %argc, 1
  br i1 %t2733, label %argok668, label %arityerr667
arityerr667:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok668:
  %t2734 = call i64 @rt_error_object_p(i64 %a0)
  %t2735 = icmp ne i64 %t2734, 1
  br i1 %t2735, label %then669, label %else670
then669:
  %t2736 = call i64 @rt_error_object_kind(i64 %a0)
  %t2737 = call i64 @rt_intern(ptr @.str.sym.19)
  %t2738 = call i64 @rt_eq_p(i64 %t2736, i64 %t2737)
  ret i64 %t2738
else670:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_537"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2743 = icmp eq i64 %argc, 1
  br i1 %t2743, label %argok672, label %arityerr671
arityerr671:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok672:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_539"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2744 = icmp eq i64 %argc, 1
  br i1 %t2744, label %argok674, label %arityerr673
arityerr673:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok674:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_541"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2745 = icmp sge i64 %argc, 0
  br i1 %t2745, label %argok676, label %arityerr675
arityerr675:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok676:
  %t2746 = call ptr @rt_alloc_words(i64 8)
  %t2747 = getelementptr i64, ptr %t2746, i64 0
  store i64 %a0, ptr %t2747
  %t2748 = getelementptr i64, ptr %t2746, i64 1
  store i64 %a1, ptr %t2748
  %t2749 = getelementptr i64, ptr %t2746, i64 2
  store i64 %a2, ptr %t2749
  %t2750 = getelementptr i64, ptr %t2746, i64 3
  store i64 %a3, ptr %t2750
  %t2751 = getelementptr i64, ptr %t2746, i64 4
  store i64 %a4, ptr %t2751
  %t2752 = getelementptr i64, ptr %t2746, i64 5
  store i64 %a5, ptr %t2752
  %t2753 = getelementptr i64, ptr %t2746, i64 6
  store i64 %a6, ptr %t2753
  %t2754 = getelementptr i64, ptr %t2746, i64 7
  store i64 %a7, ptr %t2754
  %t2755 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2746, ptr %overflow)
  %t2756 = call i64 @rt_null_p(i64 %t2755)
  %t2757 = icmp ne i64 %t2756, 1
  br i1 %t2757, label %then677, label %else678
then677:
  %t2758 = and i64 %self, -8
  %t2759 = inttoptr i64 %t2758 to ptr
  %t2760 = getelementptr i64, ptr %t2759, i64 1
  %t2761 = load i64, ptr %t2760
  %t2762 = call i64 @rt_vector_ref(i64 %t2761, i64 0)
  ret i64 %t2762
else678:
  %t2763 = call i64 @rt_cdr(i64 %t2755)
  %t2764 = call i64 @rt_null_p(i64 %t2763)
  %t2765 = icmp ne i64 %t2764, 1
  br i1 %t2765, label %then679, label %else680
then679:
  %t2766 = and i64 %self, -8
  %t2767 = inttoptr i64 %t2766 to ptr
  %t2768 = getelementptr i64, ptr %t2767, i64 1
  %t2769 = load i64, ptr %t2768
  %t2770 = call i64 @rt_car(i64 %t2755)
  %t2771 = and i64 %self, -8
  %t2772 = inttoptr i64 %t2771 to ptr
  %t2773 = getelementptr i64, ptr %t2772, i64 2
  %t2774 = load i64, ptr %t2773
  call void @rt_check_callable(i64 %t2774)
  %t2775 = and i64 %t2774, -8
  %t2776 = inttoptr i64 %t2775 to ptr
  %t2777 = load i64, ptr %t2776
  %t2778 = inttoptr i64 %t2777 to ptr
  %t2779 = call fastcc i64%t2778(i64 %t2774, i64 1, i64 %t2770, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2780 = call i64 @rt_vector_set(i64 %t2769, i64 0, i64 %t2779)
  ret i64 %t2780
else680:
  %t2781 = and i64 %self, -8
  %t2782 = inttoptr i64 %t2781 to ptr
  %t2783 = getelementptr i64, ptr %t2782, i64 1
  %t2784 = load i64, ptr %t2783
  %t2785 = call i64 @rt_car(i64 %t2755)
  %t2786 = call i64 @rt_vector_set(i64 %t2784, i64 0, i64 %t2785)
  ret i64 %t2786
}

define fastcc i64 @"min-entry:$scheme.base$ccode_541"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2787 = call i64 @rt_null_p(i64 2)
  %t2788 = icmp ne i64 %t2787, 1
  br i1 %t2788, label %then681, label %else682
then681:
  %t2789 = and i64 %self, -8
  %t2790 = inttoptr i64 %t2789 to ptr
  %t2791 = getelementptr i64, ptr %t2790, i64 1
  %t2792 = load i64, ptr %t2791
  %t2793 = call i64 @rt_vector_ref(i64 %t2792, i64 0)
  ret i64 %t2793
else682:
  %t2794 = call i64 @rt_cdr(i64 2)
  %t2795 = call i64 @rt_null_p(i64 %t2794)
  %t2796 = icmp ne i64 %t2795, 1
  br i1 %t2796, label %then683, label %else684
then683:
  %t2797 = and i64 %self, -8
  %t2798 = inttoptr i64 %t2797 to ptr
  %t2799 = getelementptr i64, ptr %t2798, i64 1
  %t2800 = load i64, ptr %t2799
  %t2801 = call i64 @rt_car(i64 2)
  %t2802 = and i64 %self, -8
  %t2803 = inttoptr i64 %t2802 to ptr
  %t2804 = getelementptr i64, ptr %t2803, i64 2
  %t2805 = load i64, ptr %t2804
  call void @rt_check_callable(i64 %t2805)
  %t2806 = and i64 %t2805, -8
  %t2807 = inttoptr i64 %t2806 to ptr
  %t2808 = load i64, ptr %t2807
  %t2809 = inttoptr i64 %t2808 to ptr
  %t2810 = call fastcc i64%t2809(i64 %t2805, i64 1, i64 %t2801, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2811 = call i64 @rt_vector_set(i64 %t2800, i64 0, i64 %t2810)
  ret i64 %t2811
else684:
  %t2812 = and i64 %self, -8
  %t2813 = inttoptr i64 %t2812 to ptr
  %t2814 = getelementptr i64, ptr %t2813, i64 1
  %t2815 = load i64, ptr %t2814
  %t2816 = call i64 @rt_car(i64 2)
  %t2817 = call i64 @rt_vector_set(i64 %t2815, i64 0, i64 %t2816)
  ret i64 %t2817
}

define fastcc i64 @"scheme.base:code:make-parameter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2818 = icmp sge i64 %argc, 1
  br i1 %t2818, label %argok686, label %arityerr685
arityerr685:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok686:
  %t2819 = call ptr @rt_alloc_words(i64 8)
  %t2820 = getelementptr i64, ptr %t2819, i64 0
  store i64 %a0, ptr %t2820
  %t2821 = getelementptr i64, ptr %t2819, i64 1
  store i64 %a1, ptr %t2821
  %t2822 = getelementptr i64, ptr %t2819, i64 2
  store i64 %a2, ptr %t2822
  %t2823 = getelementptr i64, ptr %t2819, i64 3
  store i64 %a3, ptr %t2823
  %t2824 = getelementptr i64, ptr %t2819, i64 4
  store i64 %a4, ptr %t2824
  %t2825 = getelementptr i64, ptr %t2819, i64 5
  store i64 %a5, ptr %t2825
  %t2826 = getelementptr i64, ptr %t2819, i64 6
  store i64 %a6, ptr %t2826
  %t2827 = getelementptr i64, ptr %t2819, i64 7
  store i64 %a7, ptr %t2827
  %t2828 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2819, ptr %overflow)
  %t2829 = call i64 @rt_null_p(i64 %t2828)
  %t2830 = icmp ne i64 %t2829, 1
  br i1 %t2830, label %then687, label %else688
then687:
  %t2831 = call ptr @rt_alloc_words(i64 1)
  %t2832 = ptrtoint ptr %t2831 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_537" to i64), ptr %t2831
  %t2833 = or i64 %t2832, 4
  br label %merge689
else688:
  %t2834 = call i64 @rt_car(i64 %t2828)
  br label %merge689
merge689:
  %t2835 = phi i64 [ %t2833, %then687 ], [ %t2834, %else688 ]
  %t2836 = call i64 @rt_make_vector(i64 8, i64 0)
  %t2837 = call i64 @rt_null_p(i64 %t2828)
  %t2838 = icmp ne i64 %t2837, 1
  br i1 %t2838, label %then690, label %else691
then690:
  %t2839 = call ptr @rt_alloc_words(i64 1)
  %t2840 = ptrtoint ptr %t2839 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_539" to i64), ptr %t2839
  %t2841 = or i64 %t2840, 4
  br label %merge692
else691:
  %t2842 = call i64 @rt_car(i64 %t2828)
  br label %merge692
merge692:
  %t2843 = phi i64 [ %t2841, %then690 ], [ %t2842, %else691 ]
  call void @rt_check_callable(i64 %t2843)
  %t2844 = and i64 %t2843, -8
  %t2845 = inttoptr i64 %t2844 to ptr
  %t2846 = load i64, ptr %t2845
  %t2847 = inttoptr i64 %t2846 to ptr
  %t2848 = call fastcc i64%t2847(i64 %t2843, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2849 = call i64 @rt_vector_set(i64 %t2836, i64 0, i64 %t2848)
  %t2850 = call ptr @rt_alloc_words(i64 3)
  %t2851 = ptrtoint ptr %t2850 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_541" to i64), ptr %t2850
  %t2852 = getelementptr i64, ptr %t2850, i64 1
  store i64 %t2836, ptr %t2852
  %t2853 = getelementptr i64, ptr %t2850, i64 2
  store i64 %t2835, ptr %t2853
  %t2854 = or i64 %t2851, 4
  ret i64 %t2854
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cmake-parameter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2855 = call i64 @rt_null_p(i64 2)
  %t2856 = icmp ne i64 %t2855, 1
  br i1 %t2856, label %then693, label %else694
then693:
  %t2857 = call ptr @rt_alloc_words(i64 1)
  %t2858 = ptrtoint ptr %t2857 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_537" to i64), ptr %t2857
  %t2859 = or i64 %t2858, 4
  br label %merge695
else694:
  %t2860 = call i64 @rt_car(i64 2)
  br label %merge695
merge695:
  %t2861 = phi i64 [ %t2859, %then693 ], [ %t2860, %else694 ]
  %t2862 = call i64 @rt_make_vector(i64 8, i64 0)
  %t2863 = call i64 @rt_null_p(i64 2)
  %t2864 = icmp ne i64 %t2863, 1
  br i1 %t2864, label %then696, label %else697
then696:
  %t2865 = call ptr @rt_alloc_words(i64 1)
  %t2866 = ptrtoint ptr %t2865 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_539" to i64), ptr %t2865
  %t2867 = or i64 %t2866, 4
  br label %merge698
else697:
  %t2868 = call i64 @rt_car(i64 2)
  br label %merge698
merge698:
  %t2869 = phi i64 [ %t2867, %then696 ], [ %t2868, %else697 ]
  call void @rt_check_callable(i64 %t2869)
  %t2870 = and i64 %t2869, -8
  %t2871 = inttoptr i64 %t2870 to ptr
  %t2872 = load i64, ptr %t2871
  %t2873 = inttoptr i64 %t2872 to ptr
  %t2874 = call fastcc i64%t2873(i64 %t2869, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2875 = call i64 @rt_vector_set(i64 %t2862, i64 0, i64 %t2874)
  %t2876 = call ptr @rt_alloc_words(i64 3)
  %t2877 = ptrtoint ptr %t2876 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_541" to i64), ptr %t2876
  %t2878 = getelementptr i64, ptr %t2876, i64 1
  store i64 %t2862, ptr %t2878
  %t2879 = getelementptr i64, ptr %t2876, i64 2
  store i64 %t2861, ptr %t2879
  %t2880 = or i64 %t2877, 4
  ret i64 %t2880
}

define fastcc i64 @"scheme.base:code_553"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2885 = icmp eq i64 %argc, 1
  br i1 %t2885, label %argok700, label %arityerr699
arityerr699:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok700:
  call void @rt_check_callable(i64 %a0)
  %t2886 = and i64 %a0, -8
  %t2887 = inttoptr i64 %t2886 to ptr
  %t2888 = load i64, ptr %t2887
  %t2889 = inttoptr i64 %t2888 to ptr
  %t2890 = musttail call fastcc i64 %t2889(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2890
}

define fastcc i64 @"scheme.base:code_557"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2891 = icmp eq i64 %argc, 2
  br i1 %t2891, label %argok702, label %arityerr701
arityerr701:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok702:
  call void @rt_check_callable(i64 %a0)
  %t2892 = and i64 %a0, -8
  %t2893 = inttoptr i64 %t2892 to ptr
  %t2894 = load i64, ptr %t2893
  %t2895 = inttoptr i64 %t2894 to ptr
  %t2896 = musttail call fastcc i64 %t2895(i64 %a0, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2896
}

define fastcc i64 @"scheme.base:code_555"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2897 = icmp eq i64 %argc, 0
  br i1 %t2897, label %argok704, label %arityerr703
arityerr703:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok704:
  %t2898 = call ptr @rt_alloc_words(i64 1)
  %t2899 = ptrtoint ptr %t2898 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_557" to i64), ptr %t2898
  %t2900 = or i64 %t2899, 4
  %t2901 = and i64 %self, -8
  %t2902 = inttoptr i64 %t2901 to ptr
  %t2903 = getelementptr i64, ptr %t2902, i64 1
  %t2904 = load i64, ptr %t2903
  %t2905 = and i64 %self, -8
  %t2906 = inttoptr i64 %t2905 to ptr
  %t2907 = getelementptr i64, ptr %t2906, i64 2
  %t2908 = load i64, ptr %t2907
  %t2909 = load i64, ptr @"scheme.base:for-each"
  call void @rt_check_callable(i64 %t2909)
  %t2910 = and i64 %t2909, -8
  %t2911 = inttoptr i64 %t2910 to ptr
  %t2912 = load i64, ptr %t2911
  %t2913 = inttoptr i64 %t2912 to ptr
  %t2914 = musttail call fastcc i64 %t2913(i64 %t2909, i64 3, i64 %t2900, i64 %t2904, i64 %t2908, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2914
}

define fastcc i64 @"scheme.base:code_561"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2915 = icmp eq i64 %argc, 2
  br i1 %t2915, label %argok706, label %arityerr705
arityerr705:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok706:
  call void @rt_check_callable(i64 %a0)
  %t2916 = and i64 %a0, -8
  %t2917 = inttoptr i64 %t2916 to ptr
  %t2918 = load i64, ptr %t2917
  %t2919 = inttoptr i64 %t2918 to ptr
  %t2920 = musttail call fastcc i64 %t2919(i64 %a0, i64 2, i64 %a1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2920
}

define fastcc i64 @"scheme.base:code_559"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2921 = icmp eq i64 %argc, 0
  br i1 %t2921, label %argok708, label %arityerr707
arityerr707:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok708:
  %t2922 = call ptr @rt_alloc_words(i64 1)
  %t2923 = ptrtoint ptr %t2922 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_561" to i64), ptr %t2922
  %t2924 = or i64 %t2923, 4
  %t2925 = and i64 %self, -8
  %t2926 = inttoptr i64 %t2925 to ptr
  %t2927 = getelementptr i64, ptr %t2926, i64 1
  %t2928 = load i64, ptr %t2927
  %t2929 = and i64 %self, -8
  %t2930 = inttoptr i64 %t2929 to ptr
  %t2931 = getelementptr i64, ptr %t2930, i64 2
  %t2932 = load i64, ptr %t2931
  %t2933 = load i64, ptr @"scheme.base:for-each"
  call void @rt_check_callable(i64 %t2933)
  %t2934 = and i64 %t2933, -8
  %t2935 = inttoptr i64 %t2934 to ptr
  %t2936 = load i64, ptr %t2935
  %t2937 = inttoptr i64 %t2936 to ptr
  %t2938 = musttail call fastcc i64 %t2937(i64 %t2933, i64 3, i64 %t2924, i64 %t2928, i64 %t2932, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2938
}

define fastcc i64 @"scheme.base:code:with-parameters"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2939 = icmp eq i64 %argc, 3
  br i1 %t2939, label %argok710, label %arityerr709
arityerr709:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok710:
  %t2940 = call ptr @rt_alloc_words(i64 1)
  %t2941 = ptrtoint ptr %t2940 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_553" to i64), ptr %t2940
  %t2942 = or i64 %t2941, 4
  %t2943 = load i64, ptr @"scheme.base:map"
  call void @rt_check_callable(i64 %t2943)
  %t2944 = and i64 %t2943, -8
  %t2945 = inttoptr i64 %t2944 to ptr
  %t2946 = load i64, ptr %t2945
  %t2947 = inttoptr i64 %t2946 to ptr
  %t2948 = call fastcc i64%t2947(i64 %t2943, i64 2, i64 %t2942, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2949 = call ptr @rt_alloc_words(i64 3)
  %t2950 = ptrtoint ptr %t2949 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_555" to i64), ptr %t2949
  %t2951 = getelementptr i64, ptr %t2949, i64 1
  store i64 %a0, ptr %t2951
  %t2952 = getelementptr i64, ptr %t2949, i64 2
  store i64 %a1, ptr %t2952
  %t2953 = or i64 %t2950, 4
  %t2954 = call ptr @rt_alloc_words(i64 3)
  %t2955 = ptrtoint ptr %t2954 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_559" to i64), ptr %t2954
  %t2956 = getelementptr i64, ptr %t2954, i64 1
  store i64 %a0, ptr %t2956
  %t2957 = getelementptr i64, ptr %t2954, i64 2
  store i64 %t2948, ptr %t2957
  %t2958 = or i64 %t2955, 4
  %t2959 = load i64, ptr @"scheme.base:dynamic-wind"
  call void @rt_check_callable(i64 %t2959)
  %t2960 = and i64 %t2959, -8
  %t2961 = inttoptr i64 %t2960 to ptr
  %t2962 = load i64, ptr %t2961
  %t2963 = inttoptr i64 %t2962 to ptr
  %t2964 = musttail call fastcc i64 %t2963(i64 %t2959, i64 3, i64 %t2953, i64 %a2, i64 %t2958, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2964
}

define fastcc i64 @"scheme.base:code_569"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2969 = icmp eq i64 %argc, 2
  br i1 %t2969, label %argok712, label %arityerr711
arityerr711:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok712:
  %t2970 = call i64 @rt_null_p(i64 %a0)
  %t2971 = icmp ne i64 %t2970, 1
  br i1 %t2971, label %then713, label %else714
then713:
  %t2972 = and i64 %self, -8
  %t2973 = inttoptr i64 %t2972 to ptr
  %t2974 = getelementptr i64, ptr %t2973, i64 1
  %t2975 = load i64, ptr %t2974
  ret i64 %t2975
else714:
  %t2976 = and i64 %self, -8
  %t2977 = inttoptr i64 %t2976 to ptr
  %t2978 = getelementptr i64, ptr %t2977, i64 1
  %t2979 = load i64, ptr %t2978
  %t2980 = call i64 @rt_car(i64 %a0)
  %t2981 = call i64 @rt_vector_set(i64 %t2979, i64 %a1, i64 %t2980)
  %t2982 = call i64 @rt_cdr(i64 %a0)
  %t2983 = or i64 %a1, 8
  %t2984 = and i64 %t2983, 7
  %t2985 = icmp eq i64 %t2984, 0
  br i1 %t2985, label %fixfast715, label %fixslow716
fixfast715:
  %t2986 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t2987 = extractvalue {i64, i1} %t2986, 0
  %t2988 = extractvalue {i64, i1} %t2986, 1
  br i1 %t2988, label %fixslow716, label %fixmerge717
fixslow716:
  %t2989 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge717
fixmerge717:
  %t2990 = phi i64 [ %t2987, %fixfast715 ], [ %t2989, %fixslow716 ]
  %t2991 = musttail call fastcc i64 @"scheme.base:code_569"(i64 %self, i64 2, i64 %t2982, i64 %t2990, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2991
}

define fastcc i64 @"scheme.base:code:list->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2992 = icmp eq i64 %argc, 1
  br i1 %t2992, label %argok719, label %arityerr718
arityerr718:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok719:
  %t2993 = load i64, ptr @"scheme.base:length"
  call void @rt_check_callable(i64 %t2993)
  %t2994 = and i64 %t2993, -8
  %t2995 = inttoptr i64 %t2994 to ptr
  %t2996 = load i64, ptr %t2995
  %t2997 = inttoptr i64 %t2996 to ptr
  %t2998 = call fastcc i64%t2997(i64 %t2993, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2999 = call i64 @rt_make_vector(i64 %t2998, i64 0)
  %t3000 = call ptr @rt_alloc_words(i64 3)
  %t3001 = ptrtoint ptr %t3000 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_569" to i64), ptr %t3000
  %t3002 = or i64 %t3001, 4
  %t3003 = getelementptr i64, ptr %t3000, i64 1
  store i64 %t2999, ptr %t3003
  %t3004 = getelementptr i64, ptr %t3000, i64 2
  store i64 %t3002, ptr %t3004
  %t3005 = musttail call fastcc i64 @"scheme.base:code_569"(i64 %t3002, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3005
}

define fastcc i64 @"scheme.base:code:vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3010 = icmp sge i64 %argc, 0
  br i1 %t3010, label %argok721, label %arityerr720
arityerr720:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok721:
  %t3011 = call ptr @rt_alloc_words(i64 8)
  %t3012 = getelementptr i64, ptr %t3011, i64 0
  store i64 %a0, ptr %t3012
  %t3013 = getelementptr i64, ptr %t3011, i64 1
  store i64 %a1, ptr %t3013
  %t3014 = getelementptr i64, ptr %t3011, i64 2
  store i64 %a2, ptr %t3014
  %t3015 = getelementptr i64, ptr %t3011, i64 3
  store i64 %a3, ptr %t3015
  %t3016 = getelementptr i64, ptr %t3011, i64 4
  store i64 %a4, ptr %t3016
  %t3017 = getelementptr i64, ptr %t3011, i64 5
  store i64 %a5, ptr %t3017
  %t3018 = getelementptr i64, ptr %t3011, i64 6
  store i64 %a6, ptr %t3018
  %t3019 = getelementptr i64, ptr %t3011, i64 7
  store i64 %a7, ptr %t3019
  %t3020 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t3011, ptr %overflow)
  %t3021 = load i64, ptr @"scheme.base:list->vector"
  call void @rt_check_callable(i64 %t3021)
  %t3022 = and i64 %t3021, -8
  %t3023 = inttoptr i64 %t3022 to ptr
  %t3024 = load i64, ptr %t3023
  %t3025 = inttoptr i64 %t3024 to ptr
  %t3026 = musttail call fastcc i64 %t3025(i64 %t3021, i64 1, i64 %t3020, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3026
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3027 = load i64, ptr @"scheme.base:list->vector"
  call void @rt_check_callable(i64 %t3027)
  %t3028 = and i64 %t3027, -8
  %t3029 = inttoptr i64 %t3028 to ptr
  %t3030 = load i64, ptr %t3029
  %t3031 = inttoptr i64 %t3030 to ptr
  %t3032 = musttail call fastcc i64 %t3031(i64 %t3027, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3032
}

define fastcc i64 @"scheme.base:code_579"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3037 = icmp eq i64 %argc, 2
  br i1 %t3037, label %argok723, label %arityerr722
arityerr722:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok723:
  %t3038 = call i64 @rt_null_p(i64 %a0)
  %t3039 = icmp ne i64 %t3038, 1
  br i1 %t3039, label %then724, label %else725
then724:
  %t3040 = and i64 %self, -8
  %t3041 = inttoptr i64 %t3040 to ptr
  %t3042 = getelementptr i64, ptr %t3041, i64 1
  %t3043 = load i64, ptr %t3042
  ret i64 %t3043
else725:
  %t3044 = and i64 %self, -8
  %t3045 = inttoptr i64 %t3044 to ptr
  %t3046 = getelementptr i64, ptr %t3045, i64 1
  %t3047 = load i64, ptr %t3046
  %t3048 = call i64 @rt_car(i64 %a0)
  %t3049 = call i64 @rt_bytevector_u8_set(i64 %t3047, i64 %a1, i64 %t3048)
  %t3050 = call i64 @rt_cdr(i64 %a0)
  %t3051 = or i64 %a1, 8
  %t3052 = and i64 %t3051, 7
  %t3053 = icmp eq i64 %t3052, 0
  br i1 %t3053, label %fixfast726, label %fixslow727
fixfast726:
  %t3054 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t3055 = extractvalue {i64, i1} %t3054, 0
  %t3056 = extractvalue {i64, i1} %t3054, 1
  br i1 %t3056, label %fixslow727, label %fixmerge728
fixslow727:
  %t3057 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge728
fixmerge728:
  %t3058 = phi i64 [ %t3055, %fixfast726 ], [ %t3057, %fixslow727 ]
  %t3059 = musttail call fastcc i64 @"scheme.base:code_579"(i64 %self, i64 2, i64 %t3050, i64 %t3058, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3059
}

define fastcc i64 @"scheme.base:code:list->bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3060 = icmp eq i64 %argc, 1
  br i1 %t3060, label %argok730, label %arityerr729
arityerr729:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok730:
  %t3061 = load i64, ptr @"scheme.base:length"
  call void @rt_check_callable(i64 %t3061)
  %t3062 = and i64 %t3061, -8
  %t3063 = inttoptr i64 %t3062 to ptr
  %t3064 = load i64, ptr %t3063
  %t3065 = inttoptr i64 %t3064 to ptr
  %t3066 = call fastcc i64%t3065(i64 %t3061, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3067 = call i64 @rt_make_bytevector(i64 %t3066, i64 0)
  %t3068 = call ptr @rt_alloc_words(i64 3)
  %t3069 = ptrtoint ptr %t3068 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_579" to i64), ptr %t3068
  %t3070 = or i64 %t3069, 4
  %t3071 = getelementptr i64, ptr %t3068, i64 1
  store i64 %t3067, ptr %t3071
  %t3072 = getelementptr i64, ptr %t3068, i64 2
  store i64 %t3070, ptr %t3072
  %t3073 = musttail call fastcc i64 @"scheme.base:code_579"(i64 %t3070, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3073
}

define fastcc i64 @"scheme.base:code:bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3078 = icmp sge i64 %argc, 0
  br i1 %t3078, label %argok732, label %arityerr731
arityerr731:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok732:
  %t3079 = call ptr @rt_alloc_words(i64 8)
  %t3080 = getelementptr i64, ptr %t3079, i64 0
  store i64 %a0, ptr %t3080
  %t3081 = getelementptr i64, ptr %t3079, i64 1
  store i64 %a1, ptr %t3081
  %t3082 = getelementptr i64, ptr %t3079, i64 2
  store i64 %a2, ptr %t3082
  %t3083 = getelementptr i64, ptr %t3079, i64 3
  store i64 %a3, ptr %t3083
  %t3084 = getelementptr i64, ptr %t3079, i64 4
  store i64 %a4, ptr %t3084
  %t3085 = getelementptr i64, ptr %t3079, i64 5
  store i64 %a5, ptr %t3085
  %t3086 = getelementptr i64, ptr %t3079, i64 6
  store i64 %a6, ptr %t3086
  %t3087 = getelementptr i64, ptr %t3079, i64 7
  store i64 %a7, ptr %t3087
  %t3088 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t3079, ptr %overflow)
  %t3089 = load i64, ptr @"scheme.base:list->bytevector"
  call void @rt_check_callable(i64 %t3089)
  %t3090 = and i64 %t3089, -8
  %t3091 = inttoptr i64 %t3090 to ptr
  %t3092 = load i64, ptr %t3091
  %t3093 = inttoptr i64 %t3092 to ptr
  %t3094 = musttail call fastcc i64 %t3093(i64 %t3089, i64 1, i64 %t3088, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3094
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cbytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3095 = load i64, ptr @"scheme.base:list->bytevector"
  call void @rt_check_callable(i64 %t3095)
  %t3096 = and i64 %t3095, -8
  %t3097 = inttoptr i64 %t3096 to ptr
  %t3098 = load i64, ptr %t3097
  %t3099 = inttoptr i64 %t3098 to ptr
  %t3100 = musttail call fastcc i64 %t3099(i64 %t3095, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3100
}

define fastcc i64 @"scheme.base:code:rng-start"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3105 = icmp eq i64 %argc, 1
  br i1 %t3105, label %argok734, label %arityerr733
arityerr733:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok734:
  %t3106 = call i64 @rt_pair_p(i64 %a0)
  %t3107 = icmp ne i64 %t3106, 1
  br i1 %t3107, label %then735, label %else736
then735:
  %t3108 = call i64 @rt_car(i64 %a0)
  ret i64 %t3108
else736:
  ret i64 0
}

define fastcc i64 @"scheme.base:code:rng-end"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3113 = icmp eq i64 %argc, 2
  br i1 %t3113, label %argok738, label %arityerr737
arityerr737:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok738:
  %t3114 = call i64 @rt_pair_p(i64 %a0)
  %t3115 = icmp ne i64 %t3114, 1
  br i1 %t3115, label %then739, label %else740
then739:
  %t3116 = call i64 @rt_cdr(i64 %a0)
  %t3117 = call i64 @rt_pair_p(i64 %t3116)
  br label %merge741
else740:
  br label %merge741
merge741:
  %t3118 = phi i64 [ %t3117, %then739 ], [ 1, %else740 ]
  %t3119 = icmp ne i64 %t3118, 1
  br i1 %t3119, label %then742, label %else743
then742:
  %t3120 = call i64 @rt_cdr(i64 %a0)
  %t3121 = call i64 @rt_car(i64 %t3120)
  ret i64 %t3121
else743:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:rng-check"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3126 = icmp eq i64 %argc, 4
  br i1 %t3126, label %argok745, label %arityerr744
arityerr744:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok745:
  %t3127 = or i64 0, %a1
  %t3128 = and i64 %t3127, 7
  %t3129 = icmp eq i64 %t3128, 0
  br i1 %t3129, label %fixfast746, label %fixslow747
fixfast746:
  %t3130 = icmp slt i64 0, %a1
  %t3131 = select i1 %t3130, i64 257, i64 1
  br label %fixmerge748
fixslow747:
  %t3132 = call i64 @rt_lt(i64 0, i64 %a1)
  br label %fixmerge748
fixmerge748:
  %t3133 = phi i64 [ %t3131, %fixfast746 ], [ %t3132, %fixslow747 ]
  %t3134 = icmp ne i64 %t3133, 1
  br i1 %t3134, label %then749, label %else750
then749:
  br label %merge751
else750:
  %t3135 = or i64 0, %a1
  %t3136 = and i64 %t3135, 7
  %t3137 = icmp eq i64 %t3136, 0
  br i1 %t3137, label %fixfast752, label %fixslow753
fixfast752:
  %t3138 = icmp eq i64 0, %a1
  %t3139 = select i1 %t3138, i64 257, i64 1
  br label %fixmerge754
fixslow753:
  %t3140 = call i64 @rt_num_eq(i64 0, i64 %a1)
  br label %fixmerge754
fixmerge754:
  %t3141 = phi i64 [ %t3139, %fixfast752 ], [ %t3140, %fixslow753 ]
  br label %merge751
merge751:
  %t3142 = phi i64 [ 257, %then749 ], [ %t3141, %fixmerge754 ]
  %t3143 = icmp ne i64 %t3142, 1
  br i1 %t3143, label %then755, label %else756
then755:
  %t3144 = or i64 %a1, %a2
  %t3145 = and i64 %t3144, 7
  %t3146 = icmp eq i64 %t3145, 0
  br i1 %t3146, label %fixfast758, label %fixslow759
fixfast758:
  %t3147 = icmp slt i64 %a1, %a2
  %t3148 = select i1 %t3147, i64 257, i64 1
  br label %fixmerge760
fixslow759:
  %t3149 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge760
fixmerge760:
  %t3150 = phi i64 [ %t3148, %fixfast758 ], [ %t3149, %fixslow759 ]
  %t3151 = icmp ne i64 %t3150, 1
  br i1 %t3151, label %then761, label %else762
then761:
  br label %merge763
else762:
  %t3152 = or i64 %a1, %a2
  %t3153 = and i64 %t3152, 7
  %t3154 = icmp eq i64 %t3153, 0
  br i1 %t3154, label %fixfast764, label %fixslow765
fixfast764:
  %t3155 = icmp eq i64 %a1, %a2
  %t3156 = select i1 %t3155, i64 257, i64 1
  br label %fixmerge766
fixslow765:
  %t3157 = call i64 @rt_num_eq(i64 %a1, i64 %a2)
  br label %fixmerge766
fixmerge766:
  %t3158 = phi i64 [ %t3156, %fixfast764 ], [ %t3157, %fixslow765 ]
  br label %merge763
merge763:
  %t3159 = phi i64 [ 257, %then761 ], [ %t3158, %fixmerge766 ]
  %t3160 = icmp ne i64 %t3159, 1
  br i1 %t3160, label %then767, label %else768
then767:
  %t3161 = or i64 %a2, %a3
  %t3162 = and i64 %t3161, 7
  %t3163 = icmp eq i64 %t3162, 0
  br i1 %t3163, label %fixfast770, label %fixslow771
fixfast770:
  %t3164 = icmp slt i64 %a2, %a3
  %t3165 = select i1 %t3164, i64 257, i64 1
  br label %fixmerge772
fixslow771:
  %t3166 = call i64 @rt_lt(i64 %a2, i64 %a3)
  br label %fixmerge772
fixmerge772:
  %t3167 = phi i64 [ %t3165, %fixfast770 ], [ %t3166, %fixslow771 ]
  %t3168 = icmp ne i64 %t3167, 1
  br i1 %t3168, label %then773, label %else774
then773:
  br label %merge775
else774:
  %t3169 = or i64 %a2, %a3
  %t3170 = and i64 %t3169, 7
  %t3171 = icmp eq i64 %t3170, 0
  br i1 %t3171, label %fixfast776, label %fixslow777
fixfast776:
  %t3172 = icmp eq i64 %a2, %a3
  %t3173 = select i1 %t3172, i64 257, i64 1
  br label %fixmerge778
fixslow777:
  %t3174 = call i64 @rt_num_eq(i64 %a2, i64 %a3)
  br label %fixmerge778
fixmerge778:
  %t3175 = phi i64 [ %t3173, %fixfast776 ], [ %t3174, %fixslow777 ]
  br label %merge775
merge775:
  %t3176 = phi i64 [ 257, %then773 ], [ %t3175, %fixmerge778 ]
  br label %merge769
else768:
  br label %merge769
merge769:
  %t3177 = phi i64 [ %t3176, %merge775 ], [ 1, %else768 ]
  br label %merge757
else756:
  br label %merge757
merge757:
  %t3178 = phi i64 [ %t3177, %merge769 ], [ 1, %else756 ]
  %t3179 = icmp ne i64 %t3178, 1
  br i1 %t3179, label %then779, label %else780
then779:
  ret i64 257
else780:
  %t3180 = call i64 @rt_make_string(ptr @.str.lit.20, i64 19)
  %t3181 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t3181)
  %t3182 = and i64 %t3181, -8
  %t3183 = inttoptr i64 %t3182 to ptr
  %t3184 = load i64, ptr %t3183
  %t3185 = inttoptr i64 %t3184 to ptr
  %t3186 = musttail call fastcc i64 %t3185(i64 %t3181, i64 5, i64 %t3180, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3186
}

define fastcc i64 @"scheme.base:code:assv"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3191 = icmp eq i64 %argc, 2
  br i1 %t3191, label %argok782, label %arityerr781
arityerr781:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok782:
  %t3192 = call i64 @rt_null_p(i64 %a1)
  %t3193 = icmp ne i64 %t3192, 1
  br i1 %t3193, label %then783, label %else784
then783:
  ret i64 1
else784:
  %t3194 = call i64 @rt_car(i64 %a1)
  %t3195 = call i64 @rt_car(i64 %t3194)
  %t3196 = call i64 @rt_eqv_p(i64 %a0, i64 %t3195)
  %t3197 = icmp ne i64 %t3196, 1
  br i1 %t3197, label %then785, label %else786
then785:
  %t3198 = call i64 @rt_car(i64 %a1)
  ret i64 %t3198
else786:
  %t3199 = call i64 @rt_cdr(i64 %a1)
  %t3200 = load i64, ptr @"scheme.base:assv"
  call void @rt_check_callable(i64 %t3200)
  %t3201 = and i64 %t3200, -8
  %t3202 = inttoptr i64 %t3201 to ptr
  %t3203 = load i64, ptr %t3202
  %t3204 = inttoptr i64 %t3203 to ptr
  %t3205 = musttail call fastcc i64 %t3204(i64 %t3200, i64 2, i64 %a0, i64 %t3199, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3205
}

define fastcc i64 @"scheme.base:code:list-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3210 = icmp eq i64 %argc, 1
  br i1 %t3210, label %argok788, label %arityerr787
arityerr787:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok788:
  %t3211 = call i64 @rt_pair_p(i64 %a0)
  %t3212 = icmp ne i64 %t3211, 1
  br i1 %t3212, label %then789, label %else790
then789:
  %t3213 = call i64 @rt_car(i64 %a0)
  %t3214 = call i64 @rt_cdr(i64 %a0)
  %t3215 = load i64, ptr @"scheme.base:list-copy"
  call void @rt_check_callable(i64 %t3215)
  %t3216 = and i64 %t3215, -8
  %t3217 = inttoptr i64 %t3216 to ptr
  %t3218 = load i64, ptr %t3217
  %t3219 = inttoptr i64 %t3218 to ptr
  %t3220 = call fastcc i64%t3219(i64 %t3215, i64 1, i64 %t3214, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3221 = call i64 @rt_cons(i64 %t3213, i64 %t3220)
  ret i64 %t3221
else790:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:boolean=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3226 = icmp sge i64 %argc, 2
  br i1 %t3226, label %argok792, label %arityerr791
arityerr791:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok792:
  %t3227 = call ptr @rt_alloc_words(i64 8)
  %t3228 = getelementptr i64, ptr %t3227, i64 0
  store i64 %a0, ptr %t3228
  %t3229 = getelementptr i64, ptr %t3227, i64 1
  store i64 %a1, ptr %t3229
  %t3230 = getelementptr i64, ptr %t3227, i64 2
  store i64 %a2, ptr %t3230
  %t3231 = getelementptr i64, ptr %t3227, i64 3
  store i64 %a3, ptr %t3231
  %t3232 = getelementptr i64, ptr %t3227, i64 4
  store i64 %a4, ptr %t3232
  %t3233 = getelementptr i64, ptr %t3227, i64 5
  store i64 %a5, ptr %t3233
  %t3234 = getelementptr i64, ptr %t3227, i64 6
  store i64 %a6, ptr %t3234
  %t3235 = getelementptr i64, ptr %t3227, i64 7
  store i64 %a7, ptr %t3235
  %t3236 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3227, ptr %overflow)
  %t3237 = call i64 @rt_cons(i64 %a1, i64 %t3236)
  %t3238 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t3238)
  %t3239 = and i64 %t3238, -8
  %t3240 = inttoptr i64 %t3239 to ptr
  %t3241 = load i64, ptr %t3240
  %t3242 = inttoptr i64 %t3241 to ptr
  %t3243 = musttail call fastcc i64 %t3242(i64 %t3238, i64 2, i64 %a0, i64 %t3237, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3243
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cboolean=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3244 = call i64 @rt_cons(i64 %a1, i64 2)
  %t3245 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t3245)
  %t3246 = and i64 %t3245, -8
  %t3247 = inttoptr i64 %t3246 to ptr
  %t3248 = load i64, ptr %t3247
  %t3249 = inttoptr i64 %t3248 to ptr
  %t3250 = musttail call fastcc i64 %t3249(i64 %t3245, i64 2, i64 %a0, i64 %t3244, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3250
}

define fastcc i64 @"scheme.base:code:symbol=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3255 = icmp sge i64 %argc, 2
  br i1 %t3255, label %argok794, label %arityerr793
arityerr793:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok794:
  %t3256 = call ptr @rt_alloc_words(i64 8)
  %t3257 = getelementptr i64, ptr %t3256, i64 0
  store i64 %a0, ptr %t3257
  %t3258 = getelementptr i64, ptr %t3256, i64 1
  store i64 %a1, ptr %t3258
  %t3259 = getelementptr i64, ptr %t3256, i64 2
  store i64 %a2, ptr %t3259
  %t3260 = getelementptr i64, ptr %t3256, i64 3
  store i64 %a3, ptr %t3260
  %t3261 = getelementptr i64, ptr %t3256, i64 4
  store i64 %a4, ptr %t3261
  %t3262 = getelementptr i64, ptr %t3256, i64 5
  store i64 %a5, ptr %t3262
  %t3263 = getelementptr i64, ptr %t3256, i64 6
  store i64 %a6, ptr %t3263
  %t3264 = getelementptr i64, ptr %t3256, i64 7
  store i64 %a7, ptr %t3264
  %t3265 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3256, ptr %overflow)
  %t3266 = call i64 @rt_cons(i64 %a1, i64 %t3265)
  %t3267 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t3267)
  %t3268 = and i64 %t3267, -8
  %t3269 = inttoptr i64 %t3268 to ptr
  %t3270 = load i64, ptr %t3269
  %t3271 = inttoptr i64 %t3270 to ptr
  %t3272 = musttail call fastcc i64 %t3271(i64 %t3267, i64 2, i64 %a0, i64 %t3266, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3272
}

define fastcc i64 @"min-entry:$scheme.base$ccode$csymbol=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3273 = call i64 @rt_cons(i64 %a1, i64 2)
  %t3274 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t3274)
  %t3275 = and i64 %t3274, -8
  %t3276 = inttoptr i64 %t3275 to ptr
  %t3277 = load i64, ptr %t3276
  %t3278 = inttoptr i64 %t3277 to ptr
  %t3279 = musttail call fastcc i64 %t3278(i64 %t3274, i64 2, i64 %a0, i64 %t3273, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3279
}

define fastcc i64 @"scheme.base:code:eqv-chain?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3284 = icmp eq i64 %argc, 2
  br i1 %t3284, label %argok796, label %arityerr795
arityerr795:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok796:
  %t3285 = call i64 @rt_null_p(i64 %a1)
  %t3286 = icmp ne i64 %t3285, 1
  br i1 %t3286, label %then797, label %else798
then797:
  ret i64 257
else798:
  %t3287 = call i64 @rt_car(i64 %a1)
  %t3288 = call i64 @rt_eqv_p(i64 %a0, i64 %t3287)
  %t3289 = icmp ne i64 %t3288, 1
  br i1 %t3289, label %then799, label %else800
then799:
  %t3290 = call i64 @rt_car(i64 %a1)
  %t3291 = call i64 @rt_cdr(i64 %a1)
  %t3292 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t3292)
  %t3293 = and i64 %t3292, -8
  %t3294 = inttoptr i64 %t3293 to ptr
  %t3295 = load i64, ptr %t3294
  %t3296 = inttoptr i64 %t3295 to ptr
  %t3297 = musttail call fastcc i64 %t3296(i64 %t3292, i64 2, i64 %t3290, i64 %t3291, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3297
else800:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_662"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3302 = icmp eq i64 %argc, 1
  br i1 %t3302, label %argok802, label %arityerr801
arityerr801:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok802:
  %t3303 = and i64 %self, -8
  %t3304 = inttoptr i64 %t3303 to ptr
  %t3305 = getelementptr i64, ptr %t3304, i64 1
  %t3306 = load i64, ptr %t3305
  %t3307 = or i64 %a0, %t3306
  %t3308 = and i64 %t3307, 7
  %t3309 = icmp eq i64 %t3308, 0
  br i1 %t3309, label %fixfast803, label %fixslow804
fixfast803:
  %t3310 = icmp eq i64 %a0, %t3306
  %t3311 = select i1 %t3310, i64 257, i64 1
  br label %fixmerge805
fixslow804:
  %t3312 = call i64 @rt_num_eq(i64 %a0, i64 %t3306)
  br label %fixmerge805
fixmerge805:
  %t3313 = phi i64 [ %t3311, %fixfast803 ], [ %t3312, %fixslow804 ]
  %t3314 = icmp ne i64 %t3313, 1
  br i1 %t3314, label %then806, label %else807
then806:
  %t3315 = and i64 %self, -8
  %t3316 = inttoptr i64 %t3315 to ptr
  %t3317 = getelementptr i64, ptr %t3316, i64 2
  %t3318 = load i64, ptr %t3317
  %t3319 = or i64 %a0, %t3318
  %t3320 = and i64 %t3319, 7
  %t3321 = icmp eq i64 %t3320, 0
  br i1 %t3321, label %fixfast809, label %fixslow810
fixfast809:
  %t3322 = icmp eq i64 %a0, %t3318
  %t3323 = select i1 %t3322, i64 257, i64 1
  br label %fixmerge811
fixslow810:
  %t3324 = call i64 @rt_num_eq(i64 %a0, i64 %t3318)
  br label %fixmerge811
fixmerge811:
  %t3325 = phi i64 [ %t3323, %fixfast809 ], [ %t3324, %fixslow810 ]
  br label %merge808
else807:
  br label %merge808
merge808:
  %t3326 = phi i64 [ %t3325, %fixmerge811 ], [ 1, %else807 ]
  %t3327 = icmp ne i64 %t3326, 1
  br i1 %t3327, label %then812, label %else813
then812:
  ret i64 0
else813:
  %t3328 = and i64 %self, -8
  %t3329 = inttoptr i64 %t3328 to ptr
  %t3330 = getelementptr i64, ptr %t3329, i64 1
  %t3331 = load i64, ptr %t3330
  %t3332 = or i64 %a0, %t3331
  %t3333 = and i64 %t3332, 7
  %t3334 = icmp eq i64 %t3333, 0
  br i1 %t3334, label %fixfast814, label %fixslow815
fixfast814:
  %t3335 = icmp eq i64 %a0, %t3331
  %t3336 = select i1 %t3335, i64 257, i64 1
  br label %fixmerge816
fixslow815:
  %t3337 = call i64 @rt_num_eq(i64 %a0, i64 %t3331)
  br label %fixmerge816
fixmerge816:
  %t3338 = phi i64 [ %t3336, %fixfast814 ], [ %t3337, %fixslow815 ]
  %t3339 = icmp ne i64 %t3338, 1
  br i1 %t3339, label %then817, label %else818
then817:
  ret i64 -8
else818:
  %t3340 = and i64 %self, -8
  %t3341 = inttoptr i64 %t3340 to ptr
  %t3342 = getelementptr i64, ptr %t3341, i64 2
  %t3343 = load i64, ptr %t3342
  %t3344 = or i64 %a0, %t3343
  %t3345 = and i64 %t3344, 7
  %t3346 = icmp eq i64 %t3345, 0
  br i1 %t3346, label %fixfast819, label %fixslow820
fixfast819:
  %t3347 = icmp eq i64 %a0, %t3343
  %t3348 = select i1 %t3347, i64 257, i64 1
  br label %fixmerge821
fixslow820:
  %t3349 = call i64 @rt_num_eq(i64 %a0, i64 %t3343)
  br label %fixmerge821
fixmerge821:
  %t3350 = phi i64 [ %t3348, %fixfast819 ], [ %t3349, %fixslow820 ]
  %t3351 = icmp ne i64 %t3350, 1
  br i1 %t3351, label %then822, label %else823
then822:
  ret i64 8
else823:
  %t3352 = and i64 %self, -8
  %t3353 = inttoptr i64 %t3352 to ptr
  %t3354 = getelementptr i64, ptr %t3353, i64 3
  %t3355 = load i64, ptr %t3354
  %t3356 = call i64 @rt_string_ref(i64 %t3355, i64 %a0)
  %t3357 = call i64 @rt_char_to_integer(i64 %t3356)
  %t3358 = and i64 %self, -8
  %t3359 = inttoptr i64 %t3358 to ptr
  %t3360 = getelementptr i64, ptr %t3359, i64 4
  %t3361 = load i64, ptr %t3360
  %t3362 = call i64 @rt_string_ref(i64 %t3361, i64 %a0)
  %t3363 = call i64 @rt_char_to_integer(i64 %t3362)
  %t3364 = or i64 %t3357, %t3363
  %t3365 = and i64 %t3364, 7
  %t3366 = icmp eq i64 %t3365, 0
  br i1 %t3366, label %fixfast824, label %fixslow825
fixfast824:
  %t3367 = icmp slt i64 %t3357, %t3363
  %t3368 = select i1 %t3367, i64 257, i64 1
  br label %fixmerge826
fixslow825:
  %t3369 = call i64 @rt_lt(i64 %t3357, i64 %t3363)
  br label %fixmerge826
fixmerge826:
  %t3370 = phi i64 [ %t3368, %fixfast824 ], [ %t3369, %fixslow825 ]
  %t3371 = icmp ne i64 %t3370, 1
  br i1 %t3371, label %then827, label %else828
then827:
  ret i64 -8
else828:
  %t3372 = or i64 %t3363, %t3357
  %t3373 = and i64 %t3372, 7
  %t3374 = icmp eq i64 %t3373, 0
  br i1 %t3374, label %fixfast829, label %fixslow830
fixfast829:
  %t3375 = icmp slt i64 %t3363, %t3357
  %t3376 = select i1 %t3375, i64 257, i64 1
  br label %fixmerge831
fixslow830:
  %t3377 = call i64 @rt_lt(i64 %t3363, i64 %t3357)
  br label %fixmerge831
fixmerge831:
  %t3378 = phi i64 [ %t3376, %fixfast829 ], [ %t3377, %fixslow830 ]
  %t3379 = icmp ne i64 %t3378, 1
  br i1 %t3379, label %then832, label %else833
then832:
  ret i64 8
else833:
  %t3380 = or i64 %a0, 8
  %t3381 = and i64 %t3380, 7
  %t3382 = icmp eq i64 %t3381, 0
  br i1 %t3382, label %fixfast834, label %fixslow835
fixfast834:
  %t3383 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3384 = extractvalue {i64, i1} %t3383, 0
  %t3385 = extractvalue {i64, i1} %t3383, 1
  br i1 %t3385, label %fixslow835, label %fixmerge836
fixslow835:
  %t3386 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge836
fixmerge836:
  %t3387 = phi i64 [ %t3384, %fixfast834 ], [ %t3386, %fixslow835 ]
  %t3388 = musttail call fastcc i64 @"scheme.base:code_662"(i64 %self, i64 1, i64 %t3387, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3388
}

define fastcc i64 @"scheme.base:code:str-cmp"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3389 = icmp eq i64 %argc, 2
  br i1 %t3389, label %argok838, label %arityerr837
arityerr837:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok838:
  %t3390 = call i64 @rt_string_length(i64 %a0)
  %t3391 = call i64 @rt_string_length(i64 %a1)
  %t3392 = call ptr @rt_alloc_words(i64 6)
  %t3393 = ptrtoint ptr %t3392 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_662" to i64), ptr %t3392
  %t3394 = or i64 %t3393, 4
  %t3395 = getelementptr i64, ptr %t3392, i64 1
  store i64 %t3390, ptr %t3395
  %t3396 = getelementptr i64, ptr %t3392, i64 2
  store i64 %t3391, ptr %t3396
  %t3397 = getelementptr i64, ptr %t3392, i64 3
  store i64 %a0, ptr %t3397
  %t3398 = getelementptr i64, ptr %t3392, i64 4
  store i64 %a1, ptr %t3398
  %t3399 = getelementptr i64, ptr %t3392, i64 5
  store i64 %t3394, ptr %t3399
  %t3400 = musttail call fastcc i64 @"scheme.base:code_662"(i64 %t3394, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3400
}

define fastcc i64 @"scheme.base:code:str-chain?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3405 = icmp eq i64 %argc, 3
  br i1 %t3405, label %argok840, label %arityerr839
arityerr839:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok840:
  %t3406 = call i64 @rt_null_p(i64 %a2)
  %t3407 = icmp ne i64 %t3406, 1
  br i1 %t3407, label %then841, label %else842
then841:
  ret i64 257
else842:
  %t3408 = call i64 @rt_car(i64 %a2)
  call void @rt_check_callable(i64 %a0)
  %t3409 = and i64 %a0, -8
  %t3410 = inttoptr i64 %t3409 to ptr
  %t3411 = load i64, ptr %t3410
  %t3412 = inttoptr i64 %t3411 to ptr
  %t3413 = call fastcc i64%t3412(i64 %a0, i64 2, i64 %a1, i64 %t3408, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3414 = icmp ne i64 %t3413, 1
  br i1 %t3414, label %then843, label %else844
then843:
  %t3415 = call i64 @rt_car(i64 %a2)
  %t3416 = call i64 @rt_cdr(i64 %a2)
  %t3417 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3417)
  %t3418 = and i64 %t3417, -8
  %t3419 = inttoptr i64 %t3418 to ptr
  %t3420 = load i64, ptr %t3419
  %t3421 = inttoptr i64 %t3420 to ptr
  %t3422 = musttail call fastcc i64 %t3421(i64 %t3417, i64 3, i64 %a0, i64 %t3415, i64 %t3416, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3422
else844:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_678"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3427 = icmp eq i64 %argc, 2
  br i1 %t3427, label %argok846, label %arityerr845
arityerr845:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok846:
  %t3428 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t3428)
  %t3429 = and i64 %t3428, -8
  %t3430 = inttoptr i64 %t3429 to ptr
  %t3431 = load i64, ptr %t3430
  %t3432 = inttoptr i64 %t3431 to ptr
  %t3433 = call fastcc i64%t3432(i64 %t3428, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3434 = or i64 %t3433, 0
  %t3435 = and i64 %t3434, 7
  %t3436 = icmp eq i64 %t3435, 0
  br i1 %t3436, label %fixfast847, label %fixslow848
fixfast847:
  %t3437 = icmp slt i64 %t3433, 0
  %t3438 = select i1 %t3437, i64 257, i64 1
  br label %fixmerge849
fixslow848:
  %t3439 = call i64 @rt_lt(i64 %t3433, i64 0)
  br label %fixmerge849
fixmerge849:
  %t3440 = phi i64 [ %t3438, %fixfast847 ], [ %t3439, %fixslow848 ]
  ret i64 %t3440
}

define fastcc i64 @"scheme.base:code:string<?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3441 = icmp sge i64 %argc, 2
  br i1 %t3441, label %argok851, label %arityerr850
arityerr850:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok851:
  %t3442 = call ptr @rt_alloc_words(i64 8)
  %t3443 = getelementptr i64, ptr %t3442, i64 0
  store i64 %a0, ptr %t3443
  %t3444 = getelementptr i64, ptr %t3442, i64 1
  store i64 %a1, ptr %t3444
  %t3445 = getelementptr i64, ptr %t3442, i64 2
  store i64 %a2, ptr %t3445
  %t3446 = getelementptr i64, ptr %t3442, i64 3
  store i64 %a3, ptr %t3446
  %t3447 = getelementptr i64, ptr %t3442, i64 4
  store i64 %a4, ptr %t3447
  %t3448 = getelementptr i64, ptr %t3442, i64 5
  store i64 %a5, ptr %t3448
  %t3449 = getelementptr i64, ptr %t3442, i64 6
  store i64 %a6, ptr %t3449
  %t3450 = getelementptr i64, ptr %t3442, i64 7
  store i64 %a7, ptr %t3450
  %t3451 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3442, ptr %overflow)
  %t3452 = call ptr @rt_alloc_words(i64 1)
  %t3453 = ptrtoint ptr %t3452 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_678" to i64), ptr %t3452
  %t3454 = or i64 %t3453, 4
  %t3455 = call i64 @rt_cons(i64 %a1, i64 %t3451)
  %t3456 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3456)
  %t3457 = and i64 %t3456, -8
  %t3458 = inttoptr i64 %t3457 to ptr
  %t3459 = load i64, ptr %t3458
  %t3460 = inttoptr i64 %t3459 to ptr
  %t3461 = musttail call fastcc i64 %t3460(i64 %t3456, i64 3, i64 %t3454, i64 %a0, i64 %t3455, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3461
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring<?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3462 = call ptr @rt_alloc_words(i64 1)
  %t3463 = ptrtoint ptr %t3462 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_678" to i64), ptr %t3462
  %t3464 = or i64 %t3463, 4
  %t3465 = call i64 @rt_cons(i64 %a1, i64 2)
  %t3466 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3466)
  %t3467 = and i64 %t3466, -8
  %t3468 = inttoptr i64 %t3467 to ptr
  %t3469 = load i64, ptr %t3468
  %t3470 = inttoptr i64 %t3469 to ptr
  %t3471 = musttail call fastcc i64 %t3470(i64 %t3466, i64 3, i64 %t3464, i64 %a0, i64 %t3465, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3471
}

define fastcc i64 @"scheme.base:code_690"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3476 = icmp eq i64 %argc, 2
  br i1 %t3476, label %argok853, label %arityerr852
arityerr852:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok853:
  %t3477 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t3477)
  %t3478 = and i64 %t3477, -8
  %t3479 = inttoptr i64 %t3478 to ptr
  %t3480 = load i64, ptr %t3479
  %t3481 = inttoptr i64 %t3480 to ptr
  %t3482 = call fastcc i64%t3481(i64 %t3477, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3483 = or i64 0, %t3482
  %t3484 = and i64 %t3483, 7
  %t3485 = icmp eq i64 %t3484, 0
  br i1 %t3485, label %fixfast854, label %fixslow855
fixfast854:
  %t3486 = icmp slt i64 0, %t3482
  %t3487 = select i1 %t3486, i64 257, i64 1
  br label %fixmerge856
fixslow855:
  %t3488 = call i64 @rt_lt(i64 0, i64 %t3482)
  br label %fixmerge856
fixmerge856:
  %t3489 = phi i64 [ %t3487, %fixfast854 ], [ %t3488, %fixslow855 ]
  ret i64 %t3489
}

define fastcc i64 @"scheme.base:code:string>?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3490 = icmp sge i64 %argc, 2
  br i1 %t3490, label %argok858, label %arityerr857
arityerr857:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok858:
  %t3491 = call ptr @rt_alloc_words(i64 8)
  %t3492 = getelementptr i64, ptr %t3491, i64 0
  store i64 %a0, ptr %t3492
  %t3493 = getelementptr i64, ptr %t3491, i64 1
  store i64 %a1, ptr %t3493
  %t3494 = getelementptr i64, ptr %t3491, i64 2
  store i64 %a2, ptr %t3494
  %t3495 = getelementptr i64, ptr %t3491, i64 3
  store i64 %a3, ptr %t3495
  %t3496 = getelementptr i64, ptr %t3491, i64 4
  store i64 %a4, ptr %t3496
  %t3497 = getelementptr i64, ptr %t3491, i64 5
  store i64 %a5, ptr %t3497
  %t3498 = getelementptr i64, ptr %t3491, i64 6
  store i64 %a6, ptr %t3498
  %t3499 = getelementptr i64, ptr %t3491, i64 7
  store i64 %a7, ptr %t3499
  %t3500 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3491, ptr %overflow)
  %t3501 = call ptr @rt_alloc_words(i64 1)
  %t3502 = ptrtoint ptr %t3501 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_690" to i64), ptr %t3501
  %t3503 = or i64 %t3502, 4
  %t3504 = call i64 @rt_cons(i64 %a1, i64 %t3500)
  %t3505 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3505)
  %t3506 = and i64 %t3505, -8
  %t3507 = inttoptr i64 %t3506 to ptr
  %t3508 = load i64, ptr %t3507
  %t3509 = inttoptr i64 %t3508 to ptr
  %t3510 = musttail call fastcc i64 %t3509(i64 %t3505, i64 3, i64 %t3503, i64 %a0, i64 %t3504, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3510
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring>?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3511 = call ptr @rt_alloc_words(i64 1)
  %t3512 = ptrtoint ptr %t3511 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_690" to i64), ptr %t3511
  %t3513 = or i64 %t3512, 4
  %t3514 = call i64 @rt_cons(i64 %a1, i64 2)
  %t3515 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3515)
  %t3516 = and i64 %t3515, -8
  %t3517 = inttoptr i64 %t3516 to ptr
  %t3518 = load i64, ptr %t3517
  %t3519 = inttoptr i64 %t3518 to ptr
  %t3520 = musttail call fastcc i64 %t3519(i64 %t3515, i64 3, i64 %t3513, i64 %a0, i64 %t3514, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3520
}

define fastcc i64 @"scheme.base:code_702"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3525 = icmp eq i64 %argc, 2
  br i1 %t3525, label %argok860, label %arityerr859
arityerr859:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok860:
  %t3526 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t3526)
  %t3527 = and i64 %t3526, -8
  %t3528 = inttoptr i64 %t3527 to ptr
  %t3529 = load i64, ptr %t3528
  %t3530 = inttoptr i64 %t3529 to ptr
  %t3531 = call fastcc i64%t3530(i64 %t3526, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3532 = or i64 0, %t3531
  %t3533 = and i64 %t3532, 7
  %t3534 = icmp eq i64 %t3533, 0
  br i1 %t3534, label %fixfast861, label %fixslow862
fixfast861:
  %t3535 = icmp slt i64 0, %t3531
  %t3536 = select i1 %t3535, i64 257, i64 1
  br label %fixmerge863
fixslow862:
  %t3537 = call i64 @rt_lt(i64 0, i64 %t3531)
  br label %fixmerge863
fixmerge863:
  %t3538 = phi i64 [ %t3536, %fixfast861 ], [ %t3537, %fixslow862 ]
  %t3539 = call i64 @rt_not(i64 %t3538)
  ret i64 %t3539
}

define fastcc i64 @"scheme.base:code:string<=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3540 = icmp sge i64 %argc, 2
  br i1 %t3540, label %argok865, label %arityerr864
arityerr864:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok865:
  %t3541 = call ptr @rt_alloc_words(i64 8)
  %t3542 = getelementptr i64, ptr %t3541, i64 0
  store i64 %a0, ptr %t3542
  %t3543 = getelementptr i64, ptr %t3541, i64 1
  store i64 %a1, ptr %t3543
  %t3544 = getelementptr i64, ptr %t3541, i64 2
  store i64 %a2, ptr %t3544
  %t3545 = getelementptr i64, ptr %t3541, i64 3
  store i64 %a3, ptr %t3545
  %t3546 = getelementptr i64, ptr %t3541, i64 4
  store i64 %a4, ptr %t3546
  %t3547 = getelementptr i64, ptr %t3541, i64 5
  store i64 %a5, ptr %t3547
  %t3548 = getelementptr i64, ptr %t3541, i64 6
  store i64 %a6, ptr %t3548
  %t3549 = getelementptr i64, ptr %t3541, i64 7
  store i64 %a7, ptr %t3549
  %t3550 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3541, ptr %overflow)
  %t3551 = call ptr @rt_alloc_words(i64 1)
  %t3552 = ptrtoint ptr %t3551 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_702" to i64), ptr %t3551
  %t3553 = or i64 %t3552, 4
  %t3554 = call i64 @rt_cons(i64 %a1, i64 %t3550)
  %t3555 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3555)
  %t3556 = and i64 %t3555, -8
  %t3557 = inttoptr i64 %t3556 to ptr
  %t3558 = load i64, ptr %t3557
  %t3559 = inttoptr i64 %t3558 to ptr
  %t3560 = musttail call fastcc i64 %t3559(i64 %t3555, i64 3, i64 %t3553, i64 %a0, i64 %t3554, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3560
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring<=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3561 = call ptr @rt_alloc_words(i64 1)
  %t3562 = ptrtoint ptr %t3561 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_702" to i64), ptr %t3561
  %t3563 = or i64 %t3562, 4
  %t3564 = call i64 @rt_cons(i64 %a1, i64 2)
  %t3565 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3565)
  %t3566 = and i64 %t3565, -8
  %t3567 = inttoptr i64 %t3566 to ptr
  %t3568 = load i64, ptr %t3567
  %t3569 = inttoptr i64 %t3568 to ptr
  %t3570 = musttail call fastcc i64 %t3569(i64 %t3565, i64 3, i64 %t3563, i64 %a0, i64 %t3564, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3570
}

define fastcc i64 @"scheme.base:code_714"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3575 = icmp eq i64 %argc, 2
  br i1 %t3575, label %argok867, label %arityerr866
arityerr866:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok867:
  %t3576 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t3576)
  %t3577 = and i64 %t3576, -8
  %t3578 = inttoptr i64 %t3577 to ptr
  %t3579 = load i64, ptr %t3578
  %t3580 = inttoptr i64 %t3579 to ptr
  %t3581 = call fastcc i64%t3580(i64 %t3576, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3582 = or i64 %t3581, 0
  %t3583 = and i64 %t3582, 7
  %t3584 = icmp eq i64 %t3583, 0
  br i1 %t3584, label %fixfast868, label %fixslow869
fixfast868:
  %t3585 = icmp slt i64 %t3581, 0
  %t3586 = select i1 %t3585, i64 257, i64 1
  br label %fixmerge870
fixslow869:
  %t3587 = call i64 @rt_lt(i64 %t3581, i64 0)
  br label %fixmerge870
fixmerge870:
  %t3588 = phi i64 [ %t3586, %fixfast868 ], [ %t3587, %fixslow869 ]
  %t3589 = call i64 @rt_not(i64 %t3588)
  ret i64 %t3589
}

define fastcc i64 @"scheme.base:code:string>=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3590 = icmp sge i64 %argc, 2
  br i1 %t3590, label %argok872, label %arityerr871
arityerr871:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok872:
  %t3591 = call ptr @rt_alloc_words(i64 8)
  %t3592 = getelementptr i64, ptr %t3591, i64 0
  store i64 %a0, ptr %t3592
  %t3593 = getelementptr i64, ptr %t3591, i64 1
  store i64 %a1, ptr %t3593
  %t3594 = getelementptr i64, ptr %t3591, i64 2
  store i64 %a2, ptr %t3594
  %t3595 = getelementptr i64, ptr %t3591, i64 3
  store i64 %a3, ptr %t3595
  %t3596 = getelementptr i64, ptr %t3591, i64 4
  store i64 %a4, ptr %t3596
  %t3597 = getelementptr i64, ptr %t3591, i64 5
  store i64 %a5, ptr %t3597
  %t3598 = getelementptr i64, ptr %t3591, i64 6
  store i64 %a6, ptr %t3598
  %t3599 = getelementptr i64, ptr %t3591, i64 7
  store i64 %a7, ptr %t3599
  %t3600 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3591, ptr %overflow)
  %t3601 = call ptr @rt_alloc_words(i64 1)
  %t3602 = ptrtoint ptr %t3601 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_714" to i64), ptr %t3601
  %t3603 = or i64 %t3602, 4
  %t3604 = call i64 @rt_cons(i64 %a1, i64 %t3600)
  %t3605 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3605)
  %t3606 = and i64 %t3605, -8
  %t3607 = inttoptr i64 %t3606 to ptr
  %t3608 = load i64, ptr %t3607
  %t3609 = inttoptr i64 %t3608 to ptr
  %t3610 = musttail call fastcc i64 %t3609(i64 %t3605, i64 3, i64 %t3603, i64 %a0, i64 %t3604, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3610
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring>=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3611 = call ptr @rt_alloc_words(i64 1)
  %t3612 = ptrtoint ptr %t3611 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_714" to i64), ptr %t3611
  %t3613 = or i64 %t3612, 4
  %t3614 = call i64 @rt_cons(i64 %a1, i64 2)
  %t3615 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3615)
  %t3616 = and i64 %t3615, -8
  %t3617 = inttoptr i64 %t3616 to ptr
  %t3618 = load i64, ptr %t3617
  %t3619 = inttoptr i64 %t3618 to ptr
  %t3620 = musttail call fastcc i64 %t3619(i64 %t3615, i64 3, i64 %t3613, i64 %a0, i64 %t3614, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3620
}

define fastcc i64 @"scheme.base:code_729"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3625 = icmp eq i64 %argc, 2
  br i1 %t3625, label %argok874, label %arityerr873
arityerr873:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok874:
  %t3626 = and i64 %self, -8
  %t3627 = inttoptr i64 %t3626 to ptr
  %t3628 = getelementptr i64, ptr %t3627, i64 1
  %t3629 = load i64, ptr %t3628
  %t3630 = or i64 %a0, %t3629
  %t3631 = and i64 %t3630, 7
  %t3632 = icmp eq i64 %t3631, 0
  br i1 %t3632, label %fixfast875, label %fixslow876
fixfast875:
  %t3633 = icmp slt i64 %a0, %t3629
  %t3634 = select i1 %t3633, i64 257, i64 1
  br label %fixmerge877
fixslow876:
  %t3635 = call i64 @rt_lt(i64 %a0, i64 %t3629)
  br label %fixmerge877
fixmerge877:
  %t3636 = phi i64 [ %t3634, %fixfast875 ], [ %t3635, %fixslow876 ]
  %t3637 = icmp ne i64 %t3636, 1
  br i1 %t3637, label %then878, label %else879
then878:
  ret i64 %a1
else879:
  %t3638 = or i64 %a0, 8
  %t3639 = and i64 %t3638, 7
  %t3640 = icmp eq i64 %t3639, 0
  br i1 %t3640, label %fixfast880, label %fixslow881
fixfast880:
  %t3641 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t3642 = extractvalue {i64, i1} %t3641, 0
  %t3643 = extractvalue {i64, i1} %t3641, 1
  br i1 %t3643, label %fixslow881, label %fixmerge882
fixslow881:
  %t3644 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge882
fixmerge882:
  %t3645 = phi i64 [ %t3642, %fixfast880 ], [ %t3644, %fixslow881 ]
  %t3646 = and i64 %self, -8
  %t3647 = inttoptr i64 %t3646 to ptr
  %t3648 = getelementptr i64, ptr %t3647, i64 3
  %t3649 = load i64, ptr %t3648
  %t3650 = call i64 @rt_vector_ref(i64 %t3649, i64 %a0)
  %t3651 = call i64 @rt_cons(i64 %t3650, i64 %a1)
  %t3652 = musttail call fastcc i64 @"scheme.base:code_729"(i64 %self, i64 2, i64 %t3645, i64 %t3651, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3652
}

define fastcc i64 @"scheme.base:code:vector->list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3653 = icmp sge i64 %argc, 1
  br i1 %t3653, label %argok884, label %arityerr883
arityerr883:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok884:
  %t3654 = call ptr @rt_alloc_words(i64 8)
  %t3655 = getelementptr i64, ptr %t3654, i64 0
  store i64 %a0, ptr %t3655
  %t3656 = getelementptr i64, ptr %t3654, i64 1
  store i64 %a1, ptr %t3656
  %t3657 = getelementptr i64, ptr %t3654, i64 2
  store i64 %a2, ptr %t3657
  %t3658 = getelementptr i64, ptr %t3654, i64 3
  store i64 %a3, ptr %t3658
  %t3659 = getelementptr i64, ptr %t3654, i64 4
  store i64 %a4, ptr %t3659
  %t3660 = getelementptr i64, ptr %t3654, i64 5
  store i64 %a5, ptr %t3660
  %t3661 = getelementptr i64, ptr %t3654, i64 6
  store i64 %a6, ptr %t3661
  %t3662 = getelementptr i64, ptr %t3654, i64 7
  store i64 %a7, ptr %t3662
  %t3663 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t3654, ptr %overflow)
  %t3664 = call i64 @rt_vector_length(i64 %a0)
  %t3665 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t3665)
  %t3666 = and i64 %t3665, -8
  %t3667 = inttoptr i64 %t3666 to ptr
  %t3668 = load i64, ptr %t3667
  %t3669 = inttoptr i64 %t3668 to ptr
  %t3670 = call fastcc i64%t3669(i64 %t3665, i64 1, i64 %t3663, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3671 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t3671)
  %t3672 = and i64 %t3671, -8
  %t3673 = inttoptr i64 %t3672 to ptr
  %t3674 = load i64, ptr %t3673
  %t3675 = inttoptr i64 %t3674 to ptr
  %t3676 = call fastcc i64%t3675(i64 %t3671, i64 2, i64 %t3663, i64 %t3664, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3677 = call i64 @rt_intern(ptr @.str.sym.21)
  %t3678 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t3678)
  %t3679 = and i64 %t3678, -8
  %t3680 = inttoptr i64 %t3679 to ptr
  %t3681 = load i64, ptr %t3680
  %t3682 = inttoptr i64 %t3681 to ptr
  %t3683 = call fastcc i64%t3682(i64 %t3678, i64 4, i64 %t3677, i64 %t3670, i64 %t3676, i64 %t3664, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3684 = call ptr @rt_alloc_words(i64 4)
  %t3685 = ptrtoint ptr %t3684 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_729" to i64), ptr %t3684
  %t3686 = or i64 %t3685, 4
  %t3687 = getelementptr i64, ptr %t3684, i64 1
  store i64 %t3670, ptr %t3687
  %t3688 = getelementptr i64, ptr %t3684, i64 2
  store i64 %t3686, ptr %t3688
  %t3689 = getelementptr i64, ptr %t3684, i64 3
  store i64 %a0, ptr %t3689
  %t3690 = or i64 %t3676, 8
  %t3691 = and i64 %t3690, 7
  %t3692 = icmp eq i64 %t3691, 0
  br i1 %t3692, label %fixfast885, label %fixslow886
fixfast885:
  %t3693 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3676, i64 8)
  %t3694 = extractvalue {i64, i1} %t3693, 0
  %t3695 = extractvalue {i64, i1} %t3693, 1
  br i1 %t3695, label %fixslow886, label %fixmerge887
fixslow886:
  %t3696 = call i64 @rt_sub(i64 %t3676, i64 8)
  br label %fixmerge887
fixmerge887:
  %t3697 = phi i64 [ %t3694, %fixfast885 ], [ %t3696, %fixslow886 ]
  %t3698 = musttail call fastcc i64 @"scheme.base:code_729"(i64 %t3686, i64 2, i64 %t3697, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3698
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector->list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3699 = call i64 @rt_vector_length(i64 %a0)
  %t3700 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t3700)
  %t3701 = and i64 %t3700, -8
  %t3702 = inttoptr i64 %t3701 to ptr
  %t3703 = load i64, ptr %t3702
  %t3704 = inttoptr i64 %t3703 to ptr
  %t3705 = call fastcc i64%t3704(i64 %t3700, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3706 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t3706)
  %t3707 = and i64 %t3706, -8
  %t3708 = inttoptr i64 %t3707 to ptr
  %t3709 = load i64, ptr %t3708
  %t3710 = inttoptr i64 %t3709 to ptr
  %t3711 = call fastcc i64%t3710(i64 %t3706, i64 2, i64 2, i64 %t3699, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3712 = call i64 @rt_intern(ptr @.str.sym.21)
  %t3713 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t3713)
  %t3714 = and i64 %t3713, -8
  %t3715 = inttoptr i64 %t3714 to ptr
  %t3716 = load i64, ptr %t3715
  %t3717 = inttoptr i64 %t3716 to ptr
  %t3718 = call fastcc i64%t3717(i64 %t3713, i64 4, i64 %t3712, i64 %t3705, i64 %t3711, i64 %t3699, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3719 = call ptr @rt_alloc_words(i64 4)
  %t3720 = ptrtoint ptr %t3719 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_729" to i64), ptr %t3719
  %t3721 = or i64 %t3720, 4
  %t3722 = getelementptr i64, ptr %t3719, i64 1
  store i64 %t3705, ptr %t3722
  %t3723 = getelementptr i64, ptr %t3719, i64 2
  store i64 %t3721, ptr %t3723
  %t3724 = getelementptr i64, ptr %t3719, i64 3
  store i64 %a0, ptr %t3724
  %t3725 = or i64 %t3711, 8
  %t3726 = and i64 %t3725, 7
  %t3727 = icmp eq i64 %t3726, 0
  br i1 %t3727, label %fixfast888, label %fixslow889
fixfast888:
  %t3728 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3711, i64 8)
  %t3729 = extractvalue {i64, i1} %t3728, 0
  %t3730 = extractvalue {i64, i1} %t3728, 1
  br i1 %t3730, label %fixslow889, label %fixmerge890
fixslow889:
  %t3731 = call i64 @rt_sub(i64 %t3711, i64 8)
  br label %fixmerge890
fixmerge890:
  %t3732 = phi i64 [ %t3729, %fixfast888 ], [ %t3731, %fixslow889 ]
  %t3733 = musttail call fastcc i64 @"scheme.base:code_729"(i64 %t3721, i64 2, i64 %t3732, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3733
}

define fastcc i64 @"scheme.base:code_744"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3738 = icmp eq i64 %argc, 1
  br i1 %t3738, label %argok892, label %arityerr891
arityerr891:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok892:
  %t3739 = and i64 %self, -8
  %t3740 = inttoptr i64 %t3739 to ptr
  %t3741 = getelementptr i64, ptr %t3740, i64 1
  %t3742 = load i64, ptr %t3741
  %t3743 = or i64 %a0, %t3742
  %t3744 = and i64 %t3743, 7
  %t3745 = icmp eq i64 %t3744, 0
  br i1 %t3745, label %fixfast893, label %fixslow894
fixfast893:
  %t3746 = icmp eq i64 %a0, %t3742
  %t3747 = select i1 %t3746, i64 257, i64 1
  br label %fixmerge895
fixslow894:
  %t3748 = call i64 @rt_num_eq(i64 %a0, i64 %t3742)
  br label %fixmerge895
fixmerge895:
  %t3749 = phi i64 [ %t3747, %fixfast893 ], [ %t3748, %fixslow894 ]
  %t3750 = icmp ne i64 %t3749, 1
  br i1 %t3750, label %then896, label %else897
then896:
  %t3751 = and i64 %self, -8
  %t3752 = inttoptr i64 %t3751 to ptr
  %t3753 = getelementptr i64, ptr %t3752, i64 2
  %t3754 = load i64, ptr %t3753
  ret i64 %t3754
else897:
  %t3755 = and i64 %self, -8
  %t3756 = inttoptr i64 %t3755 to ptr
  %t3757 = getelementptr i64, ptr %t3756, i64 2
  %t3758 = load i64, ptr %t3757
  %t3759 = and i64 %self, -8
  %t3760 = inttoptr i64 %t3759 to ptr
  %t3761 = getelementptr i64, ptr %t3760, i64 3
  %t3762 = load i64, ptr %t3761
  %t3763 = or i64 %a0, %t3762
  %t3764 = and i64 %t3763, 7
  %t3765 = icmp eq i64 %t3764, 0
  br i1 %t3765, label %fixfast898, label %fixslow899
fixfast898:
  %t3766 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t3762)
  %t3767 = extractvalue {i64, i1} %t3766, 0
  %t3768 = extractvalue {i64, i1} %t3766, 1
  br i1 %t3768, label %fixslow899, label %fixmerge900
fixslow899:
  %t3769 = call i64 @rt_sub(i64 %a0, i64 %t3762)
  br label %fixmerge900
fixmerge900:
  %t3770 = phi i64 [ %t3767, %fixfast898 ], [ %t3769, %fixslow899 ]
  %t3771 = and i64 %self, -8
  %t3772 = inttoptr i64 %t3771 to ptr
  %t3773 = getelementptr i64, ptr %t3772, i64 4
  %t3774 = load i64, ptr %t3773
  %t3775 = call i64 @rt_vector_ref(i64 %t3774, i64 %a0)
  %t3776 = call i64 @rt_vector_set(i64 %t3758, i64 %t3770, i64 %t3775)
  %t3777 = or i64 %a0, 8
  %t3778 = and i64 %t3777, 7
  %t3779 = icmp eq i64 %t3778, 0
  br i1 %t3779, label %fixfast901, label %fixslow902
fixfast901:
  %t3780 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3781 = extractvalue {i64, i1} %t3780, 0
  %t3782 = extractvalue {i64, i1} %t3780, 1
  br i1 %t3782, label %fixslow902, label %fixmerge903
fixslow902:
  %t3783 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge903
fixmerge903:
  %t3784 = phi i64 [ %t3781, %fixfast901 ], [ %t3783, %fixslow902 ]
  %t3785 = musttail call fastcc i64 @"scheme.base:code_744"(i64 %self, i64 1, i64 %t3784, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3785
}

define fastcc i64 @"scheme.base:code:vector-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3786 = icmp sge i64 %argc, 1
  br i1 %t3786, label %argok905, label %arityerr904
arityerr904:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok905:
  %t3787 = call ptr @rt_alloc_words(i64 8)
  %t3788 = getelementptr i64, ptr %t3787, i64 0
  store i64 %a0, ptr %t3788
  %t3789 = getelementptr i64, ptr %t3787, i64 1
  store i64 %a1, ptr %t3789
  %t3790 = getelementptr i64, ptr %t3787, i64 2
  store i64 %a2, ptr %t3790
  %t3791 = getelementptr i64, ptr %t3787, i64 3
  store i64 %a3, ptr %t3791
  %t3792 = getelementptr i64, ptr %t3787, i64 4
  store i64 %a4, ptr %t3792
  %t3793 = getelementptr i64, ptr %t3787, i64 5
  store i64 %a5, ptr %t3793
  %t3794 = getelementptr i64, ptr %t3787, i64 6
  store i64 %a6, ptr %t3794
  %t3795 = getelementptr i64, ptr %t3787, i64 7
  store i64 %a7, ptr %t3795
  %t3796 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t3787, ptr %overflow)
  %t3797 = call i64 @rt_vector_length(i64 %a0)
  %t3798 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t3798)
  %t3799 = and i64 %t3798, -8
  %t3800 = inttoptr i64 %t3799 to ptr
  %t3801 = load i64, ptr %t3800
  %t3802 = inttoptr i64 %t3801 to ptr
  %t3803 = call fastcc i64%t3802(i64 %t3798, i64 1, i64 %t3796, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3804 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t3804)
  %t3805 = and i64 %t3804, -8
  %t3806 = inttoptr i64 %t3805 to ptr
  %t3807 = load i64, ptr %t3806
  %t3808 = inttoptr i64 %t3807 to ptr
  %t3809 = call fastcc i64%t3808(i64 %t3804, i64 2, i64 %t3796, i64 %t3797, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3810 = call i64 @rt_intern(ptr @.str.sym.22)
  %t3811 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t3811)
  %t3812 = and i64 %t3811, -8
  %t3813 = inttoptr i64 %t3812 to ptr
  %t3814 = load i64, ptr %t3813
  %t3815 = inttoptr i64 %t3814 to ptr
  %t3816 = call fastcc i64%t3815(i64 %t3811, i64 4, i64 %t3810, i64 %t3803, i64 %t3809, i64 %t3797, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3817 = or i64 %t3809, %t3803
  %t3818 = and i64 %t3817, 7
  %t3819 = icmp eq i64 %t3818, 0
  br i1 %t3819, label %fixfast906, label %fixslow907
fixfast906:
  %t3820 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3809, i64 %t3803)
  %t3821 = extractvalue {i64, i1} %t3820, 0
  %t3822 = extractvalue {i64, i1} %t3820, 1
  br i1 %t3822, label %fixslow907, label %fixmerge908
fixslow907:
  %t3823 = call i64 @rt_sub(i64 %t3809, i64 %t3803)
  br label %fixmerge908
fixmerge908:
  %t3824 = phi i64 [ %t3821, %fixfast906 ], [ %t3823, %fixslow907 ]
  %t3825 = call i64 @rt_make_vector(i64 %t3824, i64 0)
  %t3826 = call ptr @rt_alloc_words(i64 6)
  %t3827 = ptrtoint ptr %t3826 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_744" to i64), ptr %t3826
  %t3828 = or i64 %t3827, 4
  %t3829 = getelementptr i64, ptr %t3826, i64 1
  store i64 %t3809, ptr %t3829
  %t3830 = getelementptr i64, ptr %t3826, i64 2
  store i64 %t3825, ptr %t3830
  %t3831 = getelementptr i64, ptr %t3826, i64 3
  store i64 %t3803, ptr %t3831
  %t3832 = getelementptr i64, ptr %t3826, i64 4
  store i64 %a0, ptr %t3832
  %t3833 = getelementptr i64, ptr %t3826, i64 5
  store i64 %t3828, ptr %t3833
  %t3834 = musttail call fastcc i64 @"scheme.base:code_744"(i64 %t3828, i64 1, i64 %t3803, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3834
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3835 = call i64 @rt_vector_length(i64 %a0)
  %t3836 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t3836)
  %t3837 = and i64 %t3836, -8
  %t3838 = inttoptr i64 %t3837 to ptr
  %t3839 = load i64, ptr %t3838
  %t3840 = inttoptr i64 %t3839 to ptr
  %t3841 = call fastcc i64%t3840(i64 %t3836, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3842 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t3842)
  %t3843 = and i64 %t3842, -8
  %t3844 = inttoptr i64 %t3843 to ptr
  %t3845 = load i64, ptr %t3844
  %t3846 = inttoptr i64 %t3845 to ptr
  %t3847 = call fastcc i64%t3846(i64 %t3842, i64 2, i64 2, i64 %t3835, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3848 = call i64 @rt_intern(ptr @.str.sym.22)
  %t3849 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t3849)
  %t3850 = and i64 %t3849, -8
  %t3851 = inttoptr i64 %t3850 to ptr
  %t3852 = load i64, ptr %t3851
  %t3853 = inttoptr i64 %t3852 to ptr
  %t3854 = call fastcc i64%t3853(i64 %t3849, i64 4, i64 %t3848, i64 %t3841, i64 %t3847, i64 %t3835, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3855 = or i64 %t3847, %t3841
  %t3856 = and i64 %t3855, 7
  %t3857 = icmp eq i64 %t3856, 0
  br i1 %t3857, label %fixfast909, label %fixslow910
fixfast909:
  %t3858 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3847, i64 %t3841)
  %t3859 = extractvalue {i64, i1} %t3858, 0
  %t3860 = extractvalue {i64, i1} %t3858, 1
  br i1 %t3860, label %fixslow910, label %fixmerge911
fixslow910:
  %t3861 = call i64 @rt_sub(i64 %t3847, i64 %t3841)
  br label %fixmerge911
fixmerge911:
  %t3862 = phi i64 [ %t3859, %fixfast909 ], [ %t3861, %fixslow910 ]
  %t3863 = call i64 @rt_make_vector(i64 %t3862, i64 0)
  %t3864 = call ptr @rt_alloc_words(i64 6)
  %t3865 = ptrtoint ptr %t3864 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_744" to i64), ptr %t3864
  %t3866 = or i64 %t3865, 4
  %t3867 = getelementptr i64, ptr %t3864, i64 1
  store i64 %t3847, ptr %t3867
  %t3868 = getelementptr i64, ptr %t3864, i64 2
  store i64 %t3863, ptr %t3868
  %t3869 = getelementptr i64, ptr %t3864, i64 3
  store i64 %t3841, ptr %t3869
  %t3870 = getelementptr i64, ptr %t3864, i64 4
  store i64 %a0, ptr %t3870
  %t3871 = getelementptr i64, ptr %t3864, i64 5
  store i64 %t3866, ptr %t3871
  %t3872 = musttail call fastcc i64 @"scheme.base:code_744"(i64 %t3866, i64 1, i64 %t3841, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3872
}

define fastcc i64 @"scheme.base:code_762"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3877 = icmp eq i64 %argc, 1
  br i1 %t3877, label %argok913, label %arityerr912
arityerr912:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok913:
  %t3878 = and i64 %self, -8
  %t3879 = inttoptr i64 %t3878 to ptr
  %t3880 = getelementptr i64, ptr %t3879, i64 1
  %t3881 = load i64, ptr %t3880
  %t3882 = or i64 %a0, %t3881
  %t3883 = and i64 %t3882, 7
  %t3884 = icmp eq i64 %t3883, 0
  br i1 %t3884, label %fixfast914, label %fixslow915
fixfast914:
  %t3885 = icmp eq i64 %a0, %t3881
  %t3886 = select i1 %t3885, i64 257, i64 1
  br label %fixmerge916
fixslow915:
  %t3887 = call i64 @rt_num_eq(i64 %a0, i64 %t3881)
  br label %fixmerge916
fixmerge916:
  %t3888 = phi i64 [ %t3886, %fixfast914 ], [ %t3887, %fixslow915 ]
  %t3889 = icmp ne i64 %t3888, 1
  br i1 %t3889, label %then917, label %else918
then917:
  %t3890 = and i64 %self, -8
  %t3891 = inttoptr i64 %t3890 to ptr
  %t3892 = getelementptr i64, ptr %t3891, i64 3
  %t3893 = load i64, ptr %t3892
  %t3894 = call i64 @rt_cdr(i64 %t3893)
  %t3895 = and i64 %self, -8
  %t3896 = inttoptr i64 %t3895 to ptr
  %t3897 = getelementptr i64, ptr %t3896, i64 4
  %t3898 = load i64, ptr %t3897
  %t3899 = and i64 %self, -8
  %t3900 = inttoptr i64 %t3899 to ptr
  %t3901 = getelementptr i64, ptr %t3900, i64 1
  %t3902 = load i64, ptr %t3901
  %t3903 = or i64 %t3898, %t3902
  %t3904 = and i64 %t3903, 7
  %t3905 = icmp eq i64 %t3904, 0
  br i1 %t3905, label %fixfast919, label %fixslow920
fixfast919:
  %t3906 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3898, i64 %t3902)
  %t3907 = extractvalue {i64, i1} %t3906, 0
  %t3908 = extractvalue {i64, i1} %t3906, 1
  br i1 %t3908, label %fixslow920, label %fixmerge921
fixslow920:
  %t3909 = call i64 @rt_add(i64 %t3898, i64 %t3902)
  br label %fixmerge921
fixmerge921:
  %t3910 = phi i64 [ %t3907, %fixfast919 ], [ %t3909, %fixslow920 ]
  %t3911 = and i64 %self, -8
  %t3912 = inttoptr i64 %t3911 to ptr
  %t3913 = getelementptr i64, ptr %t3912, i64 2
  %t3914 = load i64, ptr %t3913
  %t3915 = musttail call fastcc i64 @"scheme.base:code_760"(i64 %t3914, i64 2, i64 %t3894, i64 %t3910, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3915
else918:
  %t3916 = and i64 %self, -8
  %t3917 = inttoptr i64 %t3916 to ptr
  %t3918 = getelementptr i64, ptr %t3917, i64 5
  %t3919 = load i64, ptr %t3918
  %t3920 = and i64 %self, -8
  %t3921 = inttoptr i64 %t3920 to ptr
  %t3922 = getelementptr i64, ptr %t3921, i64 4
  %t3923 = load i64, ptr %t3922
  %t3924 = or i64 %t3923, %a0
  %t3925 = and i64 %t3924, 7
  %t3926 = icmp eq i64 %t3925, 0
  br i1 %t3926, label %fixfast922, label %fixslow923
fixfast922:
  %t3927 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3923, i64 %a0)
  %t3928 = extractvalue {i64, i1} %t3927, 0
  %t3929 = extractvalue {i64, i1} %t3927, 1
  br i1 %t3929, label %fixslow923, label %fixmerge924
fixslow923:
  %t3930 = call i64 @rt_add(i64 %t3923, i64 %a0)
  br label %fixmerge924
fixmerge924:
  %t3931 = phi i64 [ %t3928, %fixfast922 ], [ %t3930, %fixslow923 ]
  %t3932 = and i64 %self, -8
  %t3933 = inttoptr i64 %t3932 to ptr
  %t3934 = getelementptr i64, ptr %t3933, i64 6
  %t3935 = load i64, ptr %t3934
  %t3936 = call i64 @rt_vector_ref(i64 %t3935, i64 %a0)
  %t3937 = call i64 @rt_vector_set(i64 %t3919, i64 %t3931, i64 %t3936)
  %t3938 = or i64 %a0, 8
  %t3939 = and i64 %t3938, 7
  %t3940 = icmp eq i64 %t3939, 0
  br i1 %t3940, label %fixfast925, label %fixslow926
fixfast925:
  %t3941 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3942 = extractvalue {i64, i1} %t3941, 0
  %t3943 = extractvalue {i64, i1} %t3941, 1
  br i1 %t3943, label %fixslow926, label %fixmerge927
fixslow926:
  %t3944 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge927
fixmerge927:
  %t3945 = phi i64 [ %t3942, %fixfast925 ], [ %t3944, %fixslow926 ]
  %t3946 = musttail call fastcc i64 @"scheme.base:code_762"(i64 %self, i64 1, i64 %t3945, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3946
}

define fastcc i64 @"scheme.base:code_760"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3947 = icmp eq i64 %argc, 2
  br i1 %t3947, label %argok929, label %arityerr928
arityerr928:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok929:
  %t3948 = call i64 @rt_null_p(i64 %a0)
  %t3949 = icmp ne i64 %t3948, 1
  br i1 %t3949, label %then930, label %else931
then930:
  %t3950 = and i64 %self, -8
  %t3951 = inttoptr i64 %t3950 to ptr
  %t3952 = getelementptr i64, ptr %t3951, i64 1
  %t3953 = load i64, ptr %t3952
  ret i64 %t3953
else931:
  %t3954 = call i64 @rt_car(i64 %a0)
  %t3955 = call i64 @rt_vector_length(i64 %t3954)
  %t3956 = call ptr @rt_alloc_words(i64 8)
  %t3957 = ptrtoint ptr %t3956 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_762" to i64), ptr %t3956
  %t3958 = or i64 %t3957, 4
  %t3959 = getelementptr i64, ptr %t3956, i64 1
  store i64 %t3955, ptr %t3959
  %t3960 = and i64 %self, -8
  %t3961 = inttoptr i64 %t3960 to ptr
  %t3962 = getelementptr i64, ptr %t3961, i64 2
  %t3963 = load i64, ptr %t3962
  %t3964 = getelementptr i64, ptr %t3956, i64 2
  store i64 %t3963, ptr %t3964
  %t3965 = getelementptr i64, ptr %t3956, i64 3
  store i64 %a0, ptr %t3965
  %t3966 = getelementptr i64, ptr %t3956, i64 4
  store i64 %a1, ptr %t3966
  %t3967 = and i64 %self, -8
  %t3968 = inttoptr i64 %t3967 to ptr
  %t3969 = getelementptr i64, ptr %t3968, i64 1
  %t3970 = load i64, ptr %t3969
  %t3971 = getelementptr i64, ptr %t3956, i64 5
  store i64 %t3970, ptr %t3971
  %t3972 = getelementptr i64, ptr %t3956, i64 6
  store i64 %t3954, ptr %t3972
  %t3973 = getelementptr i64, ptr %t3956, i64 7
  store i64 %t3958, ptr %t3973
  %t3974 = musttail call fastcc i64 @"scheme.base:code_762"(i64 %t3958, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3974
}

define fastcc i64 @"scheme.base:code:vector-append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3975 = icmp sge i64 %argc, 0
  br i1 %t3975, label %argok933, label %arityerr932
arityerr932:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok933:
  %t3976 = call ptr @rt_alloc_words(i64 8)
  %t3977 = getelementptr i64, ptr %t3976, i64 0
  store i64 %a0, ptr %t3977
  %t3978 = getelementptr i64, ptr %t3976, i64 1
  store i64 %a1, ptr %t3978
  %t3979 = getelementptr i64, ptr %t3976, i64 2
  store i64 %a2, ptr %t3979
  %t3980 = getelementptr i64, ptr %t3976, i64 3
  store i64 %a3, ptr %t3980
  %t3981 = getelementptr i64, ptr %t3976, i64 4
  store i64 %a4, ptr %t3981
  %t3982 = getelementptr i64, ptr %t3976, i64 5
  store i64 %a5, ptr %t3982
  %t3983 = getelementptr i64, ptr %t3976, i64 6
  store i64 %a6, ptr %t3983
  %t3984 = getelementptr i64, ptr %t3976, i64 7
  store i64 %a7, ptr %t3984
  %t3985 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t3976, ptr %overflow)
  %t3986 = load i64, ptr @"scheme.base:vec-total"
  call void @rt_check_callable(i64 %t3986)
  %t3987 = and i64 %t3986, -8
  %t3988 = inttoptr i64 %t3987 to ptr
  %t3989 = load i64, ptr %t3988
  %t3990 = inttoptr i64 %t3989 to ptr
  %t3991 = call fastcc i64%t3990(i64 %t3986, i64 1, i64 %t3985, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3992 = call i64 @rt_make_vector(i64 %t3991, i64 0)
  %t3993 = call ptr @rt_alloc_words(i64 3)
  %t3994 = ptrtoint ptr %t3993 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_760" to i64), ptr %t3993
  %t3995 = or i64 %t3994, 4
  %t3996 = getelementptr i64, ptr %t3993, i64 1
  store i64 %t3992, ptr %t3996
  %t3997 = getelementptr i64, ptr %t3993, i64 2
  store i64 %t3995, ptr %t3997
  %t3998 = musttail call fastcc i64 @"scheme.base:code_760"(i64 %t3995, i64 2, i64 %t3985, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3998
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector-append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3999 = load i64, ptr @"scheme.base:vec-total"
  call void @rt_check_callable(i64 %t3999)
  %t4000 = and i64 %t3999, -8
  %t4001 = inttoptr i64 %t4000 to ptr
  %t4002 = load i64, ptr %t4001
  %t4003 = inttoptr i64 %t4002 to ptr
  %t4004 = call fastcc i64%t4003(i64 %t3999, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4005 = call i64 @rt_make_vector(i64 %t4004, i64 0)
  %t4006 = call ptr @rt_alloc_words(i64 3)
  %t4007 = ptrtoint ptr %t4006 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_760" to i64), ptr %t4006
  %t4008 = or i64 %t4007, 4
  %t4009 = getelementptr i64, ptr %t4006, i64 1
  store i64 %t4005, ptr %t4009
  %t4010 = getelementptr i64, ptr %t4006, i64 2
  store i64 %t4008, ptr %t4010
  %t4011 = musttail call fastcc i64 @"scheme.base:code_760"(i64 %t4008, i64 2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4011
}

define fastcc i64 @"scheme.base:code:vec-total"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4016 = icmp eq i64 %argc, 1
  br i1 %t4016, label %argok935, label %arityerr934
arityerr934:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok935:
  %t4017 = call i64 @rt_null_p(i64 %a0)
  %t4018 = icmp ne i64 %t4017, 1
  br i1 %t4018, label %then936, label %else937
then936:
  ret i64 0
else937:
  %t4019 = call i64 @rt_car(i64 %a0)
  %t4020 = call i64 @rt_vector_length(i64 %t4019)
  %t4021 = call i64 @rt_cdr(i64 %a0)
  %t4022 = load i64, ptr @"scheme.base:vec-total"
  call void @rt_check_callable(i64 %t4022)
  %t4023 = and i64 %t4022, -8
  %t4024 = inttoptr i64 %t4023 to ptr
  %t4025 = load i64, ptr %t4024
  %t4026 = inttoptr i64 %t4025 to ptr
  %t4027 = call fastcc i64%t4026(i64 %t4022, i64 1, i64 %t4021, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4028 = or i64 %t4020, %t4027
  %t4029 = and i64 %t4028, 7
  %t4030 = icmp eq i64 %t4029, 0
  br i1 %t4030, label %fixfast938, label %fixslow939
fixfast938:
  %t4031 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4020, i64 %t4027)
  %t4032 = extractvalue {i64, i1} %t4031, 0
  %t4033 = extractvalue {i64, i1} %t4031, 1
  br i1 %t4033, label %fixslow939, label %fixmerge940
fixslow939:
  %t4034 = call i64 @rt_add(i64 %t4020, i64 %t4027)
  br label %fixmerge940
fixmerge940:
  %t4035 = phi i64 [ %t4032, %fixfast938 ], [ %t4034, %fixslow939 ]
  ret i64 %t4035
}

define fastcc i64 @"scheme.base:code_779"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4040 = icmp eq i64 %argc, 1
  br i1 %t4040, label %argok942, label %arityerr941
arityerr941:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok942:
  %t4041 = and i64 %self, -8
  %t4042 = inttoptr i64 %t4041 to ptr
  %t4043 = getelementptr i64, ptr %t4042, i64 1
  %t4044 = load i64, ptr %t4043
  %t4045 = or i64 %a0, %t4044
  %t4046 = and i64 %t4045, 7
  %t4047 = icmp eq i64 %t4046, 0
  br i1 %t4047, label %fixfast943, label %fixslow944
fixfast943:
  %t4048 = icmp eq i64 %a0, %t4044
  %t4049 = select i1 %t4048, i64 257, i64 1
  br label %fixmerge945
fixslow944:
  %t4050 = call i64 @rt_num_eq(i64 %a0, i64 %t4044)
  br label %fixmerge945
fixmerge945:
  %t4051 = phi i64 [ %t4049, %fixfast943 ], [ %t4050, %fixslow944 ]
  %t4052 = icmp ne i64 %t4051, 1
  br i1 %t4052, label %then946, label %else947
then946:
  %t4053 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4053)
  %t4054 = and i64 %t4053, -8
  %t4055 = inttoptr i64 %t4054 to ptr
  %t4056 = load i64, ptr %t4055
  %t4057 = inttoptr i64 %t4056 to ptr
  %t4058 = musttail call fastcc i64 %t4057(i64 %t4053, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4058
else947:
  %t4059 = and i64 %self, -8
  %t4060 = inttoptr i64 %t4059 to ptr
  %t4061 = getelementptr i64, ptr %t4060, i64 2
  %t4062 = load i64, ptr %t4061
  %t4063 = and i64 %self, -8
  %t4064 = inttoptr i64 %t4063 to ptr
  %t4065 = getelementptr i64, ptr %t4064, i64 3
  %t4066 = load i64, ptr %t4065
  %t4067 = call i64 @rt_vector_set(i64 %t4062, i64 %a0, i64 %t4066)
  %t4068 = or i64 %a0, 8
  %t4069 = and i64 %t4068, 7
  %t4070 = icmp eq i64 %t4069, 0
  br i1 %t4070, label %fixfast948, label %fixslow949
fixfast948:
  %t4071 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4072 = extractvalue {i64, i1} %t4071, 0
  %t4073 = extractvalue {i64, i1} %t4071, 1
  br i1 %t4073, label %fixslow949, label %fixmerge950
fixslow949:
  %t4074 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge950
fixmerge950:
  %t4075 = phi i64 [ %t4072, %fixfast948 ], [ %t4074, %fixslow949 ]
  %t4076 = musttail call fastcc i64 @"scheme.base:code_779"(i64 %self, i64 1, i64 %t4075, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4076
}

define fastcc i64 @"scheme.base:code:vector-fill!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4077 = icmp sge i64 %argc, 2
  br i1 %t4077, label %argok952, label %arityerr951
arityerr951:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok952:
  %t4078 = call ptr @rt_alloc_words(i64 8)
  %t4079 = getelementptr i64, ptr %t4078, i64 0
  store i64 %a0, ptr %t4079
  %t4080 = getelementptr i64, ptr %t4078, i64 1
  store i64 %a1, ptr %t4080
  %t4081 = getelementptr i64, ptr %t4078, i64 2
  store i64 %a2, ptr %t4081
  %t4082 = getelementptr i64, ptr %t4078, i64 3
  store i64 %a3, ptr %t4082
  %t4083 = getelementptr i64, ptr %t4078, i64 4
  store i64 %a4, ptr %t4083
  %t4084 = getelementptr i64, ptr %t4078, i64 5
  store i64 %a5, ptr %t4084
  %t4085 = getelementptr i64, ptr %t4078, i64 6
  store i64 %a6, ptr %t4085
  %t4086 = getelementptr i64, ptr %t4078, i64 7
  store i64 %a7, ptr %t4086
  %t4087 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t4078, ptr %overflow)
  %t4088 = call i64 @rt_vector_length(i64 %a0)
  %t4089 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4089)
  %t4090 = and i64 %t4089, -8
  %t4091 = inttoptr i64 %t4090 to ptr
  %t4092 = load i64, ptr %t4091
  %t4093 = inttoptr i64 %t4092 to ptr
  %t4094 = call fastcc i64%t4093(i64 %t4089, i64 1, i64 %t4087, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4095 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4095)
  %t4096 = and i64 %t4095, -8
  %t4097 = inttoptr i64 %t4096 to ptr
  %t4098 = load i64, ptr %t4097
  %t4099 = inttoptr i64 %t4098 to ptr
  %t4100 = call fastcc i64%t4099(i64 %t4095, i64 2, i64 %t4087, i64 %t4088, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4101 = call i64 @rt_intern(ptr @.str.sym.23)
  %t4102 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4102)
  %t4103 = and i64 %t4102, -8
  %t4104 = inttoptr i64 %t4103 to ptr
  %t4105 = load i64, ptr %t4104
  %t4106 = inttoptr i64 %t4105 to ptr
  %t4107 = call fastcc i64%t4106(i64 %t4102, i64 4, i64 %t4101, i64 %t4094, i64 %t4100, i64 %t4088, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4108 = call ptr @rt_alloc_words(i64 5)
  %t4109 = ptrtoint ptr %t4108 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_779" to i64), ptr %t4108
  %t4110 = or i64 %t4109, 4
  %t4111 = getelementptr i64, ptr %t4108, i64 1
  store i64 %t4100, ptr %t4111
  %t4112 = getelementptr i64, ptr %t4108, i64 2
  store i64 %a0, ptr %t4112
  %t4113 = getelementptr i64, ptr %t4108, i64 3
  store i64 %a1, ptr %t4113
  %t4114 = getelementptr i64, ptr %t4108, i64 4
  store i64 %t4110, ptr %t4114
  %t4115 = musttail call fastcc i64 @"scheme.base:code_779"(i64 %t4110, i64 1, i64 %t4094, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4115
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector-fill!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4116 = call i64 @rt_vector_length(i64 %a0)
  %t4117 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4117)
  %t4118 = and i64 %t4117, -8
  %t4119 = inttoptr i64 %t4118 to ptr
  %t4120 = load i64, ptr %t4119
  %t4121 = inttoptr i64 %t4120 to ptr
  %t4122 = call fastcc i64%t4121(i64 %t4117, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4123 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4123)
  %t4124 = and i64 %t4123, -8
  %t4125 = inttoptr i64 %t4124 to ptr
  %t4126 = load i64, ptr %t4125
  %t4127 = inttoptr i64 %t4126 to ptr
  %t4128 = call fastcc i64%t4127(i64 %t4123, i64 2, i64 2, i64 %t4116, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4129 = call i64 @rt_intern(ptr @.str.sym.23)
  %t4130 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4130)
  %t4131 = and i64 %t4130, -8
  %t4132 = inttoptr i64 %t4131 to ptr
  %t4133 = load i64, ptr %t4132
  %t4134 = inttoptr i64 %t4133 to ptr
  %t4135 = call fastcc i64%t4134(i64 %t4130, i64 4, i64 %t4129, i64 %t4122, i64 %t4128, i64 %t4116, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4136 = call ptr @rt_alloc_words(i64 5)
  %t4137 = ptrtoint ptr %t4136 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_779" to i64), ptr %t4136
  %t4138 = or i64 %t4137, 4
  %t4139 = getelementptr i64, ptr %t4136, i64 1
  store i64 %t4128, ptr %t4139
  %t4140 = getelementptr i64, ptr %t4136, i64 2
  store i64 %a0, ptr %t4140
  %t4141 = getelementptr i64, ptr %t4136, i64 3
  store i64 %a1, ptr %t4141
  %t4142 = getelementptr i64, ptr %t4136, i64 4
  store i64 %t4138, ptr %t4142
  %t4143 = musttail call fastcc i64 @"scheme.base:code_779"(i64 %t4138, i64 1, i64 %t4122, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4143
}

define fastcc i64 @"scheme.base:code_805"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4148 = icmp eq i64 %argc, 1
  br i1 %t4148, label %argok954, label %arityerr953
arityerr953:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok954:
  %t4149 = or i64 %a0, 0
  %t4150 = and i64 %t4149, 7
  %t4151 = icmp eq i64 %t4150, 0
  br i1 %t4151, label %fixfast955, label %fixslow956
fixfast955:
  %t4152 = icmp slt i64 %a0, 0
  %t4153 = select i1 %t4152, i64 257, i64 1
  br label %fixmerge957
fixslow956:
  %t4154 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge957
fixmerge957:
  %t4155 = phi i64 [ %t4153, %fixfast955 ], [ %t4154, %fixslow956 ]
  %t4156 = icmp ne i64 %t4155, 1
  br i1 %t4156, label %then958, label %else959
then958:
  %t4157 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4157)
  %t4158 = and i64 %t4157, -8
  %t4159 = inttoptr i64 %t4158 to ptr
  %t4160 = load i64, ptr %t4159
  %t4161 = inttoptr i64 %t4160 to ptr
  %t4162 = musttail call fastcc i64 %t4161(i64 %t4157, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4162
else959:
  %t4163 = and i64 %self, -8
  %t4164 = inttoptr i64 %t4163 to ptr
  %t4165 = getelementptr i64, ptr %t4164, i64 1
  %t4166 = load i64, ptr %t4165
  %t4167 = and i64 %self, -8
  %t4168 = inttoptr i64 %t4167 to ptr
  %t4169 = getelementptr i64, ptr %t4168, i64 2
  %t4170 = load i64, ptr %t4169
  %t4171 = or i64 %t4170, %a0
  %t4172 = and i64 %t4171, 7
  %t4173 = icmp eq i64 %t4172, 0
  br i1 %t4173, label %fixfast960, label %fixslow961
fixfast960:
  %t4174 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4170, i64 %a0)
  %t4175 = extractvalue {i64, i1} %t4174, 0
  %t4176 = extractvalue {i64, i1} %t4174, 1
  br i1 %t4176, label %fixslow961, label %fixmerge962
fixslow961:
  %t4177 = call i64 @rt_add(i64 %t4170, i64 %a0)
  br label %fixmerge962
fixmerge962:
  %t4178 = phi i64 [ %t4175, %fixfast960 ], [ %t4177, %fixslow961 ]
  %t4179 = and i64 %self, -8
  %t4180 = inttoptr i64 %t4179 to ptr
  %t4181 = getelementptr i64, ptr %t4180, i64 3
  %t4182 = load i64, ptr %t4181
  %t4183 = and i64 %self, -8
  %t4184 = inttoptr i64 %t4183 to ptr
  %t4185 = getelementptr i64, ptr %t4184, i64 4
  %t4186 = load i64, ptr %t4185
  %t4187 = or i64 %t4186, %a0
  %t4188 = and i64 %t4187, 7
  %t4189 = icmp eq i64 %t4188, 0
  br i1 %t4189, label %fixfast963, label %fixslow964
fixfast963:
  %t4190 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4186, i64 %a0)
  %t4191 = extractvalue {i64, i1} %t4190, 0
  %t4192 = extractvalue {i64, i1} %t4190, 1
  br i1 %t4192, label %fixslow964, label %fixmerge965
fixslow964:
  %t4193 = call i64 @rt_add(i64 %t4186, i64 %a0)
  br label %fixmerge965
fixmerge965:
  %t4194 = phi i64 [ %t4191, %fixfast963 ], [ %t4193, %fixslow964 ]
  %t4195 = call i64 @rt_vector_ref(i64 %t4182, i64 %t4194)
  %t4196 = call i64 @rt_vector_set(i64 %t4166, i64 %t4178, i64 %t4195)
  %t4197 = or i64 %a0, 8
  %t4198 = and i64 %t4197, 7
  %t4199 = icmp eq i64 %t4198, 0
  br i1 %t4199, label %fixfast966, label %fixslow967
fixfast966:
  %t4200 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t4201 = extractvalue {i64, i1} %t4200, 0
  %t4202 = extractvalue {i64, i1} %t4200, 1
  br i1 %t4202, label %fixslow967, label %fixmerge968
fixslow967:
  %t4203 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge968
fixmerge968:
  %t4204 = phi i64 [ %t4201, %fixfast966 ], [ %t4203, %fixslow967 ]
  %t4205 = musttail call fastcc i64 @"scheme.base:code_805"(i64 %self, i64 1, i64 %t4204, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4205
}

define fastcc i64 @"scheme.base:code_807"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4206 = icmp eq i64 %argc, 1
  br i1 %t4206, label %argok970, label %arityerr969
arityerr969:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok970:
  %t4207 = and i64 %self, -8
  %t4208 = inttoptr i64 %t4207 to ptr
  %t4209 = getelementptr i64, ptr %t4208, i64 1
  %t4210 = load i64, ptr %t4209
  %t4211 = and i64 %self, -8
  %t4212 = inttoptr i64 %t4211 to ptr
  %t4213 = getelementptr i64, ptr %t4212, i64 2
  %t4214 = load i64, ptr %t4213
  %t4215 = or i64 %t4210, %t4214
  %t4216 = and i64 %t4215, 7
  %t4217 = icmp eq i64 %t4216, 0
  br i1 %t4217, label %fixfast971, label %fixslow972
fixfast971:
  %t4218 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4210, i64 %t4214)
  %t4219 = extractvalue {i64, i1} %t4218, 0
  %t4220 = extractvalue {i64, i1} %t4218, 1
  br i1 %t4220, label %fixslow972, label %fixmerge973
fixslow972:
  %t4221 = call i64 @rt_sub(i64 %t4210, i64 %t4214)
  br label %fixmerge973
fixmerge973:
  %t4222 = phi i64 [ %t4219, %fixfast971 ], [ %t4221, %fixslow972 ]
  %t4223 = or i64 %a0, %t4222
  %t4224 = and i64 %t4223, 7
  %t4225 = icmp eq i64 %t4224, 0
  br i1 %t4225, label %fixfast974, label %fixslow975
fixfast974:
  %t4226 = icmp eq i64 %a0, %t4222
  %t4227 = select i1 %t4226, i64 257, i64 1
  br label %fixmerge976
fixslow975:
  %t4228 = call i64 @rt_num_eq(i64 %a0, i64 %t4222)
  br label %fixmerge976
fixmerge976:
  %t4229 = phi i64 [ %t4227, %fixfast974 ], [ %t4228, %fixslow975 ]
  %t4230 = icmp ne i64 %t4229, 1
  br i1 %t4230, label %then977, label %else978
then977:
  %t4231 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4231)
  %t4232 = and i64 %t4231, -8
  %t4233 = inttoptr i64 %t4232 to ptr
  %t4234 = load i64, ptr %t4233
  %t4235 = inttoptr i64 %t4234 to ptr
  %t4236 = musttail call fastcc i64 %t4235(i64 %t4231, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4236
else978:
  %t4237 = and i64 %self, -8
  %t4238 = inttoptr i64 %t4237 to ptr
  %t4239 = getelementptr i64, ptr %t4238, i64 3
  %t4240 = load i64, ptr %t4239
  %t4241 = and i64 %self, -8
  %t4242 = inttoptr i64 %t4241 to ptr
  %t4243 = getelementptr i64, ptr %t4242, i64 4
  %t4244 = load i64, ptr %t4243
  %t4245 = or i64 %t4244, %a0
  %t4246 = and i64 %t4245, 7
  %t4247 = icmp eq i64 %t4246, 0
  br i1 %t4247, label %fixfast979, label %fixslow980
fixfast979:
  %t4248 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4244, i64 %a0)
  %t4249 = extractvalue {i64, i1} %t4248, 0
  %t4250 = extractvalue {i64, i1} %t4248, 1
  br i1 %t4250, label %fixslow980, label %fixmerge981
fixslow980:
  %t4251 = call i64 @rt_add(i64 %t4244, i64 %a0)
  br label %fixmerge981
fixmerge981:
  %t4252 = phi i64 [ %t4249, %fixfast979 ], [ %t4251, %fixslow980 ]
  %t4253 = and i64 %self, -8
  %t4254 = inttoptr i64 %t4253 to ptr
  %t4255 = getelementptr i64, ptr %t4254, i64 5
  %t4256 = load i64, ptr %t4255
  %t4257 = and i64 %self, -8
  %t4258 = inttoptr i64 %t4257 to ptr
  %t4259 = getelementptr i64, ptr %t4258, i64 2
  %t4260 = load i64, ptr %t4259
  %t4261 = or i64 %t4260, %a0
  %t4262 = and i64 %t4261, 7
  %t4263 = icmp eq i64 %t4262, 0
  br i1 %t4263, label %fixfast982, label %fixslow983
fixfast982:
  %t4264 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4260, i64 %a0)
  %t4265 = extractvalue {i64, i1} %t4264, 0
  %t4266 = extractvalue {i64, i1} %t4264, 1
  br i1 %t4266, label %fixslow983, label %fixmerge984
fixslow983:
  %t4267 = call i64 @rt_add(i64 %t4260, i64 %a0)
  br label %fixmerge984
fixmerge984:
  %t4268 = phi i64 [ %t4265, %fixfast982 ], [ %t4267, %fixslow983 ]
  %t4269 = call i64 @rt_vector_ref(i64 %t4256, i64 %t4268)
  %t4270 = call i64 @rt_vector_set(i64 %t4240, i64 %t4252, i64 %t4269)
  %t4271 = or i64 %a0, 8
  %t4272 = and i64 %t4271, 7
  %t4273 = icmp eq i64 %t4272, 0
  br i1 %t4273, label %fixfast985, label %fixslow986
fixfast985:
  %t4274 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4275 = extractvalue {i64, i1} %t4274, 0
  %t4276 = extractvalue {i64, i1} %t4274, 1
  br i1 %t4276, label %fixslow986, label %fixmerge987
fixslow986:
  %t4277 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge987
fixmerge987:
  %t4278 = phi i64 [ %t4275, %fixfast985 ], [ %t4277, %fixslow986 ]
  %t4279 = musttail call fastcc i64 @"scheme.base:code_807"(i64 %self, i64 1, i64 %t4278, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4279
}

define fastcc i64 @"scheme.base:code:vector-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4280 = icmp sge i64 %argc, 3
  br i1 %t4280, label %argok989, label %arityerr988
arityerr988:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok989:
  %t4281 = call ptr @rt_alloc_words(i64 8)
  %t4282 = getelementptr i64, ptr %t4281, i64 0
  store i64 %a0, ptr %t4282
  %t4283 = getelementptr i64, ptr %t4281, i64 1
  store i64 %a1, ptr %t4283
  %t4284 = getelementptr i64, ptr %t4281, i64 2
  store i64 %a2, ptr %t4284
  %t4285 = getelementptr i64, ptr %t4281, i64 3
  store i64 %a3, ptr %t4285
  %t4286 = getelementptr i64, ptr %t4281, i64 4
  store i64 %a4, ptr %t4286
  %t4287 = getelementptr i64, ptr %t4281, i64 5
  store i64 %a5, ptr %t4287
  %t4288 = getelementptr i64, ptr %t4281, i64 6
  store i64 %a6, ptr %t4288
  %t4289 = getelementptr i64, ptr %t4281, i64 7
  store i64 %a7, ptr %t4289
  %t4290 = call i64 @rt_build_rest(i64 %argc, i64 3, i64 8, ptr %t4281, ptr %overflow)
  %t4291 = call i64 @rt_vector_length(i64 %a2)
  %t4292 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4292)
  %t4293 = and i64 %t4292, -8
  %t4294 = inttoptr i64 %t4293 to ptr
  %t4295 = load i64, ptr %t4294
  %t4296 = inttoptr i64 %t4295 to ptr
  %t4297 = call fastcc i64%t4296(i64 %t4292, i64 1, i64 %t4290, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4298 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4298)
  %t4299 = and i64 %t4298, -8
  %t4300 = inttoptr i64 %t4299 to ptr
  %t4301 = load i64, ptr %t4300
  %t4302 = inttoptr i64 %t4301 to ptr
  %t4303 = call fastcc i64%t4302(i64 %t4298, i64 2, i64 %t4290, i64 %t4291, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4304 = call i64 @rt_intern(ptr @.str.sym.24)
  %t4305 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4305)
  %t4306 = and i64 %t4305, -8
  %t4307 = inttoptr i64 %t4306 to ptr
  %t4308 = load i64, ptr %t4307
  %t4309 = inttoptr i64 %t4308 to ptr
  %t4310 = call fastcc i64%t4309(i64 %t4305, i64 4, i64 %t4304, i64 %t4297, i64 %t4303, i64 %t4291, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4311 = call i64 @rt_intern(ptr @.str.sym.24)
  %t4312 = or i64 %t4303, %t4297
  %t4313 = and i64 %t4312, 7
  %t4314 = icmp eq i64 %t4313, 0
  br i1 %t4314, label %fixfast990, label %fixslow991
fixfast990:
  %t4315 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4303, i64 %t4297)
  %t4316 = extractvalue {i64, i1} %t4315, 0
  %t4317 = extractvalue {i64, i1} %t4315, 1
  br i1 %t4317, label %fixslow991, label %fixmerge992
fixslow991:
  %t4318 = call i64 @rt_sub(i64 %t4303, i64 %t4297)
  br label %fixmerge992
fixmerge992:
  %t4319 = phi i64 [ %t4316, %fixfast990 ], [ %t4318, %fixslow991 ]
  %t4320 = or i64 %a1, %t4319
  %t4321 = and i64 %t4320, 7
  %t4322 = icmp eq i64 %t4321, 0
  br i1 %t4322, label %fixfast993, label %fixslow994
fixfast993:
  %t4323 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t4319)
  %t4324 = extractvalue {i64, i1} %t4323, 0
  %t4325 = extractvalue {i64, i1} %t4323, 1
  br i1 %t4325, label %fixslow994, label %fixmerge995
fixslow994:
  %t4326 = call i64 @rt_add(i64 %a1, i64 %t4319)
  br label %fixmerge995
fixmerge995:
  %t4327 = phi i64 [ %t4324, %fixfast993 ], [ %t4326, %fixslow994 ]
  %t4328 = call i64 @rt_vector_length(i64 %a0)
  %t4329 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4329)
  %t4330 = and i64 %t4329, -8
  %t4331 = inttoptr i64 %t4330 to ptr
  %t4332 = load i64, ptr %t4331
  %t4333 = inttoptr i64 %t4332 to ptr
  %t4334 = call fastcc i64%t4333(i64 %t4329, i64 4, i64 %t4311, i64 %a1, i64 %t4327, i64 %t4328, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4335 = or i64 %t4297, %a1
  %t4336 = and i64 %t4335, 7
  %t4337 = icmp eq i64 %t4336, 0
  br i1 %t4337, label %fixfast996, label %fixslow997
fixfast996:
  %t4338 = icmp slt i64 %t4297, %a1
  %t4339 = select i1 %t4338, i64 257, i64 1
  br label %fixmerge998
fixslow997:
  %t4340 = call i64 @rt_lt(i64 %t4297, i64 %a1)
  br label %fixmerge998
fixmerge998:
  %t4341 = phi i64 [ %t4339, %fixfast996 ], [ %t4340, %fixslow997 ]
  %t4342 = icmp ne i64 %t4341, 1
  br i1 %t4342, label %then999, label %else1000
then999:
  %t4343 = call ptr @rt_alloc_words(i64 6)
  %t4344 = ptrtoint ptr %t4343 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_805" to i64), ptr %t4343
  %t4345 = or i64 %t4344, 4
  %t4346 = getelementptr i64, ptr %t4343, i64 1
  store i64 %a0, ptr %t4346
  %t4347 = getelementptr i64, ptr %t4343, i64 2
  store i64 %a1, ptr %t4347
  %t4348 = getelementptr i64, ptr %t4343, i64 3
  store i64 %a2, ptr %t4348
  %t4349 = getelementptr i64, ptr %t4343, i64 4
  store i64 %t4297, ptr %t4349
  %t4350 = getelementptr i64, ptr %t4343, i64 5
  store i64 %t4345, ptr %t4350
  %t4351 = or i64 %t4303, %t4297
  %t4352 = and i64 %t4351, 7
  %t4353 = icmp eq i64 %t4352, 0
  br i1 %t4353, label %fixfast1001, label %fixslow1002
fixfast1001:
  %t4354 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4303, i64 %t4297)
  %t4355 = extractvalue {i64, i1} %t4354, 0
  %t4356 = extractvalue {i64, i1} %t4354, 1
  br i1 %t4356, label %fixslow1002, label %fixmerge1003
fixslow1002:
  %t4357 = call i64 @rt_sub(i64 %t4303, i64 %t4297)
  br label %fixmerge1003
fixmerge1003:
  %t4358 = phi i64 [ %t4355, %fixfast1001 ], [ %t4357, %fixslow1002 ]
  %t4359 = or i64 %t4358, 8
  %t4360 = and i64 %t4359, 7
  %t4361 = icmp eq i64 %t4360, 0
  br i1 %t4361, label %fixfast1004, label %fixslow1005
fixfast1004:
  %t4362 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4358, i64 8)
  %t4363 = extractvalue {i64, i1} %t4362, 0
  %t4364 = extractvalue {i64, i1} %t4362, 1
  br i1 %t4364, label %fixslow1005, label %fixmerge1006
fixslow1005:
  %t4365 = call i64 @rt_sub(i64 %t4358, i64 8)
  br label %fixmerge1006
fixmerge1006:
  %t4366 = phi i64 [ %t4363, %fixfast1004 ], [ %t4365, %fixslow1005 ]
  %t4367 = musttail call fastcc i64 @"scheme.base:code_805"(i64 %t4345, i64 1, i64 %t4366, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4367
else1000:
  %t4368 = call ptr @rt_alloc_words(i64 7)
  %t4369 = ptrtoint ptr %t4368 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_807" to i64), ptr %t4368
  %t4370 = or i64 %t4369, 4
  %t4371 = getelementptr i64, ptr %t4368, i64 1
  store i64 %t4303, ptr %t4371
  %t4372 = getelementptr i64, ptr %t4368, i64 2
  store i64 %t4297, ptr %t4372
  %t4373 = getelementptr i64, ptr %t4368, i64 3
  store i64 %a0, ptr %t4373
  %t4374 = getelementptr i64, ptr %t4368, i64 4
  store i64 %a1, ptr %t4374
  %t4375 = getelementptr i64, ptr %t4368, i64 5
  store i64 %a2, ptr %t4375
  %t4376 = getelementptr i64, ptr %t4368, i64 6
  store i64 %t4370, ptr %t4376
  %t4377 = musttail call fastcc i64 @"scheme.base:code_807"(i64 %t4370, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4377
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4378 = call i64 @rt_vector_length(i64 %a2)
  %t4379 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4379)
  %t4380 = and i64 %t4379, -8
  %t4381 = inttoptr i64 %t4380 to ptr
  %t4382 = load i64, ptr %t4381
  %t4383 = inttoptr i64 %t4382 to ptr
  %t4384 = call fastcc i64%t4383(i64 %t4379, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4385 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4385)
  %t4386 = and i64 %t4385, -8
  %t4387 = inttoptr i64 %t4386 to ptr
  %t4388 = load i64, ptr %t4387
  %t4389 = inttoptr i64 %t4388 to ptr
  %t4390 = call fastcc i64%t4389(i64 %t4385, i64 2, i64 2, i64 %t4378, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4391 = call i64 @rt_intern(ptr @.str.sym.24)
  %t4392 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4392)
  %t4393 = and i64 %t4392, -8
  %t4394 = inttoptr i64 %t4393 to ptr
  %t4395 = load i64, ptr %t4394
  %t4396 = inttoptr i64 %t4395 to ptr
  %t4397 = call fastcc i64%t4396(i64 %t4392, i64 4, i64 %t4391, i64 %t4384, i64 %t4390, i64 %t4378, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4398 = call i64 @rt_intern(ptr @.str.sym.24)
  %t4399 = or i64 %t4390, %t4384
  %t4400 = and i64 %t4399, 7
  %t4401 = icmp eq i64 %t4400, 0
  br i1 %t4401, label %fixfast1007, label %fixslow1008
fixfast1007:
  %t4402 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4390, i64 %t4384)
  %t4403 = extractvalue {i64, i1} %t4402, 0
  %t4404 = extractvalue {i64, i1} %t4402, 1
  br i1 %t4404, label %fixslow1008, label %fixmerge1009
fixslow1008:
  %t4405 = call i64 @rt_sub(i64 %t4390, i64 %t4384)
  br label %fixmerge1009
fixmerge1009:
  %t4406 = phi i64 [ %t4403, %fixfast1007 ], [ %t4405, %fixslow1008 ]
  %t4407 = or i64 %a1, %t4406
  %t4408 = and i64 %t4407, 7
  %t4409 = icmp eq i64 %t4408, 0
  br i1 %t4409, label %fixfast1010, label %fixslow1011
fixfast1010:
  %t4410 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t4406)
  %t4411 = extractvalue {i64, i1} %t4410, 0
  %t4412 = extractvalue {i64, i1} %t4410, 1
  br i1 %t4412, label %fixslow1011, label %fixmerge1012
fixslow1011:
  %t4413 = call i64 @rt_add(i64 %a1, i64 %t4406)
  br label %fixmerge1012
fixmerge1012:
  %t4414 = phi i64 [ %t4411, %fixfast1010 ], [ %t4413, %fixslow1011 ]
  %t4415 = call i64 @rt_vector_length(i64 %a0)
  %t4416 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4416)
  %t4417 = and i64 %t4416, -8
  %t4418 = inttoptr i64 %t4417 to ptr
  %t4419 = load i64, ptr %t4418
  %t4420 = inttoptr i64 %t4419 to ptr
  %t4421 = call fastcc i64%t4420(i64 %t4416, i64 4, i64 %t4398, i64 %a1, i64 %t4414, i64 %t4415, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4422 = or i64 %t4384, %a1
  %t4423 = and i64 %t4422, 7
  %t4424 = icmp eq i64 %t4423, 0
  br i1 %t4424, label %fixfast1013, label %fixslow1014
fixfast1013:
  %t4425 = icmp slt i64 %t4384, %a1
  %t4426 = select i1 %t4425, i64 257, i64 1
  br label %fixmerge1015
fixslow1014:
  %t4427 = call i64 @rt_lt(i64 %t4384, i64 %a1)
  br label %fixmerge1015
fixmerge1015:
  %t4428 = phi i64 [ %t4426, %fixfast1013 ], [ %t4427, %fixslow1014 ]
  %t4429 = icmp ne i64 %t4428, 1
  br i1 %t4429, label %then1016, label %else1017
then1016:
  %t4430 = call ptr @rt_alloc_words(i64 6)
  %t4431 = ptrtoint ptr %t4430 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_805" to i64), ptr %t4430
  %t4432 = or i64 %t4431, 4
  %t4433 = getelementptr i64, ptr %t4430, i64 1
  store i64 %a0, ptr %t4433
  %t4434 = getelementptr i64, ptr %t4430, i64 2
  store i64 %a1, ptr %t4434
  %t4435 = getelementptr i64, ptr %t4430, i64 3
  store i64 %a2, ptr %t4435
  %t4436 = getelementptr i64, ptr %t4430, i64 4
  store i64 %t4384, ptr %t4436
  %t4437 = getelementptr i64, ptr %t4430, i64 5
  store i64 %t4432, ptr %t4437
  %t4438 = or i64 %t4390, %t4384
  %t4439 = and i64 %t4438, 7
  %t4440 = icmp eq i64 %t4439, 0
  br i1 %t4440, label %fixfast1018, label %fixslow1019
fixfast1018:
  %t4441 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4390, i64 %t4384)
  %t4442 = extractvalue {i64, i1} %t4441, 0
  %t4443 = extractvalue {i64, i1} %t4441, 1
  br i1 %t4443, label %fixslow1019, label %fixmerge1020
fixslow1019:
  %t4444 = call i64 @rt_sub(i64 %t4390, i64 %t4384)
  br label %fixmerge1020
fixmerge1020:
  %t4445 = phi i64 [ %t4442, %fixfast1018 ], [ %t4444, %fixslow1019 ]
  %t4446 = or i64 %t4445, 8
  %t4447 = and i64 %t4446, 7
  %t4448 = icmp eq i64 %t4447, 0
  br i1 %t4448, label %fixfast1021, label %fixslow1022
fixfast1021:
  %t4449 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4445, i64 8)
  %t4450 = extractvalue {i64, i1} %t4449, 0
  %t4451 = extractvalue {i64, i1} %t4449, 1
  br i1 %t4451, label %fixslow1022, label %fixmerge1023
fixslow1022:
  %t4452 = call i64 @rt_sub(i64 %t4445, i64 8)
  br label %fixmerge1023
fixmerge1023:
  %t4453 = phi i64 [ %t4450, %fixfast1021 ], [ %t4452, %fixslow1022 ]
  %t4454 = musttail call fastcc i64 @"scheme.base:code_805"(i64 %t4432, i64 1, i64 %t4453, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4454
else1017:
  %t4455 = call ptr @rt_alloc_words(i64 7)
  %t4456 = ptrtoint ptr %t4455 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_807" to i64), ptr %t4455
  %t4457 = or i64 %t4456, 4
  %t4458 = getelementptr i64, ptr %t4455, i64 1
  store i64 %t4390, ptr %t4458
  %t4459 = getelementptr i64, ptr %t4455, i64 2
  store i64 %t4384, ptr %t4459
  %t4460 = getelementptr i64, ptr %t4455, i64 3
  store i64 %a0, ptr %t4460
  %t4461 = getelementptr i64, ptr %t4455, i64 4
  store i64 %a1, ptr %t4461
  %t4462 = getelementptr i64, ptr %t4455, i64 5
  store i64 %a2, ptr %t4462
  %t4463 = getelementptr i64, ptr %t4455, i64 6
  store i64 %t4457, ptr %t4463
  %t4464 = musttail call fastcc i64 @"scheme.base:code_807"(i64 %t4457, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4464
}

define fastcc i64 @"scheme.base:code_830"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4469 = icmp eq i64 %argc, 1
  br i1 %t4469, label %argok1025, label %arityerr1024
arityerr1024:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1025:
  %t4470 = and i64 %self, -8
  %t4471 = inttoptr i64 %t4470 to ptr
  %t4472 = getelementptr i64, ptr %t4471, i64 1
  %t4473 = load i64, ptr %t4472
  %t4474 = or i64 %a0, %t4473
  %t4475 = and i64 %t4474, 7
  %t4476 = icmp eq i64 %t4475, 0
  br i1 %t4476, label %fixfast1026, label %fixslow1027
fixfast1026:
  %t4477 = icmp eq i64 %a0, %t4473
  %t4478 = select i1 %t4477, i64 257, i64 1
  br label %fixmerge1028
fixslow1027:
  %t4479 = call i64 @rt_num_eq(i64 %a0, i64 %t4473)
  br label %fixmerge1028
fixmerge1028:
  %t4480 = phi i64 [ %t4478, %fixfast1026 ], [ %t4479, %fixslow1027 ]
  %t4481 = icmp ne i64 %t4480, 1
  br i1 %t4481, label %then1029, label %else1030
then1029:
  %t4482 = and i64 %self, -8
  %t4483 = inttoptr i64 %t4482 to ptr
  %t4484 = getelementptr i64, ptr %t4483, i64 2
  %t4485 = load i64, ptr %t4484
  ret i64 %t4485
else1030:
  %t4486 = and i64 %self, -8
  %t4487 = inttoptr i64 %t4486 to ptr
  %t4488 = getelementptr i64, ptr %t4487, i64 2
  %t4489 = load i64, ptr %t4488
  %t4490 = and i64 %self, -8
  %t4491 = inttoptr i64 %t4490 to ptr
  %t4492 = getelementptr i64, ptr %t4491, i64 4
  %t4493 = load i64, ptr %t4492
  %t4494 = call i64 @rt_vector_ref(i64 %t4493, i64 %a0)
  %t4495 = and i64 %self, -8
  %t4496 = inttoptr i64 %t4495 to ptr
  %t4497 = getelementptr i64, ptr %t4496, i64 3
  %t4498 = load i64, ptr %t4497
  call void @rt_check_callable(i64 %t4498)
  %t4499 = and i64 %t4498, -8
  %t4500 = inttoptr i64 %t4499 to ptr
  %t4501 = load i64, ptr %t4500
  %t4502 = inttoptr i64 %t4501 to ptr
  %t4503 = call fastcc i64%t4502(i64 %t4498, i64 1, i64 %t4494, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4504 = call i64 @rt_vector_set(i64 %t4489, i64 %a0, i64 %t4503)
  %t4505 = or i64 %a0, 8
  %t4506 = and i64 %t4505, 7
  %t4507 = icmp eq i64 %t4506, 0
  br i1 %t4507, label %fixfast1031, label %fixslow1032
fixfast1031:
  %t4508 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4509 = extractvalue {i64, i1} %t4508, 0
  %t4510 = extractvalue {i64, i1} %t4508, 1
  br i1 %t4510, label %fixslow1032, label %fixmerge1033
fixslow1032:
  %t4511 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1033
fixmerge1033:
  %t4512 = phi i64 [ %t4509, %fixfast1031 ], [ %t4511, %fixslow1032 ]
  %t4513 = musttail call fastcc i64 @"scheme.base:code_830"(i64 %self, i64 1, i64 %t4512, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4513
}

define fastcc i64 @"scheme.base:code_832"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4514 = icmp eq i64 %argc, 1
  br i1 %t4514, label %argok1035, label %arityerr1034
arityerr1034:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1035:
  %t4515 = and i64 %self, -8
  %t4516 = inttoptr i64 %t4515 to ptr
  %t4517 = getelementptr i64, ptr %t4516, i64 1
  %t4518 = load i64, ptr %t4517
  %t4519 = or i64 %a0, %t4518
  %t4520 = and i64 %t4519, 7
  %t4521 = icmp eq i64 %t4520, 0
  br i1 %t4521, label %fixfast1036, label %fixslow1037
fixfast1036:
  %t4522 = icmp eq i64 %a0, %t4518
  %t4523 = select i1 %t4522, i64 257, i64 1
  br label %fixmerge1038
fixslow1037:
  %t4524 = call i64 @rt_num_eq(i64 %a0, i64 %t4518)
  br label %fixmerge1038
fixmerge1038:
  %t4525 = phi i64 [ %t4523, %fixfast1036 ], [ %t4524, %fixslow1037 ]
  %t4526 = icmp ne i64 %t4525, 1
  br i1 %t4526, label %then1039, label %else1040
then1039:
  %t4527 = and i64 %self, -8
  %t4528 = inttoptr i64 %t4527 to ptr
  %t4529 = getelementptr i64, ptr %t4528, i64 2
  %t4530 = load i64, ptr %t4529
  ret i64 %t4530
else1040:
  %t4531 = and i64 %self, -8
  %t4532 = inttoptr i64 %t4531 to ptr
  %t4533 = getelementptr i64, ptr %t4532, i64 2
  %t4534 = load i64, ptr %t4533
  %t4535 = and i64 %self, -8
  %t4536 = inttoptr i64 %t4535 to ptr
  %t4537 = getelementptr i64, ptr %t4536, i64 4
  %t4538 = load i64, ptr %t4537
  %t4539 = load i64, ptr @"scheme.base:vec-nth"
  call void @rt_check_callable(i64 %t4539)
  %t4540 = and i64 %t4539, -8
  %t4541 = inttoptr i64 %t4540 to ptr
  %t4542 = load i64, ptr %t4541
  %t4543 = inttoptr i64 %t4542 to ptr
  %t4544 = call fastcc i64%t4543(i64 %t4539, i64 2, i64 %t4538, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4545 = and i64 %self, -8
  %t4546 = inttoptr i64 %t4545 to ptr
  %t4547 = getelementptr i64, ptr %t4546, i64 3
  %t4548 = load i64, ptr %t4547
  call void @rt_check_callable(i64 %t4548)
  %t4549 = and i64 %t4548, -8
  %t4550 = inttoptr i64 %t4549 to ptr
  %t4551 = load i64, ptr %t4550
  %t4552 = inttoptr i64 %t4551 to ptr
  %t4553 = call i64 @rt_list_length(i64 %t4544)
  %t4554 = add i64 0, %t4553
  %t4555 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t4544, i64 8)
  %t4567 = getelementptr i64, ptr %t4555, i64 0
  %t4559 = load i64, ptr %t4567
  %t4568 = getelementptr i64, ptr %t4555, i64 1
  %t4560 = load i64, ptr %t4568
  %t4569 = getelementptr i64, ptr %t4555, i64 2
  %t4561 = load i64, ptr %t4569
  %t4570 = getelementptr i64, ptr %t4555, i64 3
  %t4562 = load i64, ptr %t4570
  %t4571 = getelementptr i64, ptr %t4555, i64 4
  %t4563 = load i64, ptr %t4571
  %t4572 = getelementptr i64, ptr %t4555, i64 5
  %t4564 = load i64, ptr %t4572
  %t4573 = getelementptr i64, ptr %t4555, i64 6
  %t4565 = load i64, ptr %t4573
  %t4574 = getelementptr i64, ptr %t4555, i64 7
  %t4566 = load i64, ptr %t4574
  %t4556 = icmp sgt i64 %t4554, 8
  %t4557 = getelementptr i64, ptr %t4555, i64 8
  %t4558 = select i1 %t4556, ptr %t4557, ptr null
  %t4575 = call fastcc i64%t4552(i64 %t4548, i64 %t4554, i64 %t4559, i64 %t4560, i64 %t4561, i64 %t4562, i64 %t4563, i64 %t4564, i64 %t4565, i64 %t4566, ptr %t4558)
  %t4576 = call i64 @rt_vector_set(i64 %t4534, i64 %a0, i64 %t4575)
  %t4577 = or i64 %a0, 8
  %t4578 = and i64 %t4577, 7
  %t4579 = icmp eq i64 %t4578, 0
  br i1 %t4579, label %fixfast1041, label %fixslow1042
fixfast1041:
  %t4580 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4581 = extractvalue {i64, i1} %t4580, 0
  %t4582 = extractvalue {i64, i1} %t4580, 1
  br i1 %t4582, label %fixslow1042, label %fixmerge1043
fixslow1042:
  %t4583 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1043
fixmerge1043:
  %t4584 = phi i64 [ %t4581, %fixfast1041 ], [ %t4583, %fixslow1042 ]
  %t4585 = musttail call fastcc i64 @"scheme.base:code_832"(i64 %self, i64 1, i64 %t4584, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4585
}

define fastcc i64 @"scheme.base:code:vector-map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4586 = icmp sge i64 %argc, 2
  br i1 %t4586, label %argok1045, label %arityerr1044
arityerr1044:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1045:
  %t4587 = call ptr @rt_alloc_words(i64 8)
  %t4588 = getelementptr i64, ptr %t4587, i64 0
  store i64 %a0, ptr %t4588
  %t4589 = getelementptr i64, ptr %t4587, i64 1
  store i64 %a1, ptr %t4589
  %t4590 = getelementptr i64, ptr %t4587, i64 2
  store i64 %a2, ptr %t4590
  %t4591 = getelementptr i64, ptr %t4587, i64 3
  store i64 %a3, ptr %t4591
  %t4592 = getelementptr i64, ptr %t4587, i64 4
  store i64 %a4, ptr %t4592
  %t4593 = getelementptr i64, ptr %t4587, i64 5
  store i64 %a5, ptr %t4593
  %t4594 = getelementptr i64, ptr %t4587, i64 6
  store i64 %a6, ptr %t4594
  %t4595 = getelementptr i64, ptr %t4587, i64 7
  store i64 %a7, ptr %t4595
  %t4596 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t4587, ptr %overflow)
  %t4597 = call i64 @rt_null_p(i64 %t4596)
  %t4598 = icmp ne i64 %t4597, 1
  br i1 %t4598, label %then1046, label %else1047
then1046:
  %t4599 = call i64 @rt_vector_length(i64 %a1)
  %t4600 = call i64 @rt_make_vector(i64 %t4599, i64 0)
  %t4601 = call ptr @rt_alloc_words(i64 6)
  %t4602 = ptrtoint ptr %t4601 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_830" to i64), ptr %t4601
  %t4603 = or i64 %t4602, 4
  %t4604 = getelementptr i64, ptr %t4601, i64 1
  store i64 %t4599, ptr %t4604
  %t4605 = getelementptr i64, ptr %t4601, i64 2
  store i64 %t4600, ptr %t4605
  %t4606 = getelementptr i64, ptr %t4601, i64 3
  store i64 %a0, ptr %t4606
  %t4607 = getelementptr i64, ptr %t4601, i64 4
  store i64 %a1, ptr %t4607
  %t4608 = getelementptr i64, ptr %t4601, i64 5
  store i64 %t4603, ptr %t4608
  %t4609 = musttail call fastcc i64 @"scheme.base:code_830"(i64 %t4603, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4609
else1047:
  %t4610 = call i64 @rt_cons(i64 %a1, i64 %t4596)
  %t4611 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t4611)
  %t4612 = and i64 %t4611, -8
  %t4613 = inttoptr i64 %t4612 to ptr
  %t4614 = load i64, ptr %t4613
  %t4615 = inttoptr i64 %t4614 to ptr
  %t4616 = call fastcc i64%t4615(i64 %t4611, i64 1, i64 %t4610, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4617 = call i64 @rt_make_vector(i64 %t4616, i64 0)
  %t4618 = call ptr @rt_alloc_words(i64 6)
  %t4619 = ptrtoint ptr %t4618 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_832" to i64), ptr %t4618
  %t4620 = or i64 %t4619, 4
  %t4621 = getelementptr i64, ptr %t4618, i64 1
  store i64 %t4616, ptr %t4621
  %t4622 = getelementptr i64, ptr %t4618, i64 2
  store i64 %t4617, ptr %t4622
  %t4623 = getelementptr i64, ptr %t4618, i64 3
  store i64 %a0, ptr %t4623
  %t4624 = getelementptr i64, ptr %t4618, i64 4
  store i64 %t4610, ptr %t4624
  %t4625 = getelementptr i64, ptr %t4618, i64 5
  store i64 %t4620, ptr %t4625
  %t4626 = musttail call fastcc i64 @"scheme.base:code_832"(i64 %t4620, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4626
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector-map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4627 = call i64 @rt_null_p(i64 2)
  %t4628 = icmp ne i64 %t4627, 1
  br i1 %t4628, label %then1048, label %else1049
then1048:
  %t4629 = call i64 @rt_vector_length(i64 %a1)
  %t4630 = call i64 @rt_make_vector(i64 %t4629, i64 0)
  %t4631 = call ptr @rt_alloc_words(i64 6)
  %t4632 = ptrtoint ptr %t4631 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_830" to i64), ptr %t4631
  %t4633 = or i64 %t4632, 4
  %t4634 = getelementptr i64, ptr %t4631, i64 1
  store i64 %t4629, ptr %t4634
  %t4635 = getelementptr i64, ptr %t4631, i64 2
  store i64 %t4630, ptr %t4635
  %t4636 = getelementptr i64, ptr %t4631, i64 3
  store i64 %a0, ptr %t4636
  %t4637 = getelementptr i64, ptr %t4631, i64 4
  store i64 %a1, ptr %t4637
  %t4638 = getelementptr i64, ptr %t4631, i64 5
  store i64 %t4633, ptr %t4638
  %t4639 = musttail call fastcc i64 @"scheme.base:code_830"(i64 %t4633, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4639
else1049:
  %t4640 = call i64 @rt_cons(i64 %a1, i64 2)
  %t4641 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t4641)
  %t4642 = and i64 %t4641, -8
  %t4643 = inttoptr i64 %t4642 to ptr
  %t4644 = load i64, ptr %t4643
  %t4645 = inttoptr i64 %t4644 to ptr
  %t4646 = call fastcc i64%t4645(i64 %t4641, i64 1, i64 %t4640, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4647 = call i64 @rt_make_vector(i64 %t4646, i64 0)
  %t4648 = call ptr @rt_alloc_words(i64 6)
  %t4649 = ptrtoint ptr %t4648 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_832" to i64), ptr %t4648
  %t4650 = or i64 %t4649, 4
  %t4651 = getelementptr i64, ptr %t4648, i64 1
  store i64 %t4646, ptr %t4651
  %t4652 = getelementptr i64, ptr %t4648, i64 2
  store i64 %t4647, ptr %t4652
  %t4653 = getelementptr i64, ptr %t4648, i64 3
  store i64 %a0, ptr %t4653
  %t4654 = getelementptr i64, ptr %t4648, i64 4
  store i64 %t4640, ptr %t4654
  %t4655 = getelementptr i64, ptr %t4648, i64 5
  store i64 %t4650, ptr %t4655
  %t4656 = musttail call fastcc i64 @"scheme.base:code_832"(i64 %t4650, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4656
}

define fastcc i64 @"scheme.base:code_853"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4661 = icmp eq i64 %argc, 1
  br i1 %t4661, label %argok1051, label %arityerr1050
arityerr1050:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1051:
  %t4662 = and i64 %self, -8
  %t4663 = inttoptr i64 %t4662 to ptr
  %t4664 = getelementptr i64, ptr %t4663, i64 1
  %t4665 = load i64, ptr %t4664
  %t4666 = or i64 %a0, %t4665
  %t4667 = and i64 %t4666, 7
  %t4668 = icmp eq i64 %t4667, 0
  br i1 %t4668, label %fixfast1052, label %fixslow1053
fixfast1052:
  %t4669 = icmp eq i64 %a0, %t4665
  %t4670 = select i1 %t4669, i64 257, i64 1
  br label %fixmerge1054
fixslow1053:
  %t4671 = call i64 @rt_num_eq(i64 %a0, i64 %t4665)
  br label %fixmerge1054
fixmerge1054:
  %t4672 = phi i64 [ %t4670, %fixfast1052 ], [ %t4671, %fixslow1053 ]
  %t4673 = icmp ne i64 %t4672, 1
  br i1 %t4673, label %then1055, label %else1056
then1055:
  %t4674 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4674)
  %t4675 = and i64 %t4674, -8
  %t4676 = inttoptr i64 %t4675 to ptr
  %t4677 = load i64, ptr %t4676
  %t4678 = inttoptr i64 %t4677 to ptr
  %t4679 = musttail call fastcc i64 %t4678(i64 %t4674, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4679
else1056:
  %t4680 = and i64 %self, -8
  %t4681 = inttoptr i64 %t4680 to ptr
  %t4682 = getelementptr i64, ptr %t4681, i64 3
  %t4683 = load i64, ptr %t4682
  %t4684 = call i64 @rt_vector_ref(i64 %t4683, i64 %a0)
  %t4685 = and i64 %self, -8
  %t4686 = inttoptr i64 %t4685 to ptr
  %t4687 = getelementptr i64, ptr %t4686, i64 2
  %t4688 = load i64, ptr %t4687
  call void @rt_check_callable(i64 %t4688)
  %t4689 = and i64 %t4688, -8
  %t4690 = inttoptr i64 %t4689 to ptr
  %t4691 = load i64, ptr %t4690
  %t4692 = inttoptr i64 %t4691 to ptr
  %t4693 = call fastcc i64%t4692(i64 %t4688, i64 1, i64 %t4684, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4694 = or i64 %a0, 8
  %t4695 = and i64 %t4694, 7
  %t4696 = icmp eq i64 %t4695, 0
  br i1 %t4696, label %fixfast1057, label %fixslow1058
fixfast1057:
  %t4697 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4698 = extractvalue {i64, i1} %t4697, 0
  %t4699 = extractvalue {i64, i1} %t4697, 1
  br i1 %t4699, label %fixslow1058, label %fixmerge1059
fixslow1058:
  %t4700 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1059
fixmerge1059:
  %t4701 = phi i64 [ %t4698, %fixfast1057 ], [ %t4700, %fixslow1058 ]
  %t4702 = musttail call fastcc i64 @"scheme.base:code_853"(i64 %self, i64 1, i64 %t4701, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4702
}

define fastcc i64 @"scheme.base:code_855"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4703 = icmp eq i64 %argc, 1
  br i1 %t4703, label %argok1061, label %arityerr1060
arityerr1060:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1061:
  %t4704 = and i64 %self, -8
  %t4705 = inttoptr i64 %t4704 to ptr
  %t4706 = getelementptr i64, ptr %t4705, i64 1
  %t4707 = load i64, ptr %t4706
  %t4708 = or i64 %a0, %t4707
  %t4709 = and i64 %t4708, 7
  %t4710 = icmp eq i64 %t4709, 0
  br i1 %t4710, label %fixfast1062, label %fixslow1063
fixfast1062:
  %t4711 = icmp eq i64 %a0, %t4707
  %t4712 = select i1 %t4711, i64 257, i64 1
  br label %fixmerge1064
fixslow1063:
  %t4713 = call i64 @rt_num_eq(i64 %a0, i64 %t4707)
  br label %fixmerge1064
fixmerge1064:
  %t4714 = phi i64 [ %t4712, %fixfast1062 ], [ %t4713, %fixslow1063 ]
  %t4715 = icmp ne i64 %t4714, 1
  br i1 %t4715, label %then1065, label %else1066
then1065:
  %t4716 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4716)
  %t4717 = and i64 %t4716, -8
  %t4718 = inttoptr i64 %t4717 to ptr
  %t4719 = load i64, ptr %t4718
  %t4720 = inttoptr i64 %t4719 to ptr
  %t4721 = musttail call fastcc i64 %t4720(i64 %t4716, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4721
else1066:
  %t4722 = and i64 %self, -8
  %t4723 = inttoptr i64 %t4722 to ptr
  %t4724 = getelementptr i64, ptr %t4723, i64 3
  %t4725 = load i64, ptr %t4724
  %t4726 = load i64, ptr @"scheme.base:vec-nth"
  call void @rt_check_callable(i64 %t4726)
  %t4727 = and i64 %t4726, -8
  %t4728 = inttoptr i64 %t4727 to ptr
  %t4729 = load i64, ptr %t4728
  %t4730 = inttoptr i64 %t4729 to ptr
  %t4731 = call fastcc i64%t4730(i64 %t4726, i64 2, i64 %t4725, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4732 = and i64 %self, -8
  %t4733 = inttoptr i64 %t4732 to ptr
  %t4734 = getelementptr i64, ptr %t4733, i64 2
  %t4735 = load i64, ptr %t4734
  call void @rt_check_callable(i64 %t4735)
  %t4736 = and i64 %t4735, -8
  %t4737 = inttoptr i64 %t4736 to ptr
  %t4738 = load i64, ptr %t4737
  %t4739 = inttoptr i64 %t4738 to ptr
  %t4740 = call i64 @rt_list_length(i64 %t4731)
  %t4741 = add i64 0, %t4740
  %t4742 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t4731, i64 8)
  %t4754 = getelementptr i64, ptr %t4742, i64 0
  %t4746 = load i64, ptr %t4754
  %t4755 = getelementptr i64, ptr %t4742, i64 1
  %t4747 = load i64, ptr %t4755
  %t4756 = getelementptr i64, ptr %t4742, i64 2
  %t4748 = load i64, ptr %t4756
  %t4757 = getelementptr i64, ptr %t4742, i64 3
  %t4749 = load i64, ptr %t4757
  %t4758 = getelementptr i64, ptr %t4742, i64 4
  %t4750 = load i64, ptr %t4758
  %t4759 = getelementptr i64, ptr %t4742, i64 5
  %t4751 = load i64, ptr %t4759
  %t4760 = getelementptr i64, ptr %t4742, i64 6
  %t4752 = load i64, ptr %t4760
  %t4761 = getelementptr i64, ptr %t4742, i64 7
  %t4753 = load i64, ptr %t4761
  %t4743 = icmp sgt i64 %t4741, 8
  %t4744 = getelementptr i64, ptr %t4742, i64 8
  %t4745 = select i1 %t4743, ptr %t4744, ptr null
  %t4762 = call fastcc i64%t4739(i64 %t4735, i64 %t4741, i64 %t4746, i64 %t4747, i64 %t4748, i64 %t4749, i64 %t4750, i64 %t4751, i64 %t4752, i64 %t4753, ptr %t4745)
  %t4763 = or i64 %a0, 8
  %t4764 = and i64 %t4763, 7
  %t4765 = icmp eq i64 %t4764, 0
  br i1 %t4765, label %fixfast1067, label %fixslow1068
fixfast1067:
  %t4766 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4767 = extractvalue {i64, i1} %t4766, 0
  %t4768 = extractvalue {i64, i1} %t4766, 1
  br i1 %t4768, label %fixslow1068, label %fixmerge1069
fixslow1068:
  %t4769 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1069
fixmerge1069:
  %t4770 = phi i64 [ %t4767, %fixfast1067 ], [ %t4769, %fixslow1068 ]
  %t4771 = musttail call fastcc i64 @"scheme.base:code_855"(i64 %self, i64 1, i64 %t4770, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4771
}

define fastcc i64 @"scheme.base:code:vector-for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4772 = icmp sge i64 %argc, 2
  br i1 %t4772, label %argok1071, label %arityerr1070
arityerr1070:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1071:
  %t4773 = call ptr @rt_alloc_words(i64 8)
  %t4774 = getelementptr i64, ptr %t4773, i64 0
  store i64 %a0, ptr %t4774
  %t4775 = getelementptr i64, ptr %t4773, i64 1
  store i64 %a1, ptr %t4775
  %t4776 = getelementptr i64, ptr %t4773, i64 2
  store i64 %a2, ptr %t4776
  %t4777 = getelementptr i64, ptr %t4773, i64 3
  store i64 %a3, ptr %t4777
  %t4778 = getelementptr i64, ptr %t4773, i64 4
  store i64 %a4, ptr %t4778
  %t4779 = getelementptr i64, ptr %t4773, i64 5
  store i64 %a5, ptr %t4779
  %t4780 = getelementptr i64, ptr %t4773, i64 6
  store i64 %a6, ptr %t4780
  %t4781 = getelementptr i64, ptr %t4773, i64 7
  store i64 %a7, ptr %t4781
  %t4782 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t4773, ptr %overflow)
  %t4783 = call i64 @rt_null_p(i64 %t4782)
  %t4784 = icmp ne i64 %t4783, 1
  br i1 %t4784, label %then1072, label %else1073
then1072:
  %t4785 = call i64 @rt_vector_length(i64 %a1)
  %t4786 = call ptr @rt_alloc_words(i64 5)
  %t4787 = ptrtoint ptr %t4786 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_853" to i64), ptr %t4786
  %t4788 = or i64 %t4787, 4
  %t4789 = getelementptr i64, ptr %t4786, i64 1
  store i64 %t4785, ptr %t4789
  %t4790 = getelementptr i64, ptr %t4786, i64 2
  store i64 %a0, ptr %t4790
  %t4791 = getelementptr i64, ptr %t4786, i64 3
  store i64 %a1, ptr %t4791
  %t4792 = getelementptr i64, ptr %t4786, i64 4
  store i64 %t4788, ptr %t4792
  %t4793 = musttail call fastcc i64 @"scheme.base:code_853"(i64 %t4788, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4793
else1073:
  %t4794 = call i64 @rt_cons(i64 %a1, i64 %t4782)
  %t4795 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t4795)
  %t4796 = and i64 %t4795, -8
  %t4797 = inttoptr i64 %t4796 to ptr
  %t4798 = load i64, ptr %t4797
  %t4799 = inttoptr i64 %t4798 to ptr
  %t4800 = call fastcc i64%t4799(i64 %t4795, i64 1, i64 %t4794, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4801 = call ptr @rt_alloc_words(i64 5)
  %t4802 = ptrtoint ptr %t4801 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_855" to i64), ptr %t4801
  %t4803 = or i64 %t4802, 4
  %t4804 = getelementptr i64, ptr %t4801, i64 1
  store i64 %t4800, ptr %t4804
  %t4805 = getelementptr i64, ptr %t4801, i64 2
  store i64 %a0, ptr %t4805
  %t4806 = getelementptr i64, ptr %t4801, i64 3
  store i64 %t4794, ptr %t4806
  %t4807 = getelementptr i64, ptr %t4801, i64 4
  store i64 %t4803, ptr %t4807
  %t4808 = musttail call fastcc i64 @"scheme.base:code_855"(i64 %t4803, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4808
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector-for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4809 = call i64 @rt_null_p(i64 2)
  %t4810 = icmp ne i64 %t4809, 1
  br i1 %t4810, label %then1074, label %else1075
then1074:
  %t4811 = call i64 @rt_vector_length(i64 %a1)
  %t4812 = call ptr @rt_alloc_words(i64 5)
  %t4813 = ptrtoint ptr %t4812 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_853" to i64), ptr %t4812
  %t4814 = or i64 %t4813, 4
  %t4815 = getelementptr i64, ptr %t4812, i64 1
  store i64 %t4811, ptr %t4815
  %t4816 = getelementptr i64, ptr %t4812, i64 2
  store i64 %a0, ptr %t4816
  %t4817 = getelementptr i64, ptr %t4812, i64 3
  store i64 %a1, ptr %t4817
  %t4818 = getelementptr i64, ptr %t4812, i64 4
  store i64 %t4814, ptr %t4818
  %t4819 = musttail call fastcc i64 @"scheme.base:code_853"(i64 %t4814, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4819
else1075:
  %t4820 = call i64 @rt_cons(i64 %a1, i64 2)
  %t4821 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t4821)
  %t4822 = and i64 %t4821, -8
  %t4823 = inttoptr i64 %t4822 to ptr
  %t4824 = load i64, ptr %t4823
  %t4825 = inttoptr i64 %t4824 to ptr
  %t4826 = call fastcc i64%t4825(i64 %t4821, i64 1, i64 %t4820, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4827 = call ptr @rt_alloc_words(i64 5)
  %t4828 = ptrtoint ptr %t4827 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_855" to i64), ptr %t4827
  %t4829 = or i64 %t4828, 4
  %t4830 = getelementptr i64, ptr %t4827, i64 1
  store i64 %t4826, ptr %t4830
  %t4831 = getelementptr i64, ptr %t4827, i64 2
  store i64 %a0, ptr %t4831
  %t4832 = getelementptr i64, ptr %t4827, i64 3
  store i64 %t4820, ptr %t4832
  %t4833 = getelementptr i64, ptr %t4827, i64 4
  store i64 %t4829, ptr %t4833
  %t4834 = musttail call fastcc i64 @"scheme.base:code_855"(i64 %t4829, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4834
}

define fastcc i64 @"scheme.base:code:vec-min-len"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4839 = icmp eq i64 %argc, 1
  br i1 %t4839, label %argok1077, label %arityerr1076
arityerr1076:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1077:
  %t4840 = call i64 @rt_cdr(i64 %a0)
  %t4841 = call i64 @rt_null_p(i64 %t4840)
  %t4842 = icmp ne i64 %t4841, 1
  br i1 %t4842, label %then1078, label %else1079
then1078:
  %t4843 = call i64 @rt_car(i64 %a0)
  %t4844 = call i64 @rt_vector_length(i64 %t4843)
  ret i64 %t4844
else1079:
  %t4845 = call i64 @rt_car(i64 %a0)
  %t4846 = call i64 @rt_vector_length(i64 %t4845)
  %t4847 = call i64 @rt_cdr(i64 %a0)
  %t4848 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t4848)
  %t4849 = and i64 %t4848, -8
  %t4850 = inttoptr i64 %t4849 to ptr
  %t4851 = load i64, ptr %t4850
  %t4852 = inttoptr i64 %t4851 to ptr
  %t4853 = call fastcc i64%t4852(i64 %t4848, i64 1, i64 %t4847, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4854 = or i64 %t4846, %t4853
  %t4855 = and i64 %t4854, 7
  %t4856 = icmp eq i64 %t4855, 0
  br i1 %t4856, label %fixfast1080, label %fixslow1081
fixfast1080:
  %t4857 = icmp slt i64 %t4846, %t4853
  %t4858 = select i1 %t4857, i64 257, i64 1
  br label %fixmerge1082
fixslow1081:
  %t4859 = call i64 @rt_lt(i64 %t4846, i64 %t4853)
  br label %fixmerge1082
fixmerge1082:
  %t4860 = phi i64 [ %t4858, %fixfast1080 ], [ %t4859, %fixslow1081 ]
  %t4861 = icmp ne i64 %t4860, 1
  br i1 %t4861, label %then1083, label %else1084
then1083:
  ret i64 %t4846
else1084:
  ret i64 %t4853
}

define fastcc i64 @"scheme.base:code:vec-nth"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4866 = icmp eq i64 %argc, 2
  br i1 %t4866, label %argok1086, label %arityerr1085
arityerr1085:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1086:
  %t4867 = call i64 @rt_null_p(i64 %a0)
  %t4868 = icmp ne i64 %t4867, 1
  br i1 %t4868, label %then1087, label %else1088
then1087:
  ret i64 2
else1088:
  %t4869 = call i64 @rt_car(i64 %a0)
  %t4870 = call i64 @rt_vector_ref(i64 %t4869, i64 %a1)
  %t4871 = call i64 @rt_cdr(i64 %a0)
  %t4872 = load i64, ptr @"scheme.base:vec-nth"
  call void @rt_check_callable(i64 %t4872)
  %t4873 = and i64 %t4872, -8
  %t4874 = inttoptr i64 %t4873 to ptr
  %t4875 = load i64, ptr %t4874
  %t4876 = inttoptr i64 %t4875 to ptr
  %t4877 = call fastcc i64%t4876(i64 %t4872, i64 2, i64 %t4871, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4878 = call i64 @rt_cons(i64 %t4870, i64 %t4877)
  ret i64 %t4878
}

define fastcc i64 @"scheme.base:code_881"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4883 = icmp eq i64 %argc, 1
  br i1 %t4883, label %argok1090, label %arityerr1089
arityerr1089:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1090:
  %t4884 = and i64 %self, -8
  %t4885 = inttoptr i64 %t4884 to ptr
  %t4886 = getelementptr i64, ptr %t4885, i64 1
  %t4887 = load i64, ptr %t4886
  %t4888 = or i64 %a0, %t4887
  %t4889 = and i64 %t4888, 7
  %t4890 = icmp eq i64 %t4889, 0
  br i1 %t4890, label %fixfast1091, label %fixslow1092
fixfast1091:
  %t4891 = icmp eq i64 %a0, %t4887
  %t4892 = select i1 %t4891, i64 257, i64 1
  br label %fixmerge1093
fixslow1092:
  %t4893 = call i64 @rt_num_eq(i64 %a0, i64 %t4887)
  br label %fixmerge1093
fixmerge1093:
  %t4894 = phi i64 [ %t4892, %fixfast1091 ], [ %t4893, %fixslow1092 ]
  %t4895 = icmp ne i64 %t4894, 1
  br i1 %t4895, label %then1094, label %else1095
then1094:
  %t4896 = and i64 %self, -8
  %t4897 = inttoptr i64 %t4896 to ptr
  %t4898 = getelementptr i64, ptr %t4897, i64 2
  %t4899 = load i64, ptr %t4898
  ret i64 %t4899
else1095:
  %t4900 = and i64 %self, -8
  %t4901 = inttoptr i64 %t4900 to ptr
  %t4902 = getelementptr i64, ptr %t4901, i64 2
  %t4903 = load i64, ptr %t4902
  %t4904 = and i64 %self, -8
  %t4905 = inttoptr i64 %t4904 to ptr
  %t4906 = getelementptr i64, ptr %t4905, i64 3
  %t4907 = load i64, ptr %t4906
  %t4908 = or i64 %a0, %t4907
  %t4909 = and i64 %t4908, 7
  %t4910 = icmp eq i64 %t4909, 0
  br i1 %t4910, label %fixfast1096, label %fixslow1097
fixfast1096:
  %t4911 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t4907)
  %t4912 = extractvalue {i64, i1} %t4911, 0
  %t4913 = extractvalue {i64, i1} %t4911, 1
  br i1 %t4913, label %fixslow1097, label %fixmerge1098
fixslow1097:
  %t4914 = call i64 @rt_sub(i64 %a0, i64 %t4907)
  br label %fixmerge1098
fixmerge1098:
  %t4915 = phi i64 [ %t4912, %fixfast1096 ], [ %t4914, %fixslow1097 ]
  %t4916 = and i64 %self, -8
  %t4917 = inttoptr i64 %t4916 to ptr
  %t4918 = getelementptr i64, ptr %t4917, i64 4
  %t4919 = load i64, ptr %t4918
  %t4920 = call i64 @rt_string_ref(i64 %t4919, i64 %a0)
  %t4921 = call i64 @rt_vector_set(i64 %t4903, i64 %t4915, i64 %t4920)
  %t4922 = or i64 %a0, 8
  %t4923 = and i64 %t4922, 7
  %t4924 = icmp eq i64 %t4923, 0
  br i1 %t4924, label %fixfast1099, label %fixslow1100
fixfast1099:
  %t4925 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4926 = extractvalue {i64, i1} %t4925, 0
  %t4927 = extractvalue {i64, i1} %t4925, 1
  br i1 %t4927, label %fixslow1100, label %fixmerge1101
fixslow1100:
  %t4928 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1101
fixmerge1101:
  %t4929 = phi i64 [ %t4926, %fixfast1099 ], [ %t4928, %fixslow1100 ]
  %t4930 = musttail call fastcc i64 @"scheme.base:code_881"(i64 %self, i64 1, i64 %t4929, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4930
}

define fastcc i64 @"scheme.base:code:string->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4931 = icmp sge i64 %argc, 1
  br i1 %t4931, label %argok1103, label %arityerr1102
arityerr1102:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1103:
  %t4932 = call ptr @rt_alloc_words(i64 8)
  %t4933 = getelementptr i64, ptr %t4932, i64 0
  store i64 %a0, ptr %t4933
  %t4934 = getelementptr i64, ptr %t4932, i64 1
  store i64 %a1, ptr %t4934
  %t4935 = getelementptr i64, ptr %t4932, i64 2
  store i64 %a2, ptr %t4935
  %t4936 = getelementptr i64, ptr %t4932, i64 3
  store i64 %a3, ptr %t4936
  %t4937 = getelementptr i64, ptr %t4932, i64 4
  store i64 %a4, ptr %t4937
  %t4938 = getelementptr i64, ptr %t4932, i64 5
  store i64 %a5, ptr %t4938
  %t4939 = getelementptr i64, ptr %t4932, i64 6
  store i64 %a6, ptr %t4939
  %t4940 = getelementptr i64, ptr %t4932, i64 7
  store i64 %a7, ptr %t4940
  %t4941 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t4932, ptr %overflow)
  %t4942 = call i64 @rt_string_length(i64 %a0)
  %t4943 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4943)
  %t4944 = and i64 %t4943, -8
  %t4945 = inttoptr i64 %t4944 to ptr
  %t4946 = load i64, ptr %t4945
  %t4947 = inttoptr i64 %t4946 to ptr
  %t4948 = call fastcc i64%t4947(i64 %t4943, i64 1, i64 %t4941, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4949 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4949)
  %t4950 = and i64 %t4949, -8
  %t4951 = inttoptr i64 %t4950 to ptr
  %t4952 = load i64, ptr %t4951
  %t4953 = inttoptr i64 %t4952 to ptr
  %t4954 = call fastcc i64%t4953(i64 %t4949, i64 2, i64 %t4941, i64 %t4942, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4955 = call i64 @rt_intern(ptr @.str.sym.25)
  %t4956 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4956)
  %t4957 = and i64 %t4956, -8
  %t4958 = inttoptr i64 %t4957 to ptr
  %t4959 = load i64, ptr %t4958
  %t4960 = inttoptr i64 %t4959 to ptr
  %t4961 = call fastcc i64%t4960(i64 %t4956, i64 4, i64 %t4955, i64 %t4948, i64 %t4954, i64 %t4942, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4962 = or i64 %t4954, %t4948
  %t4963 = and i64 %t4962, 7
  %t4964 = icmp eq i64 %t4963, 0
  br i1 %t4964, label %fixfast1104, label %fixslow1105
fixfast1104:
  %t4965 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4954, i64 %t4948)
  %t4966 = extractvalue {i64, i1} %t4965, 0
  %t4967 = extractvalue {i64, i1} %t4965, 1
  br i1 %t4967, label %fixslow1105, label %fixmerge1106
fixslow1105:
  %t4968 = call i64 @rt_sub(i64 %t4954, i64 %t4948)
  br label %fixmerge1106
fixmerge1106:
  %t4969 = phi i64 [ %t4966, %fixfast1104 ], [ %t4968, %fixslow1105 ]
  %t4970 = call i64 @rt_make_vector(i64 %t4969, i64 0)
  %t4971 = call ptr @rt_alloc_words(i64 6)
  %t4972 = ptrtoint ptr %t4971 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_881" to i64), ptr %t4971
  %t4973 = or i64 %t4972, 4
  %t4974 = getelementptr i64, ptr %t4971, i64 1
  store i64 %t4954, ptr %t4974
  %t4975 = getelementptr i64, ptr %t4971, i64 2
  store i64 %t4970, ptr %t4975
  %t4976 = getelementptr i64, ptr %t4971, i64 3
  store i64 %t4948, ptr %t4976
  %t4977 = getelementptr i64, ptr %t4971, i64 4
  store i64 %a0, ptr %t4977
  %t4978 = getelementptr i64, ptr %t4971, i64 5
  store i64 %t4973, ptr %t4978
  %t4979 = musttail call fastcc i64 @"scheme.base:code_881"(i64 %t4973, i64 1, i64 %t4948, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4979
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4980 = call i64 @rt_string_length(i64 %a0)
  %t4981 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4981)
  %t4982 = and i64 %t4981, -8
  %t4983 = inttoptr i64 %t4982 to ptr
  %t4984 = load i64, ptr %t4983
  %t4985 = inttoptr i64 %t4984 to ptr
  %t4986 = call fastcc i64%t4985(i64 %t4981, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4987 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4987)
  %t4988 = and i64 %t4987, -8
  %t4989 = inttoptr i64 %t4988 to ptr
  %t4990 = load i64, ptr %t4989
  %t4991 = inttoptr i64 %t4990 to ptr
  %t4992 = call fastcc i64%t4991(i64 %t4987, i64 2, i64 2, i64 %t4980, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4993 = call i64 @rt_intern(ptr @.str.sym.25)
  %t4994 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4994)
  %t4995 = and i64 %t4994, -8
  %t4996 = inttoptr i64 %t4995 to ptr
  %t4997 = load i64, ptr %t4996
  %t4998 = inttoptr i64 %t4997 to ptr
  %t4999 = call fastcc i64%t4998(i64 %t4994, i64 4, i64 %t4993, i64 %t4986, i64 %t4992, i64 %t4980, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5000 = or i64 %t4992, %t4986
  %t5001 = and i64 %t5000, 7
  %t5002 = icmp eq i64 %t5001, 0
  br i1 %t5002, label %fixfast1107, label %fixslow1108
fixfast1107:
  %t5003 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4992, i64 %t4986)
  %t5004 = extractvalue {i64, i1} %t5003, 0
  %t5005 = extractvalue {i64, i1} %t5003, 1
  br i1 %t5005, label %fixslow1108, label %fixmerge1109
fixslow1108:
  %t5006 = call i64 @rt_sub(i64 %t4992, i64 %t4986)
  br label %fixmerge1109
fixmerge1109:
  %t5007 = phi i64 [ %t5004, %fixfast1107 ], [ %t5006, %fixslow1108 ]
  %t5008 = call i64 @rt_make_vector(i64 %t5007, i64 0)
  %t5009 = call ptr @rt_alloc_words(i64 6)
  %t5010 = ptrtoint ptr %t5009 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_881" to i64), ptr %t5009
  %t5011 = or i64 %t5010, 4
  %t5012 = getelementptr i64, ptr %t5009, i64 1
  store i64 %t4992, ptr %t5012
  %t5013 = getelementptr i64, ptr %t5009, i64 2
  store i64 %t5008, ptr %t5013
  %t5014 = getelementptr i64, ptr %t5009, i64 3
  store i64 %t4986, ptr %t5014
  %t5015 = getelementptr i64, ptr %t5009, i64 4
  store i64 %a0, ptr %t5015
  %t5016 = getelementptr i64, ptr %t5009, i64 5
  store i64 %t5011, ptr %t5016
  %t5017 = musttail call fastcc i64 @"scheme.base:code_881"(i64 %t5011, i64 1, i64 %t4986, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5017
}

define fastcc i64 @"scheme.base:code:vector->string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5022 = icmp sge i64 %argc, 1
  br i1 %t5022, label %argok1111, label %arityerr1110
arityerr1110:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1111:
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
  %t5032 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t5023, ptr %overflow)
  %t5033 = call i64 @rt_vector_length(i64 %a0)
  %t5034 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5034)
  %t5035 = and i64 %t5034, -8
  %t5036 = inttoptr i64 %t5035 to ptr
  %t5037 = load i64, ptr %t5036
  %t5038 = inttoptr i64 %t5037 to ptr
  %t5039 = call fastcc i64%t5038(i64 %t5034, i64 1, i64 %t5032, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5040 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5040)
  %t5041 = and i64 %t5040, -8
  %t5042 = inttoptr i64 %t5041 to ptr
  %t5043 = load i64, ptr %t5042
  %t5044 = inttoptr i64 %t5043 to ptr
  %t5045 = call fastcc i64%t5044(i64 %t5040, i64 2, i64 %t5032, i64 %t5033, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5046 = call i64 @rt_intern(ptr @.str.sym.26)
  %t5047 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5047)
  %t5048 = and i64 %t5047, -8
  %t5049 = inttoptr i64 %t5048 to ptr
  %t5050 = load i64, ptr %t5049
  %t5051 = inttoptr i64 %t5050 to ptr
  %t5052 = call fastcc i64%t5051(i64 %t5047, i64 4, i64 %t5046, i64 %t5039, i64 %t5045, i64 %t5033, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5053 = load i64, ptr @"scheme.base:vector->list"
  call void @rt_check_callable(i64 %t5053)
  %t5054 = and i64 %t5053, -8
  %t5055 = inttoptr i64 %t5054 to ptr
  %t5056 = load i64, ptr %t5055
  %t5057 = inttoptr i64 %t5056 to ptr
  %t5058 = call fastcc i64%t5057(i64 %t5053, i64 3, i64 %a0, i64 %t5039, i64 %t5045, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5059 = call i64 @rt_list_to_string(i64 %t5058)
  ret i64 %t5059
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector->string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5060 = call i64 @rt_vector_length(i64 %a0)
  %t5061 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5061)
  %t5062 = and i64 %t5061, -8
  %t5063 = inttoptr i64 %t5062 to ptr
  %t5064 = load i64, ptr %t5063
  %t5065 = inttoptr i64 %t5064 to ptr
  %t5066 = call fastcc i64%t5065(i64 %t5061, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5067 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5067)
  %t5068 = and i64 %t5067, -8
  %t5069 = inttoptr i64 %t5068 to ptr
  %t5070 = load i64, ptr %t5069
  %t5071 = inttoptr i64 %t5070 to ptr
  %t5072 = call fastcc i64%t5071(i64 %t5067, i64 2, i64 2, i64 %t5060, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5073 = call i64 @rt_intern(ptr @.str.sym.26)
  %t5074 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5074)
  %t5075 = and i64 %t5074, -8
  %t5076 = inttoptr i64 %t5075 to ptr
  %t5077 = load i64, ptr %t5076
  %t5078 = inttoptr i64 %t5077 to ptr
  %t5079 = call fastcc i64%t5078(i64 %t5074, i64 4, i64 %t5073, i64 %t5066, i64 %t5072, i64 %t5060, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5080 = load i64, ptr @"scheme.base:vector->list"
  call void @rt_check_callable(i64 %t5080)
  %t5081 = and i64 %t5080, -8
  %t5082 = inttoptr i64 %t5081 to ptr
  %t5083 = load i64, ptr %t5082
  %t5084 = inttoptr i64 %t5083 to ptr
  %t5085 = call fastcc i64%t5084(i64 %t5080, i64 3, i64 %a0, i64 %t5066, i64 %t5072, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5086 = call i64 @rt_list_to_string(i64 %t5085)
  ret i64 %t5086
}

define fastcc i64 @"scheme.base:code:string-map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5091 = icmp sge i64 %argc, 2
  br i1 %t5091, label %argok1113, label %arityerr1112
arityerr1112:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1113:
  %t5092 = call ptr @rt_alloc_words(i64 8)
  %t5093 = getelementptr i64, ptr %t5092, i64 0
  store i64 %a0, ptr %t5093
  %t5094 = getelementptr i64, ptr %t5092, i64 1
  store i64 %a1, ptr %t5094
  %t5095 = getelementptr i64, ptr %t5092, i64 2
  store i64 %a2, ptr %t5095
  %t5096 = getelementptr i64, ptr %t5092, i64 3
  store i64 %a3, ptr %t5096
  %t5097 = getelementptr i64, ptr %t5092, i64 4
  store i64 %a4, ptr %t5097
  %t5098 = getelementptr i64, ptr %t5092, i64 5
  store i64 %a5, ptr %t5098
  %t5099 = getelementptr i64, ptr %t5092, i64 6
  store i64 %a6, ptr %t5099
  %t5100 = getelementptr i64, ptr %t5092, i64 7
  store i64 %a7, ptr %t5100
  %t5101 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t5092, ptr %overflow)
  %t5102 = call i64 @rt_null_p(i64 %t5101)
  %t5103 = icmp ne i64 %t5102, 1
  br i1 %t5103, label %then1114, label %else1115
then1114:
  %t5104 = load i64, ptr @"scheme.base:string->list"
  call void @rt_check_callable(i64 %t5104)
  %t5105 = and i64 %t5104, -8
  %t5106 = inttoptr i64 %t5105 to ptr
  %t5107 = load i64, ptr %t5106
  %t5108 = inttoptr i64 %t5107 to ptr
  %t5109 = call fastcc i64%t5108(i64 %t5104, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5110 = load i64, ptr @"scheme.base:str-map1"
  call void @rt_check_callable(i64 %t5110)
  %t5111 = and i64 %t5110, -8
  %t5112 = inttoptr i64 %t5111 to ptr
  %t5113 = load i64, ptr %t5112
  %t5114 = inttoptr i64 %t5113 to ptr
  %t5115 = call fastcc i64%t5114(i64 %t5110, i64 2, i64 %a0, i64 %t5109, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5116 = call i64 @rt_list_to_string(i64 %t5115)
  ret i64 %t5116
else1115:
  %t5117 = call i64 @rt_cons(i64 %a1, i64 %t5101)
  %t5118 = load i64, ptr @"scheme.base:str-mapn"
  call void @rt_check_callable(i64 %t5118)
  %t5119 = and i64 %t5118, -8
  %t5120 = inttoptr i64 %t5119 to ptr
  %t5121 = load i64, ptr %t5120
  %t5122 = inttoptr i64 %t5121 to ptr
  %t5123 = call fastcc i64%t5122(i64 %t5118, i64 2, i64 %a0, i64 %t5117, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5124 = call i64 @rt_list_to_string(i64 %t5123)
  ret i64 %t5124
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring-map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5125 = call i64 @rt_null_p(i64 2)
  %t5126 = icmp ne i64 %t5125, 1
  br i1 %t5126, label %then1116, label %else1117
then1116:
  %t5127 = load i64, ptr @"scheme.base:string->list"
  call void @rt_check_callable(i64 %t5127)
  %t5128 = and i64 %t5127, -8
  %t5129 = inttoptr i64 %t5128 to ptr
  %t5130 = load i64, ptr %t5129
  %t5131 = inttoptr i64 %t5130 to ptr
  %t5132 = call fastcc i64%t5131(i64 %t5127, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5133 = load i64, ptr @"scheme.base:str-map1"
  call void @rt_check_callable(i64 %t5133)
  %t5134 = and i64 %t5133, -8
  %t5135 = inttoptr i64 %t5134 to ptr
  %t5136 = load i64, ptr %t5135
  %t5137 = inttoptr i64 %t5136 to ptr
  %t5138 = call fastcc i64%t5137(i64 %t5133, i64 2, i64 %a0, i64 %t5132, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5139 = call i64 @rt_list_to_string(i64 %t5138)
  ret i64 %t5139
else1117:
  %t5140 = call i64 @rt_cons(i64 %a1, i64 2)
  %t5141 = load i64, ptr @"scheme.base:str-mapn"
  call void @rt_check_callable(i64 %t5141)
  %t5142 = and i64 %t5141, -8
  %t5143 = inttoptr i64 %t5142 to ptr
  %t5144 = load i64, ptr %t5143
  %t5145 = inttoptr i64 %t5144 to ptr
  %t5146 = call fastcc i64%t5145(i64 %t5141, i64 2, i64 %a0, i64 %t5140, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5147 = call i64 @rt_list_to_string(i64 %t5146)
  ret i64 %t5147
}

define fastcc i64 @"scheme.base:code:str-map1"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5152 = icmp eq i64 %argc, 2
  br i1 %t5152, label %argok1119, label %arityerr1118
arityerr1118:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1119:
  %t5153 = call i64 @rt_null_p(i64 %a1)
  %t5154 = icmp ne i64 %t5153, 1
  br i1 %t5154, label %then1120, label %else1121
then1120:
  ret i64 2
else1121:
  %t5155 = call i64 @rt_car(i64 %a1)
  call void @rt_check_callable(i64 %a0)
  %t5156 = and i64 %a0, -8
  %t5157 = inttoptr i64 %t5156 to ptr
  %t5158 = load i64, ptr %t5157
  %t5159 = inttoptr i64 %t5158 to ptr
  %t5160 = call fastcc i64%t5159(i64 %a0, i64 1, i64 %t5155, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5161 = call i64 @rt_cdr(i64 %a1)
  %t5162 = load i64, ptr @"scheme.base:str-map1"
  call void @rt_check_callable(i64 %t5162)
  %t5163 = and i64 %t5162, -8
  %t5164 = inttoptr i64 %t5163 to ptr
  %t5165 = load i64, ptr %t5164
  %t5166 = inttoptr i64 %t5165 to ptr
  %t5167 = call fastcc i64%t5166(i64 %t5162, i64 2, i64 %a0, i64 %t5161, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5168 = call i64 @rt_cons(i64 %t5160, i64 %t5167)
  ret i64 %t5168
}

define fastcc i64 @"scheme.base:code_906"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5173 = icmp eq i64 %argc, 1
  br i1 %t5173, label %argok1123, label %arityerr1122
arityerr1122:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1123:
  %t5174 = and i64 %self, -8
  %t5175 = inttoptr i64 %t5174 to ptr
  %t5176 = getelementptr i64, ptr %t5175, i64 1
  %t5177 = load i64, ptr %t5176
  %t5178 = or i64 %a0, %t5177
  %t5179 = and i64 %t5178, 7
  %t5180 = icmp eq i64 %t5179, 0
  br i1 %t5180, label %fixfast1124, label %fixslow1125
fixfast1124:
  %t5181 = icmp eq i64 %a0, %t5177
  %t5182 = select i1 %t5181, i64 257, i64 1
  br label %fixmerge1126
fixslow1125:
  %t5183 = call i64 @rt_num_eq(i64 %a0, i64 %t5177)
  br label %fixmerge1126
fixmerge1126:
  %t5184 = phi i64 [ %t5182, %fixfast1124 ], [ %t5183, %fixslow1125 ]
  %t5185 = icmp ne i64 %t5184, 1
  br i1 %t5185, label %then1127, label %else1128
then1127:
  ret i64 2
else1128:
  %t5186 = and i64 %self, -8
  %t5187 = inttoptr i64 %t5186 to ptr
  %t5188 = getelementptr i64, ptr %t5187, i64 3
  %t5189 = load i64, ptr %t5188
  %t5190 = load i64, ptr @"scheme.base:str-nth"
  call void @rt_check_callable(i64 %t5190)
  %t5191 = and i64 %t5190, -8
  %t5192 = inttoptr i64 %t5191 to ptr
  %t5193 = load i64, ptr %t5192
  %t5194 = inttoptr i64 %t5193 to ptr
  %t5195 = call fastcc i64%t5194(i64 %t5190, i64 2, i64 %t5189, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5196 = and i64 %self, -8
  %t5197 = inttoptr i64 %t5196 to ptr
  %t5198 = getelementptr i64, ptr %t5197, i64 2
  %t5199 = load i64, ptr %t5198
  call void @rt_check_callable(i64 %t5199)
  %t5200 = and i64 %t5199, -8
  %t5201 = inttoptr i64 %t5200 to ptr
  %t5202 = load i64, ptr %t5201
  %t5203 = inttoptr i64 %t5202 to ptr
  %t5204 = call i64 @rt_list_length(i64 %t5195)
  %t5205 = add i64 0, %t5204
  %t5206 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t5195, i64 8)
  %t5218 = getelementptr i64, ptr %t5206, i64 0
  %t5210 = load i64, ptr %t5218
  %t5219 = getelementptr i64, ptr %t5206, i64 1
  %t5211 = load i64, ptr %t5219
  %t5220 = getelementptr i64, ptr %t5206, i64 2
  %t5212 = load i64, ptr %t5220
  %t5221 = getelementptr i64, ptr %t5206, i64 3
  %t5213 = load i64, ptr %t5221
  %t5222 = getelementptr i64, ptr %t5206, i64 4
  %t5214 = load i64, ptr %t5222
  %t5223 = getelementptr i64, ptr %t5206, i64 5
  %t5215 = load i64, ptr %t5223
  %t5224 = getelementptr i64, ptr %t5206, i64 6
  %t5216 = load i64, ptr %t5224
  %t5225 = getelementptr i64, ptr %t5206, i64 7
  %t5217 = load i64, ptr %t5225
  %t5207 = icmp sgt i64 %t5205, 8
  %t5208 = getelementptr i64, ptr %t5206, i64 8
  %t5209 = select i1 %t5207, ptr %t5208, ptr null
  %t5226 = call fastcc i64%t5203(i64 %t5199, i64 %t5205, i64 %t5210, i64 %t5211, i64 %t5212, i64 %t5213, i64 %t5214, i64 %t5215, i64 %t5216, i64 %t5217, ptr %t5209)
  %t5227 = or i64 %a0, 8
  %t5228 = and i64 %t5227, 7
  %t5229 = icmp eq i64 %t5228, 0
  br i1 %t5229, label %fixfast1129, label %fixslow1130
fixfast1129:
  %t5230 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5231 = extractvalue {i64, i1} %t5230, 0
  %t5232 = extractvalue {i64, i1} %t5230, 1
  br i1 %t5232, label %fixslow1130, label %fixmerge1131
fixslow1130:
  %t5233 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1131
fixmerge1131:
  %t5234 = phi i64 [ %t5231, %fixfast1129 ], [ %t5233, %fixslow1130 ]
  %t5235 = call fastcc i64 @"scheme.base:code_906"(i64 %self, i64 1, i64 %t5234, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5236 = call i64 @rt_cons(i64 %t5226, i64 %t5235)
  ret i64 %t5236
}

define fastcc i64 @"scheme.base:code:str-mapn"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5237 = icmp eq i64 %argc, 2
  br i1 %t5237, label %argok1133, label %arityerr1132
arityerr1132:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1133:
  %t5238 = load i64, ptr @"scheme.base:str-min-len"
  call void @rt_check_callable(i64 %t5238)
  %t5239 = and i64 %t5238, -8
  %t5240 = inttoptr i64 %t5239 to ptr
  %t5241 = load i64, ptr %t5240
  %t5242 = inttoptr i64 %t5241 to ptr
  %t5243 = call fastcc i64%t5242(i64 %t5238, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5244 = call ptr @rt_alloc_words(i64 5)
  %t5245 = ptrtoint ptr %t5244 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_906" to i64), ptr %t5244
  %t5246 = or i64 %t5245, 4
  %t5247 = getelementptr i64, ptr %t5244, i64 1
  store i64 %t5243, ptr %t5247
  %t5248 = getelementptr i64, ptr %t5244, i64 2
  store i64 %a0, ptr %t5248
  %t5249 = getelementptr i64, ptr %t5244, i64 3
  store i64 %a1, ptr %t5249
  %t5250 = getelementptr i64, ptr %t5244, i64 4
  store i64 %t5246, ptr %t5250
  %t5251 = musttail call fastcc i64 @"scheme.base:code_906"(i64 %t5246, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5251
}

define fastcc i64 @"scheme.base:code_927"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5256 = icmp eq i64 %argc, 1
  br i1 %t5256, label %argok1135, label %arityerr1134
arityerr1134:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1135:
  %t5257 = and i64 %self, -8
  %t5258 = inttoptr i64 %t5257 to ptr
  %t5259 = getelementptr i64, ptr %t5258, i64 1
  %t5260 = load i64, ptr %t5259
  %t5261 = or i64 %a0, %t5260
  %t5262 = and i64 %t5261, 7
  %t5263 = icmp eq i64 %t5262, 0
  br i1 %t5263, label %fixfast1136, label %fixslow1137
fixfast1136:
  %t5264 = icmp eq i64 %a0, %t5260
  %t5265 = select i1 %t5264, i64 257, i64 1
  br label %fixmerge1138
fixslow1137:
  %t5266 = call i64 @rt_num_eq(i64 %a0, i64 %t5260)
  br label %fixmerge1138
fixmerge1138:
  %t5267 = phi i64 [ %t5265, %fixfast1136 ], [ %t5266, %fixslow1137 ]
  %t5268 = icmp ne i64 %t5267, 1
  br i1 %t5268, label %then1139, label %else1140
then1139:
  %t5269 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t5269)
  %t5270 = and i64 %t5269, -8
  %t5271 = inttoptr i64 %t5270 to ptr
  %t5272 = load i64, ptr %t5271
  %t5273 = inttoptr i64 %t5272 to ptr
  %t5274 = musttail call fastcc i64 %t5273(i64 %t5269, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5274
else1140:
  %t5275 = and i64 %self, -8
  %t5276 = inttoptr i64 %t5275 to ptr
  %t5277 = getelementptr i64, ptr %t5276, i64 3
  %t5278 = load i64, ptr %t5277
  %t5279 = call i64 @rt_string_ref(i64 %t5278, i64 %a0)
  %t5280 = and i64 %self, -8
  %t5281 = inttoptr i64 %t5280 to ptr
  %t5282 = getelementptr i64, ptr %t5281, i64 2
  %t5283 = load i64, ptr %t5282
  call void @rt_check_callable(i64 %t5283)
  %t5284 = and i64 %t5283, -8
  %t5285 = inttoptr i64 %t5284 to ptr
  %t5286 = load i64, ptr %t5285
  %t5287 = inttoptr i64 %t5286 to ptr
  %t5288 = call fastcc i64%t5287(i64 %t5283, i64 1, i64 %t5279, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5289 = or i64 %a0, 8
  %t5290 = and i64 %t5289, 7
  %t5291 = icmp eq i64 %t5290, 0
  br i1 %t5291, label %fixfast1141, label %fixslow1142
fixfast1141:
  %t5292 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5293 = extractvalue {i64, i1} %t5292, 0
  %t5294 = extractvalue {i64, i1} %t5292, 1
  br i1 %t5294, label %fixslow1142, label %fixmerge1143
fixslow1142:
  %t5295 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1143
fixmerge1143:
  %t5296 = phi i64 [ %t5293, %fixfast1141 ], [ %t5295, %fixslow1142 ]
  %t5297 = musttail call fastcc i64 @"scheme.base:code_927"(i64 %self, i64 1, i64 %t5296, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5297
}

define fastcc i64 @"scheme.base:code_929"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5298 = icmp eq i64 %argc, 1
  br i1 %t5298, label %argok1145, label %arityerr1144
arityerr1144:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1145:
  %t5299 = and i64 %self, -8
  %t5300 = inttoptr i64 %t5299 to ptr
  %t5301 = getelementptr i64, ptr %t5300, i64 1
  %t5302 = load i64, ptr %t5301
  %t5303 = or i64 %a0, %t5302
  %t5304 = and i64 %t5303, 7
  %t5305 = icmp eq i64 %t5304, 0
  br i1 %t5305, label %fixfast1146, label %fixslow1147
fixfast1146:
  %t5306 = icmp eq i64 %a0, %t5302
  %t5307 = select i1 %t5306, i64 257, i64 1
  br label %fixmerge1148
fixslow1147:
  %t5308 = call i64 @rt_num_eq(i64 %a0, i64 %t5302)
  br label %fixmerge1148
fixmerge1148:
  %t5309 = phi i64 [ %t5307, %fixfast1146 ], [ %t5308, %fixslow1147 ]
  %t5310 = icmp ne i64 %t5309, 1
  br i1 %t5310, label %then1149, label %else1150
then1149:
  %t5311 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t5311)
  %t5312 = and i64 %t5311, -8
  %t5313 = inttoptr i64 %t5312 to ptr
  %t5314 = load i64, ptr %t5313
  %t5315 = inttoptr i64 %t5314 to ptr
  %t5316 = musttail call fastcc i64 %t5315(i64 %t5311, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5316
else1150:
  %t5317 = and i64 %self, -8
  %t5318 = inttoptr i64 %t5317 to ptr
  %t5319 = getelementptr i64, ptr %t5318, i64 3
  %t5320 = load i64, ptr %t5319
  %t5321 = load i64, ptr @"scheme.base:str-nth"
  call void @rt_check_callable(i64 %t5321)
  %t5322 = and i64 %t5321, -8
  %t5323 = inttoptr i64 %t5322 to ptr
  %t5324 = load i64, ptr %t5323
  %t5325 = inttoptr i64 %t5324 to ptr
  %t5326 = call fastcc i64%t5325(i64 %t5321, i64 2, i64 %t5320, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5327 = and i64 %self, -8
  %t5328 = inttoptr i64 %t5327 to ptr
  %t5329 = getelementptr i64, ptr %t5328, i64 2
  %t5330 = load i64, ptr %t5329
  call void @rt_check_callable(i64 %t5330)
  %t5331 = and i64 %t5330, -8
  %t5332 = inttoptr i64 %t5331 to ptr
  %t5333 = load i64, ptr %t5332
  %t5334 = inttoptr i64 %t5333 to ptr
  %t5335 = call i64 @rt_list_length(i64 %t5326)
  %t5336 = add i64 0, %t5335
  %t5337 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t5326, i64 8)
  %t5349 = getelementptr i64, ptr %t5337, i64 0
  %t5341 = load i64, ptr %t5349
  %t5350 = getelementptr i64, ptr %t5337, i64 1
  %t5342 = load i64, ptr %t5350
  %t5351 = getelementptr i64, ptr %t5337, i64 2
  %t5343 = load i64, ptr %t5351
  %t5352 = getelementptr i64, ptr %t5337, i64 3
  %t5344 = load i64, ptr %t5352
  %t5353 = getelementptr i64, ptr %t5337, i64 4
  %t5345 = load i64, ptr %t5353
  %t5354 = getelementptr i64, ptr %t5337, i64 5
  %t5346 = load i64, ptr %t5354
  %t5355 = getelementptr i64, ptr %t5337, i64 6
  %t5347 = load i64, ptr %t5355
  %t5356 = getelementptr i64, ptr %t5337, i64 7
  %t5348 = load i64, ptr %t5356
  %t5338 = icmp sgt i64 %t5336, 8
  %t5339 = getelementptr i64, ptr %t5337, i64 8
  %t5340 = select i1 %t5338, ptr %t5339, ptr null
  %t5357 = call fastcc i64%t5334(i64 %t5330, i64 %t5336, i64 %t5341, i64 %t5342, i64 %t5343, i64 %t5344, i64 %t5345, i64 %t5346, i64 %t5347, i64 %t5348, ptr %t5340)
  %t5358 = or i64 %a0, 8
  %t5359 = and i64 %t5358, 7
  %t5360 = icmp eq i64 %t5359, 0
  br i1 %t5360, label %fixfast1151, label %fixslow1152
fixfast1151:
  %t5361 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5362 = extractvalue {i64, i1} %t5361, 0
  %t5363 = extractvalue {i64, i1} %t5361, 1
  br i1 %t5363, label %fixslow1152, label %fixmerge1153
fixslow1152:
  %t5364 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1153
fixmerge1153:
  %t5365 = phi i64 [ %t5362, %fixfast1151 ], [ %t5364, %fixslow1152 ]
  %t5366 = musttail call fastcc i64 @"scheme.base:code_929"(i64 %self, i64 1, i64 %t5365, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5366
}

define fastcc i64 @"scheme.base:code:string-for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5367 = icmp sge i64 %argc, 2
  br i1 %t5367, label %argok1155, label %arityerr1154
arityerr1154:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1155:
  %t5368 = call ptr @rt_alloc_words(i64 8)
  %t5369 = getelementptr i64, ptr %t5368, i64 0
  store i64 %a0, ptr %t5369
  %t5370 = getelementptr i64, ptr %t5368, i64 1
  store i64 %a1, ptr %t5370
  %t5371 = getelementptr i64, ptr %t5368, i64 2
  store i64 %a2, ptr %t5371
  %t5372 = getelementptr i64, ptr %t5368, i64 3
  store i64 %a3, ptr %t5372
  %t5373 = getelementptr i64, ptr %t5368, i64 4
  store i64 %a4, ptr %t5373
  %t5374 = getelementptr i64, ptr %t5368, i64 5
  store i64 %a5, ptr %t5374
  %t5375 = getelementptr i64, ptr %t5368, i64 6
  store i64 %a6, ptr %t5375
  %t5376 = getelementptr i64, ptr %t5368, i64 7
  store i64 %a7, ptr %t5376
  %t5377 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t5368, ptr %overflow)
  %t5378 = call i64 @rt_null_p(i64 %t5377)
  %t5379 = icmp ne i64 %t5378, 1
  br i1 %t5379, label %then1156, label %else1157
then1156:
  %t5380 = call i64 @rt_string_length(i64 %a1)
  %t5381 = call ptr @rt_alloc_words(i64 5)
  %t5382 = ptrtoint ptr %t5381 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_927" to i64), ptr %t5381
  %t5383 = or i64 %t5382, 4
  %t5384 = getelementptr i64, ptr %t5381, i64 1
  store i64 %t5380, ptr %t5384
  %t5385 = getelementptr i64, ptr %t5381, i64 2
  store i64 %a0, ptr %t5385
  %t5386 = getelementptr i64, ptr %t5381, i64 3
  store i64 %a1, ptr %t5386
  %t5387 = getelementptr i64, ptr %t5381, i64 4
  store i64 %t5383, ptr %t5387
  %t5388 = musttail call fastcc i64 @"scheme.base:code_927"(i64 %t5383, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5388
else1157:
  %t5389 = call i64 @rt_cons(i64 %a1, i64 %t5377)
  %t5390 = load i64, ptr @"scheme.base:str-min-len"
  call void @rt_check_callable(i64 %t5390)
  %t5391 = and i64 %t5390, -8
  %t5392 = inttoptr i64 %t5391 to ptr
  %t5393 = load i64, ptr %t5392
  %t5394 = inttoptr i64 %t5393 to ptr
  %t5395 = call fastcc i64%t5394(i64 %t5390, i64 1, i64 %t5389, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5396 = call ptr @rt_alloc_words(i64 5)
  %t5397 = ptrtoint ptr %t5396 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_929" to i64), ptr %t5396
  %t5398 = or i64 %t5397, 4
  %t5399 = getelementptr i64, ptr %t5396, i64 1
  store i64 %t5395, ptr %t5399
  %t5400 = getelementptr i64, ptr %t5396, i64 2
  store i64 %a0, ptr %t5400
  %t5401 = getelementptr i64, ptr %t5396, i64 3
  store i64 %t5389, ptr %t5401
  %t5402 = getelementptr i64, ptr %t5396, i64 4
  store i64 %t5398, ptr %t5402
  %t5403 = musttail call fastcc i64 @"scheme.base:code_929"(i64 %t5398, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5403
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring-for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5404 = call i64 @rt_null_p(i64 2)
  %t5405 = icmp ne i64 %t5404, 1
  br i1 %t5405, label %then1158, label %else1159
then1158:
  %t5406 = call i64 @rt_string_length(i64 %a1)
  %t5407 = call ptr @rt_alloc_words(i64 5)
  %t5408 = ptrtoint ptr %t5407 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_927" to i64), ptr %t5407
  %t5409 = or i64 %t5408, 4
  %t5410 = getelementptr i64, ptr %t5407, i64 1
  store i64 %t5406, ptr %t5410
  %t5411 = getelementptr i64, ptr %t5407, i64 2
  store i64 %a0, ptr %t5411
  %t5412 = getelementptr i64, ptr %t5407, i64 3
  store i64 %a1, ptr %t5412
  %t5413 = getelementptr i64, ptr %t5407, i64 4
  store i64 %t5409, ptr %t5413
  %t5414 = musttail call fastcc i64 @"scheme.base:code_927"(i64 %t5409, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5414
else1159:
  %t5415 = call i64 @rt_cons(i64 %a1, i64 2)
  %t5416 = load i64, ptr @"scheme.base:str-min-len"
  call void @rt_check_callable(i64 %t5416)
  %t5417 = and i64 %t5416, -8
  %t5418 = inttoptr i64 %t5417 to ptr
  %t5419 = load i64, ptr %t5418
  %t5420 = inttoptr i64 %t5419 to ptr
  %t5421 = call fastcc i64%t5420(i64 %t5416, i64 1, i64 %t5415, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5422 = call ptr @rt_alloc_words(i64 5)
  %t5423 = ptrtoint ptr %t5422 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_929" to i64), ptr %t5422
  %t5424 = or i64 %t5423, 4
  %t5425 = getelementptr i64, ptr %t5422, i64 1
  store i64 %t5421, ptr %t5425
  %t5426 = getelementptr i64, ptr %t5422, i64 2
  store i64 %a0, ptr %t5426
  %t5427 = getelementptr i64, ptr %t5422, i64 3
  store i64 %t5415, ptr %t5427
  %t5428 = getelementptr i64, ptr %t5422, i64 4
  store i64 %t5424, ptr %t5428
  %t5429 = musttail call fastcc i64 @"scheme.base:code_929"(i64 %t5424, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5429
}

define fastcc i64 @"scheme.base:code:str-min-len"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5434 = icmp eq i64 %argc, 1
  br i1 %t5434, label %argok1161, label %arityerr1160
arityerr1160:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1161:
  %t5435 = call i64 @rt_cdr(i64 %a0)
  %t5436 = call i64 @rt_null_p(i64 %t5435)
  %t5437 = icmp ne i64 %t5436, 1
  br i1 %t5437, label %then1162, label %else1163
then1162:
  %t5438 = call i64 @rt_car(i64 %a0)
  %t5439 = call i64 @rt_string_length(i64 %t5438)
  ret i64 %t5439
else1163:
  %t5440 = call i64 @rt_car(i64 %a0)
  %t5441 = call i64 @rt_string_length(i64 %t5440)
  %t5442 = call i64 @rt_cdr(i64 %a0)
  %t5443 = load i64, ptr @"scheme.base:str-min-len"
  call void @rt_check_callable(i64 %t5443)
  %t5444 = and i64 %t5443, -8
  %t5445 = inttoptr i64 %t5444 to ptr
  %t5446 = load i64, ptr %t5445
  %t5447 = inttoptr i64 %t5446 to ptr
  %t5448 = call fastcc i64%t5447(i64 %t5443, i64 1, i64 %t5442, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5449 = or i64 %t5441, %t5448
  %t5450 = and i64 %t5449, 7
  %t5451 = icmp eq i64 %t5450, 0
  br i1 %t5451, label %fixfast1164, label %fixslow1165
fixfast1164:
  %t5452 = icmp slt i64 %t5441, %t5448
  %t5453 = select i1 %t5452, i64 257, i64 1
  br label %fixmerge1166
fixslow1165:
  %t5454 = call i64 @rt_lt(i64 %t5441, i64 %t5448)
  br label %fixmerge1166
fixmerge1166:
  %t5455 = phi i64 [ %t5453, %fixfast1164 ], [ %t5454, %fixslow1165 ]
  %t5456 = icmp ne i64 %t5455, 1
  br i1 %t5456, label %then1167, label %else1168
then1167:
  ret i64 %t5441
else1168:
  ret i64 %t5448
}

define fastcc i64 @"scheme.base:code:str-nth"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5461 = icmp eq i64 %argc, 2
  br i1 %t5461, label %argok1170, label %arityerr1169
arityerr1169:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1170:
  %t5462 = call i64 @rt_null_p(i64 %a0)
  %t5463 = icmp ne i64 %t5462, 1
  br i1 %t5463, label %then1171, label %else1172
then1171:
  ret i64 2
else1172:
  %t5464 = call i64 @rt_car(i64 %a0)
  %t5465 = call i64 @rt_string_ref(i64 %t5464, i64 %a1)
  %t5466 = call i64 @rt_cdr(i64 %a0)
  %t5467 = load i64, ptr @"scheme.base:str-nth"
  call void @rt_check_callable(i64 %t5467)
  %t5468 = and i64 %t5467, -8
  %t5469 = inttoptr i64 %t5468 to ptr
  %t5470 = load i64, ptr %t5469
  %t5471 = inttoptr i64 %t5470 to ptr
  %t5472 = call fastcc i64%t5471(i64 %t5467, i64 2, i64 %t5466, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5473 = call i64 @rt_cons(i64 %t5465, i64 %t5472)
  ret i64 %t5473
}

define fastcc i64 @"scheme.base:code_955"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5478 = icmp eq i64 %argc, 1
  br i1 %t5478, label %argok1174, label %arityerr1173
arityerr1173:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1174:
  %t5479 = and i64 %self, -8
  %t5480 = inttoptr i64 %t5479 to ptr
  %t5481 = getelementptr i64, ptr %t5480, i64 1
  %t5482 = load i64, ptr %t5481
  %t5483 = or i64 %a0, %t5482
  %t5484 = and i64 %t5483, 7
  %t5485 = icmp eq i64 %t5484, 0
  br i1 %t5485, label %fixfast1175, label %fixslow1176
fixfast1175:
  %t5486 = icmp eq i64 %a0, %t5482
  %t5487 = select i1 %t5486, i64 257, i64 1
  br label %fixmerge1177
fixslow1176:
  %t5488 = call i64 @rt_num_eq(i64 %a0, i64 %t5482)
  br label %fixmerge1177
fixmerge1177:
  %t5489 = phi i64 [ %t5487, %fixfast1175 ], [ %t5488, %fixslow1176 ]
  %t5490 = icmp ne i64 %t5489, 1
  br i1 %t5490, label %then1178, label %else1179
then1178:
  %t5491 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t5491)
  %t5492 = and i64 %t5491, -8
  %t5493 = inttoptr i64 %t5492 to ptr
  %t5494 = load i64, ptr %t5493
  %t5495 = inttoptr i64 %t5494 to ptr
  %t5496 = musttail call fastcc i64 %t5495(i64 %t5491, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5496
else1179:
  %t5497 = and i64 %self, -8
  %t5498 = inttoptr i64 %t5497 to ptr
  %t5499 = getelementptr i64, ptr %t5498, i64 2
  %t5500 = load i64, ptr %t5499
  %t5501 = and i64 %self, -8
  %t5502 = inttoptr i64 %t5501 to ptr
  %t5503 = getelementptr i64, ptr %t5502, i64 3
  %t5504 = load i64, ptr %t5503
  %t5505 = call i64 @rt_string_set(i64 %t5500, i64 %a0, i64 %t5504)
  %t5506 = or i64 %a0, 8
  %t5507 = and i64 %t5506, 7
  %t5508 = icmp eq i64 %t5507, 0
  br i1 %t5508, label %fixfast1180, label %fixslow1181
fixfast1180:
  %t5509 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5510 = extractvalue {i64, i1} %t5509, 0
  %t5511 = extractvalue {i64, i1} %t5509, 1
  br i1 %t5511, label %fixslow1181, label %fixmerge1182
fixslow1181:
  %t5512 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1182
fixmerge1182:
  %t5513 = phi i64 [ %t5510, %fixfast1180 ], [ %t5512, %fixslow1181 ]
  %t5514 = musttail call fastcc i64 @"scheme.base:code_955"(i64 %self, i64 1, i64 %t5513, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5514
}

define fastcc i64 @"scheme.base:code:string-fill!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5515 = icmp sge i64 %argc, 2
  br i1 %t5515, label %argok1184, label %arityerr1183
arityerr1183:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1184:
  %t5516 = call ptr @rt_alloc_words(i64 8)
  %t5517 = getelementptr i64, ptr %t5516, i64 0
  store i64 %a0, ptr %t5517
  %t5518 = getelementptr i64, ptr %t5516, i64 1
  store i64 %a1, ptr %t5518
  %t5519 = getelementptr i64, ptr %t5516, i64 2
  store i64 %a2, ptr %t5519
  %t5520 = getelementptr i64, ptr %t5516, i64 3
  store i64 %a3, ptr %t5520
  %t5521 = getelementptr i64, ptr %t5516, i64 4
  store i64 %a4, ptr %t5521
  %t5522 = getelementptr i64, ptr %t5516, i64 5
  store i64 %a5, ptr %t5522
  %t5523 = getelementptr i64, ptr %t5516, i64 6
  store i64 %a6, ptr %t5523
  %t5524 = getelementptr i64, ptr %t5516, i64 7
  store i64 %a7, ptr %t5524
  %t5525 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t5516, ptr %overflow)
  %t5526 = call i64 @rt_string_length(i64 %a0)
  %t5527 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5527)
  %t5528 = and i64 %t5527, -8
  %t5529 = inttoptr i64 %t5528 to ptr
  %t5530 = load i64, ptr %t5529
  %t5531 = inttoptr i64 %t5530 to ptr
  %t5532 = call fastcc i64%t5531(i64 %t5527, i64 1, i64 %t5525, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5533 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5533)
  %t5534 = and i64 %t5533, -8
  %t5535 = inttoptr i64 %t5534 to ptr
  %t5536 = load i64, ptr %t5535
  %t5537 = inttoptr i64 %t5536 to ptr
  %t5538 = call fastcc i64%t5537(i64 %t5533, i64 2, i64 %t5525, i64 %t5526, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5539 = call i64 @rt_intern(ptr @.str.sym.27)
  %t5540 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5540)
  %t5541 = and i64 %t5540, -8
  %t5542 = inttoptr i64 %t5541 to ptr
  %t5543 = load i64, ptr %t5542
  %t5544 = inttoptr i64 %t5543 to ptr
  %t5545 = call fastcc i64%t5544(i64 %t5540, i64 4, i64 %t5539, i64 %t5532, i64 %t5538, i64 %t5526, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5546 = call ptr @rt_alloc_words(i64 5)
  %t5547 = ptrtoint ptr %t5546 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_955" to i64), ptr %t5546
  %t5548 = or i64 %t5547, 4
  %t5549 = getelementptr i64, ptr %t5546, i64 1
  store i64 %t5538, ptr %t5549
  %t5550 = getelementptr i64, ptr %t5546, i64 2
  store i64 %a0, ptr %t5550
  %t5551 = getelementptr i64, ptr %t5546, i64 3
  store i64 %a1, ptr %t5551
  %t5552 = getelementptr i64, ptr %t5546, i64 4
  store i64 %t5548, ptr %t5552
  %t5553 = musttail call fastcc i64 @"scheme.base:code_955"(i64 %t5548, i64 1, i64 %t5532, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5553
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring-fill!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5554 = call i64 @rt_string_length(i64 %a0)
  %t5555 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5555)
  %t5556 = and i64 %t5555, -8
  %t5557 = inttoptr i64 %t5556 to ptr
  %t5558 = load i64, ptr %t5557
  %t5559 = inttoptr i64 %t5558 to ptr
  %t5560 = call fastcc i64%t5559(i64 %t5555, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5561 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5561)
  %t5562 = and i64 %t5561, -8
  %t5563 = inttoptr i64 %t5562 to ptr
  %t5564 = load i64, ptr %t5563
  %t5565 = inttoptr i64 %t5564 to ptr
  %t5566 = call fastcc i64%t5565(i64 %t5561, i64 2, i64 2, i64 %t5554, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5567 = call i64 @rt_intern(ptr @.str.sym.27)
  %t5568 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5568)
  %t5569 = and i64 %t5568, -8
  %t5570 = inttoptr i64 %t5569 to ptr
  %t5571 = load i64, ptr %t5570
  %t5572 = inttoptr i64 %t5571 to ptr
  %t5573 = call fastcc i64%t5572(i64 %t5568, i64 4, i64 %t5567, i64 %t5560, i64 %t5566, i64 %t5554, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5574 = call ptr @rt_alloc_words(i64 5)
  %t5575 = ptrtoint ptr %t5574 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_955" to i64), ptr %t5574
  %t5576 = or i64 %t5575, 4
  %t5577 = getelementptr i64, ptr %t5574, i64 1
  store i64 %t5566, ptr %t5577
  %t5578 = getelementptr i64, ptr %t5574, i64 2
  store i64 %a0, ptr %t5578
  %t5579 = getelementptr i64, ptr %t5574, i64 3
  store i64 %a1, ptr %t5579
  %t5580 = getelementptr i64, ptr %t5574, i64 4
  store i64 %t5576, ptr %t5580
  %t5581 = musttail call fastcc i64 @"scheme.base:code_955"(i64 %t5576, i64 1, i64 %t5560, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5581
}

define fastcc i64 @"scheme.base:code_981"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5586 = icmp eq i64 %argc, 1
  br i1 %t5586, label %argok1186, label %arityerr1185
arityerr1185:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1186:
  %t5587 = or i64 %a0, 0
  %t5588 = and i64 %t5587, 7
  %t5589 = icmp eq i64 %t5588, 0
  br i1 %t5589, label %fixfast1187, label %fixslow1188
fixfast1187:
  %t5590 = icmp slt i64 %a0, 0
  %t5591 = select i1 %t5590, i64 257, i64 1
  br label %fixmerge1189
fixslow1188:
  %t5592 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge1189
fixmerge1189:
  %t5593 = phi i64 [ %t5591, %fixfast1187 ], [ %t5592, %fixslow1188 ]
  %t5594 = icmp ne i64 %t5593, 1
  br i1 %t5594, label %then1190, label %else1191
then1190:
  %t5595 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t5595)
  %t5596 = and i64 %t5595, -8
  %t5597 = inttoptr i64 %t5596 to ptr
  %t5598 = load i64, ptr %t5597
  %t5599 = inttoptr i64 %t5598 to ptr
  %t5600 = musttail call fastcc i64 %t5599(i64 %t5595, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5600
else1191:
  %t5601 = and i64 %self, -8
  %t5602 = inttoptr i64 %t5601 to ptr
  %t5603 = getelementptr i64, ptr %t5602, i64 1
  %t5604 = load i64, ptr %t5603
  %t5605 = and i64 %self, -8
  %t5606 = inttoptr i64 %t5605 to ptr
  %t5607 = getelementptr i64, ptr %t5606, i64 2
  %t5608 = load i64, ptr %t5607
  %t5609 = or i64 %t5608, %a0
  %t5610 = and i64 %t5609, 7
  %t5611 = icmp eq i64 %t5610, 0
  br i1 %t5611, label %fixfast1192, label %fixslow1193
fixfast1192:
  %t5612 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5608, i64 %a0)
  %t5613 = extractvalue {i64, i1} %t5612, 0
  %t5614 = extractvalue {i64, i1} %t5612, 1
  br i1 %t5614, label %fixslow1193, label %fixmerge1194
fixslow1193:
  %t5615 = call i64 @rt_add(i64 %t5608, i64 %a0)
  br label %fixmerge1194
fixmerge1194:
  %t5616 = phi i64 [ %t5613, %fixfast1192 ], [ %t5615, %fixslow1193 ]
  %t5617 = and i64 %self, -8
  %t5618 = inttoptr i64 %t5617 to ptr
  %t5619 = getelementptr i64, ptr %t5618, i64 3
  %t5620 = load i64, ptr %t5619
  %t5621 = and i64 %self, -8
  %t5622 = inttoptr i64 %t5621 to ptr
  %t5623 = getelementptr i64, ptr %t5622, i64 4
  %t5624 = load i64, ptr %t5623
  %t5625 = or i64 %t5624, %a0
  %t5626 = and i64 %t5625, 7
  %t5627 = icmp eq i64 %t5626, 0
  br i1 %t5627, label %fixfast1195, label %fixslow1196
fixfast1195:
  %t5628 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5624, i64 %a0)
  %t5629 = extractvalue {i64, i1} %t5628, 0
  %t5630 = extractvalue {i64, i1} %t5628, 1
  br i1 %t5630, label %fixslow1196, label %fixmerge1197
fixslow1196:
  %t5631 = call i64 @rt_add(i64 %t5624, i64 %a0)
  br label %fixmerge1197
fixmerge1197:
  %t5632 = phi i64 [ %t5629, %fixfast1195 ], [ %t5631, %fixslow1196 ]
  %t5633 = call i64 @rt_string_ref(i64 %t5620, i64 %t5632)
  %t5634 = call i64 @rt_string_set(i64 %t5604, i64 %t5616, i64 %t5633)
  %t5635 = or i64 %a0, 8
  %t5636 = and i64 %t5635, 7
  %t5637 = icmp eq i64 %t5636, 0
  br i1 %t5637, label %fixfast1198, label %fixslow1199
fixfast1198:
  %t5638 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t5639 = extractvalue {i64, i1} %t5638, 0
  %t5640 = extractvalue {i64, i1} %t5638, 1
  br i1 %t5640, label %fixslow1199, label %fixmerge1200
fixslow1199:
  %t5641 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge1200
fixmerge1200:
  %t5642 = phi i64 [ %t5639, %fixfast1198 ], [ %t5641, %fixslow1199 ]
  %t5643 = musttail call fastcc i64 @"scheme.base:code_981"(i64 %self, i64 1, i64 %t5642, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5643
}

define fastcc i64 @"scheme.base:code_983"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5644 = icmp eq i64 %argc, 1
  br i1 %t5644, label %argok1202, label %arityerr1201
arityerr1201:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1202:
  %t5645 = and i64 %self, -8
  %t5646 = inttoptr i64 %t5645 to ptr
  %t5647 = getelementptr i64, ptr %t5646, i64 1
  %t5648 = load i64, ptr %t5647
  %t5649 = and i64 %self, -8
  %t5650 = inttoptr i64 %t5649 to ptr
  %t5651 = getelementptr i64, ptr %t5650, i64 2
  %t5652 = load i64, ptr %t5651
  %t5653 = or i64 %t5648, %t5652
  %t5654 = and i64 %t5653, 7
  %t5655 = icmp eq i64 %t5654, 0
  br i1 %t5655, label %fixfast1203, label %fixslow1204
fixfast1203:
  %t5656 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5648, i64 %t5652)
  %t5657 = extractvalue {i64, i1} %t5656, 0
  %t5658 = extractvalue {i64, i1} %t5656, 1
  br i1 %t5658, label %fixslow1204, label %fixmerge1205
fixslow1204:
  %t5659 = call i64 @rt_sub(i64 %t5648, i64 %t5652)
  br label %fixmerge1205
fixmerge1205:
  %t5660 = phi i64 [ %t5657, %fixfast1203 ], [ %t5659, %fixslow1204 ]
  %t5661 = or i64 %a0, %t5660
  %t5662 = and i64 %t5661, 7
  %t5663 = icmp eq i64 %t5662, 0
  br i1 %t5663, label %fixfast1206, label %fixslow1207
fixfast1206:
  %t5664 = icmp eq i64 %a0, %t5660
  %t5665 = select i1 %t5664, i64 257, i64 1
  br label %fixmerge1208
fixslow1207:
  %t5666 = call i64 @rt_num_eq(i64 %a0, i64 %t5660)
  br label %fixmerge1208
fixmerge1208:
  %t5667 = phi i64 [ %t5665, %fixfast1206 ], [ %t5666, %fixslow1207 ]
  %t5668 = icmp ne i64 %t5667, 1
  br i1 %t5668, label %then1209, label %else1210
then1209:
  %t5669 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t5669)
  %t5670 = and i64 %t5669, -8
  %t5671 = inttoptr i64 %t5670 to ptr
  %t5672 = load i64, ptr %t5671
  %t5673 = inttoptr i64 %t5672 to ptr
  %t5674 = musttail call fastcc i64 %t5673(i64 %t5669, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5674
else1210:
  %t5675 = and i64 %self, -8
  %t5676 = inttoptr i64 %t5675 to ptr
  %t5677 = getelementptr i64, ptr %t5676, i64 3
  %t5678 = load i64, ptr %t5677
  %t5679 = and i64 %self, -8
  %t5680 = inttoptr i64 %t5679 to ptr
  %t5681 = getelementptr i64, ptr %t5680, i64 4
  %t5682 = load i64, ptr %t5681
  %t5683 = or i64 %t5682, %a0
  %t5684 = and i64 %t5683, 7
  %t5685 = icmp eq i64 %t5684, 0
  br i1 %t5685, label %fixfast1211, label %fixslow1212
fixfast1211:
  %t5686 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5682, i64 %a0)
  %t5687 = extractvalue {i64, i1} %t5686, 0
  %t5688 = extractvalue {i64, i1} %t5686, 1
  br i1 %t5688, label %fixslow1212, label %fixmerge1213
fixslow1212:
  %t5689 = call i64 @rt_add(i64 %t5682, i64 %a0)
  br label %fixmerge1213
fixmerge1213:
  %t5690 = phi i64 [ %t5687, %fixfast1211 ], [ %t5689, %fixslow1212 ]
  %t5691 = and i64 %self, -8
  %t5692 = inttoptr i64 %t5691 to ptr
  %t5693 = getelementptr i64, ptr %t5692, i64 5
  %t5694 = load i64, ptr %t5693
  %t5695 = and i64 %self, -8
  %t5696 = inttoptr i64 %t5695 to ptr
  %t5697 = getelementptr i64, ptr %t5696, i64 2
  %t5698 = load i64, ptr %t5697
  %t5699 = or i64 %t5698, %a0
  %t5700 = and i64 %t5699, 7
  %t5701 = icmp eq i64 %t5700, 0
  br i1 %t5701, label %fixfast1214, label %fixslow1215
fixfast1214:
  %t5702 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5698, i64 %a0)
  %t5703 = extractvalue {i64, i1} %t5702, 0
  %t5704 = extractvalue {i64, i1} %t5702, 1
  br i1 %t5704, label %fixslow1215, label %fixmerge1216
fixslow1215:
  %t5705 = call i64 @rt_add(i64 %t5698, i64 %a0)
  br label %fixmerge1216
fixmerge1216:
  %t5706 = phi i64 [ %t5703, %fixfast1214 ], [ %t5705, %fixslow1215 ]
  %t5707 = call i64 @rt_string_ref(i64 %t5694, i64 %t5706)
  %t5708 = call i64 @rt_string_set(i64 %t5678, i64 %t5690, i64 %t5707)
  %t5709 = or i64 %a0, 8
  %t5710 = and i64 %t5709, 7
  %t5711 = icmp eq i64 %t5710, 0
  br i1 %t5711, label %fixfast1217, label %fixslow1218
fixfast1217:
  %t5712 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5713 = extractvalue {i64, i1} %t5712, 0
  %t5714 = extractvalue {i64, i1} %t5712, 1
  br i1 %t5714, label %fixslow1218, label %fixmerge1219
fixslow1218:
  %t5715 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1219
fixmerge1219:
  %t5716 = phi i64 [ %t5713, %fixfast1217 ], [ %t5715, %fixslow1218 ]
  %t5717 = musttail call fastcc i64 @"scheme.base:code_983"(i64 %self, i64 1, i64 %t5716, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5717
}

define fastcc i64 @"scheme.base:code:string-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5718 = icmp sge i64 %argc, 3
  br i1 %t5718, label %argok1221, label %arityerr1220
arityerr1220:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1221:
  %t5719 = call ptr @rt_alloc_words(i64 8)
  %t5720 = getelementptr i64, ptr %t5719, i64 0
  store i64 %a0, ptr %t5720
  %t5721 = getelementptr i64, ptr %t5719, i64 1
  store i64 %a1, ptr %t5721
  %t5722 = getelementptr i64, ptr %t5719, i64 2
  store i64 %a2, ptr %t5722
  %t5723 = getelementptr i64, ptr %t5719, i64 3
  store i64 %a3, ptr %t5723
  %t5724 = getelementptr i64, ptr %t5719, i64 4
  store i64 %a4, ptr %t5724
  %t5725 = getelementptr i64, ptr %t5719, i64 5
  store i64 %a5, ptr %t5725
  %t5726 = getelementptr i64, ptr %t5719, i64 6
  store i64 %a6, ptr %t5726
  %t5727 = getelementptr i64, ptr %t5719, i64 7
  store i64 %a7, ptr %t5727
  %t5728 = call i64 @rt_build_rest(i64 %argc, i64 3, i64 8, ptr %t5719, ptr %overflow)
  %t5729 = call i64 @rt_string_length(i64 %a2)
  %t5730 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5730)
  %t5731 = and i64 %t5730, -8
  %t5732 = inttoptr i64 %t5731 to ptr
  %t5733 = load i64, ptr %t5732
  %t5734 = inttoptr i64 %t5733 to ptr
  %t5735 = call fastcc i64%t5734(i64 %t5730, i64 1, i64 %t5728, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5736 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5736)
  %t5737 = and i64 %t5736, -8
  %t5738 = inttoptr i64 %t5737 to ptr
  %t5739 = load i64, ptr %t5738
  %t5740 = inttoptr i64 %t5739 to ptr
  %t5741 = call fastcc i64%t5740(i64 %t5736, i64 2, i64 %t5728, i64 %t5729, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5742 = call i64 @rt_intern(ptr @.str.sym.28)
  %t5743 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5743)
  %t5744 = and i64 %t5743, -8
  %t5745 = inttoptr i64 %t5744 to ptr
  %t5746 = load i64, ptr %t5745
  %t5747 = inttoptr i64 %t5746 to ptr
  %t5748 = call fastcc i64%t5747(i64 %t5743, i64 4, i64 %t5742, i64 %t5735, i64 %t5741, i64 %t5729, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5749 = call i64 @rt_intern(ptr @.str.sym.28)
  %t5750 = or i64 %t5741, %t5735
  %t5751 = and i64 %t5750, 7
  %t5752 = icmp eq i64 %t5751, 0
  br i1 %t5752, label %fixfast1222, label %fixslow1223
fixfast1222:
  %t5753 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5741, i64 %t5735)
  %t5754 = extractvalue {i64, i1} %t5753, 0
  %t5755 = extractvalue {i64, i1} %t5753, 1
  br i1 %t5755, label %fixslow1223, label %fixmerge1224
fixslow1223:
  %t5756 = call i64 @rt_sub(i64 %t5741, i64 %t5735)
  br label %fixmerge1224
fixmerge1224:
  %t5757 = phi i64 [ %t5754, %fixfast1222 ], [ %t5756, %fixslow1223 ]
  %t5758 = or i64 %a1, %t5757
  %t5759 = and i64 %t5758, 7
  %t5760 = icmp eq i64 %t5759, 0
  br i1 %t5760, label %fixfast1225, label %fixslow1226
fixfast1225:
  %t5761 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t5757)
  %t5762 = extractvalue {i64, i1} %t5761, 0
  %t5763 = extractvalue {i64, i1} %t5761, 1
  br i1 %t5763, label %fixslow1226, label %fixmerge1227
fixslow1226:
  %t5764 = call i64 @rt_add(i64 %a1, i64 %t5757)
  br label %fixmerge1227
fixmerge1227:
  %t5765 = phi i64 [ %t5762, %fixfast1225 ], [ %t5764, %fixslow1226 ]
  %t5766 = call i64 @rt_string_length(i64 %a0)
  %t5767 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5767)
  %t5768 = and i64 %t5767, -8
  %t5769 = inttoptr i64 %t5768 to ptr
  %t5770 = load i64, ptr %t5769
  %t5771 = inttoptr i64 %t5770 to ptr
  %t5772 = call fastcc i64%t5771(i64 %t5767, i64 4, i64 %t5749, i64 %a1, i64 %t5765, i64 %t5766, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5773 = or i64 %t5735, %a1
  %t5774 = and i64 %t5773, 7
  %t5775 = icmp eq i64 %t5774, 0
  br i1 %t5775, label %fixfast1228, label %fixslow1229
fixfast1228:
  %t5776 = icmp slt i64 %t5735, %a1
  %t5777 = select i1 %t5776, i64 257, i64 1
  br label %fixmerge1230
fixslow1229:
  %t5778 = call i64 @rt_lt(i64 %t5735, i64 %a1)
  br label %fixmerge1230
fixmerge1230:
  %t5779 = phi i64 [ %t5777, %fixfast1228 ], [ %t5778, %fixslow1229 ]
  %t5780 = icmp ne i64 %t5779, 1
  br i1 %t5780, label %then1231, label %else1232
then1231:
  %t5781 = call ptr @rt_alloc_words(i64 6)
  %t5782 = ptrtoint ptr %t5781 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_981" to i64), ptr %t5781
  %t5783 = or i64 %t5782, 4
  %t5784 = getelementptr i64, ptr %t5781, i64 1
  store i64 %a0, ptr %t5784
  %t5785 = getelementptr i64, ptr %t5781, i64 2
  store i64 %a1, ptr %t5785
  %t5786 = getelementptr i64, ptr %t5781, i64 3
  store i64 %a2, ptr %t5786
  %t5787 = getelementptr i64, ptr %t5781, i64 4
  store i64 %t5735, ptr %t5787
  %t5788 = getelementptr i64, ptr %t5781, i64 5
  store i64 %t5783, ptr %t5788
  %t5789 = or i64 %t5741, %t5735
  %t5790 = and i64 %t5789, 7
  %t5791 = icmp eq i64 %t5790, 0
  br i1 %t5791, label %fixfast1233, label %fixslow1234
fixfast1233:
  %t5792 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5741, i64 %t5735)
  %t5793 = extractvalue {i64, i1} %t5792, 0
  %t5794 = extractvalue {i64, i1} %t5792, 1
  br i1 %t5794, label %fixslow1234, label %fixmerge1235
fixslow1234:
  %t5795 = call i64 @rt_sub(i64 %t5741, i64 %t5735)
  br label %fixmerge1235
fixmerge1235:
  %t5796 = phi i64 [ %t5793, %fixfast1233 ], [ %t5795, %fixslow1234 ]
  %t5797 = or i64 %t5796, 8
  %t5798 = and i64 %t5797, 7
  %t5799 = icmp eq i64 %t5798, 0
  br i1 %t5799, label %fixfast1236, label %fixslow1237
fixfast1236:
  %t5800 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5796, i64 8)
  %t5801 = extractvalue {i64, i1} %t5800, 0
  %t5802 = extractvalue {i64, i1} %t5800, 1
  br i1 %t5802, label %fixslow1237, label %fixmerge1238
fixslow1237:
  %t5803 = call i64 @rt_sub(i64 %t5796, i64 8)
  br label %fixmerge1238
fixmerge1238:
  %t5804 = phi i64 [ %t5801, %fixfast1236 ], [ %t5803, %fixslow1237 ]
  %t5805 = musttail call fastcc i64 @"scheme.base:code_981"(i64 %t5783, i64 1, i64 %t5804, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5805
else1232:
  %t5806 = call ptr @rt_alloc_words(i64 7)
  %t5807 = ptrtoint ptr %t5806 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_983" to i64), ptr %t5806
  %t5808 = or i64 %t5807, 4
  %t5809 = getelementptr i64, ptr %t5806, i64 1
  store i64 %t5741, ptr %t5809
  %t5810 = getelementptr i64, ptr %t5806, i64 2
  store i64 %t5735, ptr %t5810
  %t5811 = getelementptr i64, ptr %t5806, i64 3
  store i64 %a0, ptr %t5811
  %t5812 = getelementptr i64, ptr %t5806, i64 4
  store i64 %a1, ptr %t5812
  %t5813 = getelementptr i64, ptr %t5806, i64 5
  store i64 %a2, ptr %t5813
  %t5814 = getelementptr i64, ptr %t5806, i64 6
  store i64 %t5808, ptr %t5814
  %t5815 = musttail call fastcc i64 @"scheme.base:code_983"(i64 %t5808, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5815
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5816 = call i64 @rt_string_length(i64 %a2)
  %t5817 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5817)
  %t5818 = and i64 %t5817, -8
  %t5819 = inttoptr i64 %t5818 to ptr
  %t5820 = load i64, ptr %t5819
  %t5821 = inttoptr i64 %t5820 to ptr
  %t5822 = call fastcc i64%t5821(i64 %t5817, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5823 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5823)
  %t5824 = and i64 %t5823, -8
  %t5825 = inttoptr i64 %t5824 to ptr
  %t5826 = load i64, ptr %t5825
  %t5827 = inttoptr i64 %t5826 to ptr
  %t5828 = call fastcc i64%t5827(i64 %t5823, i64 2, i64 2, i64 %t5816, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5829 = call i64 @rt_intern(ptr @.str.sym.28)
  %t5830 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5830)
  %t5831 = and i64 %t5830, -8
  %t5832 = inttoptr i64 %t5831 to ptr
  %t5833 = load i64, ptr %t5832
  %t5834 = inttoptr i64 %t5833 to ptr
  %t5835 = call fastcc i64%t5834(i64 %t5830, i64 4, i64 %t5829, i64 %t5822, i64 %t5828, i64 %t5816, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5836 = call i64 @rt_intern(ptr @.str.sym.28)
  %t5837 = or i64 %t5828, %t5822
  %t5838 = and i64 %t5837, 7
  %t5839 = icmp eq i64 %t5838, 0
  br i1 %t5839, label %fixfast1239, label %fixslow1240
fixfast1239:
  %t5840 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5828, i64 %t5822)
  %t5841 = extractvalue {i64, i1} %t5840, 0
  %t5842 = extractvalue {i64, i1} %t5840, 1
  br i1 %t5842, label %fixslow1240, label %fixmerge1241
fixslow1240:
  %t5843 = call i64 @rt_sub(i64 %t5828, i64 %t5822)
  br label %fixmerge1241
fixmerge1241:
  %t5844 = phi i64 [ %t5841, %fixfast1239 ], [ %t5843, %fixslow1240 ]
  %t5845 = or i64 %a1, %t5844
  %t5846 = and i64 %t5845, 7
  %t5847 = icmp eq i64 %t5846, 0
  br i1 %t5847, label %fixfast1242, label %fixslow1243
fixfast1242:
  %t5848 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t5844)
  %t5849 = extractvalue {i64, i1} %t5848, 0
  %t5850 = extractvalue {i64, i1} %t5848, 1
  br i1 %t5850, label %fixslow1243, label %fixmerge1244
fixslow1243:
  %t5851 = call i64 @rt_add(i64 %a1, i64 %t5844)
  br label %fixmerge1244
fixmerge1244:
  %t5852 = phi i64 [ %t5849, %fixfast1242 ], [ %t5851, %fixslow1243 ]
  %t5853 = call i64 @rt_string_length(i64 %a0)
  %t5854 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5854)
  %t5855 = and i64 %t5854, -8
  %t5856 = inttoptr i64 %t5855 to ptr
  %t5857 = load i64, ptr %t5856
  %t5858 = inttoptr i64 %t5857 to ptr
  %t5859 = call fastcc i64%t5858(i64 %t5854, i64 4, i64 %t5836, i64 %a1, i64 %t5852, i64 %t5853, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5860 = or i64 %t5822, %a1
  %t5861 = and i64 %t5860, 7
  %t5862 = icmp eq i64 %t5861, 0
  br i1 %t5862, label %fixfast1245, label %fixslow1246
fixfast1245:
  %t5863 = icmp slt i64 %t5822, %a1
  %t5864 = select i1 %t5863, i64 257, i64 1
  br label %fixmerge1247
fixslow1246:
  %t5865 = call i64 @rt_lt(i64 %t5822, i64 %a1)
  br label %fixmerge1247
fixmerge1247:
  %t5866 = phi i64 [ %t5864, %fixfast1245 ], [ %t5865, %fixslow1246 ]
  %t5867 = icmp ne i64 %t5866, 1
  br i1 %t5867, label %then1248, label %else1249
then1248:
  %t5868 = call ptr @rt_alloc_words(i64 6)
  %t5869 = ptrtoint ptr %t5868 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_981" to i64), ptr %t5868
  %t5870 = or i64 %t5869, 4
  %t5871 = getelementptr i64, ptr %t5868, i64 1
  store i64 %a0, ptr %t5871
  %t5872 = getelementptr i64, ptr %t5868, i64 2
  store i64 %a1, ptr %t5872
  %t5873 = getelementptr i64, ptr %t5868, i64 3
  store i64 %a2, ptr %t5873
  %t5874 = getelementptr i64, ptr %t5868, i64 4
  store i64 %t5822, ptr %t5874
  %t5875 = getelementptr i64, ptr %t5868, i64 5
  store i64 %t5870, ptr %t5875
  %t5876 = or i64 %t5828, %t5822
  %t5877 = and i64 %t5876, 7
  %t5878 = icmp eq i64 %t5877, 0
  br i1 %t5878, label %fixfast1250, label %fixslow1251
fixfast1250:
  %t5879 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5828, i64 %t5822)
  %t5880 = extractvalue {i64, i1} %t5879, 0
  %t5881 = extractvalue {i64, i1} %t5879, 1
  br i1 %t5881, label %fixslow1251, label %fixmerge1252
fixslow1251:
  %t5882 = call i64 @rt_sub(i64 %t5828, i64 %t5822)
  br label %fixmerge1252
fixmerge1252:
  %t5883 = phi i64 [ %t5880, %fixfast1250 ], [ %t5882, %fixslow1251 ]
  %t5884 = or i64 %t5883, 8
  %t5885 = and i64 %t5884, 7
  %t5886 = icmp eq i64 %t5885, 0
  br i1 %t5886, label %fixfast1253, label %fixslow1254
fixfast1253:
  %t5887 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5883, i64 8)
  %t5888 = extractvalue {i64, i1} %t5887, 0
  %t5889 = extractvalue {i64, i1} %t5887, 1
  br i1 %t5889, label %fixslow1254, label %fixmerge1255
fixslow1254:
  %t5890 = call i64 @rt_sub(i64 %t5883, i64 8)
  br label %fixmerge1255
fixmerge1255:
  %t5891 = phi i64 [ %t5888, %fixfast1253 ], [ %t5890, %fixslow1254 ]
  %t5892 = musttail call fastcc i64 @"scheme.base:code_981"(i64 %t5870, i64 1, i64 %t5891, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5892
else1249:
  %t5893 = call ptr @rt_alloc_words(i64 7)
  %t5894 = ptrtoint ptr %t5893 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_983" to i64), ptr %t5893
  %t5895 = or i64 %t5894, 4
  %t5896 = getelementptr i64, ptr %t5893, i64 1
  store i64 %t5828, ptr %t5896
  %t5897 = getelementptr i64, ptr %t5893, i64 2
  store i64 %t5822, ptr %t5897
  %t5898 = getelementptr i64, ptr %t5893, i64 3
  store i64 %a0, ptr %t5898
  %t5899 = getelementptr i64, ptr %t5893, i64 4
  store i64 %a1, ptr %t5899
  %t5900 = getelementptr i64, ptr %t5893, i64 5
  store i64 %a2, ptr %t5900
  %t5901 = getelementptr i64, ptr %t5893, i64 6
  store i64 %t5895, ptr %t5901
  %t5902 = musttail call fastcc i64 @"scheme.base:code_983"(i64 %t5895, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5902
}

define fastcc i64 @"scheme.base:code_998"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5907 = icmp eq i64 %argc, 1
  br i1 %t5907, label %argok1257, label %arityerr1256
arityerr1256:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1257:
  %t5908 = and i64 %self, -8
  %t5909 = inttoptr i64 %t5908 to ptr
  %t5910 = getelementptr i64, ptr %t5909, i64 1
  %t5911 = load i64, ptr %t5910
  %t5912 = or i64 %a0, %t5911
  %t5913 = and i64 %t5912, 7
  %t5914 = icmp eq i64 %t5913, 0
  br i1 %t5914, label %fixfast1258, label %fixslow1259
fixfast1258:
  %t5915 = icmp eq i64 %a0, %t5911
  %t5916 = select i1 %t5915, i64 257, i64 1
  br label %fixmerge1260
fixslow1259:
  %t5917 = call i64 @rt_num_eq(i64 %a0, i64 %t5911)
  br label %fixmerge1260
fixmerge1260:
  %t5918 = phi i64 [ %t5916, %fixfast1258 ], [ %t5917, %fixslow1259 ]
  %t5919 = icmp ne i64 %t5918, 1
  br i1 %t5919, label %then1261, label %else1262
then1261:
  %t5920 = and i64 %self, -8
  %t5921 = inttoptr i64 %t5920 to ptr
  %t5922 = getelementptr i64, ptr %t5921, i64 2
  %t5923 = load i64, ptr %t5922
  ret i64 %t5923
else1262:
  %t5924 = and i64 %self, -8
  %t5925 = inttoptr i64 %t5924 to ptr
  %t5926 = getelementptr i64, ptr %t5925, i64 2
  %t5927 = load i64, ptr %t5926
  %t5928 = and i64 %self, -8
  %t5929 = inttoptr i64 %t5928 to ptr
  %t5930 = getelementptr i64, ptr %t5929, i64 3
  %t5931 = load i64, ptr %t5930
  %t5932 = or i64 %a0, %t5931
  %t5933 = and i64 %t5932, 7
  %t5934 = icmp eq i64 %t5933, 0
  br i1 %t5934, label %fixfast1263, label %fixslow1264
fixfast1263:
  %t5935 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t5931)
  %t5936 = extractvalue {i64, i1} %t5935, 0
  %t5937 = extractvalue {i64, i1} %t5935, 1
  br i1 %t5937, label %fixslow1264, label %fixmerge1265
fixslow1264:
  %t5938 = call i64 @rt_sub(i64 %a0, i64 %t5931)
  br label %fixmerge1265
fixmerge1265:
  %t5939 = phi i64 [ %t5936, %fixfast1263 ], [ %t5938, %fixslow1264 ]
  %t5940 = and i64 %self, -8
  %t5941 = inttoptr i64 %t5940 to ptr
  %t5942 = getelementptr i64, ptr %t5941, i64 4
  %t5943 = load i64, ptr %t5942
  %t5944 = call i64 @rt_bytevector_u8_ref(i64 %t5943, i64 %a0)
  %t5945 = call i64 @rt_bytevector_u8_set(i64 %t5927, i64 %t5939, i64 %t5944)
  %t5946 = or i64 %a0, 8
  %t5947 = and i64 %t5946, 7
  %t5948 = icmp eq i64 %t5947, 0
  br i1 %t5948, label %fixfast1266, label %fixslow1267
fixfast1266:
  %t5949 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5950 = extractvalue {i64, i1} %t5949, 0
  %t5951 = extractvalue {i64, i1} %t5949, 1
  br i1 %t5951, label %fixslow1267, label %fixmerge1268
fixslow1267:
  %t5952 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1268
fixmerge1268:
  %t5953 = phi i64 [ %t5950, %fixfast1266 ], [ %t5952, %fixslow1267 ]
  %t5954 = musttail call fastcc i64 @"scheme.base:code_998"(i64 %self, i64 1, i64 %t5953, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5954
}

define fastcc i64 @"scheme.base:code:bytevector-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5955 = icmp sge i64 %argc, 1
  br i1 %t5955, label %argok1270, label %arityerr1269
arityerr1269:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1270:
  %t5956 = call ptr @rt_alloc_words(i64 8)
  %t5957 = getelementptr i64, ptr %t5956, i64 0
  store i64 %a0, ptr %t5957
  %t5958 = getelementptr i64, ptr %t5956, i64 1
  store i64 %a1, ptr %t5958
  %t5959 = getelementptr i64, ptr %t5956, i64 2
  store i64 %a2, ptr %t5959
  %t5960 = getelementptr i64, ptr %t5956, i64 3
  store i64 %a3, ptr %t5960
  %t5961 = getelementptr i64, ptr %t5956, i64 4
  store i64 %a4, ptr %t5961
  %t5962 = getelementptr i64, ptr %t5956, i64 5
  store i64 %a5, ptr %t5962
  %t5963 = getelementptr i64, ptr %t5956, i64 6
  store i64 %a6, ptr %t5963
  %t5964 = getelementptr i64, ptr %t5956, i64 7
  store i64 %a7, ptr %t5964
  %t5965 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t5956, ptr %overflow)
  %t5966 = call i64 @rt_bytevector_length(i64 %a0)
  %t5967 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5967)
  %t5968 = and i64 %t5967, -8
  %t5969 = inttoptr i64 %t5968 to ptr
  %t5970 = load i64, ptr %t5969
  %t5971 = inttoptr i64 %t5970 to ptr
  %t5972 = call fastcc i64%t5971(i64 %t5967, i64 1, i64 %t5965, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5973 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5973)
  %t5974 = and i64 %t5973, -8
  %t5975 = inttoptr i64 %t5974 to ptr
  %t5976 = load i64, ptr %t5975
  %t5977 = inttoptr i64 %t5976 to ptr
  %t5978 = call fastcc i64%t5977(i64 %t5973, i64 2, i64 %t5965, i64 %t5966, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5979 = call i64 @rt_intern(ptr @.str.sym.29)
  %t5980 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5980)
  %t5981 = and i64 %t5980, -8
  %t5982 = inttoptr i64 %t5981 to ptr
  %t5983 = load i64, ptr %t5982
  %t5984 = inttoptr i64 %t5983 to ptr
  %t5985 = call fastcc i64%t5984(i64 %t5980, i64 4, i64 %t5979, i64 %t5972, i64 %t5978, i64 %t5966, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5986 = or i64 %t5978, %t5972
  %t5987 = and i64 %t5986, 7
  %t5988 = icmp eq i64 %t5987, 0
  br i1 %t5988, label %fixfast1271, label %fixslow1272
fixfast1271:
  %t5989 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5978, i64 %t5972)
  %t5990 = extractvalue {i64, i1} %t5989, 0
  %t5991 = extractvalue {i64, i1} %t5989, 1
  br i1 %t5991, label %fixslow1272, label %fixmerge1273
fixslow1272:
  %t5992 = call i64 @rt_sub(i64 %t5978, i64 %t5972)
  br label %fixmerge1273
fixmerge1273:
  %t5993 = phi i64 [ %t5990, %fixfast1271 ], [ %t5992, %fixslow1272 ]
  %t5994 = call i64 @rt_make_bytevector(i64 %t5993, i64 0)
  %t5995 = call ptr @rt_alloc_words(i64 6)
  %t5996 = ptrtoint ptr %t5995 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_998" to i64), ptr %t5995
  %t5997 = or i64 %t5996, 4
  %t5998 = getelementptr i64, ptr %t5995, i64 1
  store i64 %t5978, ptr %t5998
  %t5999 = getelementptr i64, ptr %t5995, i64 2
  store i64 %t5994, ptr %t5999
  %t6000 = getelementptr i64, ptr %t5995, i64 3
  store i64 %t5972, ptr %t6000
  %t6001 = getelementptr i64, ptr %t5995, i64 4
  store i64 %a0, ptr %t6001
  %t6002 = getelementptr i64, ptr %t5995, i64 5
  store i64 %t5997, ptr %t6002
  %t6003 = musttail call fastcc i64 @"scheme.base:code_998"(i64 %t5997, i64 1, i64 %t5972, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6003
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cbytevector-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6004 = call i64 @rt_bytevector_length(i64 %a0)
  %t6005 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t6005)
  %t6006 = and i64 %t6005, -8
  %t6007 = inttoptr i64 %t6006 to ptr
  %t6008 = load i64, ptr %t6007
  %t6009 = inttoptr i64 %t6008 to ptr
  %t6010 = call fastcc i64%t6009(i64 %t6005, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6011 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t6011)
  %t6012 = and i64 %t6011, -8
  %t6013 = inttoptr i64 %t6012 to ptr
  %t6014 = load i64, ptr %t6013
  %t6015 = inttoptr i64 %t6014 to ptr
  %t6016 = call fastcc i64%t6015(i64 %t6011, i64 2, i64 2, i64 %t6004, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6017 = call i64 @rt_intern(ptr @.str.sym.29)
  %t6018 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6018)
  %t6019 = and i64 %t6018, -8
  %t6020 = inttoptr i64 %t6019 to ptr
  %t6021 = load i64, ptr %t6020
  %t6022 = inttoptr i64 %t6021 to ptr
  %t6023 = call fastcc i64%t6022(i64 %t6018, i64 4, i64 %t6017, i64 %t6010, i64 %t6016, i64 %t6004, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6024 = or i64 %t6016, %t6010
  %t6025 = and i64 %t6024, 7
  %t6026 = icmp eq i64 %t6025, 0
  br i1 %t6026, label %fixfast1274, label %fixslow1275
fixfast1274:
  %t6027 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6016, i64 %t6010)
  %t6028 = extractvalue {i64, i1} %t6027, 0
  %t6029 = extractvalue {i64, i1} %t6027, 1
  br i1 %t6029, label %fixslow1275, label %fixmerge1276
fixslow1275:
  %t6030 = call i64 @rt_sub(i64 %t6016, i64 %t6010)
  br label %fixmerge1276
fixmerge1276:
  %t6031 = phi i64 [ %t6028, %fixfast1274 ], [ %t6030, %fixslow1275 ]
  %t6032 = call i64 @rt_make_bytevector(i64 %t6031, i64 0)
  %t6033 = call ptr @rt_alloc_words(i64 6)
  %t6034 = ptrtoint ptr %t6033 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_998" to i64), ptr %t6033
  %t6035 = or i64 %t6034, 4
  %t6036 = getelementptr i64, ptr %t6033, i64 1
  store i64 %t6016, ptr %t6036
  %t6037 = getelementptr i64, ptr %t6033, i64 2
  store i64 %t6032, ptr %t6037
  %t6038 = getelementptr i64, ptr %t6033, i64 3
  store i64 %t6010, ptr %t6038
  %t6039 = getelementptr i64, ptr %t6033, i64 4
  store i64 %a0, ptr %t6039
  %t6040 = getelementptr i64, ptr %t6033, i64 5
  store i64 %t6035, ptr %t6040
  %t6041 = musttail call fastcc i64 @"scheme.base:code_998"(i64 %t6035, i64 1, i64 %t6010, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6041
}

define fastcc i64 @"scheme.base:code_1024"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6046 = icmp eq i64 %argc, 1
  br i1 %t6046, label %argok1278, label %arityerr1277
arityerr1277:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1278:
  %t6047 = or i64 %a0, 0
  %t6048 = and i64 %t6047, 7
  %t6049 = icmp eq i64 %t6048, 0
  br i1 %t6049, label %fixfast1279, label %fixslow1280
fixfast1279:
  %t6050 = icmp slt i64 %a0, 0
  %t6051 = select i1 %t6050, i64 257, i64 1
  br label %fixmerge1281
fixslow1280:
  %t6052 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge1281
fixmerge1281:
  %t6053 = phi i64 [ %t6051, %fixfast1279 ], [ %t6052, %fixslow1280 ]
  %t6054 = icmp ne i64 %t6053, 1
  br i1 %t6054, label %then1282, label %else1283
then1282:
  %t6055 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t6055)
  %t6056 = and i64 %t6055, -8
  %t6057 = inttoptr i64 %t6056 to ptr
  %t6058 = load i64, ptr %t6057
  %t6059 = inttoptr i64 %t6058 to ptr
  %t6060 = musttail call fastcc i64 %t6059(i64 %t6055, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6060
else1283:
  %t6061 = and i64 %self, -8
  %t6062 = inttoptr i64 %t6061 to ptr
  %t6063 = getelementptr i64, ptr %t6062, i64 1
  %t6064 = load i64, ptr %t6063
  %t6065 = and i64 %self, -8
  %t6066 = inttoptr i64 %t6065 to ptr
  %t6067 = getelementptr i64, ptr %t6066, i64 2
  %t6068 = load i64, ptr %t6067
  %t6069 = or i64 %t6068, %a0
  %t6070 = and i64 %t6069, 7
  %t6071 = icmp eq i64 %t6070, 0
  br i1 %t6071, label %fixfast1284, label %fixslow1285
fixfast1284:
  %t6072 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6068, i64 %a0)
  %t6073 = extractvalue {i64, i1} %t6072, 0
  %t6074 = extractvalue {i64, i1} %t6072, 1
  br i1 %t6074, label %fixslow1285, label %fixmerge1286
fixslow1285:
  %t6075 = call i64 @rt_add(i64 %t6068, i64 %a0)
  br label %fixmerge1286
fixmerge1286:
  %t6076 = phi i64 [ %t6073, %fixfast1284 ], [ %t6075, %fixslow1285 ]
  %t6077 = and i64 %self, -8
  %t6078 = inttoptr i64 %t6077 to ptr
  %t6079 = getelementptr i64, ptr %t6078, i64 3
  %t6080 = load i64, ptr %t6079
  %t6081 = and i64 %self, -8
  %t6082 = inttoptr i64 %t6081 to ptr
  %t6083 = getelementptr i64, ptr %t6082, i64 4
  %t6084 = load i64, ptr %t6083
  %t6085 = or i64 %t6084, %a0
  %t6086 = and i64 %t6085, 7
  %t6087 = icmp eq i64 %t6086, 0
  br i1 %t6087, label %fixfast1287, label %fixslow1288
fixfast1287:
  %t6088 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6084, i64 %a0)
  %t6089 = extractvalue {i64, i1} %t6088, 0
  %t6090 = extractvalue {i64, i1} %t6088, 1
  br i1 %t6090, label %fixslow1288, label %fixmerge1289
fixslow1288:
  %t6091 = call i64 @rt_add(i64 %t6084, i64 %a0)
  br label %fixmerge1289
fixmerge1289:
  %t6092 = phi i64 [ %t6089, %fixfast1287 ], [ %t6091, %fixslow1288 ]
  %t6093 = call i64 @rt_bytevector_u8_ref(i64 %t6080, i64 %t6092)
  %t6094 = call i64 @rt_bytevector_u8_set(i64 %t6064, i64 %t6076, i64 %t6093)
  %t6095 = or i64 %a0, 8
  %t6096 = and i64 %t6095, 7
  %t6097 = icmp eq i64 %t6096, 0
  br i1 %t6097, label %fixfast1290, label %fixslow1291
fixfast1290:
  %t6098 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t6099 = extractvalue {i64, i1} %t6098, 0
  %t6100 = extractvalue {i64, i1} %t6098, 1
  br i1 %t6100, label %fixslow1291, label %fixmerge1292
fixslow1291:
  %t6101 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge1292
fixmerge1292:
  %t6102 = phi i64 [ %t6099, %fixfast1290 ], [ %t6101, %fixslow1291 ]
  %t6103 = musttail call fastcc i64 @"scheme.base:code_1024"(i64 %self, i64 1, i64 %t6102, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6103
}

define fastcc i64 @"scheme.base:code_1026"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6104 = icmp eq i64 %argc, 1
  br i1 %t6104, label %argok1294, label %arityerr1293
arityerr1293:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1294:
  %t6105 = and i64 %self, -8
  %t6106 = inttoptr i64 %t6105 to ptr
  %t6107 = getelementptr i64, ptr %t6106, i64 1
  %t6108 = load i64, ptr %t6107
  %t6109 = and i64 %self, -8
  %t6110 = inttoptr i64 %t6109 to ptr
  %t6111 = getelementptr i64, ptr %t6110, i64 2
  %t6112 = load i64, ptr %t6111
  %t6113 = or i64 %t6108, %t6112
  %t6114 = and i64 %t6113, 7
  %t6115 = icmp eq i64 %t6114, 0
  br i1 %t6115, label %fixfast1295, label %fixslow1296
fixfast1295:
  %t6116 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6108, i64 %t6112)
  %t6117 = extractvalue {i64, i1} %t6116, 0
  %t6118 = extractvalue {i64, i1} %t6116, 1
  br i1 %t6118, label %fixslow1296, label %fixmerge1297
fixslow1296:
  %t6119 = call i64 @rt_sub(i64 %t6108, i64 %t6112)
  br label %fixmerge1297
fixmerge1297:
  %t6120 = phi i64 [ %t6117, %fixfast1295 ], [ %t6119, %fixslow1296 ]
  %t6121 = or i64 %a0, %t6120
  %t6122 = and i64 %t6121, 7
  %t6123 = icmp eq i64 %t6122, 0
  br i1 %t6123, label %fixfast1298, label %fixslow1299
fixfast1298:
  %t6124 = icmp eq i64 %a0, %t6120
  %t6125 = select i1 %t6124, i64 257, i64 1
  br label %fixmerge1300
fixslow1299:
  %t6126 = call i64 @rt_num_eq(i64 %a0, i64 %t6120)
  br label %fixmerge1300
fixmerge1300:
  %t6127 = phi i64 [ %t6125, %fixfast1298 ], [ %t6126, %fixslow1299 ]
  %t6128 = icmp ne i64 %t6127, 1
  br i1 %t6128, label %then1301, label %else1302
then1301:
  %t6129 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t6129)
  %t6130 = and i64 %t6129, -8
  %t6131 = inttoptr i64 %t6130 to ptr
  %t6132 = load i64, ptr %t6131
  %t6133 = inttoptr i64 %t6132 to ptr
  %t6134 = musttail call fastcc i64 %t6133(i64 %t6129, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6134
else1302:
  %t6135 = and i64 %self, -8
  %t6136 = inttoptr i64 %t6135 to ptr
  %t6137 = getelementptr i64, ptr %t6136, i64 3
  %t6138 = load i64, ptr %t6137
  %t6139 = and i64 %self, -8
  %t6140 = inttoptr i64 %t6139 to ptr
  %t6141 = getelementptr i64, ptr %t6140, i64 4
  %t6142 = load i64, ptr %t6141
  %t6143 = or i64 %t6142, %a0
  %t6144 = and i64 %t6143, 7
  %t6145 = icmp eq i64 %t6144, 0
  br i1 %t6145, label %fixfast1303, label %fixslow1304
fixfast1303:
  %t6146 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6142, i64 %a0)
  %t6147 = extractvalue {i64, i1} %t6146, 0
  %t6148 = extractvalue {i64, i1} %t6146, 1
  br i1 %t6148, label %fixslow1304, label %fixmerge1305
fixslow1304:
  %t6149 = call i64 @rt_add(i64 %t6142, i64 %a0)
  br label %fixmerge1305
fixmerge1305:
  %t6150 = phi i64 [ %t6147, %fixfast1303 ], [ %t6149, %fixslow1304 ]
  %t6151 = and i64 %self, -8
  %t6152 = inttoptr i64 %t6151 to ptr
  %t6153 = getelementptr i64, ptr %t6152, i64 5
  %t6154 = load i64, ptr %t6153
  %t6155 = and i64 %self, -8
  %t6156 = inttoptr i64 %t6155 to ptr
  %t6157 = getelementptr i64, ptr %t6156, i64 2
  %t6158 = load i64, ptr %t6157
  %t6159 = or i64 %t6158, %a0
  %t6160 = and i64 %t6159, 7
  %t6161 = icmp eq i64 %t6160, 0
  br i1 %t6161, label %fixfast1306, label %fixslow1307
fixfast1306:
  %t6162 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6158, i64 %a0)
  %t6163 = extractvalue {i64, i1} %t6162, 0
  %t6164 = extractvalue {i64, i1} %t6162, 1
  br i1 %t6164, label %fixslow1307, label %fixmerge1308
fixslow1307:
  %t6165 = call i64 @rt_add(i64 %t6158, i64 %a0)
  br label %fixmerge1308
fixmerge1308:
  %t6166 = phi i64 [ %t6163, %fixfast1306 ], [ %t6165, %fixslow1307 ]
  %t6167 = call i64 @rt_bytevector_u8_ref(i64 %t6154, i64 %t6166)
  %t6168 = call i64 @rt_bytevector_u8_set(i64 %t6138, i64 %t6150, i64 %t6167)
  %t6169 = or i64 %a0, 8
  %t6170 = and i64 %t6169, 7
  %t6171 = icmp eq i64 %t6170, 0
  br i1 %t6171, label %fixfast1309, label %fixslow1310
fixfast1309:
  %t6172 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t6173 = extractvalue {i64, i1} %t6172, 0
  %t6174 = extractvalue {i64, i1} %t6172, 1
  br i1 %t6174, label %fixslow1310, label %fixmerge1311
fixslow1310:
  %t6175 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1311
fixmerge1311:
  %t6176 = phi i64 [ %t6173, %fixfast1309 ], [ %t6175, %fixslow1310 ]
  %t6177 = musttail call fastcc i64 @"scheme.base:code_1026"(i64 %self, i64 1, i64 %t6176, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6177
}

define fastcc i64 @"scheme.base:code:bytevector-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6178 = icmp sge i64 %argc, 3
  br i1 %t6178, label %argok1313, label %arityerr1312
arityerr1312:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1313:
  %t6179 = call ptr @rt_alloc_words(i64 8)
  %t6180 = getelementptr i64, ptr %t6179, i64 0
  store i64 %a0, ptr %t6180
  %t6181 = getelementptr i64, ptr %t6179, i64 1
  store i64 %a1, ptr %t6181
  %t6182 = getelementptr i64, ptr %t6179, i64 2
  store i64 %a2, ptr %t6182
  %t6183 = getelementptr i64, ptr %t6179, i64 3
  store i64 %a3, ptr %t6183
  %t6184 = getelementptr i64, ptr %t6179, i64 4
  store i64 %a4, ptr %t6184
  %t6185 = getelementptr i64, ptr %t6179, i64 5
  store i64 %a5, ptr %t6185
  %t6186 = getelementptr i64, ptr %t6179, i64 6
  store i64 %a6, ptr %t6186
  %t6187 = getelementptr i64, ptr %t6179, i64 7
  store i64 %a7, ptr %t6187
  %t6188 = call i64 @rt_build_rest(i64 %argc, i64 3, i64 8, ptr %t6179, ptr %overflow)
  %t6189 = call i64 @rt_bytevector_length(i64 %a2)
  %t6190 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t6190)
  %t6191 = and i64 %t6190, -8
  %t6192 = inttoptr i64 %t6191 to ptr
  %t6193 = load i64, ptr %t6192
  %t6194 = inttoptr i64 %t6193 to ptr
  %t6195 = call fastcc i64%t6194(i64 %t6190, i64 1, i64 %t6188, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6196 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t6196)
  %t6197 = and i64 %t6196, -8
  %t6198 = inttoptr i64 %t6197 to ptr
  %t6199 = load i64, ptr %t6198
  %t6200 = inttoptr i64 %t6199 to ptr
  %t6201 = call fastcc i64%t6200(i64 %t6196, i64 2, i64 %t6188, i64 %t6189, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6202 = call i64 @rt_intern(ptr @.str.sym.30)
  %t6203 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6203)
  %t6204 = and i64 %t6203, -8
  %t6205 = inttoptr i64 %t6204 to ptr
  %t6206 = load i64, ptr %t6205
  %t6207 = inttoptr i64 %t6206 to ptr
  %t6208 = call fastcc i64%t6207(i64 %t6203, i64 4, i64 %t6202, i64 %t6195, i64 %t6201, i64 %t6189, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6209 = call i64 @rt_intern(ptr @.str.sym.30)
  %t6210 = or i64 %t6201, %t6195
  %t6211 = and i64 %t6210, 7
  %t6212 = icmp eq i64 %t6211, 0
  br i1 %t6212, label %fixfast1314, label %fixslow1315
fixfast1314:
  %t6213 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6201, i64 %t6195)
  %t6214 = extractvalue {i64, i1} %t6213, 0
  %t6215 = extractvalue {i64, i1} %t6213, 1
  br i1 %t6215, label %fixslow1315, label %fixmerge1316
fixslow1315:
  %t6216 = call i64 @rt_sub(i64 %t6201, i64 %t6195)
  br label %fixmerge1316
fixmerge1316:
  %t6217 = phi i64 [ %t6214, %fixfast1314 ], [ %t6216, %fixslow1315 ]
  %t6218 = or i64 %a1, %t6217
  %t6219 = and i64 %t6218, 7
  %t6220 = icmp eq i64 %t6219, 0
  br i1 %t6220, label %fixfast1317, label %fixslow1318
fixfast1317:
  %t6221 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t6217)
  %t6222 = extractvalue {i64, i1} %t6221, 0
  %t6223 = extractvalue {i64, i1} %t6221, 1
  br i1 %t6223, label %fixslow1318, label %fixmerge1319
fixslow1318:
  %t6224 = call i64 @rt_add(i64 %a1, i64 %t6217)
  br label %fixmerge1319
fixmerge1319:
  %t6225 = phi i64 [ %t6222, %fixfast1317 ], [ %t6224, %fixslow1318 ]
  %t6226 = call i64 @rt_bytevector_length(i64 %a0)
  %t6227 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6227)
  %t6228 = and i64 %t6227, -8
  %t6229 = inttoptr i64 %t6228 to ptr
  %t6230 = load i64, ptr %t6229
  %t6231 = inttoptr i64 %t6230 to ptr
  %t6232 = call fastcc i64%t6231(i64 %t6227, i64 4, i64 %t6209, i64 %a1, i64 %t6225, i64 %t6226, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6233 = or i64 %t6195, %a1
  %t6234 = and i64 %t6233, 7
  %t6235 = icmp eq i64 %t6234, 0
  br i1 %t6235, label %fixfast1320, label %fixslow1321
fixfast1320:
  %t6236 = icmp slt i64 %t6195, %a1
  %t6237 = select i1 %t6236, i64 257, i64 1
  br label %fixmerge1322
fixslow1321:
  %t6238 = call i64 @rt_lt(i64 %t6195, i64 %a1)
  br label %fixmerge1322
fixmerge1322:
  %t6239 = phi i64 [ %t6237, %fixfast1320 ], [ %t6238, %fixslow1321 ]
  %t6240 = icmp ne i64 %t6239, 1
  br i1 %t6240, label %then1323, label %else1324
then1323:
  %t6241 = call ptr @rt_alloc_words(i64 6)
  %t6242 = ptrtoint ptr %t6241 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1024" to i64), ptr %t6241
  %t6243 = or i64 %t6242, 4
  %t6244 = getelementptr i64, ptr %t6241, i64 1
  store i64 %a0, ptr %t6244
  %t6245 = getelementptr i64, ptr %t6241, i64 2
  store i64 %a1, ptr %t6245
  %t6246 = getelementptr i64, ptr %t6241, i64 3
  store i64 %a2, ptr %t6246
  %t6247 = getelementptr i64, ptr %t6241, i64 4
  store i64 %t6195, ptr %t6247
  %t6248 = getelementptr i64, ptr %t6241, i64 5
  store i64 %t6243, ptr %t6248
  %t6249 = or i64 %t6201, %t6195
  %t6250 = and i64 %t6249, 7
  %t6251 = icmp eq i64 %t6250, 0
  br i1 %t6251, label %fixfast1325, label %fixslow1326
fixfast1325:
  %t6252 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6201, i64 %t6195)
  %t6253 = extractvalue {i64, i1} %t6252, 0
  %t6254 = extractvalue {i64, i1} %t6252, 1
  br i1 %t6254, label %fixslow1326, label %fixmerge1327
fixslow1326:
  %t6255 = call i64 @rt_sub(i64 %t6201, i64 %t6195)
  br label %fixmerge1327
fixmerge1327:
  %t6256 = phi i64 [ %t6253, %fixfast1325 ], [ %t6255, %fixslow1326 ]
  %t6257 = or i64 %t6256, 8
  %t6258 = and i64 %t6257, 7
  %t6259 = icmp eq i64 %t6258, 0
  br i1 %t6259, label %fixfast1328, label %fixslow1329
fixfast1328:
  %t6260 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6256, i64 8)
  %t6261 = extractvalue {i64, i1} %t6260, 0
  %t6262 = extractvalue {i64, i1} %t6260, 1
  br i1 %t6262, label %fixslow1329, label %fixmerge1330
fixslow1329:
  %t6263 = call i64 @rt_sub(i64 %t6256, i64 8)
  br label %fixmerge1330
fixmerge1330:
  %t6264 = phi i64 [ %t6261, %fixfast1328 ], [ %t6263, %fixslow1329 ]
  %t6265 = musttail call fastcc i64 @"scheme.base:code_1024"(i64 %t6243, i64 1, i64 %t6264, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6265
else1324:
  %t6266 = call ptr @rt_alloc_words(i64 7)
  %t6267 = ptrtoint ptr %t6266 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1026" to i64), ptr %t6266
  %t6268 = or i64 %t6267, 4
  %t6269 = getelementptr i64, ptr %t6266, i64 1
  store i64 %t6201, ptr %t6269
  %t6270 = getelementptr i64, ptr %t6266, i64 2
  store i64 %t6195, ptr %t6270
  %t6271 = getelementptr i64, ptr %t6266, i64 3
  store i64 %a0, ptr %t6271
  %t6272 = getelementptr i64, ptr %t6266, i64 4
  store i64 %a1, ptr %t6272
  %t6273 = getelementptr i64, ptr %t6266, i64 5
  store i64 %a2, ptr %t6273
  %t6274 = getelementptr i64, ptr %t6266, i64 6
  store i64 %t6268, ptr %t6274
  %t6275 = musttail call fastcc i64 @"scheme.base:code_1026"(i64 %t6268, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6275
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cbytevector-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6276 = call i64 @rt_bytevector_length(i64 %a2)
  %t6277 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t6277)
  %t6278 = and i64 %t6277, -8
  %t6279 = inttoptr i64 %t6278 to ptr
  %t6280 = load i64, ptr %t6279
  %t6281 = inttoptr i64 %t6280 to ptr
  %t6282 = call fastcc i64%t6281(i64 %t6277, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6283 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t6283)
  %t6284 = and i64 %t6283, -8
  %t6285 = inttoptr i64 %t6284 to ptr
  %t6286 = load i64, ptr %t6285
  %t6287 = inttoptr i64 %t6286 to ptr
  %t6288 = call fastcc i64%t6287(i64 %t6283, i64 2, i64 2, i64 %t6276, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6289 = call i64 @rt_intern(ptr @.str.sym.30)
  %t6290 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6290)
  %t6291 = and i64 %t6290, -8
  %t6292 = inttoptr i64 %t6291 to ptr
  %t6293 = load i64, ptr %t6292
  %t6294 = inttoptr i64 %t6293 to ptr
  %t6295 = call fastcc i64%t6294(i64 %t6290, i64 4, i64 %t6289, i64 %t6282, i64 %t6288, i64 %t6276, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6296 = call i64 @rt_intern(ptr @.str.sym.30)
  %t6297 = or i64 %t6288, %t6282
  %t6298 = and i64 %t6297, 7
  %t6299 = icmp eq i64 %t6298, 0
  br i1 %t6299, label %fixfast1331, label %fixslow1332
fixfast1331:
  %t6300 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6288, i64 %t6282)
  %t6301 = extractvalue {i64, i1} %t6300, 0
  %t6302 = extractvalue {i64, i1} %t6300, 1
  br i1 %t6302, label %fixslow1332, label %fixmerge1333
fixslow1332:
  %t6303 = call i64 @rt_sub(i64 %t6288, i64 %t6282)
  br label %fixmerge1333
fixmerge1333:
  %t6304 = phi i64 [ %t6301, %fixfast1331 ], [ %t6303, %fixslow1332 ]
  %t6305 = or i64 %a1, %t6304
  %t6306 = and i64 %t6305, 7
  %t6307 = icmp eq i64 %t6306, 0
  br i1 %t6307, label %fixfast1334, label %fixslow1335
fixfast1334:
  %t6308 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t6304)
  %t6309 = extractvalue {i64, i1} %t6308, 0
  %t6310 = extractvalue {i64, i1} %t6308, 1
  br i1 %t6310, label %fixslow1335, label %fixmerge1336
fixslow1335:
  %t6311 = call i64 @rt_add(i64 %a1, i64 %t6304)
  br label %fixmerge1336
fixmerge1336:
  %t6312 = phi i64 [ %t6309, %fixfast1334 ], [ %t6311, %fixslow1335 ]
  %t6313 = call i64 @rt_bytevector_length(i64 %a0)
  %t6314 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6314)
  %t6315 = and i64 %t6314, -8
  %t6316 = inttoptr i64 %t6315 to ptr
  %t6317 = load i64, ptr %t6316
  %t6318 = inttoptr i64 %t6317 to ptr
  %t6319 = call fastcc i64%t6318(i64 %t6314, i64 4, i64 %t6296, i64 %a1, i64 %t6312, i64 %t6313, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6320 = or i64 %t6282, %a1
  %t6321 = and i64 %t6320, 7
  %t6322 = icmp eq i64 %t6321, 0
  br i1 %t6322, label %fixfast1337, label %fixslow1338
fixfast1337:
  %t6323 = icmp slt i64 %t6282, %a1
  %t6324 = select i1 %t6323, i64 257, i64 1
  br label %fixmerge1339
fixslow1338:
  %t6325 = call i64 @rt_lt(i64 %t6282, i64 %a1)
  br label %fixmerge1339
fixmerge1339:
  %t6326 = phi i64 [ %t6324, %fixfast1337 ], [ %t6325, %fixslow1338 ]
  %t6327 = icmp ne i64 %t6326, 1
  br i1 %t6327, label %then1340, label %else1341
then1340:
  %t6328 = call ptr @rt_alloc_words(i64 6)
  %t6329 = ptrtoint ptr %t6328 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1024" to i64), ptr %t6328
  %t6330 = or i64 %t6329, 4
  %t6331 = getelementptr i64, ptr %t6328, i64 1
  store i64 %a0, ptr %t6331
  %t6332 = getelementptr i64, ptr %t6328, i64 2
  store i64 %a1, ptr %t6332
  %t6333 = getelementptr i64, ptr %t6328, i64 3
  store i64 %a2, ptr %t6333
  %t6334 = getelementptr i64, ptr %t6328, i64 4
  store i64 %t6282, ptr %t6334
  %t6335 = getelementptr i64, ptr %t6328, i64 5
  store i64 %t6330, ptr %t6335
  %t6336 = or i64 %t6288, %t6282
  %t6337 = and i64 %t6336, 7
  %t6338 = icmp eq i64 %t6337, 0
  br i1 %t6338, label %fixfast1342, label %fixslow1343
fixfast1342:
  %t6339 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6288, i64 %t6282)
  %t6340 = extractvalue {i64, i1} %t6339, 0
  %t6341 = extractvalue {i64, i1} %t6339, 1
  br i1 %t6341, label %fixslow1343, label %fixmerge1344
fixslow1343:
  %t6342 = call i64 @rt_sub(i64 %t6288, i64 %t6282)
  br label %fixmerge1344
fixmerge1344:
  %t6343 = phi i64 [ %t6340, %fixfast1342 ], [ %t6342, %fixslow1343 ]
  %t6344 = or i64 %t6343, 8
  %t6345 = and i64 %t6344, 7
  %t6346 = icmp eq i64 %t6345, 0
  br i1 %t6346, label %fixfast1345, label %fixslow1346
fixfast1345:
  %t6347 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6343, i64 8)
  %t6348 = extractvalue {i64, i1} %t6347, 0
  %t6349 = extractvalue {i64, i1} %t6347, 1
  br i1 %t6349, label %fixslow1346, label %fixmerge1347
fixslow1346:
  %t6350 = call i64 @rt_sub(i64 %t6343, i64 8)
  br label %fixmerge1347
fixmerge1347:
  %t6351 = phi i64 [ %t6348, %fixfast1345 ], [ %t6350, %fixslow1346 ]
  %t6352 = musttail call fastcc i64 @"scheme.base:code_1024"(i64 %t6330, i64 1, i64 %t6351, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6352
else1341:
  %t6353 = call ptr @rt_alloc_words(i64 7)
  %t6354 = ptrtoint ptr %t6353 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1026" to i64), ptr %t6353
  %t6355 = or i64 %t6354, 4
  %t6356 = getelementptr i64, ptr %t6353, i64 1
  store i64 %t6288, ptr %t6356
  %t6357 = getelementptr i64, ptr %t6353, i64 2
  store i64 %t6282, ptr %t6357
  %t6358 = getelementptr i64, ptr %t6353, i64 3
  store i64 %a0, ptr %t6358
  %t6359 = getelementptr i64, ptr %t6353, i64 4
  store i64 %a1, ptr %t6359
  %t6360 = getelementptr i64, ptr %t6353, i64 5
  store i64 %a2, ptr %t6360
  %t6361 = getelementptr i64, ptr %t6353, i64 6
  store i64 %t6355, ptr %t6361
  %t6362 = musttail call fastcc i64 @"scheme.base:code_1026"(i64 %t6355, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6362
}

define fastcc i64 @"scheme.base:code_1044"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6367 = icmp eq i64 %argc, 1
  br i1 %t6367, label %argok1349, label %arityerr1348
arityerr1348:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1349:
  %t6368 = and i64 %self, -8
  %t6369 = inttoptr i64 %t6368 to ptr
  %t6370 = getelementptr i64, ptr %t6369, i64 1
  %t6371 = load i64, ptr %t6370
  %t6372 = or i64 %a0, %t6371
  %t6373 = and i64 %t6372, 7
  %t6374 = icmp eq i64 %t6373, 0
  br i1 %t6374, label %fixfast1350, label %fixslow1351
fixfast1350:
  %t6375 = icmp eq i64 %a0, %t6371
  %t6376 = select i1 %t6375, i64 257, i64 1
  br label %fixmerge1352
fixslow1351:
  %t6377 = call i64 @rt_num_eq(i64 %a0, i64 %t6371)
  br label %fixmerge1352
fixmerge1352:
  %t6378 = phi i64 [ %t6376, %fixfast1350 ], [ %t6377, %fixslow1351 ]
  %t6379 = icmp ne i64 %t6378, 1
  br i1 %t6379, label %then1353, label %else1354
then1353:
  %t6380 = and i64 %self, -8
  %t6381 = inttoptr i64 %t6380 to ptr
  %t6382 = getelementptr i64, ptr %t6381, i64 3
  %t6383 = load i64, ptr %t6382
  %t6384 = call i64 @rt_cdr(i64 %t6383)
  %t6385 = and i64 %self, -8
  %t6386 = inttoptr i64 %t6385 to ptr
  %t6387 = getelementptr i64, ptr %t6386, i64 4
  %t6388 = load i64, ptr %t6387
  %t6389 = and i64 %self, -8
  %t6390 = inttoptr i64 %t6389 to ptr
  %t6391 = getelementptr i64, ptr %t6390, i64 1
  %t6392 = load i64, ptr %t6391
  %t6393 = or i64 %t6388, %t6392
  %t6394 = and i64 %t6393, 7
  %t6395 = icmp eq i64 %t6394, 0
  br i1 %t6395, label %fixfast1355, label %fixslow1356
fixfast1355:
  %t6396 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6388, i64 %t6392)
  %t6397 = extractvalue {i64, i1} %t6396, 0
  %t6398 = extractvalue {i64, i1} %t6396, 1
  br i1 %t6398, label %fixslow1356, label %fixmerge1357
fixslow1356:
  %t6399 = call i64 @rt_add(i64 %t6388, i64 %t6392)
  br label %fixmerge1357
fixmerge1357:
  %t6400 = phi i64 [ %t6397, %fixfast1355 ], [ %t6399, %fixslow1356 ]
  %t6401 = and i64 %self, -8
  %t6402 = inttoptr i64 %t6401 to ptr
  %t6403 = getelementptr i64, ptr %t6402, i64 2
  %t6404 = load i64, ptr %t6403
  %t6405 = musttail call fastcc i64 @"scheme.base:code_1042"(i64 %t6404, i64 2, i64 %t6384, i64 %t6400, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6405
else1354:
  %t6406 = and i64 %self, -8
  %t6407 = inttoptr i64 %t6406 to ptr
  %t6408 = getelementptr i64, ptr %t6407, i64 5
  %t6409 = load i64, ptr %t6408
  %t6410 = and i64 %self, -8
  %t6411 = inttoptr i64 %t6410 to ptr
  %t6412 = getelementptr i64, ptr %t6411, i64 4
  %t6413 = load i64, ptr %t6412
  %t6414 = or i64 %t6413, %a0
  %t6415 = and i64 %t6414, 7
  %t6416 = icmp eq i64 %t6415, 0
  br i1 %t6416, label %fixfast1358, label %fixslow1359
fixfast1358:
  %t6417 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6413, i64 %a0)
  %t6418 = extractvalue {i64, i1} %t6417, 0
  %t6419 = extractvalue {i64, i1} %t6417, 1
  br i1 %t6419, label %fixslow1359, label %fixmerge1360
fixslow1359:
  %t6420 = call i64 @rt_add(i64 %t6413, i64 %a0)
  br label %fixmerge1360
fixmerge1360:
  %t6421 = phi i64 [ %t6418, %fixfast1358 ], [ %t6420, %fixslow1359 ]
  %t6422 = and i64 %self, -8
  %t6423 = inttoptr i64 %t6422 to ptr
  %t6424 = getelementptr i64, ptr %t6423, i64 6
  %t6425 = load i64, ptr %t6424
  %t6426 = call i64 @rt_bytevector_u8_ref(i64 %t6425, i64 %a0)
  %t6427 = call i64 @rt_bytevector_u8_set(i64 %t6409, i64 %t6421, i64 %t6426)
  %t6428 = or i64 %a0, 8
  %t6429 = and i64 %t6428, 7
  %t6430 = icmp eq i64 %t6429, 0
  br i1 %t6430, label %fixfast1361, label %fixslow1362
fixfast1361:
  %t6431 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t6432 = extractvalue {i64, i1} %t6431, 0
  %t6433 = extractvalue {i64, i1} %t6431, 1
  br i1 %t6433, label %fixslow1362, label %fixmerge1363
fixslow1362:
  %t6434 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1363
fixmerge1363:
  %t6435 = phi i64 [ %t6432, %fixfast1361 ], [ %t6434, %fixslow1362 ]
  %t6436 = musttail call fastcc i64 @"scheme.base:code_1044"(i64 %self, i64 1, i64 %t6435, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6436
}

define fastcc i64 @"scheme.base:code_1042"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6437 = icmp eq i64 %argc, 2
  br i1 %t6437, label %argok1365, label %arityerr1364
arityerr1364:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1365:
  %t6438 = call i64 @rt_null_p(i64 %a0)
  %t6439 = icmp ne i64 %t6438, 1
  br i1 %t6439, label %then1366, label %else1367
then1366:
  %t6440 = and i64 %self, -8
  %t6441 = inttoptr i64 %t6440 to ptr
  %t6442 = getelementptr i64, ptr %t6441, i64 1
  %t6443 = load i64, ptr %t6442
  ret i64 %t6443
else1367:
  %t6444 = call i64 @rt_car(i64 %a0)
  %t6445 = call i64 @rt_bytevector_length(i64 %t6444)
  %t6446 = call ptr @rt_alloc_words(i64 8)
  %t6447 = ptrtoint ptr %t6446 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1044" to i64), ptr %t6446
  %t6448 = or i64 %t6447, 4
  %t6449 = getelementptr i64, ptr %t6446, i64 1
  store i64 %t6445, ptr %t6449
  %t6450 = and i64 %self, -8
  %t6451 = inttoptr i64 %t6450 to ptr
  %t6452 = getelementptr i64, ptr %t6451, i64 2
  %t6453 = load i64, ptr %t6452
  %t6454 = getelementptr i64, ptr %t6446, i64 2
  store i64 %t6453, ptr %t6454
  %t6455 = getelementptr i64, ptr %t6446, i64 3
  store i64 %a0, ptr %t6455
  %t6456 = getelementptr i64, ptr %t6446, i64 4
  store i64 %a1, ptr %t6456
  %t6457 = and i64 %self, -8
  %t6458 = inttoptr i64 %t6457 to ptr
  %t6459 = getelementptr i64, ptr %t6458, i64 1
  %t6460 = load i64, ptr %t6459
  %t6461 = getelementptr i64, ptr %t6446, i64 5
  store i64 %t6460, ptr %t6461
  %t6462 = getelementptr i64, ptr %t6446, i64 6
  store i64 %t6444, ptr %t6462
  %t6463 = getelementptr i64, ptr %t6446, i64 7
  store i64 %t6448, ptr %t6463
  %t6464 = musttail call fastcc i64 @"scheme.base:code_1044"(i64 %t6448, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6464
}

define fastcc i64 @"scheme.base:code:bytevector-append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6465 = icmp sge i64 %argc, 0
  br i1 %t6465, label %argok1369, label %arityerr1368
arityerr1368:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1369:
  %t6466 = call ptr @rt_alloc_words(i64 8)
  %t6467 = getelementptr i64, ptr %t6466, i64 0
  store i64 %a0, ptr %t6467
  %t6468 = getelementptr i64, ptr %t6466, i64 1
  store i64 %a1, ptr %t6468
  %t6469 = getelementptr i64, ptr %t6466, i64 2
  store i64 %a2, ptr %t6469
  %t6470 = getelementptr i64, ptr %t6466, i64 3
  store i64 %a3, ptr %t6470
  %t6471 = getelementptr i64, ptr %t6466, i64 4
  store i64 %a4, ptr %t6471
  %t6472 = getelementptr i64, ptr %t6466, i64 5
  store i64 %a5, ptr %t6472
  %t6473 = getelementptr i64, ptr %t6466, i64 6
  store i64 %a6, ptr %t6473
  %t6474 = getelementptr i64, ptr %t6466, i64 7
  store i64 %a7, ptr %t6474
  %t6475 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t6466, ptr %overflow)
  %t6476 = load i64, ptr @"scheme.base:bv-total"
  call void @rt_check_callable(i64 %t6476)
  %t6477 = and i64 %t6476, -8
  %t6478 = inttoptr i64 %t6477 to ptr
  %t6479 = load i64, ptr %t6478
  %t6480 = inttoptr i64 %t6479 to ptr
  %t6481 = call fastcc i64%t6480(i64 %t6476, i64 1, i64 %t6475, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6482 = call i64 @rt_make_bytevector(i64 %t6481, i64 0)
  %t6483 = call ptr @rt_alloc_words(i64 3)
  %t6484 = ptrtoint ptr %t6483 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1042" to i64), ptr %t6483
  %t6485 = or i64 %t6484, 4
  %t6486 = getelementptr i64, ptr %t6483, i64 1
  store i64 %t6482, ptr %t6486
  %t6487 = getelementptr i64, ptr %t6483, i64 2
  store i64 %t6485, ptr %t6487
  %t6488 = musttail call fastcc i64 @"scheme.base:code_1042"(i64 %t6485, i64 2, i64 %t6475, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6488
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cbytevector-append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6489 = load i64, ptr @"scheme.base:bv-total"
  call void @rt_check_callable(i64 %t6489)
  %t6490 = and i64 %t6489, -8
  %t6491 = inttoptr i64 %t6490 to ptr
  %t6492 = load i64, ptr %t6491
  %t6493 = inttoptr i64 %t6492 to ptr
  %t6494 = call fastcc i64%t6493(i64 %t6489, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6495 = call i64 @rt_make_bytevector(i64 %t6494, i64 0)
  %t6496 = call ptr @rt_alloc_words(i64 3)
  %t6497 = ptrtoint ptr %t6496 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1042" to i64), ptr %t6496
  %t6498 = or i64 %t6497, 4
  %t6499 = getelementptr i64, ptr %t6496, i64 1
  store i64 %t6495, ptr %t6499
  %t6500 = getelementptr i64, ptr %t6496, i64 2
  store i64 %t6498, ptr %t6500
  %t6501 = musttail call fastcc i64 @"scheme.base:code_1042"(i64 %t6498, i64 2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6501
}

define fastcc i64 @"scheme.base:code:bv-total"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6506 = icmp eq i64 %argc, 1
  br i1 %t6506, label %argok1371, label %arityerr1370
arityerr1370:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1371:
  %t6507 = call i64 @rt_null_p(i64 %a0)
  %t6508 = icmp ne i64 %t6507, 1
  br i1 %t6508, label %then1372, label %else1373
then1372:
  ret i64 0
else1373:
  %t6509 = call i64 @rt_car(i64 %a0)
  %t6510 = call i64 @rt_bytevector_length(i64 %t6509)
  %t6511 = call i64 @rt_cdr(i64 %a0)
  %t6512 = load i64, ptr @"scheme.base:bv-total"
  call void @rt_check_callable(i64 %t6512)
  %t6513 = and i64 %t6512, -8
  %t6514 = inttoptr i64 %t6513 to ptr
  %t6515 = load i64, ptr %t6514
  %t6516 = inttoptr i64 %t6515 to ptr
  %t6517 = call fastcc i64%t6516(i64 %t6512, i64 1, i64 %t6511, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6518 = or i64 %t6510, %t6517
  %t6519 = and i64 %t6518, 7
  %t6520 = icmp eq i64 %t6519, 0
  br i1 %t6520, label %fixfast1374, label %fixslow1375
fixfast1374:
  %t6521 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6510, i64 %t6517)
  %t6522 = extractvalue {i64, i1} %t6521, 0
  %t6523 = extractvalue {i64, i1} %t6521, 1
  br i1 %t6523, label %fixslow1375, label %fixmerge1376
fixslow1375:
  %t6524 = call i64 @rt_add(i64 %t6510, i64 %t6517)
  br label %fixmerge1376
fixmerge1376:
  %t6525 = phi i64 [ %t6522, %fixfast1374 ], [ %t6524, %fixslow1375 ]
  ret i64 %t6525
}

define fastcc i64 @"scheme.base:code:rationalize"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6531 = icmp eq i64 %argc, 2
  br i1 %t6531, label %argok1378, label %arityerr1377
arityerr1377:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1378:
  %t6532 = load i64, ptr @"scheme.base:abs"
  call void @rt_check_callable(i64 %t6532)
  %t6533 = and i64 %t6532, -8
  %t6534 = inttoptr i64 %t6533 to ptr
  %t6535 = load i64, ptr %t6534
  %t6536 = inttoptr i64 %t6535 to ptr
  %t6537 = call fastcc i64%t6536(i64 %t6532, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6538 = or i64 %a0, %t6537
  %t6539 = and i64 %t6538, 7
  %t6540 = icmp eq i64 %t6539, 0
  br i1 %t6540, label %fixfast1379, label %fixslow1380
fixfast1379:
  %t6541 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t6537)
  %t6542 = extractvalue {i64, i1} %t6541, 0
  %t6543 = extractvalue {i64, i1} %t6541, 1
  br i1 %t6543, label %fixslow1380, label %fixmerge1381
fixslow1380:
  %t6544 = call i64 @rt_sub(i64 %a0, i64 %t6537)
  br label %fixmerge1381
fixmerge1381:
  %t6545 = phi i64 [ %t6542, %fixfast1379 ], [ %t6544, %fixslow1380 ]
  %t6546 = load i64, ptr @"scheme.base:abs"
  call void @rt_check_callable(i64 %t6546)
  %t6547 = and i64 %t6546, -8
  %t6548 = inttoptr i64 %t6547 to ptr
  %t6549 = load i64, ptr %t6548
  %t6550 = inttoptr i64 %t6549 to ptr
  %t6551 = call fastcc i64%t6550(i64 %t6546, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6552 = or i64 %a0, %t6551
  %t6553 = and i64 %t6552, 7
  %t6554 = icmp eq i64 %t6553, 0
  br i1 %t6554, label %fixfast1382, label %fixslow1383
fixfast1382:
  %t6555 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 %t6551)
  %t6556 = extractvalue {i64, i1} %t6555, 0
  %t6557 = extractvalue {i64, i1} %t6555, 1
  br i1 %t6557, label %fixslow1383, label %fixmerge1384
fixslow1383:
  %t6558 = call i64 @rt_add(i64 %a0, i64 %t6551)
  br label %fixmerge1384
fixmerge1384:
  %t6559 = phi i64 [ %t6556, %fixfast1382 ], [ %t6558, %fixslow1383 ]
  %t6560 = call i64 @rt_exact_p(i64 %a0)
  %t6561 = icmp ne i64 %t6560, 1
  br i1 %t6561, label %then1385, label %else1386
then1385:
  %t6562 = call i64 @rt_exact_p(i64 %a1)
  br label %merge1387
else1386:
  br label %merge1387
merge1387:
  %t6563 = phi i64 [ %t6562, %then1385 ], [ 1, %else1386 ]
  %t6564 = icmp ne i64 %t6563, 1
  br i1 %t6564, label %then1388, label %else1389
then1388:
  %t6565 = load i64, ptr @"scheme.base:rat-exact"
  call void @rt_check_callable(i64 %t6565)
  %t6566 = and i64 %t6565, -8
  %t6567 = inttoptr i64 %t6566 to ptr
  %t6568 = load i64, ptr %t6567
  %t6569 = inttoptr i64 %t6568 to ptr
  %t6570 = musttail call fastcc i64 %t6569(i64 %t6565, i64 2, i64 %t6545, i64 %t6559, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6570
else1389:
  %t6571 = call i64 @rt_exact_to_inexact(i64 %t6545)
  %t6572 = call i64 @rt_exact_to_inexact(i64 %t6559)
  %t6573 = load i64, ptr @"scheme.base:rat-inexact"
  call void @rt_check_callable(i64 %t6573)
  %t6574 = and i64 %t6573, -8
  %t6575 = inttoptr i64 %t6574 to ptr
  %t6576 = load i64, ptr %t6575
  %t6577 = inttoptr i64 %t6576 to ptr
  %t6578 = musttail call fastcc i64 %t6577(i64 %t6573, i64 2, i64 %t6571, i64 %t6572, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6578
}

define fastcc i64 @"scheme.base:code:rat-exact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6583 = icmp eq i64 %argc, 2
  br i1 %t6583, label %argok1391, label %arityerr1390
arityerr1390:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1391:
  %t6584 = or i64 %a0, 0
  %t6585 = and i64 %t6584, 7
  %t6586 = icmp eq i64 %t6585, 0
  br i1 %t6586, label %fixfast1392, label %fixslow1393
fixfast1392:
  %t6587 = icmp slt i64 %a0, 0
  %t6588 = select i1 %t6587, i64 257, i64 1
  br label %fixmerge1394
fixslow1393:
  %t6589 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge1394
fixmerge1394:
  %t6590 = phi i64 [ %t6588, %fixfast1392 ], [ %t6589, %fixslow1393 ]
  %t6591 = icmp ne i64 %t6590, 1
  br i1 %t6591, label %then1395, label %else1396
then1395:
  br label %merge1397
else1396:
  %t6592 = or i64 %a0, 0
  %t6593 = and i64 %t6592, 7
  %t6594 = icmp eq i64 %t6593, 0
  br i1 %t6594, label %fixfast1398, label %fixslow1399
fixfast1398:
  %t6595 = icmp eq i64 %a0, 0
  %t6596 = select i1 %t6595, i64 257, i64 1
  br label %fixmerge1400
fixslow1399:
  %t6597 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge1400
fixmerge1400:
  %t6598 = phi i64 [ %t6596, %fixfast1398 ], [ %t6597, %fixslow1399 ]
  br label %merge1397
merge1397:
  %t6599 = phi i64 [ 257, %then1395 ], [ %t6598, %fixmerge1400 ]
  %t6600 = icmp ne i64 %t6599, 1
  br i1 %t6600, label %then1401, label %else1402
then1401:
  %t6601 = or i64 0, %a1
  %t6602 = and i64 %t6601, 7
  %t6603 = icmp eq i64 %t6602, 0
  br i1 %t6603, label %fixfast1404, label %fixslow1405
fixfast1404:
  %t6604 = icmp slt i64 0, %a1
  %t6605 = select i1 %t6604, i64 257, i64 1
  br label %fixmerge1406
fixslow1405:
  %t6606 = call i64 @rt_lt(i64 0, i64 %a1)
  br label %fixmerge1406
fixmerge1406:
  %t6607 = phi i64 [ %t6605, %fixfast1404 ], [ %t6606, %fixslow1405 ]
  %t6608 = icmp ne i64 %t6607, 1
  br i1 %t6608, label %then1407, label %else1408
then1407:
  br label %merge1409
else1408:
  %t6609 = or i64 0, %a1
  %t6610 = and i64 %t6609, 7
  %t6611 = icmp eq i64 %t6610, 0
  br i1 %t6611, label %fixfast1410, label %fixslow1411
fixfast1410:
  %t6612 = icmp eq i64 0, %a1
  %t6613 = select i1 %t6612, i64 257, i64 1
  br label %fixmerge1412
fixslow1411:
  %t6614 = call i64 @rt_num_eq(i64 0, i64 %a1)
  br label %fixmerge1412
fixmerge1412:
  %t6615 = phi i64 [ %t6613, %fixfast1410 ], [ %t6614, %fixslow1411 ]
  br label %merge1409
merge1409:
  %t6616 = phi i64 [ 257, %then1407 ], [ %t6615, %fixmerge1412 ]
  br label %merge1403
else1402:
  br label %merge1403
merge1403:
  %t6617 = phi i64 [ %t6616, %merge1409 ], [ 1, %else1402 ]
  %t6618 = icmp ne i64 %t6617, 1
  br i1 %t6618, label %then1413, label %else1414
then1413:
  ret i64 0
else1414:
  %t6619 = or i64 0, %a0
  %t6620 = and i64 %t6619, 7
  %t6621 = icmp eq i64 %t6620, 0
  br i1 %t6621, label %fixfast1415, label %fixslow1416
fixfast1415:
  %t6622 = icmp slt i64 0, %a0
  %t6623 = select i1 %t6622, i64 257, i64 1
  br label %fixmerge1417
fixslow1416:
  %t6624 = call i64 @rt_lt(i64 0, i64 %a0)
  br label %fixmerge1417
fixmerge1417:
  %t6625 = phi i64 [ %t6623, %fixfast1415 ], [ %t6624, %fixslow1416 ]
  %t6626 = icmp ne i64 %t6625, 1
  br i1 %t6626, label %then1418, label %else1419
then1418:
  %t6627 = load i64, ptr @"scheme.base:rat-ceil"
  call void @rt_check_callable(i64 %t6627)
  %t6628 = and i64 %t6627, -8
  %t6629 = inttoptr i64 %t6628 to ptr
  %t6630 = load i64, ptr %t6629
  %t6631 = inttoptr i64 %t6630 to ptr
  %t6632 = call fastcc i64%t6631(i64 %t6627, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6633 = or i64 %t6632, %a1
  %t6634 = and i64 %t6633, 7
  %t6635 = icmp eq i64 %t6634, 0
  br i1 %t6635, label %fixfast1420, label %fixslow1421
fixfast1420:
  %t6636 = icmp slt i64 %t6632, %a1
  %t6637 = select i1 %t6636, i64 257, i64 1
  br label %fixmerge1422
fixslow1421:
  %t6638 = call i64 @rt_lt(i64 %t6632, i64 %a1)
  br label %fixmerge1422
fixmerge1422:
  %t6639 = phi i64 [ %t6637, %fixfast1420 ], [ %t6638, %fixslow1421 ]
  %t6640 = icmp ne i64 %t6639, 1
  br i1 %t6640, label %then1423, label %else1424
then1423:
  br label %merge1425
else1424:
  %t6641 = or i64 %t6632, %a1
  %t6642 = and i64 %t6641, 7
  %t6643 = icmp eq i64 %t6642, 0
  br i1 %t6643, label %fixfast1426, label %fixslow1427
fixfast1426:
  %t6644 = icmp eq i64 %t6632, %a1
  %t6645 = select i1 %t6644, i64 257, i64 1
  br label %fixmerge1428
fixslow1427:
  %t6646 = call i64 @rt_num_eq(i64 %t6632, i64 %a1)
  br label %fixmerge1428
fixmerge1428:
  %t6647 = phi i64 [ %t6645, %fixfast1426 ], [ %t6646, %fixslow1427 ]
  br label %merge1425
merge1425:
  %t6648 = phi i64 [ 257, %then1423 ], [ %t6647, %fixmerge1428 ]
  %t6649 = icmp ne i64 %t6648, 1
  br i1 %t6649, label %then1429, label %else1430
then1429:
  %t6650 = load i64, ptr @"scheme.base:rat-ceil"
  call void @rt_check_callable(i64 %t6650)
  %t6651 = and i64 %t6650, -8
  %t6652 = inttoptr i64 %t6651 to ptr
  %t6653 = load i64, ptr %t6652
  %t6654 = inttoptr i64 %t6653 to ptr
  %t6655 = musttail call fastcc i64 %t6654(i64 %t6650, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6655
else1430:
  %t6656 = call i64 @rt_make_string(ptr @.str.lit.31, i64 69)
  %t6657 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6657)
  %t6658 = and i64 %t6657, -8
  %t6659 = inttoptr i64 %t6658 to ptr
  %t6660 = load i64, ptr %t6659
  %t6661 = inttoptr i64 %t6660 to ptr
  %t6662 = musttail call fastcc i64 %t6661(i64 %t6657, i64 3, i64 %t6656, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6662
else1419:
  %t6663 = load i64, ptr @"scheme.base:rat-floor"
  call void @rt_check_callable(i64 %t6663)
  %t6664 = and i64 %t6663, -8
  %t6665 = inttoptr i64 %t6664 to ptr
  %t6666 = load i64, ptr %t6665
  %t6667 = inttoptr i64 %t6666 to ptr
  %t6668 = call fastcc i64%t6667(i64 %t6663, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6669 = or i64 %a0, %t6668
  %t6670 = and i64 %t6669, 7
  %t6671 = icmp eq i64 %t6670, 0
  br i1 %t6671, label %fixfast1431, label %fixslow1432
fixfast1431:
  %t6672 = icmp slt i64 %a0, %t6668
  %t6673 = select i1 %t6672, i64 257, i64 1
  br label %fixmerge1433
fixslow1432:
  %t6674 = call i64 @rt_lt(i64 %a0, i64 %t6668)
  br label %fixmerge1433
fixmerge1433:
  %t6675 = phi i64 [ %t6673, %fixfast1431 ], [ %t6674, %fixslow1432 ]
  %t6676 = icmp ne i64 %t6675, 1
  br i1 %t6676, label %then1434, label %else1435
then1434:
  br label %merge1436
else1435:
  %t6677 = or i64 %a0, %t6668
  %t6678 = and i64 %t6677, 7
  %t6679 = icmp eq i64 %t6678, 0
  br i1 %t6679, label %fixfast1437, label %fixslow1438
fixfast1437:
  %t6680 = icmp eq i64 %a0, %t6668
  %t6681 = select i1 %t6680, i64 257, i64 1
  br label %fixmerge1439
fixslow1438:
  %t6682 = call i64 @rt_num_eq(i64 %a0, i64 %t6668)
  br label %fixmerge1439
fixmerge1439:
  %t6683 = phi i64 [ %t6681, %fixfast1437 ], [ %t6682, %fixslow1438 ]
  br label %merge1436
merge1436:
  %t6684 = phi i64 [ 257, %then1434 ], [ %t6683, %fixmerge1439 ]
  %t6685 = icmp ne i64 %t6684, 1
  br i1 %t6685, label %then1440, label %else1441
then1440:
  %t6686 = load i64, ptr @"scheme.base:rat-floor"
  call void @rt_check_callable(i64 %t6686)
  %t6687 = and i64 %t6686, -8
  %t6688 = inttoptr i64 %t6687 to ptr
  %t6689 = load i64, ptr %t6688
  %t6690 = inttoptr i64 %t6689 to ptr
  %t6691 = musttail call fastcc i64 %t6690(i64 %t6686, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6691
else1441:
  %t6692 = call i64 @rt_make_string(ptr @.str.lit.32, i64 69)
  %t6693 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6693)
  %t6694 = and i64 %t6693, -8
  %t6695 = inttoptr i64 %t6694 to ptr
  %t6696 = load i64, ptr %t6695
  %t6697 = inttoptr i64 %t6696 to ptr
  %t6698 = musttail call fastcc i64 %t6697(i64 %t6693, i64 3, i64 %t6692, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6698
}

define fastcc i64 @"scheme.base:code:rat-ceil"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6703 = icmp eq i64 %argc, 1
  br i1 %t6703, label %argok1443, label %arityerr1442
arityerr1442:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1443:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:rat-floor"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6708 = icmp eq i64 %argc, 1
  br i1 %t6708, label %argok1445, label %arityerr1444
arityerr1444:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1445:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_1098"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6713 = icmp eq i64 %argc, 1
  br i1 %t6713, label %argok1447, label %arityerr1446
arityerr1446:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1447:
  %t6714 = load i64, ptr @"scheme.base:rat-max-denom"
  %t6715 = or i64 %t6714, %a0
  %t6716 = and i64 %t6715, 7
  %t6717 = icmp eq i64 %t6716, 0
  br i1 %t6717, label %fixfast1448, label %fixslow1449
fixfast1448:
  %t6718 = icmp slt i64 %t6714, %a0
  %t6719 = select i1 %t6718, i64 257, i64 1
  br label %fixmerge1450
fixslow1449:
  %t6720 = call i64 @rt_lt(i64 %t6714, i64 %a0)
  br label %fixmerge1450
fixmerge1450:
  %t6721 = phi i64 [ %t6719, %fixfast1448 ], [ %t6720, %fixslow1449 ]
  %t6722 = icmp ne i64 %t6721, 1
  br i1 %t6722, label %then1451, label %else1452
then1451:
  %t6723 = call i64 @rt_make_string(ptr @.str.lit.33, i64 59)
  %t6724 = and i64 %self, -8
  %t6725 = inttoptr i64 %t6724 to ptr
  %t6726 = getelementptr i64, ptr %t6725, i64 1
  %t6727 = load i64, ptr %t6726
  %t6728 = and i64 %self, -8
  %t6729 = inttoptr i64 %t6728 to ptr
  %t6730 = getelementptr i64, ptr %t6729, i64 2
  %t6731 = load i64, ptr %t6730
  %t6732 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6732)
  %t6733 = and i64 %t6732, -8
  %t6734 = inttoptr i64 %t6733 to ptr
  %t6735 = load i64, ptr %t6734
  %t6736 = inttoptr i64 %t6735 to ptr
  %t6737 = musttail call fastcc i64 %t6736(i64 %t6732, i64 3, i64 %t6723, i64 %t6727, i64 %t6731, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6737
else1452:
  %t6738 = and i64 %self, -8
  %t6739 = inttoptr i64 %t6738 to ptr
  %t6740 = getelementptr i64, ptr %t6739, i64 1
  %t6741 = load i64, ptr %t6740
  %t6742 = or i64 %t6741, %a0
  %t6743 = and i64 %t6742, 7
  %t6744 = icmp eq i64 %t6743, 0
  br i1 %t6744, label %fixfast1453, label %fixslow1454
fixfast1453:
  %t6745 = ashr i64 %t6741, 3
  %t6746 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t6745, i64 %a0)
  %t6747 = extractvalue {i64, i1} %t6746, 0
  %t6748 = extractvalue {i64, i1} %t6746, 1
  br i1 %t6748, label %fixslow1454, label %fixmerge1455
fixslow1454:
  %t6749 = call i64 @rt_mul(i64 %t6741, i64 %a0)
  br label %fixmerge1455
fixmerge1455:
  %t6750 = phi i64 [ %t6747, %fixfast1453 ], [ %t6749, %fixslow1454 ]
  %t6751 = and i64 %self, -8
  %t6752 = inttoptr i64 %t6751 to ptr
  %t6753 = getelementptr i64, ptr %t6752, i64 2
  %t6754 = load i64, ptr %t6753
  %t6755 = or i64 %t6754, %a0
  %t6756 = and i64 %t6755, 7
  %t6757 = icmp eq i64 %t6756, 0
  br i1 %t6757, label %fixfast1456, label %fixslow1457
fixfast1456:
  %t6758 = ashr i64 %t6754, 3
  %t6759 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t6758, i64 %a0)
  %t6760 = extractvalue {i64, i1} %t6759, 0
  %t6761 = extractvalue {i64, i1} %t6759, 1
  br i1 %t6761, label %fixslow1457, label %fixmerge1458
fixslow1457:
  %t6762 = call i64 @rt_mul(i64 %t6754, i64 %a0)
  br label %fixmerge1458
fixmerge1458:
  %t6763 = phi i64 [ %t6760, %fixfast1456 ], [ %t6762, %fixslow1457 ]
  %t6764 = load i64, ptr @"scheme.base:rat-num-in"
  call void @rt_check_callable(i64 %t6764)
  %t6765 = and i64 %t6764, -8
  %t6766 = inttoptr i64 %t6765 to ptr
  %t6767 = load i64, ptr %t6766
  %t6768 = inttoptr i64 %t6767 to ptr
  %t6769 = call fastcc i64%t6768(i64 %t6764, i64 2, i64 %t6750, i64 %t6763, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6770 = icmp ne i64 %t6769, 1
  br i1 %t6770, label %then1459, label %else1460
then1459:
  %t6771 = call i64 @rt_exact_to_inexact(i64 %t6769)
  %t6772 = call i64 @rt_exact_to_inexact(i64 %a0)
  %t6773 = call i64 @rt_div(i64 %t6771, i64 %t6772)
  ret i64 %t6773
else1460:
  %t6774 = or i64 %a0, 8
  %t6775 = and i64 %t6774, 7
  %t6776 = icmp eq i64 %t6775, 0
  br i1 %t6776, label %fixfast1461, label %fixslow1462
fixfast1461:
  %t6777 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t6778 = extractvalue {i64, i1} %t6777, 0
  %t6779 = extractvalue {i64, i1} %t6777, 1
  br i1 %t6779, label %fixslow1462, label %fixmerge1463
fixslow1462:
  %t6780 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1463
fixmerge1463:
  %t6781 = phi i64 [ %t6778, %fixfast1461 ], [ %t6780, %fixslow1462 ]
  %t6782 = musttail call fastcc i64 @"scheme.base:code_1098"(i64 %self, i64 1, i64 %t6781, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6782
}

define fastcc i64 @"scheme.base:code:rat-inexact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6783 = icmp eq i64 %argc, 2
  br i1 %t6783, label %argok1465, label %arityerr1464
arityerr1464:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1465:
  %t6784 = call i64 @rt_flonum_lit(ptr @.flo.lit.34)
  %t6785 = or i64 %a0, %t6784
  %t6786 = and i64 %t6785, 7
  %t6787 = icmp eq i64 %t6786, 0
  br i1 %t6787, label %fixfast1466, label %fixslow1467
fixfast1466:
  %t6788 = icmp slt i64 %a0, %t6784
  %t6789 = select i1 %t6788, i64 257, i64 1
  br label %fixmerge1468
fixslow1467:
  %t6790 = call i64 @rt_lt(i64 %a0, i64 %t6784)
  br label %fixmerge1468
fixmerge1468:
  %t6791 = phi i64 [ %t6789, %fixfast1466 ], [ %t6790, %fixslow1467 ]
  %t6792 = icmp ne i64 %t6791, 1
  br i1 %t6792, label %then1469, label %else1470
then1469:
  br label %merge1471
else1470:
  %t6793 = or i64 %a0, %t6784
  %t6794 = and i64 %t6793, 7
  %t6795 = icmp eq i64 %t6794, 0
  br i1 %t6795, label %fixfast1472, label %fixslow1473
fixfast1472:
  %t6796 = icmp eq i64 %a0, %t6784
  %t6797 = select i1 %t6796, i64 257, i64 1
  br label %fixmerge1474
fixslow1473:
  %t6798 = call i64 @rt_num_eq(i64 %a0, i64 %t6784)
  br label %fixmerge1474
fixmerge1474:
  %t6799 = phi i64 [ %t6797, %fixfast1472 ], [ %t6798, %fixslow1473 ]
  br label %merge1471
merge1471:
  %t6800 = phi i64 [ 257, %then1469 ], [ %t6799, %fixmerge1474 ]
  %t6801 = icmp ne i64 %t6800, 1
  br i1 %t6801, label %then1475, label %else1476
then1475:
  %t6802 = call i64 @rt_flonum_lit(ptr @.flo.lit.35)
  %t6803 = or i64 %t6802, %a1
  %t6804 = and i64 %t6803, 7
  %t6805 = icmp eq i64 %t6804, 0
  br i1 %t6805, label %fixfast1478, label %fixslow1479
fixfast1478:
  %t6806 = icmp slt i64 %t6802, %a1
  %t6807 = select i1 %t6806, i64 257, i64 1
  br label %fixmerge1480
fixslow1479:
  %t6808 = call i64 @rt_lt(i64 %t6802, i64 %a1)
  br label %fixmerge1480
fixmerge1480:
  %t6809 = phi i64 [ %t6807, %fixfast1478 ], [ %t6808, %fixslow1479 ]
  %t6810 = icmp ne i64 %t6809, 1
  br i1 %t6810, label %then1481, label %else1482
then1481:
  br label %merge1483
else1482:
  %t6811 = or i64 %t6802, %a1
  %t6812 = and i64 %t6811, 7
  %t6813 = icmp eq i64 %t6812, 0
  br i1 %t6813, label %fixfast1484, label %fixslow1485
fixfast1484:
  %t6814 = icmp eq i64 %t6802, %a1
  %t6815 = select i1 %t6814, i64 257, i64 1
  br label %fixmerge1486
fixslow1485:
  %t6816 = call i64 @rt_num_eq(i64 %t6802, i64 %a1)
  br label %fixmerge1486
fixmerge1486:
  %t6817 = phi i64 [ %t6815, %fixfast1484 ], [ %t6816, %fixslow1485 ]
  br label %merge1483
merge1483:
  %t6818 = phi i64 [ 257, %then1481 ], [ %t6817, %fixmerge1486 ]
  br label %merge1477
else1476:
  br label %merge1477
merge1477:
  %t6819 = phi i64 [ %t6818, %merge1483 ], [ 1, %else1476 ]
  %t6820 = icmp ne i64 %t6819, 1
  br i1 %t6820, label %then1487, label %else1488
then1487:
  %t6821 = call i64 @rt_flonum_lit(ptr @.flo.lit.36)
  ret i64 %t6821
else1488:
  %t6822 = call ptr @rt_alloc_words(i64 4)
  %t6823 = ptrtoint ptr %t6822 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1098" to i64), ptr %t6822
  %t6824 = or i64 %t6823, 4
  %t6825 = getelementptr i64, ptr %t6822, i64 1
  store i64 %a0, ptr %t6825
  %t6826 = getelementptr i64, ptr %t6822, i64 2
  store i64 %a1, ptr %t6826
  %t6827 = getelementptr i64, ptr %t6822, i64 3
  store i64 %t6824, ptr %t6827
  %t6828 = musttail call fastcc i64 @"scheme.base:code_1098"(i64 %t6824, i64 1, i64 8, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6828
}

define fastcc i64 @"scheme.base:code:rat-num-in"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6833 = icmp eq i64 %argc, 2
  br i1 %t6833, label %argok1490, label %arityerr1489
arityerr1489:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1490:
  %t6834 = load i64, ptr @"scheme.base:rat-ceil-flo"
  call void @rt_check_callable(i64 %t6834)
  %t6835 = and i64 %t6834, -8
  %t6836 = inttoptr i64 %t6835 to ptr
  %t6837 = load i64, ptr %t6836
  %t6838 = inttoptr i64 %t6837 to ptr
  %t6839 = call fastcc i64%t6838(i64 %t6834, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6840 = call i64 @rt_exact_to_inexact(i64 %t6839)
  %t6841 = or i64 %t6840, %a1
  %t6842 = and i64 %t6841, 7
  %t6843 = icmp eq i64 %t6842, 0
  br i1 %t6843, label %fixfast1491, label %fixslow1492
fixfast1491:
  %t6844 = icmp slt i64 %t6840, %a1
  %t6845 = select i1 %t6844, i64 257, i64 1
  br label %fixmerge1493
fixslow1492:
  %t6846 = call i64 @rt_lt(i64 %t6840, i64 %a1)
  br label %fixmerge1493
fixmerge1493:
  %t6847 = phi i64 [ %t6845, %fixfast1491 ], [ %t6846, %fixslow1492 ]
  %t6848 = icmp ne i64 %t6847, 1
  br i1 %t6848, label %then1494, label %else1495
then1494:
  br label %merge1496
else1495:
  %t6849 = or i64 %t6840, %a1
  %t6850 = and i64 %t6849, 7
  %t6851 = icmp eq i64 %t6850, 0
  br i1 %t6851, label %fixfast1497, label %fixslow1498
fixfast1497:
  %t6852 = icmp eq i64 %t6840, %a1
  %t6853 = select i1 %t6852, i64 257, i64 1
  br label %fixmerge1499
fixslow1498:
  %t6854 = call i64 @rt_num_eq(i64 %t6840, i64 %a1)
  br label %fixmerge1499
fixmerge1499:
  %t6855 = phi i64 [ %t6853, %fixfast1497 ], [ %t6854, %fixslow1498 ]
  br label %merge1496
merge1496:
  %t6856 = phi i64 [ 257, %then1494 ], [ %t6855, %fixmerge1499 ]
  %t6857 = icmp ne i64 %t6856, 1
  br i1 %t6857, label %then1500, label %else1501
then1500:
  ret i64 %t6839
else1501:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rat-ceil-flo"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6862 = icmp eq i64 %argc, 1
  br i1 %t6862, label %argok1503, label %arityerr1502
arityerr1502:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1503:
  %t6863 = load i64, ptr @"scheme.base:floor"
  call void @rt_check_callable(i64 %t6863)
  %t6864 = and i64 %t6863, -8
  %t6865 = inttoptr i64 %t6864 to ptr
  %t6866 = load i64, ptr %t6865
  %t6867 = inttoptr i64 %t6866 to ptr
  %t6868 = call fastcc i64%t6867(i64 %t6863, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6869 = call i64 @rt_inexact_to_exact(i64 %t6868)
  %t6870 = call i64 @rt_exact_to_inexact(i64 %t6869)
  %t6871 = or i64 %t6870, %a0
  %t6872 = and i64 %t6871, 7
  %t6873 = icmp eq i64 %t6872, 0
  br i1 %t6873, label %fixfast1504, label %fixslow1505
fixfast1504:
  %t6874 = icmp slt i64 %t6870, %a0
  %t6875 = select i1 %t6874, i64 257, i64 1
  br label %fixmerge1506
fixslow1505:
  %t6876 = call i64 @rt_lt(i64 %t6870, i64 %a0)
  br label %fixmerge1506
fixmerge1506:
  %t6877 = phi i64 [ %t6875, %fixfast1504 ], [ %t6876, %fixslow1505 ]
  %t6878 = icmp ne i64 %t6877, 1
  br i1 %t6878, label %then1507, label %else1508
then1507:
  %t6879 = or i64 %t6869, 8
  %t6880 = and i64 %t6879, 7
  %t6881 = icmp eq i64 %t6880, 0
  br i1 %t6881, label %fixfast1509, label %fixslow1510
fixfast1509:
  %t6882 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6869, i64 8)
  %t6883 = extractvalue {i64, i1} %t6882, 0
  %t6884 = extractvalue {i64, i1} %t6882, 1
  br i1 %t6884, label %fixslow1510, label %fixmerge1511
fixslow1510:
  %t6885 = call i64 @rt_add(i64 %t6869, i64 8)
  br label %fixmerge1511
fixmerge1511:
  %t6886 = phi i64 [ %t6883, %fixfast1509 ], [ %t6885, %fixslow1510 ]
  ret i64 %t6886
else1508:
  ret i64 %t6869
}

define fastcc i64 @"scheme.base:code:values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6891 = icmp sge i64 %argc, 0
  br i1 %t6891, label %argok1513, label %arityerr1512
arityerr1512:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1513:
  %t6892 = call ptr @rt_alloc_words(i64 8)
  %t6893 = getelementptr i64, ptr %t6892, i64 0
  store i64 %a0, ptr %t6893
  %t6894 = getelementptr i64, ptr %t6892, i64 1
  store i64 %a1, ptr %t6894
  %t6895 = getelementptr i64, ptr %t6892, i64 2
  store i64 %a2, ptr %t6895
  %t6896 = getelementptr i64, ptr %t6892, i64 3
  store i64 %a3, ptr %t6896
  %t6897 = getelementptr i64, ptr %t6892, i64 4
  store i64 %a4, ptr %t6897
  %t6898 = getelementptr i64, ptr %t6892, i64 5
  store i64 %a5, ptr %t6898
  %t6899 = getelementptr i64, ptr %t6892, i64 6
  store i64 %a6, ptr %t6899
  %t6900 = getelementptr i64, ptr %t6892, i64 7
  store i64 %a7, ptr %t6900
  %t6901 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t6892, ptr %overflow)
  %t6902 = call i64 @rt_pair_p(i64 %t6901)
  %t6903 = icmp ne i64 %t6902, 1
  br i1 %t6903, label %then1514, label %else1515
then1514:
  %t6904 = call i64 @rt_cdr(i64 %t6901)
  %t6905 = call i64 @rt_null_p(i64 %t6904)
  br label %merge1516
else1515:
  br label %merge1516
merge1516:
  %t6906 = phi i64 [ %t6905, %then1514 ], [ 1, %else1515 ]
  %t6907 = icmp ne i64 %t6906, 1
  br i1 %t6907, label %then1517, label %else1518
then1517:
  %t6908 = call i64 @rt_car(i64 %t6901)
  ret i64 %t6908
else1518:
  %t6909 = call i64 @rt_list_to_mv(i64 %t6901)
  ret i64 %t6909
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvalues"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6910 = call i64 @rt_pair_p(i64 2)
  %t6911 = icmp ne i64 %t6910, 1
  br i1 %t6911, label %then1519, label %else1520
then1519:
  %t6912 = call i64 @rt_cdr(i64 2)
  %t6913 = call i64 @rt_null_p(i64 %t6912)
  br label %merge1521
else1520:
  br label %merge1521
merge1521:
  %t6914 = phi i64 [ %t6913, %then1519 ], [ 1, %else1520 ]
  %t6915 = icmp ne i64 %t6914, 1
  br i1 %t6915, label %then1522, label %else1523
then1522:
  %t6916 = call i64 @rt_car(i64 2)
  ret i64 %t6916
else1523:
  %t6917 = call i64 @rt_list_to_mv(i64 2)
  ret i64 %t6917
}

define fastcc i64 @"scheme.base:code:call-with-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6922 = icmp eq i64 %argc, 2
  br i1 %t6922, label %argok1525, label %arityerr1524
arityerr1524:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1525:
  call void @rt_check_callable(i64 %a0)
  %t6923 = and i64 %a0, -8
  %t6924 = inttoptr i64 %t6923 to ptr
  %t6925 = load i64, ptr %t6924
  %t6926 = inttoptr i64 %t6925 to ptr
  %t6927 = call fastcc i64%t6926(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6928 = call i64 @rt_mv_p(i64 %t6927)
  %t6929 = icmp ne i64 %t6928, 1
  br i1 %t6929, label %then1526, label %else1527
then1526:
  %t6930 = call i64 @rt_mv_to_list(i64 %t6927)
  call void @rt_check_callable(i64 %a1)
  %t6931 = and i64 %a1, -8
  %t6932 = inttoptr i64 %t6931 to ptr
  %t6933 = load i64, ptr %t6932
  %t6934 = inttoptr i64 %t6933 to ptr
  %t6935 = call i64 @rt_list_length(i64 %t6930)
  %t6936 = add i64 0, %t6935
  %t6937 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t6930, i64 8)
  %t6949 = getelementptr i64, ptr %t6937, i64 0
  %t6941 = load i64, ptr %t6949
  %t6950 = getelementptr i64, ptr %t6937, i64 1
  %t6942 = load i64, ptr %t6950
  %t6951 = getelementptr i64, ptr %t6937, i64 2
  %t6943 = load i64, ptr %t6951
  %t6952 = getelementptr i64, ptr %t6937, i64 3
  %t6944 = load i64, ptr %t6952
  %t6953 = getelementptr i64, ptr %t6937, i64 4
  %t6945 = load i64, ptr %t6953
  %t6954 = getelementptr i64, ptr %t6937, i64 5
  %t6946 = load i64, ptr %t6954
  %t6955 = getelementptr i64, ptr %t6937, i64 6
  %t6947 = load i64, ptr %t6955
  %t6956 = getelementptr i64, ptr %t6937, i64 7
  %t6948 = load i64, ptr %t6956
  %t6938 = icmp sgt i64 %t6936, 8
  %t6939 = getelementptr i64, ptr %t6937, i64 8
  %t6940 = select i1 %t6938, ptr %t6939, ptr null
  %t6957 = musttail call fastcc i64 %t6934(i64 %a1, i64 %t6936, i64 %t6941, i64 %t6942, i64 %t6943, i64 %t6944, i64 %t6945, i64 %t6946, i64 %t6947, i64 %t6948, ptr %t6940)
  ret i64 %t6957
else1527:
  call void @rt_check_callable(i64 %a1)
  %t6958 = and i64 %a1, -8
  %t6959 = inttoptr i64 %t6958 to ptr
  %t6960 = load i64, ptr %t6959
  %t6961 = inttoptr i64 %t6960 to ptr
  %t6962 = musttail call fastcc i64 %t6961(i64 %a1, i64 1, i64 %t6927, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6962
}

define fastcc i64 @"scheme.base:code:make-hash-table"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6969 = icmp eq i64 %argc, 0
  br i1 %t6969, label %argok1529, label %arityerr1528
arityerr1528:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1529:
  %t6970 = load i64, ptr @"scheme.base:%ht-initial-buckets"
  %t6971 = call i64 @rt_make_vector(i64 %t6970, i64 2)
  %t6972 = load i64, ptr @"scheme.base:vector"
  call void @rt_check_callable(i64 %t6972)
  %t6973 = and i64 %t6972, -8
  %t6974 = inttoptr i64 %t6973 to ptr
  %t6975 = load i64, ptr %t6974
  %t6976 = inttoptr i64 %t6975 to ptr
  %t6977 = call fastcc i64%t6976(i64 %t6972, i64 3, i64 0, i64 %t6971, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6978 = call i64 @rt_make_hash_table(i64 %t6977)
  ret i64 %t6978
}

define fastcc i64 @"scheme.base:code:hash-table?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6983 = icmp eq i64 %argc, 1
  br i1 %t6983, label %argok1531, label %arityerr1530
arityerr1530:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1531:
  %t6984 = call i64 @rt_hash_table_p(i64 %a0)
  ret i64 %t6984
}

define fastcc i64 @"scheme.base:code:%ht-count"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6989 = icmp eq i64 %argc, 1
  br i1 %t6989, label %argok1533, label %arityerr1532
arityerr1532:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1533:
  %t6990 = call i64 @rt_hash_table_spine(i64 %a0)
  %t6991 = call i64 @rt_vector_ref(i64 %t6990, i64 0)
  ret i64 %t6991
}

define fastcc i64 @"scheme.base:code:%ht-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6996 = icmp eq i64 %argc, 1
  br i1 %t6996, label %argok1535, label %arityerr1534
arityerr1534:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1535:
  %t6997 = call i64 @rt_hash_table_spine(i64 %a0)
  %t6998 = call i64 @rt_vector_ref(i64 %t6997, i64 8)
  ret i64 %t6998
}

define fastcc i64 @"scheme.base:code:%ht-set-count!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7003 = icmp eq i64 %argc, 2
  br i1 %t7003, label %argok1537, label %arityerr1536
arityerr1536:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1537:
  %t7004 = call i64 @rt_hash_table_spine(i64 %a0)
  %t7005 = call i64 @rt_vector_set(i64 %t7004, i64 0, i64 %a1)
  ret i64 %t7005
}

define fastcc i64 @"scheme.base:code:%ht-set-buckets!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7010 = icmp eq i64 %argc, 2
  br i1 %t7010, label %argok1539, label %arityerr1538
arityerr1538:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1539:
  %t7011 = call i64 @rt_hash_table_spine(i64 %a0)
  %t7012 = call i64 @rt_vector_set(i64 %t7011, i64 8, i64 %a1)
  ret i64 %t7012
}

define fastcc i64 @"scheme.base:code:%ht-index"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7017 = icmp eq i64 %argc, 2
  br i1 %t7017, label %argok1541, label %arityerr1540
arityerr1540:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1541:
  %t7018 = call i64 @rt_hash(i64 %a0)
  %t7019 = call i64 @rt_remainder(i64 %t7018, i64 %a1)
  ret i64 %t7019
}

define fastcc i64 @"scheme.base:code:%ht-assoc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7024 = icmp eq i64 %argc, 2
  br i1 %t7024, label %argok1543, label %arityerr1542
arityerr1542:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1543:
  %t7025 = call i64 @rt_null_p(i64 %a1)
  %t7026 = icmp ne i64 %t7025, 1
  br i1 %t7026, label %then1544, label %else1545
then1544:
  ret i64 1
else1545:
  %t7027 = call i64 @rt_car(i64 %a1)
  %t7028 = call i64 @rt_car(i64 %t7027)
  %t7029 = call i64 @rt_equal(i64 %a0, i64 %t7028)
  %t7030 = icmp ne i64 %t7029, 1
  br i1 %t7030, label %then1546, label %else1547
then1546:
  %t7031 = call i64 @rt_car(i64 %a1)
  ret i64 %t7031
else1547:
  %t7032 = call i64 @rt_cdr(i64 %a1)
  %t7033 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t7033)
  %t7034 = and i64 %t7033, -8
  %t7035 = inttoptr i64 %t7034 to ptr
  %t7036 = load i64, ptr %t7035
  %t7037 = inttoptr i64 %t7036 to ptr
  %t7038 = musttail call fastcc i64 %t7037(i64 %t7033, i64 2, i64 %a0, i64 %t7032, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7038
}

define fastcc i64 @"scheme.base:code:%ht-remove"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7043 = icmp eq i64 %argc, 2
  br i1 %t7043, label %argok1549, label %arityerr1548
arityerr1548:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1549:
  %t7044 = call i64 @rt_null_p(i64 %a1)
  %t7045 = icmp ne i64 %t7044, 1
  br i1 %t7045, label %then1550, label %else1551
then1550:
  ret i64 2
else1551:
  %t7046 = call i64 @rt_car(i64 %a1)
  %t7047 = call i64 @rt_car(i64 %t7046)
  %t7048 = call i64 @rt_equal(i64 %a0, i64 %t7047)
  %t7049 = icmp ne i64 %t7048, 1
  br i1 %t7049, label %then1552, label %else1553
then1552:
  %t7050 = call i64 @rt_cdr(i64 %a1)
  ret i64 %t7050
else1553:
  %t7051 = call i64 @rt_car(i64 %a1)
  %t7052 = call i64 @rt_cdr(i64 %a1)
  %t7053 = load i64, ptr @"scheme.base:%ht-remove"
  call void @rt_check_callable(i64 %t7053)
  %t7054 = and i64 %t7053, -8
  %t7055 = inttoptr i64 %t7054 to ptr
  %t7056 = load i64, ptr %t7055
  %t7057 = inttoptr i64 %t7056 to ptr
  %t7058 = call fastcc i64%t7057(i64 %t7053, i64 2, i64 %a0, i64 %t7052, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7059 = call i64 @rt_cons(i64 %t7051, i64 %t7058)
  ret i64 %t7059
}

define fastcc i64 @"scheme.base:code:hash-table-ref/default"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7064 = icmp eq i64 %argc, 3
  br i1 %t7064, label %argok1555, label %arityerr1554
arityerr1554:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1555:
  %t7065 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7065)
  %t7066 = and i64 %t7065, -8
  %t7067 = inttoptr i64 %t7066 to ptr
  %t7068 = load i64, ptr %t7067
  %t7069 = inttoptr i64 %t7068 to ptr
  %t7070 = call fastcc i64%t7069(i64 %t7065, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7071 = call i64 @rt_vector_length(i64 %t7070)
  %t7072 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t7072)
  %t7073 = and i64 %t7072, -8
  %t7074 = inttoptr i64 %t7073 to ptr
  %t7075 = load i64, ptr %t7074
  %t7076 = inttoptr i64 %t7075 to ptr
  %t7077 = call fastcc i64%t7076(i64 %t7072, i64 2, i64 %a1, i64 %t7071, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7078 = call i64 @rt_vector_ref(i64 %t7070, i64 %t7077)
  %t7079 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t7079)
  %t7080 = and i64 %t7079, -8
  %t7081 = inttoptr i64 %t7080 to ptr
  %t7082 = load i64, ptr %t7081
  %t7083 = inttoptr i64 %t7082 to ptr
  %t7084 = call fastcc i64%t7083(i64 %t7079, i64 2, i64 %a1, i64 %t7078, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7085 = icmp ne i64 %t7084, 1
  br i1 %t7085, label %then1556, label %else1557
then1556:
  %t7086 = call i64 @rt_cdr(i64 %t7084)
  ret i64 %t7086
else1557:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:hash-table-contains?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7091 = icmp eq i64 %argc, 2
  br i1 %t7091, label %argok1559, label %arityerr1558
arityerr1558:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1559:
  %t7092 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7092)
  %t7093 = and i64 %t7092, -8
  %t7094 = inttoptr i64 %t7093 to ptr
  %t7095 = load i64, ptr %t7094
  %t7096 = inttoptr i64 %t7095 to ptr
  %t7097 = call fastcc i64%t7096(i64 %t7092, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7098 = call i64 @rt_vector_length(i64 %t7097)
  %t7099 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t7099)
  %t7100 = and i64 %t7099, -8
  %t7101 = inttoptr i64 %t7100 to ptr
  %t7102 = load i64, ptr %t7101
  %t7103 = inttoptr i64 %t7102 to ptr
  %t7104 = call fastcc i64%t7103(i64 %t7099, i64 2, i64 %a1, i64 %t7098, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7105 = call i64 @rt_vector_ref(i64 %t7097, i64 %t7104)
  %t7106 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t7106)
  %t7107 = and i64 %t7106, -8
  %t7108 = inttoptr i64 %t7107 to ptr
  %t7109 = load i64, ptr %t7108
  %t7110 = inttoptr i64 %t7109 to ptr
  %t7111 = call fastcc i64%t7110(i64 %t7106, i64 2, i64 %a1, i64 %t7105, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7112 = icmp ne i64 %t7111, 1
  br i1 %t7112, label %then1560, label %else1561
then1560:
  ret i64 257
else1561:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-ref"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7117 = icmp eq i64 %argc, 2
  br i1 %t7117, label %argok1563, label %arityerr1562
arityerr1562:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1563:
  %t7118 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7118)
  %t7119 = and i64 %t7118, -8
  %t7120 = inttoptr i64 %t7119 to ptr
  %t7121 = load i64, ptr %t7120
  %t7122 = inttoptr i64 %t7121 to ptr
  %t7123 = call fastcc i64%t7122(i64 %t7118, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7124 = call i64 @rt_vector_length(i64 %t7123)
  %t7125 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t7125)
  %t7126 = and i64 %t7125, -8
  %t7127 = inttoptr i64 %t7126 to ptr
  %t7128 = load i64, ptr %t7127
  %t7129 = inttoptr i64 %t7128 to ptr
  %t7130 = call fastcc i64%t7129(i64 %t7125, i64 2, i64 %a1, i64 %t7124, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7131 = call i64 @rt_vector_ref(i64 %t7123, i64 %t7130)
  %t7132 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t7132)
  %t7133 = and i64 %t7132, -8
  %t7134 = inttoptr i64 %t7133 to ptr
  %t7135 = load i64, ptr %t7134
  %t7136 = inttoptr i64 %t7135 to ptr
  %t7137 = call fastcc i64%t7136(i64 %t7132, i64 2, i64 %a1, i64 %t7131, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7138 = icmp ne i64 %t7137, 1
  br i1 %t7138, label %then1564, label %else1565
then1564:
  %t7139 = call i64 @rt_cdr(i64 %t7137)
  ret i64 %t7139
else1565:
  %t7140 = call i64 @rt_make_string(ptr @.str.lit.37, i64 29)
  %t7141 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t7141)
  %t7142 = and i64 %t7141, -8
  %t7143 = inttoptr i64 %t7142 to ptr
  %t7144 = load i64, ptr %t7143
  %t7145 = inttoptr i64 %t7144 to ptr
  %t7146 = musttail call fastcc i64 %t7145(i64 %t7141, i64 2, i64 %t7140, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7146
}

define fastcc i64 @"scheme.base:code:hash-table-set!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7151 = icmp eq i64 %argc, 3
  br i1 %t7151, label %argok1567, label %arityerr1566
arityerr1566:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1567:
  %t7152 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7152)
  %t7153 = and i64 %t7152, -8
  %t7154 = inttoptr i64 %t7153 to ptr
  %t7155 = load i64, ptr %t7154
  %t7156 = inttoptr i64 %t7155 to ptr
  %t7157 = call fastcc i64%t7156(i64 %t7152, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7158 = call i64 @rt_vector_length(i64 %t7157)
  %t7159 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t7159)
  %t7160 = and i64 %t7159, -8
  %t7161 = inttoptr i64 %t7160 to ptr
  %t7162 = load i64, ptr %t7161
  %t7163 = inttoptr i64 %t7162 to ptr
  %t7164 = call fastcc i64%t7163(i64 %t7159, i64 2, i64 %a1, i64 %t7158, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7165 = call i64 @rt_vector_ref(i64 %t7157, i64 %t7164)
  %t7166 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t7166)
  %t7167 = and i64 %t7166, -8
  %t7168 = inttoptr i64 %t7167 to ptr
  %t7169 = load i64, ptr %t7168
  %t7170 = inttoptr i64 %t7169 to ptr
  %t7171 = call fastcc i64%t7170(i64 %t7166, i64 2, i64 %a1, i64 %t7165, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7172 = call i64 @rt_cons(i64 %a1, i64 %a2)
  %t7173 = icmp ne i64 %t7171, 1
  br i1 %t7173, label %then1568, label %else1569
then1568:
  %t7174 = load i64, ptr @"scheme.base:%ht-remove"
  call void @rt_check_callable(i64 %t7174)
  %t7175 = and i64 %t7174, -8
  %t7176 = inttoptr i64 %t7175 to ptr
  %t7177 = load i64, ptr %t7176
  %t7178 = inttoptr i64 %t7177 to ptr
  %t7179 = call fastcc i64%t7178(i64 %t7174, i64 2, i64 %a1, i64 %t7165, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge1570
else1569:
  br label %merge1570
merge1570:
  %t7180 = phi i64 [ %t7179, %then1568 ], [ %t7165, %else1569 ]
  %t7181 = call i64 @rt_cons(i64 %t7172, i64 %t7180)
  %t7182 = call i64 @rt_vector_set(i64 %t7157, i64 %t7164, i64 %t7181)
  %t7183 = icmp ne i64 %t7171, 1
  br i1 %t7183, label %then1571, label %else1572
then1571:
  ret i64 1
else1572:
  %t7184 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t7184)
  %t7185 = and i64 %t7184, -8
  %t7186 = inttoptr i64 %t7185 to ptr
  %t7187 = load i64, ptr %t7186
  %t7188 = inttoptr i64 %t7187 to ptr
  %t7189 = call fastcc i64%t7188(i64 %t7184, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7190 = or i64 %t7189, 8
  %t7191 = and i64 %t7190, 7
  %t7192 = icmp eq i64 %t7191, 0
  br i1 %t7192, label %fixfast1573, label %fixslow1574
fixfast1573:
  %t7193 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t7189, i64 8)
  %t7194 = extractvalue {i64, i1} %t7193, 0
  %t7195 = extractvalue {i64, i1} %t7193, 1
  br i1 %t7195, label %fixslow1574, label %fixmerge1575
fixslow1574:
  %t7196 = call i64 @rt_add(i64 %t7189, i64 8)
  br label %fixmerge1575
fixmerge1575:
  %t7197 = phi i64 [ %t7194, %fixfast1573 ], [ %t7196, %fixslow1574 ]
  %t7198 = load i64, ptr @"scheme.base:%ht-set-count!"
  call void @rt_check_callable(i64 %t7198)
  %t7199 = and i64 %t7198, -8
  %t7200 = inttoptr i64 %t7199 to ptr
  %t7201 = load i64, ptr %t7200
  %t7202 = inttoptr i64 %t7201 to ptr
  %t7203 = call fastcc i64%t7202(i64 %t7198, i64 2, i64 %a0, i64 %t7197, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7204 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t7204)
  %t7205 = and i64 %t7204, -8
  %t7206 = inttoptr i64 %t7205 to ptr
  %t7207 = load i64, ptr %t7206
  %t7208 = inttoptr i64 %t7207 to ptr
  %t7209 = call fastcc i64%t7208(i64 %t7204, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7210 = load i64, ptr @"scheme.base:%ht-load-factor"
  %t7211 = or i64 %t7210, %t7158
  %t7212 = and i64 %t7211, 7
  %t7213 = icmp eq i64 %t7212, 0
  br i1 %t7213, label %fixfast1576, label %fixslow1577
fixfast1576:
  %t7214 = ashr i64 %t7210, 3
  %t7215 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t7214, i64 %t7158)
  %t7216 = extractvalue {i64, i1} %t7215, 0
  %t7217 = extractvalue {i64, i1} %t7215, 1
  br i1 %t7217, label %fixslow1577, label %fixmerge1578
fixslow1577:
  %t7218 = call i64 @rt_mul(i64 %t7210, i64 %t7158)
  br label %fixmerge1578
fixmerge1578:
  %t7219 = phi i64 [ %t7216, %fixfast1576 ], [ %t7218, %fixslow1577 ]
  %t7220 = or i64 %t7219, %t7209
  %t7221 = and i64 %t7220, 7
  %t7222 = icmp eq i64 %t7221, 0
  br i1 %t7222, label %fixfast1579, label %fixslow1580
fixfast1579:
  %t7223 = icmp slt i64 %t7219, %t7209
  %t7224 = select i1 %t7223, i64 257, i64 1
  br label %fixmerge1581
fixslow1580:
  %t7225 = call i64 @rt_lt(i64 %t7219, i64 %t7209)
  br label %fixmerge1581
fixmerge1581:
  %t7226 = phi i64 [ %t7224, %fixfast1579 ], [ %t7225, %fixslow1580 ]
  %t7227 = icmp ne i64 %t7226, 1
  br i1 %t7227, label %then1582, label %else1583
then1582:
  %t7228 = load i64, ptr @"scheme.base:%ht-grow!"
  call void @rt_check_callable(i64 %t7228)
  %t7229 = and i64 %t7228, -8
  %t7230 = inttoptr i64 %t7229 to ptr
  %t7231 = load i64, ptr %t7230
  %t7232 = inttoptr i64 %t7231 to ptr
  %t7233 = musttail call fastcc i64 %t7232(i64 %t7228, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7233
else1583:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-delete!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7238 = icmp eq i64 %argc, 2
  br i1 %t7238, label %argok1585, label %arityerr1584
arityerr1584:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1585:
  %t7239 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7239)
  %t7240 = and i64 %t7239, -8
  %t7241 = inttoptr i64 %t7240 to ptr
  %t7242 = load i64, ptr %t7241
  %t7243 = inttoptr i64 %t7242 to ptr
  %t7244 = call fastcc i64%t7243(i64 %t7239, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7245 = call i64 @rt_vector_length(i64 %t7244)
  %t7246 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t7246)
  %t7247 = and i64 %t7246, -8
  %t7248 = inttoptr i64 %t7247 to ptr
  %t7249 = load i64, ptr %t7248
  %t7250 = inttoptr i64 %t7249 to ptr
  %t7251 = call fastcc i64%t7250(i64 %t7246, i64 2, i64 %a1, i64 %t7245, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7252 = call i64 @rt_vector_ref(i64 %t7244, i64 %t7251)
  %t7253 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t7253)
  %t7254 = and i64 %t7253, -8
  %t7255 = inttoptr i64 %t7254 to ptr
  %t7256 = load i64, ptr %t7255
  %t7257 = inttoptr i64 %t7256 to ptr
  %t7258 = call fastcc i64%t7257(i64 %t7253, i64 2, i64 %a1, i64 %t7252, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7259 = icmp ne i64 %t7258, 1
  br i1 %t7259, label %then1586, label %else1587
then1586:
  %t7260 = load i64, ptr @"scheme.base:%ht-remove"
  call void @rt_check_callable(i64 %t7260)
  %t7261 = and i64 %t7260, -8
  %t7262 = inttoptr i64 %t7261 to ptr
  %t7263 = load i64, ptr %t7262
  %t7264 = inttoptr i64 %t7263 to ptr
  %t7265 = call fastcc i64%t7264(i64 %t7260, i64 2, i64 %a1, i64 %t7252, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7266 = call i64 @rt_vector_set(i64 %t7244, i64 %t7251, i64 %t7265)
  %t7267 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t7267)
  %t7268 = and i64 %t7267, -8
  %t7269 = inttoptr i64 %t7268 to ptr
  %t7270 = load i64, ptr %t7269
  %t7271 = inttoptr i64 %t7270 to ptr
  %t7272 = call fastcc i64%t7271(i64 %t7267, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7273 = or i64 %t7272, 8
  %t7274 = and i64 %t7273, 7
  %t7275 = icmp eq i64 %t7274, 0
  br i1 %t7275, label %fixfast1588, label %fixslow1589
fixfast1588:
  %t7276 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t7272, i64 8)
  %t7277 = extractvalue {i64, i1} %t7276, 0
  %t7278 = extractvalue {i64, i1} %t7276, 1
  br i1 %t7278, label %fixslow1589, label %fixmerge1590
fixslow1589:
  %t7279 = call i64 @rt_sub(i64 %t7272, i64 8)
  br label %fixmerge1590
fixmerge1590:
  %t7280 = phi i64 [ %t7277, %fixfast1588 ], [ %t7279, %fixslow1589 ]
  %t7281 = load i64, ptr @"scheme.base:%ht-set-count!"
  call void @rt_check_callable(i64 %t7281)
  %t7282 = and i64 %t7281, -8
  %t7283 = inttoptr i64 %t7282 to ptr
  %t7284 = load i64, ptr %t7283
  %t7285 = inttoptr i64 %t7284 to ptr
  %t7286 = musttail call fastcc i64 %t7285(i64 %t7281, i64 2, i64 %a0, i64 %t7280, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7286
else1587:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_1194"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7291 = icmp eq i64 %argc, 1
  br i1 %t7291, label %argok1592, label %arityerr1591
arityerr1591:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1592:
  %t7292 = call i64 @rt_null_p(i64 %a0)
  %t7293 = icmp ne i64 %t7292, 1
  br i1 %t7293, label %then1593, label %else1594
then1593:
  ret i64 1
else1594:
  %t7294 = call i64 @rt_car(i64 %a0)
  %t7295 = call i64 @rt_car(i64 %t7294)
  %t7296 = and i64 %self, -8
  %t7297 = inttoptr i64 %t7296 to ptr
  %t7298 = getelementptr i64, ptr %t7297, i64 1
  %t7299 = load i64, ptr %t7298
  %t7300 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t7300)
  %t7301 = and i64 %t7300, -8
  %t7302 = inttoptr i64 %t7301 to ptr
  %t7303 = load i64, ptr %t7302
  %t7304 = inttoptr i64 %t7303 to ptr
  %t7305 = call fastcc i64%t7304(i64 %t7300, i64 2, i64 %t7295, i64 %t7299, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7306 = and i64 %self, -8
  %t7307 = inttoptr i64 %t7306 to ptr
  %t7308 = getelementptr i64, ptr %t7307, i64 2
  %t7309 = load i64, ptr %t7308
  %t7310 = and i64 %self, -8
  %t7311 = inttoptr i64 %t7310 to ptr
  %t7312 = getelementptr i64, ptr %t7311, i64 2
  %t7313 = load i64, ptr %t7312
  %t7314 = call i64 @rt_vector_ref(i64 %t7313, i64 %t7305)
  %t7315 = call i64 @rt_cons(i64 %t7294, i64 %t7314)
  %t7316 = call i64 @rt_vector_set(i64 %t7309, i64 %t7305, i64 %t7315)
  %t7317 = call i64 @rt_cdr(i64 %a0)
  %t7318 = musttail call fastcc i64 @"scheme.base:code_1194"(i64 %self, i64 1, i64 %t7317, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7318
}

define fastcc i64 @"scheme.base:code_1192"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7319 = icmp eq i64 %argc, 1
  br i1 %t7319, label %argok1596, label %arityerr1595
arityerr1595:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1596:
  %t7320 = and i64 %self, -8
  %t7321 = inttoptr i64 %t7320 to ptr
  %t7322 = getelementptr i64, ptr %t7321, i64 1
  %t7323 = load i64, ptr %t7322
  %t7324 = call i64 @rt_vector_length(i64 %t7323)
  %t7325 = or i64 %a0, %t7324
  %t7326 = and i64 %t7325, 7
  %t7327 = icmp eq i64 %t7326, 0
  br i1 %t7327, label %fixfast1597, label %fixslow1598
fixfast1597:
  %t7328 = icmp slt i64 %a0, %t7324
  %t7329 = select i1 %t7328, i64 257, i64 1
  br label %fixmerge1599
fixslow1598:
  %t7330 = call i64 @rt_lt(i64 %a0, i64 %t7324)
  br label %fixmerge1599
fixmerge1599:
  %t7331 = phi i64 [ %t7329, %fixfast1597 ], [ %t7330, %fixslow1598 ]
  %t7332 = icmp ne i64 %t7331, 1
  br i1 %t7332, label %then1600, label %else1601
then1600:
  %t7333 = call ptr @rt_alloc_words(i64 4)
  %t7334 = ptrtoint ptr %t7333 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1194" to i64), ptr %t7333
  %t7335 = or i64 %t7334, 4
  %t7336 = and i64 %self, -8
  %t7337 = inttoptr i64 %t7336 to ptr
  %t7338 = getelementptr i64, ptr %t7337, i64 2
  %t7339 = load i64, ptr %t7338
  %t7340 = getelementptr i64, ptr %t7333, i64 1
  store i64 %t7339, ptr %t7340
  %t7341 = and i64 %self, -8
  %t7342 = inttoptr i64 %t7341 to ptr
  %t7343 = getelementptr i64, ptr %t7342, i64 3
  %t7344 = load i64, ptr %t7343
  %t7345 = getelementptr i64, ptr %t7333, i64 2
  store i64 %t7344, ptr %t7345
  %t7346 = getelementptr i64, ptr %t7333, i64 3
  store i64 %t7335, ptr %t7346
  %t7347 = and i64 %self, -8
  %t7348 = inttoptr i64 %t7347 to ptr
  %t7349 = getelementptr i64, ptr %t7348, i64 1
  %t7350 = load i64, ptr %t7349
  %t7351 = call i64 @rt_vector_ref(i64 %t7350, i64 %a0)
  %t7352 = call fastcc i64 @"scheme.base:code_1194"(i64 %t7335, i64 1, i64 %t7351, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7353 = or i64 %a0, 8
  %t7354 = and i64 %t7353, 7
  %t7355 = icmp eq i64 %t7354, 0
  br i1 %t7355, label %fixfast1602, label %fixslow1603
fixfast1602:
  %t7356 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t7357 = extractvalue {i64, i1} %t7356, 0
  %t7358 = extractvalue {i64, i1} %t7356, 1
  br i1 %t7358, label %fixslow1603, label %fixmerge1604
fixslow1603:
  %t7359 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1604
fixmerge1604:
  %t7360 = phi i64 [ %t7357, %fixfast1602 ], [ %t7359, %fixslow1603 ]
  %t7361 = musttail call fastcc i64 @"scheme.base:code_1192"(i64 %self, i64 1, i64 %t7360, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7361
else1601:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%ht-grow!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7362 = icmp eq i64 %argc, 1
  br i1 %t7362, label %argok1606, label %arityerr1605
arityerr1605:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1606:
  %t7363 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7363)
  %t7364 = and i64 %t7363, -8
  %t7365 = inttoptr i64 %t7364 to ptr
  %t7366 = load i64, ptr %t7365
  %t7367 = inttoptr i64 %t7366 to ptr
  %t7368 = call fastcc i64%t7367(i64 %t7363, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7369 = call i64 @rt_vector_length(i64 %t7368)
  %t7370 = or i64 16, %t7369
  %t7371 = and i64 %t7370, 7
  %t7372 = icmp eq i64 %t7371, 0
  br i1 %t7372, label %fixfast1607, label %fixslow1608
fixfast1607:
  %t7373 = ashr i64 16, 3
  %t7374 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t7373, i64 %t7369)
  %t7375 = extractvalue {i64, i1} %t7374, 0
  %t7376 = extractvalue {i64, i1} %t7374, 1
  br i1 %t7376, label %fixslow1608, label %fixmerge1609
fixslow1608:
  %t7377 = call i64 @rt_mul(i64 16, i64 %t7369)
  br label %fixmerge1609
fixmerge1609:
  %t7378 = phi i64 [ %t7375, %fixfast1607 ], [ %t7377, %fixslow1608 ]
  %t7379 = call i64 @rt_make_vector(i64 %t7378, i64 2)
  %t7380 = call ptr @rt_alloc_words(i64 5)
  %t7381 = ptrtoint ptr %t7380 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1192" to i64), ptr %t7380
  %t7382 = or i64 %t7381, 4
  %t7383 = getelementptr i64, ptr %t7380, i64 1
  store i64 %t7368, ptr %t7383
  %t7384 = getelementptr i64, ptr %t7380, i64 2
  store i64 %t7378, ptr %t7384
  %t7385 = getelementptr i64, ptr %t7380, i64 3
  store i64 %t7379, ptr %t7385
  %t7386 = getelementptr i64, ptr %t7380, i64 4
  store i64 %t7382, ptr %t7386
  %t7387 = call fastcc i64 @"scheme.base:code_1192"(i64 %t7382, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7388 = load i64, ptr @"scheme.base:%ht-set-buckets!"
  call void @rt_check_callable(i64 %t7388)
  %t7389 = and i64 %t7388, -8
  %t7390 = inttoptr i64 %t7389 to ptr
  %t7391 = load i64, ptr %t7390
  %t7392 = inttoptr i64 %t7391 to ptr
  %t7393 = musttail call fastcc i64 %t7392(i64 %t7388, i64 2, i64 %a0, i64 %t7379, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7393
}

define fastcc i64 @"scheme.base:code:hash-table-size"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7398 = icmp eq i64 %argc, 1
  br i1 %t7398, label %argok1611, label %arityerr1610
arityerr1610:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1611:
  %t7399 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t7399)
  %t7400 = and i64 %t7399, -8
  %t7401 = inttoptr i64 %t7400 to ptr
  %t7402 = load i64, ptr %t7401
  %t7403 = inttoptr i64 %t7402 to ptr
  %t7404 = musttail call fastcc i64 %t7403(i64 %t7399, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7404
}

define fastcc i64 @"scheme.base:code:%ht-fold-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7409 = icmp eq i64 %argc, 2
  br i1 %t7409, label %argok1613, label %arityerr1612
arityerr1612:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1613:
  %t7410 = call i64 @rt_null_p(i64 %a0)
  %t7411 = icmp ne i64 %t7410, 1
  br i1 %t7411, label %then1614, label %else1615
then1614:
  ret i64 %a1
else1615:
  %t7412 = call i64 @rt_car(i64 %a0)
  %t7413 = call i64 @rt_car(i64 %t7412)
  %t7414 = call i64 @rt_car(i64 %a0)
  %t7415 = call i64 @rt_cdr(i64 %t7414)
  %t7416 = call i64 @rt_cons(i64 %t7413, i64 %t7415)
  %t7417 = call i64 @rt_cdr(i64 %a0)
  %t7418 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  call void @rt_check_callable(i64 %t7418)
  %t7419 = and i64 %t7418, -8
  %t7420 = inttoptr i64 %t7419 to ptr
  %t7421 = load i64, ptr %t7420
  %t7422 = inttoptr i64 %t7421 to ptr
  %t7423 = call fastcc i64%t7422(i64 %t7418, i64 2, i64 %t7417, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7424 = call i64 @rt_cons(i64 %t7416, i64 %t7423)
  ret i64 %t7424
}

define fastcc i64 @"scheme.base:code_1211"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7429 = icmp eq i64 %argc, 2
  br i1 %t7429, label %argok1617, label %arityerr1616
arityerr1616:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1617:
  %t7430 = and i64 %self, -8
  %t7431 = inttoptr i64 %t7430 to ptr
  %t7432 = getelementptr i64, ptr %t7431, i64 1
  %t7433 = load i64, ptr %t7432
  %t7434 = call i64 @rt_vector_length(i64 %t7433)
  %t7435 = or i64 %a0, %t7434
  %t7436 = and i64 %t7435, 7
  %t7437 = icmp eq i64 %t7436, 0
  br i1 %t7437, label %fixfast1618, label %fixslow1619
fixfast1618:
  %t7438 = icmp slt i64 %a0, %t7434
  %t7439 = select i1 %t7438, i64 257, i64 1
  br label %fixmerge1620
fixslow1619:
  %t7440 = call i64 @rt_lt(i64 %a0, i64 %t7434)
  br label %fixmerge1620
fixmerge1620:
  %t7441 = phi i64 [ %t7439, %fixfast1618 ], [ %t7440, %fixslow1619 ]
  %t7442 = icmp ne i64 %t7441, 1
  br i1 %t7442, label %then1621, label %else1622
then1621:
  %t7443 = or i64 %a0, 8
  %t7444 = and i64 %t7443, 7
  %t7445 = icmp eq i64 %t7444, 0
  br i1 %t7445, label %fixfast1623, label %fixslow1624
fixfast1623:
  %t7446 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t7447 = extractvalue {i64, i1} %t7446, 0
  %t7448 = extractvalue {i64, i1} %t7446, 1
  br i1 %t7448, label %fixslow1624, label %fixmerge1625
fixslow1624:
  %t7449 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1625
fixmerge1625:
  %t7450 = phi i64 [ %t7447, %fixfast1623 ], [ %t7449, %fixslow1624 ]
  %t7451 = and i64 %self, -8
  %t7452 = inttoptr i64 %t7451 to ptr
  %t7453 = getelementptr i64, ptr %t7452, i64 1
  %t7454 = load i64, ptr %t7453
  %t7455 = call i64 @rt_vector_ref(i64 %t7454, i64 %a0)
  %t7456 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  call void @rt_check_callable(i64 %t7456)
  %t7457 = and i64 %t7456, -8
  %t7458 = inttoptr i64 %t7457 to ptr
  %t7459 = load i64, ptr %t7458
  %t7460 = inttoptr i64 %t7459 to ptr
  %t7461 = call fastcc i64%t7460(i64 %t7456, i64 2, i64 %t7455, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7462 = musttail call fastcc i64 @"scheme.base:code_1211"(i64 %self, i64 2, i64 %t7450, i64 %t7461, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7462
else1622:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:hash-table->alist"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7463 = icmp eq i64 %argc, 1
  br i1 %t7463, label %argok1627, label %arityerr1626
arityerr1626:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1627:
  %t7464 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7464)
  %t7465 = and i64 %t7464, -8
  %t7466 = inttoptr i64 %t7465 to ptr
  %t7467 = load i64, ptr %t7466
  %t7468 = inttoptr i64 %t7467 to ptr
  %t7469 = call fastcc i64%t7468(i64 %t7464, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7470 = call ptr @rt_alloc_words(i64 3)
  %t7471 = ptrtoint ptr %t7470 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1211" to i64), ptr %t7470
  %t7472 = or i64 %t7471, 4
  %t7473 = getelementptr i64, ptr %t7470, i64 1
  store i64 %t7469, ptr %t7473
  %t7474 = getelementptr i64, ptr %t7470, i64 2
  store i64 %t7472, ptr %t7474
  %t7475 = musttail call fastcc i64 @"scheme.base:code_1211"(i64 %t7472, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7475
}

define fastcc i64 @"scheme.base:code_1216"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7480 = icmp eq i64 %argc, 1
  br i1 %t7480, label %argok1629, label %arityerr1628
arityerr1628:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1629:
  %t7481 = call i64 @rt_car(i64 %a0)
  ret i64 %t7481
}

define fastcc i64 @"scheme.base:code:hash-table-keys"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7482 = icmp eq i64 %argc, 1
  br i1 %t7482, label %argok1631, label %arityerr1630
arityerr1630:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1631:
  %t7483 = call ptr @rt_alloc_words(i64 1)
  %t7484 = ptrtoint ptr %t7483 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1216" to i64), ptr %t7483
  %t7485 = or i64 %t7484, 4
  %t7486 = load i64, ptr @"scheme.base:hash-table->alist"
  call void @rt_check_callable(i64 %t7486)
  %t7487 = and i64 %t7486, -8
  %t7488 = inttoptr i64 %t7487 to ptr
  %t7489 = load i64, ptr %t7488
  %t7490 = inttoptr i64 %t7489 to ptr
  %t7491 = call fastcc i64%t7490(i64 %t7486, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7492 = load i64, ptr @"scheme.base:map"
  call void @rt_check_callable(i64 %t7492)
  %t7493 = and i64 %t7492, -8
  %t7494 = inttoptr i64 %t7493 to ptr
  %t7495 = load i64, ptr %t7494
  %t7496 = inttoptr i64 %t7495 to ptr
  %t7497 = musttail call fastcc i64 %t7496(i64 %t7492, i64 2, i64 %t7485, i64 %t7491, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7497
}

define fastcc i64 @"scheme.base:code_1221"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7502 = icmp eq i64 %argc, 1
  br i1 %t7502, label %argok1633, label %arityerr1632
arityerr1632:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1633:
  %t7503 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t7503
}

define fastcc i64 @"scheme.base:code:hash-table-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7504 = icmp eq i64 %argc, 1
  br i1 %t7504, label %argok1635, label %arityerr1634
arityerr1634:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1635:
  %t7505 = call ptr @rt_alloc_words(i64 1)
  %t7506 = ptrtoint ptr %t7505 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1221" to i64), ptr %t7505
  %t7507 = or i64 %t7506, 4
  %t7508 = load i64, ptr @"scheme.base:hash-table->alist"
  call void @rt_check_callable(i64 %t7508)
  %t7509 = and i64 %t7508, -8
  %t7510 = inttoptr i64 %t7509 to ptr
  %t7511 = load i64, ptr %t7510
  %t7512 = inttoptr i64 %t7511 to ptr
  %t7513 = call fastcc i64%t7512(i64 %t7508, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7514 = load i64, ptr @"scheme.base:map"
  call void @rt_check_callable(i64 %t7514)
  %t7515 = and i64 %t7514, -8
  %t7516 = inttoptr i64 %t7515 to ptr
  %t7517 = load i64, ptr %t7516
  %t7518 = inttoptr i64 %t7517 to ptr
  %t7519 = musttail call fastcc i64 %t7518(i64 %t7514, i64 2, i64 %t7507, i64 %t7513, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7519
}

define fastcc i64 @"scheme.base:code:rd-report"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7524 = icmp eq i64 %argc, 3
  br i1 %t7524, label %argok1637, label %arityerr1636
arityerr1636:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1637:
  %t7525 = call i64 @rt_car(i64 %a2)
  %t7526 = call i64 @rt_cdr(i64 %a2)
  %t7527 = load i64, ptr @"emit.internal:rd-fail-pos"
  %t7528 = call fastcc i64 @"emit.internal:code:rd-fail-pos"(i64 %t7527, i64 1, i64 %t7526, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7529 = call i64 @rt_intern(ptr @.str.sym.38)
  %t7530 = call i64 @rt_eq_p(i64 %t7525, i64 %t7529)
  %t7531 = icmp ne i64 %t7530, 1
  br i1 %t7531, label %then1638, label %else1639
then1638:
  %t7532 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7533 = call i64 @rt_make_string(ptr @.str.lit.39, i64 45)
  %t7534 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7534)
  %t7535 = and i64 %t7534, -8
  %t7536 = inttoptr i64 %t7535 to ptr
  %t7537 = load i64, ptr %t7536
  %t7538 = inttoptr i64 %t7537 to ptr
  %t7539 = musttail call fastcc i64 %t7538(i64 %t7534, i64 3, i64 %t7532, i64 %t7533, i64 %t7528, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7539
else1639:
  %t7540 = call i64 @rt_intern(ptr @.str.sym.40)
  %t7541 = call i64 @rt_eq_p(i64 %t7525, i64 %t7540)
  %t7542 = icmp ne i64 %t7541, 1
  br i1 %t7542, label %then1640, label %else1641
then1640:
  %t7543 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7544 = call i64 @rt_make_string(ptr @.str.lit.41, i64 41)
  %t7545 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7545)
  %t7546 = and i64 %t7545, -8
  %t7547 = inttoptr i64 %t7546 to ptr
  %t7548 = load i64, ptr %t7547
  %t7549 = inttoptr i64 %t7548 to ptr
  %t7550 = musttail call fastcc i64 %t7549(i64 %t7545, i64 3, i64 %t7543, i64 %t7544, i64 %t7528, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7550
else1641:
  %t7551 = call i64 @rt_intern(ptr @.str.sym.42)
  %t7552 = call i64 @rt_eq_p(i64 %t7525, i64 %t7551)
  %t7553 = icmp ne i64 %t7552, 1
  br i1 %t7553, label %then1642, label %else1643
then1642:
  %t7554 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7555 = call i64 @rt_make_string(ptr @.str.lit.43, i64 13)
  %t7556 = call i64 @rt_string_ref(i64 %a0, i64 %t7528)
  %t7557 = call i64 @rt_char_to_integer(i64 %t7556)
  %t7558 = or i64 %t7557, 728
  %t7559 = and i64 %t7558, 7
  %t7560 = icmp eq i64 %t7559, 0
  br i1 %t7560, label %fixfast1644, label %fixslow1645
fixfast1644:
  %t7561 = icmp eq i64 %t7557, 728
  %t7562 = select i1 %t7561, i64 257, i64 1
  br label %fixmerge1646
fixslow1645:
  %t7563 = call i64 @rt_num_eq(i64 %t7557, i64 728)
  br label %fixmerge1646
fixmerge1646:
  %t7564 = phi i64 [ %t7562, %fixfast1644 ], [ %t7563, %fixslow1645 ]
  %t7565 = icmp ne i64 %t7564, 1
  br i1 %t7565, label %then1647, label %else1648
then1647:
  %t7566 = call i64 @rt_make_string(ptr @.str.lit.44, i64 6)
  br label %merge1649
else1648:
  %t7567 = or i64 %t7557, 280
  %t7568 = and i64 %t7567, 7
  %t7569 = icmp eq i64 %t7568, 0
  br i1 %t7569, label %fixfast1650, label %fixslow1651
fixfast1650:
  %t7570 = icmp eq i64 %t7557, 280
  %t7571 = select i1 %t7570, i64 257, i64 1
  br label %fixmerge1652
fixslow1651:
  %t7572 = call i64 @rt_num_eq(i64 %t7557, i64 280)
  br label %fixmerge1652
fixmerge1652:
  %t7573 = phi i64 [ %t7571, %fixfast1650 ], [ %t7572, %fixslow1651 ]
  %t7574 = icmp ne i64 %t7573, 1
  br i1 %t7574, label %then1653, label %else1654
then1653:
  %t7575 = or i64 %t7528, 8
  %t7576 = and i64 %t7575, 7
  %t7577 = icmp eq i64 %t7576, 0
  br i1 %t7577, label %fixfast1656, label %fixslow1657
fixfast1656:
  %t7578 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t7528, i64 8)
  %t7579 = extractvalue {i64, i1} %t7578, 0
  %t7580 = extractvalue {i64, i1} %t7578, 1
  br i1 %t7580, label %fixslow1657, label %fixmerge1658
fixslow1657:
  %t7581 = call i64 @rt_add(i64 %t7528, i64 8)
  br label %fixmerge1658
fixmerge1658:
  %t7582 = phi i64 [ %t7579, %fixfast1656 ], [ %t7581, %fixslow1657 ]
  %t7583 = or i64 %t7582, %a1
  %t7584 = and i64 %t7583, 7
  %t7585 = icmp eq i64 %t7584, 0
  br i1 %t7585, label %fixfast1659, label %fixslow1660
fixfast1659:
  %t7586 = icmp slt i64 %t7582, %a1
  %t7587 = select i1 %t7586, i64 257, i64 1
  br label %fixmerge1661
fixslow1660:
  %t7588 = call i64 @rt_lt(i64 %t7582, i64 %a1)
  br label %fixmerge1661
fixmerge1661:
  %t7589 = phi i64 [ %t7587, %fixfast1659 ], [ %t7588, %fixslow1660 ]
  %t7590 = icmp ne i64 %t7589, 1
  br i1 %t7590, label %then1662, label %else1663
then1662:
  %t7591 = or i64 %t7528, 8
  %t7592 = and i64 %t7591, 7
  %t7593 = icmp eq i64 %t7592, 0
  br i1 %t7593, label %fixfast1665, label %fixslow1666
fixfast1665:
  %t7594 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t7528, i64 8)
  %t7595 = extractvalue {i64, i1} %t7594, 0
  %t7596 = extractvalue {i64, i1} %t7594, 1
  br i1 %t7596, label %fixslow1666, label %fixmerge1667
fixslow1666:
  %t7597 = call i64 @rt_add(i64 %t7528, i64 8)
  br label %fixmerge1667
fixmerge1667:
  %t7598 = phi i64 [ %t7595, %fixfast1665 ], [ %t7597, %fixslow1666 ]
  %t7599 = call i64 @rt_string_ref(i64 %a0, i64 %t7598)
  %t7600 = call i64 @rt_char_to_integer(i64 %t7599)
  %t7601 = or i64 %t7600, 936
  %t7602 = and i64 %t7601, 7
  %t7603 = icmp eq i64 %t7602, 0
  br i1 %t7603, label %fixfast1668, label %fixslow1669
fixfast1668:
  %t7604 = icmp eq i64 %t7600, 936
  %t7605 = select i1 %t7604, i64 257, i64 1
  br label %fixmerge1670
fixslow1669:
  %t7606 = call i64 @rt_num_eq(i64 %t7600, i64 936)
  br label %fixmerge1670
fixmerge1670:
  %t7607 = phi i64 [ %t7605, %fixfast1668 ], [ %t7606, %fixslow1669 ]
  br label %merge1664
else1663:
  br label %merge1664
merge1664:
  %t7608 = phi i64 [ %t7607, %fixmerge1670 ], [ 1, %else1663 ]
  br label %merge1655
else1654:
  br label %merge1655
merge1655:
  %t7609 = phi i64 [ %t7608, %merge1664 ], [ 1, %else1654 ]
  %t7610 = icmp ne i64 %t7609, 1
  br i1 %t7610, label %then1671, label %else1672
then1671:
  %t7611 = call i64 @rt_make_string(ptr @.str.lit.45, i64 15)
  br label %merge1673
else1672:
  %t7612 = or i64 %t7557, 280
  %t7613 = and i64 %t7612, 7
  %t7614 = icmp eq i64 %t7613, 0
  br i1 %t7614, label %fixfast1674, label %fixslow1675
fixfast1674:
  %t7615 = icmp eq i64 %t7557, 280
  %t7616 = select i1 %t7615, i64 257, i64 1
  br label %fixmerge1676
fixslow1675:
  %t7617 = call i64 @rt_num_eq(i64 %t7557, i64 280)
  br label %fixmerge1676
fixmerge1676:
  %t7618 = phi i64 [ %t7616, %fixfast1674 ], [ %t7617, %fixslow1675 ]
  %t7619 = icmp ne i64 %t7618, 1
  br i1 %t7619, label %then1677, label %else1678
then1677:
  %t7620 = call i64 @rt_make_string(ptr @.str.lit.46, i64 9)
  br label %merge1679
else1678:
  %t7621 = call i64 @rt_make_string(ptr @.str.lit.47, i64 6)
  br label %merge1679
merge1679:
  %t7622 = phi i64 [ %t7620, %then1677 ], [ %t7621, %else1678 ]
  br label %merge1673
merge1673:
  %t7623 = phi i64 [ %t7611, %then1671 ], [ %t7622, %merge1679 ]
  br label %merge1649
merge1649:
  %t7624 = phi i64 [ %t7566, %then1647 ], [ %t7623, %merge1673 ]
  %t7625 = call i64 @rt_string_append(i64 %t7555, i64 %t7624)
  %t7626 = call i64 @rt_make_string(ptr @.str.lit.48, i64 16)
  %t7627 = call i64 @rt_string_append(i64 %t7625, i64 %t7626)
  %t7628 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7628)
  %t7629 = and i64 %t7628, -8
  %t7630 = inttoptr i64 %t7629 to ptr
  %t7631 = load i64, ptr %t7630
  %t7632 = inttoptr i64 %t7631 to ptr
  %t7633 = musttail call fastcc i64 %t7632(i64 %t7628, i64 3, i64 %t7554, i64 %t7627, i64 %t7528, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7633
else1643:
  %t7634 = call i64 @rt_intern(ptr @.str.sym.49)
  %t7635 = call i64 @rt_eq_p(i64 %t7525, i64 %t7634)
  %t7636 = icmp ne i64 %t7635, 1
  br i1 %t7636, label %then1680, label %else1681
then1680:
  %t7637 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7638 = call i64 @rt_make_string(ptr @.str.lit.50, i64 37)
  %t7639 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7639)
  %t7640 = and i64 %t7639, -8
  %t7641 = inttoptr i64 %t7640 to ptr
  %t7642 = load i64, ptr %t7641
  %t7643 = inttoptr i64 %t7642 to ptr
  %t7644 = musttail call fastcc i64 %t7643(i64 %t7639, i64 3, i64 %t7637, i64 %t7638, i64 %t7528, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7644
else1681:
  %t7645 = call i64 @rt_intern(ptr @.str.sym.51)
  %t7646 = call i64 @rt_eq_p(i64 %t7525, i64 %t7645)
  %t7647 = icmp ne i64 %t7646, 1
  br i1 %t7647, label %then1682, label %else1683
then1682:
  %t7648 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7649 = call i64 @rt_make_string(ptr @.str.lit.52, i64 22)
  %t7650 = load i64, ptr @"emit.internal:rd-token-at"
  %t7651 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t7650, i64 3, i64 %a0, i64 %a1, i64 %t7528, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7652 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7652)
  %t7653 = and i64 %t7652, -8
  %t7654 = inttoptr i64 %t7653 to ptr
  %t7655 = load i64, ptr %t7654
  %t7656 = inttoptr i64 %t7655 to ptr
  %t7657 = musttail call fastcc i64 %t7656(i64 %t7652, i64 3, i64 %t7648, i64 %t7649, i64 %t7651, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7657
else1683:
  %t7658 = call i64 @rt_intern(ptr @.str.sym.53)
  %t7659 = call i64 @rt_eq_p(i64 %t7525, i64 %t7658)
  %t7660 = icmp ne i64 %t7659, 1
  br i1 %t7660, label %then1684, label %else1685
then1684:
  %t7661 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7662 = call i64 @rt_make_string(ptr @.str.lit.54, i64 44)
  %t7663 = load i64, ptr @"emit.internal:rd-token-at"
  %t7664 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t7663, i64 3, i64 %a0, i64 %a1, i64 %t7528, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7665 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7665)
  %t7666 = and i64 %t7665, -8
  %t7667 = inttoptr i64 %t7666 to ptr
  %t7668 = load i64, ptr %t7667
  %t7669 = inttoptr i64 %t7668 to ptr
  %t7670 = musttail call fastcc i64 %t7669(i64 %t7665, i64 3, i64 %t7661, i64 %t7662, i64 %t7664, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7670
else1685:
  %t7671 = call i64 @rt_intern(ptr @.str.sym.55)
  %t7672 = call i64 @rt_eq_p(i64 %t7525, i64 %t7671)
  %t7673 = icmp ne i64 %t7672, 1
  br i1 %t7673, label %then1686, label %else1687
then1686:
  %t7674 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7675 = call i64 @rt_make_string(ptr @.str.lit.56, i64 21)
  %t7676 = load i64, ptr @"emit.internal:rd-token-at"
  %t7677 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t7676, i64 3, i64 %a0, i64 %a1, i64 %t7528, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7678 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7678)
  %t7679 = and i64 %t7678, -8
  %t7680 = inttoptr i64 %t7679 to ptr
  %t7681 = load i64, ptr %t7680
  %t7682 = inttoptr i64 %t7681 to ptr
  %t7683 = musttail call fastcc i64 %t7682(i64 %t7678, i64 3, i64 %t7674, i64 %t7675, i64 %t7677, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7683
else1687:
  %t7684 = call i64 @rt_intern(ptr @.str.sym.57)
  %t7685 = call i64 @rt_eq_p(i64 %t7525, i64 %t7684)
  %t7686 = icmp ne i64 %t7685, 1
  br i1 %t7686, label %then1688, label %else1689
then1688:
  %t7687 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7688 = call i64 @rt_make_string(ptr @.str.lit.58, i64 47)
  %t7689 = load i64, ptr @"emit.internal:rd-token-at"
  %t7690 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t7689, i64 3, i64 %a0, i64 %a1, i64 %t7528, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7691 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7691)
  %t7692 = and i64 %t7691, -8
  %t7693 = inttoptr i64 %t7692 to ptr
  %t7694 = load i64, ptr %t7693
  %t7695 = inttoptr i64 %t7694 to ptr
  %t7696 = musttail call fastcc i64 %t7695(i64 %t7691, i64 3, i64 %t7687, i64 %t7688, i64 %t7690, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7696
else1689:
  %t7697 = call i64 @rt_intern(ptr @.str.sym.59)
  %t7698 = call i64 @rt_eq_p(i64 %t7525, i64 %t7697)
  %t7699 = icmp ne i64 %t7698, 1
  br i1 %t7699, label %then1690, label %else1691
then1690:
  %t7700 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7701 = call i64 @rt_make_string(ptr @.str.lit.60, i64 55)
  %t7702 = load i64, ptr @"emit.internal:rd-token-at"
  %t7703 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t7702, i64 3, i64 %a0, i64 %a1, i64 %t7528, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7704 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7704)
  %t7705 = and i64 %t7704, -8
  %t7706 = inttoptr i64 %t7705 to ptr
  %t7707 = load i64, ptr %t7706
  %t7708 = inttoptr i64 %t7707 to ptr
  %t7709 = musttail call fastcc i64 %t7708(i64 %t7704, i64 3, i64 %t7700, i64 %t7701, i64 %t7703, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7709
else1691:
  %t7710 = call i64 @rt_intern(ptr @.str.sym.61)
  %t7711 = call i64 @rt_eq_p(i64 %t7525, i64 %t7710)
  %t7712 = icmp ne i64 %t7711, 1
  br i1 %t7712, label %then1692, label %else1693
then1692:
  %t7713 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7714 = call i64 @rt_make_string(ptr @.str.lit.62, i64 21)
  %t7715 = load i64, ptr @"emit.internal:rd-token-at"
  %t7716 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t7715, i64 3, i64 %a0, i64 %a1, i64 %t7528, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7717 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7717)
  %t7718 = and i64 %t7717, -8
  %t7719 = inttoptr i64 %t7718 to ptr
  %t7720 = load i64, ptr %t7719
  %t7721 = inttoptr i64 %t7720 to ptr
  %t7722 = musttail call fastcc i64 %t7721(i64 %t7717, i64 3, i64 %t7713, i64 %t7714, i64 %t7716, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7722
else1693:
  %t7723 = call i64 @rt_intern(ptr @.str.sym.63)
  %t7724 = call i64 @rt_eq_p(i64 %t7525, i64 %t7723)
  %t7725 = icmp ne i64 %t7724, 1
  br i1 %t7725, label %then1694, label %else1695
then1694:
  %t7726 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7727 = call i64 @rt_make_string(ptr @.str.lit.64, i64 49)
  %t7728 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7728)
  %t7729 = and i64 %t7728, -8
  %t7730 = inttoptr i64 %t7729 to ptr
  %t7731 = load i64, ptr %t7730
  %t7732 = inttoptr i64 %t7731 to ptr
  %t7733 = musttail call fastcc i64 %t7732(i64 %t7728, i64 3, i64 %t7726, i64 %t7727, i64 %t7528, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7733
else1695:
  %t7734 = call i64 @rt_intern(ptr @.str.sym.65)
  %t7735 = call i64 @rt_eq_p(i64 %t7525, i64 %t7734)
  %t7736 = icmp ne i64 %t7735, 1
  br i1 %t7736, label %then1696, label %else1697
then1696:
  %t7737 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7738 = call i64 @rt_make_string(ptr @.str.lit.66, i64 23)
  %t7739 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7739)
  %t7740 = and i64 %t7739, -8
  %t7741 = inttoptr i64 %t7740 to ptr
  %t7742 = load i64, ptr %t7741
  %t7743 = inttoptr i64 %t7742 to ptr
  %t7744 = musttail call fastcc i64 %t7743(i64 %t7739, i64 3, i64 %t7737, i64 %t7738, i64 %t7528, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7744
else1697:
  %t7745 = call i64 @rt_intern(ptr @.str.sym.67)
  %t7746 = call i64 @rt_eq_p(i64 %t7525, i64 %t7745)
  %t7747 = icmp ne i64 %t7746, 1
  br i1 %t7747, label %then1698, label %else1699
then1698:
  %t7748 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7749 = call i64 @rt_make_string(ptr @.str.lit.68, i64 56)
  %t7750 = call i64 @rt_make_string(ptr @.str.lit.69, i64 38)
  %t7751 = call i64 @rt_string_append(i64 %t7749, i64 %t7750)
  %t7752 = load i64, ptr @"emit.internal:rd-token-at"
  %t7753 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t7752, i64 3, i64 %a0, i64 %a1, i64 %t7528, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7754 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7754)
  %t7755 = and i64 %t7754, -8
  %t7756 = inttoptr i64 %t7755 to ptr
  %t7757 = load i64, ptr %t7756
  %t7758 = inttoptr i64 %t7757 to ptr
  %t7759 = musttail call fastcc i64 %t7758(i64 %t7754, i64 3, i64 %t7748, i64 %t7751, i64 %t7753, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7759
else1699:
  %t7760 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7761 = call i64 @rt_make_string(ptr @.str.lit.70, i64 19)
  %t7762 = load i64, ptr @"emit.internal:rd-token-at"
  %t7763 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t7762, i64 3, i64 %a0, i64 %a1, i64 %t7528, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7764 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7764)
  %t7765 = and i64 %t7764, -8
  %t7766 = inttoptr i64 %t7765 to ptr
  %t7767 = load i64, ptr %t7766
  %t7768 = inttoptr i64 %t7767 to ptr
  %t7769 = musttail call fastcc i64 %t7768(i64 %t7764, i64 3, i64 %t7760, i64 %t7761, i64 %t7763, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7769
}

define fastcc i64 @"scheme.base:code:read-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7774 = icmp eq i64 %argc, 1
  br i1 %t7774, label %argok1701, label %arityerr1700
arityerr1700:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1701:
  %t7775 = call i64 @rt_string_length(i64 %a0)
  %t7776 = load i64, ptr @"emit.internal:rd-state"
  %t7777 = call fastcc i64 @"emit.internal:code:rd-state"(i64 %t7776, i64 1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7778 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t7779 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t7778, i64 4, i64 %a0, i64 %t7775, i64 0, i64 %t7777, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7780 = load i64, ptr @"emit.internal:rd-datum"
  %t7781 = call fastcc i64 @"emit.internal:code:rd-datum"(i64 %t7780, i64 4, i64 %a0, i64 %t7775, i64 %t7779, i64 %t7777, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7782 = load i64, ptr @"emit.internal:rd-finish"
  %t7783 = call fastcc i64 @"emit.internal:code:rd-finish"(i64 %t7782, i64 2, i64 %t7777, i64 %t7781, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7784 = call i64 @rt_cdr(i64 %t7783)
  %t7785 = load i64, ptr @"emit.internal:rd-fail?"
  %t7786 = call fastcc i64 @"emit.internal:code:rd-fail?"(i64 %t7785, i64 1, i64 %t7784, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7787 = icmp ne i64 %t7786, 1
  br i1 %t7787, label %then1702, label %else1703
then1702:
  %t7788 = load i64, ptr @"scheme.base:rd-report"
  call void @rt_check_callable(i64 %t7788)
  %t7789 = and i64 %t7788, -8
  %t7790 = inttoptr i64 %t7789 to ptr
  %t7791 = load i64, ptr %t7790
  %t7792 = inttoptr i64 %t7791 to ptr
  %t7793 = musttail call fastcc i64 %t7792(i64 %t7788, i64 3, i64 %a0, i64 %t7775, i64 %t7783, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7793
else1703:
  %t7794 = call i64 @rt_car(i64 %t7783)
  ret i64 %t7794
}

define fastcc i64 @"scheme.base:code:read-all-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7799 = icmp eq i64 %argc, 1
  br i1 %t7799, label %argok1705, label %arityerr1704
arityerr1704:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1705:
  %t7800 = load i64, ptr @"scheme.base:rd-all"
  call void @rt_check_callable(i64 %t7800)
  %t7801 = and i64 %t7800, -8
  %t7802 = inttoptr i64 %t7801 to ptr
  %t7803 = load i64, ptr %t7802
  %t7804 = inttoptr i64 %t7803 to ptr
  %t7805 = musttail call fastcc i64 %t7804(i64 %t7800, i64 2, i64 %a0, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7805
}

define fastcc i64 @"scheme.base:code:read-all-from-string-ci"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7810 = icmp eq i64 %argc, 1
  br i1 %t7810, label %argok1707, label %arityerr1706
arityerr1706:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1707:
  %t7811 = load i64, ptr @"scheme.base:rd-all"
  call void @rt_check_callable(i64 %t7811)
  %t7812 = and i64 %t7811, -8
  %t7813 = inttoptr i64 %t7812 to ptr
  %t7814 = load i64, ptr %t7813
  %t7815 = inttoptr i64 %t7814 to ptr
  %t7816 = musttail call fastcc i64 %t7815(i64 %t7811, i64 2, i64 %a0, i64 257, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7816
}

define fastcc i64 @"scheme.base:code_1325"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7821 = icmp eq i64 %argc, 2
  br i1 %t7821, label %argok1709, label %arityerr1708
arityerr1708:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1709:
  %t7822 = load i64, ptr @"emit.internal:rd-fail?"
  %t7823 = call fastcc i64 @"emit.internal:code:rd-fail?"(i64 %t7822, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7824 = icmp ne i64 %t7823, 1
  br i1 %t7824, label %then1710, label %else1711
then1710:
  %t7825 = and i64 %self, -8
  %t7826 = inttoptr i64 %t7825 to ptr
  %t7827 = getelementptr i64, ptr %t7826, i64 1
  %t7828 = load i64, ptr %t7827
  %t7829 = and i64 %self, -8
  %t7830 = inttoptr i64 %t7829 to ptr
  %t7831 = getelementptr i64, ptr %t7830, i64 2
  %t7832 = load i64, ptr %t7831
  %t7833 = call i64 @rt_intern(ptr @.str.sym.38)
  %t7834 = call i64 @rt_cons(i64 %t7833, i64 %a0)
  %t7835 = load i64, ptr @"scheme.base:rd-report"
  call void @rt_check_callable(i64 %t7835)
  %t7836 = and i64 %t7835, -8
  %t7837 = inttoptr i64 %t7836 to ptr
  %t7838 = load i64, ptr %t7837
  %t7839 = inttoptr i64 %t7838 to ptr
  %t7840 = musttail call fastcc i64 %t7839(i64 %t7835, i64 3, i64 %t7828, i64 %t7832, i64 %t7834, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7840
else1711:
  %t7841 = and i64 %self, -8
  %t7842 = inttoptr i64 %t7841 to ptr
  %t7843 = getelementptr i64, ptr %t7842, i64 2
  %t7844 = load i64, ptr %t7843
  %t7845 = or i64 %a0, %t7844
  %t7846 = and i64 %t7845, 7
  %t7847 = icmp eq i64 %t7846, 0
  br i1 %t7847, label %fixfast1712, label %fixslow1713
fixfast1712:
  %t7848 = icmp slt i64 %a0, %t7844
  %t7849 = select i1 %t7848, i64 257, i64 1
  br label %fixmerge1714
fixslow1713:
  %t7850 = call i64 @rt_lt(i64 %a0, i64 %t7844)
  br label %fixmerge1714
fixmerge1714:
  %t7851 = phi i64 [ %t7849, %fixfast1712 ], [ %t7850, %fixslow1713 ]
  %t7852 = icmp ne i64 %t7851, 1
  br i1 %t7852, label %then1715, label %else1716
then1715:
  %t7853 = and i64 %self, -8
  %t7854 = inttoptr i64 %t7853 to ptr
  %t7855 = getelementptr i64, ptr %t7854, i64 3
  %t7856 = load i64, ptr %t7855
  %t7857 = load i64, ptr @"emit.internal:rd-state-child"
  %t7858 = call fastcc i64 @"emit.internal:code:rd-state-child"(i64 %t7857, i64 1, i64 %t7856, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7859 = and i64 %self, -8
  %t7860 = inttoptr i64 %t7859 to ptr
  %t7861 = getelementptr i64, ptr %t7860, i64 1
  %t7862 = load i64, ptr %t7861
  %t7863 = and i64 %self, -8
  %t7864 = inttoptr i64 %t7863 to ptr
  %t7865 = getelementptr i64, ptr %t7864, i64 2
  %t7866 = load i64, ptr %t7865
  %t7867 = load i64, ptr @"emit.internal:rd-datum"
  %t7868 = call fastcc i64 @"emit.internal:code:rd-datum"(i64 %t7867, i64 4, i64 %t7862, i64 %t7866, i64 %a0, i64 %t7858, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7869 = load i64, ptr @"emit.internal:rd-finish"
  %t7870 = call fastcc i64 @"emit.internal:code:rd-finish"(i64 %t7869, i64 2, i64 %t7858, i64 %t7868, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7871 = call i64 @rt_cdr(i64 %t7870)
  %t7872 = load i64, ptr @"emit.internal:rd-fail?"
  %t7873 = call fastcc i64 @"emit.internal:code:rd-fail?"(i64 %t7872, i64 1, i64 %t7871, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7874 = icmp ne i64 %t7873, 1
  br i1 %t7874, label %then1717, label %else1718
then1717:
  %t7875 = and i64 %self, -8
  %t7876 = inttoptr i64 %t7875 to ptr
  %t7877 = getelementptr i64, ptr %t7876, i64 1
  %t7878 = load i64, ptr %t7877
  %t7879 = and i64 %self, -8
  %t7880 = inttoptr i64 %t7879 to ptr
  %t7881 = getelementptr i64, ptr %t7880, i64 2
  %t7882 = load i64, ptr %t7881
  %t7883 = load i64, ptr @"scheme.base:rd-report"
  call void @rt_check_callable(i64 %t7883)
  %t7884 = and i64 %t7883, -8
  %t7885 = inttoptr i64 %t7884 to ptr
  %t7886 = load i64, ptr %t7885
  %t7887 = inttoptr i64 %t7886 to ptr
  %t7888 = musttail call fastcc i64 %t7887(i64 %t7883, i64 3, i64 %t7878, i64 %t7882, i64 %t7870, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7888
else1718:
  %t7889 = and i64 %self, -8
  %t7890 = inttoptr i64 %t7889 to ptr
  %t7891 = getelementptr i64, ptr %t7890, i64 1
  %t7892 = load i64, ptr %t7891
  %t7893 = and i64 %self, -8
  %t7894 = inttoptr i64 %t7893 to ptr
  %t7895 = getelementptr i64, ptr %t7894, i64 2
  %t7896 = load i64, ptr %t7895
  %t7897 = call i64 @rt_cdr(i64 %t7870)
  %t7898 = and i64 %self, -8
  %t7899 = inttoptr i64 %t7898 to ptr
  %t7900 = getelementptr i64, ptr %t7899, i64 3
  %t7901 = load i64, ptr %t7900
  %t7902 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t7903 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t7902, i64 4, i64 %t7892, i64 %t7896, i64 %t7897, i64 %t7901, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7904 = call i64 @rt_car(i64 %t7870)
  %t7905 = call i64 @rt_cons(i64 %t7904, i64 %a1)
  %t7906 = musttail call fastcc i64 @"scheme.base:code_1325"(i64 %self, i64 2, i64 %t7903, i64 %t7905, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7906
else1716:
  %t7907 = load i64, ptr @"scheme.base:reverse"
  call void @rt_check_callable(i64 %t7907)
  %t7908 = and i64 %t7907, -8
  %t7909 = inttoptr i64 %t7908 to ptr
  %t7910 = load i64, ptr %t7909
  %t7911 = inttoptr i64 %t7910 to ptr
  %t7912 = musttail call fastcc i64 %t7911(i64 %t7907, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7912
}

define fastcc i64 @"scheme.base:code:rd-all"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7913 = icmp eq i64 %argc, 2
  br i1 %t7913, label %argok1720, label %arityerr1719
arityerr1719:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1720:
  %t7914 = call i64 @rt_string_length(i64 %a0)
  %t7915 = load i64, ptr @"emit.internal:rd-state"
  %t7916 = call fastcc i64 @"emit.internal:code:rd-state"(i64 %t7915, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7917 = call ptr @rt_alloc_words(i64 5)
  %t7918 = ptrtoint ptr %t7917 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1325" to i64), ptr %t7917
  %t7919 = or i64 %t7918, 4
  %t7920 = getelementptr i64, ptr %t7917, i64 1
  store i64 %a0, ptr %t7920
  %t7921 = getelementptr i64, ptr %t7917, i64 2
  store i64 %t7914, ptr %t7921
  %t7922 = getelementptr i64, ptr %t7917, i64 3
  store i64 %t7916, ptr %t7922
  %t7923 = getelementptr i64, ptr %t7917, i64 4
  store i64 %t7919, ptr %t7923
  %t7924 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t7925 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t7924, i64 4, i64 %a0, i64 %t7914, i64 0, i64 %t7916, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7926 = musttail call fastcc i64 @"scheme.base:code_1325"(i64 %t7919, i64 2, i64 %t7925, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7926
}

define fastcc i64 @"scheme.base:code:port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7931 = icmp eq i64 %argc, 1
  br i1 %t7931, label %argok1722, label %arityerr1721
arityerr1721:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1722:
  %t7932 = load i64, ptr @"emit.internal:%port-rtd"
  %t7933 = call fastcc i64 @"emit.internal:code:%port-rtd"(i64 %t7932, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7934 = call i64 @rt_record_of_type_p(i64 %a0, i64 %t7933)
  ret i64 %t7934
}

define fastcc i64 @"scheme.base:code:input-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7939 = icmp eq i64 %argc, 1
  br i1 %t7939, label %argok1724, label %arityerr1723
arityerr1723:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1724:
  %t7940 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t7940)
  %t7941 = and i64 %t7940, -8
  %t7942 = inttoptr i64 %t7941 to ptr
  %t7943 = load i64, ptr %t7942
  %t7944 = inttoptr i64 %t7943 to ptr
  %t7945 = call fastcc i64%t7944(i64 %t7940, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7946 = icmp ne i64 %t7945, 1
  br i1 %t7946, label %then1725, label %else1726
then1725:
  %t7947 = call i64 @rt_record_ref(i64 %a0, i64 8)
  ret i64 %t7947
else1726:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7952 = icmp eq i64 %argc, 1
  br i1 %t7952, label %argok1728, label %arityerr1727
arityerr1727:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1728:
  %t7953 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t7953)
  %t7954 = and i64 %t7953, -8
  %t7955 = inttoptr i64 %t7954 to ptr
  %t7956 = load i64, ptr %t7955
  %t7957 = inttoptr i64 %t7956 to ptr
  %t7958 = call fastcc i64%t7957(i64 %t7953, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7959 = icmp ne i64 %t7958, 1
  br i1 %t7959, label %then1729, label %else1730
then1729:
  %t7960 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t7961 = call i64 @rt_not(i64 %t7960)
  ret i64 %t7961
else1730:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:textual-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7966 = icmp eq i64 %argc, 1
  br i1 %t7966, label %argok1732, label %arityerr1731
arityerr1731:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1732:
  %t7967 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t7967)
  %t7968 = and i64 %t7967, -8
  %t7969 = inttoptr i64 %t7968 to ptr
  %t7970 = load i64, ptr %t7969
  %t7971 = inttoptr i64 %t7970 to ptr
  %t7972 = musttail call fastcc i64 %t7971(i64 %t7967, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7972
}

define fastcc i64 @"scheme.base:code:port-closed?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7977 = icmp eq i64 %argc, 1
  br i1 %t7977, label %argok1734, label %arityerr1733
arityerr1733:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1734:
  %t7978 = call i64 @rt_record_ref(i64 %a0, i64 40)
  ret i64 %t7978
}

define fastcc i64 @"scheme.base:code:input-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7983 = icmp eq i64 %argc, 1
  br i1 %t7983, label %argok1736, label %arityerr1735
arityerr1735:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1736:
  %t7984 = load i64, ptr @"scheme.base:input-port?"
  call void @rt_check_callable(i64 %t7984)
  %t7985 = and i64 %t7984, -8
  %t7986 = inttoptr i64 %t7985 to ptr
  %t7987 = load i64, ptr %t7986
  %t7988 = inttoptr i64 %t7987 to ptr
  %t7989 = call fastcc i64%t7988(i64 %t7984, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7990 = icmp ne i64 %t7989, 1
  br i1 %t7990, label %then1737, label %else1738
then1737:
  %t7991 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t7992 = call i64 @rt_not(i64 %t7991)
  ret i64 %t7992
else1738:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7997 = icmp eq i64 %argc, 1
  br i1 %t7997, label %argok1740, label %arityerr1739
arityerr1739:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1740:
  %t7998 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t7998)
  %t7999 = and i64 %t7998, -8
  %t8000 = inttoptr i64 %t7999 to ptr
  %t8001 = load i64, ptr %t8000
  %t8002 = inttoptr i64 %t8001 to ptr
  %t8003 = call fastcc i64%t8002(i64 %t7998, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8004 = icmp ne i64 %t8003, 1
  br i1 %t8004, label %then1741, label %else1742
then1741:
  %t8005 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t8006 = call i64 @rt_not(i64 %t8005)
  ret i64 %t8006
else1742:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%check-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8011 = icmp eq i64 %argc, 2
  br i1 %t8011, label %argok1744, label %arityerr1743
arityerr1743:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1744:
  %t8012 = load i64, ptr @"scheme.base:input-port?"
  call void @rt_check_callable(i64 %t8012)
  %t8013 = and i64 %t8012, -8
  %t8014 = inttoptr i64 %t8013 to ptr
  %t8015 = load i64, ptr %t8014
  %t8016 = inttoptr i64 %t8015 to ptr
  %t8017 = call fastcc i64%t8016(i64 %t8012, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8018 = call i64 @rt_not(i64 %t8017)
  %t8019 = icmp ne i64 %t8018, 1
  br i1 %t8019, label %then1745, label %else1746
then1745:
  %t8020 = call i64 @rt_make_string(ptr @.str.lit.71, i64 17)
  %t8021 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8021)
  %t8022 = and i64 %t8021, -8
  %t8023 = inttoptr i64 %t8022 to ptr
  %t8024 = load i64, ptr %t8023
  %t8025 = inttoptr i64 %t8024 to ptr
  %t8026 = musttail call fastcc i64 %t8025(i64 %t8021, i64 3, i64 %a1, i64 %t8020, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8026
else1746:
  %t8027 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t8028 = icmp ne i64 %t8027, 1
  br i1 %t8028, label %then1747, label %else1748
then1747:
  %t8029 = call i64 @rt_make_string(ptr @.str.lit.72, i64 14)
  %t8030 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8030)
  %t8031 = and i64 %t8030, -8
  %t8032 = inttoptr i64 %t8031 to ptr
  %t8033 = load i64, ptr %t8032
  %t8034 = inttoptr i64 %t8033 to ptr
  %t8035 = musttail call fastcc i64 %t8034(i64 %t8030, i64 3, i64 %a1, i64 %t8029, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8035
else1748:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:%check-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8040 = icmp eq i64 %argc, 2
  br i1 %t8040, label %argok1750, label %arityerr1749
arityerr1749:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1750:
  %t8041 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t8041)
  %t8042 = and i64 %t8041, -8
  %t8043 = inttoptr i64 %t8042 to ptr
  %t8044 = load i64, ptr %t8043
  %t8045 = inttoptr i64 %t8044 to ptr
  %t8046 = call fastcc i64%t8045(i64 %t8041, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8047 = call i64 @rt_not(i64 %t8046)
  %t8048 = icmp ne i64 %t8047, 1
  br i1 %t8048, label %then1751, label %else1752
then1751:
  %t8049 = call i64 @rt_make_string(ptr @.str.lit.73, i64 18)
  %t8050 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8050)
  %t8051 = and i64 %t8050, -8
  %t8052 = inttoptr i64 %t8051 to ptr
  %t8053 = load i64, ptr %t8052
  %t8054 = inttoptr i64 %t8053 to ptr
  %t8055 = musttail call fastcc i64 %t8054(i64 %t8050, i64 3, i64 %a1, i64 %t8049, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8055
else1752:
  %t8056 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t8057 = icmp ne i64 %t8056, 1
  br i1 %t8057, label %then1753, label %else1754
then1753:
  %t8058 = call i64 @rt_make_string(ptr @.str.lit.74, i64 14)
  %t8059 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8059)
  %t8060 = and i64 %t8059, -8
  %t8061 = inttoptr i64 %t8060 to ptr
  %t8062 = load i64, ptr %t8061
  %t8063 = inttoptr i64 %t8062 to ptr
  %t8064 = musttail call fastcc i64 %t8063(i64 %t8059, i64 3, i64 %a1, i64 %t8058, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8064
else1754:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:open-input-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8069 = icmp eq i64 %argc, 1
  br i1 %t8069, label %argok1756, label %arityerr1755
arityerr1755:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1756:
  %t8070 = load i64, ptr @"emit.internal:%make-port"
  %t8071 = musttail call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8070, i64 6, i64 1, i64 257, i64 %a0, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t8071
}

define fastcc i64 @"scheme.base:code:%port-at-eof?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8076 = icmp eq i64 %argc, 1
  br i1 %t8076, label %argok1758, label %arityerr1757
arityerr1757:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1758:
  %t8077 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t8078 = load i64, ptr @"emit.internal:%port-buf"
  %t8079 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t8078, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8080 = call i64 @rt_string_length(i64 %t8079)
  %t8081 = or i64 %t8080, %t8077
  %t8082 = and i64 %t8081, 7
  %t8083 = icmp eq i64 %t8082, 0
  br i1 %t8083, label %fixfast1759, label %fixslow1760
fixfast1759:
  %t8084 = icmp slt i64 %t8080, %t8077
  %t8085 = select i1 %t8084, i64 257, i64 1
  br label %fixmerge1761
fixslow1760:
  %t8086 = call i64 @rt_lt(i64 %t8080, i64 %t8077)
  br label %fixmerge1761
fixmerge1761:
  %t8087 = phi i64 [ %t8085, %fixfast1759 ], [ %t8086, %fixslow1760 ]
  %t8088 = icmp ne i64 %t8087, 1
  br i1 %t8088, label %then1762, label %else1763
then1762:
  ret i64 257
else1763:
  %t8089 = or i64 %t8077, %t8080
  %t8090 = and i64 %t8089, 7
  %t8091 = icmp eq i64 %t8090, 0
  br i1 %t8091, label %fixfast1764, label %fixslow1765
fixfast1764:
  %t8092 = icmp eq i64 %t8077, %t8080
  %t8093 = select i1 %t8092, i64 257, i64 1
  br label %fixmerge1766
fixslow1765:
  %t8094 = call i64 @rt_num_eq(i64 %t8077, i64 %t8080)
  br label %fixmerge1766
fixmerge1766:
  %t8095 = phi i64 [ %t8093, %fixfast1764 ], [ %t8094, %fixslow1765 ]
  ret i64 %t8095
}

define fastcc i64 @"scheme.base:code:read-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8100 = icmp eq i64 %argc, 1
  br i1 %t8100, label %argok1768, label %arityerr1767
arityerr1767:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1768:
  %t8101 = call i64 @rt_intern(ptr @.str.sym.75)
  %t8102 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t8102)
  %t8103 = and i64 %t8102, -8
  %t8104 = inttoptr i64 %t8103 to ptr
  %t8105 = load i64, ptr %t8104
  %t8106 = inttoptr i64 %t8105 to ptr
  %t8107 = call fastcc i64%t8106(i64 %t8102, i64 2, i64 %a0, i64 %t8101, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8108 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t8108)
  %t8109 = and i64 %t8108, -8
  %t8110 = inttoptr i64 %t8109 to ptr
  %t8111 = load i64, ptr %t8110
  %t8112 = inttoptr i64 %t8111 to ptr
  %t8113 = call fastcc i64%t8112(i64 %t8108, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8114 = icmp ne i64 %t8113, 1
  br i1 %t8114, label %then1769, label %else1770
then1769:
  %t8115 = call i64 @rt_eof_object()
  ret i64 %t8115
else1770:
  %t8116 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t8117 = or i64 %t8116, 8
  %t8118 = and i64 %t8117, 7
  %t8119 = icmp eq i64 %t8118, 0
  br i1 %t8119, label %fixfast1771, label %fixslow1772
fixfast1771:
  %t8120 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t8116, i64 8)
  %t8121 = extractvalue {i64, i1} %t8120, 0
  %t8122 = extractvalue {i64, i1} %t8120, 1
  br i1 %t8122, label %fixslow1772, label %fixmerge1773
fixslow1772:
  %t8123 = call i64 @rt_add(i64 %t8116, i64 8)
  br label %fixmerge1773
fixmerge1773:
  %t8124 = phi i64 [ %t8121, %fixfast1771 ], [ %t8123, %fixslow1772 ]
  %t8125 = call i64 @rt_record_set(i64 %a0, i64 24, i64 %t8124)
  %t8126 = load i64, ptr @"emit.internal:%port-buf"
  %t8127 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t8126, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8128 = call i64 @rt_string_ref(i64 %t8127, i64 %t8116)
  ret i64 %t8128
}

define fastcc i64 @"scheme.base:code:peek-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8133 = icmp eq i64 %argc, 1
  br i1 %t8133, label %argok1775, label %arityerr1774
arityerr1774:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1775:
  %t8134 = call i64 @rt_intern(ptr @.str.sym.76)
  %t8135 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t8135)
  %t8136 = and i64 %t8135, -8
  %t8137 = inttoptr i64 %t8136 to ptr
  %t8138 = load i64, ptr %t8137
  %t8139 = inttoptr i64 %t8138 to ptr
  %t8140 = call fastcc i64%t8139(i64 %t8135, i64 2, i64 %a0, i64 %t8134, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8141 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t8141)
  %t8142 = and i64 %t8141, -8
  %t8143 = inttoptr i64 %t8142 to ptr
  %t8144 = load i64, ptr %t8143
  %t8145 = inttoptr i64 %t8144 to ptr
  %t8146 = call fastcc i64%t8145(i64 %t8141, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8147 = icmp ne i64 %t8146, 1
  br i1 %t8147, label %then1776, label %else1777
then1776:
  %t8148 = call i64 @rt_eof_object()
  ret i64 %t8148
else1777:
  %t8149 = load i64, ptr @"emit.internal:%port-buf"
  %t8150 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t8149, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8151 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t8152 = call i64 @rt_string_ref(i64 %t8150, i64 %t8151)
  ret i64 %t8152
}

define fastcc i64 @"scheme.base:code_1372"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8157 = icmp eq i64 %argc, 1
  br i1 %t8157, label %argok1779, label %arityerr1778
arityerr1778:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1779:
  %t8158 = and i64 %self, -8
  %t8159 = inttoptr i64 %t8158 to ptr
  %t8160 = getelementptr i64, ptr %t8159, i64 1
  %t8161 = load i64, ptr %t8160
  %t8162 = or i64 %t8161, %a0
  %t8163 = and i64 %t8162, 7
  %t8164 = icmp eq i64 %t8163, 0
  br i1 %t8164, label %fixfast1780, label %fixslow1781
fixfast1780:
  %t8165 = icmp slt i64 %t8161, %a0
  %t8166 = select i1 %t8165, i64 257, i64 1
  br label %fixmerge1782
fixslow1781:
  %t8167 = call i64 @rt_lt(i64 %t8161, i64 %a0)
  br label %fixmerge1782
fixmerge1782:
  %t8168 = phi i64 [ %t8166, %fixfast1780 ], [ %t8167, %fixslow1781 ]
  %t8169 = icmp ne i64 %t8168, 1
  br i1 %t8169, label %then1783, label %else1784
then1783:
  br label %merge1785
else1784:
  %t8170 = or i64 %a0, %t8161
  %t8171 = and i64 %t8170, 7
  %t8172 = icmp eq i64 %t8171, 0
  br i1 %t8172, label %fixfast1786, label %fixslow1787
fixfast1786:
  %t8173 = icmp eq i64 %a0, %t8161
  %t8174 = select i1 %t8173, i64 257, i64 1
  br label %fixmerge1788
fixslow1787:
  %t8175 = call i64 @rt_num_eq(i64 %a0, i64 %t8161)
  br label %fixmerge1788
fixmerge1788:
  %t8176 = phi i64 [ %t8174, %fixfast1786 ], [ %t8175, %fixslow1787 ]
  br label %merge1785
merge1785:
  %t8177 = phi i64 [ 257, %then1783 ], [ %t8176, %fixmerge1788 ]
  %t8178 = icmp ne i64 %t8177, 1
  br i1 %t8178, label %then1789, label %else1790
then1789:
  %t8179 = and i64 %self, -8
  %t8180 = inttoptr i64 %t8179 to ptr
  %t8181 = getelementptr i64, ptr %t8180, i64 2
  %t8182 = load i64, ptr %t8181
  %t8183 = call i64 @rt_record_ref(i64 %t8182, i64 24)
  %t8184 = and i64 %self, -8
  %t8185 = inttoptr i64 %t8184 to ptr
  %t8186 = getelementptr i64, ptr %t8185, i64 2
  %t8187 = load i64, ptr %t8186
  %t8188 = and i64 %self, -8
  %t8189 = inttoptr i64 %t8188 to ptr
  %t8190 = getelementptr i64, ptr %t8189, i64 1
  %t8191 = load i64, ptr %t8190
  %t8192 = call i64 @rt_record_set(i64 %t8187, i64 24, i64 %t8191)
  %t8193 = and i64 %self, -8
  %t8194 = inttoptr i64 %t8193 to ptr
  %t8195 = getelementptr i64, ptr %t8194, i64 3
  %t8196 = load i64, ptr %t8195
  %t8197 = and i64 %self, -8
  %t8198 = inttoptr i64 %t8197 to ptr
  %t8199 = getelementptr i64, ptr %t8198, i64 1
  %t8200 = load i64, ptr %t8199
  %t8201 = call i64 @rt_substring(i64 %t8196, i64 %t8183, i64 %t8200)
  ret i64 %t8201
else1790:
  %t8202 = and i64 %self, -8
  %t8203 = inttoptr i64 %t8202 to ptr
  %t8204 = getelementptr i64, ptr %t8203, i64 3
  %t8205 = load i64, ptr %t8204
  %t8206 = call i64 @rt_string_ref(i64 %t8205, i64 %a0)
  %t8207 = load i64, ptr @"scheme.base:char=?"
  call void @rt_check_callable(i64 %t8207)
  %t8208 = and i64 %t8207, -8
  %t8209 = inttoptr i64 %t8208 to ptr
  %t8210 = load i64, ptr %t8209
  %t8211 = inttoptr i64 %t8210 to ptr
  %t8212 = call fastcc i64%t8211(i64 %t8207, i64 2, i64 %t8206, i64 2569, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8213 = icmp ne i64 %t8212, 1
  br i1 %t8213, label %then1791, label %else1792
then1791:
  %t8214 = and i64 %self, -8
  %t8215 = inttoptr i64 %t8214 to ptr
  %t8216 = getelementptr i64, ptr %t8215, i64 2
  %t8217 = load i64, ptr %t8216
  %t8218 = call i64 @rt_record_ref(i64 %t8217, i64 24)
  %t8219 = and i64 %self, -8
  %t8220 = inttoptr i64 %t8219 to ptr
  %t8221 = getelementptr i64, ptr %t8220, i64 2
  %t8222 = load i64, ptr %t8221
  %t8223 = or i64 %a0, 8
  %t8224 = and i64 %t8223, 7
  %t8225 = icmp eq i64 %t8224, 0
  br i1 %t8225, label %fixfast1793, label %fixslow1794
fixfast1793:
  %t8226 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t8227 = extractvalue {i64, i1} %t8226, 0
  %t8228 = extractvalue {i64, i1} %t8226, 1
  br i1 %t8228, label %fixslow1794, label %fixmerge1795
fixslow1794:
  %t8229 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1795
fixmerge1795:
  %t8230 = phi i64 [ %t8227, %fixfast1793 ], [ %t8229, %fixslow1794 ]
  %t8231 = call i64 @rt_record_set(i64 %t8222, i64 24, i64 %t8230)
  %t8232 = and i64 %self, -8
  %t8233 = inttoptr i64 %t8232 to ptr
  %t8234 = getelementptr i64, ptr %t8233, i64 3
  %t8235 = load i64, ptr %t8234
  %t8236 = call i64 @rt_substring(i64 %t8235, i64 %t8218, i64 %a0)
  ret i64 %t8236
else1792:
  %t8237 = or i64 %a0, 8
  %t8238 = and i64 %t8237, 7
  %t8239 = icmp eq i64 %t8238, 0
  br i1 %t8239, label %fixfast1796, label %fixslow1797
fixfast1796:
  %t8240 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t8241 = extractvalue {i64, i1} %t8240, 0
  %t8242 = extractvalue {i64, i1} %t8240, 1
  br i1 %t8242, label %fixslow1797, label %fixmerge1798
fixslow1797:
  %t8243 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1798
fixmerge1798:
  %t8244 = phi i64 [ %t8241, %fixfast1796 ], [ %t8243, %fixslow1797 ]
  %t8245 = musttail call fastcc i64 @"scheme.base:code_1372"(i64 %self, i64 1, i64 %t8244, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8245
}

define fastcc i64 @"scheme.base:code:read-line"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8246 = icmp eq i64 %argc, 1
  br i1 %t8246, label %argok1800, label %arityerr1799
arityerr1799:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1800:
  %t8247 = call i64 @rt_intern(ptr @.str.sym.77)
  %t8248 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t8248)
  %t8249 = and i64 %t8248, -8
  %t8250 = inttoptr i64 %t8249 to ptr
  %t8251 = load i64, ptr %t8250
  %t8252 = inttoptr i64 %t8251 to ptr
  %t8253 = call fastcc i64%t8252(i64 %t8248, i64 2, i64 %a0, i64 %t8247, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8254 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t8254)
  %t8255 = and i64 %t8254, -8
  %t8256 = inttoptr i64 %t8255 to ptr
  %t8257 = load i64, ptr %t8256
  %t8258 = inttoptr i64 %t8257 to ptr
  %t8259 = call fastcc i64%t8258(i64 %t8254, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8260 = icmp ne i64 %t8259, 1
  br i1 %t8260, label %then1801, label %else1802
then1801:
  %t8261 = call i64 @rt_eof_object()
  ret i64 %t8261
else1802:
  %t8262 = load i64, ptr @"emit.internal:%port-buf"
  %t8263 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t8262, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8264 = call i64 @rt_string_length(i64 %t8263)
  %t8265 = call ptr @rt_alloc_words(i64 5)
  %t8266 = ptrtoint ptr %t8265 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1372" to i64), ptr %t8265
  %t8267 = or i64 %t8266, 4
  %t8268 = getelementptr i64, ptr %t8265, i64 1
  store i64 %t8264, ptr %t8268
  %t8269 = getelementptr i64, ptr %t8265, i64 2
  store i64 %a0, ptr %t8269
  %t8270 = getelementptr i64, ptr %t8265, i64 3
  store i64 %t8263, ptr %t8270
  %t8271 = getelementptr i64, ptr %t8265, i64 4
  store i64 %t8267, ptr %t8271
  %t8272 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t8273 = musttail call fastcc i64 @"scheme.base:code_1372"(i64 %t8267, i64 1, i64 %t8272, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8273
}

define fastcc i64 @"scheme.base:code:read-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8278 = icmp eq i64 %argc, 2
  br i1 %t8278, label %argok1804, label %arityerr1803
arityerr1803:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1804:
  %t8279 = call i64 @rt_intern(ptr @.str.sym.78)
  %t8280 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t8280)
  %t8281 = and i64 %t8280, -8
  %t8282 = inttoptr i64 %t8281 to ptr
  %t8283 = load i64, ptr %t8282
  %t8284 = inttoptr i64 %t8283 to ptr
  %t8285 = call fastcc i64%t8284(i64 %t8280, i64 2, i64 %a1, i64 %t8279, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8286 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t8286)
  %t8287 = and i64 %t8286, -8
  %t8288 = inttoptr i64 %t8287 to ptr
  %t8289 = load i64, ptr %t8288
  %t8290 = inttoptr i64 %t8289 to ptr
  %t8291 = call fastcc i64%t8290(i64 %t8286, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8292 = icmp ne i64 %t8291, 1
  br i1 %t8292, label %then1805, label %else1806
then1805:
  %t8293 = call i64 @rt_eof_object()
  ret i64 %t8293
else1806:
  %t8294 = load i64, ptr @"emit.internal:%port-buf"
  %t8295 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t8294, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8296 = call i64 @rt_string_length(i64 %t8295)
  %t8297 = call i64 @rt_record_ref(i64 %a1, i64 24)
  %t8298 = or i64 %t8297, %a0
  %t8299 = and i64 %t8298, 7
  %t8300 = icmp eq i64 %t8299, 0
  br i1 %t8300, label %fixfast1807, label %fixslow1808
fixfast1807:
  %t8301 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t8297, i64 %a0)
  %t8302 = extractvalue {i64, i1} %t8301, 0
  %t8303 = extractvalue {i64, i1} %t8301, 1
  br i1 %t8303, label %fixslow1808, label %fixmerge1809
fixslow1808:
  %t8304 = call i64 @rt_add(i64 %t8297, i64 %a0)
  br label %fixmerge1809
fixmerge1809:
  %t8305 = phi i64 [ %t8302, %fixfast1807 ], [ %t8304, %fixslow1808 ]
  %t8306 = or i64 %t8296, %t8305
  %t8307 = and i64 %t8306, 7
  %t8308 = icmp eq i64 %t8307, 0
  br i1 %t8308, label %fixfast1810, label %fixslow1811
fixfast1810:
  %t8309 = icmp slt i64 %t8296, %t8305
  %t8310 = select i1 %t8309, i64 257, i64 1
  br label %fixmerge1812
fixslow1811:
  %t8311 = call i64 @rt_lt(i64 %t8296, i64 %t8305)
  br label %fixmerge1812
fixmerge1812:
  %t8312 = phi i64 [ %t8310, %fixfast1810 ], [ %t8311, %fixslow1811 ]
  %t8313 = icmp ne i64 %t8312, 1
  br i1 %t8313, label %then1813, label %else1814
then1813:
  br label %merge1815
else1814:
  %t8314 = or i64 %t8297, %a0
  %t8315 = and i64 %t8314, 7
  %t8316 = icmp eq i64 %t8315, 0
  br i1 %t8316, label %fixfast1816, label %fixslow1817
fixfast1816:
  %t8317 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t8297, i64 %a0)
  %t8318 = extractvalue {i64, i1} %t8317, 0
  %t8319 = extractvalue {i64, i1} %t8317, 1
  br i1 %t8319, label %fixslow1817, label %fixmerge1818
fixslow1817:
  %t8320 = call i64 @rt_add(i64 %t8297, i64 %a0)
  br label %fixmerge1818
fixmerge1818:
  %t8321 = phi i64 [ %t8318, %fixfast1816 ], [ %t8320, %fixslow1817 ]
  br label %merge1815
merge1815:
  %t8322 = phi i64 [ %t8296, %then1813 ], [ %t8321, %fixmerge1818 ]
  %t8323 = call i64 @rt_record_set(i64 %a1, i64 24, i64 %t8322)
  %t8324 = call i64 @rt_substring(i64 %t8295, i64 %t8297, i64 %t8322)
  ret i64 %t8324
}

define fastcc i64 @"scheme.base:code:open-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8329 = icmp eq i64 %argc, 0
  br i1 %t8329, label %argok1820, label %arityerr1819
arityerr1819:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1820:
  %t8330 = call i64 @rt_port_open_output_string()
  %t8331 = icmp ne i64 %t8330, 1
  br i1 %t8331, label %then1821, label %else1822
then1821:
  %t8332 = load i64, ptr @"emit.internal:%make-port"
  %t8333 = musttail call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8332, i64 6, i64 %t8330, i64 1, i64 1, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t8333
else1822:
  %t8334 = call i64 @rt_intern(ptr @.str.sym.79)
  %t8335 = call i64 @rt_make_string(ptr @.str.lit.80, i64 33)
  %t8336 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8336)
  %t8337 = and i64 %t8336, -8
  %t8338 = inttoptr i64 %t8337 to ptr
  %t8339 = load i64, ptr %t8338
  %t8340 = inttoptr i64 %t8339 to ptr
  %t8341 = musttail call fastcc i64 %t8340(i64 %t8336, i64 2, i64 %t8334, i64 %t8335, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8341
}

define fastcc i64 @"scheme.base:code:get-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8346 = icmp eq i64 %argc, 1
  br i1 %t8346, label %argok1824, label %arityerr1823
arityerr1823:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1824:
  %t8347 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t8347)
  %t8348 = and i64 %t8347, -8
  %t8349 = inttoptr i64 %t8348 to ptr
  %t8350 = load i64, ptr %t8349
  %t8351 = inttoptr i64 %t8350 to ptr
  %t8352 = call fastcc i64%t8351(i64 %t8347, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8353 = call i64 @rt_not(i64 %t8352)
  %t8354 = icmp ne i64 %t8353, 1
  br i1 %t8354, label %then1825, label %else1826
then1825:
  %t8355 = call i64 @rt_intern(ptr @.str.sym.81)
  %t8356 = call i64 @rt_make_string(ptr @.str.lit.82, i64 18)
  %t8357 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8357)
  %t8358 = and i64 %t8357, -8
  %t8359 = inttoptr i64 %t8358 to ptr
  %t8360 = load i64, ptr %t8359
  %t8361 = inttoptr i64 %t8360 to ptr
  %t8362 = musttail call fastcc i64 %t8361(i64 %t8357, i64 3, i64 %t8355, i64 %t8356, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8362
else1826:
  %t8363 = call i64 @rt_record_ref(i64 %a0, i64 32)
  %t8364 = call i64 @rt_not(i64 %t8363)
  %t8365 = icmp ne i64 %t8364, 1
  br i1 %t8365, label %then1827, label %else1828
then1827:
  %t8366 = call i64 @rt_intern(ptr @.str.sym.81)
  %t8367 = call i64 @rt_make_string(ptr @.str.lit.83, i64 17)
  %t8368 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8368)
  %t8369 = and i64 %t8368, -8
  %t8370 = inttoptr i64 %t8369 to ptr
  %t8371 = load i64, ptr %t8370
  %t8372 = inttoptr i64 %t8371 to ptr
  %t8373 = musttail call fastcc i64 %t8372(i64 %t8368, i64 3, i64 %t8366, i64 %t8367, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8373
else1828:
  %t8374 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t8375 = call i64 @rt_port_get_output_string(i64 %t8374)
  ret i64 %t8375
}

define fastcc i64 @"scheme.base:code:flush-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8380 = icmp eq i64 %argc, 1
  br i1 %t8380, label %argok1830, label %arityerr1829
arityerr1829:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1830:
  %t8381 = call i64 @rt_intern(ptr @.str.sym.84)
  %t8382 = load i64, ptr @"scheme.base:%check-output-port"
  call void @rt_check_callable(i64 %t8382)
  %t8383 = and i64 %t8382, -8
  %t8384 = inttoptr i64 %t8383 to ptr
  %t8385 = load i64, ptr %t8384
  %t8386 = inttoptr i64 %t8385 to ptr
  %t8387 = call fastcc i64%t8386(i64 %t8382, i64 2, i64 %a0, i64 %t8381, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8388 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t8389 = call i64 @rt_port_flush(i64 %t8388)
  ret i64 %t8389
}

define fastcc i64 @"scheme.base:code:close-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8394 = icmp eq i64 %argc, 1
  br i1 %t8394, label %argok1832, label %arityerr1831
arityerr1831:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1832:
  %t8395 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t8395)
  %t8396 = and i64 %t8395, -8
  %t8397 = inttoptr i64 %t8396 to ptr
  %t8398 = load i64, ptr %t8397
  %t8399 = inttoptr i64 %t8398 to ptr
  %t8400 = call fastcc i64%t8399(i64 %t8395, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8401 = call i64 @rt_not(i64 %t8400)
  %t8402 = icmp ne i64 %t8401, 1
  br i1 %t8402, label %then1833, label %else1834
then1833:
  %t8403 = call i64 @rt_intern(ptr @.str.sym.85)
  %t8404 = call i64 @rt_make_string(ptr @.str.lit.86, i64 10)
  %t8405 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8405)
  %t8406 = and i64 %t8405, -8
  %t8407 = inttoptr i64 %t8406 to ptr
  %t8408 = load i64, ptr %t8407
  %t8409 = inttoptr i64 %t8408 to ptr
  %t8410 = musttail call fastcc i64 %t8409(i64 %t8405, i64 3, i64 %t8403, i64 %t8404, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8410
else1834:
  %t8411 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t8412 = icmp ne i64 %t8411, 1
  br i1 %t8412, label %then1835, label %else1836
then1835:
  %t8413 = icmp ne i64 1, 1
  br i1 %t8413, label %then1837, label %else1838
then1837:
  ret i64 1
else1838:
  ret i64 17
else1836:
  %t8414 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t8415 = call i64 @rt_not(i64 %t8414)
  %t8416 = icmp ne i64 %t8415, 1
  br i1 %t8416, label %then1839, label %else1840
then1839:
  %t8417 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t8418 = call i64 @rt_port_close(i64 %t8417)
  br label %merge1841
else1840:
  br label %merge1841
merge1841:
  %t8419 = phi i64 [ %t8418, %then1839 ], [ 17, %else1840 ]
  %t8420 = call i64 @rt_record_set(i64 %a0, i64 40, i64 257)
  %t8421 = icmp ne i64 1, 1
  br i1 %t8421, label %then1842, label %else1843
then1842:
  ret i64 1
else1843:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:close-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8426 = icmp eq i64 %argc, 1
  br i1 %t8426, label %argok1845, label %arityerr1844
arityerr1844:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1845:
  %t8427 = load i64, ptr @"scheme.base:input-port?"
  call void @rt_check_callable(i64 %t8427)
  %t8428 = and i64 %t8427, -8
  %t8429 = inttoptr i64 %t8428 to ptr
  %t8430 = load i64, ptr %t8429
  %t8431 = inttoptr i64 %t8430 to ptr
  %t8432 = call fastcc i64%t8431(i64 %t8427, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8433 = icmp ne i64 %t8432, 1
  br i1 %t8433, label %then1846, label %else1847
then1846:
  %t8434 = load i64, ptr @"scheme.base:close-port"
  call void @rt_check_callable(i64 %t8434)
  %t8435 = and i64 %t8434, -8
  %t8436 = inttoptr i64 %t8435 to ptr
  %t8437 = load i64, ptr %t8436
  %t8438 = inttoptr i64 %t8437 to ptr
  %t8439 = musttail call fastcc i64 %t8438(i64 %t8434, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8439
else1847:
  %t8440 = call i64 @rt_intern(ptr @.str.sym.87)
  %t8441 = call i64 @rt_make_string(ptr @.str.lit.88, i64 17)
  %t8442 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8442)
  %t8443 = and i64 %t8442, -8
  %t8444 = inttoptr i64 %t8443 to ptr
  %t8445 = load i64, ptr %t8444
  %t8446 = inttoptr i64 %t8445 to ptr
  %t8447 = musttail call fastcc i64 %t8446(i64 %t8442, i64 3, i64 %t8440, i64 %t8441, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8447
}

define fastcc i64 @"scheme.base:code:close-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8452 = icmp eq i64 %argc, 1
  br i1 %t8452, label %argok1849, label %arityerr1848
arityerr1848:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1849:
  %t8453 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t8453)
  %t8454 = and i64 %t8453, -8
  %t8455 = inttoptr i64 %t8454 to ptr
  %t8456 = load i64, ptr %t8455
  %t8457 = inttoptr i64 %t8456 to ptr
  %t8458 = call fastcc i64%t8457(i64 %t8453, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8459 = icmp ne i64 %t8458, 1
  br i1 %t8459, label %then1850, label %else1851
then1850:
  %t8460 = load i64, ptr @"scheme.base:close-port"
  call void @rt_check_callable(i64 %t8460)
  %t8461 = and i64 %t8460, -8
  %t8462 = inttoptr i64 %t8461 to ptr
  %t8463 = load i64, ptr %t8462
  %t8464 = inttoptr i64 %t8463 to ptr
  %t8465 = musttail call fastcc i64 %t8464(i64 %t8460, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8465
else1851:
  %t8466 = call i64 @rt_intern(ptr @.str.sym.89)
  %t8467 = call i64 @rt_make_string(ptr @.str.lit.90, i64 18)
  %t8468 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8468)
  %t8469 = and i64 %t8468, -8
  %t8470 = inttoptr i64 %t8469 to ptr
  %t8471 = load i64, ptr %t8470
  %t8472 = inttoptr i64 %t8471 to ptr
  %t8473 = musttail call fastcc i64 %t8472(i64 %t8468, i64 3, i64 %t8466, i64 %t8467, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8473
}

define fastcc i64 @"scheme.base:code:current-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8481 = icmp sge i64 %argc, 0
  br i1 %t8481, label %argok1853, label %arityerr1852
arityerr1852:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1853:
  %t8482 = call ptr @rt_alloc_words(i64 8)
  %t8483 = getelementptr i64, ptr %t8482, i64 0
  store i64 %a0, ptr %t8483
  %t8484 = getelementptr i64, ptr %t8482, i64 1
  store i64 %a1, ptr %t8484
  %t8485 = getelementptr i64, ptr %t8482, i64 2
  store i64 %a2, ptr %t8485
  %t8486 = getelementptr i64, ptr %t8482, i64 3
  store i64 %a3, ptr %t8486
  %t8487 = getelementptr i64, ptr %t8482, i64 4
  store i64 %a4, ptr %t8487
  %t8488 = getelementptr i64, ptr %t8482, i64 5
  store i64 %a5, ptr %t8488
  %t8489 = getelementptr i64, ptr %t8482, i64 6
  store i64 %a6, ptr %t8489
  %t8490 = getelementptr i64, ptr %t8482, i64 7
  store i64 %a7, ptr %t8490
  %t8491 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t8482, ptr %overflow)
  %t8492 = call i64 @rt_null_p(i64 %t8491)
  %t8493 = icmp ne i64 %t8492, 1
  br i1 %t8493, label %then1854, label %else1855
then1854:
  %t8494 = load i64, ptr @"scheme.base:%stdout-port"
  %t8495 = call i64 @rt_not(i64 %t8494)
  %t8496 = icmp ne i64 %t8495, 1
  br i1 %t8496, label %then1856, label %else1857
then1856:
  %t8497 = load i64, ptr @"emit.internal:%make-port"
  %t8498 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8497, i64 6, i64 0, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t8499 = call i64 @rt_root(i64 %t8498)
  store i64 %t8499, ptr @"scheme.base:%stdout-port"
  %t8500 = call i64 @rt_set_current_output(i64 0)
  br label %merge1858
else1857:
  br label %merge1858
merge1858:
  %t8501 = phi i64 [ %t8500, %then1856 ], [ 17, %else1857 ]
  %t8502 = load i64, ptr @"scheme.base:%stdout-port"
  ret i64 %t8502
else1855:
  %t8503 = call i64 @rt_car(i64 %t8491)
  %t8504 = call i64 @rt_root(i64 %t8503)
  store i64 %t8504, ptr @"scheme.base:%stdout-port"
  %t8505 = call i64 @rt_record_ref(i64 %t8503, i64 0)
  %t8506 = call i64 @rt_set_current_output(i64 %t8505)
  %t8507 = icmp ne i64 1, 1
  br i1 %t8507, label %then1859, label %else1860
then1859:
  ret i64 1
else1860:
  ret i64 17
}

define fastcc i64 @"min-entry:$scheme.base$ccode$ccurrent-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8508 = call i64 @rt_null_p(i64 2)
  %t8509 = icmp ne i64 %t8508, 1
  br i1 %t8509, label %then1861, label %else1862
then1861:
  %t8510 = load i64, ptr @"scheme.base:%stdout-port"
  %t8511 = call i64 @rt_not(i64 %t8510)
  %t8512 = icmp ne i64 %t8511, 1
  br i1 %t8512, label %then1863, label %else1864
then1863:
  %t8513 = load i64, ptr @"emit.internal:%make-port"
  %t8514 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8513, i64 6, i64 0, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t8515 = call i64 @rt_root(i64 %t8514)
  store i64 %t8515, ptr @"scheme.base:%stdout-port"
  %t8516 = call i64 @rt_set_current_output(i64 0)
  br label %merge1865
else1864:
  br label %merge1865
merge1865:
  %t8517 = phi i64 [ %t8516, %then1863 ], [ 17, %else1864 ]
  %t8518 = load i64, ptr @"scheme.base:%stdout-port"
  ret i64 %t8518
else1862:
  %t8519 = call i64 @rt_car(i64 2)
  %t8520 = call i64 @rt_root(i64 %t8519)
  store i64 %t8520, ptr @"scheme.base:%stdout-port"
  %t8521 = call i64 @rt_record_ref(i64 %t8519, i64 0)
  %t8522 = call i64 @rt_set_current_output(i64 %t8521)
  %t8523 = icmp ne i64 1, 1
  br i1 %t8523, label %then1866, label %else1867
then1866:
  ret i64 1
else1867:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-error-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8528 = icmp sge i64 %argc, 0
  br i1 %t8528, label %argok1869, label %arityerr1868
arityerr1868:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1869:
  %t8529 = call ptr @rt_alloc_words(i64 8)
  %t8530 = getelementptr i64, ptr %t8529, i64 0
  store i64 %a0, ptr %t8530
  %t8531 = getelementptr i64, ptr %t8529, i64 1
  store i64 %a1, ptr %t8531
  %t8532 = getelementptr i64, ptr %t8529, i64 2
  store i64 %a2, ptr %t8532
  %t8533 = getelementptr i64, ptr %t8529, i64 3
  store i64 %a3, ptr %t8533
  %t8534 = getelementptr i64, ptr %t8529, i64 4
  store i64 %a4, ptr %t8534
  %t8535 = getelementptr i64, ptr %t8529, i64 5
  store i64 %a5, ptr %t8535
  %t8536 = getelementptr i64, ptr %t8529, i64 6
  store i64 %a6, ptr %t8536
  %t8537 = getelementptr i64, ptr %t8529, i64 7
  store i64 %a7, ptr %t8537
  %t8538 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t8529, ptr %overflow)
  %t8539 = call i64 @rt_null_p(i64 %t8538)
  %t8540 = icmp ne i64 %t8539, 1
  br i1 %t8540, label %then1870, label %else1871
then1870:
  %t8541 = load i64, ptr @"scheme.base:%stderr-port"
  %t8542 = call i64 @rt_not(i64 %t8541)
  %t8543 = icmp ne i64 %t8542, 1
  br i1 %t8543, label %then1872, label %else1873
then1872:
  %t8544 = load i64, ptr @"emit.internal:%make-port"
  %t8545 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8544, i64 6, i64 8, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t8546 = call i64 @rt_root(i64 %t8545)
  store i64 %t8546, ptr @"scheme.base:%stderr-port"
  br label %merge1874
else1873:
  br label %merge1874
merge1874:
  %t8547 = phi i64 [ 17, %then1872 ], [ 17, %else1873 ]
  %t8548 = load i64, ptr @"scheme.base:%stderr-port"
  ret i64 %t8548
else1871:
  %t8549 = call i64 @rt_car(i64 %t8538)
  %t8550 = call i64 @rt_root(i64 %t8549)
  store i64 %t8550, ptr @"scheme.base:%stderr-port"
  %t8551 = icmp ne i64 1, 1
  br i1 %t8551, label %then1875, label %else1876
then1875:
  ret i64 1
else1876:
  ret i64 17
}

define fastcc i64 @"min-entry:$scheme.base$ccode$ccurrent-error-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8552 = call i64 @rt_null_p(i64 2)
  %t8553 = icmp ne i64 %t8552, 1
  br i1 %t8553, label %then1877, label %else1878
then1877:
  %t8554 = load i64, ptr @"scheme.base:%stderr-port"
  %t8555 = call i64 @rt_not(i64 %t8554)
  %t8556 = icmp ne i64 %t8555, 1
  br i1 %t8556, label %then1879, label %else1880
then1879:
  %t8557 = load i64, ptr @"emit.internal:%make-port"
  %t8558 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8557, i64 6, i64 8, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t8559 = call i64 @rt_root(i64 %t8558)
  store i64 %t8559, ptr @"scheme.base:%stderr-port"
  br label %merge1881
else1880:
  br label %merge1881
merge1881:
  %t8560 = phi i64 [ 17, %then1879 ], [ 17, %else1880 ]
  %t8561 = load i64, ptr @"scheme.base:%stderr-port"
  ret i64 %t8561
else1878:
  %t8562 = call i64 @rt_car(i64 2)
  %t8563 = call i64 @rt_root(i64 %t8562)
  store i64 %t8563, ptr @"scheme.base:%stderr-port"
  %t8564 = icmp ne i64 1, 1
  br i1 %t8564, label %then1882, label %else1883
then1882:
  ret i64 1
else1883:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8569 = icmp sge i64 %argc, 0
  br i1 %t8569, label %argok1885, label %arityerr1884
arityerr1884:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1885:
  %t8570 = call ptr @rt_alloc_words(i64 8)
  %t8571 = getelementptr i64, ptr %t8570, i64 0
  store i64 %a0, ptr %t8571
  %t8572 = getelementptr i64, ptr %t8570, i64 1
  store i64 %a1, ptr %t8572
  %t8573 = getelementptr i64, ptr %t8570, i64 2
  store i64 %a2, ptr %t8573
  %t8574 = getelementptr i64, ptr %t8570, i64 3
  store i64 %a3, ptr %t8574
  %t8575 = getelementptr i64, ptr %t8570, i64 4
  store i64 %a4, ptr %t8575
  %t8576 = getelementptr i64, ptr %t8570, i64 5
  store i64 %a5, ptr %t8576
  %t8577 = getelementptr i64, ptr %t8570, i64 6
  store i64 %a6, ptr %t8577
  %t8578 = getelementptr i64, ptr %t8570, i64 7
  store i64 %a7, ptr %t8578
  %t8579 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t8570, ptr %overflow)
  %t8580 = call i64 @rt_null_p(i64 %t8579)
  %t8581 = icmp ne i64 %t8580, 1
  br i1 %t8581, label %then1886, label %else1887
then1886:
  %t8582 = load i64, ptr @"scheme.base:%stdin-port"
  %t8583 = call i64 @rt_not(i64 %t8582)
  %t8584 = icmp ne i64 %t8583, 1
  br i1 %t8584, label %then1888, label %else1889
then1888:
  %t8585 = load i64, ptr @"emit.internal:%make-port"
  %t8586 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8585, i64 6, i64 1, i64 257, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t8587 = call i64 @rt_root(i64 %t8586)
  store i64 %t8587, ptr @"scheme.base:%stdin-port"
  br label %merge1890
else1889:
  br label %merge1890
merge1890:
  %t8588 = phi i64 [ 17, %then1888 ], [ 17, %else1889 ]
  %t8589 = load i64, ptr @"scheme.base:%stdin-port"
  ret i64 %t8589
else1887:
  %t8590 = call i64 @rt_car(i64 %t8579)
  %t8591 = call i64 @rt_root(i64 %t8590)
  store i64 %t8591, ptr @"scheme.base:%stdin-port"
  %t8592 = icmp ne i64 1, 1
  br i1 %t8592, label %then1891, label %else1892
then1891:
  ret i64 1
else1892:
  ret i64 17
}

define fastcc i64 @"min-entry:$scheme.base$ccode$ccurrent-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8593 = call i64 @rt_null_p(i64 2)
  %t8594 = icmp ne i64 %t8593, 1
  br i1 %t8594, label %then1893, label %else1894
then1893:
  %t8595 = load i64, ptr @"scheme.base:%stdin-port"
  %t8596 = call i64 @rt_not(i64 %t8595)
  %t8597 = icmp ne i64 %t8596, 1
  br i1 %t8597, label %then1895, label %else1896
then1895:
  %t8598 = load i64, ptr @"emit.internal:%make-port"
  %t8599 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8598, i64 6, i64 1, i64 257, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t8600 = call i64 @rt_root(i64 %t8599)
  store i64 %t8600, ptr @"scheme.base:%stdin-port"
  br label %merge1897
else1896:
  br label %merge1897
merge1897:
  %t8601 = phi i64 [ 17, %then1895 ], [ 17, %else1896 ]
  %t8602 = load i64, ptr @"scheme.base:%stdin-port"
  ret i64 %t8602
else1894:
  %t8603 = call i64 @rt_car(i64 2)
  %t8604 = call i64 @rt_root(i64 %t8603)
  store i64 %t8604, ptr @"scheme.base:%stdin-port"
  %t8605 = icmp ne i64 1, 1
  br i1 %t8605, label %then1898, label %else1899
then1898:
  ret i64 1
else1899:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_1407"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8610 = icmp eq i64 %argc, 0
  br i1 %t8610, label %argok1901, label %arityerr1900
arityerr1900:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1901:
  %t8611 = icmp ne i64 1, 1
  br i1 %t8611, label %then1902, label %else1903
then1902:
  ret i64 1
else1903:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_1409"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8612 = icmp eq i64 %argc, 0
  br i1 %t8612, label %argok1905, label %arityerr1904
arityerr1904:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1905:
  %t8613 = and i64 %self, -8
  %t8614 = inttoptr i64 %t8613 to ptr
  %t8615 = getelementptr i64, ptr %t8614, i64 2
  %t8616 = load i64, ptr %t8615
  %t8617 = and i64 %self, -8
  %t8618 = inttoptr i64 %t8617 to ptr
  %t8619 = getelementptr i64, ptr %t8618, i64 1
  %t8620 = load i64, ptr %t8619
  call void @rt_check_callable(i64 %t8620)
  %t8621 = and i64 %t8620, -8
  %t8622 = inttoptr i64 %t8621 to ptr
  %t8623 = load i64, ptr %t8622
  %t8624 = inttoptr i64 %t8623 to ptr
  %t8625 = musttail call fastcc i64 %t8624(i64 %t8620, i64 1, i64 %t8616, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8625
}

define fastcc i64 @"scheme.base:code_1411"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8626 = icmp eq i64 %argc, 0
  br i1 %t8626, label %argok1907, label %arityerr1906
arityerr1906:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1907:
  %t8627 = and i64 %self, -8
  %t8628 = inttoptr i64 %t8627 to ptr
  %t8629 = getelementptr i64, ptr %t8628, i64 1
  %t8630 = load i64, ptr %t8629
  %t8631 = load i64, ptr @"scheme.base:close-port"
  call void @rt_check_callable(i64 %t8631)
  %t8632 = and i64 %t8631, -8
  %t8633 = inttoptr i64 %t8632 to ptr
  %t8634 = load i64, ptr %t8633
  %t8635 = inttoptr i64 %t8634 to ptr
  %t8636 = musttail call fastcc i64 %t8635(i64 %t8631, i64 1, i64 %t8630, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8636
}

define fastcc i64 @"scheme.base:code:call-with-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8637 = icmp eq i64 %argc, 2
  br i1 %t8637, label %argok1909, label %arityerr1908
arityerr1908:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1909:
  %t8638 = call ptr @rt_alloc_words(i64 1)
  %t8639 = ptrtoint ptr %t8638 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1407" to i64), ptr %t8638
  %t8640 = or i64 %t8639, 4
  %t8641 = call ptr @rt_alloc_words(i64 3)
  %t8642 = ptrtoint ptr %t8641 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1409" to i64), ptr %t8641
  %t8643 = getelementptr i64, ptr %t8641, i64 1
  store i64 %a1, ptr %t8643
  %t8644 = getelementptr i64, ptr %t8641, i64 2
  store i64 %a0, ptr %t8644
  %t8645 = or i64 %t8642, 4
  %t8646 = call ptr @rt_alloc_words(i64 2)
  %t8647 = ptrtoint ptr %t8646 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1411" to i64), ptr %t8646
  %t8648 = getelementptr i64, ptr %t8646, i64 1
  store i64 %a0, ptr %t8648
  %t8649 = or i64 %t8647, 4
  %t8650 = load i64, ptr @"scheme.base:dynamic-wind"
  call void @rt_check_callable(i64 %t8650)
  %t8651 = and i64 %t8650, -8
  %t8652 = inttoptr i64 %t8651 to ptr
  %t8653 = load i64, ptr %t8652
  %t8654 = inttoptr i64 %t8653 to ptr
  %t8655 = musttail call fastcc i64 %t8654(i64 %t8650, i64 3, i64 %t8640, i64 %t8645, i64 %t8649, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8655
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
  %t195 = call ptr @rt_alloc_words(i64 1)
  %t196 = ptrtoint ptr %t195 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:append" to i64), ptr %t195
  %t197 = or i64 %t196, 4
  %t198 = call i64 @rt_root(i64 %t197)
  store i64 %t198, ptr @"scheme.base:append"
  ret i64 17
}

define i64 @"scheme.base:__init_10"() {
entry:
  %t216 = call ptr @rt_alloc_words(i64 1)
  %t217 = ptrtoint ptr %t216 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%map1" to i64), ptr %t216
  %t218 = or i64 %t217, 4
  %t219 = call i64 @rt_root(i64 %t218)
  store i64 %t219, ptr @"scheme.base:%map1"
  ret i64 17
}

define i64 @"scheme.base:__init_11"() {
entry:
  %t233 = call ptr @rt_alloc_words(i64 1)
  %t234 = ptrtoint ptr %t233 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%any-null?" to i64), ptr %t233
  %t235 = or i64 %t234, 4
  %t236 = call i64 @rt_root(i64 %t235)
  store i64 %t236, ptr @"scheme.base:%any-null?"
  ret i64 17
}

define i64 @"scheme.base:__init_12"() {
entry:
  %t301 = call ptr @rt_alloc_words(i64 1)
  %t302 = ptrtoint ptr %t301 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%mapn" to i64), ptr %t301
  %t303 = or i64 %t302, 4
  %t304 = call i64 @rt_root(i64 %t303)
  store i64 %t304, ptr @"scheme.base:%mapn"
  ret i64 17
}

define i64 @"scheme.base:__init_13"() {
entry:
  %t346 = call ptr @rt_alloc_words(i64 1)
  %t347 = ptrtoint ptr %t346 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:map" to i64), ptr %t346
  %t348 = or i64 %t347, 4
  %t349 = call i64 @rt_root(i64 %t348)
  store i64 %t349, ptr @"scheme.base:map"
  ret i64 17
}

define i64 @"scheme.base:__init_14"() {
entry:
  %t363 = call ptr @rt_alloc_words(i64 1)
  %t364 = ptrtoint ptr %t363 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:memq" to i64), ptr %t363
  %t365 = or i64 %t364, 4
  %t366 = call i64 @rt_root(i64 %t365)
  store i64 %t366, ptr @"scheme.base:memq"
  ret i64 17
}

define i64 @"scheme.base:__init_15"() {
entry:
  %t380 = call ptr @rt_alloc_words(i64 1)
  %t381 = ptrtoint ptr %t380 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:memv" to i64), ptr %t380
  %t382 = or i64 %t381, 4
  %t383 = call i64 @rt_root(i64 %t382)
  store i64 %t383, ptr @"scheme.base:memv"
  ret i64 17
}

define i64 @"scheme.base:__init_16"() {
entry:
  %t399 = call ptr @rt_alloc_words(i64 1)
  %t400 = ptrtoint ptr %t399 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:assq" to i64), ptr %t399
  %t401 = or i64 %t400, 4
  %t402 = call i64 @rt_root(i64 %t401)
  store i64 %t402, ptr @"scheme.base:assq"
  ret i64 17
}

define i64 @"scheme.base:__init_17"() {
entry:
  %t456 = call ptr @rt_alloc_words(i64 1)
  %t457 = ptrtoint ptr %t456 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:member" to i64), ptr %t456
  %t458 = or i64 %t457, 4
  %t459 = call i64 @rt_root(i64 %t458)
  store i64 %t459, ptr @"scheme.base:member"
  ret i64 17
}

define i64 @"scheme.base:__init_18"() {
entry:
  %t477 = call ptr @rt_alloc_words(i64 1)
  %t478 = ptrtoint ptr %t477 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:member-by" to i64), ptr %t477
  %t479 = or i64 %t478, 4
  %t480 = call i64 @rt_root(i64 %t479)
  store i64 %t480, ptr @"scheme.base:member-by"
  ret i64 17
}

define i64 @"scheme.base:__init_19"() {
entry:
  %t538 = call ptr @rt_alloc_words(i64 1)
  %t539 = ptrtoint ptr %t538 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:assoc" to i64), ptr %t538
  %t540 = or i64 %t539, 4
  %t541 = call i64 @rt_root(i64 %t540)
  store i64 %t541, ptr @"scheme.base:assoc"
  ret i64 17
}

define i64 @"scheme.base:__init_20"() {
entry:
  %t561 = call ptr @rt_alloc_words(i64 1)
  %t562 = ptrtoint ptr %t561 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:assoc-by" to i64), ptr %t561
  %t563 = or i64 %t562, 4
  %t564 = call i64 @rt_root(i64 %t563)
  store i64 %t564, ptr @"scheme.base:assoc-by"
  ret i64 17
}

define i64 @"scheme.base:__init_21"() {
entry:
  %t591 = call ptr @rt_alloc_words(i64 1)
  %t592 = ptrtoint ptr %t591 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:filter" to i64), ptr %t591
  %t593 = or i64 %t592, 4
  %t594 = call i64 @rt_root(i64 %t593)
  store i64 %t594, ptr @"scheme.base:filter"
  ret i64 17
}

define i64 @"scheme.base:__init_22"() {
entry:
  %t611 = call ptr @rt_alloc_words(i64 1)
  %t612 = ptrtoint ptr %t611 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:fold-left" to i64), ptr %t611
  %t613 = or i64 %t612, 4
  %t614 = call i64 @rt_root(i64 %t613)
  store i64 %t614, ptr @"scheme.base:fold-left"
  ret i64 17
}

define i64 @"scheme.base:__init_23"() {
entry:
  %t631 = call ptr @rt_alloc_words(i64 1)
  %t632 = ptrtoint ptr %t631 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:fold-right" to i64), ptr %t631
  %t633 = or i64 %t632, 4
  %t634 = call i64 @rt_root(i64 %t633)
  store i64 %t634, ptr @"scheme.base:fold-right"
  ret i64 17
}

define i64 @"scheme.base:__init_24"() {
entry:
  %t652 = call ptr @rt_alloc_words(i64 1)
  %t653 = ptrtoint ptr %t652 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%for-each1" to i64), ptr %t652
  %t654 = or i64 %t653, 4
  %t655 = call i64 @rt_root(i64 %t654)
  store i64 %t655, ptr @"scheme.base:%for-each1"
  ret i64 17
}

define i64 @"scheme.base:__init_25"() {
entry:
  %t720 = call ptr @rt_alloc_words(i64 1)
  %t721 = ptrtoint ptr %t720 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%for-eachn" to i64), ptr %t720
  %t722 = or i64 %t721, 4
  %t723 = call i64 @rt_root(i64 %t722)
  store i64 %t723, ptr @"scheme.base:%for-eachn"
  ret i64 17
}

define i64 @"scheme.base:__init_26"() {
entry:
  %t765 = call ptr @rt_alloc_words(i64 1)
  %t766 = ptrtoint ptr %t765 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:for-each" to i64), ptr %t765
  %t767 = or i64 %t766, 4
  %t768 = call i64 @rt_root(i64 %t767)
  store i64 %t768, ptr @"scheme.base:for-each"
  ret i64 17
}

define i64 @"scheme.base:__init_27"() {
entry:
  %t786 = call ptr @rt_alloc_words(i64 1)
  %t787 = ptrtoint ptr %t786 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:andmap" to i64), ptr %t786
  %t788 = or i64 %t787, 4
  %t789 = call i64 @rt_root(i64 %t788)
  store i64 %t789, ptr @"scheme.base:andmap"
  ret i64 17
}

define i64 @"scheme.base:__init_28"() {
entry:
  %t807 = call ptr @rt_alloc_words(i64 1)
  %t808 = ptrtoint ptr %t807 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:memp" to i64), ptr %t807
  %t809 = or i64 %t808, 4
  %t810 = call i64 @rt_root(i64 %t809)
  store i64 %t810, ptr @"scheme.base:memp"
  ret i64 17
}

define i64 @"scheme.base:__init_29"() {
entry:
  %t834 = call ptr @rt_alloc_words(i64 1)
  %t835 = ptrtoint ptr %t834 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list?" to i64), ptr %t834
  %t836 = or i64 %t835, 4
  %t837 = call i64 @rt_root(i64 %t836)
  store i64 %t837, ptr @"scheme.base:list?"
  ret i64 17
}

define i64 @"scheme.base:__init_30"() {
entry:
  %t846 = call ptr @rt_alloc_words(i64 1)
  %t847 = ptrtoint ptr %t846 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:zero?" to i64), ptr %t846
  %t848 = or i64 %t847, 4
  %t849 = call i64 @rt_root(i64 %t848)
  store i64 %t849, ptr @"scheme.base:zero?"
  ret i64 17
}

define i64 @"scheme.base:__init_31"() {
entry:
  %t873 = call ptr @rt_alloc_words(i64 1)
  %t874 = ptrtoint ptr %t873 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-tail" to i64), ptr %t873
  %t875 = or i64 %t874, 4
  %t876 = call i64 @rt_root(i64 %t875)
  store i64 %t876, ptr @"scheme.base:list-tail"
  ret i64 17
}

define i64 @"scheme.base:__init_32"() {
entry:
  %t885 = call ptr @rt_alloc_words(i64 1)
  %t886 = ptrtoint ptr %t885 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-ref" to i64), ptr %t885
  %t887 = or i64 %t886, 4
  %t888 = call i64 @rt_root(i64 %t887)
  store i64 %t888, ptr @"scheme.base:list-ref"
  ret i64 17
}

define i64 @"scheme.base:__init_33"() {
entry:
  %t897 = call ptr @rt_alloc_words(i64 1)
  %t898 = ptrtoint ptr %t897 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-set!" to i64), ptr %t897
  %t899 = or i64 %t898, 4
  %t900 = call i64 @rt_root(i64 %t899)
  store i64 %t900, ptr @"scheme.base:list-set!"
  ret i64 17
}

define i64 @"scheme.base:__init_34"() {
entry:
  %t926 = call ptr @rt_alloc_words(i64 1)
  %t927 = ptrtoint ptr %t926 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-head" to i64), ptr %t926
  %t928 = or i64 %t927, 4
  %t929 = call i64 @rt_root(i64 %t928)
  store i64 %t929, ptr @"scheme.base:list-head"
  ret i64 17
}

define i64 @"scheme.base:__init_35"() {
entry:
  %t953 = call ptr @rt_alloc_words(i64 1)
  %t954 = ptrtoint ptr %t953 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-list" to i64), ptr %t953
  %t955 = or i64 %t954, 4
  %t956 = call i64 @rt_root(i64 %t955)
  store i64 %t956, ptr @"scheme.base:make-list"
  ret i64 17
}

define i64 @"scheme.base:__init_36"() {
entry:
  %t993 = call ptr @rt_alloc_words(i64 1)
  %t994 = ptrtoint ptr %t993 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:iota" to i64), ptr %t993
  %t995 = or i64 %t994, 4
  %t996 = call i64 @rt_root(i64 %t995)
  store i64 %t996, ptr @"scheme.base:iota"
  ret i64 17
}

define i64 @"scheme.base:__init_37"() {
entry:
  %t1019 = call ptr @rt_alloc_words(i64 1)
  %t1020 = ptrtoint ptr %t1019 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%minmax-fold" to i64), ptr %t1019
  %t1021 = or i64 %t1020, 4
  %t1022 = call i64 @rt_root(i64 %t1021)
  store i64 %t1022, ptr @"scheme.base:%minmax-fold"
  ret i64 17
}

define i64 @"scheme.base:__init_38"() {
entry:
  %t1031 = call ptr @rt_alloc_words(i64 1)
  %t1032 = ptrtoint ptr %t1031 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%minmax" to i64), ptr %t1031
  %t1033 = or i64 %t1032, 4
  %t1034 = call i64 @rt_root(i64 %t1033)
  store i64 %t1034, ptr @"scheme.base:%minmax"
  ret i64 17
}

define i64 @"scheme.base:__init_39"() {
entry:
  %t1073 = call ptr @rt_alloc_words(i64 1)
  %t1074 = ptrtoint ptr %t1073 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:max" to i64), ptr %t1073
  %t1075 = or i64 %t1074, 4
  %t1076 = call i64 @rt_root(i64 %t1075)
  store i64 %t1076, ptr @"scheme.base:max"
  ret i64 17
}

define i64 @"scheme.base:__init_40"() {
entry:
  %t1115 = call ptr @rt_alloc_words(i64 1)
  %t1116 = ptrtoint ptr %t1115 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:min" to i64), ptr %t1115
  %t1117 = or i64 %t1116, 4
  %t1118 = call i64 @rt_root(i64 %t1117)
  store i64 %t1118, ptr @"scheme.base:min"
  ret i64 17
}

define i64 @"scheme.base:__init_41"() {
entry:
  %t1121 = call ptr @rt_alloc_words(i64 1)
  %t1122 = ptrtoint ptr %t1121 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:complex?" to i64), ptr %t1121
  %t1123 = or i64 %t1122, 4
  %t1124 = call i64 @rt_root(i64 %t1123)
  store i64 %t1124, ptr @"scheme.base:complex?"
  ret i64 17
}

define i64 @"scheme.base:__init_42"() {
entry:
  %t1129 = call ptr @rt_alloc_words(i64 1)
  %t1130 = ptrtoint ptr %t1129 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:exact-integer?" to i64), ptr %t1129
  %t1131 = or i64 %t1130, 4
  %t1132 = call i64 @rt_root(i64 %t1131)
  store i64 %t1132, ptr @"scheme.base:exact-integer?"
  ret i64 17
}

define i64 @"scheme.base:__init_43"() {
entry:
  %t1137 = call ptr @rt_alloc_words(i64 1)
  %t1138 = ptrtoint ptr %t1137 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rational?" to i64), ptr %t1137
  %t1139 = or i64 %t1138, 4
  %t1140 = call i64 @rt_root(i64 %t1139)
  store i64 %t1140, ptr @"scheme.base:rational?"
  ret i64 17
}

define i64 @"scheme.base:__init_44"() {
entry:
  %t1149 = call ptr @rt_alloc_words(i64 1)
  %t1150 = ptrtoint ptr %t1149 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:positive?" to i64), ptr %t1149
  %t1151 = or i64 %t1150, 4
  %t1152 = call i64 @rt_root(i64 %t1151)
  store i64 %t1152, ptr @"scheme.base:positive?"
  ret i64 17
}

define i64 @"scheme.base:__init_45"() {
entry:
  %t1161 = call ptr @rt_alloc_words(i64 1)
  %t1162 = ptrtoint ptr %t1161 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:negative?" to i64), ptr %t1161
  %t1163 = or i64 %t1162, 4
  %t1164 = call i64 @rt_root(i64 %t1163)
  store i64 %t1164, ptr @"scheme.base:negative?"
  ret i64 17
}

define i64 @"scheme.base:__init_46"() {
entry:
  %t1174 = call ptr @rt_alloc_words(i64 1)
  %t1175 = ptrtoint ptr %t1174 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:even?" to i64), ptr %t1174
  %t1176 = or i64 %t1175, 4
  %t1177 = call i64 @rt_root(i64 %t1176)
  store i64 %t1177, ptr @"scheme.base:even?"
  ret i64 17
}

define i64 @"scheme.base:__init_47"() {
entry:
  %t1188 = call ptr @rt_alloc_words(i64 1)
  %t1189 = ptrtoint ptr %t1188 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:odd?" to i64), ptr %t1188
  %t1190 = or i64 %t1189, 4
  %t1191 = call i64 @rt_root(i64 %t1190)
  store i64 %t1191, ptr @"scheme.base:odd?"
  ret i64 17
}

define i64 @"scheme.base:__init_48"() {
entry:
  %t1209 = call ptr @rt_alloc_words(i64 1)
  %t1210 = ptrtoint ptr %t1209 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:abs" to i64), ptr %t1209
  %t1211 = or i64 %t1210, 4
  %t1212 = call i64 @rt_root(i64 %t1211)
  store i64 %t1212, ptr @"scheme.base:abs"
  ret i64 17
}

define i64 @"scheme.base:__init_49"() {
entry:
  %t1223 = call ptr @rt_alloc_words(i64 1)
  %t1224 = ptrtoint ptr %t1223 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:square" to i64), ptr %t1223
  %t1225 = or i64 %t1224, 4
  %t1226 = call i64 @rt_root(i64 %t1225)
  store i64 %t1226, ptr @"scheme.base:square"
  ret i64 17
}

define i64 @"scheme.base:__init_50"() {
entry:
  %t1243 = call ptr @rt_alloc_words(i64 1)
  %t1244 = ptrtoint ptr %t1243 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%gcd2" to i64), ptr %t1243
  %t1245 = or i64 %t1244, 4
  %t1246 = call i64 @rt_root(i64 %t1245)
  store i64 %t1246, ptr @"scheme.base:%gcd2"
  ret i64 17
}

define i64 @"scheme.base:__init_51"() {
entry:
  %t1276 = call ptr @rt_alloc_words(i64 1)
  %t1277 = ptrtoint ptr %t1276 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%gcd-fold" to i64), ptr %t1276
  %t1278 = or i64 %t1277, 4
  %t1279 = call i64 @rt_root(i64 %t1278)
  store i64 %t1279, ptr @"scheme.base:%gcd-fold"
  ret i64 17
}

define i64 @"scheme.base:__init_52"() {
entry:
  %t1321 = call ptr @rt_alloc_words(i64 1)
  %t1322 = ptrtoint ptr %t1321 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%lcm-fold" to i64), ptr %t1321
  %t1323 = or i64 %t1322, 4
  %t1324 = call i64 @rt_root(i64 %t1323)
  store i64 %t1324, ptr @"scheme.base:%lcm-fold"
  ret i64 17
}

define i64 @"scheme.base:__init_53"() {
entry:
  %t1348 = call ptr @rt_alloc_words(i64 1)
  %t1349 = ptrtoint ptr %t1348 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:gcd" to i64), ptr %t1348
  %t1350 = or i64 %t1349, 4
  %t1351 = call i64 @rt_root(i64 %t1350)
  store i64 %t1351, ptr @"scheme.base:gcd"
  ret i64 17
}

define i64 @"scheme.base:__init_54"() {
entry:
  %t1375 = call ptr @rt_alloc_words(i64 1)
  %t1376 = ptrtoint ptr %t1375 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:lcm" to i64), ptr %t1375
  %t1377 = or i64 %t1376, 4
  %t1378 = call i64 @rt_root(i64 %t1377)
  store i64 %t1378, ptr @"scheme.base:lcm"
  ret i64 17
}

define i64 @"scheme.base:__init_55"() {
entry:
  %t1421 = call ptr @rt_alloc_words(i64 1)
  %t1422 = ptrtoint ptr %t1421 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%expt-exact" to i64), ptr %t1421
  %t1423 = or i64 %t1422, 4
  %t1424 = call i64 @rt_root(i64 %t1423)
  store i64 %t1424, ptr @"scheme.base:%expt-exact"
  ret i64 17
}

define i64 @"scheme.base:__init_56"() {
entry:
  %t1453 = call ptr @rt_alloc_words(i64 1)
  %t1454 = ptrtoint ptr %t1453 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:expt" to i64), ptr %t1453
  %t1455 = or i64 %t1454, 4
  %t1456 = call i64 @rt_root(i64 %t1455)
  store i64 %t1456, ptr @"scheme.base:expt"
  ret i64 17
}

define i64 @"scheme.base:__init_57"() {
entry:
  %t1482 = call ptr @rt_alloc_words(i64 1)
  %t1483 = ptrtoint ptr %t1482 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%isqrt-loop" to i64), ptr %t1482
  %t1484 = or i64 %t1483, 4
  %t1485 = call i64 @rt_root(i64 %t1484)
  store i64 %t1485, ptr @"scheme.base:%isqrt-loop"
  ret i64 17
}

define i64 @"scheme.base:__init_58"() {
entry:
  %t1501 = call ptr @rt_alloc_words(i64 1)
  %t1502 = ptrtoint ptr %t1501 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%isqrt" to i64), ptr %t1501
  %t1503 = or i64 %t1502, 4
  %t1504 = call i64 @rt_root(i64 %t1503)
  store i64 %t1504, ptr @"scheme.base:%isqrt"
  ret i64 17
}

define i64 @"scheme.base:__init_59"() {
entry:
  %t1535 = call ptr @rt_alloc_words(i64 1)
  %t1536 = ptrtoint ptr %t1535 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:exact-integer-sqrt" to i64), ptr %t1535
  %t1537 = or i64 %t1536, 4
  %t1538 = call i64 @rt_root(i64 %t1537)
  store i64 %t1538, ptr @"scheme.base:exact-integer-sqrt"
  ret i64 17
}

define i64 @"scheme.base:__init_60"() {
entry:
  %t1543 = call ptr @rt_alloc_words(i64 1)
  %t1544 = ptrtoint ptr %t1543 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:floor" to i64), ptr %t1543
  %t1545 = or i64 %t1544, 4
  %t1546 = call i64 @rt_root(i64 %t1545)
  store i64 %t1546, ptr @"scheme.base:floor"
  ret i64 17
}

define i64 @"scheme.base:__init_61"() {
entry:
  %t1551 = call ptr @rt_alloc_words(i64 1)
  %t1552 = ptrtoint ptr %t1551 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:ceiling" to i64), ptr %t1551
  %t1553 = or i64 %t1552, 4
  %t1554 = call i64 @rt_root(i64 %t1553)
  store i64 %t1554, ptr @"scheme.base:ceiling"
  ret i64 17
}

define i64 @"scheme.base:__init_62"() {
entry:
  %t1559 = call ptr @rt_alloc_words(i64 1)
  %t1560 = ptrtoint ptr %t1559 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:truncate" to i64), ptr %t1559
  %t1561 = or i64 %t1560, 4
  %t1562 = call i64 @rt_root(i64 %t1561)
  store i64 %t1562, ptr @"scheme.base:truncate"
  ret i64 17
}

define i64 @"scheme.base:__init_63"() {
entry:
  %t1567 = call ptr @rt_alloc_words(i64 1)
  %t1568 = ptrtoint ptr %t1567 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:round" to i64), ptr %t1567
  %t1569 = or i64 %t1568, 4
  %t1570 = call i64 @rt_root(i64 %t1569)
  store i64 %t1570, ptr @"scheme.base:round"
  ret i64 17
}

define i64 @"scheme.base:__init_64"() {
entry:
  %t1573 = call ptr @rt_alloc_words(i64 1)
  %t1574 = ptrtoint ptr %t1573 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:truncate-quotient" to i64), ptr %t1573
  %t1575 = or i64 %t1574, 4
  %t1576 = call i64 @rt_root(i64 %t1575)
  store i64 %t1576, ptr @"scheme.base:truncate-quotient"
  ret i64 17
}

define i64 @"scheme.base:__init_65"() {
entry:
  %t1579 = call ptr @rt_alloc_words(i64 1)
  %t1580 = ptrtoint ptr %t1579 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:truncate-remainder" to i64), ptr %t1579
  %t1581 = or i64 %t1580, 4
  %t1582 = call i64 @rt_root(i64 %t1581)
  store i64 %t1582, ptr @"scheme.base:truncate-remainder"
  ret i64 17
}

define i64 @"scheme.base:__init_66"() {
entry:
  %t1585 = call ptr @rt_alloc_words(i64 1)
  %t1586 = ptrtoint ptr %t1585 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:floor-remainder" to i64), ptr %t1585
  %t1587 = or i64 %t1586, 4
  %t1588 = call i64 @rt_root(i64 %t1587)
  store i64 %t1588, ptr @"scheme.base:floor-remainder"
  ret i64 17
}

define i64 @"scheme.base:__init_67"() {
entry:
  %t1600 = call ptr @rt_alloc_words(i64 1)
  %t1601 = ptrtoint ptr %t1600 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:floor-quotient" to i64), ptr %t1600
  %t1602 = or i64 %t1601, 4
  %t1603 = call i64 @rt_root(i64 %t1602)
  store i64 %t1603, ptr @"scheme.base:floor-quotient"
  ret i64 17
}

define i64 @"scheme.base:__init_68"() {
entry:
  %t1613 = call ptr @rt_alloc_words(i64 1)
  %t1614 = ptrtoint ptr %t1613 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:truncate/" to i64), ptr %t1613
  %t1615 = or i64 %t1614, 4
  %t1616 = call i64 @rt_root(i64 %t1615)
  store i64 %t1616, ptr @"scheme.base:truncate/"
  ret i64 17
}

define i64 @"scheme.base:__init_69"() {
entry:
  %t1631 = call ptr @rt_alloc_words(i64 1)
  %t1632 = ptrtoint ptr %t1631 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:floor/" to i64), ptr %t1631
  %t1633 = or i64 %t1632, 4
  %t1634 = call i64 @rt_root(i64 %t1633)
  store i64 %t1634, ptr @"scheme.base:floor/"
  ret i64 17
}

define i64 @"scheme.base:__init_70"() {
entry:
  %t1645 = call ptr @rt_alloc_words(i64 1)
  %t1646 = ptrtoint ptr %t1645 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:numerator" to i64), ptr %t1645
  %t1647 = or i64 %t1646, 4
  %t1648 = call i64 @rt_root(i64 %t1647)
  store i64 %t1648, ptr @"scheme.base:numerator"
  ret i64 17
}

define i64 @"scheme.base:__init_71"() {
entry:
  %t1662 = call ptr @rt_alloc_words(i64 1)
  %t1663 = ptrtoint ptr %t1662 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:denominator" to i64), ptr %t1662
  %t1664 = or i64 %t1663, 4
  %t1665 = call i64 @rt_root(i64 %t1664)
  store i64 %t1665, ptr @"scheme.base:denominator"
  ret i64 17
}

define i64 @"scheme.base:__init_72"() {
entry:
  %t1668 = call ptr @rt_alloc_words(i64 1)
  %t1669 = ptrtoint ptr %t1668 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:inexact" to i64), ptr %t1668
  %t1670 = or i64 %t1669, 4
  %t1671 = call i64 @rt_root(i64 %t1670)
  store i64 %t1671, ptr @"scheme.base:inexact"
  ret i64 17
}

define i64 @"scheme.base:__init_73"() {
entry:
  %t1674 = call ptr @rt_alloc_words(i64 1)
  %t1675 = ptrtoint ptr %t1674 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:exact" to i64), ptr %t1674
  %t1676 = or i64 %t1675, 4
  %t1677 = call i64 @rt_root(i64 %t1676)
  store i64 %t1677, ptr @"scheme.base:exact"
  ret i64 17
}

define i64 @"scheme.base:__init_74"() {
entry:
  %t1680 = call ptr @rt_alloc_words(i64 1)
  %t1681 = ptrtoint ptr %t1680 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:void" to i64), ptr %t1680
  %t1682 = or i64 %t1681, 4
  %t1683 = call i64 @rt_root(i64 %t1682)
  store i64 %t1683, ptr @"scheme.base:void"
  ret i64 17
}

define i64 @"scheme.base:__init_75"() {
entry:
  %t1697 = call ptr @rt_alloc_words(i64 1)
  %t1698 = ptrtoint ptr %t1697 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string" to i64), ptr %t1697
  %t1699 = or i64 %t1698, 4
  %t1700 = call i64 @rt_root(i64 %t1699)
  store i64 %t1700, ptr @"scheme.base:string"
  ret i64 17
}

define i64 @"scheme.base:__init_76"() {
entry:
  %t1714 = call ptr @rt_alloc_words(i64 1)
  %t1715 = ptrtoint ptr %t1714 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%str-concat" to i64), ptr %t1714
  %t1716 = or i64 %t1715, 4
  %t1717 = call i64 @rt_root(i64 %t1716)
  store i64 %t1717, ptr @"scheme.base:%str-concat"
  ret i64 17
}

define i64 @"scheme.base:__init_77"() {
entry:
  %t1737 = call ptr @rt_alloc_words(i64 1)
  %t1738 = ptrtoint ptr %t1737 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:chr-cmp" to i64), ptr %t1737
  %t1739 = or i64 %t1738, 4
  %t1740 = call i64 @rt_root(i64 %t1739)
  store i64 %t1740, ptr @"scheme.base:chr-cmp"
  ret i64 17
}

define i64 @"scheme.base:__init_78"() {
entry:
  %t1778 = call ptr @rt_alloc_words(i64 1)
  %t1779 = ptrtoint ptr %t1778 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char=?" to i64), ptr %t1778
  %t1780 = or i64 %t1779, 4
  %t1781 = call i64 @rt_root(i64 %t1780)
  store i64 %t1781, ptr @"scheme.base:char=?"
  ret i64 17
}

define i64 @"scheme.base:__init_79"() {
entry:
  %t1819 = call ptr @rt_alloc_words(i64 1)
  %t1820 = ptrtoint ptr %t1819 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char<?" to i64), ptr %t1819
  %t1821 = or i64 %t1820, 4
  %t1822 = call i64 @rt_root(i64 %t1821)
  store i64 %t1822, ptr @"scheme.base:char<?"
  ret i64 17
}

define i64 @"scheme.base:__init_80"() {
entry:
  %t1860 = call ptr @rt_alloc_words(i64 1)
  %t1861 = ptrtoint ptr %t1860 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char>?" to i64), ptr %t1860
  %t1862 = or i64 %t1861, 4
  %t1863 = call i64 @rt_root(i64 %t1862)
  store i64 %t1863, ptr @"scheme.base:char>?"
  ret i64 17
}

define i64 @"scheme.base:__init_81"() {
entry:
  %t1909 = call ptr @rt_alloc_words(i64 1)
  %t1910 = ptrtoint ptr %t1909 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char<=?" to i64), ptr %t1909
  %t1911 = or i64 %t1910, 4
  %t1912 = call i64 @rt_root(i64 %t1911)
  store i64 %t1912, ptr @"scheme.base:char<=?"
  ret i64 17
}

define i64 @"scheme.base:__init_82"() {
entry:
  %t1958 = call ptr @rt_alloc_words(i64 1)
  %t1959 = ptrtoint ptr %t1958 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char>=?" to i64), ptr %t1958
  %t1960 = or i64 %t1959, 4
  %t1961 = call i64 @rt_root(i64 %t1960)
  store i64 %t1961, ptr @"scheme.base:char>=?"
  ret i64 17
}

define i64 @"scheme.base:__init_83"() {
entry:
  %t2071 = call ptr @rt_alloc_words(i64 1)
  %t2072 = ptrtoint ptr %t2071 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string->list" to i64), ptr %t2071
  %t2073 = or i64 %t2072, 4
  %t2074 = call i64 @rt_root(i64 %t2073)
  store i64 %t2074, ptr @"scheme.base:string->list"
  ret i64 17
}

define i64 @"scheme.base:__init_84"() {
entry:
  %t2082 = call ptr @rt_alloc_words(i64 1)
  %t2083 = ptrtoint ptr %t2082 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:ns-digits" to i64), ptr %t2082
  %t2084 = or i64 %t2083, 4
  %t2085 = call i64 @rt_root(i64 %t2084)
  store i64 %t2085, ptr @"scheme.base:ns-digits"
  ret i64 17
}

define i64 @"scheme.base:__init_85"() {
entry:
  %t2113 = call ptr @rt_alloc_words(i64 1)
  %t2114 = ptrtoint ptr %t2113 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ns-digit-char" to i64), ptr %t2113
  %t2115 = or i64 %t2114, 4
  %t2116 = call i64 @rt_root(i64 %t2115)
  store i64 %t2116, ptr @"scheme.base:%ns-digit-char"
  ret i64 17
}

define i64 @"scheme.base:__init_86"() {
entry:
  %t2150 = call ptr @rt_alloc_words(i64 1)
  %t2151 = ptrtoint ptr %t2150 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:ns-digits-radix" to i64), ptr %t2150
  %t2152 = or i64 %t2151, 4
  %t2153 = call i64 @rt_root(i64 %t2152)
  store i64 %t2153, ptr @"scheme.base:ns-digits-radix"
  ret i64 17
}

define i64 @"scheme.base:__init_87"() {
entry:
  %t2186 = call ptr @rt_alloc_words(i64 1)
  %t2187 = ptrtoint ptr %t2186 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%radix-ok?" to i64), ptr %t2186
  %t2188 = or i64 %t2187, 4
  %t2189 = call i64 @rt_root(i64 %t2188)
  store i64 %t2189, ptr @"scheme.base:%radix-ok?"
  ret i64 17
}

define i64 @"scheme.base:__init_88"() {
entry:
  %t2353 = call ptr @rt_alloc_words(i64 1)
  %t2354 = ptrtoint ptr %t2353 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:number->string" to i64), ptr %t2353
  %t2355 = or i64 %t2354, 4
  %t2356 = call i64 @rt_root(i64 %t2355)
  store i64 %t2356, ptr @"scheme.base:number->string"
  ret i64 17
}

define i64 @"scheme.base:__init_89"() {
entry:
  %t2412 = call ptr @rt_alloc_words(i64 1)
  %t2413 = ptrtoint ptr %t2412 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string->number" to i64), ptr %t2412
  %t2414 = or i64 %t2413, 4
  %t2415 = call i64 @rt_root(i64 %t2414)
  store i64 %t2415, ptr @"scheme.base:string->number"
  ret i64 17
}

define i64 @"scheme.base:__init_90"() {
entry:
  %t2439 = call ptr @rt_alloc_words(i64 1)
  %t2440 = ptrtoint ptr %t2439 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%raise-kinded" to i64), ptr %t2439
  %t2441 = or i64 %t2440, 4
  %t2442 = call i64 @rt_root(i64 %t2441)
  store i64 %t2442, ptr @"scheme.base:%raise-kinded"
  ret i64 17
}

define i64 @"scheme.base:__init_91"() {
entry:
  %t2468 = call ptr @rt_alloc_words(i64 1)
  %t2469 = ptrtoint ptr %t2468 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error" to i64), ptr %t2468
  %t2470 = or i64 %t2469, 4
  %t2471 = call i64 @rt_root(i64 %t2470)
  store i64 %t2471, ptr @"scheme.base:error"
  ret i64 17
}

define i64 @"scheme.base:__init_92"() {
entry:
  %t2497 = call ptr @rt_alloc_words(i64 1)
  %t2498 = ptrtoint ptr %t2497 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%read-error" to i64), ptr %t2497
  %t2499 = or i64 %t2498, 4
  %t2500 = call i64 @rt_root(i64 %t2499)
  store i64 %t2500, ptr @"scheme.base:%read-error"
  ret i64 17
}

define i64 @"scheme.base:__init_93"() {
entry:
  %t2501 = call i64 @rt_root(i64 2)
  store i64 %t2501, ptr @"scheme.base:*winds*"
  ret i64 17
}

define i64 @"scheme.base:__init_94"() {
entry:
  %t2510 = call ptr @rt_alloc_words(i64 1)
  %t2511 = ptrtoint ptr %t2510 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_474" to i64), ptr %t2510
  %t2512 = or i64 %t2511, 4
  %t2513 = call i64 @rt_set_trap_raiser(ptr @__apply0, i64 %t2512)
  %t2514 = call i64 @rt_root(i64 2)
  store i64 %t2514, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define i64 @"scheme.base:__init_95"() {
entry:
  %t2539 = call ptr @rt_alloc_words(i64 1)
  %t2540 = ptrtoint ptr %t2539 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%unwind-to" to i64), ptr %t2539
  %t2541 = or i64 %t2540, 4
  %t2542 = call i64 @rt_root(i64 %t2541)
  store i64 %t2542, ptr @"scheme.base:%unwind-to"
  ret i64 17
}

define i64 @"scheme.base:__init_96"() {
entry:
  %t2566 = call ptr @rt_alloc_words(i64 1)
  %t2567 = ptrtoint ptr %t2566 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:dynamic-wind" to i64), ptr %t2566
  %t2568 = or i64 %t2567, 4
  %t2569 = call i64 @rt_root(i64 %t2568)
  store i64 %t2569, ptr @"scheme.base:dynamic-wind"
  ret i64 17
}

define i64 @"scheme.base:__init_97"() {
entry:
  %t2630 = call ptr @rt_alloc_words(i64 1)
  %t2631 = ptrtoint ptr %t2630 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-current-continuation" to i64), ptr %t2630
  %t2632 = or i64 %t2631, 4
  %t2633 = call i64 @rt_root(i64 %t2632)
  store i64 %t2633, ptr @"scheme.base:call-with-current-continuation"
  ret i64 17
}

define i64 @"scheme.base:__init_98"() {
entry:
  %t2641 = call ptr @rt_alloc_words(i64 1)
  %t2642 = ptrtoint ptr %t2641 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call/cc" to i64), ptr %t2641
  %t2643 = or i64 %t2642, 4
  %t2644 = call i64 @rt_root(i64 %t2643)
  store i64 %t2644, ptr @"scheme.base:call/cc"
  ret i64 17
}

define i64 @"scheme.base:__init_99"() {
entry:
  %t2679 = call ptr @rt_alloc_words(i64 1)
  %t2680 = ptrtoint ptr %t2679 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-exception-handler" to i64), ptr %t2679
  %t2681 = or i64 %t2680, 4
  %t2682 = call i64 @rt_root(i64 %t2681)
  store i64 %t2682, ptr @"scheme.base:with-exception-handler"
  ret i64 17
}

define i64 @"scheme.base:__init_100"() {
entry:
  %t2701 = call ptr @rt_alloc_words(i64 1)
  %t2702 = ptrtoint ptr %t2701 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:raise" to i64), ptr %t2701
  %t2703 = or i64 %t2702, 4
  %t2704 = call i64 @rt_root(i64 %t2703)
  store i64 %t2704, ptr @"scheme.base:raise"
  ret i64 17
}

define i64 @"scheme.base:__init_101"() {
entry:
  %t2707 = call ptr @rt_alloc_words(i64 1)
  %t2708 = ptrtoint ptr %t2707 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object?" to i64), ptr %t2707
  %t2709 = or i64 %t2708, 4
  %t2710 = call i64 @rt_root(i64 %t2709)
  store i64 %t2710, ptr @"scheme.base:error-object?"
  ret i64 17
}

define i64 @"scheme.base:__init_102"() {
entry:
  %t2713 = call ptr @rt_alloc_words(i64 1)
  %t2714 = ptrtoint ptr %t2713 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-message" to i64), ptr %t2713
  %t2715 = or i64 %t2714, 4
  %t2716 = call i64 @rt_root(i64 %t2715)
  store i64 %t2716, ptr @"scheme.base:error-object-message"
  ret i64 17
}

define i64 @"scheme.base:__init_103"() {
entry:
  %t2719 = call ptr @rt_alloc_words(i64 1)
  %t2720 = ptrtoint ptr %t2719 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-irritants" to i64), ptr %t2719
  %t2721 = or i64 %t2720, 4
  %t2722 = call i64 @rt_root(i64 %t2721)
  store i64 %t2722, ptr @"scheme.base:error-object-irritants"
  ret i64 17
}

define i64 @"scheme.base:__init_104"() {
entry:
  %t2729 = call ptr @rt_alloc_words(i64 1)
  %t2730 = ptrtoint ptr %t2729 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-error?" to i64), ptr %t2729
  %t2731 = or i64 %t2730, 4
  %t2732 = call i64 @rt_root(i64 %t2731)
  store i64 %t2732, ptr @"scheme.base:read-error?"
  ret i64 17
}

define i64 @"scheme.base:__init_105"() {
entry:
  %t2739 = call ptr @rt_alloc_words(i64 1)
  %t2740 = ptrtoint ptr %t2739 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:file-error?" to i64), ptr %t2739
  %t2741 = or i64 %t2740, 4
  %t2742 = call i64 @rt_root(i64 %t2741)
  store i64 %t2742, ptr @"scheme.base:file-error?"
  ret i64 17
}

define i64 @"scheme.base:__init_106"() {
entry:
  %t2881 = call ptr @rt_alloc_words(i64 1)
  %t2882 = ptrtoint ptr %t2881 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-parameter" to i64), ptr %t2881
  %t2883 = or i64 %t2882, 4
  %t2884 = call i64 @rt_root(i64 %t2883)
  store i64 %t2884, ptr @"scheme.base:make-parameter"
  ret i64 17
}

define i64 @"scheme.base:__init_107"() {
entry:
  %t2965 = call ptr @rt_alloc_words(i64 1)
  %t2966 = ptrtoint ptr %t2965 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-parameters" to i64), ptr %t2965
  %t2967 = or i64 %t2966, 4
  %t2968 = call i64 @rt_root(i64 %t2967)
  store i64 %t2968, ptr @"scheme.base:with-parameters"
  ret i64 17
}

define i64 @"scheme.base:__init_108"() {
entry:
  %t3006 = call ptr @rt_alloc_words(i64 1)
  %t3007 = ptrtoint ptr %t3006 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->vector" to i64), ptr %t3006
  %t3008 = or i64 %t3007, 4
  %t3009 = call i64 @rt_root(i64 %t3008)
  store i64 %t3009, ptr @"scheme.base:list->vector"
  ret i64 17
}

define i64 @"scheme.base:__init_109"() {
entry:
  %t3033 = call ptr @rt_alloc_words(i64 1)
  %t3034 = ptrtoint ptr %t3033 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector" to i64), ptr %t3033
  %t3035 = or i64 %t3034, 4
  %t3036 = call i64 @rt_root(i64 %t3035)
  store i64 %t3036, ptr @"scheme.base:vector"
  ret i64 17
}

define i64 @"scheme.base:__init_110"() {
entry:
  %t3074 = call ptr @rt_alloc_words(i64 1)
  %t3075 = ptrtoint ptr %t3074 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->bytevector" to i64), ptr %t3074
  %t3076 = or i64 %t3075, 4
  %t3077 = call i64 @rt_root(i64 %t3076)
  store i64 %t3077, ptr @"scheme.base:list->bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_111"() {
entry:
  %t3101 = call ptr @rt_alloc_words(i64 1)
  %t3102 = ptrtoint ptr %t3101 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector" to i64), ptr %t3101
  %t3103 = or i64 %t3102, 4
  %t3104 = call i64 @rt_root(i64 %t3103)
  store i64 %t3104, ptr @"scheme.base:bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_112"() {
entry:
  %t3109 = call ptr @rt_alloc_words(i64 1)
  %t3110 = ptrtoint ptr %t3109 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rng-start" to i64), ptr %t3109
  %t3111 = or i64 %t3110, 4
  %t3112 = call i64 @rt_root(i64 %t3111)
  store i64 %t3112, ptr @"scheme.base:rng-start"
  ret i64 17
}

define i64 @"scheme.base:__init_113"() {
entry:
  %t3122 = call ptr @rt_alloc_words(i64 1)
  %t3123 = ptrtoint ptr %t3122 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rng-end" to i64), ptr %t3122
  %t3124 = or i64 %t3123, 4
  %t3125 = call i64 @rt_root(i64 %t3124)
  store i64 %t3125, ptr @"scheme.base:rng-end"
  ret i64 17
}

define i64 @"scheme.base:__init_114"() {
entry:
  %t3187 = call ptr @rt_alloc_words(i64 1)
  %t3188 = ptrtoint ptr %t3187 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rng-check" to i64), ptr %t3187
  %t3189 = or i64 %t3188, 4
  %t3190 = call i64 @rt_root(i64 %t3189)
  store i64 %t3190, ptr @"scheme.base:rng-check"
  ret i64 17
}

define i64 @"scheme.base:__init_115"() {
entry:
  %t3206 = call ptr @rt_alloc_words(i64 1)
  %t3207 = ptrtoint ptr %t3206 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:assv" to i64), ptr %t3206
  %t3208 = or i64 %t3207, 4
  %t3209 = call i64 @rt_root(i64 %t3208)
  store i64 %t3209, ptr @"scheme.base:assv"
  ret i64 17
}

define i64 @"scheme.base:__init_116"() {
entry:
  %t3222 = call ptr @rt_alloc_words(i64 1)
  %t3223 = ptrtoint ptr %t3222 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-copy" to i64), ptr %t3222
  %t3224 = or i64 %t3223, 4
  %t3225 = call i64 @rt_root(i64 %t3224)
  store i64 %t3225, ptr @"scheme.base:list-copy"
  ret i64 17
}

define i64 @"scheme.base:__init_117"() {
entry:
  %t3251 = call ptr @rt_alloc_words(i64 1)
  %t3252 = ptrtoint ptr %t3251 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:boolean=?" to i64), ptr %t3251
  %t3253 = or i64 %t3252, 4
  %t3254 = call i64 @rt_root(i64 %t3253)
  store i64 %t3254, ptr @"scheme.base:boolean=?"
  ret i64 17
}

define i64 @"scheme.base:__init_118"() {
entry:
  %t3280 = call ptr @rt_alloc_words(i64 1)
  %t3281 = ptrtoint ptr %t3280 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:symbol=?" to i64), ptr %t3280
  %t3282 = or i64 %t3281, 4
  %t3283 = call i64 @rt_root(i64 %t3282)
  store i64 %t3283, ptr @"scheme.base:symbol=?"
  ret i64 17
}

define i64 @"scheme.base:__init_119"() {
entry:
  %t3298 = call ptr @rt_alloc_words(i64 1)
  %t3299 = ptrtoint ptr %t3298 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:eqv-chain?" to i64), ptr %t3298
  %t3300 = or i64 %t3299, 4
  %t3301 = call i64 @rt_root(i64 %t3300)
  store i64 %t3301, ptr @"scheme.base:eqv-chain?"
  ret i64 17
}

define i64 @"scheme.base:__init_120"() {
entry:
  %t3401 = call ptr @rt_alloc_words(i64 1)
  %t3402 = ptrtoint ptr %t3401 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-cmp" to i64), ptr %t3401
  %t3403 = or i64 %t3402, 4
  %t3404 = call i64 @rt_root(i64 %t3403)
  store i64 %t3404, ptr @"scheme.base:str-cmp"
  ret i64 17
}

define i64 @"scheme.base:__init_121"() {
entry:
  %t3423 = call ptr @rt_alloc_words(i64 1)
  %t3424 = ptrtoint ptr %t3423 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-chain?" to i64), ptr %t3423
  %t3425 = or i64 %t3424, 4
  %t3426 = call i64 @rt_root(i64 %t3425)
  store i64 %t3426, ptr @"scheme.base:str-chain?"
  ret i64 17
}

define i64 @"scheme.base:__init_122"() {
entry:
  %t3472 = call ptr @rt_alloc_words(i64 1)
  %t3473 = ptrtoint ptr %t3472 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string<?" to i64), ptr %t3472
  %t3474 = or i64 %t3473, 4
  %t3475 = call i64 @rt_root(i64 %t3474)
  store i64 %t3475, ptr @"scheme.base:string<?"
  ret i64 17
}

define i64 @"scheme.base:__init_123"() {
entry:
  %t3521 = call ptr @rt_alloc_words(i64 1)
  %t3522 = ptrtoint ptr %t3521 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string>?" to i64), ptr %t3521
  %t3523 = or i64 %t3522, 4
  %t3524 = call i64 @rt_root(i64 %t3523)
  store i64 %t3524, ptr @"scheme.base:string>?"
  ret i64 17
}

define i64 @"scheme.base:__init_124"() {
entry:
  %t3571 = call ptr @rt_alloc_words(i64 1)
  %t3572 = ptrtoint ptr %t3571 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string<=?" to i64), ptr %t3571
  %t3573 = or i64 %t3572, 4
  %t3574 = call i64 @rt_root(i64 %t3573)
  store i64 %t3574, ptr @"scheme.base:string<=?"
  ret i64 17
}

define i64 @"scheme.base:__init_125"() {
entry:
  %t3621 = call ptr @rt_alloc_words(i64 1)
  %t3622 = ptrtoint ptr %t3621 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string>=?" to i64), ptr %t3621
  %t3623 = or i64 %t3622, 4
  %t3624 = call i64 @rt_root(i64 %t3623)
  store i64 %t3624, ptr @"scheme.base:string>=?"
  ret i64 17
}

define i64 @"scheme.base:__init_126"() {
entry:
  %t3734 = call ptr @rt_alloc_words(i64 1)
  %t3735 = ptrtoint ptr %t3734 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector->list" to i64), ptr %t3734
  %t3736 = or i64 %t3735, 4
  %t3737 = call i64 @rt_root(i64 %t3736)
  store i64 %t3737, ptr @"scheme.base:vector->list"
  ret i64 17
}

define i64 @"scheme.base:__init_127"() {
entry:
  %t3873 = call ptr @rt_alloc_words(i64 1)
  %t3874 = ptrtoint ptr %t3873 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-copy" to i64), ptr %t3873
  %t3875 = or i64 %t3874, 4
  %t3876 = call i64 @rt_root(i64 %t3875)
  store i64 %t3876, ptr @"scheme.base:vector-copy"
  ret i64 17
}

define i64 @"scheme.base:__init_128"() {
entry:
  %t4012 = call ptr @rt_alloc_words(i64 1)
  %t4013 = ptrtoint ptr %t4012 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-append" to i64), ptr %t4012
  %t4014 = or i64 %t4013, 4
  %t4015 = call i64 @rt_root(i64 %t4014)
  store i64 %t4015, ptr @"scheme.base:vector-append"
  ret i64 17
}

define i64 @"scheme.base:__init_129"() {
entry:
  %t4036 = call ptr @rt_alloc_words(i64 1)
  %t4037 = ptrtoint ptr %t4036 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vec-total" to i64), ptr %t4036
  %t4038 = or i64 %t4037, 4
  %t4039 = call i64 @rt_root(i64 %t4038)
  store i64 %t4039, ptr @"scheme.base:vec-total"
  ret i64 17
}

define i64 @"scheme.base:__init_130"() {
entry:
  %t4144 = call ptr @rt_alloc_words(i64 1)
  %t4145 = ptrtoint ptr %t4144 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-fill!" to i64), ptr %t4144
  %t4146 = or i64 %t4145, 4
  %t4147 = call i64 @rt_root(i64 %t4146)
  store i64 %t4147, ptr @"scheme.base:vector-fill!"
  ret i64 17
}

define i64 @"scheme.base:__init_131"() {
entry:
  %t4465 = call ptr @rt_alloc_words(i64 1)
  %t4466 = ptrtoint ptr %t4465 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-copy!" to i64), ptr %t4465
  %t4467 = or i64 %t4466, 4
  %t4468 = call i64 @rt_root(i64 %t4467)
  store i64 %t4468, ptr @"scheme.base:vector-copy!"
  ret i64 17
}

define i64 @"scheme.base:__init_132"() {
entry:
  %t4657 = call ptr @rt_alloc_words(i64 1)
  %t4658 = ptrtoint ptr %t4657 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-map" to i64), ptr %t4657
  %t4659 = or i64 %t4658, 4
  %t4660 = call i64 @rt_root(i64 %t4659)
  store i64 %t4660, ptr @"scheme.base:vector-map"
  ret i64 17
}

define i64 @"scheme.base:__init_133"() {
entry:
  %t4835 = call ptr @rt_alloc_words(i64 1)
  %t4836 = ptrtoint ptr %t4835 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-for-each" to i64), ptr %t4835
  %t4837 = or i64 %t4836, 4
  %t4838 = call i64 @rt_root(i64 %t4837)
  store i64 %t4838, ptr @"scheme.base:vector-for-each"
  ret i64 17
}

define i64 @"scheme.base:__init_134"() {
entry:
  %t4862 = call ptr @rt_alloc_words(i64 1)
  %t4863 = ptrtoint ptr %t4862 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vec-min-len" to i64), ptr %t4862
  %t4864 = or i64 %t4863, 4
  %t4865 = call i64 @rt_root(i64 %t4864)
  store i64 %t4865, ptr @"scheme.base:vec-min-len"
  ret i64 17
}

define i64 @"scheme.base:__init_135"() {
entry:
  %t4879 = call ptr @rt_alloc_words(i64 1)
  %t4880 = ptrtoint ptr %t4879 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vec-nth" to i64), ptr %t4879
  %t4881 = or i64 %t4880, 4
  %t4882 = call i64 @rt_root(i64 %t4881)
  store i64 %t4882, ptr @"scheme.base:vec-nth"
  ret i64 17
}

define i64 @"scheme.base:__init_136"() {
entry:
  %t5018 = call ptr @rt_alloc_words(i64 1)
  %t5019 = ptrtoint ptr %t5018 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string->vector" to i64), ptr %t5018
  %t5020 = or i64 %t5019, 4
  %t5021 = call i64 @rt_root(i64 %t5020)
  store i64 %t5021, ptr @"scheme.base:string->vector"
  ret i64 17
}

define i64 @"scheme.base:__init_137"() {
entry:
  %t5087 = call ptr @rt_alloc_words(i64 1)
  %t5088 = ptrtoint ptr %t5087 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector->string" to i64), ptr %t5087
  %t5089 = or i64 %t5088, 4
  %t5090 = call i64 @rt_root(i64 %t5089)
  store i64 %t5090, ptr @"scheme.base:vector->string"
  ret i64 17
}

define i64 @"scheme.base:__init_138"() {
entry:
  %t5148 = call ptr @rt_alloc_words(i64 1)
  %t5149 = ptrtoint ptr %t5148 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-map" to i64), ptr %t5148
  %t5150 = or i64 %t5149, 4
  %t5151 = call i64 @rt_root(i64 %t5150)
  store i64 %t5151, ptr @"scheme.base:string-map"
  ret i64 17
}

define i64 @"scheme.base:__init_139"() {
entry:
  %t5169 = call ptr @rt_alloc_words(i64 1)
  %t5170 = ptrtoint ptr %t5169 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-map1" to i64), ptr %t5169
  %t5171 = or i64 %t5170, 4
  %t5172 = call i64 @rt_root(i64 %t5171)
  store i64 %t5172, ptr @"scheme.base:str-map1"
  ret i64 17
}

define i64 @"scheme.base:__init_140"() {
entry:
  %t5252 = call ptr @rt_alloc_words(i64 1)
  %t5253 = ptrtoint ptr %t5252 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-mapn" to i64), ptr %t5252
  %t5254 = or i64 %t5253, 4
  %t5255 = call i64 @rt_root(i64 %t5254)
  store i64 %t5255, ptr @"scheme.base:str-mapn"
  ret i64 17
}

define i64 @"scheme.base:__init_141"() {
entry:
  %t5430 = call ptr @rt_alloc_words(i64 1)
  %t5431 = ptrtoint ptr %t5430 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-for-each" to i64), ptr %t5430
  %t5432 = or i64 %t5431, 4
  %t5433 = call i64 @rt_root(i64 %t5432)
  store i64 %t5433, ptr @"scheme.base:string-for-each"
  ret i64 17
}

define i64 @"scheme.base:__init_142"() {
entry:
  %t5457 = call ptr @rt_alloc_words(i64 1)
  %t5458 = ptrtoint ptr %t5457 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-min-len" to i64), ptr %t5457
  %t5459 = or i64 %t5458, 4
  %t5460 = call i64 @rt_root(i64 %t5459)
  store i64 %t5460, ptr @"scheme.base:str-min-len"
  ret i64 17
}

define i64 @"scheme.base:__init_143"() {
entry:
  %t5474 = call ptr @rt_alloc_words(i64 1)
  %t5475 = ptrtoint ptr %t5474 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-nth" to i64), ptr %t5474
  %t5476 = or i64 %t5475, 4
  %t5477 = call i64 @rt_root(i64 %t5476)
  store i64 %t5477, ptr @"scheme.base:str-nth"
  ret i64 17
}

define i64 @"scheme.base:__init_144"() {
entry:
  %t5582 = call ptr @rt_alloc_words(i64 1)
  %t5583 = ptrtoint ptr %t5582 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-fill!" to i64), ptr %t5582
  %t5584 = or i64 %t5583, 4
  %t5585 = call i64 @rt_root(i64 %t5584)
  store i64 %t5585, ptr @"scheme.base:string-fill!"
  ret i64 17
}

define i64 @"scheme.base:__init_145"() {
entry:
  %t5903 = call ptr @rt_alloc_words(i64 1)
  %t5904 = ptrtoint ptr %t5903 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-copy!" to i64), ptr %t5903
  %t5905 = or i64 %t5904, 4
  %t5906 = call i64 @rt_root(i64 %t5905)
  store i64 %t5906, ptr @"scheme.base:string-copy!"
  ret i64 17
}

define i64 @"scheme.base:__init_146"() {
entry:
  %t6042 = call ptr @rt_alloc_words(i64 1)
  %t6043 = ptrtoint ptr %t6042 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector-copy" to i64), ptr %t6042
  %t6044 = or i64 %t6043, 4
  %t6045 = call i64 @rt_root(i64 %t6044)
  store i64 %t6045, ptr @"scheme.base:bytevector-copy"
  ret i64 17
}

define i64 @"scheme.base:__init_147"() {
entry:
  %t6363 = call ptr @rt_alloc_words(i64 1)
  %t6364 = ptrtoint ptr %t6363 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector-copy!" to i64), ptr %t6363
  %t6365 = or i64 %t6364, 4
  %t6366 = call i64 @rt_root(i64 %t6365)
  store i64 %t6366, ptr @"scheme.base:bytevector-copy!"
  ret i64 17
}

define i64 @"scheme.base:__init_148"() {
entry:
  %t6502 = call ptr @rt_alloc_words(i64 1)
  %t6503 = ptrtoint ptr %t6502 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector-append" to i64), ptr %t6502
  %t6504 = or i64 %t6503, 4
  %t6505 = call i64 @rt_root(i64 %t6504)
  store i64 %t6505, ptr @"scheme.base:bytevector-append"
  ret i64 17
}

define i64 @"scheme.base:__init_149"() {
entry:
  %t6526 = call ptr @rt_alloc_words(i64 1)
  %t6527 = ptrtoint ptr %t6526 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bv-total" to i64), ptr %t6526
  %t6528 = or i64 %t6527, 4
  %t6529 = call i64 @rt_root(i64 %t6528)
  store i64 %t6529, ptr @"scheme.base:bv-total"
  ret i64 17
}

define i64 @"scheme.base:__init_150"() {
entry:
  %t6530 = call i64 @rt_root(i64 8000000)
  store i64 %t6530, ptr @"scheme.base:rat-max-denom"
  ret i64 17
}

define i64 @"scheme.base:__init_151"() {
entry:
  %t6579 = call ptr @rt_alloc_words(i64 1)
  %t6580 = ptrtoint ptr %t6579 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rationalize" to i64), ptr %t6579
  %t6581 = or i64 %t6580, 4
  %t6582 = call i64 @rt_root(i64 %t6581)
  store i64 %t6582, ptr @"scheme.base:rationalize"
  ret i64 17
}

define i64 @"scheme.base:__init_152"() {
entry:
  %t6699 = call ptr @rt_alloc_words(i64 1)
  %t6700 = ptrtoint ptr %t6699 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-exact" to i64), ptr %t6699
  %t6701 = or i64 %t6700, 4
  %t6702 = call i64 @rt_root(i64 %t6701)
  store i64 %t6702, ptr @"scheme.base:rat-exact"
  ret i64 17
}

define i64 @"scheme.base:__init_153"() {
entry:
  %t6704 = call ptr @rt_alloc_words(i64 1)
  %t6705 = ptrtoint ptr %t6704 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-ceil" to i64), ptr %t6704
  %t6706 = or i64 %t6705, 4
  %t6707 = call i64 @rt_root(i64 %t6706)
  store i64 %t6707, ptr @"scheme.base:rat-ceil"
  ret i64 17
}

define i64 @"scheme.base:__init_154"() {
entry:
  %t6709 = call ptr @rt_alloc_words(i64 1)
  %t6710 = ptrtoint ptr %t6709 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-floor" to i64), ptr %t6709
  %t6711 = or i64 %t6710, 4
  %t6712 = call i64 @rt_root(i64 %t6711)
  store i64 %t6712, ptr @"scheme.base:rat-floor"
  ret i64 17
}

define i64 @"scheme.base:__init_155"() {
entry:
  %t6829 = call ptr @rt_alloc_words(i64 1)
  %t6830 = ptrtoint ptr %t6829 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-inexact" to i64), ptr %t6829
  %t6831 = or i64 %t6830, 4
  %t6832 = call i64 @rt_root(i64 %t6831)
  store i64 %t6832, ptr @"scheme.base:rat-inexact"
  ret i64 17
}

define i64 @"scheme.base:__init_156"() {
entry:
  %t6858 = call ptr @rt_alloc_words(i64 1)
  %t6859 = ptrtoint ptr %t6858 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-num-in" to i64), ptr %t6858
  %t6860 = or i64 %t6859, 4
  %t6861 = call i64 @rt_root(i64 %t6860)
  store i64 %t6861, ptr @"scheme.base:rat-num-in"
  ret i64 17
}

define i64 @"scheme.base:__init_157"() {
entry:
  %t6887 = call ptr @rt_alloc_words(i64 1)
  %t6888 = ptrtoint ptr %t6887 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-ceil-flo" to i64), ptr %t6887
  %t6889 = or i64 %t6888, 4
  %t6890 = call i64 @rt_root(i64 %t6889)
  store i64 %t6890, ptr @"scheme.base:rat-ceil-flo"
  ret i64 17
}

define i64 @"scheme.base:__init_158"() {
entry:
  %t6918 = call ptr @rt_alloc_words(i64 1)
  %t6919 = ptrtoint ptr %t6918 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:values" to i64), ptr %t6918
  %t6920 = or i64 %t6919, 4
  %t6921 = call i64 @rt_root(i64 %t6920)
  store i64 %t6921, ptr @"scheme.base:values"
  ret i64 17
}

define i64 @"scheme.base:__init_159"() {
entry:
  %t6963 = call ptr @rt_alloc_words(i64 1)
  %t6964 = ptrtoint ptr %t6963 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-values" to i64), ptr %t6963
  %t6965 = or i64 %t6964, 4
  %t6966 = call i64 @rt_root(i64 %t6965)
  store i64 %t6966, ptr @"scheme.base:call-with-values"
  ret i64 17
}

define i64 @"scheme.base:__init_160"() {
entry:
  %t6967 = call i64 @rt_root(i64 64)
  store i64 %t6967, ptr @"scheme.base:%ht-initial-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_161"() {
entry:
  %t6968 = call i64 @rt_root(i64 24)
  store i64 %t6968, ptr @"scheme.base:%ht-load-factor"
  ret i64 17
}

define i64 @"scheme.base:__init_162"() {
entry:
  %t6979 = call ptr @rt_alloc_words(i64 1)
  %t6980 = ptrtoint ptr %t6979 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-hash-table" to i64), ptr %t6979
  %t6981 = or i64 %t6980, 4
  %t6982 = call i64 @rt_root(i64 %t6981)
  store i64 %t6982, ptr @"scheme.base:make-hash-table"
  ret i64 17
}

define i64 @"scheme.base:__init_163"() {
entry:
  %t6985 = call ptr @rt_alloc_words(i64 1)
  %t6986 = ptrtoint ptr %t6985 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table?" to i64), ptr %t6985
  %t6987 = or i64 %t6986, 4
  %t6988 = call i64 @rt_root(i64 %t6987)
  store i64 %t6988, ptr @"scheme.base:hash-table?"
  ret i64 17
}

define i64 @"scheme.base:__init_164"() {
entry:
  %t6992 = call ptr @rt_alloc_words(i64 1)
  %t6993 = ptrtoint ptr %t6992 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-count" to i64), ptr %t6992
  %t6994 = or i64 %t6993, 4
  %t6995 = call i64 @rt_root(i64 %t6994)
  store i64 %t6995, ptr @"scheme.base:%ht-count"
  ret i64 17
}

define i64 @"scheme.base:__init_165"() {
entry:
  %t6999 = call ptr @rt_alloc_words(i64 1)
  %t7000 = ptrtoint ptr %t6999 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-buckets" to i64), ptr %t6999
  %t7001 = or i64 %t7000, 4
  %t7002 = call i64 @rt_root(i64 %t7001)
  store i64 %t7002, ptr @"scheme.base:%ht-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_166"() {
entry:
  %t7006 = call ptr @rt_alloc_words(i64 1)
  %t7007 = ptrtoint ptr %t7006 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-count!" to i64), ptr %t7006
  %t7008 = or i64 %t7007, 4
  %t7009 = call i64 @rt_root(i64 %t7008)
  store i64 %t7009, ptr @"scheme.base:%ht-set-count!"
  ret i64 17
}

define i64 @"scheme.base:__init_167"() {
entry:
  %t7013 = call ptr @rt_alloc_words(i64 1)
  %t7014 = ptrtoint ptr %t7013 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-buckets!" to i64), ptr %t7013
  %t7015 = or i64 %t7014, 4
  %t7016 = call i64 @rt_root(i64 %t7015)
  store i64 %t7016, ptr @"scheme.base:%ht-set-buckets!"
  ret i64 17
}

define i64 @"scheme.base:__init_168"() {
entry:
  %t7020 = call ptr @rt_alloc_words(i64 1)
  %t7021 = ptrtoint ptr %t7020 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-index" to i64), ptr %t7020
  %t7022 = or i64 %t7021, 4
  %t7023 = call i64 @rt_root(i64 %t7022)
  store i64 %t7023, ptr @"scheme.base:%ht-index"
  ret i64 17
}

define i64 @"scheme.base:__init_169"() {
entry:
  %t7039 = call ptr @rt_alloc_words(i64 1)
  %t7040 = ptrtoint ptr %t7039 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-assoc" to i64), ptr %t7039
  %t7041 = or i64 %t7040, 4
  %t7042 = call i64 @rt_root(i64 %t7041)
  store i64 %t7042, ptr @"scheme.base:%ht-assoc"
  ret i64 17
}

define i64 @"scheme.base:__init_170"() {
entry:
  %t7060 = call ptr @rt_alloc_words(i64 1)
  %t7061 = ptrtoint ptr %t7060 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-remove" to i64), ptr %t7060
  %t7062 = or i64 %t7061, 4
  %t7063 = call i64 @rt_root(i64 %t7062)
  store i64 %t7063, ptr @"scheme.base:%ht-remove"
  ret i64 17
}

define i64 @"scheme.base:__init_171"() {
entry:
  %t7087 = call ptr @rt_alloc_words(i64 1)
  %t7088 = ptrtoint ptr %t7087 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref/default" to i64), ptr %t7087
  %t7089 = or i64 %t7088, 4
  %t7090 = call i64 @rt_root(i64 %t7089)
  store i64 %t7090, ptr @"scheme.base:hash-table-ref/default"
  ret i64 17
}

define i64 @"scheme.base:__init_172"() {
entry:
  %t7113 = call ptr @rt_alloc_words(i64 1)
  %t7114 = ptrtoint ptr %t7113 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-contains?" to i64), ptr %t7113
  %t7115 = or i64 %t7114, 4
  %t7116 = call i64 @rt_root(i64 %t7115)
  store i64 %t7116, ptr @"scheme.base:hash-table-contains?"
  ret i64 17
}

define i64 @"scheme.base:__init_173"() {
entry:
  %t7147 = call ptr @rt_alloc_words(i64 1)
  %t7148 = ptrtoint ptr %t7147 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref" to i64), ptr %t7147
  %t7149 = or i64 %t7148, 4
  %t7150 = call i64 @rt_root(i64 %t7149)
  store i64 %t7150, ptr @"scheme.base:hash-table-ref"
  ret i64 17
}

define i64 @"scheme.base:__init_174"() {
entry:
  %t7234 = call ptr @rt_alloc_words(i64 1)
  %t7235 = ptrtoint ptr %t7234 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-set!" to i64), ptr %t7234
  %t7236 = or i64 %t7235, 4
  %t7237 = call i64 @rt_root(i64 %t7236)
  store i64 %t7237, ptr @"scheme.base:hash-table-set!"
  ret i64 17
}

define i64 @"scheme.base:__init_175"() {
entry:
  %t7287 = call ptr @rt_alloc_words(i64 1)
  %t7288 = ptrtoint ptr %t7287 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-delete!" to i64), ptr %t7287
  %t7289 = or i64 %t7288, 4
  %t7290 = call i64 @rt_root(i64 %t7289)
  store i64 %t7290, ptr @"scheme.base:hash-table-delete!"
  ret i64 17
}

define i64 @"scheme.base:__init_176"() {
entry:
  %t7394 = call ptr @rt_alloc_words(i64 1)
  %t7395 = ptrtoint ptr %t7394 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-grow!" to i64), ptr %t7394
  %t7396 = or i64 %t7395, 4
  %t7397 = call i64 @rt_root(i64 %t7396)
  store i64 %t7397, ptr @"scheme.base:%ht-grow!"
  ret i64 17
}

define i64 @"scheme.base:__init_177"() {
entry:
  %t7405 = call ptr @rt_alloc_words(i64 1)
  %t7406 = ptrtoint ptr %t7405 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-size" to i64), ptr %t7405
  %t7407 = or i64 %t7406, 4
  %t7408 = call i64 @rt_root(i64 %t7407)
  store i64 %t7408, ptr @"scheme.base:hash-table-size"
  ret i64 17
}

define i64 @"scheme.base:__init_178"() {
entry:
  %t7425 = call ptr @rt_alloc_words(i64 1)
  %t7426 = ptrtoint ptr %t7425 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-fold-buckets" to i64), ptr %t7425
  %t7427 = or i64 %t7426, 4
  %t7428 = call i64 @rt_root(i64 %t7427)
  store i64 %t7428, ptr @"scheme.base:%ht-fold-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_179"() {
entry:
  %t7476 = call ptr @rt_alloc_words(i64 1)
  %t7477 = ptrtoint ptr %t7476 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table->alist" to i64), ptr %t7476
  %t7478 = or i64 %t7477, 4
  %t7479 = call i64 @rt_root(i64 %t7478)
  store i64 %t7479, ptr @"scheme.base:hash-table->alist"
  ret i64 17
}

define i64 @"scheme.base:__init_180"() {
entry:
  %t7498 = call ptr @rt_alloc_words(i64 1)
  %t7499 = ptrtoint ptr %t7498 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-keys" to i64), ptr %t7498
  %t7500 = or i64 %t7499, 4
  %t7501 = call i64 @rt_root(i64 %t7500)
  store i64 %t7501, ptr @"scheme.base:hash-table-keys"
  ret i64 17
}

define i64 @"scheme.base:__init_181"() {
entry:
  %t7520 = call ptr @rt_alloc_words(i64 1)
  %t7521 = ptrtoint ptr %t7520 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-values" to i64), ptr %t7520
  %t7522 = or i64 %t7521, 4
  %t7523 = call i64 @rt_root(i64 %t7522)
  store i64 %t7523, ptr @"scheme.base:hash-table-values"
  ret i64 17
}

define i64 @"scheme.base:__init_182"() {
entry:
  %t7770 = call ptr @rt_alloc_words(i64 1)
  %t7771 = ptrtoint ptr %t7770 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-report" to i64), ptr %t7770
  %t7772 = or i64 %t7771, 4
  %t7773 = call i64 @rt_root(i64 %t7772)
  store i64 %t7773, ptr @"scheme.base:rd-report"
  ret i64 17
}

define i64 @"scheme.base:__init_183"() {
entry:
  %t7795 = call ptr @rt_alloc_words(i64 1)
  %t7796 = ptrtoint ptr %t7795 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-from-string" to i64), ptr %t7795
  %t7797 = or i64 %t7796, 4
  %t7798 = call i64 @rt_root(i64 %t7797)
  store i64 %t7798, ptr @"scheme.base:read-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_184"() {
entry:
  %t7806 = call ptr @rt_alloc_words(i64 1)
  %t7807 = ptrtoint ptr %t7806 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-all-from-string" to i64), ptr %t7806
  %t7808 = or i64 %t7807, 4
  %t7809 = call i64 @rt_root(i64 %t7808)
  store i64 %t7809, ptr @"scheme.base:read-all-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_185"() {
entry:
  %t7817 = call ptr @rt_alloc_words(i64 1)
  %t7818 = ptrtoint ptr %t7817 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-all-from-string-ci" to i64), ptr %t7817
  %t7819 = or i64 %t7818, 4
  %t7820 = call i64 @rt_root(i64 %t7819)
  store i64 %t7820, ptr @"scheme.base:read-all-from-string-ci"
  ret i64 17
}

define i64 @"scheme.base:__init_186"() {
entry:
  %t7927 = call ptr @rt_alloc_words(i64 1)
  %t7928 = ptrtoint ptr %t7927 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-all" to i64), ptr %t7927
  %t7929 = or i64 %t7928, 4
  %t7930 = call i64 @rt_root(i64 %t7929)
  store i64 %t7930, ptr @"scheme.base:rd-all"
  ret i64 17
}

define i64 @"scheme.base:__init_187"() {
entry:
  %t7935 = call ptr @rt_alloc_words(i64 1)
  %t7936 = ptrtoint ptr %t7935 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port?" to i64), ptr %t7935
  %t7937 = or i64 %t7936, 4
  %t7938 = call i64 @rt_root(i64 %t7937)
  store i64 %t7938, ptr @"scheme.base:port?"
  ret i64 17
}

define i64 @"scheme.base:__init_188"() {
entry:
  %t7948 = call ptr @rt_alloc_words(i64 1)
  %t7949 = ptrtoint ptr %t7948 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port?" to i64), ptr %t7948
  %t7950 = or i64 %t7949, 4
  %t7951 = call i64 @rt_root(i64 %t7950)
  store i64 %t7951, ptr @"scheme.base:input-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_189"() {
entry:
  %t7962 = call ptr @rt_alloc_words(i64 1)
  %t7963 = ptrtoint ptr %t7962 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port?" to i64), ptr %t7962
  %t7964 = or i64 %t7963, 4
  %t7965 = call i64 @rt_root(i64 %t7964)
  store i64 %t7965, ptr @"scheme.base:output-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_190"() {
entry:
  %t7973 = call ptr @rt_alloc_words(i64 1)
  %t7974 = ptrtoint ptr %t7973 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:textual-port?" to i64), ptr %t7973
  %t7975 = or i64 %t7974, 4
  %t7976 = call i64 @rt_root(i64 %t7975)
  store i64 %t7976, ptr @"scheme.base:textual-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_191"() {
entry:
  %t7979 = call ptr @rt_alloc_words(i64 1)
  %t7980 = ptrtoint ptr %t7979 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port-closed?" to i64), ptr %t7979
  %t7981 = or i64 %t7980, 4
  %t7982 = call i64 @rt_root(i64 %t7981)
  store i64 %t7982, ptr @"scheme.base:port-closed?"
  ret i64 17
}

define i64 @"scheme.base:__init_192"() {
entry:
  %t7993 = call ptr @rt_alloc_words(i64 1)
  %t7994 = ptrtoint ptr %t7993 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port-open?" to i64), ptr %t7993
  %t7995 = or i64 %t7994, 4
  %t7996 = call i64 @rt_root(i64 %t7995)
  store i64 %t7996, ptr @"scheme.base:input-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_193"() {
entry:
  %t8007 = call ptr @rt_alloc_words(i64 1)
  %t8008 = ptrtoint ptr %t8007 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port-open?" to i64), ptr %t8007
  %t8009 = or i64 %t8008, 4
  %t8010 = call i64 @rt_root(i64 %t8009)
  store i64 %t8010, ptr @"scheme.base:output-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_194"() {
entry:
  %t8036 = call ptr @rt_alloc_words(i64 1)
  %t8037 = ptrtoint ptr %t8036 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-input-port" to i64), ptr %t8036
  %t8038 = or i64 %t8037, 4
  %t8039 = call i64 @rt_root(i64 %t8038)
  store i64 %t8039, ptr @"scheme.base:%check-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_195"() {
entry:
  %t8065 = call ptr @rt_alloc_words(i64 1)
  %t8066 = ptrtoint ptr %t8065 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-output-port" to i64), ptr %t8065
  %t8067 = or i64 %t8066, 4
  %t8068 = call i64 @rt_root(i64 %t8067)
  store i64 %t8068, ptr @"scheme.base:%check-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_196"() {
entry:
  %t8072 = call ptr @rt_alloc_words(i64 1)
  %t8073 = ptrtoint ptr %t8072 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-input-string" to i64), ptr %t8072
  %t8074 = or i64 %t8073, 4
  %t8075 = call i64 @rt_root(i64 %t8074)
  store i64 %t8075, ptr @"scheme.base:open-input-string"
  ret i64 17
}

define i64 @"scheme.base:__init_197"() {
entry:
  %t8096 = call ptr @rt_alloc_words(i64 1)
  %t8097 = ptrtoint ptr %t8096 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%port-at-eof?" to i64), ptr %t8096
  %t8098 = or i64 %t8097, 4
  %t8099 = call i64 @rt_root(i64 %t8098)
  store i64 %t8099, ptr @"scheme.base:%port-at-eof?"
  ret i64 17
}

define i64 @"scheme.base:__init_198"() {
entry:
  %t8129 = call ptr @rt_alloc_words(i64 1)
  %t8130 = ptrtoint ptr %t8129 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-char" to i64), ptr %t8129
  %t8131 = or i64 %t8130, 4
  %t8132 = call i64 @rt_root(i64 %t8131)
  store i64 %t8132, ptr @"scheme.base:read-char"
  ret i64 17
}

define i64 @"scheme.base:__init_199"() {
entry:
  %t8153 = call ptr @rt_alloc_words(i64 1)
  %t8154 = ptrtoint ptr %t8153 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:peek-char" to i64), ptr %t8153
  %t8155 = or i64 %t8154, 4
  %t8156 = call i64 @rt_root(i64 %t8155)
  store i64 %t8156, ptr @"scheme.base:peek-char"
  ret i64 17
}

define i64 @"scheme.base:__init_200"() {
entry:
  %t8274 = call ptr @rt_alloc_words(i64 1)
  %t8275 = ptrtoint ptr %t8274 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-line" to i64), ptr %t8274
  %t8276 = or i64 %t8275, 4
  %t8277 = call i64 @rt_root(i64 %t8276)
  store i64 %t8277, ptr @"scheme.base:read-line"
  ret i64 17
}

define i64 @"scheme.base:__init_201"() {
entry:
  %t8325 = call ptr @rt_alloc_words(i64 1)
  %t8326 = ptrtoint ptr %t8325 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-string" to i64), ptr %t8325
  %t8327 = or i64 %t8326, 4
  %t8328 = call i64 @rt_root(i64 %t8327)
  store i64 %t8328, ptr @"scheme.base:read-string"
  ret i64 17
}

define i64 @"scheme.base:__init_202"() {
entry:
  %t8342 = call ptr @rt_alloc_words(i64 1)
  %t8343 = ptrtoint ptr %t8342 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-output-string" to i64), ptr %t8342
  %t8344 = or i64 %t8343, 4
  %t8345 = call i64 @rt_root(i64 %t8344)
  store i64 %t8345, ptr @"scheme.base:open-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_203"() {
entry:
  %t8376 = call ptr @rt_alloc_words(i64 1)
  %t8377 = ptrtoint ptr %t8376 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:get-output-string" to i64), ptr %t8376
  %t8378 = or i64 %t8377, 4
  %t8379 = call i64 @rt_root(i64 %t8378)
  store i64 %t8379, ptr @"scheme.base:get-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_204"() {
entry:
  %t8390 = call ptr @rt_alloc_words(i64 1)
  %t8391 = ptrtoint ptr %t8390 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:flush-output-port" to i64), ptr %t8390
  %t8392 = or i64 %t8391, 4
  %t8393 = call i64 @rt_root(i64 %t8392)
  store i64 %t8393, ptr @"scheme.base:flush-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_205"() {
entry:
  %t8422 = call ptr @rt_alloc_words(i64 1)
  %t8423 = ptrtoint ptr %t8422 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-port" to i64), ptr %t8422
  %t8424 = or i64 %t8423, 4
  %t8425 = call i64 @rt_root(i64 %t8424)
  store i64 %t8425, ptr @"scheme.base:close-port"
  ret i64 17
}

define i64 @"scheme.base:__init_206"() {
entry:
  %t8448 = call ptr @rt_alloc_words(i64 1)
  %t8449 = ptrtoint ptr %t8448 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-input-port" to i64), ptr %t8448
  %t8450 = or i64 %t8449, 4
  %t8451 = call i64 @rt_root(i64 %t8450)
  store i64 %t8451, ptr @"scheme.base:close-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_207"() {
entry:
  %t8474 = call ptr @rt_alloc_words(i64 1)
  %t8475 = ptrtoint ptr %t8474 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-output-port" to i64), ptr %t8474
  %t8476 = or i64 %t8475, 4
  %t8477 = call i64 @rt_root(i64 %t8476)
  store i64 %t8477, ptr @"scheme.base:close-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_208"() {
entry:
  %t8478 = call i64 @rt_root(i64 1)
  store i64 %t8478, ptr @"scheme.base:%stdout-port"
  ret i64 17
}

define i64 @"scheme.base:__init_209"() {
entry:
  %t8479 = call i64 @rt_root(i64 1)
  store i64 %t8479, ptr @"scheme.base:%stderr-port"
  ret i64 17
}

define i64 @"scheme.base:__init_210"() {
entry:
  %t8480 = call i64 @rt_root(i64 1)
  store i64 %t8480, ptr @"scheme.base:%stdin-port"
  ret i64 17
}

define i64 @"scheme.base:__init_211"() {
entry:
  %t8524 = call ptr @rt_alloc_words(i64 1)
  %t8525 = ptrtoint ptr %t8524 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-output-port" to i64), ptr %t8524
  %t8526 = or i64 %t8525, 4
  %t8527 = call i64 @rt_root(i64 %t8526)
  store i64 %t8527, ptr @"scheme.base:current-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_212"() {
entry:
  %t8565 = call ptr @rt_alloc_words(i64 1)
  %t8566 = ptrtoint ptr %t8565 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-error-port" to i64), ptr %t8565
  %t8567 = or i64 %t8566, 4
  %t8568 = call i64 @rt_root(i64 %t8567)
  store i64 %t8568, ptr @"scheme.base:current-error-port"
  ret i64 17
}

define i64 @"scheme.base:__init_213"() {
entry:
  %t8606 = call ptr @rt_alloc_words(i64 1)
  %t8607 = ptrtoint ptr %t8606 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-input-port" to i64), ptr %t8606
  %t8608 = or i64 %t8607, 4
  %t8609 = call i64 @rt_root(i64 %t8608)
  store i64 %t8609, ptr @"scheme.base:current-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_214"() {
entry:
  %t8656 = call ptr @rt_alloc_words(i64 1)
  %t8657 = ptrtoint ptr %t8656 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-port" to i64), ptr %t8656
  %t8658 = or i64 %t8657, 4
  %t8659 = call i64 @rt_root(i64 %t8658)
  store i64 %t8659, ptr @"scheme.base:call-with-port"
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
  call i64 @"scheme.base:__init_214"()
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

