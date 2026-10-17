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
@.str.lit.19 = private unnamed_addr constant [40 x i8] c"continuation invoked outside its extent\00"
@.str.sym.20 = private unnamed_addr constant [5 x i8] c"r7rs\00"
@.str.sym.21 = private unnamed_addr constant [5 x i8] c"emit\00"
@.str.sym.22 = private unnamed_addr constant [11 x i8] c"ieee-float\00"
@.str.sym.23 = private unnamed_addr constant [7 x i8] c"srfi-0\00"
@.str.sym.24 = private unnamed_addr constant [7 x i8] c"srfi-6\00"
@.str.sym.25 = private unnamed_addr constant [7 x i8] c"srfi-9\00"
@.str.sym.26 = private unnamed_addr constant [8 x i8] c"srfi-16\00"
@.str.sym.27 = private unnamed_addr constant [8 x i8] c"srfi-23\00"
@.str.sym.28 = private unnamed_addr constant [8 x i8] c"srfi-30\00"
@.str.sym.29 = private unnamed_addr constant [8 x i8] c"srfi-39\00"
@.str.sym.30 = private unnamed_addr constant [8 x i8] c"srfi-62\00"
@.str.sym.31 = private unnamed_addr constant [8 x i8] c"srfi-87\00"
@.str.sym.32 = private unnamed_addr constant [5 x i8] c"file\00"
@.str.lit.33 = private unnamed_addr constant [20 x i8] c"range out of bounds\00"
@.str.sym.34 = private unnamed_addr constant [13 x i8] c"vector->list\00"
@.str.sym.35 = private unnamed_addr constant [12 x i8] c"vector-copy\00"
@.str.sym.36 = private unnamed_addr constant [13 x i8] c"vector-fill!\00"
@.str.sym.37 = private unnamed_addr constant [13 x i8] c"vector-copy!\00"
@.str.sym.38 = private unnamed_addr constant [15 x i8] c"string->vector\00"
@.str.sym.39 = private unnamed_addr constant [15 x i8] c"vector->string\00"
@.str.sym.40 = private unnamed_addr constant [13 x i8] c"string-fill!\00"
@.str.sym.41 = private unnamed_addr constant [13 x i8] c"string-copy!\00"
@.str.sym.42 = private unnamed_addr constant [16 x i8] c"bytevector-copy\00"
@.str.sym.43 = private unnamed_addr constant [17 x i8] c"bytevector-copy!\00"
@.str.lit.44 = private unnamed_addr constant [70 x i8] c"rationalize: no exact rational in range (Emit has no exact rationals)\00"
@.str.lit.45 = private unnamed_addr constant [70 x i8] c"rationalize: no exact rational in range (Emit has no exact rationals)\00"
@.str.lit.46 = private unnamed_addr constant [60 x i8] c"rationalize: no rational found within the denominator limit\00"
@.flo.lit.47 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.flo.lit.48 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.flo.lit.49 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.lit.50 = private unnamed_addr constant [30 x i8] c"hash-table-ref: key not found\00"
@.str.sym.51 = private unnamed_addr constant [17 x i8] c"rd-block-comment\00"
@.str.lit.52 = private unnamed_addr constant [46 x i8] c"unterminated block comment #| opened at index\00"
@.str.sym.53 = private unnamed_addr constant [7 x i8] c"rd-bar\00"
@.str.lit.54 = private unnamed_addr constant [42 x i8] c"unterminated |identifier| opened at index\00"
@.str.sym.55 = private unnamed_addr constant [21 x i8] c"rd-unterminated-list\00"
@.str.lit.56 = private unnamed_addr constant [14 x i8] c"unterminated \00"
@.str.lit.57 = private unnamed_addr constant [7 x i8] c"list [\00"
@.str.lit.58 = private unnamed_addr constant [16 x i8] c"bytevector #u8(\00"
@.str.lit.59 = private unnamed_addr constant [10 x i8] c"vector #(\00"
@.str.lit.60 = private unnamed_addr constant [7 x i8] c"list (\00"
@.str.lit.61 = private unnamed_addr constant [17 x i8] c" opened at index\00"
@.str.sym.62 = private unnamed_addr constant [23 x i8] c"rd-unterminated-string\00"
@.str.lit.63 = private unnamed_addr constant [38 x i8] c"unterminated string \22 opened at index\00"
@.str.sym.64 = private unnamed_addr constant [13 x i8] c"rd-char-name\00"
@.str.lit.65 = private unnamed_addr constant [23 x i8] c"unknown character name\00"
@.str.sym.66 = private unnamed_addr constant [14 x i8] c"rd-hash-token\00"
@.str.lit.67 = private unnamed_addr constant [45 x i8] c"not a boolean; write #t, #true, #f or #false\00"
@.str.sym.68 = private unnamed_addr constant [19 x i8] c"rd-label-duplicate\00"
@.str.lit.69 = private unnamed_addr constant [22 x i8] c"duplicate datum label\00"
@.str.sym.70 = private unnamed_addr constant [20 x i8] c"rd-label-unresolved\00"
@.str.lit.71 = private unnamed_addr constant [48 x i8] c"datum label reference has no earlier definition\00"
@.str.sym.72 = private unnamed_addr constant [14 x i8] c"rd-label-self\00"
@.str.lit.73 = private unnamed_addr constant [56 x i8] c"datum label cannot be defined as only its own reference\00"
@.str.sym.74 = private unnamed_addr constant [9 x i8] c"rd-label\00"
@.str.lit.75 = private unnamed_addr constant [22 x i8] c"malformed datum label\00"
@.str.sym.76 = private unnamed_addr constant [7 x i8] c"rd-eof\00"
@.str.lit.77 = private unnamed_addr constant [50 x i8] c"end of input where a datum was expected, at index\00"
@.str.sym.78 = private unnamed_addr constant [14 x i8] c"rd-unexpected\00"
@.str.lit.79 = private unnamed_addr constant [24 x i8] c"no datum here, at index\00"
@.str.sym.80 = private unnamed_addr constant [12 x i8] c"rd-rational\00"
@.str.lit.81 = private unnamed_addr constant [57 x i8] c"rational literal syntax is not supported -- Emit has no \00"
@.str.lit.82 = private unnamed_addr constant [39 x i8] c"exact rationals; write 0.5, or (/ 1 2)\00"
@.str.lit.83 = private unnamed_addr constant [20 x i8] c"unrecognized syntax\00"
@.str.lit.84 = private unnamed_addr constant [18 x i8] c"not an input port\00"
@.str.lit.85 = private unnamed_addr constant [15 x i8] c"port is closed\00"
@.str.lit.86 = private unnamed_addr constant [19 x i8] c"not an output port\00"
@.str.lit.87 = private unnamed_addr constant [15 x i8] c"port is closed\00"
@.str.sym.88 = private unnamed_addr constant [10 x i8] c"read-char\00"
@.str.sym.89 = private unnamed_addr constant [10 x i8] c"peek-char\00"
@.str.sym.90 = private unnamed_addr constant [10 x i8] c"read-line\00"
@.str.sym.91 = private unnamed_addr constant [12 x i8] c"read-string\00"
@.str.sym.92 = private unnamed_addr constant [19 x i8] c"open-output-string\00"
@.str.lit.93 = private unnamed_addr constant [34 x i8] c"cannot open an output string port\00"
@.str.sym.94 = private unnamed_addr constant [18 x i8] c"get-output-string\00"
@.str.lit.95 = private unnamed_addr constant [19 x i8] c"not an output port\00"
@.str.lit.96 = private unnamed_addr constant [18 x i8] c"not a string port\00"
@.str.sym.97 = private unnamed_addr constant [18 x i8] c"flush-output-port\00"
@.str.sym.98 = private unnamed_addr constant [11 x i8] c"close-port\00"
@.str.lit.99 = private unnamed_addr constant [11 x i8] c"not a port\00"
@.str.sym.100 = private unnamed_addr constant [17 x i8] c"close-input-port\00"
@.str.lit.101 = private unnamed_addr constant [18 x i8] c"not an input port\00"
@.str.sym.102 = private unnamed_addr constant [18 x i8] c"close-output-port\00"
@.str.lit.103 = private unnamed_addr constant [19 x i8] c"not an output port\00"
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
@"scheme.base:features" = global i64 0
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
  %t2669 = icmp sge i64 %argc, 0
  br i1 %t2669, label %argok641, label %arityerr640
arityerr640:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok641:
  %t2670 = call ptr @rt_alloc_words(i64 8)
  %t2671 = getelementptr i64, ptr %t2670, i64 0
  store i64 %a0, ptr %t2671
  %t2672 = getelementptr i64, ptr %t2670, i64 1
  store i64 %a1, ptr %t2672
  %t2673 = getelementptr i64, ptr %t2670, i64 2
  store i64 %a2, ptr %t2673
  %t2674 = getelementptr i64, ptr %t2670, i64 3
  store i64 %a3, ptr %t2674
  %t2675 = getelementptr i64, ptr %t2670, i64 4
  store i64 %a4, ptr %t2675
  %t2676 = getelementptr i64, ptr %t2670, i64 5
  store i64 %a5, ptr %t2676
  %t2677 = getelementptr i64, ptr %t2670, i64 6
  store i64 %a6, ptr %t2677
  %t2678 = getelementptr i64, ptr %t2670, i64 7
  store i64 %a7, ptr %t2678
  %t2679 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t2670, ptr %overflow)
  %t2680 = and i64 %self, -8
  %t2681 = inttoptr i64 %t2680 to ptr
  %t2682 = getelementptr i64, ptr %t2681, i64 1
  %t2683 = load i64, ptr %t2682
  %t2684 = call i64 @rt_escape_live_p(i64 %t2683)
  %t2685 = icmp ne i64 %t2684, 1
  br i1 %t2685, label %then642, label %else643
then642:
  %t2686 = and i64 %self, -8
  %t2687 = inttoptr i64 %t2686 to ptr
  %t2688 = getelementptr i64, ptr %t2687, i64 2
  %t2689 = load i64, ptr %t2688
  %t2690 = load i64, ptr @"scheme.base:%unwind-to"
  call void @rt_check_callable(i64 %t2690)
  %t2691 = and i64 %t2690, -8
  %t2692 = inttoptr i64 %t2691 to ptr
  %t2693 = load i64, ptr %t2692
  %t2694 = inttoptr i64 %t2693 to ptr
  %t2695 = call fastcc i64%t2694(i64 %t2690, i64 1, i64 %t2689, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2696 = and i64 %self, -8
  %t2697 = inttoptr i64 %t2696 to ptr
  %t2698 = getelementptr i64, ptr %t2697, i64 1
  %t2699 = load i64, ptr %t2698
  %t2700 = load i64, ptr @"scheme.base:values"
  call void @rt_check_callable(i64 %t2700)
  %t2701 = and i64 %t2700, -8
  %t2702 = inttoptr i64 %t2701 to ptr
  %t2703 = load i64, ptr %t2702
  %t2704 = inttoptr i64 %t2703 to ptr
  %t2705 = call i64 @rt_list_length(i64 %t2679)
  %t2706 = add i64 0, %t2705
  %t2707 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t2679, i64 8)
  %t2719 = getelementptr i64, ptr %t2707, i64 0
  %t2711 = load i64, ptr %t2719
  %t2720 = getelementptr i64, ptr %t2707, i64 1
  %t2712 = load i64, ptr %t2720
  %t2721 = getelementptr i64, ptr %t2707, i64 2
  %t2713 = load i64, ptr %t2721
  %t2722 = getelementptr i64, ptr %t2707, i64 3
  %t2714 = load i64, ptr %t2722
  %t2723 = getelementptr i64, ptr %t2707, i64 4
  %t2715 = load i64, ptr %t2723
  %t2724 = getelementptr i64, ptr %t2707, i64 5
  %t2716 = load i64, ptr %t2724
  %t2725 = getelementptr i64, ptr %t2707, i64 6
  %t2717 = load i64, ptr %t2725
  %t2726 = getelementptr i64, ptr %t2707, i64 7
  %t2718 = load i64, ptr %t2726
  %t2708 = icmp sgt i64 %t2706, 8
  %t2709 = getelementptr i64, ptr %t2707, i64 8
  %t2710 = select i1 %t2708, ptr %t2709, ptr null
  %t2727 = call fastcc i64%t2704(i64 %t2700, i64 %t2706, i64 %t2711, i64 %t2712, i64 %t2713, i64 %t2714, i64 %t2715, i64 %t2716, i64 %t2717, i64 %t2718, ptr %t2710)
  %t2728 = call i64 @rt_escape_to(i64 %t2699, i64 %t2727)
  br label %merge644
else643:
  br label %merge644
merge644:
  %t2729 = phi i64 [ %t2728, %then642 ], [ 1, %else643 ]
  %t2730 = call i64 @rt_intern(ptr @.str.sym.17)
  %t2731 = call i64 @rt_make_string(ptr @.str.lit.18, i64 39)
  %t2732 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t2732)
  %t2733 = and i64 %t2732, -8
  %t2734 = inttoptr i64 %t2733 to ptr
  %t2735 = load i64, ptr %t2734
  %t2736 = inttoptr i64 %t2735 to ptr
  %t2737 = musttail call fastcc i64 %t2736(i64 %t2732, i64 2, i64 %t2730, i64 %t2731, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2737
}

define fastcc i64 @"min-entry:$scheme.base$ccode_498"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2738 = and i64 %self, -8
  %t2739 = inttoptr i64 %t2738 to ptr
  %t2740 = getelementptr i64, ptr %t2739, i64 1
  %t2741 = load i64, ptr %t2740
  %t2742 = call i64 @rt_escape_live_p(i64 %t2741)
  %t2743 = icmp ne i64 %t2742, 1
  br i1 %t2743, label %then645, label %else646
then645:
  %t2744 = and i64 %self, -8
  %t2745 = inttoptr i64 %t2744 to ptr
  %t2746 = getelementptr i64, ptr %t2745, i64 2
  %t2747 = load i64, ptr %t2746
  %t2748 = load i64, ptr @"scheme.base:%unwind-to"
  call void @rt_check_callable(i64 %t2748)
  %t2749 = and i64 %t2748, -8
  %t2750 = inttoptr i64 %t2749 to ptr
  %t2751 = load i64, ptr %t2750
  %t2752 = inttoptr i64 %t2751 to ptr
  %t2753 = call fastcc i64%t2752(i64 %t2748, i64 1, i64 %t2747, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2754 = and i64 %self, -8
  %t2755 = inttoptr i64 %t2754 to ptr
  %t2756 = getelementptr i64, ptr %t2755, i64 1
  %t2757 = load i64, ptr %t2756
  %t2758 = load i64, ptr @"scheme.base:values"
  call void @rt_check_callable(i64 %t2758)
  %t2759 = and i64 %t2758, -8
  %t2760 = inttoptr i64 %t2759 to ptr
  %t2761 = load i64, ptr %t2760
  %t2762 = inttoptr i64 %t2761 to ptr
  %t2763 = call i64 @rt_list_length(i64 2)
  %t2764 = add i64 0, %t2763
  %t2765 = call ptr @rt_apply_argv(i64 0, ptr null, i64 2, i64 8)
  %t2777 = getelementptr i64, ptr %t2765, i64 0
  %t2769 = load i64, ptr %t2777
  %t2778 = getelementptr i64, ptr %t2765, i64 1
  %t2770 = load i64, ptr %t2778
  %t2779 = getelementptr i64, ptr %t2765, i64 2
  %t2771 = load i64, ptr %t2779
  %t2780 = getelementptr i64, ptr %t2765, i64 3
  %t2772 = load i64, ptr %t2780
  %t2781 = getelementptr i64, ptr %t2765, i64 4
  %t2773 = load i64, ptr %t2781
  %t2782 = getelementptr i64, ptr %t2765, i64 5
  %t2774 = load i64, ptr %t2782
  %t2783 = getelementptr i64, ptr %t2765, i64 6
  %t2775 = load i64, ptr %t2783
  %t2784 = getelementptr i64, ptr %t2765, i64 7
  %t2776 = load i64, ptr %t2784
  %t2766 = icmp sgt i64 %t2764, 8
  %t2767 = getelementptr i64, ptr %t2765, i64 8
  %t2768 = select i1 %t2766, ptr %t2767, ptr null
  %t2785 = call fastcc i64%t2762(i64 %t2758, i64 %t2764, i64 %t2769, i64 %t2770, i64 %t2771, i64 %t2772, i64 %t2773, i64 %t2774, i64 %t2775, i64 %t2776, ptr %t2768)
  %t2786 = call i64 @rt_escape_to(i64 %t2757, i64 %t2785)
  br label %merge647
else646:
  br label %merge647
merge647:
  %t2787 = phi i64 [ %t2786, %then645 ], [ 1, %else646 ]
  %t2788 = call i64 @rt_intern(ptr @.str.sym.17)
  %t2789 = call i64 @rt_make_string(ptr @.str.lit.19, i64 39)
  %t2790 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t2790)
  %t2791 = and i64 %t2790, -8
  %t2792 = inttoptr i64 %t2791 to ptr
  %t2793 = load i64, ptr %t2792
  %t2794 = inttoptr i64 %t2793 to ptr
  %t2795 = musttail call fastcc i64 %t2794(i64 %t2790, i64 2, i64 %t2788, i64 %t2789, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2795
}

define fastcc i64 @"scheme.base:code_496"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2796 = icmp eq i64 %argc, 0
  br i1 %t2796, label %argok649, label %arityerr648
arityerr648:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok649:
  %t2797 = call i64 @rt_escape_frame()
  %t2798 = and i64 %self, -8
  %t2799 = inttoptr i64 %t2798 to ptr
  %t2800 = getelementptr i64, ptr %t2799, i64 2
  %t2801 = load i64, ptr %t2800
  %t2802 = call ptr @rt_alloc_words(i64 3)
  %t2803 = ptrtoint ptr %t2802 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_498" to i64), ptr %t2802
  %t2804 = getelementptr i64, ptr %t2802, i64 1
  store i64 %t2797, ptr %t2804
  %t2805 = getelementptr i64, ptr %t2802, i64 2
  store i64 %t2801, ptr %t2805
  %t2806 = or i64 %t2803, 4
  %t2807 = and i64 %self, -8
  %t2808 = inttoptr i64 %t2807 to ptr
  %t2809 = getelementptr i64, ptr %t2808, i64 1
  %t2810 = load i64, ptr %t2809
  call void @rt_check_callable(i64 %t2810)
  %t2811 = and i64 %t2810, -8
  %t2812 = inttoptr i64 %t2811 to ptr
  %t2813 = load i64, ptr %t2812
  %t2814 = inttoptr i64 %t2813 to ptr
  %t2815 = musttail call fastcc i64 %t2814(i64 %t2810, i64 1, i64 %t2806, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2815
}

define fastcc i64 @"scheme.base:code:call-with-current-continuation"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2816 = icmp eq i64 %argc, 1
  br i1 %t2816, label %argok651, label %arityerr650
arityerr650:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok651:
  %t2817 = load i64, ptr @"scheme.base:*winds*"
  %t2818 = call ptr @rt_alloc_words(i64 3)
  %t2819 = ptrtoint ptr %t2818 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_496" to i64), ptr %t2818
  %t2820 = getelementptr i64, ptr %t2818, i64 1
  store i64 %a0, ptr %t2820
  %t2821 = getelementptr i64, ptr %t2818, i64 2
  store i64 %t2817, ptr %t2821
  %t2822 = or i64 %t2819, 4
  %t2823 = call i64 @rt_run_guarded(ptr @__apply0, i64 %t2822)
  %t2824 = call i64 @rt_cdr(i64 %t2823)
  ret i64 %t2824
}

define fastcc i64 @"scheme.base:code:call/cc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2829 = icmp eq i64 %argc, 1
  br i1 %t2829, label %argok653, label %arityerr652
arityerr652:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok653:
  %t2830 = load i64, ptr @"scheme.base:call-with-current-continuation"
  call void @rt_check_callable(i64 %t2830)
  %t2831 = and i64 %t2830, -8
  %t2832 = inttoptr i64 %t2831 to ptr
  %t2833 = load i64, ptr %t2832
  %t2834 = inttoptr i64 %t2833 to ptr
  %t2835 = musttail call fastcc i64 %t2834(i64 %t2830, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2835
}

define fastcc i64 @"scheme.base:code_506"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2840 = icmp eq i64 %argc, 0
  br i1 %t2840, label %argok655, label %arityerr654
arityerr654:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok655:
  %t2841 = and i64 %self, -8
  %t2842 = inttoptr i64 %t2841 to ptr
  %t2843 = getelementptr i64, ptr %t2842, i64 1
  %t2844 = load i64, ptr %t2843
  %t2845 = and i64 %self, -8
  %t2846 = inttoptr i64 %t2845 to ptr
  %t2847 = getelementptr i64, ptr %t2846, i64 2
  %t2848 = load i64, ptr %t2847
  %t2849 = call i64 @rt_cons(i64 %t2844, i64 %t2848)
  %t2850 = call i64 @rt_root(i64 %t2849)
  store i64 %t2850, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code_508"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2851 = icmp eq i64 %argc, 0
  br i1 %t2851, label %argok657, label %arityerr656
arityerr656:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok657:
  %t2852 = and i64 %self, -8
  %t2853 = inttoptr i64 %t2852 to ptr
  %t2854 = getelementptr i64, ptr %t2853, i64 1
  %t2855 = load i64, ptr %t2854
  %t2856 = call i64 @rt_root(i64 %t2855)
  store i64 %t2856, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code:with-exception-handler"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2857 = icmp eq i64 %argc, 2
  br i1 %t2857, label %argok659, label %arityerr658
arityerr658:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok659:
  %t2858 = load i64, ptr @"scheme.base:*handlers*"
  %t2859 = call ptr @rt_alloc_words(i64 3)
  %t2860 = ptrtoint ptr %t2859 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_506" to i64), ptr %t2859
  %t2861 = getelementptr i64, ptr %t2859, i64 1
  store i64 %a0, ptr %t2861
  %t2862 = getelementptr i64, ptr %t2859, i64 2
  store i64 %t2858, ptr %t2862
  %t2863 = or i64 %t2860, 4
  %t2864 = call ptr @rt_alloc_words(i64 2)
  %t2865 = ptrtoint ptr %t2864 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_508" to i64), ptr %t2864
  %t2866 = getelementptr i64, ptr %t2864, i64 1
  store i64 %t2858, ptr %t2866
  %t2867 = or i64 %t2865, 4
  %t2868 = load i64, ptr @"scheme.base:dynamic-wind"
  call void @rt_check_callable(i64 %t2868)
  %t2869 = and i64 %t2868, -8
  %t2870 = inttoptr i64 %t2869 to ptr
  %t2871 = load i64, ptr %t2870
  %t2872 = inttoptr i64 %t2871 to ptr
  %t2873 = musttail call fastcc i64 %t2872(i64 %t2868, i64 3, i64 %t2863, i64 %a1, i64 %t2867, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2873
}

define fastcc i64 @"scheme.base:code:raise"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2878 = icmp eq i64 %argc, 1
  br i1 %t2878, label %argok661, label %arityerr660
arityerr660:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok661:
  %t2879 = load i64, ptr @"scheme.base:*handlers*"
  %t2880 = call i64 @rt_null_p(i64 %t2879)
  %t2881 = icmp ne i64 %t2880, 1
  br i1 %t2881, label %then662, label %else663
then662:
  %t2882 = call i64 @rt_raise(i64 %a0)
  ret i64 %t2882
else663:
  %t2883 = load i64, ptr @"scheme.base:*handlers*"
  %t2884 = call i64 @rt_car(i64 %t2883)
  %t2885 = load i64, ptr @"scheme.base:*handlers*"
  %t2886 = load i64, ptr @"scheme.base:*handlers*"
  %t2887 = call i64 @rt_cdr(i64 %t2886)
  %t2888 = call i64 @rt_root(i64 %t2887)
  store i64 %t2888, ptr @"scheme.base:*handlers*"
  call void @rt_check_callable(i64 %t2884)
  %t2889 = and i64 %t2884, -8
  %t2890 = inttoptr i64 %t2889 to ptr
  %t2891 = load i64, ptr %t2890
  %t2892 = inttoptr i64 %t2891 to ptr
  %t2893 = call fastcc i64%t2892(i64 %t2884, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t2894 = call i64 @rt_root(i64 %t2885)
  store i64 %t2894, ptr @"scheme.base:*handlers*"
  %t2895 = call i64 @rt_raise(i64 %a0)
  ret i64 %t2895
}

define fastcc i64 @"scheme.base:code_518"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2900 = icmp eq i64 %argc, 0
  br i1 %t2900, label %argok665, label %arityerr664
arityerr664:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok665:
  %t2901 = and i64 %self, -8
  %t2902 = inttoptr i64 %t2901 to ptr
  %t2903 = getelementptr i64, ptr %t2902, i64 1
  %t2904 = load i64, ptr %t2903
  %t2905 = call i64 @rt_cdr(i64 %t2904)
  %t2906 = call i64 @rt_root(i64 %t2905)
  store i64 %t2906, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code_520"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2907 = icmp eq i64 %argc, 0
  br i1 %t2907, label %argok667, label %arityerr666
arityerr666:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok667:
  %t2908 = and i64 %self, -8
  %t2909 = inttoptr i64 %t2908 to ptr
  %t2910 = getelementptr i64, ptr %t2909, i64 2
  %t2911 = load i64, ptr %t2910
  %t2912 = and i64 %self, -8
  %t2913 = inttoptr i64 %t2912 to ptr
  %t2914 = getelementptr i64, ptr %t2913, i64 1
  %t2915 = load i64, ptr %t2914
  call void @rt_check_callable(i64 %t2915)
  %t2916 = and i64 %t2915, -8
  %t2917 = inttoptr i64 %t2916 to ptr
  %t2918 = load i64, ptr %t2917
  %t2919 = inttoptr i64 %t2918 to ptr
  %t2920 = musttail call fastcc i64 %t2919(i64 %t2915, i64 1, i64 %t2911, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2920
}

define fastcc i64 @"scheme.base:code_522"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2921 = icmp eq i64 %argc, 0
  br i1 %t2921, label %argok669, label %arityerr668
arityerr668:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok669:
  %t2922 = and i64 %self, -8
  %t2923 = inttoptr i64 %t2922 to ptr
  %t2924 = getelementptr i64, ptr %t2923, i64 1
  %t2925 = load i64, ptr %t2924
  %t2926 = call i64 @rt_root(i64 %t2925)
  store i64 %t2926, ptr @"scheme.base:*handlers*"
  ret i64 17
}

define fastcc i64 @"scheme.base:code:raise-continuable"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2927 = icmp eq i64 %argc, 1
  br i1 %t2927, label %argok671, label %arityerr670
arityerr670:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok671:
  %t2928 = load i64, ptr @"scheme.base:*handlers*"
  %t2929 = call i64 @rt_null_p(i64 %t2928)
  %t2930 = icmp ne i64 %t2929, 1
  br i1 %t2930, label %then672, label %else673
then672:
  %t2931 = call i64 @rt_raise(i64 %a0)
  ret i64 %t2931
else673:
  %t2932 = load i64, ptr @"scheme.base:*handlers*"
  %t2933 = call i64 @rt_car(i64 %t2932)
  %t2934 = load i64, ptr @"scheme.base:*handlers*"
  %t2935 = call ptr @rt_alloc_words(i64 2)
  %t2936 = ptrtoint ptr %t2935 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_518" to i64), ptr %t2935
  %t2937 = getelementptr i64, ptr %t2935, i64 1
  store i64 %t2934, ptr %t2937
  %t2938 = or i64 %t2936, 4
  %t2939 = call ptr @rt_alloc_words(i64 3)
  %t2940 = ptrtoint ptr %t2939 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_520" to i64), ptr %t2939
  %t2941 = getelementptr i64, ptr %t2939, i64 1
  store i64 %t2933, ptr %t2941
  %t2942 = getelementptr i64, ptr %t2939, i64 2
  store i64 %a0, ptr %t2942
  %t2943 = or i64 %t2940, 4
  %t2944 = call ptr @rt_alloc_words(i64 2)
  %t2945 = ptrtoint ptr %t2944 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_522" to i64), ptr %t2944
  %t2946 = getelementptr i64, ptr %t2944, i64 1
  store i64 %t2934, ptr %t2946
  %t2947 = or i64 %t2945, 4
  %t2948 = load i64, ptr @"scheme.base:dynamic-wind"
  call void @rt_check_callable(i64 %t2948)
  %t2949 = and i64 %t2948, -8
  %t2950 = inttoptr i64 %t2949 to ptr
  %t2951 = load i64, ptr %t2950
  %t2952 = inttoptr i64 %t2951 to ptr
  %t2953 = musttail call fastcc i64 %t2952(i64 %t2948, i64 3, i64 %t2938, i64 %t2943, i64 %t2947, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t2953
}

define fastcc i64 @"scheme.base:code:features"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t2958 = icmp eq i64 %argc, 0
  br i1 %t2958, label %argok675, label %arityerr674
arityerr674:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok675:
  %t2959 = call i64 @rt_cons(i64 17, i64 17)
  %t2960 = call i64 @rt_intern(ptr @.str.sym.20)
  %t2961 = call i64 @rt_set_car(i64 %t2959, i64 %t2960)
  %t2962 = call i64 @rt_cons(i64 17, i64 17)
  %t2963 = call i64 @rt_intern(ptr @.str.sym.21)
  %t2964 = call i64 @rt_set_car(i64 %t2962, i64 %t2963)
  %t2965 = call i64 @rt_cons(i64 17, i64 17)
  %t2966 = call i64 @rt_intern(ptr @.str.sym.22)
  %t2967 = call i64 @rt_set_car(i64 %t2965, i64 %t2966)
  %t2968 = call i64 @rt_cons(i64 17, i64 17)
  %t2969 = call i64 @rt_intern(ptr @.str.sym.23)
  %t2970 = call i64 @rt_set_car(i64 %t2968, i64 %t2969)
  %t2971 = call i64 @rt_cons(i64 17, i64 17)
  %t2972 = call i64 @rt_intern(ptr @.str.sym.24)
  %t2973 = call i64 @rt_set_car(i64 %t2971, i64 %t2972)
  %t2974 = call i64 @rt_cons(i64 17, i64 17)
  %t2975 = call i64 @rt_intern(ptr @.str.sym.25)
  %t2976 = call i64 @rt_set_car(i64 %t2974, i64 %t2975)
  %t2977 = call i64 @rt_cons(i64 17, i64 17)
  %t2978 = call i64 @rt_intern(ptr @.str.sym.26)
  %t2979 = call i64 @rt_set_car(i64 %t2977, i64 %t2978)
  %t2980 = call i64 @rt_cons(i64 17, i64 17)
  %t2981 = call i64 @rt_intern(ptr @.str.sym.27)
  %t2982 = call i64 @rt_set_car(i64 %t2980, i64 %t2981)
  %t2983 = call i64 @rt_cons(i64 17, i64 17)
  %t2984 = call i64 @rt_intern(ptr @.str.sym.28)
  %t2985 = call i64 @rt_set_car(i64 %t2983, i64 %t2984)
  %t2986 = call i64 @rt_cons(i64 17, i64 17)
  %t2987 = call i64 @rt_intern(ptr @.str.sym.29)
  %t2988 = call i64 @rt_set_car(i64 %t2986, i64 %t2987)
  %t2989 = call i64 @rt_cons(i64 17, i64 17)
  %t2990 = call i64 @rt_intern(ptr @.str.sym.30)
  %t2991 = call i64 @rt_set_car(i64 %t2989, i64 %t2990)
  %t2992 = call i64 @rt_cons(i64 17, i64 17)
  %t2993 = call i64 @rt_intern(ptr @.str.sym.31)
  %t2994 = call i64 @rt_set_car(i64 %t2992, i64 %t2993)
  %t2995 = call i64 @rt_set_cdr(i64 %t2992, i64 2)
  %t2996 = call i64 @rt_set_cdr(i64 %t2989, i64 %t2992)
  %t2997 = call i64 @rt_set_cdr(i64 %t2986, i64 %t2989)
  %t2998 = call i64 @rt_set_cdr(i64 %t2983, i64 %t2986)
  %t2999 = call i64 @rt_set_cdr(i64 %t2980, i64 %t2983)
  %t3000 = call i64 @rt_set_cdr(i64 %t2977, i64 %t2980)
  %t3001 = call i64 @rt_set_cdr(i64 %t2974, i64 %t2977)
  %t3002 = call i64 @rt_set_cdr(i64 %t2971, i64 %t2974)
  %t3003 = call i64 @rt_set_cdr(i64 %t2968, i64 %t2971)
  %t3004 = call i64 @rt_set_cdr(i64 %t2965, i64 %t2968)
  %t3005 = call i64 @rt_set_cdr(i64 %t2962, i64 %t2965)
  %t3006 = call i64 @rt_set_cdr(i64 %t2959, i64 %t2962)
  %t3007 = load i64, ptr @"scheme.base:list-copy"
  call void @rt_check_callable(i64 %t3007)
  %t3008 = and i64 %t3007, -8
  %t3009 = inttoptr i64 %t3008 to ptr
  %t3010 = load i64, ptr %t3009
  %t3011 = inttoptr i64 %t3010 to ptr
  %t3012 = musttail call fastcc i64 %t3011(i64 %t3007, i64 1, i64 %t2959, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3012
}

define fastcc i64 @"scheme.base:code:error-object?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3017 = icmp eq i64 %argc, 1
  br i1 %t3017, label %argok677, label %arityerr676
arityerr676:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok677:
  %t3018 = call i64 @rt_error_object_p(i64 %a0)
  ret i64 %t3018
}

define fastcc i64 @"scheme.base:code:error-object-message"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3023 = icmp eq i64 %argc, 1
  br i1 %t3023, label %argok679, label %arityerr678
arityerr678:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok679:
  %t3024 = call i64 @rt_error_object_message(i64 %a0)
  ret i64 %t3024
}

define fastcc i64 @"scheme.base:code:error-object-irritants"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3029 = icmp eq i64 %argc, 1
  br i1 %t3029, label %argok681, label %arityerr680
arityerr680:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok681:
  %t3030 = call i64 @rt_error_object_irritants(i64 %a0)
  ret i64 %t3030
}

define fastcc i64 @"scheme.base:code:read-error?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3035 = icmp eq i64 %argc, 1
  br i1 %t3035, label %argok683, label %arityerr682
arityerr682:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok683:
  %t3036 = call i64 @rt_error_object_p(i64 %a0)
  %t3037 = icmp ne i64 %t3036, 1
  br i1 %t3037, label %then684, label %else685
then684:
  %t3038 = call i64 @rt_error_object_kind(i64 %a0)
  %t3039 = call i64 @rt_intern(ptr @.str.sym.16)
  %t3040 = call i64 @rt_eq_p(i64 %t3038, i64 %t3039)
  ret i64 %t3040
else685:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:file-error?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3045 = icmp eq i64 %argc, 1
  br i1 %t3045, label %argok687, label %arityerr686
arityerr686:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok687:
  %t3046 = call i64 @rt_error_object_p(i64 %a0)
  %t3047 = icmp ne i64 %t3046, 1
  br i1 %t3047, label %then688, label %else689
then688:
  %t3048 = call i64 @rt_error_object_kind(i64 %a0)
  %t3049 = call i64 @rt_intern(ptr @.str.sym.32)
  %t3050 = call i64 @rt_eq_p(i64 %t3048, i64 %t3049)
  ret i64 %t3050
else689:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_551"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3055 = icmp eq i64 %argc, 1
  br i1 %t3055, label %argok691, label %arityerr690
arityerr690:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok691:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_553"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3056 = icmp eq i64 %argc, 1
  br i1 %t3056, label %argok693, label %arityerr692
arityerr692:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok693:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_555"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3057 = icmp sge i64 %argc, 0
  br i1 %t3057, label %argok695, label %arityerr694
arityerr694:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok695:
  %t3058 = call ptr @rt_alloc_words(i64 8)
  %t3059 = getelementptr i64, ptr %t3058, i64 0
  store i64 %a0, ptr %t3059
  %t3060 = getelementptr i64, ptr %t3058, i64 1
  store i64 %a1, ptr %t3060
  %t3061 = getelementptr i64, ptr %t3058, i64 2
  store i64 %a2, ptr %t3061
  %t3062 = getelementptr i64, ptr %t3058, i64 3
  store i64 %a3, ptr %t3062
  %t3063 = getelementptr i64, ptr %t3058, i64 4
  store i64 %a4, ptr %t3063
  %t3064 = getelementptr i64, ptr %t3058, i64 5
  store i64 %a5, ptr %t3064
  %t3065 = getelementptr i64, ptr %t3058, i64 6
  store i64 %a6, ptr %t3065
  %t3066 = getelementptr i64, ptr %t3058, i64 7
  store i64 %a7, ptr %t3066
  %t3067 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t3058, ptr %overflow)
  %t3068 = call i64 @rt_null_p(i64 %t3067)
  %t3069 = icmp ne i64 %t3068, 1
  br i1 %t3069, label %then696, label %else697
then696:
  %t3070 = and i64 %self, -8
  %t3071 = inttoptr i64 %t3070 to ptr
  %t3072 = getelementptr i64, ptr %t3071, i64 1
  %t3073 = load i64, ptr %t3072
  %t3074 = call i64 @rt_vector_ref(i64 %t3073, i64 0)
  ret i64 %t3074
else697:
  %t3075 = call i64 @rt_cdr(i64 %t3067)
  %t3076 = call i64 @rt_null_p(i64 %t3075)
  %t3077 = icmp ne i64 %t3076, 1
  br i1 %t3077, label %then698, label %else699
then698:
  %t3078 = and i64 %self, -8
  %t3079 = inttoptr i64 %t3078 to ptr
  %t3080 = getelementptr i64, ptr %t3079, i64 1
  %t3081 = load i64, ptr %t3080
  %t3082 = call i64 @rt_car(i64 %t3067)
  %t3083 = and i64 %self, -8
  %t3084 = inttoptr i64 %t3083 to ptr
  %t3085 = getelementptr i64, ptr %t3084, i64 2
  %t3086 = load i64, ptr %t3085
  call void @rt_check_callable(i64 %t3086)
  %t3087 = and i64 %t3086, -8
  %t3088 = inttoptr i64 %t3087 to ptr
  %t3089 = load i64, ptr %t3088
  %t3090 = inttoptr i64 %t3089 to ptr
  %t3091 = call fastcc i64%t3090(i64 %t3086, i64 1, i64 %t3082, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3092 = call i64 @rt_vector_set(i64 %t3081, i64 0, i64 %t3091)
  ret i64 %t3092
else699:
  %t3093 = and i64 %self, -8
  %t3094 = inttoptr i64 %t3093 to ptr
  %t3095 = getelementptr i64, ptr %t3094, i64 1
  %t3096 = load i64, ptr %t3095
  %t3097 = call i64 @rt_car(i64 %t3067)
  %t3098 = call i64 @rt_vector_set(i64 %t3096, i64 0, i64 %t3097)
  ret i64 %t3098
}

define fastcc i64 @"min-entry:$scheme.base$ccode_555"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3099 = call i64 @rt_null_p(i64 2)
  %t3100 = icmp ne i64 %t3099, 1
  br i1 %t3100, label %then700, label %else701
then700:
  %t3101 = and i64 %self, -8
  %t3102 = inttoptr i64 %t3101 to ptr
  %t3103 = getelementptr i64, ptr %t3102, i64 1
  %t3104 = load i64, ptr %t3103
  %t3105 = call i64 @rt_vector_ref(i64 %t3104, i64 0)
  ret i64 %t3105
else701:
  %t3106 = call i64 @rt_cdr(i64 2)
  %t3107 = call i64 @rt_null_p(i64 %t3106)
  %t3108 = icmp ne i64 %t3107, 1
  br i1 %t3108, label %then702, label %else703
then702:
  %t3109 = and i64 %self, -8
  %t3110 = inttoptr i64 %t3109 to ptr
  %t3111 = getelementptr i64, ptr %t3110, i64 1
  %t3112 = load i64, ptr %t3111
  %t3113 = call i64 @rt_car(i64 2)
  %t3114 = and i64 %self, -8
  %t3115 = inttoptr i64 %t3114 to ptr
  %t3116 = getelementptr i64, ptr %t3115, i64 2
  %t3117 = load i64, ptr %t3116
  call void @rt_check_callable(i64 %t3117)
  %t3118 = and i64 %t3117, -8
  %t3119 = inttoptr i64 %t3118 to ptr
  %t3120 = load i64, ptr %t3119
  %t3121 = inttoptr i64 %t3120 to ptr
  %t3122 = call fastcc i64%t3121(i64 %t3117, i64 1, i64 %t3113, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3123 = call i64 @rt_vector_set(i64 %t3112, i64 0, i64 %t3122)
  ret i64 %t3123
else703:
  %t3124 = and i64 %self, -8
  %t3125 = inttoptr i64 %t3124 to ptr
  %t3126 = getelementptr i64, ptr %t3125, i64 1
  %t3127 = load i64, ptr %t3126
  %t3128 = call i64 @rt_car(i64 2)
  %t3129 = call i64 @rt_vector_set(i64 %t3127, i64 0, i64 %t3128)
  ret i64 %t3129
}

define fastcc i64 @"scheme.base:code:make-parameter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3130 = icmp sge i64 %argc, 1
  br i1 %t3130, label %argok705, label %arityerr704
arityerr704:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok705:
  %t3131 = call ptr @rt_alloc_words(i64 8)
  %t3132 = getelementptr i64, ptr %t3131, i64 0
  store i64 %a0, ptr %t3132
  %t3133 = getelementptr i64, ptr %t3131, i64 1
  store i64 %a1, ptr %t3133
  %t3134 = getelementptr i64, ptr %t3131, i64 2
  store i64 %a2, ptr %t3134
  %t3135 = getelementptr i64, ptr %t3131, i64 3
  store i64 %a3, ptr %t3135
  %t3136 = getelementptr i64, ptr %t3131, i64 4
  store i64 %a4, ptr %t3136
  %t3137 = getelementptr i64, ptr %t3131, i64 5
  store i64 %a5, ptr %t3137
  %t3138 = getelementptr i64, ptr %t3131, i64 6
  store i64 %a6, ptr %t3138
  %t3139 = getelementptr i64, ptr %t3131, i64 7
  store i64 %a7, ptr %t3139
  %t3140 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t3131, ptr %overflow)
  %t3141 = call i64 @rt_null_p(i64 %t3140)
  %t3142 = icmp ne i64 %t3141, 1
  br i1 %t3142, label %then706, label %else707
then706:
  %t3143 = call ptr @rt_alloc_words(i64 1)
  %t3144 = ptrtoint ptr %t3143 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_551" to i64), ptr %t3143
  %t3145 = or i64 %t3144, 4
  br label %merge708
else707:
  %t3146 = call i64 @rt_car(i64 %t3140)
  br label %merge708
merge708:
  %t3147 = phi i64 [ %t3145, %then706 ], [ %t3146, %else707 ]
  %t3148 = call i64 @rt_make_vector(i64 8, i64 0)
  %t3149 = call i64 @rt_null_p(i64 %t3140)
  %t3150 = icmp ne i64 %t3149, 1
  br i1 %t3150, label %then709, label %else710
then709:
  %t3151 = call ptr @rt_alloc_words(i64 1)
  %t3152 = ptrtoint ptr %t3151 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_553" to i64), ptr %t3151
  %t3153 = or i64 %t3152, 4
  br label %merge711
else710:
  %t3154 = call i64 @rt_car(i64 %t3140)
  br label %merge711
merge711:
  %t3155 = phi i64 [ %t3153, %then709 ], [ %t3154, %else710 ]
  call void @rt_check_callable(i64 %t3155)
  %t3156 = and i64 %t3155, -8
  %t3157 = inttoptr i64 %t3156 to ptr
  %t3158 = load i64, ptr %t3157
  %t3159 = inttoptr i64 %t3158 to ptr
  %t3160 = call fastcc i64%t3159(i64 %t3155, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3161 = call i64 @rt_vector_set(i64 %t3148, i64 0, i64 %t3160)
  %t3162 = call ptr @rt_alloc_words(i64 3)
  %t3163 = ptrtoint ptr %t3162 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_555" to i64), ptr %t3162
  %t3164 = getelementptr i64, ptr %t3162, i64 1
  store i64 %t3148, ptr %t3164
  %t3165 = getelementptr i64, ptr %t3162, i64 2
  store i64 %t3147, ptr %t3165
  %t3166 = or i64 %t3163, 4
  ret i64 %t3166
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cmake-parameter"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3167 = call i64 @rt_null_p(i64 2)
  %t3168 = icmp ne i64 %t3167, 1
  br i1 %t3168, label %then712, label %else713
then712:
  %t3169 = call ptr @rt_alloc_words(i64 1)
  %t3170 = ptrtoint ptr %t3169 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_551" to i64), ptr %t3169
  %t3171 = or i64 %t3170, 4
  br label %merge714
else713:
  %t3172 = call i64 @rt_car(i64 2)
  br label %merge714
merge714:
  %t3173 = phi i64 [ %t3171, %then712 ], [ %t3172, %else713 ]
  %t3174 = call i64 @rt_make_vector(i64 8, i64 0)
  %t3175 = call i64 @rt_null_p(i64 2)
  %t3176 = icmp ne i64 %t3175, 1
  br i1 %t3176, label %then715, label %else716
then715:
  %t3177 = call ptr @rt_alloc_words(i64 1)
  %t3178 = ptrtoint ptr %t3177 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_553" to i64), ptr %t3177
  %t3179 = or i64 %t3178, 4
  br label %merge717
else716:
  %t3180 = call i64 @rt_car(i64 2)
  br label %merge717
merge717:
  %t3181 = phi i64 [ %t3179, %then715 ], [ %t3180, %else716 ]
  call void @rt_check_callable(i64 %t3181)
  %t3182 = and i64 %t3181, -8
  %t3183 = inttoptr i64 %t3182 to ptr
  %t3184 = load i64, ptr %t3183
  %t3185 = inttoptr i64 %t3184 to ptr
  %t3186 = call fastcc i64%t3185(i64 %t3181, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3187 = call i64 @rt_vector_set(i64 %t3174, i64 0, i64 %t3186)
  %t3188 = call ptr @rt_alloc_words(i64 3)
  %t3189 = ptrtoint ptr %t3188 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_555" to i64), ptr %t3188
  %t3190 = getelementptr i64, ptr %t3188, i64 1
  store i64 %t3174, ptr %t3190
  %t3191 = getelementptr i64, ptr %t3188, i64 2
  store i64 %t3173, ptr %t3191
  %t3192 = or i64 %t3189, 4
  ret i64 %t3192
}

define fastcc i64 @"scheme.base:code_567"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3197 = icmp eq i64 %argc, 1
  br i1 %t3197, label %argok719, label %arityerr718
arityerr718:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok719:
  call void @rt_check_callable(i64 %a0)
  %t3198 = and i64 %a0, -8
  %t3199 = inttoptr i64 %t3198 to ptr
  %t3200 = load i64, ptr %t3199
  %t3201 = inttoptr i64 %t3200 to ptr
  %t3202 = musttail call fastcc i64 %t3201(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3202
}

define fastcc i64 @"scheme.base:code_571"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3203 = icmp eq i64 %argc, 2
  br i1 %t3203, label %argok721, label %arityerr720
arityerr720:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok721:
  call void @rt_check_callable(i64 %a0)
  %t3204 = and i64 %a0, -8
  %t3205 = inttoptr i64 %t3204 to ptr
  %t3206 = load i64, ptr %t3205
  %t3207 = inttoptr i64 %t3206 to ptr
  %t3208 = musttail call fastcc i64 %t3207(i64 %a0, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3208
}

define fastcc i64 @"scheme.base:code_569"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3209 = icmp eq i64 %argc, 0
  br i1 %t3209, label %argok723, label %arityerr722
arityerr722:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok723:
  %t3210 = call ptr @rt_alloc_words(i64 1)
  %t3211 = ptrtoint ptr %t3210 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_571" to i64), ptr %t3210
  %t3212 = or i64 %t3211, 4
  %t3213 = and i64 %self, -8
  %t3214 = inttoptr i64 %t3213 to ptr
  %t3215 = getelementptr i64, ptr %t3214, i64 1
  %t3216 = load i64, ptr %t3215
  %t3217 = and i64 %self, -8
  %t3218 = inttoptr i64 %t3217 to ptr
  %t3219 = getelementptr i64, ptr %t3218, i64 2
  %t3220 = load i64, ptr %t3219
  %t3221 = load i64, ptr @"scheme.base:for-each"
  call void @rt_check_callable(i64 %t3221)
  %t3222 = and i64 %t3221, -8
  %t3223 = inttoptr i64 %t3222 to ptr
  %t3224 = load i64, ptr %t3223
  %t3225 = inttoptr i64 %t3224 to ptr
  %t3226 = musttail call fastcc i64 %t3225(i64 %t3221, i64 3, i64 %t3212, i64 %t3216, i64 %t3220, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3226
}

define fastcc i64 @"scheme.base:code_575"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3227 = icmp eq i64 %argc, 2
  br i1 %t3227, label %argok725, label %arityerr724
arityerr724:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok725:
  call void @rt_check_callable(i64 %a0)
  %t3228 = and i64 %a0, -8
  %t3229 = inttoptr i64 %t3228 to ptr
  %t3230 = load i64, ptr %t3229
  %t3231 = inttoptr i64 %t3230 to ptr
  %t3232 = musttail call fastcc i64 %t3231(i64 %a0, i64 2, i64 %a1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3232
}

define fastcc i64 @"scheme.base:code_573"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3233 = icmp eq i64 %argc, 0
  br i1 %t3233, label %argok727, label %arityerr726
arityerr726:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok727:
  %t3234 = call ptr @rt_alloc_words(i64 1)
  %t3235 = ptrtoint ptr %t3234 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_575" to i64), ptr %t3234
  %t3236 = or i64 %t3235, 4
  %t3237 = and i64 %self, -8
  %t3238 = inttoptr i64 %t3237 to ptr
  %t3239 = getelementptr i64, ptr %t3238, i64 1
  %t3240 = load i64, ptr %t3239
  %t3241 = and i64 %self, -8
  %t3242 = inttoptr i64 %t3241 to ptr
  %t3243 = getelementptr i64, ptr %t3242, i64 2
  %t3244 = load i64, ptr %t3243
  %t3245 = load i64, ptr @"scheme.base:for-each"
  call void @rt_check_callable(i64 %t3245)
  %t3246 = and i64 %t3245, -8
  %t3247 = inttoptr i64 %t3246 to ptr
  %t3248 = load i64, ptr %t3247
  %t3249 = inttoptr i64 %t3248 to ptr
  %t3250 = musttail call fastcc i64 %t3249(i64 %t3245, i64 3, i64 %t3236, i64 %t3240, i64 %t3244, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3250
}

define fastcc i64 @"scheme.base:code:with-parameters"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3251 = icmp eq i64 %argc, 3
  br i1 %t3251, label %argok729, label %arityerr728
arityerr728:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok729:
  %t3252 = call ptr @rt_alloc_words(i64 1)
  %t3253 = ptrtoint ptr %t3252 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_567" to i64), ptr %t3252
  %t3254 = or i64 %t3253, 4
  %t3255 = load i64, ptr @"scheme.base:map"
  call void @rt_check_callable(i64 %t3255)
  %t3256 = and i64 %t3255, -8
  %t3257 = inttoptr i64 %t3256 to ptr
  %t3258 = load i64, ptr %t3257
  %t3259 = inttoptr i64 %t3258 to ptr
  %t3260 = call fastcc i64%t3259(i64 %t3255, i64 2, i64 %t3254, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3261 = call ptr @rt_alloc_words(i64 3)
  %t3262 = ptrtoint ptr %t3261 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_569" to i64), ptr %t3261
  %t3263 = getelementptr i64, ptr %t3261, i64 1
  store i64 %a0, ptr %t3263
  %t3264 = getelementptr i64, ptr %t3261, i64 2
  store i64 %a1, ptr %t3264
  %t3265 = or i64 %t3262, 4
  %t3266 = call ptr @rt_alloc_words(i64 3)
  %t3267 = ptrtoint ptr %t3266 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_573" to i64), ptr %t3266
  %t3268 = getelementptr i64, ptr %t3266, i64 1
  store i64 %a0, ptr %t3268
  %t3269 = getelementptr i64, ptr %t3266, i64 2
  store i64 %t3260, ptr %t3269
  %t3270 = or i64 %t3267, 4
  %t3271 = load i64, ptr @"scheme.base:dynamic-wind"
  call void @rt_check_callable(i64 %t3271)
  %t3272 = and i64 %t3271, -8
  %t3273 = inttoptr i64 %t3272 to ptr
  %t3274 = load i64, ptr %t3273
  %t3275 = inttoptr i64 %t3274 to ptr
  %t3276 = musttail call fastcc i64 %t3275(i64 %t3271, i64 3, i64 %t3265, i64 %a2, i64 %t3270, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3276
}

define fastcc i64 @"scheme.base:code_583"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3281 = icmp eq i64 %argc, 2
  br i1 %t3281, label %argok731, label %arityerr730
arityerr730:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok731:
  %t3282 = call i64 @rt_null_p(i64 %a0)
  %t3283 = icmp ne i64 %t3282, 1
  br i1 %t3283, label %then732, label %else733
then732:
  %t3284 = and i64 %self, -8
  %t3285 = inttoptr i64 %t3284 to ptr
  %t3286 = getelementptr i64, ptr %t3285, i64 1
  %t3287 = load i64, ptr %t3286
  ret i64 %t3287
else733:
  %t3288 = and i64 %self, -8
  %t3289 = inttoptr i64 %t3288 to ptr
  %t3290 = getelementptr i64, ptr %t3289, i64 1
  %t3291 = load i64, ptr %t3290
  %t3292 = call i64 @rt_car(i64 %a0)
  %t3293 = call i64 @rt_vector_set(i64 %t3291, i64 %a1, i64 %t3292)
  %t3294 = call i64 @rt_cdr(i64 %a0)
  %t3295 = or i64 %a1, 8
  %t3296 = and i64 %t3295, 7
  %t3297 = icmp eq i64 %t3296, 0
  br i1 %t3297, label %fixfast734, label %fixslow735
fixfast734:
  %t3298 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t3299 = extractvalue {i64, i1} %t3298, 0
  %t3300 = extractvalue {i64, i1} %t3298, 1
  br i1 %t3300, label %fixslow735, label %fixmerge736
fixslow735:
  %t3301 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge736
fixmerge736:
  %t3302 = phi i64 [ %t3299, %fixfast734 ], [ %t3301, %fixslow735 ]
  %t3303 = musttail call fastcc i64 @"scheme.base:code_583"(i64 %self, i64 2, i64 %t3294, i64 %t3302, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3303
}

define fastcc i64 @"scheme.base:code:list->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3304 = icmp eq i64 %argc, 1
  br i1 %t3304, label %argok738, label %arityerr737
arityerr737:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok738:
  %t3305 = load i64, ptr @"scheme.base:length"
  call void @rt_check_callable(i64 %t3305)
  %t3306 = and i64 %t3305, -8
  %t3307 = inttoptr i64 %t3306 to ptr
  %t3308 = load i64, ptr %t3307
  %t3309 = inttoptr i64 %t3308 to ptr
  %t3310 = call fastcc i64%t3309(i64 %t3305, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3311 = call i64 @rt_make_vector(i64 %t3310, i64 0)
  %t3312 = call ptr @rt_alloc_words(i64 3)
  %t3313 = ptrtoint ptr %t3312 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_583" to i64), ptr %t3312
  %t3314 = or i64 %t3313, 4
  %t3315 = getelementptr i64, ptr %t3312, i64 1
  store i64 %t3311, ptr %t3315
  %t3316 = getelementptr i64, ptr %t3312, i64 2
  store i64 %t3314, ptr %t3316
  %t3317 = musttail call fastcc i64 @"scheme.base:code_583"(i64 %t3314, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3317
}

define fastcc i64 @"scheme.base:code:vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3322 = icmp sge i64 %argc, 0
  br i1 %t3322, label %argok740, label %arityerr739
arityerr739:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok740:
  %t3323 = call ptr @rt_alloc_words(i64 8)
  %t3324 = getelementptr i64, ptr %t3323, i64 0
  store i64 %a0, ptr %t3324
  %t3325 = getelementptr i64, ptr %t3323, i64 1
  store i64 %a1, ptr %t3325
  %t3326 = getelementptr i64, ptr %t3323, i64 2
  store i64 %a2, ptr %t3326
  %t3327 = getelementptr i64, ptr %t3323, i64 3
  store i64 %a3, ptr %t3327
  %t3328 = getelementptr i64, ptr %t3323, i64 4
  store i64 %a4, ptr %t3328
  %t3329 = getelementptr i64, ptr %t3323, i64 5
  store i64 %a5, ptr %t3329
  %t3330 = getelementptr i64, ptr %t3323, i64 6
  store i64 %a6, ptr %t3330
  %t3331 = getelementptr i64, ptr %t3323, i64 7
  store i64 %a7, ptr %t3331
  %t3332 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t3323, ptr %overflow)
  %t3333 = load i64, ptr @"scheme.base:list->vector"
  call void @rt_check_callable(i64 %t3333)
  %t3334 = and i64 %t3333, -8
  %t3335 = inttoptr i64 %t3334 to ptr
  %t3336 = load i64, ptr %t3335
  %t3337 = inttoptr i64 %t3336 to ptr
  %t3338 = musttail call fastcc i64 %t3337(i64 %t3333, i64 1, i64 %t3332, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3338
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3339 = load i64, ptr @"scheme.base:list->vector"
  call void @rt_check_callable(i64 %t3339)
  %t3340 = and i64 %t3339, -8
  %t3341 = inttoptr i64 %t3340 to ptr
  %t3342 = load i64, ptr %t3341
  %t3343 = inttoptr i64 %t3342 to ptr
  %t3344 = musttail call fastcc i64 %t3343(i64 %t3339, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3344
}

define fastcc i64 @"scheme.base:code_593"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3349 = icmp eq i64 %argc, 2
  br i1 %t3349, label %argok742, label %arityerr741
arityerr741:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok742:
  %t3350 = call i64 @rt_null_p(i64 %a0)
  %t3351 = icmp ne i64 %t3350, 1
  br i1 %t3351, label %then743, label %else744
then743:
  %t3352 = and i64 %self, -8
  %t3353 = inttoptr i64 %t3352 to ptr
  %t3354 = getelementptr i64, ptr %t3353, i64 1
  %t3355 = load i64, ptr %t3354
  ret i64 %t3355
else744:
  %t3356 = and i64 %self, -8
  %t3357 = inttoptr i64 %t3356 to ptr
  %t3358 = getelementptr i64, ptr %t3357, i64 1
  %t3359 = load i64, ptr %t3358
  %t3360 = call i64 @rt_car(i64 %a0)
  %t3361 = call i64 @rt_bytevector_u8_set(i64 %t3359, i64 %a1, i64 %t3360)
  %t3362 = call i64 @rt_cdr(i64 %a0)
  %t3363 = or i64 %a1, 8
  %t3364 = and i64 %t3363, 7
  %t3365 = icmp eq i64 %t3364, 0
  br i1 %t3365, label %fixfast745, label %fixslow746
fixfast745:
  %t3366 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 8)
  %t3367 = extractvalue {i64, i1} %t3366, 0
  %t3368 = extractvalue {i64, i1} %t3366, 1
  br i1 %t3368, label %fixslow746, label %fixmerge747
fixslow746:
  %t3369 = call i64 @rt_add(i64 %a1, i64 8)
  br label %fixmerge747
fixmerge747:
  %t3370 = phi i64 [ %t3367, %fixfast745 ], [ %t3369, %fixslow746 ]
  %t3371 = musttail call fastcc i64 @"scheme.base:code_593"(i64 %self, i64 2, i64 %t3362, i64 %t3370, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3371
}

define fastcc i64 @"scheme.base:code:list->bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3372 = icmp eq i64 %argc, 1
  br i1 %t3372, label %argok749, label %arityerr748
arityerr748:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok749:
  %t3373 = load i64, ptr @"scheme.base:length"
  call void @rt_check_callable(i64 %t3373)
  %t3374 = and i64 %t3373, -8
  %t3375 = inttoptr i64 %t3374 to ptr
  %t3376 = load i64, ptr %t3375
  %t3377 = inttoptr i64 %t3376 to ptr
  %t3378 = call fastcc i64%t3377(i64 %t3373, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3379 = call i64 @rt_make_bytevector(i64 %t3378, i64 0)
  %t3380 = call ptr @rt_alloc_words(i64 3)
  %t3381 = ptrtoint ptr %t3380 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_593" to i64), ptr %t3380
  %t3382 = or i64 %t3381, 4
  %t3383 = getelementptr i64, ptr %t3380, i64 1
  store i64 %t3379, ptr %t3383
  %t3384 = getelementptr i64, ptr %t3380, i64 2
  store i64 %t3382, ptr %t3384
  %t3385 = musttail call fastcc i64 @"scheme.base:code_593"(i64 %t3382, i64 2, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3385
}

define fastcc i64 @"scheme.base:code:bytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3390 = icmp sge i64 %argc, 0
  br i1 %t3390, label %argok751, label %arityerr750
arityerr750:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok751:
  %t3391 = call ptr @rt_alloc_words(i64 8)
  %t3392 = getelementptr i64, ptr %t3391, i64 0
  store i64 %a0, ptr %t3392
  %t3393 = getelementptr i64, ptr %t3391, i64 1
  store i64 %a1, ptr %t3393
  %t3394 = getelementptr i64, ptr %t3391, i64 2
  store i64 %a2, ptr %t3394
  %t3395 = getelementptr i64, ptr %t3391, i64 3
  store i64 %a3, ptr %t3395
  %t3396 = getelementptr i64, ptr %t3391, i64 4
  store i64 %a4, ptr %t3396
  %t3397 = getelementptr i64, ptr %t3391, i64 5
  store i64 %a5, ptr %t3397
  %t3398 = getelementptr i64, ptr %t3391, i64 6
  store i64 %a6, ptr %t3398
  %t3399 = getelementptr i64, ptr %t3391, i64 7
  store i64 %a7, ptr %t3399
  %t3400 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t3391, ptr %overflow)
  %t3401 = load i64, ptr @"scheme.base:list->bytevector"
  call void @rt_check_callable(i64 %t3401)
  %t3402 = and i64 %t3401, -8
  %t3403 = inttoptr i64 %t3402 to ptr
  %t3404 = load i64, ptr %t3403
  %t3405 = inttoptr i64 %t3404 to ptr
  %t3406 = musttail call fastcc i64 %t3405(i64 %t3401, i64 1, i64 %t3400, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3406
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cbytevector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3407 = load i64, ptr @"scheme.base:list->bytevector"
  call void @rt_check_callable(i64 %t3407)
  %t3408 = and i64 %t3407, -8
  %t3409 = inttoptr i64 %t3408 to ptr
  %t3410 = load i64, ptr %t3409
  %t3411 = inttoptr i64 %t3410 to ptr
  %t3412 = musttail call fastcc i64 %t3411(i64 %t3407, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3412
}

define fastcc i64 @"scheme.base:code:rng-start"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3417 = icmp eq i64 %argc, 1
  br i1 %t3417, label %argok753, label %arityerr752
arityerr752:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok753:
  %t3418 = call i64 @rt_pair_p(i64 %a0)
  %t3419 = icmp ne i64 %t3418, 1
  br i1 %t3419, label %then754, label %else755
then754:
  %t3420 = call i64 @rt_car(i64 %a0)
  ret i64 %t3420
else755:
  ret i64 0
}

define fastcc i64 @"scheme.base:code:rng-end"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3425 = icmp eq i64 %argc, 2
  br i1 %t3425, label %argok757, label %arityerr756
arityerr756:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok757:
  %t3426 = call i64 @rt_pair_p(i64 %a0)
  %t3427 = icmp ne i64 %t3426, 1
  br i1 %t3427, label %then758, label %else759
then758:
  %t3428 = call i64 @rt_cdr(i64 %a0)
  %t3429 = call i64 @rt_pair_p(i64 %t3428)
  br label %merge760
else759:
  br label %merge760
merge760:
  %t3430 = phi i64 [ %t3429, %then758 ], [ 1, %else759 ]
  %t3431 = icmp ne i64 %t3430, 1
  br i1 %t3431, label %then761, label %else762
then761:
  %t3432 = call i64 @rt_cdr(i64 %a0)
  %t3433 = call i64 @rt_car(i64 %t3432)
  ret i64 %t3433
else762:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:rng-check"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3438 = icmp eq i64 %argc, 4
  br i1 %t3438, label %argok764, label %arityerr763
arityerr763:
  call void @rt_arity_error(i64 4, i64 %argc)
  unreachable
argok764:
  %t3439 = or i64 0, %a1
  %t3440 = and i64 %t3439, 7
  %t3441 = icmp eq i64 %t3440, 0
  br i1 %t3441, label %fixfast765, label %fixslow766
fixfast765:
  %t3442 = icmp slt i64 0, %a1
  %t3443 = select i1 %t3442, i64 257, i64 1
  br label %fixmerge767
fixslow766:
  %t3444 = call i64 @rt_lt(i64 0, i64 %a1)
  br label %fixmerge767
fixmerge767:
  %t3445 = phi i64 [ %t3443, %fixfast765 ], [ %t3444, %fixslow766 ]
  %t3446 = icmp ne i64 %t3445, 1
  br i1 %t3446, label %then768, label %else769
then768:
  br label %merge770
else769:
  %t3447 = or i64 0, %a1
  %t3448 = and i64 %t3447, 7
  %t3449 = icmp eq i64 %t3448, 0
  br i1 %t3449, label %fixfast771, label %fixslow772
fixfast771:
  %t3450 = icmp eq i64 0, %a1
  %t3451 = select i1 %t3450, i64 257, i64 1
  br label %fixmerge773
fixslow772:
  %t3452 = call i64 @rt_num_eq(i64 0, i64 %a1)
  br label %fixmerge773
fixmerge773:
  %t3453 = phi i64 [ %t3451, %fixfast771 ], [ %t3452, %fixslow772 ]
  br label %merge770
merge770:
  %t3454 = phi i64 [ 257, %then768 ], [ %t3453, %fixmerge773 ]
  %t3455 = icmp ne i64 %t3454, 1
  br i1 %t3455, label %then774, label %else775
then774:
  %t3456 = or i64 %a1, %a2
  %t3457 = and i64 %t3456, 7
  %t3458 = icmp eq i64 %t3457, 0
  br i1 %t3458, label %fixfast777, label %fixslow778
fixfast777:
  %t3459 = icmp slt i64 %a1, %a2
  %t3460 = select i1 %t3459, i64 257, i64 1
  br label %fixmerge779
fixslow778:
  %t3461 = call i64 @rt_lt(i64 %a1, i64 %a2)
  br label %fixmerge779
fixmerge779:
  %t3462 = phi i64 [ %t3460, %fixfast777 ], [ %t3461, %fixslow778 ]
  %t3463 = icmp ne i64 %t3462, 1
  br i1 %t3463, label %then780, label %else781
then780:
  br label %merge782
else781:
  %t3464 = or i64 %a1, %a2
  %t3465 = and i64 %t3464, 7
  %t3466 = icmp eq i64 %t3465, 0
  br i1 %t3466, label %fixfast783, label %fixslow784
fixfast783:
  %t3467 = icmp eq i64 %a1, %a2
  %t3468 = select i1 %t3467, i64 257, i64 1
  br label %fixmerge785
fixslow784:
  %t3469 = call i64 @rt_num_eq(i64 %a1, i64 %a2)
  br label %fixmerge785
fixmerge785:
  %t3470 = phi i64 [ %t3468, %fixfast783 ], [ %t3469, %fixslow784 ]
  br label %merge782
merge782:
  %t3471 = phi i64 [ 257, %then780 ], [ %t3470, %fixmerge785 ]
  %t3472 = icmp ne i64 %t3471, 1
  br i1 %t3472, label %then786, label %else787
then786:
  %t3473 = or i64 %a2, %a3
  %t3474 = and i64 %t3473, 7
  %t3475 = icmp eq i64 %t3474, 0
  br i1 %t3475, label %fixfast789, label %fixslow790
fixfast789:
  %t3476 = icmp slt i64 %a2, %a3
  %t3477 = select i1 %t3476, i64 257, i64 1
  br label %fixmerge791
fixslow790:
  %t3478 = call i64 @rt_lt(i64 %a2, i64 %a3)
  br label %fixmerge791
fixmerge791:
  %t3479 = phi i64 [ %t3477, %fixfast789 ], [ %t3478, %fixslow790 ]
  %t3480 = icmp ne i64 %t3479, 1
  br i1 %t3480, label %then792, label %else793
then792:
  br label %merge794
else793:
  %t3481 = or i64 %a2, %a3
  %t3482 = and i64 %t3481, 7
  %t3483 = icmp eq i64 %t3482, 0
  br i1 %t3483, label %fixfast795, label %fixslow796
fixfast795:
  %t3484 = icmp eq i64 %a2, %a3
  %t3485 = select i1 %t3484, i64 257, i64 1
  br label %fixmerge797
fixslow796:
  %t3486 = call i64 @rt_num_eq(i64 %a2, i64 %a3)
  br label %fixmerge797
fixmerge797:
  %t3487 = phi i64 [ %t3485, %fixfast795 ], [ %t3486, %fixslow796 ]
  br label %merge794
merge794:
  %t3488 = phi i64 [ 257, %then792 ], [ %t3487, %fixmerge797 ]
  br label %merge788
else787:
  br label %merge788
merge788:
  %t3489 = phi i64 [ %t3488, %merge794 ], [ 1, %else787 ]
  br label %merge776
else775:
  br label %merge776
merge776:
  %t3490 = phi i64 [ %t3489, %merge788 ], [ 1, %else775 ]
  %t3491 = icmp ne i64 %t3490, 1
  br i1 %t3491, label %then798, label %else799
then798:
  ret i64 257
else799:
  %t3492 = call i64 @rt_make_string(ptr @.str.lit.33, i64 19)
  %t3493 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t3493)
  %t3494 = and i64 %t3493, -8
  %t3495 = inttoptr i64 %t3494 to ptr
  %t3496 = load i64, ptr %t3495
  %t3497 = inttoptr i64 %t3496 to ptr
  %t3498 = musttail call fastcc i64 %t3497(i64 %t3493, i64 5, i64 %t3492, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3498
}

define fastcc i64 @"scheme.base:code:assv"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3503 = icmp eq i64 %argc, 2
  br i1 %t3503, label %argok801, label %arityerr800
arityerr800:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok801:
  %t3504 = call i64 @rt_null_p(i64 %a1)
  %t3505 = icmp ne i64 %t3504, 1
  br i1 %t3505, label %then802, label %else803
then802:
  ret i64 1
else803:
  %t3506 = call i64 @rt_car(i64 %a1)
  %t3507 = call i64 @rt_car(i64 %t3506)
  %t3508 = call i64 @rt_eqv_p(i64 %a0, i64 %t3507)
  %t3509 = icmp ne i64 %t3508, 1
  br i1 %t3509, label %then804, label %else805
then804:
  %t3510 = call i64 @rt_car(i64 %a1)
  ret i64 %t3510
else805:
  %t3511 = call i64 @rt_cdr(i64 %a1)
  %t3512 = load i64, ptr @"scheme.base:assv"
  call void @rt_check_callable(i64 %t3512)
  %t3513 = and i64 %t3512, -8
  %t3514 = inttoptr i64 %t3513 to ptr
  %t3515 = load i64, ptr %t3514
  %t3516 = inttoptr i64 %t3515 to ptr
  %t3517 = musttail call fastcc i64 %t3516(i64 %t3512, i64 2, i64 %a0, i64 %t3511, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3517
}

define fastcc i64 @"scheme.base:code:list-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3522 = icmp eq i64 %argc, 1
  br i1 %t3522, label %argok807, label %arityerr806
arityerr806:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok807:
  %t3523 = call i64 @rt_pair_p(i64 %a0)
  %t3524 = icmp ne i64 %t3523, 1
  br i1 %t3524, label %then808, label %else809
then808:
  %t3525 = call i64 @rt_car(i64 %a0)
  %t3526 = call i64 @rt_cdr(i64 %a0)
  %t3527 = load i64, ptr @"scheme.base:list-copy"
  call void @rt_check_callable(i64 %t3527)
  %t3528 = and i64 %t3527, -8
  %t3529 = inttoptr i64 %t3528 to ptr
  %t3530 = load i64, ptr %t3529
  %t3531 = inttoptr i64 %t3530 to ptr
  %t3532 = call fastcc i64%t3531(i64 %t3527, i64 1, i64 %t3526, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3533 = call i64 @rt_cons(i64 %t3525, i64 %t3532)
  ret i64 %t3533
else809:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:boolean=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3538 = icmp sge i64 %argc, 2
  br i1 %t3538, label %argok811, label %arityerr810
arityerr810:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok811:
  %t3539 = call ptr @rt_alloc_words(i64 8)
  %t3540 = getelementptr i64, ptr %t3539, i64 0
  store i64 %a0, ptr %t3540
  %t3541 = getelementptr i64, ptr %t3539, i64 1
  store i64 %a1, ptr %t3541
  %t3542 = getelementptr i64, ptr %t3539, i64 2
  store i64 %a2, ptr %t3542
  %t3543 = getelementptr i64, ptr %t3539, i64 3
  store i64 %a3, ptr %t3543
  %t3544 = getelementptr i64, ptr %t3539, i64 4
  store i64 %a4, ptr %t3544
  %t3545 = getelementptr i64, ptr %t3539, i64 5
  store i64 %a5, ptr %t3545
  %t3546 = getelementptr i64, ptr %t3539, i64 6
  store i64 %a6, ptr %t3546
  %t3547 = getelementptr i64, ptr %t3539, i64 7
  store i64 %a7, ptr %t3547
  %t3548 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3539, ptr %overflow)
  %t3549 = call i64 @rt_cons(i64 %a1, i64 %t3548)
  %t3550 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t3550)
  %t3551 = and i64 %t3550, -8
  %t3552 = inttoptr i64 %t3551 to ptr
  %t3553 = load i64, ptr %t3552
  %t3554 = inttoptr i64 %t3553 to ptr
  %t3555 = musttail call fastcc i64 %t3554(i64 %t3550, i64 2, i64 %a0, i64 %t3549, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3555
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cboolean=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3556 = call i64 @rt_cons(i64 %a1, i64 2)
  %t3557 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t3557)
  %t3558 = and i64 %t3557, -8
  %t3559 = inttoptr i64 %t3558 to ptr
  %t3560 = load i64, ptr %t3559
  %t3561 = inttoptr i64 %t3560 to ptr
  %t3562 = musttail call fastcc i64 %t3561(i64 %t3557, i64 2, i64 %a0, i64 %t3556, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3562
}

define fastcc i64 @"scheme.base:code:symbol=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3567 = icmp sge i64 %argc, 2
  br i1 %t3567, label %argok813, label %arityerr812
arityerr812:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok813:
  %t3568 = call ptr @rt_alloc_words(i64 8)
  %t3569 = getelementptr i64, ptr %t3568, i64 0
  store i64 %a0, ptr %t3569
  %t3570 = getelementptr i64, ptr %t3568, i64 1
  store i64 %a1, ptr %t3570
  %t3571 = getelementptr i64, ptr %t3568, i64 2
  store i64 %a2, ptr %t3571
  %t3572 = getelementptr i64, ptr %t3568, i64 3
  store i64 %a3, ptr %t3572
  %t3573 = getelementptr i64, ptr %t3568, i64 4
  store i64 %a4, ptr %t3573
  %t3574 = getelementptr i64, ptr %t3568, i64 5
  store i64 %a5, ptr %t3574
  %t3575 = getelementptr i64, ptr %t3568, i64 6
  store i64 %a6, ptr %t3575
  %t3576 = getelementptr i64, ptr %t3568, i64 7
  store i64 %a7, ptr %t3576
  %t3577 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3568, ptr %overflow)
  %t3578 = call i64 @rt_cons(i64 %a1, i64 %t3577)
  %t3579 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t3579)
  %t3580 = and i64 %t3579, -8
  %t3581 = inttoptr i64 %t3580 to ptr
  %t3582 = load i64, ptr %t3581
  %t3583 = inttoptr i64 %t3582 to ptr
  %t3584 = musttail call fastcc i64 %t3583(i64 %t3579, i64 2, i64 %a0, i64 %t3578, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3584
}

define fastcc i64 @"min-entry:$scheme.base$ccode$csymbol=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3585 = call i64 @rt_cons(i64 %a1, i64 2)
  %t3586 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t3586)
  %t3587 = and i64 %t3586, -8
  %t3588 = inttoptr i64 %t3587 to ptr
  %t3589 = load i64, ptr %t3588
  %t3590 = inttoptr i64 %t3589 to ptr
  %t3591 = musttail call fastcc i64 %t3590(i64 %t3586, i64 2, i64 %a0, i64 %t3585, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3591
}

define fastcc i64 @"scheme.base:code:eqv-chain?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3596 = icmp eq i64 %argc, 2
  br i1 %t3596, label %argok815, label %arityerr814
arityerr814:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok815:
  %t3597 = call i64 @rt_null_p(i64 %a1)
  %t3598 = icmp ne i64 %t3597, 1
  br i1 %t3598, label %then816, label %else817
then816:
  ret i64 257
else817:
  %t3599 = call i64 @rt_car(i64 %a1)
  %t3600 = call i64 @rt_eqv_p(i64 %a0, i64 %t3599)
  %t3601 = icmp ne i64 %t3600, 1
  br i1 %t3601, label %then818, label %else819
then818:
  %t3602 = call i64 @rt_car(i64 %a1)
  %t3603 = call i64 @rt_cdr(i64 %a1)
  %t3604 = load i64, ptr @"scheme.base:eqv-chain?"
  call void @rt_check_callable(i64 %t3604)
  %t3605 = and i64 %t3604, -8
  %t3606 = inttoptr i64 %t3605 to ptr
  %t3607 = load i64, ptr %t3606
  %t3608 = inttoptr i64 %t3607 to ptr
  %t3609 = musttail call fastcc i64 %t3608(i64 %t3604, i64 2, i64 %t3602, i64 %t3603, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3609
else819:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_676"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3614 = icmp eq i64 %argc, 1
  br i1 %t3614, label %argok821, label %arityerr820
arityerr820:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok821:
  %t3615 = and i64 %self, -8
  %t3616 = inttoptr i64 %t3615 to ptr
  %t3617 = getelementptr i64, ptr %t3616, i64 1
  %t3618 = load i64, ptr %t3617
  %t3619 = or i64 %a0, %t3618
  %t3620 = and i64 %t3619, 7
  %t3621 = icmp eq i64 %t3620, 0
  br i1 %t3621, label %fixfast822, label %fixslow823
fixfast822:
  %t3622 = icmp eq i64 %a0, %t3618
  %t3623 = select i1 %t3622, i64 257, i64 1
  br label %fixmerge824
fixslow823:
  %t3624 = call i64 @rt_num_eq(i64 %a0, i64 %t3618)
  br label %fixmerge824
fixmerge824:
  %t3625 = phi i64 [ %t3623, %fixfast822 ], [ %t3624, %fixslow823 ]
  %t3626 = icmp ne i64 %t3625, 1
  br i1 %t3626, label %then825, label %else826
then825:
  %t3627 = and i64 %self, -8
  %t3628 = inttoptr i64 %t3627 to ptr
  %t3629 = getelementptr i64, ptr %t3628, i64 2
  %t3630 = load i64, ptr %t3629
  %t3631 = or i64 %a0, %t3630
  %t3632 = and i64 %t3631, 7
  %t3633 = icmp eq i64 %t3632, 0
  br i1 %t3633, label %fixfast828, label %fixslow829
fixfast828:
  %t3634 = icmp eq i64 %a0, %t3630
  %t3635 = select i1 %t3634, i64 257, i64 1
  br label %fixmerge830
fixslow829:
  %t3636 = call i64 @rt_num_eq(i64 %a0, i64 %t3630)
  br label %fixmerge830
fixmerge830:
  %t3637 = phi i64 [ %t3635, %fixfast828 ], [ %t3636, %fixslow829 ]
  br label %merge827
else826:
  br label %merge827
merge827:
  %t3638 = phi i64 [ %t3637, %fixmerge830 ], [ 1, %else826 ]
  %t3639 = icmp ne i64 %t3638, 1
  br i1 %t3639, label %then831, label %else832
then831:
  ret i64 0
else832:
  %t3640 = and i64 %self, -8
  %t3641 = inttoptr i64 %t3640 to ptr
  %t3642 = getelementptr i64, ptr %t3641, i64 1
  %t3643 = load i64, ptr %t3642
  %t3644 = or i64 %a0, %t3643
  %t3645 = and i64 %t3644, 7
  %t3646 = icmp eq i64 %t3645, 0
  br i1 %t3646, label %fixfast833, label %fixslow834
fixfast833:
  %t3647 = icmp eq i64 %a0, %t3643
  %t3648 = select i1 %t3647, i64 257, i64 1
  br label %fixmerge835
fixslow834:
  %t3649 = call i64 @rt_num_eq(i64 %a0, i64 %t3643)
  br label %fixmerge835
fixmerge835:
  %t3650 = phi i64 [ %t3648, %fixfast833 ], [ %t3649, %fixslow834 ]
  %t3651 = icmp ne i64 %t3650, 1
  br i1 %t3651, label %then836, label %else837
then836:
  ret i64 -8
else837:
  %t3652 = and i64 %self, -8
  %t3653 = inttoptr i64 %t3652 to ptr
  %t3654 = getelementptr i64, ptr %t3653, i64 2
  %t3655 = load i64, ptr %t3654
  %t3656 = or i64 %a0, %t3655
  %t3657 = and i64 %t3656, 7
  %t3658 = icmp eq i64 %t3657, 0
  br i1 %t3658, label %fixfast838, label %fixslow839
fixfast838:
  %t3659 = icmp eq i64 %a0, %t3655
  %t3660 = select i1 %t3659, i64 257, i64 1
  br label %fixmerge840
fixslow839:
  %t3661 = call i64 @rt_num_eq(i64 %a0, i64 %t3655)
  br label %fixmerge840
fixmerge840:
  %t3662 = phi i64 [ %t3660, %fixfast838 ], [ %t3661, %fixslow839 ]
  %t3663 = icmp ne i64 %t3662, 1
  br i1 %t3663, label %then841, label %else842
then841:
  ret i64 8
else842:
  %t3664 = and i64 %self, -8
  %t3665 = inttoptr i64 %t3664 to ptr
  %t3666 = getelementptr i64, ptr %t3665, i64 3
  %t3667 = load i64, ptr %t3666
  %t3668 = call i64 @rt_string_ref(i64 %t3667, i64 %a0)
  %t3669 = call i64 @rt_char_to_integer(i64 %t3668)
  %t3670 = and i64 %self, -8
  %t3671 = inttoptr i64 %t3670 to ptr
  %t3672 = getelementptr i64, ptr %t3671, i64 4
  %t3673 = load i64, ptr %t3672
  %t3674 = call i64 @rt_string_ref(i64 %t3673, i64 %a0)
  %t3675 = call i64 @rt_char_to_integer(i64 %t3674)
  %t3676 = or i64 %t3669, %t3675
  %t3677 = and i64 %t3676, 7
  %t3678 = icmp eq i64 %t3677, 0
  br i1 %t3678, label %fixfast843, label %fixslow844
fixfast843:
  %t3679 = icmp slt i64 %t3669, %t3675
  %t3680 = select i1 %t3679, i64 257, i64 1
  br label %fixmerge845
fixslow844:
  %t3681 = call i64 @rt_lt(i64 %t3669, i64 %t3675)
  br label %fixmerge845
fixmerge845:
  %t3682 = phi i64 [ %t3680, %fixfast843 ], [ %t3681, %fixslow844 ]
  %t3683 = icmp ne i64 %t3682, 1
  br i1 %t3683, label %then846, label %else847
then846:
  ret i64 -8
else847:
  %t3684 = or i64 %t3675, %t3669
  %t3685 = and i64 %t3684, 7
  %t3686 = icmp eq i64 %t3685, 0
  br i1 %t3686, label %fixfast848, label %fixslow849
fixfast848:
  %t3687 = icmp slt i64 %t3675, %t3669
  %t3688 = select i1 %t3687, i64 257, i64 1
  br label %fixmerge850
fixslow849:
  %t3689 = call i64 @rt_lt(i64 %t3675, i64 %t3669)
  br label %fixmerge850
fixmerge850:
  %t3690 = phi i64 [ %t3688, %fixfast848 ], [ %t3689, %fixslow849 ]
  %t3691 = icmp ne i64 %t3690, 1
  br i1 %t3691, label %then851, label %else852
then851:
  ret i64 8
else852:
  %t3692 = or i64 %a0, 8
  %t3693 = and i64 %t3692, 7
  %t3694 = icmp eq i64 %t3693, 0
  br i1 %t3694, label %fixfast853, label %fixslow854
fixfast853:
  %t3695 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t3696 = extractvalue {i64, i1} %t3695, 0
  %t3697 = extractvalue {i64, i1} %t3695, 1
  br i1 %t3697, label %fixslow854, label %fixmerge855
fixslow854:
  %t3698 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge855
fixmerge855:
  %t3699 = phi i64 [ %t3696, %fixfast853 ], [ %t3698, %fixslow854 ]
  %t3700 = musttail call fastcc i64 @"scheme.base:code_676"(i64 %self, i64 1, i64 %t3699, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3700
}

define fastcc i64 @"scheme.base:code:str-cmp"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3701 = icmp eq i64 %argc, 2
  br i1 %t3701, label %argok857, label %arityerr856
arityerr856:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok857:
  %t3702 = call i64 @rt_string_length(i64 %a0)
  %t3703 = call i64 @rt_string_length(i64 %a1)
  %t3704 = call ptr @rt_alloc_words(i64 6)
  %t3705 = ptrtoint ptr %t3704 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_676" to i64), ptr %t3704
  %t3706 = or i64 %t3705, 4
  %t3707 = getelementptr i64, ptr %t3704, i64 1
  store i64 %t3702, ptr %t3707
  %t3708 = getelementptr i64, ptr %t3704, i64 2
  store i64 %t3703, ptr %t3708
  %t3709 = getelementptr i64, ptr %t3704, i64 3
  store i64 %a0, ptr %t3709
  %t3710 = getelementptr i64, ptr %t3704, i64 4
  store i64 %a1, ptr %t3710
  %t3711 = getelementptr i64, ptr %t3704, i64 5
  store i64 %t3706, ptr %t3711
  %t3712 = musttail call fastcc i64 @"scheme.base:code_676"(i64 %t3706, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3712
}

define fastcc i64 @"scheme.base:code:str-chain?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3717 = icmp eq i64 %argc, 3
  br i1 %t3717, label %argok859, label %arityerr858
arityerr858:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok859:
  %t3718 = call i64 @rt_null_p(i64 %a2)
  %t3719 = icmp ne i64 %t3718, 1
  br i1 %t3719, label %then860, label %else861
then860:
  ret i64 257
else861:
  %t3720 = call i64 @rt_car(i64 %a2)
  call void @rt_check_callable(i64 %a0)
  %t3721 = and i64 %a0, -8
  %t3722 = inttoptr i64 %t3721 to ptr
  %t3723 = load i64, ptr %t3722
  %t3724 = inttoptr i64 %t3723 to ptr
  %t3725 = call fastcc i64%t3724(i64 %a0, i64 2, i64 %a1, i64 %t3720, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3726 = icmp ne i64 %t3725, 1
  br i1 %t3726, label %then862, label %else863
then862:
  %t3727 = call i64 @rt_car(i64 %a2)
  %t3728 = call i64 @rt_cdr(i64 %a2)
  %t3729 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3729)
  %t3730 = and i64 %t3729, -8
  %t3731 = inttoptr i64 %t3730 to ptr
  %t3732 = load i64, ptr %t3731
  %t3733 = inttoptr i64 %t3732 to ptr
  %t3734 = musttail call fastcc i64 %t3733(i64 %t3729, i64 3, i64 %a0, i64 %t3727, i64 %t3728, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3734
else863:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_692"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3739 = icmp eq i64 %argc, 2
  br i1 %t3739, label %argok865, label %arityerr864
arityerr864:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok865:
  %t3740 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t3740)
  %t3741 = and i64 %t3740, -8
  %t3742 = inttoptr i64 %t3741 to ptr
  %t3743 = load i64, ptr %t3742
  %t3744 = inttoptr i64 %t3743 to ptr
  %t3745 = call fastcc i64%t3744(i64 %t3740, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3746 = or i64 %t3745, 0
  %t3747 = and i64 %t3746, 7
  %t3748 = icmp eq i64 %t3747, 0
  br i1 %t3748, label %fixfast866, label %fixslow867
fixfast866:
  %t3749 = icmp slt i64 %t3745, 0
  %t3750 = select i1 %t3749, i64 257, i64 1
  br label %fixmerge868
fixslow867:
  %t3751 = call i64 @rt_lt(i64 %t3745, i64 0)
  br label %fixmerge868
fixmerge868:
  %t3752 = phi i64 [ %t3750, %fixfast866 ], [ %t3751, %fixslow867 ]
  ret i64 %t3752
}

define fastcc i64 @"scheme.base:code:string<?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3753 = icmp sge i64 %argc, 2
  br i1 %t3753, label %argok870, label %arityerr869
arityerr869:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok870:
  %t3754 = call ptr @rt_alloc_words(i64 8)
  %t3755 = getelementptr i64, ptr %t3754, i64 0
  store i64 %a0, ptr %t3755
  %t3756 = getelementptr i64, ptr %t3754, i64 1
  store i64 %a1, ptr %t3756
  %t3757 = getelementptr i64, ptr %t3754, i64 2
  store i64 %a2, ptr %t3757
  %t3758 = getelementptr i64, ptr %t3754, i64 3
  store i64 %a3, ptr %t3758
  %t3759 = getelementptr i64, ptr %t3754, i64 4
  store i64 %a4, ptr %t3759
  %t3760 = getelementptr i64, ptr %t3754, i64 5
  store i64 %a5, ptr %t3760
  %t3761 = getelementptr i64, ptr %t3754, i64 6
  store i64 %a6, ptr %t3761
  %t3762 = getelementptr i64, ptr %t3754, i64 7
  store i64 %a7, ptr %t3762
  %t3763 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3754, ptr %overflow)
  %t3764 = call ptr @rt_alloc_words(i64 1)
  %t3765 = ptrtoint ptr %t3764 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_692" to i64), ptr %t3764
  %t3766 = or i64 %t3765, 4
  %t3767 = call i64 @rt_cons(i64 %a1, i64 %t3763)
  %t3768 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3768)
  %t3769 = and i64 %t3768, -8
  %t3770 = inttoptr i64 %t3769 to ptr
  %t3771 = load i64, ptr %t3770
  %t3772 = inttoptr i64 %t3771 to ptr
  %t3773 = musttail call fastcc i64 %t3772(i64 %t3768, i64 3, i64 %t3766, i64 %a0, i64 %t3767, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3773
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring<?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3774 = call ptr @rt_alloc_words(i64 1)
  %t3775 = ptrtoint ptr %t3774 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_692" to i64), ptr %t3774
  %t3776 = or i64 %t3775, 4
  %t3777 = call i64 @rt_cons(i64 %a1, i64 2)
  %t3778 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3778)
  %t3779 = and i64 %t3778, -8
  %t3780 = inttoptr i64 %t3779 to ptr
  %t3781 = load i64, ptr %t3780
  %t3782 = inttoptr i64 %t3781 to ptr
  %t3783 = musttail call fastcc i64 %t3782(i64 %t3778, i64 3, i64 %t3776, i64 %a0, i64 %t3777, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3783
}

define fastcc i64 @"scheme.base:code_704"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3788 = icmp eq i64 %argc, 2
  br i1 %t3788, label %argok872, label %arityerr871
arityerr871:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok872:
  %t3789 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t3789)
  %t3790 = and i64 %t3789, -8
  %t3791 = inttoptr i64 %t3790 to ptr
  %t3792 = load i64, ptr %t3791
  %t3793 = inttoptr i64 %t3792 to ptr
  %t3794 = call fastcc i64%t3793(i64 %t3789, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3795 = or i64 0, %t3794
  %t3796 = and i64 %t3795, 7
  %t3797 = icmp eq i64 %t3796, 0
  br i1 %t3797, label %fixfast873, label %fixslow874
fixfast873:
  %t3798 = icmp slt i64 0, %t3794
  %t3799 = select i1 %t3798, i64 257, i64 1
  br label %fixmerge875
fixslow874:
  %t3800 = call i64 @rt_lt(i64 0, i64 %t3794)
  br label %fixmerge875
fixmerge875:
  %t3801 = phi i64 [ %t3799, %fixfast873 ], [ %t3800, %fixslow874 ]
  ret i64 %t3801
}

define fastcc i64 @"scheme.base:code:string>?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3802 = icmp sge i64 %argc, 2
  br i1 %t3802, label %argok877, label %arityerr876
arityerr876:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok877:
  %t3803 = call ptr @rt_alloc_words(i64 8)
  %t3804 = getelementptr i64, ptr %t3803, i64 0
  store i64 %a0, ptr %t3804
  %t3805 = getelementptr i64, ptr %t3803, i64 1
  store i64 %a1, ptr %t3805
  %t3806 = getelementptr i64, ptr %t3803, i64 2
  store i64 %a2, ptr %t3806
  %t3807 = getelementptr i64, ptr %t3803, i64 3
  store i64 %a3, ptr %t3807
  %t3808 = getelementptr i64, ptr %t3803, i64 4
  store i64 %a4, ptr %t3808
  %t3809 = getelementptr i64, ptr %t3803, i64 5
  store i64 %a5, ptr %t3809
  %t3810 = getelementptr i64, ptr %t3803, i64 6
  store i64 %a6, ptr %t3810
  %t3811 = getelementptr i64, ptr %t3803, i64 7
  store i64 %a7, ptr %t3811
  %t3812 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3803, ptr %overflow)
  %t3813 = call ptr @rt_alloc_words(i64 1)
  %t3814 = ptrtoint ptr %t3813 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_704" to i64), ptr %t3813
  %t3815 = or i64 %t3814, 4
  %t3816 = call i64 @rt_cons(i64 %a1, i64 %t3812)
  %t3817 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3817)
  %t3818 = and i64 %t3817, -8
  %t3819 = inttoptr i64 %t3818 to ptr
  %t3820 = load i64, ptr %t3819
  %t3821 = inttoptr i64 %t3820 to ptr
  %t3822 = musttail call fastcc i64 %t3821(i64 %t3817, i64 3, i64 %t3815, i64 %a0, i64 %t3816, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3822
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring>?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3823 = call ptr @rt_alloc_words(i64 1)
  %t3824 = ptrtoint ptr %t3823 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_704" to i64), ptr %t3823
  %t3825 = or i64 %t3824, 4
  %t3826 = call i64 @rt_cons(i64 %a1, i64 2)
  %t3827 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3827)
  %t3828 = and i64 %t3827, -8
  %t3829 = inttoptr i64 %t3828 to ptr
  %t3830 = load i64, ptr %t3829
  %t3831 = inttoptr i64 %t3830 to ptr
  %t3832 = musttail call fastcc i64 %t3831(i64 %t3827, i64 3, i64 %t3825, i64 %a0, i64 %t3826, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3832
}

define fastcc i64 @"scheme.base:code_716"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3837 = icmp eq i64 %argc, 2
  br i1 %t3837, label %argok879, label %arityerr878
arityerr878:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok879:
  %t3838 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t3838)
  %t3839 = and i64 %t3838, -8
  %t3840 = inttoptr i64 %t3839 to ptr
  %t3841 = load i64, ptr %t3840
  %t3842 = inttoptr i64 %t3841 to ptr
  %t3843 = call fastcc i64%t3842(i64 %t3838, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3844 = or i64 0, %t3843
  %t3845 = and i64 %t3844, 7
  %t3846 = icmp eq i64 %t3845, 0
  br i1 %t3846, label %fixfast880, label %fixslow881
fixfast880:
  %t3847 = icmp slt i64 0, %t3843
  %t3848 = select i1 %t3847, i64 257, i64 1
  br label %fixmerge882
fixslow881:
  %t3849 = call i64 @rt_lt(i64 0, i64 %t3843)
  br label %fixmerge882
fixmerge882:
  %t3850 = phi i64 [ %t3848, %fixfast880 ], [ %t3849, %fixslow881 ]
  %t3851 = call i64 @rt_not(i64 %t3850)
  ret i64 %t3851
}

define fastcc i64 @"scheme.base:code:string<=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3852 = icmp sge i64 %argc, 2
  br i1 %t3852, label %argok884, label %arityerr883
arityerr883:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok884:
  %t3853 = call ptr @rt_alloc_words(i64 8)
  %t3854 = getelementptr i64, ptr %t3853, i64 0
  store i64 %a0, ptr %t3854
  %t3855 = getelementptr i64, ptr %t3853, i64 1
  store i64 %a1, ptr %t3855
  %t3856 = getelementptr i64, ptr %t3853, i64 2
  store i64 %a2, ptr %t3856
  %t3857 = getelementptr i64, ptr %t3853, i64 3
  store i64 %a3, ptr %t3857
  %t3858 = getelementptr i64, ptr %t3853, i64 4
  store i64 %a4, ptr %t3858
  %t3859 = getelementptr i64, ptr %t3853, i64 5
  store i64 %a5, ptr %t3859
  %t3860 = getelementptr i64, ptr %t3853, i64 6
  store i64 %a6, ptr %t3860
  %t3861 = getelementptr i64, ptr %t3853, i64 7
  store i64 %a7, ptr %t3861
  %t3862 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3853, ptr %overflow)
  %t3863 = call ptr @rt_alloc_words(i64 1)
  %t3864 = ptrtoint ptr %t3863 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_716" to i64), ptr %t3863
  %t3865 = or i64 %t3864, 4
  %t3866 = call i64 @rt_cons(i64 %a1, i64 %t3862)
  %t3867 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3867)
  %t3868 = and i64 %t3867, -8
  %t3869 = inttoptr i64 %t3868 to ptr
  %t3870 = load i64, ptr %t3869
  %t3871 = inttoptr i64 %t3870 to ptr
  %t3872 = musttail call fastcc i64 %t3871(i64 %t3867, i64 3, i64 %t3865, i64 %a0, i64 %t3866, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3872
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring<=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3873 = call ptr @rt_alloc_words(i64 1)
  %t3874 = ptrtoint ptr %t3873 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_716" to i64), ptr %t3873
  %t3875 = or i64 %t3874, 4
  %t3876 = call i64 @rt_cons(i64 %a1, i64 2)
  %t3877 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3877)
  %t3878 = and i64 %t3877, -8
  %t3879 = inttoptr i64 %t3878 to ptr
  %t3880 = load i64, ptr %t3879
  %t3881 = inttoptr i64 %t3880 to ptr
  %t3882 = musttail call fastcc i64 %t3881(i64 %t3877, i64 3, i64 %t3875, i64 %a0, i64 %t3876, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3882
}

define fastcc i64 @"scheme.base:code_728"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3887 = icmp eq i64 %argc, 2
  br i1 %t3887, label %argok886, label %arityerr885
arityerr885:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok886:
  %t3888 = load i64, ptr @"scheme.base:str-cmp"
  call void @rt_check_callable(i64 %t3888)
  %t3889 = and i64 %t3888, -8
  %t3890 = inttoptr i64 %t3889 to ptr
  %t3891 = load i64, ptr %t3890
  %t3892 = inttoptr i64 %t3891 to ptr
  %t3893 = call fastcc i64%t3892(i64 %t3888, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3894 = or i64 %t3893, 0
  %t3895 = and i64 %t3894, 7
  %t3896 = icmp eq i64 %t3895, 0
  br i1 %t3896, label %fixfast887, label %fixslow888
fixfast887:
  %t3897 = icmp slt i64 %t3893, 0
  %t3898 = select i1 %t3897, i64 257, i64 1
  br label %fixmerge889
fixslow888:
  %t3899 = call i64 @rt_lt(i64 %t3893, i64 0)
  br label %fixmerge889
fixmerge889:
  %t3900 = phi i64 [ %t3898, %fixfast887 ], [ %t3899, %fixslow888 ]
  %t3901 = call i64 @rt_not(i64 %t3900)
  ret i64 %t3901
}

define fastcc i64 @"scheme.base:code:string>=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3902 = icmp sge i64 %argc, 2
  br i1 %t3902, label %argok891, label %arityerr890
arityerr890:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok891:
  %t3903 = call ptr @rt_alloc_words(i64 8)
  %t3904 = getelementptr i64, ptr %t3903, i64 0
  store i64 %a0, ptr %t3904
  %t3905 = getelementptr i64, ptr %t3903, i64 1
  store i64 %a1, ptr %t3905
  %t3906 = getelementptr i64, ptr %t3903, i64 2
  store i64 %a2, ptr %t3906
  %t3907 = getelementptr i64, ptr %t3903, i64 3
  store i64 %a3, ptr %t3907
  %t3908 = getelementptr i64, ptr %t3903, i64 4
  store i64 %a4, ptr %t3908
  %t3909 = getelementptr i64, ptr %t3903, i64 5
  store i64 %a5, ptr %t3909
  %t3910 = getelementptr i64, ptr %t3903, i64 6
  store i64 %a6, ptr %t3910
  %t3911 = getelementptr i64, ptr %t3903, i64 7
  store i64 %a7, ptr %t3911
  %t3912 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t3903, ptr %overflow)
  %t3913 = call ptr @rt_alloc_words(i64 1)
  %t3914 = ptrtoint ptr %t3913 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_728" to i64), ptr %t3913
  %t3915 = or i64 %t3914, 4
  %t3916 = call i64 @rt_cons(i64 %a1, i64 %t3912)
  %t3917 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3917)
  %t3918 = and i64 %t3917, -8
  %t3919 = inttoptr i64 %t3918 to ptr
  %t3920 = load i64, ptr %t3919
  %t3921 = inttoptr i64 %t3920 to ptr
  %t3922 = musttail call fastcc i64 %t3921(i64 %t3917, i64 3, i64 %t3915, i64 %a0, i64 %t3916, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3922
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring>=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3923 = call ptr @rt_alloc_words(i64 1)
  %t3924 = ptrtoint ptr %t3923 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_728" to i64), ptr %t3923
  %t3925 = or i64 %t3924, 4
  %t3926 = call i64 @rt_cons(i64 %a1, i64 2)
  %t3927 = load i64, ptr @"scheme.base:str-chain?"
  call void @rt_check_callable(i64 %t3927)
  %t3928 = and i64 %t3927, -8
  %t3929 = inttoptr i64 %t3928 to ptr
  %t3930 = load i64, ptr %t3929
  %t3931 = inttoptr i64 %t3930 to ptr
  %t3932 = musttail call fastcc i64 %t3931(i64 %t3927, i64 3, i64 %t3925, i64 %a0, i64 %t3926, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3932
}

define fastcc i64 @"scheme.base:code_743"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3937 = icmp eq i64 %argc, 2
  br i1 %t3937, label %argok893, label %arityerr892
arityerr892:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok893:
  %t3938 = and i64 %self, -8
  %t3939 = inttoptr i64 %t3938 to ptr
  %t3940 = getelementptr i64, ptr %t3939, i64 1
  %t3941 = load i64, ptr %t3940
  %t3942 = or i64 %a0, %t3941
  %t3943 = and i64 %t3942, 7
  %t3944 = icmp eq i64 %t3943, 0
  br i1 %t3944, label %fixfast894, label %fixslow895
fixfast894:
  %t3945 = icmp slt i64 %a0, %t3941
  %t3946 = select i1 %t3945, i64 257, i64 1
  br label %fixmerge896
fixslow895:
  %t3947 = call i64 @rt_lt(i64 %a0, i64 %t3941)
  br label %fixmerge896
fixmerge896:
  %t3948 = phi i64 [ %t3946, %fixfast894 ], [ %t3947, %fixslow895 ]
  %t3949 = icmp ne i64 %t3948, 1
  br i1 %t3949, label %then897, label %else898
then897:
  ret i64 %a1
else898:
  %t3950 = or i64 %a0, 8
  %t3951 = and i64 %t3950, 7
  %t3952 = icmp eq i64 %t3951, 0
  br i1 %t3952, label %fixfast899, label %fixslow900
fixfast899:
  %t3953 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t3954 = extractvalue {i64, i1} %t3953, 0
  %t3955 = extractvalue {i64, i1} %t3953, 1
  br i1 %t3955, label %fixslow900, label %fixmerge901
fixslow900:
  %t3956 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge901
fixmerge901:
  %t3957 = phi i64 [ %t3954, %fixfast899 ], [ %t3956, %fixslow900 ]
  %t3958 = and i64 %self, -8
  %t3959 = inttoptr i64 %t3958 to ptr
  %t3960 = getelementptr i64, ptr %t3959, i64 3
  %t3961 = load i64, ptr %t3960
  %t3962 = call i64 @rt_vector_ref(i64 %t3961, i64 %a0)
  %t3963 = call i64 @rt_cons(i64 %t3962, i64 %a1)
  %t3964 = musttail call fastcc i64 @"scheme.base:code_743"(i64 %self, i64 2, i64 %t3957, i64 %t3963, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t3964
}

define fastcc i64 @"scheme.base:code:vector->list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t3965 = icmp sge i64 %argc, 1
  br i1 %t3965, label %argok903, label %arityerr902
arityerr902:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok903:
  %t3966 = call ptr @rt_alloc_words(i64 8)
  %t3967 = getelementptr i64, ptr %t3966, i64 0
  store i64 %a0, ptr %t3967
  %t3968 = getelementptr i64, ptr %t3966, i64 1
  store i64 %a1, ptr %t3968
  %t3969 = getelementptr i64, ptr %t3966, i64 2
  store i64 %a2, ptr %t3969
  %t3970 = getelementptr i64, ptr %t3966, i64 3
  store i64 %a3, ptr %t3970
  %t3971 = getelementptr i64, ptr %t3966, i64 4
  store i64 %a4, ptr %t3971
  %t3972 = getelementptr i64, ptr %t3966, i64 5
  store i64 %a5, ptr %t3972
  %t3973 = getelementptr i64, ptr %t3966, i64 6
  store i64 %a6, ptr %t3973
  %t3974 = getelementptr i64, ptr %t3966, i64 7
  store i64 %a7, ptr %t3974
  %t3975 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t3966, ptr %overflow)
  %t3976 = call i64 @rt_vector_length(i64 %a0)
  %t3977 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t3977)
  %t3978 = and i64 %t3977, -8
  %t3979 = inttoptr i64 %t3978 to ptr
  %t3980 = load i64, ptr %t3979
  %t3981 = inttoptr i64 %t3980 to ptr
  %t3982 = call fastcc i64%t3981(i64 %t3977, i64 1, i64 %t3975, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3983 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t3983)
  %t3984 = and i64 %t3983, -8
  %t3985 = inttoptr i64 %t3984 to ptr
  %t3986 = load i64, ptr %t3985
  %t3987 = inttoptr i64 %t3986 to ptr
  %t3988 = call fastcc i64%t3987(i64 %t3983, i64 2, i64 %t3975, i64 %t3976, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3989 = call i64 @rt_intern(ptr @.str.sym.34)
  %t3990 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t3990)
  %t3991 = and i64 %t3990, -8
  %t3992 = inttoptr i64 %t3991 to ptr
  %t3993 = load i64, ptr %t3992
  %t3994 = inttoptr i64 %t3993 to ptr
  %t3995 = call fastcc i64%t3994(i64 %t3990, i64 4, i64 %t3989, i64 %t3982, i64 %t3988, i64 %t3976, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t3996 = call ptr @rt_alloc_words(i64 4)
  %t3997 = ptrtoint ptr %t3996 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_743" to i64), ptr %t3996
  %t3998 = or i64 %t3997, 4
  %t3999 = getelementptr i64, ptr %t3996, i64 1
  store i64 %t3982, ptr %t3999
  %t4000 = getelementptr i64, ptr %t3996, i64 2
  store i64 %t3998, ptr %t4000
  %t4001 = getelementptr i64, ptr %t3996, i64 3
  store i64 %a0, ptr %t4001
  %t4002 = or i64 %t3988, 8
  %t4003 = and i64 %t4002, 7
  %t4004 = icmp eq i64 %t4003, 0
  br i1 %t4004, label %fixfast904, label %fixslow905
fixfast904:
  %t4005 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t3988, i64 8)
  %t4006 = extractvalue {i64, i1} %t4005, 0
  %t4007 = extractvalue {i64, i1} %t4005, 1
  br i1 %t4007, label %fixslow905, label %fixmerge906
fixslow905:
  %t4008 = call i64 @rt_sub(i64 %t3988, i64 8)
  br label %fixmerge906
fixmerge906:
  %t4009 = phi i64 [ %t4006, %fixfast904 ], [ %t4008, %fixslow905 ]
  %t4010 = musttail call fastcc i64 @"scheme.base:code_743"(i64 %t3998, i64 2, i64 %t4009, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4010
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector->list"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4011 = call i64 @rt_vector_length(i64 %a0)
  %t4012 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4012)
  %t4013 = and i64 %t4012, -8
  %t4014 = inttoptr i64 %t4013 to ptr
  %t4015 = load i64, ptr %t4014
  %t4016 = inttoptr i64 %t4015 to ptr
  %t4017 = call fastcc i64%t4016(i64 %t4012, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4018 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4018)
  %t4019 = and i64 %t4018, -8
  %t4020 = inttoptr i64 %t4019 to ptr
  %t4021 = load i64, ptr %t4020
  %t4022 = inttoptr i64 %t4021 to ptr
  %t4023 = call fastcc i64%t4022(i64 %t4018, i64 2, i64 2, i64 %t4011, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4024 = call i64 @rt_intern(ptr @.str.sym.34)
  %t4025 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4025)
  %t4026 = and i64 %t4025, -8
  %t4027 = inttoptr i64 %t4026 to ptr
  %t4028 = load i64, ptr %t4027
  %t4029 = inttoptr i64 %t4028 to ptr
  %t4030 = call fastcc i64%t4029(i64 %t4025, i64 4, i64 %t4024, i64 %t4017, i64 %t4023, i64 %t4011, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4031 = call ptr @rt_alloc_words(i64 4)
  %t4032 = ptrtoint ptr %t4031 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_743" to i64), ptr %t4031
  %t4033 = or i64 %t4032, 4
  %t4034 = getelementptr i64, ptr %t4031, i64 1
  store i64 %t4017, ptr %t4034
  %t4035 = getelementptr i64, ptr %t4031, i64 2
  store i64 %t4033, ptr %t4035
  %t4036 = getelementptr i64, ptr %t4031, i64 3
  store i64 %a0, ptr %t4036
  %t4037 = or i64 %t4023, 8
  %t4038 = and i64 %t4037, 7
  %t4039 = icmp eq i64 %t4038, 0
  br i1 %t4039, label %fixfast907, label %fixslow908
fixfast907:
  %t4040 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4023, i64 8)
  %t4041 = extractvalue {i64, i1} %t4040, 0
  %t4042 = extractvalue {i64, i1} %t4040, 1
  br i1 %t4042, label %fixslow908, label %fixmerge909
fixslow908:
  %t4043 = call i64 @rt_sub(i64 %t4023, i64 8)
  br label %fixmerge909
fixmerge909:
  %t4044 = phi i64 [ %t4041, %fixfast907 ], [ %t4043, %fixslow908 ]
  %t4045 = musttail call fastcc i64 @"scheme.base:code_743"(i64 %t4033, i64 2, i64 %t4044, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4045
}

define fastcc i64 @"scheme.base:code_758"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4050 = icmp eq i64 %argc, 1
  br i1 %t4050, label %argok911, label %arityerr910
arityerr910:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok911:
  %t4051 = and i64 %self, -8
  %t4052 = inttoptr i64 %t4051 to ptr
  %t4053 = getelementptr i64, ptr %t4052, i64 1
  %t4054 = load i64, ptr %t4053
  %t4055 = or i64 %a0, %t4054
  %t4056 = and i64 %t4055, 7
  %t4057 = icmp eq i64 %t4056, 0
  br i1 %t4057, label %fixfast912, label %fixslow913
fixfast912:
  %t4058 = icmp eq i64 %a0, %t4054
  %t4059 = select i1 %t4058, i64 257, i64 1
  br label %fixmerge914
fixslow913:
  %t4060 = call i64 @rt_num_eq(i64 %a0, i64 %t4054)
  br label %fixmerge914
fixmerge914:
  %t4061 = phi i64 [ %t4059, %fixfast912 ], [ %t4060, %fixslow913 ]
  %t4062 = icmp ne i64 %t4061, 1
  br i1 %t4062, label %then915, label %else916
then915:
  %t4063 = and i64 %self, -8
  %t4064 = inttoptr i64 %t4063 to ptr
  %t4065 = getelementptr i64, ptr %t4064, i64 2
  %t4066 = load i64, ptr %t4065
  ret i64 %t4066
else916:
  %t4067 = and i64 %self, -8
  %t4068 = inttoptr i64 %t4067 to ptr
  %t4069 = getelementptr i64, ptr %t4068, i64 2
  %t4070 = load i64, ptr %t4069
  %t4071 = and i64 %self, -8
  %t4072 = inttoptr i64 %t4071 to ptr
  %t4073 = getelementptr i64, ptr %t4072, i64 3
  %t4074 = load i64, ptr %t4073
  %t4075 = or i64 %a0, %t4074
  %t4076 = and i64 %t4075, 7
  %t4077 = icmp eq i64 %t4076, 0
  br i1 %t4077, label %fixfast917, label %fixslow918
fixfast917:
  %t4078 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t4074)
  %t4079 = extractvalue {i64, i1} %t4078, 0
  %t4080 = extractvalue {i64, i1} %t4078, 1
  br i1 %t4080, label %fixslow918, label %fixmerge919
fixslow918:
  %t4081 = call i64 @rt_sub(i64 %a0, i64 %t4074)
  br label %fixmerge919
fixmerge919:
  %t4082 = phi i64 [ %t4079, %fixfast917 ], [ %t4081, %fixslow918 ]
  %t4083 = and i64 %self, -8
  %t4084 = inttoptr i64 %t4083 to ptr
  %t4085 = getelementptr i64, ptr %t4084, i64 4
  %t4086 = load i64, ptr %t4085
  %t4087 = call i64 @rt_vector_ref(i64 %t4086, i64 %a0)
  %t4088 = call i64 @rt_vector_set(i64 %t4070, i64 %t4082, i64 %t4087)
  %t4089 = or i64 %a0, 8
  %t4090 = and i64 %t4089, 7
  %t4091 = icmp eq i64 %t4090, 0
  br i1 %t4091, label %fixfast920, label %fixslow921
fixfast920:
  %t4092 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4093 = extractvalue {i64, i1} %t4092, 0
  %t4094 = extractvalue {i64, i1} %t4092, 1
  br i1 %t4094, label %fixslow921, label %fixmerge922
fixslow921:
  %t4095 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge922
fixmerge922:
  %t4096 = phi i64 [ %t4093, %fixfast920 ], [ %t4095, %fixslow921 ]
  %t4097 = musttail call fastcc i64 @"scheme.base:code_758"(i64 %self, i64 1, i64 %t4096, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4097
}

define fastcc i64 @"scheme.base:code:vector-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4098 = icmp sge i64 %argc, 1
  br i1 %t4098, label %argok924, label %arityerr923
arityerr923:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok924:
  %t4099 = call ptr @rt_alloc_words(i64 8)
  %t4100 = getelementptr i64, ptr %t4099, i64 0
  store i64 %a0, ptr %t4100
  %t4101 = getelementptr i64, ptr %t4099, i64 1
  store i64 %a1, ptr %t4101
  %t4102 = getelementptr i64, ptr %t4099, i64 2
  store i64 %a2, ptr %t4102
  %t4103 = getelementptr i64, ptr %t4099, i64 3
  store i64 %a3, ptr %t4103
  %t4104 = getelementptr i64, ptr %t4099, i64 4
  store i64 %a4, ptr %t4104
  %t4105 = getelementptr i64, ptr %t4099, i64 5
  store i64 %a5, ptr %t4105
  %t4106 = getelementptr i64, ptr %t4099, i64 6
  store i64 %a6, ptr %t4106
  %t4107 = getelementptr i64, ptr %t4099, i64 7
  store i64 %a7, ptr %t4107
  %t4108 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t4099, ptr %overflow)
  %t4109 = call i64 @rt_vector_length(i64 %a0)
  %t4110 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4110)
  %t4111 = and i64 %t4110, -8
  %t4112 = inttoptr i64 %t4111 to ptr
  %t4113 = load i64, ptr %t4112
  %t4114 = inttoptr i64 %t4113 to ptr
  %t4115 = call fastcc i64%t4114(i64 %t4110, i64 1, i64 %t4108, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4116 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4116)
  %t4117 = and i64 %t4116, -8
  %t4118 = inttoptr i64 %t4117 to ptr
  %t4119 = load i64, ptr %t4118
  %t4120 = inttoptr i64 %t4119 to ptr
  %t4121 = call fastcc i64%t4120(i64 %t4116, i64 2, i64 %t4108, i64 %t4109, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4122 = call i64 @rt_intern(ptr @.str.sym.35)
  %t4123 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4123)
  %t4124 = and i64 %t4123, -8
  %t4125 = inttoptr i64 %t4124 to ptr
  %t4126 = load i64, ptr %t4125
  %t4127 = inttoptr i64 %t4126 to ptr
  %t4128 = call fastcc i64%t4127(i64 %t4123, i64 4, i64 %t4122, i64 %t4115, i64 %t4121, i64 %t4109, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4129 = or i64 %t4121, %t4115
  %t4130 = and i64 %t4129, 7
  %t4131 = icmp eq i64 %t4130, 0
  br i1 %t4131, label %fixfast925, label %fixslow926
fixfast925:
  %t4132 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4121, i64 %t4115)
  %t4133 = extractvalue {i64, i1} %t4132, 0
  %t4134 = extractvalue {i64, i1} %t4132, 1
  br i1 %t4134, label %fixslow926, label %fixmerge927
fixslow926:
  %t4135 = call i64 @rt_sub(i64 %t4121, i64 %t4115)
  br label %fixmerge927
fixmerge927:
  %t4136 = phi i64 [ %t4133, %fixfast925 ], [ %t4135, %fixslow926 ]
  %t4137 = call i64 @rt_make_vector(i64 %t4136, i64 0)
  %t4138 = call ptr @rt_alloc_words(i64 6)
  %t4139 = ptrtoint ptr %t4138 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_758" to i64), ptr %t4138
  %t4140 = or i64 %t4139, 4
  %t4141 = getelementptr i64, ptr %t4138, i64 1
  store i64 %t4121, ptr %t4141
  %t4142 = getelementptr i64, ptr %t4138, i64 2
  store i64 %t4137, ptr %t4142
  %t4143 = getelementptr i64, ptr %t4138, i64 3
  store i64 %t4115, ptr %t4143
  %t4144 = getelementptr i64, ptr %t4138, i64 4
  store i64 %a0, ptr %t4144
  %t4145 = getelementptr i64, ptr %t4138, i64 5
  store i64 %t4140, ptr %t4145
  %t4146 = musttail call fastcc i64 @"scheme.base:code_758"(i64 %t4140, i64 1, i64 %t4115, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4146
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4147 = call i64 @rt_vector_length(i64 %a0)
  %t4148 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4148)
  %t4149 = and i64 %t4148, -8
  %t4150 = inttoptr i64 %t4149 to ptr
  %t4151 = load i64, ptr %t4150
  %t4152 = inttoptr i64 %t4151 to ptr
  %t4153 = call fastcc i64%t4152(i64 %t4148, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4154 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4154)
  %t4155 = and i64 %t4154, -8
  %t4156 = inttoptr i64 %t4155 to ptr
  %t4157 = load i64, ptr %t4156
  %t4158 = inttoptr i64 %t4157 to ptr
  %t4159 = call fastcc i64%t4158(i64 %t4154, i64 2, i64 2, i64 %t4147, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4160 = call i64 @rt_intern(ptr @.str.sym.35)
  %t4161 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4161)
  %t4162 = and i64 %t4161, -8
  %t4163 = inttoptr i64 %t4162 to ptr
  %t4164 = load i64, ptr %t4163
  %t4165 = inttoptr i64 %t4164 to ptr
  %t4166 = call fastcc i64%t4165(i64 %t4161, i64 4, i64 %t4160, i64 %t4153, i64 %t4159, i64 %t4147, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4167 = or i64 %t4159, %t4153
  %t4168 = and i64 %t4167, 7
  %t4169 = icmp eq i64 %t4168, 0
  br i1 %t4169, label %fixfast928, label %fixslow929
fixfast928:
  %t4170 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4159, i64 %t4153)
  %t4171 = extractvalue {i64, i1} %t4170, 0
  %t4172 = extractvalue {i64, i1} %t4170, 1
  br i1 %t4172, label %fixslow929, label %fixmerge930
fixslow929:
  %t4173 = call i64 @rt_sub(i64 %t4159, i64 %t4153)
  br label %fixmerge930
fixmerge930:
  %t4174 = phi i64 [ %t4171, %fixfast928 ], [ %t4173, %fixslow929 ]
  %t4175 = call i64 @rt_make_vector(i64 %t4174, i64 0)
  %t4176 = call ptr @rt_alloc_words(i64 6)
  %t4177 = ptrtoint ptr %t4176 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_758" to i64), ptr %t4176
  %t4178 = or i64 %t4177, 4
  %t4179 = getelementptr i64, ptr %t4176, i64 1
  store i64 %t4159, ptr %t4179
  %t4180 = getelementptr i64, ptr %t4176, i64 2
  store i64 %t4175, ptr %t4180
  %t4181 = getelementptr i64, ptr %t4176, i64 3
  store i64 %t4153, ptr %t4181
  %t4182 = getelementptr i64, ptr %t4176, i64 4
  store i64 %a0, ptr %t4182
  %t4183 = getelementptr i64, ptr %t4176, i64 5
  store i64 %t4178, ptr %t4183
  %t4184 = musttail call fastcc i64 @"scheme.base:code_758"(i64 %t4178, i64 1, i64 %t4153, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4184
}

define fastcc i64 @"scheme.base:code_776"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4189 = icmp eq i64 %argc, 1
  br i1 %t4189, label %argok932, label %arityerr931
arityerr931:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok932:
  %t4190 = and i64 %self, -8
  %t4191 = inttoptr i64 %t4190 to ptr
  %t4192 = getelementptr i64, ptr %t4191, i64 1
  %t4193 = load i64, ptr %t4192
  %t4194 = or i64 %a0, %t4193
  %t4195 = and i64 %t4194, 7
  %t4196 = icmp eq i64 %t4195, 0
  br i1 %t4196, label %fixfast933, label %fixslow934
fixfast933:
  %t4197 = icmp eq i64 %a0, %t4193
  %t4198 = select i1 %t4197, i64 257, i64 1
  br label %fixmerge935
fixslow934:
  %t4199 = call i64 @rt_num_eq(i64 %a0, i64 %t4193)
  br label %fixmerge935
fixmerge935:
  %t4200 = phi i64 [ %t4198, %fixfast933 ], [ %t4199, %fixslow934 ]
  %t4201 = icmp ne i64 %t4200, 1
  br i1 %t4201, label %then936, label %else937
then936:
  %t4202 = and i64 %self, -8
  %t4203 = inttoptr i64 %t4202 to ptr
  %t4204 = getelementptr i64, ptr %t4203, i64 3
  %t4205 = load i64, ptr %t4204
  %t4206 = call i64 @rt_cdr(i64 %t4205)
  %t4207 = and i64 %self, -8
  %t4208 = inttoptr i64 %t4207 to ptr
  %t4209 = getelementptr i64, ptr %t4208, i64 4
  %t4210 = load i64, ptr %t4209
  %t4211 = and i64 %self, -8
  %t4212 = inttoptr i64 %t4211 to ptr
  %t4213 = getelementptr i64, ptr %t4212, i64 1
  %t4214 = load i64, ptr %t4213
  %t4215 = or i64 %t4210, %t4214
  %t4216 = and i64 %t4215, 7
  %t4217 = icmp eq i64 %t4216, 0
  br i1 %t4217, label %fixfast938, label %fixslow939
fixfast938:
  %t4218 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4210, i64 %t4214)
  %t4219 = extractvalue {i64, i1} %t4218, 0
  %t4220 = extractvalue {i64, i1} %t4218, 1
  br i1 %t4220, label %fixslow939, label %fixmerge940
fixslow939:
  %t4221 = call i64 @rt_add(i64 %t4210, i64 %t4214)
  br label %fixmerge940
fixmerge940:
  %t4222 = phi i64 [ %t4219, %fixfast938 ], [ %t4221, %fixslow939 ]
  %t4223 = and i64 %self, -8
  %t4224 = inttoptr i64 %t4223 to ptr
  %t4225 = getelementptr i64, ptr %t4224, i64 2
  %t4226 = load i64, ptr %t4225
  %t4227 = musttail call fastcc i64 @"scheme.base:code_774"(i64 %t4226, i64 2, i64 %t4206, i64 %t4222, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4227
else937:
  %t4228 = and i64 %self, -8
  %t4229 = inttoptr i64 %t4228 to ptr
  %t4230 = getelementptr i64, ptr %t4229, i64 5
  %t4231 = load i64, ptr %t4230
  %t4232 = and i64 %self, -8
  %t4233 = inttoptr i64 %t4232 to ptr
  %t4234 = getelementptr i64, ptr %t4233, i64 4
  %t4235 = load i64, ptr %t4234
  %t4236 = or i64 %t4235, %a0
  %t4237 = and i64 %t4236, 7
  %t4238 = icmp eq i64 %t4237, 0
  br i1 %t4238, label %fixfast941, label %fixslow942
fixfast941:
  %t4239 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4235, i64 %a0)
  %t4240 = extractvalue {i64, i1} %t4239, 0
  %t4241 = extractvalue {i64, i1} %t4239, 1
  br i1 %t4241, label %fixslow942, label %fixmerge943
fixslow942:
  %t4242 = call i64 @rt_add(i64 %t4235, i64 %a0)
  br label %fixmerge943
fixmerge943:
  %t4243 = phi i64 [ %t4240, %fixfast941 ], [ %t4242, %fixslow942 ]
  %t4244 = and i64 %self, -8
  %t4245 = inttoptr i64 %t4244 to ptr
  %t4246 = getelementptr i64, ptr %t4245, i64 6
  %t4247 = load i64, ptr %t4246
  %t4248 = call i64 @rt_vector_ref(i64 %t4247, i64 %a0)
  %t4249 = call i64 @rt_vector_set(i64 %t4231, i64 %t4243, i64 %t4248)
  %t4250 = or i64 %a0, 8
  %t4251 = and i64 %t4250, 7
  %t4252 = icmp eq i64 %t4251, 0
  br i1 %t4252, label %fixfast944, label %fixslow945
fixfast944:
  %t4253 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4254 = extractvalue {i64, i1} %t4253, 0
  %t4255 = extractvalue {i64, i1} %t4253, 1
  br i1 %t4255, label %fixslow945, label %fixmerge946
fixslow945:
  %t4256 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge946
fixmerge946:
  %t4257 = phi i64 [ %t4254, %fixfast944 ], [ %t4256, %fixslow945 ]
  %t4258 = musttail call fastcc i64 @"scheme.base:code_776"(i64 %self, i64 1, i64 %t4257, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4258
}

define fastcc i64 @"scheme.base:code_774"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4259 = icmp eq i64 %argc, 2
  br i1 %t4259, label %argok948, label %arityerr947
arityerr947:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok948:
  %t4260 = call i64 @rt_null_p(i64 %a0)
  %t4261 = icmp ne i64 %t4260, 1
  br i1 %t4261, label %then949, label %else950
then949:
  %t4262 = and i64 %self, -8
  %t4263 = inttoptr i64 %t4262 to ptr
  %t4264 = getelementptr i64, ptr %t4263, i64 1
  %t4265 = load i64, ptr %t4264
  ret i64 %t4265
else950:
  %t4266 = call i64 @rt_car(i64 %a0)
  %t4267 = call i64 @rt_vector_length(i64 %t4266)
  %t4268 = call ptr @rt_alloc_words(i64 8)
  %t4269 = ptrtoint ptr %t4268 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_776" to i64), ptr %t4268
  %t4270 = or i64 %t4269, 4
  %t4271 = getelementptr i64, ptr %t4268, i64 1
  store i64 %t4267, ptr %t4271
  %t4272 = and i64 %self, -8
  %t4273 = inttoptr i64 %t4272 to ptr
  %t4274 = getelementptr i64, ptr %t4273, i64 2
  %t4275 = load i64, ptr %t4274
  %t4276 = getelementptr i64, ptr %t4268, i64 2
  store i64 %t4275, ptr %t4276
  %t4277 = getelementptr i64, ptr %t4268, i64 3
  store i64 %a0, ptr %t4277
  %t4278 = getelementptr i64, ptr %t4268, i64 4
  store i64 %a1, ptr %t4278
  %t4279 = and i64 %self, -8
  %t4280 = inttoptr i64 %t4279 to ptr
  %t4281 = getelementptr i64, ptr %t4280, i64 1
  %t4282 = load i64, ptr %t4281
  %t4283 = getelementptr i64, ptr %t4268, i64 5
  store i64 %t4282, ptr %t4283
  %t4284 = getelementptr i64, ptr %t4268, i64 6
  store i64 %t4266, ptr %t4284
  %t4285 = getelementptr i64, ptr %t4268, i64 7
  store i64 %t4270, ptr %t4285
  %t4286 = musttail call fastcc i64 @"scheme.base:code_776"(i64 %t4270, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4286
}

define fastcc i64 @"scheme.base:code:vector-append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4287 = icmp sge i64 %argc, 0
  br i1 %t4287, label %argok952, label %arityerr951
arityerr951:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok952:
  %t4288 = call ptr @rt_alloc_words(i64 8)
  %t4289 = getelementptr i64, ptr %t4288, i64 0
  store i64 %a0, ptr %t4289
  %t4290 = getelementptr i64, ptr %t4288, i64 1
  store i64 %a1, ptr %t4290
  %t4291 = getelementptr i64, ptr %t4288, i64 2
  store i64 %a2, ptr %t4291
  %t4292 = getelementptr i64, ptr %t4288, i64 3
  store i64 %a3, ptr %t4292
  %t4293 = getelementptr i64, ptr %t4288, i64 4
  store i64 %a4, ptr %t4293
  %t4294 = getelementptr i64, ptr %t4288, i64 5
  store i64 %a5, ptr %t4294
  %t4295 = getelementptr i64, ptr %t4288, i64 6
  store i64 %a6, ptr %t4295
  %t4296 = getelementptr i64, ptr %t4288, i64 7
  store i64 %a7, ptr %t4296
  %t4297 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t4288, ptr %overflow)
  %t4298 = load i64, ptr @"scheme.base:vec-total"
  call void @rt_check_callable(i64 %t4298)
  %t4299 = and i64 %t4298, -8
  %t4300 = inttoptr i64 %t4299 to ptr
  %t4301 = load i64, ptr %t4300
  %t4302 = inttoptr i64 %t4301 to ptr
  %t4303 = call fastcc i64%t4302(i64 %t4298, i64 1, i64 %t4297, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4304 = call i64 @rt_make_vector(i64 %t4303, i64 0)
  %t4305 = call ptr @rt_alloc_words(i64 3)
  %t4306 = ptrtoint ptr %t4305 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_774" to i64), ptr %t4305
  %t4307 = or i64 %t4306, 4
  %t4308 = getelementptr i64, ptr %t4305, i64 1
  store i64 %t4304, ptr %t4308
  %t4309 = getelementptr i64, ptr %t4305, i64 2
  store i64 %t4307, ptr %t4309
  %t4310 = musttail call fastcc i64 @"scheme.base:code_774"(i64 %t4307, i64 2, i64 %t4297, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4310
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector-append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4311 = load i64, ptr @"scheme.base:vec-total"
  call void @rt_check_callable(i64 %t4311)
  %t4312 = and i64 %t4311, -8
  %t4313 = inttoptr i64 %t4312 to ptr
  %t4314 = load i64, ptr %t4313
  %t4315 = inttoptr i64 %t4314 to ptr
  %t4316 = call fastcc i64%t4315(i64 %t4311, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4317 = call i64 @rt_make_vector(i64 %t4316, i64 0)
  %t4318 = call ptr @rt_alloc_words(i64 3)
  %t4319 = ptrtoint ptr %t4318 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_774" to i64), ptr %t4318
  %t4320 = or i64 %t4319, 4
  %t4321 = getelementptr i64, ptr %t4318, i64 1
  store i64 %t4317, ptr %t4321
  %t4322 = getelementptr i64, ptr %t4318, i64 2
  store i64 %t4320, ptr %t4322
  %t4323 = musttail call fastcc i64 @"scheme.base:code_774"(i64 %t4320, i64 2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4323
}

define fastcc i64 @"scheme.base:code:vec-total"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4328 = icmp eq i64 %argc, 1
  br i1 %t4328, label %argok954, label %arityerr953
arityerr953:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok954:
  %t4329 = call i64 @rt_null_p(i64 %a0)
  %t4330 = icmp ne i64 %t4329, 1
  br i1 %t4330, label %then955, label %else956
then955:
  ret i64 0
else956:
  %t4331 = call i64 @rt_car(i64 %a0)
  %t4332 = call i64 @rt_vector_length(i64 %t4331)
  %t4333 = call i64 @rt_cdr(i64 %a0)
  %t4334 = load i64, ptr @"scheme.base:vec-total"
  call void @rt_check_callable(i64 %t4334)
  %t4335 = and i64 %t4334, -8
  %t4336 = inttoptr i64 %t4335 to ptr
  %t4337 = load i64, ptr %t4336
  %t4338 = inttoptr i64 %t4337 to ptr
  %t4339 = call fastcc i64%t4338(i64 %t4334, i64 1, i64 %t4333, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4340 = or i64 %t4332, %t4339
  %t4341 = and i64 %t4340, 7
  %t4342 = icmp eq i64 %t4341, 0
  br i1 %t4342, label %fixfast957, label %fixslow958
fixfast957:
  %t4343 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4332, i64 %t4339)
  %t4344 = extractvalue {i64, i1} %t4343, 0
  %t4345 = extractvalue {i64, i1} %t4343, 1
  br i1 %t4345, label %fixslow958, label %fixmerge959
fixslow958:
  %t4346 = call i64 @rt_add(i64 %t4332, i64 %t4339)
  br label %fixmerge959
fixmerge959:
  %t4347 = phi i64 [ %t4344, %fixfast957 ], [ %t4346, %fixslow958 ]
  ret i64 %t4347
}

define fastcc i64 @"scheme.base:code_793"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4352 = icmp eq i64 %argc, 1
  br i1 %t4352, label %argok961, label %arityerr960
arityerr960:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok961:
  %t4353 = and i64 %self, -8
  %t4354 = inttoptr i64 %t4353 to ptr
  %t4355 = getelementptr i64, ptr %t4354, i64 1
  %t4356 = load i64, ptr %t4355
  %t4357 = or i64 %a0, %t4356
  %t4358 = and i64 %t4357, 7
  %t4359 = icmp eq i64 %t4358, 0
  br i1 %t4359, label %fixfast962, label %fixslow963
fixfast962:
  %t4360 = icmp eq i64 %a0, %t4356
  %t4361 = select i1 %t4360, i64 257, i64 1
  br label %fixmerge964
fixslow963:
  %t4362 = call i64 @rt_num_eq(i64 %a0, i64 %t4356)
  br label %fixmerge964
fixmerge964:
  %t4363 = phi i64 [ %t4361, %fixfast962 ], [ %t4362, %fixslow963 ]
  %t4364 = icmp ne i64 %t4363, 1
  br i1 %t4364, label %then965, label %else966
then965:
  %t4365 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4365)
  %t4366 = and i64 %t4365, -8
  %t4367 = inttoptr i64 %t4366 to ptr
  %t4368 = load i64, ptr %t4367
  %t4369 = inttoptr i64 %t4368 to ptr
  %t4370 = musttail call fastcc i64 %t4369(i64 %t4365, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4370
else966:
  %t4371 = and i64 %self, -8
  %t4372 = inttoptr i64 %t4371 to ptr
  %t4373 = getelementptr i64, ptr %t4372, i64 2
  %t4374 = load i64, ptr %t4373
  %t4375 = and i64 %self, -8
  %t4376 = inttoptr i64 %t4375 to ptr
  %t4377 = getelementptr i64, ptr %t4376, i64 3
  %t4378 = load i64, ptr %t4377
  %t4379 = call i64 @rt_vector_set(i64 %t4374, i64 %a0, i64 %t4378)
  %t4380 = or i64 %a0, 8
  %t4381 = and i64 %t4380, 7
  %t4382 = icmp eq i64 %t4381, 0
  br i1 %t4382, label %fixfast967, label %fixslow968
fixfast967:
  %t4383 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4384 = extractvalue {i64, i1} %t4383, 0
  %t4385 = extractvalue {i64, i1} %t4383, 1
  br i1 %t4385, label %fixslow968, label %fixmerge969
fixslow968:
  %t4386 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge969
fixmerge969:
  %t4387 = phi i64 [ %t4384, %fixfast967 ], [ %t4386, %fixslow968 ]
  %t4388 = musttail call fastcc i64 @"scheme.base:code_793"(i64 %self, i64 1, i64 %t4387, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4388
}

define fastcc i64 @"scheme.base:code:vector-fill!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4389 = icmp sge i64 %argc, 2
  br i1 %t4389, label %argok971, label %arityerr970
arityerr970:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok971:
  %t4390 = call ptr @rt_alloc_words(i64 8)
  %t4391 = getelementptr i64, ptr %t4390, i64 0
  store i64 %a0, ptr %t4391
  %t4392 = getelementptr i64, ptr %t4390, i64 1
  store i64 %a1, ptr %t4392
  %t4393 = getelementptr i64, ptr %t4390, i64 2
  store i64 %a2, ptr %t4393
  %t4394 = getelementptr i64, ptr %t4390, i64 3
  store i64 %a3, ptr %t4394
  %t4395 = getelementptr i64, ptr %t4390, i64 4
  store i64 %a4, ptr %t4395
  %t4396 = getelementptr i64, ptr %t4390, i64 5
  store i64 %a5, ptr %t4396
  %t4397 = getelementptr i64, ptr %t4390, i64 6
  store i64 %a6, ptr %t4397
  %t4398 = getelementptr i64, ptr %t4390, i64 7
  store i64 %a7, ptr %t4398
  %t4399 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t4390, ptr %overflow)
  %t4400 = call i64 @rt_vector_length(i64 %a0)
  %t4401 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4401)
  %t4402 = and i64 %t4401, -8
  %t4403 = inttoptr i64 %t4402 to ptr
  %t4404 = load i64, ptr %t4403
  %t4405 = inttoptr i64 %t4404 to ptr
  %t4406 = call fastcc i64%t4405(i64 %t4401, i64 1, i64 %t4399, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4407 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4407)
  %t4408 = and i64 %t4407, -8
  %t4409 = inttoptr i64 %t4408 to ptr
  %t4410 = load i64, ptr %t4409
  %t4411 = inttoptr i64 %t4410 to ptr
  %t4412 = call fastcc i64%t4411(i64 %t4407, i64 2, i64 %t4399, i64 %t4400, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4413 = call i64 @rt_intern(ptr @.str.sym.36)
  %t4414 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4414)
  %t4415 = and i64 %t4414, -8
  %t4416 = inttoptr i64 %t4415 to ptr
  %t4417 = load i64, ptr %t4416
  %t4418 = inttoptr i64 %t4417 to ptr
  %t4419 = call fastcc i64%t4418(i64 %t4414, i64 4, i64 %t4413, i64 %t4406, i64 %t4412, i64 %t4400, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4420 = call ptr @rt_alloc_words(i64 5)
  %t4421 = ptrtoint ptr %t4420 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_793" to i64), ptr %t4420
  %t4422 = or i64 %t4421, 4
  %t4423 = getelementptr i64, ptr %t4420, i64 1
  store i64 %t4412, ptr %t4423
  %t4424 = getelementptr i64, ptr %t4420, i64 2
  store i64 %a0, ptr %t4424
  %t4425 = getelementptr i64, ptr %t4420, i64 3
  store i64 %a1, ptr %t4425
  %t4426 = getelementptr i64, ptr %t4420, i64 4
  store i64 %t4422, ptr %t4426
  %t4427 = musttail call fastcc i64 @"scheme.base:code_793"(i64 %t4422, i64 1, i64 %t4406, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4427
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector-fill!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4428 = call i64 @rt_vector_length(i64 %a0)
  %t4429 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4429)
  %t4430 = and i64 %t4429, -8
  %t4431 = inttoptr i64 %t4430 to ptr
  %t4432 = load i64, ptr %t4431
  %t4433 = inttoptr i64 %t4432 to ptr
  %t4434 = call fastcc i64%t4433(i64 %t4429, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4435 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4435)
  %t4436 = and i64 %t4435, -8
  %t4437 = inttoptr i64 %t4436 to ptr
  %t4438 = load i64, ptr %t4437
  %t4439 = inttoptr i64 %t4438 to ptr
  %t4440 = call fastcc i64%t4439(i64 %t4435, i64 2, i64 2, i64 %t4428, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4441 = call i64 @rt_intern(ptr @.str.sym.36)
  %t4442 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4442)
  %t4443 = and i64 %t4442, -8
  %t4444 = inttoptr i64 %t4443 to ptr
  %t4445 = load i64, ptr %t4444
  %t4446 = inttoptr i64 %t4445 to ptr
  %t4447 = call fastcc i64%t4446(i64 %t4442, i64 4, i64 %t4441, i64 %t4434, i64 %t4440, i64 %t4428, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4448 = call ptr @rt_alloc_words(i64 5)
  %t4449 = ptrtoint ptr %t4448 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_793" to i64), ptr %t4448
  %t4450 = or i64 %t4449, 4
  %t4451 = getelementptr i64, ptr %t4448, i64 1
  store i64 %t4440, ptr %t4451
  %t4452 = getelementptr i64, ptr %t4448, i64 2
  store i64 %a0, ptr %t4452
  %t4453 = getelementptr i64, ptr %t4448, i64 3
  store i64 %a1, ptr %t4453
  %t4454 = getelementptr i64, ptr %t4448, i64 4
  store i64 %t4450, ptr %t4454
  %t4455 = musttail call fastcc i64 @"scheme.base:code_793"(i64 %t4450, i64 1, i64 %t4434, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4455
}

define fastcc i64 @"scheme.base:code_819"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4460 = icmp eq i64 %argc, 1
  br i1 %t4460, label %argok973, label %arityerr972
arityerr972:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok973:
  %t4461 = or i64 %a0, 0
  %t4462 = and i64 %t4461, 7
  %t4463 = icmp eq i64 %t4462, 0
  br i1 %t4463, label %fixfast974, label %fixslow975
fixfast974:
  %t4464 = icmp slt i64 %a0, 0
  %t4465 = select i1 %t4464, i64 257, i64 1
  br label %fixmerge976
fixslow975:
  %t4466 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge976
fixmerge976:
  %t4467 = phi i64 [ %t4465, %fixfast974 ], [ %t4466, %fixslow975 ]
  %t4468 = icmp ne i64 %t4467, 1
  br i1 %t4468, label %then977, label %else978
then977:
  %t4469 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4469)
  %t4470 = and i64 %t4469, -8
  %t4471 = inttoptr i64 %t4470 to ptr
  %t4472 = load i64, ptr %t4471
  %t4473 = inttoptr i64 %t4472 to ptr
  %t4474 = musttail call fastcc i64 %t4473(i64 %t4469, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4474
else978:
  %t4475 = and i64 %self, -8
  %t4476 = inttoptr i64 %t4475 to ptr
  %t4477 = getelementptr i64, ptr %t4476, i64 1
  %t4478 = load i64, ptr %t4477
  %t4479 = and i64 %self, -8
  %t4480 = inttoptr i64 %t4479 to ptr
  %t4481 = getelementptr i64, ptr %t4480, i64 2
  %t4482 = load i64, ptr %t4481
  %t4483 = or i64 %t4482, %a0
  %t4484 = and i64 %t4483, 7
  %t4485 = icmp eq i64 %t4484, 0
  br i1 %t4485, label %fixfast979, label %fixslow980
fixfast979:
  %t4486 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4482, i64 %a0)
  %t4487 = extractvalue {i64, i1} %t4486, 0
  %t4488 = extractvalue {i64, i1} %t4486, 1
  br i1 %t4488, label %fixslow980, label %fixmerge981
fixslow980:
  %t4489 = call i64 @rt_add(i64 %t4482, i64 %a0)
  br label %fixmerge981
fixmerge981:
  %t4490 = phi i64 [ %t4487, %fixfast979 ], [ %t4489, %fixslow980 ]
  %t4491 = and i64 %self, -8
  %t4492 = inttoptr i64 %t4491 to ptr
  %t4493 = getelementptr i64, ptr %t4492, i64 3
  %t4494 = load i64, ptr %t4493
  %t4495 = and i64 %self, -8
  %t4496 = inttoptr i64 %t4495 to ptr
  %t4497 = getelementptr i64, ptr %t4496, i64 4
  %t4498 = load i64, ptr %t4497
  %t4499 = or i64 %t4498, %a0
  %t4500 = and i64 %t4499, 7
  %t4501 = icmp eq i64 %t4500, 0
  br i1 %t4501, label %fixfast982, label %fixslow983
fixfast982:
  %t4502 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4498, i64 %a0)
  %t4503 = extractvalue {i64, i1} %t4502, 0
  %t4504 = extractvalue {i64, i1} %t4502, 1
  br i1 %t4504, label %fixslow983, label %fixmerge984
fixslow983:
  %t4505 = call i64 @rt_add(i64 %t4498, i64 %a0)
  br label %fixmerge984
fixmerge984:
  %t4506 = phi i64 [ %t4503, %fixfast982 ], [ %t4505, %fixslow983 ]
  %t4507 = call i64 @rt_vector_ref(i64 %t4494, i64 %t4506)
  %t4508 = call i64 @rt_vector_set(i64 %t4478, i64 %t4490, i64 %t4507)
  %t4509 = or i64 %a0, 8
  %t4510 = and i64 %t4509, 7
  %t4511 = icmp eq i64 %t4510, 0
  br i1 %t4511, label %fixfast985, label %fixslow986
fixfast985:
  %t4512 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t4513 = extractvalue {i64, i1} %t4512, 0
  %t4514 = extractvalue {i64, i1} %t4512, 1
  br i1 %t4514, label %fixslow986, label %fixmerge987
fixslow986:
  %t4515 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge987
fixmerge987:
  %t4516 = phi i64 [ %t4513, %fixfast985 ], [ %t4515, %fixslow986 ]
  %t4517 = musttail call fastcc i64 @"scheme.base:code_819"(i64 %self, i64 1, i64 %t4516, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4517
}

define fastcc i64 @"scheme.base:code_821"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4518 = icmp eq i64 %argc, 1
  br i1 %t4518, label %argok989, label %arityerr988
arityerr988:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok989:
  %t4519 = and i64 %self, -8
  %t4520 = inttoptr i64 %t4519 to ptr
  %t4521 = getelementptr i64, ptr %t4520, i64 1
  %t4522 = load i64, ptr %t4521
  %t4523 = and i64 %self, -8
  %t4524 = inttoptr i64 %t4523 to ptr
  %t4525 = getelementptr i64, ptr %t4524, i64 2
  %t4526 = load i64, ptr %t4525
  %t4527 = or i64 %t4522, %t4526
  %t4528 = and i64 %t4527, 7
  %t4529 = icmp eq i64 %t4528, 0
  br i1 %t4529, label %fixfast990, label %fixslow991
fixfast990:
  %t4530 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4522, i64 %t4526)
  %t4531 = extractvalue {i64, i1} %t4530, 0
  %t4532 = extractvalue {i64, i1} %t4530, 1
  br i1 %t4532, label %fixslow991, label %fixmerge992
fixslow991:
  %t4533 = call i64 @rt_sub(i64 %t4522, i64 %t4526)
  br label %fixmerge992
fixmerge992:
  %t4534 = phi i64 [ %t4531, %fixfast990 ], [ %t4533, %fixslow991 ]
  %t4535 = or i64 %a0, %t4534
  %t4536 = and i64 %t4535, 7
  %t4537 = icmp eq i64 %t4536, 0
  br i1 %t4537, label %fixfast993, label %fixslow994
fixfast993:
  %t4538 = icmp eq i64 %a0, %t4534
  %t4539 = select i1 %t4538, i64 257, i64 1
  br label %fixmerge995
fixslow994:
  %t4540 = call i64 @rt_num_eq(i64 %a0, i64 %t4534)
  br label %fixmerge995
fixmerge995:
  %t4541 = phi i64 [ %t4539, %fixfast993 ], [ %t4540, %fixslow994 ]
  %t4542 = icmp ne i64 %t4541, 1
  br i1 %t4542, label %then996, label %else997
then996:
  %t4543 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4543)
  %t4544 = and i64 %t4543, -8
  %t4545 = inttoptr i64 %t4544 to ptr
  %t4546 = load i64, ptr %t4545
  %t4547 = inttoptr i64 %t4546 to ptr
  %t4548 = musttail call fastcc i64 %t4547(i64 %t4543, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4548
else997:
  %t4549 = and i64 %self, -8
  %t4550 = inttoptr i64 %t4549 to ptr
  %t4551 = getelementptr i64, ptr %t4550, i64 3
  %t4552 = load i64, ptr %t4551
  %t4553 = and i64 %self, -8
  %t4554 = inttoptr i64 %t4553 to ptr
  %t4555 = getelementptr i64, ptr %t4554, i64 4
  %t4556 = load i64, ptr %t4555
  %t4557 = or i64 %t4556, %a0
  %t4558 = and i64 %t4557, 7
  %t4559 = icmp eq i64 %t4558, 0
  br i1 %t4559, label %fixfast998, label %fixslow999
fixfast998:
  %t4560 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4556, i64 %a0)
  %t4561 = extractvalue {i64, i1} %t4560, 0
  %t4562 = extractvalue {i64, i1} %t4560, 1
  br i1 %t4562, label %fixslow999, label %fixmerge1000
fixslow999:
  %t4563 = call i64 @rt_add(i64 %t4556, i64 %a0)
  br label %fixmerge1000
fixmerge1000:
  %t4564 = phi i64 [ %t4561, %fixfast998 ], [ %t4563, %fixslow999 ]
  %t4565 = and i64 %self, -8
  %t4566 = inttoptr i64 %t4565 to ptr
  %t4567 = getelementptr i64, ptr %t4566, i64 5
  %t4568 = load i64, ptr %t4567
  %t4569 = and i64 %self, -8
  %t4570 = inttoptr i64 %t4569 to ptr
  %t4571 = getelementptr i64, ptr %t4570, i64 2
  %t4572 = load i64, ptr %t4571
  %t4573 = or i64 %t4572, %a0
  %t4574 = and i64 %t4573, 7
  %t4575 = icmp eq i64 %t4574, 0
  br i1 %t4575, label %fixfast1001, label %fixslow1002
fixfast1001:
  %t4576 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t4572, i64 %a0)
  %t4577 = extractvalue {i64, i1} %t4576, 0
  %t4578 = extractvalue {i64, i1} %t4576, 1
  br i1 %t4578, label %fixslow1002, label %fixmerge1003
fixslow1002:
  %t4579 = call i64 @rt_add(i64 %t4572, i64 %a0)
  br label %fixmerge1003
fixmerge1003:
  %t4580 = phi i64 [ %t4577, %fixfast1001 ], [ %t4579, %fixslow1002 ]
  %t4581 = call i64 @rt_vector_ref(i64 %t4568, i64 %t4580)
  %t4582 = call i64 @rt_vector_set(i64 %t4552, i64 %t4564, i64 %t4581)
  %t4583 = or i64 %a0, 8
  %t4584 = and i64 %t4583, 7
  %t4585 = icmp eq i64 %t4584, 0
  br i1 %t4585, label %fixfast1004, label %fixslow1005
fixfast1004:
  %t4586 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4587 = extractvalue {i64, i1} %t4586, 0
  %t4588 = extractvalue {i64, i1} %t4586, 1
  br i1 %t4588, label %fixslow1005, label %fixmerge1006
fixslow1005:
  %t4589 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1006
fixmerge1006:
  %t4590 = phi i64 [ %t4587, %fixfast1004 ], [ %t4589, %fixslow1005 ]
  %t4591 = musttail call fastcc i64 @"scheme.base:code_821"(i64 %self, i64 1, i64 %t4590, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4591
}

define fastcc i64 @"scheme.base:code:vector-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4592 = icmp sge i64 %argc, 3
  br i1 %t4592, label %argok1008, label %arityerr1007
arityerr1007:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1008:
  %t4593 = call ptr @rt_alloc_words(i64 8)
  %t4594 = getelementptr i64, ptr %t4593, i64 0
  store i64 %a0, ptr %t4594
  %t4595 = getelementptr i64, ptr %t4593, i64 1
  store i64 %a1, ptr %t4595
  %t4596 = getelementptr i64, ptr %t4593, i64 2
  store i64 %a2, ptr %t4596
  %t4597 = getelementptr i64, ptr %t4593, i64 3
  store i64 %a3, ptr %t4597
  %t4598 = getelementptr i64, ptr %t4593, i64 4
  store i64 %a4, ptr %t4598
  %t4599 = getelementptr i64, ptr %t4593, i64 5
  store i64 %a5, ptr %t4599
  %t4600 = getelementptr i64, ptr %t4593, i64 6
  store i64 %a6, ptr %t4600
  %t4601 = getelementptr i64, ptr %t4593, i64 7
  store i64 %a7, ptr %t4601
  %t4602 = call i64 @rt_build_rest(i64 %argc, i64 3, i64 8, ptr %t4593, ptr %overflow)
  %t4603 = call i64 @rt_vector_length(i64 %a2)
  %t4604 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4604)
  %t4605 = and i64 %t4604, -8
  %t4606 = inttoptr i64 %t4605 to ptr
  %t4607 = load i64, ptr %t4606
  %t4608 = inttoptr i64 %t4607 to ptr
  %t4609 = call fastcc i64%t4608(i64 %t4604, i64 1, i64 %t4602, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4610 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4610)
  %t4611 = and i64 %t4610, -8
  %t4612 = inttoptr i64 %t4611 to ptr
  %t4613 = load i64, ptr %t4612
  %t4614 = inttoptr i64 %t4613 to ptr
  %t4615 = call fastcc i64%t4614(i64 %t4610, i64 2, i64 %t4602, i64 %t4603, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4616 = call i64 @rt_intern(ptr @.str.sym.37)
  %t4617 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4617)
  %t4618 = and i64 %t4617, -8
  %t4619 = inttoptr i64 %t4618 to ptr
  %t4620 = load i64, ptr %t4619
  %t4621 = inttoptr i64 %t4620 to ptr
  %t4622 = call fastcc i64%t4621(i64 %t4617, i64 4, i64 %t4616, i64 %t4609, i64 %t4615, i64 %t4603, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4623 = call i64 @rt_intern(ptr @.str.sym.37)
  %t4624 = or i64 %t4615, %t4609
  %t4625 = and i64 %t4624, 7
  %t4626 = icmp eq i64 %t4625, 0
  br i1 %t4626, label %fixfast1009, label %fixslow1010
fixfast1009:
  %t4627 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4615, i64 %t4609)
  %t4628 = extractvalue {i64, i1} %t4627, 0
  %t4629 = extractvalue {i64, i1} %t4627, 1
  br i1 %t4629, label %fixslow1010, label %fixmerge1011
fixslow1010:
  %t4630 = call i64 @rt_sub(i64 %t4615, i64 %t4609)
  br label %fixmerge1011
fixmerge1011:
  %t4631 = phi i64 [ %t4628, %fixfast1009 ], [ %t4630, %fixslow1010 ]
  %t4632 = or i64 %a1, %t4631
  %t4633 = and i64 %t4632, 7
  %t4634 = icmp eq i64 %t4633, 0
  br i1 %t4634, label %fixfast1012, label %fixslow1013
fixfast1012:
  %t4635 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t4631)
  %t4636 = extractvalue {i64, i1} %t4635, 0
  %t4637 = extractvalue {i64, i1} %t4635, 1
  br i1 %t4637, label %fixslow1013, label %fixmerge1014
fixslow1013:
  %t4638 = call i64 @rt_add(i64 %a1, i64 %t4631)
  br label %fixmerge1014
fixmerge1014:
  %t4639 = phi i64 [ %t4636, %fixfast1012 ], [ %t4638, %fixslow1013 ]
  %t4640 = call i64 @rt_vector_length(i64 %a0)
  %t4641 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4641)
  %t4642 = and i64 %t4641, -8
  %t4643 = inttoptr i64 %t4642 to ptr
  %t4644 = load i64, ptr %t4643
  %t4645 = inttoptr i64 %t4644 to ptr
  %t4646 = call fastcc i64%t4645(i64 %t4641, i64 4, i64 %t4623, i64 %a1, i64 %t4639, i64 %t4640, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4647 = or i64 %t4609, %a1
  %t4648 = and i64 %t4647, 7
  %t4649 = icmp eq i64 %t4648, 0
  br i1 %t4649, label %fixfast1015, label %fixslow1016
fixfast1015:
  %t4650 = icmp slt i64 %t4609, %a1
  %t4651 = select i1 %t4650, i64 257, i64 1
  br label %fixmerge1017
fixslow1016:
  %t4652 = call i64 @rt_lt(i64 %t4609, i64 %a1)
  br label %fixmerge1017
fixmerge1017:
  %t4653 = phi i64 [ %t4651, %fixfast1015 ], [ %t4652, %fixslow1016 ]
  %t4654 = icmp ne i64 %t4653, 1
  br i1 %t4654, label %then1018, label %else1019
then1018:
  %t4655 = call ptr @rt_alloc_words(i64 6)
  %t4656 = ptrtoint ptr %t4655 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_819" to i64), ptr %t4655
  %t4657 = or i64 %t4656, 4
  %t4658 = getelementptr i64, ptr %t4655, i64 1
  store i64 %a0, ptr %t4658
  %t4659 = getelementptr i64, ptr %t4655, i64 2
  store i64 %a1, ptr %t4659
  %t4660 = getelementptr i64, ptr %t4655, i64 3
  store i64 %a2, ptr %t4660
  %t4661 = getelementptr i64, ptr %t4655, i64 4
  store i64 %t4609, ptr %t4661
  %t4662 = getelementptr i64, ptr %t4655, i64 5
  store i64 %t4657, ptr %t4662
  %t4663 = or i64 %t4615, %t4609
  %t4664 = and i64 %t4663, 7
  %t4665 = icmp eq i64 %t4664, 0
  br i1 %t4665, label %fixfast1020, label %fixslow1021
fixfast1020:
  %t4666 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4615, i64 %t4609)
  %t4667 = extractvalue {i64, i1} %t4666, 0
  %t4668 = extractvalue {i64, i1} %t4666, 1
  br i1 %t4668, label %fixslow1021, label %fixmerge1022
fixslow1021:
  %t4669 = call i64 @rt_sub(i64 %t4615, i64 %t4609)
  br label %fixmerge1022
fixmerge1022:
  %t4670 = phi i64 [ %t4667, %fixfast1020 ], [ %t4669, %fixslow1021 ]
  %t4671 = or i64 %t4670, 8
  %t4672 = and i64 %t4671, 7
  %t4673 = icmp eq i64 %t4672, 0
  br i1 %t4673, label %fixfast1023, label %fixslow1024
fixfast1023:
  %t4674 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4670, i64 8)
  %t4675 = extractvalue {i64, i1} %t4674, 0
  %t4676 = extractvalue {i64, i1} %t4674, 1
  br i1 %t4676, label %fixslow1024, label %fixmerge1025
fixslow1024:
  %t4677 = call i64 @rt_sub(i64 %t4670, i64 8)
  br label %fixmerge1025
fixmerge1025:
  %t4678 = phi i64 [ %t4675, %fixfast1023 ], [ %t4677, %fixslow1024 ]
  %t4679 = musttail call fastcc i64 @"scheme.base:code_819"(i64 %t4657, i64 1, i64 %t4678, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4679
else1019:
  %t4680 = call ptr @rt_alloc_words(i64 7)
  %t4681 = ptrtoint ptr %t4680 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_821" to i64), ptr %t4680
  %t4682 = or i64 %t4681, 4
  %t4683 = getelementptr i64, ptr %t4680, i64 1
  store i64 %t4615, ptr %t4683
  %t4684 = getelementptr i64, ptr %t4680, i64 2
  store i64 %t4609, ptr %t4684
  %t4685 = getelementptr i64, ptr %t4680, i64 3
  store i64 %a0, ptr %t4685
  %t4686 = getelementptr i64, ptr %t4680, i64 4
  store i64 %a1, ptr %t4686
  %t4687 = getelementptr i64, ptr %t4680, i64 5
  store i64 %a2, ptr %t4687
  %t4688 = getelementptr i64, ptr %t4680, i64 6
  store i64 %t4682, ptr %t4688
  %t4689 = musttail call fastcc i64 @"scheme.base:code_821"(i64 %t4682, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4689
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4690 = call i64 @rt_vector_length(i64 %a2)
  %t4691 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t4691)
  %t4692 = and i64 %t4691, -8
  %t4693 = inttoptr i64 %t4692 to ptr
  %t4694 = load i64, ptr %t4693
  %t4695 = inttoptr i64 %t4694 to ptr
  %t4696 = call fastcc i64%t4695(i64 %t4691, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4697 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t4697)
  %t4698 = and i64 %t4697, -8
  %t4699 = inttoptr i64 %t4698 to ptr
  %t4700 = load i64, ptr %t4699
  %t4701 = inttoptr i64 %t4700 to ptr
  %t4702 = call fastcc i64%t4701(i64 %t4697, i64 2, i64 2, i64 %t4690, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4703 = call i64 @rt_intern(ptr @.str.sym.37)
  %t4704 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4704)
  %t4705 = and i64 %t4704, -8
  %t4706 = inttoptr i64 %t4705 to ptr
  %t4707 = load i64, ptr %t4706
  %t4708 = inttoptr i64 %t4707 to ptr
  %t4709 = call fastcc i64%t4708(i64 %t4704, i64 4, i64 %t4703, i64 %t4696, i64 %t4702, i64 %t4690, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4710 = call i64 @rt_intern(ptr @.str.sym.37)
  %t4711 = or i64 %t4702, %t4696
  %t4712 = and i64 %t4711, 7
  %t4713 = icmp eq i64 %t4712, 0
  br i1 %t4713, label %fixfast1026, label %fixslow1027
fixfast1026:
  %t4714 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4702, i64 %t4696)
  %t4715 = extractvalue {i64, i1} %t4714, 0
  %t4716 = extractvalue {i64, i1} %t4714, 1
  br i1 %t4716, label %fixslow1027, label %fixmerge1028
fixslow1027:
  %t4717 = call i64 @rt_sub(i64 %t4702, i64 %t4696)
  br label %fixmerge1028
fixmerge1028:
  %t4718 = phi i64 [ %t4715, %fixfast1026 ], [ %t4717, %fixslow1027 ]
  %t4719 = or i64 %a1, %t4718
  %t4720 = and i64 %t4719, 7
  %t4721 = icmp eq i64 %t4720, 0
  br i1 %t4721, label %fixfast1029, label %fixslow1030
fixfast1029:
  %t4722 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t4718)
  %t4723 = extractvalue {i64, i1} %t4722, 0
  %t4724 = extractvalue {i64, i1} %t4722, 1
  br i1 %t4724, label %fixslow1030, label %fixmerge1031
fixslow1030:
  %t4725 = call i64 @rt_add(i64 %a1, i64 %t4718)
  br label %fixmerge1031
fixmerge1031:
  %t4726 = phi i64 [ %t4723, %fixfast1029 ], [ %t4725, %fixslow1030 ]
  %t4727 = call i64 @rt_vector_length(i64 %a0)
  %t4728 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t4728)
  %t4729 = and i64 %t4728, -8
  %t4730 = inttoptr i64 %t4729 to ptr
  %t4731 = load i64, ptr %t4730
  %t4732 = inttoptr i64 %t4731 to ptr
  %t4733 = call fastcc i64%t4732(i64 %t4728, i64 4, i64 %t4710, i64 %a1, i64 %t4726, i64 %t4727, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4734 = or i64 %t4696, %a1
  %t4735 = and i64 %t4734, 7
  %t4736 = icmp eq i64 %t4735, 0
  br i1 %t4736, label %fixfast1032, label %fixslow1033
fixfast1032:
  %t4737 = icmp slt i64 %t4696, %a1
  %t4738 = select i1 %t4737, i64 257, i64 1
  br label %fixmerge1034
fixslow1033:
  %t4739 = call i64 @rt_lt(i64 %t4696, i64 %a1)
  br label %fixmerge1034
fixmerge1034:
  %t4740 = phi i64 [ %t4738, %fixfast1032 ], [ %t4739, %fixslow1033 ]
  %t4741 = icmp ne i64 %t4740, 1
  br i1 %t4741, label %then1035, label %else1036
then1035:
  %t4742 = call ptr @rt_alloc_words(i64 6)
  %t4743 = ptrtoint ptr %t4742 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_819" to i64), ptr %t4742
  %t4744 = or i64 %t4743, 4
  %t4745 = getelementptr i64, ptr %t4742, i64 1
  store i64 %a0, ptr %t4745
  %t4746 = getelementptr i64, ptr %t4742, i64 2
  store i64 %a1, ptr %t4746
  %t4747 = getelementptr i64, ptr %t4742, i64 3
  store i64 %a2, ptr %t4747
  %t4748 = getelementptr i64, ptr %t4742, i64 4
  store i64 %t4696, ptr %t4748
  %t4749 = getelementptr i64, ptr %t4742, i64 5
  store i64 %t4744, ptr %t4749
  %t4750 = or i64 %t4702, %t4696
  %t4751 = and i64 %t4750, 7
  %t4752 = icmp eq i64 %t4751, 0
  br i1 %t4752, label %fixfast1037, label %fixslow1038
fixfast1037:
  %t4753 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4702, i64 %t4696)
  %t4754 = extractvalue {i64, i1} %t4753, 0
  %t4755 = extractvalue {i64, i1} %t4753, 1
  br i1 %t4755, label %fixslow1038, label %fixmerge1039
fixslow1038:
  %t4756 = call i64 @rt_sub(i64 %t4702, i64 %t4696)
  br label %fixmerge1039
fixmerge1039:
  %t4757 = phi i64 [ %t4754, %fixfast1037 ], [ %t4756, %fixslow1038 ]
  %t4758 = or i64 %t4757, 8
  %t4759 = and i64 %t4758, 7
  %t4760 = icmp eq i64 %t4759, 0
  br i1 %t4760, label %fixfast1040, label %fixslow1041
fixfast1040:
  %t4761 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t4757, i64 8)
  %t4762 = extractvalue {i64, i1} %t4761, 0
  %t4763 = extractvalue {i64, i1} %t4761, 1
  br i1 %t4763, label %fixslow1041, label %fixmerge1042
fixslow1041:
  %t4764 = call i64 @rt_sub(i64 %t4757, i64 8)
  br label %fixmerge1042
fixmerge1042:
  %t4765 = phi i64 [ %t4762, %fixfast1040 ], [ %t4764, %fixslow1041 ]
  %t4766 = musttail call fastcc i64 @"scheme.base:code_819"(i64 %t4744, i64 1, i64 %t4765, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4766
else1036:
  %t4767 = call ptr @rt_alloc_words(i64 7)
  %t4768 = ptrtoint ptr %t4767 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_821" to i64), ptr %t4767
  %t4769 = or i64 %t4768, 4
  %t4770 = getelementptr i64, ptr %t4767, i64 1
  store i64 %t4702, ptr %t4770
  %t4771 = getelementptr i64, ptr %t4767, i64 2
  store i64 %t4696, ptr %t4771
  %t4772 = getelementptr i64, ptr %t4767, i64 3
  store i64 %a0, ptr %t4772
  %t4773 = getelementptr i64, ptr %t4767, i64 4
  store i64 %a1, ptr %t4773
  %t4774 = getelementptr i64, ptr %t4767, i64 5
  store i64 %a2, ptr %t4774
  %t4775 = getelementptr i64, ptr %t4767, i64 6
  store i64 %t4769, ptr %t4775
  %t4776 = musttail call fastcc i64 @"scheme.base:code_821"(i64 %t4769, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4776
}

define fastcc i64 @"scheme.base:code_844"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4781 = icmp eq i64 %argc, 1
  br i1 %t4781, label %argok1044, label %arityerr1043
arityerr1043:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1044:
  %t4782 = and i64 %self, -8
  %t4783 = inttoptr i64 %t4782 to ptr
  %t4784 = getelementptr i64, ptr %t4783, i64 1
  %t4785 = load i64, ptr %t4784
  %t4786 = or i64 %a0, %t4785
  %t4787 = and i64 %t4786, 7
  %t4788 = icmp eq i64 %t4787, 0
  br i1 %t4788, label %fixfast1045, label %fixslow1046
fixfast1045:
  %t4789 = icmp eq i64 %a0, %t4785
  %t4790 = select i1 %t4789, i64 257, i64 1
  br label %fixmerge1047
fixslow1046:
  %t4791 = call i64 @rt_num_eq(i64 %a0, i64 %t4785)
  br label %fixmerge1047
fixmerge1047:
  %t4792 = phi i64 [ %t4790, %fixfast1045 ], [ %t4791, %fixslow1046 ]
  %t4793 = icmp ne i64 %t4792, 1
  br i1 %t4793, label %then1048, label %else1049
then1048:
  %t4794 = and i64 %self, -8
  %t4795 = inttoptr i64 %t4794 to ptr
  %t4796 = getelementptr i64, ptr %t4795, i64 2
  %t4797 = load i64, ptr %t4796
  ret i64 %t4797
else1049:
  %t4798 = and i64 %self, -8
  %t4799 = inttoptr i64 %t4798 to ptr
  %t4800 = getelementptr i64, ptr %t4799, i64 2
  %t4801 = load i64, ptr %t4800
  %t4802 = and i64 %self, -8
  %t4803 = inttoptr i64 %t4802 to ptr
  %t4804 = getelementptr i64, ptr %t4803, i64 4
  %t4805 = load i64, ptr %t4804
  %t4806 = call i64 @rt_vector_ref(i64 %t4805, i64 %a0)
  %t4807 = and i64 %self, -8
  %t4808 = inttoptr i64 %t4807 to ptr
  %t4809 = getelementptr i64, ptr %t4808, i64 3
  %t4810 = load i64, ptr %t4809
  call void @rt_check_callable(i64 %t4810)
  %t4811 = and i64 %t4810, -8
  %t4812 = inttoptr i64 %t4811 to ptr
  %t4813 = load i64, ptr %t4812
  %t4814 = inttoptr i64 %t4813 to ptr
  %t4815 = call fastcc i64%t4814(i64 %t4810, i64 1, i64 %t4806, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4816 = call i64 @rt_vector_set(i64 %t4801, i64 %a0, i64 %t4815)
  %t4817 = or i64 %a0, 8
  %t4818 = and i64 %t4817, 7
  %t4819 = icmp eq i64 %t4818, 0
  br i1 %t4819, label %fixfast1050, label %fixslow1051
fixfast1050:
  %t4820 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4821 = extractvalue {i64, i1} %t4820, 0
  %t4822 = extractvalue {i64, i1} %t4820, 1
  br i1 %t4822, label %fixslow1051, label %fixmerge1052
fixslow1051:
  %t4823 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1052
fixmerge1052:
  %t4824 = phi i64 [ %t4821, %fixfast1050 ], [ %t4823, %fixslow1051 ]
  %t4825 = musttail call fastcc i64 @"scheme.base:code_844"(i64 %self, i64 1, i64 %t4824, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4825
}

define fastcc i64 @"scheme.base:code_846"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4826 = icmp eq i64 %argc, 1
  br i1 %t4826, label %argok1054, label %arityerr1053
arityerr1053:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1054:
  %t4827 = and i64 %self, -8
  %t4828 = inttoptr i64 %t4827 to ptr
  %t4829 = getelementptr i64, ptr %t4828, i64 1
  %t4830 = load i64, ptr %t4829
  %t4831 = or i64 %a0, %t4830
  %t4832 = and i64 %t4831, 7
  %t4833 = icmp eq i64 %t4832, 0
  br i1 %t4833, label %fixfast1055, label %fixslow1056
fixfast1055:
  %t4834 = icmp eq i64 %a0, %t4830
  %t4835 = select i1 %t4834, i64 257, i64 1
  br label %fixmerge1057
fixslow1056:
  %t4836 = call i64 @rt_num_eq(i64 %a0, i64 %t4830)
  br label %fixmerge1057
fixmerge1057:
  %t4837 = phi i64 [ %t4835, %fixfast1055 ], [ %t4836, %fixslow1056 ]
  %t4838 = icmp ne i64 %t4837, 1
  br i1 %t4838, label %then1058, label %else1059
then1058:
  %t4839 = and i64 %self, -8
  %t4840 = inttoptr i64 %t4839 to ptr
  %t4841 = getelementptr i64, ptr %t4840, i64 2
  %t4842 = load i64, ptr %t4841
  ret i64 %t4842
else1059:
  %t4843 = and i64 %self, -8
  %t4844 = inttoptr i64 %t4843 to ptr
  %t4845 = getelementptr i64, ptr %t4844, i64 2
  %t4846 = load i64, ptr %t4845
  %t4847 = and i64 %self, -8
  %t4848 = inttoptr i64 %t4847 to ptr
  %t4849 = getelementptr i64, ptr %t4848, i64 4
  %t4850 = load i64, ptr %t4849
  %t4851 = load i64, ptr @"scheme.base:vec-nth"
  call void @rt_check_callable(i64 %t4851)
  %t4852 = and i64 %t4851, -8
  %t4853 = inttoptr i64 %t4852 to ptr
  %t4854 = load i64, ptr %t4853
  %t4855 = inttoptr i64 %t4854 to ptr
  %t4856 = call fastcc i64%t4855(i64 %t4851, i64 2, i64 %t4850, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4857 = and i64 %self, -8
  %t4858 = inttoptr i64 %t4857 to ptr
  %t4859 = getelementptr i64, ptr %t4858, i64 3
  %t4860 = load i64, ptr %t4859
  call void @rt_check_callable(i64 %t4860)
  %t4861 = and i64 %t4860, -8
  %t4862 = inttoptr i64 %t4861 to ptr
  %t4863 = load i64, ptr %t4862
  %t4864 = inttoptr i64 %t4863 to ptr
  %t4865 = call i64 @rt_list_length(i64 %t4856)
  %t4866 = add i64 0, %t4865
  %t4867 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t4856, i64 8)
  %t4879 = getelementptr i64, ptr %t4867, i64 0
  %t4871 = load i64, ptr %t4879
  %t4880 = getelementptr i64, ptr %t4867, i64 1
  %t4872 = load i64, ptr %t4880
  %t4881 = getelementptr i64, ptr %t4867, i64 2
  %t4873 = load i64, ptr %t4881
  %t4882 = getelementptr i64, ptr %t4867, i64 3
  %t4874 = load i64, ptr %t4882
  %t4883 = getelementptr i64, ptr %t4867, i64 4
  %t4875 = load i64, ptr %t4883
  %t4884 = getelementptr i64, ptr %t4867, i64 5
  %t4876 = load i64, ptr %t4884
  %t4885 = getelementptr i64, ptr %t4867, i64 6
  %t4877 = load i64, ptr %t4885
  %t4886 = getelementptr i64, ptr %t4867, i64 7
  %t4878 = load i64, ptr %t4886
  %t4868 = icmp sgt i64 %t4866, 8
  %t4869 = getelementptr i64, ptr %t4867, i64 8
  %t4870 = select i1 %t4868, ptr %t4869, ptr null
  %t4887 = call fastcc i64%t4864(i64 %t4860, i64 %t4866, i64 %t4871, i64 %t4872, i64 %t4873, i64 %t4874, i64 %t4875, i64 %t4876, i64 %t4877, i64 %t4878, ptr %t4870)
  %t4888 = call i64 @rt_vector_set(i64 %t4846, i64 %a0, i64 %t4887)
  %t4889 = or i64 %a0, 8
  %t4890 = and i64 %t4889, 7
  %t4891 = icmp eq i64 %t4890, 0
  br i1 %t4891, label %fixfast1060, label %fixslow1061
fixfast1060:
  %t4892 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t4893 = extractvalue {i64, i1} %t4892, 0
  %t4894 = extractvalue {i64, i1} %t4892, 1
  br i1 %t4894, label %fixslow1061, label %fixmerge1062
fixslow1061:
  %t4895 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1062
fixmerge1062:
  %t4896 = phi i64 [ %t4893, %fixfast1060 ], [ %t4895, %fixslow1061 ]
  %t4897 = musttail call fastcc i64 @"scheme.base:code_846"(i64 %self, i64 1, i64 %t4896, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4897
}

define fastcc i64 @"scheme.base:code:vector-map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4898 = icmp sge i64 %argc, 2
  br i1 %t4898, label %argok1064, label %arityerr1063
arityerr1063:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1064:
  %t4899 = call ptr @rt_alloc_words(i64 8)
  %t4900 = getelementptr i64, ptr %t4899, i64 0
  store i64 %a0, ptr %t4900
  %t4901 = getelementptr i64, ptr %t4899, i64 1
  store i64 %a1, ptr %t4901
  %t4902 = getelementptr i64, ptr %t4899, i64 2
  store i64 %a2, ptr %t4902
  %t4903 = getelementptr i64, ptr %t4899, i64 3
  store i64 %a3, ptr %t4903
  %t4904 = getelementptr i64, ptr %t4899, i64 4
  store i64 %a4, ptr %t4904
  %t4905 = getelementptr i64, ptr %t4899, i64 5
  store i64 %a5, ptr %t4905
  %t4906 = getelementptr i64, ptr %t4899, i64 6
  store i64 %a6, ptr %t4906
  %t4907 = getelementptr i64, ptr %t4899, i64 7
  store i64 %a7, ptr %t4907
  %t4908 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t4899, ptr %overflow)
  %t4909 = call i64 @rt_null_p(i64 %t4908)
  %t4910 = icmp ne i64 %t4909, 1
  br i1 %t4910, label %then1065, label %else1066
then1065:
  %t4911 = call i64 @rt_vector_length(i64 %a1)
  %t4912 = call i64 @rt_make_vector(i64 %t4911, i64 0)
  %t4913 = call ptr @rt_alloc_words(i64 6)
  %t4914 = ptrtoint ptr %t4913 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_844" to i64), ptr %t4913
  %t4915 = or i64 %t4914, 4
  %t4916 = getelementptr i64, ptr %t4913, i64 1
  store i64 %t4911, ptr %t4916
  %t4917 = getelementptr i64, ptr %t4913, i64 2
  store i64 %t4912, ptr %t4917
  %t4918 = getelementptr i64, ptr %t4913, i64 3
  store i64 %a0, ptr %t4918
  %t4919 = getelementptr i64, ptr %t4913, i64 4
  store i64 %a1, ptr %t4919
  %t4920 = getelementptr i64, ptr %t4913, i64 5
  store i64 %t4915, ptr %t4920
  %t4921 = musttail call fastcc i64 @"scheme.base:code_844"(i64 %t4915, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4921
else1066:
  %t4922 = call i64 @rt_cons(i64 %a1, i64 %t4908)
  %t4923 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t4923)
  %t4924 = and i64 %t4923, -8
  %t4925 = inttoptr i64 %t4924 to ptr
  %t4926 = load i64, ptr %t4925
  %t4927 = inttoptr i64 %t4926 to ptr
  %t4928 = call fastcc i64%t4927(i64 %t4923, i64 1, i64 %t4922, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4929 = call i64 @rt_make_vector(i64 %t4928, i64 0)
  %t4930 = call ptr @rt_alloc_words(i64 6)
  %t4931 = ptrtoint ptr %t4930 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_846" to i64), ptr %t4930
  %t4932 = or i64 %t4931, 4
  %t4933 = getelementptr i64, ptr %t4930, i64 1
  store i64 %t4928, ptr %t4933
  %t4934 = getelementptr i64, ptr %t4930, i64 2
  store i64 %t4929, ptr %t4934
  %t4935 = getelementptr i64, ptr %t4930, i64 3
  store i64 %a0, ptr %t4935
  %t4936 = getelementptr i64, ptr %t4930, i64 4
  store i64 %t4922, ptr %t4936
  %t4937 = getelementptr i64, ptr %t4930, i64 5
  store i64 %t4932, ptr %t4937
  %t4938 = musttail call fastcc i64 @"scheme.base:code_846"(i64 %t4932, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4938
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector-map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4939 = call i64 @rt_null_p(i64 2)
  %t4940 = icmp ne i64 %t4939, 1
  br i1 %t4940, label %then1067, label %else1068
then1067:
  %t4941 = call i64 @rt_vector_length(i64 %a1)
  %t4942 = call i64 @rt_make_vector(i64 %t4941, i64 0)
  %t4943 = call ptr @rt_alloc_words(i64 6)
  %t4944 = ptrtoint ptr %t4943 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_844" to i64), ptr %t4943
  %t4945 = or i64 %t4944, 4
  %t4946 = getelementptr i64, ptr %t4943, i64 1
  store i64 %t4941, ptr %t4946
  %t4947 = getelementptr i64, ptr %t4943, i64 2
  store i64 %t4942, ptr %t4947
  %t4948 = getelementptr i64, ptr %t4943, i64 3
  store i64 %a0, ptr %t4948
  %t4949 = getelementptr i64, ptr %t4943, i64 4
  store i64 %a1, ptr %t4949
  %t4950 = getelementptr i64, ptr %t4943, i64 5
  store i64 %t4945, ptr %t4950
  %t4951 = musttail call fastcc i64 @"scheme.base:code_844"(i64 %t4945, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4951
else1068:
  %t4952 = call i64 @rt_cons(i64 %a1, i64 2)
  %t4953 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t4953)
  %t4954 = and i64 %t4953, -8
  %t4955 = inttoptr i64 %t4954 to ptr
  %t4956 = load i64, ptr %t4955
  %t4957 = inttoptr i64 %t4956 to ptr
  %t4958 = call fastcc i64%t4957(i64 %t4953, i64 1, i64 %t4952, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t4959 = call i64 @rt_make_vector(i64 %t4958, i64 0)
  %t4960 = call ptr @rt_alloc_words(i64 6)
  %t4961 = ptrtoint ptr %t4960 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_846" to i64), ptr %t4960
  %t4962 = or i64 %t4961, 4
  %t4963 = getelementptr i64, ptr %t4960, i64 1
  store i64 %t4958, ptr %t4963
  %t4964 = getelementptr i64, ptr %t4960, i64 2
  store i64 %t4959, ptr %t4964
  %t4965 = getelementptr i64, ptr %t4960, i64 3
  store i64 %a0, ptr %t4965
  %t4966 = getelementptr i64, ptr %t4960, i64 4
  store i64 %t4952, ptr %t4966
  %t4967 = getelementptr i64, ptr %t4960, i64 5
  store i64 %t4962, ptr %t4967
  %t4968 = musttail call fastcc i64 @"scheme.base:code_846"(i64 %t4962, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4968
}

define fastcc i64 @"scheme.base:code_867"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t4973 = icmp eq i64 %argc, 1
  br i1 %t4973, label %argok1070, label %arityerr1069
arityerr1069:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1070:
  %t4974 = and i64 %self, -8
  %t4975 = inttoptr i64 %t4974 to ptr
  %t4976 = getelementptr i64, ptr %t4975, i64 1
  %t4977 = load i64, ptr %t4976
  %t4978 = or i64 %a0, %t4977
  %t4979 = and i64 %t4978, 7
  %t4980 = icmp eq i64 %t4979, 0
  br i1 %t4980, label %fixfast1071, label %fixslow1072
fixfast1071:
  %t4981 = icmp eq i64 %a0, %t4977
  %t4982 = select i1 %t4981, i64 257, i64 1
  br label %fixmerge1073
fixslow1072:
  %t4983 = call i64 @rt_num_eq(i64 %a0, i64 %t4977)
  br label %fixmerge1073
fixmerge1073:
  %t4984 = phi i64 [ %t4982, %fixfast1071 ], [ %t4983, %fixslow1072 ]
  %t4985 = icmp ne i64 %t4984, 1
  br i1 %t4985, label %then1074, label %else1075
then1074:
  %t4986 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t4986)
  %t4987 = and i64 %t4986, -8
  %t4988 = inttoptr i64 %t4987 to ptr
  %t4989 = load i64, ptr %t4988
  %t4990 = inttoptr i64 %t4989 to ptr
  %t4991 = musttail call fastcc i64 %t4990(i64 %t4986, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t4991
else1075:
  %t4992 = and i64 %self, -8
  %t4993 = inttoptr i64 %t4992 to ptr
  %t4994 = getelementptr i64, ptr %t4993, i64 3
  %t4995 = load i64, ptr %t4994
  %t4996 = call i64 @rt_vector_ref(i64 %t4995, i64 %a0)
  %t4997 = and i64 %self, -8
  %t4998 = inttoptr i64 %t4997 to ptr
  %t4999 = getelementptr i64, ptr %t4998, i64 2
  %t5000 = load i64, ptr %t4999
  call void @rt_check_callable(i64 %t5000)
  %t5001 = and i64 %t5000, -8
  %t5002 = inttoptr i64 %t5001 to ptr
  %t5003 = load i64, ptr %t5002
  %t5004 = inttoptr i64 %t5003 to ptr
  %t5005 = call fastcc i64%t5004(i64 %t5000, i64 1, i64 %t4996, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5006 = or i64 %a0, 8
  %t5007 = and i64 %t5006, 7
  %t5008 = icmp eq i64 %t5007, 0
  br i1 %t5008, label %fixfast1076, label %fixslow1077
fixfast1076:
  %t5009 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5010 = extractvalue {i64, i1} %t5009, 0
  %t5011 = extractvalue {i64, i1} %t5009, 1
  br i1 %t5011, label %fixslow1077, label %fixmerge1078
fixslow1077:
  %t5012 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1078
fixmerge1078:
  %t5013 = phi i64 [ %t5010, %fixfast1076 ], [ %t5012, %fixslow1077 ]
  %t5014 = musttail call fastcc i64 @"scheme.base:code_867"(i64 %self, i64 1, i64 %t5013, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5014
}

define fastcc i64 @"scheme.base:code_869"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5015 = icmp eq i64 %argc, 1
  br i1 %t5015, label %argok1080, label %arityerr1079
arityerr1079:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1080:
  %t5016 = and i64 %self, -8
  %t5017 = inttoptr i64 %t5016 to ptr
  %t5018 = getelementptr i64, ptr %t5017, i64 1
  %t5019 = load i64, ptr %t5018
  %t5020 = or i64 %a0, %t5019
  %t5021 = and i64 %t5020, 7
  %t5022 = icmp eq i64 %t5021, 0
  br i1 %t5022, label %fixfast1081, label %fixslow1082
fixfast1081:
  %t5023 = icmp eq i64 %a0, %t5019
  %t5024 = select i1 %t5023, i64 257, i64 1
  br label %fixmerge1083
fixslow1082:
  %t5025 = call i64 @rt_num_eq(i64 %a0, i64 %t5019)
  br label %fixmerge1083
fixmerge1083:
  %t5026 = phi i64 [ %t5024, %fixfast1081 ], [ %t5025, %fixslow1082 ]
  %t5027 = icmp ne i64 %t5026, 1
  br i1 %t5027, label %then1084, label %else1085
then1084:
  %t5028 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t5028)
  %t5029 = and i64 %t5028, -8
  %t5030 = inttoptr i64 %t5029 to ptr
  %t5031 = load i64, ptr %t5030
  %t5032 = inttoptr i64 %t5031 to ptr
  %t5033 = musttail call fastcc i64 %t5032(i64 %t5028, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5033
else1085:
  %t5034 = and i64 %self, -8
  %t5035 = inttoptr i64 %t5034 to ptr
  %t5036 = getelementptr i64, ptr %t5035, i64 3
  %t5037 = load i64, ptr %t5036
  %t5038 = load i64, ptr @"scheme.base:vec-nth"
  call void @rt_check_callable(i64 %t5038)
  %t5039 = and i64 %t5038, -8
  %t5040 = inttoptr i64 %t5039 to ptr
  %t5041 = load i64, ptr %t5040
  %t5042 = inttoptr i64 %t5041 to ptr
  %t5043 = call fastcc i64%t5042(i64 %t5038, i64 2, i64 %t5037, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5044 = and i64 %self, -8
  %t5045 = inttoptr i64 %t5044 to ptr
  %t5046 = getelementptr i64, ptr %t5045, i64 2
  %t5047 = load i64, ptr %t5046
  call void @rt_check_callable(i64 %t5047)
  %t5048 = and i64 %t5047, -8
  %t5049 = inttoptr i64 %t5048 to ptr
  %t5050 = load i64, ptr %t5049
  %t5051 = inttoptr i64 %t5050 to ptr
  %t5052 = call i64 @rt_list_length(i64 %t5043)
  %t5053 = add i64 0, %t5052
  %t5054 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t5043, i64 8)
  %t5066 = getelementptr i64, ptr %t5054, i64 0
  %t5058 = load i64, ptr %t5066
  %t5067 = getelementptr i64, ptr %t5054, i64 1
  %t5059 = load i64, ptr %t5067
  %t5068 = getelementptr i64, ptr %t5054, i64 2
  %t5060 = load i64, ptr %t5068
  %t5069 = getelementptr i64, ptr %t5054, i64 3
  %t5061 = load i64, ptr %t5069
  %t5070 = getelementptr i64, ptr %t5054, i64 4
  %t5062 = load i64, ptr %t5070
  %t5071 = getelementptr i64, ptr %t5054, i64 5
  %t5063 = load i64, ptr %t5071
  %t5072 = getelementptr i64, ptr %t5054, i64 6
  %t5064 = load i64, ptr %t5072
  %t5073 = getelementptr i64, ptr %t5054, i64 7
  %t5065 = load i64, ptr %t5073
  %t5055 = icmp sgt i64 %t5053, 8
  %t5056 = getelementptr i64, ptr %t5054, i64 8
  %t5057 = select i1 %t5055, ptr %t5056, ptr null
  %t5074 = call fastcc i64%t5051(i64 %t5047, i64 %t5053, i64 %t5058, i64 %t5059, i64 %t5060, i64 %t5061, i64 %t5062, i64 %t5063, i64 %t5064, i64 %t5065, ptr %t5057)
  %t5075 = or i64 %a0, 8
  %t5076 = and i64 %t5075, 7
  %t5077 = icmp eq i64 %t5076, 0
  br i1 %t5077, label %fixfast1086, label %fixslow1087
fixfast1086:
  %t5078 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5079 = extractvalue {i64, i1} %t5078, 0
  %t5080 = extractvalue {i64, i1} %t5078, 1
  br i1 %t5080, label %fixslow1087, label %fixmerge1088
fixslow1087:
  %t5081 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1088
fixmerge1088:
  %t5082 = phi i64 [ %t5079, %fixfast1086 ], [ %t5081, %fixslow1087 ]
  %t5083 = musttail call fastcc i64 @"scheme.base:code_869"(i64 %self, i64 1, i64 %t5082, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5083
}

define fastcc i64 @"scheme.base:code:vector-for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5084 = icmp sge i64 %argc, 2
  br i1 %t5084, label %argok1090, label %arityerr1089
arityerr1089:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1090:
  %t5085 = call ptr @rt_alloc_words(i64 8)
  %t5086 = getelementptr i64, ptr %t5085, i64 0
  store i64 %a0, ptr %t5086
  %t5087 = getelementptr i64, ptr %t5085, i64 1
  store i64 %a1, ptr %t5087
  %t5088 = getelementptr i64, ptr %t5085, i64 2
  store i64 %a2, ptr %t5088
  %t5089 = getelementptr i64, ptr %t5085, i64 3
  store i64 %a3, ptr %t5089
  %t5090 = getelementptr i64, ptr %t5085, i64 4
  store i64 %a4, ptr %t5090
  %t5091 = getelementptr i64, ptr %t5085, i64 5
  store i64 %a5, ptr %t5091
  %t5092 = getelementptr i64, ptr %t5085, i64 6
  store i64 %a6, ptr %t5092
  %t5093 = getelementptr i64, ptr %t5085, i64 7
  store i64 %a7, ptr %t5093
  %t5094 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t5085, ptr %overflow)
  %t5095 = call i64 @rt_null_p(i64 %t5094)
  %t5096 = icmp ne i64 %t5095, 1
  br i1 %t5096, label %then1091, label %else1092
then1091:
  %t5097 = call i64 @rt_vector_length(i64 %a1)
  %t5098 = call ptr @rt_alloc_words(i64 5)
  %t5099 = ptrtoint ptr %t5098 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_867" to i64), ptr %t5098
  %t5100 = or i64 %t5099, 4
  %t5101 = getelementptr i64, ptr %t5098, i64 1
  store i64 %t5097, ptr %t5101
  %t5102 = getelementptr i64, ptr %t5098, i64 2
  store i64 %a0, ptr %t5102
  %t5103 = getelementptr i64, ptr %t5098, i64 3
  store i64 %a1, ptr %t5103
  %t5104 = getelementptr i64, ptr %t5098, i64 4
  store i64 %t5100, ptr %t5104
  %t5105 = musttail call fastcc i64 @"scheme.base:code_867"(i64 %t5100, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5105
else1092:
  %t5106 = call i64 @rt_cons(i64 %a1, i64 %t5094)
  %t5107 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t5107)
  %t5108 = and i64 %t5107, -8
  %t5109 = inttoptr i64 %t5108 to ptr
  %t5110 = load i64, ptr %t5109
  %t5111 = inttoptr i64 %t5110 to ptr
  %t5112 = call fastcc i64%t5111(i64 %t5107, i64 1, i64 %t5106, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5113 = call ptr @rt_alloc_words(i64 5)
  %t5114 = ptrtoint ptr %t5113 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_869" to i64), ptr %t5113
  %t5115 = or i64 %t5114, 4
  %t5116 = getelementptr i64, ptr %t5113, i64 1
  store i64 %t5112, ptr %t5116
  %t5117 = getelementptr i64, ptr %t5113, i64 2
  store i64 %a0, ptr %t5117
  %t5118 = getelementptr i64, ptr %t5113, i64 3
  store i64 %t5106, ptr %t5118
  %t5119 = getelementptr i64, ptr %t5113, i64 4
  store i64 %t5115, ptr %t5119
  %t5120 = musttail call fastcc i64 @"scheme.base:code_869"(i64 %t5115, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5120
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector-for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5121 = call i64 @rt_null_p(i64 2)
  %t5122 = icmp ne i64 %t5121, 1
  br i1 %t5122, label %then1093, label %else1094
then1093:
  %t5123 = call i64 @rt_vector_length(i64 %a1)
  %t5124 = call ptr @rt_alloc_words(i64 5)
  %t5125 = ptrtoint ptr %t5124 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_867" to i64), ptr %t5124
  %t5126 = or i64 %t5125, 4
  %t5127 = getelementptr i64, ptr %t5124, i64 1
  store i64 %t5123, ptr %t5127
  %t5128 = getelementptr i64, ptr %t5124, i64 2
  store i64 %a0, ptr %t5128
  %t5129 = getelementptr i64, ptr %t5124, i64 3
  store i64 %a1, ptr %t5129
  %t5130 = getelementptr i64, ptr %t5124, i64 4
  store i64 %t5126, ptr %t5130
  %t5131 = musttail call fastcc i64 @"scheme.base:code_867"(i64 %t5126, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5131
else1094:
  %t5132 = call i64 @rt_cons(i64 %a1, i64 2)
  %t5133 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t5133)
  %t5134 = and i64 %t5133, -8
  %t5135 = inttoptr i64 %t5134 to ptr
  %t5136 = load i64, ptr %t5135
  %t5137 = inttoptr i64 %t5136 to ptr
  %t5138 = call fastcc i64%t5137(i64 %t5133, i64 1, i64 %t5132, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5139 = call ptr @rt_alloc_words(i64 5)
  %t5140 = ptrtoint ptr %t5139 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_869" to i64), ptr %t5139
  %t5141 = or i64 %t5140, 4
  %t5142 = getelementptr i64, ptr %t5139, i64 1
  store i64 %t5138, ptr %t5142
  %t5143 = getelementptr i64, ptr %t5139, i64 2
  store i64 %a0, ptr %t5143
  %t5144 = getelementptr i64, ptr %t5139, i64 3
  store i64 %t5132, ptr %t5144
  %t5145 = getelementptr i64, ptr %t5139, i64 4
  store i64 %t5141, ptr %t5145
  %t5146 = musttail call fastcc i64 @"scheme.base:code_869"(i64 %t5141, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5146
}

define fastcc i64 @"scheme.base:code:vec-min-len"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5151 = icmp eq i64 %argc, 1
  br i1 %t5151, label %argok1096, label %arityerr1095
arityerr1095:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1096:
  %t5152 = call i64 @rt_cdr(i64 %a0)
  %t5153 = call i64 @rt_null_p(i64 %t5152)
  %t5154 = icmp ne i64 %t5153, 1
  br i1 %t5154, label %then1097, label %else1098
then1097:
  %t5155 = call i64 @rt_car(i64 %a0)
  %t5156 = call i64 @rt_vector_length(i64 %t5155)
  ret i64 %t5156
else1098:
  %t5157 = call i64 @rt_car(i64 %a0)
  %t5158 = call i64 @rt_vector_length(i64 %t5157)
  %t5159 = call i64 @rt_cdr(i64 %a0)
  %t5160 = load i64, ptr @"scheme.base:vec-min-len"
  call void @rt_check_callable(i64 %t5160)
  %t5161 = and i64 %t5160, -8
  %t5162 = inttoptr i64 %t5161 to ptr
  %t5163 = load i64, ptr %t5162
  %t5164 = inttoptr i64 %t5163 to ptr
  %t5165 = call fastcc i64%t5164(i64 %t5160, i64 1, i64 %t5159, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5166 = or i64 %t5158, %t5165
  %t5167 = and i64 %t5166, 7
  %t5168 = icmp eq i64 %t5167, 0
  br i1 %t5168, label %fixfast1099, label %fixslow1100
fixfast1099:
  %t5169 = icmp slt i64 %t5158, %t5165
  %t5170 = select i1 %t5169, i64 257, i64 1
  br label %fixmerge1101
fixslow1100:
  %t5171 = call i64 @rt_lt(i64 %t5158, i64 %t5165)
  br label %fixmerge1101
fixmerge1101:
  %t5172 = phi i64 [ %t5170, %fixfast1099 ], [ %t5171, %fixslow1100 ]
  %t5173 = icmp ne i64 %t5172, 1
  br i1 %t5173, label %then1102, label %else1103
then1102:
  ret i64 %t5158
else1103:
  ret i64 %t5165
}

define fastcc i64 @"scheme.base:code:vec-nth"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5178 = icmp eq i64 %argc, 2
  br i1 %t5178, label %argok1105, label %arityerr1104
arityerr1104:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1105:
  %t5179 = call i64 @rt_null_p(i64 %a0)
  %t5180 = icmp ne i64 %t5179, 1
  br i1 %t5180, label %then1106, label %else1107
then1106:
  ret i64 2
else1107:
  %t5181 = call i64 @rt_car(i64 %a0)
  %t5182 = call i64 @rt_vector_ref(i64 %t5181, i64 %a1)
  %t5183 = call i64 @rt_cdr(i64 %a0)
  %t5184 = load i64, ptr @"scheme.base:vec-nth"
  call void @rt_check_callable(i64 %t5184)
  %t5185 = and i64 %t5184, -8
  %t5186 = inttoptr i64 %t5185 to ptr
  %t5187 = load i64, ptr %t5186
  %t5188 = inttoptr i64 %t5187 to ptr
  %t5189 = call fastcc i64%t5188(i64 %t5184, i64 2, i64 %t5183, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5190 = call i64 @rt_cons(i64 %t5182, i64 %t5189)
  ret i64 %t5190
}

define fastcc i64 @"scheme.base:code_895"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5195 = icmp eq i64 %argc, 1
  br i1 %t5195, label %argok1109, label %arityerr1108
arityerr1108:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1109:
  %t5196 = and i64 %self, -8
  %t5197 = inttoptr i64 %t5196 to ptr
  %t5198 = getelementptr i64, ptr %t5197, i64 1
  %t5199 = load i64, ptr %t5198
  %t5200 = or i64 %a0, %t5199
  %t5201 = and i64 %t5200, 7
  %t5202 = icmp eq i64 %t5201, 0
  br i1 %t5202, label %fixfast1110, label %fixslow1111
fixfast1110:
  %t5203 = icmp eq i64 %a0, %t5199
  %t5204 = select i1 %t5203, i64 257, i64 1
  br label %fixmerge1112
fixslow1111:
  %t5205 = call i64 @rt_num_eq(i64 %a0, i64 %t5199)
  br label %fixmerge1112
fixmerge1112:
  %t5206 = phi i64 [ %t5204, %fixfast1110 ], [ %t5205, %fixslow1111 ]
  %t5207 = icmp ne i64 %t5206, 1
  br i1 %t5207, label %then1113, label %else1114
then1113:
  %t5208 = and i64 %self, -8
  %t5209 = inttoptr i64 %t5208 to ptr
  %t5210 = getelementptr i64, ptr %t5209, i64 2
  %t5211 = load i64, ptr %t5210
  ret i64 %t5211
else1114:
  %t5212 = and i64 %self, -8
  %t5213 = inttoptr i64 %t5212 to ptr
  %t5214 = getelementptr i64, ptr %t5213, i64 2
  %t5215 = load i64, ptr %t5214
  %t5216 = and i64 %self, -8
  %t5217 = inttoptr i64 %t5216 to ptr
  %t5218 = getelementptr i64, ptr %t5217, i64 3
  %t5219 = load i64, ptr %t5218
  %t5220 = or i64 %a0, %t5219
  %t5221 = and i64 %t5220, 7
  %t5222 = icmp eq i64 %t5221, 0
  br i1 %t5222, label %fixfast1115, label %fixslow1116
fixfast1115:
  %t5223 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t5219)
  %t5224 = extractvalue {i64, i1} %t5223, 0
  %t5225 = extractvalue {i64, i1} %t5223, 1
  br i1 %t5225, label %fixslow1116, label %fixmerge1117
fixslow1116:
  %t5226 = call i64 @rt_sub(i64 %a0, i64 %t5219)
  br label %fixmerge1117
fixmerge1117:
  %t5227 = phi i64 [ %t5224, %fixfast1115 ], [ %t5226, %fixslow1116 ]
  %t5228 = and i64 %self, -8
  %t5229 = inttoptr i64 %t5228 to ptr
  %t5230 = getelementptr i64, ptr %t5229, i64 4
  %t5231 = load i64, ptr %t5230
  %t5232 = call i64 @rt_string_ref(i64 %t5231, i64 %a0)
  %t5233 = call i64 @rt_vector_set(i64 %t5215, i64 %t5227, i64 %t5232)
  %t5234 = or i64 %a0, 8
  %t5235 = and i64 %t5234, 7
  %t5236 = icmp eq i64 %t5235, 0
  br i1 %t5236, label %fixfast1118, label %fixslow1119
fixfast1118:
  %t5237 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5238 = extractvalue {i64, i1} %t5237, 0
  %t5239 = extractvalue {i64, i1} %t5237, 1
  br i1 %t5239, label %fixslow1119, label %fixmerge1120
fixslow1119:
  %t5240 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1120
fixmerge1120:
  %t5241 = phi i64 [ %t5238, %fixfast1118 ], [ %t5240, %fixslow1119 ]
  %t5242 = musttail call fastcc i64 @"scheme.base:code_895"(i64 %self, i64 1, i64 %t5241, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5242
}

define fastcc i64 @"scheme.base:code:string->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5243 = icmp sge i64 %argc, 1
  br i1 %t5243, label %argok1122, label %arityerr1121
arityerr1121:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1122:
  %t5244 = call ptr @rt_alloc_words(i64 8)
  %t5245 = getelementptr i64, ptr %t5244, i64 0
  store i64 %a0, ptr %t5245
  %t5246 = getelementptr i64, ptr %t5244, i64 1
  store i64 %a1, ptr %t5246
  %t5247 = getelementptr i64, ptr %t5244, i64 2
  store i64 %a2, ptr %t5247
  %t5248 = getelementptr i64, ptr %t5244, i64 3
  store i64 %a3, ptr %t5248
  %t5249 = getelementptr i64, ptr %t5244, i64 4
  store i64 %a4, ptr %t5249
  %t5250 = getelementptr i64, ptr %t5244, i64 5
  store i64 %a5, ptr %t5250
  %t5251 = getelementptr i64, ptr %t5244, i64 6
  store i64 %a6, ptr %t5251
  %t5252 = getelementptr i64, ptr %t5244, i64 7
  store i64 %a7, ptr %t5252
  %t5253 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t5244, ptr %overflow)
  %t5254 = call i64 @rt_string_length(i64 %a0)
  %t5255 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5255)
  %t5256 = and i64 %t5255, -8
  %t5257 = inttoptr i64 %t5256 to ptr
  %t5258 = load i64, ptr %t5257
  %t5259 = inttoptr i64 %t5258 to ptr
  %t5260 = call fastcc i64%t5259(i64 %t5255, i64 1, i64 %t5253, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5261 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5261)
  %t5262 = and i64 %t5261, -8
  %t5263 = inttoptr i64 %t5262 to ptr
  %t5264 = load i64, ptr %t5263
  %t5265 = inttoptr i64 %t5264 to ptr
  %t5266 = call fastcc i64%t5265(i64 %t5261, i64 2, i64 %t5253, i64 %t5254, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5267 = call i64 @rt_intern(ptr @.str.sym.38)
  %t5268 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5268)
  %t5269 = and i64 %t5268, -8
  %t5270 = inttoptr i64 %t5269 to ptr
  %t5271 = load i64, ptr %t5270
  %t5272 = inttoptr i64 %t5271 to ptr
  %t5273 = call fastcc i64%t5272(i64 %t5268, i64 4, i64 %t5267, i64 %t5260, i64 %t5266, i64 %t5254, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5274 = or i64 %t5266, %t5260
  %t5275 = and i64 %t5274, 7
  %t5276 = icmp eq i64 %t5275, 0
  br i1 %t5276, label %fixfast1123, label %fixslow1124
fixfast1123:
  %t5277 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5266, i64 %t5260)
  %t5278 = extractvalue {i64, i1} %t5277, 0
  %t5279 = extractvalue {i64, i1} %t5277, 1
  br i1 %t5279, label %fixslow1124, label %fixmerge1125
fixslow1124:
  %t5280 = call i64 @rt_sub(i64 %t5266, i64 %t5260)
  br label %fixmerge1125
fixmerge1125:
  %t5281 = phi i64 [ %t5278, %fixfast1123 ], [ %t5280, %fixslow1124 ]
  %t5282 = call i64 @rt_make_vector(i64 %t5281, i64 0)
  %t5283 = call ptr @rt_alloc_words(i64 6)
  %t5284 = ptrtoint ptr %t5283 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_895" to i64), ptr %t5283
  %t5285 = or i64 %t5284, 4
  %t5286 = getelementptr i64, ptr %t5283, i64 1
  store i64 %t5266, ptr %t5286
  %t5287 = getelementptr i64, ptr %t5283, i64 2
  store i64 %t5282, ptr %t5287
  %t5288 = getelementptr i64, ptr %t5283, i64 3
  store i64 %t5260, ptr %t5288
  %t5289 = getelementptr i64, ptr %t5283, i64 4
  store i64 %a0, ptr %t5289
  %t5290 = getelementptr i64, ptr %t5283, i64 5
  store i64 %t5285, ptr %t5290
  %t5291 = musttail call fastcc i64 @"scheme.base:code_895"(i64 %t5285, i64 1, i64 %t5260, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5291
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring->vector"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5292 = call i64 @rt_string_length(i64 %a0)
  %t5293 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5293)
  %t5294 = and i64 %t5293, -8
  %t5295 = inttoptr i64 %t5294 to ptr
  %t5296 = load i64, ptr %t5295
  %t5297 = inttoptr i64 %t5296 to ptr
  %t5298 = call fastcc i64%t5297(i64 %t5293, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5299 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5299)
  %t5300 = and i64 %t5299, -8
  %t5301 = inttoptr i64 %t5300 to ptr
  %t5302 = load i64, ptr %t5301
  %t5303 = inttoptr i64 %t5302 to ptr
  %t5304 = call fastcc i64%t5303(i64 %t5299, i64 2, i64 2, i64 %t5292, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5305 = call i64 @rt_intern(ptr @.str.sym.38)
  %t5306 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5306)
  %t5307 = and i64 %t5306, -8
  %t5308 = inttoptr i64 %t5307 to ptr
  %t5309 = load i64, ptr %t5308
  %t5310 = inttoptr i64 %t5309 to ptr
  %t5311 = call fastcc i64%t5310(i64 %t5306, i64 4, i64 %t5305, i64 %t5298, i64 %t5304, i64 %t5292, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5312 = or i64 %t5304, %t5298
  %t5313 = and i64 %t5312, 7
  %t5314 = icmp eq i64 %t5313, 0
  br i1 %t5314, label %fixfast1126, label %fixslow1127
fixfast1126:
  %t5315 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5304, i64 %t5298)
  %t5316 = extractvalue {i64, i1} %t5315, 0
  %t5317 = extractvalue {i64, i1} %t5315, 1
  br i1 %t5317, label %fixslow1127, label %fixmerge1128
fixslow1127:
  %t5318 = call i64 @rt_sub(i64 %t5304, i64 %t5298)
  br label %fixmerge1128
fixmerge1128:
  %t5319 = phi i64 [ %t5316, %fixfast1126 ], [ %t5318, %fixslow1127 ]
  %t5320 = call i64 @rt_make_vector(i64 %t5319, i64 0)
  %t5321 = call ptr @rt_alloc_words(i64 6)
  %t5322 = ptrtoint ptr %t5321 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_895" to i64), ptr %t5321
  %t5323 = or i64 %t5322, 4
  %t5324 = getelementptr i64, ptr %t5321, i64 1
  store i64 %t5304, ptr %t5324
  %t5325 = getelementptr i64, ptr %t5321, i64 2
  store i64 %t5320, ptr %t5325
  %t5326 = getelementptr i64, ptr %t5321, i64 3
  store i64 %t5298, ptr %t5326
  %t5327 = getelementptr i64, ptr %t5321, i64 4
  store i64 %a0, ptr %t5327
  %t5328 = getelementptr i64, ptr %t5321, i64 5
  store i64 %t5323, ptr %t5328
  %t5329 = musttail call fastcc i64 @"scheme.base:code_895"(i64 %t5323, i64 1, i64 %t5298, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5329
}

define fastcc i64 @"scheme.base:code:vector->string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5334 = icmp sge i64 %argc, 1
  br i1 %t5334, label %argok1130, label %arityerr1129
arityerr1129:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1130:
  %t5335 = call ptr @rt_alloc_words(i64 8)
  %t5336 = getelementptr i64, ptr %t5335, i64 0
  store i64 %a0, ptr %t5336
  %t5337 = getelementptr i64, ptr %t5335, i64 1
  store i64 %a1, ptr %t5337
  %t5338 = getelementptr i64, ptr %t5335, i64 2
  store i64 %a2, ptr %t5338
  %t5339 = getelementptr i64, ptr %t5335, i64 3
  store i64 %a3, ptr %t5339
  %t5340 = getelementptr i64, ptr %t5335, i64 4
  store i64 %a4, ptr %t5340
  %t5341 = getelementptr i64, ptr %t5335, i64 5
  store i64 %a5, ptr %t5341
  %t5342 = getelementptr i64, ptr %t5335, i64 6
  store i64 %a6, ptr %t5342
  %t5343 = getelementptr i64, ptr %t5335, i64 7
  store i64 %a7, ptr %t5343
  %t5344 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t5335, ptr %overflow)
  %t5345 = call i64 @rt_vector_length(i64 %a0)
  %t5346 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5346)
  %t5347 = and i64 %t5346, -8
  %t5348 = inttoptr i64 %t5347 to ptr
  %t5349 = load i64, ptr %t5348
  %t5350 = inttoptr i64 %t5349 to ptr
  %t5351 = call fastcc i64%t5350(i64 %t5346, i64 1, i64 %t5344, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5352 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5352)
  %t5353 = and i64 %t5352, -8
  %t5354 = inttoptr i64 %t5353 to ptr
  %t5355 = load i64, ptr %t5354
  %t5356 = inttoptr i64 %t5355 to ptr
  %t5357 = call fastcc i64%t5356(i64 %t5352, i64 2, i64 %t5344, i64 %t5345, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5358 = call i64 @rt_intern(ptr @.str.sym.39)
  %t5359 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5359)
  %t5360 = and i64 %t5359, -8
  %t5361 = inttoptr i64 %t5360 to ptr
  %t5362 = load i64, ptr %t5361
  %t5363 = inttoptr i64 %t5362 to ptr
  %t5364 = call fastcc i64%t5363(i64 %t5359, i64 4, i64 %t5358, i64 %t5351, i64 %t5357, i64 %t5345, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5365 = load i64, ptr @"scheme.base:vector->list"
  call void @rt_check_callable(i64 %t5365)
  %t5366 = and i64 %t5365, -8
  %t5367 = inttoptr i64 %t5366 to ptr
  %t5368 = load i64, ptr %t5367
  %t5369 = inttoptr i64 %t5368 to ptr
  %t5370 = call fastcc i64%t5369(i64 %t5365, i64 3, i64 %a0, i64 %t5351, i64 %t5357, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5371 = call i64 @rt_list_to_string(i64 %t5370)
  ret i64 %t5371
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvector->string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5372 = call i64 @rt_vector_length(i64 %a0)
  %t5373 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5373)
  %t5374 = and i64 %t5373, -8
  %t5375 = inttoptr i64 %t5374 to ptr
  %t5376 = load i64, ptr %t5375
  %t5377 = inttoptr i64 %t5376 to ptr
  %t5378 = call fastcc i64%t5377(i64 %t5373, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5379 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5379)
  %t5380 = and i64 %t5379, -8
  %t5381 = inttoptr i64 %t5380 to ptr
  %t5382 = load i64, ptr %t5381
  %t5383 = inttoptr i64 %t5382 to ptr
  %t5384 = call fastcc i64%t5383(i64 %t5379, i64 2, i64 2, i64 %t5372, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5385 = call i64 @rt_intern(ptr @.str.sym.39)
  %t5386 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5386)
  %t5387 = and i64 %t5386, -8
  %t5388 = inttoptr i64 %t5387 to ptr
  %t5389 = load i64, ptr %t5388
  %t5390 = inttoptr i64 %t5389 to ptr
  %t5391 = call fastcc i64%t5390(i64 %t5386, i64 4, i64 %t5385, i64 %t5378, i64 %t5384, i64 %t5372, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5392 = load i64, ptr @"scheme.base:vector->list"
  call void @rt_check_callable(i64 %t5392)
  %t5393 = and i64 %t5392, -8
  %t5394 = inttoptr i64 %t5393 to ptr
  %t5395 = load i64, ptr %t5394
  %t5396 = inttoptr i64 %t5395 to ptr
  %t5397 = call fastcc i64%t5396(i64 %t5392, i64 3, i64 %a0, i64 %t5378, i64 %t5384, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5398 = call i64 @rt_list_to_string(i64 %t5397)
  ret i64 %t5398
}

define fastcc i64 @"scheme.base:code:string-map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5403 = icmp sge i64 %argc, 2
  br i1 %t5403, label %argok1132, label %arityerr1131
arityerr1131:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1132:
  %t5404 = call ptr @rt_alloc_words(i64 8)
  %t5405 = getelementptr i64, ptr %t5404, i64 0
  store i64 %a0, ptr %t5405
  %t5406 = getelementptr i64, ptr %t5404, i64 1
  store i64 %a1, ptr %t5406
  %t5407 = getelementptr i64, ptr %t5404, i64 2
  store i64 %a2, ptr %t5407
  %t5408 = getelementptr i64, ptr %t5404, i64 3
  store i64 %a3, ptr %t5408
  %t5409 = getelementptr i64, ptr %t5404, i64 4
  store i64 %a4, ptr %t5409
  %t5410 = getelementptr i64, ptr %t5404, i64 5
  store i64 %a5, ptr %t5410
  %t5411 = getelementptr i64, ptr %t5404, i64 6
  store i64 %a6, ptr %t5411
  %t5412 = getelementptr i64, ptr %t5404, i64 7
  store i64 %a7, ptr %t5412
  %t5413 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t5404, ptr %overflow)
  %t5414 = call i64 @rt_null_p(i64 %t5413)
  %t5415 = icmp ne i64 %t5414, 1
  br i1 %t5415, label %then1133, label %else1134
then1133:
  %t5416 = load i64, ptr @"scheme.base:string->list"
  call void @rt_check_callable(i64 %t5416)
  %t5417 = and i64 %t5416, -8
  %t5418 = inttoptr i64 %t5417 to ptr
  %t5419 = load i64, ptr %t5418
  %t5420 = inttoptr i64 %t5419 to ptr
  %t5421 = call fastcc i64%t5420(i64 %t5416, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5422 = load i64, ptr @"scheme.base:str-map1"
  call void @rt_check_callable(i64 %t5422)
  %t5423 = and i64 %t5422, -8
  %t5424 = inttoptr i64 %t5423 to ptr
  %t5425 = load i64, ptr %t5424
  %t5426 = inttoptr i64 %t5425 to ptr
  %t5427 = call fastcc i64%t5426(i64 %t5422, i64 2, i64 %a0, i64 %t5421, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5428 = call i64 @rt_list_to_string(i64 %t5427)
  ret i64 %t5428
else1134:
  %t5429 = call i64 @rt_cons(i64 %a1, i64 %t5413)
  %t5430 = load i64, ptr @"scheme.base:str-mapn"
  call void @rt_check_callable(i64 %t5430)
  %t5431 = and i64 %t5430, -8
  %t5432 = inttoptr i64 %t5431 to ptr
  %t5433 = load i64, ptr %t5432
  %t5434 = inttoptr i64 %t5433 to ptr
  %t5435 = call fastcc i64%t5434(i64 %t5430, i64 2, i64 %a0, i64 %t5429, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5436 = call i64 @rt_list_to_string(i64 %t5435)
  ret i64 %t5436
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring-map"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5437 = call i64 @rt_null_p(i64 2)
  %t5438 = icmp ne i64 %t5437, 1
  br i1 %t5438, label %then1135, label %else1136
then1135:
  %t5439 = load i64, ptr @"scheme.base:string->list"
  call void @rt_check_callable(i64 %t5439)
  %t5440 = and i64 %t5439, -8
  %t5441 = inttoptr i64 %t5440 to ptr
  %t5442 = load i64, ptr %t5441
  %t5443 = inttoptr i64 %t5442 to ptr
  %t5444 = call fastcc i64%t5443(i64 %t5439, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5445 = load i64, ptr @"scheme.base:str-map1"
  call void @rt_check_callable(i64 %t5445)
  %t5446 = and i64 %t5445, -8
  %t5447 = inttoptr i64 %t5446 to ptr
  %t5448 = load i64, ptr %t5447
  %t5449 = inttoptr i64 %t5448 to ptr
  %t5450 = call fastcc i64%t5449(i64 %t5445, i64 2, i64 %a0, i64 %t5444, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5451 = call i64 @rt_list_to_string(i64 %t5450)
  ret i64 %t5451
else1136:
  %t5452 = call i64 @rt_cons(i64 %a1, i64 2)
  %t5453 = load i64, ptr @"scheme.base:str-mapn"
  call void @rt_check_callable(i64 %t5453)
  %t5454 = and i64 %t5453, -8
  %t5455 = inttoptr i64 %t5454 to ptr
  %t5456 = load i64, ptr %t5455
  %t5457 = inttoptr i64 %t5456 to ptr
  %t5458 = call fastcc i64%t5457(i64 %t5453, i64 2, i64 %a0, i64 %t5452, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5459 = call i64 @rt_list_to_string(i64 %t5458)
  ret i64 %t5459
}

define fastcc i64 @"scheme.base:code:str-map1"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5464 = icmp eq i64 %argc, 2
  br i1 %t5464, label %argok1138, label %arityerr1137
arityerr1137:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1138:
  %t5465 = call i64 @rt_null_p(i64 %a1)
  %t5466 = icmp ne i64 %t5465, 1
  br i1 %t5466, label %then1139, label %else1140
then1139:
  ret i64 2
else1140:
  %t5467 = call i64 @rt_car(i64 %a1)
  call void @rt_check_callable(i64 %a0)
  %t5468 = and i64 %a0, -8
  %t5469 = inttoptr i64 %t5468 to ptr
  %t5470 = load i64, ptr %t5469
  %t5471 = inttoptr i64 %t5470 to ptr
  %t5472 = call fastcc i64%t5471(i64 %a0, i64 1, i64 %t5467, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5473 = call i64 @rt_cdr(i64 %a1)
  %t5474 = load i64, ptr @"scheme.base:str-map1"
  call void @rt_check_callable(i64 %t5474)
  %t5475 = and i64 %t5474, -8
  %t5476 = inttoptr i64 %t5475 to ptr
  %t5477 = load i64, ptr %t5476
  %t5478 = inttoptr i64 %t5477 to ptr
  %t5479 = call fastcc i64%t5478(i64 %t5474, i64 2, i64 %a0, i64 %t5473, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5480 = call i64 @rt_cons(i64 %t5472, i64 %t5479)
  ret i64 %t5480
}

define fastcc i64 @"scheme.base:code_920"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5485 = icmp eq i64 %argc, 1
  br i1 %t5485, label %argok1142, label %arityerr1141
arityerr1141:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1142:
  %t5486 = and i64 %self, -8
  %t5487 = inttoptr i64 %t5486 to ptr
  %t5488 = getelementptr i64, ptr %t5487, i64 1
  %t5489 = load i64, ptr %t5488
  %t5490 = or i64 %a0, %t5489
  %t5491 = and i64 %t5490, 7
  %t5492 = icmp eq i64 %t5491, 0
  br i1 %t5492, label %fixfast1143, label %fixslow1144
fixfast1143:
  %t5493 = icmp eq i64 %a0, %t5489
  %t5494 = select i1 %t5493, i64 257, i64 1
  br label %fixmerge1145
fixslow1144:
  %t5495 = call i64 @rt_num_eq(i64 %a0, i64 %t5489)
  br label %fixmerge1145
fixmerge1145:
  %t5496 = phi i64 [ %t5494, %fixfast1143 ], [ %t5495, %fixslow1144 ]
  %t5497 = icmp ne i64 %t5496, 1
  br i1 %t5497, label %then1146, label %else1147
then1146:
  ret i64 2
else1147:
  %t5498 = and i64 %self, -8
  %t5499 = inttoptr i64 %t5498 to ptr
  %t5500 = getelementptr i64, ptr %t5499, i64 3
  %t5501 = load i64, ptr %t5500
  %t5502 = load i64, ptr @"scheme.base:str-nth"
  call void @rt_check_callable(i64 %t5502)
  %t5503 = and i64 %t5502, -8
  %t5504 = inttoptr i64 %t5503 to ptr
  %t5505 = load i64, ptr %t5504
  %t5506 = inttoptr i64 %t5505 to ptr
  %t5507 = call fastcc i64%t5506(i64 %t5502, i64 2, i64 %t5501, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5508 = and i64 %self, -8
  %t5509 = inttoptr i64 %t5508 to ptr
  %t5510 = getelementptr i64, ptr %t5509, i64 2
  %t5511 = load i64, ptr %t5510
  call void @rt_check_callable(i64 %t5511)
  %t5512 = and i64 %t5511, -8
  %t5513 = inttoptr i64 %t5512 to ptr
  %t5514 = load i64, ptr %t5513
  %t5515 = inttoptr i64 %t5514 to ptr
  %t5516 = call i64 @rt_list_length(i64 %t5507)
  %t5517 = add i64 0, %t5516
  %t5518 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t5507, i64 8)
  %t5530 = getelementptr i64, ptr %t5518, i64 0
  %t5522 = load i64, ptr %t5530
  %t5531 = getelementptr i64, ptr %t5518, i64 1
  %t5523 = load i64, ptr %t5531
  %t5532 = getelementptr i64, ptr %t5518, i64 2
  %t5524 = load i64, ptr %t5532
  %t5533 = getelementptr i64, ptr %t5518, i64 3
  %t5525 = load i64, ptr %t5533
  %t5534 = getelementptr i64, ptr %t5518, i64 4
  %t5526 = load i64, ptr %t5534
  %t5535 = getelementptr i64, ptr %t5518, i64 5
  %t5527 = load i64, ptr %t5535
  %t5536 = getelementptr i64, ptr %t5518, i64 6
  %t5528 = load i64, ptr %t5536
  %t5537 = getelementptr i64, ptr %t5518, i64 7
  %t5529 = load i64, ptr %t5537
  %t5519 = icmp sgt i64 %t5517, 8
  %t5520 = getelementptr i64, ptr %t5518, i64 8
  %t5521 = select i1 %t5519, ptr %t5520, ptr null
  %t5538 = call fastcc i64%t5515(i64 %t5511, i64 %t5517, i64 %t5522, i64 %t5523, i64 %t5524, i64 %t5525, i64 %t5526, i64 %t5527, i64 %t5528, i64 %t5529, ptr %t5521)
  %t5539 = or i64 %a0, 8
  %t5540 = and i64 %t5539, 7
  %t5541 = icmp eq i64 %t5540, 0
  br i1 %t5541, label %fixfast1148, label %fixslow1149
fixfast1148:
  %t5542 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5543 = extractvalue {i64, i1} %t5542, 0
  %t5544 = extractvalue {i64, i1} %t5542, 1
  br i1 %t5544, label %fixslow1149, label %fixmerge1150
fixslow1149:
  %t5545 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1150
fixmerge1150:
  %t5546 = phi i64 [ %t5543, %fixfast1148 ], [ %t5545, %fixslow1149 ]
  %t5547 = call fastcc i64 @"scheme.base:code_920"(i64 %self, i64 1, i64 %t5546, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5548 = call i64 @rt_cons(i64 %t5538, i64 %t5547)
  ret i64 %t5548
}

define fastcc i64 @"scheme.base:code:str-mapn"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5549 = icmp eq i64 %argc, 2
  br i1 %t5549, label %argok1152, label %arityerr1151
arityerr1151:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1152:
  %t5550 = load i64, ptr @"scheme.base:str-min-len"
  call void @rt_check_callable(i64 %t5550)
  %t5551 = and i64 %t5550, -8
  %t5552 = inttoptr i64 %t5551 to ptr
  %t5553 = load i64, ptr %t5552
  %t5554 = inttoptr i64 %t5553 to ptr
  %t5555 = call fastcc i64%t5554(i64 %t5550, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5556 = call ptr @rt_alloc_words(i64 5)
  %t5557 = ptrtoint ptr %t5556 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_920" to i64), ptr %t5556
  %t5558 = or i64 %t5557, 4
  %t5559 = getelementptr i64, ptr %t5556, i64 1
  store i64 %t5555, ptr %t5559
  %t5560 = getelementptr i64, ptr %t5556, i64 2
  store i64 %a0, ptr %t5560
  %t5561 = getelementptr i64, ptr %t5556, i64 3
  store i64 %a1, ptr %t5561
  %t5562 = getelementptr i64, ptr %t5556, i64 4
  store i64 %t5558, ptr %t5562
  %t5563 = musttail call fastcc i64 @"scheme.base:code_920"(i64 %t5558, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5563
}

define fastcc i64 @"scheme.base:code_941"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5568 = icmp eq i64 %argc, 1
  br i1 %t5568, label %argok1154, label %arityerr1153
arityerr1153:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1154:
  %t5569 = and i64 %self, -8
  %t5570 = inttoptr i64 %t5569 to ptr
  %t5571 = getelementptr i64, ptr %t5570, i64 1
  %t5572 = load i64, ptr %t5571
  %t5573 = or i64 %a0, %t5572
  %t5574 = and i64 %t5573, 7
  %t5575 = icmp eq i64 %t5574, 0
  br i1 %t5575, label %fixfast1155, label %fixslow1156
fixfast1155:
  %t5576 = icmp eq i64 %a0, %t5572
  %t5577 = select i1 %t5576, i64 257, i64 1
  br label %fixmerge1157
fixslow1156:
  %t5578 = call i64 @rt_num_eq(i64 %a0, i64 %t5572)
  br label %fixmerge1157
fixmerge1157:
  %t5579 = phi i64 [ %t5577, %fixfast1155 ], [ %t5578, %fixslow1156 ]
  %t5580 = icmp ne i64 %t5579, 1
  br i1 %t5580, label %then1158, label %else1159
then1158:
  %t5581 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t5581)
  %t5582 = and i64 %t5581, -8
  %t5583 = inttoptr i64 %t5582 to ptr
  %t5584 = load i64, ptr %t5583
  %t5585 = inttoptr i64 %t5584 to ptr
  %t5586 = musttail call fastcc i64 %t5585(i64 %t5581, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5586
else1159:
  %t5587 = and i64 %self, -8
  %t5588 = inttoptr i64 %t5587 to ptr
  %t5589 = getelementptr i64, ptr %t5588, i64 3
  %t5590 = load i64, ptr %t5589
  %t5591 = call i64 @rt_string_ref(i64 %t5590, i64 %a0)
  %t5592 = and i64 %self, -8
  %t5593 = inttoptr i64 %t5592 to ptr
  %t5594 = getelementptr i64, ptr %t5593, i64 2
  %t5595 = load i64, ptr %t5594
  call void @rt_check_callable(i64 %t5595)
  %t5596 = and i64 %t5595, -8
  %t5597 = inttoptr i64 %t5596 to ptr
  %t5598 = load i64, ptr %t5597
  %t5599 = inttoptr i64 %t5598 to ptr
  %t5600 = call fastcc i64%t5599(i64 %t5595, i64 1, i64 %t5591, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5601 = or i64 %a0, 8
  %t5602 = and i64 %t5601, 7
  %t5603 = icmp eq i64 %t5602, 0
  br i1 %t5603, label %fixfast1160, label %fixslow1161
fixfast1160:
  %t5604 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5605 = extractvalue {i64, i1} %t5604, 0
  %t5606 = extractvalue {i64, i1} %t5604, 1
  br i1 %t5606, label %fixslow1161, label %fixmerge1162
fixslow1161:
  %t5607 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1162
fixmerge1162:
  %t5608 = phi i64 [ %t5605, %fixfast1160 ], [ %t5607, %fixslow1161 ]
  %t5609 = musttail call fastcc i64 @"scheme.base:code_941"(i64 %self, i64 1, i64 %t5608, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5609
}

define fastcc i64 @"scheme.base:code_943"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5610 = icmp eq i64 %argc, 1
  br i1 %t5610, label %argok1164, label %arityerr1163
arityerr1163:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1164:
  %t5611 = and i64 %self, -8
  %t5612 = inttoptr i64 %t5611 to ptr
  %t5613 = getelementptr i64, ptr %t5612, i64 1
  %t5614 = load i64, ptr %t5613
  %t5615 = or i64 %a0, %t5614
  %t5616 = and i64 %t5615, 7
  %t5617 = icmp eq i64 %t5616, 0
  br i1 %t5617, label %fixfast1165, label %fixslow1166
fixfast1165:
  %t5618 = icmp eq i64 %a0, %t5614
  %t5619 = select i1 %t5618, i64 257, i64 1
  br label %fixmerge1167
fixslow1166:
  %t5620 = call i64 @rt_num_eq(i64 %a0, i64 %t5614)
  br label %fixmerge1167
fixmerge1167:
  %t5621 = phi i64 [ %t5619, %fixfast1165 ], [ %t5620, %fixslow1166 ]
  %t5622 = icmp ne i64 %t5621, 1
  br i1 %t5622, label %then1168, label %else1169
then1168:
  %t5623 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t5623)
  %t5624 = and i64 %t5623, -8
  %t5625 = inttoptr i64 %t5624 to ptr
  %t5626 = load i64, ptr %t5625
  %t5627 = inttoptr i64 %t5626 to ptr
  %t5628 = musttail call fastcc i64 %t5627(i64 %t5623, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5628
else1169:
  %t5629 = and i64 %self, -8
  %t5630 = inttoptr i64 %t5629 to ptr
  %t5631 = getelementptr i64, ptr %t5630, i64 3
  %t5632 = load i64, ptr %t5631
  %t5633 = load i64, ptr @"scheme.base:str-nth"
  call void @rt_check_callable(i64 %t5633)
  %t5634 = and i64 %t5633, -8
  %t5635 = inttoptr i64 %t5634 to ptr
  %t5636 = load i64, ptr %t5635
  %t5637 = inttoptr i64 %t5636 to ptr
  %t5638 = call fastcc i64%t5637(i64 %t5633, i64 2, i64 %t5632, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5639 = and i64 %self, -8
  %t5640 = inttoptr i64 %t5639 to ptr
  %t5641 = getelementptr i64, ptr %t5640, i64 2
  %t5642 = load i64, ptr %t5641
  call void @rt_check_callable(i64 %t5642)
  %t5643 = and i64 %t5642, -8
  %t5644 = inttoptr i64 %t5643 to ptr
  %t5645 = load i64, ptr %t5644
  %t5646 = inttoptr i64 %t5645 to ptr
  %t5647 = call i64 @rt_list_length(i64 %t5638)
  %t5648 = add i64 0, %t5647
  %t5649 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t5638, i64 8)
  %t5661 = getelementptr i64, ptr %t5649, i64 0
  %t5653 = load i64, ptr %t5661
  %t5662 = getelementptr i64, ptr %t5649, i64 1
  %t5654 = load i64, ptr %t5662
  %t5663 = getelementptr i64, ptr %t5649, i64 2
  %t5655 = load i64, ptr %t5663
  %t5664 = getelementptr i64, ptr %t5649, i64 3
  %t5656 = load i64, ptr %t5664
  %t5665 = getelementptr i64, ptr %t5649, i64 4
  %t5657 = load i64, ptr %t5665
  %t5666 = getelementptr i64, ptr %t5649, i64 5
  %t5658 = load i64, ptr %t5666
  %t5667 = getelementptr i64, ptr %t5649, i64 6
  %t5659 = load i64, ptr %t5667
  %t5668 = getelementptr i64, ptr %t5649, i64 7
  %t5660 = load i64, ptr %t5668
  %t5650 = icmp sgt i64 %t5648, 8
  %t5651 = getelementptr i64, ptr %t5649, i64 8
  %t5652 = select i1 %t5650, ptr %t5651, ptr null
  %t5669 = call fastcc i64%t5646(i64 %t5642, i64 %t5648, i64 %t5653, i64 %t5654, i64 %t5655, i64 %t5656, i64 %t5657, i64 %t5658, i64 %t5659, i64 %t5660, ptr %t5652)
  %t5670 = or i64 %a0, 8
  %t5671 = and i64 %t5670, 7
  %t5672 = icmp eq i64 %t5671, 0
  br i1 %t5672, label %fixfast1170, label %fixslow1171
fixfast1170:
  %t5673 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5674 = extractvalue {i64, i1} %t5673, 0
  %t5675 = extractvalue {i64, i1} %t5673, 1
  br i1 %t5675, label %fixslow1171, label %fixmerge1172
fixslow1171:
  %t5676 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1172
fixmerge1172:
  %t5677 = phi i64 [ %t5674, %fixfast1170 ], [ %t5676, %fixslow1171 ]
  %t5678 = musttail call fastcc i64 @"scheme.base:code_943"(i64 %self, i64 1, i64 %t5677, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5678
}

define fastcc i64 @"scheme.base:code:string-for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5679 = icmp sge i64 %argc, 2
  br i1 %t5679, label %argok1174, label %arityerr1173
arityerr1173:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1174:
  %t5680 = call ptr @rt_alloc_words(i64 8)
  %t5681 = getelementptr i64, ptr %t5680, i64 0
  store i64 %a0, ptr %t5681
  %t5682 = getelementptr i64, ptr %t5680, i64 1
  store i64 %a1, ptr %t5682
  %t5683 = getelementptr i64, ptr %t5680, i64 2
  store i64 %a2, ptr %t5683
  %t5684 = getelementptr i64, ptr %t5680, i64 3
  store i64 %a3, ptr %t5684
  %t5685 = getelementptr i64, ptr %t5680, i64 4
  store i64 %a4, ptr %t5685
  %t5686 = getelementptr i64, ptr %t5680, i64 5
  store i64 %a5, ptr %t5686
  %t5687 = getelementptr i64, ptr %t5680, i64 6
  store i64 %a6, ptr %t5687
  %t5688 = getelementptr i64, ptr %t5680, i64 7
  store i64 %a7, ptr %t5688
  %t5689 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t5680, ptr %overflow)
  %t5690 = call i64 @rt_null_p(i64 %t5689)
  %t5691 = icmp ne i64 %t5690, 1
  br i1 %t5691, label %then1175, label %else1176
then1175:
  %t5692 = call i64 @rt_string_length(i64 %a1)
  %t5693 = call ptr @rt_alloc_words(i64 5)
  %t5694 = ptrtoint ptr %t5693 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_941" to i64), ptr %t5693
  %t5695 = or i64 %t5694, 4
  %t5696 = getelementptr i64, ptr %t5693, i64 1
  store i64 %t5692, ptr %t5696
  %t5697 = getelementptr i64, ptr %t5693, i64 2
  store i64 %a0, ptr %t5697
  %t5698 = getelementptr i64, ptr %t5693, i64 3
  store i64 %a1, ptr %t5698
  %t5699 = getelementptr i64, ptr %t5693, i64 4
  store i64 %t5695, ptr %t5699
  %t5700 = musttail call fastcc i64 @"scheme.base:code_941"(i64 %t5695, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5700
else1176:
  %t5701 = call i64 @rt_cons(i64 %a1, i64 %t5689)
  %t5702 = load i64, ptr @"scheme.base:str-min-len"
  call void @rt_check_callable(i64 %t5702)
  %t5703 = and i64 %t5702, -8
  %t5704 = inttoptr i64 %t5703 to ptr
  %t5705 = load i64, ptr %t5704
  %t5706 = inttoptr i64 %t5705 to ptr
  %t5707 = call fastcc i64%t5706(i64 %t5702, i64 1, i64 %t5701, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5708 = call ptr @rt_alloc_words(i64 5)
  %t5709 = ptrtoint ptr %t5708 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_943" to i64), ptr %t5708
  %t5710 = or i64 %t5709, 4
  %t5711 = getelementptr i64, ptr %t5708, i64 1
  store i64 %t5707, ptr %t5711
  %t5712 = getelementptr i64, ptr %t5708, i64 2
  store i64 %a0, ptr %t5712
  %t5713 = getelementptr i64, ptr %t5708, i64 3
  store i64 %t5701, ptr %t5713
  %t5714 = getelementptr i64, ptr %t5708, i64 4
  store i64 %t5710, ptr %t5714
  %t5715 = musttail call fastcc i64 @"scheme.base:code_943"(i64 %t5710, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5715
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring-for-each"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5716 = call i64 @rt_null_p(i64 2)
  %t5717 = icmp ne i64 %t5716, 1
  br i1 %t5717, label %then1177, label %else1178
then1177:
  %t5718 = call i64 @rt_string_length(i64 %a1)
  %t5719 = call ptr @rt_alloc_words(i64 5)
  %t5720 = ptrtoint ptr %t5719 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_941" to i64), ptr %t5719
  %t5721 = or i64 %t5720, 4
  %t5722 = getelementptr i64, ptr %t5719, i64 1
  store i64 %t5718, ptr %t5722
  %t5723 = getelementptr i64, ptr %t5719, i64 2
  store i64 %a0, ptr %t5723
  %t5724 = getelementptr i64, ptr %t5719, i64 3
  store i64 %a1, ptr %t5724
  %t5725 = getelementptr i64, ptr %t5719, i64 4
  store i64 %t5721, ptr %t5725
  %t5726 = musttail call fastcc i64 @"scheme.base:code_941"(i64 %t5721, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5726
else1178:
  %t5727 = call i64 @rt_cons(i64 %a1, i64 2)
  %t5728 = load i64, ptr @"scheme.base:str-min-len"
  call void @rt_check_callable(i64 %t5728)
  %t5729 = and i64 %t5728, -8
  %t5730 = inttoptr i64 %t5729 to ptr
  %t5731 = load i64, ptr %t5730
  %t5732 = inttoptr i64 %t5731 to ptr
  %t5733 = call fastcc i64%t5732(i64 %t5728, i64 1, i64 %t5727, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5734 = call ptr @rt_alloc_words(i64 5)
  %t5735 = ptrtoint ptr %t5734 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_943" to i64), ptr %t5734
  %t5736 = or i64 %t5735, 4
  %t5737 = getelementptr i64, ptr %t5734, i64 1
  store i64 %t5733, ptr %t5737
  %t5738 = getelementptr i64, ptr %t5734, i64 2
  store i64 %a0, ptr %t5738
  %t5739 = getelementptr i64, ptr %t5734, i64 3
  store i64 %t5727, ptr %t5739
  %t5740 = getelementptr i64, ptr %t5734, i64 4
  store i64 %t5736, ptr %t5740
  %t5741 = musttail call fastcc i64 @"scheme.base:code_943"(i64 %t5736, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5741
}

define fastcc i64 @"scheme.base:code:str-min-len"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5746 = icmp eq i64 %argc, 1
  br i1 %t5746, label %argok1180, label %arityerr1179
arityerr1179:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1180:
  %t5747 = call i64 @rt_cdr(i64 %a0)
  %t5748 = call i64 @rt_null_p(i64 %t5747)
  %t5749 = icmp ne i64 %t5748, 1
  br i1 %t5749, label %then1181, label %else1182
then1181:
  %t5750 = call i64 @rt_car(i64 %a0)
  %t5751 = call i64 @rt_string_length(i64 %t5750)
  ret i64 %t5751
else1182:
  %t5752 = call i64 @rt_car(i64 %a0)
  %t5753 = call i64 @rt_string_length(i64 %t5752)
  %t5754 = call i64 @rt_cdr(i64 %a0)
  %t5755 = load i64, ptr @"scheme.base:str-min-len"
  call void @rt_check_callable(i64 %t5755)
  %t5756 = and i64 %t5755, -8
  %t5757 = inttoptr i64 %t5756 to ptr
  %t5758 = load i64, ptr %t5757
  %t5759 = inttoptr i64 %t5758 to ptr
  %t5760 = call fastcc i64%t5759(i64 %t5755, i64 1, i64 %t5754, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5761 = or i64 %t5753, %t5760
  %t5762 = and i64 %t5761, 7
  %t5763 = icmp eq i64 %t5762, 0
  br i1 %t5763, label %fixfast1183, label %fixslow1184
fixfast1183:
  %t5764 = icmp slt i64 %t5753, %t5760
  %t5765 = select i1 %t5764, i64 257, i64 1
  br label %fixmerge1185
fixslow1184:
  %t5766 = call i64 @rt_lt(i64 %t5753, i64 %t5760)
  br label %fixmerge1185
fixmerge1185:
  %t5767 = phi i64 [ %t5765, %fixfast1183 ], [ %t5766, %fixslow1184 ]
  %t5768 = icmp ne i64 %t5767, 1
  br i1 %t5768, label %then1186, label %else1187
then1186:
  ret i64 %t5753
else1187:
  ret i64 %t5760
}

define fastcc i64 @"scheme.base:code:str-nth"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5773 = icmp eq i64 %argc, 2
  br i1 %t5773, label %argok1189, label %arityerr1188
arityerr1188:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1189:
  %t5774 = call i64 @rt_null_p(i64 %a0)
  %t5775 = icmp ne i64 %t5774, 1
  br i1 %t5775, label %then1190, label %else1191
then1190:
  ret i64 2
else1191:
  %t5776 = call i64 @rt_car(i64 %a0)
  %t5777 = call i64 @rt_string_ref(i64 %t5776, i64 %a1)
  %t5778 = call i64 @rt_cdr(i64 %a0)
  %t5779 = load i64, ptr @"scheme.base:str-nth"
  call void @rt_check_callable(i64 %t5779)
  %t5780 = and i64 %t5779, -8
  %t5781 = inttoptr i64 %t5780 to ptr
  %t5782 = load i64, ptr %t5781
  %t5783 = inttoptr i64 %t5782 to ptr
  %t5784 = call fastcc i64%t5783(i64 %t5779, i64 2, i64 %t5778, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5785 = call i64 @rt_cons(i64 %t5777, i64 %t5784)
  ret i64 %t5785
}

define fastcc i64 @"scheme.base:code_969"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5790 = icmp eq i64 %argc, 1
  br i1 %t5790, label %argok1193, label %arityerr1192
arityerr1192:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1193:
  %t5791 = and i64 %self, -8
  %t5792 = inttoptr i64 %t5791 to ptr
  %t5793 = getelementptr i64, ptr %t5792, i64 1
  %t5794 = load i64, ptr %t5793
  %t5795 = or i64 %a0, %t5794
  %t5796 = and i64 %t5795, 7
  %t5797 = icmp eq i64 %t5796, 0
  br i1 %t5797, label %fixfast1194, label %fixslow1195
fixfast1194:
  %t5798 = icmp eq i64 %a0, %t5794
  %t5799 = select i1 %t5798, i64 257, i64 1
  br label %fixmerge1196
fixslow1195:
  %t5800 = call i64 @rt_num_eq(i64 %a0, i64 %t5794)
  br label %fixmerge1196
fixmerge1196:
  %t5801 = phi i64 [ %t5799, %fixfast1194 ], [ %t5800, %fixslow1195 ]
  %t5802 = icmp ne i64 %t5801, 1
  br i1 %t5802, label %then1197, label %else1198
then1197:
  %t5803 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t5803)
  %t5804 = and i64 %t5803, -8
  %t5805 = inttoptr i64 %t5804 to ptr
  %t5806 = load i64, ptr %t5805
  %t5807 = inttoptr i64 %t5806 to ptr
  %t5808 = musttail call fastcc i64 %t5807(i64 %t5803, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5808
else1198:
  %t5809 = and i64 %self, -8
  %t5810 = inttoptr i64 %t5809 to ptr
  %t5811 = getelementptr i64, ptr %t5810, i64 2
  %t5812 = load i64, ptr %t5811
  %t5813 = and i64 %self, -8
  %t5814 = inttoptr i64 %t5813 to ptr
  %t5815 = getelementptr i64, ptr %t5814, i64 3
  %t5816 = load i64, ptr %t5815
  %t5817 = call i64 @rt_string_set(i64 %t5812, i64 %a0, i64 %t5816)
  %t5818 = or i64 %a0, 8
  %t5819 = and i64 %t5818, 7
  %t5820 = icmp eq i64 %t5819, 0
  br i1 %t5820, label %fixfast1199, label %fixslow1200
fixfast1199:
  %t5821 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t5822 = extractvalue {i64, i1} %t5821, 0
  %t5823 = extractvalue {i64, i1} %t5821, 1
  br i1 %t5823, label %fixslow1200, label %fixmerge1201
fixslow1200:
  %t5824 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1201
fixmerge1201:
  %t5825 = phi i64 [ %t5822, %fixfast1199 ], [ %t5824, %fixslow1200 ]
  %t5826 = musttail call fastcc i64 @"scheme.base:code_969"(i64 %self, i64 1, i64 %t5825, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5826
}

define fastcc i64 @"scheme.base:code:string-fill!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5827 = icmp sge i64 %argc, 2
  br i1 %t5827, label %argok1203, label %arityerr1202
arityerr1202:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1203:
  %t5828 = call ptr @rt_alloc_words(i64 8)
  %t5829 = getelementptr i64, ptr %t5828, i64 0
  store i64 %a0, ptr %t5829
  %t5830 = getelementptr i64, ptr %t5828, i64 1
  store i64 %a1, ptr %t5830
  %t5831 = getelementptr i64, ptr %t5828, i64 2
  store i64 %a2, ptr %t5831
  %t5832 = getelementptr i64, ptr %t5828, i64 3
  store i64 %a3, ptr %t5832
  %t5833 = getelementptr i64, ptr %t5828, i64 4
  store i64 %a4, ptr %t5833
  %t5834 = getelementptr i64, ptr %t5828, i64 5
  store i64 %a5, ptr %t5834
  %t5835 = getelementptr i64, ptr %t5828, i64 6
  store i64 %a6, ptr %t5835
  %t5836 = getelementptr i64, ptr %t5828, i64 7
  store i64 %a7, ptr %t5836
  %t5837 = call i64 @rt_build_rest(i64 %argc, i64 2, i64 8, ptr %t5828, ptr %overflow)
  %t5838 = call i64 @rt_string_length(i64 %a0)
  %t5839 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5839)
  %t5840 = and i64 %t5839, -8
  %t5841 = inttoptr i64 %t5840 to ptr
  %t5842 = load i64, ptr %t5841
  %t5843 = inttoptr i64 %t5842 to ptr
  %t5844 = call fastcc i64%t5843(i64 %t5839, i64 1, i64 %t5837, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5845 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5845)
  %t5846 = and i64 %t5845, -8
  %t5847 = inttoptr i64 %t5846 to ptr
  %t5848 = load i64, ptr %t5847
  %t5849 = inttoptr i64 %t5848 to ptr
  %t5850 = call fastcc i64%t5849(i64 %t5845, i64 2, i64 %t5837, i64 %t5838, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5851 = call i64 @rt_intern(ptr @.str.sym.40)
  %t5852 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5852)
  %t5853 = and i64 %t5852, -8
  %t5854 = inttoptr i64 %t5853 to ptr
  %t5855 = load i64, ptr %t5854
  %t5856 = inttoptr i64 %t5855 to ptr
  %t5857 = call fastcc i64%t5856(i64 %t5852, i64 4, i64 %t5851, i64 %t5844, i64 %t5850, i64 %t5838, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5858 = call ptr @rt_alloc_words(i64 5)
  %t5859 = ptrtoint ptr %t5858 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_969" to i64), ptr %t5858
  %t5860 = or i64 %t5859, 4
  %t5861 = getelementptr i64, ptr %t5858, i64 1
  store i64 %t5850, ptr %t5861
  %t5862 = getelementptr i64, ptr %t5858, i64 2
  store i64 %a0, ptr %t5862
  %t5863 = getelementptr i64, ptr %t5858, i64 3
  store i64 %a1, ptr %t5863
  %t5864 = getelementptr i64, ptr %t5858, i64 4
  store i64 %t5860, ptr %t5864
  %t5865 = musttail call fastcc i64 @"scheme.base:code_969"(i64 %t5860, i64 1, i64 %t5844, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5865
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring-fill!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5866 = call i64 @rt_string_length(i64 %a0)
  %t5867 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t5867)
  %t5868 = and i64 %t5867, -8
  %t5869 = inttoptr i64 %t5868 to ptr
  %t5870 = load i64, ptr %t5869
  %t5871 = inttoptr i64 %t5870 to ptr
  %t5872 = call fastcc i64%t5871(i64 %t5867, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5873 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t5873)
  %t5874 = and i64 %t5873, -8
  %t5875 = inttoptr i64 %t5874 to ptr
  %t5876 = load i64, ptr %t5875
  %t5877 = inttoptr i64 %t5876 to ptr
  %t5878 = call fastcc i64%t5877(i64 %t5873, i64 2, i64 2, i64 %t5866, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5879 = call i64 @rt_intern(ptr @.str.sym.40)
  %t5880 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t5880)
  %t5881 = and i64 %t5880, -8
  %t5882 = inttoptr i64 %t5881 to ptr
  %t5883 = load i64, ptr %t5882
  %t5884 = inttoptr i64 %t5883 to ptr
  %t5885 = call fastcc i64%t5884(i64 %t5880, i64 4, i64 %t5879, i64 %t5872, i64 %t5878, i64 %t5866, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t5886 = call ptr @rt_alloc_words(i64 5)
  %t5887 = ptrtoint ptr %t5886 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_969" to i64), ptr %t5886
  %t5888 = or i64 %t5887, 4
  %t5889 = getelementptr i64, ptr %t5886, i64 1
  store i64 %t5878, ptr %t5889
  %t5890 = getelementptr i64, ptr %t5886, i64 2
  store i64 %a0, ptr %t5890
  %t5891 = getelementptr i64, ptr %t5886, i64 3
  store i64 %a1, ptr %t5891
  %t5892 = getelementptr i64, ptr %t5886, i64 4
  store i64 %t5888, ptr %t5892
  %t5893 = musttail call fastcc i64 @"scheme.base:code_969"(i64 %t5888, i64 1, i64 %t5872, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5893
}

define fastcc i64 @"scheme.base:code_995"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5898 = icmp eq i64 %argc, 1
  br i1 %t5898, label %argok1205, label %arityerr1204
arityerr1204:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1205:
  %t5899 = or i64 %a0, 0
  %t5900 = and i64 %t5899, 7
  %t5901 = icmp eq i64 %t5900, 0
  br i1 %t5901, label %fixfast1206, label %fixslow1207
fixfast1206:
  %t5902 = icmp slt i64 %a0, 0
  %t5903 = select i1 %t5902, i64 257, i64 1
  br label %fixmerge1208
fixslow1207:
  %t5904 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge1208
fixmerge1208:
  %t5905 = phi i64 [ %t5903, %fixfast1206 ], [ %t5904, %fixslow1207 ]
  %t5906 = icmp ne i64 %t5905, 1
  br i1 %t5906, label %then1209, label %else1210
then1209:
  %t5907 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t5907)
  %t5908 = and i64 %t5907, -8
  %t5909 = inttoptr i64 %t5908 to ptr
  %t5910 = load i64, ptr %t5909
  %t5911 = inttoptr i64 %t5910 to ptr
  %t5912 = musttail call fastcc i64 %t5911(i64 %t5907, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5912
else1210:
  %t5913 = and i64 %self, -8
  %t5914 = inttoptr i64 %t5913 to ptr
  %t5915 = getelementptr i64, ptr %t5914, i64 1
  %t5916 = load i64, ptr %t5915
  %t5917 = and i64 %self, -8
  %t5918 = inttoptr i64 %t5917 to ptr
  %t5919 = getelementptr i64, ptr %t5918, i64 2
  %t5920 = load i64, ptr %t5919
  %t5921 = or i64 %t5920, %a0
  %t5922 = and i64 %t5921, 7
  %t5923 = icmp eq i64 %t5922, 0
  br i1 %t5923, label %fixfast1211, label %fixslow1212
fixfast1211:
  %t5924 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5920, i64 %a0)
  %t5925 = extractvalue {i64, i1} %t5924, 0
  %t5926 = extractvalue {i64, i1} %t5924, 1
  br i1 %t5926, label %fixslow1212, label %fixmerge1213
fixslow1212:
  %t5927 = call i64 @rt_add(i64 %t5920, i64 %a0)
  br label %fixmerge1213
fixmerge1213:
  %t5928 = phi i64 [ %t5925, %fixfast1211 ], [ %t5927, %fixslow1212 ]
  %t5929 = and i64 %self, -8
  %t5930 = inttoptr i64 %t5929 to ptr
  %t5931 = getelementptr i64, ptr %t5930, i64 3
  %t5932 = load i64, ptr %t5931
  %t5933 = and i64 %self, -8
  %t5934 = inttoptr i64 %t5933 to ptr
  %t5935 = getelementptr i64, ptr %t5934, i64 4
  %t5936 = load i64, ptr %t5935
  %t5937 = or i64 %t5936, %a0
  %t5938 = and i64 %t5937, 7
  %t5939 = icmp eq i64 %t5938, 0
  br i1 %t5939, label %fixfast1214, label %fixslow1215
fixfast1214:
  %t5940 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5936, i64 %a0)
  %t5941 = extractvalue {i64, i1} %t5940, 0
  %t5942 = extractvalue {i64, i1} %t5940, 1
  br i1 %t5942, label %fixslow1215, label %fixmerge1216
fixslow1215:
  %t5943 = call i64 @rt_add(i64 %t5936, i64 %a0)
  br label %fixmerge1216
fixmerge1216:
  %t5944 = phi i64 [ %t5941, %fixfast1214 ], [ %t5943, %fixslow1215 ]
  %t5945 = call i64 @rt_string_ref(i64 %t5932, i64 %t5944)
  %t5946 = call i64 @rt_string_set(i64 %t5916, i64 %t5928, i64 %t5945)
  %t5947 = or i64 %a0, 8
  %t5948 = and i64 %t5947, 7
  %t5949 = icmp eq i64 %t5948, 0
  br i1 %t5949, label %fixfast1217, label %fixslow1218
fixfast1217:
  %t5950 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t5951 = extractvalue {i64, i1} %t5950, 0
  %t5952 = extractvalue {i64, i1} %t5950, 1
  br i1 %t5952, label %fixslow1218, label %fixmerge1219
fixslow1218:
  %t5953 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge1219
fixmerge1219:
  %t5954 = phi i64 [ %t5951, %fixfast1217 ], [ %t5953, %fixslow1218 ]
  %t5955 = musttail call fastcc i64 @"scheme.base:code_995"(i64 %self, i64 1, i64 %t5954, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5955
}

define fastcc i64 @"scheme.base:code_997"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t5956 = icmp eq i64 %argc, 1
  br i1 %t5956, label %argok1221, label %arityerr1220
arityerr1220:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1221:
  %t5957 = and i64 %self, -8
  %t5958 = inttoptr i64 %t5957 to ptr
  %t5959 = getelementptr i64, ptr %t5958, i64 1
  %t5960 = load i64, ptr %t5959
  %t5961 = and i64 %self, -8
  %t5962 = inttoptr i64 %t5961 to ptr
  %t5963 = getelementptr i64, ptr %t5962, i64 2
  %t5964 = load i64, ptr %t5963
  %t5965 = or i64 %t5960, %t5964
  %t5966 = and i64 %t5965, 7
  %t5967 = icmp eq i64 %t5966, 0
  br i1 %t5967, label %fixfast1222, label %fixslow1223
fixfast1222:
  %t5968 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t5960, i64 %t5964)
  %t5969 = extractvalue {i64, i1} %t5968, 0
  %t5970 = extractvalue {i64, i1} %t5968, 1
  br i1 %t5970, label %fixslow1223, label %fixmerge1224
fixslow1223:
  %t5971 = call i64 @rt_sub(i64 %t5960, i64 %t5964)
  br label %fixmerge1224
fixmerge1224:
  %t5972 = phi i64 [ %t5969, %fixfast1222 ], [ %t5971, %fixslow1223 ]
  %t5973 = or i64 %a0, %t5972
  %t5974 = and i64 %t5973, 7
  %t5975 = icmp eq i64 %t5974, 0
  br i1 %t5975, label %fixfast1225, label %fixslow1226
fixfast1225:
  %t5976 = icmp eq i64 %a0, %t5972
  %t5977 = select i1 %t5976, i64 257, i64 1
  br label %fixmerge1227
fixslow1226:
  %t5978 = call i64 @rt_num_eq(i64 %a0, i64 %t5972)
  br label %fixmerge1227
fixmerge1227:
  %t5979 = phi i64 [ %t5977, %fixfast1225 ], [ %t5978, %fixslow1226 ]
  %t5980 = icmp ne i64 %t5979, 1
  br i1 %t5980, label %then1228, label %else1229
then1228:
  %t5981 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t5981)
  %t5982 = and i64 %t5981, -8
  %t5983 = inttoptr i64 %t5982 to ptr
  %t5984 = load i64, ptr %t5983
  %t5985 = inttoptr i64 %t5984 to ptr
  %t5986 = musttail call fastcc i64 %t5985(i64 %t5981, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t5986
else1229:
  %t5987 = and i64 %self, -8
  %t5988 = inttoptr i64 %t5987 to ptr
  %t5989 = getelementptr i64, ptr %t5988, i64 3
  %t5990 = load i64, ptr %t5989
  %t5991 = and i64 %self, -8
  %t5992 = inttoptr i64 %t5991 to ptr
  %t5993 = getelementptr i64, ptr %t5992, i64 4
  %t5994 = load i64, ptr %t5993
  %t5995 = or i64 %t5994, %a0
  %t5996 = and i64 %t5995, 7
  %t5997 = icmp eq i64 %t5996, 0
  br i1 %t5997, label %fixfast1230, label %fixslow1231
fixfast1230:
  %t5998 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t5994, i64 %a0)
  %t5999 = extractvalue {i64, i1} %t5998, 0
  %t6000 = extractvalue {i64, i1} %t5998, 1
  br i1 %t6000, label %fixslow1231, label %fixmerge1232
fixslow1231:
  %t6001 = call i64 @rt_add(i64 %t5994, i64 %a0)
  br label %fixmerge1232
fixmerge1232:
  %t6002 = phi i64 [ %t5999, %fixfast1230 ], [ %t6001, %fixslow1231 ]
  %t6003 = and i64 %self, -8
  %t6004 = inttoptr i64 %t6003 to ptr
  %t6005 = getelementptr i64, ptr %t6004, i64 5
  %t6006 = load i64, ptr %t6005
  %t6007 = and i64 %self, -8
  %t6008 = inttoptr i64 %t6007 to ptr
  %t6009 = getelementptr i64, ptr %t6008, i64 2
  %t6010 = load i64, ptr %t6009
  %t6011 = or i64 %t6010, %a0
  %t6012 = and i64 %t6011, 7
  %t6013 = icmp eq i64 %t6012, 0
  br i1 %t6013, label %fixfast1233, label %fixslow1234
fixfast1233:
  %t6014 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6010, i64 %a0)
  %t6015 = extractvalue {i64, i1} %t6014, 0
  %t6016 = extractvalue {i64, i1} %t6014, 1
  br i1 %t6016, label %fixslow1234, label %fixmerge1235
fixslow1234:
  %t6017 = call i64 @rt_add(i64 %t6010, i64 %a0)
  br label %fixmerge1235
fixmerge1235:
  %t6018 = phi i64 [ %t6015, %fixfast1233 ], [ %t6017, %fixslow1234 ]
  %t6019 = call i64 @rt_string_ref(i64 %t6006, i64 %t6018)
  %t6020 = call i64 @rt_string_set(i64 %t5990, i64 %t6002, i64 %t6019)
  %t6021 = or i64 %a0, 8
  %t6022 = and i64 %t6021, 7
  %t6023 = icmp eq i64 %t6022, 0
  br i1 %t6023, label %fixfast1236, label %fixslow1237
fixfast1236:
  %t6024 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t6025 = extractvalue {i64, i1} %t6024, 0
  %t6026 = extractvalue {i64, i1} %t6024, 1
  br i1 %t6026, label %fixslow1237, label %fixmerge1238
fixslow1237:
  %t6027 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1238
fixmerge1238:
  %t6028 = phi i64 [ %t6025, %fixfast1236 ], [ %t6027, %fixslow1237 ]
  %t6029 = musttail call fastcc i64 @"scheme.base:code_997"(i64 %self, i64 1, i64 %t6028, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6029
}

define fastcc i64 @"scheme.base:code:string-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6030 = icmp sge i64 %argc, 3
  br i1 %t6030, label %argok1240, label %arityerr1239
arityerr1239:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1240:
  %t6031 = call ptr @rt_alloc_words(i64 8)
  %t6032 = getelementptr i64, ptr %t6031, i64 0
  store i64 %a0, ptr %t6032
  %t6033 = getelementptr i64, ptr %t6031, i64 1
  store i64 %a1, ptr %t6033
  %t6034 = getelementptr i64, ptr %t6031, i64 2
  store i64 %a2, ptr %t6034
  %t6035 = getelementptr i64, ptr %t6031, i64 3
  store i64 %a3, ptr %t6035
  %t6036 = getelementptr i64, ptr %t6031, i64 4
  store i64 %a4, ptr %t6036
  %t6037 = getelementptr i64, ptr %t6031, i64 5
  store i64 %a5, ptr %t6037
  %t6038 = getelementptr i64, ptr %t6031, i64 6
  store i64 %a6, ptr %t6038
  %t6039 = getelementptr i64, ptr %t6031, i64 7
  store i64 %a7, ptr %t6039
  %t6040 = call i64 @rt_build_rest(i64 %argc, i64 3, i64 8, ptr %t6031, ptr %overflow)
  %t6041 = call i64 @rt_string_length(i64 %a2)
  %t6042 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t6042)
  %t6043 = and i64 %t6042, -8
  %t6044 = inttoptr i64 %t6043 to ptr
  %t6045 = load i64, ptr %t6044
  %t6046 = inttoptr i64 %t6045 to ptr
  %t6047 = call fastcc i64%t6046(i64 %t6042, i64 1, i64 %t6040, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6048 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t6048)
  %t6049 = and i64 %t6048, -8
  %t6050 = inttoptr i64 %t6049 to ptr
  %t6051 = load i64, ptr %t6050
  %t6052 = inttoptr i64 %t6051 to ptr
  %t6053 = call fastcc i64%t6052(i64 %t6048, i64 2, i64 %t6040, i64 %t6041, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6054 = call i64 @rt_intern(ptr @.str.sym.41)
  %t6055 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6055)
  %t6056 = and i64 %t6055, -8
  %t6057 = inttoptr i64 %t6056 to ptr
  %t6058 = load i64, ptr %t6057
  %t6059 = inttoptr i64 %t6058 to ptr
  %t6060 = call fastcc i64%t6059(i64 %t6055, i64 4, i64 %t6054, i64 %t6047, i64 %t6053, i64 %t6041, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6061 = call i64 @rt_intern(ptr @.str.sym.41)
  %t6062 = or i64 %t6053, %t6047
  %t6063 = and i64 %t6062, 7
  %t6064 = icmp eq i64 %t6063, 0
  br i1 %t6064, label %fixfast1241, label %fixslow1242
fixfast1241:
  %t6065 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6053, i64 %t6047)
  %t6066 = extractvalue {i64, i1} %t6065, 0
  %t6067 = extractvalue {i64, i1} %t6065, 1
  br i1 %t6067, label %fixslow1242, label %fixmerge1243
fixslow1242:
  %t6068 = call i64 @rt_sub(i64 %t6053, i64 %t6047)
  br label %fixmerge1243
fixmerge1243:
  %t6069 = phi i64 [ %t6066, %fixfast1241 ], [ %t6068, %fixslow1242 ]
  %t6070 = or i64 %a1, %t6069
  %t6071 = and i64 %t6070, 7
  %t6072 = icmp eq i64 %t6071, 0
  br i1 %t6072, label %fixfast1244, label %fixslow1245
fixfast1244:
  %t6073 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t6069)
  %t6074 = extractvalue {i64, i1} %t6073, 0
  %t6075 = extractvalue {i64, i1} %t6073, 1
  br i1 %t6075, label %fixslow1245, label %fixmerge1246
fixslow1245:
  %t6076 = call i64 @rt_add(i64 %a1, i64 %t6069)
  br label %fixmerge1246
fixmerge1246:
  %t6077 = phi i64 [ %t6074, %fixfast1244 ], [ %t6076, %fixslow1245 ]
  %t6078 = call i64 @rt_string_length(i64 %a0)
  %t6079 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6079)
  %t6080 = and i64 %t6079, -8
  %t6081 = inttoptr i64 %t6080 to ptr
  %t6082 = load i64, ptr %t6081
  %t6083 = inttoptr i64 %t6082 to ptr
  %t6084 = call fastcc i64%t6083(i64 %t6079, i64 4, i64 %t6061, i64 %a1, i64 %t6077, i64 %t6078, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6085 = or i64 %t6047, %a1
  %t6086 = and i64 %t6085, 7
  %t6087 = icmp eq i64 %t6086, 0
  br i1 %t6087, label %fixfast1247, label %fixslow1248
fixfast1247:
  %t6088 = icmp slt i64 %t6047, %a1
  %t6089 = select i1 %t6088, i64 257, i64 1
  br label %fixmerge1249
fixslow1248:
  %t6090 = call i64 @rt_lt(i64 %t6047, i64 %a1)
  br label %fixmerge1249
fixmerge1249:
  %t6091 = phi i64 [ %t6089, %fixfast1247 ], [ %t6090, %fixslow1248 ]
  %t6092 = icmp ne i64 %t6091, 1
  br i1 %t6092, label %then1250, label %else1251
then1250:
  %t6093 = call ptr @rt_alloc_words(i64 6)
  %t6094 = ptrtoint ptr %t6093 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_995" to i64), ptr %t6093
  %t6095 = or i64 %t6094, 4
  %t6096 = getelementptr i64, ptr %t6093, i64 1
  store i64 %a0, ptr %t6096
  %t6097 = getelementptr i64, ptr %t6093, i64 2
  store i64 %a1, ptr %t6097
  %t6098 = getelementptr i64, ptr %t6093, i64 3
  store i64 %a2, ptr %t6098
  %t6099 = getelementptr i64, ptr %t6093, i64 4
  store i64 %t6047, ptr %t6099
  %t6100 = getelementptr i64, ptr %t6093, i64 5
  store i64 %t6095, ptr %t6100
  %t6101 = or i64 %t6053, %t6047
  %t6102 = and i64 %t6101, 7
  %t6103 = icmp eq i64 %t6102, 0
  br i1 %t6103, label %fixfast1252, label %fixslow1253
fixfast1252:
  %t6104 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6053, i64 %t6047)
  %t6105 = extractvalue {i64, i1} %t6104, 0
  %t6106 = extractvalue {i64, i1} %t6104, 1
  br i1 %t6106, label %fixslow1253, label %fixmerge1254
fixslow1253:
  %t6107 = call i64 @rt_sub(i64 %t6053, i64 %t6047)
  br label %fixmerge1254
fixmerge1254:
  %t6108 = phi i64 [ %t6105, %fixfast1252 ], [ %t6107, %fixslow1253 ]
  %t6109 = or i64 %t6108, 8
  %t6110 = and i64 %t6109, 7
  %t6111 = icmp eq i64 %t6110, 0
  br i1 %t6111, label %fixfast1255, label %fixslow1256
fixfast1255:
  %t6112 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6108, i64 8)
  %t6113 = extractvalue {i64, i1} %t6112, 0
  %t6114 = extractvalue {i64, i1} %t6112, 1
  br i1 %t6114, label %fixslow1256, label %fixmerge1257
fixslow1256:
  %t6115 = call i64 @rt_sub(i64 %t6108, i64 8)
  br label %fixmerge1257
fixmerge1257:
  %t6116 = phi i64 [ %t6113, %fixfast1255 ], [ %t6115, %fixslow1256 ]
  %t6117 = musttail call fastcc i64 @"scheme.base:code_995"(i64 %t6095, i64 1, i64 %t6116, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6117
else1251:
  %t6118 = call ptr @rt_alloc_words(i64 7)
  %t6119 = ptrtoint ptr %t6118 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_997" to i64), ptr %t6118
  %t6120 = or i64 %t6119, 4
  %t6121 = getelementptr i64, ptr %t6118, i64 1
  store i64 %t6053, ptr %t6121
  %t6122 = getelementptr i64, ptr %t6118, i64 2
  store i64 %t6047, ptr %t6122
  %t6123 = getelementptr i64, ptr %t6118, i64 3
  store i64 %a0, ptr %t6123
  %t6124 = getelementptr i64, ptr %t6118, i64 4
  store i64 %a1, ptr %t6124
  %t6125 = getelementptr i64, ptr %t6118, i64 5
  store i64 %a2, ptr %t6125
  %t6126 = getelementptr i64, ptr %t6118, i64 6
  store i64 %t6120, ptr %t6126
  %t6127 = musttail call fastcc i64 @"scheme.base:code_997"(i64 %t6120, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6127
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cstring-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6128 = call i64 @rt_string_length(i64 %a2)
  %t6129 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t6129)
  %t6130 = and i64 %t6129, -8
  %t6131 = inttoptr i64 %t6130 to ptr
  %t6132 = load i64, ptr %t6131
  %t6133 = inttoptr i64 %t6132 to ptr
  %t6134 = call fastcc i64%t6133(i64 %t6129, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6135 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t6135)
  %t6136 = and i64 %t6135, -8
  %t6137 = inttoptr i64 %t6136 to ptr
  %t6138 = load i64, ptr %t6137
  %t6139 = inttoptr i64 %t6138 to ptr
  %t6140 = call fastcc i64%t6139(i64 %t6135, i64 2, i64 2, i64 %t6128, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6141 = call i64 @rt_intern(ptr @.str.sym.41)
  %t6142 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6142)
  %t6143 = and i64 %t6142, -8
  %t6144 = inttoptr i64 %t6143 to ptr
  %t6145 = load i64, ptr %t6144
  %t6146 = inttoptr i64 %t6145 to ptr
  %t6147 = call fastcc i64%t6146(i64 %t6142, i64 4, i64 %t6141, i64 %t6134, i64 %t6140, i64 %t6128, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6148 = call i64 @rt_intern(ptr @.str.sym.41)
  %t6149 = or i64 %t6140, %t6134
  %t6150 = and i64 %t6149, 7
  %t6151 = icmp eq i64 %t6150, 0
  br i1 %t6151, label %fixfast1258, label %fixslow1259
fixfast1258:
  %t6152 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6140, i64 %t6134)
  %t6153 = extractvalue {i64, i1} %t6152, 0
  %t6154 = extractvalue {i64, i1} %t6152, 1
  br i1 %t6154, label %fixslow1259, label %fixmerge1260
fixslow1259:
  %t6155 = call i64 @rt_sub(i64 %t6140, i64 %t6134)
  br label %fixmerge1260
fixmerge1260:
  %t6156 = phi i64 [ %t6153, %fixfast1258 ], [ %t6155, %fixslow1259 ]
  %t6157 = or i64 %a1, %t6156
  %t6158 = and i64 %t6157, 7
  %t6159 = icmp eq i64 %t6158, 0
  br i1 %t6159, label %fixfast1261, label %fixslow1262
fixfast1261:
  %t6160 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t6156)
  %t6161 = extractvalue {i64, i1} %t6160, 0
  %t6162 = extractvalue {i64, i1} %t6160, 1
  br i1 %t6162, label %fixslow1262, label %fixmerge1263
fixslow1262:
  %t6163 = call i64 @rt_add(i64 %a1, i64 %t6156)
  br label %fixmerge1263
fixmerge1263:
  %t6164 = phi i64 [ %t6161, %fixfast1261 ], [ %t6163, %fixslow1262 ]
  %t6165 = call i64 @rt_string_length(i64 %a0)
  %t6166 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6166)
  %t6167 = and i64 %t6166, -8
  %t6168 = inttoptr i64 %t6167 to ptr
  %t6169 = load i64, ptr %t6168
  %t6170 = inttoptr i64 %t6169 to ptr
  %t6171 = call fastcc i64%t6170(i64 %t6166, i64 4, i64 %t6148, i64 %a1, i64 %t6164, i64 %t6165, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6172 = or i64 %t6134, %a1
  %t6173 = and i64 %t6172, 7
  %t6174 = icmp eq i64 %t6173, 0
  br i1 %t6174, label %fixfast1264, label %fixslow1265
fixfast1264:
  %t6175 = icmp slt i64 %t6134, %a1
  %t6176 = select i1 %t6175, i64 257, i64 1
  br label %fixmerge1266
fixslow1265:
  %t6177 = call i64 @rt_lt(i64 %t6134, i64 %a1)
  br label %fixmerge1266
fixmerge1266:
  %t6178 = phi i64 [ %t6176, %fixfast1264 ], [ %t6177, %fixslow1265 ]
  %t6179 = icmp ne i64 %t6178, 1
  br i1 %t6179, label %then1267, label %else1268
then1267:
  %t6180 = call ptr @rt_alloc_words(i64 6)
  %t6181 = ptrtoint ptr %t6180 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_995" to i64), ptr %t6180
  %t6182 = or i64 %t6181, 4
  %t6183 = getelementptr i64, ptr %t6180, i64 1
  store i64 %a0, ptr %t6183
  %t6184 = getelementptr i64, ptr %t6180, i64 2
  store i64 %a1, ptr %t6184
  %t6185 = getelementptr i64, ptr %t6180, i64 3
  store i64 %a2, ptr %t6185
  %t6186 = getelementptr i64, ptr %t6180, i64 4
  store i64 %t6134, ptr %t6186
  %t6187 = getelementptr i64, ptr %t6180, i64 5
  store i64 %t6182, ptr %t6187
  %t6188 = or i64 %t6140, %t6134
  %t6189 = and i64 %t6188, 7
  %t6190 = icmp eq i64 %t6189, 0
  br i1 %t6190, label %fixfast1269, label %fixslow1270
fixfast1269:
  %t6191 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6140, i64 %t6134)
  %t6192 = extractvalue {i64, i1} %t6191, 0
  %t6193 = extractvalue {i64, i1} %t6191, 1
  br i1 %t6193, label %fixslow1270, label %fixmerge1271
fixslow1270:
  %t6194 = call i64 @rt_sub(i64 %t6140, i64 %t6134)
  br label %fixmerge1271
fixmerge1271:
  %t6195 = phi i64 [ %t6192, %fixfast1269 ], [ %t6194, %fixslow1270 ]
  %t6196 = or i64 %t6195, 8
  %t6197 = and i64 %t6196, 7
  %t6198 = icmp eq i64 %t6197, 0
  br i1 %t6198, label %fixfast1272, label %fixslow1273
fixfast1272:
  %t6199 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6195, i64 8)
  %t6200 = extractvalue {i64, i1} %t6199, 0
  %t6201 = extractvalue {i64, i1} %t6199, 1
  br i1 %t6201, label %fixslow1273, label %fixmerge1274
fixslow1273:
  %t6202 = call i64 @rt_sub(i64 %t6195, i64 8)
  br label %fixmerge1274
fixmerge1274:
  %t6203 = phi i64 [ %t6200, %fixfast1272 ], [ %t6202, %fixslow1273 ]
  %t6204 = musttail call fastcc i64 @"scheme.base:code_995"(i64 %t6182, i64 1, i64 %t6203, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6204
else1268:
  %t6205 = call ptr @rt_alloc_words(i64 7)
  %t6206 = ptrtoint ptr %t6205 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_997" to i64), ptr %t6205
  %t6207 = or i64 %t6206, 4
  %t6208 = getelementptr i64, ptr %t6205, i64 1
  store i64 %t6140, ptr %t6208
  %t6209 = getelementptr i64, ptr %t6205, i64 2
  store i64 %t6134, ptr %t6209
  %t6210 = getelementptr i64, ptr %t6205, i64 3
  store i64 %a0, ptr %t6210
  %t6211 = getelementptr i64, ptr %t6205, i64 4
  store i64 %a1, ptr %t6211
  %t6212 = getelementptr i64, ptr %t6205, i64 5
  store i64 %a2, ptr %t6212
  %t6213 = getelementptr i64, ptr %t6205, i64 6
  store i64 %t6207, ptr %t6213
  %t6214 = musttail call fastcc i64 @"scheme.base:code_997"(i64 %t6207, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6214
}

define fastcc i64 @"scheme.base:code_1012"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6219 = icmp eq i64 %argc, 1
  br i1 %t6219, label %argok1276, label %arityerr1275
arityerr1275:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1276:
  %t6220 = and i64 %self, -8
  %t6221 = inttoptr i64 %t6220 to ptr
  %t6222 = getelementptr i64, ptr %t6221, i64 1
  %t6223 = load i64, ptr %t6222
  %t6224 = or i64 %a0, %t6223
  %t6225 = and i64 %t6224, 7
  %t6226 = icmp eq i64 %t6225, 0
  br i1 %t6226, label %fixfast1277, label %fixslow1278
fixfast1277:
  %t6227 = icmp eq i64 %a0, %t6223
  %t6228 = select i1 %t6227, i64 257, i64 1
  br label %fixmerge1279
fixslow1278:
  %t6229 = call i64 @rt_num_eq(i64 %a0, i64 %t6223)
  br label %fixmerge1279
fixmerge1279:
  %t6230 = phi i64 [ %t6228, %fixfast1277 ], [ %t6229, %fixslow1278 ]
  %t6231 = icmp ne i64 %t6230, 1
  br i1 %t6231, label %then1280, label %else1281
then1280:
  %t6232 = and i64 %self, -8
  %t6233 = inttoptr i64 %t6232 to ptr
  %t6234 = getelementptr i64, ptr %t6233, i64 2
  %t6235 = load i64, ptr %t6234
  ret i64 %t6235
else1281:
  %t6236 = and i64 %self, -8
  %t6237 = inttoptr i64 %t6236 to ptr
  %t6238 = getelementptr i64, ptr %t6237, i64 2
  %t6239 = load i64, ptr %t6238
  %t6240 = and i64 %self, -8
  %t6241 = inttoptr i64 %t6240 to ptr
  %t6242 = getelementptr i64, ptr %t6241, i64 3
  %t6243 = load i64, ptr %t6242
  %t6244 = or i64 %a0, %t6243
  %t6245 = and i64 %t6244, 7
  %t6246 = icmp eq i64 %t6245, 0
  br i1 %t6246, label %fixfast1282, label %fixslow1283
fixfast1282:
  %t6247 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t6243)
  %t6248 = extractvalue {i64, i1} %t6247, 0
  %t6249 = extractvalue {i64, i1} %t6247, 1
  br i1 %t6249, label %fixslow1283, label %fixmerge1284
fixslow1283:
  %t6250 = call i64 @rt_sub(i64 %a0, i64 %t6243)
  br label %fixmerge1284
fixmerge1284:
  %t6251 = phi i64 [ %t6248, %fixfast1282 ], [ %t6250, %fixslow1283 ]
  %t6252 = and i64 %self, -8
  %t6253 = inttoptr i64 %t6252 to ptr
  %t6254 = getelementptr i64, ptr %t6253, i64 4
  %t6255 = load i64, ptr %t6254
  %t6256 = call i64 @rt_bytevector_u8_ref(i64 %t6255, i64 %a0)
  %t6257 = call i64 @rt_bytevector_u8_set(i64 %t6239, i64 %t6251, i64 %t6256)
  %t6258 = or i64 %a0, 8
  %t6259 = and i64 %t6258, 7
  %t6260 = icmp eq i64 %t6259, 0
  br i1 %t6260, label %fixfast1285, label %fixslow1286
fixfast1285:
  %t6261 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t6262 = extractvalue {i64, i1} %t6261, 0
  %t6263 = extractvalue {i64, i1} %t6261, 1
  br i1 %t6263, label %fixslow1286, label %fixmerge1287
fixslow1286:
  %t6264 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1287
fixmerge1287:
  %t6265 = phi i64 [ %t6262, %fixfast1285 ], [ %t6264, %fixslow1286 ]
  %t6266 = musttail call fastcc i64 @"scheme.base:code_1012"(i64 %self, i64 1, i64 %t6265, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6266
}

define fastcc i64 @"scheme.base:code:bytevector-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6267 = icmp sge i64 %argc, 1
  br i1 %t6267, label %argok1289, label %arityerr1288
arityerr1288:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1289:
  %t6268 = call ptr @rt_alloc_words(i64 8)
  %t6269 = getelementptr i64, ptr %t6268, i64 0
  store i64 %a0, ptr %t6269
  %t6270 = getelementptr i64, ptr %t6268, i64 1
  store i64 %a1, ptr %t6270
  %t6271 = getelementptr i64, ptr %t6268, i64 2
  store i64 %a2, ptr %t6271
  %t6272 = getelementptr i64, ptr %t6268, i64 3
  store i64 %a3, ptr %t6272
  %t6273 = getelementptr i64, ptr %t6268, i64 4
  store i64 %a4, ptr %t6273
  %t6274 = getelementptr i64, ptr %t6268, i64 5
  store i64 %a5, ptr %t6274
  %t6275 = getelementptr i64, ptr %t6268, i64 6
  store i64 %a6, ptr %t6275
  %t6276 = getelementptr i64, ptr %t6268, i64 7
  store i64 %a7, ptr %t6276
  %t6277 = call i64 @rt_build_rest(i64 %argc, i64 1, i64 8, ptr %t6268, ptr %overflow)
  %t6278 = call i64 @rt_bytevector_length(i64 %a0)
  %t6279 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t6279)
  %t6280 = and i64 %t6279, -8
  %t6281 = inttoptr i64 %t6280 to ptr
  %t6282 = load i64, ptr %t6281
  %t6283 = inttoptr i64 %t6282 to ptr
  %t6284 = call fastcc i64%t6283(i64 %t6279, i64 1, i64 %t6277, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6285 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t6285)
  %t6286 = and i64 %t6285, -8
  %t6287 = inttoptr i64 %t6286 to ptr
  %t6288 = load i64, ptr %t6287
  %t6289 = inttoptr i64 %t6288 to ptr
  %t6290 = call fastcc i64%t6289(i64 %t6285, i64 2, i64 %t6277, i64 %t6278, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6291 = call i64 @rt_intern(ptr @.str.sym.42)
  %t6292 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6292)
  %t6293 = and i64 %t6292, -8
  %t6294 = inttoptr i64 %t6293 to ptr
  %t6295 = load i64, ptr %t6294
  %t6296 = inttoptr i64 %t6295 to ptr
  %t6297 = call fastcc i64%t6296(i64 %t6292, i64 4, i64 %t6291, i64 %t6284, i64 %t6290, i64 %t6278, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6298 = or i64 %t6290, %t6284
  %t6299 = and i64 %t6298, 7
  %t6300 = icmp eq i64 %t6299, 0
  br i1 %t6300, label %fixfast1290, label %fixslow1291
fixfast1290:
  %t6301 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6290, i64 %t6284)
  %t6302 = extractvalue {i64, i1} %t6301, 0
  %t6303 = extractvalue {i64, i1} %t6301, 1
  br i1 %t6303, label %fixslow1291, label %fixmerge1292
fixslow1291:
  %t6304 = call i64 @rt_sub(i64 %t6290, i64 %t6284)
  br label %fixmerge1292
fixmerge1292:
  %t6305 = phi i64 [ %t6302, %fixfast1290 ], [ %t6304, %fixslow1291 ]
  %t6306 = call i64 @rt_make_bytevector(i64 %t6305, i64 0)
  %t6307 = call ptr @rt_alloc_words(i64 6)
  %t6308 = ptrtoint ptr %t6307 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1012" to i64), ptr %t6307
  %t6309 = or i64 %t6308, 4
  %t6310 = getelementptr i64, ptr %t6307, i64 1
  store i64 %t6290, ptr %t6310
  %t6311 = getelementptr i64, ptr %t6307, i64 2
  store i64 %t6306, ptr %t6311
  %t6312 = getelementptr i64, ptr %t6307, i64 3
  store i64 %t6284, ptr %t6312
  %t6313 = getelementptr i64, ptr %t6307, i64 4
  store i64 %a0, ptr %t6313
  %t6314 = getelementptr i64, ptr %t6307, i64 5
  store i64 %t6309, ptr %t6314
  %t6315 = musttail call fastcc i64 @"scheme.base:code_1012"(i64 %t6309, i64 1, i64 %t6284, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6315
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cbytevector-copy"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6316 = call i64 @rt_bytevector_length(i64 %a0)
  %t6317 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t6317)
  %t6318 = and i64 %t6317, -8
  %t6319 = inttoptr i64 %t6318 to ptr
  %t6320 = load i64, ptr %t6319
  %t6321 = inttoptr i64 %t6320 to ptr
  %t6322 = call fastcc i64%t6321(i64 %t6317, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6323 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t6323)
  %t6324 = and i64 %t6323, -8
  %t6325 = inttoptr i64 %t6324 to ptr
  %t6326 = load i64, ptr %t6325
  %t6327 = inttoptr i64 %t6326 to ptr
  %t6328 = call fastcc i64%t6327(i64 %t6323, i64 2, i64 2, i64 %t6316, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6329 = call i64 @rt_intern(ptr @.str.sym.42)
  %t6330 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6330)
  %t6331 = and i64 %t6330, -8
  %t6332 = inttoptr i64 %t6331 to ptr
  %t6333 = load i64, ptr %t6332
  %t6334 = inttoptr i64 %t6333 to ptr
  %t6335 = call fastcc i64%t6334(i64 %t6330, i64 4, i64 %t6329, i64 %t6322, i64 %t6328, i64 %t6316, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6336 = or i64 %t6328, %t6322
  %t6337 = and i64 %t6336, 7
  %t6338 = icmp eq i64 %t6337, 0
  br i1 %t6338, label %fixfast1293, label %fixslow1294
fixfast1293:
  %t6339 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6328, i64 %t6322)
  %t6340 = extractvalue {i64, i1} %t6339, 0
  %t6341 = extractvalue {i64, i1} %t6339, 1
  br i1 %t6341, label %fixslow1294, label %fixmerge1295
fixslow1294:
  %t6342 = call i64 @rt_sub(i64 %t6328, i64 %t6322)
  br label %fixmerge1295
fixmerge1295:
  %t6343 = phi i64 [ %t6340, %fixfast1293 ], [ %t6342, %fixslow1294 ]
  %t6344 = call i64 @rt_make_bytevector(i64 %t6343, i64 0)
  %t6345 = call ptr @rt_alloc_words(i64 6)
  %t6346 = ptrtoint ptr %t6345 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1012" to i64), ptr %t6345
  %t6347 = or i64 %t6346, 4
  %t6348 = getelementptr i64, ptr %t6345, i64 1
  store i64 %t6328, ptr %t6348
  %t6349 = getelementptr i64, ptr %t6345, i64 2
  store i64 %t6344, ptr %t6349
  %t6350 = getelementptr i64, ptr %t6345, i64 3
  store i64 %t6322, ptr %t6350
  %t6351 = getelementptr i64, ptr %t6345, i64 4
  store i64 %a0, ptr %t6351
  %t6352 = getelementptr i64, ptr %t6345, i64 5
  store i64 %t6347, ptr %t6352
  %t6353 = musttail call fastcc i64 @"scheme.base:code_1012"(i64 %t6347, i64 1, i64 %t6322, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6353
}

define fastcc i64 @"scheme.base:code_1038"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6358 = icmp eq i64 %argc, 1
  br i1 %t6358, label %argok1297, label %arityerr1296
arityerr1296:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1297:
  %t6359 = or i64 %a0, 0
  %t6360 = and i64 %t6359, 7
  %t6361 = icmp eq i64 %t6360, 0
  br i1 %t6361, label %fixfast1298, label %fixslow1299
fixfast1298:
  %t6362 = icmp slt i64 %a0, 0
  %t6363 = select i1 %t6362, i64 257, i64 1
  br label %fixmerge1300
fixslow1299:
  %t6364 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge1300
fixmerge1300:
  %t6365 = phi i64 [ %t6363, %fixfast1298 ], [ %t6364, %fixslow1299 ]
  %t6366 = icmp ne i64 %t6365, 1
  br i1 %t6366, label %then1301, label %else1302
then1301:
  %t6367 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t6367)
  %t6368 = and i64 %t6367, -8
  %t6369 = inttoptr i64 %t6368 to ptr
  %t6370 = load i64, ptr %t6369
  %t6371 = inttoptr i64 %t6370 to ptr
  %t6372 = musttail call fastcc i64 %t6371(i64 %t6367, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6372
else1302:
  %t6373 = and i64 %self, -8
  %t6374 = inttoptr i64 %t6373 to ptr
  %t6375 = getelementptr i64, ptr %t6374, i64 1
  %t6376 = load i64, ptr %t6375
  %t6377 = and i64 %self, -8
  %t6378 = inttoptr i64 %t6377 to ptr
  %t6379 = getelementptr i64, ptr %t6378, i64 2
  %t6380 = load i64, ptr %t6379
  %t6381 = or i64 %t6380, %a0
  %t6382 = and i64 %t6381, 7
  %t6383 = icmp eq i64 %t6382, 0
  br i1 %t6383, label %fixfast1303, label %fixslow1304
fixfast1303:
  %t6384 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6380, i64 %a0)
  %t6385 = extractvalue {i64, i1} %t6384, 0
  %t6386 = extractvalue {i64, i1} %t6384, 1
  br i1 %t6386, label %fixslow1304, label %fixmerge1305
fixslow1304:
  %t6387 = call i64 @rt_add(i64 %t6380, i64 %a0)
  br label %fixmerge1305
fixmerge1305:
  %t6388 = phi i64 [ %t6385, %fixfast1303 ], [ %t6387, %fixslow1304 ]
  %t6389 = and i64 %self, -8
  %t6390 = inttoptr i64 %t6389 to ptr
  %t6391 = getelementptr i64, ptr %t6390, i64 3
  %t6392 = load i64, ptr %t6391
  %t6393 = and i64 %self, -8
  %t6394 = inttoptr i64 %t6393 to ptr
  %t6395 = getelementptr i64, ptr %t6394, i64 4
  %t6396 = load i64, ptr %t6395
  %t6397 = or i64 %t6396, %a0
  %t6398 = and i64 %t6397, 7
  %t6399 = icmp eq i64 %t6398, 0
  br i1 %t6399, label %fixfast1306, label %fixslow1307
fixfast1306:
  %t6400 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6396, i64 %a0)
  %t6401 = extractvalue {i64, i1} %t6400, 0
  %t6402 = extractvalue {i64, i1} %t6400, 1
  br i1 %t6402, label %fixslow1307, label %fixmerge1308
fixslow1307:
  %t6403 = call i64 @rt_add(i64 %t6396, i64 %a0)
  br label %fixmerge1308
fixmerge1308:
  %t6404 = phi i64 [ %t6401, %fixfast1306 ], [ %t6403, %fixslow1307 ]
  %t6405 = call i64 @rt_bytevector_u8_ref(i64 %t6392, i64 %t6404)
  %t6406 = call i64 @rt_bytevector_u8_set(i64 %t6376, i64 %t6388, i64 %t6405)
  %t6407 = or i64 %a0, 8
  %t6408 = and i64 %t6407, 7
  %t6409 = icmp eq i64 %t6408, 0
  br i1 %t6409, label %fixfast1309, label %fixslow1310
fixfast1309:
  %t6410 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 8)
  %t6411 = extractvalue {i64, i1} %t6410, 0
  %t6412 = extractvalue {i64, i1} %t6410, 1
  br i1 %t6412, label %fixslow1310, label %fixmerge1311
fixslow1310:
  %t6413 = call i64 @rt_sub(i64 %a0, i64 8)
  br label %fixmerge1311
fixmerge1311:
  %t6414 = phi i64 [ %t6411, %fixfast1309 ], [ %t6413, %fixslow1310 ]
  %t6415 = musttail call fastcc i64 @"scheme.base:code_1038"(i64 %self, i64 1, i64 %t6414, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6415
}

define fastcc i64 @"scheme.base:code_1040"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6416 = icmp eq i64 %argc, 1
  br i1 %t6416, label %argok1313, label %arityerr1312
arityerr1312:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1313:
  %t6417 = and i64 %self, -8
  %t6418 = inttoptr i64 %t6417 to ptr
  %t6419 = getelementptr i64, ptr %t6418, i64 1
  %t6420 = load i64, ptr %t6419
  %t6421 = and i64 %self, -8
  %t6422 = inttoptr i64 %t6421 to ptr
  %t6423 = getelementptr i64, ptr %t6422, i64 2
  %t6424 = load i64, ptr %t6423
  %t6425 = or i64 %t6420, %t6424
  %t6426 = and i64 %t6425, 7
  %t6427 = icmp eq i64 %t6426, 0
  br i1 %t6427, label %fixfast1314, label %fixslow1315
fixfast1314:
  %t6428 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6420, i64 %t6424)
  %t6429 = extractvalue {i64, i1} %t6428, 0
  %t6430 = extractvalue {i64, i1} %t6428, 1
  br i1 %t6430, label %fixslow1315, label %fixmerge1316
fixslow1315:
  %t6431 = call i64 @rt_sub(i64 %t6420, i64 %t6424)
  br label %fixmerge1316
fixmerge1316:
  %t6432 = phi i64 [ %t6429, %fixfast1314 ], [ %t6431, %fixslow1315 ]
  %t6433 = or i64 %a0, %t6432
  %t6434 = and i64 %t6433, 7
  %t6435 = icmp eq i64 %t6434, 0
  br i1 %t6435, label %fixfast1317, label %fixslow1318
fixfast1317:
  %t6436 = icmp eq i64 %a0, %t6432
  %t6437 = select i1 %t6436, i64 257, i64 1
  br label %fixmerge1319
fixslow1318:
  %t6438 = call i64 @rt_num_eq(i64 %a0, i64 %t6432)
  br label %fixmerge1319
fixmerge1319:
  %t6439 = phi i64 [ %t6437, %fixfast1317 ], [ %t6438, %fixslow1318 ]
  %t6440 = icmp ne i64 %t6439, 1
  br i1 %t6440, label %then1320, label %else1321
then1320:
  %t6441 = load i64, ptr @"scheme.base:void"
  call void @rt_check_callable(i64 %t6441)
  %t6442 = and i64 %t6441, -8
  %t6443 = inttoptr i64 %t6442 to ptr
  %t6444 = load i64, ptr %t6443
  %t6445 = inttoptr i64 %t6444 to ptr
  %t6446 = musttail call fastcc i64 %t6445(i64 %t6441, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6446
else1321:
  %t6447 = and i64 %self, -8
  %t6448 = inttoptr i64 %t6447 to ptr
  %t6449 = getelementptr i64, ptr %t6448, i64 3
  %t6450 = load i64, ptr %t6449
  %t6451 = and i64 %self, -8
  %t6452 = inttoptr i64 %t6451 to ptr
  %t6453 = getelementptr i64, ptr %t6452, i64 4
  %t6454 = load i64, ptr %t6453
  %t6455 = or i64 %t6454, %a0
  %t6456 = and i64 %t6455, 7
  %t6457 = icmp eq i64 %t6456, 0
  br i1 %t6457, label %fixfast1322, label %fixslow1323
fixfast1322:
  %t6458 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6454, i64 %a0)
  %t6459 = extractvalue {i64, i1} %t6458, 0
  %t6460 = extractvalue {i64, i1} %t6458, 1
  br i1 %t6460, label %fixslow1323, label %fixmerge1324
fixslow1323:
  %t6461 = call i64 @rt_add(i64 %t6454, i64 %a0)
  br label %fixmerge1324
fixmerge1324:
  %t6462 = phi i64 [ %t6459, %fixfast1322 ], [ %t6461, %fixslow1323 ]
  %t6463 = and i64 %self, -8
  %t6464 = inttoptr i64 %t6463 to ptr
  %t6465 = getelementptr i64, ptr %t6464, i64 5
  %t6466 = load i64, ptr %t6465
  %t6467 = and i64 %self, -8
  %t6468 = inttoptr i64 %t6467 to ptr
  %t6469 = getelementptr i64, ptr %t6468, i64 2
  %t6470 = load i64, ptr %t6469
  %t6471 = or i64 %t6470, %a0
  %t6472 = and i64 %t6471, 7
  %t6473 = icmp eq i64 %t6472, 0
  br i1 %t6473, label %fixfast1325, label %fixslow1326
fixfast1325:
  %t6474 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6470, i64 %a0)
  %t6475 = extractvalue {i64, i1} %t6474, 0
  %t6476 = extractvalue {i64, i1} %t6474, 1
  br i1 %t6476, label %fixslow1326, label %fixmerge1327
fixslow1326:
  %t6477 = call i64 @rt_add(i64 %t6470, i64 %a0)
  br label %fixmerge1327
fixmerge1327:
  %t6478 = phi i64 [ %t6475, %fixfast1325 ], [ %t6477, %fixslow1326 ]
  %t6479 = call i64 @rt_bytevector_u8_ref(i64 %t6466, i64 %t6478)
  %t6480 = call i64 @rt_bytevector_u8_set(i64 %t6450, i64 %t6462, i64 %t6479)
  %t6481 = or i64 %a0, 8
  %t6482 = and i64 %t6481, 7
  %t6483 = icmp eq i64 %t6482, 0
  br i1 %t6483, label %fixfast1328, label %fixslow1329
fixfast1328:
  %t6484 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t6485 = extractvalue {i64, i1} %t6484, 0
  %t6486 = extractvalue {i64, i1} %t6484, 1
  br i1 %t6486, label %fixslow1329, label %fixmerge1330
fixslow1329:
  %t6487 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1330
fixmerge1330:
  %t6488 = phi i64 [ %t6485, %fixfast1328 ], [ %t6487, %fixslow1329 ]
  %t6489 = musttail call fastcc i64 @"scheme.base:code_1040"(i64 %self, i64 1, i64 %t6488, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6489
}

define fastcc i64 @"scheme.base:code:bytevector-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6490 = icmp sge i64 %argc, 3
  br i1 %t6490, label %argok1332, label %arityerr1331
arityerr1331:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1332:
  %t6491 = call ptr @rt_alloc_words(i64 8)
  %t6492 = getelementptr i64, ptr %t6491, i64 0
  store i64 %a0, ptr %t6492
  %t6493 = getelementptr i64, ptr %t6491, i64 1
  store i64 %a1, ptr %t6493
  %t6494 = getelementptr i64, ptr %t6491, i64 2
  store i64 %a2, ptr %t6494
  %t6495 = getelementptr i64, ptr %t6491, i64 3
  store i64 %a3, ptr %t6495
  %t6496 = getelementptr i64, ptr %t6491, i64 4
  store i64 %a4, ptr %t6496
  %t6497 = getelementptr i64, ptr %t6491, i64 5
  store i64 %a5, ptr %t6497
  %t6498 = getelementptr i64, ptr %t6491, i64 6
  store i64 %a6, ptr %t6498
  %t6499 = getelementptr i64, ptr %t6491, i64 7
  store i64 %a7, ptr %t6499
  %t6500 = call i64 @rt_build_rest(i64 %argc, i64 3, i64 8, ptr %t6491, ptr %overflow)
  %t6501 = call i64 @rt_bytevector_length(i64 %a2)
  %t6502 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t6502)
  %t6503 = and i64 %t6502, -8
  %t6504 = inttoptr i64 %t6503 to ptr
  %t6505 = load i64, ptr %t6504
  %t6506 = inttoptr i64 %t6505 to ptr
  %t6507 = call fastcc i64%t6506(i64 %t6502, i64 1, i64 %t6500, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6508 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t6508)
  %t6509 = and i64 %t6508, -8
  %t6510 = inttoptr i64 %t6509 to ptr
  %t6511 = load i64, ptr %t6510
  %t6512 = inttoptr i64 %t6511 to ptr
  %t6513 = call fastcc i64%t6512(i64 %t6508, i64 2, i64 %t6500, i64 %t6501, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6514 = call i64 @rt_intern(ptr @.str.sym.43)
  %t6515 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6515)
  %t6516 = and i64 %t6515, -8
  %t6517 = inttoptr i64 %t6516 to ptr
  %t6518 = load i64, ptr %t6517
  %t6519 = inttoptr i64 %t6518 to ptr
  %t6520 = call fastcc i64%t6519(i64 %t6515, i64 4, i64 %t6514, i64 %t6507, i64 %t6513, i64 %t6501, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6521 = call i64 @rt_intern(ptr @.str.sym.43)
  %t6522 = or i64 %t6513, %t6507
  %t6523 = and i64 %t6522, 7
  %t6524 = icmp eq i64 %t6523, 0
  br i1 %t6524, label %fixfast1333, label %fixslow1334
fixfast1333:
  %t6525 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6513, i64 %t6507)
  %t6526 = extractvalue {i64, i1} %t6525, 0
  %t6527 = extractvalue {i64, i1} %t6525, 1
  br i1 %t6527, label %fixslow1334, label %fixmerge1335
fixslow1334:
  %t6528 = call i64 @rt_sub(i64 %t6513, i64 %t6507)
  br label %fixmerge1335
fixmerge1335:
  %t6529 = phi i64 [ %t6526, %fixfast1333 ], [ %t6528, %fixslow1334 ]
  %t6530 = or i64 %a1, %t6529
  %t6531 = and i64 %t6530, 7
  %t6532 = icmp eq i64 %t6531, 0
  br i1 %t6532, label %fixfast1336, label %fixslow1337
fixfast1336:
  %t6533 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t6529)
  %t6534 = extractvalue {i64, i1} %t6533, 0
  %t6535 = extractvalue {i64, i1} %t6533, 1
  br i1 %t6535, label %fixslow1337, label %fixmerge1338
fixslow1337:
  %t6536 = call i64 @rt_add(i64 %a1, i64 %t6529)
  br label %fixmerge1338
fixmerge1338:
  %t6537 = phi i64 [ %t6534, %fixfast1336 ], [ %t6536, %fixslow1337 ]
  %t6538 = call i64 @rt_bytevector_length(i64 %a0)
  %t6539 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6539)
  %t6540 = and i64 %t6539, -8
  %t6541 = inttoptr i64 %t6540 to ptr
  %t6542 = load i64, ptr %t6541
  %t6543 = inttoptr i64 %t6542 to ptr
  %t6544 = call fastcc i64%t6543(i64 %t6539, i64 4, i64 %t6521, i64 %a1, i64 %t6537, i64 %t6538, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6545 = or i64 %t6507, %a1
  %t6546 = and i64 %t6545, 7
  %t6547 = icmp eq i64 %t6546, 0
  br i1 %t6547, label %fixfast1339, label %fixslow1340
fixfast1339:
  %t6548 = icmp slt i64 %t6507, %a1
  %t6549 = select i1 %t6548, i64 257, i64 1
  br label %fixmerge1341
fixslow1340:
  %t6550 = call i64 @rt_lt(i64 %t6507, i64 %a1)
  br label %fixmerge1341
fixmerge1341:
  %t6551 = phi i64 [ %t6549, %fixfast1339 ], [ %t6550, %fixslow1340 ]
  %t6552 = icmp ne i64 %t6551, 1
  br i1 %t6552, label %then1342, label %else1343
then1342:
  %t6553 = call ptr @rt_alloc_words(i64 6)
  %t6554 = ptrtoint ptr %t6553 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1038" to i64), ptr %t6553
  %t6555 = or i64 %t6554, 4
  %t6556 = getelementptr i64, ptr %t6553, i64 1
  store i64 %a0, ptr %t6556
  %t6557 = getelementptr i64, ptr %t6553, i64 2
  store i64 %a1, ptr %t6557
  %t6558 = getelementptr i64, ptr %t6553, i64 3
  store i64 %a2, ptr %t6558
  %t6559 = getelementptr i64, ptr %t6553, i64 4
  store i64 %t6507, ptr %t6559
  %t6560 = getelementptr i64, ptr %t6553, i64 5
  store i64 %t6555, ptr %t6560
  %t6561 = or i64 %t6513, %t6507
  %t6562 = and i64 %t6561, 7
  %t6563 = icmp eq i64 %t6562, 0
  br i1 %t6563, label %fixfast1344, label %fixslow1345
fixfast1344:
  %t6564 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6513, i64 %t6507)
  %t6565 = extractvalue {i64, i1} %t6564, 0
  %t6566 = extractvalue {i64, i1} %t6564, 1
  br i1 %t6566, label %fixslow1345, label %fixmerge1346
fixslow1345:
  %t6567 = call i64 @rt_sub(i64 %t6513, i64 %t6507)
  br label %fixmerge1346
fixmerge1346:
  %t6568 = phi i64 [ %t6565, %fixfast1344 ], [ %t6567, %fixslow1345 ]
  %t6569 = or i64 %t6568, 8
  %t6570 = and i64 %t6569, 7
  %t6571 = icmp eq i64 %t6570, 0
  br i1 %t6571, label %fixfast1347, label %fixslow1348
fixfast1347:
  %t6572 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6568, i64 8)
  %t6573 = extractvalue {i64, i1} %t6572, 0
  %t6574 = extractvalue {i64, i1} %t6572, 1
  br i1 %t6574, label %fixslow1348, label %fixmerge1349
fixslow1348:
  %t6575 = call i64 @rt_sub(i64 %t6568, i64 8)
  br label %fixmerge1349
fixmerge1349:
  %t6576 = phi i64 [ %t6573, %fixfast1347 ], [ %t6575, %fixslow1348 ]
  %t6577 = musttail call fastcc i64 @"scheme.base:code_1038"(i64 %t6555, i64 1, i64 %t6576, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6577
else1343:
  %t6578 = call ptr @rt_alloc_words(i64 7)
  %t6579 = ptrtoint ptr %t6578 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1040" to i64), ptr %t6578
  %t6580 = or i64 %t6579, 4
  %t6581 = getelementptr i64, ptr %t6578, i64 1
  store i64 %t6513, ptr %t6581
  %t6582 = getelementptr i64, ptr %t6578, i64 2
  store i64 %t6507, ptr %t6582
  %t6583 = getelementptr i64, ptr %t6578, i64 3
  store i64 %a0, ptr %t6583
  %t6584 = getelementptr i64, ptr %t6578, i64 4
  store i64 %a1, ptr %t6584
  %t6585 = getelementptr i64, ptr %t6578, i64 5
  store i64 %a2, ptr %t6585
  %t6586 = getelementptr i64, ptr %t6578, i64 6
  store i64 %t6580, ptr %t6586
  %t6587 = musttail call fastcc i64 @"scheme.base:code_1040"(i64 %t6580, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6587
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cbytevector-copy!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6588 = call i64 @rt_bytevector_length(i64 %a2)
  %t6589 = load i64, ptr @"scheme.base:rng-start"
  call void @rt_check_callable(i64 %t6589)
  %t6590 = and i64 %t6589, -8
  %t6591 = inttoptr i64 %t6590 to ptr
  %t6592 = load i64, ptr %t6591
  %t6593 = inttoptr i64 %t6592 to ptr
  %t6594 = call fastcc i64%t6593(i64 %t6589, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6595 = load i64, ptr @"scheme.base:rng-end"
  call void @rt_check_callable(i64 %t6595)
  %t6596 = and i64 %t6595, -8
  %t6597 = inttoptr i64 %t6596 to ptr
  %t6598 = load i64, ptr %t6597
  %t6599 = inttoptr i64 %t6598 to ptr
  %t6600 = call fastcc i64%t6599(i64 %t6595, i64 2, i64 2, i64 %t6588, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6601 = call i64 @rt_intern(ptr @.str.sym.43)
  %t6602 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6602)
  %t6603 = and i64 %t6602, -8
  %t6604 = inttoptr i64 %t6603 to ptr
  %t6605 = load i64, ptr %t6604
  %t6606 = inttoptr i64 %t6605 to ptr
  %t6607 = call fastcc i64%t6606(i64 %t6602, i64 4, i64 %t6601, i64 %t6594, i64 %t6600, i64 %t6588, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6608 = call i64 @rt_intern(ptr @.str.sym.43)
  %t6609 = or i64 %t6600, %t6594
  %t6610 = and i64 %t6609, 7
  %t6611 = icmp eq i64 %t6610, 0
  br i1 %t6611, label %fixfast1350, label %fixslow1351
fixfast1350:
  %t6612 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6600, i64 %t6594)
  %t6613 = extractvalue {i64, i1} %t6612, 0
  %t6614 = extractvalue {i64, i1} %t6612, 1
  br i1 %t6614, label %fixslow1351, label %fixmerge1352
fixslow1351:
  %t6615 = call i64 @rt_sub(i64 %t6600, i64 %t6594)
  br label %fixmerge1352
fixmerge1352:
  %t6616 = phi i64 [ %t6613, %fixfast1350 ], [ %t6615, %fixslow1351 ]
  %t6617 = or i64 %a1, %t6616
  %t6618 = and i64 %t6617, 7
  %t6619 = icmp eq i64 %t6618, 0
  br i1 %t6619, label %fixfast1353, label %fixslow1354
fixfast1353:
  %t6620 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a1, i64 %t6616)
  %t6621 = extractvalue {i64, i1} %t6620, 0
  %t6622 = extractvalue {i64, i1} %t6620, 1
  br i1 %t6622, label %fixslow1354, label %fixmerge1355
fixslow1354:
  %t6623 = call i64 @rt_add(i64 %a1, i64 %t6616)
  br label %fixmerge1355
fixmerge1355:
  %t6624 = phi i64 [ %t6621, %fixfast1353 ], [ %t6623, %fixslow1354 ]
  %t6625 = call i64 @rt_bytevector_length(i64 %a0)
  %t6626 = load i64, ptr @"scheme.base:rng-check"
  call void @rt_check_callable(i64 %t6626)
  %t6627 = and i64 %t6626, -8
  %t6628 = inttoptr i64 %t6627 to ptr
  %t6629 = load i64, ptr %t6628
  %t6630 = inttoptr i64 %t6629 to ptr
  %t6631 = call fastcc i64%t6630(i64 %t6626, i64 4, i64 %t6608, i64 %a1, i64 %t6624, i64 %t6625, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6632 = or i64 %t6594, %a1
  %t6633 = and i64 %t6632, 7
  %t6634 = icmp eq i64 %t6633, 0
  br i1 %t6634, label %fixfast1356, label %fixslow1357
fixfast1356:
  %t6635 = icmp slt i64 %t6594, %a1
  %t6636 = select i1 %t6635, i64 257, i64 1
  br label %fixmerge1358
fixslow1357:
  %t6637 = call i64 @rt_lt(i64 %t6594, i64 %a1)
  br label %fixmerge1358
fixmerge1358:
  %t6638 = phi i64 [ %t6636, %fixfast1356 ], [ %t6637, %fixslow1357 ]
  %t6639 = icmp ne i64 %t6638, 1
  br i1 %t6639, label %then1359, label %else1360
then1359:
  %t6640 = call ptr @rt_alloc_words(i64 6)
  %t6641 = ptrtoint ptr %t6640 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1038" to i64), ptr %t6640
  %t6642 = or i64 %t6641, 4
  %t6643 = getelementptr i64, ptr %t6640, i64 1
  store i64 %a0, ptr %t6643
  %t6644 = getelementptr i64, ptr %t6640, i64 2
  store i64 %a1, ptr %t6644
  %t6645 = getelementptr i64, ptr %t6640, i64 3
  store i64 %a2, ptr %t6645
  %t6646 = getelementptr i64, ptr %t6640, i64 4
  store i64 %t6594, ptr %t6646
  %t6647 = getelementptr i64, ptr %t6640, i64 5
  store i64 %t6642, ptr %t6647
  %t6648 = or i64 %t6600, %t6594
  %t6649 = and i64 %t6648, 7
  %t6650 = icmp eq i64 %t6649, 0
  br i1 %t6650, label %fixfast1361, label %fixslow1362
fixfast1361:
  %t6651 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6600, i64 %t6594)
  %t6652 = extractvalue {i64, i1} %t6651, 0
  %t6653 = extractvalue {i64, i1} %t6651, 1
  br i1 %t6653, label %fixslow1362, label %fixmerge1363
fixslow1362:
  %t6654 = call i64 @rt_sub(i64 %t6600, i64 %t6594)
  br label %fixmerge1363
fixmerge1363:
  %t6655 = phi i64 [ %t6652, %fixfast1361 ], [ %t6654, %fixslow1362 ]
  %t6656 = or i64 %t6655, 8
  %t6657 = and i64 %t6656, 7
  %t6658 = icmp eq i64 %t6657, 0
  br i1 %t6658, label %fixfast1364, label %fixslow1365
fixfast1364:
  %t6659 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t6655, i64 8)
  %t6660 = extractvalue {i64, i1} %t6659, 0
  %t6661 = extractvalue {i64, i1} %t6659, 1
  br i1 %t6661, label %fixslow1365, label %fixmerge1366
fixslow1365:
  %t6662 = call i64 @rt_sub(i64 %t6655, i64 8)
  br label %fixmerge1366
fixmerge1366:
  %t6663 = phi i64 [ %t6660, %fixfast1364 ], [ %t6662, %fixslow1365 ]
  %t6664 = musttail call fastcc i64 @"scheme.base:code_1038"(i64 %t6642, i64 1, i64 %t6663, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6664
else1360:
  %t6665 = call ptr @rt_alloc_words(i64 7)
  %t6666 = ptrtoint ptr %t6665 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1040" to i64), ptr %t6665
  %t6667 = or i64 %t6666, 4
  %t6668 = getelementptr i64, ptr %t6665, i64 1
  store i64 %t6600, ptr %t6668
  %t6669 = getelementptr i64, ptr %t6665, i64 2
  store i64 %t6594, ptr %t6669
  %t6670 = getelementptr i64, ptr %t6665, i64 3
  store i64 %a0, ptr %t6670
  %t6671 = getelementptr i64, ptr %t6665, i64 4
  store i64 %a1, ptr %t6671
  %t6672 = getelementptr i64, ptr %t6665, i64 5
  store i64 %a2, ptr %t6672
  %t6673 = getelementptr i64, ptr %t6665, i64 6
  store i64 %t6667, ptr %t6673
  %t6674 = musttail call fastcc i64 @"scheme.base:code_1040"(i64 %t6667, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6674
}

define fastcc i64 @"scheme.base:code_1058"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6679 = icmp eq i64 %argc, 1
  br i1 %t6679, label %argok1368, label %arityerr1367
arityerr1367:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1368:
  %t6680 = and i64 %self, -8
  %t6681 = inttoptr i64 %t6680 to ptr
  %t6682 = getelementptr i64, ptr %t6681, i64 1
  %t6683 = load i64, ptr %t6682
  %t6684 = or i64 %a0, %t6683
  %t6685 = and i64 %t6684, 7
  %t6686 = icmp eq i64 %t6685, 0
  br i1 %t6686, label %fixfast1369, label %fixslow1370
fixfast1369:
  %t6687 = icmp eq i64 %a0, %t6683
  %t6688 = select i1 %t6687, i64 257, i64 1
  br label %fixmerge1371
fixslow1370:
  %t6689 = call i64 @rt_num_eq(i64 %a0, i64 %t6683)
  br label %fixmerge1371
fixmerge1371:
  %t6690 = phi i64 [ %t6688, %fixfast1369 ], [ %t6689, %fixslow1370 ]
  %t6691 = icmp ne i64 %t6690, 1
  br i1 %t6691, label %then1372, label %else1373
then1372:
  %t6692 = and i64 %self, -8
  %t6693 = inttoptr i64 %t6692 to ptr
  %t6694 = getelementptr i64, ptr %t6693, i64 3
  %t6695 = load i64, ptr %t6694
  %t6696 = call i64 @rt_cdr(i64 %t6695)
  %t6697 = and i64 %self, -8
  %t6698 = inttoptr i64 %t6697 to ptr
  %t6699 = getelementptr i64, ptr %t6698, i64 4
  %t6700 = load i64, ptr %t6699
  %t6701 = and i64 %self, -8
  %t6702 = inttoptr i64 %t6701 to ptr
  %t6703 = getelementptr i64, ptr %t6702, i64 1
  %t6704 = load i64, ptr %t6703
  %t6705 = or i64 %t6700, %t6704
  %t6706 = and i64 %t6705, 7
  %t6707 = icmp eq i64 %t6706, 0
  br i1 %t6707, label %fixfast1374, label %fixslow1375
fixfast1374:
  %t6708 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6700, i64 %t6704)
  %t6709 = extractvalue {i64, i1} %t6708, 0
  %t6710 = extractvalue {i64, i1} %t6708, 1
  br i1 %t6710, label %fixslow1375, label %fixmerge1376
fixslow1375:
  %t6711 = call i64 @rt_add(i64 %t6700, i64 %t6704)
  br label %fixmerge1376
fixmerge1376:
  %t6712 = phi i64 [ %t6709, %fixfast1374 ], [ %t6711, %fixslow1375 ]
  %t6713 = and i64 %self, -8
  %t6714 = inttoptr i64 %t6713 to ptr
  %t6715 = getelementptr i64, ptr %t6714, i64 2
  %t6716 = load i64, ptr %t6715
  %t6717 = musttail call fastcc i64 @"scheme.base:code_1056"(i64 %t6716, i64 2, i64 %t6696, i64 %t6712, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6717
else1373:
  %t6718 = and i64 %self, -8
  %t6719 = inttoptr i64 %t6718 to ptr
  %t6720 = getelementptr i64, ptr %t6719, i64 5
  %t6721 = load i64, ptr %t6720
  %t6722 = and i64 %self, -8
  %t6723 = inttoptr i64 %t6722 to ptr
  %t6724 = getelementptr i64, ptr %t6723, i64 4
  %t6725 = load i64, ptr %t6724
  %t6726 = or i64 %t6725, %a0
  %t6727 = and i64 %t6726, 7
  %t6728 = icmp eq i64 %t6727, 0
  br i1 %t6728, label %fixfast1377, label %fixslow1378
fixfast1377:
  %t6729 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6725, i64 %a0)
  %t6730 = extractvalue {i64, i1} %t6729, 0
  %t6731 = extractvalue {i64, i1} %t6729, 1
  br i1 %t6731, label %fixslow1378, label %fixmerge1379
fixslow1378:
  %t6732 = call i64 @rt_add(i64 %t6725, i64 %a0)
  br label %fixmerge1379
fixmerge1379:
  %t6733 = phi i64 [ %t6730, %fixfast1377 ], [ %t6732, %fixslow1378 ]
  %t6734 = and i64 %self, -8
  %t6735 = inttoptr i64 %t6734 to ptr
  %t6736 = getelementptr i64, ptr %t6735, i64 6
  %t6737 = load i64, ptr %t6736
  %t6738 = call i64 @rt_bytevector_u8_ref(i64 %t6737, i64 %a0)
  %t6739 = call i64 @rt_bytevector_u8_set(i64 %t6721, i64 %t6733, i64 %t6738)
  %t6740 = or i64 %a0, 8
  %t6741 = and i64 %t6740, 7
  %t6742 = icmp eq i64 %t6741, 0
  br i1 %t6742, label %fixfast1380, label %fixslow1381
fixfast1380:
  %t6743 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t6744 = extractvalue {i64, i1} %t6743, 0
  %t6745 = extractvalue {i64, i1} %t6743, 1
  br i1 %t6745, label %fixslow1381, label %fixmerge1382
fixslow1381:
  %t6746 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1382
fixmerge1382:
  %t6747 = phi i64 [ %t6744, %fixfast1380 ], [ %t6746, %fixslow1381 ]
  %t6748 = musttail call fastcc i64 @"scheme.base:code_1058"(i64 %self, i64 1, i64 %t6747, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6748
}

define fastcc i64 @"scheme.base:code_1056"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6749 = icmp eq i64 %argc, 2
  br i1 %t6749, label %argok1384, label %arityerr1383
arityerr1383:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1384:
  %t6750 = call i64 @rt_null_p(i64 %a0)
  %t6751 = icmp ne i64 %t6750, 1
  br i1 %t6751, label %then1385, label %else1386
then1385:
  %t6752 = and i64 %self, -8
  %t6753 = inttoptr i64 %t6752 to ptr
  %t6754 = getelementptr i64, ptr %t6753, i64 1
  %t6755 = load i64, ptr %t6754
  ret i64 %t6755
else1386:
  %t6756 = call i64 @rt_car(i64 %a0)
  %t6757 = call i64 @rt_bytevector_length(i64 %t6756)
  %t6758 = call ptr @rt_alloc_words(i64 8)
  %t6759 = ptrtoint ptr %t6758 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1058" to i64), ptr %t6758
  %t6760 = or i64 %t6759, 4
  %t6761 = getelementptr i64, ptr %t6758, i64 1
  store i64 %t6757, ptr %t6761
  %t6762 = and i64 %self, -8
  %t6763 = inttoptr i64 %t6762 to ptr
  %t6764 = getelementptr i64, ptr %t6763, i64 2
  %t6765 = load i64, ptr %t6764
  %t6766 = getelementptr i64, ptr %t6758, i64 2
  store i64 %t6765, ptr %t6766
  %t6767 = getelementptr i64, ptr %t6758, i64 3
  store i64 %a0, ptr %t6767
  %t6768 = getelementptr i64, ptr %t6758, i64 4
  store i64 %a1, ptr %t6768
  %t6769 = and i64 %self, -8
  %t6770 = inttoptr i64 %t6769 to ptr
  %t6771 = getelementptr i64, ptr %t6770, i64 1
  %t6772 = load i64, ptr %t6771
  %t6773 = getelementptr i64, ptr %t6758, i64 5
  store i64 %t6772, ptr %t6773
  %t6774 = getelementptr i64, ptr %t6758, i64 6
  store i64 %t6756, ptr %t6774
  %t6775 = getelementptr i64, ptr %t6758, i64 7
  store i64 %t6760, ptr %t6775
  %t6776 = musttail call fastcc i64 @"scheme.base:code_1058"(i64 %t6760, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6776
}

define fastcc i64 @"scheme.base:code:bytevector-append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6777 = icmp sge i64 %argc, 0
  br i1 %t6777, label %argok1388, label %arityerr1387
arityerr1387:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1388:
  %t6778 = call ptr @rt_alloc_words(i64 8)
  %t6779 = getelementptr i64, ptr %t6778, i64 0
  store i64 %a0, ptr %t6779
  %t6780 = getelementptr i64, ptr %t6778, i64 1
  store i64 %a1, ptr %t6780
  %t6781 = getelementptr i64, ptr %t6778, i64 2
  store i64 %a2, ptr %t6781
  %t6782 = getelementptr i64, ptr %t6778, i64 3
  store i64 %a3, ptr %t6782
  %t6783 = getelementptr i64, ptr %t6778, i64 4
  store i64 %a4, ptr %t6783
  %t6784 = getelementptr i64, ptr %t6778, i64 5
  store i64 %a5, ptr %t6784
  %t6785 = getelementptr i64, ptr %t6778, i64 6
  store i64 %a6, ptr %t6785
  %t6786 = getelementptr i64, ptr %t6778, i64 7
  store i64 %a7, ptr %t6786
  %t6787 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t6778, ptr %overflow)
  %t6788 = load i64, ptr @"scheme.base:bv-total"
  call void @rt_check_callable(i64 %t6788)
  %t6789 = and i64 %t6788, -8
  %t6790 = inttoptr i64 %t6789 to ptr
  %t6791 = load i64, ptr %t6790
  %t6792 = inttoptr i64 %t6791 to ptr
  %t6793 = call fastcc i64%t6792(i64 %t6788, i64 1, i64 %t6787, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6794 = call i64 @rt_make_bytevector(i64 %t6793, i64 0)
  %t6795 = call ptr @rt_alloc_words(i64 3)
  %t6796 = ptrtoint ptr %t6795 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1056" to i64), ptr %t6795
  %t6797 = or i64 %t6796, 4
  %t6798 = getelementptr i64, ptr %t6795, i64 1
  store i64 %t6794, ptr %t6798
  %t6799 = getelementptr i64, ptr %t6795, i64 2
  store i64 %t6797, ptr %t6799
  %t6800 = musttail call fastcc i64 @"scheme.base:code_1056"(i64 %t6797, i64 2, i64 %t6787, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6800
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cbytevector-append"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6801 = load i64, ptr @"scheme.base:bv-total"
  call void @rt_check_callable(i64 %t6801)
  %t6802 = and i64 %t6801, -8
  %t6803 = inttoptr i64 %t6802 to ptr
  %t6804 = load i64, ptr %t6803
  %t6805 = inttoptr i64 %t6804 to ptr
  %t6806 = call fastcc i64%t6805(i64 %t6801, i64 1, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6807 = call i64 @rt_make_bytevector(i64 %t6806, i64 0)
  %t6808 = call ptr @rt_alloc_words(i64 3)
  %t6809 = ptrtoint ptr %t6808 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1056" to i64), ptr %t6808
  %t6810 = or i64 %t6809, 4
  %t6811 = getelementptr i64, ptr %t6808, i64 1
  store i64 %t6807, ptr %t6811
  %t6812 = getelementptr i64, ptr %t6808, i64 2
  store i64 %t6810, ptr %t6812
  %t6813 = musttail call fastcc i64 @"scheme.base:code_1056"(i64 %t6810, i64 2, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6813
}

define fastcc i64 @"scheme.base:code:bv-total"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6818 = icmp eq i64 %argc, 1
  br i1 %t6818, label %argok1390, label %arityerr1389
arityerr1389:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1390:
  %t6819 = call i64 @rt_null_p(i64 %a0)
  %t6820 = icmp ne i64 %t6819, 1
  br i1 %t6820, label %then1391, label %else1392
then1391:
  ret i64 0
else1392:
  %t6821 = call i64 @rt_car(i64 %a0)
  %t6822 = call i64 @rt_bytevector_length(i64 %t6821)
  %t6823 = call i64 @rt_cdr(i64 %a0)
  %t6824 = load i64, ptr @"scheme.base:bv-total"
  call void @rt_check_callable(i64 %t6824)
  %t6825 = and i64 %t6824, -8
  %t6826 = inttoptr i64 %t6825 to ptr
  %t6827 = load i64, ptr %t6826
  %t6828 = inttoptr i64 %t6827 to ptr
  %t6829 = call fastcc i64%t6828(i64 %t6824, i64 1, i64 %t6823, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6830 = or i64 %t6822, %t6829
  %t6831 = and i64 %t6830, 7
  %t6832 = icmp eq i64 %t6831, 0
  br i1 %t6832, label %fixfast1393, label %fixslow1394
fixfast1393:
  %t6833 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t6822, i64 %t6829)
  %t6834 = extractvalue {i64, i1} %t6833, 0
  %t6835 = extractvalue {i64, i1} %t6833, 1
  br i1 %t6835, label %fixslow1394, label %fixmerge1395
fixslow1394:
  %t6836 = call i64 @rt_add(i64 %t6822, i64 %t6829)
  br label %fixmerge1395
fixmerge1395:
  %t6837 = phi i64 [ %t6834, %fixfast1393 ], [ %t6836, %fixslow1394 ]
  ret i64 %t6837
}

define fastcc i64 @"scheme.base:code:rationalize"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6843 = icmp eq i64 %argc, 2
  br i1 %t6843, label %argok1397, label %arityerr1396
arityerr1396:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1397:
  %t6844 = load i64, ptr @"scheme.base:abs"
  call void @rt_check_callable(i64 %t6844)
  %t6845 = and i64 %t6844, -8
  %t6846 = inttoptr i64 %t6845 to ptr
  %t6847 = load i64, ptr %t6846
  %t6848 = inttoptr i64 %t6847 to ptr
  %t6849 = call fastcc i64%t6848(i64 %t6844, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6850 = or i64 %a0, %t6849
  %t6851 = and i64 %t6850, 7
  %t6852 = icmp eq i64 %t6851, 0
  br i1 %t6852, label %fixfast1398, label %fixslow1399
fixfast1398:
  %t6853 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %a0, i64 %t6849)
  %t6854 = extractvalue {i64, i1} %t6853, 0
  %t6855 = extractvalue {i64, i1} %t6853, 1
  br i1 %t6855, label %fixslow1399, label %fixmerge1400
fixslow1399:
  %t6856 = call i64 @rt_sub(i64 %a0, i64 %t6849)
  br label %fixmerge1400
fixmerge1400:
  %t6857 = phi i64 [ %t6854, %fixfast1398 ], [ %t6856, %fixslow1399 ]
  %t6858 = load i64, ptr @"scheme.base:abs"
  call void @rt_check_callable(i64 %t6858)
  %t6859 = and i64 %t6858, -8
  %t6860 = inttoptr i64 %t6859 to ptr
  %t6861 = load i64, ptr %t6860
  %t6862 = inttoptr i64 %t6861 to ptr
  %t6863 = call fastcc i64%t6862(i64 %t6858, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6864 = or i64 %a0, %t6863
  %t6865 = and i64 %t6864, 7
  %t6866 = icmp eq i64 %t6865, 0
  br i1 %t6866, label %fixfast1401, label %fixslow1402
fixfast1401:
  %t6867 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 %t6863)
  %t6868 = extractvalue {i64, i1} %t6867, 0
  %t6869 = extractvalue {i64, i1} %t6867, 1
  br i1 %t6869, label %fixslow1402, label %fixmerge1403
fixslow1402:
  %t6870 = call i64 @rt_add(i64 %a0, i64 %t6863)
  br label %fixmerge1403
fixmerge1403:
  %t6871 = phi i64 [ %t6868, %fixfast1401 ], [ %t6870, %fixslow1402 ]
  %t6872 = call i64 @rt_exact_p(i64 %a0)
  %t6873 = icmp ne i64 %t6872, 1
  br i1 %t6873, label %then1404, label %else1405
then1404:
  %t6874 = call i64 @rt_exact_p(i64 %a1)
  br label %merge1406
else1405:
  br label %merge1406
merge1406:
  %t6875 = phi i64 [ %t6874, %then1404 ], [ 1, %else1405 ]
  %t6876 = icmp ne i64 %t6875, 1
  br i1 %t6876, label %then1407, label %else1408
then1407:
  %t6877 = load i64, ptr @"scheme.base:rat-exact"
  call void @rt_check_callable(i64 %t6877)
  %t6878 = and i64 %t6877, -8
  %t6879 = inttoptr i64 %t6878 to ptr
  %t6880 = load i64, ptr %t6879
  %t6881 = inttoptr i64 %t6880 to ptr
  %t6882 = musttail call fastcc i64 %t6881(i64 %t6877, i64 2, i64 %t6857, i64 %t6871, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6882
else1408:
  %t6883 = call i64 @rt_exact_to_inexact(i64 %t6857)
  %t6884 = call i64 @rt_exact_to_inexact(i64 %t6871)
  %t6885 = load i64, ptr @"scheme.base:rat-inexact"
  call void @rt_check_callable(i64 %t6885)
  %t6886 = and i64 %t6885, -8
  %t6887 = inttoptr i64 %t6886 to ptr
  %t6888 = load i64, ptr %t6887
  %t6889 = inttoptr i64 %t6888 to ptr
  %t6890 = musttail call fastcc i64 %t6889(i64 %t6885, i64 2, i64 %t6883, i64 %t6884, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6890
}

define fastcc i64 @"scheme.base:code:rat-exact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t6895 = icmp eq i64 %argc, 2
  br i1 %t6895, label %argok1410, label %arityerr1409
arityerr1409:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1410:
  %t6896 = or i64 %a0, 0
  %t6897 = and i64 %t6896, 7
  %t6898 = icmp eq i64 %t6897, 0
  br i1 %t6898, label %fixfast1411, label %fixslow1412
fixfast1411:
  %t6899 = icmp slt i64 %a0, 0
  %t6900 = select i1 %t6899, i64 257, i64 1
  br label %fixmerge1413
fixslow1412:
  %t6901 = call i64 @rt_lt(i64 %a0, i64 0)
  br label %fixmerge1413
fixmerge1413:
  %t6902 = phi i64 [ %t6900, %fixfast1411 ], [ %t6901, %fixslow1412 ]
  %t6903 = icmp ne i64 %t6902, 1
  br i1 %t6903, label %then1414, label %else1415
then1414:
  br label %merge1416
else1415:
  %t6904 = or i64 %a0, 0
  %t6905 = and i64 %t6904, 7
  %t6906 = icmp eq i64 %t6905, 0
  br i1 %t6906, label %fixfast1417, label %fixslow1418
fixfast1417:
  %t6907 = icmp eq i64 %a0, 0
  %t6908 = select i1 %t6907, i64 257, i64 1
  br label %fixmerge1419
fixslow1418:
  %t6909 = call i64 @rt_num_eq(i64 %a0, i64 0)
  br label %fixmerge1419
fixmerge1419:
  %t6910 = phi i64 [ %t6908, %fixfast1417 ], [ %t6909, %fixslow1418 ]
  br label %merge1416
merge1416:
  %t6911 = phi i64 [ 257, %then1414 ], [ %t6910, %fixmerge1419 ]
  %t6912 = icmp ne i64 %t6911, 1
  br i1 %t6912, label %then1420, label %else1421
then1420:
  %t6913 = or i64 0, %a1
  %t6914 = and i64 %t6913, 7
  %t6915 = icmp eq i64 %t6914, 0
  br i1 %t6915, label %fixfast1423, label %fixslow1424
fixfast1423:
  %t6916 = icmp slt i64 0, %a1
  %t6917 = select i1 %t6916, i64 257, i64 1
  br label %fixmerge1425
fixslow1424:
  %t6918 = call i64 @rt_lt(i64 0, i64 %a1)
  br label %fixmerge1425
fixmerge1425:
  %t6919 = phi i64 [ %t6917, %fixfast1423 ], [ %t6918, %fixslow1424 ]
  %t6920 = icmp ne i64 %t6919, 1
  br i1 %t6920, label %then1426, label %else1427
then1426:
  br label %merge1428
else1427:
  %t6921 = or i64 0, %a1
  %t6922 = and i64 %t6921, 7
  %t6923 = icmp eq i64 %t6922, 0
  br i1 %t6923, label %fixfast1429, label %fixslow1430
fixfast1429:
  %t6924 = icmp eq i64 0, %a1
  %t6925 = select i1 %t6924, i64 257, i64 1
  br label %fixmerge1431
fixslow1430:
  %t6926 = call i64 @rt_num_eq(i64 0, i64 %a1)
  br label %fixmerge1431
fixmerge1431:
  %t6927 = phi i64 [ %t6925, %fixfast1429 ], [ %t6926, %fixslow1430 ]
  br label %merge1428
merge1428:
  %t6928 = phi i64 [ 257, %then1426 ], [ %t6927, %fixmerge1431 ]
  br label %merge1422
else1421:
  br label %merge1422
merge1422:
  %t6929 = phi i64 [ %t6928, %merge1428 ], [ 1, %else1421 ]
  %t6930 = icmp ne i64 %t6929, 1
  br i1 %t6930, label %then1432, label %else1433
then1432:
  ret i64 0
else1433:
  %t6931 = or i64 0, %a0
  %t6932 = and i64 %t6931, 7
  %t6933 = icmp eq i64 %t6932, 0
  br i1 %t6933, label %fixfast1434, label %fixslow1435
fixfast1434:
  %t6934 = icmp slt i64 0, %a0
  %t6935 = select i1 %t6934, i64 257, i64 1
  br label %fixmerge1436
fixslow1435:
  %t6936 = call i64 @rt_lt(i64 0, i64 %a0)
  br label %fixmerge1436
fixmerge1436:
  %t6937 = phi i64 [ %t6935, %fixfast1434 ], [ %t6936, %fixslow1435 ]
  %t6938 = icmp ne i64 %t6937, 1
  br i1 %t6938, label %then1437, label %else1438
then1437:
  %t6939 = load i64, ptr @"scheme.base:rat-ceil"
  call void @rt_check_callable(i64 %t6939)
  %t6940 = and i64 %t6939, -8
  %t6941 = inttoptr i64 %t6940 to ptr
  %t6942 = load i64, ptr %t6941
  %t6943 = inttoptr i64 %t6942 to ptr
  %t6944 = call fastcc i64%t6943(i64 %t6939, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6945 = or i64 %t6944, %a1
  %t6946 = and i64 %t6945, 7
  %t6947 = icmp eq i64 %t6946, 0
  br i1 %t6947, label %fixfast1439, label %fixslow1440
fixfast1439:
  %t6948 = icmp slt i64 %t6944, %a1
  %t6949 = select i1 %t6948, i64 257, i64 1
  br label %fixmerge1441
fixslow1440:
  %t6950 = call i64 @rt_lt(i64 %t6944, i64 %a1)
  br label %fixmerge1441
fixmerge1441:
  %t6951 = phi i64 [ %t6949, %fixfast1439 ], [ %t6950, %fixslow1440 ]
  %t6952 = icmp ne i64 %t6951, 1
  br i1 %t6952, label %then1442, label %else1443
then1442:
  br label %merge1444
else1443:
  %t6953 = or i64 %t6944, %a1
  %t6954 = and i64 %t6953, 7
  %t6955 = icmp eq i64 %t6954, 0
  br i1 %t6955, label %fixfast1445, label %fixslow1446
fixfast1445:
  %t6956 = icmp eq i64 %t6944, %a1
  %t6957 = select i1 %t6956, i64 257, i64 1
  br label %fixmerge1447
fixslow1446:
  %t6958 = call i64 @rt_num_eq(i64 %t6944, i64 %a1)
  br label %fixmerge1447
fixmerge1447:
  %t6959 = phi i64 [ %t6957, %fixfast1445 ], [ %t6958, %fixslow1446 ]
  br label %merge1444
merge1444:
  %t6960 = phi i64 [ 257, %then1442 ], [ %t6959, %fixmerge1447 ]
  %t6961 = icmp ne i64 %t6960, 1
  br i1 %t6961, label %then1448, label %else1449
then1448:
  %t6962 = load i64, ptr @"scheme.base:rat-ceil"
  call void @rt_check_callable(i64 %t6962)
  %t6963 = and i64 %t6962, -8
  %t6964 = inttoptr i64 %t6963 to ptr
  %t6965 = load i64, ptr %t6964
  %t6966 = inttoptr i64 %t6965 to ptr
  %t6967 = musttail call fastcc i64 %t6966(i64 %t6962, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6967
else1449:
  %t6968 = call i64 @rt_make_string(ptr @.str.lit.44, i64 69)
  %t6969 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t6969)
  %t6970 = and i64 %t6969, -8
  %t6971 = inttoptr i64 %t6970 to ptr
  %t6972 = load i64, ptr %t6971
  %t6973 = inttoptr i64 %t6972 to ptr
  %t6974 = musttail call fastcc i64 %t6973(i64 %t6969, i64 3, i64 %t6968, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t6974
else1438:
  %t6975 = load i64, ptr @"scheme.base:rat-floor"
  call void @rt_check_callable(i64 %t6975)
  %t6976 = and i64 %t6975, -8
  %t6977 = inttoptr i64 %t6976 to ptr
  %t6978 = load i64, ptr %t6977
  %t6979 = inttoptr i64 %t6978 to ptr
  %t6980 = call fastcc i64%t6979(i64 %t6975, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t6981 = or i64 %a0, %t6980
  %t6982 = and i64 %t6981, 7
  %t6983 = icmp eq i64 %t6982, 0
  br i1 %t6983, label %fixfast1450, label %fixslow1451
fixfast1450:
  %t6984 = icmp slt i64 %a0, %t6980
  %t6985 = select i1 %t6984, i64 257, i64 1
  br label %fixmerge1452
fixslow1451:
  %t6986 = call i64 @rt_lt(i64 %a0, i64 %t6980)
  br label %fixmerge1452
fixmerge1452:
  %t6987 = phi i64 [ %t6985, %fixfast1450 ], [ %t6986, %fixslow1451 ]
  %t6988 = icmp ne i64 %t6987, 1
  br i1 %t6988, label %then1453, label %else1454
then1453:
  br label %merge1455
else1454:
  %t6989 = or i64 %a0, %t6980
  %t6990 = and i64 %t6989, 7
  %t6991 = icmp eq i64 %t6990, 0
  br i1 %t6991, label %fixfast1456, label %fixslow1457
fixfast1456:
  %t6992 = icmp eq i64 %a0, %t6980
  %t6993 = select i1 %t6992, i64 257, i64 1
  br label %fixmerge1458
fixslow1457:
  %t6994 = call i64 @rt_num_eq(i64 %a0, i64 %t6980)
  br label %fixmerge1458
fixmerge1458:
  %t6995 = phi i64 [ %t6993, %fixfast1456 ], [ %t6994, %fixslow1457 ]
  br label %merge1455
merge1455:
  %t6996 = phi i64 [ 257, %then1453 ], [ %t6995, %fixmerge1458 ]
  %t6997 = icmp ne i64 %t6996, 1
  br i1 %t6997, label %then1459, label %else1460
then1459:
  %t6998 = load i64, ptr @"scheme.base:rat-floor"
  call void @rt_check_callable(i64 %t6998)
  %t6999 = and i64 %t6998, -8
  %t7000 = inttoptr i64 %t6999 to ptr
  %t7001 = load i64, ptr %t7000
  %t7002 = inttoptr i64 %t7001 to ptr
  %t7003 = musttail call fastcc i64 %t7002(i64 %t6998, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7003
else1460:
  %t7004 = call i64 @rt_make_string(ptr @.str.lit.45, i64 69)
  %t7005 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t7005)
  %t7006 = and i64 %t7005, -8
  %t7007 = inttoptr i64 %t7006 to ptr
  %t7008 = load i64, ptr %t7007
  %t7009 = inttoptr i64 %t7008 to ptr
  %t7010 = musttail call fastcc i64 %t7009(i64 %t7005, i64 3, i64 %t7004, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7010
}

define fastcc i64 @"scheme.base:code:rat-ceil"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7015 = icmp eq i64 %argc, 1
  br i1 %t7015, label %argok1462, label %arityerr1461
arityerr1461:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1462:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:rat-floor"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7020 = icmp eq i64 %argc, 1
  br i1 %t7020, label %argok1464, label %arityerr1463
arityerr1463:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1464:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code_1112"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7025 = icmp eq i64 %argc, 1
  br i1 %t7025, label %argok1466, label %arityerr1465
arityerr1465:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1466:
  %t7026 = load i64, ptr @"scheme.base:rat-max-denom"
  %t7027 = or i64 %t7026, %a0
  %t7028 = and i64 %t7027, 7
  %t7029 = icmp eq i64 %t7028, 0
  br i1 %t7029, label %fixfast1467, label %fixslow1468
fixfast1467:
  %t7030 = icmp slt i64 %t7026, %a0
  %t7031 = select i1 %t7030, i64 257, i64 1
  br label %fixmerge1469
fixslow1468:
  %t7032 = call i64 @rt_lt(i64 %t7026, i64 %a0)
  br label %fixmerge1469
fixmerge1469:
  %t7033 = phi i64 [ %t7031, %fixfast1467 ], [ %t7032, %fixslow1468 ]
  %t7034 = icmp ne i64 %t7033, 1
  br i1 %t7034, label %then1470, label %else1471
then1470:
  %t7035 = call i64 @rt_make_string(ptr @.str.lit.46, i64 59)
  %t7036 = and i64 %self, -8
  %t7037 = inttoptr i64 %t7036 to ptr
  %t7038 = getelementptr i64, ptr %t7037, i64 1
  %t7039 = load i64, ptr %t7038
  %t7040 = and i64 %self, -8
  %t7041 = inttoptr i64 %t7040 to ptr
  %t7042 = getelementptr i64, ptr %t7041, i64 2
  %t7043 = load i64, ptr %t7042
  %t7044 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t7044)
  %t7045 = and i64 %t7044, -8
  %t7046 = inttoptr i64 %t7045 to ptr
  %t7047 = load i64, ptr %t7046
  %t7048 = inttoptr i64 %t7047 to ptr
  %t7049 = musttail call fastcc i64 %t7048(i64 %t7044, i64 3, i64 %t7035, i64 %t7039, i64 %t7043, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7049
else1471:
  %t7050 = and i64 %self, -8
  %t7051 = inttoptr i64 %t7050 to ptr
  %t7052 = getelementptr i64, ptr %t7051, i64 1
  %t7053 = load i64, ptr %t7052
  %t7054 = or i64 %t7053, %a0
  %t7055 = and i64 %t7054, 7
  %t7056 = icmp eq i64 %t7055, 0
  br i1 %t7056, label %fixfast1472, label %fixslow1473
fixfast1472:
  %t7057 = ashr i64 %t7053, 3
  %t7058 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t7057, i64 %a0)
  %t7059 = extractvalue {i64, i1} %t7058, 0
  %t7060 = extractvalue {i64, i1} %t7058, 1
  br i1 %t7060, label %fixslow1473, label %fixmerge1474
fixslow1473:
  %t7061 = call i64 @rt_mul(i64 %t7053, i64 %a0)
  br label %fixmerge1474
fixmerge1474:
  %t7062 = phi i64 [ %t7059, %fixfast1472 ], [ %t7061, %fixslow1473 ]
  %t7063 = and i64 %self, -8
  %t7064 = inttoptr i64 %t7063 to ptr
  %t7065 = getelementptr i64, ptr %t7064, i64 2
  %t7066 = load i64, ptr %t7065
  %t7067 = or i64 %t7066, %a0
  %t7068 = and i64 %t7067, 7
  %t7069 = icmp eq i64 %t7068, 0
  br i1 %t7069, label %fixfast1475, label %fixslow1476
fixfast1475:
  %t7070 = ashr i64 %t7066, 3
  %t7071 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t7070, i64 %a0)
  %t7072 = extractvalue {i64, i1} %t7071, 0
  %t7073 = extractvalue {i64, i1} %t7071, 1
  br i1 %t7073, label %fixslow1476, label %fixmerge1477
fixslow1476:
  %t7074 = call i64 @rt_mul(i64 %t7066, i64 %a0)
  br label %fixmerge1477
fixmerge1477:
  %t7075 = phi i64 [ %t7072, %fixfast1475 ], [ %t7074, %fixslow1476 ]
  %t7076 = load i64, ptr @"scheme.base:rat-num-in"
  call void @rt_check_callable(i64 %t7076)
  %t7077 = and i64 %t7076, -8
  %t7078 = inttoptr i64 %t7077 to ptr
  %t7079 = load i64, ptr %t7078
  %t7080 = inttoptr i64 %t7079 to ptr
  %t7081 = call fastcc i64%t7080(i64 %t7076, i64 2, i64 %t7062, i64 %t7075, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7082 = icmp ne i64 %t7081, 1
  br i1 %t7082, label %then1478, label %else1479
then1478:
  %t7083 = call i64 @rt_exact_to_inexact(i64 %t7081)
  %t7084 = call i64 @rt_exact_to_inexact(i64 %a0)
  %t7085 = call i64 @rt_div(i64 %t7083, i64 %t7084)
  ret i64 %t7085
else1479:
  %t7086 = or i64 %a0, 8
  %t7087 = and i64 %t7086, 7
  %t7088 = icmp eq i64 %t7087, 0
  br i1 %t7088, label %fixfast1480, label %fixslow1481
fixfast1480:
  %t7089 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t7090 = extractvalue {i64, i1} %t7089, 0
  %t7091 = extractvalue {i64, i1} %t7089, 1
  br i1 %t7091, label %fixslow1481, label %fixmerge1482
fixslow1481:
  %t7092 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1482
fixmerge1482:
  %t7093 = phi i64 [ %t7090, %fixfast1480 ], [ %t7092, %fixslow1481 ]
  %t7094 = musttail call fastcc i64 @"scheme.base:code_1112"(i64 %self, i64 1, i64 %t7093, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7094
}

define fastcc i64 @"scheme.base:code:rat-inexact"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7095 = icmp eq i64 %argc, 2
  br i1 %t7095, label %argok1484, label %arityerr1483
arityerr1483:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1484:
  %t7096 = call i64 @rt_flonum_lit(ptr @.flo.lit.47)
  %t7097 = or i64 %a0, %t7096
  %t7098 = and i64 %t7097, 7
  %t7099 = icmp eq i64 %t7098, 0
  br i1 %t7099, label %fixfast1485, label %fixslow1486
fixfast1485:
  %t7100 = icmp slt i64 %a0, %t7096
  %t7101 = select i1 %t7100, i64 257, i64 1
  br label %fixmerge1487
fixslow1486:
  %t7102 = call i64 @rt_lt(i64 %a0, i64 %t7096)
  br label %fixmerge1487
fixmerge1487:
  %t7103 = phi i64 [ %t7101, %fixfast1485 ], [ %t7102, %fixslow1486 ]
  %t7104 = icmp ne i64 %t7103, 1
  br i1 %t7104, label %then1488, label %else1489
then1488:
  br label %merge1490
else1489:
  %t7105 = or i64 %a0, %t7096
  %t7106 = and i64 %t7105, 7
  %t7107 = icmp eq i64 %t7106, 0
  br i1 %t7107, label %fixfast1491, label %fixslow1492
fixfast1491:
  %t7108 = icmp eq i64 %a0, %t7096
  %t7109 = select i1 %t7108, i64 257, i64 1
  br label %fixmerge1493
fixslow1492:
  %t7110 = call i64 @rt_num_eq(i64 %a0, i64 %t7096)
  br label %fixmerge1493
fixmerge1493:
  %t7111 = phi i64 [ %t7109, %fixfast1491 ], [ %t7110, %fixslow1492 ]
  br label %merge1490
merge1490:
  %t7112 = phi i64 [ 257, %then1488 ], [ %t7111, %fixmerge1493 ]
  %t7113 = icmp ne i64 %t7112, 1
  br i1 %t7113, label %then1494, label %else1495
then1494:
  %t7114 = call i64 @rt_flonum_lit(ptr @.flo.lit.48)
  %t7115 = or i64 %t7114, %a1
  %t7116 = and i64 %t7115, 7
  %t7117 = icmp eq i64 %t7116, 0
  br i1 %t7117, label %fixfast1497, label %fixslow1498
fixfast1497:
  %t7118 = icmp slt i64 %t7114, %a1
  %t7119 = select i1 %t7118, i64 257, i64 1
  br label %fixmerge1499
fixslow1498:
  %t7120 = call i64 @rt_lt(i64 %t7114, i64 %a1)
  br label %fixmerge1499
fixmerge1499:
  %t7121 = phi i64 [ %t7119, %fixfast1497 ], [ %t7120, %fixslow1498 ]
  %t7122 = icmp ne i64 %t7121, 1
  br i1 %t7122, label %then1500, label %else1501
then1500:
  br label %merge1502
else1501:
  %t7123 = or i64 %t7114, %a1
  %t7124 = and i64 %t7123, 7
  %t7125 = icmp eq i64 %t7124, 0
  br i1 %t7125, label %fixfast1503, label %fixslow1504
fixfast1503:
  %t7126 = icmp eq i64 %t7114, %a1
  %t7127 = select i1 %t7126, i64 257, i64 1
  br label %fixmerge1505
fixslow1504:
  %t7128 = call i64 @rt_num_eq(i64 %t7114, i64 %a1)
  br label %fixmerge1505
fixmerge1505:
  %t7129 = phi i64 [ %t7127, %fixfast1503 ], [ %t7128, %fixslow1504 ]
  br label %merge1502
merge1502:
  %t7130 = phi i64 [ 257, %then1500 ], [ %t7129, %fixmerge1505 ]
  br label %merge1496
else1495:
  br label %merge1496
merge1496:
  %t7131 = phi i64 [ %t7130, %merge1502 ], [ 1, %else1495 ]
  %t7132 = icmp ne i64 %t7131, 1
  br i1 %t7132, label %then1506, label %else1507
then1506:
  %t7133 = call i64 @rt_flonum_lit(ptr @.flo.lit.49)
  ret i64 %t7133
else1507:
  %t7134 = call ptr @rt_alloc_words(i64 4)
  %t7135 = ptrtoint ptr %t7134 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1112" to i64), ptr %t7134
  %t7136 = or i64 %t7135, 4
  %t7137 = getelementptr i64, ptr %t7134, i64 1
  store i64 %a0, ptr %t7137
  %t7138 = getelementptr i64, ptr %t7134, i64 2
  store i64 %a1, ptr %t7138
  %t7139 = getelementptr i64, ptr %t7134, i64 3
  store i64 %t7136, ptr %t7139
  %t7140 = musttail call fastcc i64 @"scheme.base:code_1112"(i64 %t7136, i64 1, i64 8, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7140
}

define fastcc i64 @"scheme.base:code:rat-num-in"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7145 = icmp eq i64 %argc, 2
  br i1 %t7145, label %argok1509, label %arityerr1508
arityerr1508:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1509:
  %t7146 = load i64, ptr @"scheme.base:rat-ceil-flo"
  call void @rt_check_callable(i64 %t7146)
  %t7147 = and i64 %t7146, -8
  %t7148 = inttoptr i64 %t7147 to ptr
  %t7149 = load i64, ptr %t7148
  %t7150 = inttoptr i64 %t7149 to ptr
  %t7151 = call fastcc i64%t7150(i64 %t7146, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7152 = call i64 @rt_exact_to_inexact(i64 %t7151)
  %t7153 = or i64 %t7152, %a1
  %t7154 = and i64 %t7153, 7
  %t7155 = icmp eq i64 %t7154, 0
  br i1 %t7155, label %fixfast1510, label %fixslow1511
fixfast1510:
  %t7156 = icmp slt i64 %t7152, %a1
  %t7157 = select i1 %t7156, i64 257, i64 1
  br label %fixmerge1512
fixslow1511:
  %t7158 = call i64 @rt_lt(i64 %t7152, i64 %a1)
  br label %fixmerge1512
fixmerge1512:
  %t7159 = phi i64 [ %t7157, %fixfast1510 ], [ %t7158, %fixslow1511 ]
  %t7160 = icmp ne i64 %t7159, 1
  br i1 %t7160, label %then1513, label %else1514
then1513:
  br label %merge1515
else1514:
  %t7161 = or i64 %t7152, %a1
  %t7162 = and i64 %t7161, 7
  %t7163 = icmp eq i64 %t7162, 0
  br i1 %t7163, label %fixfast1516, label %fixslow1517
fixfast1516:
  %t7164 = icmp eq i64 %t7152, %a1
  %t7165 = select i1 %t7164, i64 257, i64 1
  br label %fixmerge1518
fixslow1517:
  %t7166 = call i64 @rt_num_eq(i64 %t7152, i64 %a1)
  br label %fixmerge1518
fixmerge1518:
  %t7167 = phi i64 [ %t7165, %fixfast1516 ], [ %t7166, %fixslow1517 ]
  br label %merge1515
merge1515:
  %t7168 = phi i64 [ 257, %then1513 ], [ %t7167, %fixmerge1518 ]
  %t7169 = icmp ne i64 %t7168, 1
  br i1 %t7169, label %then1519, label %else1520
then1519:
  ret i64 %t7151
else1520:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:rat-ceil-flo"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7174 = icmp eq i64 %argc, 1
  br i1 %t7174, label %argok1522, label %arityerr1521
arityerr1521:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1522:
  %t7175 = load i64, ptr @"scheme.base:floor"
  call void @rt_check_callable(i64 %t7175)
  %t7176 = and i64 %t7175, -8
  %t7177 = inttoptr i64 %t7176 to ptr
  %t7178 = load i64, ptr %t7177
  %t7179 = inttoptr i64 %t7178 to ptr
  %t7180 = call fastcc i64%t7179(i64 %t7175, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7181 = call i64 @rt_inexact_to_exact(i64 %t7180)
  %t7182 = call i64 @rt_exact_to_inexact(i64 %t7181)
  %t7183 = or i64 %t7182, %a0
  %t7184 = and i64 %t7183, 7
  %t7185 = icmp eq i64 %t7184, 0
  br i1 %t7185, label %fixfast1523, label %fixslow1524
fixfast1523:
  %t7186 = icmp slt i64 %t7182, %a0
  %t7187 = select i1 %t7186, i64 257, i64 1
  br label %fixmerge1525
fixslow1524:
  %t7188 = call i64 @rt_lt(i64 %t7182, i64 %a0)
  br label %fixmerge1525
fixmerge1525:
  %t7189 = phi i64 [ %t7187, %fixfast1523 ], [ %t7188, %fixslow1524 ]
  %t7190 = icmp ne i64 %t7189, 1
  br i1 %t7190, label %then1526, label %else1527
then1526:
  %t7191 = or i64 %t7181, 8
  %t7192 = and i64 %t7191, 7
  %t7193 = icmp eq i64 %t7192, 0
  br i1 %t7193, label %fixfast1528, label %fixslow1529
fixfast1528:
  %t7194 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t7181, i64 8)
  %t7195 = extractvalue {i64, i1} %t7194, 0
  %t7196 = extractvalue {i64, i1} %t7194, 1
  br i1 %t7196, label %fixslow1529, label %fixmerge1530
fixslow1529:
  %t7197 = call i64 @rt_add(i64 %t7181, i64 8)
  br label %fixmerge1530
fixmerge1530:
  %t7198 = phi i64 [ %t7195, %fixfast1528 ], [ %t7197, %fixslow1529 ]
  ret i64 %t7198
else1527:
  ret i64 %t7181
}

define fastcc i64 @"scheme.base:code:values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7203 = icmp sge i64 %argc, 0
  br i1 %t7203, label %argok1532, label %arityerr1531
arityerr1531:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1532:
  %t7204 = call ptr @rt_alloc_words(i64 8)
  %t7205 = getelementptr i64, ptr %t7204, i64 0
  store i64 %a0, ptr %t7205
  %t7206 = getelementptr i64, ptr %t7204, i64 1
  store i64 %a1, ptr %t7206
  %t7207 = getelementptr i64, ptr %t7204, i64 2
  store i64 %a2, ptr %t7207
  %t7208 = getelementptr i64, ptr %t7204, i64 3
  store i64 %a3, ptr %t7208
  %t7209 = getelementptr i64, ptr %t7204, i64 4
  store i64 %a4, ptr %t7209
  %t7210 = getelementptr i64, ptr %t7204, i64 5
  store i64 %a5, ptr %t7210
  %t7211 = getelementptr i64, ptr %t7204, i64 6
  store i64 %a6, ptr %t7211
  %t7212 = getelementptr i64, ptr %t7204, i64 7
  store i64 %a7, ptr %t7212
  %t7213 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t7204, ptr %overflow)
  %t7214 = call i64 @rt_pair_p(i64 %t7213)
  %t7215 = icmp ne i64 %t7214, 1
  br i1 %t7215, label %then1533, label %else1534
then1533:
  %t7216 = call i64 @rt_cdr(i64 %t7213)
  %t7217 = call i64 @rt_null_p(i64 %t7216)
  br label %merge1535
else1534:
  br label %merge1535
merge1535:
  %t7218 = phi i64 [ %t7217, %then1533 ], [ 1, %else1534 ]
  %t7219 = icmp ne i64 %t7218, 1
  br i1 %t7219, label %then1536, label %else1537
then1536:
  %t7220 = call i64 @rt_car(i64 %t7213)
  ret i64 %t7220
else1537:
  %t7221 = call i64 @rt_list_to_mv(i64 %t7213)
  ret i64 %t7221
}

define fastcc i64 @"min-entry:$scheme.base$ccode$cvalues"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7222 = call i64 @rt_pair_p(i64 2)
  %t7223 = icmp ne i64 %t7222, 1
  br i1 %t7223, label %then1538, label %else1539
then1538:
  %t7224 = call i64 @rt_cdr(i64 2)
  %t7225 = call i64 @rt_null_p(i64 %t7224)
  br label %merge1540
else1539:
  br label %merge1540
merge1540:
  %t7226 = phi i64 [ %t7225, %then1538 ], [ 1, %else1539 ]
  %t7227 = icmp ne i64 %t7226, 1
  br i1 %t7227, label %then1541, label %else1542
then1541:
  %t7228 = call i64 @rt_car(i64 2)
  ret i64 %t7228
else1542:
  %t7229 = call i64 @rt_list_to_mv(i64 2)
  ret i64 %t7229
}

define fastcc i64 @"scheme.base:code:call-with-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7234 = icmp eq i64 %argc, 2
  br i1 %t7234, label %argok1544, label %arityerr1543
arityerr1543:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1544:
  call void @rt_check_callable(i64 %a0)
  %t7235 = and i64 %a0, -8
  %t7236 = inttoptr i64 %t7235 to ptr
  %t7237 = load i64, ptr %t7236
  %t7238 = inttoptr i64 %t7237 to ptr
  %t7239 = call fastcc i64%t7238(i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7240 = call i64 @rt_mv_p(i64 %t7239)
  %t7241 = icmp ne i64 %t7240, 1
  br i1 %t7241, label %then1545, label %else1546
then1545:
  %t7242 = call i64 @rt_mv_to_list(i64 %t7239)
  call void @rt_check_callable(i64 %a1)
  %t7243 = and i64 %a1, -8
  %t7244 = inttoptr i64 %t7243 to ptr
  %t7245 = load i64, ptr %t7244
  %t7246 = inttoptr i64 %t7245 to ptr
  %t7247 = call i64 @rt_list_length(i64 %t7242)
  %t7248 = add i64 0, %t7247
  %t7249 = call ptr @rt_apply_argv(i64 0, ptr null, i64 %t7242, i64 8)
  %t7261 = getelementptr i64, ptr %t7249, i64 0
  %t7253 = load i64, ptr %t7261
  %t7262 = getelementptr i64, ptr %t7249, i64 1
  %t7254 = load i64, ptr %t7262
  %t7263 = getelementptr i64, ptr %t7249, i64 2
  %t7255 = load i64, ptr %t7263
  %t7264 = getelementptr i64, ptr %t7249, i64 3
  %t7256 = load i64, ptr %t7264
  %t7265 = getelementptr i64, ptr %t7249, i64 4
  %t7257 = load i64, ptr %t7265
  %t7266 = getelementptr i64, ptr %t7249, i64 5
  %t7258 = load i64, ptr %t7266
  %t7267 = getelementptr i64, ptr %t7249, i64 6
  %t7259 = load i64, ptr %t7267
  %t7268 = getelementptr i64, ptr %t7249, i64 7
  %t7260 = load i64, ptr %t7268
  %t7250 = icmp sgt i64 %t7248, 8
  %t7251 = getelementptr i64, ptr %t7249, i64 8
  %t7252 = select i1 %t7250, ptr %t7251, ptr null
  %t7269 = musttail call fastcc i64 %t7246(i64 %a1, i64 %t7248, i64 %t7253, i64 %t7254, i64 %t7255, i64 %t7256, i64 %t7257, i64 %t7258, i64 %t7259, i64 %t7260, ptr %t7252)
  ret i64 %t7269
else1546:
  call void @rt_check_callable(i64 %a1)
  %t7270 = and i64 %a1, -8
  %t7271 = inttoptr i64 %t7270 to ptr
  %t7272 = load i64, ptr %t7271
  %t7273 = inttoptr i64 %t7272 to ptr
  %t7274 = musttail call fastcc i64 %t7273(i64 %a1, i64 1, i64 %t7239, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7274
}

define fastcc i64 @"scheme.base:code:make-hash-table"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7281 = icmp eq i64 %argc, 0
  br i1 %t7281, label %argok1548, label %arityerr1547
arityerr1547:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1548:
  %t7282 = load i64, ptr @"scheme.base:%ht-initial-buckets"
  %t7283 = call i64 @rt_make_vector(i64 %t7282, i64 2)
  %t7284 = load i64, ptr @"scheme.base:vector"
  call void @rt_check_callable(i64 %t7284)
  %t7285 = and i64 %t7284, -8
  %t7286 = inttoptr i64 %t7285 to ptr
  %t7287 = load i64, ptr %t7286
  %t7288 = inttoptr i64 %t7287 to ptr
  %t7289 = call fastcc i64%t7288(i64 %t7284, i64 3, i64 0, i64 %t7283, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7290 = call i64 @rt_make_hash_table(i64 %t7289)
  ret i64 %t7290
}

define fastcc i64 @"scheme.base:code:make-eq-hash-table"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7295 = icmp eq i64 %argc, 0
  br i1 %t7295, label %argok1550, label %arityerr1549
arityerr1549:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1550:
  %t7296 = load i64, ptr @"scheme.base:%ht-initial-buckets"
  %t7297 = call i64 @rt_make_vector(i64 %t7296, i64 2)
  %t7298 = load i64, ptr @"scheme.base:vector"
  call void @rt_check_callable(i64 %t7298)
  %t7299 = and i64 %t7298, -8
  %t7300 = inttoptr i64 %t7299 to ptr
  %t7301 = load i64, ptr %t7300
  %t7302 = inttoptr i64 %t7301 to ptr
  %t7303 = call fastcc i64%t7302(i64 %t7298, i64 3, i64 0, i64 %t7297, i64 257, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7304 = call i64 @rt_make_hash_table(i64 %t7303)
  ret i64 %t7304
}

define fastcc i64 @"scheme.base:code:hash-table?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7309 = icmp eq i64 %argc, 1
  br i1 %t7309, label %argok1552, label %arityerr1551
arityerr1551:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1552:
  %t7310 = call i64 @rt_hash_table_p(i64 %a0)
  ret i64 %t7310
}

define fastcc i64 @"scheme.base:code:%ht-count"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7315 = icmp eq i64 %argc, 1
  br i1 %t7315, label %argok1554, label %arityerr1553
arityerr1553:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1554:
  %t7316 = call i64 @rt_hash_table_spine(i64 %a0)
  %t7317 = call i64 @rt_vector_ref(i64 %t7316, i64 0)
  ret i64 %t7317
}

define fastcc i64 @"scheme.base:code:%ht-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7322 = icmp eq i64 %argc, 1
  br i1 %t7322, label %argok1556, label %arityerr1555
arityerr1555:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1556:
  %t7323 = call i64 @rt_hash_table_spine(i64 %a0)
  %t7324 = call i64 @rt_vector_ref(i64 %t7323, i64 8)
  ret i64 %t7324
}

define fastcc i64 @"scheme.base:code:%ht-identity?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7329 = icmp eq i64 %argc, 1
  br i1 %t7329, label %argok1558, label %arityerr1557
arityerr1557:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1558:
  %t7330 = call i64 @rt_hash_table_spine(i64 %a0)
  %t7331 = call i64 @rt_vector_ref(i64 %t7330, i64 16)
  ret i64 %t7331
}

define fastcc i64 @"scheme.base:code:%ht-set-count!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7336 = icmp eq i64 %argc, 2
  br i1 %t7336, label %argok1560, label %arityerr1559
arityerr1559:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1560:
  %t7337 = call i64 @rt_hash_table_spine(i64 %a0)
  %t7338 = call i64 @rt_vector_set(i64 %t7337, i64 0, i64 %a1)
  ret i64 %t7338
}

define fastcc i64 @"scheme.base:code:%ht-set-buckets!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7343 = icmp eq i64 %argc, 2
  br i1 %t7343, label %argok1562, label %arityerr1561
arityerr1561:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1562:
  %t7344 = call i64 @rt_hash_table_spine(i64 %a0)
  %t7345 = call i64 @rt_vector_set(i64 %t7344, i64 8, i64 %a1)
  ret i64 %t7345
}

define fastcc i64 @"scheme.base:code:%ht-hash"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7350 = icmp eq i64 %argc, 2
  br i1 %t7350, label %argok1564, label %arityerr1563
arityerr1563:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1564:
  %t7351 = load i64, ptr @"scheme.base:%ht-identity?"
  call void @rt_check_callable(i64 %t7351)
  %t7352 = and i64 %t7351, -8
  %t7353 = inttoptr i64 %t7352 to ptr
  %t7354 = load i64, ptr %t7353
  %t7355 = inttoptr i64 %t7354 to ptr
  %t7356 = call fastcc i64%t7355(i64 %t7351, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7357 = icmp ne i64 %t7356, 1
  br i1 %t7357, label %then1565, label %else1566
then1565:
  %t7358 = call i64 @rt_eq_hash(i64 %a1)
  ret i64 %t7358
else1566:
  %t7359 = call i64 @rt_hash(i64 %a1)
  ret i64 %t7359
}

define fastcc i64 @"scheme.base:code:%ht-key=?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7364 = icmp eq i64 %argc, 3
  br i1 %t7364, label %argok1568, label %arityerr1567
arityerr1567:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1568:
  %t7365 = load i64, ptr @"scheme.base:%ht-identity?"
  call void @rt_check_callable(i64 %t7365)
  %t7366 = and i64 %t7365, -8
  %t7367 = inttoptr i64 %t7366 to ptr
  %t7368 = load i64, ptr %t7367
  %t7369 = inttoptr i64 %t7368 to ptr
  %t7370 = call fastcc i64%t7369(i64 %t7365, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7371 = icmp ne i64 %t7370, 1
  br i1 %t7371, label %then1569, label %else1570
then1569:
  %t7372 = call i64 @rt_eq_p(i64 %a1, i64 %a2)
  ret i64 %t7372
else1570:
  %t7373 = call i64 @rt_equal(i64 %a1, i64 %a2)
  ret i64 %t7373
}

define fastcc i64 @"scheme.base:code:%ht-index"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7378 = icmp eq i64 %argc, 3
  br i1 %t7378, label %argok1572, label %arityerr1571
arityerr1571:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1572:
  %t7379 = load i64, ptr @"scheme.base:%ht-hash"
  call void @rt_check_callable(i64 %t7379)
  %t7380 = and i64 %t7379, -8
  %t7381 = inttoptr i64 %t7380 to ptr
  %t7382 = load i64, ptr %t7381
  %t7383 = inttoptr i64 %t7382 to ptr
  %t7384 = call fastcc i64%t7383(i64 %t7379, i64 2, i64 %a0, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7385 = call i64 @rt_remainder(i64 %t7384, i64 %a2)
  ret i64 %t7385
}

define fastcc i64 @"scheme.base:code:%ht-assoc"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7390 = icmp eq i64 %argc, 3
  br i1 %t7390, label %argok1574, label %arityerr1573
arityerr1573:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1574:
  %t7391 = call i64 @rt_null_p(i64 %a2)
  %t7392 = icmp ne i64 %t7391, 1
  br i1 %t7392, label %then1575, label %else1576
then1575:
  ret i64 1
else1576:
  %t7393 = call i64 @rt_car(i64 %a2)
  %t7394 = call i64 @rt_car(i64 %t7393)
  %t7395 = load i64, ptr @"scheme.base:%ht-key=?"
  call void @rt_check_callable(i64 %t7395)
  %t7396 = and i64 %t7395, -8
  %t7397 = inttoptr i64 %t7396 to ptr
  %t7398 = load i64, ptr %t7397
  %t7399 = inttoptr i64 %t7398 to ptr
  %t7400 = call fastcc i64%t7399(i64 %t7395, i64 3, i64 %a0, i64 %a1, i64 %t7394, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7401 = icmp ne i64 %t7400, 1
  br i1 %t7401, label %then1577, label %else1578
then1577:
  %t7402 = call i64 @rt_car(i64 %a2)
  ret i64 %t7402
else1578:
  %t7403 = call i64 @rt_cdr(i64 %a2)
  %t7404 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t7404)
  %t7405 = and i64 %t7404, -8
  %t7406 = inttoptr i64 %t7405 to ptr
  %t7407 = load i64, ptr %t7406
  %t7408 = inttoptr i64 %t7407 to ptr
  %t7409 = musttail call fastcc i64 %t7408(i64 %t7404, i64 3, i64 %a0, i64 %a1, i64 %t7403, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7409
}

define fastcc i64 @"scheme.base:code:%ht-remove"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7414 = icmp eq i64 %argc, 3
  br i1 %t7414, label %argok1580, label %arityerr1579
arityerr1579:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1580:
  %t7415 = call i64 @rt_null_p(i64 %a2)
  %t7416 = icmp ne i64 %t7415, 1
  br i1 %t7416, label %then1581, label %else1582
then1581:
  ret i64 2
else1582:
  %t7417 = call i64 @rt_car(i64 %a2)
  %t7418 = call i64 @rt_car(i64 %t7417)
  %t7419 = load i64, ptr @"scheme.base:%ht-key=?"
  call void @rt_check_callable(i64 %t7419)
  %t7420 = and i64 %t7419, -8
  %t7421 = inttoptr i64 %t7420 to ptr
  %t7422 = load i64, ptr %t7421
  %t7423 = inttoptr i64 %t7422 to ptr
  %t7424 = call fastcc i64%t7423(i64 %t7419, i64 3, i64 %a0, i64 %a1, i64 %t7418, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7425 = icmp ne i64 %t7424, 1
  br i1 %t7425, label %then1583, label %else1584
then1583:
  %t7426 = call i64 @rt_cdr(i64 %a2)
  ret i64 %t7426
else1584:
  %t7427 = call i64 @rt_car(i64 %a2)
  %t7428 = call i64 @rt_cdr(i64 %a2)
  %t7429 = load i64, ptr @"scheme.base:%ht-remove"
  call void @rt_check_callable(i64 %t7429)
  %t7430 = and i64 %t7429, -8
  %t7431 = inttoptr i64 %t7430 to ptr
  %t7432 = load i64, ptr %t7431
  %t7433 = inttoptr i64 %t7432 to ptr
  %t7434 = call fastcc i64%t7433(i64 %t7429, i64 3, i64 %a0, i64 %a1, i64 %t7428, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7435 = call i64 @rt_cons(i64 %t7427, i64 %t7434)
  ret i64 %t7435
}

define fastcc i64 @"scheme.base:code:hash-table-ref/default"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7440 = icmp eq i64 %argc, 3
  br i1 %t7440, label %argok1586, label %arityerr1585
arityerr1585:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1586:
  %t7441 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7441)
  %t7442 = and i64 %t7441, -8
  %t7443 = inttoptr i64 %t7442 to ptr
  %t7444 = load i64, ptr %t7443
  %t7445 = inttoptr i64 %t7444 to ptr
  %t7446 = call fastcc i64%t7445(i64 %t7441, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7447 = call i64 @rt_vector_length(i64 %t7446)
  %t7448 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t7448)
  %t7449 = and i64 %t7448, -8
  %t7450 = inttoptr i64 %t7449 to ptr
  %t7451 = load i64, ptr %t7450
  %t7452 = inttoptr i64 %t7451 to ptr
  %t7453 = call fastcc i64%t7452(i64 %t7448, i64 3, i64 %a0, i64 %a1, i64 %t7447, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7454 = call i64 @rt_vector_ref(i64 %t7446, i64 %t7453)
  %t7455 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t7455)
  %t7456 = and i64 %t7455, -8
  %t7457 = inttoptr i64 %t7456 to ptr
  %t7458 = load i64, ptr %t7457
  %t7459 = inttoptr i64 %t7458 to ptr
  %t7460 = call fastcc i64%t7459(i64 %t7455, i64 3, i64 %a0, i64 %a1, i64 %t7454, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7461 = icmp ne i64 %t7460, 1
  br i1 %t7461, label %then1587, label %else1588
then1587:
  %t7462 = call i64 @rt_cdr(i64 %t7460)
  ret i64 %t7462
else1588:
  ret i64 %a2
}

define fastcc i64 @"scheme.base:code:hash-table-contains?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7467 = icmp eq i64 %argc, 2
  br i1 %t7467, label %argok1590, label %arityerr1589
arityerr1589:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1590:
  %t7468 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7468)
  %t7469 = and i64 %t7468, -8
  %t7470 = inttoptr i64 %t7469 to ptr
  %t7471 = load i64, ptr %t7470
  %t7472 = inttoptr i64 %t7471 to ptr
  %t7473 = call fastcc i64%t7472(i64 %t7468, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7474 = call i64 @rt_vector_length(i64 %t7473)
  %t7475 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t7475)
  %t7476 = and i64 %t7475, -8
  %t7477 = inttoptr i64 %t7476 to ptr
  %t7478 = load i64, ptr %t7477
  %t7479 = inttoptr i64 %t7478 to ptr
  %t7480 = call fastcc i64%t7479(i64 %t7475, i64 3, i64 %a0, i64 %a1, i64 %t7474, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7481 = call i64 @rt_vector_ref(i64 %t7473, i64 %t7480)
  %t7482 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t7482)
  %t7483 = and i64 %t7482, -8
  %t7484 = inttoptr i64 %t7483 to ptr
  %t7485 = load i64, ptr %t7484
  %t7486 = inttoptr i64 %t7485 to ptr
  %t7487 = call fastcc i64%t7486(i64 %t7482, i64 3, i64 %a0, i64 %a1, i64 %t7481, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7488 = icmp ne i64 %t7487, 1
  br i1 %t7488, label %then1591, label %else1592
then1591:
  ret i64 257
else1592:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-ref"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7493 = icmp eq i64 %argc, 2
  br i1 %t7493, label %argok1594, label %arityerr1593
arityerr1593:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1594:
  %t7494 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7494)
  %t7495 = and i64 %t7494, -8
  %t7496 = inttoptr i64 %t7495 to ptr
  %t7497 = load i64, ptr %t7496
  %t7498 = inttoptr i64 %t7497 to ptr
  %t7499 = call fastcc i64%t7498(i64 %t7494, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7500 = call i64 @rt_vector_length(i64 %t7499)
  %t7501 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t7501)
  %t7502 = and i64 %t7501, -8
  %t7503 = inttoptr i64 %t7502 to ptr
  %t7504 = load i64, ptr %t7503
  %t7505 = inttoptr i64 %t7504 to ptr
  %t7506 = call fastcc i64%t7505(i64 %t7501, i64 3, i64 %a0, i64 %a1, i64 %t7500, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7507 = call i64 @rt_vector_ref(i64 %t7499, i64 %t7506)
  %t7508 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t7508)
  %t7509 = and i64 %t7508, -8
  %t7510 = inttoptr i64 %t7509 to ptr
  %t7511 = load i64, ptr %t7510
  %t7512 = inttoptr i64 %t7511 to ptr
  %t7513 = call fastcc i64%t7512(i64 %t7508, i64 3, i64 %a0, i64 %a1, i64 %t7507, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7514 = icmp ne i64 %t7513, 1
  br i1 %t7514, label %then1595, label %else1596
then1595:
  %t7515 = call i64 @rt_cdr(i64 %t7513)
  ret i64 %t7515
else1596:
  %t7516 = call i64 @rt_make_string(ptr @.str.lit.50, i64 29)
  %t7517 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t7517)
  %t7518 = and i64 %t7517, -8
  %t7519 = inttoptr i64 %t7518 to ptr
  %t7520 = load i64, ptr %t7519
  %t7521 = inttoptr i64 %t7520 to ptr
  %t7522 = musttail call fastcc i64 %t7521(i64 %t7517, i64 2, i64 %t7516, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7522
}

define fastcc i64 @"scheme.base:code:hash-table-set!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7527 = icmp eq i64 %argc, 3
  br i1 %t7527, label %argok1598, label %arityerr1597
arityerr1597:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1598:
  %t7528 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7528)
  %t7529 = and i64 %t7528, -8
  %t7530 = inttoptr i64 %t7529 to ptr
  %t7531 = load i64, ptr %t7530
  %t7532 = inttoptr i64 %t7531 to ptr
  %t7533 = call fastcc i64%t7532(i64 %t7528, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7534 = call i64 @rt_vector_length(i64 %t7533)
  %t7535 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t7535)
  %t7536 = and i64 %t7535, -8
  %t7537 = inttoptr i64 %t7536 to ptr
  %t7538 = load i64, ptr %t7537
  %t7539 = inttoptr i64 %t7538 to ptr
  %t7540 = call fastcc i64%t7539(i64 %t7535, i64 3, i64 %a0, i64 %a1, i64 %t7534, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7541 = call i64 @rt_vector_ref(i64 %t7533, i64 %t7540)
  %t7542 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t7542)
  %t7543 = and i64 %t7542, -8
  %t7544 = inttoptr i64 %t7543 to ptr
  %t7545 = load i64, ptr %t7544
  %t7546 = inttoptr i64 %t7545 to ptr
  %t7547 = call fastcc i64%t7546(i64 %t7542, i64 3, i64 %a0, i64 %a1, i64 %t7541, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7548 = call i64 @rt_cons(i64 %a1, i64 %a2)
  %t7549 = icmp ne i64 %t7547, 1
  br i1 %t7549, label %then1599, label %else1600
then1599:
  %t7550 = load i64, ptr @"scheme.base:%ht-remove"
  call void @rt_check_callable(i64 %t7550)
  %t7551 = and i64 %t7550, -8
  %t7552 = inttoptr i64 %t7551 to ptr
  %t7553 = load i64, ptr %t7552
  %t7554 = inttoptr i64 %t7553 to ptr
  %t7555 = call fastcc i64%t7554(i64 %t7550, i64 3, i64 %a0, i64 %a1, i64 %t7541, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  br label %merge1601
else1600:
  br label %merge1601
merge1601:
  %t7556 = phi i64 [ %t7555, %then1599 ], [ %t7541, %else1600 ]
  %t7557 = call i64 @rt_cons(i64 %t7548, i64 %t7556)
  %t7558 = call i64 @rt_vector_set(i64 %t7533, i64 %t7540, i64 %t7557)
  %t7559 = icmp ne i64 %t7547, 1
  br i1 %t7559, label %then1602, label %else1603
then1602:
  ret i64 1
else1603:
  %t7560 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t7560)
  %t7561 = and i64 %t7560, -8
  %t7562 = inttoptr i64 %t7561 to ptr
  %t7563 = load i64, ptr %t7562
  %t7564 = inttoptr i64 %t7563 to ptr
  %t7565 = call fastcc i64%t7564(i64 %t7560, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7566 = or i64 %t7565, 8
  %t7567 = and i64 %t7566, 7
  %t7568 = icmp eq i64 %t7567, 0
  br i1 %t7568, label %fixfast1604, label %fixslow1605
fixfast1604:
  %t7569 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t7565, i64 8)
  %t7570 = extractvalue {i64, i1} %t7569, 0
  %t7571 = extractvalue {i64, i1} %t7569, 1
  br i1 %t7571, label %fixslow1605, label %fixmerge1606
fixslow1605:
  %t7572 = call i64 @rt_add(i64 %t7565, i64 8)
  br label %fixmerge1606
fixmerge1606:
  %t7573 = phi i64 [ %t7570, %fixfast1604 ], [ %t7572, %fixslow1605 ]
  %t7574 = load i64, ptr @"scheme.base:%ht-set-count!"
  call void @rt_check_callable(i64 %t7574)
  %t7575 = and i64 %t7574, -8
  %t7576 = inttoptr i64 %t7575 to ptr
  %t7577 = load i64, ptr %t7576
  %t7578 = inttoptr i64 %t7577 to ptr
  %t7579 = call fastcc i64%t7578(i64 %t7574, i64 2, i64 %a0, i64 %t7573, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7580 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t7580)
  %t7581 = and i64 %t7580, -8
  %t7582 = inttoptr i64 %t7581 to ptr
  %t7583 = load i64, ptr %t7582
  %t7584 = inttoptr i64 %t7583 to ptr
  %t7585 = call fastcc i64%t7584(i64 %t7580, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7586 = load i64, ptr @"scheme.base:%ht-load-factor"
  %t7587 = or i64 %t7586, %t7534
  %t7588 = and i64 %t7587, 7
  %t7589 = icmp eq i64 %t7588, 0
  br i1 %t7589, label %fixfast1607, label %fixslow1608
fixfast1607:
  %t7590 = ashr i64 %t7586, 3
  %t7591 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t7590, i64 %t7534)
  %t7592 = extractvalue {i64, i1} %t7591, 0
  %t7593 = extractvalue {i64, i1} %t7591, 1
  br i1 %t7593, label %fixslow1608, label %fixmerge1609
fixslow1608:
  %t7594 = call i64 @rt_mul(i64 %t7586, i64 %t7534)
  br label %fixmerge1609
fixmerge1609:
  %t7595 = phi i64 [ %t7592, %fixfast1607 ], [ %t7594, %fixslow1608 ]
  %t7596 = or i64 %t7595, %t7585
  %t7597 = and i64 %t7596, 7
  %t7598 = icmp eq i64 %t7597, 0
  br i1 %t7598, label %fixfast1610, label %fixslow1611
fixfast1610:
  %t7599 = icmp slt i64 %t7595, %t7585
  %t7600 = select i1 %t7599, i64 257, i64 1
  br label %fixmerge1612
fixslow1611:
  %t7601 = call i64 @rt_lt(i64 %t7595, i64 %t7585)
  br label %fixmerge1612
fixmerge1612:
  %t7602 = phi i64 [ %t7600, %fixfast1610 ], [ %t7601, %fixslow1611 ]
  %t7603 = icmp ne i64 %t7602, 1
  br i1 %t7603, label %then1613, label %else1614
then1613:
  %t7604 = load i64, ptr @"scheme.base:%ht-grow!"
  call void @rt_check_callable(i64 %t7604)
  %t7605 = and i64 %t7604, -8
  %t7606 = inttoptr i64 %t7605 to ptr
  %t7607 = load i64, ptr %t7606
  %t7608 = inttoptr i64 %t7607 to ptr
  %t7609 = musttail call fastcc i64 %t7608(i64 %t7604, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7609
else1614:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:hash-table-delete!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7614 = icmp eq i64 %argc, 2
  br i1 %t7614, label %argok1616, label %arityerr1615
arityerr1615:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1616:
  %t7615 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7615)
  %t7616 = and i64 %t7615, -8
  %t7617 = inttoptr i64 %t7616 to ptr
  %t7618 = load i64, ptr %t7617
  %t7619 = inttoptr i64 %t7618 to ptr
  %t7620 = call fastcc i64%t7619(i64 %t7615, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7621 = call i64 @rt_vector_length(i64 %t7620)
  %t7622 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t7622)
  %t7623 = and i64 %t7622, -8
  %t7624 = inttoptr i64 %t7623 to ptr
  %t7625 = load i64, ptr %t7624
  %t7626 = inttoptr i64 %t7625 to ptr
  %t7627 = call fastcc i64%t7626(i64 %t7622, i64 3, i64 %a0, i64 %a1, i64 %t7621, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7628 = call i64 @rt_vector_ref(i64 %t7620, i64 %t7627)
  %t7629 = load i64, ptr @"scheme.base:%ht-assoc"
  call void @rt_check_callable(i64 %t7629)
  %t7630 = and i64 %t7629, -8
  %t7631 = inttoptr i64 %t7630 to ptr
  %t7632 = load i64, ptr %t7631
  %t7633 = inttoptr i64 %t7632 to ptr
  %t7634 = call fastcc i64%t7633(i64 %t7629, i64 3, i64 %a0, i64 %a1, i64 %t7628, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7635 = icmp ne i64 %t7634, 1
  br i1 %t7635, label %then1617, label %else1618
then1617:
  %t7636 = load i64, ptr @"scheme.base:%ht-remove"
  call void @rt_check_callable(i64 %t7636)
  %t7637 = and i64 %t7636, -8
  %t7638 = inttoptr i64 %t7637 to ptr
  %t7639 = load i64, ptr %t7638
  %t7640 = inttoptr i64 %t7639 to ptr
  %t7641 = call fastcc i64%t7640(i64 %t7636, i64 3, i64 %a0, i64 %a1, i64 %t7628, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7642 = call i64 @rt_vector_set(i64 %t7620, i64 %t7627, i64 %t7641)
  %t7643 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t7643)
  %t7644 = and i64 %t7643, -8
  %t7645 = inttoptr i64 %t7644 to ptr
  %t7646 = load i64, ptr %t7645
  %t7647 = inttoptr i64 %t7646 to ptr
  %t7648 = call fastcc i64%t7647(i64 %t7643, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7649 = or i64 %t7648, 8
  %t7650 = and i64 %t7649, 7
  %t7651 = icmp eq i64 %t7650, 0
  br i1 %t7651, label %fixfast1619, label %fixslow1620
fixfast1619:
  %t7652 = call {i64, i1} @llvm.ssub.with.overflow.i64(i64 %t7648, i64 8)
  %t7653 = extractvalue {i64, i1} %t7652, 0
  %t7654 = extractvalue {i64, i1} %t7652, 1
  br i1 %t7654, label %fixslow1620, label %fixmerge1621
fixslow1620:
  %t7655 = call i64 @rt_sub(i64 %t7648, i64 8)
  br label %fixmerge1621
fixmerge1621:
  %t7656 = phi i64 [ %t7653, %fixfast1619 ], [ %t7655, %fixslow1620 ]
  %t7657 = load i64, ptr @"scheme.base:%ht-set-count!"
  call void @rt_check_callable(i64 %t7657)
  %t7658 = and i64 %t7657, -8
  %t7659 = inttoptr i64 %t7658 to ptr
  %t7660 = load i64, ptr %t7659
  %t7661 = inttoptr i64 %t7660 to ptr
  %t7662 = musttail call fastcc i64 %t7661(i64 %t7657, i64 2, i64 %a0, i64 %t7656, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7662
else1618:
  ret i64 1
}

define fastcc i64 @"scheme.base:code_1225"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7667 = icmp eq i64 %argc, 1
  br i1 %t7667, label %argok1623, label %arityerr1622
arityerr1622:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1623:
  %t7668 = call i64 @rt_null_p(i64 %a0)
  %t7669 = icmp ne i64 %t7668, 1
  br i1 %t7669, label %then1624, label %else1625
then1624:
  ret i64 1
else1625:
  %t7670 = call i64 @rt_car(i64 %a0)
  %t7671 = and i64 %self, -8
  %t7672 = inttoptr i64 %t7671 to ptr
  %t7673 = getelementptr i64, ptr %t7672, i64 1
  %t7674 = load i64, ptr %t7673
  %t7675 = call i64 @rt_car(i64 %t7670)
  %t7676 = and i64 %self, -8
  %t7677 = inttoptr i64 %t7676 to ptr
  %t7678 = getelementptr i64, ptr %t7677, i64 2
  %t7679 = load i64, ptr %t7678
  %t7680 = load i64, ptr @"scheme.base:%ht-index"
  call void @rt_check_callable(i64 %t7680)
  %t7681 = and i64 %t7680, -8
  %t7682 = inttoptr i64 %t7681 to ptr
  %t7683 = load i64, ptr %t7682
  %t7684 = inttoptr i64 %t7683 to ptr
  %t7685 = call fastcc i64%t7684(i64 %t7680, i64 3, i64 %t7674, i64 %t7675, i64 %t7679, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7686 = and i64 %self, -8
  %t7687 = inttoptr i64 %t7686 to ptr
  %t7688 = getelementptr i64, ptr %t7687, i64 3
  %t7689 = load i64, ptr %t7688
  %t7690 = and i64 %self, -8
  %t7691 = inttoptr i64 %t7690 to ptr
  %t7692 = getelementptr i64, ptr %t7691, i64 3
  %t7693 = load i64, ptr %t7692
  %t7694 = call i64 @rt_vector_ref(i64 %t7693, i64 %t7685)
  %t7695 = call i64 @rt_cons(i64 %t7670, i64 %t7694)
  %t7696 = call i64 @rt_vector_set(i64 %t7689, i64 %t7685, i64 %t7695)
  %t7697 = call i64 @rt_cdr(i64 %a0)
  %t7698 = musttail call fastcc i64 @"scheme.base:code_1225"(i64 %self, i64 1, i64 %t7697, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7698
}

define fastcc i64 @"scheme.base:code_1223"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7699 = icmp eq i64 %argc, 1
  br i1 %t7699, label %argok1627, label %arityerr1626
arityerr1626:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1627:
  %t7700 = and i64 %self, -8
  %t7701 = inttoptr i64 %t7700 to ptr
  %t7702 = getelementptr i64, ptr %t7701, i64 1
  %t7703 = load i64, ptr %t7702
  %t7704 = call i64 @rt_vector_length(i64 %t7703)
  %t7705 = or i64 %a0, %t7704
  %t7706 = and i64 %t7705, 7
  %t7707 = icmp eq i64 %t7706, 0
  br i1 %t7707, label %fixfast1628, label %fixslow1629
fixfast1628:
  %t7708 = icmp slt i64 %a0, %t7704
  %t7709 = select i1 %t7708, i64 257, i64 1
  br label %fixmerge1630
fixslow1629:
  %t7710 = call i64 @rt_lt(i64 %a0, i64 %t7704)
  br label %fixmerge1630
fixmerge1630:
  %t7711 = phi i64 [ %t7709, %fixfast1628 ], [ %t7710, %fixslow1629 ]
  %t7712 = icmp ne i64 %t7711, 1
  br i1 %t7712, label %then1631, label %else1632
then1631:
  %t7713 = call ptr @rt_alloc_words(i64 5)
  %t7714 = ptrtoint ptr %t7713 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1225" to i64), ptr %t7713
  %t7715 = or i64 %t7714, 4
  %t7716 = and i64 %self, -8
  %t7717 = inttoptr i64 %t7716 to ptr
  %t7718 = getelementptr i64, ptr %t7717, i64 2
  %t7719 = load i64, ptr %t7718
  %t7720 = getelementptr i64, ptr %t7713, i64 1
  store i64 %t7719, ptr %t7720
  %t7721 = and i64 %self, -8
  %t7722 = inttoptr i64 %t7721 to ptr
  %t7723 = getelementptr i64, ptr %t7722, i64 3
  %t7724 = load i64, ptr %t7723
  %t7725 = getelementptr i64, ptr %t7713, i64 2
  store i64 %t7724, ptr %t7725
  %t7726 = and i64 %self, -8
  %t7727 = inttoptr i64 %t7726 to ptr
  %t7728 = getelementptr i64, ptr %t7727, i64 4
  %t7729 = load i64, ptr %t7728
  %t7730 = getelementptr i64, ptr %t7713, i64 3
  store i64 %t7729, ptr %t7730
  %t7731 = getelementptr i64, ptr %t7713, i64 4
  store i64 %t7715, ptr %t7731
  %t7732 = and i64 %self, -8
  %t7733 = inttoptr i64 %t7732 to ptr
  %t7734 = getelementptr i64, ptr %t7733, i64 1
  %t7735 = load i64, ptr %t7734
  %t7736 = call i64 @rt_vector_ref(i64 %t7735, i64 %a0)
  %t7737 = call fastcc i64 @"scheme.base:code_1225"(i64 %t7715, i64 1, i64 %t7736, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7738 = or i64 %a0, 8
  %t7739 = and i64 %t7738, 7
  %t7740 = icmp eq i64 %t7739, 0
  br i1 %t7740, label %fixfast1633, label %fixslow1634
fixfast1633:
  %t7741 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t7742 = extractvalue {i64, i1} %t7741, 0
  %t7743 = extractvalue {i64, i1} %t7741, 1
  br i1 %t7743, label %fixslow1634, label %fixmerge1635
fixslow1634:
  %t7744 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1635
fixmerge1635:
  %t7745 = phi i64 [ %t7742, %fixfast1633 ], [ %t7744, %fixslow1634 ]
  %t7746 = musttail call fastcc i64 @"scheme.base:code_1223"(i64 %self, i64 1, i64 %t7745, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7746
else1632:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%ht-grow!"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7747 = icmp eq i64 %argc, 1
  br i1 %t7747, label %argok1637, label %arityerr1636
arityerr1636:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1637:
  %t7748 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7748)
  %t7749 = and i64 %t7748, -8
  %t7750 = inttoptr i64 %t7749 to ptr
  %t7751 = load i64, ptr %t7750
  %t7752 = inttoptr i64 %t7751 to ptr
  %t7753 = call fastcc i64%t7752(i64 %t7748, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7754 = call i64 @rt_vector_length(i64 %t7753)
  %t7755 = or i64 16, %t7754
  %t7756 = and i64 %t7755, 7
  %t7757 = icmp eq i64 %t7756, 0
  br i1 %t7757, label %fixfast1638, label %fixslow1639
fixfast1638:
  %t7758 = ashr i64 16, 3
  %t7759 = call {i64, i1} @llvm.smul.with.overflow.i64(i64 %t7758, i64 %t7754)
  %t7760 = extractvalue {i64, i1} %t7759, 0
  %t7761 = extractvalue {i64, i1} %t7759, 1
  br i1 %t7761, label %fixslow1639, label %fixmerge1640
fixslow1639:
  %t7762 = call i64 @rt_mul(i64 16, i64 %t7754)
  br label %fixmerge1640
fixmerge1640:
  %t7763 = phi i64 [ %t7760, %fixfast1638 ], [ %t7762, %fixslow1639 ]
  %t7764 = call i64 @rt_make_vector(i64 %t7763, i64 2)
  %t7765 = call ptr @rt_alloc_words(i64 6)
  %t7766 = ptrtoint ptr %t7765 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1223" to i64), ptr %t7765
  %t7767 = or i64 %t7766, 4
  %t7768 = getelementptr i64, ptr %t7765, i64 1
  store i64 %t7753, ptr %t7768
  %t7769 = getelementptr i64, ptr %t7765, i64 2
  store i64 %a0, ptr %t7769
  %t7770 = getelementptr i64, ptr %t7765, i64 3
  store i64 %t7763, ptr %t7770
  %t7771 = getelementptr i64, ptr %t7765, i64 4
  store i64 %t7764, ptr %t7771
  %t7772 = getelementptr i64, ptr %t7765, i64 5
  store i64 %t7767, ptr %t7772
  %t7773 = call fastcc i64 @"scheme.base:code_1223"(i64 %t7767, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7774 = load i64, ptr @"scheme.base:%ht-set-buckets!"
  call void @rt_check_callable(i64 %t7774)
  %t7775 = and i64 %t7774, -8
  %t7776 = inttoptr i64 %t7775 to ptr
  %t7777 = load i64, ptr %t7776
  %t7778 = inttoptr i64 %t7777 to ptr
  %t7779 = musttail call fastcc i64 %t7778(i64 %t7774, i64 2, i64 %a0, i64 %t7764, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7779
}

define fastcc i64 @"scheme.base:code:hash-table-size"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7784 = icmp eq i64 %argc, 1
  br i1 %t7784, label %argok1642, label %arityerr1641
arityerr1641:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1642:
  %t7785 = load i64, ptr @"scheme.base:%ht-count"
  call void @rt_check_callable(i64 %t7785)
  %t7786 = and i64 %t7785, -8
  %t7787 = inttoptr i64 %t7786 to ptr
  %t7788 = load i64, ptr %t7787
  %t7789 = inttoptr i64 %t7788 to ptr
  %t7790 = musttail call fastcc i64 %t7789(i64 %t7785, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7790
}

define fastcc i64 @"scheme.base:code:%ht-fold-buckets"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7795 = icmp eq i64 %argc, 2
  br i1 %t7795, label %argok1644, label %arityerr1643
arityerr1643:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1644:
  %t7796 = call i64 @rt_null_p(i64 %a0)
  %t7797 = icmp ne i64 %t7796, 1
  br i1 %t7797, label %then1645, label %else1646
then1645:
  ret i64 %a1
else1646:
  %t7798 = call i64 @rt_car(i64 %a0)
  %t7799 = call i64 @rt_car(i64 %t7798)
  %t7800 = call i64 @rt_car(i64 %a0)
  %t7801 = call i64 @rt_cdr(i64 %t7800)
  %t7802 = call i64 @rt_cons(i64 %t7799, i64 %t7801)
  %t7803 = call i64 @rt_cdr(i64 %a0)
  %t7804 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  call void @rt_check_callable(i64 %t7804)
  %t7805 = and i64 %t7804, -8
  %t7806 = inttoptr i64 %t7805 to ptr
  %t7807 = load i64, ptr %t7806
  %t7808 = inttoptr i64 %t7807 to ptr
  %t7809 = call fastcc i64%t7808(i64 %t7804, i64 2, i64 %t7803, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7810 = call i64 @rt_cons(i64 %t7802, i64 %t7809)
  ret i64 %t7810
}

define fastcc i64 @"scheme.base:code_1242"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7815 = icmp eq i64 %argc, 2
  br i1 %t7815, label %argok1648, label %arityerr1647
arityerr1647:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1648:
  %t7816 = and i64 %self, -8
  %t7817 = inttoptr i64 %t7816 to ptr
  %t7818 = getelementptr i64, ptr %t7817, i64 1
  %t7819 = load i64, ptr %t7818
  %t7820 = call i64 @rt_vector_length(i64 %t7819)
  %t7821 = or i64 %a0, %t7820
  %t7822 = and i64 %t7821, 7
  %t7823 = icmp eq i64 %t7822, 0
  br i1 %t7823, label %fixfast1649, label %fixslow1650
fixfast1649:
  %t7824 = icmp slt i64 %a0, %t7820
  %t7825 = select i1 %t7824, i64 257, i64 1
  br label %fixmerge1651
fixslow1650:
  %t7826 = call i64 @rt_lt(i64 %a0, i64 %t7820)
  br label %fixmerge1651
fixmerge1651:
  %t7827 = phi i64 [ %t7825, %fixfast1649 ], [ %t7826, %fixslow1650 ]
  %t7828 = icmp ne i64 %t7827, 1
  br i1 %t7828, label %then1652, label %else1653
then1652:
  %t7829 = or i64 %a0, 8
  %t7830 = and i64 %t7829, 7
  %t7831 = icmp eq i64 %t7830, 0
  br i1 %t7831, label %fixfast1654, label %fixslow1655
fixfast1654:
  %t7832 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t7833 = extractvalue {i64, i1} %t7832, 0
  %t7834 = extractvalue {i64, i1} %t7832, 1
  br i1 %t7834, label %fixslow1655, label %fixmerge1656
fixslow1655:
  %t7835 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1656
fixmerge1656:
  %t7836 = phi i64 [ %t7833, %fixfast1654 ], [ %t7835, %fixslow1655 ]
  %t7837 = and i64 %self, -8
  %t7838 = inttoptr i64 %t7837 to ptr
  %t7839 = getelementptr i64, ptr %t7838, i64 1
  %t7840 = load i64, ptr %t7839
  %t7841 = call i64 @rt_vector_ref(i64 %t7840, i64 %a0)
  %t7842 = load i64, ptr @"scheme.base:%ht-fold-buckets"
  call void @rt_check_callable(i64 %t7842)
  %t7843 = and i64 %t7842, -8
  %t7844 = inttoptr i64 %t7843 to ptr
  %t7845 = load i64, ptr %t7844
  %t7846 = inttoptr i64 %t7845 to ptr
  %t7847 = call fastcc i64%t7846(i64 %t7842, i64 2, i64 %t7841, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7848 = musttail call fastcc i64 @"scheme.base:code_1242"(i64 %self, i64 2, i64 %t7836, i64 %t7847, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7848
else1653:
  ret i64 %a1
}

define fastcc i64 @"scheme.base:code:hash-table->alist"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7849 = icmp eq i64 %argc, 1
  br i1 %t7849, label %argok1658, label %arityerr1657
arityerr1657:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1658:
  %t7850 = load i64, ptr @"scheme.base:%ht-buckets"
  call void @rt_check_callable(i64 %t7850)
  %t7851 = and i64 %t7850, -8
  %t7852 = inttoptr i64 %t7851 to ptr
  %t7853 = load i64, ptr %t7852
  %t7854 = inttoptr i64 %t7853 to ptr
  %t7855 = call fastcc i64%t7854(i64 %t7850, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7856 = call ptr @rt_alloc_words(i64 3)
  %t7857 = ptrtoint ptr %t7856 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1242" to i64), ptr %t7856
  %t7858 = or i64 %t7857, 4
  %t7859 = getelementptr i64, ptr %t7856, i64 1
  store i64 %t7855, ptr %t7859
  %t7860 = getelementptr i64, ptr %t7856, i64 2
  store i64 %t7858, ptr %t7860
  %t7861 = musttail call fastcc i64 @"scheme.base:code_1242"(i64 %t7858, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7861
}

define fastcc i64 @"scheme.base:code_1247"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7866 = icmp eq i64 %argc, 1
  br i1 %t7866, label %argok1660, label %arityerr1659
arityerr1659:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1660:
  %t7867 = call i64 @rt_car(i64 %a0)
  ret i64 %t7867
}

define fastcc i64 @"scheme.base:code:hash-table-keys"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7868 = icmp eq i64 %argc, 1
  br i1 %t7868, label %argok1662, label %arityerr1661
arityerr1661:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1662:
  %t7869 = call ptr @rt_alloc_words(i64 1)
  %t7870 = ptrtoint ptr %t7869 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1247" to i64), ptr %t7869
  %t7871 = or i64 %t7870, 4
  %t7872 = load i64, ptr @"scheme.base:hash-table->alist"
  call void @rt_check_callable(i64 %t7872)
  %t7873 = and i64 %t7872, -8
  %t7874 = inttoptr i64 %t7873 to ptr
  %t7875 = load i64, ptr %t7874
  %t7876 = inttoptr i64 %t7875 to ptr
  %t7877 = call fastcc i64%t7876(i64 %t7872, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7878 = load i64, ptr @"scheme.base:map"
  call void @rt_check_callable(i64 %t7878)
  %t7879 = and i64 %t7878, -8
  %t7880 = inttoptr i64 %t7879 to ptr
  %t7881 = load i64, ptr %t7880
  %t7882 = inttoptr i64 %t7881 to ptr
  %t7883 = musttail call fastcc i64 %t7882(i64 %t7878, i64 2, i64 %t7871, i64 %t7877, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7883
}

define fastcc i64 @"scheme.base:code_1252"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7888 = icmp eq i64 %argc, 1
  br i1 %t7888, label %argok1664, label %arityerr1663
arityerr1663:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1664:
  %t7889 = call i64 @rt_cdr(i64 %a0)
  ret i64 %t7889
}

define fastcc i64 @"scheme.base:code:hash-table-values"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7890 = icmp eq i64 %argc, 1
  br i1 %t7890, label %argok1666, label %arityerr1665
arityerr1665:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1666:
  %t7891 = call ptr @rt_alloc_words(i64 1)
  %t7892 = ptrtoint ptr %t7891 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1252" to i64), ptr %t7891
  %t7893 = or i64 %t7892, 4
  %t7894 = load i64, ptr @"scheme.base:hash-table->alist"
  call void @rt_check_callable(i64 %t7894)
  %t7895 = and i64 %t7894, -8
  %t7896 = inttoptr i64 %t7895 to ptr
  %t7897 = load i64, ptr %t7896
  %t7898 = inttoptr i64 %t7897 to ptr
  %t7899 = call fastcc i64%t7898(i64 %t7894, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7900 = load i64, ptr @"scheme.base:map"
  call void @rt_check_callable(i64 %t7900)
  %t7901 = and i64 %t7900, -8
  %t7902 = inttoptr i64 %t7901 to ptr
  %t7903 = load i64, ptr %t7902
  %t7904 = inttoptr i64 %t7903 to ptr
  %t7905 = musttail call fastcc i64 %t7904(i64 %t7900, i64 2, i64 %t7893, i64 %t7899, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7905
}

define fastcc i64 @"scheme.base:code:rd-report"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t7910 = icmp eq i64 %argc, 3
  br i1 %t7910, label %argok1668, label %arityerr1667
arityerr1667:
  call void @rt_arity_error(i64 3, i64 %argc)
  unreachable
argok1668:
  %t7911 = call i64 @rt_car(i64 %a2)
  %t7912 = call i64 @rt_cdr(i64 %a2)
  %t7913 = load i64, ptr @"emit.internal:rd-fail-pos"
  %t7914 = call fastcc i64 @"emit.internal:code:rd-fail-pos"(i64 %t7913, i64 1, i64 %t7912, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t7915 = call i64 @rt_intern(ptr @.str.sym.51)
  %t7916 = call i64 @rt_eq_p(i64 %t7911, i64 %t7915)
  %t7917 = icmp ne i64 %t7916, 1
  br i1 %t7917, label %then1669, label %else1670
then1669:
  %t7918 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7919 = call i64 @rt_make_string(ptr @.str.lit.52, i64 45)
  %t7920 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7920)
  %t7921 = and i64 %t7920, -8
  %t7922 = inttoptr i64 %t7921 to ptr
  %t7923 = load i64, ptr %t7922
  %t7924 = inttoptr i64 %t7923 to ptr
  %t7925 = musttail call fastcc i64 %t7924(i64 %t7920, i64 3, i64 %t7918, i64 %t7919, i64 %t7914, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7925
else1670:
  %t7926 = call i64 @rt_intern(ptr @.str.sym.53)
  %t7927 = call i64 @rt_eq_p(i64 %t7911, i64 %t7926)
  %t7928 = icmp ne i64 %t7927, 1
  br i1 %t7928, label %then1671, label %else1672
then1671:
  %t7929 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7930 = call i64 @rt_make_string(ptr @.str.lit.54, i64 41)
  %t7931 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t7931)
  %t7932 = and i64 %t7931, -8
  %t7933 = inttoptr i64 %t7932 to ptr
  %t7934 = load i64, ptr %t7933
  %t7935 = inttoptr i64 %t7934 to ptr
  %t7936 = musttail call fastcc i64 %t7935(i64 %t7931, i64 3, i64 %t7929, i64 %t7930, i64 %t7914, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t7936
else1672:
  %t7937 = call i64 @rt_intern(ptr @.str.sym.55)
  %t7938 = call i64 @rt_eq_p(i64 %t7911, i64 %t7937)
  %t7939 = icmp ne i64 %t7938, 1
  br i1 %t7939, label %then1673, label %else1674
then1673:
  %t7940 = call i64 @rt_intern(ptr @.str.sym.16)
  %t7941 = call i64 @rt_make_string(ptr @.str.lit.56, i64 13)
  %t7942 = call i64 @rt_string_ref(i64 %a0, i64 %t7914)
  %t7943 = call i64 @rt_char_to_integer(i64 %t7942)
  %t7944 = or i64 %t7943, 728
  %t7945 = and i64 %t7944, 7
  %t7946 = icmp eq i64 %t7945, 0
  br i1 %t7946, label %fixfast1675, label %fixslow1676
fixfast1675:
  %t7947 = icmp eq i64 %t7943, 728
  %t7948 = select i1 %t7947, i64 257, i64 1
  br label %fixmerge1677
fixslow1676:
  %t7949 = call i64 @rt_num_eq(i64 %t7943, i64 728)
  br label %fixmerge1677
fixmerge1677:
  %t7950 = phi i64 [ %t7948, %fixfast1675 ], [ %t7949, %fixslow1676 ]
  %t7951 = icmp ne i64 %t7950, 1
  br i1 %t7951, label %then1678, label %else1679
then1678:
  %t7952 = call i64 @rt_make_string(ptr @.str.lit.57, i64 6)
  br label %merge1680
else1679:
  %t7953 = or i64 %t7943, 280
  %t7954 = and i64 %t7953, 7
  %t7955 = icmp eq i64 %t7954, 0
  br i1 %t7955, label %fixfast1681, label %fixslow1682
fixfast1681:
  %t7956 = icmp eq i64 %t7943, 280
  %t7957 = select i1 %t7956, i64 257, i64 1
  br label %fixmerge1683
fixslow1682:
  %t7958 = call i64 @rt_num_eq(i64 %t7943, i64 280)
  br label %fixmerge1683
fixmerge1683:
  %t7959 = phi i64 [ %t7957, %fixfast1681 ], [ %t7958, %fixslow1682 ]
  %t7960 = icmp ne i64 %t7959, 1
  br i1 %t7960, label %then1684, label %else1685
then1684:
  %t7961 = or i64 %t7914, 8
  %t7962 = and i64 %t7961, 7
  %t7963 = icmp eq i64 %t7962, 0
  br i1 %t7963, label %fixfast1687, label %fixslow1688
fixfast1687:
  %t7964 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t7914, i64 8)
  %t7965 = extractvalue {i64, i1} %t7964, 0
  %t7966 = extractvalue {i64, i1} %t7964, 1
  br i1 %t7966, label %fixslow1688, label %fixmerge1689
fixslow1688:
  %t7967 = call i64 @rt_add(i64 %t7914, i64 8)
  br label %fixmerge1689
fixmerge1689:
  %t7968 = phi i64 [ %t7965, %fixfast1687 ], [ %t7967, %fixslow1688 ]
  %t7969 = or i64 %t7968, %a1
  %t7970 = and i64 %t7969, 7
  %t7971 = icmp eq i64 %t7970, 0
  br i1 %t7971, label %fixfast1690, label %fixslow1691
fixfast1690:
  %t7972 = icmp slt i64 %t7968, %a1
  %t7973 = select i1 %t7972, i64 257, i64 1
  br label %fixmerge1692
fixslow1691:
  %t7974 = call i64 @rt_lt(i64 %t7968, i64 %a1)
  br label %fixmerge1692
fixmerge1692:
  %t7975 = phi i64 [ %t7973, %fixfast1690 ], [ %t7974, %fixslow1691 ]
  %t7976 = icmp ne i64 %t7975, 1
  br i1 %t7976, label %then1693, label %else1694
then1693:
  %t7977 = or i64 %t7914, 8
  %t7978 = and i64 %t7977, 7
  %t7979 = icmp eq i64 %t7978, 0
  br i1 %t7979, label %fixfast1696, label %fixslow1697
fixfast1696:
  %t7980 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t7914, i64 8)
  %t7981 = extractvalue {i64, i1} %t7980, 0
  %t7982 = extractvalue {i64, i1} %t7980, 1
  br i1 %t7982, label %fixslow1697, label %fixmerge1698
fixslow1697:
  %t7983 = call i64 @rt_add(i64 %t7914, i64 8)
  br label %fixmerge1698
fixmerge1698:
  %t7984 = phi i64 [ %t7981, %fixfast1696 ], [ %t7983, %fixslow1697 ]
  %t7985 = call i64 @rt_string_ref(i64 %a0, i64 %t7984)
  %t7986 = call i64 @rt_char_to_integer(i64 %t7985)
  %t7987 = or i64 %t7986, 936
  %t7988 = and i64 %t7987, 7
  %t7989 = icmp eq i64 %t7988, 0
  br i1 %t7989, label %fixfast1699, label %fixslow1700
fixfast1699:
  %t7990 = icmp eq i64 %t7986, 936
  %t7991 = select i1 %t7990, i64 257, i64 1
  br label %fixmerge1701
fixslow1700:
  %t7992 = call i64 @rt_num_eq(i64 %t7986, i64 936)
  br label %fixmerge1701
fixmerge1701:
  %t7993 = phi i64 [ %t7991, %fixfast1699 ], [ %t7992, %fixslow1700 ]
  br label %merge1695
else1694:
  br label %merge1695
merge1695:
  %t7994 = phi i64 [ %t7993, %fixmerge1701 ], [ 1, %else1694 ]
  br label %merge1686
else1685:
  br label %merge1686
merge1686:
  %t7995 = phi i64 [ %t7994, %merge1695 ], [ 1, %else1685 ]
  %t7996 = icmp ne i64 %t7995, 1
  br i1 %t7996, label %then1702, label %else1703
then1702:
  %t7997 = call i64 @rt_make_string(ptr @.str.lit.58, i64 15)
  br label %merge1704
else1703:
  %t7998 = or i64 %t7943, 280
  %t7999 = and i64 %t7998, 7
  %t8000 = icmp eq i64 %t7999, 0
  br i1 %t8000, label %fixfast1705, label %fixslow1706
fixfast1705:
  %t8001 = icmp eq i64 %t7943, 280
  %t8002 = select i1 %t8001, i64 257, i64 1
  br label %fixmerge1707
fixslow1706:
  %t8003 = call i64 @rt_num_eq(i64 %t7943, i64 280)
  br label %fixmerge1707
fixmerge1707:
  %t8004 = phi i64 [ %t8002, %fixfast1705 ], [ %t8003, %fixslow1706 ]
  %t8005 = icmp ne i64 %t8004, 1
  br i1 %t8005, label %then1708, label %else1709
then1708:
  %t8006 = call i64 @rt_make_string(ptr @.str.lit.59, i64 9)
  br label %merge1710
else1709:
  %t8007 = call i64 @rt_make_string(ptr @.str.lit.60, i64 6)
  br label %merge1710
merge1710:
  %t8008 = phi i64 [ %t8006, %then1708 ], [ %t8007, %else1709 ]
  br label %merge1704
merge1704:
  %t8009 = phi i64 [ %t7997, %then1702 ], [ %t8008, %merge1710 ]
  br label %merge1680
merge1680:
  %t8010 = phi i64 [ %t7952, %then1678 ], [ %t8009, %merge1704 ]
  %t8011 = call i64 @rt_string_append(i64 %t7941, i64 %t8010)
  %t8012 = call i64 @rt_make_string(ptr @.str.lit.61, i64 16)
  %t8013 = call i64 @rt_string_append(i64 %t8011, i64 %t8012)
  %t8014 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t8014)
  %t8015 = and i64 %t8014, -8
  %t8016 = inttoptr i64 %t8015 to ptr
  %t8017 = load i64, ptr %t8016
  %t8018 = inttoptr i64 %t8017 to ptr
  %t8019 = musttail call fastcc i64 %t8018(i64 %t8014, i64 3, i64 %t7940, i64 %t8013, i64 %t7914, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8019
else1674:
  %t8020 = call i64 @rt_intern(ptr @.str.sym.62)
  %t8021 = call i64 @rt_eq_p(i64 %t7911, i64 %t8020)
  %t8022 = icmp ne i64 %t8021, 1
  br i1 %t8022, label %then1711, label %else1712
then1711:
  %t8023 = call i64 @rt_intern(ptr @.str.sym.16)
  %t8024 = call i64 @rt_make_string(ptr @.str.lit.63, i64 37)
  %t8025 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t8025)
  %t8026 = and i64 %t8025, -8
  %t8027 = inttoptr i64 %t8026 to ptr
  %t8028 = load i64, ptr %t8027
  %t8029 = inttoptr i64 %t8028 to ptr
  %t8030 = musttail call fastcc i64 %t8029(i64 %t8025, i64 3, i64 %t8023, i64 %t8024, i64 %t7914, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8030
else1712:
  %t8031 = call i64 @rt_intern(ptr @.str.sym.64)
  %t8032 = call i64 @rt_eq_p(i64 %t7911, i64 %t8031)
  %t8033 = icmp ne i64 %t8032, 1
  br i1 %t8033, label %then1713, label %else1714
then1713:
  %t8034 = call i64 @rt_intern(ptr @.str.sym.16)
  %t8035 = call i64 @rt_make_string(ptr @.str.lit.65, i64 22)
  %t8036 = load i64, ptr @"emit.internal:rd-token-at"
  %t8037 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t8036, i64 3, i64 %a0, i64 %a1, i64 %t7914, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8038 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t8038)
  %t8039 = and i64 %t8038, -8
  %t8040 = inttoptr i64 %t8039 to ptr
  %t8041 = load i64, ptr %t8040
  %t8042 = inttoptr i64 %t8041 to ptr
  %t8043 = musttail call fastcc i64 %t8042(i64 %t8038, i64 3, i64 %t8034, i64 %t8035, i64 %t8037, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8043
else1714:
  %t8044 = call i64 @rt_intern(ptr @.str.sym.66)
  %t8045 = call i64 @rt_eq_p(i64 %t7911, i64 %t8044)
  %t8046 = icmp ne i64 %t8045, 1
  br i1 %t8046, label %then1715, label %else1716
then1715:
  %t8047 = call i64 @rt_intern(ptr @.str.sym.16)
  %t8048 = call i64 @rt_make_string(ptr @.str.lit.67, i64 44)
  %t8049 = load i64, ptr @"emit.internal:rd-token-at"
  %t8050 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t8049, i64 3, i64 %a0, i64 %a1, i64 %t7914, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8051 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t8051)
  %t8052 = and i64 %t8051, -8
  %t8053 = inttoptr i64 %t8052 to ptr
  %t8054 = load i64, ptr %t8053
  %t8055 = inttoptr i64 %t8054 to ptr
  %t8056 = musttail call fastcc i64 %t8055(i64 %t8051, i64 3, i64 %t8047, i64 %t8048, i64 %t8050, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8056
else1716:
  %t8057 = call i64 @rt_intern(ptr @.str.sym.68)
  %t8058 = call i64 @rt_eq_p(i64 %t7911, i64 %t8057)
  %t8059 = icmp ne i64 %t8058, 1
  br i1 %t8059, label %then1717, label %else1718
then1717:
  %t8060 = call i64 @rt_intern(ptr @.str.sym.16)
  %t8061 = call i64 @rt_make_string(ptr @.str.lit.69, i64 21)
  %t8062 = load i64, ptr @"emit.internal:rd-token-at"
  %t8063 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t8062, i64 3, i64 %a0, i64 %a1, i64 %t7914, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8064 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t8064)
  %t8065 = and i64 %t8064, -8
  %t8066 = inttoptr i64 %t8065 to ptr
  %t8067 = load i64, ptr %t8066
  %t8068 = inttoptr i64 %t8067 to ptr
  %t8069 = musttail call fastcc i64 %t8068(i64 %t8064, i64 3, i64 %t8060, i64 %t8061, i64 %t8063, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8069
else1718:
  %t8070 = call i64 @rt_intern(ptr @.str.sym.70)
  %t8071 = call i64 @rt_eq_p(i64 %t7911, i64 %t8070)
  %t8072 = icmp ne i64 %t8071, 1
  br i1 %t8072, label %then1719, label %else1720
then1719:
  %t8073 = call i64 @rt_intern(ptr @.str.sym.16)
  %t8074 = call i64 @rt_make_string(ptr @.str.lit.71, i64 47)
  %t8075 = load i64, ptr @"emit.internal:rd-token-at"
  %t8076 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t8075, i64 3, i64 %a0, i64 %a1, i64 %t7914, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8077 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t8077)
  %t8078 = and i64 %t8077, -8
  %t8079 = inttoptr i64 %t8078 to ptr
  %t8080 = load i64, ptr %t8079
  %t8081 = inttoptr i64 %t8080 to ptr
  %t8082 = musttail call fastcc i64 %t8081(i64 %t8077, i64 3, i64 %t8073, i64 %t8074, i64 %t8076, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8082
else1720:
  %t8083 = call i64 @rt_intern(ptr @.str.sym.72)
  %t8084 = call i64 @rt_eq_p(i64 %t7911, i64 %t8083)
  %t8085 = icmp ne i64 %t8084, 1
  br i1 %t8085, label %then1721, label %else1722
then1721:
  %t8086 = call i64 @rt_intern(ptr @.str.sym.16)
  %t8087 = call i64 @rt_make_string(ptr @.str.lit.73, i64 55)
  %t8088 = load i64, ptr @"emit.internal:rd-token-at"
  %t8089 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t8088, i64 3, i64 %a0, i64 %a1, i64 %t7914, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8090 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t8090)
  %t8091 = and i64 %t8090, -8
  %t8092 = inttoptr i64 %t8091 to ptr
  %t8093 = load i64, ptr %t8092
  %t8094 = inttoptr i64 %t8093 to ptr
  %t8095 = musttail call fastcc i64 %t8094(i64 %t8090, i64 3, i64 %t8086, i64 %t8087, i64 %t8089, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8095
else1722:
  %t8096 = call i64 @rt_intern(ptr @.str.sym.74)
  %t8097 = call i64 @rt_eq_p(i64 %t7911, i64 %t8096)
  %t8098 = icmp ne i64 %t8097, 1
  br i1 %t8098, label %then1723, label %else1724
then1723:
  %t8099 = call i64 @rt_intern(ptr @.str.sym.16)
  %t8100 = call i64 @rt_make_string(ptr @.str.lit.75, i64 21)
  %t8101 = load i64, ptr @"emit.internal:rd-token-at"
  %t8102 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t8101, i64 3, i64 %a0, i64 %a1, i64 %t7914, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8103 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t8103)
  %t8104 = and i64 %t8103, -8
  %t8105 = inttoptr i64 %t8104 to ptr
  %t8106 = load i64, ptr %t8105
  %t8107 = inttoptr i64 %t8106 to ptr
  %t8108 = musttail call fastcc i64 %t8107(i64 %t8103, i64 3, i64 %t8099, i64 %t8100, i64 %t8102, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8108
else1724:
  %t8109 = call i64 @rt_intern(ptr @.str.sym.76)
  %t8110 = call i64 @rt_eq_p(i64 %t7911, i64 %t8109)
  %t8111 = icmp ne i64 %t8110, 1
  br i1 %t8111, label %then1725, label %else1726
then1725:
  %t8112 = call i64 @rt_intern(ptr @.str.sym.16)
  %t8113 = call i64 @rt_make_string(ptr @.str.lit.77, i64 49)
  %t8114 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t8114)
  %t8115 = and i64 %t8114, -8
  %t8116 = inttoptr i64 %t8115 to ptr
  %t8117 = load i64, ptr %t8116
  %t8118 = inttoptr i64 %t8117 to ptr
  %t8119 = musttail call fastcc i64 %t8118(i64 %t8114, i64 3, i64 %t8112, i64 %t8113, i64 %t7914, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8119
else1726:
  %t8120 = call i64 @rt_intern(ptr @.str.sym.78)
  %t8121 = call i64 @rt_eq_p(i64 %t7911, i64 %t8120)
  %t8122 = icmp ne i64 %t8121, 1
  br i1 %t8122, label %then1727, label %else1728
then1727:
  %t8123 = call i64 @rt_intern(ptr @.str.sym.16)
  %t8124 = call i64 @rt_make_string(ptr @.str.lit.79, i64 23)
  %t8125 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t8125)
  %t8126 = and i64 %t8125, -8
  %t8127 = inttoptr i64 %t8126 to ptr
  %t8128 = load i64, ptr %t8127
  %t8129 = inttoptr i64 %t8128 to ptr
  %t8130 = musttail call fastcc i64 %t8129(i64 %t8125, i64 3, i64 %t8123, i64 %t8124, i64 %t7914, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8130
else1728:
  %t8131 = call i64 @rt_intern(ptr @.str.sym.80)
  %t8132 = call i64 @rt_eq_p(i64 %t7911, i64 %t8131)
  %t8133 = icmp ne i64 %t8132, 1
  br i1 %t8133, label %then1729, label %else1730
then1729:
  %t8134 = call i64 @rt_intern(ptr @.str.sym.16)
  %t8135 = call i64 @rt_make_string(ptr @.str.lit.81, i64 56)
  %t8136 = call i64 @rt_make_string(ptr @.str.lit.82, i64 38)
  %t8137 = call i64 @rt_string_append(i64 %t8135, i64 %t8136)
  %t8138 = load i64, ptr @"emit.internal:rd-token-at"
  %t8139 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t8138, i64 3, i64 %a0, i64 %a1, i64 %t7914, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8140 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t8140)
  %t8141 = and i64 %t8140, -8
  %t8142 = inttoptr i64 %t8141 to ptr
  %t8143 = load i64, ptr %t8142
  %t8144 = inttoptr i64 %t8143 to ptr
  %t8145 = musttail call fastcc i64 %t8144(i64 %t8140, i64 3, i64 %t8134, i64 %t8137, i64 %t8139, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8145
else1730:
  %t8146 = call i64 @rt_intern(ptr @.str.sym.16)
  %t8147 = call i64 @rt_make_string(ptr @.str.lit.83, i64 19)
  %t8148 = load i64, ptr @"emit.internal:rd-token-at"
  %t8149 = call fastcc i64 @"emit.internal:code:rd-token-at"(i64 %t8148, i64 3, i64 %a0, i64 %a1, i64 %t7914, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8150 = load i64, ptr @"scheme.base:%read-error"
  call void @rt_check_callable(i64 %t8150)
  %t8151 = and i64 %t8150, -8
  %t8152 = inttoptr i64 %t8151 to ptr
  %t8153 = load i64, ptr %t8152
  %t8154 = inttoptr i64 %t8153 to ptr
  %t8155 = musttail call fastcc i64 %t8154(i64 %t8150, i64 3, i64 %t8146, i64 %t8147, i64 %t8149, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8155
}

define fastcc i64 @"scheme.base:code:read-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8160 = icmp eq i64 %argc, 1
  br i1 %t8160, label %argok1732, label %arityerr1731
arityerr1731:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1732:
  %t8161 = call i64 @rt_string_length(i64 %a0)
  %t8162 = load i64, ptr @"emit.internal:rd-state"
  %t8163 = call fastcc i64 @"emit.internal:code:rd-state"(i64 %t8162, i64 1, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8164 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t8165 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t8164, i64 4, i64 %a0, i64 %t8161, i64 0, i64 %t8163, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8166 = load i64, ptr @"emit.internal:rd-datum"
  %t8167 = call fastcc i64 @"emit.internal:code:rd-datum"(i64 %t8166, i64 4, i64 %a0, i64 %t8161, i64 %t8165, i64 %t8163, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8168 = load i64, ptr @"emit.internal:rd-finish"
  %t8169 = call fastcc i64 @"emit.internal:code:rd-finish"(i64 %t8168, i64 2, i64 %t8163, i64 %t8167, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8170 = call i64 @rt_cdr(i64 %t8169)
  %t8171 = load i64, ptr @"emit.internal:rd-fail?"
  %t8172 = call fastcc i64 @"emit.internal:code:rd-fail?"(i64 %t8171, i64 1, i64 %t8170, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8173 = icmp ne i64 %t8172, 1
  br i1 %t8173, label %then1733, label %else1734
then1733:
  %t8174 = load i64, ptr @"scheme.base:rd-report"
  call void @rt_check_callable(i64 %t8174)
  %t8175 = and i64 %t8174, -8
  %t8176 = inttoptr i64 %t8175 to ptr
  %t8177 = load i64, ptr %t8176
  %t8178 = inttoptr i64 %t8177 to ptr
  %t8179 = musttail call fastcc i64 %t8178(i64 %t8174, i64 3, i64 %a0, i64 %t8161, i64 %t8169, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8179
else1734:
  %t8180 = call i64 @rt_car(i64 %t8169)
  ret i64 %t8180
}

define fastcc i64 @"scheme.base:code:read-all-from-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8185 = icmp eq i64 %argc, 1
  br i1 %t8185, label %argok1736, label %arityerr1735
arityerr1735:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1736:
  %t8186 = load i64, ptr @"scheme.base:rd-all"
  call void @rt_check_callable(i64 %t8186)
  %t8187 = and i64 %t8186, -8
  %t8188 = inttoptr i64 %t8187 to ptr
  %t8189 = load i64, ptr %t8188
  %t8190 = inttoptr i64 %t8189 to ptr
  %t8191 = musttail call fastcc i64 %t8190(i64 %t8186, i64 2, i64 %a0, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8191
}

define fastcc i64 @"scheme.base:code:read-all-from-string-ci"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8196 = icmp eq i64 %argc, 1
  br i1 %t8196, label %argok1738, label %arityerr1737
arityerr1737:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1738:
  %t8197 = load i64, ptr @"scheme.base:rd-all"
  call void @rt_check_callable(i64 %t8197)
  %t8198 = and i64 %t8197, -8
  %t8199 = inttoptr i64 %t8198 to ptr
  %t8200 = load i64, ptr %t8199
  %t8201 = inttoptr i64 %t8200 to ptr
  %t8202 = musttail call fastcc i64 %t8201(i64 %t8197, i64 2, i64 %a0, i64 257, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8202
}

define fastcc i64 @"scheme.base:code_1356"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8207 = icmp eq i64 %argc, 2
  br i1 %t8207, label %argok1740, label %arityerr1739
arityerr1739:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1740:
  %t8208 = load i64, ptr @"emit.internal:rd-fail?"
  %t8209 = call fastcc i64 @"emit.internal:code:rd-fail?"(i64 %t8208, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8210 = icmp ne i64 %t8209, 1
  br i1 %t8210, label %then1741, label %else1742
then1741:
  %t8211 = and i64 %self, -8
  %t8212 = inttoptr i64 %t8211 to ptr
  %t8213 = getelementptr i64, ptr %t8212, i64 1
  %t8214 = load i64, ptr %t8213
  %t8215 = and i64 %self, -8
  %t8216 = inttoptr i64 %t8215 to ptr
  %t8217 = getelementptr i64, ptr %t8216, i64 2
  %t8218 = load i64, ptr %t8217
  %t8219 = call i64 @rt_intern(ptr @.str.sym.51)
  %t8220 = call i64 @rt_cons(i64 %t8219, i64 %a0)
  %t8221 = load i64, ptr @"scheme.base:rd-report"
  call void @rt_check_callable(i64 %t8221)
  %t8222 = and i64 %t8221, -8
  %t8223 = inttoptr i64 %t8222 to ptr
  %t8224 = load i64, ptr %t8223
  %t8225 = inttoptr i64 %t8224 to ptr
  %t8226 = musttail call fastcc i64 %t8225(i64 %t8221, i64 3, i64 %t8214, i64 %t8218, i64 %t8220, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8226
else1742:
  %t8227 = and i64 %self, -8
  %t8228 = inttoptr i64 %t8227 to ptr
  %t8229 = getelementptr i64, ptr %t8228, i64 2
  %t8230 = load i64, ptr %t8229
  %t8231 = or i64 %a0, %t8230
  %t8232 = and i64 %t8231, 7
  %t8233 = icmp eq i64 %t8232, 0
  br i1 %t8233, label %fixfast1743, label %fixslow1744
fixfast1743:
  %t8234 = icmp slt i64 %a0, %t8230
  %t8235 = select i1 %t8234, i64 257, i64 1
  br label %fixmerge1745
fixslow1744:
  %t8236 = call i64 @rt_lt(i64 %a0, i64 %t8230)
  br label %fixmerge1745
fixmerge1745:
  %t8237 = phi i64 [ %t8235, %fixfast1743 ], [ %t8236, %fixslow1744 ]
  %t8238 = icmp ne i64 %t8237, 1
  br i1 %t8238, label %then1746, label %else1747
then1746:
  %t8239 = and i64 %self, -8
  %t8240 = inttoptr i64 %t8239 to ptr
  %t8241 = getelementptr i64, ptr %t8240, i64 3
  %t8242 = load i64, ptr %t8241
  %t8243 = load i64, ptr @"emit.internal:rd-state-child"
  %t8244 = call fastcc i64 @"emit.internal:code:rd-state-child"(i64 %t8243, i64 1, i64 %t8242, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8245 = and i64 %self, -8
  %t8246 = inttoptr i64 %t8245 to ptr
  %t8247 = getelementptr i64, ptr %t8246, i64 1
  %t8248 = load i64, ptr %t8247
  %t8249 = and i64 %self, -8
  %t8250 = inttoptr i64 %t8249 to ptr
  %t8251 = getelementptr i64, ptr %t8250, i64 2
  %t8252 = load i64, ptr %t8251
  %t8253 = load i64, ptr @"emit.internal:rd-datum"
  %t8254 = call fastcc i64 @"emit.internal:code:rd-datum"(i64 %t8253, i64 4, i64 %t8248, i64 %t8252, i64 %a0, i64 %t8244, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8255 = load i64, ptr @"emit.internal:rd-finish"
  %t8256 = call fastcc i64 @"emit.internal:code:rd-finish"(i64 %t8255, i64 2, i64 %t8244, i64 %t8254, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8257 = call i64 @rt_cdr(i64 %t8256)
  %t8258 = load i64, ptr @"emit.internal:rd-fail?"
  %t8259 = call fastcc i64 @"emit.internal:code:rd-fail?"(i64 %t8258, i64 1, i64 %t8257, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8260 = icmp ne i64 %t8259, 1
  br i1 %t8260, label %then1748, label %else1749
then1748:
  %t8261 = and i64 %self, -8
  %t8262 = inttoptr i64 %t8261 to ptr
  %t8263 = getelementptr i64, ptr %t8262, i64 1
  %t8264 = load i64, ptr %t8263
  %t8265 = and i64 %self, -8
  %t8266 = inttoptr i64 %t8265 to ptr
  %t8267 = getelementptr i64, ptr %t8266, i64 2
  %t8268 = load i64, ptr %t8267
  %t8269 = load i64, ptr @"scheme.base:rd-report"
  call void @rt_check_callable(i64 %t8269)
  %t8270 = and i64 %t8269, -8
  %t8271 = inttoptr i64 %t8270 to ptr
  %t8272 = load i64, ptr %t8271
  %t8273 = inttoptr i64 %t8272 to ptr
  %t8274 = musttail call fastcc i64 %t8273(i64 %t8269, i64 3, i64 %t8264, i64 %t8268, i64 %t8256, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8274
else1749:
  %t8275 = and i64 %self, -8
  %t8276 = inttoptr i64 %t8275 to ptr
  %t8277 = getelementptr i64, ptr %t8276, i64 1
  %t8278 = load i64, ptr %t8277
  %t8279 = and i64 %self, -8
  %t8280 = inttoptr i64 %t8279 to ptr
  %t8281 = getelementptr i64, ptr %t8280, i64 2
  %t8282 = load i64, ptr %t8281
  %t8283 = call i64 @rt_cdr(i64 %t8256)
  %t8284 = and i64 %self, -8
  %t8285 = inttoptr i64 %t8284 to ptr
  %t8286 = getelementptr i64, ptr %t8285, i64 3
  %t8287 = load i64, ptr %t8286
  %t8288 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t8289 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t8288, i64 4, i64 %t8278, i64 %t8282, i64 %t8283, i64 %t8287, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8290 = call i64 @rt_car(i64 %t8256)
  %t8291 = call i64 @rt_cons(i64 %t8290, i64 %a1)
  %t8292 = musttail call fastcc i64 @"scheme.base:code_1356"(i64 %self, i64 2, i64 %t8289, i64 %t8291, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8292
else1747:
  %t8293 = load i64, ptr @"scheme.base:reverse"
  call void @rt_check_callable(i64 %t8293)
  %t8294 = and i64 %t8293, -8
  %t8295 = inttoptr i64 %t8294 to ptr
  %t8296 = load i64, ptr %t8295
  %t8297 = inttoptr i64 %t8296 to ptr
  %t8298 = musttail call fastcc i64 %t8297(i64 %t8293, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8298
}

define fastcc i64 @"scheme.base:code:rd-all"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8299 = icmp eq i64 %argc, 2
  br i1 %t8299, label %argok1751, label %arityerr1750
arityerr1750:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1751:
  %t8300 = call i64 @rt_string_length(i64 %a0)
  %t8301 = load i64, ptr @"emit.internal:rd-state"
  %t8302 = call fastcc i64 @"emit.internal:code:rd-state"(i64 %t8301, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8303 = call ptr @rt_alloc_words(i64 5)
  %t8304 = ptrtoint ptr %t8303 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1356" to i64), ptr %t8303
  %t8305 = or i64 %t8304, 4
  %t8306 = getelementptr i64, ptr %t8303, i64 1
  store i64 %a0, ptr %t8306
  %t8307 = getelementptr i64, ptr %t8303, i64 2
  store i64 %t8300, ptr %t8307
  %t8308 = getelementptr i64, ptr %t8303, i64 3
  store i64 %t8302, ptr %t8308
  %t8309 = getelementptr i64, ptr %t8303, i64 4
  store i64 %t8305, ptr %t8309
  %t8310 = load i64, ptr @"emit.internal:rd-skip-ws"
  %t8311 = call fastcc i64 @"emit.internal:code:rd-skip-ws"(i64 %t8310, i64 4, i64 %a0, i64 %t8300, i64 0, i64 %t8302, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8312 = musttail call fastcc i64 @"scheme.base:code_1356"(i64 %t8305, i64 2, i64 %t8311, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8312
}

define fastcc i64 @"scheme.base:code:port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8317 = icmp eq i64 %argc, 1
  br i1 %t8317, label %argok1753, label %arityerr1752
arityerr1752:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1753:
  %t8318 = load i64, ptr @"emit.internal:%port-rtd"
  %t8319 = call fastcc i64 @"emit.internal:code:%port-rtd"(i64 %t8318, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8320 = call i64 @rt_record_of_type_p(i64 %a0, i64 %t8319)
  ret i64 %t8320
}

define fastcc i64 @"scheme.base:code:input-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8325 = icmp eq i64 %argc, 1
  br i1 %t8325, label %argok1755, label %arityerr1754
arityerr1754:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1755:
  %t8326 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t8326)
  %t8327 = and i64 %t8326, -8
  %t8328 = inttoptr i64 %t8327 to ptr
  %t8329 = load i64, ptr %t8328
  %t8330 = inttoptr i64 %t8329 to ptr
  %t8331 = call fastcc i64%t8330(i64 %t8326, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8332 = icmp ne i64 %t8331, 1
  br i1 %t8332, label %then1756, label %else1757
then1756:
  %t8333 = call i64 @rt_record_ref(i64 %a0, i64 8)
  ret i64 %t8333
else1757:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8338 = icmp eq i64 %argc, 1
  br i1 %t8338, label %argok1759, label %arityerr1758
arityerr1758:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1759:
  %t8339 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t8339)
  %t8340 = and i64 %t8339, -8
  %t8341 = inttoptr i64 %t8340 to ptr
  %t8342 = load i64, ptr %t8341
  %t8343 = inttoptr i64 %t8342 to ptr
  %t8344 = call fastcc i64%t8343(i64 %t8339, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8345 = icmp ne i64 %t8344, 1
  br i1 %t8345, label %then1760, label %else1761
then1760:
  %t8346 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t8347 = call i64 @rt_not(i64 %t8346)
  ret i64 %t8347
else1761:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:textual-port?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8352 = icmp eq i64 %argc, 1
  br i1 %t8352, label %argok1763, label %arityerr1762
arityerr1762:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1763:
  %t8353 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t8353)
  %t8354 = and i64 %t8353, -8
  %t8355 = inttoptr i64 %t8354 to ptr
  %t8356 = load i64, ptr %t8355
  %t8357 = inttoptr i64 %t8356 to ptr
  %t8358 = musttail call fastcc i64 %t8357(i64 %t8353, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8358
}

define fastcc i64 @"scheme.base:code:port-closed?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8363 = icmp eq i64 %argc, 1
  br i1 %t8363, label %argok1765, label %arityerr1764
arityerr1764:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1765:
  %t8364 = call i64 @rt_record_ref(i64 %a0, i64 40)
  ret i64 %t8364
}

define fastcc i64 @"scheme.base:code:input-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8369 = icmp eq i64 %argc, 1
  br i1 %t8369, label %argok1767, label %arityerr1766
arityerr1766:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1767:
  %t8370 = load i64, ptr @"scheme.base:input-port?"
  call void @rt_check_callable(i64 %t8370)
  %t8371 = and i64 %t8370, -8
  %t8372 = inttoptr i64 %t8371 to ptr
  %t8373 = load i64, ptr %t8372
  %t8374 = inttoptr i64 %t8373 to ptr
  %t8375 = call fastcc i64%t8374(i64 %t8370, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8376 = icmp ne i64 %t8375, 1
  br i1 %t8376, label %then1768, label %else1769
then1768:
  %t8377 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t8378 = call i64 @rt_not(i64 %t8377)
  ret i64 %t8378
else1769:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:output-port-open?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8383 = icmp eq i64 %argc, 1
  br i1 %t8383, label %argok1771, label %arityerr1770
arityerr1770:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1771:
  %t8384 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t8384)
  %t8385 = and i64 %t8384, -8
  %t8386 = inttoptr i64 %t8385 to ptr
  %t8387 = load i64, ptr %t8386
  %t8388 = inttoptr i64 %t8387 to ptr
  %t8389 = call fastcc i64%t8388(i64 %t8384, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8390 = icmp ne i64 %t8389, 1
  br i1 %t8390, label %then1772, label %else1773
then1772:
  %t8391 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t8392 = call i64 @rt_not(i64 %t8391)
  ret i64 %t8392
else1773:
  ret i64 1
}

define fastcc i64 @"scheme.base:code:%check-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8397 = icmp eq i64 %argc, 2
  br i1 %t8397, label %argok1775, label %arityerr1774
arityerr1774:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1775:
  %t8398 = load i64, ptr @"scheme.base:input-port?"
  call void @rt_check_callable(i64 %t8398)
  %t8399 = and i64 %t8398, -8
  %t8400 = inttoptr i64 %t8399 to ptr
  %t8401 = load i64, ptr %t8400
  %t8402 = inttoptr i64 %t8401 to ptr
  %t8403 = call fastcc i64%t8402(i64 %t8398, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8404 = call i64 @rt_not(i64 %t8403)
  %t8405 = icmp ne i64 %t8404, 1
  br i1 %t8405, label %then1776, label %else1777
then1776:
  %t8406 = call i64 @rt_make_string(ptr @.str.lit.84, i64 17)
  %t8407 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8407)
  %t8408 = and i64 %t8407, -8
  %t8409 = inttoptr i64 %t8408 to ptr
  %t8410 = load i64, ptr %t8409
  %t8411 = inttoptr i64 %t8410 to ptr
  %t8412 = musttail call fastcc i64 %t8411(i64 %t8407, i64 3, i64 %a1, i64 %t8406, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8412
else1777:
  %t8413 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t8414 = icmp ne i64 %t8413, 1
  br i1 %t8414, label %then1778, label %else1779
then1778:
  %t8415 = call i64 @rt_make_string(ptr @.str.lit.85, i64 14)
  %t8416 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8416)
  %t8417 = and i64 %t8416, -8
  %t8418 = inttoptr i64 %t8417 to ptr
  %t8419 = load i64, ptr %t8418
  %t8420 = inttoptr i64 %t8419 to ptr
  %t8421 = musttail call fastcc i64 %t8420(i64 %t8416, i64 3, i64 %a1, i64 %t8415, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8421
else1779:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:%check-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8426 = icmp eq i64 %argc, 2
  br i1 %t8426, label %argok1781, label %arityerr1780
arityerr1780:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1781:
  %t8427 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t8427)
  %t8428 = and i64 %t8427, -8
  %t8429 = inttoptr i64 %t8428 to ptr
  %t8430 = load i64, ptr %t8429
  %t8431 = inttoptr i64 %t8430 to ptr
  %t8432 = call fastcc i64%t8431(i64 %t8427, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8433 = call i64 @rt_not(i64 %t8432)
  %t8434 = icmp ne i64 %t8433, 1
  br i1 %t8434, label %then1782, label %else1783
then1782:
  %t8435 = call i64 @rt_make_string(ptr @.str.lit.86, i64 18)
  %t8436 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8436)
  %t8437 = and i64 %t8436, -8
  %t8438 = inttoptr i64 %t8437 to ptr
  %t8439 = load i64, ptr %t8438
  %t8440 = inttoptr i64 %t8439 to ptr
  %t8441 = musttail call fastcc i64 %t8440(i64 %t8436, i64 3, i64 %a1, i64 %t8435, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8441
else1783:
  %t8442 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t8443 = icmp ne i64 %t8442, 1
  br i1 %t8443, label %then1784, label %else1785
then1784:
  %t8444 = call i64 @rt_make_string(ptr @.str.lit.87, i64 14)
  %t8445 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8445)
  %t8446 = and i64 %t8445, -8
  %t8447 = inttoptr i64 %t8446 to ptr
  %t8448 = load i64, ptr %t8447
  %t8449 = inttoptr i64 %t8448 to ptr
  %t8450 = musttail call fastcc i64 %t8449(i64 %t8445, i64 3, i64 %a1, i64 %t8444, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8450
else1785:
  ret i64 %a0
}

define fastcc i64 @"scheme.base:code:open-input-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8455 = icmp eq i64 %argc, 1
  br i1 %t8455, label %argok1787, label %arityerr1786
arityerr1786:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1787:
  %t8456 = load i64, ptr @"emit.internal:%make-port"
  %t8457 = musttail call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8456, i64 6, i64 1, i64 257, i64 %a0, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t8457
}

define fastcc i64 @"scheme.base:code:%port-at-eof?"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8462 = icmp eq i64 %argc, 1
  br i1 %t8462, label %argok1789, label %arityerr1788
arityerr1788:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1789:
  %t8463 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t8464 = load i64, ptr @"emit.internal:%port-buf"
  %t8465 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t8464, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8466 = call i64 @rt_string_length(i64 %t8465)
  %t8467 = or i64 %t8466, %t8463
  %t8468 = and i64 %t8467, 7
  %t8469 = icmp eq i64 %t8468, 0
  br i1 %t8469, label %fixfast1790, label %fixslow1791
fixfast1790:
  %t8470 = icmp slt i64 %t8466, %t8463
  %t8471 = select i1 %t8470, i64 257, i64 1
  br label %fixmerge1792
fixslow1791:
  %t8472 = call i64 @rt_lt(i64 %t8466, i64 %t8463)
  br label %fixmerge1792
fixmerge1792:
  %t8473 = phi i64 [ %t8471, %fixfast1790 ], [ %t8472, %fixslow1791 ]
  %t8474 = icmp ne i64 %t8473, 1
  br i1 %t8474, label %then1793, label %else1794
then1793:
  ret i64 257
else1794:
  %t8475 = or i64 %t8463, %t8466
  %t8476 = and i64 %t8475, 7
  %t8477 = icmp eq i64 %t8476, 0
  br i1 %t8477, label %fixfast1795, label %fixslow1796
fixfast1795:
  %t8478 = icmp eq i64 %t8463, %t8466
  %t8479 = select i1 %t8478, i64 257, i64 1
  br label %fixmerge1797
fixslow1796:
  %t8480 = call i64 @rt_num_eq(i64 %t8463, i64 %t8466)
  br label %fixmerge1797
fixmerge1797:
  %t8481 = phi i64 [ %t8479, %fixfast1795 ], [ %t8480, %fixslow1796 ]
  ret i64 %t8481
}

define fastcc i64 @"scheme.base:code:read-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8486 = icmp eq i64 %argc, 1
  br i1 %t8486, label %argok1799, label %arityerr1798
arityerr1798:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1799:
  %t8487 = call i64 @rt_intern(ptr @.str.sym.88)
  %t8488 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t8488)
  %t8489 = and i64 %t8488, -8
  %t8490 = inttoptr i64 %t8489 to ptr
  %t8491 = load i64, ptr %t8490
  %t8492 = inttoptr i64 %t8491 to ptr
  %t8493 = call fastcc i64%t8492(i64 %t8488, i64 2, i64 %a0, i64 %t8487, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8494 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t8494)
  %t8495 = and i64 %t8494, -8
  %t8496 = inttoptr i64 %t8495 to ptr
  %t8497 = load i64, ptr %t8496
  %t8498 = inttoptr i64 %t8497 to ptr
  %t8499 = call fastcc i64%t8498(i64 %t8494, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8500 = icmp ne i64 %t8499, 1
  br i1 %t8500, label %then1800, label %else1801
then1800:
  %t8501 = call i64 @rt_eof_object()
  ret i64 %t8501
else1801:
  %t8502 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t8503 = or i64 %t8502, 8
  %t8504 = and i64 %t8503, 7
  %t8505 = icmp eq i64 %t8504, 0
  br i1 %t8505, label %fixfast1802, label %fixslow1803
fixfast1802:
  %t8506 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t8502, i64 8)
  %t8507 = extractvalue {i64, i1} %t8506, 0
  %t8508 = extractvalue {i64, i1} %t8506, 1
  br i1 %t8508, label %fixslow1803, label %fixmerge1804
fixslow1803:
  %t8509 = call i64 @rt_add(i64 %t8502, i64 8)
  br label %fixmerge1804
fixmerge1804:
  %t8510 = phi i64 [ %t8507, %fixfast1802 ], [ %t8509, %fixslow1803 ]
  %t8511 = call i64 @rt_record_set(i64 %a0, i64 24, i64 %t8510)
  %t8512 = load i64, ptr @"emit.internal:%port-buf"
  %t8513 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t8512, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8514 = call i64 @rt_string_ref(i64 %t8513, i64 %t8502)
  ret i64 %t8514
}

define fastcc i64 @"scheme.base:code:peek-char"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8519 = icmp eq i64 %argc, 1
  br i1 %t8519, label %argok1806, label %arityerr1805
arityerr1805:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1806:
  %t8520 = call i64 @rt_intern(ptr @.str.sym.89)
  %t8521 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t8521)
  %t8522 = and i64 %t8521, -8
  %t8523 = inttoptr i64 %t8522 to ptr
  %t8524 = load i64, ptr %t8523
  %t8525 = inttoptr i64 %t8524 to ptr
  %t8526 = call fastcc i64%t8525(i64 %t8521, i64 2, i64 %a0, i64 %t8520, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8527 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t8527)
  %t8528 = and i64 %t8527, -8
  %t8529 = inttoptr i64 %t8528 to ptr
  %t8530 = load i64, ptr %t8529
  %t8531 = inttoptr i64 %t8530 to ptr
  %t8532 = call fastcc i64%t8531(i64 %t8527, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8533 = icmp ne i64 %t8532, 1
  br i1 %t8533, label %then1807, label %else1808
then1807:
  %t8534 = call i64 @rt_eof_object()
  ret i64 %t8534
else1808:
  %t8535 = load i64, ptr @"emit.internal:%port-buf"
  %t8536 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t8535, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8537 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t8538 = call i64 @rt_string_ref(i64 %t8536, i64 %t8537)
  ret i64 %t8538
}

define fastcc i64 @"scheme.base:code_1403"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8543 = icmp eq i64 %argc, 1
  br i1 %t8543, label %argok1810, label %arityerr1809
arityerr1809:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1810:
  %t8544 = and i64 %self, -8
  %t8545 = inttoptr i64 %t8544 to ptr
  %t8546 = getelementptr i64, ptr %t8545, i64 1
  %t8547 = load i64, ptr %t8546
  %t8548 = or i64 %t8547, %a0
  %t8549 = and i64 %t8548, 7
  %t8550 = icmp eq i64 %t8549, 0
  br i1 %t8550, label %fixfast1811, label %fixslow1812
fixfast1811:
  %t8551 = icmp slt i64 %t8547, %a0
  %t8552 = select i1 %t8551, i64 257, i64 1
  br label %fixmerge1813
fixslow1812:
  %t8553 = call i64 @rt_lt(i64 %t8547, i64 %a0)
  br label %fixmerge1813
fixmerge1813:
  %t8554 = phi i64 [ %t8552, %fixfast1811 ], [ %t8553, %fixslow1812 ]
  %t8555 = icmp ne i64 %t8554, 1
  br i1 %t8555, label %then1814, label %else1815
then1814:
  br label %merge1816
else1815:
  %t8556 = or i64 %a0, %t8547
  %t8557 = and i64 %t8556, 7
  %t8558 = icmp eq i64 %t8557, 0
  br i1 %t8558, label %fixfast1817, label %fixslow1818
fixfast1817:
  %t8559 = icmp eq i64 %a0, %t8547
  %t8560 = select i1 %t8559, i64 257, i64 1
  br label %fixmerge1819
fixslow1818:
  %t8561 = call i64 @rt_num_eq(i64 %a0, i64 %t8547)
  br label %fixmerge1819
fixmerge1819:
  %t8562 = phi i64 [ %t8560, %fixfast1817 ], [ %t8561, %fixslow1818 ]
  br label %merge1816
merge1816:
  %t8563 = phi i64 [ 257, %then1814 ], [ %t8562, %fixmerge1819 ]
  %t8564 = icmp ne i64 %t8563, 1
  br i1 %t8564, label %then1820, label %else1821
then1820:
  %t8565 = and i64 %self, -8
  %t8566 = inttoptr i64 %t8565 to ptr
  %t8567 = getelementptr i64, ptr %t8566, i64 2
  %t8568 = load i64, ptr %t8567
  %t8569 = call i64 @rt_record_ref(i64 %t8568, i64 24)
  %t8570 = and i64 %self, -8
  %t8571 = inttoptr i64 %t8570 to ptr
  %t8572 = getelementptr i64, ptr %t8571, i64 2
  %t8573 = load i64, ptr %t8572
  %t8574 = and i64 %self, -8
  %t8575 = inttoptr i64 %t8574 to ptr
  %t8576 = getelementptr i64, ptr %t8575, i64 1
  %t8577 = load i64, ptr %t8576
  %t8578 = call i64 @rt_record_set(i64 %t8573, i64 24, i64 %t8577)
  %t8579 = and i64 %self, -8
  %t8580 = inttoptr i64 %t8579 to ptr
  %t8581 = getelementptr i64, ptr %t8580, i64 3
  %t8582 = load i64, ptr %t8581
  %t8583 = and i64 %self, -8
  %t8584 = inttoptr i64 %t8583 to ptr
  %t8585 = getelementptr i64, ptr %t8584, i64 1
  %t8586 = load i64, ptr %t8585
  %t8587 = call i64 @rt_substring(i64 %t8582, i64 %t8569, i64 %t8586)
  ret i64 %t8587
else1821:
  %t8588 = and i64 %self, -8
  %t8589 = inttoptr i64 %t8588 to ptr
  %t8590 = getelementptr i64, ptr %t8589, i64 3
  %t8591 = load i64, ptr %t8590
  %t8592 = call i64 @rt_string_ref(i64 %t8591, i64 %a0)
  %t8593 = load i64, ptr @"scheme.base:char=?"
  call void @rt_check_callable(i64 %t8593)
  %t8594 = and i64 %t8593, -8
  %t8595 = inttoptr i64 %t8594 to ptr
  %t8596 = load i64, ptr %t8595
  %t8597 = inttoptr i64 %t8596 to ptr
  %t8598 = call fastcc i64%t8597(i64 %t8593, i64 2, i64 %t8592, i64 2569, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8599 = icmp ne i64 %t8598, 1
  br i1 %t8599, label %then1822, label %else1823
then1822:
  %t8600 = and i64 %self, -8
  %t8601 = inttoptr i64 %t8600 to ptr
  %t8602 = getelementptr i64, ptr %t8601, i64 2
  %t8603 = load i64, ptr %t8602
  %t8604 = call i64 @rt_record_ref(i64 %t8603, i64 24)
  %t8605 = and i64 %self, -8
  %t8606 = inttoptr i64 %t8605 to ptr
  %t8607 = getelementptr i64, ptr %t8606, i64 2
  %t8608 = load i64, ptr %t8607
  %t8609 = or i64 %a0, 8
  %t8610 = and i64 %t8609, 7
  %t8611 = icmp eq i64 %t8610, 0
  br i1 %t8611, label %fixfast1824, label %fixslow1825
fixfast1824:
  %t8612 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t8613 = extractvalue {i64, i1} %t8612, 0
  %t8614 = extractvalue {i64, i1} %t8612, 1
  br i1 %t8614, label %fixslow1825, label %fixmerge1826
fixslow1825:
  %t8615 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1826
fixmerge1826:
  %t8616 = phi i64 [ %t8613, %fixfast1824 ], [ %t8615, %fixslow1825 ]
  %t8617 = call i64 @rt_record_set(i64 %t8608, i64 24, i64 %t8616)
  %t8618 = and i64 %self, -8
  %t8619 = inttoptr i64 %t8618 to ptr
  %t8620 = getelementptr i64, ptr %t8619, i64 3
  %t8621 = load i64, ptr %t8620
  %t8622 = call i64 @rt_substring(i64 %t8621, i64 %t8604, i64 %a0)
  ret i64 %t8622
else1823:
  %t8623 = or i64 %a0, 8
  %t8624 = and i64 %t8623, 7
  %t8625 = icmp eq i64 %t8624, 0
  br i1 %t8625, label %fixfast1827, label %fixslow1828
fixfast1827:
  %t8626 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %a0, i64 8)
  %t8627 = extractvalue {i64, i1} %t8626, 0
  %t8628 = extractvalue {i64, i1} %t8626, 1
  br i1 %t8628, label %fixslow1828, label %fixmerge1829
fixslow1828:
  %t8629 = call i64 @rt_add(i64 %a0, i64 8)
  br label %fixmerge1829
fixmerge1829:
  %t8630 = phi i64 [ %t8627, %fixfast1827 ], [ %t8629, %fixslow1828 ]
  %t8631 = musttail call fastcc i64 @"scheme.base:code_1403"(i64 %self, i64 1, i64 %t8630, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8631
}

define fastcc i64 @"scheme.base:code:read-line"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8632 = icmp eq i64 %argc, 1
  br i1 %t8632, label %argok1831, label %arityerr1830
arityerr1830:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1831:
  %t8633 = call i64 @rt_intern(ptr @.str.sym.90)
  %t8634 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t8634)
  %t8635 = and i64 %t8634, -8
  %t8636 = inttoptr i64 %t8635 to ptr
  %t8637 = load i64, ptr %t8636
  %t8638 = inttoptr i64 %t8637 to ptr
  %t8639 = call fastcc i64%t8638(i64 %t8634, i64 2, i64 %a0, i64 %t8633, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8640 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t8640)
  %t8641 = and i64 %t8640, -8
  %t8642 = inttoptr i64 %t8641 to ptr
  %t8643 = load i64, ptr %t8642
  %t8644 = inttoptr i64 %t8643 to ptr
  %t8645 = call fastcc i64%t8644(i64 %t8640, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8646 = icmp ne i64 %t8645, 1
  br i1 %t8646, label %then1832, label %else1833
then1832:
  %t8647 = call i64 @rt_eof_object()
  ret i64 %t8647
else1833:
  %t8648 = load i64, ptr @"emit.internal:%port-buf"
  %t8649 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t8648, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8650 = call i64 @rt_string_length(i64 %t8649)
  %t8651 = call ptr @rt_alloc_words(i64 5)
  %t8652 = ptrtoint ptr %t8651 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1403" to i64), ptr %t8651
  %t8653 = or i64 %t8652, 4
  %t8654 = getelementptr i64, ptr %t8651, i64 1
  store i64 %t8650, ptr %t8654
  %t8655 = getelementptr i64, ptr %t8651, i64 2
  store i64 %a0, ptr %t8655
  %t8656 = getelementptr i64, ptr %t8651, i64 3
  store i64 %t8649, ptr %t8656
  %t8657 = getelementptr i64, ptr %t8651, i64 4
  store i64 %t8653, ptr %t8657
  %t8658 = call i64 @rt_record_ref(i64 %a0, i64 24)
  %t8659 = musttail call fastcc i64 @"scheme.base:code_1403"(i64 %t8653, i64 1, i64 %t8658, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8659
}

define fastcc i64 @"scheme.base:code:read-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8664 = icmp eq i64 %argc, 2
  br i1 %t8664, label %argok1835, label %arityerr1834
arityerr1834:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1835:
  %t8665 = call i64 @rt_intern(ptr @.str.sym.91)
  %t8666 = load i64, ptr @"scheme.base:%check-input-port"
  call void @rt_check_callable(i64 %t8666)
  %t8667 = and i64 %t8666, -8
  %t8668 = inttoptr i64 %t8667 to ptr
  %t8669 = load i64, ptr %t8668
  %t8670 = inttoptr i64 %t8669 to ptr
  %t8671 = call fastcc i64%t8670(i64 %t8666, i64 2, i64 %a1, i64 %t8665, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8672 = load i64, ptr @"scheme.base:%port-at-eof?"
  call void @rt_check_callable(i64 %t8672)
  %t8673 = and i64 %t8672, -8
  %t8674 = inttoptr i64 %t8673 to ptr
  %t8675 = load i64, ptr %t8674
  %t8676 = inttoptr i64 %t8675 to ptr
  %t8677 = call fastcc i64%t8676(i64 %t8672, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8678 = icmp ne i64 %t8677, 1
  br i1 %t8678, label %then1836, label %else1837
then1836:
  %t8679 = call i64 @rt_eof_object()
  ret i64 %t8679
else1837:
  %t8680 = load i64, ptr @"emit.internal:%port-buf"
  %t8681 = call fastcc i64 @"emit.internal:code:%port-buf"(i64 %t8680, i64 1, i64 %a1, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8682 = call i64 @rt_string_length(i64 %t8681)
  %t8683 = call i64 @rt_record_ref(i64 %a1, i64 24)
  %t8684 = or i64 %t8683, %a0
  %t8685 = and i64 %t8684, 7
  %t8686 = icmp eq i64 %t8685, 0
  br i1 %t8686, label %fixfast1838, label %fixslow1839
fixfast1838:
  %t8687 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t8683, i64 %a0)
  %t8688 = extractvalue {i64, i1} %t8687, 0
  %t8689 = extractvalue {i64, i1} %t8687, 1
  br i1 %t8689, label %fixslow1839, label %fixmerge1840
fixslow1839:
  %t8690 = call i64 @rt_add(i64 %t8683, i64 %a0)
  br label %fixmerge1840
fixmerge1840:
  %t8691 = phi i64 [ %t8688, %fixfast1838 ], [ %t8690, %fixslow1839 ]
  %t8692 = or i64 %t8682, %t8691
  %t8693 = and i64 %t8692, 7
  %t8694 = icmp eq i64 %t8693, 0
  br i1 %t8694, label %fixfast1841, label %fixslow1842
fixfast1841:
  %t8695 = icmp slt i64 %t8682, %t8691
  %t8696 = select i1 %t8695, i64 257, i64 1
  br label %fixmerge1843
fixslow1842:
  %t8697 = call i64 @rt_lt(i64 %t8682, i64 %t8691)
  br label %fixmerge1843
fixmerge1843:
  %t8698 = phi i64 [ %t8696, %fixfast1841 ], [ %t8697, %fixslow1842 ]
  %t8699 = icmp ne i64 %t8698, 1
  br i1 %t8699, label %then1844, label %else1845
then1844:
  br label %merge1846
else1845:
  %t8700 = or i64 %t8683, %a0
  %t8701 = and i64 %t8700, 7
  %t8702 = icmp eq i64 %t8701, 0
  br i1 %t8702, label %fixfast1847, label %fixslow1848
fixfast1847:
  %t8703 = call {i64, i1} @llvm.sadd.with.overflow.i64(i64 %t8683, i64 %a0)
  %t8704 = extractvalue {i64, i1} %t8703, 0
  %t8705 = extractvalue {i64, i1} %t8703, 1
  br i1 %t8705, label %fixslow1848, label %fixmerge1849
fixslow1848:
  %t8706 = call i64 @rt_add(i64 %t8683, i64 %a0)
  br label %fixmerge1849
fixmerge1849:
  %t8707 = phi i64 [ %t8704, %fixfast1847 ], [ %t8706, %fixslow1848 ]
  br label %merge1846
merge1846:
  %t8708 = phi i64 [ %t8682, %then1844 ], [ %t8707, %fixmerge1849 ]
  %t8709 = call i64 @rt_record_set(i64 %a1, i64 24, i64 %t8708)
  %t8710 = call i64 @rt_substring(i64 %t8681, i64 %t8683, i64 %t8708)
  ret i64 %t8710
}

define fastcc i64 @"scheme.base:code:open-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8715 = icmp eq i64 %argc, 0
  br i1 %t8715, label %argok1851, label %arityerr1850
arityerr1850:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1851:
  %t8716 = call i64 @rt_port_open_output_string()
  %t8717 = icmp ne i64 %t8716, 1
  br i1 %t8717, label %then1852, label %else1853
then1852:
  %t8718 = load i64, ptr @"emit.internal:%make-port"
  %t8719 = musttail call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8718, i64 6, i64 %t8716, i64 1, i64 1, i64 0, i64 257, i64 1, i64 0, i64 0, ptr null)
  ret i64 %t8719
else1853:
  %t8720 = call i64 @rt_intern(ptr @.str.sym.92)
  %t8721 = call i64 @rt_make_string(ptr @.str.lit.93, i64 33)
  %t8722 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8722)
  %t8723 = and i64 %t8722, -8
  %t8724 = inttoptr i64 %t8723 to ptr
  %t8725 = load i64, ptr %t8724
  %t8726 = inttoptr i64 %t8725 to ptr
  %t8727 = musttail call fastcc i64 %t8726(i64 %t8722, i64 2, i64 %t8720, i64 %t8721, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8727
}

define fastcc i64 @"scheme.base:code:get-output-string"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8732 = icmp eq i64 %argc, 1
  br i1 %t8732, label %argok1855, label %arityerr1854
arityerr1854:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1855:
  %t8733 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t8733)
  %t8734 = and i64 %t8733, -8
  %t8735 = inttoptr i64 %t8734 to ptr
  %t8736 = load i64, ptr %t8735
  %t8737 = inttoptr i64 %t8736 to ptr
  %t8738 = call fastcc i64%t8737(i64 %t8733, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8739 = call i64 @rt_not(i64 %t8738)
  %t8740 = icmp ne i64 %t8739, 1
  br i1 %t8740, label %then1856, label %else1857
then1856:
  %t8741 = call i64 @rt_intern(ptr @.str.sym.94)
  %t8742 = call i64 @rt_make_string(ptr @.str.lit.95, i64 18)
  %t8743 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8743)
  %t8744 = and i64 %t8743, -8
  %t8745 = inttoptr i64 %t8744 to ptr
  %t8746 = load i64, ptr %t8745
  %t8747 = inttoptr i64 %t8746 to ptr
  %t8748 = musttail call fastcc i64 %t8747(i64 %t8743, i64 3, i64 %t8741, i64 %t8742, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8748
else1857:
  %t8749 = call i64 @rt_record_ref(i64 %a0, i64 32)
  %t8750 = call i64 @rt_not(i64 %t8749)
  %t8751 = icmp ne i64 %t8750, 1
  br i1 %t8751, label %then1858, label %else1859
then1858:
  %t8752 = call i64 @rt_intern(ptr @.str.sym.94)
  %t8753 = call i64 @rt_make_string(ptr @.str.lit.96, i64 17)
  %t8754 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8754)
  %t8755 = and i64 %t8754, -8
  %t8756 = inttoptr i64 %t8755 to ptr
  %t8757 = load i64, ptr %t8756
  %t8758 = inttoptr i64 %t8757 to ptr
  %t8759 = musttail call fastcc i64 %t8758(i64 %t8754, i64 3, i64 %t8752, i64 %t8753, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8759
else1859:
  %t8760 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t8761 = call i64 @rt_port_get_output_string(i64 %t8760)
  ret i64 %t8761
}

define fastcc i64 @"scheme.base:code:flush-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8766 = icmp eq i64 %argc, 1
  br i1 %t8766, label %argok1861, label %arityerr1860
arityerr1860:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1861:
  %t8767 = call i64 @rt_intern(ptr @.str.sym.97)
  %t8768 = load i64, ptr @"scheme.base:%check-output-port"
  call void @rt_check_callable(i64 %t8768)
  %t8769 = and i64 %t8768, -8
  %t8770 = inttoptr i64 %t8769 to ptr
  %t8771 = load i64, ptr %t8770
  %t8772 = inttoptr i64 %t8771 to ptr
  %t8773 = call fastcc i64%t8772(i64 %t8768, i64 2, i64 %a0, i64 %t8767, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8774 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t8775 = call i64 @rt_port_flush(i64 %t8774)
  ret i64 %t8775
}

define fastcc i64 @"scheme.base:code:close-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8780 = icmp eq i64 %argc, 1
  br i1 %t8780, label %argok1863, label %arityerr1862
arityerr1862:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1863:
  %t8781 = load i64, ptr @"scheme.base:port?"
  call void @rt_check_callable(i64 %t8781)
  %t8782 = and i64 %t8781, -8
  %t8783 = inttoptr i64 %t8782 to ptr
  %t8784 = load i64, ptr %t8783
  %t8785 = inttoptr i64 %t8784 to ptr
  %t8786 = call fastcc i64%t8785(i64 %t8781, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8787 = call i64 @rt_not(i64 %t8786)
  %t8788 = icmp ne i64 %t8787, 1
  br i1 %t8788, label %then1864, label %else1865
then1864:
  %t8789 = call i64 @rt_intern(ptr @.str.sym.98)
  %t8790 = call i64 @rt_make_string(ptr @.str.lit.99, i64 10)
  %t8791 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8791)
  %t8792 = and i64 %t8791, -8
  %t8793 = inttoptr i64 %t8792 to ptr
  %t8794 = load i64, ptr %t8793
  %t8795 = inttoptr i64 %t8794 to ptr
  %t8796 = musttail call fastcc i64 %t8795(i64 %t8791, i64 3, i64 %t8789, i64 %t8790, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8796
else1865:
  %t8797 = call i64 @rt_record_ref(i64 %a0, i64 40)
  %t8798 = icmp ne i64 %t8797, 1
  br i1 %t8798, label %then1866, label %else1867
then1866:
  %t8799 = icmp ne i64 1, 1
  br i1 %t8799, label %then1868, label %else1869
then1868:
  ret i64 1
else1869:
  ret i64 17
else1867:
  %t8800 = call i64 @rt_record_ref(i64 %a0, i64 8)
  %t8801 = call i64 @rt_not(i64 %t8800)
  %t8802 = icmp ne i64 %t8801, 1
  br i1 %t8802, label %then1870, label %else1871
then1870:
  %t8803 = call i64 @rt_record_ref(i64 %a0, i64 0)
  %t8804 = call i64 @rt_port_close(i64 %t8803)
  br label %merge1872
else1871:
  br label %merge1872
merge1872:
  %t8805 = phi i64 [ %t8804, %then1870 ], [ 17, %else1871 ]
  %t8806 = call i64 @rt_record_set(i64 %a0, i64 40, i64 257)
  %t8807 = icmp ne i64 1, 1
  br i1 %t8807, label %then1873, label %else1874
then1873:
  ret i64 1
else1874:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:close-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8812 = icmp eq i64 %argc, 1
  br i1 %t8812, label %argok1876, label %arityerr1875
arityerr1875:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1876:
  %t8813 = load i64, ptr @"scheme.base:input-port?"
  call void @rt_check_callable(i64 %t8813)
  %t8814 = and i64 %t8813, -8
  %t8815 = inttoptr i64 %t8814 to ptr
  %t8816 = load i64, ptr %t8815
  %t8817 = inttoptr i64 %t8816 to ptr
  %t8818 = call fastcc i64%t8817(i64 %t8813, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8819 = icmp ne i64 %t8818, 1
  br i1 %t8819, label %then1877, label %else1878
then1877:
  %t8820 = load i64, ptr @"scheme.base:close-port"
  call void @rt_check_callable(i64 %t8820)
  %t8821 = and i64 %t8820, -8
  %t8822 = inttoptr i64 %t8821 to ptr
  %t8823 = load i64, ptr %t8822
  %t8824 = inttoptr i64 %t8823 to ptr
  %t8825 = musttail call fastcc i64 %t8824(i64 %t8820, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8825
else1878:
  %t8826 = call i64 @rt_intern(ptr @.str.sym.100)
  %t8827 = call i64 @rt_make_string(ptr @.str.lit.101, i64 17)
  %t8828 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8828)
  %t8829 = and i64 %t8828, -8
  %t8830 = inttoptr i64 %t8829 to ptr
  %t8831 = load i64, ptr %t8830
  %t8832 = inttoptr i64 %t8831 to ptr
  %t8833 = musttail call fastcc i64 %t8832(i64 %t8828, i64 3, i64 %t8826, i64 %t8827, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8833
}

define fastcc i64 @"scheme.base:code:close-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8838 = icmp eq i64 %argc, 1
  br i1 %t8838, label %argok1880, label %arityerr1879
arityerr1879:
  call void @rt_arity_error(i64 1, i64 %argc)
  unreachable
argok1880:
  %t8839 = load i64, ptr @"scheme.base:output-port?"
  call void @rt_check_callable(i64 %t8839)
  %t8840 = and i64 %t8839, -8
  %t8841 = inttoptr i64 %t8840 to ptr
  %t8842 = load i64, ptr %t8841
  %t8843 = inttoptr i64 %t8842 to ptr
  %t8844 = call fastcc i64%t8843(i64 %t8839, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  %t8845 = icmp ne i64 %t8844, 1
  br i1 %t8845, label %then1881, label %else1882
then1881:
  %t8846 = load i64, ptr @"scheme.base:close-port"
  call void @rt_check_callable(i64 %t8846)
  %t8847 = and i64 %t8846, -8
  %t8848 = inttoptr i64 %t8847 to ptr
  %t8849 = load i64, ptr %t8848
  %t8850 = inttoptr i64 %t8849 to ptr
  %t8851 = musttail call fastcc i64 %t8850(i64 %t8846, i64 1, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8851
else1882:
  %t8852 = call i64 @rt_intern(ptr @.str.sym.102)
  %t8853 = call i64 @rt_make_string(ptr @.str.lit.103, i64 18)
  %t8854 = load i64, ptr @"scheme.base:error"
  call void @rt_check_callable(i64 %t8854)
  %t8855 = and i64 %t8854, -8
  %t8856 = inttoptr i64 %t8855 to ptr
  %t8857 = load i64, ptr %t8856
  %t8858 = inttoptr i64 %t8857 to ptr
  %t8859 = musttail call fastcc i64 %t8858(i64 %t8854, i64 3, i64 %t8852, i64 %t8853, i64 %a0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t8859
}

define fastcc i64 @"scheme.base:code:current-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8867 = icmp sge i64 %argc, 0
  br i1 %t8867, label %argok1884, label %arityerr1883
arityerr1883:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1884:
  %t8868 = call ptr @rt_alloc_words(i64 8)
  %t8869 = getelementptr i64, ptr %t8868, i64 0
  store i64 %a0, ptr %t8869
  %t8870 = getelementptr i64, ptr %t8868, i64 1
  store i64 %a1, ptr %t8870
  %t8871 = getelementptr i64, ptr %t8868, i64 2
  store i64 %a2, ptr %t8871
  %t8872 = getelementptr i64, ptr %t8868, i64 3
  store i64 %a3, ptr %t8872
  %t8873 = getelementptr i64, ptr %t8868, i64 4
  store i64 %a4, ptr %t8873
  %t8874 = getelementptr i64, ptr %t8868, i64 5
  store i64 %a5, ptr %t8874
  %t8875 = getelementptr i64, ptr %t8868, i64 6
  store i64 %a6, ptr %t8875
  %t8876 = getelementptr i64, ptr %t8868, i64 7
  store i64 %a7, ptr %t8876
  %t8877 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t8868, ptr %overflow)
  %t8878 = call i64 @rt_null_p(i64 %t8877)
  %t8879 = icmp ne i64 %t8878, 1
  br i1 %t8879, label %then1885, label %else1886
then1885:
  %t8880 = load i64, ptr @"scheme.base:%stdout-port"
  %t8881 = call i64 @rt_not(i64 %t8880)
  %t8882 = icmp ne i64 %t8881, 1
  br i1 %t8882, label %then1887, label %else1888
then1887:
  %t8883 = load i64, ptr @"emit.internal:%make-port"
  %t8884 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8883, i64 6, i64 0, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t8885 = call i64 @rt_root(i64 %t8884)
  store i64 %t8885, ptr @"scheme.base:%stdout-port"
  %t8886 = call i64 @rt_set_current_output(i64 0)
  br label %merge1889
else1888:
  br label %merge1889
merge1889:
  %t8887 = phi i64 [ %t8886, %then1887 ], [ 17, %else1888 ]
  %t8888 = load i64, ptr @"scheme.base:%stdout-port"
  ret i64 %t8888
else1886:
  %t8889 = call i64 @rt_car(i64 %t8877)
  %t8890 = call i64 @rt_root(i64 %t8889)
  store i64 %t8890, ptr @"scheme.base:%stdout-port"
  %t8891 = call i64 @rt_record_ref(i64 %t8889, i64 0)
  %t8892 = call i64 @rt_set_current_output(i64 %t8891)
  %t8893 = icmp ne i64 1, 1
  br i1 %t8893, label %then1890, label %else1891
then1890:
  ret i64 1
else1891:
  ret i64 17
}

define fastcc i64 @"min-entry:$scheme.base$ccode$ccurrent-output-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8894 = call i64 @rt_null_p(i64 2)
  %t8895 = icmp ne i64 %t8894, 1
  br i1 %t8895, label %then1892, label %else1893
then1892:
  %t8896 = load i64, ptr @"scheme.base:%stdout-port"
  %t8897 = call i64 @rt_not(i64 %t8896)
  %t8898 = icmp ne i64 %t8897, 1
  br i1 %t8898, label %then1894, label %else1895
then1894:
  %t8899 = load i64, ptr @"emit.internal:%make-port"
  %t8900 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8899, i64 6, i64 0, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t8901 = call i64 @rt_root(i64 %t8900)
  store i64 %t8901, ptr @"scheme.base:%stdout-port"
  %t8902 = call i64 @rt_set_current_output(i64 0)
  br label %merge1896
else1895:
  br label %merge1896
merge1896:
  %t8903 = phi i64 [ %t8902, %then1894 ], [ 17, %else1895 ]
  %t8904 = load i64, ptr @"scheme.base:%stdout-port"
  ret i64 %t8904
else1893:
  %t8905 = call i64 @rt_car(i64 2)
  %t8906 = call i64 @rt_root(i64 %t8905)
  store i64 %t8906, ptr @"scheme.base:%stdout-port"
  %t8907 = call i64 @rt_record_ref(i64 %t8905, i64 0)
  %t8908 = call i64 @rt_set_current_output(i64 %t8907)
  %t8909 = icmp ne i64 1, 1
  br i1 %t8909, label %then1897, label %else1898
then1897:
  ret i64 1
else1898:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-error-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8914 = icmp sge i64 %argc, 0
  br i1 %t8914, label %argok1900, label %arityerr1899
arityerr1899:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1900:
  %t8915 = call ptr @rt_alloc_words(i64 8)
  %t8916 = getelementptr i64, ptr %t8915, i64 0
  store i64 %a0, ptr %t8916
  %t8917 = getelementptr i64, ptr %t8915, i64 1
  store i64 %a1, ptr %t8917
  %t8918 = getelementptr i64, ptr %t8915, i64 2
  store i64 %a2, ptr %t8918
  %t8919 = getelementptr i64, ptr %t8915, i64 3
  store i64 %a3, ptr %t8919
  %t8920 = getelementptr i64, ptr %t8915, i64 4
  store i64 %a4, ptr %t8920
  %t8921 = getelementptr i64, ptr %t8915, i64 5
  store i64 %a5, ptr %t8921
  %t8922 = getelementptr i64, ptr %t8915, i64 6
  store i64 %a6, ptr %t8922
  %t8923 = getelementptr i64, ptr %t8915, i64 7
  store i64 %a7, ptr %t8923
  %t8924 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t8915, ptr %overflow)
  %t8925 = call i64 @rt_null_p(i64 %t8924)
  %t8926 = icmp ne i64 %t8925, 1
  br i1 %t8926, label %then1901, label %else1902
then1901:
  %t8927 = load i64, ptr @"scheme.base:%stderr-port"
  %t8928 = call i64 @rt_not(i64 %t8927)
  %t8929 = icmp ne i64 %t8928, 1
  br i1 %t8929, label %then1903, label %else1904
then1903:
  %t8930 = load i64, ptr @"emit.internal:%make-port"
  %t8931 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8930, i64 6, i64 8, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t8932 = call i64 @rt_root(i64 %t8931)
  store i64 %t8932, ptr @"scheme.base:%stderr-port"
  br label %merge1905
else1904:
  br label %merge1905
merge1905:
  %t8933 = phi i64 [ 17, %then1903 ], [ 17, %else1904 ]
  %t8934 = load i64, ptr @"scheme.base:%stderr-port"
  ret i64 %t8934
else1902:
  %t8935 = call i64 @rt_car(i64 %t8924)
  %t8936 = call i64 @rt_root(i64 %t8935)
  store i64 %t8936, ptr @"scheme.base:%stderr-port"
  %t8937 = icmp ne i64 1, 1
  br i1 %t8937, label %then1906, label %else1907
then1906:
  ret i64 1
else1907:
  ret i64 17
}

define fastcc i64 @"min-entry:$scheme.base$ccode$ccurrent-error-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8938 = call i64 @rt_null_p(i64 2)
  %t8939 = icmp ne i64 %t8938, 1
  br i1 %t8939, label %then1908, label %else1909
then1908:
  %t8940 = load i64, ptr @"scheme.base:%stderr-port"
  %t8941 = call i64 @rt_not(i64 %t8940)
  %t8942 = icmp ne i64 %t8941, 1
  br i1 %t8942, label %then1910, label %else1911
then1910:
  %t8943 = load i64, ptr @"emit.internal:%make-port"
  %t8944 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8943, i64 6, i64 8, i64 1, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t8945 = call i64 @rt_root(i64 %t8944)
  store i64 %t8945, ptr @"scheme.base:%stderr-port"
  br label %merge1912
else1911:
  br label %merge1912
merge1912:
  %t8946 = phi i64 [ 17, %then1910 ], [ 17, %else1911 ]
  %t8947 = load i64, ptr @"scheme.base:%stderr-port"
  ret i64 %t8947
else1909:
  %t8948 = call i64 @rt_car(i64 2)
  %t8949 = call i64 @rt_root(i64 %t8948)
  store i64 %t8949, ptr @"scheme.base:%stderr-port"
  %t8950 = icmp ne i64 1, 1
  br i1 %t8950, label %then1913, label %else1914
then1913:
  ret i64 1
else1914:
  ret i64 17
}

define fastcc i64 @"scheme.base:code:current-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8955 = icmp sge i64 %argc, 0
  br i1 %t8955, label %argok1916, label %arityerr1915
arityerr1915:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1916:
  %t8956 = call ptr @rt_alloc_words(i64 8)
  %t8957 = getelementptr i64, ptr %t8956, i64 0
  store i64 %a0, ptr %t8957
  %t8958 = getelementptr i64, ptr %t8956, i64 1
  store i64 %a1, ptr %t8958
  %t8959 = getelementptr i64, ptr %t8956, i64 2
  store i64 %a2, ptr %t8959
  %t8960 = getelementptr i64, ptr %t8956, i64 3
  store i64 %a3, ptr %t8960
  %t8961 = getelementptr i64, ptr %t8956, i64 4
  store i64 %a4, ptr %t8961
  %t8962 = getelementptr i64, ptr %t8956, i64 5
  store i64 %a5, ptr %t8962
  %t8963 = getelementptr i64, ptr %t8956, i64 6
  store i64 %a6, ptr %t8963
  %t8964 = getelementptr i64, ptr %t8956, i64 7
  store i64 %a7, ptr %t8964
  %t8965 = call i64 @rt_build_rest(i64 %argc, i64 0, i64 8, ptr %t8956, ptr %overflow)
  %t8966 = call i64 @rt_null_p(i64 %t8965)
  %t8967 = icmp ne i64 %t8966, 1
  br i1 %t8967, label %then1917, label %else1918
then1917:
  %t8968 = load i64, ptr @"scheme.base:%stdin-port"
  %t8969 = call i64 @rt_not(i64 %t8968)
  %t8970 = icmp ne i64 %t8969, 1
  br i1 %t8970, label %then1919, label %else1920
then1919:
  %t8971 = load i64, ptr @"emit.internal:%make-port"
  %t8972 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8971, i64 6, i64 1, i64 257, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t8973 = call i64 @rt_root(i64 %t8972)
  store i64 %t8973, ptr @"scheme.base:%stdin-port"
  br label %merge1921
else1920:
  br label %merge1921
merge1921:
  %t8974 = phi i64 [ 17, %then1919 ], [ 17, %else1920 ]
  %t8975 = load i64, ptr @"scheme.base:%stdin-port"
  ret i64 %t8975
else1918:
  %t8976 = call i64 @rt_car(i64 %t8965)
  %t8977 = call i64 @rt_root(i64 %t8976)
  store i64 %t8977, ptr @"scheme.base:%stdin-port"
  %t8978 = icmp ne i64 1, 1
  br i1 %t8978, label %then1922, label %else1923
then1922:
  ret i64 1
else1923:
  ret i64 17
}

define fastcc i64 @"min-entry:$scheme.base$ccode$ccurrent-input-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8979 = call i64 @rt_null_p(i64 2)
  %t8980 = icmp ne i64 %t8979, 1
  br i1 %t8980, label %then1924, label %else1925
then1924:
  %t8981 = load i64, ptr @"scheme.base:%stdin-port"
  %t8982 = call i64 @rt_not(i64 %t8981)
  %t8983 = icmp ne i64 %t8982, 1
  br i1 %t8983, label %then1926, label %else1927
then1926:
  %t8984 = load i64, ptr @"emit.internal:%make-port"
  %t8985 = call fastcc i64 @"emit.internal:code:%make-port"(i64 %t8984, i64 6, i64 1, i64 257, i64 1, i64 0, i64 1, i64 1, i64 0, i64 0, ptr null)
  %t8986 = call i64 @rt_root(i64 %t8985)
  store i64 %t8986, ptr @"scheme.base:%stdin-port"
  br label %merge1928
else1927:
  br label %merge1928
merge1928:
  %t8987 = phi i64 [ 17, %then1926 ], [ 17, %else1927 ]
  %t8988 = load i64, ptr @"scheme.base:%stdin-port"
  ret i64 %t8988
else1925:
  %t8989 = call i64 @rt_car(i64 2)
  %t8990 = call i64 @rt_root(i64 %t8989)
  store i64 %t8990, ptr @"scheme.base:%stdin-port"
  %t8991 = icmp ne i64 1, 1
  br i1 %t8991, label %then1929, label %else1930
then1929:
  ret i64 1
else1930:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_1438"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8996 = icmp eq i64 %argc, 0
  br i1 %t8996, label %argok1932, label %arityerr1931
arityerr1931:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1932:
  %t8997 = icmp ne i64 1, 1
  br i1 %t8997, label %then1933, label %else1934
then1933:
  ret i64 1
else1934:
  ret i64 17
}

define fastcc i64 @"scheme.base:code_1440"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t8998 = icmp eq i64 %argc, 0
  br i1 %t8998, label %argok1936, label %arityerr1935
arityerr1935:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1936:
  %t8999 = and i64 %self, -8
  %t9000 = inttoptr i64 %t8999 to ptr
  %t9001 = getelementptr i64, ptr %t9000, i64 2
  %t9002 = load i64, ptr %t9001
  %t9003 = and i64 %self, -8
  %t9004 = inttoptr i64 %t9003 to ptr
  %t9005 = getelementptr i64, ptr %t9004, i64 1
  %t9006 = load i64, ptr %t9005
  call void @rt_check_callable(i64 %t9006)
  %t9007 = and i64 %t9006, -8
  %t9008 = inttoptr i64 %t9007 to ptr
  %t9009 = load i64, ptr %t9008
  %t9010 = inttoptr i64 %t9009 to ptr
  %t9011 = musttail call fastcc i64 %t9010(i64 %t9006, i64 1, i64 %t9002, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t9011
}

define fastcc i64 @"scheme.base:code_1442"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t9012 = icmp eq i64 %argc, 0
  br i1 %t9012, label %argok1938, label %arityerr1937
arityerr1937:
  call void @rt_arity_error(i64 0, i64 %argc)
  unreachable
argok1938:
  %t9013 = and i64 %self, -8
  %t9014 = inttoptr i64 %t9013 to ptr
  %t9015 = getelementptr i64, ptr %t9014, i64 1
  %t9016 = load i64, ptr %t9015
  %t9017 = load i64, ptr @"scheme.base:close-port"
  call void @rt_check_callable(i64 %t9017)
  %t9018 = and i64 %t9017, -8
  %t9019 = inttoptr i64 %t9018 to ptr
  %t9020 = load i64, ptr %t9019
  %t9021 = inttoptr i64 %t9020 to ptr
  %t9022 = musttail call fastcc i64 %t9021(i64 %t9017, i64 1, i64 %t9016, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t9022
}

define fastcc i64 @"scheme.base:code:call-with-port"(i64 %self, i64 %argc, i64 %a0, i64 %a1, i64 %a2, i64 %a3, i64 %a4, i64 %a5, i64 %a6, i64 %a7, ptr %overflow) {
entry:
  %t9023 = icmp eq i64 %argc, 2
  br i1 %t9023, label %argok1940, label %arityerr1939
arityerr1939:
  call void @rt_arity_error(i64 2, i64 %argc)
  unreachable
argok1940:
  %t9024 = call ptr @rt_alloc_words(i64 1)
  %t9025 = ptrtoint ptr %t9024 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1438" to i64), ptr %t9024
  %t9026 = or i64 %t9025, 4
  %t9027 = call ptr @rt_alloc_words(i64 3)
  %t9028 = ptrtoint ptr %t9027 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1440" to i64), ptr %t9027
  %t9029 = getelementptr i64, ptr %t9027, i64 1
  store i64 %a1, ptr %t9029
  %t9030 = getelementptr i64, ptr %t9027, i64 2
  store i64 %a0, ptr %t9030
  %t9031 = or i64 %t9028, 4
  %t9032 = call ptr @rt_alloc_words(i64 2)
  %t9033 = ptrtoint ptr %t9032 to i64
  store i64 ptrtoint (ptr @"scheme.base:code_1442" to i64), ptr %t9032
  %t9034 = getelementptr i64, ptr %t9032, i64 1
  store i64 %a0, ptr %t9034
  %t9035 = or i64 %t9033, 4
  %t9036 = load i64, ptr @"scheme.base:dynamic-wind"
  call void @rt_check_callable(i64 %t9036)
  %t9037 = and i64 %t9036, -8
  %t9038 = inttoptr i64 %t9037 to ptr
  %t9039 = load i64, ptr %t9038
  %t9040 = inttoptr i64 %t9039 to ptr
  %t9041 = musttail call fastcc i64 %t9040(i64 %t9036, i64 3, i64 %t9026, i64 %t9031, i64 %t9035, i64 0, i64 0, i64 0, i64 0, i64 0, ptr null)
  ret i64 %t9041
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
  %t2825 = call ptr @rt_alloc_words(i64 1)
  %t2826 = ptrtoint ptr %t2825 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-current-continuation" to i64), ptr %t2825
  %t2827 = or i64 %t2826, 4
  %t2828 = call i64 @rt_root(i64 %t2827)
  store i64 %t2828, ptr @"scheme.base:call-with-current-continuation"
  ret i64 17
}

define i64 @"scheme.base:__init_99"() {
entry:
  %t2836 = call ptr @rt_alloc_words(i64 1)
  %t2837 = ptrtoint ptr %t2836 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call/cc" to i64), ptr %t2836
  %t2838 = or i64 %t2837, 4
  %t2839 = call i64 @rt_root(i64 %t2838)
  store i64 %t2839, ptr @"scheme.base:call/cc"
  ret i64 17
}

define i64 @"scheme.base:__init_100"() {
entry:
  %t2874 = call ptr @rt_alloc_words(i64 1)
  %t2875 = ptrtoint ptr %t2874 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-exception-handler" to i64), ptr %t2874
  %t2876 = or i64 %t2875, 4
  %t2877 = call i64 @rt_root(i64 %t2876)
  store i64 %t2877, ptr @"scheme.base:with-exception-handler"
  ret i64 17
}

define i64 @"scheme.base:__init_101"() {
entry:
  %t2896 = call ptr @rt_alloc_words(i64 1)
  %t2897 = ptrtoint ptr %t2896 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:raise" to i64), ptr %t2896
  %t2898 = or i64 %t2897, 4
  %t2899 = call i64 @rt_root(i64 %t2898)
  store i64 %t2899, ptr @"scheme.base:raise"
  ret i64 17
}

define i64 @"scheme.base:__init_102"() {
entry:
  %t2954 = call ptr @rt_alloc_words(i64 1)
  %t2955 = ptrtoint ptr %t2954 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:raise-continuable" to i64), ptr %t2954
  %t2956 = or i64 %t2955, 4
  %t2957 = call i64 @rt_root(i64 %t2956)
  store i64 %t2957, ptr @"scheme.base:raise-continuable"
  ret i64 17
}

define i64 @"scheme.base:__init_103"() {
entry:
  %t3013 = call ptr @rt_alloc_words(i64 1)
  %t3014 = ptrtoint ptr %t3013 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:features" to i64), ptr %t3013
  %t3015 = or i64 %t3014, 4
  %t3016 = call i64 @rt_root(i64 %t3015)
  store i64 %t3016, ptr @"scheme.base:features"
  ret i64 17
}

define i64 @"scheme.base:__init_104"() {
entry:
  %t3019 = call ptr @rt_alloc_words(i64 1)
  %t3020 = ptrtoint ptr %t3019 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object?" to i64), ptr %t3019
  %t3021 = or i64 %t3020, 4
  %t3022 = call i64 @rt_root(i64 %t3021)
  store i64 %t3022, ptr @"scheme.base:error-object?"
  ret i64 17
}

define i64 @"scheme.base:__init_105"() {
entry:
  %t3025 = call ptr @rt_alloc_words(i64 1)
  %t3026 = ptrtoint ptr %t3025 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-message" to i64), ptr %t3025
  %t3027 = or i64 %t3026, 4
  %t3028 = call i64 @rt_root(i64 %t3027)
  store i64 %t3028, ptr @"scheme.base:error-object-message"
  ret i64 17
}

define i64 @"scheme.base:__init_106"() {
entry:
  %t3031 = call ptr @rt_alloc_words(i64 1)
  %t3032 = ptrtoint ptr %t3031 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:error-object-irritants" to i64), ptr %t3031
  %t3033 = or i64 %t3032, 4
  %t3034 = call i64 @rt_root(i64 %t3033)
  store i64 %t3034, ptr @"scheme.base:error-object-irritants"
  ret i64 17
}

define i64 @"scheme.base:__init_107"() {
entry:
  %t3041 = call ptr @rt_alloc_words(i64 1)
  %t3042 = ptrtoint ptr %t3041 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-error?" to i64), ptr %t3041
  %t3043 = or i64 %t3042, 4
  %t3044 = call i64 @rt_root(i64 %t3043)
  store i64 %t3044, ptr @"scheme.base:read-error?"
  ret i64 17
}

define i64 @"scheme.base:__init_108"() {
entry:
  %t3051 = call ptr @rt_alloc_words(i64 1)
  %t3052 = ptrtoint ptr %t3051 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:file-error?" to i64), ptr %t3051
  %t3053 = or i64 %t3052, 4
  %t3054 = call i64 @rt_root(i64 %t3053)
  store i64 %t3054, ptr @"scheme.base:file-error?"
  ret i64 17
}

define i64 @"scheme.base:__init_109"() {
entry:
  %t3193 = call ptr @rt_alloc_words(i64 1)
  %t3194 = ptrtoint ptr %t3193 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-parameter" to i64), ptr %t3193
  %t3195 = or i64 %t3194, 4
  %t3196 = call i64 @rt_root(i64 %t3195)
  store i64 %t3196, ptr @"scheme.base:make-parameter"
  ret i64 17
}

define i64 @"scheme.base:__init_110"() {
entry:
  %t3277 = call ptr @rt_alloc_words(i64 1)
  %t3278 = ptrtoint ptr %t3277 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:with-parameters" to i64), ptr %t3277
  %t3279 = or i64 %t3278, 4
  %t3280 = call i64 @rt_root(i64 %t3279)
  store i64 %t3280, ptr @"scheme.base:with-parameters"
  ret i64 17
}

define i64 @"scheme.base:__init_111"() {
entry:
  %t3318 = call ptr @rt_alloc_words(i64 1)
  %t3319 = ptrtoint ptr %t3318 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->vector" to i64), ptr %t3318
  %t3320 = or i64 %t3319, 4
  %t3321 = call i64 @rt_root(i64 %t3320)
  store i64 %t3321, ptr @"scheme.base:list->vector"
  ret i64 17
}

define i64 @"scheme.base:__init_112"() {
entry:
  %t3345 = call ptr @rt_alloc_words(i64 1)
  %t3346 = ptrtoint ptr %t3345 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector" to i64), ptr %t3345
  %t3347 = or i64 %t3346, 4
  %t3348 = call i64 @rt_root(i64 %t3347)
  store i64 %t3348, ptr @"scheme.base:vector"
  ret i64 17
}

define i64 @"scheme.base:__init_113"() {
entry:
  %t3386 = call ptr @rt_alloc_words(i64 1)
  %t3387 = ptrtoint ptr %t3386 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list->bytevector" to i64), ptr %t3386
  %t3388 = or i64 %t3387, 4
  %t3389 = call i64 @rt_root(i64 %t3388)
  store i64 %t3389, ptr @"scheme.base:list->bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_114"() {
entry:
  %t3413 = call ptr @rt_alloc_words(i64 1)
  %t3414 = ptrtoint ptr %t3413 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector" to i64), ptr %t3413
  %t3415 = or i64 %t3414, 4
  %t3416 = call i64 @rt_root(i64 %t3415)
  store i64 %t3416, ptr @"scheme.base:bytevector"
  ret i64 17
}

define i64 @"scheme.base:__init_115"() {
entry:
  %t3421 = call ptr @rt_alloc_words(i64 1)
  %t3422 = ptrtoint ptr %t3421 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rng-start" to i64), ptr %t3421
  %t3423 = or i64 %t3422, 4
  %t3424 = call i64 @rt_root(i64 %t3423)
  store i64 %t3424, ptr @"scheme.base:rng-start"
  ret i64 17
}

define i64 @"scheme.base:__init_116"() {
entry:
  %t3434 = call ptr @rt_alloc_words(i64 1)
  %t3435 = ptrtoint ptr %t3434 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rng-end" to i64), ptr %t3434
  %t3436 = or i64 %t3435, 4
  %t3437 = call i64 @rt_root(i64 %t3436)
  store i64 %t3437, ptr @"scheme.base:rng-end"
  ret i64 17
}

define i64 @"scheme.base:__init_117"() {
entry:
  %t3499 = call ptr @rt_alloc_words(i64 1)
  %t3500 = ptrtoint ptr %t3499 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rng-check" to i64), ptr %t3499
  %t3501 = or i64 %t3500, 4
  %t3502 = call i64 @rt_root(i64 %t3501)
  store i64 %t3502, ptr @"scheme.base:rng-check"
  ret i64 17
}

define i64 @"scheme.base:__init_118"() {
entry:
  %t3518 = call ptr @rt_alloc_words(i64 1)
  %t3519 = ptrtoint ptr %t3518 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:assv" to i64), ptr %t3518
  %t3520 = or i64 %t3519, 4
  %t3521 = call i64 @rt_root(i64 %t3520)
  store i64 %t3521, ptr @"scheme.base:assv"
  ret i64 17
}

define i64 @"scheme.base:__init_119"() {
entry:
  %t3534 = call ptr @rt_alloc_words(i64 1)
  %t3535 = ptrtoint ptr %t3534 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:list-copy" to i64), ptr %t3534
  %t3536 = or i64 %t3535, 4
  %t3537 = call i64 @rt_root(i64 %t3536)
  store i64 %t3537, ptr @"scheme.base:list-copy"
  ret i64 17
}

define i64 @"scheme.base:__init_120"() {
entry:
  %t3563 = call ptr @rt_alloc_words(i64 1)
  %t3564 = ptrtoint ptr %t3563 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:boolean=?" to i64), ptr %t3563
  %t3565 = or i64 %t3564, 4
  %t3566 = call i64 @rt_root(i64 %t3565)
  store i64 %t3566, ptr @"scheme.base:boolean=?"
  ret i64 17
}

define i64 @"scheme.base:__init_121"() {
entry:
  %t3592 = call ptr @rt_alloc_words(i64 1)
  %t3593 = ptrtoint ptr %t3592 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:symbol=?" to i64), ptr %t3592
  %t3594 = or i64 %t3593, 4
  %t3595 = call i64 @rt_root(i64 %t3594)
  store i64 %t3595, ptr @"scheme.base:symbol=?"
  ret i64 17
}

define i64 @"scheme.base:__init_122"() {
entry:
  %t3610 = call ptr @rt_alloc_words(i64 1)
  %t3611 = ptrtoint ptr %t3610 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:eqv-chain?" to i64), ptr %t3610
  %t3612 = or i64 %t3611, 4
  %t3613 = call i64 @rt_root(i64 %t3612)
  store i64 %t3613, ptr @"scheme.base:eqv-chain?"
  ret i64 17
}

define i64 @"scheme.base:__init_123"() {
entry:
  %t3713 = call ptr @rt_alloc_words(i64 1)
  %t3714 = ptrtoint ptr %t3713 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-cmp" to i64), ptr %t3713
  %t3715 = or i64 %t3714, 4
  %t3716 = call i64 @rt_root(i64 %t3715)
  store i64 %t3716, ptr @"scheme.base:str-cmp"
  ret i64 17
}

define i64 @"scheme.base:__init_124"() {
entry:
  %t3735 = call ptr @rt_alloc_words(i64 1)
  %t3736 = ptrtoint ptr %t3735 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-chain?" to i64), ptr %t3735
  %t3737 = or i64 %t3736, 4
  %t3738 = call i64 @rt_root(i64 %t3737)
  store i64 %t3738, ptr @"scheme.base:str-chain?"
  ret i64 17
}

define i64 @"scheme.base:__init_125"() {
entry:
  %t3784 = call ptr @rt_alloc_words(i64 1)
  %t3785 = ptrtoint ptr %t3784 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string<?" to i64), ptr %t3784
  %t3786 = or i64 %t3785, 4
  %t3787 = call i64 @rt_root(i64 %t3786)
  store i64 %t3787, ptr @"scheme.base:string<?"
  ret i64 17
}

define i64 @"scheme.base:__init_126"() {
entry:
  %t3833 = call ptr @rt_alloc_words(i64 1)
  %t3834 = ptrtoint ptr %t3833 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string>?" to i64), ptr %t3833
  %t3835 = or i64 %t3834, 4
  %t3836 = call i64 @rt_root(i64 %t3835)
  store i64 %t3836, ptr @"scheme.base:string>?"
  ret i64 17
}

define i64 @"scheme.base:__init_127"() {
entry:
  %t3883 = call ptr @rt_alloc_words(i64 1)
  %t3884 = ptrtoint ptr %t3883 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string<=?" to i64), ptr %t3883
  %t3885 = or i64 %t3884, 4
  %t3886 = call i64 @rt_root(i64 %t3885)
  store i64 %t3886, ptr @"scheme.base:string<=?"
  ret i64 17
}

define i64 @"scheme.base:__init_128"() {
entry:
  %t3933 = call ptr @rt_alloc_words(i64 1)
  %t3934 = ptrtoint ptr %t3933 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string>=?" to i64), ptr %t3933
  %t3935 = or i64 %t3934, 4
  %t3936 = call i64 @rt_root(i64 %t3935)
  store i64 %t3936, ptr @"scheme.base:string>=?"
  ret i64 17
}

define i64 @"scheme.base:__init_129"() {
entry:
  %t4046 = call ptr @rt_alloc_words(i64 1)
  %t4047 = ptrtoint ptr %t4046 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector->list" to i64), ptr %t4046
  %t4048 = or i64 %t4047, 4
  %t4049 = call i64 @rt_root(i64 %t4048)
  store i64 %t4049, ptr @"scheme.base:vector->list"
  ret i64 17
}

define i64 @"scheme.base:__init_130"() {
entry:
  %t4185 = call ptr @rt_alloc_words(i64 1)
  %t4186 = ptrtoint ptr %t4185 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-copy" to i64), ptr %t4185
  %t4187 = or i64 %t4186, 4
  %t4188 = call i64 @rt_root(i64 %t4187)
  store i64 %t4188, ptr @"scheme.base:vector-copy"
  ret i64 17
}

define i64 @"scheme.base:__init_131"() {
entry:
  %t4324 = call ptr @rt_alloc_words(i64 1)
  %t4325 = ptrtoint ptr %t4324 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-append" to i64), ptr %t4324
  %t4326 = or i64 %t4325, 4
  %t4327 = call i64 @rt_root(i64 %t4326)
  store i64 %t4327, ptr @"scheme.base:vector-append"
  ret i64 17
}

define i64 @"scheme.base:__init_132"() {
entry:
  %t4348 = call ptr @rt_alloc_words(i64 1)
  %t4349 = ptrtoint ptr %t4348 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vec-total" to i64), ptr %t4348
  %t4350 = or i64 %t4349, 4
  %t4351 = call i64 @rt_root(i64 %t4350)
  store i64 %t4351, ptr @"scheme.base:vec-total"
  ret i64 17
}

define i64 @"scheme.base:__init_133"() {
entry:
  %t4456 = call ptr @rt_alloc_words(i64 1)
  %t4457 = ptrtoint ptr %t4456 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-fill!" to i64), ptr %t4456
  %t4458 = or i64 %t4457, 4
  %t4459 = call i64 @rt_root(i64 %t4458)
  store i64 %t4459, ptr @"scheme.base:vector-fill!"
  ret i64 17
}

define i64 @"scheme.base:__init_134"() {
entry:
  %t4777 = call ptr @rt_alloc_words(i64 1)
  %t4778 = ptrtoint ptr %t4777 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-copy!" to i64), ptr %t4777
  %t4779 = or i64 %t4778, 4
  %t4780 = call i64 @rt_root(i64 %t4779)
  store i64 %t4780, ptr @"scheme.base:vector-copy!"
  ret i64 17
}

define i64 @"scheme.base:__init_135"() {
entry:
  %t4969 = call ptr @rt_alloc_words(i64 1)
  %t4970 = ptrtoint ptr %t4969 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-map" to i64), ptr %t4969
  %t4971 = or i64 %t4970, 4
  %t4972 = call i64 @rt_root(i64 %t4971)
  store i64 %t4972, ptr @"scheme.base:vector-map"
  ret i64 17
}

define i64 @"scheme.base:__init_136"() {
entry:
  %t5147 = call ptr @rt_alloc_words(i64 1)
  %t5148 = ptrtoint ptr %t5147 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector-for-each" to i64), ptr %t5147
  %t5149 = or i64 %t5148, 4
  %t5150 = call i64 @rt_root(i64 %t5149)
  store i64 %t5150, ptr @"scheme.base:vector-for-each"
  ret i64 17
}

define i64 @"scheme.base:__init_137"() {
entry:
  %t5174 = call ptr @rt_alloc_words(i64 1)
  %t5175 = ptrtoint ptr %t5174 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vec-min-len" to i64), ptr %t5174
  %t5176 = or i64 %t5175, 4
  %t5177 = call i64 @rt_root(i64 %t5176)
  store i64 %t5177, ptr @"scheme.base:vec-min-len"
  ret i64 17
}

define i64 @"scheme.base:__init_138"() {
entry:
  %t5191 = call ptr @rt_alloc_words(i64 1)
  %t5192 = ptrtoint ptr %t5191 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vec-nth" to i64), ptr %t5191
  %t5193 = or i64 %t5192, 4
  %t5194 = call i64 @rt_root(i64 %t5193)
  store i64 %t5194, ptr @"scheme.base:vec-nth"
  ret i64 17
}

define i64 @"scheme.base:__init_139"() {
entry:
  %t5330 = call ptr @rt_alloc_words(i64 1)
  %t5331 = ptrtoint ptr %t5330 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string->vector" to i64), ptr %t5330
  %t5332 = or i64 %t5331, 4
  %t5333 = call i64 @rt_root(i64 %t5332)
  store i64 %t5333, ptr @"scheme.base:string->vector"
  ret i64 17
}

define i64 @"scheme.base:__init_140"() {
entry:
  %t5399 = call ptr @rt_alloc_words(i64 1)
  %t5400 = ptrtoint ptr %t5399 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:vector->string" to i64), ptr %t5399
  %t5401 = or i64 %t5400, 4
  %t5402 = call i64 @rt_root(i64 %t5401)
  store i64 %t5402, ptr @"scheme.base:vector->string"
  ret i64 17
}

define i64 @"scheme.base:__init_141"() {
entry:
  %t5460 = call ptr @rt_alloc_words(i64 1)
  %t5461 = ptrtoint ptr %t5460 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-map" to i64), ptr %t5460
  %t5462 = or i64 %t5461, 4
  %t5463 = call i64 @rt_root(i64 %t5462)
  store i64 %t5463, ptr @"scheme.base:string-map"
  ret i64 17
}

define i64 @"scheme.base:__init_142"() {
entry:
  %t5481 = call ptr @rt_alloc_words(i64 1)
  %t5482 = ptrtoint ptr %t5481 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-map1" to i64), ptr %t5481
  %t5483 = or i64 %t5482, 4
  %t5484 = call i64 @rt_root(i64 %t5483)
  store i64 %t5484, ptr @"scheme.base:str-map1"
  ret i64 17
}

define i64 @"scheme.base:__init_143"() {
entry:
  %t5564 = call ptr @rt_alloc_words(i64 1)
  %t5565 = ptrtoint ptr %t5564 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-mapn" to i64), ptr %t5564
  %t5566 = or i64 %t5565, 4
  %t5567 = call i64 @rt_root(i64 %t5566)
  store i64 %t5567, ptr @"scheme.base:str-mapn"
  ret i64 17
}

define i64 @"scheme.base:__init_144"() {
entry:
  %t5742 = call ptr @rt_alloc_words(i64 1)
  %t5743 = ptrtoint ptr %t5742 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-for-each" to i64), ptr %t5742
  %t5744 = or i64 %t5743, 4
  %t5745 = call i64 @rt_root(i64 %t5744)
  store i64 %t5745, ptr @"scheme.base:string-for-each"
  ret i64 17
}

define i64 @"scheme.base:__init_145"() {
entry:
  %t5769 = call ptr @rt_alloc_words(i64 1)
  %t5770 = ptrtoint ptr %t5769 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-min-len" to i64), ptr %t5769
  %t5771 = or i64 %t5770, 4
  %t5772 = call i64 @rt_root(i64 %t5771)
  store i64 %t5772, ptr @"scheme.base:str-min-len"
  ret i64 17
}

define i64 @"scheme.base:__init_146"() {
entry:
  %t5786 = call ptr @rt_alloc_words(i64 1)
  %t5787 = ptrtoint ptr %t5786 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:str-nth" to i64), ptr %t5786
  %t5788 = or i64 %t5787, 4
  %t5789 = call i64 @rt_root(i64 %t5788)
  store i64 %t5789, ptr @"scheme.base:str-nth"
  ret i64 17
}

define i64 @"scheme.base:__init_147"() {
entry:
  %t5894 = call ptr @rt_alloc_words(i64 1)
  %t5895 = ptrtoint ptr %t5894 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-fill!" to i64), ptr %t5894
  %t5896 = or i64 %t5895, 4
  %t5897 = call i64 @rt_root(i64 %t5896)
  store i64 %t5897, ptr @"scheme.base:string-fill!"
  ret i64 17
}

define i64 @"scheme.base:__init_148"() {
entry:
  %t6215 = call ptr @rt_alloc_words(i64 1)
  %t6216 = ptrtoint ptr %t6215 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:string-copy!" to i64), ptr %t6215
  %t6217 = or i64 %t6216, 4
  %t6218 = call i64 @rt_root(i64 %t6217)
  store i64 %t6218, ptr @"scheme.base:string-copy!"
  ret i64 17
}

define i64 @"scheme.base:__init_149"() {
entry:
  %t6354 = call ptr @rt_alloc_words(i64 1)
  %t6355 = ptrtoint ptr %t6354 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector-copy" to i64), ptr %t6354
  %t6356 = or i64 %t6355, 4
  %t6357 = call i64 @rt_root(i64 %t6356)
  store i64 %t6357, ptr @"scheme.base:bytevector-copy"
  ret i64 17
}

define i64 @"scheme.base:__init_150"() {
entry:
  %t6675 = call ptr @rt_alloc_words(i64 1)
  %t6676 = ptrtoint ptr %t6675 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector-copy!" to i64), ptr %t6675
  %t6677 = or i64 %t6676, 4
  %t6678 = call i64 @rt_root(i64 %t6677)
  store i64 %t6678, ptr @"scheme.base:bytevector-copy!"
  ret i64 17
}

define i64 @"scheme.base:__init_151"() {
entry:
  %t6814 = call ptr @rt_alloc_words(i64 1)
  %t6815 = ptrtoint ptr %t6814 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bytevector-append" to i64), ptr %t6814
  %t6816 = or i64 %t6815, 4
  %t6817 = call i64 @rt_root(i64 %t6816)
  store i64 %t6817, ptr @"scheme.base:bytevector-append"
  ret i64 17
}

define i64 @"scheme.base:__init_152"() {
entry:
  %t6838 = call ptr @rt_alloc_words(i64 1)
  %t6839 = ptrtoint ptr %t6838 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:bv-total" to i64), ptr %t6838
  %t6840 = or i64 %t6839, 4
  %t6841 = call i64 @rt_root(i64 %t6840)
  store i64 %t6841, ptr @"scheme.base:bv-total"
  ret i64 17
}

define i64 @"scheme.base:__init_153"() {
entry:
  %t6842 = call i64 @rt_root(i64 8000000)
  store i64 %t6842, ptr @"scheme.base:rat-max-denom"
  ret i64 17
}

define i64 @"scheme.base:__init_154"() {
entry:
  %t6891 = call ptr @rt_alloc_words(i64 1)
  %t6892 = ptrtoint ptr %t6891 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rationalize" to i64), ptr %t6891
  %t6893 = or i64 %t6892, 4
  %t6894 = call i64 @rt_root(i64 %t6893)
  store i64 %t6894, ptr @"scheme.base:rationalize"
  ret i64 17
}

define i64 @"scheme.base:__init_155"() {
entry:
  %t7011 = call ptr @rt_alloc_words(i64 1)
  %t7012 = ptrtoint ptr %t7011 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-exact" to i64), ptr %t7011
  %t7013 = or i64 %t7012, 4
  %t7014 = call i64 @rt_root(i64 %t7013)
  store i64 %t7014, ptr @"scheme.base:rat-exact"
  ret i64 17
}

define i64 @"scheme.base:__init_156"() {
entry:
  %t7016 = call ptr @rt_alloc_words(i64 1)
  %t7017 = ptrtoint ptr %t7016 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-ceil" to i64), ptr %t7016
  %t7018 = or i64 %t7017, 4
  %t7019 = call i64 @rt_root(i64 %t7018)
  store i64 %t7019, ptr @"scheme.base:rat-ceil"
  ret i64 17
}

define i64 @"scheme.base:__init_157"() {
entry:
  %t7021 = call ptr @rt_alloc_words(i64 1)
  %t7022 = ptrtoint ptr %t7021 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-floor" to i64), ptr %t7021
  %t7023 = or i64 %t7022, 4
  %t7024 = call i64 @rt_root(i64 %t7023)
  store i64 %t7024, ptr @"scheme.base:rat-floor"
  ret i64 17
}

define i64 @"scheme.base:__init_158"() {
entry:
  %t7141 = call ptr @rt_alloc_words(i64 1)
  %t7142 = ptrtoint ptr %t7141 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-inexact" to i64), ptr %t7141
  %t7143 = or i64 %t7142, 4
  %t7144 = call i64 @rt_root(i64 %t7143)
  store i64 %t7144, ptr @"scheme.base:rat-inexact"
  ret i64 17
}

define i64 @"scheme.base:__init_159"() {
entry:
  %t7170 = call ptr @rt_alloc_words(i64 1)
  %t7171 = ptrtoint ptr %t7170 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-num-in" to i64), ptr %t7170
  %t7172 = or i64 %t7171, 4
  %t7173 = call i64 @rt_root(i64 %t7172)
  store i64 %t7173, ptr @"scheme.base:rat-num-in"
  ret i64 17
}

define i64 @"scheme.base:__init_160"() {
entry:
  %t7199 = call ptr @rt_alloc_words(i64 1)
  %t7200 = ptrtoint ptr %t7199 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rat-ceil-flo" to i64), ptr %t7199
  %t7201 = or i64 %t7200, 4
  %t7202 = call i64 @rt_root(i64 %t7201)
  store i64 %t7202, ptr @"scheme.base:rat-ceil-flo"
  ret i64 17
}

define i64 @"scheme.base:__init_161"() {
entry:
  %t7230 = call ptr @rt_alloc_words(i64 1)
  %t7231 = ptrtoint ptr %t7230 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:values" to i64), ptr %t7230
  %t7232 = or i64 %t7231, 4
  %t7233 = call i64 @rt_root(i64 %t7232)
  store i64 %t7233, ptr @"scheme.base:values"
  ret i64 17
}

define i64 @"scheme.base:__init_162"() {
entry:
  %t7275 = call ptr @rt_alloc_words(i64 1)
  %t7276 = ptrtoint ptr %t7275 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-values" to i64), ptr %t7275
  %t7277 = or i64 %t7276, 4
  %t7278 = call i64 @rt_root(i64 %t7277)
  store i64 %t7278, ptr @"scheme.base:call-with-values"
  ret i64 17
}

define i64 @"scheme.base:__init_163"() {
entry:
  %t7279 = call i64 @rt_root(i64 64)
  store i64 %t7279, ptr @"scheme.base:%ht-initial-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_164"() {
entry:
  %t7280 = call i64 @rt_root(i64 24)
  store i64 %t7280, ptr @"scheme.base:%ht-load-factor"
  ret i64 17
}

define i64 @"scheme.base:__init_165"() {
entry:
  %t7291 = call ptr @rt_alloc_words(i64 1)
  %t7292 = ptrtoint ptr %t7291 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-hash-table" to i64), ptr %t7291
  %t7293 = or i64 %t7292, 4
  %t7294 = call i64 @rt_root(i64 %t7293)
  store i64 %t7294, ptr @"scheme.base:make-hash-table"
  ret i64 17
}

define i64 @"scheme.base:__init_166"() {
entry:
  %t7305 = call ptr @rt_alloc_words(i64 1)
  %t7306 = ptrtoint ptr %t7305 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:make-eq-hash-table" to i64), ptr %t7305
  %t7307 = or i64 %t7306, 4
  %t7308 = call i64 @rt_root(i64 %t7307)
  store i64 %t7308, ptr @"scheme.base:make-eq-hash-table"
  ret i64 17
}

define i64 @"scheme.base:__init_167"() {
entry:
  %t7311 = call ptr @rt_alloc_words(i64 1)
  %t7312 = ptrtoint ptr %t7311 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table?" to i64), ptr %t7311
  %t7313 = or i64 %t7312, 4
  %t7314 = call i64 @rt_root(i64 %t7313)
  store i64 %t7314, ptr @"scheme.base:hash-table?"
  ret i64 17
}

define i64 @"scheme.base:__init_168"() {
entry:
  %t7318 = call ptr @rt_alloc_words(i64 1)
  %t7319 = ptrtoint ptr %t7318 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-count" to i64), ptr %t7318
  %t7320 = or i64 %t7319, 4
  %t7321 = call i64 @rt_root(i64 %t7320)
  store i64 %t7321, ptr @"scheme.base:%ht-count"
  ret i64 17
}

define i64 @"scheme.base:__init_169"() {
entry:
  %t7325 = call ptr @rt_alloc_words(i64 1)
  %t7326 = ptrtoint ptr %t7325 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-buckets" to i64), ptr %t7325
  %t7327 = or i64 %t7326, 4
  %t7328 = call i64 @rt_root(i64 %t7327)
  store i64 %t7328, ptr @"scheme.base:%ht-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_170"() {
entry:
  %t7332 = call ptr @rt_alloc_words(i64 1)
  %t7333 = ptrtoint ptr %t7332 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-identity?" to i64), ptr %t7332
  %t7334 = or i64 %t7333, 4
  %t7335 = call i64 @rt_root(i64 %t7334)
  store i64 %t7335, ptr @"scheme.base:%ht-identity?"
  ret i64 17
}

define i64 @"scheme.base:__init_171"() {
entry:
  %t7339 = call ptr @rt_alloc_words(i64 1)
  %t7340 = ptrtoint ptr %t7339 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-count!" to i64), ptr %t7339
  %t7341 = or i64 %t7340, 4
  %t7342 = call i64 @rt_root(i64 %t7341)
  store i64 %t7342, ptr @"scheme.base:%ht-set-count!"
  ret i64 17
}

define i64 @"scheme.base:__init_172"() {
entry:
  %t7346 = call ptr @rt_alloc_words(i64 1)
  %t7347 = ptrtoint ptr %t7346 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-set-buckets!" to i64), ptr %t7346
  %t7348 = or i64 %t7347, 4
  %t7349 = call i64 @rt_root(i64 %t7348)
  store i64 %t7349, ptr @"scheme.base:%ht-set-buckets!"
  ret i64 17
}

define i64 @"scheme.base:__init_173"() {
entry:
  %t7360 = call ptr @rt_alloc_words(i64 1)
  %t7361 = ptrtoint ptr %t7360 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-hash" to i64), ptr %t7360
  %t7362 = or i64 %t7361, 4
  %t7363 = call i64 @rt_root(i64 %t7362)
  store i64 %t7363, ptr @"scheme.base:%ht-hash"
  ret i64 17
}

define i64 @"scheme.base:__init_174"() {
entry:
  %t7374 = call ptr @rt_alloc_words(i64 1)
  %t7375 = ptrtoint ptr %t7374 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-key=?" to i64), ptr %t7374
  %t7376 = or i64 %t7375, 4
  %t7377 = call i64 @rt_root(i64 %t7376)
  store i64 %t7377, ptr @"scheme.base:%ht-key=?"
  ret i64 17
}

define i64 @"scheme.base:__init_175"() {
entry:
  %t7386 = call ptr @rt_alloc_words(i64 1)
  %t7387 = ptrtoint ptr %t7386 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-index" to i64), ptr %t7386
  %t7388 = or i64 %t7387, 4
  %t7389 = call i64 @rt_root(i64 %t7388)
  store i64 %t7389, ptr @"scheme.base:%ht-index"
  ret i64 17
}

define i64 @"scheme.base:__init_176"() {
entry:
  %t7410 = call ptr @rt_alloc_words(i64 1)
  %t7411 = ptrtoint ptr %t7410 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-assoc" to i64), ptr %t7410
  %t7412 = or i64 %t7411, 4
  %t7413 = call i64 @rt_root(i64 %t7412)
  store i64 %t7413, ptr @"scheme.base:%ht-assoc"
  ret i64 17
}

define i64 @"scheme.base:__init_177"() {
entry:
  %t7436 = call ptr @rt_alloc_words(i64 1)
  %t7437 = ptrtoint ptr %t7436 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-remove" to i64), ptr %t7436
  %t7438 = or i64 %t7437, 4
  %t7439 = call i64 @rt_root(i64 %t7438)
  store i64 %t7439, ptr @"scheme.base:%ht-remove"
  ret i64 17
}

define i64 @"scheme.base:__init_178"() {
entry:
  %t7463 = call ptr @rt_alloc_words(i64 1)
  %t7464 = ptrtoint ptr %t7463 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref/default" to i64), ptr %t7463
  %t7465 = or i64 %t7464, 4
  %t7466 = call i64 @rt_root(i64 %t7465)
  store i64 %t7466, ptr @"scheme.base:hash-table-ref/default"
  ret i64 17
}

define i64 @"scheme.base:__init_179"() {
entry:
  %t7489 = call ptr @rt_alloc_words(i64 1)
  %t7490 = ptrtoint ptr %t7489 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-contains?" to i64), ptr %t7489
  %t7491 = or i64 %t7490, 4
  %t7492 = call i64 @rt_root(i64 %t7491)
  store i64 %t7492, ptr @"scheme.base:hash-table-contains?"
  ret i64 17
}

define i64 @"scheme.base:__init_180"() {
entry:
  %t7523 = call ptr @rt_alloc_words(i64 1)
  %t7524 = ptrtoint ptr %t7523 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-ref" to i64), ptr %t7523
  %t7525 = or i64 %t7524, 4
  %t7526 = call i64 @rt_root(i64 %t7525)
  store i64 %t7526, ptr @"scheme.base:hash-table-ref"
  ret i64 17
}

define i64 @"scheme.base:__init_181"() {
entry:
  %t7610 = call ptr @rt_alloc_words(i64 1)
  %t7611 = ptrtoint ptr %t7610 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-set!" to i64), ptr %t7610
  %t7612 = or i64 %t7611, 4
  %t7613 = call i64 @rt_root(i64 %t7612)
  store i64 %t7613, ptr @"scheme.base:hash-table-set!"
  ret i64 17
}

define i64 @"scheme.base:__init_182"() {
entry:
  %t7663 = call ptr @rt_alloc_words(i64 1)
  %t7664 = ptrtoint ptr %t7663 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-delete!" to i64), ptr %t7663
  %t7665 = or i64 %t7664, 4
  %t7666 = call i64 @rt_root(i64 %t7665)
  store i64 %t7666, ptr @"scheme.base:hash-table-delete!"
  ret i64 17
}

define i64 @"scheme.base:__init_183"() {
entry:
  %t7780 = call ptr @rt_alloc_words(i64 1)
  %t7781 = ptrtoint ptr %t7780 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-grow!" to i64), ptr %t7780
  %t7782 = or i64 %t7781, 4
  %t7783 = call i64 @rt_root(i64 %t7782)
  store i64 %t7783, ptr @"scheme.base:%ht-grow!"
  ret i64 17
}

define i64 @"scheme.base:__init_184"() {
entry:
  %t7791 = call ptr @rt_alloc_words(i64 1)
  %t7792 = ptrtoint ptr %t7791 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-size" to i64), ptr %t7791
  %t7793 = or i64 %t7792, 4
  %t7794 = call i64 @rt_root(i64 %t7793)
  store i64 %t7794, ptr @"scheme.base:hash-table-size"
  ret i64 17
}

define i64 @"scheme.base:__init_185"() {
entry:
  %t7811 = call ptr @rt_alloc_words(i64 1)
  %t7812 = ptrtoint ptr %t7811 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%ht-fold-buckets" to i64), ptr %t7811
  %t7813 = or i64 %t7812, 4
  %t7814 = call i64 @rt_root(i64 %t7813)
  store i64 %t7814, ptr @"scheme.base:%ht-fold-buckets"
  ret i64 17
}

define i64 @"scheme.base:__init_186"() {
entry:
  %t7862 = call ptr @rt_alloc_words(i64 1)
  %t7863 = ptrtoint ptr %t7862 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table->alist" to i64), ptr %t7862
  %t7864 = or i64 %t7863, 4
  %t7865 = call i64 @rt_root(i64 %t7864)
  store i64 %t7865, ptr @"scheme.base:hash-table->alist"
  ret i64 17
}

define i64 @"scheme.base:__init_187"() {
entry:
  %t7884 = call ptr @rt_alloc_words(i64 1)
  %t7885 = ptrtoint ptr %t7884 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-keys" to i64), ptr %t7884
  %t7886 = or i64 %t7885, 4
  %t7887 = call i64 @rt_root(i64 %t7886)
  store i64 %t7887, ptr @"scheme.base:hash-table-keys"
  ret i64 17
}

define i64 @"scheme.base:__init_188"() {
entry:
  %t7906 = call ptr @rt_alloc_words(i64 1)
  %t7907 = ptrtoint ptr %t7906 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:hash-table-values" to i64), ptr %t7906
  %t7908 = or i64 %t7907, 4
  %t7909 = call i64 @rt_root(i64 %t7908)
  store i64 %t7909, ptr @"scheme.base:hash-table-values"
  ret i64 17
}

define i64 @"scheme.base:__init_189"() {
entry:
  %t8156 = call ptr @rt_alloc_words(i64 1)
  %t8157 = ptrtoint ptr %t8156 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-report" to i64), ptr %t8156
  %t8158 = or i64 %t8157, 4
  %t8159 = call i64 @rt_root(i64 %t8158)
  store i64 %t8159, ptr @"scheme.base:rd-report"
  ret i64 17
}

define i64 @"scheme.base:__init_190"() {
entry:
  %t8181 = call ptr @rt_alloc_words(i64 1)
  %t8182 = ptrtoint ptr %t8181 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-from-string" to i64), ptr %t8181
  %t8183 = or i64 %t8182, 4
  %t8184 = call i64 @rt_root(i64 %t8183)
  store i64 %t8184, ptr @"scheme.base:read-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_191"() {
entry:
  %t8192 = call ptr @rt_alloc_words(i64 1)
  %t8193 = ptrtoint ptr %t8192 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-all-from-string" to i64), ptr %t8192
  %t8194 = or i64 %t8193, 4
  %t8195 = call i64 @rt_root(i64 %t8194)
  store i64 %t8195, ptr @"scheme.base:read-all-from-string"
  ret i64 17
}

define i64 @"scheme.base:__init_192"() {
entry:
  %t8203 = call ptr @rt_alloc_words(i64 1)
  %t8204 = ptrtoint ptr %t8203 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-all-from-string-ci" to i64), ptr %t8203
  %t8205 = or i64 %t8204, 4
  %t8206 = call i64 @rt_root(i64 %t8205)
  store i64 %t8206, ptr @"scheme.base:read-all-from-string-ci"
  ret i64 17
}

define i64 @"scheme.base:__init_193"() {
entry:
  %t8313 = call ptr @rt_alloc_words(i64 1)
  %t8314 = ptrtoint ptr %t8313 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:rd-all" to i64), ptr %t8313
  %t8315 = or i64 %t8314, 4
  %t8316 = call i64 @rt_root(i64 %t8315)
  store i64 %t8316, ptr @"scheme.base:rd-all"
  ret i64 17
}

define i64 @"scheme.base:__init_194"() {
entry:
  %t8321 = call ptr @rt_alloc_words(i64 1)
  %t8322 = ptrtoint ptr %t8321 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port?" to i64), ptr %t8321
  %t8323 = or i64 %t8322, 4
  %t8324 = call i64 @rt_root(i64 %t8323)
  store i64 %t8324, ptr @"scheme.base:port?"
  ret i64 17
}

define i64 @"scheme.base:__init_195"() {
entry:
  %t8334 = call ptr @rt_alloc_words(i64 1)
  %t8335 = ptrtoint ptr %t8334 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port?" to i64), ptr %t8334
  %t8336 = or i64 %t8335, 4
  %t8337 = call i64 @rt_root(i64 %t8336)
  store i64 %t8337, ptr @"scheme.base:input-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_196"() {
entry:
  %t8348 = call ptr @rt_alloc_words(i64 1)
  %t8349 = ptrtoint ptr %t8348 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port?" to i64), ptr %t8348
  %t8350 = or i64 %t8349, 4
  %t8351 = call i64 @rt_root(i64 %t8350)
  store i64 %t8351, ptr @"scheme.base:output-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_197"() {
entry:
  %t8359 = call ptr @rt_alloc_words(i64 1)
  %t8360 = ptrtoint ptr %t8359 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:textual-port?" to i64), ptr %t8359
  %t8361 = or i64 %t8360, 4
  %t8362 = call i64 @rt_root(i64 %t8361)
  store i64 %t8362, ptr @"scheme.base:textual-port?"
  ret i64 17
}

define i64 @"scheme.base:__init_198"() {
entry:
  %t8365 = call ptr @rt_alloc_words(i64 1)
  %t8366 = ptrtoint ptr %t8365 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:port-closed?" to i64), ptr %t8365
  %t8367 = or i64 %t8366, 4
  %t8368 = call i64 @rt_root(i64 %t8367)
  store i64 %t8368, ptr @"scheme.base:port-closed?"
  ret i64 17
}

define i64 @"scheme.base:__init_199"() {
entry:
  %t8379 = call ptr @rt_alloc_words(i64 1)
  %t8380 = ptrtoint ptr %t8379 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:input-port-open?" to i64), ptr %t8379
  %t8381 = or i64 %t8380, 4
  %t8382 = call i64 @rt_root(i64 %t8381)
  store i64 %t8382, ptr @"scheme.base:input-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_200"() {
entry:
  %t8393 = call ptr @rt_alloc_words(i64 1)
  %t8394 = ptrtoint ptr %t8393 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:output-port-open?" to i64), ptr %t8393
  %t8395 = or i64 %t8394, 4
  %t8396 = call i64 @rt_root(i64 %t8395)
  store i64 %t8396, ptr @"scheme.base:output-port-open?"
  ret i64 17
}

define i64 @"scheme.base:__init_201"() {
entry:
  %t8422 = call ptr @rt_alloc_words(i64 1)
  %t8423 = ptrtoint ptr %t8422 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-input-port" to i64), ptr %t8422
  %t8424 = or i64 %t8423, 4
  %t8425 = call i64 @rt_root(i64 %t8424)
  store i64 %t8425, ptr @"scheme.base:%check-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_202"() {
entry:
  %t8451 = call ptr @rt_alloc_words(i64 1)
  %t8452 = ptrtoint ptr %t8451 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%check-output-port" to i64), ptr %t8451
  %t8453 = or i64 %t8452, 4
  %t8454 = call i64 @rt_root(i64 %t8453)
  store i64 %t8454, ptr @"scheme.base:%check-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_203"() {
entry:
  %t8458 = call ptr @rt_alloc_words(i64 1)
  %t8459 = ptrtoint ptr %t8458 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-input-string" to i64), ptr %t8458
  %t8460 = or i64 %t8459, 4
  %t8461 = call i64 @rt_root(i64 %t8460)
  store i64 %t8461, ptr @"scheme.base:open-input-string"
  ret i64 17
}

define i64 @"scheme.base:__init_204"() {
entry:
  %t8482 = call ptr @rt_alloc_words(i64 1)
  %t8483 = ptrtoint ptr %t8482 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:%port-at-eof?" to i64), ptr %t8482
  %t8484 = or i64 %t8483, 4
  %t8485 = call i64 @rt_root(i64 %t8484)
  store i64 %t8485, ptr @"scheme.base:%port-at-eof?"
  ret i64 17
}

define i64 @"scheme.base:__init_205"() {
entry:
  %t8515 = call ptr @rt_alloc_words(i64 1)
  %t8516 = ptrtoint ptr %t8515 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-char" to i64), ptr %t8515
  %t8517 = or i64 %t8516, 4
  %t8518 = call i64 @rt_root(i64 %t8517)
  store i64 %t8518, ptr @"scheme.base:read-char"
  ret i64 17
}

define i64 @"scheme.base:__init_206"() {
entry:
  %t8539 = call ptr @rt_alloc_words(i64 1)
  %t8540 = ptrtoint ptr %t8539 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:peek-char" to i64), ptr %t8539
  %t8541 = or i64 %t8540, 4
  %t8542 = call i64 @rt_root(i64 %t8541)
  store i64 %t8542, ptr @"scheme.base:peek-char"
  ret i64 17
}

define i64 @"scheme.base:__init_207"() {
entry:
  %t8660 = call ptr @rt_alloc_words(i64 1)
  %t8661 = ptrtoint ptr %t8660 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-line" to i64), ptr %t8660
  %t8662 = or i64 %t8661, 4
  %t8663 = call i64 @rt_root(i64 %t8662)
  store i64 %t8663, ptr @"scheme.base:read-line"
  ret i64 17
}

define i64 @"scheme.base:__init_208"() {
entry:
  %t8711 = call ptr @rt_alloc_words(i64 1)
  %t8712 = ptrtoint ptr %t8711 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:read-string" to i64), ptr %t8711
  %t8713 = or i64 %t8712, 4
  %t8714 = call i64 @rt_root(i64 %t8713)
  store i64 %t8714, ptr @"scheme.base:read-string"
  ret i64 17
}

define i64 @"scheme.base:__init_209"() {
entry:
  %t8728 = call ptr @rt_alloc_words(i64 1)
  %t8729 = ptrtoint ptr %t8728 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:open-output-string" to i64), ptr %t8728
  %t8730 = or i64 %t8729, 4
  %t8731 = call i64 @rt_root(i64 %t8730)
  store i64 %t8731, ptr @"scheme.base:open-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_210"() {
entry:
  %t8762 = call ptr @rt_alloc_words(i64 1)
  %t8763 = ptrtoint ptr %t8762 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:get-output-string" to i64), ptr %t8762
  %t8764 = or i64 %t8763, 4
  %t8765 = call i64 @rt_root(i64 %t8764)
  store i64 %t8765, ptr @"scheme.base:get-output-string"
  ret i64 17
}

define i64 @"scheme.base:__init_211"() {
entry:
  %t8776 = call ptr @rt_alloc_words(i64 1)
  %t8777 = ptrtoint ptr %t8776 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:flush-output-port" to i64), ptr %t8776
  %t8778 = or i64 %t8777, 4
  %t8779 = call i64 @rt_root(i64 %t8778)
  store i64 %t8779, ptr @"scheme.base:flush-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_212"() {
entry:
  %t8808 = call ptr @rt_alloc_words(i64 1)
  %t8809 = ptrtoint ptr %t8808 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-port" to i64), ptr %t8808
  %t8810 = or i64 %t8809, 4
  %t8811 = call i64 @rt_root(i64 %t8810)
  store i64 %t8811, ptr @"scheme.base:close-port"
  ret i64 17
}

define i64 @"scheme.base:__init_213"() {
entry:
  %t8834 = call ptr @rt_alloc_words(i64 1)
  %t8835 = ptrtoint ptr %t8834 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-input-port" to i64), ptr %t8834
  %t8836 = or i64 %t8835, 4
  %t8837 = call i64 @rt_root(i64 %t8836)
  store i64 %t8837, ptr @"scheme.base:close-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_214"() {
entry:
  %t8860 = call ptr @rt_alloc_words(i64 1)
  %t8861 = ptrtoint ptr %t8860 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:close-output-port" to i64), ptr %t8860
  %t8862 = or i64 %t8861, 4
  %t8863 = call i64 @rt_root(i64 %t8862)
  store i64 %t8863, ptr @"scheme.base:close-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_215"() {
entry:
  %t8864 = call i64 @rt_root(i64 1)
  store i64 %t8864, ptr @"scheme.base:%stdout-port"
  ret i64 17
}

define i64 @"scheme.base:__init_216"() {
entry:
  %t8865 = call i64 @rt_root(i64 1)
  store i64 %t8865, ptr @"scheme.base:%stderr-port"
  ret i64 17
}

define i64 @"scheme.base:__init_217"() {
entry:
  %t8866 = call i64 @rt_root(i64 1)
  store i64 %t8866, ptr @"scheme.base:%stdin-port"
  ret i64 17
}

define i64 @"scheme.base:__init_218"() {
entry:
  %t8910 = call ptr @rt_alloc_words(i64 1)
  %t8911 = ptrtoint ptr %t8910 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-output-port" to i64), ptr %t8910
  %t8912 = or i64 %t8911, 4
  %t8913 = call i64 @rt_root(i64 %t8912)
  store i64 %t8913, ptr @"scheme.base:current-output-port"
  ret i64 17
}

define i64 @"scheme.base:__init_219"() {
entry:
  %t8951 = call ptr @rt_alloc_words(i64 1)
  %t8952 = ptrtoint ptr %t8951 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-error-port" to i64), ptr %t8951
  %t8953 = or i64 %t8952, 4
  %t8954 = call i64 @rt_root(i64 %t8953)
  store i64 %t8954, ptr @"scheme.base:current-error-port"
  ret i64 17
}

define i64 @"scheme.base:__init_220"() {
entry:
  %t8992 = call ptr @rt_alloc_words(i64 1)
  %t8993 = ptrtoint ptr %t8992 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:current-input-port" to i64), ptr %t8992
  %t8994 = or i64 %t8993, 4
  %t8995 = call i64 @rt_root(i64 %t8994)
  store i64 %t8995, ptr @"scheme.base:current-input-port"
  ret i64 17
}

define i64 @"scheme.base:__init_221"() {
entry:
  %t9042 = call ptr @rt_alloc_words(i64 1)
  %t9043 = ptrtoint ptr %t9042 to i64
  store i64 ptrtoint (ptr @"scheme.base:code:call-with-port" to i64), ptr %t9042
  %t9044 = or i64 %t9043, 4
  %t9045 = call i64 @rt_root(i64 %t9044)
  store i64 %t9045, ptr @"scheme.base:call-with-port"
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
  call i64 @"scheme.base:__init_221"()
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

