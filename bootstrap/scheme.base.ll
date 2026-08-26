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
declare i64 @rt_eq_hash(i64)
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
declare i64 @rt_write_simple_val(i64)
declare i64 @rt_write_shared_val(i64)
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
declare i64 @rt_port_write_simple(i64, i64)
declare i64 @rt_port_write_shared(i64, i64)
declare i64 @rt_port_newline(i64)
declare i64 @rt_port_write_char(i64, i64)
declare i64 @rt_port_write_string(i64, i64)
declare i64 @rt_command_line()
declare i64 @rt_get_environment_variable(i64)
declare i64 @rt_get_environment_variables()
declare i64 @rt_process_exit(i64)
declare i64 @rt_process_emergency_exit(i64)
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
declare i64 @rt_filesystem_directory_list(i64)
declare i64 @rt_filesystem_directory_status(i64)
declare i64 @rt_filesystem_symlink_status(i64)
declare i64 @rt_filesystem_replace_file(i64, i64)
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
@"scheme.base:unwind-all!" = global i64 0
@"scheme.base:dynamic-wind" = global i64 0
@"scheme.base:call-with-current-continuation" = global i64 0
@"scheme.base:call/cc" = global i64 0
@"scheme.base:with-exception-handler" = global i64 0
@"scheme.base:raise" = global i64 0
@"scheme.base:raise-continuable" = global i64 0
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
@"scheme.base:make-eq-hash-table" = global i64 0
@"scheme.base:hash-table?" = global i64 0
@"scheme.base:%ht-count" = global i64 0
@"scheme.base:%ht-buckets" = global i64 0
@"scheme.base:%ht-identity?" = global i64 0
@"scheme.base:%ht-set-count!" = global i64 0
@"scheme.base:%ht-set-buckets!" = global i64 0
@"scheme.base:%ht-hash" = global i64 0
@"scheme.base:%ht-key=?" = global i64 0
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

define fastcc i64 @"scheme.base:code:unwind-all!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2543 = icmp eq i64 %argc, 0
  br i1 %t2543, label %argok635, label %arityerr634
arityerr634:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok635:
  %t2544 = load i64, ptr @"scheme.base:%unwind-to"
  call void @rt_check_callable(i64 %t2544)
  %t2545 = and i64 %t2544, -8
  %t2546 = inttoptr i64 %t2545 to ptr
  %t2547 = load i64, ptr %t2546
  %t2548 = inttoptr i64 %t2547 to ptr
  %t2549 = musttail call fastcc i64 %t2548(i64 %t2544, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2549
}

define fastcc i64 @"scheme.base:code_489"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2554 = icmp sge i64 %argc, 0
  br i1 %t2554, label %argok637, label %arityerr636
arityerr636:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok637:
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
  %t2565 = load i64, ptr @"scheme.base:*winds*"
  %t2566 = call i64 @rt_cdr(i64 %t2565)
  %t2567 = call i64 @rt_root(i64 %t2566)
  store i64 %t2567, ptr @"scheme.base:*winds*"
  %t2568 = and i64 %self, -8
  %t2569 = inttoptr i64 %t2568 to ptr
  %t2570 = getelementptr i64, ptr %t2569, i64 1
  %t2571 = load i64, ptr %t2570
  call void @rt_check_callable(i64 %t2571)
  %t2572 = and i64 %t2571, -8
  %t2573 = inttoptr i64 %t2572 to ptr
  %t2574 = load i64, ptr %t2573
  %t2575 = inttoptr i64 %t2574 to ptr
  %t2576 = call fastcc i64%t2575(i64 %t2571, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2577 = load i64, ptr @"scheme.base:values"
  call void @rt_check_callable(i64 %t2577)
  %t2578 = and i64 %t2577, -8
  %t2579 = inttoptr i64 %t2578 to ptr
  %t2580 = load i64, ptr %t2579
  %t2581 = inttoptr i64 %t2580 to ptr
  %t2582 = call i64 @rt_list_length(i64 %t2564)
  %t2583 = add i64 0, %t2582
  %t2584 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t2564, i64 8)
  %t2596 = getelementptr i64, ptr %t2584, i64 0
  %t2588 = load i64, ptr %t2596
  %t2597 = getelementptr i64, ptr %t2584, i64 1
  %t2589 = load i64, ptr %t2597
  %t2598 = getelementptr i64, ptr %t2584, i64 2
  %t2590 = load i64, ptr %t2598
  %t2599 = getelementptr i64, ptr %t2584, i64 3
  %t2591 = load i64, ptr %t2599
  %t2600 = getelementptr i64, ptr %t2584, i64 4
  %t2592 = load i64, ptr %t2600
  %t2601 = getelementptr i64, ptr %t2584, i64 5
  %t2593 = load i64, ptr %t2601
  %t2602 = getelementptr i64, ptr %t2584, i64 6
  %t2594 = load i64, ptr %t2602
  %t2603 = getelementptr i64, ptr %t2584, i64 7
  %t2595 = load i64, ptr %t2603
  %t2585 = icmp sgt i64 %t2583, 8
  %t2586 = getelementptr i64, ptr %t2584, i64 8
  %t2587 = select i1 %t2585, ptr %t2586, ptr null
  %t2604 = musttail call fastcc i64 %t2581(i64 %t2577, i64 %t2583, i64 %t2588, i64 %t2589, i64 %t2590, i64 %t2591, i64 %t2592, i64 %t2593, i64 %t2594, i64 %t2595, ptr %t2587)
  ret i64 %t2604
}

define fastcc i64 @"min-entry:$scheme.base$ccode_489"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2605 = load i64, ptr @"scheme.base:*winds*"
  %t2606 = call i64 @rt_cdr(i64 %t2605)
  %t2607 = call i64 @rt_root(i64 %t2606)
  store i64 %t2607, ptr @"scheme.base:*winds*"
  %t2608 = and i64 %self, -8
  %t2609 = inttoptr i64 %t2608 to ptr
  %t2610 = getelementptr i64, ptr %t2609, i64 1
  %t2611 = load i64, ptr %t2610
  call void @rt_check_callable(i64 %t2611)
  %t2612 = and i64 %t2611, -8
  %t2613 = inttoptr i64 %t2612 to ptr
  %t2614 = load i64, ptr %t2613
  %t2615 = inttoptr i64 %t2614 to ptr
  %t2616 = call fastcc i64%t2615(i64 %t2611, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2617 = load i64, ptr @"scheme.base:values"
  call void @rt_check_callable(i64 %t2617)
  %t2618 = and i64 %t2617, -8
  %t2619 = inttoptr i64 %t2618 to ptr
  %t2620 = load i64, ptr %t2619
  %t2621 = inttoptr i64 %t2620 to ptr
  %t2622 = call i64 @rt_list_length(i64 2)
  %t2623 = add i64 0, %t2622
  %t2624 = call ptr @rt_apply_argv(i64 0, ptr null, i64 2, i64 8)
  %t2636 = getelementptr i64, ptr %t2624, i64 0
  %t2628 = load i64, ptr %t2636
  %t2637 = getelementptr i64, ptr %t2624, i64 1
  %t2629 = load i64, ptr %t2637
  %t2638 = getelementptr i64, ptr %t2624, i64 2
  %t2630 = load i64, ptr %t2638
  %t2639 = getelementptr i64, ptr %t2624, i64 3
  %t2631 = load i64, ptr %t2639
  %t2640 = getelementptr i64, ptr %t2624, i64 4
  %t2632 = load i64, ptr %t2640
  %t2641 = getelementptr i64, ptr %t2624, i64 5
  %t2633 = load i64, ptr %t2641
  %t2642 = getelementptr i64, ptr %t2624, i64 6
  %t2634 = load i64, ptr %t2642
  %t2643 = getelementptr i64, ptr %t2624, i64 7
  %t2635 = load i64, ptr %t2643
  %t2625 = icmp sgt i64 %t2623, 8
  %t2626 = getelementptr i64, ptr %t2624, i64 8
  %t2627 = select i1 %t2625, ptr %t2626, ptr null
  %t2644 = musttail call fastcc i64 %t2621(i64 %t2617, i64 %t2623, i64 %t2628, i64 %t2629, i64 %t2630, i64 %t2631, i64 %t2632, i64 %t2633, i64 %t2634, i64 %t2635, ptr %t2627)
  ret i64 %t2644
}

define fastcc i64 @"scheme.base:code:dynamic-wind"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2645 = icmp eq i64 %argc, 3
  br i1 %t2645, label %argok639, label %arityerr638
arityerr638:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok639:
  call void @rt_check_callable(i64 %a0)
  %t2646 = and i64 %a0, -8
  %t2647 = inttoptr i64 %t2646 to ptr
  %t2648 = load i64, ptr %t2647
  %t2649 = inttoptr i64 %t2648 to ptr
  %t2650 = call fastcc i64%t2649(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2651 = call i64 @rt_cons(i64 %a0, i64 %a2)
  %t2652 = load i64, ptr @"scheme.base:*winds*"
  %t2653 = call i64 @rt_cons(i64 %t2651, i64 %t2652)
  %t2654 = call i64 @rt_root(i64 %t2653)
  store i64 %t2654, ptr @"scheme.base:*winds*"
  %t2655 = call ptr @rt_alloc_words(i64 2)
  %t2656 = ptrtoint ptr %t2655 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_489" to i64), ptr %t2655
  %t2657 = getelementptr i64, ptr %t2655, i64 1
  store i64 %a2, ptr %t2657
  %t2658 = or i64 %t2656, 4
  %t2659 = load i64, ptr @"scheme.base:call-with-values"
  call void @rt_check_callable(i64 %t2659)
  %t2660 = and i64 %t2659, -8
  %t2661 = inttoptr i64 %t2660 to ptr
  %t2662 = load i64, ptr %t2661
  %t2663 = inttoptr i64 %t2662 to ptr
  %t2664 = musttail call fastcc i64 %t2663(i64 %t2659, i64 2, i64 %a1, i64 %t2658, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2664
}

define fastcc i64 @"scheme.base:code_498"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2669 = icmp eq i64 %argc, 1
  br i1 %t2669, label %argok641, label %arityerr640
arityerr640:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok641:
  %t2670 = and i64 %self, -8
  %t2671 = inttoptr i64 %t2670 to ptr
  %t2672 = getelementptr i64, ptr %t2671, i64 1
  %t2673 = load i64, ptr %t2672
  %t2674 = call i64 @rt_escape_live_p(i64 %t2673)
  %t2675 = icmp ne i64 %t2674, 1
  br i1 %t2675, label %then642, label %else643
then642:
  %t2676 = and i64 %self, -8
  %t2677 = inttoptr i64 %t2676 to ptr
  %t2678 = getelementptr i64, ptr %t2677, i64 2
  %t2679 = load i64, ptr %t2678
  %t2680 = load i64, ptr @"scheme.base:%unwind-to"
  call void @rt_check_callable(i64 %t2680)
  %t2681 = and i64 %t2680, -8
  %t2682 = inttoptr i64 %t2681 to ptr
  %t2683 = load i64, ptr %t2682
  %t2684 = inttoptr i64 %t2683 to ptr
  %t2685 = call fastcc i64%t2684(i64 %t2680, i64 1, i64 %t2679, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2686 = and i64 %self, -8
  %t2687 = inttoptr i64 %t2686 to ptr
  %t2688 = getelementptr i64, ptr %t2687, i64 1
  %t2689 = load i64, ptr %t2688
  %t2690 = call i64 @rt_escape_to(i64 %t2689, i64 %a0)
  br label %merge644
else643:
  br label %merge644
merge644:
  %t2691 = phi i64 [ %t2690, %then642 ], [ 1, %else643 ]
  %t2692 = call i64 @rt_intern(ptr @.str.sym.17)
  %t2693 = call i64 @rt_make_string(ptr @.str.lit.18, i64 39)
  %t2694 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t2694)
  %t2695 = and i64 %t2694, -8
  %t2696 = inttoptr i64 %t2695 to ptr
  %t2697 = load i64, ptr %t2696
  %t2698 = inttoptr i64 %t2697 to ptr
  %t2699 = musttail call fastcc i64 %t2698(i64 %t2694, i64 2, i64 %t2692, i64 %t2693, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2699
}

define fastcc i64 @"scheme.base:code_496"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2700 = icmp eq i64 %argc, 0
  br i1 %t2700, label %argok646, label %arityerr645
arityerr645:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok646:
  %t2701 = call i64 @rt_escape_frame()
  %t2702 = and i64 %self, -8
  %t2703 = inttoptr i64 %t2702 to ptr
  %t2704 = getelementptr i64, ptr %t2703, i64 2
  %t2705 = load i64, ptr %t2704
  %t2706 = call ptr @rt_alloc_words(i64 3)
  %t2707 = ptrtoint ptr %t2706 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_498" to i64), ptr %t2706
  %t2708 = getelementptr i64, ptr %t2706, i64 1
  store i64 %t2701, ptr %t2708
  %t2709 = getelementptr i64, ptr %t2706, i64 2
  store i64 %t2705, ptr %t2709
  %t2710 = or i64 %t2707, 4
  %t2711 = and i64 %self, -8
  %t2712 = inttoptr i64 %t2711 to ptr
  %t2713 = getelementptr i64, ptr %t2712, i64 1
  %t2714 = load i64, ptr %t2713
  call void @rt_check_callable(i64 %t2714)
  %t2715 = and i64 %t2714, -8
  %t2716 = inttoptr i64 %t2715 to ptr
  %t2717 = load i64, ptr %t2716
  %t2718 = inttoptr i64 %t2717 to ptr
  %t2719 = musttail call fastcc i64 %t2718(i64 %t2714, i64 1, i64 %t2710, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2719
}

define fastcc i64 @"scheme.base:code:call-with-current-continuation"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2720 = icmp eq i64 %argc, 1
  br i1 %t2720, label %argok648, label %arityerr647
arityerr647:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok648:
  %t2721 = load i64, ptr @"scheme.base:*winds*"
  %t2722 = call ptr @rt_alloc_words(i64 3)
  %t2723 = ptrtoint ptr %t2722 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_496" to i64), ptr %t2722
  %t2724 = getelementptr i64, ptr %t2722, i64 1
  store i64 %a0, ptr %t2724
  %t2725 = getelementptr i64, ptr %t2722, i64 2
  store i64 %t2721, ptr %t2725
  %t2726 = or i64 %t2723, 4
  %t2727 = call i64 @rt_run_guarded(ptr @__apply0, i64 %t2726)
  %t2728 = call i64 @rt_cdr(i64 %t2727)
  ret i64 %t2728
}

define fastcc i64 @"scheme.base:code:call/cc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2733 = icmp eq i64 %argc, 1
  br i1 %t2733, label %argok650, label %arityerr649
arityerr649:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok650:
  %t2734 = load i64, ptr @"scheme.base:call-with-current-continuation"
  call void @rt_check_callable(i64 %t2734)
  %t2735 = and i64 %t2734, -8
  %t2736 = inttoptr i64 %t2735 to ptr
  %t2737 = load i64, ptr %t2736
  %t2738 = inttoptr i64 %t2737 to ptr
  %t2739 = musttail call fastcc i64 %t2738(i64 %t2734, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2739
}

define fastcc i64 @"scheme.base:code_506"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2744 = icmp eq i64 %argc, 0
  br i1 %t2744, label %argok652, label %arityerr651
arityerr651:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok652:
  %t2745 = and i64 %self, -8
  %t2746 = inttoptr i64 %t2745 to ptr
  %t2747 = getelementptr i64, ptr %t2746, i64 1
  %t2748 = load i64, ptr %t2747
  %t2749 = and i64 %self, -8
  %t2750 = inttoptr i64 %t2749 to ptr
  %t2751 = getelementptr i64, ptr %t2750, i64 2
  %t2752 = load i64, ptr %t2751
  %t2753 = call i64 @rt_cons(i64 %t2748, i64 %t2752)
  %t2754 = call i64 @rt_root(i64 %t2753)
  store i64 %t2754, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code_508"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2755 = icmp eq i64 %argc, 0
  br i1 %t2755, label %argok654, label %arityerr653
arityerr653:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok654:
  %t2756 = and i64 %self, -8
  %t2757 = inttoptr i64 %t2756 to ptr
  %t2758 = getelementptr i64, ptr %t2757, i64 1
  %t2759 = load i64, ptr %t2758
  %t2760 = call i64 @rt_root(i64 %t2759)
  store i64 %t2760, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code:with-exception-handler"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2761 = icmp eq i64 %argc, 2
  br i1 %t2761, label %argok656, label %arityerr655
arityerr655:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok656:
  %t2762 = load i64, ptr @"scheme.base:*handlers*"
  %t2763 = call ptr @rt_alloc_words(i64 3)
  %t2764 = ptrtoint ptr %t2763 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_506" to i64), ptr %t2763
  %t2765 = getelementptr i64, ptr %t2763, i64 1
  store i64 %a0, ptr %t2765
  %t2766 = getelementptr i64, ptr %t2763, i64 2
  store i64 %t2762, ptr %t2766
  %t2767 = or i64 %t2764, 4
  %t2768 = call ptr @rt_alloc_words(i64 2)
  %t2769 = ptrtoint ptr %t2768 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_508" to i64), ptr %t2768
  %t2770 = getelementptr i64, ptr %t2768, i64 1
  store i64 %t2762, ptr %t2770
  %t2771 = or i64 %t2769, 4
  %t2772 = load i64, ptr @"scheme.base:dynamic-wind"
  call void @rt_check_callable(i64 %t2772)
  %t2773 = and i64 %t2772, -8
  %t2774 = inttoptr i64 %t2773 to ptr
  %t2775 = load i64, ptr %t2774
  %t2776 = inttoptr i64 %t2775 to ptr
  %t2777 = musttail call fastcc i64 %t2776(i64 %t2772, i64 3, i64 %t2767, i64 %a1, i64 %t2771, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2777
}

define fastcc i64 @"scheme.base:code:raise"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2782 = icmp eq i64 %argc, 1
  br i1 %t2782, label %argok658, label %arityerr657
arityerr657:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok658:
  %t2783 = load i64, ptr @"scheme.base:*handlers*"
  %t2784 = call i64 @rt_null_p(i64 %t2783)
  %t2785 = icmp ne i64 %t2784, 1
  br i1 %t2785, label %then659, label %else660
then659:
  %t2786 = call i64 @rt_raise(i64 %a0)
  ret i64 %t2786
else660:
  %t2787 = load i64, ptr @"scheme.base:*handlers*"
  %t2788 = call i64 @rt_car(i64 %t2787)
  %t2789 = load i64, ptr @"scheme.base:*handlers*"
  %t2790 = load i64, ptr @"scheme.base:*handlers*"
  %t2791 = call i64 @rt_cdr(i64 %t2790)
  %t2792 = call i64 @rt_root(i64 %t2791)
  store i64 %t2792, ptr @"scheme.base:*handlers*"
  call void @rt_check_callable(i64 %t2788)
  %t2793 = and i64 %t2788, -8
  %t2794 = inttoptr i64 %t2793 to ptr
  %t2795 = load i64, ptr %t2794
  %t2796 = inttoptr i64 %t2795 to ptr
  %t2797 = call fastcc i64%t2796(i64 %t2788, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2798 = call i64 @rt_root(i64 %t2789)
  store i64 %t2798, ptr @"scheme.base:*handlers*"
  %t2799 = call i64 @rt_raise(i64 %a0)
  ret i64 %t2799
}

define fastcc i64 @"scheme.base:code_518"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2804 = icmp eq i64 %argc, 0
  br i1 %t2804, label %argok662, label %arityerr661
arityerr661:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok662:
  %t2805 = and i64 %self, -8
  %t2806 = inttoptr i64 %t2805 to ptr
  %t2807 = getelementptr i64, ptr %t2806, i64 1
  %t2808 = load i64, ptr %t2807
  %t2809 = call i64 @rt_cdr(i64 %t2808)
  %t2810 = call i64 @rt_root(i64 %t2809)
  store i64 %t2810, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code_520"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2811 = icmp eq i64 %argc, 0
  br i1 %t2811, label %argok664, label %arityerr663
arityerr663:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok664:
  %t2812 = and i64 %self, -8
  %t2813 = inttoptr i64 %t2812 to ptr
  %t2814 = getelementptr i64, ptr %t2813, i64 2
  %t2815 = load i64, ptr %t2814
  %t2816 = and i64 %self, -8
  %t2817 = inttoptr i64 %t2816 to ptr
  %t2818 = getelementptr i64, ptr %t2817, i64 1
  %t2819 = load i64, ptr %t2818
  call void @rt_check_callable(i64 %t2819)
  %t2820 = and i64 %t2819, -8
  %t2821 = inttoptr i64 %t2820 to ptr
  %t2822 = load i64, ptr %t2821
  %t2823 = inttoptr i64 %t2822 to ptr
  %t2824 = musttail call fastcc i64 %t2823(i64 %t2819, i64 1, i64 %t2815, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2824
}

define fastcc i64 @"scheme.base:code_522"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2825 = icmp eq i64 %argc, 0
  br i1 %t2825, label %argok666, label %arityerr665
arityerr665:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok666:
  %t2826 = and i64 %self, -8
  %t2827 = inttoptr i64 %t2826 to ptr
  %t2828 = getelementptr i64, ptr %t2827, i64 1
  %t2829 = load i64, ptr %t2828
  %t2830 = call i64 @rt_root(i64 %t2829)
  store i64 %t2830, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code:raise-continuable"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2831 = icmp eq i64 %argc, 1
  br i1 %t2831, label %argok668, label %arityerr667
arityerr667:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok668:
  %t2832 = load i64, ptr @"scheme.base:*handlers*"
  %t2833 = call i64 @rt_null_p(i64 %t2832)
  %t2834 = icmp ne i64 %t2833, 1
  br i1 %t2834, label %then669, label %else670
then669:
  %t2835 = call i64 @rt_raise(i64 %a0)
  ret i64 %t2835
else670:
  %t2836 = load i64, ptr @"scheme.base:*handlers*"
  %t2837 = call i64 @rt_car(i64 %t2836)
  %t2838 = load i64, ptr @"scheme.base:*handlers*"
  %t2839 = call ptr @rt_alloc_words(i64 2)
  %t2840 = ptrtoint ptr %t2839 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_518" to i64), ptr %t2839
  %t2841 = getelementptr i64, ptr %t2839, i64 1
  store i64 %t2838, ptr %t2841
  %t2842 = or i64 %t2840, 4
  %t2843 = call ptr @rt_alloc_words(i64 3)
  %t2844 = ptrtoint ptr %t2843 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_520" to i64), ptr %t2843
  %t2845 = getelementptr i64, ptr %t2843, i64 1
  store i64 %t2837, ptr %t2845
  %t2846 = getelementptr i64, ptr %t2843, i64 2
  store i64 %a0, ptr %t2846
  %t2847 = or i64 %t2844, 4
  %t2848 = call ptr @rt_alloc_words(i64 2)
  %t2849 = ptrtoint ptr %t2848 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_522" to i64), ptr %t2848
  %t2850 = getelementptr i64, ptr %t2848, i64 1
  store i64 %t2838, ptr %t2850
  %t2851 = or i64 %t2849, 4
  %t2852 = load i64, ptr @"scheme.base:dynamic-wind"
  call void @rt_check_callable(i64 %t2852)
  %t2853 = and i64 %t2852, -8
  %t2854 = inttoptr i64 %t2853 to ptr
  %t2855 = load i64, ptr %t2854
  %t2856 = inttoptr i64 %t2855 to ptr
  %t2857 = musttail call fastcc i64 %t2856(i64 %t2852, i64 3, i64 %t2842, i64 %t2847, i64 %t2851, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2857
}

define fastcc i64 @"scheme.base:code:error-object?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2862 = icmp eq i64 %argc, 1
  br i1 %t2862, label %argok672, label %arityerr671
arityerr671:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok672:
  %t2863 = call i64 @rt_error_object_p(i64 %a0)
  ret i64 %t2863
}

define fastcc i64 @"scheme.base:code:error-object-message"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2868 = icmp eq i64 %argc, 1
  br i1 %t2868, label %argok674, label %arityerr673
arityerr673:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok674:
  %t2869 = call i64 @rt_error_object_message(i64 %a0)
  ret i64 %t2869
}

define fastcc i64 @"scheme.base:code:error-object-irritants"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2874 = icmp eq i64 %argc, 1
  br i1 %t2874, label %argok676, label %arityerr675
arityerr675:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok676:
  %t2875 = call i64 @rt_error_object_irritants(i64 %a0)
  ret i64 %t2875
}

define fastcc i64 @"scheme.base:code:read-error?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2880 = icmp eq i64 %argc, 1
  br i1 %t2880, label %argok678, label %arityerr677
arityerr677:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok678:
  %t2881 = call i64 @rt_error_object_p(i64 %a0)
  %t2882 = icmp ne i64 %t2881, 1
  br i1 %t2882, label %then679, label %else680
then679:
  %t2883 = call i64 @rt_error_object_kind(i64 %a0)
  %t2884 = call i64 @rt_intern(ptr @.str.sym.16)
  %t2885 = call i64 @rt_eq_p(i64 %t2883, i64 %t2884)
  ret i64 %t2885
else680:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:file-error?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2890 = icmp eq i64 %argc, 1
  br i1 %t2890, label %argok682, label %arityerr681
arityerr681:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok682:
  %t2891 = call i64 @rt_error_object_p(i64 %a0)
  %t2892 = icmp ne i64 %t2891, 1
  br i1 %t2892, label %then683, label %else684
then683:
  %t2893 = call i64 @rt_error_object_kind(i64 %a0)
  %t2894 = call i64 @rt_intern(ptr @.str.sym.19)
  %t2895 = call i64 @rt_eq_p(i64 %t2893, i64 %t2894)
  ret i64 %t2895
else684:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_550"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2900 = icmp eq i64 %argc, 1
  br i1 %t2900, label %argok686, label %arityerr685
arityerr685:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok686:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_552"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2901 = icmp eq i64 %argc, 1
  br i1 %t2901, label %argok688, label %arityerr687
arityerr687:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok688:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_554"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2902 = icmp sge i64 %argc, 0
  br i1 %t2902, label %argok690, label %arityerr689
arityerr689:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok690:
  %t2903 = call ptr @rt_alloc_words(i64 8)
  %t2904 = getelementptr i64, ptr %t2903, i64 0
  store i64 %a0, ptr %t2904
  %t2905 = getelementptr i64, ptr %t2903, i64 1
  store i64 %a1, ptr %t2905
  %t2906 = getelementptr i64, ptr %t2903, i64 2
  store i64 %a2, ptr %t2906
  %t2907 = getelementptr i64, ptr %t2903, i64 3
  store i64 %a3, ptr %t2907
  %t2908 = getelementptr i64, ptr %t2903, i64 4
  store i64 %a4, ptr %t2908
  %t2909 = getelementptr i64, ptr %t2903, i64 5
  store i64 %a5, ptr %t2909
  %t2910 = getelementptr i64, ptr %t2903, i64 6
  store i64 %a6, ptr %t2910
  %t2911 = getelementptr i64, ptr %t2903, i64 7
  store i64 %a7, ptr %t2911
  %t2912 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2903, ptr %overflow)
  %t2913 = call i64 @rt_null_p(i64 %t2912)
  %t2914 = icmp ne i64 %t2913, 1
  br i1 %t2914, label %then691, label %else692
then691:
  %t2915 = and i64 %self, -8
  %t2916 = inttoptr i64 %t2915 to ptr
  %t2917 = getelementptr i64, ptr %t2916, i64 1
  %t2918 = load i64, ptr %t2917
  %t2919 = call i64 @rt_vector_ref(i64 %t2918, i64 0)
  ret i64 %t2919
else692:
  %t2920 = call i64 @rt_cdr(i64 %t2912)
  %t2921 = call i64 @rt_null_p(i64 %t2920)
  %t2922 = icmp ne i64 %t2921, 1
  br i1 %t2922, label %then693, label %else694
then693:
  %t2923 = and i64 %self, -8
  %t2924 = inttoptr i64 %t2923 to ptr
  %t2925 = getelementptr i64, ptr %t2924, i64 1
  %t2926 = load i64, ptr %t2925
  %t2927 = call i64 @rt_car(i64 %t2912)
  %t2928 = and i64 %self, -8
  %t2929 = inttoptr i64 %t2928 to ptr
  %t2930 = getelementptr i64, ptr %t2929, i64 2
  %t2931 = load i64, ptr %t2930
  call void @rt_check_callable(i64 %t2931)
  %t2932 = and i64 %t2931, -8
  %t2933 = inttoptr i64 %t2932 to ptr
  %t2934 = load i64, ptr %t2933
  %t2935 = inttoptr i64 %t2934 to ptr
  %t2936 = call fastcc i64%t2935(i64 %t2931, i64 1, i64 %t2927, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2937 = call i64 @rt_vector_set(i64 %t2926, i64 0, i64 %t2936)
  ret i64 %t2937
else694:
  %t2938 = and i64 %self, -8
  %t2939 = inttoptr i64 %t2938 to ptr
  %t2940 = getelementptr i64, ptr %t2939, i64 1
  %t2941 = load i64, ptr %t2940
  %t2942 = call i64 @rt_car(i64 %t2912)
  %t2943 = call i64 @rt_vector_set(i64 %t2941, i64 0, i64 %t2942)
  ret i64 %t2943
}

define fastcc i64 @"min-entry:$scheme.base$ccode_554"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2944 = call i64 @rt_null_p(i64 2)
  %t2945 = icmp ne i64 %t2944, 1
  br i1 %t2945, label %then695, label %else696
then695:
  %t2946 = and i64 %self, -8
  %t2947 = inttoptr i64 %t2946 to ptr
  %t2948 = getelementptr i64, ptr %t2947, i64 1
  %t2949 = load i64, ptr %t2948
  %t2950 = call i64 @rt_vector_ref(i64 %t2949, i64 0)
  ret i64 %t2950
else696:
  %t2951 = call i64 @rt_cdr(i64 2)
  %t2952 = call i64 @rt_null_p(i64 %t2951)
  %t2953 = icmp ne i64 %t2952, 1
  br i1 %t2953, label %then697, label %else698
then697:
  %t2954 = and i64 %self, -8
  %t2955 = inttoptr i64 %t2954 to ptr
  %t2956 = getelementptr i64, ptr %t2955, i64 1
  %t2957 = load i64, ptr %t2956
  %t2958 = call i64 @rt_car(i64 2)
  %t2959 = and i64 %self, -8
  %t2960 = inttoptr i64 %t2959 to ptr
  %t2961 = getelementptr i64, ptr %t2960, i64 2
  %t2962 = load i64, ptr %t2961
  call void @rt_check_callable(i64 %t2962)
  %t2963 = and i64 %t2962, -8
  %t2964 = inttoptr i64 %t2963 to ptr
  %t2965 = load i64, ptr %t2964
  %t2966 = inttoptr i64 %t2965 to ptr
  %t2967 = call fastcc i64%t2966(i64 %t2962, i64 1, i64 %t2958, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2968 = call i64 @rt_vector_set(i64 %t2957, i64 0, i64 %t2967)
  ret i64 %t2968
else698:
  %t2969 = and i64 %self, -8
  %t2970 = inttoptr i64 %t2969 to ptr
  %t2971 = getelementptr i64, ptr %t2970, i64 1
  %t2972 = load i64, ptr %t2971
  %t2973 = call i64 @rt_car(i64 2)
  %t2974 = call i64 @rt_vector_set(i64 %t2972, i64 0, i64 %t2973)
  ret i64 %t2974
}

define fastcc i64 @"scheme.base:code:make-parameter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2975 = icmp sge i64 %argc, 1
  br i1 %t2975, label %argok700, label %arityerr699
arityerr699:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok700:
  %t2976 = call ptr @rt_alloc_words(i64 8)
  %t2977 = getelementptr i64, ptr %t2976, i64 0
  store i64 %a0, ptr %t2977
  %t2978 = getelementptr i64, ptr %t2976, i64 1
  store i64 %a1, ptr %t2978
  %t2979 = getelementptr i64, ptr %t2976, i64 2
  store i64 %a2, ptr %t2979
  %t2980 = getelementptr i64, ptr %t2976, i64 3
  store i64 %a3, ptr %t2980
  %t2981 = getelementptr i64, ptr %t2976, i64 4
  store i64 %a4, ptr %t2981
  %t2982 = getelementptr i64, ptr %t2976, i64 5
  store i64 %a5, ptr %t2982
  %t2983 = getelementptr i64, ptr %t2976, i64 6
  store i64 %a6, ptr %t2983
  %t2984 = getelementptr i64, ptr %t2976, i64 7
  store i64 %a7, ptr %t2984
  %t2985 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t2976, ptr %overflow)
  %t2986 = call i64 @rt_null_p(i64 %t2985)
  %t2987 = icmp ne i64 %t2986, 1
  br i1 %t2987, label %then701, label %else702
then701:
  %t2988 = call ptr @rt_alloc_words(i64 1)
  %t2989 = ptrtoint ptr %t2988 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_550" to i64), ptr %t2988
  %t2990 = or i64 %t2989, 4
  br label %merge703
else702:
  %t2991 = call i64 @rt_car(i64 %t2985)
  br label %merge703
merge703:
  %t2992 = phi i64 [ %t2990, %then701 ], [ %t2991, %else702 ]
  %t2993 = call i64 @rt_make_vector(i64 8, i64 0)
  %t2994 = call i64 @rt_null_p(i64 %t2985)
  %t2995 = icmp ne i64 %t2994, 1
  br i1 %t2995, label %then704, label %else705
then704:
  %t2996 = call ptr @rt_alloc_words(i64 1)
  %t2997 = ptrtoint ptr %t2996 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_552" to i64), ptr %t2996
  %t2998 = or i64 %t2997, 4
  br label %merge706
else705:
  %t2999 = call i64 @rt_car(i64 %t2985)
  br label %merge706
merge706:
  %t3000 = phi i64 [ %t2998, %then704 ], [ %t2999, %else705 ]
  call void @rt_check_callable(i64 %t3000)
  %t3001 = and i64 %t3000, -8
  %t3002 = inttoptr i64 %t3001 to ptr
  %t3003 = load i64, ptr %t3002
  %t3004 = inttoptr i64 %t3003 to ptr
  %t3005 = call fastcc i64%t3004(i64 %t3000, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3006 = call i64 @rt_vector_set(i64 %t2993, i64 0, i64 %t3005)
  %t3007 = call ptr @rt_alloc_words(i64 3)
  %t3008 = ptrtoint ptr %t3007 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_554" to i64), ptr %t3007
  %t3009 = getelementptr i64, ptr %t3007, i64 1
  store i64 %t2993, ptr %t3009
  %t3010 = getelementptr i64, ptr %t3007, i64 2
  store i64 %t2992, ptr %t3010
  %t3011 = or i64 %t3008, 4
  ret i64 %t3011
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cmake-parameter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3012 = call i64 @rt_null_p(i64 2)
  %t3013 = icmp ne i64 %t3012, 1
  br i1 %t3013, label %then707, label %else708
then707:
  %t3014 = call ptr @rt_alloc_words(i64 1)
  %t3015 = ptrtoint ptr %t3014 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_550" to i64), ptr %t3014
  %t3016 = or i64 %t3015, 4
  br label %merge709
else708:
  %t3017 = call i64 @rt_car(i64 2)
  br label %merge709
merge709:
  %t3018 = phi i64 [ %t3016, %then707 ], [ %t3017, %else708 ]
  %t3019 = call i64 @rt_make_vector(i64 8, i64 0)
  %t3020 = call i64 @rt_null_p(i64 2)
  %t3021 = icmp ne i64 %t3020, 1
  br i1 %t3021, label %then710, label %else711
then710:
  %t3022 = call ptr @rt_alloc_words(i64 1)
  %t3023 = ptrtoint ptr %t3022 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_552" to i64), ptr %t3022
  %t3024 = or i64 %t3023, 4
  br label %merge712
else711:
  %t3025 = call i64 @rt_car(i64 2)
  br label %merge712
merge712:
  %t3026 = phi i64 [ %t3024, %then710 ], [ %t3025, %else711 ]
  call void @rt_check_callable(i64 %t3026)
  %t3027 = and i64 %t3026, -8
  %t3028 = inttoptr i64 %t3027 to ptr
  %t3029 = load i64, ptr %t3028
  %t3030 = inttoptr i64 %t3029 to ptr
  %t3031 = call fastcc i64%t3030(i64 %t3026, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3032 = call i64 @rt_vector_set(i64 %t3019, i64 0, i64 %t3031)
  %t3033 = call ptr @rt_alloc_words(i64 3)
  %t3034 = ptrtoint ptr %t3033 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_554" to i64), ptr %t3033
  %t3035 = getelementptr i64, ptr %t3033, i64 1
  store i64 %t3019, ptr %t3035
  %t3036 = getelementptr i64, ptr %t3033, i64 2
  store i64 %t3018, ptr %t3036
  %t3037 = or i64 %t3034, 4
  ret i64 %t3037
}

define fastcc i64 @"scheme.base:code_566"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3042 = icmp eq i64 %argc, 1
  br i1 %t3042, label %argok714, label %arityerr713
arityerr713:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok714:
  call void @rt_check_callable(i64 %a0)
  %t3043 = and i64 %a0, -8
  %t3044 = inttoptr i64 %t3043 to ptr
  %t3045 = load i64, ptr %t3044
  %t3046 = inttoptr i64 %t3045 to ptr
  %t3047 = musttail call fastcc i64 %t3046(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3047
}

define fastcc i64 @"scheme.base:code_570"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3048 = icmp eq i64 %argc, 2
  br i1 %t3048, label %argok716, label %arityerr715
arityerr715:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok716:
  call void @rt_check_callable(i64 %a0)
  %t3049 = and i64 %a0, -8
  %t3050 = inttoptr i64 %t3049 to ptr
  %t3051 = load i64, ptr %t3050
  %t3052 = inttoptr i64 %t3051 to ptr
  %t3053 = musttail call fastcc i64 %t3052(i64 %a0, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3053
}

define fastcc i64 @"scheme.base:code_568"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3054 = icmp eq i64 %argc, 0
  br i1 %t3054, label %argok718, label %arityerr717
arityerr717:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok718:
  %t3055 = call ptr @rt_alloc_words(i64 1)
  %t3056 = ptrtoint ptr %t3055 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_570" to i64), ptr %t3055
  %t3057 = or i64 %t3056, 4
  %t3058 = and i64 %self, -8
  %t3059 = inttoptr i64 %t3058 to ptr
  %t3060 = getelementptr i64, ptr %t3059, i64 1
  %t3061 = load i64, ptr %t3060
  %t3062 = and i64 %self, -8
  %t3063 = inttoptr i64 %t3062 to ptr
  %t3064 = getelementptr i64, ptr %t3063, i64 2
  %t3065 = load i64, ptr %t3064
  %t3066 = load i64, ptr @"scheme.base:for-each"
  call void @rt_check_callable(i64 %t3066)
  %t3067 = and i64 %t3066, -8
  %t3068 = inttoptr i64 %t3067 to ptr
  %t3069 = load i64, ptr %t3068
  %t3070 = inttoptr i64 %t3069 to ptr
  %t3071 = musttail call fastcc i64 %t3070(i64 %t3066, i64 3, i64 %t3057, i64 %t3061, i64 %t3065, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3071
}

define fastcc i64 @"scheme.base:code_574"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3072 = icmp eq i64 %argc, 2
  br i1 %t3072, label %argok720, label %arityerr719
arityerr719:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok720:
  call void @rt_check_callable(i64 %a0)
  %t3073 = and i64 %a0, -8
  %t3074 = inttoptr i64 %t3073 to ptr
  %t3075 = load i64, ptr %t3074
  %t3076 = inttoptr i64 %t3075 to ptr
  %t3077 = musttail call fastcc i64 %t3076(i64 %a0, i64 2, i64 %a1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3077
}

define fastcc i64 @"scheme.base:code_572"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3078 = icmp eq i64 %argc, 0
  br i1 %t3078, label %argok722, label %arityerr721
arityerr721:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok722:
  %t3079 = call ptr @rt_alloc_words(i64 1)
  %t3080 = ptrtoint ptr %t3079 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_574" to i64), ptr %t3079
  %t3081 = or i64 %t3080, 4
  %t3082 = and i64 %self, -8
  %t3083 = inttoptr i64 %t3082 to ptr
  %t3084 = getelementptr i64, ptr %t3083, i64 1
  %t3085 = load i64, ptr %t3084
  %t3086 = and i64 %self, -8
  %t3087 = inttoptr i64 %t3086 to ptr
  %t3088 = getelementptr i64, ptr %t3087, i64 2
  %t3089 = load i64, ptr %t3088
  %t3090 = load i64, ptr @"scheme.base:for-each"
  call void @rt_check_callable(i64 %t3090)
  %t3091 = and i64 %t3090, -8
  %t3092 = inttoptr i64 %t3091 to ptr
  %t3093 = load i64, ptr %t3092
  %t3094 = inttoptr i64 %t3093 to ptr
  %t3095 = musttail call fastcc i64 %t3094(i64 %t3090, i64 3, i64 %t3081, i64 %t3085, i64 %t3089, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3095
}

define fastcc i64 @"scheme.base:code:with-parameters"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3096 = icmp eq i64 %argc, 3
  br i1 %t3096, label %argok724, label %arityerr723
arityerr723:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok724:
  %t3097 = call ptr @rt_alloc_words(i64 1)
  %t3098 = ptrtoint ptr %t3097 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_566" to i64), ptr %t3097
  %t3099 = or i64 %t3098, 4
  %t3100 = load i64, ptr @"scheme.base:map"
  call void @rt_check_callable(i64 %t3100)
  %t3101 = and i64 %t3100, -8
  %t3102 = inttoptr i64 %t3101 to ptr
  %t3103 = load i64, ptr %t3102
  %t3104 = inttoptr i64 %t3103 to ptr
  %t3105 = call fastcc i64%t3104(i64 %t3100, i64 2, i64 %t3099, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3106 = call ptr @rt_alloc_words(i64 3)
  %t3107 = ptrtoint ptr %t3106 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_568" to i64), ptr %t3106
  %t3108 = getelementptr i64, ptr %t3106, i64 1
  store i64 %a0, ptr %t3108
  %t3109 = getelementptr i64, ptr %t3106, i64 2
  store i64 %a1, ptr %t3109
  %t3110 = or i64 %t3107, 4
  %t3111 = call ptr @rt_alloc_words(i64 3)
  %t3112 = ptrtoint ptr %t3111 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_572" to i64), ptr %t3111
  %t3113 = getelementptr i64, ptr %t3111, i64 1
  store i64 %a0, ptr %t3113
  %t3114 = getelementptr i64, ptr %t3111, i64 2
  store i64 %t3105, ptr %t3114
  %t3115 = or i64 %t3112, 4
  %t3116 = load i64, ptr @"scheme.base:dynamic-wind"
  call void @rt_check_callable(i64 %t3116)
  %t3117 = and i64 %t3116, -8
  %t3118 = inttoptr i64 %t3117 to ptr
  %t3119 = load i64, ptr %t3118
  %t3120 = inttoptr i64 %t3119 to ptr
  %t3121 = musttail call fastcc i64 %t3120(i64 %t3116, i64 3, i64 %t3110, i64 %a2, i64 %t3115, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3121
}

define fastcc i64 @"scheme.base:code_582"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3126 = icmp eq i64 %argc, 2
  br i1 %t3126, label %argok726, label %arityerr725
arityerr725:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok726:
  %t3127 = call i64 @rt_null_p(i64 %a0)
  %t3128 = icmp ne i64 %t3127, 1
  br i1 %t3128, label %then727, label %else728
then727:
  %t3129 = and i64 %self, -8
  %t3130 = inttoptr i64 %t3129 to ptr
  %t3131 = getelementptr i64, ptr %t3130, i64 1
  %t3132 = load i64, ptr %t3131
  ret i64 %t3132
else728:
  %t3133 = and i64 %self, -8
  %t3134 = inttoptr i64 %t3133 to ptr
  %t3135 = getelementptr i64, ptr %t3134, i64 1
  %t3136 = load i64, ptr %t3135
  %t3137 = call i64 @rt_car(i64 %a0)
  %t3138 = call i64 @rt_vector_set(i64 %t3136, i64 %a1, i64 %t3137)
  %t3139 = call i64 @rt_cdr(i64 %a0)
  %t3140 = or i64 %a1, 8
  %t3141 = and i64 %t3140, 7
  %t3142 = icmp eq i64 %t3141, 0
  br i1 %t3142, label %fixfast729, label %fixslow730
fixfast729:
  %t3143 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t3144 = extractvalue {i64, i1} %t3143, 0
  %t3145 = extractvalue {i64, i1} %t3143, 1
  br i1 %t3145, label %fixslow730, label %fixmerge731
fixslow730:
  %t3146 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge731
fixmerge731:
  %t3147 = phi i64 [ %t3144, %fixfast729 ], [ %t3146, %fixslow730 ]
  %t3148 = musttail call fastcc i64 @"scheme.base:code_582"(i64 %self, i64 2, i64 %t3139, i64 %t3147, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3148
}

define fastcc i64 @"scheme.base:code:list->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3149 = icmp eq i64 %argc, 1
  br i1 %t3149, label %argok733, label %arityerr732
arityerr732:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok733:
  %t3150 = load i64, ptr @"scheme.base:length"
  call void @rt_check_callable(i64 %t3150)
  %t3151 = and i64 %t3150, -8
  %t3152 = inttoptr i64 %t3151 to ptr
  %t3153 = load i64, ptr %t3152
  %t3154 = inttoptr i64 %t3153 to ptr
  %t3155 = call fastcc i64%t3154(i64 %t3150, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3156 = call i64 @rt_make_vector(i64 %t3155, i64 0)
  %t3157 = call ptr @rt_alloc_words(i64 3)
  %t3158 = ptrtoint ptr %t3157 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_582" to i64), ptr %t3157
  %t3159 = or i64 %t3158, 4
  %t3160 = getelementptr i64, ptr %t3157, i64 1
  store i64 %t3156, ptr %t3160
  %t3161 = getelementptr i64, ptr %t3157, i64 2
  store i64 %t3159, ptr %t3161
  %t3162 = musttail call fastcc i64 @"scheme.base:code_582"(i64 %t3159, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3162
}

define fastcc i64 @"scheme.base:code:vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3167 = icmp sge i64 %argc, 0
  br i1 %t3167, label %argok735, label %arityerr734
arityerr734:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok735:
  %t3168 = call ptr @rt_alloc_words(i64 8)
  %t3169 = getelementptr i64, ptr %t3168, i64 0
  store i64 %a0, ptr %t3169
  %t3170 = getelementptr i64, ptr %t3168, i64 1
  store i64 %a1, ptr %t3170
  %t3171 = getelementptr i64, ptr %t3168, i64 2
  store i64 %a2, ptr %t3171
  %t3172 = getelementptr i64, ptr %t3168, i64 3
  store i64 %a3, ptr %t3172
  %t3173 = getelementptr i64, ptr %t3168, i64 4
  store i64 %a4, ptr %t3173
  %t3174 = getelementptr i64, ptr %t3168, i64 5
  store i64 %a5, ptr %t3174
  %t3175 = getelementptr i64, ptr %t3168, i64 6
  store i64 %a6, ptr %t3175
  %t3176 = getelementptr i64, ptr %t3168, i64 7
  store i64 %a7, ptr %t3176
  %t3177 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t3168, ptr %overflow)
  %t3178 = load i64, ptr @"scheme.base:list->vector"
  call void @rt_check_callable(i64 %t3178)
  %t3179 = and i64 %t3178, -8
  %t3180 = inttoptr i64 %t3179 to ptr
  %t3181 = load i64, ptr %t3180
  %t3182 = inttoptr i64 %t3181 to ptr
  %t3183 = musttail call fastcc i64 %t3182(i64 %t3178, i64 1, i64 %t3177, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3183
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3184 = load i64, ptr @"scheme.base:list->vector"
  call void @rt_check_callable(i64 %t3184)
  %t3185 = and i64 %t3184, -8
  %t3186 = inttoptr i64 %t3185 to ptr
  %t3187 = load i64, ptr %t3186
  %t3188 = inttoptr i64 %t3187 to ptr
  %t3189 = musttail call fastcc i64 %t3188(i64 %t3184, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3189
}

define fastcc i64 @"scheme.base:code_592"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3194 = icmp eq i64 %argc, 2
  br i1 %t3194, label %argok737, label %arityerr736
arityerr736:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok737:
  %t3195 = call i64 @rt_null_p(i64 %a0)
  %t3196 = icmp ne i64 %t3195, 1
  br i1 %t3196, label %then738, label %else739
then738:
  %t3197 = and i64 %self, -8
  %t3198 = inttoptr i64 %t3197 to ptr
  %t3199 = getelementptr i64, ptr %t3198, i64 1
  %t3200 = load i64, ptr %t3199
  ret i64 %t3200
else739:
  %t3201 = and i64 %self, -8
  %t3202 = inttoptr i64 %t3201 to ptr
  %t3203 = getelementptr i64, ptr %t3202, i64 1
  %t3204 = load i64, ptr %t3203
  %t3205 = call i64 @rt_car(i64 %a0)
  %t3206 = call i64 @rt_bytevector_u8_set(i64 %t3204, i64 %a1, i64 %t3205)
  %t3207 = call i64 @rt_cdr(i64 %a0)
  %t3208 = or i64 %a1, 8
  %t3209 = and i64 %t3208, 7
  %t3210 = icmp eq i64 %t3209, 0
  br i1 %t3210, label %fixfast740, label %fixslow741
fixfast740:
  %t3211 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t3212 = extractvalue {i64, i1} %t3211, 0
  %t3213 = extractvalue {i64, i1} %t3211, 1
  br i1 %t3213, label %fixslow741, label %fixmerge742
fixslow741:
  %t3214 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge742
fixmerge742:
  %t3215 = phi i64 [ %t3212, %fixfast740 ], [ %t3214, %fixslow741 ]
  %t3216 = musttail call fastcc i64 @"scheme.base:code_592"(i64 %self, i64 2, i64 %t3207, i64 %t3215, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3216
}

define fastcc i64 @"scheme.base:code:list->bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3217 = icmp eq i64 %argc, 1
  br i1 %t3217, label %argok744, label %arityerr743
arityerr743:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok744:
  %t3218 = load i64, ptr @"scheme.base:length"
  call void @rt_check_callable(i64 %t3218)
  %t3219 = and i64 %t3218, -8
  %t3220 = inttoptr i64 %t3219 to ptr
  %t3221 = load i64, ptr %t3220
  %t3222 = inttoptr i64 %t3221 to ptr
  %t3223 = call fastcc i64%t3222(i64 %t3218, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3224 = call i64 @rt_make_bytevector(i64 %t3223, i64 0)
  %t3225 = call ptr @rt_alloc_words(i64 3)
  %t3226 = ptrtoint ptr %t3225 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_592" to i64), ptr %t3225
  %t3227 = or i64 %t3226, 4
  %t3228 = getelementptr i64, ptr %t3225, i64 1
  store i64 %t3224, ptr %t3228
  %t3229 = getelementptr i64, ptr %t3225, i64 2
  store i64 %t3227, ptr %t3229
  %t3230 = musttail call fastcc i64 @"scheme.base:code_592"(i64 %t3227, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3230
}

define fastcc i64 @"scheme.base:code:bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3235 = icmp sge i64 %argc, 0
  br i1 %t3235, label %argok746, label %arityerr745
arityerr745:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok746:
  %t3236 = call ptr @rt_alloc_words(i64 8)
  %t3237 = getelementptr i64, ptr %t3236, i64 0
  store i64 %a0, ptr %t3237
  %t3238 = getelementptr i64, ptr %t3236, i64 1
  store i64 %a1, ptr %t3238
  %t3239 = getelementptr i64, ptr %t3236, i64 2
  store i64 %a2, ptr %t3239
  %t3240 = getelementptr i64, ptr %t3236, i64 3
  store i64 %a3, ptr %t3240
  %t3241 = getelementptr i64, ptr %t3236, i64 4
  store i64 %a4, ptr %t3241
  %t3242 = getelementptr i64, ptr %t3236, i64 5
  store i64 %a5, ptr %t3242
  %t3243 = getelementptr i64, ptr %t3236, i64 6
  store i64 %a6, ptr %t3243
  %t3244 = getelementptr i64, ptr %t3236, i64 7
  store i64 %a7, ptr %t3244
  %t3245 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t3236, ptr %overflow)
  %t3246 = load i64, ptr @"scheme.base:list->bytevector"
  call void @rt_check_callable(i64 %t3246)
  %t3247 = and i64 %t3246, -8
  %t3248 = inttoptr i64 %t3247 to ptr
  %t3249 = load i64, ptr %t3248
  %t3250 = inttoptr i64 %t3249 to ptr
  %t3251 = musttail call fastcc i64 %t3250(i64 %t3246, i64 1, i64 %t3245, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3251
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cbytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3252 = load i64, ptr @"scheme.base:list->bytevector"
  call void @rt_check_callable(i64 %t3252)
  %t3253 = and i64 %t3252, -8
  %t3254 = inttoptr i64 %t3253 to ptr
  %t3255 = load i64, ptr %t3254
  %t3256 = inttoptr i64 %t3255 to ptr
  %t3257 = musttail call fastcc i64 %t3256(i64 %t3252, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3257
}

define fastcc i64 @"scheme.base:code:rng-start"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3262 = icmp eq i64 %argc, 1
  br i1 %t3262, label %argok748, label %arityerr747
arityerr747:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok748:
  %t3263 = call i64 @rt_pair_p(i64 %a0)
  %t3264 = icmp ne i64 %t3263, 1
  br i1 %t3264, label %then749, label %else750
then749:
  %t3265 = call i64 @rt_car(i64 %a0)
  ret i64 %t3265
else750:
  ret i64 0
}

define fastcc i64 @"scheme.base:code:rng-end"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3270 = icmp eq i64 %argc, 2
  br i1 %t3270, label %argok752, label %arityerr751
arityerr751:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok752:
  %t3271 = call i64 @rt_pair_p(i64 %a0)
  %t3272 = icmp ne i64 %t3271, 1
  br i1 %t3272, label %then753, label %else754
then753:
  %t3273 = call i64 @rt_cdr(i64 %a0)
  %t3274 = call i64 @rt_pair_p(i64 %t3273)
  br label %merge755
else754:
  br label %merge755
merge755:
  %t3275 = phi i64 [ %t3274, %then753 ], [ 1, %else754 ]
  %t3276 = icmp ne i64 %t3275, 1
  br i1 %t3276, label %then756, label %else757
then756:
  %t3277 = call i64 @rt_cdr(i64 %a0)
  %t3278 = call i64 @rt_car(i64 %t3277)
  ret i64 %t3278
else757:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:rng-check"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3283 = icmp eq i64 %argc, 4
  br i1 %t3283, label %argok759, label %arityerr758
arityerr758:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok759:
  %t3284 = or i64 0, %a1
  %t3285 = and i64 %t3284, 7
  %t3286 = icmp eq i64 %t3285, 0
  br i1 %t3286, label %fixfast760, label %fixslow761
fixfast760:
  %t3287 = icmp slt i64 0, %a1
  %t3288 = select i1 %t3287, i64 257, i64 1
  br label %fixmerge762
fixslow761:
  %t3289 = call i64 @rt_lt(i64 0, i64 %a1)
  br label %fixmerge762
fixmerge762:
  %t3290 = phi i64 [ %t3288, %fixfast760 ], [ %t3289, %fixslow761 ]
  %t3291 = icmp ne i64 %t3290, 1
  br i1 %t3291, label %then763, label %else764
then763:
  br label %merge765
else764:
  %t3292 = or i64 0, %a1
  %t3293 = and i64 %t3292, 7
  %t3294 = icmp eq i64 %t3293, 0
  br i1 %t3294, label %fixfast766, label %fixslow767
fixfast766:
  %t3295 = icmp eq i64 0, %a1
  %t3296 = select i1 %t3295, i64 257, i64 1
  br label %fixmerge768
fixslow767:
  %t3297 = call i64 @rt_num_eq(i64 0, i64 %a1)
  br label %fixmerge768
fixmerge768:
  %t3298 = phi i64 [ %t3296, %fixfast766 ], [ %t3297, %fixslow767 ]
  br label %merge765
merge765:
  %t3299 = phi i64 [ 257, %then763 ], [ %t3298, %fixmerge768 ]
  %t3300 = icmp ne i64 %t3299, 1
  br i1 %t3300, label %then769, label %else770
then769:
  %t3301 = or i64 %a1, %a2
  %t3302 = and i64 %t3301, 7
  %t3303 = icmp eq i64 %t3302, 0
  br i1 %t3303, label %fixfast772, label %fixslow773
fixfast772:
  %t3304 = icmp slt i64 %a1, %a2
  %t3305 = select i1 %t3304, i64 257, i64 1
  br label %fixmerge774
fixslow773:
  %t3306 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge774
fixmerge774:
  %t3307 = phi i64 [ %t3305, %fixfast772 ], [ %t3306, %fixslow773 ]
  %t3308 = icmp ne i64 %t3307, 1
  br i1 %t3308, label %then775, label %else776
then775:
  br label %merge777
else776:
  %t3309 = or i64 %a1, %a2
  %t3310 = and i64 %t3309, 7
  %t3311 = icmp eq i64 %t3310, 0
  br i1 %t3311, label %fixfast778, label %fixslow779
fixfast778:
  %t3312 = icmp eq i64 %a1, %a2
  %t3313 = select i1 %t3312, i64 257, i64 1
  br label %fixmerge780
fixslow779:
  %t3314 = call i64 @rt_num_eq(i64 %a1, i64 %a2)
  br label %fixmerge780
fixmerge780:
  %t3315 = phi i64 [ %t3313, %fixfast778 ], [ %t3314, %fixslow779 ]
  br label %merge777
merge777:
  %t3316 = phi i64 [ 257, %then775 ], [ %t3315, %fixmerge780 ]
  %t3317 = icmp ne i64 %t3316, 1
  br i1 %t3317, label %then781, label %else782
then781:
  %t3318 = or i64 %a2, %a3
  %t3319 = and i64 %t3318, 7
  %t3320 = icmp eq i64 %t3319, 0
  br i1 %t3320, label %fixfast784, label %fixslow785
fixfast784:
  %t3321 = icmp slt i64 %a2, %a3
  %t3322 = select i1 %t3321, i64 257, i64 1
  br label %fixmerge786
fixslow785:
  %t3323 = call i64 @rt_lt(i64 %a2, i64 %a3)
  br label %fixmerge786
fixmerge786:
  %t3324 = phi i64 [ %t3322, %fixfast784 ], [ %t3323, %fixslow785 ]
  %t3325 = icmp ne i64 %t3324, 1
  br i1 %t3325, label %then787, label %else788
then787:
  br label %merge789
else788:
  %t3326 = or i64 %a2, %a3
  %t3327 = and i64 %t3326, 7
  %t3328 = icmp eq i64 %t3327, 0
  br i1 %t3328, label %fixfast790, label %fixslow791
fixfast790:
  %t3329 = icmp eq i64 %a2, %a3
  %t3330 = select i1 %t3329, i64 257, i64 1
  br label %fixmerge792
fixslow791:
  %t3331 = call i64 @rt_num_eq(i64 %a2, i64 %a3)
  br label %fixmerge792
fixmerge792:
  %t3332 = phi i64 [ %t3330, %fixfast790 ], [ %t3331, %fixslow791 ]
  br label %merge789
merge789:
  %t3333 = phi i64 [ 257, %then787 ], [ %t3332, %fixmerge792 ]
  br label %merge783
else782:
  br label %merge783
merge783:
  %t3334 = phi i64 [ %t3333, %merge789 ], [ 1, %else782 ]
  br label %merge771
else770:
  br label %merge771
merge771:
  %t3335 = phi i64 [ %t3334, %merge783 ], [ 1, %else770 ]
  %t3336 = icmp ne i64 %t3335, 1
  br i1 %t3336, label %then793, label %else794
then793:
  ret i64 257
else794:
  %t3337 = call i64 @rt_make_string(ptr @.str.lit.20, i64 19)
  %t3338 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t3338)
  %t3339 = and i64 %t3338, -8
  %t3340 = inttoptr i64 %t3339 to ptr
  %t3341 = load i64, ptr %t3340
  %t3342 = inttoptr i64 %t3341 to ptr
  %t3343 = musttail call fastcc i64 %t3342(i64 %t3338, i64 5, i64 %t3337, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3343
}

define fastcc i64 @"scheme.base:code:assv"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3348 = icmp eq i64 %argc, 2
  br i1 %t3348, label %argok796, label %arityerr795
arityerr795:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok796:
  %t3349 = call i64 @rt_null_p(i64 %a1)
  %t3350 = icmp ne i64 %t3349, 1
  br i1 %t3350, label %then797, label %else798
then797:
  ret i64 1
else798:
  %t3351 = call i64 @rt_car(i64 %a1)
  %t3352 = call i64 @rt_car(i64 %t3351)
  %t3353 = call i64 @rt_eqv_p(i64 %a0, i64 %t3352)
  %t3354 = icmp ne i64 %t3353, 1
  br i1 %t3354, label %then799, label %else800
then799:
  %t3355 = call i64 @rt_car(i64 %a1)
  ret i64 %t3355
else800:
  %t3356 = call i64 @rt_cdr(i64 %a1)
  %t3357 = load i64, ptr @"scheme.base:assv"
  call void @rt_check_callable(i64 %t3357)
  %t3358 = and i64 %t3357, -8
  %t3359 = inttoptr i64 %t3358 to ptr
  %t3360 = load i64, ptr %t3359
  %t3361 = inttoptr i64 %t3360 to ptr
  %t3362 = musttail call fastcc i64 %t3361(i64 %t3357, i64 2, i64 %a0, i64 %t3356, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3362
}

define fastcc i64 @"scheme.base:code:list-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3367 = icmp eq i64 %argc, 1
  br i1 %t3367, label %argok802, label %arityerr801
arityerr801:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok802:
  %t3368 = call i64 @rt_pair_p(i64 %a0)
  %t3369 = icmp ne i64 %t3368, 1
  br i1 %t3369, label %then803, label %else804
then803:
  %t3370 = call i64 @rt_car(i64 %a0)
  %t3371 = call i64 @rt_cdr(i64 %a0)
  %t3372 = load i64, ptr @"scheme.base:list-copy"
  call void @rt_check_callable(i64 %t3372)
  %t3373 = and i64 %t3372, -8
  %t3374 = inttoptr i64 %t3373 to ptr
  %t3375 = load i64, ptr %t3374
  %t3376 = inttoptr i64 %t3375 to ptr
  %t3377 = call fastcc i64%t3376(i64 %t3372, i64 1, i64 %t3371, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3378 = call i64 @rt_cons(i64 %t3370, i64 %t3377)
  ret i64 %t3378
else804:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:boolean=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3383 = icmp sge i64 %argc, 2
  br i1 %t3383, label %argok806, label %arityerr805
arityerr805:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok806:
  %t3384 = call ptr @rt_alloc_words(i64 8)
  %t3385 = getelementptr i64, ptr %t3384, i64 0
  store i64 %a0, ptr %t3385
  %t3386 = getelementptr i64, ptr %t3384, i64 1
  store i64 %a1, ptr %t3386
  %t3387 = getelementptr i64, ptr %t3384, i64 2
  store i64 %a2, ptr %t3387
  %t3388 = getelementptr i64, ptr %t3384, i64 3
  store i64 %a3, ptr %t3388
  %t3389 = getelementptr i64, ptr %t3384, i64 4
  store i64 %a4, ptr %t3389
  %t3390 = getelementptr i64, ptr %t3384, i64 5
  store i64 %a5, ptr %t3390
  %t3391 = getelementptr i64, ptr %t3384, i64 6
  store i64 %a6, ptr %t3391
  %t3392 = getelementptr i64, ptr %t3384, i64 7
  store i64 %a7, ptr %t3392
  %t3393 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3384, ptr %overflow)
  %t3394 = call i64 @rt_cons(i64 %a1, i64 %t3393)
  %t3395 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t3395)
  %t3396 = and i64 %t3395, -8
  %t3397 = inttoptr i64 %t3396 to ptr
  %t3398 = load i64, ptr %t3397
  %t3399 = inttoptr i64 %t3398 to ptr
  %t3400 = musttail call fastcc i64 %t3399(i64 %t3395, i64 2, i64 %a0, i64 %t3394, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3400
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cboolean=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3401 = call i64 @rt_cons(i64 %a1, i64 2)
  %t3402 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t3402)
  %t3403 = and i64 %t3402, -8
  %t3404 = inttoptr i64 %t3403 to ptr
  %t3405 = load i64, ptr %t3404
  %t3406 = inttoptr i64 %t3405 to ptr
  %t3407 = musttail call fastcc i64 %t3406(i64 %t3402, i64 2, i64 %a0, i64 %t3401, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3407
}

define fastcc i64 @"scheme.base:code:symbol=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3412 = icmp sge i64 %argc, 2
  br i1 %t3412, label %argok808, label %arityerr807
arityerr807:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok808:
  %t3413 = call ptr @rt_alloc_words(i64 8)
  %t3414 = getelementptr i64, ptr %t3413, i64 0
  store i64 %a0, ptr %t3414
  %t3415 = getelementptr i64, ptr %t3413, i64 1
  store i64 %a1, ptr %t3415
  %t3416 = getelementptr i64, ptr %t3413, i64 2
  store i64 %a2, ptr %t3416
  %t3417 = getelementptr i64, ptr %t3413, i64 3
  store i64 %a3, ptr %t3417
  %t3418 = getelementptr i64, ptr %t3413, i64 4
  store i64 %a4, ptr %t3418
  %t3419 = getelementptr i64, ptr %t3413, i64 5
  store i64 %a5, ptr %t3419
  %t3420 = getelementptr i64, ptr %t3413, i64 6
  store i64 %a6, ptr %t3420
  %t3421 = getelementptr i64, ptr %t3413, i64 7
  store i64 %a7, ptr %t3421
  %t3422 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3413, ptr %overflow)
  %t3423 = call i64 @rt_cons(i64 %a1, i64 %t3422)
  %t3424 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t3424)
  %t3425 = and i64 %t3424, -8
  %t3426 = inttoptr i64 %t3425 to ptr
  %t3427 = load i64, ptr %t3426
  %t3428 = inttoptr i64 %t3427 to ptr
  %t3429 = musttail call fastcc i64 %t3428(i64 %t3424, i64 2, i64 %a0, i64 %t3423, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3429
}

define fastcc i64 @"min-entry:$scheme.base$ccode$csymbol=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3430 = call i64 @rt_cons(i64 %a1, i64 2)
  %t3431 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t3431)
  %t3432 = and i64 %t3431, -8
  %t3433 = inttoptr i64 %t3432 to ptr
  %t3434 = load i64, ptr %t3433
  %t3435 = inttoptr i64 %t3434 to ptr
  %t3436 = musttail call fastcc i64 %t3435(i64 %t3431, i64 2, i64 %a0, i64 %t3430, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3436
}

define fastcc i64 @"scheme.base:code:eqv-chain?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3441 = icmp eq i64 %argc, 2
  br i1 %t3441, label %argok810, label %arityerr809
arityerr809:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok810:
  %t3442 = call i64 @rt_null_p(i64 %a1)
  %t3443 = icmp ne i64 %t3442, 1
  br i1 %t3443, label %then811, label %else812
then811:
  ret i64 257
else812:
  %t3444 = call i64 @rt_car(i64 %a1)
  %t3445 = call i64 @rt_eqv_p(i64 %a0, i64 %t3444)
  %t3446 = icmp ne i64 %t3445, 1
  br i1 %t3446, label %then813, label %else814
then813:
  %t3447 = call i64 @rt_car(i64 %a1)
  %t3448 = call i64 @rt_cdr(i64 %a1)
  %t3449 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t3449)
  %t3450 = and i64 %t3449, -8
  %t3451 = inttoptr i64 %t3450 to ptr
  %t3452 = load i64, ptr %t3451
  %t3453 = inttoptr i64 %t3452 to ptr
  %t3454 = musttail call fastcc i64 %t3453(i64 %t3449, i64 2, i64 %t3447, i64 %t3448, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3454
else814:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_675"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3459 = icmp eq i64 %argc, 1
  br i1 %t3459, label %argok816, label %arityerr815
arityerr815:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok816:
  %t3460 = and i64 %self, -8
  %t3461 = inttoptr i64 %t3460 to ptr
  %t3462 = getelementptr i64, ptr %t3461, i64 1
  %t3463 = load i64, ptr %t3462
  %t3464 = or i64 %a0, %t3463
  %t3465 = and i64 %t3464, 7
  %t3466 = icmp eq i64 %t3465, 0
  br i1 %t3466, label %fixfast817, label %fixslow818
fixfast817:
  %t3467 = icmp eq i64 %a0, %t3463
  %t3468 = select i1 %t3467, i64 257, i64 1
  br label %fixmerge819
fixslow818:
  %t3469 = call i64 @rt_num_eq(i64 %a0, i64 %t3463)
  br label %fixmerge819
fixmerge819:
  %t3470 = phi i64 [ %t3468, %fixfast817 ], [ %t3469, %fixslow818 ]
  %t3471 = icmp ne i64 %t3470, 1
  br i1 %t3471, label %then820, label %else821
then820:
  %t3472 = and i64 %self, -8
  %t3473 = inttoptr i64 %t3472 to ptr
  %t3474 = getelementptr i64, ptr %t3473, i64 2
  %t3475 = load i64, ptr %t3474
  %t3476 = or i64 %a0, %t3475
  %t3477 = and i64 %t3476, 7
  %t3478 = icmp eq i64 %t3477, 0
  br i1 %t3478, label %fixfast823, label %fixslow824
fixfast823:
  %t3479 = icmp eq i64 %a0, %t3475
  %t3480 = select i1 %t3479, i64 257, i64 1
  br label %fixmerge825
fixslow824:
  %t3481 = call i64 @rt_num_eq(i64 %a0, i64 %t3475)
  br label %fixmerge825
fixmerge825:
  %t3482 = phi i64 [ %t3480, %fixfast823 ], [ %t3481, %fixslow824 ]
  br label %merge822
else821:
  br label %merge822
merge822:
  %t3483 = phi i64 [ %t3482, %fixmerge825 ], [ 1, %else821 ]
  %t3484 = icmp ne i64 %t3483, 1
  br i1 %t3484, label %then826, label %else827
then826:
  ret i64 0
else827:
  %t3485 = and i64 %self, -8
  %t3486 = inttoptr i64 %t3485 to ptr
  %t3487 = getelementptr i64, ptr %t3486, i64 1
  %t3488 = load i64, ptr %t3487
  %t3489 = or i64 %a0, %t3488
  %t3490 = and i64 %t3489, 7
  %t3491 = icmp eq i64 %t3490, 0
  br i1 %t3491, label %fixfast828, label %fixslow829
fixfast828:
  %t3492 = icmp eq i64 %a0, %t3488
  %t3493 = select i1 %t3492, i64 257, i64 1
  br label %fixmerge830
fixslow829:
  %t3494 = call i64 @rt_num_eq(i64 %a0, i64 %t3488)
  br label %fixmerge830
fixmerge830:
  %t3495 = phi i64 [ %t3493, %fixfast828 ], [ %t3494, %fixslow829 ]
  %t3496 = icmp ne i64 %t3495, 1
  br i1 %t3496, label %then831, label %else832
then831:
  ret i64 -8
else832:
  %t3497 = and i64 %self, -8
  %t3498 = inttoptr i64 %t3497 to ptr
  %t3499 = getelementptr i64, ptr %t3498, i64 2
  %t3500 = load i64, ptr %t3499
  %t3501 = or i64 %a0, %t3500
  %t3502 = and i64 %t3501, 7
  %t3503 = icmp eq i64 %t3502, 0
  br i1 %t3503, label %fixfast833, label %fixslow834
fixfast833:
  %t3504 = icmp eq i64 %a0, %t3500
  %t3505 = select i1 %t3504, i64 257, i64 1
  br label %fixmerge835
fixslow834:
  %t3506 = call i64 @rt_num_eq(i64 %a0, i64 %t3500)
  br label %fixmerge835
fixmerge835:
  %t3507 = phi i64 [ %t3505, %fixfast833 ], [ %t3506, %fixslow834 ]
  %t3508 = icmp ne i64 %t3507, 1
  br i1 %t3508, label %then836, label %else837
then836:
  ret i64 8
else837:
  %t3509 = and i64 %self, -8
  %t3510 = inttoptr i64 %t3509 to ptr
  %t3511 = getelementptr i64, ptr %t3510, i64 3
  %t3512 = load i64, ptr %t3511
  %t3513 = call i64 @rt_string_ref(i64 %t3512, i64 %a0)
  %t3514 = call i64 @rt_char_to_integer(i64 %t3513)
  %t3515 = and i64 %self, -8
  %t3516 = inttoptr i64 %t3515 to ptr
  %t3517 = getelementptr i64, ptr %t3516, i64 4
  %t3518 = load i64, ptr %t3517
  %t3519 = call i64 @rt_string_ref(i64 %t3518, i64 %a0)
  %t3520 = call i64 @rt_char_to_integer(i64 %t3519)
  %t3521 = or i64 %t3514, %t3520
  %t3522 = and i64 %t3521, 7
  %t3523 = icmp eq i64 %t3522, 0
  br i1 %t3523, label %fixfast838, label %fixslow839
fixfast838:
  %t3524 = icmp slt i64 %t3514, %t3520
  %t3525 = select i1 %t3524, i64 257, i64 1
  br label %fixmerge840
fixslow839:
  %t3526 = call i64 @rt_lt(i64 %t3514, i64 %t3520)
  br label %fixmerge840
fixmerge840:
  %t3527 = phi i64 [ %t3525, %fixfast838 ], [ %t3526, %fixslow839 ]
  %t3528 = icmp ne i64 %t3527, 1
  br i1 %t3528, label %then841, label %else842
then841:
  ret i64 -8
else842:
  %t3529 = or i64 %t3520, %t3514
  %t3530 = and i64 %t3529, 7
  %t3531 = icmp eq i64 %t3530, 0
  br i1 %t3531, label %fixfast843, label %fixslow844
fixfast843:
  %t3532 = icmp slt i64 %t3520, %t3514
  %t3533 = select i1 %t3532, i64 257, i64 1
  br label %fixmerge845
fixslow844:
  %t3534 = call i64 @rt_lt(i64 %t3520, i64 %t3514)
  br label %fixmerge845
fixmerge845:
  %t3535 = phi i64 [ %t3533, %fixfast843 ], [ %t3534, %fixslow844 ]
  %t3536 = icmp ne i64 %t3535, 1
  br i1 %t3536, label %then846, label %else847
then846:
  ret i64 8
else847:
  %t3537 = or i64 %a0, 8
  %t3538 = and i64 %t3537, 7
  %t3539 = icmp eq i64 %t3538, 0
  br i1 %t3539, label %fixfast848, label %fixslow849
fixfast848:
  %t3540 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3541 = extractvalue {i64, i1} %t3540, 0
  %t3542 = extractvalue {i64, i1} %t3540, 1
  br i1 %t3542, label %fixslow849, label %fixmerge850
fixslow849:
  %t3543 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge850
fixmerge850:
  %t3544 = phi i64 [ %t3541, %fixfast848 ], [ %t3543, %fixslow849 ]
  %t3545 = musttail call fastcc i64 @"scheme.base:code_675"(i64 %self, i64 1, i64 %t3544, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3545
}

define fastcc i64 @"scheme.base:code:str-cmp"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3546 = icmp eq i64 %argc, 2
  br i1 %t3546, label %argok852, label %arityerr851
arityerr851:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok852:
  %t3547 = call i64 @rt_string_length(i64 %a0)
  %t3548 = call i64 @rt_string_length(i64 %a1)
  %t3549 = call ptr @rt_alloc_words(i64 6)
  %t3550 = ptrtoint ptr %t3549 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_675" to i64), ptr %t3549
  %t3551 = or i64 %t3550, 4
  %t3552 = getelementptr i64, ptr %t3549, i64 1
  store i64 %t3547, ptr %t3552
  %t3553 = getelementptr i64, ptr %t3549, i64 2
  store i64 %t3548, ptr %t3553
  %t3554 = getelementptr i64, ptr %t3549, i64 3
  store i64 %a0, ptr %t3554
  %t3555 = getelementptr i64, ptr %t3549, i64 4
  store i64 %a1, ptr %t3555
  %t3556 = getelementptr i64, ptr %t3549, i64 5
  store i64 %t3551, ptr %t3556
  %t3557 = musttail call fastcc i64 @"scheme.base:code_675"(i64 %t3551, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3557
}

define fastcc i64 @"scheme.base:code:str-chain?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3562 = icmp eq i64 %argc, 3
  br i1 %t3562, label %argok854, label %arityerr853
arityerr853:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok854:
  %t3563 = call i64 @rt_null_p(i64 %a2)
  %t3564 = icmp ne i64 %t3563, 1
  br i1 %t3564, label %then855, label %else856
then855:
  ret i64 257
else856:
  %t3565 = call i64 @rt_car(i64 %a2)
  call void @rt_check_callable(i64 %a0)
  %t3566 = and i64 %a0, -8
  %t3567 = inttoptr i64 %t3566 to ptr
  %t3568 = load i64, ptr %t3567
  %t3569 = inttoptr i64 %t3568 to ptr
  %t3570 = call fastcc i64%t3569(i64 %a0, i64 2, i64 %a1, i64 %t3565, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3571 = icmp ne i64 %t3570, 1
  br i1 %t3571, label %then857, label %else858
then857:
  %t3572 = call i64 @rt_car(i64 %a2)
  %t3573 = call i64 @rt_cdr(i64 %a2)
  %t3574 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3574)
  %t3575 = and i64 %t3574, -8
  %t3576 = inttoptr i64 %t3575 to ptr
  %t3577 = load i64, ptr %t3576
  %t3578 = inttoptr i64 %t3577 to ptr
  %t3579 = musttail call fastcc i64 %t3578(i64 %t3574, i64 3, i64 %a0, i64 %t3572, i64 %t3573, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3579
else858:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_691"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3584 = icmp eq i64 %argc, 2
  br i1 %t3584, label %argok860, label %arityerr859
arityerr859:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok860:
  %t3585 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t3585)
  %t3586 = and i64 %t3585, -8
  %t3587 = inttoptr i64 %t3586 to ptr
  %t3588 = load i64, ptr %t3587
  %t3589 = inttoptr i64 %t3588 to ptr
  %t3590 = call fastcc i64%t3589(i64 %t3585, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3591 = or i64 %t3590, 0
  %t3592 = and i64 %t3591, 7
  %t3593 = icmp eq i64 %t3592, 0
  br i1 %t3593, label %fixfast861, label %fixslow862
fixfast861:
  %t3594 = icmp slt i64 %t3590, 0
  %t3595 = select i1 %t3594, i64 257, i64 1
  br label %fixmerge863
fixslow862:
  %t3596 = call i64 @rt_lt(i64 %t3590, i64 0)
  br label %fixmerge863
fixmerge863:
  %t3597 = phi i64 [ %t3595, %fixfast861 ], [ %t3596, %fixslow862 ]
  ret i64 %t3597
}

define fastcc i64 @"scheme.base:code:string<?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3598 = icmp sge i64 %argc, 2
  br i1 %t3598, label %argok865, label %arityerr864
arityerr864:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok865:
  %t3599 = call ptr @rt_alloc_words(i64 8)
  %t3600 = getelementptr i64, ptr %t3599, i64 0
  store i64 %a0, ptr %t3600
  %t3601 = getelementptr i64, ptr %t3599, i64 1
  store i64 %a1, ptr %t3601
  %t3602 = getelementptr i64, ptr %t3599, i64 2
  store i64 %a2, ptr %t3602
  %t3603 = getelementptr i64, ptr %t3599, i64 3
  store i64 %a3, ptr %t3603
  %t3604 = getelementptr i64, ptr %t3599, i64 4
  store i64 %a4, ptr %t3604
  %t3605 = getelementptr i64, ptr %t3599, i64 5
  store i64 %a5, ptr %t3605
  %t3606 = getelementptr i64, ptr %t3599, i64 6
  store i64 %a6, ptr %t3606
  %t3607 = getelementptr i64, ptr %t3599, i64 7
  store i64 %a7, ptr %t3607
  %t3608 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3599, ptr %overflow)
  %t3609 = call ptr @rt_alloc_words(i64 1)
  %t3610 = ptrtoint ptr %t3609 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_691" to i64), ptr %t3609
  %t3611 = or i64 %t3610, 4
  %t3612 = call i64 @rt_cons(i64 %a1, i64 %t3608)
  %t3613 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3613)
  %t3614 = and i64 %t3613, -8
  %t3615 = inttoptr i64 %t3614 to ptr
  %t3616 = load i64, ptr %t3615
  %t3617 = inttoptr i64 %t3616 to ptr
  %t3618 = musttail call fastcc i64 %t3617(i64 %t3613, i64 3, i64 %t3611, i64 %a0, i64 %t3612, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3618
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring<?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3619 = call ptr @rt_alloc_words(i64 1)
  %t3620 = ptrtoint ptr %t3619 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_691" to i64), ptr %t3619
  %t3621 = or i64 %t3620, 4
  %t3622 = call i64 @rt_cons(i64 %a1, i64 2)
  %t3623 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3623)
  %t3624 = and i64 %t3623, -8
  %t3625 = inttoptr i64 %t3624 to ptr
  %t3626 = load i64, ptr %t3625
  %t3627 = inttoptr i64 %t3626 to ptr
  %t3628 = musttail call fastcc i64 %t3627(i64 %t3623, i64 3, i64 %t3621, i64 %a0, i64 %t3622, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3628
}

define fastcc i64 @"scheme.base:code_703"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3633 = icmp eq i64 %argc, 2
  br i1 %t3633, label %argok867, label %arityerr866
arityerr866:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok867:
  %t3634 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t3634)
  %t3635 = and i64 %t3634, -8
  %t3636 = inttoptr i64 %t3635 to ptr
  %t3637 = load i64, ptr %t3636
  %t3638 = inttoptr i64 %t3637 to ptr
  %t3639 = call fastcc i64%t3638(i64 %t3634, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3640 = or i64 0, %t3639
  %t3641 = and i64 %t3640, 7
  %t3642 = icmp eq i64 %t3641, 0
  br i1 %t3642, label %fixfast868, label %fixslow869
fixfast868:
  %t3643 = icmp slt i64 0, %t3639
  %t3644 = select i1 %t3643, i64 257, i64 1
  br label %fixmerge870
fixslow869:
  %t3645 = call i64 @rt_lt(i64 0, i64 %t3639)
  br label %fixmerge870
fixmerge870:
  %t3646 = phi i64 [ %t3644, %fixfast868 ], [ %t3645, %fixslow869 ]
  ret i64 %t3646
}

define fastcc i64 @"scheme.base:code:string>?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3647 = icmp sge i64 %argc, 2
  br i1 %t3647, label %argok872, label %arityerr871
arityerr871:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok872:
  %t3648 = call ptr @rt_alloc_words(i64 8)
  %t3649 = getelementptr i64, ptr %t3648, i64 0
  store i64 %a0, ptr %t3649
  %t3650 = getelementptr i64, ptr %t3648, i64 1
  store i64 %a1, ptr %t3650
  %t3651 = getelementptr i64, ptr %t3648, i64 2
  store i64 %a2, ptr %t3651
  %t3652 = getelementptr i64, ptr %t3648, i64 3
  store i64 %a3, ptr %t3652
  %t3653 = getelementptr i64, ptr %t3648, i64 4
  store i64 %a4, ptr %t3653
  %t3654 = getelementptr i64, ptr %t3648, i64 5
  store i64 %a5, ptr %t3654
  %t3655 = getelementptr i64, ptr %t3648, i64 6
  store i64 %a6, ptr %t3655
  %t3656 = getelementptr i64, ptr %t3648, i64 7
  store i64 %a7, ptr %t3656
  %t3657 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3648, ptr %overflow)
  %t3658 = call ptr @rt_alloc_words(i64 1)
  %t3659 = ptrtoint ptr %t3658 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_703" to i64), ptr %t3658
  %t3660 = or i64 %t3659, 4
  %t3661 = call i64 @rt_cons(i64 %a1, i64 %t3657)
  %t3662 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3662)
  %t3663 = and i64 %t3662, -8
  %t3664 = inttoptr i64 %t3663 to ptr
  %t3665 = load i64, ptr %t3664
  %t3666 = inttoptr i64 %t3665 to ptr
  %t3667 = musttail call fastcc i64 %t3666(i64 %t3662, i64 3, i64 %t3660, i64 %a0, i64 %t3661, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3667
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring>?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3668 = call ptr @rt_alloc_words(i64 1)
  %t3669 = ptrtoint ptr %t3668 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_703" to i64), ptr %t3668
  %t3670 = or i64 %t3669, 4
  %t3671 = call i64 @rt_cons(i64 %a1, i64 2)
  %t3672 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3672)
  %t3673 = and i64 %t3672, -8
  %t3674 = inttoptr i64 %t3673 to ptr
  %t3675 = load i64, ptr %t3674
  %t3676 = inttoptr i64 %t3675 to ptr
  %t3677 = musttail call fastcc i64 %t3676(i64 %t3672, i64 3, i64 %t3670, i64 %a0, i64 %t3671, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3677
}

define fastcc i64 @"scheme.base:code_715"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3682 = icmp eq i64 %argc, 2
  br i1 %t3682, label %argok874, label %arityerr873
arityerr873:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok874:
  %t3683 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t3683)
  %t3684 = and i64 %t3683, -8
  %t3685 = inttoptr i64 %t3684 to ptr
  %t3686 = load i64, ptr %t3685
  %t3687 = inttoptr i64 %t3686 to ptr
  %t3688 = call fastcc i64%t3687(i64 %t3683, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3689 = or i64 0, %t3688
  %t3690 = and i64 %t3689, 7
  %t3691 = icmp eq i64 %t3690, 0
  br i1 %t3691, label %fixfast875, label %fixslow876
fixfast875:
  %t3692 = icmp slt i64 0, %t3688
  %t3693 = select i1 %t3692, i64 257, i64 1
  br label %fixmerge877
fixslow876:
  %t3694 = call i64 @rt_lt(i64 0, i64 %t3688)
  br label %fixmerge877
fixmerge877:
  %t3695 = phi i64 [ %t3693, %fixfast875 ], [ %t3694, %fixslow876 ]
  %t3696 = call i64 @rt_not(i64 %t3695)
  ret i64 %t3696
}

define fastcc i64 @"scheme.base:code:string<=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3697 = icmp sge i64 %argc, 2
  br i1 %t3697, label %argok879, label %arityerr878
arityerr878:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok879:
  %t3698 = call ptr @rt_alloc_words(i64 8)
  %t3699 = getelementptr i64, ptr %t3698, i64 0
  store i64 %a0, ptr %t3699
  %t3700 = getelementptr i64, ptr %t3698, i64 1
  store i64 %a1, ptr %t3700
  %t3701 = getelementptr i64, ptr %t3698, i64 2
  store i64 %a2, ptr %t3701
  %t3702 = getelementptr i64, ptr %t3698, i64 3
  store i64 %a3, ptr %t3702
  %t3703 = getelementptr i64, ptr %t3698, i64 4
  store i64 %a4, ptr %t3703
  %t3704 = getelementptr i64, ptr %t3698, i64 5
  store i64 %a5, ptr %t3704
  %t3705 = getelementptr i64, ptr %t3698, i64 6
  store i64 %a6, ptr %t3705
  %t3706 = getelementptr i64, ptr %t3698, i64 7
  store i64 %a7, ptr %t3706
  %t3707 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3698, ptr %overflow)
  %t3708 = call ptr @rt_alloc_words(i64 1)
  %t3709 = ptrtoint ptr %t3708 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_715" to i64), ptr %t3708
  %t3710 = or i64 %t3709, 4
  %t3711 = call i64 @rt_cons(i64 %a1, i64 %t3707)
  %t3712 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3712)
  %t3713 = and i64 %t3712, -8
  %t3714 = inttoptr i64 %t3713 to ptr
  %t3715 = load i64, ptr %t3714
  %t3716 = inttoptr i64 %t3715 to ptr
  %t3717 = musttail call fastcc i64 %t3716(i64 %t3712, i64 3, i64 %t3710, i64 %a0, i64 %t3711, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3717
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring<=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3718 = call ptr @rt_alloc_words(i64 1)
  %t3719 = ptrtoint ptr %t3718 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_715" to i64), ptr %t3718
  %t3720 = or i64 %t3719, 4
  %t3721 = call i64 @rt_cons(i64 %a1, i64 2)
  %t3722 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3722)
  %t3723 = and i64 %t3722, -8
  %t3724 = inttoptr i64 %t3723 to ptr
  %t3725 = load i64, ptr %t3724
  %t3726 = inttoptr i64 %t3725 to ptr
  %t3727 = musttail call fastcc i64 %t3726(i64 %t3722, i64 3, i64 %t3720, i64 %a0, i64 %t3721, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3727
}

define fastcc i64 @"scheme.base:code_727"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3732 = icmp eq i64 %argc, 2
  br i1 %t3732, label %argok881, label %arityerr880
arityerr880:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok881:
  %t3733 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t3733)
  %t3734 = and i64 %t3733, -8
  %t3735 = inttoptr i64 %t3734 to ptr
  %t3736 = load i64, ptr %t3735
  %t3737 = inttoptr i64 %t3736 to ptr
  %t3738 = call fastcc i64%t3737(i64 %t3733, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3739 = or i64 %t3738, 0
  %t3740 = and i64 %t3739, 7
  %t3741 = icmp eq i64 %t3740, 0
  br i1 %t3741, label %fixfast882, label %fixslow883
fixfast882:
  %t3742 = icmp slt i64 %t3738, 0
  %t3743 = select i1 %t3742, i64 257, i64 1
  br label %fixmerge884
fixslow883:
  %t3744 = call i64 @rt_lt(i64 %t3738, i64 0)
  br label %fixmerge884
fixmerge884:
  %t3745 = phi i64 [ %t3743, %fixfast882 ], [ %t3744, %fixslow883 ]
  %t3746 = call i64 @rt_not(i64 %t3745)
  ret i64 %t3746
}

define fastcc i64 @"scheme.base:code:string>=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3747 = icmp sge i64 %argc, 2
  br i1 %t3747, label %argok886, label %arityerr885
arityerr885:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok886:
  %t3748 = call ptr @rt_alloc_words(i64 8)
  %t3749 = getelementptr i64, ptr %t3748, i64 0
  store i64 %a0, ptr %t3749
  %t3750 = getelementptr i64, ptr %t3748, i64 1
  store i64 %a1, ptr %t3750
  %t3751 = getelementptr i64, ptr %t3748, i64 2
  store i64 %a2, ptr %t3751
  %t3752 = getelementptr i64, ptr %t3748, i64 3
  store i64 %a3, ptr %t3752
  %t3753 = getelementptr i64, ptr %t3748, i64 4
  store i64 %a4, ptr %t3753
  %t3754 = getelementptr i64, ptr %t3748, i64 5
  store i64 %a5, ptr %t3754
  %t3755 = getelementptr i64, ptr %t3748, i64 6
  store i64 %a6, ptr %t3755
  %t3756 = getelementptr i64, ptr %t3748, i64 7
  store i64 %a7, ptr %t3756
  %t3757 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3748, ptr %overflow)
  %t3758 = call ptr @rt_alloc_words(i64 1)
  %t3759 = ptrtoint ptr %t3758 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_727" to i64), ptr %t3758
  %t3760 = or i64 %t3759, 4
  %t3761 = call i64 @rt_cons(i64 %a1, i64 %t3757)
  %t3762 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3762)
  %t3763 = and i64 %t3762, -8
  %t3764 = inttoptr i64 %t3763 to ptr
  %t3765 = load i64, ptr %t3764
  %t3766 = inttoptr i64 %t3765 to ptr
  %t3767 = musttail call fastcc i64 %t3766(i64 %t3762, i64 3, i64 %t3760, i64 %a0, i64 %t3761, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3767
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring>=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3768 = call ptr @rt_alloc_words(i64 1)
  %t3769 = ptrtoint ptr %t3768 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_727" to i64), ptr %t3768
  %t3770 = or i64 %t3769, 4
  %t3771 = call i64 @rt_cons(i64 %a1, i64 2)
  %t3772 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3772)
  %t3773 = and i64 %t3772, -8
  %t3774 = inttoptr i64 %t3773 to ptr
  %t3775 = load i64, ptr %t3774
  %t3776 = inttoptr i64 %t3775 to ptr
  %t3777 = musttail call fastcc i64 %t3776(i64 %t3772, i64 3, i64 %t3770, i64 %a0, i64 %t3771, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3777
}

define fastcc i64 @"scheme.base:code_742"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3782 = icmp eq i64 %argc, 2
  br i1 %t3782, label %argok888, label %arityerr887
arityerr887:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok888:
  %t3783 = and i64 %self, -8
  %t3784 = inttoptr i64 %t3783 to ptr
  %t3785 = getelementptr i64, ptr %t3784, i64 1
  %t3786 = load i64, ptr %t3785
  %t3787 = or i64 %a0, %t3786
  %t3788 = and i64 %t3787, 7
  %t3789 = icmp eq i64 %t3788, 0
  br i1 %t3789, label %fixfast889, label %fixslow890
fixfast889:
  %t3790 = icmp slt i64 %a0, %t3786
  %t3791 = select i1 %t3790, i64 257, i64 1
  br label %fixmerge891
fixslow890:
  %t3792 = call i64 @rt_lt(i64 %a0, i64 %t3786)
  br label %fixmerge891
fixmerge891:
  %t3793 = phi i64 [ %t3791, %fixfast889 ], [ %t3792, %fixslow890 ]
  %t3794 = icmp ne i64 %t3793, 1
  br i1 %t3794, label %then892, label %else893
then892:
  ret i64 %a1
else893:
  %t3795 = or i64 %a0, 8
  %t3796 = and i64 %t3795, 7
  %t3797 = icmp eq i64 %t3796, 0
  br i1 %t3797, label %fixfast894, label %fixslow895
fixfast894:
  %t3798 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t3799 = extractvalue {i64, i1} %t3798, 0
  %t3800 = extractvalue {i64, i1} %t3798, 1
  br i1 %t3800, label %fixslow895, label %fixmerge896
fixslow895:
  %t3801 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge896
fixmerge896:
  %t3802 = phi i64 [ %t3799, %fixfast894 ], [ %t3801, %fixslow895 ]
  %t3803 = and i64 %self, -8
  %t3804 = inttoptr i64 %t3803 to ptr
  %t3805 = getelementptr i64, ptr %t3804, i64 3
  %t3806 = load i64, ptr %t3805
  %t3807 = call i64 @rt_vector_ref(i64 %t3806, i64 %a0)
  %t3808 = call i64 @rt_cons(i64 %t3807, i64 %a1)
  %t3809 = musttail call fastcc i64 @"scheme.base:code_742"(i64 %self, i64 2, i64 %t3802, i64 %t3808, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3809
}

define fastcc i64 @"scheme.base:code:vector->list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3810 = icmp sge i64 %argc, 1
  br i1 %t3810, label %argok898, label %arityerr897
arityerr897:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok898:
  %t3811 = call ptr @rt_alloc_words(i64 8)
  %t3812 = getelementptr i64, ptr %t3811, i64 0
  store i64 %a0, ptr %t3812
  %t3813 = getelementptr i64, ptr %t3811, i64 1
  store i64 %a1, ptr %t3813
  %t3814 = getelementptr i64, ptr %t3811, i64 2
  store i64 %a2, ptr %t3814
  %t3815 = getelementptr i64, ptr %t3811, i64 3
  store i64 %a3, ptr %t3815
  %t3816 = getelementptr i64, ptr %t3811, i64 4
  store i64 %a4, ptr %t3816
  %t3817 = getelementptr i64, ptr %t3811, i64 5
  store i64 %a5, ptr %t3817
  %t3818 = getelementptr i64, ptr %t3811, i64 6
  store i64 %a6, ptr %t3818
  %t3819 = getelementptr i64, ptr %t3811, i64 7
  store i64 %a7, ptr %t3819
  %t3820 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t3811, ptr %overflow)
  %t3821 = call i64 @rt_vector_length(i64 %a0)
  %t3822 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t3822)
  %t3823 = and i64 %t3822, -8
  %t3824 = inttoptr i64 %t3823 to ptr
  %t3825 = load i64, ptr %t3824
  %t3826 = inttoptr i64 %t3825 to ptr
  %t3827 = call fastcc i64%t3826(i64 %t3822, i64 1, i64 %t3820, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3828 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t3828)
  %t3829 = and i64 %t3828, -8
  %t3830 = inttoptr i64 %t3829 to ptr
  %t3831 = load i64, ptr %t3830
  %t3832 = inttoptr i64 %t3831 to ptr
  %t3833 = call fastcc i64%t3832(i64 %t3828, i64 2, i64 %t3820, i64 %t3821, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3834 = call i64 @rt_intern(ptr @.str.sym.21)
  %t3835 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t3835)
  %t3836 = and i64 %t3835, -8
  %t3837 = inttoptr i64 %t3836 to ptr
  %t3838 = load i64, ptr %t3837
  %t3839 = inttoptr i64 %t3838 to ptr
  %t3840 = call fastcc i64%t3839(i64 %t3835, i64 4, i64 %t3834, i64 %t3827, i64 %t3833, i64 %t3821, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3841 = call ptr @rt_alloc_words(i64 4)
  %t3842 = ptrtoint ptr %t3841 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_742" to i64), ptr %t3841
  %t3843 = or i64 %t3842, 4
  %t3844 = getelementptr i64, ptr %t3841, i64 1
  store i64 %t3827, ptr %t3844
  %t3845 = getelementptr i64, ptr %t3841, i64 2
  store i64 %t3843, ptr %t3845
  %t3846 = getelementptr i64, ptr %t3841, i64 3
  store i64 %a0, ptr %t3846
  %t3847 = or i64 %t3833, 8
  %t3848 = and i64 %t3847, 7
  %t3849 = icmp eq i64 %t3848, 0
  br i1 %t3849, label %fixfast899, label %fixslow900
fixfast899:
  %t3850 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3833, i64 8)
  %t3851 = extractvalue {i64, i1} %t3850, 0
  %t3852 = extractvalue {i64, i1} %t3850, 1
  br i1 %t3852, label %fixslow900, label %fixmerge901
fixslow900:
  %t3853 = call i64 @rt_sub(i64 %t3833, i64 8)
  br label %fixmerge901
fixmerge901:
  %t3854 = phi i64 [ %t3851, %fixfast899 ], [ %t3853, %fixslow900 ]
  %t3855 = musttail call fastcc i64 @"scheme.base:code_742"(i64 %t3843, i64 2, i64 %t3854, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3855
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector->list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3856 = call i64 @rt_vector_length(i64 %a0)
  %t3857 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t3857)
  %t3858 = and i64 %t3857, -8
  %t3859 = inttoptr i64 %t3858 to ptr
  %t3860 = load i64, ptr %t3859
  %t3861 = inttoptr i64 %t3860 to ptr
  %t3862 = call fastcc i64%t3861(i64 %t3857, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3863 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t3863)
  %t3864 = and i64 %t3863, -8
  %t3865 = inttoptr i64 %t3864 to ptr
  %t3866 = load i64, ptr %t3865
  %t3867 = inttoptr i64 %t3866 to ptr
  %t3868 = call fastcc i64%t3867(i64 %t3863, i64 2, i64 2, i64 %t3856, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3869 = call i64 @rt_intern(ptr @.str.sym.21)
  %t3870 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t3870)
  %t3871 = and i64 %t3870, -8
  %t3872 = inttoptr i64 %t3871 to ptr
  %t3873 = load i64, ptr %t3872
  %t3874 = inttoptr i64 %t3873 to ptr
  %t3875 = call fastcc i64%t3874(i64 %t3870, i64 4, i64 %t3869, i64 %t3862, i64 %t3868, i64 %t3856, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3876 = call ptr @rt_alloc_words(i64 4)
  %t3877 = ptrtoint ptr %t3876 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_742" to i64), ptr %t3876
  %t3878 = or i64 %t3877, 4
  %t3879 = getelementptr i64, ptr %t3876, i64 1
  store i64 %t3862, ptr %t3879
  %t3880 = getelementptr i64, ptr %t3876, i64 2
  store i64 %t3878, ptr %t3880
  %t3881 = getelementptr i64, ptr %t3876, i64 3
  store i64 %a0, ptr %t3881
  %t3882 = or i64 %t3868, 8
  %t3883 = and i64 %t3882, 7
  %t3884 = icmp eq i64 %t3883, 0
  br i1 %t3884, label %fixfast902, label %fixslow903
fixfast902:
  %t3885 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3868, i64 8)
  %t3886 = extractvalue {i64, i1} %t3885, 0
  %t3887 = extractvalue {i64, i1} %t3885, 1
  br i1 %t3887, label %fixslow903, label %fixmerge904
fixslow903:
  %t3888 = call i64 @rt_sub(i64 %t3868, i64 8)
  br label %fixmerge904
fixmerge904:
  %t3889 = phi i64 [ %t3886, %fixfast902 ], [ %t3888, %fixslow903 ]
  %t3890 = musttail call fastcc i64 @"scheme.base:code_742"(i64 %t3878, i64 2, i64 %t3889, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3890
}

define fastcc i64 @"scheme.base:code_757"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3895 = icmp eq i64 %argc, 1
  br i1 %t3895, label %argok906, label %arityerr905
arityerr905:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok906:
  %t3896 = and i64 %self, -8
  %t3897 = inttoptr i64 %t3896 to ptr
  %t3898 = getelementptr i64, ptr %t3897, i64 1
  %t3899 = load i64, ptr %t3898
  %t3900 = or i64 %a0, %t3899
  %t3901 = and i64 %t3900, 7
  %t3902 = icmp eq i64 %t3901, 0
  br i1 %t3902, label %fixfast907, label %fixslow908
fixfast907:
  %t3903 = icmp eq i64 %a0, %t3899
  %t3904 = select i1 %t3903, i64 257, i64 1
  br label %fixmerge909
fixslow908:
  %t3905 = call i64 @rt_num_eq(i64 %a0, i64 %t3899)
  br label %fixmerge909
fixmerge909:
  %t3906 = phi i64 [ %t3904, %fixfast907 ], [ %t3905, %fixslow908 ]
  %t3907 = icmp ne i64 %t3906, 1
  br i1 %t3907, label %then910, label %else911
then910:
  %t3908 = and i64 %self, -8
  %t3909 = inttoptr i64 %t3908 to ptr
  %t3910 = getelementptr i64, ptr %t3909, i64 2
  %t3911 = load i64, ptr %t3910
  ret i64 %t3911
else911:
  %t3912 = and i64 %self, -8
  %t3913 = inttoptr i64 %t3912 to ptr
  %t3914 = getelementptr i64, ptr %t3913, i64 2
  %t3915 = load i64, ptr %t3914
  %t3916 = and i64 %self, -8
  %t3917 = inttoptr i64 %t3916 to ptr
  %t3918 = getelementptr i64, ptr %t3917, i64 3
  %t3919 = load i64, ptr %t3918
  %t3920 = or i64 %a0, %t3919
  %t3921 = and i64 %t3920, 7
  %t3922 = icmp eq i64 %t3921, 0
  br i1 %t3922, label %fixfast912, label %fixslow913
fixfast912:
  %t3923 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t3919)
  %t3924 = extractvalue {i64, i1} %t3923, 0
  %t3925 = extractvalue {i64, i1} %t3923, 1
  br i1 %t3925, label %fixslow913, label %fixmerge914
fixslow913:
  %t3926 = call i64 @rt_sub(i64 %a0, i64 %t3919)
  br label %fixmerge914
fixmerge914:
  %t3927 = phi i64 [ %t3924, %fixfast912 ], [ %t3926, %fixslow913 ]
  %t3928 = and i64 %self, -8
  %t3929 = inttoptr i64 %t3928 to ptr
  %t3930 = getelementptr i64, ptr %t3929, i64 4
  %t3931 = load i64, ptr %t3930
  %t3932 = call i64 @rt_vector_ref(i64 %t3931, i64 %a0)
  %t3933 = call i64 @rt_vector_set(i64 %t3915, i64 %t3927, i64 %t3932)
  %t3934 = or i64 %a0, 8
  %t3935 = and i64 %t3934, 7
  %t3936 = icmp eq i64 %t3935, 0
  br i1 %t3936, label %fixfast915, label %fixslow916
fixfast915:
  %t3937 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3938 = extractvalue {i64, i1} %t3937, 0
  %t3939 = extractvalue {i64, i1} %t3937, 1
  br i1 %t3939, label %fixslow916, label %fixmerge917
fixslow916:
  %t3940 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge917
fixmerge917:
  %t3941 = phi i64 [ %t3938, %fixfast915 ], [ %t3940, %fixslow916 ]
  %t3942 = musttail call fastcc i64 @"scheme.base:code_757"(i64 %self, i64 1, i64 %t3941, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3942
}

define fastcc i64 @"scheme.base:code:vector-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3943 = icmp sge i64 %argc, 1
  br i1 %t3943, label %argok919, label %arityerr918
arityerr918:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok919:
  %t3944 = call ptr @rt_alloc_words(i64 8)
  %t3945 = getelementptr i64, ptr %t3944, i64 0
  store i64 %a0, ptr %t3945
  %t3946 = getelementptr i64, ptr %t3944, i64 1
  store i64 %a1, ptr %t3946
  %t3947 = getelementptr i64, ptr %t3944, i64 2
  store i64 %a2, ptr %t3947
  %t3948 = getelementptr i64, ptr %t3944, i64 3
  store i64 %a3, ptr %t3948
  %t3949 = getelementptr i64, ptr %t3944, i64 4
  store i64 %a4, ptr %t3949
  %t3950 = getelementptr i64, ptr %t3944, i64 5
  store i64 %a5, ptr %t3950
  %t3951 = getelementptr i64, ptr %t3944, i64 6
  store i64 %a6, ptr %t3951
  %t3952 = getelementptr i64, ptr %t3944, i64 7
  store i64 %a7, ptr %t3952
  %t3953 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t3944, ptr %overflow)
  %t3954 = call i64 @rt_vector_length(i64 %a0)
  %t3955 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t3955)
  %t3956 = and i64 %t3955, -8
  %t3957 = inttoptr i64 %t3956 to ptr
  %t3958 = load i64, ptr %t3957
  %t3959 = inttoptr i64 %t3958 to ptr
  %t3960 = call fastcc i64%t3959(i64 %t3955, i64 1, i64 %t3953, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3961 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t3961)
  %t3962 = and i64 %t3961, -8
  %t3963 = inttoptr i64 %t3962 to ptr
  %t3964 = load i64, ptr %t3963
  %t3965 = inttoptr i64 %t3964 to ptr
  %t3966 = call fastcc i64%t3965(i64 %t3961, i64 2, i64 %t3953, i64 %t3954, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3967 = call i64 @rt_intern(ptr @.str.sym.22)
  %t3968 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t3968)
  %t3969 = and i64 %t3968, -8
  %t3970 = inttoptr i64 %t3969 to ptr
  %t3971 = load i64, ptr %t3970
  %t3972 = inttoptr i64 %t3971 to ptr
  %t3973 = call fastcc i64%t3972(i64 %t3968, i64 4, i64 %t3967, i64 %t3960, i64 %t3966, i64 %t3954, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3974 = or i64 %t3966, %t3960
  %t3975 = and i64 %t3974, 7
  %t3976 = icmp eq i64 %t3975, 0
  br i1 %t3976, label %fixfast920, label %fixslow921
fixfast920:
  %t3977 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3966, i64 %t3960)
  %t3978 = extractvalue {i64, i1} %t3977, 0
  %t3979 = extractvalue {i64, i1} %t3977, 1
  br i1 %t3979, label %fixslow921, label %fixmerge922
fixslow921:
  %t3980 = call i64 @rt_sub(i64 %t3966, i64 %t3960)
  br label %fixmerge922
fixmerge922:
  %t3981 = phi i64 [ %t3978, %fixfast920 ], [ %t3980, %fixslow921 ]
  %t3982 = call i64 @rt_make_vector(i64 %t3981, i64 0)
  %t3983 = call ptr @rt_alloc_words(i64 6)
  %t3984 = ptrtoint ptr %t3983 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_757" to i64), ptr %t3983
  %t3985 = or i64 %t3984, 4
  %t3986 = getelementptr i64, ptr %t3983, i64 1
  store i64 %t3966, ptr %t3986
  %t3987 = getelementptr i64, ptr %t3983, i64 2
  store i64 %t3982, ptr %t3987
  %t3988 = getelementptr i64, ptr %t3983, i64 3
  store i64 %t3960, ptr %t3988
  %t3989 = getelementptr i64, ptr %t3983, i64 4
  store i64 %a0, ptr %t3989
  %t3990 = getelementptr i64, ptr %t3983, i64 5
  store i64 %t3985, ptr %t3990
  %t3991 = musttail call fastcc i64 @"scheme.base:code_757"(i64 %t3985, i64 1, i64 %t3960, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3991
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3992 = call i64 @rt_vector_length(i64 %a0)
  %t3993 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t3993)
  %t3994 = and i64 %t3993, -8
  %t3995 = inttoptr i64 %t3994 to ptr
  %t3996 = load i64, ptr %t3995
  %t3997 = inttoptr i64 %t3996 to ptr
  %t3998 = call fastcc i64%t3997(i64 %t3993, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3999 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t3999)
  %t4000 = and i64 %t3999, -8
  %t4001 = inttoptr i64 %t4000 to ptr
  %t4002 = load i64, ptr %t4001
  %t4003 = inttoptr i64 %t4002 to ptr
  %t4004 = call fastcc i64%t4003(i64 %t3999, i64 2, i64 2, i64 %t3992, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4005 = call i64 @rt_intern(ptr @.str.sym.22)
  %t4006 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4006)
  %t4007 = and i64 %t4006, -8
  %t4008 = inttoptr i64 %t4007 to ptr
  %t4009 = load i64, ptr %t4008
  %t4010 = inttoptr i64 %t4009 to ptr
  %t4011 = call fastcc i64%t4010(i64 %t4006, i64 4, i64 %t4005, i64 %t3998, i64 %t4004, i64 %t3992, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4012 = or i64 %t4004, %t3998
  %t4013 = and i64 %t4012, 7
  %t4014 = icmp eq i64 %t4013, 0
  br i1 %t4014, label %fixfast923, label %fixslow924
fixfast923:
  %t4015 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4004, i64 %t3998)
  %t4016 = extractvalue {i64, i1} %t4015, 0
  %t4017 = extractvalue {i64, i1} %t4015, 1
  br i1 %t4017, label %fixslow924, label %fixmerge925
fixslow924:
  %t4018 = call i64 @rt_sub(i64 %t4004, i64 %t3998)
  br label %fixmerge925
fixmerge925:
  %t4019 = phi i64 [ %t4016, %fixfast923 ], [ %t4018, %fixslow924 ]
  %t4020 = call i64 @rt_make_vector(i64 %t4019, i64 0)
  %t4021 = call ptr @rt_alloc_words(i64 6)
  %t4022 = ptrtoint ptr %t4021 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_757" to i64), ptr %t4021
  %t4023 = or i64 %t4022, 4
  %t4024 = getelementptr i64, ptr %t4021, i64 1
  store i64 %t4004, ptr %t4024
  %t4025 = getelementptr i64, ptr %t4021, i64 2
  store i64 %t4020, ptr %t4025
  %t4026 = getelementptr i64, ptr %t4021, i64 3
  store i64 %t3998, ptr %t4026
  %t4027 = getelementptr i64, ptr %t4021, i64 4
  store i64 %a0, ptr %t4027
  %t4028 = getelementptr i64, ptr %t4021, i64 5
  store i64 %t4023, ptr %t4028
  %t4029 = musttail call fastcc i64 @"scheme.base:code_757"(i64 %t4023, i64 1, i64 %t3998, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4029
}

define fastcc i64 @"scheme.base:code_775"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4034 = icmp eq i64 %argc, 1
  br i1 %t4034, label %argok927, label %arityerr926
arityerr926:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok927:
  %t4035 = and i64 %self, -8
  %t4036 = inttoptr i64 %t4035 to ptr
  %t4037 = getelementptr i64, ptr %t4036, i64 1
  %t4038 = load i64, ptr %t4037
  %t4039 = or i64 %a0, %t4038
  %t4040 = and i64 %t4039, 7
  %t4041 = icmp eq i64 %t4040, 0
  br i1 %t4041, label %fixfast928, label %fixslow929
fixfast928:
  %t4042 = icmp eq i64 %a0, %t4038
  %t4043 = select i1 %t4042, i64 257, i64 1
  br label %fixmerge930
fixslow929:
  %t4044 = call i64 @rt_num_eq(i64 %a0, i64 %t4038)
  br label %fixmerge930
fixmerge930:
  %t4045 = phi i64 [ %t4043, %fixfast928 ], [ %t4044, %fixslow929 ]
  %t4046 = icmp ne i64 %t4045, 1
  br i1 %t4046, label %then931, label %else932
then931:
  %t4047 = and i64 %self, -8
  %t4048 = inttoptr i64 %t4047 to ptr
  %t4049 = getelementptr i64, ptr %t4048, i64 3
  %t4050 = load i64, ptr %t4049
  %t4051 = call i64 @rt_cdr(i64 %t4050)
  %t4052 = and i64 %self, -8
  %t4053 = inttoptr i64 %t4052 to ptr
  %t4054 = getelementptr i64, ptr %t4053, i64 4
  %t4055 = load i64, ptr %t4054
  %t4056 = and i64 %self, -8
  %t4057 = inttoptr i64 %t4056 to ptr
  %t4058 = getelementptr i64, ptr %t4057, i64 1
  %t4059 = load i64, ptr %t4058
  %t4060 = or i64 %t4055, %t4059
  %t4061 = and i64 %t4060, 7
  %t4062 = icmp eq i64 %t4061, 0
  br i1 %t4062, label %fixfast933, label %fixslow934
fixfast933:
  %t4063 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4055, i64 %t4059)
  %t4064 = extractvalue {i64, i1} %t4063, 0
  %t4065 = extractvalue {i64, i1} %t4063, 1
  br i1 %t4065, label %fixslow934, label %fixmerge935
fixslow934:
  %t4066 = call i64 @rt_add(i64 %t4055, i64 %t4059)
  br label %fixmerge935
fixmerge935:
  %t4067 = phi i64 [ %t4064, %fixfast933 ], [ %t4066, %fixslow934 ]
  %t4068 = and i64 %self, -8
  %t4069 = inttoptr i64 %t4068 to ptr
  %t4070 = getelementptr i64, ptr %t4069, i64 2
  %t4071 = load i64, ptr %t4070
  %t4072 = musttail call fastcc i64 @"scheme.base:code_773"(i64 %t4071, i64 2, i64 %t4051, i64 %t4067, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4072
else932:
  %t4073 = and i64 %self, -8
  %t4074 = inttoptr i64 %t4073 to ptr
  %t4075 = getelementptr i64, ptr %t4074, i64 5
  %t4076 = load i64, ptr %t4075
  %t4077 = and i64 %self, -8
  %t4078 = inttoptr i64 %t4077 to ptr
  %t4079 = getelementptr i64, ptr %t4078, i64 4
  %t4080 = load i64, ptr %t4079
  %t4081 = or i64 %t4080, %a0
  %t4082 = and i64 %t4081, 7
  %t4083 = icmp eq i64 %t4082, 0
  br i1 %t4083, label %fixfast936, label %fixslow937
fixfast936:
  %t4084 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4080, i64 %a0)
  %t4085 = extractvalue {i64, i1} %t4084, 0
  %t4086 = extractvalue {i64, i1} %t4084, 1
  br i1 %t4086, label %fixslow937, label %fixmerge938
fixslow937:
  %t4087 = call i64 @rt_add(i64 %t4080, i64 %a0)
  br label %fixmerge938
fixmerge938:
  %t4088 = phi i64 [ %t4085, %fixfast936 ], [ %t4087, %fixslow937 ]
  %t4089 = and i64 %self, -8
  %t4090 = inttoptr i64 %t4089 to ptr
  %t4091 = getelementptr i64, ptr %t4090, i64 6
  %t4092 = load i64, ptr %t4091
  %t4093 = call i64 @rt_vector_ref(i64 %t4092, i64 %a0)
  %t4094 = call i64 @rt_vector_set(i64 %t4076, i64 %t4088, i64 %t4093)
  %t4095 = or i64 %a0, 8
  %t4096 = and i64 %t4095, 7
  %t4097 = icmp eq i64 %t4096, 0
  br i1 %t4097, label %fixfast939, label %fixslow940
fixfast939:
  %t4098 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4099 = extractvalue {i64, i1} %t4098, 0
  %t4100 = extractvalue {i64, i1} %t4098, 1
  br i1 %t4100, label %fixslow940, label %fixmerge941
fixslow940:
  %t4101 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge941
fixmerge941:
  %t4102 = phi i64 [ %t4099, %fixfast939 ], [ %t4101, %fixslow940 ]
  %t4103 = musttail call fastcc i64 @"scheme.base:code_775"(i64 %self, i64 1, i64 %t4102, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4103
}

define fastcc i64 @"scheme.base:code_773"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4104 = icmp eq i64 %argc, 2
  br i1 %t4104, label %argok943, label %arityerr942
arityerr942:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok943:
  %t4105 = call i64 @rt_null_p(i64 %a0)
  %t4106 = icmp ne i64 %t4105, 1
  br i1 %t4106, label %then944, label %else945
then944:
  %t4107 = and i64 %self, -8
  %t4108 = inttoptr i64 %t4107 to ptr
  %t4109 = getelementptr i64, ptr %t4108, i64 1
  %t4110 = load i64, ptr %t4109
  ret i64 %t4110
else945:
  %t4111 = call i64 @rt_car(i64 %a0)
  %t4112 = call i64 @rt_vector_length(i64 %t4111)
  %t4113 = call ptr @rt_alloc_words(i64 8)
  %t4114 = ptrtoint ptr %t4113 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_775" to i64), ptr %t4113
  %t4115 = or i64 %t4114, 4
  %t4116 = getelementptr i64, ptr %t4113, i64 1
  store i64 %t4112, ptr %t4116
  %t4117 = and i64 %self, -8
  %t4118 = inttoptr i64 %t4117 to ptr
  %t4119 = getelementptr i64, ptr %t4118, i64 2
  %t4120 = load i64, ptr %t4119
  %t4121 = getelementptr i64, ptr %t4113, i64 2
  store i64 %t4120, ptr %t4121
  %t4122 = getelementptr i64, ptr %t4113, i64 3
  store i64 %a0, ptr %t4122
  %t4123 = getelementptr i64, ptr %t4113, i64 4
  store i64 %a1, ptr %t4123
  %t4124 = and i64 %self, -8
  %t4125 = inttoptr i64 %t4124 to ptr
  %t4126 = getelementptr i64, ptr %t4125, i64 1
  %t4127 = load i64, ptr %t4126
  %t4128 = getelementptr i64, ptr %t4113, i64 5
  store i64 %t4127, ptr %t4128
  %t4129 = getelementptr i64, ptr %t4113, i64 6
  store i64 %t4111, ptr %t4129
  %t4130 = getelementptr i64, ptr %t4113, i64 7
  store i64 %t4115, ptr %t4130
  %t4131 = musttail call fastcc i64 @"scheme.base:code_775"(i64 %t4115, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4131
}

define fastcc i64 @"scheme.base:code:vector-append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4132 = icmp sge i64 %argc, 0
  br i1 %t4132, label %argok947, label %arityerr946
arityerr946:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok947:
  %t4133 = call ptr @rt_alloc_words(i64 8)
  %t4134 = getelementptr i64, ptr %t4133, i64 0
  store i64 %a0, ptr %t4134
  %t4135 = getelementptr i64, ptr %t4133, i64 1
  store i64 %a1, ptr %t4135
  %t4136 = getelementptr i64, ptr %t4133, i64 2
  store i64 %a2, ptr %t4136
  %t4137 = getelementptr i64, ptr %t4133, i64 3
  store i64 %a3, ptr %t4137
  %t4138 = getelementptr i64, ptr %t4133, i64 4
  store i64 %a4, ptr %t4138
  %t4139 = getelementptr i64, ptr %t4133, i64 5
  store i64 %a5, ptr %t4139
  %t4140 = getelementptr i64, ptr %t4133, i64 6
  store i64 %a6, ptr %t4140
  %t4141 = getelementptr i64, ptr %t4133, i64 7
  store i64 %a7, ptr %t4141
  %t4142 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t4133, ptr %overflow)
  %t4143 = load i64, ptr @"scheme.base:vec-total"
  call void @rt_check_callable(i64 %t4143)
  %t4144 = and i64 %t4143, -8
  %t4145 = inttoptr i64 %t4144 to ptr
  %t4146 = load i64, ptr %t4145
  %t4147 = inttoptr i64 %t4146 to ptr
  %t4148 = call fastcc i64%t4147(i64 %t4143, i64 1, i64 %t4142, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4149 = call i64 @rt_make_vector(i64 %t4148, i64 0)
  %t4150 = call ptr @rt_alloc_words(i64 3)
  %t4151 = ptrtoint ptr %t4150 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_773" to i64), ptr %t4150
  %t4152 = or i64 %t4151, 4
  %t4153 = getelementptr i64, ptr %t4150, i64 1
  store i64 %t4149, ptr %t4153
  %t4154 = getelementptr i64, ptr %t4150, i64 2
  store i64 %t4152, ptr %t4154
  %t4155 = musttail call fastcc i64 @"scheme.base:code_773"(i64 %t4152, i64 2, i64 %t4142, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4155
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector-append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4156 = load i64, ptr @"scheme.base:vec-total"
  call void @rt_check_callable(i64 %t4156)
  %t4157 = and i64 %t4156, -8
  %t4158 = inttoptr i64 %t4157 to ptr
  %t4159 = load i64, ptr %t4158
  %t4160 = inttoptr i64 %t4159 to ptr
  %t4161 = call fastcc i64%t4160(i64 %t4156, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4162 = call i64 @rt_make_vector(i64 %t4161, i64 0)
  %t4163 = call ptr @rt_alloc_words(i64 3)
  %t4164 = ptrtoint ptr %t4163 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_773" to i64), ptr %t4163
  %t4165 = or i64 %t4164, 4
  %t4166 = getelementptr i64, ptr %t4163, i64 1
  store i64 %t4162, ptr %t4166
  %t4167 = getelementptr i64, ptr %t4163, i64 2
  store i64 %t4165, ptr %t4167
  %t4168 = musttail call fastcc i64 @"scheme.base:code_773"(i64 %t4165, i64 2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4168
}

define fastcc i64 @"scheme.base:code:vec-total"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4173 = icmp eq i64 %argc, 1
  br i1 %t4173, label %argok949, label %arityerr948
arityerr948:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok949:
  %t4174 = call i64 @rt_null_p(i64 %a0)
  %t4175 = icmp ne i64 %t4174, 1
  br i1 %t4175, label %then950, label %else951
then950:
  ret i64 0
else951:
  %t4176 = call i64 @rt_car(i64 %a0)
  %t4177 = call i64 @rt_vector_length(i64 %t4176)
  %t4178 = call i64 @rt_cdr(i64 %a0)
  %t4179 = load i64, ptr @"scheme.base:vec-total"
  call void @rt_check_callable(i64 %t4179)
  %t4180 = and i64 %t4179, -8
  %t4181 = inttoptr i64 %t4180 to ptr
  %t4182 = load i64, ptr %t4181
  %t4183 = inttoptr i64 %t4182 to ptr
  %t4184 = call fastcc i64%t4183(i64 %t4179, i64 1, i64 %t4178, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4185 = or i64 %t4177, %t4184
  %t4186 = and i64 %t4185, 7
  %t4187 = icmp eq i64 %t4186, 0
  br i1 %t4187, label %fixfast952, label %fixslow953
fixfast952:
  %t4188 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4177, i64 %t4184)
  %t4189 = extractvalue {i64, i1} %t4188, 0
  %t4190 = extractvalue {i64, i1} %t4188, 1
  br i1 %t4190, label %fixslow953, label %fixmerge954
fixslow953:
  %t4191 = call i64 @rt_add(i64 %t4177, i64 %t4184)
  br label %fixmerge954
fixmerge954:
  %t4192 = phi i64 [ %t4189, %fixfast952 ], [ %t4191, %fixslow953 ]
  ret i64 %t4192
}

define fastcc i64 @"scheme.base:code_792"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4197 = icmp eq i64 %argc, 1
  br i1 %t4197, label %argok956, label %arityerr955
arityerr955:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok956:
  %t4198 = and i64 %self, -8
  %t4199 = inttoptr i64 %t4198 to ptr
  %t4200 = getelementptr i64, ptr %t4199, i64 1
  %t4201 = load i64, ptr %t4200
  %t4202 = or i64 %a0, %t4201
  %t4203 = and i64 %t4202, 7
  %t4204 = icmp eq i64 %t4203, 0
  br i1 %t4204, label %fixfast957, label %fixslow958
fixfast957:
  %t4205 = icmp eq i64 %a0, %t4201
  %t4206 = select i1 %t4205, i64 257, i64 1
  br label %fixmerge959
fixslow958:
  %t4207 = call i64 @rt_num_eq(i64 %a0, i64 %t4201)
  br label %fixmerge959
fixmerge959:
  %t4208 = phi i64 [ %t4206, %fixfast957 ], [ %t4207, %fixslow958 ]
  %t4209 = icmp ne i64 %t4208, 1
  br i1 %t4209, label %then960, label %else961
then960:
  %t4210 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4210)
  %t4211 = and i64 %t4210, -8
  %t4212 = inttoptr i64 %t4211 to ptr
  %t4213 = load i64, ptr %t4212
  %t4214 = inttoptr i64 %t4213 to ptr
  %t4215 = musttail call fastcc i64 %t4214(i64 %t4210, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4215
else961:
  %t4216 = and i64 %self, -8
  %t4217 = inttoptr i64 %t4216 to ptr
  %t4218 = getelementptr i64, ptr %t4217, i64 2
  %t4219 = load i64, ptr %t4218
  %t4220 = and i64 %self, -8
  %t4221 = inttoptr i64 %t4220 to ptr
  %t4222 = getelementptr i64, ptr %t4221, i64 3
  %t4223 = load i64, ptr %t4222
  %t4224 = call i64 @rt_vector_set(i64 %t4219, i64 %a0, i64 %t4223)
  %t4225 = or i64 %a0, 8
  %t4226 = and i64 %t4225, 7
  %t4227 = icmp eq i64 %t4226, 0
  br i1 %t4227, label %fixfast962, label %fixslow963
fixfast962:
  %t4228 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4229 = extractvalue {i64, i1} %t4228, 0
  %t4230 = extractvalue {i64, i1} %t4228, 1
  br i1 %t4230, label %fixslow963, label %fixmerge964
fixslow963:
  %t4231 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge964
fixmerge964:
  %t4232 = phi i64 [ %t4229, %fixfast962 ], [ %t4231, %fixslow963 ]
  %t4233 = musttail call fastcc i64 @"scheme.base:code_792"(i64 %self, i64 1, i64 %t4232, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4233
}

define fastcc i64 @"scheme.base:code:vector-fill!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4234 = icmp sge i64 %argc, 2
  br i1 %t4234, label %argok966, label %arityerr965
arityerr965:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok966:
  %t4235 = call ptr @rt_alloc_words(i64 8)
  %t4236 = getelementptr i64, ptr %t4235, i64 0
  store i64 %a0, ptr %t4236
  %t4237 = getelementptr i64, ptr %t4235, i64 1
  store i64 %a1, ptr %t4237
  %t4238 = getelementptr i64, ptr %t4235, i64 2
  store i64 %a2, ptr %t4238
  %t4239 = getelementptr i64, ptr %t4235, i64 3
  store i64 %a3, ptr %t4239
  %t4240 = getelementptr i64, ptr %t4235, i64 4
  store i64 %a4, ptr %t4240
  %t4241 = getelementptr i64, ptr %t4235, i64 5
  store i64 %a5, ptr %t4241
  %t4242 = getelementptr i64, ptr %t4235, i64 6
  store i64 %a6, ptr %t4242
  %t4243 = getelementptr i64, ptr %t4235, i64 7
  store i64 %a7, ptr %t4243
  %t4244 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t4235, ptr %overflow)
  %t4245 = call i64 @rt_vector_length(i64 %a0)
  %t4246 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4246)
  %t4247 = and i64 %t4246, -8
  %t4248 = inttoptr i64 %t4247 to ptr
  %t4249 = load i64, ptr %t4248
  %t4250 = inttoptr i64 %t4249 to ptr
  %t4251 = call fastcc i64%t4250(i64 %t4246, i64 1, i64 %t4244, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4252 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4252)
  %t4253 = and i64 %t4252, -8
  %t4254 = inttoptr i64 %t4253 to ptr
  %t4255 = load i64, ptr %t4254
  %t4256 = inttoptr i64 %t4255 to ptr
  %t4257 = call fastcc i64%t4256(i64 %t4252, i64 2, i64 %t4244, i64 %t4245, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4258 = call i64 @rt_intern(ptr @.str.sym.23)
  %t4259 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4259)
  %t4260 = and i64 %t4259, -8
  %t4261 = inttoptr i64 %t4260 to ptr
  %t4262 = load i64, ptr %t4261
  %t4263 = inttoptr i64 %t4262 to ptr
  %t4264 = call fastcc i64%t4263(i64 %t4259, i64 4, i64 %t4258, i64 %t4251, i64 %t4257, i64 %t4245, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4265 = call ptr @rt_alloc_words(i64 5)
  %t4266 = ptrtoint ptr %t4265 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_792" to i64), ptr %t4265
  %t4267 = or i64 %t4266, 4
  %t4268 = getelementptr i64, ptr %t4265, i64 1
  store i64 %t4257, ptr %t4268
  %t4269 = getelementptr i64, ptr %t4265, i64 2
  store i64 %a0, ptr %t4269
  %t4270 = getelementptr i64, ptr %t4265, i64 3
  store i64 %a1, ptr %t4270
  %t4271 = getelementptr i64, ptr %t4265, i64 4
  store i64 %t4267, ptr %t4271
  %t4272 = musttail call fastcc i64 @"scheme.base:code_792"(i64 %t4267, i64 1, i64 %t4251, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4272
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector-fill!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4273 = call i64 @rt_vector_length(i64 %a0)
  %t4274 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4274)
  %t4275 = and i64 %t4274, -8
  %t4276 = inttoptr i64 %t4275 to ptr
  %t4277 = load i64, ptr %t4276
  %t4278 = inttoptr i64 %t4277 to ptr
  %t4279 = call fastcc i64%t4278(i64 %t4274, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4280 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4280)
  %t4281 = and i64 %t4280, -8
  %t4282 = inttoptr i64 %t4281 to ptr
  %t4283 = load i64, ptr %t4282
  %t4284 = inttoptr i64 %t4283 to ptr
  %t4285 = call fastcc i64%t4284(i64 %t4280, i64 2, i64 2, i64 %t4273, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4286 = call i64 @rt_intern(ptr @.str.sym.23)
  %t4287 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4287)
  %t4288 = and i64 %t4287, -8
  %t4289 = inttoptr i64 %t4288 to ptr
  %t4290 = load i64, ptr %t4289
  %t4291 = inttoptr i64 %t4290 to ptr
  %t4292 = call fastcc i64%t4291(i64 %t4287, i64 4, i64 %t4286, i64 %t4279, i64 %t4285, i64 %t4273, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4293 = call ptr @rt_alloc_words(i64 5)
  %t4294 = ptrtoint ptr %t4293 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_792" to i64), ptr %t4293
  %t4295 = or i64 %t4294, 4
  %t4296 = getelementptr i64, ptr %t4293, i64 1
  store i64 %t4285, ptr %t4296
  %t4297 = getelementptr i64, ptr %t4293, i64 2
  store i64 %a0, ptr %t4297
  %t4298 = getelementptr i64, ptr %t4293, i64 3
  store i64 %a1, ptr %t4298
  %t4299 = getelementptr i64, ptr %t4293, i64 4
  store i64 %t4295, ptr %t4299
  %t4300 = musttail call fastcc i64 @"scheme.base:code_792"(i64 %t4295, i64 1, i64 %t4279, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4300
}

define fastcc i64 @"scheme.base:code_818"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4305 = icmp eq i64 %argc, 1
  br i1 %t4305, label %argok968, label %arityerr967
arityerr967:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok968:
  %t4306 = or i64 %a0, 0
  %t4307 = and i64 %t4306, 7
  %t4308 = icmp eq i64 %t4307, 0
  br i1 %t4308, label %fixfast969, label %fixslow970
fixfast969:
  %t4309 = icmp slt i64 %a0, 0
  %t4310 = select i1 %t4309, i64 257, i64 1
  br label %fixmerge971
fixslow970:
  %t4311 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge971
fixmerge971:
  %t4312 = phi i64 [ %t4310, %fixfast969 ], [ %t4311, %fixslow970 ]
  %t4313 = icmp ne i64 %t4312, 1
  br i1 %t4313, label %then972, label %else973
then972:
  %t4314 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4314)
  %t4315 = and i64 %t4314, -8
  %t4316 = inttoptr i64 %t4315 to ptr
  %t4317 = load i64, ptr %t4316
  %t4318 = inttoptr i64 %t4317 to ptr
  %t4319 = musttail call fastcc i64 %t4318(i64 %t4314, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4319
else973:
  %t4320 = and i64 %self, -8
  %t4321 = inttoptr i64 %t4320 to ptr
  %t4322 = getelementptr i64, ptr %t4321, i64 1
  %t4323 = load i64, ptr %t4322
  %t4324 = and i64 %self, -8
  %t4325 = inttoptr i64 %t4324 to ptr
  %t4326 = getelementptr i64, ptr %t4325, i64 2
  %t4327 = load i64, ptr %t4326
  %t4328 = or i64 %t4327, %a0
  %t4329 = and i64 %t4328, 7
  %t4330 = icmp eq i64 %t4329, 0
  br i1 %t4330, label %fixfast974, label %fixslow975
fixfast974:
  %t4331 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4327, i64 %a0)
  %t4332 = extractvalue {i64, i1} %t4331, 0
  %t4333 = extractvalue {i64, i1} %t4331, 1
  br i1 %t4333, label %fixslow975, label %fixmerge976
fixslow975:
  %t4334 = call i64 @rt_add(i64 %t4327, i64 %a0)
  br label %fixmerge976
fixmerge976:
  %t4335 = phi i64 [ %t4332, %fixfast974 ], [ %t4334, %fixslow975 ]
  %t4336 = and i64 %self, -8
  %t4337 = inttoptr i64 %t4336 to ptr
  %t4338 = getelementptr i64, ptr %t4337, i64 3
  %t4339 = load i64, ptr %t4338
  %t4340 = and i64 %self, -8
  %t4341 = inttoptr i64 %t4340 to ptr
  %t4342 = getelementptr i64, ptr %t4341, i64 4
  %t4343 = load i64, ptr %t4342
  %t4344 = or i64 %t4343, %a0
  %t4345 = and i64 %t4344, 7
  %t4346 = icmp eq i64 %t4345, 0
  br i1 %t4346, label %fixfast977, label %fixslow978
fixfast977:
  %t4347 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4343, i64 %a0)
  %t4348 = extractvalue {i64, i1} %t4347, 0
  %t4349 = extractvalue {i64, i1} %t4347, 1
  br i1 %t4349, label %fixslow978, label %fixmerge979
fixslow978:
  %t4350 = call i64 @rt_add(i64 %t4343, i64 %a0)
  br label %fixmerge979
fixmerge979:
  %t4351 = phi i64 [ %t4348, %fixfast977 ], [ %t4350, %fixslow978 ]
  %t4352 = call i64 @rt_vector_ref(i64 %t4339, i64 %t4351)
  %t4353 = call i64 @rt_vector_set(i64 %t4323, i64 %t4335, i64 %t4352)
  %t4354 = or i64 %a0, 8
  %t4355 = and i64 %t4354, 7
  %t4356 = icmp eq i64 %t4355, 0
  br i1 %t4356, label %fixfast980, label %fixslow981
fixfast980:
  %t4357 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t4358 = extractvalue {i64, i1} %t4357, 0
  %t4359 = extractvalue {i64, i1} %t4357, 1
  br i1 %t4359, label %fixslow981, label %fixmerge982
fixslow981:
  %t4360 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge982
fixmerge982:
  %t4361 = phi i64 [ %t4358, %fixfast980 ], [ %t4360, %fixslow981 ]
  %t4362 = musttail call fastcc i64 @"scheme.base:code_818"(i64 %self, i64 1, i64 %t4361, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4362
}

define fastcc i64 @"scheme.base:code_820"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4363 = icmp eq i64 %argc, 1
  br i1 %t4363, label %argok984, label %arityerr983
arityerr983:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok984:
  %t4364 = and i64 %self, -8
  %t4365 = inttoptr i64 %t4364 to ptr
  %t4366 = getelementptr i64, ptr %t4365, i64 1
  %t4367 = load i64, ptr %t4366
  %t4368 = and i64 %self, -8
  %t4369 = inttoptr i64 %t4368 to ptr
  %t4370 = getelementptr i64, ptr %t4369, i64 2
  %t4371 = load i64, ptr %t4370
  %t4372 = or i64 %t4367, %t4371
  %t4373 = and i64 %t4372, 7
  %t4374 = icmp eq i64 %t4373, 0
  br i1 %t4374, label %fixfast985, label %fixslow986
fixfast985:
  %t4375 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4367, i64 %t4371)
  %t4376 = extractvalue {i64, i1} %t4375, 0
  %t4377 = extractvalue {i64, i1} %t4375, 1
  br i1 %t4377, label %fixslow986, label %fixmerge987
fixslow986:
  %t4378 = call i64 @rt_sub(i64 %t4367, i64 %t4371)
  br label %fixmerge987
fixmerge987:
  %t4379 = phi i64 [ %t4376, %fixfast985 ], [ %t4378, %fixslow986 ]
  %t4380 = or i64 %a0, %t4379
  %t4381 = and i64 %t4380, 7
  %t4382 = icmp eq i64 %t4381, 0
  br i1 %t4382, label %fixfast988, label %fixslow989
fixfast988:
  %t4383 = icmp eq i64 %a0, %t4379
  %t4384 = select i1 %t4383, i64 257, i64 1
  br label %fixmerge990
fixslow989:
  %t4385 = call i64 @rt_num_eq(i64 %a0, i64 %t4379)
  br label %fixmerge990
fixmerge990:
  %t4386 = phi i64 [ %t4384, %fixfast988 ], [ %t4385, %fixslow989 ]
  %t4387 = icmp ne i64 %t4386, 1
  br i1 %t4387, label %then991, label %else992
then991:
  %t4388 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4388)
  %t4389 = and i64 %t4388, -8
  %t4390 = inttoptr i64 %t4389 to ptr
  %t4391 = load i64, ptr %t4390
  %t4392 = inttoptr i64 %t4391 to ptr
  %t4393 = musttail call fastcc i64 %t4392(i64 %t4388, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4393
else992:
  %t4394 = and i64 %self, -8
  %t4395 = inttoptr i64 %t4394 to ptr
  %t4396 = getelementptr i64, ptr %t4395, i64 3
  %t4397 = load i64, ptr %t4396
  %t4398 = and i64 %self, -8
  %t4399 = inttoptr i64 %t4398 to ptr
  %t4400 = getelementptr i64, ptr %t4399, i64 4
  %t4401 = load i64, ptr %t4400
  %t4402 = or i64 %t4401, %a0
  %t4403 = and i64 %t4402, 7
  %t4404 = icmp eq i64 %t4403, 0
  br i1 %t4404, label %fixfast993, label %fixslow994
fixfast993:
  %t4405 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4401, i64 %a0)
  %t4406 = extractvalue {i64, i1} %t4405, 0
  %t4407 = extractvalue {i64, i1} %t4405, 1
  br i1 %t4407, label %fixslow994, label %fixmerge995
fixslow994:
  %t4408 = call i64 @rt_add(i64 %t4401, i64 %a0)
  br label %fixmerge995
fixmerge995:
  %t4409 = phi i64 [ %t4406, %fixfast993 ], [ %t4408, %fixslow994 ]
  %t4410 = and i64 %self, -8
  %t4411 = inttoptr i64 %t4410 to ptr
  %t4412 = getelementptr i64, ptr %t4411, i64 5
  %t4413 = load i64, ptr %t4412
  %t4414 = and i64 %self, -8
  %t4415 = inttoptr i64 %t4414 to ptr
  %t4416 = getelementptr i64, ptr %t4415, i64 2
  %t4417 = load i64, ptr %t4416
  %t4418 = or i64 %t4417, %a0
  %t4419 = and i64 %t4418, 7
  %t4420 = icmp eq i64 %t4419, 0
  br i1 %t4420, label %fixfast996, label %fixslow997
fixfast996:
  %t4421 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4417, i64 %a0)
  %t4422 = extractvalue {i64, i1} %t4421, 0
  %t4423 = extractvalue {i64, i1} %t4421, 1
  br i1 %t4423, label %fixslow997, label %fixmerge998
fixslow997:
  %t4424 = call i64 @rt_add(i64 %t4417, i64 %a0)
  br label %fixmerge998
fixmerge998:
  %t4425 = phi i64 [ %t4422, %fixfast996 ], [ %t4424, %fixslow997 ]
  %t4426 = call i64 @rt_vector_ref(i64 %t4413, i64 %t4425)
  %t4427 = call i64 @rt_vector_set(i64 %t4397, i64 %t4409, i64 %t4426)
  %t4428 = or i64 %a0, 8
  %t4429 = and i64 %t4428, 7
  %t4430 = icmp eq i64 %t4429, 0
  br i1 %t4430, label %fixfast999, label %fixslow1000
fixfast999:
  %t4431 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4432 = extractvalue {i64, i1} %t4431, 0
  %t4433 = extractvalue {i64, i1} %t4431, 1
  br i1 %t4433, label %fixslow1000, label %fixmerge1001
fixslow1000:
  %t4434 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1001
fixmerge1001:
  %t4435 = phi i64 [ %t4432, %fixfast999 ], [ %t4434, %fixslow1000 ]
  %t4436 = musttail call fastcc i64 @"scheme.base:code_820"(i64 %self, i64 1, i64 %t4435, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4436
}

define fastcc i64 @"scheme.base:code:vector-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4437 = icmp sge i64 %argc, 3
  br i1 %t4437, label %argok1003, label %arityerr1002
arityerr1002:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1003:
  %t4438 = call ptr @rt_alloc_words(i64 8)
  %t4439 = getelementptr i64, ptr %t4438, i64 0
  store i64 %a0, ptr %t4439
  %t4440 = getelementptr i64, ptr %t4438, i64 1
  store i64 %a1, ptr %t4440
  %t4441 = getelementptr i64, ptr %t4438, i64 2
  store i64 %a2, ptr %t4441
  %t4442 = getelementptr i64, ptr %t4438, i64 3
  store i64 %a3, ptr %t4442
  %t4443 = getelementptr i64, ptr %t4438, i64 4
  store i64 %a4, ptr %t4443
  %t4444 = getelementptr i64, ptr %t4438, i64 5
  store i64 %a5, ptr %t4444
  %t4445 = getelementptr i64, ptr %t4438, i64 6
  store i64 %a6, ptr %t4445
  %t4446 = getelementptr i64, ptr %t4438, i64 7
  store i64 %a7, ptr %t4446
  %t4447 = call i64 @rt_build_rest(i64 %argc, i64 3, i64 8, ptr %t4438, ptr %overflow)
  %t4448 = call i64 @rt_vector_length(i64 %a2)
  %t4449 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4449)
  %t4450 = and i64 %t4449, -8
  %t4451 = inttoptr i64 %t4450 to ptr
  %t4452 = load i64, ptr %t4451
  %t4453 = inttoptr i64 %t4452 to ptr
  %t4454 = call fastcc i64%t4453(i64 %t4449, i64 1, i64 %t4447, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4455 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4455)
  %t4456 = and i64 %t4455, -8
  %t4457 = inttoptr i64 %t4456 to ptr
  %t4458 = load i64, ptr %t4457
  %t4459 = inttoptr i64 %t4458 to ptr
  %t4460 = call fastcc i64%t4459(i64 %t4455, i64 2, i64 %t4447, i64 %t4448, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4461 = call i64 @rt_intern(ptr @.str.sym.24)
  %t4462 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4462)
  %t4463 = and i64 %t4462, -8
  %t4464 = inttoptr i64 %t4463 to ptr
  %t4465 = load i64, ptr %t4464
  %t4466 = inttoptr i64 %t4465 to ptr
  %t4467 = call fastcc i64%t4466(i64 %t4462, i64 4, i64 %t4461, i64 %t4454, i64 %t4460, i64 %t4448, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4468 = call i64 @rt_intern(ptr @.str.sym.24)
  %t4469 = or i64 %t4460, %t4454
  %t4470 = and i64 %t4469, 7
  %t4471 = icmp eq i64 %t4470, 0
  br i1 %t4471, label %fixfast1004, label %fixslow1005
fixfast1004:
  %t4472 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4460, i64 %t4454)
  %t4473 = extractvalue {i64, i1} %t4472, 0
  %t4474 = extractvalue {i64, i1} %t4472, 1
  br i1 %t4474, label %fixslow1005, label %fixmerge1006
fixslow1005:
  %t4475 = call i64 @rt_sub(i64 %t4460, i64 %t4454)
  br label %fixmerge1006
fixmerge1006:
  %t4476 = phi i64 [ %t4473, %fixfast1004 ], [ %t4475, %fixslow1005 ]
  %t4477 = or i64 %a1, %t4476
  %t4478 = and i64 %t4477, 7
  %t4479 = icmp eq i64 %t4478, 0
  br i1 %t4479, label %fixfast1007, label %fixslow1008
fixfast1007:
  %t4480 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t4476)
  %t4481 = extractvalue {i64, i1} %t4480, 0
  %t4482 = extractvalue {i64, i1} %t4480, 1
  br i1 %t4482, label %fixslow1008, label %fixmerge1009
fixslow1008:
  %t4483 = call i64 @rt_add(i64 %a1, i64 %t4476)
  br label %fixmerge1009
fixmerge1009:
  %t4484 = phi i64 [ %t4481, %fixfast1007 ], [ %t4483, %fixslow1008 ]
  %t4485 = call i64 @rt_vector_length(i64 %a0)
  %t4486 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4486)
  %t4487 = and i64 %t4486, -8
  %t4488 = inttoptr i64 %t4487 to ptr
  %t4489 = load i64, ptr %t4488
  %t4490 = inttoptr i64 %t4489 to ptr
  %t4491 = call fastcc i64%t4490(i64 %t4486, i64 4, i64 %t4468, i64 %a1, i64 %t4484, i64 %t4485, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4492 = or i64 %t4454, %a1
  %t4493 = and i64 %t4492, 7
  %t4494 = icmp eq i64 %t4493, 0
  br i1 %t4494, label %fixfast1010, label %fixslow1011
fixfast1010:
  %t4495 = icmp slt i64 %t4454, %a1
  %t4496 = select i1 %t4495, i64 257, i64 1
  br label %fixmerge1012
fixslow1011:
  %t4497 = call i64 @rt_lt(i64 %t4454, i64 %a1)
  br label %fixmerge1012
fixmerge1012:
  %t4498 = phi i64 [ %t4496, %fixfast1010 ], [ %t4497, %fixslow1011 ]
  %t4499 = icmp ne i64 %t4498, 1
  br i1 %t4499, label %then1013, label %else1014
then1013:
  %t4500 = call ptr @rt_alloc_words(i64 6)
  %t4501 = ptrtoint ptr %t4500 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_818" to i64), ptr %t4500
  %t4502 = or i64 %t4501, 4
  %t4503 = getelementptr i64, ptr %t4500, i64 1
  store i64 %a0, ptr %t4503
  %t4504 = getelementptr i64, ptr %t4500, i64 2
  store i64 %a1, ptr %t4504
  %t4505 = getelementptr i64, ptr %t4500, i64 3
  store i64 %a2, ptr %t4505
  %t4506 = getelementptr i64, ptr %t4500, i64 4
  store i64 %t4454, ptr %t4506
  %t4507 = getelementptr i64, ptr %t4500, i64 5
  store i64 %t4502, ptr %t4507
  %t4508 = or i64 %t4460, %t4454
  %t4509 = and i64 %t4508, 7
  %t4510 = icmp eq i64 %t4509, 0
  br i1 %t4510, label %fixfast1015, label %fixslow1016
fixfast1015:
  %t4511 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4460, i64 %t4454)
  %t4512 = extractvalue {i64, i1} %t4511, 0
  %t4513 = extractvalue {i64, i1} %t4511, 1
  br i1 %t4513, label %fixslow1016, label %fixmerge1017
fixslow1016:
  %t4514 = call i64 @rt_sub(i64 %t4460, i64 %t4454)
  br label %fixmerge1017
fixmerge1017:
  %t4515 = phi i64 [ %t4512, %fixfast1015 ], [ %t4514, %fixslow1016 ]
  %t4516 = or i64 %t4515, 8
  %t4517 = and i64 %t4516, 7
  %t4518 = icmp eq i64 %t4517, 0
  br i1 %t4518, label %fixfast1018, label %fixslow1019
fixfast1018:
  %t4519 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4515, i64 8)
  %t4520 = extractvalue {i64, i1} %t4519, 0
  %t4521 = extractvalue {i64, i1} %t4519, 1
  br i1 %t4521, label %fixslow1019, label %fixmerge1020
fixslow1019:
  %t4522 = call i64 @rt_sub(i64 %t4515, i64 8)
  br label %fixmerge1020
fixmerge1020:
  %t4523 = phi i64 [ %t4520, %fixfast1018 ], [ %t4522, %fixslow1019 ]
  %t4524 = musttail call fastcc i64 @"scheme.base:code_818"(i64 %t4502, i64 1, i64 %t4523, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4524
else1014:
  %t4525 = call ptr @rt_alloc_words(i64 7)
  %t4526 = ptrtoint ptr %t4525 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_820" to i64), ptr %t4525
  %t4527 = or i64 %t4526, 4
  %t4528 = getelementptr i64, ptr %t4525, i64 1
  store i64 %t4460, ptr %t4528
  %t4529 = getelementptr i64, ptr %t4525, i64 2
  store i64 %t4454, ptr %t4529
  %t4530 = getelementptr i64, ptr %t4525, i64 3
  store i64 %a0, ptr %t4530
  %t4531 = getelementptr i64, ptr %t4525, i64 4
  store i64 %a1, ptr %t4531
  %t4532 = getelementptr i64, ptr %t4525, i64 5
  store i64 %a2, ptr %t4532
  %t4533 = getelementptr i64, ptr %t4525, i64 6
  store i64 %t4527, ptr %t4533
  %t4534 = musttail call fastcc i64 @"scheme.base:code_820"(i64 %t4527, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4534
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4535 = call i64 @rt_vector_length(i64 %a2)
  %t4536 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4536)
  %t4537 = and i64 %t4536, -8
  %t4538 = inttoptr i64 %t4537 to ptr
  %t4539 = load i64, ptr %t4538
  %t4540 = inttoptr i64 %t4539 to ptr
  %t4541 = call fastcc i64%t4540(i64 %t4536, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4542 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4542)
  %t4543 = and i64 %t4542, -8
  %t4544 = inttoptr i64 %t4543 to ptr
  %t4545 = load i64, ptr %t4544
  %t4546 = inttoptr i64 %t4545 to ptr
  %t4547 = call fastcc i64%t4546(i64 %t4542, i64 2, i64 2, i64 %t4535, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4548 = call i64 @rt_intern(ptr @.str.sym.24)
  %t4549 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4549)
  %t4550 = and i64 %t4549, -8
  %t4551 = inttoptr i64 %t4550 to ptr
  %t4552 = load i64, ptr %t4551
  %t4553 = inttoptr i64 %t4552 to ptr
  %t4554 = call fastcc i64%t4553(i64 %t4549, i64 4, i64 %t4548, i64 %t4541, i64 %t4547, i64 %t4535, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4555 = call i64 @rt_intern(ptr @.str.sym.24)
  %t4556 = or i64 %t4547, %t4541
  %t4557 = and i64 %t4556, 7
  %t4558 = icmp eq i64 %t4557, 0
  br i1 %t4558, label %fixfast1021, label %fixslow1022
fixfast1021:
  %t4559 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4547, i64 %t4541)
  %t4560 = extractvalue {i64, i1} %t4559, 0
  %t4561 = extractvalue {i64, i1} %t4559, 1
  br i1 %t4561, label %fixslow1022, label %fixmerge1023
fixslow1022:
  %t4562 = call i64 @rt_sub(i64 %t4547, i64 %t4541)
  br label %fixmerge1023
fixmerge1023:
  %t4563 = phi i64 [ %t4560, %fixfast1021 ], [ %t4562, %fixslow1022 ]
  %t4564 = or i64 %a1, %t4563
  %t4565 = and i64 %t4564, 7
  %t4566 = icmp eq i64 %t4565, 0
  br i1 %t4566, label %fixfast1024, label %fixslow1025
fixfast1024:
  %t4567 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t4563)
  %t4568 = extractvalue {i64, i1} %t4567, 0
  %t4569 = extractvalue {i64, i1} %t4567, 1
  br i1 %t4569, label %fixslow1025, label %fixmerge1026
fixslow1025:
  %t4570 = call i64 @rt_add(i64 %a1, i64 %t4563)
  br label %fixmerge1026
fixmerge1026:
  %t4571 = phi i64 [ %t4568, %fixfast1024 ], [ %t4570, %fixslow1025 ]
  %t4572 = call i64 @rt_vector_length(i64 %a0)
  %t4573 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4573)
  %t4574 = and i64 %t4573, -8
  %t4575 = inttoptr i64 %t4574 to ptr
  %t4576 = load i64, ptr %t4575
  %t4577 = inttoptr i64 %t4576 to ptr
  %t4578 = call fastcc i64%t4577(i64 %t4573, i64 4, i64 %t4555, i64 %a1, i64 %t4571, i64 %t4572, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4579 = or i64 %t4541, %a1
  %t4580 = and i64 %t4579, 7
  %t4581 = icmp eq i64 %t4580, 0
  br i1 %t4581, label %fixfast1027, label %fixslow1028
fixfast1027:
  %t4582 = icmp slt i64 %t4541, %a1
  %t4583 = select i1 %t4582, i64 257, i64 1
  br label %fixmerge1029
fixslow1028:
  %t4584 = call i64 @rt_lt(i64 %t4541, i64 %a1)
  br label %fixmerge1029
fixmerge1029:
  %t4585 = phi i64 [ %t4583, %fixfast1027 ], [ %t4584, %fixslow1028 ]
  %t4586 = icmp ne i64 %t4585, 1
  br i1 %t4586, label %then1030, label %else1031
then1030:
  %t4587 = call ptr @rt_alloc_words(i64 6)
  %t4588 = ptrtoint ptr %t4587 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_818" to i64), ptr %t4587
  %t4589 = or i64 %t4588, 4
  %t4590 = getelementptr i64, ptr %t4587, i64 1
  store i64 %a0, ptr %t4590
  %t4591 = getelementptr i64, ptr %t4587, i64 2
  store i64 %a1, ptr %t4591
  %t4592 = getelementptr i64, ptr %t4587, i64 3
  store i64 %a2, ptr %t4592
  %t4593 = getelementptr i64, ptr %t4587, i64 4
  store i64 %t4541, ptr %t4593
  %t4594 = getelementptr i64, ptr %t4587, i64 5
  store i64 %t4589, ptr %t4594
  %t4595 = or i64 %t4547, %t4541
  %t4596 = and i64 %t4595, 7
  %t4597 = icmp eq i64 %t4596, 0
  br i1 %t4597, label %fixfast1032, label %fixslow1033
fixfast1032:
  %t4598 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4547, i64 %t4541)
  %t4599 = extractvalue {i64, i1} %t4598, 0
  %t4600 = extractvalue {i64, i1} %t4598, 1
  br i1 %t4600, label %fixslow1033, label %fixmerge1034
fixslow1033:
  %t4601 = call i64 @rt_sub(i64 %t4547, i64 %t4541)
  br label %fixmerge1034
fixmerge1034:
  %t4602 = phi i64 [ %t4599, %fixfast1032 ], [ %t4601, %fixslow1033 ]
  %t4603 = or i64 %t4602, 8
  %t4604 = and i64 %t4603, 7
  %t4605 = icmp eq i64 %t4604, 0
  br i1 %t4605, label %fixfast1035, label %fixslow1036
fixfast1035:
  %t4606 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4602, i64 8)
  %t4607 = extractvalue {i64, i1} %t4606, 0
  %t4608 = extractvalue {i64, i1} %t4606, 1
  br i1 %t4608, label %fixslow1036, label %fixmerge1037
fixslow1036:
  %t4609 = call i64 @rt_sub(i64 %t4602, i64 8)
  br label %fixmerge1037
fixmerge1037:
  %t4610 = phi i64 [ %t4607, %fixfast1035 ], [ %t4609, %fixslow1036 ]
  %t4611 = musttail call fastcc i64 @"scheme.base:code_818"(i64 %t4589, i64 1, i64 %t4610, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4611
else1031:
  %t4612 = call ptr @rt_alloc_words(i64 7)
  %t4613 = ptrtoint ptr %t4612 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_820" to i64), ptr %t4612
  %t4614 = or i64 %t4613, 4
  %t4615 = getelementptr i64, ptr %t4612, i64 1
  store i64 %t4547, ptr %t4615
  %t4616 = getelementptr i64, ptr %t4612, i64 2
  store i64 %t4541, ptr %t4616
  %t4617 = getelementptr i64, ptr %t4612, i64 3
  store i64 %a0, ptr %t4617
  %t4618 = getelementptr i64, ptr %t4612, i64 4
  store i64 %a1, ptr %t4618
  %t4619 = getelementptr i64, ptr %t4612, i64 5
  store i64 %a2, ptr %t4619
  %t4620 = getelementptr i64, ptr %t4612, i64 6
  store i64 %t4614, ptr %t4620
  %t4621 = musttail call fastcc i64 @"scheme.base:code_820"(i64 %t4614, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4621
}

define fastcc i64 @"scheme.base:code_843"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4626 = icmp eq i64 %argc, 1
  br i1 %t4626, label %argok1039, label %arityerr1038
arityerr1038:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1039:
  %t4627 = and i64 %self, -8
  %t4628 = inttoptr i64 %t4627 to ptr
  %t4629 = getelementptr i64, ptr %t4628, i64 1
  %t4630 = load i64, ptr %t4629
  %t4631 = or i64 %a0, %t4630
  %t4632 = and i64 %t4631, 7
  %t4633 = icmp eq i64 %t4632, 0
  br i1 %t4633, label %fixfast1040, label %fixslow1041
fixfast1040:
  %t4634 = icmp eq i64 %a0, %t4630
  %t4635 = select i1 %t4634, i64 257, i64 1
  br label %fixmerge1042
fixslow1041:
  %t4636 = call i64 @rt_num_eq(i64 %a0, i64 %t4630)
  br label %fixmerge1042
fixmerge1042:
  %t4637 = phi i64 [ %t4635, %fixfast1040 ], [ %t4636, %fixslow1041 ]
  %t4638 = icmp ne i64 %t4637, 1
  br i1 %t4638, label %then1043, label %else1044
then1043:
  %t4639 = and i64 %self, -8
  %t4640 = inttoptr i64 %t4639 to ptr
  %t4641 = getelementptr i64, ptr %t4640, i64 2
  %t4642 = load i64, ptr %t4641
  ret i64 %t4642
else1044:
  %t4643 = and i64 %self, -8
  %t4644 = inttoptr i64 %t4643 to ptr
  %t4645 = getelementptr i64, ptr %t4644, i64 2
  %t4646 = load i64, ptr %t4645
  %t4647 = and i64 %self, -8
  %t4648 = inttoptr i64 %t4647 to ptr
  %t4649 = getelementptr i64, ptr %t4648, i64 4
  %t4650 = load i64, ptr %t4649
  %t4651 = call i64 @rt_vector_ref(i64 %t4650, i64 %a0)
  %t4652 = and i64 %self, -8
  %t4653 = inttoptr i64 %t4652 to ptr
  %t4654 = getelementptr i64, ptr %t4653, i64 3
  %t4655 = load i64, ptr %t4654
  call void @rt_check_callable(i64 %t4655)
  %t4656 = and i64 %t4655, -8
  %t4657 = inttoptr i64 %t4656 to ptr
  %t4658 = load i64, ptr %t4657
  %t4659 = inttoptr i64 %t4658 to ptr
  %t4660 = call fastcc i64%t4659(i64 %t4655, i64 1, i64 %t4651, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4661 = call i64 @rt_vector_set(i64 %t4646, i64 %a0, i64 %t4660)
  %t4662 = or i64 %a0, 8
  %t4663 = and i64 %t4662, 7
  %t4664 = icmp eq i64 %t4663, 0
  br i1 %t4664, label %fixfast1045, label %fixslow1046
fixfast1045:
  %t4665 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4666 = extractvalue {i64, i1} %t4665, 0
  %t4667 = extractvalue {i64, i1} %t4665, 1
  br i1 %t4667, label %fixslow1046, label %fixmerge1047
fixslow1046:
  %t4668 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1047
fixmerge1047:
  %t4669 = phi i64 [ %t4666, %fixfast1045 ], [ %t4668, %fixslow1046 ]
  %t4670 = musttail call fastcc i64 @"scheme.base:code_843"(i64 %self, i64 1, i64 %t4669, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4670
}

define fastcc i64 @"scheme.base:code_845"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4671 = icmp eq i64 %argc, 1
  br i1 %t4671, label %argok1049, label %arityerr1048
arityerr1048:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1049:
  %t4672 = and i64 %self, -8
  %t4673 = inttoptr i64 %t4672 to ptr
  %t4674 = getelementptr i64, ptr %t4673, i64 1
  %t4675 = load i64, ptr %t4674
  %t4676 = or i64 %a0, %t4675
  %t4677 = and i64 %t4676, 7
  %t4678 = icmp eq i64 %t4677, 0
  br i1 %t4678, label %fixfast1050, label %fixslow1051
fixfast1050:
  %t4679 = icmp eq i64 %a0, %t4675
  %t4680 = select i1 %t4679, i64 257, i64 1
  br label %fixmerge1052
fixslow1051:
  %t4681 = call i64 @rt_num_eq(i64 %a0, i64 %t4675)
  br label %fixmerge1052
fixmerge1052:
  %t4682 = phi i64 [ %t4680, %fixfast1050 ], [ %t4681, %fixslow1051 ]
  %t4683 = icmp ne i64 %t4682, 1
  br i1 %t4683, label %then1053, label %else1054
then1053:
  %t4684 = and i64 %self, -8
  %t4685 = inttoptr i64 %t4684 to ptr
  %t4686 = getelementptr i64, ptr %t4685, i64 2
  %t4687 = load i64, ptr %t4686
  ret i64 %t4687
else1054:
  %t4688 = and i64 %self, -8
  %t4689 = inttoptr i64 %t4688 to ptr
  %t4690 = getelementptr i64, ptr %t4689, i64 2
  %t4691 = load i64, ptr %t4690
  %t4692 = and i64 %self, -8
  %t4693 = inttoptr i64 %t4692 to ptr
  %t4694 = getelementptr i64, ptr %t4693, i64 4
  %t4695 = load i64, ptr %t4694
  %t4696 = load i64, ptr @"scheme.base:vec-nth"
  call void @rt_check_callable(i64 %t4696)
  %t4697 = and i64 %t4696, -8
  %t4698 = inttoptr i64 %t4697 to ptr
  %t4699 = load i64, ptr %t4698
  %t4700 = inttoptr i64 %t4699 to ptr
  %t4701 = call fastcc i64%t4700(i64 %t4696, i64 2, i64 %t4695, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4702 = and i64 %self, -8
  %t4703 = inttoptr i64 %t4702 to ptr
  %t4704 = getelementptr i64, ptr %t4703, i64 3
  %t4705 = load i64, ptr %t4704
  call void @rt_check_callable(i64 %t4705)
  %t4706 = and i64 %t4705, -8
  %t4707 = inttoptr i64 %t4706 to ptr
  %t4708 = load i64, ptr %t4707
  %t4709 = inttoptr i64 %t4708 to ptr
  %t4710 = call i64 @rt_list_length(i64 %t4701)
  %t4711 = add i64 0, %t4710
  %t4712 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t4701, i64 8)
  %t4724 = getelementptr i64, ptr %t4712, i64 0
  %t4716 = load i64, ptr %t4724
  %t4725 = getelementptr i64, ptr %t4712, i64 1
  %t4717 = load i64, ptr %t4725
  %t4726 = getelementptr i64, ptr %t4712, i64 2
  %t4718 = load i64, ptr %t4726
  %t4727 = getelementptr i64, ptr %t4712, i64 3
  %t4719 = load i64, ptr %t4727
  %t4728 = getelementptr i64, ptr %t4712, i64 4
  %t4720 = load i64, ptr %t4728
  %t4729 = getelementptr i64, ptr %t4712, i64 5
  %t4721 = load i64, ptr %t4729
  %t4730 = getelementptr i64, ptr %t4712, i64 6
  %t4722 = load i64, ptr %t4730
  %t4731 = getelementptr i64, ptr %t4712, i64 7
  %t4723 = load i64, ptr %t4731
  %t4713 = icmp sgt i64 %t4711, 8
  %t4714 = getelementptr i64, ptr %t4712, i64 8
  %t4715 = select i1 %t4713, ptr %t4714, ptr null
  %t4732 = call fastcc i64%t4709(i64 %t4705, i64 %t4711, i64 %t4716, i64 %t4717, i64 %t4718, i64 %t4719, i64 %t4720, i64 %t4721, i64 %t4722, i64 %t4723, ptr %t4715)
  %t4733 = call i64 @rt_vector_set(i64 %t4691, i64 %a0, i64 %t4732)
  %t4734 = or i64 %a0, 8
  %t4735 = and i64 %t4734, 7
  %t4736 = icmp eq i64 %t4735, 0
  br i1 %t4736, label %fixfast1055, label %fixslow1056
fixfast1055:
  %t4737 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4738 = extractvalue {i64, i1} %t4737, 0
  %t4739 = extractvalue {i64, i1} %t4737, 1
  br i1 %t4739, label %fixslow1056, label %fixmerge1057
fixslow1056:
  %t4740 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1057
fixmerge1057:
  %t4741 = phi i64 [ %t4738, %fixfast1055 ], [ %t4740, %fixslow1056 ]
  %t4742 = musttail call fastcc i64 @"scheme.base:code_845"(i64 %self, i64 1, i64 %t4741, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4742
}

define fastcc i64 @"scheme.base:code:vector-map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4743 = icmp sge i64 %argc, 2
  br i1 %t4743, label %argok1059, label %arityerr1058
arityerr1058:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1059:
  %t4744 = call ptr @rt_alloc_words(i64 8)
  %t4745 = getelementptr i64, ptr %t4744, i64 0
  store i64 %a0, ptr %t4745
  %t4746 = getelementptr i64, ptr %t4744, i64 1
  store i64 %a1, ptr %t4746
  %t4747 = getelementptr i64, ptr %t4744, i64 2
  store i64 %a2, ptr %t4747
  %t4748 = getelementptr i64, ptr %t4744, i64 3
  store i64 %a3, ptr %t4748
  %t4749 = getelementptr i64, ptr %t4744, i64 4
  store i64 %a4, ptr %t4749
  %t4750 = getelementptr i64, ptr %t4744, i64 5
  store i64 %a5, ptr %t4750
  %t4751 = getelementptr i64, ptr %t4744, i64 6
  store i64 %a6, ptr %t4751
  %t4752 = getelementptr i64, ptr %t4744, i64 7
  store i64 %a7, ptr %t4752
  %t4753 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t4744, ptr %overflow)
  %t4754 = call i64 @rt_null_p(i64 %t4753)
  %t4755 = icmp ne i64 %t4754, 1
  br i1 %t4755, label %then1060, label %else1061
then1060:
  %t4756 = call i64 @rt_vector_length(i64 %a1)
  %t4757 = call i64 @rt_make_vector(i64 %t4756, i64 0)
  %t4758 = call ptr @rt_alloc_words(i64 6)
  %t4759 = ptrtoint ptr %t4758 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_843" to i64), ptr %t4758
  %t4760 = or i64 %t4759, 4
  %t4761 = getelementptr i64, ptr %t4758, i64 1
  store i64 %t4756, ptr %t4761
  %t4762 = getelementptr i64, ptr %t4758, i64 2
  store i64 %t4757, ptr %t4762
  %t4763 = getelementptr i64, ptr %t4758, i64 3
  store i64 %a0, ptr %t4763
  %t4764 = getelementptr i64, ptr %t4758, i64 4
  store i64 %a1, ptr %t4764
  %t4765 = getelementptr i64, ptr %t4758, i64 5
  store i64 %t4760, ptr %t4765
  %t4766 = musttail call fastcc i64 @"scheme.base:code_843"(i64 %t4760, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4766
else1061:
  %t4767 = call i64 @rt_cons(i64 %a1, i64 %t4753)
  %t4768 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t4768)
  %t4769 = and i64 %t4768, -8
  %t4770 = inttoptr i64 %t4769 to ptr
  %t4771 = load i64, ptr %t4770
  %t4772 = inttoptr i64 %t4771 to ptr
  %t4773 = call fastcc i64%t4772(i64 %t4768, i64 1, i64 %t4767, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4774 = call i64 @rt_make_vector(i64 %t4773, i64 0)
  %t4775 = call ptr @rt_alloc_words(i64 6)
  %t4776 = ptrtoint ptr %t4775 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_845" to i64), ptr %t4775
  %t4777 = or i64 %t4776, 4
  %t4778 = getelementptr i64, ptr %t4775, i64 1
  store i64 %t4773, ptr %t4778
  %t4779 = getelementptr i64, ptr %t4775, i64 2
  store i64 %t4774, ptr %t4779
  %t4780 = getelementptr i64, ptr %t4775, i64 3
  store i64 %a0, ptr %t4780
  %t4781 = getelementptr i64, ptr %t4775, i64 4
  store i64 %t4767, ptr %t4781
  %t4782 = getelementptr i64, ptr %t4775, i64 5
  store i64 %t4777, ptr %t4782
  %t4783 = musttail call fastcc i64 @"scheme.base:code_845"(i64 %t4777, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4783
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector-map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4784 = call i64 @rt_null_p(i64 2)
  %t4785 = icmp ne i64 %t4784, 1
  br i1 %t4785, label %then1062, label %else1063
then1062:
  %t4786 = call i64 @rt_vector_length(i64 %a1)
  %t4787 = call i64 @rt_make_vector(i64 %t4786, i64 0)
  %t4788 = call ptr @rt_alloc_words(i64 6)
  %t4789 = ptrtoint ptr %t4788 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_843" to i64), ptr %t4788
  %t4790 = or i64 %t4789, 4
  %t4791 = getelementptr i64, ptr %t4788, i64 1
  store i64 %t4786, ptr %t4791
  %t4792 = getelementptr i64, ptr %t4788, i64 2
  store i64 %t4787, ptr %t4792
  %t4793 = getelementptr i64, ptr %t4788, i64 3
  store i64 %a0, ptr %t4793
  %t4794 = getelementptr i64, ptr %t4788, i64 4
  store i64 %a1, ptr %t4794
  %t4795 = getelementptr i64, ptr %t4788, i64 5
  store i64 %t4790, ptr %t4795
  %t4796 = musttail call fastcc i64 @"scheme.base:code_843"(i64 %t4790, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4796
else1063:
  %t4797 = call i64 @rt_cons(i64 %a1, i64 2)
  %t4798 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t4798)
  %t4799 = and i64 %t4798, -8
  %t4800 = inttoptr i64 %t4799 to ptr
  %t4801 = load i64, ptr %t4800
  %t4802 = inttoptr i64 %t4801 to ptr
  %t4803 = call fastcc i64%t4802(i64 %t4798, i64 1, i64 %t4797, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4804 = call i64 @rt_make_vector(i64 %t4803, i64 0)
  %t4805 = call ptr @rt_alloc_words(i64 6)
  %t4806 = ptrtoint ptr %t4805 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_845" to i64), ptr %t4805
  %t4807 = or i64 %t4806, 4
  %t4808 = getelementptr i64, ptr %t4805, i64 1
  store i64 %t4803, ptr %t4808
  %t4809 = getelementptr i64, ptr %t4805, i64 2
  store i64 %t4804, ptr %t4809
  %t4810 = getelementptr i64, ptr %t4805, i64 3
  store i64 %a0, ptr %t4810
  %t4811 = getelementptr i64, ptr %t4805, i64 4
  store i64 %t4797, ptr %t4811
  %t4812 = getelementptr i64, ptr %t4805, i64 5
  store i64 %t4807, ptr %t4812
  %t4813 = musttail call fastcc i64 @"scheme.base:code_845"(i64 %t4807, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4813
}

define fastcc i64 @"scheme.base:code_866"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4818 = icmp eq i64 %argc, 1
  br i1 %t4818, label %argok1065, label %arityerr1064
arityerr1064:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1065:
  %t4819 = and i64 %self, -8
  %t4820 = inttoptr i64 %t4819 to ptr
  %t4821 = getelementptr i64, ptr %t4820, i64 1
  %t4822 = load i64, ptr %t4821
  %t4823 = or i64 %a0, %t4822
  %t4824 = and i64 %t4823, 7
  %t4825 = icmp eq i64 %t4824, 0
  br i1 %t4825, label %fixfast1066, label %fixslow1067
fixfast1066:
  %t4826 = icmp eq i64 %a0, %t4822
  %t4827 = select i1 %t4826, i64 257, i64 1
  br label %fixmerge1068
fixslow1067:
  %t4828 = call i64 @rt_num_eq(i64 %a0, i64 %t4822)
  br label %fixmerge1068
fixmerge1068:
  %t4829 = phi i64 [ %t4827, %fixfast1066 ], [ %t4828, %fixslow1067 ]
  %t4830 = icmp ne i64 %t4829, 1
  br i1 %t4830, label %then1069, label %else1070
then1069:
  %t4831 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4831)
  %t4832 = and i64 %t4831, -8
  %t4833 = inttoptr i64 %t4832 to ptr
  %t4834 = load i64, ptr %t4833
  %t4835 = inttoptr i64 %t4834 to ptr
  %t4836 = musttail call fastcc i64 %t4835(i64 %t4831, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4836
else1070:
  %t4837 = and i64 %self, -8
  %t4838 = inttoptr i64 %t4837 to ptr
  %t4839 = getelementptr i64, ptr %t4838, i64 3
  %t4840 = load i64, ptr %t4839
  %t4841 = call i64 @rt_vector_ref(i64 %t4840, i64 %a0)
  %t4842 = and i64 %self, -8
  %t4843 = inttoptr i64 %t4842 to ptr
  %t4844 = getelementptr i64, ptr %t4843, i64 2
  %t4845 = load i64, ptr %t4844
  call void @rt_check_callable(i64 %t4845)
  %t4846 = and i64 %t4845, -8
  %t4847 = inttoptr i64 %t4846 to ptr
  %t4848 = load i64, ptr %t4847
  %t4849 = inttoptr i64 %t4848 to ptr
  %t4850 = call fastcc i64%t4849(i64 %t4845, i64 1, i64 %t4841, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4851 = or i64 %a0, 8
  %t4852 = and i64 %t4851, 7
  %t4853 = icmp eq i64 %t4852, 0
  br i1 %t4853, label %fixfast1071, label %fixslow1072
fixfast1071:
  %t4854 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4855 = extractvalue {i64, i1} %t4854, 0
  %t4856 = extractvalue {i64, i1} %t4854, 1
  br i1 %t4856, label %fixslow1072, label %fixmerge1073
fixslow1072:
  %t4857 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1073
fixmerge1073:
  %t4858 = phi i64 [ %t4855, %fixfast1071 ], [ %t4857, %fixslow1072 ]
  %t4859 = musttail call fastcc i64 @"scheme.base:code_866"(i64 %self, i64 1, i64 %t4858, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4859
}

define fastcc i64 @"scheme.base:code_868"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4860 = icmp eq i64 %argc, 1
  br i1 %t4860, label %argok1075, label %arityerr1074
arityerr1074:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1075:
  %t4861 = and i64 %self, -8
  %t4862 = inttoptr i64 %t4861 to ptr
  %t4863 = getelementptr i64, ptr %t4862, i64 1
  %t4864 = load i64, ptr %t4863
  %t4865 = or i64 %a0, %t4864
  %t4866 = and i64 %t4865, 7
  %t4867 = icmp eq i64 %t4866, 0
  br i1 %t4867, label %fixfast1076, label %fixslow1077
fixfast1076:
  %t4868 = icmp eq i64 %a0, %t4864
  %t4869 = select i1 %t4868, i64 257, i64 1
  br label %fixmerge1078
fixslow1077:
  %t4870 = call i64 @rt_num_eq(i64 %a0, i64 %t4864)
  br label %fixmerge1078
fixmerge1078:
  %t4871 = phi i64 [ %t4869, %fixfast1076 ], [ %t4870, %fixslow1077 ]
  %t4872 = icmp ne i64 %t4871, 1
  br i1 %t4872, label %then1079, label %else1080
then1079:
  %t4873 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4873)
  %t4874 = and i64 %t4873, -8
  %t4875 = inttoptr i64 %t4874 to ptr
  %t4876 = load i64, ptr %t4875
  %t4877 = inttoptr i64 %t4876 to ptr
  %t4878 = musttail call fastcc i64 %t4877(i64 %t4873, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4878
else1080:
  %t4879 = and i64 %self, -8
  %t4880 = inttoptr i64 %t4879 to ptr
  %t4881 = getelementptr i64, ptr %t4880, i64 3
  %t4882 = load i64, ptr %t4881
  %t4883 = load i64, ptr @"scheme.base:vec-nth"
  call void @rt_check_callable(i64 %t4883)
  %t4884 = and i64 %t4883, -8
  %t4885 = inttoptr i64 %t4884 to ptr
  %t4886 = load i64, ptr %t4885
  %t4887 = inttoptr i64 %t4886 to ptr
  %t4888 = call fastcc i64%t4887(i64 %t4883, i64 2, i64 %t4882, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4889 = and i64 %self, -8
  %t4890 = inttoptr i64 %t4889 to ptr
  %t4891 = getelementptr i64, ptr %t4890, i64 2
  %t4892 = load i64, ptr %t4891
  call void @rt_check_callable(i64 %t4892)
  %t4893 = and i64 %t4892, -8
  %t4894 = inttoptr i64 %t4893 to ptr
  %t4895 = load i64, ptr %t4894
  %t4896 = inttoptr i64 %t4895 to ptr
  %t4897 = call i64 @rt_list_length(i64 %t4888)
  %t4898 = add i64 0, %t4897
  %t4899 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t4888, i64 8)
  %t4911 = getelementptr i64, ptr %t4899, i64 0
  %t4903 = load i64, ptr %t4911
  %t4912 = getelementptr i64, ptr %t4899, i64 1
  %t4904 = load i64, ptr %t4912
  %t4913 = getelementptr i64, ptr %t4899, i64 2
  %t4905 = load i64, ptr %t4913
  %t4914 = getelementptr i64, ptr %t4899, i64 3
  %t4906 = load i64, ptr %t4914
  %t4915 = getelementptr i64, ptr %t4899, i64 4
  %t4907 = load i64, ptr %t4915
  %t4916 = getelementptr i64, ptr %t4899, i64 5
  %t4908 = load i64, ptr %t4916
  %t4917 = getelementptr i64, ptr %t4899, i64 6
  %t4909 = load i64, ptr %t4917
  %t4918 = getelementptr i64, ptr %t4899, i64 7
  %t4910 = load i64, ptr %t4918
  %t4900 = icmp sgt i64 %t4898, 8
  %t4901 = getelementptr i64, ptr %t4899, i64 8
  %t4902 = select i1 %t4900, ptr %t4901, ptr null
  %t4919 = call fastcc i64%t4896(i64 %t4892, i64 %t4898, i64 %t4903, i64 %t4904, i64 %t4905, i64 %t4906, i64 %t4907, i64 %t4908, i64 %t4909, i64 %t4910, ptr %t4902)
  %t4920 = or i64 %a0, 8
  %t4921 = and i64 %t4920, 7
  %t4922 = icmp eq i64 %t4921, 0
  br i1 %t4922, label %fixfast1081, label %fixslow1082
fixfast1081:
  %t4923 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4924 = extractvalue {i64, i1} %t4923, 0
  %t4925 = extractvalue {i64, i1} %t4923, 1
  br i1 %t4925, label %fixslow1082, label %fixmerge1083
fixslow1082:
  %t4926 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1083
fixmerge1083:
  %t4927 = phi i64 [ %t4924, %fixfast1081 ], [ %t4926, %fixslow1082 ]
  %t4928 = musttail call fastcc i64 @"scheme.base:code_868"(i64 %self, i64 1, i64 %t4927, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4928
}

define fastcc i64 @"scheme.base:code:vector-for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4929 = icmp sge i64 %argc, 2
  br i1 %t4929, label %argok1085, label %arityerr1084
arityerr1084:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1085:
  %t4930 = call ptr @rt_alloc_words(i64 8)
  %t4931 = getelementptr i64, ptr %t4930, i64 0
  store i64 %a0, ptr %t4931
  %t4932 = getelementptr i64, ptr %t4930, i64 1
  store i64 %a1, ptr %t4932
  %t4933 = getelementptr i64, ptr %t4930, i64 2
  store i64 %a2, ptr %t4933
  %t4934 = getelementptr i64, ptr %t4930, i64 3
  store i64 %a3, ptr %t4934
  %t4935 = getelementptr i64, ptr %t4930, i64 4
  store i64 %a4, ptr %t4935
  %t4936 = getelementptr i64, ptr %t4930, i64 5
  store i64 %a5, ptr %t4936
  %t4937 = getelementptr i64, ptr %t4930, i64 6
  store i64 %a6, ptr %t4937
  %t4938 = getelementptr i64, ptr %t4930, i64 7
  store i64 %a7, ptr %t4938
  %t4939 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t4930, ptr %overflow)
  %t4940 = call i64 @rt_null_p(i64 %t4939)
  %t4941 = icmp ne i64 %t4940, 1
  br i1 %t4941, label %then1086, label %else1087
then1086:
  %t4942 = call i64 @rt_vector_length(i64 %a1)
  %t4943 = call ptr @rt_alloc_words(i64 5)
  %t4944 = ptrtoint ptr %t4943 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_866" to i64), ptr %t4943
  %t4945 = or i64 %t4944, 4
  %t4946 = getelementptr i64, ptr %t4943, i64 1
  store i64 %t4942, ptr %t4946
  %t4947 = getelementptr i64, ptr %t4943, i64 2
  store i64 %a0, ptr %t4947
  %t4948 = getelementptr i64, ptr %t4943, i64 3
  store i64 %a1, ptr %t4948
  %t4949 = getelementptr i64, ptr %t4943, i64 4
  store i64 %t4945, ptr %t4949
  %t4950 = musttail call fastcc i64 @"scheme.base:code_866"(i64 %t4945, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4950
else1087:
  %t4951 = call i64 @rt_cons(i64 %a1, i64 %t4939)
  %t4952 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t4952)
  %t4953 = and i64 %t4952, -8
  %t4954 = inttoptr i64 %t4953 to ptr
  %t4955 = load i64, ptr %t4954
  %t4956 = inttoptr i64 %t4955 to ptr
  %t4957 = call fastcc i64%t4956(i64 %t4952, i64 1, i64 %t4951, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4958 = call ptr @rt_alloc_words(i64 5)
  %t4959 = ptrtoint ptr %t4958 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_868" to i64), ptr %t4958
  %t4960 = or i64 %t4959, 4
  %t4961 = getelementptr i64, ptr %t4958, i64 1
  store i64 %t4957, ptr %t4961
  %t4962 = getelementptr i64, ptr %t4958, i64 2
  store i64 %a0, ptr %t4962
  %t4963 = getelementptr i64, ptr %t4958, i64 3
  store i64 %t4951, ptr %t4963
  %t4964 = getelementptr i64, ptr %t4958, i64 4
  store i64 %t4960, ptr %t4964
  %t4965 = musttail call fastcc i64 @"scheme.base:code_868"(i64 %t4960, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4965
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector-for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4966 = call i64 @rt_null_p(i64 2)
  %t4967 = icmp ne i64 %t4966, 1
  br i1 %t4967, label %then1088, label %else1089
then1088:
  %t4968 = call i64 @rt_vector_length(i64 %a1)
  %t4969 = call ptr @rt_alloc_words(i64 5)
  %t4970 = ptrtoint ptr %t4969 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_866" to i64), ptr %t4969
  %t4971 = or i64 %t4970, 4
  %t4972 = getelementptr i64, ptr %t4969, i64 1
  store i64 %t4968, ptr %t4972
  %t4973 = getelementptr i64, ptr %t4969, i64 2
  store i64 %a0, ptr %t4973
  %t4974 = getelementptr i64, ptr %t4969, i64 3
  store i64 %a1, ptr %t4974
  %t4975 = getelementptr i64, ptr %t4969, i64 4
  store i64 %t4971, ptr %t4975
  %t4976 = musttail call fastcc i64 @"scheme.base:code_866"(i64 %t4971, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4976
else1089:
  %t4977 = call i64 @rt_cons(i64 %a1, i64 2)
  %t4978 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t4978)
  %t4979 = and i64 %t4978, -8
  %t4980 = inttoptr i64 %t4979 to ptr
  %t4981 = load i64, ptr %t4980
  %t4982 = inttoptr i64 %t4981 to ptr
  %t4983 = call fastcc i64%t4982(i64 %t4978, i64 1, i64 %t4977, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4984 = call ptr @rt_alloc_words(i64 5)
  %t4985 = ptrtoint ptr %t4984 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_868" to i64), ptr %t4984
  %t4986 = or i64 %t4985, 4
  %t4987 = getelementptr i64, ptr %t4984, i64 1
  store i64 %t4983, ptr %t4987
  %t4988 = getelementptr i64, ptr %t4984, i64 2
  store i64 %a0, ptr %t4988
  %t4989 = getelementptr i64, ptr %t4984, i64 3
  store i64 %t4977, ptr %t4989
  %t4990 = getelementptr i64, ptr %t4984, i64 4
  store i64 %t4986, ptr %t4990
  %t4991 = musttail call fastcc i64 @"scheme.base:code_868"(i64 %t4986, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4991
}

define fastcc i64 @"scheme.base:code:vec-min-len"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4996 = icmp eq i64 %argc, 1
  br i1 %t4996, label %argok1091, label %arityerr1090
arityerr1090:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1091:
  %t4997 = call i64 @rt_cdr(i64 %a0)
  %t4998 = call i64 @rt_null_p(i64 %t4997)
  %t4999 = icmp ne i64 %t4998, 1
  br i1 %t4999, label %then1092, label %else1093
then1092:
  %t5000 = call i64 @rt_car(i64 %a0)
  %t5001 = call i64 @rt_vector_length(i64 %t5000)
  ret i64 %t5001
else1093:
  %t5002 = call i64 @rt_car(i64 %a0)
  %t5003 = call i64 @rt_vector_length(i64 %t5002)
  %t5004 = call i64 @rt_cdr(i64 %a0)
  %t5005 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t5005)
  %t5006 = and i64 %t5005, -8
  %t5007 = inttoptr i64 %t5006 to ptr
  %t5008 = load i64, ptr %t5007
  %t5009 = inttoptr i64 %t5008 to ptr
  %t5010 = call fastcc i64%t5009(i64 %t5005, i64 1, i64 %t5004, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5011 = or i64 %t5003, %t5010
  %t5012 = and i64 %t5011, 7
  %t5013 = icmp eq i64 %t5012, 0
  br i1 %t5013, label %fixfast1094, label %fixslow1095
fixfast1094:
  %t5014 = icmp slt i64 %t5003, %t5010
  %t5015 = select i1 %t5014, i64 257, i64 1
  br label %fixmerge1096
fixslow1095:
  %t5016 = call i64 @rt_lt(i64 %t5003, i64 %t5010)
  br label %fixmerge1096
fixmerge1096:
  %t5017 = phi i64 [ %t5015, %fixfast1094 ], [ %t5016, %fixslow1095 ]
  %t5018 = icmp ne i64 %t5017, 1
  br i1 %t5018, label %then1097, label %else1098
then1097:
  ret i64 %t5003
else1098:
  ret i64 %t5010
}

define fastcc i64 @"scheme.base:code:vec-nth"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5023 = icmp eq i64 %argc, 2
  br i1 %t5023, label %argok1100, label %arityerr1099
arityerr1099:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1100:
  %t5024 = call i64 @rt_null_p(i64 %a0)
  %t5025 = icmp ne i64 %t5024, 1
  br i1 %t5025, label %then1101, label %else1102
then1101:
  ret i64 2
else1102:
  %t5026 = call i64 @rt_car(i64 %a0)
  %t5027 = call i64 @rt_vector_ref(i64 %t5026, i64 %a1)
  %t5028 = call i64 @rt_cdr(i64 %a0)
  %t5029 = load i64, ptr @"scheme.base:vec-nth"
  call void @rt_check_callable(i64 %t5029)
  %t5030 = and i64 %t5029, -8
  %t5031 = inttoptr i64 %t5030 to ptr
  %t5032 = load i64, ptr %t5031
  %t5033 = inttoptr i64 %t5032 to ptr
  %t5034 = call fastcc i64%t5033(i64 %t5029, i64 2, i64 %t5028, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5035 = call i64 @rt_cons(i64 %t5027, i64 %t5034)
  ret i64 %t5035
}

define fastcc i64 @"scheme.base:code_894"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5040 = icmp eq i64 %argc, 1
  br i1 %t5040, label %argok1104, label %arityerr1103
arityerr1103:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1104:
  %t5041 = and i64 %self, -8
  %t5042 = inttoptr i64 %t5041 to ptr
  %t5043 = getelementptr i64, ptr %t5042, i64 1
  %t5044 = load i64, ptr %t5043
  %t5045 = or i64 %a0, %t5044
  %t5046 = and i64 %t5045, 7
  %t5047 = icmp eq i64 %t5046, 0
  br i1 %t5047, label %fixfast1105, label %fixslow1106
fixfast1105:
  %t5048 = icmp eq i64 %a0, %t5044
  %t5049 = select i1 %t5048, i64 257, i64 1
  br label %fixmerge1107
fixslow1106:
  %t5050 = call i64 @rt_num_eq(i64 %a0, i64 %t5044)
  br label %fixmerge1107
fixmerge1107:
  %t5051 = phi i64 [ %t5049, %fixfast1105 ], [ %t5050, %fixslow1106 ]
  %t5052 = icmp ne i64 %t5051, 1
  br i1 %t5052, label %then1108, label %else1109
then1108:
  %t5053 = and i64 %self, -8
  %t5054 = inttoptr i64 %t5053 to ptr
  %t5055 = getelementptr i64, ptr %t5054, i64 2
  %t5056 = load i64, ptr %t5055
  ret i64 %t5056
else1109:
  %t5057 = and i64 %self, -8
  %t5058 = inttoptr i64 %t5057 to ptr
  %t5059 = getelementptr i64, ptr %t5058, i64 2
  %t5060 = load i64, ptr %t5059
  %t5061 = and i64 %self, -8
  %t5062 = inttoptr i64 %t5061 to ptr
  %t5063 = getelementptr i64, ptr %t5062, i64 3
  %t5064 = load i64, ptr %t5063
  %t5065 = or i64 %a0, %t5064
  %t5066 = and i64 %t5065, 7
  %t5067 = icmp eq i64 %t5066, 0
  br i1 %t5067, label %fixfast1110, label %fixslow1111
fixfast1110:
  %t5068 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t5064)
  %t5069 = extractvalue {i64, i1} %t5068, 0
  %t5070 = extractvalue {i64, i1} %t5068, 1
  br i1 %t5070, label %fixslow1111, label %fixmerge1112
fixslow1111:
  %t5071 = call i64 @rt_sub(i64 %a0, i64 %t5064)
  br label %fixmerge1112
fixmerge1112:
  %t5072 = phi i64 [ %t5069, %fixfast1110 ], [ %t5071, %fixslow1111 ]
  %t5073 = and i64 %self, -8
  %t5074 = inttoptr i64 %t5073 to ptr
  %t5075 = getelementptr i64, ptr %t5074, i64 4
  %t5076 = load i64, ptr %t5075
  %t5077 = call i64 @rt_string_ref(i64 %t5076, i64 %a0)
  %t5078 = call i64 @rt_vector_set(i64 %t5060, i64 %t5072, i64 %t5077)
  %t5079 = or i64 %a0, 8
  %t5080 = and i64 %t5079, 7
  %t5081 = icmp eq i64 %t5080, 0
  br i1 %t5081, label %fixfast1113, label %fixslow1114
fixfast1113:
  %t5082 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5083 = extractvalue {i64, i1} %t5082, 0
  %t5084 = extractvalue {i64, i1} %t5082, 1
  br i1 %t5084, label %fixslow1114, label %fixmerge1115
fixslow1114:
  %t5085 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1115
fixmerge1115:
  %t5086 = phi i64 [ %t5083, %fixfast1113 ], [ %t5085, %fixslow1114 ]
  %t5087 = musttail call fastcc i64 @"scheme.base:code_894"(i64 %self, i64 1, i64 %t5086, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5087
}

define fastcc i64 @"scheme.base:code:string->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5088 = icmp sge i64 %argc, 1
  br i1 %t5088, label %argok1117, label %arityerr1116
arityerr1116:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1117:
  %t5089 = call ptr @rt_alloc_words(i64 8)
  %t5090 = getelementptr i64, ptr %t5089, i64 0
  store i64 %a0, ptr %t5090
  %t5091 = getelementptr i64, ptr %t5089, i64 1
  store i64 %a1, ptr %t5091
  %t5092 = getelementptr i64, ptr %t5089, i64 2
  store i64 %a2, ptr %t5092
  %t5093 = getelementptr i64, ptr %t5089, i64 3
  store i64 %a3, ptr %t5093
  %t5094 = getelementptr i64, ptr %t5089, i64 4
  store i64 %a4, ptr %t5094
  %t5095 = getelementptr i64, ptr %t5089, i64 5
  store i64 %a5, ptr %t5095
  %t5096 = getelementptr i64, ptr %t5089, i64 6
  store i64 %a6, ptr %t5096
  %t5097 = getelementptr i64, ptr %t5089, i64 7
  store i64 %a7, ptr %t5097
  %t5098 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t5089, ptr %overflow)
  %t5099 = call i64 @rt_string_length(i64 %a0)
  %t5100 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5100)
  %t5101 = and i64 %t5100, -8
  %t5102 = inttoptr i64 %t5101 to ptr
  %t5103 = load i64, ptr %t5102
  %t5104 = inttoptr i64 %t5103 to ptr
  %t5105 = call fastcc i64%t5104(i64 %t5100, i64 1, i64 %t5098, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5106 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5106)
  %t5107 = and i64 %t5106, -8
  %t5108 = inttoptr i64 %t5107 to ptr
  %t5109 = load i64, ptr %t5108
  %t5110 = inttoptr i64 %t5109 to ptr
  %t5111 = call fastcc i64%t5110(i64 %t5106, i64 2, i64 %t5098, i64 %t5099, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5112 = call i64 @rt_intern(ptr @.str.sym.25)
  %t5113 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5113)
  %t5114 = and i64 %t5113, -8
  %t5115 = inttoptr i64 %t5114 to ptr
  %t5116 = load i64, ptr %t5115
  %t5117 = inttoptr i64 %t5116 to ptr
  %t5118 = call fastcc i64%t5117(i64 %t5113, i64 4, i64 %t5112, i64 %t5105, i64 %t5111, i64 %t5099, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5119 = or i64 %t5111, %t5105
  %t5120 = and i64 %t5119, 7
  %t5121 = icmp eq i64 %t5120, 0
  br i1 %t5121, label %fixfast1118, label %fixslow1119
fixfast1118:
  %t5122 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5111, i64 %t5105)
  %t5123 = extractvalue {i64, i1} %t5122, 0
  %t5124 = extractvalue {i64, i1} %t5122, 1
  br i1 %t5124, label %fixslow1119, label %fixmerge1120
fixslow1119:
  %t5125 = call i64 @rt_sub(i64 %t5111, i64 %t5105)
  br label %fixmerge1120
fixmerge1120:
  %t5126 = phi i64 [ %t5123, %fixfast1118 ], [ %t5125, %fixslow1119 ]
  %t5127 = call i64 @rt_make_vector(i64 %t5126, i64 0)
  %t5128 = call ptr @rt_alloc_words(i64 6)
  %t5129 = ptrtoint ptr %t5128 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_894" to i64), ptr %t5128
  %t5130 = or i64 %t5129, 4
  %t5131 = getelementptr i64, ptr %t5128, i64 1
  store i64 %t5111, ptr %t5131
  %t5132 = getelementptr i64, ptr %t5128, i64 2
  store i64 %t5127, ptr %t5132
  %t5133 = getelementptr i64, ptr %t5128, i64 3
  store i64 %t5105, ptr %t5133
  %t5134 = getelementptr i64, ptr %t5128, i64 4
  store i64 %a0, ptr %t5134
  %t5135 = getelementptr i64, ptr %t5128, i64 5
  store i64 %t5130, ptr %t5135
  %t5136 = musttail call fastcc i64 @"scheme.base:code_894"(i64 %t5130, i64 1, i64 %t5105, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5136
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5137 = call i64 @rt_string_length(i64 %a0)
  %t5138 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5138)
  %t5139 = and i64 %t5138, -8
  %t5140 = inttoptr i64 %t5139 to ptr
  %t5141 = load i64, ptr %t5140
  %t5142 = inttoptr i64 %t5141 to ptr
  %t5143 = call fastcc i64%t5142(i64 %t5138, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5144 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5144)
  %t5145 = and i64 %t5144, -8
  %t5146 = inttoptr i64 %t5145 to ptr
  %t5147 = load i64, ptr %t5146
  %t5148 = inttoptr i64 %t5147 to ptr
  %t5149 = call fastcc i64%t5148(i64 %t5144, i64 2, i64 2, i64 %t5137, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5150 = call i64 @rt_intern(ptr @.str.sym.25)
  %t5151 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5151)
  %t5152 = and i64 %t5151, -8
  %t5153 = inttoptr i64 %t5152 to ptr
  %t5154 = load i64, ptr %t5153
  %t5155 = inttoptr i64 %t5154 to ptr
  %t5156 = call fastcc i64%t5155(i64 %t5151, i64 4, i64 %t5150, i64 %t5143, i64 %t5149, i64 %t5137, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5157 = or i64 %t5149, %t5143
  %t5158 = and i64 %t5157, 7
  %t5159 = icmp eq i64 %t5158, 0
  br i1 %t5159, label %fixfast1121, label %fixslow1122
fixfast1121:
  %t5160 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5149, i64 %t5143)
  %t5161 = extractvalue {i64, i1} %t5160, 0
  %t5162 = extractvalue {i64, i1} %t5160, 1
  br i1 %t5162, label %fixslow1122, label %fixmerge1123
fixslow1122:
  %t5163 = call i64 @rt_sub(i64 %t5149, i64 %t5143)
  br label %fixmerge1123
fixmerge1123:
  %t5164 = phi i64 [ %t5161, %fixfast1121 ], [ %t5163, %fixslow1122 ]
  %t5165 = call i64 @rt_make_vector(i64 %t5164, i64 0)
  %t5166 = call ptr @rt_alloc_words(i64 6)
  %t5167 = ptrtoint ptr %t5166 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_894" to i64), ptr %t5166
  %t5168 = or i64 %t5167, 4
  %t5169 = getelementptr i64, ptr %t5166, i64 1
  store i64 %t5149, ptr %t5169
  %t5170 = getelementptr i64, ptr %t5166, i64 2
  store i64 %t5165, ptr %t5170
  %t5171 = getelementptr i64, ptr %t5166, i64 3
  store i64 %t5143, ptr %t5171
  %t5172 = getelementptr i64, ptr %t5166, i64 4
  store i64 %a0, ptr %t5172
  %t5173 = getelementptr i64, ptr %t5166, i64 5
  store i64 %t5168, ptr %t5173
  %t5174 = musttail call fastcc i64 @"scheme.base:code_894"(i64 %t5168, i64 1, i64 %t5143, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5174
}

define fastcc i64 @"scheme.base:code:vector->string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5179 = icmp sge i64 %argc, 1
  br i1 %t5179, label %argok1125, label %arityerr1124
arityerr1124:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1125:
  %t5180 = call ptr @rt_alloc_words(i64 8)
  %t5181 = getelementptr i64, ptr %t5180, i64 0
  store i64 %a0, ptr %t5181
  %t5182 = getelementptr i64, ptr %t5180, i64 1
  store i64 %a1, ptr %t5182
  %t5183 = getelementptr i64, ptr %t5180, i64 2
  store i64 %a2, ptr %t5183
  %t5184 = getelementptr i64, ptr %t5180, i64 3
  store i64 %a3, ptr %t5184
  %t5185 = getelementptr i64, ptr %t5180, i64 4
  store i64 %a4, ptr %t5185
  %t5186 = getelementptr i64, ptr %t5180, i64 5
  store i64 %a5, ptr %t5186
  %t5187 = getelementptr i64, ptr %t5180, i64 6
  store i64 %a6, ptr %t5187
  %t5188 = getelementptr i64, ptr %t5180, i64 7
  store i64 %a7, ptr %t5188
  %t5189 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t5180, ptr %overflow)
  %t5190 = call i64 @rt_vector_length(i64 %a0)
  %t5191 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5191)
  %t5192 = and i64 %t5191, -8
  %t5193 = inttoptr i64 %t5192 to ptr
  %t5194 = load i64, ptr %t5193
  %t5195 = inttoptr i64 %t5194 to ptr
  %t5196 = call fastcc i64%t5195(i64 %t5191, i64 1, i64 %t5189, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5197 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5197)
  %t5198 = and i64 %t5197, -8
  %t5199 = inttoptr i64 %t5198 to ptr
  %t5200 = load i64, ptr %t5199
  %t5201 = inttoptr i64 %t5200 to ptr
  %t5202 = call fastcc i64%t5201(i64 %t5197, i64 2, i64 %t5189, i64 %t5190, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5203 = call i64 @rt_intern(ptr @.str.sym.26)
  %t5204 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5204)
  %t5205 = and i64 %t5204, -8
  %t5206 = inttoptr i64 %t5205 to ptr
  %t5207 = load i64, ptr %t5206
  %t5208 = inttoptr i64 %t5207 to ptr
  %t5209 = call fastcc i64%t5208(i64 %t5204, i64 4, i64 %t5203, i64 %t5196, i64 %t5202, i64 %t5190, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5210 = load i64, ptr @"scheme.base:vector->list"
  call void @rt_check_callable(i64 %t5210)
  %t5211 = and i64 %t5210, -8
  %t5212 = inttoptr i64 %t5211 to ptr
  %t5213 = load i64, ptr %t5212
  %t5214 = inttoptr i64 %t5213 to ptr
  %t5215 = call fastcc i64%t5214(i64 %t5210, i64 3, i64 %a0, i64 %t5196, i64 %t5202, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5216 = call i64 @rt_list_to_string(i64 %t5215)
  ret i64 %t5216
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector->string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5217 = call i64 @rt_vector_length(i64 %a0)
  %t5218 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5218)
  %t5219 = and i64 %t5218, -8
  %t5220 = inttoptr i64 %t5219 to ptr
  %t5221 = load i64, ptr %t5220
  %t5222 = inttoptr i64 %t5221 to ptr
  %t5223 = call fastcc i64%t5222(i64 %t5218, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5224 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5224)
  %t5225 = and i64 %t5224, -8
  %t5226 = inttoptr i64 %t5225 to ptr
  %t5227 = load i64, ptr %t5226
  %t5228 = inttoptr i64 %t5227 to ptr
  %t5229 = call fastcc i64%t5228(i64 %t5224, i64 2, i64 2, i64 %t5217, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5230 = call i64 @rt_intern(ptr @.str.sym.26)
  %t5231 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5231)
  %t5232 = and i64 %t5231, -8
  %t5233 = inttoptr i64 %t5232 to ptr
  %t5234 = load i64, ptr %t5233
  %t5235 = inttoptr i64 %t5234 to ptr
  %t5236 = call fastcc i64%t5235(i64 %t5231, i64 4, i64 %t5230, i64 %t5223, i64 %t5229, i64 %t5217, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5237 = load i64, ptr @"scheme.base:vector->list"
  call void @rt_check_callable(i64 %t5237)
  %t5238 = and i64 %t5237, -8
  %t5239 = inttoptr i64 %t5238 to ptr
  %t5240 = load i64, ptr %t5239
  %t5241 = inttoptr i64 %t5240 to ptr
  %t5242 = call fastcc i64%t5241(i64 %t5237, i64 3, i64 %a0, i64 %t5223, i64 %t5229, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5243 = call i64 @rt_list_to_string(i64 %t5242)
  ret i64 %t5243
}

define fastcc i64 @"scheme.base:code:string-map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5248 = icmp sge i64 %argc, 2
  br i1 %t5248, label %argok1127, label %arityerr1126
arityerr1126:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1127:
  %t5249 = call ptr @rt_alloc_words(i64 8)
  %t5250 = getelementptr i64, ptr %t5249, i64 0
  store i64 %a0, ptr %t5250
  %t5251 = getelementptr i64, ptr %t5249, i64 1
  store i64 %a1, ptr %t5251
  %t5252 = getelementptr i64, ptr %t5249, i64 2
  store i64 %a2, ptr %t5252
  %t5253 = getelementptr i64, ptr %t5249, i64 3
  store i64 %a3, ptr %t5253
  %t5254 = getelementptr i64, ptr %t5249, i64 4
  store i64 %a4, ptr %t5254
  %t5255 = getelementptr i64, ptr %t5249, i64 5
  store i64 %a5, ptr %t5255
  %t5256 = getelementptr i64, ptr %t5249, i64 6
  store i64 %a6, ptr %t5256
  %t5257 = getelementptr i64, ptr %t5249, i64 7
  store i64 %a7, ptr %t5257
  %t5258 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t5249, ptr %overflow)
  %t5259 = call i64 @rt_null_p(i64 %t5258)
  %t5260 = icmp ne i64 %t5259, 1
  br i1 %t5260, label %then1128, label %else1129
then1128:
  %t5261 = load i64, ptr @"scheme.base:string->list"
  call void @rt_check_callable(i64 %t5261)
  %t5262 = and i64 %t5261, -8
  %t5263 = inttoptr i64 %t5262 to ptr
  %t5264 = load i64, ptr %t5263
  %t5265 = inttoptr i64 %t5264 to ptr
  %t5266 = call fastcc i64%t5265(i64 %t5261, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5267 = load i64, ptr @"scheme.base:str-map1"
  call void @rt_check_callable(i64 %t5267)
  %t5268 = and i64 %t5267, -8
  %t5269 = inttoptr i64 %t5268 to ptr
  %t5270 = load i64, ptr %t5269
  %t5271 = inttoptr i64 %t5270 to ptr
  %t5272 = call fastcc i64%t5271(i64 %t5267, i64 2, i64 %a0, i64 %t5266, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5273 = call i64 @rt_list_to_string(i64 %t5272)
  ret i64 %t5273
else1129:
  %t5274 = call i64 @rt_cons(i64 %a1, i64 %t5258)
  %t5275 = load i64, ptr @"scheme.base:str-mapn"
  call void @rt_check_callable(i64 %t5275)
  %t5276 = and i64 %t5275, -8
  %t5277 = inttoptr i64 %t5276 to ptr
  %t5278 = load i64, ptr %t5277
  %t5279 = inttoptr i64 %t5278 to ptr
  %t5280 = call fastcc i64%t5279(i64 %t5275, i64 2, i64 %a0, i64 %t5274, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5281 = call i64 @rt_list_to_string(i64 %t5280)
  ret i64 %t5281
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring-map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5282 = call i64 @rt_null_p(i64 2)
  %t5283 = icmp ne i64 %t5282, 1
  br i1 %t5283, label %then1130, label %else1131
then1130:
  %t5284 = load i64, ptr @"scheme.base:string->list"
  call void @rt_check_callable(i64 %t5284)
  %t5285 = and i64 %t5284, -8
  %t5286 = inttoptr i64 %t5285 to ptr
  %t5287 = load i64, ptr %t5286
  %t5288 = inttoptr i64 %t5287 to ptr
  %t5289 = call fastcc i64%t5288(i64 %t5284, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5290 = load i64, ptr @"scheme.base:str-map1"
  call void @rt_check_callable(i64 %t5290)
  %t5291 = and i64 %t5290, -8
  %t5292 = inttoptr i64 %t5291 to ptr
  %t5293 = load i64, ptr %t5292
  %t5294 = inttoptr i64 %t5293 to ptr
  %t5295 = call fastcc i64%t5294(i64 %t5290, i64 2, i64 %a0, i64 %t5289, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5296 = call i64 @rt_list_to_string(i64 %t5295)
  ret i64 %t5296
else1131:
  %t5297 = call i64 @rt_cons(i64 %a1, i64 2)
  %t5298 = load i64, ptr @"scheme.base:str-mapn"
  call void @rt_check_callable(i64 %t5298)
  %t5299 = and i64 %t5298, -8
  %t5300 = inttoptr i64 %t5299 to ptr
  %t5301 = load i64, ptr %t5300
  %t5302 = inttoptr i64 %t5301 to ptr
  %t5303 = call fastcc i64%t5302(i64 %t5298, i64 2, i64 %a0, i64 %t5297, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5304 = call i64 @rt_list_to_string(i64 %t5303)
  ret i64 %t5304
}

define fastcc i64 @"scheme.base:code:str-map1"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5309 = icmp eq i64 %argc, 2
  br i1 %t5309, label %argok1133, label %arityerr1132
arityerr1132:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1133:
  %t5310 = call i64 @rt_null_p(i64 %a1)
  %t5311 = icmp ne i64 %t5310, 1
  br i1 %t5311, label %then1134, label %else1135
then1134:
  ret i64 2
else1135:
  %t5312 = call i64 @rt_car(i64 %a1)
  call void @rt_check_callable(i64 %a0)
  %t5313 = and i64 %a0, -8
  %t5314 = inttoptr i64 %t5313 to ptr
  %t5315 = load i64, ptr %t5314
  %t5316 = inttoptr i64 %t5315 to ptr
  %t5317 = call fastcc i64%t5316(i64 %a0, i64 1, i64 %t5312, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5318 = call i64 @rt_cdr(i64 %a1)
  %t5319 = load i64, ptr @"scheme.base:str-map1"
  call void @rt_check_callable(i64 %t5319)
  %t5320 = and i64 %t5319, -8
  %t5321 = inttoptr i64 %t5320 to ptr
  %t5322 = load i64, ptr %t5321
  %t5323 = inttoptr i64 %t5322 to ptr
  %t5324 = call fastcc i64%t5323(i64 %t5319, i64 2, i64 %a0, i64 %t5318, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5325 = call i64 @rt_cons(i64 %t5317, i64 %t5324)
  ret i64 %t5325
}

define fastcc i64 @"scheme.base:code_919"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5330 = icmp eq i64 %argc, 1
  br i1 %t5330, label %argok1137, label %arityerr1136
arityerr1136:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1137:
  %t5331 = and i64 %self, -8
  %t5332 = inttoptr i64 %t5331 to ptr
  %t5333 = getelementptr i64, ptr %t5332, i64 1
  %t5334 = load i64, ptr %t5333
  %t5335 = or i64 %a0, %t5334
  %t5336 = and i64 %t5335, 7
  %t5337 = icmp eq i64 %t5336, 0
  br i1 %t5337, label %fixfast1138, label %fixslow1139
fixfast1138:
  %t5338 = icmp eq i64 %a0, %t5334
  %t5339 = select i1 %t5338, i64 257, i64 1
  br label %fixmerge1140
fixslow1139:
  %t5340 = call i64 @rt_num_eq(i64 %a0, i64 %t5334)
  br label %fixmerge1140
fixmerge1140:
  %t5341 = phi i64 [ %t5339, %fixfast1138 ], [ %t5340, %fixslow1139 ]
  %t5342 = icmp ne i64 %t5341, 1
  br i1 %t5342, label %then1141, label %else1142
then1141:
  ret i64 2
else1142:
  %t5343 = and i64 %self, -8
  %t5344 = inttoptr i64 %t5343 to ptr
  %t5345 = getelementptr i64, ptr %t5344, i64 3
  %t5346 = load i64, ptr %t5345
  %t5347 = load i64, ptr @"scheme.base:str-nth"
  call void @rt_check_callable(i64 %t5347)
  %t5348 = and i64 %t5347, -8
  %t5349 = inttoptr i64 %t5348 to ptr
  %t5350 = load i64, ptr %t5349
  %t5351 = inttoptr i64 %t5350 to ptr
  %t5352 = call fastcc i64%t5351(i64 %t5347, i64 2, i64 %t5346, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5353 = and i64 %self, -8
  %t5354 = inttoptr i64 %t5353 to ptr
  %t5355 = getelementptr i64, ptr %t5354, i64 2
  %t5356 = load i64, ptr %t5355
  call void @rt_check_callable(i64 %t5356)
  %t5357 = and i64 %t5356, -8
  %t5358 = inttoptr i64 %t5357 to ptr
  %t5359 = load i64, ptr %t5358
  %t5360 = inttoptr i64 %t5359 to ptr
  %t5361 = call i64 @rt_list_length(i64 %t5352)
  %t5362 = add i64 0, %t5361
  %t5363 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t5352, i64 8)
  %t5375 = getelementptr i64, ptr %t5363, i64 0
  %t5367 = load i64, ptr %t5375
  %t5376 = getelementptr i64, ptr %t5363, i64 1
  %t5368 = load i64, ptr %t5376
  %t5377 = getelementptr i64, ptr %t5363, i64 2
  %t5369 = load i64, ptr %t5377
  %t5378 = getelementptr i64, ptr %t5363, i64 3
  %t5370 = load i64, ptr %t5378
  %t5379 = getelementptr i64, ptr %t5363, i64 4
  %t5371 = load i64, ptr %t5379
  %t5380 = getelementptr i64, ptr %t5363, i64 5
  %t5372 = load i64, ptr %t5380
  %t5381 = getelementptr i64, ptr %t5363, i64 6
  %t5373 = load i64, ptr %t5381
  %t5382 = getelementptr i64, ptr %t5363, i64 7
  %t5374 = load i64, ptr %t5382
  %t5364 = icmp sgt i64 %t5362, 8
  %t5365 = getelementptr i64, ptr %t5363, i64 8
  %t5366 = select i1 %t5364, ptr %t5365, ptr null
  %t5383 = call fastcc i64%t5360(i64 %t5356, i64 %t5362, i64 %t5367, i64 %t5368, i64 %t5369, i64 %t5370, i64 %t5371, i64 %t5372, i64 %t5373, i64 %t5374, ptr %t5366)
  %t5384 = or i64 %a0, 8
  %t5385 = and i64 %t5384, 7
  %t5386 = icmp eq i64 %t5385, 0
  br i1 %t5386, label %fixfast1143, label %fixslow1144
fixfast1143:
  %t5387 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5388 = extractvalue {i64, i1} %t5387, 0
  %t5389 = extractvalue {i64, i1} %t5387, 1
  br i1 %t5389, label %fixslow1144, label %fixmerge1145
fixslow1144:
  %t5390 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1145
fixmerge1145:
  %t5391 = phi i64 [ %t5388, %fixfast1143 ], [ %t5390, %fixslow1144 ]
  %t5392 = call fastcc i64 @"scheme.base:code_919"(i64 %self, i64 1, i64 %t5391, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5393 = call i64 @rt_cons(i64 %t5383, i64 %t5392)
  ret i64 %t5393
}

define fastcc i64 @"scheme.base:code:str-mapn"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5394 = icmp eq i64 %argc, 2
  br i1 %t5394, label %argok1147, label %arityerr1146
arityerr1146:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1147:
  %t5395 = load i64, ptr @"scheme.base:str-min-len"
  call void @rt_check_callable(i64 %t5395)
  %t5396 = and i64 %t5395, -8
  %t5397 = inttoptr i64 %t5396 to ptr
  %t5398 = load i64, ptr %t5397
  %t5399 = inttoptr i64 %t5398 to ptr
  %t5400 = call fastcc i64%t5399(i64 %t5395, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5401 = call ptr @rt_alloc_words(i64 5)
  %t5402 = ptrtoint ptr %t5401 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_919" to i64), ptr %t5401
  %t5403 = or i64 %t5402, 4
  %t5404 = getelementptr i64, ptr %t5401, i64 1
  store i64 %t5400, ptr %t5404
  %t5405 = getelementptr i64, ptr %t5401, i64 2
  store i64 %a0, ptr %t5405
  %t5406 = getelementptr i64, ptr %t5401, i64 3
  store i64 %a1, ptr %t5406
  %t5407 = getelementptr i64, ptr %t5401, i64 4
  store i64 %t5403, ptr %t5407
  %t5408 = musttail call fastcc i64 @"scheme.base:code_919"(i64 %t5403, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5408
}

define fastcc i64 @"scheme.base:code_940"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5413 = icmp eq i64 %argc, 1
  br i1 %t5413, label %argok1149, label %arityerr1148
arityerr1148:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1149:
  %t5414 = and i64 %self, -8
  %t5415 = inttoptr i64 %t5414 to ptr
  %t5416 = getelementptr i64, ptr %t5415, i64 1
  %t5417 = load i64, ptr %t5416
  %t5418 = or i64 %a0, %t5417
  %t5419 = and i64 %t5418, 7
  %t5420 = icmp eq i64 %t5419, 0
  br i1 %t5420, label %fixfast1150, label %fixslow1151
fixfast1150:
  %t5421 = icmp eq i64 %a0, %t5417
  %t5422 = select i1 %t5421, i64 257, i64 1
  br label %fixmerge1152
fixslow1151:
  %t5423 = call i64 @rt_num_eq(i64 %a0, i64 %t5417)
  br label %fixmerge1152
fixmerge1152:
  %t5424 = phi i64 [ %t5422, %fixfast1150 ], [ %t5423, %fixslow1151 ]
  %t5425 = icmp ne i64 %t5424, 1
  br i1 %t5425, label %then1153, label %else1154
then1153:
  %t5426 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t5426)
  %t5427 = and i64 %t5426, -8
  %t5428 = inttoptr i64 %t5427 to ptr
  %t5429 = load i64, ptr %t5428
  %t5430 = inttoptr i64 %t5429 to ptr
  %t5431 = musttail call fastcc i64 %t5430(i64 %t5426, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5431
else1154:
  %t5432 = and i64 %self, -8
  %t5433 = inttoptr i64 %t5432 to ptr
  %t5434 = getelementptr i64, ptr %t5433, i64 3
  %t5435 = load i64, ptr %t5434
  %t5436 = call i64 @rt_string_ref(i64 %t5435, i64 %a0)
  %t5437 = and i64 %self, -8
  %t5438 = inttoptr i64 %t5437 to ptr
  %t5439 = getelementptr i64, ptr %t5438, i64 2
  %t5440 = load i64, ptr %t5439
  call void @rt_check_callable(i64 %t5440)
  %t5441 = and i64 %t5440, -8
  %t5442 = inttoptr i64 %t5441 to ptr
  %t5443 = load i64, ptr %t5442
  %t5444 = inttoptr i64 %t5443 to ptr
  %t5445 = call fastcc i64%t5444(i64 %t5440, i64 1, i64 %t5436, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5446 = or i64 %a0, 8
  %t5447 = and i64 %t5446, 7
  %t5448 = icmp eq i64 %t5447, 0
  br i1 %t5448, label %fixfast1155, label %fixslow1156
fixfast1155:
  %t5449 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5450 = extractvalue {i64, i1} %t5449, 0
  %t5451 = extractvalue {i64, i1} %t5449, 1
  br i1 %t5451, label %fixslow1156, label %fixmerge1157
fixslow1156:
  %t5452 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1157
fixmerge1157:
  %t5453 = phi i64 [ %t5450, %fixfast1155 ], [ %t5452, %fixslow1156 ]
  %t5454 = musttail call fastcc i64 @"scheme.base:code_940"(i64 %self, i64 1, i64 %t5453, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5454
}

define fastcc i64 @"scheme.base:code_942"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5455 = icmp eq i64 %argc, 1
  br i1 %t5455, label %argok1159, label %arityerr1158
arityerr1158:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1159:
  %t5456 = and i64 %self, -8
  %t5457 = inttoptr i64 %t5456 to ptr
  %t5458 = getelementptr i64, ptr %t5457, i64 1
  %t5459 = load i64, ptr %t5458
  %t5460 = or i64 %a0, %t5459
  %t5461 = and i64 %t5460, 7
  %t5462 = icmp eq i64 %t5461, 0
  br i1 %t5462, label %fixfast1160, label %fixslow1161
fixfast1160:
  %t5463 = icmp eq i64 %a0, %t5459
  %t5464 = select i1 %t5463, i64 257, i64 1
  br label %fixmerge1162
fixslow1161:
  %t5465 = call i64 @rt_num_eq(i64 %a0, i64 %t5459)
  br label %fixmerge1162
fixmerge1162:
  %t5466 = phi i64 [ %t5464, %fixfast1160 ], [ %t5465, %fixslow1161 ]
  %t5467 = icmp ne i64 %t5466, 1
  br i1 %t5467, label %then1163, label %else1164
then1163:
  %t5468 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t5468)
  %t5469 = and i64 %t5468, -8
  %t5470 = inttoptr i64 %t5469 to ptr
  %t5471 = load i64, ptr %t5470
  %t5472 = inttoptr i64 %t5471 to ptr
  %t5473 = musttail call fastcc i64 %t5472(i64 %t5468, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5473
else1164:
  %t5474 = and i64 %self, -8
  %t5475 = inttoptr i64 %t5474 to ptr
  %t5476 = getelementptr i64, ptr %t5475, i64 3
  %t5477 = load i64, ptr %t5476
  %t5478 = load i64, ptr @"scheme.base:str-nth"
  call void @rt_check_callable(i64 %t5478)
  %t5479 = and i64 %t5478, -8
  %t5480 = inttoptr i64 %t5479 to ptr
  %t5481 = load i64, ptr %t5480
  %t5482 = inttoptr i64 %t5481 to ptr
  %t5483 = call fastcc i64%t5482(i64 %t5478, i64 2, i64 %t5477, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5484 = and i64 %self, -8
  %t5485 = inttoptr i64 %t5484 to ptr
  %t5486 = getelementptr i64, ptr %t5485, i64 2
  %t5487 = load i64, ptr %t5486
  call void @rt_check_callable(i64 %t5487)
  %t5488 = and i64 %t5487, -8
  %t5489 = inttoptr i64 %t5488 to ptr
  %t5490 = load i64, ptr %t5489
  %t5491 = inttoptr i64 %t5490 to ptr
  %t5492 = call i64 @rt_list_length(i64 %t5483)
  %t5493 = add i64 0, %t5492
  %t5494 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t5483, i64 8)
  %t5506 = getelementptr i64, ptr %t5494, i64 0
  %t5498 = load i64, ptr %t5506
  %t5507 = getelementptr i64, ptr %t5494, i64 1
  %t5499 = load i64, ptr %t5507
  %t5508 = getelementptr i64, ptr %t5494, i64 2
  %t5500 = load i64, ptr %t5508
  %t5509 = getelementptr i64, ptr %t5494, i64 3
  %t5501 = load i64, ptr %t5509
  %t5510 = getelementptr i64, ptr %t5494, i64 4
  %t5502 = load i64, ptr %t5510
  %t5511 = getelementptr i64, ptr %t5494, i64 5
  %t5503 = load i64, ptr %t5511
  %t5512 = getelementptr i64, ptr %t5494, i64 6
  %t5504 = load i64, ptr %t5512
  %t5513 = getelementptr i64, ptr %t5494, i64 7
  %t5505 = load i64, ptr %t5513
  %t5495 = icmp sgt i64 %t5493, 8
  %t5496 = getelementptr i64, ptr %t5494, i64 8
  %t5497 = select i1 %t5495, ptr %t5496, ptr null
  %t5514 = call fastcc i64%t5491(i64 %t5487, i64 %t5493, i64 %t5498, i64 %t5499, i64 %t5500, i64 %t5501, i64 %t5502, i64 %t5503, i64 %t5504, i64 %t5505, ptr %t5497)
  %t5515 = or i64 %a0, 8
  %t5516 = and i64 %t5515, 7
  %t5517 = icmp eq i64 %t5516, 0
  br i1 %t5517, label %fixfast1165, label %fixslow1166
fixfast1165:
  %t5518 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5519 = extractvalue {i64, i1} %t5518, 0
  %t5520 = extractvalue {i64, i1} %t5518, 1
  br i1 %t5520, label %fixslow1166, label %fixmerge1167
fixslow1166:
  %t5521 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1167
fixmerge1167:
  %t5522 = phi i64 [ %t5519, %fixfast1165 ], [ %t5521, %fixslow1166 ]
  %t5523 = musttail call fastcc i64 @"scheme.base:code_942"(i64 %self, i64 1, i64 %t5522, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5523
}

define fastcc i64 @"scheme.base:code:string-for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5524 = icmp sge i64 %argc, 2
  br i1 %t5524, label %argok1169, label %arityerr1168
arityerr1168:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1169:
  %t5525 = call ptr @rt_alloc_words(i64 8)
  %t5526 = getelementptr i64, ptr %t5525, i64 0
  store i64 %a0, ptr %t5526
  %t5527 = getelementptr i64, ptr %t5525, i64 1
  store i64 %a1, ptr %t5527
  %t5528 = getelementptr i64, ptr %t5525, i64 2
  store i64 %a2, ptr %t5528
  %t5529 = getelementptr i64, ptr %t5525, i64 3
  store i64 %a3, ptr %t5529
  %t5530 = getelementptr i64, ptr %t5525, i64 4
  store i64 %a4, ptr %t5530
  %t5531 = getelementptr i64, ptr %t5525, i64 5
  store i64 %a5, ptr %t5531
  %t5532 = getelementptr i64, ptr %t5525, i64 6
  store i64 %a6, ptr %t5532
  %t5533 = getelementptr i64, ptr %t5525, i64 7
  store i64 %a7, ptr %t5533
  %t5534 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t5525, ptr %overflow)
  %t5535 = call i64 @rt_null_p(i64 %t5534)
  %t5536 = icmp ne i64 %t5535, 1
  br i1 %t5536, label %then1170, label %else1171
then1170:
  %t5537 = call i64 @rt_string_length(i64 %a1)
  %t5538 = call ptr @rt_alloc_words(i64 5)
  %t5539 = ptrtoint ptr %t5538 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_940" to i64), ptr %t5538
  %t5540 = or i64 %t5539, 4
  %t5541 = getelementptr i64, ptr %t5538, i64 1
  store i64 %t5537, ptr %t5541
  %t5542 = getelementptr i64, ptr %t5538, i64 2
  store i64 %a0, ptr %t5542
  %t5543 = getelementptr i64, ptr %t5538, i64 3
  store i64 %a1, ptr %t5543
  %t5544 = getelementptr i64, ptr %t5538, i64 4
  store i64 %t5540, ptr %t5544
  %t5545 = musttail call fastcc i64 @"scheme.base:code_940"(i64 %t5540, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5545
else1171:
  %t5546 = call i64 @rt_cons(i64 %a1, i64 %t5534)
  %t5547 = load i64, ptr @"scheme.base:str-min-len"
  call void @rt_check_callable(i64 %t5547)
  %t5548 = and i64 %t5547, -8
  %t5549 = inttoptr i64 %t5548 to ptr
  %t5550 = load i64, ptr %t5549
  %t5551 = inttoptr i64 %t5550 to ptr
  %t5552 = call fastcc i64%t5551(i64 %t5547, i64 1, i64 %t5546, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5553 = call ptr @rt_alloc_words(i64 5)
  %t5554 = ptrtoint ptr %t5553 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_942" to i64), ptr %t5553
  %t5555 = or i64 %t5554, 4
  %t5556 = getelementptr i64, ptr %t5553, i64 1
  store i64 %t5552, ptr %t5556
  %t5557 = getelementptr i64, ptr %t5553, i64 2
  store i64 %a0, ptr %t5557
  %t5558 = getelementptr i64, ptr %t5553, i64 3
  store i64 %t5546, ptr %t5558
  %t5559 = getelementptr i64, ptr %t5553, i64 4
  store i64 %t5555, ptr %t5559
  %t5560 = musttail call fastcc i64 @"scheme.base:code_942"(i64 %t5555, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5560
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring-for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5561 = call i64 @rt_null_p(i64 2)
  %t5562 = icmp ne i64 %t5561, 1
  br i1 %t5562, label %then1172, label %else1173
then1172:
  %t5563 = call i64 @rt_string_length(i64 %a1)
  %t5564 = call ptr @rt_alloc_words(i64 5)
  %t5565 = ptrtoint ptr %t5564 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_940" to i64), ptr %t5564
  %t5566 = or i64 %t5565, 4
  %t5567 = getelementptr i64, ptr %t5564, i64 1
  store i64 %t5563, ptr %t5567
  %t5568 = getelementptr i64, ptr %t5564, i64 2
  store i64 %a0, ptr %t5568
  %t5569 = getelementptr i64, ptr %t5564, i64 3
  store i64 %a1, ptr %t5569
  %t5570 = getelementptr i64, ptr %t5564, i64 4
  store i64 %t5566, ptr %t5570
  %t5571 = musttail call fastcc i64 @"scheme.base:code_940"(i64 %t5566, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5571
else1173:
  %t5572 = call i64 @rt_cons(i64 %a1, i64 2)
  %t5573 = load i64, ptr @"scheme.base:str-min-len"
  call void @rt_check_callable(i64 %t5573)
  %t5574 = and i64 %t5573, -8
  %t5575 = inttoptr i64 %t5574 to ptr
  %t5576 = load i64, ptr %t5575
  %t5577 = inttoptr i64 %t5576 to ptr
  %t5578 = call fastcc i64%t5577(i64 %t5573, i64 1, i64 %t5572, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5579 = call ptr @rt_alloc_words(i64 5)
  %t5580 = ptrtoint ptr %t5579 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_942" to i64), ptr %t5579
  %t5581 = or i64 %t5580, 4
  %t5582 = getelementptr i64, ptr %t5579, i64 1
  store i64 %t5578, ptr %t5582
  %t5583 = getelementptr i64, ptr %t5579, i64 2
  store i64 %a0, ptr %t5583
  %t5584 = getelementptr i64, ptr %t5579, i64 3
  store i64 %t5572, ptr %t5584
  %t5585 = getelementptr i64, ptr %t5579, i64 4
  store i64 %t5581, ptr %t5585
  %t5586 = musttail call fastcc i64 @"scheme.base:code_942"(i64 %t5581, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5586
}

define fastcc i64 @"scheme.base:code:str-min-len"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5591 = icmp eq i64 %argc, 1
  br i1 %t5591, label %argok1175, label %arityerr1174
arityerr1174:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1175:
  %t5592 = call i64 @rt_cdr(i64 %a0)
  %t5593 = call i64 @rt_null_p(i64 %t5592)
  %t5594 = icmp ne i64 %t5593, 1
  br i1 %t5594, label %then1176, label %else1177
then1176:
  %t5595 = call i64 @rt_car(i64 %a0)
  %t5596 = call i64 @rt_string_length(i64 %t5595)
  ret i64 %t5596
else1177:
  %t5597 = call i64 @rt_car(i64 %a0)
  %t5598 = call i64 @rt_string_length(i64 %t5597)
  %t5599 = call i64 @rt_cdr(i64 %a0)
  %t5600 = load i64, ptr @"scheme.base:str-min-len"
  call void @rt_check_callable(i64 %t5600)
  %t5601 = and i64 %t5600, -8
  %t5602 = inttoptr i64 %t5601 to ptr
  %t5603 = load i64, ptr %t5602
  %t5604 = inttoptr i64 %t5603 to ptr
  %t5605 = call fastcc i64%t5604(i64 %t5600, i64 1, i64 %t5599, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5606 = or i64 %t5598, %t5605
  %t5607 = and i64 %t5606, 7
  %t5608 = icmp eq i64 %t5607, 0
  br i1 %t5608, label %fixfast1178, label %fixslow1179
fixfast1178:
  %t5609 = icmp slt i64 %t5598, %t5605
  %t5610 = select i1 %t5609, i64 257, i64 1
  br label %fixmerge1180
fixslow1179:
  %t5611 = call i64 @rt_lt(i64 %t5598, i64 %t5605)
  br label %fixmerge1180
fixmerge1180:
  %t5612 = phi i64 [ %t5610, %fixfast1178 ], [ %t5611, %fixslow1179 ]
  %t5613 = icmp ne i64 %t5612, 1
  br i1 %t5613, label %then1181, label %else1182
then1181:
  ret i64 %t5598
else1182:
  ret i64 %t5605
}

define fastcc i64 @"scheme.base:code:str-nth"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5618 = icmp eq i64 %argc, 2
  br i1 %t5618, label %argok1184, label %arityerr1183
arityerr1183:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1184:
  %t5619 = call i64 @rt_null_p(i64 %a0)
  %t5620 = icmp ne i64 %t5619, 1
  br i1 %t5620, label %then1185, label %else1186
then1185:
  ret i64 2
else1186:
  %t5621 = call i64 @rt_car(i64 %a0)
  %t5622 = call i64 @rt_string_ref(i64 %t5621, i64 %a1)
  %t5623 = call i64 @rt_cdr(i64 %a0)
  %t5624 = load i64, ptr @"scheme.base:str-nth"
  call void @rt_check_callable(i64 %t5624)
  %t5625 = and i64 %t5624, -8
  %t5626 = inttoptr i64 %t5625 to ptr
  %t5627 = load i64, ptr %t5626
  %t5628 = inttoptr i64 %t5627 to ptr
  %t5629 = call fastcc i64%t5628(i64 %t5624, i64 2, i64 %t5623, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5630 = call i64 @rt_cons(i64 %t5622, i64 %t5629)
  ret i64 %t5630
}

define fastcc i64 @"scheme.base:code_968"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5635 = icmp eq i64 %argc, 1
  br i1 %t5635, label %argok1188, label %arityerr1187
arityerr1187:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1188:
  %t5636 = and i64 %self, -8
  %t5637 = inttoptr i64 %t5636 to ptr
  %t5638 = getelementptr i64, ptr %t5637, i64 1
  %t5639 = load i64, ptr %t5638
  %t5640 = or i64 %a0, %t5639
  %t5641 = and i64 %t5640, 7
  %t5642 = icmp eq i64 %t5641, 0
  br i1 %t5642, label %fixfast1189, label %fixslow1190
fixfast1189:
  %t5643 = icmp eq i64 %a0, %t5639
  %t5644 = select i1 %t5643, i64 257, i64 1
  br label %fixmerge1191
fixslow1190:
  %t5645 = call i64 @rt_num_eq(i64 %a0, i64 %t5639)
  br label %fixmerge1191
fixmerge1191:
  %t5646 = phi i64 [ %t5644, %fixfast1189 ], [ %t5645, %fixslow1190 ]
  %t5647 = icmp ne i64 %t5646, 1
  br i1 %t5647, label %then1192, label %else1193
then1192:
  %t5648 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t5648)
  %t5649 = and i64 %t5648, -8
  %t5650 = inttoptr i64 %t5649 to ptr
  %t5651 = load i64, ptr %t5650
  %t5652 = inttoptr i64 %t5651 to ptr
  %t5653 = musttail call fastcc i64 %t5652(i64 %t5648, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5653
else1193:
  %t5654 = and i64 %self, -8
  %t5655 = inttoptr i64 %t5654 to ptr
  %t5656 = getelementptr i64, ptr %t5655, i64 2
  %t5657 = load i64, ptr %t5656
  %t5658 = and i64 %self, -8
  %t5659 = inttoptr i64 %t5658 to ptr
  %t5660 = getelementptr i64, ptr %t5659, i64 3
  %t5661 = load i64, ptr %t5660
  %t5662 = call i64 @rt_string_set(i64 %t5657, i64 %a0, i64 %t5661)
  %t5663 = or i64 %a0, 8
  %t5664 = and i64 %t5663, 7
  %t5665 = icmp eq i64 %t5664, 0
  br i1 %t5665, label %fixfast1194, label %fixslow1195
fixfast1194:
  %t5666 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5667 = extractvalue {i64, i1} %t5666, 0
  %t5668 = extractvalue {i64, i1} %t5666, 1
  br i1 %t5668, label %fixslow1195, label %fixmerge1196
fixslow1195:
  %t5669 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1196
fixmerge1196:
  %t5670 = phi i64 [ %t5667, %fixfast1194 ], [ %t5669, %fixslow1195 ]
  %t5671 = musttail call fastcc i64 @"scheme.base:code_968"(i64 %self, i64 1, i64 %t5670, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5671
}

define fastcc i64 @"scheme.base:code:string-fill!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5672 = icmp sge i64 %argc, 2
  br i1 %t5672, label %argok1198, label %arityerr1197
arityerr1197:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1198:
  %t5673 = call ptr @rt_alloc_words(i64 8)
  %t5674 = getelementptr i64, ptr %t5673, i64 0
  store i64 %a0, ptr %t5674
  %t5675 = getelementptr i64, ptr %t5673, i64 1
  store i64 %a1, ptr %t5675
  %t5676 = getelementptr i64, ptr %t5673, i64 2
  store i64 %a2, ptr %t5676
  %t5677 = getelementptr i64, ptr %t5673, i64 3
  store i64 %a3, ptr %t5677
  %t5678 = getelementptr i64, ptr %t5673, i64 4
  store i64 %a4, ptr %t5678
  %t5679 = getelementptr i64, ptr %t5673, i64 5
  store i64 %a5, ptr %t5679
  %t5680 = getelementptr i64, ptr %t5673, i64 6
  store i64 %a6, ptr %t5680
  %t5681 = getelementptr i64, ptr %t5673, i64 7
  store i64 %a7, ptr %t5681
  %t5682 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t5673, ptr %overflow)
  %t5683 = call i64 @rt_string_length(i64 %a0)
  %t5684 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5684)
  %t5685 = and i64 %t5684, -8
  %t5686 = inttoptr i64 %t5685 to ptr
  %t5687 = load i64, ptr %t5686
  %t5688 = inttoptr i64 %t5687 to ptr
  %t5689 = call fastcc i64%t5688(i64 %t5684, i64 1, i64 %t5682, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5690 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5690)
  %t5691 = and i64 %t5690, -8
  %t5692 = inttoptr i64 %t5691 to ptr
  %t5693 = load i64, ptr %t5692
  %t5694 = inttoptr i64 %t5693 to ptr
  %t5695 = call fastcc i64%t5694(i64 %t5690, i64 2, i64 %t5682, i64 %t5683, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5696 = call i64 @rt_intern(ptr @.str.sym.27)
  %t5697 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5697)
  %t5698 = and i64 %t5697, -8
  %t5699 = inttoptr i64 %t5698 to ptr
  %t5700 = load i64, ptr %t5699
  %t5701 = inttoptr i64 %t5700 to ptr
  %t5702 = call fastcc i64%t5701(i64 %t5697, i64 4, i64 %t5696, i64 %t5689, i64 %t5695, i64 %t5683, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5703 = call ptr @rt_alloc_words(i64 5)
  %t5704 = ptrtoint ptr %t5703 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_968" to i64), ptr %t5703
  %t5705 = or i64 %t5704, 4
  %t5706 = getelementptr i64, ptr %t5703, i64 1
  store i64 %t5695, ptr %t5706
  %t5707 = getelementptr i64, ptr %t5703, i64 2
  store i64 %a0, ptr %t5707
  %t5708 = getelementptr i64, ptr %t5703, i64 3
  store i64 %a1, ptr %t5708
  %t5709 = getelementptr i64, ptr %t5703, i64 4
  store i64 %t5705, ptr %t5709
  %t5710 = musttail call fastcc i64 @"scheme.base:code_968"(i64 %t5705, i64 1, i64 %t5689, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5710
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring-fill!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5711 = call i64 @rt_string_length(i64 %a0)
  %t5712 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5712)
  %t5713 = and i64 %t5712, -8
  %t5714 = inttoptr i64 %t5713 to ptr
  %t5715 = load i64, ptr %t5714
  %t5716 = inttoptr i64 %t5715 to ptr
  %t5717 = call fastcc i64%t5716(i64 %t5712, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5718 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5718)
  %t5719 = and i64 %t5718, -8
  %t5720 = inttoptr i64 %t5719 to ptr
  %t5721 = load i64, ptr %t5720
  %t5722 = inttoptr i64 %t5721 to ptr
  %t5723 = call fastcc i64%t5722(i64 %t5718, i64 2, i64 2, i64 %t5711, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5724 = call i64 @rt_intern(ptr @.str.sym.27)
  %t5725 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5725)
  %t5726 = and i64 %t5725, -8
  %t5727 = inttoptr i64 %t5726 to ptr
  %t5728 = load i64, ptr %t5727
  %t5729 = inttoptr i64 %t5728 to ptr
  %t5730 = call fastcc i64%t5729(i64 %t5725, i64 4, i64 %t5724, i64 %t5717, i64 %t5723, i64 %t5711, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5731 = call ptr @rt_alloc_words(i64 5)
  %t5732 = ptrtoint ptr %t5731 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_968" to i64), ptr %t5731
  %t5733 = or i64 %t5732, 4
  %t5734 = getelementptr i64, ptr %t5731, i64 1
  store i64 %t5723, ptr %t5734
  %t5735 = getelementptr i64, ptr %t5731, i64 2
  store i64 %a0, ptr %t5735
  %t5736 = getelementptr i64, ptr %t5731, i64 3
  store i64 %a1, ptr %t5736
  %t5737 = getelementptr i64, ptr %t5731, i64 4
  store i64 %t5733, ptr %t5737
  %t5738 = musttail call fastcc i64 @"scheme.base:code_968"(i64 %t5733, i64 1, i64 %t5717, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5738
}

define fastcc i64 @"scheme.base:code_994"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5743 = icmp eq i64 %argc, 1
  br i1 %t5743, label %argok1200, label %arityerr1199
arityerr1199:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1200:
  %t5744 = or i64 %a0, 0
  %t5745 = and i64 %t5744, 7
  %t5746 = icmp eq i64 %t5745, 0
  br i1 %t5746, label %fixfast1201, label %fixslow1202
fixfast1201:
  %t5747 = icmp slt i64 %a0, 0
  %t5748 = select i1 %t5747, i64 257, i64 1
  br label %fixmerge1203
fixslow1202:
  %t5749 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge1203
fixmerge1203:
  %t5750 = phi i64 [ %t5748, %fixfast1201 ], [ %t5749, %fixslow1202 ]
  %t5751 = icmp ne i64 %t5750, 1
  br i1 %t5751, label %then1204, label %else1205
then1204:
  %t5752 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t5752)
  %t5753 = and i64 %t5752, -8
  %t5754 = inttoptr i64 %t5753 to ptr
  %t5755 = load i64, ptr %t5754
  %t5756 = inttoptr i64 %t5755 to ptr
  %t5757 = musttail call fastcc i64 %t5756(i64 %t5752, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5757
else1205:
  %t5758 = and i64 %self, -8
  %t5759 = inttoptr i64 %t5758 to ptr
  %t5760 = getelementptr i64, ptr %t5759, i64 1
  %t5761 = load i64, ptr %t5760
  %t5762 = and i64 %self, -8
  %t5763 = inttoptr i64 %t5762 to ptr
  %t5764 = getelementptr i64, ptr %t5763, i64 2
  %t5765 = load i64, ptr %t5764
  %t5766 = or i64 %t5765, %a0
  %t5767 = and i64 %t5766, 7
  %t5768 = icmp eq i64 %t5767, 0
  br i1 %t5768, label %fixfast1206, label %fixslow1207
fixfast1206:
  %t5769 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5765, i64 %a0)
  %t5770 = extractvalue {i64, i1} %t5769, 0
  %t5771 = extractvalue {i64, i1} %t5769, 1
  br i1 %t5771, label %fixslow1207, label %fixmerge1208
fixslow1207:
  %t5772 = call i64 @rt_add(i64 %t5765, i64 %a0)
  br label %fixmerge1208
fixmerge1208:
  %t5773 = phi i64 [ %t5770, %fixfast1206 ], [ %t5772, %fixslow1207 ]
  %t5774 = and i64 %self, -8
  %t5775 = inttoptr i64 %t5774 to ptr
  %t5776 = getelementptr i64, ptr %t5775, i64 3
  %t5777 = load i64, ptr %t5776
  %t5778 = and i64 %self, -8
  %t5779 = inttoptr i64 %t5778 to ptr
  %t5780 = getelementptr i64, ptr %t5779, i64 4
  %t5781 = load i64, ptr %t5780
  %t5782 = or i64 %t5781, %a0
  %t5783 = and i64 %t5782, 7
  %t5784 = icmp eq i64 %t5783, 0
  br i1 %t5784, label %fixfast1209, label %fixslow1210
fixfast1209:
  %t5785 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5781, i64 %a0)
  %t5786 = extractvalue {i64, i1} %t5785, 0
  %t5787 = extractvalue {i64, i1} %t5785, 1
  br i1 %t5787, label %fixslow1210, label %fixmerge1211
fixslow1210:
  %t5788 = call i64 @rt_add(i64 %t5781, i64 %a0)
  br label %fixmerge1211
fixmerge1211:
  %t5789 = phi i64 [ %t5786, %fixfast1209 ], [ %t5788, %fixslow1210 ]
  %t5790 = call i64 @rt_string_ref(i64 %t5777, i64 %t5789)
  %t5791 = call i64 @rt_string_set(i64 %t5761, i64 %t5773, i64 %t5790)
  %t5792 = or i64 %a0, 8
  %t5793 = and i64 %t5792, 7
  %t5794 = icmp eq i64 %t5793, 0
  br i1 %t5794, label %fixfast1212, label %fixslow1213
fixfast1212:
  %t5795 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t5796 = extractvalue {i64, i1} %t5795, 0
  %t5797 = extractvalue {i64, i1} %t5795, 1
  br i1 %t5797, label %fixslow1213, label %fixmerge1214
fixslow1213:
  %t5798 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge1214
fixmerge1214:
  %t5799 = phi i64 [ %t5796, %fixfast1212 ], [ %t5798, %fixslow1213 ]
  %t5800 = musttail call fastcc i64 @"scheme.base:code_994"(i64 %self, i64 1, i64 %t5799, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5800
}

define fastcc i64 @"scheme.base:code_996"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5801 = icmp eq i64 %argc, 1
  br i1 %t5801, label %argok1216, label %arityerr1215
arityerr1215:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1216:
  %t5802 = and i64 %self, -8
  %t5803 = inttoptr i64 %t5802 to ptr
  %t5804 = getelementptr i64, ptr %t5803, i64 1
  %t5805 = load i64, ptr %t5804
  %t5806 = and i64 %self, -8
  %t5807 = inttoptr i64 %t5806 to ptr
  %t5808 = getelementptr i64, ptr %t5807, i64 2
  %t5809 = load i64, ptr %t5808
  %t5810 = or i64 %t5805, %t5809
  %t5811 = and i64 %t5810, 7
  %t5812 = icmp eq i64 %t5811, 0
  br i1 %t5812, label %fixfast1217, label %fixslow1218
fixfast1217:
  %t5813 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5805, i64 %t5809)
  %t5814 = extractvalue {i64, i1} %t5813, 0
  %t5815 = extractvalue {i64, i1} %t5813, 1
  br i1 %t5815, label %fixslow1218, label %fixmerge1219
fixslow1218:
  %t5816 = call i64 @rt_sub(i64 %t5805, i64 %t5809)
  br label %fixmerge1219
fixmerge1219:
  %t5817 = phi i64 [ %t5814, %fixfast1217 ], [ %t5816, %fixslow1218 ]
  %t5818 = or i64 %a0, %t5817
  %t5819 = and i64 %t5818, 7
  %t5820 = icmp eq i64 %t5819, 0
  br i1 %t5820, label %fixfast1220, label %fixslow1221
fixfast1220:
  %t5821 = icmp eq i64 %a0, %t5817
  %t5822 = select i1 %t5821, i64 257, i64 1
  br label %fixmerge1222
fixslow1221:
  %t5823 = call i64 @rt_num_eq(i64 %a0, i64 %t5817)
  br label %fixmerge1222
fixmerge1222:
  %t5824 = phi i64 [ %t5822, %fixfast1220 ], [ %t5823, %fixslow1221 ]
  %t5825 = icmp ne i64 %t5824, 1
  br i1 %t5825, label %then1223, label %else1224
then1223:
  %t5826 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t5826)
  %t5827 = and i64 %t5826, -8
  %t5828 = inttoptr i64 %t5827 to ptr
  %t5829 = load i64, ptr %t5828
  %t5830 = inttoptr i64 %t5829 to ptr
  %t5831 = musttail call fastcc i64 %t5830(i64 %t5826, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5831
else1224:
  %t5832 = and i64 %self, -8
  %t5833 = inttoptr i64 %t5832 to ptr
  %t5834 = getelementptr i64, ptr %t5833, i64 3
  %t5835 = load i64, ptr %t5834
  %t5836 = and i64 %self, -8
  %t5837 = inttoptr i64 %t5836 to ptr
  %t5838 = getelementptr i64, ptr %t5837, i64 4
  %t5839 = load i64, ptr %t5838
  %t5840 = or i64 %t5839, %a0
  %t5841 = and i64 %t5840, 7
  %t5842 = icmp eq i64 %t5841, 0
  br i1 %t5842, label %fixfast1225, label %fixslow1226
fixfast1225:
  %t5843 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5839, i64 %a0)
  %t5844 = extractvalue {i64, i1} %t5843, 0
  %t5845 = extractvalue {i64, i1} %t5843, 1
  br i1 %t5845, label %fixslow1226, label %fixmerge1227
fixslow1226:
  %t5846 = call i64 @rt_add(i64 %t5839, i64 %a0)
  br label %fixmerge1227
fixmerge1227:
  %t5847 = phi i64 [ %t5844, %fixfast1225 ], [ %t5846, %fixslow1226 ]
  %t5848 = and i64 %self, -8
  %t5849 = inttoptr i64 %t5848 to ptr
  %t5850 = getelementptr i64, ptr %t5849, i64 5
  %t5851 = load i64, ptr %t5850
  %t5852 = and i64 %self, -8
  %t5853 = inttoptr i64 %t5852 to ptr
  %t5854 = getelementptr i64, ptr %t5853, i64 2
  %t5855 = load i64, ptr %t5854
  %t5856 = or i64 %t5855, %a0
  %t5857 = and i64 %t5856, 7
  %t5858 = icmp eq i64 %t5857, 0
  br i1 %t5858, label %fixfast1228, label %fixslow1229
fixfast1228:
  %t5859 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5855, i64 %a0)
  %t5860 = extractvalue {i64, i1} %t5859, 0
  %t5861 = extractvalue {i64, i1} %t5859, 1
  br i1 %t5861, label %fixslow1229, label %fixmerge1230
fixslow1229:
  %t5862 = call i64 @rt_add(i64 %t5855, i64 %a0)
  br label %fixmerge1230
fixmerge1230:
  %t5863 = phi i64 [ %t5860, %fixfast1228 ], [ %t5862, %fixslow1229 ]
  %t5864 = call i64 @rt_string_ref(i64 %t5851, i64 %t5863)
  %t5865 = call i64 @rt_string_set(i64 %t5835, i64 %t5847, i64 %t5864)
  %t5866 = or i64 %a0, 8
  %t5867 = and i64 %t5866, 7
  %t5868 = icmp eq i64 %t5867, 0
  br i1 %t5868, label %fixfast1231, label %fixslow1232
fixfast1231:
  %t5869 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5870 = extractvalue {i64, i1} %t5869, 0
  %t5871 = extractvalue {i64, i1} %t5869, 1
  br i1 %t5871, label %fixslow1232, label %fixmerge1233
fixslow1232:
  %t5872 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1233
fixmerge1233:
  %t5873 = phi i64 [ %t5870, %fixfast1231 ], [ %t5872, %fixslow1232 ]
  %t5874 = musttail call fastcc i64 @"scheme.base:code_996"(i64 %self, i64 1, i64 %t5873, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5874
}

define fastcc i64 @"scheme.base:code:string-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5875 = icmp sge i64 %argc, 3
  br i1 %t5875, label %argok1235, label %arityerr1234
arityerr1234:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1235:
  %t5876 = call ptr @rt_alloc_words(i64 8)
  %t5877 = getelementptr i64, ptr %t5876, i64 0
  store i64 %a0, ptr %t5877
  %t5878 = getelementptr i64, ptr %t5876, i64 1
  store i64 %a1, ptr %t5878
  %t5879 = getelementptr i64, ptr %t5876, i64 2
  store i64 %a2, ptr %t5879
  %t5880 = getelementptr i64, ptr %t5876, i64 3
  store i64 %a3, ptr %t5880
  %t5881 = getelementptr i64, ptr %t5876, i64 4
  store i64 %a4, ptr %t5881
  %t5882 = getelementptr i64, ptr %t5876, i64 5
  store i64 %a5, ptr %t5882
  %t5883 = getelementptr i64, ptr %t5876, i64 6
  store i64 %a6, ptr %t5883
  %t5884 = getelementptr i64, ptr %t5876, i64 7
  store i64 %a7, ptr %t5884
  %t5885 = call i64 @rt_build_rest(i64 %argc, i64 3, i64 8, ptr %t5876, ptr %overflow)
  %t5886 = call i64 @rt_string_length(i64 %a2)
  %t5887 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5887)
  %t5888 = and i64 %t5887, -8
  %t5889 = inttoptr i64 %t5888 to ptr
  %t5890 = load i64, ptr %t5889
  %t5891 = inttoptr i64 %t5890 to ptr
  %t5892 = call fastcc i64%t5891(i64 %t5887, i64 1, i64 %t5885, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5893 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5893)
  %t5894 = and i64 %t5893, -8
  %t5895 = inttoptr i64 %t5894 to ptr
  %t5896 = load i64, ptr %t5895
  %t5897 = inttoptr i64 %t5896 to ptr
  %t5898 = call fastcc i64%t5897(i64 %t5893, i64 2, i64 %t5885, i64 %t5886, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5899 = call i64 @rt_intern(ptr @.str.sym.28)
  %t5900 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5900)
  %t5901 = and i64 %t5900, -8
  %t5902 = inttoptr i64 %t5901 to ptr
  %t5903 = load i64, ptr %t5902
  %t5904 = inttoptr i64 %t5903 to ptr
  %t5905 = call fastcc i64%t5904(i64 %t5900, i64 4, i64 %t5899, i64 %t5892, i64 %t5898, i64 %t5886, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5906 = call i64 @rt_intern(ptr @.str.sym.28)
  %t5907 = or i64 %t5898, %t5892
  %t5908 = and i64 %t5907, 7
  %t5909 = icmp eq i64 %t5908, 0
  br i1 %t5909, label %fixfast1236, label %fixslow1237
fixfast1236:
  %t5910 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5898, i64 %t5892)
  %t5911 = extractvalue {i64, i1} %t5910, 0
  %t5912 = extractvalue {i64, i1} %t5910, 1
  br i1 %t5912, label %fixslow1237, label %fixmerge1238
fixslow1237:
  %t5913 = call i64 @rt_sub(i64 %t5898, i64 %t5892)
  br label %fixmerge1238
fixmerge1238:
  %t5914 = phi i64 [ %t5911, %fixfast1236 ], [ %t5913, %fixslow1237 ]
  %t5915 = or i64 %a1, %t5914
  %t5916 = and i64 %t5915, 7
  %t5917 = icmp eq i64 %t5916, 0
  br i1 %t5917, label %fixfast1239, label %fixslow1240
fixfast1239:
  %t5918 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t5914)
  %t5919 = extractvalue {i64, i1} %t5918, 0
  %t5920 = extractvalue {i64, i1} %t5918, 1
  br i1 %t5920, label %fixslow1240, label %fixmerge1241
fixslow1240:
  %t5921 = call i64 @rt_add(i64 %a1, i64 %t5914)
  br label %fixmerge1241
fixmerge1241:
  %t5922 = phi i64 [ %t5919, %fixfast1239 ], [ %t5921, %fixslow1240 ]
  %t5923 = call i64 @rt_string_length(i64 %a0)
  %t5924 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5924)
  %t5925 = and i64 %t5924, -8
  %t5926 = inttoptr i64 %t5925 to ptr
  %t5927 = load i64, ptr %t5926
  %t5928 = inttoptr i64 %t5927 to ptr
  %t5929 = call fastcc i64%t5928(i64 %t5924, i64 4, i64 %t5906, i64 %a1, i64 %t5922, i64 %t5923, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5930 = or i64 %t5892, %a1
  %t5931 = and i64 %t5930, 7
  %t5932 = icmp eq i64 %t5931, 0
  br i1 %t5932, label %fixfast1242, label %fixslow1243
fixfast1242:
  %t5933 = icmp slt i64 %t5892, %a1
  %t5934 = select i1 %t5933, i64 257, i64 1
  br label %fixmerge1244
fixslow1243:
  %t5935 = call i64 @rt_lt(i64 %t5892, i64 %a1)
  br label %fixmerge1244
fixmerge1244:
  %t5936 = phi i64 [ %t5934, %fixfast1242 ], [ %t5935, %fixslow1243 ]
  %t5937 = icmp ne i64 %t5936, 1
  br i1 %t5937, label %then1245, label %else1246
then1245:
  %t5938 = call ptr @rt_alloc_words(i64 6)
  %t5939 = ptrtoint ptr %t5938 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_994" to i64), ptr %t5938
  %t5940 = or i64 %t5939, 4
  %t5941 = getelementptr i64, ptr %t5938, i64 1
  store i64 %a0, ptr %t5941
  %t5942 = getelementptr i64, ptr %t5938, i64 2
  store i64 %a1, ptr %t5942
  %t5943 = getelementptr i64, ptr %t5938, i64 3
  store i64 %a2, ptr %t5943
  %t5944 = getelementptr i64, ptr %t5938, i64 4
  store i64 %t5892, ptr %t5944
  %t5945 = getelementptr i64, ptr %t5938, i64 5
  store i64 %t5940, ptr %t5945
  %t5946 = or i64 %t5898, %t5892
  %t5947 = and i64 %t5946, 7
  %t5948 = icmp eq i64 %t5947, 0
  br i1 %t5948, label %fixfast1247, label %fixslow1248
fixfast1247:
  %t5949 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5898, i64 %t5892)
  %t5950 = extractvalue {i64, i1} %t5949, 0
  %t5951 = extractvalue {i64, i1} %t5949, 1
  br i1 %t5951, label %fixslow1248, label %fixmerge1249
fixslow1248:
  %t5952 = call i64 @rt_sub(i64 %t5898, i64 %t5892)
  br label %fixmerge1249
fixmerge1249:
  %t5953 = phi i64 [ %t5950, %fixfast1247 ], [ %t5952, %fixslow1248 ]
  %t5954 = or i64 %t5953, 8
  %t5955 = and i64 %t5954, 7
  %t5956 = icmp eq i64 %t5955, 0
  br i1 %t5956, label %fixfast1250, label %fixslow1251
fixfast1250:
  %t5957 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5953, i64 8)
  %t5958 = extractvalue {i64, i1} %t5957, 0
  %t5959 = extractvalue {i64, i1} %t5957, 1
  br i1 %t5959, label %fixslow1251, label %fixmerge1252
fixslow1251:
  %t5960 = call i64 @rt_sub(i64 %t5953, i64 8)
  br label %fixmerge1252
fixmerge1252:
  %t5961 = phi i64 [ %t5958, %fixfast1250 ], [ %t5960, %fixslow1251 ]
  %t5962 = musttail call fastcc i64 @"scheme.base:code_994"(i64 %t5940, i64 1, i64 %t5961, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5962
else1246:
  %t5963 = call ptr @rt_alloc_words(i64 7)
  %t5964 = ptrtoint ptr %t5963 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_996" to i64), ptr %t5963
  %t5965 = or i64 %t5964, 4
  %t5966 = getelementptr i64, ptr %t5963, i64 1
  store i64 %t5898, ptr %t5966
  %t5967 = getelementptr i64, ptr %t5963, i64 2
  store i64 %t5892, ptr %t5967
  %t5968 = getelementptr i64, ptr %t5963, i64 3
  store i64 %a0, ptr %t5968
  %t5969 = getelementptr i64, ptr %t5963, i64 4
  store i64 %a1, ptr %t5969
  %t5970 = getelementptr i64, ptr %t5963, i64 5
  store i64 %a2, ptr %t5970
  %t5971 = getelementptr i64, ptr %t5963, i64 6
  store i64 %t5965, ptr %t5971
  %t5972 = musttail call fastcc i64 @"scheme.base:code_996"(i64 %t5965, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5972
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5973 = call i64 @rt_string_length(i64 %a2)
  %t5974 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5974)
  %t5975 = and i64 %t5974, -8
  %t5976 = inttoptr i64 %t5975 to ptr
  %t5977 = load i64, ptr %t5976
  %t5978 = inttoptr i64 %t5977 to ptr
  %t5979 = call fastcc i64%t5978(i64 %t5974, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5980 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5980)
  %t5981 = and i64 %t5980, -8
  %t5982 = inttoptr i64 %t5981 to ptr
  %t5983 = load i64, ptr %t5982
  %t5984 = inttoptr i64 %t5983 to ptr
  %t5985 = call fastcc i64%t5984(i64 %t5980, i64 2, i64 2, i64 %t5973, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5986 = call i64 @rt_intern(ptr @.str.sym.28)
  %t5987 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5987)
  %t5988 = and i64 %t5987, -8
  %t5989 = inttoptr i64 %t5988 to ptr
  %t5990 = load i64, ptr %t5989
  %t5991 = inttoptr i64 %t5990 to ptr
  %t5992 = call fastcc i64%t5991(i64 %t5987, i64 4, i64 %t5986, i64 %t5979, i64 %t5985, i64 %t5973, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5993 = call i64 @rt_intern(ptr @.str.sym.28)
  %t5994 = or i64 %t5985, %t5979
  %t5995 = and i64 %t5994, 7
  %t5996 = icmp eq i64 %t5995, 0
  br i1 %t5996, label %fixfast1253, label %fixslow1254
fixfast1253:
  %t5997 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5985, i64 %t5979)
  %t5998 = extractvalue {i64, i1} %t5997, 0
  %t5999 = extractvalue {i64, i1} %t5997, 1
  br i1 %t5999, label %fixslow1254, label %fixmerge1255
fixslow1254:
  %t6000 = call i64 @rt_sub(i64 %t5985, i64 %t5979)
  br label %fixmerge1255
fixmerge1255:
  %t6001 = phi i64 [ %t5998, %fixfast1253 ], [ %t6000, %fixslow1254 ]
  %t6002 = or i64 %a1, %t6001
  %t6003 = and i64 %t6002, 7
  %t6004 = icmp eq i64 %t6003, 0
  br i1 %t6004, label %fixfast1256, label %fixslow1257
fixfast1256:
  %t6005 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t6001)
  %t6006 = extractvalue {i64, i1} %t6005, 0
  %t6007 = extractvalue {i64, i1} %t6005, 1
  br i1 %t6007, label %fixslow1257, label %fixmerge1258
fixslow1257:
  %t6008 = call i64 @rt_add(i64 %a1, i64 %t6001)
  br label %fixmerge1258
fixmerge1258:
  %t6009 = phi i64 [ %t6006, %fixfast1256 ], [ %t6008, %fixslow1257 ]
  %t6010 = call i64 @rt_string_length(i64 %a0)
  %t6011 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6011)
  %t6012 = and i64 %t6011, -8
  %t6013 = inttoptr i64 %t6012 to ptr
  %t6014 = load i64, ptr %t6013
  %t6015 = inttoptr i64 %t6014 to ptr
  %t6016 = call fastcc i64%t6015(i64 %t6011, i64 4, i64 %t5993, i64 %a1, i64 %t6009, i64 %t6010, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6017 = or i64 %t5979, %a1
  %t6018 = and i64 %t6017, 7
  %t6019 = icmp eq i64 %t6018, 0
  br i1 %t6019, label %fixfast1259, label %fixslow1260
fixfast1259:
  %t6020 = icmp slt i64 %t5979, %a1
  %t6021 = select i1 %t6020, i64 257, i64 1
  br label %fixmerge1261
fixslow1260:
  %t6022 = call i64 @rt_lt(i64 %t5979, i64 %a1)
  br label %fixmerge1261
fixmerge1261:
  %t6023 = phi i64 [ %t6021, %fixfast1259 ], [ %t6022, %fixslow1260 ]
  %t6024 = icmp ne i64 %t6023, 1
  br i1 %t6024, label %then1262, label %else1263
then1262:
  %t6025 = call ptr @rt_alloc_words(i64 6)
  %t6026 = ptrtoint ptr %t6025 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_994" to i64), ptr %t6025
  %t6027 = or i64 %t6026, 4
  %t6028 = getelementptr i64, ptr %t6025, i64 1
  store i64 %a0, ptr %t6028
  %t6029 = getelementptr i64, ptr %t6025, i64 2
  store i64 %a1, ptr %t6029
  %t6030 = getelementptr i64, ptr %t6025, i64 3
  store i64 %a2, ptr %t6030
  %t6031 = getelementptr i64, ptr %t6025, i64 4
  store i64 %t5979, ptr %t6031
  %t6032 = getelementptr i64, ptr %t6025, i64 5
  store i64 %t6027, ptr %t6032
  %t6033 = or i64 %t5985, %t5979
  %t6034 = and i64 %t6033, 7
  %t6035 = icmp eq i64 %t6034, 0
  br i1 %t6035, label %fixfast1264, label %fixslow1265
fixfast1264:
  %t6036 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5985, i64 %t5979)
  %t6037 = extractvalue {i64, i1} %t6036, 0
  %t6038 = extractvalue {i64, i1} %t6036, 1
  br i1 %t6038, label %fixslow1265, label %fixmerge1266
fixslow1265:
  %t6039 = call i64 @rt_sub(i64 %t5985, i64 %t5979)
  br label %fixmerge1266
fixmerge1266:
  %t6040 = phi i64 [ %t6037, %fixfast1264 ], [ %t6039, %fixslow1265 ]
  %t6041 = or i64 %t6040, 8
  %t6042 = and i64 %t6041, 7
  %t6043 = icmp eq i64 %t6042, 0
  br i1 %t6043, label %fixfast1267, label %fixslow1268
fixfast1267:
  %t6044 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6040, i64 8)
  %t6045 = extractvalue {i64, i1} %t6044, 0
  %t6046 = extractvalue {i64, i1} %t6044, 1
  br i1 %t6046, label %fixslow1268, label %fixmerge1269
fixslow1268:
  %t6047 = call i64 @rt_sub(i64 %t6040, i64 8)
  br label %fixmerge1269
fixmerge1269:
  %t6048 = phi i64 [ %t6045, %fixfast1267 ], [ %t6047, %fixslow1268 ]
  %t6049 = musttail call fastcc i64 @"scheme.base:code_994"(i64 %t6027, i64 1, i64 %t6048, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6049
else1263:
  %t6050 = call ptr @rt_alloc_words(i64 7)
  %t6051 = ptrtoint ptr %t6050 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_996" to i64), ptr %t6050
  %t6052 = or i64 %t6051, 4
  %t6053 = getelementptr i64, ptr %t6050, i64 1
  store i64 %t5985, ptr %t6053
  %t6054 = getelementptr i64, ptr %t6050, i64 2
  store i64 %t5979, ptr %t6054
  %t6055 = getelementptr i64, ptr %t6050, i64 3
  store i64 %a0, ptr %t6055
  %t6056 = getelementptr i64, ptr %t6050, i64 4
  store i64 %a1, ptr %t6056
  %t6057 = getelementptr i64, ptr %t6050, i64 5
  store i64 %a2, ptr %t6057
  %t6058 = getelementptr i64, ptr %t6050, i64 6
  store i64 %t6052, ptr %t6058
  %t6059 = musttail call fastcc i64 @"scheme.base:code_996"(i64 %t6052, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6059
}

define fastcc i64 @"scheme.base:code_1011"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6064 = icmp eq i64 %argc, 1
  br i1 %t6064, label %argok1271, label %arityerr1270
arityerr1270:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1271:
  %t6065 = and i64 %self, -8
  %t6066 = inttoptr i64 %t6065 to ptr
  %t6067 = getelementptr i64, ptr %t6066, i64 1
  %t6068 = load i64, ptr %t6067
  %t6069 = or i64 %a0, %t6068
  %t6070 = and i64 %t6069, 7
  %t6071 = icmp eq i64 %t6070, 0
  br i1 %t6071, label %fixfast1272, label %fixslow1273
fixfast1272:
  %t6072 = icmp eq i64 %a0, %t6068
  %t6073 = select i1 %t6072, i64 257, i64 1
  br label %fixmerge1274
fixslow1273:
  %t6074 = call i64 @rt_num_eq(i64 %a0, i64 %t6068)
  br label %fixmerge1274
fixmerge1274:
  %t6075 = phi i64 [ %t6073, %fixfast1272 ], [ %t6074, %fixslow1273 ]
  %t6076 = icmp ne i64 %t6075, 1
  br i1 %t6076, label %then1275, label %else1276
then1275:
  %t6077 = and i64 %self, -8
  %t6078 = inttoptr i64 %t6077 to ptr
  %t6079 = getelementptr i64, ptr %t6078, i64 2
  %t6080 = load i64, ptr %t6079
  ret i64 %t6080
else1276:
  %t6081 = and i64 %self, -8
  %t6082 = inttoptr i64 %t6081 to ptr
  %t6083 = getelementptr i64, ptr %t6082, i64 2
  %t6084 = load i64, ptr %t6083
  %t6085 = and i64 %self, -8
  %t6086 = inttoptr i64 %t6085 to ptr
  %t6087 = getelementptr i64, ptr %t6086, i64 3
  %t6088 = load i64, ptr %t6087
  %t6089 = or i64 %a0, %t6088
  %t6090 = and i64 %t6089, 7
  %t6091 = icmp eq i64 %t6090, 0
  br i1 %t6091, label %fixfast1277, label %fixslow1278
fixfast1277:
  %t6092 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t6088)
  %t6093 = extractvalue {i64, i1} %t6092, 0
  %t6094 = extractvalue {i64, i1} %t6092, 1
  br i1 %t6094, label %fixslow1278, label %fixmerge1279
fixslow1278:
  %t6095 = call i64 @rt_sub(i64 %a0, i64 %t6088)
  br label %fixmerge1279
fixmerge1279:
  %t6096 = phi i64 [ %t6093, %fixfast1277 ], [ %t6095, %fixslow1278 ]
  %t6097 = and i64 %self, -8
  %t6098 = inttoptr i64 %t6097 to ptr
  %t6099 = getelementptr i64, ptr %t6098, i64 4
  %t6100 = load i64, ptr %t6099
  %t6101 = call i64 @rt_bytevector_u8_ref(i64 %t6100, i64 %a0)
  %t6102 = call i64 @rt_bytevector_u8_set(i64 %t6084, i64 %t6096, i64 %t6101)
  %t6103 = or i64 %a0, 8
  %t6104 = and i64 %t6103, 7
  %t6105 = icmp eq i64 %t6104, 0
  br i1 %t6105, label %fixfast1280, label %fixslow1281
fixfast1280:
  %t6106 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t6107 = extractvalue {i64, i1} %t6106, 0
  %t6108 = extractvalue {i64, i1} %t6106, 1
  br i1 %t6108, label %fixslow1281, label %fixmerge1282
fixslow1281:
  %t6109 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1282
fixmerge1282:
  %t6110 = phi i64 [ %t6107, %fixfast1280 ], [ %t6109, %fixslow1281 ]
  %t6111 = musttail call fastcc i64 @"scheme.base:code_1011"(i64 %self, i64 1, i64 %t6110, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6111
}

define fastcc i64 @"scheme.base:code:bytevector-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6112 = icmp sge i64 %argc, 1
  br i1 %t6112, label %argok1284, label %arityerr1283
arityerr1283:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1284:
  %t6113 = call ptr @rt_alloc_words(i64 8)
  %t6114 = getelementptr i64, ptr %t6113, i64 0
  store i64 %a0, ptr %t6114
  %t6115 = getelementptr i64, ptr %t6113, i64 1
  store i64 %a1, ptr %t6115
  %t6116 = getelementptr i64, ptr %t6113, i64 2
  store i64 %a2, ptr %t6116
  %t6117 = getelementptr i64, ptr %t6113, i64 3
  store i64 %a3, ptr %t6117
  %t6118 = getelementptr i64, ptr %t6113, i64 4
  store i64 %a4, ptr %t6118
  %t6119 = getelementptr i64, ptr %t6113, i64 5
  store i64 %a5, ptr %t6119
  %t6120 = getelementptr i64, ptr %t6113, i64 6
  store i64 %a6, ptr %t6120
  %t6121 = getelementptr i64, ptr %t6113, i64 7
  store i64 %a7, ptr %t6121
  %t6122 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t6113, ptr %overflow)
  %t6123 = call i64 @rt_bytevector_length(i64 %a0)
  %t6124 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t6124)
  %t6125 = and i64 %t6124, -8
  %t6126 = inttoptr i64 %t6125 to ptr
  %t6127 = load i64, ptr %t6126
  %t6128 = inttoptr i64 %t6127 to ptr
  %t6129 = call fastcc i64%t6128(i64 %t6124, i64 1, i64 %t6122, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6130 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t6130)
  %t6131 = and i64 %t6130, -8
  %t6132 = inttoptr i64 %t6131 to ptr
  %t6133 = load i64, ptr %t6132
  %t6134 = inttoptr i64 %t6133 to ptr
  %t6135 = call fastcc i64%t6134(i64 %t6130, i64 2, i64 %t6122, i64 %t6123, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6136 = call i64 @rt_intern(ptr @.str.sym.29)
  %t6137 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6137)
  %t6138 = and i64 %t6137, -8
  %t6139 = inttoptr i64 %t6138 to ptr
  %t6140 = load i64, ptr %t6139
  %t6141 = inttoptr i64 %t6140 to ptr
  %t6142 = call fastcc i64%t6141(i64 %t6137, i64 4, i64 %t6136, i64 %t6129, i64 %t6135, i64 %t6123, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6143 = or i64 %t6135, %t6129
  %t6144 = and i64 %t6143, 7
  %t6145 = icmp eq i64 %t6144, 0
  br i1 %t6145, label %fixfast1285, label %fixslow1286
fixfast1285:
  %t6146 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6135, i64 %t6129)
  %t6147 = extractvalue {i64, i1} %t6146, 0
  %t6148 = extractvalue {i64, i1} %t6146, 1
  br i1 %t6148, label %fixslow1286, label %fixmerge1287
fixslow1286:
  %t6149 = call i64 @rt_sub(i64 %t6135, i64 %t6129)
  br label %fixmerge1287
fixmerge1287:
  %t6150 = phi i64 [ %t6147, %fixfast1285 ], [ %t6149, %fixslow1286 ]
  %t6151 = call i64 @rt_make_bytevector(i64 %t6150, i64 0)
  %t6152 = call ptr @rt_alloc_words(i64 6)
  %t6153 = ptrtoint ptr %t6152 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1011" to i64), ptr %t6152
  %t6154 = or i64 %t6153, 4
  %t6155 = getelementptr i64, ptr %t6152, i64 1
  store i64 %t6135, ptr %t6155
  %t6156 = getelementptr i64, ptr %t6152, i64 2
  store i64 %t6151, ptr %t6156
  %t6157 = getelementptr i64, ptr %t6152, i64 3
  store i64 %t6129, ptr %t6157
  %t6158 = getelementptr i64, ptr %t6152, i64 4
  store i64 %a0, ptr %t6158
  %t6159 = getelementptr i64, ptr %t6152, i64 5
  store i64 %t6154, ptr %t6159
  %t6160 = musttail call fastcc i64 @"scheme.base:code_1011"(i64 %t6154, i64 1, i64 %t6129, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6160
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cbytevector-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6161 = call i64 @rt_bytevector_length(i64 %a0)
  %t6162 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t6162)
  %t6163 = and i64 %t6162, -8
  %t6164 = inttoptr i64 %t6163 to ptr
  %t6165 = load i64, ptr %t6164
  %t6166 = inttoptr i64 %t6165 to ptr
  %t6167 = call fastcc i64%t6166(i64 %t6162, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6168 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t6168)
  %t6169 = and i64 %t6168, -8
  %t6170 = inttoptr i64 %t6169 to ptr
  %t6171 = load i64, ptr %t6170
  %t6172 = inttoptr i64 %t6171 to ptr
  %t6173 = call fastcc i64%t6172(i64 %t6168, i64 2, i64 2, i64 %t6161, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6174 = call i64 @rt_intern(ptr @.str.sym.29)
  %t6175 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6175)
  %t6176 = and i64 %t6175, -8
  %t6177 = inttoptr i64 %t6176 to ptr
  %t6178 = load i64, ptr %t6177
  %t6179 = inttoptr i64 %t6178 to ptr
  %t6180 = call fastcc i64%t6179(i64 %t6175, i64 4, i64 %t6174, i64 %t6167, i64 %t6173, i64 %t6161, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6181 = or i64 %t6173, %t6167
  %t6182 = and i64 %t6181, 7
  %t6183 = icmp eq i64 %t6182, 0
  br i1 %t6183, label %fixfast1288, label %fixslow1289
fixfast1288:
  %t6184 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6173, i64 %t6167)
  %t6185 = extractvalue {i64, i1} %t6184, 0
  %t6186 = extractvalue {i64, i1} %t6184, 1
  br i1 %t6186, label %fixslow1289, label %fixmerge1290
fixslow1289:
  %t6187 = call i64 @rt_sub(i64 %t6173, i64 %t6167)
  br label %fixmerge1290
fixmerge1290:
  %t6188 = phi i64 [ %t6185, %fixfast1288 ], [ %t6187, %fixslow1289 ]
  %t6189 = call i64 @rt_make_bytevector(i64 %t6188, i64 0)
  %t6190 = call ptr @rt_alloc_words(i64 6)
  %t6191 = ptrtoint ptr %t6190 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1011" to i64), ptr %t6190
  %t6192 = or i64 %t6191, 4
  %t6193 = getelementptr i64, ptr %t6190, i64 1
  store i64 %t6173, ptr %t6193
  %t6194 = getelementptr i64, ptr %t6190, i64 2
  store i64 %t6189, ptr %t6194
  %t6195 = getelementptr i64, ptr %t6190, i64 3
  store i64 %t6167, ptr %t6195
  %t6196 = getelementptr i64, ptr %t6190, i64 4
  store i64 %a0, ptr %t6196
  %t6197 = getelementptr i64, ptr %t6190, i64 5
  store i64 %t6192, ptr %t6197
  %t6198 = musttail call fastcc i64 @"scheme.base:code_1011"(i64 %t6192, i64 1, i64 %t6167, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6198
}

define fastcc i64 @"scheme.base:code_1037"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6203 = icmp eq i64 %argc, 1
  br i1 %t6203, label %argok1292, label %arityerr1291
arityerr1291:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1292:
  %t6204 = or i64 %a0, 0
  %t6205 = and i64 %t6204, 7
  %t6206 = icmp eq i64 %t6205, 0
  br i1 %t6206, label %fixfast1293, label %fixslow1294
fixfast1293:
  %t6207 = icmp slt i64 %a0, 0
  %t6208 = select i1 %t6207, i64 257, i64 1
  br label %fixmerge1295
fixslow1294:
  %t6209 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge1295
fixmerge1295:
  %t6210 = phi i64 [ %t6208, %fixfast1293 ], [ %t6209, %fixslow1294 ]
  %t6211 = icmp ne i64 %t6210, 1
  br i1 %t6211, label %then1296, label %else1297
then1296:
  %t6212 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t6212)
  %t6213 = and i64 %t6212, -8
  %t6214 = inttoptr i64 %t6213 to ptr
  %t6215 = load i64, ptr %t6214
  %t6216 = inttoptr i64 %t6215 to ptr
  %t6217 = musttail call fastcc i64 %t6216(i64 %t6212, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6217
else1297:
  %t6218 = and i64 %self, -8
  %t6219 = inttoptr i64 %t6218 to ptr
  %t6220 = getelementptr i64, ptr %t6219, i64 1
  %t6221 = load i64, ptr %t6220
  %t6222 = and i64 %self, -8
  %t6223 = inttoptr i64 %t6222 to ptr
  %t6224 = getelementptr i64, ptr %t6223, i64 2
  %t6225 = load i64, ptr %t6224
  %t6226 = or i64 %t6225, %a0
  %t6227 = and i64 %t6226, 7
  %t6228 = icmp eq i64 %t6227, 0
  br i1 %t6228, label %fixfast1298, label %fixslow1299
fixfast1298:
  %t6229 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6225, i64 %a0)
  %t6230 = extractvalue {i64, i1} %t6229, 0
  %t6231 = extractvalue {i64, i1} %t6229, 1
  br i1 %t6231, label %fixslow1299, label %fixmerge1300
fixslow1299:
  %t6232 = call i64 @rt_add(i64 %t6225, i64 %a0)
  br label %fixmerge1300
fixmerge1300:
  %t6233 = phi i64 [ %t6230, %fixfast1298 ], [ %t6232, %fixslow1299 ]
  %t6234 = and i64 %self, -8
  %t6235 = inttoptr i64 %t6234 to ptr
  %t6236 = getelementptr i64, ptr %t6235, i64 3
  %t6237 = load i64, ptr %t6236
  %t6238 = and i64 %self, -8
  %t6239 = inttoptr i64 %t6238 to ptr
  %t6240 = getelementptr i64, ptr %t6239, i64 4
  %t6241 = load i64, ptr %t6240
  %t6242 = or i64 %t6241, %a0
  %t6243 = and i64 %t6242, 7
  %t6244 = icmp eq i64 %t6243, 0
  br i1 %t6244, label %fixfast1301, label %fixslow1302
fixfast1301:
  %t6245 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6241, i64 %a0)
  %t6246 = extractvalue {i64, i1} %t6245, 0
  %t6247 = extractvalue {i64, i1} %t6245, 1
  br i1 %t6247, label %fixslow1302, label %fixmerge1303
fixslow1302:
  %t6248 = call i64 @rt_add(i64 %t6241, i64 %a0)
  br label %fixmerge1303
fixmerge1303:
  %t6249 = phi i64 [ %t6246, %fixfast1301 ], [ %t6248, %fixslow1302 ]
  %t6250 = call i64 @rt_bytevector_u8_ref(i64 %t6237, i64 %t6249)
  %t6251 = call i64 @rt_bytevector_u8_set(i64 %t6221, i64 %t6233, i64 %t6250)
  %t6252 = or i64 %a0, 8
  %t6253 = and i64 %t6252, 7
  %t6254 = icmp eq i64 %t6253, 0
  br i1 %t6254, label %fixfast1304, label %fixslow1305
fixfast1304:
  %t6255 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t6256 = extractvalue {i64, i1} %t6255, 0
  %t6257 = extractvalue {i64, i1} %t6255, 1
  br i1 %t6257, label %fixslow1305, label %fixmerge1306
fixslow1305:
  %t6258 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge1306
fixmerge1306:
  %t6259 = phi i64 [ %t6256, %fixfast1304 ], [ %t6258, %fixslow1305 ]
  %t6260 = musttail call fastcc i64 @"scheme.base:code_1037"(i64 %self, i64 1, i64 %t6259, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6260
}

define fastcc i64 @"scheme.base:code_1039"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6261 = icmp eq i64 %argc, 1
  br i1 %t6261, label %argok1308, label %arityerr1307
arityerr1307:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1308:
  %t6262 = and i64 %self, -8
  %t6263 = inttoptr i64 %t6262 to ptr
  %t6264 = getelementptr i64, ptr %t6263, i64 1
  %t6265 = load i64, ptr %t6264
  %t6266 = and i64 %self, -8
  %t6267 = inttoptr i64 %t6266 to ptr
  %t6268 = getelementptr i64, ptr %t6267, i64 2
  %t6269 = load i64, ptr %t6268
  %t6270 = or i64 %t6265, %t6269
  %t6271 = and i64 %t6270, 7
  %t6272 = icmp eq i64 %t6271, 0
  br i1 %t6272, label %fixfast1309, label %fixslow1310
fixfast1309:
  %t6273 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6265, i64 %t6269)
  %t6274 = extractvalue {i64, i1} %t6273, 0
  %t6275 = extractvalue {i64, i1} %t6273, 1
  br i1 %t6275, label %fixslow1310, label %fixmerge1311
fixslow1310:
  %t6276 = call i64 @rt_sub(i64 %t6265, i64 %t6269)
  br label %fixmerge1311
fixmerge1311:
  %t6277 = phi i64 [ %t6274, %fixfast1309 ], [ %t6276, %fixslow1310 ]
  %t6278 = or i64 %a0, %t6277
  %t6279 = and i64 %t6278, 7
  %t6280 = icmp eq i64 %t6279, 0
  br i1 %t6280, label %fixfast1312, label %fixslow1313
fixfast1312:
  %t6281 = icmp eq i64 %a0, %t6277
  %t6282 = select i1 %t6281, i64 257, i64 1
  br label %fixmerge1314
fixslow1313:
  %t6283 = call i64 @rt_num_eq(i64 %a0, i64 %t6277)
  br label %fixmerge1314
fixmerge1314:
  %t6284 = phi i64 [ %t6282, %fixfast1312 ], [ %t6283, %fixslow1313 ]
  %t6285 = icmp ne i64 %t6284, 1
  br i1 %t6285, label %then1315, label %else1316
then1315:
  %t6286 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t6286)
  %t6287 = and i64 %t6286, -8
  %t6288 = inttoptr i64 %t6287 to ptr
  %t6289 = load i64, ptr %t6288
  %t6290 = inttoptr i64 %t6289 to ptr
  %t6291 = musttail call fastcc i64 %t6290(i64 %t6286, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6291
else1316:
  %t6292 = and i64 %self, -8
  %t6293 = inttoptr i64 %t6292 to ptr
  %t6294 = getelementptr i64, ptr %t6293, i64 3
  %t6295 = load i64, ptr %t6294
  %t6296 = and i64 %self, -8
  %t6297 = inttoptr i64 %t6296 to ptr
  %t6298 = getelementptr i64, ptr %t6297, i64 4
  %t6299 = load i64, ptr %t6298
  %t6300 = or i64 %t6299, %a0
  %t6301 = and i64 %t6300, 7
  %t6302 = icmp eq i64 %t6301, 0
  br i1 %t6302, label %fixfast1317, label %fixslow1318
fixfast1317:
  %t6303 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6299, i64 %a0)
  %t6304 = extractvalue {i64, i1} %t6303, 0
  %t6305 = extractvalue {i64, i1} %t6303, 1
  br i1 %t6305, label %fixslow1318, label %fixmerge1319
fixslow1318:
  %t6306 = call i64 @rt_add(i64 %t6299, i64 %a0)
  br label %fixmerge1319
fixmerge1319:
  %t6307 = phi i64 [ %t6304, %fixfast1317 ], [ %t6306, %fixslow1318 ]
  %t6308 = and i64 %self, -8
  %t6309 = inttoptr i64 %t6308 to ptr
  %t6310 = getelementptr i64, ptr %t6309, i64 5
  %t6311 = load i64, ptr %t6310
  %t6312 = and i64 %self, -8
  %t6313 = inttoptr i64 %t6312 to ptr
  %t6314 = getelementptr i64, ptr %t6313, i64 2
  %t6315 = load i64, ptr %t6314
  %t6316 = or i64 %t6315, %a0
  %t6317 = and i64 %t6316, 7
  %t6318 = icmp eq i64 %t6317, 0
  br i1 %t6318, label %fixfast1320, label %fixslow1321
fixfast1320:
  %t6319 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6315, i64 %a0)
  %t6320 = extractvalue {i64, i1} %t6319, 0
  %t6321 = extractvalue {i64, i1} %t6319, 1
  br i1 %t6321, label %fixslow1321, label %fixmerge1322
fixslow1321:
  %t6322 = call i64 @rt_add(i64 %t6315, i64 %a0)
  br label %fixmerge1322
fixmerge1322:
  %t6323 = phi i64 [ %t6320, %fixfast1320 ], [ %t6322, %fixslow1321 ]
  %t6324 = call i64 @rt_bytevector_u8_ref(i64 %t6311, i64 %t6323)
  %t6325 = call i64 @rt_bytevector_u8_set(i64 %t6295, i64 %t6307, i64 %t6324)
  %t6326 = or i64 %a0, 8
  %t6327 = and i64 %t6326, 7
  %t6328 = icmp eq i64 %t6327, 0
  br i1 %t6328, label %fixfast1323, label %fixslow1324
fixfast1323:
  %t6329 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t6330 = extractvalue {i64, i1} %t6329, 0
  %t6331 = extractvalue {i64, i1} %t6329, 1
  br i1 %t6331, label %fixslow1324, label %fixmerge1325
fixslow1324:
  %t6332 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1325
fixmerge1325:
  %t6333 = phi i64 [ %t6330, %fixfast1323 ], [ %t6332, %fixslow1324 ]
  %t6334 = musttail call fastcc i64 @"scheme.base:code_1039"(i64 %self, i64 1, i64 %t6333, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6334
}

define fastcc i64 @"scheme.base:code:bytevector-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6335 = icmp sge i64 %argc, 3
  br i1 %t6335, label %argok1327, label %arityerr1326
arityerr1326:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1327:
  %t6336 = call ptr @rt_alloc_words(i64 8)
  %t6337 = getelementptr i64, ptr %t6336, i64 0
  store i64 %a0, ptr %t6337
  %t6338 = getelementptr i64, ptr %t6336, i64 1
  store i64 %a1, ptr %t6338
  %t6339 = getelementptr i64, ptr %t6336, i64 2
  store i64 %a2, ptr %t6339
  %t6340 = getelementptr i64, ptr %t6336, i64 3
  store i64 %a3, ptr %t6340
  %t6341 = getelementptr i64, ptr %t6336, i64 4
  store i64 %a4, ptr %t6341
  %t6342 = getelementptr i64, ptr %t6336, i64 5
  store i64 %a5, ptr %t6342
  %t6343 = getelementptr i64, ptr %t6336, i64 6
  store i64 %a6, ptr %t6343
  %t6344 = getelementptr i64, ptr %t6336, i64 7
  store i64 %a7, ptr %t6344
  %t6345 = call i64 @rt_build_rest(i64 %argc, i64 3, i64 8, ptr %t6336, ptr %overflow)
  %t6346 = call i64 @rt_bytevector_length(i64 %a2)
  %t6347 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t6347)
  %t6348 = and i64 %t6347, -8
  %t6349 = inttoptr i64 %t6348 to ptr
  %t6350 = load i64, ptr %t6349
  %t6351 = inttoptr i64 %t6350 to ptr
  %t6352 = call fastcc i64%t6351(i64 %t6347, i64 1, i64 %t6345, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6353 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t6353)
  %t6354 = and i64 %t6353, -8
  %t6355 = inttoptr i64 %t6354 to ptr
  %t6356 = load i64, ptr %t6355
  %t6357 = inttoptr i64 %t6356 to ptr
  %t6358 = call fastcc i64%t6357(i64 %t6353, i64 2, i64 %t6345, i64 %t6346, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6359 = call i64 @rt_intern(ptr @.str.sym.30)
  %t6360 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6360)
  %t6361 = and i64 %t6360, -8
  %t6362 = inttoptr i64 %t6361 to ptr
  %t6363 = load i64, ptr %t6362
  %t6364 = inttoptr i64 %t6363 to ptr
  %t6365 = call fastcc i64%t6364(i64 %t6360, i64 4, i64 %t6359, i64 %t6352, i64 %t6358, i64 %t6346, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6366 = call i64 @rt_intern(ptr @.str.sym.30)
  %t6367 = or i64 %t6358, %t6352
  %t6368 = and i64 %t6367, 7
  %t6369 = icmp eq i64 %t6368, 0
  br i1 %t6369, label %fixfast1328, label %fixslow1329
fixfast1328:
  %t6370 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6358, i64 %t6352)
  %t6371 = extractvalue {i64, i1} %t6370, 0
  %t6372 = extractvalue {i64, i1} %t6370, 1
  br i1 %t6372, label %fixslow1329, label %fixmerge1330
fixslow1329:
  %t6373 = call i64 @rt_sub(i64 %t6358, i64 %t6352)
  br label %fixmerge1330
fixmerge1330:
  %t6374 = phi i64 [ %t6371, %fixfast1328 ], [ %t6373, %fixslow1329 ]
  %t6375 = or i64 %a1, %t6374
  %t6376 = and i64 %t6375, 7
  %t6377 = icmp eq i64 %t6376, 0
  br i1 %t6377, label %fixfast1331, label %fixslow1332
fixfast1331:
  %t6378 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t6374)
  %t6379 = extractvalue {i64, i1} %t6378, 0
  %t6380 = extractvalue {i64, i1} %t6378, 1
  br i1 %t6380, label %fixslow1332, label %fixmerge1333
fixslow1332:
  %t6381 = call i64 @rt_add(i64 %a1, i64 %t6374)
  br label %fixmerge1333
fixmerge1333:
  %t6382 = phi i64 [ %t6379, %fixfast1331 ], [ %t6381, %fixslow1332 ]
  %t6383 = call i64 @rt_bytevector_length(i64 %a0)
  %t6384 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6384)
  %t6385 = and i64 %t6384, -8
  %t6386 = inttoptr i64 %t6385 to ptr
  %t6387 = load i64, ptr %t6386
  %t6388 = inttoptr i64 %t6387 to ptr
  %t6389 = call fastcc i64%t6388(i64 %t6384, i64 4, i64 %t6366, i64 %a1, i64 %t6382, i64 %t6383, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6390 = or i64 %t6352, %a1
  %t6391 = and i64 %t6390, 7
  %t6392 = icmp eq i64 %t6391, 0
  br i1 %t6392, label %fixfast1334, label %fixslow1335
fixfast1334:
  %t6393 = icmp slt i64 %t6352, %a1
  %t6394 = select i1 %t6393, i64 257, i64 1
  br label %fixmerge1336
fixslow1335:
  %t6395 = call i64 @rt_lt(i64 %t6352, i64 %a1)
  br label %fixmerge1336
fixmerge1336:
  %t6396 = phi i64 [ %t6394, %fixfast1334 ], [ %t6395, %fixslow1335 ]
  %t6397 = icmp ne i64 %t6396, 1
  br i1 %t6397, label %then1337, label %else1338
then1337:
  %t6398 = call ptr @rt_alloc_words(i64 6)
  %t6399 = ptrtoint ptr %t6398 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1037" to i64), ptr %t6398
  %t6400 = or i64 %t6399, 4
  %t6401 = getelementptr i64, ptr %t6398, i64 1
  store i64 %a0, ptr %t6401
  %t6402 = getelementptr i64, ptr %t6398, i64 2
  store i64 %a1, ptr %t6402
  %t6403 = getelementptr i64, ptr %t6398, i64 3
  store i64 %a2, ptr %t6403
  %t6404 = getelementptr i64, ptr %t6398, i64 4
  store i64 %t6352, ptr %t6404
  %t6405 = getelementptr i64, ptr %t6398, i64 5
  store i64 %t6400, ptr %t6405
  %t6406 = or i64 %t6358, %t6352
  %t6407 = and i64 %t6406, 7
  %t6408 = icmp eq i64 %t6407, 0
  br i1 %t6408, label %fixfast1339, label %fixslow1340
fixfast1339:
  %t6409 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6358, i64 %t6352)
  %t6410 = extractvalue {i64, i1} %t6409, 0
  %t6411 = extractvalue {i64, i1} %t6409, 1
  br i1 %t6411, label %fixslow1340, label %fixmerge1341
fixslow1340:
  %t6412 = call i64 @rt_sub(i64 %t6358, i64 %t6352)
  br label %fixmerge1341
fixmerge1341:
  %t6413 = phi i64 [ %t6410, %fixfast1339 ], [ %t6412, %fixslow1340 ]
  %t6414 = or i64 %t6413, 8
  %t6415 = and i64 %t6414, 7
  %t6416 = icmp eq i64 %t6415, 0
  br i1 %t6416, label %fixfast1342, label %fixslow1343
fixfast1342:
  %t6417 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6413, i64 8)
  %t6418 = extractvalue {i64, i1} %t6417, 0
  %t6419 = extractvalue {i64, i1} %t6417, 1
  br i1 %t6419, label %fixslow1343, label %fixmerge1344
fixslow1343:
  %t6420 = call i64 @rt_sub(i64 %t6413, i64 8)
  br label %fixmerge1344
fixmerge1344:
  %t6421 = phi i64 [ %t6418, %fixfast1342 ], [ %t6420, %fixslow1343 ]
  %t6422 = musttail call fastcc i64 @"scheme.base:code_1037"(i64 %t6400, i64 1, i64 %t6421, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6422
else1338:
  %t6423 = call ptr @rt_alloc_words(i64 7)
  %t6424 = ptrtoint ptr %t6423 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1039" to i64), ptr %t6423
  %t6425 = or i64 %t6424, 4
  %t6426 = getelementptr i64, ptr %t6423, i64 1
  store i64 %t6358, ptr %t6426
  %t6427 = getelementptr i64, ptr %t6423, i64 2
  store i64 %t6352, ptr %t6427
  %t6428 = getelementptr i64, ptr %t6423, i64 3
  store i64 %a0, ptr %t6428
  %t6429 = getelementptr i64, ptr %t6423, i64 4
  store i64 %a1, ptr %t6429
  %t6430 = getelementptr i64, ptr %t6423, i64 5
  store i64 %a2, ptr %t6430
  %t6431 = getelementptr i64, ptr %t6423, i64 6
  store i64 %t6425, ptr %t6431
  %t6432 = musttail call fastcc i64 @"scheme.base:code_1039"(i64 %t6425, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6432
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cbytevector-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6433 = call i64 @rt_bytevector_length(i64 %a2)
  %t6434 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t6434)
  %t6435 = and i64 %t6434, -8
  %t6436 = inttoptr i64 %t6435 to ptr
  %t6437 = load i64, ptr %t6436
  %t6438 = inttoptr i64 %t6437 to ptr
  %t6439 = call fastcc i64%t6438(i64 %t6434, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6440 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t6440)
  %t6441 = and i64 %t6440, -8
  %t6442 = inttoptr i64 %t6441 to ptr
  %t6443 = load i64, ptr %t6442
  %t6444 = inttoptr i64 %t6443 to ptr
  %t6445 = call fastcc i64%t6444(i64 %t6440, i64 2, i64 2, i64 %t6433, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6446 = call i64 @rt_intern(ptr @.str.sym.30)
  %t6447 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6447)
  %t6448 = and i64 %t6447, -8
  %t6449 = inttoptr i64 %t6448 to ptr
  %t6450 = load i64, ptr %t6449
  %t6451 = inttoptr i64 %t6450 to ptr
  %t6452 = call fastcc i64%t6451(i64 %t6447, i64 4, i64 %t6446, i64 %t6439, i64 %t6445, i64 %t6433, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6453 = call i64 @rt_intern(ptr @.str.sym.30)
  %t6454 = or i64 %t6445, %t6439
  %t6455 = and i64 %t6454, 7
  %t6456 = icmp eq i64 %t6455, 0
  br i1 %t6456, label %fixfast1345, label %fixslow1346
fixfast1345:
  %t6457 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6445, i64 %t6439)
  %t6458 = extractvalue {i64, i1} %t6457, 0
  %t6459 = extractvalue {i64, i1} %t6457, 1
  br i1 %t6459, label %fixslow1346, label %fixmerge1347
fixslow1346:
  %t6460 = call i64 @rt_sub(i64 %t6445, i64 %t6439)
  br label %fixmerge1347
fixmerge1347:
  %t6461 = phi i64 [ %t6458, %fixfast1345 ], [ %t6460, %fixslow1346 ]
  %t6462 = or i64 %a1, %t6461
  %t6463 = and i64 %t6462, 7
  %t6464 = icmp eq i64 %t6463, 0
  br i1 %t6464, label %fixfast1348, label %fixslow1349
fixfast1348:
  %t6465 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t6461)
  %t6466 = extractvalue {i64, i1} %t6465, 0
  %t6467 = extractvalue {i64, i1} %t6465, 1
  br i1 %t6467, label %fixslow1349, label %fixmerge1350
fixslow1349:
  %t6468 = call i64 @rt_add(i64 %a1, i64 %t6461)
  br label %fixmerge1350
fixmerge1350:
  %t6469 = phi i64 [ %t6466, %fixfast1348 ], [ %t6468, %fixslow1349 ]
  %t6470 = call i64 @rt_bytevector_length(i64 %a0)
  %t6471 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6471)
  %t6472 = and i64 %t6471, -8
  %t6473 = inttoptr i64 %t6472 to ptr
  %t6474 = load i64, ptr %t6473
  %t6475 = inttoptr i64 %t6474 to ptr
  %t6476 = call fastcc i64%t6475(i64 %t6471, i64 4, i64 %t6453, i64 %a1, i64 %t6469, i64 %t6470, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6477 = or i64 %t6439, %a1
  %t6478 = and i64 %t6477, 7
  %t6479 = icmp eq i64 %t6478, 0
  br i1 %t6479, label %fixfast1351, label %fixslow1352
fixfast1351:
  %t6480 = icmp slt i64 %t6439, %a1
  %t6481 = select i1 %t6480, i64 257, i64 1
  br label %fixmerge1353
fixslow1352:
  %t6482 = call i64 @rt_lt(i64 %t6439, i64 %a1)
  br label %fixmerge1353
fixmerge1353:
  %t6483 = phi i64 [ %t6481, %fixfast1351 ], [ %t6482, %fixslow1352 ]
  %t6484 = icmp ne i64 %t6483, 1
  br i1 %t6484, label %then1354, label %else1355
then1354:
  %t6485 = call ptr @rt_alloc_words(i64 6)
  %t6486 = ptrtoint ptr %t6485 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1037" to i64), ptr %t6485
  %t6487 = or i64 %t6486, 4
  %t6488 = getelementptr i64, ptr %t6485, i64 1
  store i64 %a0, ptr %t6488
  %t6489 = getelementptr i64, ptr %t6485, i64 2
  store i64 %a1, ptr %t6489
  %t6490 = getelementptr i64, ptr %t6485, i64 3
  store i64 %a2, ptr %t6490
  %t6491 = getelementptr i64, ptr %t6485, i64 4
  store i64 %t6439, ptr %t6491
  %t6492 = getelementptr i64, ptr %t6485, i64 5
  store i64 %t6487, ptr %t6492
  %t6493 = or i64 %t6445, %t6439
  %t6494 = and i64 %t6493, 7
  %t6495 = icmp eq i64 %t6494, 0
  br i1 %t6495, label %fixfast1356, label %fixslow1357
fixfast1356:
  %t6496 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6445, i64 %t6439)
  %t6497 = extractvalue {i64, i1} %t6496, 0
  %t6498 = extractvalue {i64, i1} %t6496, 1
  br i1 %t6498, label %fixslow1357, label %fixmerge1358
fixslow1357:
  %t6499 = call i64 @rt_sub(i64 %t6445, i64 %t6439)
  br label %fixmerge1358
fixmerge1358:
  %t6500 = phi i64 [ %t6497, %fixfast1356 ], [ %t6499, %fixslow1357 ]
  %t6501 = or i64 %t6500, 8
  %t6502 = and i64 %t6501, 7
  %t6503 = icmp eq i64 %t6502, 0
  br i1 %t6503, label %fixfast1359, label %fixslow1360
fixfast1359:
  %t6504 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6500, i64 8)
  %t6505 = extractvalue {i64, i1} %t6504, 0
  %t6506 = extractvalue {i64, i1} %t6504, 1
  br i1 %t6506, label %fixslow1360, label %fixmerge1361
fixslow1360:
  %t6507 = call i64 @rt_sub(i64 %t6500, i64 8)
  br label %fixmerge1361
fixmerge1361:
  %t6508 = phi i64 [ %t6505, %fixfast1359 ], [ %t6507, %fixslow1360 ]
  %t6509 = musttail call fastcc i64 @"scheme.base:code_1037"(i64 %t6487, i64 1, i64 %t6508, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6509
else1355:
  %t6510 = call ptr @rt_alloc_words(i64 7)
  %t6511 = ptrtoint ptr %t6510 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1039" to i64), ptr %t6510
  %t6512 = or i64 %t6511, 4
  %t6513 = getelementptr i64, ptr %t6510, i64 1
  store i64 %t6445, ptr %t6513
  %t6514 = getelementptr i64, ptr %t6510, i64 2
  store i64 %t6439, ptr %t6514
  %t6515 = getelementptr i64, ptr %t6510, i64 3
  store i64 %a0, ptr %t6515
  %t6516 = getelementptr i64, ptr %t6510, i64 4
  store i64 %a1, ptr %t6516
  %t6517 = getelementptr i64, ptr %t6510, i64 5
  store i64 %a2, ptr %t6517
  %t6518 = getelementptr i64, ptr %t6510, i64 6
  store i64 %t6512, ptr %t6518
  %t6519 = musttail call fastcc i64 @"scheme.base:code_1039"(i64 %t6512, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6519
}

define fastcc i64 @"scheme.base:code_1057"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6524 = icmp eq i64 %argc, 1
  br i1 %t6524, label %argok1363, label %arityerr1362
arityerr1362:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1363:
  %t6525 = and i64 %self, -8
  %t6526 = inttoptr i64 %t6525 to ptr
  %t6527 = getelementptr i64, ptr %t6526, i64 1
  %t6528 = load i64, ptr %t6527
  %t6529 = or i64 %a0, %t6528
  %t6530 = and i64 %t6529, 7
  %t6531 = icmp eq i64 %t6530, 0
  br i1 %t6531, label %fixfast1364, label %fixslow1365
fixfast1364:
  %t6532 = icmp eq i64 %a0, %t6528
  %t6533 = select i1 %t6532, i64 257, i64 1
  br label %fixmerge1366
fixslow1365:
  %t6534 = call i64 @rt_num_eq(i64 %a0, i64 %t6528)
  br label %fixmerge1366
fixmerge1366:
  %t6535 = phi i64 [ %t6533, %fixfast1364 ], [ %t6534, %fixslow1365 ]
  %t6536 = icmp ne i64 %t6535, 1
  br i1 %t6536, label %then1367, label %else1368
then1367:
  %t6537 = and i64 %self, -8
  %t6538 = inttoptr i64 %t6537 to ptr
  %t6539 = getelementptr i64, ptr %t6538, i64 3
  %t6540 = load i64, ptr %t6539
  %t6541 = call i64 @rt_cdr(i64 %t6540)
  %t6542 = and i64 %self, -8
  %t6543 = inttoptr i64 %t6542 to ptr
  %t6544 = getelementptr i64, ptr %t6543, i64 4
  %t6545 = load i64, ptr %t6544
  %t6546 = and i64 %self, -8
  %t6547 = inttoptr i64 %t6546 to ptr
  %t6548 = getelementptr i64, ptr %t6547, i64 1
  %t6549 = load i64, ptr %t6548
  %t6550 = or i64 %t6545, %t6549
  %t6551 = and i64 %t6550, 7
  %t6552 = icmp eq i64 %t6551, 0
  br i1 %t6552, label %fixfast1369, label %fixslow1370
fixfast1369:
  %t6553 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6545, i64 %t6549)
  %t6554 = extractvalue {i64, i1} %t6553, 0
  %t6555 = extractvalue {i64, i1} %t6553, 1
  br i1 %t6555, label %fixslow1370, label %fixmerge1371
fixslow1370:
  %t6556 = call i64 @rt_add(i64 %t6545, i64 %t6549)
  br label %fixmerge1371
fixmerge1371:
  %t6557 = phi i64 [ %t6554, %fixfast1369 ], [ %t6556, %fixslow1370 ]
  %t6558 = and i64 %self, -8
  %t6559 = inttoptr i64 %t6558 to ptr
  %t6560 = getelementptr i64, ptr %t6559, i64 2
  %t6561 = load i64, ptr %t6560
  %t6562 = musttail call fastcc i64 @"scheme.base:code_1055"(i64 %t6561, i64 2, i64 %t6541, i64 %t6557, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6562
else1368:
  %t6563 = and i64 %self, -8
  %t6564 = inttoptr i64 %t6563 to ptr
  %t6565 = getelementptr i64, ptr %t6564, i64 5
  %t6566 = load i64, ptr %t6565
  %t6567 = and i64 %self, -8
  %t6568 = inttoptr i64 %t6567 to ptr
  %t6569 = getelementptr i64, ptr %t6568, i64 4
  %t6570 = load i64, ptr %t6569
  %t6571 = or i64 %t6570, %a0
  %t6572 = and i64 %t6571, 7
  %t6573 = icmp eq i64 %t6572, 0
  br i1 %t6573, label %fixfast1372, label %fixslow1373
fixfast1372:
  %t6574 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6570, i64 %a0)
  %t6575 = extractvalue {i64, i1} %t6574, 0
  %t6576 = extractvalue {i64, i1} %t6574, 1
  br i1 %t6576, label %fixslow1373, label %fixmerge1374
fixslow1373:
  %t6577 = call i64 @rt_add(i64 %t6570, i64 %a0)
  br label %fixmerge1374
fixmerge1374:
  %t6578 = phi i64 [ %t6575, %fixfast1372 ], [ %t6577, %fixslow1373 ]
  %t6579 = and i64 %self, -8
  %t6580 = inttoptr i64 %t6579 to ptr
  %t6581 = getelementptr i64, ptr %t6580, i64 6
  %t6582 = load i64, ptr %t6581
  %t6583 = call i64 @rt_bytevector_u8_ref(i64 %t6582, i64 %a0)
  %t6584 = call i64 @rt_bytevector_u8_set(i64 %t6566, i64 %t6578, i64 %t6583)
  %t6585 = or i64 %a0, 8
  %t6586 = and i64 %t6585, 7
  %t6587 = icmp eq i64 %t6586, 0
  br i1 %t6587, label %fixfast1375, label %fixslow1376
fixfast1375:
  %t6588 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t6589 = extractvalue {i64, i1} %t6588, 0
  %t6590 = extractvalue {i64, i1} %t6588, 1
  br i1 %t6590, label %fixslow1376, label %fixmerge1377
fixslow1376:
  %t6591 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1377
fixmerge1377:
  %t6592 = phi i64 [ %t6589, %fixfast1375 ], [ %t6591, %fixslow1376 ]
  %t6593 = musttail call fastcc i64 @"scheme.base:code_1057"(i64 %self, i64 1, i64 %t6592, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6593
}

define fastcc i64 @"scheme.base:code_1055"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6594 = icmp eq i64 %argc, 2
  br i1 %t6594, label %argok1379, label %arityerr1378
arityerr1378:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1379:
  %t6595 = call i64 @rt_null_p(i64 %a0)
  %t6596 = icmp ne i64 %t6595, 1
  br i1 %t6596, label %then1380, label %else1381
then1380:
  %t6597 = and i64 %self, -8
  %t6598 = inttoptr i64 %t6597 to ptr
  %t6599 = getelementptr i64, ptr %t6598, i64 1
  %t6600 = load i64, ptr %t6599
  ret i64 %t6600
else1381:
  %t6601 = call i64 @rt_car(i64 %a0)
  %t6602 = call i64 @rt_bytevector_length(i64 %t6601)
  %t6603 = call ptr @rt_alloc_words(i64 8)
  %t6604 = ptrtoint ptr %t6603 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1057" to i64), ptr %t6603
  %t6605 = or i64 %t6604, 4
  %t6606 = getelementptr i64, ptr %t6603, i64 1
  store i64 %t6602, ptr %t6606
  %t6607 = and i64 %self, -8
  %t6608 = inttoptr i64 %t6607 to ptr
  %t6609 = getelementptr i64, ptr %t6608, i64 2
  %t6610 = load i64, ptr %t6609
  %t6611 = getelementptr i64, ptr %t6603, i64 2
  store i64 %t6610, ptr %t6611
  %t6612 = getelementptr i64, ptr %t6603, i64 3
  store i64 %a0, ptr %t6612
  %t6613 = getelementptr i64, ptr %t6603, i64 4
  store i64 %a1, ptr %t6613
  %t6614 = and i64 %self, -8
  %t6615 = inttoptr i64 %t6614 to ptr
  %t6616 = getelementptr i64, ptr %t6615, i64 1
  %t6617 = load i64, ptr %t6616
  %t6618 = getelementptr i64, ptr %t6603, i64 5
  store i64 %t6617, ptr %t6618
  %t6619 = getelementptr i64, ptr %t6603, i64 6
  store i64 %t6601, ptr %t6619
  %t6620 = getelementptr i64, ptr %t6603, i64 7
  store i64 %t6605, ptr %t6620
  %t6621 = musttail call fastcc i64 @"scheme.base:code_1057"(i64 %t6605, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6621
}

define fastcc i64 @"scheme.base:code:bytevector-append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6622 = icmp sge i64 %argc, 0
  br i1 %t6622, label %argok1383, label %arityerr1382
arityerr1382:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1383:
  %t6623 = call ptr @rt_alloc_words(i64 8)
  %t6624 = getelementptr i64, ptr %t6623, i64 0
  store i64 %a0, ptr %t6624
  %t6625 = getelementptr i64, ptr %t6623, i64 1
  store i64 %a1, ptr %t6625
  %t6626 = getelementptr i64, ptr %t6623, i64 2
  store i64 %a2, ptr %t6626
  %t6627 = getelementptr i64, ptr %t6623, i64 3
  store i64 %a3, ptr %t6627
  %t6628 = getelementptr i64, ptr %t6623, i64 4
  store i64 %a4, ptr %t6628
  %t6629 = getelementptr i64, ptr %t6623, i64 5
  store i64 %a5, ptr %t6629
  %t6630 = getelementptr i64, ptr %t6623, i64 6
  store i64 %a6, ptr %t6630
  %t6631 = getelementptr i64, ptr %t6623, i64 7
  store i64 %a7, ptr %t6631
  %t6632 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t6623, ptr %overflow)
  %t6633 = load i64, ptr @"scheme.base:bv-total"
  call void @rt_check_callable(i64 %t6633)
  %t6634 = and i64 %t6633, -8
  %t6635 = inttoptr i64 %t6634 to ptr
  %t6636 = load i64, ptr %t6635
  %t6637 = inttoptr i64 %t6636 to ptr
  %t6638 = call fastcc i64%t6637(i64 %t6633, i64 1, i64 %t6632, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6639 = call i64 @rt_make_bytevector(i64 %t6638, i64 0)
  %t6640 = call ptr @rt_alloc_words(i64 3)
  %t6641 = ptrtoint ptr %t6640 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1055" to i64), ptr %t6640
  %t6642 = or i64 %t6641, 4
  %t6643 = getelementptr i64, ptr %t6640, i64 1
  store i64 %t6639, ptr %t6643
  %t6644 = getelementptr i64, ptr %t6640, i64 2
  store i64 %t6642, ptr %t6644
  %t6645 = musttail call fastcc i64 @"scheme.base:code_1055"(i64 %t6642, i64 2, i64 %t6632, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6645
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cbytevector-append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6646 = load i64, ptr @"scheme.base:bv-total"
  call void @rt_check_callable(i64 %t6646)
  %t6647 = and i64 %t6646, -8
  %t6648 = inttoptr i64 %t6647 to ptr
  %t6649 = load i64, ptr %t6648
  %t6650 = inttoptr i64 %t6649 to ptr
  %t6651 = call fastcc i64%t6650(i64 %t6646, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6652 = call i64 @rt_make_bytevector(i64 %t6651, i64 0)
  %t6653 = call ptr @rt_alloc_words(i64 3)
  %t6654 = ptrtoint ptr %t6653 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1055" to i64), ptr %t6653
  %t6655 = or i64 %t6654, 4
  %t6656 = getelementptr i64, ptr %t6653, i64 1
  store i64 %t6652, ptr %t6656
  %t6657 = getelementptr i64, ptr %t6653, i64 2
  store i64 %t6655, ptr %t6657
  %t6658 = musttail call fastcc i64 @"scheme.base:code_1055"(i64 %t6655, i64 2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6658
}

define fastcc i64 @"scheme.base:code:bv-total"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6663 = icmp eq i64 %argc, 1
  br i1 %t6663, label %argok1385, label %arityerr1384
arityerr1384:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1385:
  %t6664 = call i64 @rt_null_p(i64 %a0)
  %t6665 = icmp ne i64 %t6664, 1
  br i1 %t6665, label %then1386, label %else1387
then1386:
  ret i64 0
else1387:
  %t6666 = call i64 @rt_car(i64 %a0)
  %t6667 = call i64 @rt_bytevector_length(i64 %t6666)
  %t6668 = call i64 @rt_cdr(i64 %a0)
  %t6669 = load i64, ptr @"scheme.base:bv-total"
  call void @rt_check_callable(i64 %t6669)
  %t6670 = and i64 %t6669, -8
  %t6671 = inttoptr i64 %t6670 to ptr
  %t6672 = load i64, ptr %t6671
  %t6673 = inttoptr i64 %t6672 to ptr
  %t6674 = call fastcc i64%t6673(i64 %t6669, i64 1, i64 %t6668, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6675 = or i64 %t6667, %t6674
  %t6676 = and i64 %t6675, 7
  %t6677 = icmp eq i64 %t6676, 0
  br i1 %t6677, label %fixfast1388, label %fixslow1389
fixfast1388:
  %t6678 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6667, i64 %t6674)
  %t6679 = extractvalue {i64, i1} %t6678, 0
  %t6680 = extractvalue {i64, i1} %t6678, 1
  br i1 %t6680, label %fixslow1389, label %fixmerge1390
fixslow1389:
  %t6681 = call i64 @rt_add(i64 %t6667, i64 %t6674)
  br label %fixmerge1390
fixmerge1390:
  %t6682 = phi i64 [ %t6679, %fixfast1388 ], [ %t6681, %fixslow1389 ]
  ret i64 %t6682
}

define fastcc i64 @"scheme.base:code:rationalize"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6688 = icmp eq i64 %argc, 2
  br i1 %t6688, label %argok1392, label %arityerr1391
arityerr1391:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1392:
  %t6689 = load i64, ptr @"scheme.base:abs"
  call void @rt_check_callable(i64 %t6689)
  %t6690 = and i64 %t6689, -8
  %t6691 = inttoptr i64 %t6690 to ptr
  %t6692 = load i64, ptr %t6691
  %t6693 = inttoptr i64 %t6692 to ptr
  %t6694 = call fastcc i64%t6693(i64 %t6689, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6695 = or i64 %a0, %t6694
  %t6696 = and i64 %t6695, 7
  %t6697 = icmp eq i64 %t6696, 0
  br i1 %t6697, label %fixfast1393, label %fixslow1394
fixfast1393:
  %t6698 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t6694)
  %t6699 = extractvalue {i64, i1} %t6698, 0
  %t6700 = extractvalue {i64, i1} %t6698, 1
  br i1 %t6700, label %fixslow1394, label %fixmerge1395
fixslow1394:
  %t6701 = call i64 @rt_sub(i64 %a0, i64 %t6694)
  br label %fixmerge1395
fixmerge1395:
  %t6702 = phi i64 [ %t6699, %fixfast1393 ], [ %t6701, %fixslow1394 ]
  %t6703 = load i64, ptr @"scheme.base:abs"
  call void @rt_check_callable(i64 %t6703)
  %t6704 = and i64 %t6703, -8
  %t6705 = inttoptr i64 %t6704 to ptr
  %t6706 = load i64, ptr %t6705
  %t6707 = inttoptr i64 %t6706 to ptr
  %t6708 = call fastcc i64%t6707(i64 %t6703, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6709 = or i64 %a0, %t6708
  %t6710 = and i64 %t6709, 7
  %t6711 = icmp eq i64 %t6710, 0
  br i1 %t6711, label %fixfast1396, label %fixslow1397
fixfast1396:
  %t6712 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 %t6708)
  %t6713 = extractvalue {i64, i1} %t6712, 0
  %t6714 = extractvalue {i64, i1} %t6712, 1
  br i1 %t6714, label %fixslow1397, label %fixmerge1398
fixslow1397:
  %t6715 = call i64 @rt_add(i64 %a0, i64 %t6708)
  br label %fixmerge1398
fixmerge1398:
  %t6716 = phi i64 [ %t6713, %fixfast1396 ], [ %t6715, %fixslow1397 ]
  %t6717 = call i64 @rt_exact_p(i64 %a0)
  %t6718 = icmp ne i64 %t6717, 1
  br i1 %t6718, label %then1399, label %else1400
then1399:
  %t6719 = call i64 @rt_exact_p(i64 %a1)
  br label %merge1401
else1400:
  br label %merge1401
merge1401:
  %t6720 = phi i64 [ %t6719, %then1399 ], [ 1, %else1400 ]
  %t6721 = icmp ne i64 %t6720, 1
  br i1 %t6721, label %then1402, label %else1403
then1402:
  %t6722 = load i64, ptr @"scheme.base:rat-exact"
  call void @rt_check_callable(i64 %t6722)
  %t6723 = and i64 %t6722, -8
  %t6724 = inttoptr i64 %t6723 to ptr
  %t6725 = load i64, ptr %t6724
  %t6726 = inttoptr i64 %t6725 to ptr
  %t6727 = musttail call fastcc i64 %t6726(i64 %t6722, i64 2, i64 %t6702, i64 %t6716, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6727
else1403:
  %t6728 = call i64 @rt_exact_to_inexact(i64 %t6702)
  %t6729 = call i64 @rt_exact_to_inexact(i64 %t6716)
  %t6730 = load i64, ptr @"scheme.base:rat-inexact"
  call void @rt_check_callable(i64 %t6730)
  %t6731 = and i64 %t6730, -8
  %t6732 = inttoptr i64 %t6731 to ptr
  %t6733 = load i64, ptr %t6732
  %t6734 = inttoptr i64 %t6733 to ptr
  %t6735 = musttail call fastcc i64 %t6734(i64 %t6730, i64 2, i64 %t6728, i64 %t6729, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6735
}

define fastcc i64 @"scheme.base:code:rat-exact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6740 = icmp eq i64 %argc, 2
  br i1 %t6740, label %argok1405, label %arityerr1404
arityerr1404:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1405:
  %t6741 = or i64 %a0, 0
  %t6742 = and i64 %t6741, 7
  %t6743 = icmp eq i64 %t6742, 0
  br i1 %t6743, label %fixfast1406, label %fixslow1407
fixfast1406:
  %t6744 = icmp slt i64 %a0, 0
  %t6745 = select i1 %t6744, i64 257, i64 1
  br label %fixmerge1408
fixslow1407:
  %t6746 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge1408
fixmerge1408:
  %t6747 = phi i64 [ %t6745, %fixfast1406 ], [ %t6746, %fixslow1407 ]
  %t6748 = icmp ne i64 %t6747, 1
  br i1 %t6748, label %then1409, label %else1410
then1409:
  br label %merge1411
else1410:
  %t6749 = or i64 %a0, 0
  %t6750 = and i64 %t6749, 7
  %t6751 = icmp eq i64 %t6750, 0
  br i1 %t6751, label %fixfast1412, label %fixslow1413
fixfast1412:
  %t6752 = icmp eq i64 %a0, 0
  %t6753 = select i1 %t6752, i64 257, i64 1
  br label %fixmerge1414
fixslow1413:
  %t6754 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge1414
fixmerge1414:
  %t6755 = phi i64 [ %t6753, %fixfast1412 ], [ %t6754, %fixslow1413 ]
  br label %merge1411
merge1411:
  %t6756 = phi i64 [ 257, %then1409 ], [ %t6755, %fixmerge1414 ]
  %t6757 = icmp ne i64 %t6756, 1
  br i1 %t6757, label %then1415, label %else1416
then1415:
  %t6758 = or i64 0, %a1
  %t6759 = and i64 %t6758, 7
  %t6760 = icmp eq i64 %t6759, 0
  br i1 %t6760, label %fixfast1418, label %fixslow1419
fixfast1418:
  %t6761 = icmp slt i64 0, %a1
  %t6762 = select i1 %t6761, i64 257, i64 1
  br label %fixmerge1420
fixslow1419:
  %t6763 = call i64 @rt_lt(i64 0, i64 %a1)
  br label %fixmerge1420
fixmerge1420:
  %t6764 = phi i64 [ %t6762, %fixfast1418 ], [ %t6763, %fixslow1419 ]
  %t6765 = icmp ne i64 %t6764, 1
  br i1 %t6765, label %then1421, label %else1422
then1421:
  br label %merge1423
else1422:
  %t6766 = or i64 0, %a1
  %t6767 = and i64 %t6766, 7
  %t6768 = icmp eq i64 %t6767, 0
  br i1 %t6768, label %fixfast1424, label %fixslow1425
fixfast1424:
  %t6769 = icmp eq i64 0, %a1
  %t6770 = select i1 %t6769, i64 257, i64 1
  br label %fixmerge1426
fixslow1425:
  %t6771 = call i64 @rt_num_eq(i64 0, i64 %a1)
  br label %fixmerge1426
fixmerge1426:
  %t6772 = phi i64 [ %t6770, %fixfast1424 ], [ %t6771, %fixslow1425 ]
  br label %merge1423
merge1423:
  %t6773 = phi i64 [ 257, %then1421 ], [ %t6772, %fixmerge1426 ]
  br label %merge1417
else1416:
  br label %merge1417
merge1417:
  %t6774 = phi i64 [ %t6773, %merge1423 ], [ 1, %else1416 ]
  %t6775 = icmp ne i64 %t6774, 1
  br i1 %t6775, label %then1427, label %else1428
then1427:
  ret i64 0
else1428:
  %t6776 = or i64 0, %a0
  %t6777 = and i64 %t6776, 7
  %t6778 = icmp eq i64 %t6777, 0
  br i1 %t6778, label %fixfast1429, label %fixslow1430
fixfast1429:
  %t6779 = icmp slt i64 0, %a0
  %t6780 = select i1 %t6779, i64 257, i64 1
  br label %fixmerge1431
fixslow1430:
  %t6781 = call i64 @rt_lt(i64 0, i64 %a0)
  br label %fixmerge1431
fixmerge1431:
  %t6782 = phi i64 [ %t6780, %fixfast1429 ], [ %t6781, %fixslow1430 ]
  %t6783 = icmp ne i64 %t6782, 1
  br i1 %t6783, label %then1432, label %else1433
then1432:
  %t6784 = load i64, ptr @"scheme.base:rat-ceil"
  call void @rt_check_callable(i64 %t6784)
  %t6785 = and i64 %t6784, -8
  %t6786 = inttoptr i64 %t6785 to ptr
  %t6787 = load i64, ptr %t6786
  %t6788 = inttoptr i64 %t6787 to ptr
  %t6789 = call fastcc i64%t6788(i64 %t6784, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6790 = or i64 %t6789, %a1
  %t6791 = and i64 %t6790, 7
  %t6792 = icmp eq i64 %t6791, 0
  br i1 %t6792, label %fixfast1434, label %fixslow1435
fixfast1434:
  %t6793 = icmp slt i64 %t6789, %a1
  %t6794 = select i1 %t6793, i64 257, i64 1
  br label %fixmerge1436
fixslow1435:
  %t6795 = call i64 @rt_lt(i64 %t6789, i64 %a1)
  br label %fixmerge1436
fixmerge1436:
  %t6796 = phi i64 [ %t6794, %fixfast1434 ], [ %t6795, %fixslow1435 ]
  %t6797 = icmp ne i64 %t6796, 1
  br i1 %t6797, label %then1437, label %else1438
then1437:
  br label %merge1439
else1438:
  %t6798 = or i64 %t6789, %a1
  %t6799 = and i64 %t6798, 7
  %t6800 = icmp eq i64 %t6799, 0
  br i1 %t6800, label %fixfast1440, label %fixslow1441
fixfast1440:
  %t6801 = icmp eq i64 %t6789, %a1
  %t6802 = select i1 %t6801, i64 257, i64 1
  br label %fixmerge1442
fixslow1441:
  %t6803 = call i64 @rt_num_eq(i64 %t6789, i64 %a1)
  br label %fixmerge1442
fixmerge1442:
  %t6804 = phi i64 [ %t6802, %fixfast1440 ], [ %t6803, %fixslow1441 ]
  br label %merge1439
merge1439:
  %t6805 = phi i64 [ 257, %then1437 ], [ %t6804, %fixmerge1442 ]
  %t6806 = icmp ne i64 %t6805, 1
  br i1 %t6806, label %then1443, label %else1444
then1443:
  %t6807 = load i64, ptr @"scheme.base:rat-ceil"
  call void @rt_check_callable(i64 %t6807)
  %t6808 = and i64 %t6807, -8
  %t6809 = inttoptr i64 %t6808 to ptr
  %t6810 = load i64, ptr %t6809
  %t6811 = inttoptr i64 %t6810 to ptr
  %t6812 = musttail call fastcc i64 %t6811(i64 %t6807, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6812
else1444:
  %t6813 = call i64 @rt_make_string(ptr @.str.lit.31, i64 69)
  %t6814 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6814)
  %t6815 = and i64 %t6814, -8
  %t6816 = inttoptr i64 %t6815 to ptr
  %t6817 = load i64, ptr %t6816
  %t6818 = inttoptr i64 %t6817 to ptr
  %t6819 = musttail call fastcc i64 %t6818(i64 %t6814, i64 3, i64 %t6813, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6819
else1433:
  %t6820 = load i64, ptr @"scheme.base:rat-floor"
  call void @rt_check_callable(i64 %t6820)
  %t6821 = and i64 %t6820, -8
  %t6822 = inttoptr i64 %t6821 to ptr
  %t6823 = load i64, ptr %t6822
  %t6824 = inttoptr i64 %t6823 to ptr
  %t6825 = call fastcc i64%t6824(i64 %t6820, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6826 = or i64 %a0, %t6825
  %t6827 = and i64 %t6826, 7
  %t6828 = icmp eq i64 %t6827, 0
  br i1 %t6828, label %fixfast1445, label %fixslow1446
fixfast1445:
  %t6829 = icmp slt i64 %a0, %t6825
  %t6830 = select i1 %t6829, i64 257, i64 1
  br label %fixmerge1447
fixslow1446:
  %t6831 = call i64 @rt_lt(i64 %a0, i64 %t6825)
  br label %fixmerge1447
fixmerge1447:
  %t6832 = phi i64 [ %t6830, %fixfast1445 ], [ %t6831, %fixslow1446 ]
  %t6833 = icmp ne i64 %t6832, 1
  br i1 %t6833, label %then1448, label %else1449
then1448:
  br label %merge1450
else1449:
  %t6834 = or i64 %a0, %t6825
  %t6835 = and i64 %t6834, 7
  %t6836 = icmp eq i64 %t6835, 0
  br i1 %t6836, label %fixfast1451, label %fixslow1452
fixfast1451:
  %t6837 = icmp eq i64 %a0, %t6825
  %t6838 = select i1 %t6837, i64 257, i64 1
  br label %fixmerge1453
fixslow1452:
  %t6839 = call i64 @rt_num_eq(i64 %a0, i64 %t6825)
  br label %fixmerge1453
fixmerge1453:
  %t6840 = phi i64 [ %t6838, %fixfast1451 ], [ %t6839, %fixslow1452 ]
  br label %merge1450
merge1450:
  %t6841 = phi i64 [ 257, %then1448 ], [ %t6840, %fixmerge1453 ]
  %t6842 = icmp ne i64 %t6841, 1
  br i1 %t6842, label %then1454, label %else1455
then1454:
  %t6843 = load i64, ptr @"scheme.base:rat-floor"
  call void @rt_check_callable(i64 %t6843)
  %t6844 = and i64 %t6843, -8
  %t6845 = inttoptr i64 %t6844 to ptr
  %t6846 = load i64, ptr %t6845
  %t6847 = inttoptr i64 %t6846 to ptr
  %t6848 = musttail call fastcc i64 %t6847(i64 %t6843, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6848
else1455:
  %t6849 = call i64 @rt_make_string(ptr @.str.lit.32, i64 69)
  %t6850 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6850)
  %t6851 = and i64 %t6850, -8
  %t6852 = inttoptr i64 %t6851 to ptr
  %t6853 = load i64, ptr %t6852
  %t6854 = inttoptr i64 %t6853 to ptr
  %t6855 = musttail call fastcc i64 %t6854(i64 %t6850, i64 3, i64 %t6849, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6855
}

define fastcc i64 @"scheme.base:code:rat-ceil"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6860 = icmp eq i64 %argc, 1
  br i1 %t6860, label %argok1457, label %arityerr1456
arityerr1456:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1457:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:rat-floor"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6865 = icmp eq i64 %argc, 1
  br i1 %t6865, label %argok1459, label %arityerr1458
arityerr1458:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1459:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_1111"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6870 = icmp eq i64 %argc, 1
  br i1 %t6870, label %argok1461, label %arityerr1460
arityerr1460:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1461:
  %t6871 = load i64, ptr @"scheme.base:rat-max-denom"
  %t6872 = or i64 %t6871, %a0
  %t6873 = and i64 %t6872, 7
  %t6874 = icmp eq i64 %t6873, 0
  br i1 %t6874, label %fixfast1462, label %fixslow1463
fixfast1462:
  %t6875 = icmp slt i64 %t6871, %a0
  %t6876 = select i1 %t6875, i64 257, i64 1
  br label %fixmerge1464
fixslow1463:
  %t6877 = call i64 @rt_lt(i64 %t6871, i64 %a0)
  br label %fixmerge1464
fixmerge1464:
  %t6878 = phi i64 [ %t6876, %fixfast1462 ], [ %t6877, %fixslow1463 ]
  %t6879 = icmp ne i64 %t6878, 1
  br i1 %t6879, label %then1465, label %else1466
then1465:
  %t6880 = call i64 @rt_make_string(ptr @.str.lit.33, i64 59)
  %t6881 = and i64 %self, -8
  %t6882 = inttoptr i64 %t6881 to ptr
  %t6883 = getelementptr i64, ptr %t6882, i64 1
  %t6884 = load i64, ptr %t6883
  %t6885 = and i64 %self, -8
  %t6886 = inttoptr i64 %t6885 to ptr
  %t6887 = getelementptr i64, ptr %t6886, i64 2
  %t6888 = load i64, ptr %t6887
  %t6889 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6889)
  %t6890 = and i64 %t6889, -8
  %t6891 = inttoptr i64 %t6890 to ptr
  %t6892 = load i64, ptr %t6891
  %t6893 = inttoptr i64 %t6892 to ptr
  %t6894 = musttail call fastcc i64 %t6893(i64 %t6889, i64 3, i64 %t6880, i64 %t6884, i64 %t6888, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6894
else1466:
  %t6895 = and i64 %self, -8
  %t6896 = inttoptr i64 %t6895 to ptr
  %t6897 = getelementptr i64, ptr %t6896, i64 1
  %t6898 = load i64, ptr %t6897
  %t6899 = or i64 %t6898, %a0
  %t6900 = and i64 %t6899, 7
  %t6901 = icmp eq i64 %t6900, 0
  br i1 %t6901, label %fixfast1467, label %fixslow1468
fixfast1467:
  %t6902 = ashr i64 %t6898, 3
  %t6903 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t6902, i64 %a0)
  %t6904 = extractvalue {i64, i1} %t6903, 0
  %t6905 = extractvalue {i64, i1} %t6903, 1
  br i1 %t6905, label %fixslow1468, label %fixmerge1469
fixslow1468:
  %t6906 = call i64 @rt_mul(i64 %t6898, i64 %a0)
  br label %fixmerge1469
fixmerge1469:
  %t6907 = phi i64 [ %t6904, %fixfast1467 ], [ %t6906, %fixslow1468 ]
  %t6908 = and i64 %self, -8
  %t6909 = inttoptr i64 %t6908 to ptr
  %t6910 = getelementptr i64, ptr %t6909, i64 2
  %t6911 = load i64, ptr %t6910
  %t6912 = or i64 %t6911, %a0
  %t6913 = and i64 %t6912, 7
  %t6914 = icmp eq i64 %t6913, 0
  br i1 %t6914, label %fixfast1470, label %fixslow1471
fixfast1470:
  %t6915 = ashr i64 %t6911, 3
  %t6916 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t6915, i64 %a0)
  %t6917 = extractvalue {i64, i1} %t6916, 0
  %t6918 = extractvalue {i64, i1} %t6916, 1
  br i1 %t6918, label %fixslow1471, label %fixmerge1472
fixslow1471:
  %t6919 = call i64 @rt_mul(i64 %t6911, i64 %a0)
  br label %fixmerge1472
fixmerge1472:
  %t6920 = phi i64 [ %t6917, %fixfast1470 ], [ %t6919, %fixslow1471 ]
  %t6921 = load i64, ptr @"scheme.base:rat-num-in"
  call void @rt_check_callable(i64 %t6921)
  %t6922 = and i64 %t6921, -8
  %t6923 = inttoptr i64 %t6922 to ptr
  %t6924 = load i64, ptr %t6923
  %t6925 = inttoptr i64 %t6924 to ptr
  %t6926 = call fastcc i64%t6925(i64 %t6921, i64 2, i64 %t6907, i64 %t6920, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6927 = icmp ne i64 %t6926, 1
  br i1 %t6927, label %then1473, label %else1474
then1473:
  %t6928 = call i64 @rt_exact_to_inexact(i64 %t6926)
  %t6929 = call i64 @rt_exact_to_inexact(i64 %a0)
  %t6930 = call i64 @rt_div(i64 %t6928, i64 %t6929)
  ret i64 %t6930
else1474:
  %t6931 = or i64 %a0, 8
  %t6932 = and i64 %t6931, 7
  %t6933 = icmp eq i64 %t6932, 0
  br i1 %t6933, label %fixfast1475, label %fixslow1476
fixfast1475:
  %t6934 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t6935 = extractvalue {i64, i1} %t6934, 0
  %t6936 = extractvalue {i64, i1} %t6934, 1
  br i1 %t6936, label %fixslow1476, label %fixmerge1477
fixslow1476:
  %t6937 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1477
fixmerge1477:
  %t6938 = phi i64 [ %t6935, %fixfast1475 ], [ %t6937, %fixslow1476 ]
  %t6939 = musttail call fastcc i64 @"scheme.base:code_1111"(i64 %self, i64 1, i64 %t6938, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6939
}

define fastcc i64 @"scheme.base:code:rat-inexact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6940 = icmp eq i64 %argc, 2
  br i1 %t6940, label %argok1479, label %arityerr1478
arityerr1478:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1479:
  %t6941 = call i64 @rt_flonum_lit(ptr @.flo.lit.34)
  %t6942 = or i64 %a0, %t6941
  %t6943 = and i64 %t6942, 7
  %t6944 = icmp eq i64 %t6943, 0
  br i1 %t6944, label %fixfast1480, label %fixslow1481
fixfast1480:
  %t6945 = icmp slt i64 %a0, %t6941
  %t6946 = select i1 %t6945, i64 257, i64 1
  br label %fixmerge1482
fixslow1481:
  %t6947 = call i64 @rt_lt(i64 %a0, i64 %t6941)
  br label %fixmerge1482
fixmerge1482:
  %t6948 = phi i64 [ %t6946, %fixfast1480 ], [ %t6947, %fixslow1481 ]
  %t6949 = icmp ne i64 %t6948, 1
  br i1 %t6949, label %then1483, label %else1484
then1483:
  br label %merge1485
else1484:
  %t6950 = or i64 %a0, %t6941
  %t6951 = and i64 %t6950, 7
  %t6952 = icmp eq i64 %t6951, 0
  br i1 %t6952, label %fixfast1486, label %fixslow1487
fixfast1486:
  %t6953 = icmp eq i64 %a0, %t6941
  %t6954 = select i1 %t6953, i64 257, i64 1
  br label %fixmerge1488
fixslow1487:
  %t6955 = call i64 @rt_num_eq(i64 %a0, i64 %t6941)
  br label %fixmerge1488
fixmerge1488:
  %t6956 = phi i64 [ %t6954, %fixfast1486 ], [ %t6955, %fixslow1487 ]
  br label %merge1485
merge1485:
  %t6957 = phi i64 [ 257, %then1483 ], [ %t6956, %fixmerge1488 ]
  %t6958 = icmp ne i64 %t6957, 1
  br i1 %t6958, label %then1489, label %else1490
then1489:
  %t6959 = call i64 @rt_flonum_lit(ptr @.flo.lit.35)
  %t6960 = or i64 %t6959, %a1
  %t6961 = and i64 %t6960, 7
  %t6962 = icmp eq i64 %t6961, 0
  br i1 %t6962, label %fixfast1492, label %fixslow1493
fixfast1492:
  %t6963 = icmp slt i64 %t6959, %a1
  %t6964 = select i1 %t6963, i64 257, i64 1
  br label %fixmerge1494
fixslow1493:
  %t6965 = call i64 @rt_lt(i64 %t6959, i64 %a1)
  br label %fixmerge1494
fixmerge1494:
  %t6966 = phi i64 [ %t6964, %fixfast1492 ], [ %t6965, %fixslow1493 ]
  %t6967 = icmp ne i64 %t6966, 1
  br i1 %t6967, label %then1495, label %else1496
then1495:
  br label %merge1497
else1496:
  %t6968 = or i64 %t6959, %a1
  %t6969 = and i64 %t6968, 7
  %t6970 = icmp eq i64 %t6969, 0
  br i1 %t6970, label %fixfast1498, label %fixslow1499
fixfast1498:
  %t6971 = icmp eq i64 %t6959, %a1
  %t6972 = select i1 %t6971, i64 257, i64 1
  br label %fixmerge1500
fixslow1499:
  %t6973 = call i64 @rt_num_eq(i64 %t6959, i64 %a1)
  br label %fixmerge1500
fixmerge1500:
  %t6974 = phi i64 [ %t6972, %fixfast1498 ], [ %t6973, %fixslow1499 ]
  br label %merge1497
merge1497:
  %t6975 = phi i64 [ 257, %then1495 ], [ %t6974, %fixmerge1500 ]
  br label %merge1491
else1490:
  br label %merge1491
merge1491:
  %t6976 = phi i64 [ %t6975, %merge1497 ], [ 1, %else1490 ]
  %t6977 = icmp ne i64 %t6976, 1
  br i1 %t6977, label %then1501, label %else1502
then1501:
  %t6978 = call i64 @rt_flonum_lit(ptr @.flo.lit.36)
  ret i64 %t6978
else1502:
  %t6979 = call ptr @rt_alloc_words(i64 4)
  %t6980 = ptrtoint ptr %t6979 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1111" to i64), ptr %t6979
  %t6981 = or i64 %t6980, 4
  %t6982 = getelementptr i64, ptr %t6979, i64 1
  store i64 %a0, ptr %t6982
  %t6983 = getelementptr i64, ptr %t6979, i64 2
  store i64 %a1, ptr %t6983
  %t6984 = getelementptr i64, ptr %t6979, i64 3
  store i64 %t6981, ptr %t6984
  %t6985 = musttail call fastcc i64 @"scheme.base:code_1111"(i64 %t6981, i64 1, i64 8, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6985
}

define fastcc i64 @"scheme.base:code:rat-num-in"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6990 = icmp eq i64 %argc, 2
  br i1 %t6990, label %argok1504, label %arityerr1503
arityerr1503:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1504:
  %t6991 = load i64, ptr @"scheme.base:rat-ceil-flo"
  call void @rt_check_callable(i64 %t6991)
  %t6992 = and i64 %t6991, -8
  %t6993 = inttoptr i64 %t6992 to ptr
  %t6994 = load i64, ptr %t6993
  %t6995 = inttoptr i64 %t6994 to ptr
  %t6996 = call fastcc i64%t6995(i64 %t6991, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6997 = call i64 @rt_exact_to_inexact(i64 %t6996)
  %t6998 = or i64 %t6997, %a1
  %t6999 = and i64 %t6998, 7
  %t7000 = icmp eq i64 %t6999, 0
  br i1 %t7000, label %fixfast1505, label %fixslow1506
fixfast1505:
  %t7001 = icmp slt i64 %t6997, %a1
  %t7002 = select i1 %t7001, i64 257, i64 1
  br label %fixmerge1507
fixslow1506:
  %t7003 = call i64 @rt_lt(i64 %t6997, i64 %a1)
  br label %fixmerge1507
fixmerge1507:
  %t7004 = phi i64 [ %t7002, %fixfast1505 ], [ %t7003, %fixslow1506 ]
  %t7005 = icmp ne i64 %t7004, 1
  br i1 %t7005, label %then1508, label %else1509
then1508:
  br label %merge1510
else1509:
  %t7006 = or i64 %t6997, %a1
  %t7007 = and i64 %t7006, 7
  %t7008 = icmp eq i64 %t7007, 0
  br i1 %t7008, label %fixfast1511, label %fixslow1512
fixfast1511:
  %t7009 = icmp eq i64 %t6997, %a1
  %t7010 = select i1 %t7009, i64 257, i64 1
  br label %fixmerge1513
fixslow1512:
  %t7011 = call i64 @rt_num_eq(i64 %t6997, i64 %a1)
  br label %fixmerge1513
fixmerge1513:
  %t7012 = phi i64 [ %t7010, %fixfast1511 ], [ %t7011, %fixslow1512 ]
  br label %merge1510
merge1510:
  %t7013 = phi i64 [ 257, %then1508 ], [ %t7012, %fixmerge1513 ]
  %t7014 = icmp ne i64 %t7013, 1
  br i1 %t7014, label %then1514, label %else1515
then1514:
  ret i64 %t6996
else1515:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rat-ceil-flo"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7019 = icmp eq i64 %argc, 1
  br i1 %t7019, label %argok1517, label %arityerr1516
arityerr1516:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1517:
  %t7020 = load i64, ptr @"scheme.base:floor"
  call void @rt_check_callable(i64 %t7020)
  %t7021 = and i64 %t7020, -8
  %t7022 = inttoptr i64 %t7021 to ptr
  %t7023 = load i64, ptr %t7022
  %t7024 = inttoptr i64 %t7023 to ptr
  %t7025 = call fastcc i64%t7024(i64 %t7020, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7026 = call i64 @rt_inexact_to_exact(i64 %t7025)
  %t7027 = call i64 @rt_exact_to_inexact(i64 %t7026)
  %t7028 = or i64 %t7027, %a0
  %t7029 = and i64 %t7028, 7
  %t7030 = icmp eq i64 %t7029, 0
  br i1 %t7030, label %fixfast1518, label %fixslow1519
fixfast1518:
  %t7031 = icmp slt i64 %t7027, %a0
  %t7032 = select i1 %t7031, i64 257, i64 1
  br label %fixmerge1520
fixslow1519:
  %t7033 = call i64 @rt_lt(i64 %t7027, i64 %a0)
  br label %fixmerge1520
fixmerge1520:
  %t7034 = phi i64 [ %t7032, %fixfast1518 ], [ %t7033, %fixslow1519 ]
  %t7035 = icmp ne i64 %t7034, 1
  br i1 %t7035, label %then1521, label %else1522
then1521:
  %t7036 = or i64 %t7026, 8
  %t7037 = and i64 %t7036, 7
  %t7038 = icmp eq i64 %t7037, 0
  br i1 %t7038, label %fixfast1523, label %fixslow1524
fixfast1523:
  %t7039 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t7026, i64 8)
  %t7040 = extractvalue {i64, i1} %t7039, 0
  %t7041 = extractvalue {i64, i1} %t7039, 1
  br i1 %t7041, label %fixslow1524, label %fixmerge1525
fixslow1524:
  %t7042 = call i64 @rt_add(i64 %t7026, i64 8)
  br label %fixmerge1525
fixmerge1525:
  %t7043 = phi i64 [ %t7040, %fixfast1523 ], [ %t7042, %fixslow1524 ]
  ret i64 %t7043
else1522:
  ret i64 %t7026
}

define fastcc i64 @"scheme.base:code:values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7048 = icmp sge i64 %argc, 0
  br i1 %t7048, label %argok1527, label %arityerr1526
arityerr1526:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1527:
  %t7049 = call ptr @rt_alloc_words(i64 8)
  %t7050 = getelementptr i64, ptr %t7049, i64 0
  store i64 %a0, ptr %t7050
  %t7051 = getelementptr i64, ptr %t7049, i64 1
  store i64 %a1, ptr %t7051
  %t7052 = getelementptr i64, ptr %t7049, i64 2
  store i64 %a2, ptr %t7052
  %t7053 = getelementptr i64, ptr %t7049, i64 3
  store i64 %a3, ptr %t7053
  %t7054 = getelementptr i64, ptr %t7049, i64 4
  store i64 %a4, ptr %t7054
  %t7055 = getelementptr i64, ptr %t7049, i64 5
  store i64 %a5, ptr %t7055
  %t7056 = getelementptr i64, ptr %t7049, i64 6
  store i64 %a6, ptr %t7056
  %t7057 = getelementptr i64, ptr %t7049, i64 7
  store i64 %a7, ptr %t7057
  %t7058 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t7049, ptr %overflow)
  %t7059 = call i64 @rt_pair_p(i64 %t7058)
  %t7060 = icmp ne i64 %t7059, 1
  br i1 %t7060, label %then1528, label %else1529
then1528:
  %t7061 = call i64 @rt_cdr(i64 %t7058)
  %t7062 = call i64 @rt_null_p(i64 %t7061)
  br label %merge1530
else1529:
  br label %merge1530
merge1530:
  %t7063 = phi i64 [ %t7062, %then1528 ], [ 1, %else1529 ]
  %t7064 = icmp ne i64 %t7063, 1
  br i1 %t7064, label %then1531, label %else1532
then1531:
  %t7065 = call i64 @rt_car(i64 %t7058)
  ret i64 %t7065
else1532:
  %t7066 = call i64 @rt_list_to_mv(i64 %t7058)
  ret i64 %t7066
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvalues"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7067 = call i64 @rt_pair_p(i64 2)
  %t7068 = icmp ne i64 %t7067, 1
  br i1 %t7068, label %then1533, label %else1534
then1533:
  %t7069 = call i64 @rt_cdr(i64 2)
  %t7070 = call i64 @rt_null_p(i64 %t7069)
  br label %merge1535
else1534:
  br label %merge1535
merge1535:
  %t7071 = phi i64 [ %t7070, %then1533 ], [ 1, %else1534 ]
  %t7072 = icmp ne i64 %t7071, 1
  br i1 %t7072, label %then1536, label %else1537
then1536:
  %t7073 = call i64 @rt_car(i64 2)
  ret i64 %t7073
else1537:
  %t7074 = call i64 @rt_list_to_mv(i64 2)
  ret i64 %t7074
}

define fastcc i64 @"scheme.base:code:call-with-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7079 = icmp eq i64 %argc, 2
  br i1 %t7079, label %argok1539, label %arityerr1538
arityerr1538:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1539:
  call void @rt_check_callable(i64 %a0)
  %t7080 = and i64 %a0, -8
  %t7081 = inttoptr i64 %t7080 to ptr
  %t7082 = load i64, ptr %t7081
  %t7083 = inttoptr i64 %t7082 to ptr
  %t7084 = call fastcc i64%t7083(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7085 = call i64 @rt_mv_p(i64 %t7084)
  %t7086 = icmp ne i64 %t7085, 1
  br i1 %t7086, label %then1540, label %else1541
then1540:
  %t7087 = call i64 @rt_mv_to_list(i64 %t7084)
  call void @rt_check_callable(i64 %a1)
  %t7088 = and i64 %a1, -8
  %t7089 = inttoptr i64 %t7088 to ptr
  %t7090 = load i64, ptr %t7089
  %t7091 = inttoptr i64 %t7090 to ptr
  %t7092 = call i64 @rt_list_length(i64 %t7087)
  %t7093 = add i64 0, %t7092
  %t7094 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t7087, i64 8)
  %t7106 = getelementptr i64, ptr %t7094, i64 0
  %t7098 = load i64, ptr %t7106
  %t7107 = getelementptr i64, ptr %t7094, i64 1
  %t7099 = load i64, ptr %t7107
  %t7108 = getelementptr i64, ptr %t7094, i64 2
  %t7100 = load i64, ptr %t7108
  %t7109 = getelementptr i64, ptr %t7094, i64 3
  %t7101 = load i64, ptr %t7109
  %t7110 = getelementptr i64, ptr %t7094, i64 4
  %t7102 = load i64, ptr %t7110
  %t7111 = getelementptr i64, ptr %t7094, i64 5
  %t7103 = load i64, ptr %t7111
  %t7112 = getelementptr i64, ptr %t7094, i64 6
  %t7104 = load i64, ptr %t7112
  %t7113 = getelementptr i64, ptr %t7094, i64 7
  %t7105 = load i64, ptr %t7113
  %t7095 = icmp sgt i64 %t7093, 8
  %t7096 = getelementptr i64, ptr %t7094, i64 8
  %t7097 = select i1 %t7095, ptr %t7096, ptr null
  %t7114 = musttail call fastcc i64 %t7091(i64 %a1, i64 %t7093, i64 %t7098, i64 %t7099, i64 %t7100, i64 %t7101, i64 %t7102, i64 %t7103, i64 %t7104, i64 %t7105, ptr %t7097)
  ret i64 %t7114
else1541:
  call void @rt_check_callable(i64 %a1)
  %t7115 = and i64 %a1, -8
  %t7116 = inttoptr i64 %t7115 to ptr
  %t7117 = load i64, ptr %t7116
  %t7118 = inttoptr i64 %t7117 to ptr
  %t7119 = musttail call fastcc i64 %t7118(i64 %a1, i64 1, i64 %t7084, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7119
}

define fastcc i64 @"scheme.base:code:make-hash-table"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7126 = icmp eq i64 %argc, 0
  br i1 %t7126, label %argok1543, label %arityerr1542
arityerr1542:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1543:
  %t7127 = load i64, ptr @"scheme.base:%ht-initial-buckets"
  %t7128 = call i64 @rt_make_vector(i64 %t7127, i64 2)
  %t7129 = load i64, ptr @"scheme.base:vector"
  call void @rt_check_callable(i64 %t7129)
  %t7130 = and i64 %t7129, -8
  %t7131 = inttoptr i64 %t7130 to ptr
  %t7132 = load i64, ptr %t7131
  %t7133 = inttoptr i64 %t7132 to ptr
  %t7134 = call fastcc i64%t7133(i64 %t7129, i64 3, i64 0, i64 %t7128, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7135 = call i64 @rt_make_hash_table(i64 %t7134)
  ret i64 %t7135
}

define fastcc i64 @"scheme.base:code:make-eq-hash-table"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7140 = icmp eq i64 %argc, 0
  br i1 %t7140, label %argok1545, label %arityerr1544
arityerr1544:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1545:
  %t7141 = load i64, ptr @"scheme.base:%ht-initial-buckets"
  %t7142 = call i64 @rt_make_vector(i64 %t7141, i64 2)
  %t7143 = load i64, ptr @"scheme.base:vector"
  call void @rt_check_callable(i64 %t7143)
  %t7144 = and i64 %t7143, -8
  %t7145 = inttoptr i64 %t7144 to ptr
  %t7146 = load i64, ptr %t7145
  %t7147 = inttoptr i64 %t7146 to ptr
  %t7148 = call fastcc i64%t7147(i64 %t7143, i64 3, i64 0, i64 %t7142, i64 257, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7149 = call i64 @rt_make_hash_table(i64 %t7148)
  ret i64 %t7149
}

define fastcc i64 @"scheme.base:code:hash-table?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7154 = icmp eq i64 %argc, 1
  br i1 %t7154, label %argok1547, label %arityerr1546
arityerr1546:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1547:
  %t7155 = call i64 @rt_hash_table_p(i64 %a0)
  ret i64 %t7155
}

define fastcc i64 @"scheme.base:code:%ht-count"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7160 = icmp eq i64 %argc, 1
  br i1 %t7160, label %argok1549, label %arityerr1548
arityerr1548:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1549:
  %t7161 = call i64 @rt_hash_table_spine(i64 %a0)
  %t7162 = call i64 @rt_vector_ref(i64 %t7161, i64 0)
  ret i64 %t7162
}

define fastcc i64 @"scheme.base:code:%ht-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7167 = icmp eq i64 %argc, 1
  br i1 %t7167, label %argok1551, label %arityerr1550
arityerr1550:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1551:
  %t7168 = call i64 @rt_hash_table_spine(i64 %a0)
  %t7169 = call i64 @rt_vector_ref(i64 %t7168, i64 8)
  ret i64 %t7169
}

define fastcc i64 @"scheme.base:code:%ht-identity?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7174 = icmp eq i64 %argc, 1
  br i1 %t7174, label %argok1553, label %arityerr1552
arityerr1552:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1553:
  %t7175 = call i64 @rt_hash_table_spine(i64 %a0)
  %t7176 = call i64 @rt_vector_ref(i64 %t7175, i64 16)
  ret i64 %t7176
}

define fastcc i64 @"scheme.base:code:%ht-set-count!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7181 = icmp eq i64 %argc, 2
  br i1 %t7181, label %argok1555, label %arityerr1554
arityerr1554:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1555:
  %t7182 = call i64 @rt_hash_table_spine(i64 %a0)
  %t7183 = call i64 @rt_vector_set(i64 %t7182, i64 0, i64 %a1)
  ret i64 %t7183
}

define fastcc i64 @"scheme.base:code:%ht-set-buckets!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7188 = icmp eq i64 %argc, 2
  br i1 %t7188, label %argok1557, label %arityerr1556
arityerr1556:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1557:
  %t7189 = call i64 @rt_hash_table_spine(i64 %a0)
  %t7190 = call i64 @rt_vector_set(i64 %t7189, i64 8, i64 %a1)
  ret i64 %t7190
}

define fastcc i64 @"scheme.base:code:%ht-hash"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7195 = icmp eq i64 %argc, 2
  br i1 %t7195, label %argok1559, label %arityerr1558
arityerr1558:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1559:
  %t7196 = load i64, ptr @"scheme.base:%ht-identity?"
  call void @rt_check_callable(i64 %t7196)
  %t7197 = and i64 %t7196, -8
  %t7198 = inttoptr i64 %t7197 to ptr
  %t7199 = load i64, ptr %t7198
  %t7200 = inttoptr i64 %t7199 to ptr
  %t7201 = call fastcc i64%t7200(i64 %t7196, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7202 = icmp ne i64 %t7201, 1
  br i1 %t7202, label %then1560, label %else1561
then1560:
  %t7203 = call i64 @rt_eq_hash(i64 %a1)
  ret i64 %t7203
else1561:
  %t7204 = call i64 @rt_hash(i64 %a1)
  ret i64 %t7204
}

define fastcc i64 @"scheme.base:code:%ht-key=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7209 = icmp eq i64 %argc, 3
  br i1 %t7209, label %argok1563, label %arityerr1562
arityerr1562:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1563:
  %t7210 = load i64, ptr @"scheme.base:%ht-identity?"
  call void @rt_check_callable(i64 %t7210)
  %t7211 = and i64 %t7210, -8
  %t7212 = inttoptr i64 %t7211 to ptr
  %t7213 = load i64, ptr %t7212
  %t7214 = inttoptr i64 %t7213 to ptr
  %t7215 = call fastcc i64%t7214(i64 %t7210, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7216 = icmp ne i64 %t7215, 1
  br i1 %t7216, label %then1564, label %else1565
then1564:
  %t7217 = call i64 @rt_eq_p(i64 %a1, i64 %a2)
  ret i64 %t7217
else1565:
  %t7218 = call i64 @rt_equal(i64 %a1, i64 %a2)
  ret i64 %t7218
}

define fastcc i64 @"scheme.base:code:%ht-index"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7223 = icmp eq i64 %argc, 3
  br i1 %t7223, label %argok1567, label %arityerr1566
arityerr1566:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1567:
  %t7224 = load i64, ptr @"scheme.base:%ht-hash"
  call void @rt_check_callable(i64 %t7224)
  %t7225 = and i64 %t7224, -8
  %t7226 = inttoptr i64 %t7225 to ptr
  %t7227 = load i64, ptr %t7226
  %t7228 = inttoptr i64 %t7227 to ptr
  %t7229 = call fastcc i64%t7228(i64 %t7224, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7230 = call i64 @rt_remainder(i64 %t7229, i64 %a2)
  ret i64 %t7230
}

define fastcc i64 @"scheme.base:code:%ht-assoc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7235 = icmp eq i64 %argc, 3
  br i1 %t7235, label %argok1569, label %arityerr1568
arityerr1568:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1569:
  %t7236 = call i64 @rt_null_p(i64 %a2)
  %t7237 = icmp ne i64 %t7236, 1
  br i1 %t7237, label %then1570, label %else1571
then1570:
  ret i64 1
else1571:
  %t7238 = call i64 @rt_car(i64 %a2)
  %t7239 = call i64 @rt_car(i64 %t7238)
  %t7240 = load i64, ptr @"scheme.base:%ht-key=?"
  call void @rt_check_callable(i64 %t7240)
  %t7241 = and i64 %t7240, -8
  %t7242 = inttoptr i64 %t7241 to ptr
  %t7243 = load i64, ptr %t7242
  %t7244 = inttoptr i64 %t7243 to ptr
  %t7245 = call fastcc i64%t7244(i64 %t7240, i64 3, i64 %a0, i64 %a1, i64 %t7239, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7246 = icmp ne i64 %t7245, 1
  br i1 %t7246, label %then1572, label %else1573
then1572:
  %t7247 = call i64 @rt_car(i64 %a2)
  ret i64 %t7247
else1573:
  %t7248 = call i64 @rt_cdr(i64 %a2)
  %t7249 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t7249)
  %t7250 = and i64 %t7249, -8
  %t7251 = inttoptr i64 %t7250 to ptr
  %t7252 = load i64, ptr %t7251
  %t7253 = inttoptr i64 %t7252 to ptr
  %t7254 = musttail call fastcc i64 %t7253(i64 %t7249, i64 3, i64 %a0, i64 %a1, i64 %t7248, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7254
}

define fastcc i64 @"scheme.base:code:%ht-remove"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7259 = icmp eq i64 %argc, 3
  br i1 %t7259, label %argok1575, label %arityerr1574
arityerr1574:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1575:
  %t7260 = call i64 @rt_null_p(i64 %a2)
  %t7261 = icmp ne i64 %t7260, 1
  br i1 %t7261, label %then1576, label %else1577
then1576:
  ret i64 2
else1577:
  %t7262 = call i64 @rt_car(i64 %a2)
  %t7263 = call i64 @rt_car(i64 %t7262)
  %t7264 = load i64, ptr @"scheme.base:%ht-key=?"
  call void @rt_check_callable(i64 %t7264)
  %t7265 = and i64 %t7264, -8
  %t7266 = inttoptr i64 %t7265 to ptr
  %t7267 = load i64, ptr %t7266
  %t7268 = inttoptr i64 %t7267 to ptr
  %t7269 = call fastcc i64%t7268(i64 %t7264, i64 3, i64 %a0, i64 %a1, i64 %t7263, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7270 = icmp ne i64 %t7269, 1
  br i1 %t7270, label %then1578, label %else1579
then1578:
  %t7271 = call i64 @rt_cdr(i64 %a2)
  ret i64 %t7271
else1579:
  %t7272 = call i64 @rt_car(i64 %a2)
  %t7273 = call i64 @rt_cdr(i64 %a2)
  %t7274 = load i64, ptr @"scheme.base:%ht-remove"
  call void @rt_check_callable(i64 %t7274)
  %t7275 = and i64 %t7274, -8
  %t7276 = inttoptr i64 %t7275 to ptr
  %t7277 = load i64, ptr %t7276
  %t7278 = inttoptr i64 %t7277 to ptr
  %t7279 = call fastcc i64%t7278(i64 %t7274, i64 3, i64 %a0, i64 %a1, i64 %t7273, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7280 = call i64 @rt_cons(i64 %t7272, i64 %t7279)
  ret i64 %t7280
}

define fastcc i64 @"scheme.base:code:hash-table-ref/default"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7285 = icmp eq i64 %argc, 3
  br i1 %t7285, label %argok1581, label %arityerr1580
arityerr1580:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1581:
  %t7286 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7286)
  %t7287 = and i64 %t7286, -8
  %t7288 = inttoptr i64 %t7287 to ptr
  %t7289 = load i64, ptr %t7288
  %t7290 = inttoptr i64 %t7289 to ptr
  %t7291 = call fastcc i64%t7290(i64 %t7286, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7292 = call i64 @rt_vector_length(i64 %t7291)
  %t7293 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t7293)
  %t7294 = and i64 %t7293, -8
  %t7295 = inttoptr i64 %t7294 to ptr
  %t7296 = load i64, ptr %t7295
  %t7297 = inttoptr i64 %t7296 to ptr
  %t7298 = call fastcc i64%t7297(i64 %t7293, i64 3, i64 %a0, i64 %a1, i64 %t7292, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7299 = call i64 @rt_vector_ref(i64 %t7291, i64 %t7298)
  %t7300 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t7300)
  %t7301 = and i64 %t7300, -8
  %t7302 = inttoptr i64 %t7301 to ptr
  %t7303 = load i64, ptr %t7302
  %t7304 = inttoptr i64 %t7303 to ptr
  %t7305 = call fastcc i64%t7304(i64 %t7300, i64 3, i64 %a0, i64 %a1, i64 %t7299, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7306 = icmp ne i64 %t7305, 1
  br i1 %t7306, label %then1582, label %else1583
then1582:
  %t7307 = call i64 @rt_cdr(i64 %t7305)
  ret i64 %t7307
else1583:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:hash-table-contains?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7312 = icmp eq i64 %argc, 2
  br i1 %t7312, label %argok1585, label %arityerr1584
arityerr1584:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1585:
  %t7313 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7313)
  %t7314 = and i64 %t7313, -8
  %t7315 = inttoptr i64 %t7314 to ptr
  %t7316 = load i64, ptr %t7315
  %t7317 = inttoptr i64 %t7316 to ptr
  %t7318 = call fastcc i64%t7317(i64 %t7313, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7319 = call i64 @rt_vector_length(i64 %t7318)
  %t7320 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t7320)
  %t7321 = and i64 %t7320, -8
  %t7322 = inttoptr i64 %t7321 to ptr
  %t7323 = load i64, ptr %t7322
  %t7324 = inttoptr i64 %t7323 to ptr
  %t7325 = call fastcc i64%t7324(i64 %t7320, i64 3, i64 %a0, i64 %a1, i64 %t7319, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7326 = call i64 @rt_vector_ref(i64 %t7318, i64 %t7325)
  %t7327 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t7327)
  %t7328 = and i64 %t7327, -8
  %t7329 = inttoptr i64 %t7328 to ptr
  %t7330 = load i64, ptr %t7329
  %t7331 = inttoptr i64 %t7330 to ptr
  %t7332 = call fastcc i64%t7331(i64 %t7327, i64 3, i64 %a0, i64 %a1, i64 %t7326, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7333 = icmp ne i64 %t7332, 1
  br i1 %t7333, label %then1586, label %else1587
then1586:
  ret i64 257
else1587:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-ref"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7338 = icmp eq i64 %argc, 2
  br i1 %t7338, label %argok1589, label %arityerr1588
arityerr1588:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1589:
  %t7339 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7339)
  %t7340 = and i64 %t7339, -8
  %t7341 = inttoptr i64 %t7340 to ptr
  %t7342 = load i64, ptr %t7341
  %t7343 = inttoptr i64 %t7342 to ptr
  %t7344 = call fastcc i64%t7343(i64 %t7339, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7345 = call i64 @rt_vector_length(i64 %t7344)
  %t7346 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t7346)
  %t7347 = and i64 %t7346, -8
  %t7348 = inttoptr i64 %t7347 to ptr
  %t7349 = load i64, ptr %t7348
  %t7350 = inttoptr i64 %t7349 to ptr
  %t7351 = call fastcc i64%t7350(i64 %t7346, i64 3, i64 %a0, i64 %a1, i64 %t7345, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7352 = call i64 @rt_vector_ref(i64 %t7344, i64 %t7351)
  %t7353 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t7353)
  %t7354 = and i64 %t7353, -8
  %t7355 = inttoptr i64 %t7354 to ptr
  %t7356 = load i64, ptr %t7355
  %t7357 = inttoptr i64 %t7356 to ptr
  %t7358 = call fastcc i64%t7357(i64 %t7353, i64 3, i64 %a0, i64 %a1, i64 %t7352, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7359 = icmp ne i64 %t7358, 1
  br i1 %t7359, label %then1590, label %else1591
then1590:
  %t7360 = call i64 @rt_cdr(i64 %t7358)
  ret i64 %t7360
else1591:
  %t7361 = call i64 @rt_make_string(ptr @.str.lit.37, i64 29)
  %t7362 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t7362)
  %t7363 = and i64 %t7362, -8
  %t7364 = inttoptr i64 %t7363 to ptr
  %t7365 = load i64, ptr %t7364
  %t7366 = inttoptr i64 %t7365 to ptr
  %t7367 = musttail call fastcc i64 %t7366(i64 %t7362, i64 2, i64 %t7361, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7367
}

define fastcc i64 @"scheme.base:code:hash-table-set!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7372 = icmp eq i64 %argc, 3
  br i1 %t7372, label %argok1593, label %arityerr1592
arityerr1592:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1593:
  %t7373 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7373)
  %t7374 = and i64 %t7373, -8
  %t7375 = inttoptr i64 %t7374 to ptr
  %t7376 = load i64, ptr %t7375
  %t7377 = inttoptr i64 %t7376 to ptr
  %t7378 = call fastcc i64%t7377(i64 %t7373, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7379 = call i64 @rt_vector_length(i64 %t7378)
  %t7380 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t7380)
  %t7381 = and i64 %t7380, -8
  %t7382 = inttoptr i64 %t7381 to ptr
  %t7383 = load i64, ptr %t7382
  %t7384 = inttoptr i64 %t7383 to ptr
  %t7385 = call fastcc i64%t7384(i64 %t7380, i64 3, i64 %a0, i64 %a1, i64 %t7379, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7386 = call i64 @rt_vector_ref(i64 %t7378, i64 %t7385)
  %t7387 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t7387)
  %t7388 = and i64 %t7387, -8
  %t7389 = inttoptr i64 %t7388 to ptr
  %t7390 = load i64, ptr %t7389
  %t7391 = inttoptr i64 %t7390 to ptr
  %t7392 = call fastcc i64%t7391(i64 %t7387, i64 3, i64 %a0, i64 %a1, i64 %t7386, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7393 = call i64 @rt_cons(i64 %a1, i64 %a2)
  %t7394 = icmp ne i64 %t7392, 1
  br i1 %t7394, label %then1594, label %else1595
then1594:
  %t7395 = load i64, ptr @"scheme.base:%ht-remove"
  call void @rt_check_callable(i64 %t7395)
  %t7396 = and i64 %t7395, -8
  %t7397 = inttoptr i64 %t7396 to ptr
  %t7398 = load i64, ptr %t7397
  %t7399 = inttoptr i64 %t7398 to ptr
  %t7400 = call fastcc i64%t7399(i64 %t7395, i64 3, i64 %a0, i64 %a1, i64 %t7386, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge1596
else1595:
  br label %merge1596
merge1596:
  %t7401 = phi i64 [ %t7400, %then1594 ], [ %t7386, %else1595 ]
  %t7402 = call i64 @rt_cons(i64 %t7393, i64 %t7401)
  %t7403 = call i64 @rt_vector_set(i64 %t7378, i64 %t7385, i64 %t7402)
  %t7404 = icmp ne i64 %t7392, 1
  br i1 %t7404, label %then1597, label %else1598
then1597:
  ret i64 1
else1598:
  %t7405 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t7405)
  %t7406 = and i64 %t7405, -8
  %t7407 = inttoptr i64 %t7406 to ptr
  %t7408 = load i64, ptr %t7407
  %t7409 = inttoptr i64 %t7408 to ptr
  %t7410 = call fastcc i64%t7409(i64 %t7405, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7411 = or i64 %t7410, 8
  %t7412 = and i64 %t7411, 7
  %t7413 = icmp eq i64 %t7412, 0
  br i1 %t7413, label %fixfast1599, label %fixslow1600
fixfast1599:
  %t7414 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t7410, i64 8)
  %t7415 = extractvalue {i64, i1} %t7414, 0
  %t7416 = extractvalue {i64, i1} %t7414, 1
  br i1 %t7416, label %fixslow1600, label %fixmerge1601
fixslow1600:
  %t7417 = call i64 @rt_add(i64 %t7410, i64 8)
  br label %fixmerge1601
fixmerge1601:
  %t7418 = phi i64 [ %t7415, %fixfast1599 ], [ %t7417, %fixslow1600 ]
  %t7419 = load i64, ptr @"scheme.base:%ht-set-count!"
  call void @rt_check_callable(i64 %t7419)
  %t7420 = and i64 %t7419, -8
  %t7421 = inttoptr i64 %t7420 to ptr
  %t7422 = load i64, ptr %t7421
  %t7423 = inttoptr i64 %t7422 to ptr
  %t7424 = call fastcc i64%t7423(i64 %t7419, i64 2, i64 %a0, i64 %t7418, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7425 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t7425)
  %t7426 = and i64 %t7425, -8
  %t7427 = inttoptr i64 %t7426 to ptr
  %t7428 = load i64, ptr %t7427
  %t7429 = inttoptr i64 %t7428 to ptr
  %t7430 = call fastcc i64%t7429(i64 %t7425, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7431 = load i64, ptr @"scheme.base:%ht-load-factor"
  %t7432 = or i64 %t7431, %t7379
  %t7433 = and i64 %t7432, 7
  %t7434 = icmp eq i64 %t7433, 0
  br i1 %t7434, label %fixfast1602, label %fixslow1603
fixfast1602:
  %t7435 = ashr i64 %t7431, 3
  %t7436 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t7435, i64 %t7379)
  %t7437 = extractvalue {i64, i1} %t7436, 0
  %t7438 = extractvalue {i64, i1} %t7436, 1
  br i1 %t7438, label %fixslow1603, label %fixmerge1604
fixslow1603:
  %t7439 = call i64 @rt_mul(i64 %t7431, i64 %t7379)
  br label %fixmerge1604
fixmerge1604:
  %t7440 = phi i64 [ %t7437, %fixfast1602 ], [ %t7439, %fixslow1603 ]
  %t7441 = or i64 %t7440, %t7430
  %t7442 = and i64 %t7441, 7
  %t7443 = icmp eq i64 %t7442, 0
  br i1 %t7443, label %fixfast1605, label %fixslow1606
fixfast1605:
  %t7444 = icmp slt i64 %t7440, %t7430
  %t7445 = select i1 %t7444, i64 257, i64 1
  br label %fixmerge1607
fixslow1606:
  %t7446 = call i64 @rt_lt(i64 %t7440, i64 %t7430)
  br label %fixmerge1607
fixmerge1607:
  %t7447 = phi i64 [ %t7445, %fixfast1605 ], [ %t7446, %fixslow1606 ]
  %t7448 = icmp ne i64 %t7447, 1
  br i1 %t7448, label %then1608, label %else1609
then1608:
  %t7449 = load i64, ptr @"scheme.base:%ht-grow!"
  call void @rt_check_callable(i64 %t7449)
  %t7450 = and i64 %t7449, -8
  %t7451 = inttoptr i64 %t7450 to ptr
  %t7452 = load i64, ptr %t7451
  %t7453 = inttoptr i64 %t7452 to ptr
  %t7454 = musttail call fastcc i64 %t7453(i64 %t7449, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7454
else1609:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-delete!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7459 = icmp eq i64 %argc, 2
  br i1 %t7459, label %argok1611, label %arityerr1610
arityerr1610:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1611:
  %t7460 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7460)
  %t7461 = and i64 %t7460, -8
  %t7462 = inttoptr i64 %t7461 to ptr
  %t7463 = load i64, ptr %t7462
  %t7464 = inttoptr i64 %t7463 to ptr
  %t7465 = call fastcc i64%t7464(i64 %t7460, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7466 = call i64 @rt_vector_length(i64 %t7465)
  %t7467 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t7467)
  %t7468 = and i64 %t7467, -8
  %t7469 = inttoptr i64 %t7468 to ptr
  %t7470 = load i64, ptr %t7469
  %t7471 = inttoptr i64 %t7470 to ptr
  %t7472 = call fastcc i64%t7471(i64 %t7467, i64 3, i64 %a0, i64 %a1, i64 %t7466, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7473 = call i64 @rt_vector_ref(i64 %t7465, i64 %t7472)
  %t7474 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t7474)
  %t7475 = and i64 %t7474, -8
  %t7476 = inttoptr i64 %t7475 to ptr
  %t7477 = load i64, ptr %t7476
  %t7478 = inttoptr i64 %t7477 to ptr
  %t7479 = call fastcc i64%t7478(i64 %t7474, i64 3, i64 %a0, i64 %a1, i64 %t7473, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7480 = icmp ne i64 %t7479, 1
  br i1 %t7480, label %then1612, label %else1613
then1612:
  %t7481 = load i64, ptr @"scheme.base:%ht-remove"
  call void @rt_check_callable(i64 %t7481)
  %t7482 = and i64 %t7481, -8
  %t7483 = inttoptr i64 %t7482 to ptr
  %t7484 = load i64, ptr %t7483
  %t7485 = inttoptr i64 %t7484 to ptr
  %t7486 = call fastcc i64%t7485(i64 %t7481, i64 3, i64 %a0, i64 %a1, i64 %t7473, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7487 = call i64 @rt_vector_set(i64 %t7465, i64 %t7472, i64 %t7486)
  %t7488 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t7488)
  %t7489 = and i64 %t7488, -8
  %t7490 = inttoptr i64 %t7489 to ptr
  %t7491 = load i64, ptr %t7490
  %t7492 = inttoptr i64 %t7491 to ptr
  %t7493 = call fastcc i64%t7492(i64 %t7488, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7494 = or i64 %t7493, 8
  %t7495 = and i64 %t7494, 7
  %t7496 = icmp eq i64 %t7495, 0
  br i1 %t7496, label %fixfast1614, label %fixslow1615
fixfast1614:
  %t7497 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t7493, i64 8)
  %t7498 = extractvalue {i64, i1} %t7497, 0
  %t7499 = extractvalue {i64, i1} %t7497, 1
  br i1 %t7499, label %fixslow1615, label %fixmerge1616
fixslow1615:
  %t7500 = call i64 @rt_sub(i64 %t7493, i64 8)
  br label %fixmerge1616
fixmerge1616:
  %t7501 = phi i64 [ %t7498, %fixfast1614 ], [ %t7500, %fixslow1615 ]
  %t7502 = load i64, ptr @"scheme.base:%ht-set-count!"
  call void @rt_check_callable(i64 %t7502)
  %t7503 = and i64 %t7502, -8
  %t7504 = inttoptr i64 %t7503 to ptr
  %t7505 = load i64, ptr %t7504
  %t7506 = inttoptr i64 %t7505 to ptr
  %t7507 = musttail call fastcc i64 %t7506(i64 %t7502, i64 2, i64 %a0, i64 %t7501, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7507
else1613:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_1224"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7512 = icmp eq i64 %argc, 1
  br i1 %t7512, label %argok1618, label %arityerr1617
arityerr1617:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1618:
  %t7513 = call i64 @rt_null_p(i64 %a0)
  %t7514 = icmp ne i64 %t7513, 1
  br i1 %t7514, label %then1619, label %else1620
then1619:
  ret i64 1
else1620:
  %t7515 = call i64 @rt_car(i64 %a0)
  %t7516 = and i64 %self, -8
  %t7517 = inttoptr i64 %t7516 to ptr
  %t7518 = getelementptr i64, ptr %t7517, i64 1
  %t7519 = load i64, ptr %t7518
  %t7520 = call i64 @rt_car(i64 %t7515)
  %t7521 = and i64 %self, -8
  %t7522 = inttoptr i64 %t7521 to ptr
  %t7523 = getelementptr i64, ptr %t7522, i64 2
  %t7524 = load i64, ptr %t7523
  %t7525 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t7525)
  %t7526 = and i64 %t7525, -8
  %t7527 = inttoptr i64 %t7526 to ptr
  %t7528 = load i64, ptr %t7527
  %t7529 = inttoptr i64 %t7528 to ptr
  %t7530 = call fastcc i64%t7529(i64 %t7525, i64 3, i64 %t7519, i64 %t7520, i64 %t7524, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7531 = and i64 %self, -8
  %t7532 = inttoptr i64 %t7531 to ptr
  %t7533 = getelementptr i64, ptr %t7532, i64 3
  %t7534 = load i64, ptr %t7533
  %t7535 = and i64 %self, -8
  %t7536 = inttoptr i64 %t7535 to ptr
  %t7537 = getelementptr i64, ptr %t7536, i64 3
  %t7538 = load i64, ptr %t7537
  %t7539 = call i64 @rt_vector_ref(i64 %t7538, i64 %t7530)
  %t7540 = call i64 @rt_cons(i64 %t7515, i64 %t7539)
  %t7541 = call i64 @rt_vector_set(i64 %t7534, i64 %t7530, i64 %t7540)
  %t7542 = call i64 @rt_cdr(i64 %a0)
  %t7543 = musttail call fastcc i64 @"scheme.base:code_1224"(i64 %self, i64 1, i64 %t7542, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7543
}

define fastcc i64 @"scheme.base:code_1222"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7544 = icmp eq i64 %argc, 1
  br i1 %t7544, label %argok1622, label %arityerr1621
arityerr1621:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1622:
  %t7545 = and i64 %self, -8
  %t7546 = inttoptr i64 %t7545 to ptr
  %t7547 = getelementptr i64, ptr %t7546, i64 1
  %t7548 = load i64, ptr %t7547
  %t7549 = call i64 @rt_vector_length(i64 %t7548)
  %t7550 = or i64 %a0, %t7549
  %t7551 = and i64 %t7550, 7
  %t7552 = icmp eq i64 %t7551, 0
  br i1 %t7552, label %fixfast1623, label %fixslow1624
fixfast1623:
  %t7553 = icmp slt i64 %a0, %t7549
  %t7554 = select i1 %t7553, i64 257, i64 1
  br label %fixmerge1625
fixslow1624:
  %t7555 = call i64 @rt_lt(i64 %a0, i64 %t7549)
  br label %fixmerge1625
fixmerge1625:
  %t7556 = phi i64 [ %t7554, %fixfast1623 ], [ %t7555, %fixslow1624 ]
  %t7557 = icmp ne i64 %t7556, 1
  br i1 %t7557, label %then1626, label %else1627
then1626:
  %t7558 = call ptr @rt_alloc_words(i64 5)
  %t7559 = ptrtoint ptr %t7558 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1224" to i64), ptr %t7558
  %t7560 = or i64 %t7559, 4
  %t7561 = and i64 %self, -8
  %t7562 = inttoptr i64 %t7561 to ptr
  %t7563 = getelementptr i64, ptr %t7562, i64 2
  %t7564 = load i64, ptr %t7563
  %t7565 = getelementptr i64, ptr %t7558, i64 1
  store i64 %t7564, ptr %t7565
  %t7566 = and i64 %self, -8
  %t7567 = inttoptr i64 %t7566 to ptr
  %t7568 = getelementptr i64, ptr %t7567, i64 3
  %t7569 = load i64, ptr %t7568
  %t7570 = getelementptr i64, ptr %t7558, i64 2
  store i64 %t7569, ptr %t7570
  %t7571 = and i64 %self, -8
  %t7572 = inttoptr i64 %t7571 to ptr
  %t7573 = getelementptr i64, ptr %t7572, i64 4
  %t7574 = load i64, ptr %t7573
  %t7575 = getelementptr i64, ptr %t7558, i64 3
  store i64 %t7574, ptr %t7575
  %t7576 = getelementptr i64, ptr %t7558, i64 4
  store i64 %t7560, ptr %t7576
  %t7577 = and i64 %self, -8
  %t7578 = inttoptr i64 %t7577 to ptr
  %t7579 = getelementptr i64, ptr %t7578, i64 1
  %t7580 = load i64, ptr %t7579
  %t7581 = call i64 @rt_vector_ref(i64 %t7580, i64 %a0)
  %t7582 = call fastcc i64 @"scheme.base:code_1224"(i64 %t7560, i64 1, i64 %t7581, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7583 = or i64 %a0, 8
  %t7584 = and i64 %t7583, 7
  %t7585 = icmp eq i64 %t7584, 0
  br i1 %t7585, label %fixfast1628, label %fixslow1629
fixfast1628:
  %t7586 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t7587 = extractvalue {i64, i1} %t7586, 0
  %t7588 = extractvalue {i64, i1} %t7586, 1
  br i1 %t7588, label %fixslow1629, label %fixmerge1630
fixslow1629:
  %t7589 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1630
fixmerge1630:
  %t7590 = phi i64 [ %t7587, %fixfast1628 ], [ %t7589, %fixslow1629 ]
  %t7591 = musttail call fastcc i64 @"scheme.base:code_1222"(i64 %self, i64 1, i64 %t7590, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7591
else1627:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%ht-grow!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7592 = icmp eq i64 %argc, 1
  br i1 %t7592, label %argok1632, label %arityerr1631
arityerr1631:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1632:
  %t7593 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7593)
  %t7594 = and i64 %t7593, -8
  %t7595 = inttoptr i64 %t7594 to ptr
  %t7596 = load i64, ptr %t7595
  %t7597 = inttoptr i64 %t7596 to ptr
  %t7598 = call fastcc i64%t7597(i64 %t7593, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7599 = call i64 @rt_vector_length(i64 %t7598)
  %t7600 = or i64 16, %t7599
  %t7601 = and i64 %t7600, 7
  %t7602 = icmp eq i64 %t7601, 0
  br i1 %t7602, label %fixfast1633, label %fixslow1634
fixfast1633:
  %t7603 = ashr i64 16, 3
  %t7604 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t7603, i64 %t7599)
  %t7605 = extractvalue {i64, i1} %t7604, 0
  %t7606 = extractvalue {i64, i1} %t7604, 1
  br i1 %t7606, label %fixslow1634, label %fixmerge1635
fixslow1634:
  %t7607 = call i64 @rt_mul(i64 16, i64 %t7599)
  br label %fixmerge1635
fixmerge1635:
  %t7608 = phi i64 [ %t7605, %fixfast1633 ], [ %t7607, %fixslow1634 ]
  %t7609 = call i64 @rt_make_vector(i64 %t7608, i64 2)
  %t7610 = call ptr @rt_alloc_words(i64 6)
  %t7611 = ptrtoint ptr %t7610 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1222" to i64), ptr %t7610
  %t7612 = or i64 %t7611, 4
  %t7613 = getelementptr i64, ptr %t7610, i64 1
  store i64 %t7598, ptr %t7613
  %t7614 = getelementptr i64, ptr %t7610, i64 2
  store i64 %a0, ptr %t7614
  %t7615 = getelementptr i64, ptr %t7610, i64 3
  store i64 %t7608, ptr %t7615
  %t7616 = getelementptr i64, ptr %t7610, i64 4
  store i64 %t7609, ptr %t7616
  %t7617 = getelementptr i64, ptr %t7610, i64 5
  store i64 %t7612, ptr %t7617
  %t7618 = call fastcc i64 @"scheme.base:code_1222"(i64 %t7612, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7619 = load i64, ptr @"scheme.base:%ht-set-buckets!"
  call void @rt_check_callable(i64 %t7619)
  %t7620 = and i64 %t7619, -8
  %t7621 = inttoptr i64 %t7620 to ptr
  %t7622 = load i64, ptr %t7621
  %t7623 = inttoptr i64 %t7622 to ptr
  %t7624 = musttail call fastcc i64 %t7623(i64 %t7619, i64 2, i64 %a0, i64 %t7609, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7624
}

define fastcc i64 @"scheme.base:code:hash-table-size"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7629 = icmp eq i64 %argc, 1
  br i1 %t7629, label %argok1637, label %arityerr1636
arityerr1636:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1637:
  %t7630 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t7630)
  %t7631 = and i64 %t7630, -8
  %t7632 = inttoptr i64 %t7631 to ptr
  %t7633 = load i64, ptr %t7632
  %t7634 = inttoptr i64 %t7633 to ptr
  %t7635 = musttail call fastcc i64 %t7634(i64 %t7630, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7635
}

define fastcc i64 @"scheme.base:code:%ht-fold-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7640 = icmp eq i64 %argc, 2
  br i1 %t7640, label %argok1639, label %arityerr1638
arityerr1638:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1639:
  %t7641 = call i64 @rt_null_p(i64 %a0)
  %t7642 = icmp ne i64 %t7641, 1
  br i1 %t7642, label %then1640, label %else1641
then1640:
  ret i64 %a1
else1641:
  %t7643 = call i64 @rt_car(i64 %a0)
  %t7644 = call i64 @rt_car(i64 %t7643)
  %t7645 = call i64 @rt_car(i64 %a0)
  %t7646 = call i64 @rt_cdr(i64 %t7645)
  %t7647 = call i64 @rt_cons(i64 %t7644, i64 %t7646)
  %t7648 = call i64 @rt_cdr(i64 %a0)
  %t7649 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  call void @rt_check_callable(i64 %t7649)
  %t7650 = and i64 %t7649, -8
  %t7651 = inttoptr i64 %t7650 to ptr
  %t7652 = load i64, ptr %t7651
  %t7653 = inttoptr i64 %t7652 to ptr
  %t7654 = call fastcc i64%t7653(i64 %t7649, i64 2, i64 %t7648, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7655 = call i64 @rt_cons(i64 %t7647, i64 %t7654)
  ret i64 %t7655
}

define fastcc i64 @"scheme.base:code_1241"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7660 = icmp eq i64 %argc, 2
  br i1 %t7660, label %argok1643, label %arityerr1642
arityerr1642:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1643:
  %t7661 = and i64 %self, -8
  %t7662 = inttoptr i64 %t7661 to ptr
  %t7663 = getelementptr i64, ptr %t7662, i64 1
  %t7664 = load i64, ptr %t7663
  %t7665 = call i64 @rt_vector_length(i64 %t7664)
  %t7666 = or i64 %a0, %t7665
  %t7667 = and i64 %t7666, 7
  %t7668 = icmp eq i64 %t7667, 0
  br i1 %t7668, label %fixfast1644, label %fixslow1645
fixfast1644:
  %t7669 = icmp slt i64 %a0, %t7665
  %t7670 = select i1 %t7669, i64 257, i64 1
  br label %fixmerge1646
fixslow1645:
  %t7671 = call i64 @rt_lt(i64 %a0, i64 %t7665)
  br label %fixmerge1646
fixmerge1646:
  %t7672 = phi i64 [ %t7670, %fixfast1644 ], [ %t7671, %fixslow1645 ]
  %t7673 = icmp ne i64 %t7672, 1
  br i1 %t7673, label %then1647, label %else1648
then1647:
  %t7674 = or i64 %a0, 8
  %t7675 = and i64 %t7674, 7
  %t7676 = icmp eq i64 %t7675, 0
  br i1 %t7676, label %fixfast1649, label %fixslow1650
fixfast1649:
  %t7677 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t7678 = extractvalue {i64, i1} %t7677, 0
  %t7679 = extractvalue {i64, i1} %t7677, 1
  br i1 %t7679, label %fixslow1650, label %fixmerge1651
fixslow1650:
  %t7680 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1651
fixmerge1651:
  %t7681 = phi i64 [ %t7678, %fixfast1649 ], [ %t7680, %fixslow1650 ]
  %t7682 = and i64 %self, -8
  %t7683 = inttoptr i64 %t7682 to ptr
  %t7684 = getelementptr i64, ptr %t7683, i64 1
  %t7685 = load i64, ptr %t7684
  %t7686 = call i64 @rt_vector_ref(i64 %t7685, i64 %a0)
  %t7687 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  call void @rt_check_callable(i64 %t7687)
  %t7688 = and i64 %t7687, -8
  %t7689 = inttoptr i64 %t7688 to ptr
  %t7690 = load i64, ptr %t7689
  %t7691 = inttoptr i64 %t7690 to ptr
  %t7692 = call fastcc i64%t7691(i64 %t7687, i64 2, i64 %t7686, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7693 = musttail call fastcc i64 @"scheme.base:code_1241"(i64 %self, i64 2, i64 %t7681, i64 %t7692, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7693
else1648:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:hash-table->alist"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7694 = icmp eq i64 %argc, 1
  br i1 %t7694, label %argok1653, label %arityerr1652
arityerr1652:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1653:
  %t7695 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7695)
  %t7696 = and i64 %t7695, -8
  %t7697 = inttoptr i64 %t7696 to ptr
  %t7698 = load i64, ptr %t7697
  %t7699 = inttoptr i64 %t7698 to ptr
  %t7700 = call fastcc i64%t7699(i64 %t7695, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7701 = call ptr @rt_alloc_words(i64 3)
  %t7702 = ptrtoint ptr %t7701 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1241" to i64), ptr %t7701
  %t7703 = or i64 %t7702, 4
  %t7704 = getelementptr i64, ptr %t7701, i64 1
  store i64 %t7700, ptr %t7704
  %t7705 = getelementptr i64, ptr %t7701, i64 2
  store i64 %t7703, ptr %t7705
  %t7706 = musttail call fastcc i64 @"scheme.base:code_1241"(i64 %t7703, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7706
}

define fastcc i64 @"scheme.base:code_1246"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7711 = icmp eq i64 %argc, 1
  br i1 %t7711, label %argok1655, label %arityerr1654
arityerr1654:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1655:
  %t7712 = call i64 @rt_car(i64 %a0)
  ret i64 %t7712
}

define fastcc i64 @"scheme.base:code:hash-table-keys"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7713 = icmp eq i64 %argc, 1
  br i1 %t7713, label %argok1657, label %arityerr1656
arityerr1656:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1657:
  %t7714 = call ptr @rt_alloc_words(i64 1)
  %t7715 = ptrtoint ptr %t7714 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1246" to i64), ptr %t7714
  %t7716 = or i64 %t7715, 4
  %t7717 = load i64, ptr @"scheme.base:hash-table->alist"
  call void @rt_check_callable(i64 %t7717)
  %t7718 = and i64 %t7717, -8
  %t7719 = inttoptr i64 %t7718 to ptr
  %t7720 = load i64, ptr %t7719
  %t7721 = inttoptr i64 %t7720 to ptr
  %t7722 = call fastcc i64%t7721(i64 %t7717, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7723 = load i64, ptr @"scheme.base:map"
  call void @rt_check_callable(i64 %t7723)
  %t7724 = and i64 %t7723, -8
  %t7725 = inttoptr i64 %t7724 to ptr
  %t7726 = load i64, ptr %t7725
  %t7727 = inttoptr i64 %t7726 to ptr
  %t7728 = musttail call fastcc i64 %t7727(i64 %t7723, i64 2, i64 %t7716, i64 %t7722, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7728
}

define fastcc i64 @"scheme.base:code_1251"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7733 = icmp eq i64 %argc, 1
  br i1 %t7733, label %argok1659, label %arityerr1658
arityerr1658:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1659:
  %t7734 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t7734
}

define fastcc i64 @"scheme.base:code:hash-table-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7735 = icmp eq i64 %argc, 1
  br i1 %t7735, label %argok1661, label %arityerr1660
arityerr1660:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1661:
  %t7736 = call ptr @rt_alloc_words(i64 1)
  %t7737 = ptrtoint ptr %t7736 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1251" to i64), ptr %t7736
  %t7738 = or i64 %t7737, 4
  %t7739 = load i64, ptr @"scheme.base:hash-table->alist"
  call void @rt_check_callable(i64 %t7739)
  %t7740 = and i64 %t7739, -8
  %t7741 = inttoptr i64 %t7740 to ptr
  %t7742 = load i64, ptr %t7741
  %t7743 = inttoptr i64 %t7742 to ptr
  %t7744 = call fastcc i64%t7743(i64 %t7739, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7745 = load i64, ptr @"scheme.base:map"
  call void @rt_check_callable(i64 %t7745)
  %t7746 = and i64 %t7745, -8
  %t7747 = inttoptr i64 %t7746 to ptr
  %t7748 = load i64, ptr %t7747
  %t7749 = inttoptr i64 %t7748 to ptr
  %t7750 = musttail call fastcc i64 %t7749(i64 %t7745, i64 2, i64 %t7738, i64 %t7744, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7750
}

define fastcc i64 @"scheme.base:code:rd-report"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7755 = icmp eq i64 %argc, 3
  br i1 %t7755, label %argok1663, label %arityerr1662
arityerr1662:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1663:
  %t7756 = call i64 @rt_car(i64 %a2)
  %t7757 = call i64 @rt_cdr(i64 %a2)
  %t7758 = load i64, ptr @"emit.internal:rd-fail-pos"
  %t7759 = call fastcc i64 @"emit.internal:code:rd-fail-pos"(i64 %t7758, i64 1, i64 %t7757, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7760 = call i64 @rt_intern(ptr @.str.sym.38)
  %t7761 = call i64 @rt_eq_p(i64 %t7756, i64 %t7760)
  %t7762 = icmp ne i64 %t7761, 1
  br i1 %t7762, label %then1664, label %else1665
then1664:
  %t7763 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7764 = call i64 @rt_make_string(ptr @.str.lit.39, i64 45)
  %t7765 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7765)
  %t7766 = and i64 %t7765, -8
  %t7767 = inttoptr i64 %t7766 to ptr
  %t7768 = load i64, ptr %t7767
  %t7769 = inttoptr i64 %t7768 to ptr
  %t7770 = musttail call fastcc i64 %t7769(i64 %t7765, i64 3, i64 %t7763, i64 %t7764, i64 %t7759, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7770
else1665:
  %t7771 = call i64 @rt_intern(ptr @.str.sym.40)
  %t7772 = call i64 @rt_eq_p(i64 %t7756, i64 %t7771)
  %t7773 = icmp ne i64 %t7772, 1
  br i1 %t7773, label %then1666, label %else1667
then1666:
  %t7774 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7775 = call i64 @rt_make_string(ptr @.str.lit.41, i64 41)
  %t7776 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7776)
  %t7777 = and i64 %t7776, -8
  %t7778 = inttoptr i64 %t7777 to ptr
  %t7779 = load i64, ptr %t7778
  %t7780 = inttoptr i64 %t7779 to ptr
  %t7781 = musttail call fastcc i64 %t7780(i64 %t7776, i64 3, i64 %t7774, i64 %t7775, i64 %t7759, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7781
else1667:
  %t7782 = call i64 @rt_intern(ptr @.str.sym.42)
  %t7783 = call i64 @rt_eq_p(i64 %t7756, i64 %t7782)
  %t7784 = icmp ne i64 %t7783, 1
  br i1 %t7784, label %then1668, label %else1669
then1668:
  %t7785 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7786 = call i64 @rt_make_string(ptr @.str.lit.43, i64 13)
  %t7787 = call i64 @rt_string_ref(i64 %a0, i64 %t7759)
  %t7788 = call i64 @rt_char_to_integer(i64 %t7787)
  %t7789 = or i64 %t7788, 728
  %t7790 = and i64 %t7789, 7
  %t7791 = icmp eq i64 %t7790, 0
  br i1 %t7791, label %fixfast1670, label %fixslow1671
fixfast1670:
  %t7792 = icmp eq i64 %t7788, 728
  %t7793 = select i1 %t7792, i64 257, i64 1
  br label %fixmerge1672
fixslow1671:
  %t7794 = call i64 @rt_num_eq(i64 %t7788, i64 728)
  br label %fixmerge1672
fixmerge1672:
  %t7795 = phi i64 [ %t7793, %fixfast1670 ], [ %t7794, %fixslow1671 ]
  %t7796 = icmp ne i64 %t7795, 1
  br i1 %t7796, label %then1673, label %else1674
then1673:
  %t7797 = call i64 @rt_make_string(ptr @.str.lit.44, i64 6)
  br label %merge1675
else1674:
  %t7798 = or i64 %t7788, 280
  %t7799 = and i64 %t7798, 7
  %t7800 = icmp eq i64 %t7799, 0
  br i1 %t7800, label %fixfast1676, label %fixslow1677
fixfast1676:
  %t7801 = icmp eq i64 %t7788, 280
  %t7802 = select i1 %t7801, i64 257, i64 1
  br label %fixmerge1678
fixslow1677:
  %t7803 = call i64 @rt_num_eq(i64 %t7788, i64 280)
  br label %fixmerge1678
fixmerge1678:
  %t7804 = phi i64 [ %t7802, %fixfast1676 ], [ %t7803, %fixslow1677 ]
  %t7805 = icmp ne i64 %t7804, 1
  br i1 %t7805, label %then1679, label %else1680
then1679:
  %t7806 = or i64 %t7759, 8
  %t7807 = and i64 %t7806, 7
  %t7808 = icmp eq i64 %t7807, 0
  br i1 %t7808, label %fixfast1682, label %fixslow1683
fixfast1682:
  %t7809 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t7759, i64 8)
  %t7810 = extractvalue {i64, i1} %t7809, 0
  %t7811 = extractvalue {i64, i1} %t7809, 1
  br i1 %t7811, label %fixslow1683, label %fixmerge1684
fixslow1683:
  %t7812 = call i64 @rt_add(i64 %t7759, i64 8)
  br label %fixmerge1684
fixmerge1684:
  %t7813 = phi i64 [ %t7810, %fixfast1682 ], [ %t7812, %fixslow1683 ]
  %t7814 = or i64 %t7813, %a1
  %t7815 = and i64 %t7814, 7
  %t7816 = icmp eq i64 %t7815, 0
  br i1 %t7816, label %fixfast1685, label %fixslow1686
fixfast1685:
  %t7817 = icmp slt i64 %t7813, %a1
  %t7818 = select i1 %t7817, i64 257, i64 1
  br label %fixmerge1687
fixslow1686:
  %t7819 = call i64 @rt_lt(i64 %t7813, i64 %a1)
  br label %fixmerge1687
fixmerge1687:
  %t7820 = phi i64 [ %t7818, %fixfast1685 ], [ %t7819, %fixslow1686 ]
  %t7821 = icmp ne i64 %t7820, 1
  br i1 %t7821, label %then1688, label %else1689
then1688:
  %t7822 = or i64 %t7759, 8
  %t7823 = and i64 %t7822, 7
  %t7824 = icmp eq i64 %t7823, 0
  br i1 %t7824, label %fixfast1691, label %fixslow1692
fixfast1691:
  %t7825 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t7759, i64 8)
  %t7826 = extractvalue {i64, i1} %t7825, 0
  %t7827 = extractvalue {i64, i1} %t7825, 1
  br i1 %t7827, label %fixslow1692, label %fixmerge1693
fixslow1692:
  %t7828 = call i64 @rt_add(i64 %t7759, i64 8)
  br label %fixmerge1693
fixmerge1693:
  %t7829 = phi i64 [ %t7826, %fixfast1691 ], [ %t7828, %fixslow1692 ]
  %t7830 = call i64 @rt_string_ref(i64 %a0, i64 %t7829)
  %t7831 = call i64 @rt_char_to_integer(i64 %t7830)
  %t7832 = or i64 %t7831, 936
  %t7833 = and i64 %t7832, 7
  %t7834 = icmp eq i64 %t7833, 0
  br i1 %t7834, label %fixfast1694, label %fixslow1695
fixfast1694:
  %t7835 = icmp eq i64 %t7831, 936
  %t7836 = select i1 %t7835, i64 257, i64 1
  br label %fixmerge1696
fixslow1695:
  %t7837 = call i64 @rt_num_eq(i64 %t7831, i64 936)
  br label %fixmerge1696
fixmerge1696:
  %t7838 = phi i64 [ %t7836, %fixfast1694 ], [ %t7837, %fixslow1695 ]
  br label %merge1690
else1689:
  br label %merge1690
merge1690:
  %t7839 = phi i64 [ %t7838, %fixmerge1696 ], [ 1, %else1689 ]
  br label %merge1681
else1680:
  br label %merge1681
merge1681:
  %t7840 = phi i64 [ %t7839, %merge1690 ], [ 1, %else1680 ]
  %t7841 = icmp ne i64 %t7840, 1
  br i1 %t7841, label %then1697, label %else1698
then1697:
  %t7842 = call i64 @rt_make_string(ptr @.str.lit.45, i64 15)
  br label %merge1699
else1698:
  %t7843 = or i64 %t7788, 280
  %t7844 = and i64 %t7843, 7
  %t7845 = icmp eq i64 %t7844, 0
  br i1 %t7845, label %fixfast1700, label %fixslow1701
fixfast1700:
  %t7846 = icmp eq i64 %t7788, 280
  %t7847 = select i1 %t7846, i64 257, i64 1
  br label %fixmerge1702
fixslow1701:
  %t7848 = call i64 @rt_num_eq(i64 %t7788, i64 280)
  br label %fixmerge1702
fixmerge1702:
  %t7849 = phi i64 [ %t7847, %fixfast1700 ], [ %t7848, %fixslow1701 ]
  %t7850 = icmp ne i64 %t7849, 1
  br i1 %t7850, label %then1703, label %else1704
then1703:
  %t7851 = call i64 @rt_make_string(ptr @.str.lit.46, i64 9)
  br label %merge1705
else1704:
  %t7852 = call i64 @rt_make_string(ptr @.str.lit.47, i64 6)
  br label %merge1705
merge1705:
  %t7853 = phi i64 [ %t7851, %then1703 ], [ %t7852, %else1704 ]
  br label %merge1699
merge1699:
  %t7854 = phi i64 [ %t7842, %then1697 ], [ %t7853, %merge1705 ]
  br label %merge1675
merge1675:
  %t7855 = phi i64 [ %t7797, %then1673 ], [ %t7854, %merge1699 ]
  %t7856 = call i64 @rt_string_append(i64 %t7786, i64 %t7855)
  %t7857 = call i64 @rt_make_string(ptr @.str.lit.48, i64 16)
  %t7858 = call i64 @rt_string_append(i64 %t7856, i64 %t7857)
  %t7859 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7859)
  %t7860 = and i64 %t7859, -8
  %t7861 = inttoptr i64 %t7860 to ptr
  %t7862 = load i64, ptr %t7861
  %t7863 = inttoptr i64 %t7862 to ptr
  %t7864 = musttail call fastcc i64 %t7863(i64 %t7859, i64 3, i64 %t7785, i64 %t7858, i64 %t7759, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7864
else1669:
  %t7865 = call i64 @rt_intern(ptr @.str.sym.49)
  %t7866 = call i64 @rt_eq_p(i64 %t7756, i64 %t7865)
  %t7867 = icmp ne i64 %t7866, 1
  br i1 %t7867, label %then1706, label %else1707
then1706:
  %t7868 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7869 = call i64 @rt_make_string(ptr @.str.lit.50, i64 37)
  %t7870 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7870)
  %t7871 = and i64 %t7870, -8
  %t7872 = inttoptr i64 %t7871 to ptr
  %t7873 = load i64, ptr %t7872
  %t7874 = inttoptr i64 %t7873 to ptr
  %t7875 = musttail call fastcc i64 %t7874(i64 %t7870, i64 3, i64 %t7868, i64 %t7869, i64 %t7759, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7875
else1707:
  %t7876 = call i64 @rt_intern(ptr @.str.sym.51)
  %t7877 = call i64 @rt_eq_p(i64 %t7756, i64 %t7876)
  %t7878 = icmp ne i64 %t7877, 1
  br i1 %t7878, label %then1708, label %else1709
then1708:
  %t7879 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7880 = call i64 @rt_make_string(ptr @.str.lit.52, i64 22)
  %t7881 = load i64, ptr @"emit.internal:rd-token-at"
  %t7882 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t7881, i64 3, i64 %a0, i64 %a1, i64 %t7759, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7883 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7883)
  %t7884 = and i64 %t7883, -8
  %t7885 = inttoptr i64 %t7884 to ptr
  %t7886 = load i64, ptr %t7885
  %t7887 = inttoptr i64 %t7886 to ptr
  %t7888 = musttail call fastcc i64 %t7887(i64 %t7883, i64 3, i64 %t7879, i64 %t7880, i64 %t7882, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7888
else1709:
  %t7889 = call i64 @rt_intern(ptr @.str.sym.53)
  %t7890 = call i64 @rt_eq_p(i64 %t7756, i64 %t7889)
  %t7891 = icmp ne i64 %t7890, 1
  br i1 %t7891, label %then1710, label %else1711
then1710:
  %t7892 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7893 = call i64 @rt_make_string(ptr @.str.lit.54, i64 44)
  %t7894 = load i64, ptr @"emit.internal:rd-token-at"
  %t7895 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t7894, i64 3, i64 %a0, i64 %a1, i64 %t7759, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7896 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7896)
  %t7897 = and i64 %t7896, -8
  %t7898 = inttoptr i64 %t7897 to ptr
  %t7899 = load i64, ptr %t7898
  %t7900 = inttoptr i64 %t7899 to ptr
  %t7901 = musttail call fastcc i64 %t7900(i64 %t7896, i64 3, i64 %t7892, i64 %t7893, i64 %t7895, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7901
else1711:
  %t7902 = call i64 @rt_intern(ptr @.str.sym.55)
  %t7903 = call i64 @rt_eq_p(i64 %t7756, i64 %t7902)
  %t7904 = icmp ne i64 %t7903, 1
  br i1 %t7904, label %then1712, label %else1713
then1712:
  %t7905 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7906 = call i64 @rt_make_string(ptr @.str.lit.56, i64 21)
  %t7907 = load i64, ptr @"emit.internal:rd-token-at"
  %t7908 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t7907, i64 3, i64 %a0, i64 %a1, i64 %t7759, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7909 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7909)
  %t7910 = and i64 %t7909, -8
  %t7911 = inttoptr i64 %t7910 to ptr
  %t7912 = load i64, ptr %t7911
  %t7913 = inttoptr i64 %t7912 to ptr
  %t7914 = musttail call fastcc i64 %t7913(i64 %t7909, i64 3, i64 %t7905, i64 %t7906, i64 %t7908, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7914
else1713:
  %t7915 = call i64 @rt_intern(ptr @.str.sym.57)
  %t7916 = call i64 @rt_eq_p(i64 %t7756, i64 %t7915)
  %t7917 = icmp ne i64 %t7916, 1
  br i1 %t7917, label %then1714, label %else1715
then1714:
  %t7918 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7919 = call i64 @rt_make_string(ptr @.str.lit.58, i64 47)
  %t7920 = load i64, ptr @"emit.internal:rd-token-at"
  %t7921 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t7920, i64 3, i64 %a0, i64 %a1, i64 %t7759, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7922 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7922)
  %t7923 = and i64 %t7922, -8
  %t7924 = inttoptr i64 %t7923 to ptr
  %t7925 = load i64, ptr %t7924
  %t7926 = inttoptr i64 %t7925 to ptr
  %t7927 = musttail call fastcc i64 %t7926(i64 %t7922, i64 3, i64 %t7918, i64 %t7919, i64 %t7921, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7927
else1715:
  %t7928 = call i64 @rt_intern(ptr @.str.sym.59)
  %t7929 = call i64 @rt_eq_p(i64 %t7756, i64 %t7928)
  %t7930 = icmp ne i64 %t7929, 1
  br i1 %t7930, label %then1716, label %else1717
then1716:
  %t7931 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7932 = call i64 @rt_make_string(ptr @.str.lit.60, i64 55)
  %t7933 = load i64, ptr @"emit.internal:rd-token-at"
  %t7934 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t7933, i64 3, i64 %a0, i64 %a1, i64 %t7759, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7935 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7935)
  %t7936 = and i64 %t7935, -8
  %t7937 = inttoptr i64 %t7936 to ptr
  %t7938 = load i64, ptr %t7937
  %t7939 = inttoptr i64 %t7938 to ptr
  %t7940 = musttail call fastcc i64 %t7939(i64 %t7935, i64 3, i64 %t7931, i64 %t7932, i64 %t7934, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7940
else1717:
  %t7941 = call i64 @rt_intern(ptr @.str.sym.61)
  %t7942 = call i64 @rt_eq_p(i64 %t7756, i64 %t7941)
  %t7943 = icmp ne i64 %t7942, 1
  br i1 %t7943, label %then1718, label %else1719
then1718:
  %t7944 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7945 = call i64 @rt_make_string(ptr @.str.lit.62, i64 21)
  %t7946 = load i64, ptr @"emit.internal:rd-token-at"
  %t7947 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t7946, i64 3, i64 %a0, i64 %a1, i64 %t7759, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7948 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7948)
  %t7949 = and i64 %t7948, -8
  %t7950 = inttoptr i64 %t7949 to ptr
  %t7951 = load i64, ptr %t7950
  %t7952 = inttoptr i64 %t7951 to ptr
  %t7953 = musttail call fastcc i64 %t7952(i64 %t7948, i64 3, i64 %t7944, i64 %t7945, i64 %t7947, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7953
else1719:
  %t7954 = call i64 @rt_intern(ptr @.str.sym.63)
  %t7955 = call i64 @rt_eq_p(i64 %t7756, i64 %t7954)
  %t7956 = icmp ne i64 %t7955, 1
  br i1 %t7956, label %then1720, label %else1721
then1720:
  %t7957 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7958 = call i64 @rt_make_string(ptr @.str.lit.64, i64 49)
  %t7959 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7959)
  %t7960 = and i64 %t7959, -8
  %t7961 = inttoptr i64 %t7960 to ptr
  %t7962 = load i64, ptr %t7961
  %t7963 = inttoptr i64 %t7962 to ptr
  %t7964 = musttail call fastcc i64 %t7963(i64 %t7959, i64 3, i64 %t7957, i64 %t7958, i64 %t7759, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7964
else1721:
  %t7965 = call i64 @rt_intern(ptr @.str.sym.65)
  %t7966 = call i64 @rt_eq_p(i64 %t7756, i64 %t7965)
  %t7967 = icmp ne i64 %t7966, 1
  br i1 %t7967, label %then1722, label %else1723
then1722:
  %t7968 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7969 = call i64 @rt_make_string(ptr @.str.lit.66, i64 23)
  %t7970 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7970)
  %t7971 = and i64 %t7970, -8
  %t7972 = inttoptr i64 %t7971 to ptr
  %t7973 = load i64, ptr %t7972
  %t7974 = inttoptr i64 %t7973 to ptr
  %t7975 = musttail call fastcc i64 %t7974(i64 %t7970, i64 3, i64 %t7968, i64 %t7969, i64 %t7759, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7975
else1723:
  %t7976 = call i64 @rt_intern(ptr @.str.sym.67)
  %t7977 = call i64 @rt_eq_p(i64 %t7756, i64 %t7976)
  %t7978 = icmp ne i64 %t7977, 1
  br i1 %t7978, label %then1724, label %else1725
then1724:
  %t7979 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7980 = call i64 @rt_make_string(ptr @.str.lit.68, i64 56)
  %t7981 = call i64 @rt_make_string(ptr @.str.lit.69, i64 38)
  %t7982 = call i64 @rt_string_append(i64 %t7980, i64 %t7981)
  %t7983 = load i64, ptr @"emit.internal:rd-token-at"
  %t7984 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t7983, i64 3, i64 %a0, i64 %a1, i64 %t7759, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7985 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7985)
  %t7986 = and i64 %t7985, -8
  %t7987 = inttoptr i64 %t7986 to ptr
  %t7988 = load i64, ptr %t7987
  %t7989 = inttoptr i64 %t7988 to ptr
  %t7990 = musttail call fastcc i64 %t7989(i64 %t7985, i64 3, i64 %t7979, i64 %t7982, i64 %t7984, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7990
else1725:
  %t7991 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7992 = call i64 @rt_make_string(ptr @.str.lit.70, i64 19)
  %t7993 = load i64, ptr @"emit.internal:rd-token-at"
  %t7994 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t7993, i64 3, i64 %a0, i64 %a1, i64 %t7759, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7995 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7995)
  %t7996 = and i64 %t7995, -8
  %t7997 = inttoptr i64 %t7996 to ptr
  %t7998 = load i64, ptr %t7997
  %t7999 = inttoptr i64 %t7998 to ptr
  %t8000 = musttail call fastcc i64 %t7999(i64 %t7995, i64 3, i64 %t7991, i64 %t7992, i64 %t7994, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8000
}

define fastcc i64 @"scheme.base:code:read-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8005 = icmp eq i64 %argc, 1
  br i1 %t8005, label %argok1727, label %arityerr1726
arityerr1726:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1727:
  %t8006 = call i64 @rt_string_length(i64 %a0)
  %t8007 = load i64, ptr @"emit.internal:rd-state"
  %t8008 = call fastcc i64 @"emit.internal:code:rd-state"(i64 %t8007, i64 1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8009 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t8010 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t8009, i64 4, i64 %a0, i64 %t8006, i64 0, i64 %t8008, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8011 = load i64, ptr @"emit.internal:rd-datum"
  %t8012 = call fastcc i64 @"emit.internal:code:rd-datum"(i64 %t8011, i64 4, i64 %a0, i64 %t8006, i64 %t8010, i64 %t8008, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8013 = load i64, ptr @"emit.internal:rd-finish"
  %t8014 = call fastcc i64 @"emit.internal:code:rd-finish"(i64 %t8013, i64 2, i64 %t8008, i64 %t8012, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8015 = call i64 @rt_cdr(i64 %t8014)
  %t8016 = load i64, ptr @"emit.internal:rd-fail?"
  %t8017 = call fastcc i64 @"emit.internal:code:rd-fail?"(i64 %t8016, i64 1, i64 %t8015, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8018 = icmp ne i64 %t8017, 1
  br i1 %t8018, label %then1728, label %else1729
then1728:
  %t8019 = load i64, ptr @"scheme.base:rd-report"
  call void @rt_check_callable(i64 %t8019)
  %t8020 = and i64 %t8019, -8
  %t8021 = inttoptr i64 %t8020 to ptr
  %t8022 = load i64, ptr %t8021
  %t8023 = inttoptr i64 %t8022 to ptr
  %t8024 = musttail call fastcc i64 %t8023(i64 %t8019, i64 3, i64 %a0, i64 %t8006, i64 %t8014, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8024
else1729:
  %t8025 = call i64 @rt_car(i64 %t8014)
  ret i64 %t8025
}

define fastcc i64 @"scheme.base:code:read-all-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8030 = icmp eq i64 %argc, 1
  br i1 %t8030, label %argok1731, label %arityerr1730
arityerr1730:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1731:
  %t8031 = load i64, ptr @"scheme.base:rd-all"
  call void @rt_check_callable(i64 %t8031)
  %t8032 = and i64 %t8031, -8
  %t8033 = inttoptr i64 %t8032 to ptr
  %t8034 = load i64, ptr %t8033
  %t8035 = inttoptr i64 %t8034 to ptr
  %t8036 = musttail call fastcc i64 %t8035(i64 %t8031, i64 2, i64 %a0, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8036
}

define fastcc i64 @"scheme.base:code:read-all-from-string-ci"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8041 = icmp eq i64 %argc, 1
  br i1 %t8041, label %argok1733, label %arityerr1732
arityerr1732:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1733:
  %t8042 = load i64, ptr @"scheme.base:rd-all"
  call void @rt_check_callable(i64 %t8042)
  %t8043 = and i64 %t8042, -8
  %t8044 = inttoptr i64 %t8043 to ptr
  %t8045 = load i64, ptr %t8044
  %t8046 = inttoptr i64 %t8045 to ptr
  %t8047 = musttail call fastcc i64 %t8046(i64 %t8042, i64 2, i64 %a0, i64 257, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8047
}

define fastcc i64 @"scheme.base:code_1355"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8052 = icmp eq i64 %argc, 2
  br i1 %t8052, label %argok1735, label %arityerr1734
arityerr1734:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1735:
  %t8053 = load i64, ptr @"emit.internal:rd-fail?"
  %t8054 = call fastcc i64 @"emit.internal:code:rd-fail?"(i64 %t8053, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8055 = icmp ne i64 %t8054, 1
  br i1 %t8055, label %then1736, label %else1737
then1736:
  %t8056 = and i64 %self, -8
  %t8057 = inttoptr i64 %t8056 to ptr
  %t8058 = getelementptr i64, ptr %t8057, i64 1
  %t8059 = load i64, ptr %t8058
  %t8060 = and i64 %self, -8
  %t8061 = inttoptr i64 %t8060 to ptr
  %t8062 = getelementptr i64, ptr %t8061, i64 2
  %t8063 = load i64, ptr %t8062
  %t8064 = call i64 @rt_intern(ptr @.str.sym.38)
  %t8065 = call i64 @rt_cons(i64 %t8064, i64 %a0)
  %t8066 = load i64, ptr @"scheme.base:rd-report"
  call void @rt_check_callable(i64 %t8066)
  %t8067 = and i64 %t8066, -8
  %t8068 = inttoptr i64 %t8067 to ptr
  %t8069 = load i64, ptr %t8068
  %t8070 = inttoptr i64 %t8069 to ptr
  %t8071 = musttail call fastcc i64 %t8070(i64 %t8066, i64 3, i64 %t8059, i64 %t8063, i64 %t8065, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8071
else1737:
  %t8072 = and i64 %self, -8
  %t8073 = inttoptr i64 %t8072 to ptr
  %t8074 = getelementptr i64, ptr %t8073, i64 2
  %t8075 = load i64, ptr %t8074
  %t8076 = or i64 %a0, %t8075
  %t8077 = and i64 %t8076, 7
  %t8078 = icmp eq i64 %t8077, 0
  br i1 %t8078, label %fixfast1738, label %fixslow1739
fixfast1738:
  %t8079 = icmp slt i64 %a0, %t8075
  %t8080 = select i1 %t8079, i64 257, i64 1
  br label %fixmerge1740
fixslow1739:
  %t8081 = call i64 @rt_lt(i64 %a0, i64 %t8075)
  br label %fixmerge1740
fixmerge1740:
  %t8082 = phi i64 [ %t8080, %fixfast1738 ], [ %t8081, %fixslow1739 ]
  %t8083 = icmp ne i64 %t8082, 1
  br i1 %t8083, label %then1741, label %else1742
then1741:
  %t8084 = and i64 %self, -8
  %t8085 = inttoptr i64 %t8084 to ptr
  %t8086 = getelementptr i64, ptr %t8085, i64 3
  %t8087 = load i64, ptr %t8086
  %t8088 = load i64, ptr @"emit.internal:rd-state-child"
  %t8089 = call fastcc i64 @"emit.internal:code:rd-state-child"(i64 %t8088, i64 1, i64 %t8087, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8090 = and i64 %self, -8
  %t8091 = inttoptr i64 %t8090 to ptr
  %t8092 = getelementptr i64, ptr %t8091, i64 1
  %t8093 = load i64, ptr %t8092
  %t8094 = and i64 %self, -8
  %t8095 = inttoptr i64 %t8094 to ptr
  %t8096 = getelementptr i64, ptr %t8095, i64 2
  %t8097 = load i64, ptr %t8096
  %t8098 = load i64, ptr @"emit.internal:rd-datum"
  %t8099 = call fastcc i64 @"emit.internal:code:rd-datum"(i64 %t8098, i64 4, i64 %t8093, i64 %t8097, i64 %a0, i64 %t8089, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8100 = load i64, ptr @"emit.internal:rd-finish"
  %t8101 = call fastcc i64 @"emit.internal:code:rd-finish"(i64 %t8100, i64 2, i64 %t8089, i64 %t8099, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8102 = call i64 @rt_cdr(i64 %t8101)
  %t8103 = load i64, ptr @"emit.internal:rd-fail?"
  %t8104 = call fastcc i64 @"emit.internal:code:rd-fail?"(i64 %t8103, i64 1, i64 %t8102, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8105 = icmp ne i64 %t8104, 1
  br i1 %t8105, label %then1743, label %else1744
then1743:
  %t8106 = and i64 %self, -8
  %t8107 = inttoptr i64 %t8106 to ptr
  %t8108 = getelementptr i64, ptr %t8107, i64 1
  %t8109 = load i64, ptr %t8108
  %t8110 = and i64 %self, -8
  %t8111 = inttoptr i64 %t8110 to ptr
  %t8112 = getelementptr i64, ptr %t8111, i64 2
  %t8113 = load i64, ptr %t8112
  %t8114 = load i64, ptr @"scheme.base:rd-report"
  call void @rt_check_callable(i64 %t8114)
  %t8115 = and i64 %t8114, -8
  %t8116 = inttoptr i64 %t8115 to ptr
  %t8117 = load i64, ptr %t8116
  %t8118 = inttoptr i64 %t8117 to ptr
  %t8119 = musttail call fastcc i64 %t8118(i64 %t8114, i64 3, i64 %t8109, i64 %t8113, i64 %t8101, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8119
else1744:
  %t8120 = and i64 %self, -8
  %t8121 = inttoptr i64 %t8120 to ptr
  %t8122 = getelementptr i64, ptr %t8121, i64 1
  %t8123 = load i64, ptr %t8122
  %t8124 = and i64 %self, -8
  %t8125 = inttoptr i64 %t8124 to ptr
  %t8126 = getelementptr i64, ptr %t8125, i64 2
  %t8127 = load i64, ptr %t8126
  %t8128 = call i64 @rt_cdr(i64 %t8101)
  %t8129 = and i64 %self, -8
  %t8130 = inttoptr i64 %t8129 to ptr
  %t8131 = getelementptr i64, ptr %t8130, i64 3
  %t8132 = load i64, ptr %t8131
  %t8133 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t8134 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t8133, i64 4, i64 %t8123, i64 %t8127, i64 %t8128, i64 %t8132, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8135 = call i64 @rt_car(i64 %t8101)
  %t8136 = call i64 @rt_cons(i64 %t8135, i64 %a1)
  %t8137 = musttail call fastcc i64 @"scheme.base:code_1355"(i64 %self, i64 2, i64 %t8134, i64 %t8136, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8137
else1742:
  %t8138 = load i64, ptr @"scheme.base:reverse"
  call void @rt_check_callable(i64 %t8138)
  %t8139 = and i64 %t8138, -8
  %t8140 = inttoptr i64 %t8139 to ptr
  %t8141 = load i64, ptr %t8140
  %t8142 = inttoptr i64 %t8141 to ptr
  %t8143 = musttail call fastcc i64 %t8142(i64 %t8138, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8143
}

define fastcc i64 @"scheme.base:code:rd-all"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8144 = icmp eq i64 %argc, 2
  br i1 %t8144, label %argok1746, label %arityerr1745
arityerr1745:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1746:
  %t8145 = call i64 @rt_string_length(i64 %a0)
  %t8146 = load i64, ptr @"emit.internal:rd-state"
  %t8147 = call fastcc i64 @"emit.internal:code:rd-state"(i64 %t8146, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8148 = call ptr @rt_alloc_words(i64 5)
  %t8149 = ptrtoint ptr %t8148 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1355" to i64), ptr %t8148
  %t8150 = or i64 %t8149, 4
  %t8151 = getelementptr i64, ptr %t8148, i64 1
  store i64 %a0, ptr %t8151
  %t8152 = getelementptr i64, ptr %t8148, i64 2
  store i64 %t8145, ptr %t8152
  %t8153 = getelementptr i64, ptr %t8148, i64 3
  store i64 %t8147, ptr %t8153
  %t8154 = getelementptr i64, ptr %t8148, i64 4
  store i64 %t8150, ptr %t8154
  %t8155 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t8156 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t8155, i64 4, i64 %a0, i64 %t8145, i64 0, i64 %t8147, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8157 = musttail call fastcc i64 @"scheme.base:code_1355"(i64 %t8150, i64 2, i64 %t8156, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8157
}

define fastcc i64 @"scheme.base:code:port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8162 = icmp eq i64 %argc, 1
  br i1 %t8162, label %argok1748, label %arityerr1747
arityerr1747:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1748:
  %t8163 = load i64, ptr @"emit.internal:%port-rtd"
  %t8164 = call fastcc i64 @"emit.internal:code:%port-rtd"(i64 %t8163, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8165 = call i64 @rt_record_of_type_p(i64 %a0, i64 %t8164)
  ret i64 %t8165
}

define fastcc i64 @"scheme.base:code:input-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8170 = icmp eq i64 %argc, 1
  br i1 %t8170, label %argok1750, label %arityerr1749
arityerr1749:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1750:
  %t8171 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t8171)
  %t8172 = and i64 %t8171, -8
  %t8173 = inttoptr i64 %t8172 to ptr
  %t8174 = load i64, ptr %t8173
  %t8175 = inttoptr i64 %t8174 to ptr
  %t8176 = call fastcc i64%t8175(i64 %t8171, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8177 = icmp ne i64 %t8176, 1
  br i1 %t8177, label %then1751, label %else1752
then1751:
  %t8178 = call i64 @rt_record_ref(i64 %a0, i64 8)
  ret i64 %t8178
else1752:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8183 = icmp eq i64 %argc, 1
  br i1 %t8183, label %argok1754, label %arityerr1753
arityerr1753:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1754:
  %t8184 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t8184)
  %t8185 = and i64 %t8184, -8
  %t8186 = inttoptr i64 %t8185 to ptr
  %t8187 = load i64, ptr %t8186
  %t8188 = inttoptr i64 %t8187 to ptr
  %t8189 = call fastcc i64%t8188(i64 %t8184, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8190 = icmp ne i64 %t8189, 1
  br i1 %t8190, label %then1755, label %else1756
then1755:
  %t8191 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t8192 = call i64 @rt_not(i64 %t8191)
  ret i64 %t8192
else1756:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:textual-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8197 = icmp eq i64 %argc, 1
  br i1 %t8197, label %argok1758, label %arityerr1757
arityerr1757:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1758:
  %t8198 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t8198)
  %t8199 = and i64 %t8198, -8
  %t8200 = inttoptr i64 %t8199 to ptr
  %t8201 = load i64, ptr %t8200
  %t8202 = inttoptr i64 %t8201 to ptr
  %t8203 = musttail call fastcc i64 %t8202(i64 %t8198, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8203
}

define fastcc i64 @"scheme.base:code:port-closed?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8208 = icmp eq i64 %argc, 1
  br i1 %t8208, label %argok1760, label %arityerr1759
arityerr1759:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1760:
  %t8209 = call i64 @rt_record_ref(i64 %a0, i64 40)
  ret i64 %t8209
}

define fastcc i64 @"scheme.base:code:input-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8214 = icmp eq i64 %argc, 1
  br i1 %t8214, label %argok1762, label %arityerr1761
arityerr1761:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1762:
  %t8215 = load i64, ptr @"scheme.base:input-port?"
  call void @rt_check_callable(i64 %t8215)
  %t8216 = and i64 %t8215, -8
  %t8217 = inttoptr i64 %t8216 to ptr
  %t8218 = load i64, ptr %t8217
  %t8219 = inttoptr i64 %t8218 to ptr
  %t8220 = call fastcc i64%t8219(i64 %t8215, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8221 = icmp ne i64 %t8220, 1
  br i1 %t8221, label %then1763, label %else1764
then1763:
  %t8222 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t8223 = call i64 @rt_not(i64 %t8222)
  ret i64 %t8223
else1764:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8228 = icmp eq i64 %argc, 1
  br i1 %t8228, label %argok1766, label %arityerr1765
arityerr1765:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1766:
  %t8229 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t8229)
  %t8230 = and i64 %t8229, -8
  %t8231 = inttoptr i64 %t8230 to ptr
  %t8232 = load i64, ptr %t8231
  %t8233 = inttoptr i64 %t8232 to ptr
  %t8234 = call fastcc i64%t8233(i64 %t8229, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8235 = icmp ne i64 %t8234, 1
  br i1 %t8235, label %then1767, label %else1768
then1767:
  %t8236 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t8237 = call i64 @rt_not(i64 %t8236)
  ret i64 %t8237
else1768:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%check-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8242 = icmp eq i64 %argc, 2
  br i1 %t8242, label %argok1770, label %arityerr1769
arityerr1769:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1770:
  %t8243 = load i64, ptr @"scheme.base:input-port?"
  call void @rt_check_callable(i64 %t8243)
  %t8244 = and i64 %t8243, -8
  %t8245 = inttoptr i64 %t8244 to ptr
  %t8246 = load i64, ptr %t8245
  %t8247 = inttoptr i64 %t8246 to ptr
  %t8248 = call fastcc i64%t8247(i64 %t8243, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8249 = call i64 @rt_not(i64 %t8248)
  %t8250 = icmp ne i64 %t8249, 1
  br i1 %t8250, label %then1771, label %else1772
then1771:
  %t8251 = call i64 @rt_make_string(ptr @.str.lit.71, i64 17)
  %t8252 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8252)
  %t8253 = and i64 %t8252, -8
  %t8254 = inttoptr i64 %t8253 to ptr
  %t8255 = load i64, ptr %t8254
  %t8256 = inttoptr i64 %t8255 to ptr
  %t8257 = musttail call fastcc i64 %t8256(i64 %t8252, i64 3, i64 %a1, i64 %t8251, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8257
else1772:
  %t8258 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t8259 = icmp ne i64 %t8258, 1
  br i1 %t8259, label %then1773, label %else1774
then1773:
  %t8260 = call i64 @rt_make_string(ptr @.str.lit.72, i64 14)
  %t8261 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8261)
  %t8262 = and i64 %t8261, -8
  %t8263 = inttoptr i64 %t8262 to ptr
  %t8264 = load i64, ptr %t8263
  %t8265 = inttoptr i64 %t8264 to ptr
  %t8266 = musttail call fastcc i64 %t8265(i64 %t8261, i64 3, i64 %a1, i64 %t8260, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8266
else1774:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:%check-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8271 = icmp eq i64 %argc, 2
  br i1 %t8271, label %argok1776, label %arityerr1775
arityerr1775:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1776:
  %t8272 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t8272)
  %t8273 = and i64 %t8272, -8
  %t8274 = inttoptr i64 %t8273 to ptr
  %t8275 = load i64, ptr %t8274
  %t8276 = inttoptr i64 %t8275 to ptr
  %t8277 = call fastcc i64%t8276(i64 %t8272, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8278 = call i64 @rt_not(i64 %t8277)
  %t8279 = icmp ne i64 %t8278, 1
  br i1 %t8279, label %then1777, label %else1778
then1777:
  %t8280 = call i64 @rt_make_string(ptr @.str.lit.73, i64 18)
  %t8281 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8281)
  %t8282 = and i64 %t8281, -8
  %t8283 = inttoptr i64 %t8282 to ptr
  %t8284 = load i64, ptr %t8283
  %t8285 = inttoptr i64 %t8284 to ptr
  %t8286 = musttail call fastcc i64 %t8285(i64 %t8281, i64 3, i64 %a1, i64 %t8280, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8286
else1778:
  %t8287 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t8288 = icmp ne i64 %t8287, 1
  br i1 %t8288, label %then1779, label %else1780
then1779:
  %t8289 = call i64 @rt_make_string(ptr @.str.lit.74, i64 14)
  %t8290 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8290)
  %t8291 = and i64 %t8290, -8
  %t8292 = inttoptr i64 %t8291 to ptr
  %t8293 = load i64, ptr %t8292
  %t8294 = inttoptr i64 %t8293 to ptr
  %t8295 = musttail call fastcc i64 %t8294(i64 %t8290, i64 3, i64 %a1, i64 %t8289, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8295
else1780:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:open-input-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8300 = icmp eq i64 %argc, 1
  br i1 %t8300, label %argok1782, label %arityerr1781
arityerr1781:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1782:
  %t8301 = load i64, ptr @"emit.internal:%make-port"
  %t8302 = musttail call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8301, i64 6, i64 1, i64 257, i64 %a0, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t8302
}

define fastcc i64 @"scheme.base:code:%port-at-eof?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8307 = icmp eq i64 %argc, 1
  br i1 %t8307, label %argok1784, label %arityerr1783
arityerr1783:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1784:
  %t8308 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t8309 = load i64, ptr @"emit.internal:%port-buf"
  %t8310 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t8309, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8311 = call i64 @rt_string_length(i64 %t8310)
  %t8312 = or i64 %t8311, %t8308
  %t8313 = and i64 %t8312, 7
  %t8314 = icmp eq i64 %t8313, 0
  br i1 %t8314, label %fixfast1785, label %fixslow1786
fixfast1785:
  %t8315 = icmp slt i64 %t8311, %t8308
  %t8316 = select i1 %t8315, i64 257, i64 1
  br label %fixmerge1787
fixslow1786:
  %t8317 = call i64 @rt_lt(i64 %t8311, i64 %t8308)
  br label %fixmerge1787
fixmerge1787:
  %t8318 = phi i64 [ %t8316, %fixfast1785 ], [ %t8317, %fixslow1786 ]
  %t8319 = icmp ne i64 %t8318, 1
  br i1 %t8319, label %then1788, label %else1789
then1788:
  ret i64 257
else1789:
  %t8320 = or i64 %t8308, %t8311
  %t8321 = and i64 %t8320, 7
  %t8322 = icmp eq i64 %t8321, 0
  br i1 %t8322, label %fixfast1790, label %fixslow1791
fixfast1790:
  %t8323 = icmp eq i64 %t8308, %t8311
  %t8324 = select i1 %t8323, i64 257, i64 1
  br label %fixmerge1792
fixslow1791:
  %t8325 = call i64 @rt_num_eq(i64 %t8308, i64 %t8311)
  br label %fixmerge1792
fixmerge1792:
  %t8326 = phi i64 [ %t8324, %fixfast1790 ], [ %t8325, %fixslow1791 ]
  ret i64 %t8326
}

define fastcc i64 @"scheme.base:code:read-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8331 = icmp eq i64 %argc, 1
  br i1 %t8331, label %argok1794, label %arityerr1793
arityerr1793:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1794:
  %t8332 = call i64 @rt_intern(ptr @.str.sym.75)
  %t8333 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t8333)
  %t8334 = and i64 %t8333, -8
  %t8335 = inttoptr i64 %t8334 to ptr
  %t8336 = load i64, ptr %t8335
  %t8337 = inttoptr i64 %t8336 to ptr
  %t8338 = call fastcc i64%t8337(i64 %t8333, i64 2, i64 %a0, i64 %t8332, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8339 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t8339)
  %t8340 = and i64 %t8339, -8
  %t8341 = inttoptr i64 %t8340 to ptr
  %t8342 = load i64, ptr %t8341
  %t8343 = inttoptr i64 %t8342 to ptr
  %t8344 = call fastcc i64%t8343(i64 %t8339, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8345 = icmp ne i64 %t8344, 1
  br i1 %t8345, label %then1795, label %else1796
then1795:
  %t8346 = call i64 @rt_eof_object()
  ret i64 %t8346
else1796:
  %t8347 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t8348 = or i64 %t8347, 8
  %t8349 = and i64 %t8348, 7
  %t8350 = icmp eq i64 %t8349, 0
  br i1 %t8350, label %fixfast1797, label %fixslow1798
fixfast1797:
  %t8351 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t8347, i64 8)
  %t8352 = extractvalue {i64, i1} %t8351, 0
  %t8353 = extractvalue {i64, i1} %t8351, 1
  br i1 %t8353, label %fixslow1798, label %fixmerge1799
fixslow1798:
  %t8354 = call i64 @rt_add(i64 %t8347, i64 8)
  br label %fixmerge1799
fixmerge1799:
  %t8355 = phi i64 [ %t8352, %fixfast1797 ], [ %t8354, %fixslow1798 ]
  %t8356 = call i64 @rt_record_set(i64 %a0, i64 24, i64 %t8355)
  %t8357 = load i64, ptr @"emit.internal:%port-buf"
  %t8358 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t8357, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8359 = call i64 @rt_string_ref(i64 %t8358, i64 %t8347)
  ret i64 %t8359
}

define fastcc i64 @"scheme.base:code:peek-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8364 = icmp eq i64 %argc, 1
  br i1 %t8364, label %argok1801, label %arityerr1800
arityerr1800:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1801:
  %t8365 = call i64 @rt_intern(ptr @.str.sym.76)
  %t8366 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t8366)
  %t8367 = and i64 %t8366, -8
  %t8368 = inttoptr i64 %t8367 to ptr
  %t8369 = load i64, ptr %t8368
  %t8370 = inttoptr i64 %t8369 to ptr
  %t8371 = call fastcc i64%t8370(i64 %t8366, i64 2, i64 %a0, i64 %t8365, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8372 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t8372)
  %t8373 = and i64 %t8372, -8
  %t8374 = inttoptr i64 %t8373 to ptr
  %t8375 = load i64, ptr %t8374
  %t8376 = inttoptr i64 %t8375 to ptr
  %t8377 = call fastcc i64%t8376(i64 %t8372, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8378 = icmp ne i64 %t8377, 1
  br i1 %t8378, label %then1802, label %else1803
then1802:
  %t8379 = call i64 @rt_eof_object()
  ret i64 %t8379
else1803:
  %t8380 = load i64, ptr @"emit.internal:%port-buf"
  %t8381 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t8380, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8382 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t8383 = call i64 @rt_string_ref(i64 %t8381, i64 %t8382)
  ret i64 %t8383
}

define fastcc i64 @"scheme.base:code_1402"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8388 = icmp eq i64 %argc, 1
  br i1 %t8388, label %argok1805, label %arityerr1804
arityerr1804:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1805:
  %t8389 = and i64 %self, -8
  %t8390 = inttoptr i64 %t8389 to ptr
  %t8391 = getelementptr i64, ptr %t8390, i64 1
  %t8392 = load i64, ptr %t8391
  %t8393 = or i64 %t8392, %a0
  %t8394 = and i64 %t8393, 7
  %t8395 = icmp eq i64 %t8394, 0
  br i1 %t8395, label %fixfast1806, label %fixslow1807
fixfast1806:
  %t8396 = icmp slt i64 %t8392, %a0
  %t8397 = select i1 %t8396, i64 257, i64 1
  br label %fixmerge1808
fixslow1807:
  %t8398 = call i64 @rt_lt(i64 %t8392, i64 %a0)
  br label %fixmerge1808
fixmerge1808:
  %t8399 = phi i64 [ %t8397, %fixfast1806 ], [ %t8398, %fixslow1807 ]
  %t8400 = icmp ne i64 %t8399, 1
  br i1 %t8400, label %then1809, label %else1810
then1809:
  br label %merge1811
else1810:
  %t8401 = or i64 %a0, %t8392
  %t8402 = and i64 %t8401, 7
  %t8403 = icmp eq i64 %t8402, 0
  br i1 %t8403, label %fixfast1812, label %fixslow1813
fixfast1812:
  %t8404 = icmp eq i64 %a0, %t8392
  %t8405 = select i1 %t8404, i64 257, i64 1
  br label %fixmerge1814
fixslow1813:
  %t8406 = call i64 @rt_num_eq(i64 %a0, i64 %t8392)
  br label %fixmerge1814
fixmerge1814:
  %t8407 = phi i64 [ %t8405, %fixfast1812 ], [ %t8406, %fixslow1813 ]
  br label %merge1811
merge1811:
  %t8408 = phi i64 [ 257, %then1809 ], [ %t8407, %fixmerge1814 ]
  %t8409 = icmp ne i64 %t8408, 1
  br i1 %t8409, label %then1815, label %else1816
then1815:
  %t8410 = and i64 %self, -8
  %t8411 = inttoptr i64 %t8410 to ptr
  %t8412 = getelementptr i64, ptr %t8411, i64 2
  %t8413 = load i64, ptr %t8412
  %t8414 = call i64 @rt_record_ref(i64 %t8413, i64 24)
  %t8415 = and i64 %self, -8
  %t8416 = inttoptr i64 %t8415 to ptr
  %t8417 = getelementptr i64, ptr %t8416, i64 2
  %t8418 = load i64, ptr %t8417
  %t8419 = and i64 %self, -8
  %t8420 = inttoptr i64 %t8419 to ptr
  %t8421 = getelementptr i64, ptr %t8420, i64 1
  %t8422 = load i64, ptr %t8421
  %t8423 = call i64 @rt_record_set(i64 %t8418, i64 24, i64 %t8422)
  %t8424 = and i64 %self, -8
  %t8425 = inttoptr i64 %t8424 to ptr
  %t8426 = getelementptr i64, ptr %t8425, i64 3
  %t8427 = load i64, ptr %t8426
  %t8428 = and i64 %self, -8
  %t8429 = inttoptr i64 %t8428 to ptr
  %t8430 = getelementptr i64, ptr %t8429, i64 1
  %t8431 = load i64, ptr %t8430
  %t8432 = call i64 @rt_substring(i64 %t8427, i64 %t8414, i64 %t8431)
  ret i64 %t8432
else1816:
  %t8433 = and i64 %self, -8
  %t8434 = inttoptr i64 %t8433 to ptr
  %t8435 = getelementptr i64, ptr %t8434, i64 3
  %t8436 = load i64, ptr %t8435
  %t8437 = call i64 @rt_string_ref(i64 %t8436, i64 %a0)
  %t8438 = load i64, ptr @"scheme.base:char=?"
  call void @rt_check_callable(i64 %t8438)
  %t8439 = and i64 %t8438, -8
  %t8440 = inttoptr i64 %t8439 to ptr
  %t8441 = load i64, ptr %t8440
  %t8442 = inttoptr i64 %t8441 to ptr
  %t8443 = call fastcc i64%t8442(i64 %t8438, i64 2, i64 %t8437, i64 2569, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8444 = icmp ne i64 %t8443, 1
  br i1 %t8444, label %then1817, label %else1818
then1817:
  %t8445 = and i64 %self, -8
  %t8446 = inttoptr i64 %t8445 to ptr
  %t8447 = getelementptr i64, ptr %t8446, i64 2
  %t8448 = load i64, ptr %t8447
  %t8449 = call i64 @rt_record_ref(i64 %t8448, i64 24)
  %t8450 = and i64 %self, -8
  %t8451 = inttoptr i64 %t8450 to ptr
  %t8452 = getelementptr i64, ptr %t8451, i64 2
  %t8453 = load i64, ptr %t8452
  %t8454 = or i64 %a0, 8
  %t8455 = and i64 %t8454, 7
  %t8456 = icmp eq i64 %t8455, 0
  br i1 %t8456, label %fixfast1819, label %fixslow1820
fixfast1819:
  %t8457 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t8458 = extractvalue {i64, i1} %t8457, 0
  %t8459 = extractvalue {i64, i1} %t8457, 1
  br i1 %t8459, label %fixslow1820, label %fixmerge1821
fixslow1820:
  %t8460 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1821
fixmerge1821:
  %t8461 = phi i64 [ %t8458, %fixfast1819 ], [ %t8460, %fixslow1820 ]
  %t8462 = call i64 @rt_record_set(i64 %t8453, i64 24, i64 %t8461)
  %t8463 = and i64 %self, -8
  %t8464 = inttoptr i64 %t8463 to ptr
  %t8465 = getelementptr i64, ptr %t8464, i64 3
  %t8466 = load i64, ptr %t8465
  %t8467 = call i64 @rt_substring(i64 %t8466, i64 %t8449, i64 %a0)
  ret i64 %t8467
else1818:
  %t8468 = or i64 %a0, 8
  %t8469 = and i64 %t8468, 7
  %t8470 = icmp eq i64 %t8469, 0
  br i1 %t8470, label %fixfast1822, label %fixslow1823
fixfast1822:
  %t8471 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t8472 = extractvalue {i64, i1} %t8471, 0
  %t8473 = extractvalue {i64, i1} %t8471, 1
  br i1 %t8473, label %fixslow1823, label %fixmerge1824
fixslow1823:
  %t8474 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1824
fixmerge1824:
  %t8475 = phi i64 [ %t8472, %fixfast1822 ], [ %t8474, %fixslow1823 ]
  %t8476 = musttail call fastcc i64 @"scheme.base:code_1402"(i64 %self, i64 1, i64 %t8475, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8476
}

define fastcc i64 @"scheme.base:code:read-line"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8477 = icmp eq i64 %argc, 1
  br i1 %t8477, label %argok1826, label %arityerr1825
arityerr1825:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1826:
  %t8478 = call i64 @rt_intern(ptr @.str.sym.77)
  %t8479 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t8479)
  %t8480 = and i64 %t8479, -8
  %t8481 = inttoptr i64 %t8480 to ptr
  %t8482 = load i64, ptr %t8481
  %t8483 = inttoptr i64 %t8482 to ptr
  %t8484 = call fastcc i64%t8483(i64 %t8479, i64 2, i64 %a0, i64 %t8478, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8485 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t8485)
  %t8486 = and i64 %t8485, -8
  %t8487 = inttoptr i64 %t8486 to ptr
  %t8488 = load i64, ptr %t8487
  %t8489 = inttoptr i64 %t8488 to ptr
  %t8490 = call fastcc i64%t8489(i64 %t8485, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8491 = icmp ne i64 %t8490, 1
  br i1 %t8491, label %then1827, label %else1828
then1827:
  %t8492 = call i64 @rt_eof_object()
  ret i64 %t8492
else1828:
  %t8493 = load i64, ptr @"emit.internal:%port-buf"
  %t8494 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t8493, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8495 = call i64 @rt_string_length(i64 %t8494)
  %t8496 = call ptr @rt_alloc_words(i64 5)
  %t8497 = ptrtoint ptr %t8496 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1402" to i64), ptr %t8496
  %t8498 = or i64 %t8497, 4
  %t8499 = getelementptr i64, ptr %t8496, i64 1
  store i64 %t8495, ptr %t8499
  %t8500 = getelementptr i64, ptr %t8496, i64 2
  store i64 %a0, ptr %t8500
  %t8501 = getelementptr i64, ptr %t8496, i64 3
  store i64 %t8494, ptr %t8501
  %t8502 = getelementptr i64, ptr %t8496, i64 4
  store i64 %t8498, ptr %t8502
  %t8503 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t8504 = musttail call fastcc i64 @"scheme.base:code_1402"(i64 %t8498, i64 1, i64 %t8503, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8504
}

define fastcc i64 @"scheme.base:code:read-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8509 = icmp eq i64 %argc, 2
  br i1 %t8509, label %argok1830, label %arityerr1829
arityerr1829:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1830:
  %t8510 = call i64 @rt_intern(ptr @.str.sym.78)
  %t8511 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t8511)
  %t8512 = and i64 %t8511, -8
  %t8513 = inttoptr i64 %t8512 to ptr
  %t8514 = load i64, ptr %t8513
  %t8515 = inttoptr i64 %t8514 to ptr
  %t8516 = call fastcc i64%t8515(i64 %t8511, i64 2, i64 %a1, i64 %t8510, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8517 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t8517)
  %t8518 = and i64 %t8517, -8
  %t8519 = inttoptr i64 %t8518 to ptr
  %t8520 = load i64, ptr %t8519
  %t8521 = inttoptr i64 %t8520 to ptr
  %t8522 = call fastcc i64%t8521(i64 %t8517, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8523 = icmp ne i64 %t8522, 1
  br i1 %t8523, label %then1831, label %else1832
then1831:
  %t8524 = call i64 @rt_eof_object()
  ret i64 %t8524
else1832:
  %t8525 = load i64, ptr @"emit.internal:%port-buf"
  %t8526 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t8525, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8527 = call i64 @rt_string_length(i64 %t8526)
  %t8528 = call i64 @rt_record_ref(i64 %a1, i64 24)
  %t8529 = or i64 %t8528, %a0
  %t8530 = and i64 %t8529, 7
  %t8531 = icmp eq i64 %t8530, 0
  br i1 %t8531, label %fixfast1833, label %fixslow1834
fixfast1833:
  %t8532 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t8528, i64 %a0)
  %t8533 = extractvalue {i64, i1} %t8532, 0
  %t8534 = extractvalue {i64, i1} %t8532, 1
  br i1 %t8534, label %fixslow1834, label %fixmerge1835
fixslow1834:
  %t8535 = call i64 @rt_add(i64 %t8528, i64 %a0)
  br label %fixmerge1835
fixmerge1835:
  %t8536 = phi i64 [ %t8533, %fixfast1833 ], [ %t8535, %fixslow1834 ]
  %t8537 = or i64 %t8527, %t8536
  %t8538 = and i64 %t8537, 7
  %t8539 = icmp eq i64 %t8538, 0
  br i1 %t8539, label %fixfast1836, label %fixslow1837
fixfast1836:
  %t8540 = icmp slt i64 %t8527, %t8536
  %t8541 = select i1 %t8540, i64 257, i64 1
  br label %fixmerge1838
fixslow1837:
  %t8542 = call i64 @rt_lt(i64 %t8527, i64 %t8536)
  br label %fixmerge1838
fixmerge1838:
  %t8543 = phi i64 [ %t8541, %fixfast1836 ], [ %t8542, %fixslow1837 ]
  %t8544 = icmp ne i64 %t8543, 1
  br i1 %t8544, label %then1839, label %else1840
then1839:
  br label %merge1841
else1840:
  %t8545 = or i64 %t8528, %a0
  %t8546 = and i64 %t8545, 7
  %t8547 = icmp eq i64 %t8546, 0
  br i1 %t8547, label %fixfast1842, label %fixslow1843
fixfast1842:
  %t8548 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t8528, i64 %a0)
  %t8549 = extractvalue {i64, i1} %t8548, 0
  %t8550 = extractvalue {i64, i1} %t8548, 1
  br i1 %t8550, label %fixslow1843, label %fixmerge1844
fixslow1843:
  %t8551 = call i64 @rt_add(i64 %t8528, i64 %a0)
  br label %fixmerge1844
fixmerge1844:
  %t8552 = phi i64 [ %t8549, %fixfast1842 ], [ %t8551, %fixslow1843 ]
  br label %merge1841
merge1841:
  %t8553 = phi i64 [ %t8527, %then1839 ], [ %t8552, %fixmerge1844 ]
  %t8554 = call i64 @rt_record_set(i64 %a1, i64 24, i64 %t8553)
  %t8555 = call i64 @rt_substring(i64 %t8526, i64 %t8528, i64 %t8553)
  ret i64 %t8555
}

define fastcc i64 @"scheme.base:code:open-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8560 = icmp eq i64 %argc, 0
  br i1 %t8560, label %argok1846, label %arityerr1845
arityerr1845:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1846:
  %t8561 = call i64 @rt_port_open_output_string()
  %t8562 = icmp ne i64 %t8561, 1
  br i1 %t8562, label %then1847, label %else1848
then1847:
  %t8563 = load i64, ptr @"emit.internal:%make-port"
  %t8564 = musttail call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8563, i64 6, i64 %t8561, i64 1, i64 1, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t8564
else1848:
  %t8565 = call i64 @rt_intern(ptr @.str.sym.79)
  %t8566 = call i64 @rt_make_string(ptr @.str.lit.80, i64 33)
  %t8567 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8567)
  %t8568 = and i64 %t8567, -8
  %t8569 = inttoptr i64 %t8568 to ptr
  %t8570 = load i64, ptr %t8569
  %t8571 = inttoptr i64 %t8570 to ptr
  %t8572 = musttail call fastcc i64 %t8571(i64 %t8567, i64 2, i64 %t8565, i64 %t8566, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8572
}

define fastcc i64 @"scheme.base:code:get-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8577 = icmp eq i64 %argc, 1
  br i1 %t8577, label %argok1850, label %arityerr1849
arityerr1849:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1850:
  %t8578 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t8578)
  %t8579 = and i64 %t8578, -8
  %t8580 = inttoptr i64 %t8579 to ptr
  %t8581 = load i64, ptr %t8580
  %t8582 = inttoptr i64 %t8581 to ptr
  %t8583 = call fastcc i64%t8582(i64 %t8578, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8584 = call i64 @rt_not(i64 %t8583)
  %t8585 = icmp ne i64 %t8584, 1
  br i1 %t8585, label %then1851, label %else1852
then1851:
  %t8586 = call i64 @rt_intern(ptr @.str.sym.81)
  %t8587 = call i64 @rt_make_string(ptr @.str.lit.82, i64 18)
  %t8588 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8588)
  %t8589 = and i64 %t8588, -8
  %t8590 = inttoptr i64 %t8589 to ptr
  %t8591 = load i64, ptr %t8590
  %t8592 = inttoptr i64 %t8591 to ptr
  %t8593 = musttail call fastcc i64 %t8592(i64 %t8588, i64 3, i64 %t8586, i64 %t8587, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8593
else1852:
  %t8594 = call i64 @rt_record_ref(i64 %a0, i64 32)
  %t8595 = call i64 @rt_not(i64 %t8594)
  %t8596 = icmp ne i64 %t8595, 1
  br i1 %t8596, label %then1853, label %else1854
then1853:
  %t8597 = call i64 @rt_intern(ptr @.str.sym.81)
  %t8598 = call i64 @rt_make_string(ptr @.str.lit.83, i64 17)
  %t8599 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8599)
  %t8600 = and i64 %t8599, -8
  %t8601 = inttoptr i64 %t8600 to ptr
  %t8602 = load i64, ptr %t8601
  %t8603 = inttoptr i64 %t8602 to ptr
  %t8604 = musttail call fastcc i64 %t8603(i64 %t8599, i64 3, i64 %t8597, i64 %t8598, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8604
else1854:
  %t8605 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t8606 = call i64 @rt_port_get_output_string(i64 %t8605)
  ret i64 %t8606
}

define fastcc i64 @"scheme.base:code:flush-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8611 = icmp eq i64 %argc, 1
  br i1 %t8611, label %argok1856, label %arityerr1855
arityerr1855:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1856:
  %t8612 = call i64 @rt_intern(ptr @.str.sym.84)
  %t8613 = load i64, ptr @"scheme.base:%check-output-port"
  call void @rt_check_callable(i64 %t8613)
  %t8614 = and i64 %t8613, -8
  %t8615 = inttoptr i64 %t8614 to ptr
  %t8616 = load i64, ptr %t8615
  %t8617 = inttoptr i64 %t8616 to ptr
  %t8618 = call fastcc i64%t8617(i64 %t8613, i64 2, i64 %a0, i64 %t8612, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8619 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t8620 = call i64 @rt_port_flush(i64 %t8619)
  ret i64 %t8620
}

define fastcc i64 @"scheme.base:code:close-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8625 = icmp eq i64 %argc, 1
  br i1 %t8625, label %argok1858, label %arityerr1857
arityerr1857:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1858:
  %t8626 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t8626)
  %t8627 = and i64 %t8626, -8
  %t8628 = inttoptr i64 %t8627 to ptr
  %t8629 = load i64, ptr %t8628
  %t8630 = inttoptr i64 %t8629 to ptr
  %t8631 = call fastcc i64%t8630(i64 %t8626, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8632 = call i64 @rt_not(i64 %t8631)
  %t8633 = icmp ne i64 %t8632, 1
  br i1 %t8633, label %then1859, label %else1860
then1859:
  %t8634 = call i64 @rt_intern(ptr @.str.sym.85)
  %t8635 = call i64 @rt_make_string(ptr @.str.lit.86, i64 10)
  %t8636 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8636)
  %t8637 = and i64 %t8636, -8
  %t8638 = inttoptr i64 %t8637 to ptr
  %t8639 = load i64, ptr %t8638
  %t8640 = inttoptr i64 %t8639 to ptr
  %t8641 = musttail call fastcc i64 %t8640(i64 %t8636, i64 3, i64 %t8634, i64 %t8635, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8641
else1860:
  %t8642 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t8643 = icmp ne i64 %t8642, 1
  br i1 %t8643, label %then1861, label %else1862
then1861:
  %t8644 = icmp ne i64 1, 1
  br i1 %t8644, label %then1863, label %else1864
then1863:
  ret i64 1
else1864:
  ret i64 17
else1862:
  %t8645 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t8646 = call i64 @rt_not(i64 %t8645)
  %t8647 = icmp ne i64 %t8646, 1
  br i1 %t8647, label %then1865, label %else1866
then1865:
  %t8648 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t8649 = call i64 @rt_port_close(i64 %t8648)
  br label %merge1867
else1866:
  br label %merge1867
merge1867:
  %t8650 = phi i64 [ %t8649, %then1865 ], [ 17, %else1866 ]
  %t8651 = call i64 @rt_record_set(i64 %a0, i64 40, i64 257)
  %t8652 = icmp ne i64 1, 1
  br i1 %t8652, label %then1868, label %else1869
then1868:
  ret i64 1
else1869:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:close-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8657 = icmp eq i64 %argc, 1
  br i1 %t8657, label %argok1871, label %arityerr1870
arityerr1870:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1871:
  %t8658 = load i64, ptr @"scheme.base:input-port?"
  call void @rt_check_callable(i64 %t8658)
  %t8659 = and i64 %t8658, -8
  %t8660 = inttoptr i64 %t8659 to ptr
  %t8661 = load i64, ptr %t8660
  %t8662 = inttoptr i64 %t8661 to ptr
  %t8663 = call fastcc i64%t8662(i64 %t8658, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8664 = icmp ne i64 %t8663, 1
  br i1 %t8664, label %then1872, label %else1873
then1872:
  %t8665 = load i64, ptr @"scheme.base:close-port"
  call void @rt_check_callable(i64 %t8665)
  %t8666 = and i64 %t8665, -8
  %t8667 = inttoptr i64 %t8666 to ptr
  %t8668 = load i64, ptr %t8667
  %t8669 = inttoptr i64 %t8668 to ptr
  %t8670 = musttail call fastcc i64 %t8669(i64 %t8665, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8670
else1873:
  %t8671 = call i64 @rt_intern(ptr @.str.sym.87)
  %t8672 = call i64 @rt_make_string(ptr @.str.lit.88, i64 17)
  %t8673 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8673)
  %t8674 = and i64 %t8673, -8
  %t8675 = inttoptr i64 %t8674 to ptr
  %t8676 = load i64, ptr %t8675
  %t8677 = inttoptr i64 %t8676 to ptr
  %t8678 = musttail call fastcc i64 %t8677(i64 %t8673, i64 3, i64 %t8671, i64 %t8672, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8678
}

define fastcc i64 @"scheme.base:code:close-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8683 = icmp eq i64 %argc, 1
  br i1 %t8683, label %argok1875, label %arityerr1874
arityerr1874:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1875:
  %t8684 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t8684)
  %t8685 = and i64 %t8684, -8
  %t8686 = inttoptr i64 %t8685 to ptr
  %t8687 = load i64, ptr %t8686
  %t8688 = inttoptr i64 %t8687 to ptr
  %t8689 = call fastcc i64%t8688(i64 %t8684, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8690 = icmp ne i64 %t8689, 1
  br i1 %t8690, label %then1876, label %else1877
then1876:
  %t8691 = load i64, ptr @"scheme.base:close-port"
  call void @rt_check_callable(i64 %t8691)
  %t8692 = and i64 %t8691, -8
  %t8693 = inttoptr i64 %t8692 to ptr
  %t8694 = load i64, ptr %t8693
  %t8695 = inttoptr i64 %t8694 to ptr
  %t8696 = musttail call fastcc i64 %t8695(i64 %t8691, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8696
else1877:
  %t8697 = call i64 @rt_intern(ptr @.str.sym.89)
  %t8698 = call i64 @rt_make_string(ptr @.str.lit.90, i64 18)
  %t8699 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8699)
  %t8700 = and i64 %t8699, -8
  %t8701 = inttoptr i64 %t8700 to ptr
  %t8702 = load i64, ptr %t8701
  %t8703 = inttoptr i64 %t8702 to ptr
  %t8704 = musttail call fastcc i64 %t8703(i64 %t8699, i64 3, i64 %t8697, i64 %t8698, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8704
}

define fastcc i64 @"scheme.base:code:current-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8712 = icmp sge i64 %argc, 0
  br i1 %t8712, label %argok1879, label %arityerr1878
arityerr1878:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1879:
  %t8713 = call ptr @rt_alloc_words(i64 8)
  %t8714 = getelementptr i64, ptr %t8713, i64 0
  store i64 %a0, ptr %t8714
  %t8715 = getelementptr i64, ptr %t8713, i64 1
  store i64 %a1, ptr %t8715
  %t8716 = getelementptr i64, ptr %t8713, i64 2
  store i64 %a2, ptr %t8716
  %t8717 = getelementptr i64, ptr %t8713, i64 3
  store i64 %a3, ptr %t8717
  %t8718 = getelementptr i64, ptr %t8713, i64 4
  store i64 %a4, ptr %t8718
  %t8719 = getelementptr i64, ptr %t8713, i64 5
  store i64 %a5, ptr %t8719
  %t8720 = getelementptr i64, ptr %t8713, i64 6
  store i64 %a6, ptr %t8720
  %t8721 = getelementptr i64, ptr %t8713, i64 7
  store i64 %a7, ptr %t8721
  %t8722 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t8713, ptr %overflow)
  %t8723 = call i64 @rt_null_p(i64 %t8722)
  %t8724 = icmp ne i64 %t8723, 1
  br i1 %t8724, label %then1880, label %else1881
then1880:
  %t8725 = load i64, ptr @"scheme.base:%stdout-port"
  %t8726 = call i64 @rt_not(i64 %t8725)
  %t8727 = icmp ne i64 %t8726, 1
  br i1 %t8727, label %then1882, label %else1883
then1882:
  %t8728 = load i64, ptr @"emit.internal:%make-port"
  %t8729 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8728, i64 6, i64 0, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t8730 = call i64 @rt_root(i64 %t8729)
  store i64 %t8730, ptr @"scheme.base:%stdout-port"
  %t8731 = call i64 @rt_set_current_output(i64 0)
  br label %merge1884
else1883:
  br label %merge1884
merge1884:
  %t8732 = phi i64 [ %t8731, %then1882 ], [ 17, %else1883 ]
  %t8733 = load i64, ptr @"scheme.base:%stdout-port"
  ret i64 %t8733
else1881:
  %t8734 = call i64 @rt_car(i64 %t8722)
  %t8735 = call i64 @rt_root(i64 %t8734)
  store i64 %t8735, ptr @"scheme.base:%stdout-port"
  %t8736 = call i64 @rt_record_ref(i64 %t8734, i64 0)
  %t8737 = call i64 @rt_set_current_output(i64 %t8736)
  %t8738 = icmp ne i64 1, 1
  br i1 %t8738, label %then1885, label %else1886
then1885:
  ret i64 1
else1886:
  ret i64 17
}

define fastcc i64 @"min-entry:$scheme.base$ccode$ccurrent-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8739 = call i64 @rt_null_p(i64 2)
  %t8740 = icmp ne i64 %t8739, 1
  br i1 %t8740, label %then1887, label %else1888
then1887:
  %t8741 = load i64, ptr @"scheme.base:%stdout-port"
  %t8742 = call i64 @rt_not(i64 %t8741)
  %t8743 = icmp ne i64 %t8742, 1
  br i1 %t8743, label %then1889, label %else1890
then1889:
  %t8744 = load i64, ptr @"emit.internal:%make-port"
  %t8745 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8744, i64 6, i64 0, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t8746 = call i64 @rt_root(i64 %t8745)
  store i64 %t8746, ptr @"scheme.base:%stdout-port"
  %t8747 = call i64 @rt_set_current_output(i64 0)
  br label %merge1891
else1890:
  br label %merge1891
merge1891:
  %t8748 = phi i64 [ %t8747, %then1889 ], [ 17, %else1890 ]
  %t8749 = load i64, ptr @"scheme.base:%stdout-port"
  ret i64 %t8749
else1888:
  %t8750 = call i64 @rt_car(i64 2)
  %t8751 = call i64 @rt_root(i64 %t8750)
  store i64 %t8751, ptr @"scheme.base:%stdout-port"
  %t8752 = call i64 @rt_record_ref(i64 %t8750, i64 0)
  %t8753 = call i64 @rt_set_current_output(i64 %t8752)
  %t8754 = icmp ne i64 1, 1
  br i1 %t8754, label %then1892, label %else1893
then1892:
  ret i64 1
else1893:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-error-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8759 = icmp sge i64 %argc, 0
  br i1 %t8759, label %argok1895, label %arityerr1894
arityerr1894:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1895:
  %t8760 = call ptr @rt_alloc_words(i64 8)
  %t8761 = getelementptr i64, ptr %t8760, i64 0
  store i64 %a0, ptr %t8761
  %t8762 = getelementptr i64, ptr %t8760, i64 1
  store i64 %a1, ptr %t8762
  %t8763 = getelementptr i64, ptr %t8760, i64 2
  store i64 %a2, ptr %t8763
  %t8764 = getelementptr i64, ptr %t8760, i64 3
  store i64 %a3, ptr %t8764
  %t8765 = getelementptr i64, ptr %t8760, i64 4
  store i64 %a4, ptr %t8765
  %t8766 = getelementptr i64, ptr %t8760, i64 5
  store i64 %a5, ptr %t8766
  %t8767 = getelementptr i64, ptr %t8760, i64 6
  store i64 %a6, ptr %t8767
  %t8768 = getelementptr i64, ptr %t8760, i64 7
  store i64 %a7, ptr %t8768
  %t8769 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t8760, ptr %overflow)
  %t8770 = call i64 @rt_null_p(i64 %t8769)
  %t8771 = icmp ne i64 %t8770, 1
  br i1 %t8771, label %then1896, label %else1897
then1896:
  %t8772 = load i64, ptr @"scheme.base:%stderr-port"
  %t8773 = call i64 @rt_not(i64 %t8772)
  %t8774 = icmp ne i64 %t8773, 1
  br i1 %t8774, label %then1898, label %else1899
then1898:
  %t8775 = load i64, ptr @"emit.internal:%make-port"
  %t8776 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8775, i64 6, i64 8, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t8777 = call i64 @rt_root(i64 %t8776)
  store i64 %t8777, ptr @"scheme.base:%stderr-port"
  br label %merge1900
else1899:
  br label %merge1900
merge1900:
  %t8778 = phi i64 [ 17, %then1898 ], [ 17, %else1899 ]
  %t8779 = load i64, ptr @"scheme.base:%stderr-port"
  ret i64 %t8779
else1897:
  %t8780 = call i64 @rt_car(i64 %t8769)
  %t8781 = call i64 @rt_root(i64 %t8780)
  store i64 %t8781, ptr @"scheme.base:%stderr-port"
  %t8782 = icmp ne i64 1, 1
  br i1 %t8782, label %then1901, label %else1902
then1901:
  ret i64 1
else1902:
  ret i64 17
}

define fastcc i64 @"min-entry:$scheme.base$ccode$ccurrent-error-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8783 = call i64 @rt_null_p(i64 2)
  %t8784 = icmp ne i64 %t8783, 1
  br i1 %t8784, label %then1903, label %else1904
then1903:
  %t8785 = load i64, ptr @"scheme.base:%stderr-port"
  %t8786 = call i64 @rt_not(i64 %t8785)
  %t8787 = icmp ne i64 %t8786, 1
  br i1 %t8787, label %then1905, label %else1906
then1905:
  %t8788 = load i64, ptr @"emit.internal:%make-port"
  %t8789 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8788, i64 6, i64 8, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t8790 = call i64 @rt_root(i64 %t8789)
  store i64 %t8790, ptr @"scheme.base:%stderr-port"
  br label %merge1907
else1906:
  br label %merge1907
merge1907:
  %t8791 = phi i64 [ 17, %then1905 ], [ 17, %else1906 ]
  %t8792 = load i64, ptr @"scheme.base:%stderr-port"
  ret i64 %t8792
else1904:
  %t8793 = call i64 @rt_car(i64 2)
  %t8794 = call i64 @rt_root(i64 %t8793)
  store i64 %t8794, ptr @"scheme.base:%stderr-port"
  %t8795 = icmp ne i64 1, 1
  br i1 %t8795, label %then1908, label %else1909
then1908:
  ret i64 1
else1909:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8800 = icmp sge i64 %argc, 0
  br i1 %t8800, label %argok1911, label %arityerr1910
arityerr1910:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1911:
  %t8801 = call ptr @rt_alloc_words(i64 8)
  %t8802 = getelementptr i64, ptr %t8801, i64 0
  store i64 %a0, ptr %t8802
  %t8803 = getelementptr i64, ptr %t8801, i64 1
  store i64 %a1, ptr %t8803
  %t8804 = getelementptr i64, ptr %t8801, i64 2
  store i64 %a2, ptr %t8804
  %t8805 = getelementptr i64, ptr %t8801, i64 3
  store i64 %a3, ptr %t8805
  %t8806 = getelementptr i64, ptr %t8801, i64 4
  store i64 %a4, ptr %t8806
  %t8807 = getelementptr i64, ptr %t8801, i64 5
  store i64 %a5, ptr %t8807
  %t8808 = getelementptr i64, ptr %t8801, i64 6
  store i64 %a6, ptr %t8808
  %t8809 = getelementptr i64, ptr %t8801, i64 7
  store i64 %a7, ptr %t8809
  %t8810 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t8801, ptr %overflow)
  %t8811 = call i64 @rt_null_p(i64 %t8810)
  %t8812 = icmp ne i64 %t8811, 1
  br i1 %t8812, label %then1912, label %else1913
then1912:
  %t8813 = load i64, ptr @"scheme.base:%stdin-port"
  %t8814 = call i64 @rt_not(i64 %t8813)
  %t8815 = icmp ne i64 %t8814, 1
  br i1 %t8815, label %then1914, label %else1915
then1914:
  %t8816 = load i64, ptr @"emit.internal:%make-port"
  %t8817 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8816, i64 6, i64 1, i64 257, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t8818 = call i64 @rt_root(i64 %t8817)
  store i64 %t8818, ptr @"scheme.base:%stdin-port"
  br label %merge1916
else1915:
  br label %merge1916
merge1916:
  %t8819 = phi i64 [ 17, %then1914 ], [ 17, %else1915 ]
  %t8820 = load i64, ptr @"scheme.base:%stdin-port"
  ret i64 %t8820
else1913:
  %t8821 = call i64 @rt_car(i64 %t8810)
  %t8822 = call i64 @rt_root(i64 %t8821)
  store i64 %t8822, ptr @"scheme.base:%stdin-port"
  %t8823 = icmp ne i64 1, 1
  br i1 %t8823, label %then1917, label %else1918
then1917:
  ret i64 1
else1918:
  ret i64 17
}

define fastcc i64 @"min-entry:$scheme.base$ccode$ccurrent-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8824 = call i64 @rt_null_p(i64 2)
  %t8825 = icmp ne i64 %t8824, 1
  br i1 %t8825, label %then1919, label %else1920
then1919:
  %t8826 = load i64, ptr @"scheme.base:%stdin-port"
  %t8827 = call i64 @rt_not(i64 %t8826)
  %t8828 = icmp ne i64 %t8827, 1
  br i1 %t8828, label %then1921, label %else1922
then1921:
  %t8829 = load i64, ptr @"emit.internal:%make-port"
  %t8830 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8829, i64 6, i64 1, i64 257, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t8831 = call i64 @rt_root(i64 %t8830)
  store i64 %t8831, ptr @"scheme.base:%stdin-port"
  br label %merge1923
else1922:
  br label %merge1923
merge1923:
  %t8832 = phi i64 [ 17, %then1921 ], [ 17, %else1922 ]
  %t8833 = load i64, ptr @"scheme.base:%stdin-port"
  ret i64 %t8833
else1920:
  %t8834 = call i64 @rt_car(i64 2)
  %t8835 = call i64 @rt_root(i64 %t8834)
  store i64 %t8835, ptr @"scheme.base:%stdin-port"
  %t8836 = icmp ne i64 1, 1
  br i1 %t8836, label %then1924, label %else1925
then1924:
  ret i64 1
else1925:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_1437"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8841 = icmp eq i64 %argc, 0
  br i1 %t8841, label %argok1927, label %arityerr1926
arityerr1926:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1927:
  %t8842 = icmp ne i64 1, 1
  br i1 %t8842, label %then1928, label %else1929
then1928:
  ret i64 1
else1929:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_1439"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8843 = icmp eq i64 %argc, 0
  br i1 %t8843, label %argok1931, label %arityerr1930
arityerr1930:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1931:
  %t8844 = and i64 %self, -8
  %t8845 = inttoptr i64 %t8844 to ptr
  %t8846 = getelementptr i64, ptr %t8845, i64 2
  %t8847 = load i64, ptr %t8846
  %t8848 = and i64 %self, -8
  %t8849 = inttoptr i64 %t8848 to ptr
  %t8850 = getelementptr i64, ptr %t8849, i64 1
  %t8851 = load i64, ptr %t8850
  call void @rt_check_callable(i64 %t8851)
  %t8852 = and i64 %t8851, -8
  %t8853 = inttoptr i64 %t8852 to ptr
  %t8854 = load i64, ptr %t8853
  %t8855 = inttoptr i64 %t8854 to ptr
  %t8856 = musttail call fastcc i64 %t8855(i64 %t8851, i64 1, i64 %t8847, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8856
}

define fastcc i64 @"scheme.base:code_1441"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8857 = icmp eq i64 %argc, 0
  br i1 %t8857, label %argok1933, label %arityerr1932
arityerr1932:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1933:
  %t8858 = and i64 %self, -8
  %t8859 = inttoptr i64 %t8858 to ptr
  %t8860 = getelementptr i64, ptr %t8859, i64 1
  %t8861 = load i64, ptr %t8860
  %t8862 = load i64, ptr @"scheme.base:close-port"
  call void @rt_check_callable(i64 %t8862)
  %t8863 = and i64 %t8862, -8
  %t8864 = inttoptr i64 %t8863 to ptr
  %t8865 = load i64, ptr %t8864
  %t8866 = inttoptr i64 %t8865 to ptr
  %t8867 = musttail call fastcc i64 %t8866(i64 %t8862, i64 1, i64 %t8861, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8867
}

define fastcc i64 @"scheme.base:code:call-with-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8868 = icmp eq i64 %argc, 2
  br i1 %t8868, label %argok1935, label %arityerr1934
arityerr1934:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1935:
  %t8869 = call ptr @rt_alloc_words(i64 1)
  %t8870 = ptrtoint ptr %t8869 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1437" to i64), ptr %t8869
  %t8871 = or i64 %t8870, 4
  %t8872 = call ptr @rt_alloc_words(i64 3)
  %t8873 = ptrtoint ptr %t8872 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1439" to i64), ptr %t8872
  %t8874 = getelementptr i64, ptr %t8872, i64 1
  store i64 %a1, ptr %t8874
  %t8875 = getelementptr i64, ptr %t8872, i64 2
  store i64 %a0, ptr %t8875
  %t8876 = or i64 %t8873, 4
  %t8877 = call ptr @rt_alloc_words(i64 2)
  %t8878 = ptrtoint ptr %t8877 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1441" to i64), ptr %t8877
  %t8879 = getelementptr i64, ptr %t8877, i64 1
  store i64 %a0, ptr %t8879
  %t8880 = or i64 %t8878, 4
  %t8881 = load i64, ptr @"scheme.base:dynamic-wind"
  call void @rt_check_callable(i64 %t8881)
  %t8882 = and i64 %t8881, -8
  %t8883 = inttoptr i64 %t8882 to ptr
  %t8884 = load i64, ptr %t8883
  %t8885 = inttoptr i64 %t8884 to ptr
  %t8886 = musttail call fastcc i64 %t8885(i64 %t8881, i64 3, i64 %t8871, i64 %t8876, i64 %t8880, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8886
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
  %t2550 = call ptr @rt_alloc_words(i64 1)
  %t2551 = ptrtoint ptr %t2550 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:unwind-all!" to i64), ptr %t2550
  %t2552 = or i64 %t2551, 4
  %t2553 = call i64 @rt_root(i64 %t2552)
  store i64 %t2553, ptr @"scheme.base:unwind-all!"
  ret i64 17
}

define i64 @"scheme.base:__init_97"() {
entry:
  %t2665 = call ptr @rt_alloc_words(i64 1)
  %t2666 = ptrtoint ptr %t2665 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:dynamic-wind" to i64), ptr %t2665
  %t2667 = or i64 %t2666, 4
  %t2668 = call i64 @rt_root(i64 %t2667)
  store i64 %t2668, ptr @"scheme.base:dynamic-wind"
  ret i64 17
}

define i64 @"scheme.base:__init_98"() {
entry:
  %t2729 = call ptr @rt_alloc_words(i64 1)
  %t2730 = ptrtoint ptr %t2729 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-current-continuation" to i64), ptr %t2729
  %t2731 = or i64 %t2730, 4
  %t2732 = call i64 @rt_root(i64 %t2731)
  store i64 %t2732, ptr @"scheme.base:call-with-current-continuation"
  ret i64 17
}

define i64 @"scheme.base:__init_99"() {
entry:
  %t2740 = call ptr @rt_alloc_words(i64 1)
  %t2741 = ptrtoint ptr %t2740 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call/cc" to i64), ptr %t2740
  %t2742 = or i64 %t2741, 4
  %t2743 = call i64 @rt_root(i64 %t2742)
  store i64 %t2743, ptr @"scheme.base:call/cc"
  ret i64 17
}

define i64 @"scheme.base:__init_100"() {
entry:
  %t2778 = call ptr @rt_alloc_words(i64 1)
  %t2779 = ptrtoint ptr %t2778 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-exception-handler" to i64), ptr %t2778
  %t2780 = or i64 %t2779, 4
  %t2781 = call i64 @rt_root(i64 %t2780)
  store i64 %t2781, ptr @"scheme.base:with-exception-handler"
  ret i64 17
}

define i64 @"scheme.base:__init_101"() {
entry:
  %t2800 = call ptr @rt_alloc_words(i64 1)
  %t2801 = ptrtoint ptr %t2800 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:raise" to i64), ptr %t2800
  %t2802 = or i64 %t2801, 4
  %t2803 = call i64 @rt_root(i64 %t2802)
  store i64 %t2803, ptr @"scheme.base:raise"
  ret i64 17
}

define i64 @"scheme.base:__init_102"() {
entry:
  %t2858 = call ptr @rt_alloc_words(i64 1)
  %t2859 = ptrtoint ptr %t2858 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:raise-continuable" to i64), ptr %t2858
  %t2860 = or i64 %t2859, 4
  %t2861 = call i64 @rt_root(i64 %t2860)
  store i64 %t2861, ptr @"scheme.base:raise-continuable"
  ret i64 17
}

define i64 @"scheme.base:__init_103"() {
entry:
  %t2864 = call ptr @rt_alloc_words(i64 1)
  %t2865 = ptrtoint ptr %t2864 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object?" to i64), ptr %t2864
  %t2866 = or i64 %t2865, 4
  %t2867 = call i64 @rt_root(i64 %t2866)
  store i64 %t2867, ptr @"scheme.base:error-object?"
  ret i64 17
}

define i64 @"scheme.base:__init_104"() {
entry:
  %t2870 = call ptr @rt_alloc_words(i64 1)
  %t2871 = ptrtoint ptr %t2870 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-message" to i64), ptr %t2870
  %t2872 = or i64 %t2871, 4
  %t2873 = call i64 @rt_root(i64 %t2872)
  store i64 %t2873, ptr @"scheme.base:error-object-message"
  ret i64 17
}

define i64 @"scheme.base:__init_105"() {
entry:
  %t2876 = call ptr @rt_alloc_words(i64 1)
  %t2877 = ptrtoint ptr %t2876 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-irritants" to i64), ptr %t2876
  %t2878 = or i64 %t2877, 4
  %t2879 = call i64 @rt_root(i64 %t2878)
  store i64 %t2879, ptr @"scheme.base:error-object-irritants"
  ret i64 17
}

define i64 @"scheme.base:__init_106"() {
entry:
  %t2886 = call ptr @rt_alloc_words(i64 1)
  %t2887 = ptrtoint ptr %t2886 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-error?" to i64), ptr %t2886
  %t2888 = or i64 %t2887, 4
  %t2889 = call i64 @rt_root(i64 %t2888)
  store i64 %t2889, ptr @"scheme.base:read-error?"
  ret i64 17
}

define i64 @"scheme.base:__init_107"() {
entry:
  %t2896 = call ptr @rt_alloc_words(i64 1)
  %t2897 = ptrtoint ptr %t2896 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:file-error?" to i64), ptr %t2896
  %t2898 = or i64 %t2897, 4
  %t2899 = call i64 @rt_root(i64 %t2898)
  store i64 %t2899, ptr @"scheme.base:file-error?"
  ret i64 17
}

define i64 @"scheme.base:__init_108"() {
entry:
  %t3038 = call ptr @rt_alloc_words(i64 1)
  %t3039 = ptrtoint ptr %t3038 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-parameter" to i64), ptr %t3038
  %t3040 = or i64 %t3039, 4
  %t3041 = call i64 @rt_root(i64 %t3040)
  store i64 %t3041, ptr @"scheme.base:make-parameter"
  ret i64 17
}

define i64 @"scheme.base:__init_109"() {
entry:
  %t3122 = call ptr @rt_alloc_words(i64 1)
  %t3123 = ptrtoint ptr %t3122 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-parameters" to i64), ptr %t3122
  %t3124 = or i64 %t3123, 4
  %t3125 = call i64 @rt_root(i64 %t3124)
  store i64 %t3125, ptr @"scheme.base:with-parameters"
  ret i64 17
}

define i64 @"scheme.base:__init_110"() {
entry:
  %t3163 = call ptr @rt_alloc_words(i64 1)
  %t3164 = ptrtoint ptr %t3163 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->vector" to i64), ptr %t3163
  %t3165 = or i64 %t3164, 4
  %t3166 = call i64 @rt_root(i64 %t3165)
  store i64 %t3166, ptr @"scheme.base:list->vector"
  ret i64 17
}

define i64 @"scheme.base:__init_111"() {
entry:
  %t3190 = call ptr @rt_alloc_words(i64 1)
  %t3191 = ptrtoint ptr %t3190 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector" to i64), ptr %t3190
  %t3192 = or i64 %t3191, 4
  %t3193 = call i64 @rt_root(i64 %t3192)
  store i64 %t3193, ptr @"scheme.base:vector"
  ret i64 17
}

define i64 @"scheme.base:__init_112"() {
entry:
  %t3231 = call ptr @rt_alloc_words(i64 1)
  %t3232 = ptrtoint ptr %t3231 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->bytevector" to i64), ptr %t3231
  %t3233 = or i64 %t3232, 4
  %t3234 = call i64 @rt_root(i64 %t3233)
  store i64 %t3234, ptr @"scheme.base:list->bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_113"() {
entry:
  %t3258 = call ptr @rt_alloc_words(i64 1)
  %t3259 = ptrtoint ptr %t3258 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector" to i64), ptr %t3258
  %t3260 = or i64 %t3259, 4
  %t3261 = call i64 @rt_root(i64 %t3260)
  store i64 %t3261, ptr @"scheme.base:bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_114"() {
entry:
  %t3266 = call ptr @rt_alloc_words(i64 1)
  %t3267 = ptrtoint ptr %t3266 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rng-start" to i64), ptr %t3266
  %t3268 = or i64 %t3267, 4
  %t3269 = call i64 @rt_root(i64 %t3268)
  store i64 %t3269, ptr @"scheme.base:rng-start"
  ret i64 17
}

define i64 @"scheme.base:__init_115"() {
entry:
  %t3279 = call ptr @rt_alloc_words(i64 1)
  %t3280 = ptrtoint ptr %t3279 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rng-end" to i64), ptr %t3279
  %t3281 = or i64 %t3280, 4
  %t3282 = call i64 @rt_root(i64 %t3281)
  store i64 %t3282, ptr @"scheme.base:rng-end"
  ret i64 17
}

define i64 @"scheme.base:__init_116"() {
entry:
  %t3344 = call ptr @rt_alloc_words(i64 1)
  %t3345 = ptrtoint ptr %t3344 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rng-check" to i64), ptr %t3344
  %t3346 = or i64 %t3345, 4
  %t3347 = call i64 @rt_root(i64 %t3346)
  store i64 %t3347, ptr @"scheme.base:rng-check"
  ret i64 17
}

define i64 @"scheme.base:__init_117"() {
entry:
  %t3363 = call ptr @rt_alloc_words(i64 1)
  %t3364 = ptrtoint ptr %t3363 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:assv" to i64), ptr %t3363
  %t3365 = or i64 %t3364, 4
  %t3366 = call i64 @rt_root(i64 %t3365)
  store i64 %t3366, ptr @"scheme.base:assv"
  ret i64 17
}

define i64 @"scheme.base:__init_118"() {
entry:
  %t3379 = call ptr @rt_alloc_words(i64 1)
  %t3380 = ptrtoint ptr %t3379 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-copy" to i64), ptr %t3379
  %t3381 = or i64 %t3380, 4
  %t3382 = call i64 @rt_root(i64 %t3381)
  store i64 %t3382, ptr @"scheme.base:list-copy"
  ret i64 17
}

define i64 @"scheme.base:__init_119"() {
entry:
  %t3408 = call ptr @rt_alloc_words(i64 1)
  %t3409 = ptrtoint ptr %t3408 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:boolean=?" to i64), ptr %t3408
  %t3410 = or i64 %t3409, 4
  %t3411 = call i64 @rt_root(i64 %t3410)
  store i64 %t3411, ptr @"scheme.base:boolean=?"
  ret i64 17
}

define i64 @"scheme.base:__init_120"() {
entry:
  %t3437 = call ptr @rt_alloc_words(i64 1)
  %t3438 = ptrtoint ptr %t3437 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:symbol=?" to i64), ptr %t3437
  %t3439 = or i64 %t3438, 4
  %t3440 = call i64 @rt_root(i64 %t3439)
  store i64 %t3440, ptr @"scheme.base:symbol=?"
  ret i64 17
}

define i64 @"scheme.base:__init_121"() {
entry:
  %t3455 = call ptr @rt_alloc_words(i64 1)
  %t3456 = ptrtoint ptr %t3455 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:eqv-chain?" to i64), ptr %t3455
  %t3457 = or i64 %t3456, 4
  %t3458 = call i64 @rt_root(i64 %t3457)
  store i64 %t3458, ptr @"scheme.base:eqv-chain?"
  ret i64 17
}

define i64 @"scheme.base:__init_122"() {
entry:
  %t3558 = call ptr @rt_alloc_words(i64 1)
  %t3559 = ptrtoint ptr %t3558 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-cmp" to i64), ptr %t3558
  %t3560 = or i64 %t3559, 4
  %t3561 = call i64 @rt_root(i64 %t3560)
  store i64 %t3561, ptr @"scheme.base:str-cmp"
  ret i64 17
}

define i64 @"scheme.base:__init_123"() {
entry:
  %t3580 = call ptr @rt_alloc_words(i64 1)
  %t3581 = ptrtoint ptr %t3580 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-chain?" to i64), ptr %t3580
  %t3582 = or i64 %t3581, 4
  %t3583 = call i64 @rt_root(i64 %t3582)
  store i64 %t3583, ptr @"scheme.base:str-chain?"
  ret i64 17
}

define i64 @"scheme.base:__init_124"() {
entry:
  %t3629 = call ptr @rt_alloc_words(i64 1)
  %t3630 = ptrtoint ptr %t3629 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string<?" to i64), ptr %t3629
  %t3631 = or i64 %t3630, 4
  %t3632 = call i64 @rt_root(i64 %t3631)
  store i64 %t3632, ptr @"scheme.base:string<?"
  ret i64 17
}

define i64 @"scheme.base:__init_125"() {
entry:
  %t3678 = call ptr @rt_alloc_words(i64 1)
  %t3679 = ptrtoint ptr %t3678 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string>?" to i64), ptr %t3678
  %t3680 = or i64 %t3679, 4
  %t3681 = call i64 @rt_root(i64 %t3680)
  store i64 %t3681, ptr @"scheme.base:string>?"
  ret i64 17
}

define i64 @"scheme.base:__init_126"() {
entry:
  %t3728 = call ptr @rt_alloc_words(i64 1)
  %t3729 = ptrtoint ptr %t3728 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string<=?" to i64), ptr %t3728
  %t3730 = or i64 %t3729, 4
  %t3731 = call i64 @rt_root(i64 %t3730)
  store i64 %t3731, ptr @"scheme.base:string<=?"
  ret i64 17
}

define i64 @"scheme.base:__init_127"() {
entry:
  %t3778 = call ptr @rt_alloc_words(i64 1)
  %t3779 = ptrtoint ptr %t3778 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string>=?" to i64), ptr %t3778
  %t3780 = or i64 %t3779, 4
  %t3781 = call i64 @rt_root(i64 %t3780)
  store i64 %t3781, ptr @"scheme.base:string>=?"
  ret i64 17
}

define i64 @"scheme.base:__init_128"() {
entry:
  %t3891 = call ptr @rt_alloc_words(i64 1)
  %t3892 = ptrtoint ptr %t3891 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector->list" to i64), ptr %t3891
  %t3893 = or i64 %t3892, 4
  %t3894 = call i64 @rt_root(i64 %t3893)
  store i64 %t3894, ptr @"scheme.base:vector->list"
  ret i64 17
}

define i64 @"scheme.base:__init_129"() {
entry:
  %t4030 = call ptr @rt_alloc_words(i64 1)
  %t4031 = ptrtoint ptr %t4030 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-copy" to i64), ptr %t4030
  %t4032 = or i64 %t4031, 4
  %t4033 = call i64 @rt_root(i64 %t4032)
  store i64 %t4033, ptr @"scheme.base:vector-copy"
  ret i64 17
}

define i64 @"scheme.base:__init_130"() {
entry:
  %t4169 = call ptr @rt_alloc_words(i64 1)
  %t4170 = ptrtoint ptr %t4169 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-append" to i64), ptr %t4169
  %t4171 = or i64 %t4170, 4
  %t4172 = call i64 @rt_root(i64 %t4171)
  store i64 %t4172, ptr @"scheme.base:vector-append"
  ret i64 17
}

define i64 @"scheme.base:__init_131"() {
entry:
  %t4193 = call ptr @rt_alloc_words(i64 1)
  %t4194 = ptrtoint ptr %t4193 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vec-total" to i64), ptr %t4193
  %t4195 = or i64 %t4194, 4
  %t4196 = call i64 @rt_root(i64 %t4195)
  store i64 %t4196, ptr @"scheme.base:vec-total"
  ret i64 17
}

define i64 @"scheme.base:__init_132"() {
entry:
  %t4301 = call ptr @rt_alloc_words(i64 1)
  %t4302 = ptrtoint ptr %t4301 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-fill!" to i64), ptr %t4301
  %t4303 = or i64 %t4302, 4
  %t4304 = call i64 @rt_root(i64 %t4303)
  store i64 %t4304, ptr @"scheme.base:vector-fill!"
  ret i64 17
}

define i64 @"scheme.base:__init_133"() {
entry:
  %t4622 = call ptr @rt_alloc_words(i64 1)
  %t4623 = ptrtoint ptr %t4622 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-copy!" to i64), ptr %t4622
  %t4624 = or i64 %t4623, 4
  %t4625 = call i64 @rt_root(i64 %t4624)
  store i64 %t4625, ptr @"scheme.base:vector-copy!"
  ret i64 17
}

define i64 @"scheme.base:__init_134"() {
entry:
  %t4814 = call ptr @rt_alloc_words(i64 1)
  %t4815 = ptrtoint ptr %t4814 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-map" to i64), ptr %t4814
  %t4816 = or i64 %t4815, 4
  %t4817 = call i64 @rt_root(i64 %t4816)
  store i64 %t4817, ptr @"scheme.base:vector-map"
  ret i64 17
}

define i64 @"scheme.base:__init_135"() {
entry:
  %t4992 = call ptr @rt_alloc_words(i64 1)
  %t4993 = ptrtoint ptr %t4992 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-for-each" to i64), ptr %t4992
  %t4994 = or i64 %t4993, 4
  %t4995 = call i64 @rt_root(i64 %t4994)
  store i64 %t4995, ptr @"scheme.base:vector-for-each"
  ret i64 17
}

define i64 @"scheme.base:__init_136"() {
entry:
  %t5019 = call ptr @rt_alloc_words(i64 1)
  %t5020 = ptrtoint ptr %t5019 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vec-min-len" to i64), ptr %t5019
  %t5021 = or i64 %t5020, 4
  %t5022 = call i64 @rt_root(i64 %t5021)
  store i64 %t5022, ptr @"scheme.base:vec-min-len"
  ret i64 17
}

define i64 @"scheme.base:__init_137"() {
entry:
  %t5036 = call ptr @rt_alloc_words(i64 1)
  %t5037 = ptrtoint ptr %t5036 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vec-nth" to i64), ptr %t5036
  %t5038 = or i64 %t5037, 4
  %t5039 = call i64 @rt_root(i64 %t5038)
  store i64 %t5039, ptr @"scheme.base:vec-nth"
  ret i64 17
}

define i64 @"scheme.base:__init_138"() {
entry:
  %t5175 = call ptr @rt_alloc_words(i64 1)
  %t5176 = ptrtoint ptr %t5175 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string->vector" to i64), ptr %t5175
  %t5177 = or i64 %t5176, 4
  %t5178 = call i64 @rt_root(i64 %t5177)
  store i64 %t5178, ptr @"scheme.base:string->vector"
  ret i64 17
}

define i64 @"scheme.base:__init_139"() {
entry:
  %t5244 = call ptr @rt_alloc_words(i64 1)
  %t5245 = ptrtoint ptr %t5244 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector->string" to i64), ptr %t5244
  %t5246 = or i64 %t5245, 4
  %t5247 = call i64 @rt_root(i64 %t5246)
  store i64 %t5247, ptr @"scheme.base:vector->string"
  ret i64 17
}

define i64 @"scheme.base:__init_140"() {
entry:
  %t5305 = call ptr @rt_alloc_words(i64 1)
  %t5306 = ptrtoint ptr %t5305 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-map" to i64), ptr %t5305
  %t5307 = or i64 %t5306, 4
  %t5308 = call i64 @rt_root(i64 %t5307)
  store i64 %t5308, ptr @"scheme.base:string-map"
  ret i64 17
}

define i64 @"scheme.base:__init_141"() {
entry:
  %t5326 = call ptr @rt_alloc_words(i64 1)
  %t5327 = ptrtoint ptr %t5326 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-map1" to i64), ptr %t5326
  %t5328 = or i64 %t5327, 4
  %t5329 = call i64 @rt_root(i64 %t5328)
  store i64 %t5329, ptr @"scheme.base:str-map1"
  ret i64 17
}

define i64 @"scheme.base:__init_142"() {
entry:
  %t5409 = call ptr @rt_alloc_words(i64 1)
  %t5410 = ptrtoint ptr %t5409 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-mapn" to i64), ptr %t5409
  %t5411 = or i64 %t5410, 4
  %t5412 = call i64 @rt_root(i64 %t5411)
  store i64 %t5412, ptr @"scheme.base:str-mapn"
  ret i64 17
}

define i64 @"scheme.base:__init_143"() {
entry:
  %t5587 = call ptr @rt_alloc_words(i64 1)
  %t5588 = ptrtoint ptr %t5587 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-for-each" to i64), ptr %t5587
  %t5589 = or i64 %t5588, 4
  %t5590 = call i64 @rt_root(i64 %t5589)
  store i64 %t5590, ptr @"scheme.base:string-for-each"
  ret i64 17
}

define i64 @"scheme.base:__init_144"() {
entry:
  %t5614 = call ptr @rt_alloc_words(i64 1)
  %t5615 = ptrtoint ptr %t5614 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-min-len" to i64), ptr %t5614
  %t5616 = or i64 %t5615, 4
  %t5617 = call i64 @rt_root(i64 %t5616)
  store i64 %t5617, ptr @"scheme.base:str-min-len"
  ret i64 17
}

define i64 @"scheme.base:__init_145"() {
entry:
  %t5631 = call ptr @rt_alloc_words(i64 1)
  %t5632 = ptrtoint ptr %t5631 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-nth" to i64), ptr %t5631
  %t5633 = or i64 %t5632, 4
  %t5634 = call i64 @rt_root(i64 %t5633)
  store i64 %t5634, ptr @"scheme.base:str-nth"
  ret i64 17
}

define i64 @"scheme.base:__init_146"() {
entry:
  %t5739 = call ptr @rt_alloc_words(i64 1)
  %t5740 = ptrtoint ptr %t5739 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-fill!" to i64), ptr %t5739
  %t5741 = or i64 %t5740, 4
  %t5742 = call i64 @rt_root(i64 %t5741)
  store i64 %t5742, ptr @"scheme.base:string-fill!"
  ret i64 17
}

define i64 @"scheme.base:__init_147"() {
entry:
  %t6060 = call ptr @rt_alloc_words(i64 1)
  %t6061 = ptrtoint ptr %t6060 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-copy!" to i64), ptr %t6060
  %t6062 = or i64 %t6061, 4
  %t6063 = call i64 @rt_root(i64 %t6062)
  store i64 %t6063, ptr @"scheme.base:string-copy!"
  ret i64 17
}

define i64 @"scheme.base:__init_148"() {
entry:
  %t6199 = call ptr @rt_alloc_words(i64 1)
  %t6200 = ptrtoint ptr %t6199 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector-copy" to i64), ptr %t6199
  %t6201 = or i64 %t6200, 4
  %t6202 = call i64 @rt_root(i64 %t6201)
  store i64 %t6202, ptr @"scheme.base:bytevector-copy"
  ret i64 17
}

define i64 @"scheme.base:__init_149"() {
entry:
  %t6520 = call ptr @rt_alloc_words(i64 1)
  %t6521 = ptrtoint ptr %t6520 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector-copy!" to i64), ptr %t6520
  %t6522 = or i64 %t6521, 4
  %t6523 = call i64 @rt_root(i64 %t6522)
  store i64 %t6523, ptr @"scheme.base:bytevector-copy!"
  ret i64 17
}

define i64 @"scheme.base:__init_150"() {
entry:
  %t6659 = call ptr @rt_alloc_words(i64 1)
  %t6660 = ptrtoint ptr %t6659 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector-append" to i64), ptr %t6659
  %t6661 = or i64 %t6660, 4
  %t6662 = call i64 @rt_root(i64 %t6661)
  store i64 %t6662, ptr @"scheme.base:bytevector-append"
  ret i64 17
}

define i64 @"scheme.base:__init_151"() {
entry:
  %t6683 = call ptr @rt_alloc_words(i64 1)
  %t6684 = ptrtoint ptr %t6683 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bv-total" to i64), ptr %t6683
  %t6685 = or i64 %t6684, 4
  %t6686 = call i64 @rt_root(i64 %t6685)
  store i64 %t6686, ptr @"scheme.base:bv-total"
  ret i64 17
}

define i64 @"scheme.base:__init_152"() {
entry:
  %t6687 = call i64 @rt_root(i64 8000000)
  store i64 %t6687, ptr @"scheme.base:rat-max-denom"
  ret i64 17
}

define i64 @"scheme.base:__init_153"() {
entry:
  %t6736 = call ptr @rt_alloc_words(i64 1)
  %t6737 = ptrtoint ptr %t6736 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rationalize" to i64), ptr %t6736
  %t6738 = or i64 %t6737, 4
  %t6739 = call i64 @rt_root(i64 %t6738)
  store i64 %t6739, ptr @"scheme.base:rationalize"
  ret i64 17
}

define i64 @"scheme.base:__init_154"() {
entry:
  %t6856 = call ptr @rt_alloc_words(i64 1)
  %t6857 = ptrtoint ptr %t6856 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-exact" to i64), ptr %t6856
  %t6858 = or i64 %t6857, 4
  %t6859 = call i64 @rt_root(i64 %t6858)
  store i64 %t6859, ptr @"scheme.base:rat-exact"
  ret i64 17
}

define i64 @"scheme.base:__init_155"() {
entry:
  %t6861 = call ptr @rt_alloc_words(i64 1)
  %t6862 = ptrtoint ptr %t6861 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-ceil" to i64), ptr %t6861
  %t6863 = or i64 %t6862, 4
  %t6864 = call i64 @rt_root(i64 %t6863)
  store i64 %t6864, ptr @"scheme.base:rat-ceil"
  ret i64 17
}

define i64 @"scheme.base:__init_156"() {
entry:
  %t6866 = call ptr @rt_alloc_words(i64 1)
  %t6867 = ptrtoint ptr %t6866 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-floor" to i64), ptr %t6866
  %t6868 = or i64 %t6867, 4
  %t6869 = call i64 @rt_root(i64 %t6868)
  store i64 %t6869, ptr @"scheme.base:rat-floor"
  ret i64 17
}

define i64 @"scheme.base:__init_157"() {
entry:
  %t6986 = call ptr @rt_alloc_words(i64 1)
  %t6987 = ptrtoint ptr %t6986 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-inexact" to i64), ptr %t6986
  %t6988 = or i64 %t6987, 4
  %t6989 = call i64 @rt_root(i64 %t6988)
  store i64 %t6989, ptr @"scheme.base:rat-inexact"
  ret i64 17
}

define i64 @"scheme.base:__init_158"() {
entry:
  %t7015 = call ptr @rt_alloc_words(i64 1)
  %t7016 = ptrtoint ptr %t7015 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-num-in" to i64), ptr %t7015
  %t7017 = or i64 %t7016, 4
  %t7018 = call i64 @rt_root(i64 %t7017)
  store i64 %t7018, ptr @"scheme.base:rat-num-in"
  ret i64 17
}

define i64 @"scheme.base:__init_159"() {
entry:
  %t7044 = call ptr @rt_alloc_words(i64 1)
  %t7045 = ptrtoint ptr %t7044 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-ceil-flo" to i64), ptr %t7044
  %t7046 = or i64 %t7045, 4
  %t7047 = call i64 @rt_root(i64 %t7046)
  store i64 %t7047, ptr @"scheme.base:rat-ceil-flo"
  ret i64 17
}

define i64 @"scheme.base:__init_160"() {
entry:
  %t7075 = call ptr @rt_alloc_words(i64 1)
  %t7076 = ptrtoint ptr %t7075 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:values" to i64), ptr %t7075
  %t7077 = or i64 %t7076, 4
  %t7078 = call i64 @rt_root(i64 %t7077)
  store i64 %t7078, ptr @"scheme.base:values"
  ret i64 17
}

define i64 @"scheme.base:__init_161"() {
entry:
  %t7120 = call ptr @rt_alloc_words(i64 1)
  %t7121 = ptrtoint ptr %t7120 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-values" to i64), ptr %t7120
  %t7122 = or i64 %t7121, 4
  %t7123 = call i64 @rt_root(i64 %t7122)
  store i64 %t7123, ptr @"scheme.base:call-with-values"
  ret i64 17
}

define i64 @"scheme.base:__init_162"() {
entry:
  %t7124 = call i64 @rt_root(i64 64)
  store i64 %t7124, ptr @"scheme.base:%ht-initial-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_163"() {
entry:
  %t7125 = call i64 @rt_root(i64 24)
  store i64 %t7125, ptr @"scheme.base:%ht-load-factor"
  ret i64 17
}

define i64 @"scheme.base:__init_164"() {
entry:
  %t7136 = call ptr @rt_alloc_words(i64 1)
  %t7137 = ptrtoint ptr %t7136 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-hash-table" to i64), ptr %t7136
  %t7138 = or i64 %t7137, 4
  %t7139 = call i64 @rt_root(i64 %t7138)
  store i64 %t7139, ptr @"scheme.base:make-hash-table"
  ret i64 17
}

define i64 @"scheme.base:__init_165"() {
entry:
  %t7150 = call ptr @rt_alloc_words(i64 1)
  %t7151 = ptrtoint ptr %t7150 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-eq-hash-table" to i64), ptr %t7150
  %t7152 = or i64 %t7151, 4
  %t7153 = call i64 @rt_root(i64 %t7152)
  store i64 %t7153, ptr @"scheme.base:make-eq-hash-table"
  ret i64 17
}

define i64 @"scheme.base:__init_166"() {
entry:
  %t7156 = call ptr @rt_alloc_words(i64 1)
  %t7157 = ptrtoint ptr %t7156 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table?" to i64), ptr %t7156
  %t7158 = or i64 %t7157, 4
  %t7159 = call i64 @rt_root(i64 %t7158)
  store i64 %t7159, ptr @"scheme.base:hash-table?"
  ret i64 17
}

define i64 @"scheme.base:__init_167"() {
entry:
  %t7163 = call ptr @rt_alloc_words(i64 1)
  %t7164 = ptrtoint ptr %t7163 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-count" to i64), ptr %t7163
  %t7165 = or i64 %t7164, 4
  %t7166 = call i64 @rt_root(i64 %t7165)
  store i64 %t7166, ptr @"scheme.base:%ht-count"
  ret i64 17
}

define i64 @"scheme.base:__init_168"() {
entry:
  %t7170 = call ptr @rt_alloc_words(i64 1)
  %t7171 = ptrtoint ptr %t7170 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-buckets" to i64), ptr %t7170
  %t7172 = or i64 %t7171, 4
  %t7173 = call i64 @rt_root(i64 %t7172)
  store i64 %t7173, ptr @"scheme.base:%ht-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_169"() {
entry:
  %t7177 = call ptr @rt_alloc_words(i64 1)
  %t7178 = ptrtoint ptr %t7177 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-identity?" to i64), ptr %t7177
  %t7179 = or i64 %t7178, 4
  %t7180 = call i64 @rt_root(i64 %t7179)
  store i64 %t7180, ptr @"scheme.base:%ht-identity?"
  ret i64 17
}

define i64 @"scheme.base:__init_170"() {
entry:
  %t7184 = call ptr @rt_alloc_words(i64 1)
  %t7185 = ptrtoint ptr %t7184 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-count!" to i64), ptr %t7184
  %t7186 = or i64 %t7185, 4
  %t7187 = call i64 @rt_root(i64 %t7186)
  store i64 %t7187, ptr @"scheme.base:%ht-set-count!"
  ret i64 17
}

define i64 @"scheme.base:__init_171"() {
entry:
  %t7191 = call ptr @rt_alloc_words(i64 1)
  %t7192 = ptrtoint ptr %t7191 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-buckets!" to i64), ptr %t7191
  %t7193 = or i64 %t7192, 4
  %t7194 = call i64 @rt_root(i64 %t7193)
  store i64 %t7194, ptr @"scheme.base:%ht-set-buckets!"
  ret i64 17
}

define i64 @"scheme.base:__init_172"() {
entry:
  %t7205 = call ptr @rt_alloc_words(i64 1)
  %t7206 = ptrtoint ptr %t7205 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-hash" to i64), ptr %t7205
  %t7207 = or i64 %t7206, 4
  %t7208 = call i64 @rt_root(i64 %t7207)
  store i64 %t7208, ptr @"scheme.base:%ht-hash"
  ret i64 17
}

define i64 @"scheme.base:__init_173"() {
entry:
  %t7219 = call ptr @rt_alloc_words(i64 1)
  %t7220 = ptrtoint ptr %t7219 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-key=?" to i64), ptr %t7219
  %t7221 = or i64 %t7220, 4
  %t7222 = call i64 @rt_root(i64 %t7221)
  store i64 %t7222, ptr @"scheme.base:%ht-key=?"
  ret i64 17
}

define i64 @"scheme.base:__init_174"() {
entry:
  %t7231 = call ptr @rt_alloc_words(i64 1)
  %t7232 = ptrtoint ptr %t7231 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-index" to i64), ptr %t7231
  %t7233 = or i64 %t7232, 4
  %t7234 = call i64 @rt_root(i64 %t7233)
  store i64 %t7234, ptr @"scheme.base:%ht-index"
  ret i64 17
}

define i64 @"scheme.base:__init_175"() {
entry:
  %t7255 = call ptr @rt_alloc_words(i64 1)
  %t7256 = ptrtoint ptr %t7255 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-assoc" to i64), ptr %t7255
  %t7257 = or i64 %t7256, 4
  %t7258 = call i64 @rt_root(i64 %t7257)
  store i64 %t7258, ptr @"scheme.base:%ht-assoc"
  ret i64 17
}

define i64 @"scheme.base:__init_176"() {
entry:
  %t7281 = call ptr @rt_alloc_words(i64 1)
  %t7282 = ptrtoint ptr %t7281 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-remove" to i64), ptr %t7281
  %t7283 = or i64 %t7282, 4
  %t7284 = call i64 @rt_root(i64 %t7283)
  store i64 %t7284, ptr @"scheme.base:%ht-remove"
  ret i64 17
}

define i64 @"scheme.base:__init_177"() {
entry:
  %t7308 = call ptr @rt_alloc_words(i64 1)
  %t7309 = ptrtoint ptr %t7308 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref/default" to i64), ptr %t7308
  %t7310 = or i64 %t7309, 4
  %t7311 = call i64 @rt_root(i64 %t7310)
  store i64 %t7311, ptr @"scheme.base:hash-table-ref/default"
  ret i64 17
}

define i64 @"scheme.base:__init_178"() {
entry:
  %t7334 = call ptr @rt_alloc_words(i64 1)
  %t7335 = ptrtoint ptr %t7334 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-contains?" to i64), ptr %t7334
  %t7336 = or i64 %t7335, 4
  %t7337 = call i64 @rt_root(i64 %t7336)
  store i64 %t7337, ptr @"scheme.base:hash-table-contains?"
  ret i64 17
}

define i64 @"scheme.base:__init_179"() {
entry:
  %t7368 = call ptr @rt_alloc_words(i64 1)
  %t7369 = ptrtoint ptr %t7368 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref" to i64), ptr %t7368
  %t7370 = or i64 %t7369, 4
  %t7371 = call i64 @rt_root(i64 %t7370)
  store i64 %t7371, ptr @"scheme.base:hash-table-ref"
  ret i64 17
}

define i64 @"scheme.base:__init_180"() {
entry:
  %t7455 = call ptr @rt_alloc_words(i64 1)
  %t7456 = ptrtoint ptr %t7455 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-set!" to i64), ptr %t7455
  %t7457 = or i64 %t7456, 4
  %t7458 = call i64 @rt_root(i64 %t7457)
  store i64 %t7458, ptr @"scheme.base:hash-table-set!"
  ret i64 17
}

define i64 @"scheme.base:__init_181"() {
entry:
  %t7508 = call ptr @rt_alloc_words(i64 1)
  %t7509 = ptrtoint ptr %t7508 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-delete!" to i64), ptr %t7508
  %t7510 = or i64 %t7509, 4
  %t7511 = call i64 @rt_root(i64 %t7510)
  store i64 %t7511, ptr @"scheme.base:hash-table-delete!"
  ret i64 17
}

define i64 @"scheme.base:__init_182"() {
entry:
  %t7625 = call ptr @rt_alloc_words(i64 1)
  %t7626 = ptrtoint ptr %t7625 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-grow!" to i64), ptr %t7625
  %t7627 = or i64 %t7626, 4
  %t7628 = call i64 @rt_root(i64 %t7627)
  store i64 %t7628, ptr @"scheme.base:%ht-grow!"
  ret i64 17
}

define i64 @"scheme.base:__init_183"() {
entry:
  %t7636 = call ptr @rt_alloc_words(i64 1)
  %t7637 = ptrtoint ptr %t7636 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-size" to i64), ptr %t7636
  %t7638 = or i64 %t7637, 4
  %t7639 = call i64 @rt_root(i64 %t7638)
  store i64 %t7639, ptr @"scheme.base:hash-table-size"
  ret i64 17
}

define i64 @"scheme.base:__init_184"() {
entry:
  %t7656 = call ptr @rt_alloc_words(i64 1)
  %t7657 = ptrtoint ptr %t7656 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-fold-buckets" to i64), ptr %t7656
  %t7658 = or i64 %t7657, 4
  %t7659 = call i64 @rt_root(i64 %t7658)
  store i64 %t7659, ptr @"scheme.base:%ht-fold-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_185"() {
entry:
  %t7707 = call ptr @rt_alloc_words(i64 1)
  %t7708 = ptrtoint ptr %t7707 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table->alist" to i64), ptr %t7707
  %t7709 = or i64 %t7708, 4
  %t7710 = call i64 @rt_root(i64 %t7709)
  store i64 %t7710, ptr @"scheme.base:hash-table->alist"
  ret i64 17
}

define i64 @"scheme.base:__init_186"() {
entry:
  %t7729 = call ptr @rt_alloc_words(i64 1)
  %t7730 = ptrtoint ptr %t7729 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-keys" to i64), ptr %t7729
  %t7731 = or i64 %t7730, 4
  %t7732 = call i64 @rt_root(i64 %t7731)
  store i64 %t7732, ptr @"scheme.base:hash-table-keys"
  ret i64 17
}

define i64 @"scheme.base:__init_187"() {
entry:
  %t7751 = call ptr @rt_alloc_words(i64 1)
  %t7752 = ptrtoint ptr %t7751 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-values" to i64), ptr %t7751
  %t7753 = or i64 %t7752, 4
  %t7754 = call i64 @rt_root(i64 %t7753)
  store i64 %t7754, ptr @"scheme.base:hash-table-values"
  ret i64 17
}

define i64 @"scheme.base:__init_188"() {
entry:
  %t8001 = call ptr @rt_alloc_words(i64 1)
  %t8002 = ptrtoint ptr %t8001 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-report" to i64), ptr %t8001
  %t8003 = or i64 %t8002, 4
  %t8004 = call i64 @rt_root(i64 %t8003)
  store i64 %t8004, ptr @"scheme.base:rd-report"
  ret i64 17
}

define i64 @"scheme.base:__init_189"() {
entry:
  %t8026 = call ptr @rt_alloc_words(i64 1)
  %t8027 = ptrtoint ptr %t8026 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-from-string" to i64), ptr %t8026
  %t8028 = or i64 %t8027, 4
  %t8029 = call i64 @rt_root(i64 %t8028)
  store i64 %t8029, ptr @"scheme.base:read-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_190"() {
entry:
  %t8037 = call ptr @rt_alloc_words(i64 1)
  %t8038 = ptrtoint ptr %t8037 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-all-from-string" to i64), ptr %t8037
  %t8039 = or i64 %t8038, 4
  %t8040 = call i64 @rt_root(i64 %t8039)
  store i64 %t8040, ptr @"scheme.base:read-all-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_191"() {
entry:
  %t8048 = call ptr @rt_alloc_words(i64 1)
  %t8049 = ptrtoint ptr %t8048 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-all-from-string-ci" to i64), ptr %t8048
  %t8050 = or i64 %t8049, 4
  %t8051 = call i64 @rt_root(i64 %t8050)
  store i64 %t8051, ptr @"scheme.base:read-all-from-string-ci"
  ret i64 17
}

define i64 @"scheme.base:__init_192"() {
entry:
  %t8158 = call ptr @rt_alloc_words(i64 1)
  %t8159 = ptrtoint ptr %t8158 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-all" to i64), ptr %t8158
  %t8160 = or i64 %t8159, 4
  %t8161 = call i64 @rt_root(i64 %t8160)
  store i64 %t8161, ptr @"scheme.base:rd-all"
  ret i64 17
}

define i64 @"scheme.base:__init_193"() {
entry:
  %t8166 = call ptr @rt_alloc_words(i64 1)
  %t8167 = ptrtoint ptr %t8166 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port?" to i64), ptr %t8166
  %t8168 = or i64 %t8167, 4
  %t8169 = call i64 @rt_root(i64 %t8168)
  store i64 %t8169, ptr @"scheme.base:port?"
  ret i64 17
}

define i64 @"scheme.base:__init_194"() {
entry:
  %t8179 = call ptr @rt_alloc_words(i64 1)
  %t8180 = ptrtoint ptr %t8179 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port?" to i64), ptr %t8179
  %t8181 = or i64 %t8180, 4
  %t8182 = call i64 @rt_root(i64 %t8181)
  store i64 %t8182, ptr @"scheme.base:input-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_195"() {
entry:
  %t8193 = call ptr @rt_alloc_words(i64 1)
  %t8194 = ptrtoint ptr %t8193 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port?" to i64), ptr %t8193
  %t8195 = or i64 %t8194, 4
  %t8196 = call i64 @rt_root(i64 %t8195)
  store i64 %t8196, ptr @"scheme.base:output-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_196"() {
entry:
  %t8204 = call ptr @rt_alloc_words(i64 1)
  %t8205 = ptrtoint ptr %t8204 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:textual-port?" to i64), ptr %t8204
  %t8206 = or i64 %t8205, 4
  %t8207 = call i64 @rt_root(i64 %t8206)
  store i64 %t8207, ptr @"scheme.base:textual-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_197"() {
entry:
  %t8210 = call ptr @rt_alloc_words(i64 1)
  %t8211 = ptrtoint ptr %t8210 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port-closed?" to i64), ptr %t8210
  %t8212 = or i64 %t8211, 4
  %t8213 = call i64 @rt_root(i64 %t8212)
  store i64 %t8213, ptr @"scheme.base:port-closed?"
  ret i64 17
}

define i64 @"scheme.base:__init_198"() {
entry:
  %t8224 = call ptr @rt_alloc_words(i64 1)
  %t8225 = ptrtoint ptr %t8224 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port-open?" to i64), ptr %t8224
  %t8226 = or i64 %t8225, 4
  %t8227 = call i64 @rt_root(i64 %t8226)
  store i64 %t8227, ptr @"scheme.base:input-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_199"() {
entry:
  %t8238 = call ptr @rt_alloc_words(i64 1)
  %t8239 = ptrtoint ptr %t8238 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port-open?" to i64), ptr %t8238
  %t8240 = or i64 %t8239, 4
  %t8241 = call i64 @rt_root(i64 %t8240)
  store i64 %t8241, ptr @"scheme.base:output-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_200"() {
entry:
  %t8267 = call ptr @rt_alloc_words(i64 1)
  %t8268 = ptrtoint ptr %t8267 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-input-port" to i64), ptr %t8267
  %t8269 = or i64 %t8268, 4
  %t8270 = call i64 @rt_root(i64 %t8269)
  store i64 %t8270, ptr @"scheme.base:%check-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_201"() {
entry:
  %t8296 = call ptr @rt_alloc_words(i64 1)
  %t8297 = ptrtoint ptr %t8296 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-output-port" to i64), ptr %t8296
  %t8298 = or i64 %t8297, 4
  %t8299 = call i64 @rt_root(i64 %t8298)
  store i64 %t8299, ptr @"scheme.base:%check-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_202"() {
entry:
  %t8303 = call ptr @rt_alloc_words(i64 1)
  %t8304 = ptrtoint ptr %t8303 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-input-string" to i64), ptr %t8303
  %t8305 = or i64 %t8304, 4
  %t8306 = call i64 @rt_root(i64 %t8305)
  store i64 %t8306, ptr @"scheme.base:open-input-string"
  ret i64 17
}

define i64 @"scheme.base:__init_203"() {
entry:
  %t8327 = call ptr @rt_alloc_words(i64 1)
  %t8328 = ptrtoint ptr %t8327 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%port-at-eof?" to i64), ptr %t8327
  %t8329 = or i64 %t8328, 4
  %t8330 = call i64 @rt_root(i64 %t8329)
  store i64 %t8330, ptr @"scheme.base:%port-at-eof?"
  ret i64 17
}

define i64 @"scheme.base:__init_204"() {
entry:
  %t8360 = call ptr @rt_alloc_words(i64 1)
  %t8361 = ptrtoint ptr %t8360 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-char" to i64), ptr %t8360
  %t8362 = or i64 %t8361, 4
  %t8363 = call i64 @rt_root(i64 %t8362)
  store i64 %t8363, ptr @"scheme.base:read-char"
  ret i64 17
}

define i64 @"scheme.base:__init_205"() {
entry:
  %t8384 = call ptr @rt_alloc_words(i64 1)
  %t8385 = ptrtoint ptr %t8384 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:peek-char" to i64), ptr %t8384
  %t8386 = or i64 %t8385, 4
  %t8387 = call i64 @rt_root(i64 %t8386)
  store i64 %t8387, ptr @"scheme.base:peek-char"
  ret i64 17
}

define i64 @"scheme.base:__init_206"() {
entry:
  %t8505 = call ptr @rt_alloc_words(i64 1)
  %t8506 = ptrtoint ptr %t8505 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-line" to i64), ptr %t8505
  %t8507 = or i64 %t8506, 4
  %t8508 = call i64 @rt_root(i64 %t8507)
  store i64 %t8508, ptr @"scheme.base:read-line"
  ret i64 17
}

define i64 @"scheme.base:__init_207"() {
entry:
  %t8556 = call ptr @rt_alloc_words(i64 1)
  %t8557 = ptrtoint ptr %t8556 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-string" to i64), ptr %t8556
  %t8558 = or i64 %t8557, 4
  %t8559 = call i64 @rt_root(i64 %t8558)
  store i64 %t8559, ptr @"scheme.base:read-string"
  ret i64 17
}

define i64 @"scheme.base:__init_208"() {
entry:
  %t8573 = call ptr @rt_alloc_words(i64 1)
  %t8574 = ptrtoint ptr %t8573 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-output-string" to i64), ptr %t8573
  %t8575 = or i64 %t8574, 4
  %t8576 = call i64 @rt_root(i64 %t8575)
  store i64 %t8576, ptr @"scheme.base:open-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_209"() {
entry:
  %t8607 = call ptr @rt_alloc_words(i64 1)
  %t8608 = ptrtoint ptr %t8607 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:get-output-string" to i64), ptr %t8607
  %t8609 = or i64 %t8608, 4
  %t8610 = call i64 @rt_root(i64 %t8609)
  store i64 %t8610, ptr @"scheme.base:get-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_210"() {
entry:
  %t8621 = call ptr @rt_alloc_words(i64 1)
  %t8622 = ptrtoint ptr %t8621 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:flush-output-port" to i64), ptr %t8621
  %t8623 = or i64 %t8622, 4
  %t8624 = call i64 @rt_root(i64 %t8623)
  store i64 %t8624, ptr @"scheme.base:flush-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_211"() {
entry:
  %t8653 = call ptr @rt_alloc_words(i64 1)
  %t8654 = ptrtoint ptr %t8653 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-port" to i64), ptr %t8653
  %t8655 = or i64 %t8654, 4
  %t8656 = call i64 @rt_root(i64 %t8655)
  store i64 %t8656, ptr @"scheme.base:close-port"
  ret i64 17
}

define i64 @"scheme.base:__init_212"() {
entry:
  %t8679 = call ptr @rt_alloc_words(i64 1)
  %t8680 = ptrtoint ptr %t8679 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-input-port" to i64), ptr %t8679
  %t8681 = or i64 %t8680, 4
  %t8682 = call i64 @rt_root(i64 %t8681)
  store i64 %t8682, ptr @"scheme.base:close-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_213"() {
entry:
  %t8705 = call ptr @rt_alloc_words(i64 1)
  %t8706 = ptrtoint ptr %t8705 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-output-port" to i64), ptr %t8705
  %t8707 = or i64 %t8706, 4
  %t8708 = call i64 @rt_root(i64 %t8707)
  store i64 %t8708, ptr @"scheme.base:close-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_214"() {
entry:
  %t8709 = call i64 @rt_root(i64 1)
  store i64 %t8709, ptr @"scheme.base:%stdout-port"
  ret i64 17
}

define i64 @"scheme.base:__init_215"() {
entry:
  %t8710 = call i64 @rt_root(i64 1)
  store i64 %t8710, ptr @"scheme.base:%stderr-port"
  ret i64 17
}

define i64 @"scheme.base:__init_216"() {
entry:
  %t8711 = call i64 @rt_root(i64 1)
  store i64 %t8711, ptr @"scheme.base:%stdin-port"
  ret i64 17
}

define i64 @"scheme.base:__init_217"() {
entry:
  %t8755 = call ptr @rt_alloc_words(i64 1)
  %t8756 = ptrtoint ptr %t8755 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-output-port" to i64), ptr %t8755
  %t8757 = or i64 %t8756, 4
  %t8758 = call i64 @rt_root(i64 %t8757)
  store i64 %t8758, ptr @"scheme.base:current-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_218"() {
entry:
  %t8796 = call ptr @rt_alloc_words(i64 1)
  %t8797 = ptrtoint ptr %t8796 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-error-port" to i64), ptr %t8796
  %t8798 = or i64 %t8797, 4
  %t8799 = call i64 @rt_root(i64 %t8798)
  store i64 %t8799, ptr @"scheme.base:current-error-port"
  ret i64 17
}

define i64 @"scheme.base:__init_219"() {
entry:
  %t8837 = call ptr @rt_alloc_words(i64 1)
  %t8838 = ptrtoint ptr %t8837 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-input-port" to i64), ptr %t8837
  %t8839 = or i64 %t8838, 4
  %t8840 = call i64 @rt_root(i64 %t8839)
  store i64 %t8840, ptr @"scheme.base:current-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_220"() {
entry:
  %t8887 = call ptr @rt_alloc_words(i64 1)
  %t8888 = ptrtoint ptr %t8887 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-port" to i64), ptr %t8887
  %t8889 = or i64 %t8888, 4
  %t8890 = call i64 @rt_root(i64 %t8889)
  store i64 %t8890, ptr @"scheme.base:call-with-port"
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
  call i64 @"scheme.base:__init_215"()
  call i64 @"scheme.base:__init_216"()
  call i64 @"scheme.base:__init_217"()
  call i64 @"scheme.base:__init_218"()
  call i64 @"scheme.base:__init_219"()
  call i64 @"scheme.base:__init_220"()
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

