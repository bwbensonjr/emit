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
@.str.lit.9 = private unnamed_addr constant [34 x i8] c"string->number: unsupported radix\00"
@.str.lit.10 = private unnamed_addr constant [3 x i8] c": \00"
@.str.sym.11 = private unnamed_addr constant [6 x i8] c"error\00"
@.str.sym.12 = private unnamed_addr constant [5 x i8] c"read\00"
@.str.sym.13 = private unnamed_addr constant [8 x i8] c"call/cc\00"
@.str.lit.14 = private unnamed_addr constant [40 x i8] c"continuation invoked outside its extent\00"
@.str.sym.15 = private unnamed_addr constant [5 x i8] c"file\00"
@.str.lit.16 = private unnamed_addr constant [20 x i8] c"range out of bounds\00"
@.str.sym.17 = private unnamed_addr constant [13 x i8] c"vector->list\00"
@.str.sym.18 = private unnamed_addr constant [12 x i8] c"vector-copy\00"
@.str.sym.19 = private unnamed_addr constant [13 x i8] c"vector-fill!\00"
@.str.sym.20 = private unnamed_addr constant [13 x i8] c"vector-copy!\00"
@.str.sym.21 = private unnamed_addr constant [15 x i8] c"string->vector\00"
@.str.sym.22 = private unnamed_addr constant [15 x i8] c"vector->string\00"
@.str.sym.23 = private unnamed_addr constant [13 x i8] c"string-fill!\00"
@.str.sym.24 = private unnamed_addr constant [13 x i8] c"string-copy!\00"
@.str.sym.25 = private unnamed_addr constant [16 x i8] c"bytevector-copy\00"
@.str.sym.26 = private unnamed_addr constant [17 x i8] c"bytevector-copy!\00"
@.str.lit.27 = private unnamed_addr constant [70 x i8] c"rationalize: no exact rational in range (Emit has no exact rationals)\00"
@.str.lit.28 = private unnamed_addr constant [70 x i8] c"rationalize: no exact rational in range (Emit has no exact rationals)\00"
@.str.lit.29 = private unnamed_addr constant [60 x i8] c"rationalize: no rational found within the denominator limit\00"
@.flo.lit.30 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.flo.lit.31 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.flo.lit.32 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.lit.33 = private unnamed_addr constant [30 x i8] c"hash-table-ref: key not found\00"
@.str.sym.34 = private unnamed_addr constant [17 x i8] c"rd-block-comment\00"
@.str.lit.35 = private unnamed_addr constant [46 x i8] c"unterminated block comment #| opened at index\00"
@.str.sym.36 = private unnamed_addr constant [7 x i8] c"rd-bar\00"
@.str.lit.37 = private unnamed_addr constant [42 x i8] c"unterminated |identifier| opened at index\00"
@.str.sym.38 = private unnamed_addr constant [21 x i8] c"rd-unterminated-list\00"
@.str.lit.39 = private unnamed_addr constant [14 x i8] c"unterminated \00"
@.str.lit.40 = private unnamed_addr constant [7 x i8] c"list [\00"
@.str.lit.41 = private unnamed_addr constant [16 x i8] c"bytevector #u8(\00"
@.str.lit.42 = private unnamed_addr constant [10 x i8] c"vector #(\00"
@.str.lit.43 = private unnamed_addr constant [7 x i8] c"list (\00"
@.str.lit.44 = private unnamed_addr constant [17 x i8] c" opened at index\00"
@.str.sym.45 = private unnamed_addr constant [23 x i8] c"rd-unterminated-string\00"
@.str.lit.46 = private unnamed_addr constant [38 x i8] c"unterminated string \22 opened at index\00"
@.str.sym.47 = private unnamed_addr constant [13 x i8] c"rd-char-name\00"
@.str.lit.48 = private unnamed_addr constant [23 x i8] c"unknown character name\00"
@.str.sym.49 = private unnamed_addr constant [14 x i8] c"rd-hash-token\00"
@.str.lit.50 = private unnamed_addr constant [45 x i8] c"not a boolean; write #t, #true, #f or #false\00"
@.str.sym.51 = private unnamed_addr constant [19 x i8] c"rd-label-duplicate\00"
@.str.lit.52 = private unnamed_addr constant [22 x i8] c"duplicate datum label\00"
@.str.sym.53 = private unnamed_addr constant [20 x i8] c"rd-label-unresolved\00"
@.str.lit.54 = private unnamed_addr constant [48 x i8] c"datum label reference has no earlier definition\00"
@.str.sym.55 = private unnamed_addr constant [14 x i8] c"rd-label-self\00"
@.str.lit.56 = private unnamed_addr constant [56 x i8] c"datum label cannot be defined as only its own reference\00"
@.str.sym.57 = private unnamed_addr constant [9 x i8] c"rd-label\00"
@.str.lit.58 = private unnamed_addr constant [22 x i8] c"malformed datum label\00"
@.str.sym.59 = private unnamed_addr constant [7 x i8] c"rd-eof\00"
@.str.lit.60 = private unnamed_addr constant [50 x i8] c"end of input where a datum was expected, at index\00"
@.str.sym.61 = private unnamed_addr constant [14 x i8] c"rd-unexpected\00"
@.str.lit.62 = private unnamed_addr constant [24 x i8] c"no datum here, at index\00"
@.str.sym.63 = private unnamed_addr constant [12 x i8] c"rd-rational\00"
@.str.lit.64 = private unnamed_addr constant [57 x i8] c"rational literal syntax is not supported -- Emit has no \00"
@.str.lit.65 = private unnamed_addr constant [39 x i8] c"exact rationals; write 0.5, or (/ 1 2)\00"
@.str.lit.66 = private unnamed_addr constant [20 x i8] c"unrecognized syntax\00"
@.str.lit.67 = private unnamed_addr constant [18 x i8] c"not an input port\00"
@.str.lit.68 = private unnamed_addr constant [15 x i8] c"port is closed\00"
@.str.lit.69 = private unnamed_addr constant [19 x i8] c"not an output port\00"
@.str.lit.70 = private unnamed_addr constant [15 x i8] c"port is closed\00"
@.str.sym.71 = private unnamed_addr constant [10 x i8] c"read-char\00"
@.str.sym.72 = private unnamed_addr constant [10 x i8] c"peek-char\00"
@.str.sym.73 = private unnamed_addr constant [10 x i8] c"read-line\00"
@.str.sym.74 = private unnamed_addr constant [12 x i8] c"read-string\00"
@.str.sym.75 = private unnamed_addr constant [19 x i8] c"open-output-string\00"
@.str.lit.76 = private unnamed_addr constant [34 x i8] c"cannot open an output string port\00"
@.str.sym.77 = private unnamed_addr constant [18 x i8] c"get-output-string\00"
@.str.lit.78 = private unnamed_addr constant [19 x i8] c"not an output port\00"
@.str.lit.79 = private unnamed_addr constant [18 x i8] c"not a string port\00"
@.str.sym.80 = private unnamed_addr constant [18 x i8] c"flush-output-port\00"
@.str.sym.81 = private unnamed_addr constant [11 x i8] c"close-port\00"
@.str.lit.82 = private unnamed_addr constant [11 x i8] c"not a port\00"
@.str.sym.83 = private unnamed_addr constant [17 x i8] c"close-input-port\00"
@.str.lit.84 = private unnamed_addr constant [18 x i8] c"not an input port\00"
@.str.sym.85 = private unnamed_addr constant [18 x i8] c"close-output-port\00"
@.str.lit.86 = private unnamed_addr constant [19 x i8] c"not an output port\00"
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

define fastcc i64 @"scheme.base:code_129"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t695 = icmp eq i64 %argc, 2
  br i1 %t695, label %argok151, label %arityerr150
arityerr150:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok151:
  %t696 = call i64 @rt_null_p(i64 %a1)
  %t697 = icmp ne i64 %t696, 1
  br i1 %t697, label %then152, label %else153
then152:
  ret i64 257
else153:
  %t698 = call i64 @rt_pair_p(i64 %a1)
  %t699 = call i64 @rt_not(i64 %t698)
  %t700 = icmp ne i64 %t699, 1
  br i1 %t700, label %then154, label %else155
then154:
  ret i64 1
else155:
  %t701 = call i64 @rt_cdr(i64 %a1)
  %t702 = call i64 @rt_null_p(i64 %t701)
  %t703 = icmp ne i64 %t702, 1
  br i1 %t703, label %then156, label %else157
then156:
  ret i64 257
else157:
  %t704 = call i64 @rt_pair_p(i64 %t701)
  %t705 = call i64 @rt_not(i64 %t704)
  %t706 = icmp ne i64 %t705, 1
  br i1 %t706, label %then158, label %else159
then158:
  ret i64 1
else159:
  %t707 = call i64 @rt_cdr(i64 %a0)
  %t708 = call i64 @rt_cdr(i64 %t701)
  %t709 = call i64 @rt_eq_p(i64 %t707, i64 %t708)
  %t710 = icmp ne i64 %t709, 1
  br i1 %t710, label %then160, label %else161
then160:
  ret i64 1
else161:
  %t711 = musttail call fastcc i64 @"scheme.base:code_129"(i64 %self, i64 2, i64 %t707, i64 %t708, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t711
}

define fastcc i64 @"scheme.base:code:list?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t712 = icmp eq i64 %argc, 1
  br i1 %t712, label %argok163, label %arityerr162
arityerr162:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok163:
  %t713 = call ptr @rt_alloc_words(i64 2)
  %t714 = ptrtoint ptr %t713 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_129" to i64), ptr %t713
  %t715 = or i64 %t714, 4
  %t716 = getelementptr i64, ptr %t713, i64 1
  store i64 %t715, ptr %t716
  %t717 = musttail call fastcc i64 @"scheme.base:code_129"(i64 %t715, i64 2, i64 %a0, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t717
}

define fastcc i64 @"scheme.base:code:zero?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t722 = icmp eq i64 %argc, 1
  br i1 %t722, label %argok165, label %arityerr164
arityerr164:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok165:
  %t723 = or i64 %a0, 0
  %t724 = and i64 %t723, 7
  %t725 = icmp eq i64 %t724, 0
  br i1 %t725, label %fixfast166, label %fixslow167
fixfast166:
  %t726 = icmp eq i64 %a0, 0
  %t727 = select i1 %t726, i64 257, i64 1
  br label %fixmerge168
fixslow167:
  %t728 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge168
fixmerge168:
  %t729 = phi i64 [ %t727, %fixfast166 ], [ %t728, %fixslow167 ]
  ret i64 %t729
}

define fastcc i64 @"scheme.base:code:list-tail"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t734 = icmp eq i64 %argc, 2
  br i1 %t734, label %argok170, label %arityerr169
arityerr169:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok170:
  %t735 = load i64, ptr @"scheme.base:zero?"
  call void @rt_check_callable(i64 %t735)
  %t736 = and i64 %t735, -8
  %t737 = inttoptr i64 %t736 to ptr
  %t738 = load i64, ptr %t737
  %t739 = inttoptr i64 %t738 to ptr
  %t740 = call fastcc i64%t739(i64 %t735, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t741 = icmp ne i64 %t740, 1
  br i1 %t741, label %then171, label %else172
then171:
  ret i64 %a0
else172:
  %t742 = call i64 @rt_cdr(i64 %a0)
  %t743 = or i64 %a1, 8
  %t744 = and i64 %t743, 7
  %t745 = icmp eq i64 %t744, 0
  br i1 %t745, label %fixfast173, label %fixslow174
fixfast173:
  %t746 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a1, i64 8)
  %t747 = extractvalue {i64, i1} %t746, 0
  %t748 = extractvalue {i64, i1} %t746, 1
  br i1 %t748, label %fixslow174, label %fixmerge175
fixslow174:
  %t749 = call i64 @rt_sub(i64 %a1, i64 8)
  br label %fixmerge175
fixmerge175:
  %t750 = phi i64 [ %t747, %fixfast173 ], [ %t749, %fixslow174 ]
  %t751 = load i64, ptr @"scheme.base:list-tail"
  call void @rt_check_callable(i64 %t751)
  %t752 = and i64 %t751, -8
  %t753 = inttoptr i64 %t752 to ptr
  %t754 = load i64, ptr %t753
  %t755 = inttoptr i64 %t754 to ptr
  %t756 = musttail call fastcc i64 %t755(i64 %t751, i64 2, i64 %t742, i64 %t750, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t756
}

define fastcc i64 @"scheme.base:code:list-ref"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t761 = icmp eq i64 %argc, 2
  br i1 %t761, label %argok177, label %arityerr176
arityerr176:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok177:
  %t762 = load i64, ptr @"scheme.base:list-tail"
  call void @rt_check_callable(i64 %t762)
  %t763 = and i64 %t762, -8
  %t764 = inttoptr i64 %t763 to ptr
  %t765 = load i64, ptr %t764
  %t766 = inttoptr i64 %t765 to ptr
  %t767 = call fastcc i64%t766(i64 %t762, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t768 = call i64 @rt_car(i64 %t767)
  ret i64 %t768
}

define fastcc i64 @"scheme.base:code:list-set!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t773 = icmp eq i64 %argc, 3
  br i1 %t773, label %argok179, label %arityerr178
arityerr178:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok179:
  %t774 = load i64, ptr @"scheme.base:list-tail"
  call void @rt_check_callable(i64 %t774)
  %t775 = and i64 %t774, -8
  %t776 = inttoptr i64 %t775 to ptr
  %t777 = load i64, ptr %t776
  %t778 = inttoptr i64 %t777 to ptr
  %t779 = call fastcc i64%t778(i64 %t774, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t780 = call i64 @rt_set_car(i64 %t779, i64 %a2)
  ret i64 %t780
}

define fastcc i64 @"scheme.base:code:list-head"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t785 = icmp eq i64 %argc, 2
  br i1 %t785, label %argok181, label %arityerr180
arityerr180:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok181:
  %t786 = load i64, ptr @"scheme.base:zero?"
  call void @rt_check_callable(i64 %t786)
  %t787 = and i64 %t786, -8
  %t788 = inttoptr i64 %t787 to ptr
  %t789 = load i64, ptr %t788
  %t790 = inttoptr i64 %t789 to ptr
  %t791 = call fastcc i64%t790(i64 %t786, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t792 = icmp ne i64 %t791, 1
  br i1 %t792, label %then182, label %else183
then182:
  ret i64 2
else183:
  %t793 = call i64 @rt_car(i64 %a0)
  %t794 = call i64 @rt_cdr(i64 %a0)
  %t795 = or i64 %a1, 8
  %t796 = and i64 %t795, 7
  %t797 = icmp eq i64 %t796, 0
  br i1 %t797, label %fixfast184, label %fixslow185
fixfast184:
  %t798 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a1, i64 8)
  %t799 = extractvalue {i64, i1} %t798, 0
  %t800 = extractvalue {i64, i1} %t798, 1
  br i1 %t800, label %fixslow185, label %fixmerge186
fixslow185:
  %t801 = call i64 @rt_sub(i64 %a1, i64 8)
  br label %fixmerge186
fixmerge186:
  %t802 = phi i64 [ %t799, %fixfast184 ], [ %t801, %fixslow185 ]
  %t803 = load i64, ptr @"scheme.base:list-head"
  call void @rt_check_callable(i64 %t803)
  %t804 = and i64 %t803, -8
  %t805 = inttoptr i64 %t804 to ptr
  %t806 = load i64, ptr %t805
  %t807 = inttoptr i64 %t806 to ptr
  %t808 = call fastcc i64%t807(i64 %t803, i64 2, i64 %t794, i64 %t802, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t809 = call i64 @rt_cons(i64 %t793, i64 %t808)
  ret i64 %t809
}

define fastcc i64 @"scheme.base:code:make-list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t814 = icmp eq i64 %argc, 2
  br i1 %t814, label %argok188, label %arityerr187
arityerr187:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok188:
  %t815 = load i64, ptr @"scheme.base:zero?"
  call void @rt_check_callable(i64 %t815)
  %t816 = and i64 %t815, -8
  %t817 = inttoptr i64 %t816 to ptr
  %t818 = load i64, ptr %t817
  %t819 = inttoptr i64 %t818 to ptr
  %t820 = call fastcc i64%t819(i64 %t815, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t821 = icmp ne i64 %t820, 1
  br i1 %t821, label %then189, label %else190
then189:
  ret i64 2
else190:
  %t822 = or i64 %a0, 8
  %t823 = and i64 %t822, 7
  %t824 = icmp eq i64 %t823, 0
  br i1 %t824, label %fixfast191, label %fixslow192
fixfast191:
  %t825 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t826 = extractvalue {i64, i1} %t825, 0
  %t827 = extractvalue {i64, i1} %t825, 1
  br i1 %t827, label %fixslow192, label %fixmerge193
fixslow192:
  %t828 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge193
fixmerge193:
  %t829 = phi i64 [ %t826, %fixfast191 ], [ %t828, %fixslow192 ]
  %t830 = load i64, ptr @"scheme.base:make-list"
  call void @rt_check_callable(i64 %t830)
  %t831 = and i64 %t830, -8
  %t832 = inttoptr i64 %t831 to ptr
  %t833 = load i64, ptr %t832
  %t834 = inttoptr i64 %t833 to ptr
  %t835 = call fastcc i64%t834(i64 %t830, i64 2, i64 %t829, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t836 = call i64 @rt_cons(i64 %a1, i64 %t835)
  ret i64 %t836
}

define fastcc i64 @"scheme.base:code_162"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t841 = icmp eq i64 %argc, 2
  br i1 %t841, label %argok195, label %arityerr194
arityerr194:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok195:
  %t842 = and i64 %self, -8
  %t843 = inttoptr i64 %t842 to ptr
  %t844 = getelementptr i64, ptr %t843, i64 1
  %t845 = load i64, ptr %t844
  %t846 = or i64 %a0, %t845
  %t847 = and i64 %t846, 7
  %t848 = icmp eq i64 %t847, 0
  br i1 %t848, label %fixfast196, label %fixslow197
fixfast196:
  %t849 = icmp eq i64 %a0, %t845
  %t850 = select i1 %t849, i64 257, i64 1
  br label %fixmerge198
fixslow197:
  %t851 = call i64 @rt_num_eq(i64 %a0, i64 %t845)
  br label %fixmerge198
fixmerge198:
  %t852 = phi i64 [ %t850, %fixfast196 ], [ %t851, %fixslow197 ]
  %t853 = icmp ne i64 %t852, 1
  br i1 %t853, label %then199, label %else200
then199:
  %t854 = load i64, ptr @"scheme.base:reverse"
  call void @rt_check_callable(i64 %t854)
  %t855 = and i64 %t854, -8
  %t856 = inttoptr i64 %t855 to ptr
  %t857 = load i64, ptr %t856
  %t858 = inttoptr i64 %t857 to ptr
  %t859 = musttail call fastcc i64 %t858(i64 %t854, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t859
else200:
  %t860 = or i64 %a0, 8
  %t861 = and i64 %t860, 7
  %t862 = icmp eq i64 %t861, 0
  br i1 %t862, label %fixfast201, label %fixslow202
fixfast201:
  %t863 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t864 = extractvalue {i64, i1} %t863, 0
  %t865 = extractvalue {i64, i1} %t863, 1
  br i1 %t865, label %fixslow202, label %fixmerge203
fixslow202:
  %t866 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge203
fixmerge203:
  %t867 = phi i64 [ %t864, %fixfast201 ], [ %t866, %fixslow202 ]
  %t868 = call i64 @rt_cons(i64 %a0, i64 %a1)
  %t869 = musttail call fastcc i64 @"scheme.base:code_162"(i64 %self, i64 2, i64 %t867, i64 %t868, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t869
}

define fastcc i64 @"scheme.base:code:iota"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t870 = icmp eq i64 %argc, 1
  br i1 %t870, label %argok205, label %arityerr204
arityerr204:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok205:
  %t871 = call ptr @rt_alloc_words(i64 3)
  %t872 = ptrtoint ptr %t871 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_162" to i64), ptr %t871
  %t873 = or i64 %t872, 4
  %t874 = getelementptr i64, ptr %t871, i64 1
  store i64 %a0, ptr %t874
  %t875 = getelementptr i64, ptr %t871, i64 2
  store i64 %t873, ptr %t875
  %t876 = musttail call fastcc i64 @"scheme.base:code_162"(i64 %t873, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t876
}

define fastcc i64 @"scheme.base:code:%minmax-fold"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t881 = icmp eq i64 %argc, 4
  br i1 %t881, label %argok207, label %arityerr206
arityerr206:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok207:
  %t882 = call i64 @rt_null_p(i64 %a1)
  %t883 = icmp ne i64 %t882, 1
  br i1 %t883, label %then208, label %else209
then208:
  %t884 = icmp ne i64 %a3, 1
  br i1 %t884, label %then210, label %else211
then210:
  %t885 = call i64 @rt_exact_to_inexact(i64 %a2)
  ret i64 %t885
else211:
  ret i64 %a2
else209:
  %t886 = call i64 @rt_cdr(i64 %a1)
  %t887 = call i64 @rt_car(i64 %a1)
  call void @rt_check_callable(i64 %a0)
  %t888 = and i64 %a0, -8
  %t889 = inttoptr i64 %t888 to ptr
  %t890 = load i64, ptr %t889
  %t891 = inttoptr i64 %t890 to ptr
  %t892 = call fastcc i64%t891(i64 %a0, i64 2, i64 %a2, i64 %t887, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t893 = icmp ne i64 %a3, 1
  br i1 %t893, label %then212, label %else213
then212:
  br label %merge214
else213:
  %t894 = call i64 @rt_car(i64 %a1)
  %t895 = call i64 @rt_inexact_p(i64 %t894)
  br label %merge214
merge214:
  %t896 = phi i64 [ 257, %then212 ], [ %t895, %else213 ]
  %t897 = load i64, ptr @"scheme.base:%minmax-fold"
  call void @rt_check_callable(i64 %t897)
  %t898 = and i64 %t897, -8
  %t899 = inttoptr i64 %t898 to ptr
  %t900 = load i64, ptr %t899
  %t901 = inttoptr i64 %t900 to ptr
  %t902 = musttail call fastcc i64 %t901(i64 %t897, i64 4, i64 %a0, i64 %t886, i64 %t892, i64 %t896, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t902
}

define fastcc i64 @"scheme.base:code:%minmax"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t907 = icmp eq i64 %argc, 3
  br i1 %t907, label %argok216, label %arityerr215
arityerr215:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok216:
  %t908 = call i64 @rt_inexact_p(i64 %a1)
  %t909 = load i64, ptr @"scheme.base:%minmax-fold"
  call void @rt_check_callable(i64 %t909)
  %t910 = and i64 %t909, -8
  %t911 = inttoptr i64 %t910 to ptr
  %t912 = load i64, ptr %t911
  %t913 = inttoptr i64 %t912 to ptr
  %t914 = musttail call fastcc i64 %t913(i64 %t909, i64 4, i64 %a0, i64 %a2, i64 %a1, i64 %t908, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t914
}

define fastcc i64 @"scheme.base:code_182"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t919 = icmp eq i64 %argc, 2
  br i1 %t919, label %argok218, label %arityerr217
arityerr217:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok218:
  %t920 = or i64 %a0, %a1
  %t921 = and i64 %t920, 7
  %t922 = icmp eq i64 %t921, 0
  br i1 %t922, label %fixfast219, label %fixslow220
fixfast219:
  %t923 = icmp slt i64 %a0, %a1
  %t924 = select i1 %t923, i64 257, i64 1
  br label %fixmerge221
fixslow220:
  %t925 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge221
fixmerge221:
  %t926 = phi i64 [ %t924, %fixfast219 ], [ %t925, %fixslow220 ]
  %t927 = icmp ne i64 %t926, 1
  br i1 %t927, label %then222, label %else223
then222:
  ret i64 %a1
else223:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:max"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t928 = icmp sge i64 %argc, 1
  br i1 %t928, label %argok225, label %arityerr224
arityerr224:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok225:
  %t929 = call ptr @rt_alloc_words(i64 8)
  %t930 = getelementptr i64, ptr %t929, i64 0
  store i64 %a0, ptr %t930
  %t931 = getelementptr i64, ptr %t929, i64 1
  store i64 %a1, ptr %t931
  %t932 = getelementptr i64, ptr %t929, i64 2
  store i64 %a2, ptr %t932
  %t933 = getelementptr i64, ptr %t929, i64 3
  store i64 %a3, ptr %t933
  %t934 = getelementptr i64, ptr %t929, i64 4
  store i64 %a4, ptr %t934
  %t935 = getelementptr i64, ptr %t929, i64 5
  store i64 %a5, ptr %t935
  %t936 = getelementptr i64, ptr %t929, i64 6
  store i64 %a6, ptr %t936
  %t937 = getelementptr i64, ptr %t929, i64 7
  store i64 %a7, ptr %t937
  %t938 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t929, ptr %overflow)
  %t939 = call ptr @rt_alloc_words(i64 1)
  %t940 = ptrtoint ptr %t939 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_182" to i64), ptr %t939
  %t941 = or i64 %t940, 4
  %t942 = load i64, ptr @"scheme.base:%minmax"
  call void @rt_check_callable(i64 %t942)
  %t943 = and i64 %t942, -8
  %t944 = inttoptr i64 %t943 to ptr
  %t945 = load i64, ptr %t944
  %t946 = inttoptr i64 %t945 to ptr
  %t947 = musttail call fastcc i64 %t946(i64 %t942, i64 3, i64 %t941, i64 %a0, i64 %t938, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t947
}

define fastcc i64 @"scheme.base:code_193"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t952 = icmp eq i64 %argc, 2
  br i1 %t952, label %argok227, label %arityerr226
arityerr226:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok227:
  %t953 = or i64 %a1, %a0
  %t954 = and i64 %t953, 7
  %t955 = icmp eq i64 %t954, 0
  br i1 %t955, label %fixfast228, label %fixslow229
fixfast228:
  %t956 = icmp slt i64 %a1, %a0
  %t957 = select i1 %t956, i64 257, i64 1
  br label %fixmerge230
fixslow229:
  %t958 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge230
fixmerge230:
  %t959 = phi i64 [ %t957, %fixfast228 ], [ %t958, %fixslow229 ]
  %t960 = icmp ne i64 %t959, 1
  br i1 %t960, label %then231, label %else232
then231:
  ret i64 %a1
else232:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:min"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t961 = icmp sge i64 %argc, 1
  br i1 %t961, label %argok234, label %arityerr233
arityerr233:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok234:
  %t962 = call ptr @rt_alloc_words(i64 8)
  %t963 = getelementptr i64, ptr %t962, i64 0
  store i64 %a0, ptr %t963
  %t964 = getelementptr i64, ptr %t962, i64 1
  store i64 %a1, ptr %t964
  %t965 = getelementptr i64, ptr %t962, i64 2
  store i64 %a2, ptr %t965
  %t966 = getelementptr i64, ptr %t962, i64 3
  store i64 %a3, ptr %t966
  %t967 = getelementptr i64, ptr %t962, i64 4
  store i64 %a4, ptr %t967
  %t968 = getelementptr i64, ptr %t962, i64 5
  store i64 %a5, ptr %t968
  %t969 = getelementptr i64, ptr %t962, i64 6
  store i64 %a6, ptr %t969
  %t970 = getelementptr i64, ptr %t962, i64 7
  store i64 %a7, ptr %t970
  %t971 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t962, ptr %overflow)
  %t972 = call ptr @rt_alloc_words(i64 1)
  %t973 = ptrtoint ptr %t972 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_193" to i64), ptr %t972
  %t974 = or i64 %t973, 4
  %t975 = load i64, ptr @"scheme.base:%minmax"
  call void @rt_check_callable(i64 %t975)
  %t976 = and i64 %t975, -8
  %t977 = inttoptr i64 %t976 to ptr
  %t978 = load i64, ptr %t977
  %t979 = inttoptr i64 %t978 to ptr
  %t980 = musttail call fastcc i64 %t979(i64 %t975, i64 3, i64 %t974, i64 %a0, i64 %t971, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t980
}

define fastcc i64 @"scheme.base:code:complex?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t985 = icmp eq i64 %argc, 1
  br i1 %t985, label %argok236, label %arityerr235
arityerr235:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok236:
  %t986 = call i64 @rt_number_p(i64 %a0)
  ret i64 %t986
}

define fastcc i64 @"scheme.base:code:exact-integer?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t991 = icmp eq i64 %argc, 1
  br i1 %t991, label %argok238, label %arityerr237
arityerr237:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok238:
  %t992 = call i64 @rt_exact_p(i64 %a0)
  %t993 = icmp ne i64 %t992, 1
  br i1 %t993, label %then239, label %else240
then239:
  %t994 = call i64 @rt_integer_p(i64 %a0)
  ret i64 %t994
else240:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rational?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t999 = icmp eq i64 %argc, 1
  br i1 %t999, label %argok242, label %arityerr241
arityerr241:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok242:
  %t1000 = call i64 @rt_number_p(i64 %a0)
  %t1001 = icmp ne i64 %t1000, 1
  br i1 %t1001, label %then243, label %else244
then243:
  %t1002 = call i64 @rt_finite_p(i64 %a0)
  ret i64 %t1002
else244:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:positive?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1007 = icmp eq i64 %argc, 1
  br i1 %t1007, label %argok246, label %arityerr245
arityerr245:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok246:
  %t1008 = or i64 0, %a0
  %t1009 = and i64 %t1008, 7
  %t1010 = icmp eq i64 %t1009, 0
  br i1 %t1010, label %fixfast247, label %fixslow248
fixfast247:
  %t1011 = icmp slt i64 0, %a0
  %t1012 = select i1 %t1011, i64 257, i64 1
  br label %fixmerge249
fixslow248:
  %t1013 = call i64 @rt_lt(i64 0, i64 %a0)
  br label %fixmerge249
fixmerge249:
  %t1014 = phi i64 [ %t1012, %fixfast247 ], [ %t1013, %fixslow248 ]
  ret i64 %t1014
}

define fastcc i64 @"scheme.base:code:negative?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1019 = icmp eq i64 %argc, 1
  br i1 %t1019, label %argok251, label %arityerr250
arityerr250:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok251:
  %t1020 = or i64 %a0, 0
  %t1021 = and i64 %t1020, 7
  %t1022 = icmp eq i64 %t1021, 0
  br i1 %t1022, label %fixfast252, label %fixslow253
fixfast252:
  %t1023 = icmp slt i64 %a0, 0
  %t1024 = select i1 %t1023, i64 257, i64 1
  br label %fixmerge254
fixslow253:
  %t1025 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge254
fixmerge254:
  %t1026 = phi i64 [ %t1024, %fixfast252 ], [ %t1025, %fixslow253 ]
  ret i64 %t1026
}

define fastcc i64 @"scheme.base:code:even?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1031 = icmp eq i64 %argc, 1
  br i1 %t1031, label %argok256, label %arityerr255
arityerr255:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok256:
  %t1032 = call i64 @rt_remainder(i64 %a0, i64 16)
  %t1033 = or i64 0, %t1032
  %t1034 = and i64 %t1033, 7
  %t1035 = icmp eq i64 %t1034, 0
  br i1 %t1035, label %fixfast257, label %fixslow258
fixfast257:
  %t1036 = icmp eq i64 0, %t1032
  %t1037 = select i1 %t1036, i64 257, i64 1
  br label %fixmerge259
fixslow258:
  %t1038 = call i64 @rt_num_eq(i64 0, i64 %t1032)
  br label %fixmerge259
fixmerge259:
  %t1039 = phi i64 [ %t1037, %fixfast257 ], [ %t1038, %fixslow258 ]
  ret i64 %t1039
}

define fastcc i64 @"scheme.base:code:odd?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1044 = icmp eq i64 %argc, 1
  br i1 %t1044, label %argok261, label %arityerr260
arityerr260:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok261:
  %t1045 = call i64 @rt_remainder(i64 %a0, i64 16)
  %t1046 = or i64 0, %t1045
  %t1047 = and i64 %t1046, 7
  %t1048 = icmp eq i64 %t1047, 0
  br i1 %t1048, label %fixfast262, label %fixslow263
fixfast262:
  %t1049 = icmp eq i64 0, %t1045
  %t1050 = select i1 %t1049, i64 257, i64 1
  br label %fixmerge264
fixslow263:
  %t1051 = call i64 @rt_num_eq(i64 0, i64 %t1045)
  br label %fixmerge264
fixmerge264:
  %t1052 = phi i64 [ %t1050, %fixfast262 ], [ %t1051, %fixslow263 ]
  %t1053 = icmp ne i64 %t1052, 1
  br i1 %t1053, label %then265, label %else266
then265:
  ret i64 1
else266:
  ret i64 257
}

define fastcc i64 @"scheme.base:code:abs"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1058 = icmp eq i64 %argc, 1
  br i1 %t1058, label %argok268, label %arityerr267
arityerr267:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok268:
  %t1059 = or i64 %a0, 0
  %t1060 = and i64 %t1059, 7
  %t1061 = icmp eq i64 %t1060, 0
  br i1 %t1061, label %fixfast269, label %fixslow270
fixfast269:
  %t1062 = icmp slt i64 %a0, 0
  %t1063 = select i1 %t1062, i64 257, i64 1
  br label %fixmerge271
fixslow270:
  %t1064 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge271
fixmerge271:
  %t1065 = phi i64 [ %t1063, %fixfast269 ], [ %t1064, %fixslow270 ]
  %t1066 = icmp ne i64 %t1065, 1
  br i1 %t1066, label %then272, label %else273
then272:
  %t1067 = or i64 0, %a0
  %t1068 = and i64 %t1067, 7
  %t1069 = icmp eq i64 %t1068, 0
  br i1 %t1069, label %fixfast274, label %fixslow275
fixfast274:
  %t1070 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %a0)
  %t1071 = extractvalue {i64, i1} %t1070, 0
  %t1072 = extractvalue {i64, i1} %t1070, 1
  br i1 %t1072, label %fixslow275, label %fixmerge276
fixslow275:
  %t1073 = call i64 @rt_sub(i64 0, i64 %a0)
  br label %fixmerge276
fixmerge276:
  %t1074 = phi i64 [ %t1071, %fixfast274 ], [ %t1073, %fixslow275 ]
  ret i64 %t1074
else273:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:square"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1079 = icmp eq i64 %argc, 1
  br i1 %t1079, label %argok278, label %arityerr277
arityerr277:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok278:
  %t1080 = or i64 %a0, %a0
  %t1081 = and i64 %t1080, 7
  %t1082 = icmp eq i64 %t1081, 0
  br i1 %t1082, label %fixfast279, label %fixslow280
fixfast279:
  %t1083 = ashr i64 %a0, 3
  %t1084 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1083, i64 %a0)
  %t1085 = extractvalue {i64, i1} %t1084, 0
  %t1086 = extractvalue {i64, i1} %t1084, 1
  br i1 %t1086, label %fixslow280, label %fixmerge281
fixslow280:
  %t1087 = call i64 @rt_mul(i64 %a0, i64 %a0)
  br label %fixmerge281
fixmerge281:
  %t1088 = phi i64 [ %t1085, %fixfast279 ], [ %t1087, %fixslow280 ]
  ret i64 %t1088
}

define fastcc i64 @"scheme.base:code:%gcd2"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1093 = icmp eq i64 %argc, 2
  br i1 %t1093, label %argok283, label %arityerr282
arityerr282:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok283:
  %t1094 = or i64 %a1, 0
  %t1095 = and i64 %t1094, 7
  %t1096 = icmp eq i64 %t1095, 0
  br i1 %t1096, label %fixfast284, label %fixslow285
fixfast284:
  %t1097 = icmp eq i64 %a1, 0
  %t1098 = select i1 %t1097, i64 257, i64 1
  br label %fixmerge286
fixslow285:
  %t1099 = call i64 @rt_num_eq(i64 %a1, i64 0)
  br label %fixmerge286
fixmerge286:
  %t1100 = phi i64 [ %t1098, %fixfast284 ], [ %t1099, %fixslow285 ]
  %t1101 = icmp ne i64 %t1100, 1
  br i1 %t1101, label %then287, label %else288
then287:
  ret i64 %a0
else288:
  %t1102 = call i64 @rt_remainder(i64 %a0, i64 %a1)
  %t1103 = load i64, ptr @"scheme.base:%gcd2"
  call void @rt_check_callable(i64 %t1103)
  %t1104 = and i64 %t1103, -8
  %t1105 = inttoptr i64 %t1104 to ptr
  %t1106 = load i64, ptr %t1105
  %t1107 = inttoptr i64 %t1106 to ptr
  %t1108 = musttail call fastcc i64 %t1107(i64 %t1103, i64 2, i64 %a1, i64 %t1102, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1108
}

define fastcc i64 @"scheme.base:code:%gcd-fold"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1113 = icmp eq i64 %argc, 2
  br i1 %t1113, label %argok290, label %arityerr289
arityerr289:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok290:
  %t1114 = call i64 @rt_null_p(i64 %a0)
  %t1115 = icmp ne i64 %t1114, 1
  br i1 %t1115, label %then291, label %else292
then291:
  ret i64 %a1
else292:
  %t1116 = call i64 @rt_cdr(i64 %a0)
  %t1117 = call i64 @rt_car(i64 %a0)
  %t1118 = load i64, ptr @"scheme.base:abs"
  call void @rt_check_callable(i64 %t1118)
  %t1119 = and i64 %t1118, -8
  %t1120 = inttoptr i64 %t1119 to ptr
  %t1121 = load i64, ptr %t1120
  %t1122 = inttoptr i64 %t1121 to ptr
  %t1123 = call fastcc i64%t1122(i64 %t1118, i64 1, i64 %t1117, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1124 = load i64, ptr @"scheme.base:abs"
  call void @rt_check_callable(i64 %t1124)
  %t1125 = and i64 %t1124, -8
  %t1126 = inttoptr i64 %t1125 to ptr
  %t1127 = load i64, ptr %t1126
  %t1128 = inttoptr i64 %t1127 to ptr
  %t1129 = call fastcc i64%t1128(i64 %t1124, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1130 = load i64, ptr @"scheme.base:%gcd2"
  call void @rt_check_callable(i64 %t1130)
  %t1131 = and i64 %t1130, -8
  %t1132 = inttoptr i64 %t1131 to ptr
  %t1133 = load i64, ptr %t1132
  %t1134 = inttoptr i64 %t1133 to ptr
  %t1135 = call fastcc i64%t1134(i64 %t1130, i64 2, i64 %t1123, i64 %t1129, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1136 = load i64, ptr @"scheme.base:%gcd-fold"
  call void @rt_check_callable(i64 %t1136)
  %t1137 = and i64 %t1136, -8
  %t1138 = inttoptr i64 %t1137 to ptr
  %t1139 = load i64, ptr %t1138
  %t1140 = inttoptr i64 %t1139 to ptr
  %t1141 = musttail call fastcc i64 %t1140(i64 %t1136, i64 2, i64 %t1116, i64 %t1135, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1141
}

define fastcc i64 @"scheme.base:code:%lcm-fold"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1146 = icmp eq i64 %argc, 2
  br i1 %t1146, label %argok294, label %arityerr293
arityerr293:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok294:
  %t1147 = call i64 @rt_null_p(i64 %a0)
  %t1148 = icmp ne i64 %t1147, 1
  br i1 %t1148, label %then295, label %else296
then295:
  ret i64 %a1
else296:
  %t1149 = call i64 @rt_car(i64 %a0)
  %t1150 = load i64, ptr @"scheme.base:abs"
  call void @rt_check_callable(i64 %t1150)
  %t1151 = and i64 %t1150, -8
  %t1152 = inttoptr i64 %t1151 to ptr
  %t1153 = load i64, ptr %t1152
  %t1154 = inttoptr i64 %t1153 to ptr
  %t1155 = call fastcc i64%t1154(i64 %t1150, i64 1, i64 %t1149, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1156 = or i64 %t1155, 0
  %t1157 = and i64 %t1156, 7
  %t1158 = icmp eq i64 %t1157, 0
  br i1 %t1158, label %fixfast297, label %fixslow298
fixfast297:
  %t1159 = icmp eq i64 %t1155, 0
  %t1160 = select i1 %t1159, i64 257, i64 1
  br label %fixmerge299
fixslow298:
  %t1161 = call i64 @rt_num_eq(i64 %t1155, i64 0)
  br label %fixmerge299
fixmerge299:
  %t1162 = phi i64 [ %t1160, %fixfast297 ], [ %t1161, %fixslow298 ]
  %t1163 = icmp ne i64 %t1162, 1
  br i1 %t1163, label %then300, label %else301
then300:
  ret i64 0
else301:
  %t1164 = call i64 @rt_cdr(i64 %a0)
  %t1165 = or i64 %a1, %t1155
  %t1166 = and i64 %t1165, 7
  %t1167 = icmp eq i64 %t1166, 0
  br i1 %t1167, label %fixfast302, label %fixslow303
fixfast302:
  %t1168 = ashr i64 %a1, 3
  %t1169 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1168, i64 %t1155)
  %t1170 = extractvalue {i64, i1} %t1169, 0
  %t1171 = extractvalue {i64, i1} %t1169, 1
  br i1 %t1171, label %fixslow303, label %fixmerge304
fixslow303:
  %t1172 = call i64 @rt_mul(i64 %a1, i64 %t1155)
  br label %fixmerge304
fixmerge304:
  %t1173 = phi i64 [ %t1170, %fixfast302 ], [ %t1172, %fixslow303 ]
  %t1174 = load i64, ptr @"scheme.base:%gcd2"
  call void @rt_check_callable(i64 %t1174)
  %t1175 = and i64 %t1174, -8
  %t1176 = inttoptr i64 %t1175 to ptr
  %t1177 = load i64, ptr %t1176
  %t1178 = inttoptr i64 %t1177 to ptr
  %t1179 = call fastcc i64%t1178(i64 %t1174, i64 2, i64 %a1, i64 %t1155, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1180 = call i64 @rt_quotient(i64 %t1173, i64 %t1179)
  %t1181 = load i64, ptr @"scheme.base:%lcm-fold"
  call void @rt_check_callable(i64 %t1181)
  %t1182 = and i64 %t1181, -8
  %t1183 = inttoptr i64 %t1182 to ptr
  %t1184 = load i64, ptr %t1183
  %t1185 = inttoptr i64 %t1184 to ptr
  %t1186 = musttail call fastcc i64 %t1185(i64 %t1181, i64 2, i64 %t1164, i64 %t1180, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1186
}

define fastcc i64 @"scheme.base:code:gcd"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1191 = icmp sge i64 %argc, 0
  br i1 %t1191, label %argok306, label %arityerr305
arityerr305:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok306:
  %t1192 = call ptr @rt_alloc_words(i64 8)
  %t1193 = getelementptr i64, ptr %t1192, i64 0
  store i64 %a0, ptr %t1193
  %t1194 = getelementptr i64, ptr %t1192, i64 1
  store i64 %a1, ptr %t1194
  %t1195 = getelementptr i64, ptr %t1192, i64 2
  store i64 %a2, ptr %t1195
  %t1196 = getelementptr i64, ptr %t1192, i64 3
  store i64 %a3, ptr %t1196
  %t1197 = getelementptr i64, ptr %t1192, i64 4
  store i64 %a4, ptr %t1197
  %t1198 = getelementptr i64, ptr %t1192, i64 5
  store i64 %a5, ptr %t1198
  %t1199 = getelementptr i64, ptr %t1192, i64 6
  store i64 %a6, ptr %t1199
  %t1200 = getelementptr i64, ptr %t1192, i64 7
  store i64 %a7, ptr %t1200
  %t1201 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1192, ptr %overflow)
  %t1202 = load i64, ptr @"scheme.base:%gcd-fold"
  call void @rt_check_callable(i64 %t1202)
  %t1203 = and i64 %t1202, -8
  %t1204 = inttoptr i64 %t1203 to ptr
  %t1205 = load i64, ptr %t1204
  %t1206 = inttoptr i64 %t1205 to ptr
  %t1207 = musttail call fastcc i64 %t1206(i64 %t1202, i64 2, i64 %t1201, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1207
}

define fastcc i64 @"scheme.base:code:lcm"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1212 = icmp sge i64 %argc, 0
  br i1 %t1212, label %argok308, label %arityerr307
arityerr307:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok308:
  %t1213 = call ptr @rt_alloc_words(i64 8)
  %t1214 = getelementptr i64, ptr %t1213, i64 0
  store i64 %a0, ptr %t1214
  %t1215 = getelementptr i64, ptr %t1213, i64 1
  store i64 %a1, ptr %t1215
  %t1216 = getelementptr i64, ptr %t1213, i64 2
  store i64 %a2, ptr %t1216
  %t1217 = getelementptr i64, ptr %t1213, i64 3
  store i64 %a3, ptr %t1217
  %t1218 = getelementptr i64, ptr %t1213, i64 4
  store i64 %a4, ptr %t1218
  %t1219 = getelementptr i64, ptr %t1213, i64 5
  store i64 %a5, ptr %t1219
  %t1220 = getelementptr i64, ptr %t1213, i64 6
  store i64 %a6, ptr %t1220
  %t1221 = getelementptr i64, ptr %t1213, i64 7
  store i64 %a7, ptr %t1221
  %t1222 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1213, ptr %overflow)
  %t1223 = load i64, ptr @"scheme.base:%lcm-fold"
  call void @rt_check_callable(i64 %t1223)
  %t1224 = and i64 %t1223, -8
  %t1225 = inttoptr i64 %t1224 to ptr
  %t1226 = load i64, ptr %t1225
  %t1227 = inttoptr i64 %t1226 to ptr
  %t1228 = musttail call fastcc i64 %t1227(i64 %t1223, i64 2, i64 %t1222, i64 8, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1228
}

define fastcc i64 @"scheme.base:code:%expt-exact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1233 = icmp eq i64 %argc, 3
  br i1 %t1233, label %argok310, label %arityerr309
arityerr309:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok310:
  %t1234 = or i64 %a1, 0
  %t1235 = and i64 %t1234, 7
  %t1236 = icmp eq i64 %t1235, 0
  br i1 %t1236, label %fixfast311, label %fixslow312
fixfast311:
  %t1237 = icmp eq i64 %a1, 0
  %t1238 = select i1 %t1237, i64 257, i64 1
  br label %fixmerge313
fixslow312:
  %t1239 = call i64 @rt_num_eq(i64 %a1, i64 0)
  br label %fixmerge313
fixmerge313:
  %t1240 = phi i64 [ %t1238, %fixfast311 ], [ %t1239, %fixslow312 ]
  %t1241 = icmp ne i64 %t1240, 1
  br i1 %t1241, label %then314, label %else315
then314:
  ret i64 %a2
else315:
  %t1242 = or i64 %a0, %a0
  %t1243 = and i64 %t1242, 7
  %t1244 = icmp eq i64 %t1243, 0
  br i1 %t1244, label %fixfast316, label %fixslow317
fixfast316:
  %t1245 = ashr i64 %a0, 3
  %t1246 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1245, i64 %a0)
  %t1247 = extractvalue {i64, i1} %t1246, 0
  %t1248 = extractvalue {i64, i1} %t1246, 1
  br i1 %t1248, label %fixslow317, label %fixmerge318
fixslow317:
  %t1249 = call i64 @rt_mul(i64 %a0, i64 %a0)
  br label %fixmerge318
fixmerge318:
  %t1250 = phi i64 [ %t1247, %fixfast316 ], [ %t1249, %fixslow317 ]
  %t1251 = call i64 @rt_quotient(i64 %a1, i64 16)
  %t1252 = load i64, ptr @"scheme.base:odd?"
  call void @rt_check_callable(i64 %t1252)
  %t1253 = and i64 %t1252, -8
  %t1254 = inttoptr i64 %t1253 to ptr
  %t1255 = load i64, ptr %t1254
  %t1256 = inttoptr i64 %t1255 to ptr
  %t1257 = call fastcc i64%t1256(i64 %t1252, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1258 = icmp ne i64 %t1257, 1
  br i1 %t1258, label %then319, label %else320
then319:
  %t1259 = or i64 %a2, %a0
  %t1260 = and i64 %t1259, 7
  %t1261 = icmp eq i64 %t1260, 0
  br i1 %t1261, label %fixfast322, label %fixslow323
fixfast322:
  %t1262 = ashr i64 %a2, 3
  %t1263 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1262, i64 %a0)
  %t1264 = extractvalue {i64, i1} %t1263, 0
  %t1265 = extractvalue {i64, i1} %t1263, 1
  br i1 %t1265, label %fixslow323, label %fixmerge324
fixslow323:
  %t1266 = call i64 @rt_mul(i64 %a2, i64 %a0)
  br label %fixmerge324
fixmerge324:
  %t1267 = phi i64 [ %t1264, %fixfast322 ], [ %t1266, %fixslow323 ]
  br label %merge321
else320:
  br label %merge321
merge321:
  %t1268 = phi i64 [ %t1267, %fixmerge324 ], [ %a2, %else320 ]
  %t1269 = load i64, ptr @"scheme.base:%expt-exact"
  call void @rt_check_callable(i64 %t1269)
  %t1270 = and i64 %t1269, -8
  %t1271 = inttoptr i64 %t1270 to ptr
  %t1272 = load i64, ptr %t1271
  %t1273 = inttoptr i64 %t1272 to ptr
  %t1274 = musttail call fastcc i64 %t1273(i64 %t1269, i64 3, i64 %t1250, i64 %t1251, i64 %t1268, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1274
}

define fastcc i64 @"scheme.base:code:expt"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1279 = icmp eq i64 %argc, 2
  br i1 %t1279, label %argok326, label %arityerr325
arityerr325:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok326:
  %t1280 = call i64 @rt_exact_p(i64 %a1)
  %t1281 = icmp ne i64 %t1280, 1
  br i1 %t1281, label %then327, label %else328
then327:
  %t1282 = or i64 %a1, 0
  %t1283 = and i64 %t1282, 7
  %t1284 = icmp eq i64 %t1283, 0
  br i1 %t1284, label %fixfast329, label %fixslow330
fixfast329:
  %t1285 = icmp slt i64 %a1, 0
  %t1286 = select i1 %t1285, i64 257, i64 1
  br label %fixmerge331
fixslow330:
  %t1287 = call i64 @rt_lt(i64 %a1, i64 0)
  br label %fixmerge331
fixmerge331:
  %t1288 = phi i64 [ %t1286, %fixfast329 ], [ %t1287, %fixslow330 ]
  %t1289 = icmp ne i64 %t1288, 1
  br i1 %t1289, label %then332, label %else333
then332:
  %t1290 = call i64 @rt_pow(i64 %a0, i64 %a1)
  ret i64 %t1290
else333:
  %t1291 = call i64 @rt_exact_p(i64 %a0)
  %t1292 = icmp ne i64 %t1291, 1
  br i1 %t1292, label %then334, label %else335
then334:
  %t1293 = load i64, ptr @"scheme.base:%expt-exact"
  call void @rt_check_callable(i64 %t1293)
  %t1294 = and i64 %t1293, -8
  %t1295 = inttoptr i64 %t1294 to ptr
  %t1296 = load i64, ptr %t1295
  %t1297 = inttoptr i64 %t1296 to ptr
  %t1298 = musttail call fastcc i64 %t1297(i64 %t1293, i64 3, i64 %a0, i64 %a1, i64 8, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1298
else335:
  %t1299 = call i64 @rt_flonum_lit(ptr @.flo.lit.0)
  %t1300 = load i64, ptr @"scheme.base:%expt-exact"
  call void @rt_check_callable(i64 %t1300)
  %t1301 = and i64 %t1300, -8
  %t1302 = inttoptr i64 %t1301 to ptr
  %t1303 = load i64, ptr %t1302
  %t1304 = inttoptr i64 %t1303 to ptr
  %t1305 = musttail call fastcc i64 %t1304(i64 %t1300, i64 3, i64 %a0, i64 %a1, i64 %t1299, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1305
else328:
  %t1306 = call i64 @rt_pow(i64 %a0, i64 %a1)
  ret i64 %t1306
}

define fastcc i64 @"scheme.base:code:%isqrt-loop"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1311 = icmp eq i64 %argc, 2
  br i1 %t1311, label %argok337, label %arityerr336
arityerr336:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok337:
  %t1312 = call i64 @rt_quotient(i64 %a0, i64 %a1)
  %t1313 = or i64 %a1, %t1312
  %t1314 = and i64 %t1313, 7
  %t1315 = icmp eq i64 %t1314, 0
  br i1 %t1315, label %fixfast338, label %fixslow339
fixfast338:
  %t1316 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t1312)
  %t1317 = extractvalue {i64, i1} %t1316, 0
  %t1318 = extractvalue {i64, i1} %t1316, 1
  br i1 %t1318, label %fixslow339, label %fixmerge340
fixslow339:
  %t1319 = call i64 @rt_add(i64 %a1, i64 %t1312)
  br label %fixmerge340
fixmerge340:
  %t1320 = phi i64 [ %t1317, %fixfast338 ], [ %t1319, %fixslow339 ]
  %t1321 = call i64 @rt_quotient(i64 %t1320, i64 16)
  %t1322 = or i64 %t1321, %a1
  %t1323 = and i64 %t1322, 7
  %t1324 = icmp eq i64 %t1323, 0
  br i1 %t1324, label %fixfast341, label %fixslow342
fixfast341:
  %t1325 = icmp slt i64 %t1321, %a1
  %t1326 = select i1 %t1325, i64 257, i64 1
  br label %fixmerge343
fixslow342:
  %t1327 = call i64 @rt_lt(i64 %t1321, i64 %a1)
  br label %fixmerge343
fixmerge343:
  %t1328 = phi i64 [ %t1326, %fixfast341 ], [ %t1327, %fixslow342 ]
  %t1329 = icmp ne i64 %t1328, 1
  br i1 %t1329, label %then344, label %else345
then344:
  %t1330 = load i64, ptr @"scheme.base:%isqrt-loop"
  call void @rt_check_callable(i64 %t1330)
  %t1331 = and i64 %t1330, -8
  %t1332 = inttoptr i64 %t1331 to ptr
  %t1333 = load i64, ptr %t1332
  %t1334 = inttoptr i64 %t1333 to ptr
  %t1335 = musttail call fastcc i64 %t1334(i64 %t1330, i64 2, i64 %a0, i64 %t1321, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1335
else345:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:%isqrt"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1340 = icmp eq i64 %argc, 1
  br i1 %t1340, label %argok347, label %arityerr346
arityerr346:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok347:
  %t1341 = or i64 %a0, 0
  %t1342 = and i64 %t1341, 7
  %t1343 = icmp eq i64 %t1342, 0
  br i1 %t1343, label %fixfast348, label %fixslow349
fixfast348:
  %t1344 = icmp eq i64 %a0, 0
  %t1345 = select i1 %t1344, i64 257, i64 1
  br label %fixmerge350
fixslow349:
  %t1346 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge350
fixmerge350:
  %t1347 = phi i64 [ %t1345, %fixfast348 ], [ %t1346, %fixslow349 ]
  %t1348 = icmp ne i64 %t1347, 1
  br i1 %t1348, label %then351, label %else352
then351:
  ret i64 0
else352:
  %t1349 = load i64, ptr @"scheme.base:%isqrt-loop"
  call void @rt_check_callable(i64 %t1349)
  %t1350 = and i64 %t1349, -8
  %t1351 = inttoptr i64 %t1350 to ptr
  %t1352 = load i64, ptr %t1351
  %t1353 = inttoptr i64 %t1352 to ptr
  %t1354 = musttail call fastcc i64 %t1353(i64 %t1349, i64 2, i64 %a0, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1354
}

define fastcc i64 @"scheme.base:code:exact-integer-sqrt"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1359 = icmp eq i64 %argc, 1
  br i1 %t1359, label %argok354, label %arityerr353
arityerr353:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok354:
  %t1360 = load i64, ptr @"scheme.base:%isqrt"
  call void @rt_check_callable(i64 %t1360)
  %t1361 = and i64 %t1360, -8
  %t1362 = inttoptr i64 %t1361 to ptr
  %t1363 = load i64, ptr %t1362
  %t1364 = inttoptr i64 %t1363 to ptr
  %t1365 = call fastcc i64%t1364(i64 %t1360, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1366 = or i64 %t1365, %t1365
  %t1367 = and i64 %t1366, 7
  %t1368 = icmp eq i64 %t1367, 0
  br i1 %t1368, label %fixfast355, label %fixslow356
fixfast355:
  %t1369 = ashr i64 %t1365, 3
  %t1370 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t1369, i64 %t1365)
  %t1371 = extractvalue {i64, i1} %t1370, 0
  %t1372 = extractvalue {i64, i1} %t1370, 1
  br i1 %t1372, label %fixslow356, label %fixmerge357
fixslow356:
  %t1373 = call i64 @rt_mul(i64 %t1365, i64 %t1365)
  br label %fixmerge357
fixmerge357:
  %t1374 = phi i64 [ %t1371, %fixfast355 ], [ %t1373, %fixslow356 ]
  %t1375 = or i64 %a0, %t1374
  %t1376 = and i64 %t1375, 7
  %t1377 = icmp eq i64 %t1376, 0
  br i1 %t1377, label %fixfast358, label %fixslow359
fixfast358:
  %t1378 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t1374)
  %t1379 = extractvalue {i64, i1} %t1378, 0
  %t1380 = extractvalue {i64, i1} %t1378, 1
  br i1 %t1380, label %fixslow359, label %fixmerge360
fixslow359:
  %t1381 = call i64 @rt_sub(i64 %a0, i64 %t1374)
  br label %fixmerge360
fixmerge360:
  %t1382 = phi i64 [ %t1379, %fixfast358 ], [ %t1381, %fixslow359 ]
  %t1383 = load i64, ptr @"scheme.base:values"
  call void @rt_check_callable(i64 %t1383)
  %t1384 = and i64 %t1383, -8
  %t1385 = inttoptr i64 %t1384 to ptr
  %t1386 = load i64, ptr %t1385
  %t1387 = inttoptr i64 %t1386 to ptr
  %t1388 = musttail call fastcc i64 %t1387(i64 %t1383, i64 2, i64 %t1365, i64 %t1382, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1388
}

define fastcc i64 @"scheme.base:code:floor"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1393 = icmp eq i64 %argc, 1
  br i1 %t1393, label %argok362, label %arityerr361
arityerr361:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok362:
  %t1394 = call i64 @rt_exact_p(i64 %a0)
  %t1395 = icmp ne i64 %t1394, 1
  br i1 %t1395, label %then363, label %else364
then363:
  ret i64 %a0
else364:
  %t1396 = call i64 @rt_flo_floor(i64 %a0)
  ret i64 %t1396
}

define fastcc i64 @"scheme.base:code:ceiling"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1401 = icmp eq i64 %argc, 1
  br i1 %t1401, label %argok366, label %arityerr365
arityerr365:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok366:
  %t1402 = call i64 @rt_exact_p(i64 %a0)
  %t1403 = icmp ne i64 %t1402, 1
  br i1 %t1403, label %then367, label %else368
then367:
  ret i64 %a0
else368:
  %t1404 = call i64 @rt_flo_ceiling(i64 %a0)
  ret i64 %t1404
}

define fastcc i64 @"scheme.base:code:truncate"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1409 = icmp eq i64 %argc, 1
  br i1 %t1409, label %argok370, label %arityerr369
arityerr369:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok370:
  %t1410 = call i64 @rt_exact_p(i64 %a0)
  %t1411 = icmp ne i64 %t1410, 1
  br i1 %t1411, label %then371, label %else372
then371:
  ret i64 %a0
else372:
  %t1412 = call i64 @rt_flo_truncate(i64 %a0)
  ret i64 %t1412
}

define fastcc i64 @"scheme.base:code:round"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1417 = icmp eq i64 %argc, 1
  br i1 %t1417, label %argok374, label %arityerr373
arityerr373:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok374:
  %t1418 = call i64 @rt_exact_p(i64 %a0)
  %t1419 = icmp ne i64 %t1418, 1
  br i1 %t1419, label %then375, label %else376
then375:
  ret i64 %a0
else376:
  %t1420 = call i64 @rt_flo_round(i64 %a0)
  ret i64 %t1420
}

define fastcc i64 @"scheme.base:code:truncate-quotient"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1425 = icmp eq i64 %argc, 2
  br i1 %t1425, label %argok378, label %arityerr377
arityerr377:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok378:
  %t1426 = call i64 @rt_quotient(i64 %a0, i64 %a1)
  ret i64 %t1426
}

define fastcc i64 @"scheme.base:code:truncate-remainder"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1431 = icmp eq i64 %argc, 2
  br i1 %t1431, label %argok380, label %arityerr379
arityerr379:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok380:
  %t1432 = call i64 @rt_remainder(i64 %a0, i64 %a1)
  ret i64 %t1432
}

define fastcc i64 @"scheme.base:code:floor-remainder"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1437 = icmp eq i64 %argc, 2
  br i1 %t1437, label %argok382, label %arityerr381
arityerr381:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok382:
  %t1438 = call i64 @rt_modulo(i64 %a0, i64 %a1)
  ret i64 %t1438
}

define fastcc i64 @"scheme.base:code:floor-quotient"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1443 = icmp eq i64 %argc, 2
  br i1 %t1443, label %argok384, label %arityerr383
arityerr383:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok384:
  %t1444 = call i64 @rt_modulo(i64 %a0, i64 %a1)
  %t1445 = or i64 %a0, %t1444
  %t1446 = and i64 %t1445, 7
  %t1447 = icmp eq i64 %t1446, 0
  br i1 %t1447, label %fixfast385, label %fixslow386
fixfast385:
  %t1448 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t1444)
  %t1449 = extractvalue {i64, i1} %t1448, 0
  %t1450 = extractvalue {i64, i1} %t1448, 1
  br i1 %t1450, label %fixslow386, label %fixmerge387
fixslow386:
  %t1451 = call i64 @rt_sub(i64 %a0, i64 %t1444)
  br label %fixmerge387
fixmerge387:
  %t1452 = phi i64 [ %t1449, %fixfast385 ], [ %t1451, %fixslow386 ]
  %t1453 = call i64 @rt_quotient(i64 %t1452, i64 %a1)
  ret i64 %t1453
}

define fastcc i64 @"scheme.base:code:truncate/"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1458 = icmp eq i64 %argc, 2
  br i1 %t1458, label %argok389, label %arityerr388
arityerr388:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok389:
  %t1459 = call i64 @rt_quotient(i64 %a0, i64 %a1)
  %t1460 = call i64 @rt_remainder(i64 %a0, i64 %a1)
  %t1461 = load i64, ptr @"scheme.base:values"
  call void @rt_check_callable(i64 %t1461)
  %t1462 = and i64 %t1461, -8
  %t1463 = inttoptr i64 %t1462 to ptr
  %t1464 = load i64, ptr %t1463
  %t1465 = inttoptr i64 %t1464 to ptr
  %t1466 = musttail call fastcc i64 %t1465(i64 %t1461, i64 2, i64 %t1459, i64 %t1460, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1466
}

define fastcc i64 @"scheme.base:code:floor/"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1471 = icmp eq i64 %argc, 2
  br i1 %t1471, label %argok391, label %arityerr390
arityerr390:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok391:
  %t1472 = load i64, ptr @"scheme.base:floor-quotient"
  call void @rt_check_callable(i64 %t1472)
  %t1473 = and i64 %t1472, -8
  %t1474 = inttoptr i64 %t1473 to ptr
  %t1475 = load i64, ptr %t1474
  %t1476 = inttoptr i64 %t1475 to ptr
  %t1477 = call fastcc i64%t1476(i64 %t1472, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1478 = call i64 @rt_modulo(i64 %a0, i64 %a1)
  %t1479 = load i64, ptr @"scheme.base:values"
  call void @rt_check_callable(i64 %t1479)
  %t1480 = and i64 %t1479, -8
  %t1481 = inttoptr i64 %t1480 to ptr
  %t1482 = load i64, ptr %t1481
  %t1483 = inttoptr i64 %t1482 to ptr
  %t1484 = musttail call fastcc i64 %t1483(i64 %t1479, i64 2, i64 %t1477, i64 %t1478, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1484
}

define fastcc i64 @"scheme.base:code:numerator"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1489 = icmp eq i64 %argc, 1
  br i1 %t1489, label %argok393, label %arityerr392
arityerr392:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok393:
  %t1490 = call i64 @rt_integer_p(i64 %a0)
  %t1491 = icmp ne i64 %t1490, 1
  br i1 %t1491, label %then394, label %else395
then394:
  ret i64 %a0
else395:
  %t1492 = call i64 @rt_make_string(ptr @.str.lit.1, i64 25)
  %t1493 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t1493)
  %t1494 = and i64 %t1493, -8
  %t1495 = inttoptr i64 %t1494 to ptr
  %t1496 = load i64, ptr %t1495
  %t1497 = inttoptr i64 %t1496 to ptr
  %t1498 = musttail call fastcc i64 %t1497(i64 %t1493, i64 2, i64 %t1492, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1498
}

define fastcc i64 @"scheme.base:code:denominator"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1503 = icmp eq i64 %argc, 1
  br i1 %t1503, label %argok397, label %arityerr396
arityerr396:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok397:
  %t1504 = call i64 @rt_integer_p(i64 %a0)
  %t1505 = icmp ne i64 %t1504, 1
  br i1 %t1505, label %then398, label %else399
then398:
  %t1506 = call i64 @rt_exact_p(i64 %a0)
  %t1507 = icmp ne i64 %t1506, 1
  br i1 %t1507, label %then400, label %else401
then400:
  ret i64 8
else401:
  %t1508 = call i64 @rt_flonum_lit(ptr @.flo.lit.2)
  ret i64 %t1508
else399:
  %t1509 = call i64 @rt_make_string(ptr @.str.lit.3, i64 27)
  %t1510 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t1510)
  %t1511 = and i64 %t1510, -8
  %t1512 = inttoptr i64 %t1511 to ptr
  %t1513 = load i64, ptr %t1512
  %t1514 = inttoptr i64 %t1513 to ptr
  %t1515 = musttail call fastcc i64 %t1514(i64 %t1510, i64 2, i64 %t1509, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1515
}

define fastcc i64 @"scheme.base:code:inexact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1520 = icmp eq i64 %argc, 1
  br i1 %t1520, label %argok403, label %arityerr402
arityerr402:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok403:
  %t1521 = call i64 @rt_exact_to_inexact(i64 %a0)
  ret i64 %t1521
}

define fastcc i64 @"scheme.base:code:exact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1526 = icmp eq i64 %argc, 1
  br i1 %t1526, label %argok405, label %arityerr404
arityerr404:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok405:
  %t1527 = call i64 @rt_inexact_to_exact(i64 %a0)
  ret i64 %t1527
}

define fastcc i64 @"scheme.base:code:void"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1532 = icmp eq i64 %argc, 0
  br i1 %t1532, label %argok407, label %arityerr406
arityerr406:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok407:
  %t1533 = icmp ne i64 1, 1
  br i1 %t1533, label %then408, label %else409
then408:
  ret i64 1
else409:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1538 = icmp sge i64 %argc, 0
  br i1 %t1538, label %argok411, label %arityerr410
arityerr410:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok411:
  %t1539 = call ptr @rt_alloc_words(i64 8)
  %t1540 = getelementptr i64, ptr %t1539, i64 0
  store i64 %a0, ptr %t1540
  %t1541 = getelementptr i64, ptr %t1539, i64 1
  store i64 %a1, ptr %t1541
  %t1542 = getelementptr i64, ptr %t1539, i64 2
  store i64 %a2, ptr %t1542
  %t1543 = getelementptr i64, ptr %t1539, i64 3
  store i64 %a3, ptr %t1543
  %t1544 = getelementptr i64, ptr %t1539, i64 4
  store i64 %a4, ptr %t1544
  %t1545 = getelementptr i64, ptr %t1539, i64 5
  store i64 %a5, ptr %t1545
  %t1546 = getelementptr i64, ptr %t1539, i64 6
  store i64 %a6, ptr %t1546
  %t1547 = getelementptr i64, ptr %t1539, i64 7
  store i64 %a7, ptr %t1547
  %t1548 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t1539, ptr %overflow)
  %t1549 = call i64 @rt_list_to_string(i64 %t1548)
  ret i64 %t1549
}

define fastcc i64 @"scheme.base:code:%str-concat"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1554 = icmp eq i64 %argc, 1
  br i1 %t1554, label %argok413, label %arityerr412
arityerr412:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok413:
  %t1555 = call i64 @rt_null_p(i64 %a0)
  %t1556 = icmp ne i64 %t1555, 1
  br i1 %t1556, label %then414, label %else415
then414:
  %t1557 = call i64 @rt_make_string(ptr @.str.lit.4, i64 0)
  ret i64 %t1557
else415:
  %t1558 = call i64 @rt_car(i64 %a0)
  %t1559 = call i64 @rt_cdr(i64 %a0)
  %t1560 = load i64, ptr @"scheme.base:%str-concat"
  call void @rt_check_callable(i64 %t1560)
  %t1561 = and i64 %t1560, -8
  %t1562 = inttoptr i64 %t1561 to ptr
  %t1563 = load i64, ptr %t1562
  %t1564 = inttoptr i64 %t1563 to ptr
  %t1565 = call fastcc i64%t1564(i64 %t1560, i64 1, i64 %t1559, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1566 = call i64 @rt_string_append(i64 %t1558, i64 %t1565)
  ret i64 %t1566
}

define fastcc i64 @"scheme.base:code:chr-cmp"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1571 = icmp eq i64 %argc, 4
  br i1 %t1571, label %argok417, label %arityerr416
arityerr416:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok417:
  %t1572 = call i64 @rt_char_to_integer(i64 %a1)
  %t1573 = call i64 @rt_char_to_integer(i64 %a2)
  call void @rt_check_callable(i64 %a0)
  %t1574 = and i64 %a0, -8
  %t1575 = inttoptr i64 %t1574 to ptr
  %t1576 = load i64, ptr %t1575
  %t1577 = inttoptr i64 %t1576 to ptr
  %t1578 = call fastcc i64%t1577(i64 %a0, i64 2, i64 %t1572, i64 %t1573, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1579 = icmp ne i64 %t1578, 1
  br i1 %t1579, label %then418, label %else419
then418:
  %t1580 = call i64 @rt_null_p(i64 %a3)
  %t1581 = icmp ne i64 %t1580, 1
  br i1 %t1581, label %then420, label %else421
then420:
  ret i64 257
else421:
  %t1582 = call i64 @rt_car(i64 %a3)
  %t1583 = call i64 @rt_cdr(i64 %a3)
  %t1584 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1584)
  %t1585 = and i64 %t1584, -8
  %t1586 = inttoptr i64 %t1585 to ptr
  %t1587 = load i64, ptr %t1586
  %t1588 = inttoptr i64 %t1587 to ptr
  %t1589 = musttail call fastcc i64 %t1588(i64 %t1584, i64 4, i64 %a0, i64 %a2, i64 %t1582, i64 %t1583, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1589
else419:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_341"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1594 = icmp eq i64 %argc, 2
  br i1 %t1594, label %argok423, label %arityerr422
arityerr422:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok423:
  %t1595 = or i64 %a0, %a1
  %t1596 = and i64 %t1595, 7
  %t1597 = icmp eq i64 %t1596, 0
  br i1 %t1597, label %fixfast424, label %fixslow425
fixfast424:
  %t1598 = icmp eq i64 %a0, %a1
  %t1599 = select i1 %t1598, i64 257, i64 1
  br label %fixmerge426
fixslow425:
  %t1600 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge426
fixmerge426:
  %t1601 = phi i64 [ %t1599, %fixfast424 ], [ %t1600, %fixslow425 ]
  ret i64 %t1601
}

define fastcc i64 @"scheme.base:code:char=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1602 = icmp sge i64 %argc, 2
  br i1 %t1602, label %argok428, label %arityerr427
arityerr427:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok428:
  %t1603 = call ptr @rt_alloc_words(i64 8)
  %t1604 = getelementptr i64, ptr %t1603, i64 0
  store i64 %a0, ptr %t1604
  %t1605 = getelementptr i64, ptr %t1603, i64 1
  store i64 %a1, ptr %t1605
  %t1606 = getelementptr i64, ptr %t1603, i64 2
  store i64 %a2, ptr %t1606
  %t1607 = getelementptr i64, ptr %t1603, i64 3
  store i64 %a3, ptr %t1607
  %t1608 = getelementptr i64, ptr %t1603, i64 4
  store i64 %a4, ptr %t1608
  %t1609 = getelementptr i64, ptr %t1603, i64 5
  store i64 %a5, ptr %t1609
  %t1610 = getelementptr i64, ptr %t1603, i64 6
  store i64 %a6, ptr %t1610
  %t1611 = getelementptr i64, ptr %t1603, i64 7
  store i64 %a7, ptr %t1611
  %t1612 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1603, ptr %overflow)
  %t1613 = call ptr @rt_alloc_words(i64 1)
  %t1614 = ptrtoint ptr %t1613 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_341" to i64), ptr %t1613
  %t1615 = or i64 %t1614, 4
  %t1616 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1616)
  %t1617 = and i64 %t1616, -8
  %t1618 = inttoptr i64 %t1617 to ptr
  %t1619 = load i64, ptr %t1618
  %t1620 = inttoptr i64 %t1619 to ptr
  %t1621 = musttail call fastcc i64 %t1620(i64 %t1616, i64 4, i64 %t1615, i64 %a0, i64 %a1, i64 %t1612, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1621
}

define fastcc i64 @"scheme.base:code_353"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1626 = icmp eq i64 %argc, 2
  br i1 %t1626, label %argok430, label %arityerr429
arityerr429:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok430:
  %t1627 = or i64 %a0, %a1
  %t1628 = and i64 %t1627, 7
  %t1629 = icmp eq i64 %t1628, 0
  br i1 %t1629, label %fixfast431, label %fixslow432
fixfast431:
  %t1630 = icmp slt i64 %a0, %a1
  %t1631 = select i1 %t1630, i64 257, i64 1
  br label %fixmerge433
fixslow432:
  %t1632 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge433
fixmerge433:
  %t1633 = phi i64 [ %t1631, %fixfast431 ], [ %t1632, %fixslow432 ]
  ret i64 %t1633
}

define fastcc i64 @"scheme.base:code:char<?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1634 = icmp sge i64 %argc, 2
  br i1 %t1634, label %argok435, label %arityerr434
arityerr434:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok435:
  %t1635 = call ptr @rt_alloc_words(i64 8)
  %t1636 = getelementptr i64, ptr %t1635, i64 0
  store i64 %a0, ptr %t1636
  %t1637 = getelementptr i64, ptr %t1635, i64 1
  store i64 %a1, ptr %t1637
  %t1638 = getelementptr i64, ptr %t1635, i64 2
  store i64 %a2, ptr %t1638
  %t1639 = getelementptr i64, ptr %t1635, i64 3
  store i64 %a3, ptr %t1639
  %t1640 = getelementptr i64, ptr %t1635, i64 4
  store i64 %a4, ptr %t1640
  %t1641 = getelementptr i64, ptr %t1635, i64 5
  store i64 %a5, ptr %t1641
  %t1642 = getelementptr i64, ptr %t1635, i64 6
  store i64 %a6, ptr %t1642
  %t1643 = getelementptr i64, ptr %t1635, i64 7
  store i64 %a7, ptr %t1643
  %t1644 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1635, ptr %overflow)
  %t1645 = call ptr @rt_alloc_words(i64 1)
  %t1646 = ptrtoint ptr %t1645 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_353" to i64), ptr %t1645
  %t1647 = or i64 %t1646, 4
  %t1648 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1648)
  %t1649 = and i64 %t1648, -8
  %t1650 = inttoptr i64 %t1649 to ptr
  %t1651 = load i64, ptr %t1650
  %t1652 = inttoptr i64 %t1651 to ptr
  %t1653 = musttail call fastcc i64 %t1652(i64 %t1648, i64 4, i64 %t1647, i64 %a0, i64 %a1, i64 %t1644, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1653
}

define fastcc i64 @"scheme.base:code_365"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1658 = icmp eq i64 %argc, 2
  br i1 %t1658, label %argok437, label %arityerr436
arityerr436:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok437:
  %t1659 = or i64 %a1, %a0
  %t1660 = and i64 %t1659, 7
  %t1661 = icmp eq i64 %t1660, 0
  br i1 %t1661, label %fixfast438, label %fixslow439
fixfast438:
  %t1662 = icmp slt i64 %a1, %a0
  %t1663 = select i1 %t1662, i64 257, i64 1
  br label %fixmerge440
fixslow439:
  %t1664 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge440
fixmerge440:
  %t1665 = phi i64 [ %t1663, %fixfast438 ], [ %t1664, %fixslow439 ]
  ret i64 %t1665
}

define fastcc i64 @"scheme.base:code:char>?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1666 = icmp sge i64 %argc, 2
  br i1 %t1666, label %argok442, label %arityerr441
arityerr441:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok442:
  %t1667 = call ptr @rt_alloc_words(i64 8)
  %t1668 = getelementptr i64, ptr %t1667, i64 0
  store i64 %a0, ptr %t1668
  %t1669 = getelementptr i64, ptr %t1667, i64 1
  store i64 %a1, ptr %t1669
  %t1670 = getelementptr i64, ptr %t1667, i64 2
  store i64 %a2, ptr %t1670
  %t1671 = getelementptr i64, ptr %t1667, i64 3
  store i64 %a3, ptr %t1671
  %t1672 = getelementptr i64, ptr %t1667, i64 4
  store i64 %a4, ptr %t1672
  %t1673 = getelementptr i64, ptr %t1667, i64 5
  store i64 %a5, ptr %t1673
  %t1674 = getelementptr i64, ptr %t1667, i64 6
  store i64 %a6, ptr %t1674
  %t1675 = getelementptr i64, ptr %t1667, i64 7
  store i64 %a7, ptr %t1675
  %t1676 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1667, ptr %overflow)
  %t1677 = call ptr @rt_alloc_words(i64 1)
  %t1678 = ptrtoint ptr %t1677 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_365" to i64), ptr %t1677
  %t1679 = or i64 %t1678, 4
  %t1680 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1680)
  %t1681 = and i64 %t1680, -8
  %t1682 = inttoptr i64 %t1681 to ptr
  %t1683 = load i64, ptr %t1682
  %t1684 = inttoptr i64 %t1683 to ptr
  %t1685 = musttail call fastcc i64 %t1684(i64 %t1680, i64 4, i64 %t1679, i64 %a0, i64 %a1, i64 %t1676, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1685
}

define fastcc i64 @"scheme.base:code_377"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1690 = icmp eq i64 %argc, 2
  br i1 %t1690, label %argok444, label %arityerr443
arityerr443:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok444:
  %t1691 = or i64 %a0, %a1
  %t1692 = and i64 %t1691, 7
  %t1693 = icmp eq i64 %t1692, 0
  br i1 %t1693, label %fixfast445, label %fixslow446
fixfast445:
  %t1694 = icmp slt i64 %a0, %a1
  %t1695 = select i1 %t1694, i64 257, i64 1
  br label %fixmerge447
fixslow446:
  %t1696 = call i64 @rt_lt(i64 %a0, i64 %a1)
  br label %fixmerge447
fixmerge447:
  %t1697 = phi i64 [ %t1695, %fixfast445 ], [ %t1696, %fixslow446 ]
  %t1698 = icmp ne i64 %t1697, 1
  br i1 %t1698, label %then448, label %else449
then448:
  ret i64 257
else449:
  %t1699 = or i64 %a0, %a1
  %t1700 = and i64 %t1699, 7
  %t1701 = icmp eq i64 %t1700, 0
  br i1 %t1701, label %fixfast450, label %fixslow451
fixfast450:
  %t1702 = icmp eq i64 %a0, %a1
  %t1703 = select i1 %t1702, i64 257, i64 1
  br label %fixmerge452
fixslow451:
  %t1704 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge452
fixmerge452:
  %t1705 = phi i64 [ %t1703, %fixfast450 ], [ %t1704, %fixslow451 ]
  ret i64 %t1705
}

define fastcc i64 @"scheme.base:code:char<=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1706 = icmp sge i64 %argc, 2
  br i1 %t1706, label %argok454, label %arityerr453
arityerr453:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok454:
  %t1707 = call ptr @rt_alloc_words(i64 8)
  %t1708 = getelementptr i64, ptr %t1707, i64 0
  store i64 %a0, ptr %t1708
  %t1709 = getelementptr i64, ptr %t1707, i64 1
  store i64 %a1, ptr %t1709
  %t1710 = getelementptr i64, ptr %t1707, i64 2
  store i64 %a2, ptr %t1710
  %t1711 = getelementptr i64, ptr %t1707, i64 3
  store i64 %a3, ptr %t1711
  %t1712 = getelementptr i64, ptr %t1707, i64 4
  store i64 %a4, ptr %t1712
  %t1713 = getelementptr i64, ptr %t1707, i64 5
  store i64 %a5, ptr %t1713
  %t1714 = getelementptr i64, ptr %t1707, i64 6
  store i64 %a6, ptr %t1714
  %t1715 = getelementptr i64, ptr %t1707, i64 7
  store i64 %a7, ptr %t1715
  %t1716 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1707, ptr %overflow)
  %t1717 = call ptr @rt_alloc_words(i64 1)
  %t1718 = ptrtoint ptr %t1717 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_377" to i64), ptr %t1717
  %t1719 = or i64 %t1718, 4
  %t1720 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1720)
  %t1721 = and i64 %t1720, -8
  %t1722 = inttoptr i64 %t1721 to ptr
  %t1723 = load i64, ptr %t1722
  %t1724 = inttoptr i64 %t1723 to ptr
  %t1725 = musttail call fastcc i64 %t1724(i64 %t1720, i64 4, i64 %t1719, i64 %a0, i64 %a1, i64 %t1716, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1725
}

define fastcc i64 @"scheme.base:code_389"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1730 = icmp eq i64 %argc, 2
  br i1 %t1730, label %argok456, label %arityerr455
arityerr455:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok456:
  %t1731 = or i64 %a1, %a0
  %t1732 = and i64 %t1731, 7
  %t1733 = icmp eq i64 %t1732, 0
  br i1 %t1733, label %fixfast457, label %fixslow458
fixfast457:
  %t1734 = icmp slt i64 %a1, %a0
  %t1735 = select i1 %t1734, i64 257, i64 1
  br label %fixmerge459
fixslow458:
  %t1736 = call i64 @rt_lt(i64 %a1, i64 %a0)
  br label %fixmerge459
fixmerge459:
  %t1737 = phi i64 [ %t1735, %fixfast457 ], [ %t1736, %fixslow458 ]
  %t1738 = icmp ne i64 %t1737, 1
  br i1 %t1738, label %then460, label %else461
then460:
  ret i64 257
else461:
  %t1739 = or i64 %a0, %a1
  %t1740 = and i64 %t1739, 7
  %t1741 = icmp eq i64 %t1740, 0
  br i1 %t1741, label %fixfast462, label %fixslow463
fixfast462:
  %t1742 = icmp eq i64 %a0, %a1
  %t1743 = select i1 %t1742, i64 257, i64 1
  br label %fixmerge464
fixslow463:
  %t1744 = call i64 @rt_num_eq(i64 %a0, i64 %a1)
  br label %fixmerge464
fixmerge464:
  %t1745 = phi i64 [ %t1743, %fixfast462 ], [ %t1744, %fixslow463 ]
  ret i64 %t1745
}

define fastcc i64 @"scheme.base:code:char>=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1746 = icmp sge i64 %argc, 2
  br i1 %t1746, label %argok466, label %arityerr465
arityerr465:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok466:
  %t1747 = call ptr @rt_alloc_words(i64 8)
  %t1748 = getelementptr i64, ptr %t1747, i64 0
  store i64 %a0, ptr %t1748
  %t1749 = getelementptr i64, ptr %t1747, i64 1
  store i64 %a1, ptr %t1749
  %t1750 = getelementptr i64, ptr %t1747, i64 2
  store i64 %a2, ptr %t1750
  %t1751 = getelementptr i64, ptr %t1747, i64 3
  store i64 %a3, ptr %t1751
  %t1752 = getelementptr i64, ptr %t1747, i64 4
  store i64 %a4, ptr %t1752
  %t1753 = getelementptr i64, ptr %t1747, i64 5
  store i64 %a5, ptr %t1753
  %t1754 = getelementptr i64, ptr %t1747, i64 6
  store i64 %a6, ptr %t1754
  %t1755 = getelementptr i64, ptr %t1747, i64 7
  store i64 %a7, ptr %t1755
  %t1756 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t1747, ptr %overflow)
  %t1757 = call ptr @rt_alloc_words(i64 1)
  %t1758 = ptrtoint ptr %t1757 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_389" to i64), ptr %t1757
  %t1759 = or i64 %t1758, 4
  %t1760 = load i64, ptr @"scheme.base:chr-cmp"
  call void @rt_check_callable(i64 %t1760)
  %t1761 = and i64 %t1760, -8
  %t1762 = inttoptr i64 %t1761 to ptr
  %t1763 = load i64, ptr %t1762
  %t1764 = inttoptr i64 %t1763 to ptr
  %t1765 = musttail call fastcc i64 %t1764(i64 %t1760, i64 4, i64 %t1759, i64 %a0, i64 %a1, i64 %t1756, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1765
}

define fastcc i64 @"scheme.base:code_404"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1770 = icmp eq i64 %argc, 2
  br i1 %t1770, label %argok468, label %arityerr467
arityerr467:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok468:
  %t1771 = and i64 %self, -8
  %t1772 = inttoptr i64 %t1771 to ptr
  %t1773 = getelementptr i64, ptr %t1772, i64 1
  %t1774 = load i64, ptr %t1773
  %t1775 = or i64 %a0, %t1774
  %t1776 = and i64 %t1775, 7
  %t1777 = icmp eq i64 %t1776, 0
  br i1 %t1777, label %fixfast469, label %fixslow470
fixfast469:
  %t1778 = icmp slt i64 %a0, %t1774
  %t1779 = select i1 %t1778, i64 257, i64 1
  br label %fixmerge471
fixslow470:
  %t1780 = call i64 @rt_lt(i64 %a0, i64 %t1774)
  br label %fixmerge471
fixmerge471:
  %t1781 = phi i64 [ %t1779, %fixfast469 ], [ %t1780, %fixslow470 ]
  %t1782 = icmp ne i64 %t1781, 1
  br i1 %t1782, label %then472, label %else473
then472:
  ret i64 %a1
else473:
  %t1783 = or i64 %a0, 8
  %t1784 = and i64 %t1783, 7
  %t1785 = icmp eq i64 %t1784, 0
  br i1 %t1785, label %fixfast474, label %fixslow475
fixfast474:
  %t1786 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t1787 = extractvalue {i64, i1} %t1786, 0
  %t1788 = extractvalue {i64, i1} %t1786, 1
  br i1 %t1788, label %fixslow475, label %fixmerge476
fixslow475:
  %t1789 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge476
fixmerge476:
  %t1790 = phi i64 [ %t1787, %fixfast474 ], [ %t1789, %fixslow475 ]
  %t1791 = and i64 %self, -8
  %t1792 = inttoptr i64 %t1791 to ptr
  %t1793 = getelementptr i64, ptr %t1792, i64 3
  %t1794 = load i64, ptr %t1793
  %t1795 = call i64 @rt_string_ref(i64 %t1794, i64 %a0)
  %t1796 = call i64 @rt_cons(i64 %t1795, i64 %a1)
  %t1797 = musttail call fastcc i64 @"scheme.base:code_404"(i64 %self, i64 2, i64 %t1790, i64 %t1796, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1797
}

define fastcc i64 @"scheme.base:code:string->list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1798 = icmp sge i64 %argc, 1
  br i1 %t1798, label %argok478, label %arityerr477
arityerr477:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok478:
  %t1799 = call ptr @rt_alloc_words(i64 8)
  %t1800 = getelementptr i64, ptr %t1799, i64 0
  store i64 %a0, ptr %t1800
  %t1801 = getelementptr i64, ptr %t1799, i64 1
  store i64 %a1, ptr %t1801
  %t1802 = getelementptr i64, ptr %t1799, i64 2
  store i64 %a2, ptr %t1802
  %t1803 = getelementptr i64, ptr %t1799, i64 3
  store i64 %a3, ptr %t1803
  %t1804 = getelementptr i64, ptr %t1799, i64 4
  store i64 %a4, ptr %t1804
  %t1805 = getelementptr i64, ptr %t1799, i64 5
  store i64 %a5, ptr %t1805
  %t1806 = getelementptr i64, ptr %t1799, i64 6
  store i64 %a6, ptr %t1806
  %t1807 = getelementptr i64, ptr %t1799, i64 7
  store i64 %a7, ptr %t1807
  %t1808 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t1799, ptr %overflow)
  %t1809 = call i64 @rt_string_length(i64 %a0)
  %t1810 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t1810)
  %t1811 = and i64 %t1810, -8
  %t1812 = inttoptr i64 %t1811 to ptr
  %t1813 = load i64, ptr %t1812
  %t1814 = inttoptr i64 %t1813 to ptr
  %t1815 = call fastcc i64%t1814(i64 %t1810, i64 1, i64 %t1808, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1816 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t1816)
  %t1817 = and i64 %t1816, -8
  %t1818 = inttoptr i64 %t1817 to ptr
  %t1819 = load i64, ptr %t1818
  %t1820 = inttoptr i64 %t1819 to ptr
  %t1821 = call fastcc i64%t1820(i64 %t1816, i64 2, i64 %t1808, i64 %t1809, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1822 = call i64 @rt_intern(ptr @.str.sym.5)
  %t1823 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t1823)
  %t1824 = and i64 %t1823, -8
  %t1825 = inttoptr i64 %t1824 to ptr
  %t1826 = load i64, ptr %t1825
  %t1827 = inttoptr i64 %t1826 to ptr
  %t1828 = call fastcc i64%t1827(i64 %t1823, i64 4, i64 %t1822, i64 %t1815, i64 %t1821, i64 %t1809, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1829 = call ptr @rt_alloc_words(i64 4)
  %t1830 = ptrtoint ptr %t1829 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_404" to i64), ptr %t1829
  %t1831 = or i64 %t1830, 4
  %t1832 = getelementptr i64, ptr %t1829, i64 1
  store i64 %t1815, ptr %t1832
  %t1833 = getelementptr i64, ptr %t1829, i64 2
  store i64 %t1831, ptr %t1833
  %t1834 = getelementptr i64, ptr %t1829, i64 3
  store i64 %a0, ptr %t1834
  %t1835 = or i64 %t1821, 8
  %t1836 = and i64 %t1835, 7
  %t1837 = icmp eq i64 %t1836, 0
  br i1 %t1837, label %fixfast479, label %fixslow480
fixfast479:
  %t1838 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t1821, i64 8)
  %t1839 = extractvalue {i64, i1} %t1838, 0
  %t1840 = extractvalue {i64, i1} %t1838, 1
  br i1 %t1840, label %fixslow480, label %fixmerge481
fixslow480:
  %t1841 = call i64 @rt_sub(i64 %t1821, i64 8)
  br label %fixmerge481
fixmerge481:
  %t1842 = phi i64 [ %t1839, %fixfast479 ], [ %t1841, %fixslow480 ]
  %t1843 = musttail call fastcc i64 @"scheme.base:code_404"(i64 %t1831, i64 2, i64 %t1842, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1843
}

define fastcc i64 @"scheme.base:code:ns-digits"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1848 = icmp eq i64 %argc, 2
  br i1 %t1848, label %argok483, label %arityerr482
arityerr482:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok483:
  %t1849 = load i64, ptr @"scheme.base:ns-digits-radix"
  call void @rt_check_callable(i64 %t1849)
  %t1850 = and i64 %t1849, -8
  %t1851 = inttoptr i64 %t1850 to ptr
  %t1852 = load i64, ptr %t1851
  %t1853 = inttoptr i64 %t1852 to ptr
  %t1854 = musttail call fastcc i64 %t1853(i64 %t1849, i64 3, i64 %a0, i64 80, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1854
}

define fastcc i64 @"scheme.base:code:%ns-digit-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1859 = icmp eq i64 %argc, 1
  br i1 %t1859, label %argok485, label %arityerr484
arityerr484:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok485:
  %t1860 = or i64 %a0, 80
  %t1861 = and i64 %t1860, 7
  %t1862 = icmp eq i64 %t1861, 0
  br i1 %t1862, label %fixfast486, label %fixslow487
fixfast486:
  %t1863 = icmp slt i64 %a0, 80
  %t1864 = select i1 %t1863, i64 257, i64 1
  br label %fixmerge488
fixslow487:
  %t1865 = call i64 @rt_lt(i64 %a0, i64 80)
  br label %fixmerge488
fixmerge488:
  %t1866 = phi i64 [ %t1864, %fixfast486 ], [ %t1865, %fixslow487 ]
  %t1867 = icmp ne i64 %t1866, 1
  br i1 %t1867, label %then489, label %else490
then489:
  %t1868 = or i64 384, %a0
  %t1869 = and i64 %t1868, 7
  %t1870 = icmp eq i64 %t1869, 0
  br i1 %t1870, label %fixfast491, label %fixslow492
fixfast491:
  %t1871 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 384, i64 %a0)
  %t1872 = extractvalue {i64, i1} %t1871, 0
  %t1873 = extractvalue {i64, i1} %t1871, 1
  br i1 %t1873, label %fixslow492, label %fixmerge493
fixslow492:
  %t1874 = call i64 @rt_add(i64 384, i64 %a0)
  br label %fixmerge493
fixmerge493:
  %t1875 = phi i64 [ %t1872, %fixfast491 ], [ %t1874, %fixslow492 ]
  %t1876 = call i64 @rt_integer_to_char(i64 %t1875)
  ret i64 %t1876
else490:
  %t1877 = or i64 696, %a0
  %t1878 = and i64 %t1877, 7
  %t1879 = icmp eq i64 %t1878, 0
  br i1 %t1879, label %fixfast494, label %fixslow495
fixfast494:
  %t1880 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 696, i64 %a0)
  %t1881 = extractvalue {i64, i1} %t1880, 0
  %t1882 = extractvalue {i64, i1} %t1880, 1
  br i1 %t1882, label %fixslow495, label %fixmerge496
fixslow495:
  %t1883 = call i64 @rt_add(i64 696, i64 %a0)
  br label %fixmerge496
fixmerge496:
  %t1884 = phi i64 [ %t1881, %fixfast494 ], [ %t1883, %fixslow495 ]
  %t1885 = call i64 @rt_integer_to_char(i64 %t1884)
  ret i64 %t1885
}

define fastcc i64 @"scheme.base:code:ns-digits-radix"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1890 = icmp eq i64 %argc, 3
  br i1 %t1890, label %argok498, label %arityerr497
arityerr497:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok498:
  %t1891 = call i64 @rt_remainder(i64 %a0, i64 %a1)
  %t1892 = or i64 0, %t1891
  %t1893 = and i64 %t1892, 7
  %t1894 = icmp eq i64 %t1893, 0
  br i1 %t1894, label %fixfast499, label %fixslow500
fixfast499:
  %t1895 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %t1891)
  %t1896 = extractvalue {i64, i1} %t1895, 0
  %t1897 = extractvalue {i64, i1} %t1895, 1
  br i1 %t1897, label %fixslow500, label %fixmerge501
fixslow500:
  %t1898 = call i64 @rt_sub(i64 0, i64 %t1891)
  br label %fixmerge501
fixmerge501:
  %t1899 = phi i64 [ %t1896, %fixfast499 ], [ %t1898, %fixslow500 ]
  %t1900 = load i64, ptr @"scheme.base:%ns-digit-char"
  call void @rt_check_callable(i64 %t1900)
  %t1901 = and i64 %t1900, -8
  %t1902 = inttoptr i64 %t1901 to ptr
  %t1903 = load i64, ptr %t1902
  %t1904 = inttoptr i64 %t1903 to ptr
  %t1905 = call fastcc i64%t1904(i64 %t1900, i64 1, i64 %t1899, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1906 = call i64 @rt_quotient(i64 %a0, i64 %a1)
  %t1907 = or i64 %t1906, 0
  %t1908 = and i64 %t1907, 7
  %t1909 = icmp eq i64 %t1908, 0
  br i1 %t1909, label %fixfast502, label %fixslow503
fixfast502:
  %t1910 = icmp eq i64 %t1906, 0
  %t1911 = select i1 %t1910, i64 257, i64 1
  br label %fixmerge504
fixslow503:
  %t1912 = call i64 @rt_num_eq(i64 %t1906, i64 0)
  br label %fixmerge504
fixmerge504:
  %t1913 = phi i64 [ %t1911, %fixfast502 ], [ %t1912, %fixslow503 ]
  %t1914 = icmp ne i64 %t1913, 1
  br i1 %t1914, label %then505, label %else506
then505:
  %t1915 = call i64 @rt_cons(i64 %t1905, i64 %a2)
  ret i64 %t1915
else506:
  %t1916 = call i64 @rt_cons(i64 %t1905, i64 %a2)
  %t1917 = load i64, ptr @"scheme.base:ns-digits-radix"
  call void @rt_check_callable(i64 %t1917)
  %t1918 = and i64 %t1917, -8
  %t1919 = inttoptr i64 %t1918 to ptr
  %t1920 = load i64, ptr %t1919
  %t1921 = inttoptr i64 %t1920 to ptr
  %t1922 = musttail call fastcc i64 %t1921(i64 %t1917, i64 3, i64 %t1906, i64 %a1, i64 %t1916, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t1922
}

define fastcc i64 @"scheme.base:code:%radix-ok?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1927 = icmp eq i64 %argc, 1
  br i1 %t1927, label %argok508, label %arityerr507
arityerr507:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok508:
  %t1928 = or i64 %a0, 80
  %t1929 = and i64 %t1928, 7
  %t1930 = icmp eq i64 %t1929, 0
  br i1 %t1930, label %fixfast509, label %fixslow510
fixfast509:
  %t1931 = icmp eq i64 %a0, 80
  %t1932 = select i1 %t1931, i64 257, i64 1
  br label %fixmerge511
fixslow510:
  %t1933 = call i64 @rt_num_eq(i64 %a0, i64 80)
  br label %fixmerge511
fixmerge511:
  %t1934 = phi i64 [ %t1932, %fixfast509 ], [ %t1933, %fixslow510 ]
  %t1935 = icmp ne i64 %t1934, 1
  br i1 %t1935, label %then512, label %else513
then512:
  ret i64 257
else513:
  %t1936 = or i64 %a0, 128
  %t1937 = and i64 %t1936, 7
  %t1938 = icmp eq i64 %t1937, 0
  br i1 %t1938, label %fixfast514, label %fixslow515
fixfast514:
  %t1939 = icmp eq i64 %a0, 128
  %t1940 = select i1 %t1939, i64 257, i64 1
  br label %fixmerge516
fixslow515:
  %t1941 = call i64 @rt_num_eq(i64 %a0, i64 128)
  br label %fixmerge516
fixmerge516:
  %t1942 = phi i64 [ %t1940, %fixfast514 ], [ %t1941, %fixslow515 ]
  %t1943 = icmp ne i64 %t1942, 1
  br i1 %t1943, label %then517, label %else518
then517:
  ret i64 257
else518:
  %t1944 = or i64 %a0, 64
  %t1945 = and i64 %t1944, 7
  %t1946 = icmp eq i64 %t1945, 0
  br i1 %t1946, label %fixfast519, label %fixslow520
fixfast519:
  %t1947 = icmp eq i64 %a0, 64
  %t1948 = select i1 %t1947, i64 257, i64 1
  br label %fixmerge521
fixslow520:
  %t1949 = call i64 @rt_num_eq(i64 %a0, i64 64)
  br label %fixmerge521
fixmerge521:
  %t1950 = phi i64 [ %t1948, %fixfast519 ], [ %t1949, %fixslow520 ]
  %t1951 = icmp ne i64 %t1950, 1
  br i1 %t1951, label %then522, label %else523
then522:
  ret i64 257
else523:
  %t1952 = or i64 %a0, 16
  %t1953 = and i64 %t1952, 7
  %t1954 = icmp eq i64 %t1953, 0
  br i1 %t1954, label %fixfast524, label %fixslow525
fixfast524:
  %t1955 = icmp eq i64 %a0, 16
  %t1956 = select i1 %t1955, i64 257, i64 1
  br label %fixmerge526
fixslow525:
  %t1957 = call i64 @rt_num_eq(i64 %a0, i64 16)
  br label %fixmerge526
fixmerge526:
  %t1958 = phi i64 [ %t1956, %fixfast524 ], [ %t1957, %fixslow525 ]
  ret i64 %t1958
}

define fastcc i64 @"scheme.base:code:number->string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t1963 = icmp sge i64 %argc, 1
  br i1 %t1963, label %argok528, label %arityerr527
arityerr527:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok528:
  %t1964 = call ptr @rt_alloc_words(i64 8)
  %t1965 = getelementptr i64, ptr %t1964, i64 0
  store i64 %a0, ptr %t1965
  %t1966 = getelementptr i64, ptr %t1964, i64 1
  store i64 %a1, ptr %t1966
  %t1967 = getelementptr i64, ptr %t1964, i64 2
  store i64 %a2, ptr %t1967
  %t1968 = getelementptr i64, ptr %t1964, i64 3
  store i64 %a3, ptr %t1968
  %t1969 = getelementptr i64, ptr %t1964, i64 4
  store i64 %a4, ptr %t1969
  %t1970 = getelementptr i64, ptr %t1964, i64 5
  store i64 %a5, ptr %t1970
  %t1971 = getelementptr i64, ptr %t1964, i64 6
  store i64 %a6, ptr %t1971
  %t1972 = getelementptr i64, ptr %t1964, i64 7
  store i64 %a7, ptr %t1972
  %t1973 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t1964, ptr %overflow)
  %t1974 = call i64 @rt_null_p(i64 %t1973)
  %t1975 = icmp ne i64 %t1974, 1
  br i1 %t1975, label %then529, label %else530
then529:
  br label %merge531
else530:
  %t1976 = call i64 @rt_car(i64 %t1973)
  br label %merge531
merge531:
  %t1977 = phi i64 [ 80, %then529 ], [ %t1976, %else530 ]
  %t1978 = load i64, ptr @"scheme.base:%radix-ok?"
  call void @rt_check_callable(i64 %t1978)
  %t1979 = and i64 %t1978, -8
  %t1980 = inttoptr i64 %t1979 to ptr
  %t1981 = load i64, ptr %t1980
  %t1982 = inttoptr i64 %t1981 to ptr
  %t1983 = call fastcc i64%t1982(i64 %t1978, i64 1, i64 %t1977, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t1984 = icmp ne i64 %t1983, 1
  br i1 %t1984, label %then532, label %else533
then532:
  %t1985 = call i64 @rt_exact_p(i64 %a0)
  %t1986 = icmp ne i64 %t1985, 1
  br i1 %t1986, label %then534, label %else535
then534:
  %t1987 = or i64 %a0, 0
  %t1988 = and i64 %t1987, 7
  %t1989 = icmp eq i64 %t1988, 0
  br i1 %t1989, label %fixfast536, label %fixslow537
fixfast536:
  %t1990 = icmp eq i64 %a0, 0
  %t1991 = select i1 %t1990, i64 257, i64 1
  br label %fixmerge538
fixslow537:
  %t1992 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge538
fixmerge538:
  %t1993 = phi i64 [ %t1991, %fixfast536 ], [ %t1992, %fixslow537 ]
  %t1994 = icmp ne i64 %t1993, 1
  br i1 %t1994, label %then539, label %else540
then539:
  %t1995 = call i64 @rt_make_string(ptr @.str.lit.6, i64 1)
  ret i64 %t1995
else540:
  %t1996 = or i64 %a0, 0
  %t1997 = and i64 %t1996, 7
  %t1998 = icmp eq i64 %t1997, 0
  br i1 %t1998, label %fixfast541, label %fixslow542
fixfast541:
  %t1999 = icmp slt i64 %a0, 0
  %t2000 = select i1 %t1999, i64 257, i64 1
  br label %fixmerge543
fixslow542:
  %t2001 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge543
fixmerge543:
  %t2002 = phi i64 [ %t2000, %fixfast541 ], [ %t2001, %fixslow542 ]
  %t2003 = icmp ne i64 %t2002, 1
  br i1 %t2003, label %then544, label %else545
then544:
  %t2004 = load i64, ptr @"scheme.base:ns-digits-radix"
  call void @rt_check_callable(i64 %t2004)
  %t2005 = and i64 %t2004, -8
  %t2006 = inttoptr i64 %t2005 to ptr
  %t2007 = load i64, ptr %t2006
  %t2008 = inttoptr i64 %t2007 to ptr
  %t2009 = call fastcc i64%t2008(i64 %t2004, i64 3, i64 %a0, i64 %t1977, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2010 = call i64 @rt_cons(i64 11529, i64 %t2009)
  %t2011 = call i64 @rt_list_to_string(i64 %t2010)
  ret i64 %t2011
else545:
  %t2012 = or i64 0, %a0
  %t2013 = and i64 %t2012, 7
  %t2014 = icmp eq i64 %t2013, 0
  br i1 %t2014, label %fixfast546, label %fixslow547
fixfast546:
  %t2015 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 0, i64 %a0)
  %t2016 = extractvalue {i64, i1} %t2015, 0
  %t2017 = extractvalue {i64, i1} %t2015, 1
  br i1 %t2017, label %fixslow547, label %fixmerge548
fixslow547:
  %t2018 = call i64 @rt_sub(i64 0, i64 %a0)
  br label %fixmerge548
fixmerge548:
  %t2019 = phi i64 [ %t2016, %fixfast546 ], [ %t2018, %fixslow547 ]
  %t2020 = load i64, ptr @"scheme.base:ns-digits-radix"
  call void @rt_check_callable(i64 %t2020)
  %t2021 = and i64 %t2020, -8
  %t2022 = inttoptr i64 %t2021 to ptr
  %t2023 = load i64, ptr %t2022
  %t2024 = inttoptr i64 %t2023 to ptr
  %t2025 = call fastcc i64%t2024(i64 %t2020, i64 3, i64 %t2019, i64 %t1977, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2026 = call i64 @rt_list_to_string(i64 %t2025)
  ret i64 %t2026
else535:
  %t2027 = or i64 %t1977, 80
  %t2028 = and i64 %t2027, 7
  %t2029 = icmp eq i64 %t2028, 0
  br i1 %t2029, label %fixfast549, label %fixslow550
fixfast549:
  %t2030 = icmp eq i64 %t1977, 80
  %t2031 = select i1 %t2030, i64 257, i64 1
  br label %fixmerge551
fixslow550:
  %t2032 = call i64 @rt_num_eq(i64 %t1977, i64 80)
  br label %fixmerge551
fixmerge551:
  %t2033 = phi i64 [ %t2031, %fixfast549 ], [ %t2032, %fixslow550 ]
  %t2034 = icmp ne i64 %t2033, 1
  br i1 %t2034, label %then552, label %else553
then552:
  %t2035 = call i64 @rt_flonum_to_string(i64 %a0)
  ret i64 %t2035
else553:
  %t2036 = call i64 @rt_make_string(ptr @.str.lit.7, i64 54)
  %t2037 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t2037)
  %t2038 = and i64 %t2037, -8
  %t2039 = inttoptr i64 %t2038 to ptr
  %t2040 = load i64, ptr %t2039
  %t2041 = inttoptr i64 %t2040 to ptr
  %t2042 = musttail call fastcc i64 %t2041(i64 %t2037, i64 2, i64 %t2036, i64 %t1977, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2042
else533:
  %t2043 = call i64 @rt_make_string(ptr @.str.lit.8, i64 33)
  %t2044 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t2044)
  %t2045 = and i64 %t2044, -8
  %t2046 = inttoptr i64 %t2045 to ptr
  %t2047 = load i64, ptr %t2046
  %t2048 = inttoptr i64 %t2047 to ptr
  %t2049 = musttail call fastcc i64 %t2048(i64 %t2044, i64 2, i64 %t2043, i64 %t1977, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2049
}

define fastcc i64 @"scheme.base:code:string->number"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2054 = icmp sge i64 %argc, 1
  br i1 %t2054, label %argok555, label %arityerr554
arityerr554:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok555:
  %t2055 = call ptr @rt_alloc_words(i64 8)
  %t2056 = getelementptr i64, ptr %t2055, i64 0
  store i64 %a0, ptr %t2056
  %t2057 = getelementptr i64, ptr %t2055, i64 1
  store i64 %a1, ptr %t2057
  %t2058 = getelementptr i64, ptr %t2055, i64 2
  store i64 %a2, ptr %t2058
  %t2059 = getelementptr i64, ptr %t2055, i64 3
  store i64 %a3, ptr %t2059
  %t2060 = getelementptr i64, ptr %t2055, i64 4
  store i64 %a4, ptr %t2060
  %t2061 = getelementptr i64, ptr %t2055, i64 5
  store i64 %a5, ptr %t2061
  %t2062 = getelementptr i64, ptr %t2055, i64 6
  store i64 %a6, ptr %t2062
  %t2063 = getelementptr i64, ptr %t2055, i64 7
  store i64 %a7, ptr %t2063
  %t2064 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2055, ptr %overflow)
  %t2065 = call i64 @rt_null_p(i64 %t2064)
  %t2066 = icmp ne i64 %t2065, 1
  br i1 %t2066, label %then556, label %else557
then556:
  br label %merge558
else557:
  %t2067 = call i64 @rt_car(i64 %t2064)
  br label %merge558
merge558:
  %t2068 = phi i64 [ 80, %then556 ], [ %t2067, %else557 ]
  %t2069 = load i64, ptr @"scheme.base:%radix-ok?"
  call void @rt_check_callable(i64 %t2069)
  %t2070 = and i64 %t2069, -8
  %t2071 = inttoptr i64 %t2070 to ptr
  %t2072 = load i64, ptr %t2071
  %t2073 = inttoptr i64 %t2072 to ptr
  %t2074 = call fastcc i64%t2073(i64 %t2069, i64 1, i64 %t2068, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2075 = icmp ne i64 %t2074, 1
  br i1 %t2075, label %then559, label %else560
then559:
  %t2076 = load i64, ptr @"emit.internal:rd-number"
  %t2077 = call fastcc i64 @"emit.internal:code:rd-number"(i64 %t2076, i64 2, i64 %a0, i64 %t2068, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2078 = call i64 @rt_symbol_p(i64 %t2077)
  %t2079 = icmp ne i64 %t2078, 1
  br i1 %t2079, label %then561, label %else562
then561:
  ret i64 1
else562:
  ret i64 %t2077
else560:
  %t2080 = call i64 @rt_make_string(ptr @.str.lit.9, i64 33)
  %t2081 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t2081)
  %t2082 = and i64 %t2081, -8
  %t2083 = inttoptr i64 %t2082 to ptr
  %t2084 = load i64, ptr %t2083
  %t2085 = inttoptr i64 %t2084 to ptr
  %t2086 = musttail call fastcc i64 %t2085(i64 %t2081, i64 2, i64 %t2080, i64 %t2068, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2086
}

define fastcc i64 @"scheme.base:code:%raise-kinded"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2091 = icmp eq i64 %argc, 3
  br i1 %t2091, label %argok564, label %arityerr563
arityerr563:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok564:
  %t2092 = call i64 @rt_string_p(i64 %a1)
  %t2093 = icmp ne i64 %t2092, 1
  br i1 %t2093, label %then565, label %else566
then565:
  %t2094 = call i64 @rt_make_error_object_kind(i64 %a1, i64 %a2, i64 %a0)
  %t2095 = load i64, ptr @"scheme.base:raise"
  call void @rt_check_callable(i64 %t2095)
  %t2096 = and i64 %t2095, -8
  %t2097 = inttoptr i64 %t2096 to ptr
  %t2098 = load i64, ptr %t2097
  %t2099 = inttoptr i64 %t2098 to ptr
  %t2100 = musttail call fastcc i64 %t2099(i64 %t2095, i64 1, i64 %t2094, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2100
else566:
  %t2101 = call i64 @rt_symbol_to_string(i64 %a1)
  %t2102 = call i64 @rt_make_string(ptr @.str.lit.10, i64 2)
  %t2103 = call i64 @rt_car(i64 %a2)
  %t2104 = call i64 @rt_string_append(i64 %t2102, i64 %t2103)
  %t2105 = call i64 @rt_string_append(i64 %t2101, i64 %t2104)
  %t2106 = call i64 @rt_cdr(i64 %a2)
  %t2107 = call i64 @rt_make_error_object_kind(i64 %t2105, i64 %t2106, i64 %a0)
  %t2108 = load i64, ptr @"scheme.base:raise"
  call void @rt_check_callable(i64 %t2108)
  %t2109 = and i64 %t2108, -8
  %t2110 = inttoptr i64 %t2109 to ptr
  %t2111 = load i64, ptr %t2110
  %t2112 = inttoptr i64 %t2111 to ptr
  %t2113 = musttail call fastcc i64 %t2112(i64 %t2108, i64 1, i64 %t2107, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2113
}

define fastcc i64 @"scheme.base:code:error"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2118 = icmp sge i64 %argc, 1
  br i1 %t2118, label %argok568, label %arityerr567
arityerr567:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok568:
  %t2119 = call ptr @rt_alloc_words(i64 8)
  %t2120 = getelementptr i64, ptr %t2119, i64 0
  store i64 %a0, ptr %t2120
  %t2121 = getelementptr i64, ptr %t2119, i64 1
  store i64 %a1, ptr %t2121
  %t2122 = getelementptr i64, ptr %t2119, i64 2
  store i64 %a2, ptr %t2122
  %t2123 = getelementptr i64, ptr %t2119, i64 3
  store i64 %a3, ptr %t2123
  %t2124 = getelementptr i64, ptr %t2119, i64 4
  store i64 %a4, ptr %t2124
  %t2125 = getelementptr i64, ptr %t2119, i64 5
  store i64 %a5, ptr %t2125
  %t2126 = getelementptr i64, ptr %t2119, i64 6
  store i64 %a6, ptr %t2126
  %t2127 = getelementptr i64, ptr %t2119, i64 7
  store i64 %a7, ptr %t2127
  %t2128 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2119, ptr %overflow)
  %t2129 = call i64 @rt_intern(ptr @.str.sym.11)
  %t2130 = load i64, ptr @"scheme.base:%raise-kinded"
  call void @rt_check_callable(i64 %t2130)
  %t2131 = and i64 %t2130, -8
  %t2132 = inttoptr i64 %t2131 to ptr
  %t2133 = load i64, ptr %t2132
  %t2134 = inttoptr i64 %t2133 to ptr
  %t2135 = musttail call fastcc i64 %t2134(i64 %t2130, i64 3, i64 %t2129, i64 %a0, i64 %t2128, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2135
}

define fastcc i64 @"scheme.base:code:%read-error"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2140 = icmp sge i64 %argc, 1
  br i1 %t2140, label %argok570, label %arityerr569
arityerr569:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok570:
  %t2141 = call ptr @rt_alloc_words(i64 8)
  %t2142 = getelementptr i64, ptr %t2141, i64 0
  store i64 %a0, ptr %t2142
  %t2143 = getelementptr i64, ptr %t2141, i64 1
  store i64 %a1, ptr %t2143
  %t2144 = getelementptr i64, ptr %t2141, i64 2
  store i64 %a2, ptr %t2144
  %t2145 = getelementptr i64, ptr %t2141, i64 3
  store i64 %a3, ptr %t2145
  %t2146 = getelementptr i64, ptr %t2141, i64 4
  store i64 %a4, ptr %t2146
  %t2147 = getelementptr i64, ptr %t2141, i64 5
  store i64 %a5, ptr %t2147
  %t2148 = getelementptr i64, ptr %t2141, i64 6
  store i64 %a6, ptr %t2148
  %t2149 = getelementptr i64, ptr %t2141, i64 7
  store i64 %a7, ptr %t2149
  %t2150 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2141, ptr %overflow)
  %t2151 = call i64 @rt_intern(ptr @.str.sym.12)
  %t2152 = load i64, ptr @"scheme.base:%raise-kinded"
  call void @rt_check_callable(i64 %t2152)
  %t2153 = and i64 %t2152, -8
  %t2154 = inttoptr i64 %t2153 to ptr
  %t2155 = load i64, ptr %t2154
  %t2156 = inttoptr i64 %t2155 to ptr
  %t2157 = musttail call fastcc i64 %t2156(i64 %t2152, i64 3, i64 %t2151, i64 %a0, i64 %t2150, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2157
}

define fastcc i64 @"scheme.base:code_474"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2163 = icmp eq i64 %argc, 0
  br i1 %t2163, label %argok572, label %arityerr571
arityerr571:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok572:
  %t2164 = call i64 @rt_trap_object()
  %t2165 = load i64, ptr @"scheme.base:raise"
  call void @rt_check_callable(i64 %t2165)
  %t2166 = and i64 %t2165, -8
  %t2167 = inttoptr i64 %t2166 to ptr
  %t2168 = load i64, ptr %t2167
  %t2169 = inttoptr i64 %t2168 to ptr
  %t2170 = musttail call fastcc i64 %t2169(i64 %t2165, i64 1, i64 %t2164, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2170
}

define fastcc i64 @"scheme.base:code:%unwind-to"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2176 = icmp eq i64 %argc, 1
  br i1 %t2176, label %argok574, label %arityerr573
arityerr573:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok574:
  %t2177 = load i64, ptr @"scheme.base:*winds*"
  %t2178 = call i64 @rt_eq_p(i64 %t2177, i64 %a0)
  %t2179 = icmp ne i64 %t2178, 1
  br i1 %t2179, label %then575, label %else576
then575:
  ret i64 257
else576:
  %t2180 = load i64, ptr @"scheme.base:*winds*"
  %t2181 = call i64 @rt_null_p(i64 %t2180)
  %t2182 = icmp ne i64 %t2181, 1
  br i1 %t2182, label %then577, label %else578
then577:
  ret i64 257
else578:
  %t2183 = load i64, ptr @"scheme.base:*winds*"
  %t2184 = call i64 @rt_car(i64 %t2183)
  %t2185 = load i64, ptr @"scheme.base:*winds*"
  %t2186 = call i64 @rt_cdr(i64 %t2185)
  %t2187 = call i64 @rt_root(i64 %t2186)
  store i64 %t2187, ptr @"scheme.base:*winds*"
  %t2188 = call i64 @rt_cdr(i64 %t2184)
  call void @rt_check_callable(i64 %t2188)
  %t2189 = and i64 %t2188, -8
  %t2190 = inttoptr i64 %t2189 to ptr
  %t2191 = load i64, ptr %t2190
  %t2192 = inttoptr i64 %t2191 to ptr
  %t2193 = call fastcc i64%t2192(i64 %t2188, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2194 = load i64, ptr @"scheme.base:%unwind-to"
  call void @rt_check_callable(i64 %t2194)
  %t2195 = and i64 %t2194, -8
  %t2196 = inttoptr i64 %t2195 to ptr
  %t2197 = load i64, ptr %t2196
  %t2198 = inttoptr i64 %t2197 to ptr
  %t2199 = musttail call fastcc i64 %t2198(i64 %t2194, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2199
}

define fastcc i64 @"scheme.base:code:dynamic-wind"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2204 = icmp eq i64 %argc, 3
  br i1 %t2204, label %argok580, label %arityerr579
arityerr579:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok580:
  call void @rt_check_callable(i64 %a0)
  %t2205 = and i64 %a0, -8
  %t2206 = inttoptr i64 %t2205 to ptr
  %t2207 = load i64, ptr %t2206
  %t2208 = inttoptr i64 %t2207 to ptr
  %t2209 = call fastcc i64%t2208(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2210 = call i64 @rt_cons(i64 %a0, i64 %a2)
  %t2211 = load i64, ptr @"scheme.base:*winds*"
  %t2212 = call i64 @rt_cons(i64 %t2210, i64 %t2211)
  %t2213 = call i64 @rt_root(i64 %t2212)
  store i64 %t2213, ptr @"scheme.base:*winds*"
  call void @rt_check_callable(i64 %a1)
  %t2214 = and i64 %a1, -8
  %t2215 = inttoptr i64 %t2214 to ptr
  %t2216 = load i64, ptr %t2215
  %t2217 = inttoptr i64 %t2216 to ptr
  %t2218 = call fastcc i64%t2217(i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2219 = load i64, ptr @"scheme.base:*winds*"
  %t2220 = call i64 @rt_cdr(i64 %t2219)
  %t2221 = call i64 @rt_root(i64 %t2220)
  store i64 %t2221, ptr @"scheme.base:*winds*"
  call void @rt_check_callable(i64 %a2)
  %t2222 = and i64 %a2, -8
  %t2223 = inttoptr i64 %t2222 to ptr
  %t2224 = load i64, ptr %t2223
  %t2225 = inttoptr i64 %t2224 to ptr
  %t2226 = call fastcc i64%t2225(i64 %a2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2218
}

define fastcc i64 @"scheme.base:code_495"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2231 = icmp eq i64 %argc, 1
  br i1 %t2231, label %argok582, label %arityerr581
arityerr581:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok582:
  %t2232 = and i64 %self, -8
  %t2233 = inttoptr i64 %t2232 to ptr
  %t2234 = getelementptr i64, ptr %t2233, i64 1
  %t2235 = load i64, ptr %t2234
  %t2236 = call i64 @rt_escape_live_p(i64 %t2235)
  %t2237 = icmp ne i64 %t2236, 1
  br i1 %t2237, label %then583, label %else584
then583:
  %t2238 = and i64 %self, -8
  %t2239 = inttoptr i64 %t2238 to ptr
  %t2240 = getelementptr i64, ptr %t2239, i64 2
  %t2241 = load i64, ptr %t2240
  %t2242 = load i64, ptr @"scheme.base:%unwind-to"
  call void @rt_check_callable(i64 %t2242)
  %t2243 = and i64 %t2242, -8
  %t2244 = inttoptr i64 %t2243 to ptr
  %t2245 = load i64, ptr %t2244
  %t2246 = inttoptr i64 %t2245 to ptr
  %t2247 = call fastcc i64%t2246(i64 %t2242, i64 1, i64 %t2241, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2248 = and i64 %self, -8
  %t2249 = inttoptr i64 %t2248 to ptr
  %t2250 = getelementptr i64, ptr %t2249, i64 1
  %t2251 = load i64, ptr %t2250
  %t2252 = call i64 @rt_escape_to(i64 %t2251, i64 %a0)
  br label %merge585
else584:
  br label %merge585
merge585:
  %t2253 = phi i64 [ %t2252, %then583 ], [ 1, %else584 ]
  %t2254 = call i64 @rt_intern(ptr @.str.sym.13)
  %t2255 = call i64 @rt_make_string(ptr @.str.lit.14, i64 39)
  %t2256 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t2256)
  %t2257 = and i64 %t2256, -8
  %t2258 = inttoptr i64 %t2257 to ptr
  %t2259 = load i64, ptr %t2258
  %t2260 = inttoptr i64 %t2259 to ptr
  %t2261 = musttail call fastcc i64 %t2260(i64 %t2256, i64 2, i64 %t2254, i64 %t2255, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2261
}

define fastcc i64 @"scheme.base:code_493"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2262 = icmp eq i64 %argc, 0
  br i1 %t2262, label %argok587, label %arityerr586
arityerr586:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok587:
  %t2263 = call i64 @rt_escape_frame()
  %t2264 = and i64 %self, -8
  %t2265 = inttoptr i64 %t2264 to ptr
  %t2266 = getelementptr i64, ptr %t2265, i64 2
  %t2267 = load i64, ptr %t2266
  %t2268 = call ptr @rt_alloc_words(i64 3)
  %t2269 = ptrtoint ptr %t2268 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_495" to i64), ptr %t2268
  %t2270 = getelementptr i64, ptr %t2268, i64 1
  store i64 %t2263, ptr %t2270
  %t2271 = getelementptr i64, ptr %t2268, i64 2
  store i64 %t2267, ptr %t2271
  %t2272 = or i64 %t2269, 4
  %t2273 = and i64 %self, -8
  %t2274 = inttoptr i64 %t2273 to ptr
  %t2275 = getelementptr i64, ptr %t2274, i64 1
  %t2276 = load i64, ptr %t2275
  call void @rt_check_callable(i64 %t2276)
  %t2277 = and i64 %t2276, -8
  %t2278 = inttoptr i64 %t2277 to ptr
  %t2279 = load i64, ptr %t2278
  %t2280 = inttoptr i64 %t2279 to ptr
  %t2281 = musttail call fastcc i64 %t2280(i64 %t2276, i64 1, i64 %t2272, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2281
}

define fastcc i64 @"scheme.base:code:call-with-current-continuation"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2282 = icmp eq i64 %argc, 1
  br i1 %t2282, label %argok589, label %arityerr588
arityerr588:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok589:
  %t2283 = load i64, ptr @"scheme.base:*winds*"
  %t2284 = call ptr @rt_alloc_words(i64 3)
  %t2285 = ptrtoint ptr %t2284 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_493" to i64), ptr %t2284
  %t2286 = getelementptr i64, ptr %t2284, i64 1
  store i64 %a0, ptr %t2286
  %t2287 = getelementptr i64, ptr %t2284, i64 2
  store i64 %t2283, ptr %t2287
  %t2288 = or i64 %t2285, 4
  %t2289 = call i64 @rt_run_guarded(ptr @__apply0, i64 %t2288)
  %t2290 = call i64 @rt_cdr(i64 %t2289)
  ret i64 %t2290
}

define fastcc i64 @"scheme.base:code:call/cc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2295 = icmp eq i64 %argc, 1
  br i1 %t2295, label %argok591, label %arityerr590
arityerr590:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok591:
  %t2296 = load i64, ptr @"scheme.base:call-with-current-continuation"
  call void @rt_check_callable(i64 %t2296)
  %t2297 = and i64 %t2296, -8
  %t2298 = inttoptr i64 %t2297 to ptr
  %t2299 = load i64, ptr %t2298
  %t2300 = inttoptr i64 %t2299 to ptr
  %t2301 = musttail call fastcc i64 %t2300(i64 %t2296, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2301
}

define fastcc i64 @"scheme.base:code_503"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2306 = icmp eq i64 %argc, 0
  br i1 %t2306, label %argok593, label %arityerr592
arityerr592:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok593:
  %t2307 = and i64 %self, -8
  %t2308 = inttoptr i64 %t2307 to ptr
  %t2309 = getelementptr i64, ptr %t2308, i64 1
  %t2310 = load i64, ptr %t2309
  %t2311 = and i64 %self, -8
  %t2312 = inttoptr i64 %t2311 to ptr
  %t2313 = getelementptr i64, ptr %t2312, i64 2
  %t2314 = load i64, ptr %t2313
  %t2315 = call i64 @rt_cons(i64 %t2310, i64 %t2314)
  %t2316 = call i64 @rt_root(i64 %t2315)
  store i64 %t2316, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code_505"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2317 = icmp eq i64 %argc, 0
  br i1 %t2317, label %argok595, label %arityerr594
arityerr594:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok595:
  %t2318 = and i64 %self, -8
  %t2319 = inttoptr i64 %t2318 to ptr
  %t2320 = getelementptr i64, ptr %t2319, i64 1
  %t2321 = load i64, ptr %t2320
  %t2322 = call i64 @rt_root(i64 %t2321)
  store i64 %t2322, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code:with-exception-handler"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2323 = icmp eq i64 %argc, 2
  br i1 %t2323, label %argok597, label %arityerr596
arityerr596:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok597:
  %t2324 = load i64, ptr @"scheme.base:*handlers*"
  %t2325 = call ptr @rt_alloc_words(i64 3)
  %t2326 = ptrtoint ptr %t2325 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_503" to i64), ptr %t2325
  %t2327 = getelementptr i64, ptr %t2325, i64 1
  store i64 %a0, ptr %t2327
  %t2328 = getelementptr i64, ptr %t2325, i64 2
  store i64 %t2324, ptr %t2328
  %t2329 = or i64 %t2326, 4
  %t2330 = call ptr @rt_alloc_words(i64 2)
  %t2331 = ptrtoint ptr %t2330 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_505" to i64), ptr %t2330
  %t2332 = getelementptr i64, ptr %t2330, i64 1
  store i64 %t2324, ptr %t2332
  %t2333 = or i64 %t2331, 4
  %t2334 = load i64, ptr @"scheme.base:dynamic-wind"
  call void @rt_check_callable(i64 %t2334)
  %t2335 = and i64 %t2334, -8
  %t2336 = inttoptr i64 %t2335 to ptr
  %t2337 = load i64, ptr %t2336
  %t2338 = inttoptr i64 %t2337 to ptr
  %t2339 = musttail call fastcc i64 %t2338(i64 %t2334, i64 3, i64 %t2329, i64 %a1, i64 %t2333, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2339
}

define fastcc i64 @"scheme.base:code:raise"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2344 = icmp eq i64 %argc, 1
  br i1 %t2344, label %argok599, label %arityerr598
arityerr598:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok599:
  %t2345 = load i64, ptr @"scheme.base:*handlers*"
  %t2346 = call i64 @rt_null_p(i64 %t2345)
  %t2347 = icmp ne i64 %t2346, 1
  br i1 %t2347, label %then600, label %else601
then600:
  %t2348 = call i64 @rt_raise(i64 %a0)
  ret i64 %t2348
else601:
  %t2349 = load i64, ptr @"scheme.base:*handlers*"
  %t2350 = call i64 @rt_car(i64 %t2349)
  %t2351 = load i64, ptr @"scheme.base:*handlers*"
  %t2352 = load i64, ptr @"scheme.base:*handlers*"
  %t2353 = call i64 @rt_cdr(i64 %t2352)
  %t2354 = call i64 @rt_root(i64 %t2353)
  store i64 %t2354, ptr @"scheme.base:*handlers*"
  call void @rt_check_callable(i64 %t2350)
  %t2355 = and i64 %t2350, -8
  %t2356 = inttoptr i64 %t2355 to ptr
  %t2357 = load i64, ptr %t2356
  %t2358 = inttoptr i64 %t2357 to ptr
  %t2359 = call fastcc i64%t2358(i64 %t2350, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2360 = call i64 @rt_root(i64 %t2351)
  store i64 %t2360, ptr @"scheme.base:*handlers*"
  %t2361 = call i64 @rt_raise(i64 %a0)
  ret i64 %t2361
}

define fastcc i64 @"scheme.base:code:error-object?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2366 = icmp eq i64 %argc, 1
  br i1 %t2366, label %argok603, label %arityerr602
arityerr602:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok603:
  %t2367 = call i64 @rt_error_object_p(i64 %a0)
  ret i64 %t2367
}

define fastcc i64 @"scheme.base:code:error-object-message"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2372 = icmp eq i64 %argc, 1
  br i1 %t2372, label %argok605, label %arityerr604
arityerr604:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok605:
  %t2373 = call i64 @rt_error_object_message(i64 %a0)
  ret i64 %t2373
}

define fastcc i64 @"scheme.base:code:error-object-irritants"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2378 = icmp eq i64 %argc, 1
  br i1 %t2378, label %argok607, label %arityerr606
arityerr606:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok607:
  %t2379 = call i64 @rt_error_object_irritants(i64 %a0)
  ret i64 %t2379
}

define fastcc i64 @"scheme.base:code:read-error?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2384 = icmp eq i64 %argc, 1
  br i1 %t2384, label %argok609, label %arityerr608
arityerr608:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok609:
  %t2385 = call i64 @rt_error_object_p(i64 %a0)
  %t2386 = icmp ne i64 %t2385, 1
  br i1 %t2386, label %then610, label %else611
then610:
  %t2387 = call i64 @rt_error_object_kind(i64 %a0)
  %t2388 = call i64 @rt_intern(ptr @.str.sym.12)
  %t2389 = call i64 @rt_eq_p(i64 %t2387, i64 %t2388)
  ret i64 %t2389
else611:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:file-error?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2394 = icmp eq i64 %argc, 1
  br i1 %t2394, label %argok613, label %arityerr612
arityerr612:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok613:
  %t2395 = call i64 @rt_error_object_p(i64 %a0)
  %t2396 = icmp ne i64 %t2395, 1
  br i1 %t2396, label %then614, label %else615
then614:
  %t2397 = call i64 @rt_error_object_kind(i64 %a0)
  %t2398 = call i64 @rt_intern(ptr @.str.sym.15)
  %t2399 = call i64 @rt_eq_p(i64 %t2397, i64 %t2398)
  ret i64 %t2399
else615:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_537"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2404 = icmp eq i64 %argc, 1
  br i1 %t2404, label %argok617, label %arityerr616
arityerr616:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok617:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_539"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2405 = icmp eq i64 %argc, 1
  br i1 %t2405, label %argok619, label %arityerr618
arityerr618:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok619:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_541"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2406 = icmp sge i64 %argc, 0
  br i1 %t2406, label %argok621, label %arityerr620
arityerr620:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok621:
  %t2407 = call ptr @rt_alloc_words(i64 8)
  %t2408 = getelementptr i64, ptr %t2407, i64 0
  store i64 %a0, ptr %t2408
  %t2409 = getelementptr i64, ptr %t2407, i64 1
  store i64 %a1, ptr %t2409
  %t2410 = getelementptr i64, ptr %t2407, i64 2
  store i64 %a2, ptr %t2410
  %t2411 = getelementptr i64, ptr %t2407, i64 3
  store i64 %a3, ptr %t2411
  %t2412 = getelementptr i64, ptr %t2407, i64 4
  store i64 %a4, ptr %t2412
  %t2413 = getelementptr i64, ptr %t2407, i64 5
  store i64 %a5, ptr %t2413
  %t2414 = getelementptr i64, ptr %t2407, i64 6
  store i64 %a6, ptr %t2414
  %t2415 = getelementptr i64, ptr %t2407, i64 7
  store i64 %a7, ptr %t2415
  %t2416 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2407, ptr %overflow)
  %t2417 = call i64 @rt_null_p(i64 %t2416)
  %t2418 = icmp ne i64 %t2417, 1
  br i1 %t2418, label %then622, label %else623
then622:
  %t2419 = and i64 %self, -8
  %t2420 = inttoptr i64 %t2419 to ptr
  %t2421 = getelementptr i64, ptr %t2420, i64 1
  %t2422 = load i64, ptr %t2421
  %t2423 = call i64 @rt_vector_ref(i64 %t2422, i64 0)
  ret i64 %t2423
else623:
  %t2424 = call i64 @rt_cdr(i64 %t2416)
  %t2425 = call i64 @rt_null_p(i64 %t2424)
  %t2426 = icmp ne i64 %t2425, 1
  br i1 %t2426, label %then624, label %else625
then624:
  %t2427 = and i64 %self, -8
  %t2428 = inttoptr i64 %t2427 to ptr
  %t2429 = getelementptr i64, ptr %t2428, i64 1
  %t2430 = load i64, ptr %t2429
  %t2431 = call i64 @rt_car(i64 %t2416)
  %t2432 = and i64 %self, -8
  %t2433 = inttoptr i64 %t2432 to ptr
  %t2434 = getelementptr i64, ptr %t2433, i64 2
  %t2435 = load i64, ptr %t2434
  call void @rt_check_callable(i64 %t2435)
  %t2436 = and i64 %t2435, -8
  %t2437 = inttoptr i64 %t2436 to ptr
  %t2438 = load i64, ptr %t2437
  %t2439 = inttoptr i64 %t2438 to ptr
  %t2440 = call fastcc i64%t2439(i64 %t2435, i64 1, i64 %t2431, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2441 = call i64 @rt_vector_set(i64 %t2430, i64 0, i64 %t2440)
  ret i64 %t2441
else625:
  %t2442 = and i64 %self, -8
  %t2443 = inttoptr i64 %t2442 to ptr
  %t2444 = getelementptr i64, ptr %t2443, i64 1
  %t2445 = load i64, ptr %t2444
  %t2446 = call i64 @rt_car(i64 %t2416)
  %t2447 = call i64 @rt_vector_set(i64 %t2445, i64 0, i64 %t2446)
  ret i64 %t2447
}

define fastcc i64 @"scheme.base:code:make-parameter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2448 = icmp sge i64 %argc, 1
  br i1 %t2448, label %argok627, label %arityerr626
arityerr626:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok627:
  %t2449 = call ptr @rt_alloc_words(i64 8)
  %t2450 = getelementptr i64, ptr %t2449, i64 0
  store i64 %a0, ptr %t2450
  %t2451 = getelementptr i64, ptr %t2449, i64 1
  store i64 %a1, ptr %t2451
  %t2452 = getelementptr i64, ptr %t2449, i64 2
  store i64 %a2, ptr %t2452
  %t2453 = getelementptr i64, ptr %t2449, i64 3
  store i64 %a3, ptr %t2453
  %t2454 = getelementptr i64, ptr %t2449, i64 4
  store i64 %a4, ptr %t2454
  %t2455 = getelementptr i64, ptr %t2449, i64 5
  store i64 %a5, ptr %t2455
  %t2456 = getelementptr i64, ptr %t2449, i64 6
  store i64 %a6, ptr %t2456
  %t2457 = getelementptr i64, ptr %t2449, i64 7
  store i64 %a7, ptr %t2457
  %t2458 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2449, ptr %overflow)
  %t2459 = call i64 @rt_null_p(i64 %t2458)
  %t2460 = icmp ne i64 %t2459, 1
  br i1 %t2460, label %then628, label %else629
then628:
  %t2461 = call ptr @rt_alloc_words(i64 1)
  %t2462 = ptrtoint ptr %t2461 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_537" to i64), ptr %t2461
  %t2463 = or i64 %t2462, 4
  br label %merge630
else629:
  %t2464 = call i64 @rt_car(i64 %t2458)
  br label %merge630
merge630:
  %t2465 = phi i64 [ %t2463, %then628 ], [ %t2464, %else629 ]
  %t2466 = call i64 @rt_make_vector(i64 8, i64 0)
  %t2467 = call i64 @rt_null_p(i64 %t2458)
  %t2468 = icmp ne i64 %t2467, 1
  br i1 %t2468, label %then631, label %else632
then631:
  %t2469 = call ptr @rt_alloc_words(i64 1)
  %t2470 = ptrtoint ptr %t2469 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_539" to i64), ptr %t2469
  %t2471 = or i64 %t2470, 4
  br label %merge633
else632:
  %t2472 = call i64 @rt_car(i64 %t2458)
  br label %merge633
merge633:
  %t2473 = phi i64 [ %t2471, %then631 ], [ %t2472, %else632 ]
  call void @rt_check_callable(i64 %t2473)
  %t2474 = and i64 %t2473, -8
  %t2475 = inttoptr i64 %t2474 to ptr
  %t2476 = load i64, ptr %t2475
  %t2477 = inttoptr i64 %t2476 to ptr
  %t2478 = call fastcc i64%t2477(i64 %t2473, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2479 = call i64 @rt_vector_set(i64 %t2466, i64 0, i64 %t2478)
  %t2480 = call ptr @rt_alloc_words(i64 3)
  %t2481 = ptrtoint ptr %t2480 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_541" to i64), ptr %t2480
  %t2482 = getelementptr i64, ptr %t2480, i64 1
  store i64 %t2466, ptr %t2482
  %t2483 = getelementptr i64, ptr %t2480, i64 2
  store i64 %t2465, ptr %t2483
  %t2484 = or i64 %t2481, 4
  ret i64 %t2484
}

define fastcc i64 @"scheme.base:code_553"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2489 = icmp eq i64 %argc, 1
  br i1 %t2489, label %argok635, label %arityerr634
arityerr634:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok635:
  call void @rt_check_callable(i64 %a0)
  %t2490 = and i64 %a0, -8
  %t2491 = inttoptr i64 %t2490 to ptr
  %t2492 = load i64, ptr %t2491
  %t2493 = inttoptr i64 %t2492 to ptr
  %t2494 = musttail call fastcc i64 %t2493(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2494
}

define fastcc i64 @"scheme.base:code_557"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2495 = icmp eq i64 %argc, 2
  br i1 %t2495, label %argok637, label %arityerr636
arityerr636:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok637:
  call void @rt_check_callable(i64 %a0)
  %t2496 = and i64 %a0, -8
  %t2497 = inttoptr i64 %t2496 to ptr
  %t2498 = load i64, ptr %t2497
  %t2499 = inttoptr i64 %t2498 to ptr
  %t2500 = musttail call fastcc i64 %t2499(i64 %a0, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2500
}

define fastcc i64 @"scheme.base:code_555"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2501 = icmp eq i64 %argc, 0
  br i1 %t2501, label %argok639, label %arityerr638
arityerr638:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok639:
  %t2502 = call ptr @rt_alloc_words(i64 1)
  %t2503 = ptrtoint ptr %t2502 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_557" to i64), ptr %t2502
  %t2504 = or i64 %t2503, 4
  %t2505 = and i64 %self, -8
  %t2506 = inttoptr i64 %t2505 to ptr
  %t2507 = getelementptr i64, ptr %t2506, i64 1
  %t2508 = load i64, ptr %t2507
  %t2509 = and i64 %self, -8
  %t2510 = inttoptr i64 %t2509 to ptr
  %t2511 = getelementptr i64, ptr %t2510, i64 2
  %t2512 = load i64, ptr %t2511
  %t2513 = load i64, ptr @"scheme.base:for-each"
  call void @rt_check_callable(i64 %t2513)
  %t2514 = and i64 %t2513, -8
  %t2515 = inttoptr i64 %t2514 to ptr
  %t2516 = load i64, ptr %t2515
  %t2517 = inttoptr i64 %t2516 to ptr
  %t2518 = musttail call fastcc i64 %t2517(i64 %t2513, i64 3, i64 %t2504, i64 %t2508, i64 %t2512, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2518
}

define fastcc i64 @"scheme.base:code_561"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2519 = icmp eq i64 %argc, 2
  br i1 %t2519, label %argok641, label %arityerr640
arityerr640:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok641:
  call void @rt_check_callable(i64 %a0)
  %t2520 = and i64 %a0, -8
  %t2521 = inttoptr i64 %t2520 to ptr
  %t2522 = load i64, ptr %t2521
  %t2523 = inttoptr i64 %t2522 to ptr
  %t2524 = musttail call fastcc i64 %t2523(i64 %a0, i64 2, i64 %a1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2524
}

define fastcc i64 @"scheme.base:code_559"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2525 = icmp eq i64 %argc, 0
  br i1 %t2525, label %argok643, label %arityerr642
arityerr642:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok643:
  %t2526 = call ptr @rt_alloc_words(i64 1)
  %t2527 = ptrtoint ptr %t2526 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_561" to i64), ptr %t2526
  %t2528 = or i64 %t2527, 4
  %t2529 = and i64 %self, -8
  %t2530 = inttoptr i64 %t2529 to ptr
  %t2531 = getelementptr i64, ptr %t2530, i64 1
  %t2532 = load i64, ptr %t2531
  %t2533 = and i64 %self, -8
  %t2534 = inttoptr i64 %t2533 to ptr
  %t2535 = getelementptr i64, ptr %t2534, i64 2
  %t2536 = load i64, ptr %t2535
  %t2537 = load i64, ptr @"scheme.base:for-each"
  call void @rt_check_callable(i64 %t2537)
  %t2538 = and i64 %t2537, -8
  %t2539 = inttoptr i64 %t2538 to ptr
  %t2540 = load i64, ptr %t2539
  %t2541 = inttoptr i64 %t2540 to ptr
  %t2542 = musttail call fastcc i64 %t2541(i64 %t2537, i64 3, i64 %t2528, i64 %t2532, i64 %t2536, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2542
}

define fastcc i64 @"scheme.base:code:with-parameters"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2543 = icmp eq i64 %argc, 3
  br i1 %t2543, label %argok645, label %arityerr644
arityerr644:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok645:
  %t2544 = call ptr @rt_alloc_words(i64 1)
  %t2545 = ptrtoint ptr %t2544 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_553" to i64), ptr %t2544
  %t2546 = or i64 %t2545, 4
  %t2547 = load i64, ptr @"scheme.base:map"
  call void @rt_check_callable(i64 %t2547)
  %t2548 = and i64 %t2547, -8
  %t2549 = inttoptr i64 %t2548 to ptr
  %t2550 = load i64, ptr %t2549
  %t2551 = inttoptr i64 %t2550 to ptr
  %t2552 = call fastcc i64%t2551(i64 %t2547, i64 2, i64 %t2546, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2553 = call ptr @rt_alloc_words(i64 3)
  %t2554 = ptrtoint ptr %t2553 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_555" to i64), ptr %t2553
  %t2555 = getelementptr i64, ptr %t2553, i64 1
  store i64 %a0, ptr %t2555
  %t2556 = getelementptr i64, ptr %t2553, i64 2
  store i64 %a1, ptr %t2556
  %t2557 = or i64 %t2554, 4
  %t2558 = call ptr @rt_alloc_words(i64 3)
  %t2559 = ptrtoint ptr %t2558 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_559" to i64), ptr %t2558
  %t2560 = getelementptr i64, ptr %t2558, i64 1
  store i64 %a0, ptr %t2560
  %t2561 = getelementptr i64, ptr %t2558, i64 2
  store i64 %t2552, ptr %t2561
  %t2562 = or i64 %t2559, 4
  %t2563 = load i64, ptr @"scheme.base:dynamic-wind"
  call void @rt_check_callable(i64 %t2563)
  %t2564 = and i64 %t2563, -8
  %t2565 = inttoptr i64 %t2564 to ptr
  %t2566 = load i64, ptr %t2565
  %t2567 = inttoptr i64 %t2566 to ptr
  %t2568 = musttail call fastcc i64 %t2567(i64 %t2563, i64 3, i64 %t2557, i64 %a2, i64 %t2562, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2568
}

define fastcc i64 @"scheme.base:code_569"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2573 = icmp eq i64 %argc, 2
  br i1 %t2573, label %argok647, label %arityerr646
arityerr646:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok647:
  %t2574 = call i64 @rt_null_p(i64 %a0)
  %t2575 = icmp ne i64 %t2574, 1
  br i1 %t2575, label %then648, label %else649
then648:
  %t2576 = and i64 %self, -8
  %t2577 = inttoptr i64 %t2576 to ptr
  %t2578 = getelementptr i64, ptr %t2577, i64 1
  %t2579 = load i64, ptr %t2578
  ret i64 %t2579
else649:
  %t2580 = and i64 %self, -8
  %t2581 = inttoptr i64 %t2580 to ptr
  %t2582 = getelementptr i64, ptr %t2581, i64 1
  %t2583 = load i64, ptr %t2582
  %t2584 = call i64 @rt_car(i64 %a0)
  %t2585 = call i64 @rt_vector_set(i64 %t2583, i64 %a1, i64 %t2584)
  %t2586 = call i64 @rt_cdr(i64 %a0)
  %t2587 = or i64 %a1, 8
  %t2588 = and i64 %t2587, 7
  %t2589 = icmp eq i64 %t2588, 0
  br i1 %t2589, label %fixfast650, label %fixslow651
fixfast650:
  %t2590 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t2591 = extractvalue {i64, i1} %t2590, 0
  %t2592 = extractvalue {i64, i1} %t2590, 1
  br i1 %t2592, label %fixslow651, label %fixmerge652
fixslow651:
  %t2593 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge652
fixmerge652:
  %t2594 = phi i64 [ %t2591, %fixfast650 ], [ %t2593, %fixslow651 ]
  %t2595 = musttail call fastcc i64 @"scheme.base:code_569"(i64 %self, i64 2, i64 %t2586, i64 %t2594, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2595
}

define fastcc i64 @"scheme.base:code:list->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2596 = icmp eq i64 %argc, 1
  br i1 %t2596, label %argok654, label %arityerr653
arityerr653:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok654:
  %t2597 = load i64, ptr @"scheme.base:length"
  call void @rt_check_callable(i64 %t2597)
  %t2598 = and i64 %t2597, -8
  %t2599 = inttoptr i64 %t2598 to ptr
  %t2600 = load i64, ptr %t2599
  %t2601 = inttoptr i64 %t2600 to ptr
  %t2602 = call fastcc i64%t2601(i64 %t2597, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2603 = call i64 @rt_make_vector(i64 %t2602, i64 0)
  %t2604 = call ptr @rt_alloc_words(i64 3)
  %t2605 = ptrtoint ptr %t2604 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_569" to i64), ptr %t2604
  %t2606 = or i64 %t2605, 4
  %t2607 = getelementptr i64, ptr %t2604, i64 1
  store i64 %t2603, ptr %t2607
  %t2608 = getelementptr i64, ptr %t2604, i64 2
  store i64 %t2606, ptr %t2608
  %t2609 = musttail call fastcc i64 @"scheme.base:code_569"(i64 %t2606, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2609
}

define fastcc i64 @"scheme.base:code:vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2614 = icmp sge i64 %argc, 0
  br i1 %t2614, label %argok656, label %arityerr655
arityerr655:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok656:
  %t2615 = call ptr @rt_alloc_words(i64 8)
  %t2616 = getelementptr i64, ptr %t2615, i64 0
  store i64 %a0, ptr %t2616
  %t2617 = getelementptr i64, ptr %t2615, i64 1
  store i64 %a1, ptr %t2617
  %t2618 = getelementptr i64, ptr %t2615, i64 2
  store i64 %a2, ptr %t2618
  %t2619 = getelementptr i64, ptr %t2615, i64 3
  store i64 %a3, ptr %t2619
  %t2620 = getelementptr i64, ptr %t2615, i64 4
  store i64 %a4, ptr %t2620
  %t2621 = getelementptr i64, ptr %t2615, i64 5
  store i64 %a5, ptr %t2621
  %t2622 = getelementptr i64, ptr %t2615, i64 6
  store i64 %a6, ptr %t2622
  %t2623 = getelementptr i64, ptr %t2615, i64 7
  store i64 %a7, ptr %t2623
  %t2624 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2615, ptr %overflow)
  %t2625 = load i64, ptr @"scheme.base:list->vector"
  call void @rt_check_callable(i64 %t2625)
  %t2626 = and i64 %t2625, -8
  %t2627 = inttoptr i64 %t2626 to ptr
  %t2628 = load i64, ptr %t2627
  %t2629 = inttoptr i64 %t2628 to ptr
  %t2630 = musttail call fastcc i64 %t2629(i64 %t2625, i64 1, i64 %t2624, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2630
}

define fastcc i64 @"scheme.base:code_579"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2635 = icmp eq i64 %argc, 2
  br i1 %t2635, label %argok658, label %arityerr657
arityerr657:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok658:
  %t2636 = call i64 @rt_null_p(i64 %a0)
  %t2637 = icmp ne i64 %t2636, 1
  br i1 %t2637, label %then659, label %else660
then659:
  %t2638 = and i64 %self, -8
  %t2639 = inttoptr i64 %t2638 to ptr
  %t2640 = getelementptr i64, ptr %t2639, i64 1
  %t2641 = load i64, ptr %t2640
  ret i64 %t2641
else660:
  %t2642 = and i64 %self, -8
  %t2643 = inttoptr i64 %t2642 to ptr
  %t2644 = getelementptr i64, ptr %t2643, i64 1
  %t2645 = load i64, ptr %t2644
  %t2646 = call i64 @rt_car(i64 %a0)
  %t2647 = call i64 @rt_bytevector_u8_set(i64 %t2645, i64 %a1, i64 %t2646)
  %t2648 = call i64 @rt_cdr(i64 %a0)
  %t2649 = or i64 %a1, 8
  %t2650 = and i64 %t2649, 7
  %t2651 = icmp eq i64 %t2650, 0
  br i1 %t2651, label %fixfast661, label %fixslow662
fixfast661:
  %t2652 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t2653 = extractvalue {i64, i1} %t2652, 0
  %t2654 = extractvalue {i64, i1} %t2652, 1
  br i1 %t2654, label %fixslow662, label %fixmerge663
fixslow662:
  %t2655 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge663
fixmerge663:
  %t2656 = phi i64 [ %t2653, %fixfast661 ], [ %t2655, %fixslow662 ]
  %t2657 = musttail call fastcc i64 @"scheme.base:code_579"(i64 %self, i64 2, i64 %t2648, i64 %t2656, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2657
}

define fastcc i64 @"scheme.base:code:list->bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2658 = icmp eq i64 %argc, 1
  br i1 %t2658, label %argok665, label %arityerr664
arityerr664:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok665:
  %t2659 = load i64, ptr @"scheme.base:length"
  call void @rt_check_callable(i64 %t2659)
  %t2660 = and i64 %t2659, -8
  %t2661 = inttoptr i64 %t2660 to ptr
  %t2662 = load i64, ptr %t2661
  %t2663 = inttoptr i64 %t2662 to ptr
  %t2664 = call fastcc i64%t2663(i64 %t2659, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2665 = call i64 @rt_make_bytevector(i64 %t2664, i64 0)
  %t2666 = call ptr @rt_alloc_words(i64 3)
  %t2667 = ptrtoint ptr %t2666 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_579" to i64), ptr %t2666
  %t2668 = or i64 %t2667, 4
  %t2669 = getelementptr i64, ptr %t2666, i64 1
  store i64 %t2665, ptr %t2669
  %t2670 = getelementptr i64, ptr %t2666, i64 2
  store i64 %t2668, ptr %t2670
  %t2671 = musttail call fastcc i64 @"scheme.base:code_579"(i64 %t2668, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2671
}

define fastcc i64 @"scheme.base:code:bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2676 = icmp sge i64 %argc, 0
  br i1 %t2676, label %argok667, label %arityerr666
arityerr666:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok667:
  %t2677 = call ptr @rt_alloc_words(i64 8)
  %t2678 = getelementptr i64, ptr %t2677, i64 0
  store i64 %a0, ptr %t2678
  %t2679 = getelementptr i64, ptr %t2677, i64 1
  store i64 %a1, ptr %t2679
  %t2680 = getelementptr i64, ptr %t2677, i64 2
  store i64 %a2, ptr %t2680
  %t2681 = getelementptr i64, ptr %t2677, i64 3
  store i64 %a3, ptr %t2681
  %t2682 = getelementptr i64, ptr %t2677, i64 4
  store i64 %a4, ptr %t2682
  %t2683 = getelementptr i64, ptr %t2677, i64 5
  store i64 %a5, ptr %t2683
  %t2684 = getelementptr i64, ptr %t2677, i64 6
  store i64 %a6, ptr %t2684
  %t2685 = getelementptr i64, ptr %t2677, i64 7
  store i64 %a7, ptr %t2685
  %t2686 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2677, ptr %overflow)
  %t2687 = load i64, ptr @"scheme.base:list->bytevector"
  call void @rt_check_callable(i64 %t2687)
  %t2688 = and i64 %t2687, -8
  %t2689 = inttoptr i64 %t2688 to ptr
  %t2690 = load i64, ptr %t2689
  %t2691 = inttoptr i64 %t2690 to ptr
  %t2692 = musttail call fastcc i64 %t2691(i64 %t2687, i64 1, i64 %t2686, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2692
}

define fastcc i64 @"scheme.base:code:rng-start"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2697 = icmp eq i64 %argc, 1
  br i1 %t2697, label %argok669, label %arityerr668
arityerr668:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok669:
  %t2698 = call i64 @rt_pair_p(i64 %a0)
  %t2699 = icmp ne i64 %t2698, 1
  br i1 %t2699, label %then670, label %else671
then670:
  %t2700 = call i64 @rt_car(i64 %a0)
  ret i64 %t2700
else671:
  ret i64 0
}

define fastcc i64 @"scheme.base:code:rng-end"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2705 = icmp eq i64 %argc, 2
  br i1 %t2705, label %argok673, label %arityerr672
arityerr672:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok673:
  %t2706 = call i64 @rt_pair_p(i64 %a0)
  %t2707 = icmp ne i64 %t2706, 1
  br i1 %t2707, label %then674, label %else675
then674:
  %t2708 = call i64 @rt_cdr(i64 %a0)
  %t2709 = call i64 @rt_pair_p(i64 %t2708)
  br label %merge676
else675:
  br label %merge676
merge676:
  %t2710 = phi i64 [ %t2709, %then674 ], [ 1, %else675 ]
  %t2711 = icmp ne i64 %t2710, 1
  br i1 %t2711, label %then677, label %else678
then677:
  %t2712 = call i64 @rt_cdr(i64 %a0)
  %t2713 = call i64 @rt_car(i64 %t2712)
  ret i64 %t2713
else678:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:rng-check"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2718 = icmp eq i64 %argc, 4
  br i1 %t2718, label %argok680, label %arityerr679
arityerr679:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok680:
  %t2719 = or i64 0, %a1
  %t2720 = and i64 %t2719, 7
  %t2721 = icmp eq i64 %t2720, 0
  br i1 %t2721, label %fixfast681, label %fixslow682
fixfast681:
  %t2722 = icmp slt i64 0, %a1
  %t2723 = select i1 %t2722, i64 257, i64 1
  br label %fixmerge683
fixslow682:
  %t2724 = call i64 @rt_lt(i64 0, i64 %a1)
  br label %fixmerge683
fixmerge683:
  %t2725 = phi i64 [ %t2723, %fixfast681 ], [ %t2724, %fixslow682 ]
  %t2726 = icmp ne i64 %t2725, 1
  br i1 %t2726, label %then684, label %else685
then684:
  br label %merge686
else685:
  %t2727 = or i64 0, %a1
  %t2728 = and i64 %t2727, 7
  %t2729 = icmp eq i64 %t2728, 0
  br i1 %t2729, label %fixfast687, label %fixslow688
fixfast687:
  %t2730 = icmp eq i64 0, %a1
  %t2731 = select i1 %t2730, i64 257, i64 1
  br label %fixmerge689
fixslow688:
  %t2732 = call i64 @rt_num_eq(i64 0, i64 %a1)
  br label %fixmerge689
fixmerge689:
  %t2733 = phi i64 [ %t2731, %fixfast687 ], [ %t2732, %fixslow688 ]
  br label %merge686
merge686:
  %t2734 = phi i64 [ 257, %then684 ], [ %t2733, %fixmerge689 ]
  %t2735 = icmp ne i64 %t2734, 1
  br i1 %t2735, label %then690, label %else691
then690:
  %t2736 = or i64 %a1, %a2
  %t2737 = and i64 %t2736, 7
  %t2738 = icmp eq i64 %t2737, 0
  br i1 %t2738, label %fixfast693, label %fixslow694
fixfast693:
  %t2739 = icmp slt i64 %a1, %a2
  %t2740 = select i1 %t2739, i64 257, i64 1
  br label %fixmerge695
fixslow694:
  %t2741 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge695
fixmerge695:
  %t2742 = phi i64 [ %t2740, %fixfast693 ], [ %t2741, %fixslow694 ]
  %t2743 = icmp ne i64 %t2742, 1
  br i1 %t2743, label %then696, label %else697
then696:
  br label %merge698
else697:
  %t2744 = or i64 %a1, %a2
  %t2745 = and i64 %t2744, 7
  %t2746 = icmp eq i64 %t2745, 0
  br i1 %t2746, label %fixfast699, label %fixslow700
fixfast699:
  %t2747 = icmp eq i64 %a1, %a2
  %t2748 = select i1 %t2747, i64 257, i64 1
  br label %fixmerge701
fixslow700:
  %t2749 = call i64 @rt_num_eq(i64 %a1, i64 %a2)
  br label %fixmerge701
fixmerge701:
  %t2750 = phi i64 [ %t2748, %fixfast699 ], [ %t2749, %fixslow700 ]
  br label %merge698
merge698:
  %t2751 = phi i64 [ 257, %then696 ], [ %t2750, %fixmerge701 ]
  %t2752 = icmp ne i64 %t2751, 1
  br i1 %t2752, label %then702, label %else703
then702:
  %t2753 = or i64 %a2, %a3
  %t2754 = and i64 %t2753, 7
  %t2755 = icmp eq i64 %t2754, 0
  br i1 %t2755, label %fixfast705, label %fixslow706
fixfast705:
  %t2756 = icmp slt i64 %a2, %a3
  %t2757 = select i1 %t2756, i64 257, i64 1
  br label %fixmerge707
fixslow706:
  %t2758 = call i64 @rt_lt(i64 %a2, i64 %a3)
  br label %fixmerge707
fixmerge707:
  %t2759 = phi i64 [ %t2757, %fixfast705 ], [ %t2758, %fixslow706 ]
  %t2760 = icmp ne i64 %t2759, 1
  br i1 %t2760, label %then708, label %else709
then708:
  br label %merge710
else709:
  %t2761 = or i64 %a2, %a3
  %t2762 = and i64 %t2761, 7
  %t2763 = icmp eq i64 %t2762, 0
  br i1 %t2763, label %fixfast711, label %fixslow712
fixfast711:
  %t2764 = icmp eq i64 %a2, %a3
  %t2765 = select i1 %t2764, i64 257, i64 1
  br label %fixmerge713
fixslow712:
  %t2766 = call i64 @rt_num_eq(i64 %a2, i64 %a3)
  br label %fixmerge713
fixmerge713:
  %t2767 = phi i64 [ %t2765, %fixfast711 ], [ %t2766, %fixslow712 ]
  br label %merge710
merge710:
  %t2768 = phi i64 [ 257, %then708 ], [ %t2767, %fixmerge713 ]
  br label %merge704
else703:
  br label %merge704
merge704:
  %t2769 = phi i64 [ %t2768, %merge710 ], [ 1, %else703 ]
  br label %merge692
else691:
  br label %merge692
merge692:
  %t2770 = phi i64 [ %t2769, %merge704 ], [ 1, %else691 ]
  %t2771 = icmp ne i64 %t2770, 1
  br i1 %t2771, label %then714, label %else715
then714:
  ret i64 257
else715:
  %t2772 = call i64 @rt_make_string(ptr @.str.lit.16, i64 19)
  %t2773 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t2773)
  %t2774 = and i64 %t2773, -8
  %t2775 = inttoptr i64 %t2774 to ptr
  %t2776 = load i64, ptr %t2775
  %t2777 = inttoptr i64 %t2776 to ptr
  %t2778 = musttail call fastcc i64 %t2777(i64 %t2773, i64 5, i64 %t2772, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2778
}

define fastcc i64 @"scheme.base:code:assv"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2783 = icmp eq i64 %argc, 2
  br i1 %t2783, label %argok717, label %arityerr716
arityerr716:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok717:
  %t2784 = call i64 @rt_null_p(i64 %a1)
  %t2785 = icmp ne i64 %t2784, 1
  br i1 %t2785, label %then718, label %else719
then718:
  ret i64 1
else719:
  %t2786 = call i64 @rt_car(i64 %a1)
  %t2787 = call i64 @rt_car(i64 %t2786)
  %t2788 = call i64 @rt_eqv_p(i64 %a0, i64 %t2787)
  %t2789 = icmp ne i64 %t2788, 1
  br i1 %t2789, label %then720, label %else721
then720:
  %t2790 = call i64 @rt_car(i64 %a1)
  ret i64 %t2790
else721:
  %t2791 = call i64 @rt_cdr(i64 %a1)
  %t2792 = load i64, ptr @"scheme.base:assv"
  call void @rt_check_callable(i64 %t2792)
  %t2793 = and i64 %t2792, -8
  %t2794 = inttoptr i64 %t2793 to ptr
  %t2795 = load i64, ptr %t2794
  %t2796 = inttoptr i64 %t2795 to ptr
  %t2797 = musttail call fastcc i64 %t2796(i64 %t2792, i64 2, i64 %a0, i64 %t2791, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2797
}

define fastcc i64 @"scheme.base:code:list-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2802 = icmp eq i64 %argc, 1
  br i1 %t2802, label %argok723, label %arityerr722
arityerr722:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok723:
  %t2803 = call i64 @rt_pair_p(i64 %a0)
  %t2804 = icmp ne i64 %t2803, 1
  br i1 %t2804, label %then724, label %else725
then724:
  %t2805 = call i64 @rt_car(i64 %a0)
  %t2806 = call i64 @rt_cdr(i64 %a0)
  %t2807 = load i64, ptr @"scheme.base:list-copy"
  call void @rt_check_callable(i64 %t2807)
  %t2808 = and i64 %t2807, -8
  %t2809 = inttoptr i64 %t2808 to ptr
  %t2810 = load i64, ptr %t2809
  %t2811 = inttoptr i64 %t2810 to ptr
  %t2812 = call fastcc i64%t2811(i64 %t2807, i64 1, i64 %t2806, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2813 = call i64 @rt_cons(i64 %t2805, i64 %t2812)
  ret i64 %t2813
else725:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:boolean=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2818 = icmp sge i64 %argc, 2
  br i1 %t2818, label %argok727, label %arityerr726
arityerr726:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok727:
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
  %t2828 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t2819, ptr %overflow)
  %t2829 = call i64 @rt_cons(i64 %a1, i64 %t2828)
  %t2830 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t2830)
  %t2831 = and i64 %t2830, -8
  %t2832 = inttoptr i64 %t2831 to ptr
  %t2833 = load i64, ptr %t2832
  %t2834 = inttoptr i64 %t2833 to ptr
  %t2835 = musttail call fastcc i64 %t2834(i64 %t2830, i64 2, i64 %a0, i64 %t2829, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2835
}

define fastcc i64 @"scheme.base:code:symbol=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2840 = icmp sge i64 %argc, 2
  br i1 %t2840, label %argok729, label %arityerr728
arityerr728:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok729:
  %t2841 = call ptr @rt_alloc_words(i64 8)
  %t2842 = getelementptr i64, ptr %t2841, i64 0
  store i64 %a0, ptr %t2842
  %t2843 = getelementptr i64, ptr %t2841, i64 1
  store i64 %a1, ptr %t2843
  %t2844 = getelementptr i64, ptr %t2841, i64 2
  store i64 %a2, ptr %t2844
  %t2845 = getelementptr i64, ptr %t2841, i64 3
  store i64 %a3, ptr %t2845
  %t2846 = getelementptr i64, ptr %t2841, i64 4
  store i64 %a4, ptr %t2846
  %t2847 = getelementptr i64, ptr %t2841, i64 5
  store i64 %a5, ptr %t2847
  %t2848 = getelementptr i64, ptr %t2841, i64 6
  store i64 %a6, ptr %t2848
  %t2849 = getelementptr i64, ptr %t2841, i64 7
  store i64 %a7, ptr %t2849
  %t2850 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t2841, ptr %overflow)
  %t2851 = call i64 @rt_cons(i64 %a1, i64 %t2850)
  %t2852 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t2852)
  %t2853 = and i64 %t2852, -8
  %t2854 = inttoptr i64 %t2853 to ptr
  %t2855 = load i64, ptr %t2854
  %t2856 = inttoptr i64 %t2855 to ptr
  %t2857 = musttail call fastcc i64 %t2856(i64 %t2852, i64 2, i64 %a0, i64 %t2851, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2857
}

define fastcc i64 @"scheme.base:code:eqv-chain?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2862 = icmp eq i64 %argc, 2
  br i1 %t2862, label %argok731, label %arityerr730
arityerr730:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok731:
  %t2863 = call i64 @rt_null_p(i64 %a1)
  %t2864 = icmp ne i64 %t2863, 1
  br i1 %t2864, label %then732, label %else733
then732:
  ret i64 257
else733:
  %t2865 = call i64 @rt_car(i64 %a1)
  %t2866 = call i64 @rt_eqv_p(i64 %a0, i64 %t2865)
  %t2867 = icmp ne i64 %t2866, 1
  br i1 %t2867, label %then734, label %else735
then734:
  %t2868 = call i64 @rt_car(i64 %a1)
  %t2869 = call i64 @rt_cdr(i64 %a1)
  %t2870 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t2870)
  %t2871 = and i64 %t2870, -8
  %t2872 = inttoptr i64 %t2871 to ptr
  %t2873 = load i64, ptr %t2872
  %t2874 = inttoptr i64 %t2873 to ptr
  %t2875 = musttail call fastcc i64 %t2874(i64 %t2870, i64 2, i64 %t2868, i64 %t2869, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2875
else735:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_662"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2880 = icmp eq i64 %argc, 1
  br i1 %t2880, label %argok737, label %arityerr736
arityerr736:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok737:
  %t2881 = and i64 %self, -8
  %t2882 = inttoptr i64 %t2881 to ptr
  %t2883 = getelementptr i64, ptr %t2882, i64 1
  %t2884 = load i64, ptr %t2883
  %t2885 = or i64 %a0, %t2884
  %t2886 = and i64 %t2885, 7
  %t2887 = icmp eq i64 %t2886, 0
  br i1 %t2887, label %fixfast738, label %fixslow739
fixfast738:
  %t2888 = icmp eq i64 %a0, %t2884
  %t2889 = select i1 %t2888, i64 257, i64 1
  br label %fixmerge740
fixslow739:
  %t2890 = call i64 @rt_num_eq(i64 %a0, i64 %t2884)
  br label %fixmerge740
fixmerge740:
  %t2891 = phi i64 [ %t2889, %fixfast738 ], [ %t2890, %fixslow739 ]
  %t2892 = icmp ne i64 %t2891, 1
  br i1 %t2892, label %then741, label %else742
then741:
  %t2893 = and i64 %self, -8
  %t2894 = inttoptr i64 %t2893 to ptr
  %t2895 = getelementptr i64, ptr %t2894, i64 2
  %t2896 = load i64, ptr %t2895
  %t2897 = or i64 %a0, %t2896
  %t2898 = and i64 %t2897, 7
  %t2899 = icmp eq i64 %t2898, 0
  br i1 %t2899, label %fixfast744, label %fixslow745
fixfast744:
  %t2900 = icmp eq i64 %a0, %t2896
  %t2901 = select i1 %t2900, i64 257, i64 1
  br label %fixmerge746
fixslow745:
  %t2902 = call i64 @rt_num_eq(i64 %a0, i64 %t2896)
  br label %fixmerge746
fixmerge746:
  %t2903 = phi i64 [ %t2901, %fixfast744 ], [ %t2902, %fixslow745 ]
  br label %merge743
else742:
  br label %merge743
merge743:
  %t2904 = phi i64 [ %t2903, %fixmerge746 ], [ 1, %else742 ]
  %t2905 = icmp ne i64 %t2904, 1
  br i1 %t2905, label %then747, label %else748
then747:
  ret i64 0
else748:
  %t2906 = and i64 %self, -8
  %t2907 = inttoptr i64 %t2906 to ptr
  %t2908 = getelementptr i64, ptr %t2907, i64 1
  %t2909 = load i64, ptr %t2908
  %t2910 = or i64 %a0, %t2909
  %t2911 = and i64 %t2910, 7
  %t2912 = icmp eq i64 %t2911, 0
  br i1 %t2912, label %fixfast749, label %fixslow750
fixfast749:
  %t2913 = icmp eq i64 %a0, %t2909
  %t2914 = select i1 %t2913, i64 257, i64 1
  br label %fixmerge751
fixslow750:
  %t2915 = call i64 @rt_num_eq(i64 %a0, i64 %t2909)
  br label %fixmerge751
fixmerge751:
  %t2916 = phi i64 [ %t2914, %fixfast749 ], [ %t2915, %fixslow750 ]
  %t2917 = icmp ne i64 %t2916, 1
  br i1 %t2917, label %then752, label %else753
then752:
  ret i64 -8
else753:
  %t2918 = and i64 %self, -8
  %t2919 = inttoptr i64 %t2918 to ptr
  %t2920 = getelementptr i64, ptr %t2919, i64 2
  %t2921 = load i64, ptr %t2920
  %t2922 = or i64 %a0, %t2921
  %t2923 = and i64 %t2922, 7
  %t2924 = icmp eq i64 %t2923, 0
  br i1 %t2924, label %fixfast754, label %fixslow755
fixfast754:
  %t2925 = icmp eq i64 %a0, %t2921
  %t2926 = select i1 %t2925, i64 257, i64 1
  br label %fixmerge756
fixslow755:
  %t2927 = call i64 @rt_num_eq(i64 %a0, i64 %t2921)
  br label %fixmerge756
fixmerge756:
  %t2928 = phi i64 [ %t2926, %fixfast754 ], [ %t2927, %fixslow755 ]
  %t2929 = icmp ne i64 %t2928, 1
  br i1 %t2929, label %then757, label %else758
then757:
  ret i64 8
else758:
  %t2930 = and i64 %self, -8
  %t2931 = inttoptr i64 %t2930 to ptr
  %t2932 = getelementptr i64, ptr %t2931, i64 3
  %t2933 = load i64, ptr %t2932
  %t2934 = call i64 @rt_string_ref(i64 %t2933, i64 %a0)
  %t2935 = call i64 @rt_char_to_integer(i64 %t2934)
  %t2936 = and i64 %self, -8
  %t2937 = inttoptr i64 %t2936 to ptr
  %t2938 = getelementptr i64, ptr %t2937, i64 4
  %t2939 = load i64, ptr %t2938
  %t2940 = call i64 @rt_string_ref(i64 %t2939, i64 %a0)
  %t2941 = call i64 @rt_char_to_integer(i64 %t2940)
  %t2942 = or i64 %t2935, %t2941
  %t2943 = and i64 %t2942, 7
  %t2944 = icmp eq i64 %t2943, 0
  br i1 %t2944, label %fixfast759, label %fixslow760
fixfast759:
  %t2945 = icmp slt i64 %t2935, %t2941
  %t2946 = select i1 %t2945, i64 257, i64 1
  br label %fixmerge761
fixslow760:
  %t2947 = call i64 @rt_lt(i64 %t2935, i64 %t2941)
  br label %fixmerge761
fixmerge761:
  %t2948 = phi i64 [ %t2946, %fixfast759 ], [ %t2947, %fixslow760 ]
  %t2949 = icmp ne i64 %t2948, 1
  br i1 %t2949, label %then762, label %else763
then762:
  ret i64 -8
else763:
  %t2950 = or i64 %t2941, %t2935
  %t2951 = and i64 %t2950, 7
  %t2952 = icmp eq i64 %t2951, 0
  br i1 %t2952, label %fixfast764, label %fixslow765
fixfast764:
  %t2953 = icmp slt i64 %t2941, %t2935
  %t2954 = select i1 %t2953, i64 257, i64 1
  br label %fixmerge766
fixslow765:
  %t2955 = call i64 @rt_lt(i64 %t2941, i64 %t2935)
  br label %fixmerge766
fixmerge766:
  %t2956 = phi i64 [ %t2954, %fixfast764 ], [ %t2955, %fixslow765 ]
  %t2957 = icmp ne i64 %t2956, 1
  br i1 %t2957, label %then767, label %else768
then767:
  ret i64 8
else768:
  %t2958 = or i64 %a0, 8
  %t2959 = and i64 %t2958, 7
  %t2960 = icmp eq i64 %t2959, 0
  br i1 %t2960, label %fixfast769, label %fixslow770
fixfast769:
  %t2961 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t2962 = extractvalue {i64, i1} %t2961, 0
  %t2963 = extractvalue {i64, i1} %t2961, 1
  br i1 %t2963, label %fixslow770, label %fixmerge771
fixslow770:
  %t2964 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge771
fixmerge771:
  %t2965 = phi i64 [ %t2962, %fixfast769 ], [ %t2964, %fixslow770 ]
  %t2966 = musttail call fastcc i64 @"scheme.base:code_662"(i64 %self, i64 1, i64 %t2965, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2966
}

define fastcc i64 @"scheme.base:code:str-cmp"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2967 = icmp eq i64 %argc, 2
  br i1 %t2967, label %argok773, label %arityerr772
arityerr772:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok773:
  %t2968 = call i64 @rt_string_length(i64 %a0)
  %t2969 = call i64 @rt_string_length(i64 %a1)
  %t2970 = call ptr @rt_alloc_words(i64 6)
  %t2971 = ptrtoint ptr %t2970 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_662" to i64), ptr %t2970
  %t2972 = or i64 %t2971, 4
  %t2973 = getelementptr i64, ptr %t2970, i64 1
  store i64 %t2968, ptr %t2973
  %t2974 = getelementptr i64, ptr %t2970, i64 2
  store i64 %t2969, ptr %t2974
  %t2975 = getelementptr i64, ptr %t2970, i64 3
  store i64 %a0, ptr %t2975
  %t2976 = getelementptr i64, ptr %t2970, i64 4
  store i64 %a1, ptr %t2976
  %t2977 = getelementptr i64, ptr %t2970, i64 5
  store i64 %t2972, ptr %t2977
  %t2978 = musttail call fastcc i64 @"scheme.base:code_662"(i64 %t2972, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2978
}

define fastcc i64 @"scheme.base:code:str-chain?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2983 = icmp eq i64 %argc, 3
  br i1 %t2983, label %argok775, label %arityerr774
arityerr774:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok775:
  %t2984 = call i64 @rt_null_p(i64 %a2)
  %t2985 = icmp ne i64 %t2984, 1
  br i1 %t2985, label %then776, label %else777
then776:
  ret i64 257
else777:
  %t2986 = call i64 @rt_car(i64 %a2)
  call void @rt_check_callable(i64 %a0)
  %t2987 = and i64 %a0, -8
  %t2988 = inttoptr i64 %t2987 to ptr
  %t2989 = load i64, ptr %t2988
  %t2990 = inttoptr i64 %t2989 to ptr
  %t2991 = call fastcc i64%t2990(i64 %a0, i64 2, i64 %a1, i64 %t2986, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2992 = icmp ne i64 %t2991, 1
  br i1 %t2992, label %then778, label %else779
then778:
  %t2993 = call i64 @rt_car(i64 %a2)
  %t2994 = call i64 @rt_cdr(i64 %a2)
  %t2995 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t2995)
  %t2996 = and i64 %t2995, -8
  %t2997 = inttoptr i64 %t2996 to ptr
  %t2998 = load i64, ptr %t2997
  %t2999 = inttoptr i64 %t2998 to ptr
  %t3000 = musttail call fastcc i64 %t2999(i64 %t2995, i64 3, i64 %a0, i64 %t2993, i64 %t2994, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3000
else779:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_678"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3005 = icmp eq i64 %argc, 2
  br i1 %t3005, label %argok781, label %arityerr780
arityerr780:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok781:
  %t3006 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t3006)
  %t3007 = and i64 %t3006, -8
  %t3008 = inttoptr i64 %t3007 to ptr
  %t3009 = load i64, ptr %t3008
  %t3010 = inttoptr i64 %t3009 to ptr
  %t3011 = call fastcc i64%t3010(i64 %t3006, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3012 = or i64 %t3011, 0
  %t3013 = and i64 %t3012, 7
  %t3014 = icmp eq i64 %t3013, 0
  br i1 %t3014, label %fixfast782, label %fixslow783
fixfast782:
  %t3015 = icmp slt i64 %t3011, 0
  %t3016 = select i1 %t3015, i64 257, i64 1
  br label %fixmerge784
fixslow783:
  %t3017 = call i64 @rt_lt(i64 %t3011, i64 0)
  br label %fixmerge784
fixmerge784:
  %t3018 = phi i64 [ %t3016, %fixfast782 ], [ %t3017, %fixslow783 ]
  ret i64 %t3018
}

define fastcc i64 @"scheme.base:code:string<?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3019 = icmp sge i64 %argc, 2
  br i1 %t3019, label %argok786, label %arityerr785
arityerr785:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok786:
  %t3020 = call ptr @rt_alloc_words(i64 8)
  %t3021 = getelementptr i64, ptr %t3020, i64 0
  store i64 %a0, ptr %t3021
  %t3022 = getelementptr i64, ptr %t3020, i64 1
  store i64 %a1, ptr %t3022
  %t3023 = getelementptr i64, ptr %t3020, i64 2
  store i64 %a2, ptr %t3023
  %t3024 = getelementptr i64, ptr %t3020, i64 3
  store i64 %a3, ptr %t3024
  %t3025 = getelementptr i64, ptr %t3020, i64 4
  store i64 %a4, ptr %t3025
  %t3026 = getelementptr i64, ptr %t3020, i64 5
  store i64 %a5, ptr %t3026
  %t3027 = getelementptr i64, ptr %t3020, i64 6
  store i64 %a6, ptr %t3027
  %t3028 = getelementptr i64, ptr %t3020, i64 7
  store i64 %a7, ptr %t3028
  %t3029 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3020, ptr %overflow)
  %t3030 = call ptr @rt_alloc_words(i64 1)
  %t3031 = ptrtoint ptr %t3030 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_678" to i64), ptr %t3030
  %t3032 = or i64 %t3031, 4
  %t3033 = call i64 @rt_cons(i64 %a1, i64 %t3029)
  %t3034 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3034)
  %t3035 = and i64 %t3034, -8
  %t3036 = inttoptr i64 %t3035 to ptr
  %t3037 = load i64, ptr %t3036
  %t3038 = inttoptr i64 %t3037 to ptr
  %t3039 = musttail call fastcc i64 %t3038(i64 %t3034, i64 3, i64 %t3032, i64 %a0, i64 %t3033, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3039
}

define fastcc i64 @"scheme.base:code_690"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3044 = icmp eq i64 %argc, 2
  br i1 %t3044, label %argok788, label %arityerr787
arityerr787:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok788:
  %t3045 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t3045)
  %t3046 = and i64 %t3045, -8
  %t3047 = inttoptr i64 %t3046 to ptr
  %t3048 = load i64, ptr %t3047
  %t3049 = inttoptr i64 %t3048 to ptr
  %t3050 = call fastcc i64%t3049(i64 %t3045, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3051 = or i64 0, %t3050
  %t3052 = and i64 %t3051, 7
  %t3053 = icmp eq i64 %t3052, 0
  br i1 %t3053, label %fixfast789, label %fixslow790
fixfast789:
  %t3054 = icmp slt i64 0, %t3050
  %t3055 = select i1 %t3054, i64 257, i64 1
  br label %fixmerge791
fixslow790:
  %t3056 = call i64 @rt_lt(i64 0, i64 %t3050)
  br label %fixmerge791
fixmerge791:
  %t3057 = phi i64 [ %t3055, %fixfast789 ], [ %t3056, %fixslow790 ]
  ret i64 %t3057
}

define fastcc i64 @"scheme.base:code:string>?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3058 = icmp sge i64 %argc, 2
  br i1 %t3058, label %argok793, label %arityerr792
arityerr792:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok793:
  %t3059 = call ptr @rt_alloc_words(i64 8)
  %t3060 = getelementptr i64, ptr %t3059, i64 0
  store i64 %a0, ptr %t3060
  %t3061 = getelementptr i64, ptr %t3059, i64 1
  store i64 %a1, ptr %t3061
  %t3062 = getelementptr i64, ptr %t3059, i64 2
  store i64 %a2, ptr %t3062
  %t3063 = getelementptr i64, ptr %t3059, i64 3
  store i64 %a3, ptr %t3063
  %t3064 = getelementptr i64, ptr %t3059, i64 4
  store i64 %a4, ptr %t3064
  %t3065 = getelementptr i64, ptr %t3059, i64 5
  store i64 %a5, ptr %t3065
  %t3066 = getelementptr i64, ptr %t3059, i64 6
  store i64 %a6, ptr %t3066
  %t3067 = getelementptr i64, ptr %t3059, i64 7
  store i64 %a7, ptr %t3067
  %t3068 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3059, ptr %overflow)
  %t3069 = call ptr @rt_alloc_words(i64 1)
  %t3070 = ptrtoint ptr %t3069 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_690" to i64), ptr %t3069
  %t3071 = or i64 %t3070, 4
  %t3072 = call i64 @rt_cons(i64 %a1, i64 %t3068)
  %t3073 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3073)
  %t3074 = and i64 %t3073, -8
  %t3075 = inttoptr i64 %t3074 to ptr
  %t3076 = load i64, ptr %t3075
  %t3077 = inttoptr i64 %t3076 to ptr
  %t3078 = musttail call fastcc i64 %t3077(i64 %t3073, i64 3, i64 %t3071, i64 %a0, i64 %t3072, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3078
}

define fastcc i64 @"scheme.base:code_702"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3083 = icmp eq i64 %argc, 2
  br i1 %t3083, label %argok795, label %arityerr794
arityerr794:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok795:
  %t3084 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t3084)
  %t3085 = and i64 %t3084, -8
  %t3086 = inttoptr i64 %t3085 to ptr
  %t3087 = load i64, ptr %t3086
  %t3088 = inttoptr i64 %t3087 to ptr
  %t3089 = call fastcc i64%t3088(i64 %t3084, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3090 = or i64 0, %t3089
  %t3091 = and i64 %t3090, 7
  %t3092 = icmp eq i64 %t3091, 0
  br i1 %t3092, label %fixfast796, label %fixslow797
fixfast796:
  %t3093 = icmp slt i64 0, %t3089
  %t3094 = select i1 %t3093, i64 257, i64 1
  br label %fixmerge798
fixslow797:
  %t3095 = call i64 @rt_lt(i64 0, i64 %t3089)
  br label %fixmerge798
fixmerge798:
  %t3096 = phi i64 [ %t3094, %fixfast796 ], [ %t3095, %fixslow797 ]
  %t3097 = call i64 @rt_not(i64 %t3096)
  ret i64 %t3097
}

define fastcc i64 @"scheme.base:code:string<=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3098 = icmp sge i64 %argc, 2
  br i1 %t3098, label %argok800, label %arityerr799
arityerr799:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok800:
  %t3099 = call ptr @rt_alloc_words(i64 8)
  %t3100 = getelementptr i64, ptr %t3099, i64 0
  store i64 %a0, ptr %t3100
  %t3101 = getelementptr i64, ptr %t3099, i64 1
  store i64 %a1, ptr %t3101
  %t3102 = getelementptr i64, ptr %t3099, i64 2
  store i64 %a2, ptr %t3102
  %t3103 = getelementptr i64, ptr %t3099, i64 3
  store i64 %a3, ptr %t3103
  %t3104 = getelementptr i64, ptr %t3099, i64 4
  store i64 %a4, ptr %t3104
  %t3105 = getelementptr i64, ptr %t3099, i64 5
  store i64 %a5, ptr %t3105
  %t3106 = getelementptr i64, ptr %t3099, i64 6
  store i64 %a6, ptr %t3106
  %t3107 = getelementptr i64, ptr %t3099, i64 7
  store i64 %a7, ptr %t3107
  %t3108 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3099, ptr %overflow)
  %t3109 = call ptr @rt_alloc_words(i64 1)
  %t3110 = ptrtoint ptr %t3109 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_702" to i64), ptr %t3109
  %t3111 = or i64 %t3110, 4
  %t3112 = call i64 @rt_cons(i64 %a1, i64 %t3108)
  %t3113 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3113)
  %t3114 = and i64 %t3113, -8
  %t3115 = inttoptr i64 %t3114 to ptr
  %t3116 = load i64, ptr %t3115
  %t3117 = inttoptr i64 %t3116 to ptr
  %t3118 = musttail call fastcc i64 %t3117(i64 %t3113, i64 3, i64 %t3111, i64 %a0, i64 %t3112, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3118
}

define fastcc i64 @"scheme.base:code_714"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3123 = icmp eq i64 %argc, 2
  br i1 %t3123, label %argok802, label %arityerr801
arityerr801:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok802:
  %t3124 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t3124)
  %t3125 = and i64 %t3124, -8
  %t3126 = inttoptr i64 %t3125 to ptr
  %t3127 = load i64, ptr %t3126
  %t3128 = inttoptr i64 %t3127 to ptr
  %t3129 = call fastcc i64%t3128(i64 %t3124, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3130 = or i64 %t3129, 0
  %t3131 = and i64 %t3130, 7
  %t3132 = icmp eq i64 %t3131, 0
  br i1 %t3132, label %fixfast803, label %fixslow804
fixfast803:
  %t3133 = icmp slt i64 %t3129, 0
  %t3134 = select i1 %t3133, i64 257, i64 1
  br label %fixmerge805
fixslow804:
  %t3135 = call i64 @rt_lt(i64 %t3129, i64 0)
  br label %fixmerge805
fixmerge805:
  %t3136 = phi i64 [ %t3134, %fixfast803 ], [ %t3135, %fixslow804 ]
  %t3137 = call i64 @rt_not(i64 %t3136)
  ret i64 %t3137
}

define fastcc i64 @"scheme.base:code:string>=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3138 = icmp sge i64 %argc, 2
  br i1 %t3138, label %argok807, label %arityerr806
arityerr806:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok807:
  %t3139 = call ptr @rt_alloc_words(i64 8)
  %t3140 = getelementptr i64, ptr %t3139, i64 0
  store i64 %a0, ptr %t3140
  %t3141 = getelementptr i64, ptr %t3139, i64 1
  store i64 %a1, ptr %t3141
  %t3142 = getelementptr i64, ptr %t3139, i64 2
  store i64 %a2, ptr %t3142
  %t3143 = getelementptr i64, ptr %t3139, i64 3
  store i64 %a3, ptr %t3143
  %t3144 = getelementptr i64, ptr %t3139, i64 4
  store i64 %a4, ptr %t3144
  %t3145 = getelementptr i64, ptr %t3139, i64 5
  store i64 %a5, ptr %t3145
  %t3146 = getelementptr i64, ptr %t3139, i64 6
  store i64 %a6, ptr %t3146
  %t3147 = getelementptr i64, ptr %t3139, i64 7
  store i64 %a7, ptr %t3147
  %t3148 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3139, ptr %overflow)
  %t3149 = call ptr @rt_alloc_words(i64 1)
  %t3150 = ptrtoint ptr %t3149 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_714" to i64), ptr %t3149
  %t3151 = or i64 %t3150, 4
  %t3152 = call i64 @rt_cons(i64 %a1, i64 %t3148)
  %t3153 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3153)
  %t3154 = and i64 %t3153, -8
  %t3155 = inttoptr i64 %t3154 to ptr
  %t3156 = load i64, ptr %t3155
  %t3157 = inttoptr i64 %t3156 to ptr
  %t3158 = musttail call fastcc i64 %t3157(i64 %t3153, i64 3, i64 %t3151, i64 %a0, i64 %t3152, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3158
}

define fastcc i64 @"scheme.base:code_729"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3163 = icmp eq i64 %argc, 2
  br i1 %t3163, label %argok809, label %arityerr808
arityerr808:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok809:
  %t3164 = and i64 %self, -8
  %t3165 = inttoptr i64 %t3164 to ptr
  %t3166 = getelementptr i64, ptr %t3165, i64 1
  %t3167 = load i64, ptr %t3166
  %t3168 = or i64 %a0, %t3167
  %t3169 = and i64 %t3168, 7
  %t3170 = icmp eq i64 %t3169, 0
  br i1 %t3170, label %fixfast810, label %fixslow811
fixfast810:
  %t3171 = icmp slt i64 %a0, %t3167
  %t3172 = select i1 %t3171, i64 257, i64 1
  br label %fixmerge812
fixslow811:
  %t3173 = call i64 @rt_lt(i64 %a0, i64 %t3167)
  br label %fixmerge812
fixmerge812:
  %t3174 = phi i64 [ %t3172, %fixfast810 ], [ %t3173, %fixslow811 ]
  %t3175 = icmp ne i64 %t3174, 1
  br i1 %t3175, label %then813, label %else814
then813:
  ret i64 %a1
else814:
  %t3176 = or i64 %a0, 8
  %t3177 = and i64 %t3176, 7
  %t3178 = icmp eq i64 %t3177, 0
  br i1 %t3178, label %fixfast815, label %fixslow816
fixfast815:
  %t3179 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t3180 = extractvalue {i64, i1} %t3179, 0
  %t3181 = extractvalue {i64, i1} %t3179, 1
  br i1 %t3181, label %fixslow816, label %fixmerge817
fixslow816:
  %t3182 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge817
fixmerge817:
  %t3183 = phi i64 [ %t3180, %fixfast815 ], [ %t3182, %fixslow816 ]
  %t3184 = and i64 %self, -8
  %t3185 = inttoptr i64 %t3184 to ptr
  %t3186 = getelementptr i64, ptr %t3185, i64 3
  %t3187 = load i64, ptr %t3186
  %t3188 = call i64 @rt_vector_ref(i64 %t3187, i64 %a0)
  %t3189 = call i64 @rt_cons(i64 %t3188, i64 %a1)
  %t3190 = musttail call fastcc i64 @"scheme.base:code_729"(i64 %self, i64 2, i64 %t3183, i64 %t3189, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3190
}

define fastcc i64 @"scheme.base:code:vector->list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3191 = icmp sge i64 %argc, 1
  br i1 %t3191, label %argok819, label %arityerr818
arityerr818:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok819:
  %t3192 = call ptr @rt_alloc_words(i64 8)
  %t3193 = getelementptr i64, ptr %t3192, i64 0
  store i64 %a0, ptr %t3193
  %t3194 = getelementptr i64, ptr %t3192, i64 1
  store i64 %a1, ptr %t3194
  %t3195 = getelementptr i64, ptr %t3192, i64 2
  store i64 %a2, ptr %t3195
  %t3196 = getelementptr i64, ptr %t3192, i64 3
  store i64 %a3, ptr %t3196
  %t3197 = getelementptr i64, ptr %t3192, i64 4
  store i64 %a4, ptr %t3197
  %t3198 = getelementptr i64, ptr %t3192, i64 5
  store i64 %a5, ptr %t3198
  %t3199 = getelementptr i64, ptr %t3192, i64 6
  store i64 %a6, ptr %t3199
  %t3200 = getelementptr i64, ptr %t3192, i64 7
  store i64 %a7, ptr %t3200
  %t3201 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t3192, ptr %overflow)
  %t3202 = call i64 @rt_vector_length(i64 %a0)
  %t3203 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t3203)
  %t3204 = and i64 %t3203, -8
  %t3205 = inttoptr i64 %t3204 to ptr
  %t3206 = load i64, ptr %t3205
  %t3207 = inttoptr i64 %t3206 to ptr
  %t3208 = call fastcc i64%t3207(i64 %t3203, i64 1, i64 %t3201, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3209 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t3209)
  %t3210 = and i64 %t3209, -8
  %t3211 = inttoptr i64 %t3210 to ptr
  %t3212 = load i64, ptr %t3211
  %t3213 = inttoptr i64 %t3212 to ptr
  %t3214 = call fastcc i64%t3213(i64 %t3209, i64 2, i64 %t3201, i64 %t3202, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3215 = call i64 @rt_intern(ptr @.str.sym.17)
  %t3216 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t3216)
  %t3217 = and i64 %t3216, -8
  %t3218 = inttoptr i64 %t3217 to ptr
  %t3219 = load i64, ptr %t3218
  %t3220 = inttoptr i64 %t3219 to ptr
  %t3221 = call fastcc i64%t3220(i64 %t3216, i64 4, i64 %t3215, i64 %t3208, i64 %t3214, i64 %t3202, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3222 = call ptr @rt_alloc_words(i64 4)
  %t3223 = ptrtoint ptr %t3222 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_729" to i64), ptr %t3222
  %t3224 = or i64 %t3223, 4
  %t3225 = getelementptr i64, ptr %t3222, i64 1
  store i64 %t3208, ptr %t3225
  %t3226 = getelementptr i64, ptr %t3222, i64 2
  store i64 %t3224, ptr %t3226
  %t3227 = getelementptr i64, ptr %t3222, i64 3
  store i64 %a0, ptr %t3227
  %t3228 = or i64 %t3214, 8
  %t3229 = and i64 %t3228, 7
  %t3230 = icmp eq i64 %t3229, 0
  br i1 %t3230, label %fixfast820, label %fixslow821
fixfast820:
  %t3231 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3214, i64 8)
  %t3232 = extractvalue {i64, i1} %t3231, 0
  %t3233 = extractvalue {i64, i1} %t3231, 1
  br i1 %t3233, label %fixslow821, label %fixmerge822
fixslow821:
  %t3234 = call i64 @rt_sub(i64 %t3214, i64 8)
  br label %fixmerge822
fixmerge822:
  %t3235 = phi i64 [ %t3232, %fixfast820 ], [ %t3234, %fixslow821 ]
  %t3236 = musttail call fastcc i64 @"scheme.base:code_729"(i64 %t3224, i64 2, i64 %t3235, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3236
}

define fastcc i64 @"scheme.base:code_744"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3241 = icmp eq i64 %argc, 1
  br i1 %t3241, label %argok824, label %arityerr823
arityerr823:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok824:
  %t3242 = and i64 %self, -8
  %t3243 = inttoptr i64 %t3242 to ptr
  %t3244 = getelementptr i64, ptr %t3243, i64 1
  %t3245 = load i64, ptr %t3244
  %t3246 = or i64 %a0, %t3245
  %t3247 = and i64 %t3246, 7
  %t3248 = icmp eq i64 %t3247, 0
  br i1 %t3248, label %fixfast825, label %fixslow826
fixfast825:
  %t3249 = icmp eq i64 %a0, %t3245
  %t3250 = select i1 %t3249, i64 257, i64 1
  br label %fixmerge827
fixslow826:
  %t3251 = call i64 @rt_num_eq(i64 %a0, i64 %t3245)
  br label %fixmerge827
fixmerge827:
  %t3252 = phi i64 [ %t3250, %fixfast825 ], [ %t3251, %fixslow826 ]
  %t3253 = icmp ne i64 %t3252, 1
  br i1 %t3253, label %then828, label %else829
then828:
  %t3254 = and i64 %self, -8
  %t3255 = inttoptr i64 %t3254 to ptr
  %t3256 = getelementptr i64, ptr %t3255, i64 2
  %t3257 = load i64, ptr %t3256
  ret i64 %t3257
else829:
  %t3258 = and i64 %self, -8
  %t3259 = inttoptr i64 %t3258 to ptr
  %t3260 = getelementptr i64, ptr %t3259, i64 2
  %t3261 = load i64, ptr %t3260
  %t3262 = and i64 %self, -8
  %t3263 = inttoptr i64 %t3262 to ptr
  %t3264 = getelementptr i64, ptr %t3263, i64 3
  %t3265 = load i64, ptr %t3264
  %t3266 = or i64 %a0, %t3265
  %t3267 = and i64 %t3266, 7
  %t3268 = icmp eq i64 %t3267, 0
  br i1 %t3268, label %fixfast830, label %fixslow831
fixfast830:
  %t3269 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t3265)
  %t3270 = extractvalue {i64, i1} %t3269, 0
  %t3271 = extractvalue {i64, i1} %t3269, 1
  br i1 %t3271, label %fixslow831, label %fixmerge832
fixslow831:
  %t3272 = call i64 @rt_sub(i64 %a0, i64 %t3265)
  br label %fixmerge832
fixmerge832:
  %t3273 = phi i64 [ %t3270, %fixfast830 ], [ %t3272, %fixslow831 ]
  %t3274 = and i64 %self, -8
  %t3275 = inttoptr i64 %t3274 to ptr
  %t3276 = getelementptr i64, ptr %t3275, i64 4
  %t3277 = load i64, ptr %t3276
  %t3278 = call i64 @rt_vector_ref(i64 %t3277, i64 %a0)
  %t3279 = call i64 @rt_vector_set(i64 %t3261, i64 %t3273, i64 %t3278)
  %t3280 = or i64 %a0, 8
  %t3281 = and i64 %t3280, 7
  %t3282 = icmp eq i64 %t3281, 0
  br i1 %t3282, label %fixfast833, label %fixslow834
fixfast833:
  %t3283 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3284 = extractvalue {i64, i1} %t3283, 0
  %t3285 = extractvalue {i64, i1} %t3283, 1
  br i1 %t3285, label %fixslow834, label %fixmerge835
fixslow834:
  %t3286 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge835
fixmerge835:
  %t3287 = phi i64 [ %t3284, %fixfast833 ], [ %t3286, %fixslow834 ]
  %t3288 = musttail call fastcc i64 @"scheme.base:code_744"(i64 %self, i64 1, i64 %t3287, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3288
}

define fastcc i64 @"scheme.base:code:vector-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3289 = icmp sge i64 %argc, 1
  br i1 %t3289, label %argok837, label %arityerr836
arityerr836:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok837:
  %t3290 = call ptr @rt_alloc_words(i64 8)
  %t3291 = getelementptr i64, ptr %t3290, i64 0
  store i64 %a0, ptr %t3291
  %t3292 = getelementptr i64, ptr %t3290, i64 1
  store i64 %a1, ptr %t3292
  %t3293 = getelementptr i64, ptr %t3290, i64 2
  store i64 %a2, ptr %t3293
  %t3294 = getelementptr i64, ptr %t3290, i64 3
  store i64 %a3, ptr %t3294
  %t3295 = getelementptr i64, ptr %t3290, i64 4
  store i64 %a4, ptr %t3295
  %t3296 = getelementptr i64, ptr %t3290, i64 5
  store i64 %a5, ptr %t3296
  %t3297 = getelementptr i64, ptr %t3290, i64 6
  store i64 %a6, ptr %t3297
  %t3298 = getelementptr i64, ptr %t3290, i64 7
  store i64 %a7, ptr %t3298
  %t3299 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t3290, ptr %overflow)
  %t3300 = call i64 @rt_vector_length(i64 %a0)
  %t3301 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t3301)
  %t3302 = and i64 %t3301, -8
  %t3303 = inttoptr i64 %t3302 to ptr
  %t3304 = load i64, ptr %t3303
  %t3305 = inttoptr i64 %t3304 to ptr
  %t3306 = call fastcc i64%t3305(i64 %t3301, i64 1, i64 %t3299, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3307 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t3307)
  %t3308 = and i64 %t3307, -8
  %t3309 = inttoptr i64 %t3308 to ptr
  %t3310 = load i64, ptr %t3309
  %t3311 = inttoptr i64 %t3310 to ptr
  %t3312 = call fastcc i64%t3311(i64 %t3307, i64 2, i64 %t3299, i64 %t3300, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3313 = call i64 @rt_intern(ptr @.str.sym.18)
  %t3314 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t3314)
  %t3315 = and i64 %t3314, -8
  %t3316 = inttoptr i64 %t3315 to ptr
  %t3317 = load i64, ptr %t3316
  %t3318 = inttoptr i64 %t3317 to ptr
  %t3319 = call fastcc i64%t3318(i64 %t3314, i64 4, i64 %t3313, i64 %t3306, i64 %t3312, i64 %t3300, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3320 = or i64 %t3312, %t3306
  %t3321 = and i64 %t3320, 7
  %t3322 = icmp eq i64 %t3321, 0
  br i1 %t3322, label %fixfast838, label %fixslow839
fixfast838:
  %t3323 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3312, i64 %t3306)
  %t3324 = extractvalue {i64, i1} %t3323, 0
  %t3325 = extractvalue {i64, i1} %t3323, 1
  br i1 %t3325, label %fixslow839, label %fixmerge840
fixslow839:
  %t3326 = call i64 @rt_sub(i64 %t3312, i64 %t3306)
  br label %fixmerge840
fixmerge840:
  %t3327 = phi i64 [ %t3324, %fixfast838 ], [ %t3326, %fixslow839 ]
  %t3328 = call i64 @rt_make_vector(i64 %t3327, i64 0)
  %t3329 = call ptr @rt_alloc_words(i64 6)
  %t3330 = ptrtoint ptr %t3329 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_744" to i64), ptr %t3329
  %t3331 = or i64 %t3330, 4
  %t3332 = getelementptr i64, ptr %t3329, i64 1
  store i64 %t3312, ptr %t3332
  %t3333 = getelementptr i64, ptr %t3329, i64 2
  store i64 %t3328, ptr %t3333
  %t3334 = getelementptr i64, ptr %t3329, i64 3
  store i64 %t3306, ptr %t3334
  %t3335 = getelementptr i64, ptr %t3329, i64 4
  store i64 %a0, ptr %t3335
  %t3336 = getelementptr i64, ptr %t3329, i64 5
  store i64 %t3331, ptr %t3336
  %t3337 = musttail call fastcc i64 @"scheme.base:code_744"(i64 %t3331, i64 1, i64 %t3306, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3337
}

define fastcc i64 @"scheme.base:code_762"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3342 = icmp eq i64 %argc, 1
  br i1 %t3342, label %argok842, label %arityerr841
arityerr841:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok842:
  %t3343 = and i64 %self, -8
  %t3344 = inttoptr i64 %t3343 to ptr
  %t3345 = getelementptr i64, ptr %t3344, i64 1
  %t3346 = load i64, ptr %t3345
  %t3347 = or i64 %a0, %t3346
  %t3348 = and i64 %t3347, 7
  %t3349 = icmp eq i64 %t3348, 0
  br i1 %t3349, label %fixfast843, label %fixslow844
fixfast843:
  %t3350 = icmp eq i64 %a0, %t3346
  %t3351 = select i1 %t3350, i64 257, i64 1
  br label %fixmerge845
fixslow844:
  %t3352 = call i64 @rt_num_eq(i64 %a0, i64 %t3346)
  br label %fixmerge845
fixmerge845:
  %t3353 = phi i64 [ %t3351, %fixfast843 ], [ %t3352, %fixslow844 ]
  %t3354 = icmp ne i64 %t3353, 1
  br i1 %t3354, label %then846, label %else847
then846:
  %t3355 = and i64 %self, -8
  %t3356 = inttoptr i64 %t3355 to ptr
  %t3357 = getelementptr i64, ptr %t3356, i64 3
  %t3358 = load i64, ptr %t3357
  %t3359 = call i64 @rt_cdr(i64 %t3358)
  %t3360 = and i64 %self, -8
  %t3361 = inttoptr i64 %t3360 to ptr
  %t3362 = getelementptr i64, ptr %t3361, i64 4
  %t3363 = load i64, ptr %t3362
  %t3364 = and i64 %self, -8
  %t3365 = inttoptr i64 %t3364 to ptr
  %t3366 = getelementptr i64, ptr %t3365, i64 1
  %t3367 = load i64, ptr %t3366
  %t3368 = or i64 %t3363, %t3367
  %t3369 = and i64 %t3368, 7
  %t3370 = icmp eq i64 %t3369, 0
  br i1 %t3370, label %fixfast848, label %fixslow849
fixfast848:
  %t3371 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3363, i64 %t3367)
  %t3372 = extractvalue {i64, i1} %t3371, 0
  %t3373 = extractvalue {i64, i1} %t3371, 1
  br i1 %t3373, label %fixslow849, label %fixmerge850
fixslow849:
  %t3374 = call i64 @rt_add(i64 %t3363, i64 %t3367)
  br label %fixmerge850
fixmerge850:
  %t3375 = phi i64 [ %t3372, %fixfast848 ], [ %t3374, %fixslow849 ]
  %t3376 = and i64 %self, -8
  %t3377 = inttoptr i64 %t3376 to ptr
  %t3378 = getelementptr i64, ptr %t3377, i64 2
  %t3379 = load i64, ptr %t3378
  %t3380 = musttail call fastcc i64 @"scheme.base:code_760"(i64 %t3379, i64 2, i64 %t3359, i64 %t3375, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3380
else847:
  %t3381 = and i64 %self, -8
  %t3382 = inttoptr i64 %t3381 to ptr
  %t3383 = getelementptr i64, ptr %t3382, i64 5
  %t3384 = load i64, ptr %t3383
  %t3385 = and i64 %self, -8
  %t3386 = inttoptr i64 %t3385 to ptr
  %t3387 = getelementptr i64, ptr %t3386, i64 4
  %t3388 = load i64, ptr %t3387
  %t3389 = or i64 %t3388, %a0
  %t3390 = and i64 %t3389, 7
  %t3391 = icmp eq i64 %t3390, 0
  br i1 %t3391, label %fixfast851, label %fixslow852
fixfast851:
  %t3392 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3388, i64 %a0)
  %t3393 = extractvalue {i64, i1} %t3392, 0
  %t3394 = extractvalue {i64, i1} %t3392, 1
  br i1 %t3394, label %fixslow852, label %fixmerge853
fixslow852:
  %t3395 = call i64 @rt_add(i64 %t3388, i64 %a0)
  br label %fixmerge853
fixmerge853:
  %t3396 = phi i64 [ %t3393, %fixfast851 ], [ %t3395, %fixslow852 ]
  %t3397 = and i64 %self, -8
  %t3398 = inttoptr i64 %t3397 to ptr
  %t3399 = getelementptr i64, ptr %t3398, i64 6
  %t3400 = load i64, ptr %t3399
  %t3401 = call i64 @rt_vector_ref(i64 %t3400, i64 %a0)
  %t3402 = call i64 @rt_vector_set(i64 %t3384, i64 %t3396, i64 %t3401)
  %t3403 = or i64 %a0, 8
  %t3404 = and i64 %t3403, 7
  %t3405 = icmp eq i64 %t3404, 0
  br i1 %t3405, label %fixfast854, label %fixslow855
fixfast854:
  %t3406 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3407 = extractvalue {i64, i1} %t3406, 0
  %t3408 = extractvalue {i64, i1} %t3406, 1
  br i1 %t3408, label %fixslow855, label %fixmerge856
fixslow855:
  %t3409 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge856
fixmerge856:
  %t3410 = phi i64 [ %t3407, %fixfast854 ], [ %t3409, %fixslow855 ]
  %t3411 = musttail call fastcc i64 @"scheme.base:code_762"(i64 %self, i64 1, i64 %t3410, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3411
}

define fastcc i64 @"scheme.base:code_760"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3412 = icmp eq i64 %argc, 2
  br i1 %t3412, label %argok858, label %arityerr857
arityerr857:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok858:
  %t3413 = call i64 @rt_null_p(i64 %a0)
  %t3414 = icmp ne i64 %t3413, 1
  br i1 %t3414, label %then859, label %else860
then859:
  %t3415 = and i64 %self, -8
  %t3416 = inttoptr i64 %t3415 to ptr
  %t3417 = getelementptr i64, ptr %t3416, i64 1
  %t3418 = load i64, ptr %t3417
  ret i64 %t3418
else860:
  %t3419 = call i64 @rt_car(i64 %a0)
  %t3420 = call i64 @rt_vector_length(i64 %t3419)
  %t3421 = call ptr @rt_alloc_words(i64 8)
  %t3422 = ptrtoint ptr %t3421 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_762" to i64), ptr %t3421
  %t3423 = or i64 %t3422, 4
  %t3424 = getelementptr i64, ptr %t3421, i64 1
  store i64 %t3420, ptr %t3424
  %t3425 = and i64 %self, -8
  %t3426 = inttoptr i64 %t3425 to ptr
  %t3427 = getelementptr i64, ptr %t3426, i64 2
  %t3428 = load i64, ptr %t3427
  %t3429 = getelementptr i64, ptr %t3421, i64 2
  store i64 %t3428, ptr %t3429
  %t3430 = getelementptr i64, ptr %t3421, i64 3
  store i64 %a0, ptr %t3430
  %t3431 = getelementptr i64, ptr %t3421, i64 4
  store i64 %a1, ptr %t3431
  %t3432 = and i64 %self, -8
  %t3433 = inttoptr i64 %t3432 to ptr
  %t3434 = getelementptr i64, ptr %t3433, i64 1
  %t3435 = load i64, ptr %t3434
  %t3436 = getelementptr i64, ptr %t3421, i64 5
  store i64 %t3435, ptr %t3436
  %t3437 = getelementptr i64, ptr %t3421, i64 6
  store i64 %t3419, ptr %t3437
  %t3438 = getelementptr i64, ptr %t3421, i64 7
  store i64 %t3423, ptr %t3438
  %t3439 = musttail call fastcc i64 @"scheme.base:code_762"(i64 %t3423, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3439
}

define fastcc i64 @"scheme.base:code:vector-append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3440 = icmp sge i64 %argc, 0
  br i1 %t3440, label %argok862, label %arityerr861
arityerr861:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok862:
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
  %t3450 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t3441, ptr %overflow)
  %t3451 = load i64, ptr @"scheme.base:vec-total"
  call void @rt_check_callable(i64 %t3451)
  %t3452 = and i64 %t3451, -8
  %t3453 = inttoptr i64 %t3452 to ptr
  %t3454 = load i64, ptr %t3453
  %t3455 = inttoptr i64 %t3454 to ptr
  %t3456 = call fastcc i64%t3455(i64 %t3451, i64 1, i64 %t3450, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3457 = call i64 @rt_make_vector(i64 %t3456, i64 0)
  %t3458 = call ptr @rt_alloc_words(i64 3)
  %t3459 = ptrtoint ptr %t3458 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_760" to i64), ptr %t3458
  %t3460 = or i64 %t3459, 4
  %t3461 = getelementptr i64, ptr %t3458, i64 1
  store i64 %t3457, ptr %t3461
  %t3462 = getelementptr i64, ptr %t3458, i64 2
  store i64 %t3460, ptr %t3462
  %t3463 = musttail call fastcc i64 @"scheme.base:code_760"(i64 %t3460, i64 2, i64 %t3450, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3463
}

define fastcc i64 @"scheme.base:code:vec-total"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3468 = icmp eq i64 %argc, 1
  br i1 %t3468, label %argok864, label %arityerr863
arityerr863:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok864:
  %t3469 = call i64 @rt_null_p(i64 %a0)
  %t3470 = icmp ne i64 %t3469, 1
  br i1 %t3470, label %then865, label %else866
then865:
  ret i64 0
else866:
  %t3471 = call i64 @rt_car(i64 %a0)
  %t3472 = call i64 @rt_vector_length(i64 %t3471)
  %t3473 = call i64 @rt_cdr(i64 %a0)
  %t3474 = load i64, ptr @"scheme.base:vec-total"
  call void @rt_check_callable(i64 %t3474)
  %t3475 = and i64 %t3474, -8
  %t3476 = inttoptr i64 %t3475 to ptr
  %t3477 = load i64, ptr %t3476
  %t3478 = inttoptr i64 %t3477 to ptr
  %t3479 = call fastcc i64%t3478(i64 %t3474, i64 1, i64 %t3473, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3480 = or i64 %t3472, %t3479
  %t3481 = and i64 %t3480, 7
  %t3482 = icmp eq i64 %t3481, 0
  br i1 %t3482, label %fixfast867, label %fixslow868
fixfast867:
  %t3483 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3472, i64 %t3479)
  %t3484 = extractvalue {i64, i1} %t3483, 0
  %t3485 = extractvalue {i64, i1} %t3483, 1
  br i1 %t3485, label %fixslow868, label %fixmerge869
fixslow868:
  %t3486 = call i64 @rt_add(i64 %t3472, i64 %t3479)
  br label %fixmerge869
fixmerge869:
  %t3487 = phi i64 [ %t3484, %fixfast867 ], [ %t3486, %fixslow868 ]
  ret i64 %t3487
}

define fastcc i64 @"scheme.base:code_779"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3492 = icmp eq i64 %argc, 1
  br i1 %t3492, label %argok871, label %arityerr870
arityerr870:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok871:
  %t3493 = and i64 %self, -8
  %t3494 = inttoptr i64 %t3493 to ptr
  %t3495 = getelementptr i64, ptr %t3494, i64 1
  %t3496 = load i64, ptr %t3495
  %t3497 = or i64 %a0, %t3496
  %t3498 = and i64 %t3497, 7
  %t3499 = icmp eq i64 %t3498, 0
  br i1 %t3499, label %fixfast872, label %fixslow873
fixfast872:
  %t3500 = icmp eq i64 %a0, %t3496
  %t3501 = select i1 %t3500, i64 257, i64 1
  br label %fixmerge874
fixslow873:
  %t3502 = call i64 @rt_num_eq(i64 %a0, i64 %t3496)
  br label %fixmerge874
fixmerge874:
  %t3503 = phi i64 [ %t3501, %fixfast872 ], [ %t3502, %fixslow873 ]
  %t3504 = icmp ne i64 %t3503, 1
  br i1 %t3504, label %then875, label %else876
then875:
  %t3505 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t3505)
  %t3506 = and i64 %t3505, -8
  %t3507 = inttoptr i64 %t3506 to ptr
  %t3508 = load i64, ptr %t3507
  %t3509 = inttoptr i64 %t3508 to ptr
  %t3510 = musttail call fastcc i64 %t3509(i64 %t3505, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3510
else876:
  %t3511 = and i64 %self, -8
  %t3512 = inttoptr i64 %t3511 to ptr
  %t3513 = getelementptr i64, ptr %t3512, i64 2
  %t3514 = load i64, ptr %t3513
  %t3515 = and i64 %self, -8
  %t3516 = inttoptr i64 %t3515 to ptr
  %t3517 = getelementptr i64, ptr %t3516, i64 3
  %t3518 = load i64, ptr %t3517
  %t3519 = call i64 @rt_vector_set(i64 %t3514, i64 %a0, i64 %t3518)
  %t3520 = or i64 %a0, 8
  %t3521 = and i64 %t3520, 7
  %t3522 = icmp eq i64 %t3521, 0
  br i1 %t3522, label %fixfast877, label %fixslow878
fixfast877:
  %t3523 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3524 = extractvalue {i64, i1} %t3523, 0
  %t3525 = extractvalue {i64, i1} %t3523, 1
  br i1 %t3525, label %fixslow878, label %fixmerge879
fixslow878:
  %t3526 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge879
fixmerge879:
  %t3527 = phi i64 [ %t3524, %fixfast877 ], [ %t3526, %fixslow878 ]
  %t3528 = musttail call fastcc i64 @"scheme.base:code_779"(i64 %self, i64 1, i64 %t3527, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3528
}

define fastcc i64 @"scheme.base:code:vector-fill!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3529 = icmp sge i64 %argc, 2
  br i1 %t3529, label %argok881, label %arityerr880
arityerr880:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok881:
  %t3530 = call ptr @rt_alloc_words(i64 8)
  %t3531 = getelementptr i64, ptr %t3530, i64 0
  store i64 %a0, ptr %t3531
  %t3532 = getelementptr i64, ptr %t3530, i64 1
  store i64 %a1, ptr %t3532
  %t3533 = getelementptr i64, ptr %t3530, i64 2
  store i64 %a2, ptr %t3533
  %t3534 = getelementptr i64, ptr %t3530, i64 3
  store i64 %a3, ptr %t3534
  %t3535 = getelementptr i64, ptr %t3530, i64 4
  store i64 %a4, ptr %t3535
  %t3536 = getelementptr i64, ptr %t3530, i64 5
  store i64 %a5, ptr %t3536
  %t3537 = getelementptr i64, ptr %t3530, i64 6
  store i64 %a6, ptr %t3537
  %t3538 = getelementptr i64, ptr %t3530, i64 7
  store i64 %a7, ptr %t3538
  %t3539 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3530, ptr %overflow)
  %t3540 = call i64 @rt_vector_length(i64 %a0)
  %t3541 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t3541)
  %t3542 = and i64 %t3541, -8
  %t3543 = inttoptr i64 %t3542 to ptr
  %t3544 = load i64, ptr %t3543
  %t3545 = inttoptr i64 %t3544 to ptr
  %t3546 = call fastcc i64%t3545(i64 %t3541, i64 1, i64 %t3539, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3547 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t3547)
  %t3548 = and i64 %t3547, -8
  %t3549 = inttoptr i64 %t3548 to ptr
  %t3550 = load i64, ptr %t3549
  %t3551 = inttoptr i64 %t3550 to ptr
  %t3552 = call fastcc i64%t3551(i64 %t3547, i64 2, i64 %t3539, i64 %t3540, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3553 = call i64 @rt_intern(ptr @.str.sym.19)
  %t3554 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t3554)
  %t3555 = and i64 %t3554, -8
  %t3556 = inttoptr i64 %t3555 to ptr
  %t3557 = load i64, ptr %t3556
  %t3558 = inttoptr i64 %t3557 to ptr
  %t3559 = call fastcc i64%t3558(i64 %t3554, i64 4, i64 %t3553, i64 %t3546, i64 %t3552, i64 %t3540, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3560 = call ptr @rt_alloc_words(i64 5)
  %t3561 = ptrtoint ptr %t3560 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_779" to i64), ptr %t3560
  %t3562 = or i64 %t3561, 4
  %t3563 = getelementptr i64, ptr %t3560, i64 1
  store i64 %t3552, ptr %t3563
  %t3564 = getelementptr i64, ptr %t3560, i64 2
  store i64 %a0, ptr %t3564
  %t3565 = getelementptr i64, ptr %t3560, i64 3
  store i64 %a1, ptr %t3565
  %t3566 = getelementptr i64, ptr %t3560, i64 4
  store i64 %t3562, ptr %t3566
  %t3567 = musttail call fastcc i64 @"scheme.base:code_779"(i64 %t3562, i64 1, i64 %t3546, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3567
}

define fastcc i64 @"scheme.base:code_805"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3572 = icmp eq i64 %argc, 1
  br i1 %t3572, label %argok883, label %arityerr882
arityerr882:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok883:
  %t3573 = or i64 %a0, 0
  %t3574 = and i64 %t3573, 7
  %t3575 = icmp eq i64 %t3574, 0
  br i1 %t3575, label %fixfast884, label %fixslow885
fixfast884:
  %t3576 = icmp slt i64 %a0, 0
  %t3577 = select i1 %t3576, i64 257, i64 1
  br label %fixmerge886
fixslow885:
  %t3578 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge886
fixmerge886:
  %t3579 = phi i64 [ %t3577, %fixfast884 ], [ %t3578, %fixslow885 ]
  %t3580 = icmp ne i64 %t3579, 1
  br i1 %t3580, label %then887, label %else888
then887:
  %t3581 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t3581)
  %t3582 = and i64 %t3581, -8
  %t3583 = inttoptr i64 %t3582 to ptr
  %t3584 = load i64, ptr %t3583
  %t3585 = inttoptr i64 %t3584 to ptr
  %t3586 = musttail call fastcc i64 %t3585(i64 %t3581, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3586
else888:
  %t3587 = and i64 %self, -8
  %t3588 = inttoptr i64 %t3587 to ptr
  %t3589 = getelementptr i64, ptr %t3588, i64 1
  %t3590 = load i64, ptr %t3589
  %t3591 = and i64 %self, -8
  %t3592 = inttoptr i64 %t3591 to ptr
  %t3593 = getelementptr i64, ptr %t3592, i64 2
  %t3594 = load i64, ptr %t3593
  %t3595 = or i64 %t3594, %a0
  %t3596 = and i64 %t3595, 7
  %t3597 = icmp eq i64 %t3596, 0
  br i1 %t3597, label %fixfast889, label %fixslow890
fixfast889:
  %t3598 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3594, i64 %a0)
  %t3599 = extractvalue {i64, i1} %t3598, 0
  %t3600 = extractvalue {i64, i1} %t3598, 1
  br i1 %t3600, label %fixslow890, label %fixmerge891
fixslow890:
  %t3601 = call i64 @rt_add(i64 %t3594, i64 %a0)
  br label %fixmerge891
fixmerge891:
  %t3602 = phi i64 [ %t3599, %fixfast889 ], [ %t3601, %fixslow890 ]
  %t3603 = and i64 %self, -8
  %t3604 = inttoptr i64 %t3603 to ptr
  %t3605 = getelementptr i64, ptr %t3604, i64 3
  %t3606 = load i64, ptr %t3605
  %t3607 = and i64 %self, -8
  %t3608 = inttoptr i64 %t3607 to ptr
  %t3609 = getelementptr i64, ptr %t3608, i64 4
  %t3610 = load i64, ptr %t3609
  %t3611 = or i64 %t3610, %a0
  %t3612 = and i64 %t3611, 7
  %t3613 = icmp eq i64 %t3612, 0
  br i1 %t3613, label %fixfast892, label %fixslow893
fixfast892:
  %t3614 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3610, i64 %a0)
  %t3615 = extractvalue {i64, i1} %t3614, 0
  %t3616 = extractvalue {i64, i1} %t3614, 1
  br i1 %t3616, label %fixslow893, label %fixmerge894
fixslow893:
  %t3617 = call i64 @rt_add(i64 %t3610, i64 %a0)
  br label %fixmerge894
fixmerge894:
  %t3618 = phi i64 [ %t3615, %fixfast892 ], [ %t3617, %fixslow893 ]
  %t3619 = call i64 @rt_vector_ref(i64 %t3606, i64 %t3618)
  %t3620 = call i64 @rt_vector_set(i64 %t3590, i64 %t3602, i64 %t3619)
  %t3621 = or i64 %a0, 8
  %t3622 = and i64 %t3621, 7
  %t3623 = icmp eq i64 %t3622, 0
  br i1 %t3623, label %fixfast895, label %fixslow896
fixfast895:
  %t3624 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t3625 = extractvalue {i64, i1} %t3624, 0
  %t3626 = extractvalue {i64, i1} %t3624, 1
  br i1 %t3626, label %fixslow896, label %fixmerge897
fixslow896:
  %t3627 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge897
fixmerge897:
  %t3628 = phi i64 [ %t3625, %fixfast895 ], [ %t3627, %fixslow896 ]
  %t3629 = musttail call fastcc i64 @"scheme.base:code_805"(i64 %self, i64 1, i64 %t3628, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3629
}

define fastcc i64 @"scheme.base:code_807"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3630 = icmp eq i64 %argc, 1
  br i1 %t3630, label %argok899, label %arityerr898
arityerr898:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok899:
  %t3631 = and i64 %self, -8
  %t3632 = inttoptr i64 %t3631 to ptr
  %t3633 = getelementptr i64, ptr %t3632, i64 1
  %t3634 = load i64, ptr %t3633
  %t3635 = and i64 %self, -8
  %t3636 = inttoptr i64 %t3635 to ptr
  %t3637 = getelementptr i64, ptr %t3636, i64 2
  %t3638 = load i64, ptr %t3637
  %t3639 = or i64 %t3634, %t3638
  %t3640 = and i64 %t3639, 7
  %t3641 = icmp eq i64 %t3640, 0
  br i1 %t3641, label %fixfast900, label %fixslow901
fixfast900:
  %t3642 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3634, i64 %t3638)
  %t3643 = extractvalue {i64, i1} %t3642, 0
  %t3644 = extractvalue {i64, i1} %t3642, 1
  br i1 %t3644, label %fixslow901, label %fixmerge902
fixslow901:
  %t3645 = call i64 @rt_sub(i64 %t3634, i64 %t3638)
  br label %fixmerge902
fixmerge902:
  %t3646 = phi i64 [ %t3643, %fixfast900 ], [ %t3645, %fixslow901 ]
  %t3647 = or i64 %a0, %t3646
  %t3648 = and i64 %t3647, 7
  %t3649 = icmp eq i64 %t3648, 0
  br i1 %t3649, label %fixfast903, label %fixslow904
fixfast903:
  %t3650 = icmp eq i64 %a0, %t3646
  %t3651 = select i1 %t3650, i64 257, i64 1
  br label %fixmerge905
fixslow904:
  %t3652 = call i64 @rt_num_eq(i64 %a0, i64 %t3646)
  br label %fixmerge905
fixmerge905:
  %t3653 = phi i64 [ %t3651, %fixfast903 ], [ %t3652, %fixslow904 ]
  %t3654 = icmp ne i64 %t3653, 1
  br i1 %t3654, label %then906, label %else907
then906:
  %t3655 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t3655)
  %t3656 = and i64 %t3655, -8
  %t3657 = inttoptr i64 %t3656 to ptr
  %t3658 = load i64, ptr %t3657
  %t3659 = inttoptr i64 %t3658 to ptr
  %t3660 = musttail call fastcc i64 %t3659(i64 %t3655, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3660
else907:
  %t3661 = and i64 %self, -8
  %t3662 = inttoptr i64 %t3661 to ptr
  %t3663 = getelementptr i64, ptr %t3662, i64 3
  %t3664 = load i64, ptr %t3663
  %t3665 = and i64 %self, -8
  %t3666 = inttoptr i64 %t3665 to ptr
  %t3667 = getelementptr i64, ptr %t3666, i64 4
  %t3668 = load i64, ptr %t3667
  %t3669 = or i64 %t3668, %a0
  %t3670 = and i64 %t3669, 7
  %t3671 = icmp eq i64 %t3670, 0
  br i1 %t3671, label %fixfast908, label %fixslow909
fixfast908:
  %t3672 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3668, i64 %a0)
  %t3673 = extractvalue {i64, i1} %t3672, 0
  %t3674 = extractvalue {i64, i1} %t3672, 1
  br i1 %t3674, label %fixslow909, label %fixmerge910
fixslow909:
  %t3675 = call i64 @rt_add(i64 %t3668, i64 %a0)
  br label %fixmerge910
fixmerge910:
  %t3676 = phi i64 [ %t3673, %fixfast908 ], [ %t3675, %fixslow909 ]
  %t3677 = and i64 %self, -8
  %t3678 = inttoptr i64 %t3677 to ptr
  %t3679 = getelementptr i64, ptr %t3678, i64 5
  %t3680 = load i64, ptr %t3679
  %t3681 = and i64 %self, -8
  %t3682 = inttoptr i64 %t3681 to ptr
  %t3683 = getelementptr i64, ptr %t3682, i64 2
  %t3684 = load i64, ptr %t3683
  %t3685 = or i64 %t3684, %a0
  %t3686 = and i64 %t3685, 7
  %t3687 = icmp eq i64 %t3686, 0
  br i1 %t3687, label %fixfast911, label %fixslow912
fixfast911:
  %t3688 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t3684, i64 %a0)
  %t3689 = extractvalue {i64, i1} %t3688, 0
  %t3690 = extractvalue {i64, i1} %t3688, 1
  br i1 %t3690, label %fixslow912, label %fixmerge913
fixslow912:
  %t3691 = call i64 @rt_add(i64 %t3684, i64 %a0)
  br label %fixmerge913
fixmerge913:
  %t3692 = phi i64 [ %t3689, %fixfast911 ], [ %t3691, %fixslow912 ]
  %t3693 = call i64 @rt_vector_ref(i64 %t3680, i64 %t3692)
  %t3694 = call i64 @rt_vector_set(i64 %t3664, i64 %t3676, i64 %t3693)
  %t3695 = or i64 %a0, 8
  %t3696 = and i64 %t3695, 7
  %t3697 = icmp eq i64 %t3696, 0
  br i1 %t3697, label %fixfast914, label %fixslow915
fixfast914:
  %t3698 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3699 = extractvalue {i64, i1} %t3698, 0
  %t3700 = extractvalue {i64, i1} %t3698, 1
  br i1 %t3700, label %fixslow915, label %fixmerge916
fixslow915:
  %t3701 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge916
fixmerge916:
  %t3702 = phi i64 [ %t3699, %fixfast914 ], [ %t3701, %fixslow915 ]
  %t3703 = musttail call fastcc i64 @"scheme.base:code_807"(i64 %self, i64 1, i64 %t3702, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3703
}

define fastcc i64 @"scheme.base:code:vector-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3704 = icmp sge i64 %argc, 3
  br i1 %t3704, label %argok918, label %arityerr917
arityerr917:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok918:
  %t3705 = call ptr @rt_alloc_words(i64 8)
  %t3706 = getelementptr i64, ptr %t3705, i64 0
  store i64 %a0, ptr %t3706
  %t3707 = getelementptr i64, ptr %t3705, i64 1
  store i64 %a1, ptr %t3707
  %t3708 = getelementptr i64, ptr %t3705, i64 2
  store i64 %a2, ptr %t3708
  %t3709 = getelementptr i64, ptr %t3705, i64 3
  store i64 %a3, ptr %t3709
  %t3710 = getelementptr i64, ptr %t3705, i64 4
  store i64 %a4, ptr %t3710
  %t3711 = getelementptr i64, ptr %t3705, i64 5
  store i64 %a5, ptr %t3711
  %t3712 = getelementptr i64, ptr %t3705, i64 6
  store i64 %a6, ptr %t3712
  %t3713 = getelementptr i64, ptr %t3705, i64 7
  store i64 %a7, ptr %t3713
  %t3714 = call i64 @rt_build_rest(i64 %argc, i64 3, i64 8, ptr %t3705, ptr %overflow)
  %t3715 = call i64 @rt_vector_length(i64 %a2)
  %t3716 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t3716)
  %t3717 = and i64 %t3716, -8
  %t3718 = inttoptr i64 %t3717 to ptr
  %t3719 = load i64, ptr %t3718
  %t3720 = inttoptr i64 %t3719 to ptr
  %t3721 = call fastcc i64%t3720(i64 %t3716, i64 1, i64 %t3714, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3722 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t3722)
  %t3723 = and i64 %t3722, -8
  %t3724 = inttoptr i64 %t3723 to ptr
  %t3725 = load i64, ptr %t3724
  %t3726 = inttoptr i64 %t3725 to ptr
  %t3727 = call fastcc i64%t3726(i64 %t3722, i64 2, i64 %t3714, i64 %t3715, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3728 = call i64 @rt_intern(ptr @.str.sym.20)
  %t3729 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t3729)
  %t3730 = and i64 %t3729, -8
  %t3731 = inttoptr i64 %t3730 to ptr
  %t3732 = load i64, ptr %t3731
  %t3733 = inttoptr i64 %t3732 to ptr
  %t3734 = call fastcc i64%t3733(i64 %t3729, i64 4, i64 %t3728, i64 %t3721, i64 %t3727, i64 %t3715, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3735 = call i64 @rt_intern(ptr @.str.sym.20)
  %t3736 = or i64 %t3727, %t3721
  %t3737 = and i64 %t3736, 7
  %t3738 = icmp eq i64 %t3737, 0
  br i1 %t3738, label %fixfast919, label %fixslow920
fixfast919:
  %t3739 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3727, i64 %t3721)
  %t3740 = extractvalue {i64, i1} %t3739, 0
  %t3741 = extractvalue {i64, i1} %t3739, 1
  br i1 %t3741, label %fixslow920, label %fixmerge921
fixslow920:
  %t3742 = call i64 @rt_sub(i64 %t3727, i64 %t3721)
  br label %fixmerge921
fixmerge921:
  %t3743 = phi i64 [ %t3740, %fixfast919 ], [ %t3742, %fixslow920 ]
  %t3744 = or i64 %a1, %t3743
  %t3745 = and i64 %t3744, 7
  %t3746 = icmp eq i64 %t3745, 0
  br i1 %t3746, label %fixfast922, label %fixslow923
fixfast922:
  %t3747 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t3743)
  %t3748 = extractvalue {i64, i1} %t3747, 0
  %t3749 = extractvalue {i64, i1} %t3747, 1
  br i1 %t3749, label %fixslow923, label %fixmerge924
fixslow923:
  %t3750 = call i64 @rt_add(i64 %a1, i64 %t3743)
  br label %fixmerge924
fixmerge924:
  %t3751 = phi i64 [ %t3748, %fixfast922 ], [ %t3750, %fixslow923 ]
  %t3752 = call i64 @rt_vector_length(i64 %a0)
  %t3753 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t3753)
  %t3754 = and i64 %t3753, -8
  %t3755 = inttoptr i64 %t3754 to ptr
  %t3756 = load i64, ptr %t3755
  %t3757 = inttoptr i64 %t3756 to ptr
  %t3758 = call fastcc i64%t3757(i64 %t3753, i64 4, i64 %t3735, i64 %a1, i64 %t3751, i64 %t3752, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3759 = or i64 %t3721, %a1
  %t3760 = and i64 %t3759, 7
  %t3761 = icmp eq i64 %t3760, 0
  br i1 %t3761, label %fixfast925, label %fixslow926
fixfast925:
  %t3762 = icmp slt i64 %t3721, %a1
  %t3763 = select i1 %t3762, i64 257, i64 1
  br label %fixmerge927
fixslow926:
  %t3764 = call i64 @rt_lt(i64 %t3721, i64 %a1)
  br label %fixmerge927
fixmerge927:
  %t3765 = phi i64 [ %t3763, %fixfast925 ], [ %t3764, %fixslow926 ]
  %t3766 = icmp ne i64 %t3765, 1
  br i1 %t3766, label %then928, label %else929
then928:
  %t3767 = call ptr @rt_alloc_words(i64 6)
  %t3768 = ptrtoint ptr %t3767 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_805" to i64), ptr %t3767
  %t3769 = or i64 %t3768, 4
  %t3770 = getelementptr i64, ptr %t3767, i64 1
  store i64 %a0, ptr %t3770
  %t3771 = getelementptr i64, ptr %t3767, i64 2
  store i64 %a1, ptr %t3771
  %t3772 = getelementptr i64, ptr %t3767, i64 3
  store i64 %a2, ptr %t3772
  %t3773 = getelementptr i64, ptr %t3767, i64 4
  store i64 %t3721, ptr %t3773
  %t3774 = getelementptr i64, ptr %t3767, i64 5
  store i64 %t3769, ptr %t3774
  %t3775 = or i64 %t3727, %t3721
  %t3776 = and i64 %t3775, 7
  %t3777 = icmp eq i64 %t3776, 0
  br i1 %t3777, label %fixfast930, label %fixslow931
fixfast930:
  %t3778 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3727, i64 %t3721)
  %t3779 = extractvalue {i64, i1} %t3778, 0
  %t3780 = extractvalue {i64, i1} %t3778, 1
  br i1 %t3780, label %fixslow931, label %fixmerge932
fixslow931:
  %t3781 = call i64 @rt_sub(i64 %t3727, i64 %t3721)
  br label %fixmerge932
fixmerge932:
  %t3782 = phi i64 [ %t3779, %fixfast930 ], [ %t3781, %fixslow931 ]
  %t3783 = or i64 %t3782, 8
  %t3784 = and i64 %t3783, 7
  %t3785 = icmp eq i64 %t3784, 0
  br i1 %t3785, label %fixfast933, label %fixslow934
fixfast933:
  %t3786 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3782, i64 8)
  %t3787 = extractvalue {i64, i1} %t3786, 0
  %t3788 = extractvalue {i64, i1} %t3786, 1
  br i1 %t3788, label %fixslow934, label %fixmerge935
fixslow934:
  %t3789 = call i64 @rt_sub(i64 %t3782, i64 8)
  br label %fixmerge935
fixmerge935:
  %t3790 = phi i64 [ %t3787, %fixfast933 ], [ %t3789, %fixslow934 ]
  %t3791 = musttail call fastcc i64 @"scheme.base:code_805"(i64 %t3769, i64 1, i64 %t3790, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3791
else929:
  %t3792 = call ptr @rt_alloc_words(i64 7)
  %t3793 = ptrtoint ptr %t3792 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_807" to i64), ptr %t3792
  %t3794 = or i64 %t3793, 4
  %t3795 = getelementptr i64, ptr %t3792, i64 1
  store i64 %t3727, ptr %t3795
  %t3796 = getelementptr i64, ptr %t3792, i64 2
  store i64 %t3721, ptr %t3796
  %t3797 = getelementptr i64, ptr %t3792, i64 3
  store i64 %a0, ptr %t3797
  %t3798 = getelementptr i64, ptr %t3792, i64 4
  store i64 %a1, ptr %t3798
  %t3799 = getelementptr i64, ptr %t3792, i64 5
  store i64 %a2, ptr %t3799
  %t3800 = getelementptr i64, ptr %t3792, i64 6
  store i64 %t3794, ptr %t3800
  %t3801 = musttail call fastcc i64 @"scheme.base:code_807"(i64 %t3794, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3801
}

define fastcc i64 @"scheme.base:code_830"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3806 = icmp eq i64 %argc, 1
  br i1 %t3806, label %argok937, label %arityerr936
arityerr936:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok937:
  %t3807 = and i64 %self, -8
  %t3808 = inttoptr i64 %t3807 to ptr
  %t3809 = getelementptr i64, ptr %t3808, i64 1
  %t3810 = load i64, ptr %t3809
  %t3811 = or i64 %a0, %t3810
  %t3812 = and i64 %t3811, 7
  %t3813 = icmp eq i64 %t3812, 0
  br i1 %t3813, label %fixfast938, label %fixslow939
fixfast938:
  %t3814 = icmp eq i64 %a0, %t3810
  %t3815 = select i1 %t3814, i64 257, i64 1
  br label %fixmerge940
fixslow939:
  %t3816 = call i64 @rt_num_eq(i64 %a0, i64 %t3810)
  br label %fixmerge940
fixmerge940:
  %t3817 = phi i64 [ %t3815, %fixfast938 ], [ %t3816, %fixslow939 ]
  %t3818 = icmp ne i64 %t3817, 1
  br i1 %t3818, label %then941, label %else942
then941:
  %t3819 = and i64 %self, -8
  %t3820 = inttoptr i64 %t3819 to ptr
  %t3821 = getelementptr i64, ptr %t3820, i64 2
  %t3822 = load i64, ptr %t3821
  ret i64 %t3822
else942:
  %t3823 = and i64 %self, -8
  %t3824 = inttoptr i64 %t3823 to ptr
  %t3825 = getelementptr i64, ptr %t3824, i64 2
  %t3826 = load i64, ptr %t3825
  %t3827 = and i64 %self, -8
  %t3828 = inttoptr i64 %t3827 to ptr
  %t3829 = getelementptr i64, ptr %t3828, i64 4
  %t3830 = load i64, ptr %t3829
  %t3831 = call i64 @rt_vector_ref(i64 %t3830, i64 %a0)
  %t3832 = and i64 %self, -8
  %t3833 = inttoptr i64 %t3832 to ptr
  %t3834 = getelementptr i64, ptr %t3833, i64 3
  %t3835 = load i64, ptr %t3834
  call void @rt_check_callable(i64 %t3835)
  %t3836 = and i64 %t3835, -8
  %t3837 = inttoptr i64 %t3836 to ptr
  %t3838 = load i64, ptr %t3837
  %t3839 = inttoptr i64 %t3838 to ptr
  %t3840 = call fastcc i64%t3839(i64 %t3835, i64 1, i64 %t3831, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3841 = call i64 @rt_vector_set(i64 %t3826, i64 %a0, i64 %t3840)
  %t3842 = or i64 %a0, 8
  %t3843 = and i64 %t3842, 7
  %t3844 = icmp eq i64 %t3843, 0
  br i1 %t3844, label %fixfast943, label %fixslow944
fixfast943:
  %t3845 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3846 = extractvalue {i64, i1} %t3845, 0
  %t3847 = extractvalue {i64, i1} %t3845, 1
  br i1 %t3847, label %fixslow944, label %fixmerge945
fixslow944:
  %t3848 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge945
fixmerge945:
  %t3849 = phi i64 [ %t3846, %fixfast943 ], [ %t3848, %fixslow944 ]
  %t3850 = musttail call fastcc i64 @"scheme.base:code_830"(i64 %self, i64 1, i64 %t3849, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3850
}

define fastcc i64 @"scheme.base:code_832"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3851 = icmp eq i64 %argc, 1
  br i1 %t3851, label %argok947, label %arityerr946
arityerr946:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok947:
  %t3852 = and i64 %self, -8
  %t3853 = inttoptr i64 %t3852 to ptr
  %t3854 = getelementptr i64, ptr %t3853, i64 1
  %t3855 = load i64, ptr %t3854
  %t3856 = or i64 %a0, %t3855
  %t3857 = and i64 %t3856, 7
  %t3858 = icmp eq i64 %t3857, 0
  br i1 %t3858, label %fixfast948, label %fixslow949
fixfast948:
  %t3859 = icmp eq i64 %a0, %t3855
  %t3860 = select i1 %t3859, i64 257, i64 1
  br label %fixmerge950
fixslow949:
  %t3861 = call i64 @rt_num_eq(i64 %a0, i64 %t3855)
  br label %fixmerge950
fixmerge950:
  %t3862 = phi i64 [ %t3860, %fixfast948 ], [ %t3861, %fixslow949 ]
  %t3863 = icmp ne i64 %t3862, 1
  br i1 %t3863, label %then951, label %else952
then951:
  %t3864 = and i64 %self, -8
  %t3865 = inttoptr i64 %t3864 to ptr
  %t3866 = getelementptr i64, ptr %t3865, i64 2
  %t3867 = load i64, ptr %t3866
  ret i64 %t3867
else952:
  %t3868 = and i64 %self, -8
  %t3869 = inttoptr i64 %t3868 to ptr
  %t3870 = getelementptr i64, ptr %t3869, i64 2
  %t3871 = load i64, ptr %t3870
  %t3872 = and i64 %self, -8
  %t3873 = inttoptr i64 %t3872 to ptr
  %t3874 = getelementptr i64, ptr %t3873, i64 4
  %t3875 = load i64, ptr %t3874
  %t3876 = load i64, ptr @"scheme.base:vec-nth"
  call void @rt_check_callable(i64 %t3876)
  %t3877 = and i64 %t3876, -8
  %t3878 = inttoptr i64 %t3877 to ptr
  %t3879 = load i64, ptr %t3878
  %t3880 = inttoptr i64 %t3879 to ptr
  %t3881 = call fastcc i64%t3880(i64 %t3876, i64 2, i64 %t3875, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3882 = and i64 %self, -8
  %t3883 = inttoptr i64 %t3882 to ptr
  %t3884 = getelementptr i64, ptr %t3883, i64 3
  %t3885 = load i64, ptr %t3884
  call void @rt_check_callable(i64 %t3885)
  %t3886 = and i64 %t3885, -8
  %t3887 = inttoptr i64 %t3886 to ptr
  %t3888 = load i64, ptr %t3887
  %t3889 = inttoptr i64 %t3888 to ptr
  %t3890 = call i64 @rt_list_length(i64 %t3881)
  %t3891 = add i64 0, %t3890
  %t3892 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t3881, i64 8)
  %t3904 = getelementptr i64, ptr %t3892, i64 0
  %t3896 = load i64, ptr %t3904
  %t3905 = getelementptr i64, ptr %t3892, i64 1
  %t3897 = load i64, ptr %t3905
  %t3906 = getelementptr i64, ptr %t3892, i64 2
  %t3898 = load i64, ptr %t3906
  %t3907 = getelementptr i64, ptr %t3892, i64 3
  %t3899 = load i64, ptr %t3907
  %t3908 = getelementptr i64, ptr %t3892, i64 4
  %t3900 = load i64, ptr %t3908
  %t3909 = getelementptr i64, ptr %t3892, i64 5
  %t3901 = load i64, ptr %t3909
  %t3910 = getelementptr i64, ptr %t3892, i64 6
  %t3902 = load i64, ptr %t3910
  %t3911 = getelementptr i64, ptr %t3892, i64 7
  %t3903 = load i64, ptr %t3911
  %t3893 = icmp sgt i64 %t3891, 8
  %t3894 = getelementptr i64, ptr %t3892, i64 8
  %t3895 = select i1 %t3893, ptr %t3894, ptr null
  %t3912 = call fastcc i64%t3889(i64 %t3885, i64 %t3891, i64 %t3896, i64 %t3897, i64 %t3898, i64 %t3899, i64 %t3900, i64 %t3901, i64 %t3902, i64 %t3903, ptr %t3895)
  %t3913 = call i64 @rt_vector_set(i64 %t3871, i64 %a0, i64 %t3912)
  %t3914 = or i64 %a0, 8
  %t3915 = and i64 %t3914, 7
  %t3916 = icmp eq i64 %t3915, 0
  br i1 %t3916, label %fixfast953, label %fixslow954
fixfast953:
  %t3917 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3918 = extractvalue {i64, i1} %t3917, 0
  %t3919 = extractvalue {i64, i1} %t3917, 1
  br i1 %t3919, label %fixslow954, label %fixmerge955
fixslow954:
  %t3920 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge955
fixmerge955:
  %t3921 = phi i64 [ %t3918, %fixfast953 ], [ %t3920, %fixslow954 ]
  %t3922 = musttail call fastcc i64 @"scheme.base:code_832"(i64 %self, i64 1, i64 %t3921, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3922
}

define fastcc i64 @"scheme.base:code:vector-map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3923 = icmp sge i64 %argc, 2
  br i1 %t3923, label %argok957, label %arityerr956
arityerr956:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok957:
  %t3924 = call ptr @rt_alloc_words(i64 8)
  %t3925 = getelementptr i64, ptr %t3924, i64 0
  store i64 %a0, ptr %t3925
  %t3926 = getelementptr i64, ptr %t3924, i64 1
  store i64 %a1, ptr %t3926
  %t3927 = getelementptr i64, ptr %t3924, i64 2
  store i64 %a2, ptr %t3927
  %t3928 = getelementptr i64, ptr %t3924, i64 3
  store i64 %a3, ptr %t3928
  %t3929 = getelementptr i64, ptr %t3924, i64 4
  store i64 %a4, ptr %t3929
  %t3930 = getelementptr i64, ptr %t3924, i64 5
  store i64 %a5, ptr %t3930
  %t3931 = getelementptr i64, ptr %t3924, i64 6
  store i64 %a6, ptr %t3931
  %t3932 = getelementptr i64, ptr %t3924, i64 7
  store i64 %a7, ptr %t3932
  %t3933 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3924, ptr %overflow)
  %t3934 = call i64 @rt_null_p(i64 %t3933)
  %t3935 = icmp ne i64 %t3934, 1
  br i1 %t3935, label %then958, label %else959
then958:
  %t3936 = call i64 @rt_vector_length(i64 %a1)
  %t3937 = call i64 @rt_make_vector(i64 %t3936, i64 0)
  %t3938 = call ptr @rt_alloc_words(i64 6)
  %t3939 = ptrtoint ptr %t3938 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_830" to i64), ptr %t3938
  %t3940 = or i64 %t3939, 4
  %t3941 = getelementptr i64, ptr %t3938, i64 1
  store i64 %t3936, ptr %t3941
  %t3942 = getelementptr i64, ptr %t3938, i64 2
  store i64 %t3937, ptr %t3942
  %t3943 = getelementptr i64, ptr %t3938, i64 3
  store i64 %a0, ptr %t3943
  %t3944 = getelementptr i64, ptr %t3938, i64 4
  store i64 %a1, ptr %t3944
  %t3945 = getelementptr i64, ptr %t3938, i64 5
  store i64 %t3940, ptr %t3945
  %t3946 = musttail call fastcc i64 @"scheme.base:code_830"(i64 %t3940, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3946
else959:
  %t3947 = call i64 @rt_cons(i64 %a1, i64 %t3933)
  %t3948 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t3948)
  %t3949 = and i64 %t3948, -8
  %t3950 = inttoptr i64 %t3949 to ptr
  %t3951 = load i64, ptr %t3950
  %t3952 = inttoptr i64 %t3951 to ptr
  %t3953 = call fastcc i64%t3952(i64 %t3948, i64 1, i64 %t3947, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3954 = call i64 @rt_make_vector(i64 %t3953, i64 0)
  %t3955 = call ptr @rt_alloc_words(i64 6)
  %t3956 = ptrtoint ptr %t3955 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_832" to i64), ptr %t3955
  %t3957 = or i64 %t3956, 4
  %t3958 = getelementptr i64, ptr %t3955, i64 1
  store i64 %t3953, ptr %t3958
  %t3959 = getelementptr i64, ptr %t3955, i64 2
  store i64 %t3954, ptr %t3959
  %t3960 = getelementptr i64, ptr %t3955, i64 3
  store i64 %a0, ptr %t3960
  %t3961 = getelementptr i64, ptr %t3955, i64 4
  store i64 %t3947, ptr %t3961
  %t3962 = getelementptr i64, ptr %t3955, i64 5
  store i64 %t3957, ptr %t3962
  %t3963 = musttail call fastcc i64 @"scheme.base:code_832"(i64 %t3957, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3963
}

define fastcc i64 @"scheme.base:code_853"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3968 = icmp eq i64 %argc, 1
  br i1 %t3968, label %argok961, label %arityerr960
arityerr960:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok961:
  %t3969 = and i64 %self, -8
  %t3970 = inttoptr i64 %t3969 to ptr
  %t3971 = getelementptr i64, ptr %t3970, i64 1
  %t3972 = load i64, ptr %t3971
  %t3973 = or i64 %a0, %t3972
  %t3974 = and i64 %t3973, 7
  %t3975 = icmp eq i64 %t3974, 0
  br i1 %t3975, label %fixfast962, label %fixslow963
fixfast962:
  %t3976 = icmp eq i64 %a0, %t3972
  %t3977 = select i1 %t3976, i64 257, i64 1
  br label %fixmerge964
fixslow963:
  %t3978 = call i64 @rt_num_eq(i64 %a0, i64 %t3972)
  br label %fixmerge964
fixmerge964:
  %t3979 = phi i64 [ %t3977, %fixfast962 ], [ %t3978, %fixslow963 ]
  %t3980 = icmp ne i64 %t3979, 1
  br i1 %t3980, label %then965, label %else966
then965:
  %t3981 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t3981)
  %t3982 = and i64 %t3981, -8
  %t3983 = inttoptr i64 %t3982 to ptr
  %t3984 = load i64, ptr %t3983
  %t3985 = inttoptr i64 %t3984 to ptr
  %t3986 = musttail call fastcc i64 %t3985(i64 %t3981, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3986
else966:
  %t3987 = and i64 %self, -8
  %t3988 = inttoptr i64 %t3987 to ptr
  %t3989 = getelementptr i64, ptr %t3988, i64 3
  %t3990 = load i64, ptr %t3989
  %t3991 = call i64 @rt_vector_ref(i64 %t3990, i64 %a0)
  %t3992 = and i64 %self, -8
  %t3993 = inttoptr i64 %t3992 to ptr
  %t3994 = getelementptr i64, ptr %t3993, i64 2
  %t3995 = load i64, ptr %t3994
  call void @rt_check_callable(i64 %t3995)
  %t3996 = and i64 %t3995, -8
  %t3997 = inttoptr i64 %t3996 to ptr
  %t3998 = load i64, ptr %t3997
  %t3999 = inttoptr i64 %t3998 to ptr
  %t4000 = call fastcc i64%t3999(i64 %t3995, i64 1, i64 %t3991, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4001 = or i64 %a0, 8
  %t4002 = and i64 %t4001, 7
  %t4003 = icmp eq i64 %t4002, 0
  br i1 %t4003, label %fixfast967, label %fixslow968
fixfast967:
  %t4004 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4005 = extractvalue {i64, i1} %t4004, 0
  %t4006 = extractvalue {i64, i1} %t4004, 1
  br i1 %t4006, label %fixslow968, label %fixmerge969
fixslow968:
  %t4007 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge969
fixmerge969:
  %t4008 = phi i64 [ %t4005, %fixfast967 ], [ %t4007, %fixslow968 ]
  %t4009 = musttail call fastcc i64 @"scheme.base:code_853"(i64 %self, i64 1, i64 %t4008, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4009
}

define fastcc i64 @"scheme.base:code_855"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4010 = icmp eq i64 %argc, 1
  br i1 %t4010, label %argok971, label %arityerr970
arityerr970:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok971:
  %t4011 = and i64 %self, -8
  %t4012 = inttoptr i64 %t4011 to ptr
  %t4013 = getelementptr i64, ptr %t4012, i64 1
  %t4014 = load i64, ptr %t4013
  %t4015 = or i64 %a0, %t4014
  %t4016 = and i64 %t4015, 7
  %t4017 = icmp eq i64 %t4016, 0
  br i1 %t4017, label %fixfast972, label %fixslow973
fixfast972:
  %t4018 = icmp eq i64 %a0, %t4014
  %t4019 = select i1 %t4018, i64 257, i64 1
  br label %fixmerge974
fixslow973:
  %t4020 = call i64 @rt_num_eq(i64 %a0, i64 %t4014)
  br label %fixmerge974
fixmerge974:
  %t4021 = phi i64 [ %t4019, %fixfast972 ], [ %t4020, %fixslow973 ]
  %t4022 = icmp ne i64 %t4021, 1
  br i1 %t4022, label %then975, label %else976
then975:
  %t4023 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4023)
  %t4024 = and i64 %t4023, -8
  %t4025 = inttoptr i64 %t4024 to ptr
  %t4026 = load i64, ptr %t4025
  %t4027 = inttoptr i64 %t4026 to ptr
  %t4028 = musttail call fastcc i64 %t4027(i64 %t4023, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4028
else976:
  %t4029 = and i64 %self, -8
  %t4030 = inttoptr i64 %t4029 to ptr
  %t4031 = getelementptr i64, ptr %t4030, i64 3
  %t4032 = load i64, ptr %t4031
  %t4033 = load i64, ptr @"scheme.base:vec-nth"
  call void @rt_check_callable(i64 %t4033)
  %t4034 = and i64 %t4033, -8
  %t4035 = inttoptr i64 %t4034 to ptr
  %t4036 = load i64, ptr %t4035
  %t4037 = inttoptr i64 %t4036 to ptr
  %t4038 = call fastcc i64%t4037(i64 %t4033, i64 2, i64 %t4032, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4039 = and i64 %self, -8
  %t4040 = inttoptr i64 %t4039 to ptr
  %t4041 = getelementptr i64, ptr %t4040, i64 2
  %t4042 = load i64, ptr %t4041
  call void @rt_check_callable(i64 %t4042)
  %t4043 = and i64 %t4042, -8
  %t4044 = inttoptr i64 %t4043 to ptr
  %t4045 = load i64, ptr %t4044
  %t4046 = inttoptr i64 %t4045 to ptr
  %t4047 = call i64 @rt_list_length(i64 %t4038)
  %t4048 = add i64 0, %t4047
  %t4049 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t4038, i64 8)
  %t4061 = getelementptr i64, ptr %t4049, i64 0
  %t4053 = load i64, ptr %t4061
  %t4062 = getelementptr i64, ptr %t4049, i64 1
  %t4054 = load i64, ptr %t4062
  %t4063 = getelementptr i64, ptr %t4049, i64 2
  %t4055 = load i64, ptr %t4063
  %t4064 = getelementptr i64, ptr %t4049, i64 3
  %t4056 = load i64, ptr %t4064
  %t4065 = getelementptr i64, ptr %t4049, i64 4
  %t4057 = load i64, ptr %t4065
  %t4066 = getelementptr i64, ptr %t4049, i64 5
  %t4058 = load i64, ptr %t4066
  %t4067 = getelementptr i64, ptr %t4049, i64 6
  %t4059 = load i64, ptr %t4067
  %t4068 = getelementptr i64, ptr %t4049, i64 7
  %t4060 = load i64, ptr %t4068
  %t4050 = icmp sgt i64 %t4048, 8
  %t4051 = getelementptr i64, ptr %t4049, i64 8
  %t4052 = select i1 %t4050, ptr %t4051, ptr null
  %t4069 = call fastcc i64%t4046(i64 %t4042, i64 %t4048, i64 %t4053, i64 %t4054, i64 %t4055, i64 %t4056, i64 %t4057, i64 %t4058, i64 %t4059, i64 %t4060, ptr %t4052)
  %t4070 = or i64 %a0, 8
  %t4071 = and i64 %t4070, 7
  %t4072 = icmp eq i64 %t4071, 0
  br i1 %t4072, label %fixfast977, label %fixslow978
fixfast977:
  %t4073 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4074 = extractvalue {i64, i1} %t4073, 0
  %t4075 = extractvalue {i64, i1} %t4073, 1
  br i1 %t4075, label %fixslow978, label %fixmerge979
fixslow978:
  %t4076 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge979
fixmerge979:
  %t4077 = phi i64 [ %t4074, %fixfast977 ], [ %t4076, %fixslow978 ]
  %t4078 = musttail call fastcc i64 @"scheme.base:code_855"(i64 %self, i64 1, i64 %t4077, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4078
}

define fastcc i64 @"scheme.base:code:vector-for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4079 = icmp sge i64 %argc, 2
  br i1 %t4079, label %argok981, label %arityerr980
arityerr980:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok981:
  %t4080 = call ptr @rt_alloc_words(i64 8)
  %t4081 = getelementptr i64, ptr %t4080, i64 0
  store i64 %a0, ptr %t4081
  %t4082 = getelementptr i64, ptr %t4080, i64 1
  store i64 %a1, ptr %t4082
  %t4083 = getelementptr i64, ptr %t4080, i64 2
  store i64 %a2, ptr %t4083
  %t4084 = getelementptr i64, ptr %t4080, i64 3
  store i64 %a3, ptr %t4084
  %t4085 = getelementptr i64, ptr %t4080, i64 4
  store i64 %a4, ptr %t4085
  %t4086 = getelementptr i64, ptr %t4080, i64 5
  store i64 %a5, ptr %t4086
  %t4087 = getelementptr i64, ptr %t4080, i64 6
  store i64 %a6, ptr %t4087
  %t4088 = getelementptr i64, ptr %t4080, i64 7
  store i64 %a7, ptr %t4088
  %t4089 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t4080, ptr %overflow)
  %t4090 = call i64 @rt_null_p(i64 %t4089)
  %t4091 = icmp ne i64 %t4090, 1
  br i1 %t4091, label %then982, label %else983
then982:
  %t4092 = call i64 @rt_vector_length(i64 %a1)
  %t4093 = call ptr @rt_alloc_words(i64 5)
  %t4094 = ptrtoint ptr %t4093 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_853" to i64), ptr %t4093
  %t4095 = or i64 %t4094, 4
  %t4096 = getelementptr i64, ptr %t4093, i64 1
  store i64 %t4092, ptr %t4096
  %t4097 = getelementptr i64, ptr %t4093, i64 2
  store i64 %a0, ptr %t4097
  %t4098 = getelementptr i64, ptr %t4093, i64 3
  store i64 %a1, ptr %t4098
  %t4099 = getelementptr i64, ptr %t4093, i64 4
  store i64 %t4095, ptr %t4099
  %t4100 = musttail call fastcc i64 @"scheme.base:code_853"(i64 %t4095, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4100
else983:
  %t4101 = call i64 @rt_cons(i64 %a1, i64 %t4089)
  %t4102 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t4102)
  %t4103 = and i64 %t4102, -8
  %t4104 = inttoptr i64 %t4103 to ptr
  %t4105 = load i64, ptr %t4104
  %t4106 = inttoptr i64 %t4105 to ptr
  %t4107 = call fastcc i64%t4106(i64 %t4102, i64 1, i64 %t4101, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4108 = call ptr @rt_alloc_words(i64 5)
  %t4109 = ptrtoint ptr %t4108 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_855" to i64), ptr %t4108
  %t4110 = or i64 %t4109, 4
  %t4111 = getelementptr i64, ptr %t4108, i64 1
  store i64 %t4107, ptr %t4111
  %t4112 = getelementptr i64, ptr %t4108, i64 2
  store i64 %a0, ptr %t4112
  %t4113 = getelementptr i64, ptr %t4108, i64 3
  store i64 %t4101, ptr %t4113
  %t4114 = getelementptr i64, ptr %t4108, i64 4
  store i64 %t4110, ptr %t4114
  %t4115 = musttail call fastcc i64 @"scheme.base:code_855"(i64 %t4110, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4115
}

define fastcc i64 @"scheme.base:code:vec-min-len"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4120 = icmp eq i64 %argc, 1
  br i1 %t4120, label %argok985, label %arityerr984
arityerr984:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok985:
  %t4121 = call i64 @rt_cdr(i64 %a0)
  %t4122 = call i64 @rt_null_p(i64 %t4121)
  %t4123 = icmp ne i64 %t4122, 1
  br i1 %t4123, label %then986, label %else987
then986:
  %t4124 = call i64 @rt_car(i64 %a0)
  %t4125 = call i64 @rt_vector_length(i64 %t4124)
  ret i64 %t4125
else987:
  %t4126 = call i64 @rt_car(i64 %a0)
  %t4127 = call i64 @rt_vector_length(i64 %t4126)
  %t4128 = call i64 @rt_cdr(i64 %a0)
  %t4129 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t4129)
  %t4130 = and i64 %t4129, -8
  %t4131 = inttoptr i64 %t4130 to ptr
  %t4132 = load i64, ptr %t4131
  %t4133 = inttoptr i64 %t4132 to ptr
  %t4134 = call fastcc i64%t4133(i64 %t4129, i64 1, i64 %t4128, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4135 = or i64 %t4127, %t4134
  %t4136 = and i64 %t4135, 7
  %t4137 = icmp eq i64 %t4136, 0
  br i1 %t4137, label %fixfast988, label %fixslow989
fixfast988:
  %t4138 = icmp slt i64 %t4127, %t4134
  %t4139 = select i1 %t4138, i64 257, i64 1
  br label %fixmerge990
fixslow989:
  %t4140 = call i64 @rt_lt(i64 %t4127, i64 %t4134)
  br label %fixmerge990
fixmerge990:
  %t4141 = phi i64 [ %t4139, %fixfast988 ], [ %t4140, %fixslow989 ]
  %t4142 = icmp ne i64 %t4141, 1
  br i1 %t4142, label %then991, label %else992
then991:
  ret i64 %t4127
else992:
  ret i64 %t4134
}

define fastcc i64 @"scheme.base:code:vec-nth"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4147 = icmp eq i64 %argc, 2
  br i1 %t4147, label %argok994, label %arityerr993
arityerr993:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok994:
  %t4148 = call i64 @rt_null_p(i64 %a0)
  %t4149 = icmp ne i64 %t4148, 1
  br i1 %t4149, label %then995, label %else996
then995:
  ret i64 2
else996:
  %t4150 = call i64 @rt_car(i64 %a0)
  %t4151 = call i64 @rt_vector_ref(i64 %t4150, i64 %a1)
  %t4152 = call i64 @rt_cdr(i64 %a0)
  %t4153 = load i64, ptr @"scheme.base:vec-nth"
  call void @rt_check_callable(i64 %t4153)
  %t4154 = and i64 %t4153, -8
  %t4155 = inttoptr i64 %t4154 to ptr
  %t4156 = load i64, ptr %t4155
  %t4157 = inttoptr i64 %t4156 to ptr
  %t4158 = call fastcc i64%t4157(i64 %t4153, i64 2, i64 %t4152, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4159 = call i64 @rt_cons(i64 %t4151, i64 %t4158)
  ret i64 %t4159
}

define fastcc i64 @"scheme.base:code_881"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4164 = icmp eq i64 %argc, 1
  br i1 %t4164, label %argok998, label %arityerr997
arityerr997:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok998:
  %t4165 = and i64 %self, -8
  %t4166 = inttoptr i64 %t4165 to ptr
  %t4167 = getelementptr i64, ptr %t4166, i64 1
  %t4168 = load i64, ptr %t4167
  %t4169 = or i64 %a0, %t4168
  %t4170 = and i64 %t4169, 7
  %t4171 = icmp eq i64 %t4170, 0
  br i1 %t4171, label %fixfast999, label %fixslow1000
fixfast999:
  %t4172 = icmp eq i64 %a0, %t4168
  %t4173 = select i1 %t4172, i64 257, i64 1
  br label %fixmerge1001
fixslow1000:
  %t4174 = call i64 @rt_num_eq(i64 %a0, i64 %t4168)
  br label %fixmerge1001
fixmerge1001:
  %t4175 = phi i64 [ %t4173, %fixfast999 ], [ %t4174, %fixslow1000 ]
  %t4176 = icmp ne i64 %t4175, 1
  br i1 %t4176, label %then1002, label %else1003
then1002:
  %t4177 = and i64 %self, -8
  %t4178 = inttoptr i64 %t4177 to ptr
  %t4179 = getelementptr i64, ptr %t4178, i64 2
  %t4180 = load i64, ptr %t4179
  ret i64 %t4180
else1003:
  %t4181 = and i64 %self, -8
  %t4182 = inttoptr i64 %t4181 to ptr
  %t4183 = getelementptr i64, ptr %t4182, i64 2
  %t4184 = load i64, ptr %t4183
  %t4185 = and i64 %self, -8
  %t4186 = inttoptr i64 %t4185 to ptr
  %t4187 = getelementptr i64, ptr %t4186, i64 3
  %t4188 = load i64, ptr %t4187
  %t4189 = or i64 %a0, %t4188
  %t4190 = and i64 %t4189, 7
  %t4191 = icmp eq i64 %t4190, 0
  br i1 %t4191, label %fixfast1004, label %fixslow1005
fixfast1004:
  %t4192 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t4188)
  %t4193 = extractvalue {i64, i1} %t4192, 0
  %t4194 = extractvalue {i64, i1} %t4192, 1
  br i1 %t4194, label %fixslow1005, label %fixmerge1006
fixslow1005:
  %t4195 = call i64 @rt_sub(i64 %a0, i64 %t4188)
  br label %fixmerge1006
fixmerge1006:
  %t4196 = phi i64 [ %t4193, %fixfast1004 ], [ %t4195, %fixslow1005 ]
  %t4197 = and i64 %self, -8
  %t4198 = inttoptr i64 %t4197 to ptr
  %t4199 = getelementptr i64, ptr %t4198, i64 4
  %t4200 = load i64, ptr %t4199
  %t4201 = call i64 @rt_string_ref(i64 %t4200, i64 %a0)
  %t4202 = call i64 @rt_vector_set(i64 %t4184, i64 %t4196, i64 %t4201)
  %t4203 = or i64 %a0, 8
  %t4204 = and i64 %t4203, 7
  %t4205 = icmp eq i64 %t4204, 0
  br i1 %t4205, label %fixfast1007, label %fixslow1008
fixfast1007:
  %t4206 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4207 = extractvalue {i64, i1} %t4206, 0
  %t4208 = extractvalue {i64, i1} %t4206, 1
  br i1 %t4208, label %fixslow1008, label %fixmerge1009
fixslow1008:
  %t4209 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1009
fixmerge1009:
  %t4210 = phi i64 [ %t4207, %fixfast1007 ], [ %t4209, %fixslow1008 ]
  %t4211 = musttail call fastcc i64 @"scheme.base:code_881"(i64 %self, i64 1, i64 %t4210, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4211
}

define fastcc i64 @"scheme.base:code:string->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4212 = icmp sge i64 %argc, 1
  br i1 %t4212, label %argok1011, label %arityerr1010
arityerr1010:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1011:
  %t4213 = call ptr @rt_alloc_words(i64 8)
  %t4214 = getelementptr i64, ptr %t4213, i64 0
  store i64 %a0, ptr %t4214
  %t4215 = getelementptr i64, ptr %t4213, i64 1
  store i64 %a1, ptr %t4215
  %t4216 = getelementptr i64, ptr %t4213, i64 2
  store i64 %a2, ptr %t4216
  %t4217 = getelementptr i64, ptr %t4213, i64 3
  store i64 %a3, ptr %t4217
  %t4218 = getelementptr i64, ptr %t4213, i64 4
  store i64 %a4, ptr %t4218
  %t4219 = getelementptr i64, ptr %t4213, i64 5
  store i64 %a5, ptr %t4219
  %t4220 = getelementptr i64, ptr %t4213, i64 6
  store i64 %a6, ptr %t4220
  %t4221 = getelementptr i64, ptr %t4213, i64 7
  store i64 %a7, ptr %t4221
  %t4222 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t4213, ptr %overflow)
  %t4223 = call i64 @rt_string_length(i64 %a0)
  %t4224 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4224)
  %t4225 = and i64 %t4224, -8
  %t4226 = inttoptr i64 %t4225 to ptr
  %t4227 = load i64, ptr %t4226
  %t4228 = inttoptr i64 %t4227 to ptr
  %t4229 = call fastcc i64%t4228(i64 %t4224, i64 1, i64 %t4222, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4230 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4230)
  %t4231 = and i64 %t4230, -8
  %t4232 = inttoptr i64 %t4231 to ptr
  %t4233 = load i64, ptr %t4232
  %t4234 = inttoptr i64 %t4233 to ptr
  %t4235 = call fastcc i64%t4234(i64 %t4230, i64 2, i64 %t4222, i64 %t4223, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4236 = call i64 @rt_intern(ptr @.str.sym.21)
  %t4237 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4237)
  %t4238 = and i64 %t4237, -8
  %t4239 = inttoptr i64 %t4238 to ptr
  %t4240 = load i64, ptr %t4239
  %t4241 = inttoptr i64 %t4240 to ptr
  %t4242 = call fastcc i64%t4241(i64 %t4237, i64 4, i64 %t4236, i64 %t4229, i64 %t4235, i64 %t4223, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4243 = or i64 %t4235, %t4229
  %t4244 = and i64 %t4243, 7
  %t4245 = icmp eq i64 %t4244, 0
  br i1 %t4245, label %fixfast1012, label %fixslow1013
fixfast1012:
  %t4246 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4235, i64 %t4229)
  %t4247 = extractvalue {i64, i1} %t4246, 0
  %t4248 = extractvalue {i64, i1} %t4246, 1
  br i1 %t4248, label %fixslow1013, label %fixmerge1014
fixslow1013:
  %t4249 = call i64 @rt_sub(i64 %t4235, i64 %t4229)
  br label %fixmerge1014
fixmerge1014:
  %t4250 = phi i64 [ %t4247, %fixfast1012 ], [ %t4249, %fixslow1013 ]
  %t4251 = call i64 @rt_make_vector(i64 %t4250, i64 0)
  %t4252 = call ptr @rt_alloc_words(i64 6)
  %t4253 = ptrtoint ptr %t4252 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_881" to i64), ptr %t4252
  %t4254 = or i64 %t4253, 4
  %t4255 = getelementptr i64, ptr %t4252, i64 1
  store i64 %t4235, ptr %t4255
  %t4256 = getelementptr i64, ptr %t4252, i64 2
  store i64 %t4251, ptr %t4256
  %t4257 = getelementptr i64, ptr %t4252, i64 3
  store i64 %t4229, ptr %t4257
  %t4258 = getelementptr i64, ptr %t4252, i64 4
  store i64 %a0, ptr %t4258
  %t4259 = getelementptr i64, ptr %t4252, i64 5
  store i64 %t4254, ptr %t4259
  %t4260 = musttail call fastcc i64 @"scheme.base:code_881"(i64 %t4254, i64 1, i64 %t4229, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4260
}

define fastcc i64 @"scheme.base:code:vector->string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4265 = icmp sge i64 %argc, 1
  br i1 %t4265, label %argok1016, label %arityerr1015
arityerr1015:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1016:
  %t4266 = call ptr @rt_alloc_words(i64 8)
  %t4267 = getelementptr i64, ptr %t4266, i64 0
  store i64 %a0, ptr %t4267
  %t4268 = getelementptr i64, ptr %t4266, i64 1
  store i64 %a1, ptr %t4268
  %t4269 = getelementptr i64, ptr %t4266, i64 2
  store i64 %a2, ptr %t4269
  %t4270 = getelementptr i64, ptr %t4266, i64 3
  store i64 %a3, ptr %t4270
  %t4271 = getelementptr i64, ptr %t4266, i64 4
  store i64 %a4, ptr %t4271
  %t4272 = getelementptr i64, ptr %t4266, i64 5
  store i64 %a5, ptr %t4272
  %t4273 = getelementptr i64, ptr %t4266, i64 6
  store i64 %a6, ptr %t4273
  %t4274 = getelementptr i64, ptr %t4266, i64 7
  store i64 %a7, ptr %t4274
  %t4275 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t4266, ptr %overflow)
  %t4276 = call i64 @rt_vector_length(i64 %a0)
  %t4277 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4277)
  %t4278 = and i64 %t4277, -8
  %t4279 = inttoptr i64 %t4278 to ptr
  %t4280 = load i64, ptr %t4279
  %t4281 = inttoptr i64 %t4280 to ptr
  %t4282 = call fastcc i64%t4281(i64 %t4277, i64 1, i64 %t4275, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4283 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4283)
  %t4284 = and i64 %t4283, -8
  %t4285 = inttoptr i64 %t4284 to ptr
  %t4286 = load i64, ptr %t4285
  %t4287 = inttoptr i64 %t4286 to ptr
  %t4288 = call fastcc i64%t4287(i64 %t4283, i64 2, i64 %t4275, i64 %t4276, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4289 = call i64 @rt_intern(ptr @.str.sym.22)
  %t4290 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4290)
  %t4291 = and i64 %t4290, -8
  %t4292 = inttoptr i64 %t4291 to ptr
  %t4293 = load i64, ptr %t4292
  %t4294 = inttoptr i64 %t4293 to ptr
  %t4295 = call fastcc i64%t4294(i64 %t4290, i64 4, i64 %t4289, i64 %t4282, i64 %t4288, i64 %t4276, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4296 = load i64, ptr @"scheme.base:vector->list"
  call void @rt_check_callable(i64 %t4296)
  %t4297 = and i64 %t4296, -8
  %t4298 = inttoptr i64 %t4297 to ptr
  %t4299 = load i64, ptr %t4298
  %t4300 = inttoptr i64 %t4299 to ptr
  %t4301 = call fastcc i64%t4300(i64 %t4296, i64 3, i64 %a0, i64 %t4282, i64 %t4288, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4302 = call i64 @rt_list_to_string(i64 %t4301)
  ret i64 %t4302
}

define fastcc i64 @"scheme.base:code:string-map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4307 = icmp sge i64 %argc, 2
  br i1 %t4307, label %argok1018, label %arityerr1017
arityerr1017:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1018:
  %t4308 = call ptr @rt_alloc_words(i64 8)
  %t4309 = getelementptr i64, ptr %t4308, i64 0
  store i64 %a0, ptr %t4309
  %t4310 = getelementptr i64, ptr %t4308, i64 1
  store i64 %a1, ptr %t4310
  %t4311 = getelementptr i64, ptr %t4308, i64 2
  store i64 %a2, ptr %t4311
  %t4312 = getelementptr i64, ptr %t4308, i64 3
  store i64 %a3, ptr %t4312
  %t4313 = getelementptr i64, ptr %t4308, i64 4
  store i64 %a4, ptr %t4313
  %t4314 = getelementptr i64, ptr %t4308, i64 5
  store i64 %a5, ptr %t4314
  %t4315 = getelementptr i64, ptr %t4308, i64 6
  store i64 %a6, ptr %t4315
  %t4316 = getelementptr i64, ptr %t4308, i64 7
  store i64 %a7, ptr %t4316
  %t4317 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t4308, ptr %overflow)
  %t4318 = call i64 @rt_null_p(i64 %t4317)
  %t4319 = icmp ne i64 %t4318, 1
  br i1 %t4319, label %then1019, label %else1020
then1019:
  %t4320 = load i64, ptr @"scheme.base:string->list"
  call void @rt_check_callable(i64 %t4320)
  %t4321 = and i64 %t4320, -8
  %t4322 = inttoptr i64 %t4321 to ptr
  %t4323 = load i64, ptr %t4322
  %t4324 = inttoptr i64 %t4323 to ptr
  %t4325 = call fastcc i64%t4324(i64 %t4320, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4326 = load i64, ptr @"scheme.base:str-map1"
  call void @rt_check_callable(i64 %t4326)
  %t4327 = and i64 %t4326, -8
  %t4328 = inttoptr i64 %t4327 to ptr
  %t4329 = load i64, ptr %t4328
  %t4330 = inttoptr i64 %t4329 to ptr
  %t4331 = call fastcc i64%t4330(i64 %t4326, i64 2, i64 %a0, i64 %t4325, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4332 = call i64 @rt_list_to_string(i64 %t4331)
  ret i64 %t4332
else1020:
  %t4333 = call i64 @rt_cons(i64 %a1, i64 %t4317)
  %t4334 = load i64, ptr @"scheme.base:str-mapn"
  call void @rt_check_callable(i64 %t4334)
  %t4335 = and i64 %t4334, -8
  %t4336 = inttoptr i64 %t4335 to ptr
  %t4337 = load i64, ptr %t4336
  %t4338 = inttoptr i64 %t4337 to ptr
  %t4339 = call fastcc i64%t4338(i64 %t4334, i64 2, i64 %a0, i64 %t4333, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4340 = call i64 @rt_list_to_string(i64 %t4339)
  ret i64 %t4340
}

define fastcc i64 @"scheme.base:code:str-map1"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4345 = icmp eq i64 %argc, 2
  br i1 %t4345, label %argok1022, label %arityerr1021
arityerr1021:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1022:
  %t4346 = call i64 @rt_null_p(i64 %a1)
  %t4347 = icmp ne i64 %t4346, 1
  br i1 %t4347, label %then1023, label %else1024
then1023:
  ret i64 2
else1024:
  %t4348 = call i64 @rt_car(i64 %a1)
  call void @rt_check_callable(i64 %a0)
  %t4349 = and i64 %a0, -8
  %t4350 = inttoptr i64 %t4349 to ptr
  %t4351 = load i64, ptr %t4350
  %t4352 = inttoptr i64 %t4351 to ptr
  %t4353 = call fastcc i64%t4352(i64 %a0, i64 1, i64 %t4348, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4354 = call i64 @rt_cdr(i64 %a1)
  %t4355 = load i64, ptr @"scheme.base:str-map1"
  call void @rt_check_callable(i64 %t4355)
  %t4356 = and i64 %t4355, -8
  %t4357 = inttoptr i64 %t4356 to ptr
  %t4358 = load i64, ptr %t4357
  %t4359 = inttoptr i64 %t4358 to ptr
  %t4360 = call fastcc i64%t4359(i64 %t4355, i64 2, i64 %a0, i64 %t4354, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4361 = call i64 @rt_cons(i64 %t4353, i64 %t4360)
  ret i64 %t4361
}

define fastcc i64 @"scheme.base:code_906"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4366 = icmp eq i64 %argc, 1
  br i1 %t4366, label %argok1026, label %arityerr1025
arityerr1025:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1026:
  %t4367 = and i64 %self, -8
  %t4368 = inttoptr i64 %t4367 to ptr
  %t4369 = getelementptr i64, ptr %t4368, i64 1
  %t4370 = load i64, ptr %t4369
  %t4371 = or i64 %a0, %t4370
  %t4372 = and i64 %t4371, 7
  %t4373 = icmp eq i64 %t4372, 0
  br i1 %t4373, label %fixfast1027, label %fixslow1028
fixfast1027:
  %t4374 = icmp eq i64 %a0, %t4370
  %t4375 = select i1 %t4374, i64 257, i64 1
  br label %fixmerge1029
fixslow1028:
  %t4376 = call i64 @rt_num_eq(i64 %a0, i64 %t4370)
  br label %fixmerge1029
fixmerge1029:
  %t4377 = phi i64 [ %t4375, %fixfast1027 ], [ %t4376, %fixslow1028 ]
  %t4378 = icmp ne i64 %t4377, 1
  br i1 %t4378, label %then1030, label %else1031
then1030:
  ret i64 2
else1031:
  %t4379 = and i64 %self, -8
  %t4380 = inttoptr i64 %t4379 to ptr
  %t4381 = getelementptr i64, ptr %t4380, i64 3
  %t4382 = load i64, ptr %t4381
  %t4383 = load i64, ptr @"scheme.base:str-nth"
  call void @rt_check_callable(i64 %t4383)
  %t4384 = and i64 %t4383, -8
  %t4385 = inttoptr i64 %t4384 to ptr
  %t4386 = load i64, ptr %t4385
  %t4387 = inttoptr i64 %t4386 to ptr
  %t4388 = call fastcc i64%t4387(i64 %t4383, i64 2, i64 %t4382, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4389 = and i64 %self, -8
  %t4390 = inttoptr i64 %t4389 to ptr
  %t4391 = getelementptr i64, ptr %t4390, i64 2
  %t4392 = load i64, ptr %t4391
  call void @rt_check_callable(i64 %t4392)
  %t4393 = and i64 %t4392, -8
  %t4394 = inttoptr i64 %t4393 to ptr
  %t4395 = load i64, ptr %t4394
  %t4396 = inttoptr i64 %t4395 to ptr
  %t4397 = call i64 @rt_list_length(i64 %t4388)
  %t4398 = add i64 0, %t4397
  %t4399 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t4388, i64 8)
  %t4411 = getelementptr i64, ptr %t4399, i64 0
  %t4403 = load i64, ptr %t4411
  %t4412 = getelementptr i64, ptr %t4399, i64 1
  %t4404 = load i64, ptr %t4412
  %t4413 = getelementptr i64, ptr %t4399, i64 2
  %t4405 = load i64, ptr %t4413
  %t4414 = getelementptr i64, ptr %t4399, i64 3
  %t4406 = load i64, ptr %t4414
  %t4415 = getelementptr i64, ptr %t4399, i64 4
  %t4407 = load i64, ptr %t4415
  %t4416 = getelementptr i64, ptr %t4399, i64 5
  %t4408 = load i64, ptr %t4416
  %t4417 = getelementptr i64, ptr %t4399, i64 6
  %t4409 = load i64, ptr %t4417
  %t4418 = getelementptr i64, ptr %t4399, i64 7
  %t4410 = load i64, ptr %t4418
  %t4400 = icmp sgt i64 %t4398, 8
  %t4401 = getelementptr i64, ptr %t4399, i64 8
  %t4402 = select i1 %t4400, ptr %t4401, ptr null
  %t4419 = call fastcc i64%t4396(i64 %t4392, i64 %t4398, i64 %t4403, i64 %t4404, i64 %t4405, i64 %t4406, i64 %t4407, i64 %t4408, i64 %t4409, i64 %t4410, ptr %t4402)
  %t4420 = or i64 %a0, 8
  %t4421 = and i64 %t4420, 7
  %t4422 = icmp eq i64 %t4421, 0
  br i1 %t4422, label %fixfast1032, label %fixslow1033
fixfast1032:
  %t4423 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4424 = extractvalue {i64, i1} %t4423, 0
  %t4425 = extractvalue {i64, i1} %t4423, 1
  br i1 %t4425, label %fixslow1033, label %fixmerge1034
fixslow1033:
  %t4426 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1034
fixmerge1034:
  %t4427 = phi i64 [ %t4424, %fixfast1032 ], [ %t4426, %fixslow1033 ]
  %t4428 = call fastcc i64 @"scheme.base:code_906"(i64 %self, i64 1, i64 %t4427, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4429 = call i64 @rt_cons(i64 %t4419, i64 %t4428)
  ret i64 %t4429
}

define fastcc i64 @"scheme.base:code:str-mapn"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4430 = icmp eq i64 %argc, 2
  br i1 %t4430, label %argok1036, label %arityerr1035
arityerr1035:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1036:
  %t4431 = load i64, ptr @"scheme.base:str-min-len"
  call void @rt_check_callable(i64 %t4431)
  %t4432 = and i64 %t4431, -8
  %t4433 = inttoptr i64 %t4432 to ptr
  %t4434 = load i64, ptr %t4433
  %t4435 = inttoptr i64 %t4434 to ptr
  %t4436 = call fastcc i64%t4435(i64 %t4431, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4437 = call ptr @rt_alloc_words(i64 5)
  %t4438 = ptrtoint ptr %t4437 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_906" to i64), ptr %t4437
  %t4439 = or i64 %t4438, 4
  %t4440 = getelementptr i64, ptr %t4437, i64 1
  store i64 %t4436, ptr %t4440
  %t4441 = getelementptr i64, ptr %t4437, i64 2
  store i64 %a0, ptr %t4441
  %t4442 = getelementptr i64, ptr %t4437, i64 3
  store i64 %a1, ptr %t4442
  %t4443 = getelementptr i64, ptr %t4437, i64 4
  store i64 %t4439, ptr %t4443
  %t4444 = musttail call fastcc i64 @"scheme.base:code_906"(i64 %t4439, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4444
}

define fastcc i64 @"scheme.base:code_927"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4449 = icmp eq i64 %argc, 1
  br i1 %t4449, label %argok1038, label %arityerr1037
arityerr1037:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1038:
  %t4450 = and i64 %self, -8
  %t4451 = inttoptr i64 %t4450 to ptr
  %t4452 = getelementptr i64, ptr %t4451, i64 1
  %t4453 = load i64, ptr %t4452
  %t4454 = or i64 %a0, %t4453
  %t4455 = and i64 %t4454, 7
  %t4456 = icmp eq i64 %t4455, 0
  br i1 %t4456, label %fixfast1039, label %fixslow1040
fixfast1039:
  %t4457 = icmp eq i64 %a0, %t4453
  %t4458 = select i1 %t4457, i64 257, i64 1
  br label %fixmerge1041
fixslow1040:
  %t4459 = call i64 @rt_num_eq(i64 %a0, i64 %t4453)
  br label %fixmerge1041
fixmerge1041:
  %t4460 = phi i64 [ %t4458, %fixfast1039 ], [ %t4459, %fixslow1040 ]
  %t4461 = icmp ne i64 %t4460, 1
  br i1 %t4461, label %then1042, label %else1043
then1042:
  %t4462 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4462)
  %t4463 = and i64 %t4462, -8
  %t4464 = inttoptr i64 %t4463 to ptr
  %t4465 = load i64, ptr %t4464
  %t4466 = inttoptr i64 %t4465 to ptr
  %t4467 = musttail call fastcc i64 %t4466(i64 %t4462, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4467
else1043:
  %t4468 = and i64 %self, -8
  %t4469 = inttoptr i64 %t4468 to ptr
  %t4470 = getelementptr i64, ptr %t4469, i64 3
  %t4471 = load i64, ptr %t4470
  %t4472 = call i64 @rt_string_ref(i64 %t4471, i64 %a0)
  %t4473 = and i64 %self, -8
  %t4474 = inttoptr i64 %t4473 to ptr
  %t4475 = getelementptr i64, ptr %t4474, i64 2
  %t4476 = load i64, ptr %t4475
  call void @rt_check_callable(i64 %t4476)
  %t4477 = and i64 %t4476, -8
  %t4478 = inttoptr i64 %t4477 to ptr
  %t4479 = load i64, ptr %t4478
  %t4480 = inttoptr i64 %t4479 to ptr
  %t4481 = call fastcc i64%t4480(i64 %t4476, i64 1, i64 %t4472, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4482 = or i64 %a0, 8
  %t4483 = and i64 %t4482, 7
  %t4484 = icmp eq i64 %t4483, 0
  br i1 %t4484, label %fixfast1044, label %fixslow1045
fixfast1044:
  %t4485 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4486 = extractvalue {i64, i1} %t4485, 0
  %t4487 = extractvalue {i64, i1} %t4485, 1
  br i1 %t4487, label %fixslow1045, label %fixmerge1046
fixslow1045:
  %t4488 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1046
fixmerge1046:
  %t4489 = phi i64 [ %t4486, %fixfast1044 ], [ %t4488, %fixslow1045 ]
  %t4490 = musttail call fastcc i64 @"scheme.base:code_927"(i64 %self, i64 1, i64 %t4489, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4490
}

define fastcc i64 @"scheme.base:code_929"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4491 = icmp eq i64 %argc, 1
  br i1 %t4491, label %argok1048, label %arityerr1047
arityerr1047:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1048:
  %t4492 = and i64 %self, -8
  %t4493 = inttoptr i64 %t4492 to ptr
  %t4494 = getelementptr i64, ptr %t4493, i64 1
  %t4495 = load i64, ptr %t4494
  %t4496 = or i64 %a0, %t4495
  %t4497 = and i64 %t4496, 7
  %t4498 = icmp eq i64 %t4497, 0
  br i1 %t4498, label %fixfast1049, label %fixslow1050
fixfast1049:
  %t4499 = icmp eq i64 %a0, %t4495
  %t4500 = select i1 %t4499, i64 257, i64 1
  br label %fixmerge1051
fixslow1050:
  %t4501 = call i64 @rt_num_eq(i64 %a0, i64 %t4495)
  br label %fixmerge1051
fixmerge1051:
  %t4502 = phi i64 [ %t4500, %fixfast1049 ], [ %t4501, %fixslow1050 ]
  %t4503 = icmp ne i64 %t4502, 1
  br i1 %t4503, label %then1052, label %else1053
then1052:
  %t4504 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4504)
  %t4505 = and i64 %t4504, -8
  %t4506 = inttoptr i64 %t4505 to ptr
  %t4507 = load i64, ptr %t4506
  %t4508 = inttoptr i64 %t4507 to ptr
  %t4509 = musttail call fastcc i64 %t4508(i64 %t4504, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4509
else1053:
  %t4510 = and i64 %self, -8
  %t4511 = inttoptr i64 %t4510 to ptr
  %t4512 = getelementptr i64, ptr %t4511, i64 3
  %t4513 = load i64, ptr %t4512
  %t4514 = load i64, ptr @"scheme.base:str-nth"
  call void @rt_check_callable(i64 %t4514)
  %t4515 = and i64 %t4514, -8
  %t4516 = inttoptr i64 %t4515 to ptr
  %t4517 = load i64, ptr %t4516
  %t4518 = inttoptr i64 %t4517 to ptr
  %t4519 = call fastcc i64%t4518(i64 %t4514, i64 2, i64 %t4513, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4520 = and i64 %self, -8
  %t4521 = inttoptr i64 %t4520 to ptr
  %t4522 = getelementptr i64, ptr %t4521, i64 2
  %t4523 = load i64, ptr %t4522
  call void @rt_check_callable(i64 %t4523)
  %t4524 = and i64 %t4523, -8
  %t4525 = inttoptr i64 %t4524 to ptr
  %t4526 = load i64, ptr %t4525
  %t4527 = inttoptr i64 %t4526 to ptr
  %t4528 = call i64 @rt_list_length(i64 %t4519)
  %t4529 = add i64 0, %t4528
  %t4530 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t4519, i64 8)
  %t4542 = getelementptr i64, ptr %t4530, i64 0
  %t4534 = load i64, ptr %t4542
  %t4543 = getelementptr i64, ptr %t4530, i64 1
  %t4535 = load i64, ptr %t4543
  %t4544 = getelementptr i64, ptr %t4530, i64 2
  %t4536 = load i64, ptr %t4544
  %t4545 = getelementptr i64, ptr %t4530, i64 3
  %t4537 = load i64, ptr %t4545
  %t4546 = getelementptr i64, ptr %t4530, i64 4
  %t4538 = load i64, ptr %t4546
  %t4547 = getelementptr i64, ptr %t4530, i64 5
  %t4539 = load i64, ptr %t4547
  %t4548 = getelementptr i64, ptr %t4530, i64 6
  %t4540 = load i64, ptr %t4548
  %t4549 = getelementptr i64, ptr %t4530, i64 7
  %t4541 = load i64, ptr %t4549
  %t4531 = icmp sgt i64 %t4529, 8
  %t4532 = getelementptr i64, ptr %t4530, i64 8
  %t4533 = select i1 %t4531, ptr %t4532, ptr null
  %t4550 = call fastcc i64%t4527(i64 %t4523, i64 %t4529, i64 %t4534, i64 %t4535, i64 %t4536, i64 %t4537, i64 %t4538, i64 %t4539, i64 %t4540, i64 %t4541, ptr %t4533)
  %t4551 = or i64 %a0, 8
  %t4552 = and i64 %t4551, 7
  %t4553 = icmp eq i64 %t4552, 0
  br i1 %t4553, label %fixfast1054, label %fixslow1055
fixfast1054:
  %t4554 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4555 = extractvalue {i64, i1} %t4554, 0
  %t4556 = extractvalue {i64, i1} %t4554, 1
  br i1 %t4556, label %fixslow1055, label %fixmerge1056
fixslow1055:
  %t4557 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1056
fixmerge1056:
  %t4558 = phi i64 [ %t4555, %fixfast1054 ], [ %t4557, %fixslow1055 ]
  %t4559 = musttail call fastcc i64 @"scheme.base:code_929"(i64 %self, i64 1, i64 %t4558, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4559
}

define fastcc i64 @"scheme.base:code:string-for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4560 = icmp sge i64 %argc, 2
  br i1 %t4560, label %argok1058, label %arityerr1057
arityerr1057:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1058:
  %t4561 = call ptr @rt_alloc_words(i64 8)
  %t4562 = getelementptr i64, ptr %t4561, i64 0
  store i64 %a0, ptr %t4562
  %t4563 = getelementptr i64, ptr %t4561, i64 1
  store i64 %a1, ptr %t4563
  %t4564 = getelementptr i64, ptr %t4561, i64 2
  store i64 %a2, ptr %t4564
  %t4565 = getelementptr i64, ptr %t4561, i64 3
  store i64 %a3, ptr %t4565
  %t4566 = getelementptr i64, ptr %t4561, i64 4
  store i64 %a4, ptr %t4566
  %t4567 = getelementptr i64, ptr %t4561, i64 5
  store i64 %a5, ptr %t4567
  %t4568 = getelementptr i64, ptr %t4561, i64 6
  store i64 %a6, ptr %t4568
  %t4569 = getelementptr i64, ptr %t4561, i64 7
  store i64 %a7, ptr %t4569
  %t4570 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t4561, ptr %overflow)
  %t4571 = call i64 @rt_null_p(i64 %t4570)
  %t4572 = icmp ne i64 %t4571, 1
  br i1 %t4572, label %then1059, label %else1060
then1059:
  %t4573 = call i64 @rt_string_length(i64 %a1)
  %t4574 = call ptr @rt_alloc_words(i64 5)
  %t4575 = ptrtoint ptr %t4574 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_927" to i64), ptr %t4574
  %t4576 = or i64 %t4575, 4
  %t4577 = getelementptr i64, ptr %t4574, i64 1
  store i64 %t4573, ptr %t4577
  %t4578 = getelementptr i64, ptr %t4574, i64 2
  store i64 %a0, ptr %t4578
  %t4579 = getelementptr i64, ptr %t4574, i64 3
  store i64 %a1, ptr %t4579
  %t4580 = getelementptr i64, ptr %t4574, i64 4
  store i64 %t4576, ptr %t4580
  %t4581 = musttail call fastcc i64 @"scheme.base:code_927"(i64 %t4576, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4581
else1060:
  %t4582 = call i64 @rt_cons(i64 %a1, i64 %t4570)
  %t4583 = load i64, ptr @"scheme.base:str-min-len"
  call void @rt_check_callable(i64 %t4583)
  %t4584 = and i64 %t4583, -8
  %t4585 = inttoptr i64 %t4584 to ptr
  %t4586 = load i64, ptr %t4585
  %t4587 = inttoptr i64 %t4586 to ptr
  %t4588 = call fastcc i64%t4587(i64 %t4583, i64 1, i64 %t4582, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4589 = call ptr @rt_alloc_words(i64 5)
  %t4590 = ptrtoint ptr %t4589 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_929" to i64), ptr %t4589
  %t4591 = or i64 %t4590, 4
  %t4592 = getelementptr i64, ptr %t4589, i64 1
  store i64 %t4588, ptr %t4592
  %t4593 = getelementptr i64, ptr %t4589, i64 2
  store i64 %a0, ptr %t4593
  %t4594 = getelementptr i64, ptr %t4589, i64 3
  store i64 %t4582, ptr %t4594
  %t4595 = getelementptr i64, ptr %t4589, i64 4
  store i64 %t4591, ptr %t4595
  %t4596 = musttail call fastcc i64 @"scheme.base:code_929"(i64 %t4591, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4596
}

define fastcc i64 @"scheme.base:code:str-min-len"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4601 = icmp eq i64 %argc, 1
  br i1 %t4601, label %argok1062, label %arityerr1061
arityerr1061:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1062:
  %t4602 = call i64 @rt_cdr(i64 %a0)
  %t4603 = call i64 @rt_null_p(i64 %t4602)
  %t4604 = icmp ne i64 %t4603, 1
  br i1 %t4604, label %then1063, label %else1064
then1063:
  %t4605 = call i64 @rt_car(i64 %a0)
  %t4606 = call i64 @rt_string_length(i64 %t4605)
  ret i64 %t4606
else1064:
  %t4607 = call i64 @rt_car(i64 %a0)
  %t4608 = call i64 @rt_string_length(i64 %t4607)
  %t4609 = call i64 @rt_cdr(i64 %a0)
  %t4610 = load i64, ptr @"scheme.base:str-min-len"
  call void @rt_check_callable(i64 %t4610)
  %t4611 = and i64 %t4610, -8
  %t4612 = inttoptr i64 %t4611 to ptr
  %t4613 = load i64, ptr %t4612
  %t4614 = inttoptr i64 %t4613 to ptr
  %t4615 = call fastcc i64%t4614(i64 %t4610, i64 1, i64 %t4609, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4616 = or i64 %t4608, %t4615
  %t4617 = and i64 %t4616, 7
  %t4618 = icmp eq i64 %t4617, 0
  br i1 %t4618, label %fixfast1065, label %fixslow1066
fixfast1065:
  %t4619 = icmp slt i64 %t4608, %t4615
  %t4620 = select i1 %t4619, i64 257, i64 1
  br label %fixmerge1067
fixslow1066:
  %t4621 = call i64 @rt_lt(i64 %t4608, i64 %t4615)
  br label %fixmerge1067
fixmerge1067:
  %t4622 = phi i64 [ %t4620, %fixfast1065 ], [ %t4621, %fixslow1066 ]
  %t4623 = icmp ne i64 %t4622, 1
  br i1 %t4623, label %then1068, label %else1069
then1068:
  ret i64 %t4608
else1069:
  ret i64 %t4615
}

define fastcc i64 @"scheme.base:code:str-nth"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4628 = icmp eq i64 %argc, 2
  br i1 %t4628, label %argok1071, label %arityerr1070
arityerr1070:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1071:
  %t4629 = call i64 @rt_null_p(i64 %a0)
  %t4630 = icmp ne i64 %t4629, 1
  br i1 %t4630, label %then1072, label %else1073
then1072:
  ret i64 2
else1073:
  %t4631 = call i64 @rt_car(i64 %a0)
  %t4632 = call i64 @rt_string_ref(i64 %t4631, i64 %a1)
  %t4633 = call i64 @rt_cdr(i64 %a0)
  %t4634 = load i64, ptr @"scheme.base:str-nth"
  call void @rt_check_callable(i64 %t4634)
  %t4635 = and i64 %t4634, -8
  %t4636 = inttoptr i64 %t4635 to ptr
  %t4637 = load i64, ptr %t4636
  %t4638 = inttoptr i64 %t4637 to ptr
  %t4639 = call fastcc i64%t4638(i64 %t4634, i64 2, i64 %t4633, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4640 = call i64 @rt_cons(i64 %t4632, i64 %t4639)
  ret i64 %t4640
}

define fastcc i64 @"scheme.base:code_955"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4645 = icmp eq i64 %argc, 1
  br i1 %t4645, label %argok1075, label %arityerr1074
arityerr1074:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1075:
  %t4646 = and i64 %self, -8
  %t4647 = inttoptr i64 %t4646 to ptr
  %t4648 = getelementptr i64, ptr %t4647, i64 1
  %t4649 = load i64, ptr %t4648
  %t4650 = or i64 %a0, %t4649
  %t4651 = and i64 %t4650, 7
  %t4652 = icmp eq i64 %t4651, 0
  br i1 %t4652, label %fixfast1076, label %fixslow1077
fixfast1076:
  %t4653 = icmp eq i64 %a0, %t4649
  %t4654 = select i1 %t4653, i64 257, i64 1
  br label %fixmerge1078
fixslow1077:
  %t4655 = call i64 @rt_num_eq(i64 %a0, i64 %t4649)
  br label %fixmerge1078
fixmerge1078:
  %t4656 = phi i64 [ %t4654, %fixfast1076 ], [ %t4655, %fixslow1077 ]
  %t4657 = icmp ne i64 %t4656, 1
  br i1 %t4657, label %then1079, label %else1080
then1079:
  %t4658 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4658)
  %t4659 = and i64 %t4658, -8
  %t4660 = inttoptr i64 %t4659 to ptr
  %t4661 = load i64, ptr %t4660
  %t4662 = inttoptr i64 %t4661 to ptr
  %t4663 = musttail call fastcc i64 %t4662(i64 %t4658, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4663
else1080:
  %t4664 = and i64 %self, -8
  %t4665 = inttoptr i64 %t4664 to ptr
  %t4666 = getelementptr i64, ptr %t4665, i64 2
  %t4667 = load i64, ptr %t4666
  %t4668 = and i64 %self, -8
  %t4669 = inttoptr i64 %t4668 to ptr
  %t4670 = getelementptr i64, ptr %t4669, i64 3
  %t4671 = load i64, ptr %t4670
  %t4672 = call i64 @rt_string_set(i64 %t4667, i64 %a0, i64 %t4671)
  %t4673 = or i64 %a0, 8
  %t4674 = and i64 %t4673, 7
  %t4675 = icmp eq i64 %t4674, 0
  br i1 %t4675, label %fixfast1081, label %fixslow1082
fixfast1081:
  %t4676 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4677 = extractvalue {i64, i1} %t4676, 0
  %t4678 = extractvalue {i64, i1} %t4676, 1
  br i1 %t4678, label %fixslow1082, label %fixmerge1083
fixslow1082:
  %t4679 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1083
fixmerge1083:
  %t4680 = phi i64 [ %t4677, %fixfast1081 ], [ %t4679, %fixslow1082 ]
  %t4681 = musttail call fastcc i64 @"scheme.base:code_955"(i64 %self, i64 1, i64 %t4680, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4681
}

define fastcc i64 @"scheme.base:code:string-fill!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4682 = icmp sge i64 %argc, 2
  br i1 %t4682, label %argok1085, label %arityerr1084
arityerr1084:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1085:
  %t4683 = call ptr @rt_alloc_words(i64 8)
  %t4684 = getelementptr i64, ptr %t4683, i64 0
  store i64 %a0, ptr %t4684
  %t4685 = getelementptr i64, ptr %t4683, i64 1
  store i64 %a1, ptr %t4685
  %t4686 = getelementptr i64, ptr %t4683, i64 2
  store i64 %a2, ptr %t4686
  %t4687 = getelementptr i64, ptr %t4683, i64 3
  store i64 %a3, ptr %t4687
  %t4688 = getelementptr i64, ptr %t4683, i64 4
  store i64 %a4, ptr %t4688
  %t4689 = getelementptr i64, ptr %t4683, i64 5
  store i64 %a5, ptr %t4689
  %t4690 = getelementptr i64, ptr %t4683, i64 6
  store i64 %a6, ptr %t4690
  %t4691 = getelementptr i64, ptr %t4683, i64 7
  store i64 %a7, ptr %t4691
  %t4692 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t4683, ptr %overflow)
  %t4693 = call i64 @rt_string_length(i64 %a0)
  %t4694 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4694)
  %t4695 = and i64 %t4694, -8
  %t4696 = inttoptr i64 %t4695 to ptr
  %t4697 = load i64, ptr %t4696
  %t4698 = inttoptr i64 %t4697 to ptr
  %t4699 = call fastcc i64%t4698(i64 %t4694, i64 1, i64 %t4692, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4700 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4700)
  %t4701 = and i64 %t4700, -8
  %t4702 = inttoptr i64 %t4701 to ptr
  %t4703 = load i64, ptr %t4702
  %t4704 = inttoptr i64 %t4703 to ptr
  %t4705 = call fastcc i64%t4704(i64 %t4700, i64 2, i64 %t4692, i64 %t4693, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4706 = call i64 @rt_intern(ptr @.str.sym.23)
  %t4707 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4707)
  %t4708 = and i64 %t4707, -8
  %t4709 = inttoptr i64 %t4708 to ptr
  %t4710 = load i64, ptr %t4709
  %t4711 = inttoptr i64 %t4710 to ptr
  %t4712 = call fastcc i64%t4711(i64 %t4707, i64 4, i64 %t4706, i64 %t4699, i64 %t4705, i64 %t4693, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4713 = call ptr @rt_alloc_words(i64 5)
  %t4714 = ptrtoint ptr %t4713 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_955" to i64), ptr %t4713
  %t4715 = or i64 %t4714, 4
  %t4716 = getelementptr i64, ptr %t4713, i64 1
  store i64 %t4705, ptr %t4716
  %t4717 = getelementptr i64, ptr %t4713, i64 2
  store i64 %a0, ptr %t4717
  %t4718 = getelementptr i64, ptr %t4713, i64 3
  store i64 %a1, ptr %t4718
  %t4719 = getelementptr i64, ptr %t4713, i64 4
  store i64 %t4715, ptr %t4719
  %t4720 = musttail call fastcc i64 @"scheme.base:code_955"(i64 %t4715, i64 1, i64 %t4699, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4720
}

define fastcc i64 @"scheme.base:code_981"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4725 = icmp eq i64 %argc, 1
  br i1 %t4725, label %argok1087, label %arityerr1086
arityerr1086:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1087:
  %t4726 = or i64 %a0, 0
  %t4727 = and i64 %t4726, 7
  %t4728 = icmp eq i64 %t4727, 0
  br i1 %t4728, label %fixfast1088, label %fixslow1089
fixfast1088:
  %t4729 = icmp slt i64 %a0, 0
  %t4730 = select i1 %t4729, i64 257, i64 1
  br label %fixmerge1090
fixslow1089:
  %t4731 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge1090
fixmerge1090:
  %t4732 = phi i64 [ %t4730, %fixfast1088 ], [ %t4731, %fixslow1089 ]
  %t4733 = icmp ne i64 %t4732, 1
  br i1 %t4733, label %then1091, label %else1092
then1091:
  %t4734 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4734)
  %t4735 = and i64 %t4734, -8
  %t4736 = inttoptr i64 %t4735 to ptr
  %t4737 = load i64, ptr %t4736
  %t4738 = inttoptr i64 %t4737 to ptr
  %t4739 = musttail call fastcc i64 %t4738(i64 %t4734, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4739
else1092:
  %t4740 = and i64 %self, -8
  %t4741 = inttoptr i64 %t4740 to ptr
  %t4742 = getelementptr i64, ptr %t4741, i64 1
  %t4743 = load i64, ptr %t4742
  %t4744 = and i64 %self, -8
  %t4745 = inttoptr i64 %t4744 to ptr
  %t4746 = getelementptr i64, ptr %t4745, i64 2
  %t4747 = load i64, ptr %t4746
  %t4748 = or i64 %t4747, %a0
  %t4749 = and i64 %t4748, 7
  %t4750 = icmp eq i64 %t4749, 0
  br i1 %t4750, label %fixfast1093, label %fixslow1094
fixfast1093:
  %t4751 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4747, i64 %a0)
  %t4752 = extractvalue {i64, i1} %t4751, 0
  %t4753 = extractvalue {i64, i1} %t4751, 1
  br i1 %t4753, label %fixslow1094, label %fixmerge1095
fixslow1094:
  %t4754 = call i64 @rt_add(i64 %t4747, i64 %a0)
  br label %fixmerge1095
fixmerge1095:
  %t4755 = phi i64 [ %t4752, %fixfast1093 ], [ %t4754, %fixslow1094 ]
  %t4756 = and i64 %self, -8
  %t4757 = inttoptr i64 %t4756 to ptr
  %t4758 = getelementptr i64, ptr %t4757, i64 3
  %t4759 = load i64, ptr %t4758
  %t4760 = and i64 %self, -8
  %t4761 = inttoptr i64 %t4760 to ptr
  %t4762 = getelementptr i64, ptr %t4761, i64 4
  %t4763 = load i64, ptr %t4762
  %t4764 = or i64 %t4763, %a0
  %t4765 = and i64 %t4764, 7
  %t4766 = icmp eq i64 %t4765, 0
  br i1 %t4766, label %fixfast1096, label %fixslow1097
fixfast1096:
  %t4767 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4763, i64 %a0)
  %t4768 = extractvalue {i64, i1} %t4767, 0
  %t4769 = extractvalue {i64, i1} %t4767, 1
  br i1 %t4769, label %fixslow1097, label %fixmerge1098
fixslow1097:
  %t4770 = call i64 @rt_add(i64 %t4763, i64 %a0)
  br label %fixmerge1098
fixmerge1098:
  %t4771 = phi i64 [ %t4768, %fixfast1096 ], [ %t4770, %fixslow1097 ]
  %t4772 = call i64 @rt_string_ref(i64 %t4759, i64 %t4771)
  %t4773 = call i64 @rt_string_set(i64 %t4743, i64 %t4755, i64 %t4772)
  %t4774 = or i64 %a0, 8
  %t4775 = and i64 %t4774, 7
  %t4776 = icmp eq i64 %t4775, 0
  br i1 %t4776, label %fixfast1099, label %fixslow1100
fixfast1099:
  %t4777 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t4778 = extractvalue {i64, i1} %t4777, 0
  %t4779 = extractvalue {i64, i1} %t4777, 1
  br i1 %t4779, label %fixslow1100, label %fixmerge1101
fixslow1100:
  %t4780 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge1101
fixmerge1101:
  %t4781 = phi i64 [ %t4778, %fixfast1099 ], [ %t4780, %fixslow1100 ]
  %t4782 = musttail call fastcc i64 @"scheme.base:code_981"(i64 %self, i64 1, i64 %t4781, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4782
}

define fastcc i64 @"scheme.base:code_983"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4783 = icmp eq i64 %argc, 1
  br i1 %t4783, label %argok1103, label %arityerr1102
arityerr1102:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1103:
  %t4784 = and i64 %self, -8
  %t4785 = inttoptr i64 %t4784 to ptr
  %t4786 = getelementptr i64, ptr %t4785, i64 1
  %t4787 = load i64, ptr %t4786
  %t4788 = and i64 %self, -8
  %t4789 = inttoptr i64 %t4788 to ptr
  %t4790 = getelementptr i64, ptr %t4789, i64 2
  %t4791 = load i64, ptr %t4790
  %t4792 = or i64 %t4787, %t4791
  %t4793 = and i64 %t4792, 7
  %t4794 = icmp eq i64 %t4793, 0
  br i1 %t4794, label %fixfast1104, label %fixslow1105
fixfast1104:
  %t4795 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4787, i64 %t4791)
  %t4796 = extractvalue {i64, i1} %t4795, 0
  %t4797 = extractvalue {i64, i1} %t4795, 1
  br i1 %t4797, label %fixslow1105, label %fixmerge1106
fixslow1105:
  %t4798 = call i64 @rt_sub(i64 %t4787, i64 %t4791)
  br label %fixmerge1106
fixmerge1106:
  %t4799 = phi i64 [ %t4796, %fixfast1104 ], [ %t4798, %fixslow1105 ]
  %t4800 = or i64 %a0, %t4799
  %t4801 = and i64 %t4800, 7
  %t4802 = icmp eq i64 %t4801, 0
  br i1 %t4802, label %fixfast1107, label %fixslow1108
fixfast1107:
  %t4803 = icmp eq i64 %a0, %t4799
  %t4804 = select i1 %t4803, i64 257, i64 1
  br label %fixmerge1109
fixslow1108:
  %t4805 = call i64 @rt_num_eq(i64 %a0, i64 %t4799)
  br label %fixmerge1109
fixmerge1109:
  %t4806 = phi i64 [ %t4804, %fixfast1107 ], [ %t4805, %fixslow1108 ]
  %t4807 = icmp ne i64 %t4806, 1
  br i1 %t4807, label %then1110, label %else1111
then1110:
  %t4808 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4808)
  %t4809 = and i64 %t4808, -8
  %t4810 = inttoptr i64 %t4809 to ptr
  %t4811 = load i64, ptr %t4810
  %t4812 = inttoptr i64 %t4811 to ptr
  %t4813 = musttail call fastcc i64 %t4812(i64 %t4808, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4813
else1111:
  %t4814 = and i64 %self, -8
  %t4815 = inttoptr i64 %t4814 to ptr
  %t4816 = getelementptr i64, ptr %t4815, i64 3
  %t4817 = load i64, ptr %t4816
  %t4818 = and i64 %self, -8
  %t4819 = inttoptr i64 %t4818 to ptr
  %t4820 = getelementptr i64, ptr %t4819, i64 4
  %t4821 = load i64, ptr %t4820
  %t4822 = or i64 %t4821, %a0
  %t4823 = and i64 %t4822, 7
  %t4824 = icmp eq i64 %t4823, 0
  br i1 %t4824, label %fixfast1112, label %fixslow1113
fixfast1112:
  %t4825 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4821, i64 %a0)
  %t4826 = extractvalue {i64, i1} %t4825, 0
  %t4827 = extractvalue {i64, i1} %t4825, 1
  br i1 %t4827, label %fixslow1113, label %fixmerge1114
fixslow1113:
  %t4828 = call i64 @rt_add(i64 %t4821, i64 %a0)
  br label %fixmerge1114
fixmerge1114:
  %t4829 = phi i64 [ %t4826, %fixfast1112 ], [ %t4828, %fixslow1113 ]
  %t4830 = and i64 %self, -8
  %t4831 = inttoptr i64 %t4830 to ptr
  %t4832 = getelementptr i64, ptr %t4831, i64 5
  %t4833 = load i64, ptr %t4832
  %t4834 = and i64 %self, -8
  %t4835 = inttoptr i64 %t4834 to ptr
  %t4836 = getelementptr i64, ptr %t4835, i64 2
  %t4837 = load i64, ptr %t4836
  %t4838 = or i64 %t4837, %a0
  %t4839 = and i64 %t4838, 7
  %t4840 = icmp eq i64 %t4839, 0
  br i1 %t4840, label %fixfast1115, label %fixslow1116
fixfast1115:
  %t4841 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4837, i64 %a0)
  %t4842 = extractvalue {i64, i1} %t4841, 0
  %t4843 = extractvalue {i64, i1} %t4841, 1
  br i1 %t4843, label %fixslow1116, label %fixmerge1117
fixslow1116:
  %t4844 = call i64 @rt_add(i64 %t4837, i64 %a0)
  br label %fixmerge1117
fixmerge1117:
  %t4845 = phi i64 [ %t4842, %fixfast1115 ], [ %t4844, %fixslow1116 ]
  %t4846 = call i64 @rt_string_ref(i64 %t4833, i64 %t4845)
  %t4847 = call i64 @rt_string_set(i64 %t4817, i64 %t4829, i64 %t4846)
  %t4848 = or i64 %a0, 8
  %t4849 = and i64 %t4848, 7
  %t4850 = icmp eq i64 %t4849, 0
  br i1 %t4850, label %fixfast1118, label %fixslow1119
fixfast1118:
  %t4851 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4852 = extractvalue {i64, i1} %t4851, 0
  %t4853 = extractvalue {i64, i1} %t4851, 1
  br i1 %t4853, label %fixslow1119, label %fixmerge1120
fixslow1119:
  %t4854 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1120
fixmerge1120:
  %t4855 = phi i64 [ %t4852, %fixfast1118 ], [ %t4854, %fixslow1119 ]
  %t4856 = musttail call fastcc i64 @"scheme.base:code_983"(i64 %self, i64 1, i64 %t4855, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4856
}

define fastcc i64 @"scheme.base:code:string-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4857 = icmp sge i64 %argc, 3
  br i1 %t4857, label %argok1122, label %arityerr1121
arityerr1121:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1122:
  %t4858 = call ptr @rt_alloc_words(i64 8)
  %t4859 = getelementptr i64, ptr %t4858, i64 0
  store i64 %a0, ptr %t4859
  %t4860 = getelementptr i64, ptr %t4858, i64 1
  store i64 %a1, ptr %t4860
  %t4861 = getelementptr i64, ptr %t4858, i64 2
  store i64 %a2, ptr %t4861
  %t4862 = getelementptr i64, ptr %t4858, i64 3
  store i64 %a3, ptr %t4862
  %t4863 = getelementptr i64, ptr %t4858, i64 4
  store i64 %a4, ptr %t4863
  %t4864 = getelementptr i64, ptr %t4858, i64 5
  store i64 %a5, ptr %t4864
  %t4865 = getelementptr i64, ptr %t4858, i64 6
  store i64 %a6, ptr %t4865
  %t4866 = getelementptr i64, ptr %t4858, i64 7
  store i64 %a7, ptr %t4866
  %t4867 = call i64 @rt_build_rest(i64 %argc, i64 3, i64 8, ptr %t4858, ptr %overflow)
  %t4868 = call i64 @rt_string_length(i64 %a2)
  %t4869 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4869)
  %t4870 = and i64 %t4869, -8
  %t4871 = inttoptr i64 %t4870 to ptr
  %t4872 = load i64, ptr %t4871
  %t4873 = inttoptr i64 %t4872 to ptr
  %t4874 = call fastcc i64%t4873(i64 %t4869, i64 1, i64 %t4867, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4875 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4875)
  %t4876 = and i64 %t4875, -8
  %t4877 = inttoptr i64 %t4876 to ptr
  %t4878 = load i64, ptr %t4877
  %t4879 = inttoptr i64 %t4878 to ptr
  %t4880 = call fastcc i64%t4879(i64 %t4875, i64 2, i64 %t4867, i64 %t4868, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4881 = call i64 @rt_intern(ptr @.str.sym.24)
  %t4882 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4882)
  %t4883 = and i64 %t4882, -8
  %t4884 = inttoptr i64 %t4883 to ptr
  %t4885 = load i64, ptr %t4884
  %t4886 = inttoptr i64 %t4885 to ptr
  %t4887 = call fastcc i64%t4886(i64 %t4882, i64 4, i64 %t4881, i64 %t4874, i64 %t4880, i64 %t4868, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4888 = call i64 @rt_intern(ptr @.str.sym.24)
  %t4889 = or i64 %t4880, %t4874
  %t4890 = and i64 %t4889, 7
  %t4891 = icmp eq i64 %t4890, 0
  br i1 %t4891, label %fixfast1123, label %fixslow1124
fixfast1123:
  %t4892 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4880, i64 %t4874)
  %t4893 = extractvalue {i64, i1} %t4892, 0
  %t4894 = extractvalue {i64, i1} %t4892, 1
  br i1 %t4894, label %fixslow1124, label %fixmerge1125
fixslow1124:
  %t4895 = call i64 @rt_sub(i64 %t4880, i64 %t4874)
  br label %fixmerge1125
fixmerge1125:
  %t4896 = phi i64 [ %t4893, %fixfast1123 ], [ %t4895, %fixslow1124 ]
  %t4897 = or i64 %a1, %t4896
  %t4898 = and i64 %t4897, 7
  %t4899 = icmp eq i64 %t4898, 0
  br i1 %t4899, label %fixfast1126, label %fixslow1127
fixfast1126:
  %t4900 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t4896)
  %t4901 = extractvalue {i64, i1} %t4900, 0
  %t4902 = extractvalue {i64, i1} %t4900, 1
  br i1 %t4902, label %fixslow1127, label %fixmerge1128
fixslow1127:
  %t4903 = call i64 @rt_add(i64 %a1, i64 %t4896)
  br label %fixmerge1128
fixmerge1128:
  %t4904 = phi i64 [ %t4901, %fixfast1126 ], [ %t4903, %fixslow1127 ]
  %t4905 = call i64 @rt_string_length(i64 %a0)
  %t4906 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4906)
  %t4907 = and i64 %t4906, -8
  %t4908 = inttoptr i64 %t4907 to ptr
  %t4909 = load i64, ptr %t4908
  %t4910 = inttoptr i64 %t4909 to ptr
  %t4911 = call fastcc i64%t4910(i64 %t4906, i64 4, i64 %t4888, i64 %a1, i64 %t4904, i64 %t4905, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4912 = or i64 %t4874, %a1
  %t4913 = and i64 %t4912, 7
  %t4914 = icmp eq i64 %t4913, 0
  br i1 %t4914, label %fixfast1129, label %fixslow1130
fixfast1129:
  %t4915 = icmp slt i64 %t4874, %a1
  %t4916 = select i1 %t4915, i64 257, i64 1
  br label %fixmerge1131
fixslow1130:
  %t4917 = call i64 @rt_lt(i64 %t4874, i64 %a1)
  br label %fixmerge1131
fixmerge1131:
  %t4918 = phi i64 [ %t4916, %fixfast1129 ], [ %t4917, %fixslow1130 ]
  %t4919 = icmp ne i64 %t4918, 1
  br i1 %t4919, label %then1132, label %else1133
then1132:
  %t4920 = call ptr @rt_alloc_words(i64 6)
  %t4921 = ptrtoint ptr %t4920 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_981" to i64), ptr %t4920
  %t4922 = or i64 %t4921, 4
  %t4923 = getelementptr i64, ptr %t4920, i64 1
  store i64 %a0, ptr %t4923
  %t4924 = getelementptr i64, ptr %t4920, i64 2
  store i64 %a1, ptr %t4924
  %t4925 = getelementptr i64, ptr %t4920, i64 3
  store i64 %a2, ptr %t4925
  %t4926 = getelementptr i64, ptr %t4920, i64 4
  store i64 %t4874, ptr %t4926
  %t4927 = getelementptr i64, ptr %t4920, i64 5
  store i64 %t4922, ptr %t4927
  %t4928 = or i64 %t4880, %t4874
  %t4929 = and i64 %t4928, 7
  %t4930 = icmp eq i64 %t4929, 0
  br i1 %t4930, label %fixfast1134, label %fixslow1135
fixfast1134:
  %t4931 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4880, i64 %t4874)
  %t4932 = extractvalue {i64, i1} %t4931, 0
  %t4933 = extractvalue {i64, i1} %t4931, 1
  br i1 %t4933, label %fixslow1135, label %fixmerge1136
fixslow1135:
  %t4934 = call i64 @rt_sub(i64 %t4880, i64 %t4874)
  br label %fixmerge1136
fixmerge1136:
  %t4935 = phi i64 [ %t4932, %fixfast1134 ], [ %t4934, %fixslow1135 ]
  %t4936 = or i64 %t4935, 8
  %t4937 = and i64 %t4936, 7
  %t4938 = icmp eq i64 %t4937, 0
  br i1 %t4938, label %fixfast1137, label %fixslow1138
fixfast1137:
  %t4939 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4935, i64 8)
  %t4940 = extractvalue {i64, i1} %t4939, 0
  %t4941 = extractvalue {i64, i1} %t4939, 1
  br i1 %t4941, label %fixslow1138, label %fixmerge1139
fixslow1138:
  %t4942 = call i64 @rt_sub(i64 %t4935, i64 8)
  br label %fixmerge1139
fixmerge1139:
  %t4943 = phi i64 [ %t4940, %fixfast1137 ], [ %t4942, %fixslow1138 ]
  %t4944 = musttail call fastcc i64 @"scheme.base:code_981"(i64 %t4922, i64 1, i64 %t4943, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4944
else1133:
  %t4945 = call ptr @rt_alloc_words(i64 7)
  %t4946 = ptrtoint ptr %t4945 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_983" to i64), ptr %t4945
  %t4947 = or i64 %t4946, 4
  %t4948 = getelementptr i64, ptr %t4945, i64 1
  store i64 %t4880, ptr %t4948
  %t4949 = getelementptr i64, ptr %t4945, i64 2
  store i64 %t4874, ptr %t4949
  %t4950 = getelementptr i64, ptr %t4945, i64 3
  store i64 %a0, ptr %t4950
  %t4951 = getelementptr i64, ptr %t4945, i64 4
  store i64 %a1, ptr %t4951
  %t4952 = getelementptr i64, ptr %t4945, i64 5
  store i64 %a2, ptr %t4952
  %t4953 = getelementptr i64, ptr %t4945, i64 6
  store i64 %t4947, ptr %t4953
  %t4954 = musttail call fastcc i64 @"scheme.base:code_983"(i64 %t4947, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4954
}

define fastcc i64 @"scheme.base:code_998"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4959 = icmp eq i64 %argc, 1
  br i1 %t4959, label %argok1141, label %arityerr1140
arityerr1140:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1141:
  %t4960 = and i64 %self, -8
  %t4961 = inttoptr i64 %t4960 to ptr
  %t4962 = getelementptr i64, ptr %t4961, i64 1
  %t4963 = load i64, ptr %t4962
  %t4964 = or i64 %a0, %t4963
  %t4965 = and i64 %t4964, 7
  %t4966 = icmp eq i64 %t4965, 0
  br i1 %t4966, label %fixfast1142, label %fixslow1143
fixfast1142:
  %t4967 = icmp eq i64 %a0, %t4963
  %t4968 = select i1 %t4967, i64 257, i64 1
  br label %fixmerge1144
fixslow1143:
  %t4969 = call i64 @rt_num_eq(i64 %a0, i64 %t4963)
  br label %fixmerge1144
fixmerge1144:
  %t4970 = phi i64 [ %t4968, %fixfast1142 ], [ %t4969, %fixslow1143 ]
  %t4971 = icmp ne i64 %t4970, 1
  br i1 %t4971, label %then1145, label %else1146
then1145:
  %t4972 = and i64 %self, -8
  %t4973 = inttoptr i64 %t4972 to ptr
  %t4974 = getelementptr i64, ptr %t4973, i64 2
  %t4975 = load i64, ptr %t4974
  ret i64 %t4975
else1146:
  %t4976 = and i64 %self, -8
  %t4977 = inttoptr i64 %t4976 to ptr
  %t4978 = getelementptr i64, ptr %t4977, i64 2
  %t4979 = load i64, ptr %t4978
  %t4980 = and i64 %self, -8
  %t4981 = inttoptr i64 %t4980 to ptr
  %t4982 = getelementptr i64, ptr %t4981, i64 3
  %t4983 = load i64, ptr %t4982
  %t4984 = or i64 %a0, %t4983
  %t4985 = and i64 %t4984, 7
  %t4986 = icmp eq i64 %t4985, 0
  br i1 %t4986, label %fixfast1147, label %fixslow1148
fixfast1147:
  %t4987 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t4983)
  %t4988 = extractvalue {i64, i1} %t4987, 0
  %t4989 = extractvalue {i64, i1} %t4987, 1
  br i1 %t4989, label %fixslow1148, label %fixmerge1149
fixslow1148:
  %t4990 = call i64 @rt_sub(i64 %a0, i64 %t4983)
  br label %fixmerge1149
fixmerge1149:
  %t4991 = phi i64 [ %t4988, %fixfast1147 ], [ %t4990, %fixslow1148 ]
  %t4992 = and i64 %self, -8
  %t4993 = inttoptr i64 %t4992 to ptr
  %t4994 = getelementptr i64, ptr %t4993, i64 4
  %t4995 = load i64, ptr %t4994
  %t4996 = call i64 @rt_bytevector_u8_ref(i64 %t4995, i64 %a0)
  %t4997 = call i64 @rt_bytevector_u8_set(i64 %t4979, i64 %t4991, i64 %t4996)
  %t4998 = or i64 %a0, 8
  %t4999 = and i64 %t4998, 7
  %t5000 = icmp eq i64 %t4999, 0
  br i1 %t5000, label %fixfast1150, label %fixslow1151
fixfast1150:
  %t5001 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5002 = extractvalue {i64, i1} %t5001, 0
  %t5003 = extractvalue {i64, i1} %t5001, 1
  br i1 %t5003, label %fixslow1151, label %fixmerge1152
fixslow1151:
  %t5004 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1152
fixmerge1152:
  %t5005 = phi i64 [ %t5002, %fixfast1150 ], [ %t5004, %fixslow1151 ]
  %t5006 = musttail call fastcc i64 @"scheme.base:code_998"(i64 %self, i64 1, i64 %t5005, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5006
}

define fastcc i64 @"scheme.base:code:bytevector-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5007 = icmp sge i64 %argc, 1
  br i1 %t5007, label %argok1154, label %arityerr1153
arityerr1153:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1154:
  %t5008 = call ptr @rt_alloc_words(i64 8)
  %t5009 = getelementptr i64, ptr %t5008, i64 0
  store i64 %a0, ptr %t5009
  %t5010 = getelementptr i64, ptr %t5008, i64 1
  store i64 %a1, ptr %t5010
  %t5011 = getelementptr i64, ptr %t5008, i64 2
  store i64 %a2, ptr %t5011
  %t5012 = getelementptr i64, ptr %t5008, i64 3
  store i64 %a3, ptr %t5012
  %t5013 = getelementptr i64, ptr %t5008, i64 4
  store i64 %a4, ptr %t5013
  %t5014 = getelementptr i64, ptr %t5008, i64 5
  store i64 %a5, ptr %t5014
  %t5015 = getelementptr i64, ptr %t5008, i64 6
  store i64 %a6, ptr %t5015
  %t5016 = getelementptr i64, ptr %t5008, i64 7
  store i64 %a7, ptr %t5016
  %t5017 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t5008, ptr %overflow)
  %t5018 = call i64 @rt_bytevector_length(i64 %a0)
  %t5019 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5019)
  %t5020 = and i64 %t5019, -8
  %t5021 = inttoptr i64 %t5020 to ptr
  %t5022 = load i64, ptr %t5021
  %t5023 = inttoptr i64 %t5022 to ptr
  %t5024 = call fastcc i64%t5023(i64 %t5019, i64 1, i64 %t5017, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5025 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5025)
  %t5026 = and i64 %t5025, -8
  %t5027 = inttoptr i64 %t5026 to ptr
  %t5028 = load i64, ptr %t5027
  %t5029 = inttoptr i64 %t5028 to ptr
  %t5030 = call fastcc i64%t5029(i64 %t5025, i64 2, i64 %t5017, i64 %t5018, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5031 = call i64 @rt_intern(ptr @.str.sym.25)
  %t5032 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5032)
  %t5033 = and i64 %t5032, -8
  %t5034 = inttoptr i64 %t5033 to ptr
  %t5035 = load i64, ptr %t5034
  %t5036 = inttoptr i64 %t5035 to ptr
  %t5037 = call fastcc i64%t5036(i64 %t5032, i64 4, i64 %t5031, i64 %t5024, i64 %t5030, i64 %t5018, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5038 = or i64 %t5030, %t5024
  %t5039 = and i64 %t5038, 7
  %t5040 = icmp eq i64 %t5039, 0
  br i1 %t5040, label %fixfast1155, label %fixslow1156
fixfast1155:
  %t5041 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5030, i64 %t5024)
  %t5042 = extractvalue {i64, i1} %t5041, 0
  %t5043 = extractvalue {i64, i1} %t5041, 1
  br i1 %t5043, label %fixslow1156, label %fixmerge1157
fixslow1156:
  %t5044 = call i64 @rt_sub(i64 %t5030, i64 %t5024)
  br label %fixmerge1157
fixmerge1157:
  %t5045 = phi i64 [ %t5042, %fixfast1155 ], [ %t5044, %fixslow1156 ]
  %t5046 = call i64 @rt_make_bytevector(i64 %t5045, i64 0)
  %t5047 = call ptr @rt_alloc_words(i64 6)
  %t5048 = ptrtoint ptr %t5047 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_998" to i64), ptr %t5047
  %t5049 = or i64 %t5048, 4
  %t5050 = getelementptr i64, ptr %t5047, i64 1
  store i64 %t5030, ptr %t5050
  %t5051 = getelementptr i64, ptr %t5047, i64 2
  store i64 %t5046, ptr %t5051
  %t5052 = getelementptr i64, ptr %t5047, i64 3
  store i64 %t5024, ptr %t5052
  %t5053 = getelementptr i64, ptr %t5047, i64 4
  store i64 %a0, ptr %t5053
  %t5054 = getelementptr i64, ptr %t5047, i64 5
  store i64 %t5049, ptr %t5054
  %t5055 = musttail call fastcc i64 @"scheme.base:code_998"(i64 %t5049, i64 1, i64 %t5024, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5055
}

define fastcc i64 @"scheme.base:code_1024"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5060 = icmp eq i64 %argc, 1
  br i1 %t5060, label %argok1159, label %arityerr1158
arityerr1158:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1159:
  %t5061 = or i64 %a0, 0
  %t5062 = and i64 %t5061, 7
  %t5063 = icmp eq i64 %t5062, 0
  br i1 %t5063, label %fixfast1160, label %fixslow1161
fixfast1160:
  %t5064 = icmp slt i64 %a0, 0
  %t5065 = select i1 %t5064, i64 257, i64 1
  br label %fixmerge1162
fixslow1161:
  %t5066 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge1162
fixmerge1162:
  %t5067 = phi i64 [ %t5065, %fixfast1160 ], [ %t5066, %fixslow1161 ]
  %t5068 = icmp ne i64 %t5067, 1
  br i1 %t5068, label %then1163, label %else1164
then1163:
  %t5069 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t5069)
  %t5070 = and i64 %t5069, -8
  %t5071 = inttoptr i64 %t5070 to ptr
  %t5072 = load i64, ptr %t5071
  %t5073 = inttoptr i64 %t5072 to ptr
  %t5074 = musttail call fastcc i64 %t5073(i64 %t5069, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5074
else1164:
  %t5075 = and i64 %self, -8
  %t5076 = inttoptr i64 %t5075 to ptr
  %t5077 = getelementptr i64, ptr %t5076, i64 1
  %t5078 = load i64, ptr %t5077
  %t5079 = and i64 %self, -8
  %t5080 = inttoptr i64 %t5079 to ptr
  %t5081 = getelementptr i64, ptr %t5080, i64 2
  %t5082 = load i64, ptr %t5081
  %t5083 = or i64 %t5082, %a0
  %t5084 = and i64 %t5083, 7
  %t5085 = icmp eq i64 %t5084, 0
  br i1 %t5085, label %fixfast1165, label %fixslow1166
fixfast1165:
  %t5086 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5082, i64 %a0)
  %t5087 = extractvalue {i64, i1} %t5086, 0
  %t5088 = extractvalue {i64, i1} %t5086, 1
  br i1 %t5088, label %fixslow1166, label %fixmerge1167
fixslow1166:
  %t5089 = call i64 @rt_add(i64 %t5082, i64 %a0)
  br label %fixmerge1167
fixmerge1167:
  %t5090 = phi i64 [ %t5087, %fixfast1165 ], [ %t5089, %fixslow1166 ]
  %t5091 = and i64 %self, -8
  %t5092 = inttoptr i64 %t5091 to ptr
  %t5093 = getelementptr i64, ptr %t5092, i64 3
  %t5094 = load i64, ptr %t5093
  %t5095 = and i64 %self, -8
  %t5096 = inttoptr i64 %t5095 to ptr
  %t5097 = getelementptr i64, ptr %t5096, i64 4
  %t5098 = load i64, ptr %t5097
  %t5099 = or i64 %t5098, %a0
  %t5100 = and i64 %t5099, 7
  %t5101 = icmp eq i64 %t5100, 0
  br i1 %t5101, label %fixfast1168, label %fixslow1169
fixfast1168:
  %t5102 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5098, i64 %a0)
  %t5103 = extractvalue {i64, i1} %t5102, 0
  %t5104 = extractvalue {i64, i1} %t5102, 1
  br i1 %t5104, label %fixslow1169, label %fixmerge1170
fixslow1169:
  %t5105 = call i64 @rt_add(i64 %t5098, i64 %a0)
  br label %fixmerge1170
fixmerge1170:
  %t5106 = phi i64 [ %t5103, %fixfast1168 ], [ %t5105, %fixslow1169 ]
  %t5107 = call i64 @rt_bytevector_u8_ref(i64 %t5094, i64 %t5106)
  %t5108 = call i64 @rt_bytevector_u8_set(i64 %t5078, i64 %t5090, i64 %t5107)
  %t5109 = or i64 %a0, 8
  %t5110 = and i64 %t5109, 7
  %t5111 = icmp eq i64 %t5110, 0
  br i1 %t5111, label %fixfast1171, label %fixslow1172
fixfast1171:
  %t5112 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t5113 = extractvalue {i64, i1} %t5112, 0
  %t5114 = extractvalue {i64, i1} %t5112, 1
  br i1 %t5114, label %fixslow1172, label %fixmerge1173
fixslow1172:
  %t5115 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge1173
fixmerge1173:
  %t5116 = phi i64 [ %t5113, %fixfast1171 ], [ %t5115, %fixslow1172 ]
  %t5117 = musttail call fastcc i64 @"scheme.base:code_1024"(i64 %self, i64 1, i64 %t5116, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5117
}

define fastcc i64 @"scheme.base:code_1026"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5118 = icmp eq i64 %argc, 1
  br i1 %t5118, label %argok1175, label %arityerr1174
arityerr1174:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1175:
  %t5119 = and i64 %self, -8
  %t5120 = inttoptr i64 %t5119 to ptr
  %t5121 = getelementptr i64, ptr %t5120, i64 1
  %t5122 = load i64, ptr %t5121
  %t5123 = and i64 %self, -8
  %t5124 = inttoptr i64 %t5123 to ptr
  %t5125 = getelementptr i64, ptr %t5124, i64 2
  %t5126 = load i64, ptr %t5125
  %t5127 = or i64 %t5122, %t5126
  %t5128 = and i64 %t5127, 7
  %t5129 = icmp eq i64 %t5128, 0
  br i1 %t5129, label %fixfast1176, label %fixslow1177
fixfast1176:
  %t5130 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5122, i64 %t5126)
  %t5131 = extractvalue {i64, i1} %t5130, 0
  %t5132 = extractvalue {i64, i1} %t5130, 1
  br i1 %t5132, label %fixslow1177, label %fixmerge1178
fixslow1177:
  %t5133 = call i64 @rt_sub(i64 %t5122, i64 %t5126)
  br label %fixmerge1178
fixmerge1178:
  %t5134 = phi i64 [ %t5131, %fixfast1176 ], [ %t5133, %fixslow1177 ]
  %t5135 = or i64 %a0, %t5134
  %t5136 = and i64 %t5135, 7
  %t5137 = icmp eq i64 %t5136, 0
  br i1 %t5137, label %fixfast1179, label %fixslow1180
fixfast1179:
  %t5138 = icmp eq i64 %a0, %t5134
  %t5139 = select i1 %t5138, i64 257, i64 1
  br label %fixmerge1181
fixslow1180:
  %t5140 = call i64 @rt_num_eq(i64 %a0, i64 %t5134)
  br label %fixmerge1181
fixmerge1181:
  %t5141 = phi i64 [ %t5139, %fixfast1179 ], [ %t5140, %fixslow1180 ]
  %t5142 = icmp ne i64 %t5141, 1
  br i1 %t5142, label %then1182, label %else1183
then1182:
  %t5143 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t5143)
  %t5144 = and i64 %t5143, -8
  %t5145 = inttoptr i64 %t5144 to ptr
  %t5146 = load i64, ptr %t5145
  %t5147 = inttoptr i64 %t5146 to ptr
  %t5148 = musttail call fastcc i64 %t5147(i64 %t5143, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5148
else1183:
  %t5149 = and i64 %self, -8
  %t5150 = inttoptr i64 %t5149 to ptr
  %t5151 = getelementptr i64, ptr %t5150, i64 3
  %t5152 = load i64, ptr %t5151
  %t5153 = and i64 %self, -8
  %t5154 = inttoptr i64 %t5153 to ptr
  %t5155 = getelementptr i64, ptr %t5154, i64 4
  %t5156 = load i64, ptr %t5155
  %t5157 = or i64 %t5156, %a0
  %t5158 = and i64 %t5157, 7
  %t5159 = icmp eq i64 %t5158, 0
  br i1 %t5159, label %fixfast1184, label %fixslow1185
fixfast1184:
  %t5160 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5156, i64 %a0)
  %t5161 = extractvalue {i64, i1} %t5160, 0
  %t5162 = extractvalue {i64, i1} %t5160, 1
  br i1 %t5162, label %fixslow1185, label %fixmerge1186
fixslow1185:
  %t5163 = call i64 @rt_add(i64 %t5156, i64 %a0)
  br label %fixmerge1186
fixmerge1186:
  %t5164 = phi i64 [ %t5161, %fixfast1184 ], [ %t5163, %fixslow1185 ]
  %t5165 = and i64 %self, -8
  %t5166 = inttoptr i64 %t5165 to ptr
  %t5167 = getelementptr i64, ptr %t5166, i64 5
  %t5168 = load i64, ptr %t5167
  %t5169 = and i64 %self, -8
  %t5170 = inttoptr i64 %t5169 to ptr
  %t5171 = getelementptr i64, ptr %t5170, i64 2
  %t5172 = load i64, ptr %t5171
  %t5173 = or i64 %t5172, %a0
  %t5174 = and i64 %t5173, 7
  %t5175 = icmp eq i64 %t5174, 0
  br i1 %t5175, label %fixfast1187, label %fixslow1188
fixfast1187:
  %t5176 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5172, i64 %a0)
  %t5177 = extractvalue {i64, i1} %t5176, 0
  %t5178 = extractvalue {i64, i1} %t5176, 1
  br i1 %t5178, label %fixslow1188, label %fixmerge1189
fixslow1188:
  %t5179 = call i64 @rt_add(i64 %t5172, i64 %a0)
  br label %fixmerge1189
fixmerge1189:
  %t5180 = phi i64 [ %t5177, %fixfast1187 ], [ %t5179, %fixslow1188 ]
  %t5181 = call i64 @rt_bytevector_u8_ref(i64 %t5168, i64 %t5180)
  %t5182 = call i64 @rt_bytevector_u8_set(i64 %t5152, i64 %t5164, i64 %t5181)
  %t5183 = or i64 %a0, 8
  %t5184 = and i64 %t5183, 7
  %t5185 = icmp eq i64 %t5184, 0
  br i1 %t5185, label %fixfast1190, label %fixslow1191
fixfast1190:
  %t5186 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5187 = extractvalue {i64, i1} %t5186, 0
  %t5188 = extractvalue {i64, i1} %t5186, 1
  br i1 %t5188, label %fixslow1191, label %fixmerge1192
fixslow1191:
  %t5189 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1192
fixmerge1192:
  %t5190 = phi i64 [ %t5187, %fixfast1190 ], [ %t5189, %fixslow1191 ]
  %t5191 = musttail call fastcc i64 @"scheme.base:code_1026"(i64 %self, i64 1, i64 %t5190, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5191
}

define fastcc i64 @"scheme.base:code:bytevector-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5192 = icmp sge i64 %argc, 3
  br i1 %t5192, label %argok1194, label %arityerr1193
arityerr1193:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1194:
  %t5193 = call ptr @rt_alloc_words(i64 8)
  %t5194 = getelementptr i64, ptr %t5193, i64 0
  store i64 %a0, ptr %t5194
  %t5195 = getelementptr i64, ptr %t5193, i64 1
  store i64 %a1, ptr %t5195
  %t5196 = getelementptr i64, ptr %t5193, i64 2
  store i64 %a2, ptr %t5196
  %t5197 = getelementptr i64, ptr %t5193, i64 3
  store i64 %a3, ptr %t5197
  %t5198 = getelementptr i64, ptr %t5193, i64 4
  store i64 %a4, ptr %t5198
  %t5199 = getelementptr i64, ptr %t5193, i64 5
  store i64 %a5, ptr %t5199
  %t5200 = getelementptr i64, ptr %t5193, i64 6
  store i64 %a6, ptr %t5200
  %t5201 = getelementptr i64, ptr %t5193, i64 7
  store i64 %a7, ptr %t5201
  %t5202 = call i64 @rt_build_rest(i64 %argc, i64 3, i64 8, ptr %t5193, ptr %overflow)
  %t5203 = call i64 @rt_bytevector_length(i64 %a2)
  %t5204 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5204)
  %t5205 = and i64 %t5204, -8
  %t5206 = inttoptr i64 %t5205 to ptr
  %t5207 = load i64, ptr %t5206
  %t5208 = inttoptr i64 %t5207 to ptr
  %t5209 = call fastcc i64%t5208(i64 %t5204, i64 1, i64 %t5202, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5210 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5210)
  %t5211 = and i64 %t5210, -8
  %t5212 = inttoptr i64 %t5211 to ptr
  %t5213 = load i64, ptr %t5212
  %t5214 = inttoptr i64 %t5213 to ptr
  %t5215 = call fastcc i64%t5214(i64 %t5210, i64 2, i64 %t5202, i64 %t5203, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5216 = call i64 @rt_intern(ptr @.str.sym.26)
  %t5217 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5217)
  %t5218 = and i64 %t5217, -8
  %t5219 = inttoptr i64 %t5218 to ptr
  %t5220 = load i64, ptr %t5219
  %t5221 = inttoptr i64 %t5220 to ptr
  %t5222 = call fastcc i64%t5221(i64 %t5217, i64 4, i64 %t5216, i64 %t5209, i64 %t5215, i64 %t5203, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5223 = call i64 @rt_intern(ptr @.str.sym.26)
  %t5224 = or i64 %t5215, %t5209
  %t5225 = and i64 %t5224, 7
  %t5226 = icmp eq i64 %t5225, 0
  br i1 %t5226, label %fixfast1195, label %fixslow1196
fixfast1195:
  %t5227 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5215, i64 %t5209)
  %t5228 = extractvalue {i64, i1} %t5227, 0
  %t5229 = extractvalue {i64, i1} %t5227, 1
  br i1 %t5229, label %fixslow1196, label %fixmerge1197
fixslow1196:
  %t5230 = call i64 @rt_sub(i64 %t5215, i64 %t5209)
  br label %fixmerge1197
fixmerge1197:
  %t5231 = phi i64 [ %t5228, %fixfast1195 ], [ %t5230, %fixslow1196 ]
  %t5232 = or i64 %a1, %t5231
  %t5233 = and i64 %t5232, 7
  %t5234 = icmp eq i64 %t5233, 0
  br i1 %t5234, label %fixfast1198, label %fixslow1199
fixfast1198:
  %t5235 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t5231)
  %t5236 = extractvalue {i64, i1} %t5235, 0
  %t5237 = extractvalue {i64, i1} %t5235, 1
  br i1 %t5237, label %fixslow1199, label %fixmerge1200
fixslow1199:
  %t5238 = call i64 @rt_add(i64 %a1, i64 %t5231)
  br label %fixmerge1200
fixmerge1200:
  %t5239 = phi i64 [ %t5236, %fixfast1198 ], [ %t5238, %fixslow1199 ]
  %t5240 = call i64 @rt_bytevector_length(i64 %a0)
  %t5241 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5241)
  %t5242 = and i64 %t5241, -8
  %t5243 = inttoptr i64 %t5242 to ptr
  %t5244 = load i64, ptr %t5243
  %t5245 = inttoptr i64 %t5244 to ptr
  %t5246 = call fastcc i64%t5245(i64 %t5241, i64 4, i64 %t5223, i64 %a1, i64 %t5239, i64 %t5240, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5247 = or i64 %t5209, %a1
  %t5248 = and i64 %t5247, 7
  %t5249 = icmp eq i64 %t5248, 0
  br i1 %t5249, label %fixfast1201, label %fixslow1202
fixfast1201:
  %t5250 = icmp slt i64 %t5209, %a1
  %t5251 = select i1 %t5250, i64 257, i64 1
  br label %fixmerge1203
fixslow1202:
  %t5252 = call i64 @rt_lt(i64 %t5209, i64 %a1)
  br label %fixmerge1203
fixmerge1203:
  %t5253 = phi i64 [ %t5251, %fixfast1201 ], [ %t5252, %fixslow1202 ]
  %t5254 = icmp ne i64 %t5253, 1
  br i1 %t5254, label %then1204, label %else1205
then1204:
  %t5255 = call ptr @rt_alloc_words(i64 6)
  %t5256 = ptrtoint ptr %t5255 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1024" to i64), ptr %t5255
  %t5257 = or i64 %t5256, 4
  %t5258 = getelementptr i64, ptr %t5255, i64 1
  store i64 %a0, ptr %t5258
  %t5259 = getelementptr i64, ptr %t5255, i64 2
  store i64 %a1, ptr %t5259
  %t5260 = getelementptr i64, ptr %t5255, i64 3
  store i64 %a2, ptr %t5260
  %t5261 = getelementptr i64, ptr %t5255, i64 4
  store i64 %t5209, ptr %t5261
  %t5262 = getelementptr i64, ptr %t5255, i64 5
  store i64 %t5257, ptr %t5262
  %t5263 = or i64 %t5215, %t5209
  %t5264 = and i64 %t5263, 7
  %t5265 = icmp eq i64 %t5264, 0
  br i1 %t5265, label %fixfast1206, label %fixslow1207
fixfast1206:
  %t5266 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5215, i64 %t5209)
  %t5267 = extractvalue {i64, i1} %t5266, 0
  %t5268 = extractvalue {i64, i1} %t5266, 1
  br i1 %t5268, label %fixslow1207, label %fixmerge1208
fixslow1207:
  %t5269 = call i64 @rt_sub(i64 %t5215, i64 %t5209)
  br label %fixmerge1208
fixmerge1208:
  %t5270 = phi i64 [ %t5267, %fixfast1206 ], [ %t5269, %fixslow1207 ]
  %t5271 = or i64 %t5270, 8
  %t5272 = and i64 %t5271, 7
  %t5273 = icmp eq i64 %t5272, 0
  br i1 %t5273, label %fixfast1209, label %fixslow1210
fixfast1209:
  %t5274 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5270, i64 8)
  %t5275 = extractvalue {i64, i1} %t5274, 0
  %t5276 = extractvalue {i64, i1} %t5274, 1
  br i1 %t5276, label %fixslow1210, label %fixmerge1211
fixslow1210:
  %t5277 = call i64 @rt_sub(i64 %t5270, i64 8)
  br label %fixmerge1211
fixmerge1211:
  %t5278 = phi i64 [ %t5275, %fixfast1209 ], [ %t5277, %fixslow1210 ]
  %t5279 = musttail call fastcc i64 @"scheme.base:code_1024"(i64 %t5257, i64 1, i64 %t5278, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5279
else1205:
  %t5280 = call ptr @rt_alloc_words(i64 7)
  %t5281 = ptrtoint ptr %t5280 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1026" to i64), ptr %t5280
  %t5282 = or i64 %t5281, 4
  %t5283 = getelementptr i64, ptr %t5280, i64 1
  store i64 %t5215, ptr %t5283
  %t5284 = getelementptr i64, ptr %t5280, i64 2
  store i64 %t5209, ptr %t5284
  %t5285 = getelementptr i64, ptr %t5280, i64 3
  store i64 %a0, ptr %t5285
  %t5286 = getelementptr i64, ptr %t5280, i64 4
  store i64 %a1, ptr %t5286
  %t5287 = getelementptr i64, ptr %t5280, i64 5
  store i64 %a2, ptr %t5287
  %t5288 = getelementptr i64, ptr %t5280, i64 6
  store i64 %t5282, ptr %t5288
  %t5289 = musttail call fastcc i64 @"scheme.base:code_1026"(i64 %t5282, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5289
}

define fastcc i64 @"scheme.base:code_1044"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5294 = icmp eq i64 %argc, 1
  br i1 %t5294, label %argok1213, label %arityerr1212
arityerr1212:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1213:
  %t5295 = and i64 %self, -8
  %t5296 = inttoptr i64 %t5295 to ptr
  %t5297 = getelementptr i64, ptr %t5296, i64 1
  %t5298 = load i64, ptr %t5297
  %t5299 = or i64 %a0, %t5298
  %t5300 = and i64 %t5299, 7
  %t5301 = icmp eq i64 %t5300, 0
  br i1 %t5301, label %fixfast1214, label %fixslow1215
fixfast1214:
  %t5302 = icmp eq i64 %a0, %t5298
  %t5303 = select i1 %t5302, i64 257, i64 1
  br label %fixmerge1216
fixslow1215:
  %t5304 = call i64 @rt_num_eq(i64 %a0, i64 %t5298)
  br label %fixmerge1216
fixmerge1216:
  %t5305 = phi i64 [ %t5303, %fixfast1214 ], [ %t5304, %fixslow1215 ]
  %t5306 = icmp ne i64 %t5305, 1
  br i1 %t5306, label %then1217, label %else1218
then1217:
  %t5307 = and i64 %self, -8
  %t5308 = inttoptr i64 %t5307 to ptr
  %t5309 = getelementptr i64, ptr %t5308, i64 3
  %t5310 = load i64, ptr %t5309
  %t5311 = call i64 @rt_cdr(i64 %t5310)
  %t5312 = and i64 %self, -8
  %t5313 = inttoptr i64 %t5312 to ptr
  %t5314 = getelementptr i64, ptr %t5313, i64 4
  %t5315 = load i64, ptr %t5314
  %t5316 = and i64 %self, -8
  %t5317 = inttoptr i64 %t5316 to ptr
  %t5318 = getelementptr i64, ptr %t5317, i64 1
  %t5319 = load i64, ptr %t5318
  %t5320 = or i64 %t5315, %t5319
  %t5321 = and i64 %t5320, 7
  %t5322 = icmp eq i64 %t5321, 0
  br i1 %t5322, label %fixfast1219, label %fixslow1220
fixfast1219:
  %t5323 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5315, i64 %t5319)
  %t5324 = extractvalue {i64, i1} %t5323, 0
  %t5325 = extractvalue {i64, i1} %t5323, 1
  br i1 %t5325, label %fixslow1220, label %fixmerge1221
fixslow1220:
  %t5326 = call i64 @rt_add(i64 %t5315, i64 %t5319)
  br label %fixmerge1221
fixmerge1221:
  %t5327 = phi i64 [ %t5324, %fixfast1219 ], [ %t5326, %fixslow1220 ]
  %t5328 = and i64 %self, -8
  %t5329 = inttoptr i64 %t5328 to ptr
  %t5330 = getelementptr i64, ptr %t5329, i64 2
  %t5331 = load i64, ptr %t5330
  %t5332 = musttail call fastcc i64 @"scheme.base:code_1042"(i64 %t5331, i64 2, i64 %t5311, i64 %t5327, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5332
else1218:
  %t5333 = and i64 %self, -8
  %t5334 = inttoptr i64 %t5333 to ptr
  %t5335 = getelementptr i64, ptr %t5334, i64 5
  %t5336 = load i64, ptr %t5335
  %t5337 = and i64 %self, -8
  %t5338 = inttoptr i64 %t5337 to ptr
  %t5339 = getelementptr i64, ptr %t5338, i64 4
  %t5340 = load i64, ptr %t5339
  %t5341 = or i64 %t5340, %a0
  %t5342 = and i64 %t5341, 7
  %t5343 = icmp eq i64 %t5342, 0
  br i1 %t5343, label %fixfast1222, label %fixslow1223
fixfast1222:
  %t5344 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5340, i64 %a0)
  %t5345 = extractvalue {i64, i1} %t5344, 0
  %t5346 = extractvalue {i64, i1} %t5344, 1
  br i1 %t5346, label %fixslow1223, label %fixmerge1224
fixslow1223:
  %t5347 = call i64 @rt_add(i64 %t5340, i64 %a0)
  br label %fixmerge1224
fixmerge1224:
  %t5348 = phi i64 [ %t5345, %fixfast1222 ], [ %t5347, %fixslow1223 ]
  %t5349 = and i64 %self, -8
  %t5350 = inttoptr i64 %t5349 to ptr
  %t5351 = getelementptr i64, ptr %t5350, i64 6
  %t5352 = load i64, ptr %t5351
  %t5353 = call i64 @rt_bytevector_u8_ref(i64 %t5352, i64 %a0)
  %t5354 = call i64 @rt_bytevector_u8_set(i64 %t5336, i64 %t5348, i64 %t5353)
  %t5355 = or i64 %a0, 8
  %t5356 = and i64 %t5355, 7
  %t5357 = icmp eq i64 %t5356, 0
  br i1 %t5357, label %fixfast1225, label %fixslow1226
fixfast1225:
  %t5358 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5359 = extractvalue {i64, i1} %t5358, 0
  %t5360 = extractvalue {i64, i1} %t5358, 1
  br i1 %t5360, label %fixslow1226, label %fixmerge1227
fixslow1226:
  %t5361 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1227
fixmerge1227:
  %t5362 = phi i64 [ %t5359, %fixfast1225 ], [ %t5361, %fixslow1226 ]
  %t5363 = musttail call fastcc i64 @"scheme.base:code_1044"(i64 %self, i64 1, i64 %t5362, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5363
}

define fastcc i64 @"scheme.base:code_1042"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5364 = icmp eq i64 %argc, 2
  br i1 %t5364, label %argok1229, label %arityerr1228
arityerr1228:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1229:
  %t5365 = call i64 @rt_null_p(i64 %a0)
  %t5366 = icmp ne i64 %t5365, 1
  br i1 %t5366, label %then1230, label %else1231
then1230:
  %t5367 = and i64 %self, -8
  %t5368 = inttoptr i64 %t5367 to ptr
  %t5369 = getelementptr i64, ptr %t5368, i64 1
  %t5370 = load i64, ptr %t5369
  ret i64 %t5370
else1231:
  %t5371 = call i64 @rt_car(i64 %a0)
  %t5372 = call i64 @rt_bytevector_length(i64 %t5371)
  %t5373 = call ptr @rt_alloc_words(i64 8)
  %t5374 = ptrtoint ptr %t5373 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1044" to i64), ptr %t5373
  %t5375 = or i64 %t5374, 4
  %t5376 = getelementptr i64, ptr %t5373, i64 1
  store i64 %t5372, ptr %t5376
  %t5377 = and i64 %self, -8
  %t5378 = inttoptr i64 %t5377 to ptr
  %t5379 = getelementptr i64, ptr %t5378, i64 2
  %t5380 = load i64, ptr %t5379
  %t5381 = getelementptr i64, ptr %t5373, i64 2
  store i64 %t5380, ptr %t5381
  %t5382 = getelementptr i64, ptr %t5373, i64 3
  store i64 %a0, ptr %t5382
  %t5383 = getelementptr i64, ptr %t5373, i64 4
  store i64 %a1, ptr %t5383
  %t5384 = and i64 %self, -8
  %t5385 = inttoptr i64 %t5384 to ptr
  %t5386 = getelementptr i64, ptr %t5385, i64 1
  %t5387 = load i64, ptr %t5386
  %t5388 = getelementptr i64, ptr %t5373, i64 5
  store i64 %t5387, ptr %t5388
  %t5389 = getelementptr i64, ptr %t5373, i64 6
  store i64 %t5371, ptr %t5389
  %t5390 = getelementptr i64, ptr %t5373, i64 7
  store i64 %t5375, ptr %t5390
  %t5391 = musttail call fastcc i64 @"scheme.base:code_1044"(i64 %t5375, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5391
}

define fastcc i64 @"scheme.base:code:bytevector-append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5392 = icmp sge i64 %argc, 0
  br i1 %t5392, label %argok1233, label %arityerr1232
arityerr1232:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1233:
  %t5393 = call ptr @rt_alloc_words(i64 8)
  %t5394 = getelementptr i64, ptr %t5393, i64 0
  store i64 %a0, ptr %t5394
  %t5395 = getelementptr i64, ptr %t5393, i64 1
  store i64 %a1, ptr %t5395
  %t5396 = getelementptr i64, ptr %t5393, i64 2
  store i64 %a2, ptr %t5396
  %t5397 = getelementptr i64, ptr %t5393, i64 3
  store i64 %a3, ptr %t5397
  %t5398 = getelementptr i64, ptr %t5393, i64 4
  store i64 %a4, ptr %t5398
  %t5399 = getelementptr i64, ptr %t5393, i64 5
  store i64 %a5, ptr %t5399
  %t5400 = getelementptr i64, ptr %t5393, i64 6
  store i64 %a6, ptr %t5400
  %t5401 = getelementptr i64, ptr %t5393, i64 7
  store i64 %a7, ptr %t5401
  %t5402 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t5393, ptr %overflow)
  %t5403 = load i64, ptr @"scheme.base:bv-total"
  call void @rt_check_callable(i64 %t5403)
  %t5404 = and i64 %t5403, -8
  %t5405 = inttoptr i64 %t5404 to ptr
  %t5406 = load i64, ptr %t5405
  %t5407 = inttoptr i64 %t5406 to ptr
  %t5408 = call fastcc i64%t5407(i64 %t5403, i64 1, i64 %t5402, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5409 = call i64 @rt_make_bytevector(i64 %t5408, i64 0)
  %t5410 = call ptr @rt_alloc_words(i64 3)
  %t5411 = ptrtoint ptr %t5410 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1042" to i64), ptr %t5410
  %t5412 = or i64 %t5411, 4
  %t5413 = getelementptr i64, ptr %t5410, i64 1
  store i64 %t5409, ptr %t5413
  %t5414 = getelementptr i64, ptr %t5410, i64 2
  store i64 %t5412, ptr %t5414
  %t5415 = musttail call fastcc i64 @"scheme.base:code_1042"(i64 %t5412, i64 2, i64 %t5402, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5415
}

define fastcc i64 @"scheme.base:code:bv-total"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5420 = icmp eq i64 %argc, 1
  br i1 %t5420, label %argok1235, label %arityerr1234
arityerr1234:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1235:
  %t5421 = call i64 @rt_null_p(i64 %a0)
  %t5422 = icmp ne i64 %t5421, 1
  br i1 %t5422, label %then1236, label %else1237
then1236:
  ret i64 0
else1237:
  %t5423 = call i64 @rt_car(i64 %a0)
  %t5424 = call i64 @rt_bytevector_length(i64 %t5423)
  %t5425 = call i64 @rt_cdr(i64 %a0)
  %t5426 = load i64, ptr @"scheme.base:bv-total"
  call void @rt_check_callable(i64 %t5426)
  %t5427 = and i64 %t5426, -8
  %t5428 = inttoptr i64 %t5427 to ptr
  %t5429 = load i64, ptr %t5428
  %t5430 = inttoptr i64 %t5429 to ptr
  %t5431 = call fastcc i64%t5430(i64 %t5426, i64 1, i64 %t5425, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5432 = or i64 %t5424, %t5431
  %t5433 = and i64 %t5432, 7
  %t5434 = icmp eq i64 %t5433, 0
  br i1 %t5434, label %fixfast1238, label %fixslow1239
fixfast1238:
  %t5435 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5424, i64 %t5431)
  %t5436 = extractvalue {i64, i1} %t5435, 0
  %t5437 = extractvalue {i64, i1} %t5435, 1
  br i1 %t5437, label %fixslow1239, label %fixmerge1240
fixslow1239:
  %t5438 = call i64 @rt_add(i64 %t5424, i64 %t5431)
  br label %fixmerge1240
fixmerge1240:
  %t5439 = phi i64 [ %t5436, %fixfast1238 ], [ %t5438, %fixslow1239 ]
  ret i64 %t5439
}

define fastcc i64 @"scheme.base:code:rationalize"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5445 = icmp eq i64 %argc, 2
  br i1 %t5445, label %argok1242, label %arityerr1241
arityerr1241:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1242:
  %t5446 = load i64, ptr @"scheme.base:abs"
  call void @rt_check_callable(i64 %t5446)
  %t5447 = and i64 %t5446, -8
  %t5448 = inttoptr i64 %t5447 to ptr
  %t5449 = load i64, ptr %t5448
  %t5450 = inttoptr i64 %t5449 to ptr
  %t5451 = call fastcc i64%t5450(i64 %t5446, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5452 = or i64 %a0, %t5451
  %t5453 = and i64 %t5452, 7
  %t5454 = icmp eq i64 %t5453, 0
  br i1 %t5454, label %fixfast1243, label %fixslow1244
fixfast1243:
  %t5455 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t5451)
  %t5456 = extractvalue {i64, i1} %t5455, 0
  %t5457 = extractvalue {i64, i1} %t5455, 1
  br i1 %t5457, label %fixslow1244, label %fixmerge1245
fixslow1244:
  %t5458 = call i64 @rt_sub(i64 %a0, i64 %t5451)
  br label %fixmerge1245
fixmerge1245:
  %t5459 = phi i64 [ %t5456, %fixfast1243 ], [ %t5458, %fixslow1244 ]
  %t5460 = load i64, ptr @"scheme.base:abs"
  call void @rt_check_callable(i64 %t5460)
  %t5461 = and i64 %t5460, -8
  %t5462 = inttoptr i64 %t5461 to ptr
  %t5463 = load i64, ptr %t5462
  %t5464 = inttoptr i64 %t5463 to ptr
  %t5465 = call fastcc i64%t5464(i64 %t5460, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5466 = or i64 %a0, %t5465
  %t5467 = and i64 %t5466, 7
  %t5468 = icmp eq i64 %t5467, 0
  br i1 %t5468, label %fixfast1246, label %fixslow1247
fixfast1246:
  %t5469 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 %t5465)
  %t5470 = extractvalue {i64, i1} %t5469, 0
  %t5471 = extractvalue {i64, i1} %t5469, 1
  br i1 %t5471, label %fixslow1247, label %fixmerge1248
fixslow1247:
  %t5472 = call i64 @rt_add(i64 %a0, i64 %t5465)
  br label %fixmerge1248
fixmerge1248:
  %t5473 = phi i64 [ %t5470, %fixfast1246 ], [ %t5472, %fixslow1247 ]
  %t5474 = call i64 @rt_exact_p(i64 %a0)
  %t5475 = icmp ne i64 %t5474, 1
  br i1 %t5475, label %then1249, label %else1250
then1249:
  %t5476 = call i64 @rt_exact_p(i64 %a1)
  br label %merge1251
else1250:
  br label %merge1251
merge1251:
  %t5477 = phi i64 [ %t5476, %then1249 ], [ 1, %else1250 ]
  %t5478 = icmp ne i64 %t5477, 1
  br i1 %t5478, label %then1252, label %else1253
then1252:
  %t5479 = load i64, ptr @"scheme.base:rat-exact"
  call void @rt_check_callable(i64 %t5479)
  %t5480 = and i64 %t5479, -8
  %t5481 = inttoptr i64 %t5480 to ptr
  %t5482 = load i64, ptr %t5481
  %t5483 = inttoptr i64 %t5482 to ptr
  %t5484 = musttail call fastcc i64 %t5483(i64 %t5479, i64 2, i64 %t5459, i64 %t5473, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5484
else1253:
  %t5485 = call i64 @rt_exact_to_inexact(i64 %t5459)
  %t5486 = call i64 @rt_exact_to_inexact(i64 %t5473)
  %t5487 = load i64, ptr @"scheme.base:rat-inexact"
  call void @rt_check_callable(i64 %t5487)
  %t5488 = and i64 %t5487, -8
  %t5489 = inttoptr i64 %t5488 to ptr
  %t5490 = load i64, ptr %t5489
  %t5491 = inttoptr i64 %t5490 to ptr
  %t5492 = musttail call fastcc i64 %t5491(i64 %t5487, i64 2, i64 %t5485, i64 %t5486, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5492
}

define fastcc i64 @"scheme.base:code:rat-exact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5497 = icmp eq i64 %argc, 2
  br i1 %t5497, label %argok1255, label %arityerr1254
arityerr1254:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1255:
  %t5498 = or i64 %a0, 0
  %t5499 = and i64 %t5498, 7
  %t5500 = icmp eq i64 %t5499, 0
  br i1 %t5500, label %fixfast1256, label %fixslow1257
fixfast1256:
  %t5501 = icmp slt i64 %a0, 0
  %t5502 = select i1 %t5501, i64 257, i64 1
  br label %fixmerge1258
fixslow1257:
  %t5503 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge1258
fixmerge1258:
  %t5504 = phi i64 [ %t5502, %fixfast1256 ], [ %t5503, %fixslow1257 ]
  %t5505 = icmp ne i64 %t5504, 1
  br i1 %t5505, label %then1259, label %else1260
then1259:
  br label %merge1261
else1260:
  %t5506 = or i64 %a0, 0
  %t5507 = and i64 %t5506, 7
  %t5508 = icmp eq i64 %t5507, 0
  br i1 %t5508, label %fixfast1262, label %fixslow1263
fixfast1262:
  %t5509 = icmp eq i64 %a0, 0
  %t5510 = select i1 %t5509, i64 257, i64 1
  br label %fixmerge1264
fixslow1263:
  %t5511 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge1264
fixmerge1264:
  %t5512 = phi i64 [ %t5510, %fixfast1262 ], [ %t5511, %fixslow1263 ]
  br label %merge1261
merge1261:
  %t5513 = phi i64 [ 257, %then1259 ], [ %t5512, %fixmerge1264 ]
  %t5514 = icmp ne i64 %t5513, 1
  br i1 %t5514, label %then1265, label %else1266
then1265:
  %t5515 = or i64 0, %a1
  %t5516 = and i64 %t5515, 7
  %t5517 = icmp eq i64 %t5516, 0
  br i1 %t5517, label %fixfast1268, label %fixslow1269
fixfast1268:
  %t5518 = icmp slt i64 0, %a1
  %t5519 = select i1 %t5518, i64 257, i64 1
  br label %fixmerge1270
fixslow1269:
  %t5520 = call i64 @rt_lt(i64 0, i64 %a1)
  br label %fixmerge1270
fixmerge1270:
  %t5521 = phi i64 [ %t5519, %fixfast1268 ], [ %t5520, %fixslow1269 ]
  %t5522 = icmp ne i64 %t5521, 1
  br i1 %t5522, label %then1271, label %else1272
then1271:
  br label %merge1273
else1272:
  %t5523 = or i64 0, %a1
  %t5524 = and i64 %t5523, 7
  %t5525 = icmp eq i64 %t5524, 0
  br i1 %t5525, label %fixfast1274, label %fixslow1275
fixfast1274:
  %t5526 = icmp eq i64 0, %a1
  %t5527 = select i1 %t5526, i64 257, i64 1
  br label %fixmerge1276
fixslow1275:
  %t5528 = call i64 @rt_num_eq(i64 0, i64 %a1)
  br label %fixmerge1276
fixmerge1276:
  %t5529 = phi i64 [ %t5527, %fixfast1274 ], [ %t5528, %fixslow1275 ]
  br label %merge1273
merge1273:
  %t5530 = phi i64 [ 257, %then1271 ], [ %t5529, %fixmerge1276 ]
  br label %merge1267
else1266:
  br label %merge1267
merge1267:
  %t5531 = phi i64 [ %t5530, %merge1273 ], [ 1, %else1266 ]
  %t5532 = icmp ne i64 %t5531, 1
  br i1 %t5532, label %then1277, label %else1278
then1277:
  ret i64 0
else1278:
  %t5533 = or i64 0, %a0
  %t5534 = and i64 %t5533, 7
  %t5535 = icmp eq i64 %t5534, 0
  br i1 %t5535, label %fixfast1279, label %fixslow1280
fixfast1279:
  %t5536 = icmp slt i64 0, %a0
  %t5537 = select i1 %t5536, i64 257, i64 1
  br label %fixmerge1281
fixslow1280:
  %t5538 = call i64 @rt_lt(i64 0, i64 %a0)
  br label %fixmerge1281
fixmerge1281:
  %t5539 = phi i64 [ %t5537, %fixfast1279 ], [ %t5538, %fixslow1280 ]
  %t5540 = icmp ne i64 %t5539, 1
  br i1 %t5540, label %then1282, label %else1283
then1282:
  %t5541 = load i64, ptr @"scheme.base:rat-ceil"
  call void @rt_check_callable(i64 %t5541)
  %t5542 = and i64 %t5541, -8
  %t5543 = inttoptr i64 %t5542 to ptr
  %t5544 = load i64, ptr %t5543
  %t5545 = inttoptr i64 %t5544 to ptr
  %t5546 = call fastcc i64%t5545(i64 %t5541, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5547 = or i64 %t5546, %a1
  %t5548 = and i64 %t5547, 7
  %t5549 = icmp eq i64 %t5548, 0
  br i1 %t5549, label %fixfast1284, label %fixslow1285
fixfast1284:
  %t5550 = icmp slt i64 %t5546, %a1
  %t5551 = select i1 %t5550, i64 257, i64 1
  br label %fixmerge1286
fixslow1285:
  %t5552 = call i64 @rt_lt(i64 %t5546, i64 %a1)
  br label %fixmerge1286
fixmerge1286:
  %t5553 = phi i64 [ %t5551, %fixfast1284 ], [ %t5552, %fixslow1285 ]
  %t5554 = icmp ne i64 %t5553, 1
  br i1 %t5554, label %then1287, label %else1288
then1287:
  br label %merge1289
else1288:
  %t5555 = or i64 %t5546, %a1
  %t5556 = and i64 %t5555, 7
  %t5557 = icmp eq i64 %t5556, 0
  br i1 %t5557, label %fixfast1290, label %fixslow1291
fixfast1290:
  %t5558 = icmp eq i64 %t5546, %a1
  %t5559 = select i1 %t5558, i64 257, i64 1
  br label %fixmerge1292
fixslow1291:
  %t5560 = call i64 @rt_num_eq(i64 %t5546, i64 %a1)
  br label %fixmerge1292
fixmerge1292:
  %t5561 = phi i64 [ %t5559, %fixfast1290 ], [ %t5560, %fixslow1291 ]
  br label %merge1289
merge1289:
  %t5562 = phi i64 [ 257, %then1287 ], [ %t5561, %fixmerge1292 ]
  %t5563 = icmp ne i64 %t5562, 1
  br i1 %t5563, label %then1293, label %else1294
then1293:
  %t5564 = load i64, ptr @"scheme.base:rat-ceil"
  call void @rt_check_callable(i64 %t5564)
  %t5565 = and i64 %t5564, -8
  %t5566 = inttoptr i64 %t5565 to ptr
  %t5567 = load i64, ptr %t5566
  %t5568 = inttoptr i64 %t5567 to ptr
  %t5569 = musttail call fastcc i64 %t5568(i64 %t5564, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5569
else1294:
  %t5570 = call i64 @rt_make_string(ptr @.str.lit.27, i64 69)
  %t5571 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t5571)
  %t5572 = and i64 %t5571, -8
  %t5573 = inttoptr i64 %t5572 to ptr
  %t5574 = load i64, ptr %t5573
  %t5575 = inttoptr i64 %t5574 to ptr
  %t5576 = musttail call fastcc i64 %t5575(i64 %t5571, i64 3, i64 %t5570, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5576
else1283:
  %t5577 = load i64, ptr @"scheme.base:rat-floor"
  call void @rt_check_callable(i64 %t5577)
  %t5578 = and i64 %t5577, -8
  %t5579 = inttoptr i64 %t5578 to ptr
  %t5580 = load i64, ptr %t5579
  %t5581 = inttoptr i64 %t5580 to ptr
  %t5582 = call fastcc i64%t5581(i64 %t5577, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5583 = or i64 %a0, %t5582
  %t5584 = and i64 %t5583, 7
  %t5585 = icmp eq i64 %t5584, 0
  br i1 %t5585, label %fixfast1295, label %fixslow1296
fixfast1295:
  %t5586 = icmp slt i64 %a0, %t5582
  %t5587 = select i1 %t5586, i64 257, i64 1
  br label %fixmerge1297
fixslow1296:
  %t5588 = call i64 @rt_lt(i64 %a0, i64 %t5582)
  br label %fixmerge1297
fixmerge1297:
  %t5589 = phi i64 [ %t5587, %fixfast1295 ], [ %t5588, %fixslow1296 ]
  %t5590 = icmp ne i64 %t5589, 1
  br i1 %t5590, label %then1298, label %else1299
then1298:
  br label %merge1300
else1299:
  %t5591 = or i64 %a0, %t5582
  %t5592 = and i64 %t5591, 7
  %t5593 = icmp eq i64 %t5592, 0
  br i1 %t5593, label %fixfast1301, label %fixslow1302
fixfast1301:
  %t5594 = icmp eq i64 %a0, %t5582
  %t5595 = select i1 %t5594, i64 257, i64 1
  br label %fixmerge1303
fixslow1302:
  %t5596 = call i64 @rt_num_eq(i64 %a0, i64 %t5582)
  br label %fixmerge1303
fixmerge1303:
  %t5597 = phi i64 [ %t5595, %fixfast1301 ], [ %t5596, %fixslow1302 ]
  br label %merge1300
merge1300:
  %t5598 = phi i64 [ 257, %then1298 ], [ %t5597, %fixmerge1303 ]
  %t5599 = icmp ne i64 %t5598, 1
  br i1 %t5599, label %then1304, label %else1305
then1304:
  %t5600 = load i64, ptr @"scheme.base:rat-floor"
  call void @rt_check_callable(i64 %t5600)
  %t5601 = and i64 %t5600, -8
  %t5602 = inttoptr i64 %t5601 to ptr
  %t5603 = load i64, ptr %t5602
  %t5604 = inttoptr i64 %t5603 to ptr
  %t5605 = musttail call fastcc i64 %t5604(i64 %t5600, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5605
else1305:
  %t5606 = call i64 @rt_make_string(ptr @.str.lit.28, i64 69)
  %t5607 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t5607)
  %t5608 = and i64 %t5607, -8
  %t5609 = inttoptr i64 %t5608 to ptr
  %t5610 = load i64, ptr %t5609
  %t5611 = inttoptr i64 %t5610 to ptr
  %t5612 = musttail call fastcc i64 %t5611(i64 %t5607, i64 3, i64 %t5606, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5612
}

define fastcc i64 @"scheme.base:code:rat-ceil"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5617 = icmp eq i64 %argc, 1
  br i1 %t5617, label %argok1307, label %arityerr1306
arityerr1306:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1307:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:rat-floor"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5622 = icmp eq i64 %argc, 1
  br i1 %t5622, label %argok1309, label %arityerr1308
arityerr1308:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1309:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_1098"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5627 = icmp eq i64 %argc, 1
  br i1 %t5627, label %argok1311, label %arityerr1310
arityerr1310:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1311:
  %t5628 = load i64, ptr @"scheme.base:rat-max-denom"
  %t5629 = or i64 %t5628, %a0
  %t5630 = and i64 %t5629, 7
  %t5631 = icmp eq i64 %t5630, 0
  br i1 %t5631, label %fixfast1312, label %fixslow1313
fixfast1312:
  %t5632 = icmp slt i64 %t5628, %a0
  %t5633 = select i1 %t5632, i64 257, i64 1
  br label %fixmerge1314
fixslow1313:
  %t5634 = call i64 @rt_lt(i64 %t5628, i64 %a0)
  br label %fixmerge1314
fixmerge1314:
  %t5635 = phi i64 [ %t5633, %fixfast1312 ], [ %t5634, %fixslow1313 ]
  %t5636 = icmp ne i64 %t5635, 1
  br i1 %t5636, label %then1315, label %else1316
then1315:
  %t5637 = call i64 @rt_make_string(ptr @.str.lit.29, i64 59)
  %t5638 = and i64 %self, -8
  %t5639 = inttoptr i64 %t5638 to ptr
  %t5640 = getelementptr i64, ptr %t5639, i64 1
  %t5641 = load i64, ptr %t5640
  %t5642 = and i64 %self, -8
  %t5643 = inttoptr i64 %t5642 to ptr
  %t5644 = getelementptr i64, ptr %t5643, i64 2
  %t5645 = load i64, ptr %t5644
  %t5646 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t5646)
  %t5647 = and i64 %t5646, -8
  %t5648 = inttoptr i64 %t5647 to ptr
  %t5649 = load i64, ptr %t5648
  %t5650 = inttoptr i64 %t5649 to ptr
  %t5651 = musttail call fastcc i64 %t5650(i64 %t5646, i64 3, i64 %t5637, i64 %t5641, i64 %t5645, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5651
else1316:
  %t5652 = and i64 %self, -8
  %t5653 = inttoptr i64 %t5652 to ptr
  %t5654 = getelementptr i64, ptr %t5653, i64 1
  %t5655 = load i64, ptr %t5654
  %t5656 = or i64 %t5655, %a0
  %t5657 = and i64 %t5656, 7
  %t5658 = icmp eq i64 %t5657, 0
  br i1 %t5658, label %fixfast1317, label %fixslow1318
fixfast1317:
  %t5659 = ashr i64 %t5655, 3
  %t5660 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t5659, i64 %a0)
  %t5661 = extractvalue {i64, i1} %t5660, 0
  %t5662 = extractvalue {i64, i1} %t5660, 1
  br i1 %t5662, label %fixslow1318, label %fixmerge1319
fixslow1318:
  %t5663 = call i64 @rt_mul(i64 %t5655, i64 %a0)
  br label %fixmerge1319
fixmerge1319:
  %t5664 = phi i64 [ %t5661, %fixfast1317 ], [ %t5663, %fixslow1318 ]
  %t5665 = and i64 %self, -8
  %t5666 = inttoptr i64 %t5665 to ptr
  %t5667 = getelementptr i64, ptr %t5666, i64 2
  %t5668 = load i64, ptr %t5667
  %t5669 = or i64 %t5668, %a0
  %t5670 = and i64 %t5669, 7
  %t5671 = icmp eq i64 %t5670, 0
  br i1 %t5671, label %fixfast1320, label %fixslow1321
fixfast1320:
  %t5672 = ashr i64 %t5668, 3
  %t5673 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t5672, i64 %a0)
  %t5674 = extractvalue {i64, i1} %t5673, 0
  %t5675 = extractvalue {i64, i1} %t5673, 1
  br i1 %t5675, label %fixslow1321, label %fixmerge1322
fixslow1321:
  %t5676 = call i64 @rt_mul(i64 %t5668, i64 %a0)
  br label %fixmerge1322
fixmerge1322:
  %t5677 = phi i64 [ %t5674, %fixfast1320 ], [ %t5676, %fixslow1321 ]
  %t5678 = load i64, ptr @"scheme.base:rat-num-in"
  call void @rt_check_callable(i64 %t5678)
  %t5679 = and i64 %t5678, -8
  %t5680 = inttoptr i64 %t5679 to ptr
  %t5681 = load i64, ptr %t5680
  %t5682 = inttoptr i64 %t5681 to ptr
  %t5683 = call fastcc i64%t5682(i64 %t5678, i64 2, i64 %t5664, i64 %t5677, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5684 = icmp ne i64 %t5683, 1
  br i1 %t5684, label %then1323, label %else1324
then1323:
  %t5685 = call i64 @rt_exact_to_inexact(i64 %t5683)
  %t5686 = call i64 @rt_exact_to_inexact(i64 %a0)
  %t5687 = call i64 @rt_div(i64 %t5685, i64 %t5686)
  ret i64 %t5687
else1324:
  %t5688 = or i64 %a0, 8
  %t5689 = and i64 %t5688, 7
  %t5690 = icmp eq i64 %t5689, 0
  br i1 %t5690, label %fixfast1325, label %fixslow1326
fixfast1325:
  %t5691 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5692 = extractvalue {i64, i1} %t5691, 0
  %t5693 = extractvalue {i64, i1} %t5691, 1
  br i1 %t5693, label %fixslow1326, label %fixmerge1327
fixslow1326:
  %t5694 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1327
fixmerge1327:
  %t5695 = phi i64 [ %t5692, %fixfast1325 ], [ %t5694, %fixslow1326 ]
  %t5696 = musttail call fastcc i64 @"scheme.base:code_1098"(i64 %self, i64 1, i64 %t5695, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5696
}

define fastcc i64 @"scheme.base:code:rat-inexact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5697 = icmp eq i64 %argc, 2
  br i1 %t5697, label %argok1329, label %arityerr1328
arityerr1328:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1329:
  %t5698 = call i64 @rt_flonum_lit(ptr @.flo.lit.30)
  %t5699 = or i64 %a0, %t5698
  %t5700 = and i64 %t5699, 7
  %t5701 = icmp eq i64 %t5700, 0
  br i1 %t5701, label %fixfast1330, label %fixslow1331
fixfast1330:
  %t5702 = icmp slt i64 %a0, %t5698
  %t5703 = select i1 %t5702, i64 257, i64 1
  br label %fixmerge1332
fixslow1331:
  %t5704 = call i64 @rt_lt(i64 %a0, i64 %t5698)
  br label %fixmerge1332
fixmerge1332:
  %t5705 = phi i64 [ %t5703, %fixfast1330 ], [ %t5704, %fixslow1331 ]
  %t5706 = icmp ne i64 %t5705, 1
  br i1 %t5706, label %then1333, label %else1334
then1333:
  br label %merge1335
else1334:
  %t5707 = or i64 %a0, %t5698
  %t5708 = and i64 %t5707, 7
  %t5709 = icmp eq i64 %t5708, 0
  br i1 %t5709, label %fixfast1336, label %fixslow1337
fixfast1336:
  %t5710 = icmp eq i64 %a0, %t5698
  %t5711 = select i1 %t5710, i64 257, i64 1
  br label %fixmerge1338
fixslow1337:
  %t5712 = call i64 @rt_num_eq(i64 %a0, i64 %t5698)
  br label %fixmerge1338
fixmerge1338:
  %t5713 = phi i64 [ %t5711, %fixfast1336 ], [ %t5712, %fixslow1337 ]
  br label %merge1335
merge1335:
  %t5714 = phi i64 [ 257, %then1333 ], [ %t5713, %fixmerge1338 ]
  %t5715 = icmp ne i64 %t5714, 1
  br i1 %t5715, label %then1339, label %else1340
then1339:
  %t5716 = call i64 @rt_flonum_lit(ptr @.flo.lit.31)
  %t5717 = or i64 %t5716, %a1
  %t5718 = and i64 %t5717, 7
  %t5719 = icmp eq i64 %t5718, 0
  br i1 %t5719, label %fixfast1342, label %fixslow1343
fixfast1342:
  %t5720 = icmp slt i64 %t5716, %a1
  %t5721 = select i1 %t5720, i64 257, i64 1
  br label %fixmerge1344
fixslow1343:
  %t5722 = call i64 @rt_lt(i64 %t5716, i64 %a1)
  br label %fixmerge1344
fixmerge1344:
  %t5723 = phi i64 [ %t5721, %fixfast1342 ], [ %t5722, %fixslow1343 ]
  %t5724 = icmp ne i64 %t5723, 1
  br i1 %t5724, label %then1345, label %else1346
then1345:
  br label %merge1347
else1346:
  %t5725 = or i64 %t5716, %a1
  %t5726 = and i64 %t5725, 7
  %t5727 = icmp eq i64 %t5726, 0
  br i1 %t5727, label %fixfast1348, label %fixslow1349
fixfast1348:
  %t5728 = icmp eq i64 %t5716, %a1
  %t5729 = select i1 %t5728, i64 257, i64 1
  br label %fixmerge1350
fixslow1349:
  %t5730 = call i64 @rt_num_eq(i64 %t5716, i64 %a1)
  br label %fixmerge1350
fixmerge1350:
  %t5731 = phi i64 [ %t5729, %fixfast1348 ], [ %t5730, %fixslow1349 ]
  br label %merge1347
merge1347:
  %t5732 = phi i64 [ 257, %then1345 ], [ %t5731, %fixmerge1350 ]
  br label %merge1341
else1340:
  br label %merge1341
merge1341:
  %t5733 = phi i64 [ %t5732, %merge1347 ], [ 1, %else1340 ]
  %t5734 = icmp ne i64 %t5733, 1
  br i1 %t5734, label %then1351, label %else1352
then1351:
  %t5735 = call i64 @rt_flonum_lit(ptr @.flo.lit.32)
  ret i64 %t5735
else1352:
  %t5736 = call ptr @rt_alloc_words(i64 4)
  %t5737 = ptrtoint ptr %t5736 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1098" to i64), ptr %t5736
  %t5738 = or i64 %t5737, 4
  %t5739 = getelementptr i64, ptr %t5736, i64 1
  store i64 %a0, ptr %t5739
  %t5740 = getelementptr i64, ptr %t5736, i64 2
  store i64 %a1, ptr %t5740
  %t5741 = getelementptr i64, ptr %t5736, i64 3
  store i64 %t5738, ptr %t5741
  %t5742 = musttail call fastcc i64 @"scheme.base:code_1098"(i64 %t5738, i64 1, i64 8, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5742
}

define fastcc i64 @"scheme.base:code:rat-num-in"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5747 = icmp eq i64 %argc, 2
  br i1 %t5747, label %argok1354, label %arityerr1353
arityerr1353:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1354:
  %t5748 = load i64, ptr @"scheme.base:rat-ceil-flo"
  call void @rt_check_callable(i64 %t5748)
  %t5749 = and i64 %t5748, -8
  %t5750 = inttoptr i64 %t5749 to ptr
  %t5751 = load i64, ptr %t5750
  %t5752 = inttoptr i64 %t5751 to ptr
  %t5753 = call fastcc i64%t5752(i64 %t5748, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5754 = call i64 @rt_exact_to_inexact(i64 %t5753)
  %t5755 = or i64 %t5754, %a1
  %t5756 = and i64 %t5755, 7
  %t5757 = icmp eq i64 %t5756, 0
  br i1 %t5757, label %fixfast1355, label %fixslow1356
fixfast1355:
  %t5758 = icmp slt i64 %t5754, %a1
  %t5759 = select i1 %t5758, i64 257, i64 1
  br label %fixmerge1357
fixslow1356:
  %t5760 = call i64 @rt_lt(i64 %t5754, i64 %a1)
  br label %fixmerge1357
fixmerge1357:
  %t5761 = phi i64 [ %t5759, %fixfast1355 ], [ %t5760, %fixslow1356 ]
  %t5762 = icmp ne i64 %t5761, 1
  br i1 %t5762, label %then1358, label %else1359
then1358:
  br label %merge1360
else1359:
  %t5763 = or i64 %t5754, %a1
  %t5764 = and i64 %t5763, 7
  %t5765 = icmp eq i64 %t5764, 0
  br i1 %t5765, label %fixfast1361, label %fixslow1362
fixfast1361:
  %t5766 = icmp eq i64 %t5754, %a1
  %t5767 = select i1 %t5766, i64 257, i64 1
  br label %fixmerge1363
fixslow1362:
  %t5768 = call i64 @rt_num_eq(i64 %t5754, i64 %a1)
  br label %fixmerge1363
fixmerge1363:
  %t5769 = phi i64 [ %t5767, %fixfast1361 ], [ %t5768, %fixslow1362 ]
  br label %merge1360
merge1360:
  %t5770 = phi i64 [ 257, %then1358 ], [ %t5769, %fixmerge1363 ]
  %t5771 = icmp ne i64 %t5770, 1
  br i1 %t5771, label %then1364, label %else1365
then1364:
  ret i64 %t5753
else1365:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rat-ceil-flo"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5776 = icmp eq i64 %argc, 1
  br i1 %t5776, label %argok1367, label %arityerr1366
arityerr1366:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1367:
  %t5777 = load i64, ptr @"scheme.base:floor"
  call void @rt_check_callable(i64 %t5777)
  %t5778 = and i64 %t5777, -8
  %t5779 = inttoptr i64 %t5778 to ptr
  %t5780 = load i64, ptr %t5779
  %t5781 = inttoptr i64 %t5780 to ptr
  %t5782 = call fastcc i64%t5781(i64 %t5777, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5783 = call i64 @rt_inexact_to_exact(i64 %t5782)
  %t5784 = call i64 @rt_exact_to_inexact(i64 %t5783)
  %t5785 = or i64 %t5784, %a0
  %t5786 = and i64 %t5785, 7
  %t5787 = icmp eq i64 %t5786, 0
  br i1 %t5787, label %fixfast1368, label %fixslow1369
fixfast1368:
  %t5788 = icmp slt i64 %t5784, %a0
  %t5789 = select i1 %t5788, i64 257, i64 1
  br label %fixmerge1370
fixslow1369:
  %t5790 = call i64 @rt_lt(i64 %t5784, i64 %a0)
  br label %fixmerge1370
fixmerge1370:
  %t5791 = phi i64 [ %t5789, %fixfast1368 ], [ %t5790, %fixslow1369 ]
  %t5792 = icmp ne i64 %t5791, 1
  br i1 %t5792, label %then1371, label %else1372
then1371:
  %t5793 = or i64 %t5783, 8
  %t5794 = and i64 %t5793, 7
  %t5795 = icmp eq i64 %t5794, 0
  br i1 %t5795, label %fixfast1373, label %fixslow1374
fixfast1373:
  %t5796 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5783, i64 8)
  %t5797 = extractvalue {i64, i1} %t5796, 0
  %t5798 = extractvalue {i64, i1} %t5796, 1
  br i1 %t5798, label %fixslow1374, label %fixmerge1375
fixslow1374:
  %t5799 = call i64 @rt_add(i64 %t5783, i64 8)
  br label %fixmerge1375
fixmerge1375:
  %t5800 = phi i64 [ %t5797, %fixfast1373 ], [ %t5799, %fixslow1374 ]
  ret i64 %t5800
else1372:
  ret i64 %t5783
}

define fastcc i64 @"scheme.base:code:values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5805 = icmp sge i64 %argc, 0
  br i1 %t5805, label %argok1377, label %arityerr1376
arityerr1376:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1377:
  %t5806 = call ptr @rt_alloc_words(i64 8)
  %t5807 = getelementptr i64, ptr %t5806, i64 0
  store i64 %a0, ptr %t5807
  %t5808 = getelementptr i64, ptr %t5806, i64 1
  store i64 %a1, ptr %t5808
  %t5809 = getelementptr i64, ptr %t5806, i64 2
  store i64 %a2, ptr %t5809
  %t5810 = getelementptr i64, ptr %t5806, i64 3
  store i64 %a3, ptr %t5810
  %t5811 = getelementptr i64, ptr %t5806, i64 4
  store i64 %a4, ptr %t5811
  %t5812 = getelementptr i64, ptr %t5806, i64 5
  store i64 %a5, ptr %t5812
  %t5813 = getelementptr i64, ptr %t5806, i64 6
  store i64 %a6, ptr %t5813
  %t5814 = getelementptr i64, ptr %t5806, i64 7
  store i64 %a7, ptr %t5814
  %t5815 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t5806, ptr %overflow)
  %t5816 = call i64 @rt_pair_p(i64 %t5815)
  %t5817 = icmp ne i64 %t5816, 1
  br i1 %t5817, label %then1378, label %else1379
then1378:
  %t5818 = call i64 @rt_cdr(i64 %t5815)
  %t5819 = call i64 @rt_null_p(i64 %t5818)
  br label %merge1380
else1379:
  br label %merge1380
merge1380:
  %t5820 = phi i64 [ %t5819, %then1378 ], [ 1, %else1379 ]
  %t5821 = icmp ne i64 %t5820, 1
  br i1 %t5821, label %then1381, label %else1382
then1381:
  %t5822 = call i64 @rt_car(i64 %t5815)
  ret i64 %t5822
else1382:
  %t5823 = call i64 @rt_list_to_mv(i64 %t5815)
  ret i64 %t5823
}

define fastcc i64 @"scheme.base:code:call-with-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5828 = icmp eq i64 %argc, 2
  br i1 %t5828, label %argok1384, label %arityerr1383
arityerr1383:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1384:
  call void @rt_check_callable(i64 %a0)
  %t5829 = and i64 %a0, -8
  %t5830 = inttoptr i64 %t5829 to ptr
  %t5831 = load i64, ptr %t5830
  %t5832 = inttoptr i64 %t5831 to ptr
  %t5833 = call fastcc i64%t5832(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5834 = call i64 @rt_mv_p(i64 %t5833)
  %t5835 = icmp ne i64 %t5834, 1
  br i1 %t5835, label %then1385, label %else1386
then1385:
  %t5836 = call i64 @rt_mv_to_list(i64 %t5833)
  call void @rt_check_callable(i64 %a1)
  %t5837 = and i64 %a1, -8
  %t5838 = inttoptr i64 %t5837 to ptr
  %t5839 = load i64, ptr %t5838
  %t5840 = inttoptr i64 %t5839 to ptr
  %t5841 = call i64 @rt_list_length(i64 %t5836)
  %t5842 = add i64 0, %t5841
  %t5843 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t5836, i64 8)
  %t5855 = getelementptr i64, ptr %t5843, i64 0
  %t5847 = load i64, ptr %t5855
  %t5856 = getelementptr i64, ptr %t5843, i64 1
  %t5848 = load i64, ptr %t5856
  %t5857 = getelementptr i64, ptr %t5843, i64 2
  %t5849 = load i64, ptr %t5857
  %t5858 = getelementptr i64, ptr %t5843, i64 3
  %t5850 = load i64, ptr %t5858
  %t5859 = getelementptr i64, ptr %t5843, i64 4
  %t5851 = load i64, ptr %t5859
  %t5860 = getelementptr i64, ptr %t5843, i64 5
  %t5852 = load i64, ptr %t5860
  %t5861 = getelementptr i64, ptr %t5843, i64 6
  %t5853 = load i64, ptr %t5861
  %t5862 = getelementptr i64, ptr %t5843, i64 7
  %t5854 = load i64, ptr %t5862
  %t5844 = icmp sgt i64 %t5842, 8
  %t5845 = getelementptr i64, ptr %t5843, i64 8
  %t5846 = select i1 %t5844, ptr %t5845, ptr null
  %t5863 = musttail call fastcc i64 %t5840(i64 %a1, i64 %t5842, i64 %t5847, i64 %t5848, i64 %t5849, i64 %t5850, i64 %t5851, i64 %t5852, i64 %t5853, i64 %t5854, ptr %t5846)
  ret i64 %t5863
else1386:
  call void @rt_check_callable(i64 %a1)
  %t5864 = and i64 %a1, -8
  %t5865 = inttoptr i64 %t5864 to ptr
  %t5866 = load i64, ptr %t5865
  %t5867 = inttoptr i64 %t5866 to ptr
  %t5868 = musttail call fastcc i64 %t5867(i64 %a1, i64 1, i64 %t5833, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5868
}

define fastcc i64 @"scheme.base:code:make-hash-table"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5875 = icmp eq i64 %argc, 0
  br i1 %t5875, label %argok1388, label %arityerr1387
arityerr1387:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1388:
  %t5876 = load i64, ptr @"scheme.base:%ht-initial-buckets"
  %t5877 = call i64 @rt_make_vector(i64 %t5876, i64 2)
  %t5878 = load i64, ptr @"scheme.base:vector"
  call void @rt_check_callable(i64 %t5878)
  %t5879 = and i64 %t5878, -8
  %t5880 = inttoptr i64 %t5879 to ptr
  %t5881 = load i64, ptr %t5880
  %t5882 = inttoptr i64 %t5881 to ptr
  %t5883 = call fastcc i64%t5882(i64 %t5878, i64 3, i64 0, i64 %t5877, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5884 = call i64 @rt_make_hash_table(i64 %t5883)
  ret i64 %t5884
}

define fastcc i64 @"scheme.base:code:hash-table?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5889 = icmp eq i64 %argc, 1
  br i1 %t5889, label %argok1390, label %arityerr1389
arityerr1389:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1390:
  %t5890 = call i64 @rt_hash_table_p(i64 %a0)
  ret i64 %t5890
}

define fastcc i64 @"scheme.base:code:%ht-count"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5895 = icmp eq i64 %argc, 1
  br i1 %t5895, label %argok1392, label %arityerr1391
arityerr1391:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1392:
  %t5896 = call i64 @rt_hash_table_spine(i64 %a0)
  %t5897 = call i64 @rt_vector_ref(i64 %t5896, i64 0)
  ret i64 %t5897
}

define fastcc i64 @"scheme.base:code:%ht-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5902 = icmp eq i64 %argc, 1
  br i1 %t5902, label %argok1394, label %arityerr1393
arityerr1393:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1394:
  %t5903 = call i64 @rt_hash_table_spine(i64 %a0)
  %t5904 = call i64 @rt_vector_ref(i64 %t5903, i64 8)
  ret i64 %t5904
}

define fastcc i64 @"scheme.base:code:%ht-set-count!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5909 = icmp eq i64 %argc, 2
  br i1 %t5909, label %argok1396, label %arityerr1395
arityerr1395:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1396:
  %t5910 = call i64 @rt_hash_table_spine(i64 %a0)
  %t5911 = call i64 @rt_vector_set(i64 %t5910, i64 0, i64 %a1)
  ret i64 %t5911
}

define fastcc i64 @"scheme.base:code:%ht-set-buckets!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5916 = icmp eq i64 %argc, 2
  br i1 %t5916, label %argok1398, label %arityerr1397
arityerr1397:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1398:
  %t5917 = call i64 @rt_hash_table_spine(i64 %a0)
  %t5918 = call i64 @rt_vector_set(i64 %t5917, i64 8, i64 %a1)
  ret i64 %t5918
}

define fastcc i64 @"scheme.base:code:%ht-index"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5923 = icmp eq i64 %argc, 2
  br i1 %t5923, label %argok1400, label %arityerr1399
arityerr1399:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1400:
  %t5924 = call i64 @rt_hash(i64 %a0)
  %t5925 = call i64 @rt_remainder(i64 %t5924, i64 %a1)
  ret i64 %t5925
}

define fastcc i64 @"scheme.base:code:%ht-assoc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5930 = icmp eq i64 %argc, 2
  br i1 %t5930, label %argok1402, label %arityerr1401
arityerr1401:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1402:
  %t5931 = call i64 @rt_null_p(i64 %a1)
  %t5932 = icmp ne i64 %t5931, 1
  br i1 %t5932, label %then1403, label %else1404
then1403:
  ret i64 1
else1404:
  %t5933 = call i64 @rt_car(i64 %a1)
  %t5934 = call i64 @rt_car(i64 %t5933)
  %t5935 = call i64 @rt_equal(i64 %a0, i64 %t5934)
  %t5936 = icmp ne i64 %t5935, 1
  br i1 %t5936, label %then1405, label %else1406
then1405:
  %t5937 = call i64 @rt_car(i64 %a1)
  ret i64 %t5937
else1406:
  %t5938 = call i64 @rt_cdr(i64 %a1)
  %t5939 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t5939)
  %t5940 = and i64 %t5939, -8
  %t5941 = inttoptr i64 %t5940 to ptr
  %t5942 = load i64, ptr %t5941
  %t5943 = inttoptr i64 %t5942 to ptr
  %t5944 = musttail call fastcc i64 %t5943(i64 %t5939, i64 2, i64 %a0, i64 %t5938, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5944
}

define fastcc i64 @"scheme.base:code:%ht-remove"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5949 = icmp eq i64 %argc, 2
  br i1 %t5949, label %argok1408, label %arityerr1407
arityerr1407:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1408:
  %t5950 = call i64 @rt_null_p(i64 %a1)
  %t5951 = icmp ne i64 %t5950, 1
  br i1 %t5951, label %then1409, label %else1410
then1409:
  ret i64 2
else1410:
  %t5952 = call i64 @rt_car(i64 %a1)
  %t5953 = call i64 @rt_car(i64 %t5952)
  %t5954 = call i64 @rt_equal(i64 %a0, i64 %t5953)
  %t5955 = icmp ne i64 %t5954, 1
  br i1 %t5955, label %then1411, label %else1412
then1411:
  %t5956 = call i64 @rt_cdr(i64 %a1)
  ret i64 %t5956
else1412:
  %t5957 = call i64 @rt_car(i64 %a1)
  %t5958 = call i64 @rt_cdr(i64 %a1)
  %t5959 = load i64, ptr @"scheme.base:%ht-remove"
  call void @rt_check_callable(i64 %t5959)
  %t5960 = and i64 %t5959, -8
  %t5961 = inttoptr i64 %t5960 to ptr
  %t5962 = load i64, ptr %t5961
  %t5963 = inttoptr i64 %t5962 to ptr
  %t5964 = call fastcc i64%t5963(i64 %t5959, i64 2, i64 %a0, i64 %t5958, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5965 = call i64 @rt_cons(i64 %t5957, i64 %t5964)
  ret i64 %t5965
}

define fastcc i64 @"scheme.base:code:hash-table-ref/default"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5970 = icmp eq i64 %argc, 3
  br i1 %t5970, label %argok1414, label %arityerr1413
arityerr1413:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1414:
  %t5971 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t5971)
  %t5972 = and i64 %t5971, -8
  %t5973 = inttoptr i64 %t5972 to ptr
  %t5974 = load i64, ptr %t5973
  %t5975 = inttoptr i64 %t5974 to ptr
  %t5976 = call fastcc i64%t5975(i64 %t5971, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5977 = call i64 @rt_vector_length(i64 %t5976)
  %t5978 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t5978)
  %t5979 = and i64 %t5978, -8
  %t5980 = inttoptr i64 %t5979 to ptr
  %t5981 = load i64, ptr %t5980
  %t5982 = inttoptr i64 %t5981 to ptr
  %t5983 = call fastcc i64%t5982(i64 %t5978, i64 2, i64 %a1, i64 %t5977, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5984 = call i64 @rt_vector_ref(i64 %t5976, i64 %t5983)
  %t5985 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t5985)
  %t5986 = and i64 %t5985, -8
  %t5987 = inttoptr i64 %t5986 to ptr
  %t5988 = load i64, ptr %t5987
  %t5989 = inttoptr i64 %t5988 to ptr
  %t5990 = call fastcc i64%t5989(i64 %t5985, i64 2, i64 %a1, i64 %t5984, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5991 = icmp ne i64 %t5990, 1
  br i1 %t5991, label %then1415, label %else1416
then1415:
  %t5992 = call i64 @rt_cdr(i64 %t5990)
  ret i64 %t5992
else1416:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:hash-table-contains?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5997 = icmp eq i64 %argc, 2
  br i1 %t5997, label %argok1418, label %arityerr1417
arityerr1417:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1418:
  %t5998 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t5998)
  %t5999 = and i64 %t5998, -8
  %t6000 = inttoptr i64 %t5999 to ptr
  %t6001 = load i64, ptr %t6000
  %t6002 = inttoptr i64 %t6001 to ptr
  %t6003 = call fastcc i64%t6002(i64 %t5998, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6004 = call i64 @rt_vector_length(i64 %t6003)
  %t6005 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t6005)
  %t6006 = and i64 %t6005, -8
  %t6007 = inttoptr i64 %t6006 to ptr
  %t6008 = load i64, ptr %t6007
  %t6009 = inttoptr i64 %t6008 to ptr
  %t6010 = call fastcc i64%t6009(i64 %t6005, i64 2, i64 %a1, i64 %t6004, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6011 = call i64 @rt_vector_ref(i64 %t6003, i64 %t6010)
  %t6012 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t6012)
  %t6013 = and i64 %t6012, -8
  %t6014 = inttoptr i64 %t6013 to ptr
  %t6015 = load i64, ptr %t6014
  %t6016 = inttoptr i64 %t6015 to ptr
  %t6017 = call fastcc i64%t6016(i64 %t6012, i64 2, i64 %a1, i64 %t6011, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6018 = icmp ne i64 %t6017, 1
  br i1 %t6018, label %then1419, label %else1420
then1419:
  ret i64 257
else1420:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-ref"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6023 = icmp eq i64 %argc, 2
  br i1 %t6023, label %argok1422, label %arityerr1421
arityerr1421:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1422:
  %t6024 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t6024)
  %t6025 = and i64 %t6024, -8
  %t6026 = inttoptr i64 %t6025 to ptr
  %t6027 = load i64, ptr %t6026
  %t6028 = inttoptr i64 %t6027 to ptr
  %t6029 = call fastcc i64%t6028(i64 %t6024, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6030 = call i64 @rt_vector_length(i64 %t6029)
  %t6031 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t6031)
  %t6032 = and i64 %t6031, -8
  %t6033 = inttoptr i64 %t6032 to ptr
  %t6034 = load i64, ptr %t6033
  %t6035 = inttoptr i64 %t6034 to ptr
  %t6036 = call fastcc i64%t6035(i64 %t6031, i64 2, i64 %a1, i64 %t6030, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6037 = call i64 @rt_vector_ref(i64 %t6029, i64 %t6036)
  %t6038 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t6038)
  %t6039 = and i64 %t6038, -8
  %t6040 = inttoptr i64 %t6039 to ptr
  %t6041 = load i64, ptr %t6040
  %t6042 = inttoptr i64 %t6041 to ptr
  %t6043 = call fastcc i64%t6042(i64 %t6038, i64 2, i64 %a1, i64 %t6037, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6044 = icmp ne i64 %t6043, 1
  br i1 %t6044, label %then1423, label %else1424
then1423:
  %t6045 = call i64 @rt_cdr(i64 %t6043)
  ret i64 %t6045
else1424:
  %t6046 = call i64 @rt_make_string(ptr @.str.lit.33, i64 29)
  %t6047 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6047)
  %t6048 = and i64 %t6047, -8
  %t6049 = inttoptr i64 %t6048 to ptr
  %t6050 = load i64, ptr %t6049
  %t6051 = inttoptr i64 %t6050 to ptr
  %t6052 = musttail call fastcc i64 %t6051(i64 %t6047, i64 2, i64 %t6046, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6052
}

define fastcc i64 @"scheme.base:code:hash-table-set!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6057 = icmp eq i64 %argc, 3
  br i1 %t6057, label %argok1426, label %arityerr1425
arityerr1425:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1426:
  %t6058 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t6058)
  %t6059 = and i64 %t6058, -8
  %t6060 = inttoptr i64 %t6059 to ptr
  %t6061 = load i64, ptr %t6060
  %t6062 = inttoptr i64 %t6061 to ptr
  %t6063 = call fastcc i64%t6062(i64 %t6058, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6064 = call i64 @rt_vector_length(i64 %t6063)
  %t6065 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t6065)
  %t6066 = and i64 %t6065, -8
  %t6067 = inttoptr i64 %t6066 to ptr
  %t6068 = load i64, ptr %t6067
  %t6069 = inttoptr i64 %t6068 to ptr
  %t6070 = call fastcc i64%t6069(i64 %t6065, i64 2, i64 %a1, i64 %t6064, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6071 = call i64 @rt_vector_ref(i64 %t6063, i64 %t6070)
  %t6072 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t6072)
  %t6073 = and i64 %t6072, -8
  %t6074 = inttoptr i64 %t6073 to ptr
  %t6075 = load i64, ptr %t6074
  %t6076 = inttoptr i64 %t6075 to ptr
  %t6077 = call fastcc i64%t6076(i64 %t6072, i64 2, i64 %a1, i64 %t6071, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6078 = call i64 @rt_cons(i64 %a1, i64 %a2)
  %t6079 = icmp ne i64 %t6077, 1
  br i1 %t6079, label %then1427, label %else1428
then1427:
  %t6080 = load i64, ptr @"scheme.base:%ht-remove"
  call void @rt_check_callable(i64 %t6080)
  %t6081 = and i64 %t6080, -8
  %t6082 = inttoptr i64 %t6081 to ptr
  %t6083 = load i64, ptr %t6082
  %t6084 = inttoptr i64 %t6083 to ptr
  %t6085 = call fastcc i64%t6084(i64 %t6080, i64 2, i64 %a1, i64 %t6071, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge1429
else1428:
  br label %merge1429
merge1429:
  %t6086 = phi i64 [ %t6085, %then1427 ], [ %t6071, %else1428 ]
  %t6087 = call i64 @rt_cons(i64 %t6078, i64 %t6086)
  %t6088 = call i64 @rt_vector_set(i64 %t6063, i64 %t6070, i64 %t6087)
  %t6089 = icmp ne i64 %t6077, 1
  br i1 %t6089, label %then1430, label %else1431
then1430:
  ret i64 1
else1431:
  %t6090 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t6090)
  %t6091 = and i64 %t6090, -8
  %t6092 = inttoptr i64 %t6091 to ptr
  %t6093 = load i64, ptr %t6092
  %t6094 = inttoptr i64 %t6093 to ptr
  %t6095 = call fastcc i64%t6094(i64 %t6090, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6096 = or i64 %t6095, 8
  %t6097 = and i64 %t6096, 7
  %t6098 = icmp eq i64 %t6097, 0
  br i1 %t6098, label %fixfast1432, label %fixslow1433
fixfast1432:
  %t6099 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6095, i64 8)
  %t6100 = extractvalue {i64, i1} %t6099, 0
  %t6101 = extractvalue {i64, i1} %t6099, 1
  br i1 %t6101, label %fixslow1433, label %fixmerge1434
fixslow1433:
  %t6102 = call i64 @rt_add(i64 %t6095, i64 8)
  br label %fixmerge1434
fixmerge1434:
  %t6103 = phi i64 [ %t6100, %fixfast1432 ], [ %t6102, %fixslow1433 ]
  %t6104 = load i64, ptr @"scheme.base:%ht-set-count!"
  call void @rt_check_callable(i64 %t6104)
  %t6105 = and i64 %t6104, -8
  %t6106 = inttoptr i64 %t6105 to ptr
  %t6107 = load i64, ptr %t6106
  %t6108 = inttoptr i64 %t6107 to ptr
  %t6109 = call fastcc i64%t6108(i64 %t6104, i64 2, i64 %a0, i64 %t6103, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6110 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t6110)
  %t6111 = and i64 %t6110, -8
  %t6112 = inttoptr i64 %t6111 to ptr
  %t6113 = load i64, ptr %t6112
  %t6114 = inttoptr i64 %t6113 to ptr
  %t6115 = call fastcc i64%t6114(i64 %t6110, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6116 = load i64, ptr @"scheme.base:%ht-load-factor"
  %t6117 = or i64 %t6116, %t6064
  %t6118 = and i64 %t6117, 7
  %t6119 = icmp eq i64 %t6118, 0
  br i1 %t6119, label %fixfast1435, label %fixslow1436
fixfast1435:
  %t6120 = ashr i64 %t6116, 3
  %t6121 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t6120, i64 %t6064)
  %t6122 = extractvalue {i64, i1} %t6121, 0
  %t6123 = extractvalue {i64, i1} %t6121, 1
  br i1 %t6123, label %fixslow1436, label %fixmerge1437
fixslow1436:
  %t6124 = call i64 @rt_mul(i64 %t6116, i64 %t6064)
  br label %fixmerge1437
fixmerge1437:
  %t6125 = phi i64 [ %t6122, %fixfast1435 ], [ %t6124, %fixslow1436 ]
  %t6126 = or i64 %t6125, %t6115
  %t6127 = and i64 %t6126, 7
  %t6128 = icmp eq i64 %t6127, 0
  br i1 %t6128, label %fixfast1438, label %fixslow1439
fixfast1438:
  %t6129 = icmp slt i64 %t6125, %t6115
  %t6130 = select i1 %t6129, i64 257, i64 1
  br label %fixmerge1440
fixslow1439:
  %t6131 = call i64 @rt_lt(i64 %t6125, i64 %t6115)
  br label %fixmerge1440
fixmerge1440:
  %t6132 = phi i64 [ %t6130, %fixfast1438 ], [ %t6131, %fixslow1439 ]
  %t6133 = icmp ne i64 %t6132, 1
  br i1 %t6133, label %then1441, label %else1442
then1441:
  %t6134 = load i64, ptr @"scheme.base:%ht-grow!"
  call void @rt_check_callable(i64 %t6134)
  %t6135 = and i64 %t6134, -8
  %t6136 = inttoptr i64 %t6135 to ptr
  %t6137 = load i64, ptr %t6136
  %t6138 = inttoptr i64 %t6137 to ptr
  %t6139 = musttail call fastcc i64 %t6138(i64 %t6134, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6139
else1442:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-delete!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6144 = icmp eq i64 %argc, 2
  br i1 %t6144, label %argok1444, label %arityerr1443
arityerr1443:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1444:
  %t6145 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t6145)
  %t6146 = and i64 %t6145, -8
  %t6147 = inttoptr i64 %t6146 to ptr
  %t6148 = load i64, ptr %t6147
  %t6149 = inttoptr i64 %t6148 to ptr
  %t6150 = call fastcc i64%t6149(i64 %t6145, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6151 = call i64 @rt_vector_length(i64 %t6150)
  %t6152 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t6152)
  %t6153 = and i64 %t6152, -8
  %t6154 = inttoptr i64 %t6153 to ptr
  %t6155 = load i64, ptr %t6154
  %t6156 = inttoptr i64 %t6155 to ptr
  %t6157 = call fastcc i64%t6156(i64 %t6152, i64 2, i64 %a1, i64 %t6151, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6158 = call i64 @rt_vector_ref(i64 %t6150, i64 %t6157)
  %t6159 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t6159)
  %t6160 = and i64 %t6159, -8
  %t6161 = inttoptr i64 %t6160 to ptr
  %t6162 = load i64, ptr %t6161
  %t6163 = inttoptr i64 %t6162 to ptr
  %t6164 = call fastcc i64%t6163(i64 %t6159, i64 2, i64 %a1, i64 %t6158, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6165 = icmp ne i64 %t6164, 1
  br i1 %t6165, label %then1445, label %else1446
then1445:
  %t6166 = load i64, ptr @"scheme.base:%ht-remove"
  call void @rt_check_callable(i64 %t6166)
  %t6167 = and i64 %t6166, -8
  %t6168 = inttoptr i64 %t6167 to ptr
  %t6169 = load i64, ptr %t6168
  %t6170 = inttoptr i64 %t6169 to ptr
  %t6171 = call fastcc i64%t6170(i64 %t6166, i64 2, i64 %a1, i64 %t6158, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6172 = call i64 @rt_vector_set(i64 %t6150, i64 %t6157, i64 %t6171)
  %t6173 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t6173)
  %t6174 = and i64 %t6173, -8
  %t6175 = inttoptr i64 %t6174 to ptr
  %t6176 = load i64, ptr %t6175
  %t6177 = inttoptr i64 %t6176 to ptr
  %t6178 = call fastcc i64%t6177(i64 %t6173, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6179 = or i64 %t6178, 8
  %t6180 = and i64 %t6179, 7
  %t6181 = icmp eq i64 %t6180, 0
  br i1 %t6181, label %fixfast1447, label %fixslow1448
fixfast1447:
  %t6182 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6178, i64 8)
  %t6183 = extractvalue {i64, i1} %t6182, 0
  %t6184 = extractvalue {i64, i1} %t6182, 1
  br i1 %t6184, label %fixslow1448, label %fixmerge1449
fixslow1448:
  %t6185 = call i64 @rt_sub(i64 %t6178, i64 8)
  br label %fixmerge1449
fixmerge1449:
  %t6186 = phi i64 [ %t6183, %fixfast1447 ], [ %t6185, %fixslow1448 ]
  %t6187 = load i64, ptr @"scheme.base:%ht-set-count!"
  call void @rt_check_callable(i64 %t6187)
  %t6188 = and i64 %t6187, -8
  %t6189 = inttoptr i64 %t6188 to ptr
  %t6190 = load i64, ptr %t6189
  %t6191 = inttoptr i64 %t6190 to ptr
  %t6192 = musttail call fastcc i64 %t6191(i64 %t6187, i64 2, i64 %a0, i64 %t6186, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6192
else1446:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_1194"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6197 = icmp eq i64 %argc, 1
  br i1 %t6197, label %argok1451, label %arityerr1450
arityerr1450:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1451:
  %t6198 = call i64 @rt_null_p(i64 %a0)
  %t6199 = icmp ne i64 %t6198, 1
  br i1 %t6199, label %then1452, label %else1453
then1452:
  ret i64 1
else1453:
  %t6200 = call i64 @rt_car(i64 %a0)
  %t6201 = call i64 @rt_car(i64 %t6200)
  %t6202 = and i64 %self, -8
  %t6203 = inttoptr i64 %t6202 to ptr
  %t6204 = getelementptr i64, ptr %t6203, i64 1
  %t6205 = load i64, ptr %t6204
  %t6206 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t6206)
  %t6207 = and i64 %t6206, -8
  %t6208 = inttoptr i64 %t6207 to ptr
  %t6209 = load i64, ptr %t6208
  %t6210 = inttoptr i64 %t6209 to ptr
  %t6211 = call fastcc i64%t6210(i64 %t6206, i64 2, i64 %t6201, i64 %t6205, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6212 = and i64 %self, -8
  %t6213 = inttoptr i64 %t6212 to ptr
  %t6214 = getelementptr i64, ptr %t6213, i64 2
  %t6215 = load i64, ptr %t6214
  %t6216 = and i64 %self, -8
  %t6217 = inttoptr i64 %t6216 to ptr
  %t6218 = getelementptr i64, ptr %t6217, i64 2
  %t6219 = load i64, ptr %t6218
  %t6220 = call i64 @rt_vector_ref(i64 %t6219, i64 %t6211)
  %t6221 = call i64 @rt_cons(i64 %t6200, i64 %t6220)
  %t6222 = call i64 @rt_vector_set(i64 %t6215, i64 %t6211, i64 %t6221)
  %t6223 = call i64 @rt_cdr(i64 %a0)
  %t6224 = musttail call fastcc i64 @"scheme.base:code_1194"(i64 %self, i64 1, i64 %t6223, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6224
}

define fastcc i64 @"scheme.base:code_1192"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6225 = icmp eq i64 %argc, 1
  br i1 %t6225, label %argok1455, label %arityerr1454
arityerr1454:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1455:
  %t6226 = and i64 %self, -8
  %t6227 = inttoptr i64 %t6226 to ptr
  %t6228 = getelementptr i64, ptr %t6227, i64 1
  %t6229 = load i64, ptr %t6228
  %t6230 = call i64 @rt_vector_length(i64 %t6229)
  %t6231 = or i64 %a0, %t6230
  %t6232 = and i64 %t6231, 7
  %t6233 = icmp eq i64 %t6232, 0
  br i1 %t6233, label %fixfast1456, label %fixslow1457
fixfast1456:
  %t6234 = icmp slt i64 %a0, %t6230
  %t6235 = select i1 %t6234, i64 257, i64 1
  br label %fixmerge1458
fixslow1457:
  %t6236 = call i64 @rt_lt(i64 %a0, i64 %t6230)
  br label %fixmerge1458
fixmerge1458:
  %t6237 = phi i64 [ %t6235, %fixfast1456 ], [ %t6236, %fixslow1457 ]
  %t6238 = icmp ne i64 %t6237, 1
  br i1 %t6238, label %then1459, label %else1460
then1459:
  %t6239 = call ptr @rt_alloc_words(i64 4)
  %t6240 = ptrtoint ptr %t6239 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1194" to i64), ptr %t6239
  %t6241 = or i64 %t6240, 4
  %t6242 = and i64 %self, -8
  %t6243 = inttoptr i64 %t6242 to ptr
  %t6244 = getelementptr i64, ptr %t6243, i64 2
  %t6245 = load i64, ptr %t6244
  %t6246 = getelementptr i64, ptr %t6239, i64 1
  store i64 %t6245, ptr %t6246
  %t6247 = and i64 %self, -8
  %t6248 = inttoptr i64 %t6247 to ptr
  %t6249 = getelementptr i64, ptr %t6248, i64 3
  %t6250 = load i64, ptr %t6249
  %t6251 = getelementptr i64, ptr %t6239, i64 2
  store i64 %t6250, ptr %t6251
  %t6252 = getelementptr i64, ptr %t6239, i64 3
  store i64 %t6241, ptr %t6252
  %t6253 = and i64 %self, -8
  %t6254 = inttoptr i64 %t6253 to ptr
  %t6255 = getelementptr i64, ptr %t6254, i64 1
  %t6256 = load i64, ptr %t6255
  %t6257 = call i64 @rt_vector_ref(i64 %t6256, i64 %a0)
  %t6258 = call fastcc i64 @"scheme.base:code_1194"(i64 %t6241, i64 1, i64 %t6257, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6259 = or i64 %a0, 8
  %t6260 = and i64 %t6259, 7
  %t6261 = icmp eq i64 %t6260, 0
  br i1 %t6261, label %fixfast1461, label %fixslow1462
fixfast1461:
  %t6262 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t6263 = extractvalue {i64, i1} %t6262, 0
  %t6264 = extractvalue {i64, i1} %t6262, 1
  br i1 %t6264, label %fixslow1462, label %fixmerge1463
fixslow1462:
  %t6265 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1463
fixmerge1463:
  %t6266 = phi i64 [ %t6263, %fixfast1461 ], [ %t6265, %fixslow1462 ]
  %t6267 = musttail call fastcc i64 @"scheme.base:code_1192"(i64 %self, i64 1, i64 %t6266, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6267
else1460:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%ht-grow!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6268 = icmp eq i64 %argc, 1
  br i1 %t6268, label %argok1465, label %arityerr1464
arityerr1464:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1465:
  %t6269 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t6269)
  %t6270 = and i64 %t6269, -8
  %t6271 = inttoptr i64 %t6270 to ptr
  %t6272 = load i64, ptr %t6271
  %t6273 = inttoptr i64 %t6272 to ptr
  %t6274 = call fastcc i64%t6273(i64 %t6269, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6275 = call i64 @rt_vector_length(i64 %t6274)
  %t6276 = or i64 16, %t6275
  %t6277 = and i64 %t6276, 7
  %t6278 = icmp eq i64 %t6277, 0
  br i1 %t6278, label %fixfast1466, label %fixslow1467
fixfast1466:
  %t6279 = ashr i64 16, 3
  %t6280 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t6279, i64 %t6275)
  %t6281 = extractvalue {i64, i1} %t6280, 0
  %t6282 = extractvalue {i64, i1} %t6280, 1
  br i1 %t6282, label %fixslow1467, label %fixmerge1468
fixslow1467:
  %t6283 = call i64 @rt_mul(i64 16, i64 %t6275)
  br label %fixmerge1468
fixmerge1468:
  %t6284 = phi i64 [ %t6281, %fixfast1466 ], [ %t6283, %fixslow1467 ]
  %t6285 = call i64 @rt_make_vector(i64 %t6284, i64 2)
  %t6286 = call ptr @rt_alloc_words(i64 5)
  %t6287 = ptrtoint ptr %t6286 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1192" to i64), ptr %t6286
  %t6288 = or i64 %t6287, 4
  %t6289 = getelementptr i64, ptr %t6286, i64 1
  store i64 %t6274, ptr %t6289
  %t6290 = getelementptr i64, ptr %t6286, i64 2
  store i64 %t6284, ptr %t6290
  %t6291 = getelementptr i64, ptr %t6286, i64 3
  store i64 %t6285, ptr %t6291
  %t6292 = getelementptr i64, ptr %t6286, i64 4
  store i64 %t6288, ptr %t6292
  %t6293 = call fastcc i64 @"scheme.base:code_1192"(i64 %t6288, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6294 = load i64, ptr @"scheme.base:%ht-set-buckets!"
  call void @rt_check_callable(i64 %t6294)
  %t6295 = and i64 %t6294, -8
  %t6296 = inttoptr i64 %t6295 to ptr
  %t6297 = load i64, ptr %t6296
  %t6298 = inttoptr i64 %t6297 to ptr
  %t6299 = musttail call fastcc i64 %t6298(i64 %t6294, i64 2, i64 %a0, i64 %t6285, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6299
}

define fastcc i64 @"scheme.base:code:hash-table-size"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6304 = icmp eq i64 %argc, 1
  br i1 %t6304, label %argok1470, label %arityerr1469
arityerr1469:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1470:
  %t6305 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t6305)
  %t6306 = and i64 %t6305, -8
  %t6307 = inttoptr i64 %t6306 to ptr
  %t6308 = load i64, ptr %t6307
  %t6309 = inttoptr i64 %t6308 to ptr
  %t6310 = musttail call fastcc i64 %t6309(i64 %t6305, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6310
}

define fastcc i64 @"scheme.base:code:%ht-fold-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6315 = icmp eq i64 %argc, 2
  br i1 %t6315, label %argok1472, label %arityerr1471
arityerr1471:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1472:
  %t6316 = call i64 @rt_null_p(i64 %a0)
  %t6317 = icmp ne i64 %t6316, 1
  br i1 %t6317, label %then1473, label %else1474
then1473:
  ret i64 %a1
else1474:
  %t6318 = call i64 @rt_car(i64 %a0)
  %t6319 = call i64 @rt_car(i64 %t6318)
  %t6320 = call i64 @rt_car(i64 %a0)
  %t6321 = call i64 @rt_cdr(i64 %t6320)
  %t6322 = call i64 @rt_cons(i64 %t6319, i64 %t6321)
  %t6323 = call i64 @rt_cdr(i64 %a0)
  %t6324 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  call void @rt_check_callable(i64 %t6324)
  %t6325 = and i64 %t6324, -8
  %t6326 = inttoptr i64 %t6325 to ptr
  %t6327 = load i64, ptr %t6326
  %t6328 = inttoptr i64 %t6327 to ptr
  %t6329 = call fastcc i64%t6328(i64 %t6324, i64 2, i64 %t6323, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6330 = call i64 @rt_cons(i64 %t6322, i64 %t6329)
  ret i64 %t6330
}

define fastcc i64 @"scheme.base:code_1211"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6335 = icmp eq i64 %argc, 2
  br i1 %t6335, label %argok1476, label %arityerr1475
arityerr1475:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1476:
  %t6336 = and i64 %self, -8
  %t6337 = inttoptr i64 %t6336 to ptr
  %t6338 = getelementptr i64, ptr %t6337, i64 1
  %t6339 = load i64, ptr %t6338
  %t6340 = call i64 @rt_vector_length(i64 %t6339)
  %t6341 = or i64 %a0, %t6340
  %t6342 = and i64 %t6341, 7
  %t6343 = icmp eq i64 %t6342, 0
  br i1 %t6343, label %fixfast1477, label %fixslow1478
fixfast1477:
  %t6344 = icmp slt i64 %a0, %t6340
  %t6345 = select i1 %t6344, i64 257, i64 1
  br label %fixmerge1479
fixslow1478:
  %t6346 = call i64 @rt_lt(i64 %a0, i64 %t6340)
  br label %fixmerge1479
fixmerge1479:
  %t6347 = phi i64 [ %t6345, %fixfast1477 ], [ %t6346, %fixslow1478 ]
  %t6348 = icmp ne i64 %t6347, 1
  br i1 %t6348, label %then1480, label %else1481
then1480:
  %t6349 = or i64 %a0, 8
  %t6350 = and i64 %t6349, 7
  %t6351 = icmp eq i64 %t6350, 0
  br i1 %t6351, label %fixfast1482, label %fixslow1483
fixfast1482:
  %t6352 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t6353 = extractvalue {i64, i1} %t6352, 0
  %t6354 = extractvalue {i64, i1} %t6352, 1
  br i1 %t6354, label %fixslow1483, label %fixmerge1484
fixslow1483:
  %t6355 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1484
fixmerge1484:
  %t6356 = phi i64 [ %t6353, %fixfast1482 ], [ %t6355, %fixslow1483 ]
  %t6357 = and i64 %self, -8
  %t6358 = inttoptr i64 %t6357 to ptr
  %t6359 = getelementptr i64, ptr %t6358, i64 1
  %t6360 = load i64, ptr %t6359
  %t6361 = call i64 @rt_vector_ref(i64 %t6360, i64 %a0)
  %t6362 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  call void @rt_check_callable(i64 %t6362)
  %t6363 = and i64 %t6362, -8
  %t6364 = inttoptr i64 %t6363 to ptr
  %t6365 = load i64, ptr %t6364
  %t6366 = inttoptr i64 %t6365 to ptr
  %t6367 = call fastcc i64%t6366(i64 %t6362, i64 2, i64 %t6361, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6368 = musttail call fastcc i64 @"scheme.base:code_1211"(i64 %self, i64 2, i64 %t6356, i64 %t6367, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6368
else1481:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:hash-table->alist"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6369 = icmp eq i64 %argc, 1
  br i1 %t6369, label %argok1486, label %arityerr1485
arityerr1485:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1486:
  %t6370 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t6370)
  %t6371 = and i64 %t6370, -8
  %t6372 = inttoptr i64 %t6371 to ptr
  %t6373 = load i64, ptr %t6372
  %t6374 = inttoptr i64 %t6373 to ptr
  %t6375 = call fastcc i64%t6374(i64 %t6370, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6376 = call ptr @rt_alloc_words(i64 3)
  %t6377 = ptrtoint ptr %t6376 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1211" to i64), ptr %t6376
  %t6378 = or i64 %t6377, 4
  %t6379 = getelementptr i64, ptr %t6376, i64 1
  store i64 %t6375, ptr %t6379
  %t6380 = getelementptr i64, ptr %t6376, i64 2
  store i64 %t6378, ptr %t6380
  %t6381 = musttail call fastcc i64 @"scheme.base:code_1211"(i64 %t6378, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6381
}

define fastcc i64 @"scheme.base:code_1216"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6386 = icmp eq i64 %argc, 1
  br i1 %t6386, label %argok1488, label %arityerr1487
arityerr1487:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1488:
  %t6387 = call i64 @rt_car(i64 %a0)
  ret i64 %t6387
}

define fastcc i64 @"scheme.base:code:hash-table-keys"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6388 = icmp eq i64 %argc, 1
  br i1 %t6388, label %argok1490, label %arityerr1489
arityerr1489:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1490:
  %t6389 = call ptr @rt_alloc_words(i64 1)
  %t6390 = ptrtoint ptr %t6389 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1216" to i64), ptr %t6389
  %t6391 = or i64 %t6390, 4
  %t6392 = load i64, ptr @"scheme.base:hash-table->alist"
  call void @rt_check_callable(i64 %t6392)
  %t6393 = and i64 %t6392, -8
  %t6394 = inttoptr i64 %t6393 to ptr
  %t6395 = load i64, ptr %t6394
  %t6396 = inttoptr i64 %t6395 to ptr
  %t6397 = call fastcc i64%t6396(i64 %t6392, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6398 = load i64, ptr @"scheme.base:map"
  call void @rt_check_callable(i64 %t6398)
  %t6399 = and i64 %t6398, -8
  %t6400 = inttoptr i64 %t6399 to ptr
  %t6401 = load i64, ptr %t6400
  %t6402 = inttoptr i64 %t6401 to ptr
  %t6403 = musttail call fastcc i64 %t6402(i64 %t6398, i64 2, i64 %t6391, i64 %t6397, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6403
}

define fastcc i64 @"scheme.base:code_1221"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6408 = icmp eq i64 %argc, 1
  br i1 %t6408, label %argok1492, label %arityerr1491
arityerr1491:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1492:
  %t6409 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t6409
}

define fastcc i64 @"scheme.base:code:hash-table-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6410 = icmp eq i64 %argc, 1
  br i1 %t6410, label %argok1494, label %arityerr1493
arityerr1493:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1494:
  %t6411 = call ptr @rt_alloc_words(i64 1)
  %t6412 = ptrtoint ptr %t6411 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1221" to i64), ptr %t6411
  %t6413 = or i64 %t6412, 4
  %t6414 = load i64, ptr @"scheme.base:hash-table->alist"
  call void @rt_check_callable(i64 %t6414)
  %t6415 = and i64 %t6414, -8
  %t6416 = inttoptr i64 %t6415 to ptr
  %t6417 = load i64, ptr %t6416
  %t6418 = inttoptr i64 %t6417 to ptr
  %t6419 = call fastcc i64%t6418(i64 %t6414, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6420 = load i64, ptr @"scheme.base:map"
  call void @rt_check_callable(i64 %t6420)
  %t6421 = and i64 %t6420, -8
  %t6422 = inttoptr i64 %t6421 to ptr
  %t6423 = load i64, ptr %t6422
  %t6424 = inttoptr i64 %t6423 to ptr
  %t6425 = musttail call fastcc i64 %t6424(i64 %t6420, i64 2, i64 %t6413, i64 %t6419, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6425
}

define fastcc i64 @"scheme.base:code:rd-report"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6430 = icmp eq i64 %argc, 3
  br i1 %t6430, label %argok1496, label %arityerr1495
arityerr1495:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1496:
  %t6431 = call i64 @rt_car(i64 %a2)
  %t6432 = call i64 @rt_cdr(i64 %a2)
  %t6433 = load i64, ptr @"emit.internal:rd-fail-pos"
  %t6434 = call fastcc i64 @"emit.internal:code:rd-fail-pos"(i64 %t6433, i64 1, i64 %t6432, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6435 = call i64 @rt_intern(ptr @.str.sym.34)
  %t6436 = call i64 @rt_eq_p(i64 %t6431, i64 %t6435)
  %t6437 = icmp ne i64 %t6436, 1
  br i1 %t6437, label %then1497, label %else1498
then1497:
  %t6438 = call i64 @rt_intern(ptr @.str.sym.12)
  %t6439 = call i64 @rt_make_string(ptr @.str.lit.35, i64 45)
  %t6440 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t6440)
  %t6441 = and i64 %t6440, -8
  %t6442 = inttoptr i64 %t6441 to ptr
  %t6443 = load i64, ptr %t6442
  %t6444 = inttoptr i64 %t6443 to ptr
  %t6445 = musttail call fastcc i64 %t6444(i64 %t6440, i64 3, i64 %t6438, i64 %t6439, i64 %t6434, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6445
else1498:
  %t6446 = call i64 @rt_intern(ptr @.str.sym.36)
  %t6447 = call i64 @rt_eq_p(i64 %t6431, i64 %t6446)
  %t6448 = icmp ne i64 %t6447, 1
  br i1 %t6448, label %then1499, label %else1500
then1499:
  %t6449 = call i64 @rt_intern(ptr @.str.sym.12)
  %t6450 = call i64 @rt_make_string(ptr @.str.lit.37, i64 41)
  %t6451 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t6451)
  %t6452 = and i64 %t6451, -8
  %t6453 = inttoptr i64 %t6452 to ptr
  %t6454 = load i64, ptr %t6453
  %t6455 = inttoptr i64 %t6454 to ptr
  %t6456 = musttail call fastcc i64 %t6455(i64 %t6451, i64 3, i64 %t6449, i64 %t6450, i64 %t6434, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6456
else1500:
  %t6457 = call i64 @rt_intern(ptr @.str.sym.38)
  %t6458 = call i64 @rt_eq_p(i64 %t6431, i64 %t6457)
  %t6459 = icmp ne i64 %t6458, 1
  br i1 %t6459, label %then1501, label %else1502
then1501:
  %t6460 = call i64 @rt_intern(ptr @.str.sym.12)
  %t6461 = call i64 @rt_make_string(ptr @.str.lit.39, i64 13)
  %t6462 = call i64 @rt_string_ref(i64 %a0, i64 %t6434)
  %t6463 = call i64 @rt_char_to_integer(i64 %t6462)
  %t6464 = or i64 %t6463, 728
  %t6465 = and i64 %t6464, 7
  %t6466 = icmp eq i64 %t6465, 0
  br i1 %t6466, label %fixfast1503, label %fixslow1504
fixfast1503:
  %t6467 = icmp eq i64 %t6463, 728
  %t6468 = select i1 %t6467, i64 257, i64 1
  br label %fixmerge1505
fixslow1504:
  %t6469 = call i64 @rt_num_eq(i64 %t6463, i64 728)
  br label %fixmerge1505
fixmerge1505:
  %t6470 = phi i64 [ %t6468, %fixfast1503 ], [ %t6469, %fixslow1504 ]
  %t6471 = icmp ne i64 %t6470, 1
  br i1 %t6471, label %then1506, label %else1507
then1506:
  %t6472 = call i64 @rt_make_string(ptr @.str.lit.40, i64 6)
  br label %merge1508
else1507:
  %t6473 = or i64 %t6463, 280
  %t6474 = and i64 %t6473, 7
  %t6475 = icmp eq i64 %t6474, 0
  br i1 %t6475, label %fixfast1509, label %fixslow1510
fixfast1509:
  %t6476 = icmp eq i64 %t6463, 280
  %t6477 = select i1 %t6476, i64 257, i64 1
  br label %fixmerge1511
fixslow1510:
  %t6478 = call i64 @rt_num_eq(i64 %t6463, i64 280)
  br label %fixmerge1511
fixmerge1511:
  %t6479 = phi i64 [ %t6477, %fixfast1509 ], [ %t6478, %fixslow1510 ]
  %t6480 = icmp ne i64 %t6479, 1
  br i1 %t6480, label %then1512, label %else1513
then1512:
  %t6481 = or i64 %t6434, 8
  %t6482 = and i64 %t6481, 7
  %t6483 = icmp eq i64 %t6482, 0
  br i1 %t6483, label %fixfast1515, label %fixslow1516
fixfast1515:
  %t6484 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6434, i64 8)
  %t6485 = extractvalue {i64, i1} %t6484, 0
  %t6486 = extractvalue {i64, i1} %t6484, 1
  br i1 %t6486, label %fixslow1516, label %fixmerge1517
fixslow1516:
  %t6487 = call i64 @rt_add(i64 %t6434, i64 8)
  br label %fixmerge1517
fixmerge1517:
  %t6488 = phi i64 [ %t6485, %fixfast1515 ], [ %t6487, %fixslow1516 ]
  %t6489 = or i64 %t6488, %a1
  %t6490 = and i64 %t6489, 7
  %t6491 = icmp eq i64 %t6490, 0
  br i1 %t6491, label %fixfast1518, label %fixslow1519
fixfast1518:
  %t6492 = icmp slt i64 %t6488, %a1
  %t6493 = select i1 %t6492, i64 257, i64 1
  br label %fixmerge1520
fixslow1519:
  %t6494 = call i64 @rt_lt(i64 %t6488, i64 %a1)
  br label %fixmerge1520
fixmerge1520:
  %t6495 = phi i64 [ %t6493, %fixfast1518 ], [ %t6494, %fixslow1519 ]
  %t6496 = icmp ne i64 %t6495, 1
  br i1 %t6496, label %then1521, label %else1522
then1521:
  %t6497 = or i64 %t6434, 8
  %t6498 = and i64 %t6497, 7
  %t6499 = icmp eq i64 %t6498, 0
  br i1 %t6499, label %fixfast1524, label %fixslow1525
fixfast1524:
  %t6500 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6434, i64 8)
  %t6501 = extractvalue {i64, i1} %t6500, 0
  %t6502 = extractvalue {i64, i1} %t6500, 1
  br i1 %t6502, label %fixslow1525, label %fixmerge1526
fixslow1525:
  %t6503 = call i64 @rt_add(i64 %t6434, i64 8)
  br label %fixmerge1526
fixmerge1526:
  %t6504 = phi i64 [ %t6501, %fixfast1524 ], [ %t6503, %fixslow1525 ]
  %t6505 = call i64 @rt_string_ref(i64 %a0, i64 %t6504)
  %t6506 = call i64 @rt_char_to_integer(i64 %t6505)
  %t6507 = or i64 %t6506, 936
  %t6508 = and i64 %t6507, 7
  %t6509 = icmp eq i64 %t6508, 0
  br i1 %t6509, label %fixfast1527, label %fixslow1528
fixfast1527:
  %t6510 = icmp eq i64 %t6506, 936
  %t6511 = select i1 %t6510, i64 257, i64 1
  br label %fixmerge1529
fixslow1528:
  %t6512 = call i64 @rt_num_eq(i64 %t6506, i64 936)
  br label %fixmerge1529
fixmerge1529:
  %t6513 = phi i64 [ %t6511, %fixfast1527 ], [ %t6512, %fixslow1528 ]
  br label %merge1523
else1522:
  br label %merge1523
merge1523:
  %t6514 = phi i64 [ %t6513, %fixmerge1529 ], [ 1, %else1522 ]
  br label %merge1514
else1513:
  br label %merge1514
merge1514:
  %t6515 = phi i64 [ %t6514, %merge1523 ], [ 1, %else1513 ]
  %t6516 = icmp ne i64 %t6515, 1
  br i1 %t6516, label %then1530, label %else1531
then1530:
  %t6517 = call i64 @rt_make_string(ptr @.str.lit.41, i64 15)
  br label %merge1532
else1531:
  %t6518 = or i64 %t6463, 280
  %t6519 = and i64 %t6518, 7
  %t6520 = icmp eq i64 %t6519, 0
  br i1 %t6520, label %fixfast1533, label %fixslow1534
fixfast1533:
  %t6521 = icmp eq i64 %t6463, 280
  %t6522 = select i1 %t6521, i64 257, i64 1
  br label %fixmerge1535
fixslow1534:
  %t6523 = call i64 @rt_num_eq(i64 %t6463, i64 280)
  br label %fixmerge1535
fixmerge1535:
  %t6524 = phi i64 [ %t6522, %fixfast1533 ], [ %t6523, %fixslow1534 ]
  %t6525 = icmp ne i64 %t6524, 1
  br i1 %t6525, label %then1536, label %else1537
then1536:
  %t6526 = call i64 @rt_make_string(ptr @.str.lit.42, i64 9)
  br label %merge1538
else1537:
  %t6527 = call i64 @rt_make_string(ptr @.str.lit.43, i64 6)
  br label %merge1538
merge1538:
  %t6528 = phi i64 [ %t6526, %then1536 ], [ %t6527, %else1537 ]
  br label %merge1532
merge1532:
  %t6529 = phi i64 [ %t6517, %then1530 ], [ %t6528, %merge1538 ]
  br label %merge1508
merge1508:
  %t6530 = phi i64 [ %t6472, %then1506 ], [ %t6529, %merge1532 ]
  %t6531 = call i64 @rt_string_append(i64 %t6461, i64 %t6530)
  %t6532 = call i64 @rt_make_string(ptr @.str.lit.44, i64 16)
  %t6533 = call i64 @rt_string_append(i64 %t6531, i64 %t6532)
  %t6534 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t6534)
  %t6535 = and i64 %t6534, -8
  %t6536 = inttoptr i64 %t6535 to ptr
  %t6537 = load i64, ptr %t6536
  %t6538 = inttoptr i64 %t6537 to ptr
  %t6539 = musttail call fastcc i64 %t6538(i64 %t6534, i64 3, i64 %t6460, i64 %t6533, i64 %t6434, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6539
else1502:
  %t6540 = call i64 @rt_intern(ptr @.str.sym.45)
  %t6541 = call i64 @rt_eq_p(i64 %t6431, i64 %t6540)
  %t6542 = icmp ne i64 %t6541, 1
  br i1 %t6542, label %then1539, label %else1540
then1539:
  %t6543 = call i64 @rt_intern(ptr @.str.sym.12)
  %t6544 = call i64 @rt_make_string(ptr @.str.lit.46, i64 37)
  %t6545 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t6545)
  %t6546 = and i64 %t6545, -8
  %t6547 = inttoptr i64 %t6546 to ptr
  %t6548 = load i64, ptr %t6547
  %t6549 = inttoptr i64 %t6548 to ptr
  %t6550 = musttail call fastcc i64 %t6549(i64 %t6545, i64 3, i64 %t6543, i64 %t6544, i64 %t6434, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6550
else1540:
  %t6551 = call i64 @rt_intern(ptr @.str.sym.47)
  %t6552 = call i64 @rt_eq_p(i64 %t6431, i64 %t6551)
  %t6553 = icmp ne i64 %t6552, 1
  br i1 %t6553, label %then1541, label %else1542
then1541:
  %t6554 = call i64 @rt_intern(ptr @.str.sym.12)
  %t6555 = call i64 @rt_make_string(ptr @.str.lit.48, i64 22)
  %t6556 = load i64, ptr @"emit.internal:rd-token-at"
  %t6557 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t6556, i64 3, i64 %a0, i64 %a1, i64 %t6434, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6558 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t6558)
  %t6559 = and i64 %t6558, -8
  %t6560 = inttoptr i64 %t6559 to ptr
  %t6561 = load i64, ptr %t6560
  %t6562 = inttoptr i64 %t6561 to ptr
  %t6563 = musttail call fastcc i64 %t6562(i64 %t6558, i64 3, i64 %t6554, i64 %t6555, i64 %t6557, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6563
else1542:
  %t6564 = call i64 @rt_intern(ptr @.str.sym.49)
  %t6565 = call i64 @rt_eq_p(i64 %t6431, i64 %t6564)
  %t6566 = icmp ne i64 %t6565, 1
  br i1 %t6566, label %then1543, label %else1544
then1543:
  %t6567 = call i64 @rt_intern(ptr @.str.sym.12)
  %t6568 = call i64 @rt_make_string(ptr @.str.lit.50, i64 44)
  %t6569 = load i64, ptr @"emit.internal:rd-token-at"
  %t6570 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t6569, i64 3, i64 %a0, i64 %a1, i64 %t6434, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6571 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t6571)
  %t6572 = and i64 %t6571, -8
  %t6573 = inttoptr i64 %t6572 to ptr
  %t6574 = load i64, ptr %t6573
  %t6575 = inttoptr i64 %t6574 to ptr
  %t6576 = musttail call fastcc i64 %t6575(i64 %t6571, i64 3, i64 %t6567, i64 %t6568, i64 %t6570, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6576
else1544:
  %t6577 = call i64 @rt_intern(ptr @.str.sym.51)
  %t6578 = call i64 @rt_eq_p(i64 %t6431, i64 %t6577)
  %t6579 = icmp ne i64 %t6578, 1
  br i1 %t6579, label %then1545, label %else1546
then1545:
  %t6580 = call i64 @rt_intern(ptr @.str.sym.12)
  %t6581 = call i64 @rt_make_string(ptr @.str.lit.52, i64 21)
  %t6582 = load i64, ptr @"emit.internal:rd-token-at"
  %t6583 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t6582, i64 3, i64 %a0, i64 %a1, i64 %t6434, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6584 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t6584)
  %t6585 = and i64 %t6584, -8
  %t6586 = inttoptr i64 %t6585 to ptr
  %t6587 = load i64, ptr %t6586
  %t6588 = inttoptr i64 %t6587 to ptr
  %t6589 = musttail call fastcc i64 %t6588(i64 %t6584, i64 3, i64 %t6580, i64 %t6581, i64 %t6583, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6589
else1546:
  %t6590 = call i64 @rt_intern(ptr @.str.sym.53)
  %t6591 = call i64 @rt_eq_p(i64 %t6431, i64 %t6590)
  %t6592 = icmp ne i64 %t6591, 1
  br i1 %t6592, label %then1547, label %else1548
then1547:
  %t6593 = call i64 @rt_intern(ptr @.str.sym.12)
  %t6594 = call i64 @rt_make_string(ptr @.str.lit.54, i64 47)
  %t6595 = load i64, ptr @"emit.internal:rd-token-at"
  %t6596 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t6595, i64 3, i64 %a0, i64 %a1, i64 %t6434, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6597 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t6597)
  %t6598 = and i64 %t6597, -8
  %t6599 = inttoptr i64 %t6598 to ptr
  %t6600 = load i64, ptr %t6599
  %t6601 = inttoptr i64 %t6600 to ptr
  %t6602 = musttail call fastcc i64 %t6601(i64 %t6597, i64 3, i64 %t6593, i64 %t6594, i64 %t6596, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6602
else1548:
  %t6603 = call i64 @rt_intern(ptr @.str.sym.55)
  %t6604 = call i64 @rt_eq_p(i64 %t6431, i64 %t6603)
  %t6605 = icmp ne i64 %t6604, 1
  br i1 %t6605, label %then1549, label %else1550
then1549:
  %t6606 = call i64 @rt_intern(ptr @.str.sym.12)
  %t6607 = call i64 @rt_make_string(ptr @.str.lit.56, i64 55)
  %t6608 = load i64, ptr @"emit.internal:rd-token-at"
  %t6609 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t6608, i64 3, i64 %a0, i64 %a1, i64 %t6434, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6610 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t6610)
  %t6611 = and i64 %t6610, -8
  %t6612 = inttoptr i64 %t6611 to ptr
  %t6613 = load i64, ptr %t6612
  %t6614 = inttoptr i64 %t6613 to ptr
  %t6615 = musttail call fastcc i64 %t6614(i64 %t6610, i64 3, i64 %t6606, i64 %t6607, i64 %t6609, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6615
else1550:
  %t6616 = call i64 @rt_intern(ptr @.str.sym.57)
  %t6617 = call i64 @rt_eq_p(i64 %t6431, i64 %t6616)
  %t6618 = icmp ne i64 %t6617, 1
  br i1 %t6618, label %then1551, label %else1552
then1551:
  %t6619 = call i64 @rt_intern(ptr @.str.sym.12)
  %t6620 = call i64 @rt_make_string(ptr @.str.lit.58, i64 21)
  %t6621 = load i64, ptr @"emit.internal:rd-token-at"
  %t6622 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t6621, i64 3, i64 %a0, i64 %a1, i64 %t6434, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6623 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t6623)
  %t6624 = and i64 %t6623, -8
  %t6625 = inttoptr i64 %t6624 to ptr
  %t6626 = load i64, ptr %t6625
  %t6627 = inttoptr i64 %t6626 to ptr
  %t6628 = musttail call fastcc i64 %t6627(i64 %t6623, i64 3, i64 %t6619, i64 %t6620, i64 %t6622, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6628
else1552:
  %t6629 = call i64 @rt_intern(ptr @.str.sym.59)
  %t6630 = call i64 @rt_eq_p(i64 %t6431, i64 %t6629)
  %t6631 = icmp ne i64 %t6630, 1
  br i1 %t6631, label %then1553, label %else1554
then1553:
  %t6632 = call i64 @rt_intern(ptr @.str.sym.12)
  %t6633 = call i64 @rt_make_string(ptr @.str.lit.60, i64 49)
  %t6634 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t6634)
  %t6635 = and i64 %t6634, -8
  %t6636 = inttoptr i64 %t6635 to ptr
  %t6637 = load i64, ptr %t6636
  %t6638 = inttoptr i64 %t6637 to ptr
  %t6639 = musttail call fastcc i64 %t6638(i64 %t6634, i64 3, i64 %t6632, i64 %t6633, i64 %t6434, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6639
else1554:
  %t6640 = call i64 @rt_intern(ptr @.str.sym.61)
  %t6641 = call i64 @rt_eq_p(i64 %t6431, i64 %t6640)
  %t6642 = icmp ne i64 %t6641, 1
  br i1 %t6642, label %then1555, label %else1556
then1555:
  %t6643 = call i64 @rt_intern(ptr @.str.sym.12)
  %t6644 = call i64 @rt_make_string(ptr @.str.lit.62, i64 23)
  %t6645 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t6645)
  %t6646 = and i64 %t6645, -8
  %t6647 = inttoptr i64 %t6646 to ptr
  %t6648 = load i64, ptr %t6647
  %t6649 = inttoptr i64 %t6648 to ptr
  %t6650 = musttail call fastcc i64 %t6649(i64 %t6645, i64 3, i64 %t6643, i64 %t6644, i64 %t6434, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6650
else1556:
  %t6651 = call i64 @rt_intern(ptr @.str.sym.63)
  %t6652 = call i64 @rt_eq_p(i64 %t6431, i64 %t6651)
  %t6653 = icmp ne i64 %t6652, 1
  br i1 %t6653, label %then1557, label %else1558
then1557:
  %t6654 = call i64 @rt_intern(ptr @.str.sym.12)
  %t6655 = call i64 @rt_make_string(ptr @.str.lit.64, i64 56)
  %t6656 = call i64 @rt_make_string(ptr @.str.lit.65, i64 38)
  %t6657 = call i64 @rt_string_append(i64 %t6655, i64 %t6656)
  %t6658 = load i64, ptr @"emit.internal:rd-token-at"
  %t6659 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t6658, i64 3, i64 %a0, i64 %a1, i64 %t6434, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6660 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t6660)
  %t6661 = and i64 %t6660, -8
  %t6662 = inttoptr i64 %t6661 to ptr
  %t6663 = load i64, ptr %t6662
  %t6664 = inttoptr i64 %t6663 to ptr
  %t6665 = musttail call fastcc i64 %t6664(i64 %t6660, i64 3, i64 %t6654, i64 %t6657, i64 %t6659, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6665
else1558:
  %t6666 = call i64 @rt_intern(ptr @.str.sym.12)
  %t6667 = call i64 @rt_make_string(ptr @.str.lit.66, i64 19)
  %t6668 = load i64, ptr @"emit.internal:rd-token-at"
  %t6669 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t6668, i64 3, i64 %a0, i64 %a1, i64 %t6434, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6670 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t6670)
  %t6671 = and i64 %t6670, -8
  %t6672 = inttoptr i64 %t6671 to ptr
  %t6673 = load i64, ptr %t6672
  %t6674 = inttoptr i64 %t6673 to ptr
  %t6675 = musttail call fastcc i64 %t6674(i64 %t6670, i64 3, i64 %t6666, i64 %t6667, i64 %t6669, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6675
}

define fastcc i64 @"scheme.base:code:read-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6680 = icmp eq i64 %argc, 1
  br i1 %t6680, label %argok1560, label %arityerr1559
arityerr1559:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1560:
  %t6681 = call i64 @rt_string_length(i64 %a0)
  %t6682 = load i64, ptr @"emit.internal:rd-state"
  %t6683 = call fastcc i64 @"emit.internal:code:rd-state"(i64 %t6682, i64 1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6684 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t6685 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t6684, i64 4, i64 %a0, i64 %t6681, i64 0, i64 %t6683, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6686 = load i64, ptr @"emit.internal:rd-datum"
  %t6687 = call fastcc i64 @"emit.internal:code:rd-datum"(i64 %t6686, i64 4, i64 %a0, i64 %t6681, i64 %t6685, i64 %t6683, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6688 = load i64, ptr @"emit.internal:rd-finish"
  %t6689 = call fastcc i64 @"emit.internal:code:rd-finish"(i64 %t6688, i64 2, i64 %t6683, i64 %t6687, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6690 = call i64 @rt_cdr(i64 %t6689)
  %t6691 = load i64, ptr @"emit.internal:rd-fail?"
  %t6692 = call fastcc i64 @"emit.internal:code:rd-fail?"(i64 %t6691, i64 1, i64 %t6690, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6693 = icmp ne i64 %t6692, 1
  br i1 %t6693, label %then1561, label %else1562
then1561:
  %t6694 = load i64, ptr @"scheme.base:rd-report"
  call void @rt_check_callable(i64 %t6694)
  %t6695 = and i64 %t6694, -8
  %t6696 = inttoptr i64 %t6695 to ptr
  %t6697 = load i64, ptr %t6696
  %t6698 = inttoptr i64 %t6697 to ptr
  %t6699 = musttail call fastcc i64 %t6698(i64 %t6694, i64 3, i64 %a0, i64 %t6681, i64 %t6689, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6699
else1562:
  %t6700 = call i64 @rt_car(i64 %t6689)
  ret i64 %t6700
}

define fastcc i64 @"scheme.base:code:read-all-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6705 = icmp eq i64 %argc, 1
  br i1 %t6705, label %argok1564, label %arityerr1563
arityerr1563:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1564:
  %t6706 = load i64, ptr @"scheme.base:rd-all"
  call void @rt_check_callable(i64 %t6706)
  %t6707 = and i64 %t6706, -8
  %t6708 = inttoptr i64 %t6707 to ptr
  %t6709 = load i64, ptr %t6708
  %t6710 = inttoptr i64 %t6709 to ptr
  %t6711 = musttail call fastcc i64 %t6710(i64 %t6706, i64 2, i64 %a0, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6711
}

define fastcc i64 @"scheme.base:code:read-all-from-string-ci"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6716 = icmp eq i64 %argc, 1
  br i1 %t6716, label %argok1566, label %arityerr1565
arityerr1565:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1566:
  %t6717 = load i64, ptr @"scheme.base:rd-all"
  call void @rt_check_callable(i64 %t6717)
  %t6718 = and i64 %t6717, -8
  %t6719 = inttoptr i64 %t6718 to ptr
  %t6720 = load i64, ptr %t6719
  %t6721 = inttoptr i64 %t6720 to ptr
  %t6722 = musttail call fastcc i64 %t6721(i64 %t6717, i64 2, i64 %a0, i64 257, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6722
}

define fastcc i64 @"scheme.base:code_1325"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6727 = icmp eq i64 %argc, 2
  br i1 %t6727, label %argok1568, label %arityerr1567
arityerr1567:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1568:
  %t6728 = load i64, ptr @"emit.internal:rd-fail?"
  %t6729 = call fastcc i64 @"emit.internal:code:rd-fail?"(i64 %t6728, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6730 = icmp ne i64 %t6729, 1
  br i1 %t6730, label %then1569, label %else1570
then1569:
  %t6731 = and i64 %self, -8
  %t6732 = inttoptr i64 %t6731 to ptr
  %t6733 = getelementptr i64, ptr %t6732, i64 1
  %t6734 = load i64, ptr %t6733
  %t6735 = and i64 %self, -8
  %t6736 = inttoptr i64 %t6735 to ptr
  %t6737 = getelementptr i64, ptr %t6736, i64 2
  %t6738 = load i64, ptr %t6737
  %t6739 = call i64 @rt_intern(ptr @.str.sym.34)
  %t6740 = call i64 @rt_cons(i64 %t6739, i64 %a0)
  %t6741 = load i64, ptr @"scheme.base:rd-report"
  call void @rt_check_callable(i64 %t6741)
  %t6742 = and i64 %t6741, -8
  %t6743 = inttoptr i64 %t6742 to ptr
  %t6744 = load i64, ptr %t6743
  %t6745 = inttoptr i64 %t6744 to ptr
  %t6746 = musttail call fastcc i64 %t6745(i64 %t6741, i64 3, i64 %t6734, i64 %t6738, i64 %t6740, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6746
else1570:
  %t6747 = and i64 %self, -8
  %t6748 = inttoptr i64 %t6747 to ptr
  %t6749 = getelementptr i64, ptr %t6748, i64 2
  %t6750 = load i64, ptr %t6749
  %t6751 = or i64 %a0, %t6750
  %t6752 = and i64 %t6751, 7
  %t6753 = icmp eq i64 %t6752, 0
  br i1 %t6753, label %fixfast1571, label %fixslow1572
fixfast1571:
  %t6754 = icmp slt i64 %a0, %t6750
  %t6755 = select i1 %t6754, i64 257, i64 1
  br label %fixmerge1573
fixslow1572:
  %t6756 = call i64 @rt_lt(i64 %a0, i64 %t6750)
  br label %fixmerge1573
fixmerge1573:
  %t6757 = phi i64 [ %t6755, %fixfast1571 ], [ %t6756, %fixslow1572 ]
  %t6758 = icmp ne i64 %t6757, 1
  br i1 %t6758, label %then1574, label %else1575
then1574:
  %t6759 = and i64 %self, -8
  %t6760 = inttoptr i64 %t6759 to ptr
  %t6761 = getelementptr i64, ptr %t6760, i64 3
  %t6762 = load i64, ptr %t6761
  %t6763 = load i64, ptr @"emit.internal:rd-state-child"
  %t6764 = call fastcc i64 @"emit.internal:code:rd-state-child"(i64 %t6763, i64 1, i64 %t6762, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6765 = and i64 %self, -8
  %t6766 = inttoptr i64 %t6765 to ptr
  %t6767 = getelementptr i64, ptr %t6766, i64 1
  %t6768 = load i64, ptr %t6767
  %t6769 = and i64 %self, -8
  %t6770 = inttoptr i64 %t6769 to ptr
  %t6771 = getelementptr i64, ptr %t6770, i64 2
  %t6772 = load i64, ptr %t6771
  %t6773 = load i64, ptr @"emit.internal:rd-datum"
  %t6774 = call fastcc i64 @"emit.internal:code:rd-datum"(i64 %t6773, i64 4, i64 %t6768, i64 %t6772, i64 %a0, i64 %t6764, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6775 = load i64, ptr @"emit.internal:rd-finish"
  %t6776 = call fastcc i64 @"emit.internal:code:rd-finish"(i64 %t6775, i64 2, i64 %t6764, i64 %t6774, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6777 = call i64 @rt_cdr(i64 %t6776)
  %t6778 = load i64, ptr @"emit.internal:rd-fail?"
  %t6779 = call fastcc i64 @"emit.internal:code:rd-fail?"(i64 %t6778, i64 1, i64 %t6777, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6780 = icmp ne i64 %t6779, 1
  br i1 %t6780, label %then1576, label %else1577
then1576:
  %t6781 = and i64 %self, -8
  %t6782 = inttoptr i64 %t6781 to ptr
  %t6783 = getelementptr i64, ptr %t6782, i64 1
  %t6784 = load i64, ptr %t6783
  %t6785 = and i64 %self, -8
  %t6786 = inttoptr i64 %t6785 to ptr
  %t6787 = getelementptr i64, ptr %t6786, i64 2
  %t6788 = load i64, ptr %t6787
  %t6789 = load i64, ptr @"scheme.base:rd-report"
  call void @rt_check_callable(i64 %t6789)
  %t6790 = and i64 %t6789, -8
  %t6791 = inttoptr i64 %t6790 to ptr
  %t6792 = load i64, ptr %t6791
  %t6793 = inttoptr i64 %t6792 to ptr
  %t6794 = musttail call fastcc i64 %t6793(i64 %t6789, i64 3, i64 %t6784, i64 %t6788, i64 %t6776, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6794
else1577:
  %t6795 = and i64 %self, -8
  %t6796 = inttoptr i64 %t6795 to ptr
  %t6797 = getelementptr i64, ptr %t6796, i64 1
  %t6798 = load i64, ptr %t6797
  %t6799 = and i64 %self, -8
  %t6800 = inttoptr i64 %t6799 to ptr
  %t6801 = getelementptr i64, ptr %t6800, i64 2
  %t6802 = load i64, ptr %t6801
  %t6803 = call i64 @rt_cdr(i64 %t6776)
  %t6804 = and i64 %self, -8
  %t6805 = inttoptr i64 %t6804 to ptr
  %t6806 = getelementptr i64, ptr %t6805, i64 3
  %t6807 = load i64, ptr %t6806
  %t6808 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t6809 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t6808, i64 4, i64 %t6798, i64 %t6802, i64 %t6803, i64 %t6807, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6810 = call i64 @rt_car(i64 %t6776)
  %t6811 = call i64 @rt_cons(i64 %t6810, i64 %a1)
  %t6812 = musttail call fastcc i64 @"scheme.base:code_1325"(i64 %self, i64 2, i64 %t6809, i64 %t6811, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6812
else1575:
  %t6813 = load i64, ptr @"scheme.base:reverse"
  call void @rt_check_callable(i64 %t6813)
  %t6814 = and i64 %t6813, -8
  %t6815 = inttoptr i64 %t6814 to ptr
  %t6816 = load i64, ptr %t6815
  %t6817 = inttoptr i64 %t6816 to ptr
  %t6818 = musttail call fastcc i64 %t6817(i64 %t6813, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6818
}

define fastcc i64 @"scheme.base:code:rd-all"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6819 = icmp eq i64 %argc, 2
  br i1 %t6819, label %argok1579, label %arityerr1578
arityerr1578:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1579:
  %t6820 = call i64 @rt_string_length(i64 %a0)
  %t6821 = load i64, ptr @"emit.internal:rd-state"
  %t6822 = call fastcc i64 @"emit.internal:code:rd-state"(i64 %t6821, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6823 = call ptr @rt_alloc_words(i64 5)
  %t6824 = ptrtoint ptr %t6823 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1325" to i64), ptr %t6823
  %t6825 = or i64 %t6824, 4
  %t6826 = getelementptr i64, ptr %t6823, i64 1
  store i64 %a0, ptr %t6826
  %t6827 = getelementptr i64, ptr %t6823, i64 2
  store i64 %t6820, ptr %t6827
  %t6828 = getelementptr i64, ptr %t6823, i64 3
  store i64 %t6822, ptr %t6828
  %t6829 = getelementptr i64, ptr %t6823, i64 4
  store i64 %t6825, ptr %t6829
  %t6830 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t6831 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t6830, i64 4, i64 %a0, i64 %t6820, i64 0, i64 %t6822, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6832 = musttail call fastcc i64 @"scheme.base:code_1325"(i64 %t6825, i64 2, i64 %t6831, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6832
}

define fastcc i64 @"scheme.base:code:port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6837 = icmp eq i64 %argc, 1
  br i1 %t6837, label %argok1581, label %arityerr1580
arityerr1580:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1581:
  %t6838 = load i64, ptr @"emit.internal:%port-rtd"
  %t6839 = call fastcc i64 @"emit.internal:code:%port-rtd"(i64 %t6838, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6840 = call i64 @rt_record_of_type_p(i64 %a0, i64 %t6839)
  ret i64 %t6840
}

define fastcc i64 @"scheme.base:code:input-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6845 = icmp eq i64 %argc, 1
  br i1 %t6845, label %argok1583, label %arityerr1582
arityerr1582:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1583:
  %t6846 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t6846)
  %t6847 = and i64 %t6846, -8
  %t6848 = inttoptr i64 %t6847 to ptr
  %t6849 = load i64, ptr %t6848
  %t6850 = inttoptr i64 %t6849 to ptr
  %t6851 = call fastcc i64%t6850(i64 %t6846, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6852 = icmp ne i64 %t6851, 1
  br i1 %t6852, label %then1584, label %else1585
then1584:
  %t6853 = call i64 @rt_record_ref(i64 %a0, i64 8)
  ret i64 %t6853
else1585:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6858 = icmp eq i64 %argc, 1
  br i1 %t6858, label %argok1587, label %arityerr1586
arityerr1586:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1587:
  %t6859 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t6859)
  %t6860 = and i64 %t6859, -8
  %t6861 = inttoptr i64 %t6860 to ptr
  %t6862 = load i64, ptr %t6861
  %t6863 = inttoptr i64 %t6862 to ptr
  %t6864 = call fastcc i64%t6863(i64 %t6859, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6865 = icmp ne i64 %t6864, 1
  br i1 %t6865, label %then1588, label %else1589
then1588:
  %t6866 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t6867 = call i64 @rt_not(i64 %t6866)
  ret i64 %t6867
else1589:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:textual-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6872 = icmp eq i64 %argc, 1
  br i1 %t6872, label %argok1591, label %arityerr1590
arityerr1590:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1591:
  %t6873 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t6873)
  %t6874 = and i64 %t6873, -8
  %t6875 = inttoptr i64 %t6874 to ptr
  %t6876 = load i64, ptr %t6875
  %t6877 = inttoptr i64 %t6876 to ptr
  %t6878 = musttail call fastcc i64 %t6877(i64 %t6873, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6878
}

define fastcc i64 @"scheme.base:code:port-closed?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6883 = icmp eq i64 %argc, 1
  br i1 %t6883, label %argok1593, label %arityerr1592
arityerr1592:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1593:
  %t6884 = call i64 @rt_record_ref(i64 %a0, i64 40)
  ret i64 %t6884
}

define fastcc i64 @"scheme.base:code:input-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6889 = icmp eq i64 %argc, 1
  br i1 %t6889, label %argok1595, label %arityerr1594
arityerr1594:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1595:
  %t6890 = load i64, ptr @"scheme.base:input-port?"
  call void @rt_check_callable(i64 %t6890)
  %t6891 = and i64 %t6890, -8
  %t6892 = inttoptr i64 %t6891 to ptr
  %t6893 = load i64, ptr %t6892
  %t6894 = inttoptr i64 %t6893 to ptr
  %t6895 = call fastcc i64%t6894(i64 %t6890, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6896 = icmp ne i64 %t6895, 1
  br i1 %t6896, label %then1596, label %else1597
then1596:
  %t6897 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t6898 = call i64 @rt_not(i64 %t6897)
  ret i64 %t6898
else1597:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6903 = icmp eq i64 %argc, 1
  br i1 %t6903, label %argok1599, label %arityerr1598
arityerr1598:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1599:
  %t6904 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t6904)
  %t6905 = and i64 %t6904, -8
  %t6906 = inttoptr i64 %t6905 to ptr
  %t6907 = load i64, ptr %t6906
  %t6908 = inttoptr i64 %t6907 to ptr
  %t6909 = call fastcc i64%t6908(i64 %t6904, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6910 = icmp ne i64 %t6909, 1
  br i1 %t6910, label %then1600, label %else1601
then1600:
  %t6911 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t6912 = call i64 @rt_not(i64 %t6911)
  ret i64 %t6912
else1601:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%check-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6917 = icmp eq i64 %argc, 2
  br i1 %t6917, label %argok1603, label %arityerr1602
arityerr1602:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1603:
  %t6918 = load i64, ptr @"scheme.base:input-port?"
  call void @rt_check_callable(i64 %t6918)
  %t6919 = and i64 %t6918, -8
  %t6920 = inttoptr i64 %t6919 to ptr
  %t6921 = load i64, ptr %t6920
  %t6922 = inttoptr i64 %t6921 to ptr
  %t6923 = call fastcc i64%t6922(i64 %t6918, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6924 = call i64 @rt_not(i64 %t6923)
  %t6925 = icmp ne i64 %t6924, 1
  br i1 %t6925, label %then1604, label %else1605
then1604:
  %t6926 = call i64 @rt_make_string(ptr @.str.lit.67, i64 17)
  %t6927 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6927)
  %t6928 = and i64 %t6927, -8
  %t6929 = inttoptr i64 %t6928 to ptr
  %t6930 = load i64, ptr %t6929
  %t6931 = inttoptr i64 %t6930 to ptr
  %t6932 = musttail call fastcc i64 %t6931(i64 %t6927, i64 3, i64 %a1, i64 %t6926, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6932
else1605:
  %t6933 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t6934 = icmp ne i64 %t6933, 1
  br i1 %t6934, label %then1606, label %else1607
then1606:
  %t6935 = call i64 @rt_make_string(ptr @.str.lit.68, i64 14)
  %t6936 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6936)
  %t6937 = and i64 %t6936, -8
  %t6938 = inttoptr i64 %t6937 to ptr
  %t6939 = load i64, ptr %t6938
  %t6940 = inttoptr i64 %t6939 to ptr
  %t6941 = musttail call fastcc i64 %t6940(i64 %t6936, i64 3, i64 %a1, i64 %t6935, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6941
else1607:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:%check-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6946 = icmp eq i64 %argc, 2
  br i1 %t6946, label %argok1609, label %arityerr1608
arityerr1608:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1609:
  %t6947 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t6947)
  %t6948 = and i64 %t6947, -8
  %t6949 = inttoptr i64 %t6948 to ptr
  %t6950 = load i64, ptr %t6949
  %t6951 = inttoptr i64 %t6950 to ptr
  %t6952 = call fastcc i64%t6951(i64 %t6947, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6953 = call i64 @rt_not(i64 %t6952)
  %t6954 = icmp ne i64 %t6953, 1
  br i1 %t6954, label %then1610, label %else1611
then1610:
  %t6955 = call i64 @rt_make_string(ptr @.str.lit.69, i64 18)
  %t6956 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6956)
  %t6957 = and i64 %t6956, -8
  %t6958 = inttoptr i64 %t6957 to ptr
  %t6959 = load i64, ptr %t6958
  %t6960 = inttoptr i64 %t6959 to ptr
  %t6961 = musttail call fastcc i64 %t6960(i64 %t6956, i64 3, i64 %a1, i64 %t6955, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6961
else1611:
  %t6962 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t6963 = icmp ne i64 %t6962, 1
  br i1 %t6963, label %then1612, label %else1613
then1612:
  %t6964 = call i64 @rt_make_string(ptr @.str.lit.70, i64 14)
  %t6965 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6965)
  %t6966 = and i64 %t6965, -8
  %t6967 = inttoptr i64 %t6966 to ptr
  %t6968 = load i64, ptr %t6967
  %t6969 = inttoptr i64 %t6968 to ptr
  %t6970 = musttail call fastcc i64 %t6969(i64 %t6965, i64 3, i64 %a1, i64 %t6964, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6970
else1613:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:open-input-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6975 = icmp eq i64 %argc, 1
  br i1 %t6975, label %argok1615, label %arityerr1614
arityerr1614:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1615:
  %t6976 = load i64, ptr @"emit.internal:%make-port"
  %t6977 = musttail call fastcc i64 @"emit.internal:code:%make-port"(i64 %t6976, i64 6, i64 1, i64 257, i64 %a0, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t6977
}

define fastcc i64 @"scheme.base:code:%port-at-eof?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6982 = icmp eq i64 %argc, 1
  br i1 %t6982, label %argok1617, label %arityerr1616
arityerr1616:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1617:
  %t6983 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t6984 = load i64, ptr @"emit.internal:%port-buf"
  %t6985 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t6984, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6986 = call i64 @rt_string_length(i64 %t6985)
  %t6987 = or i64 %t6986, %t6983
  %t6988 = and i64 %t6987, 7
  %t6989 = icmp eq i64 %t6988, 0
  br i1 %t6989, label %fixfast1618, label %fixslow1619
fixfast1618:
  %t6990 = icmp slt i64 %t6986, %t6983
  %t6991 = select i1 %t6990, i64 257, i64 1
  br label %fixmerge1620
fixslow1619:
  %t6992 = call i64 @rt_lt(i64 %t6986, i64 %t6983)
  br label %fixmerge1620
fixmerge1620:
  %t6993 = phi i64 [ %t6991, %fixfast1618 ], [ %t6992, %fixslow1619 ]
  %t6994 = icmp ne i64 %t6993, 1
  br i1 %t6994, label %then1621, label %else1622
then1621:
  ret i64 257
else1622:
  %t6995 = or i64 %t6983, %t6986
  %t6996 = and i64 %t6995, 7
  %t6997 = icmp eq i64 %t6996, 0
  br i1 %t6997, label %fixfast1623, label %fixslow1624
fixfast1623:
  %t6998 = icmp eq i64 %t6983, %t6986
  %t6999 = select i1 %t6998, i64 257, i64 1
  br label %fixmerge1625
fixslow1624:
  %t7000 = call i64 @rt_num_eq(i64 %t6983, i64 %t6986)
  br label %fixmerge1625
fixmerge1625:
  %t7001 = phi i64 [ %t6999, %fixfast1623 ], [ %t7000, %fixslow1624 ]
  ret i64 %t7001
}

define fastcc i64 @"scheme.base:code:read-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7006 = icmp eq i64 %argc, 1
  br i1 %t7006, label %argok1627, label %arityerr1626
arityerr1626:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1627:
  %t7007 = call i64 @rt_intern(ptr @.str.sym.71)
  %t7008 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t7008)
  %t7009 = and i64 %t7008, -8
  %t7010 = inttoptr i64 %t7009 to ptr
  %t7011 = load i64, ptr %t7010
  %t7012 = inttoptr i64 %t7011 to ptr
  %t7013 = call fastcc i64%t7012(i64 %t7008, i64 2, i64 %a0, i64 %t7007, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7014 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t7014)
  %t7015 = and i64 %t7014, -8
  %t7016 = inttoptr i64 %t7015 to ptr
  %t7017 = load i64, ptr %t7016
  %t7018 = inttoptr i64 %t7017 to ptr
  %t7019 = call fastcc i64%t7018(i64 %t7014, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7020 = icmp ne i64 %t7019, 1
  br i1 %t7020, label %then1628, label %else1629
then1628:
  %t7021 = call i64 @rt_eof_object()
  ret i64 %t7021
else1629:
  %t7022 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t7023 = or i64 %t7022, 8
  %t7024 = and i64 %t7023, 7
  %t7025 = icmp eq i64 %t7024, 0
  br i1 %t7025, label %fixfast1630, label %fixslow1631
fixfast1630:
  %t7026 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t7022, i64 8)
  %t7027 = extractvalue {i64, i1} %t7026, 0
  %t7028 = extractvalue {i64, i1} %t7026, 1
  br i1 %t7028, label %fixslow1631, label %fixmerge1632
fixslow1631:
  %t7029 = call i64 @rt_add(i64 %t7022, i64 8)
  br label %fixmerge1632
fixmerge1632:
  %t7030 = phi i64 [ %t7027, %fixfast1630 ], [ %t7029, %fixslow1631 ]
  %t7031 = call i64 @rt_record_set(i64 %a0, i64 24, i64 %t7030)
  %t7032 = load i64, ptr @"emit.internal:%port-buf"
  %t7033 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t7032, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7034 = call i64 @rt_string_ref(i64 %t7033, i64 %t7022)
  ret i64 %t7034
}

define fastcc i64 @"scheme.base:code:peek-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7039 = icmp eq i64 %argc, 1
  br i1 %t7039, label %argok1634, label %arityerr1633
arityerr1633:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1634:
  %t7040 = call i64 @rt_intern(ptr @.str.sym.72)
  %t7041 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t7041)
  %t7042 = and i64 %t7041, -8
  %t7043 = inttoptr i64 %t7042 to ptr
  %t7044 = load i64, ptr %t7043
  %t7045 = inttoptr i64 %t7044 to ptr
  %t7046 = call fastcc i64%t7045(i64 %t7041, i64 2, i64 %a0, i64 %t7040, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7047 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t7047)
  %t7048 = and i64 %t7047, -8
  %t7049 = inttoptr i64 %t7048 to ptr
  %t7050 = load i64, ptr %t7049
  %t7051 = inttoptr i64 %t7050 to ptr
  %t7052 = call fastcc i64%t7051(i64 %t7047, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7053 = icmp ne i64 %t7052, 1
  br i1 %t7053, label %then1635, label %else1636
then1635:
  %t7054 = call i64 @rt_eof_object()
  ret i64 %t7054
else1636:
  %t7055 = load i64, ptr @"emit.internal:%port-buf"
  %t7056 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t7055, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7057 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t7058 = call i64 @rt_string_ref(i64 %t7056, i64 %t7057)
  ret i64 %t7058
}

define fastcc i64 @"scheme.base:code_1372"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7063 = icmp eq i64 %argc, 1
  br i1 %t7063, label %argok1638, label %arityerr1637
arityerr1637:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1638:
  %t7064 = and i64 %self, -8
  %t7065 = inttoptr i64 %t7064 to ptr
  %t7066 = getelementptr i64, ptr %t7065, i64 1
  %t7067 = load i64, ptr %t7066
  %t7068 = or i64 %t7067, %a0
  %t7069 = and i64 %t7068, 7
  %t7070 = icmp eq i64 %t7069, 0
  br i1 %t7070, label %fixfast1639, label %fixslow1640
fixfast1639:
  %t7071 = icmp slt i64 %t7067, %a0
  %t7072 = select i1 %t7071, i64 257, i64 1
  br label %fixmerge1641
fixslow1640:
  %t7073 = call i64 @rt_lt(i64 %t7067, i64 %a0)
  br label %fixmerge1641
fixmerge1641:
  %t7074 = phi i64 [ %t7072, %fixfast1639 ], [ %t7073, %fixslow1640 ]
  %t7075 = icmp ne i64 %t7074, 1
  br i1 %t7075, label %then1642, label %else1643
then1642:
  br label %merge1644
else1643:
  %t7076 = or i64 %a0, %t7067
  %t7077 = and i64 %t7076, 7
  %t7078 = icmp eq i64 %t7077, 0
  br i1 %t7078, label %fixfast1645, label %fixslow1646
fixfast1645:
  %t7079 = icmp eq i64 %a0, %t7067
  %t7080 = select i1 %t7079, i64 257, i64 1
  br label %fixmerge1647
fixslow1646:
  %t7081 = call i64 @rt_num_eq(i64 %a0, i64 %t7067)
  br label %fixmerge1647
fixmerge1647:
  %t7082 = phi i64 [ %t7080, %fixfast1645 ], [ %t7081, %fixslow1646 ]
  br label %merge1644
merge1644:
  %t7083 = phi i64 [ 257, %then1642 ], [ %t7082, %fixmerge1647 ]
  %t7084 = icmp ne i64 %t7083, 1
  br i1 %t7084, label %then1648, label %else1649
then1648:
  %t7085 = and i64 %self, -8
  %t7086 = inttoptr i64 %t7085 to ptr
  %t7087 = getelementptr i64, ptr %t7086, i64 2
  %t7088 = load i64, ptr %t7087
  %t7089 = call i64 @rt_record_ref(i64 %t7088, i64 24)
  %t7090 = and i64 %self, -8
  %t7091 = inttoptr i64 %t7090 to ptr
  %t7092 = getelementptr i64, ptr %t7091, i64 2
  %t7093 = load i64, ptr %t7092
  %t7094 = and i64 %self, -8
  %t7095 = inttoptr i64 %t7094 to ptr
  %t7096 = getelementptr i64, ptr %t7095, i64 1
  %t7097 = load i64, ptr %t7096
  %t7098 = call i64 @rt_record_set(i64 %t7093, i64 24, i64 %t7097)
  %t7099 = and i64 %self, -8
  %t7100 = inttoptr i64 %t7099 to ptr
  %t7101 = getelementptr i64, ptr %t7100, i64 3
  %t7102 = load i64, ptr %t7101
  %t7103 = and i64 %self, -8
  %t7104 = inttoptr i64 %t7103 to ptr
  %t7105 = getelementptr i64, ptr %t7104, i64 1
  %t7106 = load i64, ptr %t7105
  %t7107 = call i64 @rt_substring(i64 %t7102, i64 %t7089, i64 %t7106)
  ret i64 %t7107
else1649:
  %t7108 = and i64 %self, -8
  %t7109 = inttoptr i64 %t7108 to ptr
  %t7110 = getelementptr i64, ptr %t7109, i64 3
  %t7111 = load i64, ptr %t7110
  %t7112 = call i64 @rt_string_ref(i64 %t7111, i64 %a0)
  %t7113 = load i64, ptr @"scheme.base:char=?"
  call void @rt_check_callable(i64 %t7113)
  %t7114 = and i64 %t7113, -8
  %t7115 = inttoptr i64 %t7114 to ptr
  %t7116 = load i64, ptr %t7115
  %t7117 = inttoptr i64 %t7116 to ptr
  %t7118 = call fastcc i64%t7117(i64 %t7113, i64 2, i64 %t7112, i64 2569, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7119 = icmp ne i64 %t7118, 1
  br i1 %t7119, label %then1650, label %else1651
then1650:
  %t7120 = and i64 %self, -8
  %t7121 = inttoptr i64 %t7120 to ptr
  %t7122 = getelementptr i64, ptr %t7121, i64 2
  %t7123 = load i64, ptr %t7122
  %t7124 = call i64 @rt_record_ref(i64 %t7123, i64 24)
  %t7125 = and i64 %self, -8
  %t7126 = inttoptr i64 %t7125 to ptr
  %t7127 = getelementptr i64, ptr %t7126, i64 2
  %t7128 = load i64, ptr %t7127
  %t7129 = or i64 %a0, 8
  %t7130 = and i64 %t7129, 7
  %t7131 = icmp eq i64 %t7130, 0
  br i1 %t7131, label %fixfast1652, label %fixslow1653
fixfast1652:
  %t7132 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t7133 = extractvalue {i64, i1} %t7132, 0
  %t7134 = extractvalue {i64, i1} %t7132, 1
  br i1 %t7134, label %fixslow1653, label %fixmerge1654
fixslow1653:
  %t7135 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1654
fixmerge1654:
  %t7136 = phi i64 [ %t7133, %fixfast1652 ], [ %t7135, %fixslow1653 ]
  %t7137 = call i64 @rt_record_set(i64 %t7128, i64 24, i64 %t7136)
  %t7138 = and i64 %self, -8
  %t7139 = inttoptr i64 %t7138 to ptr
  %t7140 = getelementptr i64, ptr %t7139, i64 3
  %t7141 = load i64, ptr %t7140
  %t7142 = call i64 @rt_substring(i64 %t7141, i64 %t7124, i64 %a0)
  ret i64 %t7142
else1651:
  %t7143 = or i64 %a0, 8
  %t7144 = and i64 %t7143, 7
  %t7145 = icmp eq i64 %t7144, 0
  br i1 %t7145, label %fixfast1655, label %fixslow1656
fixfast1655:
  %t7146 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t7147 = extractvalue {i64, i1} %t7146, 0
  %t7148 = extractvalue {i64, i1} %t7146, 1
  br i1 %t7148, label %fixslow1656, label %fixmerge1657
fixslow1656:
  %t7149 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1657
fixmerge1657:
  %t7150 = phi i64 [ %t7147, %fixfast1655 ], [ %t7149, %fixslow1656 ]
  %t7151 = musttail call fastcc i64 @"scheme.base:code_1372"(i64 %self, i64 1, i64 %t7150, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7151
}

define fastcc i64 @"scheme.base:code:read-line"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7152 = icmp eq i64 %argc, 1
  br i1 %t7152, label %argok1659, label %arityerr1658
arityerr1658:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1659:
  %t7153 = call i64 @rt_intern(ptr @.str.sym.73)
  %t7154 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t7154)
  %t7155 = and i64 %t7154, -8
  %t7156 = inttoptr i64 %t7155 to ptr
  %t7157 = load i64, ptr %t7156
  %t7158 = inttoptr i64 %t7157 to ptr
  %t7159 = call fastcc i64%t7158(i64 %t7154, i64 2, i64 %a0, i64 %t7153, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7160 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t7160)
  %t7161 = and i64 %t7160, -8
  %t7162 = inttoptr i64 %t7161 to ptr
  %t7163 = load i64, ptr %t7162
  %t7164 = inttoptr i64 %t7163 to ptr
  %t7165 = call fastcc i64%t7164(i64 %t7160, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7166 = icmp ne i64 %t7165, 1
  br i1 %t7166, label %then1660, label %else1661
then1660:
  %t7167 = call i64 @rt_eof_object()
  ret i64 %t7167
else1661:
  %t7168 = load i64, ptr @"emit.internal:%port-buf"
  %t7169 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t7168, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7170 = call i64 @rt_string_length(i64 %t7169)
  %t7171 = call ptr @rt_alloc_words(i64 5)
  %t7172 = ptrtoint ptr %t7171 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1372" to i64), ptr %t7171
  %t7173 = or i64 %t7172, 4
  %t7174 = getelementptr i64, ptr %t7171, i64 1
  store i64 %t7170, ptr %t7174
  %t7175 = getelementptr i64, ptr %t7171, i64 2
  store i64 %a0, ptr %t7175
  %t7176 = getelementptr i64, ptr %t7171, i64 3
  store i64 %t7169, ptr %t7176
  %t7177 = getelementptr i64, ptr %t7171, i64 4
  store i64 %t7173, ptr %t7177
  %t7178 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t7179 = musttail call fastcc i64 @"scheme.base:code_1372"(i64 %t7173, i64 1, i64 %t7178, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7179
}

define fastcc i64 @"scheme.base:code:read-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7184 = icmp eq i64 %argc, 2
  br i1 %t7184, label %argok1663, label %arityerr1662
arityerr1662:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1663:
  %t7185 = call i64 @rt_intern(ptr @.str.sym.74)
  %t7186 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t7186)
  %t7187 = and i64 %t7186, -8
  %t7188 = inttoptr i64 %t7187 to ptr
  %t7189 = load i64, ptr %t7188
  %t7190 = inttoptr i64 %t7189 to ptr
  %t7191 = call fastcc i64%t7190(i64 %t7186, i64 2, i64 %a1, i64 %t7185, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7192 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t7192)
  %t7193 = and i64 %t7192, -8
  %t7194 = inttoptr i64 %t7193 to ptr
  %t7195 = load i64, ptr %t7194
  %t7196 = inttoptr i64 %t7195 to ptr
  %t7197 = call fastcc i64%t7196(i64 %t7192, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7198 = icmp ne i64 %t7197, 1
  br i1 %t7198, label %then1664, label %else1665
then1664:
  %t7199 = call i64 @rt_eof_object()
  ret i64 %t7199
else1665:
  %t7200 = load i64, ptr @"emit.internal:%port-buf"
  %t7201 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t7200, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7202 = call i64 @rt_string_length(i64 %t7201)
  %t7203 = call i64 @rt_record_ref(i64 %a1, i64 24)
  %t7204 = or i64 %t7203, %a0
  %t7205 = and i64 %t7204, 7
  %t7206 = icmp eq i64 %t7205, 0
  br i1 %t7206, label %fixfast1666, label %fixslow1667
fixfast1666:
  %t7207 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t7203, i64 %a0)
  %t7208 = extractvalue {i64, i1} %t7207, 0
  %t7209 = extractvalue {i64, i1} %t7207, 1
  br i1 %t7209, label %fixslow1667, label %fixmerge1668
fixslow1667:
  %t7210 = call i64 @rt_add(i64 %t7203, i64 %a0)
  br label %fixmerge1668
fixmerge1668:
  %t7211 = phi i64 [ %t7208, %fixfast1666 ], [ %t7210, %fixslow1667 ]
  %t7212 = or i64 %t7202, %t7211
  %t7213 = and i64 %t7212, 7
  %t7214 = icmp eq i64 %t7213, 0
  br i1 %t7214, label %fixfast1669, label %fixslow1670
fixfast1669:
  %t7215 = icmp slt i64 %t7202, %t7211
  %t7216 = select i1 %t7215, i64 257, i64 1
  br label %fixmerge1671
fixslow1670:
  %t7217 = call i64 @rt_lt(i64 %t7202, i64 %t7211)
  br label %fixmerge1671
fixmerge1671:
  %t7218 = phi i64 [ %t7216, %fixfast1669 ], [ %t7217, %fixslow1670 ]
  %t7219 = icmp ne i64 %t7218, 1
  br i1 %t7219, label %then1672, label %else1673
then1672:
  br label %merge1674
else1673:
  %t7220 = or i64 %t7203, %a0
  %t7221 = and i64 %t7220, 7
  %t7222 = icmp eq i64 %t7221, 0
  br i1 %t7222, label %fixfast1675, label %fixslow1676
fixfast1675:
  %t7223 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t7203, i64 %a0)
  %t7224 = extractvalue {i64, i1} %t7223, 0
  %t7225 = extractvalue {i64, i1} %t7223, 1
  br i1 %t7225, label %fixslow1676, label %fixmerge1677
fixslow1676:
  %t7226 = call i64 @rt_add(i64 %t7203, i64 %a0)
  br label %fixmerge1677
fixmerge1677:
  %t7227 = phi i64 [ %t7224, %fixfast1675 ], [ %t7226, %fixslow1676 ]
  br label %merge1674
merge1674:
  %t7228 = phi i64 [ %t7202, %then1672 ], [ %t7227, %fixmerge1677 ]
  %t7229 = call i64 @rt_record_set(i64 %a1, i64 24, i64 %t7228)
  %t7230 = call i64 @rt_substring(i64 %t7201, i64 %t7203, i64 %t7228)
  ret i64 %t7230
}

define fastcc i64 @"scheme.base:code:open-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7235 = icmp eq i64 %argc, 0
  br i1 %t7235, label %argok1679, label %arityerr1678
arityerr1678:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1679:
  %t7236 = call i64 @rt_port_open_output_string()
  %t7237 = icmp ne i64 %t7236, 1
  br i1 %t7237, label %then1680, label %else1681
then1680:
  %t7238 = load i64, ptr @"emit.internal:%make-port"
  %t7239 = musttail call fastcc i64 @"emit.internal:code:%make-port"(i64 %t7238, i64 6, i64 %t7236, i64 1, i64 1, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t7239
else1681:
  %t7240 = call i64 @rt_intern(ptr @.str.sym.75)
  %t7241 = call i64 @rt_make_string(ptr @.str.lit.76, i64 33)
  %t7242 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t7242)
  %t7243 = and i64 %t7242, -8
  %t7244 = inttoptr i64 %t7243 to ptr
  %t7245 = load i64, ptr %t7244
  %t7246 = inttoptr i64 %t7245 to ptr
  %t7247 = musttail call fastcc i64 %t7246(i64 %t7242, i64 2, i64 %t7240, i64 %t7241, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7247
}

define fastcc i64 @"scheme.base:code:get-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7252 = icmp eq i64 %argc, 1
  br i1 %t7252, label %argok1683, label %arityerr1682
arityerr1682:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1683:
  %t7253 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t7253)
  %t7254 = and i64 %t7253, -8
  %t7255 = inttoptr i64 %t7254 to ptr
  %t7256 = load i64, ptr %t7255
  %t7257 = inttoptr i64 %t7256 to ptr
  %t7258 = call fastcc i64%t7257(i64 %t7253, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7259 = call i64 @rt_not(i64 %t7258)
  %t7260 = icmp ne i64 %t7259, 1
  br i1 %t7260, label %then1684, label %else1685
then1684:
  %t7261 = call i64 @rt_intern(ptr @.str.sym.77)
  %t7262 = call i64 @rt_make_string(ptr @.str.lit.78, i64 18)
  %t7263 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t7263)
  %t7264 = and i64 %t7263, -8
  %t7265 = inttoptr i64 %t7264 to ptr
  %t7266 = load i64, ptr %t7265
  %t7267 = inttoptr i64 %t7266 to ptr
  %t7268 = musttail call fastcc i64 %t7267(i64 %t7263, i64 3, i64 %t7261, i64 %t7262, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7268
else1685:
  %t7269 = call i64 @rt_record_ref(i64 %a0, i64 32)
  %t7270 = call i64 @rt_not(i64 %t7269)
  %t7271 = icmp ne i64 %t7270, 1
  br i1 %t7271, label %then1686, label %else1687
then1686:
  %t7272 = call i64 @rt_intern(ptr @.str.sym.77)
  %t7273 = call i64 @rt_make_string(ptr @.str.lit.79, i64 17)
  %t7274 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t7274)
  %t7275 = and i64 %t7274, -8
  %t7276 = inttoptr i64 %t7275 to ptr
  %t7277 = load i64, ptr %t7276
  %t7278 = inttoptr i64 %t7277 to ptr
  %t7279 = musttail call fastcc i64 %t7278(i64 %t7274, i64 3, i64 %t7272, i64 %t7273, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7279
else1687:
  %t7280 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t7281 = call i64 @rt_port_get_output_string(i64 %t7280)
  ret i64 %t7281
}

define fastcc i64 @"scheme.base:code:flush-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7286 = icmp eq i64 %argc, 1
  br i1 %t7286, label %argok1689, label %arityerr1688
arityerr1688:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1689:
  %t7287 = call i64 @rt_intern(ptr @.str.sym.80)
  %t7288 = load i64, ptr @"scheme.base:%check-output-port"
  call void @rt_check_callable(i64 %t7288)
  %t7289 = and i64 %t7288, -8
  %t7290 = inttoptr i64 %t7289 to ptr
  %t7291 = load i64, ptr %t7290
  %t7292 = inttoptr i64 %t7291 to ptr
  %t7293 = call fastcc i64%t7292(i64 %t7288, i64 2, i64 %a0, i64 %t7287, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7294 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t7295 = call i64 @rt_port_flush(i64 %t7294)
  ret i64 %t7295
}

define fastcc i64 @"scheme.base:code:close-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7300 = icmp eq i64 %argc, 1
  br i1 %t7300, label %argok1691, label %arityerr1690
arityerr1690:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1691:
  %t7301 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t7301)
  %t7302 = and i64 %t7301, -8
  %t7303 = inttoptr i64 %t7302 to ptr
  %t7304 = load i64, ptr %t7303
  %t7305 = inttoptr i64 %t7304 to ptr
  %t7306 = call fastcc i64%t7305(i64 %t7301, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7307 = call i64 @rt_not(i64 %t7306)
  %t7308 = icmp ne i64 %t7307, 1
  br i1 %t7308, label %then1692, label %else1693
then1692:
  %t7309 = call i64 @rt_intern(ptr @.str.sym.81)
  %t7310 = call i64 @rt_make_string(ptr @.str.lit.82, i64 10)
  %t7311 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t7311)
  %t7312 = and i64 %t7311, -8
  %t7313 = inttoptr i64 %t7312 to ptr
  %t7314 = load i64, ptr %t7313
  %t7315 = inttoptr i64 %t7314 to ptr
  %t7316 = musttail call fastcc i64 %t7315(i64 %t7311, i64 3, i64 %t7309, i64 %t7310, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7316
else1693:
  %t7317 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t7318 = icmp ne i64 %t7317, 1
  br i1 %t7318, label %then1694, label %else1695
then1694:
  %t7319 = icmp ne i64 1, 1
  br i1 %t7319, label %then1696, label %else1697
then1696:
  ret i64 1
else1697:
  ret i64 17
else1695:
  %t7320 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t7321 = call i64 @rt_not(i64 %t7320)
  %t7322 = icmp ne i64 %t7321, 1
  br i1 %t7322, label %then1698, label %else1699
then1698:
  %t7323 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t7324 = call i64 @rt_port_close(i64 %t7323)
  br label %merge1700
else1699:
  br label %merge1700
merge1700:
  %t7325 = phi i64 [ %t7324, %then1698 ], [ 17, %else1699 ]
  %t7326 = call i64 @rt_record_set(i64 %a0, i64 40, i64 257)
  %t7327 = icmp ne i64 1, 1
  br i1 %t7327, label %then1701, label %else1702
then1701:
  ret i64 1
else1702:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:close-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7332 = icmp eq i64 %argc, 1
  br i1 %t7332, label %argok1704, label %arityerr1703
arityerr1703:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1704:
  %t7333 = load i64, ptr @"scheme.base:input-port?"
  call void @rt_check_callable(i64 %t7333)
  %t7334 = and i64 %t7333, -8
  %t7335 = inttoptr i64 %t7334 to ptr
  %t7336 = load i64, ptr %t7335
  %t7337 = inttoptr i64 %t7336 to ptr
  %t7338 = call fastcc i64%t7337(i64 %t7333, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7339 = icmp ne i64 %t7338, 1
  br i1 %t7339, label %then1705, label %else1706
then1705:
  %t7340 = load i64, ptr @"scheme.base:close-port"
  call void @rt_check_callable(i64 %t7340)
  %t7341 = and i64 %t7340, -8
  %t7342 = inttoptr i64 %t7341 to ptr
  %t7343 = load i64, ptr %t7342
  %t7344 = inttoptr i64 %t7343 to ptr
  %t7345 = musttail call fastcc i64 %t7344(i64 %t7340, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7345
else1706:
  %t7346 = call i64 @rt_intern(ptr @.str.sym.83)
  %t7347 = call i64 @rt_make_string(ptr @.str.lit.84, i64 17)
  %t7348 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t7348)
  %t7349 = and i64 %t7348, -8
  %t7350 = inttoptr i64 %t7349 to ptr
  %t7351 = load i64, ptr %t7350
  %t7352 = inttoptr i64 %t7351 to ptr
  %t7353 = musttail call fastcc i64 %t7352(i64 %t7348, i64 3, i64 %t7346, i64 %t7347, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7353
}

define fastcc i64 @"scheme.base:code:close-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7358 = icmp eq i64 %argc, 1
  br i1 %t7358, label %argok1708, label %arityerr1707
arityerr1707:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1708:
  %t7359 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t7359)
  %t7360 = and i64 %t7359, -8
  %t7361 = inttoptr i64 %t7360 to ptr
  %t7362 = load i64, ptr %t7361
  %t7363 = inttoptr i64 %t7362 to ptr
  %t7364 = call fastcc i64%t7363(i64 %t7359, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7365 = icmp ne i64 %t7364, 1
  br i1 %t7365, label %then1709, label %else1710
then1709:
  %t7366 = load i64, ptr @"scheme.base:close-port"
  call void @rt_check_callable(i64 %t7366)
  %t7367 = and i64 %t7366, -8
  %t7368 = inttoptr i64 %t7367 to ptr
  %t7369 = load i64, ptr %t7368
  %t7370 = inttoptr i64 %t7369 to ptr
  %t7371 = musttail call fastcc i64 %t7370(i64 %t7366, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7371
else1710:
  %t7372 = call i64 @rt_intern(ptr @.str.sym.85)
  %t7373 = call i64 @rt_make_string(ptr @.str.lit.86, i64 18)
  %t7374 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t7374)
  %t7375 = and i64 %t7374, -8
  %t7376 = inttoptr i64 %t7375 to ptr
  %t7377 = load i64, ptr %t7376
  %t7378 = inttoptr i64 %t7377 to ptr
  %t7379 = musttail call fastcc i64 %t7378(i64 %t7374, i64 3, i64 %t7372, i64 %t7373, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7379
}

define fastcc i64 @"scheme.base:code:current-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7387 = icmp sge i64 %argc, 0
  br i1 %t7387, label %argok1712, label %arityerr1711
arityerr1711:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1712:
  %t7388 = call ptr @rt_alloc_words(i64 8)
  %t7389 = getelementptr i64, ptr %t7388, i64 0
  store i64 %a0, ptr %t7389
  %t7390 = getelementptr i64, ptr %t7388, i64 1
  store i64 %a1, ptr %t7390
  %t7391 = getelementptr i64, ptr %t7388, i64 2
  store i64 %a2, ptr %t7391
  %t7392 = getelementptr i64, ptr %t7388, i64 3
  store i64 %a3, ptr %t7392
  %t7393 = getelementptr i64, ptr %t7388, i64 4
  store i64 %a4, ptr %t7393
  %t7394 = getelementptr i64, ptr %t7388, i64 5
  store i64 %a5, ptr %t7394
  %t7395 = getelementptr i64, ptr %t7388, i64 6
  store i64 %a6, ptr %t7395
  %t7396 = getelementptr i64, ptr %t7388, i64 7
  store i64 %a7, ptr %t7396
  %t7397 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t7388, ptr %overflow)
  %t7398 = call i64 @rt_null_p(i64 %t7397)
  %t7399 = icmp ne i64 %t7398, 1
  br i1 %t7399, label %then1713, label %else1714
then1713:
  %t7400 = load i64, ptr @"scheme.base:%stdout-port"
  %t7401 = call i64 @rt_not(i64 %t7400)
  %t7402 = icmp ne i64 %t7401, 1
  br i1 %t7402, label %then1715, label %else1716
then1715:
  %t7403 = load i64, ptr @"emit.internal:%make-port"
  %t7404 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t7403, i64 6, i64 0, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t7405 = call i64 @rt_root(i64 %t7404)
  store i64 %t7405, ptr @"scheme.base:%stdout-port"
  %t7406 = call i64 @rt_set_current_output(i64 0)
  br label %merge1717
else1716:
  br label %merge1717
merge1717:
  %t7407 = phi i64 [ %t7406, %then1715 ], [ 17, %else1716 ]
  %t7408 = load i64, ptr @"scheme.base:%stdout-port"
  ret i64 %t7408
else1714:
  %t7409 = call i64 @rt_car(i64 %t7397)
  %t7410 = call i64 @rt_root(i64 %t7409)
  store i64 %t7410, ptr @"scheme.base:%stdout-port"
  %t7411 = call i64 @rt_record_ref(i64 %t7409, i64 0)
  %t7412 = call i64 @rt_set_current_output(i64 %t7411)
  %t7413 = icmp ne i64 1, 1
  br i1 %t7413, label %then1718, label %else1719
then1718:
  ret i64 1
else1719:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-error-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7418 = icmp sge i64 %argc, 0
  br i1 %t7418, label %argok1721, label %arityerr1720
arityerr1720:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1721:
  %t7419 = call ptr @rt_alloc_words(i64 8)
  %t7420 = getelementptr i64, ptr %t7419, i64 0
  store i64 %a0, ptr %t7420
  %t7421 = getelementptr i64, ptr %t7419, i64 1
  store i64 %a1, ptr %t7421
  %t7422 = getelementptr i64, ptr %t7419, i64 2
  store i64 %a2, ptr %t7422
  %t7423 = getelementptr i64, ptr %t7419, i64 3
  store i64 %a3, ptr %t7423
  %t7424 = getelementptr i64, ptr %t7419, i64 4
  store i64 %a4, ptr %t7424
  %t7425 = getelementptr i64, ptr %t7419, i64 5
  store i64 %a5, ptr %t7425
  %t7426 = getelementptr i64, ptr %t7419, i64 6
  store i64 %a6, ptr %t7426
  %t7427 = getelementptr i64, ptr %t7419, i64 7
  store i64 %a7, ptr %t7427
  %t7428 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t7419, ptr %overflow)
  %t7429 = call i64 @rt_null_p(i64 %t7428)
  %t7430 = icmp ne i64 %t7429, 1
  br i1 %t7430, label %then1722, label %else1723
then1722:
  %t7431 = load i64, ptr @"scheme.base:%stderr-port"
  %t7432 = call i64 @rt_not(i64 %t7431)
  %t7433 = icmp ne i64 %t7432, 1
  br i1 %t7433, label %then1724, label %else1725
then1724:
  %t7434 = load i64, ptr @"emit.internal:%make-port"
  %t7435 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t7434, i64 6, i64 8, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t7436 = call i64 @rt_root(i64 %t7435)
  store i64 %t7436, ptr @"scheme.base:%stderr-port"
  br label %merge1726
else1725:
  br label %merge1726
merge1726:
  %t7437 = phi i64 [ 17, %then1724 ], [ 17, %else1725 ]
  %t7438 = load i64, ptr @"scheme.base:%stderr-port"
  ret i64 %t7438
else1723:
  %t7439 = call i64 @rt_car(i64 %t7428)
  %t7440 = call i64 @rt_root(i64 %t7439)
  store i64 %t7440, ptr @"scheme.base:%stderr-port"
  %t7441 = icmp ne i64 1, 1
  br i1 %t7441, label %then1727, label %else1728
then1727:
  ret i64 1
else1728:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7446 = icmp sge i64 %argc, 0
  br i1 %t7446, label %argok1730, label %arityerr1729
arityerr1729:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1730:
  %t7447 = call ptr @rt_alloc_words(i64 8)
  %t7448 = getelementptr i64, ptr %t7447, i64 0
  store i64 %a0, ptr %t7448
  %t7449 = getelementptr i64, ptr %t7447, i64 1
  store i64 %a1, ptr %t7449
  %t7450 = getelementptr i64, ptr %t7447, i64 2
  store i64 %a2, ptr %t7450
  %t7451 = getelementptr i64, ptr %t7447, i64 3
  store i64 %a3, ptr %t7451
  %t7452 = getelementptr i64, ptr %t7447, i64 4
  store i64 %a4, ptr %t7452
  %t7453 = getelementptr i64, ptr %t7447, i64 5
  store i64 %a5, ptr %t7453
  %t7454 = getelementptr i64, ptr %t7447, i64 6
  store i64 %a6, ptr %t7454
  %t7455 = getelementptr i64, ptr %t7447, i64 7
  store i64 %a7, ptr %t7455
  %t7456 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t7447, ptr %overflow)
  %t7457 = call i64 @rt_null_p(i64 %t7456)
  %t7458 = icmp ne i64 %t7457, 1
  br i1 %t7458, label %then1731, label %else1732
then1731:
  %t7459 = load i64, ptr @"scheme.base:%stdin-port"
  %t7460 = call i64 @rt_not(i64 %t7459)
  %t7461 = icmp ne i64 %t7460, 1
  br i1 %t7461, label %then1733, label %else1734
then1733:
  %t7462 = load i64, ptr @"emit.internal:%make-port"
  %t7463 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t7462, i64 6, i64 1, i64 257, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t7464 = call i64 @rt_root(i64 %t7463)
  store i64 %t7464, ptr @"scheme.base:%stdin-port"
  br label %merge1735
else1734:
  br label %merge1735
merge1735:
  %t7465 = phi i64 [ 17, %then1733 ], [ 17, %else1734 ]
  %t7466 = load i64, ptr @"scheme.base:%stdin-port"
  ret i64 %t7466
else1732:
  %t7467 = call i64 @rt_car(i64 %t7456)
  %t7468 = call i64 @rt_root(i64 %t7467)
  store i64 %t7468, ptr @"scheme.base:%stdin-port"
  %t7469 = icmp ne i64 1, 1
  br i1 %t7469, label %then1736, label %else1737
then1736:
  ret i64 1
else1737:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_1407"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7474 = icmp eq i64 %argc, 0
  br i1 %t7474, label %argok1739, label %arityerr1738
arityerr1738:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1739:
  %t7475 = icmp ne i64 1, 1
  br i1 %t7475, label %then1740, label %else1741
then1740:
  ret i64 1
else1741:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_1409"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7476 = icmp eq i64 %argc, 0
  br i1 %t7476, label %argok1743, label %arityerr1742
arityerr1742:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1743:
  %t7477 = and i64 %self, -8
  %t7478 = inttoptr i64 %t7477 to ptr
  %t7479 = getelementptr i64, ptr %t7478, i64 2
  %t7480 = load i64, ptr %t7479
  %t7481 = and i64 %self, -8
  %t7482 = inttoptr i64 %t7481 to ptr
  %t7483 = getelementptr i64, ptr %t7482, i64 1
  %t7484 = load i64, ptr %t7483
  call void @rt_check_callable(i64 %t7484)
  %t7485 = and i64 %t7484, -8
  %t7486 = inttoptr i64 %t7485 to ptr
  %t7487 = load i64, ptr %t7486
  %t7488 = inttoptr i64 %t7487 to ptr
  %t7489 = musttail call fastcc i64 %t7488(i64 %t7484, i64 1, i64 %t7480, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7489
}

define fastcc i64 @"scheme.base:code_1411"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7490 = icmp eq i64 %argc, 0
  br i1 %t7490, label %argok1745, label %arityerr1744
arityerr1744:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1745:
  %t7491 = and i64 %self, -8
  %t7492 = inttoptr i64 %t7491 to ptr
  %t7493 = getelementptr i64, ptr %t7492, i64 1
  %t7494 = load i64, ptr %t7493
  %t7495 = load i64, ptr @"scheme.base:close-port"
  call void @rt_check_callable(i64 %t7495)
  %t7496 = and i64 %t7495, -8
  %t7497 = inttoptr i64 %t7496 to ptr
  %t7498 = load i64, ptr %t7497
  %t7499 = inttoptr i64 %t7498 to ptr
  %t7500 = musttail call fastcc i64 %t7499(i64 %t7495, i64 1, i64 %t7494, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7500
}

define fastcc i64 @"scheme.base:code:call-with-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7501 = icmp eq i64 %argc, 2
  br i1 %t7501, label %argok1747, label %arityerr1746
arityerr1746:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1747:
  %t7502 = call ptr @rt_alloc_words(i64 1)
  %t7503 = ptrtoint ptr %t7502 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1407" to i64), ptr %t7502
  %t7504 = or i64 %t7503, 4
  %t7505 = call ptr @rt_alloc_words(i64 3)
  %t7506 = ptrtoint ptr %t7505 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1409" to i64), ptr %t7505
  %t7507 = getelementptr i64, ptr %t7505, i64 1
  store i64 %a1, ptr %t7507
  %t7508 = getelementptr i64, ptr %t7505, i64 2
  store i64 %a0, ptr %t7508
  %t7509 = or i64 %t7506, 4
  %t7510 = call ptr @rt_alloc_words(i64 2)
  %t7511 = ptrtoint ptr %t7510 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1411" to i64), ptr %t7510
  %t7512 = getelementptr i64, ptr %t7510, i64 1
  store i64 %a0, ptr %t7512
  %t7513 = or i64 %t7511, 4
  %t7514 = load i64, ptr @"scheme.base:dynamic-wind"
  call void @rt_check_callable(i64 %t7514)
  %t7515 = and i64 %t7514, -8
  %t7516 = inttoptr i64 %t7515 to ptr
  %t7517 = load i64, ptr %t7516
  %t7518 = inttoptr i64 %t7517 to ptr
  %t7519 = musttail call fastcc i64 %t7518(i64 %t7514, i64 3, i64 %t7504, i64 %t7509, i64 %t7513, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7519
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
  %t718 = call ptr @rt_alloc_words(i64 1)
  %t719 = ptrtoint ptr %t718 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list?" to i64), ptr %t718
  %t720 = or i64 %t719, 4
  %t721 = call i64 @rt_root(i64 %t720)
  store i64 %t721, ptr @"scheme.base:list?"
  ret i64 17
}

define i64 @"scheme.base:__init_30"() {
entry:
  %t730 = call ptr @rt_alloc_words(i64 1)
  %t731 = ptrtoint ptr %t730 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:zero?" to i64), ptr %t730
  %t732 = or i64 %t731, 4
  %t733 = call i64 @rt_root(i64 %t732)
  store i64 %t733, ptr @"scheme.base:zero?"
  ret i64 17
}

define i64 @"scheme.base:__init_31"() {
entry:
  %t757 = call ptr @rt_alloc_words(i64 1)
  %t758 = ptrtoint ptr %t757 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-tail" to i64), ptr %t757
  %t759 = or i64 %t758, 4
  %t760 = call i64 @rt_root(i64 %t759)
  store i64 %t760, ptr @"scheme.base:list-tail"
  ret i64 17
}

define i64 @"scheme.base:__init_32"() {
entry:
  %t769 = call ptr @rt_alloc_words(i64 1)
  %t770 = ptrtoint ptr %t769 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-ref" to i64), ptr %t769
  %t771 = or i64 %t770, 4
  %t772 = call i64 @rt_root(i64 %t771)
  store i64 %t772, ptr @"scheme.base:list-ref"
  ret i64 17
}

define i64 @"scheme.base:__init_33"() {
entry:
  %t781 = call ptr @rt_alloc_words(i64 1)
  %t782 = ptrtoint ptr %t781 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-set!" to i64), ptr %t781
  %t783 = or i64 %t782, 4
  %t784 = call i64 @rt_root(i64 %t783)
  store i64 %t784, ptr @"scheme.base:list-set!"
  ret i64 17
}

define i64 @"scheme.base:__init_34"() {
entry:
  %t810 = call ptr @rt_alloc_words(i64 1)
  %t811 = ptrtoint ptr %t810 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-head" to i64), ptr %t810
  %t812 = or i64 %t811, 4
  %t813 = call i64 @rt_root(i64 %t812)
  store i64 %t813, ptr @"scheme.base:list-head"
  ret i64 17
}

define i64 @"scheme.base:__init_35"() {
entry:
  %t837 = call ptr @rt_alloc_words(i64 1)
  %t838 = ptrtoint ptr %t837 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-list" to i64), ptr %t837
  %t839 = or i64 %t838, 4
  %t840 = call i64 @rt_root(i64 %t839)
  store i64 %t840, ptr @"scheme.base:make-list"
  ret i64 17
}

define i64 @"scheme.base:__init_36"() {
entry:
  %t877 = call ptr @rt_alloc_words(i64 1)
  %t878 = ptrtoint ptr %t877 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:iota" to i64), ptr %t877
  %t879 = or i64 %t878, 4
  %t880 = call i64 @rt_root(i64 %t879)
  store i64 %t880, ptr @"scheme.base:iota"
  ret i64 17
}

define i64 @"scheme.base:__init_37"() {
entry:
  %t903 = call ptr @rt_alloc_words(i64 1)
  %t904 = ptrtoint ptr %t903 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%minmax-fold" to i64), ptr %t903
  %t905 = or i64 %t904, 4
  %t906 = call i64 @rt_root(i64 %t905)
  store i64 %t906, ptr @"scheme.base:%minmax-fold"
  ret i64 17
}

define i64 @"scheme.base:__init_38"() {
entry:
  %t915 = call ptr @rt_alloc_words(i64 1)
  %t916 = ptrtoint ptr %t915 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%minmax" to i64), ptr %t915
  %t917 = or i64 %t916, 4
  %t918 = call i64 @rt_root(i64 %t917)
  store i64 %t918, ptr @"scheme.base:%minmax"
  ret i64 17
}

define i64 @"scheme.base:__init_39"() {
entry:
  %t948 = call ptr @rt_alloc_words(i64 1)
  %t949 = ptrtoint ptr %t948 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:max" to i64), ptr %t948
  %t950 = or i64 %t949, 4
  %t951 = call i64 @rt_root(i64 %t950)
  store i64 %t951, ptr @"scheme.base:max"
  ret i64 17
}

define i64 @"scheme.base:__init_40"() {
entry:
  %t981 = call ptr @rt_alloc_words(i64 1)
  %t982 = ptrtoint ptr %t981 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:min" to i64), ptr %t981
  %t983 = or i64 %t982, 4
  %t984 = call i64 @rt_root(i64 %t983)
  store i64 %t984, ptr @"scheme.base:min"
  ret i64 17
}

define i64 @"scheme.base:__init_41"() {
entry:
  %t987 = call ptr @rt_alloc_words(i64 1)
  %t988 = ptrtoint ptr %t987 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:complex?" to i64), ptr %t987
  %t989 = or i64 %t988, 4
  %t990 = call i64 @rt_root(i64 %t989)
  store i64 %t990, ptr @"scheme.base:complex?"
  ret i64 17
}

define i64 @"scheme.base:__init_42"() {
entry:
  %t995 = call ptr @rt_alloc_words(i64 1)
  %t996 = ptrtoint ptr %t995 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:exact-integer?" to i64), ptr %t995
  %t997 = or i64 %t996, 4
  %t998 = call i64 @rt_root(i64 %t997)
  store i64 %t998, ptr @"scheme.base:exact-integer?"
  ret i64 17
}

define i64 @"scheme.base:__init_43"() {
entry:
  %t1003 = call ptr @rt_alloc_words(i64 1)
  %t1004 = ptrtoint ptr %t1003 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rational?" to i64), ptr %t1003
  %t1005 = or i64 %t1004, 4
  %t1006 = call i64 @rt_root(i64 %t1005)
  store i64 %t1006, ptr @"scheme.base:rational?"
  ret i64 17
}

define i64 @"scheme.base:__init_44"() {
entry:
  %t1015 = call ptr @rt_alloc_words(i64 1)
  %t1016 = ptrtoint ptr %t1015 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:positive?" to i64), ptr %t1015
  %t1017 = or i64 %t1016, 4
  %t1018 = call i64 @rt_root(i64 %t1017)
  store i64 %t1018, ptr @"scheme.base:positive?"
  ret i64 17
}

define i64 @"scheme.base:__init_45"() {
entry:
  %t1027 = call ptr @rt_alloc_words(i64 1)
  %t1028 = ptrtoint ptr %t1027 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:negative?" to i64), ptr %t1027
  %t1029 = or i64 %t1028, 4
  %t1030 = call i64 @rt_root(i64 %t1029)
  store i64 %t1030, ptr @"scheme.base:negative?"
  ret i64 17
}

define i64 @"scheme.base:__init_46"() {
entry:
  %t1040 = call ptr @rt_alloc_words(i64 1)
  %t1041 = ptrtoint ptr %t1040 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:even?" to i64), ptr %t1040
  %t1042 = or i64 %t1041, 4
  %t1043 = call i64 @rt_root(i64 %t1042)
  store i64 %t1043, ptr @"scheme.base:even?"
  ret i64 17
}

define i64 @"scheme.base:__init_47"() {
entry:
  %t1054 = call ptr @rt_alloc_words(i64 1)
  %t1055 = ptrtoint ptr %t1054 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:odd?" to i64), ptr %t1054
  %t1056 = or i64 %t1055, 4
  %t1057 = call i64 @rt_root(i64 %t1056)
  store i64 %t1057, ptr @"scheme.base:odd?"
  ret i64 17
}

define i64 @"scheme.base:__init_48"() {
entry:
  %t1075 = call ptr @rt_alloc_words(i64 1)
  %t1076 = ptrtoint ptr %t1075 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:abs" to i64), ptr %t1075
  %t1077 = or i64 %t1076, 4
  %t1078 = call i64 @rt_root(i64 %t1077)
  store i64 %t1078, ptr @"scheme.base:abs"
  ret i64 17
}

define i64 @"scheme.base:__init_49"() {
entry:
  %t1089 = call ptr @rt_alloc_words(i64 1)
  %t1090 = ptrtoint ptr %t1089 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:square" to i64), ptr %t1089
  %t1091 = or i64 %t1090, 4
  %t1092 = call i64 @rt_root(i64 %t1091)
  store i64 %t1092, ptr @"scheme.base:square"
  ret i64 17
}

define i64 @"scheme.base:__init_50"() {
entry:
  %t1109 = call ptr @rt_alloc_words(i64 1)
  %t1110 = ptrtoint ptr %t1109 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%gcd2" to i64), ptr %t1109
  %t1111 = or i64 %t1110, 4
  %t1112 = call i64 @rt_root(i64 %t1111)
  store i64 %t1112, ptr @"scheme.base:%gcd2"
  ret i64 17
}

define i64 @"scheme.base:__init_51"() {
entry:
  %t1142 = call ptr @rt_alloc_words(i64 1)
  %t1143 = ptrtoint ptr %t1142 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%gcd-fold" to i64), ptr %t1142
  %t1144 = or i64 %t1143, 4
  %t1145 = call i64 @rt_root(i64 %t1144)
  store i64 %t1145, ptr @"scheme.base:%gcd-fold"
  ret i64 17
}

define i64 @"scheme.base:__init_52"() {
entry:
  %t1187 = call ptr @rt_alloc_words(i64 1)
  %t1188 = ptrtoint ptr %t1187 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%lcm-fold" to i64), ptr %t1187
  %t1189 = or i64 %t1188, 4
  %t1190 = call i64 @rt_root(i64 %t1189)
  store i64 %t1190, ptr @"scheme.base:%lcm-fold"
  ret i64 17
}

define i64 @"scheme.base:__init_53"() {
entry:
  %t1208 = call ptr @rt_alloc_words(i64 1)
  %t1209 = ptrtoint ptr %t1208 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:gcd" to i64), ptr %t1208
  %t1210 = or i64 %t1209, 4
  %t1211 = call i64 @rt_root(i64 %t1210)
  store i64 %t1211, ptr @"scheme.base:gcd"
  ret i64 17
}

define i64 @"scheme.base:__init_54"() {
entry:
  %t1229 = call ptr @rt_alloc_words(i64 1)
  %t1230 = ptrtoint ptr %t1229 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:lcm" to i64), ptr %t1229
  %t1231 = or i64 %t1230, 4
  %t1232 = call i64 @rt_root(i64 %t1231)
  store i64 %t1232, ptr @"scheme.base:lcm"
  ret i64 17
}

define i64 @"scheme.base:__init_55"() {
entry:
  %t1275 = call ptr @rt_alloc_words(i64 1)
  %t1276 = ptrtoint ptr %t1275 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%expt-exact" to i64), ptr %t1275
  %t1277 = or i64 %t1276, 4
  %t1278 = call i64 @rt_root(i64 %t1277)
  store i64 %t1278, ptr @"scheme.base:%expt-exact"
  ret i64 17
}

define i64 @"scheme.base:__init_56"() {
entry:
  %t1307 = call ptr @rt_alloc_words(i64 1)
  %t1308 = ptrtoint ptr %t1307 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:expt" to i64), ptr %t1307
  %t1309 = or i64 %t1308, 4
  %t1310 = call i64 @rt_root(i64 %t1309)
  store i64 %t1310, ptr @"scheme.base:expt"
  ret i64 17
}

define i64 @"scheme.base:__init_57"() {
entry:
  %t1336 = call ptr @rt_alloc_words(i64 1)
  %t1337 = ptrtoint ptr %t1336 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%isqrt-loop" to i64), ptr %t1336
  %t1338 = or i64 %t1337, 4
  %t1339 = call i64 @rt_root(i64 %t1338)
  store i64 %t1339, ptr @"scheme.base:%isqrt-loop"
  ret i64 17
}

define i64 @"scheme.base:__init_58"() {
entry:
  %t1355 = call ptr @rt_alloc_words(i64 1)
  %t1356 = ptrtoint ptr %t1355 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%isqrt" to i64), ptr %t1355
  %t1357 = or i64 %t1356, 4
  %t1358 = call i64 @rt_root(i64 %t1357)
  store i64 %t1358, ptr @"scheme.base:%isqrt"
  ret i64 17
}

define i64 @"scheme.base:__init_59"() {
entry:
  %t1389 = call ptr @rt_alloc_words(i64 1)
  %t1390 = ptrtoint ptr %t1389 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:exact-integer-sqrt" to i64), ptr %t1389
  %t1391 = or i64 %t1390, 4
  %t1392 = call i64 @rt_root(i64 %t1391)
  store i64 %t1392, ptr @"scheme.base:exact-integer-sqrt"
  ret i64 17
}

define i64 @"scheme.base:__init_60"() {
entry:
  %t1397 = call ptr @rt_alloc_words(i64 1)
  %t1398 = ptrtoint ptr %t1397 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:floor" to i64), ptr %t1397
  %t1399 = or i64 %t1398, 4
  %t1400 = call i64 @rt_root(i64 %t1399)
  store i64 %t1400, ptr @"scheme.base:floor"
  ret i64 17
}

define i64 @"scheme.base:__init_61"() {
entry:
  %t1405 = call ptr @rt_alloc_words(i64 1)
  %t1406 = ptrtoint ptr %t1405 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:ceiling" to i64), ptr %t1405
  %t1407 = or i64 %t1406, 4
  %t1408 = call i64 @rt_root(i64 %t1407)
  store i64 %t1408, ptr @"scheme.base:ceiling"
  ret i64 17
}

define i64 @"scheme.base:__init_62"() {
entry:
  %t1413 = call ptr @rt_alloc_words(i64 1)
  %t1414 = ptrtoint ptr %t1413 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:truncate" to i64), ptr %t1413
  %t1415 = or i64 %t1414, 4
  %t1416 = call i64 @rt_root(i64 %t1415)
  store i64 %t1416, ptr @"scheme.base:truncate"
  ret i64 17
}

define i64 @"scheme.base:__init_63"() {
entry:
  %t1421 = call ptr @rt_alloc_words(i64 1)
  %t1422 = ptrtoint ptr %t1421 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:round" to i64), ptr %t1421
  %t1423 = or i64 %t1422, 4
  %t1424 = call i64 @rt_root(i64 %t1423)
  store i64 %t1424, ptr @"scheme.base:round"
  ret i64 17
}

define i64 @"scheme.base:__init_64"() {
entry:
  %t1427 = call ptr @rt_alloc_words(i64 1)
  %t1428 = ptrtoint ptr %t1427 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:truncate-quotient" to i64), ptr %t1427
  %t1429 = or i64 %t1428, 4
  %t1430 = call i64 @rt_root(i64 %t1429)
  store i64 %t1430, ptr @"scheme.base:truncate-quotient"
  ret i64 17
}

define i64 @"scheme.base:__init_65"() {
entry:
  %t1433 = call ptr @rt_alloc_words(i64 1)
  %t1434 = ptrtoint ptr %t1433 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:truncate-remainder" to i64), ptr %t1433
  %t1435 = or i64 %t1434, 4
  %t1436 = call i64 @rt_root(i64 %t1435)
  store i64 %t1436, ptr @"scheme.base:truncate-remainder"
  ret i64 17
}

define i64 @"scheme.base:__init_66"() {
entry:
  %t1439 = call ptr @rt_alloc_words(i64 1)
  %t1440 = ptrtoint ptr %t1439 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:floor-remainder" to i64), ptr %t1439
  %t1441 = or i64 %t1440, 4
  %t1442 = call i64 @rt_root(i64 %t1441)
  store i64 %t1442, ptr @"scheme.base:floor-remainder"
  ret i64 17
}

define i64 @"scheme.base:__init_67"() {
entry:
  %t1454 = call ptr @rt_alloc_words(i64 1)
  %t1455 = ptrtoint ptr %t1454 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:floor-quotient" to i64), ptr %t1454
  %t1456 = or i64 %t1455, 4
  %t1457 = call i64 @rt_root(i64 %t1456)
  store i64 %t1457, ptr @"scheme.base:floor-quotient"
  ret i64 17
}

define i64 @"scheme.base:__init_68"() {
entry:
  %t1467 = call ptr @rt_alloc_words(i64 1)
  %t1468 = ptrtoint ptr %t1467 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:truncate/" to i64), ptr %t1467
  %t1469 = or i64 %t1468, 4
  %t1470 = call i64 @rt_root(i64 %t1469)
  store i64 %t1470, ptr @"scheme.base:truncate/"
  ret i64 17
}

define i64 @"scheme.base:__init_69"() {
entry:
  %t1485 = call ptr @rt_alloc_words(i64 1)
  %t1486 = ptrtoint ptr %t1485 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:floor/" to i64), ptr %t1485
  %t1487 = or i64 %t1486, 4
  %t1488 = call i64 @rt_root(i64 %t1487)
  store i64 %t1488, ptr @"scheme.base:floor/"
  ret i64 17
}

define i64 @"scheme.base:__init_70"() {
entry:
  %t1499 = call ptr @rt_alloc_words(i64 1)
  %t1500 = ptrtoint ptr %t1499 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:numerator" to i64), ptr %t1499
  %t1501 = or i64 %t1500, 4
  %t1502 = call i64 @rt_root(i64 %t1501)
  store i64 %t1502, ptr @"scheme.base:numerator"
  ret i64 17
}

define i64 @"scheme.base:__init_71"() {
entry:
  %t1516 = call ptr @rt_alloc_words(i64 1)
  %t1517 = ptrtoint ptr %t1516 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:denominator" to i64), ptr %t1516
  %t1518 = or i64 %t1517, 4
  %t1519 = call i64 @rt_root(i64 %t1518)
  store i64 %t1519, ptr @"scheme.base:denominator"
  ret i64 17
}

define i64 @"scheme.base:__init_72"() {
entry:
  %t1522 = call ptr @rt_alloc_words(i64 1)
  %t1523 = ptrtoint ptr %t1522 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:inexact" to i64), ptr %t1522
  %t1524 = or i64 %t1523, 4
  %t1525 = call i64 @rt_root(i64 %t1524)
  store i64 %t1525, ptr @"scheme.base:inexact"
  ret i64 17
}

define i64 @"scheme.base:__init_73"() {
entry:
  %t1528 = call ptr @rt_alloc_words(i64 1)
  %t1529 = ptrtoint ptr %t1528 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:exact" to i64), ptr %t1528
  %t1530 = or i64 %t1529, 4
  %t1531 = call i64 @rt_root(i64 %t1530)
  store i64 %t1531, ptr @"scheme.base:exact"
  ret i64 17
}

define i64 @"scheme.base:__init_74"() {
entry:
  %t1534 = call ptr @rt_alloc_words(i64 1)
  %t1535 = ptrtoint ptr %t1534 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:void" to i64), ptr %t1534
  %t1536 = or i64 %t1535, 4
  %t1537 = call i64 @rt_root(i64 %t1536)
  store i64 %t1537, ptr @"scheme.base:void"
  ret i64 17
}

define i64 @"scheme.base:__init_75"() {
entry:
  %t1550 = call ptr @rt_alloc_words(i64 1)
  %t1551 = ptrtoint ptr %t1550 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string" to i64), ptr %t1550
  %t1552 = or i64 %t1551, 4
  %t1553 = call i64 @rt_root(i64 %t1552)
  store i64 %t1553, ptr @"scheme.base:string"
  ret i64 17
}

define i64 @"scheme.base:__init_76"() {
entry:
  %t1567 = call ptr @rt_alloc_words(i64 1)
  %t1568 = ptrtoint ptr %t1567 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%str-concat" to i64), ptr %t1567
  %t1569 = or i64 %t1568, 4
  %t1570 = call i64 @rt_root(i64 %t1569)
  store i64 %t1570, ptr @"scheme.base:%str-concat"
  ret i64 17
}

define i64 @"scheme.base:__init_77"() {
entry:
  %t1590 = call ptr @rt_alloc_words(i64 1)
  %t1591 = ptrtoint ptr %t1590 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:chr-cmp" to i64), ptr %t1590
  %t1592 = or i64 %t1591, 4
  %t1593 = call i64 @rt_root(i64 %t1592)
  store i64 %t1593, ptr @"scheme.base:chr-cmp"
  ret i64 17
}

define i64 @"scheme.base:__init_78"() {
entry:
  %t1622 = call ptr @rt_alloc_words(i64 1)
  %t1623 = ptrtoint ptr %t1622 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char=?" to i64), ptr %t1622
  %t1624 = or i64 %t1623, 4
  %t1625 = call i64 @rt_root(i64 %t1624)
  store i64 %t1625, ptr @"scheme.base:char=?"
  ret i64 17
}

define i64 @"scheme.base:__init_79"() {
entry:
  %t1654 = call ptr @rt_alloc_words(i64 1)
  %t1655 = ptrtoint ptr %t1654 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char<?" to i64), ptr %t1654
  %t1656 = or i64 %t1655, 4
  %t1657 = call i64 @rt_root(i64 %t1656)
  store i64 %t1657, ptr @"scheme.base:char<?"
  ret i64 17
}

define i64 @"scheme.base:__init_80"() {
entry:
  %t1686 = call ptr @rt_alloc_words(i64 1)
  %t1687 = ptrtoint ptr %t1686 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char>?" to i64), ptr %t1686
  %t1688 = or i64 %t1687, 4
  %t1689 = call i64 @rt_root(i64 %t1688)
  store i64 %t1689, ptr @"scheme.base:char>?"
  ret i64 17
}

define i64 @"scheme.base:__init_81"() {
entry:
  %t1726 = call ptr @rt_alloc_words(i64 1)
  %t1727 = ptrtoint ptr %t1726 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char<=?" to i64), ptr %t1726
  %t1728 = or i64 %t1727, 4
  %t1729 = call i64 @rt_root(i64 %t1728)
  store i64 %t1729, ptr @"scheme.base:char<=?"
  ret i64 17
}

define i64 @"scheme.base:__init_82"() {
entry:
  %t1766 = call ptr @rt_alloc_words(i64 1)
  %t1767 = ptrtoint ptr %t1766 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:char>=?" to i64), ptr %t1766
  %t1768 = or i64 %t1767, 4
  %t1769 = call i64 @rt_root(i64 %t1768)
  store i64 %t1769, ptr @"scheme.base:char>=?"
  ret i64 17
}

define i64 @"scheme.base:__init_83"() {
entry:
  %t1844 = call ptr @rt_alloc_words(i64 1)
  %t1845 = ptrtoint ptr %t1844 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string->list" to i64), ptr %t1844
  %t1846 = or i64 %t1845, 4
  %t1847 = call i64 @rt_root(i64 %t1846)
  store i64 %t1847, ptr @"scheme.base:string->list"
  ret i64 17
}

define i64 @"scheme.base:__init_84"() {
entry:
  %t1855 = call ptr @rt_alloc_words(i64 1)
  %t1856 = ptrtoint ptr %t1855 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:ns-digits" to i64), ptr %t1855
  %t1857 = or i64 %t1856, 4
  %t1858 = call i64 @rt_root(i64 %t1857)
  store i64 %t1858, ptr @"scheme.base:ns-digits"
  ret i64 17
}

define i64 @"scheme.base:__init_85"() {
entry:
  %t1886 = call ptr @rt_alloc_words(i64 1)
  %t1887 = ptrtoint ptr %t1886 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ns-digit-char" to i64), ptr %t1886
  %t1888 = or i64 %t1887, 4
  %t1889 = call i64 @rt_root(i64 %t1888)
  store i64 %t1889, ptr @"scheme.base:%ns-digit-char"
  ret i64 17
}

define i64 @"scheme.base:__init_86"() {
entry:
  %t1923 = call ptr @rt_alloc_words(i64 1)
  %t1924 = ptrtoint ptr %t1923 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:ns-digits-radix" to i64), ptr %t1923
  %t1925 = or i64 %t1924, 4
  %t1926 = call i64 @rt_root(i64 %t1925)
  store i64 %t1926, ptr @"scheme.base:ns-digits-radix"
  ret i64 17
}

define i64 @"scheme.base:__init_87"() {
entry:
  %t1959 = call ptr @rt_alloc_words(i64 1)
  %t1960 = ptrtoint ptr %t1959 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%radix-ok?" to i64), ptr %t1959
  %t1961 = or i64 %t1960, 4
  %t1962 = call i64 @rt_root(i64 %t1961)
  store i64 %t1962, ptr @"scheme.base:%radix-ok?"
  ret i64 17
}

define i64 @"scheme.base:__init_88"() {
entry:
  %t2050 = call ptr @rt_alloc_words(i64 1)
  %t2051 = ptrtoint ptr %t2050 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:number->string" to i64), ptr %t2050
  %t2052 = or i64 %t2051, 4
  %t2053 = call i64 @rt_root(i64 %t2052)
  store i64 %t2053, ptr @"scheme.base:number->string"
  ret i64 17
}

define i64 @"scheme.base:__init_89"() {
entry:
  %t2087 = call ptr @rt_alloc_words(i64 1)
  %t2088 = ptrtoint ptr %t2087 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string->number" to i64), ptr %t2087
  %t2089 = or i64 %t2088, 4
  %t2090 = call i64 @rt_root(i64 %t2089)
  store i64 %t2090, ptr @"scheme.base:string->number"
  ret i64 17
}

define i64 @"scheme.base:__init_90"() {
entry:
  %t2114 = call ptr @rt_alloc_words(i64 1)
  %t2115 = ptrtoint ptr %t2114 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%raise-kinded" to i64), ptr %t2114
  %t2116 = or i64 %t2115, 4
  %t2117 = call i64 @rt_root(i64 %t2116)
  store i64 %t2117, ptr @"scheme.base:%raise-kinded"
  ret i64 17
}

define i64 @"scheme.base:__init_91"() {
entry:
  %t2136 = call ptr @rt_alloc_words(i64 1)
  %t2137 = ptrtoint ptr %t2136 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error" to i64), ptr %t2136
  %t2138 = or i64 %t2137, 4
  %t2139 = call i64 @rt_root(i64 %t2138)
  store i64 %t2139, ptr @"scheme.base:error"
  ret i64 17
}

define i64 @"scheme.base:__init_92"() {
entry:
  %t2158 = call ptr @rt_alloc_words(i64 1)
  %t2159 = ptrtoint ptr %t2158 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%read-error" to i64), ptr %t2158
  %t2160 = or i64 %t2159, 4
  %t2161 = call i64 @rt_root(i64 %t2160)
  store i64 %t2161, ptr @"scheme.base:%read-error"
  ret i64 17
}

define i64 @"scheme.base:__init_93"() {
entry:
  %t2162 = call i64 @rt_root(i64 2)
  store i64 %t2162, ptr @"scheme.base:*winds*"
  ret i64 17
}

define i64 @"scheme.base:__init_94"() {
entry:
  %t2171 = call ptr @rt_alloc_words(i64 1)
  %t2172 = ptrtoint ptr %t2171 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_474" to i64), ptr %t2171
  %t2173 = or i64 %t2172, 4
  %t2174 = call i64 @rt_set_trap_raiser(ptr @__apply0, i64 %t2173)
  %t2175 = call i64 @rt_root(i64 2)
  store i64 %t2175, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define i64 @"scheme.base:__init_95"() {
entry:
  %t2200 = call ptr @rt_alloc_words(i64 1)
  %t2201 = ptrtoint ptr %t2200 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%unwind-to" to i64), ptr %t2200
  %t2202 = or i64 %t2201, 4
  %t2203 = call i64 @rt_root(i64 %t2202)
  store i64 %t2203, ptr @"scheme.base:%unwind-to"
  ret i64 17
}

define i64 @"scheme.base:__init_96"() {
entry:
  %t2227 = call ptr @rt_alloc_words(i64 1)
  %t2228 = ptrtoint ptr %t2227 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:dynamic-wind" to i64), ptr %t2227
  %t2229 = or i64 %t2228, 4
  %t2230 = call i64 @rt_root(i64 %t2229)
  store i64 %t2230, ptr @"scheme.base:dynamic-wind"
  ret i64 17
}

define i64 @"scheme.base:__init_97"() {
entry:
  %t2291 = call ptr @rt_alloc_words(i64 1)
  %t2292 = ptrtoint ptr %t2291 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-current-continuation" to i64), ptr %t2291
  %t2293 = or i64 %t2292, 4
  %t2294 = call i64 @rt_root(i64 %t2293)
  store i64 %t2294, ptr @"scheme.base:call-with-current-continuation"
  ret i64 17
}

define i64 @"scheme.base:__init_98"() {
entry:
  %t2302 = call ptr @rt_alloc_words(i64 1)
  %t2303 = ptrtoint ptr %t2302 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call/cc" to i64), ptr %t2302
  %t2304 = or i64 %t2303, 4
  %t2305 = call i64 @rt_root(i64 %t2304)
  store i64 %t2305, ptr @"scheme.base:call/cc"
  ret i64 17
}

define i64 @"scheme.base:__init_99"() {
entry:
  %t2340 = call ptr @rt_alloc_words(i64 1)
  %t2341 = ptrtoint ptr %t2340 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-exception-handler" to i64), ptr %t2340
  %t2342 = or i64 %t2341, 4
  %t2343 = call i64 @rt_root(i64 %t2342)
  store i64 %t2343, ptr @"scheme.base:with-exception-handler"
  ret i64 17
}

define i64 @"scheme.base:__init_100"() {
entry:
  %t2362 = call ptr @rt_alloc_words(i64 1)
  %t2363 = ptrtoint ptr %t2362 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:raise" to i64), ptr %t2362
  %t2364 = or i64 %t2363, 4
  %t2365 = call i64 @rt_root(i64 %t2364)
  store i64 %t2365, ptr @"scheme.base:raise"
  ret i64 17
}

define i64 @"scheme.base:__init_101"() {
entry:
  %t2368 = call ptr @rt_alloc_words(i64 1)
  %t2369 = ptrtoint ptr %t2368 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object?" to i64), ptr %t2368
  %t2370 = or i64 %t2369, 4
  %t2371 = call i64 @rt_root(i64 %t2370)
  store i64 %t2371, ptr @"scheme.base:error-object?"
  ret i64 17
}

define i64 @"scheme.base:__init_102"() {
entry:
  %t2374 = call ptr @rt_alloc_words(i64 1)
  %t2375 = ptrtoint ptr %t2374 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-message" to i64), ptr %t2374
  %t2376 = or i64 %t2375, 4
  %t2377 = call i64 @rt_root(i64 %t2376)
  store i64 %t2377, ptr @"scheme.base:error-object-message"
  ret i64 17
}

define i64 @"scheme.base:__init_103"() {
entry:
  %t2380 = call ptr @rt_alloc_words(i64 1)
  %t2381 = ptrtoint ptr %t2380 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-irritants" to i64), ptr %t2380
  %t2382 = or i64 %t2381, 4
  %t2383 = call i64 @rt_root(i64 %t2382)
  store i64 %t2383, ptr @"scheme.base:error-object-irritants"
  ret i64 17
}

define i64 @"scheme.base:__init_104"() {
entry:
  %t2390 = call ptr @rt_alloc_words(i64 1)
  %t2391 = ptrtoint ptr %t2390 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-error?" to i64), ptr %t2390
  %t2392 = or i64 %t2391, 4
  %t2393 = call i64 @rt_root(i64 %t2392)
  store i64 %t2393, ptr @"scheme.base:read-error?"
  ret i64 17
}

define i64 @"scheme.base:__init_105"() {
entry:
  %t2400 = call ptr @rt_alloc_words(i64 1)
  %t2401 = ptrtoint ptr %t2400 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:file-error?" to i64), ptr %t2400
  %t2402 = or i64 %t2401, 4
  %t2403 = call i64 @rt_root(i64 %t2402)
  store i64 %t2403, ptr @"scheme.base:file-error?"
  ret i64 17
}

define i64 @"scheme.base:__init_106"() {
entry:
  %t2485 = call ptr @rt_alloc_words(i64 1)
  %t2486 = ptrtoint ptr %t2485 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-parameter" to i64), ptr %t2485
  %t2487 = or i64 %t2486, 4
  %t2488 = call i64 @rt_root(i64 %t2487)
  store i64 %t2488, ptr @"scheme.base:make-parameter"
  ret i64 17
}

define i64 @"scheme.base:__init_107"() {
entry:
  %t2569 = call ptr @rt_alloc_words(i64 1)
  %t2570 = ptrtoint ptr %t2569 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-parameters" to i64), ptr %t2569
  %t2571 = or i64 %t2570, 4
  %t2572 = call i64 @rt_root(i64 %t2571)
  store i64 %t2572, ptr @"scheme.base:with-parameters"
  ret i64 17
}

define i64 @"scheme.base:__init_108"() {
entry:
  %t2610 = call ptr @rt_alloc_words(i64 1)
  %t2611 = ptrtoint ptr %t2610 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->vector" to i64), ptr %t2610
  %t2612 = or i64 %t2611, 4
  %t2613 = call i64 @rt_root(i64 %t2612)
  store i64 %t2613, ptr @"scheme.base:list->vector"
  ret i64 17
}

define i64 @"scheme.base:__init_109"() {
entry:
  %t2631 = call ptr @rt_alloc_words(i64 1)
  %t2632 = ptrtoint ptr %t2631 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector" to i64), ptr %t2631
  %t2633 = or i64 %t2632, 4
  %t2634 = call i64 @rt_root(i64 %t2633)
  store i64 %t2634, ptr @"scheme.base:vector"
  ret i64 17
}

define i64 @"scheme.base:__init_110"() {
entry:
  %t2672 = call ptr @rt_alloc_words(i64 1)
  %t2673 = ptrtoint ptr %t2672 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->bytevector" to i64), ptr %t2672
  %t2674 = or i64 %t2673, 4
  %t2675 = call i64 @rt_root(i64 %t2674)
  store i64 %t2675, ptr @"scheme.base:list->bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_111"() {
entry:
  %t2693 = call ptr @rt_alloc_words(i64 1)
  %t2694 = ptrtoint ptr %t2693 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector" to i64), ptr %t2693
  %t2695 = or i64 %t2694, 4
  %t2696 = call i64 @rt_root(i64 %t2695)
  store i64 %t2696, ptr @"scheme.base:bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_112"() {
entry:
  %t2701 = call ptr @rt_alloc_words(i64 1)
  %t2702 = ptrtoint ptr %t2701 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rng-start" to i64), ptr %t2701
  %t2703 = or i64 %t2702, 4
  %t2704 = call i64 @rt_root(i64 %t2703)
  store i64 %t2704, ptr @"scheme.base:rng-start"
  ret i64 17
}

define i64 @"scheme.base:__init_113"() {
entry:
  %t2714 = call ptr @rt_alloc_words(i64 1)
  %t2715 = ptrtoint ptr %t2714 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rng-end" to i64), ptr %t2714
  %t2716 = or i64 %t2715, 4
  %t2717 = call i64 @rt_root(i64 %t2716)
  store i64 %t2717, ptr @"scheme.base:rng-end"
  ret i64 17
}

define i64 @"scheme.base:__init_114"() {
entry:
  %t2779 = call ptr @rt_alloc_words(i64 1)
  %t2780 = ptrtoint ptr %t2779 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rng-check" to i64), ptr %t2779
  %t2781 = or i64 %t2780, 4
  %t2782 = call i64 @rt_root(i64 %t2781)
  store i64 %t2782, ptr @"scheme.base:rng-check"
  ret i64 17
}

define i64 @"scheme.base:__init_115"() {
entry:
  %t2798 = call ptr @rt_alloc_words(i64 1)
  %t2799 = ptrtoint ptr %t2798 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:assv" to i64), ptr %t2798
  %t2800 = or i64 %t2799, 4
  %t2801 = call i64 @rt_root(i64 %t2800)
  store i64 %t2801, ptr @"scheme.base:assv"
  ret i64 17
}

define i64 @"scheme.base:__init_116"() {
entry:
  %t2814 = call ptr @rt_alloc_words(i64 1)
  %t2815 = ptrtoint ptr %t2814 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-copy" to i64), ptr %t2814
  %t2816 = or i64 %t2815, 4
  %t2817 = call i64 @rt_root(i64 %t2816)
  store i64 %t2817, ptr @"scheme.base:list-copy"
  ret i64 17
}

define i64 @"scheme.base:__init_117"() {
entry:
  %t2836 = call ptr @rt_alloc_words(i64 1)
  %t2837 = ptrtoint ptr %t2836 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:boolean=?" to i64), ptr %t2836
  %t2838 = or i64 %t2837, 4
  %t2839 = call i64 @rt_root(i64 %t2838)
  store i64 %t2839, ptr @"scheme.base:boolean=?"
  ret i64 17
}

define i64 @"scheme.base:__init_118"() {
entry:
  %t2858 = call ptr @rt_alloc_words(i64 1)
  %t2859 = ptrtoint ptr %t2858 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:symbol=?" to i64), ptr %t2858
  %t2860 = or i64 %t2859, 4
  %t2861 = call i64 @rt_root(i64 %t2860)
  store i64 %t2861, ptr @"scheme.base:symbol=?"
  ret i64 17
}

define i64 @"scheme.base:__init_119"() {
entry:
  %t2876 = call ptr @rt_alloc_words(i64 1)
  %t2877 = ptrtoint ptr %t2876 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:eqv-chain?" to i64), ptr %t2876
  %t2878 = or i64 %t2877, 4
  %t2879 = call i64 @rt_root(i64 %t2878)
  store i64 %t2879, ptr @"scheme.base:eqv-chain?"
  ret i64 17
}

define i64 @"scheme.base:__init_120"() {
entry:
  %t2979 = call ptr @rt_alloc_words(i64 1)
  %t2980 = ptrtoint ptr %t2979 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-cmp" to i64), ptr %t2979
  %t2981 = or i64 %t2980, 4
  %t2982 = call i64 @rt_root(i64 %t2981)
  store i64 %t2982, ptr @"scheme.base:str-cmp"
  ret i64 17
}

define i64 @"scheme.base:__init_121"() {
entry:
  %t3001 = call ptr @rt_alloc_words(i64 1)
  %t3002 = ptrtoint ptr %t3001 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-chain?" to i64), ptr %t3001
  %t3003 = or i64 %t3002, 4
  %t3004 = call i64 @rt_root(i64 %t3003)
  store i64 %t3004, ptr @"scheme.base:str-chain?"
  ret i64 17
}

define i64 @"scheme.base:__init_122"() {
entry:
  %t3040 = call ptr @rt_alloc_words(i64 1)
  %t3041 = ptrtoint ptr %t3040 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string<?" to i64), ptr %t3040
  %t3042 = or i64 %t3041, 4
  %t3043 = call i64 @rt_root(i64 %t3042)
  store i64 %t3043, ptr @"scheme.base:string<?"
  ret i64 17
}

define i64 @"scheme.base:__init_123"() {
entry:
  %t3079 = call ptr @rt_alloc_words(i64 1)
  %t3080 = ptrtoint ptr %t3079 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string>?" to i64), ptr %t3079
  %t3081 = or i64 %t3080, 4
  %t3082 = call i64 @rt_root(i64 %t3081)
  store i64 %t3082, ptr @"scheme.base:string>?"
  ret i64 17
}

define i64 @"scheme.base:__init_124"() {
entry:
  %t3119 = call ptr @rt_alloc_words(i64 1)
  %t3120 = ptrtoint ptr %t3119 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string<=?" to i64), ptr %t3119
  %t3121 = or i64 %t3120, 4
  %t3122 = call i64 @rt_root(i64 %t3121)
  store i64 %t3122, ptr @"scheme.base:string<=?"
  ret i64 17
}

define i64 @"scheme.base:__init_125"() {
entry:
  %t3159 = call ptr @rt_alloc_words(i64 1)
  %t3160 = ptrtoint ptr %t3159 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string>=?" to i64), ptr %t3159
  %t3161 = or i64 %t3160, 4
  %t3162 = call i64 @rt_root(i64 %t3161)
  store i64 %t3162, ptr @"scheme.base:string>=?"
  ret i64 17
}

define i64 @"scheme.base:__init_126"() {
entry:
  %t3237 = call ptr @rt_alloc_words(i64 1)
  %t3238 = ptrtoint ptr %t3237 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector->list" to i64), ptr %t3237
  %t3239 = or i64 %t3238, 4
  %t3240 = call i64 @rt_root(i64 %t3239)
  store i64 %t3240, ptr @"scheme.base:vector->list"
  ret i64 17
}

define i64 @"scheme.base:__init_127"() {
entry:
  %t3338 = call ptr @rt_alloc_words(i64 1)
  %t3339 = ptrtoint ptr %t3338 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-copy" to i64), ptr %t3338
  %t3340 = or i64 %t3339, 4
  %t3341 = call i64 @rt_root(i64 %t3340)
  store i64 %t3341, ptr @"scheme.base:vector-copy"
  ret i64 17
}

define i64 @"scheme.base:__init_128"() {
entry:
  %t3464 = call ptr @rt_alloc_words(i64 1)
  %t3465 = ptrtoint ptr %t3464 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-append" to i64), ptr %t3464
  %t3466 = or i64 %t3465, 4
  %t3467 = call i64 @rt_root(i64 %t3466)
  store i64 %t3467, ptr @"scheme.base:vector-append"
  ret i64 17
}

define i64 @"scheme.base:__init_129"() {
entry:
  %t3488 = call ptr @rt_alloc_words(i64 1)
  %t3489 = ptrtoint ptr %t3488 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vec-total" to i64), ptr %t3488
  %t3490 = or i64 %t3489, 4
  %t3491 = call i64 @rt_root(i64 %t3490)
  store i64 %t3491, ptr @"scheme.base:vec-total"
  ret i64 17
}

define i64 @"scheme.base:__init_130"() {
entry:
  %t3568 = call ptr @rt_alloc_words(i64 1)
  %t3569 = ptrtoint ptr %t3568 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-fill!" to i64), ptr %t3568
  %t3570 = or i64 %t3569, 4
  %t3571 = call i64 @rt_root(i64 %t3570)
  store i64 %t3571, ptr @"scheme.base:vector-fill!"
  ret i64 17
}

define i64 @"scheme.base:__init_131"() {
entry:
  %t3802 = call ptr @rt_alloc_words(i64 1)
  %t3803 = ptrtoint ptr %t3802 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-copy!" to i64), ptr %t3802
  %t3804 = or i64 %t3803, 4
  %t3805 = call i64 @rt_root(i64 %t3804)
  store i64 %t3805, ptr @"scheme.base:vector-copy!"
  ret i64 17
}

define i64 @"scheme.base:__init_132"() {
entry:
  %t3964 = call ptr @rt_alloc_words(i64 1)
  %t3965 = ptrtoint ptr %t3964 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-map" to i64), ptr %t3964
  %t3966 = or i64 %t3965, 4
  %t3967 = call i64 @rt_root(i64 %t3966)
  store i64 %t3967, ptr @"scheme.base:vector-map"
  ret i64 17
}

define i64 @"scheme.base:__init_133"() {
entry:
  %t4116 = call ptr @rt_alloc_words(i64 1)
  %t4117 = ptrtoint ptr %t4116 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-for-each" to i64), ptr %t4116
  %t4118 = or i64 %t4117, 4
  %t4119 = call i64 @rt_root(i64 %t4118)
  store i64 %t4119, ptr @"scheme.base:vector-for-each"
  ret i64 17
}

define i64 @"scheme.base:__init_134"() {
entry:
  %t4143 = call ptr @rt_alloc_words(i64 1)
  %t4144 = ptrtoint ptr %t4143 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vec-min-len" to i64), ptr %t4143
  %t4145 = or i64 %t4144, 4
  %t4146 = call i64 @rt_root(i64 %t4145)
  store i64 %t4146, ptr @"scheme.base:vec-min-len"
  ret i64 17
}

define i64 @"scheme.base:__init_135"() {
entry:
  %t4160 = call ptr @rt_alloc_words(i64 1)
  %t4161 = ptrtoint ptr %t4160 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vec-nth" to i64), ptr %t4160
  %t4162 = or i64 %t4161, 4
  %t4163 = call i64 @rt_root(i64 %t4162)
  store i64 %t4163, ptr @"scheme.base:vec-nth"
  ret i64 17
}

define i64 @"scheme.base:__init_136"() {
entry:
  %t4261 = call ptr @rt_alloc_words(i64 1)
  %t4262 = ptrtoint ptr %t4261 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string->vector" to i64), ptr %t4261
  %t4263 = or i64 %t4262, 4
  %t4264 = call i64 @rt_root(i64 %t4263)
  store i64 %t4264, ptr @"scheme.base:string->vector"
  ret i64 17
}

define i64 @"scheme.base:__init_137"() {
entry:
  %t4303 = call ptr @rt_alloc_words(i64 1)
  %t4304 = ptrtoint ptr %t4303 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector->string" to i64), ptr %t4303
  %t4305 = or i64 %t4304, 4
  %t4306 = call i64 @rt_root(i64 %t4305)
  store i64 %t4306, ptr @"scheme.base:vector->string"
  ret i64 17
}

define i64 @"scheme.base:__init_138"() {
entry:
  %t4341 = call ptr @rt_alloc_words(i64 1)
  %t4342 = ptrtoint ptr %t4341 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-map" to i64), ptr %t4341
  %t4343 = or i64 %t4342, 4
  %t4344 = call i64 @rt_root(i64 %t4343)
  store i64 %t4344, ptr @"scheme.base:string-map"
  ret i64 17
}

define i64 @"scheme.base:__init_139"() {
entry:
  %t4362 = call ptr @rt_alloc_words(i64 1)
  %t4363 = ptrtoint ptr %t4362 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-map1" to i64), ptr %t4362
  %t4364 = or i64 %t4363, 4
  %t4365 = call i64 @rt_root(i64 %t4364)
  store i64 %t4365, ptr @"scheme.base:str-map1"
  ret i64 17
}

define i64 @"scheme.base:__init_140"() {
entry:
  %t4445 = call ptr @rt_alloc_words(i64 1)
  %t4446 = ptrtoint ptr %t4445 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-mapn" to i64), ptr %t4445
  %t4447 = or i64 %t4446, 4
  %t4448 = call i64 @rt_root(i64 %t4447)
  store i64 %t4448, ptr @"scheme.base:str-mapn"
  ret i64 17
}

define i64 @"scheme.base:__init_141"() {
entry:
  %t4597 = call ptr @rt_alloc_words(i64 1)
  %t4598 = ptrtoint ptr %t4597 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-for-each" to i64), ptr %t4597
  %t4599 = or i64 %t4598, 4
  %t4600 = call i64 @rt_root(i64 %t4599)
  store i64 %t4600, ptr @"scheme.base:string-for-each"
  ret i64 17
}

define i64 @"scheme.base:__init_142"() {
entry:
  %t4624 = call ptr @rt_alloc_words(i64 1)
  %t4625 = ptrtoint ptr %t4624 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-min-len" to i64), ptr %t4624
  %t4626 = or i64 %t4625, 4
  %t4627 = call i64 @rt_root(i64 %t4626)
  store i64 %t4627, ptr @"scheme.base:str-min-len"
  ret i64 17
}

define i64 @"scheme.base:__init_143"() {
entry:
  %t4641 = call ptr @rt_alloc_words(i64 1)
  %t4642 = ptrtoint ptr %t4641 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-nth" to i64), ptr %t4641
  %t4643 = or i64 %t4642, 4
  %t4644 = call i64 @rt_root(i64 %t4643)
  store i64 %t4644, ptr @"scheme.base:str-nth"
  ret i64 17
}

define i64 @"scheme.base:__init_144"() {
entry:
  %t4721 = call ptr @rt_alloc_words(i64 1)
  %t4722 = ptrtoint ptr %t4721 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-fill!" to i64), ptr %t4721
  %t4723 = or i64 %t4722, 4
  %t4724 = call i64 @rt_root(i64 %t4723)
  store i64 %t4724, ptr @"scheme.base:string-fill!"
  ret i64 17
}

define i64 @"scheme.base:__init_145"() {
entry:
  %t4955 = call ptr @rt_alloc_words(i64 1)
  %t4956 = ptrtoint ptr %t4955 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-copy!" to i64), ptr %t4955
  %t4957 = or i64 %t4956, 4
  %t4958 = call i64 @rt_root(i64 %t4957)
  store i64 %t4958, ptr @"scheme.base:string-copy!"
  ret i64 17
}

define i64 @"scheme.base:__init_146"() {
entry:
  %t5056 = call ptr @rt_alloc_words(i64 1)
  %t5057 = ptrtoint ptr %t5056 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector-copy" to i64), ptr %t5056
  %t5058 = or i64 %t5057, 4
  %t5059 = call i64 @rt_root(i64 %t5058)
  store i64 %t5059, ptr @"scheme.base:bytevector-copy"
  ret i64 17
}

define i64 @"scheme.base:__init_147"() {
entry:
  %t5290 = call ptr @rt_alloc_words(i64 1)
  %t5291 = ptrtoint ptr %t5290 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector-copy!" to i64), ptr %t5290
  %t5292 = or i64 %t5291, 4
  %t5293 = call i64 @rt_root(i64 %t5292)
  store i64 %t5293, ptr @"scheme.base:bytevector-copy!"
  ret i64 17
}

define i64 @"scheme.base:__init_148"() {
entry:
  %t5416 = call ptr @rt_alloc_words(i64 1)
  %t5417 = ptrtoint ptr %t5416 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector-append" to i64), ptr %t5416
  %t5418 = or i64 %t5417, 4
  %t5419 = call i64 @rt_root(i64 %t5418)
  store i64 %t5419, ptr @"scheme.base:bytevector-append"
  ret i64 17
}

define i64 @"scheme.base:__init_149"() {
entry:
  %t5440 = call ptr @rt_alloc_words(i64 1)
  %t5441 = ptrtoint ptr %t5440 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bv-total" to i64), ptr %t5440
  %t5442 = or i64 %t5441, 4
  %t5443 = call i64 @rt_root(i64 %t5442)
  store i64 %t5443, ptr @"scheme.base:bv-total"
  ret i64 17
}

define i64 @"scheme.base:__init_150"() {
entry:
  %t5444 = call i64 @rt_root(i64 8000000)
  store i64 %t5444, ptr @"scheme.base:rat-max-denom"
  ret i64 17
}

define i64 @"scheme.base:__init_151"() {
entry:
  %t5493 = call ptr @rt_alloc_words(i64 1)
  %t5494 = ptrtoint ptr %t5493 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rationalize" to i64), ptr %t5493
  %t5495 = or i64 %t5494, 4
  %t5496 = call i64 @rt_root(i64 %t5495)
  store i64 %t5496, ptr @"scheme.base:rationalize"
  ret i64 17
}

define i64 @"scheme.base:__init_152"() {
entry:
  %t5613 = call ptr @rt_alloc_words(i64 1)
  %t5614 = ptrtoint ptr %t5613 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-exact" to i64), ptr %t5613
  %t5615 = or i64 %t5614, 4
  %t5616 = call i64 @rt_root(i64 %t5615)
  store i64 %t5616, ptr @"scheme.base:rat-exact"
  ret i64 17
}

define i64 @"scheme.base:__init_153"() {
entry:
  %t5618 = call ptr @rt_alloc_words(i64 1)
  %t5619 = ptrtoint ptr %t5618 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-ceil" to i64), ptr %t5618
  %t5620 = or i64 %t5619, 4
  %t5621 = call i64 @rt_root(i64 %t5620)
  store i64 %t5621, ptr @"scheme.base:rat-ceil"
  ret i64 17
}

define i64 @"scheme.base:__init_154"() {
entry:
  %t5623 = call ptr @rt_alloc_words(i64 1)
  %t5624 = ptrtoint ptr %t5623 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-floor" to i64), ptr %t5623
  %t5625 = or i64 %t5624, 4
  %t5626 = call i64 @rt_root(i64 %t5625)
  store i64 %t5626, ptr @"scheme.base:rat-floor"
  ret i64 17
}

define i64 @"scheme.base:__init_155"() {
entry:
  %t5743 = call ptr @rt_alloc_words(i64 1)
  %t5744 = ptrtoint ptr %t5743 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-inexact" to i64), ptr %t5743
  %t5745 = or i64 %t5744, 4
  %t5746 = call i64 @rt_root(i64 %t5745)
  store i64 %t5746, ptr @"scheme.base:rat-inexact"
  ret i64 17
}

define i64 @"scheme.base:__init_156"() {
entry:
  %t5772 = call ptr @rt_alloc_words(i64 1)
  %t5773 = ptrtoint ptr %t5772 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-num-in" to i64), ptr %t5772
  %t5774 = or i64 %t5773, 4
  %t5775 = call i64 @rt_root(i64 %t5774)
  store i64 %t5775, ptr @"scheme.base:rat-num-in"
  ret i64 17
}

define i64 @"scheme.base:__init_157"() {
entry:
  %t5801 = call ptr @rt_alloc_words(i64 1)
  %t5802 = ptrtoint ptr %t5801 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-ceil-flo" to i64), ptr %t5801
  %t5803 = or i64 %t5802, 4
  %t5804 = call i64 @rt_root(i64 %t5803)
  store i64 %t5804, ptr @"scheme.base:rat-ceil-flo"
  ret i64 17
}

define i64 @"scheme.base:__init_158"() {
entry:
  %t5824 = call ptr @rt_alloc_words(i64 1)
  %t5825 = ptrtoint ptr %t5824 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:values" to i64), ptr %t5824
  %t5826 = or i64 %t5825, 4
  %t5827 = call i64 @rt_root(i64 %t5826)
  store i64 %t5827, ptr @"scheme.base:values"
  ret i64 17
}

define i64 @"scheme.base:__init_159"() {
entry:
  %t5869 = call ptr @rt_alloc_words(i64 1)
  %t5870 = ptrtoint ptr %t5869 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-values" to i64), ptr %t5869
  %t5871 = or i64 %t5870, 4
  %t5872 = call i64 @rt_root(i64 %t5871)
  store i64 %t5872, ptr @"scheme.base:call-with-values"
  ret i64 17
}

define i64 @"scheme.base:__init_160"() {
entry:
  %t5873 = call i64 @rt_root(i64 64)
  store i64 %t5873, ptr @"scheme.base:%ht-initial-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_161"() {
entry:
  %t5874 = call i64 @rt_root(i64 24)
  store i64 %t5874, ptr @"scheme.base:%ht-load-factor"
  ret i64 17
}

define i64 @"scheme.base:__init_162"() {
entry:
  %t5885 = call ptr @rt_alloc_words(i64 1)
  %t5886 = ptrtoint ptr %t5885 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-hash-table" to i64), ptr %t5885
  %t5887 = or i64 %t5886, 4
  %t5888 = call i64 @rt_root(i64 %t5887)
  store i64 %t5888, ptr @"scheme.base:make-hash-table"
  ret i64 17
}

define i64 @"scheme.base:__init_163"() {
entry:
  %t5891 = call ptr @rt_alloc_words(i64 1)
  %t5892 = ptrtoint ptr %t5891 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table?" to i64), ptr %t5891
  %t5893 = or i64 %t5892, 4
  %t5894 = call i64 @rt_root(i64 %t5893)
  store i64 %t5894, ptr @"scheme.base:hash-table?"
  ret i64 17
}

define i64 @"scheme.base:__init_164"() {
entry:
  %t5898 = call ptr @rt_alloc_words(i64 1)
  %t5899 = ptrtoint ptr %t5898 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-count" to i64), ptr %t5898
  %t5900 = or i64 %t5899, 4
  %t5901 = call i64 @rt_root(i64 %t5900)
  store i64 %t5901, ptr @"scheme.base:%ht-count"
  ret i64 17
}

define i64 @"scheme.base:__init_165"() {
entry:
  %t5905 = call ptr @rt_alloc_words(i64 1)
  %t5906 = ptrtoint ptr %t5905 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-buckets" to i64), ptr %t5905
  %t5907 = or i64 %t5906, 4
  %t5908 = call i64 @rt_root(i64 %t5907)
  store i64 %t5908, ptr @"scheme.base:%ht-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_166"() {
entry:
  %t5912 = call ptr @rt_alloc_words(i64 1)
  %t5913 = ptrtoint ptr %t5912 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-count!" to i64), ptr %t5912
  %t5914 = or i64 %t5913, 4
  %t5915 = call i64 @rt_root(i64 %t5914)
  store i64 %t5915, ptr @"scheme.base:%ht-set-count!"
  ret i64 17
}

define i64 @"scheme.base:__init_167"() {
entry:
  %t5919 = call ptr @rt_alloc_words(i64 1)
  %t5920 = ptrtoint ptr %t5919 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-buckets!" to i64), ptr %t5919
  %t5921 = or i64 %t5920, 4
  %t5922 = call i64 @rt_root(i64 %t5921)
  store i64 %t5922, ptr @"scheme.base:%ht-set-buckets!"
  ret i64 17
}

define i64 @"scheme.base:__init_168"() {
entry:
  %t5926 = call ptr @rt_alloc_words(i64 1)
  %t5927 = ptrtoint ptr %t5926 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-index" to i64), ptr %t5926
  %t5928 = or i64 %t5927, 4
  %t5929 = call i64 @rt_root(i64 %t5928)
  store i64 %t5929, ptr @"scheme.base:%ht-index"
  ret i64 17
}

define i64 @"scheme.base:__init_169"() {
entry:
  %t5945 = call ptr @rt_alloc_words(i64 1)
  %t5946 = ptrtoint ptr %t5945 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-assoc" to i64), ptr %t5945
  %t5947 = or i64 %t5946, 4
  %t5948 = call i64 @rt_root(i64 %t5947)
  store i64 %t5948, ptr @"scheme.base:%ht-assoc"
  ret i64 17
}

define i64 @"scheme.base:__init_170"() {
entry:
  %t5966 = call ptr @rt_alloc_words(i64 1)
  %t5967 = ptrtoint ptr %t5966 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-remove" to i64), ptr %t5966
  %t5968 = or i64 %t5967, 4
  %t5969 = call i64 @rt_root(i64 %t5968)
  store i64 %t5969, ptr @"scheme.base:%ht-remove"
  ret i64 17
}

define i64 @"scheme.base:__init_171"() {
entry:
  %t5993 = call ptr @rt_alloc_words(i64 1)
  %t5994 = ptrtoint ptr %t5993 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref/default" to i64), ptr %t5993
  %t5995 = or i64 %t5994, 4
  %t5996 = call i64 @rt_root(i64 %t5995)
  store i64 %t5996, ptr @"scheme.base:hash-table-ref/default"
  ret i64 17
}

define i64 @"scheme.base:__init_172"() {
entry:
  %t6019 = call ptr @rt_alloc_words(i64 1)
  %t6020 = ptrtoint ptr %t6019 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-contains?" to i64), ptr %t6019
  %t6021 = or i64 %t6020, 4
  %t6022 = call i64 @rt_root(i64 %t6021)
  store i64 %t6022, ptr @"scheme.base:hash-table-contains?"
  ret i64 17
}

define i64 @"scheme.base:__init_173"() {
entry:
  %t6053 = call ptr @rt_alloc_words(i64 1)
  %t6054 = ptrtoint ptr %t6053 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref" to i64), ptr %t6053
  %t6055 = or i64 %t6054, 4
  %t6056 = call i64 @rt_root(i64 %t6055)
  store i64 %t6056, ptr @"scheme.base:hash-table-ref"
  ret i64 17
}

define i64 @"scheme.base:__init_174"() {
entry:
  %t6140 = call ptr @rt_alloc_words(i64 1)
  %t6141 = ptrtoint ptr %t6140 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-set!" to i64), ptr %t6140
  %t6142 = or i64 %t6141, 4
  %t6143 = call i64 @rt_root(i64 %t6142)
  store i64 %t6143, ptr @"scheme.base:hash-table-set!"
  ret i64 17
}

define i64 @"scheme.base:__init_175"() {
entry:
  %t6193 = call ptr @rt_alloc_words(i64 1)
  %t6194 = ptrtoint ptr %t6193 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-delete!" to i64), ptr %t6193
  %t6195 = or i64 %t6194, 4
  %t6196 = call i64 @rt_root(i64 %t6195)
  store i64 %t6196, ptr @"scheme.base:hash-table-delete!"
  ret i64 17
}

define i64 @"scheme.base:__init_176"() {
entry:
  %t6300 = call ptr @rt_alloc_words(i64 1)
  %t6301 = ptrtoint ptr %t6300 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-grow!" to i64), ptr %t6300
  %t6302 = or i64 %t6301, 4
  %t6303 = call i64 @rt_root(i64 %t6302)
  store i64 %t6303, ptr @"scheme.base:%ht-grow!"
  ret i64 17
}

define i64 @"scheme.base:__init_177"() {
entry:
  %t6311 = call ptr @rt_alloc_words(i64 1)
  %t6312 = ptrtoint ptr %t6311 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-size" to i64), ptr %t6311
  %t6313 = or i64 %t6312, 4
  %t6314 = call i64 @rt_root(i64 %t6313)
  store i64 %t6314, ptr @"scheme.base:hash-table-size"
  ret i64 17
}

define i64 @"scheme.base:__init_178"() {
entry:
  %t6331 = call ptr @rt_alloc_words(i64 1)
  %t6332 = ptrtoint ptr %t6331 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-fold-buckets" to i64), ptr %t6331
  %t6333 = or i64 %t6332, 4
  %t6334 = call i64 @rt_root(i64 %t6333)
  store i64 %t6334, ptr @"scheme.base:%ht-fold-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_179"() {
entry:
  %t6382 = call ptr @rt_alloc_words(i64 1)
  %t6383 = ptrtoint ptr %t6382 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table->alist" to i64), ptr %t6382
  %t6384 = or i64 %t6383, 4
  %t6385 = call i64 @rt_root(i64 %t6384)
  store i64 %t6385, ptr @"scheme.base:hash-table->alist"
  ret i64 17
}

define i64 @"scheme.base:__init_180"() {
entry:
  %t6404 = call ptr @rt_alloc_words(i64 1)
  %t6405 = ptrtoint ptr %t6404 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-keys" to i64), ptr %t6404
  %t6406 = or i64 %t6405, 4
  %t6407 = call i64 @rt_root(i64 %t6406)
  store i64 %t6407, ptr @"scheme.base:hash-table-keys"
  ret i64 17
}

define i64 @"scheme.base:__init_181"() {
entry:
  %t6426 = call ptr @rt_alloc_words(i64 1)
  %t6427 = ptrtoint ptr %t6426 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-values" to i64), ptr %t6426
  %t6428 = or i64 %t6427, 4
  %t6429 = call i64 @rt_root(i64 %t6428)
  store i64 %t6429, ptr @"scheme.base:hash-table-values"
  ret i64 17
}

define i64 @"scheme.base:__init_182"() {
entry:
  %t6676 = call ptr @rt_alloc_words(i64 1)
  %t6677 = ptrtoint ptr %t6676 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-report" to i64), ptr %t6676
  %t6678 = or i64 %t6677, 4
  %t6679 = call i64 @rt_root(i64 %t6678)
  store i64 %t6679, ptr @"scheme.base:rd-report"
  ret i64 17
}

define i64 @"scheme.base:__init_183"() {
entry:
  %t6701 = call ptr @rt_alloc_words(i64 1)
  %t6702 = ptrtoint ptr %t6701 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-from-string" to i64), ptr %t6701
  %t6703 = or i64 %t6702, 4
  %t6704 = call i64 @rt_root(i64 %t6703)
  store i64 %t6704, ptr @"scheme.base:read-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_184"() {
entry:
  %t6712 = call ptr @rt_alloc_words(i64 1)
  %t6713 = ptrtoint ptr %t6712 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-all-from-string" to i64), ptr %t6712
  %t6714 = or i64 %t6713, 4
  %t6715 = call i64 @rt_root(i64 %t6714)
  store i64 %t6715, ptr @"scheme.base:read-all-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_185"() {
entry:
  %t6723 = call ptr @rt_alloc_words(i64 1)
  %t6724 = ptrtoint ptr %t6723 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-all-from-string-ci" to i64), ptr %t6723
  %t6725 = or i64 %t6724, 4
  %t6726 = call i64 @rt_root(i64 %t6725)
  store i64 %t6726, ptr @"scheme.base:read-all-from-string-ci"
  ret i64 17
}

define i64 @"scheme.base:__init_186"() {
entry:
  %t6833 = call ptr @rt_alloc_words(i64 1)
  %t6834 = ptrtoint ptr %t6833 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-all" to i64), ptr %t6833
  %t6835 = or i64 %t6834, 4
  %t6836 = call i64 @rt_root(i64 %t6835)
  store i64 %t6836, ptr @"scheme.base:rd-all"
  ret i64 17
}

define i64 @"scheme.base:__init_187"() {
entry:
  %t6841 = call ptr @rt_alloc_words(i64 1)
  %t6842 = ptrtoint ptr %t6841 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port?" to i64), ptr %t6841
  %t6843 = or i64 %t6842, 4
  %t6844 = call i64 @rt_root(i64 %t6843)
  store i64 %t6844, ptr @"scheme.base:port?"
  ret i64 17
}

define i64 @"scheme.base:__init_188"() {
entry:
  %t6854 = call ptr @rt_alloc_words(i64 1)
  %t6855 = ptrtoint ptr %t6854 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port?" to i64), ptr %t6854
  %t6856 = or i64 %t6855, 4
  %t6857 = call i64 @rt_root(i64 %t6856)
  store i64 %t6857, ptr @"scheme.base:input-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_189"() {
entry:
  %t6868 = call ptr @rt_alloc_words(i64 1)
  %t6869 = ptrtoint ptr %t6868 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port?" to i64), ptr %t6868
  %t6870 = or i64 %t6869, 4
  %t6871 = call i64 @rt_root(i64 %t6870)
  store i64 %t6871, ptr @"scheme.base:output-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_190"() {
entry:
  %t6879 = call ptr @rt_alloc_words(i64 1)
  %t6880 = ptrtoint ptr %t6879 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:textual-port?" to i64), ptr %t6879
  %t6881 = or i64 %t6880, 4
  %t6882 = call i64 @rt_root(i64 %t6881)
  store i64 %t6882, ptr @"scheme.base:textual-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_191"() {
entry:
  %t6885 = call ptr @rt_alloc_words(i64 1)
  %t6886 = ptrtoint ptr %t6885 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port-closed?" to i64), ptr %t6885
  %t6887 = or i64 %t6886, 4
  %t6888 = call i64 @rt_root(i64 %t6887)
  store i64 %t6888, ptr @"scheme.base:port-closed?"
  ret i64 17
}

define i64 @"scheme.base:__init_192"() {
entry:
  %t6899 = call ptr @rt_alloc_words(i64 1)
  %t6900 = ptrtoint ptr %t6899 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port-open?" to i64), ptr %t6899
  %t6901 = or i64 %t6900, 4
  %t6902 = call i64 @rt_root(i64 %t6901)
  store i64 %t6902, ptr @"scheme.base:input-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_193"() {
entry:
  %t6913 = call ptr @rt_alloc_words(i64 1)
  %t6914 = ptrtoint ptr %t6913 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port-open?" to i64), ptr %t6913
  %t6915 = or i64 %t6914, 4
  %t6916 = call i64 @rt_root(i64 %t6915)
  store i64 %t6916, ptr @"scheme.base:output-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_194"() {
entry:
  %t6942 = call ptr @rt_alloc_words(i64 1)
  %t6943 = ptrtoint ptr %t6942 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-input-port" to i64), ptr %t6942
  %t6944 = or i64 %t6943, 4
  %t6945 = call i64 @rt_root(i64 %t6944)
  store i64 %t6945, ptr @"scheme.base:%check-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_195"() {
entry:
  %t6971 = call ptr @rt_alloc_words(i64 1)
  %t6972 = ptrtoint ptr %t6971 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-output-port" to i64), ptr %t6971
  %t6973 = or i64 %t6972, 4
  %t6974 = call i64 @rt_root(i64 %t6973)
  store i64 %t6974, ptr @"scheme.base:%check-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_196"() {
entry:
  %t6978 = call ptr @rt_alloc_words(i64 1)
  %t6979 = ptrtoint ptr %t6978 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-input-string" to i64), ptr %t6978
  %t6980 = or i64 %t6979, 4
  %t6981 = call i64 @rt_root(i64 %t6980)
  store i64 %t6981, ptr @"scheme.base:open-input-string"
  ret i64 17
}

define i64 @"scheme.base:__init_197"() {
entry:
  %t7002 = call ptr @rt_alloc_words(i64 1)
  %t7003 = ptrtoint ptr %t7002 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%port-at-eof?" to i64), ptr %t7002
  %t7004 = or i64 %t7003, 4
  %t7005 = call i64 @rt_root(i64 %t7004)
  store i64 %t7005, ptr @"scheme.base:%port-at-eof?"
  ret i64 17
}

define i64 @"scheme.base:__init_198"() {
entry:
  %t7035 = call ptr @rt_alloc_words(i64 1)
  %t7036 = ptrtoint ptr %t7035 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-char" to i64), ptr %t7035
  %t7037 = or i64 %t7036, 4
  %t7038 = call i64 @rt_root(i64 %t7037)
  store i64 %t7038, ptr @"scheme.base:read-char"
  ret i64 17
}

define i64 @"scheme.base:__init_199"() {
entry:
  %t7059 = call ptr @rt_alloc_words(i64 1)
  %t7060 = ptrtoint ptr %t7059 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:peek-char" to i64), ptr %t7059
  %t7061 = or i64 %t7060, 4
  %t7062 = call i64 @rt_root(i64 %t7061)
  store i64 %t7062, ptr @"scheme.base:peek-char"
  ret i64 17
}

define i64 @"scheme.base:__init_200"() {
entry:
  %t7180 = call ptr @rt_alloc_words(i64 1)
  %t7181 = ptrtoint ptr %t7180 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-line" to i64), ptr %t7180
  %t7182 = or i64 %t7181, 4
  %t7183 = call i64 @rt_root(i64 %t7182)
  store i64 %t7183, ptr @"scheme.base:read-line"
  ret i64 17
}

define i64 @"scheme.base:__init_201"() {
entry:
  %t7231 = call ptr @rt_alloc_words(i64 1)
  %t7232 = ptrtoint ptr %t7231 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-string" to i64), ptr %t7231
  %t7233 = or i64 %t7232, 4
  %t7234 = call i64 @rt_root(i64 %t7233)
  store i64 %t7234, ptr @"scheme.base:read-string"
  ret i64 17
}

define i64 @"scheme.base:__init_202"() {
entry:
  %t7248 = call ptr @rt_alloc_words(i64 1)
  %t7249 = ptrtoint ptr %t7248 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-output-string" to i64), ptr %t7248
  %t7250 = or i64 %t7249, 4
  %t7251 = call i64 @rt_root(i64 %t7250)
  store i64 %t7251, ptr @"scheme.base:open-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_203"() {
entry:
  %t7282 = call ptr @rt_alloc_words(i64 1)
  %t7283 = ptrtoint ptr %t7282 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:get-output-string" to i64), ptr %t7282
  %t7284 = or i64 %t7283, 4
  %t7285 = call i64 @rt_root(i64 %t7284)
  store i64 %t7285, ptr @"scheme.base:get-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_204"() {
entry:
  %t7296 = call ptr @rt_alloc_words(i64 1)
  %t7297 = ptrtoint ptr %t7296 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:flush-output-port" to i64), ptr %t7296
  %t7298 = or i64 %t7297, 4
  %t7299 = call i64 @rt_root(i64 %t7298)
  store i64 %t7299, ptr @"scheme.base:flush-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_205"() {
entry:
  %t7328 = call ptr @rt_alloc_words(i64 1)
  %t7329 = ptrtoint ptr %t7328 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-port" to i64), ptr %t7328
  %t7330 = or i64 %t7329, 4
  %t7331 = call i64 @rt_root(i64 %t7330)
  store i64 %t7331, ptr @"scheme.base:close-port"
  ret i64 17
}

define i64 @"scheme.base:__init_206"() {
entry:
  %t7354 = call ptr @rt_alloc_words(i64 1)
  %t7355 = ptrtoint ptr %t7354 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-input-port" to i64), ptr %t7354
  %t7356 = or i64 %t7355, 4
  %t7357 = call i64 @rt_root(i64 %t7356)
  store i64 %t7357, ptr @"scheme.base:close-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_207"() {
entry:
  %t7380 = call ptr @rt_alloc_words(i64 1)
  %t7381 = ptrtoint ptr %t7380 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-output-port" to i64), ptr %t7380
  %t7382 = or i64 %t7381, 4
  %t7383 = call i64 @rt_root(i64 %t7382)
  store i64 %t7383, ptr @"scheme.base:close-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_208"() {
entry:
  %t7384 = call i64 @rt_root(i64 1)
  store i64 %t7384, ptr @"scheme.base:%stdout-port"
  ret i64 17
}

define i64 @"scheme.base:__init_209"() {
entry:
  %t7385 = call i64 @rt_root(i64 1)
  store i64 %t7385, ptr @"scheme.base:%stderr-port"
  ret i64 17
}

define i64 @"scheme.base:__init_210"() {
entry:
  %t7386 = call i64 @rt_root(i64 1)
  store i64 %t7386, ptr @"scheme.base:%stdin-port"
  ret i64 17
}

define i64 @"scheme.base:__init_211"() {
entry:
  %t7414 = call ptr @rt_alloc_words(i64 1)
  %t7415 = ptrtoint ptr %t7414 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-output-port" to i64), ptr %t7414
  %t7416 = or i64 %t7415, 4
  %t7417 = call i64 @rt_root(i64 %t7416)
  store i64 %t7417, ptr @"scheme.base:current-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_212"() {
entry:
  %t7442 = call ptr @rt_alloc_words(i64 1)
  %t7443 = ptrtoint ptr %t7442 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-error-port" to i64), ptr %t7442
  %t7444 = or i64 %t7443, 4
  %t7445 = call i64 @rt_root(i64 %t7444)
  store i64 %t7445, ptr @"scheme.base:current-error-port"
  ret i64 17
}

define i64 @"scheme.base:__init_213"() {
entry:
  %t7470 = call ptr @rt_alloc_words(i64 1)
  %t7471 = ptrtoint ptr %t7470 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-input-port" to i64), ptr %t7470
  %t7472 = or i64 %t7471, 4
  %t7473 = call i64 @rt_root(i64 %t7472)
  store i64 %t7473, ptr @"scheme.base:current-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_214"() {
entry:
  %t7520 = call ptr @rt_alloc_words(i64 1)
  %t7521 = ptrtoint ptr %t7520 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-port" to i64), ptr %t7520
  %t7522 = or i64 %t7521, 4
  %t7523 = call i64 @rt_root(i64 %t7522)
  store i64 %t7523, ptr @"scheme.base:call-with-port"
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

